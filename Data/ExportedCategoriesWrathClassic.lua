-- [[ Exported at 2022-11-07 23-44-14 ]] --
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
    local focusedCategories = {};
    local currentZoneCategories = {};
    local selectedZoneCategories = {};
    local trackingAchievementsCategories = {};
    local excludedCategories = {};
    t[1100] = c:New(k.L["Achievements"]); -- TAB - Achievements
    t[1100].TabName = "Achievements";
    local achievements = t[1100];
    t[1202] = c:New(k.L["Summary"]); -- Summary
    C(t[1100], t[1202]);
    t[1202].AlwaysVisible = true;
    t[1202].IsSummary = true;
    t[1216] = c:New(k.L["Focused"]); -- Focused
    C(t[1100], t[1216]);
    t[1216].HasFlexibleData = true;
    tinsert(focusedCategories, t[1216]);
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
    t[1217] = c:New(k.L["Focused"]); -- Focused
    C(t[883], t[1217]);
    t[1217].HasFlexibleData = true;
    tinsert(focusedCategories, t[1217]);
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
    A(t[922], a[14815]); -- Executing the Exarch
    A(t[922], a[388]); -- City Defender
    A(t[922], a[11065]); -- It All Makes Sense Now
    A(t[922], a[603]); -- Wrath of the Horde
    t[1033] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[922], t[1033]);
    A(t[1033], a[9924]); -- Field Photographer
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
    A(t[721], a[11200]); -- Stand Against the Legion
    A(t[721], a[11201]); -- Defender of Azeroth: Legion Invasions
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
    A(t[724], a[9924]); -- Field Photographer
    t[1006] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[722], t[1006]);
    A(t[1006], a[948]); -- Ambassador of the Alliance
    t[725] = c:New(k.GetMapName(1420)); -- Tirisfal Glades
    C(t[687], t[725]);
    t[1201] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[725], t[1201]);
    A(t[1201], a[15579]); -- Return to Lordaeron
    t[726] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[725], t[726]);
    A(t[726], a[768]); -- Explore Tirisfal Glades
    t[1026] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[725], t[1026]);
    A(t[1026], a[762]); -- Ambassador of the Horde
    t[651] = c:New(k.GetMapName(1436)); -- Westfall
    C(t[687], t[651]);
    A(t[651], a[11200]); -- Stand Against the Legion
    A(t[651], a[11201]); -- Defender of Azeroth: Legion Invasions
    t[653] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[651], t[653]);
    A(t[653], a[4903]); -- Westfall Quests
    A(t[653], a[12455]); -- Westfall & Duskwood Quests
    t[730] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[651], t[730]);
    A(t[730], a[802]); -- Explore Westfall
    A(t[730], a[9924]); -- Field Photographer
    t[1028] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[651], t[1028]);
    A(t[1028], a[948]); -- Ambassador of the Alliance
    t[655] = c:New(k.GetMapName(1432)); -- Loch Modan
    C(t[687], t[655]);
    t[657] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[655], t[657]);
    A(t[657], a[4899]); -- Loch Modan Quests
    A(t[657], a[12456]); -- Loch Modan & Wetlands Quests
    t[729] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[655], t[729]);
    A(t[729], a[779]); -- Explore Loch Modan
    A(t[729], a[9924]); -- Field Photographer
    t[1013] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[655], t[1013]);
    A(t[1013], a[948]); -- Ambassador of the Alliance
    t[681] = c:New(k.GetMapName(1421)); -- Silverpine Forest
    C(t[687], t[681]);
    t[682] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[681], t[682]);
    A(t[682], a[4894]); -- Silverpine Forest Quests
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
    A(t[677], a[4902]); -- Redridge Mountains Quests
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
    A(t[654], a[12430]); -- Duskwood Quests
    A(t[654], a[12455]); -- Westfall & Duskwood Quests
    t[735] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[652], t[735]);
    A(t[735], a[778]); -- Explore Duskwood
    A(t[735], a[9924]); -- Field Photographer
    t[1007] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[652], t[1007]);
    A(t[1007], a[948]); -- Ambassador of the Alliance
    t[656] = c:New(k.GetMapName(1437)); -- Wetlands
    C(t[687], t[656]);
    t[658] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[656], t[658]);
    A(t[658], a[12429]); -- Wetlands Quests
    A(t[658], a[12456]); -- Loch Modan & Wetlands Quests
    t[731] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[656], t[731]);
    A(t[731], a[841]); -- Explore Wetlands
    A(t[731], a[9924]); -- Field Photographer
    t[1029] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[656], t[1029]);
    A(t[1029], a[948]); -- Ambassador of the Alliance
    t[671] = c:New(k.GetMapName(1424)); -- Hillsbrad Foothills
    C(t[687], t[671]);
    A(t[671], a[11200]); -- Stand Against the Legion
    A(t[671], a[11201]); -- Defender of Azeroth: Legion Invasions
    t[672] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[671], t[672]);
    A(t[672], a[4895]); -- Hillsbrad Foothills Quests
    t[736] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[671], t[736]);
    A(t[736], a[772]); -- Explore Hillsbrad Foothills
    A(t[736], a[9924]); -- Field Photographer
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
    A(t[650], a[4896]); -- Arathi Highlands Quests
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
    A(t[686], a[4893]); -- Western Plaguelands Quests
    t[746] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[685], t[746]);
    A(t[746], a[770]); -- Explore Western Plaguelands
    A(t[746], a[9924]); -- Field Photographer
    t[1027] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[685], t[1027]);
    A(t[1027], a[948]); -- Ambassador of the Alliance
    A(t[1027], a[762]); -- Ambassador of the Horde
    t[673] = c:New(k.GetMapName(1425)); -- The Hinterlands
    C(t[687], t[673]);
    t[674] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[673], t[674]);
    A(t[674], a[4897]); -- Hinterlands Quests
    t[742] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[673], t[742]);
    A(t[742], a[773]); -- Explore The Hinterlands
    t[1024] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[673], t[1024]);
    A(t[1024], a[762]); -- Ambassador of the Horde
    t[667] = c:New(k.GetMapName(1423)); -- Eastern Plaguelands
    C(t[687], t[667]);
    A(t[667], a[11297]); -- The Balance of Light and Shadow
    t[668] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[667], t[668]);
    A(t[668], a[4892]); -- Eastern Plaguelands Quests
    A(t[668], a[5442]); -- Full Caravan
    t[747] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[667], t[747]);
    A(t[747], a[771]); -- Explore Eastern Plaguelands
    A(t[747], a[9924]); -- Field Photographer
    t[778] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[667], t[778]);
    A(t[778], a[946]); -- The Argent Dawn
    A(t[778], a[945]); -- The Argent Champion
    t[659] = c:New(k.GetMapName(1418)); -- Badlands
    C(t[687], t[659]);
    t[661] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[659], t[661]);
    A(t[661], a[4900]); -- Badlands Quests
    A(t[661], a[5444]); -- "Ready, Set, Goat!"
    t[738] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[659], t[738]);
    A(t[738], a[765]); -- Explore Badlands
    t[679] = c:New(k.GetMapName(1427)); -- Searing Gorge
    C(t[687], t[679]);
    t[680] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[679], t[680]);
    A(t[680], a[4910]); -- Searing Gorge Quests
    t[743] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[679], t[743]);
    A(t[743], a[774]); -- Explore Searing Gorge
    t[683] = c:New(k.GetMapName(1435)); -- Swamp of Sorrows
    C(t[687], t[683]);
    t[684] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[683], t[684]);
    A(t[684], a[4904]); -- Swamp of Sorrows Quests
    t[737] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[683], t[737]);
    A(t[737], a[782]); -- Explore Swamp of Sorrows
    t[1023] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[683], t[1023]);
    A(t[1023], a[948]); -- Ambassador of the Alliance
    t[663] = c:New(k.GetMapName(1428)); -- Burning Steppes
    C(t[687], t[663]);
    A(t[663], a[11296]); -- The Ancient Keeper
    t[664] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[663], t[664]);
    A(t[664], a[4901]); -- Burning Steppes Quests
    t[745] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[663], t[745]);
    A(t[745], a[775]); -- Explore Burning Steppes
    A(t[745], a[9924]); -- Field Photographer
    t[660] = c:New(k.GetMapName(1419)); -- Blasted Lands
    C(t[687], t[660]);
    A(t[660], a[9618]); -- The Iron Invasion
    A(t[660], a[11297]); -- The Balance of Light and Shadow
    t[662] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[660], t[662]);
    A(t[662], a[4909]); -- Blasted Lands Quests
    t[744] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[660], t[744]);
    A(t[744], a[766]); -- Explore Blasted Lands
    A(t[744], a[9924]); -- Field Photographer
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
    A(t[921], a[14817]); -- Opposing Orgrimmar
    A(t[921], a[614]); -- For the Alliance!
    A(t[921], a[1006]); -- City Defender
    A(t[921], a[11065]); -- It All Makes Sense Now
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
    A(t[753], a[9924]); -- Field Photographer
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
    A(t[775], a[9924]); -- Field Photographer
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
    A(t[696], a[4928]); -- Darkshore Quests
    A(t[696], a[5453]); -- Ghosts in the Dark
    t[762] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[695], t[762]);
    A(t[762], a[844]); -- Explore Darkshore
    t[1001] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[695], t[1001]);
    A(t[1001], a[948]); -- Ambassador of the Alliance
    t[691] = c:New(k.GetMapName(1447)); -- Azshara
    C(t[688], t[691]);
    A(t[691], a[11200]); -- Stand Against the Legion
    A(t[691], a[11201]); -- Defender of Azeroth: Legion Invasions
    t[692] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[691], t[692]);
    A(t[692], a[4927]); -- Azshara Quests
    A(t[692], a[5454]); -- Joy Ride
    A(t[692], a[5448]); -- Glutton for Fiery Punishment
    A(t[692], a[5546]); -- Glutton for Icy Punishment
    A(t[692], a[5547]); -- Glutton for Shadowy Punishment
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
    A(t[690], a[4925]); -- Ashenvale Quests
    A(t[690], a[4976]); -- Ashenvale Quests
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
    A(t[710], a[4936]); -- Stonetalon Mountains Quests
    A(t[710], a[4980]); -- Stonetalon Mountains Quests
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
    A(t[698], a[4930]); -- Desolace Quests
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
    A(t[704], a[4932]); -- Feralas Quests
    A(t[704], a[4979]); -- Feralas Quests
    t[769] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[703], t[769]);
    A(t[769], a[849]); -- Explore Feralas
    A(t[769], a[9924]); -- Field Photographer
    t[1009] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[703], t[1009]);
    A(t[1009], a[948]); -- Ambassador of the Alliance
    A(t[1009], a[762]); -- Ambassador of the Horde
    t[699] = c:New(k.GetMapName(1445)); -- Dustwallow Marsh
    C(t[688], t[699]);
    t[700] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[699], t[700]);
    A(t[700], a[4929]); -- Dustwallow Marsh Quests
    A(t[700], a[4978]); -- Dustwallow Marsh Quests
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
    A(t[716], a[4938]); -- Thousand Needles Quests
    t[765] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[715], t[765]);
    A(t[765], a[846]); -- Explore Thousand Needles
    t[994] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[715], t[994]);
    A(t[994], a[948]); -- Ambassador of the Alliance
    A(t[994], a[762]); -- Ambassador of the Horde
    t[713] = c:New(k.GetMapName(1446)); -- Tanaris
    C(t[688], t[713]);
    A(t[713], a[11200]); -- Stand Against the Legion
    A(t[713], a[11201]); -- Defender of Azeroth: Legion Invasions
    t[714] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[713], t[714]);
    A(t[714], a[4935]); -- Tanaris Quests
    t[770] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[713], t[770]);
    A(t[770], a[851]); -- Explore Tanaris
    A(t[770], a[9924]); -- Field Photographer
    t[992] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[713], t[992]);
    A(t[992], a[948]); -- Ambassador of the Alliance
    A(t[992], a[762]); -- Ambassador of the Horde
    A(t[992], a[2336]); -- Insane in the Membrane
    t[701] = c:New(k.GetMapName(1448)); -- Felwood
    C(t[688], t[701]);
    A(t[701], a[11296]); -- The Ancient Keeper
    t[702] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[701], t[702]);
    A(t[702], a[4931]); -- Felwood Quests
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
    A(t[717], a[11296]); -- The Ancient Keeper
    t[718] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[717], t[718]);
    A(t[718], a[4939]); -- Un'Goro Crater Quests
    t[773] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[717], t[773]);
    A(t[773], a[854]); -- Explore Un'Goro Crater
    A(t[773], a[9924]); -- Field Photographer
    t[707] = c:New(k.GetMapName(1451)); -- Silithus
    C(t[688], t[707]);
    A(t[707], a[416]); -- Scarab Lord
    A(t[707], a[5533]); -- Veteran of the Shifting Sands
    A(t[707], a[11296]); -- The Ancient Keeper
    t[708] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[707], t[708]);
    A(t[708], a[4934]); -- Silithus Quests
    t[776] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[707], t[776]);
    A(t[776], a[856]); -- Explore Silithus
    A(t[776], a[9924]); -- Field Photographer
    t[783] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[707], t[783]);
    A(t[783], a[953]); -- Guardian of Cenarius
    t[719] = c:New(k.GetMapName(1452)); -- Winterspring
    C(t[688], t[719]);
    A(t[719], a[3356]); -- Winterspring Frostsaber
    A(t[719], a[11296]); -- The Ancient Keeper
    t[720] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[719], t[720]);
    A(t[720], a[4940]); -- Winterspring Quests
    A(t[720], a[5443]); -- E'ko Madness
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
    A(t[4], a[5366]); -- Ready for Raiding
    A(t[4], a[5367]); -- Rat Pack
    A(t[4], a[5368]); -- Prototype Prodigy
    A(t[4], a[5369]); -- It's Frost Damage
    A(t[4], a[5370]); -- I'm on a Diet
    A(t[4], a[5371]); -- Vigorous VanCleef Vindicator
    A(t[4], a[628]); -- Deadmines
    A(t[4], a[5083]); -- Heroic: Deadmines
    A(t[4], a[11856]); -- Pet Battle Challenge: Deadmines
    A(t[4], a[9924]); -- Field Photographer
    t[5] = c:New(k.GetInstanceInfoName(226)); -- Ragefire Chasm
    C(t[2], t[5]);
    A(t[5], a[629]); -- Ragefire Chasm
    t[8] = c:New(k.GetInstanceInfoName(240)); -- Wailing Caverns
    C(t[2], t[8]);
    A(t[8], a[630]); -- Wailing Caverns
    A(t[8], a[11765]); -- Pet Battle Challenge: Wailing Caverns
    t[9] = c:New(k.GetInstanceInfoName(64)); -- Shadowfang Keep
    C(t[2], t[9]);
    A(t[9], a[5503]); -- Pardon Denied
    A(t[9], a[5504]); -- To the Ground!
    A(t[9], a[5505]); -- Bullet Time
    A(t[9], a[631]); -- Shadowfang Keep
    A(t[9], a[5093]); -- Heroic: Shadowfang Keep
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
    A(t[12], a[13269]); -- Pet Battle Challenge: Gnomeregan
    t[13] = c:New(k.GetInstanceInfoName(233)); -- Razorfen Kraul
    C(t[2], t[13]);
    A(t[13], a[635]); -- Razorfen Kraul
    t[14] = c:New(k.GetInstanceInfoName(234)); -- Razorfen Downs
    C(t[2], t[14]);
    A(t[14], a[636]); -- Razorfen Downs
    t[15] = c:New(k.GetInstanceInfoName(311)); -- Scarlet Halls
    C(t[2], t[15]);
    A(t[15], a[6684]); -- Humane Society
    A(t[15], a[6427]); -- Mosh Pit
    A(t[15], a[7413]); -- Scarlet Halls
    A(t[15], a[6760]); -- Heroic: Scarlet Halls
    A(t[15], a[6895]); -- Scarlet Halls Challenger
    A(t[15], a[6908]); -- Scarlet Halls: Bronze
    A(t[15], a[6909]); -- Scarlet Halls: Silver
    A(t[15], a[6910]); -- Scarlet Halls: Gold
    A(t[15], a[8436]); -- Challenge Master: Scarlet Halls
    t[16] = c:New(k.GetInstanceInfoName(316)); -- Scarlet Monastery
    C(t[2], t[16]);
    A(t[16], a[6946]); -- Empowered Spiritualist
    A(t[16], a[6928]); -- Burning Man
    A(t[16], a[6929]); -- And Stay Dead!
    A(t[16], a[637]); -- Scarlet Monastery
    A(t[16], a[6761]); -- Heroic: Scarlet Monastery
    A(t[16], a[6896]); -- Scarlet Monastery Challenger
    A(t[16], a[6911]); -- Scarlet Monastery: Bronze
    A(t[16], a[6912]); -- Scarlet Monastery: Silver
    A(t[16], a[6913]); -- Scarlet Monastery: Gold
    A(t[16], a[8437]); -- Challenge Master: Scarlet Monastery
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
    A(t[21], a[14020]); -- Pet Battle Challenge: Blackrock Depths
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
    A(t[23], a[5788]); -- Agent of the Shen'dralar
    t[24] = c:New(k.GetInstanceInfoName(246)); -- Scholomance
    C(t[2], t[24]);
    A(t[24], a[6531]); -- Attention to Detail
    A(t[24], a[6394]); -- Rattle No More
    A(t[24], a[6396]); -- Sanguinarian
    A(t[24], a[6715]); -- Polyformic Acid Science
    A(t[24], a[6821]); -- School's Out Forever
    A(t[24], a[645]); -- Scholomance
    A(t[24], a[6762]); -- Heroic: Scholomance
    A(t[24], a[6897]); -- Scholomance Challenger
    A(t[24], a[6914]); -- Scholomance: Bronze
    A(t[24], a[6915]); -- Scholomance: Silver
    A(t[24], a[6916]); -- Scholomance: Gold
    A(t[24], a[8438]); -- Challenge Master: Scholomance
    t[25] = c:New(k.GetInstanceInfoName(236)); -- Stratholme
    C(t[2], t[25]);
    A(t[25], a[646]); -- Stratholme
    A(t[25], a[729]); -- Deathcharger's Reins
    A(t[25], a[13627]); -- Pet Battle Challenge: Stratholme
    A(t[25], a[13766]); -- Malowned
    t[3] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1], t[3]);
    A(t[3], a[1285]); -- Classic Raider
    t[7] = c:New(k.GetInstanceInfoName(741)); -- Molten Core
    C(t[3], t[7]);
    A(t[7], a[686]); -- Molten Core
    A(t[7], a[11741]); -- So Hot Right Now
    A(t[7], a[429]); -- "Sulfuras, Hand of Ragnaros"
    A(t[7], a[428]); -- "Thunderfury, Blessed Blade of the Windseeker"
    A(t[7], a[9550]); -- "Boldly, You Sought the Power of Ragnaros"
    A(t[7], a[7934]); -- Raiding with Leashes
    A(t[7], a[11296]); -- The Ancient Keeper
    A(t[7], a[11297]); -- The Balance of Light and Shadow
    A(t[7], a[15330]); -- Survivor of the Firelord (Season of Mastery)
    t[779] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[7], t[779]);
    A(t[779], a[955]); -- Hydraxian Waterlords
    A(t[779], a[2496]); -- The Fifth Element
    t[26] = c:New(k.GetInstanceInfoName(760) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Onyxia's Lair
    C(t[3], t[26]);
    A(t[26], a[684]); -- Onyxia's Lair (Level 60)
    A(t[26], a[11296]); -- The Ancient Keeper
    t[27] = c:New(k.GetInstanceInfoName(742)); -- Blackwing Lair
    C(t[3], t[27]);
    A(t[27], a[685]); -- Blackwing Lair
    A(t[27], a[11742]); -- Dress in Lairs
    A(t[27], a[7934]); -- Raiding with Leashes
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
    A(t[30], a[11743]); -- Accessor-Eyes
    A(t[30], a[7934]); -- Raiding with Leashes
    A(t[30], a[15334]); -- Survivor of the Old God (Season of Mastery)
    t[780] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[30], t[780]);
    A(t[780], a[956]); -- Brood of Nozdormu
    t[796] = c:New(k.GetInstanceInfoName(754) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Naxxramas
    C(t[3], t[796]);
    A(t[796], a[11744]); -- "Drop Dead, Gorgeous"
    A(t[796], a[425]); -- "Atiesh, Greatstaff of the Guardian"
    A(t[796], a[15335]); -- Survivor of the Damned (Season of Mastery)
    A(t[796], a[15637]); -- The Immortal (Season of Mastery)
    t[785] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[1], t[785]);
    A(t[785], a[6586]); -- Eastern Kingdoms Safari
    A(t[785], a[6585]); -- Kalimdor Safari
    A(t[785], a[6613]); -- Eastern Kingdoms Tamer
    A(t[785], a[6612]); -- Kalimdor Tamer
    A(t[785], a[6603]); -- Taming Eastern Kingdoms
    A(t[785], a[6602]); -- Taming Kalimdor
    A(t[785], a[6558]); -- Local Pet Mauler
    A(t[785], a[6559]); -- Traveling Pet Mauler
    A(t[785], a[6560]); -- World Pet Mauler
    A(t[785], a[6607]); -- Taming Azeroth
    A(t[785], a[6601]); -- Taming the Wild
    A(t[785], a[7498]); -- Taming the Great Outdoors
    A(t[785], a[7499]); -- Taming the World
    A(t[785], a[14021]); -- The Shadows Revealed
    A(t[785], a[6584]); -- Big City Pet Brawlin' - Alliance
    A(t[785], a[6621]); -- Big City Pet Brawlin' - Horde
    A(t[785], a[6622]); -- Big City Pet Brawler
    A(t[785], a[6611]); -- Continental Tamer
    A(t[785], a[6590]); -- World Safari
    A(t[785], a[8348]); -- The Longest Day
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
    A(t[794], a[9924]); -- Field Photographer
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
    A(t[694], a[4926]); -- Bloodmyst Isle Quests
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
    A(t[670], a[4908]); -- Ghostlands Quests
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
    A(t[631], a[9924]); -- Field Photographer
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
    A(t[627], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
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
    A(t[636], a[9924]); -- Field Photographer
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
    A(t[74], a[11746]); -- Outlandish Style
    A(t[74], a[2456]); -- Vampire Hunter
    A(t[74], a[8293]); -- Raiding with Leashes II: Attunement Edition
    A(t[74], a[9924]); -- Field Photographer
    t[647] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[74], t[647]);
    A(t[647], a[960]); -- The Violet Eye
    t[75] = c:New(k.GetInstanceInfoName(746)); -- Gruul's Lair
    C(t[73], t[75]);
    A(t[75], a[692]); -- Gruul's Lair
    A(t[75], a[11746]); -- Outlandish Style
    t[76] = c:New(k.GetInstanceInfoName(747)); -- Magtheridon's Lair
    C(t[73], t[76]);
    A(t[76], a[693]); -- Magtheridon's Lair
    A(t[76], a[11746]); -- Outlandish Style
    t[77] = c:New(k.GetInstanceInfoName(748)); -- Serpentshrine Cavern
    C(t[73], t[77]);
    A(t[77], a[694]); -- Serpentshrine Cavern
    A(t[77], a[11747]); -- Merely a Set
    A(t[77], a[8293]); -- Raiding with Leashes II: Attunement Edition
    t[78] = c:New(k.GetInstanceInfoName(749)); -- The Eye
    C(t[73], t[78]);
    A(t[78], a[696]); -- Tempest Keep
    A(t[78], a[885]); -- Ashes of Al'ar
    A(t[78], a[8293]); -- Raiding with Leashes II: Attunement Edition
    t[79] = c:New(k.GetInstanceInfoName(750)); -- The Battle for Mount Hyjal
    C(t[73], t[79]);
    A(t[79], a[695]); -- The Battle for Mount Hyjal
    A(t[79], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    t[646] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[79], t[646]);
    A(t[646], a[959]); -- The Scale of the Sands
    t[80] = c:New(k.GetInstanceInfoName(751)); -- Black Temple
    C(t[73], t[80]);
    A(t[80], a[697]); -- The Black Temple
    A(t[80], a[11748]); -- Black is the New Black
    A(t[80], a[9016]); -- Breaker of the Black Harvest
    A(t[80], a[426]); -- Warglaives of Azzinoth
    A(t[80], a[11869]); -- I'll Hold These For You Until You Get Out
    A(t[80], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
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
    A(t[82], a[11749]); -- "Suns Out, Thori'dals Out"
    A(t[82], a[725]); -- "Thori'dal, the Stars' Fury"
    A(t[82], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    t[786] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[55], t[786]);
    A(t[786], a[6587]); -- Outland Safari
    A(t[786], a[6614]); -- Outland Tamer
    A(t[786], a[6604]); -- Taming Outland
    A(t[786], a[6558]); -- Local Pet Mauler
    A(t[786], a[6559]); -- Traveling Pet Mauler
    A(t[786], a[6560]); -- World Pet Mauler
    A(t[786], a[6607]); -- Taming Azeroth
    A(t[786], a[6601]); -- Taming the Wild
    A(t[786], a[7498]); -- Taming the Great Outdoors
    A(t[786], a[7499]); -- Taming the World
    A(t[786], a[6584]); -- Big City Pet Brawlin' - Alliance
    A(t[786], a[6621]); -- Big City Pet Brawlin' - Horde
    A(t[786], a[6622]); -- Big City Pet Brawler
    A(t[786], a[6611]); -- Continental Tamer
    A(t[786], a[6590]); -- World Safari
    A(t[786], a[8348]); -- The Longest Day
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
    A(t[590], a[9924]); -- Field Photographer
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
    A(t[593], a[9924]); -- Field Photographer
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
    A(t[598], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
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
    A(t[610], a[9924]); -- Field Photographer
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
    A(t[585], a[14750]); -- Death Rising
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
    A(t[1034], a[9924]); -- Field Photographer
    t[84] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[83], t[84]);
    A(t[84], a[1288]); -- Northrend Dungeonmaster
    A(t[84], a[1289]); -- Northrend Dungeon Hero
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
    t[87] = c:New(k.GetInstanceInfoName(281)); -- The Nexus
    C(t[84], t[87]);
    A(t[87], a[2150]); -- Split Personality
    A(t[87], a[2037]); -- Chaos Theory
    A(t[87], a[2036]); -- Intense Cold
    A(t[87], a[478]); -- The Nexus
    A(t[87], a[490]); -- Heroic: The Nexus
    t[88] = c:New(k.GetInstanceInfoName(272)); -- Azjol-Nerub
    C(t[84], t[88]);
    A(t[88], a[1296]); -- Watch Him Die
    A(t[88], a[1297]); -- Hadronox Denied
    A(t[88], a[1860]); -- Gotta Go!
    A(t[88], a[480]); -- Azjol-Nerub
    A(t[88], a[491]); -- Heroic: Azjol-Nerub
    t[89] = c:New(k.GetInstanceInfoName(271)); -- Ahn'kahet: The Old Kingdom
    C(t[84], t[89]);
    A(t[89], a[2038]); -- Respect Your Elders
    A(t[89], a[2056]); -- Volunteer Work
    A(t[89], a[1862]); -- Volazj's Quick Demise
    A(t[89], a[481]); -- Ahn'kahet: The Old Kingdom
    A(t[89], a[492]); -- Heroic: Ahn'kahet: The Old Kingdom
    t[90] = c:New(k.GetInstanceInfoName(273)); -- Drak'Tharon Keep
    C(t[84], t[90]);
    A(t[90], a[2151]); -- Consumption Junction
    A(t[90], a[2057]); -- Oh Novos!
    A(t[90], a[2039]); -- Better Off Dred
    A(t[90], a[482]); -- Drak'Tharon Keep
    A(t[90], a[493]); -- Heroic: Drak'Tharon Keep
    t[91] = c:New(k.GetInstanceInfoName(283)); -- The Violet Hold
    C(t[84], t[91]);
    A(t[91], a[1865]); -- Lockdown!
    A(t[91], a[2041]); -- Dehydration
    A(t[91], a[2153]); -- A Void Dance
    A(t[91], a[1816]); -- Defenseless
    A(t[91], a[483]); -- The Violet Hold
    A(t[91], a[494]); -- Heroic: The Violet Hold
    t[92] = c:New(k.GetInstanceInfoName(274)); -- Gundrak
    C(t[84], t[92]);
    A(t[92], a[2058]); -- Snakes. Why'd It Have To Be Snakes?
    A(t[92], a[2040]); -- Less-rabi
    A(t[92], a[1864]); -- What the Eck?
    A(t[92], a[2152]); -- Share The Love
    A(t[92], a[484]); -- Gundrak
    A(t[92], a[495]); -- Heroic: Gundrak
    t[93] = c:New(k.GetInstanceInfoName(277)); -- Halls of Stone
    C(t[84], t[93]);
    A(t[93], a[1866]); -- Good Grief
    A(t[93], a[2154]); -- Brann Spankin' New
    A(t[93], a[2155]); -- Abuse the Ooze
    A(t[93], a[485]); -- Halls of Stone
    A(t[93], a[496]); -- Heroic: Halls of Stone
    t[94] = c:New(k.GetInstanceInfoName(275)); -- Halls of Lightning
    C(t[84], t[94]);
    A(t[94], a[1834]); -- Lightning Struck
    A(t[94], a[2042]); -- Shatter Resistant
    A(t[94], a[1867]); -- Timely Death
    A(t[94], a[486]); -- Halls of Lightning
    A(t[94], a[497]); -- Heroic: Halls of Lightning
    t[95] = c:New(k.GetInstanceInfoName(282)); -- The Oculus
    C(t[84], t[95]);
    A(t[95], a[1868]); -- Make It Count
    A(t[95], a[2046]); -- Amber Void
    A(t[95], a[2045]); -- Emerald Void
    A(t[95], a[2044]); -- Ruby Void
    A(t[95], a[1871]); -- Experienced Drake Rider
    A(t[95], a[487]); -- The Oculus
    A(t[95], a[498]); -- Heroic: The Oculus
    t[97] = c:New(k.GetInstanceInfoName(286)); -- Utgarde Pinnacle
    C(t[84], t[97]);
    A(t[97], a[2043]); -- The Incredible Hulk
    A(t[97], a[1873]); -- Lodi Dodi We Loves the Skadi
    A(t[97], a[2156]); -- My Girl Loves to Skadi All the Time
    A(t[97], a[2157]); -- King's Bane
    A(t[97], a[488]); -- Utgarde Pinnacle
    A(t[97], a[499]); -- Heroic: Utgarde Pinnacle
    t[96] = c:New(k.GetInstanceInfoName(279)); -- The Culling of Stratholme
    C(t[84], t[96]);
    A(t[96], a[1872]); -- Zombiefest!
    A(t[96], a[1817]); -- The Culling of Time
    A(t[96], a[479]); -- The Culling of Stratholme
    A(t[96], a[500]); -- Heroic: The Culling of Stratholme
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
    A(t[85], a[12401]); -- Glory of the Ulduar Raider
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
    A(t[105], a[11750]); -- Undying Aesthetic
    A(t[105], a[7934]); -- Raiding with Leashes
    A(t[105], a[9924]); -- Field Photographer
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
    A(t[114], a[12312]); -- Dwarfageddon
    A(t[114], a[12314]); -- Three Car Garage
    A(t[114], a[12313]); -- Unbroken
    A(t[114], a[12316]); -- Shutout
    A(t[114], a[12315]); -- Take Out Those Turrets
    A(t[114], a[12317]); -- Orbital Bombardment
    A(t[114], a[12318]); -- Orbital Devastation
    A(t[114], a[12319]); -- Nuked from Orbit
    A(t[114], a[12320]); -- Orbit-uary
    A(t[114], a[12323]); -- Shattered
    A(t[114], a[12324]); -- Hot Pocket
    A(t[114], a[12325]); -- Stokin' the Furnace
    A(t[114], a[12321]); -- A Quick Shave
    A(t[114], a[12322]); -- "Iron Dwarf, Medium Rare"
    A(t[114], a[12326]); -- Nerf Engineering
    A(t[114], a[12327]); -- Nerf Scrapbots
    A(t[114], a[12328]); -- Nerf Gravity Bombs
    A(t[114], a[12329]); -- Must Deconstruct Faster
    A(t[114], a[12330]); -- Heartbreaker
    A(t[114], a[12335]); -- But I'm On Your Side
    A(t[114], a[12336]); -- Can't Do That While Stunned
    A(t[114], a[12332]); -- "I Choose You, Runemaster Molgeim"
    A(t[114], a[12333]); -- "I Choose You, Stormcaller Brundir"
    A(t[114], a[12334]); -- "I Choose You, Steelbreaker"
    A(t[114], a[12339]); -- If Looks Could Kill
    A(t[114], a[12340]); -- Rubble and Roll
    A(t[114], a[12337]); -- With Open Arms
    A(t[114], a[12338]); -- Disarmed
    A(t[114], a[12342]); -- Nine Lives
    A(t[114], a[12341]); -- Crazy Cat Lady
    A(t[114], a[12343]); -- Cheese the Freeze
    A(t[114], a[12344]); -- I Have the Coolest Friends
    A(t[114], a[12345]); -- Getting Cold in Here
    A(t[114], a[12346]); -- Staying Buffed All Winter
    A(t[114], a[12347]); -- I Could Say That This Cache Was Rare
    A(t[114], a[12348]); -- Don't Stand in the Lightning
    A(t[114], a[12349]); -- I'll Take You All On
    A(t[114], a[12350]); -- Who Needs Bloodlust?
    A(t[114], a[12351]); -- Siffed
    A(t[114], a[12352]); -- Lose Your Illusion
    A(t[114], a[12360]); -- Lumberjacked
    A(t[114], a[12361]); -- Con-speed-atory
    A(t[114], a[12362]); -- Deforestation
    A(t[114], a[12363]); -- Getting Back to Nature
    A(t[114], a[12364]); -- Knock on Wood
    A(t[114], a[12365]); -- "Knock, Knock on Wood"
    A(t[114], a[12366]); -- "Knock, Knock, Knock on Wood"
    A(t[114], a[12367]); -- Set Up Us the Bomb
    A(t[114], a[12368]); -- Not-So-Friendly Fire
    A(t[114], a[12369]); -- Firefighter
    A(t[114], a[12372]); -- Shadowdodger
    A(t[114], a[12373]); -- I Love the Smell of Saronite in the Morning
    A(t[114], a[12384]); -- Kiss and Make Up
    A(t[114], a[12395]); -- Drive Me Crazy
    A(t[114], a[12396]); -- He's Not Getting Any Older
    A(t[114], a[12397]); -- They're Coming Out of the Walls
    A(t[114], a[12398]); -- In His House He Waits Dreaming
    A(t[114], a[12385]); -- Three Lights in the Darkness
    A(t[114], a[12386]); -- Two Lights in the Darkness
    A(t[114], a[12387]); -- One Light in the Darkness
    A(t[114], a[12388]); -- Alone in the Darkness
    A(t[114], a[12400]); -- Supermassive
    A(t[114], a[12297]); -- The Siege of Ulduar
    A(t[114], a[12302]); -- The Antechamber of Ulduar
    A(t[114], a[12309]); -- The Keepers of Ulduar
    A(t[114], a[12310]); -- The Descent into Madness
    A(t[114], a[12311]); -- The Secrets of Ulduar
    A(t[114], a[12399]); -- Observed
    A(t[114], a[11751]); -- Mogg-Saron
    A(t[114], a[4626]); -- And I'll Form the Head!
    A(t[114], a[3142]); -- "Val'anyr, Hammer of Ancient Kings"
    A(t[114], a[3316]); -- Herald of the Titans
    A(t[114], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
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
    A(t[117], a[11752]); -- Style of the Crusader
    A(t[117], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
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
    A(t[120], a[9924]); -- Field Photographer
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
    A(t[123], a[11753]); -- Winter Catalog
    A(t[123], a[4625]); -- Invincible's Reins
    A(t[123], a[4623]); -- Shadowmourne
    A(t[123], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
    A(t[123], a[9924]); -- Field Photographer
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
    A(t[787], a[6588]); -- Northrend Safari
    A(t[787], a[6615]); -- Northrend Tamer
    A(t[787], a[6605]); -- Taming Northrend
    A(t[787], a[6558]); -- Local Pet Mauler
    A(t[787], a[6559]); -- Traveling Pet Mauler
    A(t[787], a[6560]); -- World Pet Mauler
    A(t[787], a[6607]); -- Taming Azeroth
    A(t[787], a[6601]); -- Taming the Wild
    A(t[787], a[7498]); -- Taming the Great Outdoors
    A(t[787], a[7499]); -- Taming the World
    A(t[787], a[6611]); -- Continental Tamer
    A(t[787], a[6590]); -- World Safari
    A(t[787], a[8348]); -- The Longest Day
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
    A(t[953], a[14222]); -- Exile's Reach
    t[1168] = c:New(k.GetCategoryInfoTitle(92)); -- Character
    C(t[952], t[1168]);
    A(t[1168], a[6]); -- Level 10
    A(t[1168], a[7]); -- Level 20
    A(t[1168], a[8]); -- Level 30
    A(t[1168], a[9]); -- Level 40
    A(t[1168], a[14782]); -- Level 50
    A(t[1168], a[14783]); -- Level 60
    A(t[1168], a[15805]); -- Level 70
    A(t[1168], a[10]); -- Level 50 (Legacy)
    A(t[1168], a[11]); -- Level 60 (Legacy)
    A(t[1168], a[12]); -- Level 70 (Legacy)
    A(t[1168], a[13]); -- Level 80 (Legacy)
    A(t[1168], a[4826]); -- Level 85 (Legacy)
    A(t[1168], a[6193]); -- Level 90 (Legacy)
    A(t[1168], a[9060]); -- Level 100 (Legacy)
    A(t[1168], a[10671]); -- Level 110 (Legacy)
    A(t[1168], a[12544]); -- Level 120 (Legacy)
    A(t[1168], a[16433]); -- Soul of Iron (Season of Mastery)
    A(t[1168], a[7382]); -- Dynamic Duo
    A(t[1168], a[7383]); -- Terrific Trio
    A(t[1168], a[7384]); -- Quintessential Quintet
    A(t[1168], a[7380]); -- Double Agent
    A(t[1168], a[546]); -- Safe Deposit
    A(t[1168], a[1176]); -- Got My Mind On My Money
    A(t[1168], a[1177]); -- Got My Mind On My Money
    A(t[1168], a[1178]); -- Got My Mind On My Money
    A(t[1168], a[1180]); -- Got My Mind On My Money
    A(t[1168], a[1181]); -- Got My Mind On My Money
    A(t[1168], a[5455]); -- Got My Mind On My Money
    A(t[1168], a[5456]); -- Got My Mind On My Money
    A(t[1168], a[6753]); -- Got My Mind On My Money
    A(t[1168], a[891]); -- Giddy Up!
    A(t[1168], a[889]); -- Fast and Furious
    A(t[1168], a[890]); -- Into the Wild Blue Yonder
    A(t[1168], a[5180]); -- Breaking the Sound Barrier
    A(t[1168], a[545]); -- Shave and a Haircut
    A(t[1168], a[557]); -- Superior
    A(t[1168], a[5373]); -- Cataclysmically Superior
    A(t[1168], a[6348]); -- Mystically Superior
    A(t[1168], a[9707]); -- Savagely Superior
    A(t[1168], a[10764]); -- Brokenly Superior
    A(t[1168], a[12546]); -- Superior (Battle)
    A(t[1168], a[14796]); -- Superior
    A(t[1168], a[556]); -- Epic
    A(t[1168], a[5372]); -- Cataclysmically Epic
    A(t[1168], a[6349]); -- Mystically Epic
    A(t[1168], a[9708]); -- Savagely Epic
    A(t[1168], a[10765]); -- Brokenly Epic
    A(t[1168], a[12547]); -- Epic (Battle)
    A(t[1168], a[14797]); -- Epic
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
    A(t[1159], a[5751]); -- 2500 Daily Quests Completed
    A(t[1159], a[7410]); -- 5000 Daily Quests Completed
    A(t[1159], a[7411]); -- 10000 Daily Quests Completed
    A(t[1159], a[11126]); -- 50 World Quests Completed
    A(t[1159], a[11127]); -- 200 World Quests Completed
    A(t[1159], a[11128]); -- 500 World Quests Completed
    A(t[1159], a[11129]); -- 1000 World Quests Completed
    A(t[1159], a[11130]); -- 2500 World Quests Completed
    A(t[1159], a[11131]); -- 5000 World Quests Completed
    A(t[1159], a[11132]); -- "10,000 World Quests Completed"
    A(t[1159], a[31]); -- A Simple Re-Quest
    A(t[1159], a[4956]); -- 5 Dungeon Quests Completed
    A(t[1159], a[4957]); -- 20 Dungeon Quests Completed
    A(t[1159], a[1182]); -- The Bread Winner
    A(t[1159], a[5752]); -- Justly Rewarded
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
    A(t[1149], a[5471]); -- Iron Chef
    A(t[1149], a[7328]); -- Ironpaw Chef
    A(t[1149], a[1563]); -- Hail to the Chef
    A(t[1149], a[1784]); -- Hail to the Chef
    A(t[1149], a[153]); -- The Old Gnome and the Sea
    A(t[1149], a[5478]); -- The Limnologist
    A(t[1149], a[5479]); -- The Oceanographer
    A(t[1149], a[1243]); -- Fish Don't Leave Footprints
    A(t[1149], a[3218]); -- Turtles All the Way Down
    A(t[1149], a[1556]); -- 25 Fish
    A(t[1149], a[1557]); -- 50 Fish
    A(t[1149], a[1558]); -- 100 Fish
    A(t[1149], a[1559]); -- 250 Fish
    A(t[1149], a[1560]); -- 500 Fish
    A(t[1149], a[1561]); -- 1000 Fish
    A(t[1149], a[1516]); -- Accomplished Angler
    A(t[1149], a[5315]); -- Digger
    A(t[1149], a[5469]); -- Diggerer
    A(t[1149], a[5470]); -- Diggerest
    A(t[1149], a[4854]); -- I Had It in My Hand
    A(t[1149], a[4855]); -- What was Briefly Yours is Now Mine
    A(t[1149], a[4856]); -- It Belongs in a Museum!
    A(t[1149], a[9422]); -- "The Search For Fact, Not Truth"
    A(t[1149], a[141]); -- Ultimate Triage
    t[1150] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[1149], t[1150]);
    A(t[1150], a[116]); -- Professional Journeyman
    A(t[1150], a[731]); -- Professional Expert
    A(t[1150], a[732]); -- Professional Classic Master
    A(t[1150], a[121]); -- Journeyman Cook
    A(t[1150], a[122]); -- Expert Cook
    A(t[1150], a[123]); -- Classic Cook
    A(t[1150], a[5842]); -- Let's Do Lunch: Darnassus
    A(t[1150], a[5844]); -- Let's Do Lunch: Undercity
    A(t[1150], a[5841]); -- Let's Do Lunch: Ironforge
    A(t[1150], a[5843]); -- Let's Do Lunch: Thunder Bluff
    A(t[1150], a[5474]); -- Let's Do Lunch: Stormwind
    A(t[1150], a[5475]); -- Let's Do Lunch: Orgrimmar
    A(t[1150], a[5845]); -- A Bunch of Lunch
    A(t[1150], a[5779]); -- You'll Feel Right as Rain
    A(t[1150], a[126]); -- Journeyman Fisherman
    A(t[1150], a[127]); -- Expert Fisherman
    A(t[1150], a[128]); -- Artisan Fisherman
    A(t[1150], a[1257]); -- The Scavenger
    A(t[1150], a[150]); -- The Fishing Diplomat
    A(t[1150], a[306]); -- Master Angler of Azeroth
    A(t[1150], a[878]); -- One That Didn't Get Away
    A(t[1150], a[1836]); -- Old Crafty
    A(t[1150], a[1837]); -- Old Ironjaw
    A(t[1150], a[5848]); -- Fish or Cut Bait: Darnassus
    A(t[1150], a[5850]); -- Fish or Cut Bait: Undercity
    A(t[1150], a[5847]); -- Fish or Cut Bait: Ironforge
    A(t[1150], a[5849]); -- Fish or Cut Bait: Thunder Bluff
    A(t[1150], a[5476]); -- Fish or Cut Bait: Stormwind
    A(t[1150], a[5477]); -- Fish or Cut Bait: Orgrimmar
    A(t[1150], a[5851]); -- Gone Fishin'
    A(t[1150], a[4857]); -- Journeyman Archaeologist
    A(t[1150], a[4919]); -- Expert Archaeologist
    A(t[1150], a[4920]); -- Artisan Archaeologist
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
    A(t[1151], a[4921]); -- Master Archaeologist
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
    A(t[1152], a[4922]); -- Grand Master Archaeologist
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
    A(t[1163], a[5374]); -- 45 Exalted Reputations
    A(t[1163], a[5723]); -- 50 Exalted Reputations
    A(t[1163], a[6826]); -- 55 Exalted Reputations
    A(t[1163], a[11177]); -- 70 Exalted Reputations
    A(t[1163], a[12865]); -- 90 Exalted Reputations
    A(t[1163], a[5794]); -- Time Flies When You're Having Fun
    A(t[1163], a[12243]); -- Allied Races: Lightforged Draenei
    A(t[1163], a[12414]); -- Heritage of the Lightforged
    A(t[1163], a[14013]); -- Allied Races: Mechagnome
    A(t[1163], a[14014]); -- Heritage of the Mechagnome
    A(t[1163], a[12242]); -- Allied Races: Void Elf
    A(t[1163], a[12291]); -- Heritage of the Void
    A(t[1163], a[12515]); -- Allied Races: Dark Iron Dwarf
    A(t[1163], a[13076]); -- Heritage of the Dark Iron
    A(t[1163], a[13163]); -- Allied Races: Kul Tiran
    A(t[1163], a[13504]); -- Heritage of the Kul Tirans
    A(t[1163], a[12245]); -- Allied Races: Highmountain Tauren
    A(t[1163], a[12415]); -- Heritage of Highmountain
    A(t[1163], a[12244]); -- Allied Races: Nightborne
    A(t[1163], a[12413]); -- Heritage of the Nightborne
    A(t[1163], a[12518]); -- Allied Races: Mag'har Orc
    A(t[1163], a[13077]); -- Heritage of the Mag'har
    A(t[1163], a[13161]); -- Allied Races: Zandalari Troll
    A(t[1163], a[13503]); -- Heritage of the Zandalari
    A(t[1163], a[13206]); -- Allied Races: Vulpera
    A(t[1163], a[14002]); -- Heritage of the Vulpera
    t[1170] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[952], t[1170]);
    A(t[1170], a[7482]); -- Trainer Extraordinaire
    A(t[1170], a[7483]); -- Battle Master
    A(t[1170], a[6600]); -- Ultimate Trainer
    A(t[1170], a[7521]); -- Time to Open a Pet Store
    A(t[1170], a[9712]); -- Shiny Pet Charmer
    A(t[1170], a[12927]); -- Polished Pet Charmer
    A(t[1170], a[1017]); -- Can I Keep Him?
    A(t[1170], a[15]); -- Plenty of Pets
    A(t[1170], a[1248]); -- Plethora of Pets
    A(t[1170], a[1250]); -- "Shop Smart, Shop Pet...Smart"
    A(t[1170], a[2516]); -- Lil' Game Hunter
    A(t[1170], a[5876]); -- Petting Zoo
    A(t[1170], a[5877]); -- Menagerie
    A(t[1170], a[5875]); -- Littlest Pet Shop
    A(t[1170], a[7500]); -- Going to Need More Leashes
    A(t[1170], a[7501]); -- That's a Lot of Pet Food
    A(t[1170], a[9643]); -- So. Many. Pets.
    A(t[1170], a[12992]); -- Pet Emporium
    A(t[1170], a[12958]); -- Master of Minions
    A(t[1170], a[15641]); -- Many More Mini Minions
    A(t[1170], a[15642]); -- Proven Pet Parent
    A(t[1170], a[15643]); -- What Can I Say? They Love Me.
    A(t[1170], a[15644]); -- Good Things Come in Small Packages
    A(t[1170], a[6554]); -- He's Mine!
    A(t[1170], a[6555]); -- Building a Team
    A(t[1170], a[6556]); -- Going to Need More Traps
    A(t[1170], a[6557]); -- Master Pet Hunter
    A(t[1170], a[7436]); -- Zen Pet Hunter
    A(t[1170], a[7465]); -- An Uncommon Find
    A(t[1170], a[7462]); -- A Rare Catch
    A(t[1170], a[7463]); -- Lots of Rarity
    A(t[1170], a[7464]); -- Quality & Quantity
    A(t[1170], a[6608]); -- Family Reunion
    A(t[1170], a[6571]); -- That Was Close!
    A(t[1170], a[6594]); -- Cat Fight!
    A(t[1170], a[6593]); -- Experienced Pet Battler
    A(t[1170], a[6462]); -- Master Pet Battler
    A(t[1170], a[6591]); -- Grand Master Pet Battler
    A(t[1170], a[6592]); -- Legendary Pet Battler
    A(t[1170], a[6851]); -- Take 'Em All On!
    A(t[1170], a[6595]); -- Pet Brawler
    A(t[1170], a[6596]); -- Experienced Pet Brawler
    A(t[1170], a[6597]); -- Master Pet Brawler
    A(t[1170], a[6598]); -- Grand Master Pet Brawler
    A(t[1170], a[6599]); -- Legendary Pet Brawler
    A(t[1170], a[8297]); -- Merciless Pet Brawler
    A(t[1170], a[8298]); -- Vengeful Pet Brawler
    A(t[1170], a[8300]); -- Brutal Pet Brawler
    A(t[1170], a[12279]); -- Mechanical Brawler
    A(t[1170], a[12280]); -- Aquatic Brawler
    A(t[1170], a[12281]); -- Beast Brawler
    A(t[1170], a[12282]); -- Elemental Brawler
    A(t[1170], a[12283]); -- Magic Brawler
    A(t[1170], a[12284]); -- Critter Brawler
    A(t[1170], a[12285]); -- Undead Brawler
    A(t[1170], a[12286]); -- Flying Brawler
    A(t[1170], a[12287]); -- Dragonkin Brawler
    A(t[1170], a[12289]); -- Humanoid Brawler
    A(t[1170], a[12290]); -- Family Brawler
    A(t[1170], a[6618]); -- On A Roll
    A(t[1170], a[6619]); -- Win Streak
    A(t[1170], a[6620]); -- No Time To Heal
    A(t[1170], a[7433]); -- Newbie
    A(t[1170], a[6566]); -- Just a Pup
    A(t[1170], a[6567]); -- Growing Up
    A(t[1170], a[6568]); -- Time for a Leash
    A(t[1170], a[6569]); -- Old Timer
    A(t[1170], a[6570]); -- All Growns Up!
    A(t[1170], a[6579]); -- Rookie Pet Group
    A(t[1170], a[6580]); -- Rookie Pet Crew
    A(t[1170], a[6583]); -- Rookie Pet Mob
    A(t[1170], a[6578]); -- Pro Pet Group
    A(t[1170], a[6581]); -- Pro Pet Crew
    A(t[1170], a[6582]); -- Pro Pet Mob
    A(t[1170], a[6609]); -- No Favorites
    A(t[1170], a[6610]); -- All Pets Allowed
    A(t[1170], a[9070]); -- Overstuffed
    t[1171] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[952], t[1171]);
    A(t[1171], a[621]); -- Represent
    A(t[1171], a[1020]); -- Ten Tabards
    A(t[1171], a[1021]); -- Twenty-Five Tabards
    A(t[1171], a[5755]); -- Thirty Tabards
    A(t[1171], a[9911]); -- Where's the Mailbox?
    A(t[1171], a[9906]); -- Alt-ernative Lifestyle
    A(t[1171], a[9908]); -- Ready for Powerleveling
    A(t[1171], a[9670]); -- Toying Around
    A(t[1171], a[9671]); -- Having a Ball
    A(t[1171], a[9672]); -- Tons of Toys
    A(t[1171], a[9673]); -- The Toymaster
    A(t[1171], a[11176]); -- Remember to Share
    A(t[1171], a[12996]); -- Toybox Tycoon
    A(t[1171], a[15781]); -- The Joy of Toy
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
    t[1218] = c:New(k.L["Focused"]); -- Focused
    C(t[884], t[1218]);
    t[1218].HasFlexibleData = true;
    tinsert(focusedCategories, t[1218]);
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
    A(t[885], a[6006]); -- Elders of Cataclysm
    A(t[885], a[912]); -- Elders of Eastern Kingdoms
    A(t[885], a[911]); -- Elders of Kalimdor
    A(t[885], a[1396]); -- Elders of Northrend
    A(t[885], a[910]); -- Elders of the Dungeons
    A(t[885], a[915]); -- Elders of the Alliance
    A(t[885], a[914]); -- Elders of the Horde
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
    A(t[910], a[9389]); -- It Might Just Save Your Life
    A(t[910], a[9392]); -- Love Magnet
    A(t[910], a[9393]); -- Beacon of Love
    A(t[910], a[9394]); -- They Really Love Me!
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
    A(t[913], a[6008]); -- Flame Warden of Northrend
    A(t[913], a[6009]); -- Flame Keeper of Northrend
    A(t[913], a[6011]); -- Flame Warden of Cataclysm
    A(t[913], a[6012]); -- Flame Keeper of Cataclysm
    A(t[913], a[1034]); -- The Fires of Azeroth
    A(t[913], a[1036]); -- The Fires of Azeroth
    A(t[913], a[8045]); -- Flame Warden of Pandaria
    A(t[913], a[8044]); -- Flame Keeper of Pandaria
    A(t[913], a[11283]); -- Flame Warden of Draenor
    A(t[913], a[11284]); -- Flame Keeper of Draenor
    A(t[913], a[11280]); -- Flame Warden of the Broken Isles
    A(t[913], a[11282]); -- Flame Keeper of the Broken Isles
    A(t[913], a[13341]); -- Flame Warden of Kul Tiras
    A(t[913], a[13340]); -- Flame Keeper of Zandalar
    A(t[913], a[1028]); -- Extinguishing Eastern Kingdoms
    A(t[913], a[1031]); -- Extinguishing Eastern Kingdoms
    A(t[913], a[1029]); -- Extinguishing Kalimdor
    A(t[913], a[1032]); -- Extinguishing Kalimdor
    A(t[913], a[1030]); -- Extinguishing Outland
    A(t[913], a[1033]); -- Extinguishing Outland
    A(t[913], a[6007]); -- Extinguishing Northrend
    A(t[913], a[6010]); -- Extinguishing Northrend
    A(t[913], a[6013]); -- Extinguishing the Cataclysm
    A(t[913], a[6014]); -- Extinguishing the Cataclysm
    A(t[913], a[1035]); -- Desecration of the Horde
    A(t[913], a[1037]); -- Desecration of the Alliance
    A(t[913], a[8042]); -- Extinguishing Pandaria
    A(t[913], a[8043]); -- Extinguishing Pandaria
    A(t[913], a[11276]); -- Extinguishing Draenor
    A(t[913], a[11277]); -- Extinguishing Draenor
    A(t[913], a[11278]); -- Extinguishing the Broken Isles
    A(t[913], a[11279]); -- Extinguishing the Broken Isles
    A(t[913], a[13343]); -- Extinguishing Zandalar
    A(t[913], a[13342]); -- Extinguishing Kul Tiras
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
    A(t[915], a[5836]); -- Tricks and Treats of Northrend
    A(t[915], a[5835]); -- Tricks and Treats of Northrend
    A(t[915], a[5837]); -- Tricks and Treats of the Cataclysm
    A(t[915], a[5838]); -- Tricks and Treats of the Cataclysm
    A(t[915], a[7601]); -- Tricks and Treats of Pandaria
    A(t[915], a[7602]); -- Tricks and Treats of Pandaria
    A(t[915], a[10365]); -- A Frightening Friend
    A(t[915], a[1656]); -- Hallowed Be Thy Name
    A(t[915], a[1657]); -- Hallowed Be Thy Name
    t[920] = c:New(k.L["Day of the Dead"]); -- Day of the Dead
    C(t[918], t[920]);
    A(t[920], a[3456]); -- Dead Man's Party
    A(t[920], a[9426]); -- To The Afterlife
    A(t[920], a[9427]); -- Vientos!
    A(t[920], a[9428]); -- Calavera
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
    A(t[917], a[5853]); -- A-Caroling We Will Go
    A(t[917], a[5854]); -- A-Caroling We Will Go
    A(t[917], a[8699]); -- The Danger Zone
    A(t[917], a[15181]); -- Rock n' Roll
    A(t[917], a[10353]); -- Iron Armada
    A(t[917], a[1692]); -- Merrymaker
    A(t[917], a[1691]); -- Merrymaker
    A(t[917], a[15653]); -- The More You Know*
    t[950] = c:New(k.L["Gifts"], true); -- Gifts
    C(t[917], t[950]);
    A(t[950], a[1705]); -- Clockwork Rocket Bot
    A(t[950], a[1706]); -- Crashin' Thrashin' Racer
    A(t[950], a[6059]); -- Red Rider Air Rifle
    A(t[950], a[6060]); -- MiniZep Controller
    A(t[950], a[6061]); -- Gaudy Winter Veil Sweater
    A(t[950], a[7852]); -- They're Both Footballs?
    A(t[950], a[8698]); -- Crashin' Thrashin' Flyer
    A(t[950], a[9915]); -- Crashin' Thrashin' Shredder
    A(t[950], a[10337]); -- Crashin' Thrashin' Flamer
    A(t[950], a[10751]); -- Brr... It's Cold in Here
    A(t[950], a[11913]); -- Don't Play With That In The House
    A(t[950], a[12850]); -- At Least You're Being Careful
    A(t[950], a[13927]); -- Crashin' Splashin'
    A(t[950], a[14931]); -- Flying Festivities
    A(t[950], a[15313]); -- Rockin' Rollin' Racer
    A(t[950], a[15645]); -- To Catch Falling Stars
    t[1173] = c:New(k.L["WoW's Anniversary"]); -- WoW's Anniversary
    C(t[884], t[1173]);
    A(t[1173], a[2398]); -- WoW's 4th Anniversary
    A(t[1173], a[4400]); -- WoW's 5th Anniversary
    A(t[1173], a[5512]); -- WoW's 6th Anniversary
    A(t[1173], a[5863]); -- WoW's 7th Anniversary
    A(t[1173], a[6131]); -- WoW's 8th Anniversary
    A(t[1173], a[7853]); -- WoW's 9th Anniversary
    A(t[1173], a[8820]); -- WoW's 10th Anniversary
    A(t[1173], a[10058]); -- WoW's 11th Anniversary
    A(t[1173], a[10741]); -- WoW's 12th Anniversary
    A(t[1173], a[11848]); -- WoW's 13th Anniversary
    A(t[1173], a[12827]); -- WoW's 14th Anniversary
    A(t[1173], a[13917]); -- WoW's 15th Anniversary
    A(t[1173], a[14271]); -- WoW's 16th Anniversary
    A(t[1173], a[14942]); -- WoW's 17th Anniversary
    A(t[1173], a[15218]); -- WoW's 18th Anniversary
    A(t[1173], a[10335]); -- Did Someone Say...?
    t[925] = c:New(k.GetCategoryInfoTitle(15101)); -- Darkmoon Faire
    C(t[884], t[925]);
    A(t[925], a[6019]); -- "Come One, Come All!"
    A(t[925], a[6021]); -- Blastenheimer Bullseye
    A(t[925], a[6023]); -- Darkmoon Duelist
    A(t[925], a[6024]); -- Darkmoon Dominator
    A(t[925], a[6027]); -- Darkmoon Dungeoneer
    A(t[925], a[6028]); -- Darkmoon Defender
    A(t[925], a[6029]); -- Darkmoon Despoiler
    A(t[925], a[6032]); -- Faire Favors
    A(t[925], a[6026]); -- Fairegoer's Feast
    A(t[925], a[6025]); -- I Was Promised a Pony
    A(t[925], a[6022]); -- Quick Shot
    A(t[925], a[6020]); -- Step Right Up
    A(t[925], a[6030]); -- Taking the Show on the Road
    A(t[925], a[6031]); -- Taking the Show on the Road
    A(t[925], a[6332]); -- That Rabbit's Dynamite!
    A(t[925], a[9250]); -- Flying High
    A(t[925], a[9251]); -- Ringmaster
    A(t[925], a[9252]); -- Brood of Alysrazor
    A(t[925], a[9885]); -- Ace Tonk Commander
    A(t[925], a[9894]); -- Triumphant Turtle Tossing
    A(t[925], a[9983]); -- That's Whack!
    A(t[925], a[9755]); -- Darkmoon Race Enthusiast
    A(t[925], a[9756]); -- Darkmoon Racer Novice
    A(t[925], a[9759]); -- Darkmoon Racer Jockey
    A(t[925], a[9760]); -- Darkmoon Racer Leadfoot
    A(t[925], a[9761]); -- Darkmoon Racer Roadhog
    A(t[925], a[9770]); -- Blast Off!
    A(t[925], a[9769]); -- Rocketeer: Bronze
    A(t[925], a[9766]); -- Rocketeer: Silver
    A(t[925], a[9764]); -- Rocketeer: Gold
    A(t[925], a[9786]); -- Wayfarer
    A(t[925], a[9787]); -- Wanderluster: Bronze
    A(t[925], a[9790]); -- Wanderluster: Silver
    A(t[925], a[9792]); -- Wanderluster: Gold
    A(t[925], a[9780]); -- Go-Getter
    A(t[925], a[9781]); -- Powermonger: Bronze
    A(t[925], a[9783]); -- Powermonger: Silver
    A(t[925], a[9785]); -- Powermonger: Gold
    A(t[925], a[9793]); -- Big Race Enthusiast
    A(t[925], a[9794]); -- Big Race Novice
    A(t[925], a[9795]); -- Big Race Jockey
    A(t[925], a[9797]); -- Big Race Leadfoot
    A(t[925], a[9799]); -- Big Race Roadhog
    A(t[925], a[9800]); -- Rocket Man
    A(t[925], a[9801]); -- Big Rocketeer: Bronze
    A(t[925], a[9803]); -- Big Rocketeer: Silver
    A(t[925], a[9805]); -- Big Rocketeer: Gold
    A(t[925], a[9806]); -- Vagabond
    A(t[925], a[9807]); -- Big Wanderluster: Bronze
    A(t[925], a[9809]); -- Big Wanderluster: Silver
    A(t[925], a[9811]); -- Big Wanderluster: Gold
    A(t[925], a[9812]); -- Goal-Oriented
    A(t[925], a[9813]); -- Big Powermonger: Bronze
    A(t[925], a[9815]); -- Big Powermonger: Silver
    A(t[925], a[9817]); -- Big Powermonger: Gold
    A(t[925], a[9819]); -- Darkmoon Like the Wind
    A(t[925], a[11918]); -- "Hey, You're a Rockstar!"
    A(t[925], a[11919]); -- Taking this Show on the Road
    A(t[925], a[11920]); -- Perfect Performance
    A(t[925], a[11921]); -- Mosh Pit
    A(t[925], a[15212]); -- First Dance
    A(t[925], a[15213]); -- Don't Stop Dancing
    A(t[925], a[15222]); -- You Got the Beat
    A(t[925], a[15223]); -- Feeling It
    A(t[925], a[15214]); -- What a Feeling
    A(t[925], a[15215]); -- Can't Stop the Feeling
    A(t[925], a[15216]); -- Make You Sweat
    A(t[925], a[15217]); -- Maniac on the Dance Floor
    A(t[925], a[15221]); -- Dancing Machine
    t[1030] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[925], t[1030]);
    A(t[1030], a[2336]); -- Insane in the Membrane
    t[951] = c:New(k.GetCategoryInfoTitle(15454)); -- Timewalking
    C(t[884], t[951]);
    A(t[951], a[13931]); -- "Memories of Fel, Frost and Fire"
    A(t[951], a[13928]); -- Alterac Valley of Olde
    A(t[951], a[13930]); -- Alterac Valley of Olde
    t[954] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[951], t[954]);
    A(t[954], a[15309]); -- A Towering Success
    A(t[954], a[15310]); -- A Tour of Towers
    A(t[954], a[15308]); -- Tower Overwhelming
    t[1174] = c:New(k.L["Miscellaneous"]); -- Miscellaneous
    C(t[884], t[1174]);
    A(t[1174], a[1636]); -- Competitor's Tabard
    A(t[1174], a[1637]); -- Spirit of Competition
    A(t[1174], a[2079]); -- Tabard of the Protector
    A(t[1174], a[2116]); -- Tabard of the Argent Dawn
    A(t[1174], a[11395]); -- Diablo's 20th Anniversary
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
    t[1219] = c:New(k.L["Focused"]); -- Focused
    C(t[955], t[1219]);
    t[1219].HasFlexibleData = true;
    tinsert(focusedCategories, t[1219]);
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
    t[1162] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[955], t[1162]);
    A(t[1162], a[10561]); -- Honorable Medallion
    A(t[1162], a[238]); -- An Honorable Kill
    A(t[1162], a[513]); -- 100 Honorable Kills
    A(t[1162], a[515]); -- 500 Honorable Kills
    A(t[1162], a[516]); -- 1000 Honorable Kills
    A(t[1162], a[512]); -- 5000 Honorable Kills
    A(t[1162], a[509]); -- 10000 Honorable Kills
    A(t[1162], a[239]); -- 25000 Honorable Kills
    A(t[1162], a[869]); -- 50000 Honorable Kills
    A(t[1162], a[870]); -- 100000 Honorable Kills
    A(t[1162], a[5363]); -- 250000 Honorable Kills
    A(t[1162], a[1157]); -- Duel-icious
    A(t[1162], a[245]); -- That Takes Class
    A(t[1162], a[246]); -- Know Thy Enemy
    A(t[1162], a[1005]); -- Know Thy Enemy
    A(t[1162], a[247]); -- "Make Love, Not Warcraft"
    A(t[1162], a[727]); -- Call in the Cavalry
    A(t[1162], a[12567]); -- The Horde Slayer
    A(t[1162], a[12568]); -- The Alliance Slayer
    A(t[1162], a[3618]); -- Murkimus the Gladiator
    A(t[1162], a[8391]); -- Tournament Participation 2013
    A(t[1162], a[8392]); -- Tournament Glory 2013
    A(t[1162], a[5542]); -- 1000 Conquest Points
    A(t[1162], a[5541]); -- 5000 Conquest Points
    A(t[1162], a[5540]); -- "25,000 Conquest Points"
    A(t[1162], a[5539]); -- "50,000 Conquest Points"
    A(t[1162], a[701]); -- Freedom of the Alliance
    A(t[1162], a[700]); -- Freedom of the Horde
    t[1167] = c:New(k.GetCategoryInfoTitle(15266)); -- Honor
    C(t[955], t[1167]);
    A(t[1167], a[12893]); -- Honor Level 5
    A(t[1167], a[12894]); -- Honor Level 10
    A(t[1167], a[12895]); -- Honor Level 15
    A(t[1167], a[12900]); -- Honor Level 20
    A(t[1167], a[12901]); -- Honor Level 25
    A(t[1167], a[12902]); -- Honor Level 30
    A(t[1167], a[12903]); -- Honor Level 40
    A(t[1167], a[12904]); -- Honor Level 50
    A(t[1167], a[12905]); -- Honor Level 60
    A(t[1167], a[12906]); -- Honor Level 70
    A(t[1167], a[12907]); -- Honor Level 80
    A(t[1167], a[12908]); -- Honor Level 90
    A(t[1167], a[12909]); -- Honor Level 100
    A(t[1167], a[12910]); -- Honor Level 125
    A(t[1167], a[12911]); -- Honor Level 150
    A(t[1167], a[12912]); -- Honor Level 175
    A(t[1167], a[12913]); -- Honor Level 200
    A(t[1167], a[12914]); -- Honor Level 250
    A(t[1167], a[12915]); -- Honor Level 300
    A(t[1167], a[12916]); -- Honor Level 400
    A(t[1167], a[12917]); -- Honor Level 500
    A(t[1167], a[13701]); -- Battlefield Brawler
    A(t[1167], a[13702]); -- Battlefield Tactician
    A(t[1167], a[13703]); -- Battlefield Master
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
    A(t[1165], a[8052]); -- Khan
    A(t[1165], a[8055]); -- Khan
    A(t[1165], a[5268]); -- In Service of the Alliance
    A(t[1165], a[5269]); -- In Service of the Horde
    A(t[1165], a[5322]); -- In Service of the Alliance
    A(t[1165], a[5323]); -- In Service of the Horde
    A(t[1165], a[5327]); -- In Service of the Alliance
    A(t[1165], a[5324]); -- In Service of the Horde
    A(t[1165], a[5328]); -- Veteran of the Alliance
    A(t[1165], a[5325]); -- Veteran of the Horde
    A(t[1165], a[5823]); -- Veteran of the Alliance II
    A(t[1165], a[5824]); -- Veteran of the Horde II
    A(t[1165], a[5329]); -- Warbound Veteran of the Alliance
    A(t[1165], a[5326]); -- Warbringer of the Horde
    A(t[1165], a[5330]); -- Private
    A(t[1165], a[5345]); -- Scout
    A(t[1165], a[5331]); -- Corporal
    A(t[1165], a[5346]); -- Grunt
    A(t[1165], a[5332]); -- Sergeant
    A(t[1165], a[5347]); -- Sergeant
    A(t[1165], a[5333]); -- Master Sergeant
    A(t[1165], a[5348]); -- Senior Sergeant
    A(t[1165], a[5334]); -- Sergeant Major
    A(t[1165], a[5349]); -- First Sergeant
    A(t[1165], a[5335]); -- Knight
    A(t[1165], a[5350]); -- Stone Guard
    A(t[1165], a[5336]); -- Knight-Lieutenant
    A(t[1165], a[5351]); -- Blood Guard
    A(t[1165], a[5337]); -- Knight-Captain
    A(t[1165], a[5352]); -- Legionnaire
    A(t[1165], a[5359]); -- Knight-Champion
    A(t[1165], a[5338]); -- Centurion
    A(t[1165], a[5339]); -- Lieutenant Commander
    A(t[1165], a[5353]); -- Champion
    A(t[1165], a[5340]); -- Commander
    A(t[1165], a[5354]); -- Lieutenant General
    A(t[1165], a[5341]); -- Marshal
    A(t[1165], a[5355]); -- General
    A(t[1165], a[5357]); -- Field Marshal
    A(t[1165], a[5342]); -- Warlord
    A(t[1165], a[5343]); -- Grand Marshal
    A(t[1165], a[5356]); -- High Warlord
    A(t[1165], a[6942]); -- Hero of the Alliance
    A(t[1165], a[6941]); -- Hero of the Horde
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
    A(t[961], a[9102]); -- Ashran Victory
    A(t[961], a[9218]); -- "Grand Theft, 1st Degree"
    A(t[961], a[9219]); -- "Grand Theft, 2nd Degree"
    A(t[961], a[9220]); -- "Grand Theft, 3rd Degree"
    A(t[961], a[9256]); -- Rescue Operation
    A(t[961], a[9257]); -- Rescue Operation
    A(t[961], a[9106]); -- Just for Me
    A(t[961], a[9216]); -- High-value Targets
    A(t[961], a[9104]); -- Bounty Hunter
    A(t[961], a[9103]); -- Bounty Hunter
    A(t[961], a[9222]); -- Divide and Conquer
    A(t[961], a[9228]); -- Down Goes Van Rook
    A(t[961], a[9225]); -- Take Them Out
    A(t[961], a[9224]); -- Take Them Out
    A(t[961], a[9408]); -- Operation Counterattack
    A(t[961], a[9217]); -- Operation Counterattack
    A(t[961], a[9105]); -- Tour of Duty
    A(t[961], a[9714]); -- Thy Kingdom Come
    A(t[961], a[9715]); -- Thy Kingdom Come
    A(t[961], a[9474]); -- Wrynn's Vanguard
    A(t[961], a[9473]); -- Vol'jin's Spear
    A(t[961], a[9214]); -- Hero of Stormshield
    A(t[961], a[9215]); -- Hero of Warspear
    t[964] = c:New(k.GetCategoryInfoTitle(15073)); -- Battle for Gilneas
    C(t[1165], t[964]);
    A(t[964], a[5245]); -- Battle for Gilneas Victory
    A(t[964], a[5246]); -- Battle for Gilneas Veteran
    A(t[964], a[5247]); -- Battle for Gilneas Perfection
    A(t[964], a[5248]); -- Bustin' Caps to Make It Haps
    A(t[964], a[5249]); -- One Two Three You Don't Know About Me
    A(t[964], a[5250]); -- Out of the Fog
    A(t[964], a[5251]); -- Not Your Average PUG'er
    A(t[964], a[5252]); -- Don't Get Cocky Kid
    A(t[964], a[5253]); -- Full Coverage
    A(t[964], a[5254]); -- Newbs to Plowshares
    A(t[964], a[5255]); -- Jugger Not
    A(t[964], a[5256]); -- Battle for Gilneas All-Star
    A(t[964], a[5257]); -- Battle for Gilneas Assassin
    A(t[964], a[5262]); -- Double Rainbow
    A(t[964], a[5258]); -- Master of the Battle for Gilneas
    t[957] = c:New(k.GetCategoryInfoTitle(15218)); -- Deepwind Gorge
    C(t[1165], t[957]);
    A(t[957], a[8331]); -- Deepwind Gorge Victory
    A(t[957], a[8332]); -- Deepwind Gorge Veteran
    A(t[957], a[8333]); -- Deepwind Gorge Perfection
    A(t[957], a[14187]); -- Cruisin' for a Brewsin'
    A(t[957], a[14186]); -- Market Dominance
    A(t[957], a[14188]); -- Well Gorged
    A(t[957], a[14175]); -- Master of Deepwind Gorge
    A(t[957], a[8350]); -- Mine! Mine! Mine!
    A(t[957], a[8351]); -- Other People's Property
    A(t[957], a[8354]); -- Puddle Jumper
    A(t[957], a[8355]); -- Weighed Down
    A(t[957], a[8359]); -- Capping Spree
    A(t[957], a[8358]); -- Deepwind Gorge All-Star
    A(t[957], a[8360]); -- Master of Deepwind Gorge
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
    A(t[968], a[12409]); -- Seething Shore Victory
    A(t[968], a[12410]); -- Seething Shore Veteran
    A(t[968], a[12404]); -- Claim Jumper
    A(t[968], a[12405]); -- Death from Above
    A(t[968], a[12406]); -- A Good Start
    A(t[968], a[12407]); -- Seething Shore Perfection
    A(t[968], a[12408]); -- Seething Shore Domination
    A(t[968], a[12411]); -- Blood and Sand
    A(t[968], a[12412]); -- Master of Seething Shore
    t[966] = c:New(k.GetCategoryInfoTitle(15162)); -- Silvershard Mines
    C(t[1165], t[966]);
    A(t[966], a[6739]); -- Silvershard Mines Victory
    A(t[966], a[6883]); -- Silvershard Mines Veteran
    A(t[966], a[7039]); -- The Long Riders
    A(t[966], a[7049]); -- Mine Cart Courier
    A(t[966], a[7057]); -- End of the Line
    A(t[966], a[7062]); -- Mine Mine Mine!
    A(t[966], a[7099]); -- Five for Five
    A(t[966], a[7100]); -- My Diamonds and Your Rust
    A(t[966], a[7102]); -- Escort Service
    A(t[966], a[7103]); -- Greed is Good
    A(t[966], a[7106]); -- Master of Silvershard Mines
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
    A(t[967], a[6740]); -- Temple of Kotmogu Victory
    A(t[967], a[6882]); -- Temple of Kotmogu Veteran
    A(t[967], a[6947]); -- Four Square
    A(t[967], a[6950]); -- Powerball
    A(t[967], a[6970]); -- Blackout
    A(t[967], a[6973]); -- Can't Stop Won't Stop
    A(t[967], a[6971]); -- I've Got the Power
    A(t[967], a[6972]); -- What is Best in Life?
    A(t[967], a[6980]); -- Temple of Kotmogu All-Star
    A(t[967], a[6981]); -- Master of Temple of Kotmogu
    t[965] = c:New(k.GetCategoryInfoTitle(15074)); -- Twin Peaks
    C(t[1165], t[965]);
    A(t[965], a[5208]); -- Twin Peaking
    A(t[965], a[5209]); -- Twin Peaks Veteran
    A(t[965], a[5210]); -- Two-Timer
    A(t[965], a[5211]); -- Top Defender
    A(t[965], a[5213]); -- Soaring Spirits
    A(t[965], a[5214]); -- Soaring Spirits
    A(t[965], a[5215]); -- Twin Peaks Perfection
    A(t[965], a[5216]); -- Peak Speed
    A(t[965], a[5226]); -- Cloud Nine
    A(t[965], a[5227]); -- Cloud Nine
    A(t[965], a[5229]); -- Drag a Maw
    A(t[965], a[5228]); -- Wild Hammering
    A(t[965], a[5219]); -- I'm in the White Lodge
    A(t[965], a[5220]); -- I'm in the Black Lodge
    A(t[965], a[5221]); -- "Fire, Walk With Me"
    A(t[965], a[5222]); -- "Fire, Walk With Me"
    A(t[965], a[5230]); -- Twin Peaks Mountaineer
    A(t[965], a[5231]); -- Double Jeopardy
    A(t[965], a[5552]); -- Double Jeopardy
    A(t[965], a[5223]); -- Master of Twin Peaks
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
    A(t[1032], a[9729]); -- Victory in Hillsbrad
    A(t[1032], a[9566]); -- Victory in Hillsbrad
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
    A(t[1166], a[5266]); -- Three's Company: 2400
    A(t[1166], a[5267]); -- Three's Company: 2700
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
    A(t[1166], a[15539]); -- Solo Aspirations
    A(t[1166], a[15511]); -- Solely Motivated
    A(t[1166], a[15540]); -- Steadfast Soloist
    A(t[1166], a[15541]); -- Sole Survivor
    A(t[1166], a[15543]); -- Successful Solos
    A(t[1166], a[15544]); -- Supreme Soloist
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
    t[949] = c:New(k.L["Focused"]); -- Focused
    C(t[971], t[949]);
    t[949].HasFlexibleData = true;
    tinsert(focusedCategories, t[949]);
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
    t[972] = c:New(k.L["Bur's Mount Collection"]); -- Bur's Mount Collection
    C(t[971], t[972]);
    A(t[972], a[3356]); -- Winterspring Frostsaber
    A(t[972], a[3357]); -- Venomhide Ravasaur
    A(t[972], a[12866]); -- 100 Exalted Reputations
    t[976] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[972], t[976]);
    A(t[976], a[2141]); -- Stable Keeper
    A(t[976], a[2142]); -- Filling Up The Barn
    A(t[976], a[2143]); -- Leading the Cavalry
    A(t[976], a[2536]); -- Mountain o' Mounts
    A(t[976], a[2537]); -- Mountain o' Mounts
    A(t[976], a[7860]); -- We're Going to Need More Saddles
    A(t[976], a[7862]); -- We're Going to Need More Saddles
    A(t[976], a[8304]); -- Mount Parade
    A(t[976], a[8302]); -- Mount Parade
    A(t[976], a[9598]); -- Mountacular
    A(t[976], a[9599]); -- Mountacular
    A(t[976], a[10356]); -- Lord of the Reins
    A(t[976], a[10355]); -- Lord of the Reins
    A(t[976], a[12932]); -- No Stable Big Enough
    A(t[976], a[12931]); -- No Stable Big Enough
    A(t[976], a[12933]); -- A Horde of Hoofbeats
    A(t[976], a[12934]); -- A Horde of Hoofbeats
    A(t[976], a[15834]); -- Thanks for the Carry!
    A(t[976], a[15833]); -- Thanks for the Carry!
    A(t[976], a[9713]); -- Awake the Drakes
    t[985] = c:New(k.L["Vendor"]); -- Vendor
    C(t[972], t[985]);
    A(t[985], a[2076]); -- Armored Brown Bear
    A(t[985], a[2077]); -- Wooly Mammoth
    A(t[985], a[2078]); -- Traveler's Tundra Mammoth
    A(t[985], a[4888]); -- One Hump or Two?
    A(t[985], a[7386]); -- Grand Expedition Yak
    A(t[985], a[8092]); -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    A(t[985], a[9909]); -- Heirloom Hoarder
    A(t[985], a[14183]); -- Conspicuous Consumption
    t[986] = c:New(k.GetCategoryInfoTitle(169)); -- Professions
    C(t[972], t[986]);
    A(t[986], a[2097]); -- Get to the Choppa!
    A(t[986], a[5749]); -- Vial of the Sands
    t[987] = c:New(k.L["Events"]); -- Events
    C(t[972], t[987]);
    A(t[987], a[416]); -- Scarab Lord
    A(t[987], a[980]); -- The Horseman's Reins
    A(t[987], a[3496]); -- A Brew-FAST Mount
    A(t[987], a[4627]); -- X-45 Heartbreaker
    A(t[987], a[2144]); -- "What a Long, Strange Trip It's Been"
    A(t[987], a[2145]); -- "What A Long, Strange Trip It's Been"
    A(t[987], a[9496]); -- Warlord's Deathwheel
    A(t[987], a[9550]); -- "Boldly, You Sought the Power of Ragnaros"
    A(t[987], a[13931]); -- "Memories of Fel, Frost and Fire"
    t[989] = c:New(k.L["Achievements"]); -- Achievements
    C(t[972], t[989]);
    A(t[989], a[879]); -- Old School Ride
    A(t[989], a[5767]); -- Scourer of the Eternal Sands
    A(t[989], a[11066]); -- Underbelly Tycoon
    A(t[989], a[13517]); -- Two Sides to Every Tale
    A(t[989], a[13638]); -- Undersea Usurper
    A(t[989], a[13994]); -- Through the Depths of Visions
    A(t[989], a[14751]); -- The Gang's All Here
    A(t[989], a[14752]); -- Things To Do When You're Dead
    A(t[989], a[14570]); -- Twisting Corridors: Layer 8
    A(t[989], a[15254]); -- The Jailer's Gauntlet: Layer 4
    A(t[989], a[15089]); -- Flawless Master (Layer 12)
    A(t[989], a[15322]); -- Flawless Master (Layer 16)
    A(t[989], a[15064]); -- Breaking the Chains
    A(t[989], a[15402]); -- Cyphers of the First Ones
    A(t[989], a[15336]); -- From A to Zereth
    t[979] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[972], t[979]);
    A(t[979], a[6375]); -- Challenge Conqueror: Silver
    A(t[979], a[8898]); -- Challenge Warlord: Silver
    A(t[979], a[14145]); -- Battle for Azeroth Keystone Master: Season Four
    A(t[979], a[14532]); -- Shadowlands Keystone Master: Season One
    A(t[979], a[15078]); -- Shadowlands Keystone Master: Season Two
    A(t[979], a[15499]); -- Shadowlands Keystone Master: Season Three
    A(t[979], a[15178]); -- Fake It 'Til You Make It
    t[983] = c:New(k.L["Drops"], true); -- Drops
    C(t[979], t[983]);
    A(t[983], a[729]); -- Deathcharger's Reins
    A(t[983], a[883]); -- Reins of the Raven Lord
    A(t[983], a[884]); -- Swift White Hawkstrider
    t[980] = c:New(k.L["Glory"], true); -- Glory
    C(t[979], t[980]);
    A(t[980], a[2136]); -- Glory of the Hero
    A(t[980], a[4845]); -- Glory of the Cataclysm Hero
    A(t[980], a[6927]); -- Glory of the Pandaria Hero
    A(t[980], a[9396]); -- Glory of the Draenor Hero
    A(t[980], a[11163]); -- Glory of the Legion Hero
    A(t[980], a[12812]); -- Glory of the Wartorn Hero
    A(t[980], a[14322]); -- Glory of the Shadowlands Hero
    t[982] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[972], t[982]);
    A(t[982], a[8398]); -- Ahead of the Curve: Garrosh Hellscream (10 player)
    A(t[982], a[8399]); -- Ahead of the Curve: Garrosh Hellscream (25 player)
    A(t[982], a[15684]); -- Fates of the Shadowlands Raids
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
    A(t[981], a[12401]); -- Glory of the Ulduar Raider
    A(t[981], a[2957]); -- Glory of the Ulduar Raider (10 player)
    A(t[981], a[2958]); -- Glory of the Ulduar Raider (25 player)
    A(t[981], a[4602]); -- Glory of the Icecrown Raider (10 player)
    A(t[981], a[4603]); -- Glory of the Icecrown Raider (25 player)
    A(t[981], a[4853]); -- Glory of the Cataclysm Raider
    A(t[981], a[5828]); -- Glory of the Firelands Raider
    A(t[981], a[6169]); -- Glory of the Dragon Soul Raider
    A(t[981], a[6932]); -- Glory of the Pandaria Raider
    A(t[981], a[8124]); -- Glory of the Thundering Raider
    A(t[981], a[8454]); -- Glory of the Orgrimmar Raider
    A(t[981], a[8985]); -- Glory of the Draenor Raider
    A(t[981], a[10149]); -- Glory of the Hellfire Raider
    A(t[981], a[11180]); -- Glory of the Legion Raider
    A(t[981], a[11987]); -- Glory of the Argus Raider
    A(t[981], a[12806]); -- Glory of the Uldir Raider
    A(t[981], a[13315]); -- Glory of the Dazar'alor Raider
    A(t[981], a[13687]); -- Glory of the Eternal Raider
    A(t[981], a[14146]); -- Glory of the Ny'alotha Raider
    A(t[981], a[14355]); -- Glory of the Nathria Raider
    A(t[981], a[15130]); -- Glory of the Dominant Raider
    A(t[981], a[15491]); -- Glory of the Sepulcher Raider
    t[977] = c:New(k.GetCategoryInfoTitle(95)); -- PvP
    C(t[972], t[977]);
    A(t[977], a[12895]); -- Honor Level 15
    A(t[977], a[12903]); -- Honor Level 40
    A(t[977], a[12906]); -- Honor Level 70
    A(t[977], a[12910]); -- Honor Level 125
    A(t[977], a[12911]); -- Honor Level 150
    A(t[977], a[12914]); -- Honor Level 250
    A(t[977], a[12917]); -- Honor Level 500
    A(t[977], a[9238]); -- Primal Combatant
    A(t[977], a[9236]); -- Primal Combatant
    A(t[977], a[11474]); -- "Free For All, More For Me"
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
    A(t[978], a[6003]); -- Vicious Gladiator's Twilight Drake
    A(t[978], a[6322]); -- Ruthless Gladiator's Twilight Drake
    A(t[978], a[6741]); -- Cataclysmic Gladiator's Twilight Drake
    A(t[978], a[8216]); -- Malevolent Gladiator's Cloud Serpent
    A(t[978], a[8678]); -- Tyrannical Gladiator's Cloud Serpent
    A(t[978], a[8705]); -- Grievous Gladiator's Cloud Serpent
    A(t[978], a[8707]); -- Prideful Gladiator's Cloud Serpent
    A(t[978], a[9229]); -- Primal Gladiator's Felblood Gronnling
    A(t[978], a[10137]); -- Wild Gladiator's Felblood Gronnling
    A(t[978], a[10146]); -- Warmongering Gladiator's Felblood Gronnling
    A(t[978], a[10999]); -- Vindictive Gladiator's Storm Dragon
    A(t[978], a[11000]); -- Fearless Gladiator's Storm Dragon
    A(t[978], a[11001]); -- Cruel Gladiator's Storm Dragon
    A(t[978], a[11002]); -- Ferocious Gladiator's Storm Dragon
    A(t[978], a[13450]); -- Fierce Gladiator's Storm Dragon
    A(t[978], a[12139]); -- Dominant Gladiator's Storm Dragon
    A(t[978], a[12140]); -- Demonic Gladiator's Storm Dragon
    A(t[978], a[12961]); -- Gladiator: Battle for Azeroth Season 1
    A(t[978], a[13093]); -- Dread Gladiator's Proto-Drake
    A(t[978], a[13212]); -- Gladiator: Battle for Azeroth Season 2
    A(t[978], a[13202]); -- Sinister Gladiator's Proto-Drake
    A(t[978], a[13647]); -- Gladiator: Battle for Azeroth Season 3
    A(t[978], a[13632]); -- Notorious Gladiator's Proto-Drake
    A(t[978], a[13967]); -- Gladiator: Battle for Azeroth Season 4
    A(t[978], a[13958]); -- Corrupted Gladiator's Proto-Drake
    A(t[978], a[14689]); -- Gladiator: Shadowlands Season 1
    A(t[978], a[14816]); -- Sinful Gladiator's Soul Eater
    A(t[978], a[14972]); -- Gladiator: Shadowlands Season 2
    A(t[978], a[14999]); -- Unchained Gladiator's Soul Eater
    A(t[978], a[15352]); -- Gladiator: Shadowlands Season 3
    A(t[978], a[15384]); -- Cosmic Gladiator's Soul Eater
    A(t[978], a[15605]); -- Gladiator: Shadowlands Season 4
    A(t[978], a[15612]); -- Eternal Gladiator's Soul Eater
    A(t[978], a[15957]); -- Gladiator: Dragonflight Season 1
    t[988] = c:New(k.L["Recruit-a-Friend"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Recruit-a-Friend
    C(t[972], t[988]);
    A(t[988], a[1436]); -- Friends In High Places
    A(t[988], a[4832]); -- Friends In Even Higher Places
    A(t[988], a[8213]); -- Friends In Places Higher Yet
    A(t[988], a[8794]); -- Friends In Places Even Higher Than That
    A(t[988], a[9925]); -- Friends In Places Yet Even Higher Than That
    t[1043] = c:New(k.L["The Entitled"] .. " " .. (UnitName("player"))); -- The Entitled Player
    C(t[971], t[1043]);
    t[1045] = c:New(k.GetCategoryInfoTitle(14864)); -- Classic
    C(t[1043], t[1045]);
    A(t[1045], a[15579]); -- Return to Lordaeron
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
    A(t[1057], a[9058]); -- Leeeeeeeeeeeeeroy...?
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
    A(t[1048], a[5767]); -- Scourer of the Eternal Sands
    t[1058] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1048], t[1058]);
    A(t[1058], a[5879]); -- Veteran of the Molten Front
    t[1059] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1048], t[1059]);
    A(t[1059], a[5827]); -- Avengers of Hyjal
    t[1060] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1048], t[1060]);
    A(t[1060], a[5116]); -- Heroic: Nefarian
    A(t[1060], a[5121]); -- Heroic: Sinestra
    A(t[1060], a[5123]); -- Heroic: Al'Akir
    A(t[1060], a[5506]); -- Defender of a Shattered World
    A(t[1060], a[5803]); -- Heroic: Ragnaros
    A(t[1060], a[6177]); -- Destroyer's End
    A(t[1060], a[6116]); -- Heroic: Madness of Deathwing
    t[1049] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[1043], t[1049]);
    t[1061] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1049], t[1061]);
    A(t[1061], a[7284]); -- Is Another Man's Treasure
    A(t[1061], a[7479]); -- The Shado-Master
    A(t[1061], a[8121]); -- Stormbreaker
    t[1062] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1049], t[1062]);
    A(t[1062], a[6544]); -- The Tillers
    A(t[1062], a[8023]); -- Wakener
    t[1063] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1049], t[1063]);
    A(t[1063], a[6926]); -- Tranquil Master
    A(t[1063], a[6724]); -- Heroic: Will of the Emperor
    A(t[1063], a[6734]); -- Heroic: Sha of Fear
    A(t[1063], a[8067]); -- Heroic: Lei Shen
    A(t[1063], a[8679]); -- Conqueror of Orgrimmar
    A(t[1063], a[8680]); -- Liberator of Orgrimmar
    A(t[1063], a[8482]); -- Mythic: Garrosh Hellscream
    t[1064] = c:New(k.L["Scenarios"], true); -- Scenarios
    C(t[1049], t[1064]);
    A(t[1064], a[6874]); -- Scenaturday
    A(t[1064], a[7509]); -- Scenaturday
    A(t[1064], a[9577]); -- Proving Yourself: Endless Damage (Wave 30)
    A(t[1064], a[9583]); -- Proving Yourself: Endless Tank (Wave 30)
    A(t[1064], a[9589]); -- Proving Yourself: Endless Healer (Wave 30)
    t[1050] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[1043], t[1050]);
    t[1066] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1050], t[1066]);
    A(t[1066], a[10072]); -- Rumble in the Jungle
    A(t[1066], a[10265]); -- Rumble in the Jungle
    A(t[1066], a[10334]); -- Predator
    t[1067] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1050], t[1067]);
    A(t[1067], a[9470]); -- Council of Exarchs
    A(t[1067], a[9471]); -- Frostwolf Orcs
    A(t[1067], a[9476]); -- Sha'tari Defense
    A(t[1067], a[9475]); -- Laughing Skull Orcs
    A(t[1067], a[9072]); -- Mantle of the Talon King
    A(t[1067], a[9474]); -- Wrynn's Vanguard
    A(t[1067], a[9473]); -- Vol'jin's Spear
    A(t[1067], a[9472]); -- Steamwheedle Preservation Society
    t[1068] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1050], t[1068]);
    A(t[1068], a[9619]); -- Savage Hero
    A(t[1068], a[8965]); -- Mythic: Imperator's Fall
    A(t[1068], a[8973]); -- Mythic: Blackhand's Crucible
    A(t[1068], a[10043]); -- Mythic: Archimonde
    t[1069] = c:New(k.L["Garrison"], true); -- Garrison
    C(t[1050], t[1069]);
    A(t[1069], a[9540]); -- The Stable Master
    A(t[1069], a[9706]); -- The Stable Master
    A(t[1069], a[9094]); -- Garrison Architect
    A(t[1069], a[9077]); -- Choppin' Some More Logs
    A(t[1069], a[9078]); -- Choppin' Even More Logs
    A(t[1069], a[9080]); -- Choppin' Even More Logs
    A(t[1069], a[10164]); -- Master of the Seas
    A(t[1069], a[9725]); -- The Last of Us
    A(t[1069], a[9517]); -- Nemesis: Death Stalker
    A(t[1069], a[9513]); -- Nemesis: Scourge of the Kaldorei
    A(t[1069], a[9516]); -- Nemesis: Slayer of Sin'dorei
    A(t[1069], a[9509]); -- Nemesis: Draenei Destroyer
    A(t[1069], a[9521]); -- Nemesis: The Butcher
    A(t[1069], a[9511]); -- Nemesis: Gnomebane
    A(t[1069], a[9522]); -- Nemesis: Troll Hunter
    A(t[1069], a[9510]); -- Nemesis: Dwarfstalker
    A(t[1069], a[9519]); -- Nemesis: Orcslayer
    A(t[1069], a[9512]); -- Nemesis: Manslayer
    A(t[1069], a[9518]); -- Nemesis: Killer of Kezan
    A(t[1069], a[9515]); -- Nemesis: Worgen Hunter
    A(t[1069], a[9520]); -- Nemesis: Huojin's Fall
    A(t[1069], a[9514]); -- Nemesis: Terror of the Tushui
    A(t[1069], a[9738]); -- Warlord of Draenor
    A(t[1069], a[9508]); -- Warlord of Draenor
    t[1051] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[1043], t[1051]);
    t[1074] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1051], t[1074]);
    A(t[1074], a[11232]); -- "Lock, Stock and Two Smoking Goblins"
    t[1070] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1051], t[1070]);
    A(t[1070], a[12104]); -- And We're All Out of Mana Buns
    A(t[1070], a[12083]); -- Paragon of Argus
    t[1071] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1051], t[1071]);
    A(t[1071], a[11941]); -- Chromie Homie
    t[1072] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1051], t[1072]);
    A(t[1072], a[10827]); -- Mythic: Xavius
    A(t[1072], a[10850]); -- Mythic: Gul'dan
    A(t[1072], a[11781]); -- Mythic: Kil'jaeden
    A(t[1072], a[12002]); -- Mythic: Argus the Unmaker
    A(t[1072], a[11763]); -- Glory of the Tomb Raider
    A(t[1072], a[11387]); -- The Chosen
    t[1052] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[1043], t[1052]);
    t[1075] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1052], t[1075]);
    A(t[1075], a[13925]); -- The Fourth War
    A(t[1075], a[13924]); -- The Fourth War
    A(t[1075], a[12497]); -- Drust Do It.
    t[1076] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1052], t[1076]);
    A(t[1076], a[13134]); -- Expedition Leader
    A(t[1076], a[13638]); -- Undersea Usurper
    A(t[1076], a[13555]); -- Junkyard Tinkmaster
    t[1077] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1052], t[1077]);
    A(t[1077], a[12533]); -- Mythic: G'huun
    A(t[1077], a[13314]); -- Mythic: Lady Jaina Proudmoore
    A(t[1077], a[13733]); -- Mythic: Queen Azshara
    A(t[1077], a[14055]); -- Mythic: N'Zoth the Corruptor
    t[1078] = c:New(k.GetCategoryInfoTitle(15417), true); -- Heart of Azeroth
    C(t[1052], t[1078]);
    A(t[1078], a[13779]); -- Phenomenal Cosmic Power
    t[1079] = c:New(k.GetCategoryInfoTitle(15426), true); -- Visions of N'Zoth
    C(t[1052], t[1079]);
    A(t[1079], a[14140]); -- Mad World
    t[1053] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[1043], t[1053]);
    t[1080] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1053], t[1080]);
    A(t[1080], a[14277]); -- The Accuser's Avowed
    t[1081] = c:New(k.GetCategoryInfoTitle(15271), true); -- Raids
    C(t[1053], t[1081]);
    A(t[1081], a[14365]); -- Mythic: Sire Denathrius
    A(t[1081], a[15121]); -- Mythic: Sylvanas Windrunner
    A(t[1081], a[15489]); -- Mythic: The Jailer
    t[1082] = c:New(k.GetCategoryInfoTitle(15440), true); -- Torghast
    C(t[1053], t[1082]);
    A(t[1082], a[14568]); -- Twisting Corridors: Layer 6
    t[1083] = c:New(k.GetCategoryInfoTitle(15441), true); -- Covenant Sanctums
    C(t[1053], t[1083]);
    A(t[1083], a[14752]); -- Things To Do When You're Dead
    A(t[1083], a[14682]); -- The Party Herald
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
    A(t[1086], a[9924]); -- Field Photographer
    A(t[1086], a[12439]); -- Priority Mail
    t[1088] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1084], t[1088]);
    A(t[1088], a[1015]); -- 40 Exalted Reputations
    A(t[1088], a[6742]); -- 60 Exalted Reputations
    A(t[1088], a[12864]); -- 80 Exalted Reputations
    A(t[1088], a[12866]); -- 100 Exalted Reputations
    t[1087] = c:New(k.GetCategoryInfoTitle(15272), true); -- Dungeons
    C(t[1084], t[1087]);
    A(t[1087], a[4477]); -- Looking For Many
    t[1089] = c:New(k.GetCategoryInfoTitle(15117), true); -- Pet Battles
    C(t[1084], t[1089]);
    A(t[1089], a[6607]); -- Taming Azeroth
    A(t[1089], a[14020]); -- Pet Battle Challenge: Blackrock Depths
    A(t[1089], a[8301]); -- Deadly Pet Brawler
    t[1090] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")", true); -- Brawler's Guild
    C(t[1084], t[1090]);
    A(t[1090], a[13191]); -- Brawler for Azeroth
    t[1091] = c:New(k.GetCategoryInfoTitle(15246), true); -- Collections
    C(t[1084], t[1091]);
    A(t[1091], a[6590]); -- World Safari
    A(t[1091], a[8397]); -- Crazy for Cats
    A(t[1091], a[10356]); -- Lord of the Reins
    A(t[1091], a[10355]); -- Lord of the Reins
    A(t[1091], a[10354]); -- Crashin' Thrashin' Commander
    A(t[1091], a[10694]); -- Fabulous
    A(t[1091], a[11761]); -- Azeroth's Next Top Model
    t[1092] = c:New(k.GetCategoryInfoTitle(169), true); -- Professions
    C(t[1084], t[1092]);
    A(t[1092], a[1516]); -- Accomplished Angler
    A(t[1092], a[7306]); -- Master of Pandaren Cooking
    A(t[1092], a[9464]); -- Professional Draenor Master
    A(t[1092], a[4855]); -- What was Briefly Yours is Now Mine
    A(t[1092], a[4856]); -- It Belongs in a Museum!
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
    A(t[1096], a[12901]); -- Honor Level 25
    A(t[1096], a[12904]); -- Honor Level 50
    A(t[1096], a[12907]); -- Honor Level 80
    A(t[1096], a[12909]); -- Honor Level 100
    A(t[1096], a[12913]); -- Honor Level 200
    A(t[1096], a[12915]); -- Honor Level 300
    A(t[1096], a[870]); -- 100000 Honorable Kills
    A(t[1096], a[5363]); -- 250000 Honorable Kills
    t[1095] = c:New(k.GetCategoryInfoTitle(15283), true); -- World
    C(t[1093], t[1095]);
    A(t[1095], a[8721]); -- Fire-Watcher
    A(t[1095], a[14191]); -- Servant of N'Zoth
    A(t[1095], a[12605]); -- Conqueror of Azeroth
    A(t[1095], a[12604]); -- Conqueror of Azeroth
    t[1097] = c:New(k.L["Dueler's Guild"], true); -- Dueler's Guild
    C(t[1093], t[1097]);
    A(t[1097], a[12861]); -- Master of Duels
    t[1098] = c:New(k.GetCategoryInfoTitle(153), true); -- Battlegrounds
    C(t[1093], t[1098]);
    A(t[1098], a[907]); -- The Justicar
    A(t[1098], a[714]); -- The Conqueror
    A(t[1098], a[8360]); -- Master of Deepwind Gorge
    A(t[1098], a[12412]); -- Master of Seething Shore
    A(t[1098], a[230]); -- Battlemaster
    A(t[1098], a[1175]); -- Battlemaster
    A(t[1098], a[8052]); -- Khan
    A(t[1098], a[8055]); -- Khan
    t[1099] = c:New(k.L["Rated"], true); -- Rated
    C(t[1093], t[1099]);
    A(t[1099], a[5328]); -- Veteran of the Alliance
    A(t[1099], a[5325]); -- Veteran of the Horde
    A(t[1099], a[5329]); -- Warbound Veteran of the Alliance
    A(t[1099], a[5326]); -- Warbringer of the Horde
    A(t[1099], a[5330]); -- Private
    A(t[1099], a[5345]); -- Scout
    A(t[1099], a[5331]); -- Corporal
    A(t[1099], a[5346]); -- Grunt
    A(t[1099], a[5332]); -- Sergeant
    A(t[1099], a[5347]); -- Sergeant
    A(t[1099], a[5333]); -- Master Sergeant
    A(t[1099], a[5348]); -- Senior Sergeant
    A(t[1099], a[5334]); -- Sergeant Major
    A(t[1099], a[5349]); -- First Sergeant
    A(t[1099], a[5335]); -- Knight
    A(t[1099], a[5350]); -- Stone Guard
    A(t[1099], a[5336]); -- Knight-Lieutenant
    A(t[1099], a[5351]); -- Blood Guard
    A(t[1099], a[5337]); -- Knight-Captain
    A(t[1099], a[5352]); -- Legionnaire
    A(t[1099], a[5359]); -- Knight-Champion
    A(t[1099], a[5338]); -- Centurion
    A(t[1099], a[5339]); -- Lieutenant Commander
    A(t[1099], a[5353]); -- Champion
    A(t[1099], a[5340]); -- Commander
    A(t[1099], a[5354]); -- Lieutenant General
    A(t[1099], a[5341]); -- Marshal
    A(t[1099], a[5355]); -- General
    A(t[1099], a[5357]); -- Field Marshal
    A(t[1099], a[5342]); -- Warlord
    A(t[1099], a[5343]); -- Grand Marshal
    A(t[1099], a[5356]); -- High Warlord
    t[1101] = c:New((UnitName("player")) .. " " .. (GetTitleName(334))); -- Player the Fabulous
    C(t[971], t[1101]);
    A(t[1101], a[11761]); -- Azeroth's Next Top Model
    t[1102] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[1101], t[1102]);
    A(t[1102], a[10681]); -- Fashionista: Head
    A(t[1102], a[10682]); -- Fashionista: Chest
    A(t[1102], a[10684]); -- Fashionista: Legs
    A(t[1102], a[10685]); -- Fashionista: Feet
    A(t[1102], a[10686]); -- Fashionista: Waist
    A(t[1102], a[10687]); -- Fashionista: Back
    A(t[1102], a[10688]); -- Fashionista: Wrist
    A(t[1102], a[10690]); -- Fashionista: Tabard
    A(t[1102], a[10691]); -- Fashionista: Shirt
    A(t[1102], a[10692]); -- Fashionista: Shoulder
    A(t[1102], a[10693]); -- Fashionista: Hand
    A(t[1102], a[10689]); -- Fashionista: Weapon & Off-Hand
    A(t[1102], a[10694]); -- Fabulous
    A(t[1102], a[16502]); -- Storming the Runway
    t[1103] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1101], t[1103]);
    A(t[1103], a[11741]); -- So Hot Right Now
    A(t[1103], a[11742]); -- Dress in Lairs
    A(t[1103], a[11743]); -- Accessor-Eyes
    A(t[1103], a[11744]); -- "Drop Dead, Gorgeous"
    A(t[1103], a[11746]); -- Outlandish Style
    A(t[1103], a[11747]); -- Merely a Set
    A(t[1103], a[11748]); -- Black is the New Black
    A(t[1103], a[11749]); -- "Suns Out, Thori'dals Out"
    A(t[1103], a[11750]); -- Undying Aesthetic
    A(t[1103], a[11751]); -- Mogg-Saron
    A(t[1103], a[11752]); -- Style of the Crusader
    A(t[1103], a[11753]); -- Winter Catalog
    A(t[1103], a[11754]); -- Glamour of Twilight
    A(t[1103], a[11755]); -- Hot Couture
    A(t[1103], a[11756]); -- Wardrobe of the Old Gods
    A(t[1103], a[11757]); -- Sha of Fabulous
    A(t[1103], a[11758]); -- Thunderwear
    A(t[1103], a[11759]); -- Yaass'shaarj
    A(t[1103], a[11740]); -- Make it W-orc W-orc
    A(t[1103], a[11631]); -- Extreme Makeover: Fel Edition
    A(t[1103], a[11628]); -- That's So Last Millennium
    A(t[1103], a[11762]); -- Can I Get A Helya
    A(t[1103], a[11760]); -- Retro Trend
    A(t[1103], a[12020]); -- Argussy Up
    A(t[1103], a[12991]); -- "New Mog, G'huun This?"
    A(t[1103], a[13385]); -- Daz'aling Attire
    A(t[1103], a[13571]); -- Under the Seams
    A(t[1103], a[14058]); -- All Eyes On Me
    A(t[1103], a[14614]); -- Castle Vain
    A(t[1103], a[15110]); -- Dominating the Catwalk
    A(t[1103], a[15409]); -- First Wonders
    t[1104] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[1101], t[1104]);
    A(t[1104], a[11706]); -- The Original
    A(t[1104], a[11707]); -- No Mercy
    A(t[1104], a[11708]); -- With a Vengeance
    A(t[1104], a[11709]); -- Tough Threads
    A(t[1104], a[11710]); -- Lethal Looks
    A(t[1104], a[11711]); -- The Fierce and the Furious
    A(t[1104], a[11712]); -- Relentlessly Good Looking
    A(t[1104], a[11713]); -- Wrath of the Stitch King
    A(t[1104], a[11714]); -- Viciously Vintage
    A(t[1104], a[11715]); -- (Ruth)less is More
    A(t[1104], a[11716]); -- Cataclysmic Catwalk
    A(t[1104], a[11717]); -- Why Male(volent) Models?
    A(t[1104], a[11718]); -- Dressed to Oppress
    A(t[1104], a[11719]); -- It's Not Fashion Unless It Hurts
    A(t[1104], a[11720]); -- Wear It With Pride
    A(t[1104], a[11629]); -- Untamed Beauty
    A(t[1104], a[11721]); -- Wild Style
    A(t[1104], a[11722]); -- War-Mog-ering
    A(t[1104], a[11630]); -- More Like Win-dictive
    A(t[1104], a[11723]); -- Cruel Intentions
    A(t[1104], a[12021]); -- Claws Out
    A(t[1104], a[12993]); -- Don't Warfront Me
    A(t[1104], a[13433]); -- "Tall, Dark, and Sinister"
    A(t[1104], a[13585]); -- "Never Lose, Never Choose To"
    A(t[1104], a[14059]); -- The Eyes Have It
    A(t[1104], a[14831]); -- "I Live, I Die, I Queue Again"
    A(t[1104], a[15102]); -- It's Off the Chain!
    A(t[1104], a[15408]); -- Cosmic Chic
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
    A(t[1111], a[5395]); -- Realm First! Grand Master Archaeologist
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
    A(t[1116], a[6829]); -- Realm First! Pandaren Ambassador
    t[1114] = c:New(k.GetCategoryInfoTitle(15272), true); -- Dungeons
    C(t[1105], t[1114]);
    A(t[1114], a[6433]); -- Realm First! Challenge Conqueror: Gold
    A(t[1114], a[11224]); -- Realm First! Legion Keystone Master
    A(t[1114], a[13078]); -- Realm First! Battle for Azeroth Keystone Master
    A(t[1114], a[14662]); -- Realm First! Shadowlands Keystone Master
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
    A(t[1117], a[10537]); -- Patron of War
    A(t[1117], a[10657]); -- Fledgling Hero of Warcraft
    A(t[1117], a[11210]); -- Fight for the Alliance
    A(t[1117], a[11211]); -- Fight for the Horde
    A(t[1117], a[15594]); -- Fearless Spectator
    t[1118] = c:New(k.L["BlizzCon"], true); -- BlizzCon
    C(t[1117], t[1118]);
    A(t[1118], a[411]); -- Murky
    A(t[1118], a[412]); -- Murloc Costume
    A(t[1118], a[415]); -- Big Blizzard Bear
    A(t[1118], a[3536]); -- The Marine Marine
    A(t[1118], a[5378]); -- Deathy
    A(t[1118], a[6185]); -- Murkablo
    A(t[1118], a[8793]); -- Murkalot
    A(t[1118], a[9763]); -- Grommloc
    A(t[1118], a[10322]); -- Murkidan
    A(t[1118], a[11294]); -- Murloc Battlemasters
    A(t[1118], a[11931]); -- Rides of War
    A(t[1118], a[13138]); -- Flying Colors
    A(t[1118], a[14027]); -- Battle for Mrrglroth
    A(t[1118], a[14904]); -- Netherwhelp Online
    t[1119] = c:New(k.L["Collector's Edition"], true); -- Collector's Edition
    C(t[1117], t[1119]);
    A(t[1119], a[662]); -- Collector's Edition: Mini-Diablo
    A(t[1119], a[663]); -- Collector's Edition: Panda
    A(t[1119], a[664]); -- Collector's Edition: Zergling
    A(t[1119], a[665]); -- Collector's Edition: Netherwhelp
    A(t[1119], a[683]); -- Collector's Edition: Frost Wyrm Whelp
    A(t[1119], a[5377]); -- Collector's Edition: Lil' Deathwing
    A(t[1119], a[6849]); -- Collector's Edition: Imperial Quilen
    A(t[1119], a[6848]); -- Collector's Edition: Lucky Quilen Cub
    A(t[1119], a[8916]); -- Collector's Edition: Dread Raven
    A(t[1119], a[8917]); -- Collector's Edition: Dread Hatchling
    A(t[1119], a[10320]); -- Collector's Edition: Illidari Felstalker
    A(t[1119], a[10321]); -- Collector's Edition: Nibbles
    A(t[1119], a[12229]); -- Collector's Edition: Seabraid Stallion
    A(t[1119], a[12230]); -- Collector's Edition: Gilded Ravasaur
    A(t[1119], a[12232]); -- Collector's Edition: Tottle
    A(t[1119], a[14283]); -- Heroic Edition: Ensorcelled Everwyrm
    A(t[1119], a[16332]); -- The Perfect Pebble
    t[1120] = c:New(k.L["Diablo III"], true); -- Diablo III
    C(t[1117], t[1120]);
    A(t[1120], a[7412]); -- Collector's Edition: Fetish Shaman
    A(t[1120], a[8795]); -- Collector's Edition: Treasure Goblin
    t[1121] = c:New(k.L["Overwatch"], true); -- Overwatch
    C(t[1117], t[1121]);
    A(t[1121], a[11064]); -- Collector's Edition: Baby Winston
    t[1122] = c:New(k.L["StarCraft II"], true); -- StarCraft II
    C(t[1117], t[1122]);
    A(t[1122], a[4824]); -- Collector's Edition: Mini Thor
    A(t[1122], a[7842]); -- Collector's Edition: Baneling
    A(t[1122], a[10309]); -- Collector's Edition: Zeradar
    A(t[1122], a[12454]); -- Salute to StarCraft
    t[1123] = c:New(k.L["Hearthstone"], true); -- Hearthstone
    C(t[1117], t[1123]);
    A(t[1123], a[8345]); -- Hearthstoned
    A(t[1123], a[15323]); -- Sarge's Tale
    t[1124] = c:New(k.L["Heroes of the Storm"], true); -- Heroes of the Storm
    C(t[1117], t[1124]);
    A(t[1124], a[9926]); -- Hero of the Storm
    A(t[1124], a[11425]); -- Herald of Flames
    t[1125] = c:New(k.L["Warcraft III: Reforged"], true); -- Warcraft III: Reforged
    C(t[1117], t[1125]);
    A(t[1125], a[13196]); -- Meat Marauder
    t[1346] = c:New(k.L["Ta's Pet Collection"]); -- Ta's Pet Collection
    C(t[971], t[1346]);
    A(t[1346], a[8820]); -- WoW's 10th Anniversary
    A(t[1346], a[3478]); -- Pilgrim
    t[1353] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[1346], t[1353]);
    A(t[1353], a[1250]); -- "Shop Smart, Shop Pet...Smart"
    A(t[1353], a[2516]); -- Lil' Game Hunter
    A(t[1353], a[5876]); -- Petting Zoo
    A(t[1353], a[5877]); -- Menagerie
    A(t[1353], a[5875]); -- Littlest Pet Shop
    A(t[1353], a[7521]); -- Time to Open a Pet Store
    A(t[1353], a[6582]); -- Pro Pet Mob
    A(t[1353], a[9069]); -- An Awfully Big Adventure
    A(t[1353], a[8297]); -- Merciless Pet Brawler
    A(t[1353], a[8298]); -- Vengeful Pet Brawler
    A(t[1353], a[8300]); -- Brutal Pet Brawler
    t[1354] = c:New(k.GetCategoryInfoTitle(15246)); -- Collections
    C(t[1346], t[1354]);
    A(t[1354], a[7500]); -- Going to Need More Leashes
    A(t[1354], a[7501]); -- That's a Lot of Pet Food
    A(t[1354], a[9643]); -- So. Many. Pets.
    A(t[1354], a[12992]); -- Pet Emporium
    A(t[1354], a[12958]); -- Master of Minions
    A(t[1354], a[12996]); -- Toybox Tycoon
    t[1355] = c:New(k.GetCategoryInfoTitle(168)); -- Dungeons & Raids
    C(t[1346], t[1355]);
    A(t[1355], a[7934]); -- Raiding with Leashes
    A(t[1355], a[8293]); -- Raiding with Leashes II: Attunement Edition
    A(t[1355], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    A(t[1355], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
    A(t[1355], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    A(t[1355], a[13469]); -- Raiding with Leashes VI: Pets of Pandaria
    t[1357] = c:New(k.GetCategoryInfoTitle(15117) .. " " .. k.GetCategoryInfoTitle(15272)); -- Pet Battles Dungeons
    C(t[1355], t[1357]);
    A(t[1357], a[11765]); -- Pet Battle Challenge: Wailing Caverns
    A(t[1357], a[11856]); -- Pet Battle Challenge: Deadmines
    A(t[1357], a[13269]); -- Pet Battle Challenge: Gnomeregan
    A(t[1357], a[13627]); -- Pet Battle Challenge: Stratholme
    t[1356] = c:New(k.GetCategoryInfoTitle(15101)); -- Darkmoon Faire
    C(t[1346], t[1356]);
    A(t[1356], a[9805]); -- Big Rocketeer: Gold
    A(t[1356], a[9983]); -- That's Whack!
    t[1378] = c:New(k.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    C(t[1346], t[1378]);
    A(t[1378], a[1956]); -- Higher Learning
    t[1352] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[1346], t[1352]);
    A(t[1352], a[5449]); -- Rock Lover
    t[1351] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[1346], t[1351]);
    A(t[1351], a[6402]); -- Ling-Ting's Herbal Journey
    t[1350] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[1346], t[1350]);
    A(t[1350], a[9685]); -- Draenor Safari
    t[1349] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[1346], t[1349]);
    A(t[1349], a[10412]); -- Poor Unfortunate Souls
    A(t[1349], a[9696]); -- Family Familiar
    A(t[1349], a[12100]); -- Family Fighter
    A(t[1349], a[11233]); -- Broken Isles Safari
    A(t[1349], a[10626]); -- Zoom!
    A(t[1349], a[11763]); -- Glory of the Tomb Raider
    A(t[1349], a[12439]); -- Priority Mail
    t[1348] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[1346], t[1348]);
    A(t[1348], a[12930]); -- Battle Safari
    A(t[1348], a[12482]); -- Get Hek'd
    A(t[1348], a[13062]); -- Let's Bee Friends
    A(t[1348], a[12723]); -- How to Keep a Mummy
    A(t[1348], a[13279]); -- Family Battler
    A(t[1348], a[13766]); -- Malowned
    A(t[1348], a[13695]); -- Team Aquashock
    A(t[1348], a[14143]); -- Reeking of Visions
    t[1347] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[1346], t[1347]);
    A(t[1347], a[14469]); -- Twisting Corridors: Layer 2
    A(t[1347], a[14879]); -- Family Exorcist
    A(t[1347], a[14881]); -- Abhorrent Adversaries of the Afterlife
    A(t[1347], a[15004]); -- A Sly Fox
    A(t[1347], a[15079]); -- "Many, Many Things"
    A(t[1347], a[15251]); -- The Jailer's Gauntlet: Layer 1
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
    return tabs, focusedCategories, currentZoneCategories, selectedZoneCategories, trackingAchievementsCategories, excludedCategories;
