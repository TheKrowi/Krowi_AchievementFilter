-- [[ Namespaces ]] --
local addonName, addon = ...;

local function SelectAchievement(achievement)
	local scrollBox = KrowiAF_AchievementsFrame.ScrollBox;
	local dataProvider = scrollBox:GetDataProvider();
	if not dataProvider then
		return;
	end

	KrowiAF_AchievementsFrame:ForceUpdate();
	scrollBox:ScrollToElementData(achievement, ScrollBoxConstants.AlignCenter, ScrollBoxConstants.NoScrollInterpolation);
	-- print("api select")
	KrowiAF_AchievementsFrame.SelectionBehavior:SelectElementData(achievement);
	KrowiAF_AchievementsFrame:ScrollToNearest(achievement);
end

function KrowiAF_SelectAchievementWithCategory(achievement, category)
	KrowiAF_SelectCategory(category);

	SelectAchievement(achievement);

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
	if filters and filters.db.profile.MergeSmallCategories then
		category = achievement:GetMergedCategory(); -- This way we get the parent category
	else
		category = achievement.Category;
	end

	local tabFilters = addon.Tabs[category:GetTree()[1].TabName].Filters;
	achievement = filters.GetHighestAchievementWhenCollapseSeries(tabFilters, achievement);
	if filters.Validate(tabFilters, achievement) < 0 then
		achievement.AlwaysVisible = true;
	end

	KrowiAF_SelectAchievementWithCategory(achievement, category);
end

function KrowiAF_SelectAchievementFromID(id)
	if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

	local achievement = addon.Data.Achievements[id];
	KrowiAF_SelectAchievement(achievement);
end

local function SelectCategory(category, collapsed, quick)
	KrowiAF_CategoriesFrame:ExpandToCategory(category);
	KrowiAF_CategoriesFrame:Update();

	local scrollBox = KrowiAF_CategoriesFrame.ScrollBox;
	local dataProvider = scrollBox:GetDataProvider();
	if not dataProvider then
		return;
	end

	scrollBox:ScrollToElementData(category, ScrollBoxConstants.AlignCenter, ScrollBoxConstants.NoScrollInterpolation);

	KrowiAF_CategoriesFrame:ShowSubFrame(category);
end

function KrowiAF_SelectCategory(category, collapsed)
	-- Select tab
	local categoriesTree = category:GetTree();
	addon.Gui:ToggleAchievementFrame(addonName, categoriesTree[1].TabName, nil, true); -- This will call both category and achievement update

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
        KrowiAF_CategoriesFrame:Update(true); -- Force an update to handle the new AlwaysVisible states
    end

	-- Select category
	SelectCategory(category, collapsed, collapsed); -- Issue #23: Broken

	-- Reset the forced show so when clicking away, the category will be hidden again
	if category.NumOfAch == 0 then
        for i = 1, #categoriesTree do
            categoriesTree[i].AlwaysVisible = alwaysVisibleCache[i]; -- Reset to the initial state
        end
    end

	return category;
end

function KrowiAF_ToggleAchievementFrame(_addonName, tabName)
    addon.Gui:ToggleAchievementFrame(_addonName, tabName);
end

function KrowiAF_OpenCurrentZone(collapsed)
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

	for i = 1, #addon.Data.CurrentZoneCategories do
		if addon.Options.db.profile.AdjustableCategories.CurrentZone[i] then
			KrowiAF_SelectCategory(addon.Data.CurrentZoneCategories[i], collapsed);
			return;
		end
	end
end

function KrowiAF_RegisterTabButton(_addonName, tabName, button, selectFunc)
	addon.Gui.Tabs[_addonName] = addon.Gui.Tabs[_addonName] or {};
    addon.Gui.Tabs[_addonName][tabName] = button;
	if selectFunc then
		button.Select = selectFunc;
	end
end

do --[[ KrowiAF_GetOptions ]]
	KrowiAF_GetOptions = {};
	function KrowiAF_GetOptions.GetTable(appName, tablePath)
		-- print(appName, tablePath)
		local tbl = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(appName, "cmd", "KROWIAF-0.0");
		local pathParts = strsplittable(".", tablePath);
		for _, part in next, pathParts do
			tbl = tbl[part];
		end
		return tbl;
	end
end

