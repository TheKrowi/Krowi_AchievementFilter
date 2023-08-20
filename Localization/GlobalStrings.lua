-- [[ Namespaces ]] --
local _, addon = ...;
local L = addon.L;

function addon.GetCovenantName(covenantID)
    return C_Covenants and C_Covenants.GetCovenantData(covenantID).name or covenantID;
end

function addon.GetInstanceInfoName(journalInstanceId)
    local name = EJ_GetInstanceInfo and (EJ_GetInstanceInfo(journalInstanceId)) or nil;
    if name then
        return name;
    end
    name = addon.L["EJ_GetInstanceInfo" .. journalInstanceId];
    if name then
        return name;
    end
    return journalInstanceId;
end

function addon.GetCategoryInfoTitle(categoryId)
    local title = (GetCategoryInfo(categoryId));
    if title then
        return title;
    end
    title = addon.L["GetCategoryInfo" .. categoryId];
    if title then
        return title;
    end
    return categoryId;
end

function addon.GetLFGDungeonInfo(dungeonID)
    return GetLFGDungeonInfo and GetLFGDungeonInfo(dungeonID) or dungeonID;
end

function addon.GetMapName(uiMapID)
    local mapInfo = C_Map.GetMapInfo(uiMapID);
    return mapInfo and mapInfo.name or uiMapID;
end

-- [[ https://legacy.curseforge.com/wow/addons/krowi-achievement-filter/localization ]] --
-- [[ Everything after this line is automatically generated from CurseForge and is not meant for manual edit - SOURCETOKEN - AUTOGENTOKEN ]] --

L["Expansion"] = EXPANSION_FILTER_TEXT;
L["Classic"] = EXPANSION_NAME0;
L["The Burning Crusade"] = EXPANSION_NAME1;
L["Wrath of the Lich King"] = EXPANSION_NAME2;
L["Cataclysm"] = EXPANSION_NAME3;
L["Mists of Pandaria"] = EXPANSION_NAME4;
L["Warlords of Draenor"] = EXPANSION_NAME5;
L["Legion"] = EXPANSION_NAME6;
L["Battle for Azeroth"] = EXPANSION_NAME7;
L["Shadowlands"] = EXPANSION_NAME8;
L["Scenarios"] = SCENARIOS;
L["Garrison"] = GARRISON_LOCATION_TOOLTIP;
L["Cities"] = BUG_CATEGORY4;
L["Mythic"] = PLAYER_DIFFICULTY6;
L["Heroic"] = PLAYER_DIFFICULTY2;
L["Completed"] = CRITERIA_COMPLETED;
L["Not Completed"] = CRITERIA_NOT_COMPLETED;
L["Faction"] = FACTION;
L["Neutral"] = FACTION_NEUTRAL or FACTION_STANDING_LABEL4; -- Wrath Classic fallback FACTION_STANDING_LABEL4
L["Alliance"] = FACTION_ALLIANCE;
L["Horde"] = FACTION_HORDE;
L["Kyrian"] = addon.GetCovenantName(1);
L["Venthyr"] = addon.GetCovenantName(2);
L["Night Fae"] = addon.GetCovenantName(3);
L["Necrolord"] = addon.GetCovenantName(4);
L["Sort By"] = RAID_FRAME_SORT_LABEL;
L["Default"] = CHAT_DEFAULT;
L["Name"] = NAME;
L["Achievements"] = ACHIEVEMENTS;
L["Guild"] = ACHIEVEMENTS_GUILD_TAB;
L["Statistics"] = STATISTICS;
L["Categories"] = CATEGORIES;
L["Help"] = GAMEMENU_HELP;
L["Options"] = GAMEOPTIONS_MENU;
L["Missing"] = ADDON_MISSING;
L["General"] = GENERAL;
L["Info"] = INFO;
L["Version"] = GAME_VERSION_LABEL;
L["Icon"] = EMBLEM_SYMBOL;
L["Key Binding"] = KEY_BINDING;
L["Achievement Points"] = ACHIEVEMENT_POINTS;
L["Enabled"] = PVP_WAR_MODE_ENABLED or VIDEO_OPTIONS_ENABLED;
L["Disabled"] = ADDON_DISABLED;
L["Show All %d Results"] = ENCOUNTER_JOURNAL_SHOW_SEARCH_RESULTS;
L["Game Menu"] = MAINMENU_BUTTON;
L["Interface"] = UIOPTIONS_MENU;
L["AddOns"] = ADDONS;
L["Miscellaneous"] = AUCTION_CATEGORY_MISCELLANEOUS;
L["Close"] = CLOSE;
L["Summary"] = ACHIEVEMENT_SUMMARY_CATEGORY;
L["Achievements Earned"] = ACHIEVEMENTS_COMPLETED;
L["Key Bindings"] = KEY_BINDINGS;
L["Keybindings"] = SETTINGS_KEYBINDINGS_LABEL or KEY_BINDINGS; -- Wrath Classic fallback KEY_BINDINGS
L["Bindings"] = KEY_BINDINGS_MAC;
L["January"] = MONTH_JANUARY;
L["February"] = MONTH_FEBRUARY;
L["March"] = MONTH_MARCH;
L["April"] = MONTH_APRIL;
L["May"] = MONTH_MAY;
L["June"] = MONTH_JUNE;
L["July"] = MONTH_JULY;
L["August"] = MONTH_AUGUST;
L["September"] = MONTH_SEPTEMBER;
L["October"] = MONTH_OCTOBER;
L["November"] = MONTH_NOVEMBER;
L["December"] = MONTH_DECEMBER;
L["Weekdays"] = GUILD_AVAILABILITY_WEEKDAYS;
L["Minimap"] = MINIMAP_LABEL;
L["Class"] = CLASS;
L["Category"] = CATEGORY;
L["World Map"] = WORLDMAP_BUTTON;
L["Delete"] = DELETE;