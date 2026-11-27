local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

local requiredForIds
function section:CheckAdd(achievement)
    if not addon.Settings.Get("tooltips.showRequiredFor") then
		return
	end
    requiredForIds = achievement:GetRequiredForIds()
    return #requiredForIds ~= 0
end

function section:Add(achievement)
	Krowi_Tooltip:AddLine(addon.L["Required for"])
	for _, id in next, requiredForIds do
		addon.Gui.AchievementTooltip:AddAchievementLine(achievement, id, addon.Settings.Get("tooltips.showCurrentCharacterIconsRequiredFor"))
	end
end