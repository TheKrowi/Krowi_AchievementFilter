-- [[ Namespaces ]] --
local _, addon = ...;

AchievementsObjectivesMixin = {};

AchievementsObjectivesMixin.Modes = {
    Criteria = 1,
    Progressive = 2
}

local criteriaTable, progressBarTable, miniTable, metaCriteriaTable = {}, {}, {}, {}

do -- Reset objective types
	function AchievementsObjectivesMixin:ResetCriteria()
		self.repCriteria:Hide();
		AchievementButton_ResetTable(criteriaTable);
	end

	function AchievementsObjectivesMixin:ResetProgressBars()
		AchievementButton_ResetTable(progressBarTable);
	end

	function AchievementsObjectivesMixin:ResetMiniAchievements()
		AchievementButton_ResetTable(miniTable);
	end

	function AchievementsObjectivesMixin:ResetMetas()
		AchievementButton_ResetTable(metaCriteriaTable);
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
		local frame = CreateFrame("FRAME", "KrowiAF_AchievementsObjectivesCriteria" .. index, self, "KrowiAF_AchievementCriteriaTemplate");
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
		local frame = CreateFrame("FRAME", "KrowiAF_AchievementsObjectivesMiniAchievement" .. index, self, "MiniAchievementTemplate"); -- addon.GUI.AchievementsFrame
		AchievementButton_LocalizeMiniAchievement(frame);
		miniTable[index] = frame;
		return frame;
	end

	function AchievementsObjectivesMixin:GetMeta(index)
		if metaCriteriaTable[index] then
			return metaCriteriaTable[index];
		end
		local frame = CreateFrame("BUTTON", "KrowiAF_AchievementsObjectivesMeta" .. index, self, "MetaCriteriaTemplate"); -- addon.GUI.AchievementsFrame
		-- TODO
		-- frame:SetScript("OnClick", function()
		--     KrowiAF_SelectAchievementFromID(frame.id, nil, true);
		-- end);
		-- frame:SetScript("OnEnter", OnEnter);
		-- function OnEnter(self)
		--     GameTooltip:SetOwner(self, "ANCHOR_NONE");
		--     GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT");
		--     local link = GetAchievementLink(self.id);
		--     GameTooltip:SetHyperlink(link);
		--     AchievementFrameAchievements_CheckGuildMembersTooltip(self);
		--     GameTooltip:Show();
		--     if GameTooltip:GetTop() > self:GetBottom() then
		--         GameTooltip:ClearAllPoints();
		--         GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT");
		--     end
		-- end
		AchievementButton_LocalizeMetaAchievement(frame);
		metaCriteriaTable[index] = frame;
		return frame;
	end
end

