-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementsFrameMixin = {};

function KrowiAF_AchievementsFrameMixin:OnLoad()
	local template = "KrowiAF_AchievementButton_" .. (addon.Options.db.Achievements.Compact and "Small" or "Normal") .. "_Template";

	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer(template, function(_frame, achievement)
		_frame:Update(achievement);
	end);
	self.ScrollView:SetElementExtentCalculator(function(dataIndex, achievement)
			local button = self.ScrollView:GetFrames()[dataIndex];
			if button then
				return button.NewHeight;
			end
			return addon.Options.db.Achievements.Compact and 48 or 84;
	end);
    self.ScrollView:SetPadding(0, 0, 5, 5, 0);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);

	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", 0, 5)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 5)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithBar, anchorsWithoutBar);
	ScrollUtil.AddResizableChildrenBehavior(self.ScrollBox);
end

function KrowiAF_AchievementsFrameMixin.Show_Hide(frame, func, offsetX)
	local scrollFrame = frame.ScrollFrame;
	frame:SetPoint("RIGHT", offsetX, 0);
	func(scrollFrame.ScrollBar);
end

local function Validate(achievements, displayAchievements, defaultOrder)
	if not achievements then
		return;
	end
	local filters = addon.Filters;
	for _, achievement in next, achievements do
		if filters:AutoValidate(achievement) > 0 then -- Greater than 0 means it can be shown
			tinsert(displayAchievements, achievement);
		end
		defaultOrder[achievement] = #displayAchievements;
	end
end

local function GetFilteredAchievements(category)
	local displayAchievements = {};
	local defaultOrder = {};

	Validate(category.Achievements, displayAchievements, defaultOrder);
	Validate(category.MergedAchievements, displayAchievements, defaultOrder);

	if #displayAchievements == 0 then
		return displayAchievements;
	end

	return addon.Filters:Sort(displayAchievements, defaultOrder);
end

local cachedCategory, cachedAchievements; -- Caching this speeds up the scrolling of achievements when the selected category isn't changed
function KrowiAF_AchievementsFrameMixin:UpdateDataProvider(updateAchievements)
	local selectedTab = addon.GUI.SelectedTab;
	if selectedTab == nil then
		return;
	end

	if updateAchievements then
		cachedAchievements = GetFilteredAchievements(cachedCategory);
	end

	local newDataProvider = CreateDataProvider();
	for _, achievement in next, cachedAchievements do
		newDataProvider:Insert(achievement);
	end
	self.ScrollBox:SetDataProvider(newDataProvider);
end

local highlightedButton;
function KrowiAF_AchievementsFrameMixin:Update()
	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	local selectedCategory = selectedTab.SelectedCategory;
	local updateAchievements = cachedCategory ~= selectedCategory or selectedCategory.HasFlexibleData;
	cachedCategory = selectedCategory;
	if cachedCategory.IsCurrentZone then
		updateAchievements = addon.Data.GetCurrentZoneAchievements() or updateAchievements;
	end

	self:UpdateDataProvider(updateAchievements);

	self.Text:Hide();

	-- Make sure the correct tooltip is shown when scrolling
	if highlightedButton then
		highlightedButton:ShowTooltip();
	end
end

function KrowiAF_AchievementsFrameMixin.SetHighlightedButton(button)
	highlightedButton = button;
end

function KrowiAF_AchievementsFrameMixin.ClearHighlightedButton()
	highlightedButton = nil;
end

function KrowiAF_AchievementsFrameMixin:ScrollToNearest(achievement)
	local scrollBox = self.ScrollBox;
	local dataIndex = scrollBox:FindIndex(achievement);
	local scrollOffset = scrollBox:GetDerivedScrollOffset();
	if (scrollBox:GetExtentUntil(dataIndex) + scrollBox:GetElementExtent(dataIndex)) > (scrollOffset + scrollBox:GetVisibleExtent()) then
		scrollBox:ScrollToElementDataIndex(dataIndex, ScrollBoxConstants.AlignEnd);
	elseif scrollBox:GetExtentUntil(dataIndex) < scrollOffset then
		scrollBox:ScrollToElementDataIndex(dataIndex, ScrollBoxConstants.AlignBegin);
	end
end

function KrowiAF_AchievementsFrameMixin:ExpandSelection(button)
	-- if button then
	-- 	HybridScrollFrame_ExpandButton(self.ScrollFrame, ((button.index - 1) * button.CollapsedHeight), button:GetHeight());
	-- end
	-- self:Update();
	-- self:AdjustSelection();
end

function KrowiAF_AchievementsFrameMixin:ClearSelection()
	local button = self.ScrollBox:FindFrameByPredicate(function(frame, achievement)
		return frame.selected;
	end);
	if not button then
		print("No selected buttons found")
		return;
	end

	print("Collapsing", button.Achievement.Id)
	button.selected = nil;
	button:Collapse();
	print(button.NewHeight)
end

