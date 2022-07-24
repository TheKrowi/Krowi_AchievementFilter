-- [[ Namespaces ]] --
local _, addon = ...;

AchievementsObjectivesMixin = {};

AchievementsObjectivesMixin.Modes = {
    Criteria = 1,
    Progressive = 2
}

local criteriaTable, progressBarTable, miniTable, metaCriteriaTable = {}, {}, {}, {}

do -- Scripts
	function KrowiAF_AchievementsObjectives_OnEnter(self)
		GameTooltip:SetOwner(self, "ANCHOR_NONE");
		GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT");
		local link = GetAchievementLink(self.Id);
		GameTooltip:SetHyperlink(link);
		AchievementFrameAchievements_CheckGuildMembersTooltip(self);
		GameTooltip:Show();
		if GameTooltip:GetTop() > self:GetBottom() then
			GameTooltip:ClearAllPoints();
			GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT");
		end
	end

	function KrowiAF_AchievementsObjectives_OnLeave(self)
		GameTooltip:Hide();
	end

	function KrowiAF_AchievementsObjectives_OnClick(self, button, down)
		if button == "LeftButton" then
			KrowiAF_SelectAchievementFromID(self.Id);
		elseif button == "RightButton" then
			addon.GUI.RightClickMenu.AchievementMenu:Open(addon.Data.Achievements[self.Id]);
		end
	end

	function KrowiAF_AchievementsObjectives_OnLoad(self)
		local criteria = self:GetCriteria(1);
		criteria.Label:SetText("- ");
		self.TextCheckWidth = criteria.Label:GetStringWidth();
	end
end

do -- Reset objective types
	function AchievementsObjectivesMixin:ResetCriteria()
		AchievementButton_ResetTable(criteriaTable);
	end

	function AchievementsObjectivesMixin:ResetProgressBars()
		AchievementButton_ResetTable(progressBarTable);
	end

	function AchievementsObjectivesMixin:ResetMiniAchievements()
		AchievementButton_ResetTable(miniTable);
	end

	function AchievementsObjectivesMixin:ResetMetas()
		for _, metaCriteria in next, metaCriteriaTable do
			metaCriteria.Id = nil;
			metaCriteria:Hide();
		end
	end

	function AchievementsObjectivesMixin:ResetAll()
		self:ResetCriteria();
		self:ResetProgressBars();
		self:ResetMiniAchievements();
		self:ResetMetas();
	end
end

do -- Get objective types
	function AchievementsObjectivesMixin:GetCriteria(index)
		if criteriaTable[index] then
			return criteriaTable[index];
		end
		local frame = CreateFrame("FRAME", "KrowiAF_AchievementsObjectivesCriteria" .. index, self, "KrowiAF_AchievementCriteria_Template");
		AchievementFrame_LocalizeCriteria(frame);
		criteriaTable[index] = frame;
		return frame;
	end

	function AchievementsObjectivesMixin:GetProgressBar(index)
		if progressBarTable[index] then
			return progressBarTable[index];
		end
		local frame = CreateFrame("STATUSBAR", "KrowiAF_AchievementsObjectivesProgressBar" .. index, self, "AchievementProgressBarTemplate");
		AchievementButton_LocalizeProgressBar(frame);
		progressBarTable[index] = frame;
		return frame;
	end

	function AchievementsObjectivesMixin:GetMiniAchievement(index)
		if miniTable[index] then
			return miniTable[index];
		end
		local frame = CreateFrame("BUTTON", "KrowiAF_AchievementsObjectivesMiniAchievement" .. index, self, "KrowiAF_MiniAchievement_Template");
		AchievementButton_LocalizeMiniAchievement(frame);
		miniTable[index] = frame;
		return frame;
	end

	function AchievementsObjectivesMixin:GetMeta(index)
		if metaCriteriaTable[index] then
			return metaCriteriaTable[index];
		end
		local frame = CreateFrame("BUTTON", "KrowiAF_AchievementsObjectivesMeta" .. index, self, "KrowiAF_MetaCriteria_Template");
		AchievementButton_LocalizeMetaAchievement(frame);
		metaCriteriaTable[index] = frame;
		return frame;
	end
