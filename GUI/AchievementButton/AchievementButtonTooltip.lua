-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementButton.Tooltip = {};
local tooltip = addon.GUI.AchievementButton.Tooltip;

local function AddAchievementLine(currentAchievement, otherAchievementID, showCurrentCharacterIcons, nameSuffix, otherFactionAchievementCompleted)
	nameSuffix = nameSuffix or "";
	local _, name, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(otherAchievementID);
	completed = otherFactionAchievementCompleted or completed;
	local icon, currentCharacterIcon, color = nil, "", nil;

	local sameAchievement = otherAchievementID == currentAchievement.ID;
	if completed then
		icon = "|T136814:0|t";
		color = sameAchievement and addon.Colors.LightGreenRGB or addon.Colors.GreenRGB;
	elseif currentAchievement.NotObtainable then
		icon = "|T136813:0|t";
		color = sameAchievement and addon.Colors.LightRedRGB or addon.Colors.RedRGB;
	else
		icon = "|T136815:0|t";
		color = sameAchievement and addon.Colors.LightGreyRGB or addon.Colors.GreyRGB;
	end

	if showCurrentCharacterIcons then
		if wasEarnedByMe then
			currentCharacterIcon = "|T136814:0|t";
		elseif currentAchievement.NotObtainable then
			currentCharacterIcon = "|T136813:0|t";
		else
			currentCharacterIcon = "|T136815:0|t";
		end
		currentCharacterIcon = currentCharacterIcon .. addon.L["TAB"];
	end

	GameTooltip:AddLine(icon .. addon.L["TAB"] .. currentCharacterIcon .. name .. nameSuffix, color.R, color.G, color.B); -- Achievement name
end

local function EvaluateCharacters(self)
	local numEarnedBy, numNotEarnedBy = 0, 0;
	local earnedBy, notEarnedBy = "", "";
	local otherFactionAchievementCompleted = false;
	local thisName, thisRealm = UnitFullName("player");
	for _, character in next, SavedData.Characters do
		local _, _, _, argbHex = GetClassColor(character.Class);
		local name = "|c" .. argbHex .. character.Name;
		if self.Achievement.OtherFactionAchievementID and character.Faction and character.Faction ~= addon.Objects.Faction[self.Achievement.Faction] then
			name = name .. " (" .. addon.L[character.Faction] .. ")";
		end
		if addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm or character.Realm ~= thisRealm then
			name = name .. " - " .. character.Realm;
		end
			name = name .. "|r";
		if character.CompletedAchievements then
			if character.CompletedAchievements[self.Achievement.ID] or (self.Achievement.OtherFactionAchievementID and character.CompletedAchievements[self.Achievement.OtherFactionAchievementID]) then
				if numEarnedBy < addon.Options.db.Tooltip.Achievements.EarnedBy.Characters then
					earnedBy = earnedBy == "" and name or (character.Name == thisName and name .. ", " .. earnedBy or earnedBy .. ", " .. name);
					numEarnedBy = numEarnedBy + 1;
				end
			else
				if addon.Objects.Faction[self.Achievement.Faction] == character.Faction or self.Achievement.Faction == nil or self.Achievement.OtherFactionAchievementID ~= nil then
					if numNotEarnedBy < addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters then
						notEarnedBy = notEarnedBy == "" and name or (character.Name == thisName and name .. ", " .. notEarnedBy or notEarnedBy .. ", " .. name);
						numNotEarnedBy = numNotEarnedBy + 1;
					end
				end
			end
		end
		if numEarnedBy >= addon.Options.db.Tooltip.Achievements.EarnedBy.Characters and numNotEarnedBy >= addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters then
			break;
		end
		if self.Achievement.OtherFactionAchievementID and character.CompletedAchievements[self.Achievement.OtherFactionAchievementID] then
			otherFactionAchievementCompleted = true;
		end
	end
	return earnedBy, notEarnedBy, otherFactionAchievementCompleted;
end

