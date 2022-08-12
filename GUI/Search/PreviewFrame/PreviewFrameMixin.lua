-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_SearchPreviewFrameMixin = {};

function KrowiAF_SearchPreviewFrameMixin:GetNumButtons()
    return min(#self.Buttons, addon.Options.db.SearchBox.NumberOfSearchPreviews);
end

function KrowiAF_SearchPreviewFrameMixin:SelectNext(numResults)
    numResults = min(numResults, self:GetNumButtons());
    local showFullSearchResultsButton = self.ShowFullSearchResultsButton;
    local buttons = self.Buttons;
    for i = 1, numResults do
        local button = buttons[i - 1];
        if button == nil then
            if showFullSearchResultsButton:IsShown() then
                button = showFullSearchResultsButton;
            else
                button = buttons[numResults];
            end
        end
        if button.IsSelected then
            KrowiAF_SearchPreviewButton_OnEnter(buttons[i]);
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        KrowiAF_SearchPreviewButton_OnEnter(showFullSearchResultsButton);
    else
        KrowiAF_SearchPreviewButton_OnEnter(buttons[1]);
    end
end

function KrowiAF_SearchPreviewFrameMixin:SelectPrevious(numResults)
    numResults = min(numResults, self:GetNumButtons());
    local showFullSearchResultsButton = self.ShowFullSearchResultsButton;
    local buttons = self.Buttons;
    for i = numResults, 1, -1 do
        local button = buttons[i + 1];
        if button == nil then
            if showFullSearchResultsButton:IsShown() then
                button = showFullSearchResultsButton;
            else
                button = buttons[1];
            end
        end
        if button.IsSelected then
            KrowiAF_SearchPreviewButton_OnEnter(buttons[i]);
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        KrowiAF_SearchPreviewButton_OnEnter(showFullSearchResultsButton);
    else
        KrowiAF_SearchPreviewButton_OnEnter(buttons[numResults]);
    end
end