local achievementList = {};
function AchievementsObjectivesMixin:DisplayProgressiveAchievement(id)
	for i in next, achievementList do
		achievementList[i] = nil;
	end

	tinsert(achievementList, 1, id);
    local prevId = GetPreviousAchievement(id);
	while prevId do
		tinsert(achievementList, 1, prevId);
		prevId = GetPreviousAchievement(prevId);
	end

	local i = 0;
	for index, achievementID in ipairs(achievementList) do
		local _, achievementName, points, _, month, day, year, description, flags, iconpath = GetAchievementInfo(achievementID);
		flags = flags or 0;		-- bug 360115
		local miniAchievement = self:GetMiniAchievement(index);
		miniAchievement:Show();
		miniAchievement:SetParent(self);
		miniAchievement.icon:SetTexture(iconpath);
		if index == 1 then
			miniAchievement:SetPoint("TOPLEFT", self, "TOPLEFT", -4, -4);
		elseif mod(index, 6) == 1 then
			miniAchievement:SetPoint("TOPLEFT", miniTable[index - 6], "BOTTOMLEFT", 0, -8);
		else
			miniAchievement:SetPoint("TOPLEFT", miniTable[index - 1], "TOPRIGHT", 4, 0);
		end
		if points > 0 then
			miniAchievement.points:SetText(points);
			miniAchievement.points:Show();
			miniAchievement.shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield");
		else
			miniAchievement.points:Hide();
			miniAchievement.shield:SetTexture("Interface/AchievementFrame/UI-Achievement-Progressive-Shield-NoPoints");
		end
		miniAchievement.numCriteria = 0;
		if not ( bit.band(flags, ACHIEVEMENT_FLAGS_HAS_PROGRESS_BAR) == ACHIEVEMENT_FLAGS_HAS_PROGRESS_BAR ) then
            local numCriteria = GetAchievementNumCriteria(achievementID);
			for j = 1, numCriteria do
				local criteriaString, _, completed = GetAchievementCriteriaInfo(achievementID, j);
				if completed == false then
					criteriaString = "|CFF808080 - " .. criteriaString .. "|r";
				else
					criteriaString = "|CFF00FF00 - " .. criteriaString .. "|r";
				end
				miniAchievement["criteria" .. j] = criteriaString;
				miniAchievement.numCriteria = j;
			end
		end
		miniAchievement.name = achievementName;
		miniAchievement.desc = description;
		if month then
			miniAchievement.date = FormatShortDate(day, month, year);
		end
		i = index;
	end
	self:SetHeight(math.ceil(i / 6) * ACHIEVEMENTUI_PROGRESSIVEHEIGHT);
	self:SetWidth(min(i, 6) * ACHIEVEMENTUI_PROGRESSIVEWIDTH);
	self.mode = self.Modes.Progressive;
end

local FORCE_COLUMNS_MAX_WIDTH = 220;
local FORCE_COLUMNS_MIN_CRITERIA = 20;
local FORCE_COLUMNS_LEFT_OFFSET = -10;
local FORCE_COLUMNS_RIGHT_OFFSET = 24;
local FORCE_COLUMNS_RIGHT_COLUMN_SPACE = 150;

