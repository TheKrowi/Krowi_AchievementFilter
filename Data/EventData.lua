local _, addon = ...
addon.EventData = {}
local eventData = addon.EventData

local function GetOrCreateEventDetails(event)
    event._EventDetails = event._EventDetails or {}
    return event._EventDetails
end

local utcOffsetSeconds
-- Read on the realm's clock, so the calendar's and the obtainability dates' times are true UTC seconds even on a PC whose
-- clock is set wrong, and compare with GetServerTime() (docs/work/2026-10-28-active-events-chat-repeat)
function KrowiAF_GetUtcOffsetSeconds()
    local now = GetServerTime()
    local utcNow = date("!*t", now)
    local locNow = date("*t", now)
    local utcServerTimeLocal = date("!*t", C_DateAndTime.GetServerTimeLocal())
    local serverUtcOffsetDays = utcServerTimeLocal.yday - utcNow.yday
    local serverUtcOffsetHours = utcServerTimeLocal.hour - utcNow.hour
    local userUtcOffsetDays = locNow.yday - utcNow.yday
    local userUtcOffsetHours = locNow.hour - utcNow.hour
    local utcOffsethours = (serverUtcOffsetDays * 24 + serverUtcOffsetHours) - (userUtcOffsetDays * 24 + userUtcOffsetHours)
    utcOffsetSeconds = utcOffsethours * 3600
    KrowiAF_GetUtcOffsetSeconds = function() -- Overwrite the current function to not have an if statement
        return utcOffsetSeconds
    end
    return utcOffsetSeconds
end

local calendarEventsCache, calendarEventsCacheDeferred
local function CacheDayEvent(monthDay, index)
    local event = C_Calendar.GetDayEvent(0, monthDay, index)
    if not event then
        return
    end

    -- GetDayEvent is SecretInChatMessagingLockdown: every field turns secret on communication restricted
    -- maps and under encounter, Mythic+ or PvP match restrictions, which tainted code cannot compare
    if canaccessvalue and not canaccessvalue(event.calendarType) then
        calendarEventsCacheDeferred = true
        return
    end

    if not event.eventID or event.calendarType ~= "HOLIDAY" then
        return
    end

    if calendarEventsCache[event.eventID] then
        return
    end

    local startTime = addon.GetSecondsSince(event.startTime) - KrowiAF_GetUtcOffsetSeconds()
    local endTime = addon.GetSecondsSince(event.endTime) - KrowiAF_GetUtcOffsetSeconds()
    calendarEventsCache[event.eventID] = {
        StartTime = startTime,
        EndTime = endTime,
        Name = event.title
    }
end

local function CacheDayEvents(monthDay)
    local numDayEvents = C_Calendar.GetNumDayEvents(0, monthDay)
    for index = 1, numDayEvents do
        CacheDayEvent(monthDay, index)
        if calendarEventsCacheDeferred then
            return
        end
    end
end

local function CacheMonthEvents(startDay)
    startDay = startDay or 1
    for monthDay = startDay, 31 do
        CacheDayEvents(monthDay)
        if calendarEventsCacheDeferred then
            return
        end
    end
end

function eventData.BuildCalendarEventsCache()
    if calendarEventsCacheDeferred then
        return
    end

    calendarEventsCache = {}

    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)

    local startDay = currentDate.monthDay
    for _ = 1, 13 do
        CacheMonthEvents(startDay)
        if calendarEventsCacheDeferred then
            break
        end
        C_Calendar.SetMonth(1)
        startDay = nil
    end

    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)

    if calendarEventsCacheDeferred then
        calendarEventsCache = nil
        addon.Diagnostics.Debug("Calendar events cache deferred, C_Calendar.GetDayEvent returned secret values")
    end
end

function eventData.ClearCalendarEventsCacheDeferral()
    calendarEventsCacheDeferred = nil
end

function eventData.GetNextEventOccurance(eventId)
    eventId = tonumber(eventId)

    if not calendarEventsCache then
        eventData.BuildCalendarEventsCache()
    end

    return calendarEventsCache and calendarEventsCache[eventId]
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
            local occurrence = eventData.GetNextEventOccurance(event.Id)
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
            local occurrence = eventData.GetNextEventOccurance and eventData.GetNextEventOccurance(event.Id)
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
    local startTime, endTime = addon.Data.EventSchedules.GetWindow(event.Id, now)
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
    local secondsLeft = addon.Data.CustomWidgetEventTimers.GetSecondsLeft(event.Id, now)
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
    local scheduler = addon.Data.EventScheduler
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

    local timers = addon.Data.CustomWorldEventTimers
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