local _, addon = ...;

KrowiAF_AchievementsFrameMixin = {};

local function CreateScrollView(self)
	local template = "KrowiAF_AchievementButton_" .. (addon.Options.db.profile.Achievements.Compact and "Small" or "Normal") .. "_Template";
    self.DummyFrame = CreateFrame("Button", nil, self, template);

	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer(template, function(button, achievement)
		button:Update(achievement);
	end);
	self.ScrollView:SetElementExtentCalculator(function(_, achievement) -- This fires before setting the elements
		local selectedTab = addon.Gui.SelectedTab;
		local base = self.DummyFrame.CollapsedHeight;
		if selectedTab and SelectionBehaviorMixin.IsElementDataIntrusiveSelected(achievement) then
			base = base + (selectedTab.Extend or 0);
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
	-- print("ScrollBoxSelectionChanged", achievement and achievement.Id, selected, achievement and achievement.selected)
	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab then
		return;
	end

	--[[ Note
		This should fix the strange behaviour where achievements are partially selected when switching between tabs
	]]
	if achievement.selected == nil then
		return;
	end

	if selected then
		selectedTab.SelectedAchievement = achievement;
	elseif achievement == selectedTab.SelectedAchievement then
		selectedTab.SelectedAchievement = nil;
	end
	local button = self.ScrollBox:FindFrame(achievement);
	if not button then
		return;
	end

	button:Update(achievement, nil, not achievement.selected);
	SetFocusedAchievement(achievement.Id);
	selectedTab.Extend = button:GetHeight() - self.DummyFrame.CollapsedHeight;

	-- print("Selecting", selectedTab.SelectedAchievement and selectedTab.SelectedAchievement.Id)
	if addon.Options.db.profile.TrackAchievementBrowserHistory then
		addon.Util.DelayFunction("KrowiAF_AddToBrowsingHistory", 0.1, function()
			addon.BrowsingHistory:Add(selectedTab.SelectedCategory, selectedTab.SelectedAchievement);
			addon.Gui.BrowsingHistory:Update();
		end);
	end
end

local function AddSelectionBehavior(self)
	self.SelectionBehavior = ScrollUtil.AddSelectionBehavior(self.ScrollBox, SelectionBehaviorFlags.Deselectable, SelectionBehaviorFlags.Intrusive);
	self.SelectionBehavior:RegisterCallback(SelectionBehaviorMixin.Event.OnSelectionChanged, ScrollBoxSelectionChanged, self);
end

function KrowiAF_AchievementsFrameMixin:OnLoad()
	self.ScrollBox.wheelPanScalar = addon.Options.db.profile.Achievements.MouseWheelPanScalar;
	self.ScrollBar.wheelPanScalar = addon.Options.db.profile.Achievements.MouseWheelPanScalar;

	CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
	AddSelectionBehavior(self);

	hooksecurefunc("AchievementFrame_ForceUpdate", function()
		self:ForceUpdate();
	end);
end

function KrowiAF_AchievementsFrameMixin:OnEvent(event)
	if event == "ACHIEVEMENT_EARNED" then
		addon.Util.DelayFunction("KrowiAF_AchievementsFrame_OnEvent", 1, self.ForceUpdate, self);
		return;
	end
end

local updateOnNextShow;
function KrowiAF_AchievementsFrameMixin:OnShow()
    self:RegisterEvent("ACHIEVEMENT_EARNED");
	if addon.AchievementEarnedUpdateAchievementsFrameOnNextShow or updateOnNextShow then
		self:ForceUpdate();
		addon.AchievementEarnedUpdateAchievementsFrameOnNextShow = nil;
	end

	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab then
		return;
	end

	self.Text:Hide();

	local selectedCategory = selectedTab.SelectedCategory;
	if not selectedCategory then
		if not selectedTab:GetCategories() then
			self.Text:SetText(addon.L["Categories not loaded"]:KAF_InjectAddonName());
		else
			self.Text:SetText(addon.L["No category selected"]);
		end
		self.Text:Show();
		return;
	end

	if selectedTab.SelectedCategory and selectedTab.SelectedCategory.IsCurrentZone then
		self:ForceUpdate();
	end
end

function KrowiAF_AchievementsFrameMixin:OnHide()
    self:UnregisterEvent("ACHIEVEMENT_EARNED");
end

local function Validate(achievements, displayAchievements, defaultOrder, ignoreFilters)
	if not achievements then
		return;
	end
	local filters = addon.Filters;
	for _, achievement in next, achievements do
		if filters:AutoValidate(achievement, ignoreFilters) > 0 then -- Greater than 0 means it can be shown
			tinsert(displayAchievements, achievement);
		end
		defaultOrder[achievement] = #displayAchievements;
	end
end

local function GetFilteredAchievements(category)
	local displayAchievements = {};
	local defaultOrder = {};

	Validate(category.Achievements, displayAchievements, defaultOrder, category.IgnoreFilters);
	Validate(category.MergedAchievements, displayAchievements, defaultOrder, category.IgnoreFilters);

	if #displayAchievements == 0 then
		return displayAchievements;
	end

	return addon.Filters:Sort(displayAchievements, defaultOrder);
end

local function UpdateDataProvider(self, achievements, retainScrollPosition)
	local newDataProvider = CreateDataProvider();
	for _, achievement in next, achievements do
		newDataProvider:Insert(achievement);
	end
	self.ScrollBox:SetDataProvider(newDataProvider, retainScrollPosition);
end

local highlightedButton;
local cachedCategory, cachedAchievements; -- Caching this speeds up the scrolling of achievements when the selected category isn't changed
function KrowiAF_AchievementsFrameMixin:Update(retainScrollPosition)
	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab then
		return;
	end

	local selectedCategory = selectedTab.SelectedCategory;
	if not selectedCategory then
		return;
	end

	local updateAchievements = cachedCategory ~= selectedCategory or selectedCategory.HasFlexibleData;
	cachedCategory = selectedCategory;
	if updateAchievements then
		cachedAchievements = GetFilteredAchievements(cachedCategory);
	end
	UpdateDataProvider(self, cachedAchievements, retainScrollPosition);

	self.Text:Hide();
	if cachedAchievements and #cachedAchievements == 0 then
		self.Text:SetText(addon.L["This category has no achievements"]);
		self.Text:Show();
		return;
	end

	-- Make sure the correct tooltip is shown when scrolling
	if highlightedButton then
		highlightedButton:ShowTooltip();
	end
end

function KrowiAF_AchievementsFrameMixin:SetHighlightedButton(button)
	highlightedButton = button;
end

function KrowiAF_AchievementsFrameMixin:ClearHighlightedButton()
	highlightedButton = nil;
end

function KrowiAF_AchievementsFrameMixin:ScrollToNearest(achievement)
	local scrollBox = self.ScrollBox;
	scrollBox:RecalculateDerivedExtent();
	local dataIndex = scrollBox:FindFrameElementDataIndex(achievement);
	if not dataIndex then
		return;
	end
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
	KrowiAF_AchievementsObjectives:Hide();
	addon.Gui.SelectedTab.SelectedAchievement = nil;
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
			if addon.Filters.Validate(tabButton.Filters, tabButton.SelectedAchievement, tabButton.SelectedCategory.IgnoreFilters) < 0 then
				tabButton.SelectedAchievement = nil;
			end
		end
	end

	updateOnNextShow = true;
	if not self:IsShown() then
		return;
	end

	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab then
		return;
	end
	updateOnNextShow = nil;

	local buttons = self.ScrollView:GetFrames();
	for _, button in next, buttons do
		button.Achievement = nil;
	end

	self:Update();

	if selectedTab.SelectedAchievement then
		self.ScrollBox:ScrollToElementData(selectedTab.SelectedAchievement, ScrollBoxConstants.AlignCenter, nil, ScrollBoxConstants.NoScrollInterpolation);
		-- print("forceupdate select")
		self.SelectionBehavior:SelectElementData(selectedTab.SelectedAchievement);
		self:ScrollToNearest(selectedTab.SelectedAchievement);
	end
end
