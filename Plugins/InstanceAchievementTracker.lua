-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.InstanceAchievementTracker = {};
local iat = plugins.InstanceAchievementTracker;
tinsert(plugins.Plugins, iat);

function iat.LoadLocalization(L)
    L["Instance Achievement Tracker"] = "Instance Achievement Tracker";
    L["Instance Achievement Tracker Desc"] = "This plugin allows the addition of an extra Right Click Menu item for {iat}.";
    L["IAT Tactics"] = "IAT Tactics";
    L["Add To Right Click Menu"] = "Add To Right Click Menu";
    L["Add To Right Click Menu Desc"] = "Add an option to the Right Click Menu that will direct you to tactics if {iat} has data for it.";
    L["Instance Achievement Tracker PluginText"] = "|T:1:8|t" .. "- Shortcut to {plugin_iat} if tactics for the achievement are available ({plugin_iat} is {plugin_enabled}).\n";

end

function iat.InjectOptions()
    local defaults = {};
    -- defaults.Enabled = true;
    defaults.AddToRightClickMenu = true;

    addon.Options.InjectDefaults(defaults, "InstanceAchievementTracker", "Plugins");

    local optionsTable = {
        type = "group",
        name = addon.L["Instance Achievement Tracker"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return iat.IsLoaded() end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.L["Instance Achievement Tracker Desc"]:ReplaceVars
                {
                    iat = addon.L["Instance Achievement Tracker"]
                },
                fontSize = "medium"
            },
            -- Enabled = {
            --     order = 4, type = "toggle", width = "full",
            --     name = addon.L["Enable"],
            --     desc = addon.L["Enable Desc"],
            --     get = function() return addon.Options.db.Plugins.InstanceAchievementTracker.Enabled; end,
            --     set = function()
            --         addon.Options.db.Plugins.InstanceAchievementTracker.Enabled = not addon.Options.db.Plugins.InstanceAchievementTracker.Enabled;
            --         addon.Options.Debug(addon.L["Instance Achievement Tracker"] .. " " .. addon.L["Enable"], addon.Options.db.Plugins.InstanceAchievementTracker.Enabled);
            --     end,
            --     disabled = function() return not iat.IsLoaded(); end
            -- },
            AddToRightClickMenu = {
                order = 5, type = "toggle", width = "full",
                name = addon.L["Add To Right Click Menu"],
                desc = addon.Util.ReplaceVars
                {
                    addon.L["Add To Right Click Menu Desc"],
                    iat = addon.L["Instance Achievement Tracker"]
                },
                get = function() return addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu end,
                set = function()
                    addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu = not addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu;
                    addon.Options.Debug(addon.L["Instance Achievement Tracker"] .. " " .. addon.L["Enable"], addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu);
                end,
                disabled = function() return not iat.IsLoaded() --[[or not addon.Options.db.Plugins.InstanceAchievementTracker.Enabled;]] end
            }
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "InstanceAchievementTracker", "Plugins", "args");
end

function iat.Load()
    addon.L["Right Click Menu Desc"] = addon.Util.ReplaceVars
    {
        addon.L["Right Click Menu Desc"],
        pluginText = addon.L["Instance Achievement Tracker PluginText"]
    };
    addon.L["Right Click Menu Desc"] = addon.Util.ReplaceVars
    {
        addon.L["Right Click Menu Desc"],
        plugin_iat = string.format(addon.Colors.Yellow, addon.L["Instance Achievement Tracker"]),
        plugin_enabled = (iat.IsLoaded() and (string.format(addon.Colors.Green, addon.L["Enabled"]:lower())) or (string.format(addon.Colors.Red, addon.L["Disabled"]:lower())))
    };
end

function iat:AddRightClickMenuItems(rightClickMenu, achievement)
    if self.IsLoaded()
    -- and addon.Options.db.Plugins.InstanceAchievementTracker.Enabled
    and addon.Options.db.Plugins.InstanceAchievementTracker.AddToRightClickMenu
    and IAT_HasAchievement(achievement.ID) then
		rightClickMenu:AddFull({Text = addon.L["IAT Tactics"], Func = function() IAT_DisplayAchievement(achievement.ID); end});
	end
end

function iat.IsLoaded()
    return IsAddOnLoaded("InstanceAchievementTracker") and GetAddOnMetadata("InstanceAchievementTracker", "Version") >= "3.18.0";
end