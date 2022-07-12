-- [[ Exported at 2022-07-02 11-59-50 ]] --
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
    tabs["PvP"] = { Name = "PvP", Text = (GetCategoryInfo(15270)) };
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

    -- Redefine local index every time to make the functions work
    local index = #addon.Options.InjectDefaultsAdd({
        AddonName = addonName,
        TabName = "Achievements",
        BindingName = "KrowiAF_OPEN_TAB_Achievements",
        Show = true
    }, "Tabs");
    addon.Options.InjectOptionsTableAdd({
        order = index, type = "toggle",
        name = addon.L["Achievements"],
        get = function() return addon.Options.db.Tabs[index].Show; end,
        set = function() addon.GUI.ShowHideTabs(index); end
    }, "Achievements", "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(index, addon.MetaData.Title, addon.L["Achievements"]);

    local index = #addon.Options.InjectDefaultsAdd({
        AddonName = addonName,
        TabName = "Expansions",
        BindingName = "KrowiAF_OPEN_TAB_Expansions",
        Show = true
    }, "Tabs");
    addon.Options.InjectOptionsTableAdd({
        order = index, type = "toggle",
        name = addon.L["Expansions"],
        get = function() return addon.Options.db.Tabs[index].Show; end,
        set = function() addon.GUI.ShowHideTabs(index); end
    }, "Expansions", "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(index, addon.MetaData.Title, addon.L["Expansions"]);

    local index = #addon.Options.InjectDefaultsAdd({
        AddonName = addonName,
        TabName = "Events",
        BindingName = "KrowiAF_OPEN_TAB_Events",
        Show = true
    }, "Tabs");
    addon.Options.InjectOptionsTableAdd({
        order = index, type = "toggle",
        name = addon.L["Events"],
        get = function() return addon.Options.db.Tabs[index].Show; end,
        set = function() addon.GUI.ShowHideTabs(index); end
    }, "Events", "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(index, addon.MetaData.Title, addon.L["Events"]);

    local index = #addon.Options.InjectDefaultsAdd({
        AddonName = addonName,
        TabName = "PvP",
        BindingName = "KrowiAF_OPEN_TAB_PvP",
        Show = true
    }, "Tabs");
    addon.Options.InjectOptionsTableAdd({
        order = index, type = "toggle",
        name = addon.L["PvP"],
        get = function() return addon.Options.db.Tabs[index].Show; end,
        set = function() addon.GUI.ShowHideTabs(index); end
    }, "PvP", "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(index, addon.MetaData.Title, addon.L["PvP"]);

    local index = #addon.Options.InjectDefaultsAdd({
        AddonName = addonName,
        TabName = "Specials",
        BindingName = "KrowiAF_OPEN_TAB_Specials",
        Show = true
    }, "Tabs");
    addon.Options.InjectOptionsTableAdd({
        order = index, type = "toggle",
        name = addon.L["Specials"],
        get = function() return addon.Options.db.Tabs[index].Show; end,
        set = function() addon.GUI.ShowHideTabs(index); end
    }, "Specials", "args", "Layout", "args", "Tabs", "args", addonName);
    addon.Data.SavedData.TabsOrderAddIfNotContains(index, addon.MetaData.Title, addon.L["Specials"]);

    tabs.InjectOptions = nil;
end

