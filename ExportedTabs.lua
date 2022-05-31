-- [[ Exported at 2022-05-29 10-30-07 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local addonName, addon = ...;
addon.Tabs = {};
addon.TabsOrder = {};
local tabs = addon.Tabs;
local tabsOrder = addon.TabsOrder;

function tabs.Load()
    tabs["Achievements"] = { Name = "Achievements", Text = addon.L["Achievements"], Location = 1 };
    tinsert(tabsOrder, "Achievements");
    tabs["Expansions"] = { Name = "Expansions", Text = addon.L["Expansions"], Location = 2 };
    tinsert(tabsOrder, "Expansions");
    tabs["Events"] = { Name = "Events", Text = addon.L["Events"], Location = 3 };
    tinsert(tabsOrder, "Events");
    tabs["PvP"] = { Name = "PvP", Text = (GetCategoryInfo(15270)), Location = 4 };
    tinsert(tabsOrder, "PvP");
    tabs["Specials"] = { Name = "Specials", Text = addon.L["Specials"], Location = 5 };
    tinsert(tabsOrder, "Specials");
    tabs.Load = nil;
end

function tabs.InjectOptions()
    local defaults = {};
    defaults["Achievements"] = true;
    defaults["Expansions"] = true;
    defaults["Events"] = true;
    defaults["PvP"] = true;
    defaults["Specials"] = true;

    addon.Options.InjectDefaults(defaults, addonName, "Tabs");

    local optionsTable = {
        order = 2, type = "group",
        name = addon.MetaData.Title,
        inline = true,
        args = {
            Achievements = {
                order = 1, type = "toggle",
                name = addon.L["Achievements"],
                get = function() return addon.Options.db.Tabs[addonName]["Achievements"]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, "Achievements"); end
            },
            Expansions = {
                order = 2, type = "toggle",
                name = addon.L["Expansions"],
                get = function() return addon.Options.db.Tabs[addonName]["Expansions"]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, "Expansions"); end
            },
            Events = {
                order = 3, type = "toggle",
                name = addon.L["Events"],
                get = function() return addon.Options.db.Tabs[addonName]["Events"]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, "Events"); end
            },
            PvP = {
                order = 4, type = "toggle",
                name = addon.L["PvP"],
                get = function() return addon.Options.db.Tabs[addonName]["PvP"]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, "PvP"); end
            },
            Specials = {
                order = 5, type = "toggle",
                name = addon.L["Specials"],
                get = function() return addon.Options.db.Tabs[addonName]["Specials"]; end,
                set = function() addon.GUI.ShowHideTabs(addonName, "Specials"); end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTable, addonName, "Layout", "args", "Tabs", "args");
    tabs.InjectOptions = nil;
end

