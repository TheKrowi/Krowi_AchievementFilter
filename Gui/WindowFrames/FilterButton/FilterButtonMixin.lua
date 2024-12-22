local _, addon = ...;

KrowiAF_AchievementFrameFilterButtonMixin = {};

do -- Mixin
    function KrowiAF_AchievementFrameFilterButtonMixin:OnLoad()
        self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnShow()
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

    function KrowiAF_AchievementFrameFilterButtonMixin:KeyIsTrue(filters, keys)
        return addon.Util.ReadNestedKeys(filters, keys);
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnCheckboxSelect(filters, keys, checkTabs)
        self:SetSelected(filters, keys, not self:KeyIsTrue(filters, keys), checkTabs, true);
        self:UpdateAchievementFrame();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateCheckbox(menu, text, filters, keys, checkTabs)
        error("The function is not implemented.");
    end
end

do -- Radio
    function KrowiAF_AchievementFrameFilterButtonMixin:KeyEqualsText(text, filters, keys)
        return addon.Util.ReadNestedKeys(filters, keys) == text;
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:OnRadioSelect(text, filters, keys, checkTabs)
        self:SetSelected(filters, keys, text, checkTabs, false);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateRadio(menu, text, filters, keys, checkTabs)
        error("The function is not implemented.");
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

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMinorVersionGroup()
        error("The function is not implemented.");
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMinorVersion(majorGroup, filters, major, minor)
        if #minor.Patches <= 1 then
            self:CreateCheckbox(majorGroup, major.Major .. "." .. minor.Minor .. "." .. minor.Patches[1].Patch, filters, {"BuildVersion", minor.Patches[1].BuildVersionId}, true);
            return;
        end
        local minorGroup = self:CreateMinorVersionGroup(majorGroup, filters, major, minor);
        for _, patch in next, minor.Patches do
            self:CreateCheckbox(minorGroup, major.Major .. "." .. minor.Minor .. "." .. patch.Patch, filters, {"BuildVersion", patch.BuildVersionId}, true);
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

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMajorVersionGroup()
        error("The function is not implemented.");
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateMajorVersion(version, filters, major)
        local majorGroup = self:CreateMajorVersionGroup(version, filters, major);
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

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateSelectDeselectAllVersions()
        error("The function is not implemented.");
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
        self:CreateSelectDeselectAllVersions(version, filters);
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateBuildVersionFilter()
        error("The function is not implemented.");
    end
end

