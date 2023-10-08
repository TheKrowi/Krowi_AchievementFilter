local _, addon = ...;

KrowiAF_SearchBoxFrameMixin = {};

function KrowiAF_SearchBoxFrameMixin:LoadOptionsMenuButton()
	self.OptionsMenuButton = CreateFrame("DropDownToggleButton", "KrowiAF_SearchOptionsMenuButton", self, "KrowiAF_SearchOptionsMenuButton_Template");
	local button = self.OptionsMenuButton;
	button:SetFrameLevel(self:GetFrameLevel() + 7);
	button:SetPoint("LEFT", -6, 0);

    addon.SearchOptions:Load();
end

function KrowiAF_SearchBoxFrameMixin:LoadPreviewContainer()
	self.PreviewContainer = CreateFrame("Frame", "KrowiAF_SearchPreviewContainer", self, "KrowiAF_SearchPreviewContainer_Template");
	local container = self.PreviewContainer;
	container:SetPoint("TOPLEFT", self, "BOTTOMLEFT", -4, 3);

    -- Populate the frame with buttons - doing this in code allows us to change the number of buttons later
    container.Buttons = {};
    for i = 1, addon.Options.db.profile.SearchBox.NumberOfSearchPreviews do
        container.Buttons[i] = CreateFrame("Button", "KrowiAF_SearchPreview" .. i, container, "KrowiAF_SearchPreviewButton_Template");
		if i == 1 then
    		container.Buttons[i]:SetPoint("TOPLEFT");
		else
        	container.Buttons[i]:SetPoint("TOPLEFT", container.Buttons[i - 1], "BOTTOMLEFT");
		end
    end

    local numButtons = #container.Buttons;
    local showFullSearchResultsButton = container.ShowFullSearchResultsButton;
    showFullSearchResultsButton:SetPoint("LEFT", container.Buttons[numButtons]);
    showFullSearchResultsButton:SetPoint("RIGHT", container.Buttons[numButtons]);

	self.HasStickyFocus = function()
		return DoesAncestryInclude(container, GetMouseFocus());
    end
end

function KrowiAF_SearchBoxFrameMixin:LoadResultsFrame()
    self.ResultsFrame = CreateFrame("Frame", "KrowiAF_SearchResultsFrame", AchievementFrame, "KrowiAF_SearchResultsFrame_Template");
	local frame = self.ResultsFrame;
	frame:SetPoint("TOP", 0, -112);
	frame:SetPoint("BOTTOM", 0, 7);
end

function KrowiAF_SearchBoxFrameMixin:OnLoad()
	SearchBoxTemplate_OnLoad(self);
	self.searchIcon:Hide();

	self:LoadOptionsMenuButton();
	self:LoadPreviewContainer();
	self:LoadResultsFrame();
end

function KrowiAF_SearchBoxFrameMixin:ShowSearchPreviewResults()
	local results = self.Results;
	local numResults = #results;
	local previewFrame = self.PreviewContainer;
	if numResults > 0 then
		previewFrame.Buttons[1]:Highlight();
	end
	local buttons = previewFrame.Buttons;
	local numButtons = previewFrame:GetNumButtons();
	local lastButton;
	for i = 1, #buttons do
		if i <= numResults and i <= numButtons then
			local achievementId = results[i].Id;
			local _, name, _, _, _, _, _, _, _, icon, _, _, _, _ = addon.GetAchievementInfo(achievementId);
			buttons[i].Name:SetText(name);
			buttons[i].Icon:SetTexture(icon);
			buttons[i].Achievement = results[i];
			buttons[i]:Show();
			lastButton = buttons[i];
		else
			buttons[i].AchievementID = nil;
			buttons[i]:Hide();
		end
	end
	local showFullSearchResultsButton = previewFrame.ShowFullSearchResultsButton;
	if numResults > numButtons then
		showFullSearchResultsButton:Show();
		lastButton = showFullSearchResultsButton;
		showFullSearchResultsButton.Text:SetText(string.format(ENCOUNTER_JOURNAL_SHOW_SEARCH_RESULTS, numResults));
	else
		showFullSearchResultsButton:Hide();
	end
	if lastButton then
		previewFrame.BorderAnchor:SetPoint("BOTTOM", lastButton, "BOTTOM", 0, -8);
		previewFrame.Background:Hide();
		previewFrame:Show();
	else
		previewFrame:Hide();
	end
end