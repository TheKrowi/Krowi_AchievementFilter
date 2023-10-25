local _, addon = ...;

KrowiAF_SearchBoxFrameMixin = {};

local function LoadOptionsMenuButton(self)
	self.OptionsMenuButton = CreateFrame("DropDownToggleButton", "KrowiAF_SearchOptionsMenuButton", self, "KrowiAF_SearchOptionsMenuButton_Template");
	local button = self.OptionsMenuButton;
	button:SetFrameLevel(self:GetFrameLevel() + 7);
	button:SetPoint("LEFT", -6, 0);

    addon.SearchOptions:Load();
end

local function LoadPreviewContainer(self)
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

local function LoadResultsFrame(self)
    self.ResultsFrame = CreateFrame("Frame", "KrowiAF_SearchResultsFrame", AchievementFrame, "KrowiAF_SearchResultsFrame_Template");
	local frame = self.ResultsFrame;
	frame:SetPoint("TOP", 0, -112);
	frame:SetPoint("BOTTOM", 0, 7);
end

function KrowiAF_SearchBoxFrameMixin:OnLoad()
	SearchBoxTemplate_OnLoad(self);
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	self.searchIcon:Hide();

	LoadOptionsMenuButton(self);
	LoadPreviewContainer(self);
	LoadResultsFrame(self);
end

function KrowiAF_SearchBoxFrameMixin:OnShow()
	AchievementFrame.Header.RightDDLInset:Show();
	if not addon.Util.IsWrathClassic then
		AchievementFrame.SearchBox:Hide();
	end
	self.OptionsMenuButton:Show();
end

function KrowiAF_SearchBoxFrameMixin:OnHide()
	if addon.Util.IsWrathClassic and not AchievementFrameFilterDropDown:IsShown() then
		AchievementFrame.Header.RightDDLInset:Hide();
	end
	if not addon.Util.IsWrathClassic then
		AchievementFrame.SearchBox:Show();
		AchievementFrame.Header.RightDDLInset:Show();
	end
	if not AchievementFrame:IsShown() then
		self:SetText("");
	end
	self.PreviewContainer:Hide();
	self.ResultsFrame:Hide();
	self.OptionsMenuButton:Hide();
end

function KrowiAF_SearchBoxFrameMixin:OnEnterPressed()
	if strlen(self:GetText()) < addon.Options.db.profile.SearchBox.MinimumCharactersToSearch and not string.match(self:GetText():lower(), "^#") then
		return;
	end

	local showFullSearchResultsButton = self.PreviewContainer.ShowFullSearchResultsButton;
	if showFullSearchResultsButton.IsSelected and showFullSearchResultsButton:IsShown() then
		showFullSearchResultsButton:Click();
	else
		local buttons = self.PreviewContainer.Buttons;
		for _, button in next, buttons do
			if button.IsSelected and button:IsShown() then
				button:Click();
			end
		end
	end
end

local function SearchAchievement(text, achievement, results, excludeExcluded)
	local id, name, _, _, _, _, _, description, _, _, rewardText, _, _, _, _ = GetAchievementInfo(achievement.Id);
	if not id then
		return;
	end
	if (addon.SearchOptions.db.profile.SearchIds and string.find(tostring(id), text, 1, true))
			or (addon.SearchOptions.db.profile.SearchNames and string.find(name:lower(), text, 1, true))
			or (addon.SearchOptions.db.profile.SearchDescriptions and string.find(description:lower(), text, 1, true))
			or (addon.SearchOptions.db.profile.SearchRewards and string.find(rewardText:lower(), text, 1, true)) then
		if not (excludeExcluded and achievement.Excluded) then
			local value = 1;
			if addon.Options.db.profile.SearchBox.OnlySearchFiltered then
				local category;
				if addon.Filters.db.profile.MergeSmallCategories then
					category = achievement:GetMergedCategory(); -- This way we get the parent category
				else
					category = achievement.Category;
				end
				local filters = addon.Tabs[category:GetTree()[1].TabName].Filters;
				value = addon.Filters.Validate(filters, achievement);
			end
			if value > 0 then
				achievement.Name = name;
				tinsert(results, achievement);
			end
		end
	end
end

local function SearchAchievements(text, numAchievementIds, results, excludeExcluded)
	local achievement;
	for i = 1, numAchievementIds do
		achievement = addon.Data.Achievements[addon.Data.AchievementIds[i]];
		if achievement then
			SearchAchievement(text, achievement, results, excludeExcluded);
		end
	end
	return results;
end

