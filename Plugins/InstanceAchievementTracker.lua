-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.InstanceAchievementTracker = {};
local iat = plugins.InstanceAchievementTracker;
tinsert(plugins.Plugins, iat);

function iat.InjectOptions()
    KrowiAF_InjectOptions.AddDefaults("Plugins", "InstanceAchievementTracker", {
        AddToRightClickMenu = true;
    });

    local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
    local desc = addon.L["Instance Achievement Tracker Desc"]:ReplaceVars(addon.L["Instance Achievement Tracker"]);
    local pluginTable = KrowiAF_InjectOptions.AddPluginTable("InstanceAchievementTracker", addon.L["Instance Achievement Tracker"], desc, function()
        return iat.IsLoaded();
    end);
    KrowiAF_InjectOptions.AddTable(pluginTable, "AddToRightClickMenu", {
        order = OrderPP(), type = "toggle", width = "full",
        name = addon.L["Add To Right Click Menu"],
        desc = addon.L["Add To Right Click Menu Desc"]:ReplaceVars(addon.L["Instance Achievement Tracker"]):AddDefaultValueText_KAF("Plugins.InstanceAchievementTracker.AddToRightClickMenu"),
        get = function() return addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu; end,
        set = function() addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu = not addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu; end,
        disabled = function() return not iat.IsLoaded(); end
    });
end

function iat.Load()
    addon.L["Right Click Menu Desc"] = addon.L["Right Click Menu Desc"]:ReplaceVars{
        pluginText = addon.L["Instance Achievement Tracker PluginText"]
    };
    addon.L["Right Click Menu Desc"] = addon.L["Right Click Menu Desc"]:ReplaceVars{
        plugin_iat = addon.L["Instance Achievement Tracker"]:SetColorYellow(),
        plugin_enabled = (iat.IsLoaded() and (addon.L["Enabled"]:lower():SetColorGreen()) or (addon.L["Disabled"]:lower():SetColorRed()))
    };
end

function iat:AddRightClickMenuItems(rightClickMenu, achievement)
    if self.IsLoaded()
    and addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu
    and IAT_HasAchievement(achievement.Id) then
		rightClickMenu:AddFull({Text = addon.L["IAT Tactics"], Func = function()
            IAT_DisplayAchievement(achievement.Id);
        end});
	end
end

function iat.IsLoaded()
    return IsAddOnLoaded("InstanceAchievementTracker") and GetAddOnMetadata("InstanceAchievementTracker", "Version") >= "3.18.0";
end