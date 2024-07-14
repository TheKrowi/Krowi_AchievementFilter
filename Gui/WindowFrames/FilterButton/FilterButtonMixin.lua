local _, addon = ...;

KrowiAF_AchievementFrameFilterButtonMixin = {};

local LoadNew;
function KrowiAF_AchievementFrameFilterButtonMixin:OnLoad()
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    if addon.Util.IsTheWarWithin then
        LoadNew();
    end
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnShow()
    AchievementFrame.Header.LeftDDLInset:Show();
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnHide()
    if addon.Util.IsClassicWithAchievements or not AchievementFrameFilterDropdown:IsShown() then
        AchievementFrame.Header.LeftDDLInset:Hide();
    end
end

local function StateIsUndecided(keys)
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

local function SetSelected(filters, keys, value, checkTabs, refresh)
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

local function UpdateAchievementFrame()
    KrowiAF_CategoriesFrame:Update(true);
    KrowiAF_AchievementsFrame:ForceUpdate(); -- Issue #27: Fix
    KrowiAF_SummaryFrame:Update();
end

local function AddCheckBox(_menu, text, filters, keys, checkTabs, ignoreAsMenuSelection)
    if filters == addon.Filters.db.profile and StateIsUndecided(keys) then
        text = text .. " (*)";
    end
    _menu:AddFull({
        Text = text,
        Checked = function()
            return addon.Util.ReadNestedKeys(filters, keys);
        end,
        Func = function()
            SetSelected(filters, keys, not addon.Util.ReadNestedKeys(filters, keys), checkTabs, true);
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end,
        IsNotRadio = true,
        NotCheckable = false,
        KeepShownOnClick = true,
        IgnoreAsMenuSelection = ignoreAsMenuSelection
    });
end

local function AddRadioButton(parentMenu, _menu, text, filters, keys, checkTabs)
    _menu:AddFull({
        Text = text,
        Checked = function()
            return addon.Util.ReadNestedKeys(filters, keys) == text;
        end,
        Func = function()
            SetSelected(filters, keys, text, checkTabs, false);
            parentMenu:SetSelectedName(text);
            KrowiAF_AchievementsFrame:ForceUpdate();
        end,
        NotCheckable = false,
        KeepShownOnClick = true
    });
end

local function ValueIsUndecided(keys)
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

local function AddMinorVersion(majorGroup, filters, major, minor)
    if #minor.Patches <= 1 then
        AddCheckBox(majorGroup, major.Major .. "." .. minor.Minor .. "." .. minor.Patches[1].Patch, filters, {"BuildVersion", minor.Patches[1].BuildVersionId}, true);
        return;
    end
    local minorGroup = majorGroup:AddFull({
        Text = major.Major .. "." .. minor.Minor .. ".x",
        Checked = function()
            local isChecked = true;
            for _, patch in next, minor.Patches do
                isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
            end
            return isChecked;
        end,
        Func = function(self)
            local checked = self.checked;
            if type(checked) == "function" then
                checked = checked(self);
            end
            for _, patch in next, minor.Patches do
                SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end,
        IsNotRadio = true,
        NotCheckable = false,
        KeepShownOnClick = true
    });
    for _, patch in next, minor.Patches do
        AddCheckBox(minorGroup, major.Major .. "." .. minor.Minor .. "." .. patch.Patch, filters, {"BuildVersion", patch.BuildVersionId}, true);
    end
end

local function AddMajorVersion(version, filters, major)
    local majorGroup = version:AddFull({
        Text = major.Major .. ".x.x",
        Checked = function()
            local isChecked = true;
            for _, minor in next, major.Minors do
                for _, patch in next, minor.Patches do
                    isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
                end
            end
            return isChecked;
        end,
        Func = function(self)
            local checked = self.checked;
            if type(checked) == "function" then
                checked = checked(self);
            end
            for _, minor in next, major.Minors do
                for _, patch in next, minor.Patches do
                    SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
                end
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end,
        IsNotRadio = true,
        NotCheckable = false,
        KeepShownOnClick = true
    });
    for _, minor in next, major.Minors do
        AddMinorVersion(majorGroup, filters, major, minor);
    end
end

