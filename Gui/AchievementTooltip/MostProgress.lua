local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local numCriteria;
function section:CheckAdd(achievement)
	if achievement.IsCompleted or achievement.IsAccountWide or achievement.TransmogSets or addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters <= 0 then
		return;
	end
	local state = achievement:GetObtainableState();
	local pastObtainable = state and (not state or state == "Past");
	if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show or pastObtainable then
		return;
	end
	numCriteria = addon.GetAchievementNumCriteria(achievement.Id);
	return numCriteria > 0;
end

local function GetProgressScore(character, guid, achievementId)
	if character.ExcludeFromMostProgressAchievementTooltip then
		return;
	end
	if not KrowiAF_Achievements.NotCompleted[achievementId] or not KrowiAF_Achievements.NotCompleted[achievementId][guid] then
		return;
	end
	local achievementProgress = KrowiAF_Achievements.NotCompleted[achievementId][guid];
	if not achievementProgress then
		return;
	end

	local score = 0;
	for _, progress in next, achievementProgress do
		if type(progress) == "boolean" and progress then
			score = score + 1;
		elseif type(progress) == "number" then
			score = score + progress;
		end
	end
	return score;
end

local function GetAchievementData(guid, achievementId)
	if not KrowiAF_Achievements.NotCompleted[achievementId] or not KrowiAF_Achievements.NotCompleted[achievementId][guid] then
		return;
	end
	local achievementProgress = KrowiAF_Achievements.NotCompleted[achievementId][guid];
	if not achievementProgress then
		return;
	end
	local achievementNumCriteria = GetAchievementNumCriteria(achievementId);
	local details = {};
	for i = 1, achievementNumCriteria do
		local criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementId, i);
		local progress = achievementProgress[i];
		if type(progress) == "boolean" and progress then
			completed = true;
			quantity = reqQuantity;
		elseif type(progress) == "number" then
			completed = progress >= reqQuantity;
			quantity = progress;
		end
		tinsert(details, {criteriaString, completed, quantity, reqQuantity, hasValueProgress});
	end
	return details;
end

local sortFuncs = {
    addon.Objects.CompareFunc:New("number", "Score");
    addon.Objects.CompareFunc:New("string", "Name");
    addon.Objects.CompareFunc:New("string", "Realm");
    addon.Objects.CompareFunc:New("number", "Faction");
    addon.Objects.CompareFunc:New("string", "Class");
};

local function Sort(characters)
	sortFuncs[1].Reverse = true;

    local sortFunc = sortFuncs[1];
    for i = 1, #sortFuncs - 1 do
        sortFuncs[i].Fallback = sortFuncs[i + 1];
    end
    sortFuncs[#sortFuncs]:SetDefaultFallback();

    table.sort(characters, function(a, b)
        return sortFunc:Compare(a, b);
    end);
end

local function BuildCharacterList(achievement)
	local characters = {};
	for guid, character in next, KrowiAF_SavedData.CharacterList do
		local score = GetProgressScore(character, guid, achievement.Id);
		if score then
			tinsert(characters, {
				Name = character.Name,
				Realm = character.Realm,
				Class = character.Class,
				Faction = character.Faction,
				Guid = guid,
				Score = score
			});
		end
	end
    Sort(characters);
	return characters;
end

local function AddName(character, achievement, thisRealm, names, numberOfNames)
	local _, _, _, argbHex = GetClassColor(character.Class);
	local name = "|c" .. argbHex .. character.Name;
	if achievement.OtherFactionAchievementId and character.Faction and character.Faction ~= achievement.Faction then
		name = name .. " (" .. addon.L[character.Faction] .. ")";
	end
	if addon.Options.db.profile.Tooltip.Achievements.MostProgress.AlwaysShowRealm or character.Realm ~= thisRealm then
		name = name .. " - " .. character.Realm;
	end
	name = name .. "|r";
	name = name .. " (" .. character.Score .. ")";
	names = names == "" and name or names .. ", " .. name;
	numberOfNames = numberOfNames + 1;
	return names, numberOfNames;
end

local function GetNames(characters, achievement)
	local thisGuid = UnitGUID("player");
	local thisCharacter = KrowiAF_SavedData.CharacterList[thisGuid];
	local thisRealm = thisCharacter.Realm;
	local names = "";
	local numberOfNames = 0;
	for _, character in next, characters do
		if numberOfNames >= addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters then
			return names;
		end
		names, numberOfNames = AddName(character, achievement, thisRealm, names, numberOfNames);
	end
	return names;
end

function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Most progress"]);

	local characters = BuildCharacterList(achievement);
	if not characters or #characters == 0 then
		GameTooltip:AddLine(addon.L["No characters found"]:SetColorRed());
		return;
	end

	local achievementData = GetAchievementData(characters[1].Guid, achievement.Id);
	if not achievementData then
		GameTooltip:AddLine(addon.L["No data found"]:SetColorRed());
		return;
	end

	local names = GetNames(characters, achievement);
	GameTooltip:AddLine(names);
	addon.Gui.AchievementTooltip:AddCriteria(achievementData, numCriteria);
end