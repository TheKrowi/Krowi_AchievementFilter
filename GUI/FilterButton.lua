-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.FilterButton = {};
local filterButton = gui.FilterButton;

filterButton.__index = filterButton; -- Used to inject all the namespace functions to the frame
function filterButton:Load()
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_AchievementFrameFilterButton", AchievementFrame, "KrowiAF_AchievementFrameFilterButton_Template");
    addon.Util.InjectMetatable(button, filterButton); -- Inject all the namespace functions to the frame
	button:SetFrameLevel(button:GetParent():GetFrameLevel() + 7);

    addon.Filters:Load();
    addon.Filters:ResetFilters();

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, button:GetName());

	addon.GUI.FilterButton = button; -- Overwrite with the actual frame since all functions are injected to it
end

local menu = LibStub("Krowi_Menu-1.0");
function KrowiAF_AchievementFrameFilterButton_OnMouseDown(self)
    UIMenuButtonStretchMixin.OnMouseDown(self);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    -- Reset menu
	menu:Clear();

    -- Category Filters
    menu:AddFull({  Text = addon.L["Categories"],
                    IsTitle = true
                });

    self:AddCheckBox(menu, addon.L["Merge Small Categories"], addon.Filters.db, {"MergeSmallCategories"});

    menu:AddSeparator();

    -- Achievement Filters
    menu:AddFull({  Text = addon.L["Achievements"],
                    IsTitle = true
                });

    self:AddAchievementFilters(menu, nil, addon.Filters.db);
    local earnedBy = addon.Objects.MenuItem:New({Text = addon.L["Earned By"]});
    self:AddRadioButton(menu, earnedBy, addon.L["Account"], addon.Filters.db, {"EarnedBy"}, true);
    self:AddRadioButton(menu, earnedBy, (GetCategoryInfo(92)), addon.Filters.db, {"EarnedBy"}, true);
    menu:Add(earnedBy);

    menu:AddSeparator();

    -- Filters per Tab
    menu:AddFull({  Text = addon.L["Tabs"],
                    IsTitle = true
                });

    for _, t in next, addon.TabsOrder do
        self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.Tabs[t].Text}), addon.Tabs[t].Filters);
    end
    menu:AddSeparator();

    -- Special Categories Filters
    menu:AddFull({  Text = addon.L["Special Categories"],
                    IsTitle = true
                });

    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Current Zone"]}), addon.Filters.db.CurrentZone);
    self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Selected Zone"]}), addon.Filters.db.SelectedZone);
    if addon.Options.db.Categories.Excluded.Show then
        self:AddAchievementFilters(menu, addon.Objects.MenuItem:New({Text = addon.L["Excluded"]}), addon.Filters.db.ExcludedCategory);
    end

    menu:AddSeparator();

    -- Other
    local help = addon.Objects.MenuItem:New({
        Text = (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Help"]
    });

    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    help:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
    for i, _ in next, pages do
        help:AddFull({ Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Colors.White, addon.Colors.RemoveColor(pages[i].SubTitle)),
                        Func = function()
                            menu:Close();
                            addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
                        end
                    });
    end
    menu:Add(help);

    menu:AddFull({  Text = addon.L["Options"],
                    Func = function()
                        addon.Options.Open();
                    end
                });

    if addon.Options.db.ShowPlaceholdersFilter then
        menu:AddSeparator();
        self:AddCheckBox(menu, addon.L["Show placeholders"], addon.Filters.db, {"ShowPlaceholders"});
    end
	menu:Toggle(self, 96, 15);
end

function filterButton.UpdateAchievementFrame()
    addon.GUI.CategoriesFrame:Update(true);
    addon.GUI.AchievementsFrame:ForceUpdate(true); -- Issue #27: Fix
    addon.GUI.SummaryFrame:Update();
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

