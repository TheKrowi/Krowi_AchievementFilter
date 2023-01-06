-- [[ Namespaces ]] --
local addonName, addon = ...;

function KrowiAF_SelectAchievementWithCategory(achievement, category)
	local scrollFrame = addon.GUI.AchievementsFrame.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;

	KrowiAF_SelectCategory(category);

	-- Select achievement
	local shown = false;
	local previousScrollValue;
	local buttons;

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

	local tabFilters = addon.Tabs[category:GetTree()[1].TabName].Filters;
	achievement = filters.GetHighestAchievementWhenCollapseSeries(tabFilters, achievement);
	if filters.Validate(tabFilters, achievement) < 0 then
		achievement.AlwaysVisible = true;
	end
	addon.GUI.AchievementsFrame:ForceUpdate(true);

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
			if not cat.IsSelected or (cat.NotCollapsed == collapsed) or cat.HasFlexibleData then -- Issue #23: Fix -- Issue #25 Broken, Fix
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

	for i = 1, #addon.Data.CurrentZoneCategories do
		if addon.Options.db.AdjustableCategories.CurrentZone[i] then
			KrowiAF_SelectCategory(addon.Data.CurrentZoneCategories[i], collapsed);
			return;
		end
	end
end

function KrowiAF_RegisterTabButton(_addonName, tabName, button, selectFunc)
	addon.GUI.Tabs[_addonName] = addon.GUI.Tabs[_addonName] or {};
    addon.GUI.Tabs[_addonName][tabName] = button;
	if selectFunc then
		button.Select = selectFunc;
	end
end


