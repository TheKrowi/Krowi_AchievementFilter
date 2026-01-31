local _, addon = ...;

KrowiAF_WorldMapButtonMixin = {};

function KrowiAF_WorldMapButtonMixin:OnLoad()

end

function KrowiAF_WorldMapButtonMixin:OnMouseDown()
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
        for i = 1, #addon.SpecialCategories.SelectedZone do
            local category = addon.SpecialCategories.SelectedZone[i];
            category.Achievements = addon.Options.db.profile.AdjustableCategories.SelectedZone[i] and achievements or nil;
            category.Name = addon.L["Selected Zone"] .. " (" .. self.Text .. ")";
            category.CountsDirty = true;
        end
        for i = 1, #addon.SpecialCategories.SelectedZone do
            if addon.Options.db.profile.AdjustableCategories.SelectedZone[i] then
                KrowiAF_SelectCategory(addon.SpecialCategories.SelectedZone[i]);
                return;
            end
        end
    end
end

function KrowiAF_WorldMapButtonMixin:OnEnter()
    if self.NumOfAch > 0 then
        addon.Gui.ShowStatusBarTooltip(self, "ANCHOR_RIGHT", addon.Options.db.profile.AddAddonNameToWorldMapIcon and addon.Metadata.Title);
    else
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT");
	    GameTooltip_SetTitle(GameTooltip, self.Text);
        GameTooltip_AddNormalLine(GameTooltip, addon.L["No achievements are available with the current set of filters"]);
        if addon.Options.db.profile.AddAddonNameToWorldMapIcon then
            GameTooltip_AddBlankLineToTooltip(GameTooltip);
            GameTooltip_AddNormalLine(GameTooltip, addon.Metadata.Title);
        end
        GameTooltip:Show();
    end
end

function KrowiAF_WorldMapButtonMixin:OnHide()

end

function KrowiAF_WorldMapButtonMixin:Refresh()
    if not addon.Options.db.profile.ShowWorldmapIcon then
        self:Hide();
        return;
    end
    self:Show();

    local mapID = WorldMapFrame:GetMapID();
    self.Achievements = addon.GetAchievementsInZone(mapID, true);
    local numOfAch, numOfCompAch, numOfNotObtAch = 0, 0, 0;
    for _, achievement in next, self.Achievements do
        numOfAch, numOfCompAch, numOfNotObtAch = addon.GetAchievementNumbers(addon.Filters.db.profile.SelectedZone, achievement, numOfAch, numOfCompAch, numOfNotObtAch); -- , numOfIncompAch
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
end