local function SetCheckBoxValue(filters, keys, value, checkTabs, refresh)
    addon.Util.WriteNestedKeys(filters, keys, value);
    if checkTabs then
        if filters ~= gui.SelectedTab.Filters then
            filters.Refresh = true;
        end
        if filters == addon.Filters.db then
            for t, _ in next, addon.Tabs do
                addon.Util.WriteNestedKeys(addon.Tabs[t].Filters, keys, addon.Util.ReadNestedKeys(filters, keys));
                addon.Tabs[t].Filters.Refresh = refresh;
            end
        end
    end
end

function filterButton:AddCheckBox(_menu, text, filters, keys, checkTabs, ignoreAsMenuSelection)
    if filters == addon.Filters.db and StateIsUndecided(keys) then
        text = text .. " (*)";
    end
    _menu:AddFull({	Text = text,
                    Checked = function() -- Using function here, we force the GUI to get the value again instead of only once (caused visual bugs)
                        return addon.Util.ReadNestedKeys(filters, keys); -- e.g.: return filters.Completion.Completed;
                    end,
                    Func = function()
                        SetCheckBoxValue(filters, keys, not addon.Util.ReadNestedKeys(filters, keys), checkTabs, true);
                        self.UpdateAchievementFrame();
                    end,
                    IsNotRadio = true,
                    NotCheckable = false,
                    KeepShownOnClick = true,
                    IgnoreAsMenuSelection = ignoreAsMenuSelection
                });
end

function filterButton:AddRadioButton(parentMenu, _menu, text, filters, keys, checkTabs)
    _menu:AddFull({  Text = text,
                    Checked = function() -- Same
                        return addon.Util.ReadNestedKeys(filters, keys) == text; -- e.g.: return filters.SortBy.Criteria == addon.L["Default"]
                    end,
                    Func = function()
                        addon.Util.WriteNestedKeys(filters, keys, text); -- e.g.: filters.SortBy.Criteria = text;
                        if checkTabs then
                            if filters ~= gui.SelectedTab.Filters then
                                filters.Refresh = true;
                            end
                            if filters == addon.Filters.db then
                                for t, _ in next, addon.Tabs do
                                    addon.Util.WriteNestedKeys(addon.Tabs[t].Filters, keys, addon.Util.ReadNestedKeys(filters, keys)); -- e.g.: addon.Tabs[t].Filters.SortBy.Criteria = filters.SortBy.Criteria
                                end
                            end
                        end
                        parentMenu:SetSelectedName(text);
                        gui.AchievementsFrame:ForceUpdate();
                    end,
                    NotCheckable = false,
                    KeepShownOnClick = true
                });
end

function filterButton:AddAchievementFilters(_menu, childMenu, filters)
    local tmpMenu = childMenu or _menu;

    self:AddCheckBox(tmpMenu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Obtainable"], filters, {"Obtainability", "Obtainable"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Not Obtainable"], filters, {"Obtainability", "NotObtainable"}, true);

    local faction = addon.Objects.MenuItem:New({Text = addon.L["Faction"]});
    self:AddCheckBox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    self:AddCheckBox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    self:AddCheckBox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:AddSeparator();
    faction:AddFull({  Text = addon.L["Select all"],
                        Func = function()
                            for _faction, _ in next, filters.Faction do
                                SetCheckBoxValue(filters, {"Faction", _faction}, true, true, true);
                            end
                            self.UpdateAchievementFrame();
                        end
                    });
    tmpMenu:Add(faction);

    self:AddCheckBox(tmpMenu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    self:AddCheckBox(tmpMenu, addon.L["Excluded"], filters, {"Excluded"}, true);

    tmpMenu:AddSeparator();

    local text = addon.L["Sort By"];
    if filters == addon.Filters.db and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = addon.Objects.MenuItem:New({Text = text});
    self:AddRadioButton(_menu, sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    self:AddRadioButton(_menu, sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    sortBy:AddSeparator();
    self:AddCheckBox(sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
    tmpMenu:Add(sortBy);

    if childMenu then
        _menu:Add(tmpMenu);
    end
end