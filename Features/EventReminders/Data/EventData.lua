local _, addon = ...
addon.EventReminders.EventData = {}
local eventData = addon.EventReminders.EventData

-- The events going on now and the holidays coming up, for the reminders: the pop-ups, the chat lines and the side
-- buttons (docs/work/2026-11-12-event-reminders moved them here from Data/EventData.lua). Each event's times come from
-- its source (.claude/rules/events.md): the calendar, Blizzard's event scheduler, KAF's fixed schedules, or its POI and
-- widget. The holidays' times are the core's calendar cache (addon.EventData, Data/EventData.lua), read at call time:
-- it loads after the feature's files.

local function GetOrCreateEventDetails(event)
    event._EventDetails = event._EventDetails or {}
    return event._EventDetails
end

local stopCalendarEventsRefresh
function eventData.LoadBlizzard_Calendar()
    hooksecurefunc(CalendarFrame, "Show", function()
        stopCalendarEventsRefresh = true
    end)
    hooksecurefunc(CalendarFrame, "Hide", function()
        stopCalendarEventsRefresh = nil
    end)
end

local upcomingCalendarEvents = {}
function eventData.GetUpcomingCalendarEvents()
    if stopCalendarEventsRefresh or next(upcomingCalendarEvents) then
        return upcomingCalendarEvents
    end

    local currentTime = GetServerTime() -- the calendar's times are true UTC seconds, which the realm's clock counts
    local nDaysFromNow = currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60)
    local calendarEvents = addon.Data.Events[KrowiAF.Enum.EventType.Calendar]
    for _, event in next, calendarEvents do
        event.UpcomingEventDetails = nil
        if addon.Options.db.profile.EventReminders.CalendarEvents[event.Id] then
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
            if occurrence and occurrence.StartTime and occurrence.StartTime > currentTime and occurrence.StartTime <= nDaysFromNow then
                event.UpcomingEventDetails = occurrence
                tinsert(upcomingCalendarEvents, event)
            end
        end
    end

    return upcomingCalendarEvents
end

local activeEvents

local function GetActiveCalendarEvents()
    if stopCalendarEventsRefresh then
        return
    end

    local currentTime = GetServerTime()
    local calendarEvents = addon.Data.Events[KrowiAF.Enum.EventType.Calendar]

    for _, event in next, calendarEvents do
        event.EventDetails = nil
        if addon.Options.db.profile.EventReminders.CalendarEvents[event.Id] then
            local occurrence = addon.EventData.GetNextEventOccurance(event.Id)
            if occurrence and occurrence.StartTime and occurrence.EndTime then
                local eventHasStarted = occurrence.StartTime <= currentTime
                local eventHasEnded = occurrence.EndTime <= currentTime
                if eventHasStarted and not eventHasEnded then
                    event.EventDetails = occurrence
                    tinsert(activeEvents, event)
                end
            end
        end
    end
end

-- An event on one of KAF's fixed schedules: its window going on now, with no POI or widget read
local function GetFixedScheduleEventDetails(event, now)
    local startTime, endTime = addon.EventReminders.EventSchedules.GetWindow(event.Id, now)
    if not startTime then -- The event is not active
        event.EventDetails = nil
        return
    end
    local details = GetOrCreateEventDetails(event)
    details.StartTime = startTime
    details.EndTime = endTime
    details.Name = event.Name
    return details
end

-- now: the server time to read the event at, GetServerTime() unless a test gives one (Tests/Events.lua, Tests/Schedules.lua)
function eventData.GetWidgetEventDetails(event, now)
    if not addon.Options.db.profile.EventReminders.WidgetEvents[event.Id] then
        event.EventDetails = nil
        return
    end

    now = now or GetServerTime()
    if event.Source == KrowiAF.Enum.EventSource.FixedSchedule then
        return GetFixedScheduleEventDetails(event, now)
    end
    local secondsLeft = addon.EventReminders.CustomWidgetEventTimers.GetSecondsLeft(event.Id, now)
    if not secondsLeft then -- The event is not available or not active
        event.EventDetails = nil
        return
    end

    local endTime
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        endTime = now + secondsLeft
    end

    local details = GetOrCreateEventDetails(event)
    details.EndTime = endTime
    details.Name = event.Name
    return details
