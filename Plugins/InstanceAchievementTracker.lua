local _, addon = ...;
local iat = {};
KrowiAF.PluginsApi:RegisterPlugin("InstanceAchievementTracker", iat);

local function IsLoaded()
    return C_AddOns.IsAddOnLoaded("InstanceAchievementTracker") and C_AddOns.GetAddOnMetadata("InstanceAchievementTracker", "Version") >= "3.18.0";
end

function iat:InjectOptions()
    KrowiAF.UtilApi.InjectOptions:AddDefaults("Plugins", "InstanceAchievementTracker", {
        AddToRightClickMenu = true;
    });

    local pluginTable = KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "InstanceAchievementTracker",
        addon.L["Instance Achievement Tracker"], 
        addon.L["Instance Achievement Tracker Desc"]:K_ReplaceVars(addon.L["Instance Achievement Tracker"]),
        function()
            return IsLoaded();
        end
    );
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "AddToRightClickMenu", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["Add To Right Click Menu"],
        desc = addon.L["Add To Right Click Menu Desc"]:K_ReplaceVars(addon.L["Instance Achievement Tracker"]):KAF_AddDefaultValueText("Plugins.InstanceAchievementTracker.AddToRightClickMenu"),
        get = function() return addon.Options.db.profile.Plugins.InstanceAchievementTracker.AddToRightClickMenu; end,
        set = function(_, value) addon.Options.db.profile.Plugins.InstanceAchievementTracker.AddToRightClickMenu = value; end,
        disabled = function() return not IsLoaded(); end
    });
end

function iat:Load()
    -- This is a tutorial texts, rework for this will be done later
    addon.L["Right Click Menu Desc"] = addon.L["Right Click Menu Desc"]:K_ReplaceVars{
        pluginText = addon.L["Instance Achievement Tracker PluginText"]
    };
    addon.L["Right Click Menu Desc"] = addon.L["Right Click Menu Desc"]:K_ReplaceVars{
        plugin_iat = addon.L["Instance Achievement Tracker"]:SetColorYellow(),
        plugin_enabled = (IsLoaded() and (addon.L["Enabled"]:lower():SetColorGreen()) or (addon.L["Disabled"]:lower():SetColorRed()))
    };
end

function iat:AddAchievementRightClickMenuItems(rightClickMenu, achievement)
    if IsLoaded()
    and addon.Options.db.profile.Plugins.InstanceAchievementTracker.AddToRightClickMenu
    and IAT_HasAchievement(achievement.Id) then
        KrowiAF.UtilApi.MenuHelper:CreateButtonAndAdd(
            rightClickMenu,
		    addon.L["IAT Tactics"],
            function()
                IAT_DisplayAchievement(achievement.Id);
            end
        );
	end
end