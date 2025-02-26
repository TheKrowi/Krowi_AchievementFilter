local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local firstAchievement;
function section:CheckAdd(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.ShowPartOfAChain then
		return;
	end
    local id = addon.GetFirstAchievementId(achievement.Id);
    firstAchievement = addon.Data.Achievements[id];
    return firstAchievement.NextAchievements ~= nil;
end

local function AddPartOfAChainAchievement(currentAchievement, id, nameSuffix)
	addon.Gui.AchievementTooltip:AddAchievementLine(currentAchievement, id, addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsPartOfAChain, nameSuffix);
	local achievement = addon.Data.Achievements[id];
	local nextAchievements = achievement.NextAchievements;
	if nextAchievements == nil then
		return;
	end
	for nextId, _ in next, nextAchievements do
		if achievement.NumNextAchievements > 1 then
			if addon.Data.Achievements[nextId].Faction then
				nameSuffix = " (";
				nameSuffix = nameSuffix .. addon.L[EnumUtil.GenerateNameTranslation(KrowiAF.Enum.Faction)(addon.Data.Achievements[nextId].Faction)];
				nameSuffix = nameSuffix .. ")";
			end
		end
		AddPartOfAChainAchievement(currentAchievement, nextId, nameSuffix);
	end
end

function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Part of a chain"]);
	AddPartOfAChainAchievement(achievement, firstAchievement.Id);
end