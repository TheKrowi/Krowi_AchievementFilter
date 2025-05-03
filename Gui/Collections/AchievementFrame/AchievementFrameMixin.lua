local _, addon = ...;

KrowiAF_Collections_AchievementFrameMixin = {};

function KrowiAF_Collections_AchievementFrameMixin:OnLoad()
    for i, t in next, addon.TabsOrder do
        -- addon.Tabs[t].Button = self.AchievementFrameTabButtonFactory:GetNew(t, addon.Tabs[t].Text, {KrowiAF_AchievementFrameFilterButton, KrowiAF_SearchBoxFrame, KrowiAF_CategoriesFrame}, addon.Tabs[t].Categories, addon.Tabs[t].Filters, waterMarks[i]);
        -- KrowiAF_RegisterTabButton(addonName, addon.Tabs[t].Name, addon.Tabs[t].Button);
        local button = CreateFrame("Button", self:GetName() .. "Tab" .. i, self, "PanelTopTabButtonTemplate", i);
        button:SetText(addon.Tabs[t].Text);
        if i == 1 then
            button:SetPoint("TOPLEFT", 58, -28);
        else
            button:SetPoint("LEFT", _G[self:GetName() .. "Tab" .. (i - 1)], "RIGHT", 0, 0);
        end
        button:SetScript("OnClick", function(tab)
            self:SetTab(tab:GetID());
            -- PanelTemplates_ResizeTabsToFit(WardrobeCollectionFrame, WARDROBE_TABS_MAX_WIDTH);
            PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
        end);
        button:Show();
    end

    PanelTemplates_SetNumTabs(self, #addon.TabsOrder);
	PanelTemplates_SetTab(self, 1);
end

function KrowiAF_Collections_AchievementFrameMixin:OnEvent(event)

end

function KrowiAF_Collections_AchievementFrameMixin:OnShow()
    CollectionsJournal:SetPortraitToAsset(addon.Metadata.Icon);
    -- self:UpdateProgressBar();
end

function KrowiAF_Collections_AchievementFrameMixin:OnHide()

end

function KrowiAF_Collections_AchievementFrameMixin:SetTab(tabId)
    PanelTemplates_SetTab(self, tabId);
end

function KrowiAF_Collections_AchievementFrameMixin:UpdateProgressBar()
    local value = KrowiAF_SavedData.CharacterList[UnitGUID("player")].Points or -1;
    local max = GetTotalAchievementPoints() or -1;
	self.ProgressBar:SetMinMaxValues(0, max);
	self.ProgressBar:SetValue(value);
	self.ProgressBar.text:SetFormattedText(HEIRLOOMS_PROGRESS_FORMAT, value, max);
end

KrowiAF_Collections_AchievementFrame_SearchBoxMixin = {};

function KrowiAF_Collections_AchievementFrame_SearchBoxMixin:OnTextChanged()

end

function KrowiAF_Collections_AchievementFrame_SearchBoxMixin:OnHide()
    
end