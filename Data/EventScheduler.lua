local _, addon = ...
addon.Data.EventScheduler = {}
local eventScheduler = addon.Data.EventScheduler

-- The times of the World events whose source is Blizzard's event scheduler (KrowiAF.Enum.EventSource.Scheduler), read
-- from C_EventScheduler (docs/work/2026-10-21-event-scheduler). One GetScheduledEvents read returns about three days of
-- occurrences, a few hundred, each a new table, so it is read once after login and again only when the times kept here
-- run low; a refresh looks the times up here and allocates nothing (Tests/Memory.lua).
-- Reading the scheduler never fired EVENT_SCHEDULER_UPDATE inside the addon's own call (Tests/Scheduler.lua, Retail
-- 12.1.5, 2026-10-21), which would run Blizzard's always-listening reminder manager tainted; still, nothing is read or
-- asked for in combat or while the world map, whose Events tab listens to the same event, is shown.

local lowWater = 6 * 3600 -- ask for more when a watched event has less than this left in its kept times
local requestEvery = 300 -- at most one request for more in this many seconds
local quietAfterShortRead = 3600 -- after a read that still leaves an event short (the game stopped listing it), ask again only after this

-- What the cache reads from the game. The events suite swaps in a model of it (Tests/Events.lua, UseSourceForTest), so
-- the read logic runs the same steps in game and headlessly; these functions are made once, at load.
local game = {
    Available = function() return C_EventScheduler ~= nil end,
    HasData = function() return C_EventScheduler.HasData() end,
    GetScheduledEvents = function() return C_EventScheduler.GetScheduledEvents() end,
    RequestEvents = function() C_EventScheduler.RequestEvents() end,
    InCombat = function() return InCombatLockdown() end,
    MapShown = function() return WorldMapFrame and WorldMapFrame:IsShown() end,
    Now = function() return GetServerTime() end,
    PoiName = function(areaPoiId)
        local poi = C_AreaPoiInfo.GetAreaPOIInfo(nil, areaPoiId)
        return poi and poi.name
    end,
    Report = function(message) addon.Diagnostics.Debug(message, true) end,
}
local source = game

local watched -- [areaPoiID] = true for each scheduler event, gathered once the data load has made them
local starts, ends, cursors, names = {}, {}, {}, {} -- [areaPoiID]: occurrences sorted by start, the first one not ended yet at the last lookup, the game's name
local seenKeys = {} -- eventKey = true: the game lists some occurrences twice under one key
local pendingSince -- when the addon asked for data; its answer is read on EVENT_SCHEDULER_UPDATE until requestEvery has passed
local lastAttempt, quietUntil
local inSchedulerCall -- an addon call into C_EventScheduler is running
local stopped -- EVENT_SCHEDULER_UPDATE fired inside such a call, so the scheduler is left alone for the session
local testing -- the events suite has its fixture in the cache; nothing refills it until Reset
local listener = CreateFrame("Frame")

local function Watched()
    if watched then
        return watched
    end
    if not addon.Data.IsLoaded then
        return
    end
    watched = {}
    for id, event in next, addon.Data.Events[KrowiAF.Enum.EventType.World] do
        if event.Source == KrowiAF.Enum.EventSource.Scheduler then
            watched[id] = true
            starts[id], ends[id], cursors[id] = {}, {}, 1
        end
    end
    return watched
end

-- Keeps the occurrences sorted by start: they arrive nearly sorted, so this moves almost nothing
local function Insert(areaPoiId, startTime, endTime)
    local s, e = starts[areaPoiId], ends[areaPoiId]
    local i = #s + 1
    while i > 1 and s[i - 1] > startTime do
        s[i], e[i] = s[i - 1], e[i - 1]
        i = i - 1
    end
    s[i], e[i] = startTime, endTime
end

-- Replaces the kept times with those of scheduledEvents, in the shape of C_EventScheduler.GetScheduledEvents; returns
-- how many occurrences it kept
function eventScheduler.Fill(scheduledEvents)
    local watching = Watched()
    if not watching then
        return 0
    end
    wipe(seenKeys)
    for areaPoiId in next, watching do
        wipe(starts[areaPoiId])
        wipe(ends[areaPoiId])
        cursors[areaPoiId] = 1
    end
    local kept = 0
    for _, info in ipairs(scheduledEvents) do
        local areaPoiId = info.areaPoiID
        if watching[areaPoiId] and not seenKeys[info.eventKey] then
            seenKeys[info.eventKey] = true
            Insert(areaPoiId, info.startTime, info.endTime)
            kept = kept + 1
        end
    end
    return kept
end

local function CanAsk()
    return source.Available() and not stopped and not testing and not source.InCombat() and not source.MapShown()
end

local function WaitForCombat()
    listener:RegisterEvent("PLAYER_REGEN_ENABLED")
end

