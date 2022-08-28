-- [[ Exported at 2022-08-28 10-17-55 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local cat = objects.Category;
local data = addon.Data;
data.ExportedCategories = {};
local exportedCategories = data.ExportedCategories;

local function AddC(c1, c2)
    c1:AddCategory(c2)
end

local function AddA(c, a)
    c:AddAchievement(a)
end

function exportedCategories.Load(a)
    local tmp = {};
    local focusedCategories = {};
    local currentZoneCategories = {};
    local selectedZoneCategories = {};
    local excludedCategories = {};
    tmp[1100] = cat:New(addon.L["Achievements"]); -- TAB - Achievements
    tmp[1100].TabName = "Achievements";
    local achievements = tmp[1100];
    tmp[1202] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[1100], tmp[1202]);
    tmp[1202].AlwaysVisible = true;
    tmp[1202].IsSummary = true;
    tmp[1216] = cat:New(addon.L["Focused"]); -- Focused
    AddC(tmp[1100], tmp[1216]);
    tmp[1216].HasFlexibleData = true;
    tinsert(focusedCategories, tmp[1216]);
    tmp[1216].IsFocused = true;
    tmp[1212] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[1100], tmp[1212]);
    tmp[1212].HasFlexibleData = true;
    tinsert(currentZoneCategories, tmp[1212]);
    tmp[1212].IsCurrentZone = true;
    tmp[1220] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[1100], tmp[1220]);
    tmp[1220].HasFlexibleData = true;
    tinsert(selectedZoneCategories, tmp[1220]);
    tmp[1220].IsSelectedZone = true;
    tmp[1224] = cat:New(addon.L["Excluded"]); -- Excluded
    AddC(tmp[1100], tmp[1224]);
    tmp[1224].HasFlexibleData = true;
    tinsert(excludedCategories, tmp[1224]);
    tmp[1224].IsExcluded = true;
    tmp[883] = cat:New(addon.L["Expansions"]); -- TAB - Expansions
    tmp[883].TabName = "Expansions";
    local expansions = tmp[883];
    tmp[1203] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[883], tmp[1203]);
    tmp[1203].AlwaysVisible = true;
    tmp[1203].IsSummary = true;
    tmp[1217] = cat:New(addon.L["Focused"]); -- Focused
    AddC(tmp[883], tmp[1217]);
    tmp[1217].HasFlexibleData = true;
    tinsert(focusedCategories, tmp[1217]);
    tmp[1217].IsFocused = true;
    tmp[1213] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[883], tmp[1213]);
    tmp[1213].HasFlexibleData = true;
    tinsert(currentZoneCategories, tmp[1213]);
    tmp[1213].IsCurrentZone = true;
    tmp[1223] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[883], tmp[1223]);
    tmp[1223].HasFlexibleData = true;
    tinsert(selectedZoneCategories, tmp[1223]);
    tmp[1223].IsSelectedZone = true;
    tmp[1] = cat:New(addon.GetCategoryInfoTitle(14864)); -- Classic
    AddC(tmp[883], tmp[1]);
    tmp[648] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[1], tmp[648]);
    AddA(tmp[648], a[1206]); -- To All The Squirrels I've Loved Before
    AddA(tmp[648], a[944]); -- They Love Me In That Tunnel
    AddA(tmp[648], a[942]); -- The Diplomat
    AddA(tmp[648], a[943]); -- The Diplomat
    tmp[687] = cat:New(addon.GetMapName(13)); -- Eastern Kingdoms
    AddC(tmp[648], tmp[687]);
    AddA(tmp[687], a[1676]); -- Loremaster of Eastern Kingdoms
    AddA(tmp[687], a[42]); -- Eastern Kingdoms Explorer
    AddA(tmp[687], a[7520]); -- The Loremaster
    tmp[922] = cat:New(addon.GetMapName(84)); -- Stormwind City
    AddC(tmp[687], tmp[922]);
    AddA(tmp[922], a[615]); -- Storming Stormwind
    AddA(tmp[922], a[14815]); -- Executing the Exarch
    AddA(tmp[922], a[388]); -- City Defender
    AddA(tmp[922], a[11065]); -- It All Makes Sense Now
    AddA(tmp[922], a[603]); -- Wrath of the Horde
    tmp[1033] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[922], tmp[1033]);
    AddA(tmp[1033], a[9924]); -- Field Photographer
    tmp[1022] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[922], tmp[1022]);
    AddA(tmp[1022], a[948]); -- Ambassador of the Alliance
    tmp[970] = cat:New(addon.GetMapName(87)); -- Ironforge
    AddC(tmp[687], tmp[970]);
    AddA(tmp[970], a[616]); -- Overthrow the Council
    AddA(tmp[970], a[619]); -- For the Horde!
    AddA(tmp[970], a[603]); -- Wrath of the Horde
    tmp[974] = cat:New(addon.GetMapName(90)); -- Undercity
    AddC(tmp[687], tmp[974]);
    AddA(tmp[974], a[612]); -- Downing the Dark Lady
    AddA(tmp[974], a[604]); -- Wrath of the Alliance
    tmp[721] = cat:New(addon.GetMapName(27)); -- Dun Morogh
    AddC(tmp[687], tmp[721]);
    AddA(tmp[721], a[11200]); -- Stand Against the Legion
    AddA(tmp[721], a[11201]); -- Defender of Azeroth: Legion Invasions
    AddA(tmp[721], a[4786]); -- Operation: Gnomeregan
    tmp[723] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[721], tmp[723]);
    AddA(tmp[723], a[627]); -- Explore Dun Morogh
    tmp[1005] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[721], tmp[1005]);
    AddA(tmp[1005], a[948]); -- Ambassador of the Alliance
    tmp[722] = cat:New(addon.GetMapName(37)); -- Elwynn Forest
    AddC(tmp[687], tmp[722]);
    tmp[724] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[722], tmp[724]);
    AddA(tmp[724], a[776]); -- Explore Elwynn Forest
    AddA(tmp[724], a[9924]); -- Field Photographer
    tmp[1006] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[722], tmp[1006]);
    AddA(tmp[1006], a[948]); -- Ambassador of the Alliance
    tmp[725] = cat:New(addon.GetMapName(18)); -- Tirisfal Glades
    AddC(tmp[687], tmp[725]);
    tmp[1201] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[725], tmp[1201]);
    AddA(tmp[1201], a[15579]); -- Return to Lordaeron
    tmp[726] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[725], tmp[726]);
    AddA(tmp[726], a[768]); -- Explore Tirisfal Glades
    tmp[1026] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[725], tmp[1026]);
    AddA(tmp[1026], a[762]); -- Ambassador of the Horde
    tmp[651] = cat:New(addon.GetMapName(52)); -- Westfall
    AddC(tmp[687], tmp[651]);
    AddA(tmp[651], a[11200]); -- Stand Against the Legion
    AddA(tmp[651], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[653] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[651], tmp[653]);
    AddA(tmp[653], a[4903]); -- Westfall Quests
    AddA(tmp[653], a[12455]); -- Westfall & Duskwood Quests
    tmp[730] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[651], tmp[730]);
    AddA(tmp[730], a[802]); -- Explore Westfall
    AddA(tmp[730], a[9924]); -- Field Photographer
    tmp[1028] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[651], tmp[1028]);
    AddA(tmp[1028], a[948]); -- Ambassador of the Alliance
    tmp[655] = cat:New(addon.GetMapName(48)); -- Loch Modan
    AddC(tmp[687], tmp[655]);
    tmp[657] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[655], tmp[657]);
    AddA(tmp[657], a[4899]); -- Loch Modan Quests
    AddA(tmp[657], a[12456]); -- Loch Modan & Wetlands Quests
    tmp[729] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[655], tmp[729]);
    AddA(tmp[729], a[779]); -- Explore Loch Modan
    AddA(tmp[729], a[9924]); -- Field Photographer
    tmp[1013] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[655], tmp[1013]);
    AddA(tmp[1013], a[948]); -- Ambassador of the Alliance
    tmp[681] = cat:New(addon.GetMapName(21)); -- Silverpine Forest
    AddC(tmp[687], tmp[681]);
    tmp[682] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[681], tmp[682]);
    AddA(tmp[682], a[4894]); -- Silverpine Forest Quests
    tmp[732] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[681], tmp[732]);
    AddA(tmp[732], a[769]); -- Explore Silverpine Forest
    tmp[1020] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[681], tmp[1020]);
    AddA(tmp[1020], a[762]); -- Ambassador of the Horde
    tmp[678] = cat:New(addon.GetMapName(49)); -- Redridge Mountains
    AddC(tmp[687], tmp[678]);
    tmp[677] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[678], tmp[677]);
    AddA(tmp[677], a[4902]); -- Redridge Mountains Quests
    tmp[734] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[678], tmp[734]);
    AddA(tmp[734], a[780]); -- Explore Redridge Mountains
    tmp[1017] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[678], tmp[1017]);
    AddA(tmp[1017], a[948]); -- Ambassador of the Alliance
    tmp[652] = cat:New(addon.GetMapName(47)); -- Duskwood
    AddC(tmp[687], tmp[652]);
    tmp[654] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[652], tmp[654]);
    AddA(tmp[654], a[12430]); -- Duskwood Quests
    AddA(tmp[654], a[12455]); -- Westfall & Duskwood Quests
    tmp[735] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[652], tmp[735]);
    AddA(tmp[735], a[778]); -- Explore Duskwood
    AddA(tmp[735], a[9924]); -- Field Photographer
    tmp[1007] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[652], tmp[1007]);
    AddA(tmp[1007], a[948]); -- Ambassador of the Alliance
    tmp[656] = cat:New(addon.GetMapName(56)); -- Wetlands
    AddC(tmp[687], tmp[656]);
    tmp[658] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[656], tmp[658]);
    AddA(tmp[658], a[12429]); -- Wetlands Quests
    AddA(tmp[658], a[12456]); -- Loch Modan & Wetlands Quests
    tmp[731] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[656], tmp[731]);
    AddA(tmp[731], a[841]); -- Explore Wetlands
    AddA(tmp[731], a[9924]); -- Field Photographer
    tmp[1029] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[656], tmp[1029]);
    AddA(tmp[1029], a[948]); -- Ambassador of the Alliance
    tmp[671] = cat:New(addon.GetMapName(25)); -- Hillsbrad Foothills
    AddC(tmp[687], tmp[671]);
    AddA(tmp[671], a[11200]); -- Stand Against the Legion
    AddA(tmp[671], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[672] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[671], tmp[672]);
    AddA(tmp[672], a[4895]); -- Hillsbrad Foothills Quests
    tmp[736] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[671], tmp[736]);
    AddA(tmp[736], a[772]); -- Explore Hillsbrad Foothills
    AddA(tmp[736], a[9924]); -- Field Photographer
    tmp[1012] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[671], tmp[1012]);
    AddA(tmp[1012], a[762]); -- Ambassador of the Horde
    AddA(tmp[1012], a[2336]); -- Insane in the Membrane
    tmp[649] = cat:New(addon.GetMapName(14)); -- Arathi Highlands
    AddC(tmp[687], tmp[649]);
    tmp[650] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[649], tmp[650]);
    AddA(tmp[650], a[4896]); -- Arathi Highlands Quests
    tmp[741] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[649], tmp[741]);
    AddA(tmp[741], a[761]); -- Explore Arathi Highlands
    tmp[996] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[649], tmp[996]);
    AddA(tmp[996], a[948]); -- Ambassador of the Alliance
    AddA(tmp[996], a[762]); -- Ambassador of the Horde
    tmp[675] = cat:New(addon.GetMapName(50)); -- Northern Stranglethorn
    AddC(tmp[687], tmp[675]);
    tmp[676] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[675], tmp[676]);
    AddA(tmp[676], a[4906]); -- Northern Stranglethorn Quests
    AddA(tmp[676], a[940]); -- The Green Hills of Stranglethorn
    AddA(tmp[676], a[941]); -- Hemet Nesingwary: The Collected Quests
    tmp[739] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[675], tmp[739]);
    AddA(tmp[739], a[781]); -- Explore Northern Stranglethorn
    tmp[1016] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[675], tmp[1016]);
    AddA(tmp[1016], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1016], a[762]); -- Ambassador of the Horde
    tmp[665] = cat:New(addon.GetMapName(210)); -- The Cape of Stranglethorn
    AddC(tmp[687], tmp[665]);
    tmp[666] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[665], tmp[666]);
    AddA(tmp[666], a[4905]); -- Cape of Stranglethorn Quests
    tmp[740] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[665], tmp[740]);
    AddA(tmp[740], a[4995]); -- Explore the Cape of Stranglethorn
    AddA(tmp[740], a[9924]); -- Field Photographer
    tmp[1164] = cat:New(addon.GetCategoryInfoTitle(95)); -- Player vs. Player
    AddC(tmp[665], tmp[1164]);
    AddA(tmp[1164], a[389]); -- Gurubashi Arena Master
    AddA(tmp[1164], a[396]); -- Gurubashi Arena Grand Master
    tmp[993] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[665], tmp[993]);
    AddA(tmp[993], a[762]); -- Ambassador of the Horde
    AddA(tmp[993], a[871]); -- "Avast Ye, Admiral!"
    AddA(tmp[993], a[2336]); -- Insane in the Membrane
    tmp[685] = cat:New(addon.GetMapName(22)); -- Western Plaguelands
    AddC(tmp[687], tmp[685]);
    tmp[686] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[685], tmp[686]);
    AddA(tmp[686], a[4893]); -- Western Plaguelands Quests
    tmp[746] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[685], tmp[746]);
    AddA(tmp[746], a[770]); -- Explore Western Plaguelands
    AddA(tmp[746], a[9924]); -- Field Photographer
    tmp[1027] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[685], tmp[1027]);
    AddA(tmp[1027], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1027], a[762]); -- Ambassador of the Horde
    tmp[673] = cat:New(addon.GetMapName(26)); -- The Hinterlands
    AddC(tmp[687], tmp[673]);
    tmp[674] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[673], tmp[674]);
    AddA(tmp[674], a[4897]); -- Hinterlands Quests
    tmp[742] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[673], tmp[742]);
    AddA(tmp[742], a[773]); -- Explore The Hinterlands
    tmp[1024] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[673], tmp[1024]);
    AddA(tmp[1024], a[762]); -- Ambassador of the Horde
    tmp[667] = cat:New(addon.GetMapName(23)); -- Eastern Plaguelands
    AddC(tmp[687], tmp[667]);
    AddA(tmp[667], a[11297]); -- The Balance of Light and Shadow
    tmp[668] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[667], tmp[668]);
    AddA(tmp[668], a[4892]); -- Eastern Plaguelands Quests
    AddA(tmp[668], a[5442]); -- Full Caravan
    tmp[747] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[667], tmp[747]);
    AddA(tmp[747], a[771]); -- Explore Eastern Plaguelands
    AddA(tmp[747], a[9924]); -- Field Photographer
    tmp[778] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[667], tmp[778]);
    AddA(tmp[778], a[946]); -- The Argent Dawn
    AddA(tmp[778], a[945]); -- The Argent Champion
    tmp[659] = cat:New(addon.GetMapName(15)); -- Badlands
    AddC(tmp[687], tmp[659]);
    tmp[661] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[659], tmp[661]);
    AddA(tmp[661], a[4900]); -- Badlands Quests
    AddA(tmp[661], a[5444]); -- "Ready, Set, Goat!"
    tmp[738] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[659], tmp[738]);
    AddA(tmp[738], a[765]); -- Explore Badlands
    tmp[679] = cat:New(addon.GetMapName(32)); -- Searing Gorge
    AddC(tmp[687], tmp[679]);
    tmp[680] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[679], tmp[680]);
    AddA(tmp[680], a[4910]); -- Searing Gorge Quests
    tmp[743] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[679], tmp[743]);
    AddA(tmp[743], a[774]); -- Explore Searing Gorge
    tmp[683] = cat:New(addon.GetMapName(51)); -- Swamp of Sorrows
    AddC(tmp[687], tmp[683]);
    tmp[684] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[683], tmp[684]);
    AddA(tmp[684], a[4904]); -- Swamp of Sorrows Quests
    tmp[737] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[683], tmp[737]);
    AddA(tmp[737], a[782]); -- Explore Swamp of Sorrows
    tmp[1023] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[683], tmp[1023]);
    AddA(tmp[1023], a[948]); -- Ambassador of the Alliance
    tmp[663] = cat:New(addon.GetMapName(36)); -- Burning Steppes
    AddC(tmp[687], tmp[663]);
    AddA(tmp[663], a[11296]); -- The Ancient Keeper
    tmp[664] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[663], tmp[664]);
    AddA(tmp[664], a[4901]); -- Burning Steppes Quests
    tmp[745] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[663], tmp[745]);
    AddA(tmp[745], a[775]); -- Explore Burning Steppes
    AddA(tmp[745], a[9924]); -- Field Photographer
    tmp[660] = cat:New(addon.GetMapName(17)); -- Blasted Lands
    AddC(tmp[687], tmp[660]);
    AddA(tmp[660], a[9618]); -- The Iron Invasion
    AddA(tmp[660], a[11297]); -- The Balance of Light and Shadow
    tmp[662] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[660], tmp[662]);
    AddA(tmp[662], a[4909]); -- Blasted Lands Quests
    tmp[744] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[660], tmp[744]);
    AddA(tmp[744], a[766]); -- Explore Blasted Lands
    AddA(tmp[744], a[9924]); -- Field Photographer
    tmp[999] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[660], tmp[999]);
    AddA(tmp[999], a[948]); -- Ambassador of the Alliance
    AddA(tmp[999], a[762]); -- Ambassador of the Horde
    tmp[748] = cat:New(addon.GetMapName(42)); -- Deadwind Pass
    AddC(tmp[687], tmp[748]);
    tmp[749] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[748], tmp[749]);
    AddA(tmp[749], a[777]); -- Explore Deadwind Pass
    tmp[688] = cat:New(addon.GetMapName(12)); -- Kalimdor
    AddC(tmp[648], tmp[688]);
    AddA(tmp[688], a[1678]); -- Loremaster of Kalimdor
    AddA(tmp[688], a[43]); -- Kalimdor Explorer
    AddA(tmp[688], a[7520]); -- The Loremaster
    tmp[975] = cat:New(addon.GetMapName(89)); -- Darnassus
    AddC(tmp[688], tmp[975]);
    AddA(tmp[975], a[617]); -- Immortal No More
    AddA(tmp[975], a[603]); -- Wrath of the Horde
    tmp[921] = cat:New(addon.GetMapName(85)); -- Orgrimmar
    AddC(tmp[688], tmp[921]);
    AddA(tmp[921], a[610]); -- Orgrimmar Offensive
    AddA(tmp[921], a[14817]); -- Opposing Orgrimmar
    AddA(tmp[921], a[614]); -- For the Alliance!
    AddA(tmp[921], a[1006]); -- City Defender
    AddA(tmp[921], a[11065]); -- It All Makes Sense Now
    AddA(tmp[921], a[604]); -- Wrath of the Alliance
    tmp[1018] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[921], tmp[1018]);
    AddA(tmp[1018], a[762]); -- Ambassador of the Horde
    tmp[923] = cat:New(addon.GetMapName(88)); -- Thunder Bluff
    AddC(tmp[688], tmp[923]);
    AddA(tmp[923], a[611]); -- Bleeding Bloodhoof
    AddA(tmp[923], a[604]); -- Wrath of the Alliance
    tmp[756] = cat:New(addon.GetMapName(57)); -- Teldrassil
    AddC(tmp[688], tmp[756]);
    tmp[757] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[756], tmp[757]);
    AddA(tmp[757], a[842]); -- Explore Teldrassil
    tmp[1025] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[756], tmp[1025]);
    AddA(tmp[1025], a[948]); -- Ambassador of the Alliance
    tmp[752] = cat:New(addon.GetMapName(1)); -- Durotar
    AddC(tmp[688], tmp[752]);
    AddA(tmp[752], a[4790]); -- Zalazane's Fall
    tmp[753] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[752], tmp[753]);
    AddA(tmp[753], a[728]); -- Explore Durotar
    AddA(tmp[753], a[9924]); -- Field Photographer
    tmp[1003] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[752], tmp[1003]);
    AddA(tmp[1003], a[762]); -- Ambassador of the Horde
    tmp[754] = cat:New(addon.GetMapName(7)); -- Mulgore
    AddC(tmp[688], tmp[754]);
    tmp[755] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[754], tmp[755]);
    AddA(tmp[755], a[736]); -- Explore Mulgore
    tmp[1014] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[754], tmp[1014]);
    AddA(tmp[1014], a[762]); -- Ambassador of the Horde
    tmp[774] = cat:New(addon.GetMapName(80)); -- Moonglade
    AddC(tmp[688], tmp[774]);
    tmp[775] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[774], tmp[775]);
    AddA(tmp[775], a[855]); -- Explore Moonglade
    AddA(tmp[775], a[9924]); -- Field Photographer
    tmp[705] = cat:New(addon.GetMapName(10)); -- Northern Barrens
    AddC(tmp[688], tmp[705]);
    AddA(tmp[705], a[11200]); -- Stand Against the Legion
    AddA(tmp[705], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[706] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[705], tmp[706]);
    AddA(tmp[706], a[4933]); -- Northern Barrens Quests
    tmp[760] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[705], tmp[760]);
    AddA(tmp[760], a[750]); -- Explore Northern Barrens
    tmp[1015] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[705], tmp[1015]);
    AddA(tmp[1015], a[762]); -- Ambassador of the Horde
    AddA(tmp[1015], a[2336]); -- Insane in the Membrane
    tmp[695] = cat:New(addon.GetMapName(62)); -- Darkshore
    AddC(tmp[688], tmp[695]);
    tmp[696] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[695], tmp[696]);
    AddA(tmp[696], a[4928]); -- Darkshore Quests
    AddA(tmp[696], a[5453]); -- Ghosts in the Dark
    tmp[762] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[695], tmp[762]);
    AddA(tmp[762], a[844]); -- Explore Darkshore
    tmp[1001] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[695], tmp[1001]);
    AddA(tmp[1001], a[948]); -- Ambassador of the Alliance
    tmp[691] = cat:New(addon.GetMapName(76)); -- Azshara
    AddC(tmp[688], tmp[691]);
    AddA(tmp[691], a[11200]); -- Stand Against the Legion
    AddA(tmp[691], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[692] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[691], tmp[692]);
    AddA(tmp[692], a[4927]); -- Azshara Quests
    AddA(tmp[692], a[5454]); -- Joy Ride
    AddA(tmp[692], a[5448]); -- Glutton for Fiery Punishment
    AddA(tmp[692], a[5546]); -- Glutton for Icy Punishment
    AddA(tmp[692], a[5547]); -- Glutton for Shadowy Punishment
    tmp[771] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[691], tmp[771]);
    AddA(tmp[771], a[852]); -- Explore Azshara
    tmp[990] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[691], tmp[990]);
    AddA(tmp[990], a[762]); -- Ambassador of the Horde
    tmp[689] = cat:New(addon.GetMapName(63)); -- Ashenvale
    AddC(tmp[688], tmp[689]);
    tmp[690] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[689], tmp[690]);
    AddA(tmp[690], a[4925]); -- Ashenvale Quests
    AddA(tmp[690], a[4976]); -- Ashenvale Quests
    tmp[764] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[689], tmp[764]);
    AddA(tmp[764], a[845]); -- Explore Ashenvale
    tmp[997] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[689], tmp[997]);
    AddA(tmp[997], a[948]); -- Ambassador of the Alliance
    tmp[709] = cat:New(addon.GetMapName(65)); -- Stonetalon Mountains
    AddC(tmp[688], tmp[709]);
    tmp[710] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[709], tmp[710]);
    AddA(tmp[710], a[4936]); -- Stonetalon Mountains Quests
    AddA(tmp[710], a[4980]); -- Stonetalon Mountains Quests
    tmp[766] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[709], tmp[766]);
    AddA(tmp[766], a[847]); -- Explore Stonetalon Mountains
    tmp[1021] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[709], tmp[1021]);
    AddA(tmp[1021], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1021], a[762]); -- Ambassador of the Horde
    tmp[697] = cat:New(addon.GetMapName(66)); -- Desolace
    AddC(tmp[688], tmp[697]);
    tmp[698] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[697], tmp[698]);
    AddA(tmp[698], a[4930]); -- Desolace Quests
    tmp[767] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[697], tmp[767]);
    AddA(tmp[767], a[848]); -- Explore Desolace
    tmp[1002] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[697], tmp[1002]);
    AddA(tmp[1002], a[762]); -- Ambassador of the Horde
    tmp[711] = cat:New(addon.GetMapName(199)); -- Southern Barrens
    AddC(tmp[688], tmp[711]);
    tmp[712] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[711], tmp[712]);
    AddA(tmp[712], a[4937]); -- Southern Barrens Quests
    AddA(tmp[712], a[4981]); -- Southern Barrens Quests
    tmp[761] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[711], tmp[761]);
    AddA(tmp[761], a[4996]); -- Explore Southern Barrens
    tmp[1019] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[711], tmp[1019]);
    AddA(tmp[1019], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1019], a[762]); -- Ambassador of the Horde
    tmp[703] = cat:New(addon.GetMapName(69)); -- Feralas
    AddC(tmp[688], tmp[703]);
    tmp[704] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[703], tmp[704]);
    AddA(tmp[704], a[4932]); -- Feralas Quests
    AddA(tmp[704], a[4979]); -- Feralas Quests
    tmp[769] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[703], tmp[769]);
    AddA(tmp[769], a[849]); -- Explore Feralas
    AddA(tmp[769], a[9924]); -- Field Photographer
    tmp[1009] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[703], tmp[1009]);
    AddA(tmp[1009], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1009], a[762]); -- Ambassador of the Horde
    tmp[699] = cat:New(addon.GetMapName(70)); -- Dustwallow Marsh
    AddC(tmp[688], tmp[699]);
    tmp[700] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[699], tmp[700]);
    AddA(tmp[700], a[4929]); -- Dustwallow Marsh Quests
    AddA(tmp[700], a[4978]); -- Dustwallow Marsh Quests
    tmp[768] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[699], tmp[768]);
    AddA(tmp[768], a[850]); -- Explore Dustwallow Marsh
    tmp[1004] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[699], tmp[1004]);
    AddA(tmp[1004], a[948]); -- Ambassador of the Alliance
    tmp[715] = cat:New(addon.GetMapName(64)); -- Thousand Needles
    AddC(tmp[688], tmp[715]);
    tmp[716] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[715], tmp[716]);
    AddA(tmp[716], a[4938]); -- Thousand Needles Quests
    tmp[765] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[715], tmp[765]);
    AddA(tmp[765], a[846]); -- Explore Thousand Needles
    tmp[994] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[715], tmp[994]);
    AddA(tmp[994], a[948]); -- Ambassador of the Alliance
    AddA(tmp[994], a[762]); -- Ambassador of the Horde
    tmp[713] = cat:New(addon.GetMapName(71)); -- Tanaris
    AddC(tmp[688], tmp[713]);
    AddA(tmp[713], a[11200]); -- Stand Against the Legion
    AddA(tmp[713], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[714] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[713], tmp[714]);
    AddA(tmp[714], a[4935]); -- Tanaris Quests
    tmp[770] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[713], tmp[770]);
    AddA(tmp[770], a[851]); -- Explore Tanaris
    AddA(tmp[770], a[9924]); -- Field Photographer
    tmp[992] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[713], tmp[992]);
    AddA(tmp[992], a[948]); -- Ambassador of the Alliance
    AddA(tmp[992], a[762]); -- Ambassador of the Horde
    AddA(tmp[992], a[2336]); -- Insane in the Membrane
    tmp[701] = cat:New(addon.GetMapName(77)); -- Felwood
    AddC(tmp[688], tmp[701]);
    AddA(tmp[701], a[11296]); -- The Ancient Keeper
    tmp[702] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[701], tmp[702]);
    AddA(tmp[702], a[4931]); -- Felwood Quests
    tmp[772] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[701], tmp[772]);
    AddA(tmp[772], a[853]); -- Explore Felwood
    tmp[991] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[701], tmp[991]);
    AddA(tmp[991], a[948]); -- Ambassador of the Alliance
    AddA(tmp[991], a[762]); -- Ambassador of the Horde
    tmp[717] = cat:New(addon.GetMapName(78)); -- Un'Goro Crater
    AddC(tmp[688], tmp[717]);
    AddA(tmp[717], a[3357]); -- Venomhide Ravasaur
    AddA(tmp[717], a[11296]); -- The Ancient Keeper
    tmp[718] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[717], tmp[718]);
    AddA(tmp[718], a[4939]); -- Un'Goro Crater Quests
    tmp[773] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[717], tmp[773]);
    AddA(tmp[773], a[854]); -- Explore Un'Goro Crater
    AddA(tmp[773], a[9924]); -- Field Photographer
    tmp[707] = cat:New(addon.GetMapName(81)); -- Silithus
    AddC(tmp[688], tmp[707]);
    AddA(tmp[707], a[416]); -- Scarab Lord
    AddA(tmp[707], a[5533]); -- Veteran of the Shifting Sands
    AddA(tmp[707], a[11296]); -- The Ancient Keeper
    tmp[708] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[707], tmp[708]);
    AddA(tmp[708], a[4934]); -- Silithus Quests
    tmp[776] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[707], tmp[776]);
    AddA(tmp[776], a[856]); -- Explore Silithus
    AddA(tmp[776], a[9924]); -- Field Photographer
    tmp[783] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[707], tmp[783]);
    AddA(tmp[783], a[953]); -- Guardian of Cenarius
    tmp[719] = cat:New(addon.GetMapName(83)); -- Winterspring
    AddC(tmp[688], tmp[719]);
    AddA(tmp[719], a[3356]); -- Winterspring Frostsaber
    AddA(tmp[719], a[11296]); -- The Ancient Keeper
    tmp[720] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[719], tmp[720]);
    AddA(tmp[720], a[4940]); -- Winterspring Quests
    AddA(tmp[720], a[5443]); -- E'ko Madness
    tmp[777] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[719], tmp[777]);
    AddA(tmp[777], a[857]); -- Explore Winterspring
    tmp[1031] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[719], tmp[1031]);
    AddA(tmp[1031], a[2336]); -- Insane in the Membrane
    tmp[2] = cat:New(addon.GetCategoryInfoTitle(15272)); -- Dungeons
    AddC(tmp[1], tmp[2]);
    AddA(tmp[2], a[1283]); -- Classic Dungeonmaster
    tmp[4] = cat:New(addon.GetInstanceInfoName(63)); -- Deadmines
    AddC(tmp[2], tmp[4]);
    AddA(tmp[4], a[5366]); -- Ready for Raiding
    AddA(tmp[4], a[5367]); -- Rat Pack
    AddA(tmp[4], a[5368]); -- Prototype Prodigy
    AddA(tmp[4], a[5369]); -- It's Frost Damage
    AddA(tmp[4], a[5370]); -- I'm on a Diet
    AddA(tmp[4], a[5371]); -- Vigorous VanCleef Vindicator
    AddA(tmp[4], a[628]); -- Deadmines
    AddA(tmp[4], a[5083]); -- Heroic: Deadmines
    AddA(tmp[4], a[11856]); -- Pet Battle Challenge: Deadmines
    AddA(tmp[4], a[9924]); -- Field Photographer
    tmp[5] = cat:New(addon.GetInstanceInfoName(226)); -- Ragefire Chasm
    AddC(tmp[2], tmp[5]);
    AddA(tmp[5], a[629]); -- Ragefire Chasm
    tmp[8] = cat:New(addon.GetInstanceInfoName(240)); -- Wailing Caverns
    AddC(tmp[2], tmp[8]);
    AddA(tmp[8], a[630]); -- Wailing Caverns
    AddA(tmp[8], a[11765]); -- Pet Battle Challenge: Wailing Caverns
    tmp[9] = cat:New(addon.GetInstanceInfoName(64)); -- Shadowfang Keep
    AddC(tmp[2], tmp[9]);
    AddA(tmp[9], a[5503]); -- Pardon Denied
    AddA(tmp[9], a[5504]); -- To the Ground!
    AddA(tmp[9], a[5505]); -- Bullet Time
    AddA(tmp[9], a[631]); -- Shadowfang Keep
    AddA(tmp[9], a[5093]); -- Heroic: Shadowfang Keep
    AddA(tmp[9], a[4627]); -- X-45 Heartbreaker
    tmp[10] = cat:New(addon.GetInstanceInfoName(227)); -- Blackfathom Deeps
    AddC(tmp[2], tmp[10]);
    AddA(tmp[10], a[632]); -- Blackfathom Deeps
    tmp[11] = cat:New(addon.GetInstanceInfoName(238)); -- The Stockade
    AddC(tmp[2], tmp[11]);
    AddA(tmp[11], a[633]); -- Stormwind Stockade
    tmp[12] = cat:New(addon.GetInstanceInfoName(231)); -- Gnomeregan
    AddC(tmp[2], tmp[12]);
    AddA(tmp[12], a[634]); -- Gnomeregan
    AddA(tmp[12], a[13269]); -- Pet Battle Challenge: Gnomeregan
    tmp[13] = cat:New(addon.GetInstanceInfoName(233)); -- Razorfen Kraul
    AddC(tmp[2], tmp[13]);
    AddA(tmp[13], a[635]); -- Razorfen Kraul
    tmp[14] = cat:New(addon.GetInstanceInfoName(234)); -- Razorfen Downs
    AddC(tmp[2], tmp[14]);
    AddA(tmp[14], a[636]); -- Razorfen Downs
    tmp[15] = cat:New(addon.GetInstanceInfoName(311)); -- Scarlet Halls
    AddC(tmp[2], tmp[15]);
    AddA(tmp[15], a[6684]); -- Humane Society
    AddA(tmp[15], a[6427]); -- Mosh Pit
    AddA(tmp[15], a[7413]); -- Scarlet Halls
    AddA(tmp[15], a[6760]); -- Heroic: Scarlet Halls
    AddA(tmp[15], a[6895]); -- Scarlet Halls Challenger
    AddA(tmp[15], a[6908]); -- Scarlet Halls: Bronze
    AddA(tmp[15], a[6909]); -- Scarlet Halls: Silver
    AddA(tmp[15], a[6910]); -- Scarlet Halls: Gold
    AddA(tmp[15], a[8436]); -- Challenge Master: Scarlet Halls
    tmp[16] = cat:New(addon.GetInstanceInfoName(316)); -- Scarlet Monastery
    AddC(tmp[2], tmp[16]);
    AddA(tmp[16], a[6946]); -- Empowered Spiritualist
    AddA(tmp[16], a[6928]); -- Burning Man
    AddA(tmp[16], a[6929]); -- And Stay Dead!
    AddA(tmp[16], a[637]); -- Scarlet Monastery
    AddA(tmp[16], a[6761]); -- Heroic: Scarlet Monastery
    AddA(tmp[16], a[6896]); -- Scarlet Monastery Challenger
    AddA(tmp[16], a[6911]); -- Scarlet Monastery: Bronze
    AddA(tmp[16], a[6912]); -- Scarlet Monastery: Silver
    AddA(tmp[16], a[6913]); -- Scarlet Monastery: Gold
    AddA(tmp[16], a[8437]); -- Challenge Master: Scarlet Monastery
    AddA(tmp[16], a[980]); -- The Horseman's Reins
    tmp[17] = cat:New(addon.GetInstanceInfoName(239)); -- Uldaman
    AddC(tmp[2], tmp[17]);
    AddA(tmp[17], a[638]); -- Uldaman
    tmp[18] = cat:New(addon.GetInstanceInfoName(241)); -- Zul'Farrak
    AddC(tmp[2], tmp[18]);
    AddA(tmp[18], a[639]); -- Zul'Farrak
    tmp[19] = cat:New(addon.GetInstanceInfoName(232)); -- Maraudon
    AddC(tmp[2], tmp[19]);
    AddA(tmp[19], a[640]); -- Maraudon
    tmp[20] = cat:New(addon.GetInstanceInfoName(237)); -- The Temple Of Atal'hakkar
    AddC(tmp[2], tmp[20]);
    AddA(tmp[20], a[641]); -- Sunken Temple
    tmp[21] = cat:New(addon.GetInstanceInfoName(228)); -- Blackrock Depths
    AddC(tmp[2], tmp[21]);
    AddA(tmp[21], a[642]); -- Blackrock Depths
    AddA(tmp[21], a[3496]); -- A Brew-FAST Mount
    AddA(tmp[21], a[14020]); -- Pet Battle Challenge: Blackrock Depths
    tmp[22] = cat:New(addon.GetInstanceInfoName(229)); -- Lower Blackrock Spire
    AddC(tmp[2], tmp[22]);
    AddA(tmp[22], a[643]); -- Lower Blackrock Spire
    tmp[797] = cat:New(addon.GetInstanceInfoName(559)); -- Upper Blackrock Spire
    AddC(tmp[2], tmp[797]);
    AddA(tmp[797], a[1307]); -- Upper Blackrock Spire (Classic)
    AddA(tmp[797], a[2188]); -- Leeeeeeeeeeeeeroy!
    tmp[23] = cat:New(addon.GetInstanceInfoName(230)); -- Dire Maul
    AddC(tmp[2], tmp[23]);
    AddA(tmp[23], a[644]); -- King of Dire Maul
    AddA(tmp[23], a[5788]); -- Agent of the Shen'dralar
    tmp[24] = cat:New(addon.GetInstanceInfoName(246)); -- Scholomance
    AddC(tmp[2], tmp[24]);
    AddA(tmp[24], a[6531]); -- Attention to Detail
    AddA(tmp[24], a[6394]); -- Rattle No More
    AddA(tmp[24], a[6396]); -- Sanguinarian
    AddA(tmp[24], a[6715]); -- Polyformic Acid Science
    AddA(tmp[24], a[6821]); -- School's Out Forever
    AddA(tmp[24], a[645]); -- Scholomance
    AddA(tmp[24], a[6762]); -- Heroic: Scholomance
    AddA(tmp[24], a[6897]); -- Scholomance Challenger
    AddA(tmp[24], a[6914]); -- Scholomance: Bronze
    AddA(tmp[24], a[6915]); -- Scholomance: Silver
    AddA(tmp[24], a[6916]); -- Scholomance: Gold
    AddA(tmp[24], a[8438]); -- Challenge Master: Scholomance
    tmp[25] = cat:New(addon.GetInstanceInfoName(236)); -- Stratholme
    AddC(tmp[2], tmp[25]);
    AddA(tmp[25], a[646]); -- Stratholme
    AddA(tmp[25], a[729]); -- Deathcharger's Reins
    AddA(tmp[25], a[13627]); -- Pet Battle Challenge: Stratholme
    AddA(tmp[25], a[13766]); -- Malowned
    tmp[3] = cat:New(addon.GetCategoryInfoTitle(15271)); -- Raids
    AddC(tmp[1], tmp[3]);
    AddA(tmp[3], a[1285]); -- Classic Raider
    tmp[7] = cat:New(addon.GetInstanceInfoName(741)); -- Molten Core
    AddC(tmp[3], tmp[7]);
    AddA(tmp[7], a[686]); -- Molten Core
    AddA(tmp[7], a[11741]); -- So Hot Right Now
    AddA(tmp[7], a[429]); -- "Sulfuras, Hand of Ragnaros"
    AddA(tmp[7], a[428]); -- "Thunderfury, Blessed Blade of the Windseeker"
    AddA(tmp[7], a[9550]); -- "Boldly, You Sought the Power of Ragnaros"
    AddA(tmp[7], a[7934]); -- Raiding with Leashes
    AddA(tmp[7], a[11296]); -- The Ancient Keeper
    AddA(tmp[7], a[11297]); -- The Balance of Light and Shadow
    tmp[779] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[7], tmp[779]);
    AddA(tmp[779], a[955]); -- Hydraxian Waterlords
    AddA(tmp[779], a[2496]); -- The Fifth Element
    tmp[26] = cat:New(addon.GetInstanceInfoName(760) .. " (" .. addon.GetCategoryInfoTitle(15234) .. ")"); -- Onyxia's Lair
    AddC(tmp[3], tmp[26]);
    AddA(tmp[26], a[684]); -- Onyxia's Lair (Level 60)
    AddA(tmp[26], a[11296]); -- The Ancient Keeper
    tmp[27] = cat:New(addon.GetInstanceInfoName(742)); -- Blackwing Lair
    AddC(tmp[3], tmp[27]);
    AddA(tmp[27], a[685]); -- Blackwing Lair
    AddA(tmp[27], a[11742]); -- Dress in Lairs
    AddA(tmp[27], a[7934]); -- Raiding with Leashes
    tmp[28] = cat:New(addon.GetInstanceInfoName(76)); -- Zul'Gurub
    AddC(tmp[3], tmp[28]);
    AddA(tmp[28], a[560]); -- Deadliest Catch
    AddA(tmp[28], a[688]); -- Zul'Gurub
    AddA(tmp[28], a[880]); -- Swift Zulian Tiger
    AddA(tmp[28], a[881]); -- Swift Razzashi Raptor
    tmp[789] = cat:New(addon.GetCategoryInfoTitle(201)); -- Reputation
    AddC(tmp[28], tmp[789]);
    AddA(tmp[789], a[957]); -- Hero of the Zandalar Tribe
    tmp[29] = cat:New(addon.GetInstanceInfoName(743)); -- Ruins of Ahn'Qiraj
    AddC(tmp[3], tmp[29]);
    AddA(tmp[29], a[689]); -- Ruins of Ahn'Qiraj
    tmp[784] = cat:New(addon.GetCategoryInfoTitle(201)); -- Reputation
    AddC(tmp[29], tmp[784]);
    AddA(tmp[784], a[953]); -- Guardian of Cenarius
    tmp[30] = cat:New(addon.GetInstanceInfoName(744)); -- Temple of Ahn'Qiraj
    AddC(tmp[3], tmp[30]);
    AddA(tmp[30], a[687]); -- Temple of Ahn'Qiraj
    AddA(tmp[30], a[424]); -- Why? Because It's Red
    AddA(tmp[30], a[11743]); -- Accessor-Eyes
    AddA(tmp[30], a[7934]); -- Raiding with Leashes
    tmp[780] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[30], tmp[780]);
    AddA(tmp[780], a[956]); -- Brood of Nozdormu
    tmp[796] = cat:New(addon.GetInstanceInfoName(754) .. " (" .. addon.GetCategoryInfoTitle(15234) .. ")"); -- Naxxramas
    AddC(tmp[3], tmp[796]);
    AddA(tmp[796], a[11744]); -- "Drop Dead, Gorgeous"
    AddA(tmp[796], a[425]); -- "Atiesh, Greatstaff of the Guardian"
    tmp[785] = cat:New(addon.GetCategoryInfoTitle(15117)); -- Pet Battles
    AddC(tmp[1], tmp[785]);
    AddA(tmp[785], a[6586]); -- Eastern Kingdoms Safari
    AddA(tmp[785], a[6585]); -- Kalimdor Safari
    AddA(tmp[785], a[6613]); -- Eastern Kingdoms Tamer
    AddA(tmp[785], a[6612]); -- Kalimdor Tamer
    AddA(tmp[785], a[6603]); -- Taming Eastern Kingdoms
    AddA(tmp[785], a[6602]); -- Taming Kalimdor
    AddA(tmp[785], a[6558]); -- Local Pet Mauler
    AddA(tmp[785], a[6559]); -- Traveling Pet Mauler
    AddA(tmp[785], a[6560]); -- World Pet Mauler
    AddA(tmp[785], a[6607]); -- Taming Azeroth
    AddA(tmp[785], a[6601]); -- Taming the Wild
    AddA(tmp[785], a[7498]); -- Taming the Great Outdoors
    AddA(tmp[785], a[7499]); -- Taming the World
    AddA(tmp[785], a[14021]); -- The Shadows Revealed
    AddA(tmp[785], a[6584]); -- Big City Pet Brawlin' - Alliance
    AddA(tmp[785], a[6621]); -- Big City Pet Brawlin' - Horde
    AddA(tmp[785], a[6622]); -- Big City Pet Brawler
    AddA(tmp[785], a[6611]); -- Continental Tamer
    AddA(tmp[785], a[6590]); -- World Safari
    AddA(tmp[785], a[8348]); -- The Longest Day
    tmp[55] = cat:New(addon.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    AddC(tmp[883], tmp[55]);
    tmp[616] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[55], tmp[616]);
    AddA(tmp[616], a[1262]); -- Loremaster of Outland
    AddA(tmp[616], a[1311]); -- Medium Rare
    AddA(tmp[616], a[1312]); -- Bloody Rare
    AddA(tmp[616], a[44]); -- Outland Explorer
    AddA(tmp[616], a[763]); -- The Burning Crusader
    AddA(tmp[616], a[764]); -- The Burning Crusader
    AddA(tmp[616], a[894]); -- Flying High Over Skettis
    AddA(tmp[616], a[897]); -- You're So Offensive
    AddA(tmp[616], a[902]); -- Chief Exalted Officer
    AddA(tmp[616], a[7520]); -- The Loremaster
    tmp[794] = cat:New(addon.GetMapName(111)); -- Shattrath City
    AddC(tmp[616], tmp[794]);
    AddA(tmp[794], a[1165]); -- "My Storage is ""Gigantique"""
    AddA(tmp[794], a[9924]); -- Field Photographer
    tmp[924] = cat:New(addon.GetMapName(110)); -- Silvermoon City
    AddC(tmp[616], tmp[924]);
    AddA(tmp[924], a[613]); -- Killed in Quel'Thalas
    AddA(tmp[924], a[614]); -- For the Alliance!
    AddA(tmp[924], a[604]); -- Wrath of the Alliance
    tmp[969] = cat:New(addon.GetMapName(103)); -- The Exodar
    AddC(tmp[616], tmp[969]);
    AddA(tmp[969], a[618]); -- Putting Out the Light
    AddA(tmp[969], a[619]); -- For the Horde!
    AddA(tmp[969], a[603]); -- Wrath of the Horde
    tmp[758] = cat:New(addon.GetMapName(97)); -- Azuremyst Isle
    AddC(tmp[616], tmp[758]);
    tmp[759] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[758], tmp[759]);
    AddA(tmp[759], a[860]); -- Explore Azuremyst Isle
    tmp[998] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[758], tmp[998]);
    AddA(tmp[998], a[948]); -- Ambassador of the Alliance
    tmp[693] = cat:New(addon.GetMapName(106)); -- Bloodmyst Isle
    AddC(tmp[616], tmp[693]);
    tmp[694] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[693], tmp[694]);
    AddA(tmp[694], a[4926]); -- Bloodmyst Isle Quests
    tmp[763] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[693], tmp[763]);
    AddA(tmp[763], a[861]); -- Explore Bloodmyst Isle
    tmp[1000] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[693], tmp[1000]);
    AddA(tmp[1000], a[948]); -- Ambassador of the Alliance
    tmp[727] = cat:New(addon.GetMapName(94)); -- Eversong Woods
    AddC(tmp[616], tmp[727]);
    tmp[728] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[727], tmp[728]);
    AddA(tmp[728], a[859]); -- Explore Eversong Woods
    tmp[1008] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[727], tmp[1008]);
    AddA(tmp[1008], a[762]); -- Ambassador of the Horde
    tmp[669] = cat:New(addon.GetMapName(95)); -- Ghostlands
    AddC(tmp[616], tmp[669]);
    tmp[670] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[669], tmp[670]);
    AddA(tmp[670], a[4908]); -- Ghostlands Quests
    tmp[733] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[669], tmp[733]);
    AddA(tmp[733], a[858]); -- Explore Ghostlands
    tmp[1010] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[669], tmp[1010]);
    AddA(tmp[1010], a[762]); -- Ambassador of the Horde
    tmp[617] = cat:New(addon.GetMapName(100)); -- Hellfire Peninsula
    AddC(tmp[616], tmp[617]);
    tmp[624] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[617], tmp[624]);
    AddA(tmp[624], a[1189]); -- To Hellfire and Back
    AddA(tmp[624], a[1271]); -- To Hellfire and Back
    tmp[631] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[617], tmp[631]);
    AddA(tmp[631], a[862]); -- Explore Hellfire Peninsula
    AddA(tmp[631], a[9924]); -- Field Photographer
    tmp[1011] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[617], tmp[1011]);
    AddA(tmp[1011], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1011], a[762]); -- Ambassador of the Horde
    tmp[618] = cat:New(addon.GetMapName(102)); -- Zangarmarsh
    AddC(tmp[616], tmp[618]);
    tmp[625] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[618], tmp[625]);
    AddA(tmp[625], a[1190]); -- Mysteries of the Marsh
    tmp[632] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[618], tmp[632]);
    AddA(tmp[632], a[863]); -- Explore Zangarmarsh
    tmp[643] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[618], tmp[643]);
    AddA(tmp[643], a[948]); -- Ambassador of the Alliance
    AddA(tmp[643], a[762]); -- Ambassador of the Horde
    AddA(tmp[643], a[893]); -- Cenarion War Hippogryph
    AddA(tmp[643], a[953]); -- Guardian of Cenarius
    AddA(tmp[643], a[900]); -- The Czar of Sporeggar
    AddA(tmp[643], a[942]); -- The Diplomat
    AddA(tmp[643], a[943]); -- The Diplomat
    tmp[619] = cat:New(addon.GetMapName(108)); -- Terokkar Forest
    AddC(tmp[616], tmp[619]);
    tmp[626] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[619], tmp[626]);
    AddA(tmp[626], a[1191]); -- Terror of Terokkar
    AddA(tmp[626], a[1272]); -- Terror of Terokkar
    AddA(tmp[626], a[1275]); -- Bombs Away
    tmp[633] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[619], tmp[633]);
    AddA(tmp[633], a[867]); -- Explore Terokkar Forest
    tmp[642] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[619], tmp[642]);
    AddA(tmp[642], a[903]); -- Shattrath Divided
    AddA(tmp[642], a[1205]); -- Hero of Shattrath
    tmp[620] = cat:New(addon.GetMapName(107)); -- Nagrand
    AddC(tmp[616], tmp[620]);
    tmp[627] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[620], tmp[627]);
    AddA(tmp[627], a[1192]); -- Nagrand Slam
    AddA(tmp[627], a[1273]); -- Nagrand Slam
    AddA(tmp[627], a[939]); -- Hills Like White Elekk
    AddA(tmp[627], a[941]); -- Hemet Nesingwary: The Collected Quests
    AddA(tmp[627], a[1576]); -- Of Blood and Anguish
    AddA(tmp[627], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    tmp[634] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[620], tmp[634]);
    AddA(tmp[634], a[866]); -- Explore Nagrand
    tmp[641] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[620], tmp[641]);
    AddA(tmp[641], a[899]); -- "Oh My, Kurenai"
    AddA(tmp[641], a[901]); -- Mag'har of Draenor
    AddA(tmp[641], a[942]); -- The Diplomat
    AddA(tmp[641], a[943]); -- The Diplomat
    tmp[621] = cat:New(addon.GetMapName(105)); -- Blade's Edge Mountains
    AddC(tmp[616], tmp[621]);
    tmp[628] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[621], tmp[628]);
    AddA(tmp[628], a[1193]); -- On the Blade's Edge
    AddA(tmp[628], a[1276]); -- Blade's Edge Bomberman
    tmp[635] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[621], tmp[635]);
    AddA(tmp[635], a[865]); -- Explore Blade's Edge Mountains
    tmp[640] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[621], tmp[640]);
    AddA(tmp[640], a[896]); -- A Quest a Day Keeps the Ogres at Bay
    tmp[622] = cat:New(addon.GetMapName(109)); -- Netherstorm
    AddC(tmp[616], tmp[622]);
    tmp[629] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[622], tmp[629]);
    AddA(tmp[629], a[1194]); -- Into the Nether
    tmp[636] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[622], tmp[636]);
    AddA(tmp[636], a[843]); -- Explore Netherstorm
    AddA(tmp[636], a[9924]); -- Field Photographer
    tmp[623] = cat:New(addon.GetMapName(104)); -- Shadowmoon Valley
    AddC(tmp[616], tmp[623]);
    tmp[630] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[623], tmp[630]);
    AddA(tmp[630], a[1195]); -- Shadow of the Betrayer
    tmp[637] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[623], tmp[637]);
    AddA(tmp[637], a[864]); -- Explore Shadowmoon Valley
    tmp[638] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[623], tmp[638]);
    AddA(tmp[638], a[898]); -- On Wings of Nether
    AddA(tmp[638], a[1638]); -- Skyshattered
    tmp[750] = cat:New(addon.GetMapName(122)); -- Isle of Quel'Danas
    AddC(tmp[616], tmp[750]);
    tmp[751] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[750], tmp[751]);
    AddA(tmp[751], a[868]); -- Explore Isle of Quel'Danas
    tmp[56] = cat:New(addon.GetCategoryInfoTitle(15272)); -- Dungeons
    AddC(tmp[55], tmp[56]);
    AddA(tmp[56], a[1284]); -- Outland Dungeonmaster
    AddA(tmp[56], a[1287]); -- Outland Dungeon Hero
    tmp[57] = cat:New(addon.GetInstanceInfoName(248)); -- Hellfire Ramparts
    AddC(tmp[56], tmp[57]);
    AddA(tmp[57], a[647]); -- Hellfire Ramparts
    AddA(tmp[57], a[667]); -- Heroic: Hellfire Ramparts
    tmp[58] = cat:New(addon.GetInstanceInfoName(256)); -- The Blood Furnace
    AddC(tmp[56], tmp[58]);
    AddA(tmp[58], a[648]); -- The Blood Furnace
    AddA(tmp[58], a[668]); -- Heroic: The Blood Furnace
    tmp[59] = cat:New(addon.GetInstanceInfoName(259)); -- The Shattered Halls
    AddC(tmp[56], tmp[59]);
    AddA(tmp[59], a[657]); -- The Shattered Halls
    AddA(tmp[59], a[678]); -- Heroic: The Shattered Halls
    tmp[60] = cat:New(addon.GetInstanceInfoName(260)); -- The Slave Pens
    AddC(tmp[56], tmp[60]);
    AddA(tmp[60], a[649]); -- The Slave Pens
    AddA(tmp[60], a[669]); -- Heroic: The Slave Pens
    tmp[61] = cat:New(addon.GetInstanceInfoName(262)); -- The Underbog
    AddC(tmp[56], tmp[61]);
    AddA(tmp[61], a[650]); -- Underbog
    AddA(tmp[61], a[670]); -- Heroic: Underbog
    tmp[62] = cat:New(addon.GetInstanceInfoName(261)); -- The Steamvault
    AddC(tmp[56], tmp[62]);
    AddA(tmp[62], a[656]); -- The Steamvault
    AddA(tmp[62], a[677]); -- Heroic: The Steamvault
    tmp[63] = cat:New(addon.GetInstanceInfoName(250)); -- Mana-Tombs
    AddC(tmp[56], tmp[63]);
    AddA(tmp[63], a[651]); -- Mana-Tombs
    AddA(tmp[63], a[671]); -- Heroic: Mana-Tombs
    tmp[64] = cat:New(addon.GetInstanceInfoName(247)); -- Auchenai Crypts
    AddC(tmp[56], tmp[64]);
    AddA(tmp[64], a[666]); -- Auchenai Crypts
    AddA(tmp[64], a[672]); -- Heroic: Auchenai Crypts
    tmp[65] = cat:New(addon.GetInstanceInfoName(252)); -- Sethekk Halls
    AddC(tmp[56], tmp[65]);
    AddA(tmp[65], a[653]); -- Sethekk Halls
    AddA(tmp[65], a[674]); -- Heroic: Sethekk Halls
    AddA(tmp[65], a[883]); -- Reins of the Raven Lord
    tmp[66] = cat:New(addon.GetInstanceInfoName(253)); -- Shadow Labyrinth
    AddC(tmp[56], tmp[66]);
    AddA(tmp[66], a[654]); -- Shadow Labyrinth
    AddA(tmp[66], a[675]); -- Heroic: Shadow Labyrinth
    tmp[67] = cat:New(addon.GetInstanceInfoName(251)); -- Old Hillsbrad Foothills
    AddC(tmp[56], tmp[67]);
    AddA(tmp[67], a[652]); -- The Escape From Durnholde
    AddA(tmp[67], a[673]); -- Heroic: The Escape From Durnholde
    tmp[68] = cat:New(addon.GetInstanceInfoName(255)); -- The Black Morass
    AddC(tmp[56], tmp[68]);
    AddA(tmp[68], a[655]); -- Opening of the Dark Portal
    AddA(tmp[68], a[676]); -- Heroic: Opening of the Dark Portal
    tmp[69] = cat:New(addon.GetInstanceInfoName(258)); -- The Mechanar
    AddC(tmp[56], tmp[69]);
    AddA(tmp[69], a[658]); -- The Mechanar
    AddA(tmp[69], a[679]); -- Heroic: The Mechanar
    tmp[70] = cat:New(addon.GetInstanceInfoName(257)); -- The Botanica
    AddC(tmp[56], tmp[70]);
    AddA(tmp[70], a[659]); -- The Botanica
    AddA(tmp[70], a[680]); -- Heroic: The Botanica
    tmp[71] = cat:New(addon.GetInstanceInfoName(254)); -- The Arcatraz
    AddC(tmp[56], tmp[71]);
    AddA(tmp[71], a[660]); -- The Arcatraz
    AddA(tmp[71], a[681]); -- Heroic: The Arcatraz
    tmp[72] = cat:New(addon.GetInstanceInfoName(249)); -- Magisters Terrace
    AddC(tmp[56], tmp[72]);
    AddA(tmp[72], a[661]); -- Magister's Terrace
    AddA(tmp[72], a[682]); -- Heroic: Magister's Terrace
    AddA(tmp[72], a[884]); -- Swift White Hawkstrider
    tmp[73] = cat:New(addon.GetCategoryInfoTitle(15271)); -- Raids
    AddC(tmp[55], tmp[73]);
    AddA(tmp[73], a[1286]); -- Outland Raider
    AddA(tmp[73], a[432]); -- Champion of the Naaru
    AddA(tmp[73], a[431]); -- Hand of A'dal
    tmp[74] = cat:New(addon.GetInstanceInfoName(745)); -- Karazhan
    AddC(tmp[73], tmp[74]);
    AddA(tmp[74], a[690]); -- Karazhan
    AddA(tmp[74], a[882]); -- Fiery Warhorse's Reins
    AddA(tmp[74], a[11746]); -- Outlandish Style
    AddA(tmp[74], a[2456]); -- Vampire Hunter
    AddA(tmp[74], a[8293]); -- Raiding with Leashes II: Attunement Edition
    AddA(tmp[74], a[9924]); -- Field Photographer
    tmp[647] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[74], tmp[647]);
    AddA(tmp[647], a[960]); -- The Violet Eye
    tmp[75] = cat:New(addon.GetInstanceInfoName(746)); -- Gruul's Lair
    AddC(tmp[73], tmp[75]);
    AddA(tmp[75], a[692]); -- Gruul's Lair
    AddA(tmp[75], a[11746]); -- Outlandish Style
    tmp[76] = cat:New(addon.GetInstanceInfoName(747)); -- Magtheridon's Lair
    AddC(tmp[73], tmp[76]);
    AddA(tmp[76], a[693]); -- Magtheridon's Lair
    AddA(tmp[76], a[11746]); -- Outlandish Style
    tmp[77] = cat:New(addon.GetInstanceInfoName(748)); -- Serpentshrine Cavern
    AddC(tmp[73], tmp[77]);
    AddA(tmp[77], a[694]); -- Serpentshrine Cavern
    AddA(tmp[77], a[11747]); -- Merely a Set
    AddA(tmp[77], a[8293]); -- Raiding with Leashes II: Attunement Edition
    tmp[78] = cat:New(addon.GetInstanceInfoName(749)); -- The Eye
    AddC(tmp[73], tmp[78]);
    AddA(tmp[78], a[696]); -- Tempest Keep
    AddA(tmp[78], a[885]); -- Ashes of Al'ar
    AddA(tmp[78], a[8293]); -- Raiding with Leashes II: Attunement Edition
    tmp[79] = cat:New(addon.GetInstanceInfoName(750)); -- The Battle for Mount Hyjal
    AddC(tmp[73], tmp[79]);
    AddA(tmp[79], a[695]); -- The Battle for Mount Hyjal
    AddA(tmp[79], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[646] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[79], tmp[646]);
    AddA(tmp[646], a[959]); -- The Scale of the Sands
    tmp[80] = cat:New(addon.GetInstanceInfoName(751)); -- Black Temple
    AddC(tmp[73], tmp[80]);
    AddA(tmp[80], a[697]); -- The Black Temple
    AddA(tmp[80], a[11748]); -- Black is the New Black
    AddA(tmp[80], a[9016]); -- Breaker of the Black Harvest
    AddA(tmp[80], a[426]); -- Warglaives of Azzinoth
    AddA(tmp[80], a[11869]); -- I'll Hold These For You Until You Get Out
    AddA(tmp[80], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[645] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[80], tmp[645]);
    AddA(tmp[645], a[958]); -- Sworn to the Deathsworn
    tmp[81] = cat:New(addon.GetInstanceInfoName(77)); -- Zul'Aman
    AddC(tmp[73], tmp[81]);
    AddA(tmp[81], a[691]); -- Zul'Aman
    AddA(tmp[81], a[430]); -- Amani War Bear
    tmp[82] = cat:New(addon.GetInstanceInfoName(752)); -- Sunwell Plateau
    AddC(tmp[73], tmp[82]);
    AddA(tmp[82], a[698]); -- Sunwell Plateau
    AddA(tmp[82], a[11749]); -- "Suns Out, Thori'dals Out"
    AddA(tmp[82], a[725]); -- "Thori'dal, the Stars' Fury"
    AddA(tmp[82], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[786] = cat:New(addon.GetCategoryInfoTitle(15117)); -- Pet Battles
    AddC(tmp[55], tmp[786]);
    AddA(tmp[786], a[6587]); -- Outland Safari
    AddA(tmp[786], a[6614]); -- Outland Tamer
    AddA(tmp[786], a[6604]); -- Taming Outland
    AddA(tmp[786], a[6558]); -- Local Pet Mauler
    AddA(tmp[786], a[6559]); -- Traveling Pet Mauler
    AddA(tmp[786], a[6560]); -- World Pet Mauler
    AddA(tmp[786], a[6607]); -- Taming Azeroth
    AddA(tmp[786], a[6601]); -- Taming the Wild
    AddA(tmp[786], a[7498]); -- Taming the Great Outdoors
    AddA(tmp[786], a[7499]); -- Taming the World
    AddA(tmp[786], a[6584]); -- Big City Pet Brawlin' - Alliance
    AddA(tmp[786], a[6621]); -- Big City Pet Brawlin' - Horde
    AddA(tmp[786], a[6622]); -- Big City Pet Brawler
    AddA(tmp[786], a[6611]); -- Continental Tamer
    AddA(tmp[786], a[6590]); -- World Safari
    AddA(tmp[786], a[8348]); -- The Longest Day
    tmp[83] = cat:New(addon.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    AddC(tmp[883], tmp[83]);
    tmp[577] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[83], tmp[577]);
    AddA(tmp[577], a[41]); -- Loremaster of Northrend
    AddA(tmp[577], a[2256]); -- Northern Exposure
    AddA(tmp[577], a[2257]); -- Frostbitten
    AddA(tmp[577], a[2557]); -- To All The Squirrels Who Shared My Life
    AddA(tmp[577], a[45]); -- Northrend Explorer
    AddA(tmp[577], a[1008]); -- The Kirin Tor
    AddA(tmp[577], a[1009]); -- Knights of the Ebon Blade
    AddA(tmp[577], a[1010]); -- Northrend Vanguard
    AddA(tmp[577], a[1011]); -- The Winds of the North
    AddA(tmp[577], a[1012]); -- The Winds of the North
    AddA(tmp[577], a[2556]); -- Pest Control
    AddA(tmp[577], a[7520]); -- The Loremaster
    tmp[614] = cat:New(addon.GetMapName(125)); -- Dalaran
    AddC(tmp[577], tmp[614]);
    AddA(tmp[614], a[1956]); -- Higher Learning
    AddA(tmp[614], a[2084]); -- Ring of the Kirin Tor
    AddA(tmp[614], a[2076]); -- Armored Brown Bear
    AddA(tmp[614], a[2077]); -- Wooly Mammoth
    AddA(tmp[614], a[2078]); -- Traveler's Tundra Mammoth
    tmp[578] = cat:New(addon.GetMapName(114)); -- Borean Tundra
    AddC(tmp[577], tmp[578]);
    tmp[586] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[578], tmp[586]);
    AddA(tmp[586], a[33]); -- Nothing Boring About Borean
    AddA(tmp[586], a[1358]); -- Nothing Boring About Borean
    AddA(tmp[586], a[561]); -- D.E.H.T.A's Little P.I.T.A.
    tmp[587] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[578], tmp[587]);
    AddA(tmp[587], a[1264]); -- Explore Borean Tundra
    tmp[588] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[578], tmp[588]);
    AddA(tmp[588], a[949]); -- Tuskarrmageddon
    tmp[579] = cat:New(addon.GetMapName(117)); -- Howling Fjord
    AddC(tmp[577], tmp[579]);
    tmp[589] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[579], tmp[589]);
    AddA(tmp[589], a[34]); -- I've Toured the Fjord
    AddA(tmp[589], a[1356]); -- I've Toured the Fjord
    tmp[590] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[579], tmp[590]);
    AddA(tmp[590], a[1263]); -- Explore Howling Fjord
    AddA(tmp[590], a[1254]); -- Friend or Fowl?
    AddA(tmp[590], a[9924]); -- Field Photographer
    tmp[580] = cat:New(addon.GetMapName(115)); -- Dragonblight
    AddC(tmp[577], tmp[580]);
    tmp[592] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[580], tmp[592]);
    AddA(tmp[592], a[35]); -- Might of Dragonblight
    AddA(tmp[592], a[1359]); -- Might of Dragonblight
    AddA(tmp[592], a[547]); -- Veteran of the Wrathgate
    AddA(tmp[592], a[1277]); -- Rapid Defense
    tmp[593] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[580], tmp[593]);
    AddA(tmp[593], a[1265]); -- Explore Dragonblight
    AddA(tmp[593], a[9924]); -- Field Photographer
    tmp[594] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[580], tmp[594]);
    AddA(tmp[594], a[1007]); -- The Wyrmrest Accord
    tmp[581] = cat:New(addon.GetMapName(116)); -- Grizzly Hills
    AddC(tmp[577], tmp[581]);
    tmp[595] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[581], tmp[595]);
    AddA(tmp[595], a[37]); -- Fo' Grizzle My Shizzle
    AddA(tmp[595], a[1357]); -- Fo' Grizzle My Shizzle
    tmp[596] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[581], tmp[596]);
    AddA(tmp[596], a[1266]); -- Explore Grizzly Hills
    tmp[782] = cat:New(addon.GetCategoryInfoTitle(95), true); -- PvP
    AddC(tmp[581], tmp[782]);
    AddA(tmp[782], a[2016]); -- Grizzled Veteran
    AddA(tmp[782], a[2017]); -- Grizzled Veteran
    tmp[582] = cat:New(addon.GetMapName(121)); -- Zul'Drak
    AddC(tmp[577], tmp[582]);
    tmp[598] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[582], tmp[598]);
    AddA(tmp[598], a[36]); -- The Empire of Zul'Drak
    AddA(tmp[598], a[1596]); -- Guru of Drakuru
    AddA(tmp[598], a[1576]); -- Of Blood and Anguish
    AddA(tmp[598], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    tmp[599] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[582], tmp[599]);
    AddA(tmp[599], a[1267]); -- Explore Zul'Drak
    tmp[583] = cat:New(addon.GetMapName(119)); -- Sholazar Basin
    AddC(tmp[577], tmp[583]);
    tmp[601] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[583], tmp[601]);
    AddA(tmp[601], a[39]); -- Into the Basin
    AddA(tmp[601], a[961]); -- Honorary Frenzyheart
    AddA(tmp[601], a[962]); -- Savior of the Oracles
    AddA(tmp[601], a[938]); -- The Snows of Northrend
    AddA(tmp[601], a[941]); -- Hemet Nesingwary: The Collected Quests
    tmp[602] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[583], tmp[602]);
    AddA(tmp[602], a[1268]); -- Explore Sholazar Basin
    tmp[603] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[583], tmp[603]);
    AddA(tmp[603], a[950]); -- Frenzyheart Tribe
    AddA(tmp[603], a[951]); -- The Oracles
    AddA(tmp[603], a[952]); -- Mercenary of Sholazar
    tmp[610] = cat:New(addon.GetMapName(127)); -- Crystalsong Forest
    AddC(tmp[577], tmp[610]);
    AddA(tmp[610], a[1457]); -- Explore Crystalsong Forest
    AddA(tmp[610], a[9924]); -- Field Photographer
    tmp[584] = cat:New(addon.GetMapName(120)); -- Storm Peaks
    AddC(tmp[577], tmp[584]);
    tmp[604] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[584], tmp[604]);
    AddA(tmp[604], a[38]); -- The Summit of Storm Peaks
    AddA(tmp[604], a[1428]); -- Mine Sweeper
    tmp[612] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[584], tmp[612]);
    AddA(tmp[612], a[1269]); -- Explore Storm Peaks
    tmp[606] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[584], tmp[606]);
    AddA(tmp[606], a[2082]); -- Ice Mammoth
    AddA(tmp[606], a[2083]); -- Grand Ice Mammoth
    tmp[585] = cat:New(addon.GetMapName(118)); -- Icecrown
    AddC(tmp[577], tmp[585]);
    AddA(tmp[585], a[14750]); -- Death Rising
    tmp[607] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[585], tmp[607]);
    AddA(tmp[607], a[40]); -- Icecrown: The Final Goal
    tmp[608] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[585], tmp[608]);
    AddA(tmp[608], a[1270]); -- Explore Icecrown
    tmp[609] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[585], tmp[609]);
    AddA(tmp[609], a[947]); -- The Argent Crusade
    AddA(tmp[609], a[945]); -- The Argent Champion
    tmp[1034] = cat:New(addon.GetMapName(123)); -- Wintergrasp
    AddC(tmp[577], tmp[1034]);
    AddA(tmp[1034], a[9924]); -- Field Photographer
    tmp[84] = cat:New(addon.GetCategoryInfoTitle(15272)); -- Dungeons
    AddC(tmp[83], tmp[84]);
    AddA(tmp[84], a[1288]); -- Northrend Dungeonmaster
    AddA(tmp[84], a[1289]); -- Northrend Dungeon Hero
    AddA(tmp[84], a[1658]); -- Champion of the Frozen Wastes
    AddA(tmp[84], a[2136]); -- Glory of the Hero
    AddA(tmp[84], a[2018]); -- Timear Foresees
    AddA(tmp[84], a[2019]); -- Proof of Demise
    AddA(tmp[84], a[2085]); -- 50 Stone Keeper's Shards
    AddA(tmp[84], a[2086]); -- 100 Stone Keeper's Shards
    AddA(tmp[84], a[2087]); -- 250 Stone Keeper's Shards
    AddA(tmp[84], a[2088]); -- 500 Stone Keeper's Shards
    AddA(tmp[84], a[2089]); -- 1000 Stone Keeper's Shards
    AddA(tmp[84], a[3844]); -- 1000 Dungeon & Raid Emblems
    AddA(tmp[84], a[4316]); -- 2500 Dungeon & Raid Emblems
    tmp[86] = cat:New(addon.GetInstanceInfoName(285)); -- Utgarde Keep
    AddC(tmp[84], tmp[86]);
    AddA(tmp[86], a[1919]); -- On The Rocks
    AddA(tmp[86], a[477]); -- Utgarde Keep
    AddA(tmp[86], a[489]); -- Heroic: Utgarde Keep
    tmp[87] = cat:New(addon.GetInstanceInfoName(281)); -- The Nexus
    AddC(tmp[84], tmp[87]);
    AddA(tmp[87], a[2150]); -- Split Personality
    AddA(tmp[87], a[2037]); -- Chaos Theory
    AddA(tmp[87], a[2036]); -- Intense Cold
    AddA(tmp[87], a[478]); -- The Nexus
    AddA(tmp[87], a[490]); -- Heroic: The Nexus
    tmp[88] = cat:New(addon.GetInstanceInfoName(272)); -- Azjol-Nerub
    AddC(tmp[84], tmp[88]);
    AddA(tmp[88], a[1296]); -- Watch Him Die
    AddA(tmp[88], a[1297]); -- Hadronox Denied
    AddA(tmp[88], a[1860]); -- Gotta Go!
    AddA(tmp[88], a[480]); -- Azjol-Nerub
    AddA(tmp[88], a[491]); -- Heroic: Azjol-Nerub
    tmp[89] = cat:New(addon.GetInstanceInfoName(271)); -- Ahn'kahet: The Old Kingdom
    AddC(tmp[84], tmp[89]);
    AddA(tmp[89], a[2038]); -- Respect Your Elders
    AddA(tmp[89], a[2056]); -- Volunteer Work
    AddA(tmp[89], a[1862]); -- Volazj's Quick Demise
    AddA(tmp[89], a[481]); -- Ahn'kahet: The Old Kingdom
    AddA(tmp[89], a[492]); -- Heroic: Ahn'kahet: The Old Kingdom
    tmp[90] = cat:New(addon.GetInstanceInfoName(273)); -- Drak'Tharon Keep
    AddC(tmp[84], tmp[90]);
    AddA(tmp[90], a[2151]); -- Consumption Junction
    AddA(tmp[90], a[2057]); -- Oh Novos!
    AddA(tmp[90], a[2039]); -- Better Off Dred
    AddA(tmp[90], a[482]); -- Drak'Tharon Keep
    AddA(tmp[90], a[493]); -- Heroic: Drak'Tharon Keep
    tmp[91] = cat:New(addon.GetInstanceInfoName(283)); -- The Violet Hold
    AddC(tmp[84], tmp[91]);
    AddA(tmp[91], a[1865]); -- Lockdown!
    AddA(tmp[91], a[2041]); -- Dehydration
    AddA(tmp[91], a[2153]); -- A Void Dance
    AddA(tmp[91], a[1816]); -- Defenseless
    AddA(tmp[91], a[483]); -- The Violet Hold
    AddA(tmp[91], a[494]); -- Heroic: The Violet Hold
    tmp[92] = cat:New(addon.GetInstanceInfoName(274)); -- Gundrak
    AddC(tmp[84], tmp[92]);
    AddA(tmp[92], a[2058]); -- Snakes. Why'd It Have To Be Snakes?
    AddA(tmp[92], a[2040]); -- Less-rabi
    AddA(tmp[92], a[1864]); -- What the Eck?
    AddA(tmp[92], a[2152]); -- Share The Love
    AddA(tmp[92], a[484]); -- Gundrak
    AddA(tmp[92], a[495]); -- Heroic: Gundrak
    tmp[93] = cat:New(addon.GetInstanceInfoName(277)); -- Halls of Stone
    AddC(tmp[84], tmp[93]);
    AddA(tmp[93], a[1866]); -- Good Grief
    AddA(tmp[93], a[2154]); -- Brann Spankin' New
    AddA(tmp[93], a[2155]); -- Abuse the Ooze
    AddA(tmp[93], a[485]); -- Halls of Stone
    AddA(tmp[93], a[496]); -- Heroic: Halls of Stone
    tmp[94] = cat:New(addon.GetInstanceInfoName(275)); -- Halls of Lightning
    AddC(tmp[84], tmp[94]);
    AddA(tmp[94], a[1834]); -- Lightning Struck
    AddA(tmp[94], a[2042]); -- Shatter Resistant
    AddA(tmp[94], a[1867]); -- Timely Death
    AddA(tmp[94], a[486]); -- Halls of Lightning
    AddA(tmp[94], a[497]); -- Heroic: Halls of Lightning
    tmp[95] = cat:New(addon.GetInstanceInfoName(282)); -- The Oculus
    AddC(tmp[84], tmp[95]);
    AddA(tmp[95], a[1868]); -- Make It Count
    AddA(tmp[95], a[2046]); -- Amber Void
    AddA(tmp[95], a[2045]); -- Emerald Void
    AddA(tmp[95], a[2044]); -- Ruby Void
    AddA(tmp[95], a[1871]); -- Experienced Drake Rider
    AddA(tmp[95], a[487]); -- The Oculus
    AddA(tmp[95], a[498]); -- Heroic: The Oculus
    tmp[97] = cat:New(addon.GetInstanceInfoName(286)); -- Utgarde Pinnacle
    AddC(tmp[84], tmp[97]);
    AddA(tmp[97], a[2043]); -- The Incredible Hulk
    AddA(tmp[97], a[1873]); -- Lodi Dodi We Loves the Skadi
    AddA(tmp[97], a[2156]); -- My Girl Loves to Skadi All the Time
    AddA(tmp[97], a[2157]); -- King's Bane
    AddA(tmp[97], a[488]); -- Utgarde Pinnacle
    AddA(tmp[97], a[499]); -- Heroic: Utgarde Pinnacle
    tmp[96] = cat:New(addon.GetInstanceInfoName(279)); -- The Culling of Stratholme
    AddC(tmp[84], tmp[96]);
    AddA(tmp[96], a[1872]); -- Zombiefest!
    AddA(tmp[96], a[1817]); -- The Culling of Time
    AddA(tmp[96], a[479]); -- The Culling of Stratholme
    AddA(tmp[96], a[500]); -- Heroic: The Culling of Stratholme
    tmp[98] = cat:New(addon.GetInstanceInfoName(284)); -- Trial of the Champion
    AddC(tmp[84], tmp[98]);
    AddA(tmp[98], a[3803]); -- The Faceroller
    AddA(tmp[98], a[3802]); -- Argent Confessor
    AddA(tmp[98], a[3804]); -- I've Had Worse
    AddA(tmp[98], a[4296]); -- Trial of the Champion
    AddA(tmp[98], a[3778]); -- Trial of the Champion
    AddA(tmp[98], a[4298]); -- Heroic: Trial of the Champion
    AddA(tmp[98], a[4297]); -- Heroic: Trial of the Champion
    tmp[99] = cat:New(addon.GetInstanceInfoName(280)); -- The Forge of Souls
    AddC(tmp[84], tmp[99]);
    AddA(tmp[99], a[4522]); -- Soul Power
    AddA(tmp[99], a[4523]); -- Three Faced
    AddA(tmp[99], a[4516]); -- The Forge of Souls
    AddA(tmp[99], a[4519]); -- Heroic: The Forge of Souls
    tmp[100] = cat:New(addon.GetInstanceInfoName(278)); -- Pit of Saron
    AddC(tmp[84], tmp[100]);
    AddA(tmp[100], a[4524]); -- Doesn't Go to Eleven
    AddA(tmp[100], a[4525]); -- Don't Look Up
    AddA(tmp[100], a[4517]); -- The Pit of Saron
    AddA(tmp[100], a[4520]); -- Heroic: The Pit of Saron
    tmp[101] = cat:New(addon.GetInstanceInfoName(276)); -- Halls of Reflection
    AddC(tmp[84], tmp[101]);
    AddA(tmp[101], a[4526]); -- We're Not Retreating; We're Advancing in a Different Direction.
    AddA(tmp[101], a[4518]); -- The Halls of Reflection
    AddA(tmp[101], a[4521]); -- Heroic: The Halls of Reflection
    tmp[85] = cat:New(addon.GetCategoryInfoTitle(15271)); -- Raids
    AddC(tmp[83], tmp[85]);
    AddA(tmp[85], a[1658]); -- Champion of the Frozen Wastes
    AddA(tmp[85], a[2137]); -- Glory of the Raider (10 player)
    AddA(tmp[85], a[2138]); -- Glory of the Raider (25 player)
    AddA(tmp[85], a[12401]); -- Glory of the Ulduar Raider
    AddA(tmp[85], a[4602]); -- Glory of the Icecrown Raider (10 player)
    AddA(tmp[85], a[4603]); -- Glory of the Icecrown Raider (25 player)
    AddA(tmp[85], a[2957]); -- Glory of the Ulduar Raider (10 player)
    AddA(tmp[85], a[2958]); -- Glory of the Ulduar Raider (25 player)
    tmp[102] = cat:New(addon.GetInstanceInfoName(753)); -- Vault of Archavon
    AddC(tmp[85], tmp[102]);
    AddA(tmp[102], a[2081]); -- Grand Black War Mammoth
    tmp[103] = cat:New((GetDifficultyInfo(3))); -- Vault of Archavon 10
    AddC(tmp[102], tmp[103]);
    AddA(tmp[103], a[4016]); -- "Earth, Wind & Fire (10 player)"
    AddA(tmp[103], a[1722]); -- Archavon the Stone Watcher (10 player)
    AddA(tmp[103], a[3136]); -- Emalon the Storm Watcher (10 player)
    AddA(tmp[103], a[3836]); -- Koralon the Flame Watcher (10 player)
    AddA(tmp[103], a[4585]); -- Toravon the Ice Watcher (10 player)
    tmp[104] = cat:New((GetDifficultyInfo(4))); -- Vault of Archavon 25
    AddC(tmp[102], tmp[104]);
    AddA(tmp[104], a[4017]); -- "Earth, Wind & Fire (25 player)"
    AddA(tmp[104], a[1721]); -- Archavon the Stone Watcher (25 player)
    AddA(tmp[104], a[3137]); -- Emalon the Storm Watcher (25 player)
    AddA(tmp[104], a[3837]); -- Koralon the Flame Watcher (25 player)
    AddA(tmp[104], a[4586]); -- Toravon the Ice Watcher (25 player)
    tmp[105] = cat:New(addon.GetInstanceInfoName(754)); -- Naxxramas
    AddC(tmp[85], tmp[105]);
    AddA(tmp[105], a[11750]); -- Undying Aesthetic
    AddA(tmp[105], a[7934]); -- Raiding with Leashes
    AddA(tmp[105], a[9924]); -- Field Photographer
    tmp[106] = cat:New((GetDifficultyInfo(3))); -- Naxxramas 10
    AddC(tmp[105], tmp[106]);
    AddA(tmp[106], a[1997]); -- Momma Said Knock You Out (10 player)
    AddA(tmp[106], a[1858]); -- Arachnophobia (10 player)
    AddA(tmp[106], a[1856]); -- Make Quick Werk of Him (10 player)
    AddA(tmp[106], a[2178]); -- Shocking! (10 player)
    AddA(tmp[106], a[2180]); -- Subtraction (10 player)
    AddA(tmp[106], a[1996]); -- The Safety Dance (10 player)
    AddA(tmp[106], a[2182]); -- Spore Loser (10 player)
    AddA(tmp[106], a[2176]); -- And They Would All Go Down Together (10 player)
    AddA(tmp[106], a[2146]); -- The Hundred Club (10 player)
    AddA(tmp[106], a[2184]); -- Just Can't Get Enough (10 player)
    AddA(tmp[106], a[578]); -- The Dedicated Few (10 player)
    AddA(tmp[106], a[562]); -- The Arachnid Quarter (10 player)
    AddA(tmp[106], a[564]); -- The Construct Quarter (10 player)
    AddA(tmp[106], a[566]); -- The Plague Quarter (10 player)
    AddA(tmp[106], a[568]); -- The Military Quarter (10 player)
    AddA(tmp[106], a[572]); -- Sapphiron's Demise (10 player)
    AddA(tmp[106], a[574]); -- Kel'Thuzad's Defeat (10 player)
    AddA(tmp[106], a[576]); -- The Fall of Naxxramas (10 player)
    AddA(tmp[106], a[2187]); -- The Undying
    tmp[107] = cat:New((GetDifficultyInfo(4))); -- Naxxramas 25
    AddC(tmp[105], tmp[107]);
    AddA(tmp[107], a[2140]); -- Momma Said Knock You Out (25 player)
    AddA(tmp[107], a[1859]); -- Arachnophobia (25 player)
    AddA(tmp[107], a[1857]); -- Make Quick Werk of Him (25 player)
    AddA(tmp[107], a[2179]); -- Shocking! (25 player)
    AddA(tmp[107], a[2181]); -- Subtraction (25 player)
    AddA(tmp[107], a[2139]); -- The Safety Dance (25 player)
    AddA(tmp[107], a[2183]); -- Spore Loser (25 player)
    AddA(tmp[107], a[2177]); -- And They Would All Go Down Together (25 player)
    AddA(tmp[107], a[2147]); -- The Hundred Club (25 player)
    AddA(tmp[107], a[2185]); -- Just Can't Get Enough (25 player)
    AddA(tmp[107], a[579]); -- The Dedicated Few (25 player)
    AddA(tmp[107], a[563]); -- The Arachnid Quarter (25 player)
    AddA(tmp[107], a[565]); -- The Construct Quarter (25 player)
    AddA(tmp[107], a[567]); -- The Plague Quarter (25 player)
    AddA(tmp[107], a[569]); -- The Military Quarter (25 player)
    AddA(tmp[107], a[573]); -- Sapphiron's Demise (25 player)
    AddA(tmp[107], a[575]); -- Kel'Thuzad's Defeat (25 player)
    AddA(tmp[107], a[577]); -- The Fall of Naxxramas (25 player)
    AddA(tmp[107], a[2186]); -- The Immortal
    tmp[108] = cat:New(addon.GetInstanceInfoName(755)); -- The Obsidian Sanctum
    AddC(tmp[85], tmp[108]);
    tmp[109] = cat:New((GetDifficultyInfo(3))); -- The Obsidian Sanctum 10
    AddC(tmp[108], tmp[109]);
    AddA(tmp[109], a[2047]); -- Gonna Go When the Volcano Blows (10 player)
    AddA(tmp[109], a[2049]); -- Twilight Assist (10 player)
    AddA(tmp[109], a[2050]); -- Twilight Duo (10 player)
    AddA(tmp[109], a[2051]); -- The Twilight Zone (10 player)
    AddA(tmp[109], a[624]); -- Less Is More (10 player)
    AddA(tmp[109], a[1876]); -- Besting the Black Dragonflight (10 player)
    tmp[110] = cat:New((GetDifficultyInfo(4))); -- The Obsidian Sanctum 25
    AddC(tmp[108], tmp[110]);
    AddA(tmp[110], a[2048]); -- Gonna Go When the Volcano Blows (25 player)
    AddA(tmp[110], a[2052]); -- Twilight Assist (25 player)
    AddA(tmp[110], a[2053]); -- Twilight Duo (25 player)
    AddA(tmp[110], a[2054]); -- The Twilight Zone (25 player)
    AddA(tmp[110], a[1877]); -- Less Is More (25 player)
    AddA(tmp[110], a[625]); -- Besting the Black Dragonflight (25 player)
    tmp[111] = cat:New(addon.GetInstanceInfoName(756)); -- The Eye of Eternity
    AddC(tmp[85], tmp[111]);
    tmp[112] = cat:New((GetDifficultyInfo(3))); -- The Eye of Eternity 10
    AddC(tmp[111], tmp[112]);
    AddA(tmp[112], a[2148]); -- Denyin' the Scion (10 player)
    AddA(tmp[112], a[1874]); -- You Don't Have an Eternity (10 player)
    AddA(tmp[112], a[1869]); -- A Poke in the Eye (10 player)
    AddA(tmp[112], a[622]); -- The Spellweaver's Downfall (10 player)
    tmp[113] = cat:New((GetDifficultyInfo(4))); -- The Eye of Eternity 25
    AddC(tmp[111], tmp[113]);
    AddA(tmp[113], a[2149]); -- Denyin' the Scion (25 player)
    AddA(tmp[113], a[1875]); -- You Don't Have an Eternity (25 player)
    AddA(tmp[113], a[1870]); -- A Poke in the Eye (25 player)
    AddA(tmp[113], a[623]); -- The Spellweaver's Downfall (25 player)
    tmp[114] = cat:New(addon.GetInstanceInfoName(759)); -- Ulduar
    AddC(tmp[85], tmp[114]);
    AddA(tmp[114], a[12312]); -- Dwarfageddon
    AddA(tmp[114], a[12314]); -- Three Car Garage
    AddA(tmp[114], a[12313]); -- Unbroken
    AddA(tmp[114], a[12316]); -- Shutout
    AddA(tmp[114], a[12315]); -- Take Out Those Turrets
    AddA(tmp[114], a[12317]); -- Orbital Bombardment
    AddA(tmp[114], a[12318]); -- Orbital Devastation
    AddA(tmp[114], a[12319]); -- Nuked from Orbit
    AddA(tmp[114], a[12320]); -- Orbit-uary
    AddA(tmp[114], a[12323]); -- Shattered
    AddA(tmp[114], a[12324]); -- Hot Pocket
    AddA(tmp[114], a[12325]); -- Stokin' the Furnace
    AddA(tmp[114], a[12321]); -- A Quick Shave
    AddA(tmp[114], a[12322]); -- "Iron Dwarf, Medium Rare"
    AddA(tmp[114], a[12326]); -- Nerf Engineering
    AddA(tmp[114], a[12327]); -- Nerf Scrapbots
    AddA(tmp[114], a[12328]); -- Nerf Gravity Bombs
    AddA(tmp[114], a[12329]); -- Must Deconstruct Faster
    AddA(tmp[114], a[12330]); -- Heartbreaker
    AddA(tmp[114], a[12335]); -- But I'm On Your Side
    AddA(tmp[114], a[12336]); -- Can't Do That While Stunned
    AddA(tmp[114], a[12332]); -- "I Choose You, Runemaster Molgeim"
    AddA(tmp[114], a[12333]); -- "I Choose You, Stormcaller Brundir"
    AddA(tmp[114], a[12334]); -- "I Choose You, Steelbreaker"
    AddA(tmp[114], a[12339]); -- If Looks Could Kill
    AddA(tmp[114], a[12340]); -- Rubble and Roll
    AddA(tmp[114], a[12337]); -- With Open Arms
    AddA(tmp[114], a[12338]); -- Disarmed
    AddA(tmp[114], a[12342]); -- Nine Lives
    AddA(tmp[114], a[12341]); -- Crazy Cat Lady
    AddA(tmp[114], a[12343]); -- Cheese the Freeze
    AddA(tmp[114], a[12344]); -- I Have the Coolest Friends
    AddA(tmp[114], a[12345]); -- Getting Cold in Here
    AddA(tmp[114], a[12346]); -- Staying Buffed All Winter
    AddA(tmp[114], a[12347]); -- I Could Say That This Cache Was Rare
    AddA(tmp[114], a[12348]); -- Don't Stand in the Lightning
    AddA(tmp[114], a[12349]); -- I'll Take You All On
    AddA(tmp[114], a[12350]); -- Who Needs Bloodlust?
    AddA(tmp[114], a[12351]); -- Siffed
    AddA(tmp[114], a[12352]); -- Lose Your Illusion
    AddA(tmp[114], a[12360]); -- Lumberjacked
    AddA(tmp[114], a[12361]); -- Con-speed-atory
    AddA(tmp[114], a[12362]); -- Deforestation
    AddA(tmp[114], a[12363]); -- Getting Back to Nature
    AddA(tmp[114], a[12364]); -- Knock on Wood
    AddA(tmp[114], a[12365]); -- "Knock, Knock on Wood"
    AddA(tmp[114], a[12366]); -- "Knock, Knock, Knock on Wood"
    AddA(tmp[114], a[12367]); -- Set Up Us the Bomb
    AddA(tmp[114], a[12368]); -- Not-So-Friendly Fire
    AddA(tmp[114], a[12369]); -- Firefighter
    AddA(tmp[114], a[12372]); -- Shadowdodger
    AddA(tmp[114], a[12373]); -- I Love the Smell of Saronite in the Morning
    AddA(tmp[114], a[12384]); -- Kiss and Make Up
    AddA(tmp[114], a[12395]); -- Drive Me Crazy
    AddA(tmp[114], a[12396]); -- He's Not Getting Any Older
    AddA(tmp[114], a[12397]); -- They're Coming Out of the Walls
    AddA(tmp[114], a[12398]); -- In His House He Waits Dreaming
    AddA(tmp[114], a[12385]); -- Three Lights in the Darkness
    AddA(tmp[114], a[12386]); -- Two Lights in the Darkness
    AddA(tmp[114], a[12387]); -- One Light in the Darkness
    AddA(tmp[114], a[12388]); -- Alone in the Darkness
    AddA(tmp[114], a[12400]); -- Supermassive
    AddA(tmp[114], a[12297]); -- The Siege of Ulduar
    AddA(tmp[114], a[12302]); -- The Antechamber of Ulduar
    AddA(tmp[114], a[12309]); -- The Keepers of Ulduar
    AddA(tmp[114], a[12310]); -- The Descent into Madness
    AddA(tmp[114], a[12311]); -- The Secrets of Ulduar
    AddA(tmp[114], a[12399]); -- Observed
    AddA(tmp[114], a[11751]); -- Mogg-Saron
    AddA(tmp[114], a[4626]); -- And I'll Form the Head!
    AddA(tmp[114], a[3142]); -- "Val'anyr, Hammer of Ancient Kings"
    AddA(tmp[114], a[3316]); -- Herald of the Titans
    AddA(tmp[114], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
    tmp[115] = cat:New((GetDifficultyInfo(3))); -- Ulduar 10
    AddC(tmp[114], tmp[115]);
    AddA(tmp[115], a[3097]); -- Dwarfageddon (10 player)
    AddA(tmp[115], a[2907]); -- Three Car Garage (10 player)
    AddA(tmp[115], a[2905]); -- Unbroken (10 player)
    AddA(tmp[115], a[2911]); -- Shutout (10 player)
    AddA(tmp[115], a[2909]); -- Take Out Those Turrets (10 player)
    AddA(tmp[115], a[2913]); -- Orbital Bombardment (10 player)
    AddA(tmp[115], a[2914]); -- Orbital Devastation (10 player)
    AddA(tmp[115], a[2915]); -- Nuked from Orbit (10 player)
    AddA(tmp[115], a[3056]); -- Orbit-uary (10 player)
    AddA(tmp[115], a[2925]); -- Shattered (10 player)
    AddA(tmp[115], a[2927]); -- Hot Pocket (10 player)
    AddA(tmp[115], a[2930]); -- Stokin' the Furnace (10 player)
    AddA(tmp[115], a[2919]); -- A Quick Shave (10 player)
    AddA(tmp[115], a[2923]); -- "Iron Dwarf, Medium Rare (10 player)"
    AddA(tmp[115], a[2931]); -- Nerf Engineering (10 player)
    AddA(tmp[115], a[2933]); -- Nerf Scrapbots (10 player)
    AddA(tmp[115], a[2934]); -- Nerf Gravity Bombs (10 player)
    AddA(tmp[115], a[2937]); -- Must Deconstruct Faster (10 player)
    AddA(tmp[115], a[3058]); -- Heartbreaker (10 player)
    AddA(tmp[115], a[2945]); -- But I'm On Your Side (10 player)
    AddA(tmp[115], a[2947]); -- Can't Do That While Stunned (10 player)
    AddA(tmp[115], a[2939]); -- "I Choose You, Runemaster Molgeim (10 player)"
    AddA(tmp[115], a[2940]); -- "I Choose You, Stormcaller Brundir (10 player)"
    AddA(tmp[115], a[2941]); -- "I Choose You, Steelbreaker (10 player)"
    AddA(tmp[115], a[2955]); -- If Looks Could Kill (10 player)
    AddA(tmp[115], a[2959]); -- Rubble and Roll (10 player)
    AddA(tmp[115], a[2951]); -- With Open Arms (10 player)
    AddA(tmp[115], a[2953]); -- Disarmed (10 player)
    AddA(tmp[115], a[3076]); -- Nine Lives (10 player)
    AddA(tmp[115], a[3006]); -- Crazy Cat Lady (10 player)
    AddA(tmp[115], a[2961]); -- Cheese the Freeze (10 player)
    AddA(tmp[115], a[2963]); -- I Have the Coolest Friends (10 player)
    AddA(tmp[115], a[2967]); -- Getting Cold in Here (10 player)
    AddA(tmp[115], a[2969]); -- Staying Buffed All Winter (10 player)
    AddA(tmp[115], a[3182]); -- I Could Say That This Cache Was Rare (10 player)
    AddA(tmp[115], a[2971]); -- Don't Stand in the Lightning (10 player)
    AddA(tmp[115], a[2973]); -- I'll Take You All On (10 player)
    AddA(tmp[115], a[2975]); -- Who Needs Bloodlust? (10 player)
    AddA(tmp[115], a[2977]); -- Siffed (10 player)
    AddA(tmp[115], a[3176]); -- Lose Your Illusion (10 player)
    AddA(tmp[115], a[2979]); -- Lumberjacked (10 player)
    AddA(tmp[115], a[2980]); -- Con-speed-atory (10 player)
    AddA(tmp[115], a[2985]); -- Deforestation (10 player)
    AddA(tmp[115], a[2982]); -- Getting Back to Nature (10 player)
    AddA(tmp[115], a[3177]); -- Knock on Wood (10 player)
    AddA(tmp[115], a[3178]); -- "Knock, Knock on Wood (10 player)"
    AddA(tmp[115], a[3179]); -- "Knock, Knock, Knock on Wood (10 player)"
    AddA(tmp[115], a[2989]); -- Set Up Us the Bomb (10 player)
    AddA(tmp[115], a[3138]); -- Not-So-Friendly Fire (10 player)
    AddA(tmp[115], a[3180]); -- Firefighter (10 player)
    AddA(tmp[115], a[2996]); -- Shadowdodger (10 player)
    AddA(tmp[115], a[3181]); -- I Love the Smell of Saronite in the Morning (10 player)
    AddA(tmp[115], a[3009]); -- Kiss and Make Up (10 player)
    AddA(tmp[115], a[3008]); -- Drive Me Crazy (10 player)
    AddA(tmp[115], a[3012]); -- He's Not Getting Any Older (10 player)
    AddA(tmp[115], a[3014]); -- They're Coming Out of the Walls (10 player)
    AddA(tmp[115], a[3015]); -- In His House He Waits Dreaming (10 player)
    AddA(tmp[115], a[3157]); -- Three Lights in the Darkness (10 player)
    AddA(tmp[115], a[3141]); -- Two Lights in the Darkness (10 player)
    AddA(tmp[115], a[3158]); -- One Light in the Darkness (10 player)
    AddA(tmp[115], a[3159]); -- Alone in the Darkness (10 player)
    AddA(tmp[115], a[3003]); -- Supermassive (10 player)
    AddA(tmp[115], a[2886]); -- The Siege of Ulduar (10 player)
    AddA(tmp[115], a[2888]); -- The Antechamber of Ulduar (10 player)
    AddA(tmp[115], a[2890]); -- The Keepers of Ulduar (10 player)
    AddA(tmp[115], a[2892]); -- The Descent into Madness (10 player)
    AddA(tmp[115], a[2894]); -- The Secrets of Ulduar (10 player)
    AddA(tmp[115], a[3036]); -- Observed (10 player)
    AddA(tmp[115], a[3004]); -- He Feeds On Your Tears (10 player)
    AddA(tmp[115], a[2903]); -- Champion of Ulduar
    tmp[116] = cat:New((GetDifficultyInfo(4))); -- Ulduar 25
    AddC(tmp[114], tmp[116]);
    AddA(tmp[116], a[3098]); -- Dwarfageddon (25 player)
    AddA(tmp[116], a[2908]); -- Three Car Garage (25 player)
    AddA(tmp[116], a[2906]); -- Unbroken (25 player)
    AddA(tmp[116], a[2912]); -- Shutout (25 player)
    AddA(tmp[116], a[2910]); -- Take Out Those Turrets (25 player)
    AddA(tmp[116], a[2918]); -- Orbital Bombardment (25 player)
    AddA(tmp[116], a[2916]); -- Orbital Devastation (25 player)
    AddA(tmp[116], a[2917]); -- Nuked from Orbit (25 player)
    AddA(tmp[116], a[3057]); -- Orbit-uary (25 player)
    AddA(tmp[116], a[2926]); -- Shattered (25 player)
    AddA(tmp[116], a[2928]); -- Hot Pocket (25 player)
    AddA(tmp[116], a[2929]); -- Stokin' the Furnace (25 player)
    AddA(tmp[116], a[2921]); -- A Quick Shave (25 player)
    AddA(tmp[116], a[2924]); -- "Iron Dwarf, Medium Rare (25 player)"
    AddA(tmp[116], a[2932]); -- Nerf Engineering (25 player)
    AddA(tmp[116], a[2935]); -- Nerf Scrapbots (25 player)
    AddA(tmp[116], a[2936]); -- Nerf Gravity Bombs (25 player)
    AddA(tmp[116], a[2938]); -- Must Deconstruct Faster (25 player)
    AddA(tmp[116], a[3059]); -- Heartbreaker (25 player)
    AddA(tmp[116], a[2946]); -- But I'm On Your Side (25 player)
    AddA(tmp[116], a[2948]); -- Can't Do That While Stunned (25 player)
    AddA(tmp[116], a[2942]); -- "I Choose You, Runemaster Molgeim (25 player)"
    AddA(tmp[116], a[2943]); -- "I Choose You, Stormcaller Brundir (25 player)"
    AddA(tmp[116], a[2944]); -- "I Choose You, Steelbreaker (25 player)"
    AddA(tmp[116], a[2956]); -- If Looks Could Kill (25 player)
    AddA(tmp[116], a[2960]); -- Rubble and Roll (25 player)
    AddA(tmp[116], a[2952]); -- With Open Arms (25 player)
    AddA(tmp[116], a[2954]); -- Disarmed (25 player)
    AddA(tmp[116], a[3077]); -- Nine Lives (25 player)
    AddA(tmp[116], a[3007]); -- Crazy Cat Lady (25 player)
    AddA(tmp[116], a[2962]); -- Cheese the Freeze (25 player)
    AddA(tmp[116], a[2965]); -- I Have the Coolest Friends (25 player)
    AddA(tmp[116], a[2968]); -- Getting Cold in Here (25 player)
    AddA(tmp[116], a[2970]); -- Staying Buffed All Winter (25 player)
    AddA(tmp[116], a[3184]); -- I Could Say That This Cache Was Rare (25 player)
    AddA(tmp[116], a[2972]); -- Don't Stand in the Lightning (25 player)
    AddA(tmp[116], a[2974]); -- I'll Take You All On (25 player)
    AddA(tmp[116], a[2976]); -- Who Needs Bloodlust? (25 player)
    AddA(tmp[116], a[2978]); -- Siffed (25 player)
    AddA(tmp[116], a[3183]); -- Lose Your Illusion (25 player)
    AddA(tmp[116], a[3118]); -- Lumberjacked (25 player)
    AddA(tmp[116], a[2981]); -- Con-speed-atory (25 player)
    AddA(tmp[116], a[2984]); -- Deforestation (25 player)
    AddA(tmp[116], a[2983]); -- Getting Back to Nature (25 player)
    AddA(tmp[116], a[3185]); -- Knock on Wood (25 player)
    AddA(tmp[116], a[3186]); -- "Knock, Knock on Wood (25 player)"
    AddA(tmp[116], a[3187]); -- "Knock, Knock, Knock on Wood (25 player)"
    AddA(tmp[116], a[3237]); -- Set Up Us the Bomb (25 player)
    AddA(tmp[116], a[2995]); -- Not-So-Friendly Fire (25 player)
    AddA(tmp[116], a[3189]); -- Firefighter (25 player)
    AddA(tmp[116], a[2997]); -- Shadowdodger (25 player)
    AddA(tmp[116], a[3188]); -- I Love the Smell of Saronite in the Morning (25 player)
    AddA(tmp[116], a[3011]); -- Kiss and Make Up (25 player)
    AddA(tmp[116], a[3010]); -- Drive Me Crazy (25 player)
    AddA(tmp[116], a[3013]); -- He's Not Getting Any Older (25 player)
    AddA(tmp[116], a[3017]); -- They're Coming Out of the Walls (25 player)
    AddA(tmp[116], a[3016]); -- In His House He Waits Dreaming (25 player)
    AddA(tmp[116], a[3161]); -- Three Lights in the Darkness (25 player)
    AddA(tmp[116], a[3162]); -- Two Lights in the Darkness (25 player)
    AddA(tmp[116], a[3163]); -- One Light in the Darkness (25 player)
    AddA(tmp[116], a[3164]); -- Alone in the Darkness (25 player)
    AddA(tmp[116], a[3002]); -- Supermassive (25 player)
    AddA(tmp[116], a[2887]); -- The Siege of Ulduar (25 player)
    AddA(tmp[116], a[2889]); -- The Antechamber of Ulduar (25 player)
    AddA(tmp[116], a[2891]); -- The Keepers of Ulduar (25 player)
    AddA(tmp[116], a[2893]); -- The Descent into Madness (25 player)
    AddA(tmp[116], a[2895]); -- The Secrets of Ulduar (25 player)
    AddA(tmp[116], a[3037]); -- Observed (25 player)
    AddA(tmp[116], a[3005]); -- He Feeds On Your Tears (25 player)
    AddA(tmp[116], a[2904]); -- Conqueror of Ulduar
    tmp[117] = cat:New(addon.GetInstanceInfoName(757)); -- Trial of the Crusader
    AddC(tmp[85], tmp[117]);
    AddA(tmp[117], a[11752]); -- Style of the Crusader
    AddA(tmp[117], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
    tmp[118] = cat:New((GetDifficultyInfo(3))); -- Trial of the Crusader 10
    AddC(tmp[117], tmp[118]);
    AddA(tmp[118], a[3797]); -- Upper Back Pain (10 player)
    AddA(tmp[118], a[3936]); -- "Not One, But Two Jormungars (10 player)"
    AddA(tmp[118], a[3996]); -- Three Sixty Pain Spike (10 player)
    AddA(tmp[118], a[3798]); -- Resilience Will Fix It (10 player)
    AddA(tmp[118], a[3799]); -- Salt and Pepper (10 player)
    AddA(tmp[118], a[3800]); -- The Traitor King (10 player)
    AddA(tmp[118], a[3917]); -- Call of the Crusade (10 player)
    AddA(tmp[118], a[3918]); -- Call of the Grand Crusade (10 player)
    AddA(tmp[118], a[3808]); -- A Tribute to Skill (10 player)
    AddA(tmp[118], a[3809]); -- A Tribute to Mad Skill (10 player)
    AddA(tmp[118], a[3810]); -- A Tribute to Insanity (10 player)
    AddA(tmp[118], a[4080]); -- A Tribute to Dedicated Insanity
    tmp[119] = cat:New((GetDifficultyInfo(4))); -- Trial of the Crusader 25
    AddC(tmp[117], tmp[119]);
    AddA(tmp[119], a[3813]); -- Upper Back Pain (25 player)
    AddA(tmp[119], a[3937]); -- "Not One, But Two Jormungars (25 player)"
    AddA(tmp[119], a[3997]); -- Three Sixty Pain Spike (25 player)
    AddA(tmp[119], a[3815]); -- Salt and Pepper (25 player)
    AddA(tmp[119], a[3816]); -- The Traitor King (25 player)
    AddA(tmp[119], a[3916]); -- Call of the Crusade (25 player)
    AddA(tmp[119], a[3812]); -- Call of the Grand Crusade (25 player)
    AddA(tmp[119], a[3817]); -- A Tribute to Skill (25 player)
    AddA(tmp[119], a[3818]); -- A Tribute to Mad Skill (25 player)
    AddA(tmp[119], a[3819]); -- A Tribute to Insanity (25 player)
    AddA(tmp[119], a[4156]); -- A Tribute to Immortality
    AddA(tmp[119], a[4079]); -- A Tribute to Immortality
    tmp[120] = cat:New(addon.GetInstanceInfoName(760)); -- Onyxia's Lair
    AddC(tmp[85], tmp[120]);
    AddA(tmp[120], a[9924]); -- Field Photographer
    tmp[121] = cat:New((GetDifficultyInfo(3))); -- Onyxia's Lair 10
    AddC(tmp[120], tmp[121]);
    AddA(tmp[121], a[4402]); -- More Dots! (10 player)
    AddA(tmp[121], a[4403]); -- Many Whelps! Handle It! (10 player)
    AddA(tmp[121], a[4404]); -- She Deep Breaths More (10 player)
    AddA(tmp[121], a[4396]); -- Onyxia's Lair (10 player)
    tmp[122] = cat:New((GetDifficultyInfo(4))); -- Onyxia's Lair 25
    AddC(tmp[120], tmp[122]);
    AddA(tmp[122], a[4405]); -- More Dots! (25 player)
    AddA(tmp[122], a[4406]); -- Many Whelps! Handle It! (25 player)
    AddA(tmp[122], a[4407]); -- She Deep Breaths More (25 player)
    AddA(tmp[122], a[4397]); -- Onyxia's Lair (25 player)
    tmp[123] = cat:New(addon.GetInstanceInfoName(758)); -- Icecrown Citadel
    AddC(tmp[85], tmp[123]);
    AddA(tmp[123], a[11753]); -- Winter Catalog
    AddA(tmp[123], a[4625]); -- Invincible's Reins
    AddA(tmp[123], a[4623]); -- Shadowmourne
    AddA(tmp[123], a[11320]); -- Raiding with Leashes IV: Wrath of the Lick King
    AddA(tmp[123], a[9924]); -- Field Photographer
    tmp[124] = cat:New((GetDifficultyInfo(3))); -- Icecrown Citadel 10
    AddC(tmp[123], tmp[124]);
    AddA(tmp[124], a[4534]); -- Boned (10 player)
    AddA(tmp[124], a[4535]); -- Full House (10 player)
    AddA(tmp[124], a[4536]); -- I'm on a Boat (10 player)
    AddA(tmp[124], a[4537]); -- I've Gone and Made a Mess (10 player)
    AddA(tmp[124], a[4577]); -- Flu Shot Shortage (10 player)
    AddA(tmp[124], a[4538]); -- Dances with Oozes (10 player)
    AddA(tmp[124], a[4578]); -- "Nausea, Heartburn, Indigestion... (10 player)"
    AddA(tmp[124], a[4582]); -- The Orb Whisperer (10 player)
    AddA(tmp[124], a[4539]); -- "Once Bitten, Twice Shy (10 player)"
    AddA(tmp[124], a[4579]); -- Portal Jockey (10 player)
    AddA(tmp[124], a[4580]); -- All You Can Eat (10 player)
    AddA(tmp[124], a[4601]); -- Been Waiting a Long Time for This (10 player)
    AddA(tmp[124], a[4581]); -- Neck-Deep in Vile (10 player)
    AddA(tmp[124], a[4531]); -- Storming the Citadel (10 player)
    AddA(tmp[124], a[4528]); -- The Plagueworks (10 player)
    AddA(tmp[124], a[4529]); -- The Crimson Hall (10 player)
    AddA(tmp[124], a[4527]); -- The Frostwing Halls (10 player)
    AddA(tmp[124], a[4530]); -- The Frozen Throne (10 player)
    AddA(tmp[124], a[4532]); -- Fall of the Lich King (10 player)
    AddA(tmp[124], a[4628]); -- Heroic: Storming the Citadel (10 player)
    AddA(tmp[124], a[4629]); -- Heroic: The Plagueworks (10 player)
    AddA(tmp[124], a[4630]); -- Heroic: The Crimson Hall (10 player)
    AddA(tmp[124], a[4631]); -- Heroic: The Frostwing Halls (10 player)
    AddA(tmp[124], a[4583]); -- Bane of the Fallen King
    AddA(tmp[124], a[4636]); -- Heroic: Fall of the Lich King (10 player)
    tmp[125] = cat:New((GetDifficultyInfo(4))); -- Icecrown Citadel 25
    AddC(tmp[123], tmp[125]);
    AddA(tmp[125], a[4610]); -- Boned (25 player)
    AddA(tmp[125], a[4611]); -- Full House (25 player)
    AddA(tmp[125], a[4612]); -- I'm on a Boat (25 player)
    AddA(tmp[125], a[4613]); -- I've Gone and Made a Mess (25 player)
    AddA(tmp[125], a[4615]); -- Flu Shot Shortage (25 player)
    AddA(tmp[125], a[4614]); -- Dances with Oozes (25 player)
    AddA(tmp[125], a[4616]); -- "Nausea, Heartburn, Indigestion... (25 player)"
    AddA(tmp[125], a[4617]); -- The Orb Whisperer (25 player)
    AddA(tmp[125], a[4618]); -- "Once Bitten, Twice Shy (25 player)"
    AddA(tmp[125], a[4619]); -- Portal Jockey (25 player)
    AddA(tmp[125], a[4620]); -- All You Can Eat (25 player)
    AddA(tmp[125], a[4621]); -- Been Waiting a Long Time for This (25 player)
    AddA(tmp[125], a[4622]); -- Neck-Deep in Vile (25 player)
    AddA(tmp[125], a[4604]); -- Storming the Citadel (25 player)
    AddA(tmp[125], a[4605]); -- The Plagueworks (25 player)
    AddA(tmp[125], a[4606]); -- The Crimson Hall (25 player)
    AddA(tmp[125], a[4607]); -- The Frostwing Halls (25 player)
    AddA(tmp[125], a[4597]); -- The Frozen Throne (25 player)
    AddA(tmp[125], a[4608]); -- Fall of the Lich King (25 player)
    AddA(tmp[125], a[4632]); -- Heroic: Storming the Citadel (25 player)
    AddA(tmp[125], a[4633]); -- Heroic: The Plagueworks (25 player)
    AddA(tmp[125], a[4634]); -- Heroic: The Crimson Hall (25 player)
    AddA(tmp[125], a[4635]); -- Heroic: The Frostwing Halls (25 player)
    AddA(tmp[125], a[4584]); -- The Light of Dawn
    AddA(tmp[125], a[4637]); -- Heroic: Fall of the Lich King (25 player)
    tmp[615] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[123], tmp[615]);
    AddA(tmp[615], a[4598]); -- The Ashen Verdict
    tmp[126] = cat:New(addon.GetInstanceInfoName(761)); -- The Ruby Sanctum
    AddC(tmp[85], tmp[126]);
    tmp[127] = cat:New((GetDifficultyInfo(3))); -- The Ruby Sanctum 10
    AddC(tmp[126], tmp[127]);
    AddA(tmp[127], a[4817]); -- The Twilight Destroyer (10 player)
    AddA(tmp[127], a[4818]); -- Heroic: The Twilight Destroyer (10 player)
    tmp[128] = cat:New((GetDifficultyInfo(4))); -- The Ruby Sanctum 25
    AddC(tmp[126], tmp[128]);
    AddA(tmp[128], a[4815]); -- The Twilight Destroyer (25 player)
    AddA(tmp[128], a[4816]); -- Heroic: The Twilight Destroyer (25 player)
    tmp[787] = cat:New(addon.GetCategoryInfoTitle(15117)); -- Pet Battles
    AddC(tmp[83], tmp[787]);
    AddA(tmp[787], a[6588]); -- Northrend Safari
    AddA(tmp[787], a[6615]); -- Northrend Tamer
    AddA(tmp[787], a[6605]); -- Taming Northrend
    AddA(tmp[787], a[6558]); -- Local Pet Mauler
    AddA(tmp[787], a[6559]); -- Traveling Pet Mauler
    AddA(tmp[787], a[6560]); -- World Pet Mauler
    AddA(tmp[787], a[6607]); -- Taming Azeroth
    AddA(tmp[787], a[6601]); -- Taming the Wild
    AddA(tmp[787], a[7498]); -- Taming the Great Outdoors
    AddA(tmp[787], a[7499]); -- Taming the World
    AddA(tmp[787], a[6611]); -- Continental Tamer
    AddA(tmp[787], a[6590]); -- World Safari
    AddA(tmp[787], a[8348]); -- The Longest Day
    tmp[1138] = cat:New(addon.GetCategoryInfoTitle(14901)); -- Wintergrasp
    AddC(tmp[83], tmp[1138]);
    AddA(tmp[1138], a[1717]); -- Wintergrasp Victory
    AddA(tmp[1138], a[1718]); -- Wintergrasp Veteran
    AddA(tmp[1138], a[1755]); -- Within Our Grasp
    AddA(tmp[1138], a[2199]); -- Wintergrasp Ranger
    AddA(tmp[1138], a[2080]); -- Black War Mammoth
    AddA(tmp[1138], a[1737]); -- Destruction Derby
    AddA(tmp[1138], a[2476]); -- Destruction Derby
    AddA(tmp[1138], a[1723]); -- Vehicular Gnomeslaughter
    AddA(tmp[1138], a[1727]); -- Leaning Tower
    AddA(tmp[1138], a[1751]); -- Didn't Stand a Chance
    AddA(tmp[1138], a[1752]); -- Master of Wintergrasp
    tmp[781] = cat:New(addon.GetCategoryInfoTitle(14941)); -- Argent Tournament
    AddC(tmp[83], tmp[781]);
    AddA(tmp[781], a[2756]); -- Argent Aspiration
    AddA(tmp[781], a[2758]); -- Argent Valor
    AddA(tmp[781], a[2772]); -- Tilted!
    AddA(tmp[781], a[2836]); -- Lance a Lot
    AddA(tmp[781], a[2773]); -- It's Just a Flesh Wound
    AddA(tmp[781], a[3736]); -- Pony Up!
    AddA(tmp[781], a[2777]); -- Champion of Darnassus
    AddA(tmp[781], a[2787]); -- Champion of the Undercity
    AddA(tmp[781], a[2760]); -- Exalted Champion of Darnassus
    AddA(tmp[781], a[2769]); -- Exalted Champion of the Undercity
    AddA(tmp[781], a[2778]); -- Champion of the Exodar
    AddA(tmp[781], a[2785]); -- Champion of Silvermoon City
    AddA(tmp[781], a[2761]); -- Exalted Champion of the Exodar
    AddA(tmp[781], a[2767]); -- Exalted Champion of Silvermoon City
    AddA(tmp[781], a[2779]); -- Champion of Gnomeregan
    AddA(tmp[781], a[2786]); -- Champion of Thunder Bluff
    AddA(tmp[781], a[2762]); -- Exalted Champion of Gnomeregan
    AddA(tmp[781], a[2768]); -- Exalted Champion of Thunder Bluff
    AddA(tmp[781], a[2780]); -- Champion of Ironforge
    AddA(tmp[781], a[2784]); -- Champion of Sen'jin
    AddA(tmp[781], a[2763]); -- Exalted Champion of Ironforge
    AddA(tmp[781], a[2766]); -- Exalted Champion of Sen'jin
    AddA(tmp[781], a[2781]); -- Champion of Stormwind
    AddA(tmp[781], a[2783]); -- Champion of Orgrimmar
    AddA(tmp[781], a[2764]); -- Exalted Champion of Stormwind
    AddA(tmp[781], a[2765]); -- Exalted Champion of Orgrimmar
    AddA(tmp[781], a[2782]); -- Champion of the Alliance
    AddA(tmp[781], a[2788]); -- Champion of the Horde
    AddA(tmp[781], a[2770]); -- Exalted Champion of the Alliance
    AddA(tmp[781], a[2771]); -- Exalted Champion of the Horde
    AddA(tmp[781], a[2817]); -- Exalted Argent Champion of the Alliance
    AddA(tmp[781], a[2816]); -- Exalted Argent Champion of the Horde
    AddA(tmp[781], a[3676]); -- A Silver Confidant
    AddA(tmp[781], a[3677]); -- The Sunreavers
    AddA(tmp[781], a[4596]); -- The Sword in the Skull
    tmp[952] = cat:New(addon.L["Other"]); -- Other
    AddC(tmp[883], tmp[952]);
    tmp[1160] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[952], tmp[1160]);
    tmp[953] = cat:New((select(2, addon.GetAchievementInfo(14222)))); -- Exile's Reach
    AddC(tmp[1160], tmp[953]);
    AddA(tmp[953], a[14222]); -- Exile's Reach
    tmp[1168] = cat:New(addon.GetCategoryInfoTitle(92)); -- Character
    AddC(tmp[952], tmp[1168]);
    AddA(tmp[1168], a[6]); -- Level 10
    AddA(tmp[1168], a[7]); -- Level 20
    AddA(tmp[1168], a[8]); -- Level 30
    AddA(tmp[1168], a[9]); -- Level 40
    AddA(tmp[1168], a[14782]); -- Level 50
    AddA(tmp[1168], a[14783]); -- Level 60
    AddA(tmp[1168], a[10]); -- Level 50 (Legacy)
    AddA(tmp[1168], a[11]); -- Level 60 (Legacy)
    AddA(tmp[1168], a[12]); -- Level 70 (Legacy)
    AddA(tmp[1168], a[13]); -- Level 80 (Legacy)
    AddA(tmp[1168], a[4826]); -- Level 85 (Legacy)
    AddA(tmp[1168], a[6193]); -- Level 90 (Legacy)
    AddA(tmp[1168], a[9060]); -- Level 100 (Legacy)
    AddA(tmp[1168], a[10671]); -- Level 110 (Legacy)
    AddA(tmp[1168], a[12544]); -- Level 120 (Legacy)
    AddA(tmp[1168], a[7382]); -- Dynamic Duo
    AddA(tmp[1168], a[7383]); -- Terrific Trio
    AddA(tmp[1168], a[7384]); -- Quintessential Quintet
    AddA(tmp[1168], a[7380]); -- Double Agent
    AddA(tmp[1168], a[546]); -- Safe Deposit
    AddA(tmp[1168], a[1176]); -- Got My Mind On My Money
    AddA(tmp[1168], a[1177]); -- Got My Mind On My Money
    AddA(tmp[1168], a[1178]); -- Got My Mind On My Money
    AddA(tmp[1168], a[1180]); -- Got My Mind On My Money
    AddA(tmp[1168], a[1181]); -- Got My Mind On My Money
    AddA(tmp[1168], a[5455]); -- Got My Mind On My Money
    AddA(tmp[1168], a[5456]); -- Got My Mind On My Money
    AddA(tmp[1168], a[6753]); -- Got My Mind On My Money
    AddA(tmp[1168], a[891]); -- Giddy Up!
    AddA(tmp[1168], a[889]); -- Fast and Furious
    AddA(tmp[1168], a[890]); -- Into the Wild Blue Yonder
    AddA(tmp[1168], a[5180]); -- Breaking the Sound Barrier
    AddA(tmp[1168], a[545]); -- Shave and a Haircut
    AddA(tmp[1168], a[557]); -- Superior
    AddA(tmp[1168], a[5373]); -- Cataclysmically Superior
    AddA(tmp[1168], a[6348]); -- Mystically Superior
    AddA(tmp[1168], a[9707]); -- Savagely Superior
    AddA(tmp[1168], a[10764]); -- Brokenly Superior
    AddA(tmp[1168], a[12546]); -- Superior (Battle)
    AddA(tmp[1168], a[14796]); -- Superior
    AddA(tmp[1168], a[556]); -- Epic
    AddA(tmp[1168], a[5372]); -- Cataclysmically Epic
    AddA(tmp[1168], a[6349]); -- Mystically Epic
    AddA(tmp[1168], a[9708]); -- Savagely Epic
    AddA(tmp[1168], a[10765]); -- Brokenly Epic
    AddA(tmp[1168], a[12547]); -- Epic (Battle)
    AddA(tmp[1168], a[14797]); -- Epic
    AddA(tmp[1168], a[705]); -- Master of Arms
    AddA(tmp[1168], a[16]); -- Did Somebody Order a Knuckle Sandwich?
    AddA(tmp[1168], a[2716]); -- Dual Talent Specialization
    AddA(tmp[1168], a[558]); -- Greedy
    AddA(tmp[1168], a[559]); -- Needy
    AddA(tmp[1168], a[892]); -- The Right Stuff
    AddA(tmp[1168], a[2357]); -- Dreadsteed of Xoroth
    AddA(tmp[1168], a[2358]); -- Charger
    AddA(tmp[1168], a[2359]); -- Swift Flight Form
    tmp[1159] = cat:New(addon.GetCategoryInfoTitle(96)); -- Quests
    AddC(tmp[952], tmp[1159]);
    AddA(tmp[1159], a[503]); -- 50 Quests Completed
    AddA(tmp[1159], a[504]); -- 100 Quests Completed
    AddA(tmp[1159], a[505]); -- 250 Quests Completed
    AddA(tmp[1159], a[506]); -- 500 Quests Completed
    AddA(tmp[1159], a[507]); -- 1000 Quests Completed
    AddA(tmp[1159], a[508]); -- 1500 Quests Completed
    AddA(tmp[1159], a[32]); -- 2000 Quests Completed
    AddA(tmp[1159], a[978]); -- 3000 Quests Completed
    AddA(tmp[1159], a[973]); -- 5 Daily Quests Completed
    AddA(tmp[1159], a[974]); -- 50 Daily Quests Completed
    AddA(tmp[1159], a[975]); -- 200 Daily Quests Completed
    AddA(tmp[1159], a[976]); -- 500 Daily Quests Completed
    AddA(tmp[1159], a[977]); -- 1000 Daily Quests Completed
    AddA(tmp[1159], a[5751]); -- 2500 Daily Quests Completed
    AddA(tmp[1159], a[7410]); -- 5000 Daily Quests Completed
    AddA(tmp[1159], a[7411]); -- 10000 Daily Quests Completed
    AddA(tmp[1159], a[11126]); -- 50 World Quests Completed
    AddA(tmp[1159], a[11127]); -- 200 World Quests Completed
    AddA(tmp[1159], a[11128]); -- 500 World Quests Completed
    AddA(tmp[1159], a[11129]); -- 1000 World Quests Completed
    AddA(tmp[1159], a[11130]); -- 2500 World Quests Completed
    AddA(tmp[1159], a[11131]); -- 5000 World Quests Completed
    AddA(tmp[1159], a[11132]); -- "10,000 World Quests Completed"
    AddA(tmp[1159], a[31]); -- A Simple Re-Quest
    AddA(tmp[1159], a[4956]); -- 5 Dungeon Quests Completed
    AddA(tmp[1159], a[4957]); -- 20 Dungeon Quests Completed
    AddA(tmp[1159], a[1182]); -- The Bread Winner
    AddA(tmp[1159], a[5752]); -- Justly Rewarded
    tmp[1161] = cat:New(addon.GetCategoryInfoTitle(97)); -- Exploration
    AddC(tmp[952], tmp[1161]);
    AddA(tmp[1161], a[964]); -- Going Down?
    AddA(tmp[1161], a[1244]); -- Well Read
    AddA(tmp[1161], a[1832]); -- Tastes Like Chicken
    AddA(tmp[1161], a[1833]); -- It's Happy Hour Somewhere
    tmp[1169] = cat:New(addon.GetCategoryInfoTitle(168)); -- Dungeons & Raids
    AddC(tmp[952], tmp[1169]);
    AddA(tmp[1169], a[4476]); -- Looking For More
    AddA(tmp[1169], a[4478]); -- Looking For Multitudes
    tmp[1149] = cat:New(addon.GetCategoryInfoTitle(169)); -- Professions
    AddC(tmp[952], tmp[1149]);
    AddA(tmp[1149], a[1998]); -- Cooking Award
    AddA(tmp[1149], a[1999]); -- 10 Cooking Awards
    AddA(tmp[1149], a[2000]); -- 25 Cooking Awards
    AddA(tmp[1149], a[2001]); -- 50 Cooking Awards
    AddA(tmp[1149], a[2002]); -- 100 Cooking Awards
    AddA(tmp[1149], a[1795]); -- Lunch Lady
    AddA(tmp[1149], a[1796]); -- Short Order Cook
    AddA(tmp[1149], a[1797]); -- Chef de Partie
    AddA(tmp[1149], a[1798]); -- Sous Chef
    AddA(tmp[1149], a[1799]); -- Chef de Cuisine
    AddA(tmp[1149], a[5471]); -- Iron Chef
    AddA(tmp[1149], a[7328]); -- Ironpaw Chef
    AddA(tmp[1149], a[1563]); -- Hail to the Chef
    AddA(tmp[1149], a[153]); -- The Old Gnome and the Sea
    AddA(tmp[1149], a[5478]); -- The Limnologist
    AddA(tmp[1149], a[5479]); -- The Oceanographer
    AddA(tmp[1149], a[1243]); -- Fish Don't Leave Footprints
    AddA(tmp[1149], a[3218]); -- Turtles All the Way Down
    AddA(tmp[1149], a[1556]); -- 25 Fish
    AddA(tmp[1149], a[1557]); -- 50 Fish
    AddA(tmp[1149], a[1558]); -- 100 Fish
    AddA(tmp[1149], a[1559]); -- 250 Fish
    AddA(tmp[1149], a[1560]); -- 500 Fish
    AddA(tmp[1149], a[1561]); -- 1000 Fish
    AddA(tmp[1149], a[1516]); -- Accomplished Angler
    AddA(tmp[1149], a[5315]); -- Digger
    AddA(tmp[1149], a[5469]); -- Diggerer
    AddA(tmp[1149], a[5470]); -- Diggerest
    AddA(tmp[1149], a[4854]); -- I Had It in My Hand
    AddA(tmp[1149], a[4855]); -- What was Briefly Yours is Now Mine
    AddA(tmp[1149], a[4856]); -- It Belongs in a Museum!
    AddA(tmp[1149], a[9422]); -- "The Search For Fact, Not Truth"
    AddA(tmp[1149], a[141]); -- Ultimate Triage
    tmp[1150] = cat:New(addon.GetCategoryInfoTitle(14864)); -- Classic
    AddC(tmp[1149], tmp[1150]);
    AddA(tmp[1150], a[116]); -- Professional Journeyman
    AddA(tmp[1150], a[731]); -- Professional Expert
    AddA(tmp[1150], a[732]); -- Professional Classic Master
    AddA(tmp[1150], a[121]); -- Journeyman Cook
    AddA(tmp[1150], a[122]); -- Expert Cook
    AddA(tmp[1150], a[123]); -- Classic Cook
    AddA(tmp[1150], a[5842]); -- Let's Do Lunch: Darnassus
    AddA(tmp[1150], a[5844]); -- Let's Do Lunch: Undercity
    AddA(tmp[1150], a[5841]); -- Let's Do Lunch: Ironforge
    AddA(tmp[1150], a[5843]); -- Let's Do Lunch: Thunder Bluff
    AddA(tmp[1150], a[5474]); -- Let's Do Lunch: Stormwind
    AddA(tmp[1150], a[5475]); -- Let's Do Lunch: Orgrimmar
    AddA(tmp[1150], a[5845]); -- A Bunch of Lunch
    AddA(tmp[1150], a[5779]); -- You'll Feel Right as Rain
    AddA(tmp[1150], a[126]); -- Journeyman Fisherman
    AddA(tmp[1150], a[127]); -- Expert Fisherman
    AddA(tmp[1150], a[128]); -- Artisan Fisherman
    AddA(tmp[1150], a[1257]); -- The Scavenger
    AddA(tmp[1150], a[150]); -- The Fishing Diplomat
    AddA(tmp[1150], a[306]); -- Master Angler of Azeroth
    AddA(tmp[1150], a[878]); -- One That Didn't Get Away
    AddA(tmp[1150], a[1836]); -- Old Crafty
    AddA(tmp[1150], a[1837]); -- Old Ironjaw
    AddA(tmp[1150], a[5848]); -- Fish or Cut Bait: Darnassus
    AddA(tmp[1150], a[5850]); -- Fish or Cut Bait: Undercity
    AddA(tmp[1150], a[5847]); -- Fish or Cut Bait: Ironforge
    AddA(tmp[1150], a[5849]); -- Fish or Cut Bait: Thunder Bluff
    AddA(tmp[1150], a[5476]); -- Fish or Cut Bait: Stormwind
    AddA(tmp[1150], a[5477]); -- Fish or Cut Bait: Orgrimmar
    AddA(tmp[1150], a[5851]); -- Gone Fishin'
    AddA(tmp[1150], a[4857]); -- Journeyman Archaeologist
    AddA(tmp[1150], a[4919]); -- Expert Archaeologist
    AddA(tmp[1150], a[4920]); -- Artisan Archaeologist
    AddA(tmp[1150], a[131]); -- Journeyman Medic
    AddA(tmp[1150], a[132]); -- Expert Medic
    AddA(tmp[1150], a[133]); -- Artisan Medic
    tmp[1151] = cat:New(addon.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    AddC(tmp[1149], tmp[1151]);
    AddA(tmp[1151], a[733]); -- Professional Outland Master
    AddA(tmp[1151], a[124]); -- Outland Cook
    AddA(tmp[1151], a[877]); -- The Cake Is Not A Lie
    AddA(tmp[1151], a[906]); -- Kickin' It Up a Notch
    AddA(tmp[1151], a[1800]); -- The Outland Gourmet
    AddA(tmp[1151], a[1801]); -- Captain Rumsey's Lager
    AddA(tmp[1151], a[129]); -- Outland Fisherman
    AddA(tmp[1151], a[1257]); -- The Scavenger
    AddA(tmp[1151], a[726]); -- Mr. Pinchy's Magical Crawdad Box
    AddA(tmp[1151], a[144]); -- The Lurker Above
    AddA(tmp[1151], a[905]); -- Old Man Barlowned
    AddA(tmp[1151], a[1225]); -- Outland Angler
    AddA(tmp[1151], a[4921]); -- Master Archaeologist
    AddA(tmp[1151], a[134]); -- Master Medic
    tmp[1152] = cat:New(addon.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    AddC(tmp[1149], tmp[1152]);
    AddA(tmp[1152], a[734]); -- Professional Northrend Master
    AddA(tmp[1152], a[735]); -- Working In the Cold
    AddA(tmp[1152], a[125]); -- Northrend Cook
    AddA(tmp[1152], a[1777]); -- The Northrend Gourmet
    AddA(tmp[1152], a[1778]); -- The Northrend Gourmet
    AddA(tmp[1152], a[1779]); -- The Northrend Gourmet
    AddA(tmp[1152], a[1780]); -- Second That Emotion
    AddA(tmp[1152], a[1781]); -- Critter Gitter
    AddA(tmp[1152], a[1785]); -- Dinner Impossible
    AddA(tmp[1152], a[3296]); -- Cooking with Style
    AddA(tmp[1152], a[1782]); -- Our Daily Bread
    AddA(tmp[1152], a[1783]); -- Our Daily Bread
    AddA(tmp[1152], a[130]); -- Northrend Fisherman
    AddA(tmp[1152], a[1517]); -- Northrend Angler
    AddA(tmp[1152], a[3217]); -- Chasing Marcia
    AddA(tmp[1152], a[2094]); -- A Penny For Your Thoughts
    AddA(tmp[1152], a[2095]); -- Silver in the City
    AddA(tmp[1152], a[1957]); -- There's Gold In That There Fountain
    AddA(tmp[1152], a[2096]); -- The Coin Master
    AddA(tmp[1152], a[1958]); -- I Smell A Giant Rat
    AddA(tmp[1152], a[4922]); -- Grand Master Archaeologist
    AddA(tmp[1152], a[135]); -- Grand Master Medic
    AddA(tmp[1152], a[137]); -- Stocking Up
    AddA(tmp[1152], a[730]); -- Skills to Pay the Bills
    tmp[1153] = cat:New(addon.GetCategoryInfoTitle(15072)); -- Cataclysm
    AddC(tmp[1149], tmp[1153]);
    AddA(tmp[1153], a[4924]); -- Professional Cataclysmic Master
    AddA(tmp[1153], a[4914]); -- Working In the Heat
    AddA(tmp[1153], a[4916]); -- Cataclysmic Cook
    AddA(tmp[1153], a[5472]); -- The Cataclysmic Gourmet
    AddA(tmp[1153], a[5473]); -- The Cataclysmic Gourmet
    AddA(tmp[1153], a[4917]); -- Cataclysmic Fisherman
    AddA(tmp[1153], a[4923]); -- Illustrious Grand Master Archaeologist
    AddA(tmp[1153], a[5511]); -- It's Always in the Last Place You Look
    AddA(tmp[1153], a[4858]); -- Seven Scepters
    AddA(tmp[1153], a[5191]); -- Tragedy in Three Acts
    AddA(tmp[1153], a[5193]); -- Blue Streak
    AddA(tmp[1153], a[5192]); -- The Harder they Fall
    AddA(tmp[1153], a[4859]); -- Kings Under the Mountain
    AddA(tmp[1153], a[5301]); -- The Boy Who Would be King
    AddA(tmp[1153], a[4918]); -- Illustrious Grand Master Medic
    AddA(tmp[1153], a[5480]); -- Preparing for Disaster
    AddA(tmp[1153], a[4915]); -- More Skills to Pay the Bills
    tmp[1154] = cat:New(addon.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    AddC(tmp[1149], tmp[1154]);
    AddA(tmp[1154], a[6830]); -- Professional Zen Master
    AddA(tmp[1154], a[6835]); -- Working For a Living
    AddA(tmp[1154], a[7378]); -- Jack of All Trades
    AddA(tmp[1154], a[7379]); -- Pandaren Master of All
    AddA(tmp[1154], a[6365]); -- Zen Master Cook
    AddA(tmp[1154], a[7300]); -- Master of the Grill
    AddA(tmp[1154], a[7301]); -- Master of the Wok
    AddA(tmp[1154], a[7302]); -- Master of the Pot
    AddA(tmp[1154], a[7303]); -- Master of the Steamer
    AddA(tmp[1154], a[7304]); -- Master of the Oven
    AddA(tmp[1154], a[7305]); -- Master of the Brew
    AddA(tmp[1154], a[7306]); -- Master of Pandaren Cooking
    AddA(tmp[1154], a[7325]); -- Now I Am the Master
    AddA(tmp[1154], a[7326]); -- The Pandaren Gourmet
    AddA(tmp[1154], a[7327]); -- The Pandaren Gourmet
    AddA(tmp[1154], a[6839]); -- Zen Master Fisherman
    AddA(tmp[1154], a[7611]); -- Pandarian Angler
    AddA(tmp[1154], a[7614]); -- Locking Down the Docks
    AddA(tmp[1154], a[7274]); -- Learning from the Best
    AddA(tmp[1154], a[6837]); -- Zen Master Archaeologist
    AddA(tmp[1154], a[7331]); -- The Three Brew Fathers
    AddA(tmp[1154], a[7332]); -- The Broken Hearted
    AddA(tmp[1154], a[7333]); -- The Four Celestials
    AddA(tmp[1154], a[7334]); -- Instruments of Cruelty
    AddA(tmp[1154], a[7335]); -- Symbols of Strength
    AddA(tmp[1154], a[7337]); -- Documents of a Dark History
    AddA(tmp[1154], a[7336]); -- Stone Servants
    AddA(tmp[1154], a[7338]); -- Collector: Pandaren Tea Sets
    AddA(tmp[1154], a[7358]); -- Collector: Pandaren Tea Sets
    AddA(tmp[1154], a[7339]); -- Collector: Pandaren Game Boards
    AddA(tmp[1154], a[7359]); -- Collector: Pandaren Game Boards
    AddA(tmp[1154], a[7340]); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    AddA(tmp[1154], a[7360]); -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    AddA(tmp[1154], a[7341]); -- Collector: Walking Canes of Brewfather Ren Yun
    AddA(tmp[1154], a[7361]); -- Collector: Walking Canes of Brewfather Ren Yun
    AddA(tmp[1154], a[7342]); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    AddA(tmp[1154], a[7362]); -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    AddA(tmp[1154], a[7343]); -- Collector: Carved Bronze Mirrors
    AddA(tmp[1154], a[7363]); -- Collector: Carved Bronze Mirrors
    AddA(tmp[1154], a[7344]); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    AddA(tmp[1154], a[7364]); -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    AddA(tmp[1154], a[7345]); -- Collector: Apothecary Tins
    AddA(tmp[1154], a[7365]); -- Collector: Apothecary Tins
    AddA(tmp[1154], a[7346]); -- Collector: Pearls of Yu'lon
    AddA(tmp[1154], a[7366]); -- Collector: Pearls of Yu'lon
    AddA(tmp[1154], a[7347]); -- Collector: Standards of Niuzao
    AddA(tmp[1154], a[7367]); -- Collector: Standards of Niuzao
    AddA(tmp[1154], a[7348]); -- Collector: Manacles of Rebellion
    AddA(tmp[1154], a[7368]); -- Collector: Manacles of Rebellion
    AddA(tmp[1154], a[7349]); -- Collector: Cracked Mogu Runestones
    AddA(tmp[1154], a[7369]); -- Collector: Cracked Mogu Runestones
    AddA(tmp[1154], a[7350]); -- Collector: Terracotta Arms
    AddA(tmp[1154], a[7370]); -- Collector: Terracotta Arms
    AddA(tmp[1154], a[7351]); -- Collector: Petrified Bone Whips
    AddA(tmp[1154], a[7371]); -- Collector: Petrified Bone Whips
    AddA(tmp[1154], a[7352]); -- Collector: Thunder King Insignias
    AddA(tmp[1154], a[7372]); -- Collector: Thunder King Insignias
    AddA(tmp[1154], a[7373]); -- Collector: Edicts of the Thunder King
    AddA(tmp[1154], a[7353]); -- Collector: Edicts of the Thunder King
    AddA(tmp[1154], a[7354]); -- Collector: Iron Amulets
    AddA(tmp[1154], a[7374]); -- Collector: Iron Amulets
    AddA(tmp[1154], a[7355]); -- Collector: Warlord's Branding Irons
    AddA(tmp[1154], a[7375]); -- Collector: Warlord's Branding Irons
    AddA(tmp[1154], a[7356]); -- Collector: Mogu Coins
    AddA(tmp[1154], a[7376]); -- Collector: Mogu Coins
    AddA(tmp[1154], a[7357]); -- Collector: Worn Monument Ledgers
    AddA(tmp[1154], a[7377]); -- Collector: Worn Monument Ledgers
    AddA(tmp[1154], a[8220]); -- Collector: Banners of the Mantid Empire
    AddA(tmp[1154], a[8221]); -- Collector: Banners of the Mantid Empire
    AddA(tmp[1154], a[8222]); -- Collector: Ancient Sap Feeders
    AddA(tmp[1154], a[8223]); -- Collector: Ancient Sap Feeders
    AddA(tmp[1154], a[8224]); -- Collector: Praying Mantids
    AddA(tmp[1154], a[8225]); -- Collector: Praying Mantids
    AddA(tmp[1154], a[8226]); -- Collector: Inert Sound Beacons
    AddA(tmp[1154], a[8227]); -- Collector: Inert Sound Beacons
    AddA(tmp[1154], a[8228]); -- Collector: Remains of Paragons
    AddA(tmp[1154], a[8229]); -- Collector: Remains of Paragons
    AddA(tmp[1154], a[8230]); -- Collector: Mantid Lamps
    AddA(tmp[1154], a[8231]); -- Collector: Mantid Lamps
    AddA(tmp[1154], a[8232]); -- Collector: Pollen Collectors
    AddA(tmp[1154], a[8233]); -- Collector: Pollen Collectors
    AddA(tmp[1154], a[8234]); -- Collector: Kypari Sap Containers
    AddA(tmp[1154], a[8235]); -- Collector: Kypari Sap Containers
    AddA(tmp[1154], a[7612]); -- The Seat of Knowledge
    AddA(tmp[1154], a[8219]); -- History of the Mantid
    AddA(tmp[1154], a[6838]); -- Zen Master Medic
    AddA(tmp[1154], a[6836]); -- Serious Skills to Pay the Bills
    tmp[1155] = cat:New(addon.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    AddC(tmp[1149], tmp[1155]);
    AddA(tmp[1155], a[9464]); -- Professional Draenor Master
    AddA(tmp[1155], a[9507]); -- Working in Draenor
    AddA(tmp[1155], a[9087]); -- Draenor Master of All
    AddA(tmp[1155], a[9453]); -- Draenic Stone Collector
    AddA(tmp[1155], a[9454]); -- Draenic Seed Collector
    AddA(tmp[1155], a[9071]); -- Inspector Gadgetzan
    AddA(tmp[1155], a[9500]); -- Draenor Cook
    AddA(tmp[1155], a[9501]); -- The Draenor Gourmet
    AddA(tmp[1155], a[9503]); -- Draenor Fisherman
    AddA(tmp[1155], a[9455]); -- Fire Ammonite Angler
    AddA(tmp[1155], a[9456]); -- Abyssal Gulper Eel Angler
    AddA(tmp[1155], a[9457]); -- Blackwater Whiptail Angler
    AddA(tmp[1155], a[9458]); -- Blind Lake Sturgeon Angler
    AddA(tmp[1155], a[9459]); -- Fat Sleeper Angler
    AddA(tmp[1155], a[9460]); -- Jawless Skulker Angler
    AddA(tmp[1155], a[9461]); -- Sea Scorpion Angler
    AddA(tmp[1155], a[9462]); -- Draenor Angler
    AddA(tmp[1155], a[9547]); -- Everything Is Awesome!
    AddA(tmp[1155], a[9409]); -- Draenor Archaeologist
    AddA(tmp[1155], a[9413]); -- Strength and Honor
    AddA(tmp[1155], a[9414]); -- Ogre Observer
    AddA(tmp[1155], a[9415]); -- Secrets of Skettis
    AddA(tmp[1155], a[9410]); -- Unite the Clans
    AddA(tmp[1155], a[9411]); -- Highmaul Historian
    AddA(tmp[1155], a[9412]); -- Arakkoa Archivist
    AddA(tmp[1155], a[9419]); -- Draenor Curator
    AddA(tmp[1155], a[9505]); -- Draenor Medic
    AddA(tmp[1155], a[9506]); -- Savage Skills to Pay the Bills
    tmp[1156] = cat:New(addon.GetCategoryInfoTitle(15258)); -- Legion
    AddC(tmp[1149], tmp[1156]);
    AddA(tmp[1156], a[10582]); -- Professional Legion Master
    AddA(tmp[1156], a[10581]); -- Working the Isles
    AddA(tmp[1156], a[10583]); -- Legion Master of All
    AddA(tmp[1156], a[10761]); -- Resourceful
    AddA(tmp[1156], a[10587]); -- Hot Swapper
    AddA(tmp[1156], a[10588]); -- The Shortest Distance
    AddA(tmp[1156], a[10589]); -- Legion Cook
    AddA(tmp[1156], a[10591]); -- All Grown Up
    AddA(tmp[1156], a[10592]); -- Never A Day's Rest
    AddA(tmp[1156], a[10762]); -- The Legion Menu
    AddA(tmp[1156], a[10593]); -- Everything Tastes Better
    AddA(tmp[1156], a[10594]); -- Legion Fisherman
    AddA(tmp[1156], a[10597]); -- Legion Aquaculture
    AddA(tmp[1156], a[10595]); -- A Cast Above the Rest
    AddA(tmp[1156], a[10596]); -- Bigger Fish to Fry
    AddA(tmp[1156], a[10598]); -- Fishing 'Round the Isles
    AddA(tmp[1156], a[10722]); -- The Wish Remover
    AddA(tmp[1156], a[11725]); -- Fisherfriend of the Isles
    AddA(tmp[1156], a[10600]); -- Legion Archaeologist
    AddA(tmp[1156], a[10601]); -- Surveying the Land
    AddA(tmp[1156], a[10602]); -- This Side Up
    AddA(tmp[1156], a[10603]); -- A Keen Eye
    AddA(tmp[1156], a[10604]); -- Legion Curator
    AddA(tmp[1156], a[10605]); -- Handle With Care
    AddA(tmp[1156], a[10606]); -- The Dwarven Dream
    AddA(tmp[1156], a[10607]); -- Getting Your Hands Dirty
    AddA(tmp[1156], a[10608]); -- Sifting Through the Sand
    AddA(tmp[1156], a[10609]); -- No Stone Unturned
    AddA(tmp[1156], a[10599]); -- Legion Medic
    AddA(tmp[1156], a[10580]); -- Heroic Skills to Pay the Bills
    AddA(tmp[1156], a[11138]); -- Is There a Medic in the Zone?
    AddA(tmp[1156], a[11139]); -- Field Medic
    AddA(tmp[1156], a[10585]); -- Fel-Smelter
    AddA(tmp[1156], a[10586]); -- Mass Obliteration
    tmp[1157] = cat:New(addon.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    AddC(tmp[1149], tmp[1157]);
    AddA(tmp[1157], a[12731]); -- Professional Kul Tiran Master
    AddA(tmp[1157], a[12733]); -- Professional Zandalari Master
    AddA(tmp[1157], a[12734]); -- Working in Kul Tiras
    AddA(tmp[1157], a[12735]); -- Working in Zandalar
    AddA(tmp[1157], a[12736]); -- Kul Tiran Master of All
    AddA(tmp[1157], a[12737]); -- Zandalari Master of All
    AddA(tmp[1157], a[12741]); -- Giving a Scrap
    AddA(tmp[1157], a[13056]); -- Giving a Scrap
    AddA(tmp[1157], a[12738]); -- Holy Scrap!
    AddA(tmp[1157], a[12739]); -- Scraptastic!
    AddA(tmp[1157], a[12740]); -- Full of Scrap!
    AddA(tmp[1157], a[13516]); -- Massive Tool
    AddA(tmp[1157], a[12742]); -- Kul Tiran Cook
    AddA(tmp[1157], a[12743]); -- Zandalari Cook
    AddA(tmp[1157], a[12744]); -- The Kul Tiran Menu
    AddA(tmp[1157], a[12746]); -- The Zandalari Menu
    AddA(tmp[1157], a[12747]); -- Catering for Combat
    AddA(tmp[1157], a[12753]); -- Kul Tiran Fisherman
    AddA(tmp[1157], a[12754]); -- Zandalari Fisherman
    AddA(tmp[1157], a[13489]); -- Secret Fish of Mechagon
    AddA(tmp[1157], a[13502]); -- Secret Fish and Where to Find Them
    AddA(tmp[1157], a[12757]); -- Angling for Battle
    AddA(tmp[1157], a[12755]); -- Scent of the Sea
    AddA(tmp[1157], a[12756]); -- Fish Me In the Moonlight
    AddA(tmp[1157], a[12758]); -- Baiting the Enemy
    AddA(tmp[1157], a[12759]); -- Baiting the Enemy
    AddA(tmp[1157], a[12990]); -- Catchin' Some Rays
    AddA(tmp[1157], a[12760]); -- Kul Tiran Archaeologist
    AddA(tmp[1157], a[12761]); -- Zandalari Archaeologist
    AddA(tmp[1157], a[12762]); -- Kul Tiran Curator
    AddA(tmp[1157], a[12764]); -- Zandalari Curator
    AddA(tmp[1157], a[12765]); -- Exotic Discoveries
    AddA(tmp[1157], a[12769]); -- Light Travel
    AddA(tmp[1157], a[12770]); -- Lengthy Legwork
    tmp[1158] = cat:New(addon.GetCategoryInfoTitle(15439)); -- Shadowlands
    AddC(tmp[1149], tmp[1158]);
    AddA(tmp[1158], a[14328]); -- Professional Shadowlands Master
    AddA(tmp[1158], a[14329]); -- Working the Afterlife
    AddA(tmp[1158], a[14330]); -- Shadowlands Master of All
    AddA(tmp[1158], a[14332]); -- Shadowlands Cook
    AddA(tmp[1158], a[14333]); -- Shadowlands Fisherman
    tmp[1163] = cat:New(addon.GetCategoryInfoTitle(201)); -- Reputation
    AddC(tmp[952], tmp[1163]);
    AddA(tmp[1163], a[522]); -- Somebody Likes Me
    AddA(tmp[1163], a[523]); -- 5 Exalted Reputations
    AddA(tmp[1163], a[524]); -- 10 Exalted Reputations
    AddA(tmp[1163], a[521]); -- 15 Exalted Reputations
    AddA(tmp[1163], a[520]); -- 20 Exalted Reputations
    AddA(tmp[1163], a[519]); -- 25 Exalted Reputations
    AddA(tmp[1163], a[518]); -- 30 Exalted Reputations
    AddA(tmp[1163], a[1014]); -- 35 Exalted Reputations
    AddA(tmp[1163], a[5374]); -- 45 Exalted Reputations
    AddA(tmp[1163], a[5723]); -- 50 Exalted Reputations
    AddA(tmp[1163], a[6826]); -- 55 Exalted Reputations
    AddA(tmp[1163], a[11177]); -- 70 Exalted Reputations
    AddA(tmp[1163], a[12865]); -- 90 Exalted Reputations
    AddA(tmp[1163], a[5794]); -- Time Flies When You're Having Fun
    AddA(tmp[1163], a[12243]); -- Allied Races: Lightforged Draenei
    AddA(tmp[1163], a[12414]); -- Heritage of the Lightforged
    AddA(tmp[1163], a[14013]); -- Allied Races: Mechagnome
    AddA(tmp[1163], a[14014]); -- Heritage of the Mechagnome
    AddA(tmp[1163], a[12242]); -- Allied Races: Void Elf
    AddA(tmp[1163], a[12291]); -- Heritage of the Void
    AddA(tmp[1163], a[12515]); -- Allied Races: Dark Iron Dwarf
    AddA(tmp[1163], a[13076]); -- Heritage of the Dark Iron
    AddA(tmp[1163], a[13163]); -- Allied Races: Kul Tiran
    AddA(tmp[1163], a[13504]); -- Heritage of the Kul Tirans
    AddA(tmp[1163], a[12245]); -- Allied Races: Highmountain Tauren
    AddA(tmp[1163], a[12415]); -- Heritage of Highmountain
    AddA(tmp[1163], a[12244]); -- Allied Races: Nightborne
    AddA(tmp[1163], a[12413]); -- Heritage of the Nightborne
    AddA(tmp[1163], a[12518]); -- Allied Races: Mag'har Orc
    AddA(tmp[1163], a[13077]); -- Heritage of the Mag'har
    AddA(tmp[1163], a[13161]); -- Allied Races: Zandalari Troll
    AddA(tmp[1163], a[13503]); -- Heritage of the Zandalari
    AddA(tmp[1163], a[13206]); -- Allied Races: Vulpera
    AddA(tmp[1163], a[14002]); -- Heritage of the Vulpera
    tmp[1170] = cat:New(addon.GetCategoryInfoTitle(15117)); -- Pet Battles
    AddC(tmp[952], tmp[1170]);
    AddA(tmp[1170], a[7482]); -- Trainer Extraordinaire
    AddA(tmp[1170], a[7483]); -- Battle Master
    AddA(tmp[1170], a[6600]); -- Ultimate Trainer
    AddA(tmp[1170], a[7521]); -- Time to Open a Pet Store
    AddA(tmp[1170], a[9712]); -- Shiny Pet Charmer
    AddA(tmp[1170], a[12927]); -- Polished Pet Charmer
    AddA(tmp[1170], a[1017]); -- Can I Keep Him?
    AddA(tmp[1170], a[15]); -- Plenty of Pets
    AddA(tmp[1170], a[1248]); -- Plethora of Pets
    AddA(tmp[1170], a[1250]); -- "Shop Smart, Shop Pet...Smart"
    AddA(tmp[1170], a[2516]); -- Lil' Game Hunter
    AddA(tmp[1170], a[5876]); -- Petting Zoo
    AddA(tmp[1170], a[5877]); -- Menagerie
    AddA(tmp[1170], a[5875]); -- Littlest Pet Shop
    AddA(tmp[1170], a[7500]); -- Going to Need More Leashes
    AddA(tmp[1170], a[7501]); -- That's a Lot of Pet Food
    AddA(tmp[1170], a[9643]); -- So. Many. Pets.
    AddA(tmp[1170], a[12992]); -- Pet Emporium
    AddA(tmp[1170], a[12958]); -- Master of Minions
    AddA(tmp[1170], a[6554]); -- He's Mine!
    AddA(tmp[1170], a[6555]); -- Building a Team
    AddA(tmp[1170], a[6556]); -- Going to Need More Traps
    AddA(tmp[1170], a[6557]); -- Master Pet Hunter
    AddA(tmp[1170], a[7436]); -- Zen Pet Hunter
    AddA(tmp[1170], a[7465]); -- An Uncommon Find
    AddA(tmp[1170], a[7462]); -- A Rare Catch
    AddA(tmp[1170], a[7463]); -- High Quality
    AddA(tmp[1170], a[7464]); -- Quality & Quantity
    AddA(tmp[1170], a[6608]); -- Family Reunion
    AddA(tmp[1170], a[6571]); -- That Was Close!
    AddA(tmp[1170], a[6594]); -- Cat Fight!
    AddA(tmp[1170], a[6593]); -- Experienced Pet Battler
    AddA(tmp[1170], a[6462]); -- Master Pet Battler
    AddA(tmp[1170], a[6591]); -- Grand Master Pet Battler
    AddA(tmp[1170], a[6592]); -- Legendary Pet Battler
    AddA(tmp[1170], a[6851]); -- Take 'Em All On!
    AddA(tmp[1170], a[6595]); -- Pet Brawler
    AddA(tmp[1170], a[6596]); -- Experienced Pet Brawler
    AddA(tmp[1170], a[6597]); -- Master Pet Brawler
    AddA(tmp[1170], a[6598]); -- Grand Master Pet Brawler
    AddA(tmp[1170], a[6599]); -- Legendary Pet Brawler
    AddA(tmp[1170], a[8297]); -- Merciless Pet Brawler
    AddA(tmp[1170], a[8298]); -- Vengeful Pet Brawler
    AddA(tmp[1170], a[8300]); -- Brutal Pet Brawler
    AddA(tmp[1170], a[12279]); -- Mechanical Brawler
    AddA(tmp[1170], a[12280]); -- Aquatic Brawler
    AddA(tmp[1170], a[12281]); -- Beast Brawler
    AddA(tmp[1170], a[12282]); -- Elemental Brawler
    AddA(tmp[1170], a[12283]); -- Magic Brawler
    AddA(tmp[1170], a[12284]); -- Critter Brawler
    AddA(tmp[1170], a[12285]); -- Undead Brawler
    AddA(tmp[1170], a[12286]); -- Flying Brawler
    AddA(tmp[1170], a[12287]); -- Dragonkin Brawler
    AddA(tmp[1170], a[12289]); -- Humanoid Brawler
    AddA(tmp[1170], a[12290]); -- Family Brawler
    AddA(tmp[1170], a[6618]); -- On A Roll
    AddA(tmp[1170], a[6619]); -- Win Streak
    AddA(tmp[1170], a[6620]); -- No Time To Heal
    AddA(tmp[1170], a[7433]); -- Newbie
    AddA(tmp[1170], a[6566]); -- Just a Pup
    AddA(tmp[1170], a[6567]); -- Growing Up
    AddA(tmp[1170], a[6568]); -- Time for a Leash
    AddA(tmp[1170], a[6569]); -- Old Timer
    AddA(tmp[1170], a[6570]); -- All Growns Up!
    AddA(tmp[1170], a[6579]); -- Rookie Pet Group
    AddA(tmp[1170], a[6580]); -- Rookie Pet Crew
    AddA(tmp[1170], a[6583]); -- Rookie Pet Mob
    AddA(tmp[1170], a[6578]); -- Pro Pet Group
    AddA(tmp[1170], a[6581]); -- Pro Pet Crew
    AddA(tmp[1170], a[6582]); -- Pro Pet Mob
    AddA(tmp[1170], a[6609]); -- No Favorites
    AddA(tmp[1170], a[6610]); -- All Pets Allowed
    AddA(tmp[1170], a[9070]); -- Overstuffed
    tmp[1171] = cat:New(addon.GetCategoryInfoTitle(15246)); -- Collections
    AddC(tmp[952], tmp[1171]);
    AddA(tmp[1171], a[621]); -- Represent
    AddA(tmp[1171], a[1020]); -- Ten Tabards
    AddA(tmp[1171], a[1021]); -- Twenty-Five Tabards
    AddA(tmp[1171], a[5755]); -- Thirty Tabards
    AddA(tmp[1171], a[9911]); -- Where's the Mailbox?
    AddA(tmp[1171], a[9906]); -- Alt-ernative Lifestyle
    AddA(tmp[1171], a[9908]); -- Ready for Powerleveling
    AddA(tmp[1171], a[9670]); -- Toying Around
    AddA(tmp[1171], a[9671]); -- Having a Ball
    AddA(tmp[1171], a[9672]); -- Tons of Toys
    AddA(tmp[1171], a[9673]); -- The Toymaster
    AddA(tmp[1171], a[11176]); -- Remember to Share
    AddA(tmp[1171], a[12996]); -- Toybox Tycoon
    tmp[1172] = cat:New(addon.GetCategoryInfoTitle(81)); -- Feats of Strength
    AddC(tmp[952], tmp[1172]);
    AddA(tmp[1172], a[4496]); -- It's Over Nine Thousand!
    AddA(tmp[1172], a[3636]); -- Jade Tiger
    AddA(tmp[1172], a[3896]); -- Onyx Panther
    tmp[1225] = cat:New(addon.L["Excluded"]); -- Excluded
    AddC(tmp[883], tmp[1225]);
    tmp[1225].HasFlexibleData = true;
    tinsert(excludedCategories, tmp[1225]);
    tmp[1225].IsExcluded = true;
    tmp[884] = cat:New(addon.L["Events"]); -- TAB - Events
    tmp[884].TabName = "Events";
    local events = tmp[884];
    tmp[1206] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[884], tmp[1206]);
    tmp[1206].AlwaysVisible = true;
    tmp[1206].IsSummary = true;
    tmp[1218] = cat:New(addon.L["Focused"]); -- Focused
    AddC(tmp[884], tmp[1218]);
    tmp[1218].HasFlexibleData = true;
    tinsert(focusedCategories, tmp[1218]);
    tmp[1218].IsFocused = true;
    tmp[1214] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[884], tmp[1214]);
    tmp[1214].HasFlexibleData = true;
    tinsert(currentZoneCategories, tmp[1214]);
    tmp[1214].IsCurrentZone = true;
    tmp[1221] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[884], tmp[1221]);
    tmp[1221].HasFlexibleData = true;
    tinsert(selectedZoneCategories, tmp[1221]);
    tmp[1221].IsSelectedZone = true;
    tmp[918] = cat:New(addon.L["Holidays"]); -- Holidays
    AddC(tmp[884], tmp[918]);
    AddA(tmp[918], a[2144]); -- "What a Long, Strange Trip It's Been"
    tmp[885] = cat:New(addon.GetCategoryInfoTitle(160)); -- Lunar Festival
    AddC(tmp[918], tmp[885]);
    AddA(tmp[885], a[605]); -- A Coin of Ancestry
    AddA(tmp[885], a[606]); -- 5 Coins of Ancestry
    AddA(tmp[885], a[607]); -- 10 Coins of Ancestry
    AddA(tmp[885], a[608]); -- 25 Coins of Ancestry
    AddA(tmp[885], a[609]); -- 50 Coins of Ancestry
    AddA(tmp[885], a[626]); -- Lunar Festival Finery
    AddA(tmp[885], a[1281]); -- The Rocket's Red Glare
    AddA(tmp[885], a[1552]); -- Frenzied Firecracker
    AddA(tmp[885], a[937]); -- Elune's Blessing
    AddA(tmp[885], a[6006]); -- Elders of Cataclysm
    AddA(tmp[885], a[912]); -- Elders of Eastern Kingdoms
    AddA(tmp[885], a[911]); -- Elders of Kalimdor
    AddA(tmp[885], a[1396]); -- Elders of Northrend
    AddA(tmp[885], a[910]); -- Elders of the Dungeons
    AddA(tmp[885], a[915]); -- Elders of the Alliance
    AddA(tmp[885], a[914]); -- Elders of the Horde
    AddA(tmp[885], a[913]); -- To Honor One's Elders
    tmp[910] = cat:New(addon.GetCategoryInfoTitle(187)); -- Love is in the Air
    AddC(tmp[918], tmp[910]);
    AddA(tmp[910], a[1701]); -- Be Mine!
    AddA(tmp[910], a[260]); -- Charming
    AddA(tmp[910], a[1695]); -- Dangerous Love
    AddA(tmp[910], a[1699]); -- Fistful of Love
    AddA(tmp[910], a[1279]); -- Flirt With Disaster
    AddA(tmp[910], a[1280]); -- Flirt With Disaster
    AddA(tmp[910], a[1704]); -- I Pitied The Fool
    AddA(tmp[910], a[1291]); -- Lonely?
    AddA(tmp[910], a[1694]); -- Lovely Luck Is On Your Side
    AddA(tmp[910], a[1703]); -- "My Love is Like a Red, Red Rose"
    AddA(tmp[910], a[1697]); -- Nation of Adoration
    AddA(tmp[910], a[1698]); -- Nation of Adoration
    AddA(tmp[910], a[1700]); -- Perma-Peddle
    AddA(tmp[910], a[1696]); -- The Rocket's Pink Glare
    AddA(tmp[910], a[1188]); -- Shafted!
    AddA(tmp[910], a[1702]); -- Sweet Tooth
    AddA(tmp[910], a[4624]); -- Tough Love
    AddA(tmp[910], a[9389]); -- It Might Just Save Your Life
    AddA(tmp[910], a[9392]); -- Love Magnet
    AddA(tmp[910], a[9393]); -- Beacon of Love
    AddA(tmp[910], a[9394]); -- They Really Love Me!
    AddA(tmp[910], a[1693]); -- Fool For Love
    tmp[911] = cat:New(addon.GetCategoryInfoTitle(159)); -- Noblegarden
    AddC(tmp[918], tmp[911]);
    AddA(tmp[911], a[2676]); -- I Found One!
    AddA(tmp[911], a[2417]); -- Chocolate Lover
    AddA(tmp[911], a[2418]); -- Chocoholic
    AddA(tmp[911], a[248]); -- Sunday's Finest
    AddA(tmp[911], a[249]); -- Dressed for the Occasion
    AddA(tmp[911], a[2416]); -- Hard Boiled
    AddA(tmp[911], a[2419]); -- Spring Fling
    AddA(tmp[911], a[2497]); -- Spring Fling
    AddA(tmp[911], a[2421]); -- Noble Garden
    AddA(tmp[911], a[2420]); -- Noble Garden
    AddA(tmp[911], a[2422]); -- Shake Your Bunny-Maker
    AddA(tmp[911], a[2436]); -- Desert Rose
    AddA(tmp[911], a[2576]); -- Blushing Bride
    AddA(tmp[911], a[2798]); -- Noble Gardener
    tmp[912] = cat:New(addon.GetCategoryInfoTitle(163)); -- Children's Week
    AddC(tmp[918], tmp[912]);
    AddA(tmp[912], a[1791]); -- Home Alone
    AddA(tmp[912], a[1788]); -- Bad Example
    AddA(tmp[912], a[1789]); -- Daily Chores
    AddA(tmp[912], a[1792]); -- "Aw, Isn't It Cute?"
    AddA(tmp[912], a[1786]); -- School of Hard Knocks
    AddA(tmp[912], a[1790]); -- "Hail To The King, Baby"
    AddA(tmp[912], a[275]); -- Veteran Nanny
    AddA(tmp[912], a[1793]); -- For the Children
    tmp[913] = cat:New(addon.GetCategoryInfoTitle( 161)); -- Midsummer
    AddC(tmp[918], tmp[913]);
    AddA(tmp[913], a[263]); -- Ice the Frost Lord
    AddA(tmp[913], a[271]); -- Burning Hot Pole Dance
    AddA(tmp[913], a[1145]); -- King of the Fire Festival
    AddA(tmp[913], a[272]); -- Torch Juggler
    AddA(tmp[913], a[1022]); -- Flame Warden of Eastern Kingdoms
    AddA(tmp[913], a[1025]); -- Flame Keeper of Eastern Kingdoms
    AddA(tmp[913], a[1023]); -- Flame Warden of Kalimdor
    AddA(tmp[913], a[1026]); -- Flame Keeper of Kalimdor
    AddA(tmp[913], a[1024]); -- Flame Warden of Outland
    AddA(tmp[913], a[1027]); -- Flame Keeper of Outland
    AddA(tmp[913], a[6008]); -- Flame Warden of Northrend
    AddA(tmp[913], a[6009]); -- Flame Keeper of Northrend
    AddA(tmp[913], a[6011]); -- Flame Warden of Cataclysm
    AddA(tmp[913], a[6012]); -- Flame Keeper of Cataclysm
    AddA(tmp[913], a[1034]); -- The Fires of Azeroth
    AddA(tmp[913], a[1036]); -- The Fires of Azeroth
    AddA(tmp[913], a[8045]); -- Flame Warden of Pandaria
    AddA(tmp[913], a[8044]); -- Flame Keeper of Pandaria
    AddA(tmp[913], a[11283]); -- Flame Warden of Draenor
    AddA(tmp[913], a[11284]); -- Flame Keeper of Draenor
    AddA(tmp[913], a[11280]); -- Flame Warden of the Broken Isles
    AddA(tmp[913], a[11282]); -- Flame Keeper of the Broken Isles
    AddA(tmp[913], a[13341]); -- Flame Warden of Kul Tiras
    AddA(tmp[913], a[13340]); -- Flame Keeper of Zandalar
    AddA(tmp[913], a[1028]); -- Extinguishing Eastern Kingdoms
    AddA(tmp[913], a[1031]); -- Extinguishing Eastern Kingdoms
    AddA(tmp[913], a[1029]); -- Extinguishing Kalimdor
    AddA(tmp[913], a[1032]); -- Extinguishing Kalimdor
    AddA(tmp[913], a[1030]); -- Extinguishing Outland
    AddA(tmp[913], a[1033]); -- Extinguishing Outland
    AddA(tmp[913], a[6007]); -- Extinguishing Northrend
    AddA(tmp[913], a[6010]); -- Extinguishing Northrend
    AddA(tmp[913], a[6013]); -- Extinguishing the Cataclysm
    AddA(tmp[913], a[6014]); -- Extinguishing the Cataclysm
    AddA(tmp[913], a[1035]); -- Desecration of the Horde
    AddA(tmp[913], a[1037]); -- Desecration of the Alliance
    AddA(tmp[913], a[8042]); -- Extinguishing Pandaria
    AddA(tmp[913], a[8043]); -- Extinguishing Pandaria
    AddA(tmp[913], a[11276]); -- Extinguishing Draenor
    AddA(tmp[913], a[11277]); -- Extinguishing Draenor
    AddA(tmp[913], a[11278]); -- Extinguishing the Broken Isles
    AddA(tmp[913], a[11279]); -- Extinguishing the Broken Isles
    AddA(tmp[913], a[13343]); -- Extinguishing Zandalar
    AddA(tmp[913], a[13342]); -- Extinguishing Kul Tiras
    AddA(tmp[913], a[1038]); -- The Flame Warden
    AddA(tmp[913], a[1039]); -- The Flame Keeper
    tmp[919] = cat:New(addon.L["Pirates' Day"]); -- Pirates' Day
    AddC(tmp[918], tmp[919]);
    AddA(tmp[919], a[3457]); -- The Captain's Booty
    tmp[914] = cat:New(addon.GetCategoryInfoTitle(162)); -- Brewfest
    AddC(tmp[918], tmp[914]);
    AddA(tmp[914], a[1184]); -- Strange Brew
    AddA(tmp[914], a[1203]); -- Strange Brew
    AddA(tmp[914], a[1936]); -- Does Your Wolpertinger Linger?
    AddA(tmp[914], a[1185]); -- The Brewfest Diet
    AddA(tmp[914], a[2796]); -- Brew of the Month
    AddA(tmp[914], a[1183]); -- Brew of the Year
    AddA(tmp[914], a[1260]); -- Almost Blind Luck
    AddA(tmp[914], a[295]); -- Direbrewfest
    AddA(tmp[914], a[293]); -- Disturbing the Peace
    AddA(tmp[914], a[303]); -- "Have Keg, Will Travel"
    AddA(tmp[914], a[1683]); -- Brewmaster
    AddA(tmp[914], a[1292]); -- Yellow Brewfest Stein
    AddA(tmp[914], a[1293]); -- Blue Brewfest Stein
    AddA(tmp[914], a[4782]); -- Green Brewfest Stein
    AddA(tmp[914], a[1186]); -- Down With The Dark Iron
    tmp[915] = cat:New(addon.GetCategoryInfoTitle(158)); -- Hallow's End
    AddC(tmp[918], tmp[915]);
    AddA(tmp[915], a[972]); -- Trick or Treat!
    AddA(tmp[915], a[288]); -- Out With It
    AddA(tmp[915], a[255]); -- Bring Me The Head of... Oh Wait
    AddA(tmp[915], a[289]); -- The Savior of Hallow's End
    AddA(tmp[915], a[979]); -- The Mask Task
    AddA(tmp[915], a[284]); -- A Mask for All Occasions
    AddA(tmp[915], a[981]); -- That Sparkling Smile
    AddA(tmp[915], a[1040]); -- Rotten Hallow
    AddA(tmp[915], a[1041]); -- Rotten Hallow
    AddA(tmp[915], a[1261]); -- G.N.E.R.D. Rage
    AddA(tmp[915], a[291]); -- Check Your Head
    AddA(tmp[915], a[283]); -- The Masquerade
    AddA(tmp[915], a[292]); -- Sinister Calling
    AddA(tmp[915], a[966]); -- Tricks and Treats of Eastern Kingdoms
    AddA(tmp[915], a[967]); -- Tricks and Treats of Eastern Kingdoms
    AddA(tmp[915], a[963]); -- Tricks and Treats of Kalimdor
    AddA(tmp[915], a[965]); -- Tricks and Treats of Kalimdor
    AddA(tmp[915], a[969]); -- Tricks and Treats of Outland
    AddA(tmp[915], a[968]); -- Tricks and Treats of Outland
    AddA(tmp[915], a[971]); -- Tricks and Treats of Azeroth
    AddA(tmp[915], a[5836]); -- Tricks and Treats of Northrend
    AddA(tmp[915], a[5835]); -- Tricks and Treats of Northrend
    AddA(tmp[915], a[5837]); -- Tricks and Treats of the Cataclysm
    AddA(tmp[915], a[5838]); -- Tricks and Treats of the Cataclysm
    AddA(tmp[915], a[7601]); -- Tricks and Treats of Pandaria
    AddA(tmp[915], a[7602]); -- Tricks and Treats of Pandaria
    AddA(tmp[915], a[10365]); -- A Frightening Friend
    AddA(tmp[915], a[1656]); -- Hallowed Be Thy Name
    tmp[920] = cat:New(addon.L["Day of the Dead"]); -- Day of the Dead
    AddC(tmp[918], tmp[920]);
    AddA(tmp[920], a[3456]); -- Dead Man's Party
    AddA(tmp[920], a[9426]); -- To The Afterlife
    AddA(tmp[920], a[9427]); -- Vientos!
    AddA(tmp[920], a[9428]); -- Calavera
    tmp[916] = cat:New(addon.GetCategoryInfoTitle(14981)); -- Pilgrim's Bounty
    AddC(tmp[918], tmp[916]);
    AddA(tmp[916], a[3579]); -- """FOOD FIGHT!"""
    AddA(tmp[916], a[3576]); -- Now We're Cookin'
    AddA(tmp[916], a[3577]); -- Now We're Cookin'
    AddA(tmp[916], a[3556]); -- Pilgrim's Paunch
    AddA(tmp[916], a[3557]); -- Pilgrim's Paunch
    AddA(tmp[916], a[3580]); -- Pilgrim's Peril
    AddA(tmp[916], a[3581]); -- Pilgrim's Peril
    AddA(tmp[916], a[3596]); -- Pilgrim's Progress
    AddA(tmp[916], a[3597]); -- Pilgrim's Progress
    AddA(tmp[916], a[3558]); -- Sharing is Caring
    AddA(tmp[916], a[3582]); -- Terokkar Turkey Time
    AddA(tmp[916], a[3578]); -- The Turkinator
    AddA(tmp[916], a[3559]); -- Turkey Lurkey
    AddA(tmp[916], a[3478]); -- Pilgrim
    tmp[917] = cat:New(addon.GetCategoryInfoTitle(156)); -- Winter Veil
    AddC(tmp[918], tmp[917]);
    AddA(tmp[917], a[273]); -- On Metzen!
    AddA(tmp[917], a[252]); -- With a Little Helper from My Friends
    AddA(tmp[917], a[259]); -- Scrooge
    AddA(tmp[917], a[1255]); -- Scrooge
    AddA(tmp[917], a[1282]); -- Fa-la-la-la-Ogri'la
    AddA(tmp[917], a[277]); -- 'Tis the Season
    AddA(tmp[917], a[1295]); -- Crashin' & Thrashin'
    AddA(tmp[917], a[279]); -- Simply Abominable
    AddA(tmp[917], a[1687]); -- Let It Snow
    AddA(tmp[917], a[1685]); -- Holiday Bromance
    AddA(tmp[917], a[1686]); -- Holiday Bromance
    AddA(tmp[917], a[1688]); -- The Winter Veil Gourmet
    AddA(tmp[917], a[1689]); -- He Knows If You've Been Naughty
    AddA(tmp[917], a[1690]); -- A Frosty Shake
    AddA(tmp[917], a[4436]); -- BB King
    AddA(tmp[917], a[4437]); -- BB King
    AddA(tmp[917], a[5853]); -- A-Caroling We Will Go
    AddA(tmp[917], a[5854]); -- A-Caroling We Will Go
    AddA(tmp[917], a[8699]); -- The Danger Zone
    AddA(tmp[917], a[15181]); -- Rock n' Roll
    AddA(tmp[917], a[10353]); -- Iron Armada
    AddA(tmp[917], a[1691]); -- Merrymaker
    AddA(tmp[917], a[15653]); -- The More You Know*
    tmp[950] = cat:New(addon.L["Gifts"], true); -- Gifts
    AddC(tmp[917], tmp[950]);
    AddA(tmp[950], a[1705]); -- Clockwork Rocket Bot
    AddA(tmp[950], a[1706]); -- Crashin' Thrashin' Racer
    AddA(tmp[950], a[6059]); -- Red Rider Air Rifle
    AddA(tmp[950], a[6060]); -- MiniZep Controller
    AddA(tmp[950], a[6061]); -- Gaudy Winter Veil Sweater
    AddA(tmp[950], a[7852]); -- They're Both Footballs?
    AddA(tmp[950], a[8698]); -- Crashin' Thrashin' Flyer
    AddA(tmp[950], a[9915]); -- Crashin' Thrashin' Shredder
    AddA(tmp[950], a[10337]); -- Crashin' Thrashin' Flamer
    AddA(tmp[950], a[10751]); -- Brr... It's Cold in Here
    AddA(tmp[950], a[11913]); -- Don't Play With That In The House
    AddA(tmp[950], a[12850]); -- At Least You're Being Careful
    AddA(tmp[950], a[13927]); -- Crashin' Splashin'
    AddA(tmp[950], a[14931]); -- Flying Festivities
    AddA(tmp[950], a[15313]); -- Rockin' Rollin' Racer
    AddA(tmp[950], a[15645]); -- To Catch Falling Stars
    tmp[1173] = cat:New(addon.L["WoW's Anniversary"]); -- WoW's Anniversary
    AddC(tmp[884], tmp[1173]);
    AddA(tmp[1173], a[2398]); -- WoW's 4th Anniversary
    AddA(tmp[1173], a[4400]); -- WoW's 5th Anniversary
    AddA(tmp[1173], a[5512]); -- WoW's 6th Anniversary
    AddA(tmp[1173], a[5863]); -- WoW's 7th Anniversary
    AddA(tmp[1173], a[6131]); -- WoW's 8th Anniversary
    AddA(tmp[1173], a[7853]); -- WoW's 9th Anniversary
    AddA(tmp[1173], a[8820]); -- WoW's 10th Anniversary
    AddA(tmp[1173], a[10058]); -- WoW's 11th Anniversary
    AddA(tmp[1173], a[10741]); -- WoW's 12th Anniversary
    AddA(tmp[1173], a[11848]); -- WoW's 13th Anniversary
    AddA(tmp[1173], a[12827]); -- WoW's 14th Anniversary
    AddA(tmp[1173], a[13917]); -- WoW's 15th Anniversary
    AddA(tmp[1173], a[14271]); -- WoW's 16th Anniversary
    AddA(tmp[1173], a[14942]); -- WoW's 17th Anniversary
    AddA(tmp[1173], a[15218]); -- WoW's 18th Anniversary
    AddA(tmp[1173], a[10335]); -- Did Someone Say...?
    tmp[925] = cat:New(addon.GetCategoryInfoTitle(15101)); -- Darkmoon Faire
    AddC(tmp[884], tmp[925]);
    AddA(tmp[925], a[6019]); -- "Come One, Come All!"
    AddA(tmp[925], a[6021]); -- Blastenheimer Bullseye
    AddA(tmp[925], a[6023]); -- Darkmoon Duelist
    AddA(tmp[925], a[6024]); -- Darkmoon Dominator
    AddA(tmp[925], a[6027]); -- Darkmoon Dungeoneer
    AddA(tmp[925], a[6028]); -- Darkmoon Defender
    AddA(tmp[925], a[6029]); -- Darkmoon Despoiler
    AddA(tmp[925], a[6032]); -- Faire Favors
    AddA(tmp[925], a[6026]); -- Fairegoer's Feast
    AddA(tmp[925], a[6025]); -- I Was Promised a Pony
    AddA(tmp[925], a[6022]); -- Quick Shot
    AddA(tmp[925], a[6020]); -- Step Right Up
    AddA(tmp[925], a[6030]); -- Taking the Show on the Road
    AddA(tmp[925], a[6031]); -- Taking the Show on the Road
    AddA(tmp[925], a[6332]); -- That Rabbit's Dynamite!
    AddA(tmp[925], a[9250]); -- Flying High
    AddA(tmp[925], a[9251]); -- Ringmaster
    AddA(tmp[925], a[9252]); -- Brood of Alysrazor
    AddA(tmp[925], a[9885]); -- Ace Tonk Commander
    AddA(tmp[925], a[9894]); -- Triumphant Turtle Tossing
    AddA(tmp[925], a[9983]); -- That's Whack!
    AddA(tmp[925], a[9755]); -- Darkmoon Race Enthusiast
    AddA(tmp[925], a[9756]); -- Darkmoon Racer Novice
    AddA(tmp[925], a[9759]); -- Darkmoon Racer Jockey
    AddA(tmp[925], a[9760]); -- Darkmoon Racer Leadfoot
    AddA(tmp[925], a[9761]); -- Darkmoon Racer Roadhog
    AddA(tmp[925], a[9770]); -- Blast Off!
    AddA(tmp[925], a[9769]); -- Rocketeer: Bronze
    AddA(tmp[925], a[9766]); -- Rocketeer: Silver
    AddA(tmp[925], a[9764]); -- Rocketeer: Gold
    AddA(tmp[925], a[9786]); -- Wayfarer
    AddA(tmp[925], a[9787]); -- Wanderluster: Bronze
    AddA(tmp[925], a[9790]); -- Wanderluster: Silver
    AddA(tmp[925], a[9792]); -- Wanderluster: Gold
    AddA(tmp[925], a[9780]); -- Go-Getter
    AddA(tmp[925], a[9781]); -- Powermonger: Bronze
    AddA(tmp[925], a[9783]); -- Powermonger: Silver
    AddA(tmp[925], a[9785]); -- Powermonger: Gold
    AddA(tmp[925], a[9793]); -- Big Race Enthusiast
    AddA(tmp[925], a[9794]); -- Big Race Novice
    AddA(tmp[925], a[9795]); -- Big Race Jockey
    AddA(tmp[925], a[9797]); -- Big Race Leadfoot
    AddA(tmp[925], a[9799]); -- Big Race Roadhog
    AddA(tmp[925], a[9800]); -- Rocket Man
    AddA(tmp[925], a[9801]); -- Big Rocketeer: Bronze
    AddA(tmp[925], a[9803]); -- Big Rocketeer: Silver
    AddA(tmp[925], a[9805]); -- Big Rocketeer: Gold
    AddA(tmp[925], a[9806]); -- Vagabond
    AddA(tmp[925], a[9807]); -- Big Wanderluster: Bronze
    AddA(tmp[925], a[9809]); -- Big Wanderluster: Silver
    AddA(tmp[925], a[9811]); -- Big Wanderluster: Gold
    AddA(tmp[925], a[9812]); -- Goal-Oriented
    AddA(tmp[925], a[9813]); -- Big Powermonger: Bronze
    AddA(tmp[925], a[9815]); -- Big Powermonger: Silver
    AddA(tmp[925], a[9817]); -- Big Powermonger: Gold
    AddA(tmp[925], a[9819]); -- Darkmoon Like the Wind
    AddA(tmp[925], a[11918]); -- "Hey, You're a Rockstar!"
    AddA(tmp[925], a[11919]); -- Taking this Show on the Road
    AddA(tmp[925], a[11920]); -- Perfect Performance
    AddA(tmp[925], a[11921]); -- Mosh Pit
    AddA(tmp[925], a[15212]); -- First Dance
    AddA(tmp[925], a[15213]); -- Don't Stop Dancing
    AddA(tmp[925], a[15222]); -- You Got the Beat
    AddA(tmp[925], a[15223]); -- Feeling It
    AddA(tmp[925], a[15214]); -- What a Feeling
    AddA(tmp[925], a[15215]); -- Can't Stop the Feeling
    AddA(tmp[925], a[15216]); -- Make You Sweat
    AddA(tmp[925], a[15217]); -- Maniac on the Dance Floor
    AddA(tmp[925], a[15221]); -- Dancing Machine
    tmp[1030] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[925], tmp[1030]);
    AddA(tmp[1030], a[2336]); -- Insane in the Membrane
    tmp[951] = cat:New(addon.GetCategoryInfoTitle(15454)); -- Timewalking
    AddC(tmp[884], tmp[951]);
    AddA(tmp[951], a[13931]); -- "Memories of Fel, Frost and Fire"
    AddA(tmp[951], a[13928]); -- Alterac Valley of Olde
    AddA(tmp[951], a[13930]); -- Alterac Valley of Olde
    tmp[954] = cat:New(addon.GetCategoryInfoTitle(15258)); -- Legion
    AddC(tmp[951], tmp[954]);
    AddA(tmp[954], a[15309]); -- A Towering Success
    AddA(tmp[954], a[15310]); -- A Tour of Towers
    AddA(tmp[954], a[15308]); -- Tower Overwhelming
    tmp[947] = cat:New(addon.GetCategoryInfoTitle(15258)); -- Legion
    AddC(tmp[884], tmp[947]);
    tmp[948] = cat:New(addon.L["Legion Assaults"]); -- Legion Assaults
    AddC(tmp[947], tmp[948]);
    AddA(tmp[948], a[11544]); -- Defender of the Broken Isles
    tmp[932] = cat:New(addon.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    AddC(tmp[884], tmp[932]);
    tmp[933] = cat:New(addon.L["Faction Assaults"]); -- Faction Assaults
    AddC(tmp[932], tmp[933]);
    tmp[935] = cat:New(addon.L["Assault on Tiragarde Sound"]); -- Assault on Tiragarde Sound
    AddC(tmp[933], tmp[935]);
    AddA(tmp[935], a[13285]); -- Upright Citizens
    AddA(tmp[935], a[13317]); -- Supplied and Ready
    AddA(tmp[935], a[13283]); -- Frontline Warrior
    AddA(tmp[935], a[13284]); -- Frontline Warrior
    AddA(tmp[935], a[13387]); -- Frontline Veteran
    AddA(tmp[935], a[13388]); -- Frontline Veteran
    AddA(tmp[935], a[13402]); -- Frontline Slayer
    AddA(tmp[935], a[13403]); -- Frontline Slayer
    tmp[936] = cat:New(addon.L["Assault on Drustvar"]); -- Assault on Drustvar
    AddC(tmp[933], tmp[936]);
    AddA(tmp[936], a[13435]); -- Doomsoul Surprise
    AddA(tmp[936], a[13317]); -- Supplied and Ready
    AddA(tmp[936], a[13283]); -- Frontline Warrior
    AddA(tmp[936], a[13284]); -- Frontline Warrior
    AddA(tmp[936], a[13387]); -- Frontline Veteran
    AddA(tmp[936], a[13388]); -- Frontline Veteran
    AddA(tmp[936], a[13402]); -- Frontline Slayer
    AddA(tmp[936], a[13403]); -- Frontline Slayer
    tmp[937] = cat:New(addon.L["Assault on Stormsong Valley"]); -- Assault on Stormsong Valley
    AddC(tmp[933], tmp[937]);
    AddA(tmp[937], a[13317]); -- Supplied and Ready
    AddA(tmp[937], a[13283]); -- Frontline Warrior
    AddA(tmp[937], a[13284]); -- Frontline Warrior
    AddA(tmp[937], a[13387]); -- Frontline Veteran
    AddA(tmp[937], a[13388]); -- Frontline Veteran
    AddA(tmp[937], a[13402]); -- Frontline Slayer
    AddA(tmp[937], a[13403]); -- Frontline Slayer
    tmp[934] = cat:New(addon.L["Assault on Zuldazar"]); -- Assault on Zuldazar
    AddC(tmp[933], tmp[934]);
    AddA(tmp[934], a[13440]); -- Pushing the Payload
    AddA(tmp[934], a[13441]); -- Pushing the Payload
    AddA(tmp[934], a[13439]); -- Boxing Match
    AddA(tmp[934], a[13317]); -- Supplied and Ready
    AddA(tmp[934], a[13283]); -- Frontline Warrior
    AddA(tmp[934], a[13284]); -- Frontline Warrior
    AddA(tmp[934], a[13387]); -- Frontline Veteran
    AddA(tmp[934], a[13388]); -- Frontline Veteran
    AddA(tmp[934], a[13402]); -- Frontline Slayer
    AddA(tmp[934], a[13403]); -- Frontline Slayer
    tmp[938] = cat:New(addon.L["Assault on Nazmir"]); -- Assault on Nazmir
    AddC(tmp[933], tmp[938]);
    AddA(tmp[938], a[13426]); -- Come On and Slam
    AddA(tmp[938], a[13317]); -- Supplied and Ready
    AddA(tmp[938], a[13283]); -- Frontline Warrior
    AddA(tmp[938], a[13284]); -- Frontline Warrior
    AddA(tmp[938], a[13387]); -- Frontline Veteran
    AddA(tmp[938], a[13388]); -- Frontline Veteran
    AddA(tmp[938], a[13402]); -- Frontline Slayer
    AddA(tmp[938], a[13403]); -- Frontline Slayer
    tmp[939] = cat:New(addon.L["Assault on Vol'dun"]); -- Assault on Vol'dun
    AddC(tmp[933], tmp[939]);
    AddA(tmp[939], a[13437]); -- Scavenge like a Vulpera
    AddA(tmp[939], a[13317]); -- Supplied and Ready
    AddA(tmp[939], a[13283]); -- Frontline Warrior
    AddA(tmp[939], a[13284]); -- Frontline Warrior
    AddA(tmp[939], a[13387]); -- Frontline Veteran
    AddA(tmp[939], a[13388]); -- Frontline Veteran
    AddA(tmp[939], a[13402]); -- Frontline Slayer
    AddA(tmp[939], a[13403]); -- Frontline Slayer
    tmp[940] = cat:New(addon.L["N'Zoth Assaults"]); -- N'Zoth Assaults
    AddC(tmp[932], tmp[940]);
    tmp[941] = cat:New(addon.GetMapName(1530)); -- Vale of Eternal Blossoms
    AddC(tmp[940], tmp[941]);
    AddA(tmp[941], a[14154]); -- Defend the Vale
    AddA(tmp[941], a[14161]); -- All Consuming
    AddA(tmp[941], a[14160]); -- Rare to Well Done
    AddA(tmp[941], a[14159]); -- Combating the Corruption
    AddA(tmp[941], a[14158]); -- It's Not A Tumor!
    AddA(tmp[941], a[14156]); -- The Rajani
    tmp[942] = cat:New(addon.GetMapName(1527)); -- Uldum
    AddC(tmp[940], tmp[942]);
    AddA(tmp[942], a[14153]); -- Uldum Under Assault
    AddA(tmp[942], a[14161]); -- All Consuming
    AddA(tmp[942], a[14160]); -- Rare to Well Done
    AddA(tmp[942], a[14159]); -- Combating the Corruption
    AddA(tmp[942], a[14158]); -- It's Not A Tumor!
    AddA(tmp[942], a[14155]); -- Uldum Accord
    tmp[926] = cat:New(addon.GetCategoryInfoTitle(15439)); -- Shadowlands
    AddC(tmp[884], tmp[926]);
    tmp[927] = cat:New(addon.L["Covenant Assaults"]); -- Covenant Assaults
    AddC(tmp[926], tmp[927]);
    tmp[928] = cat:New(addon.L["Kyrian Assault"]); -- Kyrian Assault
    AddC(tmp[927], tmp[928]);
    AddA(tmp[928], a[15041]); -- The Zovaal Shuffle
    AddA(tmp[928], a[15034]); -- Wings Against the Flames
    AddA(tmp[928], a[15004]); -- A Sly Fox
    tmp[929] = cat:New(addon.L["Necrolords Assault"]); -- Necrolords Assault
    AddC(tmp[927], tmp[929]);
    AddA(tmp[929], a[15037]); -- This Army
    AddA(tmp[929], a[15039]); -- Up For Grabs
    AddA(tmp[929], a[15032]); -- Breaking Their Hold
    tmp[930] = cat:New(addon.L["Night Fae Assault"]); -- Night Fae Assault
    AddC(tmp[927], tmp[930]);
    AddA(tmp[930], a[15001]); -- Jailer's Personal Stash
    AddA(tmp[930], a[15044]); -- Krrprripripkraak's Heroes
    AddA(tmp[930], a[15036]); -- Rooting Out the Evil
    tmp[931] = cat:New(addon.L["Venthyr Assault"]); -- Venthyr Assault
    AddC(tmp[927], tmp[931]);
    AddA(tmp[931], a[15043]); -- Hoarder of Torghast
    AddA(tmp[931], a[15042]); -- Tea for the Troubled
    AddA(tmp[931], a[15033]); -- Taking the Tremaculum
    tmp[1208] = cat:New(addon.L["Fated Raids"]); -- Fated Raids
    AddC(tmp[926], tmp[1208]);
    tmp[1209] = cat:New(addon.GetInstanceInfoName(1190)); -- Castle Nathria
    AddC(tmp[1208], tmp[1209]);
    AddA(tmp[1209], a[15663]); -- Fate of Nathria
    AddA(tmp[1209], a[15664]); -- Heroic: Fate of Nathria
    AddA(tmp[1209], a[15665]); -- Mythic: Fate of Nathria
    AddA(tmp[1209], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[1209], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[1209], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[1210] = cat:New(addon.GetInstanceInfoName(1193)); -- Sanctum of Domination
    AddC(tmp[1208], tmp[1210]);
    AddA(tmp[1210], a[15667]); -- Fate of Domination
    AddA(tmp[1210], a[15668]); -- Heroic: Fate of Domination
    AddA(tmp[1210], a[15669]); -- Mythic: Fate of Domination
    AddA(tmp[1210], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[1210], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[1210], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[1211] = cat:New(addon.GetInstanceInfoName(1195)); -- Sepulcher of the First Ones
    AddC(tmp[1208], tmp[1211]);
    AddA(tmp[1211], a[15681]); -- Fate of the Sepulcher
    AddA(tmp[1211], a[15682]); -- Heroic: Fate of the Sepulcher
    AddA(tmp[1211], a[15683]); -- Mythic: Fate of the Sepulcher
    AddA(tmp[1211], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[1211], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[1211], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[1174] = cat:New(addon.L["Miscellaneous"]); -- Miscellaneous
    AddC(tmp[884], tmp[1174]);
    AddA(tmp[1174], a[1636]); -- Competitor's Tabard
    AddA(tmp[1174], a[1637]); -- Spirit of Competition
    AddA(tmp[1174], a[2079]); -- Tabard of the Protector
    AddA(tmp[1174], a[2116]); -- Tabard of the Argent Dawn
    AddA(tmp[1174], a[11395]); -- Diablo's 20th Anniversary
    tmp[1226] = cat:New(addon.L["Excluded"]); -- Excluded
    AddC(tmp[884], tmp[1226]);
    tmp[1226].HasFlexibleData = true;
    tinsert(excludedCategories, tmp[1226]);
    tmp[1226].IsExcluded = true;
    tmp[955] = cat:New(addon.GetCategoryInfoTitle(95)); -- TAB - PvP
    tmp[955].TabName = "PvP";
    local pvp = tmp[955];
    tmp[1205] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[955], tmp[1205]);
    tmp[1205].AlwaysVisible = true;
    tmp[1205].IsSummary = true;
    tmp[1219] = cat:New(addon.L["Focused"]); -- Focused
    AddC(tmp[955], tmp[1219]);
    tmp[1219].HasFlexibleData = true;
    tinsert(focusedCategories, tmp[1219]);
    tmp[1219].IsFocused = true;
    tmp[1215] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[955], tmp[1215]);
    tmp[1215].HasFlexibleData = true;
    tinsert(currentZoneCategories, tmp[1215]);
    tmp[1215].IsCurrentZone = true;
    tmp[1222] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[955], tmp[1222]);
    tmp[1222].HasFlexibleData = true;
    tinsert(selectedZoneCategories, tmp[1222]);
    tmp[1222].IsSelectedZone = true;
    tmp[1162] = cat:New(addon.GetCategoryInfoTitle(95)); -- Player vs. Player
    AddC(tmp[955], tmp[1162]);
    AddA(tmp[1162], a[10561]); -- Honorable Medallion
    AddA(tmp[1162], a[238]); -- An Honorable Kill
    AddA(tmp[1162], a[513]); -- 100 Honorable Kills
    AddA(tmp[1162], a[515]); -- 500 Honorable Kills
    AddA(tmp[1162], a[516]); -- 1000 Honorable Kills
    AddA(tmp[1162], a[512]); -- 5000 Honorable Kills
    AddA(tmp[1162], a[509]); -- 10000 Honorable Kills
    AddA(tmp[1162], a[239]); -- 25000 Honorable Kills
    AddA(tmp[1162], a[869]); -- 50000 Honorable Kills
    AddA(tmp[1162], a[870]); -- 100000 Honorable Kills
    AddA(tmp[1162], a[5363]); -- 250000 Honorable Kills
    AddA(tmp[1162], a[1157]); -- Duel-icious
    AddA(tmp[1162], a[245]); -- That Takes Class
    AddA(tmp[1162], a[246]); -- Know Thy Enemy
    AddA(tmp[1162], a[1005]); -- Know Thy Enemy
    AddA(tmp[1162], a[247]); -- "Make Love, Not Warcraft"
    AddA(tmp[1162], a[727]); -- Call in the Cavalry
    AddA(tmp[1162], a[12567]); -- The Horde Slayer
    AddA(tmp[1162], a[12568]); -- The Alliance Slayer
    AddA(tmp[1162], a[3618]); -- Murkimus the Gladiator
    AddA(tmp[1162], a[8391]); -- Tournament Participation 2013
    AddA(tmp[1162], a[8392]); -- Tournament Glory 2013
    AddA(tmp[1162], a[5542]); -- 1000 Conquest Points
    AddA(tmp[1162], a[5541]); -- 5000 Conquest Points
    AddA(tmp[1162], a[5540]); -- "25,000 Conquest Points"
    AddA(tmp[1162], a[5539]); -- "50,000 Conquest Points"
    AddA(tmp[1162], a[701]); -- Freedom of the Alliance
    AddA(tmp[1162], a[700]); -- Freedom of the Horde
    tmp[1167] = cat:New(addon.GetCategoryInfoTitle(15266)); -- Honor
    AddC(tmp[955], tmp[1167]);
    AddA(tmp[1167], a[12893]); -- Honor Level 5
    AddA(tmp[1167], a[12894]); -- Honor Level 10
    AddA(tmp[1167], a[12895]); -- Honor Level 15
    AddA(tmp[1167], a[12900]); -- Honor Level 20
    AddA(tmp[1167], a[12901]); -- Honor Level 25
    AddA(tmp[1167], a[12902]); -- Honor Level 30
    AddA(tmp[1167], a[12903]); -- Honor Level 40
    AddA(tmp[1167], a[12904]); -- Honor Level 50
    AddA(tmp[1167], a[12905]); -- Honor Level 60
    AddA(tmp[1167], a[12906]); -- Honor Level 70
    AddA(tmp[1167], a[12907]); -- Honor Level 80
    AddA(tmp[1167], a[12908]); -- Honor Level 90
    AddA(tmp[1167], a[12909]); -- Honor Level 100
    AddA(tmp[1167], a[12910]); -- Honor Level 125
    AddA(tmp[1167], a[12911]); -- Honor Level 150
    AddA(tmp[1167], a[12912]); -- Honor Level 175
    AddA(tmp[1167], a[12913]); -- Honor Level 200
    AddA(tmp[1167], a[12914]); -- Honor Level 250
    AddA(tmp[1167], a[12915]); -- Honor Level 300
    AddA(tmp[1167], a[12916]); -- Honor Level 400
    AddA(tmp[1167], a[12917]); -- Honor Level 500
    AddA(tmp[1167], a[13701]); -- Battlefield Brawler
    AddA(tmp[1167], a[13702]); -- Battlefield Tactician
    AddA(tmp[1167], a[13703]); -- Battlefield Master
    tmp[1165] = cat:New(addon.GetCategoryInfoTitle(153)); -- Battlegrounds
    AddC(tmp[955], tmp[1165]);
    AddA(tmp[1165], a[229]); -- The Grim Reaper
    AddA(tmp[1165], a[907]); -- The Justicar
    AddA(tmp[1165], a[714]); -- The Conqueror
    AddA(tmp[1165], a[908]); -- Call to Arms!
    AddA(tmp[1165], a[909]); -- Call to Arms!
    AddA(tmp[1165], a[227]); -- Damage Control
    AddA(tmp[1165], a[231]); -- Wrecking Ball
    AddA(tmp[1165], a[230]); -- Battlemaster
    AddA(tmp[1165], a[1175]); -- Battlemaster
    AddA(tmp[1165], a[8052]); -- Khan
    AddA(tmp[1165], a[8055]); -- Khan
    AddA(tmp[1165], a[5268]); -- In Service of the Alliance
    AddA(tmp[1165], a[5269]); -- In Service of the Horde
    AddA(tmp[1165], a[5322]); -- In Service of the Alliance
    AddA(tmp[1165], a[5323]); -- In Service of the Horde
    AddA(tmp[1165], a[5327]); -- In Service of the Alliance
    AddA(tmp[1165], a[5324]); -- In Service of the Horde
    AddA(tmp[1165], a[5328]); -- Veteran of the Alliance
    AddA(tmp[1165], a[5325]); -- Veteran of the Horde
    AddA(tmp[1165], a[5823]); -- Veteran of the Alliance II
    AddA(tmp[1165], a[5824]); -- Veteran of the Horde II
    AddA(tmp[1165], a[5329]); -- Warbound Veteran of the Alliance
    AddA(tmp[1165], a[5326]); -- Warbringer of the Horde
    AddA(tmp[1165], a[5330]); -- Private
    AddA(tmp[1165], a[5345]); -- Scout
    AddA(tmp[1165], a[5331]); -- Corporal
    AddA(tmp[1165], a[5346]); -- Grunt
    AddA(tmp[1165], a[5332]); -- Sergeant
    AddA(tmp[1165], a[5347]); -- Sergeant
    AddA(tmp[1165], a[5333]); -- Master Sergeant
    AddA(tmp[1165], a[5348]); -- Senior Sergeant
    AddA(tmp[1165], a[5334]); -- Sergeant Major
    AddA(tmp[1165], a[5349]); -- First Sergeant
    AddA(tmp[1165], a[5335]); -- Knight
    AddA(tmp[1165], a[5350]); -- Stone Guard
    AddA(tmp[1165], a[5336]); -- Knight-Lieutenant
    AddA(tmp[1165], a[5351]); -- Blood Guard
    AddA(tmp[1165], a[5337]); -- Knight-Captain
    AddA(tmp[1165], a[5352]); -- Legionnaire
    AddA(tmp[1165], a[5359]); -- Knight-Champion
    AddA(tmp[1165], a[5338]); -- Centurion
    AddA(tmp[1165], a[5339]); -- Lieutenant Commander
    AddA(tmp[1165], a[5353]); -- Champion
    AddA(tmp[1165], a[5340]); -- Commander
    AddA(tmp[1165], a[5354]); -- Lieutenant General
    AddA(tmp[1165], a[5341]); -- Marshal
    AddA(tmp[1165], a[5355]); -- General
    AddA(tmp[1165], a[5357]); -- Field Marshal
    AddA(tmp[1165], a[5342]); -- Warlord
    AddA(tmp[1165], a[5343]); -- Grand Marshal
    AddA(tmp[1165], a[5356]); -- High Warlord
    AddA(tmp[1165], a[6942]); -- Hero of the Alliance
    AddA(tmp[1165], a[6941]); -- Hero of the Horde
    tmp[960] = cat:New(addon.GetCategoryInfoTitle(14801)); -- Alterac Valley
    AddC(tmp[1165], tmp[960]);
    AddA(tmp[960], a[218]); -- Alterac Valley Victory
    AddA(tmp[960], a[219]); -- Alterac Valley Veteran
    AddA(tmp[960], a[221]); -- Alterac Grave Robber
    AddA(tmp[960], a[222]); -- Tower Defense
    AddA(tmp[960], a[1151]); -- Loyal Defender
    AddA(tmp[960], a[224]); -- Loyal Defender
    AddA(tmp[960], a[225]); -- Everything Counts
    AddA(tmp[960], a[1164]); -- Everything Counts
    AddA(tmp[960], a[223]); -- The Sickly Gazelle
    AddA(tmp[960], a[220]); -- Stormpike Perfection
    AddA(tmp[960], a[873]); -- Frostwolf Perfection
    AddA(tmp[960], a[582]); -- Alterac Valley All-Star
    AddA(tmp[960], a[707]); -- Stormpike Battle Charger
    AddA(tmp[960], a[706]); -- Frostwolf Howler
    AddA(tmp[960], a[1166]); -- To the Looter Go the Spoils
    AddA(tmp[960], a[1167]); -- Master of Alterac Valley
    AddA(tmp[960], a[226]); -- The Alterac Blitz
    AddA(tmp[960], a[709]); -- Hero of the Stormpike Guard
    AddA(tmp[960], a[708]); -- Hero of the Frostwolf Clan
    tmp[956] = cat:New(addon.GetCategoryInfoTitle(14802)); -- Arathi Basin
    AddC(tmp[1165], tmp[956]);
    AddA(tmp[956], a[154]); -- Arathi Basin Victory
    AddA(tmp[956], a[155]); -- Arathi Basin Veteran
    AddA(tmp[956], a[165]); -- Arathi Basin Perfection
    AddA(tmp[956], a[158]); -- Me and the Cappin' Makin' it Happen
    AddA(tmp[956], a[73]); -- Disgracin' The Basin
    AddA(tmp[956], a[1153]); -- Overly Defensive
    AddA(tmp[956], a[157]); -- To The Rescue!
    AddA(tmp[956], a[161]); -- Resilient Victory
    AddA(tmp[956], a[156]); -- Territorial Dominance
    AddA(tmp[956], a[159]); -- Let's Get This Done
    AddA(tmp[956], a[162]); -- We Had It All Along *cough*
    AddA(tmp[956], a[583]); -- Arathi Basin All-Star
    AddA(tmp[956], a[584]); -- Arathi Basin Assassin
    AddA(tmp[956], a[1169]); -- Master of Arathi Basin
    AddA(tmp[956], a[711]); -- Knight of Arathor
    AddA(tmp[956], a[710]); -- The Defiler
    tmp[961] = cat:New(addon.GetCategoryInfoTitle(15414)); -- Ashran
    AddC(tmp[1165], tmp[961]);
    AddA(tmp[961], a[9102]); -- Ashran Victory
    AddA(tmp[961], a[9218]); -- "Grand Theft, 1st Degree"
    AddA(tmp[961], a[9219]); -- "Grand Theft, 2nd Degree"
    AddA(tmp[961], a[9220]); -- "Grand Theft, 3rd Degree"
    AddA(tmp[961], a[9256]); -- Rescue Operation
    AddA(tmp[961], a[9257]); -- Rescue Operation
    AddA(tmp[961], a[9106]); -- Just for Me
    AddA(tmp[961], a[9216]); -- High-value Targets
    AddA(tmp[961], a[9104]); -- Bounty Hunter
    AddA(tmp[961], a[9103]); -- Bounty Hunter
    AddA(tmp[961], a[9222]); -- Divide and Conquer
    AddA(tmp[961], a[9228]); -- Down Goes Van Rook
    AddA(tmp[961], a[9225]); -- Take Them Out
    AddA(tmp[961], a[9224]); -- Take Them Out
    AddA(tmp[961], a[9408]); -- Operation Counterattack
    AddA(tmp[961], a[9217]); -- Operation Counterattack
    AddA(tmp[961], a[9105]); -- Tour of Duty
    AddA(tmp[961], a[9714]); -- Thy Kingdom Come
    AddA(tmp[961], a[9715]); -- Thy Kingdom Come
    AddA(tmp[961], a[9474]); -- Wrynn's Vanguard
    AddA(tmp[961], a[9473]); -- Vol'jin's Spear
    AddA(tmp[961], a[9214]); -- Hero of Stormshield
    AddA(tmp[961], a[9215]); -- Hero of Warspear
    tmp[964] = cat:New(addon.GetCategoryInfoTitle(15073)); -- Battle for Gilneas
    AddC(tmp[1165], tmp[964]);
    AddA(tmp[964], a[5245]); -- Battle for Gilneas Victory
    AddA(tmp[964], a[5246]); -- Battle for Gilneas Veteran
    AddA(tmp[964], a[5247]); -- Battle for Gilneas Perfection
    AddA(tmp[964], a[5248]); -- Bustin' Caps to Make It Haps
    AddA(tmp[964], a[5249]); -- One Two Three You Don't Know About Me
    AddA(tmp[964], a[5250]); -- Out of the Fog
    AddA(tmp[964], a[5251]); -- Not Your Average PUG'er
    AddA(tmp[964], a[5252]); -- Don't Get Cocky Kid
    AddA(tmp[964], a[5253]); -- Full Coverage
    AddA(tmp[964], a[5254]); -- Newbs to Plowshares
    AddA(tmp[964], a[5255]); -- Jugger Not
    AddA(tmp[964], a[5256]); -- Battle for Gilneas All-Star
    AddA(tmp[964], a[5257]); -- Battle for Gilneas Assassin
    AddA(tmp[964], a[5262]); -- Double Rainbow
    AddA(tmp[964], a[5258]); -- Master of the Battle for Gilneas
    tmp[957] = cat:New(addon.GetCategoryInfoTitle(15218)); -- Deepwind Gorge
    AddC(tmp[1165], tmp[957]);
    AddA(tmp[957], a[8331]); -- Deepwind Gorge Victory
    AddA(tmp[957], a[8332]); -- Deepwind Gorge Veteran
    AddA(tmp[957], a[8333]); -- Deepwind Gorge Perfection
    AddA(tmp[957], a[14187]); -- Cruisin' for a Brewsin'
    AddA(tmp[957], a[14186]); -- Market Dominance
    AddA(tmp[957], a[14188]); -- Well Gorged
    AddA(tmp[957], a[14175]); -- Master of Deepwind Gorge
    AddA(tmp[957], a[8350]); -- Mine! Mine! Mine!
    AddA(tmp[957], a[8351]); -- Other People's Property
    AddA(tmp[957], a[8354]); -- Puddle Jumper
    AddA(tmp[957], a[8355]); -- Weighed Down
    AddA(tmp[957], a[8359]); -- Capping Spree
    AddA(tmp[957], a[8358]); -- Deepwind Gorge All-Star
    AddA(tmp[957], a[8360]); -- Master of Deepwind Gorge
    tmp[959] = cat:New(addon.GetCategoryInfoTitle(14803)); -- Eye of the Storm
    AddC(tmp[1165], tmp[959]);
    AddA(tmp[959], a[208]); -- Eye of the Storm Victory
    AddA(tmp[959], a[209]); -- Eye of the Storm Veteran
    AddA(tmp[959], a[783]); -- The Perfect Storm
    AddA(tmp[959], a[784]); -- Eye of the Storm Domination
    AddA(tmp[959], a[214]); -- Flurry
    AddA(tmp[959], a[213]); -- Stormtrooper
    AddA(tmp[959], a[212]); -- Storm Capper
    AddA(tmp[959], a[216]); -- Bound for Glory
    AddA(tmp[959], a[233]); -- Bloodthirsty Berserker
    AddA(tmp[959], a[1171]); -- Master of Eye of the Storm
    AddA(tmp[959], a[587]); -- Stormy Assassin
    AddA(tmp[959], a[1258]); -- Take a Chill Pill
    AddA(tmp[959], a[211]); -- Storm Glory
    tmp[962] = cat:New(addon.GetCategoryInfoTitle(15003)); -- Isle of Conquest
    AddC(tmp[1165], tmp[962]);
    AddA(tmp[962], a[3776]); -- Isle of Conquest Victory
    AddA(tmp[962], a[3777]); -- Isle of Conquest Veteran
    AddA(tmp[962], a[3851]); -- Mine
    AddA(tmp[962], a[4177]); -- Mine
    AddA(tmp[962], a[3847]); -- Four Car Garage
    AddA(tmp[962], a[3848]); -- A-bomb-inable
    AddA(tmp[962], a[3849]); -- A-bomb-ination
    AddA(tmp[962], a[3850]); -- Mowed Down
    AddA(tmp[962], a[3852]); -- Cut the Blue Wire... No the Red Wire!
    AddA(tmp[962], a[3853]); -- All Over the Isle
    AddA(tmp[962], a[3854]); -- Back Door Job
    AddA(tmp[962], a[3856]); -- Demolition Derby
    AddA(tmp[962], a[4256]); -- Demolition Derby
    AddA(tmp[962], a[3855]); -- Glaive Grave
    AddA(tmp[962], a[3857]); -- Master of Isle of Conquest
    AddA(tmp[962], a[3957]); -- Master of Isle of Conquest
    AddA(tmp[962], a[3845]); -- Isle of Conquest All-Star
    AddA(tmp[962], a[3846]); -- Resource Glut
    AddA(tmp[962], a[4176]); -- Resource Glut
    tmp[968] = cat:New(addon.GetCategoryInfoTitle(15292)); -- Seething Shore
    AddC(tmp[1165], tmp[968]);
    AddA(tmp[968], a[12409]); -- Seething Shore Victory
    AddA(tmp[968], a[12410]); -- Seething Shore Veteran
    AddA(tmp[968], a[12404]); -- Claim Jumper
    AddA(tmp[968], a[12405]); -- Death from Above
    AddA(tmp[968], a[12406]); -- A Good Start
    AddA(tmp[968], a[12407]); -- Seething Shore Perfection
    AddA(tmp[968], a[12408]); -- Seething Shore Domination
    AddA(tmp[968], a[12411]); -- Blood and Sand
    AddA(tmp[968], a[12412]); -- Master of Seething Shore
    tmp[966] = cat:New(addon.GetCategoryInfoTitle(15162)); -- Silvershard Mines
    AddC(tmp[1165], tmp[966]);
    AddA(tmp[966], a[6739]); -- Silvershard Mines Victory
    AddA(tmp[966], a[6883]); -- Silvershard Mines Veteran
    AddA(tmp[966], a[7039]); -- The Long Riders
    AddA(tmp[966], a[7049]); -- Mine Cart Courier
    AddA(tmp[966], a[7057]); -- End of the Line
    AddA(tmp[966], a[7062]); -- Mine Mine Mine!
    AddA(tmp[966], a[7099]); -- Five for Five
    AddA(tmp[966], a[7100]); -- My Diamonds and Your Rust
    AddA(tmp[966], a[7102]); -- Escort Service
    AddA(tmp[966], a[7103]); -- Greed is Good
    AddA(tmp[966], a[7106]); -- Master of Silvershard Mines
    tmp[973] = cat:New(addon.L["Strand of the Ancients"]); -- Strand of the Ancients
    AddC(tmp[1165], tmp[973]);
    AddA(tmp[973], a[1308]); -- Strand of the Ancients Victory
    AddA(tmp[973], a[1309]); -- Strand of the Ancients Veteran
    AddA(tmp[973], a[1310]); -- Storm the Beach
    AddA(tmp[973], a[1765]); -- Steady Hands
    AddA(tmp[973], a[1761]); -- The Dapper Sapper
    AddA(tmp[973], a[2193]); -- Explosives Expert
    AddA(tmp[973], a[1762]); -- Not Even a Scratch
    AddA(tmp[973], a[2192]); -- Not Even a Scratch
    AddA(tmp[973], a[1763]); -- Artillery Veteran
    AddA(tmp[973], a[2189]); -- Artillery Expert
    AddA(tmp[973], a[1764]); -- Drop It!
    AddA(tmp[973], a[2190]); -- Drop It Now!
    AddA(tmp[973], a[1766]); -- Ancient Protector
    AddA(tmp[973], a[2191]); -- Ancient Courtyard Protector
    AddA(tmp[973], a[1757]); -- Defense of the Ancients
    AddA(tmp[973], a[2200]); -- Defense of the Ancients
    AddA(tmp[973], a[2194]); -- Master of Strand of the Ancients
    tmp[967] = cat:New(addon.GetCategoryInfoTitle(15163)); -- Temple of Kotmogu
    AddC(tmp[1165], tmp[967]);
    AddA(tmp[967], a[6740]); -- Temple of Kotmogu Victory
    AddA(tmp[967], a[6882]); -- Temple of Kotmogu Veteran
    AddA(tmp[967], a[6947]); -- Four Square
    AddA(tmp[967], a[6950]); -- Powerball
    AddA(tmp[967], a[6970]); -- Blackout
    AddA(tmp[967], a[6973]); -- Can't Stop Won't Stop
    AddA(tmp[967], a[6971]); -- I've Got the Power
    AddA(tmp[967], a[6972]); -- What is Best in Life?
    AddA(tmp[967], a[6980]); -- Temple of Kotmogu All-Star
    AddA(tmp[967], a[6981]); -- Master of Temple of Kotmogu
    tmp[965] = cat:New(addon.GetCategoryInfoTitle(15074)); -- Twin Peaks
    AddC(tmp[1165], tmp[965]);
    AddA(tmp[965], a[5208]); -- Twin Peaking
    AddA(tmp[965], a[5209]); -- Twin Peaks Veteran
    AddA(tmp[965], a[5210]); -- Two-Timer
    AddA(tmp[965], a[5211]); -- Top Defender
    AddA(tmp[965], a[5213]); -- Soaring Spirits
    AddA(tmp[965], a[5214]); -- Soaring Spirits
    AddA(tmp[965], a[5215]); -- Twin Peaks Perfection
    AddA(tmp[965], a[5216]); -- Peak Speed
    AddA(tmp[965], a[5226]); -- Cloud Nine
    AddA(tmp[965], a[5227]); -- Cloud Nine
    AddA(tmp[965], a[5229]); -- Drag a Maw
    AddA(tmp[965], a[5228]); -- Wild Hammering
    AddA(tmp[965], a[5219]); -- I'm in the White Lodge
    AddA(tmp[965], a[5220]); -- I'm in the Black Lodge
    AddA(tmp[965], a[5221]); -- "Fire, Walk With Me"
    AddA(tmp[965], a[5222]); -- "Fire, Walk With Me"
    AddA(tmp[965], a[5230]); -- Twin Peaks Mountaineer
    AddA(tmp[965], a[5231]); -- Double Jeopardy
    AddA(tmp[965], a[5552]); -- Double Jeopardy
    AddA(tmp[965], a[5223]); -- Master of Twin Peaks
    tmp[958] = cat:New(addon.GetCategoryInfoTitle(14804)); -- Warsong Gulch
    AddC(tmp[1165], tmp[958]);
    AddA(tmp[958], a[166]); -- Warsong Gulch Victory
    AddA(tmp[958], a[167]); -- Warsong Gulch Veteran
    AddA(tmp[958], a[199]); -- Capture the Flag
    AddA(tmp[958], a[200]); -- Persistent Defender
    AddA(tmp[958], a[872]); -- Frenzied Defender
    AddA(tmp[958], a[168]); -- Warsong Gulch Perfection
    AddA(tmp[958], a[201]); -- Warsong Expedience
    AddA(tmp[958], a[204]); -- Ironman
    AddA(tmp[958], a[203]); -- Not In My House
    AddA(tmp[958], a[1251]); -- Not In My House
    AddA(tmp[958], a[202]); -- Quick Cap
    AddA(tmp[958], a[1502]); -- Quick Cap
    AddA(tmp[958], a[206]); -- Supreme Defender
    AddA(tmp[958], a[1252]); -- Supreme Defender
    AddA(tmp[958], a[207]); -- Save the Day
    AddA(tmp[958], a[1172]); -- Master of Warsong Gulch
    AddA(tmp[958], a[1259]); -- Not So Fast
    AddA(tmp[958], a[713]); -- Silverwing Sentinel
    AddA(tmp[958], a[712]); -- Warsong Outrider
    tmp[963] = cat:New(addon.GetCategoryInfoTitle(14901)); -- Wintergrasp
    AddC(tmp[1165], tmp[963]);
    AddA(tmp[963], a[1717]); -- Wintergrasp Victory
    AddA(tmp[963], a[1718]); -- Wintergrasp Veteran
    AddA(tmp[963], a[1755]); -- Within Our Grasp
    AddA(tmp[963], a[2199]); -- Wintergrasp Ranger
    AddA(tmp[963], a[2080]); -- Black War Mammoth
    AddA(tmp[963], a[1737]); -- Destruction Derby
    AddA(tmp[963], a[2476]); -- Destruction Derby
    AddA(tmp[963], a[1723]); -- Vehicular Gnomeslaughter
    AddA(tmp[963], a[1727]); -- Leaning Tower
    AddA(tmp[963], a[1751]); -- Didn't Stand a Chance
    AddA(tmp[963], a[1752]); -- Master of Wintergrasp
    tmp[1032] = cat:New(addon.L["Southshore vs. Tarren Mill"] .. " (" .. addon.GetCategoryInfoTitle(15234) .. ")"); -- Southshore vs. Tarren Mill
    AddC(tmp[1165], tmp[1032]);
    AddA(tmp[1032], a[9729]); -- Victory in Hillsbrad
    AddA(tmp[1032], a[9566]); -- Victory in Hillsbrad
    tmp[1166] = cat:New(addon.GetCategoryInfoTitle(165)); -- Arena
    AddC(tmp[955], tmp[1166]);
    AddA(tmp[1166], a[397]); -- Step Into The Arena
    AddA(tmp[1166], a[398]); -- Mercilessly Dedicated
    AddA(tmp[1166], a[875]); -- Vengefully Dedicated
    AddA(tmp[1166], a[876]); -- Brutally Dedicated
    AddA(tmp[1166], a[699]); -- World Wide Winner
    AddA(tmp[1166], a[399]); -- Just the Two of Us: 1550
    AddA(tmp[1166], a[400]); -- Just the Two of Us: 1750
    AddA(tmp[1166], a[401]); -- Just the Two of Us: 2000
    AddA(tmp[1166], a[1159]); -- Just the Two of Us: 2200
    AddA(tmp[1166], a[402]); -- Three's Company: 1550
    AddA(tmp[1166], a[403]); -- Three's Company: 1750
    AddA(tmp[1166], a[405]); -- Three's Company: 2000
    AddA(tmp[1166], a[1160]); -- Three's Company: 2200
    AddA(tmp[1166], a[5266]); -- Three's Company: 2400
    AddA(tmp[1166], a[5267]); -- Three's Company: 2700
    AddA(tmp[1166], a[406]); -- High Five: 1550
    AddA(tmp[1166], a[407]); -- High Five: 1750
    AddA(tmp[1166], a[404]); -- High Five: 2000
    AddA(tmp[1166], a[1161]); -- High Five: 2200
    AddA(tmp[1166], a[408]); -- Hot Streak
    AddA(tmp[1166], a[1162]); -- Hotter Streak
    AddA(tmp[1166], a[2090]); -- Challenger
    AddA(tmp[1166], a[2093]); -- Rival
    AddA(tmp[1166], a[2092]); -- Duelist
    AddA(tmp[1166], a[2091]); -- Gladiator
    AddA(tmp[1166], a[15539]); -- Solo Aspirations
    AddA(tmp[1166], a[15511]); -- Solely Motivated
    AddA(tmp[1166], a[15540]); -- Steadfast Soloist
    AddA(tmp[1166], a[15541]); -- Sole Survivor
    AddA(tmp[1166], a[15543]); -- Successful Solos
    AddA(tmp[1166], a[15544]); -- Supreme Soloist
    AddA(tmp[1166], a[409]); -- Last Man Standing
    AddA(tmp[1166], a[1174]); -- The Arena Master
    tmp[1131] = cat:New(addon.GetCategoryInfoTitle(14864)); -- Classic
    AddC(tmp[955], tmp[1131]);
    AddA(tmp[1131], a[442]); -- Private
    AddA(tmp[1131], a[454]); -- Scout
    AddA(tmp[1131], a[470]); -- Corporal
    AddA(tmp[1131], a[468]); -- Grunt
    AddA(tmp[1131], a[471]); -- Sergeant
    AddA(tmp[1131], a[453]); -- Sergeant
    AddA(tmp[1131], a[441]); -- Master Sergeant
    AddA(tmp[1131], a[450]); -- Senior Sergeant
    AddA(tmp[1131], a[440]); -- Sergeant Major
    AddA(tmp[1131], a[452]); -- First Sergeant
    AddA(tmp[1131], a[439]); -- Knight
    AddA(tmp[1131], a[451]); -- Stone Guard
    AddA(tmp[1131], a[472]); -- Knight-Lieutenant
    AddA(tmp[1131], a[449]); -- Blood Guard
    AddA(tmp[1131], a[438]); -- Knight-Captain
    AddA(tmp[1131], a[469]); -- Legionnaire
    AddA(tmp[1131], a[437]); -- Knight-Champion
    AddA(tmp[1131], a[448]); -- Centurion
    AddA(tmp[1131], a[436]); -- Lieutenant Commander
    AddA(tmp[1131], a[447]); -- Champion
    AddA(tmp[1131], a[435]); -- Commander
    AddA(tmp[1131], a[444]); -- Lieutenant General
    AddA(tmp[1131], a[473]); -- Marshal
    AddA(tmp[1131], a[446]); -- General
    AddA(tmp[1131], a[434]); -- Field Marshal
    AddA(tmp[1131], a[445]); -- Warlord
    AddA(tmp[1131], a[433]); -- Grand Marshal
    AddA(tmp[1131], a[443]); -- High Warlord
    tmp[1199] = cat:New(addon.GetCategoryInfoTitle(14865)); -- The Burning Crusade
    AddC(tmp[955], tmp[1199]);
    AddA(tmp[1199], a[418]); -- Merciless Gladiator
    AddA(tmp[1199], a[419]); -- Vengeful Gladiator
    AddA(tmp[1199], a[420]); -- Brutal Gladiator
    tmp[1200] = cat:New(addon.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    AddC(tmp[955], tmp[1200]);
    AddA(tmp[1200], a[3336]); -- Deadly Gladiator
    AddA(tmp[1200], a[3436]); -- Furious Gladiator
    AddA(tmp[1200], a[3758]); -- Relentless Gladiator
    AddA(tmp[1200], a[4599]); -- Wrathful Gladiator
    tmp[1227] = cat:New(addon.L["Excluded"]); -- Excluded
    AddC(tmp[955], tmp[1227]);
    tmp[1227].HasFlexibleData = true;
    tinsert(excludedCategories, tmp[1227]);
    tmp[1227].IsExcluded = true;
    tmp[971] = cat:New(addon.L["Specials"]); -- TAB - Specials
    tmp[971].TabName = "Specials";
    local specials = tmp[971];
    tmp[1204] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[971], tmp[1204]);
    tmp[1204].AlwaysVisible = true;
    tmp[1204].IsSummary = true;
    tmp[949] = cat:New(addon.L["Focused"]); -- Focused
    AddC(tmp[971], tmp[949]);
    tmp[949].HasFlexibleData = true;
    tinsert(focusedCategories, tmp[949]);
    tmp[949].IsFocused = true;
    tmp[433] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[971], tmp[433]);
    tmp[433].HasFlexibleData = true;
    tinsert(currentZoneCategories, tmp[433]);
    tmp[433].IsCurrentZone = true;
    tmp[850] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[971], tmp[850]);
    tmp[850].HasFlexibleData = true;
    tinsert(selectedZoneCategories, tmp[850]);
    tmp[850].IsSelectedZone = true;
    tmp[972] = cat:New(addon.L["Bur's Mount Collection"]); -- Bur's Mount Collection
    AddC(tmp[971], tmp[972]);
    AddA(tmp[972], a[3356]); -- Winterspring Frostsaber
    AddA(tmp[972], a[3357]); -- Venomhide Ravasaur
    AddA(tmp[972], a[12866]); -- 100 Exalted Reputations
    tmp[976] = cat:New(addon.GetCategoryInfoTitle(15246)); -- Collections
    AddC(tmp[972], tmp[976]);
    AddA(tmp[976], a[2141]); -- Stable Keeper
    AddA(tmp[976], a[2142]); -- Filling Up The Barn
    AddA(tmp[976], a[2143]); -- Leading the Cavalry
    AddA(tmp[976], a[2536]); -- Mountain o' Mounts
    AddA(tmp[976], a[2537]); -- Mountain o' Mounts
    AddA(tmp[976], a[7860]); -- We're Going to Need More Saddles
    AddA(tmp[976], a[7862]); -- We're Going to Need More Saddles
    AddA(tmp[976], a[8304]); -- Mount Parade
    AddA(tmp[976], a[8302]); -- Mount Parade
    AddA(tmp[976], a[9598]); -- Mountacular
    AddA(tmp[976], a[9599]); -- Mountacular
    AddA(tmp[976], a[10356]); -- Lord of the Reins
    AddA(tmp[976], a[10355]); -- Lord of the Reins
    AddA(tmp[976], a[12932]); -- No Stable Big Enough
    AddA(tmp[976], a[12931]); -- No Stable Big Enough
    AddA(tmp[976], a[12933]); -- A Horde of Hoofbeats
    AddA(tmp[976], a[12934]); -- A Horde of Hoofbeats
    AddA(tmp[976], a[9713]); -- Awake the Drakes
    tmp[985] = cat:New(addon.L["Vendor"]); -- Vendor
    AddC(tmp[972], tmp[985]);
    AddA(tmp[985], a[2076]); -- Armored Brown Bear
    AddA(tmp[985], a[2077]); -- Wooly Mammoth
    AddA(tmp[985], a[2078]); -- Traveler's Tundra Mammoth
    AddA(tmp[985], a[4888]); -- One Hump or Two?
    AddA(tmp[985], a[7386]); -- Grand Expedition Yak
    AddA(tmp[985], a[8092]); -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    AddA(tmp[985], a[9909]); -- Heirloom Hoarder
    AddA(tmp[985], a[14183]); -- Conspicuous Consumption
    tmp[986] = cat:New(addon.GetCategoryInfoTitle(169)); -- Professions
    AddC(tmp[972], tmp[986]);
    AddA(tmp[986], a[2097]); -- Get to the Choppa!
    AddA(tmp[986], a[5749]); -- Vial of the Sands
    tmp[987] = cat:New(addon.L["Events"]); -- Events
    AddC(tmp[972], tmp[987]);
    AddA(tmp[987], a[416]); -- Scarab Lord
    AddA(tmp[987], a[980]); -- The Horseman's Reins
    AddA(tmp[987], a[3496]); -- A Brew-FAST Mount
    AddA(tmp[987], a[4627]); -- X-45 Heartbreaker
    AddA(tmp[987], a[2144]); -- "What a Long, Strange Trip It's Been"
    AddA(tmp[987], a[9496]); -- Warlord's Deathwheel
    AddA(tmp[987], a[9550]); -- "Boldly, You Sought the Power of Ragnaros"
    AddA(tmp[987], a[13931]); -- "Memories of Fel, Frost and Fire"
    tmp[989] = cat:New(addon.L["Achievements"]); -- Achievements
    AddC(tmp[972], tmp[989]);
    AddA(tmp[989], a[879]); -- Old School Ride
    AddA(tmp[989], a[5767]); -- Scourer of the Eternal Sands
    AddA(tmp[989], a[11066]); -- Underbelly Tycoon
    AddA(tmp[989], a[13517]); -- Two Sides to Every Tale
    AddA(tmp[989], a[13638]); -- Undersea Usurper
    AddA(tmp[989], a[13994]); -- Through the Depths of Visions
    AddA(tmp[989], a[14751]); -- The Gang's All Here
    AddA(tmp[989], a[14752]); -- Things To Do When You're Dead
    AddA(tmp[989], a[14570]); -- Twisting Corridors: Layer 8
    AddA(tmp[989], a[15254]); -- The Jailer's Gauntlet: Layer 4
    AddA(tmp[989], a[15089]); -- Flawless Master (Layer 12)
    AddA(tmp[989], a[15322]); -- Flawless Master (Layer 16)
    AddA(tmp[989], a[15064]); -- Breaking the Chains
    AddA(tmp[989], a[15402]); -- Cyphers of the First Ones
    AddA(tmp[989], a[15336]); -- From A to Zereth
    tmp[979] = cat:New(addon.GetCategoryInfoTitle(15272)); -- Dungeons
    AddC(tmp[972], tmp[979]);
    AddA(tmp[979], a[6375]); -- Challenge Conqueror: Silver
    AddA(tmp[979], a[8898]); -- Challenge Warlord: Silver
    AddA(tmp[979], a[14145]); -- Battle for Azeroth Keystone Master: Season Four
    AddA(tmp[979], a[14532]); -- Shadowlands Keystone Master: Season One
    AddA(tmp[979], a[15078]); -- Shadowlands Keystone Master: Season Two
    AddA(tmp[979], a[15499]); -- Shadowlands Keystone Master: Season Three
    AddA(tmp[979], a[15178]); -- Fake It 'Til You Make It
    tmp[983] = cat:New(addon.L["Drops"], true); -- Drops
    AddC(tmp[979], tmp[983]);
    AddA(tmp[983], a[729]); -- Deathcharger's Reins
    AddA(tmp[983], a[883]); -- Reins of the Raven Lord
    AddA(tmp[983], a[884]); -- Swift White Hawkstrider
    tmp[980] = cat:New(addon.L["Glory"], true); -- Glory
    AddC(tmp[979], tmp[980]);
    AddA(tmp[980], a[2136]); -- Glory of the Hero
    AddA(tmp[980], a[4845]); -- Glory of the Cataclysm Hero
    AddA(tmp[980], a[6927]); -- Glory of the Pandaria Hero
    AddA(tmp[980], a[9396]); -- Glory of the Draenor Hero
    AddA(tmp[980], a[11163]); -- Glory of the Legion Hero
    AddA(tmp[980], a[12812]); -- Glory of the Wartorn Hero
    AddA(tmp[980], a[14322]); -- Glory of the Shadowlands Hero
    tmp[982] = cat:New(addon.GetCategoryInfoTitle(15271)); -- Raids
    AddC(tmp[972], tmp[982]);
    AddA(tmp[982], a[8398]); -- Ahead of the Curve: Garrosh Hellscream (10 player)
    AddA(tmp[982], a[8399]); -- Ahead of the Curve: Garrosh Hellscream (25 player)
    AddA(tmp[982], a[15684]); -- Fates of the Shadowlands Raids
    tmp[984] = cat:New(addon.L["Drops"], true); -- Drops
    AddC(tmp[982], tmp[984]);
    AddA(tmp[984], a[880]); -- Swift Zulian Tiger
    AddA(tmp[984], a[881]); -- Swift Razzashi Raptor
    AddA(tmp[984], a[424]); -- Why? Because It's Red
    AddA(tmp[984], a[882]); -- Fiery Warhorse's Reins
    AddA(tmp[984], a[885]); -- Ashes of Al'ar
    AddA(tmp[984], a[430]); -- Amani War Bear
    AddA(tmp[984], a[2081]); -- Grand Black War Mammoth
    AddA(tmp[984], a[4626]); -- And I'll Form the Head!
    AddA(tmp[984], a[4625]); -- Invincible's Reins
    tmp[981] = cat:New(addon.L["Glory"], true); -- Glory
    AddC(tmp[982], tmp[981]);
    AddA(tmp[981], a[12401]); -- Glory of the Ulduar Raider
    AddA(tmp[981], a[2957]); -- Glory of the Ulduar Raider (10 player)
    AddA(tmp[981], a[2958]); -- Glory of the Ulduar Raider (25 player)
    AddA(tmp[981], a[4602]); -- Glory of the Icecrown Raider (10 player)
    AddA(tmp[981], a[4603]); -- Glory of the Icecrown Raider (25 player)
    AddA(tmp[981], a[4853]); -- Glory of the Cataclysm Raider
    AddA(tmp[981], a[5828]); -- Glory of the Firelands Raider
    AddA(tmp[981], a[6169]); -- Glory of the Dragon Soul Raider
    AddA(tmp[981], a[6932]); -- Glory of the Pandaria Raider
    AddA(tmp[981], a[8124]); -- Glory of the Thundering Raider
    AddA(tmp[981], a[8454]); -- Glory of the Orgrimmar Raider
    AddA(tmp[981], a[8985]); -- Glory of the Draenor Raider
    AddA(tmp[981], a[10149]); -- Glory of the Hellfire Raider
    AddA(tmp[981], a[11180]); -- Glory of the Legion Raider
    AddA(tmp[981], a[11987]); -- Glory of the Argus Raider
    AddA(tmp[981], a[12806]); -- Glory of the Uldir Raider
    AddA(tmp[981], a[13315]); -- Glory of the Dazar'alor Raider
    AddA(tmp[981], a[13687]); -- Glory of the Eternal Raider
    AddA(tmp[981], a[14146]); -- Glory of the Ny'alotha Raider
    AddA(tmp[981], a[14355]); -- Glory of the Nathria Raider
    AddA(tmp[981], a[15130]); -- Glory of the Dominant Raider
    AddA(tmp[981], a[15491]); -- Glory of the Sepulcher Raider
    tmp[977] = cat:New(addon.GetCategoryInfoTitle(95)); -- PvP
    AddC(tmp[972], tmp[977]);
    AddA(tmp[977], a[12895]); -- Honor Level 15
    AddA(tmp[977], a[12903]); -- Honor Level 40
    AddA(tmp[977], a[12906]); -- Honor Level 70
    AddA(tmp[977], a[12910]); -- Honor Level 125
    AddA(tmp[977], a[12911]); -- Honor Level 150
    AddA(tmp[977], a[12914]); -- Honor Level 250
    AddA(tmp[977], a[12917]); -- Honor Level 500
    AddA(tmp[977], a[9238]); -- Primal Combatant
    AddA(tmp[977], a[9236]); -- Primal Combatant
    AddA(tmp[977], a[11474]); -- "Free For All, More For Me"
    tmp[978] = cat:New((select(2, addon.GetAchievementInfo(2091))), true); -- Gladiator
    AddC(tmp[977], tmp[978]);
    AddA(tmp[978], a[886]); -- Swift Nether Drake
    AddA(tmp[978], a[887]); -- Merciless Nether Drake
    AddA(tmp[978], a[888]); -- Vengeful Nether Drake
    AddA(tmp[978], a[2316]); -- Brutal Nether Drake
    AddA(tmp[978], a[3096]); -- Deadly Gladiator's Frost Wyrm
    AddA(tmp[978], a[3756]); -- Furious Gladiator's Frost Wyrm
    AddA(tmp[978], a[3757]); -- Relentless Gladiator's Frost Wyrm
    AddA(tmp[978], a[4600]); -- Wrathful Gladiator's Frost Wyrm
    AddA(tmp[978], a[6003]); -- Vicious Gladiator's Twilight Drake
    AddA(tmp[978], a[6322]); -- Ruthless Gladiator's Twilight Drake
    AddA(tmp[978], a[6741]); -- Cataclysmic Gladiator's Twilight Drake
    AddA(tmp[978], a[8216]); -- Malevolent Gladiator's Cloud Serpent
    AddA(tmp[978], a[8678]); -- Tyrannical Gladiator's Cloud Serpent
    AddA(tmp[978], a[8705]); -- Grievous Gladiator's Cloud Serpent
    AddA(tmp[978], a[8707]); -- Prideful Gladiator's Cloud Serpent
    AddA(tmp[978], a[9229]); -- Primal Gladiator's Felblood Gronnling
    AddA(tmp[978], a[10137]); -- Wild Gladiator's Felblood Gronnling
    AddA(tmp[978], a[10146]); -- Warmongering Gladiator's Felblood Gronnling
    AddA(tmp[978], a[10999]); -- Vindictive Gladiator's Storm Dragon
    AddA(tmp[978], a[11000]); -- Fearless Gladiator's Storm Dragon
    AddA(tmp[978], a[11001]); -- Cruel Gladiator's Storm Dragon
    AddA(tmp[978], a[11002]); -- Ferocious Gladiator's Storm Dragon
    AddA(tmp[978], a[13450]); -- Fierce Gladiator's Storm Dragon
    AddA(tmp[978], a[12139]); -- Dominant Gladiator's Storm Dragon
    AddA(tmp[978], a[12140]); -- Demonic Gladiator's Storm Dragon
    AddA(tmp[978], a[12961]); -- Gladiator: Battle for Azeroth Season 1
    AddA(tmp[978], a[13093]); -- Dread Gladiator's Proto-Drake
    AddA(tmp[978], a[13212]); -- Gladiator: Battle for Azeroth Season 2
    AddA(tmp[978], a[13202]); -- Sinister Gladiator's Proto-Drake
    AddA(tmp[978], a[13647]); -- Gladiator: Battle for Azeroth Season 3
    AddA(tmp[978], a[13632]); -- Notorious Gladiator's Proto-Drake
    AddA(tmp[978], a[13967]); -- Gladiator: Battle for Azeroth Season 4
    AddA(tmp[978], a[13958]); -- Corrupted Gladiator's Proto-Drake
    AddA(tmp[978], a[14689]); -- Gladiator: Shadowlands Season 1
    AddA(tmp[978], a[14816]); -- Sinful Gladiator's Soul Eater
    AddA(tmp[978], a[14972]); -- Gladiator: Shadowlands Season 2
    AddA(tmp[978], a[14999]); -- Unchained Gladiator's Soul Eater
    AddA(tmp[978], a[15352]); -- Gladiator: Shadowlands Season 3
    AddA(tmp[978], a[15384]); -- Cosmic Gladiator's Soul Eater
    AddA(tmp[978], a[15605]); -- Gladiator: Shadowlands Season 4
    AddA(tmp[978], a[15612]); -- Eternal Gladiator's Soul Eater
    tmp[988] = cat:New(addon.L["Recruit-a-Friend"] .. " (" .. addon.GetCategoryInfoTitle(15234) .. ")"); -- Recruit-a-Friend
    AddC(tmp[972], tmp[988]);
    AddA(tmp[988], a[1436]); -- Friends In High Places
    AddA(tmp[988], a[4832]); -- Friends In Even Higher Places
    AddA(tmp[988], a[8213]); -- Friends In Places Higher Yet
    AddA(tmp[988], a[8794]); -- Friends In Places Even Higher Than That
    AddA(tmp[988], a[9925]); -- Friends In Places Yet Even Higher Than That
    tmp[1043] = cat:New(addon.L["The Entitled"] .. " " .. (UnitName("player"))); -- The Entitled Player
    AddC(tmp[971], tmp[1043]);
    tmp[1045] = cat:New(addon.GetCategoryInfoTitle(14864)); -- Classic
    AddC(tmp[1043], tmp[1045]);
    AddA(tmp[1045], a[15579]); -- Return to Lordaeron
    tmp[1065] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1045], tmp[1065]);
    AddA(tmp[1065], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1065], a[762]); -- Ambassador of the Horde
    AddA(tmp[1065], a[871]); -- "Avast Ye, Admiral!"
    AddA(tmp[1065], a[2336]); -- Insane in the Membrane
    tmp[1047] = cat:New(addon.GetCategoryInfoTitle(14866)); -- Wrath of the Lich King
    AddC(tmp[1043], tmp[1047]);
    tmp[1054] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1047], tmp[1054]);
    AddA(tmp[1054], a[942]); -- The Diplomat
    AddA(tmp[1054], a[943]); -- The Diplomat
    AddA(tmp[1054], a[4598]); -- The Ashen Verdict
    AddA(tmp[1054], a[953]); -- Guardian of Cenarius
    AddA(tmp[1054], a[945]); -- The Argent Champion
    AddA(tmp[1054], a[2764]); -- Exalted Champion of Stormwind
    AddA(tmp[1054], a[2765]); -- Exalted Champion of Orgrimmar
    AddA(tmp[1054], a[2763]); -- Exalted Champion of Ironforge
    AddA(tmp[1054], a[2769]); -- Exalted Champion of the Undercity
    AddA(tmp[1054], a[2760]); -- Exalted Champion of Darnassus
    AddA(tmp[1054], a[2768]); -- Exalted Champion of Thunder Bluff
    AddA(tmp[1054], a[2761]); -- Exalted Champion of the Exodar
    AddA(tmp[1054], a[2767]); -- Exalted Champion of Silvermoon City
    AddA(tmp[1054], a[2762]); -- Exalted Champion of Gnomeregan
    AddA(tmp[1054], a[2766]); -- Exalted Champion of Sen'jin
    AddA(tmp[1054], a[2817]); -- Exalted Argent Champion of the Alliance
    AddA(tmp[1054], a[2816]); -- Exalted Argent Champion of the Horde
    tmp[1057] = cat:New(addon.GetCategoryInfoTitle(15272), true); -- Dungeons
    AddC(tmp[1047], tmp[1057]);
    AddA(tmp[1057], a[9058]); -- Leeeeeeeeeeeeeroy...?
    tmp[1056] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1047], tmp[1056]);
    AddA(tmp[1056], a[2051]); -- The Twilight Zone (10 player)
    AddA(tmp[1056], a[2054]); -- The Twilight Zone (25 player)
    AddA(tmp[1056], a[1658]); -- Champion of the Frozen Wastes
    AddA(tmp[1056], a[3316]); -- Herald of the Titans
    AddA(tmp[1056], a[3036]); -- Observed (10 player)
    AddA(tmp[1056], a[3037]); -- Observed (25 player)
    AddA(tmp[1056], a[4583]); -- Bane of the Fallen King
    AddA(tmp[1056], a[4597]); -- The Frozen Throne (25 player)
    AddA(tmp[1056], a[4584]); -- The Light of Dawn
    tmp[1048] = cat:New(addon.GetCategoryInfoTitle(15072)); -- Cataclysm
    AddC(tmp[1043], tmp[1048]);
    AddA(tmp[1048], a[5767]); -- Scourer of the Eternal Sands
    tmp[1058] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1048], tmp[1058]);
    AddA(tmp[1058], a[5879]); -- Veteran of the Molten Front
    tmp[1059] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1048], tmp[1059]);
    AddA(tmp[1059], a[5827]); -- Avengers of Hyjal
    tmp[1060] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1048], tmp[1060]);
    AddA(tmp[1060], a[5116]); -- Heroic: Nefarian
    AddA(tmp[1060], a[5121]); -- Heroic: Sinestra
    AddA(tmp[1060], a[5123]); -- Heroic: Al'Akir
    AddA(tmp[1060], a[5506]); -- Defender of a Shattered World
    AddA(tmp[1060], a[5803]); -- Heroic: Ragnaros
    AddA(tmp[1060], a[6177]); -- Destroyer's End
    AddA(tmp[1060], a[6116]); -- Heroic: Madness of Deathwing
    tmp[1049] = cat:New(addon.GetCategoryInfoTitle(15164)); -- Mists of Pandaria
    AddC(tmp[1043], tmp[1049]);
    tmp[1061] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1049], tmp[1061]);
    AddA(tmp[1061], a[7284]); -- Is Another Man's Treasure
    AddA(tmp[1061], a[7479]); -- The Shado-Master
    AddA(tmp[1061], a[8121]); -- Stormbreaker
    tmp[1062] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1049], tmp[1062]);
    AddA(tmp[1062], a[6544]); -- The Tillers
    AddA(tmp[1062], a[8023]); -- Wakener
    tmp[1063] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1049], tmp[1063]);
    AddA(tmp[1063], a[6926]); -- Tranquil Master
    AddA(tmp[1063], a[6724]); -- Heroic: Will of the Emperor
    AddA(tmp[1063], a[6734]); -- Heroic: Sha of Fear
    AddA(tmp[1063], a[8067]); -- Heroic: Lei Shen
    AddA(tmp[1063], a[8679]); -- Conqueror of Orgrimmar
    AddA(tmp[1063], a[8680]); -- Liberator of Orgrimmar
    AddA(tmp[1063], a[8482]); -- Mythic: Garrosh Hellscream
    tmp[1064] = cat:New(addon.L["Scenarios"], true); -- Scenarios
    AddC(tmp[1049], tmp[1064]);
    AddA(tmp[1064], a[6874]); -- Scenaturday
    AddA(tmp[1064], a[7509]); -- Scenaturday
    AddA(tmp[1064], a[9577]); -- Proving Yourself: Endless Damage (Wave 30)
    AddA(tmp[1064], a[9583]); -- Proving Yourself: Endless Tank (Wave 30)
    AddA(tmp[1064], a[9589]); -- Proving Yourself: Endless Healer (Wave 30)
    tmp[1050] = cat:New(addon.GetCategoryInfoTitle(15233)); -- Warlords of Dreanor
    AddC(tmp[1043], tmp[1050]);
    tmp[1066] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1050], tmp[1066]);
    AddA(tmp[1066], a[10072]); -- Rumble in the Jungle
    AddA(tmp[1066], a[10265]); -- Rumble in the Jungle
    AddA(tmp[1066], a[10334]); -- Predator
    tmp[1067] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1050], tmp[1067]);
    AddA(tmp[1067], a[9470]); -- Council of Exarchs
    AddA(tmp[1067], a[9471]); -- Frostwolf Orcs
    AddA(tmp[1067], a[9476]); -- Sha'tari Defense
    AddA(tmp[1067], a[9475]); -- Laughing Skull Orcs
    AddA(tmp[1067], a[9072]); -- Mantle of the Talon King
    AddA(tmp[1067], a[9474]); -- Wrynn's Vanguard
    AddA(tmp[1067], a[9473]); -- Vol'jin's Spear
    AddA(tmp[1067], a[9472]); -- Steamwheedle Preservation Society
    tmp[1068] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1050], tmp[1068]);
    AddA(tmp[1068], a[9619]); -- Savage Hero
    AddA(tmp[1068], a[8965]); -- Mythic: Imperator's Fall
    AddA(tmp[1068], a[8973]); -- Mythic: Blackhand's Crucible
    AddA(tmp[1068], a[10043]); -- Mythic: Archimonde
    tmp[1069] = cat:New(addon.L["Garrison"], true); -- Garrison
    AddC(tmp[1050], tmp[1069]);
    AddA(tmp[1069], a[9540]); -- The Stable Master
    AddA(tmp[1069], a[9706]); -- The Stable Master
    AddA(tmp[1069], a[9094]); -- Garrison Architect
    AddA(tmp[1069], a[9077]); -- Choppin' Some More Logs
    AddA(tmp[1069], a[9078]); -- Choppin' Even More Logs
    AddA(tmp[1069], a[9080]); -- Choppin' Even More Logs
    AddA(tmp[1069], a[10164]); -- Master of the Seas
    AddA(tmp[1069], a[9725]); -- The Last of Us
    AddA(tmp[1069], a[9517]); -- Nemesis: Death Stalker
    AddA(tmp[1069], a[9513]); -- Nemesis: Scourge of the Kaldorei
    AddA(tmp[1069], a[9516]); -- Nemesis: Slayer of Sin'dorei
    AddA(tmp[1069], a[9509]); -- Nemesis: Draenei Destroyer
    AddA(tmp[1069], a[9521]); -- Nemesis: The Butcher
    AddA(tmp[1069], a[9511]); -- Nemesis: Gnomebane
    AddA(tmp[1069], a[9522]); -- Nemesis: Troll Hunter
    AddA(tmp[1069], a[9510]); -- Nemesis: Dwarfstalker
    AddA(tmp[1069], a[9519]); -- Nemesis: Orcslayer
    AddA(tmp[1069], a[9512]); -- Nemesis: Manslayer
    AddA(tmp[1069], a[9518]); -- Nemesis: Killer of Kezan
    AddA(tmp[1069], a[9515]); -- Nemesis: Worgen Hunter
    AddA(tmp[1069], a[9520]); -- Nemesis: Huojin's Fall
    AddA(tmp[1069], a[9514]); -- Nemesis: Terror of the Tushui
    AddA(tmp[1069], a[9738]); -- Warlord of Draenor
    AddA(tmp[1069], a[9508]); -- Warlord of Draenor
    tmp[1051] = cat:New(addon.GetCategoryInfoTitle(15258)); -- Legion
    AddC(tmp[1043], tmp[1051]);
    tmp[1074] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[1051], tmp[1074]);
    AddA(tmp[1074], a[11232]); -- "Lock, Stock and Two Smoking Goblins"
    tmp[1070] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1051], tmp[1070]);
    AddA(tmp[1070], a[12104]); -- And We're All Out of Mana Buns
    AddA(tmp[1070], a[12083]); -- Paragon of Argus
    tmp[1071] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1051], tmp[1071]);
    AddA(tmp[1071], a[11941]); -- Chromie Homie
    tmp[1072] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1051], tmp[1072]);
    AddA(tmp[1072], a[10827]); -- Mythic: Xavius
    AddA(tmp[1072], a[10850]); -- Mythic: Gul'dan
    AddA(tmp[1072], a[11781]); -- Mythic: Kil'jaeden
    AddA(tmp[1072], a[12002]); -- Mythic: Argus the Unmaker
    AddA(tmp[1072], a[11763]); -- Glory of the Tomb Raider
    AddA(tmp[1072], a[11387]); -- The Chosen
    tmp[1052] = cat:New(addon.GetCategoryInfoTitle(15305)); -- Battle for Azeroth
    AddC(tmp[1043], tmp[1052]);
    tmp[1075] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[1052], tmp[1075]);
    AddA(tmp[1075], a[13925]); -- The Fourth War
    AddA(tmp[1075], a[13924]); -- The Fourth War
    AddA(tmp[1075], a[12497]); -- Drust Do It.
    tmp[1076] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1052], tmp[1076]);
    AddA(tmp[1076], a[13134]); -- Expedition Leader
    AddA(tmp[1076], a[13638]); -- Undersea Usurper
    AddA(tmp[1076], a[13555]); -- Junkyard Tinkmaster
    tmp[1077] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1052], tmp[1077]);
    AddA(tmp[1077], a[12533]); -- Mythic: G'huun
    AddA(tmp[1077], a[13314]); -- Mythic: Lady Jaina Proudmoore
    AddA(tmp[1077], a[13733]); -- Mythic: Queen Azshara
    AddA(tmp[1077], a[14055]); -- Mythic: N'Zoth the Corruptor
    tmp[1078] = cat:New(addon.GetCategoryInfoTitle(15417), true); -- Heart of Azeroth
    AddC(tmp[1052], tmp[1078]);
    AddA(tmp[1078], a[13779]); -- Phenomenal Cosmic Power
    tmp[1079] = cat:New(addon.GetCategoryInfoTitle(15426), true); -- Visions of N'Zoth
    AddC(tmp[1052], tmp[1079]);
    AddA(tmp[1079], a[14140]); -- Mad World
    tmp[1053] = cat:New(addon.GetCategoryInfoTitle(15439)); -- Shadowlands
    AddC(tmp[1043], tmp[1053]);
    tmp[1080] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1053], tmp[1080]);
    AddA(tmp[1080], a[14277]); -- The Accuser's Avowed
    tmp[1081] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1053], tmp[1081]);
    AddA(tmp[1081], a[14365]); -- Mythic: Sire Denathrius
    AddA(tmp[1081], a[15121]); -- Mythic: Sylvanas Windrunner
    AddA(tmp[1081], a[15489]); -- Mythic: The Jailer
    tmp[1082] = cat:New(addon.GetCategoryInfoTitle(15440), true); -- Torghast
    AddC(tmp[1053], tmp[1082]);
    AddA(tmp[1082], a[14568]); -- Twisting Corridors: Layer 6
    tmp[1083] = cat:New(addon.GetCategoryInfoTitle(15441), true); -- Covenant Sanctums
    AddC(tmp[1053], tmp[1083]);
    AddA(tmp[1083], a[14752]); -- Things To Do When You're Dead
    AddA(tmp[1083], a[14682]); -- The Party Herald
    tmp[1084] = cat:New(addon.L["Other"]); -- Other
    AddC(tmp[1043], tmp[1084]);
    tmp[1085] = cat:New(addon.GetCategoryInfoTitle(96), true); -- Quests
    AddC(tmp[1084], tmp[1085]);
    AddA(tmp[1085], a[978]); -- 3000 Quests Completed
    AddA(tmp[1085], a[7520]); -- The Loremaster
    tmp[1086] = cat:New(addon.GetCategoryInfoTitle(97), true); -- Exploration
    AddC(tmp[1084], tmp[1086]);
    AddA(tmp[1086], a[46]); -- Universal Explorer
    AddA(tmp[1086], a[9924]); -- Field Photographer
    AddA(tmp[1086], a[12439]); -- Priority Mail
    tmp[1088] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1084], tmp[1088]);
    AddA(tmp[1088], a[1015]); -- 40 Exalted Reputations
    AddA(tmp[1088], a[6742]); -- 60 Exalted Reputations
    AddA(tmp[1088], a[12864]); -- 80 Exalted Reputations
    AddA(tmp[1088], a[12866]); -- 100 Exalted Reputations
    tmp[1087] = cat:New(addon.GetCategoryInfoTitle(15272), true); -- Dungeons
    AddC(tmp[1084], tmp[1087]);
    AddA(tmp[1087], a[4477]); -- Looking For Many
    tmp[1089] = cat:New(addon.GetCategoryInfoTitle(15117), true); -- Pet Battles
    AddC(tmp[1084], tmp[1089]);
    AddA(tmp[1089], a[6607]); -- Taming Azeroth
    AddA(tmp[1089], a[14020]); -- Pet Battle Challenge: Blackrock Depths
    AddA(tmp[1089], a[8301]); -- Deadly Pet Brawler
    tmp[1090] = cat:New(addon.L["Brawler's Guild"] .. " (" .. addon.GetCategoryInfoTitle(15234) .. ")", true); -- Brawler's Guild
    AddC(tmp[1084], tmp[1090]);
    AddA(tmp[1090], a[13191]); -- Brawler for Azeroth
    tmp[1091] = cat:New(addon.GetCategoryInfoTitle(15246), true); -- Collections
    AddC(tmp[1084], tmp[1091]);
    AddA(tmp[1091], a[6590]); -- World Safari
    AddA(tmp[1091], a[8397]); -- Crazy for Cats
    AddA(tmp[1091], a[10356]); -- Lord of the Reins
    AddA(tmp[1091], a[10355]); -- Lord of the Reins
    AddA(tmp[1091], a[10354]); -- Crashin' Thrashin' Commander
    AddA(tmp[1091], a[10694]); -- Fabulous
    AddA(tmp[1091], a[11761]); -- Azeroth's Next Top Model
    tmp[1092] = cat:New(addon.GetCategoryInfoTitle(169), true); -- Professions
    AddC(tmp[1084], tmp[1092]);
    AddA(tmp[1092], a[1516]); -- Accomplished Angler
    AddA(tmp[1092], a[7306]); -- Master of Pandaren Cooking
    AddA(tmp[1092], a[9464]); -- Professional Draenor Master
    AddA(tmp[1092], a[4855]); -- What was Briefly Yours is Now Mine
    AddA(tmp[1092], a[4856]); -- It Belongs in a Museum!
    tmp[1094] = cat:New(addon.L["Events"], true); -- Events
    AddC(tmp[1084], tmp[1094]);
    AddA(tmp[1094], a[913]); -- To Honor One's Elders
    AddA(tmp[1094], a[1693]); -- Fool For Love
    AddA(tmp[1094], a[2798]); -- Noble Gardener
    AddA(tmp[1094], a[1793]); -- For the Children
    AddA(tmp[1094], a[1038]); -- The Flame Warden
    AddA(tmp[1094], a[1039]); -- The Flame Keeper
    AddA(tmp[1094], a[1683]); -- Brewmaster
    AddA(tmp[1094], a[1656]); -- Hallowed Be Thy Name
    AddA(tmp[1094], a[3478]); -- Pilgrim
    AddA(tmp[1094], a[1691]); -- Merrymaker
    tmp[1093] = cat:New(addon.GetCategoryInfoTitle(95), true); -- PvP
    AddC(tmp[1084], tmp[1093]);
    tmp[1096] = cat:New(addon.GetCategoryInfoTitle(15266), true); -- Honor
    AddC(tmp[1093], tmp[1096]);
    AddA(tmp[1096], a[12901]); -- Honor Level 25
    AddA(tmp[1096], a[12904]); -- Honor Level 50
    AddA(tmp[1096], a[12907]); -- Honor Level 80
    AddA(tmp[1096], a[12909]); -- Honor Level 100
    AddA(tmp[1096], a[12913]); -- Honor Level 200
    AddA(tmp[1096], a[12915]); -- Honor Level 300
    AddA(tmp[1096], a[870]); -- 100000 Honorable Kills
    AddA(tmp[1096], a[5363]); -- 250000 Honorable Kills
    tmp[1095] = cat:New(addon.GetCategoryInfoTitle(15283), true); -- World
    AddC(tmp[1093], tmp[1095]);
    AddA(tmp[1095], a[8721]); -- Fire-Watcher
    AddA(tmp[1095], a[14191]); -- Servant of N'Zoth
    AddA(tmp[1095], a[12605]); -- Conqueror of Azeroth
    AddA(tmp[1095], a[12604]); -- Conqueror of Azeroth
    tmp[1097] = cat:New(addon.L["Dueler's Guild"], true); -- Dueler's Guild
    AddC(tmp[1093], tmp[1097]);
    AddA(tmp[1097], a[12861]); -- Master of Duels
    tmp[1098] = cat:New(addon.GetCategoryInfoTitle(153), true); -- Battlegrounds
    AddC(tmp[1093], tmp[1098]);
    AddA(tmp[1098], a[907]); -- The Justicar
    AddA(tmp[1098], a[714]); -- The Conqueror
    AddA(tmp[1098], a[8360]); -- Master of Deepwind Gorge
    AddA(tmp[1098], a[12412]); -- Master of Seething Shore
    AddA(tmp[1098], a[230]); -- Battlemaster
    AddA(tmp[1098], a[1175]); -- Battlemaster
    AddA(tmp[1098], a[8052]); -- Khan
    AddA(tmp[1098], a[8055]); -- Khan
    tmp[1099] = cat:New(addon.L["Rated"], true); -- Rated
    AddC(tmp[1093], tmp[1099]);
    AddA(tmp[1099], a[5328]); -- Veteran of the Alliance
    AddA(tmp[1099], a[5325]); -- Veteran of the Horde
    AddA(tmp[1099], a[5329]); -- Warbound Veteran of the Alliance
    AddA(tmp[1099], a[5326]); -- Warbringer of the Horde
    AddA(tmp[1099], a[5330]); -- Private
    AddA(tmp[1099], a[5345]); -- Scout
    AddA(tmp[1099], a[5331]); -- Corporal
    AddA(tmp[1099], a[5346]); -- Grunt
    AddA(tmp[1099], a[5332]); -- Sergeant
    AddA(tmp[1099], a[5347]); -- Sergeant
    AddA(tmp[1099], a[5333]); -- Master Sergeant
    AddA(tmp[1099], a[5348]); -- Senior Sergeant
    AddA(tmp[1099], a[5334]); -- Sergeant Major
    AddA(tmp[1099], a[5349]); -- First Sergeant
    AddA(tmp[1099], a[5335]); -- Knight
    AddA(tmp[1099], a[5350]); -- Stone Guard
    AddA(tmp[1099], a[5336]); -- Knight-Lieutenant
    AddA(tmp[1099], a[5351]); -- Blood Guard
    AddA(tmp[1099], a[5337]); -- Knight-Captain
    AddA(tmp[1099], a[5352]); -- Legionnaire
    AddA(tmp[1099], a[5359]); -- Knight-Champion
    AddA(tmp[1099], a[5338]); -- Centurion
    AddA(tmp[1099], a[5339]); -- Lieutenant Commander
    AddA(tmp[1099], a[5353]); -- Champion
    AddA(tmp[1099], a[5340]); -- Commander
    AddA(tmp[1099], a[5354]); -- Lieutenant General
    AddA(tmp[1099], a[5341]); -- Marshal
    AddA(tmp[1099], a[5355]); -- General
    AddA(tmp[1099], a[5357]); -- Field Marshal
    AddA(tmp[1099], a[5342]); -- Warlord
    AddA(tmp[1099], a[5343]); -- Grand Marshal
    AddA(tmp[1099], a[5356]); -- High Warlord
    tmp[1101] = cat:New((UnitName("player")) .. " " .. (GetTitleName(334))); -- Player the Fabulous
    AddC(tmp[971], tmp[1101]);
    AddA(tmp[1101], a[11761]); -- Azeroth's Next Top Model
    tmp[1102] = cat:New(addon.GetCategoryInfoTitle(15246)); -- Collections
    AddC(tmp[1101], tmp[1102]);
    AddA(tmp[1102], a[10681]); -- Fashionista: Head
    AddA(tmp[1102], a[10682]); -- Fashionista: Chest
    AddA(tmp[1102], a[10684]); -- Fashionista: Legs
    AddA(tmp[1102], a[10685]); -- Fashionista: Feet
    AddA(tmp[1102], a[10686]); -- Fashionista: Waist
    AddA(tmp[1102], a[10687]); -- Fashionista: Back
    AddA(tmp[1102], a[10688]); -- Fashionista: Wrist
    AddA(tmp[1102], a[10690]); -- Fashionista: Tabard
    AddA(tmp[1102], a[10691]); -- Fashionista: Shirt
    AddA(tmp[1102], a[10692]); -- Fashionista: Shoulder
    AddA(tmp[1102], a[10693]); -- Fashionista: Hand
    AddA(tmp[1102], a[10689]); -- Fashionista: Weapon & Off-Hand
    AddA(tmp[1102], a[10694]); -- Fabulous
    tmp[1103] = cat:New(addon.GetCategoryInfoTitle(15271)); -- Raids
    AddC(tmp[1101], tmp[1103]);
    AddA(tmp[1103], a[11741]); -- So Hot Right Now
    AddA(tmp[1103], a[11742]); -- Dress in Lairs
    AddA(tmp[1103], a[11743]); -- Accessor-Eyes
    AddA(tmp[1103], a[11744]); -- "Drop Dead, Gorgeous"
    AddA(tmp[1103], a[11746]); -- Outlandish Style
    AddA(tmp[1103], a[11747]); -- Merely a Set
    AddA(tmp[1103], a[11748]); -- Black is the New Black
    AddA(tmp[1103], a[11749]); -- "Suns Out, Thori'dals Out"
    AddA(tmp[1103], a[11750]); -- Undying Aesthetic
    AddA(tmp[1103], a[11751]); -- Mogg-Saron
    AddA(tmp[1103], a[11752]); -- Style of the Crusader
    AddA(tmp[1103], a[11753]); -- Winter Catalog
    AddA(tmp[1103], a[11754]); -- Glamour of Twilight
    AddA(tmp[1103], a[11755]); -- Hot Couture
    AddA(tmp[1103], a[11756]); -- Wardrobe of the Old Gods
    AddA(tmp[1103], a[11757]); -- Sha of Fabulous
    AddA(tmp[1103], a[11758]); -- Thunderwear
    AddA(tmp[1103], a[11759]); -- Yaass'shaarj
    AddA(tmp[1103], a[11740]); -- Make it W-orc W-orc
    AddA(tmp[1103], a[11631]); -- Extreme Makeover: Fel Edition
    AddA(tmp[1103], a[11628]); -- That's So Last Millennium
    AddA(tmp[1103], a[11762]); -- Can I Get A Helya
    AddA(tmp[1103], a[11760]); -- Retro Trend
    AddA(tmp[1103], a[12020]); -- Argussy Up
    AddA(tmp[1103], a[12991]); -- "New Mog, G'huun This?"
    AddA(tmp[1103], a[13385]); -- Daz'aling Attire
    AddA(tmp[1103], a[13571]); -- Under the Seams
    AddA(tmp[1103], a[14058]); -- All Eyes On Me
    AddA(tmp[1103], a[14614]); -- Castle Vain
    AddA(tmp[1103], a[15110]); -- Dominating the Catwalk
    AddA(tmp[1103], a[15409]); -- First Wonders
    tmp[1104] = cat:New(addon.GetCategoryInfoTitle(95)); -- Player vs. Player
    AddC(tmp[1101], tmp[1104]);
    AddA(tmp[1104], a[11706]); -- The Original
    AddA(tmp[1104], a[11707]); -- No Mercy
    AddA(tmp[1104], a[11708]); -- With a Vengeance
    AddA(tmp[1104], a[11709]); -- Tough Threads
    AddA(tmp[1104], a[11710]); -- Lethal Looks
    AddA(tmp[1104], a[11711]); -- The Fierce and the Furious
    AddA(tmp[1104], a[11712]); -- Relentlessly Good Looking
    AddA(tmp[1104], a[11713]); -- Wrath of the Stitch King
    AddA(tmp[1104], a[11714]); -- Viciously Vintage
    AddA(tmp[1104], a[11715]); -- (Ruth)less is More
    AddA(tmp[1104], a[11716]); -- Cataclysmic Catwalk
    AddA(tmp[1104], a[11717]); -- Why Male(volent) Models?
    AddA(tmp[1104], a[11718]); -- Dressed to Oppress
    AddA(tmp[1104], a[11719]); -- It's Not Fashion Unless It Hurts
    AddA(tmp[1104], a[11720]); -- Wear It With Pride
    AddA(tmp[1104], a[11629]); -- Untamed Beauty
    AddA(tmp[1104], a[11721]); -- Wild Style
    AddA(tmp[1104], a[11722]); -- War-Mog-ering
    AddA(tmp[1104], a[11630]); -- More Like Win-dictive
    AddA(tmp[1104], a[11723]); -- Cruel Intentions
    AddA(tmp[1104], a[12021]); -- Claws Out
    AddA(tmp[1104], a[12993]); -- Don't Warfront Me
    AddA(tmp[1104], a[13433]); -- "Tall, Dark, and Sinister"
    AddA(tmp[1104], a[13585]); -- "Never Lose, Never Choose To"
    AddA(tmp[1104], a[14059]); -- The Eyes Have It
    AddA(tmp[1104], a[14831]); -- "I Live, I Die, I Queue Again"
    AddA(tmp[1104], a[15102]); -- It's Off the Chain!
    AddA(tmp[1104], a[15408]); -- Cosmic Chic
    tmp[1105] = cat:New(addon.L["Realm First!"]); -- Realm First!
    AddC(tmp[971], tmp[1105]);
    tmp[1106] = cat:New(addon.L["Leveling"]); -- Leveling
    AddC(tmp[1105], tmp[1106]);
    tmp[1107] = cat:New(addon.L["Level 80"], true); -- Level 80
    AddC(tmp[1106], tmp[1107]);
    AddA(tmp[1107], a[457]); -- Realm First! Level 80
    AddA(tmp[1107], a[459]); -- Realm First! Level 80 Warrior
    AddA(tmp[1107], a[465]); -- Realm First! Level 80 Paladin
    AddA(tmp[1107], a[462]); -- Realm First! Level 80 Hunter
    AddA(tmp[1107], a[458]); -- Realm First! Level 80 Rogue
    AddA(tmp[1107], a[464]); -- Realm First! Level 80 Priest
    AddA(tmp[1107], a[461]); -- Realm First! Level 80 Death Knight
    AddA(tmp[1107], a[467]); -- Realm First! Level 80 Shaman
    AddA(tmp[1107], a[460]); -- Realm First! Level 80 Mage
    AddA(tmp[1107], a[463]); -- Realm First! Level 80 Warlock
    AddA(tmp[1107], a[466]); -- Realm First! Level 80 Druid
    AddA(tmp[1107], a[1408]); -- Realm First! Level 80 Human
    AddA(tmp[1107], a[1410]); -- Realm First! Level 80 Orc
    AddA(tmp[1107], a[1407]); -- Realm First! Level 80 Dwarf
    AddA(tmp[1107], a[1409]); -- Realm First! Level 80 Night Elf
    AddA(tmp[1107], a[1413]); -- Realm First! Level 80 Forsaken
    AddA(tmp[1107], a[1411]); -- Realm First! Level 80 Tauren
    AddA(tmp[1107], a[1404]); -- Realm First! Level 80 Gnome
    AddA(tmp[1107], a[1412]); -- Realm First! Level 80 Troll
    AddA(tmp[1107], a[1405]); -- Realm First! Level 80 Blood Elf
    AddA(tmp[1107], a[1406]); -- Realm First! Level 80 Draenei
    tmp[1110] = cat:New(addon.GetCategoryInfoTitle(169)); -- Professions
    AddC(tmp[1105], tmp[1110]);
    tmp[1111] = cat:New(addon.L["450 skill"], true); -- 450 skill
    AddC(tmp[1110], tmp[1111]);
    AddA(tmp[1111], a[1415]); -- Realm First! Grand Master Alchemist
    AddA(tmp[1111], a[1420]); -- Realm First! Grand Master Angler
    AddA(tmp[1111], a[5395]); -- Realm First! Grand Master Archaeologist
    AddA(tmp[1111], a[1414]); -- Realm First! Grand Master Blacksmith
    AddA(tmp[1111], a[1416]); -- Realm First! Grand Master Cook
    AddA(tmp[1111], a[1417]); -- Realm First! Grand Master Enchanter
    AddA(tmp[1111], a[1418]); -- Realm First! Grand Master Engineer
    AddA(tmp[1111], a[1421]); -- Realm First! Grand Master Herbalist
    AddA(tmp[1111], a[1423]); -- Realm First! Grand Master Jewelcrafter
    AddA(tmp[1111], a[1424]); -- Realm First! Grand Master Leatherworker
    AddA(tmp[1111], a[1419]); -- Realm First! Grand Master Medic
    AddA(tmp[1111], a[1425]); -- Realm First! Grand Master Miner
    AddA(tmp[1111], a[1422]); -- Realm First! Grand Master Scribe
    AddA(tmp[1111], a[1426]); -- Realm First! Grand Master Skinner
    AddA(tmp[1111], a[1427]); -- Realm First! Grand Master Tailor
    tmp[1116] = cat:New(addon.GetCategoryInfoTitle(201), true); -- Reputation
    AddC(tmp[1105], tmp[1116]);
    AddA(tmp[1116], a[1463]); -- Realm First! Northrend Vanguard
    AddA(tmp[1116], a[6829]); -- Realm First! Pandaren Ambassador
    tmp[1114] = cat:New(addon.GetCategoryInfoTitle(15272), true); -- Dungeons
    AddC(tmp[1105], tmp[1114]);
    AddA(tmp[1114], a[6433]); -- Realm First! Challenge Conqueror: Gold
    AddA(tmp[1114], a[11224]); -- Realm First! Legion Keystone Master
    AddA(tmp[1114], a[13078]); -- Realm First! Battle for Azeroth Keystone Master
    AddA(tmp[1114], a[14662]); -- Realm First! Shadowlands Keystone Master
    tmp[1115] = cat:New(addon.GetCategoryInfoTitle(15271), true); -- Raids
    AddC(tmp[1105], tmp[1115]);
    AddA(tmp[1115], a[1402]); -- Realm First! Conqueror of Naxxramas
    AddA(tmp[1115], a[456]); -- Realm First! Obsidian Slayer
    AddA(tmp[1115], a[1400]); -- Realm First! Magic Seeker
    AddA(tmp[1115], a[3117]); -- Realm First! Death's Demise
    AddA(tmp[1115], a[3259]); -- Realm First! Celestial Defender
    AddA(tmp[1115], a[4078]); -- Realm First! Grand Crusader
    AddA(tmp[1115], a[4576]); -- Realm First! Fall of the Lich King
    tmp[1117] = cat:New(addon.GetCategoryInfoTitle(15268)); -- Promotions
    AddC(tmp[971], tmp[1117]);
    AddA(tmp[1117], a[414]); -- Tyrael's Hilt
    AddA(tmp[1117], a[10537]); -- Patron of War
    AddA(tmp[1117], a[10657]); -- Fledgling Hero of Warcraft
    AddA(tmp[1117], a[11210]); -- Fight for the Alliance
    AddA(tmp[1117], a[11211]); -- Fight for the Horde
    AddA(tmp[1117], a[15594]); -- Fearless Spectator
    tmp[1118] = cat:New(addon.L["BlizzCon"], true); -- BlizzCon
    AddC(tmp[1117], tmp[1118]);
    AddA(tmp[1118], a[411]); -- Murky
    AddA(tmp[1118], a[412]); -- Murloc Costume
    AddA(tmp[1118], a[415]); -- Big Blizzard Bear
    AddA(tmp[1118], a[3536]); -- The Marine Marine
    AddA(tmp[1118], a[5378]); -- Deathy
    AddA(tmp[1118], a[6185]); -- Murkablo
    AddA(tmp[1118], a[8793]); -- Murkalot
    AddA(tmp[1118], a[9763]); -- Grommloc
    AddA(tmp[1118], a[10322]); -- Murkidan
    AddA(tmp[1118], a[11294]); -- Murloc Battlemasters
    AddA(tmp[1118], a[11931]); -- Rides of War
    AddA(tmp[1118], a[13138]); -- Flying Colors
    AddA(tmp[1118], a[14027]); -- Battle for Mrrglroth
    AddA(tmp[1118], a[14904]); -- Netherwhelp Online
    tmp[1119] = cat:New(addon.L["Collector's Edition"], true); -- Collector's Edition
    AddC(tmp[1117], tmp[1119]);
    AddA(tmp[1119], a[662]); -- Collector's Edition: Mini-Diablo
    AddA(tmp[1119], a[663]); -- Collector's Edition: Panda
    AddA(tmp[1119], a[664]); -- Collector's Edition: Zergling
    AddA(tmp[1119], a[665]); -- Collector's Edition: Netherwhelp
    AddA(tmp[1119], a[683]); -- Collector's Edition: Frost Wyrm Whelp
    AddA(tmp[1119], a[5377]); -- Collector's Edition: Lil' Deathwing
    AddA(tmp[1119], a[6849]); -- Collector's Edition: Imperial Quilen
    AddA(tmp[1119], a[6848]); -- Collector's Edition: Lucky Quilen Cub
    AddA(tmp[1119], a[8916]); -- Collector's Edition: Dread Raven
    AddA(tmp[1119], a[8917]); -- Collector's Edition: Dread Hatchling
    AddA(tmp[1119], a[10320]); -- Collector's Edition: Illidari Felstalker
    AddA(tmp[1119], a[10321]); -- Collector's Edition: Nibbles
    AddA(tmp[1119], a[12229]); -- Collector's Edition: Seabraid Stallion
    AddA(tmp[1119], a[12230]); -- Collector's Edition: Gilded Ravasaur
    AddA(tmp[1119], a[12232]); -- Collector's Edition: Tottle
    AddA(tmp[1119], a[14283]); -- Heroic Edition: Ensorcelled Everwyrm
    tmp[1120] = cat:New(addon.L["Diablo III"], true); -- Diablo III
    AddC(tmp[1117], tmp[1120]);
    AddA(tmp[1120], a[7412]); -- Collector's Edition: Fetish Shaman
    AddA(tmp[1120], a[8795]); -- Collector's Edition: Treasure Goblin
    tmp[1121] = cat:New(addon.L["Overwatch"], true); -- Overwatch
    AddC(tmp[1117], tmp[1121]);
    AddA(tmp[1121], a[11064]); -- Collector's Edition: Baby Winston
    tmp[1122] = cat:New(addon.L["StarCraft II"], true); -- StarCraft II
    AddC(tmp[1117], tmp[1122]);
    AddA(tmp[1122], a[4824]); -- Collector's Edition: Mini Thor
    AddA(tmp[1122], a[7842]); -- Collector's Edition: Baneling
    AddA(tmp[1122], a[10309]); -- Collector's Edition: Zeradar
    AddA(tmp[1122], a[12454]); -- Salute to StarCraft
    tmp[1123] = cat:New(addon.L["Hearthstone"], true); -- Hearthstone
    AddC(tmp[1117], tmp[1123]);
    AddA(tmp[1123], a[8345]); -- Hearthstoned
    AddA(tmp[1123], a[15323]); -- Sarge's Tale
    tmp[1124] = cat:New(addon.L["Heroes of the Storm"], true); -- Heroes of the Storm
    AddC(tmp[1117], tmp[1124]);
    AddA(tmp[1124], a[9926]); -- Hero of the Storm
    AddA(tmp[1124], a[11425]); -- Herald of Flames
    tmp[1125] = cat:New(addon.L["Warcraft III: Reforged"], true); -- Warcraft III: Reforged
    AddC(tmp[1117], tmp[1125]);
    AddA(tmp[1125], a[13196]); -- Meat Marauder
    tmp[857] = cat:New(addon.L["Excluded"]); -- Excluded
    AddC(tmp[971], tmp[857]);
    tmp[857].HasFlexibleData = true;
    tinsert(excludedCategories, tmp[857]);
    tmp[857].IsExcluded = true;

    local tabs = {};
    tabs["Achievements"] = achievements.Children;
    tabs["Expansions"] = expansions.Children;
    tabs["Events"] = events.Children;
    tabs["PvP"] = pvp.Children;
    tabs["Specials"] = specials.Children;
    return tabs, focusedCategories, currentZoneCategories, selectedZoneCategories, excludedCategories;
