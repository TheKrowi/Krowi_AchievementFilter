local _, addon = ...
addon.EventData = {}
local eventData = addon.EventData

-- The calendar's holidays, cached for the obtainable state (Data/TemporaryObtainable.lua) and for Event reminders, which
-- reads it for its upcoming and active holidays (Features/EventReminders/Data/EventData.lua). The core's whether the
-- feature is on or off (docs/work/2026-11-12-event-reminders).

local utcOffsetSeconds
-- Read on the realm's clock, so the calendar's and the obtainability dates' times are true UTC seconds even on a PC whose
-- clock is set wrong, and compare with GetServerTime() (docs/work/2026-10-28-active-events-chat-repeat)
function KrowiAF_GetUtcOffsetSeconds()
    local now = GetServerTime()
    local utcNow = date("!*t", now)
    local locNow = date("*t", now)
    local utcServerTimeLocal = date("!*t", C_DateAndTime.GetServerTimeLocal())
    local serverUtcOffsetDays = utcServerTimeLocal.yday - utcNow.yday
    local serverUtcOffsetHours = utcServerTimeLocal.hour - utcNow.hour
    local userUtcOffsetDays = locNow.yday - utcNow.yday
    local userUtcOffsetHours = locNow.hour - utcNow.hour
    local utcOffsethours = (serverUtcOffsetDays * 24 + serverUtcOffsetHours) - (userUtcOffsetDays * 24 + userUtcOffsetHours)
    utcOffsetSeconds = utcOffsethours * 3600
    KrowiAF_GetUtcOffsetSeconds = function() -- Overwrite the current function to not have an if statement
        return utcOffsetSeconds
    end
    return utcOffsetSeconds
end

local calendarEventsCache, calendarEventsCacheDeferred
local function CacheDayEvent(monthDay, index)
    local event = C_Calendar.GetDayEvent(0, monthDay, index)
    if not event then
        return
    end

    -- GetDayEvent is SecretInChatMessagingLockdown: every field turns secret on communication restricted
    -- maps and under encounter, Mythic+ or PvP match restrictions, which tainted code cannot compare
    if canaccessvalue and not canaccessvalue(event.calendarType) then
        calendarEventsCacheDeferred = true
        return
    end

    if not event.eventID or event.calendarType ~= "HOLIDAY" then
        return
    end

    if calendarEventsCache[event.eventID] then
        return
    end

    local startTime = addon.GetSecondsSince(event.startTime) - KrowiAF_GetUtcOffsetSeconds()
    local endTime = addon.GetSecondsSince(event.endTime) - KrowiAF_GetUtcOffsetSeconds()
    calendarEventsCache[event.eventID] = {
        StartTime = startTime,
        EndTime = endTime,
        Name = event.title
    }
end

local function CacheDayEvents(monthDay)
    local numDayEvents = C_Calendar.GetNumDayEvents(0, monthDay)
    for index = 1, numDayEvents do
        CacheDayEvent(monthDay, index)
        if calendarEventsCacheDeferred then
            return
        end
    end
end

local function CacheMonthEvents(startDay)
    startDay = startDay or 1
    for monthDay = startDay, 31 do
        CacheDayEvents(monthDay)
        if calendarEventsCacheDeferred then
            return
        end
    end
end

function eventData.BuildCalendarEventsCache()
    if calendarEventsCacheDeferred then
        return
    end

    calendarEventsCache = {}

    local currentDate = C_DateAndTime.GetCurrentCalendarTime()
    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)

    local startDay = currentDate.monthDay
    for _ = 1, 13 do
        CacheMonthEvents(startDay)
        if calendarEventsCacheDeferred then
            break
        end
        C_Calendar.SetMonth(1)
        startDay = nil
    end

    C_Calendar.SetAbsMonth(currentDate.month, currentDate.year)

    if calendarEventsCacheDeferred then
        calendarEventsCache = nil
        addon.Diagnostics.Debug("Calendar events cache deferred, C_Calendar.GetDayEvent returned secret values")
    end
end

function eventData.ClearCalendarEventsCacheDeferral()
    calendarEventsCacheDeferred = nil
end

function eventData.GetNextEventOccurance(eventId)
    eventId = tonumber(eventId)

    if not calendarEventsCache then
        eventData.BuildCalendarEventsCache()
    end

    return calendarEventsCache and calendarEventsCache[eventId]
end