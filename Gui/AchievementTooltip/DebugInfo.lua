local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd()
    return addon.Diagnostics.DebugEnabled();
end

function section:Add(achievement)
    local info = addon.GetAchievementInfoTable(achievement.Id or achievement.AchievementId);
    if not info then
        Krowi_Tooltip:AddLine("Debug: No info found for achievement.");
        return;
    end
    Krowi_Tooltip:AddLine("Debug Info:");
    for k, v in pairs(info) do
        if type(v) == "table" then
            Krowi_Tooltip:AddLine("  " .. tostring(k) .. ": {table}");
            for tk, tv in pairs(v) do
                Krowi_Tooltip:AddLine("    " .. tostring(tk) .. ": " .. tostring(tv));
            end
        else
            Krowi_Tooltip:AddLine("  " .. tostring(k) .. ": " .. tostring(v));
        end
    end
    Krowi_Tooltip:AddLine("");
    Krowi_Tooltip:AddLine("More:");
    for k, v in pairs(achievement) do
        if type(v) == "table" then
            Krowi_Tooltip:AddLine("  " .. tostring(k) .. ": {table}");
            for tk, tv in pairs(v) do
                Krowi_Tooltip:AddLine("    " .. tostring(tk) .. ": " .. tostring(tv));
            end
        else
            Krowi_Tooltip:AddLine("  " .. tostring(k) .. ": " .. tostring(v));
        end
    end
end