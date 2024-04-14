local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd(achievement)
    return achievement.TemporaryObtainable;
end

function section:Add(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.Show then
		return;
	end
	local text, color, occurrence = addon.Data.TemporaryObtainable:GetNotObtainableText(achievement);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
	if not occurrence or not addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.ShowDateTime then
		return;
	end
	GameTooltip:AddLine(occurrence, color.R, color.G, color.B);
end