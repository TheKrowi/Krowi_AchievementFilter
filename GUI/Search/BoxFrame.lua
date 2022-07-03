-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.BoxFrame = {};
local boxFrame = search.BoxFrame;

-- [[ Constructors ]] --
boxFrame.__index = boxFrame; -- Used to inject all the namespace functions to the frame
function boxFrame:Load()
	-- Create frame
    local frame = CreateFrame("EditBox", "KrowiAF_AchievementFrameSearchBoxFrame", AchievementFrame, "KrowiAF_AchievementFrameSearchBoxFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrame.searchBox);
    frame:SetPoint("BOTTOMRIGHT", AchievementFrame.searchBox);
    frame:SetMaxLetters(40);
	addon.Util.InjectMetatable(frame, boxFrame); -- Inject all the namespace functions to the frame

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, frame:GetName());

	addon.GUI.Search.BoxFrame = frame;
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnLoad(self)
	SearchBoxTemplate_OnLoad(self);
	self.HasStickyFocus = function()
		local ancestry = search.PreviewFrame;
		return DoesAncestryInclude(ancestry, GetMouseFocus());
    end
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnShow(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(search.PreviewFrame.Buttons[1]);
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnHide(self)
	if not AchievementFrame:IsShown() then
		self:SetText("");
	end
	search.PreviewFrame:Hide();
	search.ResultsFrame:Hide();
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnEnterPressed(self)
	if strlen(self:GetText()) < addon.Options.db.SearchBox.MinimumCharactersToSearch and not string.match(self:GetText():lower(), "^#") then
		return;
	end

	local showFullSearchResultsButton = search.PreviewFrame.ShowFullSearchResultsButton;
	if showFullSearchResultsButton.IsSelected and showFullSearchResultsButton:IsShown() then
		showFullSearchResultsButton:Click();
	else
		local buttons = search.PreviewFrame.Buttons;
		for _, button in next, buttons do
			if button.IsSelected and button:IsShown() then
				button:Click();
			end
		end
	end
end

local function GetSearchResults(text)
	text = text:lower();
	local results = {};

	local numAchievementIds = #addon.Data.AchievementIDs;
	local excludeExcluded = addon.Options.db.SearchBox.ExcludeExcluded;
	local showPlaceholders = addon.Options.db.ShowPlaceholdersFilter and addon.GUI.FilterButton.Filters.db.ShowPlaceholders;

	local achievement;
	if string.match(text, "^#") then
		for i = 1, numAchievementIds do
			achievement = addon.Data.Achievements[addon.Data.AchievementIDs[i]];
			if string.find(tostring(achievement.ID):lower(), string.sub(text, 2):lower(), 1, true) then
				if not (excludeExcluded and achievement.Excluded) then
					if achievement.DoesNotExist == nil or (showPlaceholders and achievement.DoesNotExist) then
						tinsert(results, achievement);
					end
				end
			end
		end
	else
		for i = 1, numAchievementIds do
			achievement = addon.Data.Achievements[addon.Data.AchievementIDs[i]];
			local _, name, _, _, _, _, _, description, _, _, _, _, _, _, _ = GetAchievementInfo(achievement.ID);
			if name and (string.find(name:lower(), text, 1, true) or string.find(description:lower(), text, 1, true)) then
				if not (excludeExcluded and achievement.Excluded) then
					local value = 1;
					if addon.Options.db.SearchBox.OnlySearchFiltered then
						local category;
						if addon.GUI.FilterButton.Filters.db.MergeSmallCategories then
							category = achievement:GetMergedCategory(); -- This way we get the parent category
						else
							category = achievement.Category;
						end
						local filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
						value = addon.GUI.FilterButton.Validate(filters, achievement);
					end
					if value > 0 then
						achievement.Name = name;
						tinsert(results, achievement);
					end
				end
			end
		end
		table.sort(results, function(a, b)
			return a.Name < b.Name;
		end);
	end

    return results;
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnTextChanged(self)
	SearchBoxTemplate_OnTextChanged(self);

	if strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch or string.match(self:GetText():lower(), "^#") then
		self.Results = GetSearchResults(self:GetText());
		self:ShowSearchPreviewResults();
	else
		addon.GUI.Search.PreviewFrame:Hide();
	end
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnFocusLost(self)
	SearchBoxTemplate_OnEditFocusLost(self);
	addon.GUI.Search.PreviewFrame:Hide();
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnFocusGained(self)
	SearchBoxTemplate_OnEditFocusGained(self);
	addon.GUI.Search.ResultsFrame:Hide();

	if self:HasFocus() and strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch then
		self:ShowSearchPreviewResults();
	else
		addon.GUI.Search.PreviewFrame:Hide();
	end
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnKeyDown(self, key)
	local previewFrame = addon.GUI.Search.PreviewFrame;
	if key == "UP" then
		previewFrame:SelectPrevious(#self.Results);
	elseif key == "DOWN" then
		previewFrame:SelectNext(#self.Results);
	end
end

function KrowiAF_AchievementFrameSearchBoxFrame_OnMouseDown(self, button)
	if addon.Options.db.SearchBox.ClearOnRightClick then
		if button == "RightButton" then
			self:SetText("");
			KrowiAF_AchievementFrameSearchBoxFrame_OnTextChanged(self);
		end
	end
end

function boxFrame:ShowSearchPreviewResults()
	local results = self.Results;
	local numResults = #results;
	if numResults > 0 then
		KrowiAF_AchievementFrameSearchPreviewFrameSearchPreviewButton_OnEnter(search.PreviewFrame.Buttons[1]);
	end
	local previewFrame = search.PreviewFrame;
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