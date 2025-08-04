local _, addon = ...;
local section = {};
tinsert(addon.Gui.AchievementTooltip.Sections, section);

function section:CheckAdd()
    return addon.Diagnostics.DebugEnabled();
end

function section:Add(achievement)
    local info = addon.GetAchievementInfoTable(achievement.Id or achievement.AchievementId);
    if not info then
        GameTooltip:AddLine("Debug: No info found for achievement.");
        return;
    end
    GameTooltip:AddLine("Debug Info:");
    for k, v in pairs(info) do
        if type(v) == "table" then
            GameTooltip:AddLine("  " .. tostring(k) .. ": {table}");
            for tk, tv in pairs(v) do
                GameTooltip:AddLine("    " .. tostring(tk) .. ": " .. tostring(tv));
            end
        else
            GameTooltip:AddLine("  " .. tostring(k) .. ": " .. tostring(v));
        end
    end
end