end

local function GetActiveWidgetEvents()
    for _, event in next, addon.Data.Events[KrowiAF.Enum.EventType.Widget] do
        event.EventDetails = eventData.GetWidgetEventDetails(event)
        if event.EventDetails then
            activeEvents[#activeEvents + 1] = event
        end
    end
end

-- A world event is active while its POI is on its map and it reports time left. The POI is asked on every refresh: an
-- event sharing its widget with its siblings (the four Dreamsurges, the five Theater Troupe shows, Titan Lockdown and
-- Zaqali Ruin) is told apart from them only by its POI (docs/work/2026-10-18-memory-growth), so a POI that reports
-- seconds left does not count without its map: two siblings would both pass. Researchers Under Fire's and the
-- Dreamsurges' POIs are not on the maps their rows give (/kaftest sources, 2026-10-21), which the probe now finds.
local function IsPoiOnMap(event)
    return C_AreaPoiInfo.GetAreaPOIInfo(event.MapId, event.Id) ~= nil
end

-- An event from Blizzard's event scheduler: its occurrence going on now and the game's name, with no POI read
local function GetSchedulerEventDetails(event, now)
    local scheduler = addon.EventReminders.EventScheduler
    local startTime, endTime = scheduler.GetOccurrence(event.Id, now)
    if not startTime then -- The event is not active
        event.EventDetails = nil
        return
    end
    local details = GetOrCreateEventDetails(event)
    details.StartTime = startTime
    details.EndTime = endTime
    details.Name = scheduler.GetName(event.Id) or event.Name
    return details
end

-- now: the server time to read the event at, GetServerTime() unless a test gives one (Tests/Events.lua)
function eventData.GetWorldEventDetails(event, now)
    if not addon.Options.db.profile.EventReminders.WorldEvents[event.Id] then
        event.EventDetails = nil
        return
    end

    now = now or GetServerTime()
    if event.Source == KrowiAF.Enum.EventSource.Scheduler then
        return GetSchedulerEventDetails(event, now)
    elseif event.Source == KrowiAF.Enum.EventSource.FixedSchedule then
        return GetFixedScheduleEventDetails(event, now)
    end

    local timers = addon.EventReminders.CustomWorldEventTimers
    local secondsLeft
    if timers.HasCustomTimer(event.Id) then
        -- The POI first: an absent one returns nothing and allocates nothing, while the widget returns a new table on
        -- every read, also for the events whose POI is not there (Theater Troupe's widget is there everywhere)
        if not IsPoiOnMap(event) then -- The event is not active
            return
        end
        secondsLeft = timers.GetSecondsLeft(event.Id)
        if not secondsLeft then -- The event is not active
            event.EventDetails = nil
            return
        end
    else
        -- The seconds left first: a number, and nothing for an event that is not running
        secondsLeft = timers.GetSecondsLeft(event.Id)
        if not secondsLeft then -- The event is not active
            event.EventDetails = nil
            return
        end
        if not IsPoiOnMap(event) then -- The event is not active
            return
        end
    end
    if secondsLeft < 0 then -- A POI past its end is not active either (docs/work/2026-10-28-active-events-chat-repeat)
        event.EventDetails = nil
        return
    end

    local endTime
    if secondsLeft > 0 then -- 0: active with no time data
        endTime = now + secondsLeft
    end

    local details = GetOrCreateEventDetails(event)
    details.EndTime = endTime
    details.Name = event.Name
    return details
end

local function GetActiveWorldEvents()
    for _, event in next, addon.Data.Events[KrowiAF.Enum.EventType.World] do
        event.EventDetails = eventData.GetWorldEventDetails(event)
        if event.EventDetails then
            activeEvents[#activeEvents + 1] = event
        end
    end
end

function eventData.GetActiveEvents(refresh)
    if stopCalendarEventsRefresh then
        return activeEvents or {}
    end

    if activeEvents ~= nil and not refresh then
        return activeEvents
    end

    activeEvents = activeEvents or {}
    wipe(activeEvents)

    GetActiveCalendarEvents()
    GetActiveWidgetEvents()
    GetActiveWorldEvents()

    return activeEvents
end