local function AddSelectDeselectAllVersions(version, filters)
    version:AddSeparator();
    version:AddFull({
        Text = addon.L["Select All"],
        Func = function()
            for _, major in next, addon.Data.BuildVersionsGrouped do
                for _, minor in next, major.Minors do
                    for _, patch in next, minor.Patches do
                        SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, true, true, true);
                    end
                end
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end,
        KeepShownOnClick = true
    });
    version:AddFull({
        Text = addon.L["Deselect All"],
        Func = function()
            for _, major in next, addon.Data.BuildVersionsGrouped do
                for _, minor in next, major.Minors do
                    for _, patch in next, minor.Patches do
                        SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, false, true, true);
                    end
                end
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end,
        KeepShownOnClick = true
    });
end

local function AddBuildVersionFilter(_menu, filters)
    local version = addon.Objects.MenuItem:New(addon.L["Version"]);
    if #addon.Data.BuildVersionsGrouped > 1 then
        for _, major in next, addon.Data.BuildVersionsGrouped do
            AddMajorVersion(version, filters, major)
        end
    else
        local major = addon.Data.BuildVersionsGrouped[1];
        for _, minor in next, major.Minors do
            AddMinorVersion(version, filters, major, minor);
        end
    end
    AddSelectDeselectAllVersions(version, filters);
    _menu:Add(version);
end

