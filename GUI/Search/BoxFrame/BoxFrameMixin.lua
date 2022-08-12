-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_SearchBoxFrameMixin = {};

function KrowiAF_SearchBoxFrameMixin:ShowSearchPreviewResults()
	local results = self.Results;
	local numResults = #results;
	local previewFrame = addon.GUI.Search.PreviewFrame;
	if numResults > 0 then
		KrowiAF_SearchPreviewButton_OnEnter(previewFrame.Buttons[1]);
	end
	local buttons = previewFrame.Buttons;
	local numButtons = previewFrame:GetNumButtons();
	local lastButton;
	for i = 1, #buttons do
		if i <= numResults and i <= numButtons then
			local achievementID = results[i].ID;
			local _, name, _, _, _, _, _, _, _, icon, _, _, _, _ = addon.GetAchievementInfo(achievementID);
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