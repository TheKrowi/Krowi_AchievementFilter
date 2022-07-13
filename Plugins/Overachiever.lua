-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.Overachiever = {};
local overachiever = plugins.Overachiever;
tinsert(plugins.Plugins, overachiever);

local tmpTabs = {};

local addonName = "Overachiever_Tabs";
local count = 1;

local function AddTabOptions(tabName, bindingName, nameFunc)
    local show = true;
    if tmpTabs[tabName] ~= nil then -- Fix and copy tab
        show = tmpTabs[tabName];
        if tmpTabs[tabName].Show ~= nil then
            show = tmpTabs[tabName].Show;
        end
    end
    addon.Options.db.Tabs[addonName] = addon.Options.db.Tabs[addonName] or {};
    addon.Options.db.Tabs[addonName][tabName] = addon.Options.db.Tabs[addonName][tabName] or {
        Show = show
    };

    addon.Options.InjectOptionsTableAdd({
        order = count, type = "toggle",
        name = nameFunc,
        get = function() return addon.Options.db.Tabs[addonName][tabName].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, tabName); end
    }, tabName, "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, tabName, addon.L["Overachiever"], tabName, bindingName);
    if tmpTabs[tabName] ~= nil and tmpTabs[tabName].Order ~= nil then -- Copy tab
        addon.Options.db.Tabs[addonName][tabName].Order = tmpTabs[tabName].Order;
    end
    count = count + 1;
end

local function InjectOptions()
    local searchTabName, suggestionsTabName, watchTabName = "Search", "Suggestions", "Watch";
    local searchBindingName, suggestionsBindingName, watchBindingName = "OVERACHIEVER_TAB_SEARCH", "OVERACHIEVER_TAB_SUGGESTIONS", "OVERACHIEVER_TAB_WATCH";


    addon.Options.InjectOptionsTableAdd({
        type = "group",
        name = addon.L["Overachiever"],
        inline = true,
        args = {}
    }, addonName, "args", "Layout", "args", "Tabs");

    AddTabOptions(searchTabName, searchBindingName, function() return OVERACHIEVER_STRINGS.SEARCH_TAB; end);
    AddTabOptions(suggestionsTabName, suggestionsBindingName, function() return OVERACHIEVER_STRINGS.SUGGESTIONS_TAB; end);
    AddTabOptions(watchTabName, watchBindingName, function() return OVERACHIEVER_STRINGS.WATCH_TAB; end);

    KrowiAF_RegisterTabButton(addonName, searchTabName, Overachiever_SearchFrame.tab, function()
        Overachiever.OpenTab_frame(Overachiever_SearchFrame, true);
    end);
    KrowiAF_RegisterTabButton(addonName, suggestionsTabName, Overachiever_SuggestionsFrame.tab, function()
        Overachiever.OpenTab_frame(Overachiever_SuggestionsFrame, true);
    end);
    KrowiAF_RegisterTabButton(addonName, watchTabName, Overachiever_WatchFrame.tab, function()
        Overachiever.OpenTab_frame(Overachiever_WatchFrame, true);
    end);

    tmpTabs = nil;
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

local function CopyTabs()
    for tabAddonName, tabs in next, addon.Options.db.Tabs do
        if tabAddonName == addonName then
            for tabName, tab in next, tabs do
                tmpTabs[tabName] = {
                    Show = tab.Show,
                    Order = tab.Order
                };
            end
        end
    end
end

local function FixTabs()
    SavedData.Fixes = SavedData.Fixes or {}; -- Does not exist yet for new users
    if addon.MetaData.Version < "35.0" or addon.Options.db.Tabs == nil or SavedData.Fixes.FixTabs == true or addon.Options.db.Tabs[addonName] == nil then
        addon.Diagnostics.Debug("Overachiever Tabs already ported from previous version");
        CopyTabs();
        return;
    end

    tmpTabs = addon.Options.db.Tabs[addonName];

    addon.Diagnostics.Debug("Ported Overachiever Tabs from previous version");
end

local ChangeAchievementMicroButtonOnClick;
plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
function overachiever:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Overachiever_Tabs" then
            InjectOptions();
            ChangeAchievementMicroButtonOnClick();
            addon.ChangeAchievementMicroButtonOnClick = ChangeAchievementMicroButtonOnClick;
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
    addon.Options.InjectOptionsTable({
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
                    plugin_overachiever = addon.L["Overachiever"]
                },
                fontSize = "medium"
            }
        }
    }, "Overachiever", "Plugins", "args");
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

    FixTabs();

    local reason = select(5, GetAddOnInfo("Overachiever_Tabs"));
    if reason == nil or reason == "DEMAND_LOADED" then
        ChangeAchievementMicroButtonOnClick = addon.ChangeAchievementMicroButtonOnClick;
        addon.ChangeAchievementMicroButtonOnClick = function()
        end
    end

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