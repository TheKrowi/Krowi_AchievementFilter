-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

function section.CheckAdd(achievement)
    return achievement.Obtainable and not achievement.Obtainable();
end

function section.Add(achievement)
	local color = addon.Colors.RedRGB;
	GameTooltip:AddLine(addon.L["This achievement is no longer obtainable"], color.R, color.G, color.B);
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);