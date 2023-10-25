local _, addon = ...;
local data = addon.Data;
data.CustomWidgetTimers = {};
local customWidgetTimers = data.CustomWidgetTimers;
local timers = {};

local minutesAbbr = MINUTES_ABBR:gsub("%%d", "(%%d+)");
local secondsAbbr = SECONDS_ABBR:gsub("%%d", "(%%d+)");
local dMinutes = D_MINUTES:gsub("%%d", "(%%d+)");
local dSeconds = D_SECONDS:gsub("%%d", "(%%d+)");

function customWidgetTimers.GetSecondsLeft(id)
    if not timers[id] then
        return nil;
    end
    return timers[id]();
end

local function GetSecondsLeft(text, minutesPattern, secondsPattern)
    local minutes = string.match(text, minutesPattern) or 0;
    local seconds = string.match(text, secondsPattern) or 0;
    -- print(minutes, seconds, minutes * 60 + seconds)
    return minutes * 60 + seconds;
end

timers[4729] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4729);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, dMinutes, dSeconds);
end

timers[4731] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4731);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, dMinutes, dSeconds);
end

timers[4987] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4978);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr);
end

timers[4992] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4924);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr);
end

timers[5323] = function()
    -- local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(5157);
    -- if not widgetInfo or not widgetInfo.text then
    --     return nil;
    -- end

    -- return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr);
    return 0; -- 17-22 minutes but ends when the boss is killed, do not track this time by now and show no time data available
end

-- 5323 superbloom active (can be not shown)
-- 5157 time till next