-- [[ Namespaces ]] --
local _, addon = ...;
local achievementButton = addon.GUI.AchievementButton;
local getCollapsedHeight = achievementButton.GetCollapsedHeight;

KrowiAF_AchievementsFrameMixin = {};

local function CreateScrollView(self)
	self.ButtonTemplate = "KrowiAF_AchievementButton_" .. (addon.Options.db.Achievements.Compact and "Small" or "Normal") .. "_Template";

	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer(self.ButtonTemplate, function(button, achievement)
		button:Update(achievement);
	end);
	self.ScrollView:SetElementExtentCalculator(function(_, achievement) -- This fires before setting the elements
		local selectedTab = addon.GUI.SelectedTab;
		local base = getCollapsedHeight(self.ButtonTemplate);
		if selectedTab and SelectionBehaviorMixin.IsElementDataIntrusiveSelected(achievement) then
			base = base + selectedTab.Extend;
		end
		return base;
	end);
    self.ScrollView:SetPadding(0, 0, 5, 5, 0);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);
	ScrollUtil.AddResizableChildrenBehavior(self.ScrollBox);
end

local function AddManagedScrollBarVisibilityBehavior(self)
	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", 0, 5)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 5)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithBar, anchorsWithoutBar);
end

local function ScrollBoxSelectionChanged(self, achievement, selected)
	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	selectedTab.SelectedAchievement = selected and achievement or nil;
	local button = self.ScrollBox:FindFrame(achievement);
	if not button then
		return;
	end

	button:Update(achievement);
	SetFocusedAchievement(achievement.Id);
	selectedTab.Extend = button:GetHeight() - getCollapsedHeight(self.ButtonTemplate);
end

local function AddSelectionBehavior(self)
	self.SelectionBehavior = ScrollUtil.AddSelectionBehavior(self.ScrollBox, SelectionBehaviorFlags.Deselectable, SelectionBehaviorFlags.Intrusive);
	self.SelectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, ScrollBoxSelectionChanged, self);
end

function KrowiAF_AchievementsFrameMixin:OnLoad()
	self.ScrollBox.wheelPanScalar = addon.Options.db.Achievements.MouseWheelPanScalar;
	self.ScrollBar.wheelPanScalar = addon.Options.db.Achievements.MouseWheelPanScalar;

	CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
	AddSelectionBehavior(self);

	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		self:ForceUpdate(true);
	end);
end

function KrowiAF_AchievementsFrameMixin:OnShow()
	if addon.AchievementEarnedUpdateAchievementsFrameOnNextShow then
		self:ForceUpdate();
		addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = nil;
	end
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
local function UpdateDataProvider(self, updateAchievements, retainScrollPosition)
	if updateAchievements then
		cachedAchievements = GetFilteredAchievements(cachedCategory);
	end

	local newDataProvider = CreateDataProvider();
	for _, achievement in next, cachedAchievements do
		newDataProvider:Insert(achievement);
	end
	self.ScrollBox:SetDataProvider(newDataProvider, retainScrollPosition);
end

local highlightedButton;
function KrowiAF_AchievementsFrameMixin:Update(retainScrollPosition)
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

	UpdateDataProvider(self, updateAchievements, retainScrollPosition);

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
	scrollBox:RecalculateDerivedExtent();
	local dataIndex = scrollBox:FindIndex(achievement);
	local scrollOffset = scrollBox:GetDerivedScrollOffset();
	local achievementButtonTop = scrollBox:GetExtentUntil(dataIndex);
	local achievementButtonBottom = achievementButtonTop + scrollBox:GetElementExtent(dataIndex);
	local scrollBoxHeight = scrollBox:GetVisibleExtent();
	if achievementButtonBottom > (scrollOffset + scrollBoxHeight) then
		scrollBox:ScrollToElementDataIndex(dataIndex, ScrollBoxConstants.AlignEnd);
	elseif achievementButtonTop < scrollOffset then
		scrollBox:ScrollToElementDataIndex(dataIndex, ScrollBoxConstants.AlignBegin);
	end
end

function KrowiAF_AchievementsFrameMixin:ClearFullSelection()
	addon.GUI.AchievementsObjectives:Hide();
	addon.GUI.SelectedTab.SelectedAchievement = nil;
	self.SelectionBehavior:ClearSelections();
end

function KrowiAF_AchievementsFrameMixin:ForceUpdate()
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

	if not self:IsShown() then
		return;
	end

	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	self:Update();

	if selectedTab.SelectedAchievement then
		self.ScrollBox:ScrollToElementData(selectedTab.SelectedAchievement, ScrollBoxConstants.AlignCenter, ScrollBoxConstants.NoScrollInterpolation);
		self.SelectionBehavior:SelectElementData(selectedTab.SelectedAchievement);
		self:ScrollToNearest(selectedTab.SelectedAchievement);
	end
end