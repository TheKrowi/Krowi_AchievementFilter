local _, addon = ...;

-- Data taken from Blizzard_Calendar.lua and changed the names, line 160
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

KrowiAF_AchievementCalendarFrameTodayFrameMixin = {};

function KrowiAF_AchievementCalendarFrameTodayFrameMixin:OnUpdate(elapsed)
	self.Timer = self.Timer - elapsed;
	if self.Timer < 0 then
		self.Timer = self.FadeTime;
		if self.FadeIn then
			self.FadeIn = false;
		else
			self.FadeIn = true;
		end
	else
		if self.FadeIn then
			self.Glow:SetAlpha(1 - (self.Timer / self.FadeTime));
		else
			self.Glow:SetAlpha(self.Timer / self.FadeTime);
		end
	end
end

KrowiAF_AchievementCalendarFramePrevNextMonthButtonMixin = {};

function KrowiAF_AchievementCalendarFramePrevNextMonthButtonMixin:Click()
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	C_CalendarSetMonth(self.MonthOffset);
	self:GetParent():Update();
end

function KrowiAF_AchievementCalendarFramePrevNextMonthButtonMixin:OnClick()
	self:Click();
end

KrowiAF_AchievementCalendarFrameCloseButtonMixin = {};

function KrowiAF_AchievementCalendarFrameCloseButtonMixin:OnClick()
    self:GetParent():Hide();
end

function KrowiAF_AchievementCalendarFrameCloseButtonMixin:OnKeyDown(key)
    addon.Gui.HandleCloseButtonOnKeyDown(self, key, not self:GetParent().SideFrame:IsShown());
end

KrowiAF_AchievementCalendarFrameMixin = {
	MaxDaysPerMonth = 42 -- 6 weeks
};

function KrowiAF_AchievementCalendarFrameMixin:OnLoad()
	C_CalendarResetAbsMonth();

	self:LoadDayButtons();
	self:LoadSideFrame();

	self.selectedMonth = nil;
	self.selectedDay = nil;
	self.selectedYear = nil;
	self.ViewedMonth = nil;
	self.ViewedYear = nil;
end

function KrowiAF_AchievementCalendarFrameMixin:OnEvent(event)
	if event ~= "ACHIEVEMENT_EARNED" then
		return;
	end
	addon.DelayFunction("KrowiAF_AchievementCalendarFrame_OnEvent", 1, function()
		self:Update();
		if self.SelectedDayButton then
			self:SetSelectedDay(self.SelectedDayButton, true, true);
		end
	end);
end

local firstTimeOpen = true;
function KrowiAF_AchievementCalendarFrameMixin:OnShow()
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	if (not self.LockMonth and not addon.Options.db.profile.Calendar.LockMonth) or firstTimeOpen then
		local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
		C_CalendarSetAbsMonth(currentCalendarTime.month, currentCalendarTime.year);
		self:Update();
		firstTimeOpen = nil;
	end
	self.LockMonth = nil;
	PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN);
end

function KrowiAF_AchievementCalendarFrameMixin:OnHide()
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE);
end

function KrowiAF_AchievementCalendarFrameMixin:OnMouseWheel(value)
	if value > 0 then
		if self.PrevMonthButton:IsEnabled() then
			self.PrevMonthButton:Click();
		end
	else
		if self.NextMonthButton:IsEnabled() then
			self.NextMonthButton:Click();
		end
	end
end

function KrowiAF_AchievementCalendarFrameMixin:DayButtonPostLoad(buttonIndex)
	local buttons = self.DayButtons;
	local button = buttons[buttonIndex];
	button:SetID(buttonIndex);

	button:HookScript("OnEnter", function(selfFunc)
		self:SetHighlightedDay(selfFunc);
	end);
	button:HookScript("OnLeave", function()
		self:SetHighlightedDay();
	end);
	button:HookScript("OnClick", function(selfFunc)
		self:HandleDayButtonSelection(selfFunc);
	end);

	button:ClearAllPoints();
	if buttonIndex == 1 then -- First button
		button:SetPoint("TOPLEFT", self.WeekDayBackgrounds[1], "BOTTOMLEFT", 0, 0);
		return;
	end
	if mod(buttonIndex, 7) == 1 then -- First button on next row
		button:SetPoint("TOPLEFT", buttons[buttonIndex - 7], "BOTTOMLEFT", 0, 0);
		return;
	end
	button:SetPoint("TOPLEFT", buttons[buttonIndex - 1], "TOPRIGHT", 0, 0);
