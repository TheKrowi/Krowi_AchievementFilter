-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementTooltip = {};
local tooltip = addon.GUI.AchievementTooltip;
tooltip.Sections = {};
local sections = tooltip.Sections;

function tooltip.AddAchievementLine(currentAchievement, otherAchievementId, showCurrentCharacterIcons, nameSuffix, otherFactionAchievementCompleted)
	nameSuffix = nameSuffix or "";
	local _, name, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(otherAchievementId);
	completed = otherFactionAchievementCompleted or completed;
	local icon, currentCharacterIcon, color = nil, "", nil;

	local sameAchievement = otherAchievementId == currentAchievement.Id;
	local state;
	if currentAchievement.TemporaryObtainable then
		state = currentAchievement.TemporaryObtainable.Obtainable();
	end
	if completed then
		icon = "|T136814:0|t";
		color = sameAchievement and addon.Colors.LightGreenRGB or addon.Colors.GreenRGB;
	elseif state and (not state or state == "Past") then
		icon = "|T136813:0|t";
		color = sameAchievement and addon.Colors.LightRedRGB or addon.Colors.RedRGB;
	else
		icon = "|T136815:0|t";
		color = sameAchievement and addon.Colors.LightGreyRGB or addon.Colors.GreyRGB;
	end

	if showCurrentCharacterIcons then
		if wasEarnedByMe then
			currentCharacterIcon = "|T136814:0|t";
		elseif state and (not state or state == "Past") then
			currentCharacterIcon = "|T136813:0|t";
		else
			currentCharacterIcon = "|T136815:0|t";
		end
		currentCharacterIcon = currentCharacterIcon .. addon.L["TAB"];
	end

	GameTooltip:AddLine(icon .. addon.L["TAB"] .. currentCharacterIcon .. name .. nameSuffix, color.R, color.G, color.B); -- Achievement name
end

local function AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character)
	local _, _, _, argbHex = GetClassColor(character.Class);
	local name = "|c" .. argbHex .. character.Name;
	if achievement.OtherFactionAchievementId and character.Faction and character.Faction ~= addon.Objects.Faction[achievement.Faction] then
		name = name .. " (" .. addon.L[character.Faction] .. ")";
	end
	if addon.Options.db.Tooltip.Achievements.EarnedBy.AlwaysShowRealm or character.Realm ~= thisRealm then
		name = name .. " - " .. character.Realm;
	end
	name = name .. "|r";
	if character.CompletedAchievements then
		if character.CompletedAchievements[achievement.Id] or (achievement.OtherFactionAchievementId and character.CompletedAchievements[achievement.OtherFactionAchievementId]) then
			if numEarnedBy < addon.Options.db.Tooltip.Achievements.EarnedBy.Characters then
				earnedBy = earnedBy == "" and name or earnedBy .. ", " .. name;
				numEarnedBy = numEarnedBy + 1;
			end
		else
			if addon.Objects.Faction[achievement.Faction] == character.Faction or achievement.Faction == nil or achievement.OtherFactionAchievementId ~= nil then
				if numNotEarnedBy < addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters then
					notEarnedBy = notEarnedBy == "" and name or notEarnedBy .. ", " .. name;
					numNotEarnedBy = numNotEarnedBy + 1;
				end
			end
		end
	end
	return numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy;
end

local earnedBy, notEarnedBy, otherFactionAchievementCompleted, earnedByThisCharacter, cachedAchievementId;
function tooltip.EvaluateCharacters(achievement)
	if cachedAchievementId == achievement.Id then
		return earnedBy, notEarnedBy, otherFactionAchievementCompleted, earnedByThisCharacter;
	end
	cachedAchievementId = achievement.Id;
	local numEarnedBy, numNotEarnedBy = 0, 0;
	earnedBy, notEarnedBy = "", "";
	otherFactionAchievementCompleted = false;
	local thisGuid = UnitGUID("player");
	local thisCharacter = SavedData.Characters[thisGuid];
	local thisRealm = thisCharacter.Realm;
	local numEarnedByChar = addon.Options.db.Tooltip.Achievements.EarnedBy.Characters;
	local numNotEarnedByChar = addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters;
	numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, thisCharacter);
	if achievement.OtherFactionAchievementId and thisCharacter.CompletedAchievements and thisCharacter.CompletedAchievements[achievement.OtherFactionAchievementId] then
		otherFactionAchievementCompleted = true;
	end
	if thisCharacter.CompletedAchievements and thisCharacter.CompletedAchievements[achievement.Id] then
		earnedByThisCharacter = true;
	end
	for guid, character in next, SavedData.Characters do
		if guid ~= thisGuid and (numEarnedBy < numEarnedByChar or numNotEarnedBy < numNotEarnedByChar) then
			numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character);
		end
		if achievement.OtherFactionAchievementId and character.CompletedAchievements and character.CompletedAchievements[achievement.OtherFactionAchievementId] then
			otherFactionAchievementCompleted = true;
		end
	end
	return earnedBy, notEarnedBy, otherFactionAchievementCompleted, earnedByThisCharacter;
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

function tooltip.AddCriteriaLine(achievementId, criteriaIndex)
	local text, color = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end

function tooltip.AddDoubleCriteriaLine(achievementId, criteriaIndex1, criteriaIndex2)
	local texts = {"", ""};
	local colors = {addon.Colors.WhiteRGB, addon.Colors.WhiteRGB};
	for i, criteriaIndex in next, {criteriaIndex1, criteriaIndex2} do
		texts[i], colors[i] = GetCriteriaTextAndColor(achievementId, criteriaIndex);
	end
	GameTooltip:AddDoubleLine(texts[1], texts[2], colors[1].R, colors[1].G, colors[1].B, colors[2].R, colors[2].G, colors[2].B);
end

function tooltip.AddCriteria(customObjectives)
	if #customObjectives < addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, #customObjectives do
			tooltip.AddCriteriaLine(customObjectives, i);
		end
	else
		for i = 1, #customObjectives, 2 do
			tooltip.AddDoubleCriteriaLine(customObjectives, i, i + 1 <= #customObjectives and i + 1 or nil);
		end
	end
end

function tooltip.ShowTooltip(anchor, achievement)
	GameTooltip:SetOwner(anchor, "ANCHOR_NONE");
	GameTooltip:SetPoint("TOPLEFT", anchor, "TOPRIGHT");

	for _, sect in next, sections do
		if sect.CheckAdd(achievement) then
			if GameTooltip:NumLines() > 0 then
				GameTooltip_AddBlankLineToTooltip(GameTooltip);
			end
			sect.Add(achievement);
		end
	end

	GameTooltip:Show();
end