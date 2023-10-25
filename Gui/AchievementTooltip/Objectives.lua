local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local numCriteria;
function section:CheckAdd(achievement)
	local state;
	if achievement.TemporaryObtainable then
		state = achievement.TemporaryObtainable.Obtainable();
	end
	local pastObtainable = state and (not state or state == "Past");
	if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show or pastObtainable then
		return;
	end
	if achievement.IsCompleted and not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted then
		return;
	end
	numCriteria = addon.GetAchievementNumCriteria(achievement.Id);
	return numCriteria > 0 or type(achievement.CustomObjectives) == "function";
end

function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Objectives progress"]);
	if type(achievement.CustomObjectives) == "function" then
		achievement.CustomObjectives(GameTooltip);
	elseif numCriteria > 0 then
		addon.Gui.AchievementTooltip:AddCriteria(numCriteria, achievement.Id);
	end
end