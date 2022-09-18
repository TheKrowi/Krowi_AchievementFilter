-- [[ Namespaces ]] --
local addonName, addon = ...;

KrowiAF_WorldMapButtonMixin = {};

function KrowiAF_WorldMapButtonMixin:OnLoad()

end

function KrowiAF_WorldMapButtonMixin:OnMouseDown(button)
    if self:IsEnabled() then
		self.Icon:SetPoint("TOPLEFT", 8, -8);
		self.IconOverlay:Show();
	end
end

function KrowiAF_WorldMapButtonMixin:OnMouseUp()
    self.Icon:SetPoint("TOPLEFT", self, "TOPLEFT", 6, -6);
	self.IconOverlay:Hide();
end

function KrowiAF_WorldMapButtonMixin:OnClick()
    local achievements = self.Achievements;
    if achievements and #achievements > 0 then
        HideUIPanel(WorldMapFrame);
        for i = 1, #addon.Data.SelectedZoneCategories do
            addon.Data.SelectedZoneCategories[i].Achievements = addon.Options.db.AdjustableCategories.SelectedZone[i] and achievements or nil;
            addon.Data.SelectedZoneCategories[i].Name = addon.L["Selected Zone"] .. " (" .. self.Text .. ")";
        end
        for i = 1, #addon.Data.SelectedZoneCategories do
            if addon.Options.db.AdjustableCategories.SelectedZone[i] then
                KrowiAF_SelectCategory(addon.Data.SelectedZoneCategories[i]);
                return;
            end
        end
    end
end

function KrowiAF_WorldMapButtonMixin:OnEnter()
    if self.NumOfAch > 0 then
        addon.GUI.ShowStatusBarTooltip(self, "ANCHOR_RIGHT");
    else
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	    GameTooltip_SetTitle(GameTooltip, self.Text);
        GameTooltip_AddNormalLine(GameTooltip, addon.L["No achievements are available with the current set of filters"]);
        GameTooltip:Show();
    end
end

function KrowiAF_WorldMapButtonMixin:OnHide()

end

function KrowiAF_WorldMapButtonMixin:Refresh()
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    local mapID = WorldMapFrame:GetMapID();
    self.Achievements = addon.GetAchievementsInZone(mapID, true);
    local numOfAch, numOfCompAch, numOfNotObtAch = 0, 0, 0;
    for _, achievement in next, self.Achievements do
        numOfAch, numOfCompAch, numOfNotObtAch = addon.GetAchievementNumbers(addon.Filters.db.SelectedZone, achievement, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch
    end

    self.Text = C_Map.GetMapInfo(mapID).name;
    self.NumOfAch, self.NumOfCompAch, self.NumOfNotObtAch = numOfAch, numOfCompAch, numOfNotObtAch;
    if self.NumOfAch > 0 then
        self:Enable();
		self:DesaturateHierarchy(0);
	else
		self:Disable();
		self:DesaturateHierarchy(1);
    end
    -- print(self.Text, self.NumOfAch, self.NumOfCompAch, self.NumOfNotObtAch)
end