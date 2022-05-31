-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local search = addon.GUI.Search;
search.SearchBoxFrame = {};
local searchBoxFrame = search.SearchBoxFrame;

-- [[ Constructors ]] --
searchBoxFrame.__index = searchBoxFrame; -- Used to inject all the namespace functions to the frame
function searchBoxFrame:Load()
    diagnostics.Trace("searchBoxFrame:Load");

	-- Create frame
    local frame = CreateFrame("EditBox", "KrowiAF_AchievementFrameSearchBox", AchievementFrame, "SearchBoxTemplate");
	frame:SetPoint("TOPLEFT", AchievementFrame.searchBox);
    frame:SetPoint("BOTTOMRIGHT", AchievementFrame.searchBox);
    frame:SetMaxLetters(40);
	addon.Util.InjectMetatable(frame, searchBoxFrame); -- Inject all the namespace functions to the frame

	-- Rest
    frame:SetScript("OnShow", frame.OnShow);
    frame:SetScript("OnHide", frame.OnHide);
    frame:SetScript("OnEnterPressed", frame.OnEnterPressed);
    frame:SetScript("OnTextChanged", frame.OnTextChanged);
    frame:SetScript("OnEditFocusLost", frame.OnEditFocusLost);
    frame:SetScript("OnEditFocusGained", frame.OnEditFocusGained);
    frame:SetScript("OnKeyDown", frame.OnKeyDown);
	frame:SetScript("OnMouseDown", frame.OnMouseDown);

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, frame:GetName());
    frame:Hide();

	SearchBoxTemplate_OnLoad(frame);
	frame.HasStickyFocus = function()
		local ancestry = search.SearchPreviewFrame;
		return DoesAncestryInclude(ancestry, GetMouseFocus());
    end

	addon.GUI.Search.SearchBoxFrame = frame;
end

function searchBoxFrame:OnShow()
	diagnostics.Trace("searchBoxFrame:OnShow");

	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	search.SearchPreviewFrame.Buttons[1]:Enter();
end

function searchBoxFrame:OnHide()
	diagnostics.Trace("searchBoxFrame:OnHide");

	if not AchievementFrame:IsShown() then
		self:SetText("");
	end
	search.SearchPreviewFrame:Hide();
	search.FullSearchResultsFrame:Hide();
end

function searchBoxFrame:OnEnterPressed()
    diagnostics.Trace("searchBox:OnEnterPressed");

	if strlen(self:GetText()) < addon.Options.db.SearchBox.MinimumCharactersToSearch then
		return;
	end

	local searchPreviewFrame = search.SearchPreviewFrame;
	if searchPreviewFrame.ShowFullSearchResultsButton.IsSelected and searchPreviewFrame.ShowFullSearchResultsButton:IsShown() then
		searchPreviewFrame.ShowFullSearchResultsButton:Click();
	else
		local buttons = search.SearchPreviewFrame.Buttons;
		for _, button in next, buttons do
			if button.IsSelected and button:IsShown() then
				button:Click();
			end
		end
	end
end

local function GetSearchResults(text)
    diagnostics.Trace("GetSearchResults");

	text = text:lower();
	local results = {};

	if string.match(text, "^#") then
		for i = 1, #addon.Data.AchievementIDs do
			if string.find(tostring(addon.Data.Achievements[addon.Data.AchievementIDs[i]].ID):lower(), string.sub(text, 2):lower(), 1, true) then
				if not (addon.Options.db.SearchBox.ExcludeExcluded and addon.Data.Achievements[addon.Data.AchievementIDs[i]].Excluded) then
					if addon.Data.Achievements[addon.Data.AchievementIDs[i]].DoesNotExist == nil or (addon.Options.db.ShowPlaceholdersFilter and addon.GUI.FilterButton.Filters.db.ShowPlaceholders and addon.Data.Achievements[addon.Data.AchievementIDs[i]].DoesNotExist) then
						tinsert(results, addon.Data.Achievements[addon.Data.AchievementIDs[i]]);
					end
				end
			end
		end
	else
		for i = 1, #addon.Data.AchievementIDs do
			local achievementID = addon.Data.Achievements[addon.Data.AchievementIDs[i]].ID;
			local _, name, _, _, _, _, _, description, _, _, _, _, _, _, _ = GetAchievementInfo(achievementID);
			if name and (string.find(name:lower(), text, 1, true) or string.find(description:lower(), text, 1, true)) then
				if not (addon.Options.db.SearchBox.ExcludeExcluded and addon.Data.Achievements[addon.Data.AchievementIDs[i]].Excluded) then
					local value = 1;
					if addon.Options.db.SearchBox.OnlySearchFiltered then
						local category;
						if addon.GUI.FilterButton.Filters.db.MergeSmallCategories then
							category = addon.Data.Achievements[addon.Data.AchievementIDs[i]]:GetMergedCategory(); -- This way we get the parent category
						else
							category = addon.Data.Achievements[addon.Data.AchievementIDs[i]].Category;
						end
						local filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
						value = addon.GUI.FilterButton.Validate(filters, addon.Data.Achievements[addon.Data.AchievementIDs[i]]);
					end
					if value > 0 then
						addon.Data.Achievements[addon.Data.AchievementIDs[i]].Name = name;
						tinsert(results, addon.Data.Achievements[addon.Data.AchievementIDs[i]]);
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

