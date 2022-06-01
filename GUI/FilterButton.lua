-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.FilterButton = {};
local filterButton = gui.FilterButton;

local defaultAchievements = {
    Completion = {
        Completed = true,
        NotCompleted = true
    },
    Obtainability = {
        Obtainable = true,
        NotObtainable = false
    },
    Faction = {
        Neutral = true,
        Alliance = false,
        Horde = false
    },
    Covenant = {
        Neutral = true,
        Kyrian = true,
        Venthyr = true,
        NightFae = true,
        Necrolord = true
    },
    CollapseSeries = true,
    Excluded = false,
    SortBy = {
        Criteria = addon.L["Default"],
        ReverseSort = false
    }
};

local defaults = {
    profile = {
        MergeSmallCategories = true,
        EarnedBy = "Account",
        ShowPlaceholders = false
    }
};

-- [[ Inject Defaults ]] --
local InjectAchievementDefaults, InjectCategoryDefaults, InjectTabDefaults;
function filterButton:InjectDefaults()
    InjectAchievementDefaults();
    InjectCategoryDefaults();
    InjectTabDefaults();
end

function InjectAchievementDefaults()
    addon.Util.DeepCopyTable(defaultAchievements, defaults.profile);
end

function InjectCategoryDefaults()
    local dflts = {};
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"CurrentZone"}, dflts);
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"SelectedZone"}, dflts);
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"ExcludedCategory"}, dflts);
end

function InjectTabDefaults()
    local tabsFilters = {};
    for t, _ in next, addon.Tabs do
        tabsFilters[t] = {};
        addon.Util.DeepCopyTable(defaultAchievements, tabsFilters[t]);
    end
    addon.Util.WriteNestedKeys(defaults.profile, {"Tabs"}, tabsFilters);
end

-- [[ Constructors ]] --
local ResetFilters;
filterButton.__index = filterButton; -- Used to inject all the namespace functions to the frame
function filterButton:Load()
    diagnostics.Trace("filterButton:Load");

    -- Create button
    local button = CreateFrame("DropDownToggleButton", "KrowiAF_FilterButton", AchievementFrame, "KrowiAF_FilterButton_Template");
    addon.Util.InjectMetatable(button, filterButton); -- Inject all the namespace functions to the frame
    button:SetScript("OnMouseDown", filterButton.OnMouseDown);
	button:SetFrameLevel(button:GetParent():GetFrameLevel() + 7);

    -- Load filters
    button.Filters = LibStub("AceDB-3.0"):New("Filters", defaults, true);
    button.Filters.db = button.Filters.profile;
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = button.Filters.profile.Tabs[t];
    end
    ResetFilters(button);

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, button:GetName());
    button:Hide();

	addon.GUI.FilterButton = button; -- Overwrite with the actual frame since all functions are injected to it
end

local function ResetFactionFilters(tbl)
    addon.Util.WriteNestedKeys(tbl, {"Neutral"}, true);
    addon.Util.WriteNestedKeys(tbl, {"Alliance"}, addon.Faction.IsAlliance);
    addon.Util.WriteNestedKeys(tbl, {"Horde"}, addon.Faction.IsHorde);
end

function ResetFilters(self)
    if addon.Options.db.Filters.ResetFactionFilters then
        ResetFactionFilters(self.Filters.db.Faction);
        ResetFactionFilters(self.Filters.db.CurrentZone.Faction);
        ResetFactionFilters(self.Filters.db.SelectedZone.Faction);
        ResetFactionFilters(self.Filters.db.ExcludedCategory.Faction);
        for t, _ in next, addon.Tabs do
            ResetFactionFilters(self.Filters.db.Tabs[t].Faction);
        end
    end
end

