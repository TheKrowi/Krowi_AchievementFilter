-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar.Frame = {};
local frame = addon.GUI.Calendar.Frame;

-- Data taken from Blizzard_Calendar.lua and changed the names, line 156
local darkFlagPrevMonth = 0x0001;
local darkFlagNextMonth = 0x0002;
local darkFlagCorner = 0x0004;
local darkFlagSideLeft = 0x0008;
local darkFlagSideRight = 0x0010;
local darkFlagSideTop = 0x0020;
local darkFlagSideBottom = 0x0040;
local darkFlagPrevMonthTop = darkFlagPrevMonth + darkFlagSideTop;
local darkFlagPrevMonthTopLeft = darkFlagPrevMonthTop + darkFlagSideLeft;
local darkFlagPrevMonthTopRight = darkFlagPrevMonthTop + darkFlagSideRight;
local darkFlagPrevMonthTopLeftRight = darkFlagPrevMonthTopLeft + darkFlagSideRight;
local darkFlagNextMonthTop = darkFlagNextMonth + darkFlagSideTop;
local darkFlagNextMonthTopLeft = darkFlagNextMonthTop + darkFlagSideLeft;
local darkFlagNextMonthTopRight = darkFlagNextMonthTop + darkFlagSideRight;
local darkFlagNextMonthCorner = darkFlagNextMonth + darkFlagCorner;
local darkFlagNextMonthCornerTop = darkFlagNextMonthCorner + darkFlagSideTop;
local darkFlagNextMonthCornerRight = darkFlagNextMonthCorner + darkFlagSideRight;
local darkFlagNextMonthCornerTopLeft = darkFlagNextMonthCornerTop + darkFlagSideLeft;
local darkFlagNextMonthCornerTopLeftRight = darkFlagNextMonthCornerTopLeft + darkFlagSideRight;
local darkFlagPrevMonthBottom = darkFlagPrevMonth + darkFlagSideBottom;
local darkFlagPrevMonthBottomLeft = darkFlagPrevMonthBottom + darkFlagSideLeft;
local darkFlagPrevMonthBottomRight = darkFlagPrevMonthBottom + darkFlagSideRight;
local darkFlagPrevMonthBottomLeftRight = darkFlagPrevMonthBottomLeft + darkFlagSideRight;
local darkFlagNextMonthBottom = darkFlagNextMonth + darkFlagSideBottom;
local darkFlagNextMonthBottomLeft = darkFlagNextMonthBottom + darkFlagSideLeft;
local darkFlagNextMonthBottomRight = darkFlagNextMonthBottom + darkFlagSideRight;
local darkFlagNextMonthBottomLeftRight = darkFlagNextMonthBottomLeft + darkFlagSideRight;
local darkFlagNextMonthLeftRight = darkFlagNextMonth + darkFlagSideLeft + darkFlagSideRight;
local darkFlagNextMonthLeft = darkFlagNextMonth + darkFlagSideLeft;
local darkFlagNextMonthRight = darkFlagNextMonth + darkFlagSideRight;
local darkDayTopTexCoords = {
	[darkFlagPrevMonthTop] = {left = 90 / 512, right = 180 / 512, top = 0.0, bottom = 45 / 256},
	[darkFlagPrevMonthTopLeft] = {left = 0.0, right = 90 / 512, top = 0.0, bottom = 45 / 256 - 0.001},
	[darkFlagPrevMonthTopRight] = {left = 90 / 512, right = 0.0, top = 0.0, bottom = 45 / 256 - 0.001},
	[darkFlagPrevMonthTopLeftRight] = {left = 0.0, right = 90 / 512, top = 180 / 256, bottom = 225 / 256 - 0.001},
	[darkFlagNextMonth] = {left = 90 / 512, right = 180 / 512, top = 45 / 256, bottom = 90 / 256},
	[darkFlagNextMonthLeft] = {left = 90 / 512, right = 0.0, top = 90 / 256, bottom = 135 / 256},
	[darkFlagNextMonthRight] = {left = 0.0, right = 90 / 512, top = 90 / 256, bottom = 135 / 256 - 0.001},
	[darkFlagNextMonthTop] = {left = 90 / 512, right = 180 / 512, top = 0.0, bottom = 45 / 256},
	[darkFlagNextMonthTopLeft] = {left = 0.0, right = 90 / 512, top = 0.0, bottom = 45 / 256 - 0.001},
	[darkFlagNextMonthTopRight] = {left = 90 / 512, right = 0.0, top = 0.0, bottom = 45 / 256 - 0.001},
	[darkFlagNextMonthCorner] = {left = 90 / 512, right = 180 / 512 - 0.001, top = 135 / 256, bottom = 180 / 256},
	[darkFlagNextMonthCornerTop] = {left = 0.0, right = 90 / 512, top = 135 / 256, bottom = 180 / 256 - 0.001},
	[darkFlagNextMonthCornerRight] = {left = 180 / 512, right = 270 / 512 - 0.001, top = 45 / 256, bottom = 90 / 256 - 0.001},
	[darkFlagNextMonthCornerTopLeft] = {left = 0.0, right = 90 / 512, top = 45 / 256, bottom = 90 / 256},
	[darkFlagNextMonthCornerTopLeftRight] = {left = 180 / 512, right = 90 / 512, top = 225 / 256, bottom = 180 / 256}
};
local darkDayBottomTexCoords = {
	[darkFlagPrevMonthBottom] = {left = 90 / 512, right = 180 / 512, top = 45 / 256, bottom = 0.0},
	[darkFlagPrevMonthBottomLeft] = {left = 0.0, right = 90 / 512, top = 45 / 256 - 0.001, bottom = 0.0},
	[darkFlagPrevMonthBottomRight] = {left = 90 / 512, right = 0.0, top = 90 / 256, bottom = 45 / 256},
	[darkFlagPrevMonthBottomLeftRight] = {left = 90 / 512, right = 180 / 512, top = 180 / 256, bottom = 225 / 256},
	[darkFlagNextMonth] = {left = 90 / 512, right = 180 / 512, top = 45 / 256, bottom = 90 / 256},
	[darkFlagNextMonthLeft] = {left = 90 / 512, right = 0.0, top = 90 / 256, bottom = 135 / 256},
	[darkFlagNextMonthRight] = {left = 0.0, right = 90 / 512, top = 90 / 256, bottom = 135 / 256},
	[darkFlagNextMonthBottom] = {left = 90 / 512, right = 180 / 512, top = 45 / 256, bottom = 0.0},
	[darkFlagNextMonthBottomLeft] = {left = 0.0, right = 90 / 512, top = 45 / 256 - 0.001, bottom = 0.0},
	[darkFlagNextMonthBottomRight] = {left = 90 / 512, right = 0.0, top = 45 / 256 - 0.001, bottom = 0.0},
	[darkFlagNextMonthBottomLeftRight] = {left = 0.0, right = 90 / 512, top = 225 / 256, bottom = 180 / 256},
	[darkFlagNextMonthLeftRight] = {left = 180 / 512, right = 270 / 512 - 0.001, top = 0.0, bottom = 45 / 256}
};
local monthNames = {
    addon.L["January"],
    addon.L["February"],
    addon.L["March"],
    addon.L["April"],
    addon.L["May"],
    addon.L["June"],
    addon.L["July"],
    addon.L["August"],
    addon.L["September"],
    addon.L["October"],
    addon.L["November"],
    addon.L["December"]
};