end

function KrowiAF_AchievementCalendarFrameMixin:LoadDayButtons()
	self.DayButtons = {};

	for i = 1, self.MaxDaysPerMonth do
		self.DayButtons[i] = CreateFrame("Button", self:GetName() .. "DayButton" .. i, self, "KrowiAF_AchievementCalendarDayButton_Template");
		self:DayButtonPostLoad(i);
	end
end

function KrowiAF_AchievementCalendarFrameMixin:LoadSideFrame()
	self.SideFrame = CreateFrame("Frame", self:GetName() .. "SideFrame", self, "KrowiAF_AchievementCalendarSideFrame_Template");
	self.SideFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, -24);
    self.SideFrame:SetPoint("BOTTOM", self, "BOTTOM", 0, 0); --320
	self.SideFrame:HookScript("OnHide", function()
		if self.SelectedDayButton and not self.LockMonth then
			self.SelectedDayButton:Deselect();
			self:HandleDayButtonSelection(self.SelectedDayButton);
		end
	end);
end

function KrowiAF_AchievementCalendarFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    KrowiAF_SavedData.RememberLastPosition["Calendar"] = {
        X = 150,
        Y = -80
    };
	addon.Gui.SetFrameToLastPosition(self, "Calendar");
end

function KrowiAF_AchievementCalendarFrameMixin:UpdateTitle()
	self.MonthName:SetText(monthNames[self.ViewedMonth]);
	self.YearName:SetText(self.ViewedYear);
end

function KrowiAF_AchievementCalendarFrameMixin:UpdatePrevMonthButtons()
	local date = C_Calendar.GetMinDate();
	if self.ViewedYear <= date.year and self.ViewedMonth <= date.month then
		self.PrevMonthButton:Disable();
		return;
	end
	self.PrevMonthButton:Enable();
end

function KrowiAF_AchievementCalendarFrameMixin:UpdateNextMonthButtons()
	local date = C_Calendar.GetMaxCreateDate();
	if self.ViewedYear >= date.year and self.ViewedMonth >= date.month then
		self.NextMonthButton:Disable();
		return;
	end
	self.NextMonthButton:Enable();
end

local function GetWeekdayIndex(index)
	return mod(index - 2 + addon.Options.db.profile.Calendar.FirstWeekDay, 7) + 1;
end

function KrowiAF_AchievementCalendarFrameMixin:UpdateWeekDays()
	for i = 1, 7 do
		local weekday = GetWeekdayIndex(i);
		self.WeekDayNames[i]:SetText(CALENDAR_WEEKDAY_NAMES[weekday]);
	end
end

function KrowiAF_AchievementCalendarFrameMixin:HideAttributes()
	self.TodayFrame:Hide();
	self.WeekdaySelectedTexture:Hide();
	self.LastDayDarkTexture:Hide();
end

local function HandlePrevSelectedDay(prevSelectedDayButton, dayButton, keepSelected)
	if prevSelectedDayButton and prevSelectedDayButton ~= dayButton and not keepSelected then
		prevSelectedDayButton:Deselect();
	end
end

local function GetDayOfWeek(index)
	return mod(index - 1, 7) + 1;
end

function KrowiAF_AchievementCalendarFrameMixin:SelectDay(dayButton, keepSelected, forceReloadAchievements)
	self.SelectedDayButton = dayButton;
	self.SelectedDay = dayButton.Day;
	self.SelectedMonth = dayButton.Month;
	self.SelectedYear = dayButton.Year;
	local weekdayBackground = self.WeekDayBackgrounds[GetDayOfWeek(dayButton:GetID())];
	local weekdaySelectedTexture = self.WeekdaySelectedTexture;
	weekdaySelectedTexture:ClearAllPoints();
	weekdaySelectedTexture:SetPoint("CENTER", weekdayBackground, "CENTER");
	weekdaySelectedTexture:Show();
	self:SetHighlightedDay(dayButton, not keepSelected or forceReloadAchievements);
