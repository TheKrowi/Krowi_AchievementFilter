-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CategoryButton = {};
local categoryButton = addon.GUI.CategoryButton;

local function OnClick(self, quick)
	local categoriesFrame = addon.GUI.CategoriesFrame;
	local achievementsFrame = addon.GUI.AchievementsFrame;
	local summaryFrame = addon.GUI.SummaryFrame;

	if self.Category.IsSummary then
		summaryFrame:Show();
		achievementsFrame:Hide();
	else
		achievementsFrame:Show();
		summaryFrame:Hide();
	end
    categoriesFrame:SelectButton(self, quick);
    categoriesFrame:Update();
end

function categoryButton.PostLoadButtons(categoriesFrame)
	local scrollFrame = categoriesFrame.Container;
	local buttons = scrollFrame.buttons;
	for _, button in next, buttons do
		button.Click = function(self, btn, down, quick)
			OnClick(self, quick);
		end;
		button:SetScript("OnClick", button.Click);
	end
end