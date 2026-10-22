local _, addon = ...

-- Where the older expansions' world and widget events get their times today, read from wherever the player stands
-- (docs/work/2026-10-21-fixed-event-schedules). Game only and all observations, no scenarios: Read-GameTests.ps1 prints
-- them. It reads the POI and widget APIs and the reminders' own event details, as a refresh does, and changes nothing.
-- Run it outside the events' zones (a capital) to see what a player there gets today, and in an event's zone to compare.
-- Per world event: the seconds left the POI API reports from here, whether the POI is on the event's map, whether a
-- widget times it, and what the reminders get. Per widget event: what the reminders get. A world event with nothing to
-- report is counted, not listed. The events from Blizzard's event scheduler (Midnight) are not this probe's subject.
-- Per fixed schedule (Data/EventSchedules.lua): what the schedule and the POIs each say is going on, and what the
-- watcher learned for the player's region (Data/EventObserver.lua).

local function Where()
    local mapId = C_Map.GetBestMapForUnit("player")
    local info = mapId and C_Map.GetMapInfo(mapId)
    return ("%s (map %s)"):format(tostring(info and info.name), tostring(mapId))
end

local function SortedIds(events)
    local ids = {}
    for id in next, events or {} do
        tinsert(ids, id)
    end
    sort(ids)
    return ids
end

local function RemindersGet(details, enabled)
    if not enabled then
        return "nothing, its toggle is off"
    end
    if not details then
        return "nothing"
    end
    if not details.EndTime then
        return "the event with no time"
    end
    return ("the event, %d s left"):format(details.EndTime - GetServerTime())
end

-- The map a POI is on when it is not on the one its row gives: the row's continent and every map below it
local function FindPoiMap(event)
    local continent = event.MapId
    local info = continent and C_Map.GetMapInfo(continent)
    while info and info.mapType and info.mapType > Enum.UIMapType.Continent and info.parentMapID and info.parentMapID ~= 0 do
        continent = info.parentMapID
        info = C_Map.GetMapInfo(continent)
    end
    if not continent then
        return "no map to search from"
    end
    if C_AreaPoiInfo.GetAreaPOIInfo(continent, event.Id) then
        return ("found on map %d (%s)"):format(continent, tostring(info and info.name))
    end
    for _, child in ipairs(C_Map.GetMapChildrenInfo(continent, nil, true) or {}) do
        if C_AreaPoiInfo.GetAreaPOIInfo(child.mapID, event.Id) then
            return ("found on map %d (%s)"):format(child.mapID, tostring(child.name))
        end
    end
    return ("on no map of continent %d"):format(continent)
end

local function TimedBy(event, widgetTimed)
    if event.Source == KrowiAF.Enum.EventSource.FixedSchedule then
        return "a fixed schedule"
    end
    return widgetTimed and "a widget" or "the POI"
end

local function ObserveWorldEvents(observations)
    local eventReminders = addon.Options.db.profile.EventReminders
    local events = addon.Data.Events[KrowiAF.Enum.EventType.World]
    local quiet = 0
    for _, id in ipairs(SortedIds(events)) do
        local event = events[id]
        if event.Source ~= KrowiAF.Enum.EventSource.Scheduler then
            local secondsLeft = (C_AreaPoiInfo.GetAreaPOISecondsLeft(id))
            local onMap = C_AreaPoiInfo.GetAreaPOIInfo(event.MapId, id) ~= nil
            local details = addon.EventData.GetWorldEventDetails(event)
            if secondsLeft or onMap or details then
                tinsert(observations, ("world %d %q, map %s: POI seconds left %s, POI on its map %s%s, timed by %s; reminders get %s"):format(id, tostring(event.Name),
                    tostring(event.MapId), tostring(secondsLeft), tostring(onMap), (secondsLeft and not onMap) and (", " .. FindPoiMap(event)) or "",
                    TimedBy(event, addon.Data.CustomWorldEventTimers.HasCustomTimer(id)), RemindersGet(details, eventReminders.WorldEvents[id])))
            else
                quiet = quiet + 1
            end
        end
    end
    tinsert(observations, ("world: %d more events with no POI time, no POI on their map and nothing for the reminders"):format(quiet))
    tinsert(observations, ("Maw unlock: quest 64556 (In Need of Assistance, the end of Chains of Domination chapter 2) %s, quest 64106 (A Unified Effort) %s"):format(
        tostring(C_QuestLog.IsQuestFlaggedCompleted(64556)), tostring(C_QuestLog.IsQuestFlaggedCompleted(64106))))