end

function KrowiAF_AchievementCalendarFrameMixin:DeselectDay()
	self.SelectedDayButton = nil;
	self.SelectedDay = nil;
	self.SelectedMonth = nil;
	self.SelectedYear = nil;
	self.WeekdaySelectedTexture:Hide();
	if self.SideFrame:IsShown() then
		self.SideFrame:Hide();
	end
end

function KrowiAF_AchievementCalendarFrameMixin:HandleDayButtonSelection(dayButton, keepSelected, forceReloadAchievements)
	HandlePrevSelectedDay(self.SelectedDayButton, dayButton, keepSelected);

	if dayButton.IsSelected or keepSelected then
		self:SelectDay(dayButton, keepSelected, forceReloadAchievements);
		return;
	end

	self:DeselectDay();
end

function KrowiAF_AchievementCalendarFrameMixin:SetHighlightedDay(dayButton, overRuleLock)
	if self.SelectedDayButton and not overRuleLock then -- Acts as a lock to keep the side frame open when a day is selected
		return;
	end
	self.HighlightedDayButton = dayButton;
	self.HighlightedDay = dayButton and dayButton.Day;
	self.HighlightedMonth = dayButton and dayButton.Month;
	self.HighlightedYear = dayButton and dayButton.Year;
	self.HighlightedAchievements = dayButton and dayButton.Achievements;
	self.HighlightedPoints = dayButton and dayButton.Points;
	if self.HighlightedAchievements then
		if not self.SideFrame:IsShown() then
			self.SideFrame:Show();
			return;
		end
		self.SideFrame:Update();
		return;
	end
	self.SideFrame:Hide();
end

function KrowiAF_AchievementCalendarFrameMixin:SetToday(dayButton)
	local todayFrame = self.TodayFrame;
	todayFrame:SetParent(dayButton);
	todayFrame:ClearAllPoints();
	todayFrame:SetPoint("CENTER", dayButton, "CENTER");
	todayFrame:Show();
	local darkFrame = dayButton.DarkFrame;
	todayFrame:SetFrameLevel(darkFrame:GetFrameLevel() + 1);
end

function KrowiAF_AchievementCalendarFrameMixin:UpdateDay(index, day, month, year, isSelected, isToday, darkTopFlags, darkBottomFlags)
	local button = self.DayButtons[index];
	local dateLabel = button.DateFrame.Date;

	button:Clear();

	dateLabel:SetText(day);
	button.Day = day;
	button.Month = month;
	button.Year = year;

	if darkTopFlags and darkBottomFlags then
		button:SetDarkFrameCoords(darkDayTopTexCoords[darkTopFlags], darkDayBottomTexCoords[darkBottomFlags]);
	end

	if isSelected then
		button:Select();
		self:HandleDayButtonSelection(button, true);
	end

	if isToday then
		self:SetToday(button);
	end
end

function KrowiAF_AchievementCalendarFrameMixin:SetLastDay(dayButton)
	self.LastDayDarkTexture:SetParent(dayButton);
	self.LastDayDarkTexture:ClearAllPoints();
	self.LastDayDarkTexture:SetPoint("BOTTOMRIGHT", dayButton, "BOTTOMRIGHT");
	self.LastDayDarkTexture:Show();
end

local function GetPrevMonthDarkFlags(firstWeekday, buttonIndex)
	local darkTopFlags, darkBottomFlags;
	darkTopFlags = darkFlagPrevMonth + darkFlagSideTop;
	darkBottomFlags = darkFlagPrevMonth + darkFlagSideBottom;
	if buttonIndex == 1 then
		return darkTopFlags + darkFlagSideLeft, darkBottomFlags + darkFlagSideLeft;
	end
	if buttonIndex == firstWeekday - 1 then
		return darkTopFlags + darkFlagSideRight, darkBottomFlags + darkFlagSideRight;
	end
	return darkTopFlags, darkBottomFlags;
end

