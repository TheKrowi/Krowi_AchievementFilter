-- [[ Exported at 2022-08-06 11-48-20 ]] --
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
    tmp[1100] = cat:New(addon.L["Achievements"]); -- TAB - Achievements
    tmp[1100].TabName = "Achievements";
    local achievements = tmp[1100];
    tmp[1202] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[1100], tmp[1202]);
    tmp[1202].AlwaysVisible = true;
    tmp[1202].IsSummary = true;
    tmp[883] = cat:New(addon.L["Expansions"]); -- TAB - Expansions
    tmp[883].TabName = "Expansions";
    local expansions = tmp[883];
    tmp[1203] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[883], tmp[1203]);
    tmp[1203].AlwaysVisible = true;
    tmp[1203].IsSummary = true;
    tmp[1] = cat:New((addon.GetCategoryInfo(14864))); -- Classic
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
    tmp[1033] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[922], tmp[1033]);
    AddA(tmp[1033], a[9924]); -- Field Photographer
    tmp[1022] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
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
    tmp[723] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[721], tmp[723]);
    AddA(tmp[723], a[627]); -- Explore Dun Morogh
    tmp[1005] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[721], tmp[1005]);
    AddA(tmp[1005], a[948]); -- Ambassador of the Alliance
    tmp[722] = cat:New(addon.GetMapName(37)); -- Elwynn Forest
    AddC(tmp[687], tmp[722]);
    tmp[724] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[722], tmp[724]);
    AddA(tmp[724], a[776]); -- Explore Elwynn Forest
    AddA(tmp[724], a[9924]); -- Field Photographer
    tmp[1006] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[722], tmp[1006]);
    AddA(tmp[1006], a[948]); -- Ambassador of the Alliance
    tmp[725] = cat:New(addon.GetMapName(18)); -- Tirisfal Glades
    AddC(tmp[687], tmp[725]);
    tmp[1201] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[725], tmp[1201]);
    AddA(tmp[1201], a[15579]); -- Return to Lordaeron
    tmp[726] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[725], tmp[726]);
    AddA(tmp[726], a[768]); -- Explore Tirisfal Glades
    tmp[1026] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[725], tmp[1026]);
    AddA(tmp[1026], a[762]); -- Ambassador of the Horde
    tmp[651] = cat:New(addon.GetMapName(52)); -- Westfall
    AddC(tmp[687], tmp[651]);
    AddA(tmp[651], a[11200]); -- Stand Against the Legion
    AddA(tmp[651], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[653] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[651], tmp[653]);
    AddA(tmp[653], a[4903]); -- Westfall Quests
    AddA(tmp[653], a[12455]); -- Westfall & Duskwood Quests
    tmp[730] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[651], tmp[730]);
    AddA(tmp[730], a[802]); -- Explore Westfall
    AddA(tmp[730], a[9924]); -- Field Photographer
    tmp[1028] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[651], tmp[1028]);
    AddA(tmp[1028], a[948]); -- Ambassador of the Alliance
    tmp[655] = cat:New(addon.GetMapName(48)); -- Loch Modan
    AddC(tmp[687], tmp[655]);
    tmp[657] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[655], tmp[657]);
    AddA(tmp[657], a[4899]); -- Loch Modan Quests
    AddA(tmp[657], a[12456]); -- Loch Modan & Wetlands Quests
    tmp[729] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[655], tmp[729]);
    AddA(tmp[729], a[779]); -- Explore Loch Modan
    AddA(tmp[729], a[9924]); -- Field Photographer
    tmp[1013] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[655], tmp[1013]);
    AddA(tmp[1013], a[948]); -- Ambassador of the Alliance
    tmp[681] = cat:New(addon.GetMapName(21)); -- Silverpine Forest
    AddC(tmp[687], tmp[681]);
    tmp[682] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[681], tmp[682]);
    AddA(tmp[682], a[4894]); -- Silverpine Forest Quests
    tmp[732] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[681], tmp[732]);
    AddA(tmp[732], a[769]); -- Explore Silverpine Forest
    tmp[1020] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[681], tmp[1020]);
    AddA(tmp[1020], a[762]); -- Ambassador of the Horde
    tmp[678] = cat:New(addon.GetMapName(49)); -- Redridge Mountains
    AddC(tmp[687], tmp[678]);
    tmp[677] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[678], tmp[677]);
    AddA(tmp[677], a[4902]); -- Redridge Mountains Quests
    tmp[734] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[678], tmp[734]);
    AddA(tmp[734], a[780]); -- Explore Redridge Mountains
    tmp[1017] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[678], tmp[1017]);
    AddA(tmp[1017], a[948]); -- Ambassador of the Alliance
    tmp[652] = cat:New(addon.GetMapName(47)); -- Duskwood
    AddC(tmp[687], tmp[652]);
    tmp[654] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[652], tmp[654]);
    AddA(tmp[654], a[12430]); -- Duskwood Quests
    AddA(tmp[654], a[12455]); -- Westfall & Duskwood Quests
    tmp[735] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[652], tmp[735]);
    AddA(tmp[735], a[778]); -- Explore Duskwood
    AddA(tmp[735], a[9924]); -- Field Photographer
    tmp[1007] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[652], tmp[1007]);
    AddA(tmp[1007], a[948]); -- Ambassador of the Alliance
    tmp[656] = cat:New(addon.GetMapName(56)); -- Wetlands
    AddC(tmp[687], tmp[656]);
    tmp[658] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[656], tmp[658]);
    AddA(tmp[658], a[12429]); -- Wetlands Quests
    AddA(tmp[658], a[12456]); -- Loch Modan & Wetlands Quests
    tmp[731] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[656], tmp[731]);
    AddA(tmp[731], a[841]); -- Explore Wetlands
    AddA(tmp[731], a[9924]); -- Field Photographer
    tmp[1029] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[656], tmp[1029]);
    AddA(tmp[1029], a[948]); -- Ambassador of the Alliance
    tmp[671] = cat:New(addon.GetMapName(25)); -- Hillsbrad Foothills
    AddC(tmp[687], tmp[671]);
    AddA(tmp[671], a[11200]); -- Stand Against the Legion
    AddA(tmp[671], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[672] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[671], tmp[672]);
    AddA(tmp[672], a[4895]); -- Hillsbrad Foothills Quests
    tmp[736] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[671], tmp[736]);
    AddA(tmp[736], a[772]); -- Explore Hillsbrad Foothills
    AddA(tmp[736], a[9924]); -- Field Photographer
    tmp[1012] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[671], tmp[1012]);
    AddA(tmp[1012], a[762]); -- Ambassador of the Horde
    AddA(tmp[1012], a[2336]); -- Insane in the Membrane
    tmp[649] = cat:New(addon.GetMapName(14)); -- Arathi Highlands
    AddC(tmp[687], tmp[649]);
    tmp[650] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[649], tmp[650]);
    AddA(tmp[650], a[4896]); -- Arathi Highlands Quests
    tmp[741] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[649], tmp[741]);
    AddA(tmp[741], a[761]); -- Explore Arathi Highlands
    tmp[996] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[649], tmp[996]);
    AddA(tmp[996], a[948]); -- Ambassador of the Alliance
    AddA(tmp[996], a[762]); -- Ambassador of the Horde
    tmp[675] = cat:New(addon.GetMapName(50)); -- Northern Stranglethorn
    AddC(tmp[687], tmp[675]);
    tmp[676] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[675], tmp[676]);
    AddA(tmp[676], a[4906]); -- Northern Stranglethorn Quests
    AddA(tmp[676], a[940]); -- The Green Hills of Stranglethorn
    AddA(tmp[676], a[941]); -- Hemet Nesingwary: The Collected Quests
    tmp[739] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[675], tmp[739]);
    AddA(tmp[739], a[781]); -- Explore Northern Stranglethorn
    tmp[1016] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[675], tmp[1016]);
    AddA(tmp[1016], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1016], a[762]); -- Ambassador of the Horde
    tmp[665] = cat:New(addon.GetMapName(210)); -- The Cape of Stranglethorn
    AddC(tmp[687], tmp[665]);
    tmp[666] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[665], tmp[666]);
    AddA(tmp[666], a[4905]); -- Cape of Stranglethorn Quests
    tmp[740] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[665], tmp[740]);
    AddA(tmp[740], a[4995]); -- Explore the Cape of Stranglethorn
    AddA(tmp[740], a[9924]); -- Field Photographer
    tmp[1164] = cat:New((addon.GetCategoryInfo(95))); -- Player vs. Player
    AddC(tmp[665], tmp[1164]);
    AddA(tmp[1164], a[389]); -- Gurubashi Arena Master
    AddA(tmp[1164], a[396]); -- Gurubashi Arena Grand Master
    tmp[993] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[665], tmp[993]);
    AddA(tmp[993], a[762]); -- Ambassador of the Horde
    AddA(tmp[993], a[871]); -- "Avast Ye, Admiral!"
    AddA(tmp[993], a[2336]); -- Insane in the Membrane
    tmp[685] = cat:New(addon.GetMapName(22)); -- Western Plaguelands
    AddC(tmp[687], tmp[685]);
    tmp[686] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[685], tmp[686]);
    AddA(tmp[686], a[4893]); -- Western Plaguelands Quests
    tmp[746] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[685], tmp[746]);
    AddA(tmp[746], a[770]); -- Explore Western Plaguelands
    AddA(tmp[746], a[9924]); -- Field Photographer
    tmp[1027] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[685], tmp[1027]);
    AddA(tmp[1027], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1027], a[762]); -- Ambassador of the Horde
    tmp[673] = cat:New(addon.GetMapName(26)); -- The Hinterlands
    AddC(tmp[687], tmp[673]);
    tmp[674] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[673], tmp[674]);
    AddA(tmp[674], a[4897]); -- Hinterlands Quests
    tmp[742] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[673], tmp[742]);
    AddA(tmp[742], a[773]); -- Explore The Hinterlands
    tmp[1024] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[673], tmp[1024]);
    AddA(tmp[1024], a[762]); -- Ambassador of the Horde
    tmp[667] = cat:New(addon.GetMapName(23)); -- Eastern Plaguelands
    AddC(tmp[687], tmp[667]);
    AddA(tmp[667], a[11297]); -- The Balance of Light and Shadow
    tmp[668] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[667], tmp[668]);
    AddA(tmp[668], a[4892]); -- Eastern Plaguelands Quests
    AddA(tmp[668], a[5442]); -- Full Caravan
    tmp[747] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[667], tmp[747]);
    AddA(tmp[747], a[771]); -- Explore Eastern Plaguelands
    AddA(tmp[747], a[9924]); -- Field Photographer
    tmp[778] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[667], tmp[778]);
    AddA(tmp[778], a[946]); -- The Argent Dawn
    AddA(tmp[778], a[945]); -- The Argent Champion
    tmp[659] = cat:New(addon.GetMapName(15)); -- Badlands
    AddC(tmp[687], tmp[659]);
    tmp[661] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[659], tmp[661]);
    AddA(tmp[661], a[4900]); -- Badlands Quests
    AddA(tmp[661], a[5444]); -- "Ready, Set, Goat!"
    tmp[738] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[659], tmp[738]);
    AddA(tmp[738], a[765]); -- Explore Badlands
    tmp[679] = cat:New(addon.GetMapName(32)); -- Searing Gorge
    AddC(tmp[687], tmp[679]);
    tmp[680] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[679], tmp[680]);
    AddA(tmp[680], a[4910]); -- Searing Gorge Quests
    tmp[743] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[679], tmp[743]);
    AddA(tmp[743], a[774]); -- Explore Searing Gorge
    tmp[683] = cat:New(addon.GetMapName(51)); -- Swamp of Sorrows
    AddC(tmp[687], tmp[683]);
    tmp[684] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[683], tmp[684]);
    AddA(tmp[684], a[4904]); -- Swamp of Sorrows Quests
    tmp[737] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[683], tmp[737]);
    AddA(tmp[737], a[782]); -- Explore Swamp of Sorrows
    tmp[1023] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[683], tmp[1023]);
    AddA(tmp[1023], a[948]); -- Ambassador of the Alliance
    tmp[663] = cat:New(addon.GetMapName(36)); -- Burning Steppes
    AddC(tmp[687], tmp[663]);
    AddA(tmp[663], a[11296]); -- The Ancient Keeper
    tmp[664] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[663], tmp[664]);
    AddA(tmp[664], a[4901]); -- Burning Steppes Quests
    tmp[745] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[663], tmp[745]);
    AddA(tmp[745], a[775]); -- Explore Burning Steppes
    AddA(tmp[745], a[9924]); -- Field Photographer
    tmp[660] = cat:New(addon.GetMapName(17)); -- Blasted Lands
    AddC(tmp[687], tmp[660]);
    AddA(tmp[660], a[9618]); -- The Iron Invasion
    AddA(tmp[660], a[11297]); -- The Balance of Light and Shadow
    tmp[662] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[660], tmp[662]);
    AddA(tmp[662], a[4909]); -- Blasted Lands Quests
    tmp[744] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[660], tmp[744]);
    AddA(tmp[744], a[766]); -- Explore Blasted Lands
    AddA(tmp[744], a[9924]); -- Field Photographer
    tmp[999] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[660], tmp[999]);
    AddA(tmp[999], a[948]); -- Ambassador of the Alliance
    AddA(tmp[999], a[762]); -- Ambassador of the Horde
    tmp[748] = cat:New(addon.GetMapName(42)); -- Deadwind Pass
    AddC(tmp[687], tmp[748]);
    tmp[749] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
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
    tmp[1018] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[921], tmp[1018]);
    AddA(tmp[1018], a[762]); -- Ambassador of the Horde
    tmp[923] = cat:New(addon.GetMapName(88)); -- Thunder Bluff
    AddC(tmp[688], tmp[923]);
    AddA(tmp[923], a[611]); -- Bleeding Bloodhoof
    AddA(tmp[923], a[604]); -- Wrath of the Alliance
    tmp[756] = cat:New(addon.GetMapName(57)); -- Teldrassil
    AddC(tmp[688], tmp[756]);
    tmp[757] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[756], tmp[757]);
    AddA(tmp[757], a[842]); -- Explore Teldrassil
    tmp[1025] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[756], tmp[1025]);
    AddA(tmp[1025], a[948]); -- Ambassador of the Alliance
    tmp[752] = cat:New(addon.GetMapName(1)); -- Durotar
    AddC(tmp[688], tmp[752]);
    AddA(tmp[752], a[4790]); -- Zalazane's Fall
    tmp[753] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[752], tmp[753]);
    AddA(tmp[753], a[728]); -- Explore Durotar
    AddA(tmp[753], a[9924]); -- Field Photographer
    tmp[1003] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[752], tmp[1003]);
    AddA(tmp[1003], a[762]); -- Ambassador of the Horde
    tmp[754] = cat:New(addon.GetMapName(7)); -- Mulgore
    AddC(tmp[688], tmp[754]);
    tmp[755] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[754], tmp[755]);
    AddA(tmp[755], a[736]); -- Explore Mulgore
    tmp[1014] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[754], tmp[1014]);
    AddA(tmp[1014], a[762]); -- Ambassador of the Horde
    tmp[774] = cat:New(addon.GetMapName(80)); -- Moonglade
    AddC(tmp[688], tmp[774]);
    tmp[775] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[774], tmp[775]);
    AddA(tmp[775], a[855]); -- Explore Moonglade
    AddA(tmp[775], a[9924]); -- Field Photographer
    tmp[705] = cat:New(addon.GetMapName(10)); -- Northern Barrens
    AddC(tmp[688], tmp[705]);
    AddA(tmp[705], a[11200]); -- Stand Against the Legion
    AddA(tmp[705], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[706] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[705], tmp[706]);
    AddA(tmp[706], a[4933]); -- Northern Barrens Quests
    tmp[760] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[705], tmp[760]);
    AddA(tmp[760], a[750]); -- Explore Northern Barrens
    tmp[1015] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[705], tmp[1015]);
    AddA(tmp[1015], a[762]); -- Ambassador of the Horde
    AddA(tmp[1015], a[2336]); -- Insane in the Membrane
    tmp[695] = cat:New(addon.GetMapName(62)); -- Darkshore
    AddC(tmp[688], tmp[695]);
    tmp[696] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[695], tmp[696]);
    AddA(tmp[696], a[4928]); -- Darkshore Quests
    AddA(tmp[696], a[5453]); -- Ghosts in the Dark
    tmp[762] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[695], tmp[762]);
    AddA(tmp[762], a[844]); -- Explore Darkshore
    tmp[1001] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[695], tmp[1001]);
    AddA(tmp[1001], a[948]); -- Ambassador of the Alliance
    tmp[691] = cat:New(addon.GetMapName(76)); -- Azshara
    AddC(tmp[688], tmp[691]);
    AddA(tmp[691], a[11200]); -- Stand Against the Legion
    AddA(tmp[691], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[692] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[691], tmp[692]);
    AddA(tmp[692], a[4927]); -- Azshara Quests
    AddA(tmp[692], a[5454]); -- Joy Ride
    AddA(tmp[692], a[5448]); -- Glutton for Fiery Punishment
    AddA(tmp[692], a[5546]); -- Glutton for Icy Punishment
    AddA(tmp[692], a[5547]); -- Glutton for Shadowy Punishment
    tmp[771] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[691], tmp[771]);
    AddA(tmp[771], a[852]); -- Explore Azshara
    tmp[990] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[691], tmp[990]);
    AddA(tmp[990], a[762]); -- Ambassador of the Horde
    tmp[689] = cat:New(addon.GetMapName(63)); -- Ashenvale
    AddC(tmp[688], tmp[689]);
    tmp[690] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[689], tmp[690]);
    AddA(tmp[690], a[4925]); -- Ashenvale Quests
    AddA(tmp[690], a[4976]); -- Ashenvale Quests
    tmp[764] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[689], tmp[764]);
    AddA(tmp[764], a[845]); -- Explore Ashenvale
    tmp[997] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[689], tmp[997]);
    AddA(tmp[997], a[948]); -- Ambassador of the Alliance
    tmp[709] = cat:New(addon.GetMapName(65)); -- Stonetalon Mountains
    AddC(tmp[688], tmp[709]);
    tmp[710] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[709], tmp[710]);
    AddA(tmp[710], a[4936]); -- Stonetalon Mountains Quests
    AddA(tmp[710], a[4980]); -- Stonetalon Mountains Quests
    tmp[766] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[709], tmp[766]);
    AddA(tmp[766], a[847]); -- Explore Stonetalon Mountains
    tmp[1021] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[709], tmp[1021]);
    AddA(tmp[1021], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1021], a[762]); -- Ambassador of the Horde
    tmp[697] = cat:New(addon.GetMapName(66)); -- Desolace
    AddC(tmp[688], tmp[697]);
    tmp[698] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[697], tmp[698]);
    AddA(tmp[698], a[4930]); -- Desolace Quests
    tmp[767] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[697], tmp[767]);
    AddA(tmp[767], a[848]); -- Explore Desolace
    tmp[1002] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[697], tmp[1002]);
    AddA(tmp[1002], a[762]); -- Ambassador of the Horde
    tmp[711] = cat:New(addon.GetMapName(199)); -- Southern Barrens
    AddC(tmp[688], tmp[711]);
    tmp[712] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[711], tmp[712]);
    AddA(tmp[712], a[4937]); -- Southern Barrens Quests
    AddA(tmp[712], a[4981]); -- Southern Barrens Quests
    tmp[761] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[711], tmp[761]);
    AddA(tmp[761], a[4996]); -- Explore Southern Barrens
    tmp[1019] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[711], tmp[1019]);
    AddA(tmp[1019], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1019], a[762]); -- Ambassador of the Horde
    tmp[703] = cat:New(addon.GetMapName(69)); -- Feralas
    AddC(tmp[688], tmp[703]);
    tmp[704] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[703], tmp[704]);
    AddA(tmp[704], a[4932]); -- Feralas Quests
    AddA(tmp[704], a[4979]); -- Feralas Quests
    tmp[769] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[703], tmp[769]);
    AddA(tmp[769], a[849]); -- Explore Feralas
    AddA(tmp[769], a[9924]); -- Field Photographer
    tmp[1009] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[703], tmp[1009]);
    AddA(tmp[1009], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1009], a[762]); -- Ambassador of the Horde
    tmp[699] = cat:New(addon.GetMapName(70)); -- Dustwallow Marsh
    AddC(tmp[688], tmp[699]);
    tmp[700] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[699], tmp[700]);
    AddA(tmp[700], a[4929]); -- Dustwallow Marsh Quests
    AddA(tmp[700], a[4978]); -- Dustwallow Marsh Quests
    tmp[768] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[699], tmp[768]);
    AddA(tmp[768], a[850]); -- Explore Dustwallow Marsh
    tmp[1004] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[699], tmp[1004]);
    AddA(tmp[1004], a[948]); -- Ambassador of the Alliance
    tmp[715] = cat:New(addon.GetMapName(64)); -- Thousand Needles
    AddC(tmp[688], tmp[715]);
    tmp[716] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[715], tmp[716]);
    AddA(tmp[716], a[4938]); -- Thousand Needles Quests
    tmp[765] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[715], tmp[765]);
    AddA(tmp[765], a[846]); -- Explore Thousand Needles
    tmp[994] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[715], tmp[994]);
    AddA(tmp[994], a[948]); -- Ambassador of the Alliance
    AddA(tmp[994], a[762]); -- Ambassador of the Horde
    tmp[713] = cat:New(addon.GetMapName(71)); -- Tanaris
    AddC(tmp[688], tmp[713]);
    AddA(tmp[713], a[11200]); -- Stand Against the Legion
    AddA(tmp[713], a[11201]); -- Defender of Azeroth: Legion Invasions
    tmp[714] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[713], tmp[714]);
    AddA(tmp[714], a[4935]); -- Tanaris Quests
    tmp[770] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[713], tmp[770]);
    AddA(tmp[770], a[851]); -- Explore Tanaris
    AddA(tmp[770], a[9924]); -- Field Photographer
    tmp[992] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[713], tmp[992]);
    AddA(tmp[992], a[948]); -- Ambassador of the Alliance
    AddA(tmp[992], a[762]); -- Ambassador of the Horde
    AddA(tmp[992], a[2336]); -- Insane in the Membrane
    tmp[701] = cat:New(addon.GetMapName(77)); -- Felwood
    AddC(tmp[688], tmp[701]);
    AddA(tmp[701], a[11296]); -- The Ancient Keeper
    tmp[702] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[701], tmp[702]);
    AddA(tmp[702], a[4931]); -- Felwood Quests
    tmp[772] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[701], tmp[772]);
    AddA(tmp[772], a[853]); -- Explore Felwood
    tmp[991] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[701], tmp[991]);
    AddA(tmp[991], a[948]); -- Ambassador of the Alliance
    AddA(tmp[991], a[762]); -- Ambassador of the Horde
    tmp[717] = cat:New(addon.GetMapName(78)); -- Un'Goro Crater
    AddC(tmp[688], tmp[717]);
    AddA(tmp[717], a[3357]); -- Venomhide Ravasaur
    AddA(tmp[717], a[11296]); -- The Ancient Keeper
    tmp[718] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[717], tmp[718]);
    AddA(tmp[718], a[4939]); -- Un'Goro Crater Quests
    tmp[773] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[717], tmp[773]);
    AddA(tmp[773], a[854]); -- Explore Un'Goro Crater
    AddA(tmp[773], a[9924]); -- Field Photographer
    tmp[707] = cat:New(addon.GetMapName(81)); -- Silithus
    AddC(tmp[688], tmp[707]);
    AddA(tmp[707], a[416]); -- Scarab Lord
    AddA(tmp[707], a[5533]); -- Veteran of the Shifting Sands
    AddA(tmp[707], a[11296]); -- The Ancient Keeper
    tmp[708] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[707], tmp[708]);
    AddA(tmp[708], a[4934]); -- Silithus Quests
    tmp[776] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[707], tmp[776]);
    AddA(tmp[776], a[856]); -- Explore Silithus
    AddA(tmp[776], a[9924]); -- Field Photographer
    tmp[783] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[707], tmp[783]);
    AddA(tmp[783], a[953]); -- Guardian of Cenarius
    tmp[719] = cat:New(addon.GetMapName(83)); -- Winterspring
    AddC(tmp[688], tmp[719]);
    AddA(tmp[719], a[3356]); -- Winterspring Frostsaber
    AddA(tmp[719], a[11296]); -- The Ancient Keeper
    tmp[720] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[719], tmp[720]);
    AddA(tmp[720], a[4940]); -- Winterspring Quests
    AddA(tmp[720], a[5443]); -- E'ko Madness
    tmp[777] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[719], tmp[777]);
    AddA(tmp[777], a[857]); -- Explore Winterspring
    tmp[1031] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[719], tmp[1031]);
    AddA(tmp[1031], a[2336]); -- Insane in the Membrane
    tmp[2] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[1], tmp[2]);
    AddA(tmp[2], a[1283]); -- Classic Dungeonmaster
    tmp[5] = cat:New((addon.EJ_GetInstanceInfo(226))); -- Ragefire Chasm
    AddC(tmp[2], tmp[5]);
    AddA(tmp[5], a[629]); -- Ragefire Chasm
    tmp[8] = cat:New((addon.EJ_GetInstanceInfo(240))); -- Wailing Caverns
    AddC(tmp[2], tmp[8]);
    AddA(tmp[8], a[630]); -- Wailing Caverns
    AddA(tmp[8], a[11765]); -- Pet Battle Challenge: Wailing Caverns
    tmp[10] = cat:New((addon.EJ_GetInstanceInfo(227))); -- Blackfathom Deeps
    AddC(tmp[2], tmp[10]);
    AddA(tmp[10], a[632]); -- Blackfathom Deeps
    tmp[11] = cat:New((addon.EJ_GetInstanceInfo(238))); -- The Stockade
    AddC(tmp[2], tmp[11]);
    AddA(tmp[11], a[633]); -- Stormwind Stockade
    tmp[12] = cat:New((addon.EJ_GetInstanceInfo(231))); -- Gnomeregan
    AddC(tmp[2], tmp[12]);
    AddA(tmp[12], a[634]); -- Gnomeregan
    AddA(tmp[12], a[13269]); -- Pet Battle Challenge: Gnomeregan
    tmp[13] = cat:New((addon.EJ_GetInstanceInfo(233))); -- Razorfen Kraul
    AddC(tmp[2], tmp[13]);
    AddA(tmp[13], a[635]); -- Razorfen Kraul
    tmp[14] = cat:New((addon.EJ_GetInstanceInfo(234))); -- Razorfen Downs
    AddC(tmp[2], tmp[14]);
    AddA(tmp[14], a[636]); -- Razorfen Downs
    tmp[17] = cat:New((addon.EJ_GetInstanceInfo(239))); -- Uldaman
    AddC(tmp[2], tmp[17]);
    AddA(tmp[17], a[638]); -- Uldaman
    tmp[18] = cat:New((addon.EJ_GetInstanceInfo(241))); -- Zul'Farrak
    AddC(tmp[2], tmp[18]);
    AddA(tmp[18], a[639]); -- Zul'Farrak
    tmp[19] = cat:New((addon.EJ_GetInstanceInfo(232))); -- Maraudon
    AddC(tmp[2], tmp[19]);
    AddA(tmp[19], a[640]); -- Maraudon
    tmp[20] = cat:New((addon.EJ_GetInstanceInfo(237))); -- The Temple Of Atal'hakkar
    AddC(tmp[2], tmp[20]);
    AddA(tmp[20], a[641]); -- Sunken Temple
    tmp[21] = cat:New((addon.EJ_GetInstanceInfo(228))); -- Blackrock Depths
    AddC(tmp[2], tmp[21]);
    AddA(tmp[21], a[642]); -- Blackrock Depths
    AddA(tmp[21], a[3496]); -- A Brew-FAST Mount
    AddA(tmp[21], a[14020]); -- Pet Battle Challenge: Blackrock Depths
    tmp[22] = cat:New((addon.EJ_GetInstanceInfo(229))); -- Lower Blackrock Spire
    AddC(tmp[2], tmp[22]);
    AddA(tmp[22], a[643]); -- Lower Blackrock Spire
    tmp[797] = cat:New((addon.EJ_GetInstanceInfo(559)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Upper Blackrock Spire
    AddC(tmp[2], tmp[797]);
    AddA(tmp[797], a[1307]); -- Upper Blackrock Spire (Classic)
    AddA(tmp[797], a[2188]); -- Leeeeeeeeeeeeeroy!
    tmp[23] = cat:New((addon.EJ_GetInstanceInfo(230))); -- Dire Maul
    AddC(tmp[2], tmp[23]);
    AddA(tmp[23], a[644]); -- King of Dire Maul
    AddA(tmp[23], a[5788]); -- Agent of the Shen'dralar
    tmp[25] = cat:New((addon.EJ_GetInstanceInfo(236))); -- Stratholme
    AddC(tmp[2], tmp[25]);
    AddA(tmp[25], a[646]); -- Stratholme
    AddA(tmp[25], a[729]); -- Deathcharger's Reins
    AddA(tmp[25], a[13627]); -- Pet Battle Challenge: Stratholme
    AddA(tmp[25], a[13766]); -- Malowned
    tmp[3] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[1], tmp[3]);
    AddA(tmp[3], a[1285]); -- Classic Raider
    tmp[7] = cat:New((addon.EJ_GetInstanceInfo(741))); -- Molten Core
    AddC(tmp[3], tmp[7]);
    AddA(tmp[7], a[686]); -- Molten Core
    AddA(tmp[7], a[11741]); -- So Hot Right Now
    AddA(tmp[7], a[429]); -- "Sulfuras, Hand of Ragnaros"
    AddA(tmp[7], a[428]); -- "Thunderfury, Blessed Blade of the Windseeker"
    AddA(tmp[7], a[9550]); -- "Boldly, You Sought the Power of Ragnaros"
    AddA(tmp[7], a[7934]); -- Raiding with Leashes
    AddA(tmp[7], a[11296]); -- The Ancient Keeper
    AddA(tmp[7], a[11297]); -- The Balance of Light and Shadow
    tmp[779] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[7], tmp[779]);
    AddA(tmp[779], a[955]); -- Hydraxian Waterlords
    AddA(tmp[779], a[2496]); -- The Fifth Element
    tmp[26] = cat:New((addon.EJ_GetInstanceInfo(760)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Onyxia's Lair
    AddC(tmp[3], tmp[26]);
    AddA(tmp[26], a[684]); -- Onyxia's Lair (Level 60)
    AddA(tmp[26], a[11296]); -- The Ancient Keeper
    tmp[27] = cat:New((addon.EJ_GetInstanceInfo(742))); -- Blackwing Lair
    AddC(tmp[3], tmp[27]);
    AddA(tmp[27], a[685]); -- Blackwing Lair
    AddA(tmp[27], a[11742]); -- Dress in Lairs
    AddA(tmp[27], a[7934]); -- Raiding with Leashes
    tmp[28] = cat:New((addon.EJ_GetInstanceInfo(76)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Zul'Gurub
    AddC(tmp[3], tmp[28]);
    AddA(tmp[28], a[560]); -- Deadliest Catch
    AddA(tmp[28], a[688]); -- Zul'Gurub
    AddA(tmp[28], a[880]); -- Swift Zulian Tiger
    AddA(tmp[28], a[881]); -- Swift Razzashi Raptor
    tmp[789] = cat:New((addon.GetCategoryInfo(201))); -- Reputation
    AddC(tmp[28], tmp[789]);
    AddA(tmp[789], a[957]); -- Hero of the Zandalar Tribe
    tmp[29] = cat:New((addon.EJ_GetInstanceInfo(743))); -- Ruins of Ahn'Qiraj
    AddC(tmp[3], tmp[29]);
    AddA(tmp[29], a[689]); -- Ruins of Ahn'Qiraj
    tmp[784] = cat:New((addon.GetCategoryInfo(201))); -- Reputation
    AddC(tmp[29], tmp[784]);
    AddA(tmp[784], a[953]); -- Guardian of Cenarius
    tmp[30] = cat:New((addon.EJ_GetInstanceInfo(744))); -- Temple of Ahn'Qiraj
    AddC(tmp[3], tmp[30]);
    AddA(tmp[30], a[687]); -- Temple of Ahn'Qiraj
    AddA(tmp[30], a[424]); -- Why? Because It's Red
    AddA(tmp[30], a[11743]); -- Accessor-Eyes
    AddA(tmp[30], a[7934]); -- Raiding with Leashes
    tmp[780] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[30], tmp[780]);
    AddA(tmp[780], a[956]); -- Brood of Nozdormu
    tmp[796] = cat:New((addon.EJ_GetInstanceInfo(754)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Naxxramas
    AddC(tmp[3], tmp[796]);
    AddA(tmp[796], a[11744]); -- "Drop Dead, Gorgeous"
    AddA(tmp[796], a[425]); -- "Atiesh, Greatstaff of the Guardian"
    tmp[785] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
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
    tmp[55] = cat:New((addon.GetCategoryInfo(14865))); -- The Burning Crusade
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
    tmp[759] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[758], tmp[759]);
    AddA(tmp[759], a[860]); -- Explore Azuremyst Isle
    tmp[998] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[758], tmp[998]);
    AddA(tmp[998], a[948]); -- Ambassador of the Alliance
    tmp[693] = cat:New(addon.GetMapName(106)); -- Bloodmyst Isle
    AddC(tmp[616], tmp[693]);
    tmp[694] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[693], tmp[694]);
    AddA(tmp[694], a[4926]); -- Bloodmyst Isle Quests
    tmp[763] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[693], tmp[763]);
    AddA(tmp[763], a[861]); -- Explore Bloodmyst Isle
    tmp[1000] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[693], tmp[1000]);
    AddA(tmp[1000], a[948]); -- Ambassador of the Alliance
    tmp[727] = cat:New(addon.GetMapName(94)); -- Eversong Woods
    AddC(tmp[616], tmp[727]);
    tmp[728] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[727], tmp[728]);
    AddA(tmp[728], a[859]); -- Explore Eversong Woods
    tmp[1008] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[727], tmp[1008]);
    AddA(tmp[1008], a[762]); -- Ambassador of the Horde
    tmp[669] = cat:New(addon.GetMapName(95)); -- Ghostlands
    AddC(tmp[616], tmp[669]);
    tmp[670] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[669], tmp[670]);
    AddA(tmp[670], a[4908]); -- Ghostlands Quests
    tmp[733] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[669], tmp[733]);
    AddA(tmp[733], a[858]); -- Explore Ghostlands
    tmp[1010] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[669], tmp[1010]);
    AddA(tmp[1010], a[762]); -- Ambassador of the Horde
    tmp[617] = cat:New(addon.GetMapName(100)); -- Hellfire Peninsula
    AddC(tmp[616], tmp[617]);
    tmp[624] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[617], tmp[624]);
    AddA(tmp[624], a[1189]); -- To Hellfire and Back
    AddA(tmp[624], a[1271]); -- To Hellfire and Back
    tmp[631] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[617], tmp[631]);
    AddA(tmp[631], a[862]); -- Explore Hellfire Peninsula
    AddA(tmp[631], a[9924]); -- Field Photographer
    tmp[1011] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[617], tmp[1011]);
    AddA(tmp[1011], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1011], a[762]); -- Ambassador of the Horde
    tmp[618] = cat:New(addon.GetMapName(102)); -- Zangarmarsh
    AddC(tmp[616], tmp[618]);
    tmp[625] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[618], tmp[625]);
    AddA(tmp[625], a[1190]); -- Mysteries of the Marsh
    tmp[632] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[618], tmp[632]);
    AddA(tmp[632], a[863]); -- Explore Zangarmarsh
    tmp[643] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
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
    tmp[626] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[619], tmp[626]);
    AddA(tmp[626], a[1191]); -- Terror of Terokkar
    AddA(tmp[626], a[1272]); -- Terror of Terokkar
    AddA(tmp[626], a[1275]); -- Bombs Away
    tmp[633] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[619], tmp[633]);
    AddA(tmp[633], a[867]); -- Explore Terokkar Forest
    tmp[642] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[619], tmp[642]);
    AddA(tmp[642], a[903]); -- Shattrath Divided
    AddA(tmp[642], a[1205]); -- Hero of Shattrath
    tmp[620] = cat:New(addon.GetMapName(107)); -- Nagrand
    AddC(tmp[616], tmp[620]);
    tmp[627] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[620], tmp[627]);
    AddA(tmp[627], a[1192]); -- Nagrand Slam
    AddA(tmp[627], a[1273]); -- Nagrand Slam
    AddA(tmp[627], a[939]); -- Hills Like White Elekk
    AddA(tmp[627], a[941]); -- Hemet Nesingwary: The Collected Quests
    AddA(tmp[627], a[1576]); -- Of Blood and Anguish
    AddA(tmp[627], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    tmp[634] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[620], tmp[634]);
    AddA(tmp[634], a[866]); -- Explore Nagrand
    tmp[641] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[620], tmp[641]);
    AddA(tmp[641], a[899]); -- "Oh My, Kurenai"
    AddA(tmp[641], a[901]); -- Mag'har of Draenor
    AddA(tmp[641], a[942]); -- The Diplomat
    AddA(tmp[641], a[943]); -- The Diplomat
    tmp[621] = cat:New(addon.GetMapName(105)); -- Blade's Edge Mountains
    AddC(tmp[616], tmp[621]);
    tmp[628] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[621], tmp[628]);
    AddA(tmp[628], a[1193]); -- On the Blade's Edge
    AddA(tmp[628], a[1276]); -- Blade's Edge Bomberman
    tmp[635] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[621], tmp[635]);
    AddA(tmp[635], a[865]); -- Explore Blade's Edge Mountains
    tmp[640] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[621], tmp[640]);
    AddA(tmp[640], a[896]); -- A Quest a Day Keeps the Ogres at Bay
    tmp[622] = cat:New(addon.GetMapName(109)); -- Netherstorm
    AddC(tmp[616], tmp[622]);
    tmp[629] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[622], tmp[629]);
    AddA(tmp[629], a[1194]); -- Into the Nether
    tmp[636] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[622], tmp[636]);
    AddA(tmp[636], a[843]); -- Explore Netherstorm
    AddA(tmp[636], a[9924]); -- Field Photographer
    tmp[623] = cat:New(addon.GetMapName(104)); -- Shadowmoon Valley
    AddC(tmp[616], tmp[623]);
    tmp[630] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[623], tmp[630]);
    AddA(tmp[630], a[1195]); -- Shadow of the Betrayer
    tmp[637] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[623], tmp[637]);
    AddA(tmp[637], a[864]); -- Explore Shadowmoon Valley
    tmp[638] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[623], tmp[638]);
    AddA(tmp[638], a[898]); -- On Wings of Nether
    AddA(tmp[638], a[1638]); -- Skyshattered
    tmp[750] = cat:New(addon.GetMapName(122)); -- Isle of Quel'Danas
    AddC(tmp[616], tmp[750]);
    tmp[751] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[750], tmp[751]);
    AddA(tmp[751], a[868]); -- Explore Isle of Quel'Danas
    tmp[56] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[55], tmp[56]);
    AddA(tmp[56], a[1284]); -- Outland Dungeonmaster
    AddA(tmp[56], a[1287]); -- Outland Dungeon Hero
    tmp[57] = cat:New((addon.EJ_GetInstanceInfo(248))); -- Hellfire Ramparts
    AddC(tmp[56], tmp[57]);
    AddA(tmp[57], a[647]); -- Hellfire Ramparts
    AddA(tmp[57], a[667]); -- Heroic: Hellfire Ramparts
    tmp[58] = cat:New((addon.EJ_GetInstanceInfo(256))); -- The Blood Furnace
    AddC(tmp[56], tmp[58]);
    AddA(tmp[58], a[648]); -- The Blood Furnace
    AddA(tmp[58], a[668]); -- Heroic: The Blood Furnace
    tmp[59] = cat:New((addon.EJ_GetInstanceInfo(259))); -- The Shattered Halls
    AddC(tmp[56], tmp[59]);
    AddA(tmp[59], a[657]); -- The Shattered Halls
    AddA(tmp[59], a[678]); -- Heroic: The Shattered Halls
    tmp[60] = cat:New((addon.EJ_GetInstanceInfo(260))); -- The Slave Pens
    AddC(tmp[56], tmp[60]);
    AddA(tmp[60], a[649]); -- The Slave Pens
    AddA(tmp[60], a[669]); -- Heroic: The Slave Pens
    tmp[61] = cat:New((addon.EJ_GetInstanceInfo(262))); -- The Underbog
    AddC(tmp[56], tmp[61]);
    AddA(tmp[61], a[650]); -- Underbog
    AddA(tmp[61], a[670]); -- Heroic: Underbog
    tmp[62] = cat:New((addon.EJ_GetInstanceInfo(261))); -- The Steamvault
    AddC(tmp[56], tmp[62]);
    AddA(tmp[62], a[656]); -- The Steamvault
    AddA(tmp[62], a[677]); -- Heroic: The Steamvault
    tmp[63] = cat:New((addon.EJ_GetInstanceInfo(250))); -- Mana-Tombs
    AddC(tmp[56], tmp[63]);
    AddA(tmp[63], a[651]); -- Mana-Tombs
    AddA(tmp[63], a[671]); -- Heroic: Mana-Tombs
    tmp[64] = cat:New((addon.EJ_GetInstanceInfo(247))); -- Auchenai Crypts
    AddC(tmp[56], tmp[64]);
    AddA(tmp[64], a[666]); -- Auchenai Crypts
    AddA(tmp[64], a[672]); -- Heroic: Auchenai Crypts
    tmp[65] = cat:New((addon.EJ_GetInstanceInfo(252))); -- Sethekk Halls
    AddC(tmp[56], tmp[65]);
    AddA(tmp[65], a[653]); -- Sethekk Halls
    AddA(tmp[65], a[674]); -- Heroic: Sethekk Halls
    AddA(tmp[65], a[883]); -- Reins of the Raven Lord
    tmp[66] = cat:New((addon.EJ_GetInstanceInfo(253))); -- Shadow Labyrinth
    AddC(tmp[56], tmp[66]);
    AddA(tmp[66], a[654]); -- Shadow Labyrinth
    AddA(tmp[66], a[675]); -- Heroic: Shadow Labyrinth
    tmp[67] = cat:New((addon.EJ_GetInstanceInfo(251))); -- Old Hillsbrad Foothills
    AddC(tmp[56], tmp[67]);
    AddA(tmp[67], a[652]); -- The Escape From Durnholde
    AddA(tmp[67], a[673]); -- Heroic: The Escape From Durnholde
    tmp[68] = cat:New((addon.EJ_GetInstanceInfo(255))); -- The Black Morass
    AddC(tmp[56], tmp[68]);
    AddA(tmp[68], a[655]); -- Opening of the Dark Portal
    AddA(tmp[68], a[676]); -- Heroic: Opening of the Dark Portal
    tmp[69] = cat:New((addon.EJ_GetInstanceInfo(258))); -- The Mechanar
    AddC(tmp[56], tmp[69]);
    AddA(tmp[69], a[658]); -- The Mechanar
    AddA(tmp[69], a[679]); -- Heroic: The Mechanar
    tmp[70] = cat:New((addon.EJ_GetInstanceInfo(257))); -- The Botanica
    AddC(tmp[56], tmp[70]);
    AddA(tmp[70], a[659]); -- The Botanica
    AddA(tmp[70], a[680]); -- Heroic: The Botanica
    tmp[71] = cat:New((addon.EJ_GetInstanceInfo(254))); -- The Arcatraz
    AddC(tmp[56], tmp[71]);
    AddA(tmp[71], a[660]); -- The Arcatraz
    AddA(tmp[71], a[681]); -- Heroic: The Arcatraz
    tmp[72] = cat:New((addon.EJ_GetInstanceInfo(249))); -- Magisters Terrace
    AddC(tmp[56], tmp[72]);
    AddA(tmp[72], a[661]); -- Magister's Terrace
    AddA(tmp[72], a[682]); -- Heroic: Magister's Terrace
    AddA(tmp[72], a[884]); -- Swift White Hawkstrider
    tmp[73] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[55], tmp[73]);
    AddA(tmp[73], a[1286]); -- Outland Raider
    AddA(tmp[73], a[432]); -- Champion of the Naaru
    AddA(tmp[73], a[431]); -- Hand of A'dal
    tmp[74] = cat:New((addon.EJ_GetInstanceInfo(745))); -- Karazhan
    AddC(tmp[73], tmp[74]);
    AddA(tmp[74], a[690]); -- Karazhan
    AddA(tmp[74], a[882]); -- Fiery Warhorse's Reins
    AddA(tmp[74], a[11746]); -- Outlandish Style
    AddA(tmp[74], a[2456]); -- Vampire Hunter
    AddA(tmp[74], a[8293]); -- Raiding with Leashes II: Attunement Edition
    AddA(tmp[74], a[9924]); -- Field Photographer
    tmp[647] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[74], tmp[647]);
    AddA(tmp[647], a[960]); -- The Violet Eye
    tmp[75] = cat:New((addon.EJ_GetInstanceInfo(746))); -- Gruul's Lair
    AddC(tmp[73], tmp[75]);
    AddA(tmp[75], a[692]); -- Gruul's Lair
    AddA(tmp[75], a[11746]); -- Outlandish Style
    tmp[76] = cat:New((addon.EJ_GetInstanceInfo(747))); -- Magtheridon's Lair
    AddC(tmp[73], tmp[76]);
    AddA(tmp[76], a[693]); -- Magtheridon's Lair
    AddA(tmp[76], a[11746]); -- Outlandish Style
    tmp[77] = cat:New((addon.EJ_GetInstanceInfo(748))); -- Serpentshrine Cavern
    AddC(tmp[73], tmp[77]);
    AddA(tmp[77], a[694]); -- Serpentshrine Cavern
    AddA(tmp[77], a[11747]); -- Merely a Set
    AddA(tmp[77], a[8293]); -- Raiding with Leashes II: Attunement Edition
    tmp[78] = cat:New((addon.EJ_GetInstanceInfo(749))); -- The Eye
    AddC(tmp[73], tmp[78]);
    AddA(tmp[78], a[696]); -- Tempest Keep
    AddA(tmp[78], a[885]); -- Ashes of Al'ar
    AddA(tmp[78], a[8293]); -- Raiding with Leashes II: Attunement Edition
    tmp[79] = cat:New((addon.EJ_GetInstanceInfo(750))); -- The Battle for Mount Hyjal
    AddC(tmp[73], tmp[79]);
    AddA(tmp[79], a[695]); -- The Battle for Mount Hyjal
    AddA(tmp[79], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[646] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[79], tmp[646]);
    AddA(tmp[646], a[959]); -- The Scale of the Sands
    tmp[80] = cat:New((addon.EJ_GetInstanceInfo(751))); -- Black Temple
    AddC(tmp[73], tmp[80]);
    AddA(tmp[80], a[697]); -- The Black Temple
    AddA(tmp[80], a[11748]); -- Black is the New Black
    AddA(tmp[80], a[9016]); -- Breaker of the Black Harvest
    AddA(tmp[80], a[426]); -- Warglaives of Azzinoth
    AddA(tmp[80], a[11869]); -- I'll Hold These For You Until You Get Out
    AddA(tmp[80], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[645] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[80], tmp[645]);
    AddA(tmp[645], a[958]); -- Sworn to the Deathsworn
    tmp[81] = cat:New((addon.EJ_GetInstanceInfo(77)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Zul'Aman
    AddC(tmp[73], tmp[81]);
    AddA(tmp[81], a[691]); -- Zul'Aman
    AddA(tmp[81], a[430]); -- Amani War Bear
    tmp[82] = cat:New((addon.EJ_GetInstanceInfo(752))); -- Sunwell Plateau
    AddC(tmp[73], tmp[82]);
    AddA(tmp[82], a[698]); -- Sunwell Plateau
    AddA(tmp[82], a[11749]); -- "Suns Out, Thori'dals Out"
    AddA(tmp[82], a[725]); -- "Thori'dal, the Stars' Fury"
    AddA(tmp[82], a[9824]); -- Raiding with Leashes III: Drinkin' From the Sunwell
    tmp[786] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
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
    tmp[83] = cat:New((addon.GetCategoryInfo(14866))); -- Wrath of the Lich King
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
    tmp[586] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[578], tmp[586]);
    AddA(tmp[586], a[33]); -- Nothing Boring About Borean
    AddA(tmp[586], a[1358]); -- Nothing Boring About Borean
    AddA(tmp[586], a[561]); -- D.E.H.T.A's Little P.I.T.A.
    tmp[587] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[578], tmp[587]);
    AddA(tmp[587], a[1264]); -- Explore Borean Tundra
    tmp[588] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[578], tmp[588]);
    AddA(tmp[588], a[949]); -- Tuskarrmageddon
    tmp[579] = cat:New(addon.GetMapName(117)); -- Howling Fjord
    AddC(tmp[577], tmp[579]);
    tmp[589] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[579], tmp[589]);
    AddA(tmp[589], a[34]); -- I've Toured the Fjord
    AddA(tmp[589], a[1356]); -- I've Toured the Fjord
    tmp[590] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[579], tmp[590]);
    AddA(tmp[590], a[1263]); -- Explore Howling Fjord
    AddA(tmp[590], a[1254]); -- Friend or Fowl?
    AddA(tmp[590], a[9924]); -- Field Photographer
    tmp[580] = cat:New(addon.GetMapName(115)); -- Dragonblight
    AddC(tmp[577], tmp[580]);
    tmp[592] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[580], tmp[592]);
    AddA(tmp[592], a[35]); -- Might of Dragonblight
    AddA(tmp[592], a[1359]); -- Might of Dragonblight
    AddA(tmp[592], a[547]); -- Veteran of the Wrathgate
    AddA(tmp[592], a[1277]); -- Rapid Defense
    tmp[593] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[580], tmp[593]);
    AddA(tmp[593], a[1265]); -- Explore Dragonblight
    AddA(tmp[593], a[9924]); -- Field Photographer
    tmp[594] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[580], tmp[594]);
    AddA(tmp[594], a[1007]); -- The Wyrmrest Accord
    tmp[581] = cat:New(addon.GetMapName(116)); -- Grizzly Hills
    AddC(tmp[577], tmp[581]);
    tmp[595] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[581], tmp[595]);
    AddA(tmp[595], a[37]); -- Fo' Grizzle My Shizzle
    AddA(tmp[595], a[1357]); -- Fo' Grizzle My Shizzle
    tmp[596] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[581], tmp[596]);
    AddA(tmp[596], a[1266]); -- Explore Grizzly Hills
    tmp[782] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[581], tmp[782]);
    AddA(tmp[782], a[2016]); -- Grizzled Veteran
    AddA(tmp[782], a[2017]); -- Grizzled Veteran
    tmp[582] = cat:New(addon.GetMapName(121)); -- Zul'Drak
    AddC(tmp[577], tmp[582]);
    tmp[598] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[582], tmp[598]);
    AddA(tmp[598], a[36]); -- The Empire of Zul'Drak
    AddA(tmp[598], a[1596]); -- Guru of Drakuru
    AddA(tmp[598], a[1576]); -- Of Blood and Anguish
    AddA(tmp[598], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    tmp[599] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[582], tmp[599]);
    AddA(tmp[599], a[1267]); -- Explore Zul'Drak
    tmp[583] = cat:New(addon.GetMapName(119)); -- Sholazar Basin
    AddC(tmp[577], tmp[583]);
    tmp[601] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[583], tmp[601]);
    AddA(tmp[601], a[39]); -- Into the Basin
    AddA(tmp[601], a[961]); -- Honorary Frenzyheart
    AddA(tmp[601], a[962]); -- Savior of the Oracles
    AddA(tmp[601], a[938]); -- The Snows of Northrend
    AddA(tmp[601], a[941]); -- Hemet Nesingwary: The Collected Quests
    tmp[602] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[583], tmp[602]);
    AddA(tmp[602], a[1268]); -- Explore Sholazar Basin
    tmp[603] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
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
    tmp[604] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[584], tmp[604]);
    AddA(tmp[604], a[38]); -- The Summit of Storm Peaks
    AddA(tmp[604], a[1428]); -- Mine Sweeper
    tmp[612] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[584], tmp[612]);
    AddA(tmp[612], a[1269]); -- Explore Storm Peaks
    tmp[606] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[584], tmp[606]);
    AddA(tmp[606], a[2082]); -- Ice Mammoth
    AddA(tmp[606], a[2083]); -- Grand Ice Mammoth
    tmp[585] = cat:New(addon.GetMapName(118)); -- Icecrown
    AddC(tmp[577], tmp[585]);
    AddA(tmp[585], a[14750]); -- Death Rising
    tmp[607] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[585], tmp[607]);
    AddA(tmp[607], a[40]); -- Icecrown: The Final Goal
    tmp[608] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[585], tmp[608]);
    AddA(tmp[608], a[1270]); -- Explore Icecrown
    tmp[609] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[585], tmp[609]);
    AddA(tmp[609], a[947]); -- The Argent Crusade
    AddA(tmp[609], a[945]); -- The Argent Champion
    tmp[1034] = cat:New(addon.GetMapName(123)); -- Wintergrasp
    AddC(tmp[577], tmp[1034]);
    AddA(tmp[1034], a[9924]); -- Field Photographer
    tmp[84] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
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
    tmp[86] = cat:New((addon.EJ_GetInstanceInfo(285))); -- Utgarde Keep
    AddC(tmp[84], tmp[86]);
    AddA(tmp[86], a[1919]); -- On The Rocks
    AddA(tmp[86], a[477]); -- Utgarde Keep
    AddA(tmp[86], a[489]); -- Heroic: Utgarde Keep
    tmp[87] = cat:New((addon.EJ_GetInstanceInfo(281))); -- The Nexus
    AddC(tmp[84], tmp[87]);
    AddA(tmp[87], a[2150]); -- Split Personality
    AddA(tmp[87], a[2037]); -- Chaos Theory
    AddA(tmp[87], a[2036]); -- Intense Cold
    AddA(tmp[87], a[478]); -- The Nexus
    AddA(tmp[87], a[490]); -- Heroic: The Nexus
    tmp[88] = cat:New((addon.EJ_GetInstanceInfo(272))); -- Azjol-Nerub
    AddC(tmp[84], tmp[88]);
    AddA(tmp[88], a[1296]); -- Watch Him Die
    AddA(tmp[88], a[1297]); -- Hadronox Denied
    AddA(tmp[88], a[1860]); -- Gotta Go!
    AddA(tmp[88], a[480]); -- Azjol-Nerub
    AddA(tmp[88], a[491]); -- Heroic: Azjol-Nerub
    tmp[89] = cat:New((addon.EJ_GetInstanceInfo(271))); -- Ahn'kahet: The Old Kingdom
    AddC(tmp[84], tmp[89]);
    AddA(tmp[89], a[2038]); -- Respect Your Elders
    AddA(tmp[89], a[2056]); -- Volunteer Work
    AddA(tmp[89], a[1862]); -- Volazj's Quick Demise
    AddA(tmp[89], a[481]); -- Ahn'kahet: The Old Kingdom
    AddA(tmp[89], a[492]); -- Heroic: Ahn'kahet: The Old Kingdom
    tmp[90] = cat:New((addon.EJ_GetInstanceInfo(273))); -- Drak'Tharon Keep
    AddC(tmp[84], tmp[90]);
    AddA(tmp[90], a[2151]); -- Consumption Junction
    AddA(tmp[90], a[2057]); -- Oh Novos!
    AddA(tmp[90], a[2039]); -- Better Off Dred
    AddA(tmp[90], a[482]); -- Drak'Tharon Keep
    AddA(tmp[90], a[493]); -- Heroic: Drak'Tharon Keep
    tmp[91] = cat:New((addon.EJ_GetInstanceInfo(283))); -- The Violet Hold
    AddC(tmp[84], tmp[91]);
    AddA(tmp[91], a[1865]); -- Lockdown!
    AddA(tmp[91], a[2041]); -- Dehydration
    AddA(tmp[91], a[2153]); -- A Void Dance
    AddA(tmp[91], a[1816]); -- Defenseless
    AddA(tmp[91], a[483]); -- The Violet Hold
    AddA(tmp[91], a[494]); -- Heroic: The Violet Hold
    tmp[92] = cat:New((addon.EJ_GetInstanceInfo(274))); -- Gundrak
    AddC(tmp[84], tmp[92]);
    AddA(tmp[92], a[2058]); -- Snakes. Why'd It Have To Be Snakes?
    AddA(tmp[92], a[2040]); -- Less-rabi
    AddA(tmp[92], a[1864]); -- What the Eck?
    AddA(tmp[92], a[2152]); -- Share The Love
    AddA(tmp[92], a[484]); -- Gundrak
    AddA(tmp[92], a[495]); -- Heroic: Gundrak
    tmp[93] = cat:New((addon.EJ_GetInstanceInfo(277))); -- Halls of Stone
    AddC(tmp[84], tmp[93]);
    AddA(tmp[93], a[1866]); -- Good Grief
    AddA(tmp[93], a[2154]); -- Brann Spankin' New
    AddA(tmp[93], a[2155]); -- Abuse the Ooze
    AddA(tmp[93], a[485]); -- Halls of Stone
    AddA(tmp[93], a[496]); -- Heroic: Halls of Stone
    tmp[94] = cat:New((addon.EJ_GetInstanceInfo(275))); -- Halls of Lightning
    AddC(tmp[84], tmp[94]);
    AddA(tmp[94], a[1834]); -- Lightning Struck
    AddA(tmp[94], a[2042]); -- Shatter Resistant
    AddA(tmp[94], a[1867]); -- Timely Death
    AddA(tmp[94], a[486]); -- Halls of Lightning
    AddA(tmp[94], a[497]); -- Heroic: Halls of Lightning
    tmp[95] = cat:New((addon.EJ_GetInstanceInfo(282))); -- The Oculus
    AddC(tmp[84], tmp[95]);
    AddA(tmp[95], a[1868]); -- Make It Count
    AddA(tmp[95], a[2046]); -- Amber Void
    AddA(tmp[95], a[2045]); -- Emerald Void
    AddA(tmp[95], a[2044]); -- Ruby Void
    AddA(tmp[95], a[1871]); -- Experienced Drake Rider
    AddA(tmp[95], a[487]); -- The Oculus
    AddA(tmp[95], a[498]); -- Heroic: The Oculus
    tmp[97] = cat:New((addon.EJ_GetInstanceInfo(286))); -- Utgarde Pinnacle
    AddC(tmp[84], tmp[97]);
    AddA(tmp[97], a[2043]); -- The Incredible Hulk
    AddA(tmp[97], a[1873]); -- Lodi Dodi We Loves the Skadi
    AddA(tmp[97], a[2156]); -- My Girl Loves to Skadi All the Time
    AddA(tmp[97], a[2157]); -- King's Bane
    AddA(tmp[97], a[488]); -- Utgarde Pinnacle
    AddA(tmp[97], a[499]); -- Heroic: Utgarde Pinnacle
    tmp[96] = cat:New((addon.EJ_GetInstanceInfo(279))); -- The Culling of Stratholme
    AddC(tmp[84], tmp[96]);
    AddA(tmp[96], a[1872]); -- Zombiefest!
    AddA(tmp[96], a[1817]); -- The Culling of Time
    AddA(tmp[96], a[479]); -- The Culling of Stratholme
    AddA(tmp[96], a[500]); -- Heroic: The Culling of Stratholme
    tmp[98] = cat:New((addon.EJ_GetInstanceInfo(284))); -- Trial of the Champion
    AddC(tmp[84], tmp[98]);
    AddA(tmp[98], a[3803]); -- The Faceroller
    AddA(tmp[98], a[3802]); -- Argent Confessor
    AddA(tmp[98], a[3804]); -- I've Had Worse
    AddA(tmp[98], a[4296]); -- Trial of the Champion
    AddA(tmp[98], a[3778]); -- Trial of the Champion
    AddA(tmp[98], a[4298]); -- Heroic: Trial of the Champion
    AddA(tmp[98], a[4297]); -- Heroic: Trial of the Champion
    tmp[99] = cat:New((addon.EJ_GetInstanceInfo(280))); -- The Forge of Souls
    AddC(tmp[84], tmp[99]);
    AddA(tmp[99], a[4522]); -- Soul Power
    AddA(tmp[99], a[4523]); -- Three Faced
    AddA(tmp[99], a[4516]); -- The Forge of Souls
    AddA(tmp[99], a[4519]); -- Heroic: The Forge of Souls
    tmp[100] = cat:New((addon.EJ_GetInstanceInfo(278))); -- Pit of Saron
    AddC(tmp[84], tmp[100]);
    AddA(tmp[100], a[4524]); -- Doesn't Go to Eleven
    AddA(tmp[100], a[4525]); -- Don't Look Up
    AddA(tmp[100], a[4517]); -- The Pit of Saron
    AddA(tmp[100], a[4520]); -- Heroic: The Pit of Saron
    tmp[101] = cat:New((addon.EJ_GetInstanceInfo(276))); -- Halls of Reflection
    AddC(tmp[84], tmp[101]);
    AddA(tmp[101], a[4526]); -- We're Not Retreating; We're Advancing in a Different Direction.
    AddA(tmp[101], a[4518]); -- The Halls of Reflection
    AddA(tmp[101], a[4521]); -- Heroic: The Halls of Reflection
    tmp[85] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[83], tmp[85]);
    AddA(tmp[85], a[1658]); -- Champion of the Frozen Wastes
    AddA(tmp[85], a[2137]); -- Glory of the Raider (10 player)
    AddA(tmp[85], a[2138]); -- Glory of the Raider (25 player)
    AddA(tmp[85], a[12401]); -- Glory of the Ulduar Raider
    AddA(tmp[85], a[4602]); -- Glory of the Icecrown Raider (10 player)
    AddA(tmp[85], a[4603]); -- Glory of the Icecrown Raider (25 player)
    AddA(tmp[85], a[2957]); -- Glory of the Ulduar Raider (10 player)
    AddA(tmp[85], a[2958]); -- Glory of the Ulduar Raider (25 player)
    tmp[102] = cat:New((addon.EJ_GetInstanceInfo(753))); -- Vault of Archavon
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
    tmp[105] = cat:New((addon.EJ_GetInstanceInfo(754))); -- Naxxramas
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
    tmp[108] = cat:New((addon.EJ_GetInstanceInfo(755))); -- The Obsidian Sanctum
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
    tmp[111] = cat:New((addon.EJ_GetInstanceInfo(756))); -- The Eye of Eternity
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
    tmp[114] = cat:New((addon.EJ_GetInstanceInfo(759))); -- Ulduar
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
    tmp[115] = cat:New((GetDifficultyInfo(3)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Ulduar 10
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
    tmp[116] = cat:New((GetDifficultyInfo(4)) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Ulduar 25
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
    tmp[117] = cat:New((addon.EJ_GetInstanceInfo(757))); -- Trial of the Crusader
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
    tmp[120] = cat:New((addon.EJ_GetInstanceInfo(760))); -- Onyxia's Lair
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
    tmp[123] = cat:New((addon.EJ_GetInstanceInfo(758))); -- Icecrown Citadel
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
    tmp[615] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[123], tmp[615]);
    AddA(tmp[615], a[4598]); -- The Ashen Verdict
    tmp[126] = cat:New((addon.EJ_GetInstanceInfo(761))); -- The Ruby Sanctum
    AddC(tmp[85], tmp[126]);
    tmp[127] = cat:New((GetDifficultyInfo(3))); -- The Ruby Sanctum 10
    AddC(tmp[126], tmp[127]);
    AddA(tmp[127], a[4817]); -- The Twilight Destroyer (10 player)
    AddA(tmp[127], a[4818]); -- Heroic: The Twilight Destroyer (10 player)
    tmp[128] = cat:New((GetDifficultyInfo(4))); -- The Ruby Sanctum 25
    AddC(tmp[126], tmp[128]);
    AddA(tmp[128], a[4815]); -- The Twilight Destroyer (25 player)
    AddA(tmp[128], a[4816]); -- Heroic: The Twilight Destroyer (25 player)
    tmp[787] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
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
    tmp[1138] = cat:New((addon.GetCategoryInfo(14901))); -- Wintergrasp
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
    tmp[781] = cat:New((addon.GetCategoryInfo(14941))); -- Argent Tournament
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
    tmp[129] = cat:New((addon.GetCategoryInfo(15072))); -- Cataclysm
    AddC(tmp[883], tmp[129]);
    AddA(tmp[129], a[4887]); -- Tripping the Rifts
    tmp[550] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[129], tmp[550]);
    AddA(tmp[550], a[4875]); -- Loremaster of Cataclysm
    AddA(tmp[550], a[4827]); -- Surveying the Damage
    AddA(tmp[550], a[5548]); -- To All the Squirrels Who Cared for Me
    AddA(tmp[550], a[5754]); -- Drown Your Sorrows
    AddA(tmp[550], a[5753]); -- Cataclysmically Delicious
    AddA(tmp[550], a[4868]); -- Cataclysm Explorer
    AddA(tmp[550], a[4881]); -- The Earthen Ring
    AddA(tmp[550], a[7520]); -- The Loremaster
    tmp[551] = cat:New(addon.GetMapName(203)); -- Vashj'ir
    AddC(tmp[550], tmp[551]);
    tmp[557] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[551], tmp[557]);
    AddA(tmp[557], a[4869]); -- Sinking into Vashj'ir
    AddA(tmp[557], a[4982]); -- Sinking into Vashj'ir
    AddA(tmp[557], a[5452]); -- Visions of Vashj'ir Past
    AddA(tmp[557], a[5318]); -- "20,000 Leagues Under the Sea"
    AddA(tmp[557], a[5319]); -- "20,000 Leagues Under the Sea"
    tmp[564] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[551], tmp[564]);
    AddA(tmp[564], a[4825]); -- Explore Vashj'ir
    AddA(tmp[564], a[4975]); -- From Hell's Heart I Stab at Thee
    AddA(tmp[564], a[9924]); -- Field Photographer
    tmp[552] = cat:New(addon.GetMapName(198)); -- Mount Hyjal
    AddC(tmp[550], tmp[552]);
    tmp[558] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[552], tmp[558]);
    AddA(tmp[558], a[4870]); -- Coming Down the Mountain
    AddA(tmp[558], a[4959]); -- Beware of the 'Unbeatable?' Pterodactyl
    AddA(tmp[558], a[5860]); -- The 'Unbeatable?' Pterodactyl: BEATEN.
    AddA(tmp[558], a[5483]); -- Bounce
    AddA(tmp[558], a[5859]); -- Legacy of Leyara
    AddA(tmp[558], a[5866]); -- The Molten Front Offensive
    AddA(tmp[558], a[5861]); -- The Fiery Lords of Sethria's Roost
    AddA(tmp[558], a[5870]); -- Fireside Chat
    AddA(tmp[558], a[5862]); -- Ludicrous Speed
    AddA(tmp[558], a[5868]); -- And the Meek Shall Inherit Kalimdor
    AddA(tmp[558], a[5864]); -- Gang War
    AddA(tmp[558], a[5865]); -- Have... Have We Met?
    AddA(tmp[558], a[5869]); -- Infernal Ambassadors
    AddA(tmp[558], a[5879]); -- Veteran of the Molten Front
    tmp[565] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[552], tmp[565]);
    AddA(tmp[565], a[4863]); -- Explore Hyjal
    AddA(tmp[565], a[9924]); -- Field Photographer
    tmp[571] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[552], tmp[571]);
    AddA(tmp[571], a[4882]); -- The Guardians of Hyjal
    tmp[553] = cat:New(addon.GetMapName(207)); -- Deepholm
    AddC(tmp[550], tmp[553]);
    tmp[559] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[553], tmp[559]);
    AddA(tmp[559], a[4871]); -- Deep into Deepholm
    AddA(tmp[559], a[5445]); -- Fungalophobia
    AddA(tmp[559], a[5446]); -- The Glop Family Line
    AddA(tmp[559], a[5449]); -- Rock Lover
    AddA(tmp[559], a[5450]); -- Fungal Frenzy
    AddA(tmp[559], a[5447]); -- My Very Own Broodmother
    tmp[566] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[553], tmp[566]);
    AddA(tmp[566], a[4864]); -- Explore Deepholm
    AddA(tmp[566], a[9924]); -- Field Photographer
    tmp[572] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[553], tmp[572]);
    AddA(tmp[572], a[4883]); -- Therazane
    tmp[554] = cat:New(addon.GetMapName(249)); -- Uldum
    AddC(tmp[550], tmp[554]);
    AddA(tmp[554], a[5767]); -- Scourer of the Eternal Sands
    AddA(tmp[554], a[4888]); -- One Hump or Two?
    tmp[560] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[554], tmp[560]);
    AddA(tmp[560], a[4872]); -- Unearthing Uldum
    AddA(tmp[560], a[4961]); -- In a Thousand Years Even You Might be Worth Something
    AddA(tmp[560], a[5317]); -- Help the Bombardier! I'm the Bombardier!
    tmp[567] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[554], tmp[567]);
    AddA(tmp[567], a[4865]); -- Explore Uldum
    tmp[574] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[554], tmp[574]);
    AddA(tmp[574], a[4884]); -- Ramkahen
    tmp[555] = cat:New(addon.GetMapName(241)); -- Twilight Highlands
    AddC(tmp[550], tmp[555]);
    tmp[561] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[555], tmp[561]);
    AddA(tmp[561], a[4873]); -- Fading into Twilight
    AddA(tmp[561], a[5501]); -- Fading into Twilight
    AddA(tmp[561], a[4960]); -- Round Three. Fight!
    AddA(tmp[561], a[5481]); -- Wildhammer Tour of Duty
    AddA(tmp[561], a[5482]); -- Dragonmaw Tour of Duty
    AddA(tmp[561], a[5320]); -- King of the Mountain
    AddA(tmp[561], a[5321]); -- King of the Mountain
    AddA(tmp[561], a[5451]); -- Consumed by Nightmare
    AddA(tmp[561], a[4958]); -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    tmp[568] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[555], tmp[568]);
    AddA(tmp[568], a[4866]); -- Explore Twilight Highlands
    tmp[573] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[555], tmp[573]);
    AddA(tmp[573], a[948]); -- Ambassador of the Alliance
    AddA(tmp[573], a[762]); -- Ambassador of the Horde
    AddA(tmp[573], a[4885]); -- Wildhammer Clan
    AddA(tmp[573], a[4886]); -- Dragonmaw Clan
    tmp[556] = cat:New(addon.GetMapName(338)); -- Molten Front
    AddC(tmp[550], tmp[556]);
    AddA(tmp[556], a[5859]); -- Legacy of Leyara
    AddA(tmp[556], a[5866]); -- The Molten Front Offensive
    AddA(tmp[556], a[5867]); -- Flawless Victory
    AddA(tmp[556], a[5871]); -- Master of the Molten Flow
    AddA(tmp[556], a[5872]); -- King of the Spider-Hill
    AddA(tmp[556], a[5874]); -- Death From Above
    AddA(tmp[556], a[5873]); -- Ready for Raiding II
    AddA(tmp[556], a[5879]); -- Veteran of the Molten Front
    tmp[130] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[129], tmp[130]);
    AddA(tmp[130], a[4844]); -- Cataclysm Dungeon Hero
    AddA(tmp[130], a[5506]); -- Defender of a Shattered World
    AddA(tmp[130], a[4845]); -- Glory of the Cataclysm Hero
    tmp[132] = cat:New((addon.EJ_GetInstanceInfo(66))); -- Blackrock Caverns
    AddC(tmp[130], tmp[132]);
    AddA(tmp[132], a[5281]); -- Crushing Bones and Cracking Skulls
    AddA(tmp[132], a[5282]); -- Arrested Development
    AddA(tmp[132], a[5283]); -- Too Hot to Handle
    AddA(tmp[132], a[5284]); -- Ascendant Descending
    AddA(tmp[132], a[4833]); -- Blackrock Caverns
    AddA(tmp[132], a[5060]); -- Heroic: Blackrock Caverns
    tmp[133] = cat:New((addon.EJ_GetInstanceInfo(65))); -- Throne of the Tides
    AddC(tmp[130], tmp[133]);
    AddA(tmp[133], a[5285]); -- Old Faithful
    AddA(tmp[133], a[5286]); -- Prince of Tides
    AddA(tmp[133], a[4839]); -- Throne of the Tides
    AddA(tmp[133], a[5061]); -- Heroic: Throne of the Tides
    tmp[134] = cat:New((addon.EJ_GetInstanceInfo(67))); -- The Stonecore
    AddC(tmp[130], tmp[134]);
    AddA(tmp[134], a[5287]); -- Rotten to the Core
    AddA(tmp[134], a[4846]); -- The Stonecore
    AddA(tmp[134], a[5063]); -- Heroic: The Stonecore
    tmp[135] = cat:New((addon.EJ_GetInstanceInfo(68))); -- The Vortex Pinnacle
    AddC(tmp[130], tmp[135]);
    AddA(tmp[135], a[5289]); -- Extra Credit Bonus Stage
    AddA(tmp[135], a[5288]); -- No Static at All
    AddA(tmp[135], a[4847]); -- The Vortex Pinnacle
    AddA(tmp[135], a[5064]); -- Heroic: The Vortex Pinnacle
    tmp[136] = cat:New((addon.EJ_GetInstanceInfo(71))); -- Grim Batol
    AddC(tmp[130], tmp[136]);
    AddA(tmp[136], a[5297]); -- Umbrage for Umbriss
    AddA(tmp[136], a[5298]); -- Don't Need to Break Eggs to Make an Omelet
    AddA(tmp[136], a[4840]); -- Grim Batol
    AddA(tmp[136], a[5062]); -- Heroic: Grim Batol
    tmp[137] = cat:New((addon.EJ_GetInstanceInfo(70))); -- Halls of Origination
    AddC(tmp[130], tmp[137]);
    AddA(tmp[137], a[5293]); -- I Hate That Song
    AddA(tmp[137], a[5294]); -- Straw That Broke the Camel's Back
    AddA(tmp[137], a[5296]); -- Faster Than the Speed of Light
    AddA(tmp[137], a[5295]); -- Sun of a....
    AddA(tmp[137], a[4841]); -- Halls of Origination
    AddA(tmp[137], a[5065]); -- Heroic: Halls of Origination
    AddA(tmp[137], a[9924]); -- Field Photographer
    tmp[138] = cat:New((addon.EJ_GetInstanceInfo(69))); -- Lost City of the Tol'vir
    AddC(tmp[130], tmp[138]);
    AddA(tmp[138], a[5291]); -- Acrocalypse Now
    AddA(tmp[138], a[5290]); -- Kill It With Fire!
    AddA(tmp[138], a[5292]); -- Headed South
    AddA(tmp[138], a[4848]); -- Lost City of the Tol'vir
    AddA(tmp[138], a[5066]); -- Heroic: Lost City of the Tol'vir
    tmp[139] = cat:New((addon.EJ_GetInstanceInfo(63))); -- Deadmines
    AddC(tmp[130], tmp[139]);
    AddA(tmp[139], a[5366]); -- Ready for Raiding
    AddA(tmp[139], a[5367]); -- Rat Pack
    AddA(tmp[139], a[5368]); -- Prototype Prodigy
    AddA(tmp[139], a[5369]); -- It's Frost Damage
    AddA(tmp[139], a[5370]); -- I'm on a Diet
    AddA(tmp[139], a[5371]); -- Vigorous VanCleef Vindicator
    AddA(tmp[139], a[628]); -- Deadmines
    AddA(tmp[139], a[5083]); -- Heroic: Deadmines
    AddA(tmp[139], a[11856]); -- Pet Battle Challenge: Deadmines
    AddA(tmp[139], a[9924]); -- Field Photographer
    tmp[140] = cat:New((addon.EJ_GetInstanceInfo(64))); -- Shadowfang Keep
    AddC(tmp[130], tmp[140]);
    AddA(tmp[140], a[5503]); -- Pardon Denied
    AddA(tmp[140], a[5504]); -- To the Ground!
    AddA(tmp[140], a[5505]); -- Bullet Time
    AddA(tmp[140], a[631]); -- Shadowfang Keep
    AddA(tmp[140], a[5093]); -- Heroic: Shadowfang Keep
    AddA(tmp[140], a[4627]); -- X-45 Heartbreaker
    tmp[141] = cat:New((addon.EJ_GetInstanceInfo(76))); -- Zul'Gurub
    AddC(tmp[130], tmp[141]);
    AddA(tmp[141], a[5743]); -- It's Not Easy Being Green
    AddA(tmp[141], a[5762]); -- Ohganot So Fast!
    AddA(tmp[141], a[5765]); -- "Here, Kitty Kitty..."
    AddA(tmp[141], a[5759]); -- Spirit Twister
    AddA(tmp[141], a[5744]); -- Gurubashi Headhunter
    AddA(tmp[141], a[5768]); -- Heroic: Zul'Gurub
    tmp[142] = cat:New((addon.EJ_GetInstanceInfo(77))); -- Zul'Aman
    AddC(tmp[130], tmp[142]);
    AddA(tmp[142], a[5858]); -- Bear-ly Made It
    AddA(tmp[142], a[5750]); -- Tunnel Vision
    AddA(tmp[142], a[5761]); -- Hex Mix
    AddA(tmp[142], a[5760]); -- Ring Out!
    AddA(tmp[142], a[5769]); -- Heroic: Zul'Aman
    tmp[143] = cat:New((addon.EJ_GetInstanceInfo(184))); -- End Time
    AddC(tmp[130], tmp[143]);
    AddA(tmp[143], a[5995]); -- Moon Guard
    AddA(tmp[143], a[6130]); -- Severed Ties
    AddA(tmp[143], a[6117]); -- Heroic: End Time
    tmp[144] = cat:New((addon.EJ_GetInstanceInfo(185))); -- Well of Eternity
    AddC(tmp[130], tmp[144]);
    AddA(tmp[144], a[6127]); -- Lazy Eye
    AddA(tmp[144], a[6070]); -- That's Not Canon!
    AddA(tmp[144], a[6118]); -- Heroic: Well of Eternity
    tmp[145] = cat:New((addon.EJ_GetInstanceInfo(186))); -- Hour of Twilight
    AddC(tmp[130], tmp[145]);
    AddA(tmp[145], a[6132]); -- Eclipse
    AddA(tmp[145], a[6119]); -- Heroic: Hour of Twilight
    tmp[131] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[129], tmp[131]);
    AddA(tmp[131], a[5506]); -- Defender of a Shattered World
    AddA(tmp[131], a[4853]); -- Glory of the Cataclysm Raider
    AddA(tmp[131], a[5828]); -- Glory of the Firelands Raider
    AddA(tmp[131], a[6169]); -- Glory of the Dragon Soul Raider
    tmp[146] = cat:New((addon.EJ_GetInstanceInfo(75))); -- Baradin Hold
    AddC(tmp[131], tmp[146]);
    AddA(tmp[146], a[5416]); -- Pit Lord Argaloth
    AddA(tmp[146], a[6045]); -- Occu'thar
    AddA(tmp[146], a[6108]); -- Alizabal
    tmp[147] = cat:New((addon.EJ_GetInstanceInfo(73))); -- Blackwing Descent
    AddC(tmp[131], tmp[147]);
    AddA(tmp[147], a[4842]); -- Blackwing Descent
    AddA(tmp[147], a[11754]); -- Glamour of Twilight
    AddA(tmp[147], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    tmp[902] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[147], tmp[902]);
    AddA(tmp[902], a[5306]); -- Parasite Evening
    AddA(tmp[902], a[5307]); -- Achieve-a-tron
    AddA(tmp[902], a[5309]); -- Full of Sound and Fury
    AddA(tmp[902], a[5308]); -- Silence is Golden
    AddA(tmp[902], a[5310]); -- Aberrant Behavior
    AddA(tmp[902], a[4849]); -- Keeping it in the Family
    tmp[903] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[147], tmp[903]);
    AddA(tmp[903], a[5094]); -- Heroic: Magmaw
    AddA(tmp[903], a[5107]); -- Heroic: Omnotron Defense System
    AddA(tmp[903], a[5115]); -- Heroic: Chimaeron
    AddA(tmp[903], a[5109]); -- Heroic: Atramedes
    AddA(tmp[903], a[5108]); -- Heroic: Maloriak
    AddA(tmp[903], a[5116]); -- Heroic: Nefarian
    tmp[148] = cat:New((addon.EJ_GetInstanceInfo(72))); -- The Bastion of Twilight
    AddC(tmp[131], tmp[148]);
    AddA(tmp[148], a[4850]); -- The Bastion of Twilight
    AddA(tmp[148], a[5313]); -- I Can't Hear You Over the Sound of How Awesome I Am
    AddA(tmp[148], a[11754]); -- Glamour of Twilight
    AddA(tmp[148], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    tmp[904] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[148], tmp[904]);
    AddA(tmp[904], a[5300]); -- The Only Escape
    AddA(tmp[904], a[4852]); -- Double Dragon
    AddA(tmp[904], a[5311]); -- Elementary
    AddA(tmp[904], a[5312]); -- The Abyss Will Gaze Back Into You
    tmp[905] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[148], tmp[905]);
    AddA(tmp[905], a[5118]); -- Heroic: Halfus Wyrmbreaker
    AddA(tmp[905], a[5117]); -- Heroic: Valiona and Theralion
    AddA(tmp[905], a[5119]); -- Heroic: Ascendant Council
    AddA(tmp[905], a[5120]); -- Heroic: Cho'gall
    AddA(tmp[905], a[5121]); -- Heroic: Sinestra
    tmp[149] = cat:New((addon.EJ_GetInstanceInfo(74))); -- Throne of the Four Winds
    AddC(tmp[131], tmp[149]);
    AddA(tmp[149], a[5304]); -- Stay Chill
    AddA(tmp[149], a[5305]); -- Four Play
    AddA(tmp[149], a[5122]); -- Heroic: Conclave of Wind
    AddA(tmp[149], a[5123]); -- Heroic: Al'Akir
    AddA(tmp[149], a[4851]); -- Throne of the Four Winds
    AddA(tmp[149], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    tmp[150] = cat:New((addon.EJ_GetInstanceInfo(78))); -- Firelands
    AddC(tmp[131], tmp[150]);
    AddA(tmp[150], a[5855]); -- Ragnar-O's
    AddA(tmp[150], a[5802]); -- Firelands
    AddA(tmp[150], a[11755]); -- Hot Couture
    AddA(tmp[150], a[5839]); -- "Dragonwrath, Tarecgosa's Rest"
    AddA(tmp[150], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    tmp[906] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[150], tmp[906]);
    AddA(tmp[906], a[5821]); -- Death from Above
    AddA(tmp[906], a[5813]); -- Do a Barrel Roll!
    AddA(tmp[906], a[5810]); -- Not an Ambi-Turner
    AddA(tmp[906], a[5829]); -- Bucket List
    AddA(tmp[906], a[5830]); -- Share the Pain
    AddA(tmp[906], a[5799]); -- Only the Penitent...
    tmp[907] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[150], tmp[907]);
    AddA(tmp[907], a[5807]); -- Heroic: Beth'tilac
    AddA(tmp[907], a[5809]); -- Heroic: Alysrazor
    AddA(tmp[907], a[5808]); -- Heroic: Lord Rhyolith
    AddA(tmp[907], a[5806]); -- Heroic: Shannox
    AddA(tmp[907], a[5805]); -- Heroic: Baleroc
    AddA(tmp[907], a[5804]); -- Heroic: Majordomo Fandral Staghelm
    AddA(tmp[907], a[5803]); -- Heroic: Ragnaros
    tmp[576] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[150], tmp[576]);
    AddA(tmp[576], a[5827]); -- Avengers of Hyjal
    tmp[151] = cat:New((addon.EJ_GetInstanceInfo(187))); -- Dragon Soul
    AddC(tmp[131], tmp[151]);
    AddA(tmp[151], a[6175]); -- Holding Hands
    AddA(tmp[151], a[5518]); -- Stood in the Fire
    AddA(tmp[151], a[6106]); -- Siege of Wyrmrest Temple
    AddA(tmp[151], a[6107]); -- Fall of Deathwing
    AddA(tmp[151], a[6177]); -- Destroyer's End
    AddA(tmp[151], a[11756]); -- Wardrobe of the Old Gods
    AddA(tmp[151], a[6181]); -- Fangs of the Father
    AddA(tmp[151], a[12079]); -- Raiding with Leashes V: Cuteaclysm
    tmp[908] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[151], tmp[908]);
    AddA(tmp[908], a[6174]); -- Don't Stand So Close to Me
    AddA(tmp[908], a[6128]); -- Ping Pong Champion
    AddA(tmp[908], a[6129]); -- Taste the Rainbow!
    AddA(tmp[908], a[6084]); -- Minutes to Midnight
    AddA(tmp[908], a[6105]); -- Deck Defender
    AddA(tmp[908], a[6133]); -- Maybe He'll Get Dizzy...
    AddA(tmp[908], a[6180]); -- Chromatic Champion
    tmp[909] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[151], tmp[909]);
    AddA(tmp[909], a[6109]); -- Heroic: Morchok
    AddA(tmp[909], a[6110]); -- Heroic: Warlord Zon'ozz
    AddA(tmp[909], a[6111]); -- Heroic: Yor'sahj the Unsleeping
    AddA(tmp[909], a[6112]); -- Heroic: Hagara the Stormbinder
    AddA(tmp[909], a[6113]); -- Heroic: Ultraxion
    AddA(tmp[909], a[6114]); -- Heroic: Warmaster Blackhorn
    AddA(tmp[909], a[6115]); -- Heroic: Spine of Deathwing
    AddA(tmp[909], a[6116]); -- Heroic: Madness of Deathwing
    tmp[788] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[129], tmp[788]);
    AddA(tmp[788], a[7525]); -- Taming Cataclysm
    AddA(tmp[788], a[6558]); -- Local Pet Mauler
    AddA(tmp[788], a[6559]); -- Traveling Pet Mauler
    AddA(tmp[788], a[6560]); -- World Pet Mauler
    AddA(tmp[788], a[6607]); -- Taming Azeroth
    AddA(tmp[788], a[6601]); -- Taming the Wild
    AddA(tmp[788], a[7498]); -- Taming the Great Outdoors
    AddA(tmp[788], a[7499]); -- Taming the World
    AddA(tmp[788], a[14021]); -- The Shadows Revealed
    AddA(tmp[788], a[8348]); -- The Longest Day
    tmp[547] = cat:New((addon.GetCategoryInfo(15075))); -- Tol Barad
    AddC(tmp[129], tmp[547]);
    AddA(tmp[547], a[5489]); -- Master of Tol Barad
    AddA(tmp[547], a[5490]); -- Master of Tol Barad
    tmp[563] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[547], tmp[563]);
    AddA(tmp[563], a[4874]); -- Breaking Out of Tol Barad
    AddA(tmp[563], a[5718]); -- Just Another Day in Tol Barad
    AddA(tmp[563], a[5719]); -- Just Another Day in Tol Barad
    tmp[569] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[547], tmp[569]);
    AddA(tmp[569], a[5412]); -- Tol Barad Victory
    AddA(tmp[569], a[5418]); -- Tol Barad Veteran
    AddA(tmp[569], a[5417]); -- Tol Barad Veteran
    AddA(tmp[569], a[5415]); -- Tower Plower
    AddA(tmp[569], a[5488]); -- Towers of Power
    AddA(tmp[569], a[5487]); -- Tol Barad Saboteur
    AddA(tmp[569], a[5486]); -- Tol Barad All-Star
    tmp[575] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[547], tmp[575]);
    AddA(tmp[575], a[5375]); -- Baradin's Wardens
    AddA(tmp[575], a[5376]); -- Hellscream's Reach
    tmp[189] = cat:New((addon.GetCategoryInfo(15164))); -- Mists of Pandaria
    AddC(tmp[883], tmp[189]);
    AddA(tmp[189], a[6926]); -- Tranquil Master
    AddA(tmp[189], a[7533]); -- Chapter I: Trial of the Black Prince
    AddA(tmp[189], a[8030]); -- A Test of Valor
    AddA(tmp[189], a[8031]); -- A Test of Valor
    AddA(tmp[189], a[7534]); -- Chapter II: Wrathion's War
    AddA(tmp[189], a[8008]); -- Chapter II: Wrathion's War
    AddA(tmp[189], a[7535]); -- Chapter III: Two Princes
    AddA(tmp[189], a[7536]); -- Chapter IV: Celestial Blessings
    AddA(tmp[189], a[8325]); -- Chapter V: Judgment of the Black Prince
    AddA(tmp[189], a[8306]); -- Hordebreaker
    AddA(tmp[189], a[8307]); -- Darkspear Revolutionary
    tmp[491] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[189], tmp[491]);
    tmp[526] = cat:New(addon.GetMapName(424)); -- Pandaria
    AddC(tmp[491], tmp[526]);
    tmp[527] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[526], tmp[527]);
    AddA(tmp[527], a[6541]); -- Loremaster of Pandaria
    AddA(tmp[527], a[7285]); -- Every Day I'm Pand-a-ren
    AddA(tmp[527], a[7520]); -- The Loremaster
    tmp[528] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[526], tmp[528]);
    AddA(tmp[528], a[6716]); -- Between a Saurok and a Hard Place
    AddA(tmp[528], a[6754]); -- The Dark Heart of the Mogu
    AddA(tmp[528], a[6846]); -- Fish Tales
    AddA(tmp[528], a[6850]); -- Hozen in the Mist
    AddA(tmp[528], a[6847]); -- The Song of the Yaungol
    AddA(tmp[528], a[6855]); -- The Seven Burdens of Shaohao
    AddA(tmp[528], a[6856]); -- Ballad of Liu Lang
    AddA(tmp[528], a[6858]); -- What Is Worth Fighting For
    AddA(tmp[528], a[7230]); -- Legend of the Brewfathers
    AddA(tmp[528], a[7994]); -- Treasure of Pandaria
    AddA(tmp[528], a[7995]); -- Fortune of Pandaria
    AddA(tmp[528], a[7996]); -- Bounty of Pandaria
    AddA(tmp[528], a[7997]); -- Riches of Pandaria
    AddA(tmp[528], a[7281]); -- Lost and Found
    AddA(tmp[528], a[7282]); -- Finders Keepers
    AddA(tmp[528], a[7283]); -- One Man's Trash...
    AddA(tmp[528], a[7284]); -- Is Another Man's Treasure
    AddA(tmp[528], a[7437]); -- A Worthy Opponent
    AddA(tmp[528], a[7438]); -- Could We Find More Like That?
    AddA(tmp[528], a[7439]); -- Glorious!
    AddA(tmp[528], a[8078]); -- Zul'Again
    AddA(tmp[528], a[6350]); -- To All the Squirrels I Once Caressed?
    AddA(tmp[528], a[7329]); -- Pandaren Cuisine
    AddA(tmp[528], a[7330]); -- Pandaren Delicacies
    AddA(tmp[528], a[6974]); -- Pandaria Explorer
    tmp[529] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[526], tmp[529]);
    AddA(tmp[529], a[7479]); -- The Shado-Master
    AddA(tmp[529], a[6543]); -- The August Celestials
    AddA(tmp[529], a[6547]); -- The Anglers
    AddA(tmp[529], a[6548]); -- The Lorewalkers
    AddA(tmp[529], a[6827]); -- Pandaren Ambassador
    AddA(tmp[529], a[6828]); -- Pandaren Ambassador
    tmp[492] = cat:New(addon.GetMapName(371)); -- The Jade Forest
    AddC(tmp[491], tmp[492]);
    tmp[519] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[492], tmp[519]);
    AddA(tmp[519], a[6300]); -- Upjade Complete
    AddA(tmp[519], a[6534]); -- Upjade Complete
    AddA(tmp[519], a[7289]); -- Shadow Hopper
    AddA(tmp[519], a[7290]); -- How To Strain Your Dragon
    AddA(tmp[519], a[7291]); -- In a Trail of Smoke
    tmp[545] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[492], tmp[545]);
    AddA(tmp[545], a[6351]); -- Explore Jade Forest
    AddA(tmp[545], a[7381]); -- Restore Balance
    tmp[546] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[492], tmp[546]);
    AddA(tmp[546], a[6550]); -- Order of the Cloud Serpent
    tmp[493] = cat:New(addon.GetMapName(376)); -- Valley of the Four Winds
    AddC(tmp[491], tmp[493]);
    AddA(tmp[493], a[6517]); -- Extinction Event
    tmp[516] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[493], tmp[516]);
    AddA(tmp[516], a[6301]); -- Rally the Valley
    AddA(tmp[516], a[7292]); -- Green Acres
    AddA(tmp[516], a[7293]); -- Till the Break of Dawn
    AddA(tmp[516], a[7294]); -- A Taste of Things to Come
    AddA(tmp[516], a[7295]); -- Listen to the Drunk Fish
    AddA(tmp[516], a[7296]); -- Ain't Lost No More
    AddA(tmp[516], a[7502]); -- Savior of Stoneplow
    tmp[544] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[493], tmp[544]);
    AddA(tmp[544], a[6969]); -- Explore Valley of the Four Winds
    AddA(tmp[544], a[9924]); -- Field Photographer
    tmp[518] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[493], tmp[518]);
    AddA(tmp[518], a[6544]); -- The Tillers
    AddA(tmp[518], a[6551]); -- Friend on the Farm
    AddA(tmp[518], a[6552]); -- Friends on the Farm
    tmp[494] = cat:New(addon.GetMapName(418)); -- Krasarang Wilds
    AddC(tmp[491], tmp[494]);
    tmp[513] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[494], tmp[513]);
    AddA(tmp[513], a[6535]); -- Mighty Roamin' Krasaranger
    AddA(tmp[513], a[6536]); -- Mighty Roamin' Krasaranger
    AddA(tmp[513], a[7287]); -- Champion of Chi-Ji
    AddA(tmp[513], a[7928]); -- Operation: Shieldwall Campaign
    AddA(tmp[513], a[7929]); -- Dominance Offensive Campaign
    tmp[514] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[494], tmp[514]);
    AddA(tmp[514], a[6975]); -- Explore Krasarang Wilds
    AddA(tmp[514], a[7518]); -- "Wanderers, Dreamers, and You"
    AddA(tmp[514], a[7932]); -- "I'm In Your Base, Killing Your Dudes"
    AddA(tmp[514], a[9924]); -- Field Photographer
    tmp[543] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[494], tmp[543]);
    AddA(tmp[543], a[8205]); -- Operation: Shieldwall
    AddA(tmp[543], a[8206]); -- Dominance Offensive
    tmp[495] = cat:New(addon.GetMapName(379)); -- Kun-Lai Summit
    AddC(tmp[491], tmp[495]);
    AddA(tmp[495], a[6480]); -- "Settle Down, Bro"
    AddA(tmp[495], a[7386]); -- Grand Expedition Yak
    tmp[510] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[495], tmp[510]);
    AddA(tmp[510], a[6537]); -- Slum It in the Summit
    AddA(tmp[510], a[6538]); -- Slum It in the Summit
    AddA(tmp[510], a[7286]); -- Finish Them!
    tmp[542] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[495], tmp[542]);
    AddA(tmp[542], a[6976]); -- Explore Kun-Lai Summit
    AddA(tmp[542], a[9924]); -- Field Photographer
    tmp[496] = cat:New(addon.GetMapName(388)); -- Townlong Steppes
    AddC(tmp[491], tmp[496]);
    tmp[507] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[496], tmp[507]);
    AddA(tmp[507], a[6539]); -- "One Steppe Forward, Two Steppes Back"
    AddA(tmp[507], a[7288]); -- Yak Attack
    AddA(tmp[507], a[7297]); -- Proven Strength
    AddA(tmp[507], a[7298]); -- Getting Around with the Shado-Pan
    AddA(tmp[507], a[7299]); -- Loner and a Rebel
    AddA(tmp[507], a[7307]); -- Silent Assassin
    AddA(tmp[507], a[7308]); -- Know Your Role
    AddA(tmp[507], a[7309]); -- Fire in the Yaung-hole!
    AddA(tmp[507], a[7310]); -- Defender of Gods
    tmp[540] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[496], tmp[540]);
    AddA(tmp[540], a[6977]); -- Explore Townlong Steppes
    tmp[541] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[496], tmp[541]);
    AddA(tmp[541], a[6366]); -- Shado-Pan
    tmp[497] = cat:New(addon.GetMapName(422)); -- Dread Wastes
    AddC(tmp[491], tmp[497]);
    tmp[504] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[497], tmp[504]);
    AddA(tmp[504], a[6540]); -- Dread Haste Makes Dread Waste
    AddA(tmp[504], a[7312]); -- Amber is the Color of My Energy
    AddA(tmp[504], a[7313]); -- Stay Klaxxi
    AddA(tmp[504], a[7314]); -- Test Drive
    AddA(tmp[504], a[7316]); -- Over Their Heads
    tmp[538] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[497], tmp[538]);
    AddA(tmp[538], a[6978]); -- Explore Dread Wastes
    AddA(tmp[538], a[6857]); -- Heart of the Mantid Swarm
    tmp[539] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[497], tmp[539]);
    AddA(tmp[539], a[6545]); -- Klaxxi
    AddA(tmp[539], a[8023]); -- Wakener
    tmp[498] = cat:New(addon.GetMapName(390)); -- Vale of Eternal Blossoms
    AddC(tmp[491], tmp[498]);
    tmp[501] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[498], tmp[501]);
    AddA(tmp[501], a[7317]); -- One Many Army
    AddA(tmp[501], a[7318]); -- A Taste of History
    AddA(tmp[501], a[7319]); -- Ready for Raiding III
    AddA(tmp[501], a[7320]); -- Dog Pile
    AddA(tmp[501], a[7321]); -- Spreading the Warmth
    AddA(tmp[501], a[7322]); -- Roll Club
    AddA(tmp[501], a[7323]); -- Collateral Damage
    AddA(tmp[501], a[7324]); -- One Step at a Time
    AddA(tmp[501], a[7315]); -- Eternally in the Vale
    tmp[536] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[498], tmp[536]);
    AddA(tmp[536], a[6979]); -- Explore Vale of Eternal Blossoms
    AddA(tmp[536], a[9924]); -- Field Photographer
    tmp[537] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[498], tmp[537]);
    AddA(tmp[537], a[6546]); -- The Golden Lotus
    tmp[534] = cat:New(addon.GetMapName(507)); -- Isle of Giants
    AddC(tmp[491], tmp[534]);
    AddA(tmp[534], a[8123]); -- Millions of Years of Evolution vs. My Fist
    AddA(tmp[534], a[8092]); -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    tmp[522] = cat:New(addon.GetMapName(504)); -- Isle of Thunder
    AddC(tmp[491], tmp[522]);
    AddA(tmp[522], a[8028]); -- Praise the Sun!
    tmp[523] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[522], tmp[523]);
    AddA(tmp[523], a[8099]); -- Isle of Thunder
    AddA(tmp[523], a[8100]); -- Pay to Slay
    AddA(tmp[523], a[8101]); -- It Was Worth Every Ritual Stone
    AddA(tmp[523], a[8104]); -- Thunder Plunder
    AddA(tmp[523], a[8105]); -- The Crumble Bundle
    AddA(tmp[523], a[8107]); -- Ready for RAAAAIIIIDDD?!?ing
    AddA(tmp[523], a[8108]); -- "When in Ihgaluk, Do as the Skumblade Do"
    AddA(tmp[523], a[8109]); -- The Mogu Below-gu
    AddA(tmp[523], a[8110]); -- These Mogu Have Gotta Go-gu
    AddA(tmp[523], a[8111]); -- This Isn't Even My Final Form
    AddA(tmp[523], a[8112]); -- Blue Response
    AddA(tmp[523], a[8114]); -- Platform Hero
    AddA(tmp[523], a[8115]); -- Speed Metal
    AddA(tmp[523], a[8116]); -- You Made Me Bleed My Own Blood
    AddA(tmp[523], a[8117]); -- For the Ward!
    AddA(tmp[523], a[8118]); -- Boop
    AddA(tmp[523], a[8119]); -- Our Powers Combined
    AddA(tmp[523], a[8120]); -- Direhorn in a China Shop
    AddA(tmp[523], a[8212]); -- Zandalari Library Card
    AddA(tmp[523], a[8121]); -- Stormbreaker
    AddA(tmp[523], a[8106]); -- In the Hall of the Thunder King
    tmp[524] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[522], tmp[524]);
    AddA(tmp[524], a[8103]); -- Champions of Lei Shen
    AddA(tmp[524], a[8049]); -- The Zandalari Prophecy
    AddA(tmp[524], a[8050]); -- Rumbles of Thunder
    AddA(tmp[524], a[8051]); -- Gods and Monsters
    tmp[525] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[522], tmp[525]);
    AddA(tmp[525], a[8208]); -- Kirin Tor Offensive
    AddA(tmp[525], a[8209]); -- Sunreaver Onslaught
    AddA(tmp[525], a[8210]); -- Shado-Pan Assault
    tmp[530] = cat:New(addon.GetMapName(554)); -- Timeless Isle
    AddC(tmp[491], tmp[530]);
    AddA(tmp[530], a[8535]); -- Celestial Challenge
    AddA(tmp[530], a[8533]); -- Ordos
    tmp[531] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[530], tmp[531]);
    AddA(tmp[531], a[8712]); -- Killing Time
    AddA(tmp[531], a[8714]); -- Timeless Champion
    AddA(tmp[531], a[8722]); -- Timeless Nutriment
    AddA(tmp[531], a[8724]); -- Pilgrimage
    AddA(tmp[531], a[8723]); -- Legend of the Past
    AddA(tmp[531], a[8784]); -- Timeless Legends
    AddA(tmp[531], a[8725]); -- Eyes On The Ground
    AddA(tmp[531], a[8726]); -- Extreme Treasure Hunter
    AddA(tmp[531], a[8727]); -- "Where There's Pirates, There's Booty"
    AddA(tmp[531], a[8729]); -- "Treasure, Treasure Everywhere"
    AddA(tmp[531], a[8730]); -- Rolo's Riddle
    AddA(tmp[531], a[8743]); -- Zarhym Altogether
    AddA(tmp[531], a[8716]); -- Emissary of Ordos
    AddA(tmp[531], a[8717]); -- Candlekeeper
    AddA(tmp[531], a[8718]); -- Oathguard
    AddA(tmp[531], a[8719]); -- Blazebinder
    AddA(tmp[531], a[8720]); -- Kilnmaster
    AddA(tmp[531], a[8721]); -- Fire-Watcher
    AddA(tmp[531], a[8728]); -- Going To Need A Bigger Bag
    tmp[535] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[530], tmp[535]);
    AddA(tmp[535], a[8715]); -- Emperor Shaohao
    tmp[190] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[189], tmp[190]);
    AddA(tmp[190], a[6925]); -- Pandaria Dungeon Hero
    AddA(tmp[190], a[6927]); -- Glory of the Pandaria Hero
    AddA(tmp[190], a[8903]); -- Mistwalker
    AddA(tmp[190], a[6920]); -- Challenge Conqueror
    AddA(tmp[190], a[6374]); -- Challenge Conqueror: Bronze
    AddA(tmp[190], a[6375]); -- Challenge Conqueror: Silver
    AddA(tmp[190], a[6378]); -- Challenge Conqueror: Gold
    tmp[193] = cat:New((addon.EJ_GetInstanceInfo(313))); -- Temple of the Jade Serpent
    AddC(tmp[190], tmp[193]);
    AddA(tmp[193], a[6475]); -- Cleaning Up
    AddA(tmp[193], a[6460]); -- Hydrophobia
    AddA(tmp[193], a[6671]); -- Seeds of Doubt
    AddA(tmp[193], a[6757]); -- Temple of the Jade Serpent
    AddA(tmp[193], a[6758]); -- Heroic: Temple of the Jade Serpent
    AddA(tmp[193], a[6884]); -- Temple of the Jade Serpent Challenger
    AddA(tmp[193], a[6885]); -- Temple of the Jade Serpent: Bronze
    AddA(tmp[193], a[6886]); -- Temple of the Jade Serpent: Silver
    AddA(tmp[193], a[6887]); -- Temple of the Jade Serpent: Gold
    AddA(tmp[193], a[8430]); -- Challenge Master: Temple of the Jade Serpent
    tmp[194] = cat:New((addon.EJ_GetInstanceInfo(302))); -- Stormstout Brewery
    AddC(tmp[190], tmp[194]);
    AddA(tmp[194], a[6402]); -- Ling-Ting's Herbal Journey
    AddA(tmp[194], a[6089]); -- Keep Rollin' Rollin' Rollin'
    AddA(tmp[194], a[6400]); -- How Did He Get Up There?
    AddA(tmp[194], a[6420]); -- Hopocalypse Now!
    AddA(tmp[194], a[6457]); -- Stormstout Brewery
    AddA(tmp[194], a[6456]); -- Heroic: Stormstout Brewery
    AddA(tmp[194], a[6888]); -- Stormstout Brewery Challenger
    AddA(tmp[194], a[6889]); -- Stormstout Brewery: Bronze
    AddA(tmp[194], a[6890]); -- Stormstout Brewery: Silver
    AddA(tmp[194], a[6891]); -- Stormstout Brewery: Gold
    AddA(tmp[194], a[8431]); -- Challenge Master: Stormstout Brewery
    tmp[195] = cat:New((addon.EJ_GetInstanceInfo(321))); -- Mogu'shan Palace
    AddC(tmp[190], tmp[195]);
    AddA(tmp[195], a[6713]); -- Quarrelsome Quilen Quintet
    AddA(tmp[195], a[6478]); -- Glintrok N' Roll
    AddA(tmp[195], a[6736]); -- What Does This Button Do?
    AddA(tmp[195], a[6755]); -- Mogu'shan Palace
    AddA(tmp[195], a[6756]); -- Heroic: Mogu'shan Palace
    AddA(tmp[195], a[6892]); -- Mogu'shan Palace Challenger
    AddA(tmp[195], a[6899]); -- Mogu'shan Palace: Bronze
    AddA(tmp[195], a[6900]); -- Mogu'shan Palace: Silver
    AddA(tmp[195], a[6901]); -- Mogu'shan Palace: Gold
    AddA(tmp[195], a[8433]); -- Challenge Master: Mogu'shan Palace
    tmp[196] = cat:New((addon.EJ_GetInstanceInfo(312))); -- Shado-Pan Monastery
    AddC(tmp[190], tmp[196]);
    AddA(tmp[196], a[6477]); -- Respect
    AddA(tmp[196], a[6472]); -- The Obvious Solution
    AddA(tmp[196], a[6471]); -- Hate Leads to Suffering
    AddA(tmp[196], a[6469]); -- Shado-Pan Monastery
    AddA(tmp[196], a[6470]); -- Heroic: Shado-Pan Monastery
    AddA(tmp[196], a[6893]); -- Shado-Pan Monastery Challenger
    AddA(tmp[196], a[6902]); -- Shado-Pan Monastery: Bronze
    AddA(tmp[196], a[6903]); -- Shado-Pan Monastery: Silver
    AddA(tmp[196], a[6904]); -- Shado-Pan Monastery: Gold
    AddA(tmp[196], a[8432]); -- Challenge Master: Shado-Pan Monastery
    tmp[197] = cat:New((addon.EJ_GetInstanceInfo(303))); -- Gate of the Setting Sun
    AddC(tmp[190], tmp[197]);
    AddA(tmp[197], a[6479]); -- Bomberman
    AddA(tmp[197], a[6476]); -- Conscriptinator
    AddA(tmp[197], a[6945]); -- Mantid Swarm
    AddA(tmp[197], a[10010]); -- Gate of the Setting Sun
    AddA(tmp[197], a[6759]); -- Heroic: Gate of the Setting Sun
    AddA(tmp[197], a[6894]); -- Gate of the Setting Sun Challenger
    AddA(tmp[197], a[6905]); -- Gate of the Setting Sun: Bronze
    AddA(tmp[197], a[6906]); -- Gate of the Setting Sun: Silver
    AddA(tmp[197], a[6907]); -- Gate of the Setting Sun: Gold
    AddA(tmp[197], a[8434]); -- Challenge Master: Gate of the Setting Sun
    tmp[198] = cat:New((addon.EJ_GetInstanceInfo(324))); -- Siege of Niuzao Temple
    AddC(tmp[190], tmp[198]);
    AddA(tmp[198], a[6688]); -- Where's My Air Support?
    AddA(tmp[198], a[6485]); -- Return to Sender
    AddA(tmp[198], a[6822]); -- Run with the Wind
    AddA(tmp[198], a[10011]); -- Siege of Niuzao Temple
    AddA(tmp[198], a[6763]); -- Heroic: Siege of Niuzao Temple
    AddA(tmp[198], a[6898]); -- Siege of Niuzao Temple Challenger
    AddA(tmp[198], a[6917]); -- Siege of Niuzao Temple: Bronze
    AddA(tmp[198], a[6918]); -- Siege of Niuzao Temple: Silver
    AddA(tmp[198], a[6919]); -- Siege of Niuzao Temple: Gold
    AddA(tmp[198], a[8439]); -- Challenge Master: Siege of Niuzao Temple
    tmp[199] = cat:New((addon.EJ_GetInstanceInfo(311))); -- Scarlet Halls
    AddC(tmp[190], tmp[199]);
    AddA(tmp[199], a[6684]); -- Humane Society
    AddA(tmp[199], a[6427]); -- Mosh Pit
    AddA(tmp[199], a[7413]); -- Scarlet Halls
    AddA(tmp[199], a[6760]); -- Heroic: Scarlet Halls
    AddA(tmp[199], a[6895]); -- Scarlet Halls Challenger
    AddA(tmp[199], a[6908]); -- Scarlet Halls: Bronze
    AddA(tmp[199], a[6909]); -- Scarlet Halls: Silver
    AddA(tmp[199], a[6910]); -- Scarlet Halls: Gold
    AddA(tmp[199], a[8436]); -- Challenge Master: Scarlet Halls
    tmp[200] = cat:New((addon.EJ_GetInstanceInfo(316))); -- Scarlet Monastery
    AddC(tmp[190], tmp[200]);
    AddA(tmp[200], a[6946]); -- Empowered Spiritualist
    AddA(tmp[200], a[6928]); -- Burning Man
    AddA(tmp[200], a[6929]); -- And Stay Dead!
    AddA(tmp[200], a[637]); -- Scarlet Monastery
    AddA(tmp[200], a[6761]); -- Heroic: Scarlet Monastery
    AddA(tmp[200], a[6896]); -- Scarlet Monastery Challenger
    AddA(tmp[200], a[6911]); -- Scarlet Monastery: Bronze
    AddA(tmp[200], a[6912]); -- Scarlet Monastery: Silver
    AddA(tmp[200], a[6913]); -- Scarlet Monastery: Gold
    AddA(tmp[200], a[8437]); -- Challenge Master: Scarlet Monastery
    AddA(tmp[200], a[980]); -- The Horseman's Reins
    tmp[201] = cat:New((addon.EJ_GetInstanceInfo(246))); -- Scholomance
    AddC(tmp[190], tmp[201]);
    AddA(tmp[201], a[6531]); -- Attention to Detail
    AddA(tmp[201], a[6394]); -- Rattle No More
    AddA(tmp[201], a[6396]); -- Sanguinarian
    AddA(tmp[201], a[6715]); -- Polyformic Acid Science
    AddA(tmp[201], a[6821]); -- School's Out Forever
    AddA(tmp[201], a[645]); -- Scholomance
    AddA(tmp[201], a[6762]); -- Heroic: Scholomance
    AddA(tmp[201], a[6897]); -- Scholomance Challenger
    AddA(tmp[201], a[6914]); -- Scholomance: Bronze
    AddA(tmp[201], a[6915]); -- Scholomance: Silver
    AddA(tmp[201], a[6916]); -- Scholomance: Gold
    AddA(tmp[201], a[8438]); -- Challenge Master: Scholomance
    tmp[191] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[189], tmp[191]);
    AddA(tmp[191], a[6932]); -- Glory of the Pandaria Raider
    AddA(tmp[191], a[8124]); -- Glory of the Thundering Raider
    AddA(tmp[191], a[8454]); -- Glory of the Orgrimmar Raider
    tmp[202] = cat:New((addon.EJ_GetInstanceInfo(317))); -- Mogu'shan Vaults
    AddC(tmp[191], tmp[202]);
    AddA(tmp[202], a[7933]); -- And... It's Good!
    AddA(tmp[202], a[6687]); -- Getting Hot In Here
    AddA(tmp[202], a[6455]); -- Show Me Your Moves!
    AddA(tmp[202], a[6458]); -- Guardians of Mogu'shan
    AddA(tmp[202], a[6844]); -- The Vault of Mysteries
    AddA(tmp[202], a[6954]); -- Ahead of the Curve: Will of the Emperor
    AddA(tmp[202], a[7485]); -- Cutting Edge: Will of the Emperor
    tmp[892] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[202], tmp[892]);
    AddA(tmp[892], a[6823]); -- Must Love Dogs
    AddA(tmp[892], a[6674]); -- "Anything You Can Do, I Can Do Better..."
    AddA(tmp[892], a[7056]); -- "Sorry, Were You Looking for This?"
    AddA(tmp[892], a[6686]); -- Straight Six
    tmp[893] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[202], tmp[893]);
    AddA(tmp[893], a[6719]); -- Heroic: Stone Guard
    AddA(tmp[893], a[6720]); -- Heroic: Feng the Accursed
    AddA(tmp[893], a[6721]); -- Heroic: Gara'jal the Spiritbinder
    AddA(tmp[893], a[6722]); -- Heroic: Four Kings
    AddA(tmp[893], a[6723]); -- Heroic: Elegon
    AddA(tmp[893], a[6724]); -- Heroic: Will of the Emperor
    tmp[203] = cat:New((addon.EJ_GetInstanceInfo(330))); -- Heart of Fear
    AddC(tmp[191], tmp[203]);
    AddA(tmp[203], a[6718]); -- The Dread Approach
    AddA(tmp[203], a[6845]); -- Nightmare of Shek'zeer
    AddA(tmp[203], a[8246]); -- Ahead of the Curve: Grand Empress Shek'zeer
    AddA(tmp[203], a[7486]); -- Cutting Edge: Grand Empress Shek'zeer
    AddA(tmp[203], a[11757]); -- Sha of Fabulous
    tmp[894] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[203], tmp[894]);
    AddA(tmp[894], a[6937]); -- Overzealous
    AddA(tmp[894], a[6936]); -- Candle in the Wind
    AddA(tmp[894], a[6553]); -- Like an Arrow to the Face
    AddA(tmp[894], a[6683]); -- Less Than Three
    AddA(tmp[894], a[6518]); -- I Heard You Like Amber...
    AddA(tmp[894], a[6922]); -- Timing is Everything
    tmp[895] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[203], tmp[895]);
    AddA(tmp[895], a[6725]); -- Heroic: Imperial Vizier Zor'lok
    AddA(tmp[895], a[6726]); -- Heroic: Blade Lord Ta'yak
    AddA(tmp[895], a[6727]); -- Heroic: Garalon
    AddA(tmp[895], a[6728]); -- Heroic: Wind Lord Mel'jarak
    AddA(tmp[895], a[6729]); -- Heroic: Amber-Shaper Un'sok
    AddA(tmp[895], a[6730]); -- Heroic: Grand Empress Shek'zeer
    tmp[204] = cat:New((addon.EJ_GetInstanceInfo(320))); -- Terrace of Endless Spring
    AddC(tmp[191], tmp[204]);
    AddA(tmp[204], a[6689]); -- Terrace of Endless Spring
    AddA(tmp[204], a[8248]); -- Ahead of the Curve: Sha of Fear
    AddA(tmp[204], a[7487]); -- Cutting Edge: Sha of Fear
    AddA(tmp[204], a[11757]); -- Sha of Fabulous
    tmp[896] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[204], tmp[896]);
    AddA(tmp[896], a[6717]); -- Power Overwhelming
    AddA(tmp[896], a[6933]); -- Who's Got Two Green Thumbs?
    AddA(tmp[896], a[6824]); -- Face Clutchers
    AddA(tmp[896], a[6825]); -- The Mind-Killer
    tmp[897] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[204], tmp[897]);
    AddA(tmp[897], a[6731]); -- Heroic: Protectors of the Endless
    AddA(tmp[897], a[6732]); -- Heroic: Tsulong
    AddA(tmp[897], a[6733]); -- Heroic: Lei Shi
    AddA(tmp[897], a[6734]); -- Heroic: Sha of Fear
    tmp[205] = cat:New((addon.EJ_GetInstanceInfo(362))); -- Throne of Thunder
    AddC(tmp[191], tmp[205]);
    AddA(tmp[205], a[8069]); -- Last Stand of the Zandalari
    AddA(tmp[205], a[8070]); -- Forgotten Depths
    AddA(tmp[205], a[8071]); -- Halls of Flesh-Shaping
    AddA(tmp[205], a[8072]); -- Pinnacle of Storms
    AddA(tmp[205], a[8089]); -- I Thought He Was Supposed to Be Hard?
    AddA(tmp[205], a[8249]); -- Ahead of the Curve: Lei Shen
    AddA(tmp[205], a[8238]); -- Cutting Edge: Lei Shen
    AddA(tmp[205], a[8260]); -- Cutting Edge: Ra-den
    AddA(tmp[205], a[11758]); -- Thunderwear
    tmp[898] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[205], tmp[898]);
    AddA(tmp[898], a[8094]); -- Lightning Overload
    AddA(tmp[898], a[8038]); -- Cretaceous Collector
    AddA(tmp[898], a[8073]); -- Cage Match
    AddA(tmp[898], a[8077]); -- One-Up
    AddA(tmp[898], a[8082]); -- Head Case
    AddA(tmp[898], a[8097]); -- Soft Hands
    AddA(tmp[898], a[8098]); -- You Said Crossing the Streams Was Bad
    AddA(tmp[898], a[8037]); -- Genetically Unmodified Organism
    AddA(tmp[898], a[8081]); -- Ritualist Who?
    AddA(tmp[898], a[8087]); -- Can't Touch This
    AddA(tmp[898], a[8086]); -- From Dusk 'til Dawn
    AddA(tmp[898], a[8090]); -- A Complete Circuit
    tmp[899] = cat:New(addon.L["Heroic"]); -- Heroic
    AddC(tmp[205], tmp[899]);
    AddA(tmp[899], a[8056]); -- Heroic: Jin'rokh the Breaker
    AddA(tmp[899], a[8057]); -- Heroic: Horridon
    AddA(tmp[899], a[8058]); -- Heroic: Council of Elders
    AddA(tmp[899], a[8059]); -- Heroic: Tortos
    AddA(tmp[899], a[8060]); -- Heroic: Megaera
    AddA(tmp[899], a[8061]); -- Heroic: Ji-Kun
    AddA(tmp[899], a[8062]); -- Heroic: Durumu the Forgotten
    AddA(tmp[899], a[8063]); -- Heroic: Primordius
    AddA(tmp[899], a[8064]); -- Heroic: Dark Animus
    AddA(tmp[899], a[8065]); -- Heroic: Iron Qon
    AddA(tmp[899], a[8066]); -- Heroic: Twin Empyreans
    AddA(tmp[899], a[8067]); -- Heroic: Lei Shen
    AddA(tmp[899], a[8068]); -- Heroic: Ra-den
    tmp[206] = cat:New((addon.EJ_GetInstanceInfo(369))); -- Siege of Orgrimmar
    AddC(tmp[191], tmp[206]);
    AddA(tmp[206], a[8458]); -- Vale of Eternal Sorrows
    AddA(tmp[206], a[8459]); -- Gates of Retribution
    AddA(tmp[206], a[8461]); -- The Underhold
    AddA(tmp[206], a[8462]); -- Downfall
    AddA(tmp[206], a[8679]); -- Conqueror of Orgrimmar
    AddA(tmp[206], a[8680]); -- Liberator of Orgrimmar
    AddA(tmp[206], a[8398]); -- Ahead of the Curve: Garrosh Hellscream (10 player)
    AddA(tmp[206], a[8400]); -- Cutting Edge: Garrosh Hellscream (10 player)
    AddA(tmp[206], a[8399]); -- Ahead of the Curve: Garrosh Hellscream (25 player)
    AddA(tmp[206], a[8401]); -- Cutting Edge: Garrosh Hellscream (25 player)
    AddA(tmp[206], a[11759]); -- Yaass'shaarj
    tmp[900] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[206], tmp[900]);
    AddA(tmp[900], a[8536]); -- No More Tears
    AddA(tmp[900], a[8528]); -- Go Long
    AddA(tmp[900], a[8532]); -- None Shall Pass
    AddA(tmp[900], a[8521]); -- Swallow Your Pride
    AddA(tmp[900], a[8530]); -- The Immortal Vanguard
    AddA(tmp[900], a[8520]); -- Fire in the Hole!
    AddA(tmp[900], a[8453]); -- Rescue Raiders
    AddA(tmp[900], a[8448]); -- Gamon Will Save Us!
    AddA(tmp[900], a[8538]); -- Unlimited Potential
    AddA(tmp[900], a[8529]); -- Criss Cross
    AddA(tmp[900], a[8527]); -- Giant Dinosaur vs. Mega Snail
    AddA(tmp[900], a[8543]); -- Lasers and Magnets and Drills! Oh My!
    AddA(tmp[900], a[8531]); -- Now We are the Paragon
    AddA(tmp[900], a[8537]); -- Strike!
    tmp[901] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[206], tmp[901]);
    AddA(tmp[901], a[8463]); -- Mythic: Immerseus
    AddA(tmp[901], a[8465]); -- Mythic: Fallen Protectors
    AddA(tmp[901], a[8466]); -- Mythic: Norushen
    AddA(tmp[901], a[8467]); -- Mythic: Sha of Pride
    AddA(tmp[901], a[8468]); -- Mythic: Galakras
    AddA(tmp[901], a[8469]); -- Mythic: Iron Juggernaut
    AddA(tmp[901], a[8470]); -- Mythic: Kor'kron Dark Shaman
    AddA(tmp[901], a[8471]); -- Mythic: General Nazgrim
    AddA(tmp[901], a[8472]); -- Mythic: Malkorok
    AddA(tmp[901], a[8478]); -- Mythic: Spoils of Pandaria
    AddA(tmp[901], a[8479]); -- Mythic: Thok the Bloodthirsty
    AddA(tmp[901], a[8480]); -- Mythic: Siegecrafter Blackfuse
    AddA(tmp[901], a[8481]); -- Mythic: Paragons of the Klaxxi
    AddA(tmp[901], a[8482]); -- Mythic: Garrosh Hellscream
    tmp[549] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[189], tmp[549]);
    AddA(tmp[549], a[6616]); -- Pandaria Tamer
    AddA(tmp[549], a[6589]); -- Pandaria Safari
    AddA(tmp[549], a[8519]); -- Celestial Family
    AddA(tmp[549], a[13469]); -- Raiding with Leashes VI: Pets of Pandaria
    AddA(tmp[549], a[6606]); -- Taming Pandaria
    AddA(tmp[549], a[8410]); -- The Celestial Tournament
    AddA(tmp[549], a[8518]); -- Master of the Masters
    AddA(tmp[549], a[7908]); -- I Choose You
    AddA(tmp[549], a[7936]); -- Pandaren Spirit Tamer
    AddA(tmp[549], a[8080]); -- Fabled Pandaren Tamer
    AddA(tmp[549], a[6558]); -- Local Pet Mauler
    AddA(tmp[549], a[6559]); -- Traveling Pet Mauler
    AddA(tmp[549], a[6560]); -- World Pet Mauler
    AddA(tmp[549], a[6607]); -- Taming Azeroth
    AddA(tmp[549], a[6601]); -- Taming the Wild
    AddA(tmp[549], a[7498]); -- Taming the Great Outdoors
    AddA(tmp[549], a[7499]); -- Taming the World
    AddA(tmp[549], a[6611]); -- Continental Tamer
    AddA(tmp[549], a[6590]); -- World Safari
    AddA(tmp[549], a[8348]); -- The Longest Day
    tmp[790] = cat:New(addon.L["Brawler's Guild"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Brawler's Guild
    AddC(tmp[189], tmp[790]);
    AddA(tmp[790], a[7937]); -- You Are Not Your $#*@! Legplates (Season 1)
    AddA(tmp[790], a[8020]); -- You Are Not Your $#*@! Legplates (Season 1)
    AddA(tmp[790], a[7940]); -- The Second Rule of Brawler's Guild (Season 1)
    AddA(tmp[790], a[7939]); -- The Second Rule of Brawler's Guild (Season 1)
    AddA(tmp[790], a[7941]); -- Brawlin' and Shot Callin' (Season 1)
    AddA(tmp[790], a[7942]); -- Brawlin' and Shot Callin' (Season 1)
    AddA(tmp[790], a[8335]); -- Having a Brawl (Season 1)
    AddA(tmp[790], a[8337]); -- Having a Brawl (Season 1)
    AddA(tmp[790], a[8336]); -- I've Got the Biggest Brawls of Them All (Season 1)
    AddA(tmp[790], a[8338]); -- I've Got the Biggest Brawls of Them All (Season 1)
    AddA(tmp[790], a[7946]); -- Now You're Just Showing Off (Season 1)
    AddA(tmp[790], a[8022]); -- Now You're Just Showing Off (Season 1)
    AddA(tmp[790], a[8340]); -- Deck Your Collection (Season 1)
    AddA(tmp[790], a[8343]); -- Deck Your Collection (Season 1)
    AddA(tmp[790], a[7947]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    AddA(tmp[790], a[7948]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    tmp[192] = cat:New(addon.L["Scenarios"]); -- Scenarios
    AddC(tmp[189], tmp[192]);
    AddA(tmp[192], a[6943]); -- Queuing Spree
    AddA(tmp[192], a[7385]); -- Pub Crawl
    AddA(tmp[192], a[6874]); -- Scenaturday
    AddA(tmp[192], a[7509]); -- Scenaturday
    tmp[207] = cat:New((addon.GetLFGDungeonInfo(517))); -- A Brewing Storm
    AddC(tmp[192], tmp[207]);
    AddA(tmp[207], a[7252]); -- A Brewing Storm
    AddA(tmp[207], a[8310]); -- Heroic: A Brewing Storm
    AddA(tmp[207], a[7257]); -- Don't Shake the Keg
    AddA(tmp[207], a[7261]); -- The Perfect Pour
    AddA(tmp[207], a[7258]); -- Party of Six
    tmp[499] = cat:New((addon.GetLFGDungeonInfo(589))); -- A Little Patience
    AddC(tmp[192], tmp[499]);
    AddA(tmp[499], a[7988]); -- A Little Patience
    AddA(tmp[499], a[7989]); -- Bubbletrapped!
    AddA(tmp[499], a[7990]); -- Cannonballer
    AddA(tmp[499], a[7992]); -- I Used To Love Them
    AddA(tmp[499], a[7993]); -- We've Been Dancin'
    AddA(tmp[499], a[7991]); -- Which Came First?
    tmp[208] = cat:New((addon.GetLFGDungeonInfo(511))); -- Arena of Annihilation
    AddC(tmp[192], tmp[208]);
    AddA(tmp[208], a[7271]); -- Arena of Annihilation
    AddA(tmp[208], a[7273]); -- Beat the Heat
    AddA(tmp[208], a[7272]); -- In the Eye of the Tiger
    tmp[214] = cat:New((addon.GetLFGDungeonInfo(593))); -- Assault on Zan'vess
    AddC(tmp[192], tmp[214]);
    AddA(tmp[214], a[8016]); -- Assault on Zan'vess
    AddA(tmp[214], a[8017]); -- For the Swarm
    tmp[220] = cat:New((addon.GetLFGDungeonInfo(646))); -- Blood in the Snow
    AddC(tmp[192], tmp[220]);
    AddA(tmp[220], a[8316]); -- Blood in the Snow
    AddA(tmp[220], a[8312]); -- Heroic: Blood in the Snow
    AddA(tmp[220], a[8329]); -- Heed the Weed
    AddA(tmp[220], a[8330]); -- Hekima's Heal-Halter
    tmp[209] = cat:New((addon.GetLFGDungeonInfo(539))); -- Brewmoon Festival
    AddC(tmp[192], tmp[209]);
    AddA(tmp[209], a[6923]); -- Brewmoon Festival
    AddA(tmp[209], a[6931]); -- Binan Village All-Star
    AddA(tmp[209], a[6930]); -- Yaungolian Barbecue
    tmp[210] = cat:New((addon.GetLFGDungeonInfo(504))); -- Crypt of Forgotten Kings
    AddC(tmp[192], tmp[210]);
    AddA(tmp[210], a[7522]); -- Crypt of Forgotten Kings
    AddA(tmp[210], a[8311]); -- Heroic: Crypt of Forgotten Kings
    AddA(tmp[210], a[7276]); -- Fancy Footwork
    AddA(tmp[210], a[7275]); -- It's a Trap!
    AddA(tmp[210], a[8368]); -- Fight Anger with Anger
    tmp[215] = cat:New((addon.GetLFGDungeonInfo(616))); -- Dagger in the Dark
    AddC(tmp[192], tmp[215]);
    AddA(tmp[215], a[8009]); -- Dagger in the Dark
    AddA(tmp[215], a[7987]); -- No Egg Left Behind
    AddA(tmp[215], a[7984]); -- Watery Grave
    AddA(tmp[215], a[7986]); -- You Mean That Wasn't a Void Zone?
    tmp[221] = cat:New((addon.GetLFGDungeonInfo(647))); -- Dark Heart of Pandaria
    AddC(tmp[192], tmp[221]);
    AddA(tmp[221], a[8317]); -- Dark Heart of Pandaria
    AddA(tmp[221], a[8318]); -- Heroic: Dark Heart of Pandaria
    AddA(tmp[221], a[8319]); -- Accelerated Archaeology
    tmp[218] = cat:New((addon.GetLFGDungeonInfo(595))); -- Domination Point
    AddC(tmp[192], tmp[218]);
    AddA(tmp[218], a[8013]); -- Domination Point
    AddA(tmp[218], a[8014]); -- Number Five Is Alive
    AddA(tmp[218], a[8015]); -- "Waste Not, Want Not"
    tmp[211] = cat:New((addon.GetLFGDungeonInfo(492))); -- Greenstone Village
    AddC(tmp[192], tmp[211]);
    AddA(tmp[211], a[7265]); -- Greenstone Village
    AddA(tmp[211], a[7267]); -- Perfect Delivery
    AddA(tmp[211], a[7266]); -- Save it for Later
    tmp[216] = cat:New((addon.GetLFGDungeonInfo(590))); -- Lion's Landing
    AddC(tmp[192], tmp[216]);
    AddA(tmp[216], a[8010]); -- Lion's Landing
    AddA(tmp[216], a[8011]); -- Number Five Is Alive
    AddA(tmp[216], a[8012]); -- "Waste Not, Want Not"
    tmp[500] = cat:New(addon.GetMapName(417) .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Temple of Kotmogu
    AddC(tmp[192], tmp[500]);
    AddA(tmp[500], a[7268]); -- The Temple of Kotmogu
    AddA(tmp[500], a[7270]); -- For Display Only
    AddA(tmp[500], a[7269]); -- Stay Off the Grass
    tmp[222] = cat:New((addon.GetLFGDungeonInfo(649))); -- The Secrets of Ragefire
    AddC(tmp[192], tmp[222]);
    AddA(tmp[222], a[8294]); -- The Secrets of Ragefire
    AddA(tmp[222], a[8327]); -- Heroic: The Secrets of Ragefire
    AddA(tmp[222], a[8295]); -- "The Few, the Proud, the Gob Squad"
    tmp[212] = cat:New((addon.GetLFGDungeonInfo(566))); -- Theramore's Fall
    AddC(tmp[192], tmp[212]);
    AddA(tmp[212], a[7523]); -- Theramore's Fall
    AddA(tmp[212], a[7524]); -- Theramore's Fall
    AddA(tmp[212], a[7526]); -- Kite Fight
    AddA(tmp[212], a[7529]); -- Kite Fight
    AddA(tmp[212], a[7527]); -- No Tank You
    AddA(tmp[212], a[7530]); -- No Tank You
    AddA(tmp[212], a[7467]); -- Theramore's Fall
    AddA(tmp[212], a[7468]); -- Theramore's Fall
    tmp[213] = cat:New((addon.GetLFGDungeonInfo(499))); -- Unga Ingoo
    AddC(tmp[192], tmp[213]);
    AddA(tmp[213], a[7249]); -- Unga Ingoo
    AddA(tmp[213], a[7232]); -- The Keg Runner
    AddA(tmp[213], a[7239]); -- Monkey in the Middle
    AddA(tmp[213], a[7248]); -- "Monkey See, Monkey Kill"
    AddA(tmp[213], a[7231]); -- Spill No Evil
    tmp[219] = cat:New((addon.GetLFGDungeonInfo(655))); -- Battle on the High Seas
    AddC(tmp[192], tmp[219]);
    AddA(tmp[219], a[8314]); -- Battle on the High Seas
    AddA(tmp[219], a[8315]); -- Battle on the High Seas
    AddA(tmp[219], a[8364]); -- Heroic: Battle on the High Seas
    AddA(tmp[219], a[8366]); -- Heroic: Battle on the High Seas
    AddA(tmp[219], a[8347]); -- Keep those Bombs Away! (From Me)
    tmp[490] = cat:New((addon.GetCategoryInfo(15222))); -- Proving Grounds
    AddC(tmp[189], tmp[490]);
    AddA(tmp[490], a[9572]); -- Proving Yourself: Bronze Damage
    AddA(tmp[490], a[9573]); -- Proving Yourself: Silver Damage
    AddA(tmp[490], a[9574]); -- Proving Yourself: Gold Damage
    AddA(tmp[490], a[9575]); -- Proving Yourself: Endless Damage (Wave 10)
    AddA(tmp[490], a[9576]); -- Proving Yourself: Endless Damage (Wave 20)
    AddA(tmp[490], a[9577]); -- Proving Yourself: Endless Damage (Wave 30)
    AddA(tmp[490], a[9578]); -- Proving Yourself: Bronze Tank
    AddA(tmp[490], a[9579]); -- Proving Yourself: Silver Tank
    AddA(tmp[490], a[9580]); -- Proving Yourself: Gold Tank
    AddA(tmp[490], a[9581]); -- Proving Yourself: Endless Tank (Wave 10)
    AddA(tmp[490], a[9582]); -- Proving Yourself: Endless Tank (Wave 20)
    AddA(tmp[490], a[9583]); -- Proving Yourself: Endless Tank (Wave 30)
    AddA(tmp[490], a[9584]); -- Proving Yourself: Bronze Healer
    AddA(tmp[490], a[9585]); -- Proving Yourself: Silver Healer
    AddA(tmp[490], a[9586]); -- Proving Yourself: Gold Healer
    AddA(tmp[490], a[9587]); -- Proving Yourself: Endless Healer (Wave 10)
    AddA(tmp[490], a[9588]); -- Proving Yourself: Endless Healer (Wave 20)
    AddA(tmp[490], a[9589]); -- Proving Yourself: Endless Healer (Wave 30)
    AddA(tmp[490], a[9590]); -- You're Doing it Wrong
    AddA(tmp[490], a[9597]); -- You're Really Doing It Wrong
    AddA(tmp[490], a[8486]); -- Proving Yourself: Bronze Damage (Level 90)
    AddA(tmp[490], a[8491]); -- Proving Yourself: Silver Damage (Level 90)
    AddA(tmp[490], a[8496]); -- Proving Yourself: Gold Damage (Level 90)
    AddA(tmp[490], a[8501]); -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
    AddA(tmp[490], a[8504]); -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
    AddA(tmp[490], a[8507]); -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
    AddA(tmp[490], a[8487]); -- Proving Yourself: Bronze Tank (Level 90)
    AddA(tmp[490], a[8492]); -- Proving Yourself: Silver Tank (Level 90)
    AddA(tmp[490], a[8497]); -- Proving Yourself: Gold Tank (Level 90)
    AddA(tmp[490], a[8502]); -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
    AddA(tmp[490], a[8505]); -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
    AddA(tmp[490], a[8508]); -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
    AddA(tmp[490], a[8488]); -- Proving Yourself: Bronze Healer (Level 90)
    AddA(tmp[490], a[8493]); -- Proving Yourself: Silver Healer (Level 90)
    AddA(tmp[490], a[8498]); -- Proving Yourself: Gold Healer (Level 90)
    AddA(tmp[490], a[8503]); -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
    AddA(tmp[490], a[8506]); -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
    AddA(tmp[490], a[8509]); -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
    AddA(tmp[490], a[8697]); -- You're Doing it Wrong (Level 90)
    AddA(tmp[490], a[8812]); -- You're Really Doing It Wrong (Level 90)
    tmp[223] = cat:New((addon.GetCategoryInfo(15233))); -- Warlords of Dreanor
    AddC(tmp[883], tmp[223]);
    AddA(tmp[223], a[9838]); -- "What A Strange, Interdimensional Trip It's Been"
    AddA(tmp[223], a[9640]); -- Chapter I: Call of the Archmage
    AddA(tmp[223], a[9641]); -- Chapter II: Gul'dan Strikes Back
    AddA(tmp[223], a[9642]); -- Chapter III: The Foundry Falls
    AddA(tmp[223], a[10021]); -- Chapter IV: Darkness Incarnate
    AddA(tmp[223], a[10148]); -- Chapter IV: Darkness Incarnate
    tmp[449] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[223], tmp[449]);
    tmp[486] = cat:New(addon.GetMapName(572)); -- Draenor
    AddC(tmp[449], tmp[486]);
    AddA(tmp[486], a[10053]); -- I Found Pepe!
    tmp[487] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[486], tmp[487]);
    AddA(tmp[487], a[8921]); -- Welcome to Draenor
    AddA(tmp[487], a[8922]); -- Welcome to Draenor
    AddA(tmp[487], a[9491]); -- The Garrison Campaign
    AddA(tmp[487], a[9492]); -- The Garrison Campaign
    AddA(tmp[487], a[9564]); -- Securing Draenor
    AddA(tmp[487], a[9562]); -- Securing Draenor
    AddA(tmp[487], a[9833]); -- Loremaster of Draenor
    AddA(tmp[487], a[9923]); -- Loremaster of Draenor
    AddA(tmp[487], a[7520]); -- The Loremaster
    tmp[488] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[486], tmp[488]);
    AddA(tmp[488], a[10018]); -- Draenor Pathfinder
    AddA(tmp[488], a[9726]); -- Treasure Hunter
    AddA(tmp[488], a[9727]); -- Expert Treasure Hunter
    AddA(tmp[488], a[10348]); -- Master Treasure Hunter
    AddA(tmp[488], a[9728]); -- Grand Treasure Hunter
    AddA(tmp[488], a[9502]); -- Draenor Cuisine
    AddA(tmp[488], a[14728]); -- To All the Squirrels Through Time and Space
    AddA(tmp[488], a[8935]); -- Draenor Explorer
    tmp[489] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[486], tmp[489]);
    AddA(tmp[489], a[9477]); -- Savage Friends
    AddA(tmp[489], a[9478]); -- Savage Friends
    tmp[450] = cat:New(addon.GetMapName(539)); -- Shadowmoon Valley
    AddC(tmp[449], tmp[450]);
    tmp[457] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[450], tmp[457]);
    AddA(tmp[457], a[8845]); -- As I Walk Through the Valley of the Shadow of Moon
    AddA(tmp[457], a[9602]); -- Shoot For the Moon
    AddA(tmp[457], a[9528]); -- On the Shadow's Trail
    AddA(tmp[457], a[9433]); -- A-VOID-ance
    AddA(tmp[457], a[9434]); -- One of Us! One of Us!
    AddA(tmp[457], a[9432]); -- Would You Like a Pamphlet?
    AddA(tmp[457], a[9436]); -- It's the Stones!
    AddA(tmp[457], a[9435]); -- Take From Them Everything
    AddA(tmp[457], a[9437]); -- A Demidos of Reality
    AddA(tmp[457], a[9483]); -- I Was Framed!
    AddA(tmp[457], a[9479]); -- You Can't Make a Giant Omelette...
    AddA(tmp[457], a[9481]); -- You Have Been Rylakinated!
    tmp[458] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[450], tmp[458]);
    AddA(tmp[458], a[8938]); -- Explore Shadowmoon Valley
    AddA(tmp[458], a[9924]); -- Field Photographer
    tmp[460] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[450], tmp[460]);
    AddA(tmp[460], a[9470]); -- Council of Exarchs
    tmp[451] = cat:New(addon.GetMapName(525)); -- Frostfire Ridge
    AddC(tmp[449], tmp[451]);
    tmp[461] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[451], tmp[461]);
    AddA(tmp[461], a[8671]); -- You'll Get Caught Up In The... Frostfire!
    AddA(tmp[461], a[9606]); -- Frostfire Fridge
    AddA(tmp[461], a[9529]); -- On the Shadow's Trail
    AddA(tmp[461], a[9533]); -- Breaker of Chains
    AddA(tmp[461], a[9530]); -- Writing in the Snow
    AddA(tmp[461], a[9531]); -- Writing in the Snow
    AddA(tmp[461], a[9534]); -- Delectable Ogre Delicacies
    AddA(tmp[461], a[9537]); -- By Fire Be... Merged?
    AddA(tmp[461], a[9536]); -- Slagnarok
    AddA(tmp[461], a[9535]); -- That Was Entirely Unnecessary
    AddA(tmp[461], a[9710]); -- Poisoning the Well
    AddA(tmp[461], a[9711]); -- Planned to Fail
    tmp[462] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[451], tmp[462]);
    AddA(tmp[462], a[8937]); -- Explore Frostfire Ridge
    tmp[464] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[451], tmp[464]);
    AddA(tmp[464], a[9471]); -- Frostwolf Orcs
    tmp[452] = cat:New(addon.GetMapName(543)); -- Gorgrond
    AddC(tmp[449], tmp[452]);
    AddA(tmp[452], a[9423]); -- Goliaths of Gorgrond
    tmp[465] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[452], tmp[465]);
    AddA(tmp[465], a[8923]); -- Putting the Gore in Gorgrond
    AddA(tmp[465], a[8924]); -- Putting the Gore in Gorgrond
    AddA(tmp[465], a[9607]); -- Make It a Bonus
    AddA(tmp[465], a[9655]); -- Fight the Power
    AddA(tmp[465], a[9656]); -- In Plain Sight
    AddA(tmp[465], a[9659]); -- Iron Wings
    AddA(tmp[465], a[9678]); -- Ancient No More
    AddA(tmp[465], a[9667]); -- Burn It to the Ground
    AddA(tmp[465], a[9654]); -- Mean and Green
    AddA(tmp[465], a[9658]); -- Pillars of Draenor
    AddA(tmp[465], a[9663]); -- Picky Palate
    tmp[466] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[452], tmp[466]);
    AddA(tmp[466], a[8939]); -- Explore Gorgrond
    AddA(tmp[466], a[9400]); -- Gorgrond Monster Hunter
    AddA(tmp[466], a[9401]); -- Shredder Maniac
    AddA(tmp[466], a[9402]); -- Prove Your Strength
    tmp[468] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[452], tmp[468]);
    AddA(tmp[468], a[9475]); -- Laughing Skull Orcs
    tmp[453] = cat:New(addon.GetMapName(535)); -- Talador
    AddC(tmp[449], tmp[453]);
    tmp[469] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[453], tmp[469]);
    AddA(tmp[469], a[8920]); -- Don't Let the Tala-door Hit You on the Way Out
    AddA(tmp[469], a[8919]); -- Don't Let the Tala-door Hit You on the Way Out
    AddA(tmp[469], a[9674]); -- I Want More Talador
    AddA(tmp[469], a[9633]); -- Cut off the Head
    AddA(tmp[469], a[9638]); -- Heralds of the Legion
    AddA(tmp[469], a[9635]); -- Bobbing for Orcs
    AddA(tmp[469], a[9634]); -- Charged Up
    AddA(tmp[469], a[9636]); -- United We Stand
    AddA(tmp[469], a[9632]); -- The Power Is Yours
    AddA(tmp[469], a[9637]); -- Poor Communication
    AddA(tmp[469], a[9486]); -- Goodness Gracious
    tmp[470] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[453], tmp[470]);
    AddA(tmp[470], a[8940]); -- Explore Talador
    tmp[472] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[453], tmp[472]);
    AddA(tmp[472], a[9476]); -- Sha'tari Defense
    tmp[454] = cat:New(addon.GetMapName(542)); -- Spires of Arak
    AddC(tmp[449], tmp[454]);
    AddA(tmp[454], a[9425]); -- So Grossly Incandescent
    tmp[473] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[454], tmp[473]);
    AddA(tmp[473], a[8925]); -- Between Arak and a Hard Place
    AddA(tmp[473], a[8926]); -- Between Arak and a Hard Place
    AddA(tmp[473], a[9605]); -- Arak Star
    AddA(tmp[473], a[9612]); -- Eggs in One Basket
    AddA(tmp[473], a[9613]); -- "Fish Gotta Swim, Birds Gotta Eat"
    AddA(tmp[473], a[9601]); -- King of the Monsters
    AddA(tmp[473], a[9600]); -- Monster Mash
    tmp[474] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[454], tmp[474]);
    AddA(tmp[474], a[8941]); -- Explore Spires of Arak
    tmp[476] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[454], tmp[476]);
    AddA(tmp[476], a[9469]); -- Arakkoa Outcasts
    AddA(tmp[476], a[9072]); -- Mantle of the Talon King
    tmp[455] = cat:New(addon.GetMapName(550)); -- Nagrand
    AddC(tmp[449], tmp[455]);
    tmp[477] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[455], tmp[477]);
    AddA(tmp[477], a[8927]); -- Nagrandeur
    AddA(tmp[477], a[8928]); -- Nagrandeur
    AddA(tmp[477], a[9615]); -- With a Nagrand Cherry On Top
    AddA(tmp[477], a[9610]); -- History of Violence
    AddA(tmp[477], a[9571]); -- Broke Back Precipice
    AddA(tmp[477], a[9548]); -- Buried Treasures
    AddA(tmp[477], a[9541]); -- The Song of Silence
    AddA(tmp[477], a[9617]); -- Making the Cut
    tmp[478] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[455], tmp[478]);
    AddA(tmp[478], a[8942]); -- Explore Nagrand
    AddA(tmp[478], a[9924]); -- Field Photographer
    tmp[480] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[455], tmp[480]);
    AddA(tmp[480], a[9472]); -- Steamwheedle Preservation Society
    tmp[456] = cat:New(addon.GetMapName(534)); -- Tanaan Jungle
    AddC(tmp[449], tmp[456]);
    AddA(tmp[456], a[10071]); -- The Legion Will NOT Conquer All
    tmp[481] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[456], tmp[481]);
    AddA(tmp[481], a[10067]); -- In Pursuit of Gul'dan
    AddA(tmp[481], a[10074]); -- In Pursuit of Gul'dan
    AddA(tmp[481], a[10068]); -- Draenor's Last Stand
    AddA(tmp[481], a[10075]); -- Draenor's Last Stand
    AddA(tmp[481], a[10072]); -- Rumble in the Jungle
    AddA(tmp[481], a[10265]); -- Rumble in the Jungle
    tmp[482] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[456], tmp[482]);
    AddA(tmp[482], a[10261]); -- Jungle Treasure Hunter
    AddA(tmp[482], a[10262]); -- Jungle Treasure Master
    AddA(tmp[482], a[10260]); -- Explore Tanaan Jungle
    AddA(tmp[482], a[10069]); -- "I Came, I Clawed, I Conquered"
    AddA(tmp[482], a[10061]); -- Hellbane
    AddA(tmp[482], a[10259]); -- Jungle Hunter
    AddA(tmp[482], a[10070]); -- Jungle Stalker
    AddA(tmp[482], a[10334]); -- Predator
    tmp[484] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[456], tmp[484]);
    AddA(tmp[484], a[10349]); -- Tanaan Diplomat
    AddA(tmp[484], a[10350]); -- Tanaan Diplomat
    tmp[224] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[223], tmp[224]);
    AddA(tmp[224], a[9391]); -- Draenor Dungeon Hero
    AddA(tmp[224], a[9619]); -- Savage Hero
    AddA(tmp[224], a[9396]); -- Glory of the Draenor Hero
    AddA(tmp[224], a[8895]); -- Challenge Warlord
    AddA(tmp[224], a[8897]); -- Challenge Warlord: Bronze
    AddA(tmp[224], a[8898]); -- Challenge Warlord: Silver
    AddA(tmp[224], a[8899]); -- Challenge Warlord: Gold
    tmp[226] = cat:New((addon.EJ_GetInstanceInfo(385))); -- Bloodmaul Slag Mines
    AddC(tmp[224], tmp[226]);
    AddA(tmp[226], a[9005]); -- Come With Me If You Want to Live
    AddA(tmp[226], a[8993]); -- A Gift of Earth and Fire
    AddA(tmp[226], a[9008]); -- Is Draenor on Fire?
    AddA(tmp[226], a[9037]); -- Bloodmaul Slag Mines
    AddA(tmp[226], a[9046]); -- Heroic: Bloodmaul Slag Mines
    AddA(tmp[226], a[10076]); -- Mythic: Bloodmaul Slag Mines
    AddA(tmp[226], a[8875]); -- Bloodmaul Slag Mines Challenger
    AddA(tmp[226], a[8876]); -- Bloodmaul Slag Mines: Bronze
    AddA(tmp[226], a[8877]); -- Bloodmaul Slag Mines: Silver
    AddA(tmp[226], a[8878]); -- Bloodmaul Slag Mines: Gold
    AddA(tmp[226], a[9620]); -- Challenge Master: Bloodmaul Slag Mines
    tmp[227] = cat:New((addon.EJ_GetInstanceInfo(558))); -- Iron Docks
    AddC(tmp[224], tmp[227]);
    AddA(tmp[227], a[9081]); -- Expert Timing
    AddA(tmp[227], a[9083]); -- "Militaristic, Expansionist"
    AddA(tmp[227], a[9082]); -- Take Cover!
    AddA(tmp[227], a[9038]); -- Iron Docks
    AddA(tmp[227], a[9047]); -- Heroic: Iron Docks
    AddA(tmp[227], a[10079]); -- Mythic: Iron Docks
    AddA(tmp[227], a[8997]); -- Iron Docks Challenger
    AddA(tmp[227], a[8998]); -- Iron Docks: Bronze
    AddA(tmp[227], a[8999]); -- Iron Docks: Silver
    AddA(tmp[227], a[9000]); -- Iron Docks: Gold
    AddA(tmp[227], a[9621]); -- Challenge Master: Iron Docks
    AddA(tmp[227], a[15694]); -- Keystone Hero: Iron Docks
    tmp[228] = cat:New((addon.EJ_GetInstanceInfo(547))); -- Auchindoun
    AddC(tmp[224], tmp[228]);
    AddA(tmp[228], a[9023]); -- ...They All Fall Down
    AddA(tmp[228], a[9551]); -- Demon's Souls
    AddA(tmp[228], a[9552]); -- No Tag-backs!
    AddA(tmp[228], a[9039]); -- Auchindoun
    AddA(tmp[228], a[9049]); -- Heroic: Auchindoun
    AddA(tmp[228], a[10080]); -- Mythic: Auchindoun
    AddA(tmp[228], a[8879]); -- Auchindoun Challenger
    AddA(tmp[228], a[8880]); -- Auchindoun: Bronze
    AddA(tmp[228], a[8881]); -- Auchindoun: Silver
    AddA(tmp[228], a[8882]); -- Auchindoun: Gold
    AddA(tmp[228], a[9622]); -- Challenge Master: Auchindoun
    AddA(tmp[228], a[9924]); -- Field Photographer
    tmp[229] = cat:New((addon.EJ_GetInstanceInfo(476))); -- Skyreach
    AddC(tmp[224], tmp[229]);
    AddA(tmp[229], a[9033]); -- Ready for Raiding IV
    AddA(tmp[229], a[9035]); -- I Saw Solis
    AddA(tmp[229], a[9034]); -- Magnify... Enhance
    AddA(tmp[229], a[9036]); -- Monomania
    AddA(tmp[229], a[8843]); -- Skyreach
    AddA(tmp[229], a[8844]); -- Heroic: Skyreach
    AddA(tmp[229], a[10081]); -- Mythic: Skyreach
    AddA(tmp[229], a[8871]); -- Skyreach Challenger
    AddA(tmp[229], a[8872]); -- Skyreach: Bronze
    AddA(tmp[229], a[8873]); -- Skyreach: Silver
    AddA(tmp[229], a[8874]); -- Skyreach: Gold
    AddA(tmp[229], a[9623]); -- Challenge Master: Skyreach
    tmp[230] = cat:New((addon.EJ_GetInstanceInfo(536))); -- Grimrail Depot
    AddC(tmp[224], tmp[230]);
    AddA(tmp[230], a[9024]); -- This Is Why We Can't Have Nice Things
    AddA(tmp[230], a[9007]); -- No Ticket
    AddA(tmp[230], a[9043]); -- Grimrail Depot
    AddA(tmp[230], a[9052]); -- Heroic: Grimrail Depot
    AddA(tmp[230], a[10082]); -- Mythic: Grimrail Depot
    AddA(tmp[230], a[8887]); -- Grimrail Depot Challenger
    AddA(tmp[230], a[8888]); -- Grimrail Depot: Bronze
    AddA(tmp[230], a[8889]); -- Grimrail Depot: Silver
    AddA(tmp[230], a[8890]); -- Grimrail Depot: Gold
    AddA(tmp[230], a[9625]); -- Challenge Master: Grimrail Depot
    AddA(tmp[230], a[15695]); -- Keystone Hero: Grimrail Depot
    tmp[231] = cat:New((addon.EJ_GetInstanceInfo(556))); -- The Everbloom
    AddC(tmp[224], tmp[231]);
    AddA(tmp[231], a[9017]); -- Water Management
    AddA(tmp[231], a[9493]); -- "They Burn, Burn, Burn"
    AddA(tmp[231], a[9223]); -- Weed Whacker
    AddA(tmp[231], a[9044]); -- The Everbloom
    AddA(tmp[231], a[9053]); -- Heroic: The Everbloom
    AddA(tmp[231], a[10083]); -- Mythic: The Everbloom
    AddA(tmp[231], a[9001]); -- The Everbloom Challenger
    AddA(tmp[231], a[9002]); -- The Everbloom: Bronze
    AddA(tmp[231], a[9003]); -- The Everbloom: Silver
    AddA(tmp[231], a[9004]); -- The Everbloom: Gold
    AddA(tmp[231], a[9624]); -- Challenge Master: The Everbloom
    tmp[232] = cat:New((addon.EJ_GetInstanceInfo(537))); -- Shadowmoon Burial Grounds
    AddC(tmp[224], tmp[232]);
    AddA(tmp[232], a[9018]); -- What's Your Sign?
    AddA(tmp[232], a[9025]); -- Icky Ichors
    AddA(tmp[232], a[9026]); -- Souls of the Lost
    AddA(tmp[232], a[9041]); -- Shadowmoon Burial Grounds
    AddA(tmp[232], a[9054]); -- Heroic: Shadowmoon Burial Grounds
    AddA(tmp[232], a[10084]); -- Mythic: Shadowmoon Burial Grounds
    AddA(tmp[232], a[8883]); -- Shadowmoon Burial Grounds Challenger
    AddA(tmp[232], a[8884]); -- Shadowmoon Burial Grounds: Bronze
    AddA(tmp[232], a[8885]); -- Shadowmoon Burial Grounds: Silver
    AddA(tmp[232], a[8886]); -- Shadowmoon Burial Grounds: Gold
    AddA(tmp[232], a[9626]); -- Challenge Master: Shadowmoon Burial Grounds
    tmp[233] = cat:New((addon.EJ_GetInstanceInfo(559))); -- Upper Blackrock Spire
    AddC(tmp[224], tmp[233]);
    AddA(tmp[233], a[9045]); -- "Magnets, How Do They Work?"
    AddA(tmp[233], a[9058]); -- Leeeeeeeeeeeeeroy...?
    AddA(tmp[233], a[9056]); -- Bridge Over Troubled Fire
    AddA(tmp[233], a[9057]); -- Dragonmaw? More Like Dragonfall!
    AddA(tmp[233], a[9042]); -- Upper Blackrock Spire
    AddA(tmp[233], a[9055]); -- Heroic: Upper Blackrock Spire
    AddA(tmp[233], a[10085]); -- Mythic: Upper Blackrock Spire
    AddA(tmp[233], a[8891]); -- Upper Blackrock Spire Challenger
    AddA(tmp[233], a[8892]); -- Upper Blackrock Spire: Bronze
    AddA(tmp[233], a[8893]); -- Upper Blackrock Spire: Silver
    AddA(tmp[233], a[8894]); -- Upper Blackrock Spire: Gold
    AddA(tmp[233], a[9627]); -- Challenge Master: Upper Blackrock Spire
    tmp[225] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[223], tmp[225]);
    AddA(tmp[225], a[9619]); -- Savage Hero
    AddA(tmp[225], a[8985]); -- Glory of the Draenor Raider
    AddA(tmp[225], a[10149]); -- Glory of the Hellfire Raider
    tmp[234] = cat:New((addon.EJ_GetInstanceInfo(477))); -- Highmaul
    AddC(tmp[225], tmp[234]);
    AddA(tmp[234], a[8986]); -- The Walled City
    AddA(tmp[234], a[8987]); -- Arcane Sanctum
    AddA(tmp[234], a[8988]); -- Imperator's Fall
    AddA(tmp[234], a[9441]); -- Ahead of the Curve: Imperator's Fall
    AddA(tmp[234], a[9442]); -- Cutting Edge: Imperator's Fall
    tmp[886] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[234], tmp[886]);
    AddA(tmp[886], a[8948]); -- Flame On!
    AddA(tmp[886], a[8947]); -- "Hurry Up, Maggot!"
    AddA(tmp[886], a[8974]); -- More Like Wrecked-us
    AddA(tmp[886], a[8975]); -- A Fungus Among Us
    AddA(tmp[886], a[8958]); -- Brothers in Arms
    AddA(tmp[886], a[8976]); -- Pair Annihilation
    AddA(tmp[886], a[8977]); -- Lineage of Power
    tmp[887] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[234], tmp[887]);
    AddA(tmp[887], a[8949]); -- Mythic: Kargath Bladefist
    AddA(tmp[887], a[8960]); -- Mythic: The Butcher
    AddA(tmp[887], a[8961]); -- Mythic: Tectus
    AddA(tmp[887], a[8962]); -- Mythic: Brackenspore
    AddA(tmp[887], a[8963]); -- Mythic: Twin Ogron
    AddA(tmp[887], a[8964]); -- Mythic: Ko'ragh
    AddA(tmp[887], a[8965]); -- Mythic: Imperator's Fall
    tmp[235] = cat:New((addon.EJ_GetInstanceInfo(457))); -- Blackrock Foundry
    AddC(tmp[225], tmp[235]);
    AddA(tmp[235], a[8989]); -- Slagworks
    AddA(tmp[235], a[8990]); -- Black Forge
    AddA(tmp[235], a[8991]); -- Iron Assembly
    AddA(tmp[235], a[8992]); -- Blackhand's Crucible
    AddA(tmp[235], a[9444]); -- Ahead of the Curve: Blackhand's Crucible
    AddA(tmp[235], a[9443]); -- Cutting Edge: Blackhand's Crucible
    AddA(tmp[235], a[11740]); -- Make it W-orc W-orc
    tmp[888] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[235], tmp[888]);
    AddA(tmp[888], a[8979]); -- "He Shoots, He Ores"
    AddA(tmp[888], a[8978]); -- The Iron Price
    AddA(tmp[888], a[8930]); -- "Ya, We've Got Time..."
    AddA(tmp[888], a[8980]); -- Stamp Stamp Revolution
    AddA(tmp[888], a[8929]); -- The Steel Has Been Brought
    AddA(tmp[888], a[8983]); -- Would You Give Me a Hand?
    AddA(tmp[888], a[8981]); -- Fain Would Lie Down
    AddA(tmp[888], a[8982]); -- There's Always a Bigger Train
    AddA(tmp[888], a[8984]); -- Be Quick or Be Dead
    AddA(tmp[888], a[8952]); -- "Ashes, Ashes..."
    tmp[889] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[235], tmp[889]);
    AddA(tmp[889], a[8967]); -- Mythic: Oregorger
    AddA(tmp[889], a[8966]); -- Mythic: Gruul
    AddA(tmp[889], a[8970]); -- Mythic: Blast Furnace
    AddA(tmp[889], a[8968]); -- Mythic: Hans'gar and Franzok
    AddA(tmp[889], a[8932]); -- Mythic: Flamebender Ka'graz
    AddA(tmp[889], a[8971]); -- Mythic: Kromog
    AddA(tmp[889], a[8956]); -- Mythic: Beastlord Darmac
    AddA(tmp[889], a[8969]); -- Mythic: Operator Thogar
    AddA(tmp[889], a[8972]); -- Mythic: Iron Maidens
    AddA(tmp[889], a[8973]); -- Mythic: Blackhand's Crucible
    tmp[236] = cat:New((addon.EJ_GetInstanceInfo(669))); -- Hellfire Citadel
    AddC(tmp[225], tmp[236]);
    AddA(tmp[236], a[10023]); -- Hellbreach
    AddA(tmp[236], a[10024]); -- Halls of Blood
    AddA(tmp[236], a[10025]); -- Bastion of Shadows
    AddA(tmp[236], a[10020]); -- Destructor's Rise
    AddA(tmp[236], a[10019]); -- The Black Gate
    AddA(tmp[236], a[9680]); -- Time is a Flat Circle
    AddA(tmp[236], a[10044]); -- Ahead of the Curve: The Black Gate
    AddA(tmp[236], a[10045]); -- Cutting Edge: The Black Gate
    AddA(tmp[236], a[11631]); -- Extreme Makeover: Fel Edition
    tmp[890] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[236], tmp[890]);
    AddA(tmp[890], a[10026]); -- Nearly Indestructible
    AddA(tmp[890], a[10057]); -- Turning the Tide
    AddA(tmp[890], a[10013]); -- Waves Came Crashing Down All Around
    AddA(tmp[890], a[10054]); -- Don't Fear the Reaper
    AddA(tmp[890], a[9972]); -- A Race Against Slime
    AddA(tmp[890], a[9979]); -- Get In My Belly!
    AddA(tmp[890], a[9988]); -- Pro Toss
    AddA(tmp[890], a[10086]); -- I'm a Soul Man
    AddA(tmp[890], a[9989]); -- Non-Lethal Enforcer
    AddA(tmp[890], a[10012]); -- This Land Was Green and Good Until...
    AddA(tmp[890], a[10087]); -- You Gotta Keep 'em Separated
    AddA(tmp[890], a[10030]); -- Bad Manner(oth)
    AddA(tmp[890], a[10073]); -- Echoes of Doomfire
    tmp[891] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[236], tmp[891]);
    AddA(tmp[891], a[10027]); -- Mythic: Hellfire Assault
    AddA(tmp[891], a[10032]); -- Mythic: Iron Reaver
    AddA(tmp[891], a[10033]); -- Mythic: Kormrok
    AddA(tmp[891], a[10034]); -- Mythic: Hellfire High Council
    AddA(tmp[891], a[10035]); -- Mythic: Kilrogg Deadeye
    AddA(tmp[891], a[10253]); -- Mythic: Gorefiend
    AddA(tmp[891], a[10037]); -- Mythic: Shadow-Lord Iskar
    AddA(tmp[891], a[10040]); -- Mythic: Socrethar the Eternal
    AddA(tmp[891], a[10041]); -- Mythic: Tyrant Velhari
    AddA(tmp[891], a[10038]); -- Mythic: Fel Lord Zakuun
    AddA(tmp[891], a[10039]); -- Mythic: Xhul'horac
    AddA(tmp[891], a[10042]); -- Mythic: Mannoroth
    AddA(tmp[891], a[10043]); -- Mythic: Archimonde
    tmp[548] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[223], tmp[548]);
    AddA(tmp[548], a[9685]); -- Draenor Safari
    AddA(tmp[548], a[9069]); -- An Awfully Big Adventure
    AddA(tmp[548], a[9463]); -- Draenic Pet Battler
    AddA(tmp[548], a[9724]); -- Taming Draenor
    AddA(tmp[548], a[10052]); -- Tiny Terrors in Tanaan
    tmp[791] = cat:New(addon.L["Brawler's Guild"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Brawler's Guild
    AddC(tmp[223], tmp[791]);
    AddA(tmp[791], a[9168]); -- You Are Not Your $#*@! Legplates (Season 2)
    AddA(tmp[791], a[9172]); -- You Are Not Your $#*@! Legplates (Season 2)
    AddA(tmp[791], a[9169]); -- The Second Rule of Brawler's Guild (Season 2)
    AddA(tmp[791], a[9173]); -- The Second Rule of Brawler's Guild (Season 2)
    AddA(tmp[791], a[9170]); -- Brawlin' and Shot Callin' (Season 2)
    AddA(tmp[791], a[9174]); -- Brawlin' and Shot Callin' (Season 2)
    AddA(tmp[791], a[9171]); -- Now You're Just Showing Off (Season 2)
    AddA(tmp[791], a[9175]); -- Now You're Just Showing Off (Season 2)
    AddA(tmp[791], a[8339]); -- Collect Your Deck (Season 2)
    AddA(tmp[791], a[8342]); -- Collect Your Deck (Season 2)
    AddA(tmp[791], a[9176]); -- Deck Your Collection (Season 2)
    AddA(tmp[791], a[9177]); -- Deck Your Collection (Season 2)
    AddA(tmp[791], a[7949]); -- Rabble Rabble Rabble (Season 2)
    AddA(tmp[791], a[7950]); -- Rabble Rabble Rabble (Season 2)
    AddA(tmp[791], a[7943]); -- I'm Your Number One Fan (Season 2)
    AddA(tmp[791], a[7945]); -- Haters Gonna Hate (Season 2)
    AddA(tmp[791], a[7944]); -- Bottle Service (Season 2)
    AddA(tmp[791], a[7947]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    AddA(tmp[791], a[7948]); -- The First Rule of Brawler's Guild (Season 1 or 2)
    tmp[432] = cat:New(addon.L["Garrison"]); -- Garrison
    AddC(tmp[223], tmp[432]);
    AddA(tmp[432], a[9100]); -- More Plots
    AddA(tmp[432], a[9545]); -- More Plots
    AddA(tmp[432], a[9101]); -- Even More Plots
    AddA(tmp[432], a[9546]); -- Even More Plots
    AddA(tmp[432], a[9210]); -- Garrison Buddies
    AddA(tmp[432], a[9132]); -- Garrison Buddies
    AddA(tmp[432], a[8933]); -- Staying Regular
    AddA(tmp[432], a[9928]); -- Don't Call Me Junior
    AddA(tmp[432], a[9901]); -- Don't Call Me Junior
    AddA(tmp[432], a[9828]); -- Ten Hit Tunes
    AddA(tmp[432], a[9897]); -- Ten Hit Tunes
    AddA(tmp[432], a[9912]); -- Azeroth's Top Twenty Tunes
    AddA(tmp[432], a[9914]); -- Azeroth's Top Twenty Tunes
    AddA(tmp[432], a[10015]); -- Full Discography
    AddA(tmp[432], a[10016]); -- Full Discography
    AddA(tmp[432], a[9107]); -- Follow the Leader
    AddA(tmp[432], a[9108]); -- "Where You Go, They Will Follow"
    AddA(tmp[432], a[9109]); -- Fearless Leader
    AddA(tmp[432], a[9494]); -- Commander
    AddA(tmp[432], a[9110]); -- Following Up
    AddA(tmp[432], a[9111]); -- Raising the Bar
    AddA(tmp[432], a[9129]); -- Filling the Ranks
    AddA(tmp[432], a[9130]); -- A Rare Friend
    AddA(tmp[432], a[9131]); -- An Epic Buddy
    AddA(tmp[432], a[9211]); -- My Item Level Is Higher than Yours
    AddA(tmp[432], a[9212]); -- My Item Level Is Way Higher than Yours
    AddA(tmp[432], a[9213]); -- Item Level Army
    AddA(tmp[432], a[9243]); -- Item Level Force
    AddA(tmp[432], a[9152]); -- It's an Invasion!
    AddA(tmp[432], a[9133]); -- On a Mission
    AddA(tmp[432], a[9134]); -- On a Few Missions
    AddA(tmp[432], a[9138]); -- On a Lot of Missions
    AddA(tmp[432], a[9139]); -- On a Massive Number of Missions
    AddA(tmp[432], a[9140]); -- On a Metric Ton of Missions
    AddA(tmp[432], a[9141]); -- A Rare Mission
    AddA(tmp[432], a[9142]); -- Keeping It Rare
    AddA(tmp[432], a[9143]); -- The Rarer the Better
    AddA(tmp[432], a[9145]); -- Treasure Mission Specialist
    AddA(tmp[432], a[9524]); -- Treasure Master
    AddA(tmp[432], a[9146]); -- Patrol Mission Specialist
    AddA(tmp[432], a[9523]); -- Patrolling Draenor
    AddA(tmp[432], a[9147]); -- Mission Specialist
    AddA(tmp[432], a[9150]); -- Exploration Mission Specialist
    AddA(tmp[432], a[9900]); -- Exploration Mission Master
    AddA(tmp[432], a[9246]); -- Master Draenor Crafter
    AddA(tmp[432], a[9248]); -- Defender of Draenor
    AddA(tmp[432], a[9630]); -- Defender of Draenor
    AddA(tmp[432], a[9255]); -- Mythic Draenor Raider
    AddA(tmp[432], a[9631]); -- Mythic Draenor Raider
    AddA(tmp[432], a[9264]); -- Draenor Pet Brawler
    AddA(tmp[432], a[9265]); -- Master of Apexis
    tmp[485] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[432], tmp[485]);
    AddA(tmp[485], a[9825]); -- Master Relic Hunter
    AddA(tmp[485], a[9836]); -- Master Relic Hunter
    tmp[852] = cat:New(addon.L["Buildings"]); -- Buildings
    AddC(tmp[432], tmp[852]);
    AddA(tmp[852], a[9125]); -- Draftsman
    AddA(tmp[852], a[9126]); -- Master Draftsman
    AddA(tmp[852], a[9128]); -- Grand Master Draftsman
    AddA(tmp[852], a[9095]); -- Builder
    AddA(tmp[852], a[9096]); -- Master Builder
    AddA(tmp[852], a[9097]); -- Keepin' Busy
    AddA(tmp[852], a[9094]); -- Garrison Architect
    AddA(tmp[852], a[9487]); -- Got My Mind On My Draenor Money
    AddA(tmp[852], a[9076]); -- Choppin' Some Logs
    AddA(tmp[852], a[9077]); -- Choppin' Some More Logs
    AddA(tmp[852], a[9080]); -- Choppin' Even More Logs
    AddA(tmp[852], a[9078]); -- Choppin' Even More Logs
    AddA(tmp[852], a[9429]); -- Upgrading the Mill
    AddA(tmp[852], a[9099]); -- Time for an Upgrade
    AddA(tmp[852], a[9098]); -- Movin' On Up
    AddA(tmp[852], a[9405]); -- Working Some Orders
    AddA(tmp[852], a[9406]); -- Working More Orders
    AddA(tmp[852], a[9407]); -- Working Many Orders
    AddA(tmp[852], a[9450]); -- The Trap Game
    AddA(tmp[852], a[9565]); -- Master Trapper
    AddA(tmp[852], a[9451]); -- Trapper's Delight
    AddA(tmp[852], a[9452]); -- Trap Superstar
    AddA(tmp[852], a[9468]); -- Salvaging Pays Off
    AddA(tmp[852], a[9495]); -- The Bone Collector
    AddA(tmp[852], a[9497]); -- Finding Your Waystones
    AddA(tmp[852], a[9498]); -- Wingman
    AddA(tmp[852], a[9499]); -- Wingmen
    AddA(tmp[852], a[9538]); -- Intro to Husbandry
    AddA(tmp[852], a[9527]); -- Terrific Technology
    AddA(tmp[852], a[9703]); -- Stay Awhile and Listen
    AddA(tmp[852], a[9453]); -- Draenic Stone Collector
    AddA(tmp[852], a[9454]); -- Draenic Seed Collector
    tmp[854] = cat:New(addon.L["Stables"], true); -- Stables
    AddC(tmp[852], tmp[854]);
    AddA(tmp[854], a[9526]); -- Master of Mounts
    AddA(tmp[854], a[9539]); -- Advanced Husbandry
    AddA(tmp[854], a[9705]); -- Advanced Husbandry
    AddA(tmp[854], a[9540]); -- The Stable Master
    AddA(tmp[854], a[9706]); -- The Stable Master
    tmp[853] = cat:New(addon.L["Gladiator's Sanctum"], true); -- Gladiator's Sanctum
    AddC(tmp[852], tmp[853]);
    AddA(tmp[853], a[9517]); -- Nemesis: Death Stalker
    AddA(tmp[853], a[9513]); -- Nemesis: Scourge of the Kaldorei
    AddA(tmp[853], a[9516]); -- Nemesis: Slayer of Sin'dorei
    AddA(tmp[853], a[9509]); -- Nemesis: Draenei Destroyer
    AddA(tmp[853], a[9521]); -- Nemesis: The Butcher
    AddA(tmp[853], a[9511]); -- Nemesis: Gnomebane
    AddA(tmp[853], a[9522]); -- Nemesis: Troll Hunter
    AddA(tmp[853], a[9510]); -- Nemesis: Dwarfstalker
    AddA(tmp[853], a[9519]); -- Nemesis: Orcslayer
    AddA(tmp[853], a[9512]); -- Nemesis: Manslayer
    AddA(tmp[853], a[9518]); -- Nemesis: Killer of Kezan
    AddA(tmp[853], a[9515]); -- Nemesis: Worgen Hunter
    AddA(tmp[853], a[9520]); -- Nemesis: Huojin's Fall
    AddA(tmp[853], a[9514]); -- Nemesis: Terror of the Tushui
    AddA(tmp[853], a[9639]); -- "Fight, Kill, Salute!"
    AddA(tmp[853], a[9508]); -- Warlord of Draenor
    AddA(tmp[853], a[9738]); -- Warlord of Draenor
    tmp[856] = cat:New(addon.L["Shipyard"], true); -- Shipyard
    AddC(tmp[852], tmp[856]);
    AddA(tmp[856], a[10177]); -- Set Sail!
    AddA(tmp[856], a[10169]); -- Naval Fleet
    AddA(tmp[856], a[10168]); -- Naval Armada
    AddA(tmp[856], a[10170]); -- Seaman
    AddA(tmp[856], a[10172]); -- Petty Officer
    AddA(tmp[856], a[10255]); -- Petty Officer
    AddA(tmp[856], a[10173]); -- Fleet Commander
    AddA(tmp[856], a[10275]); -- Fleet Commander
    AddA(tmp[856], a[10174]); -- Admiral
    AddA(tmp[856], a[10276]); -- Admiral
    AddA(tmp[856], a[10156]); -- Naval Combat Specialist
    AddA(tmp[856], a[10154]); -- Naval Combat Expert
    AddA(tmp[856], a[10159]); -- Naval Treasure Specialist
    AddA(tmp[856], a[10160]); -- Naval Treasure Expert
    AddA(tmp[856], a[10161]); -- Naval Siege Specialist
    AddA(tmp[856], a[10155]); -- Naval Siege Expert
    AddA(tmp[856], a[10162]); -- Naval Training Specialist
    AddA(tmp[856], a[10163]); -- Naval Training Expert
    AddA(tmp[856], a[10017]); -- Naval Bonus Specialist
    AddA(tmp[856], a[10036]); -- Naval Bonus Expert
    AddA(tmp[856], a[10164]); -- Master of the Seas
    AddA(tmp[856], a[10165]); -- Ironsides
    AddA(tmp[856], a[10166]); -- Naval Mechanics
    AddA(tmp[856], a[10256]); -- Charting a Course
    AddA(tmp[856], a[10258]); -- Charting a Course
    AddA(tmp[856], a[10167]); -- Exploring the High Seas
    AddA(tmp[856], a[10307]); -- Exploring the High Seas
    tmp[855] = cat:New(addon.L["Invasions"], true); -- Invasions
    AddC(tmp[432], tmp[855]);
    AddA(tmp[855], a[9167]); -- Invasion Specialist
    AddA(tmp[855], a[9543]); -- Invasion? What Invasion?
    AddA(tmp[855], a[9244]); -- Invasions Are Better with Friends
    AddA(tmp[855], a[9205]); -- Iron Horde Invasion
    AddA(tmp[855], a[9206]); -- Shadowmoon Clan Invasion
    AddA(tmp[855], a[9203]); -- Shadow Council Invasion
    AddA(tmp[855], a[9204]); -- Ogre Invasion
    AddA(tmp[855], a[9207]); -- Goren Invasion
    AddA(tmp[855], a[9208]); -- Botani Invasion
    AddA(tmp[855], a[9162]); -- Bronze Defender
    AddA(tmp[855], a[9164]); -- Silver Defender
    AddA(tmp[855], a[9165]); -- Golden Defender
    AddA(tmp[855], a[9826]); -- Platinum Defender
    AddA(tmp[855], a[9209]); -- Master Defender
    AddA(tmp[855], a[9827]); -- Impervious Defender
    AddA(tmp[855], a[9181]); -- Save Those Buildings!
    AddA(tmp[855], a[9858]); -- Master and Commander
    tmp[237] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
    AddC(tmp[883], tmp[237]);
    tmp[381] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[237], tmp[381]);
    tmp[396] = cat:New(addon.GetMapName(619)); -- Broken Isles
    AddC(tmp[381], tmp[396]);
    AddA(tmp[396], a[11160]); -- Unleashed Monstrosities
    tmp[397] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[396], tmp[397]);
    AddA(tmp[397], a[11157]); -- Loremaster of Legion
    AddA(tmp[397], a[10877]); -- Pillars of Creation
    AddA(tmp[397], a[11189]); -- Variety is the Spice of Life
    AddA(tmp[397], a[11186]); -- Tehd & Marius' Excellent Adventure
    AddA(tmp[397], a[11240]); -- Harbinger
    AddA(tmp[397], a[11544]); -- Defender of the Broken Isles
    AddA(tmp[397], a[11846]); -- Champions of Legionfall
    AddA(tmp[397], a[7520]); -- The Loremaster
    tmp[398] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[396], tmp[398]);
    AddA(tmp[398], a[11190]); -- "Broken Isles Pathfinder, Part One"
    AddA(tmp[398], a[11446]); -- "Broken Isles Pathfinder, Part Two"
    AddA(tmp[398], a[14729]); -- To All the Squirrels I Love Despite Their Scars
    AddA(tmp[398], a[11188]); -- Broken Isles Explorer
    tmp[413] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[396], tmp[413]);
    AddA(tmp[413], a[11474]); -- "Free For All, More For Me"
    tmp[414] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[396], tmp[414]);
    AddA(tmp[414], a[10672]); -- Broken Isles Diplomat
    AddA(tmp[414], a[11159]); -- Friends in a Broken Land
    AddA(tmp[414], a[11652]); -- The Reputable
    AddA(tmp[414], a[11653]); -- Paragon of the Broken Isles
    AddA(tmp[414], a[11941]); -- Chromie Homie
    tmp[382] = cat:New(addon.GetMapName(626)); -- Dalaran
    AddC(tmp[381], tmp[382]);
    AddA(tmp[382], a[10770]); -- The Tangerine Traveler
    tmp[383] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[382], tmp[383]);
    AddA(tmp[383], a[12416]); -- The Total Package
    AddA(tmp[383], a[12431]); -- Post Haste
    AddA(tmp[383], a[12439]); -- Priority Mail
    tmp[405] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[382], tmp[405]);
    AddA(tmp[405], a[11066]); -- Underbelly Tycoon
    tmp[384] = cat:New(addon.GetMapName(630)); -- Azsuna
    AddC(tmp[381], tmp[384]);
    tmp[385] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[384], tmp[385]);
    AddA(tmp[385], a[10763]); -- Azsuna Matata
    tmp[399] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[384], tmp[399]);
    AddA(tmp[399], a[10665]); -- Explore Azsuna
    AddA(tmp[399], a[11175]); -- Higher Dimensional Learning
    AddA(tmp[399], a[11256]); -- Treasures of Azsuna
    AddA(tmp[399], a[11261]); -- Adventurer of Azsuna
    tmp[412] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[384], tmp[412]);
    AddA(tmp[412], a[11475]); -- Mission Accomplished
    tmp[387] = cat:New(addon.GetMapName(641)); -- Val'sharah
    AddC(tmp[381], tmp[387]);
    tmp[391] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[387], tmp[391]);
    AddA(tmp[391], a[10698]); -- That's Val'sharah Folks!
    tmp[400] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[387], tmp[400]);
    AddA(tmp[400], a[10666]); -- Explore Val'sharah
    AddA(tmp[400], a[11258]); -- Treasures of Val'sharah
    AddA(tmp[400], a[11262]); -- Adventurer of Val'sharah
    tmp[411] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[387], tmp[411]);
    AddA(tmp[411], a[11477]); -- Off the Top Rook
    tmp[388] = cat:New(addon.GetMapName(650)); -- Highmountain
    AddC(tmp[381], tmp[388]);
    tmp[392] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[388], tmp[392]);
    AddA(tmp[392], a[10059]); -- Ain't No Mountain High Enough
    AddA(tmp[392], a[10774]); -- Hatchling of the Talon
    AddA(tmp[392], a[10626]); -- Zoom!
    AddA(tmp[392], a[10398]); -- Drum Circle
    AddA(tmp[392], a[11427]); -- No Shellfish Endeavor
    tmp[401] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[388], tmp[401]);
    AddA(tmp[401], a[10667]); -- Explore Highmountain
    AddA(tmp[401], a[11257]); -- Treasures of Highmountain
    AddA(tmp[401], a[11264]); -- Adventurer of Highmountain
    tmp[410] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[388], tmp[410]);
    AddA(tmp[410], a[11478]); -- The Darkbrul-oh
    tmp[416] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[388], tmp[416]);
    AddA(tmp[416], a[12292]); -- Highmountain Tribe
    tmp[386] = cat:New(addon.GetMapName(634)); -- Stormheim
    AddC(tmp[381], tmp[386]);
    tmp[390] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[386], tmp[390]);
    AddA(tmp[390], a[10790]); -- "Vrykul Story, Bro"
    AddA(tmp[390], a[10793]); -- What a Ripoff!
    AddA(tmp[390], a[11232]); -- "Lock, Stock and Two Smoking Goblins"
    AddA(tmp[390], a[11427]); -- No Shellfish Endeavor
    tmp[402] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[386], tmp[402]);
    AddA(tmp[402], a[10668]); -- Explore Stormheim
    AddA(tmp[402], a[10627]); -- Going Up
    AddA(tmp[402], a[11259]); -- Treasures of Stormheim
    AddA(tmp[402], a[11263]); -- Adventurer of Stormheim
    AddA(tmp[402], a[11178]); -- Wake the Dragon
    tmp[409] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[386], tmp[409]);
    AddA(tmp[409], a[11476]); -- Saddle Sore
    tmp[389] = cat:New(addon.GetMapName(680)); -- Suramar
    AddC(tmp[381], tmp[389]);
    tmp[393] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[389], tmp[393]);
    AddA(tmp[393], a[10617]); -- Nightfallen But Not Forgotten
    AddA(tmp[393], a[11124]); -- Good Suramaritan
    AddA(tmp[393], a[10756]); -- Leyline Bling
    AddA(tmp[393], a[11125]); -- Now You're Thinking With Portals
    AddA(tmp[393], a[11133]); -- Why Can't I Hold All This Mana?
    AddA(tmp[393], a[11340]); -- Insurrection
    AddA(tmp[393], a[11427]); -- No Shellfish Endeavor
    tmp[403] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[389], tmp[403]);
    AddA(tmp[403], a[10669]); -- Explore Suramar
    AddA(tmp[403], a[11260]); -- Treasures of Suramar
    AddA(tmp[403], a[11265]); -- Adventurer of Suramar
    tmp[415] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[389], tmp[415]);
    AddA(tmp[415], a[10778]); -- The Nightfallen
    tmp[394] = cat:New(addon.GetMapName(646)); -- Broken Shore
    AddC(tmp[381], tmp[394]);
    AddA(tmp[394], a[11786]); -- Terrors of the Shore
    tmp[395] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[394], tmp[395]);
    AddA(tmp[395], a[11607]); -- They See Me Rolling
    AddA(tmp[395], a[11546]); -- Breaching the Tomb
    AddA(tmp[395], a[11681]); -- Crate Expectations
    AddA(tmp[395], a[11731]); -- A Magic Contribution
    AddA(tmp[395], a[11732]); -- A Magnificent Contribution
    AddA(tmp[395], a[11735]); -- Take Command
    AddA(tmp[395], a[11736]); -- Assume Command
    AddA(tmp[395], a[11737]); -- Disrupting the Nether
    AddA(tmp[395], a[11738]); -- It'll Nether Happen
    tmp[404] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[394], tmp[404]);
    AddA(tmp[404], a[11543]); -- Explore Broken Shore
    AddA(tmp[404], a[11802]); -- Bringing Home the Beacon
    AddA(tmp[404], a[11841]); -- Naxt Victim
    tmp[417] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[394], tmp[417]);
    AddA(tmp[417], a[11545]); -- Legionfall Commander
    AddA(tmp[417], a[11796]); -- Armies of Legionfall
    tmp[406] = cat:New(addon.GetMapName(905)); -- Argus
    AddC(tmp[381], tmp[406]);
    tmp[407] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[406], tmp[407]);
    AddA(tmp[407], a[12066]); -- You Are Now Prepared!
    AddA(tmp[407], a[12073]); -- Locked and Loaded
    tmp[408] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[406], tmp[408]);
    AddA(tmp[408], a[12074]); -- "Shoot First, Loot Later"
    AddA(tmp[408], a[12084]); -- Infused and Abused
    AddA(tmp[408], a[12028]); -- Envision Invasion Eradication
    AddA(tmp[408], a[12026]); -- Invasion Obliteration
    AddA(tmp[408], a[12069]); -- Explore Argus
    AddA(tmp[408], a[12077]); -- Adventurer of Argus
    AddA(tmp[408], a[12078]); -- Commander of Argus
    AddA(tmp[408], a[12083]); -- Paragon of Argus
    AddA(tmp[408], a[12101]); -- We Came Here For Two Reasons
    AddA(tmp[408], a[12102]); -- To Kill Demons...
    AddA(tmp[408], a[12103]); -- ...And Chew Mana Buns
    AddA(tmp[408], a[12104]); -- And We're All Out of Mana Buns
    tmp[418] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[406], tmp[418]);
    AddA(tmp[418], a[12076]); -- Protector of the Argussian Reach
    AddA(tmp[418], a[12081]); -- Officer of the Light
    tmp[238] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[237], tmp[238]);
    AddA(tmp[238], a[11164]); -- Legion Dungeon Hero
    AddA(tmp[238], a[11163]); -- Glory of the Legion Hero
    AddA(tmp[238], a[11181]); -- Legion Keymaster
    tmp[240] = cat:New((addon.EJ_GetInstanceInfo(716))); -- Eye of Azshara
    AddC(tmp[238], tmp[240]);
    AddA(tmp[240], a[10456]); -- But You Say He's Just a Friend
    AddA(tmp[240], a[10457]); -- Stay Salty
    AddA(tmp[240], a[10458]); -- Ready for Raiding V
    AddA(tmp[240], a[10780]); -- Eye of Azshara
    AddA(tmp[240], a[10781]); -- Heroic: Eye of Azshara
    AddA(tmp[240], a[10782]); -- Mythic: Eye of Azshara
    tmp[241] = cat:New((addon.EJ_GetInstanceInfo(762))); -- Darkheart Thicket
    AddC(tmp[238], tmp[241]);
    AddA(tmp[241], a[10766]); -- Egg-cellent!
    AddA(tmp[241], a[10769]); -- Burning Down the House
    AddA(tmp[241], a[10783]); -- Darkheart Thicket
    AddA(tmp[241], a[10784]); -- Heroic: Darkheart Thicket
    AddA(tmp[241], a[10785]); -- Mythic: Darkheart Thicket
    tmp[242] = cat:New((addon.EJ_GetInstanceInfo(721))); -- Halls of Valor
    AddC(tmp[238], tmp[242]);
    AddA(tmp[242], a[10544]); -- Stag Party
    AddA(tmp[242], a[10542]); -- I Got What You Mead
    AddA(tmp[242], a[10543]); -- Surge Protector
    AddA(tmp[242], a[10786]); -- Halls of Valor
    AddA(tmp[242], a[10788]); -- Heroic: Halls of Valor
    AddA(tmp[242], a[10789]); -- Mythic: Halls of Valor
    tmp[243] = cat:New((addon.EJ_GetInstanceInfo(767))); -- Neltharions Lair
    AddC(tmp[238], tmp[243]);
    AddA(tmp[243], a[10996]); -- Got to Ketchum All
    AddA(tmp[243], a[10875]); -- Can't Eat Just One
    AddA(tmp[243], a[10795]); -- Neltharion's Lair
    AddA(tmp[243], a[10796]); -- Heroic: Neltharion's Lair
    AddA(tmp[243], a[10797]); -- Mythic: Neltharion's Lair
    tmp[244] = cat:New((addon.EJ_GetInstanceInfo(777))); -- Assault on Violet Hold
    AddC(tmp[238], tmp[244]);
    AddA(tmp[244], a[10554]); -- I Made a Food!
    AddA(tmp[244], a[10553]); -- You're Just Making It WORSE!
    AddA(tmp[244], a[10798]); -- Assault on Violet Hold
    AddA(tmp[244], a[10799]); -- Heroic: Assault on Violet Hold
    AddA(tmp[244], a[10800]); -- Mythic: Assault on Violet Hold
    tmp[245] = cat:New((addon.EJ_GetInstanceInfo(707))); -- Vault of the Wardens
    AddC(tmp[238], tmp[245]);
    AddA(tmp[245], a[10679]); -- I Ain't Even Cold
    AddA(tmp[245], a[10680]); -- Who's Afraid of the Dark?
    AddA(tmp[245], a[10707]); -- "A Specter, Illuminated"
    AddA(tmp[245], a[10801]); -- Vault of the Wardens
    AddA(tmp[245], a[10802]); -- Heroic: Vault of the Wardens
    AddA(tmp[245], a[10803]); -- Mythic: Vault of the Wardens
    tmp[246] = cat:New((addon.EJ_GetInstanceInfo(740))); -- Black Rook Hold
    AddC(tmp[238], tmp[246]);
    AddA(tmp[246], a[10710]); -- Black Rook Moan
    AddA(tmp[246], a[10709]); -- You Used to Scrawl Me In Your Fel Tome
    AddA(tmp[246], a[10711]); -- Adds? More Like Bads
    AddA(tmp[246], a[10804]); -- Black Rook Hold
    AddA(tmp[246], a[10805]); -- Heroic: Black Rook Hold
    AddA(tmp[246], a[10806]); -- Mythic: Black Rook Hold
    tmp[247] = cat:New((addon.EJ_GetInstanceInfo(727))); -- Maw of Souls
    AddC(tmp[238], tmp[247]);
    AddA(tmp[247], a[10413]); -- Instant Karma
    AddA(tmp[247], a[10411]); -- Helheim Hath No Fury
    AddA(tmp[247], a[10412]); -- Poor Unfortunate Souls
    AddA(tmp[247], a[10807]); -- Maw of Souls
    AddA(tmp[247], a[10808]); -- Heroic: Maw of Souls
    AddA(tmp[247], a[10809]); -- Mythic: Maw of Souls
    tmp[248] = cat:New((addon.EJ_GetInstanceInfo(726))); -- The Arcway
    AddC(tmp[238], tmp[248]);
    AddA(tmp[248], a[10773]); -- Arcanic Cling
    AddA(tmp[248], a[10775]); -- Clean House
    AddA(tmp[248], a[10776]); -- No Time to Waste
    AddA(tmp[248], a[10813]); -- Mythic: The Arcway
    tmp[249] = cat:New((addon.EJ_GetInstanceInfo(800))); -- Court of Stars
    AddC(tmp[238], tmp[249]);
    AddA(tmp[249], a[10610]); -- Waiting for Gerdo
    AddA(tmp[249], a[10611]); -- Dropping Some Eaves
    AddA(tmp[249], a[10816]); -- Mythic: Court of Stars
    tmp[250] = cat:New((addon.EJ_GetInstanceInfo(860))); -- Return to Karazhan
    AddC(tmp[238], tmp[250]);
    AddA(tmp[250], a[11430]); -- One Night in Karazhan
    AddA(tmp[250], a[11335]); -- Season Tickets
    AddA(tmp[250], a[11338]); -- Dine and Bash
    AddA(tmp[250], a[11432]); -- Scared Straight
    AddA(tmp[250], a[11431]); -- The Rat Pack
    AddA(tmp[250], a[11433]); -- Burn After Reading
    AddA(tmp[250], a[11929]); -- Heroic: Return to Karazhan
    AddA(tmp[250], a[11429]); -- Mythic: Return to Karazhan
    AddA(tmp[250], a[15692]); -- Keystone Hero: Return to Karazhan
    tmp[251] = cat:New((addon.EJ_GetInstanceInfo(900))); -- Cathedral of Eternal Night
    AddC(tmp[238], tmp[251]);
    AddA(tmp[251], a[11768]); -- Boom Bloom
    AddA(tmp[251], a[11769]); -- A Steamy Romance Saga
    AddA(tmp[251], a[11703]); -- Master of Shadows
    AddA(tmp[251], a[11700]); -- Cathedral of Eternal Night
    AddA(tmp[251], a[11701]); -- Heroic: Cathedral of Eternal Night
    AddA(tmp[251], a[11702]); -- Mythic: Cathedral of Eternal Night
    tmp[252] = cat:New((addon.EJ_GetInstanceInfo(945))); -- Seat of the Triumvirate
    AddC(tmp[238], tmp[252]);
    AddA(tmp[252], a[12004]); -- Welcome the Void
    AddA(tmp[252], a[12005]); -- Let it All Out
    AddA(tmp[252], a[12009]); -- Darker Side
    AddA(tmp[252], a[12007]); -- Heroic: Seat of the Triumvirate
    AddA(tmp[252], a[12008]); -- Mythic: Seat of the Triumvirate
    tmp[239] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[237], tmp[239]);
    AddA(tmp[239], a[11180]); -- Glory of the Legion Raider
    AddA(tmp[239], a[11763]); -- Glory of the Tomb Raider
    AddA(tmp[239], a[11987]); -- Glory of the Argus Raider
    tmp[253] = cat:New((addon.EJ_GetInstanceInfo(768))); -- The Emerald Nightmare
    AddC(tmp[239], tmp[253]);
    AddA(tmp[253], a[10818]); -- Darkbough
    AddA(tmp[253], a[10819]); -- Tormented Guardians
    AddA(tmp[253], a[10820]); -- Rift of Aln
    AddA(tmp[253], a[11194]); -- Ahead of the Curve: Xavius
    AddA(tmp[253], a[11191]); -- Cutting Edge: Xavius
    tmp[873] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[253], tmp[873]);
    AddA(tmp[873], a[10555]); -- Buggy Fight
    AddA(tmp[873], a[10830]); -- Took the Red Eye Down
    AddA(tmp[873], a[10771]); -- Webbing Crashers
    AddA(tmp[873], a[10753]); -- Scare Bear
    AddA(tmp[873], a[10663]); -- Imagined Dragons World Tour
    AddA(tmp[873], a[10772]); -- Use the Force(s)
    AddA(tmp[873], a[10755]); -- I Attack the Darkness
    tmp[874] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[253], tmp[874]);
    AddA(tmp[874], a[10821]); -- Mythic: Nythendra
    AddA(tmp[874], a[10823]); -- Mythic: Il'gynoth
    AddA(tmp[874], a[10822]); -- Mythic: Elerethe Renferal
    AddA(tmp[874], a[10824]); -- Mythic: Ursoc
    AddA(tmp[874], a[10825]); -- Mythic: Dragons of Nightmare
    AddA(tmp[874], a[10826]); -- Mythic: Cenarius
    AddA(tmp[874], a[10827]); -- Mythic: Xavius
    tmp[254] = cat:New((addon.EJ_GetInstanceInfo(786))); -- The Nighthold
    AddC(tmp[239], tmp[254]);
    AddA(tmp[254], a[10829]); -- Arcing Aqueducts
    AddA(tmp[254], a[10837]); -- Royal Athenaeum
    AddA(tmp[254], a[10838]); -- Nightspire
    AddA(tmp[254], a[10839]); -- Betrayer's Rise
    AddA(tmp[254], a[11195]); -- Ahead of the Curve: Gul'dan
    AddA(tmp[254], a[11192]); -- Cutting Edge: Gul'dan
    AddA(tmp[254], a[11628]); -- That's So Last Millennium
    tmp[875] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[254], tmp[875]);
    AddA(tmp[875], a[10678]); -- Cage Rematch
    AddA(tmp[875], a[10697]); -- Grand Opening
    AddA(tmp[875], a[10742]); -- Gluten Free
    AddA(tmp[875], a[10817]); -- A Change In Scenery
    AddA(tmp[875], a[10851]); -- Elementalry!
    AddA(tmp[875], a[10754]); -- Fruit of All Evil
    AddA(tmp[875], a[10575]); -- Burning Bridges
    AddA(tmp[875], a[10704]); -- Not For You
    AddA(tmp[875], a[10699]); -- Infinitesimal
    AddA(tmp[875], a[10696]); -- I've Got My Eyes On You
    tmp[876] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[254], tmp[876]);
    AddA(tmp[876], a[10840]); -- Mythic: Skorpyron
    AddA(tmp[876], a[10842]); -- Mythic: Chronomatic Anomaly
    AddA(tmp[876], a[10843]); -- Mythic: Trilliax
    AddA(tmp[876], a[10844]); -- Mythic: Spellblade Aluriel
    AddA(tmp[876], a[10845]); -- Mythic: Star Augur Etraeus
    AddA(tmp[876], a[10846]); -- Mythic: High Botanist Tel'arn
    AddA(tmp[876], a[10848]); -- Mythic: Krosus
    AddA(tmp[876], a[10847]); -- Mythic: Tichondrius
    AddA(tmp[876], a[10849]); -- Mythic: Grand Magistrix Elisande
    AddA(tmp[876], a[10850]); -- Mythic: Gul'dan
    tmp[255] = cat:New((addon.EJ_GetInstanceInfo(861))); -- Trial of Valor
    AddC(tmp[239], tmp[255]);
    AddA(tmp[255], a[11337]); -- You Runed Everything!
    AddA(tmp[255], a[11386]); -- Boneafide Tri Tip
    AddA(tmp[255], a[11377]); -- Patient Zero
    AddA(tmp[255], a[11394]); -- Trial of Valor
    AddA(tmp[255], a[11426]); -- Heroic: Trial of Valor
    AddA(tmp[255], a[11396]); -- Mythic: Odyn
    AddA(tmp[255], a[11397]); -- Mythic: Guarm
    AddA(tmp[255], a[11398]); -- Mythic: Helya
    AddA(tmp[255], a[11387]); -- The Chosen
    AddA(tmp[255], a[11581]); -- Ahead of the Curve: Helya
    AddA(tmp[255], a[11580]); -- Cutting Edge: Helya
    AddA(tmp[255], a[11762]); -- Can I Get A Helya
    tmp[256] = cat:New((addon.EJ_GetInstanceInfo(875))); -- Tomb of Sargeras
    AddC(tmp[239], tmp[256]);
    AddA(tmp[256], a[11787]); -- The Gates of Hell
    AddA(tmp[256], a[11788]); -- Wailing Halls
    AddA(tmp[256], a[11789]); -- Chamber of the Avatar
    AddA(tmp[256], a[11790]); -- Deceiver's Fall
    AddA(tmp[256], a[11874]); -- Ahead of the Curve: Kil'jaeden
    AddA(tmp[256], a[11875]); -- Cutting Edge: Kil'jaeden
    AddA(tmp[256], a[11760]); -- Retro Trend
    tmp[879] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[256], tmp[879]);
    AddA(tmp[879], a[11724]); -- Fel Turkey!
    AddA(tmp[879], a[11699]); -- Grand Fin-ale
    AddA(tmp[879], a[11676]); -- Five Course Seafood Buffet
    AddA(tmp[879], a[11696]); -- Grin and Bear It
    AddA(tmp[879], a[11773]); -- "Wax On, Wax Off"
    AddA(tmp[879], a[11674]); -- "Great Soul, Great Purpose"
    AddA(tmp[879], a[11675]); -- Sky Walker
    AddA(tmp[879], a[11683]); -- Bingo!
    AddA(tmp[879], a[11770]); -- Dark Souls
    tmp[880] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[256], tmp[880]);
    AddA(tmp[880], a[11767]); -- Mythic: Goroth
    AddA(tmp[880], a[11775]); -- Mythic: Harjatan
    AddA(tmp[880], a[11776]); -- Mythic: Mistress Sassz'ine
    AddA(tmp[880], a[11774]); -- Mythic: Demonic Inquisition
    AddA(tmp[880], a[11777]); -- Mythic: Sisters of the Moon
    AddA(tmp[880], a[11778]); -- Mythic: The Desolate Host
    AddA(tmp[880], a[11779]); -- Mythic: Maiden of Vigilance
    AddA(tmp[880], a[11780]); -- Mythic: Fallen Avatar
    AddA(tmp[880], a[11781]); -- Mythic: Kil'jaeden
    tmp[257] = cat:New((addon.EJ_GetInstanceInfo(946))); -- Antorus, the Burning Throne
    AddC(tmp[239], tmp[257]);
    AddA(tmp[257], a[11988]); -- Light's Breach
    AddA(tmp[257], a[11990]); -- Hope's End
    AddA(tmp[257], a[11989]); -- Forbidden Descent
    AddA(tmp[257], a[11991]); -- Seat of the Pantheon
    AddA(tmp[257], a[12110]); -- Ahead of the Curve: Argus the Unmaker
    AddA(tmp[257], a[12111]); -- Cutting Edge: Argus the Unmaker
    AddA(tmp[257], a[12020]); -- Argussy Up
    tmp[881] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[257], tmp[881]);
    AddA(tmp[881], a[11930]); -- Worm-monger
    AddA(tmp[881], a[12065]); -- Hounds Good To Me
    AddA(tmp[881], a[12129]); -- This is the War Room!
    AddA(tmp[881], a[11928]); -- Portal Combat
    AddA(tmp[881], a[12067]); -- Spheres of Influence
    AddA(tmp[881], a[11949]); -- Hard to Kill
    AddA(tmp[881], a[12030]); -- The World Revolves Around Me
    AddA(tmp[881], a[11948]); -- Together We Stand
    AddA(tmp[881], a[12046]); -- Remember the Titans
    AddA(tmp[881], a[11915]); -- Don't Sweat the Technique
    AddA(tmp[881], a[12257]); -- Stardust Crusaders
    tmp[882] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[257], tmp[882]);
    AddA(tmp[882], a[11992]); -- Mythic: Garothi Worldbreaker
    AddA(tmp[882], a[11993]); -- Mythic: Hounds of Sargeras
    AddA(tmp[882], a[11994]); -- Mythic: Antoran High Command
    AddA(tmp[882], a[11995]); -- Mythic: Portal Keeper Hasabel
    AddA(tmp[882], a[11996]); -- Mythic: Eonar
    AddA(tmp[882], a[11997]); -- Mythic: Imonar the Soulhunter
    AddA(tmp[882], a[11998]); -- Mythic: Kin'garoth
    AddA(tmp[882], a[11999]); -- Mythic: Varimathras
    AddA(tmp[882], a[12000]); -- Mythic: The Coven of Shivarra
    AddA(tmp[882], a[12001]); -- Mythic: Aggramar
    AddA(tmp[882], a[12002]); -- Mythic: Argus the Unmaker
    tmp[430] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[237], tmp[430]);
    AddA(tmp[430], a[11233]); -- Broken Isles Safari
    AddA(tmp[430], a[10876]); -- Battle on the Broken Isles
    AddA(tmp[430], a[9686]); -- Aquatic Acquiescence
    AddA(tmp[430], a[9687]); -- Best of the Beasts
    AddA(tmp[430], a[9688]); -- Mousing Around
    AddA(tmp[430], a[9689]); -- Dragons!
    AddA(tmp[430], a[9690]); -- "Ragnaros, Watch and Learn"
    AddA(tmp[430], a[9691]); -- Flock Together
    AddA(tmp[430], a[9692]); -- "Murlocs, Harpies, and Wolvar, Oh My!"
    AddA(tmp[430], a[9693]); -- Master of Magic
    AddA(tmp[430], a[9694]); -- Roboteer
    AddA(tmp[430], a[9695]); -- The Lil' Necromancer
    AddA(tmp[430], a[9696]); -- Family Familiar
    AddA(tmp[430], a[12088]); -- Anomalous Animals of Argus
    AddA(tmp[430], a[12089]); -- Aquatic Assault
    AddA(tmp[430], a[12091]); -- Beast Blitz
    AddA(tmp[430], a[12092]); -- Critical Critters
    AddA(tmp[430], a[12093]); -- Draconic Destruction
    AddA(tmp[430], a[12094]); -- Elemental Escalation
    AddA(tmp[430], a[12095]); -- Fierce Fliers
    AddA(tmp[430], a[12096]); -- Humanoid Havoc
    AddA(tmp[430], a[12097]); -- Magical Mayhem
    AddA(tmp[430], a[12098]); -- Mechanical Melee
    AddA(tmp[430], a[12099]); -- Unstoppable Undead
    AddA(tmp[430], a[12100]); -- Family Fighter
    tmp[792] = cat:New(addon.L["Brawler's Guild"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Brawler's Guild
    AddC(tmp[237], tmp[792]);
    AddA(tmp[792], a[11560]); -- You Are Not Your $#*@! Legplates (Season 3)
    AddA(tmp[792], a[11561]); -- You Are Not Your $#*@! Legplates (Season 3)
    AddA(tmp[792], a[11563]); -- The Second Rule of Brawler's Guild (Season 3)
    AddA(tmp[792], a[11564]); -- The Second Rule of Brawler's Guild (Season 3)
    AddA(tmp[792], a[11565]); -- King of the Guild (Season 3)
    AddA(tmp[792], a[11566]); -- King of the Guild (Season 3)
    AddA(tmp[792], a[11572]); -- I Am Thrall's Complete Lack Of Surprise (Season 3)
    tmp[429] = cat:New(addon.L["Class Hall"]); -- Class Hall
    AddC(tmp[237], tmp[429]);
    AddA(tmp[429], a[10994]); -- A Glorious Campaign
    AddA(tmp[429], a[11135]); -- A Heroic Campaign
    AddA(tmp[429], a[11136]); -- An Epic Campaign
    AddA(tmp[429], a[10706]); -- Training the Troops
    AddA(tmp[429], a[11212]); -- Raise an Army
    AddA(tmp[429], a[11213]); -- Lead a Legion
    AddA(tmp[429], a[11214]); -- Many Missions
    AddA(tmp[429], a[11215]); -- Quite a Few Missions
    AddA(tmp[429], a[11216]); -- So Many Missions
    AddA(tmp[429], a[11217]); -- "Many Many Missions, Handle It!"
    AddA(tmp[429], a[11219]); -- Need Backup
    AddA(tmp[429], a[11220]); -- Roster of Champions
    AddA(tmp[429], a[11221]); -- Champions Rise
    AddA(tmp[429], a[11222]); -- Champions of Power
    AddA(tmp[429], a[11223]); -- Legendary Research
    AddA(tmp[429], a[11298]); -- A Classy Outfit
    AddA(tmp[429], a[10746]); -- Forged for Battle
    AddA(tmp[429], a[10459]); -- Improving on History
    AddA(tmp[429], a[10743]); -- The Prestige
    AddA(tmp[429], a[10745]); -- The Prestige
    AddA(tmp[429], a[10460]); -- Hidden Potential
    AddA(tmp[429], a[10461]); -- Fighting with Style: Classic
    AddA(tmp[429], a[10747]); -- Fighting with Style: Upgraded
    AddA(tmp[429], a[10748]); -- Fighting with Style: Valorous
    AddA(tmp[429], a[11173]); -- Fighting with Style: War-torn
    AddA(tmp[429], a[10749]); -- Fighting with Style: War-torn
    AddA(tmp[429], a[10750]); -- Fighting with Style: Hidden
    AddA(tmp[429], a[11171]); -- Arsenal of Power
    AddA(tmp[429], a[11137]); -- A Legendary Campaign
    AddA(tmp[429], a[11611]); -- A Challenging Look
    AddA(tmp[429], a[11612]); -- Fighting with Style: Challenging
    AddA(tmp[429], a[11144]); -- Power Realized
    AddA(tmp[429], a[11772]); -- Power Ascended
    AddA(tmp[429], a[11609]); -- Power Unbound
    AddA(tmp[429], a[11610]); -- Power Unleashed
    AddA(tmp[429], a[10852]); -- Artifact or Artifiction
    AddA(tmp[429], a[10853]); -- Part of History
    AddA(tmp[429], a[12071]); -- Crucible's Promise
    AddA(tmp[429], a[12072]); -- Now You're Cooking with Netherlight
    AddA(tmp[429], a[11218]); -- There's a Boss In There
    tmp[258] = cat:New((addon.GetCategoryInfo(15305))); -- Battle for Azeroth
    AddC(tmp[883], tmp[258]);
    tmp[259] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[258], tmp[259]);
    AddA(tmp[259], a[46]); -- Universal Explorer
    tmp[271] = cat:New(addon.GetMapName(876) .. " & " .. addon.GetMapName(875)); -- Kul Tiras & Zandalar
    AddC(tmp[259], tmp[271]);
    AddA(tmp[271], a[14183]); -- Conspicuous Consumption
    AddA(tmp[271], a[12587]); -- Unbound Monstrosities
    tmp[272] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[271], tmp[272]);
    AddA(tmp[272], a[12582]); -- Come Sail Away
    AddA(tmp[272], a[12555]); -- Welcome to Zandalar
    AddA(tmp[272], a[12997]); -- The Pride of Kul Tiras
    AddA(tmp[272], a[12593]); -- Loremaster of Kul Tiras
    AddA(tmp[272], a[13294]); -- Loremaster of Zandalar
    AddA(tmp[272], a[12891]); -- A Nation United
    AddA(tmp[272], a[12479]); -- Zandalar Forever!
    AddA(tmp[272], a[13512]); -- Master Calligrapher
    AddA(tmp[272], a[13384]); -- Kul Tirans Don't Look at Explosions
    AddA(tmp[272], a[12510]); -- Ready for War
    AddA(tmp[272], a[12509]); -- Ready for War
    AddA(tmp[272], a[13467]); -- Tides of Vengeance
    AddA(tmp[272], a[13466]); -- Tides of Vengeance
    AddA(tmp[272], a[13925]); -- The Fourth War
    AddA(tmp[272], a[13924]); -- The Fourth War
    AddA(tmp[272], a[13517]); -- Two Sides to Every Tale
    AddA(tmp[272], a[13251]); -- In Teldrassil's Shadow
    AddA(tmp[272], a[13144]); -- Wide World of Quests
    AddA(tmp[272], a[13263]); -- The Shadow Hunter
    AddA(tmp[272], a[14157]); -- The Corruptor's End
    AddA(tmp[272], a[7520]); -- The Loremaster
    tmp[273] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[271], tmp[273]);
    AddA(tmp[273], a[12989]); -- "Battle for Azeroth Pathfinder, Part One"
    AddA(tmp[273], a[13250]); -- "Battle for Azeroth Pathfinder, Part Two"
    AddA(tmp[273], a[13061]); -- Three Sheets to the Wind
    AddA(tmp[273], a[12482]); -- Get Hek'd
    AddA(tmp[273], a[13036]); -- A Loa of a Tale
    AddA(tmp[273], a[13029]); -- Eating Out of the Palm of My Tiny Hand
    AddA(tmp[273], a[13027]); -- Mushroom Harvest
    AddA(tmp[273], a[14730]); -- To All the Squirrels I Set Sail to See
    AddA(tmp[273], a[12988]); -- Battle for Azeroth Explorer
    tmp[274] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[271], tmp[274]);
    AddA(tmp[274], a[13429]); -- Azerfighter
    AddA(tmp[274], a[12572]); -- War Supplied
    AddA(tmp[274], a[12571]); -- Bounty Hunting
    AddA(tmp[274], a[12573]); -- Band of Brothers
    AddA(tmp[274], a[12605]); -- Conqueror of Azeroth
    AddA(tmp[274], a[12604]); -- Conqueror of Azeroth
    tmp[275] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[271], tmp[275]);
    AddA(tmp[275], a[12947]); -- Azerothian Diplomat
    AddA(tmp[275], a[12955]); -- Champions of Azeroth
    AddA(tmp[275], a[12956]); -- Tortollan Seekers
    tmp[276] = cat:New(addon.GetMapName(895)); -- Tiragarde Sound
    AddC(tmp[259], tmp[276]);
    tmp[281] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[276], tmp[281]);
    AddA(tmp[281], a[12473]); -- A Sound Plan
    AddA(tmp[281], a[13060]); -- Kul Runnings
    AddA(tmp[281], a[13059]); -- Drag Race
    AddA(tmp[281], a[13050]); -- Bless the Rains Down in Freehold
    AddA(tmp[281], a[13049]); -- The Long Con
    AddA(tmp[281], a[12087]); -- The Reining Champion
    AddA(tmp[281], a[13285]); -- Upright Citizens
    tmp[278] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[276], tmp[278]);
    AddA(tmp[278], a[12556]); -- Explore Tiragarde Sound
    AddA(tmp[278], a[12939]); -- Adventurer of Tiragarde Sound
    AddA(tmp[278], a[12852]); -- Treasures of Tiragarde Sound
    AddA(tmp[278], a[13057]); -- Shanty Raid
    AddA(tmp[278], a[13058]); -- Kul Tiran Up the Dance Floor
    tmp[279] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[276], tmp[279]);
    AddA(tmp[279], a[12577]); -- Tour of Duty: Tiragarde Sound
    tmp[280] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[276], tmp[280]);
    AddA(tmp[280], a[12951]); -- Proudmoore Admiralty
    AddA(tmp[280], a[12954]); -- Champion of the 7th Legion
    tmp[282] = cat:New(addon.GetMapName(896)); -- Drustvar
    AddC(tmp[259], tmp[282]);
    tmp[283] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[282], tmp[283]);
    AddA(tmp[283], a[12497]); -- Drust Do It.
    tmp[284] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[282], tmp[284]);
    AddA(tmp[284], a[12557]); -- Explore Drustvar
    AddA(tmp[284], a[12941]); -- Adventurer of Drustvar
    AddA(tmp[284], a[12995]); -- Treasures of Drustvar
    AddA(tmp[284], a[13087]); -- Sausage Sampler
    AddA(tmp[284], a[13083]); -- "Better, Faster, Stronger"
    AddA(tmp[284], a[13082]); -- Everything Old Is New Again
    AddA(tmp[284], a[13064]); -- "Drust the Facts, Ma'am"
    AddA(tmp[284], a[13094]); -- Cursed Game Hunter
    tmp[285] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[282], tmp[285]);
    AddA(tmp[285], a[12579]); -- Tour of Duty: Drustvar
    tmp[286] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[282], tmp[286]);
    AddA(tmp[286], a[12952]); -- Order of Embers
    tmp[287] = cat:New(addon.GetMapName(942)); -- Stormsong Valley
    AddC(tmp[259], tmp[287]);
    tmp[288] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[287], tmp[288]);
    AddA(tmp[288], a[12496]); -- Stormsong and Dance
    AddA(tmp[288], a[13054]); -- Sabertron Assemble
    AddA(tmp[288], a[13053]); -- Deadliest Cache
    AddA(tmp[288], a[13047]); -- Clever Use of Mechanical Explosives
    AddA(tmp[288], a[13046]); -- These Hills Sing
    AddA(tmp[288], a[13045]); -- Every Day I'm Truffling
    AddA(tmp[288], a[13042]); -- About To Break
    AddA(tmp[288], a[13062]); -- Let's Bee Friends
    tmp[289] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[287], tmp[289]);
    AddA(tmp[289], a[12558]); -- Explore Stormsong Valley
    AddA(tmp[289], a[12940]); -- Adventurer of Stormsong Valley
    AddA(tmp[289], a[12853]); -- Treasures of Stormsong Valley
    AddA(tmp[289], a[13051]); -- Legends of the Tidesages
    tmp[290] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[287], tmp[290]);
    AddA(tmp[290], a[12578]); -- Tour of Duty: Stormsong Valley
    tmp[291] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[287], tmp[291]);
    AddA(tmp[291], a[12953]); -- Storm's Wake
    tmp[292] = cat:New(addon.GetMapName(862)); -- Zuldazar
    AddC(tmp[259], tmp[292]);
    tmp[293] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[292], tmp[293]);
    AddA(tmp[293], a[11861]); -- The Throne of Zuldazar
    AddA(tmp[293], a[12480]); -- A Bargain of Blood
    AddA(tmp[293], a[12481]); -- The Final Seal
    AddA(tmp[293], a[13441]); -- Pushing the Payload
    AddA(tmp[293], a[13039]); -- Paku'ai
    AddA(tmp[293], a[13048]); -- Life Finds a Way... To Die!
    AddA(tmp[293], a[13038]); -- Raptari Rider
    AddA(tmp[293], a[12719]); -- Spirits Be With You
    AddA(tmp[293], a[13020]); -- Bow to Your Masters
    AddA(tmp[293], a[12614]); -- Loa Expectations
    AddA(tmp[293], a[13030]); -- How to Ptrain Your Pterrordax
    AddA(tmp[293], a[13573]); -- How to Ptrain Your Pterrordax
    AddA(tmp[293], a[13542]); -- How to Train Your Direhorn
    AddA(tmp[293], a[13035]); -- By de Power of de Loa!
    AddA(tmp[293], a[13440]); -- Pushing the Payload
    tmp[294] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[292], tmp[294]);
    AddA(tmp[294], a[12559]); -- Explore Zuldazar
    AddA(tmp[294], a[12944]); -- Adventurer of Zuldazar
    AddA(tmp[294], a[12851]); -- Treasures of Zuldazar
    tmp[295] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[292], tmp[295]);
    AddA(tmp[295], a[12575]); -- Tour of Duty: Zuldazar
    AddA(tmp[295], a[13439]); -- Boxing Match
    AddA(tmp[295], a[13438]); -- Boxing Match
    tmp[296] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[292], tmp[296]);
    AddA(tmp[296], a[12950]); -- Zandalari Empire
    AddA(tmp[296], a[12957]); -- Champion of the Honorbound
    tmp[297] = cat:New(addon.GetMapName(863)); -- Nazmir
    AddC(tmp[259], tmp[297]);
    tmp[298] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[297], tmp[298]);
    AddA(tmp[298], a[13026]); -- 7th Legion Spycatcher
    AddA(tmp[298], a[13025]); -- Zandalari Spycatcher
    AddA(tmp[298], a[11868]); -- The Dark Heart of Nazmir
    AddA(tmp[298], a[13048]); -- Life Finds a Way... To Die!
    AddA(tmp[298], a[13023]); -- It's Really Getting Out of Hand
    AddA(tmp[298], a[13022]); -- Revenge is Best Served Speedily
    AddA(tmp[298], a[13021]); -- A Most Efficient Apocalypse
    AddA(tmp[298], a[13426]); -- Come On and Slam
    tmp[299] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[297], tmp[299]);
    AddA(tmp[299], a[12561]); -- Explore Nazmir
    AddA(tmp[299], a[12942]); -- Adventurer of Nazmir
    AddA(tmp[299], a[12771]); -- Treasures of Nazmir
    AddA(tmp[299], a[12588]); -- Eat Your Greens
    AddA(tmp[299], a[13024]); -- "Carved in Stone, Written in Blood"
    AddA(tmp[299], a[13028]); -- Hoppin' Sad
    tmp[300] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[297], tmp[300]);
    AddA(tmp[300], a[12574]); -- Tour of Duty: Nazmir
    tmp[301] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[297], tmp[301]);
    AddA(tmp[301], a[12948]); -- Talanji's Expedition
    tmp[302] = cat:New(addon.GetMapName(864)); -- Vol'dun
    AddC(tmp[259], tmp[302]);
    tmp[303] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[302], tmp[303]);
    AddA(tmp[303], a[12478]); -- Secrets in the Sands
    AddA(tmp[303], a[13009]); -- Adept Sandfisher
    AddA(tmp[303], a[13011]); -- Scourge of Zem'lan
    AddA(tmp[303], a[13014]); -- Vorrik's Champion
    AddA(tmp[303], a[13041]); -- "Hungry, Hungry Ranishu"
    AddA(tmp[303], a[13017]); -- Champion of the Vulpera
    AddA(tmp[303], a[13437]); -- Scavenge like a Vulpera
    tmp[304] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[302], tmp[304]);
    AddA(tmp[304], a[12560]); -- Explore Vol'dun
    AddA(tmp[304], a[12943]); -- Adventurer of Vol'dun
    AddA(tmp[304], a[12849]); -- Treasures of Vol'dun
    AddA(tmp[304], a[13016]); -- Scavenger of the Sands
    AddA(tmp[304], a[13018]); -- Dune Rider
    tmp[305] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[302], tmp[305]);
    AddA(tmp[305], a[12576]); -- Tour of Duty: Vol'dun
    tmp[306] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[302], tmp[306]);
    AddA(tmp[306], a[12949]); -- The Voldunai
    tmp[307] = cat:New(addon.GetMapName(1462)); -- Mechagon Island
    AddC(tmp[259], tmp[307]);
    AddA(tmp[307], a[13708]); -- Most Minis Wins
    tmp[308] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[307], tmp[308]);
    AddA(tmp[308], a[13553]); -- The Mechagonian Threat
    AddA(tmp[308], a[13700]); -- The Mechagonian Threat
    AddA(tmp[308], a[13790]); -- Armed for Action
    AddA(tmp[308], a[13791]); -- Making the Mount
    tmp[309] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[307], tmp[309]);
    AddA(tmp[309], a[13776]); -- Explore Mechagon
    AddA(tmp[309], a[13470]); -- Rest In Pistons
    AddA(tmp[309], a[13472]); -- Deep Pockets
    AddA(tmp[309], a[13482]); -- Head Financier of Mechagon
    AddA(tmp[309], a[13473]); -- Diversified Investments
    AddA(tmp[309], a[13474]); -- Junkyard Machinist
    AddA(tmp[309], a[13696]); -- Scrappy's Best Friend
    AddA(tmp[309], a[13686]); -- Junkyard Melomaniac
    AddA(tmp[309], a[13475]); -- Junkyard Scavenger
    AddA(tmp[309], a[13477]); -- Junkyard Apprentice
    AddA(tmp[309], a[13476]); -- Junkyard Tinkerer
    AddA(tmp[309], a[13555]); -- Junkyard Tinkmaster
    AddA(tmp[309], a[13478]); -- Junkyard Collector
    AddA(tmp[309], a[13479]); -- Junkyard Architect
    AddA(tmp[309], a[13556]); -- Outside Influences
    AddA(tmp[309], a[13513]); -- Available in Eight Colors
    AddA(tmp[309], a[13541]); -- Mecha-Done
    tmp[310] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[307], tmp[310]);
    AddA(tmp[310], a[13570]); -- Tour of Duty: Mechagon
    tmp[311] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[307], tmp[311]);
    AddA(tmp[311], a[13557]); -- Rustbolt Rebellion
    tmp[312] = cat:New(addon.GetMapName(1355)); -- Nazjatar
    AddC(tmp[259], tmp[312]);
    tmp[313] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[312], tmp[313]);
    AddA(tmp[313], a[13710]); -- Sunken Ambitions
    AddA(tmp[313], a[13709]); -- Unfathomable
    tmp[314] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[312], tmp[314]);
    AddA(tmp[314], a[13712]); -- Explore Nazjatar
    AddA(tmp[314], a[13635]); -- Tour of the Depths
    AddA(tmp[314], a[13690]); -- Nazjatarget Eliminated
    AddA(tmp[314], a[13691]); -- I Thought You Said They'd Be Rare?
    AddA(tmp[314], a[13692]); -- Give Me the Biggest Bag You've Got
    AddA(tmp[314], a[13743]); -- Seasoned: Hunter Akana
    AddA(tmp[314], a[13746]); -- Seasoned: Neri Sharpfin
    AddA(tmp[314], a[13753]); -- Veteran: Hunter Akana
    AddA(tmp[314], a[13749]); -- Veteran: Neri Sharpfin
    AddA(tmp[314], a[13758]); -- Battle-Scarred: Hunter Akana
    AddA(tmp[314], a[13750]); -- Battle-Scarred: Neri Sharpfin
    AddA(tmp[314], a[13744]); -- Seasoned: Bladesman Inowari
    AddA(tmp[314], a[13747]); -- Seasoned: Poen Gillbrack
    AddA(tmp[314], a[13754]); -- Veteran: Bladesman Inowari
    AddA(tmp[314], a[13751]); -- Veteran: Poen Gillbrack
    AddA(tmp[314], a[13759]); -- Battle-Scarred: Bladesman Inowari
    AddA(tmp[314], a[13756]); -- Battle-Scarred: Poen Gillbrack
    AddA(tmp[314], a[13745]); -- Seasoned: Farseer Ori
    AddA(tmp[314], a[13748]); -- Seasoned: Vim Brineheart
    AddA(tmp[314], a[13755]); -- Veteran: Farseer Ori
    AddA(tmp[314], a[13752]); -- Veteran: Vim Brineheart
    AddA(tmp[314], a[13760]); -- Battle-Scarred: Farseer Ori
    AddA(tmp[314], a[13757]); -- Battle-Scarred: Vim Brineheart
    AddA(tmp[314], a[13704]); -- Nautical Battlefield Training
    AddA(tmp[314], a[13645]); -- Nautical Battlefield Training
    AddA(tmp[314], a[13762]); -- Aqua Team Murder Force
    AddA(tmp[314], a[13761]); -- Aqua Team Murder Force
    AddA(tmp[314], a[13711]); -- A Fistful of Manapearls
    AddA(tmp[314], a[13765]); -- Subaquatic Support
    AddA(tmp[314], a[13549]); -- Trove Tracker
    AddA(tmp[314], a[13722]); -- Terror of the Tadpoles
    AddA(tmp[314], a[13699]); -- Periodic Destruction
    AddA(tmp[314], a[13713]); -- Nothing To Scry About
    AddA(tmp[314], a[13707]); -- Mrrl's Secret Stash
    AddA(tmp[314], a[13763]); -- Back to the Depths!
    AddA(tmp[314], a[13764]); -- Puzzle Performer
    AddA(tmp[314], a[13836]); -- Feline Figurines Found
    AddA(tmp[314], a[13638]); -- Undersea Usurper
    tmp[315] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[312], tmp[315]);
    AddA(tmp[315], a[13569]); -- Tour of Duty: Nazjatar
    AddA(tmp[315], a[13568]); -- For Nazjatar!
    AddA(tmp[315], a[13720]); -- Supplying the Assassins
    tmp[316] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[312], tmp[316]);
    AddA(tmp[316], a[13558]); -- Waveblade Ankoan
    AddA(tmp[316], a[13559]); -- The Unshackled
    tmp[317] = cat:New(addon.GetMapName(1530)); -- Vale of Eternal Blossoms
    AddC(tmp[259], tmp[317]);
    tmp[318] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[317], tmp[318]);
    AddA(tmp[318], a[14154]); -- Defend the Vale
    AddA(tmp[318], a[14161]); -- All Consuming
    tmp[447] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[317], tmp[447]);
    AddA(tmp[447], a[14160]); -- Rare to Well Done
    AddA(tmp[447], a[14159]); -- Combating the Corruption
    AddA(tmp[447], a[14158]); -- It's Not A Tumor!
    tmp[321] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[317], tmp[321]);
    AddA(tmp[321], a[14156]); -- The Rajani
    tmp[322] = cat:New(addon.GetMapName(1527)); -- Uldum
    AddC(tmp[259], tmp[322]);
    tmp[323] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[322], tmp[323]);
    AddA(tmp[323], a[14153]); -- Uldum Under Assault
    AddA(tmp[323], a[14161]); -- All Consuming
    tmp[448] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[322], tmp[448]);
    AddA(tmp[448], a[14160]); -- Rare to Well Done
    AddA(tmp[448], a[14159]); -- Combating the Corruption
    AddA(tmp[448], a[14158]); -- It's Not A Tumor!
    tmp[324] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[322], tmp[324]);
    AddA(tmp[324], a[14155]); -- Uldum Accord
    tmp[325] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[258], tmp[325]);
    AddA(tmp[325], a[12807]); -- Battle for Azeroth Dungeon Hero
    AddA(tmp[325], a[12812]); -- Glory of the Wartorn Hero
    AddA(tmp[325], a[13075]); -- Battle for Azeroth Keymaster
    AddA(tmp[325], a[13079]); -- Battle for Azeroth Keystone Conqueror: Season One
    AddA(tmp[325], a[13080]); -- Battle for Azeroth Keystone Master: Season One
    AddA(tmp[325], a[13448]); -- Battle for Azeroth Keystone Conqueror: Season Two
    AddA(tmp[325], a[13449]); -- Battle for Azeroth Keystone Master: Season Two
    AddA(tmp[325], a[13780]); -- Battle for Azeroth Keystone Conqueror: Season Three
    AddA(tmp[325], a[13781]); -- Battle for Azeroth Keystone Master: Season Three
    AddA(tmp[325], a[14144]); -- Battle for Azeroth Keystone Conqueror: Season Four
    AddA(tmp[325], a[14145]); -- Battle for Azeroth Keystone Master: Season Four
    tmp[327] = cat:New((addon.EJ_GetInstanceInfo(1001))); -- Freelhold
    AddC(tmp[325], tmp[327]);
    AddA(tmp[327], a[12550]); -- Pecking Order
    AddA(tmp[327], a[12548]); -- I'm in Charge Now!
    AddA(tmp[327], a[12998]); -- That Sweete Booty
    AddA(tmp[327], a[12831]); -- Freehold
    AddA(tmp[327], a[12832]); -- Heroic: Freehold
    AddA(tmp[327], a[12833]); -- Mythic: Freehold
    tmp[328] = cat:New((addon.EJ_GetInstanceInfo(1021))); -- Waycrest Manor
    AddC(tmp[325], tmp[328]);
    AddA(tmp[328], a[12495]); -- Run Wild Like a Man On Fire
    AddA(tmp[328], a[12490]); -- Alchemical Romance
    AddA(tmp[328], a[12489]); -- Losing My Profession
    AddA(tmp[328], a[12483]); -- Waycrest Manor
    AddA(tmp[328], a[12484]); -- Heroic: Waycrest Manor
    AddA(tmp[328], a[12488]); -- Mythic: Waycrest Manor
    tmp[329] = cat:New((addon.EJ_GetInstanceInfo(1036))); -- Shrine of the Storm
    AddC(tmp[325], tmp[329]);
    AddA(tmp[329], a[12600]); -- Breath of the Shrine
    AddA(tmp[329], a[12601]); -- The Void Lies Sleeping
    AddA(tmp[329], a[12602]); -- Trust No One
    AddA(tmp[329], a[12835]); -- Shrine of the Storm
    AddA(tmp[329], a[12837]); -- Heroic: Shrine of the Storm
    AddA(tmp[329], a[12838]); -- Mythic: Shrine of the Storm
    tmp[330] = cat:New((addon.EJ_GetInstanceInfo(968))); -- Atal'Dazar
    AddC(tmp[325], tmp[330]);
    AddA(tmp[330], a[12270]); -- Bringing Hexy Back
    AddA(tmp[330], a[12272]); -- Gold Fever
    AddA(tmp[330], a[12273]); -- It's Lit!
    AddA(tmp[330], a[12824]); -- Atal'Dazar
    AddA(tmp[330], a[12825]); -- Heroic: Atal'Dazar
    AddA(tmp[330], a[12826]); -- Mythic: Atal'Dazar
    tmp[331] = cat:New((addon.EJ_GetInstanceInfo(1022))); -- The Underrot
    AddC(tmp[325], tmp[331]);
    AddA(tmp[331], a[12498]); -- Taint Nobody Got Time For That
    AddA(tmp[331], a[12549]); -- Not a Fun Guy
    AddA(tmp[331], a[12499]); -- Sporely Alive
    AddA(tmp[331], a[12500]); -- Underrot
    AddA(tmp[331], a[12501]); -- Heroic: Underrot
    AddA(tmp[331], a[12502]); -- Mythic: Underrot
    tmp[332] = cat:New((addon.EJ_GetInstanceInfo(1030))); -- Temple of Sethraliss
    AddC(tmp[325], tmp[332]);
    AddA(tmp[332], a[12507]); -- Snake Eater
    AddA(tmp[332], a[12503]); -- Snake Eyes
    AddA(tmp[332], a[12508]); -- "Good Night, Sweet Prince"
    AddA(tmp[332], a[12504]); -- The Temple of Sethraliss
    AddA(tmp[332], a[12505]); -- Heroic: The Temple of Sethraliss
    AddA(tmp[332], a[12506]); -- Mythic: The Temple of Sethraliss
    tmp[333] = cat:New((addon.EJ_GetInstanceInfo(1002))); -- Tol Dagor
    AddC(tmp[325], tmp[333]);
    AddA(tmp[333], a[12457]); -- Remix to Ignition
    AddA(tmp[333], a[12462]); -- Shot Through the Heart
    AddA(tmp[333], a[12840]); -- Tol Dagor
    AddA(tmp[333], a[12841]); -- Heroic: Tol Dagor
    AddA(tmp[333], a[12842]); -- Mythic: Tol Dagor
    tmp[334] = cat:New((addon.EJ_GetInstanceInfo(1012))); -- The MOTHERLODE!!
    AddC(tmp[325], tmp[334]);
    AddA(tmp[334], a[12855]); -- Pitch Invasion
    AddA(tmp[334], a[12854]); -- Ready for Raiding VI
    AddA(tmp[334], a[12844]); -- The MOTHERLODE!!
    AddA(tmp[334], a[12845]); -- Heroic: The MOTHERLODE!!
    AddA(tmp[334], a[12846]); -- Mythic: The MOTHERLODE!!
    tmp[335] = cat:New((addon.EJ_GetInstanceInfo(1023))); -- Siege of Boralus
    AddC(tmp[325], tmp[335]);
    AddA(tmp[335], a[12727]); -- Stand by Me
    AddA(tmp[335], a[12726]); -- A Fish Out of Water
    AddA(tmp[335], a[12489]); -- Losing My Profession
    AddA(tmp[335], a[12847]); -- Siege of Boralus
    tmp[336] = cat:New((addon.EJ_GetInstanceInfo(1041))); -- Kings' Rest
    AddC(tmp[325], tmp[336]);
    AddA(tmp[336], a[12722]); -- It Belongs in a Mausoleum!
    AddA(tmp[336], a[12721]); -- Wrap God
    AddA(tmp[336], a[12723]); -- How to Keep a Mummy
    AddA(tmp[336], a[12848]); -- Kings' Rest
    tmp[337] = cat:New((addon.EJ_GetInstanceInfo(1178))); -- Operation: Mechagon
    AddC(tmp[325], tmp[337]);
    AddA(tmp[337], a[13706]); -- Stay Positive
    AddA(tmp[337], a[13698]); -- Clean Up On Aisle Mechagon
    AddA(tmp[337], a[13723]); -- "M.C., Hammered"
    AddA(tmp[337], a[13545]); -- "Go Ahead, Make My Daisy"
    AddA(tmp[337], a[13624]); -- Keep DPS-ing and Nobody Explodes
    AddA(tmp[337], a[13789]); -- Hertz Locker
    AddA(tmp[337], a[15693]); -- Keystone Hero: Operation: Mechagon
    tmp[326] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[258], tmp[326]);
    AddA(tmp[326], a[12806]); -- Glory of the Uldir Raider
    AddA(tmp[326], a[13315]); -- Glory of the Dazar'alor Raider
    AddA(tmp[326], a[13687]); -- Glory of the Eternal Raider
    AddA(tmp[326], a[14146]); -- Glory of the Ny'alotha Raider
    tmp[338] = cat:New((addon.EJ_GetInstanceInfo(1031))); -- Uldir
    AddC(tmp[326], tmp[338]);
    AddA(tmp[338], a[12521]); -- Halls of Containment
    AddA(tmp[338], a[12522]); -- Crimson Descent
    AddA(tmp[338], a[12523]); -- Heart of Corruption
    AddA(tmp[338], a[12536]); -- Ahead of the Curve: G'huun
    AddA(tmp[338], a[12535]); -- Cutting Edge: G'huun
    AddA(tmp[338], a[12991]); -- "New Mog, G'huun This?"
    tmp[862] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[338], tmp[862]);
    AddA(tmp[862], a[12937]); -- Elevator Music
    AddA(tmp[862], a[12938]); -- Parental Controls
    AddA(tmp[862], a[12828]); -- What's in the Box?
    AddA(tmp[862], a[12823]); -- Thrash Mouth - All Stars
    AddA(tmp[862], a[12772]); -- Now We Got Bad Blood
    AddA(tmp[862], a[12830]); -- Edgelords
    AddA(tmp[862], a[12836]); -- Existential Crisis
    AddA(tmp[862], a[12551]); -- Double Dribble
    tmp[864] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[338], tmp[864]);
    AddA(tmp[864], a[12524]); -- Mythic: Taloc
    AddA(tmp[864], a[12526]); -- Mythic: MOTHER
    AddA(tmp[864], a[12527]); -- Mythic: Zek'voz
    AddA(tmp[864], a[12530]); -- Mythic: Fetid Devourer
    AddA(tmp[864], a[12529]); -- Mythic: Vectis
    AddA(tmp[864], a[12531]); -- Mythic: Zul
    AddA(tmp[864], a[12532]); -- Mythic: Mythrax the Unraveler
    AddA(tmp[864], a[12533]); -- Mythic: G'huun
    tmp[339] = cat:New((addon.EJ_GetInstanceInfo(1176))); -- Battle of Dazar'alor
    AddC(tmp[326], tmp[339]);
    AddA(tmp[339], a[13286]); -- Siege of Dazar'alor
    AddA(tmp[339], a[13289]); -- Defense of Dazar'alor
    AddA(tmp[339], a[13287]); -- Empire's Fall
    AddA(tmp[339], a[13290]); -- Death's Bargain
    AddA(tmp[339], a[13288]); -- Might of the Alliance
    AddA(tmp[339], a[13291]); -- Victory or Death
    AddA(tmp[339], a[13322]); -- Ahead of the Curve: Lady Jaina Proudmoore
    AddA(tmp[339], a[13323]); -- Cutting Edge: Lady Jaina Proudmoore
    AddA(tmp[339], a[13385]); -- Daz'aling Attire
    tmp[865] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[339], tmp[865]);
    AddA(tmp[865], a[13316]); -- Can I Get a Hek Hek Hek Yeah?
    AddA(tmp[865], a[13431]); -- Hidden Dragon
    AddA(tmp[865], a[13383]); -- Barrel of Monkeys
    AddA(tmp[865], a[13345]); -- Praise the Sunflower
    AddA(tmp[865], a[13325]); -- Walk the Dinosaur
    AddA(tmp[865], a[13425]); -- "We Got Spirit, How About You?"
    AddA(tmp[865], a[13401]); -- I Got Next!
    AddA(tmp[865], a[13430]); -- De Lurker Be'loa
    AddA(tmp[865], a[13410]); -- Snow Fun Allowed
    tmp[866] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[339], tmp[866]);
    AddA(tmp[866], a[13292]); -- Mythic: Champion of the Light
    AddA(tmp[866], a[13298]); -- Mythic: Jadefire Masters
    AddA(tmp[866], a[13293]); -- Mythic: Grong
    AddA(tmp[866], a[13295]); -- Mythic: Jadefire Masters
    AddA(tmp[866], a[13299]); -- Mythic: Opulence
    AddA(tmp[866], a[13300]); -- Mythic: Conclave of the Chosen
    AddA(tmp[866], a[13311]); -- Mythic: King Rastakhan
    AddA(tmp[866], a[13312]); -- Mythic: Mekkatorque
    AddA(tmp[866], a[13313]); -- Mythic: Stormwall Blockade
    AddA(tmp[866], a[13314]); -- Mythic: Lady Jaina Proudmoore
    tmp[340] = cat:New((addon.EJ_GetInstanceInfo(1177))); -- Crucible of Storms
    AddC(tmp[326], tmp[340]);
    AddA(tmp[340], a[13501]); -- Gotta Bounce
    AddA(tmp[340], a[13506]); -- A Good Eye-dea
    AddA(tmp[340], a[13414]); -- Crucible of Storms
    AddA(tmp[340], a[13416]); -- Mythic: The Restless Cabal
    AddA(tmp[340], a[13417]); -- "Mythic: Uu'nat, Harbinger of the Void"
    AddA(tmp[340], a[13418]); -- "Ahead of the Curve: Uu'nat, Harbinger of the Void"
    AddA(tmp[340], a[13419]); -- "Cutting Edge: Uu'nat, Harbinger of the Void"
    tmp[341] = cat:New((addon.EJ_GetInstanceInfo(1179))); -- The Eternal Palace
    AddC(tmp[326], tmp[341]);
    AddA(tmp[341], a[13718]); -- The Grand Reception
    AddA(tmp[341], a[13719]); -- Depths of the Devoted
    AddA(tmp[341], a[13725]); -- The Circle of Stars
    AddA(tmp[341], a[13784]); -- Ahead of the Curve: Queen Azshara
    AddA(tmp[341], a[13785]); -- Cutting Edge: Queen Azshara
    AddA(tmp[341], a[13571]); -- Under the Seams
    tmp[869] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[341], tmp[869]);
    AddA(tmp[869], a[13684]); -- You and What Army?
    AddA(tmp[869], a[13628]); -- Intro to Marine Biology
    AddA(tmp[869], a[13767]); -- Fun Run
    AddA(tmp[869], a[13629]); -- Simple Geometry
    AddA(tmp[869], a[13724]); -- A Smack of Jellyfish
    AddA(tmp[869], a[13633]); -- If It Pleases the Court
    AddA(tmp[869], a[13716]); -- Lactose Intolerant
    AddA(tmp[869], a[13768]); -- The Best of Us
    tmp[870] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[341], tmp[870]);
    AddA(tmp[870], a[13726]); -- Mythic: Abyssal Commander Sivara
    AddA(tmp[870], a[13728]); -- Mythic: Blackwater Behemoth
    AddA(tmp[870], a[13727]); -- Mythic: Radiance of Azshara
    AddA(tmp[870], a[13729]); -- Mythic: Lady Ashvane
    AddA(tmp[870], a[13730]); -- Mythic: Orgozoa
    AddA(tmp[870], a[13731]); -- Mythic: The Queen's Court
    AddA(tmp[870], a[13732]); -- Mythic: Za'qul
    AddA(tmp[870], a[13733]); -- Mythic: Queen Azshara
    tmp[342] = cat:New((addon.EJ_GetInstanceInfo(1180))); -- Ny'alotha, the Waking City
    AddC(tmp[326], tmp[342]);
    AddA(tmp[342], a[14193]); -- Vision of Destiny
    AddA(tmp[342], a[14194]); -- Halls of Devotion
    AddA(tmp[342], a[14195]); -- Gift of Flesh
    AddA(tmp[342], a[14196]); -- The Waking Dream
    AddA(tmp[342], a[14068]); -- Ahead of the Curve: N'Zoth the Corruptor
    AddA(tmp[342], a[14069]); -- Cutting Edge: N'Zoth the Corruptor
    AddA(tmp[342], a[14058]); -- All Eyes On Me
    tmp[871] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[342], tmp[871]);
    AddA(tmp[871], a[14019]); -- Smoke Test
    AddA(tmp[871], a[14008]); -- Mana Sponge
    AddA(tmp[871], a[14037]); -- Phase 3: Prophet
    AddA(tmp[871], a[14024]); -- Buzzer Beater
    AddA(tmp[871], a[14139]); -- Total Annihilation
    AddA(tmp[871], a[14023]); -- Realizing Your Potential
    AddA(tmp[871], a[13999]); -- How? Isn't it Obelisk?
    AddA(tmp[871], a[13990]); -- "You Can Pet the Dog, But..."
    AddA(tmp[871], a[14026]); -- Temper Tantrum
    AddA(tmp[871], a[14038]); -- Bloody Mess
    AddA(tmp[871], a[14147]); -- Cleansing Treatment
    AddA(tmp[871], a[14148]); -- It's Not A Cult
    tmp[872] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[342], tmp[872]);
    AddA(tmp[872], a[14041]); -- "Mythic: Wrathion, the Black Emperor"
    AddA(tmp[872], a[14043]); -- Mythic: Maut
    AddA(tmp[872], a[14044]); -- Mythic: The Prophet Skitra
    AddA(tmp[872], a[14045]); -- Mythic: Dark Inquisitor Xanesh
    AddA(tmp[872], a[14050]); -- Mythic: Vexiona
    AddA(tmp[872], a[14046]); -- Mythic: The Hivemind
    AddA(tmp[872], a[14051]); -- Mythic: Ra-den the Despoiled
    AddA(tmp[872], a[14048]); -- Mythic: Shad'har the Insatiable
    AddA(tmp[872], a[14049]); -- Mythic: Drest'agath
    AddA(tmp[872], a[14052]); -- "Mythic: Il'gynoth, Corruption Reborn"
    AddA(tmp[872], a[14054]); -- Mythic: Carapace of N'Zoth
    AddA(tmp[872], a[14055]); -- Mythic: N'Zoth the Corruptor
    tmp[343] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[258], tmp[343]);
    AddA(tmp[343], a[12930]); -- Battle Safari
    AddA(tmp[343], a[13693]); -- Mecha-Safari
    AddA(tmp[343], a[13694]); -- Nazjatari Safari
    AddA(tmp[343], a[13715]); -- From The Belly Of The Jelly
    AddA(tmp[343], a[12936]); -- Battle on Zandalar and Kul Tiras
    AddA(tmp[343], a[13280]); -- Hobbyist Aquarist
    AddA(tmp[343], a[13270]); -- Beast Mode
    AddA(tmp[343], a[13271]); -- Critters With Huge Teeth
    AddA(tmp[343], a[13272]); -- Dragons Make Everything Better
    AddA(tmp[343], a[13273]); -- Element of Success
    AddA(tmp[343], a[13274]); -- Fun With Flying
    AddA(tmp[343], a[13281]); -- Human Resources
    AddA(tmp[343], a[13275]); -- Magician's Secrets
    AddA(tmp[343], a[13277]); -- Machine Learning
    AddA(tmp[343], a[13278]); -- Not Quite Dead Yet
    AddA(tmp[343], a[13279]); -- Family Battler
    AddA(tmp[343], a[13625]); -- Mighty Minions of Mechagon
    AddA(tmp[343], a[13626]); -- Nautical Nuisances of Nazjatar
    AddA(tmp[343], a[13695]); -- Team Aquashock
    tmp[793] = cat:New(addon.L["Brawler's Guild"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Brawler's Guild
    AddC(tmp[258], tmp[793]);
    AddA(tmp[793], a[11558]); -- The First Rule of Brawler's Guild
    AddA(tmp[793], a[11559]); -- The First Rule of Brawler's Guild
    AddA(tmp[793], a[13186]); -- You Are Not Your $#*@! Legplates
    AddA(tmp[793], a[13188]); -- You Are Not Your $#*@! Legplates
    AddA(tmp[793], a[13189]); -- The Second Rule of Brawler's Guild
    AddA(tmp[793], a[13190]); -- The Second Rule of Brawler's Guild
    AddA(tmp[793], a[13191]); -- Brawler for Azeroth
    AddA(tmp[793], a[13192]); -- Brawler for Azeroth
    AddA(tmp[793], a[11567]); -- You Are Not The Contents Of Your Wallet
    AddA(tmp[793], a[11570]); -- Educated Guesser
    AddA(tmp[793], a[13194]); -- I Am Thrall's Complete Lack Of Surprise
    AddA(tmp[793], a[11573]); -- Rumble Club
    tmp[851] = cat:New(addon.L["Dueler's Guild"]); -- Dueler's Guild
    AddC(tmp[258], tmp[851]);
    AddA(tmp[851], a[12856]); -- The First Rule of Dueler's Guild
    AddA(tmp[851], a[12857]); -- Trial by Combat
    AddA(tmp[851], a[12858]); -- Slugfest
    AddA(tmp[851], a[12860]); -- Contender
    AddA(tmp[851], a[12863]); -- Dueling Master
    AddA(tmp[851], a[12859]); -- Prize Fighter
    AddA(tmp[851], a[12861]); -- Master of Duels
    AddA(tmp[851], a[12862]); -- Thirty Six and Two
    AddA(tmp[851], a[13623]); -- Fighting on Two Fronts
    tmp[425] = cat:New((addon.GetCategoryInfo(15307))); -- Island Expeditions
    AddC(tmp[258], tmp[425]);
    AddA(tmp[425], a[13142]); -- Archipelago Explorer
    AddA(tmp[425], a[13122]); -- Island Conqueror
    AddA(tmp[425], a[13141]); -- Island Slayer
    AddA(tmp[425], a[12596]); -- No Tourist
    AddA(tmp[425], a[12594]); -- Competent Captain
    AddA(tmp[425], a[12595]); -- Expert Expeditioner
    AddA(tmp[425], a[12597]); -- Bayside Brawler
    AddA(tmp[425], a[13120]); -- Blood in the Water
    AddA(tmp[425], a[13121]); -- Notorious
    AddA(tmp[425], a[13129]); -- Sucker Punch
    AddA(tmp[425], a[13123]); -- My Dubs
    AddA(tmp[425], a[13124]); -- Metal Detector
    AddA(tmp[425], a[13125]); -- Azerite Admiral
    AddA(tmp[425], a[13126]); -- Give Me The Energy
    AddA(tmp[425], a[13127]); -- Tell Me A Tale
    AddA(tmp[425], a[13128]); -- I'm Here for the Pets
    AddA(tmp[425], a[13132]); -- Helping Hand
    AddA(tmp[425], a[13133]); -- Team Deathmatch
    AddA(tmp[425], a[13135]); -- Team Deathmatch
    AddA(tmp[425], a[13134]); -- Expedition Leader
    AddA(tmp[425], a[13701]); -- Battlefield Brawler
    AddA(tmp[425], a[13702]); -- Battlefield Tactician
    AddA(tmp[425], a[13703]); -- Battlefield Master
    tmp[436] = cat:New((addon.GetLFGDungeonInfo(1687))); -- Un'gol Ruins
    AddC(tmp[425], tmp[436]);
    AddA(tmp[436], a[12590]); -- Un'gol Ruins
    AddA(tmp[436], a[12589]); -- Heroic: Un'gol Ruins
    AddA(tmp[436], a[12591]); -- Mythic: Un'gol Ruins
    AddA(tmp[436], a[12592]); -- Ruined the Ruins
    tmp[437] = cat:New((addon.GetLFGDungeonInfo(1734))); -- The Dread Chain
    AddC(tmp[425], tmp[437]);
    AddA(tmp[437], a[13095]); -- Dread Chain
    AddA(tmp[437], a[13096]); -- Heroic: Dread Chain
    AddA(tmp[437], a[13097]); -- Mythic: Dread Chain
    AddA(tmp[437], a[13098]); -- Bane of the Chain
    tmp[438] = cat:New((addon.GetLFGDungeonInfo(1723))); -- The Rotting Mire
    AddC(tmp[425], tmp[438]);
    AddA(tmp[438], a[13103]); -- Rotting Mire
    AddA(tmp[438], a[13104]); -- Heroic: Rotting Mire
    AddA(tmp[438], a[13105]); -- Mythic: Rotting Mire
    AddA(tmp[438], a[13106]); -- Mire Marauder
    tmp[439] = cat:New((addon.GetLFGDungeonInfo(1750))); -- The Molten Cay
    AddC(tmp[425], tmp[439]);
    AddA(tmp[439], a[13099]); -- Molten Cay
    AddA(tmp[439], a[13100]); -- Heroic: Molten Cay
    AddA(tmp[439], a[13101]); -- Mythic: Molten Cay
    AddA(tmp[439], a[13102]); -- Clash at the Cay
    tmp[440] = cat:New((addon.GetLFGDungeonInfo(1724))); -- Verdant Wilds
    AddC(tmp[425], tmp[440]);
    AddA(tmp[440], a[13111]); -- Verdant Wilds
    AddA(tmp[440], a[13112]); -- Heroic: Verdant Wilds
    AddA(tmp[440], a[13113]); -- Mythic: Verdant Wilds
    AddA(tmp[440], a[13114]); -- War for the Wilds
    tmp[441] = cat:New((addon.GetLFGDungeonInfo(1725))); -- Skittering Hollow
    AddC(tmp[425], tmp[441]);
    AddA(tmp[441], a[13107]); -- Skittering Hollow
    AddA(tmp[441], a[13108]); -- Heroic: Skittering Hollow
    AddA(tmp[441], a[13109]); -- Mythic: Skittering Hollow
    AddA(tmp[441], a[13110]); -- Skittering Smashed
    tmp[442] = cat:New((addon.GetLFGDungeonInfo(1735))); -- The Whispering Reef
    AddC(tmp[425], tmp[442]);
    AddA(tmp[442], a[13119]); -- Whispering Reef
    AddA(tmp[442], a[13118]); -- Heroic: Whispering Reef
    AddA(tmp[442], a[13116]); -- Mythic: Whispering Reef
    AddA(tmp[442], a[13115]); -- Reef Madness
    tmp[443] = cat:New((addon.GetLFGDungeonInfo(1932))); -- Jorundall
    AddC(tmp[425], tmp[443]);
    AddA(tmp[443], a[13389]); -- Jorundall
    AddA(tmp[443], a[13394]); -- Heroic: Jorundall
    AddA(tmp[443], a[13395]); -- Mythic: Jorundall
    AddA(tmp[443], a[13399]); -- Jorundall Justice
    tmp[444] = cat:New((addon.GetLFGDungeonInfo(1928))); -- Havenswood
    AddC(tmp[425], tmp[444]);
    AddA(tmp[444], a[13396]); -- Havenswood
    AddA(tmp[444], a[13397]); -- Heroic: Havenswood
    AddA(tmp[444], a[13398]); -- Mythic: Havenswood
    AddA(tmp[444], a[13400]); -- Havenswood Hero
    tmp[445] = cat:New((addon.GetLFGDungeonInfo(1984))); -- Crestfall
    AddC(tmp[425], tmp[445]);
    AddA(tmp[445], a[13577]); -- Crestfall
    AddA(tmp[445], a[13578]); -- Heroic: Crestfall
    AddA(tmp[445], a[13579]); -- Mythic: Crestfall
    AddA(tmp[445], a[13580]); -- Crestfallen
    tmp[446] = cat:New((addon.GetLFGDungeonInfo(1983))); -- Snowblossom Village
    AddC(tmp[425], tmp[446]);
    AddA(tmp[446], a[13581]); -- Snowblossom Village
    AddA(tmp[446], a[13582]); -- Heroic: Snowblossom Village
    AddA(tmp[446], a[13583]); -- Mythic: Snowblossom Village
    AddA(tmp[446], a[13584]); -- Snowblossom Scrapper
    tmp[426] = cat:New((addon.GetCategoryInfo(15308))); -- War Effort
    AddC(tmp[258], tmp[426]);
    AddA(tmp[426], a[12867]); -- Azeroth at War: The Barrens
    AddA(tmp[426], a[12896]); -- Azeroth at War: The Barrens
    AddA(tmp[426], a[12869]); -- Azeroth at War: After Lordaeron
    AddA(tmp[426], a[12898]); -- Azeroth at War: After Lordaeron
    AddA(tmp[426], a[12870]); -- Azeroth at War: Kalimdor on Fire
    AddA(tmp[426], a[12899]); -- Azeroth at War: Kalimdor on Fire
    AddA(tmp[426], a[12872]); -- The Dirty Five
    tmp[434] = cat:New((addon.GetLFGDungeonInfo(1615))); -- Battle for Stromgarde
    AddC(tmp[426], tmp[434]);
    AddA(tmp[434], a[12881]); -- War is Hell
    AddA(tmp[434], a[12873]); -- War is Hell
    AddA(tmp[434], a[13737]); -- Heroic: War is Hell
    AddA(tmp[434], a[13735]); -- Heroic: War is Hell
    AddA(tmp[434], a[12888]); -- Strike Hard
    AddA(tmp[434], a[12877]); -- Strike Hard
    AddA(tmp[434], a[12889]); -- Strike Fast
    AddA(tmp[434], a[12876]); -- Strike Fast
    AddA(tmp[434], a[12884]); -- Leader of Troops
    AddA(tmp[434], a[12878]); -- Leader of Troops
    AddA(tmp[434], a[12886]); -- Tour of War
    AddA(tmp[434], a[12879]); -- Tour of War
    AddA(tmp[434], a[13739]); -- Heroic: Tour of War
    AddA(tmp[434], a[13738]); -- Heroic: Tour of War
    AddA(tmp[434], a[12874]); -- An Eventful Battle
    tmp[435] = cat:New((addon.GetLFGDungeonInfo(1901))); -- The Battle for Darkshore
    AddC(tmp[426], tmp[435]);
    AddA(tmp[435], a[13297]); -- War for the Shore
    AddA(tmp[435], a[13296]); -- War for the Shore
    AddA(tmp[435], a[14150]); -- Heroic: War for the Shore
    AddA(tmp[435], a[14149]); -- Heroic: War for the Shore
    AddA(tmp[435], a[13302]); -- Under Cover of Darkness
    AddA(tmp[435], a[13301]); -- Under Cover of Darkness
    AddA(tmp[435], a[13305]); -- Night Moves
    AddA(tmp[435], a[13306]); -- Night Moves
    AddA(tmp[435], a[13308]); -- Recruitment Officer
    AddA(tmp[435], a[13307]); -- Recruitment Officer
    AddA(tmp[435], a[13310]); -- By Nature's Call
    AddA(tmp[435], a[13309]); -- Deforester
    tmp[427] = cat:New((addon.GetCategoryInfo(15417))); -- Heart of Azeroth
    AddC(tmp[258], tmp[427]);
    AddA(tmp[427], a[12918]); -- Have a Heart
    AddA(tmp[427], a[13998]); -- Pure of Heart
    AddA(tmp[427], a[13572]); -- The Heart Forge
    AddA(tmp[427], a[13769]); -- Power Up
    AddA(tmp[427], a[13770]); -- Power Creep
    AddA(tmp[427], a[13771]); -- Power Is Beautiful
    AddA(tmp[427], a[13772]); -- Essence Essentials
    AddA(tmp[427], a[13773]); -- Essence Gains
    AddA(tmp[427], a[13775]); -- Essence Overload
    AddA(tmp[427], a[13777]); -- My Heart Container is Full
    AddA(tmp[427], a[13779]); -- Phenomenal Cosmic Power
    tmp[428] = cat:New((addon.GetCategoryInfo(15426))); -- Visions of N'Zoth
    AddC(tmp[258], tmp[428]);
    AddA(tmp[428], a[14143]); -- Reeking of Visions
    AddA(tmp[428], a[13994]); -- Through the Depths of Visions
    AddA(tmp[428], a[14060]); -- Unwavering Resolve
    AddA(tmp[428], a[14061]); -- We Have the Technology
    AddA(tmp[428], a[14062]); -- Horrific Vision of Stormwind
    AddA(tmp[428], a[14064]); -- The Even More Horrific Vision of Stormwind
    AddA(tmp[428], a[14066]); -- The Most Horrific Vision of Stormwind
    AddA(tmp[428], a[14063]); -- Horrific Vision of Orgrimmar
    AddA(tmp[428], a[14065]); -- The Even More Horrific Vision of Orgrimmar
    AddA(tmp[428], a[14067]); -- The Most Horrific Vision of Orgrimmar
    AddA(tmp[428], a[14162]); -- Horrific Masquerade
    AddA(tmp[428], a[14165]); -- Masked Soliloquy
    AddA(tmp[428], a[14166]); -- Masked Duet
    AddA(tmp[428], a[14167]); -- Masked Trio
    AddA(tmp[428], a[14168]); -- Masked Quartet
    AddA(tmp[428], a[14169]); -- Symphony of Masks
    AddA(tmp[428], a[14170]); -- Thanks For The Mementos
    AddA(tmp[428], a[14171]); -- Memento Mori
    AddA(tmp[428], a[14172]); -- A Monumental Amount of Mementos
    AddA(tmp[428], a[14173]); -- A Mountain of Mementos
    AddA(tmp[428], a[14140]); -- Mad World
    tmp[6] = cat:New((addon.GetCategoryInfo(15439))); -- Shadowlands
    AddC(tmp[883], tmp[6]);
    AddA(tmp[6], a[15654]); -- Back from the Beyond
    tmp[344] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[6], tmp[344]);
    AddA(tmp[344], a[14280]); -- Loremaster of Shadowlands
    AddA(tmp[344], a[14758]); -- The World Beyond
    AddA(tmp[344], a[15388]); -- Shadowlands Explorer
    AddA(tmp[344], a[14825]); -- Shadowlands Voyager
    AddA(tmp[344], a[14731]); -- To All the Squirrels I've Loved and Lost
    AddA(tmp[344], a[14515]); -- Zo'Sorg's Bidding
    AddA(tmp[344], a[14516]); -- Impressing Zo'Sorg
    AddA(tmp[344], a[14519]); -- Covenant Combat
    AddA(tmp[344], a[14315]); -- Shadowlands Diplomat
    AddA(tmp[344], a[15064]); -- Breaking the Chains
    AddA(tmp[344], a[7520]); -- The Loremaster
    tmp[345] = cat:New(addon.GetMapName(1533)); -- Bastion
    AddC(tmp[344], tmp[345]);
    tmp[346] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[345], tmp[346]);
    AddA(tmp[346], a[14281]); -- The Path to Ascension
    AddA(tmp[346], a[14801]); -- Sojourner of Bastion
    AddA(tmp[346], a[14737]); -- What Bastion Remembered
    AddA(tmp[346], a[14735]); -- Flight School Graduate
    AddA(tmp[346], a[14741]); -- Aerial Ace
    AddA(tmp[346], a[14762]); -- Breaking the Stratus Fear
    tmp[347] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[345], tmp[347]);
    AddA(tmp[347], a[14303]); -- Explore Bastion
    AddA(tmp[347], a[14307]); -- Adventurer of Bastion
    AddA(tmp[347], a[14311]); -- Treasures of Bastion
    AddA(tmp[347], a[14339]); -- Shard Labor
    AddA(tmp[347], a[14734]); -- Rallying Cry of the Ascended
    AddA(tmp[347], a[14767]); -- Count Your Blessings
    AddA(tmp[347], a[14768]); -- What is that Melody?
    AddA(tmp[347], a[14733]); -- In the Hot Seat
    tmp[348] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[345], tmp[348]);
    AddA(tmp[348], a[14514]); -- Tour of Duty: Bastion
    tmp[349] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[345], tmp[349]);
    AddA(tmp[349], a[14335]); -- The Ascended
    tmp[350] = cat:New(addon.GetMapName(1536)); -- Maldraxxus
    AddC(tmp[344], tmp[350]);
    tmp[351] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[350], tmp[351]);
    AddA(tmp[351], a[14206]); -- Blade of the Primus
    AddA(tmp[351], a[14799]); -- Sojourner of Maldraxxus
    tmp[352] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[350], tmp[352]);
    AddA(tmp[352], a[14305]); -- Explore Maldraxxus
    AddA(tmp[352], a[14308]); -- Adventurer of Maldraxxus
    AddA(tmp[352], a[14312]); -- Treasures of Maldraxxus
    AddA(tmp[352], a[14626]); -- Harvester of Sorrow
    AddA(tmp[352], a[14802]); -- Bloodsport
    AddA(tmp[352], a[14721]); -- It's In The Mix
    AddA(tmp[352], a[14634]); -- Nine Afterlives
    tmp[353] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[350], tmp[353]);
    AddA(tmp[353], a[14513]); -- Tour of Duty: Maldraxxus
    tmp[354] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[350], tmp[354]);
    AddA(tmp[354], a[14336]); -- Undying Army
    tmp[355] = cat:New(addon.GetMapName(1565)); -- Ardenweald
    AddC(tmp[344], tmp[355]);
    tmp[356] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[355], tmp[356]);
    AddA(tmp[356], a[14164]); -- "Awaken, Ardenweald"
    AddA(tmp[356], a[14800]); -- Sojourner of Ardenweald
    AddA(tmp[356], a[14671]); -- Something's Not Quite Right....
    AddA(tmp[356], a[14672]); -- "A Bit of This, A Bit of That"
    tmp[357] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[355], tmp[357]);
    AddA(tmp[357], a[14304]); -- Explore Ardenweald
    AddA(tmp[357], a[14309]); -- Adventurer of Ardenweald
    AddA(tmp[357], a[14313]); -- Treasures of Ardenweald
    AddA(tmp[357], a[14353]); -- Ardenweald's a Stage
    AddA(tmp[357], a[14791]); -- Toss a Seed to Your Hunter...
    AddA(tmp[357], a[14774]); -- Ardenweald Gourmand
    AddA(tmp[357], a[14788]); -- Fractured Faerie Tales
    AddA(tmp[357], a[14779]); -- Wild Hunting
    AddA(tmp[357], a[14504]); -- "Niya, As Xavius"
    AddA(tmp[357], a[14505]); -- "Senthii, As Gul'dan"
    AddA(tmp[357], a[14506]); -- "Glimmerdust, As Kil'jaeden"
    AddA(tmp[357], a[14507]); -- "Mi'kai, As Argus"
    AddA(tmp[357], a[14508]); -- "Glimmerdust, As Jaina"
    AddA(tmp[357], a[14509]); -- "Astra, As Azshara"
    AddA(tmp[357], a[14510]); -- "Dreamweaver, As N'Zoth"
    tmp[358] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[355], tmp[358]);
    AddA(tmp[358], a[14511]); -- Tour of Duty: Ardenweald
    tmp[359] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[355], tmp[359]);
    AddA(tmp[359], a[14337]); -- The Wild Hunt
    tmp[360] = cat:New(addon.GetMapName(1525)); -- Revendreth
    AddC(tmp[344], tmp[360]);
    tmp[361] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[360], tmp[361]);
    AddA(tmp[361], a[13878]); -- The Master of Revendreth
    AddA(tmp[361], a[14798]); -- Sojourner of Revendreth
    AddA(tmp[361], a[14233]); -- Tea Tales
    AddA(tmp[361], a[14765]); -- Ramparts Racer
    AddA(tmp[361], a[14766]); -- Parasoling
    AddA(tmp[361], a[14772]); -- Caught in a Bat Romance
    tmp[362] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[360], tmp[362]);
    AddA(tmp[362], a[14306]); -- Explore Revendreth
    AddA(tmp[362], a[14310]); -- Adventurer of Revendreth
    AddA(tmp[362], a[14314]); -- Treasures of Revendreth
    AddA(tmp[362], a[14277]); -- The Accuser's Avowed
    AddA(tmp[362], a[14274]); -- Absolution for All
    AddA(tmp[362], a[14272]); -- Best Bud With Benefits
    AddA(tmp[362], a[14276]); -- It's Always Sinny in Revendreth
    AddA(tmp[362], a[14769]); -- Bat!
    AddA(tmp[362], a[14771]); -- The Afterlife Express
    AddA(tmp[362], a[14770]); -- What We Ride in the Shadows
    AddA(tmp[362], a[14273]); -- Crypt Kicker
    tmp[363] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[360], tmp[363]);
    AddA(tmp[363], a[14512]); -- Tour of Duty: Revendreth
    tmp[364] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[360], tmp[364]);
    AddA(tmp[364], a[14338]); -- Court of Harvesters
    tmp[365] = cat:New(addon.GetMapName(1543)); -- The Maw
    AddC(tmp[344], tmp[365]);
    AddA(tmp[365], a[15648]); -- Walking in Maw-mphis
    tmp[366] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[365], tmp[366]);
    AddA(tmp[366], a[14334]); -- Into the Maw
    AddA(tmp[366], a[14961]); -- Chains of Domination
    AddA(tmp[366], a[15000]); -- United Front
    AddA(tmp[366], a[15001]); -- Jailer's Personal Stash
    AddA(tmp[366], a[15037]); -- This Army
    AddA(tmp[366], a[15039]); -- Up For Grabs
    AddA(tmp[366], a[15041]); -- The Zovaal Shuffle
    AddA(tmp[366], a[15043]); -- Hoarder of Torghast
    AddA(tmp[366], a[15042]); -- Tea for the Troubled
    AddA(tmp[366], a[15044]); -- Krrprripripkraak's Heroes
    AddA(tmp[366], a[15035]); -- On the Offensive
    AddA(tmp[366], a[15036]); -- Rooting Out the Evil
    AddA(tmp[366], a[15034]); -- Wings Against the Flames
    AddA(tmp[366], a[15033]); -- Taking the Tremaculum
    AddA(tmp[366], a[15032]); -- Breaking Their Hold
    tmp[367] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[365], tmp[367]);
    AddA(tmp[367], a[14663]); -- Explore The Maw
    AddA(tmp[367], a[14658]); -- Soulkeeper's Burden
    AddA(tmp[367], a[14659]); -- Handling His Henchmen
    AddA(tmp[367], a[14660]); -- It's About Sending a Message
    AddA(tmp[367], a[14738]); -- Hunting Party
    AddA(tmp[367], a[14742]); -- Who Sent You?
    AddA(tmp[367], a[14743]); -- Deadly Serious
    AddA(tmp[367], a[14744]); -- Better to Be Lucky Than Dead
    AddA(tmp[367], a[14745]); -- Grand Theft Shadehound
    AddA(tmp[367], a[14746]); -- Prepare for Trouble!
    AddA(tmp[367], a[14747]); -- Make it Double!
    AddA(tmp[367], a[14761]); -- Deciphering Death's Intentions
    AddA(tmp[367], a[14894]); -- "To 'Ghast, Two Curios"
    AddA(tmp[367], a[14895]); -- 'Ghast Five
    AddA(tmp[367], a[15054]); -- Minions of the Cold Dark
    AddA(tmp[367], a[15107]); -- Conquering Korthia
    AddA(tmp[367], a[14943]); -- Guarmageddon
    tmp[368] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[365], tmp[368]);
    AddA(tmp[368], a[14656]); -- Trading Partners
    tmp[812] = cat:New(addon.GetMapName(1961)); -- Korthia
    AddC(tmp[344], tmp[812]);
    tmp[817] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[812], tmp[817]);
    AddA(tmp[817], a[15066]); -- Reliquary Restoration
    AddA(tmp[817], a[15055]); -- Friend of Ooz
    AddA(tmp[817], a[15056]); -- Friend of Bloop
    AddA(tmp[817], a[15057]); -- Friend of Plaguey
    tmp[818] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[812], tmp[818]);
    AddA(tmp[818], a[15053]); -- Explore Korthia
    AddA(tmp[818], a[15107]); -- Conquering Korthia
    AddA(tmp[818], a[15099]); -- Treasures of Korthia
    tmp[813] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[812], tmp[813]);
    AddA(tmp[813], a[15059]); -- Death's Advance
    AddA(tmp[813], a[15069]); -- The Archivists' Codex
    tmp[1035] = cat:New(addon.GetMapName(1970)); -- Zereth Mortis
    AddC(tmp[344], tmp[1035]);
    tmp[1036] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[1035], tmp[1036]);
    AddA(tmp[1036], a[15229]); -- Traversing the Spheres
    AddA(tmp[1036], a[15336]); -- From A to Zereth
    AddA(tmp[1036], a[15259]); -- Secrets of the First Ones
    AddA(tmp[1036], a[15515]); -- Path to Enlightenment
    AddA(tmp[1036], a[15518]); -- A Means to an End
    tmp[1037] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1035], tmp[1037]);
    AddA(tmp[1037], a[15224]); -- Explore Zereth Mortis
    AddA(tmp[1037], a[15391]); -- Adventurer of Zereth Mortis
    AddA(tmp[1037], a[15392]); -- Dune Dominance
    AddA(tmp[1037], a[15331]); -- Treasures of Zereth Mortis
    AddA(tmp[1037], a[15211]); -- Completing the Code
    AddA(tmp[1037], a[15402]); -- Cyphers of the First Ones
    AddA(tmp[1037], a[15502]); -- "Sand, Sand Everywhere!"
    AddA(tmp[1037], a[15406]); -- Synthesized!
    AddA(tmp[1037], a[15407]); -- Synthe-fived!
    AddA(tmp[1037], a[15410]); -- Synthe-superfived!
    AddA(tmp[1037], a[15411]); -- Synthe-supersized!
    AddA(tmp[1037], a[15508]); -- Fashion of the First Ones
    AddA(tmp[1037], a[15404]); -- Cosmic Empowerment
    AddA(tmp[1037], a[15509]); -- Tales of the Exile
    AddA(tmp[1037], a[15512]); -- Adventures in Zereth Mortis
    AddA(tmp[1037], a[15513]); -- Curious Collections
    AddA(tmp[1037], a[15514]); -- Unlocking the Secrets
    AddA(tmp[1037], a[15542]); -- Apocopocolypse Now
    tmp[1038] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1035], tmp[1038]);
    AddA(tmp[1038], a[15220]); -- The Enlightened
    tmp[369] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
    AddC(tmp[6], tmp[369]);
    AddA(tmp[369], a[14418]); -- Shadowlands Dungeon Hero
    AddA(tmp[369], a[15651]); -- Myths of the Shadowlands Dungeons
    AddA(tmp[369], a[14322]); -- Glory of the Shadowlands Hero
    AddA(tmp[369], a[11183]); -- Keystone Initiate
    AddA(tmp[369], a[11184]); -- Keystone Challenger
    AddA(tmp[369], a[11185]); -- Keystone Conqueror
    AddA(tmp[369], a[11162]); -- Keystone Master
    AddA(tmp[369], a[14938]); -- Shadowlands Keystone Explorer: Season One
    AddA(tmp[369], a[14531]); -- Shadowlands Keystone Conqueror: Season One
    AddA(tmp[369], a[14532]); -- Shadowlands Keystone Master: Season One
    AddA(tmp[369], a[15073]); -- Shadowlands Keystone Explorer: Season Two
    AddA(tmp[369], a[15077]); -- Shadowlands Keystone Conqueror: Season Two
    AddA(tmp[369], a[15078]); -- Shadowlands Keystone Master: Season Two
    AddA(tmp[369], a[15327]); -- Tormented Hero: Shadowlands Season 2
    AddA(tmp[369], a[15496]); -- Shadowlands Keystone Explorer: Season Three
    AddA(tmp[369], a[15498]); -- Shadowlands Keystone Conqueror: Season Three
    AddA(tmp[369], a[15499]); -- Shadowlands Keystone Master: Season Three
    AddA(tmp[369], a[15506]); -- Shadowlands Keystone Hero: Season Three
    AddA(tmp[369], a[15691]); -- Cryptic Hero: Shadowlands Season 3
    AddA(tmp[369], a[15688]); -- Shadowlands Keystone Explorer: Season Four
    AddA(tmp[369], a[15689]); -- Shadowlands Keystone Conqueror: Season Four
    AddA(tmp[369], a[15690]); -- Shadowlands Keystone Master: Season Four
    AddA(tmp[369], a[15756]); -- Shrouded Hero: Shadowlands Season 4
    tmp[371] = cat:New((addon.EJ_GetInstanceInfo(1182))); -- The Necrotic Wake
    AddC(tmp[369], tmp[371]);
    AddA(tmp[371], a[14295]); -- Bountiful Harvest
    AddA(tmp[371], a[14320]); -- Surgeon's Supplies
    AddA(tmp[371], a[14285]); -- Ready for Raiding VII
    AddA(tmp[371], a[14366]); -- The Necrotic Wake
    AddA(tmp[371], a[14367]); -- Heroic: The Necrotic Wake
    AddA(tmp[371], a[14368]); -- Mythic: The Necrotic Wake
    AddA(tmp[371], a[15045]); -- Keystone Hero: The Necrotic Wake
    tmp[372] = cat:New((addon.EJ_GetInstanceInfo(1183))); -- Plaguefall
    AddC(tmp[369], tmp[372]);
    AddA(tmp[372], a[14292]); -- Riding with my Slimes
    AddA(tmp[372], a[14347]); -- Full Gores Meal
    AddA(tmp[372], a[14296]); -- Going Viral
    AddA(tmp[372], a[14369]); -- Plaguefall
    AddA(tmp[372], a[14414]); -- Heroic: Plaguefall
    AddA(tmp[372], a[14415]); -- Mythic: Plaguefall
    AddA(tmp[372], a[15046]); -- Keystone Hero: Plaguefall
    tmp[373] = cat:New((addon.EJ_GetInstanceInfo(1184))); -- Mists of Tirna Scithe
    AddC(tmp[369], tmp[373]);
    AddA(tmp[373], a[14503]); -- Hooked On Hydroponics
    AddA(tmp[373], a[14291]); -- Someone Could Trip on These!
    AddA(tmp[373], a[14375]); -- Hunger for Knowledge
    AddA(tmp[373], a[14371]); -- Mists of Tirna Scithe
    AddA(tmp[373], a[14412]); -- Heroic: Mists of Tirna Scithe
    AddA(tmp[373], a[14413]); -- Mythic: Mists of Tirna Scithe
    AddA(tmp[373], a[15047]); -- Keystone Hero: Mists of Tirna Scithe
    tmp[374] = cat:New((addon.EJ_GetInstanceInfo(1185))); -- Halls of Atonement
    AddC(tmp[369], tmp[374]);
    AddA(tmp[374], a[14567]); -- Picking Up the Pieces
    AddA(tmp[374], a[14284]); -- Breaking Bad
    AddA(tmp[374], a[14352]); -- Nobody Puts Denathrius in a Corner
    AddA(tmp[374], a[14370]); -- Halls of Atonement
    AddA(tmp[374], a[14410]); -- Heroic: Halls of Atonement
    AddA(tmp[374], a[14411]); -- Mythic: Halls of Atonement
    AddA(tmp[374], a[15048]); -- Keystone Hero: Halls of Atonement
    tmp[375] = cat:New((addon.EJ_GetInstanceInfo(1186))); -- Spires of Ascension
    AddC(tmp[369], tmp[375]);
    AddA(tmp[375], a[14331]); -- Goliath Offline
    AddA(tmp[375], a[14323]); -- ExSPEARiential
    AddA(tmp[375], a[14327]); -- I Can See My House From Here
    AddA(tmp[375], a[14326]); -- Spires of Ascension
    AddA(tmp[375], a[14324]); -- Heroic: Spires of Ascension
    AddA(tmp[375], a[14325]); -- Mythic: Spires of Ascension
    AddA(tmp[375], a[15049]); -- Keystone Hero: Spires of Ascension
    tmp[376] = cat:New((addon.EJ_GetInstanceInfo(1187))); -- Theater of Pain
    AddC(tmp[369], tmp[376]);
    AddA(tmp[376], a[14297]); -- Three Choose One
    AddA(tmp[376], a[14607]); -- Fresh Meat!
    AddA(tmp[376], a[14533]); -- Royal Rumble
    AddA(tmp[376], a[14372]); -- Theater of Pain
    AddA(tmp[376], a[14416]); -- Heroic: Theater of Pain
    AddA(tmp[376], a[14417]); -- Mythic: Theater of Pain
    AddA(tmp[376], a[15050]); -- Keystone Hero: Theater of Pain
    tmp[377] = cat:New((addon.EJ_GetInstanceInfo(1188))); -- De Other Side
    AddC(tmp[369], tmp[377]);
    AddA(tmp[377], a[14354]); -- Highly Communicable
    AddA(tmp[377], a[14374]); -- Couple's Therapy
    AddA(tmp[377], a[14606]); -- Thinking with...
    AddA(tmp[377], a[14373]); -- De Other Side
    AddA(tmp[377], a[14408]); -- Heroic: De Other Side
    AddA(tmp[377], a[14409]); -- Mythic: De Other Side
    AddA(tmp[377], a[15051]); -- Keystone Hero: De Other Side
    tmp[378] = cat:New((addon.EJ_GetInstanceInfo(1189))); -- Sanguine Depths
    AddC(tmp[369], tmp[378]);
    AddA(tmp[378], a[14286]); -- Residue Evil
    AddA(tmp[378], a[14290]); -- I Only Have Eyes For You
    AddA(tmp[378], a[14289]); -- Kaal-ed Shot
    AddA(tmp[378], a[14197]); -- Sanguine Depths
    AddA(tmp[378], a[14198]); -- Heroic: Sanguine Depths
    AddA(tmp[378], a[14199]); -- Mythic: Sanguine Depths
    AddA(tmp[378], a[15052]); -- Keystone Hero: Sanguine Depths
    tmp[823] = cat:New((addon.EJ_GetInstanceInfo(1194))); -- Tazavesh, the Veiled Market
    AddC(tmp[369], tmp[823]);
    AddA(tmp[823], a[15109]); -- Will it Blend?
    AddA(tmp[823], a[15106]); -- Quality Control
    AddA(tmp[823], a[15179]); -- This is Fine
    AddA(tmp[823], a[15190]); -- Mischief!
    AddA(tmp[823], a[15178]); -- Fake It 'Til You Make It
    AddA(tmp[823], a[15177]); -- "Tazavesh, the Veiled Market"
    AddA(tmp[823], a[15650]); -- Mythic: Streets of Wonder
    AddA(tmp[823], a[15652]); -- Mythic: So'leah's Gambit
    AddA(tmp[823], a[15500]); -- "Keystone Hero: Tazavesh, the Veiled Market"
    tmp[370] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
    AddC(tmp[6], tmp[370]);
    AddA(tmp[370], a[14355]); -- Glory of the Nathria Raider
    AddA(tmp[370], a[15130]); -- Glory of the Dominant Raider
    AddA(tmp[370], a[15491]); -- Glory of the Sepulcher Raider
    AddA(tmp[370], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[370], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[370], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[379] = cat:New((addon.EJ_GetInstanceInfo(1190))); -- Castle Nathria
    AddC(tmp[370], tmp[379]);
    AddA(tmp[379], a[14715]); -- Castle Nathria
    AddA(tmp[379], a[14717]); -- Heroic: Castle Nathria
    AddA(tmp[379], a[14718]); -- Mythic: Castle Nathria
    AddA(tmp[379], a[15663]); -- Fate of Nathria
    AddA(tmp[379], a[15664]); -- Heroic: Fate of Nathria
    AddA(tmp[379], a[15665]); -- Mythic: Fate of Nathria
    AddA(tmp[379], a[14460]); -- Ahead of the Curve: Sire Denathrius
    AddA(tmp[379], a[14461]); -- Cutting Edge: Sire Denathrius
    AddA(tmp[379], a[14614]); -- Castle Vain
    tmp[860] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[379], tmp[860]);
    AddA(tmp[860], a[14293]); -- Blind as a Bat
    AddA(tmp[860], a[14523]); -- Taking Care of Business
    AddA(tmp[860], a[14376]); -- Feed the Beast
    AddA(tmp[860], a[14524]); -- I Don't Know What I Expected
    AddA(tmp[860], a[14617]); -- Private Stock
    AddA(tmp[860], a[14608]); -- Burning Bright
    AddA(tmp[860], a[14619]); -- Pour Decision Making
    AddA(tmp[860], a[14294]); -- Dirtflap's Revenge
    AddA(tmp[860], a[14525]); -- "Feed Me, Seymour!"
    AddA(tmp[860], a[14610]); -- Clear Conscience
    tmp[861] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[379], tmp[861]);
    AddA(tmp[861], a[14356]); -- Mythic: Shriekwing
    AddA(tmp[861], a[14357]); -- Mythic: Huntsman Altimor
    AddA(tmp[861], a[14358]); -- Mythic: Hungering Destroyer
    AddA(tmp[861], a[14361]); -- Mythic: Lady Inerva Darkvein
    AddA(tmp[861], a[14359]); -- Mythic: Artificer Xy'mox
    AddA(tmp[861], a[14360]); -- Mythic: Sun King's Salvation
    AddA(tmp[861], a[14362]); -- Mythic: The Council of Blood
    AddA(tmp[861], a[14363]); -- Mythic: Sludgefist
    AddA(tmp[861], a[14364]); -- Mythic: Stone Legion Generals
    AddA(tmp[861], a[14365]); -- Mythic: Sire Denathrius
    tmp[821] = cat:New((addon.EJ_GetInstanceInfo(1193))); -- Sanctum of Domination
    AddC(tmp[370], tmp[821]);
    AddA(tmp[821], a[15122]); -- The Jailer's Vanguard
    AddA(tmp[821], a[15123]); -- The Dark Bastille
    AddA(tmp[821], a[15124]); -- Shackles of Fate
    AddA(tmp[821], a[15125]); -- The Reckoning
    AddA(tmp[821], a[15126]); -- Sanctum of Domination
    AddA(tmp[821], a[15127]); -- Heroic: Sanctum of Domination
    AddA(tmp[821], a[15128]); -- Mythic: Sanctum of Domination
    AddA(tmp[821], a[15667]); -- Fate of Domination
    AddA(tmp[821], a[15668]); -- Heroic: Fate of Domination
    AddA(tmp[821], a[15669]); -- Mythic: Fate of Domination
    AddA(tmp[821], a[15134]); -- Ahead of the Curve: Sylvanas Windrunner
    AddA(tmp[821], a[15135]); -- Cutting Edge: Sylvanas Windrunner
    AddA(tmp[821], a[15110]); -- Dominating the Catwalk
    AddA(tmp[821], a[15191]); -- "Rae'shalare, Death's Whisper"
    tmp[858] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[821], tmp[858]);
    AddA(tmp[858], a[14998]); -- "Name A Better Duo, I'll Wait"
    AddA(tmp[858], a[15065]); -- Eye Wish You Were Here
    AddA(tmp[858], a[15003]); -- To the Nines
    AddA(tmp[858], a[15058]); -- I Used to Bullseye Deeprun Rats Back Home
    AddA(tmp[858], a[15105]); -- Tormentor's Tango
    AddA(tmp[858], a[15131]); -- Whack-A-Soul
    AddA(tmp[858], a[15132]); -- Knowledge is Power
    AddA(tmp[858], a[15040]); -- Flawless Fate
    AddA(tmp[858], a[15108]); -- Together Forever
    AddA(tmp[858], a[15133]); -- This World is a Prism
    tmp[859] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[821], tmp[859]);
    AddA(tmp[859], a[15112]); -- Mythic: The Tarragrue
    AddA(tmp[859], a[15113]); -- Mythic: The Eye of the Jailer
    AddA(tmp[859], a[15114]); -- Mythic: The Nine
    AddA(tmp[859], a[15115]); -- Mythic: Remnant of Ner'zhul
    AddA(tmp[859], a[15116]); -- Mythic: Soulrender Dormazain
    AddA(tmp[859], a[15117]); -- Mythic: Painsmith Raznal
    AddA(tmp[859], a[15118]); -- Mythic: Guardian of the First Ones
    AddA(tmp[859], a[15119]); -- Mythic: Fatescribe Roh-Kalo
    AddA(tmp[859], a[15120]); -- Mythic: Kel'Thuzad
    AddA(tmp[859], a[15121]); -- Mythic: Sylvanas Windrunner
    tmp[1040] = cat:New((addon.EJ_GetInstanceInfo(1195))); -- Sepulcher of the First Ones
    AddC(tmp[370], tmp[1040]);
    AddA(tmp[1040], a[15492]); -- Cornerstone of Creation
    AddA(tmp[1040], a[15493]); -- Ephemeral Plains
    AddA(tmp[1040], a[15416]); -- Domination's Grasp
    AddA(tmp[1040], a[15418]); -- The Grand Design
    AddA(tmp[1040], a[15417]); -- Sepulcher of the First Ones
    AddA(tmp[1040], a[15478]); -- Heroic: Sepulcher of the First Ones
    AddA(tmp[1040], a[15490]); -- Mythic: Sepulcher of the First Ones
    AddA(tmp[1040], a[15681]); -- Fate of the Sepulcher
    AddA(tmp[1040], a[15682]); -- Heroic: Fate of the Sepulcher
    AddA(tmp[1040], a[15683]); -- Mythic: Fate of the Sepulcher
    AddA(tmp[1040], a[15470]); -- Ahead of the Curve: The Jailer
    AddA(tmp[1040], a[15471]); -- Cutting Edge: The Jailer
    AddA(tmp[1040], a[15409]); -- First Wonders
    tmp[1041] = cat:New(addon.L["Glory"]); -- Glory
    AddC(tmp[1040], tmp[1041]);
    AddA(tmp[1041], a[15381]); -- Power ON
    AddA(tmp[1041], a[15401]); -- Wisdom Comes From the Desert
    AddA(tmp[1041], a[15398]); -- "Xy Never, Ever Marks the Spot."
    AddA(tmp[1041], a[15397]); -- Four Ring Circus
    AddA(tmp[1041], a[15400]); -- Where the Wild Corgis Are
    AddA(tmp[1041], a[15419]); -- The Protoform Matrix
    AddA(tmp[1041], a[15386]); -- Shimmering Secrets
    AddA(tmp[1041], a[15399]); -- Coming to Terms
    AddA(tmp[1041], a[15315]); -- Amidst Ourselves
    AddA(tmp[1041], a[15396]); -- We Are All Made of Stars
    AddA(tmp[1041], a[15494]); -- Damnation Aviation
    tmp[1042] = cat:New(addon.L["Mythic"]); -- Mythic
    AddC(tmp[1040], tmp[1042]);
    AddA(tmp[1042], a[15479]); -- Mythic: Vigilant Guardian
    AddA(tmp[1042], a[15480]); -- Mythic: Skolex
    AddA(tmp[1042], a[15481]); -- Mythic: Artificer Xy'mox
    AddA(tmp[1042], a[15482]); -- Mythic: Dausegne
    AddA(tmp[1042], a[15483]); -- Mythic: Prototype Pantheon
    AddA(tmp[1042], a[15484]); -- Mythic: Lihuvim
    AddA(tmp[1042], a[15485]); -- Mythic: Halondrus
    AddA(tmp[1042], a[15486]); -- Mythic: Anduin Wrynn
    AddA(tmp[1042], a[15487]); -- Mythic: Lords of Dread
    AddA(tmp[1042], a[15488]); -- Mythic: Rygelon
    AddA(tmp[1042], a[15489]); -- Mythic: The Jailer
    tmp[380] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
    AddC(tmp[6], tmp[380]);
    AddA(tmp[380], a[14867]); -- Shadowlands Safari
    AddA(tmp[380], a[14625]); -- Battle in the Shadowlands
    AddA(tmp[380], a[14868]); -- Aquatic Apparitions
    AddA(tmp[380], a[14869]); -- Beast Busters
    AddA(tmp[380], a[14870]); -- Creepy Critters
    AddA(tmp[380], a[14871]); -- Deathly Dragonkin
    AddA(tmp[380], a[14872]); -- Eerie Elementals
    AddA(tmp[380], a[14873]); -- Flickering Fliers
    AddA(tmp[380], a[14874]); -- Haunted Humanoids
    AddA(tmp[380], a[14875]); -- Mummified Magics
    AddA(tmp[380], a[14876]); -- Macabre Mechanicals
    AddA(tmp[380], a[14877]); -- Unholy Undead
    AddA(tmp[380], a[14879]); -- Family Exorcist
    AddA(tmp[380], a[14881]); -- Abhorrent Adversaries of the Afterlife
    AddA(tmp[380], a[15004]); -- A Sly Fox
    tmp[424] = cat:New((addon.GetCategoryInfo(15440))); -- Torghast
    AddC(tmp[6], tmp[424]);
    AddA(tmp[424], a[14808]); -- Touring Torghast
    AddA(tmp[424], a[14809]); -- Traversing Torghast
    AddA(tmp[424], a[14810]); -- Terror of Torghast
    AddA(tmp[424], a[15091]); -- A Taste of Perfection
    AddA(tmp[424], a[15089]); -- Flawless Master (Layer 12)
    AddA(tmp[424], a[15322]); -- Flawless Master (Layer 16)
    AddA(tmp[424], a[14499]); -- Phanciful
    AddA(tmp[424], a[14500]); -- Phantastic
    AddA(tmp[424], a[14501]); -- Phanatical
    AddA(tmp[424], a[14498]); -- Gatekeepers of Torghast
    AddA(tmp[424], a[14773]); -- Explosive Extermination
    AddA(tmp[424], a[14776]); -- For the Hoarder!
    AddA(tmp[424], a[14778]); -- Extremely Ravenous
    AddA(tmp[424], a[14754]); -- The Forgotten One
    AddA(tmp[424], a[14755]); -- Legendary Accord
    AddA(tmp[424], a[14759]); -- It's Coming Back to Me...
    AddA(tmp[424], a[14760]); -- Recollection Collection
    AddA(tmp[424], a[14795]); -- Clearing the Fog
    AddA(tmp[424], a[15067]); -- Adamant Vaults
    AddA(tmp[424], a[15075]); -- Infiltrators
    AddA(tmp[424], a[15076]); -- The Box of Many Things
    AddA(tmp[424], a[15080]); -- So Blessed
    AddA(tmp[424], a[15079]); -- "Many, Many Things"
    AddA(tmp[424], a[15093]); -- Avenge Me!
    AddA(tmp[424], a[15095]); -- No Doubt
    AddA(tmp[424], a[15094]); -- Rampage
    AddA(tmp[424], a[15096]); -- Crowd Pleaser
    AddA(tmp[424], a[15092]); -- Master of Torment
    AddA(tmp[424], a[15324]); -- Tower Ranger
    tmp[843] = cat:New((select(2, addon.GetAchievementInfo(14463))), true); -- Skoldus Hall
    AddC(tmp[424], tmp[843]);
    AddA(tmp[843], a[14463]); -- Skoldus Hall
    AddA(tmp[843], a[15081]); -- Flawless: Skoldus Hall (Layer 12)
    AddA(tmp[843], a[15314]); -- Flawless: Skoldus Hall (Layer 16)
    tmp[844] = cat:New((select(2, addon.GetAchievementInfo(14473))), true); -- Fracture Chambers
    AddC(tmp[424], tmp[844]);
    AddA(tmp[844], a[14473]); -- Fracture Chambers
    AddA(tmp[844], a[15082]); -- Flawless: Fracture Chambers (Layer 12)
    AddA(tmp[844], a[15316]); -- Flawless: Fracture Chambers (Layer 16)
    tmp[845] = cat:New((select(2, addon.GetAchievementInfo(14478))), true); -- The Soulforges
    AddC(tmp[424], tmp[845]);
    AddA(tmp[845], a[14478]); -- The Soulforges
    AddA(tmp[845], a[15084]); -- Flawless: The Soulforges (Layer 12)
    AddA(tmp[845], a[15317]); -- Flawless: The Soulforges (Layer 16)
    tmp[846] = cat:New((select(2, addon.GetAchievementInfo(14483))), true); -- Coldheart Interstitia
    AddC(tmp[424], tmp[846]);
    AddA(tmp[846], a[14483]); -- Coldheart Interstitia
    AddA(tmp[846], a[15083]); -- Flawless: Coldheart Interstitia (Layer 12)
    AddA(tmp[846], a[15318]); -- Flawless: Coldheart Interstitia (Layer 16)
    tmp[847] = cat:New((select(2, addon.GetAchievementInfo(14488))), true); -- Mort'regar
    AddC(tmp[424], tmp[847]);
    AddA(tmp[847], a[14488]); -- Mort'regar
    AddA(tmp[847], a[15087]); -- Flawless: Mort'regar (Layer 12)
    AddA(tmp[847], a[15319]); -- Flawless: Mort'regar (Layer 16)
    tmp[848] = cat:New((select(2, addon.GetAchievementInfo(14493))), true); -- The Upper Reaches
    AddC(tmp[424], tmp[848]);
    AddA(tmp[848], a[14493]); -- The Upper Reaches
    AddA(tmp[848], a[15088]); -- Flawless: The Upper Reaches (Layer 12)
    AddA(tmp[848], a[15320]); -- Flawless: The Upper Reaches (Layer 16)
    tmp[1039] = cat:New(addon.L["Other wings"]); -- Other wings
    AddC(tmp[424], tmp[1039]);
    AddA(tmp[1039], a[14468]); -- Twisting Corridors: Layer 1
    AddA(tmp[1039], a[14469]); -- Twisting Corridors: Layer 2
    AddA(tmp[1039], a[14470]); -- Twisting Corridors: Layer 3
    AddA(tmp[1039], a[14471]); -- Twisting Corridors: Layer 4
    AddA(tmp[1039], a[14472]); -- Twisting Corridors: Layer 5
    AddA(tmp[1039], a[14568]); -- Twisting Corridors: Layer 6
    AddA(tmp[1039], a[14569]); -- Twisting Corridors: Layer 7
    AddA(tmp[1039], a[14570]); -- Twisting Corridors: Layer 8
    AddA(tmp[1039], a[15251]); -- The Jailer's Gauntlet: Layer 1
    AddA(tmp[1039], a[15252]); -- The Jailer's Gauntlet: Layer 2
    AddA(tmp[1039], a[15253]); -- The Jailer's Gauntlet: Layer 3
    AddA(tmp[1039], a[15254]); -- The Jailer's Gauntlet: Layer 4
    AddA(tmp[1039], a[15255]); -- The Jailer's Gauntlet: Layer 5
    AddA(tmp[1039], a[15256]); -- The Jailer's Gauntlet: Layer 6
    AddA(tmp[1039], a[15257]); -- The Jailer's Gauntlet: Layer 7
    AddA(tmp[1039], a[15258]); -- The Jailer's Gauntlet: Layer 8
    tmp[419] = cat:New((addon.GetCategoryInfo(15441))); -- Covenant Sanctums
    AddC(tmp[6], tmp[419]);
    AddA(tmp[419], a[14627]); -- Choosing Your Purpose
    AddA(tmp[419], a[14790]); -- Covenant Campaign
    AddA(tmp[419], a[15647]); -- Dead Men Tell Some Tales
    AddA(tmp[419], a[14834]); -- Bound with Purpose
    AddA(tmp[419], a[14835]); -- A Resolute Bond
    AddA(tmp[419], a[14836]); -- Unwavering Bond
    AddA(tmp[419], a[14837]); -- Nexus of Bonds
    AddA(tmp[419], a[14628]); -- The Road to Renown
    AddA(tmp[419], a[14629]); -- Gaining Respect
    AddA(tmp[419], a[14630]); -- Becoming a Hero
    AddA(tmp[419], a[14631]); -- Champion of the Covenant
    AddA(tmp[419], a[15241]); -- Renowned
    AddA(tmp[419], a[15646]); -- Re-Re-Re-Renowned
    AddA(tmp[419], a[14632]); -- Conducting Anima
    AddA(tmp[419], a[14633]); -- Master Navigator
    AddA(tmp[419], a[14636]); -- Adventurer in Chief
    AddA(tmp[419], a[14839]); -- Adventures: Off To Adventure
    AddA(tmp[419], a[14840]); -- Adventures: Learning the Ropes
    AddA(tmp[419], a[14841]); -- Adventures: Now You're Cooking
    AddA(tmp[419], a[14842]); -- Adventures: Strength and Resilience
    AddA(tmp[419], a[14843]); -- Adventures: Harmony of Purpose
    AddA(tmp[419], a[14844]); -- Adventures: Into the Breach
    AddA(tmp[419], a[14845]); -- Adventures: A Step in the Right Direction
    AddA(tmp[419], a[14846]); -- Adventures: Leaves in the Forest
    AddA(tmp[419], a[14847]); -- Adventures: Protector of the Shadowlands
    AddA(tmp[419], a[14637]); -- Your Covenant's Flavor
    AddA(tmp[419], a[14638]); -- The Anima Must Flow
    AddA(tmp[419], a[14639]); -- Dedication to the Restoration
    AddA(tmp[419], a[14777]); -- Restoration Expert
    AddA(tmp[419], a[15023]); -- We Can Rebuild
    AddA(tmp[419], a[15024]); -- Denying the Drought
    AddA(tmp[419], a[15025]); -- Sanctum Superior
    AddA(tmp[419], a[15649]); -- Shadowlands Dilettante
    tmp[423] = cat:New(addon.GetCovenantName(1)); -- Kyrian
    AddC(tmp[419], tmp[423]);
    AddA(tmp[423], a[14851]); -- Bastion of Protection
    AddA(tmp[423], a[14852]); -- The Hoot of the Issue
    AddA(tmp[423], a[14853]); -- All The Colors of the Painbow
    AddA(tmp[423], a[14854]); -- It's Not What You Wear
    AddA(tmp[423], a[14502]); -- Pursuing Loyalty
    AddA(tmp[423], a[14856]); -- "Charmed, I'm Sure"
    AddA(tmp[423], a[14857]); -- Itsy Bitsy Fighters
    AddA(tmp[423], a[14858]); -- Curse of Thirst
    AddA(tmp[423], a[14859]); -- Inside the Park Home Run
    AddA(tmp[423], a[14860]); -- Bare Necessities
    AddA(tmp[423], a[14861]); -- Learning from the Masters
    AddA(tmp[423], a[14862]); -- It's How You Wear It
    AddA(tmp[423], a[14863]); -- Death Foursworn
    AddA(tmp[423], a[14864]); -- Personal Nightmare
    AddA(tmp[423], a[14865]); -- Disciple of Humility
    AddA(tmp[423], a[14866]); -- Master of the Path
    AddA(tmp[423], a[14887]); -- To the Moon
    tmp[421] = cat:New(addon.GetCovenantName(2)); -- Venthyr
    AddC(tmp[419], tmp[421]);
    AddA(tmp[421], a[14678]); -- Court Favors
    AddA(tmp[421], a[14679]); -- Party Palace
    AddA(tmp[421], a[14680]); -- Something for Everyone
    AddA(tmp[421], a[14681]); -- Dredger Academy
    AddA(tmp[421], a[14682]); -- The Party Herald
    AddA(tmp[421], a[14683]); -- Dredger Style
    AddA(tmp[421], a[14723]); -- Be Our Guest
    AddA(tmp[421], a[14724]); -- People Pleaser
    AddA(tmp[421], a[14725]); -- We Happy Few
    AddA(tmp[421], a[14726]); -- It's Certainly Never Boring
    AddA(tmp[421], a[14727]); -- Master of Ceremonies
    AddA(tmp[421], a[14749]); -- Rendle's Big Day
    tmp[422] = cat:New(addon.GetCovenantName(3)); -- Night Fae
    AddC(tmp[419], tmp[422]);
    AddA(tmp[422], a[14670]); -- That's the Spirit
    AddA(tmp[422], a[14675]); -- Spirit Talker
    AddA(tmp[422], a[14676]); -- Divine Spirit Savior
    AddA(tmp[422], a[14677]); -- Spiritual Observations
    AddA(tmp[422], a[14775]); -- Mush Appreciated
    AddA(tmp[422], a[14780]); -- Meditation Master
    AddA(tmp[422], a[14789]); -- All Spirits Great and Small
    tmp[420] = cat:New(addon.GetCovenantName(4)); -- Necrolord
    AddC(tmp[419], tmp[420]);
    AddA(tmp[420], a[14684]); -- Abominable Lives
    AddA(tmp[420], a[14748]); -- Wardrobe Makeover
    AddA(tmp[420], a[14751]); -- The Gang's All Here
    AddA(tmp[420], a[14752]); -- Things To Do When You're Dead
    AddA(tmp[420], a[14753]); -- It's a Wrap
    AddA(tmp[420], a[14764]); -- The Great Luckydo
    AddA(tmp[420], a[14833]); -- Fashion Abomination
    AddA(tmp[420], a[14763]); -- Crypt Couture
    tmp[952] = cat:New(addon.L["Other"]); -- Other
    AddC(tmp[883], tmp[952]);
    tmp[1160] = cat:New(addon.L["Zones"]); -- Zones
    AddC(tmp[952], tmp[1160]);
    tmp[953] = cat:New((select(2, addon.GetAchievementInfo(14222)))); -- Exile's Reach
    AddC(tmp[1160], tmp[953]);
    AddA(tmp[953], a[14222]); -- Exile's Reach
    tmp[1168] = cat:New((addon.GetCategoryInfo(92))); -- Character
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
    tmp[1159] = cat:New((addon.GetCategoryInfo(96))); -- Quests
    AddC(tmp[952], tmp[1159]);
    AddA(tmp[1159], a[503]); -- 50 Quests Completed
    AddA(tmp[1159], a[504]); -- 100 Quests Completed
    AddA(tmp[1159], a[505]); -- 250 Quests Completed
    AddA(tmp[1159], a[506]); -- 500 Quests Completed
    AddA(tmp[1159], a[507]); -- 1000 Quests Completed
    AddA(tmp[1159], a[508]); -- 1500 Quests Completed
    AddA(tmp[1159], a[32]); -- 2000 Quests Completed
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
    tmp[1161] = cat:New((addon.GetCategoryInfo(97))); -- Exploration
    AddC(tmp[952], tmp[1161]);
    AddA(tmp[1161], a[964]); -- Going Down?
    AddA(tmp[1161], a[1244]); -- Well Read
    AddA(tmp[1161], a[1832]); -- Tastes Like Chicken
    AddA(tmp[1161], a[1833]); -- It's Happy Hour Somewhere
    tmp[1169] = cat:New((addon.GetCategoryInfo(168))); -- Dungeons & Raids
    AddC(tmp[952], tmp[1169]);
    AddA(tmp[1169], a[4476]); -- Looking For More
    AddA(tmp[1169], a[4478]); -- Looking For Multitudes
    tmp[1149] = cat:New((addon.GetCategoryInfo(169))); -- Professions
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
    tmp[1150] = cat:New((addon.GetCategoryInfo(14864))); -- Classic
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
    tmp[1151] = cat:New((addon.GetCategoryInfo(14865))); -- The Burning Crusade
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
    tmp[1152] = cat:New((addon.GetCategoryInfo(14866))); -- Wrath of the Lich King
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
    tmp[1153] = cat:New((addon.GetCategoryInfo(15072))); -- Cataclysm
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
    tmp[1154] = cat:New((addon.GetCategoryInfo(15164))); -- Mists of Pandaria
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
    tmp[1155] = cat:New((addon.GetCategoryInfo(15233))); -- Warlords of Dreanor
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
    tmp[1156] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
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
    tmp[1157] = cat:New((addon.GetCategoryInfo(15305))); -- Battle for Azeroth
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
    tmp[1158] = cat:New((addon.GetCategoryInfo(15439))); -- Shadowlands
    AddC(tmp[1149], tmp[1158]);
    AddA(tmp[1158], a[14328]); -- Professional Shadowlands Master
    AddA(tmp[1158], a[14329]); -- Working the Afterlife
    AddA(tmp[1158], a[14330]); -- Shadowlands Master of All
    AddA(tmp[1158], a[14332]); -- Shadowlands Cook
    AddA(tmp[1158], a[14333]); -- Shadowlands Fisherman
    tmp[1163] = cat:New((addon.GetCategoryInfo(201))); -- Reputation
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
    tmp[1170] = cat:New((addon.GetCategoryInfo(15117))); -- Pet Battles
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
    tmp[1171] = cat:New((addon.GetCategoryInfo(15246))); -- Collections
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
    tmp[1172] = cat:New((addon.GetCategoryInfo(81))); -- Feats of Strength
    AddC(tmp[952], tmp[1172]);
    AddA(tmp[1172], a[4496]); -- It's Over Nine Thousand!
    AddA(tmp[1172], a[3636]); -- Jade Tiger
    AddA(tmp[1172], a[3896]); -- Onyx Panther
    tmp[884] = cat:New(addon.L["Events"]); -- TAB - Events
    tmp[884].TabName = "Events";
    local events = tmp[884];
    tmp[1206] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[884], tmp[1206]);
    tmp[1206].AlwaysVisible = true;
    tmp[1206].IsSummary = true;
    tmp[918] = cat:New(addon.L["Holidays"]); -- Holidays
    AddC(tmp[884], tmp[918]);
    AddA(tmp[918], a[2144]); -- "What a Long, Strange Trip It's Been"
    tmp[885] = cat:New((addon.GetCategoryInfo(160))); -- Lunar Festival
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
    tmp[910] = cat:New((addon.GetCategoryInfo(187))); -- Love is in the Air
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
    tmp[911] = cat:New((addon.GetCategoryInfo(159))); -- Noblegarden
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
    tmp[912] = cat:New((addon.GetCategoryInfo(163))); -- Children's Week
    AddC(tmp[918], tmp[912]);
    AddA(tmp[912], a[1791]); -- Home Alone
    AddA(tmp[912], a[1788]); -- Bad Example
    AddA(tmp[912], a[1789]); -- Daily Chores
    AddA(tmp[912], a[1792]); -- "Aw, Isn't It Cute?"
    AddA(tmp[912], a[1786]); -- School of Hard Knocks
    AddA(tmp[912], a[1790]); -- "Hail To The King, Baby"
    AddA(tmp[912], a[275]); -- Veteran Nanny
    AddA(tmp[912], a[1793]); -- For the Children
    tmp[913] = cat:New((addon.GetCategoryInfo( 161))); -- Midsummer
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
    tmp[914] = cat:New((addon.GetCategoryInfo(162))); -- Brewfest
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
    tmp[915] = cat:New((addon.GetCategoryInfo(158))); -- Hallow's End
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
    tmp[916] = cat:New((addon.GetCategoryInfo(14981))); -- Pilgrim's Bounty
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
    tmp[917] = cat:New((addon.GetCategoryInfo(156))); -- Winter Veil
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
    tmp[925] = cat:New((addon.GetCategoryInfo(15101))); -- Darkmoon Faire
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
    tmp[1030] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[925], tmp[1030]);
    AddA(tmp[1030], a[2336]); -- Insane in the Membrane
    tmp[951] = cat:New((addon.GetCategoryInfo(15454))); -- Timewalking
    AddC(tmp[884], tmp[951]);
    AddA(tmp[951], a[13931]); -- "Memories of Fel, Frost and Fire"
    AddA(tmp[951], a[13928]); -- Alterac Valley of Olde
    AddA(tmp[951], a[13930]); -- Alterac Valley of Olde
    tmp[954] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
    AddC(tmp[951], tmp[954]);
    AddA(tmp[954], a[15309]); -- A Towering Success
    AddA(tmp[954], a[15310]); -- A Tour of Towers
    AddA(tmp[954], a[15308]); -- Tower Overwhelming
    tmp[947] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
    AddC(tmp[884], tmp[947]);
    tmp[948] = cat:New(addon.L["Legion Assaults"]); -- Legion Assaults
    AddC(tmp[947], tmp[948]);
    AddA(tmp[948], a[11544]); -- Defender of the Broken Isles
    tmp[932] = cat:New((addon.GetCategoryInfo(15305))); -- Battle for Azeroth
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
    tmp[926] = cat:New((addon.GetCategoryInfo(15439))); -- Shadowlands
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
    tmp[1209] = cat:New((addon.EJ_GetInstanceInfo(1190))); -- Castle Nathria
    AddC(tmp[1208], tmp[1209]);
    AddA(tmp[1209], a[15663]); -- Fate of Nathria
    AddA(tmp[1209], a[15664]); -- Heroic: Fate of Nathria
    AddA(tmp[1209], a[15665]); -- Mythic: Fate of Nathria
    AddA(tmp[1209], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[1209], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[1209], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[1210] = cat:New((addon.EJ_GetInstanceInfo(1193))); -- Sanctum of Domination
    AddC(tmp[1208], tmp[1210]);
    AddA(tmp[1210], a[15667]); -- Fate of Domination
    AddA(tmp[1210], a[15668]); -- Heroic: Fate of Domination
    AddA(tmp[1210], a[15669]); -- Mythic: Fate of Domination
    AddA(tmp[1210], a[15684]); -- Fates of the Shadowlands Raids
    AddA(tmp[1210], a[15685]); -- Heroic: Fates of the Shadowlands Raids
    AddA(tmp[1210], a[15687]); -- Mythic: Fates of the Shadowlands Raids
    tmp[1211] = cat:New((addon.EJ_GetInstanceInfo(1195))); -- Sepulcher of the First Ones
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
    tmp[955] = cat:New((addon.GetCategoryInfo(95))); -- TAB - PvP
    tmp[955].TabName = "PvP";
    local pvp = tmp[955];
    tmp[1205] = cat:New(addon.L["Summary"]); -- Summary
    AddC(tmp[955], tmp[1205]);
    tmp[1205].AlwaysVisible = true;
    tmp[1205].IsSummary = true;
    tmp[1162] = cat:New((addon.GetCategoryInfo(95))); -- Player vs. Player
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
    tmp[1167] = cat:New((addon.GetCategoryInfo(15266))); -- Honor
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
    tmp[1165] = cat:New((addon.GetCategoryInfo(153))); -- Battlegrounds
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
    tmp[960] = cat:New((addon.GetCategoryInfo(14801))); -- Alterac Valley
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
    tmp[956] = cat:New((addon.GetCategoryInfo(14802))); -- Arathi Basin
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
    tmp[961] = cat:New((addon.GetCategoryInfo(15414))); -- Ashran
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
    tmp[964] = cat:New((addon.GetCategoryInfo(15073))); -- Battle for Gilneas
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
    tmp[957] = cat:New((addon.GetCategoryInfo(15218))); -- Deepwind Gorge
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
    tmp[959] = cat:New((addon.GetCategoryInfo(14803))); -- Eye of the Storm
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
    tmp[962] = cat:New((addon.GetCategoryInfo(15003))); -- Isle of Conquest
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
    tmp[968] = cat:New((addon.GetCategoryInfo(15292))); -- Seething Shore
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
    tmp[966] = cat:New((addon.GetCategoryInfo(15162))); -- Silvershard Mines
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
    tmp[973] = cat:New(addon.L["Strand of the Ancients"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Strand of the Ancients
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
    tmp[967] = cat:New((addon.GetCategoryInfo(15163))); -- Temple of Kotmogu
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
    tmp[965] = cat:New((addon.GetCategoryInfo(15074))); -- Twin Peaks
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
    tmp[958] = cat:New((addon.GetCategoryInfo(14804))); -- Warsong Gulch
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
    tmp[963] = cat:New((addon.GetCategoryInfo(14901))); -- Wintergrasp
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
    tmp[1032] = cat:New(addon.L["Southshore vs. Tarren Mill"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Southshore vs. Tarren Mill
    AddC(tmp[1165], tmp[1032]);
    AddA(tmp[1032], a[9729]); -- Victory in Hillsbrad
    AddA(tmp[1032], a[9566]); -- Victory in Hillsbrad
    tmp[1166] = cat:New((addon.GetCategoryInfo(165))); -- Arena
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
    tmp[1131] = cat:New((addon.GetCategoryInfo(14864))); -- Classic
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
    tmp[1199] = cat:New((addon.GetCategoryInfo(14865))); -- The Burning Crusade
    AddC(tmp[955], tmp[1199]);
    AddA(tmp[1199], a[418]); -- Merciless Gladiator
    AddA(tmp[1199], a[419]); -- Vengeful Gladiator
    AddA(tmp[1199], a[420]); -- Brutal Gladiator
    tmp[1200] = cat:New((addon.GetCategoryInfo(14866))); -- Wrath of the Lich King
    AddC(tmp[955], tmp[1200]);
    AddA(tmp[1200], a[3336]); -- Deadly Gladiator
    AddA(tmp[1200], a[3436]); -- Furious Gladiator
    AddA(tmp[1200], a[3758]); -- Relentless Gladiator
    AddA(tmp[1200], a[4599]); -- Wrathful Gladiator
    tmp[1197] = cat:New((addon.GetCategoryInfo(15072))); -- Cataclysm
    AddC(tmp[955], tmp[1197]);
    AddA(tmp[1197], a[6002]); -- Vicious Gladiator
    AddA(tmp[1197], a[5344]); -- Hero of the Alliance: Vicious
    AddA(tmp[1197], a[5358]); -- Hero of the Horde: Vicious
    AddA(tmp[1197], a[6124]); -- Ruthless Gladiator
    AddA(tmp[1197], a[6316]); -- Hero of the Alliance: Ruthless
    AddA(tmp[1197], a[6317]); -- Hero of the Horde: Ruthless
    AddA(tmp[1197], a[6938]); -- Cataclysmic Gladiator
    AddA(tmp[1197], a[6939]); -- Hero of the Alliance: Cataclysmic
    AddA(tmp[1197], a[6940]); -- Hero of the Horde: Cataclysmic
    tmp[1198] = cat:New((addon.GetCategoryInfo(15164))); -- Mists of Pandaria
    AddC(tmp[955], tmp[1198]);
    AddA(tmp[1198], a[8214]); -- Malevolent Gladiator
    AddA(tmp[1198], a[8243]); -- Hero of the Alliance: Malevolent
    AddA(tmp[1198], a[8244]); -- Hero of the Horde: Malevolent
    AddA(tmp[1198], a[8791]); -- Tyrannical Gladiator
    AddA(tmp[1198], a[8652]); -- Hero of the Alliance: Tyrannical
    AddA(tmp[1198], a[8653]); -- Hero of the Horde: Tyrannical
    AddA(tmp[1198], a[8218]); -- Tyrannical Conquest
    AddA(tmp[1198], a[8093]); -- Tyrannical Conquest
    AddA(tmp[1198], a[8649]); -- Challenger: Season 14
    AddA(tmp[1198], a[8646]); -- Rival: Season 14
    AddA(tmp[1198], a[8645]); -- Duelist: Season 14
    AddA(tmp[1198], a[8644]); -- Gladiator: Season 14
    AddA(tmp[1198], a[8643]); -- Grievous Gladiator: Season 14
    AddA(tmp[1198], a[8654]); -- Hero of the Alliance: Grievous
    AddA(tmp[1198], a[8657]); -- Hero of the Horde: Grievous
    AddA(tmp[1198], a[8485]); -- Grievous Combatant
    AddA(tmp[1198], a[8484]); -- Grievous Combatant
    AddA(tmp[1198], a[8382]); -- Grievous Conquest
    AddA(tmp[1198], a[8381]); -- Grievous Conquest
    AddA(tmp[1198], a[8670]); -- Challenger: Season 15
    AddA(tmp[1198], a[8669]); -- Rival: Season 15
    AddA(tmp[1198], a[8668]); -- Duelist: Season 15
    AddA(tmp[1198], a[8667]); -- Gladiator: Season 15
    AddA(tmp[1198], a[8666]); -- Prideful Gladiator: Season 15
    AddA(tmp[1198], a[8658]); -- Hero of the Alliance: Prideful
    AddA(tmp[1198], a[8659]); -- Hero of the Horde: Prideful
    AddA(tmp[1198], a[8642]); -- Prideful Combatant
    AddA(tmp[1198], a[8641]); -- Prideful Combatant
    AddA(tmp[1198], a[8451]); -- Prideful Conquest
    AddA(tmp[1198], a[8450]); -- Prideful Conquest
    tmp[1175] = cat:New((addon.GetCategoryInfo(15233))); -- Warlords of Dreanor
    AddC(tmp[955], tmp[1175]);
    tmp[1177] = cat:New(addon.L["Season"] .. " " .. 1); -- Season 1
    AddC(tmp[1175], tmp[1177]);
    AddA(tmp[1177], a[9242]); -- Challenger: Warlords Season 1
    AddA(tmp[1177], a[9241]); -- Rival: Warlords Season 1
    AddA(tmp[1177], a[9240]); -- Duelist: Warlords Season 1
    AddA(tmp[1177], a[9239]); -- Gladiator: Warlords Season 1
    AddA(tmp[1177], a[9232]); -- Primal Gladiator: Warlords Season 1
    AddA(tmp[1177], a[9995]); -- Soldier of the Alliance: Warlords Season 1
    AddA(tmp[1177], a[9998]); -- Soldier of the Horde: Warlords Season 1
    AddA(tmp[1177], a[9996]); -- Defender of the Alliance: Warlords Season 1
    AddA(tmp[1177], a[10001]); -- Defender of the Horde: Warlords Season 1
    AddA(tmp[1177], a[9997]); -- Guardian of the Alliance: Warlords Season 1
    AddA(tmp[1177], a[10000]); -- Guardian of the Horde: Warlords Season 1
    AddA(tmp[1177], a[9230]); -- Hero of the Alliance: Primal
    AddA(tmp[1177], a[9231]); -- Hero of the Horde: Primal
    AddA(tmp[1177], a[9238]); -- Primal Combatant
    AddA(tmp[1177], a[9236]); -- Primal Combatant
    AddA(tmp[1177], a[9234]); -- Primal Conquest
    AddA(tmp[1177], a[9233]); -- Primal Conquest
    tmp[1178] = cat:New(addon.L["Season"] .. " " .. 2); -- Season 2
    AddC(tmp[1175], tmp[1178]);
    AddA(tmp[1178], a[10101]); -- Challenger: Warlords Season 2
    AddA(tmp[1178], a[10100]); -- Rival: Warlords Season 2
    AddA(tmp[1178], a[10099]); -- Duelist: Warlords Season 2
    AddA(tmp[1178], a[10098]); -- Gladiator: Warlords Season 2
    AddA(tmp[1178], a[10096]); -- Wild Gladiator: Warlords Season 2
    AddA(tmp[1178], a[10104]); -- Soldier of the Alliance: Warlords Season 2
    AddA(tmp[1178], a[10105]); -- Soldier of the Horde: Warlords Season 2
    AddA(tmp[1178], a[10106]); -- Defender of the Alliance: Warlords Season 2
    AddA(tmp[1178], a[10107]); -- Defender of the Horde: Warlords Season 2
    AddA(tmp[1178], a[10108]); -- Guardian of the Alliance: Warlords Season 2
    AddA(tmp[1178], a[10109]); -- Guardian of the Horde: Warlords Season 2
    AddA(tmp[1178], a[10102]); -- Hero of the Alliance: Wild
    AddA(tmp[1178], a[10103]); -- Hero of the Horde: Wild
    AddA(tmp[1178], a[10093]); -- Wild Combatant
    AddA(tmp[1178], a[10092]); -- Wild Combatant
    AddA(tmp[1178], a[10089]); -- Wild Conquest
    AddA(tmp[1178], a[10088]); -- Wild Conquest
    tmp[1179] = cat:New(addon.L["Season"] .. " " .. 3); -- Season 3
    AddC(tmp[1175], tmp[1179]);
    AddA(tmp[1179], a[10113]); -- Challenger: Warlords Season 3
    AddA(tmp[1179], a[10112]); -- Rival: Warlords Season 3
    AddA(tmp[1179], a[10111]); -- Duelist: Warlords Season 3
    AddA(tmp[1179], a[10110]); -- Gladiator: Warlords Season 3
    AddA(tmp[1179], a[10097]); -- Warmongering Gladiator: Warlords Season 3
    AddA(tmp[1179], a[10120]); -- Soldier of the Alliance: Warlords Season 3
    AddA(tmp[1179], a[10121]); -- Soldier of the Horde: Warlords Season 3
    AddA(tmp[1179], a[10118]); -- Defender of the Alliance: Warlords Season 3
    AddA(tmp[1179], a[10119]); -- Defender of the Horde: Warlords Season 3
    AddA(tmp[1179], a[10116]); -- Guardian of the Alliance: Warlords Season 3
    AddA(tmp[1179], a[10117]); -- Guardian of the Horde: Warlords Season 3
    AddA(tmp[1179], a[10114]); -- Hero of the Alliance: Warmongering
    AddA(tmp[1179], a[10115]); -- Hero of the Horde: Warmongering
    AddA(tmp[1179], a[10095]); -- Warmongering Combatant
    AddA(tmp[1179], a[10094]); -- Warmongering Combatant
    AddA(tmp[1179], a[10091]); -- Warmongering Conquest
    AddA(tmp[1179], a[10090]); -- Warmongering Conquest
    tmp[1180] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
    AddC(tmp[955], tmp[1180]);
    AddA(tmp[1180], a[10991]); -- First Step into a Larger World
    AddA(tmp[1180], a[10992]); -- Here We Go Again
    AddA(tmp[1180], a[10993]); -- Third Time's the Charm
    AddA(tmp[1180], a[10995]); -- For Prestige
    AddA(tmp[1180], a[11468]); -- Alive for Five
    AddA(tmp[1180], a[11469]); -- The River Six
    AddA(tmp[1180], a[11470]); -- Slayin' to Seven
    AddA(tmp[1180], a[11471]); -- "Don't Hate, Grind to Eight"
    AddA(tmp[1180], a[11472]); -- "Hell, It's About Nine"
    AddA(tmp[1180], a[11685]); -- Decade of Dominance
    AddA(tmp[1180], a[11686]); -- These Go To Eleven
    AddA(tmp[1180], a[11687]); -- Demonic Dozen
    AddA(tmp[1180], a[11688]); -- Floor Thirteen
    AddA(tmp[1180], a[11689]); -- Fourteen for the Team
    AddA(tmp[1180], a[11690]); -- When You're Fifteen
    AddA(tmp[1180], a[11691]); -- You Are Sixteen
    AddA(tmp[1180], a[11692]); -- Going On Seventeen
    AddA(tmp[1180], a[11693]); -- Eighteen and Over
    AddA(tmp[1180], a[11694]); -- "Hell, It's About Nineteen"
    AddA(tmp[1180], a[12108]); -- Double Decade of Dominance
    AddA(tmp[1180], a[12109]); -- Twenty-One Arms Salute
    AddA(tmp[1180], a[12180]); -- Catching Twenty-Two
    AddA(tmp[1180], a[12181]); -- Protocol 2.3
    AddA(tmp[1180], a[12182]); -- Demonic Double Dozen
    AddA(tmp[1180], a[12183]); -- Prestige Quartermaster
    AddA(tmp[1180], a[10743]); -- The Prestige
    AddA(tmp[1180], a[10745]); -- The Prestige
    AddA(tmp[1180], a[11165]); -- Crest of Heroism
    AddA(tmp[1180], a[11166]); -- Crest of Heroism
    AddA(tmp[1180], a[11167]); -- Crest of Carnage
    AddA(tmp[1180], a[11168]); -- Crest of Carnage
    AddA(tmp[1180], a[11169]); -- Crest of Devastation
    AddA(tmp[1180], a[11170]); -- Crest of Devastation
    tmp[1176] = cat:New(addon.L["Season"] .. " " .. 1); -- Season 1
    AddC(tmp[1180], tmp[1176]);
    AddA(tmp[1176], a[11017]); -- Challenger: Legion Season 1
    AddA(tmp[1176], a[11016]); -- Rival: Legion Season 1
    AddA(tmp[1176], a[11015]); -- Duelist: Legion Season 1
    AddA(tmp[1176], a[11011]); -- Gladiator: Legion Season 1
    AddA(tmp[1176], a[11012]); -- Vindictive Gladiator: Legion Season 1
    AddA(tmp[1176], a[11024]); -- Soldier of the Alliance: Legion Season 1
    AddA(tmp[1176], a[11025]); -- Soldier of the Horde: Legion Season 1
    AddA(tmp[1176], a[11022]); -- Defender of the Alliance: Legion Season 1
    AddA(tmp[1176], a[11023]); -- Defender of the Horde: Legion Season 1
    AddA(tmp[1176], a[11020]); -- Guardian of the Alliance: Legion Season 1
    AddA(tmp[1176], a[11021]); -- Guardian of the Horde: Legion Season 1
    AddA(tmp[1176], a[11018]); -- Hero of the Alliance: Vindictive
    AddA(tmp[1176], a[11019]); -- Hero of the Horde: Vindictive
    AddA(tmp[1176], a[10998]); -- Vindictive Combatant
    AddA(tmp[1176], a[10997]); -- Vindictive Combatant
    AddA(tmp[1176], a[11578]); -- Vindictive Elite
    tmp[1181] = cat:New(addon.L["Season"] .. " " .. 2); -- Season 2
    AddC(tmp[1180], tmp[1181]);
    AddA(tmp[1181], a[11028]); -- Challenger: Legion Season 2
    AddA(tmp[1181], a[11027]); -- Rival: Legion Season 2
    AddA(tmp[1181], a[11026]); -- Duelist: Legion Season 2
    AddA(tmp[1181], a[11013]); -- Gladiator: Legion Season 2
    AddA(tmp[1181], a[11014]); -- Fearless Gladiator: Legion Season 2
    AddA(tmp[1181], a[11036]); -- Soldier of the Alliance: Legion Season 2
    AddA(tmp[1181], a[11035]); -- Soldier of the Horde: Legion Season 2
    AddA(tmp[1181], a[11034]); -- Defender of the Alliance: Legion Season 2
    AddA(tmp[1181], a[11033]); -- Defender of the Horde: Legion Season 2
    AddA(tmp[1181], a[11032]); -- Guardian of the Alliance: Legion Season 2
    AddA(tmp[1181], a[11031]); -- Guardian of the Horde: Legion Season 2
    AddA(tmp[1181], a[11030]); -- Hero of the Alliance: Fearless
    AddA(tmp[1181], a[11029]); -- Hero of the Horde: Fearless
    AddA(tmp[1181], a[11004]); -- Fearless Combatant
    AddA(tmp[1181], a[11003]); -- Fearless Combatant
    AddA(tmp[1181], a[11579]); -- Fearless Elite
    tmp[1182] = cat:New(addon.L["Season"] .. " " .. 3); -- Season 3
    AddC(tmp[1180], tmp[1182]);
    AddA(tmp[1182], a[11039]); -- Challenger: Legion Season 3
    AddA(tmp[1182], a[11040]); -- Rival: Legion Season 3
    AddA(tmp[1182], a[11041]); -- Duelist: Legion Season 3
    AddA(tmp[1182], a[11038]); -- Gladiator: Legion Season 3
    AddA(tmp[1182], a[11037]); -- Cruel Gladiator: Legion Season 3
    AddA(tmp[1182], a[11049]); -- Soldier of the Alliance: Legion Season 3
    AddA(tmp[1182], a[11048]); -- Soldier of the Horde: Legion Season 3
    AddA(tmp[1182], a[11045]); -- Defender of the Alliance: Legion Season 3
    AddA(tmp[1182], a[11044]); -- Defender of the Horde: Legion Season 3
    AddA(tmp[1182], a[11047]); -- Guardian of the Alliance: Legion Season 3
    AddA(tmp[1182], a[11046]); -- Guardian of the Horde: Legion Season 3
    AddA(tmp[1182], a[11043]); -- Hero of the Alliance: Cruel
    AddA(tmp[1182], a[11042]); -- Hero of the Horde: Cruel
    AddA(tmp[1182], a[11008]); -- Cruel Combatant
    AddA(tmp[1182], a[11005]); -- Cruel Combatant
    AddA(tmp[1182], a[11697]); -- Cruel Elite
    tmp[1183] = cat:New(addon.L["Season"] .. " " .. 4); -- Season 4
    AddC(tmp[1180], tmp[1183]);
    AddA(tmp[1183], a[11060]); -- Challenger: Legion Season 4
    AddA(tmp[1183], a[11059]); -- Rival: Legion Season 4
    AddA(tmp[1183], a[11058]); -- Duelist: Legion Season 4
    AddA(tmp[1183], a[11061]); -- Gladiator: Legion Season 4
    AddA(tmp[1183], a[11062]); -- Ferocious Gladiator: Legion Season 4
    AddA(tmp[1183], a[11050]); -- Soldier of the Alliance: Legion Season 4
    AddA(tmp[1183], a[11051]); -- Soldier of the Horde: Legion Season 4
    AddA(tmp[1183], a[11054]); -- Defender of the Alliance: Legion Season 4
    AddA(tmp[1183], a[11055]); -- Defender of the Horde: Legion Season 4
    AddA(tmp[1183], a[11052]); -- Guardian of the Alliance: Legion Season 4
    AddA(tmp[1183], a[11053]); -- Guardian of the Horde: Legion Season 4
    AddA(tmp[1183], a[11056]); -- Hero of the Alliance: Ferocious
    AddA(tmp[1183], a[11057]); -- Hero of the Horde: Ferocious
    AddA(tmp[1183], a[11010]); -- Ferocious Combatant
    AddA(tmp[1183], a[11009]); -- Ferocious Combatant
    AddA(tmp[1183], a[11698]); -- Ferocious Elite
    tmp[1184] = cat:New(addon.L["Season"] .. " " .. 5); -- Season 5
    AddC(tmp[1180], tmp[1184]);
    AddA(tmp[1184], a[12036]); -- Challenger: Legion Season 5
    AddA(tmp[1184], a[12035]); -- Rival: Legion Season 5
    AddA(tmp[1184], a[12034]); -- Duelist: Legion Season 5
    AddA(tmp[1184], a[12045]); -- Gladiator: Legion Season 5
    AddA(tmp[1184], a[12010]); -- Fierce Gladiator: Legion Season 5
    AddA(tmp[1184], a[12040]); -- Soldier of the Alliance: Legion Season 5
    AddA(tmp[1184], a[12044]); -- Soldier of the Horde: Legion Season 5
    AddA(tmp[1184], a[12039]); -- Defender of the Alliance: Legion Season 5
    AddA(tmp[1184], a[12043]); -- Defender of the Horde: Legion Season 5
    AddA(tmp[1184], a[12038]); -- Guardian of the Alliance: Legion Season 5
    AddA(tmp[1184], a[12042]); -- Guardian of the Horde: Legion Season 5
    AddA(tmp[1184], a[12037]); -- Hero of the Alliance: Fierce
    AddA(tmp[1184], a[12041]); -- Hero of the Horde: Fierce
    AddA(tmp[1184], a[12032]); -- Fierce Combatant
    AddA(tmp[1184], a[12031]); -- Fierce Combatant
    AddA(tmp[1184], a[12090]); -- Fierce Elite
    tmp[1185] = cat:New(addon.L["Season"] .. " " .. 6); -- Season 6
    AddC(tmp[1180], tmp[1185]);
    AddA(tmp[1185], a[12169]); -- Challenger: Legion Season 6
    AddA(tmp[1185], a[12170]); -- Rival: Legion Season 6
    AddA(tmp[1185], a[12171]); -- Duelist: Legion Season 6
    AddA(tmp[1185], a[12167]); -- Gladiator: Legion Season 6
    AddA(tmp[1185], a[12134]); -- Dominant Gladiator: Legion Season 6
    AddA(tmp[1185], a[12179]); -- Soldier of the Alliance: Legion Season 6
    AddA(tmp[1185], a[12178]); -- Soldier of the Horde: Legion Season 6
    AddA(tmp[1185], a[12175]); -- Defender of the Alliance: Legion Season 6
    AddA(tmp[1185], a[12174]); -- Defender of the Horde: Legion Season 6
    AddA(tmp[1185], a[12177]); -- Guardian of the Alliance: Legion Season 6
    AddA(tmp[1185], a[12176]); -- Guardian of the Horde: Legion Season 6
    AddA(tmp[1185], a[12173]); -- Hero of the Alliance: Dominant
    AddA(tmp[1185], a[12172]); -- Hero of the Horde: Dominant
    AddA(tmp[1185], a[12137]); -- Dominant Combatant
    AddA(tmp[1185], a[12136]); -- Dominant Combatant
    AddA(tmp[1185], a[12135]); -- Dominant Elite
    tmp[1186] = cat:New(addon.L["Season"] .. " " .. 7); -- Season 7
    AddC(tmp[1180], tmp[1186]);
    AddA(tmp[1186], a[12187]); -- Challenger: Legion Season 7
    AddA(tmp[1186], a[12188]); -- Rival: Legion Season 7
    AddA(tmp[1186], a[12186]); -- Duelist: Legion Season 7
    AddA(tmp[1186], a[12168]); -- Gladiator: Legion Season 7
    AddA(tmp[1186], a[12185]); -- Demonic Gladiator: Legion Season 7
    AddA(tmp[1186], a[12189]); -- Soldier of the Alliance: Legion Season 7
    AddA(tmp[1186], a[12190]); -- Soldier of the Horde: Legion Season 7
    AddA(tmp[1186], a[12195]); -- Defender of the Alliance: Legion Season 7
    AddA(tmp[1186], a[12194]); -- Defender of the Horde: Legion Season 7
    AddA(tmp[1186], a[12191]); -- Guardian of the Alliance: Legion Season 7
    AddA(tmp[1186], a[12192]); -- Guardian of the Horde: Legion Season 7
    AddA(tmp[1186], a[12197]); -- Hero of the Alliance: Demonic
    AddA(tmp[1186], a[12196]); -- Hero of the Horde: Demonic
    AddA(tmp[1186], a[12200]); -- Demonic Combatant
    AddA(tmp[1186], a[12199]); -- Demonic Combatant
    AddA(tmp[1186], a[12198]); -- Demonic Elite
    tmp[1192] = cat:New((addon.GetCategoryInfo(15305))); -- Battle for Azeroth
    AddC(tmp[955], tmp[1192]);
    tmp[1193] = cat:New(addon.L["Season"] .. " " .. 1); -- Season 1
    AddC(tmp[1192], tmp[1193]);
    AddA(tmp[1193], a[13199]); -- Combatant: Battle for Azeroth Season 1
    AddA(tmp[1193], a[12959]); -- Challenger: Battle for Azeroth Season 1
    AddA(tmp[1193], a[12960]); -- Rival: Battle for Azeroth Season 1
    AddA(tmp[1193], a[12962]); -- Duelist: Battle for Azeroth Season 1
    AddA(tmp[1193], a[13465]); -- Elite: Battle for Azeroth Season 1
    AddA(tmp[1193], a[12945]); -- Dread Gladiator: Battle for Azeroth Season 1
    AddA(tmp[1193], a[12963]); -- Hero of the Alliance: Dread
    AddA(tmp[1193], a[12964]); -- Hero of the Horde: Dread
    tmp[1194] = cat:New(addon.L["Season"] .. " " .. 2); -- Season 2
    AddC(tmp[1192], tmp[1194]);
    AddA(tmp[1194], a[13204]); -- Combatant: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13203]); -- Challenger: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13205]); -- Rival: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13209]); -- Duelist: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13451]); -- Elite: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13200]); -- Sinister Gladiator: Battle for Azeroth Season 2
    AddA(tmp[1194], a[13210]); -- Hero of the Alliance: Sinister
    AddA(tmp[1194], a[13211]); -- Hero of the Horde: Sinister
    tmp[1195] = cat:New(addon.L["Season"] .. " " .. 3); -- Season 3
    AddC(tmp[1192], tmp[1195]);
    AddA(tmp[1195], a[13639]); -- Combatant: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13634]); -- Challenger: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13641]); -- Rival: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13642]); -- Duelist: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13676]); -- Elite: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13630]); -- Notorious Gladiator: Battle for Azeroth Season 3
    AddA(tmp[1195], a[13643]); -- Hero of the Alliance: Notorious
    AddA(tmp[1195], a[13644]); -- Hero of the Horde: Notorious
    tmp[1196] = cat:New(addon.L["Season"] .. " " .. 4); -- Season 4
    AddC(tmp[1192], tmp[1196]);
    AddA(tmp[1196], a[13962]); -- Combatant: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13959]); -- Challenger: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13963]); -- Rival: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13964]); -- Duelist: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13989]); -- Elite: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13957]); -- Corrupted Gladiator: Battle for Azeroth Season 4
    AddA(tmp[1196], a[13966]); -- Hero of the Alliance: Corrupted
    AddA(tmp[1196], a[13965]); -- Hero of the Horde: Corrupted
    tmp[1187] = cat:New((addon.GetCategoryInfo(15439))); -- Shadowlands
    AddC(tmp[955], tmp[1187]);
    tmp[1188] = cat:New(addon.L["Season"] .. " " .. 1); -- Season 1
    AddC(tmp[1187], tmp[1188]);
    AddA(tmp[1188], a[14685]); -- Combatant: Shadowlands Season 1
    AddA(tmp[1188], a[14686]); -- Challenger: Shadowlands Season 1
    AddA(tmp[1188], a[14687]); -- Rival: Shadowlands Season 1
    AddA(tmp[1188], a[14688]); -- Duelist: Shadowlands Season 1
    AddA(tmp[1188], a[14691]); -- Elite: Shadowlands Season 1
    AddA(tmp[1188], a[14690]); -- Sinful Gladiator: Shadowlands Season 1
    AddA(tmp[1188], a[14692]); -- Hero of the Alliance: Sinful
    AddA(tmp[1188], a[14693]); -- Hero of the Horde: Sinful
    tmp[1189] = cat:New(addon.L["Season"] .. " " .. 2); -- Season 2
    AddC(tmp[1187], tmp[1189]);
    AddA(tmp[1189], a[14968]); -- Combatant I: Shadowlands Season 2
    AddA(tmp[1189], a[15232]); -- Combatant II: Shadowlands Season 2
    AddA(tmp[1189], a[14969]); -- Challenger I: Shadowlands Season 2
    AddA(tmp[1189], a[15233]); -- Challenger II: Shadowlands Season 2
    AddA(tmp[1189], a[14970]); -- Rival I: Shadowlands Season 2
    AddA(tmp[1189], a[15234]); -- Rival II: Shadowlands Season 2
    AddA(tmp[1189], a[14971]); -- Duelist: Shadowlands Season 2
    AddA(tmp[1189], a[14974]); -- Elite: Shadowlands Season 2
    AddA(tmp[1189], a[14973]); -- Unchained Gladiator: Shadowlands Season 2
    AddA(tmp[1189], a[14976]); -- Hero of the Horde: Unchained
    AddA(tmp[1189], a[14975]); -- Hero of the Alliance: Unchained
    tmp[1190] = cat:New(addon.L["Season"] .. " " .. 3); -- Season 3
    AddC(tmp[1187], tmp[1190]);
    AddA(tmp[1190], a[15348]); -- Combatant I: Shadowlands Season 3
    AddA(tmp[1190], a[15380]); -- Combatant II: Shadowlands Season 3
    AddA(tmp[1190], a[15349]); -- Challenger I: Shadowlands Season 3
    AddA(tmp[1190], a[15379]); -- Challenger II: Shadowlands Season 3
    AddA(tmp[1190], a[15350]); -- Rival I: Shadowlands Season 3
    AddA(tmp[1190], a[15378]); -- Rival II: Shadowlands Season 3
    AddA(tmp[1190], a[15351]); -- Duelist: Shadowlands Season 3
    AddA(tmp[1190], a[15354]); -- Elite: Shadowlands Season 3
    AddA(tmp[1190], a[15353]); -- Cosmic Gladiator: Shadowlands Season 3
    AddA(tmp[1190], a[15355]); -- Hero of the Alliance: Cosmic
    AddA(tmp[1190], a[15356]); -- Hero of the Horde: Cosmic
    tmp[1191] = cat:New(addon.L["Season"] .. " " .. 4); -- Season 4
    AddC(tmp[1187], tmp[1191]);
    AddA(tmp[1191], a[15609]); -- Combatant I: Shadowlands Season 4
    AddA(tmp[1191], a[15610]); -- Combatant II: Shadowlands Season 4
    AddA(tmp[1191], a[15600]); -- Challenger I: Shadowlands Season 4
    AddA(tmp[1191], a[15601]); -- Challenger II: Shadowlands Season 4
    AddA(tmp[1191], a[15602]); -- Rival I: Shadowlands Season 4
    AddA(tmp[1191], a[15603]); -- Rival II: Shadowlands Season 4
    AddA(tmp[1191], a[15604]); -- Duelist: Shadowlands Season 4
    AddA(tmp[1191], a[15639]); -- Elite: Shadowlands Season 4
    AddA(tmp[1191], a[15606]); -- Eternal Gladiator: Shadowlands Season 4
    AddA(tmp[1191], a[15608]); -- Hero of the Alliance: Eternal
    AddA(tmp[1191], a[15607]); -- Hero of the Horde: Eternal
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
    local focusedCategory = tmp[949];
    tmp[433] = cat:New(addon.L["Current Zone"]); -- Current Zone
    AddC(tmp[971], tmp[433]);
    tmp[433].AlwaysVisible = true;
    tmp[433].HasFlexibleData = true;
    local currentZoneCategory = tmp[433];
    tmp[850] = cat:New(addon.L["Selected Zone"]); -- Selected Zone
    AddC(tmp[971], tmp[850]);
    tmp[850].HasFlexibleData = true;
    local selectedZoneCategory = tmp[850];
    tmp[972] = cat:New(addon.L["Bur's Mount Collection"]); -- Bur's Mount Collection
    AddC(tmp[971], tmp[972]);
    AddA(tmp[972], a[3356]); -- Winterspring Frostsaber
    AddA(tmp[972], a[3357]); -- Venomhide Ravasaur
    AddA(tmp[972], a[12866]); -- 100 Exalted Reputations
    tmp[976] = cat:New((addon.GetCategoryInfo(15246))); -- Collections
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
    tmp[986] = cat:New((addon.GetCategoryInfo(169))); -- Professions
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
    tmp[979] = cat:New((addon.GetCategoryInfo(15272))); -- Dungeons
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
    tmp[982] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
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
    AddA(tmp[981], a[11763]); -- Glory of the Tomb Raider
    AddA(tmp[981], a[11987]); -- Glory of the Argus Raider
    AddA(tmp[981], a[12806]); -- Glory of the Uldir Raider
    AddA(tmp[981], a[13315]); -- Glory of the Dazar'alor Raider
    AddA(tmp[981], a[13687]); -- Glory of the Eternal Raider
    AddA(tmp[981], a[14146]); -- Glory of the Ny'alotha Raider
    AddA(tmp[981], a[14355]); -- Glory of the Nathria Raider
    AddA(tmp[981], a[15130]); -- Glory of the Dominant Raider
    AddA(tmp[981], a[15491]); -- Glory of the Sepulcher Raider
    tmp[977] = cat:New((addon.GetCategoryInfo(95))); -- PvP
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
    tmp[988] = cat:New(addon.L["Recruit-a-Friend"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")"); -- Recruit-a-Friend
    AddC(tmp[972], tmp[988]);
    AddA(tmp[988], a[1436]); -- Friends In High Places
    AddA(tmp[988], a[4832]); -- Friends In Even Higher Places
    AddA(tmp[988], a[8213]); -- Friends In Places Higher Yet
    AddA(tmp[988], a[8794]); -- Friends In Places Even Higher Than That
    AddA(tmp[988], a[9925]); -- Friends In Places Yet Even Higher Than That
    tmp[1043] = cat:New(addon.L["The Entitled"] .. " " .. (UnitName("player"))); -- The Entitled Player
    AddC(tmp[971], tmp[1043]);
    tmp[1045] = cat:New((addon.GetCategoryInfo(14864))); -- Classic
    AddC(tmp[1043], tmp[1045]);
    AddA(tmp[1045], a[15579]); -- Return to Lordaeron
    tmp[1065] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1045], tmp[1065]);
    AddA(tmp[1065], a[948]); -- Ambassador of the Alliance
    AddA(tmp[1065], a[762]); -- Ambassador of the Horde
    AddA(tmp[1065], a[871]); -- "Avast Ye, Admiral!"
    AddA(tmp[1065], a[2336]); -- Insane in the Membrane
    tmp[1047] = cat:New((addon.GetCategoryInfo(14866))); -- Wrath of the Lich King
    AddC(tmp[1043], tmp[1047]);
    tmp[1054] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
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
    tmp[1057] = cat:New((addon.GetCategoryInfo(15272)), true); -- Dungeons
    AddC(tmp[1047], tmp[1057]);
    AddA(tmp[1057], a[9058]); -- Leeeeeeeeeeeeeroy...?
    tmp[1056] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
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
    tmp[1048] = cat:New((addon.GetCategoryInfo(15072))); -- Cataclysm
    AddC(tmp[1043], tmp[1048]);
    AddA(tmp[1048], a[5767]); -- Scourer of the Eternal Sands
    tmp[1058] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1048], tmp[1058]);
    AddA(tmp[1058], a[5879]); -- Veteran of the Molten Front
    tmp[1059] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1048], tmp[1059]);
    AddA(tmp[1059], a[5827]); -- Avengers of Hyjal
    tmp[1060] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
    AddC(tmp[1048], tmp[1060]);
    AddA(tmp[1060], a[5116]); -- Heroic: Nefarian
    AddA(tmp[1060], a[5121]); -- Heroic: Sinestra
    AddA(tmp[1060], a[5123]); -- Heroic: Al'Akir
    AddA(tmp[1060], a[5506]); -- Defender of a Shattered World
    AddA(tmp[1060], a[5803]); -- Heroic: Ragnaros
    AddA(tmp[1060], a[6177]); -- Destroyer's End
    AddA(tmp[1060], a[6116]); -- Heroic: Madness of Deathwing
    tmp[1049] = cat:New((addon.GetCategoryInfo(15164))); -- Mists of Pandaria
    AddC(tmp[1043], tmp[1049]);
    tmp[1061] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1049], tmp[1061]);
    AddA(tmp[1061], a[7284]); -- Is Another Man's Treasure
    AddA(tmp[1061], a[7479]); -- The Shado-Master
    AddA(tmp[1061], a[8121]); -- Stormbreaker
    tmp[1062] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1049], tmp[1062]);
    AddA(tmp[1062], a[6544]); -- The Tillers
    AddA(tmp[1062], a[8023]); -- Wakener
    tmp[1063] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
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
    tmp[1050] = cat:New((addon.GetCategoryInfo(15233))); -- Warlords of Dreanor
    AddC(tmp[1043], tmp[1050]);
    tmp[1066] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1050], tmp[1066]);
    AddA(tmp[1066], a[10072]); -- Rumble in the Jungle
    AddA(tmp[1066], a[10265]); -- Rumble in the Jungle
    AddA(tmp[1066], a[10334]); -- Predator
    tmp[1067] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1050], tmp[1067]);
    AddA(tmp[1067], a[9470]); -- Council of Exarchs
    AddA(tmp[1067], a[9471]); -- Frostwolf Orcs
    AddA(tmp[1067], a[9476]); -- Sha'tari Defense
    AddA(tmp[1067], a[9475]); -- Laughing Skull Orcs
    AddA(tmp[1067], a[9072]); -- Mantle of the Talon King
    AddA(tmp[1067], a[9474]); -- Wrynn's Vanguard
    AddA(tmp[1067], a[9473]); -- Vol'jin's Spear
    AddA(tmp[1067], a[9472]); -- Steamwheedle Preservation Society
    tmp[1068] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
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
    tmp[1051] = cat:New((addon.GetCategoryInfo(15258))); -- Legion
    AddC(tmp[1043], tmp[1051]);
    tmp[1074] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[1051], tmp[1074]);
    AddA(tmp[1074], a[11232]); -- "Lock, Stock and Two Smoking Goblins"
    tmp[1070] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1051], tmp[1070]);
    AddA(tmp[1070], a[12104]); -- And We're All Out of Mana Buns
    AddA(tmp[1070], a[12083]); -- Paragon of Argus
    tmp[1071] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1051], tmp[1071]);
    AddA(tmp[1071], a[11941]); -- Chromie Homie
    tmp[1072] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
    AddC(tmp[1051], tmp[1072]);
    AddA(tmp[1072], a[10827]); -- Mythic: Xavius
    AddA(tmp[1072], a[10850]); -- Mythic: Gul'dan
    AddA(tmp[1072], a[11781]); -- Mythic: Kil'jaeden
    AddA(tmp[1072], a[12002]); -- Mythic: Argus the Unmaker
    AddA(tmp[1072], a[11763]); -- Glory of the Tomb Raider
    AddA(tmp[1072], a[11387]); -- The Chosen
    tmp[1052] = cat:New((addon.GetCategoryInfo(15305))); -- Battle for Azeroth
    AddC(tmp[1043], tmp[1052]);
    tmp[1075] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[1052], tmp[1075]);
    AddA(tmp[1075], a[13925]); -- The Fourth War
    AddA(tmp[1075], a[13924]); -- The Fourth War
    AddA(tmp[1075], a[12497]); -- Drust Do It.
    tmp[1076] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1052], tmp[1076]);
    AddA(tmp[1076], a[13134]); -- Expedition Leader
    AddA(tmp[1076], a[13638]); -- Undersea Usurper
    AddA(tmp[1076], a[13555]); -- Junkyard Tinkmaster
    tmp[1077] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
    AddC(tmp[1052], tmp[1077]);
    AddA(tmp[1077], a[12533]); -- Mythic: G'huun
    AddA(tmp[1077], a[13314]); -- Mythic: Lady Jaina Proudmoore
    AddA(tmp[1077], a[13733]); -- Mythic: Queen Azshara
    AddA(tmp[1077], a[14055]); -- Mythic: N'Zoth the Corruptor
    tmp[1078] = cat:New((addon.GetCategoryInfo(15417)), true); -- Heart of Azeroth
    AddC(tmp[1052], tmp[1078]);
    AddA(tmp[1078], a[13779]); -- Phenomenal Cosmic Power
    tmp[1079] = cat:New((addon.GetCategoryInfo(15426)), true); -- Visions of N'Zoth
    AddC(tmp[1052], tmp[1079]);
    AddA(tmp[1079], a[14140]); -- Mad World
    tmp[1053] = cat:New((addon.GetCategoryInfo(15439))); -- Shadowlands
    AddC(tmp[1043], tmp[1053]);
    tmp[1080] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1053], tmp[1080]);
    AddA(tmp[1080], a[14277]); -- The Accuser's Avowed
    tmp[1081] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
    AddC(tmp[1053], tmp[1081]);
    AddA(tmp[1081], a[14365]); -- Mythic: Sire Denathrius
    AddA(tmp[1081], a[15121]); -- Mythic: Sylvanas Windrunner
    AddA(tmp[1081], a[15489]); -- Mythic: The Jailer
    tmp[1082] = cat:New((addon.GetCategoryInfo(15440)), true); -- Torghast
    AddC(tmp[1053], tmp[1082]);
    AddA(tmp[1082], a[14568]); -- Twisting Corridors: Layer 6
    tmp[1083] = cat:New((addon.GetCategoryInfo(15441)), true); -- Covenant Sanctums
    AddC(tmp[1053], tmp[1083]);
    AddA(tmp[1083], a[14752]); -- Things To Do When You're Dead
    AddA(tmp[1083], a[14682]); -- The Party Herald
    tmp[1084] = cat:New(addon.L["Other"]); -- Other
    AddC(tmp[1043], tmp[1084]);
    tmp[1085] = cat:New((addon.GetCategoryInfo(96)), true); -- Quests
    AddC(tmp[1084], tmp[1085]);
    AddA(tmp[1085], a[978]); -- 3000 Quests Completed
    AddA(tmp[1085], a[7520]); -- The Loremaster
    tmp[1086] = cat:New((addon.GetCategoryInfo(97)), true); -- Exploration
    AddC(tmp[1084], tmp[1086]);
    AddA(tmp[1086], a[46]); -- Universal Explorer
    AddA(tmp[1086], a[9924]); -- Field Photographer
    AddA(tmp[1086], a[12439]); -- Priority Mail
    tmp[1088] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1084], tmp[1088]);
    AddA(tmp[1088], a[1015]); -- 40 Exalted Reputations
    AddA(tmp[1088], a[6742]); -- 60 Exalted Reputations
    AddA(tmp[1088], a[12864]); -- 80 Exalted Reputations
    AddA(tmp[1088], a[12866]); -- 100 Exalted Reputations
    tmp[1087] = cat:New((addon.GetCategoryInfo(15272)), true); -- Dungeons
    AddC(tmp[1084], tmp[1087]);
    AddA(tmp[1087], a[4477]); -- Looking For Many
    tmp[1089] = cat:New((addon.GetCategoryInfo(15117)), true); -- Pet Battles
    AddC(tmp[1084], tmp[1089]);
    AddA(tmp[1089], a[6607]); -- Taming Azeroth
    AddA(tmp[1089], a[14020]); -- Pet Battle Challenge: Blackrock Depths
    AddA(tmp[1089], a[8301]); -- Deadly Pet Brawler
    tmp[1090] = cat:New(addon.L["Brawler's Guild"] .. " (" .. (addon.GetCategoryInfo(15234)) .. ")", true); -- Brawler's Guild
    AddC(tmp[1084], tmp[1090]);
    AddA(tmp[1090], a[13191]); -- Brawler for Azeroth
    tmp[1091] = cat:New((addon.GetCategoryInfo(15246)), true); -- Collections
    AddC(tmp[1084], tmp[1091]);
    AddA(tmp[1091], a[6590]); -- World Safari
    AddA(tmp[1091], a[8397]); -- Crazy for Cats
    AddA(tmp[1091], a[10356]); -- Lord of the Reins
    AddA(tmp[1091], a[10355]); -- Lord of the Reins
    AddA(tmp[1091], a[10354]); -- Crashin' Thrashin' Commander
    AddA(tmp[1091], a[10694]); -- Fabulous
    AddA(tmp[1091], a[11761]); -- Azeroth's Next Top Model
    tmp[1092] = cat:New((addon.GetCategoryInfo(169)), true); -- Professions
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
    tmp[1093] = cat:New((addon.GetCategoryInfo(95)), true); -- PvP
    AddC(tmp[1084], tmp[1093]);
    tmp[1096] = cat:New((addon.GetCategoryInfo(15266)), true); -- Honor
    AddC(tmp[1093], tmp[1096]);
    AddA(tmp[1096], a[12901]); -- Honor Level 25
    AddA(tmp[1096], a[12904]); -- Honor Level 50
    AddA(tmp[1096], a[12907]); -- Honor Level 80
    AddA(tmp[1096], a[12909]); -- Honor Level 100
    AddA(tmp[1096], a[12913]); -- Honor Level 200
    AddA(tmp[1096], a[12915]); -- Honor Level 300
    AddA(tmp[1096], a[870]); -- 100000 Honorable Kills
    AddA(tmp[1096], a[5363]); -- 250000 Honorable Kills
    tmp[1095] = cat:New((addon.GetCategoryInfo(15283)), true); -- World
    AddC(tmp[1093], tmp[1095]);
    AddA(tmp[1095], a[8721]); -- Fire-Watcher
    AddA(tmp[1095], a[14191]); -- Servant of N'Zoth
    AddA(tmp[1095], a[12605]); -- Conqueror of Azeroth
    AddA(tmp[1095], a[12604]); -- Conqueror of Azeroth
    tmp[1097] = cat:New(addon.L["Dueler's Guild"], true); -- Dueler's Guild
    AddC(tmp[1093], tmp[1097]);
    AddA(tmp[1097], a[12861]); -- Master of Duels
    tmp[1098] = cat:New((addon.GetCategoryInfo(153)), true); -- Battlegrounds
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
    tmp[1102] = cat:New((addon.GetCategoryInfo(15246))); -- Collections
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
    tmp[1103] = cat:New((addon.GetCategoryInfo(15271))); -- Raids
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
    tmp[1104] = cat:New((addon.GetCategoryInfo(95))); -- Player vs. Player
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
    tmp[1108] = cat:New(addon.L["Level 85"], true); -- Level 85
    AddC(tmp[1106], tmp[1108]);
    AddA(tmp[1108], a[4999]); -- Realm First! Level 85
    AddA(tmp[1108], a[5007]); -- Realm First! Level 85 Warrior
    AddA(tmp[1108], a[5001]); -- Realm First! Level 85 Paladin
    AddA(tmp[1108], a[5004]); -- Realm First! Level 85 Hunter
    AddA(tmp[1108], a[5008]); -- Realm First! Level 85 Rogue
    AddA(tmp[1108], a[5002]); -- Realm First! Level 85 Priest
    AddA(tmp[1108], a[5005]); -- Realm First! Level 85 Death Knight
    AddA(tmp[1108], a[4998]); -- Realm First! Level 85 Shaman
    AddA(tmp[1108], a[5006]); -- Realm First! Level 85 Mage
    AddA(tmp[1108], a[5003]); -- Realm First! Level 85 Warlock
    AddA(tmp[1108], a[5000]); -- Realm First! Level 85 Druid
    tmp[1109] = cat:New(addon.L["Level 90"], true); -- Level 90
    AddC(tmp[1106], tmp[1109]);
    AddA(tmp[1109], a[6524]); -- Realm First! Level 90
    AddA(tmp[1109], a[6750]); -- Realm First! Level 90 Warrior
    AddA(tmp[1109], a[6744]); -- Realm First! Level 90 Paladin
    AddA(tmp[1109], a[6747]); -- Realm First! Level 90 Hunter
    AddA(tmp[1109], a[6751]); -- Realm First! Level 90 Rogue
    AddA(tmp[1109], a[6745]); -- Realm First! Level 90 Priest
    AddA(tmp[1109], a[6748]); -- Realm First! Level 90 Death Knight
    AddA(tmp[1109], a[6523]); -- Realm First! Level 90 Shaman
    AddA(tmp[1109], a[6749]); -- Realm First! Level 90 Mage
    AddA(tmp[1109], a[6746]); -- Realm First! Level 90 Warlock
    AddA(tmp[1109], a[6752]); -- Realm First! Level 90 Monk
    AddA(tmp[1109], a[6743]); -- Realm First! Level 90 Druid
    tmp[1110] = cat:New((addon.GetCategoryInfo(169))); -- Professions
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
    tmp[1112] = cat:New(addon.L["525 skill"], true); -- 525 skill
    AddC(tmp[1110], tmp[1112]);
    AddA(tmp[1112], a[5381]); -- Realm First! Illustrious Alchemist
    AddA(tmp[1112], a[5387]); -- Realm First! Illustrious Angler
    AddA(tmp[1112], a[5396]); -- Realm First! Illustrious Archaeologist
    AddA(tmp[1112], a[5382]); -- Realm First! Illustrious Blacksmith
    AddA(tmp[1112], a[5383]); -- Realm First! Illustrious Cook
    AddA(tmp[1112], a[5384]); -- Realm First! Illustrious Enchanter
    AddA(tmp[1112], a[5385]); -- Realm First! Illustrious Engineer
    AddA(tmp[1112], a[5388]); -- Realm First! Illustrious Herbalist
    AddA(tmp[1112], a[5390]); -- Realm First! Illustrious Jewelcrafter
    AddA(tmp[1112], a[5391]); -- Realm First! Illustrious Leatherworker
    AddA(tmp[1112], a[5386]); -- Realm First! Illustrious Medic
    AddA(tmp[1112], a[5392]); -- Realm First! Illustrious Miner
    AddA(tmp[1112], a[5389]); -- Realm First! Illustrious Scribe
    AddA(tmp[1112], a[5393]); -- Realm First! Illustrious Skinner
    AddA(tmp[1112], a[5394]); -- Realm First! Illustrious Tailor
    tmp[1113] = cat:New(addon.L["600 skill"], true); -- 600 skill
    AddC(tmp[1110], tmp[1113]);
    AddA(tmp[1113], a[6859]); -- Realm First! Zen Master Alchemist
    AddA(tmp[1113], a[6865]); -- Realm First! Zen Master Angler
    AddA(tmp[1113], a[6873]); -- Realm First! Zen Master Archaeologist
    AddA(tmp[1113], a[6860]); -- Realm First! Zen Master Blacksmith
    AddA(tmp[1113], a[6861]); -- Realm First! Zen Master Cook
    AddA(tmp[1113], a[6862]); -- Realm First! Zen Master Enchanter
    AddA(tmp[1113], a[6863]); -- Realm First! Zen Master Engineer
    AddA(tmp[1113], a[6866]); -- Realm First! Zen Master Herbalist
    AddA(tmp[1113], a[6868]); -- Realm First! Zen Master Jewelcrafter
    AddA(tmp[1113], a[6869]); -- Realm First! Zen Master Leatherworker
    AddA(tmp[1113], a[6864]); -- Realm First! Zen Master Medic
    AddA(tmp[1113], a[6870]); -- Realm First! Zen Master Miner
    AddA(tmp[1113], a[6867]); -- Realm First! Zen Master Scribe
    AddA(tmp[1113], a[6871]); -- Realm First! Zen Master Skinner
    AddA(tmp[1113], a[6872]); -- Realm First! Zen Master Tailor
    tmp[1116] = cat:New((addon.GetCategoryInfo(201)), true); -- Reputation
    AddC(tmp[1105], tmp[1116]);
    AddA(tmp[1116], a[1463]); -- Realm First! Northrend Vanguard
    AddA(tmp[1116], a[6829]); -- Realm First! Pandaren Ambassador
    tmp[1114] = cat:New((addon.GetCategoryInfo(15272)), true); -- Dungeons
    AddC(tmp[1105], tmp[1114]);
    AddA(tmp[1114], a[6433]); -- Realm First! Challenge Conqueror: Gold
    AddA(tmp[1114], a[11224]); -- Realm First! Legion Keystone Master
    AddA(tmp[1114], a[13078]); -- Realm First! Battle for Azeroth Keystone Master
    AddA(tmp[1114], a[14662]); -- Realm First! Shadowlands Keystone Master
    tmp[1115] = cat:New((addon.GetCategoryInfo(15271)), true); -- Raids
    AddC(tmp[1105], tmp[1115]);
    AddA(tmp[1115], a[1402]); -- Realm First! Conqueror of Naxxramas
    AddA(tmp[1115], a[456]); -- Realm First! Obsidian Slayer
    AddA(tmp[1115], a[1400]); -- Realm First! Magic Seeker
    AddA(tmp[1115], a[3117]); -- Realm First! Death's Demise
    AddA(tmp[1115], a[3259]); -- Realm First! Celestial Defender
    AddA(tmp[1115], a[4078]); -- Realm First! Grand Crusader
    AddA(tmp[1115], a[4576]); -- Realm First! Fall of the Lich King
    tmp[1117] = cat:New((addon.GetCategoryInfo(15268))); -- Promotions
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
    local excludedCategory = tmp[857];

    local tabs = {};
    tabs["Achievements"] = achievements.Children;
    tabs["Expansions"] = expansions.Children;
    tabs["Events"] = events.Children;
    tabs["PvP"] = pvp.Children;
    tabs["Specials"] = specials.Children;
    return tabs, focusedCategory, currentZoneCategory, selectedZoneCategory, excludedCategory;
end

