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

KrowiAF_AchievementCalendarFrameTodayFrameMixin = {};

function KrowiAF_AchievementCalendarFrameTodayFrameMixin:OnUpdate(elapsed)
	self.Timer = self.Timer - elapsed;
	if self.Timer < 0 then
		self.Timer = self.FadeTime;
		self.FadeIn = not self.FadeIn;
		return;
	end
	local fadeTime = self.Timer / self.FadeTime;
	self.Glow:SetAlpha(self.FadeIn and (1 - fadeTime) or fadeTime);
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

KrowiAF_AchievementCalendarFrameMixin = {
	MaxDaysPerMonth = 42 -- 6 weeks
};

local function SetHighlightedDay(self, dayButton, overRuleLock)
	if self.SelectedDayButton and not overRuleLock then -- Acts as a lock to keep the side frame open when a day is selected
		return;
	end
	self.HighlightedDayButton = dayButton;
	self.HighlightedDay = dayButton and dayButton.Day;
	self.HighlightedMonth = dayButton and dayButton.Month;
	self.HighlightedYear = dayButton and dayButton.Year;
	self.HighlightedAchievements = dayButton and dayButton.Achievements;
	self.HighlightedPoints = dayButton and dayButton.Points;
	if not self.HighlightedAchievements then
		self.SideFrame:Hide();
		return;
	end
	if not self.SideFrame:IsShown() then
		self.SideFrame:Show();
		return;
	end
	self.SideFrame:Update();
end

local function HandlePrevSelectedDay(prevSelectedDayButton, dayButton, keepSelected)
	if prevSelectedDayButton and prevSelectedDayButton ~= dayButton and not keepSelected then
		prevSelectedDayButton:Deselect();
	end
end

local function GetDayOfWeek(index)
	return mod(index - 1, 7) + 1;
end

local function SelectDay(self, dayButton, keepSelected, forceReloadAchievements)
	self.SelectedDayButton = dayButton;
	self.SelectedDay = dayButton.Day;
	self.SelectedMonth = dayButton.Month;
	self.SelectedYear = dayButton.Year;
	local weekdayBackground = self.WeekDayBackgrounds[GetDayOfWeek(dayButton:GetID())];
	local weekdaySelectedTexture = self.WeekdaySelectedTexture;
	weekdaySelectedTexture:ClearAllPoints();
	weekdaySelectedTexture:SetPoint("CENTER", weekdayBackground, "CENTER");
	weekdaySelectedTexture:Show();
	SetHighlightedDay(self, dayButton, not keepSelected or forceReloadAchievements);
end

local function DeselectDay(self)
	self.SelectedDayButton = nil;
	self.SelectedDay = nil;
	self.SelectedMonth = nil;
	self.SelectedYear = nil;
	self.WeekdaySelectedTexture:Hide();
	if self.SideFrame:IsShown() then
		self.SideFrame:Hide();
	end
end

local function HandleDayButtonSelection(self, dayButton, keepSelected, forceReloadAchievements)
	HandlePrevSelectedDay(self.SelectedDayButton, dayButton, keepSelected);

	if dayButton.IsSelected or keepSelected then
		SelectDay(self, dayButton, keepSelected, forceReloadAchievements);
		return;
	end

	DeselectDay(self);
end

local function LoadDayButton(self, buttonIndex)
	self.DayButtons[buttonIndex] = CreateFrame("Button", self:GetName() .. "DayButton" .. buttonIndex, self, "KrowiAF_AchievementCalendarDayButton_Template");
	local buttons = self.DayButtons;
	local button = buttons[buttonIndex];
	button:SetID(buttonIndex);

	button:HookScript("OnEnter", function(selfFunc)
		SetHighlightedDay(self, selfFunc);
	end);
	button:HookScript("OnLeave", function()
		SetHighlightedDay(self);
	end);
	button:HookScript("OnClick", function(selfFunc)
		HandleDayButtonSelection(self, selfFunc);
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

local function LoadDayButtons(self)
	self.DayButtons = {};

	for i = 1, self.MaxDaysPerMonth do
		LoadDayButton(self, i);
	end
end

local function LoadSideFrame(self)
	self.SideFrame = CreateFrame("Frame", self:GetName() .. "SideFrame", self, "KrowiAF_AchievementCalendarSideFrame_Template");
	local sideFrame = self.SideFrame;
	sideFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, -24);
    sideFrame:SetPoint("BOTTOM", self, "BOTTOM", 0, 0); --320
	sideFrame:HookScript("OnHide", function()
		if self.SelectedDayButton and not self.LockMonth then
			self.SelectedDayButton:Deselect();
			HandleDayButtonSelection(self, self.SelectedDayButton);
		end
	end);