local maxDaysPerMonth = 42; -- 6 weeks

frame.__index = frame; -- Used to inject all the namespace functions to the frame
function frame:Load()
	local _frame = CreateFrame("Frame", "KrowiAF_AchievementCalendarFrame", UIParent, "KrowiAF_AchievementCalendarFrame_Template");
	addon.Util.InjectMetatable(_frame, frame); -- Inject all the namespace functions to the frame

	addon.GUI.Calendar.Frame = _frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_AchievementCalendarFrameTodayFrame_OnUpdate(self, elapsed)
	self.timer = self.timer - elapsed;
	if self.timer < 0 then
		self.timer = self.fadeTime;
		if self.fadein then
			self.fadein = false;
		else
			self.fadein = true;
		end
	else
		if self.fadein then
			self.Glow:SetAlpha(1 - (self.timer / self.fadeTime));
		else
			self.Glow:SetAlpha(self.timer / self.fadeTime);
		end
	end
end

function KrowiAF_AchievementCalendarFramePrevMonthButton_OnClick()
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	C_Calendar.SetMonth(-1);
	addon.GUI.Calendar.Frame:Update();
end

function KrowiAF_AchievementCalendarFrameNextMonthButton_OnClick()
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	C_Calendar.SetMonth(1);
	addon.GUI.Calendar.Frame:Update();
end