do --[[ KrowiAF_RegisterTabOptions ]]
	local function GetIndexOrInsert(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName)
		local index;
		for i, tab in next, KrowiAF_SavedData.Tabs do
			if tab.AddonName == _addonName and tab.Name == tabName then
				index = i;
			end
		end
		if index == nil then
			tinsert(KrowiAF_SavedData.Tabs, addon.Objects.Tab:New(_addonName, tabName, bindingName));
			tinsert(KrowiAF_SavedData.TabKeys, addonDisplayName .. " - " .. tabDisplayName);
			index = #KrowiAF_SavedData.TabKeys;
		end
		return index;
	end

	local function InjectOptionsDefaults(_addonName, tabName, showByDefault)
		if showByDefault == nil then
			showByDefault = false;
		end
		if not addon.InjectOptions:DefaultsExists("Tabs." .. _addonName) then
			addon.InjectOptions:AddDefaults("Tabs", _addonName, { });
		end
		addon.InjectOptions:AddDefaults("Tabs." .. _addonName, tabName, {
			Show = showByDefault
		});
	end

	local function SetOptionsOrder(_addonName, tabName, index)
		local options;
		if addon.Options.Defaults then -- Pre options loaded
			options = addon.Options.Defaults.profile.Tabs;
		else -- Post options loaderdata
			options = addon.Options.db.profile.Tabs;
		end
		options[_addonName] = options[_addonName] or {};
		options[_addonName][tabName] = options[_addonName][tabName] or {};
		options[_addonName][tabName].Order = index;
	end

	local function GetOrder(index)
		addon.Gui:TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up
		for addonName2, tabs in next, addon.Options.db.profile.Tabs do
			for tabName, tab in next, tabs do
				if tab.Order == index then
					for i, tab2 in next, KrowiAF_SavedData.Tabs do
						if tab2.AddonName == addonName2 and tab2.Name == tabName then
							return i;
						end
					end
				end
			end
		end
	end

	local function SetOrder(index, value)
		addon.Gui:TabsOrderGetActiveKeys(); -- Just to make sure the list is cleaned up

		-- We get the addon name and tab name for the selected tab
		local tab = KrowiAF_SavedData.Tabs[value];
		-- print(value, tab.AddonName, tab.Name, addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order);

		-- Get the current order
		local order = addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order;

		-- This order is new order for old selection
		local aName, tName;
		for addonName2, tabs in next, addon.Options.db.profile.Tabs do
			for tabName, tab2 in next, tabs do
				if tab2.Order == index then
					aName = addonName2;
					tName = tabName;
				end
			end
		end

		addon.Options.db.profile.Tabs[aName][tName].Order = order;
		addon.Options.db.profile.Tabs[tab.AddonName][tab.Name].Order = index;

		addon.Gui:ShowHideTabs();
	end

	local function SetKeybind(value, command, index)
		local key = select(index, GetBindingKey(command));
		if key then
			SetBinding(key);
		end
		SetBinding(value, command, index);
		SaveBindings(GetCurrentBindingSet());
	end

	local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
	local AdjustedWidth = addon.InjectOptions.AdjustedWidth;
	local function InjectKeyBindingOptionsTable(_addonName, addonDisplayName, tabDisplayName, bindingName)
		if not bindingName then
			return;
		end

		if not addon.InjectOptions:TableExists("General.args.KeyBinding.args.Keybindings.args.Tabs.args." .. _addonName .. "Header") then
			addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", _addonName .. "Header", {
				order = OrderPP(), type = "header",
				name = addonDisplayName
			});
		end
		addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Name", {
			order = OrderPP(), type = "description", width = AdjustedWidth(0.93),
			name = addon.L["Toggle"] .. " " .. tabDisplayName .. " "  .. addon.L["tab"]
		});
		addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Key1", {
			order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
			name = "", desc = "",
			get = function() return GetBindingKey(bindingName); end,
			set = function(_, value)
				SetKeybind(value, bindingName, 1);
			end
		});
		addon.InjectOptions:AddTable("General.args.KeyBinding.args.Keybindings.args.Tabs.args", "Binding" .. OrderPP() .. "Key2", {
			order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
			name = "", desc = "",
			get = function() return select(2, GetBindingKey(bindingName)); end,
			set = function(_, value)
				SetKeybind(value, bindingName, 2);
			end
		});
	end

	local function InjectTabsOrderOptionsTable(index)
		addon.InjectOptions:AddTable("Layout.args.Tabs.args.Order.args.Order.args", tostring(OrderPP()), {
			order = OrderPP(), type = "select", width = AdjustedWidth(1.95),
			name = "",
			values = function() return addon.Gui:TabsOrderGetActiveKeys(); end,
			get = function() return GetOrder(index); end,
			set = function (_, value)
				SetOrder(index, value);
			end
		});
	end

	local function InjectTabsShowOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName)
		if not addon.InjectOptions:TableExists("Layout.args.Tabs.args.Show.args.Show.args." .. _addonName) then
			addon.InjectOptions:AddTable("Layout.args.Tabs.args.Show.args.Show.args", _addonName, {
				order = OrderPP(), type = "header",
				name = addonDisplayName
			});
		end
		addon.InjectOptions:AddTable("Layout.args.Tabs.args.Show.args.Show.args", _addonName .. tabName, {
			order = OrderPP(), type = "toggle", width = AdjustedWidth(0.95),
			name = tabDisplayName,
			desc = (""):KAF_AddDefaultValueText("Tabs." .. _addonName .. "." .. tabName .. ".Show"),
			get = function() return addon.Options.db.profile.Tabs[_addonName][tabName].Show; end,
			set = function() addon.Gui:ShowHideTabs(_addonName, tabName); end
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
		KrowiAF_SavedData = KrowiAF_SavedData or {};
		KrowiAF_SavedData.TabKeys = KrowiAF_SavedData.TabKeys or {};
		KrowiAF_SavedData.Tabs = KrowiAF_SavedData.Tabs or {};

		local index = GetIndexOrInsert(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName);

		InjectOptionsDefaults(_addonName, tabName, showByDefault);
		SetOptionsOrder(_addonName, tabName, index);
		InjectOptionsTable(_addonName, tabName, addonDisplayName, tabDisplayName, bindingName, index);

		if bindingName then
			_G["BINDING_NAME_" .. bindingName] = addon.L["Toggle"] .. " " .. tabDisplayName .. " "  .. addon.L["tab"];
		end
	end
end

do --[[ KrowiAF_RegisterEventOptions ]]
	local function InjectOptionsDefaults(eventType, eventIds, hideByDefault)
		if hideByDefault == nil then
			hideByDefault = false;
		end
		if not addon.InjectOptions:DefaultsExists("EventReminders." .. eventType .. "Events") then
			addon.InjectOptions:AddDefaults("EventReminders", eventType .. "Events", { });
		end
		for _, eventId in next, eventIds do
			addon.InjectOptions:AddDefaults("EventReminders." .. eventType .. "Events", eventId, not hideByDefault);
		end
	end

	local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
	local AdjustedWidth = addon.InjectOptions.AdjustedWidth;
	local function InjectOptionsTable(eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionDisplayName)
		local path = "EventReminders.args." .. (eventType == "Widget" and "World" or eventType) .. "Events.args";
		local expansionName = expansionDisplayName and expansionDisplayName:gsub("[%p%c%s]", "_");
		if expansionName then
			if not addon.InjectOptions:TableExists(path .. "." .. expansionName) then
				addon.InjectOptions:AddTable(path, expansionName, {
					order = order, type = "group",
					name = expansionDisplayName,
					args = {}
				});
			end
			path = path .. "." .. expansionName .. ".args";
		end
		local groupName = groupDisplayName:gsub("[%p%c%s]", "_");
		if not addon.InjectOptions:TableExists(path .. "." .. groupName) then
			addon.InjectOptions:AddTable(path, groupName, {
				order = order, type = "group",
				name = groupDisplayName,
				args = {}
			});
		end
		path = path .. "." .. groupName .. ".args";
		addon.InjectOptions:AddTable(path, tostring(eventIds[1]), {
			order = OrderPP(), type = "toggle", width = AdjustedWidth(),
			name = eventDisplayName,
			get = function() return addon.Options.db.profile.EventReminders[eventType .. "Events"][eventIds[1]]; end,
			set = function(_, value)
				for _, eventId in next, eventIds do
					addon.Options.db.profile.EventReminders[eventType .. "Events"][eventId] = value;
				end
				addon.Gui.EventReminderSideButtonSystem:Refresh();
			end
		});
	end

	function KrowiAF_RegisterEventOptions(eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionDisplayName, hideByDefault)
		InjectOptionsDefaults(eventType, eventIds, hideByDefault);
		InjectOptionsTable(eventType, eventIds, eventDisplayName, groupDisplayName, order, expansionDisplayName);
	end

	function KrowiAF_RegisterDeSelectAllEventOptions(eventType, eventIds, groupDisplayName, expansionName)
		local groupName = groupDisplayName:gsub("[%p%c%s]", "_");
		local path = "EventReminders.args." .. (eventType == "Widget" and "World" or eventType) .. "Events.args." .. (expansionName and (expansionName .. ".args.") or "") .. groupName .. ".args";
		if addon.InjectOptions:TableExists(path .. ".SelectAll") then
			return;
		end

		addon.InjectOptions:AddTable(path, "Blank1", {
			order = OrderPP(), type = "description", width = "full", name = ""
		});
		if not expansionName then
			addon.InjectOptions:AddTable(path, "Blank2", {
				order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""
			});
		end
		addon.InjectOptions:AddTable(path, "SelectAll", {
			order = OrderPP(), type = "execute", width = AdjustedWidth(),
			name = addon.L["Select All"],
			func = function()
				for _, eventId in next, eventIds do
					addon.Options.db.profile.EventReminders[eventType .. "Events"][eventId] = true;
				end
			end
		});
		addon.InjectOptions:AddTable(path, "DeselectAll", {
			order = OrderPP(), type = "execute", width = AdjustedWidth(),
			name = addon.L["Deselect All"],
			func = function()
				for _, eventId in next, eventIds do
					addon.Options.db.profile.EventReminders[eventType .. "Events"][eventId] = false;
				end
			end
		});
	end
end