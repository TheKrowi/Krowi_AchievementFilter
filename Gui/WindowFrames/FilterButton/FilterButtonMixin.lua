local _, addon = ...;

local rootMenu = LibStub("Krowi_Menu-1.0");

KrowiAF_AchievementFrameFilterButtonMixin = {};

function KrowiAF_AchievementFrameFilterButtonMixin:OnLoad()
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnShow()
    AchievementFrame.Header.LeftDDLInset:Show();
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnHide()
    if addon.Util.IsClassicWithAchievements or not AchievementFrameFilterDropdown:IsShown() then
        AchievementFrame.Header.LeftDDLInset:Hide();
    end
end

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

local function GetCheckBoxStateText(text, filters, keys)
    return text .. ((filters == addon.Filters.db.profile and CheckBoxStateIsIndeterminate(keys)) and " (*)" or "");
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

local CreateCustomCheckbox;
do -- Checkbox
    local function KeyIsTrue(filters, keys)
        return addon.Util.ReadNestedKeys(filters, keys);
    end

    local function OnCheckboxSelect(filters, keys, checkTabs)
        SetSelected(filters, keys, not KeyIsTrue(filters, keys), checkTabs, true);
        UpdateAchievementFrame();
    end

    if addon.Util.IsTheWarWithin then
        function CreateCustomCheckbox(menu, text, filters, keys, checkTabs)
            menu:CreateCheckbox(GetCheckBoxStateText(text, filters, keys),
                function()
                    return KeyIsTrue(filters, keys);
                end,
                function()
                    OnCheckboxSelect(filters, keys, checkTabs);
                end
            );
        end
    else
        function CreateCustomCheckbox(menu, text, filters, keys, checkTabs)
            menu:AddFull({
                Text = GetCheckBoxStateText(text, filters, keys),
                Checked = function()
                    return KeyIsTrue(filters, keys);
                end,
                Func = function()
                    OnCheckboxSelect(filters, keys, checkTabs);
                    UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
                end,
                IsNotRadio = true,
                NotCheckable = false,
                KeepShownOnClick = true
            });
        end
    end
end

local CreateCustomRadio;
do -- Radio
    local function KeyEqualsText(text, filters, keys)
        return addon.Util.ReadNestedKeys(filters, keys) == text;
    end

    local function OnRadioSelect(text, filters, keys, checkTabs)
        SetSelected(filters, keys, text, checkTabs, false);
        KrowiAF_AchievementsFrame:ForceUpdate();
    end

    if addon.Util.IsTheWarWithin then
        function CreateCustomRadio(menu, text, filters, keys, checkTabs)
            local button = menu:CreateRadio(text,
                function()
                    return KeyEqualsText(text, filters, keys);
                end,
                function()
                    OnRadioSelect(text, filters, keys, checkTabs);
                end
            );
            button:SetResponse(MenuResponse.Refresh);
        end
    else
        function CreateCustomRadio(menu, text, filters, keys, checkTabs)
            menu:AddFull({
                Text = text,
                Checked = function()
                    return KeyEqualsText(text, filters, keys);
                end,
                Func = function()
                    OnRadioSelect(text, filters, keys, checkTabs);
                    rootMenu:SetSelectedName(text);
                end,
                NotCheckable = false,
                KeepShownOnClick = true
            });
        end
    end
end

local function IsMinorVersionChecked(filters, minor)
    local isChecked = true;
    for _, patch in next, minor.Patches do
        isChecked = isChecked and addon.Util.ReadNestedKeys(filters, {"BuildVersion", patch.BuildVersionId});
    end
    return isChecked;
end

local function IsMajorVersionChecked(filters, major)
    local isChecked = true;
    for _, minor in next, major.Minors do
        isChecked = isChecked and IsMinorVersionChecked(filters, minor);
    end
    return isChecked;
end

local function OnPatchVersionSelect(filters, patches, checked)
    for _, patch in next, patches do
        SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, not checked, true, true);
    end
end

local function OnMinorVersionSelect(filters, minor)
    local checked = IsMinorVersionChecked(filters, minor);
    OnPatchVersionSelect(filters, minor.Patches, checked);
    UpdateAchievementFrame();
end

local function OnMajorVersionSelect(filters, major)
    local checked = IsMajorVersionChecked(filters, major);
    for _, minor in next, major.Minors do
        OnPatchVersionSelect(filters, minor.Patches, checked);
    end
    UpdateAchievementFrame();