end

function exportedCategories.InjectOptions()
    local defaultsFocused = {};
    defaultsFocused[1] = false;
    defaultsFocused[2] = false;
    defaultsFocused[3] = false;
    defaultsFocused[4] = false;
    defaultsFocused[5] = true;

    addon.Options.InjectDefaults(defaultsFocused, "Focused", "AdjustableCategories");

    local optionsTableFocused = {
        order = 2, type = "group",
        name = addon.L["Focused"],
        inline = true,
        args = {
            Achievements = {
                order = 1, type = "toggle",
                name = addon.L["Achievements"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Focused[1]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Focused[1] = not addon.Options.db.AdjustableCategories.Focused[1];
                    addon.Diagnostics.Debug(addon.L["Achievements"], addon.Options.db.AdjustableCategories.Focused[1]);
                end
            },
            Expansions = {
                order = 2, type = "toggle",
                name = addon.L["Expansions"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Focused[2]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Focused[2] = not addon.Options.db.AdjustableCategories.Focused[2];
                    addon.Diagnostics.Debug(addon.L["Expansions"], addon.Options.db.AdjustableCategories.Focused[2]);
                end
            },
            Events = {
                order = 3, type = "toggle",
                name = addon.L["Events"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Focused[3]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Focused[3] = not addon.Options.db.AdjustableCategories.Focused[3];
                    addon.Diagnostics.Debug(addon.L["Events"], addon.Options.db.AdjustableCategories.Focused[3]);
                end
            },
            PvP = {
                order = 4, type = "toggle",
                name = addon.GetCategoryInfoTitle(95),
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Focused[4]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Focused[4] = not addon.Options.db.AdjustableCategories.Focused[4];
                    addon.Diagnostics.Debug(addon.GetCategoryInfoTitle(95), addon.Options.db.AdjustableCategories.Focused[4]);
                end
            },
            Specials = {
                order = 5, type = "toggle",
                name = addon.L["Specials"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Focused[5]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Focused[5] = not addon.Options.db.AdjustableCategories.Focused[5];
                    addon.Diagnostics.Debug(addon.L["Specials"], addon.Options.db.AdjustableCategories.Focused[5]);
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTableFocused, "Focused", "Layout", "args", "AdjustableCategories", "args");

    local defaultsCurrentZone = {};
    defaultsCurrentZone[1] = false;
    defaultsCurrentZone[2] = false;
    defaultsCurrentZone[3] = false;
    defaultsCurrentZone[4] = false;
    defaultsCurrentZone[5] = true;

    addon.Options.InjectDefaults(defaultsCurrentZone, "CurrentZone", "AdjustableCategories");

    local optionsTableCurrentZone = {
        order = 3, type = "group",
        name = addon.L["Current Zone"],
        inline = true,
        args = {
            Achievements = {
                order = 1, type = "toggle",
                name = addon.L["Achievements"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.CurrentZone[1]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.CurrentZone[1] = not addon.Options.db.AdjustableCategories.CurrentZone[1];
                    addon.Diagnostics.Debug(addon.L["Achievements"], addon.Options.db.AdjustableCategories.CurrentZone[1]);
                end
            },
            Expansions = {
                order = 2, type = "toggle",
                name = addon.L["Expansions"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.CurrentZone[2]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.CurrentZone[2] = not addon.Options.db.AdjustableCategories.CurrentZone[2];
                    addon.Diagnostics.Debug(addon.L["Expansions"], addon.Options.db.AdjustableCategories.CurrentZone[2]);
                end
            },
            Events = {
                order = 3, type = "toggle",
                name = addon.L["Events"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.CurrentZone[3]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.CurrentZone[3] = not addon.Options.db.AdjustableCategories.CurrentZone[3];
                    addon.Diagnostics.Debug(addon.L["Events"], addon.Options.db.AdjustableCategories.CurrentZone[3]);
                end
            },
            PvP = {
                order = 4, type = "toggle",
                name = addon.GetCategoryInfoTitle(95),
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.CurrentZone[4]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.CurrentZone[4] = not addon.Options.db.AdjustableCategories.CurrentZone[4];
                    addon.Diagnostics.Debug(addon.GetCategoryInfoTitle(95), addon.Options.db.AdjustableCategories.CurrentZone[4]);
                end
            },
            Specials = {
                order = 5, type = "toggle",
                name = addon.L["Specials"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.CurrentZone[5]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.CurrentZone[5] = not addon.Options.db.AdjustableCategories.CurrentZone[5];
                    addon.Diagnostics.Debug(addon.L["Specials"], addon.Options.db.AdjustableCategories.CurrentZone[5]);
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTableCurrentZone, "CurrentZone", "Layout", "args", "AdjustableCategories", "args");

    local defaultsSelectedZone = {};
    defaultsSelectedZone[1] = false;
    defaultsSelectedZone[2] = false;
    defaultsSelectedZone[3] = false;
    defaultsSelectedZone[4] = false;
    defaultsSelectedZone[5] = true;

    addon.Options.InjectDefaults(defaultsSelectedZone, "SelectedZone", "AdjustableCategories");

    local optionsTableSelectedZone = {
        order = 4, type = "group",
        name = addon.L["Selected Zone"],
        inline = true,
        args = {
            Achievements = {
                order = 1, type = "toggle",
                name = addon.L["Achievements"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.SelectedZone[1]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.SelectedZone[1] = not addon.Options.db.AdjustableCategories.SelectedZone[1];
                    addon.Diagnostics.Debug(addon.L["Achievements"], addon.Options.db.AdjustableCategories.SelectedZone[1]);
                end
            },
            Expansions = {
                order = 2, type = "toggle",
                name = addon.L["Expansions"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.SelectedZone[2]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.SelectedZone[2] = not addon.Options.db.AdjustableCategories.SelectedZone[2];
                    addon.Diagnostics.Debug(addon.L["Expansions"], addon.Options.db.AdjustableCategories.SelectedZone[2]);
                end
            },
            Events = {
                order = 3, type = "toggle",
                name = addon.L["Events"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.SelectedZone[3]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.SelectedZone[3] = not addon.Options.db.AdjustableCategories.SelectedZone[3];
                    addon.Diagnostics.Debug(addon.L["Events"], addon.Options.db.AdjustableCategories.SelectedZone[3]);
                end
            },
            PvP = {
                order = 4, type = "toggle",
                name = addon.GetCategoryInfoTitle(95),
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.SelectedZone[4]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.SelectedZone[4] = not addon.Options.db.AdjustableCategories.SelectedZone[4];
                    addon.Diagnostics.Debug(addon.GetCategoryInfoTitle(95), addon.Options.db.AdjustableCategories.SelectedZone[4]);
                end
            },
            Specials = {
                order = 5, type = "toggle",
                name = addon.L["Specials"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.SelectedZone[5]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.SelectedZone[5] = not addon.Options.db.AdjustableCategories.SelectedZone[5];
                    addon.Diagnostics.Debug(addon.L["Specials"], addon.Options.db.AdjustableCategories.SelectedZone[5]);
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTableSelectedZone, "SelectedZone", "Layout", "args", "AdjustableCategories", "args");

    local defaultsExcluded = {};
    defaultsExcluded[1] = false;
    defaultsExcluded[2] = false;
    defaultsExcluded[3] = false;
    defaultsExcluded[4] = false;
    defaultsExcluded[5] = true;

    addon.Options.InjectDefaults(defaultsExcluded, "Excluded", "AdjustableCategories");

    local optionsTableExcluded = {
        order = 5, type = "group",
        name = addon.L["Excluded"],
        inline = true,
        args = {
            Achievements = {
                order = 1, type = "toggle",
                name = addon.L["Achievements"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Excluded[1]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Excluded[1] = not addon.Options.db.AdjustableCategories.Excluded[1];
                    addon.Diagnostics.Debug(addon.L["Achievements"], addon.Options.db.AdjustableCategories.Excluded[1]);
                end
            },
            Expansions = {
                order = 2, type = "toggle",
                name = addon.L["Expansions"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Excluded[2]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Excluded[2] = not addon.Options.db.AdjustableCategories.Excluded[2];
                    addon.Diagnostics.Debug(addon.L["Expansions"], addon.Options.db.AdjustableCategories.Excluded[2]);
                end
            },
            Events = {
                order = 3, type = "toggle",
                name = addon.L["Events"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Excluded[3]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Excluded[3] = not addon.Options.db.AdjustableCategories.Excluded[3];
                    addon.Diagnostics.Debug(addon.L["Events"], addon.Options.db.AdjustableCategories.Excluded[3]);
                end
            },
            PvP = {
                order = 4, type = "toggle",
                name = addon.GetCategoryInfoTitle(95),
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Excluded[4]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Excluded[4] = not addon.Options.db.AdjustableCategories.Excluded[4];
                    addon.Diagnostics.Debug(addon.GetCategoryInfoTitle(95), addon.Options.db.AdjustableCategories.Excluded[4]);
                end
            },
            Specials = {
                order = 5, type = "toggle",
                name = addon.L["Specials"],
                desc = addon.L["Requires a reload"],
                get = function() return addon.Options.db.AdjustableCategories.Excluded[5]; end,
                set = function()
                    addon.Options.db.AdjustableCategories.Excluded[5] = not addon.Options.db.AdjustableCategories.Excluded[5];
                    addon.Diagnostics.Debug(addon.L["Specials"], addon.Options.db.AdjustableCategories.Excluded[5]);
                end
            },
        }
    };

    addon.Options.InjectOptionsTable(optionsTableExcluded, "Excluded", "Layout", "args", "AdjustableCategories", "args");
end

