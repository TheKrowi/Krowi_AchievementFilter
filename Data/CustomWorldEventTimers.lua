local _, addon = ...;
addon.Data.CustomWorldEventTimers = {};
local customWorldEventTimers = addon.Data.CustomWorldEventTimers;
local timers = {};

local minutesAbbr = MINUTES_ABBR:gsub("%%d", "(%%d+)");
local secondsAbbr = SECONDS_ABBR:gsub("%%d", "(%%d+)");
local dMinutes = D_MINUTES:gsub("%%d", "(%%d+)");
local dSeconds = D_SECONDS:gsub("%%d", "(%%d+)");

function customWorldEventTimers.GetSecondsLeft(id)
    if not timers[id] then
        return C_AreaPoiInfo.GetAreaPOISecondsLeft(id);
    end
    return timers[id]();
end

local function GetSecondsLeft(text, minutesPattern, secondsPattern)
    local minutes = string.match(text, minutesPattern) or 0;
    local seconds = string.match(text, secondsPattern) or 0;
    -- print(minutes, seconds, minutes * 60 + seconds)
    return minutes * 60 + seconds;
end

timers[7460] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4814);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr);
end

timers[7462] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4826);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr);
end