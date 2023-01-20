-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_SearchResultsFrameMixin = {};

function KrowiAF_SearchResultsFrameMixin.Show_Hide(frame, func, categoriesWidth, achievementsOffsetX)
	local scrollFrame = frame.Container;
	scrollFrame:SetPoint("BOTTOMRIGHT", frame.bottomRightCorner, achievementsOffsetX, 8);
	scrollFrame:GetScrollChild():SetWidth(categoriesWidth);

	local lastVisible = 0;
	local buttons = scrollFrame.buttons;
	for _, button in next, buttons do
		button:SetWidth(categoriesWidth);
		if button:IsShown() then
			lastVisible = button;
		end
	end

	local scrollBar = scrollFrame.ScrollBar;
	func(scrollBar);
	local offset = 0;
	if not scrollBar:IsShown() then
		offset = max(0, lastVisible:GetBottom() - frame:GetBottom() - 12);
	end
	frame:SetPoint("TOP", 0, -112 - offset);
end

local savedQuery, savedResults;
function KrowiAF_SearchResultsFrameMixin:Update(query, results)
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
			local achievementId = savedResults[index].Id;
			local _, name, _, completed, _, _, _, _, _, icon = addon.GetAchievementInfo(achievementId);
			button.name:SetText(name);
			button.icon:SetTexture(icon);
			button.Achievement = savedResults[index];
			if completed then
				button.resultType:SetText(ACHIEVEMENTFRAME_FILTER_COMPLETED);
			else
				button.resultType:SetText(ACHIEVEMENTFRAME_FILTER_INCOMPLETE);
			end
			local category = savedResults[index].Category;
			if not category then
				print(achievementId, name)
			end
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