local function AddBlizzardDefault(self, earnedBy, notEarnedBy)
	if GameTooltip:NumLines() > 0 then
		GameTooltip_AddBlankLineToTooltip(GameTooltip);
	end
	if self.accountWide then
		if self.completed then
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED);
		else
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT);
		end
		return;
	end
	if earnedBy ~= "" then
		GameTooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy), nil, nil, nil, true);
	end
	if notEarnedBy ~= "" then
		GameTooltip:AddLine(format(addon.L["Not earned by:"], notEarnedBy), nil, nil, nil, true);
	end
end

local function AddNotObtainable()
	if GameTooltip:NumLines() > 0 then
		GameTooltip_AddBlankLineToTooltip(GameTooltip);
	end
	local color = addon.Colors.RedRGB;
	GameTooltip:AddLine(addon.L["This achievement is no longer obtainable"], color.R, color.G, color.B);
end

local function AddPartOfAChainAchievement(currentAchievement, achID, nameSuffix)
	AddAchievementLine(currentAchievement, achID, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain, nameSuffix);
	if addon.Data.Achievements[achID].NextAchievements == nil then
		return;
	end
	for id, _ in next, addon.Data.Achievements[achID].NextAchievements do
		if addon.Data.Achievements[achID].NumNextAchievements > 1 then
			if addon.Data.Achievements[id].Faction then
				nameSuffix = " (";
				if addon.Data.Achievements[id].Faction then
					nameSuffix = nameSuffix .. addon.L[addon.Objects.Faction[addon.Data.Achievements[id].Faction]];
					nameSuffix = nameSuffix .. ")";
				end
			end
		end
		AddPartOfAChainAchievement(currentAchievement, id, nameSuffix);
	end
end

local function AddPartOfAChain(self, validate, filters)
	if not addon.Options.db.Tooltip.Achievements.ShowPartOfAChain then
		return;
	end

	local achID = addon.GetFirstAchievementID(self.Achievement.ID);
	if addon.Data.Achievements[achID].NextAchievements == nil then
		return;
	end

	if GameTooltip:NumLines() > 0 then
		GameTooltip_AddBlankLineToTooltip(GameTooltip);
	end
	GameTooltip:AddLine(addon.L["Part of a chain"]); -- Header

	AddPartOfAChainAchievement(self.Achievement, achID);
end

local function AddRequiredFor(self, validate, filters)
	if not addon.Options.db.Tooltip.Achievements.ShowRequiredFor then
		return;
	end

	local requiredForIDs = self.Achievement:GetRequiredForIDs(validate, filters);
	if #requiredForIDs == 0 then
		return;
	end

	if GameTooltip:NumLines() > 0 then
		GameTooltip_AddBlankLineToTooltip(GameTooltip);
	end
	GameTooltip:AddLine(addon.L["Required for"]); -- Header

	for _, id in next, requiredForIDs do
		AddAchievementLine(self.Achievement, id, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor);
	end
end

local function GetCriteriaTextAndColor(achievementID, criteriaIndex)
	local criteriaString, completed, quantity, reqQuantity;
	if type(achievementID) == "table" then
		criteriaString, completed, quantity, reqQuantity = unpack(achievementID[criteriaIndex]);
	else
		criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _ = GetAchievementCriteriaInfo(achievementID, criteriaIndex);
	end
	local icon, color;
	if criteriaString ~= "" or (quantity ~= nil and reqQuantity ~= nil and not (quantity == 0 and (reqQuantity == 0 or reqQuantity == 1))) then
		if completed then
			icon = "|T136814:0|t";
			color = addon.Colors.GreenRGB;
		else
			icon = "|T136815:0|t";
			color = addon.Colors.GreyRGB;
		end
	end
	local text = criteriaString;
	if not completed and quantity ~= nil and reqQuantity ~= nil and not (quantity == 0 and (reqQuantity == 0 or reqQuantity == 1)) then
		text = text .. (text ~= "" and " " or "") .. "(" .. tostring(quantity) .. "/" .. tostring(reqQuantity) .. ")";
	end
	if icon then
		text = icon .. addon.L["TAB"] .. (text or "");
	end

	return text or "", color or addon.Colors.WhiteRGB;
end

local function AddCriteriaLine(achievementID, criteriaIndex)
	local text, color = GetCriteriaTextAndColor(achievementID, criteriaIndex);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end

