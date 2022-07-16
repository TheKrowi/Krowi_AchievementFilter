-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementButton.Display = {};
local display = addon.GUI.AchievementButton.Display;

-- This file will contain a lot of copied code from Blizzard_AchievementUI.lua that needs little changes here and there
-- in order to properly work with this addon

local ACHIEVEMENTUI_MAX_LINES_COLLAPSED = 3;
local FORCE_COLUMNS_MAX_WIDTH = 220;
local FORCE_COLUMNS_MIN_CRITERIA = 20;
local FORCE_COLUMNS_LEFT_OFFSET = -10;
local FORCE_COLUMNS_RIGHT_OFFSET = 24;
local FORCE_COLUMNS_RIGHT_COLUMN_SPACE = 150;

local OnEnter;
function display:DisplayObjectives(renderOffScreen, achievementsFrame)
	local objectives = AchievementFrameAchievementsObjectives;
	if renderOffScreen then
		objectives = AchievementFrameAchievementsObjectivesOffScreen;
	end
	local topAnchor = self.hiddenDescription;
	objectives:ClearAllPoints();
	objectives:SetParent(self);
	objectives:Show();
	objectives.completed = self.completed;
	local height = ACHIEVEMENTBUTTON_COLLAPSEDHEIGHT;
	if objectives.id == self.id and not renderOffScreen then
		local ACHIEVEMENTMODE_CRITERIA = 1;
		if objectives.mode == ACHIEVEMENTMODE_CRITERIA then
			if objectives:GetHeight() > 0 then
				objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
				objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, 0);
				objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
			end
		else
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
		end
	elseif self.completed and GetPreviousAchievement(self.id) then
		objectives:SetHeight(0);
		self.ResetCriteria(renderOffScreen);
		AchievementButton_ResetProgressBars(renderOffScreen);
		AchievementButton_ResetMiniAchievements(renderOffScreen);
		self.ResetMetas(renderOffScreen);
		-- Don't show previous achievements when we render this offscreeen
		if ( not renderOffScreen ) then
			AchievementObjectives_DisplayProgressiveAchievement(objectives, self.id);
		end
		objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
	else
		objectives:SetHeight(0);
		self.ResetCriteria(renderOffScreen);
		AchievementButton_ResetProgressBars(renderOffScreen);
		AchievementButton_ResetMiniAchievements(renderOffScreen);
		self.ResetMetas(renderOffScreen);
		display.DisplayCriteria(objectives, self.id, renderOffScreen, achievementsFrame);
		if ( objectives:GetHeight() > 0 ) then
			objectives:SetPoint("TOP", topAnchor, "BOTTOM", 0, -8);
			objectives:SetPoint("LEFT", "$parentIcon", "RIGHT", -5, -25);
			objectives:SetPoint("RIGHT", "$parentShield", "LEFT", -10, 0);
		end
	end
	height = height + objectives:GetHeight();
	if height ~= addon.Options.db.Achievements.ButtonCollapsedHeight or self.numLines > ACHIEVEMENTUI_MAX_LINES_COLLAPSED then
		self.hiddenDescription:Show();
		self.description:Hide();
		local descriptionHeight = self.hiddenDescription:GetHeight();
		height = height + descriptionHeight - ACHIEVEMENTBUTTON_DESCRIPTIONHEIGHT;
		if self.reward:IsShown() then
			height = height + 4;
		end
	end
	-- Don't cache if we are rendering offscreen
	if not renderOffScreen then
		objectives.id = self.id;
	end
	return height;
end

local metaCriteriaTable = {};
local metaCriteriaTableOffScreen = {};
local criteriaTable = {}
local criteriaTableOffScreen = {};

