-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AchievementsObjectivesMixin = {};

KrowiAF_AchievementsObjectivesMixin.Modes = {
    Criteria = 1,
    Progressive = 2,
	NoCriteria = 3
}

local criteriaTable, progressBarTable, miniTable, metaCriteriaTable = {}, {}, {}, {}

function KrowiAF_AchievementsObjectivesMixin:ResetTextCriteria()
	AchievementButton_ResetTable(criteriaTable);
end

function KrowiAF_AchievementsObjectivesMixin:ResetProgressBars()
	AchievementButton_ResetTable(progressBarTable);
end

function KrowiAF_AchievementsObjectivesMixin:ResetMiniAchievements()
	AchievementButton_ResetTable(miniTable);
end

function KrowiAF_AchievementsObjectivesMixin:ResetMetas()
	for _, metaCriteria in next, metaCriteriaTable do
		metaCriteria.Id = nil;
		metaCriteria:Hide();
	end
end

function KrowiAF_AchievementsObjectivesMixin:ResetAll()
	self:ResetTextCriteria();
	self:ResetProgressBars();
	self:ResetMiniAchievements();
	self:ResetMetas();
end

function KrowiAF_AchievementsObjectivesMixin:GetTextCriteria(index)
	if criteriaTable[index] then
		return criteriaTable[index];
	end
	local frame = CreateFrame("FRAME", self:GetName() .. "TextCriteria" .. index, self, "KrowiAF_TextCriteria_Template");
	frame.Name = frame.Label; -- Fixes #56
	AchievementFrame_LocalizeCriteria(frame);
	criteriaTable[index] = frame;
	return frame;
end

function KrowiAF_AchievementsObjectivesMixin:GetProgressBar(index)
	if progressBarTable[index] then
		return progressBarTable[index];
	end
	local frame = CreateFrame("STATUSBAR", self:GetName() .. "ProgressBar" .. index, self, "AchievementProgressBarTemplate");
	if addon.IsWrathClassic then
		frame.Text = frame.text;
	end
	AchievementButton_LocalizeProgressBar(frame);
	progressBarTable[index] = frame;
	return frame;
end

function KrowiAF_AchievementsObjectivesMixin:GetMiniAchievement(index)
	if miniTable[index] then
		return miniTable[index];
	end
	local frame = CreateFrame("BUTTON", self:GetName() .. "MiniAchievement" .. index, self, "KrowiAF_MiniAchievement_Template");
	AchievementButton_LocalizeMiniAchievement(frame);
	miniTable[index] = frame;
	return frame;
end

function KrowiAF_AchievementsObjectivesMixin:GetMeta(index)
	if metaCriteriaTable[index] then
		return metaCriteriaTable[index];
	end
	local frame = CreateFrame("BUTTON", self:GetName() .. "Meta" .. index, self, "KrowiAF_MetaCriteria_Template");
	AchievementButton_LocalizeMetaAchievement(frame);
	metaCriteriaTable[index] = frame;
	return frame;
end

function KrowiAF_AchievementsObjectivesMixin:AddMeta(index, completed, assetId)
	local metaCriteria = self:GetMeta(index);
	metaCriteria:ClearAllPoints();
	if index == 1 then
		-- Anchor once all criteria are processed
		metaCriteria:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0);
		metaCriteria:SetPoint("RIGHT", self, "LEFT", self:GetWidth() / 2, 0);
	elseif math.fmod(index, 2) == 0 then
		local anchorMeta = self:GetMeta(index - 1);
		metaCriteria:SetPoint("LEFT", anchorMeta, "RIGHT", 0, 0);
		metaCriteria:SetPoint("RIGHT", self, "RIGHT", 0, 0);
	else
		local anchorMeta = self:GetMeta(index - 2);
		metaCriteria:SetPoint("TOPLEFT", anchorMeta, "BOTTOMLEFT", 0, 2);
		metaCriteria:SetPoint("RIGHT", self, "LEFT", self:GetWidth() / 2, 0);
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

local progressBarOffset = 10;
function KrowiAF_AchievementsObjectivesMixin:AddProgressBar(index, quantity, reqQuantity, quantityString)
	print(index, quantity, reqQuantity, quantityString)
	local progressBar = self:GetProgressBar(index);
	local extraHeight;
	if index == 1 then
		progressBar:SetPoint("TOP", self, "TOP", 0, 0);
		extraHeight = 5;
	else
		progressBar:SetPoint("TOP", self:GetProgressBar(index - 1), "BOTTOM", 0, -progressBarOffset);
		extraHeight = progressBarOffset;
	end
	progressBar.Text:SetText(string.format("%s", quantityString));
	progressBar:SetMinMaxValues(0, reqQuantity);
	progressBar:SetValue(quantity);
	progressBar:SetParent(self);
	progressBar:SetHeight(16); -- Template is 14 but borders 16
	progressBar:Show();

	return progressBar:GetWidth(), progressBar:GetHeight() + extraHeight;
end

