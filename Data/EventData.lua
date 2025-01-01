local _, addon = ...;
local data = addon.Data;
addon.EventData = {};
local eventData = addon.EventData;
local activeEvents;

local utcOffsetSeconds;
local function GetUtcOffsetSeconds()
    local utcNow = date("!*t");
    local locNow = date("*t");
    local utcServerTimeLocal = date("!*t", C_DateAndTime.GetServerTimeLocal());
    local serverUtcOffsetDays = utcServerTimeLocal.yday - utcNow.yday;
    local serverUtcOffsetHours = utcServerTimeLocal.hour - utcNow.hour;
    local userUtcOffsetDays = locNow.yday - utcNow.yday;
    local userUtcOffsetHours = locNow.hour - utcNow.hour;
    local utcOffsethours = (serverUtcOffsetDays * 24 + serverUtcOffsetHours) - (userUtcOffsetDays * 24 + userUtcOffsetHours);
    utcOffsetSeconds = utcOffsethours * 3600;
    GetUtcOffsetSeconds = function() -- Overwrite the current function to not have an if statement
        return utcOffsetSeconds;
    end
    return utcOffsetSeconds;
end

function KrowiAF_GetUtcOffsetSeconds()
    return GetUtcOffsetSeconds();
end

local function ProcessDayEvent(dayEvent)
    local calendarEvent = data.Events[KrowiAF.Enum.EventType.Calendar][dayEvent.eventID];
    local startTime = addon.GetSecondsSince(dayEvent.startTime) - GetUtcOffsetSeconds();
    local endTime = addon.GetSecondsSince(dayEvent.endTime) - GetUtcOffsetSeconds();
    local eventHasStarted = startTime <= time();
    local eventHasEnded = endTime <= time();
    if eventHasStarted and not eventHasEnded then
        calendarEvent.EventDetails = {
            EndTime = endTime,
            Name = dayEvent.title
        };
        tinsert(activeEvents, calendarEvent);
    end
end

local stopCalendarEventsRefresh;
local function GetActiveCalendarEvents()
    if stopCalendarEventsRefresh then
        return;
    end

    local currentDate = C_DateAndTime.GetCurrentCalendarTime();
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);
    local numDayEvents = C_Calendar.GetNumDayEvents(0, currentDate.monthDay);
    local calendarEvents = data.Events[KrowiAF.Enum.EventType.Calendar];

    for k = 1, numDayEvents, 1 do
        local dayEvent = C_Calendar.GetDayEvent(0, currentDate.monthDay, k);
        if calendarEvents[dayEvent.eventID] and addon.Options.db.profile.EventReminders.CalendarEvents[dayEvent.eventID] then
            ProcessDayEvent(dayEvent);
        end
    end
end

function eventData.LoadBlizzard_Calendar()
    hooksecurefunc(CalendarFrame, "Show", function()
        stopCalendarEventsRefresh = true;
    end);
    hooksecurefunc(CalendarFrame, "Hide", function()
        stopCalendarEventsRefresh = nil;
    end);
end

local function GetActiveWidgetEvents()
    for _, event in next, data.Events[KrowiAF.Enum.EventType.Widget] do
        event.EventDetails = eventData.GetWidgetEventDetails(event);
        if event.EventDetails then
            tinsert(activeEvents, event);
        end
    end
end

function eventData.GetWidgetEventDetails(event)
    if not addon.Options.db.profile.EventReminders.WidgetEvents[event.Id] then
        return;
    end

    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(event.Id);
    if not widgetInfo or widgetInfo.shownState == 0 then -- The event is not available or not active
        return;
    end

    local secondsLeft = addon.Data.CustomWidgetEventTimers.GetSecondsLeft(event.Id);
    local endTime;
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        endTime = GetServerTime() + secondsLeft;
    end

    return {EndTime = endTime, Name = event.Name};
end

local function GetActiveWorldEvents()
    for _, event in next, data.Events[KrowiAF.Enum.EventType.World] do
        event.EventDetails = eventData.GetWorldEventDetails(event);
        if event.EventDetails then
            tinsert(activeEvents, event);
        end
    end
end