do -- AchievementFilters
    function KrowiAF_AchievementFrameFilterButtonMixin:SetFactionFilters(filters, value)
        for _faction, _ in next, filters.Faction do
            self:SetSelected(filters, {"Faction", _faction}, value, true, true);
        end
        self:UpdateAchievementFrame();
    end

    function KrowiAF_AchievementFrameFilterButtonMixin:CreateSelectDeselectAllFactions(menu, text, filters, value)
        error("The function is not implemented.");
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
        self:CreateCheckbox(menu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
        self:CreateCheckbox(menu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
        self:CreateCheckbox(menu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
        self:CreateCheckbox(menu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
        self:CreateCheckbox(menu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

        local reward = addon.MenuUtil:CreateButton(menu, addon.L["Has Reward"]);
        self:CreateCheckbox(reward, addon.L["Yes"], filters, {"HasReward", "Yes"}, true);
        self:CreateCheckbox(reward, addon.L["No"], filters, {"HasReward", "No"}, true);
        addon.MenuUtil:CreateDivider(reward);
        self:CreateCheckbox(reward, addon.L["Title"], filters, {"RewardType", KrowiAF.Enum.RewardType.Title}, true);
        self:CreateCheckbox(reward, addon.L["Pet"], filters, {"RewardType", KrowiAF.Enum.RewardType.Pet}, true);
        self:CreateCheckbox(reward, addon.L["Mount"], filters, {"RewardType", KrowiAF.Enum.RewardType.Mount}, true);
        self:CreateCheckbox(reward, addon.L["Toy"], filters, {"RewardType", KrowiAF.Enum.RewardType.Toy}, true);
        self:CreateCheckbox(reward, addon.L["Teleport"], filters, {"RewardType", KrowiAF.Enum.RewardType.Teleport}, true);
        self:CreateCheckbox(reward, addon.L["Transmog"], filters, {"RewardType", KrowiAF.Enum.RewardType.Transmog}, true);
        self:CreateCheckbox(reward, addon.L["Tabard"], filters, {"RewardType", KrowiAF.Enum.RewardType.Tabard}, true);
        self:CreateCheckbox(reward, addon.L["Other"], filters, {"RewardType", KrowiAF.Enum.RewardType.Other}, true);
        addon.MenuUtil:CreateDivider(reward);
        self:CreateCheckbox(reward, addon.L["Remix Pandaria Bronze"], filters, {"RewardType", KrowiAF.Enum.RewardType.RemixPandariaBronze}, true);
        addon.MenuUtil:CreateDivider(reward);
        self:CreateCheckbox(reward, addon.L["Not Categorized"], filters, {"RewardType", KrowiAF.Enum.RewardType.NotCategorized}, true);
        addon.MenuUtil:AddChildMenu(menu, reward);

        self:CreateBuildVersionFilter(menu, filters);

        local faction = addon.MenuUtil:CreateButton(menu, addon.L["Faction"]);
        self:CreateCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
        self:CreateCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
        self:CreateCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
        addon.MenuUtil:CreateDivider(faction);
        self:CreateSelectDeselectAllFactions(faction, addon.L["Select All"], filters, true);
        self:CreateSelectDeselectAllFactions(faction, addon.L["Deselect All"], filters, false);
        addon.MenuUtil:AddChildMenu(menu, faction);

        self:CreateCheckbox(menu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
        self:CreateCheckbox(menu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
        self:CreateCheckbox(menu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
        self:CreateCheckbox(menu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
        if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
            self:CreateCheckbox(menu, addon.L["Tracking"], filters, {"Tracking"}, true);
        end
        self:CreateCheckbox(menu, addon.L["Excluded"], filters, {"Excluded"}, true);
        self:CreateCheckbox(menu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

        addon.MenuUtil:CreateDivider(menu);

        local text = addon.L["Sort By"];
        if filters == addon.Filters.db.profile and SortByValueIsIndeterminate({"SortBy", "Criteria"}) then
            text = text .. " (*)";
        end
        local sortBy = addon.MenuUtil:CreateButton(menu, text);
        self:CreateRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
        self:CreateRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
        self:CreateRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
        self:CreateRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
        self:CreateRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
        addon.MenuUtil:CreateDivider(sortBy);
        self:CreateCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true);
        addon.MenuUtil:AddChildMenu(menu, sortBy);

        addon.MenuUtil:AddChildMenu(parentMenu, menu);
    end
end

function KrowiAF_AchievementFrameFilterButtonMixin:HelpShowTutorial(index)
    error("The function is not implemented.");
end

function KrowiAF_AchievementFrameFilterButtonMixin:CreateMenu(menu)
    addon.MenuUtil:CreateTitle(menu, addon.L["Categories"]);
    self:CreateCheckbox(menu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    addon.MenuUtil:CreateDivider(menu);
    addon.MenuUtil:CreateTitle(menu, addon.L["Achievements"]);
    self:CreateAchievementFilters(menu, addon.Filters.db.profile);

    local earnedBy = addon.MenuUtil:CreateButton(menu, addon.L["Earned By"]);
    self:CreateRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
    self:CreateRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
    self:CreateRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);
    addon.MenuUtil:AddChildMenu(menu, earnedBy);

    addon.MenuUtil:CreateDivider(menu);
    addon.MenuUtil:CreateTitle(menu, addon.L["Tabs"]);
    for _, t in next, addon.TabsOrder do
        self:CreateAchievementFilters(addon.MenuUtil:CreateButton(menu, addon.Tabs[t].Text), addon.Tabs[t].Filters, menu);
    end

    addon.MenuUtil:CreateDivider(menu);
    addon.MenuUtil:CreateTitle(menu, addon.L["Special Categories"]);
    self:CreateAchievementFilters(addon.MenuUtil:CreateButton(menu, addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone, menu);
    self:CreateAchievementFilters(addon.MenuUtil:CreateButton(menu, addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone, menu);
    self:CreateAchievementFilters(addon.MenuUtil:CreateButton(menu, addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements, menu);

    addon.MenuUtil:CreateDivider(menu);
    local help = addon.MenuUtil:CreateButton(menu, (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);
    local pages = addon.Tutorials.FeaturesTutorial.Pages;
    addon.MenuUtil:CreateTitle(help, addon.L["View Tutorial"]);
    for i, _ in next, pages do
        addon.MenuUtil:CreateButtonAndAdd(
            help,
            (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
            function()
                self:HelpShowTutorial(i);
            end
        );
    end
    addon.MenuUtil:AddChildMenu(menu, help);

    addon.MenuUtil:CreateButtonAndAdd(
        menu,
        addon.L["Options"],
        addon.Options.Open
    );

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        addon.MenuUtil:CreateDivider(menu);
        self:CreateCheckbox(menu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
    end
end