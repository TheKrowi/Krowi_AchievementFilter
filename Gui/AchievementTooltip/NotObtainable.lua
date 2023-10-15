local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd(achievement)
    return achievement.TemporaryObtainable;
end

function section:Add(achievement)
	local text, color = addon.Data.TemporaryObtainable:GetNotObtainableText(achievement);
	GameTooltip:AddLine(text, color.R, color.G, color.B);
end