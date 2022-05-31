-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.Overachiever = {};
local overachiever = plugins.Overachiever;
tinsert(plugins.Plugins, overachiever);

local function InjectOptions()
    local addonName = "Overachiever_Tabs";
    local searchTabName, suggestionsTabName, watchTabName = "Search", "Suggestions", "Watch";

    if Overachiever_SearchFrame and Overachiever_SearchFrame.tab then
        Overachiever_SearchFrame.tab.AddonName = addonName;
        Overachiever_SearchFrame.tab.Name = searchTabName;
    end
    if Overachiever_SuggestionsFrame and Overachiever_SuggestionsFrame.tab then
        Overachiever_SuggestionsFrame.tab.AddonName = addonName;
        Overachiever_SuggestionsFrame.tab.Name = suggestionsTabName;
    end
    if Overachiever_WatchFrame and Overachiever_WatchFrame.tab then
        Overachiever_WatchFrame.tab.AddonName = addonName;
        Overachiever_WatchFrame.tab.Name = watchTabName;
    end

    if not addon.Options.db.Tabs[addonName] then
        addon.Options.db.Tabs[addonName] = {};
        addon.Options.db.Tabs[addonName][searchTabName] = true;
        addon.Options.db.Tabs[addonName][suggestionsTabName] = true;
        addon.Options.db.Tabs[addonName][watchTabName] = true;
    end

    local optionsTable = {
        type = "group",
        name = addon.L["Overachiever"],
        inline = true,
        args = {
            Search = {
                order = 1, type = "toggle",
                name = function() return OVERACHIEVER_STRINGS.SEARCH_TAB; end,
                get = function() return addon.Options.db.Tabs[addonName][searchTabName]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, searchTabName); end
            },
            Suggestions = {
                order = 2, type = "toggle",
                name = function() return OVERACHIEVER_STRINGS.SUGGESTIONS_TAB; end,
                get = function() return addon.Options.db.Tabs[addonName][suggestionsTabName]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, suggestionsTabName); end
            },
            Watch = {
                order = 3, type = "toggle",
                name = function() return OVERACHIEVER_STRINGS.WATCH_TAB; end,
                get = function() return addon.Options.db.Tabs[addonName][watchTabName]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, watchTabName); end
            }
        }
    };
    addon.Options.InjectOptionsTable(optionsTable, addonName, "Layout", "args", "Tabs", "args");
end

local function HookAchievementFrame_UpdateTabs() -- Issue #1: Fix
    for t, _ in next, addon.Tabs do
        hooksecurefunc("AchievementFrame_UpdateTabs", function(clickedTab) -- Issue #1: Fix
            addon.Tabs[t].Button:AchievementFrame_UpdateTabs(addon.Tabs[t].Button, addon.Tabs[t].Button.ID, clickedTab);
        end);
    end
end

local function HookOverachiever_LeftFrameOnHide()
    Overachiever_LeftFrame:HookScript("OnHide", function()
        if addon.GUI.CategoriesFrame:IsShown() then
            AchievementFrameHeaderLeftDDLInset:Show();
        end
    end);
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function overachiever:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Overachiever_Tabs" then
            InjectOptions();
            HookAchievementFrame_UpdateTabs(); -- Issue #1: Fix
            HookOverachiever_LeftFrameOnHide();
        end
    end
end

function overachiever.LoadLocalization(L)
    L["Overachiever"] = "Overachiever";
    L["Overachiever Desc"] = "This plugin fixes visual things that are broken by {plugin_overachiever}.\n\nThere are no options.";
    L["Overachiever PluginText"] = "Tabs added by {plugin_overachiever} can also be hidden from the options (1). {plugin_overachiever} is {plugin_overachiever_loaded}.\n";
end

function overachiever.InjectOptions()
    local optionsTable = {
        type = "group",
        name = addon.L["Overachiever"],
        args = {
            Loaded = {
                order = 1, type = "toggle", width = "full",
                name = addon.L["Loaded"],
                desc = addon.L["Loaded Desc"],
                descStyle = "inline",
                get = function() return overachiever.IsLoaded() end,
                disabled = true
            },
            Line = {
                order = 2, type = "header", width = "full",
                name = ""
            },
            Description = {
                order = 3, type = "description", width = "full",
                name = addon.Util.ReplaceVars
                {
                    addon.L["Overachiever Desc"],
                    overachiever = addon.L["Overachiever"]
                },
                fontSize = "medium"
            }
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, "Overachiever", "Plugins", "args");
end

function overachiever.Load()
    addon.L["New achievement window tabs Desc"] = addon.Util.ReplaceVars
    {
        addon.L["New achievement window tabs Desc"],
        pluginText = addon.L["Overachiever PluginText"]
    };
    addon.L["New achievement window tabs Desc"] = addon.Util.ReplaceVars
    {
        addon.L["New achievement window tabs Desc"],
        plugin_overachiever = string.format(addon.Colors.Yellow, addon.L["Overachiever"])
    };

    local preHookFunction = addon.Tutorials.Load;
    function addon.Tutorials.Load()
        preHookFunction();
        local preHookOnShow = addon.Tutorials.FeaturesTutorial.Pages[1].OnShow;
        addon.Tutorials.FeaturesTutorial.Pages[1].OnShow = function(self)
            if type(preHookOnShow) == "function" then
                preHookOnShow(self);
            end
            if self.OriginalText == nil then
                self.OriginalText = self.Text;
            end
            self.Text = addon.Util.ReplaceVars
            {
                self.OriginalText,
                plugin_overachiever_loaded = (overachiever.IsLoaded() and (string.format(addon.Colors.Green, addon.L["Loaded"]:lower())) or (string.format(addon.Colors.Red, addon.L["Not loaded"]:lower())))
            }
        end
    end
end

function overachiever.IsLoaded()
    return IsAddOnLoaded("Overachiever_Tabs") and OVERACHIEVER_STRINGS ~= nil;
end