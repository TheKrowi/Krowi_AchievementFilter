local addonName, addon = ...;
addon.Data.TabData = {};
addon.Data.TabData.Shared = {};
local shared = addon.Data.TabData.Shared;

KrowiAF.TabData.Base = {
    {
        addonName,
        addon.Metadata.Title,
        "Achievements",
        addon.L["Achievements"],
        "KrowiAF_OPEN_TAB_Achievements",
        true
    },
    {
        addonName,
        addon.Metadata.Title,
        "Expansions",
        addon.L["Expansions"],
        "KrowiAF_OPEN_TAB_Expansions",
        true
    },
    {
        addonName,
        addon.Metadata.Title,
        "Events",
        addon.L["Events"],
        "KrowiAF_OPEN_TAB_Events",
        true
    },
    {
        addonName,
        addon.Metadata.Title,
        "PvP",
        addon.GetCategoryInfoTitle(95),
        "KrowiAF_OPEN_TAB_PvP",
        true
    },
    {
        addonName,
        addon.Metadata.Title,
        "Specials",
        addon.L["Specials"],
        "KrowiAF_OPEN_TAB_Specials",
        true
    },
};