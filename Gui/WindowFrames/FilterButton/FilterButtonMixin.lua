local _, addon = ...;

local isModern = addon.Util.IsMainline;

KrowiAF_AchievementFrameFilterButtonMixin = {};

do -- Mixin
    function KrowiAF_AchievementFrameFilterButtonMixin:OnLoad()
        -- Call parent mixin OnLoad if Modern
        if isModern then
            WowStyle1FilterDropdownMixin.OnLoad(self);
        end

        self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);

        -- Initialize MenuBuilder with callbacks
        local config = {
		    uniqueTag = "KAF_FILTERS",
            callbacks = addon.MenuBuilder.BindCallbacks(self, {
                GetCheckBoxStateText = "GetCheckBoxStateText",
                OnCheckboxSelect = "OnCheckboxSelect",
                OnRadioSelect = "OnRadioSelect",
            }),
            translations = addon.Util.L
        };

        local menuBuilder = addon.MenuBuilder:New(config);
        self.menuBuilder = menuBuilder;

        -- Set CreateMenu function directly on the instance
        menuBuilder.CreateMenu = function(mb)
            self:CreateMenu(mb:GetMenu());
        end;

        -- Modern needs SetupMenuForModern
        if isModern then
            menuBuilder:SetupMenuForModern(self);
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnMouseDown()
        if isModern then
            WowStyle1FilterDropdownMixin.OnMouseDown(self);
        else
            UIMenuButtonStretchMixin.OnMouseDown(self);
            PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
            self.menuBuilder:Show(self, 96, 15);
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnShow()
        if isModern then
            WowStyle1FilterDropdownMixin.OnShow(self);
        end
        AchievementFrame.Header.LeftDDLInset:Show();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnHide()
        if addon.Util.IsCataClassic or not AchievementFrameFilterDropdown:IsShown() then
            AchievementFrame.Header.LeftDDLInset:Hide();
        end
    end
end

do -- Logic
    function KrowiAF_AchievementFrameFilterButtonMixin:SetSelected(filters, keys, value, checkTabs, refresh)
        addon.Util.WriteNestedKeys(filters, keys, value);
        if not checkTabs then
            return;
        end
        if addon.Gui.SelectedTab and filters ~= addon.Gui.SelectedTab.Filters then
            filters.Refresh = true;
        end
        if filters ~= addon.Filters.db.profile then
            return;
        end
        for t, _ in next, addon.Tabs do
            addon.Util.WriteNestedKeys(addon.Tabs[t].Filters, keys, addon.Util.ReadNestedKeys(filters, keys));
            if refresh ~= nil then
                addon.Tabs[t].Filters.Refresh = refresh;
            end
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:UpdateAchievementFrame()
        addon.Util.DelayFunction("KAF_FilterRefresh", 0.05, function()
            KrowiAF_CategoriesFrame:Update(true);
            KrowiAF_AchievementsFrame:ForceUpdate(); -- Issue #27: Fix
            KrowiAF_SummaryFrame:Update();
        end);
    end
end

do -- Checkbox
    local function CheckBoxStateIsIndeterminate(keys)
        local numChecked, numUnchecked = 0, 0;
        for t, _ in next, addon.Tabs do
            if addon.Util.ReadNestedKeys(addon.Tabs[t].Filters, keys) then
                numChecked = numChecked + 1;
            else
                numUnchecked = numUnchecked + 1;
            end
        end
        return numChecked > 0 and numUnchecked > 0;
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:GetCheckBoxStateText(text, filters, keys)
        return text .. ((filters == addon.Filters.db.profile and CheckBoxStateIsIndeterminate(keys)) and " (*)" or "");
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnCheckboxSelect(filters, keys, checkTabs)
        self:SetSelected(filters, keys, not self.menuBuilder:KeyIsTrue(filters, keys), checkTabs, true);
        self:UpdateAchievementFrame();
    end
end

do -- Radio
    function KrowiAF_AchievementFrameFilterButtonMixin:OnRadioSelect(filters, keys, value, checkTabs)
        self:SetSelected(filters, keys, value, checkTabs, false);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
end

