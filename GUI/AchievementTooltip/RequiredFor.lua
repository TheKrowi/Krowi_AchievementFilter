-- [[ Namespaces ]] --
local _, addon = ...;
local section = {};

local requiredForIds;
function section.CheckAdd(achievement)
    if not addon.Options.db.Tooltip.Achievements.ShowRequiredFor then
		return;
	end
    requiredForIds = achievement:GetRequiredForIds();
    return #requiredForIds ~= 0;
end

function section.Add(achievement)
	GameTooltip:AddLine(addon.L["Required for"]); -- Header
	for _, id in next, requiredForIds do
		addon.GUI.AchievementTooltip.AddAchievementLine(achievement, id, addon.Options.db.Tooltip.Achievements.ShowCurrentCharacterIconsRequiredFor);
	end
end

tinsert(addon.GUI.AchievementTooltip.Sections, section);