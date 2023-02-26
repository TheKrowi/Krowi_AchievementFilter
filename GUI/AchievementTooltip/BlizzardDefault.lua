-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return true;
end

local function IsEarnedByThisCharacter(achievement)
	local thisGuid = UnitGUID("player");
	local thisCharacter = SavedData.Characters[thisGuid];
	return thisCharacter.CompletedAchievements and thisCharacter.CompletedAchievements[achievement.Id];
end

local function AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character)
	if character.ExcludeFromEarnedByAchievementTooltip then
		return numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy;
	end
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

local function EvaluateCharacters(achievement)
	local numEarnedBy, numNotEarnedBy = 0, 0;
	local earnedBy, notEarnedBy = "", "";
	local thisGuid = UnitGUID("player");
	local thisCharacter = SavedData.Characters[thisGuid];
	local thisRealm = thisCharacter.Realm;
	local numEarnedByChar = addon.Options.db.Tooltip.Achievements.EarnedBy.Characters;
	local numNotEarnedByChar = addon.Options.db.Tooltip.Achievements.EarnedBy.NotCharacters;
	numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, thisCharacter);
	for guid, character in next, SavedData.Characters do
		if guid ~= thisGuid and (numEarnedBy < numEarnedByChar or numNotEarnedBy < numNotEarnedByChar) then
			numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character);
		end
	end
	return earnedBy, notEarnedBy;
end

function section.Add(achievement)
	if achievement.IsAccountWide then
		if achievement.IsCompleted then
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED);
		else
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT);
		end
		return;
	end
	local earnedByThisCharacter = IsEarnedByThisCharacter(achievement);
	local earnedBy, notEarnedBy = EvaluateCharacters(achievement);
	if earnedBy ~= "" then
		GameTooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy), nil, nil, nil, true);
	end
	if notEarnedBy ~= "" and (addon.Options.db.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter ~= earnedByThisCharacter) then
		GameTooltip:AddLine(format(addon.L["Not earned by:"], notEarnedBy), nil, nil, nil, true);
	end
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);