-- [[ Namespaces ]] --
local addonName, addon = ...;

function KrowiAF_SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	if mouseButton == nil then
		mouseButton = "LeftButton";
	end

	local scrollFrame = addon.GUI.AchievementsFrame.Container;
	local scrollBar = scrollFrame.ScrollBar;

	KrowiAF_SelectCategory(category);
	scrollBar:SetValue(0); -- Makes sure the scrollbar is at the top since this can be in a diff location if the category is already selected

	local selectedTab = addon.GUI.SelectedTab; -- This changes when calling KrowiAF_SelectCategory

	-- Select achievement
	local shown = false;
	local previousScrollValue;
	local buttons;
	local selectedAchievement;

	while not shown do
		buttons = scrollFrame.buttons;
		for _, button in next, buttons do
			if button.id == achievement.ID and math.ceil(button:GetTop()) >= math.ceil(addon.GUI.GetSafeScrollChildBottom(scrollFrame)) then
				selectedAchievement = selectedTab.SelectedAchievement;
				if not (selectedAchievement and selectedAchievement.ID == achievement.ID) then
					button:Click(mouseButton, nil, ignoreModifiers, anchor, offsetX, offsetY);
				end
				shown = button;
				break;
			end
		end
		if scrollBar:IsShown() then
			local _, maxVal = scrollBar:GetMinMaxValues();
			if shown then
				local newHeight = scrollBar:GetValue() + scrollFrame:GetTop() - shown:GetTop();
				newHeight = min(newHeight, maxVal);
				scrollBar:SetValue(newHeight);
			else
				local scrollValue = scrollBar:GetValue();
				if scrollValue == maxVal or scrollValue == previousScrollValue then
					return;
				else
					previousScrollValue = scrollValue;
					HybridScrollFrame_OnMouseWheel(scrollFrame, -1);
				end
			end
		end
	end
end

function KrowiAF_SelectAchievement(achievement, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	if not achievement then
		addon.Diagnostics.Debug("No achievement provided");
		return;
	end

	local filters = addon.Filters;

	-- Get category
	local category;
	if filters and filters.db.MergeSmallCategories then
		category = achievement:GetMergedCategory(); -- This way we get the parent category
	else
		category = achievement.Category;
	end

	-- Set filters so achievement is visible
	if filters then
		local _filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
		achievement = filters.GetHighestAchievementWhenCollapseSeries(_filters, achievement);
		filters:SetFilters(_filters, achievement);
	end

	KrowiAF_SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY);
end