end

local CreateMinorVersionGroup;
local function CreateMinorVersion(majorGroup, filters, major, minor)
    if #minor.Patches <= 1 then
        CreateCustomCheckbox(majorGroup, major.Major .. "." .. minor.Minor .. "." .. minor.Patches[1].Patch, filters, {"BuildVersion", minor.Patches[1].BuildVersionId}, true);
        return;
    end
    local minorGroup = CreateMinorVersionGroup(majorGroup, filters, major, minor);
    for _, patch in next, minor.Patches do
        CreateCustomCheckbox(minorGroup, major.Major .. "." .. minor.Minor .. "." .. patch.Patch, filters, {"BuildVersion", patch.BuildVersionId}, true);
    end
end

if addon.Util.IsTheWarWithin then
    function CreateMinorVersionGroup(majorGroup, filters, major, minor)
        return majorGroup:CreateCheckbox(major.Major .. "." .. minor.Minor .. ".x",
            function()
                return IsMinorVersionChecked(filters, minor);
            end,
            function()
                OnMinorVersionSelect(filters, minor);
            end
        );
    end
else
    function CreateMinorVersionGroup(majorGroup, filters, major, minor)
        return majorGroup:AddFull({
            Text = major.Major .. "." .. minor.Minor .. ".x",
            Checked = function()
                return IsMinorVersionChecked(filters, minor);
            end,
            Func = function()
                OnMinorVersionSelect(filters, minor);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            IsNotRadio = true,
            NotCheckable = false,
            KeepShownOnClick = true
        });
    end
end

local CreateMajorVersionGroup;
local function CreateMajorVersion(version, filters, major)
    local majorGroup = CreateMajorVersionGroup(version, filters, major);
    for _, minor in next, major.Minors do
        CreateMinorVersion(majorGroup, filters, major, minor);
    end
end

if addon.Util.IsTheWarWithin then
    function CreateMajorVersionGroup(version, filters, major)
        return version:CreateCheckbox(major.Major .. ".x.x",
            function()
                return IsMajorVersionChecked(filters, major);
            end,
            function()
                OnMajorVersionSelect(filters, major);
            end
        );
    end
else
    function CreateMajorVersionGroup(version, filters, major)
        return version:AddFull({
            Text = major.Major .. ".x.x",
            Checked = function()
                return IsMajorVersionChecked(filters, major);
            end,
            Func = function()
                OnMajorVersionSelect(filters, major);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            IsNotRadio = true,
            NotCheckable = false,
            KeepShownOnClick = true
        });
    end
end

local CreateDivider;
if addon.Util.IsTheWarWithin then
    function CreateDivider(menu)
        menu:CreateDivider();
    end
else
    function CreateDivider(menu)
        menu:AddSeparator();
    end
end

local function OnAllVersionsSelect(filters, value)
    for _, major in next, addon.Data.BuildVersionsGrouped do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                SetSelected(filters, {"BuildVersion", patch.BuildVersionId}, value, true, true);
            end
        end
    end
    UpdateAchievementFrame();
end

local CreateSelectDeselectAllVersions;
if addon.Util.IsTheWarWithin then
    function CreateSelectDeselectAllVersions(version, filters)
        CreateDivider(version);
        local selectAll = version:CreateButton(addon.L["Select All"],
            function()
                OnAllVersionsSelect(filters, true);
            end
        );
        selectAll:SetResponse(MenuResponse.Refresh);
        local deselectAll = version:CreateButton(addon.L["Deselect All"],
            function()
                OnAllVersionsSelect(filters, false);
            end
        );
        deselectAll:SetResponse(MenuResponse.Refresh);
    end
else
    function CreateSelectDeselectAllVersions(version, filters)
        CreateDivider(version);
        version:AddFull({
            Text = addon.L["Select All"],
            Func = function()
                OnAllVersionsSelect(filters, true);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            KeepShownOnClick = true
        });
        version:AddFull({
            Text = addon.L["Deselect All"],
            Func = function()
                OnAllVersionsSelect(filters, false);
                UIDropDownMenu_RefreshAll(UIDROPDOWNMENU_OPEN_MENU);
            end,
            KeepShownOnClick = true
        });
    end
end

local function CreateBuildVersionFilterGroups(version, filters)
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

