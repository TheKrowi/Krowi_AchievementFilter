local _, addon = ...
addon.Data.CustomWidgetEventTimers = {}
local customWidgetEventTimers = addon.Data.CustomWidgetEventTimers
local timers = {}

-- The widget events' timers. Only the soup's are left here: Time Rift, Superbloom and the Azerothian Archives run on
-- fixed schedules (Data/EventSchedules.lua, DataAddons/Retail/10_Dragonflight/EventSchedules.lua) and read no widget.

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
local feastInterval, feastLength, feastPreparation = 5400, 900, 900
local feastOffsets = {[1] = 0, [2] = 1800, [3] = 3600, [4] = 1800, [5] = 1800} -- by GetCurrentRegion(): US, KR, EU, TW, CN
local computed = {[4729] = true, [4731] = true} -- the timers below that compute their times and read no widget

-- Seconds until the next start, and the seconds left while one is going on; nothing for a region without a schedule
function customWidgetEventTimers.FeastTimes(now, region)
    local offset = feastOffsets[region]
    if not offset then
        return
    end
    local sinceStart = (now - offset) % feastInterval
    return feastInterval - sinceStart, sinceStart < feastLength and feastLength - sinceStart or nil
end

-- Whether a widget event's timer computes its times instead of reading its widget (Tests/Memory.lua)
function customWidgetEventTimers.IsComputed(id)
    return computed[id] == true
end

timers[4729] = function(now) -- Community Feast: Next, the time to the next start, only in the preparation before it (Krowi, 2026-10-21)
    local secondsToNext = customWidgetEventTimers.FeastTimes(now, GetCurrentRegion())
    if secondsToNext and secondsToNext <= feastPreparation then
        return secondsToNext
    end
end

timers[4731] = function(now) -- Community Feast: Active, the time left while one is going on
    local _, secondsLeft = customWidgetEventTimers.FeastTimes(now, GetCurrentRegion())
    return secondsLeft
end