-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local search = addon.GUI.Search;
search.SearchPreviewFrame = {};
local searchPreviewFrame = search.SearchPreviewFrame;

-- [[ Constructors ]] --
searchPreviewFrame.__index = searchPreviewFrame; -- Used to inject all the namespace functions to the frame
function searchPreviewFrame:Load()
    diagnostics.Trace("searchPreviewContainer:Load");

	-- Create frame
	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameSearchPreviewContainer", AchievementFrame, "KrowiAF_SearchPreviewsFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrame.searchBox, "BOTTOMLEFT", -4, 3);
	addon.Util.InjectMetatable(frame, searchPreviewFrame); -- Inject all the namespace functions to the frame

    -- Populate the frame with buttons - doing this in code allows us to change the number of buttons later
    frame.Buttons = {};
    local button = CreateFrame("Button", "KrowiAF_AchievementFrameSearchPreview1", frame, "KrowiAF_SearchPreviewButton_Template");
    button:SetPoint("TOPLEFT");
    tinsert(frame.Buttons, button);
    for i = 2, addon.Options.db.SearchBox.NumberOfSearchPreviews do
        button = CreateFrame("Button", "KrowiAF_AchievementFrameSearchPreview" .. i, frame, "KrowiAF_SearchPreviewButton_Template");
        button:SetPoint("TOPLEFT", frame.Buttons[i - 1], "BOTTOMLEFT");
        tinsert(frame.Buttons, button);
    end
    search.SearchPreviewButton.PostLoadButtons(frame.Buttons, frame.ShowFullSearchResultsButton);

    -- Anchor the ShowFullSearchResultsButton to the last SearchPreviewButton
    frame.ShowFullSearchResultsButton:SetPoint("LEFT", frame.Buttons[1]);
    frame.ShowFullSearchResultsButton:SetPoint("RIGHT", frame.Buttons[1]);

    frame:Hide();

	addon.GUI.Search.SearchPreviewFrame = frame;
end

function searchPreviewFrame:GetNumButtons()
    return min(#self.Buttons, addon.Options.db.SearchBox.NumberOfSearchPreviews);
end

function KrowiAF_SearchPreviewsFrame_OnShow(self)
    diagnostics.Trace("KrowiAF_SearchPreviewsFrame_OnShow");
    
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    self.ShowFullSearchResultsButton:SetPoint("TOP", self.Buttons[self:GetNumButtons()], "BOTTOM");
end

function searchPreviewFrame:SelectNext(numResults)
    diagnostics.Trace("searchPreviewContainer:SelectNext");

    numResults = min(numResults, self:GetNumButtons());
    local buttons = self.Buttons;
    for i = 1, numResults, 1 do
        local button = buttons[i - 1];
        if button == nil then
            if self.ShowFullSearchResultsButton:IsShown() then
                button = self.ShowFullSearchResultsButton;
            else
                button = buttons[numResults];
            end
        end
        if button.IsSelected then
            buttons[i]:Enter();
            return;
        end
    end
    if self.ShowFullSearchResultsButton:IsShown() then
        self.ShowFullSearchResultsButton:Enter();
    else
        buttons[1]:Enter();
    end
end

function searchPreviewFrame:SelectPrevious(numResults)
    diagnostics.Trace("searchPreviewContainer:SelectPrevious");

    numResults = min(numResults, self:GetNumButtons());
    local buttons = self.Buttons;
    for i = numResults, 1, -1 do
        local button = buttons[i + 1];
        if button == nil then
            if self.ShowFullSearchResultsButton:IsShown() then
                button = self.ShowFullSearchResultsButton;
            else
                button = buttons[1];
            end
        end
        if button.IsSelected then
            buttons[i]:Enter();
            return;
        end
    end
    if self.ShowFullSearchResultsButton:IsShown() then
        self.ShowFullSearchResultsButton:Enter();
    else
        buttons[numResults]:Enter();
    end
end