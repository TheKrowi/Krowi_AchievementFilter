-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

local numCriteria;
function section.CheckAdd(achievement)
	if not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.Show or (achievement.TemporaryObtainable and not achievement.TemporaryObtainable.Obtainable()) then
		return;
	end
	if achievement.Completed and not addon.Options.db.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted then
		return;
	end
	numCriteria = GetAchievementNumCriteria(achievement.Id);
	return numCriteria > 0 or type(achievement.CustomObjectives) == "function";
end

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Objectives progress"]); -- Header
	if type(achievement.CustomObjectives) == "function" then
		achievement.CustomObjectives(GameTooltip);
	elseif numCriteria > 0 then
		local id = achievement.Id;
		if numCriteria < addon.Options.db.Tooltip.Achievements.ObjectivesProgress.SecondColumnThreshold then
			for i = 1, numCriteria do
				addon.GUI.AchievementTooltip.AddCriteriaLine(id, i);
			end
		else
			for i = 1, numCriteria, 2 do
				addon.GUI.AchievementTooltip.AddDoubleCriteriaLine(id, i, i + 1 <= numCriteria and i + 1 or nil);
			end
		end
	end
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);