local CreateBuildVersionFilter;
if addon.Util.IsTheWarWithin then
    function CreateBuildVersionFilter(_menu, filters)
        local version = _menu:CreateButton(addon.L["Version"]);
        CreateBuildVersionFilterGroups(version, filters);
    end
else
    function CreateBuildVersionFilter(_menu, filters)
        local version = addon.Objects.MenuItem:New(addon.L["Version"]);
        CreateBuildVersionFilterGroups(version, filters);
        _menu:Add(version);
    end
end

local function AddAchievementFilters(_menu, childMenu, filters)
    local tmpMenu = childMenu or _menu;

    CreateCustomCheckbox(tmpMenu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

    CreateBuildVersionFilter(tmpMenu, filters);

    local faction = addon.Objects.MenuItem:New(addon.L["Faction"]);
    CreateCustomCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    CreateCustomCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    CreateCustomCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
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

    CreateCustomCheckbox(tmpMenu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
    CreateCustomCheckbox(tmpMenu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
    CreateCustomCheckbox(tmpMenu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        CreateCustomCheckbox(tmpMenu, addon.L["Tracking"], filters, {"Tracking"}, true);
    end
    CreateCustomCheckbox(tmpMenu, addon.L["Excluded"], filters, {"Excluded"}, true);
    CreateCustomCheckbox(tmpMenu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

    tmpMenu:AddSeparator();

    local text = addon.L["Sort By"];
    if filters == addon.Filters.db.profile and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = addon.Objects.MenuItem:New(text);
    CreateCustomRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
    sortBy:AddSeparator();
    CreateCustomCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true);
    tmpMenu:Add(sortBy);

    if childMenu then
        _menu:Add(tmpMenu);
    end
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnMouseDown()
    UIMenuButtonStretchMixin.OnMouseDown(self);
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    -- Reset menu
    rootMenu:Clear();

    -- Category Filters
    rootMenu:AddTitle(addon.L["Categories"]);

    CreateCustomCheckbox(rootMenu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    rootMenu:AddSeparator();

    -- Achievement Filters
    rootMenu:AddTitle(addon.L["Achievements"]);

    AddAchievementFilters(rootMenu, nil, addon.Filters.db.profile);

    local earnedBy = addon.Objects.MenuItem:New(addon.L["Earned By"]);
    CreateCustomRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
    CreateCustomRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
    CreateCustomRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);
    rootMenu:Add(earnedBy);

    rootMenu:AddSeparator();

    -- Filters per Tab
    rootMenu:AddTitle(addon.L["Tabs"]);

    for _, t in next, addon.TabsOrder do
        AddAchievementFilters(rootMenu, addon.Objects.MenuItem:New(addon.Tabs[t].Text), addon.Tabs[t].Filters);
    end
    rootMenu:AddSeparator();

    -- Special Categories Filters
    rootMenu:AddTitle(addon.L["Special Categories"]);

    AddAchievementFilters(rootMenu, addon.Objects.MenuItem:New(addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone);
    AddAchievementFilters(rootMenu, addon.Objects.MenuItem:New(addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone);
    AddAchievementFilters(rootMenu, addon.Objects.MenuItem:New(addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements);

    rootMenu:AddSeparator();

    -- Other
    local help = addon.Objects.MenuItem:New((addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);

    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    help:AddTitle(addon.L["View Tutorial"]);
    for i, _ in next, pages do
        help:AddFull({
            Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
            Func = function()
                rootMenu:Close();
                addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
            end
        });
    end
    rootMenu:Add(help);

    rootMenu:AddFull({
        Text = addon.L["Options"],
        Func = function()
            addon.Options.Open();
        end
    });

    if addon.Options.db.profile.ShowPlaceholdersFilter then
        rootMenu:AddSeparator();
        CreateCustomCheckbox(rootMenu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
    end

    rootMenu:Toggle(self, 96, 15);
end

-- The War Within DropDown rework
if not addon.Util.IsTheWarWithin then
    return;
end

KrowiAF_AchievementFrameFilterButtonModernMixin = CreateFromMixins(KrowiAF_AchievementFrameFilterButtonMixin);

function KrowiAF_AchievementFrameFilterButtonModernMixin:OnLoad()
    WowStyle1FilterDropdownMixin.OnLoad(self);
    KrowiAF_AchievementFrameFilterButtonMixin.OnLoad(self);
end

function KrowiAF_AchievementFrameFilterButtonModernMixin:OnShow()
    WowStyle1FilterDropdownMixin.OnShow(self);
    KrowiAF_AchievementFrameFilterButtonMixin.OnShow(self);
end

function KrowiAF_AchievementFrameFilterButtonModernMixin:OnHide()
    KrowiAF_AchievementFrameFilterButtonMixin.OnHide(self);
end

function KrowiAF_AchievementFrameFilterButtonModernMixin:OnMouseDown()
    WowStyle1FilterDropdownMixin.OnMouseDown(self);
end

local function CreateAchievementFilters(_menu, filters)
    CreateCustomCheckbox(_menu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    CreateCustomCheckbox(_menu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    CreateCustomCheckbox(_menu, addon.L["Past Obtainable"], filters, {"Obtainability", "PastObtainable"}, true);
    CreateCustomCheckbox(_menu, addon.L["Current Obtainable"], filters, {"Obtainability", "CurrentObtainable"}, true);
    CreateCustomCheckbox(_menu, addon.L["Future Obtainable"], filters, {"Obtainability", "FutureObtainable"}, true);

    CreateBuildVersionFilter(_menu, filters);

    local faction = _menu:CreateButton(addon.L["Faction"]);
    CreateCustomCheckbox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    CreateCustomCheckbox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    CreateCustomCheckbox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:CreateDivider();
    local function SetFactionFilters(value)
        for _faction, _ in next, filters.Faction do
            SetSelected(filters, {"Faction", _faction}, value, true, true);
        end
        UpdateAchievementFrame();
    end
    local selectAll = faction:CreateButton(addon.L["Select All"], SetFactionFilters, true);
    selectAll:SetResponse(MenuResponse.Refresh);
    local deselectAll = faction:CreateButton(addon.L["Deselect All"], SetFactionFilters, false);
    deselectAll:SetResponse(MenuResponse.Refresh);

    CreateCustomCheckbox(_menu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
    CreateCustomCheckbox(_menu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
    CreateCustomCheckbox(_menu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
    CreateCustomCheckbox(_menu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        CreateCustomCheckbox(_menu, addon.L["Tracking"], filters, {"Tracking"}, true);
    end
    CreateCustomCheckbox(_menu, addon.L["Excluded"], filters, {"Excluded"}, true);
    CreateCustomCheckbox(_menu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

    _menu:CreateDivider();
    local text = addon.L["Sort By"];
    if filters == addon.Filters.db.profile and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = _menu:CreateButton(text);
    CreateCustomRadio(sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    CreateCustomRadio(sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
    sortBy:CreateDivider();
    CreateCustomCheckbox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
end

function addon.LoadNew()
    KrowiAF_AchievementFrameFilterButton:SetupMenu(function(dropdown, rootMenu)
		rootMenu:SetTag("MENU_ACHIEVEMENT_FILTER");

        rootMenu:CreateTitle(addon.L["Categories"]);
        CreateCustomCheckbox(rootMenu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

        rootMenu:CreateDivider();
        rootMenu:CreateTitle(addon.L["Achievements"]);
        CreateAchievementFilters(rootMenu, addon.Filters.db.profile);

        local earnedBy = rootMenu:CreateButton(addon.L["Earned By"]);
        CreateCustomRadio(earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
        CreateCustomRadio(earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
        CreateCustomRadio(earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);

        rootMenu:CreateDivider();
        rootMenu:CreateTitle(addon.L["Tabs"]);
        for _, t in next, addon.TabsOrder do
            CreateAchievementFilters(rootMenu:CreateButton(addon.Tabs[t].Text), addon.Tabs[t].Filters);
        end

        rootMenu:CreateDivider();
        rootMenu:CreateTitle(addon.L["Special Categories"]);
        CreateAchievementFilters(rootMenu:CreateButton(addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone);
        CreateAchievementFilters(rootMenu:CreateButton(addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone);
        CreateAchievementFilters(rootMenu:CreateButton(addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements);

        rootMenu:CreateDivider();
        local help = rootMenu:CreateButton((addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]);
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

        rootMenu:CreateButton(addon.L["Options"], addon.Options.Open);

        if addon.Options.db.profile.ShowPlaceholdersFilter then
            rootMenu:CreateDivider();
            CreateCustomCheckbox(rootMenu, addon.L["Show placeholders"], addon.Filters.db.profile, {"ShowPlaceholders"});
        end
    end);
end