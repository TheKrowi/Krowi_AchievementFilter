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
	local records = addon.Data.TemporaryObtainable:GetNotObtainableTexts(achievement);
	for i = #records, 1, -1 do
		if #records - i >= addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.NumberOfLines then
			return;
		end
		local record = records[i];
		GameTooltip:AddLine(record.Text, record.Color.R, record.Color.G, record.Color.B);
		if record.Occurrence and addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.ShowDateTime then
			GameTooltip:AddLine(record.Occurrence, record.Color.R, record.Color.G, record.Color.B);
		end
	end
end