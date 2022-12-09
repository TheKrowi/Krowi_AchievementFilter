-- [[ Exported at 2022-12-09 14-31-23 ]] --
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
    t[1217] = c:New(k.L["Watch List"]); -- Watch List
    C(t[883], t[1217]);
    t[1217].HasFlexibleData = true;
    tinsert(watchListCategories, t[1217]);
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
    t[687] = c:New(k.GetMapName(13)); -- Eastern Kingdoms
    C(t[648], t[687]);
    A(t[687], a[1676]); -- Loremaster of Eastern Kingdoms
    A(t[687], a[42]); -- Eastern Kingdoms Explorer
    A(t[687], a[7520]); -- The Loremaster
    t[922] = c:New(k.GetMapName(84)); -- Stormwind City
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
    t[970] = c:New(k.GetMapName(87)); -- Ironforge
    C(t[687], t[970]);
    A(t[970], a[616]); -- Overthrow the Council
    A(t[970], a[619]); -- For the Horde!
    A(t[970], a[603]); -- Wrath of the Horde
    t[974] = c:New(k.GetMapName(90)); -- Undercity
    C(t[687], t[974]);
    A(t[974], a[612]); -- Downing the Dark Lady
    A(t[974], a[604]); -- Wrath of the Alliance
    t[721] = c:New(k.GetMapName(27)); -- Dun Morogh
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
    t[722] = c:New(k.GetMapName(37)); -- Elwynn Forest
    C(t[687], t[722]);
    t[724] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[722], t[724]);
    A(t[724], a[776]); -- Explore Elwynn Forest
    A(t[724], a[9924]); -- Field Photographer
    t[1006] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[722], t[1006]);
    A(t[1006], a[948]); -- Ambassador of the Alliance
    t[725] = c:New(k.GetMapName(18)); -- Tirisfal Glades
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
    t[651] = c:New(k.GetMapName(52)); -- Westfall
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
    t[655] = c:New(k.GetMapName(48)); -- Loch Modan
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
    t[681] = c:New(k.GetMapName(21)); -- Silverpine Forest
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
    t[678] = c:New(k.GetMapName(49)); -- Redridge Mountains
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
    t[652] = c:New(k.GetMapName(47)); -- Duskwood
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
    t[656] = c:New(k.GetMapName(56)); -- Wetlands
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
    t[671] = c:New(k.GetMapName(25)); -- Hillsbrad Foothills
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
    t[649] = c:New(k.GetMapName(14)); -- Arathi Highlands
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
    t[675] = c:New(k.GetMapName(50)); -- Northern Stranglethorn
    C(t[687], t[675]);
    t[676] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[675], t[676]);
    A(t[676], a[4906]); -- Northern Stranglethorn Quests
    A(t[676], a[940]); -- The Green Hills of Stranglethorn
    A(t[676], a[941]); -- Hemet Nesingwary: The Collected Quests
    t[739] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[675], t[739]);
    A(t[739], a[781]); -- Explore Northern Stranglethorn
    t[1016] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[675], t[1016]);
    A(t[1016], a[948]); -- Ambassador of the Alliance
    A(t[1016], a[762]); -- Ambassador of the Horde
    t[665] = c:New(k.GetMapName(210)); -- The Cape of Stranglethorn
    C(t[687], t[665]);
    t[666] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[665], t[666]);
    A(t[666], a[4905]); -- Cape of Stranglethorn Quests
    t[740] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[665], t[740]);
    A(t[740], a[4995]); -- Explore the Cape of Stranglethorn
    A(t[740], a[9924]); -- Field Photographer
    t[1164] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[665], t[1164]);
    A(t[1164], a[389]); -- Gurubashi Arena Master
    A(t[1164], a[396]); -- Gurubashi Arena Grand Master
    t[993] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[665], t[993]);
    A(t[993], a[762]); -- Ambassador of the Horde
    A(t[993], a[871]); -- "Avast Ye, Admiral!"
    A(t[993], a[2336]); -- Insane in the Membrane
    t[685] = c:New(k.GetMapName(22)); -- Western Plaguelands
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
    t[673] = c:New(k.GetMapName(26)); -- The Hinterlands
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
    t[667] = c:New(k.GetMapName(23)); -- Eastern Plaguelands
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
    t[659] = c:New(k.GetMapName(15)); -- Badlands
    C(t[687], t[659]);
    A(t[659], a[16431]); -- Against the Elements
    t[661] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[659], t[661]);
    A(t[661], a[4900]); -- Badlands Quests
    A(t[661], a[5444]); -- "Ready, Set, Goat!"
    t[738] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[659], t[738]);
    A(t[738], a[765]); -- Explore Badlands
    t[679] = c:New(k.GetMapName(32)); -- Searing Gorge
    C(t[687], t[679]);
    t[680] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[679], t[680]);
    A(t[680], a[4910]); -- Searing Gorge Quests
    t[743] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[679], t[743]);
    A(t[743], a[774]); -- Explore Searing Gorge
    t[683] = c:New(k.GetMapName(51)); -- Swamp of Sorrows
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
    t[663] = c:New(k.GetMapName(36)); -- Burning Steppes
    C(t[687], t[663]);
    A(t[663], a[11296]); -- The Ancient Keeper
    t[664] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[663], t[664]);
    A(t[664], a[4901]); -- Burning Steppes Quests
    t[745] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[663], t[745]);
    A(t[745], a[775]); -- Explore Burning Steppes
    A(t[745], a[9924]); -- Field Photographer
    t[660] = c:New(k.GetMapName(17)); -- Blasted Lands
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
    t[748] = c:New(k.GetMapName(42)); -- Deadwind Pass
    C(t[687], t[748]);
    t[749] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[748], t[749]);
    A(t[749], a[777]); -- Explore Deadwind Pass
    t[688] = c:New(k.GetMapName(12)); -- Kalimdor
    C(t[648], t[688]);
    A(t[688], a[1678]); -- Loremaster of Kalimdor
    A(t[688], a[43]); -- Kalimdor Explorer
    A(t[688], a[7520]); -- The Loremaster
    t[975] = c:New(k.GetMapName(89)); -- Darnassus
    C(t[688], t[975]);
    A(t[975], a[617]); -- Immortal No More
    A(t[975], a[603]); -- Wrath of the Horde
    t[921] = c:New(k.GetMapName(85)); -- Orgrimmar
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
    t[923] = c:New(k.GetMapName(88)); -- Thunder Bluff
    C(t[688], t[923]);
    A(t[923], a[611]); -- Bleeding Bloodhoof
    A(t[923], a[604]); -- Wrath of the Alliance
    t[756] = c:New(k.GetMapName(57)); -- Teldrassil
    C(t[688], t[756]);
    t[757] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[756], t[757]);
    A(t[757], a[842]); -- Explore Teldrassil
    t[1025] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[756], t[1025]);
    A(t[1025], a[948]); -- Ambassador of the Alliance
    t[752] = c:New(k.GetMapName(1)); -- Durotar
    C(t[688], t[752]);
    A(t[752], a[4790]); -- Zalazane's Fall
    t[753] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[752], t[753]);
    A(t[753], a[728]); -- Explore Durotar
    A(t[753], a[9924]); -- Field Photographer
    t[1003] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[752], t[1003]);
    A(t[1003], a[762]); -- Ambassador of the Horde
    t[754] = c:New(k.GetMapName(7)); -- Mulgore
    C(t[688], t[754]);
    t[755] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[754], t[755]);
    A(t[755], a[736]); -- Explore Mulgore
    t[1014] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[754], t[1014]);
    A(t[1014], a[762]); -- Ambassador of the Horde
    t[774] = c:New(k.GetMapName(80)); -- Moonglade
    C(t[688], t[774]);
    t[775] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[774], t[775]);
    A(t[775], a[855]); -- Explore Moonglade
    A(t[775], a[9924]); -- Field Photographer
    t[705] = c:New(k.GetMapName(10)); -- Northern Barrens
    C(t[688], t[705]);
    A(t[705], a[11200]); -- Stand Against the Legion
    A(t[705], a[11201]); -- Defender of Azeroth: Legion Invasions
    A(t[705], a[16431]); -- Against the Elements
    t[706] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[705], t[706]);
    A(t[706], a[4933]); -- Northern Barrens Quests
    t[760] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[705], t[760]);
    A(t[760], a[750]); -- Explore Northern Barrens
    t[1015] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[705], t[1015]);
    A(t[1015], a[762]); -- Ambassador of the Horde
    A(t[1015], a[2336]); -- Insane in the Membrane
    t[695] = c:New(k.GetMapName(62)); -- Darkshore
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
    t[691] = c:New(k.GetMapName(76)); -- Azshara
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
    t[689] = c:New(k.GetMapName(63)); -- Ashenvale
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
    t[709] = c:New(k.GetMapName(65)); -- Stonetalon Mountains
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
    t[697] = c:New(k.GetMapName(66)); -- Desolace
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
    t[711] = c:New(k.GetMapName(199)); -- Southern Barrens
    C(t[688], t[711]);
    t[712] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[711], t[712]);
    A(t[712], a[4937]); -- Southern Barrens Quests
    A(t[712], a[4981]); -- Southern Barrens Quests
    t[761] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[711], t[761]);
    A(t[761], a[4996]); -- Explore Southern Barrens
    t[1019] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[711], t[1019]);
    A(t[1019], a[948]); -- Ambassador of the Alliance
    A(t[1019], a[762]); -- Ambassador of the Horde
    t[703] = c:New(k.GetMapName(69)); -- Feralas
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
    t[699] = c:New(k.GetMapName(70)); -- Dustwallow Marsh
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
    t[715] = c:New(k.GetMapName(64)); -- Thousand Needles
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
    t[713] = c:New(k.GetMapName(71)); -- Tanaris
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
    t[701] = c:New(k.GetMapName(77)); -- Felwood
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
    t[717] = c:New(k.GetMapName(78)); -- Un'Goro Crater
    C(t[688], t[717]);
    A(t[717], a[3357]); -- Venomhide Ravasaur
    A(t[717], a[11296]); -- The Ancient Keeper
    A(t[717], a[16431]); -- Against the Elements
    t[718] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[717], t[718]);
    A(t[718], a[4939]); -- Un'Goro Crater Quests
    t[773] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[717], t[773]);
    A(t[773], a[854]); -- Explore Un'Goro Crater
    A(t[773], a[9924]); -- Field Photographer
    t[707] = c:New(k.GetMapName(81)); -- Silithus
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
    t[719] = c:New(k.GetMapName(83)); -- Winterspring
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
    t[5] = c:New(k.GetInstanceInfoName(226)); -- Ragefire Chasm
    C(t[2], t[5]);
    A(t[5], a[629]); -- Ragefire Chasm
    t[8] = c:New(k.GetInstanceInfoName(240)); -- Wailing Caverns
    C(t[2], t[8]);
    A(t[8], a[630]); -- Wailing Caverns
    A(t[8], a[11765]); -- Pet Battle Challenge: Wailing Caverns
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
    t[797] = c:New(k.GetInstanceInfoName(559) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Upper Blackrock Spire
    C(t[2], t[797]);
    A(t[797], a[1307]); -- Upper Blackrock Spire (Classic)
    A(t[797], a[2188]); -- Leeeeeeeeeeeeeroy!
    t[23] = c:New(k.GetInstanceInfoName(230)); -- Dire Maul
    C(t[2], t[23]);
    A(t[23], a[644]); -- King of Dire Maul
    A(t[23], a[5788]); -- Agent of the Shen'dralar
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
    t[28] = c:New(k.GetInstanceInfoName(76) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Zul'Gurub
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
    t[780] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[30], t[780]);
    A(t[780], a[956]); -- Brood of Nozdormu
    t[796] = c:New(k.GetInstanceInfoName(754) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Naxxramas
    C(t[3], t[796]);
    A(t[796], a[11744]); -- "Drop Dead, Gorgeous"
    A(t[796], a[425]); -- "Atiesh, Greatstaff of the Guardian"
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
    A(t[616], a[1311]); -- Medium Rare
    A(t[616], a[1312]); -- Bloody Rare
    A(t[616], a[44]); -- Outland Explorer
    A(t[616], a[763]); -- The Burning Crusader
    A(t[616], a[764]); -- The Burning Crusader
    A(t[616], a[894]); -- Flying High Over Skettis
    A(t[616], a[897]); -- You're So Offensive
    A(t[616], a[902]); -- Chief Exalted Officer
    A(t[616], a[7520]); -- The Loremaster
    t[794] = c:New(k.GetMapName(111)); -- Shattrath City
    C(t[616], t[794]);
    A(t[794], a[1165]); -- "My Storage is ""Gigantique"""
    A(t[794], a[9924]); -- Field Photographer
    t[924] = c:New(k.GetMapName(110)); -- Silvermoon City
    C(t[616], t[924]);
    A(t[924], a[613]); -- Killed in Quel'Thalas
    A(t[924], a[614]); -- For the Alliance!
    A(t[924], a[604]); -- Wrath of the Alliance
    t[969] = c:New(k.GetMapName(103)); -- The Exodar
    C(t[616], t[969]);
    A(t[969], a[618]); -- Putting Out the Light
    A(t[969], a[619]); -- For the Horde!
    A(t[969], a[603]); -- Wrath of the Horde
    t[758] = c:New(k.GetMapName(97)); -- Azuremyst Isle
    C(t[616], t[758]);
    t[759] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[758], t[759]);
    A(t[759], a[860]); -- Explore Azuremyst Isle
    t[998] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[758], t[998]);
    A(t[998], a[948]); -- Ambassador of the Alliance
    t[693] = c:New(k.GetMapName(106)); -- Bloodmyst Isle
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
    t[727] = c:New(k.GetMapName(94)); -- Eversong Woods
    C(t[616], t[727]);
    t[728] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[727], t[728]);
    A(t[728], a[859]); -- Explore Eversong Woods
    t[1008] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[727], t[1008]);
    A(t[1008], a[762]); -- Ambassador of the Horde
    t[669] = c:New(k.GetMapName(95)); -- Ghostlands
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
    t[617] = c:New(k.GetMapName(100)); -- Hellfire Peninsula
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
    t[618] = c:New(k.GetMapName(102)); -- Zangarmarsh
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
    t[619] = c:New(k.GetMapName(108)); -- Terokkar Forest
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
    t[620] = c:New(k.GetMapName(107)); -- Nagrand
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
    t[621] = c:New(k.GetMapName(105)); -- Blade's Edge Mountains
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
    t[622] = c:New(k.GetMapName(109)); -- Netherstorm
    C(t[616], t[622]);
    t[629] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[622], t[629]);
    A(t[629], a[1194]); -- Into the Nether
    t[636] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[622], t[636]);
    A(t[636], a[843]); -- Explore Netherstorm
    A(t[636], a[9924]); -- Field Photographer
    t[623] = c:New(k.GetMapName(104)); -- Shadowmoon Valley
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
    t[750] = c:New(k.GetMapName(122)); -- Isle of Quel'Danas
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
    t[81] = c:New(k.GetInstanceInfoName(77) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Zul'Aman
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
    A(t[577], a[7520]); -- The Loremaster
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
    A(t[84], a[3844]); -- 1000 Dungeon & Raid Emblems
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
    A(t[85], a[3844]); -- 1000 Dungeon & Raid Emblems
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
    t[115] = c:New((GetDifficultyInfo(3)) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Ulduar 10
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
    t[116] = c:New((GetDifficultyInfo(4)) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Ulduar 25
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
    t[129] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[883], t[129]);
    A(t[129], a[4887]); -- Tripping the Rifts
    t[550] = c:New(k.L["Zones"]); -- Zones
    C(t[129], t[550]);
    A(t[550], a[4875]); -- Loremaster of Cataclysm
    A(t[550], a[4827]); -- Surveying the Damage
    A(t[550], a[5548]); -- To All the Squirrels Who Cared for Me
    A(t[550], a[5754]); -- Drown Your Sorrows
    A(t[550], a[5753]); -- Cataclysmically Delicious
    A(t[550], a[4868]); -- Cataclysm Explorer
    A(t[550], a[4881]); -- The Earthen Ring
    A(t[550], a[7520]); -- The Loremaster
    t[551] = c:New(k.GetMapName(203)); -- Vashj'ir
    C(t[550], t[551]);
    t[557] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[551], t[557]);
    A(t[557], a[4869]); -- Sinking into Vashj'ir
    A(t[557], a[4982]); -- Sinking into Vashj'ir
    A(t[557], a[5452]); -- Visions of Vashj'ir Past
    A(t[557], a[5318]); -- "20,000 Leagues Under the Sea"
    A(t[557], a[5319]); -- "20,000 Leagues Under the Sea"
    t[564] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[551], t[564]);
    A(t[564], a[4825]); -- Explore Vashj'ir
    A(t[564], a[4975]); -- From Hell's Heart I Stab at Thee
    A(t[564], a[9924]); -- Field Photographer
    t[552] = c:New(k.GetMapName(198)); -- Mount Hyjal
    C(t[550], t[552]);
    t[558] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[552], t[558]);
    A(t[558], a[4870]); -- Coming Down the Mountain
    A(t[558], a[4959]); -- Beware of the 'Unbeatable?' Pterodactyl
    A(t[558], a[5860]); -- The 'Unbeatable?' Pterodactyl: BEATEN.
    A(t[558], a[5483]); -- Bounce
    A(t[558], a[5859]); -- Legacy of Leyara
    A(t[558], a[5866]); -- The Molten Front Offensive
    A(t[558], a[5861]); -- The Fiery Lords of Sethria's Roost
    A(t[558], a[5870]); -- Fireside Chat
    A(t[558], a[5862]); -- Ludicrous Speed
    A(t[558], a[5868]); -- And the Meek Shall Inherit Kalimdor
    A(t[558], a[5864]); -- Gang War
    A(t[558], a[5865]); -- Have... Have We Met?
    A(t[558], a[5869]); -- Infernal Ambassadors
    A(t[558], a[5879]); -- Veteran of the Molten Front
    t[565] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[552], t[565]);
    A(t[565], a[4863]); -- Explore Hyjal
    A(t[565], a[9924]); -- Field Photographer
    t[571] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[552], t[571]);
    A(t[571], a[4882]); -- The Guardians of Hyjal
    t[553] = c:New(k.GetMapName(207)); -- Deepholm
    C(t[550], t[553]);
    t[559] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[553], t[559]);
    A(t[559], a[4871]); -- Deep into Deepholm
    A(t[559], a[5445]); -- Fungalophobia
    A(t[559], a[5446]); -- The Glop Family Line
    A(t[559], a[5449]); -- Rock Lover
    A(t[559], a[5450]); -- Fungal Frenzy
    A(t[559], a[5447]); -- My Very Own Broodmother
    t[566] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[553], t[566]);
    A(t[566], a[4864]); -- Explore Deepholm
    A(t[566], a[9924]); -- Field Photographer
    t[572] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[553], t[572]);
    A(t[572], a[4883]); -- Therazane
    t[554] = c:New(k.GetMapName(249)); -- Uldum
    C(t[550], t[554]);
    A(t[554], a[5767]); -- Scourer of the Eternal Sands
    A(t[554], a[4888]); -- One Hump or Two?
    t[560] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[554], t[560]);
    A(t[560], a[4872]); -- Unearthing Uldum
    A(t[560], a[4961]); -- In a Thousand Years Even You Might be Worth Something
    A(t[560], a[5317]); -- Help the Bombardier! I'm the Bombardier!
    t[567] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[554], t[567]);
    A(t[567], a[4865]); -- Explore Uldum
    t[574] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[554], t[574]);
    A(t[574], a[4884]); -- Ramkahen
    t[555] = c:New(k.GetMapName(241)); -- Twilight Highlands
    C(t[550], t[555]);
    t[561] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[555], t[561]);
    A(t[561], a[4873]); -- Fading into Twilight
    A(t[561], a[5501]); -- Fading into Twilight
    A(t[561], a[4960]); -- Round Three. Fight!
    A(t[561], a[5481]); -- Wildhammer Tour of Duty
    A(t[561], a[5482]); -- Dragonmaw Tour of Duty
    A(t[561], a[5320]); -- King of the Mountain
    A(t[561], a[5321]); -- King of the Mountain
    A(t[561], a[5451]); -- Consumed by Nightmare
    A(t[561], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    t[568] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[555], t[568]);
    A(t[568], a[4866]); -- Explore Twilight Highlands
    t[573] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[555], t[573]);
    A(t[573], a[948]); -- Ambassador of the Alliance
    A(t[573], a[762]); -- Ambassador of the Horde
    A(t[573], a[4885]); -- Wildhammer Clan
    A(t[573], a[4886]); -- Dragonmaw Clan
    t[556] = c:New(k.GetMapName(338)); -- Molten Front
    C(t[550], t[556]);
    A(t[556], a[5859]); -- Legacy of Leyara
    A(t[556], a[5866]); -- The Molten Front Offensive
    A(t[556], a[5867]); -- Flawless Victory
    A(t[556], a[5871]); -- Master of the Molten Flow
    A(t[556], a[5872]); -- King of the Spider-Hill
    A(t[556], a[5874]); -- Death From Above
    A(t[556], a[5873]); -- Ready for Raiding II
    A(t[556], a[5879]); -- Veteran of the Molten Front
    t[130] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[129], t[130]);
    A(t[130], a[4844]); -- Cataclysm Dungeon Hero
    A(t[130], a[5506]); -- Defender of a Shattered World
    A(t[130], a[4845]); -- Glory of the Cataclysm Hero
    t[132] = c:New(k.GetInstanceInfoName(66)); -- Blackrock Caverns
    C(t[130], t[132]);
    A(t[132], a[5281]); -- Crushing Bones and Cracking Skulls
    A(t[132], a[5282]); -- Arrested Development
    A(t[132], a[5283]); -- Too Hot to Handle
    A(t[132], a[5284]); -- Ascendant Descending
    A(t[132], a[4833]); -- Blackrock Caverns
    A(t[132], a[5060]); -- Heroic: Blackrock Caverns
    t[133] = c:New(k.GetInstanceInfoName(65)); -- Throne of the Tides
    C(t[130], t[133]);
    A(t[133], a[5285]); -- Old Faithful
    A(t[133], a[5286]); -- Prince of Tides
    A(t[133], a[4839]); -- Throne of the Tides
    A(t[133], a[5061]); -- Heroic: Throne of the Tides
    t[134] = c:New(k.GetInstanceInfoName(67)); -- The Stonecore
    C(t[130], t[134]);
    A(t[134], a[5287]); -- Rotten to the Core
    A(t[134], a[4846]); -- The Stonecore
    A(t[134], a[5063]); -- Heroic: The Stonecore
    t[135] = c:New(k.GetInstanceInfoName(68)); -- The Vortex Pinnacle
    C(t[130], t[135]);
    A(t[135], a[5289]); -- Extra Credit Bonus Stage
    A(t[135], a[5288]); -- No Static at All
    A(t[135], a[4847]); -- The Vortex Pinnacle
    A(t[135], a[5064]); -- Heroic: The Vortex Pinnacle
    t[136] = c:New(k.GetInstanceInfoName(71)); -- Grim Batol
    C(t[130], t[136]);
    A(t[136], a[5297]); -- Umbrage for Umbriss
    A(t[136], a[5298]); -- Don't Need to Break Eggs to Make an Omelet
    A(t[136], a[4840]); -- Grim Batol
    A(t[136], a[5062]); -- Heroic: Grim Batol
    t[137] = c:New(k.GetInstanceInfoName(70)); -- Halls of Origination
    C(t[130], t[137]);
    A(t[137], a[5293]); -- I Hate That Song
    A(t[137], a[5294]); -- Straw That Broke the Camel's Back
    A(t[137], a[5296]); -- Faster Than the Speed of Light
    A(t[137], a[5295]); -- Sun of a....
    A(t[137], a[4841]); -- Halls of Origination
    A(t[137], a[5065]); -- Heroic: Halls of Origination
    A(t[137], a[9924]); -- Field Photographer
    t[138] = c:New(k.GetInstanceInfoName(69)); -- Lost City of the Tol'vir
    C(t[130], t[138]);
    A(t[138], a[5291]); -- Acrocalypse Now
    A(t[138], a[5290]); -- Kill It With Fire!
    A(t[138], a[5292]); -- Headed South
    A(t[138], a[4848]); -- Lost City of the Tol'vir
    A(t[138], a[5066]); -- Heroic: Lost City of the Tol'vir
    t[139] = c:New(k.GetInstanceInfoName(63)); -- Deadmines
    C(t[130], t[139]);
    A(t[139], a[5366]); -- Ready for Raiding
    A(t[139], a[5367]); -- Rat Pack
    A(t[139], a[5368]); -- Prototype Prodigy
    A(t[139], a[5369]); -- It's Frost Damage
    A(t[139], a[5370]); -- I'm on a Diet
    A(t[139], a[5371]); -- Vigorous VanCleef Vindicator
    A(t[139], a[628]); -- Deadmines
    A(t[139], a[5083]); -- Heroic: Deadmines
    A(t[139], a[11856]); -- Pet Battle Challenge: Deadmines
    A(t[139], a[9924]); -- Field Photographer
    t[140] = c:New(k.GetInstanceInfoName(64)); -- Shadowfang Keep
    C(t[130], t[140]);
    A(t[140], a[5503]); -- Pardon Denied
    A(t[140], a[5504]); -- To the Ground!
    A(t[140], a[5505]); -- Bullet Time
    A(t[140], a[631]); -- Shadowfang Keep
    A(t[140], a[5093]); -- Heroic: Shadowfang Keep
    A(t[140], a[4627]); -- X-45 Heartbreaker
    t[141] = c:New(k.GetInstanceInfoName(76)); -- Zul'Gurub
    C(t[130], t[141]);
    A(t[141], a[5743]); -- It's Not Easy Being Green
    A(t[141], a[5762]); -- Ohganot So Fast!
    A(t[141], a[5765]); -- "Here, Kitty Kitty..."
    A(t[141], a[5759]); -- Spirit Twister
    A(t[141], a[5744]); -- Gurubashi Headhunter
    A(t[141], a[5768]); -- Heroic: Zul'Gurub
    t[142] = c:New(k.GetInstanceInfoName(77)); -- Zul'Aman
    C(t[130], t[142]);
    A(t[142], a[5858]); -- Bear-ly Made It
    A(t[142], a[5750]); -- Tunnel Vision
    A(t[142], a[5761]); -- Hex Mix
    A(t[142], a[5760]); -- Ring Out!
    A(t[142], a[5769]); -- Heroic: Zul'Aman
    t[143] = c:New(k.GetInstanceInfoName(184)); -- End Time
    C(t[130], t[143]);
    A(t[143], a[5995]); -- Moon Guard
    A(t[143], a[6130]); -- Severed Ties
    A(t[143], a[6117]); -- Heroic: End Time
    t[144] = c:New(k.GetInstanceInfoName(185)); -- Well of Eternity
    C(t[130], t[144]);
    A(t[144], a[6127]); -- Lazy Eye
    A(t[144], a[6070]); -- That's Not Canon!
    A(t[144], a[6118]); -- Heroic: Well of Eternity
    t[145] = c:New(k.GetInstanceInfoName(186)); -- Hour of Twilight
    C(t[130], t[145]);
    A(t[145], a[6132]); -- Eclipse
    A(t[145], a[6119]); -- Heroic: Hour of Twilight
    t[131] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[129], t[131]);
    A(t[131], a[5506]); -- Defender of a Shattered World
    A(t[131], a[4853]); -- Glory of the Cataclysm Raider
    A(t[131], a[5828]); -- Glory of the Firelands Raider
    A(t[131], a[6169]); -- Glory of the Dragon Soul Raider
    t[146] = c:New(k.GetInstanceInfoName(75)); -- Baradin Hold
    C(t[131], t[146]);
    A(t[146], a[5416]); -- Pit Lord Argaloth
    A(t[146], a[6045]); -- Occu'thar
    A(t[146], a[6108]); -- Alizabal
    t[147] = c:New(k.GetInstanceInfoName(73)); -- Blackwing Descent
    C(t[131], t[147]);
    A(t[147], a[4842]); -- Blackwing Descent
    A(t[147], a[11754]); -- Glamour of Twilight
    A(t[147], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    t[902] = c:New(k.L["Glory"]); -- Glory
    C(t[147], t[902]);
    A(t[902], a[5306]); -- Parasite Evening
    A(t[902], a[5307]); -- Achieve-a-tron
    A(t[902], a[5309]); -- Full of Sound and Fury
    A(t[902], a[5308]); -- Silence is Golden
    A(t[902], a[5310]); -- Aberrant Behavior
    A(t[902], a[4849]); -- Keeping it in the Family
    t[903] = c:New(k.L["Heroic"]); -- Heroic
    C(t[147], t[903]);
    A(t[903], a[5094]); -- Heroic: Magmaw
    A(t[903], a[5107]); -- Heroic: Omnotron Defense System
    A(t[903], a[5115]); -- Heroic: Chimaeron
    A(t[903], a[5109]); -- Heroic: Atramedes
    A(t[903], a[5108]); -- Heroic: Maloriak
    A(t[903], a[5116]); -- Heroic: Nefarian
    t[148] = c:New(k.GetInstanceInfoName(72)); -- The Bastion of Twilight
    C(t[131], t[148]);
    A(t[148], a[4850]); -- The Bastion of Twilight
    A(t[148], a[5313]); -- I Can't Hear You Over the Sound of How Awesome I Am
    A(t[148], a[11754]); -- Glamour of Twilight
    A(t[148], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    t[904] = c:New(k.L["Glory"]); -- Glory
    C(t[148], t[904]);
    A(t[904], a[5300]); -- The Only Escape
    A(t[904], a[4852]); -- Double Dragon
    A(t[904], a[5311]); -- Elementary
    A(t[904], a[5312]); -- The Abyss Will Gaze Back Into You
    t[905] = c:New(k.L["Heroic"]); -- Heroic
    C(t[148], t[905]);
    A(t[905], a[5118]); -- Heroic: Halfus Wyrmbreaker
    A(t[905], a[5117]); -- Heroic: Valiona and Theralion
    A(t[905], a[5119]); -- Heroic: Ascendant Council
    A(t[905], a[5120]); -- Heroic: Cho'gall
    A(t[905], a[5121]); -- Heroic: Sinestra
    t[149] = c:New(k.GetInstanceInfoName(74)); -- Throne of the Four Winds
    C(t[131], t[149]);
    A(t[149], a[5304]); -- Stay Chill
    A(t[149], a[5305]); -- Four Play
    A(t[149], a[5122]); -- Heroic: Conclave of Wind
    A(t[149], a[5123]); -- Heroic: Al'Akir
    A(t[149], a[4851]); -- Throne of the Four Winds
    A(t[149], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    t[150] = c:New(k.GetInstanceInfoName(78)); -- Firelands
    C(t[131], t[150]);
    A(t[150], a[5855]); -- Ragnar-O's
    A(t[150], a[5802]); -- Firelands
    A(t[150], a[11755]); -- Hot Couture
    A(t[150], a[5839]); -- "Dragonwrath, Tarecgosa's Rest"
    A(t[150], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    t[906] = c:New(k.L["Glory"]); -- Glory
    C(t[150], t[906]);
    A(t[906], a[5821]); -- Death from Above
    A(t[906], a[5813]); -- Do a Barrel Roll!
    A(t[906], a[5810]); -- Not an Ambi-Turner
    A(t[906], a[5829]); -- Bucket List
    A(t[906], a[5830]); -- Share the Pain
    A(t[906], a[5799]); -- Only the Penitent...
    t[907] = c:New(k.L["Heroic"]); -- Heroic
    C(t[150], t[907]);
    A(t[907], a[5807]); -- Heroic: Beth'tilac
    A(t[907], a[5809]); -- Heroic: Alysrazor
    A(t[907], a[5808]); -- Heroic: Lord Rhyolith
    A(t[907], a[5806]); -- Heroic: Shannox
    A(t[907], a[5805]); -- Heroic: Baleroc
    A(t[907], a[5804]); -- Heroic: Majordomo Fandral Staghelm
    A(t[907], a[5803]); -- Heroic: Ragnaros
    t[576] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[150], t[576]);
    A(t[576], a[5827]); -- Avengers of Hyjal
    t[151] = c:New(k.GetInstanceInfoName(187)); -- Dragon Soul
    C(t[131], t[151]);
    A(t[151], a[6175]); -- Holding Hands
    A(t[151], a[5518]); -- Stood in the Fire
    A(t[151], a[6106]); -- Siege of Wyrmrest Temple
    A(t[151], a[6107]); -- Fall of Deathwing
    A(t[151], a[6177]); -- Destroyer's End
    A(t[151], a[11756]); -- Wardrobe of the Old Gods
    A(t[151], a[6181]); -- Fangs of the Father
    A(t[151], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    t[908] = c:New(k.L["Glory"]); -- Glory
    C(t[151], t[908]);
    A(t[908], a[6174]); -- Don't Stand So Close to Me
    A(t[908], a[6128]); -- Ping Pong Champion
    A(t[908], a[6129]); -- Taste the Rainbow!
    A(t[908], a[6084]); -- Minutes to Midnight
    A(t[908], a[6105]); -- Deck Defender
    A(t[908], a[6133]); -- Maybe He'll Get Dizzy...
    A(t[908], a[6180]); -- Chromatic Champion
    t[909] = c:New(k.L["Heroic"]); -- Heroic
    C(t[151], t[909]);
    A(t[909], a[6109]); -- Heroic: Morchok
    A(t[909], a[6110]); -- Heroic: Warlord Zon'ozz
    A(t[909], a[6111]); -- Heroic: Yor'sahj the Unsleeping
    A(t[909], a[6112]); -- Heroic: Hagara the Stormbinder
    A(t[909], a[6113]); -- Heroic: Ultraxion
    A(t[909], a[6114]); -- Heroic: Warmaster Blackhorn
    A(t[909], a[6115]); -- Heroic: Spine of Deathwing
    A(t[909], a[6116]); -- Heroic: Madness of Deathwing
    t[788] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[129], t[788]);
    A(t[788], a[7525]); -- Taming Cataclysm
    A(t[788], a[6558]); -- Local Pet Mauler
    A(t[788], a[6559]); -- Traveling Pet Mauler
    A(t[788], a[6560]); -- World Pet Mauler
    A(t[788], a[6607]); -- Taming Azeroth
    A(t[788], a[6601]); -- Taming the Wild
    A(t[788], a[7498]); -- Taming the Great Outdoors
    A(t[788], a[7499]); -- Taming the World
    A(t[788], a[14021]); -- The Shadows Revealed
    A(t[788], a[8348]); -- The Longest Day
    t[547] = c:New(k.GetCategoryInfoTitle(15075)); -- Tol Barad
    C(t[129], t[547]);
    A(t[547], a[5489]); -- Master of Tol Barad
    A(t[547], a[5490]); -- Master of Tol Barad
    t[563] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[547], t[563]);
    A(t[563], a[4874]); -- Breaking Out of Tol Barad
    A(t[563], a[5718]); -- Just Another Day in Tol Barad
    A(t[563], a[5719]); -- Just Another Day in Tol Barad
    t[569] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[547], t[569]);
    A(t[569], a[5412]); -- Tol Barad Victory
    A(t[569], a[5418]); -- Tol Barad Veteran
    A(t[569], a[5417]); -- Tol Barad Veteran
    A(t[569], a[5415]); -- Tower Plower
    A(t[569], a[5488]); -- Towers of Power
    A(t[569], a[5487]); -- Tol Barad Saboteur
    A(t[569], a[5486]); -- Tol Barad All-Star
    t[575] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[547], t[575]);
    A(t[575], a[5375]); -- Baradin's Wardens
    A(t[575], a[5376]); -- Hellscream's Reach
    t[189] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[883], t[189]);
    A(t[189], a[6926]); -- Tranquil Master
    A(t[189], a[7533]); -- Chapter I: Trial of the Black Prince
    A(t[189], a[8030]); -- A Test of Valor
    A(t[189], a[8031]); -- A Test of Valor
    A(t[189], a[7534]); -- Chapter II: Wrathion's War
    A(t[189], a[8008]); -- Chapter II: Wrathion's War
    A(t[189], a[7535]); -- Chapter III: Two Princes
    A(t[189], a[7536]); -- Chapter IV: Celestial Blessings
    A(t[189], a[8325]); -- Chapter V: Judgment of the Black Prince
    A(t[189], a[8306]); -- Hordebreaker
    A(t[189], a[8307]); -- Darkspear Revolutionary
    t[491] = c:New(k.L["Zones"]); -- Zones
    C(t[189], t[491]);
    t[526] = c:New(k.GetMapName(424)); -- Pandaria
    C(t[491], t[526]);
    t[527] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[526], t[527]);
    A(t[527], a[6541]); -- Loremaster of Pandaria
    A(t[527], a[7285]); -- Every Day I'm Pand-a-ren
    A(t[527], a[7520]); -- The Loremaster
    t[528] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[526], t[528]);
    A(t[528], a[6716]); -- Between a Saurok and a Hard Place
    A(t[528], a[6754]); -- The Dark Heart of the Mogu
    A(t[528], a[6846]); -- Fish Tales
    A(t[528], a[6850]); -- Hozen in the Mist
    A(t[528], a[6847]); -- The Song of the Yaungol
    A(t[528], a[6855]); -- The Seven Burdens of Shaohao
    A(t[528], a[6856]); -- Ballad of Liu Lang
    A(t[528], a[6858]); -- What Is Worth Fighting For
    A(t[528], a[7230]); -- Legend of the Brewfathers
    A(t[528], a[7994]); -- Treasure of Pandaria
    A(t[528], a[7995]); -- Fortune of Pandaria
    A(t[528], a[7996]); -- Bounty of Pandaria
    A(t[528], a[7997]); -- Riches of Pandaria
    A(t[528], a[7281]); -- Lost and Found
    A(t[528], a[7282]); -- Finders Keepers
    A(t[528], a[7283]); -- One Man's Trash...
    A(t[528], a[7284]); -- Is Another Man's Treasure
    A(t[528], a[7437]); -- A Worthy Opponent
    A(t[528], a[7438]); -- Could We Find More Like That?
    A(t[528], a[7439]); -- Glorious!
    A(t[528], a[8078]); -- Zul'Again
    A(t[528], a[6350]); -- To All the Squirrels I Once Caressed?
    A(t[528], a[7329]); -- Pandaren Cuisine
    A(t[528], a[7330]); -- Pandaren Delicacies
    A(t[528], a[6974]); -- Pandaria Explorer
    t[529] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[526], t[529]);
    A(t[529], a[7479]); -- The Shado-Master
    A(t[529], a[6543]); -- The August Celestials
    A(t[529], a[6547]); -- The Anglers
    A(t[529], a[6548]); -- The Lorewalkers
    A(t[529], a[6827]); -- Pandaren Ambassador
    A(t[529], a[6828]); -- Pandaren Ambassador
    t[492] = c:New(k.GetMapName(371)); -- The Jade Forest
    C(t[491], t[492]);
    t[519] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[492], t[519]);
    A(t[519], a[6300]); -- Upjade Complete
    A(t[519], a[6534]); -- Upjade Complete
    A(t[519], a[7289]); -- Shadow Hopper
    A(t[519], a[7290]); -- How To Strain Your Dragon
    A(t[519], a[7291]); -- In a Trail of Smoke
    t[545] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[492], t[545]);
    A(t[545], a[6351]); -- Explore Jade Forest
    A(t[545], a[7381]); -- Restore Balance
    t[546] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[492], t[546]);
    A(t[546], a[6550]); -- Order of the Cloud Serpent
    t[493] = c:New(k.GetMapName(376)); -- Valley of the Four Winds
    C(t[491], t[493]);
    A(t[493], a[6517]); -- Extinction Event
    t[516] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[493], t[516]);
    A(t[516], a[6301]); -- Rally the Valley
    A(t[516], a[7292]); -- Green Acres
    A(t[516], a[7293]); -- Till the Break of Dawn
    A(t[516], a[7294]); -- A Taste of Things to Come
    A(t[516], a[7295]); -- Listen to the Drunk Fish
    A(t[516], a[7296]); -- Ain't Lost No More
    A(t[516], a[7502]); -- Savior of Stoneplow
    t[544] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[493], t[544]);
    A(t[544], a[6969]); -- Explore Valley of the Four Winds
    A(t[544], a[9924]); -- Field Photographer
    t[518] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[493], t[518]);
    A(t[518], a[6544]); -- The Tillers
    A(t[518], a[6551]); -- Friend on the Farm
    A(t[518], a[6552]); -- Friends on the Farm
    t[494] = c:New(k.GetMapName(418)); -- Krasarang Wilds
    C(t[491], t[494]);
    t[513] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[494], t[513]);
    A(t[513], a[6535]); -- Mighty Roamin' Krasaranger
    A(t[513], a[6536]); -- Mighty Roamin' Krasaranger
    A(t[513], a[7287]); -- Champion of Chi-Ji
    A(t[513], a[7928]); -- Operation: Shieldwall Campaign
    A(t[513], a[7929]); -- Dominance Offensive Campaign
    t[514] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[494], t[514]);
    A(t[514], a[6975]); -- Explore Krasarang Wilds
    A(t[514], a[7518]); -- "Wanderers, Dreamers, and You"
    A(t[514], a[7932]); -- "I'm In Your Base, Killing Your Dudes"
    A(t[514], a[9924]); -- Field Photographer
    t[543] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[494], t[543]);
    A(t[543], a[8205]); -- Operation: Shieldwall
    A(t[543], a[8206]); -- Dominance Offensive
    t[495] = c:New(k.GetMapName(379)); -- Kun-Lai Summit
    C(t[491], t[495]);
    A(t[495], a[6480]); -- "Settle Down, Bro"
    A(t[495], a[7386]); -- Grand Expedition Yak
    t[510] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[495], t[510]);
    A(t[510], a[6537]); -- Slum It in the Summit
    A(t[510], a[6538]); -- Slum It in the Summit
    A(t[510], a[7286]); -- Finish Them!
    t[542] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[495], t[542]);
    A(t[542], a[6976]); -- Explore Kun-Lai Summit
    A(t[542], a[9924]); -- Field Photographer
    t[496] = c:New(k.GetMapName(388)); -- Townlong Steppes
    C(t[491], t[496]);
    t[507] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[496], t[507]);
    A(t[507], a[6539]); -- "One Steppe Forward, Two Steppes Back"
    A(t[507], a[7288]); -- Yak Attack
    A(t[507], a[7297]); -- Proven Strength
    A(t[507], a[7298]); -- Getting Around with the Shado-Pan
    A(t[507], a[7299]); -- Loner and a Rebel
    A(t[507], a[7307]); -- Silent Assassin
    A(t[507], a[7308]); -- Know Your Role
    A(t[507], a[7309]); -- Fire in the Yaung-hole!
    A(t[507], a[7310]); -- Defender of Gods
    t[540] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[496], t[540]);
    A(t[540], a[6977]); -- Explore Townlong Steppes
    t[541] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[496], t[541]);
    A(t[541], a[6366]); -- Shado-Pan
    t[497] = c:New(k.GetMapName(422)); -- Dread Wastes
    C(t[491], t[497]);
    t[504] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[497], t[504]);
    A(t[504], a[6540]); -- Dread Haste Makes Dread Waste
    A(t[504], a[7312]); -- Amber is the Color of My Energy
    A(t[504], a[7313]); -- Stay Klaxxi
    A(t[504], a[7314]); -- Test Drive
    A(t[504], a[7316]); -- Over Their Heads
    t[538] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[497], t[538]);
    A(t[538], a[6978]); -- Explore Dread Wastes
    A(t[538], a[6857]); -- Heart of the Mantid Swarm
    t[539] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[497], t[539]);
    A(t[539], a[6545]); -- Klaxxi
    A(t[539], a[8023]); -- Wakener
    t[498] = c:New(k.GetMapName(390)); -- Vale of Eternal Blossoms
    C(t[491], t[498]);
    t[501] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[498], t[501]);
    A(t[501], a[7317]); -- One Many Army
    A(t[501], a[7318]); -- A Taste of History
    A(t[501], a[7319]); -- Ready for Raiding III
    A(t[501], a[7320]); -- Dog Pile
    A(t[501], a[7321]); -- Spreading the Warmth
    A(t[501], a[7322]); -- Roll Club
    A(t[501], a[7323]); -- Collateral Damage
    A(t[501], a[7324]); -- One Step at a Time
    A(t[501], a[7315]); -- Eternally in the Vale
    t[536] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[498], t[536]);
    A(t[536], a[6979]); -- Explore Vale of Eternal Blossoms
    A(t[536], a[9924]); -- Field Photographer
    t[537] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[498], t[537]);
    A(t[537], a[6546]); -- The Golden Lotus
    t[534] = c:New(k.GetMapName(507)); -- Isle of Giants
    C(t[491], t[534]);
    A(t[534], a[8123]); -- Millions of Years of Evolution vs. My Fist
    A(t[534], a[8092]); -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    t[522] = c:New(k.GetMapName(504)); -- Isle of Thunder
    C(t[491], t[522]);
    A(t[522], a[8028]); -- Praise the Sun!
    t[523] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[522], t[523]);
    A(t[523], a[8099]); -- Isle of Thunder
    A(t[523], a[8100]); -- Pay to Slay
    A(t[523], a[8101]); -- It Was Worth Every Ritual Stone
    A(t[523], a[8104]); -- Thunder Plunder
    A(t[523], a[8105]); -- The Crumble Bundle
    A(t[523], a[8107]); -- Ready for RAAAAIIIIDDD?!?ing
    A(t[523], a[8108]); -- "When in Ihgaluk, Do as the Skumblade Do"
    A(t[523], a[8109]); -- The Mogu Below-gu
    A(t[523], a[8110]); -- These Mogu Have Gotta Go-gu
    A(t[523], a[8111]); -- This Isn't Even My Final Form
    A(t[523], a[8112]); -- Blue Response
    A(t[523], a[8114]); -- Platform Hero
    A(t[523], a[8115]); -- Speed Metal
    A(t[523], a[8116]); -- You Made Me Bleed My Own Blood
    A(t[523], a[8117]); -- For the Ward!
    A(t[523], a[8118]); -- Boop
    A(t[523], a[8119]); -- Our Powers Combined
    A(t[523], a[8120]); -- Direhorn in a China Shop
    A(t[523], a[8212]); -- Zandalari Library Card
    A(t[523], a[8121]); -- Stormbreaker
    A(t[523], a[8106]); -- In the Hall of the Thunder King
    t[524] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[522], t[524]);
    A(t[524], a[8103]); -- Champions of Lei Shen
    A(t[524], a[8049]); -- The Zandalari Prophecy
    A(t[524], a[8050]); -- Rumbles of Thunder
    A(t[524], a[8051]); -- Gods and Monsters
    t[525] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[522], t[525]);
    A(t[525], a[8208]); -- Kirin Tor Offensive
    A(t[525], a[8209]); -- Sunreaver Onslaught
    A(t[525], a[8210]); -- Shado-Pan Assault
    t[530] = c:New(k.GetMapName(554)); -- Timeless Isle
    C(t[491], t[530]);
    A(t[530], a[8535]); -- Celestial Challenge
    A(t[530], a[8533]); -- Ordos
    t[531] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[530], t[531]);
    A(t[531], a[8712]); -- Killing Time
    A(t[531], a[8714]); -- Timeless Champion
    A(t[531], a[8722]); -- Timeless Nutriment
    A(t[531], a[8724]); -- Pilgrimage
    A(t[531], a[8723]); -- Legend of the Past
    A(t[531], a[8784]); -- Timeless Legends
    A(t[531], a[8725]); -- Eyes On The Ground
    A(t[531], a[8726]); -- Extreme Treasure Hunter
    A(t[531], a[8727]); -- "Where There's Pirates, There's Booty"
    A(t[531], a[8729]); -- "Treasure, Treasure Everywhere"
    A(t[531], a[8730]); -- Rolo's Riddle
    A(t[531], a[8743]); -- Zarhym Altogether
    A(t[531], a[8716]); -- Emissary of Ordos
    A(t[531], a[8717]); -- Candlekeeper
    A(t[531], a[8718]); -- Oathguard
    A(t[531], a[8719]); -- Blazebinder
    A(t[531], a[8720]); -- Kilnmaster
    A(t[531], a[8721]); -- Fire-Watcher
    A(t[531], a[8728]); -- Going To Need A Bigger Bag
    t[535] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[530], t[535]);
    A(t[535], a[8715]); -- Emperor Shaohao
    t[190] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[189], t[190]);
    A(t[190], a[6925]); -- Pandaria Dungeon Hero
    A(t[190], a[6927]); -- Glory of the Pandaria Hero
    A(t[190], a[8903]); -- Mistwalker
    A(t[190], a[6920]); -- Challenge Conqueror
    A(t[190], a[6374]); -- Challenge Conqueror: Bronze
    A(t[190], a[6375]); -- Challenge Conqueror: Silver
    A(t[190], a[6378]); -- Challenge Conqueror: Gold
    t[193] = c:New(k.GetInstanceInfoName(313)); -- Temple of the Jade Serpent
    C(t[190], t[193]);
    A(t[193], a[6475]); -- Cleaning Up
    A(t[193], a[6460]); -- Hydrophobia
    A(t[193], a[6671]); -- Seeds of Doubt
    A(t[193], a[6757]); -- Temple of the Jade Serpent
    A(t[193], a[6758]); -- Heroic: Temple of the Jade Serpent
    A(t[193], a[6884]); -- Temple of the Jade Serpent Challenger
    A(t[193], a[6885]); -- Temple of the Jade Serpent: Bronze
    A(t[193], a[6886]); -- Temple of the Jade Serpent: Silver
    A(t[193], a[6887]); -- Temple of the Jade Serpent: Gold
    A(t[193], a[8430]); -- Challenge Master: Temple of the Jade Serpent
    A(t[193], a[16661]); -- Keystone Hero: Temple of the Jade Serpent
    t[194] = c:New(k.GetInstanceInfoName(302)); -- Stormstout Brewery
    C(t[190], t[194]);
    A(t[194], a[6402]); -- Ling-Ting's Herbal Journey
    A(t[194], a[6089]); -- Keep Rollin' Rollin' Rollin'
    A(t[194], a[6400]); -- How Did He Get Up There?
    A(t[194], a[6420]); -- Hopocalypse Now!
    A(t[194], a[6457]); -- Stormstout Brewery
    A(t[194], a[6456]); -- Heroic: Stormstout Brewery
    A(t[194], a[6888]); -- Stormstout Brewery Challenger
    A(t[194], a[6889]); -- Stormstout Brewery: Bronze
    A(t[194], a[6890]); -- Stormstout Brewery: Silver
    A(t[194], a[6891]); -- Stormstout Brewery: Gold
    A(t[194], a[8431]); -- Challenge Master: Stormstout Brewery
    t[195] = c:New(k.GetInstanceInfoName(321)); -- Mogu'shan Palace
    C(t[190], t[195]);
    A(t[195], a[6713]); -- Quarrelsome Quilen Quintet
    A(t[195], a[6478]); -- Glintrok N' Roll
    A(t[195], a[6736]); -- What Does This Button Do?
    A(t[195], a[6755]); -- Mogu'shan Palace
    A(t[195], a[6756]); -- Heroic: Mogu'shan Palace
    A(t[195], a[6892]); -- Mogu'shan Palace Challenger
    A(t[195], a[6899]); -- Mogu'shan Palace: Bronze
    A(t[195], a[6900]); -- Mogu'shan Palace: Silver
    A(t[195], a[6901]); -- Mogu'shan Palace: Gold
    A(t[195], a[8433]); -- Challenge Master: Mogu'shan Palace
    t[196] = c:New(k.GetInstanceInfoName(312)); -- Shado-Pan Monastery
    C(t[190], t[196]);
    A(t[196], a[6477]); -- Respect
    A(t[196], a[6472]); -- The Obvious Solution
    A(t[196], a[6471]); -- Hate Leads to Suffering
    A(t[196], a[6469]); -- Shado-Pan Monastery
    A(t[196], a[6470]); -- Heroic: Shado-Pan Monastery
    A(t[196], a[6893]); -- Shado-Pan Monastery Challenger
    A(t[196], a[6902]); -- Shado-Pan Monastery: Bronze
    A(t[196], a[6903]); -- Shado-Pan Monastery: Silver
    A(t[196], a[6904]); -- Shado-Pan Monastery: Gold
    A(t[196], a[8432]); -- Challenge Master: Shado-Pan Monastery
    t[197] = c:New(k.GetInstanceInfoName(303)); -- Gate of the Setting Sun
    C(t[190], t[197]);
    A(t[197], a[6479]); -- Bomberman
    A(t[197], a[6476]); -- Conscriptinator
    A(t[197], a[6945]); -- Mantid Swarm
    A(t[197], a[10010]); -- Gate of the Setting Sun
    A(t[197], a[6759]); -- Heroic: Gate of the Setting Sun
    A(t[197], a[6894]); -- Gate of the Setting Sun Challenger
    A(t[197], a[6905]); -- Gate of the Setting Sun: Bronze
    A(t[197], a[6906]); -- Gate of the Setting Sun: Silver
    A(t[197], a[6907]); -- Gate of the Setting Sun: Gold
    A(t[197], a[8434]); -- Challenge Master: Gate of the Setting Sun
    t[198] = c:New(k.GetInstanceInfoName(324)); -- Siege of Niuzao Temple
    C(t[190], t[198]);
    A(t[198], a[6688]); -- Where's My Air Support?
    A(t[198], a[6485]); -- Return to Sender
    A(t[198], a[6822]); -- Run with the Wind
    A(t[198], a[10011]); -- Siege of Niuzao Temple
    A(t[198], a[6763]); -- Heroic: Siege of Niuzao Temple
    A(t[198], a[6898]); -- Siege of Niuzao Temple Challenger
    A(t[198], a[6917]); -- Siege of Niuzao Temple: Bronze
    A(t[198], a[6918]); -- Siege of Niuzao Temple: Silver
    A(t[198], a[6919]); -- Siege of Niuzao Temple: Gold
    A(t[198], a[8439]); -- Challenge Master: Siege of Niuzao Temple
    t[199] = c:New(k.GetInstanceInfoName(311)); -- Scarlet Halls
    C(t[190], t[199]);
    A(t[199], a[6684]); -- Humane Society
    A(t[199], a[6427]); -- Mosh Pit
    A(t[199], a[7413]); -- Scarlet Halls
    A(t[199], a[6760]); -- Heroic: Scarlet Halls
    A(t[199], a[6895]); -- Scarlet Halls Challenger
    A(t[199], a[6908]); -- Scarlet Halls: Bronze
    A(t[199], a[6909]); -- Scarlet Halls: Silver
    A(t[199], a[6910]); -- Scarlet Halls: Gold
    A(t[199], a[8436]); -- Challenge Master: Scarlet Halls
    t[200] = c:New(k.GetInstanceInfoName(316)); -- Scarlet Monastery
    C(t[190], t[200]);
    A(t[200], a[6946]); -- Empowered Spiritualist
    A(t[200], a[6928]); -- Burning Man
    A(t[200], a[6929]); -- And Stay Dead!
    A(t[200], a[637]); -- Scarlet Monastery
    A(t[200], a[6761]); -- Heroic: Scarlet Monastery
    A(t[200], a[6896]); -- Scarlet Monastery Challenger
    A(t[200], a[6911]); -- Scarlet Monastery: Bronze
    A(t[200], a[6912]); -- Scarlet Monastery: Silver
    A(t[200], a[6913]); -- Scarlet Monastery: Gold
    A(t[200], a[8437]); -- Challenge Master: Scarlet Monastery
    A(t[200], a[980]); -- The Horseman's Reins
    t[201] = c:New(k.GetInstanceInfoName(246)); -- Scholomance
    C(t[190], t[201]);
    A(t[201], a[6531]); -- Attention to Detail
    A(t[201], a[6394]); -- Rattle No More
    A(t[201], a[6396]); -- Sanguinarian
    A(t[201], a[6715]); -- Polyformic Acid Science
    A(t[201], a[6821]); -- School's Out Forever
    A(t[201], a[645]); -- Scholomance
    A(t[201], a[6762]); -- Heroic: Scholomance
    A(t[201], a[6897]); -- Scholomance Challenger
    A(t[201], a[6914]); -- Scholomance: Bronze
    A(t[201], a[6915]); -- Scholomance: Silver
    A(t[201], a[6916]); -- Scholomance: Gold
    A(t[201], a[8438]); -- Challenge Master: Scholomance
    t[191] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[189], t[191]);
    A(t[191], a[6932]); -- Glory of the Pandaria Raider
    A(t[191], a[8124]); -- Glory of the Thundering Raider
    A(t[191], a[8454]); -- Glory of the Orgrimmar Raider
    t[202] = c:New(k.GetInstanceInfoName(317)); -- Mogu'shan Vaults
    C(t[191], t[202]);
    A(t[202], a[7933]); -- And... It's Good!
    A(t[202], a[6687]); -- Getting Hot In Here
    A(t[202], a[6455]); -- Show Me Your Moves!
    A(t[202], a[6458]); -- Guardians of Mogu'shan
    A(t[202], a[6844]); -- The Vault of Mysteries
    A(t[202], a[6954]); -- Ahead of the Curve: Will of the Emperor
    A(t[202], a[7485]); -- Cutting Edge: Will of the Emperor
    t[892] = c:New(k.L["Glory"]); -- Glory
    C(t[202], t[892]);
    A(t[892], a[6823]); -- Must Love Dogs
    A(t[892], a[6674]); -- "Anything You Can Do, I Can Do Better..."
    A(t[892], a[7056]); -- "Sorry, Were You Looking for This?"
    A(t[892], a[6686]); -- Straight Six
    t[893] = c:New(k.L["Heroic"]); -- Heroic
    C(t[202], t[893]);
    A(t[893], a[6719]); -- Heroic: Stone Guard
    A(t[893], a[6720]); -- Heroic: Feng the Accursed
    A(t[893], a[6721]); -- Heroic: Gara'jal the Spiritbinder
    A(t[893], a[6722]); -- Heroic: Four Kings
    A(t[893], a[6723]); -- Heroic: Elegon
    A(t[893], a[6724]); -- Heroic: Will of the Emperor
    t[203] = c:New(k.GetInstanceInfoName(330)); -- Heart of Fear
    C(t[191], t[203]);
    A(t[203], a[6718]); -- The Dread Approach
    A(t[203], a[6845]); -- Nightmare of Shek'zeer
    A(t[203], a[8246]); -- Ahead of the Curve: Grand Empress Shek'zeer
    A(t[203], a[7486]); -- Cutting Edge: Grand Empress Shek'zeer
    A(t[203], a[11757]); -- Sha of Fabulous
    t[894] = c:New(k.L["Glory"]); -- Glory
    C(t[203], t[894]);
    A(t[894], a[6937]); -- Overzealous
    A(t[894], a[6936]); -- Candle in the Wind
    A(t[894], a[6553]); -- Like an Arrow to the Face
    A(t[894], a[6683]); -- Less Than Three
    A(t[894], a[6518]); -- I Heard You Like Amber...
    A(t[894], a[6922]); -- Timing is Everything
    t[895] = c:New(k.L["Heroic"]); -- Heroic
    C(t[203], t[895]);
    A(t[895], a[6725]); -- Heroic: Imperial Vizier Zor'lok
    A(t[895], a[6726]); -- Heroic: Blade Lord Ta'yak
    A(t[895], a[6727]); -- Heroic: Garalon
    A(t[895], a[6728]); -- Heroic: Wind Lord Mel'jarak
    A(t[895], a[6729]); -- Heroic: Amber-Shaper Un'sok
    A(t[895], a[6730]); -- Heroic: Grand Empress Shek'zeer
    t[204] = c:New(k.GetInstanceInfoName(320)); -- Terrace of Endless Spring
    C(t[191], t[204]);
    A(t[204], a[6689]); -- Terrace of Endless Spring
    A(t[204], a[8248]); -- Ahead of the Curve: Sha of Fear
    A(t[204], a[7487]); -- Cutting Edge: Sha of Fear
    A(t[204], a[11757]); -- Sha of Fabulous
    t[896] = c:New(k.L["Glory"]); -- Glory
    C(t[204], t[896]);
    A(t[896], a[6717]); -- Power Overwhelming
    A(t[896], a[6933]); -- Who's Got Two Green Thumbs?
    A(t[896], a[6824]); -- Face Clutchers
    A(t[896], a[6825]); -- The Mind-Killer
    t[897] = c:New(k.L["Heroic"]); -- Heroic
    C(t[204], t[897]);
    A(t[897], a[6731]); -- Heroic: Protectors of the Endless
    A(t[897], a[6732]); -- Heroic: Tsulong
    A(t[897], a[6733]); -- Heroic: Lei Shi
    A(t[897], a[6734]); -- Heroic: Sha of Fear
    t[205] = c:New(k.GetInstanceInfoName(362)); -- Throne of Thunder
    C(t[191], t[205]);
    A(t[205], a[8069]); -- Last Stand of the Zandalari
    A(t[205], a[8070]); -- Forgotten Depths
    A(t[205], a[8071]); -- Halls of Flesh-Shaping
    A(t[205], a[8072]); -- Pinnacle of Storms
    A(t[205], a[8089]); -- I Thought He Was Supposed to Be Hard?
    A(t[205], a[8249]); -- Ahead of the Curve: Lei Shen
    A(t[205], a[8238]); -- Cutting Edge: Lei Shen
    A(t[205], a[8260]); -- Cutting Edge: Ra-den
    A(t[205], a[11758]); -- Thunderwear
    t[898] = c:New(k.L["Glory"]); -- Glory
    C(t[205], t[898]);
    A(t[898], a[8094]); -- Lightning Overload
    A(t[898], a[8038]); -- Cretaceous Collector
    A(t[898], a[8073]); -- Cage Match
    A(t[898], a[8077]); -- One-Up
    A(t[898], a[8082]); -- Head Case
    A(t[898], a[8097]); -- Soft Hands
    A(t[898], a[8098]); -- You Said Crossing the Streams Was Bad
    A(t[898], a[8037]); -- Genetically Unmodified Organism
    A(t[898], a[8081]); -- Ritualist Who?
    A(t[898], a[8087]); -- Can't Touch This
    A(t[898], a[8086]); -- From Dusk 'til Dawn
    A(t[898], a[8090]); -- A Complete Circuit
    t[899] = c:New(k.L["Heroic"]); -- Heroic
    C(t[205], t[899]);
    A(t[899], a[8056]); -- Heroic: Jin'rokh the Breaker
    A(t[899], a[8057]); -- Heroic: Horridon
    A(t[899], a[8058]); -- Heroic: Council of Elders
    A(t[899], a[8059]); -- Heroic: Tortos
    A(t[899], a[8060]); -- Heroic: Megaera
    A(t[899], a[8061]); -- Heroic: Ji-Kun
    A(t[899], a[8062]); -- Heroic: Durumu the Forgotten
    A(t[899], a[8063]); -- Heroic: Primordius
    A(t[899], a[8064]); -- Heroic: Dark Animus
    A(t[899], a[8065]); -- Heroic: Iron Qon
    A(t[899], a[8066]); -- Heroic: Twin Empyreans
    A(t[899], a[8067]); -- Heroic: Lei Shen
    A(t[899], a[8068]); -- Heroic: Ra-den
    t[206] = c:New(k.GetInstanceInfoName(369)); -- Siege of Orgrimmar
    C(t[191], t[206]);
    A(t[206], a[8458]); -- Vale of Eternal Sorrows
    A(t[206], a[8459]); -- Gates of Retribution
    A(t[206], a[8461]); -- The Underhold
    A(t[206], a[8462]); -- Downfall
    A(t[206], a[8679]); -- Conqueror of Orgrimmar
    A(t[206], a[8680]); -- Liberator of Orgrimmar
    A(t[206], a[8398]); -- Ahead of the Curve: Garrosh Hellscream (10 player)
    A(t[206], a[8400]); -- Cutting Edge: Garrosh Hellscream (10 player)
    A(t[206], a[8399]); -- Ahead of the Curve: Garrosh Hellscream (25 player)
    A(t[206], a[8401]); -- Cutting Edge: Garrosh Hellscream (25 player)
    A(t[206], a[11759]); -- Yaass'shaarj
    t[900] = c:New(k.L["Glory"]); -- Glory
    C(t[206], t[900]);
    A(t[900], a[8536]); -- No More Tears
    A(t[900], a[8528]); -- Go Long
    A(t[900], a[8532]); -- None Shall Pass
    A(t[900], a[8521]); -- Swallow Your Pride
    A(t[900], a[8530]); -- The Immortal Vanguard
    A(t[900], a[8520]); -- Fire in the Hole!
    A(t[900], a[8453]); -- Rescue Raiders
    A(t[900], a[8448]); -- Gamon Will Save Us!
    A(t[900], a[8538]); -- Unlimited Potential
    A(t[900], a[8529]); -- Criss Cross
    A(t[900], a[8527]); -- Giant Dinosaur vs. Mega Snail
    A(t[900], a[8543]); -- Lasers and Magnets and Drills! Oh My!
    A(t[900], a[8531]); -- Now We are the Paragon
    A(t[900], a[8537]); -- Strike!
    t[901] = c:New(k.L["Mythic"]); -- Mythic
    C(t[206], t[901]);
    A(t[901], a[8463]); -- Mythic: Immerseus
    A(t[901], a[8465]); -- Mythic: Fallen Protectors
    A(t[901], a[8466]); -- Mythic: Norushen
    A(t[901], a[8467]); -- Mythic: Sha of Pride
    A(t[901], a[8468]); -- Mythic: Galakras
    A(t[901], a[8469]); -- Mythic: Iron Juggernaut
    A(t[901], a[8470]); -- Mythic: Kor'kron Dark Shaman
    A(t[901], a[8471]); -- Mythic: General Nazgrim
    A(t[901], a[8472]); -- Mythic: Malkorok
    A(t[901], a[8478]); -- Mythic: Spoils of Pandaria
    A(t[901], a[8479]); -- Mythic: Thok the Bloodthirsty
    A(t[901], a[8480]); -- Mythic: Siegecrafter Blackfuse
    A(t[901], a[8481]); -- Mythic: Paragons of the Klaxxi
    A(t[901], a[8482]); -- Mythic: Garrosh Hellscream
    t[549] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[189], t[549]);
    A(t[549], a[6616]); -- Pandaria Tamer
    A(t[549], a[6589]); -- Pandaria Safari
    A(t[549], a[8519]); -- Celestial Family
    A(t[549], a[13469]); -- Raiding with Leashes VI: Pets of Pandaria
    A(t[549], a[6606]); -- Taming Pandaria
    A(t[549], a[8410]); -- The Celestial Tournament
    A(t[549], a[8518]); -- Master of the Masters
    A(t[549], a[7908]); -- I Choose You
    A(t[549], a[7936]); -- Pandaren Spirit Tamer
    A(t[549], a[8080]); -- Fabled Pandaren Tamer
    A(t[549], a[6558]); -- Local Pet Mauler
    A(t[549], a[6559]); -- Traveling Pet Mauler
    A(t[549], a[6560]); -- World Pet Mauler
    A(t[549], a[6607]); -- Taming Azeroth
    A(t[549], a[6601]); -- Taming the Wild
    A(t[549], a[7498]); -- Taming the Great Outdoors
    A(t[549], a[7499]); -- Taming the World
    A(t[549], a[6611]); -- Continental Tamer
    A(t[549], a[6590]); -- World Safari
    A(t[549], a[8348]); -- The Longest Day
    t[790] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Brawler's Guild
    C(t[189], t[790]);
    A(t[790], a[7937]); -- You Are Not Your $#*@! Legplates (Season 1)
    A(t[790], a[8020]); -- You Are Not Your $#*@! Legplates (Season 1)
    A(t[790], a[7940]); -- The Second Rule of Brawler's Guild (Season 1)
    A(t[790], a[7939]); -- The Second Rule of Brawler's Guild (Season 1)
    A(t[790], a[7941]); -- Brawlin' and Shot Callin' (Season 1)
    A(t[790], a[7942]); -- Brawlin' and Shot Callin' (Season 1)
    A(t[790], a[8335]); -- Having a Brawl (Season 1)
    A(t[790], a[8337]); -- Having a Brawl (Season 1)
    A(t[790], a[8336]); -- I've Got the Biggest Brawls of Them All (Season 1)
    A(t[790], a[8338]); -- I've Got the Biggest Brawls of Them All (Season 1)
    A(t[790], a[7946]); -- Now You're Just Showing Off (Season 1)
    A(t[790], a[8022]); -- Now You're Just Showing Off (Season 1)
    A(t[790], a[8340]); -- Deck Your Collection (Season 1)
    A(t[790], a[8343]); -- Deck Your Collection (Season 1)
    A(t[790], a[7947]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    A(t[790], a[7948]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    t[192] = c:New(k.L["Scenarios"]); -- Scenarios
    C(t[189], t[192]);
    A(t[192], a[6943]); -- Queuing Spree
    A(t[192], a[7385]); -- Pub Crawl
    A(t[192], a[6874]); -- Scenaturday
    A(t[192], a[7509]); -- Scenaturday
    t[207] = c:New((k.GetLFGDungeonInfo(517))); -- A Brewing Storm
    C(t[192], t[207]);
    A(t[207], a[7252]); -- A Brewing Storm
    A(t[207], a[8310]); -- Heroic: A Brewing Storm
    A(t[207], a[7257]); -- Don't Shake the Keg
    A(t[207], a[7261]); -- The Perfect Pour
    A(t[207], a[7258]); -- Party of Six
    t[499] = c:New((k.GetLFGDungeonInfo(589))); -- A Little Patience
    C(t[192], t[499]);
    A(t[499], a[7988]); -- A Little Patience
    A(t[499], a[7989]); -- Bubbletrapped!
    A(t[499], a[7990]); -- Cannonballer
    A(t[499], a[7992]); -- I Used To Love Them
    A(t[499], a[7993]); -- We've Been Dancin'
    A(t[499], a[7991]); -- Which Came First?
    t[208] = c:New((k.GetLFGDungeonInfo(511))); -- Arena of Annihilation
    C(t[192], t[208]);
    A(t[208], a[7271]); -- Arena of Annihilation
    A(t[208], a[7273]); -- Beat the Heat
    A(t[208], a[7272]); -- In the Eye of the Tiger
    t[214] = c:New((k.GetLFGDungeonInfo(593))); -- Assault on Zan'vess
    C(t[192], t[214]);
    A(t[214], a[8016]); -- Assault on Zan'vess
    A(t[214], a[8017]); -- For the Swarm
    t[220] = c:New((k.GetLFGDungeonInfo(646))); -- Blood in the Snow
    C(t[192], t[220]);
    A(t[220], a[8316]); -- Blood in the Snow
    A(t[220], a[8312]); -- Heroic: Blood in the Snow
    A(t[220], a[8329]); -- Heed the Weed
    A(t[220], a[8330]); -- Hekima's Heal-Halter
    t[209] = c:New((k.GetLFGDungeonInfo(539))); -- Brewmoon Festival
    C(t[192], t[209]);
    A(t[209], a[6923]); -- Brewmoon Festival
    A(t[209], a[6931]); -- Binan Village All-Star
    A(t[209], a[6930]); -- Yaungolian Barbecue
    t[210] = c:New((k.GetLFGDungeonInfo(504))); -- Crypt of Forgotten Kings
    C(t[192], t[210]);
    A(t[210], a[7522]); -- Crypt of Forgotten Kings
    A(t[210], a[8311]); -- Heroic: Crypt of Forgotten Kings
    A(t[210], a[7276]); -- Fancy Footwork
    A(t[210], a[7275]); -- It's a Trap!
    A(t[210], a[8368]); -- Fight Anger with Anger
    t[215] = c:New((k.GetLFGDungeonInfo(616))); -- Dagger in the Dark
    C(t[192], t[215]);
    A(t[215], a[8009]); -- Dagger in the Dark
    A(t[215], a[7987]); -- No Egg Left Behind
    A(t[215], a[7984]); -- Watery Grave
    A(t[215], a[7986]); -- You Mean That Wasn't a Void Zone?
    t[221] = c:New((k.GetLFGDungeonInfo(647))); -- Dark Heart of Pandaria
    C(t[192], t[221]);
    A(t[221], a[8317]); -- Dark Heart of Pandaria
    A(t[221], a[8318]); -- Heroic: Dark Heart of Pandaria
    A(t[221], a[8319]); -- Accelerated Archaeology
    t[218] = c:New((k.GetLFGDungeonInfo(595))); -- Domination Point
    C(t[192], t[218]);
    A(t[218], a[8013]); -- Domination Point
    A(t[218], a[8014]); -- Number Five Is Alive
    A(t[218], a[8015]); -- "Waste Not, Want Not"
    t[211] = c:New((k.GetLFGDungeonInfo(492))); -- Greenstone Village
    C(t[192], t[211]);
    A(t[211], a[7265]); -- Greenstone Village
    A(t[211], a[7267]); -- Perfect Delivery
    A(t[211], a[7266]); -- Save it for Later
    t[216] = c:New((k.GetLFGDungeonInfo(590))); -- Lion's Landing
    C(t[192], t[216]);
    A(t[216], a[8010]); -- Lion's Landing
    A(t[216], a[8011]); -- Number Five Is Alive
    A(t[216], a[8012]); -- "Waste Not, Want Not"
    t[500] = c:New(k.GetMapName(417) .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Temple of Kotmogu
    C(t[192], t[500]);
    A(t[500], a[7268]); -- The Temple of Kotmogu
    A(t[500], a[7270]); -- For Display Only
    A(t[500], a[7269]); -- Stay Off the Grass
    t[222] = c:New((k.GetLFGDungeonInfo(649))); -- The Secrets of Ragefire
    C(t[192], t[222]);
    A(t[222], a[8294]); -- The Secrets of Ragefire
    A(t[222], a[8327]); -- Heroic: The Secrets of Ragefire
    A(t[222], a[8295]); -- "The Few, the Proud, the Gob Squad"
    t[212] = c:New((k.GetLFGDungeonInfo(566))); -- Theramore's Fall
    C(t[192], t[212]);
    A(t[212], a[7523]); -- Theramore's Fall
    A(t[212], a[7524]); -- Theramore's Fall
    A(t[212], a[7526]); -- Kite Fight
    A(t[212], a[7529]); -- Kite Fight
    A(t[212], a[7527]); -- No Tank You
    A(t[212], a[7530]); -- No Tank You
    A(t[212], a[7467]); -- Theramore's Fall
    A(t[212], a[7468]); -- Theramore's Fall
    t[213] = c:New((k.GetLFGDungeonInfo(499))); -- Unga Ingoo
    C(t[192], t[213]);
    A(t[213], a[7249]); -- Unga Ingoo
    A(t[213], a[7232]); -- The Keg Runner
    A(t[213], a[7239]); -- Monkey in the Middle
    A(t[213], a[7248]); -- "Monkey See, Monkey Kill"
    A(t[213], a[7231]); -- Spill No Evil
    t[219] = c:New((k.GetLFGDungeonInfo(655))); -- Battle on the High Seas
    C(t[192], t[219]);
    A(t[219], a[8314]); -- Battle on the High Seas
    A(t[219], a[8315]); -- Battle on the High Seas
    A(t[219], a[8364]); -- Heroic: Battle on the High Seas
    A(t[219], a[8366]); -- Heroic: Battle on the High Seas
    A(t[219], a[8347]); -- Keep those Bombs Away! (From Me)
    t[490] = c:New(k.GetCategoryInfoTitle(15222)); -- Proving Grounds
    C(t[189], t[490]);
    A(t[490], a[9572]); -- Proving Yourself: Bronze Damage
    A(t[490], a[9573]); -- Proving Yourself: Silver Damage
    A(t[490], a[9574]); -- Proving Yourself: Gold Damage
    A(t[490], a[9575]); -- Proving Yourself: Endless Damage (Wave 10)
    A(t[490], a[9576]); -- Proving Yourself: Endless Damage (Wave 20)
    A(t[490], a[9577]); -- Proving Yourself: Endless Damage (Wave 30)
    A(t[490], a[9578]); -- Proving Yourself: Bronze Tank
    A(t[490], a[9579]); -- Proving Yourself: Silver Tank
    A(t[490], a[9580]); -- Proving Yourself: Gold Tank
    A(t[490], a[9581]); -- Proving Yourself: Endless Tank (Wave 10)
    A(t[490], a[9582]); -- Proving Yourself: Endless Tank (Wave 20)
    A(t[490], a[9583]); -- Proving Yourself: Endless Tank (Wave 30)
    A(t[490], a[9584]); -- Proving Yourself: Bronze Healer
    A(t[490], a[9585]); -- Proving Yourself: Silver Healer
    A(t[490], a[9586]); -- Proving Yourself: Gold Healer
    A(t[490], a[9587]); -- Proving Yourself: Endless Healer (Wave 10)
    A(t[490], a[9588]); -- Proving Yourself: Endless Healer (Wave 20)
    A(t[490], a[9589]); -- Proving Yourself: Endless Healer (Wave 30)
    A(t[490], a[9590]); -- You're Doing it Wrong
    A(t[490], a[9597]); -- You're Really Doing It Wrong
    A(t[490], a[8486]); -- Proving Yourself: Bronze Damage (Level 90)
    A(t[490], a[8491]); -- Proving Yourself: Silver Damage (Level 90)
    A(t[490], a[8496]); -- Proving Yourself: Gold Damage (Level 90)
    A(t[490], a[8501]); -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
    A(t[490], a[8504]); -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
    A(t[490], a[8507]); -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
    A(t[490], a[8487]); -- Proving Yourself: Bronze Tank (Level 90)
    A(t[490], a[8492]); -- Proving Yourself: Silver Tank (Level 90)
    A(t[490], a[8497]); -- Proving Yourself: Gold Tank (Level 90)
    A(t[490], a[8502]); -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
    A(t[490], a[8505]); -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
    A(t[490], a[8508]); -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
    A(t[490], a[8488]); -- Proving Yourself: Bronze Healer (Level 90)
    A(t[490], a[8493]); -- Proving Yourself: Silver Healer (Level 90)
    A(t[490], a[8498]); -- Proving Yourself: Gold Healer (Level 90)
    A(t[490], a[8503]); -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
    A(t[490], a[8506]); -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
    A(t[490], a[8509]); -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
    A(t[490], a[8697]); -- You're Doing it Wrong (Level 90)
    A(t[490], a[8812]); -- You're Really Doing It Wrong (Level 90)
    t[223] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[883], t[223]);
    A(t[223], a[9838]); -- "What A Strange, Interdimensional Trip It's Been"
    A(t[223], a[9640]); -- Chapter I: Call of the Archmage
    A(t[223], a[9641]); -- Chapter II: Gul'dan Strikes Back
    A(t[223], a[9642]); -- Chapter III: The Foundry Falls
    A(t[223], a[10021]); -- Chapter IV: Darkness Incarnate
    A(t[223], a[10148]); -- Chapter IV: Darkness Incarnate
    t[449] = c:New(k.L["Zones"]); -- Zones
    C(t[223], t[449]);
    t[486] = c:New(k.GetMapName(572)); -- Draenor
    C(t[449], t[486]);
    A(t[486], a[10053]); -- I Found Pepe!
    t[487] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[486], t[487]);
    A(t[487], a[8921]); -- Welcome to Draenor
    A(t[487], a[8922]); -- Welcome to Draenor
    A(t[487], a[9491]); -- The Garrison Campaign
    A(t[487], a[9492]); -- The Garrison Campaign
    A(t[487], a[9564]); -- Securing Draenor
    A(t[487], a[9562]); -- Securing Draenor
    A(t[487], a[9833]); -- Loremaster of Draenor
    A(t[487], a[9923]); -- Loremaster of Draenor
    A(t[487], a[7520]); -- The Loremaster
    t[488] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[486], t[488]);
    A(t[488], a[10018]); -- Draenor Pathfinder
    A(t[488], a[9726]); -- Treasure Hunter
    A(t[488], a[9727]); -- Expert Treasure Hunter
    A(t[488], a[10348]); -- Master Treasure Hunter
    A(t[488], a[9728]); -- Grand Treasure Hunter
    A(t[488], a[9502]); -- Draenor Cuisine
    A(t[488], a[14728]); -- To All the Squirrels Through Time and Space
    A(t[488], a[8935]); -- Draenor Explorer
    t[489] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[486], t[489]);
    A(t[489], a[9477]); -- Savage Friends
    A(t[489], a[9478]); -- Savage Friends
    t[450] = c:New(k.GetMapName(539)); -- Shadowmoon Valley
    C(t[449], t[450]);
    t[457] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[450], t[457]);
    A(t[457], a[8845]); -- As I Walk Through the Valley of the Shadow of Moon
    A(t[457], a[9602]); -- Shoot For the Moon
    A(t[457], a[9528]); -- On the Shadow's Trail
    A(t[457], a[9433]); -- A-VOID-ance
    A(t[457], a[9434]); -- One of Us! One of Us!
    A(t[457], a[9432]); -- Would You Like a Pamphlet?
    A(t[457], a[9436]); -- It's the Stones!
    A(t[457], a[9435]); -- Take From Them Everything
    A(t[457], a[9437]); -- A Demidos of Reality
    A(t[457], a[9483]); -- I Was Framed!
    A(t[457], a[9479]); -- You Can't Make a Giant Omelette...
    A(t[457], a[9481]); -- You Have Been Rylakinated!
    t[458] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[450], t[458]);
    A(t[458], a[8938]); -- Explore Shadowmoon Valley
    A(t[458], a[9924]); -- Field Photographer
    t[460] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[450], t[460]);
    A(t[460], a[9470]); -- Council of Exarchs
    t[451] = c:New(k.GetMapName(525)); -- Frostfire Ridge
    C(t[449], t[451]);
    t[461] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[451], t[461]);
    A(t[461], a[8671]); -- You'll Get Caught Up In The... Frostfire!
    A(t[461], a[9606]); -- Frostfire Fridge
    A(t[461], a[9529]); -- On the Shadow's Trail
    A(t[461], a[9533]); -- Breaker of Chains
    A(t[461], a[9530]); -- Writing in the Snow
    A(t[461], a[9531]); -- Writing in the Snow
    A(t[461], a[9534]); -- Delectable Ogre Delicacies
    A(t[461], a[9537]); -- By Fire Be... Merged?
    A(t[461], a[9536]); -- Slagnarok
    A(t[461], a[9535]); -- That Was Entirely Unnecessary
    A(t[461], a[9710]); -- Poisoning the Well
    A(t[461], a[9711]); -- Planned to Fail
    t[462] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[451], t[462]);
    A(t[462], a[8937]); -- Explore Frostfire Ridge
    t[464] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[451], t[464]);
    A(t[464], a[9471]); -- Frostwolf Orcs
    t[452] = c:New(k.GetMapName(543)); -- Gorgrond
    C(t[449], t[452]);
    A(t[452], a[9423]); -- Goliaths of Gorgrond
    t[465] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[452], t[465]);
    A(t[465], a[8923]); -- Putting the Gore in Gorgrond
    A(t[465], a[8924]); -- Putting the Gore in Gorgrond
    A(t[465], a[9607]); -- Make It a Bonus
    A(t[465], a[9655]); -- Fight the Power
    A(t[465], a[9656]); -- In Plain Sight
    A(t[465], a[9659]); -- Iron Wings
    A(t[465], a[9678]); -- Ancient No More
    A(t[465], a[9667]); -- Burn It to the Ground
    A(t[465], a[9654]); -- Mean and Green
    A(t[465], a[9658]); -- Pillars of Draenor
    A(t[465], a[9663]); -- Picky Palate
    t[466] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[452], t[466]);
    A(t[466], a[8939]); -- Explore Gorgrond
    A(t[466], a[9400]); -- Gorgrond Monster Hunter
    A(t[466], a[9401]); -- Shredder Maniac
    A(t[466], a[9402]); -- Prove Your Strength
    t[468] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[452], t[468]);
    A(t[468], a[9475]); -- Laughing Skull Orcs
    t[453] = c:New(k.GetMapName(535)); -- Talador
    C(t[449], t[453]);
    t[469] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[453], t[469]);
    A(t[469], a[8920]); -- Don't Let the Tala-door Hit You on the Way Out
    A(t[469], a[8919]); -- Don't Let the Tala-door Hit You on the Way Out
    A(t[469], a[9674]); -- I Want More Talador
    A(t[469], a[9633]); -- Cut off the Head
    A(t[469], a[9638]); -- Heralds of the Legion
    A(t[469], a[9635]); -- Bobbing for Orcs
    A(t[469], a[9634]); -- Charged Up
    A(t[469], a[9636]); -- United We Stand
    A(t[469], a[9632]); -- The Power Is Yours
    A(t[469], a[9637]); -- Poor Communication
    A(t[469], a[9486]); -- Goodness Gracious
    t[470] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[453], t[470]);
    A(t[470], a[8940]); -- Explore Talador
    t[472] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[453], t[472]);
    A(t[472], a[9476]); -- Sha'tari Defense
    t[454] = c:New(k.GetMapName(542)); -- Spires of Arak
    C(t[449], t[454]);
    A(t[454], a[9425]); -- So Grossly Incandescent
    t[473] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[454], t[473]);
    A(t[473], a[8925]); -- Between Arak and a Hard Place
    A(t[473], a[8926]); -- Between Arak and a Hard Place
    A(t[473], a[9605]); -- Arak Star
    A(t[473], a[9612]); -- Eggs in One Basket
    A(t[473], a[9613]); -- "Fish Gotta Swim, Birds Gotta Eat"
    A(t[473], a[9601]); -- King of the Monsters
    A(t[473], a[9600]); -- Monster Mash
    t[474] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[454], t[474]);
    A(t[474], a[8941]); -- Explore Spires of Arak
    t[476] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[454], t[476]);
    A(t[476], a[9469]); -- Arakkoa Outcasts
    A(t[476], a[9072]); -- Mantle of the Talon King
    t[455] = c:New(k.GetMapName(550)); -- Nagrand
    C(t[449], t[455]);
    t[477] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[455], t[477]);
    A(t[477], a[8927]); -- Nagrandeur
    A(t[477], a[8928]); -- Nagrandeur
    A(t[477], a[9615]); -- With a Nagrand Cherry On Top
    A(t[477], a[9610]); -- History of Violence
    A(t[477], a[9571]); -- Broke Back Precipice
    A(t[477], a[9548]); -- Buried Treasures
    A(t[477], a[9541]); -- The Song of Silence
    A(t[477], a[9617]); -- Making the Cut
    t[478] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[455], t[478]);
    A(t[478], a[8942]); -- Explore Nagrand
    A(t[478], a[9924]); -- Field Photographer
    t[480] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[455], t[480]);
    A(t[480], a[9472]); -- Steamwheedle Preservation Society
    t[456] = c:New(k.GetMapName(534)); -- Tanaan Jungle
    C(t[449], t[456]);
    A(t[456], a[10071]); -- The Legion Will NOT Conquer All
    t[481] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[456], t[481]);
    A(t[481], a[10067]); -- In Pursuit of Gul'dan
    A(t[481], a[10074]); -- In Pursuit of Gul'dan
    A(t[481], a[10068]); -- Draenor's Last Stand
    A(t[481], a[10075]); -- Draenor's Last Stand
    A(t[481], a[10072]); -- Rumble in the Jungle
    A(t[481], a[10265]); -- Rumble in the Jungle
    t[482] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[456], t[482]);
    A(t[482], a[10261]); -- Jungle Treasure Hunter
    A(t[482], a[10262]); -- Jungle Treasure Master
    A(t[482], a[10260]); -- Explore Tanaan Jungle
    A(t[482], a[10069]); -- "I Came, I Clawed, I Conquered"
    A(t[482], a[10061]); -- Hellbane
    A(t[482], a[10259]); -- Jungle Hunter
    A(t[482], a[10070]); -- Jungle Stalker
    A(t[482], a[10334]); -- Predator
    t[484] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[456], t[484]);
    A(t[484], a[10349]); -- Tanaan Diplomat
    A(t[484], a[10350]); -- Tanaan Diplomat
    t[224] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[223], t[224]);
    A(t[224], a[9391]); -- Draenor Dungeon Hero
    A(t[224], a[9619]); -- Savage Hero
    A(t[224], a[9396]); -- Glory of the Draenor Hero
    A(t[224], a[8895]); -- Challenge Warlord
    A(t[224], a[8897]); -- Challenge Warlord: Bronze
    A(t[224], a[8898]); -- Challenge Warlord: Silver
    A(t[224], a[8899]); -- Challenge Warlord: Gold
    t[226] = c:New(k.GetInstanceInfoName(385)); -- Bloodmaul Slag Mines
    C(t[224], t[226]);
    A(t[226], a[9005]); -- Come With Me If You Want to Live
    A(t[226], a[8993]); -- A Gift of Earth and Fire
    A(t[226], a[9008]); -- Is Draenor on Fire?
    A(t[226], a[9037]); -- Bloodmaul Slag Mines
    A(t[226], a[9046]); -- Heroic: Bloodmaul Slag Mines
    A(t[226], a[10076]); -- Mythic: Bloodmaul Slag Mines
    A(t[226], a[8875]); -- Bloodmaul Slag Mines Challenger
    A(t[226], a[8876]); -- Bloodmaul Slag Mines: Bronze
    A(t[226], a[8877]); -- Bloodmaul Slag Mines: Silver
    A(t[226], a[8878]); -- Bloodmaul Slag Mines: Gold
    A(t[226], a[9620]); -- Challenge Master: Bloodmaul Slag Mines
    t[227] = c:New(k.GetInstanceInfoName(558)); -- Iron Docks
    C(t[224], t[227]);
    A(t[227], a[9081]); -- Expert Timing
    A(t[227], a[9083]); -- "Militaristic, Expansionist"
    A(t[227], a[9082]); -- Take Cover!
    A(t[227], a[9038]); -- Iron Docks
    A(t[227], a[9047]); -- Heroic: Iron Docks
    A(t[227], a[10079]); -- Mythic: Iron Docks
    A(t[227], a[8997]); -- Iron Docks Challenger
    A(t[227], a[8998]); -- Iron Docks: Bronze
    A(t[227], a[8999]); -- Iron Docks: Silver
    A(t[227], a[9000]); -- Iron Docks: Gold
    A(t[227], a[9621]); -- Challenge Master: Iron Docks
    A(t[227], a[15694]); -- Keystone Hero: Iron Docks
    t[228] = c:New(k.GetInstanceInfoName(547)); -- Auchindoun
    C(t[224], t[228]);
    A(t[228], a[9023]); -- ...They All Fall Down
    A(t[228], a[9551]); -- Demon's Souls
    A(t[228], a[9552]); -- No Tag-backs!
    A(t[228], a[9039]); -- Auchindoun
    A(t[228], a[9049]); -- Heroic: Auchindoun
    A(t[228], a[10080]); -- Mythic: Auchindoun
    A(t[228], a[8879]); -- Auchindoun Challenger
    A(t[228], a[8880]); -- Auchindoun: Bronze
    A(t[228], a[8881]); -- Auchindoun: Silver
    A(t[228], a[8882]); -- Auchindoun: Gold
    A(t[228], a[9622]); -- Challenge Master: Auchindoun
    A(t[228], a[9924]); -- Field Photographer
    t[229] = c:New(k.GetInstanceInfoName(476)); -- Skyreach
    C(t[224], t[229]);
    A(t[229], a[9033]); -- Ready for Raiding IV
    A(t[229], a[9035]); -- I Saw Solis
    A(t[229], a[9034]); -- Magnify... Enhance
    A(t[229], a[9036]); -- Monomania
    A(t[229], a[8843]); -- Skyreach
    A(t[229], a[8844]); -- Heroic: Skyreach
    A(t[229], a[10081]); -- Mythic: Skyreach
    A(t[229], a[8871]); -- Skyreach Challenger
    A(t[229], a[8872]); -- Skyreach: Bronze
    A(t[229], a[8873]); -- Skyreach: Silver
    A(t[229], a[8874]); -- Skyreach: Gold
    A(t[229], a[9623]); -- Challenge Master: Skyreach
    t[230] = c:New(k.GetInstanceInfoName(536)); -- Grimrail Depot
    C(t[224], t[230]);
    A(t[230], a[9024]); -- This Is Why We Can't Have Nice Things
    A(t[230], a[9007]); -- No Ticket
    A(t[230], a[9043]); -- Grimrail Depot
    A(t[230], a[9052]); -- Heroic: Grimrail Depot
    A(t[230], a[10082]); -- Mythic: Grimrail Depot
    A(t[230], a[8887]); -- Grimrail Depot Challenger
    A(t[230], a[8888]); -- Grimrail Depot: Bronze
    A(t[230], a[8889]); -- Grimrail Depot: Silver
    A(t[230], a[8890]); -- Grimrail Depot: Gold
    A(t[230], a[9625]); -- Challenge Master: Grimrail Depot
    A(t[230], a[15695]); -- Keystone Hero: Grimrail Depot
    t[231] = c:New(k.GetInstanceInfoName(556)); -- The Everbloom
    C(t[224], t[231]);
    A(t[231], a[9017]); -- Water Management
    A(t[231], a[9493]); -- "They Burn, Burn, Burn"
    A(t[231], a[9223]); -- Weed Whacker
    A(t[231], a[9044]); -- The Everbloom
    A(t[231], a[9053]); -- Heroic: The Everbloom
    A(t[231], a[10083]); -- Mythic: The Everbloom
    A(t[231], a[9001]); -- The Everbloom Challenger
    A(t[231], a[9002]); -- The Everbloom: Bronze
    A(t[231], a[9003]); -- The Everbloom: Silver
    A(t[231], a[9004]); -- The Everbloom: Gold
    A(t[231], a[9624]); -- Challenge Master: The Everbloom
    t[232] = c:New(k.GetInstanceInfoName(537)); -- Shadowmoon Burial Grounds
    C(t[224], t[232]);
    A(t[232], a[9018]); -- What's Your Sign?
    A(t[232], a[9025]); -- Icky Ichors
    A(t[232], a[9026]); -- Souls of the Lost
    A(t[232], a[9041]); -- Shadowmoon Burial Grounds
    A(t[232], a[9054]); -- Heroic: Shadowmoon Burial Grounds
    A(t[232], a[10084]); -- Mythic: Shadowmoon Burial Grounds
    A(t[232], a[8883]); -- Shadowmoon Burial Grounds Challenger
    A(t[232], a[8884]); -- Shadowmoon Burial Grounds: Bronze
    A(t[232], a[8885]); -- Shadowmoon Burial Grounds: Silver
    A(t[232], a[8886]); -- Shadowmoon Burial Grounds: Gold
    A(t[232], a[9626]); -- Challenge Master: Shadowmoon Burial Grounds
    A(t[232], a[16660]); -- Keystone Hero: Shadowmoon Burial Grounds
    t[233] = c:New(k.GetInstanceInfoName(559)); -- Upper Blackrock Spire
    C(t[224], t[233]);
    A(t[233], a[9045]); -- "Magnets, How Do They Work?"
    A(t[233], a[9058]); -- Leeeeeeeeeeeeeroy...?
    A(t[233], a[9056]); -- Bridge Over Troubled Fire
    A(t[233], a[9057]); -- Dragonmaw? More Like Dragonfall!
    A(t[233], a[9042]); -- Upper Blackrock Spire
    A(t[233], a[9055]); -- Heroic: Upper Blackrock Spire
    A(t[233], a[10085]); -- Mythic: Upper Blackrock Spire
    A(t[233], a[8891]); -- Upper Blackrock Spire Challenger
    A(t[233], a[8892]); -- Upper Blackrock Spire: Bronze
    A(t[233], a[8893]); -- Upper Blackrock Spire: Silver
    A(t[233], a[8894]); -- Upper Blackrock Spire: Gold
    A(t[233], a[9627]); -- Challenge Master: Upper Blackrock Spire
    t[225] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[223], t[225]);
    A(t[225], a[9619]); -- Savage Hero
    A(t[225], a[8985]); -- Glory of the Draenor Raider
    A(t[225], a[10149]); -- Glory of the Hellfire Raider
    t[234] = c:New(k.GetInstanceInfoName(477)); -- Highmaul
    C(t[225], t[234]);
    A(t[234], a[8986]); -- The Walled City
    A(t[234], a[8987]); -- Arcane Sanctum
    A(t[234], a[8988]); -- Imperator's Fall
    A(t[234], a[9441]); -- Ahead of the Curve: Imperator's Fall
    A(t[234], a[9442]); -- Cutting Edge: Imperator's Fall
    t[886] = c:New(k.L["Glory"]); -- Glory
    C(t[234], t[886]);
    A(t[886], a[8948]); -- Flame On!
    A(t[886], a[8947]); -- "Hurry Up, Maggot!"
    A(t[886], a[8974]); -- More Like Wrecked-us
    A(t[886], a[8975]); -- A Fungus Among Us
    A(t[886], a[8958]); -- Brothers in Arms
    A(t[886], a[8976]); -- Pair Annihilation
    A(t[886], a[8977]); -- Lineage of Power
    t[887] = c:New(k.L["Mythic"]); -- Mythic
    C(t[234], t[887]);
    A(t[887], a[8949]); -- Mythic: Kargath Bladefist
    A(t[887], a[8960]); -- Mythic: The Butcher
    A(t[887], a[8961]); -- Mythic: Tectus
    A(t[887], a[8962]); -- Mythic: Brackenspore
    A(t[887], a[8963]); -- Mythic: Twin Ogron
    A(t[887], a[8964]); -- Mythic: Ko'ragh
    A(t[887], a[8965]); -- Mythic: Imperator's Fall
    t[235] = c:New(k.GetInstanceInfoName(457)); -- Blackrock Foundry
    C(t[225], t[235]);
    A(t[235], a[8989]); -- Slagworks
    A(t[235], a[8990]); -- Black Forge
    A(t[235], a[8991]); -- Iron Assembly
    A(t[235], a[8992]); -- Blackhand's Crucible
    A(t[235], a[9444]); -- Ahead of the Curve: Blackhand's Crucible
    A(t[235], a[9443]); -- Cutting Edge: Blackhand's Crucible
    A(t[235], a[11740]); -- Make it W-orc W-orc
    t[888] = c:New(k.L["Glory"]); -- Glory
    C(t[235], t[888]);
    A(t[888], a[8979]); -- "He Shoots, He Ores"
    A(t[888], a[8978]); -- The Iron Price
    A(t[888], a[8930]); -- "Ya, We've Got Time..."
    A(t[888], a[8980]); -- Stamp Stamp Revolution
    A(t[888], a[8929]); -- The Steel Has Been Brought
    A(t[888], a[8983]); -- Would You Give Me a Hand?
    A(t[888], a[8981]); -- Fain Would Lie Down
    A(t[888], a[8982]); -- There's Always a Bigger Train
    A(t[888], a[8984]); -- Be Quick or Be Dead
    A(t[888], a[8952]); -- "Ashes, Ashes..."
    t[889] = c:New(k.L["Mythic"]); -- Mythic
    C(t[235], t[889]);
    A(t[889], a[8967]); -- Mythic: Oregorger
    A(t[889], a[8966]); -- Mythic: Gruul
    A(t[889], a[8970]); -- Mythic: Blast Furnace
    A(t[889], a[8968]); -- Mythic: Hans'gar and Franzok
    A(t[889], a[8932]); -- Mythic: Flamebender Ka'graz
    A(t[889], a[8971]); -- Mythic: Kromog
    A(t[889], a[8956]); -- Mythic: Beastlord Darmac
    A(t[889], a[8969]); -- Mythic: Operator Thogar
    A(t[889], a[8972]); -- Mythic: Iron Maidens
    A(t[889], a[8973]); -- Mythic: Blackhand's Crucible
    t[236] = c:New(k.GetInstanceInfoName(669)); -- Hellfire Citadel
    C(t[225], t[236]);
    A(t[236], a[10023]); -- Hellbreach
    A(t[236], a[10024]); -- Halls of Blood
    A(t[236], a[10025]); -- Bastion of Shadows
    A(t[236], a[10020]); -- Destructor's Rise
    A(t[236], a[10019]); -- The Black Gate
    A(t[236], a[9680]); -- Time is a Flat Circle
    A(t[236], a[10044]); -- Ahead of the Curve: The Black Gate
    A(t[236], a[10045]); -- Cutting Edge: The Black Gate
    A(t[236], a[11631]); -- Extreme Makeover: Fel Edition
    t[890] = c:New(k.L["Glory"]); -- Glory
    C(t[236], t[890]);
    A(t[890], a[10026]); -- Nearly Indestructible
    A(t[890], a[10057]); -- Turning the Tide
    A(t[890], a[10013]); -- Waves Came Crashing Down All Around
    A(t[890], a[10054]); -- Don't Fear the Reaper
    A(t[890], a[9972]); -- A Race Against Slime
    A(t[890], a[9979]); -- Get In My Belly!
    A(t[890], a[9988]); -- Pro Toss
    A(t[890], a[10086]); -- I'm a Soul Man
    A(t[890], a[9989]); -- Non-Lethal Enforcer
    A(t[890], a[10012]); -- This Land Was Green and Good Until...
    A(t[890], a[10087]); -- You Gotta Keep 'em Separated
    A(t[890], a[10030]); -- Bad Manner(oth)
    A(t[890], a[10073]); -- Echoes of Doomfire
    t[891] = c:New(k.L["Mythic"]); -- Mythic
    C(t[236], t[891]);
    A(t[891], a[10027]); -- Mythic: Hellfire Assault
    A(t[891], a[10032]); -- Mythic: Iron Reaver
    A(t[891], a[10033]); -- Mythic: Kormrok
    A(t[891], a[10034]); -- Mythic: Hellfire High Council
    A(t[891], a[10035]); -- Mythic: Kilrogg Deadeye
    A(t[891], a[10253]); -- Mythic: Gorefiend
    A(t[891], a[10037]); -- Mythic: Shadow-Lord Iskar
    A(t[891], a[10040]); -- Mythic: Socrethar the Eternal
    A(t[891], a[10041]); -- Mythic: Tyrant Velhari
    A(t[891], a[10038]); -- Mythic: Fel Lord Zakuun
    A(t[891], a[10039]); -- Mythic: Xhul'horac
    A(t[891], a[10042]); -- Mythic: Mannoroth
    A(t[891], a[10043]); -- Mythic: Archimonde
    t[548] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[223], t[548]);
    A(t[548], a[9685]); -- Draenor Safari
    A(t[548], a[9069]); -- An Awfully Big Adventure
    A(t[548], a[9463]); -- Draenic Pet Battler
    A(t[548], a[9724]); -- Taming Draenor
    A(t[548], a[10052]); -- Tiny Terrors in Tanaan
    t[791] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Brawler's Guild
    C(t[223], t[791]);
    A(t[791], a[9168]); -- You Are Not Your $#*@! Legplates (Season 2)
    A(t[791], a[9172]); -- You Are Not Your $#*@! Legplates (Season 2)
    A(t[791], a[9169]); -- The Second Rule of Brawler's Guild (Season 2)
    A(t[791], a[9173]); -- The Second Rule of Brawler's Guild (Season 2)
    A(t[791], a[9170]); -- Brawlin' and Shot Callin' (Season 2)
    A(t[791], a[9174]); -- Brawlin' and Shot Callin' (Season 2)
    A(t[791], a[9171]); -- Now You're Just Showing Off (Season 2)
    A(t[791], a[9175]); -- Now You're Just Showing Off (Season 2)
    A(t[791], a[8339]); -- Collect Your Deck (Season 2)
    A(t[791], a[8342]); -- Collect Your Deck (Season 2)
    A(t[791], a[9176]); -- Deck Your Collection (Season 2)
    A(t[791], a[9177]); -- Deck Your Collection (Season 2)
    A(t[791], a[7949]); -- Rabble Rabble Rabble (Season 2)
    A(t[791], a[7950]); -- Rabble Rabble Rabble (Season 2)
    A(t[791], a[7943]); -- I'm Your Number One Fan (Season 2)
    A(t[791], a[7945]); -- Haters Gonna Hate (Season 2)
    A(t[791], a[7944]); -- Bottle Service (Season 2)
    A(t[791], a[7947]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    A(t[791], a[7948]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    t[432] = c:New(k.L["Garrison"]); -- Garrison
    C(t[223], t[432]);
    A(t[432], a[9100]); -- More Plots
    A(t[432], a[9545]); -- More Plots
    A(t[432], a[9101]); -- Even More Plots
    A(t[432], a[9546]); -- Even More Plots
    A(t[432], a[9210]); -- Garrison Buddies
    A(t[432], a[9132]); -- Garrison Buddies
    A(t[432], a[8933]); -- Staying Regular
    A(t[432], a[9928]); -- Don't Call Me Junior
    A(t[432], a[9901]); -- Don't Call Me Junior
    A(t[432], a[9828]); -- Ten Hit Tunes
    A(t[432], a[9897]); -- Ten Hit Tunes
    A(t[432], a[9912]); -- Azeroth's Top Twenty Tunes
    A(t[432], a[9914]); -- Azeroth's Top Twenty Tunes
    A(t[432], a[10015]); -- Full Discography
    A(t[432], a[10016]); -- Full Discography
    A(t[432], a[9107]); -- Follow the Leader
    A(t[432], a[9108]); -- "Where You Go, They Will Follow"
    A(t[432], a[9109]); -- Fearless Leader
    A(t[432], a[9494]); -- Commander
    A(t[432], a[9110]); -- Following Up
    A(t[432], a[9111]); -- Raising the Bar
    A(t[432], a[9129]); -- Filling the Ranks
    A(t[432], a[9130]); -- A Rare Friend
    A(t[432], a[9131]); -- An Epic Buddy
    A(t[432], a[9211]); -- My Item Level Is Higher than Yours
    A(t[432], a[9212]); -- My Item Level Is Way Higher than Yours
    A(t[432], a[9213]); -- Item Level Army
    A(t[432], a[9243]); -- Item Level Force
    A(t[432], a[9152]); -- It's an Invasion!
    A(t[432], a[9133]); -- On a Mission
    A(t[432], a[9134]); -- On a Few Missions
    A(t[432], a[9138]); -- On a Lot of Missions
    A(t[432], a[9139]); -- On a Massive Number of Missions
    A(t[432], a[9140]); -- On a Metric Ton of Missions
    A(t[432], a[9141]); -- A Rare Mission
    A(t[432], a[9142]); -- Keeping It Rare
    A(t[432], a[9143]); -- The Rarer the Better
    A(t[432], a[9145]); -- Treasure Mission Specialist
    A(t[432], a[9524]); -- Treasure Master
    A(t[432], a[9146]); -- Patrol Mission Specialist
    A(t[432], a[9523]); -- Patrolling Draenor
    A(t[432], a[9147]); -- Mission Specialist
    A(t[432], a[9150]); -- Exploration Mission Specialist
    A(t[432], a[9900]); -- Exploration Mission Master
    A(t[432], a[9246]); -- Master Draenor Crafter
    A(t[432], a[9248]); -- Defender of Draenor
    A(t[432], a[9630]); -- Defender of Draenor
    A(t[432], a[9255]); -- Mythic Draenor Raider
    A(t[432], a[9631]); -- Mythic Draenor Raider
    A(t[432], a[9264]); -- Draenor Pet Brawler
    A(t[432], a[9265]); -- Master of Apexis
    t[485] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[432], t[485]);
    A(t[485], a[9825]); -- Master Relic Hunter
    A(t[485], a[9836]); -- Master Relic Hunter
    t[852] = c:New(k.L["Buildings"]); -- Buildings
    C(t[432], t[852]);
    A(t[852], a[9125]); -- Draftsman
    A(t[852], a[9126]); -- Master Draftsman
    A(t[852], a[9128]); -- Grand Master Draftsman
    A(t[852], a[9095]); -- Builder
    A(t[852], a[9096]); -- Master Builder
    A(t[852], a[9097]); -- Keepin' Busy
    A(t[852], a[9094]); -- Garrison Architect
    A(t[852], a[9487]); -- Got My Mind On My Draenor Money
    A(t[852], a[9076]); -- Choppin' Some Logs
    A(t[852], a[9077]); -- Choppin' Some More Logs
    A(t[852], a[9080]); -- Choppin' Even More Logs
    A(t[852], a[9078]); -- Choppin' Even More Logs
    A(t[852], a[9429]); -- Upgrading the Mill
    A(t[852], a[9099]); -- Time for an Upgrade
    A(t[852], a[9098]); -- Movin' On Up
    A(t[852], a[9405]); -- Working Some Orders
    A(t[852], a[9406]); -- Working More Orders
    A(t[852], a[9407]); -- Working Many Orders
    A(t[852], a[9450]); -- The Trap Game
    A(t[852], a[9565]); -- Master Trapper
    A(t[852], a[9451]); -- Trapper's Delight
    A(t[852], a[9452]); -- Trap Superstar
    A(t[852], a[9468]); -- Salvaging Pays Off
    A(t[852], a[9495]); -- The Bone Collector
    A(t[852], a[9497]); -- Finding Your Waystones
    A(t[852], a[9498]); -- Wingman
    A(t[852], a[9499]); -- Wingmen
    A(t[852], a[9538]); -- Intro to Husbandry
    A(t[852], a[9527]); -- Terrific Technology
    A(t[852], a[9703]); -- Stay Awhile and Listen
    A(t[852], a[9453]); -- Draenic Stone Collector
    A(t[852], a[9454]); -- Draenic Seed Collector
    t[854] = c:New(k.L["Stables"], true); -- Stables
    C(t[852], t[854]);
    A(t[854], a[9526]); -- Master of Mounts
    A(t[854], a[9539]); -- Advanced Husbandry
    A(t[854], a[9705]); -- Advanced Husbandry
    A(t[854], a[9540]); -- The Stable Master
    A(t[854], a[9706]); -- The Stable Master
    t[853] = c:New(k.L["Gladiator's Sanctum"], true); -- Gladiator's Sanctum
    C(t[852], t[853]);
    A(t[853], a[9517]); -- Nemesis: Death Stalker
    A(t[853], a[9513]); -- Nemesis: Scourge of the Kaldorei
    A(t[853], a[9516]); -- Nemesis: Slayer of Sin'dorei
    A(t[853], a[9509]); -- Nemesis: Draenei Destroyer
    A(t[853], a[9521]); -- Nemesis: The Butcher
    A(t[853], a[9511]); -- Nemesis: Gnomebane
    A(t[853], a[9522]); -- Nemesis: Troll Hunter
    A(t[853], a[9510]); -- Nemesis: Dwarfstalker
    A(t[853], a[9519]); -- Nemesis: Orcslayer
    A(t[853], a[9512]); -- Nemesis: Manslayer
    A(t[853], a[9518]); -- Nemesis: Killer of Kezan
    A(t[853], a[9515]); -- Nemesis: Worgen Hunter
    A(t[853], a[9520]); -- Nemesis: Huojin's Fall
    A(t[853], a[9514]); -- Nemesis: Terror of the Tushui
    A(t[853], a[9639]); -- "Fight, Kill, Salute!"
    A(t[853], a[9508]); -- Warlord of Draenor
    A(t[853], a[9738]); -- Warlord of Draenor
    t[856] = c:New(k.L["Shipyard"], true); -- Shipyard
    C(t[852], t[856]);
    A(t[856], a[10177]); -- Set Sail!
    A(t[856], a[10169]); -- Naval Fleet
    A(t[856], a[10168]); -- Naval Armada
    A(t[856], a[10170]); -- Seaman
    A(t[856], a[10172]); -- Petty Officer
    A(t[856], a[10255]); -- Petty Officer
    A(t[856], a[10173]); -- Fleet Commander
    A(t[856], a[10275]); -- Fleet Commander
    A(t[856], a[10174]); -- Admiral
    A(t[856], a[10276]); -- Admiral
    A(t[856], a[10156]); -- Naval Combat Specialist
    A(t[856], a[10154]); -- Naval Combat Expert
    A(t[856], a[10159]); -- Naval Treasure Specialist
    A(t[856], a[10160]); -- Naval Treasure Expert
    A(t[856], a[10161]); -- Naval Siege Specialist
    A(t[856], a[10155]); -- Naval Siege Expert
    A(t[856], a[10162]); -- Naval Training Specialist
    A(t[856], a[10163]); -- Naval Training Expert
    A(t[856], a[10017]); -- Naval Bonus Specialist
    A(t[856], a[10036]); -- Naval Bonus Expert
    A(t[856], a[10164]); -- Master of the Seas
    A(t[856], a[10165]); -- Ironsides
    A(t[856], a[10166]); -- Naval Mechanics
    A(t[856], a[10256]); -- Charting a Course
    A(t[856], a[10258]); -- Charting a Course
    A(t[856], a[10167]); -- Exploring the High Seas
    A(t[856], a[10307]); -- Exploring the High Seas
    t[855] = c:New(k.L["Invasions"], true); -- Invasions
    C(t[432], t[855]);
    A(t[855], a[9167]); -- Invasion Specialist
    A(t[855], a[9543]); -- Invasion? What Invasion?
    A(t[855], a[9244]); -- Invasions Are Better with Friends
    A(t[855], a[9205]); -- Iron Horde Invasion
    A(t[855], a[9206]); -- Shadowmoon Clan Invasion
    A(t[855], a[9203]); -- Shadow Council Invasion
    A(t[855], a[9204]); -- Ogre Invasion
    A(t[855], a[9207]); -- Goren Invasion
    A(t[855], a[9208]); -- Botani Invasion
    A(t[855], a[9162]); -- Bronze Defender
    A(t[855], a[9164]); -- Silver Defender
    A(t[855], a[9165]); -- Golden Defender
    A(t[855], a[9826]); -- Platinum Defender
    A(t[855], a[9209]); -- Master Defender
    A(t[855], a[9827]); -- Impervious Defender
    A(t[855], a[9181]); -- Save Those Buildings!
    A(t[855], a[9858]); -- Master and Commander
    t[237] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[883], t[237]);
    t[381] = c:New(k.L["Zones"]); -- Zones
    C(t[237], t[381]);
    t[396] = c:New(k.GetMapName(619)); -- Broken Isles
    C(t[381], t[396]);
    A(t[396], a[11160]); -- Unleashed Monstrosities
    t[397] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[396], t[397]);
    A(t[397], a[11157]); -- Loremaster of Legion
    A(t[397], a[10877]); -- Pillars of Creation
    A(t[397], a[11189]); -- Variety is the Spice of Life
    A(t[397], a[11186]); -- Tehd & Marius' Excellent Adventure
    A(t[397], a[11240]); -- Harbinger
    A(t[397], a[11544]); -- Defender of the Broken Isles
    A(t[397], a[11846]); -- Champions of Legionfall
    A(t[397], a[7520]); -- The Loremaster
    t[398] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[396], t[398]);
    A(t[398], a[11190]); -- "Broken Isles Pathfinder, Part One"
    A(t[398], a[11446]); -- "Broken Isles Pathfinder, Part Two"
    A(t[398], a[14729]); -- To All the Squirrels I Love Despite Their Scars
    A(t[398], a[11188]); -- Broken Isles Explorer
    t[413] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[396], t[413]);
    A(t[413], a[11474]); -- "Free For All, More For Me"
    t[414] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[396], t[414]);
    A(t[414], a[10672]); -- Broken Isles Diplomat
    A(t[414], a[11159]); -- Friends in a Broken Land
    A(t[414], a[11652]); -- The Reputable
    A(t[414], a[11653]); -- Paragon of the Broken Isles
    A(t[414], a[11941]); -- Chromie Homie
    t[382] = c:New(k.GetMapName(626)); -- Dalaran
    C(t[381], t[382]);
    A(t[382], a[10770]); -- The Tangerine Traveler
    t[383] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[382], t[383]);
    A(t[383], a[12416]); -- The Total Package
    A(t[383], a[12431]); -- Post Haste
    A(t[383], a[12439]); -- Priority Mail
    t[405] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[382], t[405]);
    A(t[405], a[11066]); -- Underbelly Tycoon
    t[384] = c:New(k.GetMapName(630)); -- Azsuna
    C(t[381], t[384]);
    t[385] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[384], t[385]);
    A(t[385], a[10763]); -- Azsuna Matata
    t[399] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[384], t[399]);
    A(t[399], a[10665]); -- Explore Azsuna
    A(t[399], a[11175]); -- Higher Dimensional Learning
    A(t[399], a[11256]); -- Treasures of Azsuna
    A(t[399], a[11261]); -- Adventurer of Azsuna
    t[412] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[384], t[412]);
    A(t[412], a[11475]); -- Mission Accomplished
    t[387] = c:New(k.GetMapName(641)); -- Val'sharah
    C(t[381], t[387]);
    t[391] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[387], t[391]);
    A(t[391], a[10698]); -- That's Val'sharah Folks!
    t[400] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[387], t[400]);
    A(t[400], a[10666]); -- Explore Val'sharah
    A(t[400], a[11258]); -- Treasures of Val'sharah
    A(t[400], a[11262]); -- Adventurer of Val'sharah
    t[411] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[387], t[411]);
    A(t[411], a[11477]); -- Off the Top Rook
    t[388] = c:New(k.GetMapName(650)); -- Highmountain
    C(t[381], t[388]);
    t[392] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[388], t[392]);
    A(t[392], a[10059]); -- Ain't No Mountain High Enough
    A(t[392], a[10774]); -- Hatchling of the Talon
    A(t[392], a[10626]); -- Zoom!
    A(t[392], a[10398]); -- Drum Circle
    A(t[392], a[11427]); -- No Shellfish Endeavor
    t[401] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[388], t[401]);
    A(t[401], a[10667]); -- Explore Highmountain
    A(t[401], a[11257]); -- Treasures of Highmountain
    A(t[401], a[11264]); -- Adventurer of Highmountain
    t[410] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[388], t[410]);
    A(t[410], a[11478]); -- The Darkbrul-oh
    t[416] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[388], t[416]);
    A(t[416], a[12292]); -- Highmountain Tribe
    t[386] = c:New(k.GetMapName(634)); -- Stormheim
    C(t[381], t[386]);
    t[390] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[386], t[390]);
    A(t[390], a[10790]); -- "Vrykul Story, Bro"
    A(t[390], a[10793]); -- What a Ripoff!
    A(t[390], a[11232]); -- "Lock, Stock and Two Smoking Goblins"
    A(t[390], a[11427]); -- No Shellfish Endeavor
    t[402] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[386], t[402]);
    A(t[402], a[10668]); -- Explore Stormheim
    A(t[402], a[10627]); -- Going Up
    A(t[402], a[11259]); -- Treasures of Stormheim
    A(t[402], a[11263]); -- Adventurer of Stormheim
    A(t[402], a[11178]); -- Wake the Dragon
    t[409] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[386], t[409]);
    A(t[409], a[11476]); -- Saddle Sore
    t[389] = c:New(k.GetMapName(680)); -- Suramar
    C(t[381], t[389]);
    t[393] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[389], t[393]);
    A(t[393], a[10617]); -- Nightfallen But Not Forgotten
    A(t[393], a[11124]); -- Good Suramaritan
    A(t[393], a[10756]); -- Leyline Bling
    A(t[393], a[11125]); -- Now You're Thinking With Portals
    A(t[393], a[11133]); -- Why Can't I Hold All This Mana?
    A(t[393], a[11340]); -- Insurrection
    A(t[393], a[11427]); -- No Shellfish Endeavor
    t[403] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[389], t[403]);
    A(t[403], a[10669]); -- Explore Suramar
    A(t[403], a[11260]); -- Treasures of Suramar
    A(t[403], a[11265]); -- Adventurer of Suramar
    t[415] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[389], t[415]);
    A(t[415], a[10778]); -- The Nightfallen
    t[394] = c:New(k.GetMapName(646)); -- Broken Shore
    C(t[381], t[394]);
    A(t[394], a[11786]); -- Terrors of the Shore
    t[395] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[394], t[395]);
    A(t[395], a[11607]); -- They See Me Rolling
    A(t[395], a[11546]); -- Breaching the Tomb
    A(t[395], a[11681]); -- Crate Expectations
    A(t[395], a[11731]); -- A Magic Contribution
    A(t[395], a[11732]); -- A Magnificent Contribution
    A(t[395], a[11735]); -- Take Command
    A(t[395], a[11736]); -- Assume Command
    A(t[395], a[11737]); -- Disrupting the Nether
    A(t[395], a[11738]); -- It'll Nether Happen
    t[404] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[394], t[404]);
    A(t[404], a[11543]); -- Explore Broken Shore
    A(t[404], a[11802]); -- Bringing Home the Beacon
    A(t[404], a[11841]); -- Naxt Victim
    t[417] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[394], t[417]);
    A(t[417], a[11545]); -- Legionfall Commander
    A(t[417], a[11796]); -- Armies of Legionfall
    t[406] = c:New(k.GetMapName(905)); -- Argus
    C(t[381], t[406]);
    t[407] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[406], t[407]);
    A(t[407], a[12066]); -- You Are Now Prepared!
    A(t[407], a[12073]); -- Locked and Loaded
    t[408] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[406], t[408]);
    A(t[408], a[12074]); -- "Shoot First, Loot Later"
    A(t[408], a[12084]); -- Infused and Abused
    A(t[408], a[12028]); -- Envision Invasion Eradication
    A(t[408], a[12026]); -- Invasion Obliteration
    A(t[408], a[12069]); -- Explore Argus
    A(t[408], a[12077]); -- Adventurer of Argus
    A(t[408], a[12078]); -- Commander of Argus
    A(t[408], a[12083]); -- Paragon of Argus
    A(t[408], a[12101]); -- We Came Here For Two Reasons
    A(t[408], a[12102]); -- To Kill Demons...
    A(t[408], a[12103]); -- ...And Chew Mana Buns
    A(t[408], a[12104]); -- And We're All Out of Mana Buns
    t[418] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[406], t[418]);
    A(t[418], a[12076]); -- Protector of the Argussian Reach
    A(t[418], a[12081]); -- Officer of the Light
    t[238] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[237], t[238]);
    A(t[238], a[11164]); -- Legion Dungeon Hero
    A(t[238], a[11163]); -- Glory of the Legion Hero
    A(t[238], a[11181]); -- Legion Keymaster
    t[240] = c:New(k.GetInstanceInfoName(716)); -- Eye of Azshara
    C(t[238], t[240]);
    A(t[240], a[10456]); -- But You Say He's Just a Friend
    A(t[240], a[10457]); -- Stay Salty
    A(t[240], a[10458]); -- Ready for Raiding V
    A(t[240], a[10780]); -- Eye of Azshara
    A(t[240], a[10781]); -- Heroic: Eye of Azshara
    A(t[240], a[10782]); -- Mythic: Eye of Azshara
    t[241] = c:New(k.GetInstanceInfoName(762)); -- Darkheart Thicket
    C(t[238], t[241]);
    A(t[241], a[10766]); -- Egg-cellent!
    A(t[241], a[10769]); -- Burning Down the House
    A(t[241], a[10783]); -- Darkheart Thicket
    A(t[241], a[10784]); -- Heroic: Darkheart Thicket
    A(t[241], a[10785]); -- Mythic: Darkheart Thicket
    t[242] = c:New(k.GetInstanceInfoName(721)); -- Halls of Valor
    C(t[238], t[242]);
    A(t[242], a[10544]); -- Stag Party
    A(t[242], a[10542]); -- I Got What You Mead
    A(t[242], a[10543]); -- Surge Protector
    A(t[242], a[10786]); -- Halls of Valor
    A(t[242], a[10788]); -- Heroic: Halls of Valor
    A(t[242], a[10789]); -- Mythic: Halls of Valor
    A(t[242], a[16659]); -- Keystone Hero: Halls of Valor
    t[243] = c:New(k.GetInstanceInfoName(767)); -- Neltharions Lair
    C(t[238], t[243]);
    A(t[243], a[10996]); -- Got to Ketchum All
    A(t[243], a[10875]); -- Can't Eat Just One
    A(t[243], a[10795]); -- Neltharion's Lair
    A(t[243], a[10796]); -- Heroic: Neltharion's Lair
    A(t[243], a[10797]); -- Mythic: Neltharion's Lair
    t[244] = c:New(k.GetInstanceInfoName(777)); -- Assault on Violet Hold
    C(t[238], t[244]);
    A(t[244], a[10554]); -- I Made a Food!
    A(t[244], a[10553]); -- You're Just Making It WORSE!
    A(t[244], a[10798]); -- Assault on Violet Hold
    A(t[244], a[10799]); -- Heroic: Assault on Violet Hold
    A(t[244], a[10800]); -- Mythic: Assault on Violet Hold
    t[245] = c:New(k.GetInstanceInfoName(707)); -- Vault of the Wardens
    C(t[238], t[245]);
    A(t[245], a[10679]); -- I Ain't Even Cold
    A(t[245], a[10680]); -- Who's Afraid of the Dark?
    A(t[245], a[10707]); -- "A Specter, Illuminated"
    A(t[245], a[10801]); -- Vault of the Wardens
    A(t[245], a[10802]); -- Heroic: Vault of the Wardens
    A(t[245], a[10803]); -- Mythic: Vault of the Wardens
    t[246] = c:New(k.GetInstanceInfoName(740)); -- Black Rook Hold
    C(t[238], t[246]);
    A(t[246], a[10710]); -- Black Rook Moan
    A(t[246], a[10709]); -- You Used to Scrawl Me In Your Fel Tome
    A(t[246], a[10711]); -- Adds? More Like Bads
    A(t[246], a[10804]); -- Black Rook Hold
    A(t[246], a[10805]); -- Heroic: Black Rook Hold
    A(t[246], a[10806]); -- Mythic: Black Rook Hold
    t[247] = c:New(k.GetInstanceInfoName(727)); -- Maw of Souls
    C(t[238], t[247]);
    A(t[247], a[10413]); -- Instant Karma
    A(t[247], a[10411]); -- Helheim Hath No Fury
    A(t[247], a[10412]); -- Poor Unfortunate Souls
    A(t[247], a[10807]); -- Maw of Souls
    A(t[247], a[10808]); -- Heroic: Maw of Souls
    A(t[247], a[10809]); -- Mythic: Maw of Souls
    t[248] = c:New(k.GetInstanceInfoName(726)); -- The Arcway
    C(t[238], t[248]);
    A(t[248], a[10773]); -- Arcanic Cling
    A(t[248], a[10775]); -- Clean House
    A(t[248], a[10776]); -- No Time to Waste
    A(t[248], a[10813]); -- Mythic: The Arcway
    t[249] = c:New(k.GetInstanceInfoName(800)); -- Court of Stars
    C(t[238], t[249]);
    A(t[249], a[10610]); -- Waiting for Gerdo
    A(t[249], a[10611]); -- Dropping Some Eaves
    A(t[249], a[10816]); -- Mythic: Court of Stars
    A(t[249], a[16658]); -- Keystone Hero: Court of Stars
    t[250] = c:New(k.GetInstanceInfoName(860)); -- Return to Karazhan
    C(t[238], t[250]);
    A(t[250], a[11430]); -- One Night in Karazhan
    A(t[250], a[11335]); -- Season Tickets
    A(t[250], a[11338]); -- Dine and Bash
    A(t[250], a[11432]); -- Scared Straight
    A(t[250], a[11431]); -- The Rat Pack
    A(t[250], a[11433]); -- Burn After Reading
    A(t[250], a[11929]); -- Heroic: Return to Karazhan
    A(t[250], a[11429]); -- Mythic: Return to Karazhan
    A(t[250], a[15692]); -- Keystone Hero: Return to Karazhan
    t[251] = c:New(k.GetInstanceInfoName(900)); -- Cathedral of Eternal Night
    C(t[238], t[251]);
    A(t[251], a[11768]); -- Boom Bloom
    A(t[251], a[11769]); -- A Steamy Romance Saga
    A(t[251], a[11703]); -- Master of Shadows
    A(t[251], a[11700]); -- Cathedral of Eternal Night
    A(t[251], a[11701]); -- Heroic: Cathedral of Eternal Night
    A(t[251], a[11702]); -- Mythic: Cathedral of Eternal Night
    t[252] = c:New(k.GetInstanceInfoName(945)); -- Seat of the Triumvirate
    C(t[238], t[252]);
    A(t[252], a[12004]); -- Welcome the Void
    A(t[252], a[12005]); -- Let it All Out
    A(t[252], a[12009]); -- Darker Side
    A(t[252], a[12007]); -- Heroic: Seat of the Triumvirate
    A(t[252], a[12008]); -- Mythic: Seat of the Triumvirate
    t[239] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[237], t[239]);
    A(t[239], a[11180]); -- Glory of the Legion Raider
    A(t[239], a[11763]); -- Glory of the Tomb Raider
    A(t[239], a[11987]); -- Glory of the Argus Raider
    t[253] = c:New(k.GetInstanceInfoName(768)); -- The Emerald Nightmare
    C(t[239], t[253]);
    A(t[253], a[10818]); -- Darkbough
    A(t[253], a[10819]); -- Tormented Guardians
    A(t[253], a[10820]); -- Rift of Aln
    A(t[253], a[11194]); -- Ahead of the Curve: Xavius
    A(t[253], a[11191]); -- Cutting Edge: Xavius
    t[873] = c:New(k.L["Glory"]); -- Glory
    C(t[253], t[873]);
    A(t[873], a[10555]); -- Buggy Fight
    A(t[873], a[10830]); -- Took the Red Eye Down
    A(t[873], a[10771]); -- Webbing Crashers
    A(t[873], a[10753]); -- Scare Bear
    A(t[873], a[10663]); -- Imagined Dragons World Tour
    A(t[873], a[10772]); -- Use the Force(s)
    A(t[873], a[10755]); -- I Attack the Darkness
    t[874] = c:New(k.L["Mythic"]); -- Mythic
    C(t[253], t[874]);
    A(t[874], a[10821]); -- Mythic: Nythendra
    A(t[874], a[10823]); -- Mythic: Il'gynoth
    A(t[874], a[10822]); -- Mythic: Elerethe Renferal
    A(t[874], a[10824]); -- Mythic: Ursoc
    A(t[874], a[10825]); -- Mythic: Dragons of Nightmare
    A(t[874], a[10826]); -- Mythic: Cenarius
    A(t[874], a[10827]); -- Mythic: Xavius
    t[254] = c:New(k.GetInstanceInfoName(786)); -- The Nighthold
    C(t[239], t[254]);
    A(t[254], a[10829]); -- Arcing Aqueducts
    A(t[254], a[10837]); -- Royal Athenaeum
    A(t[254], a[10838]); -- Nightspire
    A(t[254], a[10839]); -- Betrayer's Rise
    A(t[254], a[11195]); -- Ahead of the Curve: Gul'dan
    A(t[254], a[11192]); -- Cutting Edge: Gul'dan
    A(t[254], a[11628]); -- That's So Last Millennium
    t[875] = c:New(k.L["Glory"]); -- Glory
    C(t[254], t[875]);
    A(t[875], a[10678]); -- Cage Rematch
    A(t[875], a[10697]); -- Grand Opening
    A(t[875], a[10742]); -- Gluten Free
    A(t[875], a[10817]); -- A Change In Scenery
    A(t[875], a[10851]); -- Elementalry!
    A(t[875], a[10754]); -- Fruit of All Evil
    A(t[875], a[10575]); -- Burning Bridges
    A(t[875], a[10704]); -- Not For You
    A(t[875], a[10699]); -- Infinitesimal
    A(t[875], a[10696]); -- I've Got My Eyes On You
    t[876] = c:New(k.L["Mythic"]); -- Mythic
    C(t[254], t[876]);
    A(t[876], a[10840]); -- Mythic: Skorpyron
    A(t[876], a[10842]); -- Mythic: Chronomatic Anomaly
    A(t[876], a[10843]); -- Mythic: Trilliax
    A(t[876], a[10844]); -- Mythic: Spellblade Aluriel
    A(t[876], a[10845]); -- Mythic: Star Augur Etraeus
    A(t[876], a[10846]); -- Mythic: High Botanist Tel'arn
    A(t[876], a[10848]); -- Mythic: Krosus
    A(t[876], a[10847]); -- Mythic: Tichondrius
    A(t[876], a[10849]); -- Mythic: Grand Magistrix Elisande
    A(t[876], a[10850]); -- Mythic: Gul'dan
    t[255] = c:New(k.GetInstanceInfoName(861)); -- Trial of Valor
    C(t[239], t[255]);
    A(t[255], a[11337]); -- You Runed Everything!
    A(t[255], a[11386]); -- Boneafide Tri Tip
    A(t[255], a[11377]); -- Patient Zero
    A(t[255], a[11394]); -- Trial of Valor
    A(t[255], a[11426]); -- Heroic: Trial of Valor
    A(t[255], a[11396]); -- Mythic: Odyn
    A(t[255], a[11397]); -- Mythic: Guarm
    A(t[255], a[11398]); -- Mythic: Helya
    A(t[255], a[11387]); -- The Chosen
    A(t[255], a[11581]); -- Ahead of the Curve: Helya
    A(t[255], a[11580]); -- Cutting Edge: Helya
    A(t[255], a[11762]); -- Can I Get A Helya
    t[256] = c:New(k.GetInstanceInfoName(875)); -- Tomb of Sargeras
    C(t[239], t[256]);
    A(t[256], a[11787]); -- The Gates of Hell
    A(t[256], a[11788]); -- Wailing Halls
    A(t[256], a[11789]); -- Chamber of the Avatar
    A(t[256], a[11790]); -- Deceiver's Fall
    A(t[256], a[11874]); -- Ahead of the Curve: Kil'jaeden
    A(t[256], a[11875]); -- Cutting Edge: Kil'jaeden
    A(t[256], a[11760]); -- Retro Trend
    t[879] = c:New(k.L["Glory"]); -- Glory
    C(t[256], t[879]);
    A(t[879], a[11724]); -- Fel Turkey!
    A(t[879], a[11699]); -- Grand Fin-ale
    A(t[879], a[11676]); -- Five Course Seafood Buffet
    A(t[879], a[11696]); -- Grin and Bear It
    A(t[879], a[11773]); -- "Wax On, Wax Off"
    A(t[879], a[11674]); -- "Great Soul, Great Purpose"
    A(t[879], a[11675]); -- Sky Walker
    A(t[879], a[11683]); -- Bingo!
    A(t[879], a[11770]); -- Dark Souls
    t[880] = c:New(k.L["Mythic"]); -- Mythic
    C(t[256], t[880]);
    A(t[880], a[11767]); -- Mythic: Goroth
    A(t[880], a[11775]); -- Mythic: Harjatan
    A(t[880], a[11776]); -- Mythic: Mistress Sassz'ine
    A(t[880], a[11774]); -- Mythic: Demonic Inquisition
    A(t[880], a[11777]); -- Mythic: Sisters of the Moon
    A(t[880], a[11778]); -- Mythic: The Desolate Host
    A(t[880], a[11779]); -- Mythic: Maiden of Vigilance
    A(t[880], a[11780]); -- Mythic: Fallen Avatar
    A(t[880], a[11781]); -- Mythic: Kil'jaeden
    t[257] = c:New(k.GetInstanceInfoName(946)); -- Antorus, the Burning Throne
    C(t[239], t[257]);
    A(t[257], a[11988]); -- Light's Breach
    A(t[257], a[11990]); -- Hope's End
    A(t[257], a[11989]); -- Forbidden Descent
    A(t[257], a[11991]); -- Seat of the Pantheon
    A(t[257], a[12110]); -- Ahead of the Curve: Argus the Unmaker
    A(t[257], a[12111]); -- Cutting Edge: Argus the Unmaker
    A(t[257], a[12020]); -- Argussy Up
    t[881] = c:New(k.L["Glory"]); -- Glory
    C(t[257], t[881]);
    A(t[881], a[11930]); -- Worm-monger
    A(t[881], a[12065]); -- Hounds Good To Me
    A(t[881], a[12129]); -- This is the War Room!
    A(t[881], a[11928]); -- Portal Combat
    A(t[881], a[12067]); -- Spheres of Influence
    A(t[881], a[11949]); -- Hard to Kill
    A(t[881], a[12030]); -- The World Revolves Around Me
    A(t[881], a[11948]); -- Together We Stand
    A(t[881], a[12046]); -- Remember the Titans
    A(t[881], a[11915]); -- Don't Sweat the Technique
    A(t[881], a[12257]); -- Stardust Crusaders
    t[882] = c:New(k.L["Mythic"]); -- Mythic
    C(t[257], t[882]);
    A(t[882], a[11992]); -- Mythic: Garothi Worldbreaker
    A(t[882], a[11993]); -- Mythic: Hounds of Sargeras
    A(t[882], a[11994]); -- Mythic: Antoran High Command
    A(t[882], a[11995]); -- Mythic: Portal Keeper Hasabel
    A(t[882], a[11996]); -- Mythic: Eonar
    A(t[882], a[11997]); -- Mythic: Imonar the Soulhunter
    A(t[882], a[11998]); -- Mythic: Kin'garoth
    A(t[882], a[11999]); -- Mythic: Varimathras
    A(t[882], a[12000]); -- Mythic: The Coven of Shivarra
    A(t[882], a[12001]); -- Mythic: Aggramar
    A(t[882], a[12002]); -- Mythic: Argus the Unmaker
    t[430] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[237], t[430]);
    A(t[430], a[11233]); -- Broken Isles Safari
    A(t[430], a[10876]); -- Battle on the Broken Isles
    A(t[430], a[9686]); -- Aquatic Acquiescence
    A(t[430], a[9687]); -- Best of the Beasts
    A(t[430], a[9688]); -- Mousing Around
    A(t[430], a[9689]); -- Dragons!
    A(t[430], a[9690]); -- "Ragnaros, Watch and Learn"
    A(t[430], a[9691]); -- Flock Together
    A(t[430], a[9692]); -- "Murlocs, Harpies, and Wolvar, Oh My!"
    A(t[430], a[9693]); -- Master of Magic
    A(t[430], a[9694]); -- Roboteer
    A(t[430], a[9695]); -- The Lil' Necromancer
    A(t[430], a[9696]); -- Family Familiar
    A(t[430], a[12088]); -- Anomalous Animals of Argus
    A(t[430], a[12089]); -- Aquatic Assault
    A(t[430], a[12091]); -- Beast Blitz
    A(t[430], a[12092]); -- Critical Critters
    A(t[430], a[12093]); -- Draconic Destruction
    A(t[430], a[12094]); -- Elemental Escalation
    A(t[430], a[12095]); -- Fierce Fliers
    A(t[430], a[12096]); -- Humanoid Havoc
    A(t[430], a[12097]); -- Magical Mayhem
    A(t[430], a[12098]); -- Mechanical Melee
    A(t[430], a[12099]); -- Unstoppable Undead
    A(t[430], a[12100]); -- Family Fighter
    t[792] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Brawler's Guild
    C(t[237], t[792]);
    A(t[792], a[11560]); -- You Are Not Your $#*@! Legplates (Season 3)
    A(t[792], a[11561]); -- You Are Not Your $#*@! Legplates (Season 3)
    A(t[792], a[11563]); -- The Second Rule of Brawler's Guild (Season 3)
    A(t[792], a[11564]); -- The Second Rule of Brawler's Guild (Season 3)
    A(t[792], a[11565]); -- King of the Guild (Season 3)
    A(t[792], a[11566]); -- King of the Guild (Season 3)
    A(t[792], a[11572]); -- I Am Thrall's Complete Lack Of Surprise (Season 3)
    t[429] = c:New(k.L["Class Hall"]); -- Class Hall
    C(t[237], t[429]);
    A(t[429], a[10994]); -- A Glorious Campaign
    A(t[429], a[11135]); -- A Heroic Campaign
    A(t[429], a[11136]); -- An Epic Campaign
    A(t[429], a[10706]); -- Training the Troops
    A(t[429], a[11212]); -- Raise an Army
    A(t[429], a[11213]); -- Lead a Legion
    A(t[429], a[11214]); -- Many Missions
    A(t[429], a[11215]); -- Quite a Few Missions
    A(t[429], a[11216]); -- So Many Missions
    A(t[429], a[11217]); -- "Many Many Missions, Handle It!"
    A(t[429], a[11219]); -- Need Backup
    A(t[429], a[11220]); -- Roster of Champions
    A(t[429], a[11221]); -- Champions Rise
    A(t[429], a[11222]); -- Champions of Power
    A(t[429], a[11223]); -- Legendary Research
    A(t[429], a[11298]); -- A Classy Outfit
    A(t[429], a[10746]); -- Forged for Battle
    A(t[429], a[10459]); -- Improving on History
    A(t[429], a[10743]); -- The Prestige
    A(t[429], a[10745]); -- The Prestige
    A(t[429], a[10460]); -- Hidden Potential
    A(t[429], a[10461]); -- Fighting with Style: Classic
    A(t[429], a[10747]); -- Fighting with Style: Upgraded
    A(t[429], a[10748]); -- Fighting with Style: Valorous
    A(t[429], a[11173]); -- Fighting with Style: War-torn
    A(t[429], a[10749]); -- Fighting with Style: War-torn
    A(t[429], a[10750]); -- Fighting with Style: Hidden
    A(t[429], a[11171]); -- Arsenal of Power
    A(t[429], a[11137]); -- A Legendary Campaign
    A(t[429], a[11611]); -- A Challenging Look
    A(t[429], a[11612]); -- Fighting with Style: Challenging
    A(t[429], a[11144]); -- Power Realized
    A(t[429], a[11772]); -- Power Ascended
    A(t[429], a[11609]); -- Power Unbound
    A(t[429], a[11610]); -- Power Unleashed
    A(t[429], a[10852]); -- Artifact or Artifiction
    A(t[429], a[10853]); -- Part of History
    A(t[429], a[12071]); -- Crucible's Promise
    A(t[429], a[12072]); -- Now You're Cooking with Netherlight
    A(t[429], a[11218]); -- There's a Boss In There
    t[258] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[883], t[258]);
    t[259] = c:New(k.L["Zones"]); -- Zones
    C(t[258], t[259]);
    A(t[259], a[46]); -- Universal Explorer
    t[271] = c:New(k.GetMapName(876) .. " & " .. k.GetMapName(875)); -- Kul Tiras & Zandalar
    C(t[259], t[271]);
    A(t[271], a[14183]); -- Conspicuous Consumption
    A(t[271], a[12587]); -- Unbound Monstrosities
    t[272] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[271], t[272]);
    A(t[272], a[12582]); -- Come Sail Away
    A(t[272], a[12555]); -- Welcome to Zandalar
    A(t[272], a[12997]); -- The Pride of Kul Tiras
    A(t[272], a[12593]); -- Loremaster of Kul Tiras
    A(t[272], a[13294]); -- Loremaster of Zandalar
    A(t[272], a[12891]); -- A Nation United
    A(t[272], a[12479]); -- Zandalar Forever!
    A(t[272], a[13512]); -- Master Calligrapher
    A(t[272], a[13384]); -- Kul Tirans Don't Look at Explosions
    A(t[272], a[12510]); -- Ready for War
    A(t[272], a[12509]); -- Ready for War
    A(t[272], a[13467]); -- Tides of Vengeance
    A(t[272], a[13466]); -- Tides of Vengeance
    A(t[272], a[13925]); -- The Fourth War
    A(t[272], a[13924]); -- The Fourth War
    A(t[272], a[13517]); -- Two Sides to Every Tale
    A(t[272], a[13251]); -- In Teldrassil's Shadow
    A(t[272], a[13144]); -- Wide World of Quests
    A(t[272], a[13263]); -- The Shadow Hunter
    A(t[272], a[14157]); -- The Corruptor's End
    A(t[272], a[7520]); -- The Loremaster
    t[273] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[271], t[273]);
    A(t[273], a[12989]); -- "Battle for Azeroth Pathfinder, Part One"
    A(t[273], a[13250]); -- "Battle for Azeroth Pathfinder, Part Two"
    A(t[273], a[13061]); -- Three Sheets to the Wind
    A(t[273], a[12482]); -- Get Hek'd
    A(t[273], a[13036]); -- A Loa of a Tale
    A(t[273], a[13029]); -- Eating Out of the Palm of My Tiny Hand
    A(t[273], a[13027]); -- Mushroom Harvest
    A(t[273], a[14730]); -- To All the Squirrels I Set Sail to See
    A(t[273], a[12988]); -- Battle for Azeroth Explorer
    t[274] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[271], t[274]);
    A(t[274], a[13429]); -- Azerfighter
    A(t[274], a[12572]); -- War Supplied
    A(t[274], a[12571]); -- Bounty Hunting
    A(t[274], a[12573]); -- Band of Brothers
    A(t[274], a[12605]); -- Conqueror of Azeroth
    A(t[274], a[12604]); -- Conqueror of Azeroth
    t[275] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[271], t[275]);
    A(t[275], a[12947]); -- Azerothian Diplomat
    A(t[275], a[12955]); -- Champions of Azeroth
    A(t[275], a[12956]); -- Tortollan Seekers
    t[276] = c:New(k.GetMapName(895)); -- Tiragarde Sound
    C(t[259], t[276]);
    t[281] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[276], t[281]);
    A(t[281], a[12473]); -- A Sound Plan
    A(t[281], a[13060]); -- Kul Runnings
    A(t[281], a[13059]); -- Drag Race
    A(t[281], a[13050]); -- Bless the Rains Down in Freehold
    A(t[281], a[13049]); -- The Long Con
    A(t[281], a[12087]); -- The Reining Champion
    A(t[281], a[13285]); -- Upright Citizens
    t[278] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[276], t[278]);
    A(t[278], a[12556]); -- Explore Tiragarde Sound
    A(t[278], a[12939]); -- Adventurer of Tiragarde Sound
    A(t[278], a[12852]); -- Treasures of Tiragarde Sound
    A(t[278], a[13057]); -- Shanty Raid
    A(t[278], a[13058]); -- Kul Tiran Up the Dance Floor
    t[279] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[276], t[279]);
    A(t[279], a[12577]); -- Tour of Duty: Tiragarde Sound
    t[280] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[276], t[280]);
    A(t[280], a[12951]); -- Proudmoore Admiralty
    A(t[280], a[12954]); -- Champion of the 7th Legion
    t[282] = c:New(k.GetMapName(896)); -- Drustvar
    C(t[259], t[282]);
    t[283] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[282], t[283]);
    A(t[283], a[12497]); -- Drust Do It.
    t[284] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[282], t[284]);
    A(t[284], a[12557]); -- Explore Drustvar
    A(t[284], a[12941]); -- Adventurer of Drustvar
    A(t[284], a[12995]); -- Treasures of Drustvar
    A(t[284], a[13087]); -- Sausage Sampler
    A(t[284], a[13083]); -- "Better, Faster, Stronger"
    A(t[284], a[13082]); -- Everything Old Is New Again
    A(t[284], a[13064]); -- "Drust the Facts, Ma'am"
    A(t[284], a[13094]); -- Cursed Game Hunter
    t[285] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[282], t[285]);
    A(t[285], a[12579]); -- Tour of Duty: Drustvar
    t[286] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[282], t[286]);
    A(t[286], a[12952]); -- Order of Embers
    t[287] = c:New(k.GetMapName(942)); -- Stormsong Valley
    C(t[259], t[287]);
    t[288] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[287], t[288]);
    A(t[288], a[12496]); -- Stormsong and Dance
    A(t[288], a[13054]); -- Sabertron Assemble
    A(t[288], a[13053]); -- Deadliest Cache
    A(t[288], a[13047]); -- Clever Use of Mechanical Explosives
    A(t[288], a[13046]); -- These Hills Sing
    A(t[288], a[13045]); -- Every Day I'm Truffling
    A(t[288], a[13042]); -- About To Break
    A(t[288], a[13062]); -- Let's Bee Friends
    t[289] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[287], t[289]);
    A(t[289], a[12558]); -- Explore Stormsong Valley
    A(t[289], a[12940]); -- Adventurer of Stormsong Valley
    A(t[289], a[12853]); -- Treasures of Stormsong Valley
    A(t[289], a[13051]); -- Legends of the Tidesages
    t[290] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[287], t[290]);
    A(t[290], a[12578]); -- Tour of Duty: Stormsong Valley
    t[291] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[287], t[291]);
    A(t[291], a[12953]); -- Storm's Wake
    t[292] = c:New(k.GetMapName(862)); -- Zuldazar
    C(t[259], t[292]);
    t[293] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[292], t[293]);
    A(t[293], a[11861]); -- The Throne of Zuldazar
    A(t[293], a[12480]); -- A Bargain of Blood
    A(t[293], a[12481]); -- The Final Seal
    A(t[293], a[13441]); -- Pushing the Payload
    A(t[293], a[13039]); -- Paku'ai
    A(t[293], a[13048]); -- Life Finds a Way... To Die!
    A(t[293], a[13038]); -- Raptari Rider
    A(t[293], a[12719]); -- Spirits Be With You
    A(t[293], a[13020]); -- Bow to Your Masters
    A(t[293], a[12614]); -- Loa Expectations
    A(t[293], a[13030]); -- How to Ptrain Your Pterrordax
    A(t[293], a[13573]); -- How to Ptrain Your Pterrordax
    A(t[293], a[13542]); -- How to Train Your Direhorn
    A(t[293], a[13035]); -- By de Power of de Loa!
    A(t[293], a[13440]); -- Pushing the Payload
    t[294] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[292], t[294]);
    A(t[294], a[12559]); -- Explore Zuldazar
    A(t[294], a[12944]); -- Adventurer of Zuldazar
    A(t[294], a[12851]); -- Treasures of Zuldazar
    t[295] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[292], t[295]);
    A(t[295], a[12575]); -- Tour of Duty: Zuldazar
    A(t[295], a[13439]); -- Boxing Match
    A(t[295], a[13438]); -- Boxing Match
    t[296] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[292], t[296]);
    A(t[296], a[12950]); -- Zandalari Empire
    A(t[296], a[12957]); -- Champion of the Honorbound
    t[297] = c:New(k.GetMapName(863)); -- Nazmir
    C(t[259], t[297]);
    t[298] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[297], t[298]);
    A(t[298], a[13026]); -- 7th Legion Spycatcher
    A(t[298], a[13025]); -- Zandalari Spycatcher
    A(t[298], a[11868]); -- The Dark Heart of Nazmir
    A(t[298], a[13048]); -- Life Finds a Way... To Die!
    A(t[298], a[13023]); -- It's Really Getting Out of Hand
    A(t[298], a[13022]); -- Revenge is Best Served Speedily
    A(t[298], a[13021]); -- A Most Efficient Apocalypse
    A(t[298], a[13426]); -- Come On and Slam
    t[299] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[297], t[299]);
    A(t[299], a[12561]); -- Explore Nazmir
    A(t[299], a[12942]); -- Adventurer of Nazmir
    A(t[299], a[12771]); -- Treasures of Nazmir
    A(t[299], a[12588]); -- Eat Your Greens
    A(t[299], a[13024]); -- "Carved in Stone, Written in Blood"
    A(t[299], a[13028]); -- Hoppin' Sad
    t[300] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[297], t[300]);
    A(t[300], a[12574]); -- Tour of Duty: Nazmir
    t[301] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[297], t[301]);
    A(t[301], a[12948]); -- Talanji's Expedition
    t[302] = c:New(k.GetMapName(864)); -- Vol'dun
    C(t[259], t[302]);
    t[303] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[302], t[303]);
    A(t[303], a[12478]); -- Secrets in the Sands
    A(t[303], a[13009]); -- Adept Sandfisher
    A(t[303], a[13011]); -- Scourge of Zem'lan
    A(t[303], a[13014]); -- Vorrik's Champion
    A(t[303], a[13041]); -- "Hungry, Hungry Ranishu"
    A(t[303], a[13017]); -- Champion of the Vulpera
    A(t[303], a[13437]); -- Scavenge like a Vulpera
    t[304] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[302], t[304]);
    A(t[304], a[12560]); -- Explore Vol'dun
    A(t[304], a[12943]); -- Adventurer of Vol'dun
    A(t[304], a[12849]); -- Treasures of Vol'dun
    A(t[304], a[13016]); -- Scavenger of the Sands
    A(t[304], a[13018]); -- Dune Rider
    t[305] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[302], t[305]);
    A(t[305], a[12576]); -- Tour of Duty: Vol'dun
    t[306] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[302], t[306]);
    A(t[306], a[12949]); -- The Voldunai
    t[307] = c:New(k.GetMapName(1462)); -- Mechagon Island
    C(t[259], t[307]);
    A(t[307], a[13708]); -- Most Minis Wins
    t[308] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[307], t[308]);
    A(t[308], a[13553]); -- The Mechagonian Threat
    A(t[308], a[13700]); -- The Mechagonian Threat
    A(t[308], a[13790]); -- Armed for Action
    A(t[308], a[13791]); -- Making the Mount
    t[309] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[307], t[309]);
    A(t[309], a[13776]); -- Explore Mechagon
    A(t[309], a[13470]); -- Rest In Pistons
    A(t[309], a[13472]); -- Deep Pockets
    A(t[309], a[13482]); -- Head Financier of Mechagon
    A(t[309], a[13473]); -- Diversified Investments
    A(t[309], a[13474]); -- Junkyard Machinist
    A(t[309], a[13696]); -- Scrappy's Best Friend
    A(t[309], a[13686]); -- Junkyard Melomaniac
    A(t[309], a[13475]); -- Junkyard Scavenger
    A(t[309], a[13477]); -- Junkyard Apprentice
    A(t[309], a[13476]); -- Junkyard Tinkerer
    A(t[309], a[13555]); -- Junkyard Tinkmaster
    A(t[309], a[13478]); -- Junkyard Collector
    A(t[309], a[13479]); -- Junkyard Architect
    A(t[309], a[13556]); -- Outside Influences
    A(t[309], a[13513]); -- Available in Eight Colors
    A(t[309], a[13541]); -- Mecha-Done
    t[310] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[307], t[310]);
    A(t[310], a[13570]); -- Tour of Duty: Mechagon
    t[311] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[307], t[311]);
    A(t[311], a[13557]); -- Rustbolt Rebellion
    t[312] = c:New(k.GetMapName(1355)); -- Nazjatar
    C(t[259], t[312]);
    t[313] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[312], t[313]);
    A(t[313], a[13710]); -- Sunken Ambitions
    A(t[313], a[13709]); -- Unfathomable
    t[314] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[312], t[314]);
    A(t[314], a[13712]); -- Explore Nazjatar
    A(t[314], a[13635]); -- Tour of the Depths
    A(t[314], a[13690]); -- Nazjatarget Eliminated
    A(t[314], a[13691]); -- I Thought You Said They'd Be Rare?
    A(t[314], a[13692]); -- Give Me the Biggest Bag You've Got
    A(t[314], a[13743]); -- Seasoned: Hunter Akana
    A(t[314], a[13746]); -- Seasoned: Neri Sharpfin
    A(t[314], a[13753]); -- Veteran: Hunter Akana
    A(t[314], a[13749]); -- Veteran: Neri Sharpfin
    A(t[314], a[13758]); -- Battle-Scarred: Hunter Akana
    A(t[314], a[13750]); -- Battle-Scarred: Neri Sharpfin
    A(t[314], a[13744]); -- Seasoned: Bladesman Inowari
    A(t[314], a[13747]); -- Seasoned: Poen Gillbrack
    A(t[314], a[13754]); -- Veteran: Bladesman Inowari
    A(t[314], a[13751]); -- Veteran: Poen Gillbrack
    A(t[314], a[13759]); -- Battle-Scarred: Bladesman Inowari
    A(t[314], a[13756]); -- Battle-Scarred: Poen Gillbrack
    A(t[314], a[13745]); -- Seasoned: Farseer Ori
    A(t[314], a[13748]); -- Seasoned: Vim Brineheart
    A(t[314], a[13755]); -- Veteran: Farseer Ori
    A(t[314], a[13752]); -- Veteran: Vim Brineheart
    A(t[314], a[13760]); -- Battle-Scarred: Farseer Ori
    A(t[314], a[13757]); -- Battle-Scarred: Vim Brineheart
    A(t[314], a[13704]); -- Nautical Battlefield Training
    A(t[314], a[13645]); -- Nautical Battlefield Training
    A(t[314], a[13762]); -- Aqua Team Murder Force
    A(t[314], a[13761]); -- Aqua Team Murder Force
    A(t[314], a[13711]); -- A Fistful of Manapearls
    A(t[314], a[13765]); -- Subaquatic Support
    A(t[314], a[13549]); -- Trove Tracker
    A(t[314], a[13722]); -- Terror of the Tadpoles
    A(t[314], a[13699]); -- Periodic Destruction
    A(t[314], a[13713]); -- Nothing To Scry About
    A(t[314], a[13707]); -- Mrrl's Secret Stash
    A(t[314], a[13763]); -- Back to the Depths!
    A(t[314], a[13764]); -- Puzzle Performer
    A(t[314], a[13836]); -- Feline Figurines Found
    A(t[314], a[13638]); -- Undersea Usurper
    t[315] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[312], t[315]);
    A(t[315], a[13569]); -- Tour of Duty: Nazjatar
    A(t[315], a[13568]); -- For Nazjatar!
    A(t[315], a[13720]); -- Supplying the Assassins
    t[316] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[312], t[316]);
    A(t[316], a[13558]); -- Waveblade Ankoan
    A(t[316], a[13559]); -- The Unshackled
    t[317] = c:New(k.GetMapName(1530)); -- Vale of Eternal Blossoms
    C(t[259], t[317]);
    t[318] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[317], t[318]);
    A(t[318], a[14154]); -- Defend the Vale
    A(t[318], a[14161]); -- All Consuming
    t[447] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[317], t[447]);
    A(t[447], a[14160]); -- Rare to Well Done
    A(t[447], a[14159]); -- Combating the Corruption
    A(t[447], a[14158]); -- It's Not A Tumor!
    t[321] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[317], t[321]);
    A(t[321], a[14156]); -- The Rajani
    t[322] = c:New(k.GetMapName(1527)); -- Uldum
    C(t[259], t[322]);
    t[323] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[322], t[323]);
    A(t[323], a[14153]); -- Uldum Under Assault
    A(t[323], a[14161]); -- All Consuming
    t[448] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[322], t[448]);
    A(t[448], a[14160]); -- Rare to Well Done
    A(t[448], a[14159]); -- Combating the Corruption
    A(t[448], a[14158]); -- It's Not A Tumor!
    t[324] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[322], t[324]);
    A(t[324], a[14155]); -- Uldum Accord
    t[325] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[258], t[325]);
    A(t[325], a[12807]); -- Battle for Azeroth Dungeon Hero
    A(t[325], a[12812]); -- Glory of the Wartorn Hero
    A(t[325], a[13075]); -- Battle for Azeroth Keymaster
    A(t[325], a[13079]); -- Battle for Azeroth Keystone Conqueror: Season One
    A(t[325], a[13080]); -- Battle for Azeroth Keystone Master: Season One
    A(t[325], a[13448]); -- Battle for Azeroth Keystone Conqueror: Season Two
    A(t[325], a[13449]); -- Battle for Azeroth Keystone Master: Season Two
    A(t[325], a[13780]); -- Battle for Azeroth Keystone Conqueror: Season Three
    A(t[325], a[13781]); -- Battle for Azeroth Keystone Master: Season Three
    A(t[325], a[14144]); -- Battle for Azeroth Keystone Conqueror: Season Four
    A(t[325], a[14145]); -- Battle for Azeroth Keystone Master: Season Four
    t[327] = c:New(k.GetInstanceInfoName(1001)); -- Freelhold
    C(t[325], t[327]);
    A(t[327], a[12550]); -- Pecking Order
    A(t[327], a[12548]); -- I'm in Charge Now!
    A(t[327], a[12998]); -- That Sweete Booty
    A(t[327], a[12831]); -- Freehold
    A(t[327], a[12832]); -- Heroic: Freehold
    A(t[327], a[12833]); -- Mythic: Freehold
    t[328] = c:New(k.GetInstanceInfoName(1021)); -- Waycrest Manor
    C(t[325], t[328]);
    A(t[328], a[12495]); -- Run Wild Like a Man On Fire
    A(t[328], a[12490]); -- Alchemical Romance
    A(t[328], a[12489]); -- Losing My Profession
    A(t[328], a[12483]); -- Waycrest Manor
    A(t[328], a[12484]); -- Heroic: Waycrest Manor
    A(t[328], a[12488]); -- Mythic: Waycrest Manor
    t[329] = c:New(k.GetInstanceInfoName(1036)); -- Shrine of the Storm
    C(t[325], t[329]);
    A(t[329], a[12600]); -- Breath of the Shrine
    A(t[329], a[12601]); -- The Void Lies Sleeping
    A(t[329], a[12602]); -- Trust No One
    A(t[329], a[12835]); -- Shrine of the Storm
    A(t[329], a[12837]); -- Heroic: Shrine of the Storm
    A(t[329], a[12838]); -- Mythic: Shrine of the Storm
    t[330] = c:New(k.GetInstanceInfoName(968)); -- Atal'Dazar
    C(t[325], t[330]);
    A(t[330], a[12270]); -- Bringing Hexy Back
    A(t[330], a[12272]); -- Gold Fever
    A(t[330], a[12273]); -- It's Lit!
    A(t[330], a[12824]); -- Atal'Dazar
    A(t[330], a[12825]); -- Heroic: Atal'Dazar
    A(t[330], a[12826]); -- Mythic: Atal'Dazar
    t[331] = c:New(k.GetInstanceInfoName(1022)); -- The Underrot
    C(t[325], t[331]);
    A(t[331], a[12498]); -- Taint Nobody Got Time For That
    A(t[331], a[12549]); -- Not a Fun Guy
    A(t[331], a[12499]); -- Sporely Alive
    A(t[331], a[12500]); -- Underrot
    A(t[331], a[12501]); -- Heroic: Underrot
    A(t[331], a[12502]); -- Mythic: Underrot
    t[332] = c:New(k.GetInstanceInfoName(1030)); -- Temple of Sethraliss
    C(t[325], t[332]);
    A(t[332], a[12507]); -- Snake Eater
    A(t[332], a[12503]); -- Snake Eyes
    A(t[332], a[12508]); -- "Good Night, Sweet Prince"
    A(t[332], a[12504]); -- The Temple of Sethraliss
    A(t[332], a[12505]); -- Heroic: The Temple of Sethraliss
    A(t[332], a[12506]); -- Mythic: The Temple of Sethraliss
    t[333] = c:New(k.GetInstanceInfoName(1002)); -- Tol Dagor
    C(t[325], t[333]);
    A(t[333], a[12457]); -- Remix to Ignition
    A(t[333], a[12462]); -- Shot Through the Heart
    A(t[333], a[12840]); -- Tol Dagor
    A(t[333], a[12841]); -- Heroic: Tol Dagor
    A(t[333], a[12842]); -- Mythic: Tol Dagor
    t[334] = c:New(k.GetInstanceInfoName(1012)); -- The MOTHERLODE!!
    C(t[325], t[334]);
    A(t[334], a[12855]); -- Pitch Invasion
    A(t[334], a[12854]); -- Ready for Raiding VI
    A(t[334], a[12844]); -- The MOTHERLODE!!
    A(t[334], a[12845]); -- Heroic: The MOTHERLODE!!
    A(t[334], a[12846]); -- Mythic: The MOTHERLODE!!
    t[335] = c:New(k.GetInstanceInfoName(1023)); -- Siege of Boralus
    C(t[325], t[335]);
    A(t[335], a[12727]); -- Stand by Me
    A(t[335], a[12726]); -- A Fish Out of Water
    A(t[335], a[12489]); -- Losing My Profession
    A(t[335], a[12847]); -- Siege of Boralus
    t[336] = c:New(k.GetInstanceInfoName(1041)); -- Kings' Rest
    C(t[325], t[336]);
    A(t[336], a[12722]); -- It Belongs in a Mausoleum!
    A(t[336], a[12721]); -- Wrap God
    A(t[336], a[12723]); -- How to Keep a Mummy
    A(t[336], a[12848]); -- Kings' Rest
    t[337] = c:New(k.GetInstanceInfoName(1178)); -- Operation: Mechagon
    C(t[325], t[337]);
    A(t[337], a[13706]); -- Stay Positive
    A(t[337], a[13698]); -- Clean Up On Aisle Mechagon
    A(t[337], a[13723]); -- "M.C., Hammered"
    A(t[337], a[13545]); -- "Go Ahead, Make My Daisy"
    A(t[337], a[13624]); -- Keep DPS-ing and Nobody Explodes
    A(t[337], a[13789]); -- Hertz Locker
    A(t[337], a[15693]); -- Keystone Hero: Operation: Mechagon
    t[326] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[258], t[326]);
    A(t[326], a[12806]); -- Glory of the Uldir Raider
    A(t[326], a[13315]); -- Glory of the Dazar'alor Raider
    A(t[326], a[13687]); -- Glory of the Eternal Raider
    A(t[326], a[14146]); -- Glory of the Ny'alotha Raider
    t[338] = c:New(k.GetInstanceInfoName(1031)); -- Uldir
    C(t[326], t[338]);
    A(t[338], a[12521]); -- Halls of Containment
    A(t[338], a[12522]); -- Crimson Descent
    A(t[338], a[12523]); -- Heart of Corruption
    A(t[338], a[12536]); -- Ahead of the Curve: G'huun
    A(t[338], a[12535]); -- Cutting Edge: G'huun
    A(t[338], a[12991]); -- "New Mog, G'huun This?"
    t[862] = c:New(k.L["Glory"]); -- Glory
    C(t[338], t[862]);
    A(t[862], a[12937]); -- Elevator Music
    A(t[862], a[12938]); -- Parental Controls
    A(t[862], a[12828]); -- What's in the Box?
    A(t[862], a[12823]); -- Thrash Mouth - All Stars
    A(t[862], a[12772]); -- Now We Got Bad Blood
    A(t[862], a[12830]); -- Edgelords
    A(t[862], a[12836]); -- Existential Crisis
    A(t[862], a[12551]); -- Double Dribble
    t[864] = c:New(k.L["Mythic"]); -- Mythic
    C(t[338], t[864]);
    A(t[864], a[12524]); -- Mythic: Taloc
    A(t[864], a[12526]); -- Mythic: MOTHER
    A(t[864], a[12527]); -- Mythic: Zek'voz
    A(t[864], a[12530]); -- Mythic: Fetid Devourer
    A(t[864], a[12529]); -- Mythic: Vectis
    A(t[864], a[12531]); -- Mythic: Zul
    A(t[864], a[12532]); -- Mythic: Mythrax the Unraveler
    A(t[864], a[12533]); -- Mythic: G'huun
    t[339] = c:New(k.GetInstanceInfoName(1176)); -- Battle of Dazar'alor
    C(t[326], t[339]);
    A(t[339], a[13286]); -- Siege of Dazar'alor
    A(t[339], a[13289]); -- Defense of Dazar'alor
    A(t[339], a[13287]); -- Empire's Fall
    A(t[339], a[13290]); -- Death's Bargain
    A(t[339], a[13288]); -- Might of the Alliance
    A(t[339], a[13291]); -- Victory or Death
    A(t[339], a[13322]); -- Ahead of the Curve: Lady Jaina Proudmoore
    A(t[339], a[13323]); -- Cutting Edge: Lady Jaina Proudmoore
    A(t[339], a[13385]); -- Daz'aling Attire
    t[865] = c:New(k.L["Glory"]); -- Glory
    C(t[339], t[865]);
    A(t[865], a[13316]); -- Can I Get a Hek Hek Hek Yeah?
    A(t[865], a[13431]); -- Hidden Dragon
    A(t[865], a[13383]); -- Barrel of Monkeys
    A(t[865], a[13345]); -- Praise the Sunflower
    A(t[865], a[13325]); -- Walk the Dinosaur
    A(t[865], a[13425]); -- "We Got Spirit, How About You?"
    A(t[865], a[13401]); -- I Got Next!
    A(t[865], a[13430]); -- De Lurker Be'loa
    A(t[865], a[13410]); -- Snow Fun Allowed
    t[866] = c:New(k.L["Mythic"]); -- Mythic
    C(t[339], t[866]);
    A(t[866], a[13292]); -- Mythic: Champion of the Light
    A(t[866], a[13298]); -- Mythic: Jadefire Masters
    A(t[866], a[13293]); -- Mythic: Grong
    A(t[866], a[13295]); -- Mythic: Jadefire Masters
    A(t[866], a[13299]); -- Mythic: Opulence
    A(t[866], a[13300]); -- Mythic: Conclave of the Chosen
    A(t[866], a[13311]); -- Mythic: King Rastakhan
    A(t[866], a[13312]); -- Mythic: Mekkatorque
    A(t[866], a[13313]); -- Mythic: Stormwall Blockade
    A(t[866], a[13314]); -- Mythic: Lady Jaina Proudmoore
    t[340] = c:New(k.GetInstanceInfoName(1177)); -- Crucible of Storms
    C(t[326], t[340]);
    A(t[340], a[13501]); -- Gotta Bounce
    A(t[340], a[13506]); -- A Good Eye-dea
    A(t[340], a[13414]); -- Crucible of Storms
    A(t[340], a[13416]); -- Mythic: The Restless Cabal
    A(t[340], a[13417]); -- "Mythic: Uu'nat, Harbinger of the Void"
    A(t[340], a[13418]); -- "Ahead of the Curve: Uu'nat, Harbinger of the Void"
    A(t[340], a[13419]); -- "Cutting Edge: Uu'nat, Harbinger of the Void"
    t[341] = c:New(k.GetInstanceInfoName(1179)); -- The Eternal Palace
    C(t[326], t[341]);
    A(t[341], a[13718]); -- The Grand Reception
    A(t[341], a[13719]); -- Depths of the Devoted
    A(t[341], a[13725]); -- The Circle of Stars
    A(t[341], a[13784]); -- Ahead of the Curve: Queen Azshara
    A(t[341], a[13785]); -- Cutting Edge: Queen Azshara
    A(t[341], a[13571]); -- Under the Seams
    t[869] = c:New(k.L["Glory"]); -- Glory
    C(t[341], t[869]);
    A(t[869], a[13684]); -- You and What Army?
    A(t[869], a[13628]); -- Intro to Marine Biology
    A(t[869], a[13767]); -- Fun Run
    A(t[869], a[13629]); -- Simple Geometry
    A(t[869], a[13724]); -- A Smack of Jellyfish
    A(t[869], a[13633]); -- If It Pleases the Court
    A(t[869], a[13716]); -- Lactose Intolerant
    A(t[869], a[13768]); -- The Best of Us
    t[870] = c:New(k.L["Mythic"]); -- Mythic
    C(t[341], t[870]);
    A(t[870], a[13726]); -- Mythic: Abyssal Commander Sivara
    A(t[870], a[13728]); -- Mythic: Blackwater Behemoth
    A(t[870], a[13727]); -- Mythic: Radiance of Azshara
    A(t[870], a[13729]); -- Mythic: Lady Ashvane
    A(t[870], a[13730]); -- Mythic: Orgozoa
    A(t[870], a[13731]); -- Mythic: The Queen's Court
    A(t[870], a[13732]); -- Mythic: Za'qul
    A(t[870], a[13733]); -- Mythic: Queen Azshara
    t[342] = c:New(k.GetInstanceInfoName(1180)); -- Ny'alotha, the Waking City
    C(t[326], t[342]);
    A(t[342], a[14193]); -- Vision of Destiny
    A(t[342], a[14194]); -- Halls of Devotion
    A(t[342], a[14195]); -- Gift of Flesh
    A(t[342], a[14196]); -- The Waking Dream
    A(t[342], a[14068]); -- Ahead of the Curve: N'Zoth the Corruptor
    A(t[342], a[14069]); -- Cutting Edge: N'Zoth the Corruptor
    A(t[342], a[14058]); -- All Eyes On Me
    t[871] = c:New(k.L["Glory"]); -- Glory
    C(t[342], t[871]);
    A(t[871], a[14019]); -- Smoke Test
    A(t[871], a[14008]); -- Mana Sponge
    A(t[871], a[14037]); -- Phase 3: Prophet
    A(t[871], a[14024]); -- Buzzer Beater
    A(t[871], a[14139]); -- Total Annihilation
    A(t[871], a[14023]); -- Realizing Your Potential
    A(t[871], a[13999]); -- How? Isn't it Obelisk?
    A(t[871], a[13990]); -- "You Can Pet the Dog, But..."
    A(t[871], a[14026]); -- Temper Tantrum
    A(t[871], a[14038]); -- Bloody Mess
    A(t[871], a[14147]); -- Cleansing Treatment
    A(t[871], a[14148]); -- It's Not A Cult
    t[872] = c:New(k.L["Mythic"]); -- Mythic
    C(t[342], t[872]);
    A(t[872], a[14041]); -- "Mythic: Wrathion, the Black Emperor"
    A(t[872], a[14043]); -- Mythic: Maut
    A(t[872], a[14044]); -- Mythic: The Prophet Skitra
    A(t[872], a[14045]); -- Mythic: Dark Inquisitor Xanesh
    A(t[872], a[14050]); -- Mythic: Vexiona
    A(t[872], a[14046]); -- Mythic: The Hivemind
    A(t[872], a[14051]); -- Mythic: Ra-den the Despoiled
    A(t[872], a[14048]); -- Mythic: Shad'har the Insatiable
    A(t[872], a[14049]); -- Mythic: Drest'agath
    A(t[872], a[14052]); -- "Mythic: Il'gynoth, Corruption Reborn"
    A(t[872], a[14054]); -- Mythic: Carapace of N'Zoth
    A(t[872], a[14055]); -- Mythic: N'Zoth the Corruptor
    t[343] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[258], t[343]);
    A(t[343], a[12930]); -- Battle Safari
    A(t[343], a[13693]); -- Mecha-Safari
    A(t[343], a[13694]); -- Nazjatari Safari
    A(t[343], a[13715]); -- From The Belly Of The Jelly
    A(t[343], a[12936]); -- Battle on Zandalar and Kul Tiras
    A(t[343], a[13280]); -- Hobbyist Aquarist
    A(t[343], a[13270]); -- Beast Mode
    A(t[343], a[13271]); -- Critters With Huge Teeth
    A(t[343], a[13272]); -- Dragons Make Everything Better
    A(t[343], a[13273]); -- Element of Success
    A(t[343], a[13274]); -- Fun With Flying
    A(t[343], a[13281]); -- Human Resources
    A(t[343], a[13275]); -- Magician's Secrets
    A(t[343], a[13277]); -- Machine Learning
    A(t[343], a[13278]); -- Not Quite Dead Yet
    A(t[343], a[13279]); -- Family Battler
    A(t[343], a[13625]); -- Mighty Minions of Mechagon
    A(t[343], a[13626]); -- Nautical Nuisances of Nazjatar
    A(t[343], a[13695]); -- Team Aquashock
    t[793] = c:New(k.L["Brawler's Guild"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Brawler's Guild
    C(t[258], t[793]);
    A(t[793], a[11558]); -- The First Rule of Brawler's Guild
    A(t[793], a[11559]); -- The First Rule of Brawler's Guild
    A(t[793], a[13186]); -- You Are Not Your $#*@! Legplates
    A(t[793], a[13188]); -- You Are Not Your $#*@! Legplates
    A(t[793], a[13189]); -- The Second Rule of Brawler's Guild
    A(t[793], a[13190]); -- The Second Rule of Brawler's Guild
    A(t[793], a[13191]); -- Brawler for Azeroth
    A(t[793], a[13192]); -- Brawler for Azeroth
    A(t[793], a[11567]); -- You Are Not The Contents Of Your Wallet
    A(t[793], a[11570]); -- Educated Guesser
    A(t[793], a[13194]); -- I Am Thrall's Complete Lack Of Surprise
    A(t[793], a[11573]); -- Rumble Club
    t[851] = c:New(k.L["Dueler's Guild"]); -- Dueler's Guild
    C(t[258], t[851]);
    A(t[851], a[12856]); -- The First Rule of Dueler's Guild
    A(t[851], a[12857]); -- Trial by Combat
    A(t[851], a[12858]); -- Slugfest
    A(t[851], a[12860]); -- Contender
    A(t[851], a[12863]); -- Dueling Master
    A(t[851], a[12859]); -- Prize Fighter
    A(t[851], a[12861]); -- Master of Duels
    A(t[851], a[12862]); -- Thirty Six and Two
    A(t[851], a[13623]); -- Fighting on Two Fronts
    t[425] = c:New(k.GetCategoryInfoTitle(15307)); -- Island Expeditions
    C(t[258], t[425]);
    A(t[425], a[13142]); -- Archipelago Explorer
    A(t[425], a[13122]); -- Island Conqueror
    A(t[425], a[13141]); -- Island Slayer
    A(t[425], a[12596]); -- No Tourist
    A(t[425], a[12594]); -- Competent Captain
    A(t[425], a[12595]); -- Expert Expeditioner
    A(t[425], a[12597]); -- Bayside Brawler
    A(t[425], a[13120]); -- Blood in the Water
    A(t[425], a[13121]); -- Notorious
    A(t[425], a[13129]); -- Sucker Punch
    A(t[425], a[13123]); -- My Dubs
    A(t[425], a[13124]); -- Metal Detector
    A(t[425], a[13125]); -- Azerite Admiral
    A(t[425], a[13126]); -- Give Me The Energy
    A(t[425], a[13127]); -- Tell Me A Tale
    A(t[425], a[13128]); -- I'm Here for the Pets
    A(t[425], a[13132]); -- Helping Hand
    A(t[425], a[13133]); -- Team Deathmatch
    A(t[425], a[13135]); -- Team Deathmatch
    A(t[425], a[13134]); -- Expedition Leader
    A(t[425], a[13701]); -- Battlefield Brawler
    A(t[425], a[13702]); -- Battlefield Tactician
    A(t[425], a[13703]); -- Battlefield Master
    t[436] = c:New((k.GetLFGDungeonInfo(1687))); -- Un'gol Ruins
    C(t[425], t[436]);
    A(t[436], a[12590]); -- Un'gol Ruins
    A(t[436], a[12589]); -- Heroic: Un'gol Ruins
    A(t[436], a[12591]); -- Mythic: Un'gol Ruins
    A(t[436], a[12592]); -- Ruined the Ruins
    t[437] = c:New((k.GetLFGDungeonInfo(1734))); -- The Dread Chain
    C(t[425], t[437]);
    A(t[437], a[13095]); -- Dread Chain
    A(t[437], a[13096]); -- Heroic: Dread Chain
    A(t[437], a[13097]); -- Mythic: Dread Chain
    A(t[437], a[13098]); -- Bane of the Chain
    t[438] = c:New((k.GetLFGDungeonInfo(1723))); -- The Rotting Mire
    C(t[425], t[438]);
    A(t[438], a[13103]); -- Rotting Mire
    A(t[438], a[13104]); -- Heroic: Rotting Mire
    A(t[438], a[13105]); -- Mythic: Rotting Mire
    A(t[438], a[13106]); -- Mire Marauder
    t[439] = c:New((k.GetLFGDungeonInfo(1750))); -- The Molten Cay
    C(t[425], t[439]);
    A(t[439], a[13099]); -- Molten Cay
    A(t[439], a[13100]); -- Heroic: Molten Cay
    A(t[439], a[13101]); -- Mythic: Molten Cay
    A(t[439], a[13102]); -- Clash at the Cay
    t[440] = c:New((k.GetLFGDungeonInfo(1724))); -- Verdant Wilds
    C(t[425], t[440]);
    A(t[440], a[13111]); -- Verdant Wilds
    A(t[440], a[13112]); -- Heroic: Verdant Wilds
    A(t[440], a[13113]); -- Mythic: Verdant Wilds
    A(t[440], a[13114]); -- War for the Wilds
    t[441] = c:New((k.GetLFGDungeonInfo(1725))); -- Skittering Hollow
    C(t[425], t[441]);
    A(t[441], a[13107]); -- Skittering Hollow
    A(t[441], a[13108]); -- Heroic: Skittering Hollow
    A(t[441], a[13109]); -- Mythic: Skittering Hollow
    A(t[441], a[13110]); -- Skittering Smashed
    t[442] = c:New((k.GetLFGDungeonInfo(1735))); -- The Whispering Reef
    C(t[425], t[442]);
    A(t[442], a[13119]); -- Whispering Reef
    A(t[442], a[13118]); -- Heroic: Whispering Reef
    A(t[442], a[13116]); -- Mythic: Whispering Reef
    A(t[442], a[13115]); -- Reef Madness
    t[443] = c:New((k.GetLFGDungeonInfo(1932))); -- Jorundall
    C(t[425], t[443]);
    A(t[443], a[13389]); -- Jorundall
    A(t[443], a[13394]); -- Heroic: Jorundall
    A(t[443], a[13395]); -- Mythic: Jorundall
    A(t[443], a[13399]); -- Jorundall Justice
    t[444] = c:New((k.GetLFGDungeonInfo(1928))); -- Havenswood
    C(t[425], t[444]);
    A(t[444], a[13396]); -- Havenswood
    A(t[444], a[13397]); -- Heroic: Havenswood
    A(t[444], a[13398]); -- Mythic: Havenswood
    A(t[444], a[13400]); -- Havenswood Hero
    t[445] = c:New((k.GetLFGDungeonInfo(1984))); -- Crestfall
    C(t[425], t[445]);
    A(t[445], a[13577]); -- Crestfall
    A(t[445], a[13578]); -- Heroic: Crestfall
    A(t[445], a[13579]); -- Mythic: Crestfall
    A(t[445], a[13580]); -- Crestfallen
    t[446] = c:New((k.GetLFGDungeonInfo(1983))); -- Snowblossom Village
    C(t[425], t[446]);
    A(t[446], a[13581]); -- Snowblossom Village
    A(t[446], a[13582]); -- Heroic: Snowblossom Village
    A(t[446], a[13583]); -- Mythic: Snowblossom Village
    A(t[446], a[13584]); -- Snowblossom Scrapper
    t[426] = c:New(k.GetCategoryInfoTitle(15308)); -- War Effort
    C(t[258], t[426]);
    A(t[426], a[12867]); -- Azeroth at War: The Barrens
    A(t[426], a[12896]); -- Azeroth at War: The Barrens
    A(t[426], a[12869]); -- Azeroth at War: After Lordaeron
    A(t[426], a[12898]); -- Azeroth at War: After Lordaeron
    A(t[426], a[12870]); -- Azeroth at War: Kalimdor on Fire
    A(t[426], a[12899]); -- Azeroth at War: Kalimdor on Fire
    A(t[426], a[12872]); -- The Dirty Five
    t[434] = c:New((k.GetLFGDungeonInfo(1615))); -- Battle for Stromgarde
    C(t[426], t[434]);
    A(t[434], a[12881]); -- War is Hell
    A(t[434], a[12873]); -- War is Hell
    A(t[434], a[13737]); -- Heroic: War is Hell
    A(t[434], a[13735]); -- Heroic: War is Hell
    A(t[434], a[12888]); -- Strike Hard
    A(t[434], a[12877]); -- Strike Hard
    A(t[434], a[12889]); -- Strike Fast
    A(t[434], a[12876]); -- Strike Fast
    A(t[434], a[12884]); -- Leader of Troops
    A(t[434], a[12878]); -- Leader of Troops
    A(t[434], a[12886]); -- Tour of War
    A(t[434], a[12879]); -- Tour of War
    A(t[434], a[13739]); -- Heroic: Tour of War
    A(t[434], a[13738]); -- Heroic: Tour of War
    A(t[434], a[12874]); -- An Eventful Battle
    t[435] = c:New((k.GetLFGDungeonInfo(1901))); -- The Battle for Darkshore
    C(t[426], t[435]);
    A(t[435], a[13297]); -- War for the Shore
    A(t[435], a[13296]); -- War for the Shore
    A(t[435], a[14150]); -- Heroic: War for the Shore
    A(t[435], a[14149]); -- Heroic: War for the Shore
    A(t[435], a[13302]); -- Under Cover of Darkness
    A(t[435], a[13301]); -- Under Cover of Darkness
    A(t[435], a[13305]); -- Night Moves
    A(t[435], a[13306]); -- Night Moves
    A(t[435], a[13308]); -- Recruitment Officer
    A(t[435], a[13307]); -- Recruitment Officer
    A(t[435], a[13310]); -- By Nature's Call
    A(t[435], a[13309]); -- Deforester
    t[427] = c:New(k.GetCategoryInfoTitle(15417)); -- Heart of Azeroth
    C(t[258], t[427]);
    A(t[427], a[12918]); -- Have a Heart
    A(t[427], a[13998]); -- Pure of Heart
    A(t[427], a[13572]); -- The Heart Forge
    A(t[427], a[13769]); -- Power Up
    A(t[427], a[13770]); -- Power Creep
    A(t[427], a[13771]); -- Power Is Beautiful
    A(t[427], a[13772]); -- Essence Essentials
    A(t[427], a[13773]); -- Essence Gains
    A(t[427], a[13775]); -- Essence Overload
    A(t[427], a[13777]); -- My Heart Container is Full
    A(t[427], a[13779]); -- Phenomenal Cosmic Power
    t[428] = c:New(k.GetCategoryInfoTitle(15426)); -- Visions of N'Zoth
    C(t[258], t[428]);
    A(t[428], a[14143]); -- Reeking of Visions
    A(t[428], a[13994]); -- Through the Depths of Visions
    A(t[428], a[14060]); -- Unwavering Resolve
    A(t[428], a[14061]); -- We Have the Technology
    A(t[428], a[14062]); -- Horrific Vision of Stormwind
    A(t[428], a[14064]); -- The Even More Horrific Vision of Stormwind
    A(t[428], a[14066]); -- The Most Horrific Vision of Stormwind
    A(t[428], a[14063]); -- Horrific Vision of Orgrimmar
    A(t[428], a[14065]); -- The Even More Horrific Vision of Orgrimmar
    A(t[428], a[14067]); -- The Most Horrific Vision of Orgrimmar
    A(t[428], a[14162]); -- Horrific Masquerade
    A(t[428], a[14165]); -- Masked Soliloquy
    A(t[428], a[14166]); -- Masked Duet
    A(t[428], a[14167]); -- Masked Trio
    A(t[428], a[14168]); -- Masked Quartet
    A(t[428], a[14169]); -- Symphony of Masks
    A(t[428], a[14170]); -- Thanks For The Mementos
    A(t[428], a[14171]); -- Memento Mori
    A(t[428], a[14172]); -- A Monumental Amount of Mementos
    A(t[428], a[14173]); -- A Mountain of Mementos
    A(t[428], a[14140]); -- Mad World
    t[6] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[883], t[6]);
    A(t[6], a[15654]); -- Back from the Beyond
    t[344] = c:New(k.L["Zones"]); -- Zones
    C(t[6], t[344]);
    A(t[344], a[14280]); -- Loremaster of Shadowlands
    A(t[344], a[14758]); -- The World Beyond
    A(t[344], a[15388]); -- Shadowlands Explorer
    A(t[344], a[14825]); -- Shadowlands Voyager
    A(t[344], a[14731]); -- To All the Squirrels I've Loved and Lost
    A(t[344], a[14515]); -- Zo'Sorg's Bidding
    A(t[344], a[14516]); -- Impressing Zo'Sorg
    A(t[344], a[14519]); -- Covenant Combat
    A(t[344], a[14315]); -- Shadowlands Diplomat
    A(t[344], a[15064]); -- Breaking the Chains
    A(t[344], a[7520]); -- The Loremaster
    t[345] = c:New(k.GetMapName(1533)); -- Bastion
    C(t[344], t[345]);
    t[346] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[345], t[346]);
    A(t[346], a[14281]); -- The Path to Ascension
    A(t[346], a[14801]); -- Sojourner of Bastion
    A(t[346], a[14737]); -- What Bastion Remembered
    A(t[346], a[14735]); -- Flight School Graduate
    A(t[346], a[14741]); -- Aerial Ace
    A(t[346], a[14762]); -- Breaking the Stratus Fear
    t[347] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[345], t[347]);
    A(t[347], a[14303]); -- Explore Bastion
    A(t[347], a[14307]); -- Adventurer of Bastion
    A(t[347], a[14311]); -- Treasures of Bastion
    A(t[347], a[14339]); -- Shard Labor
    A(t[347], a[14734]); -- Rallying Cry of the Ascended
    A(t[347], a[14767]); -- Count Your Blessings
    A(t[347], a[14768]); -- What is that Melody?
    A(t[347], a[14733]); -- In the Hot Seat
    t[348] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[345], t[348]);
    A(t[348], a[14514]); -- Tour of Duty: Bastion
    t[349] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[345], t[349]);
    A(t[349], a[14335]); -- The Ascended
    t[350] = c:New(k.GetMapName(1536)); -- Maldraxxus
    C(t[344], t[350]);
    t[351] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[350], t[351]);
    A(t[351], a[14206]); -- Blade of the Primus
    A(t[351], a[14799]); -- Sojourner of Maldraxxus
    t[352] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[350], t[352]);
    A(t[352], a[14305]); -- Explore Maldraxxus
    A(t[352], a[14308]); -- Adventurer of Maldraxxus
    A(t[352], a[14312]); -- Treasures of Maldraxxus
    A(t[352], a[14626]); -- Harvester of Sorrow
    A(t[352], a[14802]); -- Bloodsport
    A(t[352], a[14721]); -- It's In The Mix
    A(t[352], a[14634]); -- Nine Afterlives
    t[353] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[350], t[353]);
    A(t[353], a[14513]); -- Tour of Duty: Maldraxxus
    t[354] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[350], t[354]);
    A(t[354], a[14336]); -- Undying Army
    t[355] = c:New(k.GetMapName(1565)); -- Ardenweald
    C(t[344], t[355]);
    t[356] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[355], t[356]);
    A(t[356], a[14164]); -- "Awaken, Ardenweald"
    A(t[356], a[14800]); -- Sojourner of Ardenweald
    A(t[356], a[14671]); -- Something's Not Quite Right....
    A(t[356], a[14672]); -- "A Bit of This, A Bit of That"
    t[357] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[355], t[357]);
    A(t[357], a[14304]); -- Explore Ardenweald
    A(t[357], a[14309]); -- Adventurer of Ardenweald
    A(t[357], a[14313]); -- Treasures of Ardenweald
    A(t[357], a[14353]); -- Ardenweald's a Stage
    A(t[357], a[14791]); -- Toss a Seed to Your Hunter...
    A(t[357], a[14774]); -- Ardenweald Gourmand
    A(t[357], a[14788]); -- Fractured Faerie Tales
    A(t[357], a[14779]); -- Wild Hunting
    A(t[357], a[14504]); -- "Niya, As Xavius"
    A(t[357], a[14505]); -- "Senthii, As Gul'dan"
    A(t[357], a[14506]); -- "Glimmerdust, As Kil'jaeden"
    A(t[357], a[14507]); -- "Mi'kai, As Argus"
    A(t[357], a[14508]); -- "Glimmerdust, As Jaina"
    A(t[357], a[14509]); -- "Astra, As Azshara"
    A(t[357], a[14510]); -- "Dreamweaver, As N'Zoth"
    t[358] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[355], t[358]);
    A(t[358], a[14511]); -- Tour of Duty: Ardenweald
    t[359] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[355], t[359]);
    A(t[359], a[14337]); -- The Wild Hunt
    t[360] = c:New(k.GetMapName(1525)); -- Revendreth
    C(t[344], t[360]);
    t[361] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[360], t[361]);
    A(t[361], a[13878]); -- The Master of Revendreth
    A(t[361], a[14798]); -- Sojourner of Revendreth
    A(t[361], a[14233]); -- Tea Tales
    A(t[361], a[14765]); -- Ramparts Racer
    A(t[361], a[14766]); -- Parasoling
    A(t[361], a[14772]); -- Caught in a Bat Romance
    t[362] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[360], t[362]);
    A(t[362], a[14306]); -- Explore Revendreth
    A(t[362], a[14310]); -- Adventurer of Revendreth
    A(t[362], a[14314]); -- Treasures of Revendreth
    A(t[362], a[14277]); -- The Accuser's Avowed
    A(t[362], a[14274]); -- Absolution for All
    A(t[362], a[14272]); -- Best Bud With Benefits
    A(t[362], a[14276]); -- It's Always Sinny in Revendreth
    A(t[362], a[14769]); -- Bat!
    A(t[362], a[14771]); -- The Afterlife Express
    A(t[362], a[14770]); -- What We Ride in the Shadows
    A(t[362], a[14273]); -- Crypt Kicker
    t[363] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[360], t[363]);
    A(t[363], a[14512]); -- Tour of Duty: Revendreth
    t[364] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[360], t[364]);
    A(t[364], a[14338]); -- Court of Harvesters
    t[365] = c:New(k.GetMapName(1543)); -- The Maw
    C(t[344], t[365]);
    A(t[365], a[15648]); -- Walking in Maw-mphis
    t[366] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[365], t[366]);
    A(t[366], a[14334]); -- Into the Maw
    A(t[366], a[14961]); -- Chains of Domination
    A(t[366], a[15000]); -- United Front
    A(t[366], a[15001]); -- Jailer's Personal Stash
    A(t[366], a[15037]); -- This Army
    A(t[366], a[15039]); -- Up For Grabs
    A(t[366], a[15041]); -- The Zovaal Shuffle
    A(t[366], a[15043]); -- Hoarder of Torghast
    A(t[366], a[15042]); -- Tea for the Troubled
    A(t[366], a[15044]); -- Krrprripripkraak's Heroes
    A(t[366], a[15035]); -- On the Offensive
    A(t[366], a[15036]); -- Rooting Out the Evil
    A(t[366], a[15034]); -- Wings Against the Flames
    A(t[366], a[15033]); -- Taking the Tremaculum
    A(t[366], a[15032]); -- Breaking Their Hold
    t[367] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[365], t[367]);
    A(t[367], a[14663]); -- Explore The Maw
    A(t[367], a[14658]); -- Soulkeeper's Burden
    A(t[367], a[14659]); -- Handling His Henchmen
    A(t[367], a[14660]); -- It's About Sending a Message
    A(t[367], a[14738]); -- Hunting Party
    A(t[367], a[14742]); -- Who Sent You?
    A(t[367], a[14743]); -- Deadly Serious
    A(t[367], a[14744]); -- Better to Be Lucky Than Dead
    A(t[367], a[14745]); -- Grand Theft Shadehound
    A(t[367], a[14746]); -- Prepare for Trouble!
    A(t[367], a[14747]); -- Make it Double!
    A(t[367], a[14761]); -- Deciphering Death's Intentions
    A(t[367], a[14894]); -- "To 'Ghast, Two Curios"
    A(t[367], a[14895]); -- 'Ghast Five
    A(t[367], a[15054]); -- Minions of the Cold Dark
    A(t[367], a[15107]); -- Conquering Korthia
    A(t[367], a[14943]); -- Guarmageddon
    t[368] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[365], t[368]);
    A(t[368], a[14656]); -- Trading Partners
    t[812] = c:New(k.GetMapName(1961)); -- Korthia
    C(t[344], t[812]);
    t[817] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[812], t[817]);
    A(t[817], a[15066]); -- Reliquary Restoration
    A(t[817], a[15055]); -- Friend of Ooz
    A(t[817], a[15056]); -- Friend of Bloop
    A(t[817], a[15057]); -- Friend of Plaguey
    t[818] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[812], t[818]);
    A(t[818], a[15053]); -- Explore Korthia
    A(t[818], a[15107]); -- Conquering Korthia
    A(t[818], a[15099]); -- Treasures of Korthia
    t[813] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[812], t[813]);
    A(t[813], a[15059]); -- Death's Advance
    A(t[813], a[15069]); -- The Archivists' Codex
    t[1035] = c:New(k.GetMapName(1970)); -- Zereth Mortis
    C(t[344], t[1035]);
    t[1036] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1035], t[1036]);
    A(t[1036], a[15229]); -- Traversing the Spheres
    A(t[1036], a[15336]); -- From A to Zereth
    A(t[1036], a[15259]); -- Secrets of the First Ones
    A(t[1036], a[15515]); -- Path to Enlightenment
    A(t[1036], a[15518]); -- A Means to an End
    t[1037] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1035], t[1037]);
    A(t[1037], a[15224]); -- Explore Zereth Mortis
    A(t[1037], a[15391]); -- Adventurer of Zereth Mortis
    A(t[1037], a[15392]); -- Dune Dominance
    A(t[1037], a[15331]); -- Treasures of Zereth Mortis
    A(t[1037], a[15211]); -- Completing the Code
    A(t[1037], a[15402]); -- Cyphers of the First Ones
    A(t[1037], a[15502]); -- "Sand, Sand Everywhere!"
    A(t[1037], a[15406]); -- Synthesized!
    A(t[1037], a[15407]); -- Synthe-fived!
    A(t[1037], a[15410]); -- Synthe-superfived!
    A(t[1037], a[15411]); -- Synthe-supersized!
    A(t[1037], a[15508]); -- Fashion of the First Ones
    A(t[1037], a[15404]); -- Cosmic Empowerment
    A(t[1037], a[15509]); -- Tales of the Exile
    A(t[1037], a[15512]); -- Adventures in Zereth Mortis
    A(t[1037], a[15513]); -- Curious Collections
    A(t[1037], a[15514]); -- Unlocking the Secrets
    A(t[1037], a[15542]); -- Apocopocolypse Now
    t[1038] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1035], t[1038]);
    A(t[1038], a[15220]); -- The Enlightened
    t[369] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[6], t[369]);
    A(t[369], a[14418]); -- Shadowlands Dungeon Hero
    A(t[369], a[15651]); -- Myths of the Shadowlands Dungeons
    A(t[369], a[14322]); -- Glory of the Shadowlands Hero
    A(t[369], a[11183]); -- Keystone Initiate
    A(t[369], a[11184]); -- Keystone Challenger
    A(t[369], a[11185]); -- Keystone Conqueror
    A(t[369], a[11162]); -- Keystone Master
    A(t[369], a[14938]); -- Shadowlands Keystone Explorer: Season One
    A(t[369], a[14531]); -- Shadowlands Keystone Conqueror: Season One
    A(t[369], a[14532]); -- Shadowlands Keystone Master: Season One
    A(t[369], a[15073]); -- Shadowlands Keystone Explorer: Season Two
    A(t[369], a[15077]); -- Shadowlands Keystone Conqueror: Season Two
    A(t[369], a[15078]); -- Shadowlands Keystone Master: Season Two
    A(t[369], a[15327]); -- Tormented Hero: Shadowlands Season 2
    A(t[369], a[15496]); -- Shadowlands Keystone Explorer: Season Three
    A(t[369], a[15498]); -- Shadowlands Keystone Conqueror: Season Three
    A(t[369], a[15499]); -- Shadowlands Keystone Master: Season Three
    A(t[369], a[15506]); -- Shadowlands Keystone Hero: Season Three
    A(t[369], a[15691]); -- Cryptic Hero: Shadowlands Season 3
    A(t[369], a[15688]); -- Shadowlands Keystone Explorer: Season Four
    A(t[369], a[15689]); -- Shadowlands Keystone Conqueror: Season Four
    A(t[369], a[15690]); -- Shadowlands Keystone Master: Season Four
    A(t[369], a[15756]); -- Shrouded Hero: Shadowlands Season 4
    t[371] = c:New(k.GetInstanceInfoName(1182)); -- The Necrotic Wake
    C(t[369], t[371]);
    A(t[371], a[14295]); -- Bountiful Harvest
    A(t[371], a[14320]); -- Surgeon's Supplies
    A(t[371], a[14285]); -- Ready for Raiding VII
    A(t[371], a[14366]); -- The Necrotic Wake
    A(t[371], a[14367]); -- Heroic: The Necrotic Wake
    A(t[371], a[14368]); -- Mythic: The Necrotic Wake
    A(t[371], a[15045]); -- Keystone Hero: The Necrotic Wake
    t[372] = c:New(k.GetInstanceInfoName(1183)); -- Plaguefall
    C(t[369], t[372]);
    A(t[372], a[14292]); -- Riding with my Slimes
    A(t[372], a[14347]); -- Full Gores Meal
    A(t[372], a[14296]); -- Going Viral
    A(t[372], a[14369]); -- Plaguefall
    A(t[372], a[14414]); -- Heroic: Plaguefall
    A(t[372], a[14415]); -- Mythic: Plaguefall
    A(t[372], a[15046]); -- Keystone Hero: Plaguefall
    t[373] = c:New(k.GetInstanceInfoName(1184)); -- Mists of Tirna Scithe
    C(t[369], t[373]);
    A(t[373], a[14503]); -- Hooked On Hydroponics
    A(t[373], a[14291]); -- Someone Could Trip on These!
    A(t[373], a[14375]); -- Hunger for Knowledge
    A(t[373], a[14371]); -- Mists of Tirna Scithe
    A(t[373], a[14412]); -- Heroic: Mists of Tirna Scithe
    A(t[373], a[14413]); -- Mythic: Mists of Tirna Scithe
    A(t[373], a[15047]); -- Keystone Hero: Mists of Tirna Scithe
    t[374] = c:New(k.GetInstanceInfoName(1185)); -- Halls of Atonement
    C(t[369], t[374]);
    A(t[374], a[14567]); -- Picking Up the Pieces
    A(t[374], a[14284]); -- Breaking Bad
    A(t[374], a[14352]); -- Nobody Puts Denathrius in a Corner
    A(t[374], a[14370]); -- Halls of Atonement
    A(t[374], a[14410]); -- Heroic: Halls of Atonement
    A(t[374], a[14411]); -- Mythic: Halls of Atonement
    A(t[374], a[15048]); -- Keystone Hero: Halls of Atonement
    t[375] = c:New(k.GetInstanceInfoName(1186)); -- Spires of Ascension
    C(t[369], t[375]);
    A(t[375], a[14331]); -- Goliath Offline
    A(t[375], a[14323]); -- ExSPEARiential
    A(t[375], a[14327]); -- I Can See My House From Here
    A(t[375], a[14326]); -- Spires of Ascension
    A(t[375], a[14324]); -- Heroic: Spires of Ascension
    A(t[375], a[14325]); -- Mythic: Spires of Ascension
    A(t[375], a[15049]); -- Keystone Hero: Spires of Ascension
    t[376] = c:New(k.GetInstanceInfoName(1187)); -- Theater of Pain
    C(t[369], t[376]);
    A(t[376], a[14297]); -- Three Choose One
    A(t[376], a[14607]); -- Fresh Meat!
    A(t[376], a[14533]); -- Royal Rumble
    A(t[376], a[14372]); -- Theater of Pain
    A(t[376], a[14416]); -- Heroic: Theater of Pain
    A(t[376], a[14417]); -- Mythic: Theater of Pain
    A(t[376], a[15050]); -- Keystone Hero: Theater of Pain
    t[377] = c:New(k.GetInstanceInfoName(1188)); -- De Other Side
    C(t[369], t[377]);
    A(t[377], a[14354]); -- Highly Communicable
    A(t[377], a[14374]); -- Couple's Therapy
    A(t[377], a[14606]); -- Thinking with...
    A(t[377], a[14373]); -- De Other Side
    A(t[377], a[14408]); -- Heroic: De Other Side
    A(t[377], a[14409]); -- Mythic: De Other Side
    A(t[377], a[15051]); -- Keystone Hero: De Other Side
    t[378] = c:New(k.GetInstanceInfoName(1189)); -- Sanguine Depths
    C(t[369], t[378]);
    A(t[378], a[14286]); -- Residue Evil
    A(t[378], a[14290]); -- I Only Have Eyes For You
    A(t[378], a[14289]); -- Kaal-ed Shot
    A(t[378], a[14197]); -- Sanguine Depths
    A(t[378], a[14198]); -- Heroic: Sanguine Depths
    A(t[378], a[14199]); -- Mythic: Sanguine Depths
    A(t[378], a[15052]); -- Keystone Hero: Sanguine Depths
    t[823] = c:New(k.GetInstanceInfoName(1194)); -- Tazavesh, the Veiled Market
    C(t[369], t[823]);
    A(t[823], a[15109]); -- Will it Blend?
    A(t[823], a[15106]); -- Quality Control
    A(t[823], a[15179]); -- This is Fine
    A(t[823], a[15190]); -- Mischief!
    A(t[823], a[15178]); -- Fake It 'Til You Make It
    A(t[823], a[15177]); -- "Tazavesh, the Veiled Market"
    A(t[823], a[15650]); -- Mythic: Streets of Wonder
    A(t[823], a[15652]); -- Mythic: So'leah's Gambit
    A(t[823], a[15500]); -- "Keystone Hero: Tazavesh, the Veiled Market"
    t[370] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[6], t[370]);
    A(t[370], a[14355]); -- Glory of the Nathria Raider
    A(t[370], a[15130]); -- Glory of the Dominant Raider
    A(t[370], a[15491]); -- Glory of the Sepulcher Raider
    A(t[370], a[15684]); -- Fates of the Shadowlands Raids
    A(t[370], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    A(t[370], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    t[379] = c:New(k.GetInstanceInfoName(1190)); -- Castle Nathria
    C(t[370], t[379]);
    A(t[379], a[14715]); -- Castle Nathria
    A(t[379], a[14717]); -- Heroic: Castle Nathria
    A(t[379], a[14718]); -- Mythic: Castle Nathria
    A(t[379], a[15663]); -- Fate of Nathria
    A(t[379], a[15664]); -- Heroic: Fate of Nathria
    A(t[379], a[15665]); -- Mythic: Fate of Nathria
    A(t[379], a[14460]); -- Ahead of the Curve: Sire Denathrius
    A(t[379], a[14461]); -- Cutting Edge: Sire Denathrius
    A(t[379], a[14614]); -- Castle Vain
    t[860] = c:New(k.L["Glory"]); -- Glory
    C(t[379], t[860]);
    A(t[860], a[14293]); -- Blind as a Bat
    A(t[860], a[14523]); -- Taking Care of Business
    A(t[860], a[14376]); -- Feed the Beast
    A(t[860], a[14524]); -- I Don't Know What I Expected
    A(t[860], a[14617]); -- Private Stock
    A(t[860], a[14608]); -- Burning Bright
    A(t[860], a[14619]); -- Pour Decision Making
    A(t[860], a[14294]); -- Dirtflap's Revenge
    A(t[860], a[14525]); -- "Feed Me, Seymour!"
    A(t[860], a[14610]); -- Clear Conscience
    t[861] = c:New(k.L["Mythic"]); -- Mythic
    C(t[379], t[861]);
    A(t[861], a[14356]); -- Mythic: Shriekwing
    A(t[861], a[14357]); -- Mythic: Huntsman Altimor
    A(t[861], a[14358]); -- Mythic: Hungering Destroyer
    A(t[861], a[14361]); -- Mythic: Lady Inerva Darkvein
    A(t[861], a[14359]); -- Mythic: Artificer Xy'mox
    A(t[861], a[14360]); -- Mythic: Sun King's Salvation
    A(t[861], a[14362]); -- Mythic: The Council of Blood
    A(t[861], a[14363]); -- Mythic: Sludgefist
    A(t[861], a[14364]); -- Mythic: Stone Legion Generals
    A(t[861], a[14365]); -- Mythic: Sire Denathrius
    t[821] = c:New(k.GetInstanceInfoName(1193)); -- Sanctum of Domination
    C(t[370], t[821]);
    A(t[821], a[15122]); -- The Jailer's Vanguard
    A(t[821], a[15123]); -- The Dark Bastille
    A(t[821], a[15124]); -- Shackles of Fate
    A(t[821], a[15125]); -- The Reckoning
    A(t[821], a[15126]); -- Sanctum of Domination
    A(t[821], a[15127]); -- Heroic: Sanctum of Domination
    A(t[821], a[15128]); -- Mythic: Sanctum of Domination
    A(t[821], a[15667]); -- Fate of Domination
    A(t[821], a[15668]); -- Heroic: Fate of Domination
    A(t[821], a[15669]); -- Mythic: Fate of Domination
    A(t[821], a[15134]); -- Ahead of the Curve: Sylvanas Windrunner
    A(t[821], a[15135]); -- Cutting Edge: Sylvanas Windrunner
    A(t[821], a[15110]); -- Dominating the Catwalk
    A(t[821], a[15191]); -- "Rae'shalare, Death's Whisper"
    t[858] = c:New(k.L["Glory"]); -- Glory
    C(t[821], t[858]);
    A(t[858], a[14998]); -- "Name A Better Duo, I'll Wait"
    A(t[858], a[15065]); -- Eye Wish You Were Here
    A(t[858], a[15003]); -- To the Nines
    A(t[858], a[15058]); -- I Used to Bullseye Deeprun Rats Back Home
    A(t[858], a[15105]); -- Tormentor's Tango
    A(t[858], a[15131]); -- Whack-A-Soul
    A(t[858], a[15132]); -- Knowledge is Power
    A(t[858], a[15040]); -- Flawless Fate
    A(t[858], a[15108]); -- Together Forever
    A(t[858], a[15133]); -- This World is a Prism
    t[859] = c:New(k.L["Mythic"]); -- Mythic
    C(t[821], t[859]);
    A(t[859], a[15112]); -- Mythic: The Tarragrue
    A(t[859], a[15113]); -- Mythic: The Eye of the Jailer
    A(t[859], a[15114]); -- Mythic: The Nine
    A(t[859], a[15115]); -- Mythic: Remnant of Ner'zhul
    A(t[859], a[15116]); -- Mythic: Soulrender Dormazain
    A(t[859], a[15117]); -- Mythic: Painsmith Raznal
    A(t[859], a[15118]); -- Mythic: Guardian of the First Ones
    A(t[859], a[15119]); -- Mythic: Fatescribe Roh-Kalo
    A(t[859], a[15120]); -- Mythic: Kel'Thuzad
    A(t[859], a[15121]); -- Mythic: Sylvanas Windrunner
    t[1040] = c:New(k.GetInstanceInfoName(1195)); -- Sepulcher of the First Ones
    C(t[370], t[1040]);
    A(t[1040], a[15492]); -- Cornerstone of Creation
    A(t[1040], a[15493]); -- Ephemeral Plains
    A(t[1040], a[15416]); -- Domination's Grasp
    A(t[1040], a[15418]); -- The Grand Design
    A(t[1040], a[15417]); -- Sepulcher of the First Ones
    A(t[1040], a[15478]); -- Heroic: Sepulcher of the First Ones
    A(t[1040], a[15490]); -- Mythic: Sepulcher of the First Ones
    A(t[1040], a[15681]); -- Fate of the Sepulcher
    A(t[1040], a[15682]); -- Heroic: Fate of the Sepulcher
    A(t[1040], a[15683]); -- Mythic: Fate of the Sepulcher
    A(t[1040], a[15396]); -- We Are All Made of Stars
    A(t[1040], a[15468]); -- We Are All Made of Stars (Heroic)
    A(t[1040], a[15469]); -- We Are All Made of Stars (Mythic)
    A(t[1040], a[15470]); -- Ahead of the Curve: The Jailer
    A(t[1040], a[15471]); -- Cutting Edge: The Jailer
    A(t[1040], a[15409]); -- First Wonders
    t[1041] = c:New(k.L["Glory"]); -- Glory
    C(t[1040], t[1041]);
    A(t[1041], a[15381]); -- Power ON
    A(t[1041], a[15401]); -- Wisdom Comes From the Desert
    A(t[1041], a[15398]); -- "Xy Never, Ever Marks the Spot."
    A(t[1041], a[15397]); -- Four Ring Circus
    A(t[1041], a[15400]); -- Where the Wild Corgis Are
    A(t[1041], a[15419]); -- The Protoform Matrix
    A(t[1041], a[15386]); -- Shimmering Secrets
    A(t[1041], a[15399]); -- Coming to Terms
    A(t[1041], a[15315]); -- Amidst Ourselves
    A(t[1041], a[15396]); -- We Are All Made of Stars
    A(t[1041], a[15494]); -- Damnation Aviation
    t[1042] = c:New(k.L["Mythic"]); -- Mythic
    C(t[1040], t[1042]);
    A(t[1042], a[15479]); -- Mythic: Vigilant Guardian
    A(t[1042], a[15480]); -- Mythic: Skolex
    A(t[1042], a[15481]); -- Mythic: Artificer Xy'mox
    A(t[1042], a[15482]); -- Mythic: Dausegne
    A(t[1042], a[15483]); -- Mythic: Prototype Pantheon
    A(t[1042], a[15484]); -- Mythic: Lihuvim
    A(t[1042], a[15485]); -- Mythic: Halondrus
    A(t[1042], a[15486]); -- Mythic: Anduin Wrynn
    A(t[1042], a[15487]); -- Mythic: Lords of Dread
    A(t[1042], a[15488]); -- Mythic: Rygelon
    A(t[1042], a[15489]); -- Mythic: The Jailer
    t[380] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[6], t[380]);
    A(t[380], a[14867]); -- Shadowlands Safari
    A(t[380], a[14625]); -- Battle in the Shadowlands
    A(t[380], a[14868]); -- Aquatic Apparitions
    A(t[380], a[14869]); -- Beast Busters
    A(t[380], a[14870]); -- Creepy Critters
    A(t[380], a[14871]); -- Deathly Dragonkin
    A(t[380], a[14872]); -- Eerie Elementals
    A(t[380], a[14873]); -- Flickering Fliers
    A(t[380], a[14874]); -- Haunted Humanoids
    A(t[380], a[14875]); -- Mummified Magics
    A(t[380], a[14876]); -- Macabre Mechanicals
    A(t[380], a[14877]); -- Unholy Undead
    A(t[380], a[14879]); -- Family Exorcist
    A(t[380], a[14881]); -- Abhorrent Adversaries of the Afterlife
    A(t[380], a[15004]); -- A Sly Fox
    t[424] = c:New(k.GetCategoryInfoTitle(15440)); -- Torghast
    C(t[6], t[424]);
    A(t[424], a[14808]); -- Touring Torghast
    A(t[424], a[14809]); -- Traversing Torghast
    A(t[424], a[14810]); -- Terror of Torghast
    A(t[424], a[15091]); -- A Taste of Perfection
    A(t[424], a[15089]); -- Flawless Master (Layer 12)
    A(t[424], a[15322]); -- Flawless Master (Layer 16)
    A(t[424], a[14499]); -- Phanciful
    A(t[424], a[14500]); -- Phantastic
    A(t[424], a[14501]); -- Phanatical
    A(t[424], a[14498]); -- Gatekeepers of Torghast
    A(t[424], a[14773]); -- Explosive Extermination
    A(t[424], a[14776]); -- For the Hoarder!
    A(t[424], a[14778]); -- Extremely Ravenous
    A(t[424], a[14754]); -- The Forgotten One
    A(t[424], a[14755]); -- Legendary Accord
    A(t[424], a[14759]); -- It's Coming Back to Me...
    A(t[424], a[14760]); -- Recollection Collection
    A(t[424], a[14795]); -- Clearing the Fog
    A(t[424], a[15067]); -- Adamant Vaults
    A(t[424], a[15075]); -- Infiltrators
    A(t[424], a[15076]); -- The Box of Many Things
    A(t[424], a[15080]); -- So Blessed
    A(t[424], a[15079]); -- "Many, Many Things"
    A(t[424], a[15093]); -- Avenge Me!
    A(t[424], a[15095]); -- No Doubt
    A(t[424], a[15094]); -- Rampage
    A(t[424], a[15096]); -- Crowd Pleaser
    A(t[424], a[15092]); -- Master of Torment
    A(t[424], a[15324]); -- Tower Ranger
    t[843] = c:New((select(2, k.GetAchievementInfo(14463))), true); -- Skoldus Hall
    C(t[424], t[843]);
    A(t[843], a[14463]); -- Skoldus Hall
    A(t[843], a[15081]); -- Flawless: Skoldus Hall (Layer 12)
    A(t[843], a[15314]); -- Flawless: Skoldus Hall (Layer 16)
    t[844] = c:New((select(2, k.GetAchievementInfo(14473))), true); -- Fracture Chambers
    C(t[424], t[844]);
    A(t[844], a[14473]); -- Fracture Chambers
    A(t[844], a[15082]); -- Flawless: Fracture Chambers (Layer 12)
    A(t[844], a[15316]); -- Flawless: Fracture Chambers (Layer 16)
    t[845] = c:New((select(2, k.GetAchievementInfo(14478))), true); -- The Soulforges
    C(t[424], t[845]);
    A(t[845], a[14478]); -- The Soulforges
    A(t[845], a[15084]); -- Flawless: The Soulforges (Layer 12)
    A(t[845], a[15317]); -- Flawless: The Soulforges (Layer 16)
    t[846] = c:New((select(2, k.GetAchievementInfo(14483))), true); -- Coldheart Interstitia
    C(t[424], t[846]);
    A(t[846], a[14483]); -- Coldheart Interstitia
    A(t[846], a[15083]); -- Flawless: Coldheart Interstitia (Layer 12)
    A(t[846], a[15318]); -- Flawless: Coldheart Interstitia (Layer 16)
    t[847] = c:New((select(2, k.GetAchievementInfo(14488))), true); -- Mort'regar
    C(t[424], t[847]);
    A(t[847], a[14488]); -- Mort'regar
    A(t[847], a[15087]); -- Flawless: Mort'regar (Layer 12)
    A(t[847], a[15319]); -- Flawless: Mort'regar (Layer 16)
    t[848] = c:New((select(2, k.GetAchievementInfo(14493))), true); -- The Upper Reaches
    C(t[424], t[848]);
    A(t[848], a[14493]); -- The Upper Reaches
    A(t[848], a[15088]); -- Flawless: The Upper Reaches (Layer 12)
    A(t[848], a[15320]); -- Flawless: The Upper Reaches (Layer 16)
    t[1039] = c:New(k.L["Other wings"]); -- Other wings
    C(t[424], t[1039]);
    A(t[1039], a[14468]); -- Twisting Corridors: Layer 1
    A(t[1039], a[14469]); -- Twisting Corridors: Layer 2
    A(t[1039], a[14470]); -- Twisting Corridors: Layer 3
    A(t[1039], a[14471]); -- Twisting Corridors: Layer 4
    A(t[1039], a[14472]); -- Twisting Corridors: Layer 5
    A(t[1039], a[14568]); -- Twisting Corridors: Layer 6
    A(t[1039], a[14569]); -- Twisting Corridors: Layer 7
    A(t[1039], a[14570]); -- Twisting Corridors: Layer 8
    A(t[1039], a[15251]); -- The Jailer's Gauntlet: Layer 1
    A(t[1039], a[15252]); -- The Jailer's Gauntlet: Layer 2
    A(t[1039], a[15253]); -- The Jailer's Gauntlet: Layer 3
    A(t[1039], a[15254]); -- The Jailer's Gauntlet: Layer 4
    A(t[1039], a[15255]); -- The Jailer's Gauntlet: Layer 5
    A(t[1039], a[15256]); -- The Jailer's Gauntlet: Layer 6
    A(t[1039], a[15257]); -- The Jailer's Gauntlet: Layer 7
    A(t[1039], a[15258]); -- The Jailer's Gauntlet: Layer 8
    t[419] = c:New(k.GetCategoryInfoTitle(15441)); -- Covenant Sanctums
    C(t[6], t[419]);
    A(t[419], a[14627]); -- Choosing Your Purpose
    A(t[419], a[14790]); -- Covenant Campaign
    A(t[419], a[15647]); -- Dead Men Tell Some Tales
    A(t[419], a[14834]); -- Bound with Purpose
    A(t[419], a[14835]); -- A Resolute Bond
    A(t[419], a[14836]); -- Unwavering Bond
    A(t[419], a[14837]); -- Nexus of Bonds
    A(t[419], a[14628]); -- The Road to Renown
    A(t[419], a[14629]); -- Gaining Respect
    A(t[419], a[14630]); -- Becoming a Hero
    A(t[419], a[14631]); -- Champion of the Covenant
    A(t[419], a[15241]); -- Renowned
    A(t[419], a[15646]); -- Re-Re-Re-Renowned
    A(t[419], a[14632]); -- Conducting Anima
    A(t[419], a[14633]); -- Master Navigator
    A(t[419], a[14636]); -- Adventurer in Chief
    A(t[419], a[14839]); -- Adventures: Off To Adventure
    A(t[419], a[14840]); -- Adventures: Learning the Ropes
    A(t[419], a[14841]); -- Adventures: Now You're Cooking
    A(t[419], a[14842]); -- Adventures: Strength and Resilience
    A(t[419], a[14843]); -- Adventures: Harmony of Purpose
    A(t[419], a[14844]); -- Adventures: Into the Breach
    A(t[419], a[14845]); -- Adventures: A Step in the Right Direction
    A(t[419], a[14846]); -- Adventures: Leaves in the Forest
    A(t[419], a[14847]); -- Adventures: Protector of the Shadowlands
    A(t[419], a[14637]); -- Your Covenant's Flavor
    A(t[419], a[14638]); -- The Anima Must Flow
    A(t[419], a[14639]); -- Dedication to the Restoration
    A(t[419], a[14777]); -- Restoration Expert
    A(t[419], a[15023]); -- We Can Rebuild
    A(t[419], a[15024]); -- Denying the Drought
    A(t[419], a[15025]); -- Sanctum Superior
    A(t[419], a[15649]); -- Shadowlands Dilettante
    t[423] = c:New(k.GetCovenantName(1)); -- Kyrian
    C(t[419], t[423]);
    A(t[423], a[14851]); -- Bastion of Protection
    A(t[423], a[14852]); -- The Hoot of the Issue
    A(t[423], a[14853]); -- All The Colors of the Painbow
    A(t[423], a[14854]); -- It's Not What You Wear
    A(t[423], a[14502]); -- Pursuing Loyalty
    A(t[423], a[14856]); -- "Charmed, I'm Sure"
    A(t[423], a[14857]); -- Itsy Bitsy Fighters
    A(t[423], a[14858]); -- Curse of Thirst
    A(t[423], a[14859]); -- Inside the Park Home Run
    A(t[423], a[14860]); -- Bare Necessities
    A(t[423], a[14861]); -- Learning from the Masters
    A(t[423], a[14862]); -- It's How You Wear It
    A(t[423], a[14863]); -- Death Foursworn
    A(t[423], a[14864]); -- Personal Nightmare
    A(t[423], a[14865]); -- Disciple of Humility
    A(t[423], a[14866]); -- Master of the Path
    A(t[423], a[14887]); -- To the Moon
    t[421] = c:New(k.GetCovenantName(2)); -- Venthyr
    C(t[419], t[421]);
    A(t[421], a[14678]); -- Court Favors
    A(t[421], a[14679]); -- Party Palace
    A(t[421], a[14680]); -- Something for Everyone
    A(t[421], a[14681]); -- Dredger Academy
    A(t[421], a[14682]); -- The Party Herald
    A(t[421], a[14683]); -- Dredger Style
    A(t[421], a[14723]); -- Be Our Guest
    A(t[421], a[14724]); -- People Pleaser
    A(t[421], a[14725]); -- We Happy Few
    A(t[421], a[14726]); -- It's Certainly Never Boring
    A(t[421], a[14727]); -- Master of Ceremonies
    A(t[421], a[14749]); -- Rendle's Big Day
    t[422] = c:New(k.GetCovenantName(3)); -- Night Fae
    C(t[419], t[422]);
    A(t[422], a[14670]); -- That's the Spirit
    A(t[422], a[14675]); -- Spirit Talker
    A(t[422], a[14676]); -- Divine Spirit Savior
    A(t[422], a[14677]); -- Spiritual Observations
    A(t[422], a[14775]); -- Mush Appreciated
    A(t[422], a[14780]); -- Meditation Master
    A(t[422], a[14789]); -- All Spirits Great and Small
    t[420] = c:New(k.GetCovenantName(4)); -- Necrolord
    C(t[419], t[420]);
    A(t[420], a[14684]); -- Abominable Lives
    A(t[420], a[14748]); -- Wardrobe Makeover
    A(t[420], a[14751]); -- The Gang's All Here
    A(t[420], a[14752]); -- Things To Do When You're Dead
    A(t[420], a[14753]); -- It's a Wrap
    A(t[420], a[14764]); -- The Great Luckydo
    A(t[420], a[14833]); -- Fashion Abomination
    A(t[420], a[14763]); -- Crypt Couture
    t[1207] = c:New(k.GetCategoryInfoTitle(15466)); -- Dragonflight
    C(t[883], t[1207]);
    t[1228] = c:New(k.L["Zones"]); -- Zones
    C(t[1207], t[1228]);
    t[1341] = c:New(k.GetCategoryInfoTitle(15465)); -- Dragon Isles
    C(t[1228], t[1341]);
    t[1342] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1341], t[1342]);
    A(t[1342], a[16585]); -- Loremaster of the Dragon Isles
    A(t[1342], a[16291]); -- An Ancient Awakening
    A(t[1342], a[16292]); -- Mastering the Waygates
    A(t[1342], a[16808]); -- Friend of the Dragon Isles
    t[1343] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1341], t[1343]);
    A(t[1343], a[16761]); -- Dragon Isles Explorer
    A(t[1343], a[16446]); -- That's Pretty Neat!
    A(t[1343], a[16298]); -- Treasure Hunter of the Dragon Isles
    A(t[1343], a[15890]); -- Dragonscale Expedition: The Highest Peaks
    A(t[1343], a[16323]); -- Fragments of History
    A(t[1343], a[16338]); -- Fang Flap Fire Fighter
    A(t[1343], a[16729]); -- To All the Squirrels Hidden Til Now
    t[1390] = c:New(k.GetCategoryInfoTitle(95), true); -- Player vs. Player
    C(t[1341], t[1390]);
    A(t[1390], a[16589]); -- Malicia's Challenge
    A(t[1390], a[16590]); -- A Champion's Tour: Dragon Isles
    A(t[1390], a[16599]); -- A Champion's Pursuit
    A(t[1390], a[16601]); -- Dragonfight Club
    A(t[1390], a[16603]); -- Bounty Hunter
    A(t[1390], a[16612]); -- Bounty Vigalante
    A(t[1390], a[16611]); -- Resource Scavanger
    A(t[1390], a[16613]); -- Finder's Keepers
    A(t[1390], a[16614]); -- Bloodstained Bounty
    A(t[1390], a[16615]); -- Blood Bank
    A(t[1390], a[16616]); -- Prosperously Bloody
    t[1361] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1341], t[1361]);
    A(t[1361], a[16522]); -- A True Explorer
    A(t[1361], a[16530]); -- Ally of the Flights
    A(t[1361], a[16549]); -- Popular Around the Isles
    A(t[1361], a[16560]); -- Wildlife Photographer
    A(t[1361], a[16566]); -- Great Shot!
    A(t[1361], a[16567]); -- A Lot of Great Shots!
    A(t[1361], a[16568]); -- Great Shots Galore!
    A(t[1361], a[16570]); -- A Legendary Album
    A(t[1361], a[16571]); -- Well Supplied
    A(t[1361], a[16572]); -- Legendary Photograph
    A(t[1361], a[16573]); -- Legendary Photographs
    A(t[1361], a[16587]); -- Lead Climber
    A(t[1361], a[16588]); -- How Did These Get Here?
    A(t[1361], a[16591]); -- The Gentleman Elemental
    A(t[1361], a[16600]); -- Isles Ascender
    A(t[1361], a[16623]); -- Toe Tension
    A(t[1361], a[16624]); -- Which Knot Was It Again?
    A(t[1361], a[16625]); -- Belay On!
    A(t[1361], a[16758]); -- "Ready, Aim, Catalog!"
    t[1362] = c:New(k.GetMapName(2112)); -- Valdrakken
    C(t[1228], t[1362]);
    A(t[1362], a[16556]); -- Great Gourmand of The Ruby Feast
    t[1232] = c:New(k.GetMapName(2022)); -- The Waking Shores
    C(t[1228], t[1232]);
    t[1237] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1232], t[1237]);
    A(t[1237], a[16334]); -- Waking Hope
    A(t[1237], a[16401]); -- Sojourner of the Waking Shores
    t[1242] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1232], t[1242]);
    A(t[1242], a[16400]); -- Explore the Waking Shores
    A(t[1242], a[16676]); -- Adventurer of The Waking Shores
    A(t[1242], a[16297]); -- Treasures of The Waking Shores
    A(t[1242], a[16411]); -- Siege on Dragonbane Keep: Home Sweet Home
    A(t[1242], a[16412]); -- Siege on Dragonbane Keep: Chiseled Record
    A(t[1242], a[16410]); -- Siege on Dragonbane Keep: Snack Attack
    A(t[1242], a[16406]); -- All Sides of the Story
    A(t[1242], a[16409]); -- Let's Get Quacking
    A(t[1242], a[16494]); -- Loyalty to the Prince
    A(t[1242], a[16495]); -- Obsidian Keymaster
    A(t[1242], a[16496]); -- Obsidian Champion
    A(t[1242], a[16497]); -- I'm Playing All Sides
    A(t[1242], a[16584]); -- Symbols of Hope
    t[1247] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1232], t[1247]);
    A(t[1247], a[16592]); -- Tour of Duty: The Waking Shores
    t[1248] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1232], t[1248]);
    A(t[1248], a[16539]); -- In High Esteem
    A(t[1248], a[16532]); -- Friends with Sabellian
    A(t[1248], a[16536]); -- True Friends with Wrathion
    A(t[1248], a[16760]); -- The Obsidian Bloodline
    t[1306] = c:New(k.L["Dragon Glyphs"], true); -- Dragon Glyphs
    C(t[1232], t[1306]);
    A(t[1306], a[15991]); -- Dragon Glyphs: Crumbling Life Archway
    A(t[1306], a[16051]); -- Dragon Glyphs: Dragonheart Outpost
    A(t[1306], a[16669]); -- Dragon Glyphs: Flashfrost Enclave
    A(t[1306], a[15990]); -- Dragon Glyphs: Life-Binder Observatory
    A(t[1306], a[15987]); -- Dragon Glyphs: Obsidian Bulwark
    A(t[1306], a[16053]); -- Dragon Glyphs: Obsidian Throne
    A(t[1306], a[15988]); -- Dragon Glyphs: Ruby Life Pools Peaks
    A(t[1306], a[16052]); -- Dragon Glyphs: Scalecracker Peak
    A(t[1306], a[16668]); -- Dragon Glyphs: Skytop Observatory Rostrum
    A(t[1306], a[15985]); -- Dragon Glyphs: Skytop Observatory Tower
    A(t[1306], a[15989]); -- Dragon Glyphs: The Overflowing Spring
    A(t[1306], a[15986]); -- Dragon Glyphs: Wingrest Embassy
    A(t[1306], a[16575]); -- Waking Shores Glyph Hunter
    t[1310] = c:New(k.L["Dragon Racing"], true); -- Dragon Racing
    C(t[1232], t[1310]);
    A(t[1310], a[15915]); -- Waking Shores: Bronze
    A(t[1310], a[15916]); -- Waking Shores: Silver
    A(t[1310], a[15917]); -- Waking Shores: Gold
    A(t[1310], a[15927]); -- Waking Shores Advanced: Bronze
    A(t[1310], a[15928]); -- Waking Shores Advanced: Silver
    A(t[1310], a[15929]); -- Waking Shores Advanced: Gold
    t[1317] = c:New(k.L["Apex Canopy River Run"]); -- Apex Canopy River Run
    C(t[1310], t[1317]);
    A(t[1317], a[15730]); -- Apex Canopy River Run: Bronze
    A(t[1317], a[15731]); -- Apex Canopy River Run: Silver
    A(t[1317], a[15732]); -- Apex Canopy River Run: Gold
    A(t[1317], a[15733]); -- Apex Canopy River Run Advanced: Bronze
    A(t[1317], a[15734]); -- Apex Canopy River Run Advanced: Silver
    A(t[1317], a[15735]); -- Apex Canopy River Run Advanced: Gold
    t[1316] = c:New(k.L["Emberflow Flight"]); -- Emberflow Flight
    C(t[1310], t[1316]);
    A(t[1316], a[15724]); -- Emberflow Flight: Bronze
    A(t[1316], a[15725]); -- Emberflow Flight: Silver
    A(t[1316], a[15726]); -- Emberflow Flight: Gold
    A(t[1316], a[15727]); -- Emberflow Flight Advanced: Bronze
    A(t[1316], a[15728]); -- Emberflow Flight Advanced: Silver
    A(t[1316], a[15729]); -- Emberflow Flight Advanced: Gold
    t[1320] = c:New(k.L["Flashfrost Flyover"]); -- Flashfrost Flyover
    C(t[1310], t[1320]);
    A(t[1320], a[15705]); -- Flashfrost Flyover: Bronze
    A(t[1320], a[15706]); -- Flashfrost Flyover: Silver
    A(t[1320], a[15707]); -- Flashfrost Flyover: Gold
    A(t[1320], a[15709]); -- Flashfrost Flyover Advanced: Bronze
    A(t[1320], a[15710]); -- Flashfrost Flyover Advanced: Silver
    A(t[1320], a[15711]); -- Flashfrost Flyover Advanced: Gold
    t[1314] = c:New(k.L["Ruby Lifeshrine Loop"]); -- Ruby Lifeshrine Loop
    C(t[1310], t[1314]);
    A(t[1314], a[15696]); -- Ruby Lifeshrine Loop: Bronze
    A(t[1314], a[15697]); -- Ruby Lifeshrine Loop: Silver
    A(t[1314], a[15698]); -- Ruby Lifeshrine Loop: Gold
    A(t[1314], a[15702]); -- Ruby Lifeshrine Loop Advanced: Bronze
    A(t[1314], a[15703]); -- Ruby Lifeshrine Loop Advanced: Silver
    A(t[1314], a[15704]); -- Ruby Lifeshrine Loop Advanced: Gold
    t[1318] = c:New(k.L["Uktulut Coaster"]); -- Uktulut Coaster
    C(t[1310], t[1318]);
    A(t[1318], a[15736]); -- Uktulut Coaster: Bronze
    A(t[1318], a[15737]); -- Uktulut Coaster: Silver
    A(t[1318], a[15738]); -- Uktulut Coaster: Gold
    A(t[1318], a[15739]); -- Uktulut Coaster Advanced: Bronze
    A(t[1318], a[15740]); -- Uktulut Coaster Advanced: Silver
    A(t[1318], a[15741]); -- Uktulut Coaster Advanced: Gold
    t[1321] = c:New(k.L["Wild Preserve Circuit"]); -- Wild Preserve Circuit
    C(t[1310], t[1321]);
    A(t[1321], a[15718]); -- Wild Preserve Circuit: Bronze
    A(t[1321], a[15719]); -- Wild Preserve Circuit: Silver
    A(t[1321], a[15720]); -- Wild Preserve Circuit: Gold
    A(t[1321], a[15721]); -- Wild Preserve Circuit Advanced: Bronze
    A(t[1321], a[15722]); -- Wild Preserve Circuit Advanced: Silver
    A(t[1321], a[15723]); -- Wild Preserve Circuit Advanced: Gold
    t[1315] = c:New(k.L["Wild Preserve Slalom"]); -- Wild Preserve Slalom
    C(t[1310], t[1315]);
    A(t[1315], a[15712]); -- Wild Preserve Slalom: Bronze
    A(t[1315], a[15713]); -- Wild Preserve Slalom: Silver
    A(t[1315], a[15714]); -- Wild Preserve Slalom: Gold
    A(t[1315], a[15715]); -- Wild Preserve Slalom Advanced: Bronze
    A(t[1315], a[15716]); -- Wild Preserve Slalom Advanced: Silver
    A(t[1315], a[15717]); -- Wild Preserve Slalom Advanced: Gold
    t[1319] = c:New(k.L["Wingrest Roundabout"]); -- Wingrest Roundabout
    C(t[1310], t[1319]);
    A(t[1319], a[15742]); -- Wingrest Roundabout: Bronze
    A(t[1319], a[15743]); -- Wingrest Roundabout: Silver
    A(t[1319], a[15744]); -- Wingrest Roundabout: Gold
    A(t[1319], a[15745]); -- Wingrest Roundabout Advanced: Bronze
    A(t[1319], a[15746]); -- Wingrest Roundabout Advanced: Silver
    A(t[1319], a[15747]); -- Wingrest Roundabout Advanced: Gold
    t[1363] = c:New(k.L["Primal Storms"], true); -- Primal Storms
    C(t[1232], t[1363]);
    A(t[1363], a[16463]); -- Thunderstorms in The Waking Shores
    A(t[1363], a[16465]); -- Sandstorms in The Waking Shores
    A(t[1363], a[16466]); -- Firestorms in The Waking Shores
    A(t[1363], a[16467]); -- Snowstorms in The Waking Shores
    A(t[1363], a[16468]); -- Chasing Storms in The Waking Shores
    t[1233] = c:New(k.GetMapName(2023)); -- Ohn'ahran Plains
    C(t[1228], t[1233]);
    t[1238] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1233], t[1238]);
    A(t[1238], a[15394]); -- Ohn'a'Roll
    A(t[1238], a[16405]); -- Sojourner of Ohn'ahran Plains
    A(t[1238], a[16574]); -- Sleeping on the Job
    t[1243] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1233], t[1243]);
    A(t[1243], a[16457]); -- Explore the Ohn'ahran Plains
    A(t[1243], a[16677]); -- Adventurer of the Ohn'ahran Plains
    A(t[1243], a[16299]); -- Treasures of the Ohn'ahran Plains
    A(t[1243], a[16423]); -- Honor Our Ancestors
    A(t[1243], a[16424]); -- Who's a Good Bakar?
    A(t[1243], a[16462]); -- The Ohn'ahran Trail
    A(t[1243], a[16493]); -- Grand Theft Mammoth
    A(t[1243], a[16736]); -- Grand Theft Mammoth
    A(t[1243], a[16583]); -- Knew You Nokhud Do It!
    t[1249] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1233], t[1249]);
    A(t[1249], a[16595]); -- Tour of Duty: Ohn'ahran Plains
    t[1253] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1233], t[1253]);
    A(t[1253], a[16443]); -- Soupervisor
    A(t[1253], a[16528]); -- Joining the Khansguard
    A(t[1253], a[16544]); -- Grand Hunter
    A(t[1253], a[16540]); -- Hunt Master
    A(t[1253], a[16545]); -- The Best at What I Do
    A(t[1253], a[16541]); -- Longhunter
    A(t[1253], a[16542]); -- The Disgruntled Hunter
    A(t[1253], a[16543]); -- Tetrachromancer
    t[1307] = c:New(k.L["Dragon Glyphs"], true); -- Dragon Glyphs
    C(t[1233], t[1307]);
    A(t[1307], a[16061]); -- Dragon Glyphs: Dragonsprings Summit
    A(t[1307], a[16056]); -- Dragon Glyphs: Emerald Gardens
    A(t[1307], a[16671]); -- Dragon Glyphs: Mirewood Fen
    A(t[1307], a[16059]); -- Dragon Glyphs: Mirror of the Sky
    A(t[1307], a[16055]); -- Dragon Glyphs: Nokhudon Hold
    A(t[1307], a[16054]); -- Dragon Glyphs: Ohn'ahra's Roost
    A(t[1307], a[16060]); -- Dragon Glyphs: Ohn'iri Springs
    A(t[1307], a[16670]); -- Dragon Glyphs: Rubyscale Outpost
    A(t[1307], a[16062]); -- Dragon Glyphs: Rusza'thar Reach
    A(t[1307], a[16058]); -- Dragon Glyphs: Szar Skeleth
    A(t[1307], a[16057]); -- Dragon Glyphs: The Eternal Kurgans
    A(t[1307], a[16063]); -- Dragon Glyphs: Windsong Rise
    A(t[1307], a[16576]); -- Ohn'ahran Plains Glyph Hunter
    t[1311] = c:New(k.L["Dragon Racing"], true); -- Dragon Racing
    C(t[1233], t[1311]);
    A(t[1311], a[15918]); -- Ohn'ahran Plains: Bronze
    A(t[1311], a[15919]); -- Ohn'ahran Plains: Silver
    A(t[1311], a[15920]); -- Ohn'ahran Plains: Gold
    A(t[1311], a[15930]); -- Ohn'ahran Plains Advanced: Bronze
    A(t[1311], a[15931]); -- Ohn'ahran Plains Advanced: Silver
    A(t[1311], a[15932]); -- Ohn'ahran Plains Advanced: Gold
    t[1325] = c:New(k.L["Emerald Garden Ascent"]); -- Emerald Garden Ascent
    C(t[1311], t[1325]);
    A(t[1325], a[15775]); -- Emerald Garden Ascent: Bronze
    A(t[1325], a[15776]); -- Emerald Garden Ascent: Silver
    A(t[1325], a[15777]); -- Emerald Garden Ascent: Gold
    A(t[1325], a[15778]); -- Emerald Garden Ascent Advanced: Bronze
    A(t[1325], a[15779]); -- Emerald Garden Ascent Advanced: Silver
    A(t[1325], a[15780]); -- Emerald Garden Ascent Advanced: Gold
    t[1323] = c:New(k.L["Fen Flythrough"]); -- Fen Flythrough
    C(t[1311], t[1323]);
    A(t[1323], a[15763]); -- Fen Flythrough: Bronze
    A(t[1323], a[15764]); -- Fen Flythrough: Silver
    A(t[1323], a[15765]); -- Fen Flythrough: Gold
    A(t[1323], a[15766]); -- Fen Flythrough Advanced: Bronze
    A(t[1323], a[15767]); -- Fen Flythrough Advanced: Silver
    A(t[1323], a[15768]); -- Fen Flythrough Advanced: Gold
    t[1328] = c:New(k.L["Maruukai Dash"]); -- Maruukai Dash
    C(t[1311], t[1328]);
    A(t[1328], a[15782]); -- Maruukai Dash: Bronze
    A(t[1328], a[15783]); -- Maruukai Dash: Silver
    A(t[1328], a[15784]); -- Maruukai Dash: Gold
    t[1327] = c:New(k.L["Mirror of the Sky Dash"]); -- Mirror of the Sky Dash
    C(t[1311], t[1327]);
    A(t[1327], a[15785]); -- Mirror of the Sky Dash: Bronze
    A(t[1327], a[15786]); -- Mirror of the Sky Dash: Silver
    A(t[1327], a[15787]); -- Mirror of the Sky Dash: Gold
    t[1324] = c:New(k.L["Ravine River Run"]); -- Ravine River Run
    C(t[1311], t[1324]);
    A(t[1324], a[15769]); -- Ravine River Run: Bronze
    A(t[1324], a[15770]); -- Ravine River Run: Silver
    A(t[1324], a[15771]); -- Ravine River Run: Gold
    A(t[1324], a[15772]); -- Ravine River Run Advanced: Bronze
    A(t[1324], a[15773]); -- Ravine River Run Advanced: Silver
    A(t[1324], a[15774]); -- "Ravine River Ru, Advanced: Gold"
    t[1326] = c:New(k.L["River Rapids Route"]); -- River Rapids Route
    C(t[1311], t[1326]);
    A(t[1326], a[16302]); -- River Rapids Route: Bronze
    A(t[1326], a[16303]); -- River Rapids Route: Silver
    A(t[1326], a[16304]); -- River Rapids Route: Gold
    A(t[1326], a[16305]); -- River Rapids Route Advanced: Bronze
    A(t[1326], a[16306]); -- River Rapids Route Advanced: Silver
    A(t[1326], a[16307]); -- River Rapids Route Advanced: Gold
    t[1322] = c:New(k.L["Sundapple Copse Circuit"]); -- Sundapple Copse Circuit
    C(t[1311], t[1322]);
    A(t[1322], a[15757]); -- Sundapple Copse Circuit: Bronze
    A(t[1322], a[15758]); -- Sundapple Copse Circuit: Silver
    A(t[1322], a[15759]); -- Sundapple Copse Circuit: Gold
    A(t[1322], a[15760]); -- Sundapple Copse Circuit Advanced: Bronze
    A(t[1322], a[15761]); -- Sundapple Copse Circuit Advanced: Silver
    A(t[1322], a[15762]); -- Sundapple Copse Circuit Advanced: Gold
    t[1364] = c:New(k.L["Primal Storms"], true); -- Primal Storms
    C(t[1233], t[1364]);
    A(t[1364], a[16475]); -- Thunderstorms in the Ohn'ahran Plains
    A(t[1364], a[16476]); -- Chasing Storms in the Ohn'ahran Plains
    A(t[1364], a[16477]); -- Sandstorms in the Ohn'ahran Plains
    A(t[1364], a[16478]); -- Firestorms in the Ohn'ahran Plains
    A(t[1364], a[16479]); -- Snowstorms in the Ohn'ahran Plains
    t[1234] = c:New(k.GetMapName(2024)); -- The Azure Span
    C(t[1228], t[1234]);
    t[1239] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1234], t[1239]);
    A(t[1239], a[16336]); -- Azure Spanner
    A(t[1239], a[16428]); -- Sojourner of Azure Span
    A(t[1239], a[15889]); -- River Rapids Wrangler
    A(t[1239], a[16580]); -- Lend a Helping Span
    t[1245] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1234], t[1245]);
    A(t[1245], a[16460]); -- Explore the Azure Span
    A(t[1245], a[16678]); -- Adventurer of The Azure Span
    A(t[1245], a[16300]); -- Treasures of The Azure Span
    A(t[1245], a[16474]); -- Do You Wanna Build a Snowman?
    A(t[1245], a[16569]); -- Cobalt Enthusiast
    A(t[1245], a[16638]); -- Ley Line in the Span
    A(t[1245], a[16622]); -- Three Minutes or It's Free
    A(t[1245], a[16581]); -- Seeing Blue
    t[1250] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1234], t[1250]);
    A(t[1250], a[16594]); -- Tour of Duty: The Azure Span
    t[1256] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1234], t[1256]);
    A(t[1256], a[16529]); -- Joining the Community
    A(t[1256], a[16533]); -- Lots of Lunkers
    A(t[1256], a[16531]); -- A Whole Heap of Lunkers
    A(t[1256], a[16546]); -- What's Down There?
    A(t[1256], a[16547]); -- Pulled!
    A(t[1256], a[16548]); -- It Takes a Tuskarr Buddy
    A(t[1256], a[16550]); -- Giving Back to Nature
    A(t[1256], a[16551]); -- Giving More Back to Nature
    A(t[1256], a[16552]); -- Giving Even More Back to Nature
    A(t[1256], a[16553]); -- Taking From Nature
    A(t[1256], a[16561]); -- "Lunkers, Lunkers Everywhere"
    A(t[1256], a[16562]); -- That's not a Fish...
    A(t[1256], a[16563]); -- We're Going to Need a Bigger Harpoon
    A(t[1256], a[16564]); -- It Takes a Tuskarr Family
    A(t[1256], a[16565]); -- It Takes a Tuskarr Village
    A(t[1256], a[16537]); -- Maximum Power!
    A(t[1256], a[16317]); -- Secret Fishing Spots
    A(t[1256], a[16321]); -- Cutting Tusk Equipment
    A(t[1256], a[16322]); -- Best in Slot
    A(t[1256], a[16444]); -- Leftovers' Revenge
    t[1308] = c:New(k.L["Dragon Glyphs"], true); -- Dragon Glyphs
    C(t[1234], t[1308]);
    A(t[1308], a[16065]); -- Dragon Glyphs: Azure Archives
    A(t[1308], a[16068]); -- Dragon Glyphs: Brackenhide Hollow
    A(t[1308], a[16064]); -- Dragon Glyphs: Cobalt Assembly
    A(t[1308], a[16069]); -- Dragon Glyphs: Creektooth Den
    A(t[1308], a[16672]); -- Dragon Glyphs: Forkriver Crossing
    A(t[1308], a[16070]); -- Dragon Glyphs: Imbu
    A(t[1308], a[16072]); -- Dragon Glyphs: Rhonin's Shield
    A(t[1308], a[16067]); -- Dragon Glyphs: Lost Ruins
    A(t[1308], a[16066]); -- Dragon Glyphs: Ruins of Karnthar
    A(t[1308], a[16673]); -- Dragon Glyphs: The Fallen Course
    A(t[1308], a[16073]); -- Dragon Glyphs: Vakthros Range
    A(t[1308], a[16071]); -- Dragon Glyphs: Zelthrak Outpost
    A(t[1308], a[16577]); -- Azure Span Glyph Hunter
    t[1312] = c:New(k.L["Dragon Racing"], true); -- Dragon Racing
    C(t[1234], t[1312]);
    A(t[1312], a[15921]); -- Azure Span: Bronze
    A(t[1312], a[15922]); -- Azure Span: Silver
    A(t[1312], a[15923]); -- Azure Span: Gold
    A(t[1312], a[15933]); -- Azure Span Advanced: Bronze
    A(t[1312], a[15934]); -- Azure Span Advanced: Silver
    A(t[1312], a[15935]); -- Azure Span Advanced: Gold
    t[1334] = c:New(k.L["Archive Ambit"]); -- Archive Ambit
    C(t[1312], t[1334]);
    A(t[1334], a[15847]); -- Archive Ambit: Bronze
    A(t[1334], a[15848]); -- Archive Ambit: Silver
    A(t[1334], a[15849]); -- Archive Ambit: Gold
    A(t[1334], a[15850]); -- Archive Ambit Advanced: Bronze
    A(t[1334], a[15851]); -- Archive Ambit Advanced: Silver
    A(t[1334], a[15852]); -- Archive Ambit Advanced: Gold
    t[1333] = c:New(k.L["Central Circuit"]); -- Central Circuit
    C(t[1312], t[1333]);
    A(t[1333], a[15841]); -- Frostland Flyover: Bronze
    A(t[1333], a[15842]); -- Frostland Flyover: Silver
    A(t[1333], a[15843]); -- Frostland Flyover: Gold
    A(t[1333], a[15844]); -- Frostland Flyover Advanced: Bronze
    A(t[1333], a[15845]); -- Frostland Flyover Advanced: Silver
    A(t[1333], a[15846]); -- Frostland Flyover Advanced: Gold
    t[1332] = c:New(k.L["Iskaara Flyover"]); -- Iskaara Flyover
    C(t[1312], t[1332]);
    A(t[1332], a[15835]); -- Iskaara Tour: Bronze
    A(t[1332], a[15836]); -- Iskaara Tour: Silver
    A(t[1332], a[15837]); -- Iskaara Tour: Gold
    A(t[1332], a[15838]); -- Iskaara Tour Advanced: Bronze
    A(t[1332], a[15839]); -- Iskaara Tour Advanced: Silver
    A(t[1332], a[15840]); -- Iskaara Tour Advanced: Gold
    t[1330] = c:New(k.L["The Azure Span Slalom"]); -- The Azure Span Slalom
    C(t[1312], t[1330]);
    A(t[1330], a[15799]); -- The Azure Span Slalom: Bronze
    A(t[1330], a[15800]); -- The Azure Span Slalom: Silver
    A(t[1330], a[15801]); -- The Azure Span Slalom: Gold
    A(t[1330], a[15802]); -- The Azure Span Slalom Advanced: Bronze
    A(t[1330], a[15803]); -- The Azure Span Slalom Advanced: Silver
    A(t[1330], a[15804]); -- The Azure Span Slalom Advanced: Gold
    t[1329] = c:New(k.L["The Azure Span Sprint"]); -- The Azure Span Sprint
    C(t[1312], t[1329]);
    A(t[1329], a[15788]); -- The Azure Span Sprint: Bronze
    A(t[1329], a[15789]); -- The Azure Span Sprint: Silver
    A(t[1329], a[15790]); -- The Azure Span Sprint: Gold
    A(t[1329], a[15791]); -- The Azure Span Sprint Advanced: Bronze
    A(t[1329], a[15792]); -- The Azure Span Sprint Advanced: Silver
    A(t[1329], a[15793]); -- The Azure Span Sprint Advanced: Gold
    t[1331] = c:New(k.L["The Vakthros Ascent"]); -- The Vakthros Ascent
    C(t[1312], t[1331]);
    A(t[1331], a[15818]); -- The Vakthros Ascent: Bronze
    A(t[1331], a[15819]); -- The Vakthros Ascent: Silver
    A(t[1331], a[15820]); -- The Vakthros Ascent: Gold
    A(t[1331], a[15821]); -- The Vakthros Ascent Advanced: Bronze
    A(t[1331], a[15822]); -- The Vakthros Ascent Advanced: Silver
    A(t[1331], a[15823]); -- The Vakthros Ascent Advanced: Gold
    t[1365] = c:New(k.L["Primal Storms"], true); -- Primal Storms
    C(t[1234], t[1365]);
    A(t[1365], a[16480]); -- Thunderstorms in The Azure Span
    A(t[1365], a[16481]); -- Sandstorms in The Azure Span
    A(t[1365], a[16482]); -- Firestorms in The Azure Span
    A(t[1365], a[16483]); -- Snowstorms in The Azure Span
    A(t[1365], a[16484]); -- Chasing Storms in The Azure Span
    t[1235] = c:New(k.GetMapName(2025)); -- Thaldraszus
    C(t[1228], t[1235]);
    t[1240] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1235], t[1240]);
    A(t[1240], a[16363]); -- Just Don't Ask Me to Spell It
    A(t[1240], a[16398]); -- Sojourner of Thaldraszus
    t[1246] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1235], t[1246]);
    A(t[1246], a[16518]); -- Explore Thaldraszus
    A(t[1246], a[16679]); -- Adventurer of Thaldraszus
    A(t[1246], a[16301]); -- Treasures of Thaldraszus
    A(t[1246], a[16634]); -- Framing a New Perspective
    A(t[1246], a[16621]); -- "One of Everything, Please"
    t[1251] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1235], t[1251]);
    A(t[1251], a[16593]); -- Tour of Duty: Thaldraszus
    t[1255] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1235], t[1255]);
    t[1309] = c:New(k.L["Dragon Glyphs"], true); -- Dragon Glyphs
    C(t[1235], t[1309]);
    A(t[1309], a[16104]); -- Dragon Glyphs: Algeth'ar Academy
    A(t[1309], a[16102]); -- Dragon Glyphs: Algeth'era
    A(t[1309], a[16666]); -- Dragon Glyphs: Gelikyr Overlook
    A(t[1309], a[16667]); -- Dragon Glyphs: Passage of Time
    A(t[1309], a[16100]); -- Dragon Glyphs: South Hold Gate
    A(t[1309], a[16099]); -- Dragon Glyphs: Stormshroud Peak
    A(t[1309], a[16098]); -- Dragon Glyphs: Temporal Conflux
    A(t[1309], a[16107]); -- Dragon Glyphs: Thaldraszus Apex
    A(t[1309], a[16103]); -- Dragon Glyphs: Tyrhold
    A(t[1309], a[16101]); -- Dragon Glyphs: Valdrakken
    A(t[1309], a[16106]); -- Dragon Glyphs: Vault of the Incarnates
    A(t[1309], a[16105]); -- Dragon Glyphs: Veiled Ossuary
    A(t[1309], a[16578]); -- Thaldraszus Glyph Hunter
    t[1313] = c:New(k.L["Dragon Racing"], true); -- Dragon Racing
    C(t[1235], t[1313]);
    A(t[1313], a[15924]); -- Thaldraszus: Bronze
    A(t[1313], a[15925]); -- Thaldraszus: Silver
    A(t[1313], a[15926]); -- Thaldraszus: Gold
    A(t[1313], a[15936]); -- Thaldraszus Advanced: Bronze
    A(t[1313], a[15937]); -- Thaldraszus Advanced: Silver
    A(t[1313], a[15938]); -- Thaldraszus Advanced: Gold
    t[1338] = c:New(k.L["Academy Ascent"]); -- Academy Ascent
    C(t[1313], t[1338]);
    A(t[1338], a[15897]); -- Academy Ascent: Bronze
    A(t[1338], a[15898]); -- Academy Ascent: Silver
    A(t[1338], a[15899]); -- Academy Ascent: Gold
    A(t[1338], a[15900]); -- Academy Ascent Advanced: Bronze
    A(t[1338], a[15901]); -- Academy Ascent Advanced: Silver
    A(t[1338], a[15902]); -- Academy Ascent Advanced: Gold
    t[1340] = c:New(k.L["Caverns Criss-Cross"]); -- Caverns Criss-Cross
    C(t[1313], t[1340]);
    A(t[1340], a[15909]); -- Caverns Criss-Cross: Bronze
    A(t[1340], a[15910]); -- Caverns Criss-Cross: Silver
    A(t[1340], a[15911]); -- Caverns Criss-Cross: Gold
    A(t[1340], a[15912]); -- Caverns Criss-Cross Advanced: Bronze
    A(t[1340], a[15913]); -- Caverns Criss-Cross Advanced: Silver
    A(t[1340], a[15914]); -- Caverns Criss-Cross Advanced: Gold
    t[1337] = c:New(k.L["Cliffside Circuit"]); -- Cliffside Circuit
    C(t[1313], t[1337]);
    A(t[1337], a[15891]); -- Cliffside Circuit: Bronze
    A(t[1337], a[15892]); -- Cliffside Circuit: Silver
    A(t[1337], a[15893]); -- Cliffside Circuit: Gold
    A(t[1337], a[15894]); -- Cliffside Circuit Advanced: Bronze
    A(t[1337], a[15895]); -- Cliffside Circuit Advanced: Silver
    A(t[1337], a[15896]); -- Cliffside Circuit Advanced: Gold
    t[1339] = c:New(k.L["Garden Gallivant"]); -- Garden Gallivant
    C(t[1313], t[1339]);
    A(t[1339], a[15903]); -- Garden Gallivant: Bronze
    A(t[1339], a[15904]); -- Garden Gallivant: Silver
    A(t[1339], a[15905]); -- Garden Gallivant: Gold
    A(t[1339], a[15906]); -- Garden Gallivant Advanced: Bronze
    A(t[1339], a[15907]); -- Garden Gallivant Advanced: Silver
    A(t[1339], a[15908]); -- Garden Gallivant Advanced: Gold
    t[1336] = c:New(k.L["Passage Pathway"]); -- Passage Pathway
    C(t[1313], t[1336]);
    A(t[1336], a[15855]); -- Tyrhold Trial: Bronze
    A(t[1336], a[15856]); -- Tyrhold Trial: Silver
    A(t[1336], a[15857]); -- Tyrhold Trial: Gold
    A(t[1336], a[15858]); -- Tyrhold Trial Advanced: Bronze
    A(t[1336], a[15859]); -- Tyrhold Trial Advanced: Silver
    A(t[1336], a[15860]); -- Tyrhold Trial Advanced: Gold
    t[1335] = c:New(k.L["The Flowing Forest Flight"]); -- The Flowing Forest Flight
    C(t[1313], t[1335]);
    A(t[1335], a[15827]); -- The Flowing Forest Flight: Bronze
    A(t[1335], a[15828]); -- The Flowing Forest Flight: Silver
    A(t[1335], a[15829]); -- The Flowing Forest Flight: Gold
    A(t[1335], a[15830]); -- The Flowing Forest Flight Advanced: Bronze
    A(t[1335], a[15831]); -- The Flowing Forest Flight Advanced: Silver
    A(t[1335], a[15832]); -- The Flowing Forest Flight Advanced: Gold
    t[1366] = c:New(k.L["Primal Storms"], true); -- Primal Storms
    C(t[1235], t[1366]);
    A(t[1366], a[16485]); -- Thunderstorms in Thaldraszus
    A(t[1366], a[16486]); -- Sandstorms in Thaldraszus
    A(t[1366], a[16487]); -- Firestorms in Thaldraszus
    A(t[1366], a[16488]); -- Snowstorms in Thaldraszus
    A(t[1366], a[16489]); -- Chasing Storms in Thaldraszus
    t[1236] = c:New(k.GetMapName(2107)); -- The Forbidden Reach
    C(t[1228], t[1236]);
    t[1241] = c:New(k.GetCategoryInfoTitle(96), true); -- Quests
    C(t[1236], t[1241]);
    A(t[1241], a[15325]); -- "Dracthyr, Awaken"
    A(t[1241], a[15638]); -- "Dracthyr, Awaken"
    t[1244] = c:New(k.GetCategoryInfoTitle(97), true); -- Exploration
    C(t[1236], t[1244]);
    A(t[1244], a[16452]); -- Famliar Skies
    t[1252] = c:New(k.GetCategoryInfoTitle(95), true); -- PvP
    C(t[1236], t[1252]);
    t[1254] = c:New(k.GetCategoryInfoTitle(201), true); -- Reputation
    C(t[1236], t[1254]);
    t[1229] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[1207], t[1229]);
    A(t[1229], a[16294]); -- Dragonflight Dungeon Hero
    A(t[1229], a[16339]); -- Myths of the Dragonflight Dungeons
    A(t[1229], a[16295]); -- Glory of the Dragonflight Hero
    A(t[1229], a[16647]); -- Dragonflight Keystone Explorer: Season One
    A(t[1229], a[16648]); -- Dragonflight Keystone Conqueror: Season One
    A(t[1229], a[16649]); -- Dragonflight Keystone Master: Season One
    A(t[1229], a[16650]); -- Dragonflight Keystone Hero: Season One
    A(t[1229], a[16429]); -- Thundering Hero: Dragonflight Season 1
    A(t[1229], a[17119]); -- Deep Cuts From the Vault
    t[1257] = c:New(k.GetInstanceInfoName(1201)); -- Algeth'ar Academy
    C(t[1229], t[1257]);
    A(t[1257], a[16434]); -- See Me After Class
    A(t[1257], a[16329]); -- "Duck, Duck, Spruce!"
    A(t[1257], a[16441]); -- Squad Goals
    A(t[1257], a[16269]); -- Algeth'ar Academy
    A(t[1257], a[16270]); -- Heroic: Algeth'ar Academy
    A(t[1257], a[16271]); -- Mythic: Algeth'ar Academy
    A(t[1257], a[16643]); -- Keystone Hero: Algeth'ar Academy
    t[1258] = c:New(k.GetInstanceInfoName(1196)); -- Brackenhide Hollow
    C(t[1229], t[1258]);
    A(t[1258], a[16110]); -- Subscribed to Hyena Facts
    A(t[1258], a[16296]); -- Growlbossify
    A(t[1258], a[16430]); -- "All Bark, All Bite"
    A(t[1258], a[16404]); -- So You Can Kill This in a Way That Matters...
    A(t[1258], a[16762]); -- The Vegetarian Diet
    A(t[1258], a[16255]); -- Brackenhide Hollow
    A(t[1258], a[16256]); -- Heroic: Brackenhide Hollow
    A(t[1258], a[16257]); -- Mythic: Brackenhide Hollow
    A(t[1258], a[16642]); -- Keystone Hero: Brackenhide Hollow
    t[1259] = c:New(k.GetInstanceInfoName(1204)); -- Halls of Infusion
    C(t[1229], t[1259]);
    A(t[1259], a[16426]); -- Hungry Hungry Hornswog
    A(t[1259], a[16427]); -- Go With the Flow
    A(t[1259], a[16517]); -- Toxicity Strike Team
    A(t[1259], a[16260]); -- Halls of Infusion
    A(t[1259], a[16261]); -- Heroic: Halls of Infusion
    A(t[1259], a[16262]); -- Mythic: Halls of Infusion
    A(t[1259], a[16646]); -- Keystone Hero: Halls of Infusion
    t[1260] = c:New(k.GetInstanceInfoName(1199)); -- Neltharus
    C(t[1229], t[1260]);
    A(t[1260], a[16438]); -- Knowledge is... Preserved?
    A(t[1260], a[16432]); -- Ready for Raiding VIII
    A(t[1260], a[16453]); -- Liquid Hot Magma
    A(t[1260], a[16440]); -- Are You My Broodmother?
    A(t[1260], a[16263]); -- Neltharus
    A(t[1260], a[16264]); -- Heroic: Neltharus
    A(t[1260], a[16265]); -- Mythic: Neltharus
    A(t[1260], a[16644]); -- Keystone Hero: Neltharus
    t[1261] = c:New(k.GetInstanceInfoName(1202)); -- Ruby Life Pools
    C(t[1229], t[1261]);
    A(t[1261], a[16402]); -- Dragon Kill Points
    A(t[1261], a[16320]); -- Does Steam Do Fire Damage?
    A(t[1261], a[16266]); -- Ruby Life Pools
    A(t[1261], a[16267]); -- Heroic: Ruby Life Pools
    A(t[1261], a[16268]); -- Mythic: Ruby Life Pools
    A(t[1261], a[16640]); -- Keystone Hero: Ruby Life Pools
    t[1262] = c:New(k.GetInstanceInfoName(1203)); -- The Azure Vault
    C(t[1229], t[1262]);
    A(t[1262], a[16445]); -- Icy What You Did There
    A(t[1262], a[16331]); -- The Cracked Crystal
    A(t[1262], a[16330]); -- You Must Be Made of Hide
    A(t[1262], a[16272]); -- The Azure Vault
    A(t[1262], a[16273]); -- Heroic: The Azure Vault
    A(t[1262], a[16274]); -- Mythic: The Azure Vault
    A(t[1262], a[16645]); -- Keystone Hero: The Azure Vault
    t[1263] = c:New(k.GetInstanceInfoName(1198)); -- The Nokhud Offensive
    C(t[1229], t[1263]);
    A(t[1263], a[16447]); -- What Are The Chances...
    A(t[1263], a[16456]); -- Weapons of the Maruukai
    A(t[1263], a[16602]); -- Nokhud Deed Goes Unnoticed
    A(t[1263], a[16620]); -- Ohuna Incubation
    A(t[1263], a[16275]); -- The Nokhud Offensive
    A(t[1263], a[16276]); -- Heroic: The Nokhud Offensive
    A(t[1263], a[16277]); -- Mythic: The Nokhud Offensive
    A(t[1263], a[16641]); -- Keystone Hero: The Nokhud Offensive
    t[1264] = c:New(k.GetInstanceInfoName(1197)); -- Uldaman: Legacy of Tyr
    C(t[1229], t[1264]);
    A(t[1264], a[16337]); -- It's a Trogg Eat Trogg World
    A(t[1264], a[16282]); -- "No, You're Stunning!"
    A(t[1264], a[16281]); -- Like Sands Through the Hourglass
    A(t[1264], a[16278]); -- Uldaman: Legacy of Tyr
    A(t[1264], a[16279]); -- Heroic: Uldaman: Legacy of Tyr
    A(t[1264], a[16280]); -- Mythic: Uldaman: Legacy of Tyr
    A(t[1264], a[16639]); -- Keystone Hero: Uldaman: Legacy of Tyr
    t[1230] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1207], t[1230]);
    A(t[1230], a[16355]); -- Glory of the Vault Raider
    t[1265] = c:New(k.GetInstanceInfoName(1200)); -- Vault of the Incarnates
    C(t[1230], t[1265]);
    A(t[1265], a[17110]); -- The Primal Bulwark
    A(t[1265], a[17111]); -- Caverns of Infusion
    A(t[1265], a[17112]); -- Fury of the Storm
    A(t[1265], a[16343]); -- Vault of the Incarnates
    A(t[1265], a[16345]); -- Heroic: Vault of the Incarnates
    A(t[1265], a[16354]); -- Mythic: Vault of the Incarnates
    A(t[1265], a[17107]); -- Ahead of the Curve: Raszageth the Storm-Eater
    A(t[1265], a[17108]); -- Cutting Edge: Raszageth the Storm-Eater
    A(t[1265], a[16395]); -- Vaulternative Fashion
    A(t[1265], a[17119]); -- Deep Cuts From the Vault
    t[1266] = c:New(k.L["Glory"]); -- Glory
    C(t[1265], t[1266]);
    A(t[1266], a[16335]); -- What Frozen Things Do
    A(t[1266], a[16365]); -- Little Friends
    A(t[1266], a[16364]); -- The Lunker Below
    A(t[1266], a[16419]); -- I Was Saving That For Later
    A(t[1266], a[16458]); -- Nothing But Air
    A(t[1266], a[16450]); -- The Power is MINE!
    A(t[1266], a[16442]); -- Incubation Extermination
    A(t[1266], a[16451]); -- The Ol Raszle Daszle
    t[1267] = c:New(k.L["Mythic"]); -- Mythic
    C(t[1265], t[1267]);
    A(t[1267], a[16346]); -- Mythic: Eranog
    A(t[1267], a[16347]); -- Mythic: Terros
    A(t[1267], a[16348]); -- Mythic: The Primal Council
    A(t[1267], a[16349]); -- "Mythic: Sennarth, The Cold Breath"
    A(t[1267], a[16350]); -- "Mythic: Dathea, Ascended"
    A(t[1267], a[16351]); -- Mythic: Kurog Grimtotem
    A(t[1267], a[16352]); -- Mythic: Broodkeeper Diurna
    A(t[1267], a[16353]); -- Mythic: Raszageth the Storm-Eater
    t[1231] = c:New(k.GetCategoryInfoTitle(15117)); -- Pet Battles
    C(t[1207], t[1231]);
    A(t[1231], a[16519]); -- Dragon Isles Safari
    A(t[1231], a[16464]); -- Battle on the Dragon Isles
    A(t[1231], a[16501]); -- Aquatic Battler of the Dragon Isles
    A(t[1231], a[16503]); -- Beast Battler of the Dragon Isles
    A(t[1231], a[16504]); -- Critter Battler of the Dragon Isles
    A(t[1231], a[16505]); -- Dragonkin Battler of the Dragon Isles
    A(t[1231], a[16506]); -- Elemental Battler of the Dragon Isles
    A(t[1231], a[16507]); -- Flying Battler of the Dragon Isles
    A(t[1231], a[16508]); -- Humanoid Battler of the Dragon Isles
    A(t[1231], a[16509]); -- Magic Battler of the Dragon Isles
    A(t[1231], a[16510]); -- Mechanical Battler of the Dragon Isles
    A(t[1231], a[16511]); -- Undead Battler of the Dragon Isles
    A(t[1231], a[16512]); -- Family Battler of the Dragon Isles
    A(t[1231], a[16399]); -- Lovin' Lubbins
    A(t[1231], a[16731]); -- Court is Now in Session
    t[1268] = c:New(k.L["Dragonriding"]); -- Dragonriding
    C(t[1207], t[1268]);
    A(t[1268], a[15794]); -- A New Friend
    A(t[1268], a[15795]); -- Together in the Skies
    A(t[1268], a[15797]); -- An Azure Ally
    A(t[1268], a[15796]); -- Cliffside Companion
    t[1302] = c:New(k.GetMapName(2022), true); -- The Waking Shores
    C(t[1268], t[1302]);
    A(t[1302], a[15991]); -- Dragon Glyphs: Crumbling Life Archway
    A(t[1302], a[16051]); -- Dragon Glyphs: Dragonheart Outpost
    A(t[1302], a[16669]); -- Dragon Glyphs: Flashfrost Enclave
    A(t[1302], a[15990]); -- Dragon Glyphs: Life-Binder Observatory
    A(t[1302], a[15987]); -- Dragon Glyphs: Obsidian Bulwark
    A(t[1302], a[16053]); -- Dragon Glyphs: Obsidian Throne
    A(t[1302], a[15988]); -- Dragon Glyphs: Ruby Life Pools Peaks
    A(t[1302], a[16052]); -- Dragon Glyphs: Scalecracker Peak
    A(t[1302], a[16668]); -- Dragon Glyphs: Skytop Observatory Rostrum
    A(t[1302], a[15985]); -- Dragon Glyphs: Skytop Observatory Tower
    A(t[1302], a[15989]); -- Dragon Glyphs: The Overflowing Spring
    A(t[1302], a[15986]); -- Dragon Glyphs: Wingrest Embassy
    A(t[1302], a[16575]); -- Waking Shores Glyph Hunter
    t[1303] = c:New(k.GetMapName(2023), true); -- Ohn'ahran Plains
    C(t[1268], t[1303]);
    A(t[1303], a[16061]); -- Dragon Glyphs: Dragonsprings Summit
    A(t[1303], a[16056]); -- Dragon Glyphs: Emerald Gardens
    A(t[1303], a[16671]); -- Dragon Glyphs: Mirewood Fen
    A(t[1303], a[16059]); -- Dragon Glyphs: Mirror of the Sky
    A(t[1303], a[16055]); -- Dragon Glyphs: Nokhudon Hold
    A(t[1303], a[16054]); -- Dragon Glyphs: Ohn'ahra's Roost
    A(t[1303], a[16060]); -- Dragon Glyphs: Ohn'iri Springs
    A(t[1303], a[16670]); -- Dragon Glyphs: Rubyscale Outpost
    A(t[1303], a[16062]); -- Dragon Glyphs: Rusza'thar Reach
    A(t[1303], a[16058]); -- Dragon Glyphs: Szar Skeleth
    A(t[1303], a[16057]); -- Dragon Glyphs: The Eternal Kurgans
    A(t[1303], a[16063]); -- Dragon Glyphs: Windsong Rise
    A(t[1303], a[16576]); -- Ohn'ahran Plains Glyph Hunter
    t[1304] = c:New(k.GetMapName(2024), true); -- The Azure Span
    C(t[1268], t[1304]);
    A(t[1304], a[16065]); -- Dragon Glyphs: Azure Archives
    A(t[1304], a[16068]); -- Dragon Glyphs: Brackenhide Hollow
    A(t[1304], a[16064]); -- Dragon Glyphs: Cobalt Assembly
    A(t[1304], a[16069]); -- Dragon Glyphs: Creektooth Den
    A(t[1304], a[16672]); -- Dragon Glyphs: Forkriver Crossing
    A(t[1304], a[16070]); -- Dragon Glyphs: Imbu
    A(t[1304], a[16072]); -- Dragon Glyphs: Rhonin's Shield
    A(t[1304], a[16067]); -- Dragon Glyphs: Lost Ruins
    A(t[1304], a[16066]); -- Dragon Glyphs: Ruins of Karnthar
    A(t[1304], a[16073]); -- Dragon Glyphs: Vakthros Range
    A(t[1304], a[16673]); -- Dragon Glyphs: The Fallen Course
    A(t[1304], a[16071]); -- Dragon Glyphs: Zelthrak Outpost
    A(t[1304], a[16577]); -- Azure Span Glyph Hunter
    t[1305] = c:New(k.GetMapName(2025), true); -- Thaldraszus
    C(t[1268], t[1305]);
    A(t[1305], a[16104]); -- Dragon Glyphs: Algeth'ar Academy
    A(t[1305], a[16102]); -- Dragon Glyphs: Algeth'era
    A(t[1305], a[16666]); -- Dragon Glyphs: Gelikyr Overlook
    A(t[1305], a[16667]); -- Dragon Glyphs: Passage of Time
    A(t[1305], a[16100]); -- Dragon Glyphs: South Hold Gate
    A(t[1305], a[16099]); -- Dragon Glyphs: Stormshroud Peak
    A(t[1305], a[16098]); -- Dragon Glyphs: Temporal Conflux
    A(t[1305], a[16107]); -- Dragon Glyphs: Thaldraszus Apex
    A(t[1305], a[16103]); -- Dragon Glyphs: Tyrhold
    A(t[1305], a[16101]); -- Dragon Glyphs: Valdrakken
    A(t[1305], a[16106]); -- Dragon Glyphs: Vault of the Incarnates
    A(t[1305], a[16105]); -- Dragon Glyphs: Veiled Ossuary
    A(t[1305], a[16578]); -- Thaldraszus Glyph Hunter
    t[1269] = c:New(k.L["Dragon Racing"]); -- Dragon Racing
    C(t[1207], t[1269]);
    A(t[1269], a[15939]); -- Dragon Racing Completionist
    A(t[1269], a[15940]); -- Dragon Racing Completionist: Silver
    A(t[1269], a[15941]); -- Dragon Racing Completionist: Gold
    t[1293] = c:New(k.GetMapName(2022)); -- The Waking Shores
    C(t[1269], t[1293]);
    A(t[1293], a[15915]); -- Waking Shores: Bronze
    A(t[1293], a[15916]); -- Waking Shores: Silver
    A(t[1293], a[15917]); -- Waking Shores: Gold
    A(t[1293], a[15927]); -- Waking Shores Advanced: Bronze
    A(t[1293], a[15928]); -- Waking Shores Advanced: Silver
    A(t[1293], a[15929]); -- Waking Shores Advanced: Gold
    t[1298] = c:New(k.L["Apex Canopy River Run"]); -- Apex Canopy River Run
    C(t[1293], t[1298]);
    A(t[1298], a[15730]); -- Apex Canopy River Run: Bronze
    A(t[1298], a[15731]); -- Apex Canopy River Run: Silver
    A(t[1298], a[15732]); -- Apex Canopy River Run: Gold
    A(t[1298], a[15733]); -- Apex Canopy River Run Advanced: Bronze
    A(t[1298], a[15734]); -- Apex Canopy River Run Advanced: Silver
    A(t[1298], a[15735]); -- Apex Canopy River Run Advanced: Gold
    t[1299] = c:New(k.L["Emberflow Flight"]); -- Emberflow Flight
    C(t[1293], t[1299]);
    A(t[1299], a[15724]); -- Emberflow Flight: Bronze
    A(t[1299], a[15725]); -- Emberflow Flight: Silver
    A(t[1299], a[15726]); -- Emberflow Flight: Gold
    A(t[1299], a[15727]); -- Emberflow Flight Advanced: Bronze
    A(t[1299], a[15728]); -- Emberflow Flight Advanced: Silver
    A(t[1299], a[15729]); -- Emberflow Flight Advanced: Gold
    t[1295] = c:New(k.L["Flashfrost Flyover"]); -- Flashfrost Flyover
    C(t[1293], t[1295]);
    A(t[1295], a[15705]); -- Flashfrost Flyover: Bronze
    A(t[1295], a[15706]); -- Flashfrost Flyover: Silver
    A(t[1295], a[15707]); -- Flashfrost Flyover: Gold
    A(t[1295], a[15709]); -- Flashfrost Flyover Advanced: Bronze
    A(t[1295], a[15710]); -- Flashfrost Flyover Advanced: Silver
    A(t[1295], a[15711]); -- Flashfrost Flyover Advanced: Gold
    t[1301] = c:New(k.L["Ruby Lifeshrine Loop"]); -- Ruby Lifeshrine Loop
    C(t[1293], t[1301]);
    A(t[1301], a[15696]); -- Ruby Lifeshrine Loop: Bronze
    A(t[1301], a[15697]); -- Ruby Lifeshrine Loop: Silver
    A(t[1301], a[15698]); -- Ruby Lifeshrine Loop: Gold
    A(t[1301], a[15702]); -- Ruby Lifeshrine Loop Advanced: Bronze
    A(t[1301], a[15703]); -- Ruby Lifeshrine Loop Advanced: Silver
    A(t[1301], a[15704]); -- Ruby Lifeshrine Loop Advanced: Gold
    t[1297] = c:New(k.L["Uktulut Coaster"]); -- Uktulut Coaster
    C(t[1293], t[1297]);
    A(t[1297], a[15736]); -- Uktulut Coaster: Bronze
    A(t[1297], a[15737]); -- Uktulut Coaster: Silver
    A(t[1297], a[15738]); -- Uktulut Coaster: Gold
    A(t[1297], a[15739]); -- Uktulut Coaster Advanced: Bronze
    A(t[1297], a[15740]); -- Uktulut Coaster Advanced: Silver
    A(t[1297], a[15741]); -- Uktulut Coaster Advanced: Gold
    t[1294] = c:New(k.L["Wild Preserve Circuit"]); -- Wild Preserve Circuit
    C(t[1293], t[1294]);
    A(t[1294], a[15718]); -- Wild Preserve Circuit: Bronze
    A(t[1294], a[15719]); -- Wild Preserve Circuit: Silver
    A(t[1294], a[15720]); -- Wild Preserve Circuit: Gold
    A(t[1294], a[15721]); -- Wild Preserve Circuit Advanced: Bronze
    A(t[1294], a[15722]); -- Wild Preserve Circuit Advanced: Silver
    A(t[1294], a[15723]); -- Wild Preserve Circuit Advanced: Gold
    t[1300] = c:New(k.L["Wild Preserve Slalom"]); -- Wild Preserve Slalom
    C(t[1293], t[1300]);
    A(t[1300], a[15712]); -- Wild Preserve Slalom: Bronze
    A(t[1300], a[15713]); -- Wild Preserve Slalom: Silver
    A(t[1300], a[15714]); -- Wild Preserve Slalom: Gold
    A(t[1300], a[15715]); -- Wild Preserve Slalom Advanced: Bronze
    A(t[1300], a[15716]); -- Wild Preserve Slalom Advanced: Silver
    A(t[1300], a[15717]); -- Wild Preserve Slalom Advanced: Gold
    t[1296] = c:New(k.L["Wingrest Roundabout"]); -- Wingrest Roundabout
    C(t[1293], t[1296]);
    A(t[1296], a[15742]); -- Wingrest Roundabout: Bronze
    A(t[1296], a[15743]); -- Wingrest Roundabout: Silver
    A(t[1296], a[15744]); -- Wingrest Roundabout: Gold
    A(t[1296], a[15745]); -- Wingrest Roundabout Advanced: Bronze
    A(t[1296], a[15746]); -- Wingrest Roundabout Advanced: Silver
    A(t[1296], a[15747]); -- Wingrest Roundabout Advanced: Gold
    t[1285] = c:New(k.GetMapName(2023)); -- Ohn'ahran Plains
    C(t[1269], t[1285]);
    A(t[1285], a[15918]); -- Ohn'ahran Plains: Bronze
    A(t[1285], a[15919]); -- Ohn'ahran Plains: Silver
    A(t[1285], a[15920]); -- Ohn'ahran Plains: Gold
    A(t[1285], a[15930]); -- Ohn'ahran Plains Advanced: Bronze
    A(t[1285], a[15931]); -- Ohn'ahran Plains Advanced: Silver
    A(t[1285], a[15932]); -- Ohn'ahran Plains Advanced: Gold
    t[1289] = c:New(k.L["Emerald Garden Ascent"]); -- Emerald Garden Ascent
    C(t[1285], t[1289]);
    A(t[1289], a[15775]); -- Emerald Garden Ascent: Bronze
    A(t[1289], a[15776]); -- Emerald Garden Ascent: Silver
    A(t[1289], a[15777]); -- Emerald Garden Ascent: Gold
    A(t[1289], a[15778]); -- Emerald Garden Ascent Advanced: Bronze
    A(t[1289], a[15779]); -- Emerald Garden Ascent Advanced: Silver
    A(t[1289], a[15780]); -- Emerald Garden Ascent Advanced: Gold
    t[1291] = c:New(k.L["Fen Flythrough"]); -- Fen Flythrough
    C(t[1285], t[1291]);
    A(t[1291], a[15763]); -- Fen Flythrough: Bronze
    A(t[1291], a[15764]); -- Fen Flythrough: Silver
    A(t[1291], a[15765]); -- Fen Flythrough: Gold
    A(t[1291], a[15766]); -- Fen Flythrough Advanced: Bronze
    A(t[1291], a[15767]); -- Fen Flythrough Advanced: Silver
    A(t[1291], a[15768]); -- Fen Flythrough Advanced: Gold
    t[1286] = c:New(k.L["Maruukai Dash"]); -- Maruukai Dash
    C(t[1285], t[1286]);
    A(t[1286], a[15782]); -- Maruukai Dash: Bronze
    A(t[1286], a[15783]); -- Maruukai Dash: Silver
    A(t[1286], a[15784]); -- Maruukai Dash: Gold
    t[1287] = c:New(k.L["Mirror of the Sky Dash"]); -- Mirror of the Sky Dash
    C(t[1285], t[1287]);
    A(t[1287], a[15785]); -- Mirror of the Sky Dash: Bronze
    A(t[1287], a[15786]); -- Mirror of the Sky Dash: Silver
    A(t[1287], a[15787]); -- Mirror of the Sky Dash: Gold
    t[1290] = c:New(k.L["Ravine River Run"]); -- Ravine River Run
    C(t[1285], t[1290]);
    A(t[1290], a[15769]); -- Ravine River Run: Bronze
    A(t[1290], a[15770]); -- Ravine River Run: Silver
    A(t[1290], a[15771]); -- Ravine River Run: Gold
    A(t[1290], a[15772]); -- Ravine River Run Advanced: Bronze
    A(t[1290], a[15773]); -- Ravine River Run Advanced: Silver
    A(t[1290], a[15774]); -- "Ravine River Ru, Advanced: Gold"
    t[1288] = c:New(k.L["River Rapids Route"]); -- River Rapids Route
    C(t[1285], t[1288]);
    A(t[1288], a[16302]); -- River Rapids Route: Bronze
    A(t[1288], a[16303]); -- River Rapids Route: Silver
    A(t[1288], a[16304]); -- River Rapids Route: Gold
    A(t[1288], a[16305]); -- River Rapids Route Advanced: Bronze
    A(t[1288], a[16306]); -- River Rapids Route Advanced: Silver
    A(t[1288], a[16307]); -- River Rapids Route Advanced: Gold
    t[1292] = c:New(k.L["Sundapple Copse Circuit"]); -- Sundapple Copse Circuit
    C(t[1285], t[1292]);
    A(t[1292], a[15757]); -- Sundapple Copse Circuit: Bronze
    A(t[1292], a[15758]); -- Sundapple Copse Circuit: Silver
    A(t[1292], a[15759]); -- Sundapple Copse Circuit: Gold
    A(t[1292], a[15760]); -- Sundapple Copse Circuit Advanced: Bronze
    A(t[1292], a[15761]); -- Sundapple Copse Circuit Advanced: Silver
    A(t[1292], a[15762]); -- Sundapple Copse Circuit Advanced: Gold
    t[1278] = c:New(k.GetMapName(2024)); -- The Azure Span
    C(t[1269], t[1278]);
    A(t[1278], a[15921]); -- Azure Span: Bronze
    A(t[1278], a[15922]); -- Azure Span: Silver
    A(t[1278], a[15923]); -- Azure Span: Gold
    A(t[1278], a[15933]); -- Azure Span Advanced: Bronze
    A(t[1278], a[15934]); -- Azure Span Advanced: Silver
    A(t[1278], a[15935]); -- Azure Span Advanced: Gold
    t[1279] = c:New(k.L["Archive Ambit"]); -- Archive Ambit
    C(t[1278], t[1279]);
    A(t[1279], a[15847]); -- Archive Ambit: Bronze
    A(t[1279], a[15848]); -- Archive Ambit: Silver
    A(t[1279], a[15849]); -- Archive Ambit: Gold
    A(t[1279], a[15850]); -- Archive Ambit Advanced: Bronze
    A(t[1279], a[15851]); -- Archive Ambit Advanced: Silver
    A(t[1279], a[15852]); -- Archive Ambit Advanced: Gold
    t[1280] = c:New(k.L["Central Circuit"]); -- Central Circuit
    C(t[1278], t[1280]);
    A(t[1280], a[15841]); -- Frostland Flyover: Bronze
    A(t[1280], a[15842]); -- Frostland Flyover: Silver
    A(t[1280], a[15843]); -- Frostland Flyover: Gold
    A(t[1280], a[15844]); -- Frostland Flyover Advanced: Bronze
    A(t[1280], a[15845]); -- Frostland Flyover Advanced: Silver
    A(t[1280], a[15846]); -- Frostland Flyover Advanced: Gold
    t[1281] = c:New(k.L["Iskaara Flyover"]); -- Iskaara Flyover
    C(t[1278], t[1281]);
    A(t[1281], a[15835]); -- Iskaara Tour: Bronze
    A(t[1281], a[15836]); -- Iskaara Tour: Silver
    A(t[1281], a[15837]); -- Iskaara Tour: Gold
    A(t[1281], a[15838]); -- Iskaara Tour Advanced: Bronze
    A(t[1281], a[15839]); -- Iskaara Tour Advanced: Silver
    A(t[1281], a[15840]); -- Iskaara Tour Advanced: Gold
    t[1283] = c:New(k.L["The Azure Span Slalom"]); -- The Azure Span Slalom
    C(t[1278], t[1283]);
    A(t[1283], a[15799]); -- The Azure Span Slalom: Bronze
    A(t[1283], a[15800]); -- The Azure Span Slalom: Silver
    A(t[1283], a[15801]); -- The Azure Span Slalom: Gold
    A(t[1283], a[15802]); -- The Azure Span Slalom Advanced: Bronze
    A(t[1283], a[15803]); -- The Azure Span Slalom Advanced: Silver
    A(t[1283], a[15804]); -- The Azure Span Slalom Advanced: Gold
    t[1284] = c:New(k.L["The Azure Span Sprint"]); -- The Azure Span Sprint
    C(t[1278], t[1284]);
    A(t[1284], a[15788]); -- The Azure Span Sprint: Bronze
    A(t[1284], a[15789]); -- The Azure Span Sprint: Silver
    A(t[1284], a[15790]); -- The Azure Span Sprint: Gold
    A(t[1284], a[15791]); -- The Azure Span Sprint Advanced: Bronze
    A(t[1284], a[15792]); -- The Azure Span Sprint Advanced: Silver
    A(t[1284], a[15793]); -- The Azure Span Sprint Advanced: Gold
    t[1282] = c:New(k.L["The Vakthros Ascent"]); -- The Vakthros Ascent
    C(t[1278], t[1282]);
    A(t[1282], a[15818]); -- The Vakthros Ascent: Bronze
    A(t[1282], a[15819]); -- The Vakthros Ascent: Silver
    A(t[1282], a[15820]); -- The Vakthros Ascent: Gold
    A(t[1282], a[15821]); -- The Vakthros Ascent Advanced: Bronze
    A(t[1282], a[15822]); -- The Vakthros Ascent Advanced: Silver
    A(t[1282], a[15823]); -- The Vakthros Ascent Advanced: Gold
    t[1276] = c:New(k.GetMapName(2025)); -- Thaldraszus
    C(t[1269], t[1276]);
    A(t[1276], a[15924]); -- Thaldraszus: Bronze
    A(t[1276], a[15925]); -- Thaldraszus: Silver
    A(t[1276], a[15926]); -- Thaldraszus: Gold
    A(t[1276], a[15936]); -- Thaldraszus Advanced: Bronze
    A(t[1276], a[15937]); -- Thaldraszus Advanced: Silver
    A(t[1276], a[15938]); -- Thaldraszus Advanced: Gold
    t[1273] = c:New(k.L["Academy Ascent"]); -- Academy Ascent
    C(t[1276], t[1273]);
    A(t[1273], a[15897]); -- Academy Ascent: Bronze
    A(t[1273], a[15898]); -- Academy Ascent: Silver
    A(t[1273], a[15899]); -- Academy Ascent: Gold
    A(t[1273], a[15900]); -- Academy Ascent Advanced: Bronze
    A(t[1273], a[15901]); -- Academy Ascent Advanced: Silver
    A(t[1273], a[15902]); -- Academy Ascent Advanced: Gold
    t[1271] = c:New(k.L["Caverns Criss-Cross"]); -- Caverns Criss-Cross
    C(t[1276], t[1271]);
    A(t[1271], a[15909]); -- Caverns Criss-Cross: Bronze
    A(t[1271], a[15910]); -- Caverns Criss-Cross: Silver
    A(t[1271], a[15911]); -- Caverns Criss-Cross: Gold
    A(t[1271], a[15912]); -- Caverns Criss-Cross Advanced: Bronze
    A(t[1271], a[15913]); -- Caverns Criss-Cross Advanced: Silver
    A(t[1271], a[15914]); -- Caverns Criss-Cross Advanced: Gold
    t[1274] = c:New(k.L["Cliffside Circuit"]); -- Cliffside Circuit
    C(t[1276], t[1274]);
    A(t[1274], a[15891]); -- Cliffside Circuit: Bronze
    A(t[1274], a[15892]); -- Cliffside Circuit: Silver
    A(t[1274], a[15893]); -- Cliffside Circuit: Gold
    A(t[1274], a[15894]); -- Cliffside Circuit Advanced: Bronze
    A(t[1274], a[15895]); -- Cliffside Circuit Advanced: Silver
    A(t[1274], a[15896]); -- Cliffside Circuit Advanced: Gold
    t[1272] = c:New(k.L["Garden Gallivant"]); -- Garden Gallivant
    C(t[1276], t[1272]);
    A(t[1272], a[15903]); -- Garden Gallivant: Bronze
    A(t[1272], a[15904]); -- Garden Gallivant: Silver
    A(t[1272], a[15905]); -- Garden Gallivant: Gold
    A(t[1272], a[15906]); -- Garden Gallivant Advanced: Bronze
    A(t[1272], a[15907]); -- Garden Gallivant Advanced: Silver
    A(t[1272], a[15908]); -- Garden Gallivant Advanced: Gold
    t[1275] = c:New(k.L["Passage Pathway"]); -- Passage Pathway
    C(t[1276], t[1275]);
    A(t[1275], a[15855]); -- Tyrhold Trial: Bronze
    A(t[1275], a[15856]); -- Tyrhold Trial: Silver
    A(t[1275], a[15857]); -- Tyrhold Trial: Gold
    A(t[1275], a[15858]); -- Tyrhold Trial Advanced: Bronze
    A(t[1275], a[15859]); -- Tyrhold Trial Advanced: Silver
    A(t[1275], a[15860]); -- Tyrhold Trial Advanced: Gold
    t[1277] = c:New(k.L["The Flowing Forest Flight"]); -- The Flowing Forest Flight
    C(t[1276], t[1277]);
    A(t[1277], a[15827]); -- The Flowing Forest Flight: Bronze
    A(t[1277], a[15828]); -- The Flowing Forest Flight: Silver
    A(t[1277], a[15829]); -- The Flowing Forest Flight: Gold
    A(t[1277], a[15830]); -- The Flowing Forest Flight Advanced: Bronze
    A(t[1277], a[15831]); -- The Flowing Forest Flight Advanced: Silver
    A(t[1277], a[15832]); -- The Flowing Forest Flight Advanced: Gold
    t[1360] = c:New(k.L["Primal Storms"]); -- Primal Storms
    C(t[1207], t[1360]);
    A(t[1360], a[16492]); -- Into the Storm
    A(t[1360], a[16498]); -- Elemental Overflow
    A(t[1360], a[16499]); -- Elemental Overflowing
    A(t[1360], a[16500]); -- Elemental Overload
    A(t[1360], a[16461]); -- Stormed Off
    A(t[1360], a[16490]); -- Storm Chaser
    A(t[1360], a[16468]); -- Chasing Storms in The Waking Shores
    A(t[1360], a[16463]); -- Thunderstorms in The Waking Shores
    A(t[1360], a[16465]); -- Sandstorms in The Waking Shores
    A(t[1360], a[16466]); -- Firestorms in The Waking Shores
    A(t[1360], a[16467]); -- Snowstorms in The Waking Shores
    A(t[1360], a[16476]); -- Chasing Storms in the Ohn'ahran Plains
    A(t[1360], a[16475]); -- Thunderstorms in the Ohn'ahran Plains
    A(t[1360], a[16477]); -- Sandstorms in the Ohn'ahran Plains
    A(t[1360], a[16478]); -- Firestorms in the Ohn'ahran Plains
    A(t[1360], a[16479]); -- Snowstorms in the Ohn'ahran Plains
    A(t[1360], a[16484]); -- Chasing Storms in The Azure Span
    A(t[1360], a[16480]); -- Thunderstorms in The Azure Span
    A(t[1360], a[16481]); -- Sandstorms in The Azure Span
    A(t[1360], a[16482]); -- Firestorms in The Azure Span
    A(t[1360], a[16483]); -- Snowstorms in The Azure Span
    A(t[1360], a[16489]); -- Chasing Storms in Thaldraszus
    A(t[1360], a[16485]); -- Thunderstorms in Thaldraszus
    A(t[1360], a[16486]); -- Sandstorms in Thaldraszus
    A(t[1360], a[16487]); -- Firestorms in Thaldraszus
    A(t[1360], a[16488]); -- Snowstorms in Thaldraszus
    A(t[1360], a[16502]); -- Storming the Runway
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
    A(t[1161], a[16789]); -- Lucky Penny
    A(t[1161], a[16790]); -- Curious Coin
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
    A(t[1149], a[16799]); -- Personal Crafter
    A(t[1149], a[16791]); -- Merchant Artisan
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
    t[1153] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[1149], t[1153]);
    A(t[1153], a[4924]); -- Professional Cataclysmic Master
    A(t[1153], a[4914]); -- Working In the Heat
    A(t[1153], a[4916]); -- Cataclysmic Cook
    A(t[1153], a[5472]); -- The Cataclysmic Gourmet
    A(t[1153], a[5473]); -- The Cataclysmic Gourmet
    A(t[1153], a[4917]); -- Cataclysmic Fisherman
    A(t[1153], a[4923]); -- Illustrious Grand Master Archaeologist
    A(t[1153], a[5511]); -- It's Always in the Last Place You Look
    A(t[1153], a[4858]); -- Seven Scepters
    A(t[1153], a[5191]); -- Tragedy in Three Acts
    A(t[1153], a[5193]); -- Blue Streak
    A(t[1153], a[5192]); -- The Harder they Fall
    A(t[1153], a[4859]); -- Kings Under the Mountain
    A(t[1153], a[5301]); -- The Boy Who Would be King
    A(t[1153], a[4918]); -- Illustrious Grand Master Medic
    A(t[1153], a[5480]); -- Preparing for Disaster
    A(t[1153], a[4915]); -- More Skills to Pay the Bills
    t[1154] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[1149], t[1154]);
    A(t[1154], a[6830]); -- Professional Zen Master
    A(t[1154], a[6835]); -- Working For a Living
    A(t[1154], a[7378]); -- Jack of All Trades
    A(t[1154], a[7379]); -- Pandaren Master of All
    A(t[1154], a[6365]); -- Zen Master Cook
    A(t[1154], a[7300]); -- Master of the Grill
    A(t[1154], a[7301]); -- Master of the Wok
    A(t[1154], a[7302]); -- Master of the Pot
    A(t[1154], a[7303]); -- Master of the Steamer
    A(t[1154], a[7304]); -- Master of the Oven
    A(t[1154], a[7305]); -- Master of the Brew
    A(t[1154], a[7306]); -- Master of Pandaren Cooking
    A(t[1154], a[7325]); -- Now I Am the Master
    A(t[1154], a[7326]); -- The Pandaren Gourmet
    A(t[1154], a[7327]); -- The Pandaren Gourmet
    A(t[1154], a[6839]); -- Zen Master Fisherman
    A(t[1154], a[7611]); -- Pandarian Angler
    A(t[1154], a[7614]); -- Locking Down the Docks
    A(t[1154], a[7274]); -- Learning from the Best
    A(t[1154], a[6837]); -- Zen Master Archaeologist
    A(t[1154], a[7331]); -- The Three Brew Fathers
    A(t[1154], a[7332]); -- The Broken Hearted
    A(t[1154], a[7333]); -- The Four Celestials
    A(t[1154], a[7334]); -- Instruments of Cruelty
    A(t[1154], a[7335]); -- Symbols of Strength
    A(t[1154], a[7337]); -- Documents of a Dark History
    A(t[1154], a[7336]); -- Stone Servants
    A(t[1154], a[7338]); -- Collector: Pandaren Tea Sets
    A(t[1154], a[7358]); -- Collector: Pandaren Tea Sets
    A(t[1154], a[7339]); -- Collector: Pandaren Game Boards
    A(t[1154], a[7359]); -- Collector: Pandaren Game Boards
    A(t[1154], a[7340]); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    A(t[1154], a[7360]); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    A(t[1154], a[7341]); -- Collector: Walking Canes of Brewfather Ren Yun
    A(t[1154], a[7361]); -- Collector: Walking Canes of Brewfather Ren Yun
    A(t[1154], a[7342]); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    A(t[1154], a[7362]); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    A(t[1154], a[7343]); -- Collector: Carved Bronze Mirrors
    A(t[1154], a[7363]); -- Collector: Carved Bronze Mirrors
    A(t[1154], a[7344]); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    A(t[1154], a[7364]); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    A(t[1154], a[7345]); -- Collector: Apothecary Tins
    A(t[1154], a[7365]); -- Collector: Apothecary Tins
    A(t[1154], a[7346]); -- Collector: Pearls of Yu'lon
    A(t[1154], a[7366]); -- Collector: Pearls of Yu'lon
    A(t[1154], a[7347]); -- Collector: Standards of Niuzao
    A(t[1154], a[7367]); -- Collector: Standards of Niuzao
    A(t[1154], a[7348]); -- Collector: Manacles of Rebellion
    A(t[1154], a[7368]); -- Collector: Manacles of Rebellion
    A(t[1154], a[7349]); -- Collector: Cracked Mogu Runestones
    A(t[1154], a[7369]); -- Collector: Cracked Mogu Runestones
    A(t[1154], a[7350]); -- Collector: Terracotta Arms
    A(t[1154], a[7370]); -- Collector: Terracotta Arms
    A(t[1154], a[7351]); -- Collector: Petrified Bone Whips
    A(t[1154], a[7371]); -- Collector: Petrified Bone Whips
    A(t[1154], a[7352]); -- Collector: Thunder King Insignias
    A(t[1154], a[7372]); -- Collector: Thunder King Insignias
    A(t[1154], a[7373]); -- Collector: Edicts of the Thunder King
    A(t[1154], a[7353]); -- Collector: Edicts of the Thunder King
    A(t[1154], a[7354]); -- Collector: Iron Amulets
    A(t[1154], a[7374]); -- Collector: Iron Amulets
    A(t[1154], a[7355]); -- Collector: Warlord's Branding Irons
    A(t[1154], a[7375]); -- Collector: Warlord's Branding Irons
    A(t[1154], a[7356]); -- Collector: Mogu Coins
    A(t[1154], a[7376]); -- Collector: Mogu Coins
    A(t[1154], a[7357]); -- Collector: Worn Monument Ledgers
    A(t[1154], a[7377]); -- Collector: Worn Monument Ledgers
    A(t[1154], a[8220]); -- Collector: Banners of the Mantid Empire
    A(t[1154], a[8221]); -- Collector: Banners of the Mantid Empire
    A(t[1154], a[8222]); -- Collector: Ancient Sap Feeders
    A(t[1154], a[8223]); -- Collector: Ancient Sap Feeders
    A(t[1154], a[8224]); -- Collector: Praying Mantids
    A(t[1154], a[8225]); -- Collector: Praying Mantids
    A(t[1154], a[8226]); -- Collector: Inert Sound Beacons
    A(t[1154], a[8227]); -- Collector: Inert Sound Beacons
    A(t[1154], a[8228]); -- Collector: Remains of Paragons
    A(t[1154], a[8229]); -- Collector: Remains of Paragons
    A(t[1154], a[8230]); -- Collector: Mantid Lamps
    A(t[1154], a[8231]); -- Collector: Mantid Lamps
    A(t[1154], a[8232]); -- Collector: Pollen Collectors
    A(t[1154], a[8233]); -- Collector: Pollen Collectors
    A(t[1154], a[8234]); -- Collector: Kypari Sap Containers
    A(t[1154], a[8235]); -- Collector: Kypari Sap Containers
    A(t[1154], a[7612]); -- The Seat of Knowledge
    A(t[1154], a[8219]); -- History of the Mantid
    A(t[1154], a[6838]); -- Zen Master Medic
    A(t[1154], a[6836]); -- Serious Skills to Pay the Bills
    t[1155] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[1149], t[1155]);
    A(t[1155], a[9464]); -- Professional Draenor Master
    A(t[1155], a[9507]); -- Working in Draenor
    A(t[1155], a[9087]); -- Draenor Master of All
    A(t[1155], a[9453]); -- Draenic Stone Collector
    A(t[1155], a[9454]); -- Draenic Seed Collector
    A(t[1155], a[9071]); -- Inspector Gadgetzan
    A(t[1155], a[9500]); -- Draenor Cook
    A(t[1155], a[9501]); -- The Draenor Gourmet
    A(t[1155], a[9503]); -- Draenor Fisherman
    A(t[1155], a[9455]); -- Fire Ammonite Angler
    A(t[1155], a[9456]); -- Abyssal Gulper Eel Angler
    A(t[1155], a[9457]); -- Blackwater Whiptail Angler
    A(t[1155], a[9458]); -- Blind Lake Sturgeon Angler
    A(t[1155], a[9459]); -- Fat Sleeper Angler
    A(t[1155], a[9460]); -- Jawless Skulker Angler
    A(t[1155], a[9461]); -- Sea Scorpion Angler
    A(t[1155], a[9462]); -- Draenor Angler
    A(t[1155], a[9547]); -- Everything Is Awesome!
    A(t[1155], a[9409]); -- Draenor Archaeologist
    A(t[1155], a[9413]); -- Strength and Honor
    A(t[1155], a[9414]); -- Ogre Observer
    A(t[1155], a[9415]); -- Secrets of Skettis
    A(t[1155], a[9410]); -- Unite the Clans
    A(t[1155], a[9411]); -- Highmaul Historian
    A(t[1155], a[9412]); -- Arakkoa Archivist
    A(t[1155], a[9419]); -- Draenor Curator
    A(t[1155], a[9505]); -- Draenor Medic
    A(t[1155], a[9506]); -- Savage Skills to Pay the Bills
    t[1156] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[1149], t[1156]);
    A(t[1156], a[10582]); -- Professional Legion Master
    A(t[1156], a[10581]); -- Working the Isles
    A(t[1156], a[10583]); -- Legion Master of All
    A(t[1156], a[10761]); -- Resourceful
    A(t[1156], a[10587]); -- Hot Swapper
    A(t[1156], a[10588]); -- The Shortest Distance
    A(t[1156], a[10589]); -- Legion Cook
    A(t[1156], a[10591]); -- All Grown Up
    A(t[1156], a[10592]); -- Never A Day's Rest
    A(t[1156], a[10762]); -- The Legion Menu
    A(t[1156], a[10593]); -- Everything Tastes Better
    A(t[1156], a[10594]); -- Legion Fisherman
    A(t[1156], a[10597]); -- Legion Aquaculture
    A(t[1156], a[10595]); -- A Cast Above the Rest
    A(t[1156], a[10596]); -- Bigger Fish to Fry
    A(t[1156], a[10598]); -- Fishing 'Round the Isles
    A(t[1156], a[10722]); -- The Wish Remover
    A(t[1156], a[11725]); -- Fisherfriend of the Isles
    A(t[1156], a[10600]); -- Legion Archaeologist
    A(t[1156], a[10601]); -- Surveying the Land
    A(t[1156], a[10602]); -- This Side Up
    A(t[1156], a[10603]); -- A Keen Eye
    A(t[1156], a[10604]); -- Legion Curator
    A(t[1156], a[10605]); -- Handle With Care
    A(t[1156], a[10606]); -- The Dwarven Dream
    A(t[1156], a[10607]); -- Getting Your Hands Dirty
    A(t[1156], a[10608]); -- Sifting Through the Sand
    A(t[1156], a[10609]); -- No Stone Unturned
    A(t[1156], a[10599]); -- Legion Medic
    A(t[1156], a[10580]); -- Heroic Skills to Pay the Bills
    A(t[1156], a[11138]); -- Is There a Medic in the Zone?
    A(t[1156], a[11139]); -- Field Medic
    A(t[1156], a[10585]); -- Fel-Smelter
    A(t[1156], a[10586]); -- Mass Obliteration
    t[1157] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[1149], t[1157]);
    A(t[1157], a[12731]); -- Professional Kul Tiran Master
    A(t[1157], a[12733]); -- Professional Zandalari Master
    A(t[1157], a[12734]); -- Working in Kul Tiras
    A(t[1157], a[12735]); -- Working in Zandalar
    A(t[1157], a[12736]); -- Kul Tiran Master of All
    A(t[1157], a[12737]); -- Zandalari Master of All
    A(t[1157], a[12741]); -- Giving a Scrap
    A(t[1157], a[13056]); -- Giving a Scrap
    A(t[1157], a[12738]); -- Holy Scrap!
    A(t[1157], a[12739]); -- Scraptastic!
    A(t[1157], a[12740]); -- Full of Scrap!
    A(t[1157], a[13516]); -- Massive Tool
    A(t[1157], a[12742]); -- Kul Tiran Cook
    A(t[1157], a[12743]); -- Zandalari Cook
    A(t[1157], a[12744]); -- The Kul Tiran Menu
    A(t[1157], a[12746]); -- The Zandalari Menu
    A(t[1157], a[12747]); -- Catering for Combat
    A(t[1157], a[12753]); -- Kul Tiran Fisherman
    A(t[1157], a[12754]); -- Zandalari Fisherman
    A(t[1157], a[13489]); -- Secret Fish of Mechagon
    A(t[1157], a[13502]); -- Secret Fish and Where to Find Them
    A(t[1157], a[12757]); -- Angling for Battle
    A(t[1157], a[12755]); -- Scent of the Sea
    A(t[1157], a[12756]); -- Fish Me In the Moonlight
    A(t[1157], a[12758]); -- Baiting the Enemy
    A(t[1157], a[12759]); -- Baiting the Enemy
    A(t[1157], a[12990]); -- Catchin' Some Rays
    A(t[1157], a[12760]); -- Kul Tiran Archaeologist
    A(t[1157], a[12761]); -- Zandalari Archaeologist
    A(t[1157], a[12762]); -- Kul Tiran Curator
    A(t[1157], a[12764]); -- Zandalari Curator
    A(t[1157], a[12765]); -- Exotic Discoveries
    A(t[1157], a[12769]); -- Light Travel
    A(t[1157], a[12770]); -- Lengthy Legwork
    t[1158] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[1149], t[1158]);
    A(t[1158], a[14328]); -- Professional Shadowlands Master
    A(t[1158], a[14329]); -- Working the Afterlife
    A(t[1158], a[14330]); -- Shadowlands Master of All
    A(t[1158], a[14332]); -- Shadowlands Cook
    A(t[1158], a[14333]); -- Shadowlands Fisherman
    t[1391] = c:New(k.GetCategoryInfoTitle(15466)); -- Dragonflight
    C(t[1149], t[1391]);
    A(t[1391], a[16627]); -- Professional Draconic Master
    A(t[1391], a[16626]); -- Working with Wyrms
    A(t[1391], a[16630]); -- Draconic Master of All
    A(t[1391], a[16631]); -- Dragon Isles Cook
    A(t[1391], a[16632]); -- Dragon Isles Fisherman
    A(t[1391], a[16683]); -- In Tyr's Footsteps
    A(t[1391], a[16794]); -- Dragon Isles Crafting Order Apprentice
    A(t[1391], a[16795]); -- Dragon Isles Crafting Order Journeyman
    A(t[1391], a[16800]); -- Dragon Isles Crafting Order Master
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
    t[1218] = c:New(k.L["Watch List"]); -- Watch List
    C(t[884], t[1218]);
    t[1218].HasFlexibleData = true;
    tinsert(watchListCategories, t[1218]);
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
    A(t[915], a[971]); -- Tricks and Treats of Azeroth
    A(t[915], a[5836]); -- Tricks and Treats of Northrend
    A(t[915], a[5835]); -- Tricks and Treats of Northrend
    A(t[915], a[5837]); -- Tricks and Treats of the Cataclysm
    A(t[915], a[5838]); -- Tricks and Treats of the Cataclysm
    A(t[915], a[7601]); -- Tricks and Treats of Pandaria
    A(t[915], a[7602]); -- Tricks and Treats of Pandaria
    A(t[915], a[10365]); -- A Frightening Friend
    A(t[915], a[1656]); -- Hallowed Be Thy Name
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
    t[947] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[884], t[947]);
    t[948] = c:New(k.L["Legion Assaults"]); -- Legion Assaults
    C(t[947], t[948]);
    A(t[948], a[11544]); -- Defender of the Broken Isles
    t[932] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[884], t[932]);
    t[933] = c:New(k.L["Faction Assaults"]); -- Faction Assaults
    C(t[932], t[933]);
    t[935] = c:New(k.L["Assault on Tiragarde Sound"]); -- Assault on Tiragarde Sound
    C(t[933], t[935]);
    A(t[935], a[13285]); -- Upright Citizens
    A(t[935], a[13317]); -- Supplied and Ready
    A(t[935], a[13283]); -- Frontline Warrior
    A(t[935], a[13284]); -- Frontline Warrior
    A(t[935], a[13387]); -- Frontline Veteran
    A(t[935], a[13388]); -- Frontline Veteran
    A(t[935], a[13402]); -- Frontline Slayer
    A(t[935], a[13403]); -- Frontline Slayer
    t[936] = c:New(k.L["Assault on Drustvar"]); -- Assault on Drustvar
    C(t[933], t[936]);
    A(t[936], a[13435]); -- Doomsoul Surprise
    A(t[936], a[13317]); -- Supplied and Ready
    A(t[936], a[13283]); -- Frontline Warrior
    A(t[936], a[13284]); -- Frontline Warrior
    A(t[936], a[13387]); -- Frontline Veteran
    A(t[936], a[13388]); -- Frontline Veteran
    A(t[936], a[13402]); -- Frontline Slayer
    A(t[936], a[13403]); -- Frontline Slayer
    t[937] = c:New(k.L["Assault on Stormsong Valley"]); -- Assault on Stormsong Valley
    C(t[933], t[937]);
    A(t[937], a[13317]); -- Supplied and Ready
    A(t[937], a[13283]); -- Frontline Warrior
    A(t[937], a[13284]); -- Frontline Warrior
    A(t[937], a[13387]); -- Frontline Veteran
    A(t[937], a[13388]); -- Frontline Veteran
    A(t[937], a[13402]); -- Frontline Slayer
    A(t[937], a[13403]); -- Frontline Slayer
    t[934] = c:New(k.L["Assault on Zuldazar"]); -- Assault on Zuldazar
    C(t[933], t[934]);
    A(t[934], a[13440]); -- Pushing the Payload
    A(t[934], a[13441]); -- Pushing the Payload
    A(t[934], a[13439]); -- Boxing Match
    A(t[934], a[13317]); -- Supplied and Ready
    A(t[934], a[13283]); -- Frontline Warrior
    A(t[934], a[13284]); -- Frontline Warrior
    A(t[934], a[13387]); -- Frontline Veteran
    A(t[934], a[13388]); -- Frontline Veteran
    A(t[934], a[13402]); -- Frontline Slayer
    A(t[934], a[13403]); -- Frontline Slayer
    t[938] = c:New(k.L["Assault on Nazmir"]); -- Assault on Nazmir
    C(t[933], t[938]);
    A(t[938], a[13426]); -- Come On and Slam
    A(t[938], a[13317]); -- Supplied and Ready
    A(t[938], a[13283]); -- Frontline Warrior
    A(t[938], a[13284]); -- Frontline Warrior
    A(t[938], a[13387]); -- Frontline Veteran
    A(t[938], a[13388]); -- Frontline Veteran
    A(t[938], a[13402]); -- Frontline Slayer
    A(t[938], a[13403]); -- Frontline Slayer
    t[939] = c:New(k.L["Assault on Vol'dun"]); -- Assault on Vol'dun
    C(t[933], t[939]);
    A(t[939], a[13437]); -- Scavenge like a Vulpera
    A(t[939], a[13317]); -- Supplied and Ready
    A(t[939], a[13283]); -- Frontline Warrior
    A(t[939], a[13284]); -- Frontline Warrior
    A(t[939], a[13387]); -- Frontline Veteran
    A(t[939], a[13388]); -- Frontline Veteran
    A(t[939], a[13402]); -- Frontline Slayer
    A(t[939], a[13403]); -- Frontline Slayer
    t[940] = c:New(k.L["N'Zoth Assaults"]); -- N'Zoth Assaults
    C(t[932], t[940]);
    t[941] = c:New(k.GetMapName(1530)); -- Vale of Eternal Blossoms
    C(t[940], t[941]);
    A(t[941], a[14154]); -- Defend the Vale
    A(t[941], a[14161]); -- All Consuming
    A(t[941], a[14160]); -- Rare to Well Done
    A(t[941], a[14159]); -- Combating the Corruption
    A(t[941], a[14158]); -- It's Not A Tumor!
    A(t[941], a[14156]); -- The Rajani
    t[942] = c:New(k.GetMapName(1527)); -- Uldum
    C(t[940], t[942]);
    A(t[942], a[14153]); -- Uldum Under Assault
    A(t[942], a[14161]); -- All Consuming
    A(t[942], a[14160]); -- Rare to Well Done
    A(t[942], a[14159]); -- Combating the Corruption
    A(t[942], a[14158]); -- It's Not A Tumor!
    A(t[942], a[14155]); -- Uldum Accord
    t[926] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[884], t[926]);
    t[927] = c:New(k.L["Covenant Assaults"]); -- Covenant Assaults
    C(t[926], t[927]);
    t[928] = c:New(k.L["Kyrian Assault"]); -- Kyrian Assault
    C(t[927], t[928]);
    A(t[928], a[15041]); -- The Zovaal Shuffle
    A(t[928], a[15034]); -- Wings Against the Flames
    A(t[928], a[15004]); -- A Sly Fox
    t[929] = c:New(k.L["Necrolords Assault"]); -- Necrolords Assault
    C(t[927], t[929]);
    A(t[929], a[15037]); -- This Army
    A(t[929], a[15039]); -- Up For Grabs
    A(t[929], a[15032]); -- Breaking Their Hold
    t[930] = c:New(k.L["Night Fae Assault"]); -- Night Fae Assault
    C(t[927], t[930]);
    A(t[930], a[15001]); -- Jailer's Personal Stash
    A(t[930], a[15044]); -- Krrprripripkraak's Heroes
    A(t[930], a[15036]); -- Rooting Out the Evil
    t[931] = c:New(k.L["Venthyr Assault"]); -- Venthyr Assault
    C(t[927], t[931]);
    A(t[931], a[15043]); -- Hoarder of Torghast
    A(t[931], a[15042]); -- Tea for the Troubled
    A(t[931], a[15033]); -- Taking the Tremaculum
    t[1208] = c:New(k.L["Fated Raids"]); -- Fated Raids
    C(t[926], t[1208]);
    t[1209] = c:New(k.GetInstanceInfoName(1190)); -- Castle Nathria
    C(t[1208], t[1209]);
    A(t[1209], a[15663]); -- Fate of Nathria
    A(t[1209], a[15664]); -- Heroic: Fate of Nathria
    A(t[1209], a[15665]); -- Mythic: Fate of Nathria
    A(t[1209], a[15684]); -- Fates of the Shadowlands Raids
    A(t[1209], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    A(t[1209], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    t[1210] = c:New(k.GetInstanceInfoName(1193)); -- Sanctum of Domination
    C(t[1208], t[1210]);
    A(t[1210], a[15667]); -- Fate of Domination
    A(t[1210], a[15668]); -- Heroic: Fate of Domination
    A(t[1210], a[15669]); -- Mythic: Fate of Domination
    A(t[1210], a[15684]); -- Fates of the Shadowlands Raids
    A(t[1210], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    A(t[1210], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    t[1211] = c:New(k.GetInstanceInfoName(1195)); -- Sepulcher of the First Ones
    C(t[1208], t[1211]);
    A(t[1211], a[15681]); -- Fate of the Sepulcher
    A(t[1211], a[15682]); -- Heroic: Fate of the Sepulcher
    A(t[1211], a[15683]); -- Mythic: Fate of the Sepulcher
    A(t[1211], a[15684]); -- Fates of the Shadowlands Raids
    A(t[1211], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    A(t[1211], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    t[1358] = c:New(k.GetCategoryInfoTitle(15466)); -- Dragonflight
    C(t[884], t[1358]);
    t[1392] = c:New((select(2, k.GetAchievementInfo(16544)))); -- Grand Hunter
    C(t[1358], t[1392]);
    A(t[1392], a[16544]); -- Grand Hunter
    A(t[1392], a[16540]); -- Hunt Master
    A(t[1392], a[16545]); -- The Best at What I Do
    A(t[1392], a[16541]); -- Longhunter
    A(t[1392], a[16542]); -- The Disgruntled Hunter
    A(t[1392], a[16543]); -- Tetrachromancer
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
    t[1219] = c:New(k.L["Watch List"]); -- Watch List
    C(t[955], t[1219]);
    t[1219].HasFlexibleData = true;
    tinsert(watchListCategories, t[1219]);
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
    t[973] = c:New(k.L["Strand of the Ancients"] .. " (" .. k.GetCategoryInfoTitle(15234) .. ")"); -- Strand of the Ancients
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
    t[1197] = c:New(k.GetCategoryInfoTitle(15072)); -- Cataclysm
    C(t[955], t[1197]);
    A(t[1197], a[6002]); -- Vicious Gladiator
    A(t[1197], a[5344]); -- Hero of the Alliance: Vicious
    A(t[1197], a[5358]); -- Hero of the Horde: Vicious
    A(t[1197], a[6124]); -- Ruthless Gladiator
    A(t[1197], a[6316]); -- Hero of the Alliance: Ruthless
    A(t[1197], a[6317]); -- Hero of the Horde: Ruthless
    A(t[1197], a[6938]); -- Cataclysmic Gladiator
    A(t[1197], a[6939]); -- Hero of the Alliance: Cataclysmic
    A(t[1197], a[6940]); -- Hero of the Horde: Cataclysmic
    t[1198] = c:New(k.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    C(t[955], t[1198]);
    A(t[1198], a[8214]); -- Malevolent Gladiator
    A(t[1198], a[8243]); -- Hero of the Alliance: Malevolent
    A(t[1198], a[8244]); -- Hero of the Horde: Malevolent
    A(t[1198], a[8791]); -- Tyrannical Gladiator
    A(t[1198], a[8652]); -- Hero of the Alliance: Tyrannical
    A(t[1198], a[8653]); -- Hero of the Horde: Tyrannical
    A(t[1198], a[8218]); -- Tyrannical Conquest
    A(t[1198], a[8093]); -- Tyrannical Conquest
    A(t[1198], a[8649]); -- Challenger: Season 14
    A(t[1198], a[8646]); -- Rival: Season 14
    A(t[1198], a[8645]); -- Duelist: Season 14
    A(t[1198], a[8644]); -- Gladiator: Season 14
    A(t[1198], a[8643]); -- Grievous Gladiator: Season 14
    A(t[1198], a[8654]); -- Hero of the Alliance: Grievous
    A(t[1198], a[8657]); -- Hero of the Horde: Grievous
    A(t[1198], a[8485]); -- Grievous Combatant
    A(t[1198], a[8484]); -- Grievous Combatant
    A(t[1198], a[8382]); -- Grievous Conquest
    A(t[1198], a[8381]); -- Grievous Conquest
    A(t[1198], a[8670]); -- Challenger: Season 15
    A(t[1198], a[8669]); -- Rival: Season 15
    A(t[1198], a[8668]); -- Duelist: Season 15
    A(t[1198], a[8667]); -- Gladiator: Season 15
    A(t[1198], a[8666]); -- Prideful Gladiator: Season 15
    A(t[1198], a[8658]); -- Hero of the Alliance: Prideful
    A(t[1198], a[8659]); -- Hero of the Horde: Prideful
    A(t[1198], a[8642]); -- Prideful Combatant
    A(t[1198], a[8641]); -- Prideful Combatant
    A(t[1198], a[8451]); -- Prideful Conquest
    A(t[1198], a[8450]); -- Prideful Conquest
    t[1175] = c:New(k.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    C(t[955], t[1175]);
    t[1177] = c:New(k.L["Season"] .. " " .. 1); -- Season 1
    C(t[1175], t[1177]);
    A(t[1177], a[9242]); -- Challenger: Warlords Season 1
    A(t[1177], a[9241]); -- Rival: Warlords Season 1
    A(t[1177], a[9240]); -- Duelist: Warlords Season 1
    A(t[1177], a[9239]); -- Gladiator: Warlords Season 1
    A(t[1177], a[9232]); -- Primal Gladiator: Warlords Season 1
    A(t[1177], a[9995]); -- Soldier of the Alliance: Warlords Season 1
    A(t[1177], a[9998]); -- Soldier of the Horde: Warlords Season 1
    A(t[1177], a[9996]); -- Defender of the Alliance: Warlords Season 1
    A(t[1177], a[10001]); -- Defender of the Horde: Warlords Season 1
    A(t[1177], a[9997]); -- Guardian of the Alliance: Warlords Season 1
    A(t[1177], a[10000]); -- Guardian of the Horde: Warlords Season 1
    A(t[1177], a[9230]); -- Hero of the Alliance: Primal
    A(t[1177], a[9231]); -- Hero of the Horde: Primal
    A(t[1177], a[9238]); -- Primal Combatant
    A(t[1177], a[9236]); -- Primal Combatant
    A(t[1177], a[9234]); -- Primal Conquest
    A(t[1177], a[9233]); -- Primal Conquest
    t[1178] = c:New(k.L["Season"] .. " " .. 2); -- Season 2
    C(t[1175], t[1178]);
    A(t[1178], a[10101]); -- Challenger: Warlords Season 2
    A(t[1178], a[10100]); -- Rival: Warlords Season 2
    A(t[1178], a[10099]); -- Duelist: Warlords Season 2
    A(t[1178], a[10098]); -- Gladiator: Warlords Season 2
    A(t[1178], a[10096]); -- Wild Gladiator: Warlords Season 2
    A(t[1178], a[10104]); -- Soldier of the Alliance: Warlords Season 2
    A(t[1178], a[10105]); -- Soldier of the Horde: Warlords Season 2
    A(t[1178], a[10106]); -- Defender of the Alliance: Warlords Season 2
    A(t[1178], a[10107]); -- Defender of the Horde: Warlords Season 2
    A(t[1178], a[10108]); -- Guardian of the Alliance: Warlords Season 2
    A(t[1178], a[10109]); -- Guardian of the Horde: Warlords Season 2
    A(t[1178], a[10102]); -- Hero of the Alliance: Wild
    A(t[1178], a[10103]); -- Hero of the Horde: Wild
    A(t[1178], a[10093]); -- Wild Combatant
    A(t[1178], a[10092]); -- Wild Combatant
    A(t[1178], a[10089]); -- Wild Conquest
    A(t[1178], a[10088]); -- Wild Conquest
    t[1179] = c:New(k.L["Season"] .. " " .. 3); -- Season 3
    C(t[1175], t[1179]);
    A(t[1179], a[10113]); -- Challenger: Warlords Season 3
    A(t[1179], a[10112]); -- Rival: Warlords Season 3
    A(t[1179], a[10111]); -- Duelist: Warlords Season 3
    A(t[1179], a[10110]); -- Gladiator: Warlords Season 3
    A(t[1179], a[10097]); -- Warmongering Gladiator: Warlords Season 3
    A(t[1179], a[10120]); -- Soldier of the Alliance: Warlords Season 3
    A(t[1179], a[10121]); -- Soldier of the Horde: Warlords Season 3
    A(t[1179], a[10118]); -- Defender of the Alliance: Warlords Season 3
    A(t[1179], a[10119]); -- Defender of the Horde: Warlords Season 3
    A(t[1179], a[10116]); -- Guardian of the Alliance: Warlords Season 3
    A(t[1179], a[10117]); -- Guardian of the Horde: Warlords Season 3
    A(t[1179], a[10114]); -- Hero of the Alliance: Warmongering
    A(t[1179], a[10115]); -- Hero of the Horde: Warmongering
    A(t[1179], a[10095]); -- Warmongering Combatant
    A(t[1179], a[10094]); -- Warmongering Combatant
    A(t[1179], a[10091]); -- Warmongering Conquest
    A(t[1179], a[10090]); -- Warmongering Conquest
    t[1180] = c:New(k.GetCategoryInfoTitle(15258)); -- Legion
    C(t[955], t[1180]);
    A(t[1180], a[10991]); -- First Step into a Larger World
    A(t[1180], a[10992]); -- Here We Go Again
    A(t[1180], a[10993]); -- Third Time's the Charm
    A(t[1180], a[10995]); -- For Prestige
    A(t[1180], a[11468]); -- Alive for Five
    A(t[1180], a[11469]); -- The River Six
    A(t[1180], a[11470]); -- Slayin' to Seven
    A(t[1180], a[11471]); -- "Don't Hate, Grind to Eight"
    A(t[1180], a[11472]); -- "Hell, It's About Nine"
    A(t[1180], a[11685]); -- Decade of Dominance
    A(t[1180], a[11686]); -- These Go To Eleven
    A(t[1180], a[11687]); -- Demonic Dozen
    A(t[1180], a[11688]); -- Floor Thirteen
    A(t[1180], a[11689]); -- Fourteen for the Team
    A(t[1180], a[11690]); -- When You're Fifteen
    A(t[1180], a[11691]); -- You Are Sixteen
    A(t[1180], a[11692]); -- Going On Seventeen
    A(t[1180], a[11693]); -- Eighteen and Over
    A(t[1180], a[11694]); -- "Hell, It's About Nineteen"
    A(t[1180], a[12108]); -- Double Decade of Dominance
    A(t[1180], a[12109]); -- Twenty-One Arms Salute
    A(t[1180], a[12180]); -- Catching Twenty-Two
    A(t[1180], a[12181]); -- Protocol 2.3
    A(t[1180], a[12182]); -- Demonic Double Dozen
    A(t[1180], a[12183]); -- Prestige Quartermaster
    A(t[1180], a[10743]); -- The Prestige
    A(t[1180], a[10745]); -- The Prestige
    A(t[1180], a[11165]); -- Crest of Heroism
    A(t[1180], a[11166]); -- Crest of Heroism
    A(t[1180], a[11167]); -- Crest of Carnage
    A(t[1180], a[11168]); -- Crest of Carnage
    A(t[1180], a[11169]); -- Crest of Devastation
    A(t[1180], a[11170]); -- Crest of Devastation
    t[1176] = c:New(k.L["Season"] .. " " .. 1); -- Season 1
    C(t[1180], t[1176]);
    A(t[1176], a[11017]); -- Challenger: Legion Season 1
    A(t[1176], a[11016]); -- Rival: Legion Season 1
    A(t[1176], a[11015]); -- Duelist: Legion Season 1
    A(t[1176], a[11011]); -- Gladiator: Legion Season 1
    A(t[1176], a[11012]); -- Vindictive Gladiator: Legion Season 1
    A(t[1176], a[11024]); -- Soldier of the Alliance: Legion Season 1
    A(t[1176], a[11025]); -- Soldier of the Horde: Legion Season 1
    A(t[1176], a[11022]); -- Defender of the Alliance: Legion Season 1
    A(t[1176], a[11023]); -- Defender of the Horde: Legion Season 1
    A(t[1176], a[11020]); -- Guardian of the Alliance: Legion Season 1
    A(t[1176], a[11021]); -- Guardian of the Horde: Legion Season 1
    A(t[1176], a[11018]); -- Hero of the Alliance: Vindictive
    A(t[1176], a[11019]); -- Hero of the Horde: Vindictive
    A(t[1176], a[10998]); -- Vindictive Combatant
    A(t[1176], a[10997]); -- Vindictive Combatant
    A(t[1176], a[11578]); -- Vindictive Elite
    t[1181] = c:New(k.L["Season"] .. " " .. 2); -- Season 2
    C(t[1180], t[1181]);
    A(t[1181], a[11028]); -- Challenger: Legion Season 2
    A(t[1181], a[11027]); -- Rival: Legion Season 2
    A(t[1181], a[11026]); -- Duelist: Legion Season 2
    A(t[1181], a[11013]); -- Gladiator: Legion Season 2
    A(t[1181], a[11014]); -- Fearless Gladiator: Legion Season 2
    A(t[1181], a[11036]); -- Soldier of the Alliance: Legion Season 2
    A(t[1181], a[11035]); -- Soldier of the Horde: Legion Season 2
    A(t[1181], a[11034]); -- Defender of the Alliance: Legion Season 2
    A(t[1181], a[11033]); -- Defender of the Horde: Legion Season 2
    A(t[1181], a[11032]); -- Guardian of the Alliance: Legion Season 2
    A(t[1181], a[11031]); -- Guardian of the Horde: Legion Season 2
    A(t[1181], a[11030]); -- Hero of the Alliance: Fearless
    A(t[1181], a[11029]); -- Hero of the Horde: Fearless
    A(t[1181], a[11004]); -- Fearless Combatant
    A(t[1181], a[11003]); -- Fearless Combatant
    A(t[1181], a[11579]); -- Fearless Elite
    t[1182] = c:New(k.L["Season"] .. " " .. 3); -- Season 3
    C(t[1180], t[1182]);
    A(t[1182], a[11039]); -- Challenger: Legion Season 3
    A(t[1182], a[11040]); -- Rival: Legion Season 3
    A(t[1182], a[11041]); -- Duelist: Legion Season 3
    A(t[1182], a[11038]); -- Gladiator: Legion Season 3
    A(t[1182], a[11037]); -- Cruel Gladiator: Legion Season 3
    A(t[1182], a[11049]); -- Soldier of the Alliance: Legion Season 3
    A(t[1182], a[11048]); -- Soldier of the Horde: Legion Season 3
    A(t[1182], a[11045]); -- Defender of the Alliance: Legion Season 3
    A(t[1182], a[11044]); -- Defender of the Horde: Legion Season 3
    A(t[1182], a[11047]); -- Guardian of the Alliance: Legion Season 3
    A(t[1182], a[11046]); -- Guardian of the Horde: Legion Season 3
    A(t[1182], a[11043]); -- Hero of the Alliance: Cruel
    A(t[1182], a[11042]); -- Hero of the Horde: Cruel
    A(t[1182], a[11008]); -- Cruel Combatant
    A(t[1182], a[11005]); -- Cruel Combatant
    A(t[1182], a[11697]); -- Cruel Elite
    t[1183] = c:New(k.L["Season"] .. " " .. 4); -- Season 4
    C(t[1180], t[1183]);
    A(t[1183], a[11060]); -- Challenger: Legion Season 4
    A(t[1183], a[11059]); -- Rival: Legion Season 4
    A(t[1183], a[11058]); -- Duelist: Legion Season 4
    A(t[1183], a[11061]); -- Gladiator: Legion Season 4
    A(t[1183], a[11062]); -- Ferocious Gladiator: Legion Season 4
    A(t[1183], a[11050]); -- Soldier of the Alliance: Legion Season 4
    A(t[1183], a[11051]); -- Soldier of the Horde: Legion Season 4
    A(t[1183], a[11054]); -- Defender of the Alliance: Legion Season 4
    A(t[1183], a[11055]); -- Defender of the Horde: Legion Season 4
    A(t[1183], a[11052]); -- Guardian of the Alliance: Legion Season 4
    A(t[1183], a[11053]); -- Guardian of the Horde: Legion Season 4
    A(t[1183], a[11056]); -- Hero of the Alliance: Ferocious
    A(t[1183], a[11057]); -- Hero of the Horde: Ferocious
    A(t[1183], a[11010]); -- Ferocious Combatant
    A(t[1183], a[11009]); -- Ferocious Combatant
    A(t[1183], a[11698]); -- Ferocious Elite
    t[1184] = c:New(k.L["Season"] .. " " .. 5); -- Season 5
    C(t[1180], t[1184]);
    A(t[1184], a[12036]); -- Challenger: Legion Season 5
    A(t[1184], a[12035]); -- Rival: Legion Season 5
    A(t[1184], a[12034]); -- Duelist: Legion Season 5
    A(t[1184], a[12045]); -- Gladiator: Legion Season 5
    A(t[1184], a[12010]); -- Fierce Gladiator: Legion Season 5
    A(t[1184], a[12040]); -- Soldier of the Alliance: Legion Season 5
    A(t[1184], a[12044]); -- Soldier of the Horde: Legion Season 5
    A(t[1184], a[12039]); -- Defender of the Alliance: Legion Season 5
    A(t[1184], a[12043]); -- Defender of the Horde: Legion Season 5
    A(t[1184], a[12038]); -- Guardian of the Alliance: Legion Season 5
    A(t[1184], a[12042]); -- Guardian of the Horde: Legion Season 5
    A(t[1184], a[12037]); -- Hero of the Alliance: Fierce
    A(t[1184], a[12041]); -- Hero of the Horde: Fierce
    A(t[1184], a[12032]); -- Fierce Combatant
    A(t[1184], a[12031]); -- Fierce Combatant
    A(t[1184], a[12090]); -- Fierce Elite
    t[1185] = c:New(k.L["Season"] .. " " .. 6); -- Season 6
    C(t[1180], t[1185]);
    A(t[1185], a[12169]); -- Challenger: Legion Season 6
    A(t[1185], a[12170]); -- Rival: Legion Season 6
    A(t[1185], a[12171]); -- Duelist: Legion Season 6
    A(t[1185], a[12167]); -- Gladiator: Legion Season 6
    A(t[1185], a[12134]); -- Dominant Gladiator: Legion Season 6
    A(t[1185], a[12179]); -- Soldier of the Alliance: Legion Season 6
    A(t[1185], a[12178]); -- Soldier of the Horde: Legion Season 6
    A(t[1185], a[12175]); -- Defender of the Alliance: Legion Season 6
    A(t[1185], a[12174]); -- Defender of the Horde: Legion Season 6
    A(t[1185], a[12177]); -- Guardian of the Alliance: Legion Season 6
    A(t[1185], a[12176]); -- Guardian of the Horde: Legion Season 6
    A(t[1185], a[12173]); -- Hero of the Alliance: Dominant
    A(t[1185], a[12172]); -- Hero of the Horde: Dominant
    A(t[1185], a[12137]); -- Dominant Combatant
    A(t[1185], a[12136]); -- Dominant Combatant
    A(t[1185], a[12135]); -- Dominant Elite
    t[1186] = c:New(k.L["Season"] .. " " .. 7); -- Season 7
    C(t[1180], t[1186]);
    A(t[1186], a[12187]); -- Challenger: Legion Season 7
    A(t[1186], a[12188]); -- Rival: Legion Season 7
    A(t[1186], a[12186]); -- Duelist: Legion Season 7
    A(t[1186], a[12168]); -- Gladiator: Legion Season 7
    A(t[1186], a[12185]); -- Demonic Gladiator: Legion Season 7
    A(t[1186], a[12189]); -- Soldier of the Alliance: Legion Season 7
    A(t[1186], a[12190]); -- Soldier of the Horde: Legion Season 7
    A(t[1186], a[12195]); -- Defender of the Alliance: Legion Season 7
    A(t[1186], a[12194]); -- Defender of the Horde: Legion Season 7
    A(t[1186], a[12191]); -- Guardian of the Alliance: Legion Season 7
    A(t[1186], a[12192]); -- Guardian of the Horde: Legion Season 7
    A(t[1186], a[12197]); -- Hero of the Alliance: Demonic
    A(t[1186], a[12196]); -- Hero of the Horde: Demonic
    A(t[1186], a[12200]); -- Demonic Combatant
    A(t[1186], a[12199]); -- Demonic Combatant
    A(t[1186], a[12198]); -- Demonic Elite
    t[1192] = c:New(k.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    C(t[955], t[1192]);
    t[1193] = c:New(k.L["Season"] .. " " .. 1); -- Season 1
    C(t[1192], t[1193]);
    A(t[1193], a[13199]); -- Combatant: Battle for Azeroth Season 1
    A(t[1193], a[12959]); -- Challenger: Battle for Azeroth Season 1
    A(t[1193], a[12960]); -- Rival: Battle for Azeroth Season 1
    A(t[1193], a[12962]); -- Duelist: Battle for Azeroth Season 1
    A(t[1193], a[13465]); -- Elite: Battle for Azeroth Season 1
    A(t[1193], a[12945]); -- Dread Gladiator: Battle for Azeroth Season 1
    A(t[1193], a[12963]); -- Hero of the Alliance: Dread
    A(t[1193], a[12964]); -- Hero of the Horde: Dread
    t[1194] = c:New(k.L["Season"] .. " " .. 2); -- Season 2
    C(t[1192], t[1194]);
    A(t[1194], a[13204]); -- Combatant: Battle for Azeroth Season 2
    A(t[1194], a[13203]); -- Challenger: Battle for Azeroth Season 2
    A(t[1194], a[13205]); -- Rival: Battle for Azeroth Season 2
    A(t[1194], a[13209]); -- Duelist: Battle for Azeroth Season 2
    A(t[1194], a[13451]); -- Elite: Battle for Azeroth Season 2
    A(t[1194], a[13200]); -- Sinister Gladiator: Battle for Azeroth Season 2
    A(t[1194], a[13210]); -- Hero of the Alliance: Sinister
    A(t[1194], a[13211]); -- Hero of the Horde: Sinister
    t[1195] = c:New(k.L["Season"] .. " " .. 3); -- Season 3
    C(t[1192], t[1195]);
    A(t[1195], a[13639]); -- Combatant: Battle for Azeroth Season 3
    A(t[1195], a[13634]); -- Challenger: Battle for Azeroth Season 3
    A(t[1195], a[13641]); -- Rival: Battle for Azeroth Season 3
    A(t[1195], a[13642]); -- Duelist: Battle for Azeroth Season 3
    A(t[1195], a[13676]); -- Elite: Battle for Azeroth Season 3
    A(t[1195], a[13630]); -- Notorious Gladiator: Battle for Azeroth Season 3
    A(t[1195], a[13643]); -- Hero of the Alliance: Notorious
    A(t[1195], a[13644]); -- Hero of the Horde: Notorious
    t[1196] = c:New(k.L["Season"] .. " " .. 4); -- Season 4
    C(t[1192], t[1196]);
    A(t[1196], a[13962]); -- Combatant: Battle for Azeroth Season 4
    A(t[1196], a[13959]); -- Challenger: Battle for Azeroth Season 4
    A(t[1196], a[13963]); -- Rival: Battle for Azeroth Season 4
    A(t[1196], a[13964]); -- Duelist: Battle for Azeroth Season 4
    A(t[1196], a[13989]); -- Elite: Battle for Azeroth Season 4
    A(t[1196], a[13957]); -- Corrupted Gladiator: Battle for Azeroth Season 4
    A(t[1196], a[13966]); -- Hero of the Alliance: Corrupted
    A(t[1196], a[13965]); -- Hero of the Horde: Corrupted
    t[1187] = c:New(k.GetCategoryInfoTitle(15439)); -- Shadowlands
    C(t[955], t[1187]);
    t[1188] = c:New(k.L["Season"] .. " " .. 1); -- Season 1
    C(t[1187], t[1188]);
    A(t[1188], a[14685]); -- Combatant: Shadowlands Season 1
    A(t[1188], a[14686]); -- Challenger: Shadowlands Season 1
    A(t[1188], a[14687]); -- Rival: Shadowlands Season 1
    A(t[1188], a[14688]); -- Duelist: Shadowlands Season 1
    A(t[1188], a[14691]); -- Elite: Shadowlands Season 1
    A(t[1188], a[14690]); -- Sinful Gladiator: Shadowlands Season 1
    A(t[1188], a[14692]); -- Hero of the Alliance: Sinful
    A(t[1188], a[14693]); -- Hero of the Horde: Sinful
    t[1189] = c:New(k.L["Season"] .. " " .. 2); -- Season 2
    C(t[1187], t[1189]);
    A(t[1189], a[14968]); -- Combatant I: Shadowlands Season 2
    A(t[1189], a[15232]); -- Combatant II: Shadowlands Season 2
    A(t[1189], a[14969]); -- Challenger I: Shadowlands Season 2
    A(t[1189], a[15233]); -- Challenger II: Shadowlands Season 2
    A(t[1189], a[14970]); -- Rival I: Shadowlands Season 2
    A(t[1189], a[15234]); -- Rival II: Shadowlands Season 2
    A(t[1189], a[14971]); -- Duelist: Shadowlands Season 2
    A(t[1189], a[14974]); -- Elite: Shadowlands Season 2
    A(t[1189], a[14973]); -- Unchained Gladiator: Shadowlands Season 2
    A(t[1189], a[14976]); -- Hero of the Horde: Unchained
    A(t[1189], a[14975]); -- Hero of the Alliance: Unchained
    t[1190] = c:New(k.L["Season"] .. " " .. 3); -- Season 3
    C(t[1187], t[1190]);
    A(t[1190], a[15348]); -- Combatant I: Shadowlands Season 3
    A(t[1190], a[15380]); -- Combatant II: Shadowlands Season 3
    A(t[1190], a[15349]); -- Challenger I: Shadowlands Season 3
    A(t[1190], a[15379]); -- Challenger II: Shadowlands Season 3
    A(t[1190], a[15350]); -- Rival I: Shadowlands Season 3
    A(t[1190], a[15378]); -- Rival II: Shadowlands Season 3
    A(t[1190], a[15351]); -- Duelist: Shadowlands Season 3
    A(t[1190], a[15354]); -- Elite: Shadowlands Season 3
    A(t[1190], a[15353]); -- Cosmic Gladiator: Shadowlands Season 3
    A(t[1190], a[15355]); -- Hero of the Alliance: Cosmic
    A(t[1190], a[15356]); -- Hero of the Horde: Cosmic
    t[1191] = c:New(k.L["Season"] .. " " .. 4); -- Season 4
    C(t[1187], t[1191]);
    A(t[1191], a[15609]); -- Combatant I: Shadowlands Season 4
    A(t[1191], a[15610]); -- Combatant II: Shadowlands Season 4
    A(t[1191], a[15600]); -- Challenger I: Shadowlands Season 4
    A(t[1191], a[15601]); -- Challenger II: Shadowlands Season 4
    A(t[1191], a[15602]); -- Rival I: Shadowlands Season 4
    A(t[1191], a[15603]); -- Rival II: Shadowlands Season 4
    A(t[1191], a[15604]); -- Duelist: Shadowlands Season 4
    A(t[1191], a[15639]); -- Elite: Shadowlands Season 4
    A(t[1191], a[15606]); -- Eternal Gladiator: Shadowlands Season 4
    A(t[1191], a[15608]); -- Hero of the Alliance: Eternal
    A(t[1191], a[15607]); -- Hero of the Horde: Eternal
    t[1344] = c:New(k.GetCategoryInfoTitle(15466)); -- Dragonflight
    C(t[955], t[1344]);
    t[1345] = c:New(k.L["Season"] .. " " .. 1); -- Season 1
    C(t[1344], t[1345]);
    A(t[1345], a[15960]); -- Combatant I: Dragonflight Season 1
    A(t[1345], a[15961]); -- Combatant II: Dragonflight Season 1
    A(t[1345], a[15955]); -- Challenger I: Dragonflight Season 1
    A(t[1345], a[15956]); -- Challenger II: Dragonflight Season 1
    A(t[1345], a[15952]); -- Rival I: Dragonflight Season 1
    A(t[1345], a[15953]); -- Rival II: Dragonflight Season 1
    A(t[1345], a[15954]); -- Duelist: Dragonflight Season 1
    A(t[1345], a[15984]); -- Elite: Dragonflight Season 1
    A(t[1345], a[15951]); -- Crimson Gladiator: Dragonflight Season 1
    A(t[1345], a[15959]); -- Hero of the Alliance: Crimson
    A(t[1345], a[15958]); -- Hero of the Horde: Crimson
    A(t[1345], a[16734]); -- Crimson Soloist: Dragonflight Season 1
    A(t[1345], a[17119]); -- Deep Cuts From the Vault
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
    A(t[978], a[16730]); -- Crimson Gladiator's Drake
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
    A(t[1085], a[7520]); -- The Loremaster
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
    t[1094] = c:New(k.L["Events"], true); -- Events
    C(t[1084], t[1094]);
    A(t[1094], a[913]); -- To Honor One's Elders
    A(t[1094], a[1693]); -- Fool For Love
    A(t[1094], a[2798]); -- Noble Gardener
    A(t[1094], a[1793]); -- For the Children
    A(t[1094], a[1038]); -- The Flame Warden
    A(t[1094], a[1039]); -- The Flame Keeper
    A(t[1094], a[1683]); -- Brewmaster
    A(t[1094], a[1656]); -- Hallowed Be Thy Name
    A(t[1094], a[3478]); -- Pilgrim
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
    A(t[1101], a[17119]); -- Deep Cuts From the Vault
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
    A(t[1104], a[16764]); -- Crimson Carpet Fashion
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
    t[1108] = c:New(k.L["Level 85"], true); -- Level 85
    C(t[1106], t[1108]);
    A(t[1108], a[4999]); -- Realm First! Level 85
    A(t[1108], a[5007]); -- Realm First! Level 85 Warrior
    A(t[1108], a[5001]); -- Realm First! Level 85 Paladin
    A(t[1108], a[5004]); -- Realm First! Level 85 Hunter
    A(t[1108], a[5008]); -- Realm First! Level 85 Rogue
    A(t[1108], a[5002]); -- Realm First! Level 85 Priest
    A(t[1108], a[5005]); -- Realm First! Level 85 Death Knight
    A(t[1108], a[4998]); -- Realm First! Level 85 Shaman
    A(t[1108], a[5006]); -- Realm First! Level 85 Mage
    A(t[1108], a[5003]); -- Realm First! Level 85 Warlock
    A(t[1108], a[5000]); -- Realm First! Level 85 Druid
    t[1109] = c:New(k.L["Level 90"], true); -- Level 90
    C(t[1106], t[1109]);
    A(t[1109], a[6524]); -- Realm First! Level 90
    A(t[1109], a[6750]); -- Realm First! Level 90 Warrior
    A(t[1109], a[6744]); -- Realm First! Level 90 Paladin
    A(t[1109], a[6747]); -- Realm First! Level 90 Hunter
    A(t[1109], a[6751]); -- Realm First! Level 90 Rogue
    A(t[1109], a[6745]); -- Realm First! Level 90 Priest
    A(t[1109], a[6748]); -- Realm First! Level 90 Death Knight
    A(t[1109], a[6523]); -- Realm First! Level 90 Shaman
    A(t[1109], a[6749]); -- Realm First! Level 90 Mage
    A(t[1109], a[6746]); -- Realm First! Level 90 Warlock
    A(t[1109], a[6752]); -- Realm First! Level 90 Monk
    A(t[1109], a[6743]); -- Realm First! Level 90 Druid
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
    t[1112] = c:New(k.L["525 skill"], true); -- 525 skill
    C(t[1110], t[1112]);
    A(t[1112], a[5381]); -- Realm First! Illustrious Alchemist
    A(t[1112], a[5387]); -- Realm First! Illustrious Angler
    A(t[1112], a[5396]); -- Realm First! Illustrious Archaeologist
    A(t[1112], a[5382]); -- Realm First! Illustrious Blacksmith
    A(t[1112], a[5383]); -- Realm First! Illustrious Cook
    A(t[1112], a[5384]); -- Realm First! Illustrious Enchanter
    A(t[1112], a[5385]); -- Realm First! Illustrious Engineer
    A(t[1112], a[5388]); -- Realm First! Illustrious Herbalist
    A(t[1112], a[5390]); -- Realm First! Illustrious Jewelcrafter
    A(t[1112], a[5391]); -- Realm First! Illustrious Leatherworker
    A(t[1112], a[5386]); -- Realm First! Illustrious Medic
    A(t[1112], a[5392]); -- Realm First! Illustrious Miner
    A(t[1112], a[5389]); -- Realm First! Illustrious Scribe
    A(t[1112], a[5393]); -- Realm First! Illustrious Skinner
    A(t[1112], a[5394]); -- Realm First! Illustrious Tailor
    t[1113] = c:New(k.L["600 skill"], true); -- 600 skill
    C(t[1110], t[1113]);
    A(t[1113], a[6859]); -- Realm First! Zen Master Alchemist
    A(t[1113], a[6865]); -- Realm First! Zen Master Angler
    A(t[1113], a[6873]); -- Realm First! Zen Master Archaeologist
    A(t[1113], a[6860]); -- Realm First! Zen Master Blacksmith
    A(t[1113], a[6861]); -- Realm First! Zen Master Cook
    A(t[1113], a[6862]); -- Realm First! Zen Master Enchanter
    A(t[1113], a[6863]); -- Realm First! Zen Master Engineer
    A(t[1113], a[6866]); -- Realm First! Zen Master Herbalist
    A(t[1113], a[6868]); -- Realm First! Zen Master Jewelcrafter
    A(t[1113], a[6869]); -- Realm First! Zen Master Leatherworker
    A(t[1113], a[6864]); -- Realm First! Zen Master Medic
    A(t[1113], a[6870]); -- Realm First! Zen Master Miner
    A(t[1113], a[6867]); -- Realm First! Zen Master Scribe
    A(t[1113], a[6871]); -- Realm First! Zen Master Skinner
    A(t[1113], a[6872]); -- Realm First! Zen Master Tailor
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
    A(t[1114], a[16801]); -- Realm First! Dragonflight Keystone Hero
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
    t[1373] = c:New(k.L["Dragonflight Pre-patch"]); -- Dragonflight Pre-patch
    C(t[1372], t[1373]);
    t[1376] = c:New(k.GetCategoryInfoTitle(15272)); -- Dungeons
    C(t[1373], t[1376]);
    A(t[1376], a[15688]); -- Shadowlands Keystone Explorer: Season Four
    A(t[1376], a[15689]); -- Shadowlands Keystone Conqueror: Season Four
    A(t[1376], a[15690]); -- Shadowlands Keystone Master: Season Four
    A(t[1376], a[15756]); -- Shrouded Hero: Shadowlands Season 4
    A(t[1376], a[15694]); -- Keystone Hero: Iron Docks
    A(t[1376], a[15695]); -- Keystone Hero: Grimrail Depot
    A(t[1376], a[15692]); -- Keystone Hero: Return to Karazhan
    A(t[1376], a[15693]); -- Keystone Hero: Operation: Mechagon
    t[1377] = c:New(k.GetCategoryInfoTitle(95)); -- Player vs. Player
    C(t[1373], t[1377]);
    A(t[1377], a[15609]); -- Combatant I: Shadowlands Season 4
    A(t[1377], a[15610]); -- Combatant II: Shadowlands Season 4
    A(t[1377], a[15600]); -- Challenger I: Shadowlands Season 4
    A(t[1377], a[15601]); -- Challenger II: Shadowlands Season 4
    A(t[1377], a[15602]); -- Rival I: Shadowlands Season 4
    A(t[1377], a[15603]); -- Rival II: Shadowlands Season 4
    A(t[1377], a[15604]); -- Duelist: Shadowlands Season 4
    A(t[1377], a[15639]); -- Elite: Shadowlands Season 4
    A(t[1377], a[15606]); -- Eternal Gladiator: Shadowlands Season 4
    A(t[1377], a[15608]); -- Hero of the Alliance: Eternal
    A(t[1377], a[15607]); -- Hero of the Horde: Eternal
    t[1375] = c:New(k.L["Dragonflight"]); -- Dragonflight
    C(t[1372], t[1375]);
    A(t[1375], a[15654]); -- Back from the Beyond
    t[1374] = c:New(k.GetCategoryInfoTitle(15271)); -- Raids
    C(t[1375], t[1374]);
    A(t[1374], a[15663]); -- Fate of Nathria
    A(t[1374], a[15664]); -- Heroic: Fate of Nathria
    A(t[1374], a[15665]); -- Mythic: Fate of Nathria
    A(t[1374], a[15667]); -- Fate of Domination
    A(t[1374], a[15668]); -- Heroic: Fate of Domination
    A(t[1374], a[15669]); -- Mythic: Fate of Domination
    A(t[1374], a[15681]); -- Fate of the Sepulcher
    A(t[1374], a[15682]); -- Heroic: Fate of the Sepulcher
    A(t[1374], a[15683]); -- Mythic: Fate of the Sepulcher
    A(t[1374], a[15684]); -- Fates of the Shadowlands Raids
    A(t[1374], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    A(t[1374], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    A(t[1374], a[15468]); -- We Are All Made of Stars (Heroic)
    A(t[1374], a[15469]); -- We Are All Made of Stars (Mythic)
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
    return tabs, watchListCategories, currentZoneCategories, selectedZoneCategories, trackingAchievementsCategories, excludedCategories;
end

function exportedCategories.InjectOptions()
    local defaultsWatchList = {};
    defaultsWatchList[1] = false;
    defaultsWatchList[2] = false;
    defaultsWatchList[3] = false;
    defaultsWatchList[4] = false;
    defaultsWatchList[5] = true;

    k.Options.InjectDefaults(defaultsWatchList, "WatchList", "AdjustableCategories");

    local optionsTableWatchList = {
        order = 2, type = "group",
        name = k.L["Watch List"],
        args = {
            Tabs = {
                order = 9, type = "header",
                name = k.L["Tabs"]
            },
            Achievements = {
                order = 10, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Achievements"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.WatchList[1]; end,
                set = function()
                    k.Options.db.AdjustableCategories.WatchList[1] = not k.Options.db.AdjustableCategories.WatchList[1];
                    k.Diagnostics.Debug(k.L["Achievements"], k.Options.db.AdjustableCategories.WatchList[1]);
                end
            },
            Expansions = {
                order = 11, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Expansions"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.WatchList[2]; end,
                set = function()
                    k.Options.db.AdjustableCategories.WatchList[2] = not k.Options.db.AdjustableCategories.WatchList[2];
                    k.Diagnostics.Debug(k.L["Expansions"], k.Options.db.AdjustableCategories.WatchList[2]);
                end
            },
            Events = {
                order = 12, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Events"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.WatchList[3]; end,
                set = function()
                    k.Options.db.AdjustableCategories.WatchList[3] = not k.Options.db.AdjustableCategories.WatchList[3];
                    k.Diagnostics.Debug(k.L["Events"], k.Options.db.AdjustableCategories.WatchList[3]);
                end
            },
            PvP = {
                order = 13, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.GetCategoryInfoTitle(95),
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.WatchList[4]; end,
                set = function()
                    k.Options.db.AdjustableCategories.WatchList[4] = not k.Options.db.AdjustableCategories.WatchList[4];
                    k.Diagnostics.Debug(k.GetCategoryInfoTitle(95), k.Options.db.AdjustableCategories.WatchList[4]);
                end
            },
            Specials = {
                order = 14, type = "toggle", width = 1 * k.Options.WidthMultiplier,
                name = k.L["Specials"],
                desc = k.L["Requires a reload"],
                get = function() return k.Options.db.AdjustableCategories.WatchList[5]; end,
                set = function()
                    k.Options.db.AdjustableCategories.WatchList[5] = not k.Options.db.AdjustableCategories.WatchList[5];
                    k.Diagnostics.Debug(k.L["Specials"], k.Options.db.AdjustableCategories.WatchList[5]);
                end
            },
        }
    };

    k.Options.InjectOptionsTable(optionsTableWatchList, "WatchList", "Layout", "args", "AdjustableCategories", "args");

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

