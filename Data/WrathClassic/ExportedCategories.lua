local _, k = ...;
local data = k.Data;
data.ExportedCategories = {};
local exportedCategories = data.ExportedCategories;
local objects = k.Objects;
local category = objects.Category;

local tasks, categories, adjustableCategories, achievements, tabs;
function exportedCategories.RegisterTasks(_categories, _adjustableCategories, _achievements, _tabs)
    categories, adjustableCategories, achievements, tabs = _categories, _adjustableCategories, _achievements, _tabs;
    wipe(adjustableCategories.WatchListCategories);
    wipe(adjustableCategories.CurrentZoneCategories);
    wipe(adjustableCategories.SelectedZoneCategories);
    wipe(adjustableCategories.SearchResultsCategories);
    wipe(adjustableCategories.TrackingAchievementsCategories);
    wipe(adjustableCategories.ExcludedCategories);

    local name = "Categories";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

local function N(id, ...)
    categories[id] = category:New(...);
end

local function C(cId1, cId2)
    categories[cId1]:AddCategory(categories[cId2]);
end

local function A(cId, aId)
    categories[cId]:AddAchievement(achievements[aId]);
end

local function V(cId)
    categories[cId]:SetAlwaysVisible(true);
end

local function T(cId, tabName)
    categories[cId]:SetTabName(tabName);
    tabs[tabName].Categories = categories[cId].Children;
end

local function F(cId, adjustableCategoryName)
    categories[cId]:SetFlexibleData(true);
    tinsert(adjustableCategories[adjustableCategoryName], categories[cId]);
end

local function S(cId)
    categories[cId]:SetAsSummary(true);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-04 18-10-01 ]] --
