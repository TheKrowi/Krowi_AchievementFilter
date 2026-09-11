local _, addon = ...
addon.Gui.Calendar = addon.Gui.Calendar or {}
addon.Gui.Calendar.MonthCursor = {}
local monthCursor = addon.Gui.Calendar.MonthCursor

-- The month the Achievement Calendar frame currently shows, kept apart from the month
-- C_Calendar itself has selected so the addon never changes the state of Blizzard's calendar.
local month, year

function monthCursor.SetMonth(offset)
    month = month + offset
    while month < 1 do
        month = month + 12
        year = year - 1
    end
    while month > 12 do
        month = month - 12
        year = year + 1
    end
end

function monthCursor.SetAbsMonth(newMonth, newYear)
    month = newMonth
    year = newYear
end

function monthCursor.ResetAbsMonth()
    local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime()
    monthCursor.SetAbsMonth(currentCalendarTime.month, currentCalendarTime.year)
end

function monthCursor.GetMonthInfo(offset)
    local selectedMonthInfo = C_Calendar.GetMonthInfo()
    local selectedMonth, selectedYear = selectedMonthInfo.month, selectedMonthInfo.year
    offset = offset or 0
    offset = (year - selectedYear) * 12 + month - selectedMonth + offset
    return C_Calendar.GetMonthInfo(offset)
end