end

function exportedCategories.InjectOptions()
    local defaultsFocused = {};
    defaultsFocused[1] = false;
    defaultsFocused[2] = false;
    defaultsFocused[3] = false;
    defaultsFocused[4] = false;
    defaultsFocused[5] = true;

    k.Options.InjectDefaults(defaultsFocused, "Focused", "AdjustableCategories");

    local optionsTableFocused = {
        order = 2, type = "group",
        name = k.L["Focused"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Focused[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Focused[1] = not k.Options.db.AdjustableCategories.Focused[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.Focused[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Focused[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Focused[2] = not k.Options.db.AdjustableCategories.Focused[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.Focused[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Focused[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Focused[3] = not k.Options.db.AdjustableCategories.Focused[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.Focused[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Focused[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Focused[4] = not k.Options.db.AdjustableCategories.Focused[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.Focused[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Focused[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Focused[5] = not k.Options.db.AdjustableCategories.Focused[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.Focused[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableFocused, "Focused", "Layout", "args", "AdjustableCategories", "args");

    local defaultsCurrentZone = {};
    defaultsCurrentZone[1] = false;
    defaultsCurrentZone[2] = false;
    defaultsCurrentZone[3] = false;
    defaultsCurrentZone[4] = false;
    defaultsCurrentZone[5] = true;

    k.Options.InjectDefaults(defaultsCurrentZone, "CurrentZone", "AdjustableCategories");

    local optionsTableCurrentZone = {
        order = 3, type = "group",
        name = k.L["Current Zone"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.CurrentZone[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.CurrentZone[1] = not k.Options.db.AdjustableCategories.CurrentZone[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.CurrentZone[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.CurrentZone[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.CurrentZone[2] = not k.Options.db.AdjustableCategories.CurrentZone[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.CurrentZone[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.CurrentZone[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.CurrentZone[3] = not k.Options.db.AdjustableCategories.CurrentZone[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.CurrentZone[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.CurrentZone[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.CurrentZone[4] = not k.Options.db.AdjustableCategories.CurrentZone[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.CurrentZone[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.CurrentZone[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.CurrentZone[5] = not k.Options.db.AdjustableCategories.CurrentZone[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.CurrentZone[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableCurrentZone, "CurrentZone", "Layout", "args", "AdjustableCategories", "args");

    local defaultsSelectedZone = {};
    defaultsSelectedZone[1] = false;
    defaultsSelectedZone[2] = false;
    defaultsSelectedZone[3] = false;
    defaultsSelectedZone[4] = false;
    defaultsSelectedZone[5] = true;

    k.Options.InjectDefaults(defaultsSelectedZone, "SelectedZone", "AdjustableCategories");

    local optionsTableSelectedZone = {
        order = 4, type = "group",
        name = k.L["Selected Zone"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.SelectedZone[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.SelectedZone[1] = not k.Options.db.AdjustableCategories.SelectedZone[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.SelectedZone[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.SelectedZone[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.SelectedZone[2] = not k.Options.db.AdjustableCategories.SelectedZone[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.SelectedZone[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.SelectedZone[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.SelectedZone[3] = not k.Options.db.AdjustableCategories.SelectedZone[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.SelectedZone[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.SelectedZone[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.SelectedZone[4] = not k.Options.db.AdjustableCategories.SelectedZone[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.SelectedZone[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.SelectedZone[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.SelectedZone[5] = not k.Options.db.AdjustableCategories.SelectedZone[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.SelectedZone[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableSelectedZone, "SelectedZone", "Layout", "args", "AdjustableCategories", "args");

    local defaultsTrackingAchievements = {};
    defaultsTrackingAchievements[1] = false;
    defaultsTrackingAchievements[2] = false;
    defaultsTrackingAchievements[3] = false;
    defaultsTrackingAchievements[4] = false;
    defaultsTrackingAchievements[5] = true;

    k.Options.InjectDefaults(defaultsTrackingAchievements, "TrackingAchievements", "AdjustableCategories");

    local optionsTableTrackingAchievements = {
        order = 5, type = "group",
        name = k.L["Tracking Achievements"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.TrackingAchievements[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.TrackingAchievements[1] = not k.Options.db.AdjustableCategories.TrackingAchievements[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.TrackingAchievements[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.TrackingAchievements[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.TrackingAchievements[2] = not k.Options.db.AdjustableCategories.TrackingAchievements[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.TrackingAchievements[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.TrackingAchievements[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.TrackingAchievements[3] = not k.Options.db.AdjustableCategories.TrackingAchievements[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.TrackingAchievements[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.TrackingAchievements[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.TrackingAchievements[4] = not k.Options.db.AdjustableCategories.TrackingAchievements[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.TrackingAchievements[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.TrackingAchievements[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.TrackingAchievements[5] = not k.Options.db.AdjustableCategories.TrackingAchievements[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.TrackingAchievements[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableTrackingAchievements, "TrackingAchievements", "Layout", "args", "AdjustableCategories", "args");

    local defaultsExcluded = {};
    defaultsExcluded[1] = false;
    defaultsExcluded[2] = false;
    defaultsExcluded[3] = false;
    defaultsExcluded[4] = false;
    defaultsExcluded[5] = true;

    k.Options.InjectDefaults(defaultsExcluded, "Excluded", "AdjustableCategories");

    local optionsTableExcluded = {
        order = 6, type = "group",
        name = k.L["Excluded"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Excluded[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Excluded[1] = not k.Options.db.AdjustableCategories.Excluded[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.Excluded[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Excluded[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Excluded[2] = not k.Options.db.AdjustableCategories.Excluded[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.Excluded[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Excluded[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Excluded[3] = not k.Options.db.AdjustableCategories.Excluded[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.Excluded[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Excluded[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Excluded[4] = not k.Options.db.AdjustableCategories.Excluded[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.Excluded[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.Excluded[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.Excluded[5] = not k.Options.db.AdjustableCategories.Excluded[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.Excluded[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableExcluded, "Excluded", "Layout", "args", "AdjustableCategories", "args");
end

