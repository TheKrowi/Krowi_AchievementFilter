local _, addon = ...
addon.Data.EventSchedules = {}
local eventSchedules = addon.Data.EventSchedules

-- The older expansions' events on the fixed schedules KAF carries (KrowiAF.EventSchedules, DataAddons/Retail/*/
-- EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules). The current expansion's events come from Blizzard's
-- event scheduler instead (Data/EventScheduler.lua), and move here when their expansion ends.
-- A family is a cycle (Interval, or the weekly reset for Reset = "Weekly" / "HalfWeekly") with a start per region
-- (Anchors, by GetCurrentRegion(); Anchor for the regions it does not name), and the window each of its events is
-- shown in, relative to a cycle's start
-- (Windows, or one Window for every id of a Rotation, whose zone moves one step per cycle). Where the addon ships no
-- start for the player's region, or the game shows another one, the start the watcher learned from the POIs is used
-- (Data/EventObserver.lua). A lookup is arithmetic: no POI or widget read, no allocation.

local week, halfWeek = 604800, 302400

-- What the schedules read from the game. The schedules suite swaps in a model of it (Tests/Schedules.lua,
-- UseSourceForTest), so its fixed times and regions reach the schedules in game as headlessly.
local game = {
    Region = function() return GetCurrentRegion() end,
    SecondsUntilWeeklyReset = function() return C_DateAndTime.GetSecondsUntilWeeklyReset() end,
    Learned = function(key, region) return addon.Data.EventObserver.GetLearned(key, region) end,
    QuestDone = function(questId) return C_QuestLog.IsQuestFlaggedCompleted(questId) end,
}
local source = game

local byEvent -- [eventId] = {Family, From, To, Turn}: the fixed families' events, gathered on first use

local function Index()
    if byEvent then
        return byEvent
    end
    byEvent = {}
    for key, family in next, KrowiAF.EventSchedules do
        family.Key = key
        if family.Fixed then
            for turn, id in ipairs(family.Rotation or {}) do
                byEvent[id] = {Family = family, From = family.Window[1], To = family.Window[2], Turn = turn}
            end
            for id, window in next, family.Windows or {} do
                byEvent[id] = {Family = family, From = window[1], To = window[2]}
            end
        end
    end
    return byEvent
end

function eventSchedules.GetInterval(family)
    if family.Reset == "Weekly" then
        return week
    elseif family.Reset == "HalfWeekly" then
        return halfWeek
    end
    return family.Interval
end

-- What a start learned for the family depends on: its cycle, rotation and windows. A start learned under another one
-- (a later release corrected the schedule) is not used (Data/EventObserver.lua GetLearned). Made once per family.
function eventSchedules.GetDefinition(family)
    if family.Definition then
        return family.Definition
    end
    local parts = {tostring(eventSchedules.GetInterval(family))}
    for _, id in ipairs(family.Rotation or {}) do
        tinsert(parts, tostring(id))
    end
    if family.Window then
        tinsert(parts, family.Window[1] .. ":" .. family.Window[2])
    end
    local ids = {}
    for id in next, family.Windows or {} do
        tinsert(ids, id)
    end
    sort(ids)
    for _, id in ipairs(ids) do
        tinsert(parts, id .. "=" .. family.Windows[id][1] .. ":" .. family.Windows[id][2])
    end
    family.Definition = table.concat(parts, ",")
    return family.Definition
end

-- The start the addon ships for the region: the region's own, else the one for every region (Anchor)
function eventSchedules.GetShippedAnchor(family, region)
    return family.Anchors and family.Anchors[region] or family.Anchor
end

-- The start of the cycle now is in, and the interval; nothing without a start for the region
local function CycleStart(family, region, now)
    local interval = eventSchedules.GetInterval(family)
    local anchor
    if family.Reset then
        local untilReset = source.SecondsUntilWeeklyReset()
        if not untilReset then
            return
        end
        anchor = now + untilReset - week
    else
        local learned = source.Learned(family.Key, region)
        anchor = learned and learned.Anchor or eventSchedules.GetShippedAnchor(family, region)
    end
    if not anchor then
        return
    end
    return now - (now - anchor) % interval, interval
end

-- A Rotation[1] start: learned, or shipped (RotationAnchors, else the Anchors, which then name Rotation[1] starts)
local function RotationAnchor(family, region)
    local learned = source.Learned(family.Key, region)
    if learned and learned.RotationAnchor then
        return learned.RotationAnchor
    end
    local anchors = family.RotationAnchors or family.Anchors
    return anchors and anchors[region]
end

local function IsTurn(entry, region, cycleStart, interval)
    if not entry.Turn then
        return true
    end
    local rotationAnchor = RotationAnchor(entry.Family, region)
    if not rotationAnchor then
        return false
    end
    local turn = math.floor((cycleStart - rotationAnchor) / interval + 0.5) % #entry.Family.Rotation + 1
    return turn == entry.Turn
end

-- The start and end of the event's window going on at now, or nothing: not a fixed event, not its window, not its
-- turn in the rotation, no start known for the player's region, or a quest the character has not done (Requires: the
-- Maw's covenant assaults need Chains of Domination chapter 2)
function eventSchedules.GetWindow(eventId, now)
    local entry = Index()[eventId]
    if not entry or (entry.Family.Requires and not source.QuestDone(entry.Family.Requires)) then
        return
    end
    local region = source.Region()
    local cycleStart, interval = CycleStart(entry.Family, region, now)
    if not cycleStart then
        return
    end
    for step = 0, 1 do -- a window before its cycle's start (Next, Gathering) belongs to the next cycle
        local start = cycleStart + step * interval
        if now >= start + entry.From and now < start + entry.To then
            if IsTurn(entry, region, start, interval) then
                return start + entry.From, start + entry.To
            end
            return
        end
    end
end

-- For the schedules suite: a model of the game in place of the game, nil for the game again
function eventSchedules.UseSourceForTest(model)
    source = model or game
end