function display.DisplayCriteria(objectivesFrame, id, renderOffScreen, achievementsFrame)
	if not id then
		return;
	end
	local yOffset = 0;
	local ACHIEVEMENTMODE_CRITERIA = 1;
	local numMetaRows = 0;
	local numCriteriaRows = 0;
	local numExtraCriteriaRows = 0;
	local function AddExtraCriteriaRow()
		numExtraCriteriaRows = numExtraCriteriaRows + 1;
		yOffset = -numExtraCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	end
	local requiresRep, hasRep, repLevel;
	if not objectivesFrame.completed then
		requiresRep, hasRep, repLevel = GetAchievementGuildRep(id);
		if requiresRep then
			local gender = UnitSex("player");
			local factionStandingtext = GetText("FACTION_STANDING_LABEL"..repLevel, gender);
			objectivesFrame.repCriteria:SetFormattedText(ACHIEVEMENT_REQUIRES_GUILD_REPUTATION, factionStandingtext);
			if hasRep then
				objectivesFrame.repCriteria:SetTextColor(0, 1, 0);
			else
				objectivesFrame.repCriteria:SetTextColor(1, 0, 0);
			end
			objectivesFrame.repCriteria:Show();
			AddExtraCriteriaRow();
		end
	end
	local numCriteria = GetAchievementNumCriteria(id);
	if numCriteria == 0 and not requiresRep then
		objectivesFrame.mode = ACHIEVEMENTMODE_CRITERIA;
		objectivesFrame:SetHeight(0);
		return;
	end
	-- text check width
	if not objectivesFrame.textCheckWidth then
		local criteria = display.GetCriteria(1, renderOffScreen);
		criteria.name:SetText("- ");
		objectivesFrame.textCheckWidth = criteria.name:GetStringWidth();
	end
	local frameLevel = objectivesFrame:GetFrameLevel() + 1;
	-- Why textStrings? You try naming anything just "string" and see how happy you are.
	local textStrings, progressBars, metas = 0, 0, 0;
	local firstMetaCriteria;
	local maxCriteriaWidth = 0;
	local yPos;
	for i = 1, numCriteria do
		local criteriaString, criteriaType, completed, quantity, reqQuantity, charName, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, i);
		if ( criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID ) then
			metas = metas + 1;
			local metaCriteria = display.GetMeta(metas, renderOffScreen, achievementsFrame);
			metaCriteria:ClearAllPoints();
			if ( metas == 1 ) then
				-- this will be anchored below, we need to know how many text criteria there are
				firstMetaCriteria = metaCriteria;
				numMetaRows = numMetaRows + 1;
			elseif ( math.fmod(metas, 2) == 0 ) then
				local anchorMeta = display.GetMeta(metas - 1, renderOffScreen, achievementsFrame);
				metaCriteria:SetPoint("LEFT", anchorMeta, "RIGHT", 35, 0);
			else
				local anchorMeta = display.GetMeta(metas - 2, renderOffScreen, achievementsFrame);
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
			if objectivesFrame.completed and completed then
				metaCriteria.check:Show();
				metaCriteria.border:SetVertexColor(1, 1, 1, 1);
				metaCriteria.icon:SetVertexColor(1, 1, 1, 1);
				metaCriteria.label:SetShadowOffset(0, 0)
				metaCriteria.label:SetTextColor(0, 0, 0, 1);
			elseif completed then
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
			metaCriteria:SetParent(objectivesFrame);
			metaCriteria:Show();
		elseif ( bit.band(flags, EVALUATION_TREE_FLAG_PROGRESS_BAR) == EVALUATION_TREE_FLAG_PROGRESS_BAR ) then
			-- Display this criteria as a progress bar!
			progressBars = progressBars + 1;
			local progressBar = AchievementButton_GetProgressBar(progressBars, renderOffScreen);
			if ( progressBars == 1 ) then
				progressBar:SetPoint("TOP", objectivesFrame, "TOP", 4, -4 + yOffset);
			else
				progressBar:SetPoint("TOP", AchievementButton_GetProgressBar(progressBars-1, renderOffScreen), "BOTTOM", 0, 0);
			end
			progressBar.text:SetText(string.format("%s", quantityString));
			progressBar:SetMinMaxValues(0, reqQuantity);
			progressBar:SetValue(quantity);
			progressBar:SetParent(objectivesFrame);
			progressBar:Show();
			numCriteriaRows = numCriteriaRows + 1;
		else
			textStrings = textStrings + 1;
			local criteria = display.GetCriteria(textStrings, renderOffScreen);
			criteria:ClearAllPoints();
			if ( textStrings == 1 ) then
				if ( numCriteria == 1 ) then
					criteria:SetPoint("TOP", objectivesFrame, "TOP", -14, yOffset);
				else
					criteria:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", 0, yOffset);
				end
			else
				criteria:SetPoint("TOPLEFT", display.GetCriteria(textStrings-1, renderOffScreen), "BOTTOMLEFT", 0, 0);
			end
			if objectivesFrame.completed and completed then
				criteria.name:SetTextColor(0, 0, 0, 1);
				criteria.name:SetShadowOffset(0, 0);
			elseif completed then
				criteria.name:SetTextColor(0, 1, 0, 1);
				criteria.name:SetShadowOffset(1, -1);
			else
				criteria.name:SetTextColor(.6, .6, .6, 1);
				criteria.name:SetShadowOffset(1, -1);
			end
			local stringWidth = 0;
			local maxCriteriaContentWidth;
			if completed then
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - ACHIEVEMENTUI_CRITERIACHECKWIDTH;
				criteria.check:SetPoint("LEFT", 18, -3);
				criteria.name:SetPoint("LEFT", criteria.check, "RIGHT", 0, 2);
				criteria.check:Show();
				criteria.name:SetText(criteriaString);
				stringWidth = min(criteria.name:GetStringWidth(),maxCriteriaContentWidth);
			else
				maxCriteriaContentWidth = ACHIEVEMENTUI_MAXCONTENTWIDTH - objectivesFrame.textCheckWidth;
				criteria.check:SetPoint("LEFT", 0, -3);
				criteria.name:SetPoint("LEFT", criteria.check, "RIGHT", 5, 2);
				criteria.check:Hide();
				criteria.name:SetText("- "..criteriaString);
				stringWidth = min(criteria.name:GetStringWidth() - objectivesFrame.textCheckWidth,maxCriteriaContentWidth);	-- don't want the "- " to be included in the width
			end
			if criteria.name:GetWidth() > maxCriteriaContentWidth then
				criteria.name:SetWidth(maxCriteriaContentWidth);
			end
			criteria:SetParent(objectivesFrame);
			criteria:Show();
			criteria:SetWidth(stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			maxCriteriaWidth = max(maxCriteriaWidth, stringWidth + ACHIEVEMENTUI_CRITERIACHECKWIDTH);
			numCriteriaRows = numCriteriaRows + 1;
		end
	end
	if textStrings > 0 and progressBars > 0 then
		-- If we have text criteria and progressBar criteria, display the progressBar criteria first and position the textStrings under them.
		local criTable = display.GetCriteria(1, renderOffScreen);
		criTable:ClearAllPoints();
		if ( textStrings == 1 ) then
			criTable:SetPoint("TOP", AchievementButton_GetProgressBar(progressBars, renderOffScreen), "BOTTOM", -14, -4);
		else
			criTable:SetPoint("TOP", AchievementButton_GetProgressBar(progressBars, renderOffScreen), "BOTTOM", 0, -4);
			criTable:SetPoint("LEFT", objectivesFrame, "LEFT", 0, 0);
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
			if ( display.GetCriteria(2, renderOffScreen).name:GetStringWidth() > FORCE_COLUMNS_RIGHT_COLUMN_SPACE and progressBars == 0 ) then
				AddExtraCriteriaRow();
			end
		end
		if ( numColumns > 1 ) then
			local step;
			local rows = 1;
			local position = 0;
			local criTable = criteriaTable;
			if (renderOffScreen) then
				criTable = criteriaTableOffScreen;
			end
			for i=1, #criTable do
				position = position + 1;
				if ( position > numColumns ) then
					position = position - numColumns;
					rows = rows + 1;
				end
				if ( rows == 1 ) then
					criTable[i]:ClearAllPoints();
					local xOffset = 0;
					if ( forceColumns ) then
						if ( position == 1 ) then
							xOffset = FORCE_COLUMNS_LEFT_OFFSET;
						elseif ( position == 2 ) then
							xOffset = FORCE_COLUMNS_RIGHT_OFFSET;
						end
					end
					criTable[i]:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", (position - 1)*(ACHIEVEMENTUI_MAXCONTENTWIDTH/numColumns) + xOffset, yOffset);
				else
					criTable[i]:ClearAllPoints();
					criTable[i]:SetPoint("TOPLEFT", criTable[position + ((rows - 2) * numColumns)], "BOTTOMLEFT", 0, 0);
				end
			end
			numCriteriaRows = ceil(numCriteriaRows/numColumns);
		end
	end
	numCriteriaRows = numCriteriaRows + numExtraCriteriaRows;
	if ( firstMetaCriteria ) then
		local yOffsetMeta = -8 - numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
		if ( metas == 1 ) then
			firstMetaCriteria:SetPoint("TOP", objectivesFrame, "TOP", 0, yOffsetMeta);
		else
			firstMetaCriteria:SetPoint("TOPLEFT", objectivesFrame, "TOPLEFT", 20, yOffsetMeta);
		end
	end
	local height = numMetaRows * ACHIEVEMENTBUTTON_METAROWHEIGHT + numCriteriaRows * ACHIEVEMENTBUTTON_CRITERIAROWHEIGHT;
	if ( metas > 0 or progressBars > 0 ) then
		height = height + 10;
	end
	objectivesFrame:SetHeight(height);
	objectivesFrame.mode = ACHIEVEMENTMODE_CRITERIA;
end

function display.ResetMetas(renderOffScreen)
	if renderOffScreen then
		AchievementButton_ResetTable(metaCriteriaTableOffScreen);
	else
		AchievementButton_ResetTable(metaCriteriaTable);
	end
end

function display.GetMeta(index, renderOffScreen, achievementsFrame)
	local mcTable = metaCriteriaTable;
	local offscreenName = "";
	if renderOffScreen then
		mcTable = metaCriteriaTableOffScreen;
		offscreenName = "OffScreen";
	end
	if not mcTable[index] then
		local frame = CreateFrame("BUTTON", "KrowiAF_AchievementFrameMeta" .. offscreenName .. index, AchievementFrameAchievements, "MetaCriteriaTemplate");
		frame:SetScript("OnClick", function()
            KrowiAF_SelectAchievementFromID(frame.id, nil, true);
        end);
		frame:SetScript("OnEnter", OnEnter);
		AchievementButton_LocalizeMetaAchievement(frame);
		mcTable[index] = frame;
	end
	if mcTable[index].guildView ~= addon.InGuildView() then
		AchievementButton_ToggleMetaView(mcTable[index]);
	end
	return mcTable[index];
end

function display.ResetCriteria(renderOffScreen)
	if renderOffScreen then
		AchievementFrameAchievementsObjectivesOffScreen.repCriteria:Hide();
		AchievementButton_ResetTable(criteriaTableOffScreen);
	else
		AchievementFrameAchievementsObjectives.repCriteria:Hide();
		AchievementButton_ResetTable(criteriaTable);
	end
end

function display.GetCriteria(index, renderOffScreen)
	local criTable = criteriaTable;
	local offscreenName = "";
	if renderOffScreen then
		criTable = criteriaTableOffScreen;
		offscreenName = "OffScreen";
	end
	if criTable[index] then
		return criTable[index];
	end
	local frame = CreateFrame("FRAME", "KrowiAF_AchievementFrameCriteria" .. offscreenName .. index, AchievementFrameAchievements, "AchievementCriteriaTemplate");
    frame:EnableMouse(false);
	AchievementFrame_LocalizeCriteria(frame);
	criTable[index] = frame;
	return frame;
end

function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", self, "BOTTOMLEFT");
	local link = GetAchievementLink(self.id);
	GameTooltip:SetHyperlink(link);
	AchievementFrameAchievements_CheckGuildMembersTooltip(self);
	GameTooltip:Show();
	if GameTooltip:GetTop() > self:GetBottom() then
		GameTooltip:ClearAllPoints();
		GameTooltip:SetPoint("BOTTOMLEFT", self, "TOPLEFT");
	end
end