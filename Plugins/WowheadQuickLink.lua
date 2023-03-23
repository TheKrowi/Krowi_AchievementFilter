-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.WowheadQuickLink = {};
local wowheadQuickLink = plugins.WowheadQuickLink;
tinsert(plugins.Plugins, wowheadQuickLink);
plugins.LoadHelper:RegisterEvent("ADDON_LOADED");

local function FixAchievements()
    local data = addon.Data;
    for i = 1, #data.AchievementIds do
        local achId = data.AchievementIds[i];
        if achId and data.Achievements[achId] then
            data.Achievements[achId].ID = data.Achievements[achId].Id;
        end
    end
    FixAchievements = function() end
end

function wowheadQuickLink:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Blizzard_AchievementUI" then
            if not IsAddOnLoaded("WowheadQuickLink") then
                return;
            end
            hooksecurefunc(AchievementFrame, "Show", function()
                FixAchievements();
            end);
        end
    end
end

function wowheadQuickLink.InjectOptions()
    KrowiAF_InjectOptions.AddPluginTable("WowheadQuickLink", addon.L["Wowhead Quick Link"], addon.L["Wowhead Quick Link Desc"]:ReplaceVars(addon.L["Wowhead Quick Link"]), function()
        return IsAddOnLoaded("WowheadQuickLink");
    end);
end