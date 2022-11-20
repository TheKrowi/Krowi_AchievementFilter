-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local data = addon.Data;
addon.EventData = {};
local eventData = addon.EventData;

local GetEvents;
function eventData.Load()
    local refreshEvents = false;

    if EventDetails == nil then
        EventDetails = {};
    end

    if type(EventDetails.CalendarEvents) == "table" then -- Check if all event end dates are in the future
        if next(EventDetails.CalendarEvents) == nil then
            refreshEvents = true;
        else
            for id, event in next, EventDetails.CalendarEvents do
                local deltaT = (event.EndTime or 0) - time(); -- (event.EndTime - time()) / (3600 * 24)
                -- diagnostics.Debug(id .. " - " .. event.Name .. " - " .. tostring(deltaT));
                if deltaT < 0 then
                    refreshEvents = true;
                end
            end
        end
    else
        refreshEvents = true;
    end

    -- diagnostics.Debug("refreshEvents: " .. tostring(refreshEvents));
    if refreshEvents then -- Events are either empty or an event has elapsed so get new data
        local utcNow = date("!*t");
        local locNow = date("*t");
        local utcServerTimeLocal = date("!*t", C_DateAndTime.GetServerTimeLocal());
        local serverUtcOffsetDays = utcServerTimeLocal.yday - utcNow.yday;
        local serverUtcOffsetHours = utcServerTimeLocal.hour - utcNow.hour;
        local userUtcOffsetDays = locNow.yday - utcNow.yday;
        local userUtcOffsetHours = locNow.hour - utcNow.hour;
        local utcOffsethours = (serverUtcOffsetDays * 24 + serverUtcOffsetHours) - (userUtcOffsetDays * 24 + userUtcOffsetHours);
        local utcOffsetSeconds = utcOffsethours * 3600;
        
        EventDetails.CalendarEvents = {};
        local events = GetEvents();
        for id, event in next, data.CalendarEvents do
            if events[id] then -- At this time we only handle calendar events, POI's are handeled later
                local startTime = addon.GetSecondsSince(events[id].startTime) - utcOffsetSeconds;
                local endTime = addon.GetSecondsSince(events[id].endTime) - utcOffsetSeconds;
                -- diagnostics.Debug(event.ID .. " - " .. events[id].title .. " - " ..
                --                     date("%Y/%m/%d %H:%M", startTime) .. " - " .. date("%Y/%m/%d %H:%M", endTime));
                if endTime - time() > 0 then
                    EventDetails.CalendarEvents[id] = {StartTime = startTime, EndTime = endTime, Name = events[id].title}; -- Cache for later
                end
                -- EventDetails.CalendarEvents[id] = events[id]; -- Cache for later
            end
        end
    end

    for id, event in next, data.CalendarEvents do
        event.EventDetails = EventDetails.CalendarEvents[id];
    end
end

function GetEvents()
    -- Make sure we're starting from the correct date
    local currentDate = C_DateAndTime.GetCurrentCalendarTime();
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);

    local events = {};
    local date = currentDate;
    for i = 1, 12, 1 do
        local monthInfo = C_Calendar.GetMonthInfo();
        if i > 1 then
            date = {year = monthInfo.year, month = monthInfo.month, monthDay = 1, weekday = monthInfo.firstWeekday, hour = 0, minute = 0}; -- First day of month
        end
        local numDays = monthInfo.numDays; -- Days in month
        for j = date.monthDay, numDays, 1 do
            date.numDayEvents = C_Calendar.GetNumDayEvents(0, date.monthDay);
            for k = 1, date.numDayEvents, 1 do
                -- print(date, k)
                local event = C_Calendar.GetDayEvent(0, date.monthDay, k);
                if events[event.eventID] == nil then
                    events[event.eventID] = event;
                end
            end
            -- print(date.year, date.month, date.monthDay)
            if pcall(function() date = C_DateAndTime.AdjustTimeByDays(date, 1) end) then
                -- print("no error")
            else
                -- print(date.year, date.month, date.monthDay)
                -- print("error")
            end
            -- date = C_DateAndTime.AdjustTimeByDays(date, 1);
        end
        C_Calendar.SetMonth(1);
    end

    -- Set the date back to the current date
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year);

    return events;
end

-- local activeCalendarEvents;
function eventData.GetActiveCalendarEvents()
    diagnostics.Trace("eventData.GetActiveCalendarEvents");

    local activeCalendarEvents = {};

    for _, event in next, data.CalendarEvents do
        if event.EventDetails ~= nil and addon.Options.db.EventReminders.CalendarEvents[event.ID] then
            local deltaT = math.floor((event.EventDetails.StartTime - time()) / (3600 * 24));
            if deltaT < 0 then
                -- diagnostics.Debug("Event active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
                tinsert(activeCalendarEvents, event);
            else
                -- diagnostics.Debug("Event not active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
            end
        end
    end

    return activeCalendarEvents;
end

local GetStartAndEndTime;
function eventData.GetActiveWorldEvents()
    local activeWorldEvents = {};
    for _, event in next, data.WorldEvents do
        event.EventDetails = eventData.GetEventDetails(event);
        if event.EventDetails then
            tinsert(activeWorldEvents, event);
        end
    end

    return activeWorldEvents;
end

function KAF_GetActiveWorldEvents()
    local events = eventData.GetActiveWorldEvents();
    for i, event in next, events do
        print(i, event.Id, event.Name);
    end
end

function eventData.PrimeAreaPoi()
    if addon.IsWrathClassic then
        return;
    end
    for _, event in next, data.WorldEvents do
        C_AreaPoiInfo.GetAreaPOIInfo(event.MapID, event.ID);
        C_AreaPoiInfo.GetAreaPOISecondsLeft(event.ID);
    end
end

function eventData.GetEventDetails(event)
    if not addon.Options.db.EventReminders.WorldEvents[event.Id] then
        return;
    end

    local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(event.MapID, event.ID);
    if not poiInfo then -- The event is not active
        return;
    end

    local secondsLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft(event.ID);
    local startTime, endTime;
    if secondsLeft ~= nil and secondsLeft ~= 0 then
        startTime, endTime = GetStartAndEndTime(secondsLeft, event.TotalDuration or 0);
    end

    return {StartTime = startTime, EndTime = endTime, Name = event.Name};
end

function GetStartAndEndTime(secondsLeft, totalDuration) -- both in seconds
    local endTime = floor((GetServerTime() + secondsLeft) / 300 + 0.5) * 300; -- Round to 5 minutes, 1 hour is not precise enough anymore
    local startTime = endTime - totalDuration;

    return startTime, endTime;
end