local function AddDoubleCriteriaLine(achievementID, criteriaIndex1, criteriaIndex2)
	local texts = {"", ""};
	local colors = {addon.Colors.WhiteRGB, addon.Colors.WhiteRGB};
	for i, criteriaIndex in next, {criteriaIndex1, criteriaIndex2} do
		texts[i], colors[i] = GetCriteriaTextAndColor(achievementID, criteriaIndex);
	end
	GameTooltip:AddDoubleLine(texts[1], texts[2], colors[1].R, colors[1].G, colors[1].B, colors[2].R, colors[2].G, colors[2].B);
end

local function AddObjectives(self)
	if not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show or self.Achievement.NotObtainable then
		return;
	end

	if self.completed and not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted then
		return;
	end

	local id = self.Achievement.ID;
	local numCriteria = GetAchievementNumCriteria(id);
	if numCriteria > 0 or type(self.Achievement.CustomObjectives) == "function" then
		if GameTooltip:NumLines() > 0 then
			-- GameTooltip:AddLine(" "); -- Empty line to seperate it from the previous block
			GameTooltip_AddBlankLineToTooltip(GameTooltip);
		end
		GameTooltip:AddLine(addon.L["Objectives progress"]); -- Header
	end
	if type(self.Achievement.CustomObjectives) == "function" then
		self.Achievement.CustomObjectives(GameTooltip);
	elseif numCriteria > 0 then
		if numCriteria < addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
			for i = 1, numCriteria do
				AddCriteriaLine(id, i);
			end
		else
			for i = 1, numCriteria, 2 do
				AddDoubleCriteriaLine(id, i, i + 1 <= numCriteria and i + 1 or nil);
			end
		end
	end
end

local function AddOtherFaction(self, otherFactionAchievementCompleted)
	if not addon.Options.db.Tooltip.Achievements.ShowOtherFaction then
		return;
	end

	if self.Achievement.OtherFactionAchievementID == nil then
		return;
	end

	if GameTooltip:NumLines() > 0 then
		GameTooltip_AddBlankLineToTooltip(GameTooltip);
	end
	local faction = addon.L["Neutral"];
	if addon.Faction.IsAlliance then
		faction = addon.L["Horde"];
	elseif addon.Faction.IsHorde then
		faction = addon.L["Alliance"];
	end
	GameTooltip:AddLine(addon.L["Other faction"] .. " (" .. faction .. ")"); -- Header

	AddAchievementLine(self.Achievement, self.Achievement.OtherFactionAchievementID, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor, nil, otherFactionAchievementCompleted);
end

function tooltip.AddCriteria(customObjectives)
	if #customObjectives < addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, #customObjectives do
			AddCriteriaLine(customObjectives, i);
		end
	else
		for i = 1, #customObjectives, 2 do
			AddDoubleCriteriaLine(customObjectives, i, i + 1 <= #customObjectives and i + 1 or nil);
		end
	end
end

function tooltip.ShowTooltip(button, validate, filters, addBlizzardDefault, addNotObtainable, addPartOfAChain, addRequiredFor, addObjectives, addOtherFaction)
	GameTooltip:SetOwner(button, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", button, "TOPRIGHT");

	local earnedBy, notEarnedBy, otherFactionAchievementCompleted = EvaluateCharacters(button);

	if button.Achievement.NotObtainable and addNotObtainable ~= false then
		AddNotObtainable();
	end
	if addBlizzardDefault ~= false then
		AddBlizzardDefault(button, earnedBy, notEarnedBy);
	end
	if addPartOfAChain ~= false then
		AddPartOfAChain(button, validate, filters);
	end
	if addRequiredFor ~= false then
		AddRequiredFor(button, validate, filters);
	end
	if addOtherFaction ~= false then
		AddOtherFaction(button, otherFactionAchievementCompleted);
	end
	if addObjectives ~= false then
		AddObjectives(button);
	end

	-- AchievementFrameAchievements_CheckGuildMembersTooltip(self.shield); -- Guild can be ignored for now

	GameTooltip:Show();
end