function KrowiAF_SelectAchievementFromID(id, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	local achievement = addon.Data.Achievements[id];
	KrowiAF_SelectAchievement(achievement, mouseButton, ignoreModifiers, anchor, offsetX, offsetY);
end

local function Select(category, collapsed, quick)
	local shown = false;
	local previousScrollValue;

	local categoriesFrame = addon.GUI.CategoriesFrame;
	local scrollFrame = categoriesFrame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;

	while not shown do
		for _, button in next, buttons do
			if button.Category == category and math.ceil(button:GetBottom()) >= math.ceil(addon.GUI.GetSafeScrollChildBottom(scrollFrame)) then
				button:Click(nil, nil, quick);
				shown = button;
				break;
			end
		end

		local _, maxVal = scrollBar:GetMinMaxValues();
		if shown then
			local newHeight = scrollBar:GetValue() + scrollFrame:GetBottom() - shown:GetBottom();
			newHeight = math.ceil(newHeight / scrollBar:GetValueStep()) * scrollBar:GetValueStep();
			newHeight = min(newHeight, maxVal);
			scrollBar:SetValue(newHeight);

			if collapsed then
				shown:Click(nil, nil, quick);
			end
		else
			local scrollValue = scrollBar:GetValue();
			if scrollValue == maxVal or scrollValue == previousScrollValue then
				return;
			else
				previousScrollValue = scrollValue;
				HybridScrollFrame_OnMouseWheel(scrollFrame, -1);
			end
		end
	end
end

local function GetMergedCategory(category)
	local filters = addon.Filters;
	if filters and filters.db.MergeSmallCategories then
		while category.Merged do
			category = category.Parent;
		end
	end
	return category;
end

function KrowiAF_SelectCategory(category, collapsed)
	category = GetMergedCategory(category);
	local categoriesTree = category:GetTree();

	-- Select tab
	addon.GUI.ToggleAchievementFrame(addonName, categoriesTree[1].TabName, nil, true);

	-- Here we need to get the tree again since when the destination tab is not loaded before, merged categories are not yet processed
	category = GetMergedCategory(category);
	categoriesTree = category:GetTree();

	-- Select category
	for i, cat in next, categoriesTree do
		if cat.TabName == nil then
			if not cat.IsSelected or (cat.NotCollapsed == collapsed) then -- Issue #23: Fix -- Issue #25 Broken, Fix
				Select(cat, collapsed, i ~= #categoriesTree); -- Issue #23: Broken
			end
		end
	end
end

function KrowiAF_ToggleAchievementFrame(_addonName, tabName)
    addon.GUI.ToggleAchievementFrame(_addonName, tabName);
end

function KrowiAF_RegisterTabButton(_addonName, tabName, button, selectFunc)
	addon.GUI.Tabs[_addonName] = addon.GUI.Tabs[_addonName] or {};
    addon.GUI.Tabs[_addonName][tabName] = button;
	if selectFunc then
		button.Select = selectFunc;
	end
end

function KrowiAF_RegisterTabOptions(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName)
	addonDisplayName = addonDisplayName or _addonName;
	tabDisplayName = tabDisplayName or tabName;

	SavedData = SavedData or {}; -- Does not exist yet for new users
    SavedData.TabKeys = SavedData.TabKeys or {};
	SavedData.Tabs = SavedData.Tabs or {};

	local indexFound;
	for i, tab in next, SavedData.Tabs do
		if tab.AddonName == _addonName and tab.Name == tabName then
			indexFound = i;
		end
	end
	if indexFound == nil then
		tinsert(SavedData.Tabs, addon.Objects.Tab:New(_addonName, tabName, bindingName));
		tinsert(SavedData.TabKeys, addonDisplayName .. " - " .. tabDisplayName);
		indexFound = #SavedData.TabKeys;
	end

	local options;
    if addon.Options.Defaults then -- Pre options loaded
		options = addon.Options.Defaults.profile.Tabs;
    else -- Post options loaderdata
		options = addon.Options.db.Tabs;
    end
	options[_addonName] = options[_addonName] or {};
	options[_addonName][tabName] = options[_addonName][tabName] or {};
	options[_addonName][tabName].Order = indexFound;

	addon.Options.InjectOptionsTableAdd({
        order = indexFound, type = "select", width = 2,
        name = "",
        values = function() return addon.GUI.TabsOrderGetActiveKeys(); end,
        get = function()
            addon.GUI.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
            for tabAddonName, tabs in next, addon.Options.db.Tabs do
				for _tabName, tab in next, tabs do
					if tab.Order == indexFound then
						for i, _tab in next, SavedData.Tabs do
							if _tab.AddonName == tabAddonName and _tab.Name == _tabName then
								return i;
							end
						end
					end
				end
			end
        end,
        set = function (_, value)
            addon.GUI.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
			
			-- We get the addon name and tab name for the selected tab
			local tab = SavedData.Tabs[value];
			-- print(value, tab.AddonName, tab.Name, addon.Options.db.Tabs[tab.AddonName][tab.Name].Order);

			-- Get the current order
			local order = addon.Options.db.Tabs[tab.AddonName][tab.Name].Order;

			-- This order is new order for old selection
			local aName, tName;
			for tabAddonName, tabs in next, addon.Options.db.Tabs do
				for _tabName, tab in next, tabs do
					if tab.Order == indexFound then
						aName = tabAddonName;
						tName = _tabName;
					end
				end
			end

			-- local oldTab = SavedData.Tabs[indexFound];
			-- print(indexFound, aName, tName, addon.Options.db.Tabs[aName][tName].Order);
			addon.Options.db.Tabs[aName][tName].Order = order;
			-- print(aName, tName, addon.Options.db.Tabs[aName][tName].Order);

			-- Set current selection to index
			-- local tab = SavedData.Tabs[value];
            addon.Options.db.Tabs[tab.AddonName][tab.Name].Order = indexFound;
			-- print(tab.AddonName, tab.Name, addon.Options.db.Tabs[tab.AddonName][tab.Name].Order);
			-- print(aName, tName, addon.Options.db.Tabs[aName][tName].Order);
            addon.GUI.ShowHideTabs();
        end
    }, tostring(indexFound), "args", "Layout", "args", "Tabs", "args", "Order");
end