-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CategoriesFrame = {};
local categoriesFrame = addon.GUI.CategoriesFrame;

local categoriesWidth = 175;
local categoriesWidthScrollBarOffset = 22;
local watermarkWidthOffset = 30;

-- [[ Constructors ]] --
categoriesFrame.__index = categoriesFrame; -- Used to inject all the namespace functions to the frame
function categoriesFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameCategoriesFrame", AchievementFrame, "KrowiAF_AchievementFrameCategoriesFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrameCategories);
	frame:SetPoint("BOTTOM", 0, 20);
	addon.Util.InjectMetatable(frame, categoriesFrame); -- Inject all the namespace functions to the frame

	-- We need to insert the categories frame infront of the achievements frame so the show/hide function fire in the correct order
	for i, frameName in next, ACHIEVEMENTFRAME_SUBFRAMES do
		if frameName == addon.GUI.AchievementsFrame:GetName() then
			tinsert(ACHIEVEMENTFRAME_SUBFRAMES, i, frame:GetName());
			break;
		end
	end

	local scrollFrame = frame.Container;
	local scrollBar = scrollFrame.ScrollBar;
	local scrollBarShow = getmetatable(scrollBar).__index.Show;
	scrollBar.Show = function()
		self.Show_Hide(frame, scrollBarShow, categoriesWidth, categoriesWidthScrollBarOffset, watermarkWidthOffset);
	end;
	local scrollBarHide = getmetatable(scrollBar).__index.Hide;
	scrollBar.Hide = function()
		self.Show_Hide(frame, scrollBarHide, categoriesWidth + categoriesWidthScrollBarOffset, 0, watermarkWidthOffset);
	end;

	scrollFrame.update = function()
		frame:Update(); -- Issue #12: Broken
	end

	HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_AchievementFrameCategoriesFrameCategoryButton_Template", -4, 0, "TOPRIGHT", "TOPRIGHT", 0, 0, "TOPRIGHT", "BOTTOMRIGHT");
	addon.GUI.CategoryButton.PostLoadButtons(frame);

	addon.GUI.CategoriesFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_AchievementFrameCategoriesFrame_OnShow(self) -- Used in Templates - KrowiAF_CategoriesFrame_Template
	AchievementFrameCategories:Hide(); -- Issue #11: Fix
	AchievementFrameFilterDropDown:Hide();
	AchievementFrame.searchBox:Hide();
	AchievementFrameHeaderLeftDDLInset:Show();
	AchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1); -- Set this global texture for player achievements
	self:Update();
end

function KrowiAF_AchievementFrameCategoriesFrame_OnHide() -- Used in Templates - KrowiAF_CategoriesFrame_Template
	AchievementFrameCategories:Show(); -- Issue #11: Fix
	AchievementFrameCategoriesBG:SetWidth(195); -- Set back to default value
	if not AchievementFrameAchievements:IsShown() then
		AchievementFrameFilterDropDown:Hide();
		AchievementFrameHeaderLeftDDLInset:Hide();
	end
	AchievementFrame.searchBox:Show();
end

function categoriesFrame.Show_Hide(frame, func, _categoriesWidth, achievementsOffsetX, _watermarkWidthOffset)
	local scrollFrame = frame.Container;

	local categoriesFrameWidthOffset = addon.Options.db.Window.CategoriesFrameWidthOffset;
	_categoriesWidth = _categoriesWidth + categoriesFrameWidthOffset;
	_watermarkWidthOffset = _watermarkWidthOffset + categoriesFrameWidthOffset;

	frame:SetWidth(_categoriesWidth);
	scrollFrame:GetScrollChild():SetWidth(_categoriesWidth);
	addon.GUI.AchievementsFrame:SetPoint("TOPLEFT", frame, "TOPRIGHT", achievementsOffsetX, 0);
	addon.GUI.SummaryFrame:SetPoint("TOPLEFT", frame, "TOPRIGHT", achievementsOffsetX, 0);
	AchievementFrameWaterMark:SetWidth(_categoriesWidth - _watermarkWidthOffset);
	AchievementFrameWaterMark:SetTexCoord(0, (_categoriesWidth - _watermarkWidthOffset)/256, 0, 1);
	AchievementFrameCategoriesBG:SetWidth(_categoriesWidth - 2); -- Offset of 2 needed to compensate with Blizzard tabs

	local buttons = scrollFrame.buttons;
	for _, button in next, buttons do
		frame:DisplayButton(button, button.Category, frame:GetWidth());
	end

	func(scrollFrame.ScrollBar);
