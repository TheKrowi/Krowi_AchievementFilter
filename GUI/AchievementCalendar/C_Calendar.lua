local C_CalendarMonth, C_CalendarYear;

function C_CalendarSetMonth(offset)
	C_CalendarMonth = C_CalendarMonth + offset;
	while C_CalendarMonth < 1 do
		C_CalendarMonth = 12 - C_CalendarMonth;
		C_CalendarYear = C_CalendarYear - 1;
	end
	while C_CalendarMonth > 12 do
		C_CalendarMonth = C_CalendarMonth - 12;
		C_CalendarYear = C_CalendarYear + 1;
	end
end

function C_CalendarSetAbsMonth(month, year)
	C_CalendarMonth = month;
	C_CalendarYear = year;
end

function C_CalendarResetAbsMonth()
	local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	C_CalendarSetAbsMonth(currentCalendarTime.month, currentCalendarTime.year);
end

function C_CalendarGetMonthInfo(offset)
	local selectedMonthInfo = C_Calendar.GetMonthInfo();
	local selectedMonth, selectedYear = selectedMonthInfo.month, selectedMonthInfo.year;
	offset = offset or 0;
	offset = (C_CalendarYear - selectedYear) * 12 + C_CalendarMonth - selectedMonth + offset;
	local monthInfo = C_Calendar.GetMonthInfo(offset);
	return monthInfo;
end