local _, addon = ...;
local addonName = addon.Metadata and addon.Metadata.AddonName or "Krowi_AchievementFilter";
local UpdateAddOnMemoryUsage = _G.UpdateAddOnMemoryUsage;
local GetAddOnMemoryUsage = _G.GetAddOnMemoryUsage;
local unpackSafe = table.unpack or unpack;

local function ProfileSection(label, fn, ...)
	local startMem;
	if UpdateAddOnMemoryUsage and GetAddOnMemoryUsage then
		UpdateAddOnMemoryUsage();
		startMem = GetAddOnMemoryUsage(addonName);
	end

	local startTime = debugprofilestop();
	local results = {fn(...)};
	local elapsed = debugprofilestop() - startTime;

	local deltaMem;
	if startMem then
		UpdateAddOnMemoryUsage();
		deltaMem = (GetAddOnMemoryUsage(addonName) or startMem) - startMem;
	end

	if addon.Diagnostics and addon.Diagnostics.Trace then
		addon.Diagnostics.Trace(string.format("[Profile] %s: %.1f ms, %+0.1f KB", label, elapsed, deltaMem or 0));
	end

	return unpackSafe(results);
end

KrowiAF_CategoriesFrameMixin = {};

local function CreateScrollView(self)
	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer("KrowiAF_CategoryButton_Template", function(button, category)
		button:SetCategory(category);
	end);
	self.ScrollView:SetElementIndentCalculator(function(category)
		if not category then
			return 0;
		end
		return 2 + (category.Level - 1) * addon.Options.db.profile.Categories.Indentation;
	end);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);
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

function KrowiAF_CategoriesFrameMixin:SetRightPoint()
	self:SetPoint("RIGHT", AchievementFrameCategories, addon.Options.db.profile.Window.CategoriesFrameWidthOffset, 0);
	AchievementFrameCategoriesBG:SetWidth(self:GetWidth() - 4);
end

function KrowiAF_CategoriesFrameMixin:OnLoad()
	self.ScrollBox.wheelPanScalar = addon.Options.db.profile.Categories.MouseWheelPanScalar;
	self.ScrollBar.wheelPanScalar = addon.Options.db.profile.Categories.MouseWheelPanScalar;

	CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
end

function KrowiAF_CategoriesFrameMixin:OnEvent(event)
	if event ~= "ACHIEVEMENT_EARNED" then
		return;
	end
	addon.Util.DelayFunction("KrowiAF_CategoriesFrame_OnEvent", 1, self.Update, self, true);
end

local function RestoreScrollPosition(frame)
	local selectedTab = addon.Gui.SelectedTab;
	if selectedTab == nil then
		return;
	end
	if selectedTab.SelectedCategory and selectedTab.CategoryScrollPercentage then
		frame.ScrollBox:SetScrollPercentage(selectedTab.CategoryScrollPercentage);
	end
end

function KrowiAF_CategoriesFrameMixin:OnShow()
	ProfileSection("CategoriesFrame:OnShow", function()
		self:RegisterEvent("ACHIEVEMENT_EARNED");
		self:SetRightPoint();
		AchievementFrameCategories:Hide();
		AchievementFrameWaterMark:SetTexture(addon.Gui.SelectedTab and addon.Gui.SelectedTab.WaterMark or "Interface/AchievementFrame/UI-Achievement-AchievementWatermark");
		self:Update(addon.AchievementEarnedUpdateCategoriesFrameOnNextShow);
		addon.AchievementEarnedUpdateCategoriesFrameOnNextShow = nil;
		RestoreScrollPosition(self);
	end);
end

function KrowiAF_CategoriesFrameMixin:OnHide()
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	AchievementFrameCategories:Show();
	AchievementFrameCategoriesBG:SetWidth(195);
end

local function GetDisplayCategories(displayCategories, category, getAchNums, stats)
	stats.Processed = stats.Processed + 1;

	if category.NotHidden or category.AlwaysVisible or category.HasFlexibleData then -- If already visible, keep visible
		local needsCounts = (category.NumOfAch == nil) or getAchNums or (category.HasFlexibleData and category.CountsDirty);
		if needsCounts and category.Parent.TabName ~= nil then
			-- Huge increase over performance if we cache the achievement numbers and only update them when needed,
			-- only for the top level categories since it works recursive
			local start = debugprofilestop();
			if category:GetAchievementNumbers() > 0 or category.AlwaysVisible then
				tinsert(displayCategories, category);
				stats.Added = stats.Added + 1;
			end
			stats.GetNumsCalls = stats.GetNumsCalls + 1;
			stats.GetNumsTime = stats.GetNumsTime + (debugprofilestop() - start);
			category.CountsDirty = nil; -- counts refreshed
		elseif category.NumOfAch > 0 or category.AlwaysVisible then
			tinsert(displayCategories, category);
			stats.Added = stats.Added + 1;
		end
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			GetDisplayCategories(displayCategories, child, getAchNums, stats);
		end
	end
