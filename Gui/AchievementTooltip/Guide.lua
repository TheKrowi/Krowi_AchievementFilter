local _, addon = ...
local section = {}
tinsert(addon.Gui.AchievementTooltip.Sections, section)

function section:CheckAdd(achievement)
    return achievement.Guide ~= nil and addon.Options.db.profile.Achievements.Guide.Tooltip
end

-- Each step as a numbered white headline with its details in grey below it, as the side panel shows them
function section:Add(achievement)
    Krowi_Tooltip:AddLine(addon.L["Guide"]) -- Header
    for _, line in ipairs(addon.Gui.Guide.GetLines(achievement)) do
        Krowi_Tooltip:AddLine(("%d. %s"):format(line.Number, line.Text), 1, 1, 1, true)
        for _, detail in ipairs(line.Details or {}) do
            Krowi_Tooltip:AddLine("     " .. detail, 0.6, 0.6, 0.6, true)
        end
    end
end