function AchievementsObjectivesMixin:DisplayCriteria(id)
	if not id then
		return;
	end
	local yOffset = 0;
	local numMetaRows = 0;
	local numCriteriaRows = 0;
	local numExtraCriteriaRows = 0;
	local function AddExtraCriteriaRow()
		numExtraCriteriaRows = numExtraCriteriaRows + 1;
		yOffset = -numExtraCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	end
	local requiresRep, hasRep, repLevel;
	if ( not self.completed ) then
		requiresRep, hasRep, repLevel = GetAchievementGuildRep(id);
		if ( requiresRep ) then
			local gender = UnitSex("player");
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..repLevel, gender);
			self.repCriteria:SetFormattedText(ACHIEVEMENT_REQUIRES_GUILD_REPUTATION, factionStandingtext);
			if ( hasRep ) then
				self.repCriteria:SetTextColor(0, 1, 0);
			else
				self.repCriteria:SetTextColor(1, 0, 0);
			end
			self.repCriteria:Show();
			AddExtraCriteriaRow();
		end
	end
	local numCriteria = GetAchievementNumCriteria(id);
	if ( numCriteria == 0 and not requiresRep ) then
		self.mode = self.Modes.Criteria;
		self:SetHeight(0);
		return;
	end
	-- text check width
	if ( not self.textCheckWidth ) then
		local criteria = self:GetCriteria(1);
		criteria.Name:SetText("- ");
		self.textCheckWidth = criteria.Name:GetStringWidth();
	end
	local frameLevel = self:GetFrameLevel() + 1;
	-- Why textStrings? You try naming anything just "string" and see how happy you are.
	local textStrings, progressBars, metas = 0, 0, 0;
	local firstMetaCriteria;
	local maxCriteriaWidth = 0;
	local yPos;
	for i = 1, numCriteria do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, i);
		if ( criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
			metas = metas + 1;
			local metaCriteria = self:GetMeta(metas);
			metaCriteria:ClearAllPoints();
			if ( metas == 1 ) then
				-- this will be anchored below, we need to know how many text criteria there are
				firstMetaCriteria = metaCriteria;
				numMetaRows = numMetaRows + 1;
			elseif ( math.fmod(metas, 2) == 0 ) then
				local anchorMeta = self:GetMeta(metas - 1);
				metaCriteria:SetPoint("LEFT", anchorMeta, "RIGHT", 35, 0);
			else
				local anchorMeta = self:GetMeta(metas - 2);
				metaCriteria:SetPoint("TOPLEFT", anchorMeta, "BOTTOMLEFT", -0, 2);
				numMetaRows = numMetaRows + 1;
			end
			local id, achievementName, points, achievementCompleted, month, day, year, description, flags, iconpath = GetAchievementInfo(assetID);
			if ( month ) then
				metaCriteria.date = FormatShortDate(day, month, year)
			else
				metaCriteria.date = nil;
			end
			metaCriteria.id = id;
			metaCriteria.label:SetText(achievementName);
			metaCriteria.icon:SetTexture(iconpath);
			-- have to check if criteria is completed here, can't just check if achievement is completed.
			-- This is because the criteria could have modifiers on it that prevent completion even though the achievement is earned.
			if ( self.completed and completed ) then
				metaCriteria.check:Show();
				metaCriteria.border:SetVertexColor(1, 1, 1, 1);
				metaCriteria.icon:SetVertexColor(1, 1, 1, 1);
				metaCriteria.label:SetShadowOffset(0, 0)
				metaCriteria.label:SetTextColor(0, 0, 0, 1);
			elseif ( completed ) then
				metaCriteria.check:Show();
				metaCriteria.border:SetVertexColor(1, 1, 1, 1);
				metaCriteria.icon:SetVertexColor(1, 1, 1, 1);
				metaCriteria.label:SetShadowOffset(1, -1)
				metaCriteria.label:SetTextColor(0, 1, 0, 1);
			else
				metaCriteria.check:Hide();
				metaCriteria.border:SetVertexColor(.75, .75, .75, 1);
				metaCriteria.icon:SetVertexColor(.55, .55, .55, 1);
				metaCriteria.label:SetShadowOffset(1, -1)
				metaCriteria.label:SetTextColor(.6, .6, .6, 1);
			end
			metaCriteria:SetParent(self);
			metaCriteria:Show();
		elseif ( bit.band(flags, EVALUATION_TREE_FLAG_PROGRESS_BAR) == EVALUATION_TREE_FLAG_PROGRESS_BAR ) then
			-- Display this criteria as a progress bar!
			progressBars = progressBars + 1;
			local progressBar = self:GetProgressBar(progressBars);
			if ( progressBars == 1 ) then
				progressBar:SetPoint("TOP", self, "TOP", 4, -4 + yOffset);
			else
				progressBar:SetPoint("TOP", self:GetProgressBar(progressBars - 1), "BOTTOM", 0, 0);
			end
			progressBar.text:SetText(string.format("%s", quantityString));
			progressBar:SetMinMaxValues(0, reqQuantity);
			progressBar:SetValue(quantity);
			progressBar:SetParent(self);
			progressBar:Show();
			numCriteriaRows = numCriteriaRows + 1;
		else
			textStrings = textStrings + 1;
			local criteria = self:GetCriteria(textStrings);
			criteria:ClearAllPoints();
			if ( textStrings == 1 ) then
				if ( numCriteria == 1 ) then
					criteria:SetPoint("TOP", self, "TOP", -14, yOffset);
				else
					criteria:SetPoint("TOPLEFT", self, "TOPLEFT", 0, yOffset);
				end
			else
				criteria:SetPoint("TOPLEFT", self:GetCriteria(textStrings - 1), "BOTTOMLEFT", 0, 0);
			end
			if ( self.completed and completed ) then
				criteria.Name:SetTextColor(0, 0, 0, 1);
				criteria.Name:SetShadowOffset(0, 0);
			elseif ( completed ) then
				criteria.Name:SetTextColor(0, 1, 0, 1);
				criteria.Name:SetShadowOffset(1, -1);
			else
				criteria.Name:SetTextColor(.6, .6, .6, 1);
				criteria.Name:SetShadowOffset(1, -1);
			end
			local stringWidth = 0;
			local maxCriteriaContentWidth;
			if ( completed ) then
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - ACHIEVEMENTUI_CRITERIACHECKWIDTH;
				criteria.Check:SetPoint("LEFT", 18, -3);
				criteria.Name:SetPoint("LEFT", criteria.Check, "RIGHT", 0, 2);
				criteria.Check:Show();
				criteria.Name:SetText(criteriaString);
				stringWidth = min(criteria.Name:GetStringWidth(),maxCriteriaContentWidth);
			else
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - self.textCheckWidth;
				criteria.Check:SetPoint("LEFT", 0, -3);
				criteria.Name:SetPoint("LEFT", criteria.Check, "RIGHT", 5, 2);
				criteria.Check:Hide();
				criteria.Name:SetText("- "..criteriaString);
				stringWidth = min(criteria.Name:GetStringWidth() - self.textCheckWidth,maxCriteriaContentWidth);	-- don't want the "- " to be included in the width
			end
			if ( criteria.Name:GetWidth() > maxCriteriaContentWidth ) then
				criteria.Name:SetWidth(maxCriteriaContentWidth);
			end
			criteria:SetParent(self);
			criteria:Show();
			criteria:SetWidth(stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			maxCriteriaWidth = max(maxCriteriaWidth, stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			numCriteriaRows = numCriteriaRows + 1;
		end
	end
	if ( textStrings > 0 and progressBars > 0 ) then
		-- If we have text criteria and progressBar criteria, display the progressBar criteria first and position the textStrings under them.
		local criTable = self:GetCriteria(1);
		criTable:ClearAllPoints();
		if ( textStrings == 1 ) then
			criTable:SetPoint("TOP", self:GetProgressBar(progressBars), "BOTTOM", -14, -4);
		else
			criTable:SetPoint("TOP", self:GetProgressBar(progressBars), "BOTTOM", 0, -4);
			criTable:SetPoint("LEFT", self, "LEFT", 0, 0);
		end
	elseif ( textStrings > 1 ) then
		-- Figure out if we can make multiple columns worth of criteria instead of one long one
		local numColumns = floor(ACHIEVEMENTUI_MAXCONTENTWIDTH/maxCriteriaWidth);
		-- But if we have a lot of criteria, force 2 columns
		local forceColumns = false;
		if ( numColumns == 1 and textStrings >= FORCE_COLUMNS_MIN_CRITERIA and maxCriteriaWidth <= FORCE_COLUMNS_MAX_WIDTH ) then
			numColumns = 2;
			forceColumns = true;
			-- if top right criteria would run into the achievement shield, move them all down 1 row
			-- this assumes description is 1 or 2 lines, otherwise this wouldn't be a problem
			if ( self:GetCriteria(2).Name:GetStringWidth() > FORCE_COLUMNS_RIGHT_COLUMN_SPACE and progressBars == 0 ) then
				AddExtraCriteriaRow();
			end
		end
		if ( numColumns > 1 ) then
			local step;
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
			numCriteriaRows = ceil(numCriteriaRows/numColumns);
		end
	end
	numCriteriaRows = numCriteriaRows + numExtraCriteriaRows;
	if ( firstMetaCriteria ) then
		local yOffsetMeta = -8 - numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
		if ( metas == 1 ) then
			firstMetaCriteria:SetPoint("TOP", self, "TOP", 0, yOffsetMeta);
		else
			firstMetaCriteria:SetPoint("TOPLEFT", self, "TOPLEFT", 20, yOffsetMeta);
		end
	end
	local height = numMetaRows * ACHIEVEMENTBUTTON_METAROWHEIGHT + numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	if ( metas > 0 or progressBars > 0 ) then
		height = height + 10;
	end
	self:SetHeight(height);
	self.mode = self.Modes.Criteria;
end