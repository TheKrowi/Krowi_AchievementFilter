local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

function section:CheckAdd(achievement)
    return achievement.Guide ~= nil and addon.Options.db.profile.Achievements.Guide.Tooltip
end

function section:Add(achievement)
    Krowi_Tooltip:AddLine(addon.L["Guide"]) -- Header
    for _, line in ipairs(addon.Gui.Guide.GetLines(achievement)) do
        Krowi_Tooltip:AddLine(line.Text, 1, 1, 1, true)
    end
end