local function SearchAchievementIds(text, numAchievementIds, results, excludeExcluded, showPlaceholders)
	local achievement;
	for i = 1, numAchievementIds do
		achievement = addon.Data.Achievements[addon.Data.AchievementIds[i]];
		if string.find(tostring(achievement.Id):lower(), string.sub(text, 2), 1, true) then
			if not (excludeExcluded and achievement.Excluded) then
				if achievement.DoesNotExist == nil or (showPlaceholders and achievement.DoesNotExist) then
					tinsert(results, achievement);
				end
			end
		end
	end
	return results;
end

local function DistinctTable(tbl)
	local hash = {}
	for _,v in ipairs(tbl) do
		hash[v] = true
	end

	local res = {}
	for k,_ in pairs(hash) do
		res[#res+1] = k
	end
	return res;
end

local criteriaCache;
local function SearchCriteria(text, numAchievementIds, results, excludeExcluded)
	local achievement;
	if criteriaCache == nil then
		criteriaCache = {};
		local numCriteria, criteriaString;
		for i = 1, numAchievementIds do
			achievement = addon.Data.Achievements[addon.Data.AchievementIds[i]];
			numCriteria = GetAchievementNumCriteria(achievement.Id);
			for j = 1, numCriteria do -- Build the cache the first time to limit API requests
				criteriaString = addon.GetAchievementCriteriaInfo(achievement.Id, j);
				tinsert(criteriaCache, {Achievement = achievement, CriteriaString = criteriaString});
			end
		end
	end

	local criteriaString;
	for _, criteria in next, criteriaCache do
		achievement, criteriaString = criteria.Achievement, criteria.CriteriaString;
		if string.find(criteriaString:lower(), string.sub(text, 2), 1, true) then
			if not (excludeExcluded and achievement.Excluded) then
				tinsert(results, achievement);
			end
		end
	end
	return DistinctTable(results);
end

local function GetSearchResults(text)
	text = text:lower();
	local results = {};

	local numAchievementIds = #addon.Data.AchievementIds;
	local excludeExcluded = addon.Options.db.profile.SearchBox.ExcludeExcluded;
	local showPlaceholders = addon.Options.db.profile.ShowPlaceholdersFilter and addon.Filters.db.profile.ShowPlaceholders;

	if string.match(text, "^#") then
		results = SearchAchievementIds(text, numAchievementIds, results, excludeExcluded, showPlaceholders);
	elseif string.match(text, "^@") then
		results = SearchCriteria(text, numAchievementIds, results, excludeExcluded);
	else
		results = SearchAchievements(text, numAchievementIds, results, excludeExcluded);
		if addon.SearchOptions.db.profile.SearchCriteria then
			results = SearchCriteria(text, numAchievementIds, results, excludeExcluded);
		else
			table.sort(results, function(a, b)
				return a.Name < b.Name;
			end);
		end
	end

    return results;
end

local function ShowSearchPreviewResults(self)
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

function KrowiAF_SearchBoxFrameMixin:OnTextChanged()
	SearchBoxTemplate_OnTextChanged(self);

	if strlen(self:GetText()) >= addon.Options.db.profile.SearchBox.MinimumCharactersToSearch or string.match(self:GetText():lower(), "^#") then
		self.Results = GetSearchResults(self:GetText());
		ShowSearchPreviewResults(self);
	else
		self.PreviewContainer:Hide();
	end
end

function KrowiAF_SearchBoxFrameMixin:Focus()
	SearchBoxTemplate_OnEditFocusGained(self);
	self.ResultsFrame:Hide();

	if self:HasFocus() and strlen(self:GetText()) >= addon.Options.db.profile.SearchBox.MinimumCharactersToSearch then
		if addon.SearchOptions.Changed then
			self.Results = GetSearchResults(self:GetText());
		end
		ShowSearchPreviewResults(self);
	else
		self.PreviewContainer:Hide();
	end
end

function KrowiAF_SearchBoxFrameMixin:OnEditFocusGained()
	self:Focus();
end

function KrowiAF_SearchBoxFrameMixin:OnEditFocusLost()
	SearchBoxTemplate_OnEditFocusLost(self);
	self.PreviewContainer:Hide();
end

function KrowiAF_SearchBoxFrameMixin:OnKeyDown(key)
	local previewFrame = self.PreviewContainer;
	if key == "UP" then
		previewFrame:SelectPrevious(#self.Results);
	elseif key == "DOWN" then
		previewFrame:SelectNext(#self.Results);
	end
end

function KrowiAF_SearchBoxFrameMixin:OnMouseDown(button)
	if addon.Options.db.profile.SearchBox.ClearOnRightClick then
		if button == "RightButton" then
			self:SetText("");
		end
	end
end