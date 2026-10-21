local _, addon = ...
addon.Data.EventObserver = {}
local eventObserver = addon.Data.EventObserver

-- What the addon learns from the POIs it sees (docs/work/2026-10-21-fixed-event-schedules): every 300 s it reads the
-- seconds left of the POIs of the families marked Observe in KrowiAF.EventSchedules, a number per POI. When one appears,
-- the start of its cycle (now plus its seconds left minus its window's end) goes into the account's saved data, per
-- region (KrowiAF_SavedData.EventObservations). Two starts of a family a whole number of cycles apart, to within 120 s,
-- confirm the region's start (and, in a rotation, where it stands), which Data/EventSchedules.lua then uses where the
-- addon ships none for the region or the game disagrees with the one it ships. In debug mode every new finding prints in
-- chat; for families KAF does not run on a schedule yet, the order they came in prints too, for the maintainer. A run in
-- which no POI appeared or went allocates nothing (Tests/Memory.lua).

local runEvery = 300
local keep = 64 -- observations kept per family and region
local tolerance = 120 -- seconds two starts may differ by and still agree

-- What the watcher reads from the game. The schedules suite swaps in a model of it, and of the saved data
-- (Tests/Schedules.lua, UseSourceForTest).
local game = {
    Region = function() return GetCurrentRegion() end,
    Now = function() return GetServerTime() end,
    SecondsLeft = function(areaPoiId) return C_AreaPoiInfo.GetAreaPOISecondsLeft(areaPoiId) end,
    PoiInfo = function(mapId, areaPoiId) return C_AreaPoiInfo.GetAreaPOIInfo(mapId, areaPoiId) end,
    Debug = function() return addon.Diagnostics.DebugEnabled() end,
    Report = function(message) addon.Diagnostics.Debug(message, true) end,
}
local source = game
local store -- KrowiAF_SavedData.EventObservations, or a test's model of it
local present = {} -- [areaPoiID] = true while its POI is up
local watched -- {Family, Id, From, To, MapId} per watched POI, gathered once the event data is loaded
local ticker

local function Store()
    if not store then
        KrowiAF_SavedData.EventObservations = KrowiAF_SavedData.EventObservations or {}
        store = KrowiAF_SavedData.EventObservations
    end
    return store
end

local function Watched()
    if watched then
        return watched
    end
    if not addon.Data.EventsLoaded then
        return
    end
    watched = {}
    local worldEvents = addon.Data.Events[KrowiAF.Enum.EventType.World] or {}
    local ids = {} -- an id in a family's Windows and its Variants (Legion's 5175) is watched once
    local function Watch(family, id, window)
        if ids[id] then
            return
        end
        ids[id] = true
        local event = worldEvents[id]
        tinsert(watched, {Family = family, Id = id, From = window[1], To = window[2], MapId = family.MapId or (event and event.MapId)})
    end
    for key, family in next, KrowiAF.EventSchedules do
        family.Key = key
        if family.Observe then
            for _, id in ipairs(family.Rotation or family.Variants or {}) do
                Watch(family, id, family.Window)
            end
            for id, window in next, family.Windows or {} do
                Watch(family, id, window)
            end
        end
    end
    return watched
end

local function Entry(region, key)
    local regions = Store()
    regions[region] = regions[region] or {}
    local entry = regions[region][key]
    if not entry then
        entry = {Seen = {}}
        regions[region][key] = entry
    end
    return entry
end

local function TurnOf(family, id)
    for turn, rotationId in ipairs(family.Rotation or {}) do
        if rotationId == id then
            return turn
        end
    end
end

local function Utc(t)
    return date("!%Y-%m-%d %H:%M", t) .. " UTC"
end

local function NameOf(id)
    local event = addon.Data.Events[KrowiAF.Enum.EventType.World][id]
    return event and event.Name or tostring(id)
end

-- Two starts agree when they are a whole number of cycles apart, and, in a rotation, the ids are that many turns apart
local function Agrees(family, interval, earlier, later)
    local cycles = math.floor((later.Start - earlier.Start) / interval + 0.5)
    if cycles < 1 or math.abs(later.Start - earlier.Start - cycles * interval) > tolerance then
        return false
    end
    if family.Rotation then
        local earlierTurn, laterTurn = TurnOf(family, earlier.Id), TurnOf(family, later.Id)
        return (earlierTurn - 1 + cycles) % #family.Rotation + 1 == laterTurn
    end
    return true
end

-- difference brought into (-period / 2, period / 2]
local function Circular(difference, period)
    local d = difference % period
    return d > period / 2 and d - period or d
end

