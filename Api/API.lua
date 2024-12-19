local addonName, addon = ...;
KrowiAF = {};

local function SelectAchievement(achievement)
	local scrollBox = KrowiAF_AchievementsFrame.ScrollBox;
	local dataProvider = scrollBox:GetDataProvider();
	if not dataProvider then
		return;
	end

	KrowiAF_AchievementsFrame:ForceUpdate();
	scrollBox:ScrollToElementData(achievement, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation);
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

	if addon.Options.db.profile.Achievements.EnableTabPriority and achievement.MoreCategories then
		for _, moreCategory in next, achievement.MoreCategories do
			if moreCategory:GetTree()[1].TabName == KrowiAF_SavedData.Tabs[addon.Options.db.profile.Achievements.TabPriority].Name then
				category = moreCategory;
			end
		end
	end

	if not category and achievement.IsTracking then
		return;
	end

	local tabFilters = addon.Tabs[category:GetTree()[1].TabName].Filters;
	achievement = filters.GetHighestAchievementWhenCollapseSeries(tabFilters, achievement);
	if filters.Validate(tabFilters, achievement, category.IgnoreFilters) < 0 then
		achievement.AlwaysVisible = true;
	end

	KrowiAF_SelectAchievementWithCategory(achievement, category);
end

function KrowiAF_SelectAchievementFromID(id)
	if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI");
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

	scrollBox:ScrollToElementData(category, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation);

	KrowiAF_CategoriesFrame:ShowSubFrame(category);
end

function KrowiAF_SelectCategory(category, collapsed)
	-- Select tab
	local categoriesTree = category:GetTree();
	-- print("toggle")
	addon.Gui:ToggleAchievementFrame(addonName, categoriesTree[1].TabName, nil, true); -- This will call both category and achievement update
	-- print("end toggle")

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
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI");
    end

	for i = 1, #addon.SpecialCategories.CurrentZone do
		if addon.Options.db.profile.AdjustableCategories.CurrentZone[i] then
			KrowiAF_SelectCategory(addon.SpecialCategories.CurrentZone[i], collapsed);
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