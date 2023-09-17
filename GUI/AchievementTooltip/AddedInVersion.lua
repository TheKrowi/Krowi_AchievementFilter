-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
	if not addon.Options.db.profile.Tooltip.Achievements.ShowAddedInVersion then
		return;
	end
    return true;
end

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Added in version"]); -- Header
	GameTooltip:AddLine(achievement.BuildVersion.Name, 1, 1, 1);
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);