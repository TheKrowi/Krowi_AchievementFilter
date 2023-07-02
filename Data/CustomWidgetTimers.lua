local _, addon = ...;
local data = addon.Data;
data.CustomWidgetTimers = {};
local customWidgetTimers = data.CustomWidgetTimers;
local timers = {};

timers[4729] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4729);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    local index = 1;
    local minutes, seconds = 0, 0;
    for match in string.gmatch(widgetInfo.text, "%d+") do
        if index == 1 then
            minutes = tonumber(match);
        elseif index == 3 then
            seconds = tonumber(match);
        end
        index = index + 1;
    end
    return minutes * 60 + seconds;
end

timers[4731] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4731);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    local index = 1;
    local minutes, seconds = 0, 0;
    for match in string.gmatch(widgetInfo.text, "%d+") do
        if index == 1 then
            minutes = tonumber(match);
        elseif index == 3 then
            seconds = tonumber(match);
        end
        index = index + 1;
    end
    return minutes * 60 + seconds;
end

timers[4987] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4978);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    local index = 1;
    local minutes, seconds = 0, 0;
    for match in string.gmatch(widgetInfo.text, "%d+") do
        if index == 1 then
            minutes = tonumber(match);
        elseif index == 3 then
            seconds = tonumber(match);
        end
        index = index + 1;
    end
    return minutes * 60 + seconds;
end

timers[4992] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4924);
    if not widgetInfo or not widgetInfo.text then
        return nil;
    end

    local index = 1;
    local minutes, seconds = 0, 0;
    for match in string.gmatch(widgetInfo.text, "%d+") do
        if index == 1 then
            minutes = tonumber(match);
        elseif index == 3 then
            seconds = tonumber(match);
        end
        index = index + 1;
    end
    return minutes * 60 + seconds;
end

function customWidgetTimers.GetSecondsLeft(id)
    if not timers[id] then
        return nil;
    end
    return timers[id]();
end