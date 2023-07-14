local _, addon = ...;
local data = addon.Data;
data.CustomWidgetTimers = {};
local customWidgetTimers = data.CustomWidgetTimers;
local timers = {};

local minutesAbbr = MINUTES_ABBR:gsub("%%d", "(%%d+)");
local secondsAbbr = SECONDS_ABBR:gsub("%%d", "(%%d+)");

local function GetSecondsLeft(text)
    local minutes = string.match(text, minutesAbbr) or 0;
    local seconds = string.match(text, secondsAbbr) or 0;
    -- print(minutes, seconds, minutes * 60 + seconds)
    return minutes * 60 + seconds;
end

timers[4729] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4729);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text);
end

timers[4731] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4731);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text);
end

timers[4924] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4924);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text);
end

timers[4987] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4978);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text);
end

timers[4992] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4924);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text);
end

function customWidgetTimers.GetSecondsLeft(id)
    if not timers[id] then
        return nil;
    end
    return timers[id]();
end