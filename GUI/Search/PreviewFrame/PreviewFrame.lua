-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.PreviewFrame = {};
local previewFrame = search.PreviewFrame;

function previewFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_SearchPreviewContainer", AchievementFrame, "KrowiAF_SearchPreviewFrame_Template");
	frame:SetPoint("TOPLEFT", search.BoxFrame, "BOTTOMLEFT", -4, 3);

    -- Populate the frame with buttons - doing this in code allows us to change the number of buttons later
    frame.Buttons = {};
    local button = CreateFrame("Button", "KrowiAF_SearchPreview1", frame, "KrowiAF_SearchPreviewButton_Template");
    button:SetPoint("TOPLEFT");
    tinsert(frame.Buttons, button);
    for i = 2, addon.Options.db.SearchBox.NumberOfSearchPreviews do
        button = CreateFrame("Button", "KrowiAF_SearchPreview" .. i, frame, "KrowiAF_SearchPreviewButton_Template");
        button:SetPoint("TOPLEFT", frame.Buttons[i - 1], "BOTTOMLEFT");
        tinsert(frame.Buttons, button);
    end

    local numButtons = #frame.Buttons;
    local showFullSearchResultsButton = frame.ShowFullSearchResultsButton;
    showFullSearchResultsButton:SetPoint("LEFT", frame.Buttons[numButtons]);
    showFullSearchResultsButton:SetPoint("RIGHT", frame.Buttons[numButtons]);

	addon.GUI.Search.PreviewFrame = frame;
end

local function ShowSearchResultsAsCategory(query, results)
    for i = 1, #addon.Data.SearchResultsCategories do
        addon.Data.SearchResultsCategories[i].Achievements = addon.Options.db.AdjustableCategories.SearchResults[i] and results or nil;
        addon.Data.SearchResultsCategories[i].Name = addon.L["Search Results"] .. " (" .. query .. ")";
    end
    for i = 1, #addon.Data.SearchResultsCategories do
        if addon.Options.db.AdjustableCategories.SearchResults[i] then
            KrowiAF_SelectCategory(addon.Data.SearchResultsCategories[i]);
            return;
        end
    end
end

local function ShowSearchResultsAsFrame(query, results)
    local resultsFrame = search.ResultsFrame;
    resultsFrame:Update(query, results);
    if #results == 0 then
        resultsFrame:Hide();
        return;
    end
    resultsFrame:Show();
end

function KrowiAF_ShowFullSearchResultsButton_OnClick(self)
    local search = addon.GUI.Search;
    local boxFrame = search.BoxFrame;
    local results = boxFrame.Results;

    if addon.Options.db.SearchBox.ShowAllResultsInCategory then
        ShowSearchResultsAsCategory(boxFrame:GetText(), results);
    else
        ShowSearchResultsAsFrame(boxFrame:GetText(), results);
    end

    PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
    boxFrame:ClearFocus();
    search.PreviewFrame:Hide();
end

function KrowiAF_AchievementFrameSearchPreviewFrame_OnShow(self)
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    self.ShowFullSearchResultsButton:SetPoint("TOP", self.Buttons[self:GetNumButtons()], "BOTTOM");
end