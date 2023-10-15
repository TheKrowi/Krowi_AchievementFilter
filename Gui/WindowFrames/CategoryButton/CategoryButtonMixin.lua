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
    KrowiAF_CategoriesFrame:SelectCategory(self.Category);
end

function KrowiAF_CategoryButtonMixin:SetType(category)
	if category.Parent.TabName ~= nil then
		self.Label:SetFontObject("GameFontNormal");
		self.BackgroundLeft:SetVertexColor(1, 1, 1);
		self.BackgroundMid:SetVertexColor(1, 1, 1);
		self.BackgroundRight:SetVertexColor(1, 1, 1);
		return;
	end
	-- Not top level category
	self.Label:SetFontObject("GameFontHighlight");
	self.BackgroundLeft:SetVertexColor(0.6, 0.6, 0.6);
	self.BackgroundMid:SetVertexColor(0.6, 0.6, 0.6);
	self.BackgroundRight:SetVertexColor(0.6, 0.6, 0.6);
end

function KrowiAF_CategoryButtonMixin:SetLabel(category)
	local children = category.Children;
	local name = category.Name;
	if children and #children > 0 and category.ShowCollapseIcon then
		if category.NotCollapsed then
			name = "- " .. name;
		else
			name = "+ " .. name;
		end
	end
	self.Label:SetText(name);
end

function KrowiAF_CategoryButtonMixin:SetTooltipData(category)
	self.Text = category.Name;
	self.NumOfAch, self.NumOfCompAch, self.NumOfNotObtAch = category.NumOfAch, category.NumOfCompAch, category.NumOfNotObtAch;
	if category.IsSummary then
		self.showTooltipFunc = nil;
	else
		self.showTooltipFunc = addon.GUI.ShowStatusBarTooltip;
	end
end

function KrowiAF_CategoryButtonMixin:SetCategory(category)
	if not category then
		self.Category = nil;
		return;
	end

	self.Category = category;
	self:SetType(category);
	self:SetLabel(category);
	self:SetTooltipData(category);

	local selectedTab = addon.GUI.SelectedTab;
	if not selectedTab then
		return;
	end

	if category == selectedTab.SelectedCategory then
		self:LockHighlight();
	else
		self:UnlockHighlight();
	end
end