local function AddAchievementFilters(_menu, childMenu, filters)
    local tmpMenu = childMenu or _menu;

    AddCheckBox(tmpMenu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    AddCheckBox(tmpMenu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    AddCheckBox(tmpMenu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
    AddCheckBox(tmpMenu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
    AddCheckBox(tmpMenu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

    AddBuildVersionFilter(tmpMenu, filters);

    local faction = addon.Objects.MenuItem:New(addon.L["Faction"]);
    AddCheckBox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    AddCheckBox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    AddCheckBox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:AddSeparator();
    faction:AddFull({
        Text = addon.L["Select All"],
        Func = function()
            for _faction, _ in next, filters.Faction do
                SetSelected(filters, {"Faction", _faction}, true, true, true);
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end
    });
    faction:AddFull({
        Text = addon.L["Deselect All"],
        Func = function()
            for _faction, _ in next, filters.Faction do
                SetSelected(filters, {"Faction", _faction}, false, true, true);
            end
            UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            UpdateAchievementFrame();
        end
    });
    tmpMenu:Add(faction);

    AddCheckBox(tmpMenu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
    AddCheckBox(tmpMenu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
    AddCheckBox(tmpMenu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
    AddCheckBox(tmpMenu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        AddCheckBox(tmpMenu, addon.L["Tracking"], filters, {"Tracking"}, true);
    end
    AddCheckBox(tmpMenu, addon.L["Excluded"], filters, {"Excluded"}, true);
    AddCheckBox(tmpMenu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

    tmpMenu:AddSeparator();

    local text = addon.L["Sort By"];
    if filters == addon.Filters.db.profile and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = addon.Objects.MenuItem:New(text);
    AddRadioButton(_menu, sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(_menu, sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(_menu, sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(_menu, sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(_menu, sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
    sortBy:AddSeparator();
    AddCheckBox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
    tmpMenu:Add(sortBy);

    if childMenu then
        _menu:Add(tmpMenu);
    end
end

local menu = LibStub("Krowi_Menu-1.0");
function KrowiAF_AchievementFrameFilterButtonMixin:OnMouseDown()
    UIMenuButtonStretchMixin.OnMouseDown(self);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    -- Reset menu
	menu:Clear();

    -- Category Filters
    menu:AddTitle(addon.L["Categories"]);

    AddCheckBox(menu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    menu:AddSeparator();

    -- Achievement Filters
    menu:AddTitle(addon.L["Achievements"]);

    AddAchievementFilters(menu, nil, addon.Filters.db.profile);

    local earnedBy = addon.Objects.MenuItem:New(addon.L["Earned By"]);
    AddRadioButton(menu, earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
    AddRadioButton(menu, earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
    AddRadioButton(menu, earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);
    menu:Add(earnedBy);

    menu:AddSeparator();

    -- Filters per Tab
    menu:AddTitle(addon.L["Tabs"]);

    for _, t in next, addon.TabsOrder do
        AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.Tabs[t].Text), addon.Tabs[t].Filters);
    end
    menu:AddSeparator();

    -- Special Categories Filters
    menu:AddTitle(addon.L["Special Categories"]);

    AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone);
    AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone);
    AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements);

    menu:AddSeparator();

    -- Other
    local help = addon.Objects.MenuItem:New((addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);

    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    help:AddTitle(addon.L["View Tutorial"]);
    for i, _ in next, pages do
        help:AddFull({
            Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
            Func = function()
                menu:Close();
                addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
            end
        });
    end
    menu:Add(help);

    menu:AddFull({
        Text = addon.L["Options"],
        Func = function()
            addon.Options.Open();
        end
    });

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        menu:AddSeparator();
        AddCheckBox(menu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
    end

	menu:Toggle(self, 96, 15);
end

-- The War Within DropDown rework
-- TODO Anchor + OnShow + OnHide
if not addon.Util.IsTheWarWithin then
    return;
end

local function CreateCheckbox(_menu, text, filters, keys, checkTabs)
    _menu:CreateCheckbox(text,
        function()
            return addon.Util.ReadNestedKeys(filters, keys);
        end,
        function()
            SetSelected(filters, keys, not addon.Util.ReadNestedKeys(filters, keys), checkTabs, true);
            UpdateAchievementFrame();
        end
    );
end

local function CreateRadio(_menu, text, filters, keys, checkTabs)
    _menu:CreateRadio(text,
        function()
            return addon.Util.ReadNestedKeys(filters, keys) == text;
        end,
        function()
            SetSelected(filters, keys, text, checkTabs, false);
            KrowiAF_AchievementsFrame:ForceUpdate();
        end
    );
end

local function IsMinorVersionChecked(filters, minor)
    local isChecked = true;
    for _, patch in next, minor.Patches do
        isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
    end
    return isChecked;
end

local function CreateMinorVersion(majorGroup, filters, major, minor)
    if #minor.Patches <= 1 then
        CreateCheckbox(majorGroup, major.Major .. "." .. minor.Minor .. "." .. minor.Patches[1].Patch, filters, {"BuildVersion", minor.Patches[1].BuildVersionId}, true);
        return;
    end
    local minorGroup = majorGroup:CreateCheckbox(major.Major .. "." .. minor.Minor .. ".x",
        function()
            return IsMinorVersionChecked(filters, minor);
        end,
         function()
            local checked = IsMinorVersionChecked(filters, minor);
            for _, patch in next, minor.Patches do
                SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
            end
            UpdateAchievementFrame();
        end
    );
    for _, patch in next, minor.Patches do
        CreateCheckbox(minorGroup, major.Major .. "." .. minor.Minor .. "." .. patch.Patch, filters, {"BuildVersion", patch.BuildVersionId}, true);
    end
end

local function IsMajorVersionChecked(filters, major)
    local isChecked = true;
    for _, minor in next, major.Minors do
        for _, patch in next, minor.Patches do
            isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
        end
    end
    return isChecked;
end

local function CreateMajorVersion(version, filters, major)
    local majorGroup = version:CreateCheckbox(major.Major .. ".x.x",
        function()
            return IsMajorVersionChecked(filters, major);
        end,
        function()
            local checked = IsMajorVersionChecked(filters, major);
            for _, minor in next, major.Minors do
                for _, patch in next, minor.Patches do
                    SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
                end
            end
            UpdateAchievementFrame();
        end);
    for _, minor in next, major.Minors do
        CreateMinorVersion(majorGroup, filters, major, minor);
    end
end

local function CreateSelectDeselectAllVersions(version, filters)
    version:CreateDivider();
    version:CreateButton(addon.L["Select All"],
        function()
            for _, major in next, addon.Data.BuildVersionsGrouped do
                for _, minor in next, major.Minors do
                    for _, patch in next, minor.Patches do
                        SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, true, true, true);
                    end
                end
            end
            UpdateAchievementFrame();
        end);
    version:CreateButton(addon.L["Deselect All"],
        function()
            for _, major in next, addon.Data.BuildVersionsGrouped do
                for _, minor in next, major.Minors do
                    for _, patch in next, minor.Patches do
                        SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, false, true, true);
                    end
                end
            end
            UpdateAchievementFrame();
        end);
end

local function CreateBuildVersionFilter(_menu, filters)
    local version = _menu:CreateButton(addon.L["Version"]);
    if #addon.Data.BuildVersionsGrouped > 1 then
        for _, major in next, addon.Data.BuildVersionsGrouped do
            CreateMajorVersion(version, filters, major)
        end
    else
        local major = addon.Data.BuildVersionsGrouped[1];
        for _, minor in next, major.Minors do
            CreateMinorVersion(version, filters, major, minor);
        end
    end
    CreateSelectDeselectAllVersions(version, filters);
end

local function CreateAchievementFilters(_menu, filters)
    CreateCheckbox(_menu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    CreateCheckbox(_menu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    CreateCheckbox(_menu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
    CreateCheckbox(_menu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
    CreateCheckbox(_menu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

    CreateBuildVersionFilter(_menu, filters);

    local faction = _menu:CreateButton(addon.L["Faction"]);
    CreateCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    CreateCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    CreateCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:CreateDivider();
    local function SetFactionFilters(value)
        for _faction, _ in next, filters.Faction do
            SetSelected(filters, {"Faction", _faction}, value, true, true);
        end
        UpdateAchievementFrame();
    end
    faction:CreateButton(addon.L["Select All"], SetFactionFilters, true);
    faction:CreateButton(addon.L["Deselect All"], SetFactionFilters, false);

    CreateCheckbox(_menu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
    CreateCheckbox(_menu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
    CreateCheckbox(_menu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
    CreateCheckbox(_menu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        CreateCheckbox(_menu, addon.L["Tracking"], filters, {"Tracking"}, true);
    end
    CreateCheckbox(_menu, addon.L["Excluded"], filters, {"Excluded"}, true);
    CreateCheckbox(_menu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

    _menu:CreateDivider();
    local text = addon.L["Sort By"];
    if filters == addon.Filters.db.profile and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = _menu:CreateButton(text);
    CreateRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    CreateRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    CreateRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    CreateRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    CreateRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
    sortBy:CreateDivider();
    CreateCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
end

function LoadNew()
    KrowiAF_AchievementFrameFilterDropdown:SetupMenu(function(dropdown, rootDescription)
		rootDescription:SetTag("MENU_ACHIEVEMENT_FILTER");

        rootDescription:CreateTitle(addon.L["Categories"]);
        CreateCheckbox(rootDescription, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

        rootDescription:CreateDivider();
        rootDescription:CreateTitle(addon.L["Achievements"]);
        CreateAchievementFilters(rootDescription, addon.Filters.db.profile);

        local earnedBy = rootDescription:CreateButton(addon.L["Earned By"]);
        CreateRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
        CreateRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
        CreateRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);

        rootDescription:CreateDivider();
        rootDescription:CreateTitle(addon.L["Tabs"]);
        for _, t in next, addon.TabsOrder do
            CreateAchievementFilters(rootDescription:CreateButton(addon.Tabs[t].Text), addon.Tabs[t].Filters);
        end

        rootDescription:CreateDivider();
        rootDescription:CreateTitle(addon.L["Special Categories"]);
        CreateAchievementFilters(rootDescription:CreateButton(addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone);
        CreateAchievementFilters(rootDescription:CreateButton(addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone);
        CreateAchievementFilters(rootDescription:CreateButton(addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements);

        rootDescription:CreateDivider();
        local help = rootDescription:CreateButton((addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);
        local pages = addon.Tutorials.FeaturesTutorial.Pages;
        help:CreateTitle(addon.L["View Tutorial"]);
        for i, _ in next, pages do
            help:CreateButton(
                (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
                function()
                    addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
                end
            );
        end

        rootDescription:CreateButton(addon.L["Options"], addon.Options.Open);

        if addon.Options.db.profile.ShowPlaceholdersFilter then
            rootDescription:CreateDivider();
            CreateCheckbox(rootDescription, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
        end
    end);
end