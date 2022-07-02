-- [[ Namespaces ]] --
local addonName, addon = ...;

function KrowiAF_SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	if mouseButton == nil then
		mouseButton = "LeftButton";
	end

	local selectedTab = addon.GUI.SelectedTab;
	local selectedAchievement = selectedTab.SelectedAchievement;
	local scrollFrame = addon.GUI.AchievementsFrame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;

	KrowiAF_SelectCategory(category);
	scrollBar:SetValue(0); -- Makes sure the scrollbar is at the top since this can be in a diff location if the category is already selected

	-- Select achievement
	local shown = false;
	local previousScrollValue;

	while not shown do
		for _, button in next, buttons do
			if button.id == achievement.ID and math.ceil(button:GetTop()) >= math.ceil(addon.GUI.GetSafeScrollChildBottom(scrollFrame)) then
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

    local filterButton = addon.GUI.FilterButton;

	-- Get category
	local category;
	if filterButton and filterButton.Filters.db.MergeSmallCategories then
		category = achievement:GetMergedCategory(); -- This way we get the parent category
	else
		category = achievement.Category;
	end

	-- Set filters so achievement is visible
	if filterButton then
		local filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
		achievement = filterButton:GetHighestAchievementWhenCollapseSeries(filters, achievement);
		filterButton:SetFilters(filters, achievement);
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

function KrowiAF_SelectCategory(category, collapsed)
	local filterButton = addon.GUI.FilterButton;
	if filterButton and filterButton.Filters.db.MergeSmallCategories then
		while category.Merged do
			category = category.Parent;
		end
	end

	local categoriesTree = category:GetTree();

	-- Select tab
	addon.GUI.ToggleAchievementFrame(addonName, categoriesTree[1].TabName, nil, true);

	-- Select category
	for i, cat in next, categoriesTree do
		if cat.TabName == nil then
			if not cat.IsSelected or (cat.NotCollapsed == collapsed) then -- Issue #23: Fix -- Issue #25 Broken, Fix
				Select(cat, collapsed, i ~= #categoriesTree); -- Issue #23: Broken
			end
		end
	end
end