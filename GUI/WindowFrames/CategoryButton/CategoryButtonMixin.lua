-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_CategoryButtonMixin = {};

function KrowiAF_CategoryButtonMixin:OnEnter()
	if self.showTooltipFunc then
		self.showTooltipFunc(self);
	end
end

function KrowiAF_CategoryButtonMixin:OnLeave()
	GameTooltip:SetMinimumWidth(0, false);
	GameTooltip:Hide();
end

function KrowiAF_CategoryButtonMixin:OnClick()
	self:Select();
end

function KrowiAF_CategoryButtonMixin:SetCategory(category)
	if not category then
		self.Category = nil;
		return;
	end

	self.Category = category;

	local parent = category.Parent;
	if parent.TabName == nil then -- Not top level category
		self.Label:SetFontObject("GameFontHighlight");
		self.BackgroundLeft:SetVertexColor(0.6, 0.6, 0.6);
		self.BackgroundMid:SetVertexColor(0.6, 0.6, 0.6);
		self.BackgroundRight:SetVertexColor(0.6, 0.6, 0.6);
	else -- Top level category
		self.Label:SetFontObject("GameFontNormal");
		self.BackgroundLeft:SetVertexColor(1, 1, 1);
		self.BackgroundMid:SetVertexColor(1, 1, 1);
		self.BackgroundRight:SetVertexColor(1, 1, 1);
	end

	local children = category.Children;
	self.Label:SetText(category.Name);
	if children and #children > 0 and category.ShowCollapseIcon then
		if category.NotCollapsed then
			self.Label:SetText("- " .. category.Name);
		else
			self.Label:SetText("+ " .. category.Name);
		end
	end

	-- For the tooltip
	self.Text = category.Name;
	self.NumOfAch, self.NumOfCompAch, self.NumOfNotObtAch = category.NumOfAch, category.NumOfCompAch, category.NumOfNotObtAch;
	if category.IsSummary then
		self.showTooltipFunc = nil;
	else
		self.showTooltipFunc = addon.GUI.ShowStatusBarTooltip;
	end

	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	self:UpdateSelectionState(category == selectedTab.SelectedCategory);
end

function KrowiAF_CategoryButtonMixin:Select(quick)
	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	local category = self.Category;
	local categoriesFrame = addon.GUI.CategoriesFrame;
	categoriesFrame:ShowSubFrame(self.Category);
    categoriesFrame:SelectButton(self, quick);
    categoriesFrame:Update();

	local scrollBox = categoriesFrame.ScrollBox;
	local dataProvider = scrollBox:GetDataProvider();
	if not dataProvider then
		return;
	end

	category = dataProvider:FindElementDataByPredicate(function(elementData)
		return elementData == category;
	end);
	if not category then
		return;
	end

	-- categoriesFrame:ScrollToNearest(category);
	-- scrollBox:ScrollToElementData(category, ScrollBoxConstants.AlignCenter, ScrollBoxConstants.NoScrollInterpolation);
end

function KrowiAF_CategoryButtonMixin:UpdateSelectionState(selected)
	if selected then
		self:LockHighlight();
	else
		self:UnlockHighlight();
	end
end