local _, addon = ...;

KrowiAF_SearchPreviewContainerShowFullSearchResultsButtonMixin = CreateFromMixins(KrowiAF_SearchPreviewButtonMixin);

local function ShowSearchResultsAsCategory(query, results)
    for i = 1, #addon.Data.SearchResultsCategories do
        addon.Data.SearchResultsCategories[i].Achievements = addon.Options.db.profile.AdjustableCategories.SearchResults[i] and results or nil;
        addon.Data.SearchResultsCategories[i].Name = addon.L["Search Results"] .. " (" .. query .. ")";
    end
    for i = 1, #addon.Data.SearchResultsCategories do
        if addon.Options.db.profile.AdjustableCategories.SearchResults[i] then
            KrowiAF_SelectCategory(addon.Data.SearchResultsCategories[i]);
            return;
        end
    end
end

local function ShowSearchResultsAsFrame(query, results)
    KrowiAF_SearchResultsFrame:Update(query, results);
    if #results == 0 then
        KrowiAF_SearchResultsFrame:Hide();
        return;
    end
    KrowiAF_SearchResultsFrame:Show();
end

function KrowiAF_SearchPreviewContainerShowFullSearchResultsButtonMixin:OnClick()
    local results = KrowiAF_SearchBoxFrame.Results;

    if addon.Options.db.profile.SearchBox.ShowAllResultsInCategory then
        ShowSearchResultsAsCategory(KrowiAF_SearchBoxFrame:GetText(), results);
    else
        ShowSearchResultsAsFrame(KrowiAF_SearchBoxFrame:GetText(), results);
    end

    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
    KrowiAF_SearchBoxFrame:ClearFocus();
    self:GetParent():Hide();
end

KrowiAF_SearchPreviewContainerMixin = {};

function KrowiAF_SearchPreviewContainerMixin:OnShow()
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    self.ShowFullSearchResultsButton:SetPoint("TOP", self.Buttons[self:GetNumButtons()], "BOTTOM");
end

function KrowiAF_SearchPreviewContainerMixin:GetNumButtons()
    return min(#self.Buttons, addon.Options.db.profile.SearchBox.NumberOfSearchPreviews);
end

function KrowiAF_SearchPreviewContainerMixin:SelectNext(numResults)
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
            buttons[i]:Highlight();
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        showFullSearchResultsButton:Highlight();
    else
        buttons[1]:Highlight();
    end
end

function KrowiAF_SearchPreviewContainerMixin:SelectPrevious(numResults)
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
            buttons[i]:Highlight();
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        showFullSearchResultsButton:Highlight();
    else
        buttons[numResults]:Highlight();
    end
end