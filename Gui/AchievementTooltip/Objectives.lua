local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

local numCriteria;
function section:CheckAdd(achievement)
	if achievement.TransmogSetIds then
		return;
	end
	local state = achievement:GetObtainableState();
	if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show or state == "Past" then
		return;
	end
	if achievement.IsCompleted and not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.ShowWhenAchievementCompleted then
		return;
	end
	numCriteria = GetAchievementNumCriteria(achievement.Id);
	return numCriteria > 0;
end

function section:Add(achievement)
	GameTooltip:AddLine(addon.L["Objectives progress"]);
	addon.Gui.AchievementTooltip:AddCriteria(achievement.Id, achievement.Id, numCriteria);
end