local _, addon = ...;
local section = {};

local firstAchievement;
function section.CheckAdd(achievement)
    local id = addon.GetFirstAchievementId(achievement.Id);
    firstAchievement = addon.Data.Achievements[id];
    return firstAchievement.NextAchievements ~= nil;
end

local function AddPartOfAChainAchievement(menu, id, nameSuffix)
	addon.Gui.RightClickMenu.AchievementMenu.AddGoToAchievementLine(menu, id, nameSuffix);
	local achievement = addon.Data.Achievements[id];
	local nextAchievements = achievement.NextAchievements;
	if nextAchievements == nil then
		return;
	end
	for nextId, _ in next, nextAchievements do
		if achievement.NumNextAchievements > 1 then
			if addon.Data.Achievements[nextId].Faction then
				nameSuffix = " (";
				if addon.Data.Achievements[nextId].Faction then
					nameSuffix = nameSuffix .. addon.L[addon.Objects.Faction[addon.Data.Achievements[nextId].Faction]];
					nameSuffix = nameSuffix .. ")";
				end
			end
		end
		AddPartOfAChainAchievement(menu, nextId, nameSuffix);
	end
end

function section.Add(menu, achievement)
    menu:AddFull({Text = addon.L["Part of a chain"], IsTitle = true});
    AddPartOfAChainAchievement(menu, firstAchievement.Id);
end

tinsert(addon.Gui.RightClickMenu.AchievementMenu:GetLastSection().Sections, section);