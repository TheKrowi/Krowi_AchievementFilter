local _, addon = ...;

KrowiAF_Collections_CategoriesFrameMixin = {};

local function CreateScrollView(self)
	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer("KrowiAF_CategoryButton_Template", function(button, category)
		button:SetCategory(category);
	end);
	self.ScrollView:SetElementIndentCalculator(function(category)
		if not category then
			return 0;
		end
		return 2 + (category.Level - 1) * addon.Options.db.profile.Categories.Indentation;
	end);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.Inset.CategoriesScrollBox, self.Inset.CategoriesScrollBar, self.ScrollView);
end

local function AddManagedScrollBarVisibilityBehavior(self)
	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", 3, -55),
        CreateAnchor("BOTTOMLEFT", 3, 2)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", 3, -55),
        CreateAnchor("BOTTOMLEFT", 3, 2)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.Inset.CategoriesScrollBox, self.Inset.CategoriesScrollBar, anchorsWithBar, anchorsWithoutBar);
end

function KrowiAF_Collections_CategoriesFrameMixin:Load(achievementFrame)
	achievementFrame.Inset.CategoriesScrollBox.wheelPanScalar = addon.Options.db.profile.Categories.MouseWheelPanScalar;
	achievementFrame.Inset.CategoriesScrollBar.wheelPanScalar = addon.Options.db.profile.Categories.MouseWheelPanScalar;

	CreateScrollView(achievementFrame);
	-- AddManagedScrollBarVisibilityBehavior(self);
end

local function GetDisplayCategories(displayCategories, category, getAchNums)
	if category.NotHidden or category.AlwaysVisible or category.HasFlexibleData then -- If already visible, keep visible
		if (category.NumOfAch == nil or getAchNums or category.HasFlexibleData) and category.Parent.TabName ~= nil then
			-- Huge increase over performance if we cache the achievement numbers and only update them when needed,
			-- only for the top level categories since it works recursive
			if category:GetAchievementNumbers() > 0 or category.AlwaysVisible then
				tinsert(displayCategories, category);
			end
		elseif category.NumOfAch > 0 or category.AlwaysVisible then
			tinsert(displayCategories, category);
		end
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			GetDisplayCategories(displayCategories, child, getAchNums);
		end
	end
end

local function UpdateDataProvider(self, categories, retainScrollPosition)
	local newDataProvider = CreateDataProvider();
	for _, category in next, categories do
		newDataProvider:Insert(category);
	end
	self.Inset.CategoriesScrollBox:SetDataProvider(newDataProvider, retainScrollPosition);
end

function KrowiAF_Collections_CategoriesFrameMixin:Update(achievementFrame, categories, filters, getAchNums, retainScrollPosition)
    if not categories then
        return;
    end

    if filters.Refresh then
		filters.Refresh = nil;
		getAchNums = true;
	end

    local displayCategories = {};
	for _, category in next, categories do
		GetDisplayCategories(displayCategories, category, getAchNums);
	end
	-- if not addon.Util.TableFindKeyByValue(displayCategories, selectedTab.SelectedCategory) then
	-- 	selectedTab.SelectedCategory = displayCategories[1];
	-- 	selectedTab:ShowSubFrames();
	-- end
	UpdateDataProvider(achievementFrame, displayCategories, retainScrollPosition);
end

KrowiAF_Collections_AchievementFrameMixin = {};

function KrowiAF_Collections_AchievementFrameMixin:OnLoad()
    local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
    local waterMarks = {
        media .. "kaf_achievements",
        media .. "kaf_expansions",
        media .. "kaf_events",
        media .. "kaf_pvp",
        media .. "kaf_special"
    };

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

            local categories = addon.Tabs[t].Categories;
            if categories and not tab.SelectedCategory then
                tab.SelectedCategory = categories[1];
            end

            -- Update categories and achievements
            KrowiAF_Collections_CategoriesFrameMixin:Update(self, categories, button.Filters);

            PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
        end);

        -- button.FramesToShow = framesToShow;
        button.SelectedAchievement = nil; -- Issue #6: Fix
        button.Categories = addon.Tabs[t].Categories;
        if button.Categories then
            button.SelectedCategory = button.Categories[1];
        end
        button.Filters = addon.Tabs[t].Filters;
        button.WaterMark = waterMarks[i] or "Interface/AchievementFrame/UI-Achievement-AchievementWatermark";
        -- button.Index = t;

        button:Show();
    end

    KrowiAF_Collections_CategoriesFrameMixin:Load(self);

    PanelTemplates_SetNumTabs(self, #addon.TabsOrder);

    RunNextFrame(function()
	    PanelTemplates_SetTab(self, 1);
    end);
end

function KrowiAF_Collections_AchievementFrameMixin:OnEvent(event)

end

function KrowiAF_Collections_AchievementFrameMixin:OnShow()
    -- CollectionsJournal:SetPortraitToAsset(addon.Metadata.Icon);
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