do --[[ KrowiAF_InjectOptions ]]
	KrowiAF_InjectOptions = {};
	function KrowiAF_InjectOptions.AddTable(destTablePath, key, table)
		local destTable;
		if type(destTablePath) == "table" then
			destTable = destTablePath;
		elseif type(destTablePath) == "string" then
			destTable = addon.Options.OptionsTable.args;
			local pathParts = strsplittable(".", destTablePath);
			for _, part in next, pathParts do
				destTable = destTable[part];
			end
		end
		destTable[key] = table;
		return destTable[key];
	end

	function KrowiAF_InjectOptions.TableExists(destTablePath)
		local destTable = addon.Options.OptionsTable.args;
		local pathParts = strsplittable(".", destTablePath);
		for _, part in next, pathParts do
			destTable = destTable[part];
		end
		return destTable and true or false;
	end

	function KrowiAF_InjectOptions.AddDefaults(destTablePath, key, table)
		local destTable = addon.Options.Defaults.profile;
		local pathParts = strsplittable(".", destTablePath);
		for _, part in next, pathParts do
			destTable = destTable[part];
		end
		destTable[key] = table;
	end

	function KrowiAF_InjectOptions.DefaultsExists(destTablePath)
		local destTable = addon.Options.Defaults.profile;
		local pathParts = strsplittable(".", destTablePath);
		for _, part in next, pathParts do
			destTable = destTable[part];
		end
		return destTable and true or false;
	end

	local autoOrder = 1;
	-- function KrowiAF_InjectOptions.SetAutoOrder()
	-- 	autoOrder = 1;
	-- end

	function KrowiAF_InjectOptions.AutoOrderPlusPlus()
		local current = autoOrder;
		autoOrder = autoOrder + 1;
		return current;
	end

	function KrowiAF_InjectOptions.AdjustedWidth(number)
		return (number or 1) * addon.Options.WidthMultiplier;
	end

	-- local lastAddedGroup;
	-- function KrowiAF_InjectOptions.AddGroup(destTablePath, key, name, order, inline, childGroups)
	-- 	if type(destTablePath) == "table" and key == nil then
	-- 		local tbl = destTablePath;
	-- 		key = tbl[2] or tbl.key;
	-- 		name = tbl[3] or tbl.name;
	-- 		order = tbl[4] or tbl.order;
	-- 		inline = tbl[6] or tbl.inline;
	-- 		childGroups = tbl[7] or tbl.childGroups;
	-- 		destTablePath = tbl[1] or tbl.destTablePath;
	-- 	end
	-- 	local group = KrowiAF_InjectOptions.AddTable(destTablePath or lastAddedGroup, key, {
	-- 		order = order or AutoOrderPlusPlus(), type = "group",
	-- 		name = name or key,
	-- 		childGroups = childGroups,
	-- 		inline = inline,
	-- 		args = {}
	-- 	});
	-- 	lastAddedGroup = group.args;
	-- 	return lastAddedGroup;
	-- end

	-- function KrowiAF_InjectOptions.AddDescription(destTablePath, key, name, order, width, fontSize)
	-- 	if type(destTablePath) == "table" and key == nil then
	-- 		local tbl = destTablePath;
	-- 		key = tbl[2] or tbl.key;
	-- 		name = tbl[3] or tbl.name;
	-- 		order = tbl[4] or tbl.order;
	-- 		width = tbl[6] or tbl.width;
	-- 		fontSize = tbl[7] or tbl.fontSize;
	-- 		destTablePath = tbl[1] or tbl.destTablePath;
	-- 	elseif type(destTablePath) == "string" and key == nil then
	-- 		key = destTablePath;
	-- 		destTablePath = nil;
	-- 	end
	-- 	return KrowiAF_InjectOptions.AddTable(destTablePath or lastAddedGroup, key, {
	-- 		order = order or AutoOrderPlusPlus(), type = "description", width = (width or 1) * addon.Options.WidthMultiplier,
	-- 		name = name or key,
	-- 		fontSize = fontSize or "medium"
	-- 	});
	-- end

	-- function KrowiAF_InjectOptions.AddExecute(destTablePath, key, name, order, desc, width, func)
	-- 	if type(destTablePath) == "table" and key == nil then
	-- 		local tbl = destTablePath;
	-- 		key = tbl[2] or tbl.key;
	-- 		name = tbl[3] or tbl.name;
	-- 		order = tbl[4] or tbl.order;
	-- 		desc = tbl[5] or tbl.desc;
	-- 		width = tbl[6] or tbl.width;
	-- 		func = tbl[7] or tbl.func;
	-- 		destTablePath = tbl[1] or tbl.destTablePath;
	-- 	elseif type(destTablePath) == "string" and key == nil then
	-- 		key = destTablePath;
	-- 		destTablePath = nil;
	-- 	end
	-- 	return KrowiAF_InjectOptions.AddTable(destTablePath or lastAddedGroup, key, {
	-- 		order = order or AutoOrderPlusPlus(), type = "execute", width = (width or 1) * addon.Options.WidthMultiplier,
	-- 		name = name or key,
	-- 		desc = desc,
	-- 		func = func
	-- 	});
	-- end

	-- function KrowiAF_InjectOptions.AddToggle(destTablePath, key, name, order, desc, width, get, set)
	-- 	if type(destTablePath) == "table" and key == nil then
	-- 		local tbl = destTablePath;
	-- 		key = tbl[2] or tbl.key;
	-- 		name = tbl[3] or tbl.name;
	-- 		order = tbl[4] or tbl.order;
	-- 		desc = tbl[5] or tbl.desc;
	-- 		width = tbl[6] or tbl.width;
	-- 		get = tbl[7] or tbl.get;
	-- 		set = tbl[7] or tbl.set;
	-- 		destTablePath = tbl[1] or tbl.destTablePath;
	-- 	elseif type(destTablePath) == "string" and key == nil then
	-- 		key = destTablePath;
	-- 		destTablePath = nil;
	-- 	end
	-- 	return KrowiAF_InjectOptions.AddTable(destTablePath or lastAddedGroup, key, {
	-- 		order = order or AutoOrderPlusPlus(), type = "toggle", width = (width or 1) * addon.Options.WidthMultiplier,
	-- 		name = name or key,
	-- 		desc = desc,
	-- 		get = get,
	-- 		set = set
	-- 	});
	-- end
end