function KrowiAF_AchievementCalendarFrameMixin:SetPrevMonthDays(prevMonth, prevYear, prevNumDays, firstWeekday, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
	local viewablePrevMonthDays = mod(firstWeekday - addon.Options.db.profile.Calendar.FirstWeekDay - 1 + 7, 7);
	local day = prevNumDays - viewablePrevMonthDays;
	local isSelectedMonth = selectedMonth == prevMonth and selectedYear == prevYear;
	local isThisMonth = presentMonth == prevMonth and presentYear == prevYear;
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while GetWeekdayIndex(buttonIndex) ~= firstWeekday do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;
		darkTopFlags, darkBottomFlags = GetPrevMonthDarkFlags(firstWeekday, buttonIndex);

		self:UpdateDay(buttonIndex, day, prevMonth, prevYear, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);

		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end

	return buttonIndex;
end

function KrowiAF_AchievementCalendarFrameMixin:SetMonthDays(month, year, numDays, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
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

local function GetNextMonthDarkFlags(self, day, buttonIndex, checkCorners)
	local darkTopFlags, darkBottomFlags;
	darkTopFlags = darkFlagNextMonth;
	darkBottomFlags = darkFlagNextMonth;
	-- left darkness
	local dayOfWeek = GetDayOfWeek(buttonIndex);
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
	return darkTopFlags, darkBottomFlags;
end

function KrowiAF_AchievementCalendarFrameMixin:SetNextMonthDays(nextMonth, nextYear, selectedDay, selectedMonth, selectedYear, presentDay, presentMonth, presentYear, buttonIndex)
	local day = 1;
	local isSelectedMonth = selectedMonth == nextMonth and selectedYear == nextYear;
	local isThisMonth = presentMonth == nextMonth and presentYear == nextYear;
	local checkCorners = mod(buttonIndex, 7) ~= 1;	-- last day of the viewed month is not the last day of the week
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while buttonIndex <= self.MaxDaysPerMonth do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;
		darkTopFlags, darkBottomFlags = GetNextMonthDarkFlags(self, day, buttonIndex, checkCorners);

		self:UpdateDay(buttonIndex, day, nextMonth, nextYear, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);

		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end
end

local function GetMonthInfo(offset)
	local monthInfo = C_CalendarGetMonthInfo(offset);
	return monthInfo.month, monthInfo.year, monthInfo.numDays, monthInfo.firstWeekday;
end

function KrowiAF_AchievementCalendarFrameMixin:Update()
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
	self:UpdatePrevMonthButtons();
	self:UpdateNextMonthButtons();
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

function KrowiAF_AchievementCalendarFrameMixin:GetEarnedAchievementsInRange()
    local firstDate = GetSecondsSince(self.DayButtons[1]);
    local lastDate = GetSecondsSince(self.DayButtons[self.MaxDaysPerMonth]);
	return addon.Data.SavedData.AchievementData.GetEarnedByCharacterWithinDateRange(UnitGUID("player"), firstDate, lastDate);
end

function KrowiAF_AchievementCalendarFrameMixin:SetAchievementsAndPoints(numAchievements, points)
	self.MonthAchievementsAndPoints:SetText(tostring(numAchievements) .. " " .. addon.L["Achievements"] .. " (" .. tostring(points) .. " " .. addon.L["Points"] .. ")");
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

function KrowiAF_AchievementCalendarFrameMixin:AddAchievementsToDays()
    local achievements = self:GetEarnedAchievementsInRange();
    local firstDate = GetSecondsSince(self.DayButtons[1]);
	self.NumAchievements, self.TotalPoints = 0, 0;
	local points, icon;
	local date, dayButtonIndex, dayButton;
    for _, achievement in next, achievements do
        _, _, points, _, _, _, _, _, _, icon = addon.GetAchievementInfo(achievement.Id);
        date = achievement.Date;
        dayButtonIndex = floor((date - firstDate) / 86400 + 1); -- 86400 seconds in a day, floor to take changes in DST which would result in x.xx
		dayButton = self.DayButtons[dayButtonIndex];
        AddAchievementToButton(dayButton, achievement.Id, icon, points);
		if not dayButton.Dark then
			self.NumAchievements = self.NumAchievements + 1;
			self.TotalPoints = self.TotalPoints + points;
		end
    end
	self:SetAchievementsAndPoints(self.NumAchievements, self.TotalPoints);
end