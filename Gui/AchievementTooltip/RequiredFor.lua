local _, addon = ...;
local section = {};

local requiredForIds;
function section.CheckAdd(achievement)
    if not addon.Options.db.profile.Tooltip.Achievements.ShowRequiredFor then
		return;
	end
    requiredForIds = achievement:GetRequiredForIds();
    return #requiredForIds ~= 0;
end

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Required for"]); -- Header
	for _, id in next, requiredForIds do
		addon.Gui.AchievementTooltip.AddAchievementLine(achievement, id, addon.Options.db.profile.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor);
	end
end

tinsert(addon.Gui.AchievementTooltip.Sections, section);