-- [[ Namespaces ]] --
local addonName, addon = ...;

function KrowiAF_SelectAchievementWithCategory(achievement, category)
	local scrollFrame = addon.GUI.AchievementsFrame.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;

	KrowiAF_SelectCategory(category);

	-- next line might be redundant causing the bug
	-- scrollBar:SetValue(0); -- Makes sure the scrollbar is at the top since this can be in a diff location if the category is already selected

	-- local selectedTab = addon.GUI.SelectedTab; -- This changes when calling KrowiAF_SelectCategory

	-- Select achievement
	local shown = false;
	local previousScrollValue;
	local buttons;
	-- local selectedAchievement;

	local loops, maxLoops = 0, 1000;

	while not shown do
		loops = loops + 1;
		if loops >= maxLoops then
			error("Oops, something went wrong. This is a known error of Krowi's Achievement Filter and I'm doing my best to fix this as quick as possible. For now, uncheck the 'Merge small categories' to reduce the change for this error to occur. Please do not report this error. Sorry for any inconvenience. - Krowi", 2);
		end
		buttons = scrollFrame.buttons;
		for _, button in next, buttons do
			if button.Achievement == achievement and math.ceil(button:GetTop()) >= math.ceil(addon.GUI.GetSafeScrollChildBottom(scrollFrame)) then
				-- selectedAchievement = selectedTab.SelectedAchievement;
				-- if not (selectedAchievement == achievement) then
					button:Select(true);
				-- end
				shown = button;
				break;
			end
		end
		if scrollBar:IsShown() then
			local _, maxVal = scrollBar:GetMinMaxValues();
			if shown then
				-- Make sure we move the correct achievement to the top, this extra bid is needed since button:Select() already moves the achievement
				for _, button in next, buttons do
					if button.Achievement == achievement then
						shown = button;
						break;
					end
				end
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
	achievement.AlwaysVisible = nil; -- Can be reached though vscode thinks not
end

function KrowiAF_SelectAchievement(achievement)
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
	-- if filters then
	local tabFilters = addon.Tabs[category:GetTree()[1].TabName].Filters;
	achievement = filters.GetHighestAchievementWhenCollapseSeries(tabFilters, achievement);
	-- filters:SetFilters(tabFilters, achievement);
	if filters.Validate(tabFilters, achievement) < 0 then
		achievement.AlwaysVisible = true;
	end
	addon.GUI.AchievementsFrame:ForceUpdate(true);
	-- end

	KrowiAF_SelectAchievementWithCategory(achievement, category);
end

function KrowiAF_SelectAchievementFromID(id)
	local achievement = addon.Data.Achievements[id];
	KrowiAF_SelectAchievement(achievement);
end

local function SelectCategory(category, collapsed, quick)
	local shown = false;
	local previousScrollValue;

	local categoriesFrame = addon.GUI.CategoriesFrame;
	local scrollFrame = categoriesFrame.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;

	while not shown do
		for _, button in next, buttons do
			if button.Category == category and math.ceil(button:GetBottom()) >= math.ceil(addon.GUI.GetSafeScrollChildBottom(scrollFrame)) then
				button:Select(quick);
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
				shown:Select(quick);
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

