-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

local numCriteria;
function section.CheckAdd(achievement)
	if achievement.IsCompleted or achievement.IsAccountWide or addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters <= 0 then
		return;
	end
	numCriteria = GetAchievementNumCriteria(achievement.Id);
	return numCriteria > 0;
end

local function GetProgressScore(character, achievementId)
	if character.ExcludeFromMostProgressAchievementTooltip then
		return;
	end
	if not character.NotCompletedAchievements then
		return;
	end
	local achievementProgress = character.NotCompletedAchievements[achievementId];
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

local function GetDetails(character, achievementId)
	if not character.NotCompletedAchievements then
		return;
	end
	local achievementProgress = character.NotCompletedAchievements[achievementId];
	if not achievementProgress then
		return;
	end
	local achievementNumCriteria = GetAchievementNumCriteria(achievementId);
	local details = {};
	for i, progress in next, achievementProgress do
		if i <= achievementNumCriteria then
			local criteriaString, _, completed, quantity, reqQuantity, _, _, _, _, _, _, hasValueProgress = addon.GetAchievementCriteriaInfo(achievementId, i);
			if type(progress) == "boolean" and progress then
				completed = true;
				quantity = reqQuantity;
			elseif type(progress) == "number" then
				completed = progress >= reqQuantity;
				quantity = progress;
			end
			tinsert(details, {criteriaString, completed, quantity, reqQuantity, hasValueProgress});
		end
	end
	return details;
end

local sortFuncs = {
    addon.Objects.CompareFunc:New("number", "Score");
    addon.Objects.CompareFunc:New("string", "Name");
    addon.Objects.CompareFunc:New("string", "Realm");
    addon.Objects.CompareFunc:New("string", "Faction");
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

local function BuildCharactersList(achievement)
	local characters = {};
	for guid, character in next, KrowiAF_SavedData.Characters do
		local score = GetProgressScore(character, achievement.Id);
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
	if achievement.OtherFactionAchievementId and character.Faction and character.Faction ~= addon.Objects.Faction[achievement.Faction] then
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

function section.Add(achievement)
	local characters = BuildCharactersList(achievement);
	if not characters or #characters == 0 then
		return;
	end

	local thisGuid = UnitGUID("player");
	local thisCharacter = KrowiAF_SavedData.Characters[thisGuid];
	local thisRealm = thisCharacter.Realm;
	local names = "";
	local numberOfNames = 0;
	for _, character in next, characters do
		if numberOfNames < addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters then
			names, numberOfNames = AddName(character, achievement, thisRealm, names, numberOfNames);
		end
	end
	local details = GetDetails(KrowiAF_SavedData.Characters[characters[1].Guid], achievement.Id);

	GameTooltip:AddLine(addon.L["Most progress"]); -- Header
	GameTooltip:AddLine(names);

	if type(achievement.CustomObjectives) == "function" or numCriteria <= 0 or not details then
		return;
	end

	if numCriteria < addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
		for i = 1, numCriteria do
			addon.GUI.AchievementTooltip.AddCriteriaLine(details, i);
		end
	else
		for i = 1, numCriteria, 2 do
			addon.GUI.AchievementTooltip.AddDoubleCriteriaLine(details, i, i + 1 <= numCriteria and i + 1 or nil);
		end
	end
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);