-- [[ Build Drop Down Menu ]] --
local menu = LibStub("Krowi_Menu-1.0");
local AddCheckBox, AddRadioButton, AddAchievementFilters;
function filterButton:OnMouseDown()
    diagnostics.Trace("filterButton:OnMouseDown");

    UIMenuButtonStretchMixin.OnMouseDown(self);
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);

    -- Reset menu
	menu:Clear();

    -- Category Filters
    menu:AddFull({  Text = addon.L["Categories"],
                    IsTitle = true
                });

    AddCheckBox(self, menu, addon.L["Merge Small Categories"], self.Filters.db, {"MergeSmallCategories"});

    menu:AddSeparator();

    -- Achievement Filters
    menu:AddFull({  Text = addon.L["Achievements"],
                    IsTitle = true
                });

    AddAchievementFilters(self, menu, nil, self.Filters.db);
    local earnedBy = addon.Objects.MenuItem:New({Text = addon.L["Earned By"]});
    AddRadioButton(self, menu, earnedBy, addon.L["Account"], self.Filters.db, {"EarnedBy"}, true);
    AddRadioButton(self, menu, earnedBy, addon.L["Character"], self.Filters.db, {"EarnedBy"}, true);
    menu:Add(earnedBy);

    menu:AddSeparator();

    -- Filters per Tab
    menu:AddFull({  Text = addon.L["Tabs"],
                    IsTitle = true
                });

    for _, t in next, addon.TabsOrder do
        AddAchievementFilters(self, menu, addon.Objects.MenuItem:New({Text = addon.Tabs[t].Text}), addon.Tabs[t].Filters);
    end
    menu:AddSeparator();

    -- Special Categories Filters
    menu:AddFull({  Text = addon.L["Special Categories"],
                    IsTitle = true
                });

    AddAchievementFilters(self, menu, addon.Objects.MenuItem:New({Text = addon.L["Current Zone"]}), self.Filters.db.CurrentZone);
    AddAchievementFilters(self, menu, addon.Objects.MenuItem:New({Text = addon.L["Selected Zone"]}), self.Filters.db.SelectedZone);
    if addon.Options.db.Categories.Excluded.Show then
        AddAchievementFilters(self, menu, addon.Objects.MenuItem:New({Text = addon.L["Excluded"]}), self.Filters.db.ExcludedCategory);
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
        AddCheckBox(self, menu, addon.L["Show placeholders"], self.Filters.db, {"ShowPlaceholders"});
    end
	menu:Toggle(self, 96, 15);
end

local function UpdateAchievementFrame()
    gui.CategoriesFrame:Update(true);
    gui.AchievementsFrame:ForceUpdate(true); -- Issue #27: Fix
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

function AddCheckBox(self, menu, text, filters, keys, checkTabs, ignoreAsMenuSelection)
    if filters == self.Filters.db and StateIsUndecided(keys) then
        text = text .. " (*)";
    end
    menu:AddFull({	Text = text,
                    Checked = function() -- Using function here, we force the GUI to get the value again instead of only once (caused visual bugs)
                        return addon.Util.ReadNestedKeys(filters, keys); -- e.g.: return filters.Completion.Completed;
                    end,
                    Func = function()
                        addon.Util.WriteNestedKeys(filters, keys, not addon.Util.ReadNestedKeys(filters, keys)); -- e.g.: filters.Completion.Completed = not filters.Completion.Completed;
                        if checkTabs then
                            if filters ~= gui.SelectedTab.Filters then
                                filters.Refresh = true;
                            end
                            if filters == self.Filters.db then
                                for t, _ in next, addon.Tabs do
                                    addon.Util.WriteNestedKeys(addon.Tabs[t].Filters, keys, addon.Util.ReadNestedKeys(filters, keys)); -- e.g.: addon.Tabs[t].Filters.Completion.Completed = filters.Completion.Completed;
                                    addon.Tabs[t].Filters.Refresh = true;
                                end
                            end
                        end
                        UpdateAchievementFrame();
                    end,
                    IsNotRadio = true,
                    NotCheckable = false,
                    KeepShownOnClick = true,
                    IgnoreAsMenuSelection = ignoreAsMenuSelection
                });
end

