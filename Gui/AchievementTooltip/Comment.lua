local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd(achievement)
    return true;
end

function section:Add(achievement)
	GameTooltip:AddLine("Comment"); -- Header
	GameTooltip:AddLine("This could be a lot of extra text that could explain\n" ..
	"how to get this achievement in maybe less or more words.\n" ..
	"As this is a placeholder text I want to ask everyone their\n" ..
	"feedback if this should be added here or if there could be another\n" ..
	"place to do this?", 1, 1, 1);
end