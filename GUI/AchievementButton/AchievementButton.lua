-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_PostLoadAchievementButtons(scrollFrame)
	local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
        button:SetPoint("RIGHT", scrollFrame, -5, 0);

		local xHeaderOffset = max(button.PlusMinus:GetRight() - button:GetLeft(), button:GetRight() - button.DateCompleted:GetLeft()) + 2;
		button.Header:SetPoint("LEFT", xHeaderOffset, 0);
		button.Header:SetPoint("RIGHT", -xHeaderOffset, 0);

		local xDescriptionOffset = max(button.PlusMinus:GetRight() - button:GetLeft(), button:GetRight() - button.Shield:GetLeft());
		button.Description:SetPoint("LEFT", xDescriptionOffset, 0);
		button.Description:SetPoint("RIGHT", -xDescriptionOffset, 0);

		local xObjectivesOffset = max(button.ObjectivesLeftAnchor:GetRight() - button:GetLeft(), button:GetRight() - button.Shield:GetLeft());
		addon.GUI.AchievementsObjectives.XOffset = xObjectivesOffset;
		addon.GUI.AchievementsObjectives:SetParent(button);
		-- addon.GUI.AchievementsObjectives:SetPoint("LEFT", button, "LEFT", xObjectivesOffset, 0);
		-- addon.GUI.AchievementsObjectives:SetPoint("RIGHT", button, "RIGHT", -xObjectivesOffset, 0);
		-- addon.GUI.AchievementsObjectives:SetWidth(addon.GUI.AchievementsObjectives:GetWidth());
		-- addon.GUI.AchievementsObjectives:SetWidth(300);
    end
end

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
	self.ObjectivesLeftAnchor = self.PlusMinus;

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end

function KrowiAF_AchievementButton_Normal_OnLoad(self)
	self:TooltipBackdropOnLoad();

	self.MaxDescriptionLinesCollapsed = 3;
	self.ObjectivesLeftAnchor = self.Icon.Border;

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end