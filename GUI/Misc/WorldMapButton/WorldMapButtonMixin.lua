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
    local achievements = worldMapButton.Achievements;
    if achievements and #achievements > 0 then
        HideUIPanel(WorldMapFrame);
        addon.Data.SelectedZoneCategory.Achievements = achievements;
        addon.Data.SelectedZoneCategory.Name = addon.L["Selected Zone"] .. " (" .. worldMapButton.Text .. ")";
        KrowiAF_SelectCategory(addon.Data.SelectedZoneCategory);
    end
end

function KrowiAF_WorldMapButtonMixin:OnEnter()
    if worldMapButton.NumOfAch > 0 then
        addon.GUI.ShowStatusBarTooltip(worldMapButton, "ANCHOR_RIGHT");
    else
        GameTooltip:SetOwner(worldMapButton, "ANCHOR_RIGHT");
	    GameTooltip_SetTitle(GameTooltip, worldMapButton.Text);
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
    worldMapButton.Achievements = addon.GetAchievementsInZone(mapID, true);
    local numOfAch, numOfCompAch, numOfNotObtAch = 0, 0, 0;
    for _, achievement in next, worldMapButton.Achievements do
        numOfAch, numOfCompAch, numOfNotObtAch = addon.GetAchievementNumbers(addon.Filters.db.SelectedZone, achievement, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch
    end

    worldMapButton.Text = C_Map.GetMapInfo(mapID).name;
    self.NumOfAch, self.NumOfCompAch, self.NumOfNotObtAch = numOfAch, numOfCompAch, numOfNotObtAch;
    if self.NumOfAch > 0 then
        self:Enable();
		self:DesaturateHierarchy(0);
	else
		self:Disable();
		self:DesaturateHierarchy(1);
    end
end