function searchBoxFrame:OnTextChanged()
    diagnostics.Trace("searchBox:OnTextChanged");

	SearchBoxTemplate_OnTextChanged(self);

	if strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch or string.match(self:GetText():lower(), "^#") then
		self.Results = GetSearchResults(self:GetText());
		self:ShowSearchPreviewResults();
	else
		search.SearchPreviewFrame:Hide();
	end
end

function searchBoxFrame:OnEditFocusLost()
	diagnostics.Trace("searchBoxFrame:OnEditFocusLost");

	SearchBoxTemplate_OnEditFocusLost(self);
	search.SearchPreviewFrame:Hide();
end

function searchBoxFrame:OnEditFocusGained()
	diagnostics.Trace("searchBoxFrame:OnEditFocusGained");

	SearchBoxTemplate_OnEditFocusGained(self);
	search.FullSearchResultsFrame:Hide();

	if self:HasFocus() and strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch then
		self:ShowSearchPreviewResults();
	else
		search.SearchPreviewFrame:Hide();
	end
end

function searchBoxFrame:OnKeyDown(key)
	diagnostics.Trace("searchBoxFrame:OnKeyDown");

	if key == "UP" then
		search.SearchPreviewFrame:SelectPrevious(#self.Results);
	elseif key == "DOWN" then
		search.SearchPreviewFrame:SelectNext(#self.Results);
	end
end

function searchBoxFrame:OnMouseDown(button)
	diagnostics.Trace("searchBoxFrame:OnMouseDown");

	if addon.Options.db.SearchBox.ClearOnRightClick then
		if button == "RightButton" then
			self:SetText("");
			self:OnTextChanged();
		end
	end
end

function searchBoxFrame:ShowSearchPreviewResults()
    diagnostics.Trace("searchBoxFrame:ShowSearchPreviewResults");

	local results = self.Results;
	local numResults = #results;
	if numResults > 0 then
		search.SearchPreviewFrame.Buttons[1]:Enter();
	end
	local searchPreviewContainer = search.SearchPreviewFrame;
	local buttons = searchPreviewContainer.Buttons;
	local numButtons = searchPreviewContainer:GetNumButtons();
	local lastButton;
	for i = 1, #buttons do
		if i <= numResults and i <= numButtons then
			local achievementID = results[i].ID;
			local _, name, _, _, _, _, _, _, _, icon, _, _, _, _ = addon.GetAchievementInfo(achievementID);
			buttons[i].Name:SetText(name);
			buttons[i].Icon:SetTexture(icon);
			-- buttons[i].AchievementID = achievementID;
			buttons[i].Achievement = results[i];
			buttons[i]:Show();
			lastButton = buttons[i];
		else
			buttons[i].AchievementID = nil;
			buttons[i]:Hide();
		end
	end
	if numResults > numButtons then
		searchPreviewContainer.ShowFullSearchResultsButton:Show();
		lastButton = searchPreviewContainer.ShowFullSearchResultsButton;
		searchPreviewContainer.ShowFullSearchResultsButton.Text:SetText(string.format(ENCOUNTER_JOURNAL_SHOW_SEARCH_RESULTS, numResults));
	else
		searchPreviewContainer.ShowFullSearchResultsButton:Hide();
	end
	if lastButton then
		searchPreviewContainer.BorderAnchor:SetPoint("BOTTOM", lastButton, "BOTTOM", 0, -8);
		searchPreviewContainer.Background:Hide();
		searchPreviewContainer:Show();
	else
		searchPreviewContainer:Hide();
	end
end