function KrowiAF_AchievementCalendarFrame_OnLoad(self)
	self:RegisterEvent("ACHIEVEMENT_EARNED");

	if not IsAddOnLoaded("Blizzard_Calendar") then -- This is to make sure we get the 1st day of the week correct
        LoadAddOn("Blizzard_Calendar");
    end

	self.DayButtons = {};

	local name = self:GetName()
	for i = 1, maxDaysPerMonth do
		self.DayButtons[i] = CreateFrame("Button", name .. "DayButton" .. i, self, "KrowiAF_AchievementCalendarDayButton_Template");
		addon.GUI.CalendarButton:PostLoadButton(self.DayButtons, i);
	end

	self.selectedMonth = nil;
	self.selectedDay = nil;
	self.selectedYear = nil;
	self.ViewedMonth = nil;
	self.ViewedYear = nil;

	tinsert(UISpecialFrames, self:GetName());
end

function KrowiAF_AchievementCalendarFrame_OnEvent(self, event, ...)
	if event == "ACHIEVEMENT_EARNED" then
		frame:Update();
	end
end

function KrowiAF_AchievementCalendarFrame_OnShow(self)
	-- if addon.GUI.Calendar.SideFrame:IsShown() then
	-- 	addon.GUI.Calendar.SideFrame:Hide();
	-- end
	-- self.selectedDayButton = nil;

	local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	C_Calendar.SetAbsMonth(currentCalendarTime.month, currentCalendarTime.year);
	self:Update();
	PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN);
end

function KrowiAF_AchievementCalendarFrame_OnHide(self)
	PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE);
end

function KrowiAF_AchievementCalendarFrame_OnMouseWheel(self, value)
	if value > 0 then
		if addon.GUI.Calendar.Frame.PrevMonthButton:IsEnabled() then
			KrowiAF_AchievementCalendarFramePrevMonthButton_OnClick();
		end
	else
		if addon.GUI.Calendar.Frame.NextMonthButton:IsEnabled() then
			KrowiAF_AchievementCalendarFrameNextMonthButton_OnClick();
		end
	end
end

local function GetWeekdayIndex(index)
	return mod(index - 2 + CALENDAR_FIRST_WEEKDAY, 7) + 1;
end

local function GetDayOfWeek(index)
	return mod(index - 1, 7) + 1;
end

local function GetMonthInfo(offset)
	local monthInfo = C_Calendar.GetMonthInfo(offset);
	return monthInfo.month, monthInfo.year, monthInfo.numDays, monthInfo.firstWeekday;
end

function frame:UpdateTitle()
	self.MonthName:SetText(monthNames[self.ViewedMonth]);
	self.YearName:SetText(self.ViewedYear);
end

function frame:UpdatePrevNextMonthButtons()
	local date = C_Calendar.GetMinDate();
	local testMonth = date.month;
	local testYear = date.year;
	self.PrevMonthButton:Enable();
	if self.ViewedYear <= testYear and self.ViewedMonth <= testMonth then
		self.PrevMonthButton:Disable();
	end

	date = C_Calendar.GetMaxCreateDate();
	testMonth = date.month;
	testYear = date.year;
	self.NextMonthButton:Enable();
	if self.ViewedYear >= testYear and self.ViewedMonth >= testMonth then
		self.NextMonthButton:Disable();
	end
end

function frame:UpdateWeekDays()
	for i = 1, 7 do
		local weekday = GetWeekdayIndex(i);
		self.WeekDayNames[i]:SetText(CALENDAR_WEEKDAY_NAMES[weekday]);
	end
end

function frame:HideAttributes()
	self.TodayFrame:Hide();
	self.WeekdaySelectedTexture:Hide();
	self.LastDayDarkTexture:Hide();
end

function frame:SetSelectedDay(dayButton)
	local prevSelectedDayButton = self.SelectedDayButton;
	if prevSelectedDayButton and prevSelectedDayButton ~= dayButton then
		prevSelectedDayButton:Deselect();
	end

	local weekdaySelectedTexture = self.WeekdaySelectedTexture;
	if prevSelectedDayButton ~= dayButton then
		self.SelectedDayButton = dayButton;
		local weekdayBackground = self.WeekDayBackgrounds[GetDayOfWeek(dayButton:GetID())];
		weekdaySelectedTexture:ClearAllPoints();
		weekdaySelectedTexture:SetPoint("CENTER", weekdayBackground, "CENTER");
		weekdaySelectedTexture:Show();
		self:SetHighlightedDay(dayButton, true);
	else
		self.SelectedDayButton = nil;
		weekdaySelectedTexture:Hide();
	end
end

function frame:SetHighlightedDay(dayButton, overRuleLock)
	if self.SelectedDayButton and not overRuleLock then -- Acts as a lock to keep the side frame open when a day is selected
		return;
	end
	self.HighlightedDayButton = dayButton;
	if dayButton and dayButton.Achievements then
		if addon.GUI.Calendar.SideFrame:IsShown() then
			addon.GUI.Calendar.SideFrame:Hide();
		end
		addon.GUI.Calendar.SideFrame:Show();
	else
		addon.GUI.Calendar.SideFrame:Hide();
	end