function eventData.GetWorldEventDetails(event)
    if not addon.Options.db.profile.EventReminders.WorldEvents[event.Id] then
        return;
    end

    local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(event.MapId, event.Id);
    if not poiInfo then -- The event is not active
        return;
    end

    local secondsLeft = addon.Data.CustomWorldEventTimers.GetSecondsLeft(event.Id);
    local endTime;
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        endTime = GetServerTime() + secondsLeft;
    end

    return {EndTime = endTime, Name = event.Name};
end

function eventData.GetActiveEvents(refresh)
    if activeEvents ~= nil and not refresh then
        return activeEvents;
    end

    activeEvents = {};
    GetActiveCalendarEvents();
    GetActiveWidgetEvents();
    GetActiveWorldEvents();

    return activeEvents;
end

local upcomingCalendarEvents;
local function ProcessUpcomingDayEvent(dayEvent)
    local calendarEvent = data.Events[KrowiAF.Enum.EventType.Calendar][dayEvent.eventID];
    local startTime = addon.GetSecondsSince(dayEvent.startTime) - GetUtcOffsetSeconds();
    local endTime = addon.GetSecondsSince(dayEvent.endTime) - GetUtcOffsetSeconds();
    local currentTime = time();
    local nDaysFromNow = currentTime + (addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days * 24 * 60 * 60);
    if startTime > currentTime and startTime <= nDaysFromNow then
        calendarEvent.UpcomingEventDetails = {
            StartTime = startTime,
            EndTime = endTime,
            Name = dayEvent.title
        };
    end
end

function eventData.GetUpcomingCalendarEvents(refresh)
    if stopCalendarEventsRefresh then
        return;
    end

    if upcomingCalendarEvents ~= nil and not refresh then
        return upcomingCalendarEvents;
    end

    upcomingCalendarEvents = {};

    local currentDate = C_DateAndTime.GetCurrentCalendarTime();
    local secondsSince = addon.GetSecondsSince(currentDate);
    local calendarEvents = data.Events[KrowiAF.Enum.EventType.Calendar];
    for i = 1, addon.Options.db.profile.EventReminders.UpcomingCalendarEvents.Days do
        secondsSince = secondsSince + 24 * 60 * 60;
        currentDate = date("*t", secondsSince);
        C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);
        local numDayEvents = C_Calendar.GetNumDayEvents(0, currentDate.day);

        for k = 1, numDayEvents, 1 do
            local dayEvent = C_Calendar.GetDayEvent(0, currentDate.day, k);
            if calendarEvents[dayEvent.eventID] and addon.Options.db.profile.EventReminders.CalendarEvents[dayEvent.eventID] then
                ProcessUpcomingDayEvent(dayEvent);
            end
        end
    end

    for _, event in next, calendarEvents do
        if event.UpcomingEventDetails then
            tinsert(upcomingCalendarEvents, event);
        end
    end

    return upcomingCalendarEvents;
end

local function GetCalendarDayEvents(monthDay, index)
    local event = C_Calendar.GetDayEvent(0, monthDay, index);
    if KrowiAF_SavedData.CalendarEventsCache[event.eventID] then
        return;
    end
    local startTime = addon.GetSecondsSince(event.startTime) - GetUtcOffsetSeconds();
    local endTime = addon.GetSecondsSince(event.endTime) - GetUtcOffsetSeconds();
    KrowiAF_SavedData.CalendarEventsCache[event.eventID] = {
        StartTime = startTime,
        EndTime = endTime,
        Name = event.title
    }
end

local function GetCalendarEvents(startDay)
    startDay = startDay or 1;
    for monthDay = startDay, 31 do
        local numDayEvents = C_Calendar.GetNumDayEvents(0, monthDay);
        for index = 1, numDayEvents do
            GetCalendarDayEvents(monthDay, index);
        end
    end
end

local function GetCalendarEventsToYearToDate()
    KrowiAF_SavedData.CalendarEventsCache = {};

    local currentDate = C_DateAndTime.GetCurrentCalendarTime();
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);

    local startDay = currentDate.monthDay;
    for _ = 1, 13 do
        GetCalendarEvents(startDay);
        C_Calendar.SetMonth(1);
        startDay = nil;
    end

    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);
end

function eventData.BuildCalendarEventsCache()
    GetCalendarEventsToYearToDate();
end