tasks = {
    {F, 857, "ExcludedCategories"},
    {C, 971, 857},
    {N, 857,k.L["Excluded"]}, -- Excluded
    function() categories[1367].IsTracking = true; end,
    {F, 1367, "TrackingAchievementsCategories"},
    {C, 971, 1367},
    {N, 1367,k.L["Tracking Achievements"]}, -- Tracking Achievements
    {C, 1346, 1347},
    {N, 1347,k.GetCategoryInfoTitle(15439)}, -- Shadowlands
    {C, 1346, 1348},
    {N, 1348,k.GetCategoryInfoTitle(15305)}, -- Battle for Azeroth
    {C, 1346, 1349},
    {N, 1349,k.GetCategoryInfoTitle(15258)}, -- Legion
    {C, 1346, 1350},
    {N, 1350,k.GetCategoryInfoTitle(15233)}, -- Warlords of Dreanor
    {C, 1346, 1351},
    {N, 1351,k.GetCategoryInfoTitle(15164)}, -- Mists of Pandaria
    {C, 1346, 1352},
    {N, 1352,k.GetCategoryInfoTitle(15072)}, -- Cataclysm
    {A, 1378, 1956}, -- Higher Learning
    {C, 1346, 1378},
    {N, 1378,k.GetCategoryInfoTitle(14866)}, -- Wrath of the Lich King
    {C, 1346, 1356},
    {N, 1356,k.GetCategoryInfoTitle(15101)}, -- Darkmoon Faire
    {C, 1355, 1357},
    {N, 1357,k.GetCategoryInfoTitle(15117) .. " " .. k.GetCategoryInfoTitle(15272)}, -- Pet Battles Dungeons
    {C, 1346, 1355},
    {N, 1355,k.GetCategoryInfoTitle(168)}, -- Dungeons & Raids
    {C, 1346, 1354},
    {N, 1354,k.GetCategoryInfoTitle(15246)}, -- Collections
    {A, 1353, 2516}, -- Lil' Game Hunter
    {A, 1353, 1250}, -- "Shop Smart, Shop Pet...Smart"
    {C, 1346, 1353},
    {N, 1353,k.GetCategoryInfoTitle(15117)}, -- Pet Battles
    {A, 1346, 3478}, -- Pilgrim
    {C, 971, 1346},
    {N, 1346,k.L["Ta's Pet Collection"]}, -- Ta's Pet Collection
    {C, 1117, 1539},
    {N, 1539,k.L["Warcraft Rumble"], true}, -- Warcraft Rumble
    {C, 1117, 1125},
    {N, 1125,k.L["Warcraft III: Reforged"], true}, -- Warcraft III: Reforged
    {C, 1117, 1124},
    {N, 1124,k.L["Heroes of the Storm"], true}, -- Heroes of the Storm
    {C, 1117, 1123},
    {N, 1123,k.L["Hearthstone"], true}, -- Hearthstone
    {A, 1122, 4824}, -- Collector's Edition: Mini Thor
    {C, 1117, 1122},
    {N, 1122,k.L["StarCraft II"], true}, -- StarCraft II
    {C, 1117, 1121},
    {N, 1121,k.L["Overwatch"], true}, -- Overwatch
    {C, 1117, 1400},
    {N, 1400,k.L["Diablo IV"], true}, -- Diablo IV
    {C, 1117, 1120},
    {N, 1120,k.L["Diablo III"], true}, -- Diablo III
    {A, 1119, 16332}, -- The Perfect Pebble
    {A, 1119, 683}, -- Collector's Edition: Frost Wyrm Whelp
    {A, 1119, 665}, -- Collector's Edition: Netherwhelp
    {A, 1119, 664}, -- Collector's Edition: Zergling
    {A, 1119, 663}, -- Collector's Edition: Panda
    {A, 1119, 662}, -- Collector's Edition: Mini-Diablo
    {C, 1117, 1119},
    {N, 1119,k.L["Collector's Edition"], true}, -- Collector's Edition
    {A, 1118, 3536}, -- The Marine Marine
    {A, 1118, 415}, -- Big Blizzard Bear
    {A, 1118, 412}, -- Murloc Costume
    {A, 1118, 411}, -- Murky
    {C, 1117, 1118},
    {N, 1118,k.L["BlizzCon"], true}, -- BlizzCon
    {A, 1117, 414}, -- Tyrael's Hilt
    {C, 971, 1117},
    {N, 1117,k.GetCategoryInfoTitle(15268)}, -- Promotions
    {A, 1115, 4576}, -- Realm First! Fall of the Lich King
    {A, 1115, 4078}, -- Realm First! Grand Crusader
    {A, 1115, 3259}, -- Realm First! Celestial Defender
    {A, 1115, 3117}, -- Realm First! Death's Demise
    {A, 1115, 1400}, -- Realm First! Magic Seeker
    {A, 1115, 456}, -- Realm First! Obsidian Slayer
    {A, 1115, 1402}, -- Realm First! Conqueror of Naxxramas
    {C, 1105, 1115},
    {N, 1115,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1105, 1114},
    {N, 1114,k.GetCategoryInfoTitle(15272), true}, -- Dungeons
    {A, 1116, 1463}, -- Realm First! Northrend Vanguard
    {C, 1105, 1116},
    {N, 1116,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 1111, 1427}, -- Realm First! Grand Master Tailor
    {A, 1111, 1426}, -- Realm First! Grand Master Skinner
    {A, 1111, 1422}, -- Realm First! Grand Master Scribe
    {A, 1111, 1425}, -- Realm First! Grand Master Miner
    {A, 1111, 1419}, -- Realm First! Grand Master Medic
    {A, 1111, 1424}, -- Realm First! Grand Master Leatherworker
    {A, 1111, 1423}, -- Realm First! Grand Master Jewelcrafter
    {A, 1111, 1421}, -- Realm First! Grand Master Herbalist
    {A, 1111, 1418}, -- Realm First! Grand Master Engineer
    {A, 1111, 1417}, -- Realm First! Grand Master Enchanter
    {A, 1111, 1416}, -- Realm First! Grand Master Cook
    {A, 1111, 1414}, -- Realm First! Grand Master Blacksmith
    {A, 1111, 1420}, -- Realm First! Grand Master Angler
    {A, 1111, 1415}, -- Realm First! Grand Master Alchemist
    {C, 1110, 1111},
    {N, 1111,k.L["450 skill"], true}, -- 450 skill
    {C, 1105, 1110},
    {N, 1110,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 1107, 1406}, -- Realm First! Level 80 Draenei
    {A, 1107, 1405}, -- Realm First! Level 80 Blood Elf
    {A, 1107, 1412}, -- Realm First! Level 80 Troll
    {A, 1107, 1404}, -- Realm First! Level 80 Gnome
    {A, 1107, 1411}, -- Realm First! Level 80 Tauren
    {A, 1107, 1413}, -- Realm First! Level 80 Forsaken
    {A, 1107, 1409}, -- Realm First! Level 80 Night Elf
    {A, 1107, 1407}, -- Realm First! Level 80 Dwarf
    {A, 1107, 1410}, -- Realm First! Level 80 Orc
    {A, 1107, 1408}, -- Realm First! Level 80 Human
    {A, 1107, 466}, -- Realm First! Level 80 Druid
    {A, 1107, 463}, -- Realm First! Level 80 Warlock
    {A, 1107, 460}, -- Realm First! Level 80 Mage
    {A, 1107, 467}, -- Realm First! Level 80 Shaman
    {A, 1107, 461}, -- Realm First! Level 80 Death Knight
    {A, 1107, 464}, -- Realm First! Level 80 Priest
    {A, 1107, 458}, -- Realm First! Level 80 Rogue
    {A, 1107, 462}, -- Realm First! Level 80 Hunter
    {A, 1107, 465}, -- Realm First! Level 80 Paladin
    {A, 1107, 459}, -- Realm First! Level 80 Warrior
    {A, 1107, 457}, -- Realm First! Level 80
    {C, 1106, 1107},
    {N, 1107,k.L["Level 80"], true}, -- Level 80
    {C, 1105, 1106},
    {N, 1106,k.L["Leveling"]}, -- Leveling
    {C, 971, 1105},
    {N, 1105,k.L["Realm First!"]}, -- Realm First!
    {C, 1101, 1104},
    {N, 1104,k.GetCategoryInfoTitle(95)}, -- Player vs. Player
    {C, 1101, 1103},
    {N, 1103,k.GetCategoryInfoTitle(15271)}, -- Raids
    {C, 1101, 1102},
    {N, 1102,k.GetCategoryInfoTitle(15246)}, -- Collections
    {C, 971, 1101},
    {N, 1101,(UnitName("player")) .. " " .. (GetTitleName(334))}, -- Player the Fabulous
    {C, 1093, 1099},
    {N, 1099,k.L["Rated"], true}, -- Rated
    {A, 1098, 1175}, -- Battlemaster
    {A, 1098, 230}, -- Battlemaster
    {A, 1098, 714}, -- The Conqueror
    {A, 1098, 907}, -- The Justicar
    {C, 1093, 1098},
    {N, 1098,k.GetCategoryInfoTitle(153), true}, -- Battlegrounds
    {C, 1093, 1097},
    {N, 1097,k.L["Dueler's Guild"], true}, -- Dueler's Guild
    {C, 1093, 1095},
    {N, 1095,k.GetCategoryInfoTitle(15283), true}, -- World
    {A, 1096, 870}, -- 100000 Honorable Kills
    {C, 1093, 1096},
    {N, 1096,k.GetCategoryInfoTitle(15266), true}, -- Honor
    {C, 1084, 1093},
    {N, 1093,k.GetCategoryInfoTitle(95), true}, -- PvP
    {A, 1094, 1691}, -- Merrymaker
    {A, 1094, 1692}, -- Merrymaker
    {A, 1094, 3656}, -- Pilgrim
    {A, 1094, 3478}, -- Pilgrim
    {A, 1094, 1657}, -- Hallowed Be Thy Name
    {A, 1094, 1656}, -- Hallowed Be Thy Name
    {A, 1094, 1683}, -- Brewmaster
    {A, 1094, 1684}, -- Brewmaster
    {A, 1094, 1039}, -- The Flame Keeper
    {A, 1094, 1038}, -- The Flame Warden
    {A, 1094, 1793}, -- For the Children
    {A, 1094, 2798}, -- Noble Gardener
    {A, 1094, 2797}, -- Noble Gardener
    {A, 1094, 1693}, -- Fool For Love
    {A, 1094, 1707}, -- Fool For Love
    {A, 1094, 913}, -- To Honor One's Elders
    {C, 1084, 1094},
    {N, 1094,k.L["Events"], true}, -- Events
    {A, 1092, 1784}, -- Hail to the Chef
    {A, 1092, 1563}, -- Hail to the Chef
    {A, 1092, 1516}, -- Accomplished Angler
    {C, 1084, 1092},
    {N, 1092,k.GetCategoryInfoTitle(169), true}, -- Professions
    {C, 1084, 1091},
    {N, 1091,k.GetCategoryInfoTitle(15246), true}, -- Collections
    {C, 1084, 1090},
    {N, 1090,k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")", true}, -- Brawler's Guild
    {C, 1084, 1089},
    {N, 1089,k.GetCategoryInfoTitle(15117), true}, -- Pet Battles
    {A, 1087, 4477}, -- Looking For Many
    {C, 1084, 1087},
    {N, 1087,k.GetCategoryInfoTitle(15272), true}, -- Dungeons
    {A, 1088, 1015}, -- 40 Exalted Reputations
    {C, 1084, 1088},
    {N, 1088,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 1086, 46}, -- Universal Explorer
    {C, 1084, 1086},
    {N, 1086,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 1085, 1682}, -- The Loremaster
    {A, 1085, 1681}, -- The Loremaster
    {A, 1085, 978}, -- 3000 Quests Completed
    {C, 1084, 1085},
    {N, 1085,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 1043, 1084},
    {N, 1084,k.L["Other"]}, -- Other
    {C, 1053, 1083},
    {N, 1083,k.GetCategoryInfoTitle(15441), true}, -- Covenant Sanctums
    {C, 1053, 1082},
    {N, 1082,k.GetCategoryInfoTitle(15440), true}, -- Torghast
    {C, 1053, 1081},
    {N, 1081,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1053, 1080},
    {N, 1080,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1043, 1053},
    {N, 1053,k.GetCategoryInfoTitle(15439)}, -- Shadowlands
    {C, 1052, 1079},
    {N, 1079,k.GetCategoryInfoTitle(15426), true}, -- Visions of N'Zoth
    {C, 1052, 1078},
    {N, 1078,k.GetCategoryInfoTitle(15417), true}, -- Heart of Azeroth
    {C, 1052, 1077},
    {N, 1077,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1052, 1076},
    {N, 1076,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1052, 1075},
    {N, 1075,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 1043, 1052},
    {N, 1052,k.GetCategoryInfoTitle(15305)}, -- Battle for Azeroth
    {C, 1051, 1072},
    {N, 1072,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1051, 1071},
    {N, 1071,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1051, 1070},
    {N, 1070,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1051, 1074},
    {N, 1074,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 1043, 1051},
    {N, 1051,k.GetCategoryInfoTitle(15258)}, -- Legion
    {C, 1050, 1069},
    {N, 1069,k.L["Garrison"], true}, -- Garrison
    {C, 1050, 1068},
    {N, 1068,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1050, 1067},
    {N, 1067,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1050, 1066},
    {N, 1066,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1043, 1050},
    {N, 1050,k.GetCategoryInfoTitle(15233)}, -- Warlords of Dreanor
    {C, 1049, 1064},
    {N, 1064,k.L["Scenarios"], true}, -- Scenarios
    {C, 1049, 1063},
    {N, 1063,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1049, 1062},
    {N, 1062,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1049, 1061},
    {N, 1061,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1043, 1049},
    {N, 1049,k.GetCategoryInfoTitle(15164)}, -- Mists of Pandaria
    {C, 1048, 1060},
    {N, 1060,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1048, 1059},
    {N, 1059,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1048, 1058},
    {N, 1058,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 1043, 1048},
    {N, 1048,k.GetCategoryInfoTitle(15072)}, -- Cataclysm
    {A, 1056, 4584}, -- The Light of Dawn
    {A, 1056, 4597}, -- The Frozen Throne (25 player)
    {A, 1056, 4583}, -- Bane of the Fallen King
    {A, 1056, 3037}, -- Observed (25 player)
    {A, 1056, 3036}, -- Observed (10 player)
    {A, 1056, 3316}, -- Herald of the Titans
    {A, 1056, 1658}, -- Champion of the Frozen Wastes
    {A, 1056, 2054}, -- The Twilight Zone (25 player)
    {A, 1056, 2051}, -- The Twilight Zone (10 player)
    {C, 1047, 1056},
    {N, 1056,k.GetCategoryInfoTitle(15271), true}, -- Raids
    {C, 1047, 1057},
    {N, 1057,k.GetCategoryInfoTitle(15272), true}, -- Dungeons
    {A, 1054, 2816}, -- Exalted Argent Champion of the Horde
    {A, 1054, 2817}, -- Exalted Argent Champion of the Alliance
    {A, 1054, 2766}, -- Exalted Champion of Sen'jin
    {A, 1054, 2762}, -- Exalted Champion of Gnomeregan
    {A, 1054, 2767}, -- Exalted Champion of Silvermoon City
    {A, 1054, 2761}, -- Exalted Champion of the Exodar
    {A, 1054, 2768}, -- Exalted Champion of Thunder Bluff
    {A, 1054, 2760}, -- Exalted Champion of Darnassus
    {A, 1054, 2769}, -- Exalted Champion of the Undercity
    {A, 1054, 2763}, -- Exalted Champion of Ironforge
    {A, 1054, 2765}, -- Exalted Champion of Orgrimmar
    {A, 1054, 2764}, -- Exalted Champion of Stormwind
    {A, 1054, 945}, -- The Argent Champion
    {A, 1054, 953}, -- Guardian of Cenarius
    {A, 1054, 4598}, -- The Ashen Verdict
    {A, 1054, 943}, -- The Diplomat
    {A, 1054, 942}, -- The Diplomat
    {C, 1047, 1054},
    {N, 1054,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1043, 1047},
    {N, 1047,k.GetCategoryInfoTitle(14866)}, -- Wrath of the Lich King
    {A, 1065, 2336}, -- Insane in the Membrane
    {A, 1065, 871}, -- "Avast Ye, Admiral!"
    {A, 1065, 762}, -- Ambassador of the Horde
    {A, 1065, 948}, -- Ambassador of the Alliance
    {C, 1045, 1065},
    {N, 1065,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 1043, 1045},
    {N, 1045,k.GetCategoryInfoTitle(14864)}, -- Classic
    {C, 971, 1043},
    {N, 1043,k.L["The Entitled"] .. " " .. (UnitName("player"))}, -- The Entitled Player
    {C, 972, 1409},
    {N, 1409,k.L["Recruit-a-Friend"]}, -- Recruit-a-Friend
    {A, 988, 1436}, -- Friends In High Places
    {C, 972, 988},
    {N, 988,k.L["Recruit-a-Friend"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"}, -- Recruit-a-Friend
    {A, 978, 4600}, -- Wrathful Gladiator's Frost Wyrm
    {A, 978, 3757}, -- Relentless Gladiator's Frost Wyrm
    {A, 978, 3756}, -- Furious Gladiator's Frost Wyrm
    {A, 978, 3096}, -- Deadly Gladiator's Frost Wyrm
    {A, 978, 2316}, -- Brutal Nether Drake
    {A, 978, 888}, -- Vengeful Nether Drake
    {A, 978, 887}, -- Merciless Nether Drake
    {A, 978, 886}, -- Swift Nether Drake
    {C, 977, 978},
    {N, 978,(select(2, k.GetAchievementInfo(2091))), true}, -- Gladiator
    {C, 972, 977},
    {N, 977,k.GetCategoryInfoTitle(95)}, -- PvP
    {A, 981, 4603}, -- Glory of the Icecrown Raider (25 player)
    {A, 981, 4602}, -- Glory of the Icecrown Raider (10 player)
    {A, 981, 2958}, -- Glory of the Ulduar Raider (25 player)
    {A, 981, 2957}, -- Glory of the Ulduar Raider (10 player)
    {C, 982, 981},
    {N, 981,k.L["Glory"], true}, -- Glory
    {A, 984, 4625}, -- Invincible's Reins
    {A, 984, 4626}, -- And I'll Form the Head!
    {A, 984, 2081}, -- Grand Black War Mammoth
    {A, 984, 430}, -- Amani War Bear
    {A, 984, 885}, -- Ashes of Al'ar
    {A, 984, 882}, -- Fiery Warhorse's Reins
    {A, 984, 424}, -- Why? Because It's Red
    {A, 984, 881}, -- Swift Razzashi Raptor
    {A, 984, 880}, -- Swift Zulian Tiger
    {C, 982, 984},
    {N, 984,k.L["Drops"], true}, -- Drops
    {C, 972, 982},
    {N, 982,k.GetCategoryInfoTitle(15271)}, -- Raids
    {A, 980, 2136}, -- Glory of the Hero
    {C, 979, 980},
    {N, 980,k.L["Glory"], true}, -- Glory
    {A, 983, 884}, -- Swift White Hawkstrider
    {A, 983, 883}, -- Reins of the Raven Lord
    {A, 983, 729}, -- Deathcharger's Reins
    {C, 979, 983},
    {N, 983,k.L["Drops"], true}, -- Drops
    {C, 972, 979},
    {N, 979,k.GetCategoryInfoTitle(15272)}, -- Dungeons
    {A, 989, 879}, -- Old School Ride
    {C, 972, 989},
    {N, 989,k.L["Achievements"]}, -- Achievements
    {A, 987, 2145}, -- "What A Long, Strange Trip It's Been"
    {A, 987, 2144}, -- "What a Long, Strange Trip It's Been"
    {A, 987, 4627}, -- X-45 Heartbreaker
    {A, 987, 3496}, -- A Brew-FAST Mount
    {A, 987, 980}, -- The Horseman's Reins
    {A, 987, 416}, -- Scarab Lord
    {C, 972, 987},
    {N, 987,k.L["Events"]}, -- Events
    {A, 986, 2097}, -- Get to the Choppa!
    {C, 972, 986},
    {N, 986,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 985, 2078}, -- Traveler's Tundra Mammoth
    {A, 985, 2077}, -- Wooly Mammoth
    {A, 985, 2076}, -- Armored Brown Bear
    {C, 972, 985},
    {N, 985,k.L["Vendor"]}, -- Vendor
    {A, 976, 2537}, -- Mountain o' Mounts
    {A, 976, 2536}, -- Mountain o' Mounts
    {A, 976, 2143}, -- Leading the Cavalry
    {A, 976, 2142}, -- Filling Up The Barn
    {A, 976, 2141}, -- Stable Keeper
    {C, 972, 976},
    {N, 976,k.GetCategoryInfoTitle(15246)}, -- Collections
    {A, 972, 3357}, -- Venomhide Ravasaur
    {A, 972, 3356}, -- Winterspring Frostsaber
    {C, 971, 972},
    {N, 972,k.L["Bur's Mount Collection"]}, -- Bur's Mount Collection
    function() categories[1396].IsSearchResults = true; end,
    {F, 1396, "SearchResultsCategories"},
    {C, 971, 1396},
    {N, 1396,k.L["Search Results"]}, -- Search Results
    function() categories[850].IsSelectedZone = true; end,
    {F, 850, "SelectedZoneCategories"},
    {C, 971, 850},
    {N, 850,k.L["Selected Zone"]}, -- Selected Zone
    function() categories[433].IsCurrentZone = true; end,
    {F, 433, "CurrentZoneCategories"},
    {C, 971, 433},
    {N, 433,k.L["Current Zone"]}, -- Current Zone
    function() categories[949].IsWatchList = true; end,
    {F, 949, "WatchListCategories"},
    {C, 971, 949},
    {N, 949,k.L["Watch List"]}, -- Watch List
    {S, 1204},
    {V, 1204},
    {C, 971, 1204},
    {N, 1204,k.L["Summary"]}, -- Summary
    {T, 971, "Specials"},
    {N, 971,k.L["Specials"]}, -- TAB - Specials
    {F, 1227, "ExcludedCategories"},
    {C, 955, 1227},
    {N, 1227,k.L["Excluded"]}, -- Excluded
    function() categories[1368].IsTracking = true; end,
    {F, 1368, "TrackingAchievementsCategories"},
    {C, 955, 1368},
    {N, 1368,k.L["Tracking Achievements"]}, -- Tracking Achievements
    {A, 1200, 4599}, -- Wrathful Gladiator
    {A, 1200, 3758}, -- Relentless Gladiator
    {A, 1200, 3436}, -- Furious Gladiator
    {A, 1200, 3336}, -- Deadly Gladiator
    {C, 955, 1200},
    {N, 1200,k.GetCategoryInfoTitle(14866)}, -- Wrath of the Lich King
    {A, 1199, 420}, -- Brutal Gladiator
    {A, 1199, 419}, -- Vengeful Gladiator
    {A, 1199, 418}, -- Merciless Gladiator
    {C, 955, 1199},
    {N, 1199,k.GetCategoryInfoTitle(14865)}, -- The Burning Crusade
    {A, 1131, 443}, -- High Warlord
    {A, 1131, 433}, -- Grand Marshal
    {A, 1131, 445}, -- Warlord
    {A, 1131, 434}, -- Field Marshal
    {A, 1131, 446}, -- General
    {A, 1131, 473}, -- Marshal
    {A, 1131, 444}, -- Lieutenant General
    {A, 1131, 435}, -- Commander
    {A, 1131, 447}, -- Champion
    {A, 1131, 436}, -- Lieutenant Commander
    {A, 1131, 448}, -- Centurion
    {A, 1131, 437}, -- Knight-Champion
    {A, 1131, 469}, -- Legionnaire
    {A, 1131, 438}, -- Knight-Captain
    {A, 1131, 449}, -- Blood Guard
    {A, 1131, 472}, -- Knight-Lieutenant
    {A, 1131, 451}, -- Stone Guard
    {A, 1131, 439}, -- Knight
    {A, 1131, 452}, -- First Sergeant
    {A, 1131, 440}, -- Sergeant Major
    {A, 1131, 450}, -- Senior Sergeant
    {A, 1131, 441}, -- Master Sergeant
    {A, 1131, 453}, -- Sergeant
    {A, 1131, 471}, -- Sergeant
    {A, 1131, 468}, -- Grunt
    {A, 1131, 470}, -- Corporal
    {A, 1131, 454}, -- Scout
    {A, 1131, 442}, -- Private
    {C, 955, 1131},
    {N, 1131,k.GetCategoryInfoTitle(14864)}, -- Classic
    {A, 1166, 1174}, -- The Arena Master
    {A, 1166, 409}, -- Last Man Standing
    {A, 1166, 2091}, -- Gladiator
    {A, 1166, 2092}, -- Duelist
    {A, 1166, 2093}, -- Rival
    {A, 1166, 2090}, -- Challenger
    {A, 1166, 1162}, -- Hotter Streak
    {A, 1166, 408}, -- Hot Streak
    {A, 1166, 1161}, -- High Five: 2200
    {A, 1166, 404}, -- High Five: 2000
    {A, 1166, 407}, -- High Five: 1750
    {A, 1166, 406}, -- High Five: 1550
    {A, 1166, 1160}, -- Three's Company: 2200
    {A, 1166, 405}, -- Three's Company: 2000
    {A, 1166, 403}, -- Three's Company: 1750
    {A, 1166, 402}, -- Three's Company: 1550
    {A, 1166, 1159}, -- Just the Two of Us: 2200
    {A, 1166, 401}, -- Just the Two of Us: 2000
    {A, 1166, 400}, -- Just the Two of Us: 1750
    {A, 1166, 399}, -- Just the Two of Us: 1550
    {A, 1166, 699}, -- World Wide Winner
    {A, 1166, 876}, -- Brutally Dedicated
    {A, 1166, 875}, -- Vengefully Dedicated
    {A, 1166, 398}, -- Mercilessly Dedicated
    {A, 1166, 397}, -- Step Into The Arena
    {C, 955, 1166},
    {N, 1166,k.GetCategoryInfoTitle(165)}, -- Arena
    {C, 1165, 1032},
    {N, 1032,k.L["Southshore vs. Tarren Mill"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"}, -- Southshore vs. Tarren Mill
    {A, 963, 2776}, -- Master of Wintergrasp
    {A, 963, 1752}, -- Master of Wintergrasp
    {A, 963, 1751}, -- Didn't Stand a Chance
    {A, 963, 1727}, -- Leaning Tower
    {A, 963, 1723}, -- Vehicular Gnomeslaughter
    {A, 963, 2476}, -- Destruction Derby
    {A, 963, 1737}, -- Destruction Derby
    {A, 963, 2080}, -- Black War Mammoth
    {A, 963, 2199}, -- Wintergrasp Ranger
    {A, 963, 1755}, -- Within Our Grasp
    {A, 963, 1718}, -- Wintergrasp Veteran
    {A, 963, 1717}, -- Wintergrasp Victory
    {C, 1165, 963},
    {N, 963,k.GetCategoryInfoTitle(14901)}, -- Wintergrasp
    {A, 958, 712}, -- Warsong Outrider
    {A, 958, 713}, -- Silverwing Sentinel
    {A, 958, 1259}, -- Not So Fast
    {A, 958, 1173}, -- Master of Warsong Gulch
    {A, 958, 1172}, -- Master of Warsong Gulch
    {A, 958, 207}, -- Save the Day
    {A, 958, 1252}, -- Supreme Defender
    {A, 958, 206}, -- Supreme Defender
    {A, 958, 1502}, -- Quick Cap
    {A, 958, 202}, -- Quick Cap
    {A, 958, 1251}, -- Not In My House
    {A, 958, 203}, -- Not In My House
    {A, 958, 204}, -- Ironman
    {A, 958, 201}, -- Warsong Expedience
    {A, 958, 168}, -- Warsong Gulch Perfection
    {A, 958, 872}, -- Frenzied Defender
    {A, 958, 200}, -- Persistent Defender
    {A, 958, 199}, -- Capture the Flag
    {A, 958, 167}, -- Warsong Gulch Veteran
    {A, 958, 166}, -- Warsong Gulch Victory
    {C, 1165, 958},
    {N, 958,k.GetCategoryInfoTitle(14804)}, -- Warsong Gulch
    {C, 1165, 965},
    {N, 965,k.GetCategoryInfoTitle(15074)}, -- Twin Peaks
    {C, 1165, 967},
    {N, 967,k.GetCategoryInfoTitle(15163)}, -- Temple of Kotmogu
    {A, 973, 2195}, -- Master of Strand of the Ancients
    {A, 973, 2194}, -- Master of Strand of the Ancients
    {A, 973, 2200}, -- Defense of the Ancients
    {A, 973, 1757}, -- Defense of the Ancients
    {A, 973, 2191}, -- Ancient Courtyard Protector
    {A, 973, 1766}, -- Ancient Protector
    {A, 973, 2190}, -- Drop It Now!
    {A, 973, 1764}, -- Drop It!
    {A, 973, 2189}, -- Artillery Expert
    {A, 973, 1763}, -- Artillery Veteran
    {A, 973, 2192}, -- Not Even a Scratch
    {A, 973, 1762}, -- Not Even a Scratch
    {A, 973, 2193}, -- Explosives Expert
    {A, 973, 1761}, -- The Dapper Sapper
    {A, 973, 1765}, -- Steady Hands
    {A, 973, 1310}, -- Storm the Beach
    {A, 973, 1309}, -- Strand of the Ancients Veteran
    {A, 973, 1308}, -- Strand of the Ancients Victory
    {C, 1165, 973},
    {N, 973,k.L["Strand of the Ancients"]}, -- Strand of the Ancients
    {C, 1165, 966},
    {N, 966,k.GetCategoryInfoTitle(15162)}, -- Silvershard Mines
    {C, 1165, 968},
    {N, 968,k.GetCategoryInfoTitle(15292)}, -- Seething Shore
    {A, 962, 4176}, -- Resource Glut
    {A, 962, 3846}, -- Resource Glut
    {A, 962, 3845}, -- Isle of Conquest All-Star
    {A, 962, 3957}, -- Master of Isle of Conquest
    {A, 962, 3857}, -- Master of Isle of Conquest
    {A, 962, 3855}, -- Glaive Grave
    {A, 962, 4256}, -- Demolition Derby
    {A, 962, 3856}, -- Demolition Derby
    {A, 962, 3854}, -- Back Door Job
    {A, 962, 3853}, -- All Over the Isle
    {A, 962, 3852}, -- Cut the Blue Wire... No the Red Wire!
    {A, 962, 3850}, -- Mowed Down
    {A, 962, 3849}, -- A-bomb-ination
    {A, 962, 3848}, -- A-bomb-inable
    {A, 962, 3847}, -- Four Car Garage
    {A, 962, 4177}, -- Mine
    {A, 962, 3851}, -- Mine
    {A, 962, 3777}, -- Isle of Conquest Veteran
    {A, 962, 3776}, -- Isle of Conquest Victory
    {C, 1165, 962},
    {N, 962,k.GetCategoryInfoTitle(15003)}, -- Isle of Conquest
    {A, 959, 211}, -- Storm Glory
    {A, 959, 1258}, -- Take a Chill Pill
    {A, 959, 587}, -- Stormy Assassin
    {A, 959, 1171}, -- Master of Eye of the Storm
    {A, 959, 233}, -- Bloodthirsty Berserker
    {A, 959, 216}, -- Bound for Glory
    {A, 959, 212}, -- Storm Capper
    {A, 959, 213}, -- Stormtrooper
    {A, 959, 214}, -- Flurry
    {A, 959, 784}, -- Eye of the Storm Domination
    {A, 959, 783}, -- The Perfect Storm
    {A, 959, 209}, -- Eye of the Storm Veteran
    {A, 959, 208}, -- Eye of the Storm Victory
    {C, 1165, 959},
    {N, 959,k.GetCategoryInfoTitle(14803)}, -- Eye of the Storm
    {C, 1165, 957},
    {N, 957,k.GetCategoryInfoTitle(15218)}, -- Deepwind Gorge
    {C, 1165, 964},
    {N, 964,k.GetCategoryInfoTitle(15073)}, -- Battle for Gilneas
    {C, 1165, 961},
    {N, 961,k.GetCategoryInfoTitle(15414)}, -- Ashran
    {A, 956, 710}, -- The Defiler
    {A, 956, 711}, -- Knight of Arathor
    {A, 956, 1170}, -- Master of Arathi Basin
    {A, 956, 1169}, -- Master of Arathi Basin
    {A, 956, 584}, -- Arathi Basin Assassin
    {A, 956, 583}, -- Arathi Basin All-Star
    {A, 956, 162}, -- We Had It All Along *cough*
    {A, 956, 159}, -- Let's Get This Done
    {A, 956, 156}, -- Territorial Dominance
    {A, 956, 161}, -- Resilient Victory
    {A, 956, 157}, -- To The Rescue!
    {A, 956, 1153}, -- Overly Defensive
    {A, 956, 73}, -- Disgracin' The Basin
    {A, 956, 158}, -- Me and the Cappin' Makin' it Happen
    {A, 956, 165}, -- Arathi Basin Perfection
    {A, 956, 155}, -- Arathi Basin Veteran
    {A, 956, 154}, -- Arathi Basin Victory
    {C, 1165, 956},
    {N, 956,k.GetCategoryInfoTitle(14802)}, -- Arathi Basin
    {A, 960, 708}, -- Hero of the Frostwolf Clan
    {A, 960, 709}, -- Hero of the Stormpike Guard
    {A, 960, 226}, -- The Alterac Blitz
    {A, 960, 1168}, -- Master of Alterac Valley
    {A, 960, 1167}, -- Master of Alterac Valley
    {A, 960, 1166}, -- To the Looter Go the Spoils
    {A, 960, 706}, -- Frostwolf Howler
    {A, 960, 707}, -- Stormpike Battle Charger
    {A, 960, 582}, -- Alterac Valley All-Star
    {A, 960, 873}, -- Frostwolf Perfection
    {A, 960, 220}, -- Stormpike Perfection
    {A, 960, 223}, -- The Sickly Gazelle
    {A, 960, 1164}, -- Everything Counts
    {A, 960, 225}, -- Everything Counts
    {A, 960, 224}, -- Loyal Defender
    {A, 960, 1151}, -- Loyal Defender
    {A, 960, 222}, -- Tower Defense
    {A, 960, 221}, -- Alterac Grave Robber
    {A, 960, 219}, -- Alterac Valley Veteran
    {A, 960, 218}, -- Alterac Valley Victory
    {C, 1165, 960},
    {N, 960,k.GetCategoryInfoTitle(14801)}, -- Alterac Valley
    {A, 1165, 1175}, -- Battlemaster
    {A, 1165, 230}, -- Battlemaster
    {A, 1165, 231}, -- Wrecking Ball
    {A, 1165, 227}, -- Damage Control
    {A, 1165, 909}, -- Call to Arms!
    {A, 1165, 908}, -- Call to Arms!
    {A, 1165, 714}, -- The Conqueror
    {A, 1165, 907}, -- The Justicar
    {A, 1165, 229}, -- The Grim Reaper
    {C, 955, 1165},
    {N, 1165,k.GetCategoryInfoTitle(153)}, -- Battlegrounds
    {C, 955, 1167},
    {N, 1167,k.GetCategoryInfoTitle(15266)}, -- Honor
    {A, 1162, 700}, -- Freedom of the Horde
    {A, 1162, 701}, -- Freedom of the Alliance
    {A, 1162, 3618}, -- Murkimus the Gladiator
    {A, 1162, 727}, -- Call in the Cavalry
    {A, 1162, 247}, -- "Make Love, Not Warcraft"
    {A, 1162, 1005}, -- Know Thy Enemy
    {A, 1162, 246}, -- Know Thy Enemy
    {A, 1162, 245}, -- That Takes Class
    {A, 1162, 1157}, -- Duel-icious
    {A, 1162, 870}, -- 100000 Honorable Kills
    {A, 1162, 869}, -- 50000 Honorable Kills
    {A, 1162, 239}, -- 25000 Honorable Kills
    {A, 1162, 509}, -- 10000 Honorable Kills
    {A, 1162, 512}, -- 5000 Honorable Kills
    {A, 1162, 516}, -- 1000 Honorable Kills
    {A, 1162, 515}, -- 500 Honorable Kills
    {A, 1162, 513}, -- 100 Honorable Kills
    {A, 1162, 238}, -- An Honorable Kill
    {C, 955, 1162},
    {N, 1162,k.GetCategoryInfoTitle(95)}, -- Player vs. Player
    function() categories[1397].IsSearchResults = true; end,
    {F, 1397, "SearchResultsCategories"},
    {C, 955, 1397},
    {N, 1397,k.L["Search Results"]}, -- Search Results
    function() categories[1222].IsSelectedZone = true; end,
    {F, 1222, "SelectedZoneCategories"},
    {C, 955, 1222},
    {N, 1222,k.L["Selected Zone"]}, -- Selected Zone
    function() categories[1215].IsCurrentZone = true; end,
    {F, 1215, "CurrentZoneCategories"},
    {C, 955, 1215},
    {N, 1215,k.L["Current Zone"]}, -- Current Zone
    function() categories[1219].IsWatchList = true; end,
    {F, 1219, "WatchListCategories"},
    {C, 955, 1219},
    {N, 1219,k.L["Watch List"]}, -- Watch List
    {S, 1205},
    {V, 1205},
    {C, 955, 1205},
    {N, 1205,k.L["Summary"]}, -- Summary
    {T, 955, "PvP"},
    {N, 955,k.GetCategoryInfoTitle(95)}, -- TAB - PvP
    {F, 1226, "ExcludedCategories"},
    {C, 884, 1226},
    {N, 1226,k.L["Excluded"]}, -- Excluded
    function() categories[1369].IsTracking = true; end,
    {F, 1369, "TrackingAchievementsCategories"},
    {C, 884, 1369},
    {N, 1369,k.L["Tracking Achievements"]}, -- Tracking Achievements
    {A, 1174, 2116}, -- Tabard of the Argent Dawn
    {A, 1174, 2079}, -- Tabard of the Protector
    {A, 1174, 1637}, -- Spirit of Competition
    {A, 1174, 1636}, -- Competitor's Tabard
    {C, 884, 1174},
    {N, 1174,k.L["Miscellaneous"]}, -- Miscellaneous
    {A, 1030, 2336}, -- Insane in the Membrane
    {C, 925, 1030},
    {N, 1030,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 884, 925},
    {N, 925,k.GetCategoryInfoTitle(15101)}, -- Darkmoon Faire
    {A, 1173, 4400}, -- WoW's 5th Anniversary
    {A, 1173, 2398}, -- WoW's 4th Anniversary
    {C, 884, 1173},
    {N, 1173,k.L["WoW's Anniversary"]}, -- WoW's Anniversary
    {A, 950, 1706}, -- Crashin' Thrashin' Racer
    {A, 950, 1705}, -- Clockwork Rocket Bot
    {C, 917, 950},
    {N, 950,k.L["Gifts"], true}, -- Gifts
    {A, 917, 1691}, -- Merrymaker
    {A, 917, 1692}, -- Merrymaker
    {A, 917, 4437}, -- BB King
    {A, 917, 4436}, -- BB King
    {A, 917, 1690}, -- A Frosty Shake
    {A, 917, 1689}, -- He Knows If You've Been Naughty
    {A, 917, 1688}, -- The Winter Veil Gourmet
    {A, 917, 1686}, -- Holiday Bromance
    {A, 917, 1685}, -- Holiday Bromance
    {A, 917, 1687}, -- Let It Snow
    {A, 917, 279}, -- Simply Abominable
    {A, 917, 1295}, -- Crashin' & Thrashin'
    {A, 917, 277}, -- 'Tis the Season
    {A, 917, 1282}, -- Fa-la-la-la-Ogri'la
    {A, 917, 1255}, -- Scrooge
    {A, 917, 259}, -- Scrooge
    {A, 917, 252}, -- With a Little Helper from My Friends
    {A, 917, 273}, -- On Metzen!
    {C, 918, 917},
    {N, 917,k.GetCategoryInfoTitle(156)}, -- Winter Veil
    {A, 916, 3656}, -- Pilgrim
    {A, 916, 3478}, -- Pilgrim
    {A, 916, 3559}, -- Turkey Lurkey
    {A, 916, 3578}, -- The Turkinator
    {A, 916, 3582}, -- Terokkar Turkey Time
    {A, 916, 3558}, -- Sharing is Caring
    {A, 916, 3597}, -- Pilgrim's Progress
    {A, 916, 3596}, -- Pilgrim's Progress
    {A, 916, 3581}, -- Pilgrim's Peril
    {A, 916, 3580}, -- Pilgrim's Peril
    {A, 916, 3557}, -- Pilgrim's Paunch
    {A, 916, 3556}, -- Pilgrim's Paunch
    {A, 916, 3577}, -- Now We're Cookin'
    {A, 916, 3576}, -- Now We're Cookin'
    {A, 916, 3579}, -- """FOOD FIGHT!"""
    {C, 918, 916},
    {N, 916,k.GetCategoryInfoTitle(14981)}, -- Pilgrim's Bounty
    {A, 920, 3456}, -- Dead Man's Party
    {C, 918, 920},
    {N, 920,k.L["Day of the Dead"]}, -- Day of the Dead
    {A, 915, 1657}, -- Hallowed Be Thy Name
    {A, 915, 1656}, -- Hallowed Be Thy Name
    {A, 915, 971}, -- Tricks and Treats of Azeroth
    {A, 915, 970}, -- Tricks and Treats of Azeroth
    {A, 915, 968}, -- Tricks and Treats of Outland
    {A, 915, 969}, -- Tricks and Treats of Outland
    {A, 915, 965}, -- Tricks and Treats of Kalimdor
    {A, 915, 963}, -- Tricks and Treats of Kalimdor
    {A, 915, 967}, -- Tricks and Treats of Eastern Kingdoms
    {A, 915, 966}, -- Tricks and Treats of Eastern Kingdoms
    {A, 915, 292}, -- Sinister Calling
    {A, 915, 283}, -- The Masquerade
    {A, 915, 291}, -- Check Your Head
    {A, 915, 1261}, -- G.N.E.R.D. Rage
    {A, 915, 1041}, -- Rotten Hallow
    {A, 915, 1040}, -- Rotten Hallow
    {A, 915, 981}, -- That Sparkling Smile
    {A, 915, 284}, -- A Mask for All Occasions
    {A, 915, 979}, -- The Mask Task
    {A, 915, 289}, -- The Savior of Hallow's End
    {A, 915, 255}, -- Bring Me The Head of... Oh Wait
    {A, 915, 288}, -- Out With It
    {A, 915, 972}, -- Trick or Treat!
    {C, 918, 915},
    {N, 915,k.GetCategoryInfoTitle(158)}, -- Hallow's End
    {A, 914, 1186}, -- Down With The Dark Iron
    {A, 914, 4782}, -- Green Brewfest Stein
    {A, 914, 1293}, -- Blue Brewfest Stein
    {A, 914, 1292}, -- Yellow Brewfest Stein
    {A, 914, 1683}, -- Brewmaster
    {A, 914, 1684}, -- Brewmaster
    {A, 914, 303}, -- "Have Keg, Will Travel"
    {A, 914, 293}, -- Disturbing the Peace
    {A, 914, 295}, -- Direbrewfest
    {A, 914, 1260}, -- Almost Blind Luck
    {A, 914, 1183}, -- Brew of the Year
    {A, 914, 2796}, -- Brew of the Month
    {A, 914, 1185}, -- The Brewfest Diet
    {A, 914, 1936}, -- Does Your Wolpertinger Linger?
    {A, 914, 1203}, -- Strange Brew
    {A, 914, 1184}, -- Strange Brew
    {C, 918, 914},
    {N, 914,k.GetCategoryInfoTitle(162)}, -- Brewfest
    {A, 919, 3457}, -- The Captain's Booty
    {C, 918, 919},
    {N, 919,k.L["Pirates' Day"]}, -- Pirates' Day
    {A, 913, 1039}, -- The Flame Keeper
    {A, 913, 1038}, -- The Flame Warden
    {A, 913, 1037}, -- Desecration of the Alliance
    {A, 913, 1035}, -- Desecration of the Horde
    {A, 913, 1033}, -- Extinguishing Outland
    {A, 913, 1030}, -- Extinguishing Outland
    {A, 913, 1032}, -- Extinguishing Kalimdor
    {A, 913, 1029}, -- Extinguishing Kalimdor
    {A, 913, 1031}, -- Extinguishing Eastern Kingdoms
    {A, 913, 1028}, -- Extinguishing Eastern Kingdoms
    {A, 913, 1036}, -- The Fires of Azeroth
    {A, 913, 1034}, -- The Fires of Azeroth
    {A, 913, 1027}, -- Flame Keeper of Outland
    {A, 913, 1024}, -- Flame Warden of Outland
    {A, 913, 1026}, -- Flame Keeper of Kalimdor
    {A, 913, 1023}, -- Flame Warden of Kalimdor
    {A, 913, 1025}, -- Flame Keeper of Eastern Kingdoms
    {A, 913, 1022}, -- Flame Warden of Eastern Kingdoms
    {A, 913, 272}, -- Torch Juggler
    {A, 913, 1145}, -- King of the Fire Festival
    {A, 913, 271}, -- Burning Hot Pole Dance
    {A, 913, 263}, -- Ice the Frost Lord
    {C, 918, 913},
    {N, 913,k.GetCategoryInfoTitle( 161)}, -- Midsummer
    {A, 912, 1793}, -- For the Children
    {A, 912, 275}, -- Veteran Nanny
    {A, 912, 1790}, -- "Hail To The King, Baby"
    {A, 912, 1786}, -- School of Hard Knocks
    {A, 912, 1792}, -- "Aw, Isn't It Cute?"
    {A, 912, 1789}, -- Daily Chores
    {A, 912, 1788}, -- Bad Example
    {A, 912, 1791}, -- Home Alone
    {C, 918, 912},
    {N, 912,k.GetCategoryInfoTitle(163)}, -- Children's Week
    {A, 911, 2798}, -- Noble Gardener
    {A, 911, 2797}, -- Noble Gardener
    {A, 911, 2576}, -- Blushing Bride
    {A, 911, 2436}, -- Desert Rose
    {A, 911, 2422}, -- Shake Your Bunny-Maker
    {A, 911, 2420}, -- Noble Garden
    {A, 911, 2421}, -- Noble Garden
    {A, 911, 2497}, -- Spring Fling
    {A, 911, 2419}, -- Spring Fling
    {A, 911, 2416}, -- Hard Boiled
    {A, 911, 249}, -- Dressed for the Occasion
    {A, 911, 248}, -- Sunday's Finest
    {A, 911, 2418}, -- Chocoholic
    {A, 911, 2417}, -- Chocolate Lover
    {A, 911, 2676}, -- I Found One!
    {C, 918, 911},
    {N, 911,k.GetCategoryInfoTitle(159)}, -- Noblegarden
    {A, 910, 1693}, -- Fool For Love
    {A, 910, 1707}, -- Fool For Love
    {A, 910, 4624}, -- Tough Love
    {A, 910, 1702}, -- Sweet Tooth
    {A, 910, 1188}, -- Shafted!
    {A, 910, 1696}, -- The Rocket's Pink Glare
    {A, 910, 1700}, -- Perma-Peddle
    {A, 910, 1698}, -- Nation of Adoration
    {A, 910, 1697}, -- Nation of Adoration
    {A, 910, 1703}, -- "My Love is Like a Red, Red Rose"
    {A, 910, 1694}, -- Lovely Luck Is On Your Side
    {A, 910, 1291}, -- Lonely?
    {A, 910, 1704}, -- I Pitied The Fool
    {A, 910, 1280}, -- Flirt With Disaster
    {A, 910, 1279}, -- Flirt With Disaster
    {A, 910, 1699}, -- Fistful of Love
    {A, 910, 1695}, -- Dangerous Love
    {A, 910, 260}, -- Charming
    {A, 910, 1701}, -- Be Mine!
    {C, 918, 910},
    {N, 910,k.GetCategoryInfoTitle(187)}, -- Love is in the Air
    {A, 885, 913}, -- To Honor One's Elders
    {A, 885, 910}, -- Elders of the Dungeons
    {A, 885, 1396}, -- Elders of Northrend
    {A, 885, 911}, -- Elders of Kalimdor
    {A, 885, 912}, -- Elders of Eastern Kingdoms
    {A, 885, 914}, -- Elders of the Horde
    {A, 885, 915}, -- Elders of the Alliance
    {A, 885, 937}, -- Elune's Blessing
    {A, 885, 1552}, -- Frenzied Firecracker
    {A, 885, 1281}, -- The Rocket's Red Glare
    {A, 885, 626}, -- Lunar Festival Finery
    {A, 885, 609}, -- 50 Coins of Ancestry
    {A, 885, 608}, -- 25 Coins of Ancestry
    {A, 885, 607}, -- 10 Coins of Ancestry
    {A, 885, 606}, -- 5 Coins of Ancestry
    {A, 885, 605}, -- A Coin of Ancestry
    {C, 918, 885},
    {N, 885,k.GetCategoryInfoTitle(160)}, -- Lunar Festival
    {A, 918, 2145}, -- "What A Long, Strange Trip It's Been"
    {A, 918, 2144}, -- "What a Long, Strange Trip It's Been"
    {C, 884, 918},
    {N, 918,k.L["Holidays"]}, -- Holidays
    function() categories[1398].IsSearchResults = true; end,
    {F, 1398, "SearchResultsCategories"},
    {C, 884, 1398},
    {N, 1398,k.L["Search Results"]}, -- Search Results
    function() categories[1221].IsSelectedZone = true; end,
    {F, 1221, "SelectedZoneCategories"},
    {C, 884, 1221},
    {N, 1221,k.L["Selected Zone"]}, -- Selected Zone
    function() categories[1214].IsCurrentZone = true; end,
    {F, 1214, "CurrentZoneCategories"},
    {C, 884, 1214},
    {N, 1214,k.L["Current Zone"]}, -- Current Zone
    function() categories[1218].IsWatchList = true; end,
    {F, 1218, "WatchListCategories"},
    {C, 884, 1218},
    {N, 1218,k.L["Watch List"]}, -- Watch List
    {S, 1206},
    {V, 1206},
    {C, 884, 1206},
    {N, 1206,k.L["Summary"]}, -- Summary
    {T, 884, "Events"},
    {N, 884,k.L["Events"]}, -- TAB - Events
    {F, 1225, "ExcludedCategories"},
    {C, 883, 1225},
    {N, 1225,k.L["Excluded"]}, -- Excluded
    function() categories[1370].IsTracking = true; end,
    {F, 1370, "TrackingAchievementsCategories"},
    {C, 883, 1370},
    {N, 1370,k.L["Tracking Achievements"]}, -- Tracking Achievements
    {A, 781, 4596}, -- The Sword in the Skull
    {A, 781, 3677}, -- The Sunreavers
    {A, 781, 3676}, -- A Silver Confidant
    {A, 781, 2816}, -- Exalted Argent Champion of the Horde
    {A, 781, 2817}, -- Exalted Argent Champion of the Alliance
    {A, 781, 2771}, -- Exalted Champion of the Horde
    {A, 781, 2770}, -- Exalted Champion of the Alliance
    {A, 781, 2788}, -- Champion of the Horde
    {A, 781, 2782}, -- Champion of the Alliance
    {A, 781, 2765}, -- Exalted Champion of Orgrimmar
    {A, 781, 2764}, -- Exalted Champion of Stormwind
    {A, 781, 2783}, -- Champion of Orgrimmar
    {A, 781, 2781}, -- Champion of Stormwind
    {A, 781, 2766}, -- Exalted Champion of Sen'jin
    {A, 781, 2763}, -- Exalted Champion of Ironforge
    {A, 781, 2784}, -- Champion of Sen'jin
    {A, 781, 2780}, -- Champion of Ironforge
    {A, 781, 2768}, -- Exalted Champion of Thunder Bluff
    {A, 781, 2762}, -- Exalted Champion of Gnomeregan
    {A, 781, 2786}, -- Champion of Thunder Bluff
    {A, 781, 2779}, -- Champion of Gnomeregan
    {A, 781, 2767}, -- Exalted Champion of Silvermoon City
    {A, 781, 2761}, -- Exalted Champion of the Exodar
    {A, 781, 2785}, -- Champion of Silvermoon City
    {A, 781, 2778}, -- Champion of the Exodar
    {A, 781, 2769}, -- Exalted Champion of the Undercity
    {A, 781, 2760}, -- Exalted Champion of Darnassus
    {A, 781, 2787}, -- Champion of the Undercity
    {A, 781, 2777}, -- Champion of Darnassus
    {A, 781, 3736}, -- Pony Up!
    {A, 781, 2773}, -- It's Just a Flesh Wound
    {A, 781, 2836}, -- Lance a Lot
    {A, 781, 2772}, -- Tilted!
    {A, 781, 2758}, -- Argent Valor
    {A, 781, 2756}, -- Argent Aspiration
    {C, 83, 781},
    {N, 781,k.GetCategoryInfoTitle(14941)}, -- Argent Tournament
    {A, 1138, 1752}, -- Master of Wintergrasp
    {A, 1138, 1751}, -- Didn't Stand a Chance
    {A, 1138, 1727}, -- Leaning Tower
    {A, 1138, 1723}, -- Vehicular Gnomeslaughter
    {A, 1138, 2476}, -- Destruction Derby
    {A, 1138, 1737}, -- Destruction Derby
    {A, 1138, 2080}, -- Black War Mammoth
    {A, 1138, 2199}, -- Wintergrasp Ranger
    {A, 1138, 1755}, -- Within Our Grasp
    {A, 1138, 1718}, -- Wintergrasp Veteran
    {A, 1138, 1717}, -- Wintergrasp Victory
    {C, 83, 1138},
    {N, 1138,k.GetCategoryInfoTitle(14901)}, -- Wintergrasp
    {C, 83, 787},
    {N, 787,k.GetCategoryInfoTitle(15117)}, -- Pet Battles
    {A, 1526, 137}, -- Stocking Up
    {C, 1152, 1526},
    {N, 1526,k.GetCategoryInfoTitle(15496), true}, -- Tailoring
    {C, 1152, 1506},
    {N, 1506,k.GetCategoryInfoTitle(15493), true}, -- Inscription
    {A, 1498, 2096}, -- The Coin Master
    {A, 1498, 1958}, -- I Smell A Giant Rat
    {A, 1498, 1957}, -- There's Gold In That There Fountain
    {A, 1498, 2095}, -- Silver in the City
    {A, 1498, 2094}, -- A Penny For Your Thoughts
    {A, 1498, 3217}, -- Chasing Marcia
    {A, 1498, 1517}, -- Northrend Angler
    {A, 1498, 130}, -- Northrend Fisherman
    {C, 1152, 1498},
    {N, 1498,k.GetCategoryInfoTitle(171), true}, -- Fishing
    {A, 1479, 1783}, -- Our Daily Bread
    {A, 1479, 1782}, -- Our Daily Bread
    {A, 1479, 1781}, -- Critter Gitter
    {A, 1479, 1780}, -- Second That Emotion
    {A, 1479, 1779}, -- The Northrend Gourmet
    {A, 1479, 1778}, -- The Northrend Gourmet
    {A, 1479, 1777}, -- The Northrend Gourmet
    {A, 1479, 125}, -- Northrend Cook
    {C, 1152, 1479},
    {N, 1479,k.GetCategoryInfoTitle(170), true}, -- Cooking
    {C, 1152, 1470},
    {N, 1470,k.GetCategoryInfoTitle(15071), true}, -- Archaeology
    {A, 1152, 730}, -- Skills to Pay the Bills
    {A, 1152, 135}, -- Grand Master Medic
    {A, 1152, 735}, -- Working In the Cold
    {A, 1152, 734}, -- Professional Northrend Master
    {C, 83, 1152},
    {N, 1152,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 128, 4816}, -- Heroic: The Twilight Destroyer (25 player)
    {A, 128, 4815}, -- The Twilight Destroyer (25 player)
    {C, 126, 128},
    {N, 128,(GetDifficultyInfo(4))}, -- The Ruby Sanctum 25
    {A, 127, 4818}, -- Heroic: The Twilight Destroyer (10 player)
    {A, 127, 4817}, -- The Twilight Destroyer (10 player)
    {C, 126, 127},
    {N, 127,(GetDifficultyInfo(3))}, -- The Ruby Sanctum 10
    {C, 85, 126},
    {N, 126,k.GetInstanceInfoName(761)}, -- The Ruby Sanctum
    {A, 615, 4598}, -- The Ashen Verdict
    {C, 123, 615},
    {N, 615,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 125, 4637}, -- Heroic: Fall of the Lich King (25 player)
    {A, 125, 4584}, -- The Light of Dawn
    {A, 125, 4635}, -- Heroic: The Frostwing Halls (25 player)
    {A, 125, 4634}, -- Heroic: The Crimson Hall (25 player)
    {A, 125, 4633}, -- Heroic: The Plagueworks (25 player)
    {A, 125, 4632}, -- Heroic: Storming the Citadel (25 player)
    {A, 125, 4608}, -- Fall of the Lich King (25 player)
    {A, 125, 4597}, -- The Frozen Throne (25 player)
    {A, 125, 4607}, -- The Frostwing Halls (25 player)
    {A, 125, 4606}, -- The Crimson Hall (25 player)
    {A, 125, 4605}, -- The Plagueworks (25 player)
    {A, 125, 4604}, -- Storming the Citadel (25 player)
    {A, 125, 4622}, -- Neck-Deep in Vile (25 player)
    {A, 125, 4621}, -- Been Waiting a Long Time for This (25 player)
    {A, 125, 4620}, -- All You Can Eat (25 player)
    {A, 125, 4619}, -- Portal Jockey (25 player)
    {A, 125, 4618}, -- "Once Bitten, Twice Shy (25 player)"
    {A, 125, 4617}, -- The Orb Whisperer (25 player)
    {A, 125, 4616}, -- "Nausea, Heartburn, Indigestion... (25 player)"
    {A, 125, 4614}, -- Dances with Oozes (25 player)
    {A, 125, 4615}, -- Flu Shot Shortage (25 player)
    {A, 125, 4613}, -- I've Gone and Made a Mess (25 player)
    {A, 125, 4612}, -- I'm on a Boat (25 player)
    {A, 125, 4611}, -- Full House (25 player)
    {A, 125, 4610}, -- Boned (25 player)
    {C, 123, 125},
    {N, 125,(GetDifficultyInfo(4))}, -- Icecrown Citadel 25
    {A, 124, 4636}, -- Heroic: Fall of the Lich King (10 player)
    {A, 124, 4583}, -- Bane of the Fallen King
    {A, 124, 4631}, -- Heroic: The Frostwing Halls (10 player)
    {A, 124, 4630}, -- Heroic: The Crimson Hall (10 player)
    {A, 124, 4629}, -- Heroic: The Plagueworks (10 player)
    {A, 124, 4628}, -- Heroic: Storming the Citadel (10 player)
    {A, 124, 4532}, -- Fall of the Lich King (10 player)
    {A, 124, 4530}, -- The Frozen Throne (10 player)
    {A, 124, 4527}, -- The Frostwing Halls (10 player)
    {A, 124, 4529}, -- The Crimson Hall (10 player)
    {A, 124, 4528}, -- The Plagueworks (10 player)
    {A, 124, 4531}, -- Storming the Citadel (10 player)
    {A, 124, 4581}, -- Neck-Deep in Vile (10 player)
    {A, 124, 4601}, -- Been Waiting a Long Time for This (10 player)
    {A, 124, 4580}, -- All You Can Eat (10 player)
    {A, 124, 4579}, -- Portal Jockey (10 player)
    {A, 124, 4539}, -- "Once Bitten, Twice Shy (10 player)"
    {A, 124, 4582}, -- The Orb Whisperer (10 player)
    {A, 124, 4578}, -- "Nausea, Heartburn, Indigestion... (10 player)"
    {A, 124, 4538}, -- Dances with Oozes (10 player)
    {A, 124, 4577}, -- Flu Shot Shortage (10 player)
    {A, 124, 4537}, -- I've Gone and Made a Mess (10 player)
    {A, 124, 4536}, -- I'm on a Boat (10 player)
    {A, 124, 4535}, -- Full House (10 player)
    {A, 124, 4534}, -- Boned (10 player)
    {C, 123, 124},
    {N, 124,(GetDifficultyInfo(3))}, -- Icecrown Citadel 10
    {A, 123, 4623}, -- Shadowmourne
    {A, 123, 4625}, -- Invincible's Reins
    {C, 85, 123},
    {N, 123,k.GetInstanceInfoName(758)}, -- Icecrown Citadel
    {A, 122, 4397}, -- Onyxia's Lair (25 player)
    {A, 122, 4407}, -- She Deep Breaths More (25 player)
    {A, 122, 4406}, -- Many Whelps! Handle It! (25 player)
    {A, 122, 4405}, -- More Dots! (25 player)
    {C, 120, 122},
    {N, 122,(GetDifficultyInfo(4))}, -- Onyxia's Lair 25
    {A, 121, 4396}, -- Onyxia's Lair (10 player)
    {A, 121, 4404}, -- She Deep Breaths More (10 player)
    {A, 121, 4403}, -- Many Whelps! Handle It! (10 player)
    {A, 121, 4402}, -- More Dots! (10 player)
    {C, 120, 121},
    {N, 121,(GetDifficultyInfo(3))}, -- Onyxia's Lair 10
    {C, 85, 120},
    {N, 120,k.GetInstanceInfoName(760)}, -- Onyxia's Lair
    {A, 119, 4079}, -- A Tribute to Immortality
    {A, 119, 4156}, -- A Tribute to Immortality
    {A, 119, 3819}, -- A Tribute to Insanity (25 player)
    {A, 119, 3818}, -- A Tribute to Mad Skill (25 player)
    {A, 119, 3817}, -- A Tribute to Skill (25 player)
    {A, 119, 3812}, -- Call of the Grand Crusade (25 player)
    {A, 119, 3916}, -- Call of the Crusade (25 player)
    {A, 119, 3816}, -- The Traitor King (25 player)
    {A, 119, 3815}, -- Salt and Pepper (25 player)
    {A, 119, 3814}, -- Resilience Will Fix It (25 player)
    {A, 119, 3997}, -- Three Sixty Pain Spike (25 player)
    {A, 119, 3937}, -- "Not One, But Two Jormungars (25 player)"
    {A, 119, 3813}, -- Upper Back Pain (25 player)
    {C, 117, 119},
    {N, 119,(GetDifficultyInfo(4))}, -- Trial of the Crusader 25
    {A, 118, 4080}, -- A Tribute to Dedicated Insanity
    {A, 118, 3810}, -- A Tribute to Insanity (10 player)
    {A, 118, 3809}, -- A Tribute to Mad Skill (10 player)
    {A, 118, 3808}, -- A Tribute to Skill (10 player)
    {A, 118, 3918}, -- Call of the Grand Crusade (10 player)
    {A, 118, 3917}, -- Call of the Crusade (10 player)
    {A, 118, 3800}, -- The Traitor King (10 player)
    {A, 118, 3799}, -- Salt and Pepper (10 player)
    {A, 118, 3798}, -- Resilience Will Fix It (10 player)
    {A, 118, 3996}, -- Three Sixty Pain Spike (10 player)
    {A, 118, 3936}, -- "Not One, But Two Jormungars (10 player)"
    {A, 118, 3797}, -- Upper Back Pain (10 player)
    {C, 117, 118},
    {N, 118,(GetDifficultyInfo(3))}, -- Trial of the Crusader 10
    {C, 85, 117},
    {N, 117,k.GetInstanceInfoName(757)}, -- Trial of the Crusader
    {A, 116, 2904}, -- Conqueror of Ulduar
    {A, 116, 3005}, -- He Feeds On Your Tears (25 player)
    {A, 116, 3037}, -- Observed (25 player)
    {A, 116, 2895}, -- The Secrets of Ulduar (25 player)
    {A, 116, 2893}, -- The Descent into Madness (25 player)
    {A, 116, 2891}, -- The Keepers of Ulduar (25 player)
    {A, 116, 2889}, -- The Antechamber of Ulduar (25 player)
    {A, 116, 2887}, -- The Siege of Ulduar (25 player)
    {A, 116, 3002}, -- Supermassive (25 player)
    {A, 116, 3164}, -- Alone in the Darkness (25 player)
    {A, 116, 3163}, -- One Light in the Darkness (25 player)
    {A, 116, 3162}, -- Two Lights in the Darkness (25 player)
    {A, 116, 3161}, -- Three Lights in the Darkness (25 player)
    {A, 116, 3016}, -- In His House He Waits Dreaming (25 player)
    {A, 116, 3017}, -- They're Coming Out of the Walls (25 player)
    {A, 116, 3013}, -- He's Not Getting Any Older (25 player)
    {A, 116, 3010}, -- Drive Me Crazy (25 player)
    {A, 116, 3011}, -- Kiss and Make Up (25 player)
    {A, 116, 3188}, -- I Love the Smell of Saronite in the Morning (25 player)
    {A, 116, 2997}, -- Shadowdodger (25 player)
    {A, 116, 3189}, -- Firefighter (25 player)
    {A, 116, 2995}, -- Not-So-Friendly Fire (25 player)
    {A, 116, 3237}, -- Set Up Us the Bomb (25 player)
    {A, 116, 3187}, -- "Knock, Knock, Knock on Wood (25 player)"
    {A, 116, 3186}, -- "Knock, Knock on Wood (25 player)"
    {A, 116, 3185}, -- Knock on Wood (25 player)
    {A, 116, 2983}, -- Getting Back to Nature (25 player)
    {A, 116, 2984}, -- Deforestation (25 player)
    {A, 116, 2981}, -- Con-speed-atory (25 player)
    {A, 116, 3118}, -- Lumberjacked (25 player)
    {A, 116, 3183}, -- Lose Your Illusion (25 player)
    {A, 116, 2978}, -- Siffed (25 player)
    {A, 116, 2976}, -- Who Needs Bloodlust? (25 player)
    {A, 116, 2974}, -- I'll Take You All On (25 player)
    {A, 116, 2972}, -- Don't Stand in the Lightning (25 player)
    {A, 116, 3184}, -- I Could Say That This Cache Was Rare (25 player)
    {A, 116, 2970}, -- Staying Buffed All Winter (25 player)
    {A, 116, 2968}, -- Getting Cold in Here (25 player)
    {A, 116, 2965}, -- I Have the Coolest Friends (25 player)
    {A, 116, 2962}, -- Cheese the Freeze (25 player)
    {A, 116, 3007}, -- Crazy Cat Lady (25 player)
    {A, 116, 3077}, -- Nine Lives (25 player)
    {A, 116, 2954}, -- Disarmed (25 player)
    {A, 116, 2952}, -- With Open Arms (25 player)
    {A, 116, 2960}, -- Rubble and Roll (25 player)
    {A, 116, 2956}, -- If Looks Could Kill (25 player)
    {A, 116, 2944}, -- "I Choose You, Steelbreaker (25 player)"
    {A, 116, 2943}, -- "I Choose You, Stormcaller Brundir (25 player)"
    {A, 116, 2942}, -- "I Choose You, Runemaster Molgeim (25 player)"
    {A, 116, 2948}, -- Can't Do That While Stunned (25 player)
    {A, 116, 2946}, -- But I'm On Your Side (25 player)
    {A, 116, 3059}, -- Heartbreaker (25 player)
    {A, 116, 2938}, -- Must Deconstruct Faster (25 player)
    {A, 116, 2936}, -- Nerf Gravity Bombs (25 player)
    {A, 116, 2935}, -- Nerf Scrapbots (25 player)
    {A, 116, 2932}, -- Nerf Engineering (25 player)
    {A, 116, 2924}, -- "Iron Dwarf, Medium Rare (25 player)"
    {A, 116, 2921}, -- A Quick Shave (25 player)
    {A, 116, 2929}, -- Stokin' the Furnace (25 player)
    {A, 116, 2928}, -- Hot Pocket (25 player)
    {A, 116, 2926}, -- Shattered (25 player)
    {A, 116, 3057}, -- Orbit-uary (25 player)
    {A, 116, 2917}, -- Nuked from Orbit (25 player)
    {A, 116, 2916}, -- Orbital Devastation (25 player)
    {A, 116, 2918}, -- Orbital Bombardment (25 player)
    {A, 116, 2910}, -- Take Out Those Turrets (25 player)
    {A, 116, 2912}, -- Shutout (25 player)
    {A, 116, 2906}, -- Unbroken (25 player)
    {A, 116, 2908}, -- Three Car Garage (25 player)
    {A, 116, 3098}, -- Dwarfageddon (25 player)
    {C, 114, 116},
    {N, 116,(GetDifficultyInfo(4))}, -- Ulduar 25
    {A, 115, 2903}, -- Champion of Ulduar
    {A, 115, 3004}, -- He Feeds On Your Tears (10 player)
    {A, 115, 3036}, -- Observed (10 player)
    {A, 115, 2894}, -- The Secrets of Ulduar (10 player)
    {A, 115, 2892}, -- The Descent into Madness (10 player)
    {A, 115, 2890}, -- The Keepers of Ulduar (10 player)
    {A, 115, 2888}, -- The Antechamber of Ulduar (10 player)
    {A, 115, 2886}, -- The Siege of Ulduar (10 player)
    {A, 115, 3003}, -- Supermassive (10 player)
    {A, 115, 3159}, -- Alone in the Darkness (10 player)
    {A, 115, 3158}, -- One Light in the Darkness (10 player)
    {A, 115, 3141}, -- Two Lights in the Darkness (10 player)
    {A, 115, 3157}, -- Three Lights in the Darkness (10 player)
    {A, 115, 3015}, -- In His House He Waits Dreaming (10 player)
    {A, 115, 3014}, -- They're Coming Out of the Walls (10 player)
    {A, 115, 3012}, -- He's Not Getting Any Older (10 player)
    {A, 115, 3008}, -- Drive Me Crazy (10 player)
    {A, 115, 3009}, -- Kiss and Make Up (10 player)
    {A, 115, 3181}, -- I Love the Smell of Saronite in the Morning (10 player)
    {A, 115, 2996}, -- Shadowdodger (10 player)
    {A, 115, 3180}, -- Firefighter (10 player)
    {A, 115, 3138}, -- Not-So-Friendly Fire (10 player)
    {A, 115, 2989}, -- Set Up Us the Bomb (10 player)
    {A, 115, 3179}, -- "Knock, Knock, Knock on Wood (10 player)"
    {A, 115, 3178}, -- "Knock, Knock on Wood (10 player)"
    {A, 115, 3177}, -- Knock on Wood (10 player)
    {A, 115, 2982}, -- Getting Back to Nature (10 player)
    {A, 115, 2985}, -- Deforestation (10 player)
    {A, 115, 2980}, -- Con-speed-atory (10 player)
    {A, 115, 2979}, -- Lumberjacked (10 player)
    {A, 115, 3176}, -- Lose Your Illusion (10 player)
    {A, 115, 2977}, -- Siffed (10 player)
    {A, 115, 2975}, -- Who Needs Bloodlust? (10 player)
    {A, 115, 2973}, -- I'll Take You All On (10 player)
    {A, 115, 2971}, -- Don't Stand in the Lightning (10 player)
    {A, 115, 3182}, -- I Could Say That This Cache Was Rare (10 player)
    {A, 115, 2969}, -- Staying Buffed All Winter (10 player)
    {A, 115, 2967}, -- Getting Cold in Here (10 player)
    {A, 115, 2963}, -- I Have the Coolest Friends (10 player)
    {A, 115, 2961}, -- Cheese the Freeze (10 player)
    {A, 115, 3006}, -- Crazy Cat Lady (10 player)
    {A, 115, 3076}, -- Nine Lives (10 player)
    {A, 115, 2953}, -- Disarmed (10 player)
    {A, 115, 2951}, -- With Open Arms (10 player)
    {A, 115, 2959}, -- Rubble and Roll (10 player)
    {A, 115, 2955}, -- If Looks Could Kill (10 player)
    {A, 115, 2941}, -- "I Choose You, Steelbreaker (10 player)"
    {A, 115, 2940}, -- "I Choose You, Stormcaller Brundir (10 player)"
    {A, 115, 2939}, -- "I Choose You, Runemaster Molgeim (10 player)"
    {A, 115, 2947}, -- Can't Do That While Stunned (10 player)
    {A, 115, 2945}, -- But I'm On Your Side (10 player)
    {A, 115, 3058}, -- Heartbreaker (10 player)
    {A, 115, 2937}, -- Must Deconstruct Faster (10 player)
    {A, 115, 2934}, -- Nerf Gravity Bombs (10 player)
    {A, 115, 2933}, -- Nerf Scrapbots (10 player)
    {A, 115, 2931}, -- Nerf Engineering (10 player)
    {A, 115, 2923}, -- "Iron Dwarf, Medium Rare (10 player)"
    {A, 115, 2919}, -- A Quick Shave (10 player)
    {A, 115, 2930}, -- Stokin' the Furnace (10 player)
    {A, 115, 2927}, -- Hot Pocket (10 player)
    {A, 115, 2925}, -- Shattered (10 player)
    {A, 115, 3056}, -- Orbit-uary (10 player)
    {A, 115, 2915}, -- Nuked from Orbit (10 player)
    {A, 115, 2914}, -- Orbital Devastation (10 player)
    {A, 115, 2913}, -- Orbital Bombardment (10 player)
    {A, 115, 2909}, -- Take Out Those Turrets (10 player)
    {A, 115, 2911}, -- Shutout (10 player)
    {A, 115, 2905}, -- Unbroken (10 player)
    {A, 115, 2907}, -- Three Car Garage (10 player)
    {A, 115, 3097}, -- Dwarfageddon (10 player)
    {C, 114, 115},
    {N, 115,(GetDifficultyInfo(3))}, -- Ulduar 10
    {A, 114, 17341}, -- Cutting Edge: Ulduar
    {A, 114, 17340}, -- Ahead of the Curve: Yogg-Saron
    {A, 114, 3316}, -- Herald of the Titans
    {A, 114, 3142}, -- "Val'anyr, Hammer of Ancient Kings"
    {A, 114, 4626}, -- And I'll Form the Head!
    {C, 85, 114},
    {N, 114,k.GetInstanceInfoName(759)}, -- Ulduar
    {A, 113, 623}, -- The Spellweaver's Downfall (25 player)
    {A, 113, 1870}, -- A Poke in the Eye (25 player)
    {A, 113, 1875}, -- You Don't Have an Eternity (25 player)
    {A, 113, 2149}, -- Denyin' the Scion (25 player)
    {C, 111, 113},
    {N, 113,(GetDifficultyInfo(4))}, -- The Eye of Eternity 25
    {A, 112, 622}, -- The Spellweaver's Downfall (10 player)
    {A, 112, 1869}, -- A Poke in the Eye (10 player)
    {A, 112, 1874}, -- You Don't Have an Eternity (10 player)
    {A, 112, 2148}, -- Denyin' the Scion (10 player)
    {C, 111, 112},
    {N, 112,(GetDifficultyInfo(3))}, -- The Eye of Eternity 10
    {C, 85, 111},
    {N, 111,k.GetInstanceInfoName(756)}, -- The Eye of Eternity
    {A, 110, 625}, -- Besting the Black Dragonflight (25 player)
    {A, 110, 1877}, -- Less Is More (25 player)
    {A, 110, 2054}, -- The Twilight Zone (25 player)
    {A, 110, 2053}, -- Twilight Duo (25 player)
    {A, 110, 2052}, -- Twilight Assist (25 player)
    {A, 110, 2048}, -- Gonna Go When the Volcano Blows (25 player)
    {C, 108, 110},
    {N, 110,(GetDifficultyInfo(4))}, -- The Obsidian Sanctum 25
    {A, 109, 1876}, -- Besting the Black Dragonflight (10 player)
    {A, 109, 624}, -- Less Is More (10 player)
    {A, 109, 2051}, -- The Twilight Zone (10 player)
    {A, 109, 2050}, -- Twilight Duo (10 player)
    {A, 109, 2049}, -- Twilight Assist (10 player)
    {A, 109, 2047}, -- Gonna Go When the Volcano Blows (10 player)
    {C, 108, 109},
    {N, 109,(GetDifficultyInfo(3))}, -- The Obsidian Sanctum 10
    {C, 85, 108},
    {N, 108,k.GetInstanceInfoName(755)}, -- The Obsidian Sanctum
    {A, 107, 2186}, -- The Immortal
    {A, 107, 577}, -- The Fall of Naxxramas (25 player)
    {A, 107, 575}, -- Kel'Thuzad's Defeat (25 player)
    {A, 107, 573}, -- Sapphiron's Demise (25 player)
    {A, 107, 569}, -- The Military Quarter (25 player)
    {A, 107, 567}, -- The Plague Quarter (25 player)
    {A, 107, 565}, -- The Construct Quarter (25 player)
    {A, 107, 563}, -- The Arachnid Quarter (25 player)
    {A, 107, 579}, -- The Dedicated Few (25 player)
    {A, 107, 2185}, -- Just Can't Get Enough (25 player)
    {A, 107, 2147}, -- The Hundred Club (25 player)
    {A, 107, 2177}, -- And They Would All Go Down Together (25 player)
    {A, 107, 2183}, -- Spore Loser (25 player)
    {A, 107, 2139}, -- The Safety Dance (25 player)
    {A, 107, 2181}, -- Subtraction (25 player)
    {A, 107, 2179}, -- Shocking! (25 player)
    {A, 107, 1857}, -- Make Quick Werk of Him (25 player)
    {A, 107, 1859}, -- Arachnophobia (25 player)
    {A, 107, 2140}, -- Momma Said Knock You Out (25 player)
    {C, 105, 107},
    {N, 107,(GetDifficultyInfo(4))}, -- Naxxramas 25
    {A, 106, 2187}, -- The Undying
    {A, 106, 576}, -- The Fall of Naxxramas (10 player)
    {A, 106, 574}, -- Kel'Thuzad's Defeat (10 player)
    {A, 106, 572}, -- Sapphiron's Demise (10 player)
    {A, 106, 568}, -- The Military Quarter (10 player)
    {A, 106, 566}, -- The Plague Quarter (10 player)
    {A, 106, 564}, -- The Construct Quarter (10 player)
    {A, 106, 562}, -- The Arachnid Quarter (10 player)
    {A, 106, 578}, -- The Dedicated Few (10 player)
    {A, 106, 2184}, -- Just Can't Get Enough (10 player)
    {A, 106, 2146}, -- The Hundred Club (10 player)
    {A, 106, 2176}, -- And They Would All Go Down Together (10 player)
    {A, 106, 2182}, -- Spore Loser (10 player)
    {A, 106, 1996}, -- The Safety Dance (10 player)
    {A, 106, 2180}, -- Subtraction (10 player)
    {A, 106, 2178}, -- Shocking! (10 player)
    {A, 106, 1856}, -- Make Quick Werk of Him (10 player)
    {A, 106, 1858}, -- Arachnophobia (10 player)
    {A, 106, 1997}, -- Momma Said Knock You Out (10 player)
    {C, 105, 106},
    {N, 106,(GetDifficultyInfo(3))}, -- Naxxramas 10
    {C, 85, 105},
    {N, 105,k.GetInstanceInfoName(754)}, -- Naxxramas
    {A, 104, 4586}, -- Toravon the Ice Watcher (25 player)
    {A, 104, 3837}, -- Koralon the Flame Watcher (25 player)
    {A, 104, 3137}, -- Emalon the Storm Watcher (25 player)
    {A, 104, 1721}, -- Archavon the Stone Watcher (25 player)
    {A, 104, 4017}, -- "Earth, Wind & Fire (25 player)"
    {C, 102, 104},
    {N, 104,(GetDifficultyInfo(4))}, -- Vault of Archavon 25
    {A, 103, 4585}, -- Toravon the Ice Watcher (10 player)
    {A, 103, 3836}, -- Koralon the Flame Watcher (10 player)
    {A, 103, 3136}, -- Emalon the Storm Watcher (10 player)
    {A, 103, 1722}, -- Archavon the Stone Watcher (10 player)
    {A, 103, 4016}, -- "Earth, Wind & Fire (10 player)"
    {C, 102, 103},
    {N, 103,(GetDifficultyInfo(3))}, -- Vault of Archavon 10
    {A, 102, 2081}, -- Grand Black War Mammoth
    {C, 85, 102},
    {N, 102,k.GetInstanceInfoName(753)}, -- Vault of Archavon
    {A, 85, 4316}, -- 2500 Dungeon & Raid Emblems
    {A, 85, 3876}, -- 1500 Dungeon & Raid Emblems
    {A, 85, 3844}, -- 1000 Dungeon & Raid Emblems
    {A, 85, 3843}, -- 500 Dungeon & Raid Emblems
    {A, 85, 3842}, -- 250 Dungeon & Raid Emblems
    {A, 85, 3841}, -- 100 Dungeon & Raid Emblems
    {A, 85, 3840}, -- 50 Dungeon & Raid Emblems
    {A, 85, 3839}, -- 25 Dungeon & Raid Emblems
    {A, 85, 3838}, -- Dungeon & Raid Emblem
    {A, 85, 4785}, -- Emblematic
    {A, 85, 4784}, -- Emblematic
    {A, 85, 2958}, -- Glory of the Ulduar Raider (25 player)
    {A, 85, 2957}, -- Glory of the Ulduar Raider (10 player)
    {A, 85, 4603}, -- Glory of the Icecrown Raider (25 player)
    {A, 85, 4602}, -- Glory of the Icecrown Raider (10 player)
    {A, 85, 2138}, -- Glory of the Raider (25 player)
    {A, 85, 2137}, -- Glory of the Raider (10 player)
    {A, 85, 1658}, -- Champion of the Frozen Wastes
    {C, 83, 85},
    {N, 85,k.GetCategoryInfoTitle(15271)}, -- Raids
    {A, 101, 4521}, -- Heroic: The Halls of Reflection
    {A, 101, 4518}, -- The Halls of Reflection
    {A, 101, 4526}, -- We're Not Retreating; We're Advancing in a Different Direction.
    {C, 84, 101},
    {N, 101,k.GetInstanceInfoName(276)}, -- Halls of Reflection
    {A, 100, 4520}, -- Heroic: The Pit of Saron
    {A, 100, 4517}, -- The Pit of Saron
    {A, 100, 4525}, -- Don't Look Up
    {A, 100, 4524}, -- Doesn't Go to Eleven
    {C, 84, 100},
    {N, 100,k.GetInstanceInfoName(278)}, -- Pit of Saron
    {A, 99, 4519}, -- Heroic: The Forge of Souls
    {A, 99, 4516}, -- The Forge of Souls
    {A, 99, 4523}, -- Three Faced
    {A, 99, 4522}, -- Soul Power
    {C, 84, 99},
    {N, 99,k.GetInstanceInfoName(280)}, -- The Forge of Souls
    {A, 98, 19425}, -- Defense Protocol Gamma: Trial of the Champion
    {A, 98, 19426}, -- Defense Protocol Gamma: Trial of the Champion
    {A, 98, 18678}, -- Defense Protocol Beta: Trial of the Champion
    {A, 98, 18677}, -- Defense Protocol Beta: Trial of the Champion
    {A, 98, 4297}, -- Heroic: Trial of the Champion
    {A, 98, 4298}, -- Heroic: Trial of the Champion
    {A, 98, 3778}, -- Trial of the Champion
    {A, 98, 4296}, -- Trial of the Champion
    {A, 98, 3804}, -- I've Had Worse
    {A, 98, 3802}, -- Argent Confessor
    {A, 98, 3803}, -- The Faceroller
    {C, 84, 98},
    {N, 98,k.GetInstanceInfoName(284)}, -- Trial of the Champion
    {A, 96, 19438}, -- Defense Protocol Gamma: The Culling of Stratholme
    {A, 96, 18601}, -- Defense Protocol Beta: The Culling of Stratholme
    {A, 96, 17302}, -- Defense Protocol Alpha: The Culling of Stratholme
    {A, 96, 500}, -- Heroic: The Culling of Stratholme
    {A, 96, 479}, -- The Culling of Stratholme
    {A, 96, 1817}, -- The Culling of Time
    {A, 96, 1872}, -- Zombiefest!
    {C, 84, 96},
    {N, 96,k.GetInstanceInfoName(279)}, -- The Culling of Stratholme
    {A, 97, 19437}, -- Defense Protocol Gamma: Utgarde Pinnacle
    {A, 97, 18600}, -- Defense Protocol Beta: Utgarde Pinnacle
    {A, 97, 17301}, -- Defense Protocol Alpha: Utgarde Pinnacle
    {A, 97, 499}, -- Heroic: Utgarde Pinnacle
    {A, 97, 488}, -- Utgarde Pinnacle
    {A, 97, 2157}, -- King's Bane
    {A, 97, 2156}, -- My Girl Loves to Skadi All the Time
    {A, 97, 1873}, -- Lodi Dodi We Loves the Skadi
    {A, 97, 2043}, -- The Incredible Hulk
    {C, 84, 97},
    {N, 97,k.GetInstanceInfoName(286)}, -- Utgarde Pinnacle
    {A, 95, 19436}, -- Defense Protocol Gamma: The Oculus
    {A, 95, 18599}, -- Defense Protocol Beta: The Oculus
    {A, 95, 17300}, -- Defense Protocol Alpha: The Oculus
    {A, 95, 498}, -- Heroic: The Oculus
    {A, 95, 487}, -- The Oculus
    {A, 95, 1871}, -- Experienced Drake Rider
    {A, 95, 2044}, -- Ruby Void
    {A, 95, 2045}, -- Emerald Void
    {A, 95, 2046}, -- Amber Void
    {A, 95, 1868}, -- Make It Count
    {C, 84, 95},
    {N, 95,k.GetInstanceInfoName(282)}, -- The Oculus
    {A, 94, 19435}, -- Defense Protocol Gamma: Halls of Lightning
    {A, 94, 18598}, -- Defense Protocol Beta: Halls of Lightning
    {A, 94, 17299}, -- Defense Protocol Alpha: Halls of Lightning
    {A, 94, 497}, -- Heroic: Halls of Lightning
    {A, 94, 486}, -- Halls of Lightning
    {A, 94, 1867}, -- Timely Death
    {A, 94, 2042}, -- Shatter Resistant
    {A, 94, 1834}, -- Lightning Struck
    {C, 84, 94},
    {N, 94,k.GetInstanceInfoName(275)}, -- Halls of Lightning
    {A, 93, 19434}, -- Defense Protocol Gamma: Halls of Stone
    {A, 93, 18597}, -- Defense Protocol Beta: Halls of Stone
    {A, 93, 17297}, -- Defense Protocol Alpha: Halls of Stone
    {A, 93, 496}, -- Heroic: Halls of Stone
    {A, 93, 485}, -- Halls of Stone
    {A, 93, 2155}, -- Abuse the Ooze
    {A, 93, 2154}, -- Brann Spankin' New
    {A, 93, 1866}, -- Good Grief
    {C, 84, 93},
    {N, 93,k.GetInstanceInfoName(277)}, -- Halls of Stone
    {A, 92, 19433}, -- Defense Protocol Gamma: Gundrak
    {A, 92, 18596}, -- Defense Protocol Beta: Gundrak
    {A, 92, 17295}, -- Defense Protocol Alpha: Gundrak
    {A, 92, 495}, -- Heroic: Gundrak
    {A, 92, 484}, -- Gundrak
    {A, 92, 2152}, -- Share The Love
    {A, 92, 1864}, -- What the Eck?
    {A, 92, 2040}, -- Less-rabi
    {A, 92, 2058}, -- Snakes. Why'd It Have To Be Snakes?
    {C, 84, 92},
    {N, 92,k.GetInstanceInfoName(274)}, -- Gundrak
    {A, 91, 19432}, -- Defense Protocol Gamma: The Violet Hold
    {A, 91, 18595}, -- Defense Protocol Beta: The Violet Hold
    {A, 91, 17293}, -- Defense Protocol Alpha: The Violet Hold
    {A, 91, 494}, -- Heroic: The Violet Hold
    {A, 91, 483}, -- The Violet Hold
    {A, 91, 1816}, -- Defenseless
    {A, 91, 2153}, -- A Void Dance
    {A, 91, 2041}, -- Dehydration
    {A, 91, 1865}, -- Lockdown!
    {C, 84, 91},
    {N, 91,k.GetInstanceInfoName(283)}, -- The Violet Hold
    {A, 90, 19431}, -- Defense Protocol Gamma: Drak'Tharon Keep
    {A, 90, 18594}, -- Defense Protocol Beta: Drak'Tharon Keep
    {A, 90, 17292}, -- Defense Protocol Alpha: Drak'Tharon Keep
    {A, 90, 493}, -- Heroic: Drak'Tharon Keep
    {A, 90, 482}, -- Drak'Tharon Keep
    {A, 90, 2039}, -- Better Off Dred
    {A, 90, 2057}, -- Oh Novos!
    {A, 90, 2151}, -- Consumption Junction
    {C, 84, 90},
    {N, 90,k.GetInstanceInfoName(273)}, -- Drak'Tharon Keep
    {A, 89, 19430}, -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
    {A, 89, 18593}, -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
    {A, 89, 17291}, -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    {A, 89, 492}, -- Heroic: Ahn'kahet: The Old Kingdom
    {A, 89, 481}, -- Ahn'kahet: The Old Kingdom
    {A, 89, 1862}, -- Volazj's Quick Demise
    {A, 89, 2056}, -- Volunteer Work
    {A, 89, 2038}, -- Respect Your Elders
    {C, 84, 89},
    {N, 89,k.GetInstanceInfoName(271)}, -- Ahn'kahet: The Old Kingdom
    {A, 88, 19429}, -- Defense Protocol Gamma: Azjol-Nerub
    {A, 88, 18592}, -- Defense Protocol Beta: Azjol-Nerub
    {A, 88, 17285}, -- Defense Protocol Alpha: Azjol-Nerub
    {A, 88, 491}, -- Heroic: Azjol-Nerub
    {A, 88, 480}, -- Azjol-Nerub
    {A, 88, 1860}, -- Gotta Go!
    {A, 88, 1297}, -- Hadronox Denied
    {A, 88, 1296}, -- Watch Him Die
    {C, 84, 88},
    {N, 88,k.GetInstanceInfoName(272)}, -- Azjol-Nerub
    {A, 87, 19428}, -- Defense Protocol Gamma: The Nexus
    {A, 87, 18591}, -- Defense Protocol Beta: The Nexus
    {A, 87, 17283}, -- Defense Protocol Alpha: The Nexus
    {A, 87, 490}, -- Heroic: The Nexus
    {A, 87, 478}, -- The Nexus
    {A, 87, 2036}, -- Intense Cold
    {A, 87, 2037}, -- Chaos Theory
    {A, 87, 2150}, -- Split Personality
    {C, 84, 87},
    {N, 87,k.GetInstanceInfoName(281)}, -- The Nexus
    {A, 86, 19427}, -- Defense Protocol Gamma: Utgarde Keep
    {A, 86, 18590}, -- Defense Protocol Beta: Utgarde Keep
    {A, 86, 17213}, -- Defense Protocol Alpha: Utgarde Keep
    {A, 86, 489}, -- Heroic: Utgarde Keep
    {A, 86, 477}, -- Utgarde Keep
    {A, 86, 1919}, -- On The Rocks
    {C, 84, 86},
    {N, 86,k.GetInstanceInfoName(285)}, -- Utgarde Keep
    {A, 84, 4316}, -- 2500 Dungeon & Raid Emblems
    {A, 84, 3876}, -- 1500 Dungeon & Raid Emblems
    {A, 84, 3844}, -- 1000 Dungeon & Raid Emblems
    {A, 84, 3843}, -- 500 Dungeon & Raid Emblems
    {A, 84, 3842}, -- 250 Dungeon & Raid Emblems
    {A, 84, 3841}, -- 100 Dungeon & Raid Emblems
    {A, 84, 3840}, -- 50 Dungeon & Raid Emblems
    {A, 84, 3839}, -- 25 Dungeon & Raid Emblems
    {A, 84, 3838}, -- Dungeon & Raid Emblem
    {A, 84, 4785}, -- Emblematic
    {A, 84, 4784}, -- Emblematic
    {A, 84, 2089}, -- 1000 Stone Keeper's Shards
    {A, 84, 2088}, -- 500 Stone Keeper's Shards
    {A, 84, 2087}, -- 250 Stone Keeper's Shards
    {A, 84, 2086}, -- 100 Stone Keeper's Shards
    {A, 84, 2085}, -- 50 Stone Keeper's Shards
    {A, 84, 2019}, -- Proof of Demise
    {A, 84, 2018}, -- Timear Foresees
    {A, 84, 2136}, -- Glory of the Hero
    {A, 84, 1658}, -- Champion of the Frozen Wastes
    {A, 84, 19440}, -- Defense Protocol Gamma: Terminated
    {A, 84, 19439}, -- Defense Protocol Gamma: Terminated
    {A, 84, 18688}, -- Defense Protocol Beta: Terminated
    {A, 84, 18614}, -- Defense Protocol Beta: Terminated
    {A, 84, 17304}, -- Defense Protocol Alpha: Terminated
    {A, 84, 1289}, -- Northrend Dungeon Hero
    {A, 84, 1288}, -- Northrend Dungeonmaster
    {C, 83, 84},
    {N, 84,k.GetCategoryInfoTitle(15272)}, -- Dungeons
    {C, 577, 1034},
    {N, 1034,k.GetMapName(123)}, -- Wintergrasp
    {A, 609, 945}, -- The Argent Champion
    {A, 609, 947}, -- The Argent Crusade
    {C, 585, 609},
    {N, 609,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 608, 1270}, -- Explore Icecrown
    {C, 585, 608},
    {N, 608,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 607, 40}, -- Icecrown: The Final Goal
    {C, 585, 607},
    {N, 607,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 585},
    {N, 585,k.GetMapName(118)}, -- Icecrown
    {A, 606, 2083}, -- Grand Ice Mammoth
    {A, 606, 2082}, -- Ice Mammoth
    {C, 584, 606},
    {N, 606,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 612, 1269}, -- Explore Storm Peaks
    {C, 584, 612},
    {N, 612,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 604, 1428}, -- Mine Sweeper
    {A, 604, 38}, -- The Summit of Storm Peaks
    {C, 584, 604},
    {N, 604,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 584},
    {N, 584,k.GetMapName(120)}, -- Storm Peaks
    {A, 610, 1457}, -- Explore Crystalsong Forest
    {C, 577, 610},
    {N, 610,k.GetMapName(127)}, -- Crystalsong Forest
    {A, 603, 952}, -- Mercenary of Sholazar
    {A, 603, 951}, -- The Oracles
    {A, 603, 950}, -- Frenzyheart Tribe
    {C, 583, 603},
    {N, 603,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 602, 1268}, -- Explore Sholazar Basin
    {C, 583, 602},
    {N, 602,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 601, 941}, -- Hemet Nesingwary: The Collected Quests
    {A, 601, 938}, -- The Snows of Northrend
    {A, 601, 962}, -- Savior of the Oracles
    {A, 601, 961}, -- Honorary Frenzyheart
    {A, 601, 39}, -- Into the Basin
    {C, 583, 601},
    {N, 601,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 583},
    {N, 583,k.GetMapName(119)}, -- Sholazar Basin
    {A, 599, 1267}, -- Explore Zul'Drak
    {C, 582, 599},
    {N, 599,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 598, 1576}, -- Of Blood and Anguish
    {A, 598, 1596}, -- Guru of Drakuru
    {A, 598, 36}, -- The Empire of Zul'Drak
    {C, 582, 598},
    {N, 598,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 582},
    {N, 582,k.GetMapName(121)}, -- Zul'Drak
    {A, 782, 2017}, -- Grizzled Veteran
    {A, 782, 2016}, -- Grizzled Veteran
    {C, 581, 782},
    {N, 782,k.GetCategoryInfoTitle(95), true}, -- PvP
    {A, 596, 1266}, -- Explore Grizzly Hills
    {C, 581, 596},
    {N, 596,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 595, 1357}, -- Fo' Grizzle My Shizzle
    {A, 595, 37}, -- Fo' Grizzle My Shizzle
    {C, 581, 595},
    {N, 595,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 581},
    {N, 581,k.GetMapName(116)}, -- Grizzly Hills
    {A, 594, 1007}, -- The Wyrmrest Accord
    {C, 580, 594},
    {N, 594,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 593, 1265}, -- Explore Dragonblight
    {C, 580, 593},
    {N, 593,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 592, 1277}, -- Rapid Defense
    {A, 592, 547}, -- Veteran of the Wrathgate
    {A, 592, 1359}, -- Might of Dragonblight
    {A, 592, 35}, -- Might of Dragonblight
    {C, 580, 592},
    {N, 592,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 580},
    {N, 580,k.GetMapName(115)}, -- Dragonblight
    {A, 590, 1254}, -- Friend or Fowl?
    {A, 590, 1263}, -- Explore Howling Fjord
    {C, 579, 590},
    {N, 590,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 589, 1356}, -- I've Toured the Fjord
    {A, 589, 34}, -- I've Toured the Fjord
    {C, 579, 589},
    {N, 589,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 579},
    {N, 579,k.GetMapName(117)}, -- Howling Fjord
    {A, 588, 949}, -- Tuskarrmageddon
    {C, 578, 588},
    {N, 588,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 587, 1264}, -- Explore Borean Tundra
    {C, 578, 587},
    {N, 587,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 586, 561}, -- D.E.H.T.A's Little P.I.T.A.
    {A, 586, 1358}, -- Nothing Boring About Borean
    {A, 586, 33}, -- Nothing Boring About Borean
    {C, 578, 586},
    {N, 586,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 577, 578},
    {N, 578,k.GetMapName(114)}, -- Borean Tundra
    {A, 614, 2078}, -- Traveler's Tundra Mammoth
    {A, 614, 2077}, -- Wooly Mammoth
    {A, 614, 2076}, -- Armored Brown Bear
    {A, 614, 2084}, -- Ring of the Kirin Tor
    {A, 614, 1956}, -- Higher Learning
    {C, 577, 614},
    {N, 614,k.GetMapName(125)}, -- Dalaran
    {A, 577, 1682}, -- The Loremaster
    {A, 577, 1681}, -- The Loremaster
    {A, 577, 2556}, -- Pest Control
    {A, 577, 1012}, -- The Winds of the North
    {A, 577, 1011}, -- The Winds of the North
    {A, 577, 1010}, -- Northrend Vanguard
    {A, 577, 1009}, -- Knights of the Ebon Blade
    {A, 577, 1008}, -- The Kirin Tor
    {A, 577, 45}, -- Northrend Explorer
    {A, 577, 2557}, -- To All The Squirrels Who Shared My Life
    {A, 577, 2257}, -- Frostbitten
    {A, 577, 2256}, -- Northern Exposure
    {A, 577, 1360}, -- Loremaster of Northrend
    {A, 577, 41}, -- Loremaster of Northrend
    {C, 83, 577},
    {N, 577,k.L["Zones"]}, -- Zones
    {C, 883, 83},
    {N, 83,k.GetCategoryInfoTitle(14866)}, -- Wrath of the Lich King
    {C, 55, 1536},
    {N, 1536,k.L["Dragon Racing"]}, -- Dragon Racing
    {C, 55, 786},
    {N, 786,k.GetCategoryInfoTitle(15117)}, -- Pet Battles
    {C, 1151, 1512},
    {N, 1512,k.GetCategoryInfoTitle(15495), true}, -- Leatherworking
    {A, 1499, 1225}, -- Outland Angler
    {A, 1499, 905}, -- Old Man Barlowned
    {A, 1499, 144}, -- The Lurker Above
    {A, 1499, 726}, -- Mr. Pinchy's Magical Crawdad Box
    {A, 1499, 129}, -- Outland Fisherman
    {C, 1151, 1499},
    {N, 1499,k.GetCategoryInfoTitle(171), true}, -- Fishing
    {A, 1478, 1801}, -- Captain Rumsey's Lager
    {A, 1478, 1800}, -- The Outland Gourmet
    {A, 1478, 906}, -- Kickin' It Up a Notch
    {A, 1478, 877}, -- The Cake Is Not A Lie
    {A, 1478, 124}, -- Outland Cook
    {C, 1151, 1478},
    {N, 1478,k.GetCategoryInfoTitle(170), true}, -- Cooking
    {C, 1151, 1469},
    {N, 1469,k.GetCategoryInfoTitle(15071), true}, -- Archaeology
    {A, 1151, 134}, -- Master Medic
    {A, 1151, 1257}, -- The Scavenger
    {A, 1151, 733}, -- Professional Outland Master
    {C, 55, 1151},
    {N, 1151,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 82, 725}, -- "Thori'dal, the Stars' Fury"
    {A, 82, 698}, -- Sunwell Plateau
    {C, 73, 82},
    {N, 82,k.GetInstanceInfoName(752)}, -- Sunwell Plateau
    {A, 81, 430}, -- Amani War Bear
    {A, 81, 691}, -- Zul'Aman
    {C, 73, 81},
    {N, 81,k.GetInstanceInfoName(77)}, -- Zul'Aman
    {A, 645, 958}, -- Sworn to the Deathsworn
    {C, 80, 645},
    {N, 645,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 80, 426}, -- Warglaives of Azzinoth
    {A, 80, 697}, -- The Black Temple
    {C, 73, 80},
    {N, 80,k.GetInstanceInfoName(751)}, -- Black Temple
    {A, 646, 959}, -- The Scale of the Sands
    {C, 79, 646},
    {N, 646,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 79, 695}, -- The Battle for Mount Hyjal
    {C, 73, 79},
    {N, 79,k.GetInstanceInfoName(750)}, -- The Battle for Mount Hyjal
    {A, 78, 885}, -- Ashes of Al'ar
    {A, 78, 696}, -- Tempest Keep
    {C, 73, 78},
    {N, 78,k.GetInstanceInfoName(749)}, -- The Eye
    {A, 77, 694}, -- Serpentshrine Cavern
    {C, 73, 77},
    {N, 77,k.GetInstanceInfoName(748)}, -- Serpentshrine Cavern
    {A, 76, 693}, -- Magtheridon's Lair
    {C, 73, 76},
    {N, 76,k.GetInstanceInfoName(747)}, -- Magtheridon's Lair
    {A, 75, 692}, -- Gruul's Lair
    {C, 73, 75},
    {N, 75,k.GetInstanceInfoName(746)}, -- Gruul's Lair
    {A, 647, 960}, -- The Violet Eye
    {C, 74, 647},
    {N, 647,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 74, 2456}, -- Vampire Hunter
    {A, 74, 882}, -- Fiery Warhorse's Reins
    {A, 74, 690}, -- Karazhan
    {C, 73, 74},
    {N, 74,k.GetInstanceInfoName(745)}, -- Karazhan
    {A, 73, 431}, -- Hand of A'dal
    {A, 73, 432}, -- Champion of the Naaru
    {A, 73, 1286}, -- Outland Raider
    {C, 55, 73},
    {N, 73,k.GetCategoryInfoTitle(15271)}, -- Raids
    {A, 72, 884}, -- Swift White Hawkstrider
    {A, 72, 682}, -- Heroic: Magister's Terrace
    {A, 72, 661}, -- Magister's Terrace
    {C, 56, 72},
    {N, 72,k.GetInstanceInfoName(249)}, -- Magisters Terrace
    {A, 71, 681}, -- Heroic: The Arcatraz
    {A, 71, 660}, -- The Arcatraz
    {C, 56, 71},
    {N, 71,k.GetInstanceInfoName(254)}, -- The Arcatraz
    {A, 70, 680}, -- Heroic: The Botanica
    {A, 70, 659}, -- The Botanica
    {C, 56, 70},
    {N, 70,k.GetInstanceInfoName(257)}, -- The Botanica
    {A, 69, 679}, -- Heroic: The Mechanar
    {A, 69, 658}, -- The Mechanar
    {C, 56, 69},
    {N, 69,k.GetInstanceInfoName(258)}, -- The Mechanar
    {A, 68, 676}, -- Heroic: Opening of the Dark Portal
    {A, 68, 655}, -- Opening of the Dark Portal
    {C, 56, 68},
    {N, 68,k.GetInstanceInfoName(255)}, -- The Black Morass
    {A, 67, 673}, -- Heroic: The Escape From Durnholde
    {A, 67, 652}, -- The Escape From Durnholde
    {C, 56, 67},
    {N, 67,k.GetInstanceInfoName(251)}, -- Old Hillsbrad Foothills
    {A, 66, 675}, -- Heroic: Shadow Labyrinth
    {A, 66, 654}, -- Shadow Labyrinth
    {C, 56, 66},
    {N, 66,k.GetInstanceInfoName(253)}, -- Shadow Labyrinth
    {A, 65, 883}, -- Reins of the Raven Lord
    {A, 65, 674}, -- Heroic: Sethekk Halls
    {A, 65, 653}, -- Sethekk Halls
    {C, 56, 65},
    {N, 65,k.GetInstanceInfoName(252)}, -- Sethekk Halls
    {A, 64, 672}, -- Heroic: Auchenai Crypts
    {A, 64, 666}, -- Auchenai Crypts
    {C, 56, 64},
    {N, 64,k.GetInstanceInfoName(247)}, -- Auchenai Crypts
    {A, 63, 671}, -- Heroic: Mana-Tombs
    {A, 63, 651}, -- Mana-Tombs
    {C, 56, 63},
    {N, 63,k.GetInstanceInfoName(250)}, -- Mana-Tombs
    {A, 62, 677}, -- Heroic: The Steamvault
    {A, 62, 656}, -- The Steamvault
    {C, 56, 62},
    {N, 62,k.GetInstanceInfoName(261)}, -- The Steamvault
    {A, 61, 670}, -- Heroic: Underbog
    {A, 61, 650}, -- Underbog
    {C, 56, 61},
    {N, 61,k.GetInstanceInfoName(262)}, -- The Underbog
    {A, 60, 669}, -- Heroic: The Slave Pens
    {A, 60, 649}, -- The Slave Pens
    {C, 56, 60},
    {N, 60,k.GetInstanceInfoName(260)}, -- The Slave Pens
    {A, 59, 678}, -- Heroic: The Shattered Halls
    {A, 59, 657}, -- The Shattered Halls
    {C, 56, 59},
    {N, 59,k.GetInstanceInfoName(259)}, -- The Shattered Halls
    {A, 58, 668}, -- Heroic: The Blood Furnace
    {A, 58, 648}, -- The Blood Furnace
    {C, 56, 58},
    {N, 58,k.GetInstanceInfoName(256)}, -- The Blood Furnace
    {A, 57, 667}, -- Heroic: Hellfire Ramparts
    {A, 57, 647}, -- Hellfire Ramparts
    {C, 56, 57},
    {N, 57,k.GetInstanceInfoName(248)}, -- Hellfire Ramparts
    {A, 56, 1287}, -- Outland Dungeon Hero
    {A, 56, 1284}, -- Outland Dungeonmaster
    {C, 55, 56},
    {N, 56,k.GetCategoryInfoTitle(15272)}, -- Dungeons
    {A, 751, 868}, -- Explore Isle of Quel'Danas
    {C, 750, 751},
    {N, 751,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 616, 750},
    {N, 750,k.GetMapName(1957)}, -- Isle of Quel'Danas
    {A, 638, 1638}, -- Skyshattered
    {A, 638, 898}, -- On Wings of Nether
    {C, 623, 638},
    {N, 638,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 637, 864}, -- Explore Shadowmoon Valley
    {C, 623, 637},
    {N, 637,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 630, 1195}, -- Shadow of the Betrayer
    {C, 623, 630},
    {N, 630,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 623},
    {N, 623,k.GetMapName(1948)}, -- Shadowmoon Valley
    {A, 636, 843}, -- Explore Netherstorm
    {C, 622, 636},
    {N, 636,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 629, 1194}, -- Into the Nether
    {C, 622, 629},
    {N, 629,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 622},
    {N, 622,k.GetMapName(1953)}, -- Netherstorm
    {A, 640, 896}, -- A Quest a Day Keeps the Ogres at Bay
    {C, 621, 640},
    {N, 640,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 635, 865}, -- Explore Blade's Edge Mountains
    {C, 621, 635},
    {N, 635,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 628, 1276}, -- Blade's Edge Bomberman
    {A, 628, 1193}, -- On the Blade's Edge
    {C, 621, 628},
    {N, 628,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 621},
    {N, 621,k.GetMapName(1949)}, -- Blade's Edge Mountains
    {A, 641, 943}, -- The Diplomat
    {A, 641, 942}, -- The Diplomat
    {A, 641, 901}, -- Mag'har of Draenor
    {A, 641, 899}, -- "Oh My, Kurenai"
    {C, 620, 641},
    {N, 641,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 634, 866}, -- Explore Nagrand
    {C, 620, 634},
    {N, 634,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 627, 1576}, -- Of Blood and Anguish
    {A, 627, 941}, -- Hemet Nesingwary: The Collected Quests
    {A, 627, 939}, -- Hills Like White Elekk
    {A, 627, 1273}, -- Nagrand Slam
    {A, 627, 1192}, -- Nagrand Slam
    {C, 620, 627},
    {N, 627,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 620},
    {N, 620,k.GetMapName(1951)}, -- Nagrand
    {A, 642, 1205}, -- Hero of Shattrath
    {A, 642, 903}, -- Shattrath Divided
    {C, 619, 642},
    {N, 642,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 633, 867}, -- Explore Terokkar Forest
    {C, 619, 633},
    {N, 633,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 626, 1275}, -- Bombs Away
    {A, 626, 1272}, -- Terror of Terokkar
    {A, 626, 1191}, -- Terror of Terokkar
    {C, 619, 626},
    {N, 626,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 619},
    {N, 619,k.GetMapName(1952)}, -- Terokkar Forest
    {A, 643, 943}, -- The Diplomat
    {A, 643, 942}, -- The Diplomat
    {A, 643, 900}, -- The Czar of Sporeggar
    {A, 643, 953}, -- Guardian of Cenarius
    {A, 643, 893}, -- Cenarion War Hippogryph
    {A, 643, 762}, -- Ambassador of the Horde
    {A, 643, 948}, -- Ambassador of the Alliance
    {C, 618, 643},
    {N, 643,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 632, 863}, -- Explore Zangarmarsh
    {C, 618, 632},
    {N, 632,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 625, 1190}, -- Mysteries of the Marsh
    {C, 618, 625},
    {N, 625,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 618},
    {N, 618,k.GetMapName(1946)}, -- Zangarmarsh
    {A, 1011, 762}, -- Ambassador of the Horde
    {A, 1011, 948}, -- Ambassador of the Alliance
    {C, 617, 1011},
    {N, 1011,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 631, 862}, -- Explore Hellfire Peninsula
    {C, 617, 631},
    {N, 631,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 624, 1271}, -- To Hellfire and Back
    {A, 624, 1189}, -- To Hellfire and Back
    {C, 617, 624},
    {N, 624,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 617},
    {N, 617,k.GetMapName(1944)}, -- Hellfire Peninsula
    {A, 1010, 762}, -- Ambassador of the Horde
    {C, 669, 1010},
    {N, 1010,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 733, 858}, -- Explore Ghostlands
    {C, 669, 733},
    {N, 733,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 669, 670},
    {N, 670,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 669},
    {N, 669,k.GetMapName(1942)}, -- Ghostlands
    {A, 1008, 762}, -- Ambassador of the Horde
    {C, 727, 1008},
    {N, 1008,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 728, 859}, -- Explore Eversong Woods
    {C, 727, 728},
    {N, 728,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 616, 727},
    {N, 727,k.GetMapName(1941)}, -- Eversong Woods
    {A, 1000, 948}, -- Ambassador of the Alliance
    {C, 693, 1000},
    {N, 1000,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 763, 861}, -- Explore Bloodmyst Isle
    {C, 693, 763},
    {N, 763,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 693, 694},
    {N, 694,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 616, 693},
    {N, 693,k.GetMapName(1950)}, -- Bloodmyst Isle
    {A, 998, 948}, -- Ambassador of the Alliance
    {C, 758, 998},
    {N, 998,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 759, 860}, -- Explore Azuremyst Isle
    {C, 758, 759},
    {N, 759,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 616, 758},
    {N, 758,k.GetMapName(1943)}, -- Azuremyst Isle
    {A, 969, 603}, -- Wrath of the Horde
    {A, 969, 619}, -- For the Horde!
    {A, 969, 618}, -- Putting Out the Light
    {C, 616, 969},
    {N, 969,k.GetMapName(1947)}, -- The Exodar
    {A, 924, 604}, -- Wrath of the Alliance
    {A, 924, 614}, -- For the Alliance!
    {A, 924, 613}, -- Killed in Quel'Thalas
    {C, 616, 924},
    {N, 924,k.GetMapName(1954)}, -- Silvermoon City
    {A, 794, 1165}, -- "My Storage is ""Gigantique"""
    {C, 616, 794},
    {N, 794,k.GetMapName(1955)}, -- Shattrath City
    {A, 616, 1682}, -- The Loremaster
    {A, 616, 1681}, -- The Loremaster
    {A, 616, 902}, -- Chief Exalted Officer
    {A, 616, 897}, -- You're So Offensive
    {A, 616, 894}, -- Flying High Over Skettis
    {A, 616, 764}, -- The Burning Crusader
    {A, 616, 763}, -- The Burning Crusader
    {A, 616, 44}, -- Outland Explorer
    {A, 616, 1312}, -- Bloody Rare
    {A, 616, 1311}, -- Medium Rare
    {A, 616, 1274}, -- Loremaster of Outland
    {A, 616, 1262}, -- Loremaster of Outland
    {C, 55, 616},
    {N, 616,k.L["Zones"]}, -- Zones
    {C, 883, 55},
    {N, 55,k.GetCategoryInfoTitle(14865)}, -- The Burning Crusade
    {C, 1530, 1533},
    {N, 1533,k.L["Eastern Kingdoms Cup"]}, -- Eastern Kingdoms Cup
    {C, 1530, 1449},
    {N, 1449,k.L["Kalimdor Cup"]}, -- Kalimdor Cup
    {C, 1, 1530},
    {N, 1530,k.L["Dragon Racing"]}, -- Dragon Racing
    {C, 1, 785},
    {N, 785,k.GetCategoryInfoTitle(15117)}, -- Pet Battles
    {C, 1150, 1529},
    {N, 1529,k.GetCategoryInfoTitle(15496), true}, -- Tailoring
    {C, 1150, 1516},
    {N, 1516,k.GetCategoryInfoTitle(15497), true}, -- Mining
    {C, 1150, 1513},
    {N, 1513,k.GetCategoryInfoTitle(15495), true}, -- Leatherworking
    {A, 1500, 1837}, -- Old Ironjaw
    {A, 1500, 1836}, -- Old Crafty
    {A, 1500, 878}, -- One That Didn't Get Away
    {A, 1500, 306}, -- Master Angler of Azeroth
    {A, 1500, 150}, -- The Fishing Diplomat
    {A, 1500, 128}, -- Artisan Fisherman
    {A, 1500, 127}, -- Expert Fisherman
    {A, 1500, 126}, -- Journeyman Fisherman
    {C, 1150, 1500},
    {N, 1500,k.GetCategoryInfoTitle(171), true}, -- Fishing
    {A, 1477, 123}, -- Classic Cook
    {A, 1477, 122}, -- Expert Cook
    {A, 1477, 121}, -- Journeyman Cook
    {C, 1150, 1477},
    {N, 1477,k.GetCategoryInfoTitle(170), true}, -- Cooking
    {C, 1150, 1476},
    {N, 1476,k.GetCategoryInfoTitle(15490), true}, -- Blacksmithing
    {C, 1150, 1468},
    {N, 1468,k.GetCategoryInfoTitle(15071), true}, -- Archaeology
    {A, 1150, 133}, -- Artisan Medic
    {A, 1150, 132}, -- Expert Medic
    {A, 1150, 131}, -- Journeyman Medic
    {A, 1150, 732}, -- Professional Classic Master
    {A, 1150, 731}, -- Professional Expert
    {A, 1150, 116}, -- Professional Journeyman
    {C, 1, 1150},
    {N, 1150,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 796, 15637}, -- The Immortal (Season of Mastery)
    {A, 796, 15335}, -- Survivor of the Damned (Season of Mastery)
    {A, 796, 425}, -- "Atiesh, Greatstaff of the Guardian"
    {C, 3, 796},
    {N, 796,k.GetInstanceInfoName(754) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"}, -- Naxxramas
    {A, 780, 956}, -- Brood of Nozdormu
    {C, 30, 780},
    {N, 780,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 30, 15334}, -- Survivor of the Old God (Season of Mastery)
    {A, 30, 424}, -- Why? Because It's Red
    {A, 30, 687}, -- Temple of Ahn'Qiraj
    {C, 3, 30},
    {N, 30,k.GetInstanceInfoName(744)}, -- Temple of Ahn'Qiraj
    {A, 784, 953}, -- Guardian of Cenarius
    {C, 29, 784},
    {N, 784,k.GetCategoryInfoTitle(201)}, -- Reputation
    {A, 29, 689}, -- Ruins of Ahn'Qiraj
    {C, 3, 29},
    {N, 29,k.GetInstanceInfoName(743)}, -- Ruins of Ahn'Qiraj
    {A, 789, 957}, -- Hero of the Zandalar Tribe
    {C, 28, 789},
    {N, 789,k.GetCategoryInfoTitle(201)}, -- Reputation
    {A, 28, 881}, -- Swift Razzashi Raptor
    {A, 28, 880}, -- Swift Zulian Tiger
    {A, 28, 688}, -- Zul'Gurub
    {A, 28, 560}, -- Deadliest Catch
    {C, 3, 28},
    {N, 28,k.GetInstanceInfoName(76)}, -- Zul'Gurub
    {A, 27, 15333}, -- Survivor of the Shadow Flame (Season of Mastery)
    {A, 27, 685}, -- Blackwing Lair
    {C, 3, 27},
    {N, 27,k.GetInstanceInfoName(742)}, -- Blackwing Lair
    {A, 26, 684}, -- Onyxia's Lair (Level 60)
    {C, 3, 26},
    {N, 26,k.GetInstanceInfoName(760) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"}, -- Onyxia's Lair
    {A, 779, 2496}, -- The Fifth Element
    {A, 779, 955}, -- Hydraxian Waterlords
    {C, 7, 779},
    {N, 779,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 7, 15330}, -- Survivor of the Firelord (Season of Mastery)
    {A, 7, 428}, -- "Thunderfury, Blessed Blade of the Windseeker"
    {A, 7, 429}, -- "Sulfuras, Hand of Ragnaros"
    {A, 7, 686}, -- Molten Core
    {C, 3, 7},
    {N, 7,k.GetInstanceInfoName(741)}, -- Molten Core
    {A, 3, 1285}, -- Classic Raider
    {C, 1, 3},
    {N, 3,k.GetCategoryInfoTitle(15271)}, -- Raids
    {A, 25, 729}, -- Deathcharger's Reins
    {A, 25, 646}, -- Stratholme
    {C, 2, 25},
    {N, 25,k.GetInstanceInfoName(236)}, -- Stratholme
    {A, 1455, 645}, -- Scholomance
    {C, 2, 1455},
    {N, 1455,k.GetInstanceInfoName(246)}, -- Scholomance
    {A, 23, 644}, -- King of Dire Maul
    {C, 2, 23},
    {N, 23,k.GetInstanceInfoName(230)}, -- Dire Maul
    {A, 797, 2188}, -- Leeeeeeeeeeeeeroy!
    {A, 797, 1307}, -- Upper Blackrock Spire (Classic)
    {C, 2, 797},
    {N, 797,k.GetInstanceInfoName(559)}, -- Upper Blackrock Spire
    {A, 22, 643}, -- Lower Blackrock Spire
    {C, 2, 22},
    {N, 22,k.GetInstanceInfoName(229)}, -- Lower Blackrock Spire
    {A, 21, 3496}, -- A Brew-FAST Mount
    {A, 21, 642}, -- Blackrock Depths
    {C, 2, 21},
    {N, 21,k.GetInstanceInfoName(228)}, -- Blackrock Depths
    {A, 20, 641}, -- Sunken Temple
    {C, 2, 20},
    {N, 20,k.GetInstanceInfoName(237)}, -- The Temple Of Atal'hakkar
    {A, 19, 640}, -- Maraudon
    {C, 2, 19},
    {N, 19,k.GetInstanceInfoName(232)}, -- Maraudon
    {A, 18, 639}, -- Zul'Farrak
    {C, 2, 18},
    {N, 18,k.GetInstanceInfoName(241)}, -- Zul'Farrak
    {A, 17, 638}, -- Uldaman
    {C, 2, 17},
    {N, 17,k.GetInstanceInfoName(239)}, -- Uldaman
    {A, 16, 980}, -- The Horseman's Reins
    {A, 16, 637}, -- Scarlet Monastery
    {C, 2, 16},
    {N, 16,k.GetInstanceInfoName(316)}, -- Scarlet Monastery
    {C, 2, 15},
    {N, 15,k.GetInstanceInfoName(311)}, -- Scarlet Halls
    {A, 14, 636}, -- Razorfen Downs
    {C, 2, 14},
    {N, 14,k.GetInstanceInfoName(234)}, -- Razorfen Downs
    {A, 13, 635}, -- Razorfen Kraul
    {C, 2, 13},
    {N, 13,k.GetInstanceInfoName(233)}, -- Razorfen Kraul
    {A, 12, 634}, -- Gnomeregan
    {C, 2, 12},
    {N, 12,k.GetInstanceInfoName(231)}, -- Gnomeregan
    {A, 11, 633}, -- Stormwind Stockade
    {C, 2, 11},
    {N, 11,k.GetInstanceInfoName(238)}, -- The Stockade
    {A, 10, 632}, -- Blackfathom Deeps
    {C, 2, 10},
    {N, 10,k.GetInstanceInfoName(227)}, -- Blackfathom Deeps
    {A, 9, 4627}, -- X-45 Heartbreaker
    {A, 9, 631}, -- Shadowfang Keep
    {C, 2, 9},
    {N, 9,k.GetInstanceInfoName(64)}, -- Shadowfang Keep
    {A, 8, 630}, -- Wailing Caverns
    {C, 2, 8},
    {N, 8,k.GetInstanceInfoName(240)}, -- Wailing Caverns
    {A, 5, 629}, -- Ragefire Chasm
    {C, 2, 5},
    {N, 5,k.GetInstanceInfoName(226)}, -- Ragefire Chasm
    {A, 4, 628}, -- Deadmines
    {C, 2, 4},
    {N, 4,k.GetInstanceInfoName(63)}, -- Deadmines
    {A, 2, 1283}, -- Classic Dungeonmaster
    {C, 1, 2},
    {N, 2,k.GetCategoryInfoTitle(15272)}, -- Dungeons
    {A, 1031, 2336}, -- Insane in the Membrane
    {C, 719, 1031},
    {N, 1031,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 777, 857}, -- Explore Winterspring
    {C, 719, 777},
    {N, 777,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 719, 720},
    {N, 720,k.GetCategoryInfoTitle(96), true}, -- Quests
    {A, 719, 3356}, -- Winterspring Frostsaber
    {C, 688, 719},
    {N, 719,k.GetMapName(1452)}, -- Winterspring
    {A, 783, 953}, -- Guardian of Cenarius
    {C, 707, 783},
    {N, 783,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 776, 856}, -- Explore Silithus
    {C, 707, 776},
    {N, 776,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 707, 708},
    {N, 708,k.GetCategoryInfoTitle(96), true}, -- Quests
    {A, 707, 416}, -- Scarab Lord
    {C, 688, 707},
    {N, 707,k.GetMapName(1451)}, -- Silithus
    {A, 773, 854}, -- Explore Un'Goro Crater
    {C, 717, 773},
    {N, 773,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 717, 718},
    {N, 718,k.GetCategoryInfoTitle(96), true}, -- Quests
    {A, 717, 3357}, -- Venomhide Ravasaur
    {C, 688, 717},
    {N, 717,k.GetMapName(1449)}, -- Un'Goro Crater
    {A, 991, 762}, -- Ambassador of the Horde
    {A, 991, 948}, -- Ambassador of the Alliance
    {C, 701, 991},
    {N, 991,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 772, 853}, -- Explore Felwood
    {C, 701, 772},
    {N, 772,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 701, 702},
    {N, 702,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 701},
    {N, 701,k.GetMapName(1448)}, -- Felwood
    {A, 992, 2336}, -- Insane in the Membrane
    {A, 992, 762}, -- Ambassador of the Horde
    {A, 992, 948}, -- Ambassador of the Alliance
    {C, 713, 992},
    {N, 992,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 770, 851}, -- Explore Tanaris
    {C, 713, 770},
    {N, 770,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 713, 714},
    {N, 714,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 713},
    {N, 713,k.GetMapName(1446)}, -- Tanaris
    {A, 994, 762}, -- Ambassador of the Horde
    {A, 994, 948}, -- Ambassador of the Alliance
    {C, 715, 994},
    {N, 994,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 765, 846}, -- Explore Thousand Needles
    {C, 715, 765},
    {N, 765,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 715, 716},
    {N, 716,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 715},
    {N, 715,k.GetMapName(1441)}, -- Thousand Needles
    {A, 1004, 948}, -- Ambassador of the Alliance
    {C, 699, 1004},
    {N, 1004,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 768, 850}, -- Explore Dustwallow Marsh
    {C, 699, 768},
    {N, 768,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 699, 700},
    {N, 700,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 699},
    {N, 699,k.GetMapName(1445)}, -- Dustwallow Marsh
    {A, 1009, 762}, -- Ambassador of the Horde
    {A, 1009, 948}, -- Ambassador of the Alliance
    {C, 703, 1009},
    {N, 1009,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 769, 849}, -- Explore Feralas
    {C, 703, 769},
    {N, 769,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 703, 704},
    {N, 704,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 703},
    {N, 703,k.GetMapName(1444)}, -- Feralas
    {A, 1002, 762}, -- Ambassador of the Horde
    {C, 697, 1002},
    {N, 1002,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 767, 848}, -- Explore Desolace
    {C, 697, 767},
    {N, 767,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 697, 698},
    {N, 698,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 697},
    {N, 697,k.GetMapName(1443)}, -- Desolace
    {A, 1021, 762}, -- Ambassador of the Horde
    {A, 1021, 948}, -- Ambassador of the Alliance
    {C, 709, 1021},
    {N, 1021,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 766, 847}, -- Explore Stonetalon Mountains
    {C, 709, 766},
    {N, 766,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 709, 710},
    {N, 710,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 709},
    {N, 709,k.GetMapName(1442)}, -- Stonetalon Mountains
    {A, 997, 948}, -- Ambassador of the Alliance
    {C, 689, 997},
    {N, 997,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 764, 845}, -- Explore Ashenvale
    {C, 689, 764},
    {N, 764,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 689, 690},
    {N, 690,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 689},
    {N, 689,k.GetMapName(1440)}, -- Ashenvale
    {A, 990, 762}, -- Ambassador of the Horde
    {C, 691, 990},
    {N, 990,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 771, 852}, -- Explore Azshara
    {C, 691, 771},
    {N, 771,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 691, 692},
    {N, 692,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 691},
    {N, 691,k.GetMapName(1447)}, -- Azshara
    {A, 1001, 948}, -- Ambassador of the Alliance
    {C, 695, 1001},
    {N, 1001,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 762, 844}, -- Explore Darkshore
    {C, 695, 762},
    {N, 762,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 695, 696},
    {N, 696,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 688, 695},
    {N, 695,k.GetMapName(1439)}, -- Darkshore
    {A, 1382, 2336}, -- Insane in the Membrane
    {A, 1382, 762}, -- Ambassador of the Horde
    {C, 1379, 1382},
    {N, 1382,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 1381, 750}, -- Explore Northern Barrens
    {C, 1379, 1381},
    {N, 1381,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 688, 1379},
    {N, 1379,k.GetMapName(1413)}, -- The Barrens
    {A, 775, 855}, -- Explore Moonglade
    {C, 774, 775},
    {N, 775,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 688, 774},
    {N, 774,k.GetMapName(1450)}, -- Moonglade
    {A, 1014, 762}, -- Ambassador of the Horde
    {C, 754, 1014},
    {N, 1014,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 755, 736}, -- Explore Mulgore
    {C, 754, 755},
    {N, 755,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 688, 754},
    {N, 754,k.GetMapName(1412)}, -- Mulgore
    {A, 1003, 762}, -- Ambassador of the Horde
    {C, 752, 1003},
    {N, 1003,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 753, 728}, -- Explore Durotar
    {C, 752, 753},
    {N, 753,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 752, 4790}, -- Zalazane's Fall
    {C, 688, 752},
    {N, 752,k.GetMapName(1411)}, -- Durotar
    {A, 1025, 948}, -- Ambassador of the Alliance
    {C, 756, 1025},
    {N, 1025,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 757, 842}, -- Explore Teldrassil
    {C, 756, 757},
    {N, 757,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 688, 756},
    {N, 756,k.GetMapName(1438)}, -- Teldrassil
    {A, 923, 604}, -- Wrath of the Alliance
    {A, 923, 611}, -- Bleeding Bloodhoof
    {C, 688, 923},
    {N, 923,k.GetMapName(1456)}, -- Thunder Bluff
    {A, 1018, 762}, -- Ambassador of the Horde
    {C, 921, 1018},
    {N, 1018,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 921, 604}, -- Wrath of the Alliance
    {A, 921, 1006}, -- City Defender
    {A, 921, 614}, -- For the Alliance!
    {A, 921, 610}, -- Orgrimmar Offensive
    {C, 688, 921},
    {N, 921,k.GetMapName(1454)}, -- Orgrimmar
    {A, 975, 603}, -- Wrath of the Horde
    {A, 975, 617}, -- Immortal No More
    {C, 688, 975},
    {N, 975,k.GetMapName(1457)}, -- Darnassus
    {A, 688, 1682}, -- The Loremaster
    {A, 688, 1681}, -- The Loremaster
    {A, 688, 43}, -- Kalimdor Explorer
    {A, 688, 1680}, -- Loremaster of Kalimdor
    {A, 688, 1678}, -- Loremaster of Kalimdor
    {C, 648, 688},
    {N, 688,k.GetMapName(1414)}, -- Kalimdor
    {A, 749, 777}, -- Explore Deadwind Pass
    {C, 748, 749},
    {N, 749,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 687, 748},
    {N, 748,k.GetMapName(1430)}, -- Deadwind Pass
    {A, 999, 762}, -- Ambassador of the Horde
    {A, 999, 948}, -- Ambassador of the Alliance
    {C, 660, 999},
    {N, 999,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 744, 766}, -- Explore Blasted Lands
    {C, 660, 744},
    {N, 744,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 660, 662},
    {N, 662,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 660},
    {N, 660,k.GetMapName(1419)}, -- Blasted Lands
    {A, 745, 775}, -- Explore Burning Steppes
    {C, 663, 745},
    {N, 745,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 663, 664},
    {N, 664,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 663},
    {N, 663,k.GetMapName(1428)}, -- Burning Steppes
    {A, 1023, 948}, -- Ambassador of the Alliance
    {C, 683, 1023},
    {N, 1023,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 737, 782}, -- Explore Swamp of Sorrows
    {C, 683, 737},
    {N, 737,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 683, 684},
    {N, 684,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 683},
    {N, 683,k.GetMapName(1435)}, -- Swamp of Sorrows
    {A, 743, 774}, -- Explore Searing Gorge
    {C, 679, 743},
    {N, 743,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 679, 680},
    {N, 680,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 679},
    {N, 679,k.GetMapName(1427)}, -- Searing Gorge
    {A, 738, 765}, -- Explore Badlands
    {C, 659, 738},
    {N, 738,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 659, 661},
    {N, 661,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 659},
    {N, 659,k.GetMapName(1418)}, -- Badlands
    {A, 778, 945}, -- The Argent Champion
    {A, 778, 946}, -- The Argent Dawn
    {C, 667, 778},
    {N, 778,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 747, 771}, -- Explore Eastern Plaguelands
    {C, 667, 747},
    {N, 747,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 667, 668},
    {N, 668,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 667},
    {N, 667,k.GetMapName(1423)}, -- Eastern Plaguelands
    {A, 1024, 762}, -- Ambassador of the Horde
    {C, 673, 1024},
    {N, 1024,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 742, 773}, -- Explore The Hinterlands
    {C, 673, 742},
    {N, 742,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 673, 674},
    {N, 674,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 673},
    {N, 673,k.GetMapName(1425)}, -- The Hinterlands
    {A, 1027, 762}, -- Ambassador of the Horde
    {A, 1027, 948}, -- Ambassador of the Alliance
    {C, 685, 1027},
    {N, 1027,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 746, 770}, -- Explore Western Plaguelands
    {C, 685, 746},
    {N, 746,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 685, 686},
    {N, 686,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 685},
    {N, 685,k.GetMapName(1422)}, -- Western Plaguelands
    {A, 1389, 2336}, -- Insane in the Membrane
    {A, 1389, 871}, -- "Avast Ye, Admiral!"
    {A, 1389, 762}, -- Ambassador of the Horde
    {A, 1389, 948}, -- Ambassador of the Alliance
    {C, 1385, 1389},
    {N, 1389,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 1388, 396}, -- Gurubashi Arena Grand Master
    {A, 1388, 389}, -- Gurubashi Arena Master
    {C, 1385, 1388},
    {N, 1388,k.GetCategoryInfoTitle(95), true}, -- Player vs. Player
    {A, 1387, 781}, -- Explore Northern Stranglethorn
    {C, 1385, 1387},
    {N, 1387,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 1386, 941}, -- Hemet Nesingwary: The Collected Quests
    {A, 1386, 940}, -- The Green Hills of Stranglethorn
    {C, 1385, 1386},
    {N, 1386,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 1385},
    {N, 1385,k.GetMapName(1434)}, -- Stranglethorn Vale
    {A, 996, 762}, -- Ambassador of the Horde
    {A, 996, 948}, -- Ambassador of the Alliance
    {C, 649, 996},
    {N, 996,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 741, 761}, -- Explore Arathi Highlands
    {C, 649, 741},
    {N, 741,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 649, 650},
    {N, 650,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 649},
    {N, 649,k.GetMapName(1417)}, -- Arathi Highlands
    {A, 1384, 760}, -- Explore Alterac Mountains
    {C, 1383, 1384},
    {N, 1384,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 687, 1383},
    {N, 1383,k.GetMapName(1416)}, -- Alterac Mountains
    {A, 1012, 2336}, -- Insane in the Membrane
    {A, 1012, 762}, -- Ambassador of the Horde
    {C, 671, 1012},
    {N, 1012,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 736, 772}, -- Explore Hillsbrad Foothills
    {C, 671, 736},
    {N, 736,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 671, 672},
    {N, 672,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 671},
    {N, 671,k.GetMapName(1424)}, -- Hillsbrad Foothills
    {A, 1029, 948}, -- Ambassador of the Alliance
    {C, 656, 1029},
    {N, 1029,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 731, 841}, -- Explore Wetlands
    {C, 656, 731},
    {N, 731,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 656, 658},
    {N, 658,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 656},
    {N, 656,k.GetMapName(1437)}, -- Wetlands
    {A, 1007, 948}, -- Ambassador of the Alliance
    {C, 652, 1007},
    {N, 1007,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 735, 778}, -- Explore Duskwood
    {C, 652, 735},
    {N, 735,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 652, 654},
    {N, 654,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 652},
    {N, 652,k.GetMapName(1431)}, -- Duskwood
    {A, 1017, 948}, -- Ambassador of the Alliance
    {C, 678, 1017},
    {N, 1017,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 734, 780}, -- Explore Redridge Mountains
    {C, 678, 734},
    {N, 734,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 678, 677},
    {N, 677,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 678},
    {N, 678,k.GetMapName(1433)}, -- Redridge Mountains
    {A, 1020, 762}, -- Ambassador of the Horde
    {C, 681, 1020},
    {N, 1020,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 732, 769}, -- Explore Silverpine Forest
    {C, 681, 732},
    {N, 732,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 681, 682},
    {N, 682,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 681},
    {N, 681,k.GetMapName(1421)}, -- Silverpine Forest
    {A, 1013, 948}, -- Ambassador of the Alliance
    {C, 655, 1013},
    {N, 1013,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 729, 779}, -- Explore Loch Modan
    {C, 655, 729},
    {N, 729,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 655, 657},
    {N, 657,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 655},
    {N, 655,k.GetMapName(1432)}, -- Loch Modan
    {A, 1028, 948}, -- Ambassador of the Alliance
    {C, 651, 1028},
    {N, 1028,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 730, 802}, -- Explore Westfall
    {C, 651, 730},
    {N, 730,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 651, 653},
    {N, 653,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 651},
    {N, 651,k.GetMapName(1436)}, -- Westfall
    {A, 1026, 762}, -- Ambassador of the Horde
    {C, 725, 1026},
    {N, 1026,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 726, 768}, -- Explore Tirisfal Glades
    {C, 725, 726},
    {N, 726,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 725, 1201},
    {N, 1201,k.GetCategoryInfoTitle(96), true}, -- Quests
    {C, 687, 725},
    {N, 725,k.GetMapName(1420)}, -- Tirisfal Glades
    {A, 1006, 948}, -- Ambassador of the Alliance
    {C, 722, 1006},
    {N, 1006,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 724, 776}, -- Explore Elwynn Forest
    {C, 722, 724},
    {N, 724,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {C, 687, 722},
    {N, 722,k.GetMapName(1429)}, -- Elwynn Forest
    {A, 1005, 948}, -- Ambassador of the Alliance
    {C, 721, 1005},
    {N, 1005,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {A, 723, 627}, -- Explore Dun Morogh
    {C, 721, 723},
    {N, 723,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 721, 4786}, -- Operation: Gnomeregan
    {C, 687, 721},
    {N, 721,k.GetMapName(1426)}, -- Dun Morogh
    {A, 974, 604}, -- Wrath of the Alliance
    {A, 974, 612}, -- Downing the Dark Lady
    {C, 687, 974},
    {N, 974,k.GetMapName(1458)}, -- Undercity
    {A, 970, 603}, -- Wrath of the Horde
    {A, 970, 619}, -- For the Horde!
    {A, 970, 616}, -- Overthrow the Council
    {C, 687, 970},
    {N, 970,k.GetMapName(1455)}, -- Ironforge
    {A, 1022, 948}, -- Ambassador of the Alliance
    {C, 922, 1022},
    {N, 1022,k.GetCategoryInfoTitle(201), true}, -- Reputation
    {C, 922, 1033},
    {N, 1033,k.GetCategoryInfoTitle(97), true}, -- Exploration
    {A, 922, 603}, -- Wrath of the Horde
    {A, 922, 388}, -- City Defender
    {A, 922, 615}, -- Storming Stormwind
    {C, 687, 922},
    {N, 922,k.GetMapName(1453)}, -- Stormwind City
    {A, 687, 1682}, -- The Loremaster
    {A, 687, 1681}, -- The Loremaster
    {A, 687, 42}, -- Eastern Kingdoms Explorer
    {A, 687, 1677}, -- Loremaster of Eastern Kingdoms
    {A, 687, 1676}, -- Loremaster of Eastern Kingdoms
    {C, 648, 687},
    {N, 687,k.GetMapName(1415)}, -- Eastern Kingdoms
    {A, 648, 943}, -- The Diplomat
    {A, 648, 942}, -- The Diplomat
    {A, 648, 944}, -- They Love Me In That Tunnel
    {A, 648, 1206}, -- To All The Squirrels I've Loved Before
    {C, 1, 648},
    {N, 648,k.L["Zones"]}, -- Zones
    {C, 883, 1},
    {N, 1,k.GetCategoryInfoTitle(14864)}, -- Classic
    {A, 1172, 3896}, -- Onyx Panther
    {A, 1172, 3636}, -- Jade Tiger
    {A, 1172, 4496}, -- It's Over Nine Thousand!
    {C, 1431, 1172},
    {N, 1172,k.GetCategoryInfoTitle(81)}, -- Feats of Strength
    {A, 1171, 1021}, -- Twenty-Five Tabards
    {A, 1171, 1020}, -- Ten Tabards
    {A, 1171, 621}, -- Represent
    {C, 1431, 1171},
    {N, 1171,k.GetCategoryInfoTitle(15246)}, -- Collections
    {C, 1170, 1435},
    {N, 1435,k.GetCategoryInfoTitle(15120), true}, -- Level
    {C, 1170, 1434},
    {N, 1434,k.GetCategoryInfoTitle(15119), true}, -- Battle
    {A, 1433, 2516}, -- Lil' Game Hunter
    {A, 1433, 1250}, -- "Shop Smart, Shop Pet...Smart"
    {A, 1433, 1248}, -- Plethora of Pets
    {A, 1433, 15}, -- Plenty of Pets
    {A, 1433, 1017}, -- Can I Keep Him?
    {C, 1170, 1433},
    {N, 1433,k.GetCategoryInfoTitle(15118), true}, -- Collect
    {C, 1431, 1170},
    {N, 1170,k.GetCategoryInfoTitle(15117)}, -- Pet Battles
    {A, 1163, 1014}, -- 35 Exalted Reputations
    {A, 1163, 518}, -- 30 Exalted Reputations
    {A, 1163, 519}, -- 25 Exalted Reputations
    {A, 1163, 520}, -- 20 Exalted Reputations
    {A, 1163, 521}, -- 15 Exalted Reputations
    {A, 1163, 524}, -- 10 Exalted Reputations
    {A, 1163, 523}, -- 5 Exalted Reputations
    {A, 1163, 522}, -- Somebody Likes Me
    {C, 1431, 1163},
    {N, 1163,k.GetCategoryInfoTitle(201)}, -- Reputation
    {A, 1524, 141}, -- Ultimate Triage
    {C, 1149, 1524},
    {N, 1524,k.GetCategoryInfoTitle(15496)}, -- Tailoring
    {C, 1149, 1510},
    {N, 1510,k.GetCategoryInfoTitle(15495)}, -- Leatherworking
    {C, 1149, 1465},
    {N, 1465,k.GetCategoryInfoTitle(15494)}, -- Jewelcrafting
    {C, 1149, 1464},
    {N, 1464,k.GetCategoryInfoTitle(15493)}, -- Inscription
    {A, 1462, 1516}, -- Accomplished Angler
    {A, 1462, 1561}, -- 1000 Fish
    {A, 1462, 1560}, -- 500 Fish
    {A, 1462, 1559}, -- 250 Fish
    {A, 1462, 1558}, -- 100 Fish
    {A, 1462, 1557}, -- 50 Fish
    {A, 1462, 1556}, -- 25 Fish
    {A, 1462, 3218}, -- Turtles All the Way Down
    {A, 1462, 1243}, -- Fish Don't Leave Footprints
    {A, 1462, 1257}, -- The Scavenger
    {A, 1462, 153}, -- The Old Gnome and the Sea
    {C, 1149, 1462},
    {N, 1462,k.GetCategoryInfoTitle(171)}, -- Fishing
    {C, 1149, 1461},
    {N, 1461,k.GetCategoryInfoTitle(15492)}, -- Engineering
    {C, 1149, 1460},
    {N, 1460,k.GetCategoryInfoTitle(15491)}, -- Enchanting
    {A, 1458, 1784}, -- Hail to the Chef
    {A, 1458, 1563}, -- Hail to the Chef
    {A, 1458, 3296}, -- Cooking with Style
    {A, 1458, 1799}, -- Chef de Cuisine
    {A, 1458, 1798}, -- Sous Chef
    {A, 1458, 1797}, -- Chef de Partie
    {A, 1458, 1796}, -- Short Order Cook
    {A, 1458, 1795}, -- Lunch Lady
    {A, 1458, 1785}, -- Dinner Impossible
    {A, 1458, 2002}, -- 100 Cooking Awards
    {A, 1458, 2001}, -- 50 Cooking Awards
    {A, 1458, 2000}, -- 25 Cooking Awards
    {A, 1458, 1999}, -- 10 Cooking Awards
    {A, 1458, 1998}, -- Cooking Award
    {C, 1149, 1458},
    {N, 1458,k.GetCategoryInfoTitle(170)}, -- Cooking
    {C, 1149, 1457},
    {N, 1457,k.GetCategoryInfoTitle( 15490)}, -- Blacksmithing
    {C, 1149, 1459},
    {N, 1459,k.GetCategoryInfoTitle(15071)}, -- Archaeology
    {C, 1149, 1456},
    {N, 1456,k.GetCategoryInfoTitle(15489)}, -- Alchemy
    {C, 1431, 1149},
    {N, 1149,k.GetCategoryInfoTitle(169)}, -- Professions
    {A, 1169, 4478}, -- Looking For Multitudes
    {A, 1169, 4477}, -- Looking For Many
    {A, 1169, 4476}, -- Looking For More
    {C, 1431, 1169},
    {N, 1169,k.GetCategoryInfoTitle(168)}, -- Dungeons & Raids
    {A, 1161, 1833}, -- It's Happy Hour Somewhere
    {A, 1161, 1832}, -- Tastes Like Chicken
    {A, 1161, 1244}, -- Well Read
    {A, 1161, 964}, -- Going Down?
    {C, 1431, 1161},
    {N, 1161,k.GetCategoryInfoTitle(97)}, -- Exploration
    {A, 1159, 1182}, -- The Bread Winner
    {A, 1159, 31}, -- A Simple Re-Quest
    {A, 1159, 977}, -- 1000 Daily Quests Completed
    {A, 1159, 976}, -- 500 Daily Quests Completed
    {A, 1159, 975}, -- 200 Daily Quests Completed
    {A, 1159, 974}, -- 50 Daily Quests Completed
    {A, 1159, 973}, -- 5 Daily Quests Completed
    {A, 1159, 978}, -- 3000 Quests Completed
    {A, 1159, 32}, -- 2000 Quests Completed
    {A, 1159, 508}, -- 1500 Quests Completed
    {A, 1159, 507}, -- 1000 Quests Completed
    {A, 1159, 506}, -- 500 Quests Completed
    {A, 1159, 505}, -- 250 Quests Completed
    {A, 1159, 504}, -- 100 Quests Completed
    {A, 1159, 503}, -- 50 Quests Completed
    {C, 1431, 1159},
    {N, 1159,k.GetCategoryInfoTitle(96)}, -- Quests
    {A, 1432, 1187}, -- The Keymaster
    {A, 1432, 2716}, -- Dual Talent Specialization
    {A, 1432, 16}, -- Did Somebody Order a Knuckle Sandwich?
    {A, 1432, 705}, -- Master of Arms
    {A, 1432, 556}, -- Epic
    {A, 1432, 557}, -- Superior
    {A, 1432, 545}, -- Shave and a Haircut
    {A, 1432, 2359}, -- Swift Flight Form
    {A, 1432, 2358}, -- Charger
    {A, 1432, 2357}, -- Dreadsteed of Xoroth
    {A, 1432, 892}, -- The Right Stuff
    {A, 1432, 890}, -- Into the Wild Blue Yonder
    {A, 1432, 889}, -- Fast and Furious
    {A, 1432, 891}, -- Giddy Up!
    {A, 1432, 559}, -- Needy
    {A, 1432, 558}, -- Greedy
    {A, 1432, 1181}, -- Got My Mind On My Money
    {A, 1432, 1180}, -- Got My Mind On My Money
    {A, 1432, 1178}, -- Got My Mind On My Money
    {A, 1432, 1177}, -- Got My Mind On My Money
    {A, 1432, 1176}, -- Got My Mind On My Money
    {A, 1432, 546}, -- Safe Deposit
    {A, 1432, 16433}, -- Soul of Iron (Season of Mastery)
    {A, 1432, 13}, -- Level 80 (Legacy)
    {A, 1432, 12}, -- Level 70 (Legacy)
    {A, 1432, 11}, -- Level 60 (Legacy)
    {A, 1432, 10}, -- Level 50 (Legacy)
    {A, 1432, 9}, -- Level 40
    {A, 1432, 8}, -- Level 30
    {A, 1432, 7}, -- Level 20
    {A, 1432, 6}, -- Level 10
    {C, 1431, 1432},
    {N, 1432,k.GetCategoryInfoTitle(92)}, -- Character
    {C, 1160, 953},
    {N, 953,(select(2, k.GetAchievementInfo(14222)))}, -- Exile's Reach
    {C, 1431, 1160},
    {N, 1160,k.L["Zones"]}, -- Zones
    {C, 883, 1431},
    {N, 1431,k.L["Cross-Expansion"]}, -- Cross-Expansion
    function() categories[1399].IsSearchResults = true; end,
    {F, 1399, "SearchResultsCategories"},
    {C, 883, 1399},
    {N, 1399,k.L["Search Results"]}, -- Search Results
    function() categories[1223].IsSelectedZone = true; end,
    {F, 1223, "SelectedZoneCategories"},
    {C, 883, 1223},
    {N, 1223,k.L["Selected Zone"]}, -- Selected Zone
    function() categories[1213].IsCurrentZone = true; end,
    {F, 1213, "CurrentZoneCategories"},
    {C, 883, 1213},
    {N, 1213,k.L["Current Zone"]}, -- Current Zone
    function() categories[1217].IsWatchList = true; end,
    {F, 1217, "WatchListCategories"},
    {C, 883, 1217},
    {N, 1217,k.L["Watch List"]}, -- Watch List
    {S, 1203},
    {V, 1203},
    {C, 883, 1203},
    {N, 1203,k.L["Summary"]}, -- Summary
    {T, 883, "Expansions"},
    {N, 883,k.L["Expansions"]}, -- TAB - Expansions
    {F, 1224, "ExcludedCategories"},
    {C, 1100, 1224},
    {N, 1224,k.L["Excluded"]}, -- Excluded
    function() categories[1371].IsTracking = true; end,
    {F, 1371, "TrackingAchievementsCategories"},
    {C, 1100, 1371},
    {N, 1371,k.L["Tracking Achievements"]}, -- Tracking Achievements
    function() categories[1395].IsSearchResults = true; end,
    {F, 1395, "SearchResultsCategories"},
    {C, 1100, 1395},
    {N, 1395,k.L["Search Results"]}, -- Search Results
    function() categories[1220].IsSelectedZone = true; end,
    {F, 1220, "SelectedZoneCategories"},
    {C, 1100, 1220},
    {N, 1220,k.L["Selected Zone"]}, -- Selected Zone
    function() categories[1212].IsCurrentZone = true; end,
    {F, 1212, "CurrentZoneCategories"},
    {C, 1100, 1212},
    {N, 1212,k.L["Current Zone"]}, -- Current Zone
    function() categories[1216].IsWatchList = true; end,
    {F, 1216, "WatchListCategories"},
    {C, 1100, 1216},
    {N, 1216,k.L["Watch List"]}, -- Watch List
    {S, 1202},
    {V, 1202},
    {C, 1100, 1202},
    {N, 1202,k.L["Summary"]}, -- Summary
    {T, 1100, "Achievements"},
    {N, 1100,k.L["Achievements"]}, -- TAB - Achievements
};

function exportedCategories.InjectDynamicOptions()
    local o = k.Options.Layout.InjectDynamicAdjustableCategoryOptions;

    o("WatchList", k.L["Watch List"], 1, "Achievements", k.L["Achievements"], false);
    o("WatchList", k.L["Watch List"], 2, "Expansions", k.L["Expansions"], false);
    o("WatchList", k.L["Watch List"], 3, "Events", k.L["Events"], false);
    o("WatchList", k.L["Watch List"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("WatchList", k.L["Watch List"], 5, "Specials", k.L["Specials"], true);

    o("CurrentZone", k.L["Current Zone"], 1, "Achievements", k.L["Achievements"], false);
    o("CurrentZone", k.L["Current Zone"], 2, "Expansions", k.L["Expansions"], false);
    o("CurrentZone", k.L["Current Zone"], 3, "Events", k.L["Events"], false);
    o("CurrentZone", k.L["Current Zone"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("CurrentZone", k.L["Current Zone"], 5, "Specials", k.L["Specials"], true);

    o("SelectedZone", k.L["Selected Zone"], 1, "Achievements", k.L["Achievements"], false);
    o("SelectedZone", k.L["Selected Zone"], 2, "Expansions", k.L["Expansions"], false);
    o("SelectedZone", k.L["Selected Zone"], 3, "Events", k.L["Events"], false);
    o("SelectedZone", k.L["Selected Zone"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("SelectedZone", k.L["Selected Zone"], 5, "Specials", k.L["Specials"], true);

    o("SearchResults", k.L["Search Results"], 1, "Achievements", k.L["Achievements"], false);
    o("SearchResults", k.L["Search Results"], 2, "Expansions", k.L["Expansions"], false);
    o("SearchResults", k.L["Search Results"], 3, "Events", k.L["Events"], false);
    o("SearchResults", k.L["Search Results"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("SearchResults", k.L["Search Results"], 5, "Specials", k.L["Specials"], true);

    o("TrackingAchievements", k.L["Tracking Achievements"], 1, "Achievements", k.L["Achievements"], false);
    o("TrackingAchievements", k.L["Tracking Achievements"], 2, "Expansions", k.L["Expansions"], false);
    o("TrackingAchievements", k.L["Tracking Achievements"], 3, "Events", k.L["Events"], false);
    o("TrackingAchievements", k.L["Tracking Achievements"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("TrackingAchievements", k.L["Tracking Achievements"], 5, "Specials", k.L["Specials"], true);

    o("Excluded", k.L["Excluded"], 1, "Achievements", k.L["Achievements"], false);
    o("Excluded", k.L["Excluded"], 2, "Expansions", k.L["Expansions"], false);
    o("Excluded", k.L["Excluded"], 3, "Events", k.L["Events"], false);
    o("Excluded", k.L["Excluded"], 4, "PvP", k.GetCategoryInfoTitle(95), false);
    o("Excluded", k.L["Excluded"], 5, "Specials", k.L["Specials"], true);
end