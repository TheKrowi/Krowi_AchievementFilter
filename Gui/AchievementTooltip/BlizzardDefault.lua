local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section.CheckAdd()
    return true;
end

local function AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character, guid)
	if character.ExcludeFromEarnedByAchievementTooltip then
		return numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy;
	end
	local _, _, _, argbHex = GetClassColor(character.Class);
	local name = "|c" .. argbHex .. character.Name;
	if achievement.OtherFactionAchievementId and character.Faction and character.Faction ~= addon.Objects.Faction[achievement.Faction] then
		name = name .. " (" .. addon.L[character.Faction] .. ")";
	end
	if addon.Options.db.profile.Tooltip.Achievements.EarnedBy.AlwaysShowRealm or character.Realm ~= thisRealm then
		name = name .. " - " .. character.Realm;
	end
	name = name .. "|r";
	if addon.Data.SavedData.AchievementData.IsEarnedByCharacter(guid, achievement) or (achievement.OtherFactionAchievementId and addon.Data.SavedData.AchievementData.IsEarnedByCharacter(guid, addon.Data.Achievements[achievement.OtherFactionAchievementId])) then
		if numEarnedBy < addon.Options.db.profile.Tooltip.Achievements.EarnedBy.Characters then
			earnedBy = earnedBy == "" and name or earnedBy .. ", " .. name;
			numEarnedBy = numEarnedBy + 1;
		end
	elseif addon.Objects.Faction[achievement.Faction] == character.Faction or achievement.Faction == nil or achievement.OtherFactionAchievementId ~= nil then
		if numNotEarnedBy < addon.Options.db.profile.Tooltip.Achievements.EarnedBy.NotCharacters then
			notEarnedBy = notEarnedBy == "" and name or notEarnedBy .. ", " .. name;
			numNotEarnedBy = numNotEarnedBy + 1;
		end
	end
	return numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy;
end

local function EvaluateCharacters(achievement)
	local numEarnedBy, numNotEarnedBy = 0, 0;
	local earnedBy, notEarnedBy = "", "";
	local thisGuid = UnitGUID("player");
	local thisCharacter = KrowiAF_SavedData.CharacterList[thisGuid];
	local thisRealm = thisCharacter.Realm;
	local numEarnedByChar = addon.Options.db.profile.Tooltip.Achievements.EarnedBy.Characters;
	local numNotEarnedByChar = addon.Options.db.profile.Tooltip.Achievements.EarnedBy.NotCharacters;
	numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, thisCharacter, thisGuid);
	for guid, character in next, KrowiAF_SavedData.CharacterList do
		if guid ~= thisGuid and (numEarnedBy < numEarnedByChar or numNotEarnedBy < numNotEarnedByChar) then
			numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy = AddName(achievement, thisRealm, numEarnedBy, earnedBy, numNotEarnedBy, notEarnedBy, character, guid);
		end
	end
	return earnedBy, notEarnedBy;
end

function section.Add(achievement)
	if achievement.IsAccountWide then
		if achievement.IsCompleted then
			GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED);
			return;
		end
		GameTooltip:AddLine(ACCOUNT_WIDE_ACHIEVEMENT);
		return;
	end

	local earnedByThisCharacter = addon.Data.SavedData.AchievementData.IsEarnedByCharacter(UnitGUID("player"), achievement);
	local earnedBy, notEarnedBy = EvaluateCharacters(achievement);
	if earnedBy ~= "" then
		GameTooltip:AddLine(format(ACHIEVEMENT_EARNED_BY, earnedBy), nil, nil, nil, true);
	end
	if notEarnedBy ~= "" and not (addon.Options.db.profile.Tooltip.Achievements.EarnedBy.HideNotEarnedByIfEarnedByCurrentCharacter and earnedByThisCharacter) then
		GameTooltip:AddLine(format(addon.L["Not earned by:"], notEarnedBy), nil, nil, nil, true);
	end
end