-- [[ Exported at 2023-05-02 19-58-31 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, k = ...;
local objects = k.Objects;
local c = objects.Category;
local data = k.Data;
data.ExportedCategories = {};
local exportedCategories = data.ExportedCategories;

local function C(c1, c2)
    c1:AddCategory(c2)
end

local function A(c1, a)
    c1:AddAchievement(a)
end

function exportedCategories.Load(a)
    local t = {};
    local watchListCategories = {};
    local currentZoneCategories = {};
    local selectedZoneCategories = {};
    local searchResultsCategories = {};
    local trackingAchievementsCategories = {};
    local excludedCategories = {};
    t[1100] = c:New(k.L["Achievements"]); -- TAB - Achievements
    t[1100].TabName = "Achievements";
    local achievements = t[1100];
    t[1202] = c:New(k.L["Summary"]); -- Summary
    C(t[1100], t[1202]);
    t[1202].AlwaysVisible = true;
    t[1202].IsSummary = true;
    t[1216] = c:New(k.L["Watch List"]); -- Watch List
    C(t[1100], t[1216]);
    t[1216].HasFlexibleData = true;
    tinsert(watchListCategories, t[1216]);
    t[1216].IsWatchList = true;
    t[1212] = c:New(k.L["Current Zone"]); -- Current Zone
    C(t[1100], t[1212]);
    t[1212].HasFlexibleData = true;
    tinsert(currentZoneCategories, t[1212]);
    t[1212].IsCurrentZone = true;
    t[1220] = c:New(k.L["Selected Zone"]); -- Selected Zone
    C(t[1100], t[1220]);
    t[1220].HasFlexibleData = true;
    tinsert(selectedZoneCategories, t[1220]);
    t[1220].IsSelectedZone = true;
    t[1395] = c:New(k.L["Search Results"]); -- Search Results
    C(t[1100], t[1395]);
    t[1395].HasFlexibleData = true;
    tinsert(searchResultsCategories, t[1395]);
    t[1395].IsSearchResults = true;
    t[1371] = c:New(k.L["Tracking Achievements"]); -- Tracking Achievements
    C(t[1100], t[1371]);
    t[1371].HasFlexibleData = true;
    tinsert(trackingAchievementsCategories, t[1371]);
    t[1371].IsTracking = true;
    t[1224] = c:New(k.L["Excluded"]); -- Excluded
    C(t[1100], t[1224]);
    t[1224].HasFlexibleData = true;
    tinsert(excludedCategories, t[1224]);
    t[883] = c:New(k.L["Expansions"]); -- TAB - Expansions
    t[883].TabName = "Expansions";
    local expansions = t[883];
    t[1203] = c:New(k.L["Summary"]); -- Summary
    C(t[883], t[1203]);
    t[1203].AlwaysVisible = true;
    t[1203].IsSummary = true;
    t[1217] = c:New(k.L["Watch List"]); -- Watch List
    C(t[883], t[1217]);
    t[1217].HasFlexibleData = true;
    tinsert(watchListCategories, t[1217]);
    t[1217].IsWatchList = true;
    t[1213] = c:New(k.L["Current Zone"]); -- Current Zone
    C(t[883], t[1213]);
    t[1213].HasFlexibleData = true;
    tinsert(currentZoneCategories, t[1213]);
    t[1213].IsCurrentZone = true;
    t[1223] = c:New(k.L["Selected Zone"]); -- Selected Zone
    C(t[883], t[1223]);
    t[1223].HasFlexibleData = true;
    tinsert(selectedZoneCategories, t[1223]);
    t[1223].IsSelectedZone = true;
    t[1399] = c:New(k.L["Search Results"]); -- Search Results
    C(t[883], t[1399]);
    t[1399].HasFlexibleData = true;
    tinsert(searchResultsCategories, t[1399]);
    t[1399].IsSearchResults = true;
    t[1] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[883], t[1]);
    t[648] = c:New(k.L["Zones"]); -- Zones
    C(t[1], t[648]);
    A(t[648], a[1206]); -- To All The Squirrels I've Loved Before
    A(t[648], a[944]); -- They Love Me In That Tunnel
    A(t[648], a[942]); -- The Diplomat
    A(t[648], a[943]); -- The Diplomat
    t[687] = c:New(k.GetMapName(1415)); -- Eastern Kingdoms
    C(t[648], t[687]);
    A(t[687], a[1676]); -- Loremaster of Eastern Kingdoms
    A(t[687], a[1677]); -- Loremaster of Eastern Kingdoms
    A(t[687], a[42]); -- Eastern Kingdoms Explorer
    A(t[687], a[1681]); -- The Loremaster
    A(t[687], a[1682]); -- The Loremaster
    t[922] = c:New(k.GetMapName(1453)); -- Stormwind City
    C(t[687], t[922]);
    A(t[922], a[615]); -- Storming Stormwind
    A(t[922], a[388]); -- City Defender
    A(t[922], a[603]); -- Wrath of the Horde
    t[1033] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[922], t[1033]);
    t[1022] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[922], t[1022]);
    A(t[1022], a[948]); -- Ambassador of the Alliance
    t[970] = c:New(k.GetMapName(1455)); -- Ironforge
    C(t[687], t[970]);
    A(t[970], a[616]); -- Overthrow the Council
    A(t[970], a[619]); -- For the Horde!
    A(t[970], a[603]); -- Wrath of the Horde
    t[974] = c:New(k.GetMapName(1458)); -- Undercity
    C(t[687], t[974]);
    A(t[974], a[612]); -- Downing the Dark Lady
    A(t[974], a[604]); -- Wrath of the Alliance
    t[721] = c:New(k.GetMapName(1426)); -- Dun Morogh
    C(t[687], t[721]);
    A(t[721], a[4786]); -- Operation: Gnomeregan
    t[723] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[721], t[723]);
    A(t[723], a[627]); -- Explore Dun Morogh
    t[1005] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[721], t[1005]);
    A(t[1005], a[948]); -- Ambassador of the Alliance
    t[722] = c:New(k.GetMapName(1429)); -- Elwynn Forest
    C(t[687], t[722]);
    t[724] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[722], t[724]);
    A(t[724], a[776]); -- Explore Elwynn Forest
    t[1006] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[722], t[1006]);
    A(t[1006], a[948]); -- Ambassador of the Alliance
    t[725] = c:New(k.GetMapName(1420)); -- Tirisfal Glades
    C(t[687], t[725]);
    t[1201] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[725], t[1201]);
    t[726] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[725], t[726]);
    A(t[726], a[768]); -- Explore Tirisfal Glades
    t[1026] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[725], t[1026]);
    A(t[1026], a[762]); -- Ambassador of the Horde
    t[651] = c:New(k.GetMapName(1436)); -- Westfall
    C(t[687], t[651]);
    t[653] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[651], t[653]);
    t[730] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[651], t[730]);
    A(t[730], a[802]); -- Explore Westfall
    t[1028] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[651], t[1028]);
    A(t[1028], a[948]); -- Ambassador of the Alliance
    t[655] = c:New(k.GetMapName(1432)); -- Loch Modan
    C(t[687], t[655]);
    t[657] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[655], t[657]);
    t[729] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[655], t[729]);
    A(t[729], a[779]); -- Explore Loch Modan
    t[1013] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[655], t[1013]);
    A(t[1013], a[948]); -- Ambassador of the Alliance
    t[681] = c:New(k.GetMapName(1421)); -- Silverpine Forest
    C(t[687], t[681]);
    t[682] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[681], t[682]);
    t[732] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[681], t[732]);
    A(t[732], a[769]); -- Explore Silverpine Forest
    t[1020] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[681], t[1020]);
    A(t[1020], a[762]); -- Ambassador of the Horde
    t[678] = c:New(k.GetMapName(1433)); -- Redridge Mountains
    C(t[687], t[678]);
    t[677] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[678], t[677]);
    t[734] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[678], t[734]);
    A(t[734], a[780]); -- Explore Redridge Mountains
    t[1017] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[678], t[1017]);
    A(t[1017], a[948]); -- Ambassador of the Alliance
    t[652] = c:New(k.GetMapName(1431)); -- Duskwood
    C(t[687], t[652]);
    t[654] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[652], t[654]);
    t[735] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[652], t[735]);
    A(t[735], a[778]); -- Explore Duskwood
    t[1007] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[652], t[1007]);
    A(t[1007], a[948]); -- Ambassador of the Alliance
    t[656] = c:New(k.GetMapName(1437)); -- Wetlands
    C(t[687], t[656]);
    t[658] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[656], t[658]);
    t[731] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[656], t[731]);
    A(t[731], a[841]); -- Explore Wetlands
    t[1029] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[656], t[1029]);
    A(t[1029], a[948]); -- Ambassador of the Alliance
    t[671] = c:New(k.GetMapName(1424)); -- Hillsbrad Foothills
    C(t[687], t[671]);
    t[672] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[671], t[672]);
    t[736] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[671], t[736]);
    A(t[736], a[772]); -- Explore Hillsbrad Foothills
    t[1012] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[671], t[1012]);
    A(t[1012], a[762]); -- Ambassador of the Horde
    A(t[1012], a[2336]); -- Insane in the Membrane
    t[1383] = c:New(k.GetMapName(1416)); -- Alterac Mountains
    C(t[687], t[1383]);
    t[1384] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1383], t[1384]);
    A(t[1384], a[760]); -- Explore Alterac Mountains
    t[649] = c:New(k.GetMapName(1417)); -- Arathi Highlands
    C(t[687], t[649]);
    t[650] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[649], t[650]);
    t[741] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[649], t[741]);
    A(t[741], a[761]); -- Explore Arathi Highlands
    t[996] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[649], t[996]);
    A(t[996], a[948]); -- Ambassador of the Alliance
    A(t[996], a[762]); -- Ambassador of the Horde
    t[1385] = c:New(k.GetMapName(1434)); -- Stranglethorn Vale
    C(t[687], t[1385]);
    t[1386] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1385], t[1386]);
    A(t[1386], a[940]); -- The Green Hills of Stranglethorn
    A(t[1386], a[941]); -- Hemet Nesingwary: The Collected Quests
    t[1387] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1385], t[1387]);
    A(t[1387], a[781]); -- Explore Northern Stranglethorn
    t[1388] = c:New(k.GetCategoryInfoTitle(95), true); -- Player vs. Player
    C(t[1385], t[1388]);
    A(t[1388], a[389]); -- Gurubashi Arena Master
    A(t[1388], a[396]); -- Gurubashi Arena Grand Master
    t[1389] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1385], t[1389]);
    A(t[1389], a[948]); -- Ambassador of the Alliance
    A(t[1389], a[762]); -- Ambassador of the Horde
    A(t[1389], a[871]); -- "Avast Ye, Admiral!"
    A(t[1389], a[2336]); -- Insane in the Membrane
    t[685] = c:New(k.GetMapName(1422)); -- Western Plaguelands
    C(t[687], t[685]);
    t[686] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[685], t[686]);
    t[746] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[685], t[746]);
    A(t[746], a[770]); -- Explore Western Plaguelands
    t[1027] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[685], t[1027]);
    A(t[1027], a[948]); -- Ambassador of the Alliance
    A(t[1027], a[762]); -- Ambassador of the Horde
    t[673] = c:New(k.GetMapName(1425)); -- The Hinterlands
    C(t[687], t[673]);
    t[674] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[673], t[674]);
    t[742] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[673], t[742]);
    A(t[742], a[773]); -- Explore The Hinterlands
    t[1024] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[673], t[1024]);
    A(t[1024], a[762]); -- Ambassador of the Horde
    t[667] = c:New(k.GetMapName(1423)); -- Eastern Plaguelands
    C(t[687], t[667]);
    t[668] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[667], t[668]);
    t[747] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[667], t[747]);
    A(t[747], a[771]); -- Explore Eastern Plaguelands
    t[778] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[667], t[778]);
    A(t[778], a[946]); -- The Argent Dawn
    A(t[778], a[945]); -- The Argent Champion
    t[659] = c:New(k.GetMapName(1418)); -- Badlands
    C(t[687], t[659]);
    t[661] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[659], t[661]);
    t[738] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[659], t[738]);
    A(t[738], a[765]); -- Explore Badlands
    t[679] = c:New(k.GetMapName(1427)); -- Searing Gorge
    C(t[687], t[679]);
    t[680] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[679], t[680]);
    t[743] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[679], t[743]);
    A(t[743], a[774]); -- Explore Searing Gorge
    t[683] = c:New(k.GetMapName(1435)); -- Swamp of Sorrows
    C(t[687], t[683]);
    t[684] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[683], t[684]);
    t[737] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[683], t[737]);
    A(t[737], a[782]); -- Explore Swamp of Sorrows
    t[1023] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[683], t[1023]);
    A(t[1023], a[948]); -- Ambassador of the Alliance
    t[663] = c:New(k.GetMapName(1428)); -- Burning Steppes
    C(t[687], t[663]);
    t[664] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[663], t[664]);
    t[745] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[663], t[745]);
    A(t[745], a[775]); -- Explore Burning Steppes
    t[660] = c:New(k.GetMapName(1419)); -- Blasted Lands
    C(t[687], t[660]);
    t[662] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[660], t[662]);
    t[744] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[660], t[744]);
    A(t[744], a[766]); -- Explore Blasted Lands
    t[999] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[660], t[999]);
    A(t[999], a[948]); -- Ambassador of the Alliance
    A(t[999], a[762]); -- Ambassador of the Horde
    t[748] = c:New(k.GetMapName(1430)); -- Deadwind Pass
    C(t[687], t[748]);
    t[749] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[748], t[749]);
    A(t[749], a[777]); -- Explore Deadwind Pass
    t[688] = c:New(k.GetMapName(1414)); -- Kalimdor
    C(t[648], t[688]);
    A(t[688], a[1678]); -- Loremaster of Kalimdor
    A(t[688], a[1680]); -- Loremaster of Kalimdor
    A(t[688], a[43]); -- Kalimdor Explorer
    A(t[688], a[1681]); -- The Loremaster
    A(t[688], a[1682]); -- The Loremaster
    t[975] = c:New(k.GetMapName(1457)); -- Darnassus
    C(t[688], t[975]);
    A(t[975], a[617]); -- Immortal No More
    A(t[975], a[603]); -- Wrath of the Horde
    t[921] = c:New(k.GetMapName(1454)); -- Orgrimmar
    C(t[688], t[921]);
    A(t[921], a[610]); -- Orgrimmar Offensive
    A(t[921], a[614]); -- For the Alliance!
    A(t[921], a[1006]); -- City Defender
    A(t[921], a[604]); -- Wrath of the Alliance
    t[1018] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[921], t[1018]);
    A(t[1018], a[762]); -- Ambassador of the Horde
    t[923] = c:New(k.GetMapName(1456)); -- Thunder Bluff
    C(t[688], t[923]);
    A(t[923], a[611]); -- Bleeding Bloodhoof
    A(t[923], a[604]); -- Wrath of the Alliance
    t[756] = c:New(k.GetMapName(1438)); -- Teldrassil
    C(t[688], t[756]);
    t[757] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[756], t[757]);
    A(t[757], a[842]); -- Explore Teldrassil
    t[1025] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[756], t[1025]);
    A(t[1025], a[948]); -- Ambassador of the Alliance
    t[752] = c:New(k.GetMapName(1411)); -- Durotar
    C(t[688], t[752]);
    A(t[752], a[4790]); -- Zalazane's Fall
    t[753] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[752], t[753]);
    A(t[753], a[728]); -- Explore Durotar
    t[1003] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[752], t[1003]);
    A(t[1003], a[762]); -- Ambassador of the Horde
    t[754] = c:New(k.GetMapName(1412)); -- Mulgore
    C(t[688], t[754]);
    t[755] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[754], t[755]);
    A(t[755], a[736]); -- Explore Mulgore
    t[1014] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[754], t[1014]);
    A(t[1014], a[762]); -- Ambassador of the Horde
    t[774] = c:New(k.GetMapName(1450)); -- Moonglade
    C(t[688], t[774]);
    t[775] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[774], t[775]);
    A(t[775], a[855]); -- Explore Moonglade
    t[1379] = c:New(k.GetMapName(1413)); -- The Barrens
    C(t[688], t[1379]);
    t[1381] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1379], t[1381]);
    A(t[1381], a[750]); -- Explore Northern Barrens
    t[1382] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1379], t[1382]);
    A(t[1382], a[762]); -- Ambassador of the Horde
    A(t[1382], a[2336]); -- Insane in the Membrane
    t[695] = c:New(k.GetMapName(1439)); -- Darkshore
    C(t[688], t[695]);
    t[696] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[695], t[696]);
    t[762] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[695], t[762]);
    A(t[762], a[844]); -- Explore Darkshore
    t[1001] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[695], t[1001]);
    A(t[1001], a[948]); -- Ambassador of the Alliance
    t[691] = c:New(k.GetMapName(1447)); -- Azshara
    C(t[688], t[691]);
    t[692] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[691], t[692]);
    t[771] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[691], t[771]);
    A(t[771], a[852]); -- Explore Azshara
    t[990] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[691], t[990]);
    A(t[990], a[762]); -- Ambassador of the Horde
    t[689] = c:New(k.GetMapName(1440)); -- Ashenvale
    C(t[688], t[689]);
    t[690] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[689], t[690]);
    t[764] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[689], t[764]);
    A(t[764], a[845]); -- Explore Ashenvale
    t[997] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[689], t[997]);
    A(t[997], a[948]); -- Ambassador of the Alliance
    t[709] = c:New(k.GetMapName(1442)); -- Stonetalon Mountains
    C(t[688], t[709]);
    t[710] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[709], t[710]);
    t[766] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[709], t[766]);
    A(t[766], a[847]); -- Explore Stonetalon Mountains
    t[1021] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[709], t[1021]);
    A(t[1021], a[948]); -- Ambassador of the Alliance
    A(t[1021], a[762]); -- Ambassador of the Horde
    t[697] = c:New(k.GetMapName(1443)); -- Desolace
    C(t[688], t[697]);
    t[698] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[697], t[698]);
    t[767] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[697], t[767]);
    A(t[767], a[848]); -- Explore Desolace
    t[1002] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[697], t[1002]);
    A(t[1002], a[762]); -- Ambassador of the Horde
    t[703] = c:New(k.GetMapName(1444)); -- Feralas
    C(t[688], t[703]);
    t[704] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[703], t[704]);
    t[769] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[703], t[769]);
    A(t[769], a[849]); -- Explore Feralas
    t[1009] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[703], t[1009]);
    A(t[1009], a[948]); -- Ambassador of the Alliance
    A(t[1009], a[762]); -- Ambassador of the Horde
    t[699] = c:New(k.GetMapName(1445)); -- Dustwallow Marsh
    C(t[688], t[699]);
    t[700] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[699], t[700]);
    t[768] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[699], t[768]);
    A(t[768], a[850]); -- Explore Dustwallow Marsh
    t[1004] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[699], t[1004]);
    A(t[1004], a[948]); -- Ambassador of the Alliance
    t[715] = c:New(k.GetMapName(1441)); -- Thousand Needles
    C(t[688], t[715]);
    t[716] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[715], t[716]);
    t[765] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[715], t[765]);
    A(t[765], a[846]); -- Explore Thousand Needles
    t[994] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[715], t[994]);
    A(t[994], a[948]); -- Ambassador of the Alliance
    A(t[994], a[762]); -- Ambassador of the Horde
    t[713] = c:New(k.GetMapName(1446)); -- Tanaris
    C(t[688], t[713]);
    t[714] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[713], t[714]);
    t[770] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[713], t[770]);
    A(t[770], a[851]); -- Explore Tanaris
    t[992] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[713], t[992]);
    A(t[992], a[948]); -- Ambassador of the Alliance
    A(t[992], a[762]); -- Ambassador of the Horde
    A(t[992], a[2336]); -- Insane in the Membrane
    t[701] = c:New(k.GetMapName(1448)); -- Felwood
    C(t[688], t[701]);
    t[702] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[701], t[702]);
    t[772] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[701], t[772]);
    A(t[772], a[853]); -- Explore Felwood
    t[991] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[701], t[991]);
    A(t[991], a[948]); -- Ambassador of the Alliance
    A(t[991], a[762]); -- Ambassador of the Horde
    t[717] = c:New(k.GetMapName(1449)); -- Un'Goro Crater
    C(t[688], t[717]);
    A(t[717], a[3357]); -- Venomhide Ravasaur
    t[718] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[717], t[718]);
    t[773] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[717], t[773]);
    A(t[773], a[854]); -- Explore Un'Goro Crater
    t[707] = c:New(k.GetMapName(1451)); -- Silithus
    C(t[688], t[707]);
    A(t[707], a[416]); -- Scarab Lord
    t[708] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[707], t[708]);
    t[776] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[707], t[776]);
    A(t[776], a[856]); -- Explore Silithus
    t[783] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[707], t[783]);
    A(t[783], a[953]); -- Guardian of Cenarius
    t[719] = c:New(k.GetMapName(1452)); -- Winterspring
    C(t[688], t[719]);
    A(t[719], a[3356]); -- Winterspring Frostsaber
    t[720] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[719], t[720]);
    t[777] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[719], t[777]);
    A(t[777], a[857]); -- Explore Winterspring
    t[1031] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[719], t[1031]);
    A(t[1031], a[2336]); -- Insane in the Membrane
    t[2] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[1], t[2]);
    A(t[2], a[1283]); -- Classic Dungeonmaster
    t[4] = c:New(k.GetInstanceInfoName(63)); -- Deadmines
    C(t[2], t[4]);
    A(t[4], a[628]); -- Deadmines
    t[5] = c:New(k.GetInstanceInfoName(226)); -- Ragefire Chasm
    C(t[2], t[5]);
    A(t[5], a[629]); -- Ragefire Chasm
    t[8] = c:New(k.GetInstanceInfoName(240)); -- Wailing Caverns
    C(t[2], t[8]);
    A(t[8], a[630]); -- Wailing Caverns
    t[9] = c:New(k.GetInstanceInfoName(64)); -- Shadowfang Keep
    C(t[2], t[9]);
    A(t[9], a[631]); -- Shadowfang Keep
    A(t[9], a[4627]); -- X-45 Heartbreaker
    t[10] = c:New(k.GetInstanceInfoName(227)); -- Blackfathom Deeps
    C(t[2], t[10]);
    A(t[10], a[632]); -- Blackfathom Deeps
    t[11] = c:New(k.GetInstanceInfoName(238)); -- The Stockade
    C(t[2], t[11]);
    A(t[11], a[633]); -- Stormwind Stockade
    t[12] = c:New(k.GetInstanceInfoName(231)); -- Gnomeregan
    C(t[2], t[12]);
    A(t[12], a[634]); -- Gnomeregan
    t[13] = c:New(k.GetInstanceInfoName(233)); -- Razorfen Kraul
    C(t[2], t[13]);
    A(t[13], a[635]); -- Razorfen Kraul
    t[14] = c:New(k.GetInstanceInfoName(234)); -- Razorfen Downs
    C(t[2], t[14]);
    A(t[14], a[636]); -- Razorfen Downs
    t[15] = c:New(k.GetInstanceInfoName(311)); -- Scarlet Halls
    C(t[2], t[15]);
    t[16] = c:New(k.GetInstanceInfoName(316)); -- Scarlet Monastery
    C(t[2], t[16]);
    A(t[16], a[637]); -- Scarlet Monastery
    A(t[16], a[980]); -- The Horseman's Reins
    t[17] = c:New(k.GetInstanceInfoName(239)); -- Uldaman
    C(t[2], t[17]);
    A(t[17], a[638]); -- Uldaman
    t[18] = c:New(k.GetInstanceInfoName(241)); -- Zul'Farrak
    C(t[2], t[18]);
    A(t[18], a[639]); -- Zul'Farrak
    t[19] = c:New(k.GetInstanceInfoName(232)); -- Maraudon
    C(t[2], t[19]);
    A(t[19], a[640]); -- Maraudon
    t[20] = c:New(k.GetInstanceInfoName(237)); -- The Temple Of Atal'hakkar
    C(t[2], t[20]);
    A(t[20], a[641]); -- Sunken Temple
    t[21] = c:New(k.GetInstanceInfoName(228)); -- Blackrock Depths
    C(t[2], t[21]);
    A(t[21], a[642]); -- Blackrock Depths
    A(t[21], a[3496]); -- A Brew-FAST Mount
    t[22] = c:New(k.GetInstanceInfoName(229)); -- Lower Blackrock Spire
    C(t[2], t[22]);
    A(t[22], a[643]); -- Lower Blackrock Spire
    t[797] = c:New(k.GetInstanceInfoName(559)); -- Upper Blackrock Spire
    C(t[2], t[797]);
    A(t[797], a[1307]); -- Upper Blackrock Spire (Classic)
    A(t[797], a[2188]); -- Leeeeeeeeeeeeeroy!
    t[23] = c:New(k.GetInstanceInfoName(230)); -- Dire Maul
    C(t[2], t[23]);
    A(t[23], a[644]); -- King of Dire Maul
    t[24] = c:New(k.GetInstanceInfoName(246)); -- Scholomance
    C(t[2], t[24]);
    A(t[24], a[645]); -- Scholomance
    t[25] = c:New(k.GetInstanceInfoName(236)); -- Stratholme
    C(t[2], t[25]);
    A(t[25], a[646]); -- Stratholme
    A(t[25], a[729]); -- Deathcharger's Reins
    t[3] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1], t[3]);
    A(t[3], a[1285]); -- Classic Raider
    t[7] = c:New(k.GetInstanceInfoName(741)); -- Molten Core
    C(t[3], t[7]);
    A(t[7], a[686]); -- Molten Core
    A(t[7], a[429]); -- "Sulfuras, Hand of Ragnaros"
    A(t[7], a[428]); -- "Thunderfury, Blessed Blade of the Windseeker"
    A(t[7], a[15330]); -- Survivor of the Firelord (Season of Mastery)
    t[779] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[7], t[779]);
    A(t[779], a[955]); -- Hydraxian Waterlords
    A(t[779], a[2496]); -- The Fifth Element
    t[26] = c:New(k.GetInstanceInfoName(760) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Onyxia's Lair
    C(t[3], t[26]);
    A(t[26], a[684]); -- Onyxia's Lair (Level 60)
    t[27] = c:New(k.GetInstanceInfoName(742)); -- Blackwing Lair
    C(t[3], t[27]);
    A(t[27], a[685]); -- Blackwing Lair
    A(t[27], a[15333]); -- Survivor of the Shadow Flame (Season of Mastery)
    t[28] = c:New(k.GetInstanceInfoName(76)); -- Zul'Gurub
    C(t[3], t[28]);
    A(t[28], a[560]); -- Deadliest Catch
    A(t[28], a[688]); -- Zul'Gurub
    A(t[28], a[880]); -- Swift Zulian Tiger
    A(t[28], a[881]); -- Swift Razzashi Raptor
    t[789] = c:New(k.GetCategoryInfoTitle(201)); -- Reputation
    C(t[28], t[789]);
    A(t[789], a[957]); -- Hero of the Zandalar Tribe
    t[29] = c:New(k.GetInstanceInfoName(743)); -- Ruins of Ahn'Qiraj
    C(t[3], t[29]);
    A(t[29], a[689]); -- Ruins of Ahn'Qiraj
    t[784] = c:New(k.GetCategoryInfoTitle(201)); -- Reputation
    C(t[29], t[784]);
    A(t[784], a[953]); -- Guardian of Cenarius
    t[30] = c:New(k.GetInstanceInfoName(744)); -- Temple of Ahn'Qiraj
    C(t[3], t[30]);
    A(t[30], a[687]); -- Temple of Ahn'Qiraj
    A(t[30], a[424]); -- Why? Because It's Red
    A(t[30], a[15334]); -- Survivor of the Old God (Season of Mastery)
    t[780] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[30], t[780]);
    A(t[780], a[956]); -- Brood of Nozdormu
    t[796] = c:New(k.GetInstanceInfoName(754) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Naxxramas
    C(t[3], t[796]);
    A(t[796], a[425]); -- "Atiesh, Greatstaff of the Guardian"
    A(t[796], a[15335]); -- Survivor of the Damned (Season of Mastery)
    A(t[796], a[15637]); -- The Immortal (Season of Mastery)
    t[785] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[1], t[785]);
    t[55] = c:New(k.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    C(t[883], t[55]);
    t[616] = c:New(k.L["Zones"]); -- Zones
    C(t[55], t[616]);
    A(t[616], a[1262]); -- Loremaster of Outland
    A(t[616], a[1274]); -- Loremaster of Outland
    A(t[616], a[1311]); -- Medium Rare
    A(t[616], a[1312]); -- Bloody Rare
    A(t[616], a[44]); -- Outland Explorer
    A(t[616], a[763]); -- The Burning Crusader
    A(t[616], a[764]); -- The Burning Crusader
    A(t[616], a[894]); -- Flying High Over Skettis
    A(t[616], a[897]); -- You're So Offensive
    A(t[616], a[902]); -- Chief Exalted Officer
    A(t[616], a[1681]); -- The Loremaster
    A(t[616], a[1682]); -- The Loremaster
    t[794] = c:New(k.GetMapName(1955)); -- Shattrath City
    C(t[616], t[794]);
    A(t[794], a[1165]); -- "My Storage is ""Gigantique"""
    t[924] = c:New(k.GetMapName(1954)); -- Silvermoon City
    C(t[616], t[924]);
    A(t[924], a[613]); -- Killed in Quel'Thalas
    A(t[924], a[614]); -- For the Alliance!
    A(t[924], a[604]); -- Wrath of the Alliance
    t[969] = c:New(k.GetMapName(1947)); -- The Exodar
    C(t[616], t[969]);
    A(t[969], a[618]); -- Putting Out the Light
    A(t[969], a[619]); -- For the Horde!
    A(t[969], a[603]); -- Wrath of the Horde
    t[758] = c:New(k.GetMapName(1943)); -- Azuremyst Isle
    C(t[616], t[758]);
    t[759] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[758], t[759]);
    A(t[759], a[860]); -- Explore Azuremyst Isle
    t[998] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[758], t[998]);
    A(t[998], a[948]); -- Ambassador of the Alliance
    t[693] = c:New(k.GetMapName(1950)); -- Bloodmyst Isle
    C(t[616], t[693]);
    t[694] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[693], t[694]);
    t[763] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[693], t[763]);
    A(t[763], a[861]); -- Explore Bloodmyst Isle
    t[1000] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[693], t[1000]);
    A(t[1000], a[948]); -- Ambassador of the Alliance
    t[727] = c:New(k.GetMapName(1941)); -- Eversong Woods
    C(t[616], t[727]);
    t[728] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[727], t[728]);
    A(t[728], a[859]); -- Explore Eversong Woods
    t[1008] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[727], t[1008]);
    A(t[1008], a[762]); -- Ambassador of the Horde
    t[669] = c:New(k.GetMapName(1942)); -- Ghostlands
    C(t[616], t[669]);
    t[670] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[669], t[670]);
    t[733] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[669], t[733]);
    A(t[733], a[858]); -- Explore Ghostlands
    t[1010] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[669], t[1010]);
    A(t[1010], a[762]); -- Ambassador of the Horde
    t[617] = c:New(k.GetMapName(1944)); -- Hellfire Peninsula
    C(t[616], t[617]);
    t[624] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[617], t[624]);
    A(t[624], a[1189]); -- To Hellfire and Back
    A(t[624], a[1271]); -- To Hellfire and Back
    t[631] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[617], t[631]);
    A(t[631], a[862]); -- Explore Hellfire Peninsula
    t[1011] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[617], t[1011]);
    A(t[1011], a[948]); -- Ambassador of the Alliance
    A(t[1011], a[762]); -- Ambassador of the Horde
    t[618] = c:New(k.GetMapName(1946)); -- Zangarmarsh
    C(t[616], t[618]);
    t[625] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[618], t[625]);
    A(t[625], a[1190]); -- Mysteries of the Marsh
    t[632] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[618], t[632]);
    A(t[632], a[863]); -- Explore Zangarmarsh
    t[643] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[618], t[643]);
    A(t[643], a[948]); -- Ambassador of the Alliance
    A(t[643], a[762]); -- Ambassador of the Horde
    A(t[643], a[893]); -- Cenarion War Hippogryph
    A(t[643], a[953]); -- Guardian of Cenarius
    A(t[643], a[900]); -- The Czar of Sporeggar
    A(t[643], a[942]); -- The Diplomat
    A(t[643], a[943]); -- The Diplomat
    t[619] = c:New(k.GetMapName(1952)); -- Terokkar Forest
    C(t[616], t[619]);
    t[626] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[619], t[626]);
    A(t[626], a[1191]); -- Terror of Terokkar
    A(t[626], a[1272]); -- Terror of Terokkar
    A(t[626], a[1275]); -- Bombs Away
    t[633] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[619], t[633]);
    A(t[633], a[867]); -- Explore Terokkar Forest
    t[642] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[619], t[642]);
    A(t[642], a[903]); -- Shattrath Divided
    A(t[642], a[1205]); -- Hero of Shattrath
    t[620] = c:New(k.GetMapName(1951)); -- Nagrand
    C(t[616], t[620]);
    t[627] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[620], t[627]);
    A(t[627], a[1192]); -- Nagrand Slam
    A(t[627], a[1273]); -- Nagrand Slam
    A(t[627], a[939]); -- Hills Like White Elekk
    A(t[627], a[941]); -- Hemet Nesingwary: The Collected Quests
    A(t[627], a[1576]); -- Of Blood and Anguish
    t[634] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[620], t[634]);
    A(t[634], a[866]); -- Explore Nagrand
    t[641] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[620], t[641]);
    A(t[641], a[899]); -- "Oh My, Kurenai"
    A(t[641], a[901]); -- Mag'har of Draenor
    A(t[641], a[942]); -- The Diplomat
    A(t[641], a[943]); -- The Diplomat
    t[621] = c:New(k.GetMapName(1949)); -- Blade's Edge Mountains
    C(t[616], t[621]);
    t[628] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[621], t[628]);
    A(t[628], a[1193]); -- On the Blade's Edge
    A(t[628], a[1276]); -- Blade's Edge Bomberman
    t[635] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[621], t[635]);
    A(t[635], a[865]); -- Explore Blade's Edge Mountains
    t[640] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[621], t[640]);
    A(t[640], a[896]); -- A Quest a Day Keeps the Ogres at Bay
    t[622] = c:New(k.GetMapName(1953)); -- Netherstorm
    C(t[616], t[622]);
    t[629] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[622], t[629]);
    A(t[629], a[1194]); -- Into the Nether
    t[636] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[622], t[636]);
    A(t[636], a[843]); -- Explore Netherstorm
    t[623] = c:New(k.GetMapName(1948)); -- Shadowmoon Valley
    C(t[616], t[623]);
    t[630] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[623], t[630]);
    A(t[630], a[1195]); -- Shadow of the Betrayer
    t[637] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[623], t[637]);
    A(t[637], a[864]); -- Explore Shadowmoon Valley
    t[638] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[623], t[638]);
    A(t[638], a[898]); -- On Wings of Nether
    A(t[638], a[1638]); -- Skyshattered
    t[750] = c:New(k.GetMapName(1957)); -- Isle of Quel'Danas
    C(t[616], t[750]);
    t[751] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[750], t[751]);
    A(t[751], a[868]); -- Explore Isle of Quel'Danas
    t[56] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[55], t[56]);
    A(t[56], a[1284]); -- Outland Dungeonmaster
    A(t[56], a[1287]); -- Outland Dungeon Hero
    t[57] = c:New(k.GetInstanceInfoName(248)); -- Hellfire Ramparts
    C(t[56], t[57]);
    A(t[57], a[647]); -- Hellfire Ramparts
    A(t[57], a[667]); -- Heroic: Hellfire Ramparts
    t[58] = c:New(k.GetInstanceInfoName(256)); -- The Blood Furnace
    C(t[56], t[58]);
    A(t[58], a[648]); -- The Blood Furnace
    A(t[58], a[668]); -- Heroic: The Blood Furnace
    t[59] = c:New(k.GetInstanceInfoName(259)); -- The Shattered Halls
    C(t[56], t[59]);
    A(t[59], a[657]); -- The Shattered Halls
    A(t[59], a[678]); -- Heroic: The Shattered Halls
    t[60] = c:New(k.GetInstanceInfoName(260)); -- The Slave Pens
    C(t[56], t[60]);
    A(t[60], a[649]); -- The Slave Pens
    A(t[60], a[669]); -- Heroic: The Slave Pens
    t[61] = c:New(k.GetInstanceInfoName(262)); -- The Underbog
    C(t[56], t[61]);
    A(t[61], a[650]); -- Underbog
    A(t[61], a[670]); -- Heroic: Underbog
    t[62] = c:New(k.GetInstanceInfoName(261)); -- The Steamvault
    C(t[56], t[62]);
    A(t[62], a[656]); -- The Steamvault
    A(t[62], a[677]); -- Heroic: The Steamvault
    t[63] = c:New(k.GetInstanceInfoName(250)); -- Mana-Tombs
    C(t[56], t[63]);
    A(t[63], a[651]); -- Mana-Tombs
    A(t[63], a[671]); -- Heroic: Mana-Tombs
    t[64] = c:New(k.GetInstanceInfoName(247)); -- Auchenai Crypts
    C(t[56], t[64]);
    A(t[64], a[666]); -- Auchenai Crypts
    A(t[64], a[672]); -- Heroic: Auchenai Crypts
    t[65] = c:New(k.GetInstanceInfoName(252)); -- Sethekk Halls
    C(t[56], t[65]);
    A(t[65], a[653]); -- Sethekk Halls
    A(t[65], a[674]); -- Heroic: Sethekk Halls
    A(t[65], a[883]); -- Reins of the Raven Lord
    t[66] = c:New(k.GetInstanceInfoName(253)); -- Shadow Labyrinth
    C(t[56], t[66]);
    A(t[66], a[654]); -- Shadow Labyrinth
    A(t[66], a[675]); -- Heroic: Shadow Labyrinth
    t[67] = c:New(k.GetInstanceInfoName(251)); -- Old Hillsbrad Foothills
    C(t[56], t[67]);
    A(t[67], a[652]); -- The Escape From Durnholde
    A(t[67], a[673]); -- Heroic: The Escape From Durnholde
    t[68] = c:New(k.GetInstanceInfoName(255)); -- The Black Morass
    C(t[56], t[68]);
    A(t[68], a[655]); -- Opening of the Dark Portal
    A(t[68], a[676]); -- Heroic: Opening of the Dark Portal
    t[69] = c:New(k.GetInstanceInfoName(258)); -- The Mechanar
    C(t[56], t[69]);
    A(t[69], a[658]); -- The Mechanar
    A(t[69], a[679]); -- Heroic: The Mechanar
    t[70] = c:New(k.GetInstanceInfoName(257)); -- The Botanica
    C(t[56], t[70]);
    A(t[70], a[659]); -- The Botanica
    A(t[70], a[680]); -- Heroic: The Botanica
    t[71] = c:New(k.GetInstanceInfoName(254)); -- The Arcatraz
    C(t[56], t[71]);
    A(t[71], a[660]); -- The Arcatraz
    A(t[71], a[681]); -- Heroic: The Arcatraz
    t[72] = c:New(k.GetInstanceInfoName(249)); -- Magisters Terrace
    C(t[56], t[72]);
    A(t[72], a[661]); -- Magister's Terrace
    A(t[72], a[682]); -- Heroic: Magister's Terrace
    A(t[72], a[884]); -- Swift White Hawkstrider
    t[73] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[55], t[73]);
    A(t[73], a[1286]); -- Outland Raider
    A(t[73], a[432]); -- Champion of the Naaru
    A(t[73], a[431]); -- Hand of A'dal
    t[74] = c:New(k.GetInstanceInfoName(745)); -- Karazhan
    C(t[73], t[74]);
    A(t[74], a[690]); -- Karazhan
    A(t[74], a[882]); -- Fiery Warhorse's Reins
    A(t[74], a[2456]); -- Vampire Hunter
    t[647] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[74], t[647]);
    A(t[647], a[960]); -- The Violet Eye
    t[75] = c:New(k.GetInstanceInfoName(746)); -- Gruul's Lair
    C(t[73], t[75]);
    A(t[75], a[692]); -- Gruul's Lair
    t[76] = c:New(k.GetInstanceInfoName(747)); -- Magtheridon's Lair
    C(t[73], t[76]);
    A(t[76], a[693]); -- Magtheridon's Lair
    t[77] = c:New(k.GetInstanceInfoName(748)); -- Serpentshrine Cavern
    C(t[73], t[77]);
    A(t[77], a[694]); -- Serpentshrine Cavern
    t[78] = c:New(k.GetInstanceInfoName(749)); -- The Eye
    C(t[73], t[78]);
    A(t[78], a[696]); -- Tempest Keep
    A(t[78], a[885]); -- Ashes of Al'ar
    t[79] = c:New(k.GetInstanceInfoName(750)); -- The Battle for Mount Hyjal
    C(t[73], t[79]);
    A(t[79], a[695]); -- The Battle for Mount Hyjal
    t[646] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[79], t[646]);
    A(t[646], a[959]); -- The Scale of the Sands
    t[80] = c:New(k.GetInstanceInfoName(751)); -- Black Temple
    C(t[73], t[80]);
    A(t[80], a[697]); -- The Black Temple
    A(t[80], a[426]); -- Warglaives of Azzinoth
    t[645] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[80], t[645]);
    A(t[645], a[958]); -- Sworn to the Deathsworn
    t[81] = c:New(k.GetInstanceInfoName(77)); -- Zul'Aman
    C(t[73], t[81]);
    A(t[81], a[691]); -- Zul'Aman
    A(t[81], a[430]); -- Amani War Bear
    t[82] = c:New(k.GetInstanceInfoName(752)); -- Sunwell Plateau
    C(t[73], t[82]);
    A(t[82], a[698]); -- Sunwell Plateau
    A(t[82], a[725]); -- "Thori'dal, the Stars' Fury"
    t[786] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[55], t[786]);
    t[83] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[883], t[83]);
    t[577] = c:New(k.L["Zones"]); -- Zones
    C(t[83], t[577]);
    A(t[577], a[41]); -- Loremaster of Northrend
    A(t[577], a[1360]); -- Loremaster of Northrend
    A(t[577], a[2256]); -- Northern Exposure
    A(t[577], a[2257]); -- Frostbitten
    A(t[577], a[2557]); -- To All The Squirrels Who Shared My Life
    A(t[577], a[45]); -- Northrend Explorer
    A(t[577], a[1008]); -- The Kirin Tor
    A(t[577], a[1009]); -- Knights of the Ebon Blade
    A(t[577], a[1010]); -- Northrend Vanguard
    A(t[577], a[1011]); -- The Winds of the North
    A(t[577], a[1012]); -- The Winds of the North
    A(t[577], a[2556]); -- Pest Control
    A(t[577], a[1681]); -- The Loremaster
    A(t[577], a[1682]); -- The Loremaster
    t[614] = c:New(k.GetMapName(125)); -- Dalaran
    C(t[577], t[614]);
    A(t[614], a[1956]); -- Higher Learning
    A(t[614], a[2084]); -- Ring of the Kirin Tor
    A(t[614], a[2076]); -- Armored Brown Bear
    A(t[614], a[2077]); -- Wooly Mammoth
    A(t[614], a[2078]); -- Traveler's Tundra Mammoth
    t[578] = c:New(k.GetMapName(114)); -- Borean Tundra
    C(t[577], t[578]);
    t[586] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[578], t[586]);
    A(t[586], a[33]); -- Nothing Boring About Borean
    A(t[586], a[1358]); -- Nothing Boring About Borean
    A(t[586], a[561]); -- D.E.H.T.A's Little P.I.T.A.
    t[587] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[578], t[587]);
    A(t[587], a[1264]); -- Explore Borean Tundra
    t[588] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[578], t[588]);
    A(t[588], a[949]); -- Tuskarrmageddon
    t[579] = c:New(k.GetMapName(117)); -- Howling Fjord
    C(t[577], t[579]);
    t[589] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[579], t[589]);
    A(t[589], a[34]); -- I've Toured the Fjord
    A(t[589], a[1356]); -- I've Toured the Fjord
    t[590] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[579], t[590]);
    A(t[590], a[1263]); -- Explore Howling Fjord
    A(t[590], a[1254]); -- Friend or Fowl?
    t[580] = c:New(k.GetMapName(115)); -- Dragonblight
    C(t[577], t[580]);
    t[592] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[580], t[592]);
    A(t[592], a[35]); -- Might of Dragonblight
    A(t[592], a[1359]); -- Might of Dragonblight
    A(t[592], a[547]); -- Veteran of the Wrathgate
    A(t[592], a[1277]); -- Rapid Defense
    t[593] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[580], t[593]);
    A(t[593], a[1265]); -- Explore Dragonblight
    t[594] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[580], t[594]);
    A(t[594], a[1007]); -- The Wyrmrest Accord
    t[581] = c:New(k.GetMapName(116)); -- Grizzly Hills
    C(t[577], t[581]);
    t[595] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[581], t[595]);
    A(t[595], a[37]); -- Fo' Grizzle My Shizzle
    A(t[595], a[1357]); -- Fo' Grizzle My Shizzle
    t[596] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[581], t[596]);
    A(t[596], a[1266]); -- Explore Grizzly Hills
    t[782] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[581], t[782]);
    A(t[782], a[2016]); -- Grizzled Veteran
    A(t[782], a[2017]); -- Grizzled Veteran
    t[582] = c:New(k.GetMapName(121)); -- Zul'Drak
    C(t[577], t[582]);
    t[598] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[582], t[598]);
    A(t[598], a[36]); -- The Empire of Zul'Drak
    A(t[598], a[1596]); -- Guru of Drakuru
    A(t[598], a[1576]); -- Of Blood and Anguish
    t[599] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[582], t[599]);
    A(t[599], a[1267]); -- Explore Zul'Drak
    t[583] = c:New(k.GetMapName(119)); -- Sholazar Basin
    C(t[577], t[583]);
    t[601] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[583], t[601]);
    A(t[601], a[39]); -- Into the Basin
    A(t[601], a[961]); -- Honorary Frenzyheart
    A(t[601], a[962]); -- Savior of the Oracles
    A(t[601], a[938]); -- The Snows of Northrend
    A(t[601], a[941]); -- Hemet Nesingwary: The Collected Quests
    t[602] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[583], t[602]);
    A(t[602], a[1268]); -- Explore Sholazar Basin
    t[603] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[583], t[603]);
    A(t[603], a[950]); -- Frenzyheart Tribe
    A(t[603], a[951]); -- The Oracles
    A(t[603], a[952]); -- Mercenary of Sholazar
    t[610] = c:New(k.GetMapName(127)); -- Crystalsong Forest
    C(t[577], t[610]);
    A(t[610], a[1457]); -- Explore Crystalsong Forest
    t[584] = c:New(k.GetMapName(120)); -- Storm Peaks
    C(t[577], t[584]);
    t[604] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[584], t[604]);
    A(t[604], a[38]); -- The Summit of Storm Peaks
    A(t[604], a[1428]); -- Mine Sweeper
    t[612] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[584], t[612]);
    A(t[612], a[1269]); -- Explore Storm Peaks
    t[606] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[584], t[606]);
    A(t[606], a[2082]); -- Ice Mammoth
    A(t[606], a[2083]); -- Grand Ice Mammoth
    t[585] = c:New(k.GetMapName(118)); -- Icecrown
    C(t[577], t[585]);
    t[607] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[585], t[607]);
    A(t[607], a[40]); -- Icecrown: The Final Goal
    t[608] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[585], t[608]);
    A(t[608], a[1270]); -- Explore Icecrown
    t[609] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[585], t[609]);
    A(t[609], a[947]); -- The Argent Crusade
    A(t[609], a[945]); -- The Argent Champion
    t[1034] = c:New(k.GetMapName(123)); -- Wintergrasp
    C(t[577], t[1034]);
    t[84] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[83], t[84]);
    A(t[84], a[1288]); -- Northrend Dungeonmaster
    A(t[84], a[1289]); -- Northrend Dungeon Hero
    A(t[84], a[17304]); -- Defense Protocol Alpha: Terminated
    A(t[84], a[1658]); -- Champion of the Frozen Wastes
    A(t[84], a[2136]); -- Glory of the Hero
    A(t[84], a[2018]); -- Timear Foresees
    A(t[84], a[2019]); -- Proof of Demise
    A(t[84], a[2085]); -- 50 Stone Keeper's Shards
    A(t[84], a[2086]); -- 100 Stone Keeper's Shards
    A(t[84], a[2087]); -- 250 Stone Keeper's Shards
    A(t[84], a[2088]); -- 500 Stone Keeper's Shards
    A(t[84], a[2089]); -- 1000 Stone Keeper's Shards
    A(t[84], a[4784]); -- Emblematic
    A(t[84], a[4785]); -- Emblematic
    A(t[84], a[3838]); -- Dungeon & Raid Emblem
    A(t[84], a[3839]); -- 25 Dungeon & Raid Emblems
    A(t[84], a[3840]); -- 50 Dungeon & Raid Emblems
    A(t[84], a[3841]); -- 100 Dungeon & Raid Emblems
    A(t[84], a[3842]); -- 250 Dungeon & Raid Emblems
    A(t[84], a[3843]); -- 500 Dungeon & Raid Emblems
    A(t[84], a[3844]); -- 1000 Dungeon & Raid Emblems
    A(t[84], a[3876]); -- 1500 Dungeon & Raid Emblems
    A(t[84], a[4316]); -- 2500 Dungeon & Raid Emblems
    t[86] = c:New(k.GetInstanceInfoName(285)); -- Utgarde Keep
    C(t[84], t[86]);
    A(t[86], a[1919]); -- On The Rocks
    A(t[86], a[477]); -- Utgarde Keep
    A(t[86], a[489]); -- Heroic: Utgarde Keep
    A(t[86], a[17213]); -- Defense Protocol Alpha: Utgarde Keep
    t[87] = c:New(k.GetInstanceInfoName(281)); -- The Nexus
    C(t[84], t[87]);
    A(t[87], a[2150]); -- Split Personality
    A(t[87], a[2037]); -- Chaos Theory
    A(t[87], a[2036]); -- Intense Cold
    A(t[87], a[478]); -- The Nexus
    A(t[87], a[490]); -- Heroic: The Nexus
    A(t[87], a[17283]); -- Defense Protocol Alpha: The Nexus
    t[88] = c:New(k.GetInstanceInfoName(272)); -- Azjol-Nerub
    C(t[84], t[88]);
    A(t[88], a[1296]); -- Watch Him Die
    A(t[88], a[1297]); -- Hadronox Denied
    A(t[88], a[1860]); -- Gotta Go!
    A(t[88], a[480]); -- Azjol-Nerub
    A(t[88], a[491]); -- Heroic: Azjol-Nerub
    A(t[88], a[17285]); -- Defense Protocol Alpha: Azjol-Nerub
    t[89] = c:New(k.GetInstanceInfoName(271)); -- Ahn'kahet: The Old Kingdom
    C(t[84], t[89]);
    A(t[89], a[2038]); -- Respect Your Elders
    A(t[89], a[2056]); -- Volunteer Work
    A(t[89], a[1862]); -- Volazj's Quick Demise
    A(t[89], a[481]); -- Ahn'kahet: The Old Kingdom
    A(t[89], a[492]); -- Heroic: Ahn'kahet: The Old Kingdom
    A(t[89], a[17291]); -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    t[90] = c:New(k.GetInstanceInfoName(273)); -- Drak'Tharon Keep
    C(t[84], t[90]);
    A(t[90], a[2151]); -- Consumption Junction
    A(t[90], a[2057]); -- Oh Novos!
    A(t[90], a[2039]); -- Better Off Dred
    A(t[90], a[482]); -- Drak'Tharon Keep
    A(t[90], a[493]); -- Heroic: Drak'Tharon Keep
    A(t[90], a[17292]); -- Defense Protocol Alpha: Drak'Tharon Keep
    t[91] = c:New(k.GetInstanceInfoName(283)); -- The Violet Hold
    C(t[84], t[91]);
    A(t[91], a[1865]); -- Lockdown!
    A(t[91], a[2041]); -- Dehydration
    A(t[91], a[2153]); -- A Void Dance
    A(t[91], a[1816]); -- Defenseless
    A(t[91], a[483]); -- The Violet Hold
    A(t[91], a[494]); -- Heroic: The Violet Hold
    A(t[91], a[17293]); -- Defense Protocol Alpha: The Violet Hold
    t[92] = c:New(k.GetInstanceInfoName(274)); -- Gundrak
    C(t[84], t[92]);
    A(t[92], a[2058]); -- Snakes. Why'd It Have To Be Snakes?
    A(t[92], a[2040]); -- Less-rabi
    A(t[92], a[1864]); -- What the Eck?
    A(t[92], a[2152]); -- Share The Love
    A(t[92], a[484]); -- Gundrak
    A(t[92], a[495]); -- Heroic: Gundrak
    A(t[92], a[17295]); -- Defense Protocol Alpha: Gundrak
    t[93] = c:New(k.GetInstanceInfoName(277)); -- Halls of Stone
    C(t[84], t[93]);
    A(t[93], a[1866]); -- Good Grief
    A(t[93], a[2154]); -- Brann Spankin' New
    A(t[93], a[2155]); -- Abuse the Ooze
    A(t[93], a[485]); -- Halls of Stone
    A(t[93], a[496]); -- Heroic: Halls of Stone
    A(t[93], a[17297]); -- Defense Protocol Alpha: Halls of Stone
    t[94] = c:New(k.GetInstanceInfoName(275)); -- Halls of Lightning
    C(t[84], t[94]);
    A(t[94], a[1834]); -- Lightning Struck
    A(t[94], a[2042]); -- Shatter Resistant
    A(t[94], a[1867]); -- Timely Death
    A(t[94], a[486]); -- Halls of Lightning
    A(t[94], a[497]); -- Heroic: Halls of Lightning
    A(t[94], a[17299]); -- Defense Protocol Alpha: Halls of Lightning
    t[95] = c:New(k.GetInstanceInfoName(282)); -- The Oculus
    C(t[84], t[95]);
    A(t[95], a[1868]); -- Make It Count
    A(t[95], a[2046]); -- Amber Void
    A(t[95], a[2045]); -- Emerald Void
    A(t[95], a[2044]); -- Ruby Void
    A(t[95], a[1871]); -- Experienced Drake Rider
    A(t[95], a[487]); -- The Oculus
    A(t[95], a[498]); -- Heroic: The Oculus
    A(t[95], a[17300]); -- Defense Protocol Alpha: The Oculus
    t[97] = c:New(k.GetInstanceInfoName(286)); -- Utgarde Pinnacle
    C(t[84], t[97]);
    A(t[97], a[2043]); -- The Incredible Hulk
    A(t[97], a[1873]); -- Lodi Dodi We Loves the Skadi
    A(t[97], a[2156]); -- My Girl Loves to Skadi All the Time
    A(t[97], a[2157]); -- King's Bane
    A(t[97], a[488]); -- Utgarde Pinnacle
    A(t[97], a[499]); -- Heroic: Utgarde Pinnacle
    A(t[97], a[17301]); -- Defense Protocol Alpha: Utgarde Pinnacle
    t[96] = c:New(k.GetInstanceInfoName(279)); -- The Culling of Stratholme
    C(t[84], t[96]);
    A(t[96], a[1872]); -- Zombiefest!
    A(t[96], a[1817]); -- The Culling of Time
    A(t[96], a[479]); -- The Culling of Stratholme
    A(t[96], a[500]); -- Heroic: The Culling of Stratholme
    A(t[96], a[17302]); -- Defense Protocol Alpha: The Culling of Stratholme
    t[98] = c:New(k.GetInstanceInfoName(284)); -- Trial of the Champion
    C(t[84], t[98]);
    A(t[98], a[3803]); -- The Faceroller
    A(t[98], a[3802]); -- Argent Confessor
    A(t[98], a[3804]); -- I've Had Worse
    A(t[98], a[4296]); -- Trial of the Champion
    A(t[98], a[3778]); -- Trial of the Champion
    A(t[98], a[4298]); -- Heroic: Trial of the Champion
    A(t[98], a[4297]); -- Heroic: Trial of the Champion
    t[99] = c:New(k.GetInstanceInfoName(280)); -- The Forge of Souls
    C(t[84], t[99]);
    A(t[99], a[4522]); -- Soul Power
    A(t[99], a[4523]); -- Three Faced
    A(t[99], a[4516]); -- The Forge of Souls
    A(t[99], a[4519]); -- Heroic: The Forge of Souls
    t[100] = c:New(k.GetInstanceInfoName(278)); -- Pit of Saron
    C(t[84], t[100]);
    A(t[100], a[4524]); -- Doesn't Go to Eleven
    A(t[100], a[4525]); -- Don't Look Up
    A(t[100], a[4517]); -- The Pit of Saron
    A(t[100], a[4520]); -- Heroic: The Pit of Saron
    t[101] = c:New(k.GetInstanceInfoName(276)); -- Halls of Reflection
    C(t[84], t[101]);
    A(t[101], a[4526]); -- We're Not Retreating; We're Advancing in a Different Direction.
    A(t[101], a[4518]); -- The Halls of Reflection
    A(t[101], a[4521]); -- Heroic: The Halls of Reflection
    t[85] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[83], t[85]);
    A(t[85], a[1658]); -- Champion of the Frozen Wastes
    A(t[85], a[2137]); -- Glory of the Raider (10 player)
    A(t[85], a[2138]); -- Glory of the Raider (25 player)
    A(t[85], a[4602]); -- Glory of the Icecrown Raider (10 player)
    A(t[85], a[4603]); -- Glory of the Icecrown Raider (25 player)
    A(t[85], a[2957]); -- Glory of the Ulduar Raider (10 player)
    A(t[85], a[2958]); -- Glory of the Ulduar Raider (25 player)
    A(t[85], a[4784]); -- Emblematic
    A(t[85], a[4785]); -- Emblematic
    A(t[85], a[3838]); -- Dungeon & Raid Emblem
    A(t[85], a[3839]); -- 25 Dungeon & Raid Emblems
    A(t[85], a[3840]); -- 50 Dungeon & Raid Emblems
    A(t[85], a[3841]); -- 100 Dungeon & Raid Emblems
    A(t[85], a[3842]); -- 250 Dungeon & Raid Emblems
    A(t[85], a[3843]); -- 500 Dungeon & Raid Emblems
    A(t[85], a[3844]); -- 1000 Dungeon & Raid Emblems
    A(t[85], a[3876]); -- 1500 Dungeon & Raid Emblems
    A(t[85], a[4316]); -- 2500 Dungeon & Raid Emblems
    t[102] = c:New(k.GetInstanceInfoName(753)); -- Vault of Archavon
    C(t[85], t[102]);
    A(t[102], a[2081]); -- Grand Black War Mammoth
    t[103] = c:New((GetDifficultyInfo(3))); -- Vault of Archavon 10
    C(t[102], t[103]);
    A(t[103], a[4016]); -- "Earth, Wind & Fire (10 player)"
    A(t[103], a[1722]); -- Archavon the Stone Watcher (10 player)
    A(t[103], a[3136]); -- Emalon the Storm Watcher (10 player)
    A(t[103], a[3836]); -- Koralon the Flame Watcher (10 player)
    A(t[103], a[4585]); -- Toravon the Ice Watcher (10 player)
    t[104] = c:New((GetDifficultyInfo(4))); -- Vault of Archavon 25
    C(t[102], t[104]);
    A(t[104], a[4017]); -- "Earth, Wind & Fire (25 player)"
    A(t[104], a[1721]); -- Archavon the Stone Watcher (25 player)
    A(t[104], a[3137]); -- Emalon the Storm Watcher (25 player)
    A(t[104], a[3837]); -- Koralon the Flame Watcher (25 player)
    A(t[104], a[4586]); -- Toravon the Ice Watcher (25 player)
    t[105] = c:New(k.GetInstanceInfoName(754)); -- Naxxramas
    C(t[85], t[105]);
    t[106] = c:New((GetDifficultyInfo(3))); -- Naxxramas 10
    C(t[105], t[106]);
    A(t[106], a[1997]); -- Momma Said Knock You Out (10 player)
    A(t[106], a[1858]); -- Arachnophobia (10 player)
    A(t[106], a[1856]); -- Make Quick Werk of Him (10 player)
    A(t[106], a[2178]); -- Shocking! (10 player)
    A(t[106], a[2180]); -- Subtraction (10 player)
    A(t[106], a[1996]); -- The Safety Dance (10 player)
    A(t[106], a[2182]); -- Spore Loser (10 player)
    A(t[106], a[2176]); -- And They Would All Go Down Together (10 player)
    A(t[106], a[2146]); -- The Hundred Club (10 player)
    A(t[106], a[2184]); -- Just Can't Get Enough (10 player)
    A(t[106], a[578]); -- The Dedicated Few (10 player)
    A(t[106], a[562]); -- The Arachnid Quarter (10 player)
    A(t[106], a[564]); -- The Construct Quarter (10 player)
    A(t[106], a[566]); -- The Plague Quarter (10 player)
    A(t[106], a[568]); -- The Military Quarter (10 player)
    A(t[106], a[572]); -- Sapphiron's Demise (10 player)
    A(t[106], a[574]); -- Kel'Thuzad's Defeat (10 player)
    A(t[106], a[576]); -- The Fall of Naxxramas (10 player)
    A(t[106], a[2187]); -- The Undying
    t[107] = c:New((GetDifficultyInfo(4))); -- Naxxramas 25
    C(t[105], t[107]);
    A(t[107], a[2140]); -- Momma Said Knock You Out (25 player)
    A(t[107], a[1859]); -- Arachnophobia (25 player)
    A(t[107], a[1857]); -- Make Quick Werk of Him (25 player)
    A(t[107], a[2179]); -- Shocking! (25 player)
    A(t[107], a[2181]); -- Subtraction (25 player)
    A(t[107], a[2139]); -- The Safety Dance (25 player)
    A(t[107], a[2183]); -- Spore Loser (25 player)
    A(t[107], a[2177]); -- And They Would All Go Down Together (25 player)
    A(t[107], a[2147]); -- The Hundred Club (25 player)
    A(t[107], a[2185]); -- Just Can't Get Enough (25 player)
    A(t[107], a[579]); -- The Dedicated Few (25 player)
    A(t[107], a[563]); -- The Arachnid Quarter (25 player)
    A(t[107], a[565]); -- The Construct Quarter (25 player)
    A(t[107], a[567]); -- The Plague Quarter (25 player)
    A(t[107], a[569]); -- The Military Quarter (25 player)
    A(t[107], a[573]); -- Sapphiron's Demise (25 player)
    A(t[107], a[575]); -- Kel'Thuzad's Defeat (25 player)
    A(t[107], a[577]); -- The Fall of Naxxramas (25 player)
    A(t[107], a[2186]); -- The Immortal
    t[108] = c:New(k.GetInstanceInfoName(755)); -- The Obsidian Sanctum
    C(t[85], t[108]);
    t[109] = c:New((GetDifficultyInfo(3))); -- The Obsidian Sanctum 10
    C(t[108], t[109]);
    A(t[109], a[2047]); -- Gonna Go When the Volcano Blows (10 player)
    A(t[109], a[2049]); -- Twilight Assist (10 player)
    A(t[109], a[2050]); -- Twilight Duo (10 player)
    A(t[109], a[2051]); -- The Twilight Zone (10 player)
    A(t[109], a[624]); -- Less Is More (10 player)
    A(t[109], a[1876]); -- Besting the Black Dragonflight (10 player)
    t[110] = c:New((GetDifficultyInfo(4))); -- The Obsidian Sanctum 25
    C(t[108], t[110]);
    A(t[110], a[2048]); -- Gonna Go When the Volcano Blows (25 player)
    A(t[110], a[2052]); -- Twilight Assist (25 player)
    A(t[110], a[2053]); -- Twilight Duo (25 player)
    A(t[110], a[2054]); -- The Twilight Zone (25 player)
    A(t[110], a[1877]); -- Less Is More (25 player)
    A(t[110], a[625]); -- Besting the Black Dragonflight (25 player)
    t[111] = c:New(k.GetInstanceInfoName(756)); -- The Eye of Eternity
    C(t[85], t[111]);
    t[112] = c:New((GetDifficultyInfo(3))); -- The Eye of Eternity 10
    C(t[111], t[112]);
    A(t[112], a[2148]); -- Denyin' the Scion (10 player)
    A(t[112], a[1874]); -- You Don't Have an Eternity (10 player)
    A(t[112], a[1869]); -- A Poke in the Eye (10 player)
    A(t[112], a[622]); -- The Spellweaver's Downfall (10 player)
    t[113] = c:New((GetDifficultyInfo(4))); -- The Eye of Eternity 25
    C(t[111], t[113]);
    A(t[113], a[2149]); -- Denyin' the Scion (25 player)
    A(t[113], a[1875]); -- You Don't Have an Eternity (25 player)
    A(t[113], a[1870]); -- A Poke in the Eye (25 player)
    A(t[113], a[623]); -- The Spellweaver's Downfall (25 player)
    t[114] = c:New(k.GetInstanceInfoName(759)); -- Ulduar
    C(t[85], t[114]);
    A(t[114], a[4626]); -- And I'll Form the Head!
    A(t[114], a[3142]); -- "Val'anyr, Hammer of Ancient Kings"
    A(t[114], a[3316]); -- Herald of the Titans
    t[115] = c:New((GetDifficultyInfo(3))); -- Ulduar 10
    C(t[114], t[115]);
    A(t[115], a[3097]); -- Dwarfageddon (10 player)
    A(t[115], a[2907]); -- Three Car Garage (10 player)
    A(t[115], a[2905]); -- Unbroken (10 player)
    A(t[115], a[2911]); -- Shutout (10 player)
    A(t[115], a[2909]); -- Take Out Those Turrets (10 player)
    A(t[115], a[2913]); -- Orbital Bombardment (10 player)
    A(t[115], a[2914]); -- Orbital Devastation (10 player)
    A(t[115], a[2915]); -- Nuked from Orbit (10 player)
    A(t[115], a[3056]); -- Orbit-uary (10 player)
    A(t[115], a[2925]); -- Shattered (10 player)
    A(t[115], a[2927]); -- Hot Pocket (10 player)
    A(t[115], a[2930]); -- Stokin' the Furnace (10 player)
    A(t[115], a[2919]); -- A Quick Shave (10 player)
    A(t[115], a[2923]); -- "Iron Dwarf, Medium Rare (10 player)"
    A(t[115], a[2931]); -- Nerf Engineering (10 player)
    A(t[115], a[2933]); -- Nerf Scrapbots (10 player)
    A(t[115], a[2934]); -- Nerf Gravity Bombs (10 player)
    A(t[115], a[2937]); -- Must Deconstruct Faster (10 player)
    A(t[115], a[3058]); -- Heartbreaker (10 player)
    A(t[115], a[2945]); -- But I'm On Your Side (10 player)
    A(t[115], a[2947]); -- Can't Do That While Stunned (10 player)
    A(t[115], a[2939]); -- "I Choose You, Runemaster Molgeim (10 player)"
    A(t[115], a[2940]); -- "I Choose You, Stormcaller Brundir (10 player)"
    A(t[115], a[2941]); -- "I Choose You, Steelbreaker (10 player)"
    A(t[115], a[2955]); -- If Looks Could Kill (10 player)
    A(t[115], a[2959]); -- Rubble and Roll (10 player)
    A(t[115], a[2951]); -- With Open Arms (10 player)
    A(t[115], a[2953]); -- Disarmed (10 player)
    A(t[115], a[3076]); -- Nine Lives (10 player)
    A(t[115], a[3006]); -- Crazy Cat Lady (10 player)
    A(t[115], a[2961]); -- Cheese the Freeze (10 player)
    A(t[115], a[2963]); -- I Have the Coolest Friends (10 player)
    A(t[115], a[2967]); -- Getting Cold in Here (10 player)
    A(t[115], a[2969]); -- Staying Buffed All Winter (10 player)
    A(t[115], a[3182]); -- I Could Say That This Cache Was Rare (10 player)
    A(t[115], a[2971]); -- Don't Stand in the Lightning (10 player)
    A(t[115], a[2973]); -- I'll Take You All On (10 player)
    A(t[115], a[2975]); -- Who Needs Bloodlust? (10 player)
    A(t[115], a[2977]); -- Siffed (10 player)
    A(t[115], a[3176]); -- Lose Your Illusion (10 player)
    A(t[115], a[2979]); -- Lumberjacked (10 player)
    A(t[115], a[2980]); -- Con-speed-atory (10 player)
    A(t[115], a[2985]); -- Deforestation (10 player)
    A(t[115], a[2982]); -- Getting Back to Nature (10 player)
    A(t[115], a[3177]); -- Knock on Wood (10 player)
    A(t[115], a[3178]); -- "Knock, Knock on Wood (10 player)"
    A(t[115], a[3179]); -- "Knock, Knock, Knock on Wood (10 player)"
    A(t[115], a[2989]); -- Set Up Us the Bomb (10 player)
    A(t[115], a[3138]); -- Not-So-Friendly Fire (10 player)
    A(t[115], a[3180]); -- Firefighter (10 player)
    A(t[115], a[2996]); -- Shadowdodger (10 player)
    A(t[115], a[3181]); -- I Love the Smell of Saronite in the Morning (10 player)
    A(t[115], a[3009]); -- Kiss and Make Up (10 player)
    A(t[115], a[3008]); -- Drive Me Crazy (10 player)
    A(t[115], a[3012]); -- He's Not Getting Any Older (10 player)
    A(t[115], a[3014]); -- They're Coming Out of the Walls (10 player)
    A(t[115], a[3015]); -- In His House He Waits Dreaming (10 player)
    A(t[115], a[3157]); -- Three Lights in the Darkness (10 player)
    A(t[115], a[3141]); -- Two Lights in the Darkness (10 player)
    A(t[115], a[3158]); -- One Light in the Darkness (10 player)
    A(t[115], a[3159]); -- Alone in the Darkness (10 player)
    A(t[115], a[3003]); -- Supermassive (10 player)
    A(t[115], a[2886]); -- The Siege of Ulduar (10 player)
    A(t[115], a[2888]); -- The Antechamber of Ulduar (10 player)
    A(t[115], a[2890]); -- The Keepers of Ulduar (10 player)
    A(t[115], a[2892]); -- The Descent into Madness (10 player)
    A(t[115], a[2894]); -- The Secrets of Ulduar (10 player)
    A(t[115], a[3036]); -- Observed (10 player)
    A(t[115], a[3004]); -- He Feeds On Your Tears (10 player)
    A(t[115], a[2903]); -- Champion of Ulduar
    t[116] = c:New((GetDifficultyInfo(4))); -- Ulduar 25
    C(t[114], t[116]);
    A(t[116], a[3098]); -- Dwarfageddon (25 player)
    A(t[116], a[2908]); -- Three Car Garage (25 player)
    A(t[116], a[2906]); -- Unbroken (25 player)
    A(t[116], a[2912]); -- Shutout (25 player)
    A(t[116], a[2910]); -- Take Out Those Turrets (25 player)
    A(t[116], a[2918]); -- Orbital Bombardment (25 player)
    A(t[116], a[2916]); -- Orbital Devastation (25 player)
    A(t[116], a[2917]); -- Nuked from Orbit (25 player)
    A(t[116], a[3057]); -- Orbit-uary (25 player)
    A(t[116], a[2926]); -- Shattered (25 player)
    A(t[116], a[2928]); -- Hot Pocket (25 player)
    A(t[116], a[2929]); -- Stokin' the Furnace (25 player)
    A(t[116], a[2921]); -- A Quick Shave (25 player)
    A(t[116], a[2924]); -- "Iron Dwarf, Medium Rare (25 player)"
    A(t[116], a[2932]); -- Nerf Engineering (25 player)
    A(t[116], a[2935]); -- Nerf Scrapbots (25 player)
    A(t[116], a[2936]); -- Nerf Gravity Bombs (25 player)
    A(t[116], a[2938]); -- Must Deconstruct Faster (25 player)
    A(t[116], a[3059]); -- Heartbreaker (25 player)
    A(t[116], a[2946]); -- But I'm On Your Side (25 player)
    A(t[116], a[2948]); -- Can't Do That While Stunned (25 player)
    A(t[116], a[2942]); -- "I Choose You, Runemaster Molgeim (25 player)"
    A(t[116], a[2943]); -- "I Choose You, Stormcaller Brundir (25 player)"
    A(t[116], a[2944]); -- "I Choose You, Steelbreaker (25 player)"
    A(t[116], a[2956]); -- If Looks Could Kill (25 player)
    A(t[116], a[2960]); -- Rubble and Roll (25 player)
    A(t[116], a[2952]); -- With Open Arms (25 player)
    A(t[116], a[2954]); -- Disarmed (25 player)
    A(t[116], a[3077]); -- Nine Lives (25 player)
    A(t[116], a[3007]); -- Crazy Cat Lady (25 player)
    A(t[116], a[2962]); -- Cheese the Freeze (25 player)
    A(t[116], a[2965]); -- I Have the Coolest Friends (25 player)
    A(t[116], a[2968]); -- Getting Cold in Here (25 player)
    A(t[116], a[2970]); -- Staying Buffed All Winter (25 player)
    A(t[116], a[3184]); -- I Could Say That This Cache Was Rare (25 player)
    A(t[116], a[2972]); -- Don't Stand in the Lightning (25 player)
    A(t[116], a[2974]); -- I'll Take You All On (25 player)
    A(t[116], a[2976]); -- Who Needs Bloodlust? (25 player)
    A(t[116], a[2978]); -- Siffed (25 player)
    A(t[116], a[3183]); -- Lose Your Illusion (25 player)
    A(t[116], a[3118]); -- Lumberjacked (25 player)
    A(t[116], a[2981]); -- Con-speed-atory (25 player)
    A(t[116], a[2984]); -- Deforestation (25 player)
    A(t[116], a[2983]); -- Getting Back to Nature (25 player)
    A(t[116], a[3185]); -- Knock on Wood (25 player)
    A(t[116], a[3186]); -- "Knock, Knock on Wood (25 player)"
    A(t[116], a[3187]); -- "Knock, Knock, Knock on Wood (25 player)"
    A(t[116], a[3237]); -- Set Up Us the Bomb (25 player)
    A(t[116], a[2995]); -- Not-So-Friendly Fire (25 player)
    A(t[116], a[3189]); -- Firefighter (25 player)
    A(t[116], a[2997]); -- Shadowdodger (25 player)
    A(t[116], a[3188]); -- I Love the Smell of Saronite in the Morning (25 player)
    A(t[116], a[3011]); -- Kiss and Make Up (25 player)
    A(t[116], a[3010]); -- Drive Me Crazy (25 player)
    A(t[116], a[3013]); -- He's Not Getting Any Older (25 player)
    A(t[116], a[3017]); -- They're Coming Out of the Walls (25 player)
    A(t[116], a[3016]); -- In His House He Waits Dreaming (25 player)
    A(t[116], a[3161]); -- Three Lights in the Darkness (25 player)
    A(t[116], a[3162]); -- Two Lights in the Darkness (25 player)
    A(t[116], a[3163]); -- One Light in the Darkness (25 player)
    A(t[116], a[3164]); -- Alone in the Darkness (25 player)
    A(t[116], a[3002]); -- Supermassive (25 player)
    A(t[116], a[2887]); -- The Siege of Ulduar (25 player)
    A(t[116], a[2889]); -- The Antechamber of Ulduar (25 player)
    A(t[116], a[2891]); -- The Keepers of Ulduar (25 player)
    A(t[116], a[2893]); -- The Descent into Madness (25 player)
    A(t[116], a[2895]); -- The Secrets of Ulduar (25 player)
    A(t[116], a[3037]); -- Observed (25 player)
    A(t[116], a[3005]); -- He Feeds On Your Tears (25 player)
    A(t[116], a[2904]); -- Conqueror of Ulduar
    t[117] = c:New(k.GetInstanceInfoName(757)); -- Trial of the Crusader
    C(t[85], t[117]);
    t[118] = c:New((GetDifficultyInfo(3))); -- Trial of the Crusader 10
    C(t[117], t[118]);
    A(t[118], a[3797]); -- Upper Back Pain (10 player)
    A(t[118], a[3936]); -- "Not One, But Two Jormungars (10 player)"
    A(t[118], a[3996]); -- Three Sixty Pain Spike (10 player)
    A(t[118], a[3798]); -- Resilience Will Fix It (10 player)
    A(t[118], a[3799]); -- Salt and Pepper (10 player)
    A(t[118], a[3800]); -- The Traitor King (10 player)
    A(t[118], a[3917]); -- Call of the Crusade (10 player)
    A(t[118], a[3918]); -- Call of the Grand Crusade (10 player)
    A(t[118], a[3808]); -- A Tribute to Skill (10 player)
    A(t[118], a[3809]); -- A Tribute to Mad Skill (10 player)
    A(t[118], a[3810]); -- A Tribute to Insanity (10 player)
    A(t[118], a[4080]); -- A Tribute to Dedicated Insanity
    t[119] = c:New((GetDifficultyInfo(4))); -- Trial of the Crusader 25
    C(t[117], t[119]);
    A(t[119], a[3813]); -- Upper Back Pain (25 player)
    A(t[119], a[3937]); -- "Not One, But Two Jormungars (25 player)"
    A(t[119], a[3997]); -- Three Sixty Pain Spike (25 player)
    A(t[119], a[3814]); -- Resilience Will Fix It (25 player)
    A(t[119], a[3815]); -- Salt and Pepper (25 player)
    A(t[119], a[3816]); -- The Traitor King (25 player)
    A(t[119], a[3916]); -- Call of the Crusade (25 player)
    A(t[119], a[3812]); -- Call of the Grand Crusade (25 player)
    A(t[119], a[3817]); -- A Tribute to Skill (25 player)
    A(t[119], a[3818]); -- A Tribute to Mad Skill (25 player)
    A(t[119], a[3819]); -- A Tribute to Insanity (25 player)
    A(t[119], a[4156]); -- A Tribute to Immortality
    A(t[119], a[4079]); -- A Tribute to Immortality
    t[120] = c:New(k.GetInstanceInfoName(760)); -- Onyxia's Lair
    C(t[85], t[120]);
    t[121] = c:New((GetDifficultyInfo(3))); -- Onyxia's Lair 10
    C(t[120], t[121]);
    A(t[121], a[4402]); -- More Dots! (10 player)
    A(t[121], a[4403]); -- Many Whelps! Handle It! (10 player)
    A(t[121], a[4404]); -- She Deep Breaths More (10 player)
    A(t[121], a[4396]); -- Onyxia's Lair (10 player)
    t[122] = c:New((GetDifficultyInfo(4))); -- Onyxia's Lair 25
    C(t[120], t[122]);
    A(t[122], a[4405]); -- More Dots! (25 player)
    A(t[122], a[4406]); -- Many Whelps! Handle It! (25 player)
    A(t[122], a[4407]); -- She Deep Breaths More (25 player)
    A(t[122], a[4397]); -- Onyxia's Lair (25 player)
    t[123] = c:New(k.GetInstanceInfoName(758)); -- Icecrown Citadel
    C(t[85], t[123]);
    A(t[123], a[4625]); -- Invincible's Reins
    A(t[123], a[4623]); -- Shadowmourne
    t[124] = c:New((GetDifficultyInfo(3))); -- Icecrown Citadel 10
    C(t[123], t[124]);
    A(t[124], a[4534]); -- Boned (10 player)
    A(t[124], a[4535]); -- Full House (10 player)
    A(t[124], a[4536]); -- I'm on a Boat (10 player)
    A(t[124], a[4537]); -- I've Gone and Made a Mess (10 player)
    A(t[124], a[4577]); -- Flu Shot Shortage (10 player)
    A(t[124], a[4538]); -- Dances with Oozes (10 player)
    A(t[124], a[4578]); -- "Nausea, Heartburn, Indigestion... (10 player)"
    A(t[124], a[4582]); -- The Orb Whisperer (10 player)
    A(t[124], a[4539]); -- "Once Bitten, Twice Shy (10 player)"
    A(t[124], a[4579]); -- Portal Jockey (10 player)
    A(t[124], a[4580]); -- All You Can Eat (10 player)
    A(t[124], a[4601]); -- Been Waiting a Long Time for This (10 player)
    A(t[124], a[4581]); -- Neck-Deep in Vile (10 player)
    A(t[124], a[4531]); -- Storming the Citadel (10 player)
    A(t[124], a[4528]); -- The Plagueworks (10 player)
    A(t[124], a[4529]); -- The Crimson Hall (10 player)
    A(t[124], a[4527]); -- The Frostwing Halls (10 player)
    A(t[124], a[4530]); -- The Frozen Throne (10 player)
    A(t[124], a[4532]); -- Fall of the Lich King (10 player)
    A(t[124], a[4628]); -- Heroic: Storming the Citadel (10 player)
    A(t[124], a[4629]); -- Heroic: The Plagueworks (10 player)
    A(t[124], a[4630]); -- Heroic: The Crimson Hall (10 player)
    A(t[124], a[4631]); -- Heroic: The Frostwing Halls (10 player)
    A(t[124], a[4583]); -- Bane of the Fallen King
    A(t[124], a[4636]); -- Heroic: Fall of the Lich King (10 player)
    t[125] = c:New((GetDifficultyInfo(4))); -- Icecrown Citadel 25
    C(t[123], t[125]);
    A(t[125], a[4610]); -- Boned (25 player)
    A(t[125], a[4611]); -- Full House (25 player)
    A(t[125], a[4612]); -- I'm on a Boat (25 player)
    A(t[125], a[4613]); -- I've Gone and Made a Mess (25 player)
    A(t[125], a[4615]); -- Flu Shot Shortage (25 player)
    A(t[125], a[4614]); -- Dances with Oozes (25 player)
    A(t[125], a[4616]); -- "Nausea, Heartburn, Indigestion... (25 player)"
    A(t[125], a[4617]); -- The Orb Whisperer (25 player)
    A(t[125], a[4618]); -- "Once Bitten, Twice Shy (25 player)"
    A(t[125], a[4619]); -- Portal Jockey (25 player)
    A(t[125], a[4620]); -- All You Can Eat (25 player)
    A(t[125], a[4621]); -- Been Waiting a Long Time for This (25 player)
    A(t[125], a[4622]); -- Neck-Deep in Vile (25 player)
    A(t[125], a[4604]); -- Storming the Citadel (25 player)
    A(t[125], a[4605]); -- The Plagueworks (25 player)
    A(t[125], a[4606]); -- The Crimson Hall (25 player)
    A(t[125], a[4607]); -- The Frostwing Halls (25 player)
    A(t[125], a[4597]); -- The Frozen Throne (25 player)
    A(t[125], a[4608]); -- Fall of the Lich King (25 player)
    A(t[125], a[4632]); -- Heroic: Storming the Citadel (25 player)
    A(t[125], a[4633]); -- Heroic: The Plagueworks (25 player)
    A(t[125], a[4634]); -- Heroic: The Crimson Hall (25 player)
    A(t[125], a[4635]); -- Heroic: The Frostwing Halls (25 player)
    A(t[125], a[4584]); -- The Light of Dawn
    A(t[125], a[4637]); -- Heroic: Fall of the Lich King (25 player)
    t[615] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[123], t[615]);
    A(t[615], a[4598]); -- The Ashen Verdict
    t[126] = c:New(k.GetInstanceInfoName(761)); -- The Ruby Sanctum
    C(t[85], t[126]);
    t[127] = c:New((GetDifficultyInfo(3))); -- The Ruby Sanctum 10
    C(t[126], t[127]);
    A(t[127], a[4817]); -- The Twilight Destroyer (10 player)
    A(t[127], a[4818]); -- Heroic: The Twilight Destroyer (10 player)
    t[128] = c:New((GetDifficultyInfo(4))); -- The Ruby Sanctum 25
    C(t[126], t[128]);
    A(t[128], a[4815]); -- The Twilight Destroyer (25 player)
    A(t[128], a[4816]); -- Heroic: The Twilight Destroyer (25 player)
    t[787] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[83], t[787]);
    t[1138] = c:New(k.GetCategoryInfoTitle(14901)); -- Wintergrasp
    C(t[83], t[1138]);
    A(t[1138], a[1717]); -- Wintergrasp Victory
    A(t[1138], a[1718]); -- Wintergrasp Veteran
    A(t[1138], a[1755]); -- Within Our Grasp
    A(t[1138], a[2199]); -- Wintergrasp Ranger
    A(t[1138], a[2080]); -- Black War Mammoth
    A(t[1138], a[1737]); -- Destruction Derby
    A(t[1138], a[2476]); -- Destruction Derby
    A(t[1138], a[1723]); -- Vehicular Gnomeslaughter
    A(t[1138], a[1727]); -- Leaning Tower
    A(t[1138], a[1751]); -- Didn't Stand a Chance
    A(t[1138], a[1752]); -- Master of Wintergrasp
    t[781] = c:New(k.GetCategoryInfoTitle(14941)); -- Argent Tournament
    C(t[83], t[781]);
    A(t[781], a[2756]); -- Argent Aspiration
    A(t[781], a[2758]); -- Argent Valor
    A(t[781], a[2772]); -- Tilted!
    A(t[781], a[2836]); -- Lance a Lot
    A(t[781], a[2773]); -- It's Just a Flesh Wound
    A(t[781], a[3736]); -- Pony Up!
    A(t[781], a[2777]); -- Champion of Darnassus
    A(t[781], a[2787]); -- Champion of the Undercity
    A(t[781], a[2760]); -- Exalted Champion of Darnassus
    A(t[781], a[2769]); -- Exalted Champion of the Undercity
    A(t[781], a[2778]); -- Champion of the Exodar
    A(t[781], a[2785]); -- Champion of Silvermoon City
    A(t[781], a[2761]); -- Exalted Champion of the Exodar
    A(t[781], a[2767]); -- Exalted Champion of Silvermoon City
    A(t[781], a[2779]); -- Champion of Gnomeregan
    A(t[781], a[2786]); -- Champion of Thunder Bluff
    A(t[781], a[2762]); -- Exalted Champion of Gnomeregan
    A(t[781], a[2768]); -- Exalted Champion of Thunder Bluff
    A(t[781], a[2780]); -- Champion of Ironforge
    A(t[781], a[2784]); -- Champion of Sen'jin
    A(t[781], a[2763]); -- Exalted Champion of Ironforge
    A(t[781], a[2766]); -- Exalted Champion of Sen'jin
    A(t[781], a[2781]); -- Champion of Stormwind
    A(t[781], a[2783]); -- Champion of Orgrimmar
    A(t[781], a[2764]); -- Exalted Champion of Stormwind
    A(t[781], a[2765]); -- Exalted Champion of Orgrimmar
    A(t[781], a[2782]); -- Champion of the Alliance
    A(t[781], a[2788]); -- Champion of the Horde
    A(t[781], a[2770]); -- Exalted Champion of the Alliance
    A(t[781], a[2771]); -- Exalted Champion of the Horde
    A(t[781], a[2817]); -- Exalted Argent Champion of the Alliance
    A(t[781], a[2816]); -- Exalted Argent Champion of the Horde
    A(t[781], a[3676]); -- A Silver Confidant
    A(t[781], a[3677]); -- The Sunreavers
    A(t[781], a[4596]); -- The Sword in the Skull
    t[952] = c:New(k.L["Other"]); -- Other
    C(t[883], t[952]);
    t[1160] = c:New(k.L["Zones"]); -- Zones
    C(t[952], t[1160]);
    t[953] = c:New((select(2, k.GetAchievementInfo(14222)))); -- Exile's Reach
    C(t[1160], t[953]);
    t[1168] = c:New(k.GetCategoryInfoTitle(92)); -- Character
    C(t[952], t[1168]);
    A(t[1168], a[6]); -- Level 10
    A(t[1168], a[7]); -- Level 20
    A(t[1168], a[8]); -- Level 30
    A(t[1168], a[9]); -- Level 40
    A(t[1168], a[10]); -- Level 50 (Legacy)
    A(t[1168], a[11]); -- Level 60 (Legacy)
    A(t[1168], a[12]); -- Level 70 (Legacy)
    A(t[1168], a[13]); -- Level 80 (Legacy)
    A(t[1168], a[16433]); -- Soul of Iron (Season of Mastery)
    A(t[1168], a[546]); -- Safe Deposit
    A(t[1168], a[1176]); -- Got My Mind On My Money
    A(t[1168], a[1177]); -- Got My Mind On My Money
    A(t[1168], a[1178]); -- Got My Mind On My Money
    A(t[1168], a[1180]); -- Got My Mind On My Money
    A(t[1168], a[1181]); -- Got My Mind On My Money
    A(t[1168], a[891]); -- Giddy Up!
    A(t[1168], a[889]); -- Fast and Furious
    A(t[1168], a[890]); -- Into the Wild Blue Yonder
    A(t[1168], a[545]); -- Shave and a Haircut
    A(t[1168], a[557]); -- Superior
    A(t[1168], a[556]); -- Epic
    A(t[1168], a[705]); -- Master of Arms
    A(t[1168], a[16]); -- Did Somebody Order a Knuckle Sandwich?
    A(t[1168], a[2716]); -- Dual Talent Specialization
    A(t[1168], a[558]); -- Greedy
    A(t[1168], a[559]); -- Needy
    A(t[1168], a[892]); -- The Right Stuff
    A(t[1168], a[2357]); -- Dreadsteed of Xoroth
    A(t[1168], a[2358]); -- Charger
    A(t[1168], a[2359]); -- Swift Flight Form
    A(t[1168], a[1187]); -- The Keymaster
    t[1159] = c:New(k.GetCategoryInfoTitle(96)); -- Quests
    C(t[952], t[1159]);
    A(t[1159], a[503]); -- 50 Quests Completed
    A(t[1159], a[504]); -- 100 Quests Completed
    A(t[1159], a[505]); -- 250 Quests Completed
    A(t[1159], a[506]); -- 500 Quests Completed
    A(t[1159], a[507]); -- 1000 Quests Completed
    A(t[1159], a[508]); -- 1500 Quests Completed
    A(t[1159], a[32]); -- 2000 Quests Completed
    A(t[1159], a[978]); -- 3000 Quests Completed
    A(t[1159], a[973]); -- 5 Daily Quests Completed
    A(t[1159], a[974]); -- 50 Daily Quests Completed
    A(t[1159], a[975]); -- 200 Daily Quests Completed
    A(t[1159], a[976]); -- 500 Daily Quests Completed
    A(t[1159], a[977]); -- 1000 Daily Quests Completed
    A(t[1159], a[31]); -- A Simple Re-Quest
    A(t[1159], a[1182]); -- The Bread Winner
    t[1161] = c:New(k.GetCategoryInfoTitle(97)); -- Exploration
    C(t[952], t[1161]);
    A(t[1161], a[964]); -- Going Down?
    A(t[1161], a[1244]); -- Well Read
    A(t[1161], a[1832]); -- Tastes Like Chicken
    A(t[1161], a[1833]); -- It's Happy Hour Somewhere
    t[1169] = c:New(k.GetCategoryInfoTitle(168)); -- Dungeons & Raids
    C(t[952], t[1169]);
    A(t[1169], a[4476]); -- Looking For More
    A(t[1169], a[4478]); -- Looking For Multitudes
    t[1149] = c:New(k.GetCategoryInfoTitle(169)); -- Professions
    C(t[952], t[1149]);
    A(t[1149], a[1998]); -- Cooking Award
    A(t[1149], a[1999]); -- 10 Cooking Awards
    A(t[1149], a[2000]); -- 25 Cooking Awards
    A(t[1149], a[2001]); -- 50 Cooking Awards
    A(t[1149], a[2002]); -- 100 Cooking Awards
    A(t[1149], a[1795]); -- Lunch Lady
    A(t[1149], a[1796]); -- Short Order Cook
    A(t[1149], a[1797]); -- Chef de Partie
    A(t[1149], a[1798]); -- Sous Chef
    A(t[1149], a[1799]); -- Chef de Cuisine
    A(t[1149], a[1563]); -- Hail to the Chef
    A(t[1149], a[1784]); -- Hail to the Chef
    A(t[1149], a[153]); -- The Old Gnome and the Sea
    A(t[1149], a[1243]); -- Fish Don't Leave Footprints
    A(t[1149], a[3218]); -- Turtles All the Way Down
    A(t[1149], a[1556]); -- 25 Fish
    A(t[1149], a[1557]); -- 50 Fish
    A(t[1149], a[1558]); -- 100 Fish
    A(t[1149], a[1559]); -- 250 Fish
    A(t[1149], a[1560]); -- 500 Fish
    A(t[1149], a[1561]); -- 1000 Fish
    A(t[1149], a[1516]); -- Accomplished Angler
    A(t[1149], a[141]); -- Ultimate Triage
    t[1150] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[1149], t[1150]);
    A(t[1150], a[116]); -- Professional Journeyman
    A(t[1150], a[731]); -- Professional Expert
    A(t[1150], a[732]); -- Professional Classic Master
    A(t[1150], a[121]); -- Journeyman Cook
    A(t[1150], a[122]); -- Expert Cook
    A(t[1150], a[123]); -- Classic Cook
    A(t[1150], a[126]); -- Journeyman Fisherman
    A(t[1150], a[127]); -- Expert Fisherman
    A(t[1150], a[128]); -- Artisan Fisherman
    A(t[1150], a[1257]); -- The Scavenger
    A(t[1150], a[150]); -- The Fishing Diplomat
    A(t[1150], a[306]); -- Master Angler of Azeroth
    A(t[1150], a[878]); -- One That Didn't Get Away
    A(t[1150], a[1836]); -- Old Crafty
    A(t[1150], a[1837]); -- Old Ironjaw
    A(t[1150], a[131]); -- Journeyman Medic
    A(t[1150], a[132]); -- Expert Medic
    A(t[1150], a[133]); -- Artisan Medic
    t[1151] = c:New(k.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    C(t[1149], t[1151]);
    A(t[1151], a[733]); -- Professional Outland Master
    A(t[1151], a[124]); -- Outland Cook
    A(t[1151], a[877]); -- The Cake Is Not A Lie
    A(t[1151], a[906]); -- Kickin' It Up a Notch
    A(t[1151], a[1800]); -- The Outland Gourmet
    A(t[1151], a[1801]); -- Captain Rumsey's Lager
    A(t[1151], a[129]); -- Outland Fisherman
    A(t[1151], a[1257]); -- The Scavenger
    A(t[1151], a[726]); -- Mr. Pinchy's Magical Crawdad Box
    A(t[1151], a[144]); -- The Lurker Above
    A(t[1151], a[905]); -- Old Man Barlowned
    A(t[1151], a[1225]); -- Outland Angler
    A(t[1151], a[134]); -- Master Medic
    t[1152] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[1149], t[1152]);
    A(t[1152], a[734]); -- Professional Northrend Master
    A(t[1152], a[735]); -- Working In the Cold
    A(t[1152], a[125]); -- Northrend Cook
    A(t[1152], a[1777]); -- The Northrend Gourmet
    A(t[1152], a[1778]); -- The Northrend Gourmet
    A(t[1152], a[1779]); -- The Northrend Gourmet
    A(t[1152], a[1780]); -- Second That Emotion
    A(t[1152], a[1781]); -- Critter Gitter
    A(t[1152], a[1785]); -- Dinner Impossible
    A(t[1152], a[3296]); -- Cooking with Style
    A(t[1152], a[1782]); -- Our Daily Bread
    A(t[1152], a[1783]); -- Our Daily Bread
    A(t[1152], a[130]); -- Northrend Fisherman
    A(t[1152], a[1517]); -- Northrend Angler
    A(t[1152], a[3217]); -- Chasing Marcia
    A(t[1152], a[2094]); -- A Penny For Your Thoughts
    A(t[1152], a[2095]); -- Silver in the City
    A(t[1152], a[1957]); -- There's Gold In That There Fountain
    A(t[1152], a[2096]); -- The Coin Master
    A(t[1152], a[1958]); -- I Smell A Giant Rat
    A(t[1152], a[135]); -- Grand Master Medic
    A(t[1152], a[137]); -- Stocking Up
    A(t[1152], a[730]); -- Skills to Pay the Bills
    t[1163] = c:New(k.GetCategoryInfoTitle(201)); -- Reputation
    C(t[952], t[1163]);
    A(t[1163], a[522]); -- Somebody Likes Me
    A(t[1163], a[523]); -- 5 Exalted Reputations
    A(t[1163], a[524]); -- 10 Exalted Reputations
    A(t[1163], a[521]); -- 15 Exalted Reputations
    A(t[1163], a[520]); -- 20 Exalted Reputations
    A(t[1163], a[519]); -- 25 Exalted Reputations
    A(t[1163], a[518]); -- 30 Exalted Reputations
    A(t[1163], a[1014]); -- 35 Exalted Reputations
    t[1170] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[952], t[1170]);
    A(t[1170], a[1017]); -- Can I Keep Him?
    A(t[1170], a[15]); -- Plenty of Pets
    A(t[1170], a[1248]); -- Plethora of Pets
    A(t[1170], a[1250]); -- "Shop Smart, Shop Pet...Smart"
    A(t[1170], a[2516]); -- Lil' Game Hunter
    t[1171] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[952], t[1171]);
    A(t[1171], a[621]); -- Represent
    A(t[1171], a[1020]); -- Ten Tabards
    A(t[1171], a[1021]); -- Twenty-Five Tabards
    t[1172] = c:New(k.GetCategoryInfoTitle(81)); -- Feats of Strength
    C(t[952], t[1172]);
    A(t[1172], a[4496]); -- It's Over Nine Thousand!
    A(t[1172], a[3636]); -- Jade Tiger
    A(t[1172], a[3896]); -- Onyx Panther
    t[1370] = c:New(k.L["Tracking Achievements"]); -- Tracking Achievements
    C(t[883], t[1370]);
    t[1370].HasFlexibleData = true;
    tinsert(trackingAchievementsCategories, t[1370]);
    t[1370].IsTracking = true;
    t[1225] = c:New(k.L["Excluded"]); -- Excluded
    C(t[883], t[1225]);
    t[1225].HasFlexibleData = true;
    tinsert(excludedCategories, t[1225]);
    t[884] = c:New(k.L["Events"]); -- TAB - Events
    t[884].TabName = "Events";
    local events = t[884];
    t[1206] = c:New(k.L["Summary"]); -- Summary
    C(t[884], t[1206]);
    t[1206].AlwaysVisible = true;
    t[1206].IsSummary = true;
    t[1218] = c:New(k.L["Watch List"]); -- Watch List
    C(t[884], t[1218]);
    t[1218].HasFlexibleData = true;
    tinsert(watchListCategories, t[1218]);
    t[1218].IsWatchList = true;
    t[1214] = c:New(k.L["Current Zone"]); -- Current Zone
    C(t[884], t[1214]);
    t[1214].HasFlexibleData = true;
    tinsert(currentZoneCategories, t[1214]);
    t[1214].IsCurrentZone = true;
    t[1221] = c:New(k.L["Selected Zone"]); -- Selected Zone
    C(t[884], t[1221]);
    t[1221].HasFlexibleData = true;
    tinsert(selectedZoneCategories, t[1221]);
    t[1221].IsSelectedZone = true;
    t[1398] = c:New(k.L["Search Results"]); -- Search Results
    C(t[884], t[1398]);
    t[1398].HasFlexibleData = true;
    tinsert(searchResultsCategories, t[1398]);
    t[1398].IsSearchResults = true;
    t[918] = c:New(k.L["Holidays"]); -- Holidays
    C(t[884], t[918]);
    A(t[918], a[2144]); -- "What a Long, Strange Trip It's Been"
    A(t[918], a[2145]); -- "What A Long, Strange Trip It's Been"
    t[885] = c:New(k.GetCategoryInfoTitle(160)); -- Lunar Festival
    C(t[918], t[885]);
    A(t[885], a[605]); -- A Coin of Ancestry
    A(t[885], a[606]); -- 5 Coins of Ancestry
    A(t[885], a[607]); -- 10 Coins of Ancestry
    A(t[885], a[608]); -- 25 Coins of Ancestry
    A(t[885], a[609]); -- 50 Coins of Ancestry
    A(t[885], a[626]); -- Lunar Festival Finery
    A(t[885], a[1281]); -- The Rocket's Red Glare
    A(t[885], a[1552]); -- Frenzied Firecracker
    A(t[885], a[937]); -- Elune's Blessing
    A(t[885], a[915]); -- Elders of the Alliance
    A(t[885], a[914]); -- Elders of the Horde
    A(t[885], a[912]); -- Elders of Eastern Kingdoms
    A(t[885], a[911]); -- Elders of Kalimdor
    A(t[885], a[1396]); -- Elders of Northrend
    A(t[885], a[910]); -- Elders of the Dungeons
    A(t[885], a[913]); -- To Honor One's Elders
    t[910] = c:New(k.GetCategoryInfoTitle(187)); -- Love is in the Air
    C(t[918], t[910]);
    A(t[910], a[1701]); -- Be Mine!
    A(t[910], a[260]); -- Charming
    A(t[910], a[1695]); -- Dangerous Love
    A(t[910], a[1699]); -- Fistful of Love
    A(t[910], a[1279]); -- Flirt With Disaster
    A(t[910], a[1280]); -- Flirt With Disaster
    A(t[910], a[1704]); -- I Pitied The Fool
    A(t[910], a[1291]); -- Lonely?
    A(t[910], a[1694]); -- Lovely Luck Is On Your Side
    A(t[910], a[1703]); -- "My Love is Like a Red, Red Rose"
    A(t[910], a[1697]); -- Nation of Adoration
    A(t[910], a[1698]); -- Nation of Adoration
    A(t[910], a[1700]); -- Perma-Peddle
    A(t[910], a[1696]); -- The Rocket's Pink Glare
    A(t[910], a[1188]); -- Shafted!
    A(t[910], a[1702]); -- Sweet Tooth
    A(t[910], a[4624]); -- Tough Love
    A(t[910], a[1707]); -- Fool For Love
    A(t[910], a[1693]); -- Fool For Love
    t[911] = c:New(k.GetCategoryInfoTitle(159)); -- Noblegarden
    C(t[918], t[911]);
    A(t[911], a[2676]); -- I Found One!
    A(t[911], a[2417]); -- Chocolate Lover
    A(t[911], a[2418]); -- Chocoholic
    A(t[911], a[248]); -- Sunday's Finest
    A(t[911], a[249]); -- Dressed for the Occasion
    A(t[911], a[2416]); -- Hard Boiled
    A(t[911], a[2419]); -- Spring Fling
    A(t[911], a[2497]); -- Spring Fling
    A(t[911], a[2421]); -- Noble Garden
    A(t[911], a[2420]); -- Noble Garden
    A(t[911], a[2422]); -- Shake Your Bunny-Maker
    A(t[911], a[2436]); -- Desert Rose
    A(t[911], a[2576]); -- Blushing Bride
    A(t[911], a[2797]); -- Noble Gardener
    A(t[911], a[2798]); -- Noble Gardener
    t[912] = c:New(k.GetCategoryInfoTitle(163)); -- Children's Week
    C(t[918], t[912]);
    A(t[912], a[1791]); -- Home Alone
    A(t[912], a[1788]); -- Bad Example
    A(t[912], a[1789]); -- Daily Chores
    A(t[912], a[1792]); -- "Aw, Isn't It Cute?"
    A(t[912], a[1786]); -- School of Hard Knocks
    A(t[912], a[1790]); -- "Hail To The King, Baby"
    A(t[912], a[275]); -- Veteran Nanny
    A(t[912], a[1793]); -- For the Children
    t[913] = c:New(k.GetCategoryInfoTitle( 161)); -- Midsummer
    C(t[918], t[913]);
    A(t[913], a[263]); -- Ice the Frost Lord
    A(t[913], a[271]); -- Burning Hot Pole Dance
    A(t[913], a[1145]); -- King of the Fire Festival
    A(t[913], a[272]); -- Torch Juggler
    A(t[913], a[1022]); -- Flame Warden of Eastern Kingdoms
    A(t[913], a[1025]); -- Flame Keeper of Eastern Kingdoms
    A(t[913], a[1023]); -- Flame Warden of Kalimdor
    A(t[913], a[1026]); -- Flame Keeper of Kalimdor
    A(t[913], a[1024]); -- Flame Warden of Outland
    A(t[913], a[1027]); -- Flame Keeper of Outland
    A(t[913], a[1034]); -- The Fires of Azeroth
    A(t[913], a[1036]); -- The Fires of Azeroth
    A(t[913], a[1028]); -- Extinguishing Eastern Kingdoms
    A(t[913], a[1031]); -- Extinguishing Eastern Kingdoms
    A(t[913], a[1029]); -- Extinguishing Kalimdor
    A(t[913], a[1032]); -- Extinguishing Kalimdor
    A(t[913], a[1030]); -- Extinguishing Outland
    A(t[913], a[1033]); -- Extinguishing Outland
    A(t[913], a[1035]); -- Desecration of the Horde
    A(t[913], a[1037]); -- Desecration of the Alliance
    A(t[913], a[1038]); -- The Flame Warden
    A(t[913], a[1039]); -- The Flame Keeper
    t[919] = c:New(k.L["Pirates' Day"]); -- Pirates' Day
    C(t[918], t[919]);
    A(t[919], a[3457]); -- The Captain's Booty
    t[914] = c:New(k.GetCategoryInfoTitle(162)); -- Brewfest
    C(t[918], t[914]);
    A(t[914], a[1184]); -- Strange Brew
    A(t[914], a[1203]); -- Strange Brew
    A(t[914], a[1936]); -- Does Your Wolpertinger Linger?
    A(t[914], a[1185]); -- The Brewfest Diet
    A(t[914], a[2796]); -- Brew of the Month
    A(t[914], a[1183]); -- Brew of the Year
    A(t[914], a[1260]); -- Almost Blind Luck
    A(t[914], a[295]); -- Direbrewfest
    A(t[914], a[293]); -- Disturbing the Peace
    A(t[914], a[303]); -- "Have Keg, Will Travel"
    A(t[914], a[1684]); -- Brewmaster
    A(t[914], a[1683]); -- Brewmaster
    A(t[914], a[1292]); -- Yellow Brewfest Stein
    A(t[914], a[1293]); -- Blue Brewfest Stein
    A(t[914], a[4782]); -- Green Brewfest Stein
    A(t[914], a[1186]); -- Down With The Dark Iron
    t[915] = c:New(k.GetCategoryInfoTitle(158)); -- Hallow's End
    C(t[918], t[915]);
    A(t[915], a[972]); -- Trick or Treat!
    A(t[915], a[288]); -- Out With It
    A(t[915], a[255]); -- Bring Me The Head of... Oh Wait
    A(t[915], a[289]); -- The Savior of Hallow's End
    A(t[915], a[979]); -- The Mask Task
    A(t[915], a[284]); -- A Mask for All Occasions
    A(t[915], a[981]); -- That Sparkling Smile
    A(t[915], a[1040]); -- Rotten Hallow
    A(t[915], a[1041]); -- Rotten Hallow
    A(t[915], a[1261]); -- G.N.E.R.D. Rage
    A(t[915], a[291]); -- Check Your Head
    A(t[915], a[283]); -- The Masquerade
    A(t[915], a[292]); -- Sinister Calling
    A(t[915], a[966]); -- Tricks and Treats of Eastern Kingdoms
    A(t[915], a[967]); -- Tricks and Treats of Eastern Kingdoms
    A(t[915], a[963]); -- Tricks and Treats of Kalimdor
    A(t[915], a[965]); -- Tricks and Treats of Kalimdor
    A(t[915], a[969]); -- Tricks and Treats of Outland
    A(t[915], a[968]); -- Tricks and Treats of Outland
    A(t[915], a[970]); -- Tricks and Treats of Azeroth
    A(t[915], a[971]); -- Tricks and Treats of Azeroth
    A(t[915], a[1656]); -- Hallowed Be Thy Name
    A(t[915], a[1657]); -- Hallowed Be Thy Name
    t[920] = c:New(k.L["Day of the Dead"]); -- Day of the Dead
    C(t[918], t[920]);
    A(t[920], a[3456]); -- Dead Man's Party
    t[916] = c:New(k.GetCategoryInfoTitle(14981)); -- Pilgrim's Bounty
    C(t[918], t[916]);
    A(t[916], a[3579]); -- """FOOD FIGHT!"""
    A(t[916], a[3576]); -- Now We're Cookin'
    A(t[916], a[3577]); -- Now We're Cookin'
    A(t[916], a[3556]); -- Pilgrim's Paunch
    A(t[916], a[3557]); -- Pilgrim's Paunch
    A(t[916], a[3580]); -- Pilgrim's Peril
    A(t[916], a[3581]); -- Pilgrim's Peril
    A(t[916], a[3596]); -- Pilgrim's Progress
    A(t[916], a[3597]); -- Pilgrim's Progress
    A(t[916], a[3558]); -- Sharing is Caring
    A(t[916], a[3582]); -- Terokkar Turkey Time
    A(t[916], a[3578]); -- The Turkinator
    A(t[916], a[3559]); -- Turkey Lurkey
    A(t[916], a[3478]); -- Pilgrim
    A(t[916], a[3656]); -- Pilgrim
    t[917] = c:New(k.GetCategoryInfoTitle(156)); -- Winter Veil
    C(t[918], t[917]);
    A(t[917], a[273]); -- On Metzen!
    A(t[917], a[252]); -- With a Little Helper from My Friends
    A(t[917], a[259]); -- Scrooge
    A(t[917], a[1255]); -- Scrooge
    A(t[917], a[1282]); -- Fa-la-la-la-Ogri'la
    A(t[917], a[277]); -- 'Tis the Season
    A(t[917], a[1295]); -- Crashin' & Thrashin'
    A(t[917], a[279]); -- Simply Abominable
    A(t[917], a[1687]); -- Let It Snow
    A(t[917], a[1685]); -- Holiday Bromance
    A(t[917], a[1686]); -- Holiday Bromance
    A(t[917], a[1688]); -- The Winter Veil Gourmet
    A(t[917], a[1689]); -- He Knows If You've Been Naughty
    A(t[917], a[1690]); -- A Frosty Shake
    A(t[917], a[4436]); -- BB King
    A(t[917], a[4437]); -- BB King
    A(t[917], a[1692]); -- Merrymaker
    A(t[917], a[1691]); -- Merrymaker
    t[950] = c:New(k.L["Gifts"], true); -- Gifts
    C(t[917], t[950]);
    A(t[950], a[1705]); -- Clockwork Rocket Bot
    A(t[950], a[1706]); -- Crashin' Thrashin' Racer
    t[1173] = c:New(k.L["WoW's Anniversary"]); -- WoW's Anniversary
    C(t[884], t[1173]);
    A(t[1173], a[2398]); -- WoW's 4th Anniversary
    A(t[1173], a[4400]); -- WoW's 5th Anniversary
    t[925] = c:New(k.GetCategoryInfoTitle(15101)); -- Darkmoon Faire
    C(t[884], t[925]);
    t[1030] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[925], t[1030]);
    A(t[1030], a[2336]); -- Insane in the Membrane
    t[951] = c:New(k.GetCategoryInfoTitle(15454)); -- Timewalking
    C(t[884], t[951]);
    t[954] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[951], t[954]);
    t[1174] = c:New(k.L["Miscellaneous"]); -- Miscellaneous
    C(t[884], t[1174]);
    A(t[1174], a[1636]); -- Competitor's Tabard
    A(t[1174], a[1637]); -- Spirit of Competition
    A(t[1174], a[2079]); -- Tabard of the Protector
    A(t[1174], a[2116]); -- Tabard of the Argent Dawn
    t[1369] = c:New(k.L["Tracking Achievements"]); -- Tracking Achievements
    C(t[884], t[1369]);
    t[1369].HasFlexibleData = true;
    tinsert(trackingAchievementsCategories, t[1369]);
    t[1369].IsTracking = true;
    t[1226] = c:New(k.L["Excluded"]); -- Excluded
    C(t[884], t[1226]);
    t[1226].HasFlexibleData = true;
    tinsert(excludedCategories, t[1226]);
    t[955] = c:New(k.GetCategoryInfoTitle(95)); -- TAB - PvP
    t[955].TabName = "PvP";
    local pvp = t[955];
    t[1205] = c:New(k.L["Summary"]); -- Summary
    C(t[955], t[1205]);
    t[1205].AlwaysVisible = true;
    t[1205].IsSummary = true;
    t[1219] = c:New(k.L["Watch List"]); -- Watch List
    C(t[955], t[1219]);
    t[1219].HasFlexibleData = true;
    tinsert(watchListCategories, t[1219]);
    t[1219].IsWatchList = true;
    t[1215] = c:New(k.L["Current Zone"]); -- Current Zone
    C(t[955], t[1215]);
    t[1215].HasFlexibleData = true;
    tinsert(currentZoneCategories, t[1215]);
    t[1215].IsCurrentZone = true;
    t[1222] = c:New(k.L["Selected Zone"]); -- Selected Zone
    C(t[955], t[1222]);
    t[1222].HasFlexibleData = true;
    tinsert(selectedZoneCategories, t[1222]);
    t[1222].IsSelectedZone = true;
    t[1397] = c:New(k.L["Search Results"]); -- Search Results
    C(t[955], t[1397]);
    t[1397].HasFlexibleData = true;
    tinsert(searchResultsCategories, t[1397]);
    t[1397].IsSearchResults = true;
    t[1162] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[955], t[1162]);
    A(t[1162], a[238]); -- An Honorable Kill
    A(t[1162], a[513]); -- 100 Honorable Kills
    A(t[1162], a[515]); -- 500 Honorable Kills
    A(t[1162], a[516]); -- 1000 Honorable Kills
    A(t[1162], a[512]); -- 5000 Honorable Kills
    A(t[1162], a[509]); -- 10000 Honorable Kills
    A(t[1162], a[239]); -- 25000 Honorable Kills
    A(t[1162], a[869]); -- 50000 Honorable Kills
    A(t[1162], a[870]); -- 100000 Honorable Kills
    A(t[1162], a[1157]); -- Duel-icious
    A(t[1162], a[245]); -- That Takes Class
    A(t[1162], a[246]); -- Know Thy Enemy
    A(t[1162], a[1005]); -- Know Thy Enemy
    A(t[1162], a[247]); -- "Make Love, Not Warcraft"
    A(t[1162], a[727]); -- Call in the Cavalry
    A(t[1162], a[3618]); -- Murkimus the Gladiator
    A(t[1162], a[701]); -- Freedom of the Alliance
    A(t[1162], a[700]); -- Freedom of the Horde
    t[1167] = c:New(k.GetCategoryInfoTitle(15266)); -- Honor
    C(t[955], t[1167]);
    t[1165] = c:New(k.GetCategoryInfoTitle(153)); -- Battlegrounds
    C(t[955], t[1165]);
    A(t[1165], a[229]); -- The Grim Reaper
    A(t[1165], a[907]); -- The Justicar
    A(t[1165], a[714]); -- The Conqueror
    A(t[1165], a[908]); -- Call to Arms!
    A(t[1165], a[909]); -- Call to Arms!
    A(t[1165], a[227]); -- Damage Control
    A(t[1165], a[231]); -- Wrecking Ball
    A(t[1165], a[230]); -- Battlemaster
    A(t[1165], a[1175]); -- Battlemaster
    t[960] = c:New(k.GetCategoryInfoTitle(14801)); -- Alterac Valley
    C(t[1165], t[960]);
    A(t[960], a[218]); -- Alterac Valley Victory
    A(t[960], a[219]); -- Alterac Valley Veteran
    A(t[960], a[221]); -- Alterac Grave Robber
    A(t[960], a[222]); -- Tower Defense
    A(t[960], a[1151]); -- Loyal Defender
    A(t[960], a[224]); -- Loyal Defender
    A(t[960], a[225]); -- Everything Counts
    A(t[960], a[1164]); -- Everything Counts
    A(t[960], a[223]); -- The Sickly Gazelle
    A(t[960], a[220]); -- Stormpike Perfection
    A(t[960], a[873]); -- Frostwolf Perfection
    A(t[960], a[582]); -- Alterac Valley All-Star
    A(t[960], a[707]); -- Stormpike Battle Charger
    A(t[960], a[706]); -- Frostwolf Howler
    A(t[960], a[1166]); -- To the Looter Go the Spoils
    A(t[960], a[1167]); -- Master of Alterac Valley
    A(t[960], a[1168]); -- Master of Alterac Valley
    A(t[960], a[226]); -- The Alterac Blitz
    A(t[960], a[709]); -- Hero of the Stormpike Guard
    A(t[960], a[708]); -- Hero of the Frostwolf Clan
    t[956] = c:New(k.GetCategoryInfoTitle(14802)); -- Arathi Basin
    C(t[1165], t[956]);
    A(t[956], a[154]); -- Arathi Basin Victory
    A(t[956], a[155]); -- Arathi Basin Veteran
    A(t[956], a[165]); -- Arathi Basin Perfection
    A(t[956], a[158]); -- Me and the Cappin' Makin' it Happen
    A(t[956], a[73]); -- Disgracin' The Basin
    A(t[956], a[1153]); -- Overly Defensive
    A(t[956], a[157]); -- To The Rescue!
    A(t[956], a[161]); -- Resilient Victory
    A(t[956], a[156]); -- Territorial Dominance
    A(t[956], a[159]); -- Let's Get This Done
    A(t[956], a[162]); -- We Had It All Along *cough*
    A(t[956], a[583]); -- Arathi Basin All-Star
    A(t[956], a[584]); -- Arathi Basin Assassin
    A(t[956], a[1169]); -- Master of Arathi Basin
    A(t[956], a[1170]); -- Master of Arathi Basin
    A(t[956], a[711]); -- Knight of Arathor
    A(t[956], a[710]); -- The Defiler
    t[961] = c:New(k.GetCategoryInfoTitle(15414)); -- Ashran
    C(t[1165], t[961]);
    t[964] = c:New(k.GetCategoryInfoTitle(15073)); -- Battle for Gilneas
    C(t[1165], t[964]);
    t[957] = c:New(k.GetCategoryInfoTitle(15218)); -- Deepwind Gorge
    C(t[1165], t[957]);
    t[959] = c:New(k.GetCategoryInfoTitle(14803)); -- Eye of the Storm
    C(t[1165], t[959]);
    A(t[959], a[208]); -- Eye of the Storm Victory
    A(t[959], a[209]); -- Eye of the Storm Veteran
    A(t[959], a[783]); -- The Perfect Storm
    A(t[959], a[784]); -- Eye of the Storm Domination
    A(t[959], a[214]); -- Flurry
    A(t[959], a[213]); -- Stormtrooper
    A(t[959], a[212]); -- Storm Capper
    A(t[959], a[216]); -- Bound for Glory
    A(t[959], a[233]); -- Bloodthirsty Berserker
    A(t[959], a[1171]); -- Master of Eye of the Storm
    A(t[959], a[587]); -- Stormy Assassin
    A(t[959], a[1258]); -- Take a Chill Pill
    A(t[959], a[211]); -- Storm Glory
    t[962] = c:New(k.GetCategoryInfoTitle(15003)); -- Isle of Conquest
    C(t[1165], t[962]);
    A(t[962], a[3776]); -- Isle of Conquest Victory
    A(t[962], a[3777]); -- Isle of Conquest Veteran
    A(t[962], a[3851]); -- Mine
    A(t[962], a[4177]); -- Mine
    A(t[962], a[3847]); -- Four Car Garage
    A(t[962], a[3848]); -- A-bomb-inable
    A(t[962], a[3849]); -- A-bomb-ination
    A(t[962], a[3850]); -- Mowed Down
    A(t[962], a[3852]); -- Cut the Blue Wire... No the Red Wire!
    A(t[962], a[3853]); -- All Over the Isle
    A(t[962], a[3854]); -- Back Door Job
    A(t[962], a[3856]); -- Demolition Derby
    A(t[962], a[4256]); -- Demolition Derby
    A(t[962], a[3855]); -- Glaive Grave
    A(t[962], a[3857]); -- Master of Isle of Conquest
    A(t[962], a[3957]); -- Master of Isle of Conquest
    A(t[962], a[3845]); -- Isle of Conquest All-Star
    A(t[962], a[3846]); -- Resource Glut
    A(t[962], a[4176]); -- Resource Glut
    t[968] = c:New(k.GetCategoryInfoTitle(15292)); -- Seething Shore
    C(t[1165], t[968]);
    t[966] = c:New(k.GetCategoryInfoTitle(15162)); -- Silvershard Mines
    C(t[1165], t[966]);
    t[973] = c:New(k.L["Strand of the Ancients"]); -- Strand of the Ancients
    C(t[1165], t[973]);
    A(t[973], a[1308]); -- Strand of the Ancients Victory
    A(t[973], a[1309]); -- Strand of the Ancients Veteran
    A(t[973], a[1310]); -- Storm the Beach
    A(t[973], a[1765]); -- Steady Hands
    A(t[973], a[1761]); -- The Dapper Sapper
    A(t[973], a[2193]); -- Explosives Expert
    A(t[973], a[1762]); -- Not Even a Scratch
    A(t[973], a[2192]); -- Not Even a Scratch
    A(t[973], a[1763]); -- Artillery Veteran
    A(t[973], a[2189]); -- Artillery Expert
    A(t[973], a[1764]); -- Drop It!
    A(t[973], a[2190]); -- Drop It Now!
    A(t[973], a[1766]); -- Ancient Protector
    A(t[973], a[2191]); -- Ancient Courtyard Protector
    A(t[973], a[1757]); -- Defense of the Ancients
    A(t[973], a[2200]); -- Defense of the Ancients
    A(t[973], a[2194]); -- Master of Strand of the Ancients
    A(t[973], a[2195]); -- Master of Strand of the Ancients
    t[967] = c:New(k.GetCategoryInfoTitle(15163)); -- Temple of Kotmogu
    C(t[1165], t[967]);
    t[965] = c:New(k.GetCategoryInfoTitle(15074)); -- Twin Peaks
    C(t[1165], t[965]);
    t[958] = c:New(k.GetCategoryInfoTitle(14804)); -- Warsong Gulch
    C(t[1165], t[958]);
    A(t[958], a[166]); -- Warsong Gulch Victory
    A(t[958], a[167]); -- Warsong Gulch Veteran
    A(t[958], a[199]); -- Capture the Flag
    A(t[958], a[200]); -- Persistent Defender
    A(t[958], a[872]); -- Frenzied Defender
    A(t[958], a[168]); -- Warsong Gulch Perfection
    A(t[958], a[201]); -- Warsong Expedience
    A(t[958], a[204]); -- Ironman
    A(t[958], a[203]); -- Not In My House
    A(t[958], a[1251]); -- Not In My House
    A(t[958], a[202]); -- Quick Cap
    A(t[958], a[1502]); -- Quick Cap
    A(t[958], a[206]); -- Supreme Defender
    A(t[958], a[1252]); -- Supreme Defender
    A(t[958], a[207]); -- Save the Day
    A(t[958], a[1172]); -- Master of Warsong Gulch
    A(t[958], a[1173]); -- Master of Warsong Gulch
    A(t[958], a[1259]); -- Not So Fast
    A(t[958], a[713]); -- Silverwing Sentinel
    A(t[958], a[712]); -- Warsong Outrider
    t[963] = c:New(k.GetCategoryInfoTitle(14901)); -- Wintergrasp
    C(t[1165], t[963]);
    A(t[963], a[1717]); -- Wintergrasp Victory
    A(t[963], a[1718]); -- Wintergrasp Veteran
    A(t[963], a[1755]); -- Within Our Grasp
    A(t[963], a[2199]); -- Wintergrasp Ranger
    A(t[963], a[2080]); -- Black War Mammoth
    A(t[963], a[1737]); -- Destruction Derby
    A(t[963], a[2476]); -- Destruction Derby
    A(t[963], a[1723]); -- Vehicular Gnomeslaughter
    A(t[963], a[1727]); -- Leaning Tower
    A(t[963], a[1751]); -- Didn't Stand a Chance
    A(t[963], a[1752]); -- Master of Wintergrasp
    A(t[963], a[2776]); -- Master of Wintergrasp
    t[1032] = c:New(k.L["Southshore vs. Tarren Mill"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Southshore vs. Tarren Mill
    C(t[1165], t[1032]);
    t[1166] = c:New(k.GetCategoryInfoTitle(165)); -- Arena
    C(t[955], t[1166]);
    A(t[1166], a[397]); -- Step Into The Arena
    A(t[1166], a[398]); -- Mercilessly Dedicated
    A(t[1166], a[875]); -- Vengefully Dedicated
    A(t[1166], a[876]); -- Brutally Dedicated
    A(t[1166], a[699]); -- World Wide Winner
    A(t[1166], a[399]); -- Just the Two of Us: 1550
    A(t[1166], a[400]); -- Just the Two of Us: 1750
    A(t[1166], a[401]); -- Just the Two of Us: 2000
    A(t[1166], a[1159]); -- Just the Two of Us: 2200
    A(t[1166], a[402]); -- Three's Company: 1550
    A(t[1166], a[403]); -- Three's Company: 1750
    A(t[1166], a[405]); -- Three's Company: 2000
    A(t[1166], a[1160]); -- Three's Company: 2200
    A(t[1166], a[406]); -- High Five: 1550
    A(t[1166], a[407]); -- High Five: 1750
    A(t[1166], a[404]); -- High Five: 2000
    A(t[1166], a[1161]); -- High Five: 2200
    A(t[1166], a[408]); -- Hot Streak
    A(t[1166], a[1162]); -- Hotter Streak
    A(t[1166], a[2090]); -- Challenger
    A(t[1166], a[2093]); -- Rival
    A(t[1166], a[2092]); -- Duelist
    A(t[1166], a[2091]); -- Gladiator
    A(t[1166], a[409]); -- Last Man Standing
    A(t[1166], a[1174]); -- The Arena Master
    t[1131] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[955], t[1131]);
    A(t[1131], a[442]); -- Private
    A(t[1131], a[454]); -- Scout
    A(t[1131], a[470]); -- Corporal
    A(t[1131], a[468]); -- Grunt
    A(t[1131], a[471]); -- Sergeant
    A(t[1131], a[453]); -- Sergeant
    A(t[1131], a[441]); -- Master Sergeant
    A(t[1131], a[450]); -- Senior Sergeant
    A(t[1131], a[440]); -- Sergeant Major
    A(t[1131], a[452]); -- First Sergeant
    A(t[1131], a[439]); -- Knight
    A(t[1131], a[451]); -- Stone Guard
    A(t[1131], a[472]); -- Knight-Lieutenant
    A(t[1131], a[449]); -- Blood Guard
    A(t[1131], a[438]); -- Knight-Captain
    A(t[1131], a[469]); -- Legionnaire
    A(t[1131], a[437]); -- Knight-Champion
    A(t[1131], a[448]); -- Centurion
    A(t[1131], a[436]); -- Lieutenant Commander
    A(t[1131], a[447]); -- Champion
    A(t[1131], a[435]); -- Commander
    A(t[1131], a[444]); -- Lieutenant General
    A(t[1131], a[473]); -- Marshal
    A(t[1131], a[446]); -- General
    A(t[1131], a[434]); -- Field Marshal
    A(t[1131], a[445]); -- Warlord
    A(t[1131], a[433]); -- Grand Marshal
    A(t[1131], a[443]); -- High Warlord
    t[1199] = c:New(k.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    C(t[955], t[1199]);
    A(t[1199], a[418]); -- Merciless Gladiator
    A(t[1199], a[419]); -- Vengeful Gladiator
    A(t[1199], a[420]); -- Brutal Gladiator
    t[1200] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[955], t[1200]);
    A(t[1200], a[3336]); -- Deadly Gladiator
    A(t[1200], a[3436]); -- Furious Gladiator
    A(t[1200], a[3758]); -- Relentless Gladiator
    A(t[1200], a[4599]); -- Wrathful Gladiator
    t[1368] = c:New(k.L["Tracking Achievements"]); -- Tracking Achievements
    C(t[955], t[1368]);
    t[1368].HasFlexibleData = true;
    tinsert(trackingAchievementsCategories, t[1368]);
    t[1368].IsTracking = true;
    t[1227] = c:New(k.L["Excluded"]); -- Excluded
    C(t[955], t[1227]);
    t[1227].HasFlexibleData = true;
    tinsert(excludedCategories, t[1227]);
    t[971] = c:New(k.L["Specials"]); -- TAB - Specials
    t[971].TabName = "Specials";
    local specials = t[971];
    t[1204] = c:New(k.L["Summary"]); -- Summary
    C(t[971], t[1204]);
    t[1204].AlwaysVisible = true;
    t[1204].IsSummary = true;
    t[949] = c:New(k.L["Watch List"]); -- Watch List
    C(t[971], t[949]);
    t[949].HasFlexibleData = true;
    tinsert(watchListCategories, t[949]);
    t[949].IsWatchList = true;
    t[433] = c:New(k.L["Current Zone"]); -- Current Zone
    C(t[971], t[433]);
    t[433].HasFlexibleData = true;
    tinsert(currentZoneCategories, t[433]);
    t[433].IsCurrentZone = true;
    t[850] = c:New(k.L["Selected Zone"]); -- Selected Zone
    C(t[971], t[850]);
    t[850].HasFlexibleData = true;
    tinsert(selectedZoneCategories, t[850]);
    t[850].IsSelectedZone = true;
    t[1396] = c:New(k.L["Search Results"]); -- Search Results
    C(t[971], t[1396]);
    t[1396].HasFlexibleData = true;
    tinsert(searchResultsCategories, t[1396]);
    t[1396].IsSearchResults = true;
    t[972] = c:New(k.L["Bur's Mount Collection"]); -- Bur's Mount Collection
    C(t[971], t[972]);
    A(t[972], a[3356]); -- Winterspring Frostsaber
    A(t[972], a[3357]); -- Venomhide Ravasaur
    t[976] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[972], t[976]);
    A(t[976], a[2141]); -- Stable Keeper
    A(t[976], a[2142]); -- Filling Up The Barn
    A(t[976], a[2143]); -- Leading the Cavalry
    A(t[976], a[2536]); -- Mountain o' Mounts
    A(t[976], a[2537]); -- Mountain o' Mounts
    t[985] = c:New(k.L["Vendor"]); -- Vendor
    C(t[972], t[985]);
    A(t[985], a[2076]); -- Armored Brown Bear
    A(t[985], a[2077]); -- Wooly Mammoth
    A(t[985], a[2078]); -- Traveler's Tundra Mammoth
    t[986] = c:New(k.GetCategoryInfoTitle(169)); -- Professions
    C(t[972], t[986]);
    A(t[986], a[2097]); -- Get to the Choppa!
    t[987] = c:New(k.L["Events"]); -- Events
    C(t[972], t[987]);
    A(t[987], a[416]); -- Scarab Lord
    A(t[987], a[980]); -- The Horseman's Reins
    A(t[987], a[3496]); -- A Brew-FAST Mount
    A(t[987], a[4627]); -- X-45 Heartbreaker
    A(t[987], a[2144]); -- "What a Long, Strange Trip It's Been"
    A(t[987], a[2145]); -- "What A Long, Strange Trip It's Been"
    t[989] = c:New(k.L["Achievements"]); -- Achievements
    C(t[972], t[989]);
    A(t[989], a[879]); -- Old School Ride
    t[979] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[972], t[979]);
    t[983] = c:New(k.L["Drops"], true); -- Drops
    C(t[979], t[983]);
    A(t[983], a[729]); -- Deathcharger's Reins
    A(t[983], a[883]); -- Reins of the Raven Lord
    A(t[983], a[884]); -- Swift White Hawkstrider
    t[980] = c:New(k.L["Glory"], true); -- Glory
    C(t[979], t[980]);
    A(t[980], a[2136]); -- Glory of the Hero
    t[982] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[972], t[982]);
    t[984] = c:New(k.L["Drops"], true); -- Drops
    C(t[982], t[984]);
    A(t[984], a[880]); -- Swift Zulian Tiger
    A(t[984], a[881]); -- Swift Razzashi Raptor
    A(t[984], a[424]); -- Why? Because It's Red
    A(t[984], a[882]); -- Fiery Warhorse's Reins
    A(t[984], a[885]); -- Ashes of Al'ar
    A(t[984], a[430]); -- Amani War Bear
    A(t[984], a[2081]); -- Grand Black War Mammoth
    A(t[984], a[4626]); -- And I'll Form the Head!
    A(t[984], a[4625]); -- Invincible's Reins
    t[981] = c:New(k.L["Glory"], true); -- Glory
    C(t[982], t[981]);
    A(t[981], a[2957]); -- Glory of the Ulduar Raider (10 player)
    A(t[981], a[2958]); -- Glory of the Ulduar Raider (25 player)
    A(t[981], a[4602]); -- Glory of the Icecrown Raider (10 player)
    A(t[981], a[4603]); -- Glory of the Icecrown Raider (25 player)
    t[977] = c:New(k.GetCategoryInfoTitle(95)); -- PvP
    C(t[972], t[977]);
    t[978] = c:New((select(2, k.GetAchievementInfo(2091))), true); -- Gladiator
    C(t[977], t[978]);
    A(t[978], a[886]); -- Swift Nether Drake
    A(t[978], a[887]); -- Merciless Nether Drake
    A(t[978], a[888]); -- Vengeful Nether Drake
    A(t[978], a[2316]); -- Brutal Nether Drake
    A(t[978], a[3096]); -- Deadly Gladiator's Frost Wyrm
    A(t[978], a[3756]); -- Furious Gladiator's Frost Wyrm
    A(t[978], a[3757]); -- Relentless Gladiator's Frost Wyrm
    A(t[978], a[4600]); -- Wrathful Gladiator's Frost Wyrm
    t[988] = c:New(k.L["Recruit-a-Friend"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Recruit-a-Friend
    C(t[972], t[988]);
    A(t[988], a[1436]); -- Friends In High Places
    t[1409] = c:New(k.L["Recruit-a-Friend"]); -- Recruit-a-Friend
    C(t[972], t[1409]);
    t[1043] = c:New(k.L["The Entitled"] .. " " .. (UnitName("player"))); -- The Entitled Player
    C(t[971], t[1043]);
    t[1045] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[1043], t[1045]);
    t[1065] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1045], t[1065]);
    A(t[1065], a[948]); -- Ambassador of the Alliance
    A(t[1065], a[762]); -- Ambassador of the Horde
    A(t[1065], a[871]); -- "Avast Ye, Admiral!"
    A(t[1065], a[2336]); -- Insane in the Membrane
    t[1047] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[1043], t[1047]);
    t[1054] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1047], t[1054]);
    A(t[1054], a[942]); -- The Diplomat
    A(t[1054], a[943]); -- The Diplomat
    A(t[1054], a[4598]); -- The Ashen Verdict
    A(t[1054], a[953]); -- Guardian of Cenarius
    A(t[1054], a[945]); -- The Argent Champion
    A(t[1054], a[2764]); -- Exalted Champion of Stormwind
    A(t[1054], a[2765]); -- Exalted Champion of Orgrimmar
    A(t[1054], a[2763]); -- Exalted Champion of Ironforge
    A(t[1054], a[2769]); -- Exalted Champion of the Undercity
    A(t[1054], a[2760]); -- Exalted Champion of Darnassus
    A(t[1054], a[2768]); -- Exalted Champion of Thunder Bluff
    A(t[1054], a[2761]); -- Exalted Champion of the Exodar
    A(t[1054], a[2767]); -- Exalted Champion of Silvermoon City
    A(t[1054], a[2762]); -- Exalted Champion of Gnomeregan
    A(t[1054], a[2766]); -- Exalted Champion of Sen'jin
    A(t[1054], a[2817]); -- Exalted Argent Champion of the Alliance
    A(t[1054], a[2816]); -- Exalted Argent Champion of the Horde
    t[1057] = c:New(k.GetCategoryInfoTitle(15272), true); -- Dungeons
    C(t[1047], t[1057]);
    t[1056] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1047], t[1056]);
    A(t[1056], a[2051]); -- The Twilight Zone (10 player)
    A(t[1056], a[2054]); -- The Twilight Zone (25 player)
    A(t[1056], a[1658]); -- Champion of the Frozen Wastes
    A(t[1056], a[3316]); -- Herald of the Titans
    A(t[1056], a[3036]); -- Observed (10 player)
    A(t[1056], a[3037]); -- Observed (25 player)
    A(t[1056], a[4583]); -- Bane of the Fallen King
    A(t[1056], a[4597]); -- The Frozen Throne (25 player)
    A(t[1056], a[4584]); -- The Light of Dawn
    t[1048] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[1043], t[1048]);
    t[1058] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1048], t[1058]);
    t[1059] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1048], t[1059]);
    t[1060] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1048], t[1060]);
    t[1049] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[1043], t[1049]);
    t[1061] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1049], t[1061]);
    t[1062] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1049], t[1062]);
    t[1063] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1049], t[1063]);
    t[1064] = c:New(k.L["Scenarios"], true); -- Scenarios
    C(t[1049], t[1064]);
    t[1050] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[1043], t[1050]);
    t[1066] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1050], t[1066]);
    t[1067] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1050], t[1067]);
    t[1068] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1050], t[1068]);
    t[1069] = c:New(k.L["Garrison"], true); -- Garrison
    C(t[1050], t[1069]);
    t[1051] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[1043], t[1051]);
    t[1074] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1051], t[1074]);
    t[1070] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1051], t[1070]);
    t[1071] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1051], t[1071]);
    t[1072] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1051], t[1072]);
    t[1052] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[1043], t[1052]);
    t[1075] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1052], t[1075]);
    t[1076] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1052], t[1076]);
    t[1077] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1052], t[1077]);
    t[1078] = c:New(k.GetCategoryInfoTitle(15417), true); -- Heart of Azeroth
    C(t[1052], t[1078]);
    t[1079] = c:New(k.GetCategoryInfoTitle(15426), true); -- Visions of N'Zoth
    C(t[1052], t[1079]);
    t[1053] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[1043], t[1053]);
    t[1080] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1053], t[1080]);
    t[1081] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1053], t[1081]);
    t[1082] = c:New(k.GetCategoryInfoTitle(15440), true); -- Torghast
    C(t[1053], t[1082]);
    t[1083] = c:New(k.GetCategoryInfoTitle(15441), true); -- Covenant Sanctums
    C(t[1053], t[1083]);
    t[1084] = c:New(k.L["Other"]); -- Other
    C(t[1043], t[1084]);
    t[1085] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1084], t[1085]);
    A(t[1085], a[978]); -- 3000 Quests Completed
    A(t[1085], a[1681]); -- The Loremaster
    A(t[1085], a[1682]); -- The Loremaster
    t[1086] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1084], t[1086]);
    A(t[1086], a[46]); -- Universal Explorer
    t[1088] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1084], t[1088]);
    A(t[1088], a[1015]); -- 40 Exalted Reputations
    t[1087] = c:New(k.GetCategoryInfoTitle(15272), true); -- Dungeons
    C(t[1084], t[1087]);
    A(t[1087], a[4477]); -- Looking For Many
    t[1089] = c:New(k.GetCategoryInfoTitle(15117), true); -- Pet Battles
    C(t[1084], t[1089]);
    t[1090] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")", true); -- Brawler's Guild
    C(t[1084], t[1090]);
    t[1091] = c:New(k.GetCategoryInfoTitle(15246), true); -- Collections
    C(t[1084], t[1091]);
    t[1092] = c:New(k.GetCategoryInfoTitle(169), true); -- Professions
    C(t[1084], t[1092]);
    A(t[1092], a[1516]); -- Accomplished Angler
    A(t[1092], a[1563]); -- Hail to the Chef
    A(t[1092], a[1784]); -- Hail to the Chef
    t[1094] = c:New(k.L["Events"], true); -- Events
    C(t[1084], t[1094]);
    A(t[1094], a[913]); -- To Honor One's Elders
    A(t[1094], a[1707]); -- Fool For Love
    A(t[1094], a[1693]); -- Fool For Love
    A(t[1094], a[2797]); -- Noble Gardener
    A(t[1094], a[2798]); -- Noble Gardener
    A(t[1094], a[1793]); -- For the Children
    A(t[1094], a[1038]); -- The Flame Warden
    A(t[1094], a[1039]); -- The Flame Keeper
    A(t[1094], a[1684]); -- Brewmaster
    A(t[1094], a[1683]); -- Brewmaster
    A(t[1094], a[1656]); -- Hallowed Be Thy Name
    A(t[1094], a[1657]); -- Hallowed Be Thy Name
    A(t[1094], a[3478]); -- Pilgrim
    A(t[1094], a[3656]); -- Pilgrim
    A(t[1094], a[1692]); -- Merrymaker
    A(t[1094], a[1691]); -- Merrymaker
    t[1093] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1084], t[1093]);
    t[1096] = c:New(k.GetCategoryInfoTitle(15266), true); -- Honor
    C(t[1093], t[1096]);
    A(t[1096], a[870]); -- 100000 Honorable Kills
    t[1095] = c:New(k.GetCategoryInfoTitle(15283), true); -- World
    C(t[1093], t[1095]);
    t[1097] = c:New(k.L["Dueler's Guild"], true); -- Dueler's Guild
    C(t[1093], t[1097]);
    t[1098] = c:New(k.GetCategoryInfoTitle(153), true); -- Battlegrounds
    C(t[1093], t[1098]);
    A(t[1098], a[907]); -- The Justicar
    A(t[1098], a[714]); -- The Conqueror
    A(t[1098], a[230]); -- Battlemaster
    A(t[1098], a[1175]); -- Battlemaster
    t[1099] = c:New(k.L["Rated"], true); -- Rated
    C(t[1093], t[1099]);
    t[1101] = c:New((UnitName("player")) .. " " .. (GetTitleName(334))); -- Player the Fabulous
    C(t[971], t[1101]);
    t[1102] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[1101], t[1102]);
    t[1103] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1101], t[1103]);
    t[1104] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[1101], t[1104]);
    t[1105] = c:New(k.L["Realm First!"]); -- Realm First!
    C(t[971], t[1105]);
    t[1106] = c:New(k.L["Leveling"]); -- Leveling
    C(t[1105], t[1106]);
    t[1107] = c:New(k.L["Level 80"], true); -- Level 80
    C(t[1106], t[1107]);
    A(t[1107], a[457]); -- Realm First! Level 80
    A(t[1107], a[459]); -- Realm First! Level 80 Warrior
    A(t[1107], a[465]); -- Realm First! Level 80 Paladin
    A(t[1107], a[462]); -- Realm First! Level 80 Hunter
    A(t[1107], a[458]); -- Realm First! Level 80 Rogue
    A(t[1107], a[464]); -- Realm First! Level 80 Priest
    A(t[1107], a[461]); -- Realm First! Level 80 Death Knight
    A(t[1107], a[467]); -- Realm First! Level 80 Shaman
    A(t[1107], a[460]); -- Realm First! Level 80 Mage
    A(t[1107], a[463]); -- Realm First! Level 80 Warlock
    A(t[1107], a[466]); -- Realm First! Level 80 Druid
    A(t[1107], a[1408]); -- Realm First! Level 80 Human
    A(t[1107], a[1410]); -- Realm First! Level 80 Orc
    A(t[1107], a[1407]); -- Realm First! Level 80 Dwarf
    A(t[1107], a[1409]); -- Realm First! Level 80 Night Elf
    A(t[1107], a[1413]); -- Realm First! Level 80 Forsaken
    A(t[1107], a[1411]); -- Realm First! Level 80 Tauren
    A(t[1107], a[1404]); -- Realm First! Level 80 Gnome
    A(t[1107], a[1412]); -- Realm First! Level 80 Troll
    A(t[1107], a[1405]); -- Realm First! Level 80 Blood Elf
    A(t[1107], a[1406]); -- Realm First! Level 80 Draenei
    t[1110] = c:New(k.GetCategoryInfoTitle(169)); -- Professions
    C(t[1105], t[1110]);
    t[1111] = c:New(k.L["450 skill"], true); -- 450 skill
    C(t[1110], t[1111]);
    A(t[1111], a[1415]); -- Realm First! Grand Master Alchemist
    A(t[1111], a[1420]); -- Realm First! Grand Master Angler
    A(t[1111], a[1414]); -- Realm First! Grand Master Blacksmith
    A(t[1111], a[1416]); -- Realm First! Grand Master Cook
    A(t[1111], a[1417]); -- Realm First! Grand Master Enchanter
    A(t[1111], a[1418]); -- Realm First! Grand Master Engineer
    A(t[1111], a[1421]); -- Realm First! Grand Master Herbalist
    A(t[1111], a[1423]); -- Realm First! Grand Master Jewelcrafter
    A(t[1111], a[1424]); -- Realm First! Grand Master Leatherworker
    A(t[1111], a[1419]); -- Realm First! Grand Master Medic
    A(t[1111], a[1425]); -- Realm First! Grand Master Miner
    A(t[1111], a[1422]); -- Realm First! Grand Master Scribe
    A(t[1111], a[1426]); -- Realm First! Grand Master Skinner
    A(t[1111], a[1427]); -- Realm First! Grand Master Tailor
    t[1116] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1105], t[1116]);
    A(t[1116], a[1463]); -- Realm First! Northrend Vanguard
    t[1114] = c:New(k.GetCategoryInfoTitle(15272), true); -- Dungeons
    C(t[1105], t[1114]);
    t[1115] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1105], t[1115]);
    A(t[1115], a[1402]); -- Realm First! Conqueror of Naxxramas
    A(t[1115], a[456]); -- Realm First! Obsidian Slayer
    A(t[1115], a[1400]); -- Realm First! Magic Seeker
    A(t[1115], a[3117]); -- Realm First! Death's Demise
    A(t[1115], a[3259]); -- Realm First! Celestial Defender
    A(t[1115], a[4078]); -- Realm First! Grand Crusader
    A(t[1115], a[4576]); -- Realm First! Fall of the Lich King
    t[1117] = c:New(k.GetCategoryInfoTitle(15268)); -- Promotions
    C(t[971], t[1117]);
    A(t[1117], a[414]); -- Tyrael's Hilt
    t[1118] = c:New(k.L["BlizzCon"], true); -- BlizzCon
    C(t[1117], t[1118]);
    A(t[1118], a[411]); -- Murky
    A(t[1118], a[412]); -- Murloc Costume
    A(t[1118], a[415]); -- Big Blizzard Bear
    A(t[1118], a[3536]); -- The Marine Marine
    t[1119] = c:New(k.L["Collector's Edition"], true); -- Collector's Edition
    C(t[1117], t[1119]);
    A(t[1119], a[662]); -- Collector's Edition: Mini-Diablo
    A(t[1119], a[663]); -- Collector's Edition: Panda
    A(t[1119], a[664]); -- Collector's Edition: Zergling
    A(t[1119], a[665]); -- Collector's Edition: Netherwhelp
    A(t[1119], a[683]); -- Collector's Edition: Frost Wyrm Whelp
    A(t[1119], a[16332]); -- The Perfect Pebble
    t[1120] = c:New(k.L["Diablo III"], true); -- Diablo III
    C(t[1117], t[1120]);
    t[1400] = c:New(k.L["Diablo IV"], true); -- Diablo IV
    C(t[1117], t[1400]);
    t[1121] = c:New(k.L["Overwatch"], true); -- Overwatch
    C(t[1117], t[1121]);
    t[1122] = c:New(k.L["StarCraft II"], true); -- StarCraft II
    C(t[1117], t[1122]);
    A(t[1122], a[4824]); -- Collector's Edition: Mini Thor
    t[1123] = c:New(k.L["Hearthstone"], true); -- Hearthstone
    C(t[1117], t[1123]);
    t[1124] = c:New(k.L["Heroes of the Storm"], true); -- Heroes of the Storm
    C(t[1117], t[1124]);
    t[1125] = c:New(k.L["Warcraft III: Reforged"], true); -- Warcraft III: Reforged
    C(t[1117], t[1125]);
    t[1346] = c:New(k.L["Ta's Pet Collection"]); -- Ta's Pet Collection
    C(t[971], t[1346]);
    A(t[1346], a[3478]); -- Pilgrim
    t[1353] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[1346], t[1353]);
    A(t[1353], a[1250]); -- "Shop Smart, Shop Pet...Smart"
    A(t[1353], a[2516]); -- Lil' Game Hunter
    t[1354] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[1346], t[1354]);
    t[1355] = c:New(k.GetCategoryInfoTitle(168)); -- Dungeons & Raids
    C(t[1346], t[1355]);
    t[1357] = c:New(k.GetCategoryInfoTitle(15117) .. " " .. k.GetCategoryInfoTitle(15272)); -- Pet Battles Dungeons
    C(t[1355], t[1357]);
    t[1356] = c:New(k.GetCategoryInfoTitle(15101)); -- Darkmoon Faire
    C(t[1346], t[1356]);
    t[1378] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[1346], t[1378]);
    A(t[1378], a[1956]); -- Higher Learning
    t[1352] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[1346], t[1352]);
    t[1351] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[1346], t[1351]);
    t[1350] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[1346], t[1350]);
    t[1349] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[1346], t[1349]);
    t[1348] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[1346], t[1348]);
    t[1347] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[1346], t[1347]);
    t[1372] = c:New(k.L["Going away with"]); -- Going away with
    C(t[971], t[1372]);
    t[1367] = c:New(k.L["Tracking Achievements"]); -- Tracking Achievements
    C(t[971], t[1367]);
    t[1367].HasFlexibleData = true;
    tinsert(trackingAchievementsCategories, t[1367]);
    t[1367].IsTracking = true;
    t[857] = c:New(k.L["Excluded"]); -- Excluded
    C(t[971], t[857]);
    t[857].HasFlexibleData = true;
    tinsert(excludedCategories, t[857]);

    local tabs = {};
    tabs["Achievements"] = achievements.Children;
    tabs["Expansions"] = expansions.Children;
    tabs["Events"] = events.Children;
    tabs["PvP"] = pvp.Children;
    tabs["Specials"] = specials.Children;
    return tabs, watchListCategories, currentZoneCategories, selectedZoneCategories, searchResultsCategories, trackingAchievementsCategories, excludedCategories;
end

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