end

do -- Add objective types
	function AchievementsObjectivesMixin:AddMeta(index, completed, assetId)
		local metaCriteria = self:GetMeta(index);
		metaCriteria:ClearAllPoints();
		if index == 1 then
			-- Anchor once all criteria are processed
		elseif math.fmod(index, 2) == 0 then
			local anchorMeta = self:GetMeta(index - 1);
			metaCriteria:SetPoint("LEFT", anchorMeta, "RIGHT", 35, 0);
		else
			local anchorMeta = self:GetMeta(index - 2);
			metaCriteria:SetPoint("TOPLEFT", anchorMeta, "BOTTOMLEFT", -0, 2);
		end
		local id, name, _, _, _, _, _, _, _, icon = GetAchievementInfo(assetId);
		metaCriteria:Show();
		metaCriteria.Id = id;
		metaCriteria.Label:SetText(name);
		metaCriteria.Icon:SetTexture(icon);
		-- Have to check if criteria is completed here, can't just check if achievement is completed.
		-- This is because the criteria could have modifiers on it that prevent completion even though the achievement is earned.
		if self.Completed and completed then
			metaCriteria.Check:Show();
			metaCriteria.Border:SetVertexColor(1, 1, 1, 1);
			metaCriteria.Icon:SetVertexColor(1, 1, 1, 1);
			metaCriteria.Label:SetShadowOffset(0, 0)
			metaCriteria.Label:SetTextColor(0, 0, 0, 1);
		elseif completed then
			metaCriteria.Check:Show();
			metaCriteria.Border:SetVertexColor(1, 1, 1, 1);
			metaCriteria.Icon:SetVertexColor(1, 1, 1, 1);
			metaCriteria.Label:SetShadowOffset(1, -1)
			metaCriteria.Label:SetTextColor(0, 1, 0, 1);
		else
			metaCriteria.Check:Hide();
			metaCriteria.Border:SetVertexColor(0.75, 0.75, 0.75, 1);
			metaCriteria.Icon:SetVertexColor(0.55, 0.55, 0.55, 1);
			metaCriteria.Label:SetShadowOffset(1, -1)
			metaCriteria.Label:SetTextColor(0.6, 0.6, 0.6, 1);
		end
	end

	function AchievementsObjectivesMixin:AddProgressBar(index, quantity, reqQuantity, quantityString)
		local progressBar = self:GetProgressBar(index);
		if index == 1 then
			progressBar:SetPoint("TOP", self, "TOP", 4, -4);
		else
			progressBar:SetPoint("TOP", self:GetProgressBar(index - 1), "BOTTOM", 0, 0);
		end
		progressBar.text:SetText(string.format("%s", quantityString));
		progressBar:SetMinMaxValues(0, reqQuantity);
		progressBar:SetValue(quantity);
		progressBar:SetParent(self);
		progressBar:Show();
	end

	function AchievementsObjectivesMixin:AddCriteria(index, numCriteria, criteriaString, completed)
		local criteria = self:GetCriteria(index);
		criteria:ClearAllPoints();
		if index == 1 then
			if numCriteria == 1 then
				criteria:SetPoint("TOP", self, "TOP", -14);
			else
				criteria:SetPoint("TOPLEFT", self, "TOPLEFT", 0);
			end
		else
			criteria:SetPoint("TOPLEFT", self:GetCriteria(index - 1), "BOTTOMLEFT", 0, 0);
		end
		if self.Completed and completed then
			criteria.Label:SetTextColor(0, 0, 0, 1);
			criteria.Label:SetShadowOffset(0, 0);
		elseif completed then
			criteria.Label:SetTextColor(0, 1, 0, 1);
			criteria.Label:SetShadowOffset(1, -1);
		else
			criteria.Label:SetTextColor(.6, .6, .6, 1);
			criteria.Label:SetShadowOffset(1, -1);
		end
		local stringWidth = 0;
		local maxCriteriaContentWidth;
		if completed then
			maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - ACHIEVEMENTUI_CRITERIACHECKWIDTH;
			criteria.Check:SetPoint("LEFT", 18, -3);
			criteria.Label:SetPoint("LEFT", criteria.Check, "RIGHT", 0, 2);
			criteria.Check:Show();
			criteria.Label:SetText(criteriaString);
			stringWidth = min(criteria.Label:GetStringWidth(),maxCriteriaContentWidth);
		else
			maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - self.TextCheckWidth;
			criteria.Check:SetPoint("LEFT", 0, -3);
			criteria.Label:SetPoint("LEFT", criteria.Check, "RIGHT", 5, 2);
			criteria.Check:Hide();
			criteria.Label:SetText("- "..criteriaString);
			stringWidth = min(criteria.Label:GetStringWidth() - self.TextCheckWidth, maxCriteriaContentWidth);	-- Don't want the "- " to be included in the width
		end
		local offset = 0;
		if criteria.Label:GetWidth() > maxCriteriaContentWidth then
			criteria.Label:SetWidth(maxCriteriaContentWidth);
			offset = criteria.Label:GetHeight() / self.FontHeight + criteria.Label:GetHeight() / self.FontHeight * 5 - 5;
		end
		criteria:SetHeight(15 + offset);
		criteria:SetParent(self);
		criteria:Show();
		criteria:SetWidth(stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);

		return stringWidth;
	end
