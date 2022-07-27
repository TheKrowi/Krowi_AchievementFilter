-- [[ Namespaces ]] --
local _, addon = ...;

local function AddRightClickMenuButton(button)
	local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button, "KrowiAF_RightClickMenuButton_Template");
	rightClickMenuButton:SetPoint("TOPRIGHT", -1, -1);

	rightClickMenuButton:SetScript("OnClick", function()
		addon.GUI.RightClickMenu.AchievementMenu:Open(button.Achievement, rightClickMenuButton);
	end);
	button.RightClickMenuButton = rightClickMenuButton;
end

function KrowiAF_AchievementButton_Small_OnLoad(self)
	self:TooltipBackdropOnLoad();

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

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end

function KrowiAF_AchievementButton_Normal_OnLoad(self)
	self:TooltipBackdropOnLoad();

	self.MaxDescriptionLinesCollapsed = 3;
	self.CollapsedHeight = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
	self.ObjectivesLeftAnchor = self.Icon.Border;

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end

function KrowiAF_AchievementButton_Summary_OnEnter(self)
	self.Highlight:Show();
    if self.Achievement == nil then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    local link = GetAchievementLink(self.Achievement.Id);
    GameTooltip:SetHyperlink(link);
    AchievementFrameAchievements_CheckGuildMembersTooltip(self);
    GameTooltip:Show();
    if GameTooltip:GetTop() > self:GetTop() then
        GameTooltip:ClearAllPoints();
        GameTooltip:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT");
    end
end

function KrowiAF_AchievementButton_Summary_OnLeave(self)
	self.Highlight:Hide();
	GameTooltip:Hide();
end

function KrowiAF_AchievementButton_Summary_OnClick(self)
	if self.Achievement == nil then
        return;
    end
    KrowiAF_SelectAchievementFromID(self.Achievement.Id);
end