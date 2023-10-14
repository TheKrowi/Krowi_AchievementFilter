local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section.CheckAdd(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.ShowAddedInVersion or achievement.IsTracking then
		return;
	end
    return true;
end

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Added in version"]); -- Header
	GameTooltip:AddLine(achievement.BuildVersion and achievement.BuildVersion.Name or addon.Metadata.Build, 1, 1, 1);
end