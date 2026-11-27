local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

function section:CheckAdd(achievement)
	if not addon.Settings.Get("tooltips.showOtherFaction") then
		return
	end
	return achievement.OtherFactionAchievementId ~= nil
end

local function IsOtherFactionAchievementCompleted(achievement)
	if not achievement.OtherFactionAchievementId then
		return false
	end
	if KrowiAF_Achievements.Completed[achievement.OtherFactionAchievementId] and KrowiAF_Achievements.Completed[achievement.OtherFactionAchievementId].FirstCompletedOn then
		return true
	end
end

function section:Add(achievement)
	local faction = addon.L["Neutral"]
	if addon.Faction.IsAlliance then
		faction = addon.L["Horde"]
	elseif addon.Faction.IsHorde then
		faction = addon.L["Alliance"]
	end
	Krowi_Tooltip:AddLine(addon.L["Other faction"] .. " (" .. faction .. ")")
	local otherFactionAchievementCompleted = IsOtherFactionAchievementCompleted(achievement)
	addon.Gui.AchievementTooltip:AddAchievementLine(achievement, achievement.OtherFactionAchievementId, addon.Settings.Get("tooltips.showCurrentCharacterIconsRequiredFor"), nil, otherFactionAchievementCompleted)
end