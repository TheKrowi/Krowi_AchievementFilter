local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

function section:CheckAdd(achievement)
    return achievement.TemporaryObtainable
end

function section:Add(achievement)
	if not addon.Settings.Get("tooltips.temporarilyObtainable.show") then
		return
	end
	local records = addon.Data.TemporaryObtainable:GetNotObtainableTexts(achievement)
	for i = #records, 1, -1 do
		if #records - i >= addon.Settings.Get("tooltips.temporarilyObtainable.numberOfLines") then
			return
		end
		local record = records[i]
		Krowi_Tooltip:AddLine(record.Text, record.Color.R, record.Color.G, record.Color.B)
		if record.Occurrence and addon.Settings.Get("tooltips.temporarilyObtainable.showDateTime") then
			Krowi_Tooltip:AddLine(record.Occurrence, record.Color.R, record.Color.G, record.Color.B)
		end
	end
end