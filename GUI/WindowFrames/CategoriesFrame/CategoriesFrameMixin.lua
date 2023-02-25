-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_CategoriesFrameMixin = {};

function KrowiAF_CategoriesFrameMixin:Show_Hide(func, offsetX)
	local scrollFrame = self.ScrollFrame;

	self:SetPoint("RIGHT", AchievementFrameAchievements, "LEFT", addon.Options.db.Window.CategoriesFrameWidthOffset - offsetX, 0);
	local width = self:GetWidth();
	scrollFrame:GetScrollChild():SetWidth(width);
	addon.GUI.AchievementsFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", offsetX, 0);
	addon.GUI.SummaryFrame:SetPoint("TOPLEFT", self, "TOPRIGHT", offsetX, 0);
	local watermarkWidthOffset = width - 7;
	AchievementFrameWaterMark:SetWidth(watermarkWidthOffset);
	AchievementFrameWaterMark:SetTexCoord(0, (watermarkWidthOffset) / 256, 0, 1);
	AchievementFrameCategoriesBG:SetWidth(width - 2); -- Offset of 2 needed to compensate with Blizzard tabs

	func(scrollFrame.ScrollBar);
end

local function GetDisplayCategories(displayCategories, category, getAchNums)
	if category.NotHidden or category.AlwaysVisible or category.HasFlexibleData then -- If already visible, keep visible
		if (category.NumOfAch == nil or getAchNums or category.HasFlexibleData) and category.Parent.TabName ~= nil then
			-- Huge increase over performance if we cache the achievement numbers and only update them when needed,
			-- only for the top level categories since it works recursive
			if category:GetAchievementNumbers() > 0 or category.AlwaysVisible then
				tinsert(displayCategories, category);
			end
		elseif category.NumOfAch > 0 or category.AlwaysVisible then
			tinsert(displayCategories, category);
		end
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			GetDisplayCategories(displayCategories, child, getAchNums);
		end
	end
end

function KrowiAF_CategoriesFrameMixin:Update(getAchNums)
	-- print("CategoriesFrame:Update", getAchNums)
	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab == nil then
		return;
	end

	local filters = selectedTab.Filters;
	if filters.Refresh then
		filters.Refresh = nil;
		getAchNums = true;
	end

	local scrollFrame = self.ScrollFrame;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;

	local displayCategories = {};
	local categories = selectedTab.Categories;
	for _, category in next, categories do
		GetDisplayCategories(displayCategories, category, getAchNums);
	end

	local displayedHeight = 0;
	local button, category;
	for i = 1, #buttons do
		button = buttons[i];
		category = displayCategories[i + offset];
		displayedHeight = displayedHeight + button:GetHeight();
		button:SetCategory(category);
		if category then
			button:Show();
			if category == selectedTab.SelectedCategory then
				button:LockHighlight();
			else
				button:UnlockHighlight();
			end
		else
			button:Hide();
		end
	end

	local totalHeight = #displayCategories * buttons[1]:GetHeight();
	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

local function HideCategory(button, category)
	if category.Level > button.Category.Level then
		category.NotHidden = nil;
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			HideCategory(button, child);
		end
	end
end

local function OpenCloseCategory(button, category)
	local buttonCategory = button.Category;
	if category.Level == buttonCategory.Level and category.Parent == buttonCategory.Parent then -- Category on same level and same parent
		category.NotCollapsed = nil;
	end
	if category.Level > buttonCategory.Level then -- Category on higher level
		if category.Parent == buttonCategory then -- Show child of clicked button
			category.NotHidden = true;
		else
			category.NotHidden = nil; -- Hide the rest
		end
		category.NotCollapsed = nil;
	end
	category.IsSelected = nil; -- Issue #12: Fix

	local children = category.Children;
	if children then
		for _, child in next, children do
			OpenCloseCategory(button, child);
		end
	end
end

function KrowiAF_CategoriesFrameMixin:SelectButton(button, quick)
	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab == nil then
		return;
	end
	local categories = selectedTab.Categories;
	local achievementsFrame = addon.GUI.AchievementsFrame;
	local buttonCategory = button.Category;
	if buttonCategory.IsSelected and buttonCategory.NotCollapsed then -- Collapse selected categories -- Issue #12: Fix
		buttonCategory.NotCollapsed = nil;
		for _, category in next, categories do
			HideCategory(button, category);
		end
	else -- Open selected category, close other highest level categories
		for _, category in next, categories do
			OpenCloseCategory(button, category);
		end
		buttonCategory.NotCollapsed = true;
	end

	buttonCategory.IsSelected = true; -- Issue #12: Fix

	if buttonCategory == selectedTab.SelectedCategory and buttonCategory.HasFlexibleData ~= true then
		-- If this category was selected already, bail after changing collapsed states.
		return;
	end

	selectedTab.SelectedCategory = buttonCategory; -- Issue #21: Broken, Fix
	if not quick then -- Skip refreshing achievements if we're still busy selecting the correct category
		achievementsFrame:ClearSelection();
		achievementsFrame.ScrollFrame.ScrollBar:SetValue(0);
		achievementsFrame:Update();
	end
end