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
            callbacks = addon.MenuBuilder.BindCallbacks(self, {
                GetCheckBoxStateText = "GetCheckBoxStateText",
                OnCheckboxSelect = "OnCheckboxSelect",
                OnRadioSelect = "OnRadioSelect",
                IsMinorVersionChecked = "IsMinorVersionChecked",
                OnMinorVersionSelect = "OnMinorVersionSelect",
                IsMajorVersionChecked = "IsMajorVersionChecked",
                OnMajorVersionSelect = "OnMajorVersionSelect",
                OnAllVersionsSelect = "OnAllVersionsSelect",
                CreateBuildVersionFilterGroups = "CreateBuildVersionFilterGroups",
                SetRewardsFilters = "SetRewardsFilters",
                SetFactionFilters = "SetFactionFilters",
            }),
            translations = addon.L
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
        KrowiAF_CategoriesFrame:Update(true);
        KrowiAF_AchievementsFrame:ForceUpdate(); -- Issue #27: Fix
        KrowiAF_SummaryFrame:Update();
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
    function KrowiAF_AchievementFrameFilterButtonMixin:OnRadioSelect(text, filters, keys, checkTabs)
        self:SetSelected(filters, keys, text, checkTabs, false);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end
end

do -- BuildVersionFilter
    function KrowiAF_AchievementFrameFilterButtonMixin:OnPatchVersionSelect(filters, patches, checked)
        for _, patch in next, patches do
            self:SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:IsMinorVersionChecked(filters, minor)
        local isChecked = true;
        for _, patch in next, minor.Patches do
            isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
        end
        return isChecked;
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnMinorVersionSelect(filters, minor)
        local checked = self:IsMinorVersionChecked(filters, minor);
        self:OnPatchVersionSelect(filters, minor.Patches, checked);
        self:UpdateAchievementFrame();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMinorVersion(majorGroup, filters, major, minor)
        local mb = self.menuBuilder;
        if #minor.Patches <= 1 then
            mb:CreateCheckbox(majorGroup, major.Major .. "." .. minor.Minor .. "." .. minor.Patches[1].Patch, filters, {"BuildVersion", minor.Patches[1].BuildVersionId}, true);
            return;
        end
        local minorGroup = mb:CreateMinorVersionGroup(majorGroup, filters, major, minor);
        for _, patch in next, minor.Patches do
            mb:CreateCheckbox(minorGroup, major.Major .. "." .. minor.Minor .. "." .. patch.Patch, filters, {"BuildVersion", patch.BuildVersionId}, true);
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:IsMajorVersionChecked(filters, major)
        local isChecked = true;
        for _, minor in next, major.Minors do
            isChecked = isChecked and self:IsMinorVersionChecked(filters, minor);
        end
        return isChecked;
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnMajorVersionSelect(filters, major)
        local checked = self:IsMajorVersionChecked(filters, major);
        for _, minor in next, major.Minors do
            self:OnPatchVersionSelect(filters, minor.Patches, checked);
        end
        self:UpdateAchievementFrame();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMajorVersion(version, filters, major)
        local majorGroup = self.menuBuilder:CreateMajorVersionGroup(version, filters, major);
        for _, minor in next, major.Minors do
            self:CreateMinorVersion(majorGroup, filters, major, minor);
        end
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnAllVersionsSelect(filters, value)
        for _, major in next, addon.Data.BuildVersionsGrouped do
            for _, minor in next, major.Minors do
                for _, patch in next, minor.Patches do
                    self:SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, value, true, true);
                end
            end
        end
        self:UpdateAchievementFrame();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateBuildVersionFilterGroups(version, filters)
        if #addon.Data.BuildVersionsGrouped > 1 then
            for _, major in next, addon.Data.BuildVersionsGrouped do
                self:CreateMajorVersion(version, filters, major)
            end
        else
            local major = addon.Data.BuildVersionsGrouped[1];
            for _, minor in next, major.Minors do
                self:CreateMinorVersion(version, filters, major, minor);
            end
        end
        self.menuBuilder:CreateSelectDeselectAllVersions(version, filters);
    end

end

