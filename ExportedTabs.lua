-- [[ Exported at 2022-08-13 15-36-24 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local addonName, addon = ...;
addon.Tabs = {};
addon.TabsOrder = {};
local tabs = addon.Tabs;
local tabsOrder = addon.TabsOrder;

function tabs.Load()
    tabs["Achievements"] = { Name = "Achievements", Text = addon.L["Achievements"] };
    tinsert(tabsOrder, "Achievements");
    tabs["Expansions"] = { Name = "Expansions", Text = addon.L["Expansions"] };
    tinsert(tabsOrder, "Expansions");
    tabs["Events"] = { Name = "Events", Text = addon.L["Events"] };
    tinsert(tabsOrder, "Events");
    tabs["PvP"] = { Name = "PvP", Text = addon.GetCategoryInfoTitle(95) };
    tinsert(tabsOrder, "PvP");
    tabs["Specials"] = { Name = "Specials", Text = addon.L["Specials"] };
    tinsert(tabsOrder, "Specials");
    tabs.Load = nil;
end

function tabs.InjectOptions()
    addon.Options.InjectOptionsTableAdd({
        order = 3, type = "group",
        name = addon.MetaData.Title,
        inline = true,
        args = {}
    }, addonName, "args", "Layout", "args", "Tabs");

    addon.Options.InjectDefaults({}, addonName, "Tabs");

    addon.Options.InjectDefaults({
        Show = true
    }, "Achievements", "Tabs", addonName);
    addon.Options.InjectOptionsTableAdd({
        order = 1, type = "toggle",
        name = addon.L["Achievements"],
        get = function() return addon.Options.db.Tabs[addonName]["Achievements"].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, "Achievements"); end
    }, "Achievements", "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, "Achievements", addon.MetaData.Title, addon.L["Achievements"], "KrowiAF_OPEN_TAB_Achievements");

    addon.Options.InjectDefaults({
        Show = true
    }, "Expansions", "Tabs", addonName);
    addon.Options.InjectOptionsTableAdd({
        order = 2, type = "toggle",
        name = addon.L["Expansions"],
        get = function() return addon.Options.db.Tabs[addonName]["Expansions"].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, "Expansions"); end
    }, "Expansions", "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, "Expansions", addon.MetaData.Title, addon.L["Expansions"], "KrowiAF_OPEN_TAB_Expansions");

    addon.Options.InjectDefaults({
        Show = true
    }, "Events", "Tabs", addonName);
    addon.Options.InjectOptionsTableAdd({
        order = 3, type = "toggle",
        name = addon.L["Events"],
        get = function() return addon.Options.db.Tabs[addonName]["Events"].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, "Events"); end
    }, "Events", "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, "Events", addon.MetaData.Title, addon.L["Events"], "KrowiAF_OPEN_TAB_Events");

    addon.Options.InjectDefaults({
        Show = true
    }, "PvP", "Tabs", addonName);
    addon.Options.InjectOptionsTableAdd({
        order = 4, type = "toggle",
        name = addon.L["PvP"],
        get = function() return addon.Options.db.Tabs[addonName]["PvP"].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, "PvP"); end
    }, "PvP", "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, "PvP", addon.MetaData.Title, addon.L["PvP"], "KrowiAF_OPEN_TAB_PvP");

    addon.Options.InjectDefaults({
        Show = true
    }, "Specials", "Tabs", addonName);
    addon.Options.InjectOptionsTableAdd({
        order = 5, type = "toggle",
        name = addon.L["Specials"],
        get = function() return addon.Options.db.Tabs[addonName]["Specials"].Show; end,
        set = function() addon.GUI.ShowHideTabs(addonName, "Specials"); end
    }, "Specials", "args", "Layout", "args", "Tabs", "args", addonName);
    KrowiAF_RegisterTabOptions(addonName, "Specials", addon.MetaData.Title, addon.L["Specials"], "KrowiAF_OPEN_TAB_Specials");

    tabs.InjectOptions = nil;
end

