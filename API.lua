-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_SelectAchievementWithCategory(achievement, category, mouseButton, ignoreModifiers, anchor, offsetX, offsetY)
	if mouseButton == nil then
		mouseButton = "LeftButton";
	end

	local selectedTab = addon.GUI.SelectedTab;
	local selectedAchievement = selectedTab.SelectedAchievement;
	local scrollFrame = addon.GUI.AchievementsFrame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;

	addon.GUI.CategoriesFrame:SelectCategory(category);
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