end

local function GetDisplayCategories(displayCategories, category, getAchNums)
	if category.NotHidden or category.AlwaysVisible then -- If already visible, keep visible
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

function categoriesFrame:Update(getAchNums)
	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab == nil then
		return;
	end

	local filters = selectedTab.Filters;
	if filters.Refresh then
		filters.Refresh = nil;
		getAchNums = true;
	end

	local scrollFrame = self.Container;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;

	local displayCategories = {};
	local categories = selectedTab.Categories;
	for _, category in next, categories do
		GetDisplayCategories(displayCategories, category, getAchNums);
	end

	local totalHeight = #displayCategories * buttons[1]:GetHeight();
	local displayedHeight = 0;

	local category;
	for i = 1, #buttons do
		category = displayCategories[i + offset];
		displayedHeight = displayedHeight + buttons[i]:GetHeight();
		if category then
			self:DisplayButton(buttons[i], category, self:GetWidth());
			if category == selectedTab.SelectedCategory then
				buttons[i]:LockHighlight();
			else
				buttons[i]:UnlockHighlight();
			end
			buttons[i]:Show();
		else
			buttons[i].Category = nil;
			buttons[i]:Hide();
		end
	end

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

function categoriesFrame:DisplayButton(button, category, baseWidth)
	if not category then
		button.Category = nil;
		button:Hide();
		return;
	end

	baseWidth = baseWidth or 197;

	button:Show();
	local parent = category.Parent;
	if parent.TabName == nil then -- Not top level category has parent
		button:SetWidth(baseWidth - 15 - (category.Level - 1) * 5);
		button.label:SetFontObject("GameFontHighlight");
		button.BackgroundLeft:SetVertexColor(0.6, 0.6, 0.6);
		button.BackgroundMid:SetVertexColor(0.6, 0.6, 0.6);
		button.BackgroundRight:SetVertexColor(0.6, 0.6, 0.6);
	else -- Top level category has no parent
		button:SetWidth(baseWidth - 10);
		button.label:SetFontObject("GameFontNormal");
		button.BackgroundLeft:SetVertexColor(1, 1, 1);
		button.BackgroundMid:SetVertexColor(1, 1, 1);
		button.BackgroundRight:SetVertexColor(1, 1, 1);
	end

	local children = category.Children;
	button.label:SetText(category.Name);
	if children and #children ~= 0 and category.ShowCollapseIcon then
		if category.NotCollapsed then
			button.label:SetText("- " .. category.Name);
		else
			button.label:SetText("+ " .. category.Name);
		end
	end
	button.Category = category;

	-- For the tooltip
	local numOfAch, numOfCompAch, numOfNotObtAch = category.NumOfAch, category.NumOfCompAch, category.NumOfNotObtAch;
	button.name = category.Name;
	button.text = nil;
	button.numAchievements = numOfAch;
	button.numCompleted = numOfCompAch;
	button.numOfNotObtAch = numOfNotObtAch
	local numOfNotObtAchText = "";
	if numOfNotObtAch > 0 and addon.Options.db.Tooltip.Categories.ShowNotObtainable then
		numOfNotObtAchText = " (+" .. numOfNotObtAch .. ")";
	end
	button.numCompletedText = numOfCompAch .. numOfNotObtAchText .. " / " .. numOfAch;
	if category.IsSummary then
		button.showTooltipFunc = nil;
	else
		button.showTooltipFunc = addon.GUI.ShowStatusBarTooltip;
	end
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

function categoriesFrame:SelectButton(button, quick)
	local selectedTab = addon.GUI.SelectedTab;
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
		achievementsFrame.Container.ScrollBar:SetValue(0);
		achievementsFrame:Update();
	end
end