function KrowiAF_SelectCategory(category, collapsed)
	-- Select tab
	local categoriesTree = category:GetTree();
	addon.GUI.ToggleAchievementFrame(addonName, categoriesTree[1].TabName, nil, true); -- This will call both category and achievement update

	-- Get the merged category now we're sure it's loaded
	category = category:GetMergedCategory();
	categoriesTree = category:GetTree();

	-- Force showing the catgory if it would not be visible normally due to filters
    if category.NumOfAch == nil then
        category:GetAchievementNumbers();
    end
    local alwaysVisibleCache;
    if category.NumOfAch == 0 then
        alwaysVisibleCache = {};
        for i = 1, #categoriesTree do
            alwaysVisibleCache[i] = categoriesTree[i].AlwaysVisible;
            categoriesTree[i].AlwaysVisible = true; -- We set this here to show an empty category
        end
        addon.GUI.CategoriesFrame:Update(true); -- Force an update to handle the new AlwaysVisible states
    end

	-- Select category
	for i, cat in next, categoriesTree do
		if cat.TabName == nil then
			if not cat.IsSelected or (cat.NotCollapsed == collapsed) then -- Issue #23: Fix -- Issue #25 Broken, Fix
				SelectCategory(cat, collapsed, i ~= #categoriesTree); -- Issue #23: Broken
			end
		end
	end

	-- Reset the forced show so when clicking away, the category will be hidden again
	if category.NumOfAch == 0 then
        for i = 1, #categoriesTree do
            categoriesTree[i].AlwaysVisible = alwaysVisibleCache[i]; -- Reset to the initial state
        end
    end

	return category;
end

function KrowiAF_ToggleAchievementFrame(_addonName, tabName)
    addon.GUI.ToggleAchievementFrame(_addonName, tabName);
end

function KrowiAF_OpenCurrentZone(collapsed)
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

	KrowiAF_SelectCategory(addon.Data.CurrentZoneCategory, collapsed);
end

function KrowiAF_RegisterTabButton(_addonName, tabName, button, selectFunc)
	addon.GUI.Tabs[_addonName] = addon.GUI.Tabs[_addonName] or {};
    addon.GUI.Tabs[_addonName][tabName] = button;
	if selectFunc then
		button.Select = selectFunc;
	end
end

local function GetIndexOrInsert(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName)
	local index;
	for i, tab in next, SavedData.Tabs do
		if tab.AddonName == _addonName and tab.Name == tabName then
			index = i;
		end
	end
	if index == nil then
		tinsert(SavedData.Tabs, addon.Objects.Tab:New(_addonName, tabName, bindingName));
		tinsert(SavedData.TabKeys, addonDisplayName .. " - " .. tabDisplayName);
		index = #SavedData.TabKeys;
	end
	return index;
end

local function SetOptionsOrder(_addonName, tabName, index)
	local options;
    if addon.Options.Defaults then -- Pre options loaded
		options = addon.Options.Defaults.profile.Tabs;
    else -- Post options loaderdata
		options = addon.Options.db.Tabs;
    end
	options[_addonName] = options[_addonName] or {};
	options[_addonName][tabName] = options[_addonName][tabName] or {};
	options[_addonName][tabName].Order = index;
end

local function GetOrder(index)
	addon.GUI.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
	for addonName2, tabs in next, addon.Options.db.Tabs do
		for tabName, tab in next, tabs do
			if tab.Order == index then
				for i, tab2 in next, SavedData.Tabs do
					if tab2.AddonName == addonName2 and tab2.Name == tabName then
						return i;
					end
				end
			end
		end
	end
end

local function SetOrder(index, value)
	addon.GUI.TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up

	-- We get the addon name and tab name for the selected tab
	local tab = SavedData.Tabs[value];
	-- print(value, tab.AddonName, tab.Name, addon.Options.db.Tabs[tab.AddonName][tab.Name].Order);

	-- Get the current order
	local order = addon.Options.db.Tabs[tab.AddonName][tab.Name].Order;

	-- This order is new order for old selection
	local aName, tName;
	for addonName2, tabs in next, addon.Options.db.Tabs do
		for tabName, tab2 in next, tabs do
			if tab2.Order == index then
				aName = addonName2;
				tName = tabName;
			end
		end
	end

	print(aName, tName, tab.AddonName, tab.Name);
	if aName == "Blizzard_AchievementUI"
	and tab.AddonName == "Blizzard_AchievementUI"
	and tName == "Guild"
	and tab.Name == "Statistics" then
		StaticPopupDialogs["KROWIAF_ERROR_TABSORDER"] = {
			text = addon.MetaData.Title .. "\n\n" .. addon.L["Error Tabs Order"]:ReplaceVars
			{
				blizzard = addon.L["Blizzard"],
				statistics = addon.L["Statistics"],
				guild = addon.L["Guild"]
			},
			button1 = addon.L["Close"],
			timeout = 0,
			whileDead = true,
			hideOnEscape = true
		};
		StaticPopup_Show("KROWIAF_ERROR_TABSORDER");
		return;
	end

	-- local oldTab = SavedData.Tabs[indexFound];
	-- print(indexFound, aName, tName, addon.Options.db.Tabs[aName][tName].Order);
	addon.Options.db.Tabs[aName][tName].Order = order;
	-- print(aName, tName, addon.Options.db.Tabs[aName][tName].Order);

	-- Set current selection to index
	-- local tab = SavedData.Tabs[value];
	addon.Options.db.Tabs[tab.AddonName][tab.Name].Order = index;
	-- print(tab.AddonName, tab.Name, addon.Options.db.Tabs[tab.AddonName][tab.Name].Order);
	-- print(aName, tName, addon.Options.db.Tabs[aName][tName].Order);
	addon.GUI.ShowHideTabs();
end

function KrowiAF_RegisterTabOptions(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName)
	addonDisplayName = addonDisplayName or _addonName;
	tabDisplayName = tabDisplayName or tabName;

	-- Make sure all tables exist
	SavedData = SavedData or {};
    SavedData.TabKeys = SavedData.TabKeys or {};
	SavedData.Tabs = SavedData.Tabs or {};

	local index = GetIndexOrInsert(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName);

	SetOptionsOrder(_addonName, tabName, index)

	if _addonName ~= "Blizzard_AchievementUI" and _addonName ~= addonName then
		if LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Layout"], "cmd", "KROWIAF-0.0").args.Tabs.args.Order.args.Locked then
			return; -- Do not add more when we are in the fix state
		end
	end
	addon.Options.InjectOptionsTableAdd({
        order = index, type = "select", width = 2,
        name = "",
        values = function() return addon.GUI.TabsOrderGetActiveKeys(); end,
        get = function()
            return GetOrder(index);
        end,
        set = function (_, value)
            SetOrder(index, value);
        end
    }, tostring(index), "args", "Layout", "args", "Tabs", "args", "Order");
end

