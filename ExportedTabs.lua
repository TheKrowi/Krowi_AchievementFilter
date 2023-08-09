-- [[ Exported at 2023-01-03 20-18-25 ]] --
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

function tabs.InjectDynamicOptions()
    KrowiAF_RegisterTabOptions(addonName, "Achievements", addon.Metadata.Title, addon.L["Achievements"], "KrowiAF_OPEN_TAB_Achievements", true);
    KrowiAF_RegisterTabOptions(addonName, "Expansions", addon.Metadata.Title, addon.L["Expansions"], "KrowiAF_OPEN_TAB_Expansions", true);
    KrowiAF_RegisterTabOptions(addonName, "Events", addon.Metadata.Title, addon.L["Events"], "KrowiAF_OPEN_TAB_Events", true);
    KrowiAF_RegisterTabOptions(addonName, "PvP", addon.Metadata.Title, addon.L["PvP"], "KrowiAF_OPEN_TAB_PvP", true);
    KrowiAF_RegisterTabOptions(addonName, "Specials", addon.Metadata.Title, addon.L["Specials"], "KrowiAF_OPEN_TAB_Specials", true);

    tabs.InjectDynamicOptions = nil;
end

