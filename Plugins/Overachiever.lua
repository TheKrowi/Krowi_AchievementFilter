-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.Overachiever = {};
local overachiever = plugins.Overachiever;
tinsert(plugins.Plugins, overachiever);

local tmpTabs = {};

local addonName = "Overachiever_Tabs";

local function AddTabOptions(tabIndex, tabName, bindingName, nameFunc)
    local show = true;
    if tmpTabs[tabName] ~= nil then -- Fix and copy tab
        show = tmpTabs[tabName];
        if tmpTabs[tabName].Show ~= nil then
            show = tmpTabs[tabName].Show;
        end
    end
    if not tabIndex then
        tinsert(addon.Options.db.Tabs, {
            AddonName = addonName,
            TabName = tabName,
            BindingName = bindingName,
            Show = show
        });
        tabIndex = #addon.Options.db.Tabs;
    end
    addon.Options.InjectOptionsTableAdd({
        order = tabIndex, type = "toggle",
        name = nameFunc,
        get = function() return addon.Options.db.Tabs[tabIndex].Show; end,
        set = function() addon.GUI.ShowHideTabs(tabIndex); end
    }, tabName, "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(tabIndex, addon.L["Overachiever"], tabName);
    if tmpTabs[tabName] ~= nil and tmpTabs[tabName].Order ~= nil then -- Copy tab
        addon.Options.db.Tabs[tabIndex].Order = tmpTabs[tabName].Order;
    end
end

local function InjectOptions()
    local searchTabName, suggestionsTabName, watchTabName = "Search", "Suggestions", "Watch";
    local searchBindingName, suggestionsBindingName, watchBindingName = "OVERACHIEVER_TAB_SEARCH", "OVERACHIEVER_TAB_SUGGESTIONS", "OVERACHIEVER_TAB_WATCH";

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

    print(Overachiever_SearchFrame:GetName(), Overachiever_SuggestionsFrame:GetName(), Overachiever_WatchFrame:GetName())

    addon.Options.InjectOptionsTableAdd({
        type = "group",
        name = addon.L["Overachiever"],
        inline = true,
        args = {}
    }, addonName, "args", "Layout", "args", "Tabs");

    local searchTab, suggestionsTab, watchTab;
    for i, tab in next, addon.Options.db.Tabs do
        if tab.AddonName == addonName then
            if tab.TabName == searchTabName then
                searchTab = i;
            elseif tab.TabName == suggestionsTabName then
                suggestionsTab = i;
            elseif tab.TabName == watchTabName then
                watchTab = i;
            end
        end
    end

    -- addon.Diagnostics.DebugTable(tmpTabs);

    AddTabOptions(searchTab, searchTabName, searchBindingName, function() return OVERACHIEVER_STRINGS.SEARCH_TAB; end);
    AddTabOptions(suggestionsTab, suggestionsTabName, suggestionsBindingName, function() return OVERACHIEVER_STRINGS.SUGGESTIONS_TAB; end);
    AddTabOptions(watchTab, watchTabName, watchBindingName, function() return OVERACHIEVER_STRINGS.WATCH_TAB; end);

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
    for _, tab in next, addon.Options.db.Tabs do
        if tab.AddonName == addonName then
            tmpTabs[tab.TabName] = {
                Show = tab.Show,
                Order = tab.Order
            };
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