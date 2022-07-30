-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.PreviewFrame = {};
local previewFrame = search.PreviewFrame;

function previewFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_SearchPreviewContainer", AchievementFrame, "KrowiAF_SearchPreviewFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrame.searchBox, "BOTTOMLEFT", -4, 3);

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

function KrowiAF_ShowFullSearchResultsButton_OnClick(self)
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

function KrowiAF_AchievementFrameSearchPreviewFrame_OnShow(self)
    self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
    self.ShowFullSearchResultsButton:SetPoint("TOP", self.Buttons[self:GetNumButtons()], "BOTTOM");
end