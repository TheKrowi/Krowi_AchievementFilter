-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.PreviewFrame = {};
local previewFrame = search.PreviewFrame;

-- [[ Constructors ]] --
previewFrame.__index = previewFrame; -- Used to inject all the namespace functions to the frame
function previewFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameSearchPreviewContainer", AchievementFrame, "KrowiAF_AchievementFrameSearchPreviewFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrame.searchBox, "BOTTOMLEFT", -4, 3);
	addon.Util.InjectMetatable(frame, previewFrame); -- Inject all the namespace functions to the frame

    -- Populate the frame with buttons - doing this in code allows us to change the number of buttons later
    frame.Buttons = {};
    local button = CreateFrame("Button", "KrowiAF_AchievementFrameSearchPreview1", frame, "KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_Template");
    button:SetPoint("TOPLEFT");
    tinsert(frame.Buttons, button);
    for i = 2, addon.Options.db.SearchBox.NumberOfSearchPreviews do
        button = CreateFrame("Button", "KrowiAF_AchievementFrameSearchPreview" .. i, frame, "KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_Template");
        button:SetPoint("TOPLEFT", frame.Buttons[i - 1], "BOTTOMLEFT");
        tinsert(frame.Buttons, button);
    end

    local numButtons = #frame.Buttons;
    local showFullSearchResultsButton = frame.ShowFullSearchResultsButton;
    showFullSearchResultsButton:SetPoint("LEFT", frame.Buttons[numButtons]);
    showFullSearchResultsButton:SetPoint("RIGHT", frame.Buttons[numButtons]);

	addon.GUI.Search.PreviewFrame = frame;
end

function KrowiAF_AchievementFrameSearchPreviewFrame_OnShow(self)
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    self.ShowFullSearchResultsButton:SetPoint("TOP", self.Buttons[self:GetNumButtons()], "BOTTOM");
end

function previewFrame:GetNumButtons()
    return min(#self.Buttons, addon.Options.db.SearchBox.NumberOfSearchPreviews);
end

function previewFrame:SelectNext(numResults)
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
            KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(buttons[i]);
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(showFullSearchResultsButton);
    else
        KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(buttons[1]);
    end
end

function previewFrame:SelectPrevious(numResults)
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
            KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(buttons[i]);
            return;
        end
    end
    if showFullSearchResultsButton:IsShown() then
        KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(showFullSearchResultsButton);
    else
        KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(buttons[numResults]);
    end
end