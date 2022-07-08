-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CalendarButton = {};
local dayButton = addon.GUI.CalendarButton;

dayButton.NormalizedTexWidth = 90 / 256 - 0.001;
dayButton.NormalizedTexHeight = 90 / 256 - 0.001;
dayButton.MaxVisibleAchievements = 4;
dayButton.SelectionAlpha= 1.0;
dayButton.HighlightAlpha = 0.5;

function dayButton:PostLoadButton(buttons, buttonIndex)
    local button = buttons[buttonIndex];
	button:SetID(buttonIndex);

	button:ClearAllPoints();
	if buttonIndex == 1 then
		button:SetPoint("TOPLEFT", KrowiAF_AchievementCalendarFrame.WeekDayBackgrounds[1], "BOTTOMLEFT", 0, 0);
	elseif mod(buttonIndex, 7) == 1 then
		button:SetPoint("TOPLEFT", buttons[buttonIndex - 7], "BOTTOMLEFT", 0, 0);
	else
		button:SetPoint("TOPLEFT", buttons[buttonIndex - 1], "TOPRIGHT", 0, 0);
	end

	local tex = button:GetNormalTexture();
	tex:SetDrawLayer("BACKGROUND");
	local texLeft = random(0, 1) * dayButton.NormalizedTexWidth;
	local texRight = texLeft + dayButton.NormalizedTexWidth;
	local texTop = random(0, 1) * dayButton.NormalizedTexHeight;
	local texBottom = texTop + dayButton.NormalizedTexHeight;
	tex:SetTexCoord(texLeft, texRight, texTop, texBottom);

	tex = button:GetHighlightTexture();
	tex:SetAlpha(dayButton.HighlightAlpha);

	button.Select = self.Select;
	button.Deselect = self.Deselect;
end

function KrowiAF_AchievementCalendarDayButton_OnLoad(self)
	self.Clear = dayButton.Clear;
end

function KrowiAF_AchievementCalendarDayButton_OnEnter(self)
	if not self.Day then
		-- not yet updated
		return;
	end

	addon.GUI.Calendar.Frame:SetHighlightedDay(self);
end

function KrowiAF_AchievementCalendarDayButton_OnLeave(self)
	addon.GUI.Calendar.Frame:SetHighlightedDay();
end

function KrowiAF_AchievementCalendarDayButton_OnClick(self)
	local isSelected = self.IsSelected;
	if isSelected then
		self:Deselect();
	else
		self:Select();
	end

	addon.GUI.Calendar.Frame:SetSelectedDay(self);

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end

function dayButton:Select()
	self:LockHighlight();
	self:GetHighlightTexture():SetAlpha(dayButton.SelectionAlpha);
	self.IsSelected = true;
end

function dayButton:Deselect()
	self:UnlockHighlight();
	self:GetHighlightTexture():SetAlpha(dayButton.HighlightAlpha);
	self.IsSelected = nil;
end

function dayButton:Clear()
	self.Achievements = nil;
	self.Points = 0;

	local buttons = self.AchievementButtons;
	for _, button in next, buttons do
        button:Hide();
    end
	self.More:Hide();
end