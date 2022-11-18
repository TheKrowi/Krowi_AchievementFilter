-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.BoxFrame = {};
local boxFrame = search.BoxFrame;

function boxFrame:Load()
	-- Create frame
    local frame = CreateFrame("EditBox", "KrowiAF_SearchBoxFrame", AchievementFrame, "KrowiAF_SearchBoxFrame_Template");
	if addon.IsWrathClassic then
		frame:SetSize(107, 30);
		frame:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2);
	else
		frame:SetPoint("TOPLEFT", AchievementFrame.SearchBox);
		frame:SetPoint("BOTTOMRIGHT", AchievementFrame.SearchBox);
		-- frame:SetPoint("BOTTOMRIGHT", addon.GUI.Search.OptionsMenuButton, "BOTTOMLEFT");
	end

    frame:SetMaxLetters(40);

	tinsert(addon.GUI.SubFrames, frame);

	addon.GUI.Search.BoxFrame = frame;
end

function KrowiAF_SearchBoxFrame_OnLoad(self)
	SearchBoxTemplate_OnLoad(self);
	self.HasStickyFocus = function()
		local ancestry = search.PreviewFrame;
		return DoesAncestryInclude(ancestry, GetMouseFocus());
    end
	self.searchIcon:Hide();
end

function KrowiAF_SearchBoxFrame_OnShow(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	KrowiAF_SearchPreviewButton_OnEnter(search.PreviewFrame.Buttons[1]);
	if addon.IsWrathClassic then
		AchievementFrame.Header.RightDDLInset:Show();
	end
	addon.GUI.Search.OptionsMenuButton:Show();
end

function KrowiAF_SearchBoxFrame_OnHide(self)
	if not AchievementFrame:IsShown() then
		self:SetText("");
	end
	search.PreviewFrame:Hide();
	search.ResultsFrame:Hide();
	if addon.IsWrathClassic and not AchievementFrameFilterDropDown:IsShown() then
		AchievementFrame.Header.RightDDLInset:Hide();
	end
	addon.GUI.Search.OptionsMenuButton:Hide();
end

function KrowiAF_SearchBoxFrame_OnEnterPressed(self)
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

	local numAchievementIds = #addon.Data.AchievementIds;
	local excludeExcluded = addon.Options.db.SearchBox.ExcludeExcluded;
	local showPlaceholders = addon.Options.db.ShowPlaceholdersFilter and addon.Filters.db.ShowPlaceholders;

	local achievement;
	if string.match(text, "^#") then
		for i = 1, numAchievementIds do
			achievement = addon.Data.Achievements[addon.Data.AchievementIds[i]];
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
			achievement = addon.Data.Achievements[addon.Data.AchievementIds[i]];
			local id, name, _, _, _, _, _, description, _, _, rewardText, _, _, _, _ = GetAchievementInfo(achievement.Id);
			if id then
				if (addon.SearchOptions.db.SearchIds and string.find(tostring(id), text, 1, true))
				or (addon.SearchOptions.db.SearchNames and string.find(name:lower(), text, 1, true))
				or (addon.SearchOptions.db.SearchDescriptions and string.find(description:lower(), text, 1, true))
				or (addon.SearchOptions.db.SearchRewards and string.find(rewardText:lower(), text, 1, true)) then
					if not (excludeExcluded and achievement.Excluded) then
						local value = 1;
						if addon.Options.db.SearchBox.OnlySearchFiltered then
							local category;
							if addon.Filters.db.MergeSmallCategories then
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
		end
		table.sort(results, function(a, b)
			return a.Name < b.Name;
		end);
	end

    return results;
end

function KrowiAF_SearchBoxFrame_OnTextChanged(self)
	SearchBoxTemplate_OnTextChanged(self);

	if strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch or string.match(self:GetText():lower(), "^#") then
		self.Results = GetSearchResults(self:GetText());
		self:ShowSearchPreviewResults();
	else
		addon.GUI.Search.PreviewFrame:Hide();
	end
end

function KrowiAF_SearchBoxFrame_OnFocusLost(self)
	SearchBoxTemplate_OnEditFocusLost(self);
	addon.GUI.Search.PreviewFrame:Hide();
end

function KrowiAF_SearchBoxFrame_OnFocusGained(self)
	SearchBoxTemplate_OnEditFocusGained(self);
	addon.GUI.Search.ResultsFrame:Hide();

	if self:HasFocus() and strlen(self:GetText()) >= addon.Options.db.SearchBox.MinimumCharactersToSearch then
		if addon.SearchOptions.Changed then
			self.Results = GetSearchResults(self:GetText());
		end
		self:ShowSearchPreviewResults();
	else
		addon.GUI.Search.PreviewFrame:Hide();
	end
end

function KrowiAF_SearchBoxFrame_OnKeyDown(self, key)
	local previewFrame = addon.GUI.Search.PreviewFrame;
	if key == "UP" then
		previewFrame:SelectPrevious(#self.Results);
	elseif key == "DOWN" then
		previewFrame:SelectNext(#self.Results);
	end
end

function KrowiAF_SearchBoxFrame_OnMouseDown(self, button)
	if addon.Options.db.SearchBox.ClearOnRightClick then
		if button == "RightButton" then
			self:SetText("");
			KrowiAF_SearchBoxFrame_OnTextChanged(self);
		end
	end
end