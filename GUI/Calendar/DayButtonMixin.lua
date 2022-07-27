-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_CalendarDayButton_OnEnter(self)
	if not self.Day then
		-- not yet updated
		return;
	end

	addon.GUI.Calendar.Frame:SetHighlightedDay(self);
end

function KrowiAF_CalendarDayButton_OnLeave(self)
	addon.GUI.Calendar.Frame:SetHighlightedDay();
end

function KrowiAF_CalendarDayButton_OnClick(self)
	local isSelected = self.IsSelected;
	if isSelected then
		self:Deselect();
	else
		self:Select();
	end

	addon.GUI.Calendar.Frame:SetSelectedDay(self);

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end

KrowiAF_CalendarDayButtonMixin = {};

function KrowiAF_CalendarDayButtonMixin:PostLoad(buttons, buttonIndex)
	self:SetID(buttonIndex);

	self:ClearAllPoints();
	if buttonIndex == 1 then
		self:SetPoint("TOPLEFT", KrowiAF_AchievementCalendarFrame.WeekDayBackgrounds[1], "BOTTOMLEFT", 0, 0);
	elseif mod(buttonIndex, 7) == 1 then
		self:SetPoint("TOPLEFT", buttons[buttonIndex - 7], "BOTTOMLEFT", 0, 0);
	else
		self:SetPoint("TOPLEFT", buttons[buttonIndex - 1], "TOPRIGHT", 0, 0);
	end

	local tex = self:GetNormalTexture();
	tex:SetDrawLayer("BACKGROUND");
	local normalizedTexWidth = 90 / 256 - 0.001;
	local texLeft = random(0, 1) * normalizedTexWidth;
	local texRight = texLeft + normalizedTexWidth;
	local normalizedTexHeight = 90 / 256 - 0.001;
	local texTop = random(0, 1) * normalizedTexHeight;
	local texBottom = texTop + normalizedTexHeight;
	tex:SetTexCoord(texLeft, texRight, texTop, texBottom);

	tex = self:GetHighlightTexture();
	tex:SetAlpha(0.5);
end

function KrowiAF_CalendarDayButtonMixin:Select()
	self:LockHighlight();
	self:GetHighlightTexture():SetAlpha(1.0);
	self.IsSelected = true;
end

function KrowiAF_CalendarDayButtonMixin:Deselect()
	self:UnlockHighlight();
	self:GetHighlightTexture():SetAlpha(0.5);
	self.IsSelected = nil;
end

function KrowiAF_CalendarDayButtonMixin:Clear()
	self:Deselect();

	self.Achievements = nil;
	self.Points = 0;

	local buttons = self.AchievementButtons;
	for _, button in next, buttons do
        button:Hide();
    end
	self.More:Hide();
end