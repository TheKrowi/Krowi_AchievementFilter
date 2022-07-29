-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_SearchPreviewButton_OnEnter(self)
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

function KrowiAF_SearchPreviewButton_OnClick(self)
    if self.Achievement then
        KrowiAF_SelectAchievement(self.Achievement);
        local search = addon.GUI.Search;
        search.PreviewFrame:Hide();
        search.BoxFrame:ClearFocus();
	end
end