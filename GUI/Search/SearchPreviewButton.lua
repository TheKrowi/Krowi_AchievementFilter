-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
local search = gui.Search;
search.SearchPreviewButton = {};
local searchPreviewButton = search.SearchPreviewButton;

local OnEnter, OnClick, OnClick_ShowFullSearchResults;
function searchPreviewButton.PostLoadButtons(buttons, showFullSearchResultsButton)
	diagnostics.Trace("searchPreviewButton.PostLoadButtons");

    for _, button in next, buttons do
        button.Enter = function(self) -- Done this way so we can call Enter externally
            OnEnter(self);
        end;
        button:SetScript("OnEnter", button.Enter);
		button:SetScript("OnClick", function(self, button, down)
			OnClick(self);
		end);
    end
    showFullSearchResultsButton.Enter = function(self) -- Done this way so we can call Enter externally
        OnEnter(self);
    end;
    showFullSearchResultsButton:SetScript("OnEnter", showFullSearchResultsButton.Enter);
    showFullSearchResultsButton:SetScript("OnClick", function(self, button, down)
        OnClick_ShowFullSearchResults();
    end);
end

function OnEnter(self)
    diagnostics.Trace("searchPreviewButton.OnEnter");

    local buttons = search.SearchPreviewFrame.Buttons;
    for _, button in next, buttons do
        button.SelectedTexture:Hide();
        button.IsSelected = nil;
    end
	search.SearchPreviewFrame.ShowFullSearchResultsButton.SelectedTexture:Hide();
    search.SearchPreviewFrame.ShowFullSearchResultsButton.IsSelected = nil;

    self.SelectedTexture:Show();
    self.IsSelected = true;
end

function OnClick(self)
    diagnostics.Trace("searchPreviewButton.OnClick");

    if self.Achievement then
        KrowiAF_SelectAchievement(self.Achievement, nil, true);
        search.SearchPreviewFrame:Hide();
        search.SearchBoxFrame:ClearFocus();
	end
end

function OnClick_ShowFullSearchResults()
    diagnostics.Trace("searchPreviewButton.OnClick_ShowFullSearchResults");

    search.FullSearchResultsFrame:Update(search.SearchBoxFrame:GetText(), search.SearchBoxFrame.Results);
	if #search.SearchBoxFrame.Results == 0 then
		search.FullSearchResultsFrame:Hide();
		return;
	end
    search.SearchPreviewFrame:Hide();
	search.SearchBoxFrame:ClearFocus();
    search.FullSearchResultsFrame:Show();
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end