function KrowiAF_AchievementsObjectivesMixin:AddTextCriteria(index, numCriteria, criteriaString, completed)
	local criteria = self:GetTextCriteria(index);
	criteria:ClearAllPoints();
	if index == 1 then
		if numCriteria == 1 then
			criteria:SetPoint("TOP", self, "TOP", 0, 0);
		else
			criteria:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0);
		end
	else
		criteria:SetPoint("TOPLEFT", self:GetTextCriteria(index - 1), "BOTTOMLEFT", 0, 0);
	end
	if self.Completed and completed then
		criteria.Dash:SetTextColor(0, 0, 0, 1);
		criteria.Dash:SetShadowOffset(0, 0);
		criteria.Label:SetTextColor(0, 0, 0, 1);
		criteria.Label:SetShadowOffset(0, 0);
	elseif completed then
		criteria.Dash:SetTextColor(0, 1, 0, 1);
		criteria.Dash:SetShadowOffset(1, -1);
		criteria.Label:SetTextColor(0, 1, 0, 1);
		criteria.Label:SetShadowOffset(1, -1);
	else
		criteria.Dash:SetTextColor(0.6, 0.6, 0.6, 1);
		criteria.Dash:SetShadowOffset(1, -1);
		criteria.Label:SetTextColor(0.6, 0.6, 0.6, 1);
		criteria.Label:SetShadowOffset(1, -1);
	end
	local labelWidth = 0;
	local maxLabelWidth = self:GetWidth() - criteria.Check:GetWidth();
	if completed then
		criteria.Check:Show();
		criteria.Dash:Hide();
	else
		criteria.Check:Hide();
		criteria.Dash:Show();
	end
	criteria.Label:SetText(criteriaString);
	labelWidth = min(criteria.Label:GetStringWidth(), maxLabelWidth);
	criteria.Label:SetWidth(labelWidth);
	local height = 15;
	if criteria.Label:GetStringWidth() > maxLabelWidth then
		height = criteria.Label:GetHeight() + 5;
	end
	criteria:SetParent(self);
	criteria:SetWidth(labelWidth + criteria.Check:GetWidth());
	criteria:SetHeight(height);
	criteria:Show();

	return criteria:GetWidth(), criteria:GetHeight();
end

