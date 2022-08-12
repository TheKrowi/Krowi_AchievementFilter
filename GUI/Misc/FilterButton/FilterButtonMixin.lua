-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementFrameFilterButtonMixin = {};

function KrowiAF_AchievementFrameFilterButtonMixin.UpdateAchievementFrame()
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
        if filters ~= addon.GUI.SelectedTab.Filters then
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

function KrowiAF_AchievementFrameFilterButtonMixin:AddCheckBox(_menu, text, filters, keys, checkTabs, ignoreAsMenuSelection)
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

function KrowiAF_AchievementFrameFilterButtonMixin:AddRadioButton(parentMenu, _menu, text, filters, keys, checkTabs)
    _menu:AddFull({  Text = text,
                    Checked = function() -- Same
                        return addon.Util.ReadNestedKeys(filters, keys) == text; -- e.g.: return filters.SortBy.Criteria == addon.L["Default"]
                    end,
                    Func = function()
                        addon.Util.WriteNestedKeys(filters, keys, text); -- e.g.: filters.SortBy.Criteria = text;
                        if checkTabs then
                            if filters ~= addon.GUI.SelectedTab.Filters then
                                filters.Refresh = true;
                            end
                            if filters == addon.Filters.db then
                                for t, _ in next, addon.Tabs do
                                    addon.Util.WriteNestedKeys(addon.Tabs[t].Filters, keys, addon.Util.ReadNestedKeys(filters, keys)); -- e.g.: addon.Tabs[t].Filters.SortBy.Criteria = filters.SortBy.Criteria
                                end
                            end
                        end
                        parentMenu:SetSelectedName(text);
                        addon.GUI.AchievementsFrame:ForceUpdate();
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

    local faction = addon.Objects.MenuItem:New({Text = addon.L["Faction"]});
    self:AddCheckBox(faction, addon.L["Neutral"], filters, {"Faction", "Neutral"}, true);
    self:AddCheckBox(faction, addon.L["Alliance"], filters, {"Faction", "Alliance"}, true);
    self:AddCheckBox(faction, addon.L["Horde"], filters, {"Faction", "Horde"}, true);
    faction:AddSeparator();
    faction:AddFull({  Text = addon.L["Select all"],
                        Func = function()
                            for faction2, _ in next, filters.Faction do
                                SetCheckBoxValue(filters, {"Faction", faction2}, true, true, true);
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