-- The learned start's offset from the shipped one, within a cycle (a whole rotation for a rotating family); nil when
-- the addon ships none for the region
local function OffsetFromShipped(family, region, entry, interval)
    if family.Rotation then
        local shipped = (family.RotationAnchors or family.Anchors or {})[region]
        return shipped and Circular(entry.RotationAnchor - shipped, interval * #family.Rotation)
    end
    local shipped = family.Anchors and family.Anchors[region]
    return shipped and Circular(entry.Anchor - shipped, interval)
end

local function Confirm(family, entry, region, observation, interval)
    local anchor = observation.Start
    local rotationAnchor = family.Rotation and anchor - (TurnOf(family, observation.Id) - 1) * interval or nil
    local changed = not entry.Anchor or math.abs(Circular(anchor - entry.Anchor, interval)) > tolerance
    if not changed and family.Rotation then
        changed = not entry.RotationAnchor or math.abs(Circular(rotationAnchor - entry.RotationAnchor, interval * #family.Rotation)) > tolerance
    end
    entry.Anchor, entry.RotationAnchor = anchor, rotationAnchor
    if not changed then
        return
    end
    local offset = OffsetFromShipped(family, region, entry, interval)
    if offset and math.abs(offset) > tolerance then
        source.Report(("Event schedules: %s: the game started %s at %s, %d s off the addon's schedule; the game's time is used from now on"):format(
            family.Name or family.Key, NameOf(observation.Id), Utc(observation.Start), offset))
    elseif offset then
        source.Report(("Event schedules: %s: the game confirms the addon's schedule (%s at %s)"):format(family.Name or family.Key, NameOf(observation.Id), Utc(observation.Start)))
    else
        source.Report(("Event schedules: %s learned for this region: %s at %s"):format(family.Name or family.Key, NameOf(observation.Id), Utc(observation.Start)))
    end
end

local function Observe(item, now, secondsLeft)
    local family = item.Family
    local region = source.Region()
    local entry = Entry(region, family.Key)
    local seen = entry.Seen
    local observation = {Start = secondsLeft and now + secondsLeft - item.To or now - item.From, Id = item.Id}
    local previous = seen[#seen]
    if #seen >= keep then
        tremove(seen, 1)
    end
    tinsert(seen, observation)
    if not family.Fixed and source.Debug() then
        source.Report(("Event schedules: %s: %s at %s%s"):format(family.Name or family.Key, NameOf(observation.Id), Utc(observation.Start),
            previous and (", after " .. NameOf(previous.Id) .. " at " .. Utc(previous.Start)) or ""))
    end
    if not secondsLeft then
        return -- a start seen to within one run only; kept for the order, not used for a start
    end
    local interval = addon.Data.EventSchedules.GetInterval(family)
    for i = #seen - 1, 1, -1 do
        if Agrees(family, interval, seen[i], observation) then
            Confirm(family, entry, region, observation, interval)
            return
        end
    end
end

-- One look at every watched POI: a POI that appeared is observed; one that went is forgotten until it is back
function eventObserver.RunOnce()
    local items = Watched()
    if not items then
        return
    end
    local now = source.Now()
    local debug = source.Debug()
    for i = 1, #items do
        local item = items[i]
        local secondsLeft = source.SecondsLeft(item.Id)
        local up = secondsLeft ~= nil
        if not up and item.Family.ByInfo and debug then
            up = source.PoiInfo(item.MapId, item.Id) ~= nil -- a POI that reports no time (the storms), in debug mode only
        end
        if up and not present[item.Id] then
            present[item.Id] = true
            Observe(item, now, secondsLeft)
        elseif not up and present[item.Id] then
            present[item.Id] = nil
        end
    end
end

-- The confirmed start of a family in a region, for Data/EventSchedules.lua: {Anchor, RotationAnchor}, or nil
function eventObserver.GetLearned(key, region)
    local regions = store or (KrowiAF_SavedData and KrowiAF_SavedData.EventObservations)
    local entry = regions and regions[region] and regions[region][key]
    if entry and entry.Anchor then
        return entry
    end
end

-- At login: Retail only, with event reminders on; once a session
function eventObserver.Start()
    if ticker or not addon.Util.IsMainline or not addon.Options.db.profile.EventReminders.Enabled then
        return
    end
    ticker = C_Timer.NewTicker(runEvery, eventObserver.RunOnce)
    eventObserver.RunOnce()
end

-- [[ For the suites ]] --

-- A model of the game and of the saved data in place of them (Tests/Schedules.lua), nil for the game again; the game's
-- record of which POIs are up is kept aside while a model runs
local gamePresent
function eventObserver.UseSourceForTest(model, modelStore)
    if model then
        if source == game then
            gamePresent = present
        end
        source, store, present = model, modelStore, {}
    else
        source, store, present = game, nil, gamePresent or present
        gamePresent = nil
    end
end

function eventObserver.GetObservationsForTest(modelStore, region, key)
    local entry = modelStore[region] and modelStore[region][key]
    return entry and entry.Seen
end