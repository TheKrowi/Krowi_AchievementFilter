-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_AchievementButton_OnLoad(self)
	_, self.FontHeight = self.Description:GetFont();
	self.MaxDescriptionLinesCollapsed = min(max(1, floor(30 / self.FontHeight)), self.MaxDescriptionLinesCollapsed);
	self.Description:SetHeight(10 * self.MaxDescriptionLinesCollapsed);
	self.MinExpandedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
	self:Collapse();
end

function KrowiAF_AchievementButton_OnEnter(self)
	addon.GUI.AchievementsFrame.SetHighlightedButton(self);
	self:ShowTooltip();
	self.Highlight:Show();
end

function KrowiAF_AchievementButton_OnLeave(self)
	addon.GUI.AchievementsFrame.ClearHighlightedButton();
	AchievementMeta_OnLeave(self);
	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab and self.Achievement ~= selectedTab.SelectedAchievement then
		self.Highlight:Hide();
	end
end

function KrowiAF_AchievementButton_OnClick(self, button, down, ignoreModifiers)
	if button == "LeftButton" then
		self:Select(ignoreModifiers);
	elseif button == "RightButton" then
		addon.GUI.RightClickMenu.AchievementMenu:Open(self.Achievement);
	end
end

function KrowiAF_AchievementButton_OnShow(self)
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	self:RegisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButton_OnHide(self)
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	self:UnregisterEvent("TRACKED_ACHIEVEMENT_LIST_CHANGED");
end

function KrowiAF_AchievementButton_OnEvent(self, event, ...)
	if event ~= "ACHIEVEMENT_EARNED" and event ~= "TRACKED_ACHIEVEMENT_LIST_CHANGED" then
		return;
	end
	if not self.Achievement then
		return;
	end
	local achievementId = ...;
	if achievementId ~= self.Achievement.Id then
		return;
	end

	local achievement = self.Achievement;
	if event ~= "ACHIEVEMENT_EARNED" then
		self.Achievement = nil;
		self:Update(achievement);
	elseif event ~= "TRACKED_ACHIEVEMENT_LIST_CHANGED" then
		self:SetAsTracked(IsTrackedAchievement(achievement.Id));
	end
end

function KrowiAF_AchievementButtonExtraIcon_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	GameTooltip:SetText(self.Text, nil, nil, nil, nil, true);
end

local function AddRightClickMenuButton(button)
	local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button, "KrowiAF_RightClickMenuButton_Template");
	rightClickMenuButton:SetPoint("TOPRIGHT", -1, -1);

	rightClickMenuButton:SetScript("OnClick", function()
		addon.GUI.RightClickMenu.AchievementMenu:Open(button.Achievement, rightClickMenuButton);
	end);
	button.RightClickMenuButton = rightClickMenuButton;
end

function KrowiAF_AchievementButtonTracked_OnClick(self)
	if self:GetChecked() then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
	else
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF);
	end
	local tracked;
	if addon.IsWrathClassic then
		tracked = AchievementButton_ToggleTracking(self:GetParent().Achievement.Id);
	else
		tracked = self:GetParent():ToggleTracking();
	end
	if not tracked then
		self:SetChecked(false);
	end
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

function KrowiAF_AchievementButton_Light_OnEnter(self)
	self.Highlight:Show();
    if self.Achievement == nil then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    local link = GetAchievementLink(self.Achievement.Id);
    GameTooltip:SetHyperlink(link);
    GameTooltip:Show();
    if GameTooltip:GetTop() > self:GetTop() then
        GameTooltip:ClearAllPoints();
        GameTooltip:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT");
    end
end

function KrowiAF_AchievementButton_Light_OnLeave(self)
	self.Highlight:Hide();
	GameTooltip:Hide();
end

function KrowiAF_AchievementButton_Light_OnClick(self, button, down, ignoreModifiers)
	if button == "LeftButton" then
		if self:ProcessedModifiers(ignoreModifiers) then
			return;
		end

    	KrowiAF_SelectAchievementFromID(self.Achievement.Id);
	else
		KrowiAF_AchievementButton_OnClick(self, button, down, ignoreModifiers);
	end
end