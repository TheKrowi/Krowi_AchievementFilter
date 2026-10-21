local _, addon = ...
addon.Data.CustomWidgetEventTimers = {}
local customWidgetEventTimers = addon.Data.CustomWidgetEventTimers
local timers = {}

local minutesAbbr = MINUTES_ABBR:gsub("%%d", "(%%d+)")
local secondsAbbr = SECONDS_ABBR:gsub("%%d", "(%%d+)")

-- now: the server time, passed to the timers that compute their times instead of reading a widget
function customWidgetEventTimers.GetSecondsLeft(id, now)
    if not timers[id] then
        return nil
    end
    return timers[id](now or GetServerTime())
end

-- The soup, the Community Feast of the Iskaara Tuskarr, on its fixed schedule instead of its widget, which is only there
-- in the Azure Span (docs/work/2026-10-21-event-scheduler). Its 90-minute cycle, since 2023-02-06, is 15 minutes of
-- preparation, the 15 minutes of cooking counted here as its start and its time active, and 60 minutes of eating. A
-- day is a whole number of cycles, so the cooking starts at the same UTC clock times every day, an offset per region
-- (from maintained addons' data): Americas 00:00, Korea, Taiwan and China 00:30, Europe 01:00, and every 90 minutes
-- from there. Europe's was checked on the Azure Span map on 2026-10-21: the eating ended 60 minutes after the cooking
-- counted here, within a minute.
local feastInterval, feastLength = 5400, 900
local feastOffsets = {[1] = 0, [2] = 1800, [3] = 3600, [4] = 1800, [5] = 1800} -- by GetCurrentRegion(): US, KR, EU, TW, CN

-- Seconds until the next start, and the seconds left while one is going on; nothing for a region without a schedule
function customWidgetEventTimers.FeastTimes(now, region)
    local offset = feastOffsets[region]
    if not offset then
        return
    end
    local sinceStart = (now - offset) % feastInterval
    return feastInterval - sinceStart, sinceStart < feastLength and feastLength - sinceStart or nil
end

local function GetSecondsLeft(text, minutesPattern, secondsPattern)
    local minutes = string.match(text, minutesPattern) or 0
    local seconds = string.match(text, secondsPattern) or 0
    -- print(minutes, seconds, minutes * 60 + seconds)
    return minutes * 60 + seconds
end

timers[4729] = function(now) -- Community Feast: Next, the time to the next start
    return (customWidgetEventTimers.FeastTimes(now, GetCurrentRegion()))
end

timers[4731] = function(now) -- Community Feast: Active, the time left while one is going on
    local _, secondsLeft = customWidgetEventTimers.FeastTimes(now, GetCurrentRegion())
    return secondsLeft
end

timers[4987] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4978)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end

timers[4992] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(4924)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end

timers[5157] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(5157)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end

timers[5323] = function()
    return 0 -- 17-22 minutes but ends when the boss is killed, do not track this time for now and show no time data available
end

timers[5584] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(5584)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end

timers[5585] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(5585)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end

timers[5592] = function()
    local widgetInfo = C_UIWidgetManager.GetTextWithStateWidgetVisualizationInfo(5587)
    if not widgetInfo or not widgetInfo.text then
        return nil
    end

    return GetSecondsLeft(widgetInfo.text, minutesAbbr, secondsAbbr)
end