function AddRadioButton(self, parentMenu, menu, text, filters, keys, checkTabs)
    menu:AddFull({  Text = text,
                    Checked = function() -- Same
                        return addon.Util.ReadNestedKeys(filters, keys) == text; -- e.g.: return filters.SortBy.Criteria == addon.L["Default"]
                    end,
                    Func = function()
                        addon.Util.WriteNestedKeys(filters, keys, text); -- e.g.: filters.SortBy.Criteria = text;
                        if checkTabs then
                            if filters ~= gui.SelectedTab.Filters then
                                filters.Refresh = true;
                            end
                            if filters == self.Filters.db then
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

function AddAchievementFilters(self, menu, childMenu, filters)
    local tmpMenu = childMenu or menu;

    AddCheckBox(self, tmpMenu, addon.L["Completed"], filters, {"Completion", "Completed"}, true);
    AddCheckBox(self, tmpMenu, addon.L["Not Completed"], filters, {"Completion", "NotCompleted"}, true);
    AddCheckBox(self, tmpMenu, addon.L["Obtainable"], filters, {"Obtainability", "Obtainable"}, true);
    AddCheckBox(self, tmpMenu, addon.L["Not Obtainable"], filters, {"Obtainability", "NotObtainable"}, true);

    local faction = addon.Objects.MenuItem:New({Text = addon.L["Faction"]});
    AddCheckBox(self, faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    AddCheckBox(self, faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    AddCheckBox(self, faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:AddSeparator();
    faction:AddFull({  Text = addon.L["Select all"],
                        Func = function()
                            for faction, _ in next, filters.Faction do
                                filters.Faction[faction] = true;
                            end
                            UpdateAchievementFrame();
                        end
                    });
    tmpMenu:Add(faction);

    local covenant = addon.Objects.MenuItem:New({Text = addon.L["Covenant"]});
    AddCheckBox(self, covenant, addon.L["Neutral"], filters, {"Covenant", "Neutral"}, true);
    AddCheckBox(self, covenant, addon.L["Kyrian"], filters, {"Covenant", "Kyrian"}, true);
    AddCheckBox(self, covenant, addon.L["Venthyr"], filters, {"Covenant", "Venthyr"}, true);
    AddCheckBox(self, covenant, addon.L["Night Fae"], filters, {"Covenant", "NightFae"}, true);
    AddCheckBox(self, covenant, addon.L["Necrolord"], filters, {"Covenant", "Necrolord"}, true);
    covenant:AddSeparator();
    covenant:AddFull({ Text = addon.L["Select all"],
                        Func = function()
                            for covenant, _ in next, filters.Covenant do
                                filters.Covenant[covenant] = true;
                            end
                            UpdateAchievementFrame();
                        end
                    });
    tmpMenu:Add(covenant);

    AddCheckBox(self, tmpMenu, addon.L["Collapse Chain"], filters, {"CollapseSeries"}, true);
    AddCheckBox(self, tmpMenu, addon.L["Excluded"], filters, {"Excluded"}, true);

    tmpMenu:AddSeparator();

    local text = addon.L["Sort By"];
    if filters == self.Filters.db and ValueIsUndecided({"SortBy", "Criteria"}) then
        text = text .. " (*)";
    end
    local sortBy = addon.Objects.MenuItem:New({Text = text});
    AddRadioButton(self, menu, sortBy, addon.L["Default"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(self, menu, sortBy, addon.L["Name"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(self, menu, sortBy, addon.L["Completion"], filters, {"SortBy", "Criteria"}, true);
    AddRadioButton(self, menu, sortBy, addon.L["ID"], filters, {"SortBy", "Criteria"}, true);
    sortBy:AddSeparator();
    AddCheckBox(self, sortBy, addon.L["Reverse Sort"], filters, {"SortBy", "ReverseSort"}, true, true);
    tmpMenu:Add(sortBy);

    if childMenu then
        menu:Add(tmpMenu);
    end
end

-- [[ Validation ]] --
local completedCache, ignoreCollapseSeriesCache;
local validations = {
    {   -- 1
        Validate = function(filters, achievement) return not filters.Completion.Completed and completedCache; end,
        SetFilter = function(filters) filters.Completion.Completed = not filters.Completion.Completed; end
    },
    {   -- 2
        Validate = function(filters, achievement) return not filters.Completion.NotCompleted and not completedCache; end,
        SetFilter = function(filters) filters.Completion.NotCompleted = not filters.Completion.NotCompleted; end
    },
    {   -- 3
        Validate = function(filters, achievement) return not filters.Obtainability.Obtainable and achievement.NotObtainable == nil; end,
        SetFilter = function(filters) filters.Obtainability.Obtainable = not filters.Obtainability.Obtainable; end
    },
    {   -- 4
        Validate = function(filters, achievement) return not filters.Obtainability.NotObtainable and achievement.NotObtainable; end,
        SetFilter = function(filters) filters.Obtainability.NotObtainable = not filters.Obtainability.NotObtainable; end
    },
    {   -- 5
        Validate = function(filters, achievement) return not filters.Faction.Neutral and achievement.Faction == nil; end,
        SetFilter = function(filters) filters.Faction.Neutral = not filters.Faction.Neutral; end
    },
    {   -- 6
        Validate = function(filters, achievement) return not filters.Faction.Alliance and achievement.Faction == addon.Objects.Faction.Alliance; end,
        SetFilter = function(filters) filters.Faction.Alliance = not filters.Faction.Alliance; end
    },
    {   -- 7
        Validate = function(filters, achievement) return not filters.Faction.Horde and achievement.Faction == addon.Objects.Faction.Horde; end,
        SetFilter = function(filters) filters.Faction.Horde = not filters.Faction.Horde end
    },
    {   -- 8
        Validate = function(filters, achievement) return not filters.Covenant.Neutral and achievement.Covenant == nil; end,
        SetFilter = function(filters) filters.Covenant.Neutral = not filters.Covenant.Neutral; end
    },
    {   -- 9
        Validate = function(filters, achievement) return not filters.Covenant.Kyrian and achievement.Covenant == addon.Objects.Covenant.Kyrian; end,
        SetFilter = function(filters) filters.Covenant.Kyrian = not filters.Covenant.Kyrian; end
    },
    {   -- 10
        Validate = function(filters, achievement) return not filters.Covenant.Venthyr and achievement.Covenant == addon.Objects.Covenant.Venthyr; end,
        SetFilter = function(filters) filters.Covenant.Venthyr = not filters.Covenant.Venthyr; end
    },
    {   -- 11
        Validate = function(filters, achievement) return not filters.Covenant.NightFae and achievement.Covenant == addon.Objects.Covenant.NightFae; end,
        SetFilter = function(filters) filters.Covenant.NightFae = not filters.Covenant.NightFae; end
    },
    {   -- 12
        Validate = function(filters, achievement) return not filters.Covenant.Necrolord and achievement.Covenant == addon.Objects.Covenant.Necrolord; end,
        SetFilter = function(filters) filters.Covenant.Necrolord = not filters.Covenant.Necrolord; end
    },

    {   -- 13
        Validate = function(filters, achievement)
            if filters.CollapseSeries and ignoreCollapseSeriesCache ~= true then
                local _, nextCompleted = addon.GetNextAchievement(achievement);
                if nextCompleted then
                    return true;
                end
                local prevID = GetPreviousAchievement(achievement.ID);
                if prevID ~= nil then
                    local _, _, _, prevCompleted = addon.GetAchievementInfo(prevID);
                    if not prevCompleted then
                        return true;
                    end
                end
            end
            return false;
        end,
        SetFilter = function(filters) filters.CollapseSeries = not filters.CollapseSeries end
    },
    {   -- 14
        Validate = function(filters, achievement) return not filters.Excluded and achievement.Excluded end,
        SetFilter = function(filters) filters.Excluded = not filters.Excluded; end
    },
    {   -- 15
        Validate = function(filters, achievement)
            if not addon.Options.db.ShowPlaceholdersFilter and achievement.DoesNotExist then
                return true;
            end
            return not gui.FilterButton.Filters.db.ShowPlaceholders and achievement.DoesNotExist;
        end,
        SetFilter = function(filters) end
    }
};

function filterButton.Validate(filters, achievement, ignoreCollapseSeries)
    -- diagnostics.Trace("filterButton.Validate " .. tostring(achievement.ID)); -- Generates a lot of messages

    _, _, _, completedCache = addon.GetAchievementInfo(achievement.ID);
    ignoreCollapseSeriesCache = ignoreCollapseSeries;
    for i, validation in next, validations do
        if validation.Validate(filters, achievement) then -- If true, DO NOT show achievement
            return -i;
        end
    end
    return 1;
end

function filterButton:AutoValidate(achievement, ignoreCollapseSeries)
    return self.Validate(self:GetFilters(), achievement, ignoreCollapseSeries);
end

function filterButton:SetFilters(filters, achievement)
    diagnostics.Trace("filterButton:SetFilters");

    local iterations = 0;
    while true do
        local id = self.Validate(filters, achievement);
        if id == 1 then
            if iterations > 0 then -- If 0, nothing changed so no need to update
                filters.Refresh = true;
                UpdateAchievementFrame();
            end
            return; -- Jump out of loop
        else
            validations[-id].SetFilter(filters);
        end

        iterations = iterations + 1;
    end
end

-- [[ Other ]] --
function filterButton:GetFilters(category)
    if category == nil then
        category = gui.SelectedTab.SelectedCategory;
    end

	if category == addon.Data.CurrentZoneCategory then
		return self.Filters.db.CurrentZone;
	elseif category == addon.Data.SelectedZoneCategory then
		return self.Filters.db.SelectedZone;
	elseif category == addon.Data.ExcludedCategory or (category ~= nil and category.Excluded) then
		return self.Filters.db.ExcludedCategory;
    elseif gui.SelectedTab.Filters ~= nil then
        return gui.SelectedTab.Filters;
	end

    return self.Filters.db;
end

function filterButton:GetHighestAchievementWhenCollapseSeries(fliters, achievement)
    diagnostics.Trace("filterButton:GetHighestCollapsedSeriesAchievement");

    if not achievement then
        return;
    end

    if fliters.CollapseSeries then
		local nextAchievement, completed = addon.GetNextAchievement(achievement);
		if nextAchievement and completed then
			local newAchievement;
			while nextAchievement and completed do
				newAchievement, completed = addon.GetNextAchievement(nextAchievement);
				if newAchievement and completed then
					nextAchievement = newAchievement;
				end
			end
			achievement = nextAchievement;
		end
	end

    return achievement;
end