end

local function UpdateDataProvider(self, categories, retainScrollPosition)
	local newDataProvider = CreateDataProvider();
	for _, category in next, categories do
		newDataProvider:Insert(category);
	end
	self.ScrollBox:SetDataProvider(newDataProvider, retainScrollPosition);
end

function KrowiAF_CategoriesFrameMixin:Update(getAchNums, retainScrollPosition)
	local selectedTab = addon.Gui.SelectedTab;
	if selectedTab == nil then
		return;
	end

	local filters = selectedTab.Filters;
	if filters.Refresh then
		filters.Refresh = nil;
		getAchNums = true;
	end

	local displayCategories = {};
	local stats = {Processed = 0, Added = 0, GetNumsCalls = 0, GetNumsTime = 0};
	local categories = addon.Gui.SelectedTab:GetCategories();
    if not categories then
        return;
    end

	-- Ensure current zone categories have up-to-date achievements before counting
	addon.Data.GetCurrentZoneAchievements();
	
	ProfileSection("CategoriesFrame:Update:Collect", function()
		for _, category in next, categories do
			GetDisplayCategories(displayCategories, category, getAchNums, stats);
		end
	end);
	if addon.Diagnostics and addon.Diagnostics.Trace then
		addon.Diagnostics.Trace(string.format("[Profile] CategoriesFrame:Update:CollectStats processed=%d added=%d getNums=%d time=%.1f ms", stats.Processed, stats.Added, stats.GetNumsCalls, stats.GetNumsTime));
	end
	if not addon.Util.TableFindKeyByValue(displayCategories, selectedTab.SelectedCategory) then
		selectedTab.SelectedCategory = displayCategories[1];
		selectedTab:ShowSubFrames();
	end
	ProfileSection("CategoriesFrame:Update:SetDataProvider", UpdateDataProvider, self, displayCategories, retainScrollPosition);
end

local function OpenCloseCategory(targetCategory, category)
	if category.Level == targetCategory.Level and category.Parent == targetCategory.Parent then -- Category on same level and same parent
		category.NotCollapsed = nil;
	end
	if category.Level > targetCategory.Level then -- Category on higher level
		if category.Parent == targetCategory then -- Show child of clicked button
			category.NotHidden = true;
		else
			category.NotHidden = nil; -- Hide the rest
		end
		category.NotCollapsed = nil;
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			OpenCloseCategory(targetCategory, child);
		end
	end
end

local function ExpandCategory(categories, targetCategory)
	for _, category in next, categories do
		OpenCloseCategory(targetCategory, category);
	end
	targetCategory.NotCollapsed = true;
end

local function HideCategory(targetCategory, category)
	if category.Level > targetCategory.Level then
		category.NotHidden = nil;
	end

	local children = category.Children;
	if children then
		for _, child in next, children do
			HideCategory(targetCategory, child);
		end
	end
end

local function CollapseCategory(categories, targetCategory)
	for _, category in next, categories do
		HideCategory(targetCategory, category);
	end
	targetCategory.NotCollapsed = nil;
end

function KrowiAF_CategoriesFrameMixin:ExpandToCategory(category)
	local selectedTab = addon.Gui.SelectedTab;
	if selectedTab == nil then
		return;
	end

	category = category:GetMergedCategory();
	local categoriesTree = category:GetTree();

	local categories = selectedTab:GetCategories();
    if not categories then
        return;
    end
	for i = 1, #categoriesTree do
		ExpandCategory(categories, categoriesTree[i])
	end
	selectedTab.SelectedCategory = category;
end

function KrowiAF_CategoriesFrameMixin:ShowSubFrame(category)
	if category.IsSummary then
		KrowiAF_AchievementsFrame:Hide();
		KrowiAF_SummaryFrame:Show();
	else
		KrowiAF_SummaryFrame:Hide();
		KrowiAF_AchievementsFrame:Show();
		KrowiAF_AchievementsFrame:ClearFullSelection();
		KrowiAF_AchievementsFrame:Update();
	end
end

function KrowiAF_CategoriesFrameMixin:SelectCategory(category)
	local selectedTab = addon.Gui.SelectedTab;
	if not selectedTab then
		return;
	end

	local prevCategory = selectedTab.SelectedCategory;

	local categories = selectedTab:GetCategories();
    if not categories then
        return;
    end
	if category == selectedTab.SelectedCategory and category.NotCollapsed then
		CollapseCategory(categories, category);
	else
		ExpandCategory(categories, category);
		selectedTab.SelectedCategory = category;
	end
    self:Update(nil, true);

	if prevCategory == selectedTab.SelectedCategory and prevCategory.HasFlexibleData ~= true then
		-- If this category was selected already, bail after changing collapsed states.
		return;
	end

	self:ShowSubFrame(selectedTab.SelectedCategory);
end