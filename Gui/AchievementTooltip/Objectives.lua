local _, addon = ...;
local section = {};

local numCriteria;
function section.CheckAdd(achievement)
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

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Objectives progress"]); -- Header
	if type(achievement.CustomObjectives) == "function" then
		achievement.CustomObjectives(GameTooltip);
	elseif numCriteria > 0 then
		local id = achievement.Id;
		if numCriteria < addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
			for i = 1, numCriteria do
				addon.Gui.AchievementTooltip.AddCriteriaLine(id, i);
			end
		else
			for i = 1, numCriteria, 2 do
				addon.Gui.AchievementTooltip.AddDoubleCriteriaLine(id, i, i + 1 <= numCriteria and i + 1 or nil);
			end
		end
	end
end

tinsert(addon.Gui.AchievementTooltip.Sections, section);