end

local function ObserveWidgetEvents(observations)
    local eventReminders = addon.Options.db.profile.EventReminders
    local events = addon.Data.Events[KrowiAF.Enum.EventType.Widget]
    for _, id in ipairs(SortedIds(events)) do
        local event = events[id]
        local details = addon.EventData.GetWidgetEventDetails(event)
        local timedBy = event.Source == KrowiAF.Enum.EventSource.FixedSchedule and "a fixed schedule"
            or addon.Data.CustomWidgetEventTimers.IsComputed(id) and "a schedule" or "its widget"
        tinsert(observations, ("widget %d %q: timed by %s; reminders get %s"):format(id, tostring(event.Name), timedBy, RemindersGet(details, eventReminders.WidgetEvents[id])))
    end
end

-- Per schedule (KrowiAF.EventSchedules): what the schedule says is going on, what the POIs say, and what the watcher
-- learned for this region (Data/EventObserver.lua); where the first two differ, the schedule or the game has moved
local function ObserveSchedules(observations)
    local engine, observer = addon.Data.EventSchedules, addon.Data.EventObserver
    if not engine or not KrowiAF.EventSchedules then
        return
    end
    local now, region = GetServerTime(), GetCurrentRegion()
    local regions = KrowiAF_SavedData.EventObservations
    for _, key in ipairs(SortedIds(KrowiAF.EventSchedules)) do
        local family = KrowiAF.EventSchedules[key]
        local ids = {}
        for _, id in ipairs(family.Rotation or family.Variants or {}) do
            tinsert(ids, id)
        end
        for id in next, family.Windows or {} do
            tinsert(ids, id)
        end
        sort(ids)
        local says, pois = {}, {}
        for _, id in ipairs(ids) do
            local _, endTime = engine.GetWindow(id, now)
            if endTime then
                tinsert(says, ("%d until %s"):format(id, date("!%H:%M:%S", endTime)))
            end
            local secondsLeft = (C_AreaPoiInfo.GetAreaPOISecondsLeft(id))
            if secondsLeft then
                tinsert(pois, ("%d until %s"):format(id, date("!%H:%M:%S", now + secondsLeft)))
            end
        end
        local learned = observer.GetLearned(key, region)
        local entry = regions and regions[region] and regions[region][key]
        tinsert(observations, ("schedule %s: %s; POIs: %s; learned: %s, %d seen"):format(key,
            family.Fixed and (#says > 0 and table.concat(says, ", ") or "nothing going on") or "watched only",
            #pois > 0 and table.concat(pois, ", ") or "none up",
            learned and (date("!%Y-%m-%d %H:%M", learned.Anchor) .. " UTC") or "nothing", entry and #entry.Seen or 0))
    end
end

addon.Tests.Ready.sources = function()
    if not addon.Util.IsMainline then
        return false, "Retail only: Classic has no world or widget events"
    end
    if not addon.Data.IsLoaded then
        return false, "the data load has not finished"
    end
    return true
end

addon.Tests.Suites.sources = function()
    local observations = {"standing in " .. Where() .. " at " .. date("!%Y-%m-%d %H:%M:%S", GetServerTime()) .. " UTC"}
    ObserveWorldEvents(observations)
    ObserveWidgetEvents(observations)
    ObserveSchedules(observations)
    return {}, observations
end