end

local achievements, rowOffset, columnOffset = {}, 8, 0;
function AchievementsObjectivesMixin:DisplayProgressiveAchievement(id)
	for i in next, achievements do
		achievements[i] = nil;
	end

	tinsert(achievements, 1, id);
    local prevId = GetPreviousAchievement(id);
	while prevId do
		tinsert(achievements, 1, prevId);
		prevId = GetPreviousAchievement(prevId);
	end

	local i = 0;
	for index, achId in ipairs(achievements) do
		local _, _, points, _, _, _, _, _, _, icon = addon.GetAchievementInfo(achId);
		local miniAchievement = self:GetMiniAchievement(index);
		miniAchievement:Show();
		miniAchievement.Id = achId;
		miniAchievement.Icon:SetTexture(icon);
		if index == 1 then
			miniAchievement:SetPoint("TOPLEFT", self, "TOPLEFT", -4, -4);
		elseif mod(index, 6) == 1 then
			miniAchievement:SetPoint("TOPLEFT", miniTable[index - 6], "BOTTOMLEFT", 0, -8);
		else
			miniAchievement:SetPoint("TOPLEFT", miniTable[index - 1], "TOPRIGHT", 4, 0);
		end
		if points > 0 then
			miniAchievement.Points:SetText(points);
			miniAchievement.Points:Show();
			miniAchievement.Shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield");
		else
			miniAchievement.Points:Hide();
			miniAchievement.Shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield-NoPoints");
		end
		i = index;
	end
	self:SetHeight(math.ceil(i / 6) * (miniTable[i]:GetHeight() + rowOffset));
	self:SetWidth(min(i, 6) * (miniTable[i]:GetWidth() + columnOffset));
	self.Mode = self.Modes.Progressive;
end

local FORCE_COLUMNS_MAX_WIDTH = 220;
local FORCE_COLUMNS_MIN_CRITERIA = 20;
local FORCE_COLUMNS_LEFT_OFFSET = -10;
local FORCE_COLUMNS_RIGHT_OFFSET = 24;
local FORCE_COLUMNS_RIGHT_COLUMN_SPACE = 150;

