KrowiAF_AchievementCalendarDayButtonMixin = {};

function KrowiAF_AchievementCalendarDayButtonMixin:OnLoad()
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

function KrowiAF_AchievementCalendarDayButtonMixin:OnEnter()
	if not self.Day then
		-- not yet updated
		return;
	end
end

function KrowiAF_AchievementCalendarDayButtonMixin:OnClick()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	if self.IsSelected or not self.Achievements then
		self:Deselect();
		return;
	end
	self:Select();
end

function KrowiAF_AchievementCalendarDayButtonMixin:Select()
	self:LockHighlight();
	self:GetHighlightTexture():SetAlpha(1.0);
	self.IsSelected = true;
end

function KrowiAF_AchievementCalendarDayButtonMixin:Deselect()
	self:UnlockHighlight();
	self:GetHighlightTexture():SetAlpha(0.5);
	self.IsSelected = nil;
end

function KrowiAF_AchievementCalendarDayButtonMixin:Clear()
	self:Deselect();

	self.Achievements = nil;
	self.Points = 0;

	local buttons = self.AchievementButtons;
	for _, button in next, buttons do
        button:Hide();
    end
	self.More:Hide();
end

function KrowiAF_AchievementCalendarDayButtonMixin:SetDarkFrame(darkDayTopTexCoords, darkTopFlags, darkDayBottomTexCoords, darkBottomFlags)
	self.Dark = darkTopFlags and darkBottomFlags;
	if self.Dark then
		local darkFrame = self.DarkFrame;
		local tcoords = darkDayTopTexCoords[darkTopFlags];
		darkFrame.Top:SetTexCoord(tcoords.left, tcoords.right, tcoords.top, tcoords.bottom);
		tcoords = darkDayBottomTexCoords[darkBottomFlags];
		darkFrame.Bottom:SetTexCoord(tcoords.left, tcoords.right, tcoords.top, tcoords.bottom);
		darkFrame:Show();
		return;
	end
	self.DarkFrame:Hide();
end