-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
	if not addon.Options.db.Tooltip.Achievements.ShowOtherFaction then
		return;
	end
	return achievement.OtherFactionAchievementId ~= nil;
end

local function IsOtherFactionAchievementCompleted(achievement)
	local thisGuid = UnitGUID("player");
	local thisCharacter = SavedData.Characters[thisGuid];
	if not achievement.OtherFactionAchievementId then
		return false;
	end
	if thisCharacter.CompletedAchievements and thisCharacter.CompletedAchievements[achievement.OtherFactionAchievementId] then
		return true;
	end
	for _, character in next, SavedData.Characters do
		if character.CompletedAchievements and character.CompletedAchievements[achievement.OtherFactionAchievementId] then
			return true;
		end
	end
end

function section.Add(achievement)
	local faction = addon.L["Neutral"];
	if addon.Faction.IsAlliance then
		faction = addon.L["Horde"];
	elseif addon.Faction.IsHorde then
		faction = addon.L["Alliance"];
	end
	GameTooltip:AddLine(addon.L["Other faction"] .. " (" .. faction .. ")"); -- Header

	local otherFactionAchievementCompleted = IsOtherFactionAchievementCompleted(achievement);
	addon.GUI.AchievementTooltip.AddAchievementLine(achievement, achievement.OtherFactionAchievementId, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor, nil, otherFactionAchievementCompleted);
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);