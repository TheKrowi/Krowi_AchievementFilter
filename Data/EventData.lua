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
        EventDetails.CalendarEvents = {};
        local events = GetEvents();
        for id, event in next, data.CalendarEvents do
            if events[id] then -- At this time we only handle calendar events, POI's are handeled later
                local startTime = addon.GetSecondsSince(events[id].startTime);
                local endTime = addon.GetSecondsSince(events[id].endTime);
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
                local event = C_Calendar.GetDayEvent(0, date.monthDay, k);
                if events[event.eventID] == nil then
                    events[event.eventID] = event;
                end
            end
            date = C_DateAndTime.AdjustTimeByDays(date, 1);
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

local GetSavedWorldEvents, GetNewWorldEvents, GetStartAndEndTime;
function eventData.GetActiveWorldEvents()
    diagnostics.Trace("eventData.GetActiveWorldEvents");

    local activeWorldEvents = {};
    if EventDetails.WorldEvents == nil then
        EventDetails.WorldEvents = {};
    end

    GetSavedWorldEvents(activeWorldEvents, time());
    GetNewWorldEvents(activeWorldEvents);

    return activeWorldEvents;
end

function GetSavedWorldEvents(activeWorldEvents, currentDate)
    for id, event in next, EventDetails.WorldEvents do
        local deltaT = math.floor((event.EndTime - currentDate) / (3600 * 24));
        -- diagnostics.Debug(id .. " - " .. event.Name .. " - " .. tostring(deltaT));
        if deltaT < 0 or not addon.Options.db.EventReminders.WorldEvents[id] then
            EventDetails.WorldEvents[id] = nil;
        end
    end

    for id, event in next, data.WorldEvents do
        if EventDetails.WorldEvents[id] then
            event.EventDetails = EventDetails.WorldEvents[id];
            -- diagnostics.Debug("Existing event active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
            tinsert(activeWorldEvents, event);
        end
    end
end

function GetNewWorldEvents(activeWorldEvents)
    for _, event in next, data.WorldEvents do
        if event.EventDetails == nil and addon.Options.db.EventReminders.WorldEvents[event.ID] then
            local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(event.MapID, event.ID);
            if poiInfo then -- The event is active
                local secondsLeft = C_AreaPoiInfo.GetAreaPOISecondsLeft(event.ID);
                -- diagnostics.Debug(secondsLeft);
                if secondsLeft == nil or secondsLeft == 0 then
                    return; -- C_AreaPoiInfo is not yet properly loaded
                end

                local startTime, endTime = GetStartAndEndTime(secondsLeft, event.TotalDuration or 0);
                -- diagnostics.Debug(startTime);
                -- diagnostics.Debug(endTime);

                event.EventDetails = {StartTime = startTime, EndTime = endTime, Name = event.Name};
                -- diagnostics.Debug(event.ID .. " - " .. event.EventDetails.Name .. " - " ..
                --                     date("%Y/%m/%d %H:%M", event.EventDetails.StartTime) .. " - " .. date("%Y/%m/%d %H:%M", event.EventDetails.EndTime));

                -- diagnostics.Debug("New event active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
                EventDetails.WorldEvents[event.ID] = event.EventDetails;
                tinsert(activeWorldEvents, event);
            else
                -- diagnostics.Debug("Event not active:" .. event.ID .. " - " .. event.Name);
            end
        end
    end
end

local GetSavedWidgetEvents, GetNewWidgetEvents;
function eventData.GetActiveWidgetEvents()
    diagnostics.Trace("eventData.GetActiveWidgetEvents");

    local activeWidgetEvents = {};
    if EventDetails.WidgetEvents == nil then
        EventDetails.WidgetEvents = {};
    end

    GetSavedWidgetEvents(activeWidgetEvents, time());
    GetNewWidgetEvents(activeWidgetEvents);

    return activeWidgetEvents;
end

function GetSavedWidgetEvents(activeWidgetEvents, currentDate)
    for id, event in next, EventDetails.WidgetEvents do
        local deltaT = math.floor((event.EndTime - currentDate) / (3600 * 24));
        -- diagnostics.Debug(id .. " - " .. event.Name .. " - " .. tostring(deltaT));
        if deltaT < 0 or not addon.Options.db.EventReminders.WidgetEvents[id] then
            EventDetails.WidgetEvents[id] = nil;
        end
    end

    for id, event in next, data.WidgetEvents do
        if EventDetails.WidgetEvents[id] then
            event.EventDetails = EventDetails.WidgetEvents[id];
            -- diagnostics.Debug("Existing event active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
            tinsert(activeWidgetEvents, event);
        end
    end
end

function GetNewWidgetEvents(activeWidgetEvents)
    for _, event in next, data.WidgetEvents do
        if event.EventDetails == nil and addon.Options.db.EventReminders.WidgetEvents[event.ID] then
            local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(event.ID);
            if widgetInfo and widgetInfo.shownState == 1 then -- The event is active
                local secondsLeft = event.TotalDuration;
                if secondsLeft == 604800 then
                    secondsLeft = C_DateAndTime.GetSecondsUntilWeeklyReset();
                else
                    secondsLeft = nil;
                end
                -- diagnostics.Debug(secondsLeft);
                if secondsLeft == nil or secondsLeft == 0 then
                    return; -- Widget time not yet supported
                end

                local startTime, endTime = GetStartAndEndTime(secondsLeft, event.TotalDuration or 0);
                -- diagnostics.Debug(startTime);
                -- diagnostics.Debug(endTime);

                event.EventDetails = {StartTime = startTime, EndTime = endTime, Name = event.Name};
                -- diagnostics.Debug(event.ID .. " - " .. event.EventDetails.Name .. " - " ..
                --                     date("%Y/%m/%d %H:%M", event.EventDetails.StartTime) .. " - " .. date("%Y/%m/%d %H:%M", event.EventDetails.EndTime));

                -- diagnostics.Debug("New event active:" .. event.ID .. " - " .. event.EventDetails.Name .. " - " .. tostring(deltaT));
                EventDetails.WidgetEvents[event.ID] = event.EventDetails;
                tinsert(activeWidgetEvents, event);
            else
                -- diagnostics.Debug("Event not active:" .. event.ID .. " - " .. event.Name);
            end
        end
    end
end

function GetStartAndEndTime(secondsLeft, totalDuration) -- both in seconds
    local endTime = floor((GetServerTime() + secondsLeft) / 3600 + 0.5) * 3600; -- Round to the hour
    local startTime = endTime - totalDuration;

    return startTime, endTime;
end