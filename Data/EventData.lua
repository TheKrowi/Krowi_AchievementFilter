-- [[ Namespaces ]] --
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
    local calendarEvent = data.CalendarEvents[dayEvent.eventID];
    local startTime = addon.GetSecondsSince(dayEvent.startTime) - GetUtcOffsetSeconds();
    local endTime = addon.GetSecondsSince(dayEvent.endTime) - GetUtcOffsetSeconds();
    local eventHasStarted = startTime <= time();
    local eventHasEnded = endTime <= time();
    if eventHasStarted and not eventHasEnded then
        -- addon.Diagnostics.Print("Event active", calendarEvent.Id, dayEvent.title, startTime, time(), endTime, eventHasStarted, eventHasEnded);
        calendarEvent.EventDetails = {EndTime = endTime, Name = dayEvent.title};
        tinsert(activeEvents, calendarEvent);
    else
        -- addon.Diagnostics.Print("Event not active", calendarEvent.Id, startTime, time(), endTime, eventHasStarted, eventHasEnded);
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
    local calendarEvents = data.CalendarEvents;

    for k = 1, numDayEvents, 1 do
        local dayEvent = C_Calendar.GetDayEvent(0, currentDate.monthDay, k);
        if calendarEvents[dayEvent.eventID] and addon.Options.db.EventReminders.CalendarEvents[dayEvent.eventID] then
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
    for _, event in next, data.WidgetEvents do
        event.EventDetails = eventData.GetWidgetEventDetails(event);
        if event.EventDetails then
            -- addon.Diagnostics.Print("Event active", event.Id, event.EventDetails.Name, time(), event.EventDetails.EndTime);
            tinsert(activeEvents, event);
        end
    end
end

function eventData.GetWidgetEventDetails(event)
    if not addon.Options.db.EventReminders.WidgetEvents[event.Id] then
        return;
    end

    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(event.Id);
    if not widgetInfo or widgetInfo.shownState == 0 then -- The event is not available or not active
        return;
    end

    local secondsLeft = addon.Data.CustomWidgetTimers.GetSecondsLeft(event.Id);
    local endTime;
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        endTime = floor((GetServerTime() + secondsLeft) / 60 + 0.5) * 60; -- Round to 1 minute, 1 hour is not precise enough anymore
    end

    return {EndTime = endTime, Name = event.Name};
end

local function GetActiveWorldEvents()
    for _, event in next, data.WorldEvents do
        event.EventDetails = eventData.GetWorldEventDetails(event);
        if event.EventDetails then
            -- addon.Diagnostics.Print("Event active", event.Id, event.EventDetails.Name, time(), event.EventDetails.EndTime);
            tinsert(activeEvents, event);
        end
    end
end

function eventData.GetWorldEventDetails(event)
    if not addon.Options.db.EventReminders.WorldEvents[event.Id] then
        return;
    end

    local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(event.MapId, event.Id);
    if not poiInfo then -- The event is not active
        return;
    end

    local secondsLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft(event.Id);
    local endTime;
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        endTime = floor((GetServerTime() + secondsLeft) / 60 + 0.5) * 60; -- Round to 1 minute, 1 hour is not precise enough anymore
    end

    return {EndTime = endTime, Name = event.Name};
end

function eventData.GetActiveEvents(refresh)
    -- addon.Diagnostics.Print("GetActiveEvents", activeEvents ~= nil, refresh, activeEvents ~= nil and not refresh);
    if activeEvents ~= nil and not refresh then
        return activeEvents;
    end

    activeEvents = {};
    GetActiveCalendarEvents();
    GetActiveWidgetEvents();
    GetActiveWorldEvents();

    return activeEvents;
end

KrowiAF_IgnoreCalendarEvents = false;