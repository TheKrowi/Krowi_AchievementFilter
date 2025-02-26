local addonName, addon = ...;
addon.Localization = {};
local localization = addon.Localization;

-- GAME_LOCALE = "zhCN";

function localization.SetColors(L)
    L["Not earned by:"] = L["Not earned by:"]:SetColorRed() .. " %s";
end

function localization.GetDefaultLocale()
    -- -- ADD THE FOLLOWING LINE AFTER geterrorhandler, PROBABLY LINE 27
    -- tinsert(DEBUGTABLE, key)

    -- DebugTable = {};
    -- DEBUGTABLE = DebugTable;
    return LibStub(addon.Libs.AceLocale):NewLocale(addonName, "enUS", true, true);
end