local function IsShort(areaPoiId, now)
    local last = starts[areaPoiId][#starts[areaPoiId]]
    return not last or last < now + lowWater
end

local function IsPending(now)
    return pendingSince and now - pendingSince < requestEvery
end

-- Every call into C_EventScheduler goes through here, so an EVENT_SCHEDULER_UPDATE fired inside it is seen (OnEvent)
local function CallScheduler(func)
    inSchedulerCall = true
    local ok, result = pcall(func)
    inSchedulerCall = nil
    return ok and result or nil
end

local function Read(now)
    local scheduled = CallScheduler(source.GetScheduledEvents)
    if not scheduled then
        return false
    end
    eventScheduler.Fill(scheduled)
    for areaPoiId in next, watched do
        if IsShort(areaPoiId, now) then
            quietUntil = now + quietAfterShortRead
            break
        end
    end
    return true
end

-- Reads what the scheduler has, or asks it for data when it has none; at most once in requestEvery seconds, and not
-- at all for an hour after a read that left an event short
local function Refill(now)
    if not CanAsk() or (lastAttempt and now - lastAttempt < requestEvery) or (quietUntil and now < quietUntil) then
        return
    end
    lastAttempt = now
    if CallScheduler(source.HasData) and Read(now) then
        return
    end
    pendingSince = now
    CallScheduler(source.RequestEvents)
end

-- At login, after combat and when a lookup finds the kept times running low
function eventScheduler.EnsureData()
    local watching = Watched()
    if not watching or not next(watching) or not source.Available() or stopped then
        return
    end
    listener:RegisterEvent("EVENT_SCHEDULER_UPDATE")
    if source.InCombat() then
        WaitForCombat()
        return
    end
    Refill(source.Now()) -- with the world map open it does nothing; the next lookup that finds the times short asks again
end

-- Only the answer to a request of the addon's own is read; any other update returns at once and allocates nothing
function eventScheduler.OnSchedulerUpdate()
    local now = source.Now()
    if not IsPending(now) then
        return
    end
    if source.InCombat() then
        WaitForCombat()
        return
    end
    if not CanAsk() then
        return -- stays pending until requestEvery has passed; after that a lookup asks again
    end
    pendingSince = nil
    Read(now)
end

local function OnEvent(_, event)
    if event == "EVENT_SCHEDULER_UPDATE" then
        if inSchedulerCall then
            -- Fired inside the addon's own call: Blizzard's reminder manager, which handles it too, ran on the addon's
            -- stack. Never seen (Tests/Scheduler.lua), so the scheduler is left alone for the rest of the session.
            stopped = true
            source.Report("Event scheduler: EVENT_SCHEDULER_UPDATE fired inside the addon's own call; the scheduler is not read again this session")
            return
        end
        eventScheduler.OnSchedulerUpdate()
    elseif event == "PLAYER_REGEN_ENABLED" then
        listener:UnregisterEvent("PLAYER_REGEN_ENABLED")
        if IsPending(source.Now()) then
            eventScheduler.OnSchedulerUpdate()
        else
            eventScheduler.EnsureData()
        end
    end
end
listener:SetScript("OnEvent", OnEvent)

-- The occurrence of the event going on at now: its start and end, or nothing. The cursor moves forward with time and
-- starts again from the first occurrence when now is before it (a test, the clock set back).
function eventScheduler.GetOccurrence(areaPoiId, now)
    local s, e = starts[areaPoiId], ends[areaPoiId]
    if not s then
        if watched then
            return -- not a scheduler event
        end
        eventScheduler.EnsureData() -- the data load had not finished when the login asked
        s, e = starts[areaPoiId], ends[areaPoiId]
        if not s then
            return
        end
    end
    local i = cursors[areaPoiId]
    if i > 1 and e[i - 1] and e[i - 1] > now then
        i = 1
    end
    while e[i] and e[i] <= now do
        i = i + 1
    end
    cursors[areaPoiId] = i
    if IsShort(areaPoiId, now) and not IsPending(now) then
        Refill(now)
    end
    if s[i] and s[i] <= now then
        return s[i], e[i]
    end
end

-- The game's name for the event's area POI, read once
function eventScheduler.GetName(areaPoiId)
    local name = names[areaPoiId]
    if name == nil then
        name = source.PoiName(areaPoiId) or false
        names[areaPoiId] = name
    end
    return name or nil
end

function eventScheduler.CountOccurrences(areaPoiId)
    return starts[areaPoiId] and #starts[areaPoiId] or 0
end

-- [[ For the suites ]] --

-- The events suite (Tests/Events.lua): a fixture in place of the scheduler's data, and the way back to the real one
function eventScheduler.LoadForTest(scheduledEvents)
    testing = true
    return eventScheduler.Fill(scheduledEvents)
end

-- Keeps stopped: a session that saw the scheduler fire inside the addon's call does not read it again
function eventScheduler.Reset()
    wipe(seenKeys)
    for areaPoiId in next, watched or {} do
        wipe(starts[areaPoiId])
        wipe(ends[areaPoiId])
        cursors[areaPoiId] = 1
    end
    pendingSince, lastAttempt, quietUntil, testing = nil, nil, nil, nil
    listener:UnregisterEvent("PLAYER_REGEN_ENABLED")
end

-- The events suite's scheduler stories: a model of the game in place of the game, nil for the game again. Either way the
-- cache starts empty and unasked; the game's stopped is kept aside while a model runs.
local gameStopped
function eventScheduler.UseSourceForTest(model)
    if source == game then
        gameStopped = stopped
    end
    source = model or game
    if source == game then
        stopped = gameStopped
    else
        stopped = nil
    end
    wipe(names)
    eventScheduler.Reset()
end

-- An event as the listener gets it, for the stories' model to fire
function eventScheduler.HandleEventForTest(event)
    OnEvent(listener, event)
end

-- The memory suite (Tests/Memory.lua): one read as the login makes it, under the same guards; false when the scheduler
-- cannot be asked now (combat, the world map open)
function eventScheduler.ReadForTest()
    if not Watched() or not CanAsk() then
        return false
    end
    return Read(source.Now())
end