function AchievementsObjectivesMixin:SetProgressBarAndTextPoints(progressBars, textStrings)
	-- If we have text criteria and progressBar criteria, display the progressBar criteria first and position the textStrings under them.
	local criteria = self:GetCriteria(1);
	criteria:ClearAllPoints();
	if textStrings == 1 then
		criteria:SetPoint("TOP", self:GetProgressBar(progressBars), "BOTTOM", -14, -4);
	else
		criteria:SetPoint("TOP", self:GetProgressBar(progressBars), "BOTTOM", 0, -4);
		criteria:SetPoint("LEFT", self, "LEFT", 0, 0);
	end
end

function AchievementsObjectivesMixin:ForceTwoRowsAdvanced(yOffset)
	-- print(yOffset)
	local numColumns = 2;
	local xOffset = 0;
	local maxColumnWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH / numColumns;
	local position = 0;
	for i = 1, #criteriaTable do
		position = position + 1;
		if criteriaTable[i]:IsShown() then
			if position == 2 and criteriaTable[i].Label:GetStringWidth() > maxColumnWidth then
				position = position + 1;
			end
			if position > numColumns then
				position = position - numColumns;
				yOffset = yOffset - ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
			end
			criteriaTable[i]:ClearAllPoints();
			if position == 1 then
				xOffset = FORCE_COLUMNS_LEFT_OFFSET;
			elseif position == 2 then
				xOffset = FORCE_COLUMNS_RIGHT_OFFSET;
			end
			criteriaTable[i]:SetPoint("TOPLEFT", self, "TOPLEFT", (position - 1) * maxColumnWidth + xOffset, yOffset);
			if criteriaTable[i].Label:GetStringWidth() > maxColumnWidth then
				position = position + 1;
			end
		end
	end
	-- print(yOffset, ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT, abs(yOffset / ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT))
	return abs(yOffset / ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT) + 1;
end

function AchievementsObjectivesMixin:SetTextPoints(progressBars, textStrings, maxCriteriaWidth, numCriteriaRows, addExtraCriteriaRow)
	-- testing
	-- FIND A WAY TO FORCE 2 COLUMNS AND SHOW THE TOO LONG ITEMS ON A SINGLE LINE
	-- maxCriteriaWidth = min(maxCriteriaWidth, FORCE_COLUMNS_MAX_WIDTH)
	-- testing
	local yOffset = 0;
	local numExtraCriteriaRows = 0;
	local function AddExtraCriteriaRow()
		numExtraCriteriaRows = numExtraCriteriaRows + 1;
		yOffset = -numExtraCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	end
	-- Figure out if we can make multiple columns worth of criteria instead of one long one
	local numColumns = floor(ACHIEVEMENTUI_MAXCONTENTWIDTH / maxCriteriaWidth);
	-- But if we have a lot of criteria, force 2 columns

	-- print(ACHIEVEMENTUI_MAXCONTENTWIDTH, maxCriteriaWidth, numColumns, textStrings, FORCE_COLUMNS_MIN_CRITERIA, maxCriteriaWidth, FORCE_COLUMNS_MAX_WIDTH)

	local forceColumns = false;
	if numColumns == 1 and textStrings >= FORCE_COLUMNS_MIN_CRITERIA then
		if maxCriteriaWidth <= FORCE_COLUMNS_MAX_WIDTH then
			numColumns = 2;
			forceColumns = true;
			-- if top right criteria would run into the achievement shield, move them all down 1 row
			-- this assumes description is 1 or 2 lines, otherwise this wouldn't be a problem
			local numLines = self:GetParent().numLines;
			if progressBars == 0 then
				local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
				if self:GetCriteria(2).Label:GetStringWidth() > FORCE_COLUMNS_RIGHT_COLUMN_SPACE then
					for i = 1, ACHIEVEMENTUI_MAX_LINES_COLLAPSED - numLines do
						AddExtraCriteriaRow();
					end
				elseif self:GetCriteria(4).Label:GetStringWidth() > FORCE_COLUMNS_RIGHT_COLUMN_SPACE then
					for i = 2, ACHIEVEMENTUI_MAX_LINES_COLLAPSED - numLines do
						AddExtraCriteriaRow();
					end
				end
			end
		-- else
		-- 	print("we just need 2 rows...")
		-- 	return self:ForceTwoRowsAdvanced(yOffset);
		end
	end
	if numColumns <= 1 then
		return numCriteriaRows, numExtraCriteriaRows;
	end
	local rows = 1;
	local position = 0;
	for i=1, #criteriaTable do
		position = position + 1;
		if ( position > numColumns ) then
			position = position - numColumns;
			rows = rows + 1;
		end
		if ( rows == 1 ) then
			criteriaTable[i]:ClearAllPoints();
			local xOffset = 0;
			if ( forceColumns ) then
				if ( position == 1 ) then
					xOffset = FORCE_COLUMNS_LEFT_OFFSET;
				elseif ( position == 2 ) then
					xOffset = FORCE_COLUMNS_RIGHT_OFFSET;
				end
			end
			criteriaTable[i]:SetPoint("TOPLEFT", self, "TOPLEFT", (position - 1)*(ACHIEVEMENTUI_MAXCONTENTWIDTH/numColumns) + xOffset, yOffset);
		else
			criteriaTable[i]:ClearAllPoints();
			criteriaTable[i]:SetPoint("TOPLEFT", criteriaTable[position + ((rows - 2) * numColumns)], "BOTTOMLEFT", 0, 0);
		end
	end
	numCriteriaRows = ceil(numCriteriaRows / numColumns);
	return numCriteriaRows, numExtraCriteriaRows;