do -- AchievementFilters
    function KrowiAF_AchievementFrameFilterButtonMixin:SetFactionFilters(filters, value)
        for faction, _ in next, filters.Faction do
            self:SetSelected(filters, {"Faction", faction}, value, true, true);
        end
        self:UpdateAchievementFrame();
    end

    local function SortByValueIsIndeterminate(keys)
        local values = {};
        local counter = 0;
        for t, _ in next, addon.Tabs do
            local value = addon.Util.ReadNestedKeys(addon.Tabs[t].Filters, keys);
            if values[value] == nil then
                values[value] = true;
                counter = counter + 1;
            end
        end
        return counter > 1;
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateAchievementFilters(menu, filters, parentMenu)
        local mb = self.menuBuilder;
        mb:CreateCheckbox(menu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
        mb:CreateCheckbox(menu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
        mb:CreateCheckbox(menu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
        mb:CreateCheckbox(menu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
        mb:CreateCheckbox(menu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

        addon.FilterButtonRewardTypes.CreateRewardMenu(self, menu, filters);

        addon.FilterButtonBuildVersions.CreateBuildVersionFilter(self, menu, filters);

        local faction = mb:CreateSubmenuButton(menu, addon.L["Faction"]);
        mb:CreateCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
        mb:CreateCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
        mb:CreateCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
        mb:CreateDivider(faction);
        mb:CreateSelectDeselectAllButtons(faction, nil, nil, function(_, _, _, value) self:SetFactionFilters(filters, value); end);
        mb:AddChildMenu(menu, faction);

        mb:CreateCheckbox(menu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
        mb:CreateCheckbox(menu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
        mb:CreateCheckbox(menu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
        mb:CreateCheckbox(menu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
        if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
            mb:CreateCheckbox(menu, addon.L["Tracking"], filters, {"Tracking"}, true);
        end
        mb:CreateCheckbox(menu, addon.L["Excluded"], filters, {"Excluded"}, true);
        mb:CreateCheckbox(menu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

        mb:CreateDivider(menu);

        local text = addon.L["Sort By"];
        if filters == addon.Filters.db.profile and SortByValueIsIndeterminate({"SortBy", "Criteria"}) then
            text = text .. " (*)";
        end
        local sortBy = mb:CreateSubmenuButton(menu, text);
        mb:CreateRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, 'Default', true);
        mb:CreateRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, 'Name', true);
        mb:CreateRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, 'Completion', true);
        mb:CreateRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, 'ID', true);
        mb:CreateRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, 'Points', true);
        mb:CreateDivider(sortBy);
        mb:CreateCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true);
        mb:AddChildMenu(menu, sortBy);

        if parentMenu then
            mb:AddChildMenu(parentMenu, menu);
        end
    end
end

function KrowiAF_AchievementFrameFilterButtonMixin:HelpShowTutorial(index)
    if not isModern then
        self.menuBuilder:Close();
    end
    addon.Tutorials.FeaturesTutorial:ShowTutorial(index);
end

function KrowiAF_AchievementFrameFilterButtonMixin:CreateMenu(menu)
    local mb = self.menuBuilder;
    mb:CreateTitle(menu, addon.L["Categories"]);
    mb:CreateCheckbox(menu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    mb:CreateDivider(menu);
    mb:CreateTitle(menu, addon.L["Achievements"]);
    self:CreateAchievementFilters(menu, addon.Filters.db.profile);

    local earnedBy = mb:CreateSubmenuButton(menu, addon.L["Earned By"]);
    mb:CreateRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, 'Account');
    mb:CreateRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, 'CharacterAccount');
    mb:CreateRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, 'CharacterOnly');
    mb:AddChildMenu(menu, earnedBy);

    mb:CreateDivider(menu);
    mb:CreateTitle(menu, addon.L["Tabs"]);
    for _, t in next, addon.TabsOrder do
        self:CreateAchievementFilters(mb:CreateSubmenuButton(menu, addon.Tabs[t].Text), addon.Tabs[t].Filters, menu);
    end

    mb:CreateDivider(menu);
    mb:CreateTitle(menu, addon.L["Special Categories"]);
    self:CreateAchievementFilters(mb:CreateSubmenuButton(menu, addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone, menu);
    self:CreateAchievementFilters(mb:CreateSubmenuButton(menu, addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone, menu);
    self:CreateAchievementFilters(mb:CreateSubmenuButton(menu, addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements, menu);

    mb:CreateDivider(menu);
    local help = mb:CreateSubmenuButton(menu, (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);
    local pages = addon.Tutorials.FeaturesTutorial.Pages;
    mb:CreateTitle(help, addon.L["View Tutorial"]);
    for i, _ in next, pages do
        mb:CreateButtonAndAdd(
            help,
            (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
            function()
                self:HelpShowTutorial(i);
            end
        );
    end
    mb:AddChildMenu(menu, help);

    mb:CreateButtonAndAdd(
        menu,
        addon.Util.L["Options"],
        addon.Options.Open
    );

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        mb:CreateDivider(menu);
        mb:CreateCheckbox(menu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
    end
end
