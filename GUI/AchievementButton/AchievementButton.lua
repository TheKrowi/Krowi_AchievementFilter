-- [[ Namespaces ]] --
local _, addon = ...;

local function AddRightClickMenuButton(button, xOffset, yOffset, xPlusMinusOffset, yPlusMinusOffset)
	local rightClickMenuButton = CreateFrame("Button", "$parentRightClickMenuButton", button, "KrowiAF_RightClickMenuButton_Template");
	rightClickMenuButton:SetPoint("TOPLEFT", xOffset, yOffset);

	rightClickMenuButton:SetScript("OnClick", function()
		addon.GUI.RightClickMenu.AchievementMenu:Open(button.Achievement, rightClickMenuButton);
	end);
	button.RightClickMenuButton = rightClickMenuButton;

	button.PlusMinus:ClearAllPoints();
	button.PlusMinus:SetPoint("TOPLEFT", rightClickMenuButton, "BOTTOMLEFT", xPlusMinusOffset, yPlusMinusOffset);
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
	self.DateCompleted:SetPoint("TOPRIGHT", -28, -8);
	self.PlusMinus:SetSize(13, 13);
	self.PlusMinus:SetPoint("TOPLEFT", 52, -7);
	self.Icon:SetSize(48, 48);
	self.Icon:SetPoint("TOPLEFT", 3, -3);
	self.Icon.Texture:SetSize(36, 36);
	self.Icon.Border:SetSize(46, 46);
	self.Icon.ExtraIcon:SetPoint("CENTER", 5, -5);
	self.Shield:SetSize(48, 48);
	self.Shield:SetPoint("TOPRIGHT", -3, -4);
	self.Shield.Icon:SetSize(48, 48);
	self.Shield.Icon:SetPoint("TOPRIGHT", 0, 0);
	self.Shield.Points:SetSize(48, 48);
	self.Shield.Points:SetPoint("TOPRIGHT", -1, 2);
	self.Tracked:SetPoint("TOPLEFT", 9, -46);

	self.MaxDescriptionLinesCollapsed = 1;

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self, 51, -6, 1, -3);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end

function KrowiAF_AchievementButton_Normal_OnLoad(self)
	self:TooltipBackdropOnLoad();

	self.MaxDescriptionLinesCollapsed = 3;

	if addon.Options.db.RightClickMenu.ShowButtonOnAchievement then
		AddRightClickMenuButton(self, 72, -9, 0, -3);
	end

	KrowiAF_AchievementButton_OnLoad(self);
end