-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
addon.EventData = {};
local eventData = addon.EventData;

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
end

local activeCalendarEvents;
local function ProcessDayEvent(dayEvent)
    local calendarEvent = data.CalendarEvents[dayEvent.eventID];
    local startTime = addon.GetSecondsSince(dayEvent.startTime) - GetUtcOffsetSeconds();
    local endTime = addon.GetSecondsSince(dayEvent.endTime) - GetUtcOffsetSeconds();
    local eventHasStarted = startTime <= time();
    local eventHasEnded = endTime <= time();
    if eventHasStarted and not eventHasEnded then
        addon.Diagnostics.Print("Event active", calendarEvent.Id, startTime, time(), endTime, eventHasStarted, eventHasEnded);
        calendarEvent.EventDetails = {EndTime = endTime, Name = dayEvent.title};
        tinsert(activeCalendarEvents, calendarEvent);
    else
        addon.Diagnostics.Print("Event not active", calendarEvent.Id, startTime, time(), endTime, eventHasStarted, eventHasEnded);
    end
end

local function GetActiveCalendarEvents(refresh)
    if activeCalendarEvents ~= nil and not refresh then
        return activeCalendarEvents;
    end
    activeCalendarEvents = {};

    local currentDate = C_DateAndTime.GetCurrentCalendarTime();
    local numDayEvents = C_Calendar.GetNumDayEvents(0, currentDate.monthDay);
    local calendarEvents = data.CalendarEvents;

    for k = 1, numDayEvents, 1 do
        local dayEvent = C_Calendar.GetDayEvent(0, currentDate.monthDay, k);
        if calendarEvents[dayEvent.eventID] and addon.Options.db.EventReminders.CalendarEvents[dayEvent.eventID] then
            ProcessDayEvent(dayEvent);
        end
    end

    return activeCalendarEvents;
end

local activeWorldEvents;
local function GetActiveWorldEvents(refresh)
    if activeWorldEvents ~= nil and not refresh then
        return activeWorldEvents;
    end
    activeWorldEvents = {};

    for _, event in next, data.WorldEvents do
        event.EventDetails = eventData.GetEventDetails(event);
        if event.EventDetails then
            tinsert(activeWorldEvents, event);
        end
    end

    return activeWorldEvents;
end

function eventData.GetEventDetails(event)
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

local activeEvents;
function eventData:GetActiveEvents(refresh)
    addon.Diagnostics.Print("GetActiveEvents", activeEvents ~= nil, refresh, activeEvents ~= nil and not refresh);
    if activeEvents ~= nil and not refresh then
        return activeEvents;
    end
    activeEvents = GetActiveCalendarEvents(refresh);
    addon.Util.ConcatTables(activeEvents, GetActiveWorldEvents(refresh));
    return activeEvents;
end