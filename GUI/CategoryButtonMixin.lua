-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_CategoryButton_Mixin = {};

function KrowiAF_CategoryButton_Mixin:SetCategory(category)
	local parent = category.Parent;
	self:SetPoint("LEFT", 2 + (category.Level - 1) * addon.Options.db.Categories.Indentation, 0);
	if parent.TabName == nil then -- Not top level category has parent
		self.Label:SetFontObject("GameFontHighlight");
		self.BackgroundLeft:SetVertexColor(0.6, 0.6, 0.6);
		self.BackgroundMid:SetVertexColor(0.6, 0.6, 0.6);
		self.BackgroundRight:SetVertexColor(0.6, 0.6, 0.6);
	else -- Top level category has no parent
		self.Label:SetFontObject("GameFontNormal");
		self.BackgroundLeft:SetVertexColor(1, 1, 1);
		self.BackgroundMid:SetVertexColor(1, 1, 1);
		self.BackgroundRight:SetVertexColor(1, 1, 1);
	end
	self.Label:SetText(category.Name);
	local children = category.Children;
	if children and #children ~= 0 and category.ShowCollapseIcon then
		if category.NotCollapsed then
			self.Label:SetText("- " .. category.Name);
		else
			self.Label:SetText("+ " .. category.Name);
		end
	end
	self.Category = category;

	-- For the tooltip
	local numOfAch, numOfCompAch, numOfNotObtAch = category.NumOfAch, category.NumOfCompAch, category.NumOfNotObtAch;
	self.Name = category.Name;
	self.NumOfAch = numOfAch;
	self.NumOfCompAch = numOfCompAch;
	self.NumOfNotObtAch = numOfNotObtAch
	if category.IsSummary then
		self.showTooltipFunc = nil;
	else
		self.showTooltipFunc = addon.GUI.ShowStatusBarTooltip;
	end
end

function KrowiAF_CategoryButton_Mixin:Click(button, down, quick)
	local achievementsFrame = addon.GUI.AchievementsFrame;
	local summaryFrame = addon.GUI.SummaryFrame;

	if self.Category.IsSummary then
		summaryFrame:Show();
		achievementsFrame:Hide();
	else
		achievementsFrame:Show();
		summaryFrame:Hide();
	end

	local categoriesFrame = addon.GUI.CategoriesFrame;
    categoriesFrame:SelectButton(self, quick);
    categoriesFrame:Update();
end