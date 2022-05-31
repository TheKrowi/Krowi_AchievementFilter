-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
local search = gui.Search;
search.FullSearchResultsButton = {};
local fullSearchResultsButton = search.FullSearchResultsButton;

local OnClick;
function fullSearchResultsButton.PostLoadButtons(buttons)
	diagnostics.Trace("fullSearchResultsButton.PostLoadButtons");

    for _, button in next, buttons do
		button:SetScript("OnClick", function(self, button, down)
			OnClick(self);
		end);
	end
end

function OnClick(self)
    diagnostics.Trace("fullSearchResultsButton.OnClick");

    if self.Achievement then
        search.FullSearchResultsFrame:Hide();
        gui.AchievementsFrame:SelectAchievement(self.Achievement, nil, true);
	end
end