do --[[ KrowiAF_RegisterTabOptions ]]
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

	local function InjectOptionsDefaults(_addonName, tabName, showByDefault)
		if showByDefault == nil then
			showByDefault = false;
		end
		if not KrowiAF_InjectOptions.DefaultsExists("Tabs." .. _addonName) then
			KrowiAF_InjectOptions.AddDefaults("Tabs", _addonName, { });
		end
		KrowiAF_InjectOptions.AddDefaults("Tabs." .. _addonName, tabName, {
			Show = showByDefault
		});
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

		-- print(aName, tName, tab.AddonName, tab.Name);
		-- if aName == "Blizzard_AchievementUI"
		-- and tab.AddonName == "Blizzard_AchievementUI"
		-- and tName == "Guild"
		-- and tab.Name == "Statistics" then
		-- 	StaticPopupDialogs["KROWIAF_ERROR_TABSORDER"] = {
		-- 		text = addon.MetaData.Title .. "\n\n" .. addon.L["Error Tabs Order"]:ReplaceVars
		-- 		{
		-- 			blizzard = addon.L["Blizzard"],
		-- 			statistics = addon.L["Statistics"],
		-- 			guild = addon.L["Guild"]
		-- 		},
		-- 		button1 = addon.L["Close"],
		-- 		timeout = 0,
		-- 		whileDead = true,
		-- 		hideOnEscape = true
		-- 	};
		-- 	StaticPopup_Show("KROWIAF_ERROR_TABSORDER");
		-- 	return;
		-- end

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

	local function SetKeybind(value, command, index)
		local key = select(index, GetBindingKey(command));
		if key then
			SetBinding(key);
		end
		SetBinding(value, command, index);
		SaveBindings(GetCurrentBindingSet());
	end

	local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
	local AdjustedWidth = KrowiAF_InjectOptions.AdjustedWidth;
	local function InjectKeyBindingOptionsTable(_addonName, addonDisplayName, tabDisplayName, bindingName)
		if not bindingName then
			return;
		end

		if not KrowiAF_InjectOptions.TableExists("General.args.KeyBinding.args.Tabs.args." .. _addonName .. "Header") then
			KrowiAF_InjectOptions.AddTable("General.args.KeyBinding.args.Tabs.args", _addonName .. "Header", {
				order = OrderPP(), type = "header",
				name = addonDisplayName
			});
		end
		KrowiAF_InjectOptions.AddTable("General.args.KeyBinding.args.Tabs.args", "Binding" .. OrderPP() .. "Name", {
			order = OrderPP(), type = "description", width = AdjustedWidth(0.95),
			name = addon.L["Toggle"] .. " " .. tabDisplayName .. " "  .. addon.L["tab"]
		});
		KrowiAF_InjectOptions.AddTable("General.args.KeyBinding.args.Tabs.args", "Binding" .. OrderPP() .. "Key1", {
			order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.95),
			name = "",
			desc = "",
			get = function() return GetBindingKey(bindingName); end,
			set = function(_, value)
				SetKeybind(value, bindingName, 1);
			end
		});
		KrowiAF_InjectOptions.AddTable("General.args.KeyBinding.args.Tabs.args", "Binding" .. OrderPP() .. "Key2", {
			order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.95),
			name = "",
			desc = "",
			get = function() return select(2, GetBindingKey(bindingName)); end,
			set = function(_, value)
				SetKeybind(value, bindingName, 2);
			end
		});
	end

	local function InjectTabsOrderOptionsTable(index)
		KrowiAF_InjectOptions.AddTable("Layout.args.Tabs.args.Order.args", tostring(OrderPP()), {
			order = OrderPP(), type = "select", width = AdjustedWidth(1.95),
			name = "",
			values = function() return addon.GUI.TabsOrderGetActiveKeys(); end,
			get = function() return GetOrder(index); end,
			set = function (_, value)
				SetOrder(index, value);
			end
		});
	end

	local function InjectTabsShowOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName)
		if not KrowiAF_InjectOptions.TableExists("Layout.args.Tabs.args." .. _addonName) then
			KrowiAF_InjectOptions.AddTable("Layout.args.Tabs.args", _addonName, {
				type = "group",
				name = addonDisplayName,
				inline = true,
				args = {}
			});
		end
		KrowiAF_InjectOptions.AddTable("Layout.args.Tabs.args." .. _addonName .. ".args", tabName, {
			order = OrderPP(), type = "toggle", width = AdjustedWidth(0.95),
			name = tabDisplayName,
			desc = (""):AddDefaultValueText("Tabs." .. _addonName .. "." .. tabName .. ".Show"),
			get = function() return addon.Options.db.Tabs[_addonName][tabName].Show; end,
			set = function() addon.GUI.ShowHideTabs(_addonName, tabName); end
		});
	end

	local function InjectOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName, index)
		InjectKeyBindingOptionsTable(_addonName, addonDisplayName, tabDisplayName, bindingName);
		InjectTabsOrderOptionsTable(index);
		InjectTabsShowOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName);
	end

	function KrowiAF_RegisterTabOptions(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName, showByDefault)
		addonDisplayName = addonDisplayName or _addonName;
		tabDisplayName = tabDisplayName or tabName;

		-- Make sure all tables exist
		SavedData = SavedData or {};
		SavedData.TabKeys = SavedData.TabKeys or {};
		SavedData.Tabs = SavedData.Tabs or {};

		local index = GetIndexOrInsert(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName);

		InjectOptionsDefaults(_addonName, tabName, showByDefault);
		SetOptionsOrder(_addonName, tabName, index);
		InjectOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName, index);
	end
end