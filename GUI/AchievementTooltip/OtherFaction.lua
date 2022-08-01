-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
	if not addon.Options.db.Tooltip.Achievements.ShowOtherFaction then
		return;
	end
	return achievement.OtherFactionAchievementId ~= nil;
end

function section.Add(achievement)
	local faction = addon.L["Neutral"];
	if addon.Faction.IsAlliance then
		faction = addon.L["Horde"];
	elseif addon.Faction.IsHorde then
		faction = addon.L["Alliance"];
	end
	GameTooltip:AddLine(addon.L["Other faction"] .. " (" .. faction .. ")"); -- Header

	local _, _, otherFactionAchievementCompleted = addon.GUI.AchievementTooltip.EvaluateCharacters(achievement);
	addon.GUI.AchievementTooltip.AddAchievementLine(achievement, achievement.OtherFactionAchievementId, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor, nil, otherFactionAchievementCompleted);
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);