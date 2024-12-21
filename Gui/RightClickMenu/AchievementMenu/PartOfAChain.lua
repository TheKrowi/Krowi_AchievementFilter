local _, addon = ...;
local section = {};
tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);

local firstAchievement;
function section:CheckAdd(achievement)
    local id = addon.GetFirstAchievementId(achievement.Id);
    firstAchievement = addon.Data.Achievements[id];
    return firstAchievement.NextAchievements ~= nil;
end

local function AddPartOfAChainAchievement(menu, id, nameSuffix)
	addon.Gui.RightClickMenu.AchievementMenu:AddGoToAchievementLine(menu, id, nameSuffix);
	local achievement = addon.Data.Achievements[id];
	local nextAchievements = achievement.NextAchievements;
	if nextAchievements == nil then
		return;
	end
	for nextId, _ in next, nextAchievements do
		if achievement.NumNextAchievements > 1 and addon.Data.Achievements[nextId].Faction then
			nameSuffix = " (";
			nameSuffix = nameSuffix .. addon.L[EnumUtil.GenerateNameTranslation(KrowiAF.Enum.Faction)(addon.Data.Achievements[nextId].Faction)];
			nameSuffix = nameSuffix .. ")";
		end
		AddPartOfAChainAchievement(menu, nextId, nameSuffix);
	end
end

function section:Add(menu)
	addon.MenuUtil:CreateTitle(menu, addon.L["Part of a chain"]);
    AddPartOfAChainAchievement(menu, firstAchievement.Id);
end