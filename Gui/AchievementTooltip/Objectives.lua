local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

local numCriteria
function section:CheckAdd(achievement)
	if achievement.TransmogSetIds then
		return
	end
	local state = achievement:GetObtainableState()
	if not addon.Settings.Get("tooltips.objectivesProgress.show") or state == "Past" then
		return
	end
	if achievement.IsCompleted and not addon.Settings.Get("tooltips.objectivesProgress.showWhenAchievementCompleted") then
		return
	end
	numCriteria = addon.GetAchievementNumCriteria(achievement.Id)
	return numCriteria > 0
end

function section:Add(achievement)
	Krowi_Tooltip:AddLine(addon.L["Objectives progress"])
	addon.Gui.AchievementTooltip:AddCriteria(achievement.Id, achievement.Id, numCriteria)
end