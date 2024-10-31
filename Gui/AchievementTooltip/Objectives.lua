local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local numCriteria;
function section:CheckAdd(achievement)
	if achievement.TransmogSetIds then
		return;
	end
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
	return numCriteria > 0;
end

function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Objectives progress"]);
	addon.Gui.AchievementTooltip:AddCriteria(achievement.Id, numCriteria);
end