function KrowiAF_AchievementsFrameMixin:ClearFullSelection()
	addon.GUI.AchievementsObjectives:Hide();
	addon.GUI.SelectedTab.SelectedAchievement = nil;
end

function KrowiAF_AchievementsFrameMixin:SelectButton(button)
	if not addon.GUI.SelectedTab then
		return;
	end

	print("selecting button")
	self:ClearSelection();
	print("collapsed button")

	addon.GUI.SelectedTab.SelectedAchievement = button.Achievement;
	-- button.selected = true;

	if addon.IsWrathClassic then
	-- 	local achievements = AchievementFrameAchievements;
	-- 	achievements.selection = button.id;
	-- 	achievements.selectionIndex = button.index;
	else
		SetFocusedAchievement(button.Achievement.Id);
	end
end

function KrowiAF_AchievementsFrameMixin:DeselectButton(button)
	if not addon.GUI.SelectedTab then
		return;
	end

	self:ClearSelection();

	addon.GUI.SelectedTab.SelectedAchievement = nil;
	-- button.selected = true;

	-- if addon.IsWrathClassic then
	-- 	local achievements = AchievementFrameAchievements;
	-- 	achievements.selection = button.id;
	-- 	achievements.selectionIndex = button.index;
	-- else
		-- SetFocusedAchievement(button.Achievement.Id);
	-- end
end

 -- Looks for the selection if it's not already visible
 function KrowiAF_AchievementsFrameMixin:FindSelection()
	local scrollFrame = self.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;
	local _, maxVal = scrollBar:GetMinMaxValues();
	local scrollHeight = scrollFrame:GetHeight();
	local newHeight = 0;

	scrollBar:SetValue(0);
	while true do
		for _, button in next, buttons do
			if button.selected then
				local scrollBarValue = scrollBar:GetValue();
				local scrollFrameTop = scrollFrame:GetTop();
				local buttonTop = button:GetTop();
				newHeight = scrollBarValue + scrollFrameTop - buttonTop;
				newHeight = min(newHeight, maxVal);
				scrollBar:SetValue(newHeight);
				return button;
			end
		end
		if not scrollBar:IsVisible() or scrollBar:GetValue() == maxVal then
			return; -- Failed to find the selected button :(
		else
			newHeight = newHeight + scrollHeight;
			newHeight = min(newHeight, maxVal);
			scrollBar:SetValue(newHeight);
		end
	end
end

-- When the selection is already visible, adjust it so it fits

function KrowiAF_AchievementsFrameMixin:AdjustSelection()
	local scrollFrame = self.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
	local buttons = scrollFrame.buttons;
	local selectedButton;

	-- Check if selection is visible
	for _, button in next, buttons do
		if button.selected then
			selectedButton = button;
			break;
		end
	end

	if not selectedButton then
		self:FindSelection();
		return;
	end

	local newHeight;
	if selectedButton:GetTop() > scrollFrame:GetTop() then
		newHeight = scrollBar:GetValue() + scrollFrame:GetTop() - selectedButton:GetTop();
	elseif selectedButton:GetBottom() < scrollFrame:GetBottom() then
		if selectedButton:GetHeight() > scrollFrame:GetHeight() then
			newHeight = scrollBar:GetValue() + scrollFrame:GetTop() - selectedButton:GetTop();
		else
			newHeight = scrollBar:GetValue() + scrollFrame:GetBottom() - selectedButton:GetBottom();
		end
	end
	if newHeight then
		local _, maxVal = scrollBar:GetMinMaxValues();
		newHeight = min(newHeight, maxVal);
		scrollBar:SetValueStep(1);
		scrollBar:SetValue(newHeight);
	end
end

function KrowiAF_AchievementsFrameMixin:ForceUpdate(toTop) -- Issue #3: Fix
	-- Clear the cache
	cachedCategory = nil;
	cachedAchievements = nil;

	-- Clear all selected achievements if they can not be shown anymore
	local tabButton;
	for _, tab in next, addon.Tabs do
		tabButton = tab.Button;
		if tabButton.SelectedAchievement then
			if addon.Filters.Validate(tabButton.Filters, tabButton.SelectedAchievement) < 0 then
				tabButton.SelectedAchievement = nil;
			end
		end
	end

	if not self:IsShown() then -- Issue #8: Fix, Issue #10 : Broken
		return;
	end

	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	if toTop then -- Issue #27: Fix
		self.ScrollFrame.ScrollBar:SetValue(0);
	end

	selectedTab.SelectedAchievement = addon.Filters.GetHighestAchievementWhenCollapseSeries(selectedTab.Filters, selectedTab.SelectedAchievement);

	-- Issue #8: Broken
	addon.GUI.AchievementsObjectives:Hide();
	addon.GUI.AchievementsObjectives.id = nil;

	local buttons = self.ScrollFrame.buttons;
	for _, button in next, buttons do
		-- button.Id = nil;
		button.Achievement = nil;
	end

	self:Update();

	if selectedTab.SelectedAchievement then
		local button = self:FindSelection();
		self:ExpandSelection(button);
	end
end