end

function frame:SetToday(dayButton)
	local todayFrame = self.TodayFrame;
	todayFrame:SetParent(dayButton);
	todayFrame:ClearAllPoints();
	todayFrame:SetPoint("CENTER", dayButton, "CENTER");
	todayFrame:Show();
	local darkFrame = dayButton.DarkFrame;
	todayFrame:SetFrameLevel(darkFrame:GetFrameLevel() + 1);
end

function frame:UpdateDay(index, day, month, year, isSelected, isToday, darkTopFlags, darkBottomFlags)
	local button = self.DayButtons[index];
	local dateLabel = button.DateFrame.Date;
	local darkFrame = button.DarkFrame;
	local darkTop = darkFrame.Top;
	local darkBottom = darkFrame.Bottom;

	dateLabel:SetText(day);
	button.Day = day;
	button.Month = month;
	button.Year = year;

	button.Dark = darkTopFlags and darkBottomFlags;
	if button.Dark then
		local tcoords = darkDayTopTexCoords[darkTopFlags];
		darkTop:SetTexCoord(tcoords.left, tcoords.right, tcoords.top, tcoords.bottom);
		tcoords = darkDayBottomTexCoords[darkBottomFlags];
		darkBottom:SetTexCoord(tcoords.left, tcoords.right, tcoords.top, tcoords.bottom);
		darkFrame:Show();
	else
		darkFrame:Hide();
	end

	if isSelected then
		frame:SetSelectedDay(button);
	end

	if isToday then
		self:SetToday(button);
	end

	button:Clear();
end

function frame:SetLastDay(dayButton)
	self.LastDayDarkTexture:SetParent(dayButton);
	self.LastDayDarkTexture:ClearAllPoints();
	self.LastDayDarkTexture:SetPoint("BOTTOMRIGHT", dayButton, "BOTTOMRIGHT");
	self.LastDayDarkTexture:Show();
end

