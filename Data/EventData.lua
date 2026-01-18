local _, addon = ...
addon.EventData = {}
local eventData = addon.EventData

local function GetOrCreateEventDetails(event)
    event._EventDetails = event._EventDetails or {}
    return event._EventDetails
end

local utcOffsetSeconds
function KrowiAF_GetUtcOffsetSeconds()
    local utcNow = date("!*t")
    local locNow = date("*t")
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

local calendarEventsCache
local function CacheDayEvent(monthDay, index)
    local event = C_Calendar.GetDayEvent(0, monthDay, index)
    if not event or not event.eventID then
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
    end
end

local function CacheMonthEvents(startDay)
    startDay = startDay or 1
    for monthDay = startDay, 31 do
        CacheDayEvents(monthDay)
    end
end

function eventData.BuildCalendarEventsCache()
    calendarEventsCache = {}

    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)

    local startDay = currentDate.monthDay
    for _ = 1, 13 do
        CacheMonthEvents(startDay)
        C_Calendar.SetMonth(1)
        startDay = nil
    end

    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)
end

function eventData.GetNextEventOccurance(eventId)
    eventId = tonumber(eventId)

    if not calendarEventsCache then
        eventData.BuildCalendarEventsCache()
    end

    return calendarEventsCache[eventId]
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

    local currentTime = time()
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

function GetActiveCalendarEvents()
    if stopCalendarEventsRefresh then
        return
    end

    local currentTime = time()
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

function eventData.GetWidgetEventDetails(event)
    if not addon.Options.db.profile.EventReminders.WidgetEvents[event.Id] then
        event.EventDetails = nil
        return
    end

    local secondsLeft = addon.Data.CustomWidgetEventTimers.GetSecondsLeft(event.Id)
    if not secondsLeft then -- The event is not available or not active
        event.EventDetails = nil
        return
    end

    local endTime = GetServerTime() + secondsLeft
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

function eventData.GetWorldEventDetails(event)
    if not addon.Options.db.profile.EventReminders.WorldEvents[event.Id] then
        event.EventDetails = nil
        return
    end

    local secondsLeft = addon.Data.CustomWorldEventTimers.GetSecondsLeft(event.Id)
    if not secondsLeft then -- The event is not active
        event.EventDetails = nil
        return
    end

    local endTime = GetServerTime() + secondsLeft
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