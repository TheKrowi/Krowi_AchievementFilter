local _, addon = ...;

KrowiAF_AchievementFrameFilterButtonMixin = {};

function KrowiAF_AchievementFrameFilterButtonMixin:OnLoad()
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnShow()
    AchievementFrame.Header.LeftDDLInset:Show();
end

function KrowiAF_AchievementFrameFilterButtonMixin:OnHide()
    if addon.Util.IsWrathClassic or not AchievementFrameFilterDropDown:IsShown() then
        AchievementFrame.Header.LeftDDLInset:Hide();
    end
end

function KrowiAF_AchievementFrameFilterButtonMixin:UpdateAchievementFrame()
    KrowiAF_CategoriesFrame:Update(true);
    KrowiAF_AchievementsFrame:ForceUpdate(); -- Issue #27: Fix
    KrowiAF_SummaryFrame:Update();
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

function KrowiAF_AchievementFrameFilterButtonMixin:AddCheckBox(_menu, text, filters, keys, checkTabs, ignoreAsMenuSelection)
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
            self:UpdateAchievementFrame();
        end,
        IsNotRadio = true,
        NotCheckable = false,
        KeepShownOnClick = true,
        IgnoreAsMenuSelection = ignoreAsMenuSelection
    });
end

function KrowiAF_AchievementFrameFilterButtonMixin:AddRadioButton(parentMenu, _menu, text, filters, keys, checkTabs)
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

function KrowiAF_AchievementFrameFilterButtonMixin:AddAchievementFilters(_menu, childMenu, filters)
    local tmpMenu = childMenu or _menu;

    self:AddCheckBox(tmpMenu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Obtainable"], filters, {"Obtainability", "Obtainable"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Not Obtainable"], filters, {"Obtainability", "NotObtainable"}, true);

    local faction = addon.Objects.MenuItem:New(addon.L["Faction"]);
    self:AddCheckBox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    self:AddCheckBox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    self:AddCheckBox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:AddSeparator();
    faction:AddFull({
        Text = addon.L["Select All"],
        Func = function()
            for _faction, _ in next, filters.Faction do
                SetSelected(filters, {"Faction", _faction}, true, true, true);
            end
            self:UpdateAchievementFrame();
        end
    });
    tmpMenu:Add(faction);

    self:AddCheckBox(tmpMenu, addon.L["Realm First!"], filters, {"Special", "RealmFirst"}, true);
    self:AddCheckBox(tmpMenu, addon.GetCategoryInfoTitle(81), filters, {"Special", "FeatsOfStrength"}, true);
    self:AddCheckBox(tmpMenu, addon.GetCategoryInfoTitle(95), filters, {"Special", "PvP"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    if addon.Options.db.profile.Categories.TrackingAchievements.DoLoad then
        self:AddCheckBox(tmpMenu, addon.L["Tracking"], filters, {"Tracking"}, true);
    end
    self:AddCheckBox(tmpMenu, addon.L["Excluded"], filters, {"Excluded"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Always Show Completed"], filters, {"Completion", "AlwaysShowCompleted"}, true);

    tmpMenu:AddSeparator();

    local text = addon.L["Sort By"];
    if filters == addon.Filters.db.profile and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = addon.Objects.MenuItem:New(text);
    self:AddRadioButton(_menu, sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["Points"], filters, {"SortBy", "Criteria"}, true);
    sortBy:AddSeparator();
    self:AddCheckBox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
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

    self:AddCheckBox(menu, addon.L["Merge Small Categories"], addon.Filters.db.profile, {"MergeSmallCategories"});

    menu:AddSeparator();

    -- Achievement Filters
    menu:AddTitle(addon.L["Achievements"]);

    self:AddAchievementFilters(menu, nil, addon.Filters.db.profile);
    local earnedBy = addon.Objects.MenuItem:New(addon.L["Earned By"]);
    self:AddRadioButton(menu, earnedBy, addon.Filters.Account, addon.Filters.db.profile, {"EarnedBy"}, false);
    self:AddRadioButton(menu, earnedBy, addon.Filters.CharacterAccount, addon.Filters.db.profile, {"EarnedBy"}, false);
    self:AddRadioButton(menu, earnedBy, addon.Filters.CharacterOnly, addon.Filters.db.profile, {"EarnedBy"}, false);
    menu:Add(earnedBy);

    menu:AddSeparator();

    -- Filters per Tab
    menu:AddTitle(addon.L["Tabs"]);

    for _, t in next, addon.TabsOrder do
        self:AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.Tabs[t].Text), addon.Tabs[t].Filters);
    end
    menu:AddSeparator();

    -- Special Categories Filters
    menu:AddTitle(addon.L["Special Categories"]);

    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Current Zone"]), addon.Filters.db.profile.CurrentZone);
    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Selected Zone"]), addon.Filters.db.profile.SelectedZone);
    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New(addon.L["Tracking Achievements"]), addon.Filters.db.profile.TrackingAchievements);

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
        self:AddCheckBox(menu, addon.L["Show placeholders"], addon.Filters.db, {"ShowPlaceholders"});
    end

	menu:Toggle(self, 96, 15);
end