local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.ShowAddedInVersion or achievement.IsTracking then
		return;
	end
    return true;
end

function section:Add(achievement)
	Krowi_Tooltip:AddLine(addon.L["Added in version"]); -- Header
	if not achievement.BuildVersion then
		Krowi_Tooltip:AddLine(addon.Metadata.Build, 1, 1, 1);
		return;
	end
	local description = achievement.BuildVersion.Description and " (" .. achievement.BuildVersion.Description .. ")" or "";
	Krowi_Tooltip:AddLine(achievement.BuildVersion.Name .. description, 1, 1, 1);
end