end

function KrowiAF_AchievementCalendarFrameMixin:OnLoad()
	addon.Gui:RegisterFrameForClosing(self);

	C_CalendarResetAbsMonth();

	LoadDayButtons(self);
	LoadSideFrame(self);

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
	addon.Util.DelayFunction("KrowiAF_AchievementCalendarFrame_OnEvent", 1, function()
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
	elseif value < 0 then
		if self.NextMonthButton:IsEnabled() then
			self.NextMonthButton:Click();
		end
	end
end

function KrowiAF_AchievementCalendarFrameMixin:ResetPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    KrowiAF_SavedData.RememberLastPosition["Calendar"] = {
        X = 150,
        Y = -80
    };
	addon.Gui:SetFrameToLastPosition(self, "Calendar");
end

local function GetMonthInfo(offset)
	local monthInfo = C_CalendarGetMonthInfo(offset);
	return monthInfo.year, monthInfo.month, monthInfo.numDays, monthInfo.firstWeekday;
end

local function UpdateTitle(self)
	self.MonthName:SetText(addon.MonthNames[self.ViewedMonth]);
	self.YearName:SetText(self.ViewedYear);
end

local function UpdatePrevMonthButtons(self)
	local date = C_Calendar.GetMinDate();
	if self.ViewedYear <= date.year and self.ViewedMonth <= date.month then
		self.PrevMonthButton:Disable();
		return;
	end
	self.PrevMonthButton:Enable();
end

local function UpdateNextMonthButtons(self)
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

local function UpdateWeekDays(self)
	for i = 1, 7 do
		local weekday = GetWeekdayIndex(i);
		self.WeekDayNames[i]:SetText(CALENDAR_WEEKDAY_NAMES[weekday]);
	end
end

local function HideAttributes(self)
	self.TodayFrame:Hide();
	self.WeekdaySelectedTexture:Hide();
	self.LastDayDarkTexture:Hide();
end

function KrowiAF_AchievementCalendarFrameMixin:SetToday(dayButton) -- Public for skinning
	local todayFrame = self.TodayFrame;
	todayFrame:SetParent(dayButton);
	todayFrame:ClearAllPoints();
	todayFrame:SetPoint("CENTER", dayButton, "CENTER");
	todayFrame:Show();
	local darkFrame = dayButton.DarkFrame;
	todayFrame:SetFrameLevel(darkFrame:GetFrameLevel() + 1);
end

local function UpdateDay(self, index, day, month, year, isSelected, isToday, darkTopFlags, darkBottomFlags)
	local button = self.DayButtons[index];
	button:Clear();
	button:SetDate(year, month, day);
	button:SetDarkFrameCoords(darkDayTopTexCoords[darkTopFlags], darkDayBottomTexCoords[darkBottomFlags]);

	if isSelected then
		button:Select();
		HandleDayButtonSelection(self, button, true);
	end

	if isToday then
		self:SetToday(button);
	end
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

local function SetPrevMonthDays(self, year, month, numDays, firstWeekday, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex)
	local viewablePrevMonthDays = mod(firstWeekday - addon.Options.db.profile.Calendar.FirstWeekDay - 1 + 7, 7);
	local day = numDays - viewablePrevMonthDays;
	local isSelectedMonth = selectedMonth == month and selectedYear == year;
	local isThisMonth = presentMonth == month and presentYear == year;
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while GetWeekdayIndex(buttonIndex) ~= firstWeekday do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;
		darkTopFlags, darkBottomFlags = GetPrevMonthDarkFlags(firstWeekday, buttonIndex);
		UpdateDay(self, buttonIndex, day, month, year, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);
		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end

	return buttonIndex;
end

local function SetLastDay(self, dayButton)
	self.LastDayDarkTexture:SetParent(dayButton);
	self.LastDayDarkTexture:ClearAllPoints();
	self.LastDayDarkTexture:SetPoint("BOTTOMRIGHT", dayButton, "BOTTOMRIGHT");
	self.LastDayDarkTexture:Show();
end

local function SetMonthDays(self, year, month, numDays, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex)
	local day = 1;
	local isSelectedMonth = selectedMonth == month and selectedYear == year;
	local isThisMonth = presentMonth == month and presentYear == year;
	local isSelectedDay, isToday;
	while day <= numDays do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;
		UpdateDay(self, buttonIndex, day, month, year, isSelectedDay, isToday);
		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end
	if buttonIndex < 36 and mod(buttonIndex - 1, 7) ~= 0 then
		SetLastDay(self, self.DayButtons[buttonIndex - 1]);
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

local function SetNextMonthDays(self, year, month, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex)
	local day = 1;
	local isSelectedMonth = selectedMonth == month and selectedYear == year;
	local isThisMonth = presentMonth == month and presentYear == year;
	local checkCorners = mod(buttonIndex, 7) ~= 1;	-- last day of the viewed month is not the last day of the week
	local darkTopFlags, darkBottomFlags;
	local isSelectedDay, isToday;
	while buttonIndex <= self.MaxDaysPerMonth do
		isSelectedDay = isSelectedMonth and selectedDay == day;
		isToday = isThisMonth and presentDay == day;
		darkTopFlags, darkBottomFlags = GetNextMonthDarkFlags(self, day, buttonIndex, checkCorners);
		UpdateDay(self, buttonIndex, day, month, year, isSelectedDay, isToday, darkTopFlags, darkBottomFlags);
		day = day + 1;
		buttonIndex = buttonIndex + 1;
	end
end

local function GetEarnedAchievementsInRange(self)
    local firstDate = self.DayButtons[1]:GetSecondsSince();
    local lastDate = self.DayButtons[self.MaxDaysPerMonth]:GetSecondsSince();
	return addon.Data.SavedData.AchievementData.GetEarnedByCharacterWithinDateRange(UnitGUID("player"), firstDate, lastDate);
end

local function SetAchievementsAndPoints(self, numAchievements, points)
	self.MonthAchievementsAndPoints:SetText(tostring(numAchievements) .. " " .. addon.L["Achievements"] .. " (" .. tostring(points) .. " " .. addon.L["Points"] .. ")");
end

local function AddAchievementsToDays(self)
    local achievements = GetEarnedAchievementsInRange(self);
    local firstDate = self.DayButtons[1]:GetSecondsSince();
	self.NumAchievements, self.TotalPoints = 0, 0;
	local points, icon;
	local date, dayButtonIndex, dayButton;
    for _, achievement in next, achievements do
        _, _, points, _, _, _, _, _, _, icon = addon.GetAchievementInfo(achievement.Id);
        date = achievement.Date;
        dayButtonIndex = floor((date - firstDate) / 86400 + 0.5) + 1; -- 86400 seconds in a day, floor to take changes in DST which would result in x.xx
		dayButton = self.DayButtons[dayButtonIndex];
        dayButton:AddAchievement(achievement.Id, icon, points);
		if not dayButton.Dark then
			self.NumAchievements = self.NumAchievements + 1;
			self.TotalPoints = self.TotalPoints + points;
		end
    end
	SetAchievementsAndPoints(self, self.NumAchievements, self.TotalPoints);
end

function KrowiAF_AchievementCalendarFrameMixin:Update()
	local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
	local presentYear = currentCalendarTime.year;
	local presentMonth = currentCalendarTime.month;
	local presentDay = currentCalendarTime.monthDay;

	local prevYear, prevMonth, prevNumDays = GetMonthInfo(-1);
	local year, month, numDays, firstWeekday = GetMonthInfo();
	local nextYear, nextMonth = GetMonthInfo(1);

	self.ViewedMonth = month;
	self.ViewedYear = year;

	local selectedDay = self.SelectedDay;
	local selectedMonth = self.SelectedMonth;
	local selectedYear = self.SelectedYear;

	UpdateTitle(self);
	UpdatePrevMonthButtons(self);
	UpdateNextMonthButtons(self);
	UpdateWeekDays(self);
	HideAttributes(self);

	local buttonIndex = 1;
	buttonIndex = SetPrevMonthDays(self, prevYear, prevMonth, prevNumDays, firstWeekday, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex);
	buttonIndex = SetMonthDays(self, year, month, numDays, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex);
	SetNextMonthDays(self, nextYear, nextMonth, selectedYear, selectedMonth, selectedDay, presentYear, presentMonth, presentDay, buttonIndex);

    AddAchievementsToDays(self);
end