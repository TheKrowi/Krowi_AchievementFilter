-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.CategoryButton = {};
local categoryButton = gui.CategoryButton;

local function OnClick(self, quick)
	local categoriesFrame = addon.GUI.CategoriesFrame;
	local achievementsFrame = addon.GUI.AchievementsFrame;

	if self.Category.IsSummary then
		KrowiAF_AchievementsSummaryFrame:Show();
		achievementsFrame:Hide();
	else
		achievementsFrame:Show();
		KrowiAF_AchievementsSummaryFrame:Hide();
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