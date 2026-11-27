local _, addon = ...
local iat = {}
KrowiAF.PluginsApi:RegisterPlugin("InstanceAchievementTracker", iat)

local function IsLoaded()
    return C_AddOns.IsAddOnLoaded("InstanceAchievementTracker")
    and C_AddOns.GetAddOnMetadata("InstanceAchievementTracker", "Version") >= "3.18.0"
    and IAT_HasAchievement ~= nil
    and IAT_DisplayAchievement ~= nil
end

function iat:InjectOptions()
    KrowiAF.UtilApi.InjectOptions:AddDefaults("Plugins", "InstanceAchievementTracker", {
        AddToRightClickMenu = true,
    })
    addon.Settings.Declare("plugins.instanceAchievementTracker.addToRightClickMenu", {Type = "boolean", Default = true})

    local pluginTable = KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "InstanceAchievementTracker",
        addon.L["Instance Achievement Tracker"], 
        addon.L["Instance Achievement Tracker Desc"]:K_ReplaceVars(addon.L["Instance Achievement Tracker"]),
        function()
            return IsLoaded()
        end
    )
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "AddToRightClickMenu", addon.Settings.Row("plugins.instanceAchievementTracker.addToRightClickMenu", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["Add To Right Click Menu"],
        desc = addon.L["Add To Right Click Menu Desc"]:K_ReplaceVars(addon.L["Instance Achievement Tracker"]):KAF_AddDefaultValueText("plugins.instanceAchievementTracker.addToRightClickMenu"),
        disabled = function() return not IsLoaded(); end
    }))
end

function iat:AddAchievementRightClickMenuItems(rightClickMenu, achievement, menuBuilder)
    if IsLoaded()
    and addon.Settings.Get("plugins.instanceAchievementTracker.addToRightClickMenu")
    and IAT_HasAchievement(achievement.Id) then
        menuBuilder:CreateButtonAndAdd(
            rightClickMenu,
            addon.L["IAT Tactics"],
            function()
                IAT_DisplayAchievement(achievement.Id)
            end
        )
    end
end