local achievements, rowOffset, columnOffset = {}, 8, 4;
function KrowiAF_AchievementsObjectivesMixin:DisplayProgressiveAchievement(id)
	for i in next, achievements do
		achievements[i] = nil;
	end

	tinsert(achievements, 1, id);
    local prevId = GetPreviousAchievement(id);
	while prevId do
		tinsert(achievements, 1, prevId);
		prevId = GetPreviousAchievement(prevId);
	end

	local miniAchievementWidth = self:GetMiniAchievement(1):GetWidth();
	local objectivesWidth = self:GetWidth();
	local numColumns = floor(objectivesWidth / (miniAchievementWidth + columnOffset));
	local numRows = ceil(#achievements / numColumns);
	local width = min(numColumns, #achievements) * (miniAchievementWidth + columnOffset) - columnOffset;
	local xOffset1 = (objectivesWidth - width) / 2;

	for i, achId in ipairs(achievements) do
		local _, _, points, _, _, _, _, _, _, icon = addon.GetAchievementInfo(achId);
		local miniAchievement = self:GetMiniAchievement(i);
		miniAchievement:Show();
		miniAchievement.Id = achId;
		miniAchievement.Icon:SetTexture(icon);
		if i == 1 then
			miniAchievement:SetPoint("TOPLEFT", self, "TOPLEFT", xOffset1, 0);
		elseif mod(i, numColumns) == 1 then
			miniAchievement:SetPoint("TOPLEFT", self:GetMiniAchievement(i - numColumns), "BOTTOMLEFT", 0, -rowOffset);
		else
			miniAchievement:SetPoint("TOPLEFT", self:GetMiniAchievement(i - 1), "TOPRIGHT", columnOffset, 0);
		end
		if points > 0 then
			miniAchievement.Points:SetText(points);
			miniAchievement.Points:Show();
			miniAchievement.Shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield");
		else
			miniAchievement.Points:Hide();
			miniAchievement.Shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield-NoPoints");
		end
	end

	self:SetHeight(numRows * (self:GetMiniAchievement(1):GetHeight() + rowOffset));
	self.Mode = self.Modes.Progressive;
end

function KrowiAF_AchievementsObjectivesMixin:SetProgressBarAndTextPoints(numProgressBars, numTextCriteria)
	-- If we have text criteria and progressBar criteria, display the progressBar criteria first and position the textStrings under them.
	local criteria;
	for i = 1, numTextCriteria do
		criteria = self:GetTextCriteria(i);
		criteria:ClearAllPoints();
		if i == 1 then
			criteria:SetPoint("TOP", self:GetProgressBar(numProgressBars), "BOTTOM", 0, -10);
		else
			criteria:SetPoint("TOP", self:GetTextCriteria(i - 1), "BOTTOM", 0, 0);
		end
	end
end

function KrowiAF_AchievementsObjectivesMixin:SetTextPoints(numTextCriteria, maxCriteriaWidth)
	local columns = max(1, floor(self:GetWidth() / maxCriteriaWidth));

	local truncate, flex;
	if addon.Options.db.Achievements.Objectives.ForceTwoColumns then
		if columns < 2 and numTextCriteria >= addon.Options.db.Achievements.Objectives.ForceTwoColumnsThreshold then
			columns = 2;
			-- addon.Options.db.Achievements.Objectives.CriteriaBehaviour == 1 needs no additional code to overflow
			if addon.Options.db.Achievements.Objectives.CriteriaBehaviour == 2 then -- Truncate
				truncate = self:GetWidth() / 2;
			elseif addon.Options.db.Achievements.Objectives.CriteriaBehaviour == 3 then
				flex = true;
			end
		end
	end

	if columns == 1 then -- They're already in the correct positions
		local top = self:GetTextCriteria(1):GetTop();
		local bottom = self:GetTextCriteria(numTextCriteria):GetBottom();
		return top - bottom;
	end

	local columnWidth = self:GetWidth() / columns;

	local rows = 1;
	local position = 0;
	local textCriteria;
	for i = 1, numTextCriteria do -- The 1st one is already at its correct position
		textCriteria = self:GetTextCriteria(i);
		position = position + 1;
		if flex and position == 2 and textCriteria:GetWidth() > columnWidth then
			position = position + 1;
		end
		if position > columns then
			position = position - columns;
			rows = rows + 1;
		end
		if truncate then
			textCriteria:SetWidth(truncate);
		end
		textCriteria:ClearAllPoints();
		textCriteria:SetPoint("TOPLEFT", self, "TOPLEFT", (position - 1) * columnWidth, -(rows - 1) * textCriteria:GetHeight());
		if flex and textCriteria:GetWidth() > columnWidth then
			position = position + 1;
		end
	end
	local top = self:GetTextCriteria(1):GetTop();
	local bottom = self:GetTextCriteria(numTextCriteria):GetBottom();
	return top - bottom;
end

function KrowiAF_AchievementsObjectivesMixin:DisplayCriteria(id)
	if not id then
		return;
	end

	local numCriteria = addon.GetAchievementNumCriteria(id);
	if numCriteria == 0 then
		self.Mode = self.Modes.NoCriteria;
		return;
	end

	local progressBarHeight;
	local totalProgressBarHeight = 0;
	local textCriteriaWidth, textCriteriaHeight;
	local totalTextCriteriaHeight = 0;
	local numCriteriaRows = 0;

	local numTextCriteria, numProgressBars, numMetas = 0, 0, 0;
	local maxCriteriaWidth = 0;
	for i = 1, numCriteria do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, _, flags, assetID, quantityString = addon.GetAchievementCriteriaInfo(id, i);
		flags = addon.Objects.Flags:New(flags);
		if criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID then
			numMetas = numMetas + 1;
			self:AddMeta(numMetas, completed, assetID)
		elseif flags.IsCriteriaProgressBar then
			numProgressBars = numProgressBars + 1;
			_, progressBarHeight = self:AddProgressBar(numProgressBars, quantity, reqQuantity, quantityString);
			totalProgressBarHeight = totalProgressBarHeight + progressBarHeight;
			numCriteriaRows = numCriteriaRows + 1;
		else
			numTextCriteria = numTextCriteria + 1;
			textCriteriaWidth, textCriteriaHeight = self:AddTextCriteria(numTextCriteria, numCriteria, criteriaString, completed);
			maxCriteriaWidth = max(maxCriteriaWidth, textCriteriaWidth);
			totalTextCriteriaHeight = totalTextCriteriaHeight + textCriteriaHeight;
			numCriteriaRows = numCriteriaRows + 1;
		end
	end
	local height = 0;
	if numProgressBars > 0 then
		self:SetProgressBarAndTextPoints(numProgressBars, numTextCriteria);
		height = totalProgressBarHeight + totalTextCriteriaHeight;
	elseif numTextCriteria > 0 then
		height = totalTextCriteriaHeight;
		height = self:SetTextPoints(numTextCriteria, maxCriteriaWidth);
		if numMetas > 0 then
			self:GetMeta(1):ClearAllPoints();
			self:GetMeta(1):SetPoint("TOP", self:GetTextCriteria(numTextCriteria), "BOTTOM", 0, 0);
			self:GetMeta(1):SetPoint("LEFT", self, "LEFT", 0, 0);
			self:GetMeta(1):SetPoint("RIGHT", self, "LEFT", self:GetWidth() / 2, 0);
			height = height + ceil(numMetas / 2) * ACHIEVEMENTBUTTON_METAROWHEIGHT;
		end
	else
		height = ceil(numMetas / 2) * ACHIEVEMENTBUTTON_METAROWHEIGHT;
	end
	self:SetHeight(height + 1);
	self.Mode = self.Modes.Criteria;
end