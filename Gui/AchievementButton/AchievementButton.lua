local _, addon = ...;

local function AddRightClickMenuButton(button)
	local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button, "KrowiAF_RightClickMenuButton_Template");
	rightClickMenuButton:SetPoint("TOPRIGHT", -1, -1);

	rightClickMenuButton:SetScript("OnClick", function()
		addon.Gui.RightClickMenu.AchievementMenu:Open(button.Achievement, rightClickMenuButton);
	end);
	button.RightClickMenuButton = rightClickMenuButton;
end

function KrowiAF_AchievementButton_OnLoad(self)
	_, self.FontHeight = self.Description:GetFont();
	self.MaxDescriptionLinesCollapsed = min(max(1, floor(30 / self.FontHeight)), self.MaxDescriptionLinesCollapsed);
	self.Description:SetHeight(10 * self.MaxDescriptionLinesCollapsed);
	self.MinExpandedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
	self:Collapse();
end

function KrowiAF_AchievementButton_Small_OnLoad(self)
	self.BottomLeftTsunami:Hide();
	self.BottomRightTsunami:Hide();
	self.TopLeftTsunami:Hide();
	self.TopRightTsunami:Hide();
	self.BottomTsunami:Hide();
	self.TopTsunami:Hide();
	self.HeaderBackground:SetHeight(20);
	self.Description:SetWidth(370);
	self.Description:SetPoint("TOP", 0, -27);
	self.DateCompleted:SetPoint("TOPLEFT", self, "TOPRIGHT", -101, -8);
	self.DateCompleted:SetJustifyH("LEFT");
	self.PlusMinus:SetSize(13, 13);
	self.PlusMinus:SetPoint("TOPLEFT", 52, -7);
	self.Icon:SetSize(48, 48);
	self.Icon:SetPoint("TOPLEFT", 3, -3);
	self.Icon.Texture:SetSize(36, 36);
	self.Icon.Border:SetSize(46, 46);
	self.Shield:SetSize(48, 48);
	self.Shield:SetPoint("TOPRIGHT", -3, -4);
	self.Shield.Icon:SetSize(48, 48);
	self.Shield.Icon:SetPoint("TOPRIGHT", 0, 0);
	self.Shield.Points:SetSize(48, 48);
	self.Shield.Points:SetPoint("TOPRIGHT", -1, 2);
	self.Tracked:SetPoint("TOPLEFT", 9, -46);

	self.MaxDescriptionLinesCollapsed = 1;
	self.Compact = true;
	self.CollapsedHeight = 48;
	self.ObjectivesLeftAnchor = self.PlusMinus;

	if addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end
end

function KrowiAF_AchievementButton_Normal_OnLoad(self)
	self.MaxDescriptionLinesCollapsed = 3;
	self.CollapsedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
	self.ObjectivesLeftAnchor = self.Icon.Border;

	if addon.Options.db.profile.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end
end

function KrowiAF_AchievementButton_Light_OnLoad(self)
	self.Background:SetTexCoord(0, 1, 0, 0.25);
	self.HeaderBackground:SetVertexColor(1, 1, 1, 0.75); -- maybe
	self.Glow:SetPoint("BOTTOM", 0, 2);
	hooksecurefunc(self, "SetAchievement", function(selfFunc)
		self.Description:Show();
		self.Reward:Hide();
		self.RewardBackground:Hide();
		self.PlusMinus:Hide();
	end);
	self:SetScript("OnShow", nil);
	self:SetScript("OnHide", nil);
	self:SetScript("OnEvent", nil);
end