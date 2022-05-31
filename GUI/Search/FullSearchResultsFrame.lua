-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
local search = gui.Search;
search.FullSearchResultsFrame = {};
local fullSearchResultsFrame = search.FullSearchResultsFrame;

-- [[ Constructors ]] --
fullSearchResultsFrame.__index = fullSearchResultsFrame; -- Used to inject all the namespace functions to the frame
function fullSearchResultsFrame:Load()
    diagnostics.Trace("fullSearchResults:Load");

	local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameFullSearchResults", AchievementFrame, "KrowiAF_FullSearchResults_Template");
	addon.Util.InjectMetatable(frame, fullSearchResultsFrame); -- Inject all the namespace functions to the frame

	-- Rest
    frame:Hide();

	frame.Container.ScrollBar.Show = function()
		self.Show_Hide(frame, getmetatable(frame.Container.ScrollBar).__index.Show, 575, -24);
	end;
	frame.Container.ScrollBar.Hide = function()
		self.Show_Hide(frame, getmetatable(frame.Container.ScrollBar).__index.Hide, 597, 0);
	end;

    frame.Container.update = function()
		frame:Update();
    end

    HybridScrollFrame_CreateButtons(frame.Container, "KrowiAF_FullSearchResultButton_Template", 0, 0);
	search.FullSearchResultsButton.PostLoadButtons(frame.Container.buttons);

	addon.GUI.Search.FullSearchResultsFrame = frame;
end

function fullSearchResultsFrame.Show_Hide(frame, func, categoriesWidth, achievementsOffsetX)
	diagnostics.Trace("fullSearchResultsFrame.Show_Hide");

	frame.Container:SetPoint("BOTTOMRIGHT", frame.bottomRightCorner, achievementsOffsetX, 8);
	frame.Container:GetScrollChild():SetWidth(categoriesWidth);
	local lastVisible = 0;
	local buttons = frame.Container.buttons;
	for _, button in next, buttons do
		button:SetWidth(categoriesWidth);
		if button:IsShown() then
			lastVisible = button;
		end
	end
	func(frame.Container.ScrollBar);
	local offset = 0;
	if not frame.Container.ScrollBar:IsShown() then
		offset = max(0, lastVisible:GetBottom() - frame:GetBottom() - 12);
	end
	frame:SetPoint("TOP", 0, -112 - offset);
end

local savedQuery, savedResults;
function fullSearchResultsFrame:Update(query, results)
	diagnostics.Trace("fullSearchResults:Update");

	self:SetPoint("TOP", 0, -112); -- Need to reset the frame before we can adjust again

	savedQuery = query or savedQuery;
	savedResults = results or savedResults;

    self.NumResults = #savedResults;
	local scrollFrame = self.Container;
	local offset = HybridScrollFrame_GetOffset(scrollFrame);
	local buttons = scrollFrame.buttons;
	for i, button in next, buttons do
		local index = offset + i;
		if index <= self.NumResults then
			local achievementID = savedResults[index].ID;
			local _, name, _, completed, _, _, _, _, _, icon, _, _, _, _ = GetAchievementInfo(achievementID);
			button.name:SetText(name);
			button.icon:SetTexture(icon);
			button.Achievement = savedResults[index];
			if completed then
				button.resultType:SetText(ACHIEVEMENTFRAME_FILTER_COMPLETED);
			else
				button.resultType:SetText(ACHIEVEMENTFRAME_FILTER_INCOMPLETE);
			end
			local category = savedResults[index].Category;
			local categoriesTree = category:GetTree();
			local path = categoriesTree[1].Name;
			for j = 2, #categoriesTree do
				path = path .. " > " .. categoriesTree[j].Name;
			end
			button.path:SetText(path);
			button:Show();
		else
			button:Hide();
		end
	end
	local totalHeight = self.NumResults * 49;
	HybridScrollFrame_Update(scrollFrame, totalHeight, 270);
	self.titleText:SetText(string.format(ENCOUNTER_JOURNAL_SEARCH_RESULTS, savedQuery, self.NumResults));
end