end

function AchievementsObjectivesMixin:DisplayCriteria(id)
	if not id then
		return;
	end

	local numCriteria = GetAchievementNumCriteria(id);
	if numCriteria == 0 then
		self.Mode = self.Modes.Criteria;
		self:SetHeight(0);
		return;
	end

	local stringWidth;
	local numCriteriaRows = 0;
	local numExtraCriteriaRows = 0;

	local textStrings, progressBars, metas = 0, 0, 0;
	local maxCriteriaWidth = 0;
	for i = 1, numCriteria do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, _, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, i);
		if criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID then
			metas = metas + 1;
			self:AddMeta(metas, completed, assetID)
		elseif ( bit.band(flags, EVALUATION_TREE_FLAG_PROGRESS_BAR) == EVALUATION_TREE_FLAG_PROGRESS_BAR ) then
			progressBars = progressBars + 1;
			self:AddProgressBar(progressBars, quantity, reqQuantity, quantityString)
			numCriteriaRows = numCriteriaRows + 1;
		else
			textStrings = textStrings + 1;
			stringWidth = self:AddCriteria(textStrings, numCriteria, criteriaString, completed);
			maxCriteriaWidth = max(maxCriteriaWidth, stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			numCriteriaRows = numCriteriaRows + 1;
		end
	end
	if textStrings > 0 and progressBars > 0 then
		self:SetProgressBarAndTextPoints(progressBars, textStrings);
	elseif ( textStrings > 1 ) then
		numCriteriaRows, numExtraCriteriaRows = self:SetTextPoints(progressBars, textStrings, maxCriteriaWidth, numCriteriaRows)
	end
	numCriteriaRows = numCriteriaRows + numExtraCriteriaRows;
	local firstMetaCriteria = self:GetMeta(1);
	if firstMetaCriteria.Id then
		local yOffsetMeta = -8 - numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
		if metas == 1 then
			firstMetaCriteria:SetPoint("TOP", self, "TOP", 0, yOffsetMeta);
		else
			firstMetaCriteria:SetPoint("TOPLEFT", self, "TOPLEFT", 20, yOffsetMeta);
		end
	end
	local height = ceil(metas / 2) * ACHIEVEMENTBUTTON_METAROWHEIGHT + numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	if ( metas > 0 or progressBars > 0 ) then
		height = height + 10;
	end
	self:SetHeight(height);
	self.Mode = self.Modes.Criteria;
end