function frame:SetPrevMonthDays(prevMonth, prevYear, prevNumDays, firstWeekday, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
	local viewablePrevMonthDays = mod(firstWeekday - CALENDAR_FIRST_WEEKDAY - 1 + 7, 7);
	local day = prevNumDays - viewablePrevMonthDays;
	local isSelectedMonth = selectedMonth == prevMonth and selectedYear == prevYear;
	local isThisMonth = presentMonth == prevMonth and presentYear == prevYear;
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while GetWeekdayIndex(buttonIndex) ~= firstWeekday do
		darkTopFlags = darkFlagPrevMonth + darkFlagSideTop;
		darkBottomFlags = darkFlagPrevMonth + darkFlagSideBottom;
		if buttonIndex == 1 then
			darkTopFlags = darkTopFlags + darkFlagSideLeft;
			darkBottomFlags = darkBottomFlags + darkFlagSideLeft;
		end
		if buttonIndex == firstWeekday - 1 then
			darkTopFlags = darkTopFlags + darkFlagSideRight;
			darkBottomFlags = darkBottomFlags + darkFlagSideRight;
		end

		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;

		self:UpdateDay(buttonIndex, day, prevMonth, prevYear, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);

		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end

	return buttonIndex;
end

function frame:SetMonthDays(month, year, numDays, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
	local day = 1;
	local isSelectedMonth = selectedMonth == month and selectedYear == year;
	local isThisMonth = presentMonth == month and presentYear == year;
	local isSelectedDay, isToday;
	while day <= numDays do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;

		self:UpdateDay(buttonIndex, day, month, year, isSelectedDay, isToday);

		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end
	if buttonIndex < 36 and mod(buttonIndex - 1, 7) ~= 0 then
		self:SetLastDay(self.DayButtons[buttonIndex - 1]);
	end

	return buttonIndex;
end

function frame:SetNextMonthDays(nextMonth, nextYear, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
	local day = 1;
	local isSelectedMonth = selectedMonth == nextMonth and selectedYear == nextYear;
	local isThisMonth = presentMonth == nextMonth and presentYear == nextYear;
	local dayOfWeek;
	local checkCorners = mod(buttonIndex, 7) ~= 1;	-- last day of the viewed month is not the last day of the week
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while buttonIndex <= maxDaysPerMonth do
		darkTopFlags = darkFlagNextMonth;
		darkBottomFlags = darkFlagNextMonth;
		-- left darkness
		dayOfWeek = GetDayOfWeek(buttonIndex);
		if dayOfWeek == 1 or day == 1 then
			darkTopFlags = darkTopFlags + darkFlagSideLeft;
			darkBottomFlags = darkBottomFlags + darkFlagSideLeft;
		end
		-- right darkness
		if dayOfWeek == 7 then
			darkTopFlags = darkTopFlags + darkFlagSideRight;
			darkBottomFlags = darkBottomFlags + darkFlagSideRight;
		end
		-- top darkness
		if not self.DayButtons[buttonIndex - 7].Dark then
			-- this day last week was not dark
			darkTopFlags = darkTopFlags + darkFlagSideTop;
		end
		-- bottom darkness
		if not self.DayButtons[buttonIndex + 7] then
			-- this day next week does not exist
			darkBottomFlags = darkBottomFlags + darkFlagSideBottom;
		end
		-- corner stuff
		if checkCorners and (day == 1 or day == 7 or day == 8) then
			darkTopFlags = darkTopFlags + darkFlagCorner;
		end

		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;

		self:UpdateDay(buttonIndex, day, nextMonth, nextYear, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);

		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end
end

function frame:Update()
	local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	local presentDay = currentCalendarTime.monthDay;
	local presentMonth = currentCalendarTime.month;
	local presentYear = currentCalendarTime.year;

	local prevMonth, prevYear, prevNumDays = GetMonthInfo(-1);
	local month, year, numDays, firstWeekday = GetMonthInfo();
	local nextMonth, nextYear = GetMonthInfo(1);

	self.ViewedMonth = month;
	self.ViewedYear = year;

	local selectedDay = self.SelectedDay;
	local selectedMonth = self.SelectedMonth;
	local selectedYear = self.SelectedYear;

	self:UpdateTitle();
	self:UpdatePrevNextMonthButtons();
	self:UpdateWeekDays();
	self:HideAttributes();

	local buttonIndex = 1;
	buttonIndex = self:SetPrevMonthDays(prevMonth, prevYear, prevNumDays, firstWeekday, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex);
	buttonIndex = self:SetMonthDays(month, year, numDays, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex);
	self:SetNextMonthDays(nextMonth, nextYear, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex);

    self:AddAchievementsToDays();
end

local function GetSecondsSince(dayButton)
    return time{year = dayButton.Year, month = dayButton.Month, day = dayButton.Day};
end

function frame:GetEarnedAchievementsInRange()
    local firstDate = GetSecondsSince(self.DayButtons[1]);
    local lastDate = GetSecondsSince(self.DayButtons[maxDaysPerMonth]);

    local achievementIds = {};
    for achievementId, date in next, SavedData.Characters[UnitGUID("player")].CompletedAchievements do
        if date >= firstDate and date <= lastDate then
            tinsert(achievementIds, achievementId);
        end
    end
    return achievementIds;
end

local function AddAchievementToButton(dayButton, achievementId, icon, points)
	dayButton.Achievements = dayButton.Achievements or {};
	dayButton.Points = dayButton.Points + points;
	tinsert(dayButton.Achievements, achievementId);
	local achievementButtons = dayButton.AchievementButtons;
	local numAchievements = #dayButton.Achievements;
	local achievementButton;
	if numAchievements <= 4 then
		achievementButton = achievementButtons[numAchievements];
		achievementButton.Texture:SetTexture(icon);
		achievementButton:Show();
	else
		dayButton.More:Show();
	end
end

function frame:SetAchievementsAndPoints(numAchievements, points)
	self.MonthAchievementsAndPoints:SetText(tostring(numAchievements) .. " " .. addon.L["Achievements"] .. " (" .. tostring(points) .. " " .. addon.L["Points"] .. ")");
end

function frame:AddAchievementsToDays()
    local achievementIds = self:GetEarnedAchievementsInRange();
    local firstDate = GetSecondsSince(self.DayButtons[1]);
	local numAchievements, totalPoints = 0, 0;
	local points, icon;
	local date, dayButtonIndex, dayButton;
    for _, achievementId in next, achievementIds do
        _, _, points, _, _, _, _, _, _, icon = addon.GetAchievementInfo(achievementId);
        date = SavedData.Characters[UnitGUID("player")].CompletedAchievements[achievementId];
        dayButtonIndex = floor((date - firstDate) / 86400 + 1); -- 86400 seconds in a day, floor to take changes in DST which would result in x.xx
		dayButton = self.DayButtons[dayButtonIndex];
        AddAchievementToButton(dayButton, achievementId, icon, points);
		if not dayButton.Dark then
			numAchievements = numAchievements + 1;
			totalPoints = totalPoints + points;
		end
    end
	self:SetAchievementsAndPoints(numAchievements, totalPoints);
end