-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(self)
    local previewFrame = addon.GUI.Search.PreviewFrame;
    local buttons = previewFrame.Buttons;
    for _, button in next, buttons do
        button.SelectedTexture:Hide();
        button.IsSelected = nil;
    end
    local showFullSearchResultsButton = previewFrame.ShowFullSearchResultsButton;
	showFullSearchResultsButton.SelectedTexture:Hide();
    showFullSearchResultsButton.IsSelected = nil;

    self.SelectedTexture:Show();
    self.IsSelected = true;
end

function KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnClick(self)
    if self.Achievement then
        KrowiAF_SelectAchievement(self.Achievement);
        local search = addon.GUI.Search;
        search.PreviewFrame:Hide();
        search.BoxFrame:ClearFocus();
	end
end

function KrowiAF_AchievementFrameSearchPreviewFrameShowFullSearchResultsButton_OnClick(self)
    local search = addon.GUI.Search;
    local boxFrame = search.BoxFrame;
    local resultsFrame = search.ResultsFrame;
    local results = boxFrame.Results;

    resultsFrame:Update(boxFrame:GetText(), results);
	if #results == 0 then
		resultsFrame:Hide();
		return;
	end
    search.PreviewFrame:Hide();
	boxFrame:ClearFocus();
    resultsFrame:Show();
    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end