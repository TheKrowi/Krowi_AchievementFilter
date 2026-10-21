local _, addon = ...

-- Where the older expansions' world and widget events get their times today, read from wherever the player stands
-- (docs/work/2026-10-21-fixed-event-schedules). Game only and all observations, no scenarios: Read-GameTests.ps1 prints
-- them. It reads the POI and widget APIs and the reminders' own event details, as a refresh does, and changes nothing.
-- Run it outside the events' zones (a capital) to see what a player there gets today, and in an event's zone to compare.
-- Per world event: the seconds left the POI API reports from here, whether the POI is on the event's map, whether a
-- widget times it, and what the reminders get. Per widget event: what the reminders get. A world event with nothing to
-- report is counted, not listed. The events from Blizzard's event scheduler (Midnight) are not this probe's subject.

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
                tinsert(observations, ("world %d %q, map %s: POI seconds left %s, POI on its map %s, timed by %s; reminders get %s"):format(id, tostring(event.Name),
                    tostring(event.MapId), tostring(secondsLeft), tostring(onMap), addon.Data.CustomWorldEventTimers.HasCustomTimer(id) and "a widget" or "the POI",
                    RemindersGet(details, eventReminders.WorldEvents[id])))
            else
                quiet = quiet + 1
            end
        end
    end
    tinsert(observations, ("world: %d more events with no POI time, no POI on their map and nothing for the reminders"):format(quiet))
end

local function ObserveWidgetEvents(observations)
    local eventReminders = addon.Options.db.profile.EventReminders
    local events = addon.Data.Events[KrowiAF.Enum.EventType.Widget]
    for _, id in ipairs(SortedIds(events)) do
        local event = events[id]
        local details = addon.EventData.GetWidgetEventDetails(event)
        tinsert(observations, ("widget %d %q: timed by %s; reminders get %s"):format(id, tostring(event.Name),
            addon.Data.CustomWidgetEventTimers.IsComputed(id) and "a schedule" or "its widget", RemindersGet(details, eventReminders.WidgetEvents[id])))
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
    return {}, observations
end