do -- AchievementFilters
    function KrowiAF_AchievementFrameFilterButtonMixin:SetRewardsFilters(filters, value)
        self:SetSelected(filters, {"HasReward", "Yes"}, value, true, true);
        self:SetSelected(filters, {"HasReward", "No"}, value, true, true);
        for rewardType, _ in next, filters.RewardType do
            self:SetSelected(filters, {"RewardType", rewardType}, value, true, true);
        end
        self:UpdateAchievementFrame();
    end

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

        local reward = mb:CreateSubmenuButton(menu, addon.L["Has Reward"]);
        mb:CreateCheckbox(reward, addon.L["Yes"], filters, {"HasReward", "Yes"}, true);
        mb:CreateCheckbox(reward, addon.L["No"], filters, {"HasReward", "No"}, true);
        mb:CreateDivider(reward);
        mb:CreateCheckbox(reward, addon.L["Allied Race"], filters, {"RewardType", KrowiAF.Enum.RewardType.AlliedRace}, true);
        mb:CreateCheckbox(reward, addon.L["Garrison"], filters, {"RewardType", KrowiAF.Enum.RewardType.Garrison}, true);
        mb:CreateCheckbox(reward, addon.L["Mount"], filters, {"RewardType", KrowiAF.Enum.RewardType.Mount}, true);
        mb:CreateCheckbox(reward, addon.L["Pet"], filters, {"RewardType", KrowiAF.Enum.RewardType.Pet}, true);
        mb:CreateCheckbox(reward, addon.L["Tabard"], filters, {"RewardType", KrowiAF.Enum.RewardType.Tabard}, true);
        mb:CreateCheckbox(reward, addon.L["Teleport"], filters, {"RewardType", KrowiAF.Enum.RewardType.Teleport}, true);
        mb:CreateCheckbox(reward, addon.L["Title"], filters, {"RewardType", KrowiAF.Enum.RewardType.Title}, true);
        mb:CreateCheckbox(reward, addon.L["Toy"], filters, {"RewardType", KrowiAF.Enum.RewardType.Toy}, true);
        mb:CreateCheckbox(reward, addon.L["Trader's Tender"], filters, {"RewardType", KrowiAF.Enum.RewardType.TradersTender}, true);
        mb:CreateCheckbox(reward, addon.L["Transmog"], filters, {"RewardType", KrowiAF.Enum.RewardType.Transmog}, true);
        mb:CreateCheckbox(reward, addon.L["Warband Campsite"], filters, {"RewardType", KrowiAF.Enum.RewardType.WarbandCampsite}, true);
        mb:CreateCheckbox(reward, addon.L["Housing Decor"], filters, {"RewardType", KrowiAF.Enum.RewardType.HousingDecor}, true);
        mb:CreateCheckbox(reward, addon.L["Other"], filters, {"RewardType", KrowiAF.Enum.RewardType.Other}, true);
        mb:CreateDivider(reward);
        mb:CreateCheckbox(reward, addon.L["Remix Bronze"], filters, {"RewardType", KrowiAF.Enum.RewardType.RemixBronze}, true);
        mb:CreateCheckbox(reward, addon.L["Remix Infinite Knowledge"], filters, {"RewardType", KrowiAF.Enum.RewardType.RemixInfiniteKnowledge}, true);
        mb:CreateDivider(reward);
        mb:CreateCheckbox(reward, addon.L["Not Categorized"], filters, {"RewardType", KrowiAF.Enum.RewardType.NotCategorized}, true);
        mb:CreateDivider(reward);
        mb:CreateSelectDeselectAllRewards(reward, addon.L["Select All"], filters, true);
        mb:CreateSelectDeselectAllRewards(reward, addon.L["Deselect All"], filters, false);
        mb:AddChildMenu(menu, reward);

        mb:CreateBuildVersionFilter(filters, menu);

        local faction = mb:CreateSubmenuButton(menu, addon.L["Faction"]);
        mb:CreateCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
        mb:CreateCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
        mb:CreateCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
        mb:CreateDivider(faction);
        mb:CreateSelectDeselectAllFactions(faction, addon.L["Select All"], filters, true);
        mb:CreateSelectDeselectAllFactions(faction, addon.L["Deselect All"], filters, false);
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
        mb:CreateRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
        mb:CreateRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
        mb:CreateRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
        mb:CreateRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
        mb:CreateRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
        mb:CreateDivider(sortBy);
        mb:CreateCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true);
        mb:AddChildMenu(menu, sortBy);

        mb:AddChildMenu(parentMenu, menu);
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
    mb:CreateRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
    mb:CreateRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
    mb:CreateRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);
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
        addon.L["Options"],
        addon.Options.Open
    );

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        mb:CreateDivider(menu);
        mb:CreateCheckbox(menu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
    end
end
