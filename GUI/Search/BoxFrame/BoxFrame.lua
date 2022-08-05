-- [[ Namespaces ]] --
local _, addon = ...;
local search = addon.GUI.Search;
search.BoxFrame = {};
local boxFrame = search.BoxFrame;

function boxFrame:Load()
	-- Create frame
    local frame = CreateFrame("EditBox", "KrowiAF_SearchBoxFrame", AchievementFrame, "KrowiAF_SearchBoxFrame_Template");
	if addon.IsNotWotLKClassic() then
		frame:SetPoint("TOPLEFT", AchievementFrame.searchBox);
		frame:SetPoint("BOTTOMRIGHT", AchievementFrame.searchBox);
	else
		frame:SetSize(107, 30);
		frame:SetPoint("TOPLEFT", AchievementFrameHeaderRightDDLInset, "TOPLEFT", 12, 2);
	end

    frame:SetMaxLetters(40);

	tinsert(ACHIEVEMENTFRAME_SUBFRAMES, frame:GetName());

	addon.GUI.Search.BoxFrame = frame;
end

function KrowiAF_SearchBoxFrame_OnLoad(self)
	SearchBoxTemplate_OnLoad(self);
	self.HasStickyFocus = function()
		local ancestry = search.PreviewFrame;
		return DoesAncestryInclude(ancestry, GetMouseFocus());
    end
end

function KrowiAF_SearchBoxFrame_OnShow(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 7);
	KrowiAF_SearchPreviewButton_OnEnter(search.PreviewFrame.Buttons[1]);
	if addon.IsWotLKClassic() then
		AchievementFrameHeaderRightDDLInset:Show();
	end
end

function KrowiAF_SearchBoxFrame_OnHide(self)
	if not AchievementFrame:IsShown() then
		self:SetText("");
	end
	search.PreviewFrame:Hide();
	search.ResultsFrame:Hide();
	if addon.IsWotLKClassic() and not AchievementFrameFilterDropDown:IsShown() then
		AchievementFrameHeaderRightDDLInset:Hide();
	end
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

	local numAchievementIds = #addon.Data.AchievementIDs;
	local excludeExcluded = addon.Options.db.SearchBox.ExcludeExcluded;
	local showPlaceholders = addon.Options.db.ShowPlaceholdersFilter and addon.Filters.db.ShowPlaceholders;

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