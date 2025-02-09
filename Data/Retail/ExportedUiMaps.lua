local _, addon = ...;
addon.Data.ExportedUiMaps = {};
local exportedUiMaps = addon.Data.ExportedUiMaps;

local tasks, maps, achievements;
function exportedUiMaps.RegisterTasks(_maps, _achievements)
    maps, achievements = _maps, _achievements;
    wipe(maps);

    local name = "Ui Maps";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local function N(id, postFix, achievementIds)
    maps[id] = maps[id] or {};
    maps[id]["Achievements" .. postFix] = {};
    for i, achievementId in next, achievementIds do
        maps[id]["Achievements" .. postFix][i] = achievements[achievementId];
    end
end

local function A(id, achievementIds)
    if not addon.Util.IsTable(id) then
        N(id, "", achievementIds);
    else
        N(id[1], "", achievementIds);
        for i = 2, #id do
            maps[id[i]] = maps[id[1]];
        end
    end
end

local function A10(id, achievementIds)
    N(id, "10", achievementIds);
end

local function A25(id, achievementIds)
    N(id, "25", achievementIds);
end

local function C(mId1, mId2)
    maps[mId1] = maps[mId2];
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-11-10 06-03-24 ]] --
tasks = {
    {A, 1, {1206, 43, 4790, 728, 9924, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Durotar
    {C, 2, 1}, -- Durotar - Burning Blade Coven
    {C, 3, 1}, -- Durotar - Tiragarde Keep - Tiragarde Keep
    {C, 4, 1}, -- Durotar - Tiragarde Keep - Great Hall
    {C, 5, 1}, -- Durotar - Skull Rock
    {C, 6, 1}, -- Durotar - Dustwind Cave
    {A, 7, {1206, 43, 736, 762, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Mulgore
    {C, 8, 7}, -- Mulgore - Palemane Rock
    {C, 9, 7}, -- Mulgore - The Venture Co. Mine
    {A, 10, {1206, 43, 11200, 11201, 16431, 4933, 750, 762, 2336, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Northern Barrens
    {C, 11, 10}, -- Northern Barrens - Wailing Caverns
    {A, 12, {1206, 944, 942, 943, 7520, 1678, 43, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 8348, 4875, 4827, 5548, 4868, 7525, 46}}, -- Kalimdor
    {A, 13, {1206, 1676, 42, 7520, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 897, 4875, 4827, 5548, 4868, 4881, 7525, 46}}, -- Eastern Kingdoms
    {A, 14, {1206, 1676, 42, 7520, 4896, 761, 948, 762, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Arathi Highlands
    {A, 15, {1676, 42, 7520, 16431, 4900, 5444, 765, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 4827, 46}}, -- Badlands
    {C, 16, 15}, -- Badlands - Uldaman
    {A, 17, {1676, 42, 7520, 9618, 11297, 4909, 766, 9924, 948, 762, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Blasted Lands
    {A, 18, {1206, 42, 15579, 768, 762, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Tirisfal Glades
    {C, 19, 18}, -- Tirisfal Glades - Scarlet Monastery Entrance
    {C, 20, 18}, -- Tirisfal Glades - Keeper's Rest
    {A, 21, {42, 4894, 769, 762, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 4827, 46}}, -- Silverpine Forest
    {A, 22, {1206, 1676, 42, 7520, 4893, 770, 9924, 948, 762, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Western Plaguelands
    {A, 23, {1676, 42, 7520, 11297, 4892, 5442, 771, 9924, 946, 945, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Eastern Plaguelands
    {A, 24, {10994, 11135, 11136, 10706, 11212, 11213, 11214, 11215, 11216, 11217, 11219, 11220, 11221, 11222, 11223, 11298, 10746, 10459, 10743, 10745, 10460, 10461, 10747, 10748, 11173, 10749, 10750, 11171, 11137, 11611, 11612, 11144, 11772, 11609, 11610, 10852, 10853, 12071, 12072, 11218}}, -- Light's Hope Chapel
    {A, 25, {1206, 42, 11200, 11201, 4895, 772, 9924, 762, 2336, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 4827, 46}}, -- Hillsbrad Foothills
    {A, 26, {1206, 1676, 42, 7520, 4897, 773, 762, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- The Hinterlands
    {A, 27, {42, 11200, 11201, 4786, 627, 948, 6558, 6559, 6560, 46}}, -- Dun Morogh
    {C, 28, 27}, -- Dun Morogh - Coldridge Pass
    {C, 29, 27}, -- Dun Morogh - The Grizzled Den
    {C, 30, 27}, -- Dun Morogh - New Tinkertown
    {C, 31, 27}, -- Dun Morogh - Gol'Bolar Quarry
    {A, 32, {1676, 42, 7520, 40796, 4910, 774, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 8348, 2556, 46}}, -- Searing Gorge
    {A, 33, {1676, 42, 7520, 11296, 4901, 775, 9924, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Burning Steppes - Blackrock Mountain - Blackrock Spire
    {C, 34, 33}, -- Burning Steppes - Blackrock Mountain - Blackrock Caverns
    {C, 35, 32}, -- Searing Gorge - Blackrock Mountain - Blackrock Depths
    {C, 36, 33}, -- Burning Steppes
    {A, 37, {1206, 42, 776, 9924, 948, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 46}}, -- Elwynn Forest
    {C, 38, 37}, -- Elwynn Forest - Fargodeep Mine - Fargodeep Mine
    {C, 39, 37}, -- Elwynn Forest - Fargodeep Mine - Lower Mines
    {C, 40, 37}, -- Elwynn Forest - Jasperlode Mine
    {A, 42, {42, 777, 6586, 6613, 6603, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 11240, 46}}, -- Deadwind Pass
    {C, 43, 42}, -- Deadwind Pass - The Master's Cellar
    {C, 44, 42}, -- Deadwind Pass - The Master's Cellar - The Master's Cellar
    {C, 45, 42}, -- Deadwind Pass - The Master's Cellar - Lower Cellar
    {C, 46, 42}, -- Deadwind Pass - Karazhan Catacombs
    {A, 47, {1206, 1676, 42, 7520, 12430, 12455, 778, 9924, 948, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Duskwood
    {A, 48, {1206, 1676, 42, 7520, 4899, 12456, 779, 9924, 948, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 4827, 46}}, -- Loch Modan
    {A, 49, {1206, 1676, 42, 7520, 4902, 780, 948, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Redridge Mountains
    {A, 50, {1206, 1676, 42, 7520, 4906, 940, 941, 781, 17366, 948, 762, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Northern Stranglethorn
    {A, 51, {1206, 1676, 42, 7520, 4904, 782, 948, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Swamp of Sorrows
    {A, 52, {1206, 1676, 42, 7520, 11200, 11201, 4903, 12455, 802, 9924, 948, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Westfall
    {C, 53, 52}, -- Westfall - Gold Coast Quarry
    {C, 54, 52}, -- Westfall - Jangolode Mine
    {C, 55, 52}, -- Westfall - The Deadmines
    {A, 56, {1206, 1676, 42, 7520, 12429, 12456, 841, 9924, 948, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Wetlands
    {A, 57, {1206, 43, 842, 948, 6558, 6559, 6560, 46}}, -- Teldrassil
    {C, 58, 57}, -- Shadowthread Cave
    {C, 59, 57}, -- Fel Rock
    {C, 60, 57}, -- Ban'ethil Barrow Den - Upper Den
    {C, 61, 57}, -- Ban'ethil Barrow Den - Lower Den
    {A, 62, {1206, 7520, 1678, 43, 4928, 5453, 844, 948, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 4827, 46, 12572}}, -- Darkshore
    {A, 63, {1206, 7520, 1678, 43, 4925, 4976, 845, 948, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Ashenvale
    {A, 64, {7520, 1678, 43, 4938, 846, 948, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Thousand Needles
    {A, 65, {1206, 7520, 1678, 43, 4936, 4980, 847, 948, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Stonetalon Mountains
    {A, 66, {1206, 7520, 1678, 43, 4930, 848, 762, 6585, 6612, 6602, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Desolace
    {C, 67, 66}, -- Desolace - Maraudon - The Wicked Grotto
    {C, 68, 66}, -- Desolace - Maraudon - Foulspore Cavern
    {A, 69, {1206, 7520, 1678, 43, 4932, 4979, 849, 9924, 948, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Feralas
    {A, 70, {1206, 7520, 1678, 43, 40796, 4929, 4978, 850, 948, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Dustwallow Marsh
    {A, 71, {7520, 1678, 43, 11200, 11201, 4935, 851, 9924, 948, 762, 2336, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 4827, 46}}, -- Tanaris
    {C, 72, 71}, -- Tanaris - The Noxious Lair
    {C, 73, 71}, -- Tanaris - The Gaping Chasm
    {A, 74, {763, 764}}, -- Caverns of Time - Timeless Tunnel
    {C, 75, 74}, -- Caverns of Time - Caverns of Time
    {A, 76, {1206, 43, 11200, 11201, 4927, 5454, 5448, 5546, 5547, 852, 762, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Azshara
    {A, 77, {1206, 944, 942, 943, 7520, 1678, 43, 11296, 4931, 853, 948, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 46}}, -- Felwood
    {A, 78, {1206, 7520, 1678, 43, 3357, 11296, 16431, 4939, 854, 9924, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Un'Goro Crater
    {C, 79, 78}, -- Un'Goro Crater - The Slithering Scar
    {A, 80, {1206, 43, 855, 9924, 6602, 6607, 6601, 7498, 7499, 8348, 2556, 46}}, -- Moonglade
    {A, 81, {7520, 1678, 43, 416, 5533, 11296, 4934, 856, 9924, 953, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 2556, 46}}, -- Silithus
    {C, 82, 81}, -- Silithus - Twilight's Run
    {A, 83, {944, 942, 943, 7520, 1678, 43, 3356, 11296, 4940, 5443, 857, 2336, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 46}}, -- Winterspring
    {A, 84, {1206, 615, 14815, 388, 11065, 603, 9924, 948, 5474, 5476, 6584, 6622, 2556, 18854}}, -- Stormwind City
    {A, 85, {1206, 610, 14817, 614, 1006, 11065, 604, 762, 5475, 1836, 5477, 6621, 6622, 2556, 18854}}, -- Orgrimmar - Orgrimmar
    {C, 86, 85}, -- Orgrimmar - Cleft of Shadow
    {A, 87, {388, 616, 619, 603, 5841, 1837, 5847, 6584, 6622}}, -- Ironforge
    {A, 88, {1206, 1006, 611, 604, 5843, 5849, 6621, 6622, 2556}}, -- Thunder Bluff
    {A, 89, {1206, 388, 617, 603, 5842, 5848, 6584, 6622, 2556}}, -- Darnassus
    {A, 90, {612, 604, 1006, 5844, 5850, 6621, 6622, 2556}}, -- Undercity
    {A, 91, {13928, 13930, 218, 219, 221, 222, 1151, 224, 225, 1164, 223, 220, 873, 582, 707, 706, 1166, 1167, 226, 709, 708}}, -- Alterac Valley
    {A, 92, {166, 167, 199, 200, 872, 168, 201, 204, 203, 1251, 202, 1502, 206, 1252, 207, 1172, 1259, 713, 712}}, -- Warsong Gulch
    {A, 93, {154, 155, 165, 158, 73, 1153, 157, 161, 156, 159, 162, 583, 584, 1169, 711, 710}}, -- Arathi Basin
    {A, 94, {42, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 859, 762, 2556, 46}}, -- Eversong Woods
    {A, 95, {42, 6586, 6613, 6558, 6559, 6560, 6611, 6590, 4908, 858, 762, 2556, 46}}, -- Ghostlands
    {C, 96, 95}, -- Amani Catacombs
    {A, 97, {43, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 860, 948, 2556, 46}}, -- Azuremyst Isle
    {C, 98, 97}, -- Tides' Hollow
    {C, 99, 97}, -- Stillpine Hold
    {A, 100, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 1262, 1311, 1312, 44, 763, 764, 1189, 1271, 862, 9924, 948, 762, 6587, 6614, 6604, 2556, 46}}, -- Hellfire Peninsula
    {A, 101, {942, 943, 7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 1262, 1311, 1312, 44, 763, 764, 894, 902, 6587, 6614, 6604, 46}}, -- Outland
    {A, 102, {942, 943, 7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 1262, 1311, 1312, 44, 763, 764, 1190, 863, 948, 762, 893, 953, 900, 6587, 6614, 6604, 2556, 46}}, -- Zangarmarsh
    {A, 103, {388, 6584, 6622, 618, 619, 603, 2556}}, -- The Exodar
    {A, 104, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 1262, 1311, 1312, 44, 1195, 864, 898, 1638, 6587, 6614, 6604, 2556, 46}}, -- Shadowmoon Valley
    {A, 105, {7520, 6558, 6559, 6560, 6611, 6590, 1262, 1311, 1312, 44, 894, 1193, 1276, 865, 896, 6587, 6614, 2556, 46}}, -- Blade's Edge Mountains
    {A, 106, {7520, 1678, 43, 6585, 6612, 6558, 6559, 6560, 6611, 6590, 4926, 861, 948, 2556, 46}}, -- Bloodmyst Isle
    {A, 107, {942, 943, 7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 1262, 1311, 1312, 44, 902, 1192, 1273, 939, 941, 1576, 4958, 866, 899, 901, 6587, 6614, 6604, 2556, 46}}, -- Nagrand
    {A, 108, {7520, 6558, 6559, 6560, 6611, 6590, 1262, 1311, 1312, 44, 763, 764, 894, 1191, 1272, 1275, 867, 903, 1205, 6587, 6614, 2556, 46}}, -- Terokkar Forest
    {A, 109, {7520, 6558, 6559, 6560, 6611, 6590, 1262, 1311, 1312, 44, 902, 1194, 843, 9924, 6587, 6614, 46}}, -- Netherstorm
    {A, 110, {1006, 6621, 6622, 613, 614, 604, 2556}}, -- Silvermoon City
    {A, 111, {6607, 6601, 7498, 7499, 8348, 1165, 9924, 6604}}, -- Shattrath City
    {A, 112, {208, 209, 783, 784, 214, 213, 212, 216, 233, 1171, 587, 1258, 211}}, -- Eye of the Storm
    {A, 113, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 41, 2256, 2257, 2557, 45, 1008, 1009, 1010, 1011, 1012, 2556, 6588, 6615, 6605, 46}}, -- Northrend
    {A, 114, {7520, 6558, 6559, 6560, 6611, 6590, 41, 2256, 2257, 2557, 45, 1008, 1010, 1011, 1012, 33, 1358, 561, 1264, 949, 6588, 6615, 46}}, -- Borean Tundra
    {A, 115, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 41, 2256, 2257, 2557, 45, 1008, 1010, 1011, 1012, 40796, 35, 1359, 547, 1277, 1265, 9924, 1007, 6588, 6615, 6605, 11941, 46}}, -- Dragonblight
    {A, 116, {7520, 6558, 6559, 6560, 6611, 6590, 41, 2256, 2257, 2557, 45, 37, 1357, 1266, 2016, 2017, 6588, 6615, 46}}, -- Grizzly Hills
    {A, 117, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 41, 2256, 2257, 2557, 45, 1011, 1012, 2556, 34, 1356, 1263, 1254, 9924, 6588, 6615, 6605, 46}}, -- Howling Fjord
    {A, 118, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 41, 2256, 2257, 2557, 45, 1009, 1010, 1011, 1012, 14750, 40, 1270, 947, 945, 6588, 6615, 6605, 2756, 2758, 2772, 2836, 2773, 3736, 2777, 2787, 2760, 2769, 2778, 2785, 2761, 2767, 2779, 2786, 2762, 2768, 2780, 2784, 2763, 2766, 2781, 2783, 2764, 2765, 2782, 2788, 2770, 2771, 2817, 2816, 3676, 3677, 4596, 46}}, -- Icecrown
    {A, 119, {7520, 6558, 6559, 6560, 6611, 6590, 41, 2256, 2257, 2557, 45, 2556, 39, 961, 962, 938, 941, 1268, 950, 951, 952, 6588, 6615, 46}}, -- Sholazar Basin
    {A, 120, {7520, 6558, 6559, 6560, 6611, 6590, 41, 2256, 2257, 2557, 45, 1012, 2556, 38, 1428, 1269, 2082, 2083, 6588, 6615, 46}}, -- The Storm Peaks
    {A, 121, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 41, 2256, 2257, 2557, 45, 1009, 1010, 2556, 36, 1596, 1576, 4958, 1267, 6588, 6615, 6605, 46}}, -- Zul'Drak
    {A, 122, {42, 897, 868, 46}}, -- Isle of Quel'Danas
    {A, 123, {9924, 1717, 1718, 1755, 2199, 2080, 1737, 2476, 1723, 1727, 1751, 1752}}, -- Wintergrasp
    {A, 125, {1008, 1010, 1956, 2084, 2076, 2077, 2078, 2094, 2095, 1957, 1958, 2096}}, -- Dalaran - Dalaran City
    {A, 126, {1008, 1010, 2556, 1956, 2084, 2076, 2077, 2078, 2094, 2095, 1957, 1958, 2096}}, -- Dalaran - The Underbelly
    {A, 127, {6607, 6601, 7498, 7499, 6611, 6590, 8348, 45, 2556, 1457, 9924, 6588, 6615, 6605, 46}}, -- Crystalsong Forest
    {A, 129, {2150, 2037, 2036, 478, 490}}, -- The Nexus
    {A, 130, {1872, 1817, 479, 500}}, -- The Culling of Stratholme - The Culling of Stratholme
    {C, 131, 130}, -- The Culling of Stratholme - Stratholme City
    {A, 132, {2038, 2056, 1862, 481, 492}}, -- Ahn'kahet: The Old Kingdom
    {A, 133, {1919, 477, 489}}, -- Utgarde Keep - Njorndir Preparation
    {C, 134, 133}, -- Utgarde Keep - Dragonflayer Ascent
    {C, 135, 133}, -- Utgarde Keep - Tyr's Terrace
    {A, 136, {2043, 1873, 2156, 2157, 488, 499}}, -- Utgarde Pinnacle - Lower Pinnacle
    {C, 137, 136}, -- Utgarde Pinnacle - Upper Pinnacle
    {A, 138, {1834, 2042, 1867, 486, 497}}, -- Halls of Lightning - Unyielding Garrison
    {C, 139, 138}, -- Halls of Lightning - Walk of the Makers
    {A, 140, {1866, 2154, 2155, 485, 496}}, -- Halls of Stone
    {A10, 141, {2148, 1874, 1869, 622}}, -- The Eye of Eternity
    {A25, 141, {2149, 1875, 1870, 623}}, -- The Eye of Eternity
    {A, 143, {1868, 2046, 2045, 2044, 1871, 487, 498}}, -- The Oculus - Band of Variance
    {C, 144, 143}, -- The Oculus - Band of Acceleration
    {C, 145, 143}, -- The Oculus - Band of Transmutation
    {C, 146, 143}, -- The Oculus - Band of Alignment
    {A, 147, {12312, 12314, 12313, 12316, 12315, 12317, 12318, 12319, 12320, 12323, 12324, 12325, 12321, 12322, 12326, 12327, 12328, 12329, 12330, 12335, 12336, 12332, 12333, 12334, 12339, 12340, 12337, 12338, 12342, 12341, 12343, 12344, 12345, 12346, 12347, 12348, 12349, 12350, 12351, 12352, 12360, 12361, 12362, 12363, 12364, 12365, 12366, 12367, 12368, 12369, 12372, 12373, 12384, 12395, 12396, 12397, 12398, 12385, 12386, 12387, 12388, 12400, 12297, 12302, 12309, 12310, 12311, 12399, 11751, 4626, 3142, 3316, 11320}}, -- Ulduar - Ulduar
    {A10, 147, {3097, 2907, 2905, 2911, 2909, 2913, 2914, 2915, 3056, 2925, 2927, 2930, 2919, 2923, 2931, 2933, 2934, 2937, 3058, 2945, 2947, 2939, 2940, 2941, 2955, 2959, 2951, 2953, 3076, 3006, 2961, 2963, 2967, 2969, 3182, 2971, 2973, 2975, 2977, 3176, 2979, 2980, 2985, 2982, 3177, 3178, 3179, 2989, 3138, 3180, 2996, 3181, 3009, 3008, 3012, 3014, 3015, 3157, 3141, 3158, 3159, 3003, 2886, 2888, 2890, 2892, 2894, 3036, 3004, 2903}}, -- Ulduar - Ulduar
    {A25, 147, {3098, 2908, 2906, 2912, 2910, 2918, 2916, 2917, 3057, 2926, 2928, 2929, 2921, 2924, 2932, 2935, 2936, 2938, 3059, 2946, 2948, 2942, 2943, 2944, 2956, 2960, 2952, 2954, 3077, 3007, 2962, 2965, 2968, 2970, 3184, 2972, 2974, 2976, 2978, 3183, 3118, 2981, 2984, 2983, 3185, 3186, 3187, 3237, 2995, 3189, 2997, 3188, 3011, 3010, 3013, 3017, 3016, 3161, 3162, 3163, 3164, 3002, 2887, 2889, 2891, 2893, 2895, 3037, 3005, 2904}}, -- Ulduar - Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {A, 154, {2058, 2040, 1864, 2152, 484, 495}}, -- Gundrak
    {A10, 155, {2047, 2049, 2050, 2051, 624, 1876}}, -- The Obsidian Sanctum
    {A25, 155, {2048, 2052, 2053, 2054, 1877, 625}}, -- The Obsidian Sanctum
    {A, 156, {2081}}, -- Vault of Archavon
    {A10, 156, {4016, 1722, 3136, 3836, 4585}}, -- Vault of Archavon
    {A25, 156, {4017, 1721, 3137, 3837, 4586}}, -- Vault of Archavon
    {A, 157, {1296, 1297, 1860, 480, 491}}, -- Azjol-Nerub - The Brood Pit
    {C, 158, 157}, -- Azjol-Nerub - Hadronox's Lair
    {C, 159, 157}, -- Azjol-Nerub - The Gilded Gate
    {A, 160, {2151, 2057, 2039, 482, 493}}, -- Drak'Tharon Keep - The Vestibules of Drak'Tharon
    {C, 161, 160}, -- Drak'Tharon Keep - Drak'Tharon Overlook
    {A, 162, {11750, 7934, 9924}}, -- Naxxramas - The Construct Quarter
    {A10, 162, {1997, 1858, 1856, 2178, 2180, 1996, 2182, 2176, 2146, 2184, 578, 562, 564, 566, 568, 572, 574, 576, 2187}}, -- Naxxramas - The Construct Quarter
    {A25, 162, {2140, 1859, 1857, 2179, 2181, 2139, 2183, 2177, 2147, 2185, 579, 563, 565, 567, 569, 573, 575, 577, 2186}}, -- Naxxramas - The Construct Quarter
    {C, 163, 162}, -- Naxxramas - The Arachnid Quarter
    {C, 163, 162}, -- Naxxramas - The Arachnid Quarter
    {C, 163, 162}, -- Naxxramas - The Arachnid Quarter
    {C, 164, 162}, -- Naxxramas - The Military Quarter
    {C, 164, 162}, -- Naxxramas - The Military Quarter
    {C, 164, 162}, -- Naxxramas - The Military Quarter
    {C, 165, 162}, -- Naxxramas - The Plague Quarter
    {C, 165, 162}, -- Naxxramas - The Plague Quarter
    {C, 165, 162}, -- Naxxramas - The Plague Quarter
    {C, 166, 162}, -- Naxxramas - The Lower Necropolis
    {C, 166, 162}, -- Naxxramas - The Lower Necropolis
    {C, 166, 162}, -- Naxxramas - The Lower Necropolis
    {C, 167, 162}, -- Naxxramas - The Upper Necropolis
    {C, 167, 162}, -- Naxxramas - The Upper Necropolis
    {C, 167, 162}, -- Naxxramas - The Upper Necropolis
    {A, 168, {1865, 2041, 2153, 1816, 483, 494}}, -- The Violet Hold
    {A, 169, {3776, 3777, 3851, 4177, 3847, 3848, 3849, 3850, 3852, 3853, 3854, 3856, 4256, 3855, 3857, 3957, 3845, 3846, 4176}}, -- Isle of Conquest
    {C, 170, 118}, -- Icecrown - Hrothgar's Landing
    {A, 171, {3803, 3802, 3804, 4296, 3778, 4298, 4297}}, -- Trial of the Champion
    {A, 172, {11752, 11320}}, -- Trial of the Crusader - The Argent Coliseum
    {A10, 172, {3797, 3936, 3996, 3798, 3799, 3800, 3917, 3918, 3808, 3809, 3810, 4080}}, -- Trial of the Crusader - The Argent Coliseum
    {A25, 172, {3813, 3937, 3997, 3815, 3816, 3916, 3812, 3817, 3818, 3819, 4156, 4079}}, -- Trial of the Crusader - The Argent Coliseum
    {C, 173, 172}, -- Trial of the Crusader - The Icy Depths
    {C, 173, 172}, -- Trial of the Crusader - The Icy Depths
    {C, 173, 172}, -- Trial of the Crusader - The Icy Depths
    {A, 183, {4522, 4523, 4516, 4519}}, -- The Forge of Souls
    {A, 184, {4524, 4525, 4517, 4520}}, -- Pit of Saron
    {A, 185, {4526, 4518, 4521}}, -- Halls of Reflection
    {A, 186, {11753, 4625, 4623, 11320, 9924, 4598}}, -- Icecrown Citadel
    {A10, 186, {4534, 4535, 4536, 4537, 4577, 4538, 4578, 4582, 4539, 4579, 4580, 4601, 4581, 4531, 4528, 4529, 4527, 4530, 4532, 4628, 4629, 4630, 4631, 4583, 4636}}, -- Icecrown Citadel
    {A25, 186, {4610, 4611, 4612, 4613, 4615, 4614, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4604, 4605, 4606, 4607, 4597, 4608, 4632, 4633, 4634, 4635, 4584, 4637}}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 193, 186}, -- Icecrown Citadel
    {C, 193, 186}, -- Icecrown Citadel
    {C, 193, 186}, -- Icecrown Citadel
    {A, 198, {7520, 6585, 6612, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4875, 5548, 4868, 4870, 4959, 5860, 5483, 5859, 5866, 5861, 5870, 5862, 5868, 5864, 5865, 5869, 5879, 4863, 9924, 4882, 7525, 46}}, -- Mount Hyjal
    {A, 199, {1206, 7520, 1678, 43, 4937, 4981, 4996, 948, 762, 6585, 6612, 6602, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Southern Barrens
    {A10, 200, {4817, 4818}}, -- The Ruby Sanctum
    {A25, 200, {4815, 4816}}, -- The Ruby Sanctum
    {A, 201, {7520, 4875, 5548, 4868, 4881, 4869, 4982, 5452, 5318, 5319, 4825, 4975, 9924, 46}}, -- Vashj'ir - Kelp'thar Forest
    {C, 203, 201}, -- Vashj'ir
    {C, 204, 201}, -- Vashj'ir - Abyssal Depths
    {C, 205, 201}, -- Vashj'ir - Shimmering Expanse
    {A, 206, {5208, 5209, 5210, 5211, 5213, 5214, 5215, 5216, 5226, 5227, 5229, 5228, 5219, 5220, 5221, 5222, 5230, 5231, 5552, 5223}}, -- Twin Peaks
    {A, 207, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 8348, 4875, 4868, 4881, 4871, 5445, 5446, 5449, 5450, 5447, 4864, 9924, 4883, 7525, 46}}, -- Deepholm
    {C, 208, 207}, -- Deepholm - Twilight Depths - Floor 1
    {C, 209, 207}, -- Deepholm - Twilight Depths - Floor 2
    {A, 210, {1206, 1676, 42, 7520, 4905, 4995, 9924, 389, 396, 762, 871, 2336, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- The Cape of Stranglethorn
    {A, 213, {629}}, -- Ragefire Chasm
    {A, 217, {1206}}, -- Ruins of Gilneas
    {C, 218, 217}, -- Ruins of Gilneas City
    {A, 219, {639}}, -- Zul'Farrak
    {A, 220, {641}}, -- The Temple of Atal'Hakkar
    {A, 221, {632}}, -- Blackfathom Deeps - The Pool of Ask'Ar
    {C, 222, 221}, -- Blackfathom Deeps - Moonshrine Sanctum
    {C, 223, 221}, -- Blackfathom Deeps - The Forgotten Pool
    {A, 224, {1206, 1676, 42, 7520, 6586, 6613, 6603, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4827, 46}}, -- Stranglethorn Vale
    {A, 225, {633}}, -- The Stockade
    {A, 226, {634, 13269, 14021}}, -- Gnomeregan - The Hall of Gears
    {C, 227, 226}, -- Gnomeregan - The Dormitory
    {C, 228, 226}, -- Gnomeregan - Launch Bay
    {C, 229, 226}, -- Gnomeregan - Tinkers' Court
    {A, 230, {638}}, -- Uldaman - Hall of the Keepers
    {C, 231, 230}, -- Uldaman - Khaz'Goroth's Seat
    {A, 232, {686, 11741, 429, 428, 9550, 7934, 11296, 11297, 955, 2496}}, -- Molten Core
    {A, 235, {644, 5788}}, -- Dire Maul - Gordok Commons
    {C, 236, 235}, -- Dire Maul - Capital Gardens
    {C, 237, 235}, -- Dire Maul - Court of the Highborne
    {C, 238, 235}, -- Dire Maul - Prison of Immol'Thar
    {C, 239, 235}, -- Dire Maul - Warpwood Quarter
    {C, 240, 235}, -- Dire Maul - The Shrine of Eldretharr
    {A, 241, {7520, 6586, 6613, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 2556, 4875, 5548, 4868, 4881, 4873, 5501, 4960, 5481, 5482, 5320, 5321, 5451, 4958, 4866, 948, 762, 4885, 4886, 7525, 46}}, -- Twilight Highlands
    {A, 242, {642, 3496, 14020, 14021}}, -- Blackrock Depths - Detention Block
    {C, 243, 242}, -- Blackrock Depths - Shadowforge City
    {A, 244, {5548, 5489, 5490, 4874, 5718, 5719, 5412, 5418, 5417, 5415, 5488, 5487, 5486, 5375, 5376}}, -- Tol Barad
    {A, 245, {2556, 5548, 5489, 5490, 4874, 5718, 5719, 5412, 5418, 5417, 5415, 5488, 5487, 5486, 5375, 5376}}, -- Tol Barad Peninsula
    {A, 246, {763, 764, 657, 678}}, -- The Shattered Halls
    {A, 247, {689, 953}}, -- Ruins of Ahn'Qiraj
    {A, 248, {684, 11296, 9924}}, -- Onyxia's Lair
    {A10, 248, {4402, 4403, 4404, 4396}}, -- Onyxia's Lair
    {A25, 248, {4405, 4406, 4407, 4397}}, -- Onyxia's Lair
    {A, 249, {1206, 7520, 6585, 6612, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 4875, 4868, 5767, 4888, 4872, 4961, 5317, 4865, 4884, 7525, 46}}, -- Uldum
    {A, 250, {643}}, -- Blackrock Spire - Tazz'Alor
    {C, 251, 250}, -- Blackrock Spire - Skitterweb Tunnels
    {C, 252, 250}, -- Blackrock Spire - Hordemar City
    {C, 253, 250}, -- Blackrock Spire - Hall of Blackhand
    {C, 254, 250}, -- Blackrock Spire - Halycon's Lair
    {C, 255, 250}, -- Blackrock Spire - Chamber of Battle
    {A, 256, {763, 764, 666, 672}}, -- Auchenai Crypts - Halls of the Hereafter
    {C, 257, 256}, -- Auchenai Crypts - Bridge of Souls
    {A, 258, {763, 764, 653, 674, 883}}, -- Sethekk Halls - Veil Sethekk
    {C, 259, 258}, -- Sethekk Halls - Halls of Mourning
    {A, 260, {763, 764, 654, 675}}, -- Shadow Labyrinth
    {A, 261, {763, 764, 648, 668}}, -- The Blood Furnace
    {A, 262, {763, 764, 650, 670}}, -- The Underbog
    {A, 263, {763, 764, 656, 677}}, -- The Steamvault - The Steamvault
    {C, 264, 263}, -- The Steamvault - The Cooling Pools
    {A, 265, {763, 764, 649, 669}}, -- The Slave Pens
    {A, 266, {763, 764, 659, 680}}, -- The Botanica
    {A, 267, {763, 764, 658, 679}}, -- The Mechanar - The Mechanar
    {C, 268, 267}, -- The Mechanar - Calculation Chamber
    {A, 269, {763, 764, 660, 681}}, -- The Arcatraz - Stasis Block: Trion
    {C, 270, 269}, -- The Arcatraz - Stasis Block: Maximus
    {C, 271, 269}, -- The Arcatraz - Containment Core
    {A, 272, {902, 651, 671}}, -- Mana-Tombs
    {A, 273, {763, 764, 655, 676}}, -- The Black Morass
    {A, 274, {763, 764, 652, 673}}, -- Old Hillsbrad Foothills
    {A, 275, {5245, 5246, 5247, 5248, 5249, 5250, 5251, 5252, 5253, 5254, 5255, 5256, 5257, 5262, 5258}}, -- The Battle for Gilneas
    {A, 277, {5291, 5290, 5292, 4848, 5066}}, -- Lost City of the Tol'vir
    {A, 279, {630, 11765, 14021}}, -- Wailing Caverns
    {A, 280, {640}}, -- Maraudon - Caverns of Maraudon
    {C, 281, 280}, -- Maraudon - Zaetar's Grave
    {A, 282, {5416, 6045, 6108}}, -- Baradin Hold
    {A, 283, {5281, 5282, 5283, 5284, 4833, 5060}}, -- Blackrock Caverns - Chamber of Incineration
    {C, 284, 283}, -- Blackrock Caverns - Twilight Forge
    {A, 285, {4842, 11754, 12079, 5306, 5307, 5309, 5308, 5310, 4849, 5094, 5107, 5115, 5109, 5108, 5116}}, -- Blackwing Descent - The Broken Hall
    {C, 286, 285}, -- Blackwing Descent - Vault of the Shadowflame
    {A, 287, {685, 11742, 7934}}, -- Blackwing Lair - Dragonmaw Garrison
    {C, 288, 287}, -- Blackwing Lair - Halls of Strife
    {C, 289, 287}, -- Blackwing Lair - Crimson Laboratories
    {C, 290, 287}, -- Blackwing Lair - Nefarian's Lair
    {A, 291, {14021, 5366, 5367, 5368, 5369, 5370, 5371, 628, 5083, 11856, 9924}}, -- The Deadmines - The Deadmines
    {C, 292, 291}, -- The Deadmines - Ironclad Cove
    {A, 293, {5297, 5298, 4840, 5062, 20588}}, -- Grim Batol
    {A, 294, {4850, 5313, 11754, 12079, 5300, 4852, 5311, 5312, 5118, 5117, 5119, 5120, 5121}}, -- The Bastion of Twilight - The Twilight Enclave
    {C, 295, 294}, -- The Bastion of Twilight - Throne of the Apocalypse
    {C, 296, 294}, -- The Bastion of Twilight - The Twilight Caverns
    {A, 297, {5293, 5294, 5296, 5295, 4841, 5065, 9924}}, -- Halls of Origination - The Vault of Lights
    {C, 298, 297}, -- Halls of Origination - Tomb of the Earthrager
    {C, 299, 297}, -- Halls of Origination - The Four Seats
    {A, 300, {636}}, -- Razorfen Downs
    {A, 301, {635}}, -- Razorfen Kraul
    {A, 310, {5503, 5504, 5505, 631, 5093, 4627}}, -- Shadowfang Keep - The Courtyard
    {C, 311, 310}, -- Shadowfang Keep - Dining Hall
    {C, 312, 310}, -- Shadowfang Keep - The Vacant Den
    {C, 313, 310}, -- Shadowfang Keep - Lower Observatory
    {C, 314, 310}, -- Shadowfang Keep - Upper Observatory
    {C, 315, 310}, -- Shadowfang Keep - Lord Godfrey's Chamber
    {C, 316, 310}, -- Shadowfang Keep - The Wall Walk
    {A, 317, {646, 729, 13627, 13766, 14021}}, -- Stratholme - Crusader's Square
    {C, 318, 317}, -- Stratholme - The Gauntlet
    {A, 319, {687, 424, 11743, 7934, 956}}, -- Ahn'Qiraj - The Hive Undergrounds
    {C, 320, 319}, -- Ahn'Qiraj - The Temple Gates
    {C, 321, 319}, -- Ahn'Qiraj - Vault of C'Thun
    {A, 322, {5285, 5286, 4839, 5061, 19082}}, -- Throne of the Tides - Abyssal Halls
    {C, 323, 322}, -- Throne of the Tides - Throne of Neptulon
    {A, 324, {5287, 4846, 5063}}, -- The Stonecore
    {A, 325, {5289, 5288, 4847, 5064, 17847}}, -- The Vortex Pinnacle
    {A, 328, {5304, 5305, 5122, 5123, 4851, 12079}}, -- Throne of the Four Winds
    {A, 329, {695, 9824, 959}}, -- The Battle for Mount Hyjal (Hyjal Summit)
    {A, 330, {692, 11746}}, -- Gruul's Lair
    {A, 331, {693, 11746}}, -- Magtheridon's Lair
    {A, 332, {694, 11747, 8293, 144}}, -- Serpentshrine Cavern
    {A, 333, {691, 430, 5858, 5750, 5761, 5760, 5769}}, -- Zul'Aman
    {A, 334, {763, 764, 696, 885, 8293}}, -- The Eye (Tempest Keep)
    {A, 335, {698, 11749, 725, 9824}}, -- Sunwell Plateau - Sunwell Plateau
    {C, 336, 335}, -- Sunwell Plateau - Shrine of the Eclipse
    {A, 337, {560, 688, 880, 881, 957, 5743, 5762, 5765, 5759, 5744, 5768}}, -- Zul'Gurub
    {A, 338, {5859, 5866, 5867, 5871, 5872, 5874, 5873, 5879}}, -- Molten Front
    {A, 339, {697, 11748, 9016, 426, 11869, 9824, 958}}, -- Black Temple - Black Temple
    {C, 340, 339}, -- Black Temple - Karabor Sewers
    {C, 341, 339}, -- Black Temple - Sanctuary of Shadows
    {C, 342, 339}, -- Black Temple - Halls of Anguish
    {C, 343, 339}, -- Black Temple - Gorefiend's Vigil
    {C, 344, 339}, -- Black Temple - Den of Mortal Delights
    {C, 345, 339}, -- Black Temple - Chamber of Command
    {C, 346, 339}, -- Black Temple - Temple Summit
    {A, 347, {763, 764, 647, 667}}, -- Hellfire Ramparts
    {A, 348, {897, 661, 682, 884}}, -- Magisters' Terrace - Grand Magister's Asylum
    {C, 349, 348}, -- Magisters' Terrace - Observation Grounds
    {A, 350, {690, 882, 11746, 2456, 8293, 9924, 960}}, -- Karazhan - Servant's Quarters
    {C, 351, 350}, -- Karazhan - Upper Livery Stables
    {C, 352, 350}, -- Karazhan - The Banquet Hall
    {C, 353, 350}, -- Karazhan - The Guest Chambers
    {C, 354, 350}, -- Karazhan - Opera Hall Balcony
    {C, 355, 350}, -- Karazhan - Master's Terrace
    {C, 356, 350}, -- Karazhan - Lower Broken Stair
    {C, 357, 350}, -- Karazhan - Upper Broken Stair
    {C, 358, 350}, -- Karazhan - The Menagerie
    {C, 359, 350}, -- Karazhan - Guardian's Library
    {C, 360, 350}, -- Karazhan - The Repository
    {C, 361, 350}, -- Karazhan - Upper Library
    {C, 362, 350}, -- Karazhan - The Celestial Watch
    {C, 363, 350}, -- Karazhan - Gamesman's Hall
    {C, 364, 350}, -- Karazhan - Medivh's Chambers
    {C, 365, 350}, -- Karazhan - The Power Station
    {C, 366, 350}, -- Karazhan - Netherspace
    {A, 367, {5855, 5802, 11755, 5839, 12079, 5821, 5813, 5810, 5829, 5830, 5799, 5807, 5809, 5808, 5806, 5805, 5804, 5803, 5827}}, -- Firelands - Firelands
    {C, 368, 367}, -- Firelands - The Anvil of Conflagration
    {C, 369, 367}, -- Firelands - Sulfuron Keep
    {A, 371, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 6754, 6846, 6850, 6855, 6858, 7230, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 6543, 6548, 6827, 6828, 6300, 6534, 7289, 7290, 7291, 6351, 7381, 6550, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 6616, 6589, 6606, 46, 19882, 19883, 19912, 20026, 19993, 19977, 19962, 20008, 19872}}, -- The Jade Forest
    {C, 372, 371}, -- The Jade Forest - Greenstone Quarry - Upper Quarry
    {C, 373, 371}, -- The Jade Forest - Greenstone Quarry - Lower Quarry
    {C, 374, 371}, -- The Jade Forest - The Widow's Wail
    {C, 375, 371}, -- The Jade Forest - Oona Kagu
    {A, 376, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6846, 6850, 6856, 6858, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 6548, 6827, 6828, 6517, 6301, 7292, 7293, 7294, 7295, 7296, 7502, 6969, 9924, 6544, 6551, 6552, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 7300, 7301, 7302, 7303, 7304, 7305, 7306, 7325, 6616, 6589, 6606, 46, 19884, 20027, 19994, 19978, 19963, 20017, 20009, 19873}}, -- Valley of the Four Winds
    {C, 377, 376}, -- Valley of the Four Winds - Cavern of Endless Echoes
    {A, 379, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6754, 6846, 6850, 6847, 6855, 6858, 7230, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6974, 7479, 6543, 6548, 6827, 6828, 6480, 7386, 6537, 6538, 7286, 6976, 9924, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 6616, 6589, 6606, 46, 19887, 19888, 20029, 19996, 19980, 19965, 20018, 20011, 19875}}, -- Kun-Lai Summit
    {C, 380, 379}, -- Kun-Lai Summit - Howlingwind Cavern
    {C, 381, 379}, -- Kun-Lai Summit - Pranksters' Hollow
    {C, 382, 379}, -- Kun-Lai Summit - Knucklethump Hole
    {C, 383, 379}, -- Kun-Lai Summit - The Deeper - Upper Deep
    {C, 384, 379}, -- Kun-Lai Summit - The Deeper - Lower Deep
    {C, 385, 379}, -- Kun-Lai Summit - Tomb of Conquerors
    {C, 386, 379}, -- Kun-Lai Summit - Ruins of Korune - Ruins of Korune
    {C, 387, 379}, -- Kun-Lai Summit - Ruins of Korune - Crypt of Korune
    {A, 388, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6847, 6855, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 7479, 6543, 6548, 6827, 6828, 6539, 7288, 7297, 7298, 7299, 7307, 7308, 7309, 7310, 6977, 6366, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 6616, 6589, 6606, 46, 19889, 19914, 20030, 19997, 19981, 19966, 20012, 19877}}, -- Townlong Steppes
    {C, 389, 388}, -- Townlong Steppes - Niuzao Catacombs
    {A, 390, {6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 7285, 6754, 6855, 6858, 7437, 7438, 7439, 6350, 6974, 6548, 6827, 6828, 7317, 7318, 7319, 7320, 7321, 7322, 7323, 7324, 7315, 6979, 9924, 6546, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 6616, 6589, 6606, 46, 19913, 19916, 20069, 20014, 19876}}, -- Vale of Eternal Blossoms
    {C, 391, 390}, -- Vale of Eternal Blossoms - Shrine of Two Moons - Hall of the Crescent Moon
    {C, 392, 390}, -- Vale of Eternal Blossoms - Shrine of Two Moons - The Imperial Mercantile
    {C, 393, 390}, -- Vale of Eternal Blossoms - Shrine of Seven Stars - The Emperor's Step
    {C, 394, 390}, -- Vale of Eternal Blossoms - Shrine of Seven Stars - The Imperial Exchange
    {C, 395, 390}, -- Vale of Eternal Blossoms - Guo-Lai Halls - Guo-Lai Halls
    {C, 396, 390}, -- Vale of Eternal Blossoms - Guo-Lai Halls - The Hall of the Serpent
    {C, 397, 112}, -- Eye of the Storm
    {A, 398, {6127, 6070, 6118}}, -- Well of Eternity
    {A, 399, {6132, 6119}}, -- Hour of Twilight - Hour of Twilight
    {C, 400, 399}, -- Hour of Twilight - Wyrmrest Temple
    {A, 401, {5995, 6130, 6117}}, -- End Time - End Time
    {C, 402, 401}, -- End Time - Azure Dragonshrine
    {C, 403, 401}, -- End Time - Ruby Dragonshrine
    {C, 404, 401}, -- End Time - Obsidian Dragonshrine
    {C, 405, 401}, -- End Time - Emerald Dragonshrine
    {C, 406, 401}, -- End Time - Bronze Dragonshrine
    {A, 407, {6019, 6021, 6023, 6024, 6027, 6028, 6029, 6032, 6026, 6025, 6022, 6020, 6030, 6031, 6332, 9250, 9251, 9252, 9885, 9894, 9983, 9755, 9756, 9759, 9760, 9761, 9770, 9769, 9766, 9764, 9786, 9787, 9790, 9792, 9780, 9781, 9783, 9785, 9793, 9794, 9795, 9797, 9799, 9800, 9801, 9803, 9805, 9806, 9807, 9809, 9811, 9812, 9813, 9815, 9817, 9819, 11918, 11919, 11920, 11921, 15212, 15213, 15222, 15223, 15214, 15215, 15216, 15217, 15221, 2336}}, -- Darkmoon Island
    {C, 408, 407}, -- Darkmoon Island
    {A, 409, {6175, 5518, 6106, 6107, 6177, 11756, 6181, 12079, 6174, 6128, 6129, 6084, 6105, 6133, 6180, 6109, 6110, 6111, 6112, 6113, 6114, 6115, 6116}}, -- Dragon Soul - Dragon Soul
    {C, 410, 409}, -- Dragon Soul - Maw of Go'rath
    {C, 411, 409}, -- Dragon Soul - Maw of Shu'ma
    {C, 412, 409}, -- Dragon Soul - Eye of Eternity
    {C, 413, 409}, -- Dragon Soul - Skyfire Airship
    {C, 414, 409}, -- Dragon Soul - Spine of Deathwing
    {C, 415, 409}, -- Dragon Soul - The Maelstrom
    {A, 416, {7523, 7524, 7526, 7529, 7527, 7530, 7467, 7468}}, -- Theramore's Fall
    {A, 417, {6740, 6882, 6947, 6950, 6970, 6973, 6971, 6972, 6980, 6981}}, -- Temple of Kotmogu
    {A, 418, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 6754, 6846, 6850, 6855, 6856, 7230, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 6543, 6547, 6548, 6827, 6828, 6535, 6536, 7287, 7928, 7929, 6975, 7518, 7932, 9924, 8205, 8206, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 6616, 6589, 6606, 46, 19885, 19886, 20028, 19995, 19979, 19964, 19874, 19891, 19917, 19918, 19999, 19879}}, -- Krasarang Wilds
    {C, 419, 418}, -- Krasarang Wilds - Ruins of Ogudei - Alliance Excavation
    {C, 420, 418}, -- Krasarang Wilds - Ruins of Ogudei - Ruins of Ogudei
    {C, 421, 418}, -- Krasarang Wilds - Ruins of Ogudei - Reliquary Incursion
    {A, 422, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 6350, 6974, 6547, 6548, 6827, 6828, 6540, 7312, 7313, 7314, 7316, 6978, 6857, 6545, 8023, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 6616, 6589, 6606, 46, 19890, 19915, 20031, 19998, 19967, 19878}}, -- Dread Wastes
    {A, 423, {6739, 6883, 7039, 7049, 7057, 7062, 7099, 7100, 7102, 7103, 7106}}, -- Silvershard Mines
    {A, 424, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 6754, 6846, 6850, 6847, 6855, 6856, 6858, 7230, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 7479, 6543, 6547, 6548, 6827, 6828, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 6616, 6589, 6606, 46}}, -- Pandaria
    {C, 425, 37}, -- Northshire
    {C, 426, 37}, -- Echo Ridge Mine
    {C, 427, 27}, -- Dun Morogh - Coldridge Valley
    {C, 428, 27}, -- Frostmane Hovel
    {A, 429, {6475, 6460, 6671, 6757, 6758, 6884, 6885, 6886, 6887, 8430, 16661, 19894, 19895}}, -- Temple of the Jade Serpent - Temple of the Jade Serpent
    {C, 430, 429}, -- Temple of the Jade Serpent - The Scrollkeeper's Sanctum
    {A, 431, {6684, 6427, 7413, 6760, 6895, 6908, 6909, 6910, 8436, 19906, 19907}}, -- Scarlet Halls - Training Grounds
    {C, 432, 431}, -- Scarlet Halls - Athenaeum
    {A, 433, {6716, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 6548, 6827, 6828, 6837, 7612, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377}}, -- The Veiled Stair
    {C, 434, 379}, -- Kun-Lai Summit - The Ancient Passage
    {A, 435, {6946, 6928, 6929, 637, 6761, 6896, 6911, 6912, 6913, 8437, 980, 19908, 19909}}, -- Scarlet Monastery - Forlorn Cloister
    {C, 436, 435}, -- Scarlet Monastery - Crusader's Chapel
    {A, 437, {6479, 6476, 6945, 10010, 6759, 6894, 6905, 6906, 6907, 8434, 19902, 19903}}, -- Gate of the Setting Sun - Gate of the Setting Sun
    {C, 438, 437}, -- Gate of the Setting Sun - Gate Watch Tower
    {A, 439, {6402, 6089, 6400, 6420, 6457, 6456, 6888, 6889, 6890, 6891, 8431, 19896, 19897}}, -- Stormstout Brewery - Grain Cellar
    {C, 440, 439}, -- Stormstout Brewery - Stormstout Brewhall
    {C, 441, 439}, -- Stormstout Brewery - The Great Wheel
    {C, 442, 439}, -- Stormstout Brewery - The Tasting Room
    {A, 443, {7479, 6477, 6472, 6471, 6469, 6470, 6893, 6902, 6903, 6904, 8432, 19898, 19899}}, -- Shado-Pan Monastery - Shado-Pan Monastery
    {C, 444, 443}, -- Shado-Pan Monastery - Cloudstrike Dojo
    {C, 445, 443}, -- Shado-Pan Monastery - Snowdrift Dojo
    {C, 446, 443}, -- Shado-Pan Monastery - Sealed Chambers
    {A, 447, {7252, 8310, 7257, 7261, 7258, 19893, 19924}}, -- A Brewing Storm
    {A, 448, {7265, 7267, 7266, 19923}}, -- Greenstone Village
    {C, 449, 417}, -- Temple of Kotmogu
    {A, 450, {7249, 7232, 7239, 7248, 7231, 19925}}, -- Unga Ingoo
    {A, 451, {8016, 8017, 19930}}, -- Assault on Zan'vess
    {A, 452, {6923, 6931, 6930, 19926}}, -- Brewmoon Festival
    {A, 453, {6713, 6478, 6736, 6755, 6756, 6892, 6899, 6900, 6901, 8433, 19904, 19905}}, -- Mogu'shan Palace - The Crimson Assembly Hall
    {C, 454, 453}, -- Mogu'shan Palace - Vaults of Kings Past
    {C, 455, 453}, -- Mogu'shan Palace - Throne of Ancient Conquerors
    {A, 456, {6689, 8248, 7487, 11757, 6717, 6933, 6824, 6825, 6731, 6732, 6733, 6734, 19952, 19953, 19954}}, -- Terrace of Endless Spring
    {A, 457, {6688, 6485, 6822, 10011, 6763, 6898, 6917, 6918, 6919, 8439, 19900, 19901}}, -- Siege of Niuzao Temple - Siege of Niuzao Temple
    {C, 458, 457}, -- Siege of Niuzao Temple - The Hollowed Out Tree
    {C, 459, 457}, -- Siege of Niuzao Temple - Upper Tree Ring
    {C, 460, 57}, -- Shadowglen
    {C, 461, 1}, -- Durotar - Valley of Trials
    {C, 462, 7}, -- Mulgore - Camp Narache
    {C, 463, 1}, -- Echo Isles
    {C, 464, 1}, -- Spitescale Cavern
    {C, 465, 18}, -- Tirisfal Glades - Deathknell
    {C, 466, 18}, -- Night Web's Hollow
    {C, 467, 94}, -- Sunstrider Isle
    {C, 468, 97}, -- Ammen Vale
    {C, 469, 27}, -- Dun Morogh - New Tinkertown
    {C, 470, 27}, -- Frostmane Hold
    {A, 471, {7933, 6687, 6455, 6458, 6844, 6954, 7485, 6823, 6674, 7056, 6686, 6719, 6720, 6721, 6722, 6723, 6724, 19946, 19947, 19948}}, -- Mogu'shan Vaults - Dais of Conquerors
    {C, 472, 471}, -- Mogu'shan Vaults - The Repository
    {C, 473, 471}, -- Mogu'shan Vaults - Forge of the Endless
    {A, 474, {6718, 6845, 8246, 7486, 11757, 6937, 6936, 6553, 6683, 6518, 6922, 6725, 6726, 6727, 6728, 6729, 6730, 19949, 19950, 19951}}, -- Heart of Fear - Oratorium of the Voice
    {C, 475, 474}, -- Heart of Fear - Heart of Fear
    {A, 476, {18368, 18558, 6531, 6394, 6396, 6715, 6821, 645, 6762, 6897, 6914, 6915, 6916, 8438, 19910, 19911}}, -- Scholomance - The Reliquary
    {C, 477, 476}, -- Scholomance - Chamber of Summoning
    {C, 478, 476}, -- Scholomance - The Upper Study
    {C, 479, 476}, -- Scholomance - Headmaster's Study
    {A, 480, {7271, 7273, 7272, 9572, 9573, 9574, 9575, 9576, 9577, 9578, 9579, 9580, 9581, 9582, 9583, 9584, 9585, 9586, 9587, 9588, 9589, 9590, 9597, 8486, 8491, 8496, 8501, 8504, 8507, 8487, 8492, 8497, 8502, 8505, 8508, 8488, 8493, 8498, 8503, 8506, 8509, 8697, 8812, 19927}}, -- Arena of Annihilation
    {A, 481, {7522, 8311, 7276, 7275, 8368, 19928, 19929}}, -- Crypt of Forgotten Kings - Upper Burial Chamber
    {C, 482, 481}, -- Crypt of Forgotten Kings - Crypt Depths
    {A, 483, {7523, 7524, 7526, 7529, 7527, 7530, 7467, 7468, 19938, 19939}}, -- Theramore's Fall
    {A, 486, {8010, 8011, 8012, 20500}}, -- Lion's Landing
    {A, 487, {7988, 7989, 7990, 7992, 7993, 7991, 19931}}, -- A Little Patience
    {A, 488, {8009, 7987, 7984, 7986, 19933}}, -- Dagger in the Dark
    {C, 489, 488}, -- Dagger in the Dark
    {A, 498, {8013, 8014, 8015, 19932}}, -- Domination Point
    {A, 500, {7937, 8020, 7940, 7939, 7941, 7942, 8335, 8337, 8336, 8338, 7946, 8022, 8340, 8343, 7947, 7948, 9168, 9172, 9169, 9173, 9170, 9174, 9171, 9175, 8339, 8342, 9176, 9177, 7949, 7950, 7943, 7945, 7944, 11560, 11561, 11563, 11564, 11565, 11566, 11572, 11558, 11559, 13186, 13188, 13189, 13190, 13191, 13192, 11567, 11570, 13194, 11573}}, -- Deeprun Tram - Bizmo's Brawlpub
    {C, 503, 500}, -- Brawl'gar Arena
    {A, 504, {7285, 6548, 6827, 6828, 8028, 8099, 8100, 8101, 8104, 8105, 8107, 8108, 8109, 8110, 8111, 8112, 8114, 8115, 8116, 8117, 8118, 8119, 8120, 8212, 8121, 8106, 8103, 8049, 8050, 8051, 8208, 8209, 8210, 19892, 19919, 19920, 19921, 20000, 20019, 20015, 19880}}, -- Isle of Thunder
    {C, 505, 504}, -- Isle of Thunder - Lightning Vein Mine
    {C, 506, 504}, -- Isle of Thunder - The Swollen Vault
    {A, 507, {8123, 8092, 20020}}, -- Isle of Giants
    {A, 508, {8069, 8070, 8071, 8072, 8089, 8249, 8238, 8260, 11758, 8094, 8038, 8073, 8077, 8082, 8097, 8098, 8037, 8081, 8087, 8086, 8090, 8056, 8057, 8058, 8059, 8060, 8061, 8062, 8063, 8064, 8065, 8066, 8067, 8068, 19955, 19956, 19957}}, -- Throne of Thunder - Overgrown Statuary
    {C, 509, 508}, -- Throne of Thunder - Royal Amphitheater
    {C, 510, 508}, -- Throne of Thunder - Forgotten Depths
    {C, 511, 508}, -- Throne of Thunder - Roost of Ji-Kun
    {C, 512, 508}, -- Throne of Thunder - Halls of Flesh-Shaping
    {C, 513, 508}, -- Throne of Thunder - Hall of Kings
    {C, 514, 508}, -- Throne of Thunder - Pinnacle of Storms
    {C, 515, 508}, -- Throne of Thunder - Hidden Cell
    {A, 519, {8331, 8332, 8333, 14187, 14186, 14188, 14175, 8350, 8351, 8354, 8355, 8359, 8358, 8360}}, -- Deepwind Gorge
    {A, 520, {8317, 8318, 8319, 19942, 19943}}, -- Dark Heart of Pandaria
    {C, 521, 520}, -- Dark Heart of Pandaria
    {A, 522, {8294, 8327, 8295}}, -- The Secrets of Ragefire
    {A, 523, {19940, 19941}}, -- Blood in the Snow
    {A, 524, {8314, 8315, 8364, 8366, 8347, 19934, 19935, 19936, 19937}}, -- Battle on the High Seas
    {A, 525, {7520, 10018, 9564, 9562, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 8671, 9606, 9529, 9533, 9530, 9531, 9534, 9537, 9536, 9535, 9710, 9711, 8937, 9471, 9413, 9410, 46}}, -- Frostfire Ridge
    {C, 526, 525}, -- Frostfire Ridge - Turgall's Den - Bladespire Citadel
    {C, 527, 525}, -- Frostfire Ridge - Turgall's Den - Bladespire Courtyard
    {C, 528, 525}, -- Frostfire Ridge - Turgall's Den - Bladespire Throne
    {C, 529, 525}, -- Frostfire Ridge - Turgall's Den - Sootstained Mines
    {C, 530, 525}, -- Frostfire Ridge - Grom'gar
    {C, 531, 525}, -- Frostfire Ridge - Grulloc's Grotto - Grulloc's Grotto
    {C, 532, 525}, -- Frostfire Ridge - Grulloc's Grotto - Grulloc's Lair
    {C, 533, 525}, -- Frostfire Ridge - Snowfall Alcove
    {A, 534, {2556, 9477, 9478, 10071, 10067, 10074, 10068, 10075, 10072, 10265, 10261, 10262, 10260, 10069, 10061, 10259, 10070, 10334, 10349, 10350}}, -- Tanaan Jungle
    {A, 535, {7520, 10018, 10053, 9564, 9562, 9833, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 8920, 8919, 9674, 9633, 9638, 9635, 9634, 9636, 9632, 9637, 9486, 8940, 9476, 9414, 9411, 46}}, -- Talador
    {C, 536, 535}, -- Talador - Tomb of Lights
    {C, 537, 535}, -- Talador - Tomb of Souls
    {C, 538, 535}, -- Talador - The Breached Ossuary
    {A, 539, {7520, 2556, 10018, 9491, 9492, 9564, 9562, 9833, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 8845, 9602, 9528, 9433, 9434, 9432, 9436, 9435, 9437, 9483, 9479, 9481, 8938, 9924, 9470, 9413, 9410, 11240, 46}}, -- Shadowmoon Valley
    {C, 540, 539}, -- Shadowmoon Valley - Bloodthorn Cave
    {C, 541, 539}, -- Shadowmoon Valley - Den of Secrets
    {A, 542, {7520, 2556, 10018, 10053, 9564, 9562, 9833, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 9425, 8925, 8926, 9605, 9612, 9613, 9601, 9600, 8941, 9469, 9072, 9415, 9412, 46}}, -- Spires of Arak
    {A, 543, {7520, 2556, 10018, 10053, 9564, 9562, 9833, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 9423, 8923, 8924, 9607, 9655, 9656, 9659, 9678, 9667, 9654, 9658, 9663, 8939, 9400, 9401, 9402, 9475, 9414, 9411, 46}}, -- Gorgrond
    {C, 544, 543}, -- Gorgrond - Moira's Reach - Moira's Bastion
    {C, 545, 543}, -- Gorgrond - Moira's Reach - The Armory
    {C, 546, 543}, -- Gorgrond - Fissure of Fury - Fissure of Fury
    {C, 547, 543}, -- Gorgrond - Fissure of Fury - Heart of Fury
    {C, 548, 543}, -- Gorgrond - Cragplume Cauldron - Cragplume Crater
    {C, 549, 543}, -- Gorgrond - Cragplume Cauldron - Cragplume Depths
    {A, 550, {7520, 2556, 10018, 10053, 9491, 9492, 9564, 9562, 9833, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 8927, 8928, 9615, 9610, 9571, 9548, 9541, 9617, 8942, 9924, 9472, 9413, 9414, 9410, 9411, 46}}, -- Nagrand
    {C, 551, 550}, -- Nagrand - The Masters' Cavern
    {C, 552, 550}, -- Nagrand - Stonecrag Gorge
    {C, 553, 550}, -- Nagrand - Oshu'gun
    {A, 554, {2556, 7285, 8535, 8533, 19922, 20001, 19982, 20002, 19970, 20021, 20022, 20023, 20024, 20025, 20016, 20003}}, -- Timeless Isle
    {C, 555, 554}, -- Timeless Isle - Cavern of Lost Spirits
    {A, 556, {8458, 8459, 8461, 8462, 8679, 8680, 8398, 8400, 8399, 8401, 11759, 8536, 8528, 8532, 8521, 8530, 8520, 8453, 8448, 8538, 8529, 8527, 8543, 8531, 8537, 8463, 8465, 8466, 8467, 8468, 8469, 8470, 8471, 8472, 8478, 8479, 8480, 8481, 8482, 19958, 19959, 19960, 19961}}, -- Siege of Orgrimmar - Siege of Orgrimmar
    {C, 557, 556}, -- Siege of Orgrimmar - Pools of Power
    {C, 558, 556}, -- Siege of Orgrimmar - Vault of Y'Shaarj
    {C, 559, 556}, -- Siege of Orgrimmar - Gates of Orgrimmar
    {C, 560, 556}, -- Siege of Orgrimmar - The Valley of Strength
    {C, 561, 556}, -- Siege of Orgrimmar - The Cleft of Shadow
    {C, 562, 556}, -- Siege of Orgrimmar - The Descent
    {C, 563, 556}, -- Siege of Orgrimmar - Kor'Kron Barracks
    {C, 564, 556}, -- Siege of Orgrimmar - The Menagerie
    {C, 565, 556}, -- Siege of Orgrimmar - The Siegeworks
    {C, 566, 556}, -- Siege of Orgrimmar - Chamber of the Paragons
    {C, 567, 556}, -- Siege of Orgrimmar - The Inner Sanctum
    {C, 568, 556}, -- Siege of Orgrimmar - Terrace of Endless Spring
    {C, 569, 556}, -- Siege of Orgrimmar - Temple of the Jade Serpent
    {C, 570, 556}, -- Siege of Orgrimmar - Temple of the Red Crane
    {A, 572, {7520, 10018, 10053, 8921, 8922, 9491, 9492, 9564, 9562, 9833, 9923, 9726, 9727, 10348, 9728, 14728, 8935, 9477, 9478, 46}}, -- Draenor
    {A, 573, {9005, 8993, 9008, 9037, 9046, 10076, 8875, 8876, 8877, 8878, 9620}}, -- Bloodmaul Slag Mines
    {A, 574, {9018, 9025, 9026, 9041, 9054, 10084, 8883, 8884, 8885, 8886, 9626, 16660}}, -- Shadowmoon Burial Grounds - Crypt of the Ancients
    {C, 575, 574}, -- Shadowmoon Burial Grounds - Altar of Shadow
    {C, 576, 574}, -- Shadowmoon Burial Grounds - Edge of Reality
    {C, 579, -28}, -- Lunarfall Excavation
    {C, 580, -28}, -- Lunarfall Excavation
    {C, 581, -28}, -- Lunarfall Excavation
    {C, 582, -28}, -- Lunarfall
    {C, 585, -28}, -- Frostwall Mine
    {C, 586, -28}, -- Frostwall Mine
    {C, 587, -28}, -- Frostwall Mine
    {A, 588, {9102, 9218, 9219, 9220, 9256, 9257, 9106, 9216, 9104, 9103, 9222, 9228, 9225, 9224, 9408, 9217, 9105, 9714, 9715, 9474, 9473, 9214, 9215}}, -- Ashran
    {C, 589, 588}, -- Ashran Mine
    {C, 590, -28}, -- Frostwall
    {A, 593, {9023, 9551, 9552, 9039, 9049, 10080, 8879, 8880, 8881, 8882, 9622, 9924}}, -- Auchindoun
    {A, 595, {9081, 9083, 9082, 9038, 9047, 10079, 8997, 8998, 8999, 9000, 9621, 15694, 15688, 15689, 15690}}, -- Iron Docks
    {A, 596, {8989, 8990, 8991, 8992, 9444, 9443, 11740, 8979, 8978, 8930, 8980, 8929, 8983, 8981, 8982, 8984, 8952, 8967, 8966, 8970, 8968, 8932, 8971, 8956, 8969, 8972, 8973}}, -- Blackrock Foundry - The Black Forge
    {C, 597, 596}, -- Blackrock Foundry - Slagworks
    {C, 598, 596}, -- Blackrock Foundry - The Workshop
    {C, 599, 596}, -- Blackrock Foundry - Iron Assembly
    {C, 600, 596}, -- Blackrock Foundry - The Crucible
    {A, 601, {9033, 9035, 9034, 9036, 8843, 8844, 10081, 8871, 8872, 8873, 8874, 9623}}, -- Skyreach - Lower Quarter
    {C, 602, 601}, -- Skyreach - Grand Spire
    {A, 606, {9024, 9007, 9043, 9052, 10082, 8887, 8888, 8889, 8890, 9625, 15695, 15688, 15689, 15690}}, -- Grimrail Depot - Train Depot
    {C, 607, 606}, -- Grimrail Depot - Rafters
    {C, 608, 606}, -- Grimrail Depot - Rear Train Cars
    {C, 609, 606}, -- Grimrail Depot - Forward Train Cars
    {A, 610, {8986, 8987, 8988, 9441, 9442, 8948, 8947, 8974, 8975, 8958, 8976, 8977, 8949, 8960, 8961, 8962, 8963, 8964, 8965}}, -- Highmaul - Highmaul
    {C, 611, 610}, -- Highmaul - Gladiator's Rest
    {C, 612, 610}, -- Highmaul - The Coliseum
    {C, 613, 610}, -- Highmaul - Chamber of Nullification
    {C, 614, 610}, -- Highmaul - Imperator's Rise
    {C, 615, 610}, -- Highmaul - Throne of the Imperator
    {A, 616, {1307, 2188, 9045, 9058, 9056, 9057, 9042, 9055, 10085, 8891, 8892, 8893, 8894, 9627}}, -- Upper Blackrock Spire - Dragonspire Hall
    {C, 617, 616}, -- Upper Blackrock Spire - The Rookery
    {C, 618, 616}, -- Upper Blackrock Spire - Hall of Blackhand
    {A, 619, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 11846, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 46}}, -- Broken Isles
    {A, 620, {9017, 9493, 9223, 9044, 9053, 10083, 9001, 9002, 9003, 9004, 9624, 19083}}, -- The Everbloom - The Everbloom
    {C, 621, 620}, -- The Everbloom - The Overlook
    {C, 622, 588}, -- Stormshield
    {C, 624, 588}, -- Warspear
    {C, 626, 24}, -- Dalaran - The Hall of Shadows
    {A, 627, {10770, 12416, 12431, 12439, 11066, 10585, 10586}}, -- Dalaran - Dalaran
    {C, 628, 627}, -- Dalaran - The Underbelly
    {C, 629, 627}, -- Dalaran - Aegwynn's Gallery
    {A, 630, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 10763, 10665, 11175, 11256, 11261, 11475, 46}}, -- Azsuna
    {C, 631, 630}, -- Azsuna - Nar'thalas Academy
    {C, 632, 630}, -- Azsuna - Oceanus Cove
    {C, 633, 630}, -- Azsuna - Temple of a Thousand Lights
    {A, 634, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 10790, 10793, 11232, 11427, 10668, 10627, 11259, 11263, 11178, 11476, 46}}, -- Stormheim
    {C, 635, 634}, -- Stormheim - Shield's Rest
    {C, 636, 634}, -- Stormheim - Stormscale Cavern
    {C, 637, 634}, -- Stormheim - Thorignir Refuge - Floor 1
    {C, 638, 634}, -- Stormheim - Thorignir Refuge - Floor 2
    {C, 639, 634}, -- Stormheim - Aggramar's Vault
    {C, 640, 634}, -- Stormheim - Vault of Eyir
    {A, 641, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 10698, 10666, 11258, 11262, 11477, 46}}, -- Val'sharah
    {C, 642, 641}, -- Val'sharah - Darkpens
    {C, 643, 641}, -- Val'sharah - Sleeper's Barrow - Lower Sleepers Barrow
    {C, 644, 641}, -- Val'sharah - Sleeper's Barrow - Upper Sleepers Barrow
    {A, 646, {11446, 11846, 11652, 11653, 11786, 11607, 11546, 11681, 11731, 11732, 11735, 11736, 11737, 11738, 11543, 11802, 11841, 11545, 11796}}, -- Broken Shore
    {C, 647, 24}, -- Acherus: The Ebon Hold - The Heart of Acherus
    {C, 648, 24}, -- Acherus: The Ebon Hold - Hall of Command
    {C, 649, 634}, -- Stormheim - Helheim
    {A, 650, {7520, 2556, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 10059, 10774, 10626, 10398, 11427, 10667, 11257, 11264, 11478, 12292, 46}}, -- Highmountain
    {C, 651, 650}, -- Highmountain - Bitestone Enclave
    {C, 652, 650}, -- Highmountain - Thunder Totem
    {C, 653, 650}, -- Highmountain - Cave of the Blood Trial
    {C, 654, 650}, -- Highmountain - Mucksnout Den
    {C, 655, 650}, -- Highmountain - Lifespring Cavern - Lifespring Lower Cavern
    {C, 656, 650}, -- Highmountain - Lifespring Cavern - Lifespring Upper Cavern
    {C, 657, 650}, -- Highmountain - Path of Huln - Floor 1
    {C, 658, 650}, -- Highmountain - Path of Huln - Floor 2
    {C, 659, 650}, -- Highmountain - Stonedark Grotto
    {C, 660, 650}, -- Highmountain - Feltotem Caverns
    {A, 661, {10023, 10024, 10025, 10020, 10019, 9680, 10044, 10045, 11631, 10026, 10057, 10013, 10054, 9972, 9979, 9988, 10086, 9989, 10012, 10087, 10030, 10073, 10027, 10032, 10033, 10034, 10035, 10253, 10037, 10040, 10041, 10038, 10039, 10042, 10043}}, -- Hellfire Citadel - Hellfire Citadel
    {C, 662, 661}, -- Hellfire Citadel - Hellfire Antechamber
    {C, 663, 661}, -- Hellfire Citadel - Hellfire Passage
    {C, 664, 661}, -- Hellfire Citadel - Pits of Mannoroth
    {C, 665, 661}, -- Hellfire Citadel - Court of Blood
    {C, 666, 661}, -- Hellfire Citadel - Grommash's Torment
    {C, 667, 661}, -- Hellfire Citadel - The Felborne Breach
    {C, 668, 661}, -- Hellfire Citadel - Halls of the Sargerei
    {C, 669, 661}, -- Hellfire Citadel - Destructor's Rise
    {C, 670, 661}, -- Hellfire Citadel - The Black Gate
    {C, 671, 634}, -- The Cove of Nashal
    {A, 680, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 14729, 11188, 10672, 11159, 11652, 11653, 10617, 11124, 10756, 11125, 11133, 11340, 11427, 10669, 11260, 11265, 10778, 46}}, -- Suramar
    {C, 681, 680}, -- Suramar - The Arcway Vaults
    {C, 682, 680}, -- Suramar - Felsoul Hold
    {C, 683, 680}, -- Suramar - The Arcway Vaults
    {C, 684, 680}, -- Suramar - Shattered Locus - Temple of Fal'adora
    {C, 685, 680}, -- Suramar - Shattered Locus - Falanaar Tunnels
    {C, 686, 680}, -- Suramar - Elor'shan
    {C, 687, 680}, -- Suramar - Kel'balor
    {C, 688, 680}, -- Suramar - Ley Station Anora
    {C, 689, 680}, -- Suramar - Ley Station Moonfall
    {C, 690, 680}, -- Suramar - Ley Station Aethenar
    {C, 691, 680}, -- Suramar - Nyell's Workshop
    {C, 695, 24}, -- Skyhold
    {C, 702, 24}, -- Netherlight Temple
    {A, 703, {11164, 11163, 11181, 10544, 10542, 10543, 10786, 10788, 10789, 16659}}, -- Halls of Valor - Halls of Valor
    {C, 704, 703}, -- Halls of Valor - The High Gate
    {C, 705, 703}, -- Halls of Valor - Halls of Valor
    {A, 706, {11164, 11163, 11181, 10413, 10411, 10412, 10807, 10808, 10809}}, -- Maw of Souls - Helmouth Cliffs - Helmouth Cliffs
    {C, 707, 706}, -- Maw of Souls - Helmouth Cliffs - The Hold
    {C, 708, 706}, -- Maw of Souls - Helmouth Cliffs - The Naglfar
    {C, 709, 24}, -- The Wandering Isle
    {A, 710, {11240, 11164, 11163, 11181, 10679, 10680, 10707, 10801, 10802, 10803}}, -- Vault of the Wardens - The Warden's Court
    {C, 711, 710}, -- Vault of the Wardens - Vault of the Wardens
    {C, 712, 710}, -- Vault of the Wardens - Vault of the Betrayer
    {A, 713, {11164, 11163, 11181, 10456, 10457, 10458, 10780, 10781, 10782}}, -- Eye of Azshara
    {C, 717, 24}, -- Dreadscar Rift
    {C, 718, 24}, -- Dreadscar Rift
    {C, 719, 24}, -- Mardum, the Shattered Abyss - Mardum, the Shattered Abyss
    {C, 720, 24}, -- Mardum, the Shattered Abyss - Upper Command Center
    {C, 721, 24}, -- Mardum, the Shattered Abyss - Lower Command Center
    {C, 725, 24}, -- The Maelstrom
    {C, 726, 24}, -- The Maelstrom
    {C, 729, 207}, -- Deepholm - Crumbling Depths
    {A, 731, {11164, 11163, 11181, 10996, 10875, 10795, 10796, 10797, 17850}}, -- Neltharion's Lair
    {A, 732, {11164, 11163, 10554, 10553, 10798, 10799, 10800}}, -- Violet Hold
    {A, 733, {11164, 11163, 11181, 10766, 10769, 10783, 10784, 10785, 19085}}, -- Darkheart Thicket
    {C, 734, 24}, -- Hall of the Guardian - Hall of the Guardian
    {C, 735, 24}, -- Hall of the Guardian - The Guardian's Library
    {C, 739, 24}, -- Trueshot Lodge
    {C, 747, 24}, -- The Dreamgrove
    {A, 749, {11181, 10773, 10775, 10776, 10813}}, -- The Arcway
    {C, 750, 650}, -- Highmountain - Thunder Totem
    {A, 751, {11164, 11163, 11181, 10710, 10709, 10711, 10804, 10805, 10806, 19084}}, -- Black Rook Hold - The Ravenscrypt
    {C, 752, 751}, -- Black Rook Hold - The Grand Hall
    {C, 753, 751}, -- Black Rook Hold - Ravenshold
    {C, 754, 751}, -- Black Rook Hold - The Rook's Roost
    {C, 755, 751}, -- Black Rook Hold - Lord Ravencrest's Chamber
    {C, 756, 751}, -- Black Rook Hold - The Raven's Crown
    {A, 761, {11181, 10610, 10611, 10816, 16658}}, -- Court of Stars - Court of Stars
    {C, 762, 761}, -- Court of Stars - The Jeweled Estate
    {C, 763, 761}, -- Court of Stars - The Balconies
    {A, 764, {11180, 10829, 10837, 10838, 10839, 11195, 11192, 11628, 10678, 10697, 10742, 10817, 10851, 10754, 10575, 10704, 10699, 10696, 10840, 10842, 10843, 10844, 10845, 10846, 10848, 10847, 10849, 10850}}, -- The Nighthold - The Nightwell
    {C, 765, 764}, -- The Nighthold - Arcing Depths
    {C, 766, 764}, -- The Nighthold - The Nighthold
    {C, 767, 764}, -- The Nighthold - Shal'Dorei Terrace
    {C, 768, 764}, -- The Nighthold - Captain's Quarters
    {C, 769, 764}, -- The Nighthold - Astromancer's Rise
    {C, 770, 764}, -- The Nighthold - The Nightspire
    {C, 771, 764}, -- The Nighthold - Elisande's Quarters
    {C, 772, 764}, -- The Nighthold - The Font of Night
    {A, 777, {11180, 10818, 10819, 10820, 11194, 11191, 10555, 10830, 10771, 10753, 10663, 10772, 10755, 10821, 10823, 10822, 10824, 10825, 10826, 10827}}, -- The Emerald Nightmare - Clutch of Corruption
    {C, 778, 777}, -- The Emerald Nightmare - Core of the Nightmare
    {C, 779, 777}, -- The Emerald Nightmare - Mulgore
    {C, 780, 777}, -- The Emerald Nightmare - Un'goro Crater
    {C, 781, 777}, -- The Emerald Nightmare - The Emerald Nightmare
    {C, 782, 777}, -- The Emerald Nightmare - Ashenvale
    {C, 783, 777}, -- The Emerald Nightmare - The Hinterlands
    {C, 784, 777}, -- The Emerald Nightmare - Duskwood
    {C, 785, 777}, -- The Emerald Nightmare - Feralas
    {C, 786, 777}, -- The Emerald Nightmare - Grizzly Hills
    {C, 787, 777}, -- The Emerald Nightmare - Moonglade
    {C, 788, 777}, -- The Emerald Nightmare - Rift of Aln
    {C, 789, 777}, -- The Emerald Nightmare - The Emerald Dream
    {A, 806, {11337, 11386, 11377, 11394, 11426, 11396, 11397, 11398, 11387, 11581, 11580, 11762}}, -- Trial of Valor - Trial of Valor
    {C, 807, 806}, -- Trial of Valor - Trial of Valor
    {C, 808, 806}, -- Trial of Valor - Helheim
    {A, 809, {11430, 11335, 11338, 11432, 11431, 11433, 11929, 11429, 15692, 15688, 15689, 15690}}, -- Karazhan - Servant's Quarters
    {C, 810, 809}, -- Karazhan - Upper Livery Stables
    {C, 811, 809}, -- Karazhan - The Banquet Hall
    {C, 812, 809}, -- Karazhan - The Guest Chambers
    {C, 813, 809}, -- Karazhan - Opera Hall Balcony
    {C, 814, 809}, -- Karazhan - Master's Terrace
    {C, 815, 809}, -- Karazhan - Lower Broken Stair
    {C, 816, 809}, -- Karazhan - Upper Broken Stair
    {C, 817, 809}, -- Karazhan - The Menagerie
    {C, 818, 809}, -- Karazhan - Guardian's Library
    {C, 819, 809}, -- Karazhan - Library Floor
    {C, 820, 809}, -- Karazhan - Upper Library
    {C, 821, 809}, -- Karazhan - Gamesman's Hall
    {C, 822, 809}, -- Karazhan - Netherspace
    {A, 830, {12066, 12073, 18854, 12074, 12084, 12028, 12026, 12069, 12077, 12078, 12083, 12101, 12102, 12103, 12104, 12076, 12081}}, -- Argus - Krokuun
    {C, 831, 830}, -- Argus - Krokuun - The Vindicaar - Upper Deck
    {C, 832, 830}, -- Argus - Krokuun - The Vindicaar - Lower Deck
    {C, 833, 830}, -- Argus - Krokuun - Nath'raxas Spire
    {C, 837, 93}, -- Arathi Basin
    {C, 844, 93}, -- Arathi Basin
    {A, 845, {11768, 11769, 11703, 11700, 11701, 11702}}, -- Cathedral of Eternal Night - Hall of the Moon
    {C, 846, 845}, -- Cathedral of Eternal Night - Twilight Grove
    {C, 847, 845}, -- Cathedral of Eternal Night - The Emerald Archives
    {C, 848, 845}, -- Cathedral of Eternal Night - Path of Illumination
    {C, 849, 845}, -- Cathedral of Eternal Night - Sacristy of Elune
    {A, 850, {11763, 11787, 11788, 11789, 11790, 11874, 11875, 11760, 11724, 11699, 11676, 11696, 11773, 11674, 11675, 11683, 11770, 11767, 11775, 11776, 11774, 11777, 11778, 11779, 11780, 11781}}, -- Tomb of Sargeras - Chamber of the Moon
    {C, 851, 850}, -- Tomb of Sargeras - The Abyssal Throne
    {C, 852, 850}, -- Tomb of Sargeras - Terrace of the Moon
    {C, 853, 850}, -- Tomb of Sargeras - The Guardian's Sanctum
    {C, 854, 850}, -- Tomb of Sargeras - Chamber of the Avatar
    {C, 855, 850}, -- Tomb of Sargeras - Felstorm's Breach
    {C, 856, 850}, -- Tomb of Sargeras - The Twisting Nether
    {C, 859, 92}, -- Warsong Gulch
    {A, 862, {7520, 12989, 13250, 46, 12587, 13294, 12479, 13512, 12510, 13466, 13517, 13144, 12482, 13036, 13029, 13027, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 11861, 12480, 12481, 13441, 13039, 13048, 13038, 12719, 13020, 12614, 13030, 13573, 13542, 13035, 13440, 12559, 12944, 12851, 12575, 13439, 13438, 12950, 12957, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Zuldazar
    {A, 863, {7520, 12989, 13250, 46, 12587, 13294, 12479, 13512, 12510, 13466, 13517, 13144, 12482, 13036, 13029, 13027, 14730, 12988, 13429, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 13026, 13025, 11868, 13048, 13023, 13022, 13021, 13426, 12561, 12942, 12771, 12588, 13024, 13028, 12574, 12948, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Nazmir
    {A, 864, {7520, 12989, 13250, 46, 12587, 13294, 12479, 13512, 12510, 13517, 13144, 12482, 13036, 13029, 13027, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12478, 13009, 13011, 13014, 13041, 13017, 13437, 12560, 12943, 12849, 13016, 13018, 12576, 12949, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Vol'dun
    {C, 865, 634}, -- Stormheim - Floor 1
    {C, 866, 634}, -- Stormheim - Floor 2
    {C, 867, 630}, -- Azsuna
    {C, 868, 641}, -- Val'sharah
    {C, 869, 650}, -- Highmountain - Floor 1
    {C, 870, 650}, -- Highmountain - Floor 2
    {A, 875, {7520, 12989, 13250, 46, 14183, 12587, 12555, 13294, 12479, 13512, 12510, 13466, 13925, 13924, 13517, 13144, 13263, 14157, 12482, 13036, 13029, 13027, 14730, 12988, 13429, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Zandalar
    {A, 876, {7520, 12989, 13250, 46, 14183, 12587, 12582, 12997, 12593, 12891, 13512, 13384, 12509, 13467, 13466, 13925, 13924, 13517, 13251, 13144, 14157, 13061, 14730, 12988, 13429, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Kul Tiras
    {C, 882, 830}, -- Argus - Eredath
    {C, 883, 830}, -- Argus - The Vindicaar - Upper Deck
    {C, 884, 830}, -- Argus - The Vindicaar - Lower Deck
    {C, 885, 830}, -- Argus - Antoran Wastes
    {C, 886, 830}, -- Argus - The Vindicaar - Upper Deck
    {C, 887, 830}, -- Argus - The Vindicaar - Lower Deck
    {C, 888, 119}, -- Hall of Communion
    {A, 895, {7520, 12989, 13250, 46, 12587, 12997, 12593, 12891, 13512, 13384, 12509, 13467, 13466, 13517, 13144, 13061, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12473, 13060, 13059, 13050, 13049, 12087, 13285, 12556, 12939, 12852, 13057, 13058, 12577, 12951, 12954, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Tiragarde Sound
    {A, 896, {7520, 2556, 12989, 13250, 46, 12587, 12997, 12593, 12891, 13512, 12509, 13517, 13144, 13061, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12497, 12557, 12941, 12995, 13087, 13083, 13082, 13064, 13094, 12579, 12952, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Drustvar
    {A, 903, {12004, 12005, 12009, 12007, 12008}}, -- The Seat of the Triumvirate
    {C, 905, 830}, -- Argus
    {A, 907, {12409, 12410, 12404, 12405, 12406, 12407, 12408, 12411, 12412}}, -- Seething Shore
    {A, 909, {11987, 11988, 11990, 11989, 11991, 12110, 12111, 12020, 11930, 12065, 12129, 11928, 12067, 11949, 12030, 11948, 12046, 11915, 12257, 11992, 11993, 11994, 11995, 11996, 11997, 11998, 11999, 12000, 12001, 12002}}, -- Antorus, the Burning Throne - Antorus, the Burning Throne
    {C, 910, 909}, -- Antorus, the Burning Throne - Gaze of the Legion
    {C, 911, 909}, -- Antorus, the Burning Throne - Halls of the Boundless Reach
    {C, 912, 909}, -- Antorus, the Burning Throne - Elunaria
    {C, 913, 909}, -- Antorus, the Burning Throne - Elarian Sanctuary
    {C, 914, 909}, -- Antorus, the Burning Throne - The Exhaust
    {C, 915, 909}, -- Antorus, the Burning Throne - The Burning Throne
    {C, 916, 909}, -- Antorus, the Burning Throne - Chamber of Anguish
    {C, 917, 909}, -- Antorus, the Burning Throne - The World Soul
    {C, 918, 909}, -- Antorus, the Burning Throne - Seat of the Pantheon
    {C, 919, 909}, -- Antorus, the Burning Throne - Upper Deck
    {C, 920, 909}, -- Antorus, the Burning Throne - Lower Deck
    {C, 921, 830}, -- Argus - Invasion Point: Aurinor
    {C, 922, 830}, -- Argus - Invasion Point: Bonich
    {C, 923, 830}, -- Argus - Invasion Point: Cen'gar
    {C, 924, 830}, -- Argus - Invasion Point: Naigtal
    {C, 925, 830}, -- Argus - Invasion Point: Sangua
    {C, 926, 830}, -- Argus - Invasion Point: Val
    {C, 927, 830}, -- Argus - Greater Invasion Point: Pit Lord Vilemus
    {C, 928, 830}, -- Argus - Greater Invasion Point: Mistress Alluradel
    {C, 929, 830}, -- Argus - Greater Invasion Point: Matron Folnuna
    {C, 930, 830}, -- Argus - Greater Invasion Point: Inquisitor Meto
    {C, 931, 830}, -- Argus - Greater Invasion Point: Sotanathor
    {C, 932, 830}, -- Argus - Greater Invasion Point: Occularus
    {A, 934, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12270, 12272, 12273, 12824, 12825, 12826, 19087}}, -- Atal'Dazar - Atal'Dazar
    {C, 935, 934}, -- Atal'Dazar - Sacrificial Pits
    {A, 936, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12550, 12548, 12998, 12831, 12832, 12833, 17848}}, -- Freehold
    {A, 942, {7520, 12989, 13250, 46, 12587, 12997, 12593, 12891, 13512, 12509, 13517, 13144, 13061, 14730, 12988, 13429, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12496, 13054, 13053, 13047, 13046, 13045, 13042, 13062, 12558, 12940, 12853, 13051, 12578, 12953, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Stormsong Valley
    {A, 943, {12881, 12873, 13737, 13735, 12888, 12877, 12889, 12876, 12884, 12878, 12886, 12879, 13739, 13738, 12874}}, -- Battle for Stromgarde
    {A, 974, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12457, 12462, 12840, 12841, 12842}}, -- Tol Dagor - Tol Dagor
    {C, 975, 974}, -- Tol Dagor - The Drain
    {C, 976, 974}, -- Tol Dagor - The Brig
    {C, 977, 974}, -- Tol Dagor - Detention Block
    {C, 978, 974}, -- Tol Dagor - Officer Quarters
    {C, 979, 974}, -- Tol Dagor - Overseer's Redoubt
    {C, 980, 974}, -- Tol Dagor - Overseer's Summit
    {A, 981, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 12590, 12589, 12591, 12592}}, -- Un'gol Ruins
    {A, 1004, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12722, 12721, 12723, 12848}}, -- Kings' Rest
    {A, 1010, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12855, 12854, 12844, 12845, 12846, 40965}}, -- The MOTHERLODE!!
    {A, 1015, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12495, 12490, 12489, 12483, 12484, 12488, 19086}}, -- Waycrest Manor - The Grand Foyer
    {C, 1016, 1015}, -- Waycrest Manor - Upstairs
    {C, 1017, 1015}, -- Waycrest Manor - The Cellar
    {C, 1018, 1015}, -- Waycrest Manor - Catacombs
    {A, 1021, {12918, 13998, 13572, 13769, 13770, 13771, 13772, 13773, 13775, 13777, 13779, 14143, 13994, 14060, 14061, 14062, 14064, 14066, 14063, 14065, 14067, 14162, 14165, 14166, 14167, 14168, 14169, 14170, 14171, 14172, 14173, 14140}}, -- Chamber of Heart
    {C, 1029, 1015}, -- Waycrest Manor - The Rupture
    {A, 1032, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13107, 13108, 13109, 13110}}, -- Skittering Hollow
    {A, 1033, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13103, 13104, 13105, 13106}}, -- The Rotting Mire
    {A, 1034, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13111, 13112, 13113, 13114}}, -- Verdant Wilds
    {A, 1035, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13099, 13100, 13101, 13102}}, -- Molten Cay
    {A, 1036, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13095, 13096, 13097, 13098}}, -- The Dread Chain
    {A, 1037, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13119, 13118, 13116, 13115}}, -- Whispering Reef
    {A, 1038, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12507, 12503, 12508, 12504, 12505, 12506}}, -- Temple of Sethraliss - Temple of Sethraliss
    {A, 1039, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12600, 12601, 12602, 12835, 12837, 12838}}, -- Shrine of the Storm - Shrine of the Storm
    {C, 1040, 1039}, -- Shrine of the Storm - Storm's End
    {A, 1041, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12498, 12549, 12499, 12500, 12501, 12502, 17849}}, -- The Underrot - The Underrot
    {C, 1042, 1041}, -- The Underrot - Ruin's Descent
    {C, 1043, 1038}, -- Temple of Sethraliss - Atrium of Sethraliss
    {C, 1044, 943}, -- Battle for Stromgarde
    {C, 1045, 896}, -- Drustvar - Thros, The Blighted Lands
    {A, 1148, {12806, 12521, 12522, 12523, 40960, 12536, 12535, 12991, 12937, 12938, 12828, 12823, 12772, 12830, 12836, 12551, 12524, 12526, 12527, 12530, 12529, 12531, 12532, 12533}}, -- Uldir - Ruin's Descent
    {C, 1149, 1148}, -- Uldir - Hall of Sanitation
    {C, 1150, 1148}, -- Uldir - Ring of Containment
    {C, 1151, 1148}, -- Uldir - Archives of Eternity
    {C, 1152, 1148}, -- Uldir - Plague Vault
    {C, 1153, 1148}, -- Uldir - Gallery of Failures
    {C, 1154, 1148}, -- Uldir - The Oblivion Door
    {C, 1155, 1148}, -- Uldir - The Festering Core
    {A, 1161, {7520, 12997, 12593, 12891, 13384, 12510, 13467, 13517, 13061, 12741, 13056, 12738, 12739, 12740, 12867, 12896, 12869, 12898, 12870, 12899, 12872, 40957}}, -- Tiragarde Sound - Boralus
    {A, 1162, {12807, 12812, 13075, 13079, 13080, 13448, 13449, 13780, 13781, 14144, 14145, 12727, 12726, 12489, 12847, 20587}}, -- Siege of Boralus
    {A, 1165, {7520, 13294, 12479, 12509, 13466, 13517, 13036, 12741, 13056, 12738, 12739, 12740, 12867, 12896, 12869, 12898, 12870, 12899, 12872, 40957}}, -- Zuldazar - Dazar'alor
    {C, 1166, 862}, -- Zanchul - Council Chambers
    {C, 1167, 862}, -- Zanchul - Hall of the High Priests
    {C, 1169, 895}, -- Tiragarde Sound - Tol Dagor
    {C, 1171, 895}, -- Tiragarde Sound - Gol Thovas - Lower Cave
    {C, 1172, 895}, -- Tiragarde Sound - Gol Thovas - Upper Cave
    {C, 1173, 862}, -- Zuldazar - Rastakhan's Might - Upper Decks
    {C, 1174, 862}, -- Zuldazar - Rastakhan's Might - Lower Decks
    {C, 1176, 862}, -- Zuldazar - Breath Of Pa'ku - Upper Deck
    {C, 1177, 862}, -- Zuldazar - Breath Of Pa'ku - Lower Deck
    {C, 1179, 942}, -- Stormsong Valley - Abyssal Melody - Upper Deck
    {C, 1180, 942}, -- Stormsong Valley - Abyssal Melody - Lower Deck
    {C, 1182, 942}, -- Stormsong Valley - Saltstone Mine
    {C, 1183, 942}, -- Stormsong Valley - Thornheart
    {C, 1184, 895}, -- Tiragarde Sound - Winterchill Mine - Lower Cave
    {C, 1185, 895}, -- Tiragarde Sound - Winterchill Mine - Upper Cave
    {A, 1203, {13297, 13296, 14150, 14149, 13302, 13301, 13305, 13306, 13308, 13307, 13310, 13309}}, -- The Battle for Darkshore
    {C, 1332, 1203}, -- The Battle for Darkshore
    {C, 1333, 1203}, -- The Battle for Darkshore
    {C, 1334, 123}, -- Wintergrasp
    {A, 1336, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13396, 13397, 13398, 13400}}, -- Havenswood
    {A, 1337, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13389, 13394, 13395, 13399}}, -- Jorundall
    {C, 1338, 1203}, -- The Battle for Darkshore
    {C, 1339, 92}, -- Warsong Gulch
    {A, 1345, {13501, 13506, 13414, 13416, 13417, 13418, 13419}}, -- Crucible of Storms - Shrine of Shadows
    {C, 1346, 1345}, -- Crucible of Storms - Tendril of Corruption
    {A, 1352, {13315, 13286, 13289, 13287, 13290, 13288, 13291, 40961, 13322, 13323, 13385, 13316, 13431, 13383, 13345, 13325, 13425, 13401, 13430, 13410, 13292, 13298, 13293, 13295, 13299, 13300, 13311, 13312, 13313, 13314}}, -- Battle of Dazar'alor - Port of Zandalar
    {C, 1353, 1352}, -- Battle of Dazar'alor - Halls of Opulence
    {C, 1354, 1352}, -- Battle of Dazar'alor - Loa's Sanctum
    {A, 1355, {13250, 12572, 12573, 12605, 12604, 13710, 13709, 13712, 13635, 13690, 13691, 13692, 13743, 13746, 13753, 13749, 13758, 13750, 13744, 13747, 13754, 13751, 13759, 13756, 13745, 13748, 13755, 13752, 13760, 13757, 13704, 13645, 13762, 13761, 13711, 13765, 13549, 13722, 13699, 13713, 13707, 13763, 13764, 13836, 13638, 13569, 13568, 13720, 13558, 13559, 12571}}, -- Nazjatar
    {C, 1356, 1352}, -- Battle of Dazar'alor - Walk of Kings
    {C, 1357, 1352}, -- Battle of Dazar'alor - Heart of the Empire
    {C, 1358, 1352}, -- Battle of Dazar'alor - The Zocalo
    {C, 1361, 87}, -- OldIronforge
    {C, 1364, 1352}, -- Battle of Dazar'alor - The Great Sea
    {C, 1366, 93}, -- Arathi Basin
    {C, 1367, 1352}, -- Battle of Dazar'alor - Boralus
    {C, 1375, 140}, -- Halls of Stone
    {C, 1383, 93}, -- Arathi Basin
    {C, 1404, 123}, -- Wintergrasp
    {C, 1408, 588}, -- Ashran
    {A, 1409, {14222}}, -- Exile's Reach
    {C, 1411, 1}, -- Durotar (Wrath Classic)
    {C, 1412, 7}, -- Mulgore (Wrath Classic)
    {C, 1414, 12}, -- Kalimdor (Wrath Classic)
    {C, 1415, 13}, -- Eastern Kingdoms (Wrath Classic)
    {C, 1417, 14}, -- Arathi Highlands (Wrath Classic)
    {C, 1418, 15}, -- Badlands (Wrath Classic)
    {C, 1419, 17}, -- Blasted Lands (Wrath Classic)
    {C, 1420, 18}, -- Tirisfal Glades (Wrath Classic)
    {C, 1421, 21}, -- Silverpine Forest (Wrath Classic)
    {C, 1422, 22}, -- Western Plaguelands (Wrath Classic)
    {C, 1423, 23}, -- Eastern Plaguelands (Wrath Classic)
    {C, 1424, 25}, -- Hillsbrad Foothills (Wrath Classic)
    {C, 1425, 26}, -- The Hinterlands (Wrath Classic)
    {C, 1426, 27}, -- Dun Morogh (Wrath Classic)
    {C, 1427, 32}, -- Searing Gorge (Wrath Classic)
    {C, 1428, 33}, -- Burning Steppes (Wrath Classic)
    {C, 1429, 37}, -- Elwynn Forest (Wrath Classic)
    {C, 1430, 42}, -- Deadwind Pass (Wrath Classic)
    {C, 1431, 47}, -- Duskwood (Wrath Classic)
    {C, 1432, 48}, -- Loch Modan (Wrath Classic)
    {C, 1433, 49}, -- Redridge Mountains (Wrath Classic)
    {A, 1434, {4906, 940, 941, 781, 17366, 948, 762}}, -- Stranglethorn Vale (Wrath Classic)
    {C, 1435, 51}, -- Swamp of Sorrows (Wrath Classic)
    {C, 1436, 52}, -- Westfall (Wrath Classic)
    {C, 1437, 56}, -- Wetlands (Wrath Classic)
    {C, 1438, 57}, -- Teldrassil (Wrath Classic)
    {C, 1439, 62}, -- Darkshore (Wrath Classic)
    {C, 1440, 63}, -- Ashenvale (Wrath Classic)
    {C, 1441, 64}, -- Thousand Needles (Wrath Classic)
    {C, 1442, 65}, -- Stonetalon Mountains (Wrath Classic)
    {C, 1443, 66}, -- Desolace (Wrath Classic)
    {C, 1444, 69}, -- Feralas (Wrath Classic)
    {C, 1445, 70}, -- Dustwallow Marsh (Wrath Classic)
    {C, 1446, 71}, -- Tanaris (Wrath Classic)
    {C, 1447, 76}, -- Azshara (Wrath Classic)
    {C, 1448, 77}, -- Felwood (Wrath Classic)
    {C, 1449, 78}, -- Un'Goro Crater (Wrath Classic)
    {C, 1450, 80}, -- Moonglade (Wrath Classic)
    {C, 1451, 81}, -- Silithus (Wrath Classic)
    {C, 1452, 83}, -- Winterspring (Wrath Classic)
    {C, 1453, 84}, -- Stormwind City (Wrath Classic)
    {C, 1454, 85}, -- Orgrimmar (Wrath Classic)
    {C, 1455, 87}, -- Ironforge (Wrath Classic)
    {C, 1456, 88}, -- Thunder Bluff (Wrath Classic)
    {C, 1457, 89}, -- Darnassus (Wrath Classic)
    {C, 1458, 90}, -- Undercity (Wrath Classic)
    {C, 1459, 91}, -- Alterac Valley (Wrath Classic)
    {C, 1460, 92}, -- Warsong Gulch (Wrath Classic)
    {C, 1461, 93}, -- Arathi Basin (Wrath Classic)
    {A, 1462, {13250, 12573, 12605, 12604, 13708, 13553, 13700, 13790, 13791, 13776, 13470, 13472, 13482, 13473, 13474, 13696, 13686, 13475, 13477, 13476, 13555, 13478, 13479, 13556, 13513, 13541, 13570, 13557, 12571}}, -- Mechagon Island
    {C, 1468, 24}, -- The Dreamgrove
    {A, 1469, {14143, 13994, 14060, 14061, 14062, 14064, 14066, 14063, 14065, 14067, 14162, 14165, 14166, 14167, 14168, 14169, 14170, 14171, 14172, 14173, 14140}}, -- Vision of Orgrimmar
    {C, 1470, 1469}, -- Vision of Stormwind
    {C, 1471, 24}, -- Emerald Dreamway
    {C, 1473, 1021}, -- Chamber of Heart
    {C, 1475, 24}, -- The Emerald Dream
    {C, 1478, 588}, -- Ashran
    {A, 1490, {14144, 14145, 13706, 13698, 13723, 13545, 13624, 13789, 15693, 15688, 15689, 15690, 40966}}, -- Mechagon - Mechagon Island
    {C, 1491, 1490}, -- Mechagon - The Robodrome
    {C, 1493, 1490}, -- Mechagon - Waste Pipes
    {C, 1494, 1490}, -- Mechagon - The Under Junk
    {C, 1497, 1490}, -- Mechagon - Mechagon City
    {A, 1501, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13577, 13578, 13579, 13580}}, -- Crestfall
    {A, 1502, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13581, 13582, 13583, 13584}}, -- Snowblossom Village
    {A, 1512, {13687, 13718, 13719, 13725, 40962, 13784, 13785, 13571, 13684, 13628, 13767, 13629, 13724, 13633, 13716, 13768, 13726, 13728, 13727, 13729, 13730, 13731, 13732, 13733}}, -- The Eternal Palace - Dais of Eternity
    {C, 1513, 1512}, -- The Eternal Palace - Halls of the Chosen
    {C, 1514, 1512}, -- The Eternal Palace - Darkest Depths
    {C, 1516, 1512}, -- The Eternal Palace - The Traverse
    {C, 1517, 1512}, -- The Eternal Palace - The Hatchery
    {C, 1518, 1512}, -- The Eternal Palace - The Queen's Court
    {C, 1519, 1512}, -- The Eternal Palace - Precipice of Dreams
    {C, 1520, 1512}, -- The Eternal Palace - The Last Prison
    {C, 1522, 1462}, -- Crumbling Cavern
    {A, 1525, {7520, 14280, 14758, 14825, 14731, 14515, 14516, 14519, 14315, 13878, 14798, 14233, 14765, 14766, 14772, 14306, 14310, 14314, 14277, 14274, 14272, 14276, 14769, 14771, 14770, 14273, 14512, 14338}}, -- Revendreth
    {A, 1527, {5548, 14153, 14161, 14160, 14159, 14158, 14155}}, -- Uldum
    {C, 1528, 1355}, -- Nazjatar - Raid Entrance
    {A, 1530, {14154, 14161, 14160, 14159, 14158, 14156}}, -- Vale of Eternal Blossoms
    {A, 1533, {7520, 14280, 14758, 14825, 14731, 14515, 14516, 14519, 14315, 14281, 14801, 14737, 14735, 14741, 14762, 14303, 14307, 14311, 14339, 14734, 14767, 14768, 14733, 14514, 14335}}, -- Bastion
    {C, 1534, 85}, -- Orgrimmar
    {A, 1536, {7520, 14280, 14758, 14825, 14731, 14515, 14516, 14519, 14315, 14206, 14799, 14305, 14308, 14312, 14626, 14802, 14721, 14634, 14513, 14336}}, -- Maldraxxus
    {C, 1537, 91}, -- Alterac Valley
    {A, 1543, {15064, 15648, 14334, 14961, 15000, 15001, 15037, 15039, 15041, 15043, 15042, 15044, 15035, 15036, 15034, 15033, 15032, 14663, 14658, 14659, 14660, 14738, 14742, 14743, 14744, 14745, 14746, 14747, 14761, 14894, 14895, 15054, 15107, 14943, 14656, 15059, 15004}}, -- The Maw
    {A, 1550, {14280, 14758, 15388, 14825, 14731, 14515, 14516, 14519, 14315, 15064, 7520}}, -- The Shadowlands
    {C, 1552, 74}, -- Caverns of Time
    {C, 1553, 74}, -- Caverns of Time
    {A, 1565, {7520, 14280, 14758, 14825, 14731, 14515, 14516, 14519, 14315, 14164, 14800, 14671, 14672, 14304, 14309, 14313, 14353, 14791, 14774, 14788, 14779, 14504, 14505, 14506, 14507, 14508, 14509, 14510, 14511, 14337}}, -- Ardenweald
    {C, 1570, 1530}, -- Vale of Eternal Blossoms
    {C, 1571, 1527}, -- Uldum
    {C, 1576, 519}, -- Deepwind Gorge
    {C, 1579, 1530}, -- Pools Of Power
    {A, 1580, {14146, 14193, 14194, 14195, 14196, 40963, 14068, 14069, 14058, 14019, 14008, 14037, 14024, 14139, 14023, 13999, 13990, 14026, 14038, 14147, 14148, 14041, 14043, 14044, 14045, 14050, 14046, 14051, 14048, 14049, 14052, 14054, 14055}}, -- Ny'alotha - Vision of Destiny
    {C, 1581, 1580}, -- Ny'alotha - Annex of Prophecy
    {C, 1582, 1580}, -- Ny'alotha - Ny'alotha
    {C, 1590, 1580}, -- Ny'alotha - The Hive
    {C, 1591, 1580}, -- Ny'alotha - Terrace of Desolation
    {C, 1592, 1580}, -- Ny'alotha - The Ritual Chamber
    {C, 1593, 1580}, -- Ny'alotha - Twilight Landing
    {C, 1594, 1580}, -- Ny'alotha - Maw of Gor'ma
    {C, 1595, 1580}, -- Ny'alotha - Warren of Decay
    {C, 1596, 1580}, -- Ny'alotha - Chamber of Rebirth
    {C, 1597, 1580}, -- Ny'alotha - Locus of Infinite Truths
    {C, 1600, 1530}, -- Vault of Y'Shaarj
    {C, 1604, 1021}, -- Chamber Of Heart
    {C, 1609, 1409}, -- Darkmaul Citadel - Bonebreaker Hall
    {C, 1610, 1409}, -- Darkmaul Citadel - Terrace of Reanimation
    {A, 1615, {14808, 14809, 14810, 15091, 15089, 15322, 14499, 14500, 14501, 14498, 14773, 14776, 14778, 14754, 14755, 14759, 14760, 14795, 15067, 15075, 15076, 15080, 15079, 15093, 15095, 15094, 15096, 15092, 15324, 14463, 15081, 15314, 14473, 15082, 15316, 14478, 15084, 15317, 14483, 15083, 15318, 14488, 15087, 15319, 14493, 15088, 15320, 14468, 14469, 14470, 14471, 14472, 14568, 14569, 14570, 15251, 15252, 15253, 15254, 15255, 15256, 15257, 15258}}, -- TG10_Floor [Deprecated]
    {C, 1616, 1615}, -- TG11_Floor [Deprecated]
    {C, 1617, 1615}, -- TG12_Floor [Deprecated]
    {C, 1618, 1615}, -- Torghast
    {C, 1619, 1615}, -- Torghast
    {C, 1620, 1615}, -- Torghast
    {C, 1621, 1615}, -- Torghast
    {C, 1623, 1615}, -- Torghast
    {C, 1624, 1615}, -- Torghast
    {C, 1627, 1615}, -- Torghast
    {C, 1628, 1615}, -- Torghast
    {C, 1629, 1615}, -- Torghast
    {C, 1630, 1615}, -- Torghast
    {C, 1631, 1615}, -- Torghast
    {C, 1632, 1615}, -- Torghast
    {C, 1635, 1615}, -- Torghast
    {C, 1636, 1615}, -- Torghast
    {C, 1641, 1615}, -- Torghast
    {A, 1644, {14678, 14679, 14680, 14681, 14682, 14683, 14723, 14724, 14725, 14726, 14727, 14749, 16731}}, -- Ember Court
    {C, 1645, 1615}, -- Torghast
    {C, 1649, 1536}, -- Maldraxxus - Etheric Vault
    {C, 1650, 1536}, -- Maldraxxus - Sightless Hold
    {C, 1651, 1536}, -- Maldraxxus - Molten Forge
    {C, 1652, 1536}, -- Maldraxxus - Vault of Souls
    {C, 1656, 1615}, -- Torghast - Map Floor 10 [Deprecated]
    {A, 1662, {14670, 14675, 14676, 14677, 14775, 14780, 14789}}, -- Queen's Conservatory
    {A, 1663, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14567, 14284, 14352, 14370, 14410, 14411, 15048}}, -- Halls of Atonement - Halls of Atonement
    {C, 1664, 1663}, -- Halls of Atonement - The Nave of Pain
    {C, 1665, 1663}, -- Halls of Atonement - The Sanctuary of Souls
    {A, 1666, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14295, 14320, 14285, 14366, 14367, 14368, 15045}}, -- The Necrotic Wake - The Necrotic Wake
    {C, 1667, 1666}, -- The Necrotic Wake - Stitchwerks
    {C, 1668, 1666}, -- The Necrotic Wake - Zolramus
    {A, 1669, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14503, 14291, 14375, 14371, 14412, 14413, 15047}}, -- Mists of Tirna Scithe
    {A, 1674, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14292, 14347, 14296, 14369, 14414, 14415, 15046}}, -- Plaguefall - Plaguefall
    {A, 1675, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14286, 14290, 14289, 14197, 14198, 14199, 15052}}, -- Sanguine Depths - Depths of Despair
    {C, 1676, 1675}, -- Sanguine Depths - Amphitheater of Sorrow
    {A, 1677, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14354, 14374, 14606, 14373, 14408, 14409, 15051}}, -- De Other Side - Ardenweald
    {C, 1678, 1677}, -- De Other Side - Mechagon
    {C, 1679, 1677}, -- De Other Side - Zul'Gurub
    {C, 1680, 1677}, -- De Other Side - De Other Side
    {A, 1683, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14297, 14607, 14533, 14372, 14416, 14417, 15050}}, -- Theater of Pain - Theater of Pain
    {C, 1684, 1683}, -- Theater of Pain - Chamber of Conquest
    {C, 1685, 1683}, -- Theater of Pain - Altars of Agony
    {C, 1686, 1683}, -- Theater of Pain - Upper Barrow of Carnage
    {C, 1687, 1683}, -- Theater of Pain - Lower Barrow of Carnage
    {C, 1690, 1533}, -- Bastion - Aspirant's Quarters
    {A, 1692, {14418, 15651, 14322, 11183, 11184, 11185, 11162, 14938, 14531, 14532, 15073, 15077, 15078, 15327, 15496, 15498, 15499, 15506, 15691, 14331, 14323, 14327, 14326, 14324, 14325, 15049}}, -- Spires Of Ascension - Honor's Ascent
    {C, 1693, 1692}, -- Spires Of Ascension - Gardens of Repose
    {C, 1694, 1692}, -- Spires Of Ascension - Font of Fealty
    {C, 1695, 1692}, -- Spires Of Ascension - Seat of the Archon
    {C, 1697, 1674}, -- Plaguefall - The Festering Sanctum
    {A, 1698, {14627, 14790, 15647, 14834, 14835, 14836, 14837, 14628, 14629, 14630, 14631, 15241, 15646, 14632, 14633, 14636, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14637, 14638, 14639, 14777, 15023, 15024, 15025, 15649, 14684, 14748, 14751, 14752, 14753, 14764, 14833, 14763}}, -- Seat of the Primus
    {A, 1699, {14627, 14790, 15647, 14834, 14835, 14836, 14837, 14628, 14629, 14630, 14631, 15241, 15646, 14632, 14633, 14636, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14637, 14638, 14639, 14777, 15023, 15024, 15025, 15649, 14678, 14679, 14680, 14681, 14682, 14683, 14723, 14724, 14725, 14726, 14727, 14749, 16731}}, -- Sinfall - Sinfall Reaches
    {C, 1700, 1699}, -- Sinfall - Sinfall Depths
    {A, 1701, {14627, 14790, 15647, 14834, 14835, 14836, 14837, 14628, 14629, 14630, 14631, 15241, 15646, 14632, 14633, 14636, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14637, 14638, 14639, 14777, 15023, 15024, 15025, 15649, 14670, 14675, 14676, 14677, 14775, 14780, 14789}}, -- Heart of the Forest - The Trunk
    {C, 1702, 1701}, -- Heart of the Forest - The Roots
    {C, 1703, 1701}, -- Heart of the Forest - The Canopy
    {C, 1705, 1615}, -- Torghast - Entrance
    {A, 1707, {14627, 14790, 15647, 14834, 14835, 14836, 14837, 14628, 14629, 14630, 14631, 15241, 15646, 14632, 14633, 14636, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14637, 14638, 14639, 14777, 15023, 15024, 15025, 15649, 14851, 14852, 14853, 14854, 14502, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14887}}, -- Elysian Hold - Archon's Rise
    {C, 1708, 1707}, -- Elysian Hold - Sanctum of Binding
    {A, 1711, {14851, 14852, 14853, 14854, 14502, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14887}}, -- Ascension Coliseum
    {C, 1712, 1615}, -- Torghast
    {C, 1713, 1533}, -- Bastion - Path of Wisdom
    {C, 1714, 1533}, -- Bastion - Third Chamber of Kalliope
    {C, 1716, 1615}, -- Torghast - Map Floor 22
    {C, 1720, 1615}, -- Covenant_Ard_Torghast
    {C, 1721, 1615}, -- Torghast
    {A, 1735, {14355, 14715, 14717, 14718, 14460, 14461, 14614, 15663, 15664, 15665, 14293, 14523, 14376, 14524, 14617, 14608, 14619, 14294, 14525, 14610, 14356, 14357, 14358, 14361, 14359, 14360, 14362, 14363, 14364, 14365}}, -- Castle Nathria - The Grand Walk
    {C, 1736, 1615}, -- Torghast
    {C, 1744, 1735}, -- Castle Nathria - The Purloined Stores
    {C, 1745, 1735}, -- Castle Nathria - Halls of the Faithful
    {C, 1746, 1735}, -- Castle Nathria - Pride's Prison
    {C, 1747, 1735}, -- Castle Nathria - Nightcloak Sanctum
    {C, 1748, 1735}, -- Castle Nathria - The Observatorium
    {C, 1749, 1615}, -- Torghast
    {C, 1750, 1735}, -- Castle Nathria - Feast of Arrogance
    {C, 1751, 1615}, -- Torghast
    {C, 1752, 1615}, -- Torghast
    {C, 1753, 1615}, -- Torghast
    {C, 1754, 1615}, -- Torghast
    {C, 1756, 1615}, -- Torghast
    {C, 1757, 1615}, -- Torghast
    {C, 1758, 1615}, -- Torghast
    {C, 1759, 1615}, -- Torghast
    {C, 1760, 1615}, -- Torghast
    {C, 1761, 1615}, -- Torghast
    {C, 1762, 1615}, -- Torghast, Tower of the Damned
    {C, 1763, 1615}, -- Torghast
    {C, 1764, 1615}, -- Torghast
    {C, 1765, 1615}, -- Torghast
    {C, 1766, 1615}, -- Torghast
    {C, 1767, 1615}, -- Torghast
    {C, 1768, 1615}, -- Torghast
    {C, 1769, 1615}, -- Torghast
    {C, 1770, 1615}, -- Torghast
    {C, 1771, 1615}, -- Torghast
    {C, 1772, 1615}, -- Torghast
    {C, 1773, 1615}, -- Torghast
    {C, 1774, 1615}, -- Torghast
    {C, 1776, 1615}, -- Torghast
    {C, 1777, 1615}, -- Torghast
    {C, 1778, 1615}, -- Torghast
    {C, 1779, 1615}, -- Torghast
    {C, 1780, 1615}, -- Torghast
    {C, 1781, 1615}, -- Torghast
    {C, 1782, 1615}, -- Torghast
    {C, 1783, 1615}, -- Torghast
    {C, 1784, 1615}, -- Torghast
    {C, 1785, 1615}, -- Torghast
    {C, 1786, 1615}, -- Torghast
    {C, 1787, 1615}, -- Torghast
    {C, 1788, 1615}, -- Torghast
    {C, 1789, 1615}, -- Torghast
    {C, 1791, 1615}, -- Torghast
    {C, 1792, 1615}, -- Torghast
    {C, 1793, 1615}, -- Torghast
    {C, 1794, 1615}, -- Torghast
    {C, 1795, 1615}, -- Torghast
    {C, 1796, 1615}, -- Torghast
    {C, 1797, 1615}, -- Torghast
    {C, 1798, 1615}, -- Torghast
    {C, 1799, 1615}, -- Torghast
    {C, 1800, 1615}, -- Torghast
    {C, 1801, 1615}, -- Torghast
    {C, 1802, 1615}, -- Torghast
    {C, 1803, 1615}, -- Torghast
    {C, 1804, 1615}, -- Torghast
    {C, 1805, 1615}, -- Torghast
    {C, 1806, 1615}, -- Torghast
    {C, 1807, 1615}, -- Torghast
    {C, 1808, 1615}, -- Torghast
    {C, 1809, 1615}, -- Torghast
    {C, 1810, 1615}, -- Torghast
    {C, 1811, 1615}, -- Torghast
    {C, 1812, 1615}, -- Torghast
    {C, 1816, 1565}, -- Ardenweald - Claw's Edge
    {C, 1818, 1565}, -- Ardenweald - Tirna Vaal
    {C, 1819, 1701}, -- Ardenweald - Fungal Terminus
    {C, 1820, 1543}, -- The Maw - Pit of Anguish - Pit of Anguish - Upper
    {C, 1821, 1543}, -- The Maw - Pit of Anguish - Pit of Anguish - Lower
    {C, 1822, 1543}, -- The Maw - Extractor's Sanatorium
    {C, 1823, 1543}, -- The Maw - Altar of Domination
    {C, 1824, 1565}, -- Ardenweald - Matriarch's Den
    {C, 1825, 1565}, -- Ardenweald - The Root Cellar
    {C, 1826, 1565}, -- Ardenweald - The Root Cellar
    {C, 1827, 1565}, -- Ardenweald - The Root Cellar
    {C, 1829, 1565}, -- Ardenweald - 
    {C, 1833, 1615}, -- Torghast
    {C, 1834, 1615}, -- Torghast - Map Floor 24
    {C, 1835, 1615}, -- Torghast - Map Floor 25
    {C, 1836, 1615}, -- Torghast - Map Floor 26
    {C, 1837, 1615}, -- Torghast - Map Floor 27
    {C, 1838, 1615}, -- Torghast - Map Floor 41
    {C, 1839, 1615}, -- Torghast - Map Floor 28
    {C, 1840, 1615}, -- Torghast - Map Floor 40
    {C, 1841, 1615}, -- Torghast - Map Floor 39
    {C, 1842, 1615}, -- Torghast - Map Floor 29
    {C, 1843, 1615}, -- Torghast - Map Floor 38
    {C, 1844, 1615}, -- Torghast - Map Floor 32
    {C, 1845, 1615}, -- Torghast - Map Floor 31
    {C, 1846, 1615}, -- Torghast - Map Floor 33
    {C, 1847, 1615}, -- Torghast - Map Floor 34
    {C, 1848, 1615}, -- Torghast - Map Floor 14
    {C, 1849, 1615}, -- Torghast - Map Floor 16
    {C, 1850, 1615}, -- Torghast - Map Floor 18
    {C, 1851, 1615}, -- Torghast - Map Floor 42
    {C, 1852, 1615}, -- Torghast - Map Floor 44
    {C, 1853, 1615}, -- Torghast - Map Floor 46
    {C, 1854, 1615}, -- Torghast - Map Floor 48
    {C, 1855, 1615}, -- Torghast - Map Floor 49
    {C, 1856, 1615}, -- Torghast - Map Floor 50
    {C, 1857, 1615}, -- Torghast - Map Floor 51
    {C, 1858, 1615}, -- Torghast - Map Floor 52
    {C, 1859, 1615}, -- Torghast - Map Floor 53
    {C, 1860, 1615}, -- Torghast - Map Floor 54
    {C, 1861, 1615}, -- Torghast - Map Floor 57
    {C, 1862, 1615}, -- Torghast - Map Floor 59
    {C, 1863, 1615}, -- Torghast - Map Floor 61
    {C, 1864, 1615}, -- Torghast - Map Floor 63
    {C, 1865, 1615}, -- Torghast - Map Floor 64
    {C, 1867, 1615}, -- Torghast - Map Floor 66
    {C, 1868, 1615}, -- Torghast - Map Floor 67
    {C, 1869, 1615}, -- Torghast - Map Floor 68
    {C, 1870, 1615}, -- Torghast - Map Floor 69
    {C, 1871, 1615}, -- Torghast - Map Floor 70
    {C, 1872, 1615}, -- Torghast - Map Floor 71
    {C, 1873, 1615}, -- Torghast - Map Floor 74
    {C, 1874, 1615}, -- Torghast - Map Floor 75
    {C, 1875, 1615}, -- Torghast - Map Floor 76
    {C, 1876, 1615}, -- Torghast - Map Floor 77
    {C, 1877, 1615}, -- Torghast - Map Floor 78
    {C, 1878, 1615}, -- Torghast - Map Floor 80
    {C, 1879, 1615}, -- Torghast - Map Floor 81
    {C, 1880, 1615}, -- Torghast - Map Floor 83
    {C, 1881, 1615}, -- Torghast - Map Floor 84
    {C, 1882, 1615}, -- Torghast - Map Floor 86
    {C, 1883, 1615}, -- Torghast - Map Floor 87
    {C, 1884, 1615}, -- Torghast - Map Floor 88
    {C, 1885, 1615}, -- Torghast - Map Floor 89
    {C, 1886, 1615}, -- Torghast - Map Floor 92
    {C, 1887, 1615}, -- Torghast - Map Floor 93
    {C, 1888, 1615}, -- Torghast - Map Floor 94
    {C, 1889, 1615}, -- Torghast - Map Floor 95
    {C, 1890, 1615}, -- Torghast - Map Floor 97
    {C, 1891, 1615}, -- Torghast - Map Floor 98
    {C, 1892, 1615}, -- Torghast - Map Floor 99
    {C, 1893, 1615}, -- Torghast - Map Floor 100
    {C, 1894, 1615}, -- Torghast - Map Floor 23
    {C, 1895, 1615}, -- Torghast - Map Floor 35
    {C, 1896, 1615}, -- Torghast - Map Floor 56
    {C, 1897, 1615}, -- Torghast - Map Floor 62
    {C, 1898, 1615}, -- Torghast - Map Floor 82
    {C, 1899, 1615}, -- Torghast - Map Floor 101
    {C, 1900, 1615}, -- Torghast - Map Floor 58
    {C, 1901, 1615}, -- Torghast - Map Floor 73
    {C, 1902, 1615}, -- Torghast - Map Floor 79
    {C, 1903, 1615}, -- Torghast - Map Floor 85
    {C, 1904, 1615}, -- Torghast - Map Floor 90
    {C, 1905, 1615}, -- Torghast - Map Floor 96
    {C, 1907, 1615}, -- Torghast - Map Floor 102
    {C, 1908, 1615}, -- Torghast - Map Floor 60
    {C, 1909, 1615}, -- Torghast - Map Floor 21
    {C, 1910, 1615}, -- Torghast - Map Floor 91
    {C, 1911, 1615}, -- Torghast - Entrance
    {C, 1912, 1615}, -- Torghast - The Runecarver's Oubliette
    {C, 1913, 1615}, -- Torghast
    {C, 1914, 1615}, -- Torghast
    {C, 1920, 1615}, -- Torghast
    {C, 1921, 1615}, -- Torghast
    {C, 1941, 94}, -- Eversong Woods (Wrath Classic)
    {C, 1942, 95}, -- Ghostlands (Wrath Classic)
    {C, 1943, 97}, -- Azuremyst Isle (Wrath Classic)
    {C, 1944, 100}, -- Hellfire Peninsula (Wrath Classic)
    {C, 1945, 101}, -- Outland (Wrath Classic)
    {C, 1946, 102}, -- Zangarmarsh (Wrath Classic)
    {C, 1947, 103}, -- The Exodar (Wrath Classic)
    {C, 1948, 104}, -- Shadowmoon Valley (Wrath Classic)
    {C, 1949, 105}, -- Blade's Edge Mountains (Wrath Classic)
    {C, 1950, 106}, -- Bloodmyst Isle (Wrath Classic)
    {C, 1951, 107}, -- Nagrand (Wrath Classic)
    {C, 1952, 108}, -- Terokkar Forest (Wrath Classic)
    {C, 1953, 109}, -- Netherstorm (Wrath Classic)
    {C, 1954, 110}, -- Silvermoon City (Wrath Classic)
    {C, 1955, 111}, -- Shattrath City (Wrath Classic)
    {C, 1956, 112}, -- Eye of the Storm (Wrath Classic)
    {C, 1957, 122}, -- Isle of Quel'Danas (Wrath Classic)
    {A, 1961, {15064, 15066, 15055, 15056, 15057, 15053, 15107, 15099, 15059, 15069}}, -- Korthia
    {C, 1962, 1615}, -- TG103_Floor
    {C, 1963, 1615}, -- TG104_FloorA
    {C, 1964, 1615}, -- TG104_FloorB
    {C, 1965, 1615}, -- TG105_FloorA
    {C, 1966, 1615}, -- TG105_FloorB
    {C, 1967, 1615}, -- TG106_Floor
    {C, 1968, 1615}, -- TG107_Floor
    {C, 1969, 1615}, -- TG108_Floor
    {A, 1970, {15229, 15336, 15259, 15515, 15518, 15224, 15391, 15392, 15331, 15211, 15402, 15502, 15406, 15407, 15410, 15411, 15508, 15404, 15509, 15512, 15513, 15514, 15542, 15220}}, -- Zereth Mortis
    {C, 1974, 1615}, -- TG109_FloorA
    {C, 1975, 1615}, -- TG109_FloorB
    {C, 1976, 1615}, -- TG112_FloorA
    {C, 1977, 1615}, -- TG112_FloorB
    {A, 1978, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478}}, -- Dragon Isles
    {C, 1979, 1615}, -- TG111_Floor
    {C, 1980, 1615}, -- TG114_Floor
    {C, 1981, 1615}, -- TG115_Floor
    {C, 1982, 1615}, -- TG116_Floor
    {C, 1983, 1615}, -- TG120_Floor
    {C, 1984, 1615}, -- TG113_Floor
    {C, 1985, 1615}, -- TG117_Floor
    {C, 1986, 1615}, -- TG118_Floor
    {C, 1987, 1615}, -- TG119_Floor
    {C, 1988, 1615}, -- TG121_Floor
    {A, 1989, {15496, 15498, 15499, 15506, 15691, 15688, 15689, 15690, 15109, 15106, 15179, 15190, 15178, 15177, 15650, 15652, 15500}}, -- Tazavesh, the Veiled Market - The Veiled Market
    {C, 1990, 1989}, -- Tazavesh, the Veiled Market - The Grand Menagerie
    {C, 1991, 1989}, -- Tazavesh, the Veiled Market - The P.O.S.T.
    {C, 1992, 1989}, -- Tazavesh, the Veiled Market - Myza's Oasis
    {C, 1993, 1989}, -- Tazavesh, the Veiled Market - The Opulent Nexus
    {C, 1995, 1989}, -- Tazavesh, the Veiled Market - Stormheim
    {C, 1996, 1989}, -- Tazavesh, the Veiled Market - Boralus Harbor
    {C, 1997, 1989}, -- Tazavesh, the Veiled Market - Aggramar's Vault
    {A, 1998, {15130, 15122, 15123, 15124, 15125, 15126, 15127, 15128, 15134, 15135, 15110, 15191, 15667, 15668, 15669, 14998, 15065, 15003, 15058, 15105, 15131, 15132, 15040, 15108, 15133, 15112, 15113, 15114, 15115, 15116, 15117, 15118, 15119, 15120, 15121}}, -- Sanctum of Domination - Tower of the Damned
    {C, 1999, 1998}, -- Sanctum of Domination - Shadowsteel Foundry
    {C, 2000, 1998}, -- Sanctum of Domination - The Torment Chambers
    {C, 2001, 1998}, -- Sanctum of Domination - Crown of Gorgoa
    {C, 2002, 1998}, -- Sanctum of Domination - Pinnacle of Domination
    {C, 2003, 1998}, -- Sanctum of Domination
    {C, 2004, 1998}, -- Sanctum of Domination
    {C, 2006, 1961}, -- Korthia - Cavern of Contemplation
    {C, 2007, 1961}, -- Korthia - Gromit Hollow
    {C, 2008, 1961}, -- Korthia - Chamber of the Sigil
    {C, 2009, 1615}, -- TG106_Floor_MM
    {C, 2010, 1615}, -- Torghast
    {C, 2011, 1615}, -- Torghast
    {C, 2012, 1615}, -- Torghast
    {A, 2022, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16334, 16401, 16400, 16676, 16297, 16411, 16412, 16410, 16406, 16409, 16494, 16495, 16496, 16497, 16584, 17561, 16493, 16736, 18559, 16592, 16539, 16532, 16536, 16760, 19479, 15991, 16051, 16669, 15990, 15987, 16053, 15988, 16052, 16668, 15985, 15989, 15986, 16575, 15915, 15916, 15917, 15927, 15928, 15929, 17195, 17196, 17197, 18748, 18749, 18750, 16463, 16465, 16466, 16467, 16468}}, -- The Waking Shores
    {A, 2023, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 15394, 16405, 16574, 17546, 17735, 18867, 16457, 16677, 16299, 16423, 16424, 16462, 16583, 17506, 17562, 16595, 41170, 41180, 16544, 16540, 16545, 16541, 16542, 16543, 19481, 16061, 16056, 16671, 16059, 16055, 16054, 16060, 16670, 16062, 16058, 16057, 16063, 16576, 15918, 15919, 15920, 15930, 15931, 15932, 17198, 17199, 17200, 18754, 18755, 18756, 16475, 16477, 16478, 16479, 16476}}, -- Ohn'ahran Plains
    {A, 2024, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16336, 16428, 15889, 16580, 17735, 18867, 17773, 16460, 16678, 16300, 16474, 16569, 16638, 16622, 16581, 17506, 17563, 16594, 41173, 41181, 16533, 16531, 16546, 16547, 16548, 16550, 16551, 16552, 16553, 16561, 16562, 16563, 16564, 16565, 16537, 16317, 16321, 16322, 16444, 16443, 17427, 19482, 16065, 16068, 16064, 16069, 16672, 16070, 16072, 16067, 16066, 16673, 16073, 16071, 16577, 15921, 15922, 15923, 15933, 15934, 15935, 17201, 17202, 17203, 18757, 18758, 18759, 16480, 16481, 16482, 16483, 16484}}, -- The Azure Span
    {A, 2025, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16363, 16398, 17342, 17343, 19507, 16518, 16679, 16301, 16634, 16621, 17564, 16593, 16104, 16102, 16666, 16667, 16100, 16099, 16098, 16107, 16103, 16101, 16106, 16105, 16578, 15924, 15925, 15926, 15936, 15937, 15938, 17204, 17205, 17206, 18760, 18761, 18762, 16485, 16486, 16487, 16488, 16489}}, -- Thaldraszus
    {C, 2027, 1970}, -- Zereth Mortis
    {C, 2028, 1970}, -- Zereth Mortis
    {C, 2029, 1970}, -- Zereth Mortis
    {C, 2030, 1970}, -- Zereth Mortis
    {C, 2031, 1970}, -- Zereth Mortis
    {A, 2047, {15492, 15493, 15416, 15418, 15417, 15478, 15490, 15396, 15468, 15469, 15470, 15471, 15409, 15681, 15682, 15683, 15381, 15401, 15398, 15397, 15400, 15419, 15386, 15399, 15315, 15494, 15479, 15480, 15481, 15482, 15483, 15484, 15485, 15486, 15487, 15488, 15489}}, -- Sepulcher of the First Ones
    {C, 2048, 2047}, -- Sepulcher of the First Ones
    {C, 2049, 2047}, -- Sepulcher of the First Ones
    {C, 2050, 2047}, -- Sepulcher of the First Ones
    {C, 2051, 2047}, -- Sepulcher of the First Ones
    {C, 2052, 2047}, -- Sepulcher of the First Ones
    {C, 2066, 1970}, -- Catalyst Wards
    {C, 2070, 18}, -- Tirisfal Glades
    {A, 2071, {16337, 16282, 16281, 16278, 16279, 16280, 16639}}, -- Uldaman - Hall of the Keepers
    {C, 2072, 2071}, -- Uldaman - The Vault of Tyr
    {A, 2073, {16445, 16331, 16330, 16272, 16273, 16274, 16645}}, -- The Azure Vault - The Arcane Conservatory
    {C, 2074, 2073}, -- The Azure Vault - Upper Chamber
    {C, 2075, 2073}, -- The Azure Vault - Mausoleum of Legends
    {C, 2076, 2073}, -- The Azure Vault -  - Lower Chamber
    {C, 2077, 2073}, -- The Azure Vault - Crystal Chambers
    {A, 2080, {16438, 16432, 16453, 16263, 16264, 16265, 16644}}, -- Neltharus - The Burning Cauldron
    {C, 2081, 2080}, -- Neltharus - Chamber of Flames
    {A, 2082, {16426, 16427, 16517, 16260, 16261, 16262, 16646}}, -- Halls of Infusion - Infuser's Rotunda
    {C, 2083, 2082}, -- Halls of Infusion - Infusion Chamber
    {A, 2085, {17342, 17343}}, -- The Primalist Future
    {A, 2093, {16447, 16456, 16602, 16620, 16275, 16276, 16277, 16641}}, -- The Nokhud Offensive
    {A, 2094, {16402, 16320, 16440, 16266, 16267, 16268, 16640}}, -- Ruby Life Pools - Ruby Overlook
    {C, 2095, 2094}, -- Ruby Life Pools - Infusion Chambers
    {A, 2096, {16110, 16296, 16430, 16404, 16762, 16255, 16256, 16257, 16642}}, -- Brackenhide Hollow - Brackenhide Hollow
    {A, 2097, {16434, 16329, 16441, 16269, 16270, 16271, 16643}}, -- Algeth'ar Academy - Algeth'ar Academy
    {C, 2098, 2097}, -- Algeth'ar Academy - The Pitch
    {C, 2099, 2097}, -- Algeth'ar Academy - The Headmaster's Enclave
    {A, 2100, {16452, 17534, 17315, 17524, 17525, 17526, 17527, 17528, 17529, 17530, 17531, 17532, 17397, 17413, 17509, 17543, 17398, 17399, 17400, 17401, 17402, 17403, 17404, 17405, 17411, 17279, 17280, 17281, 17284, 17286, 17287, 17288, 17289, 17290, 17294, 17296, 17298, 18779, 18780, 18781, 17540}}, -- The Siege Creche
    {C, 2101, 2100}, -- The Support Creche
    {C, 2102, 2100}, -- The War Creche
    {C, 2104, 123}, -- Wintergrasp (Wrath Classic)
    {C, 2106, 2096}, -- Brackenhide Hollow - Den of Decay
    {A, 2107, {15325, 15638}}, -- The Forbidden Reach (Dracthyr)
    {C, 2109, 2107}, -- The War Creche
    {C, 2110, 2107}, -- The Support Creche
    {C, 2111, 2107}, -- The Siege Creche
    {A, 2112, {16556, 17734, 18383, 18384, 17782, 16634}}, -- Valdrakken
    {A, 2119, {17110, 17111, 17112, 16343, 16345, 16354, 17107, 17108, 16395, 17119, 19564, 19565, 19566, 16335, 16365, 16364, 16419, 16458, 16450, 16442, 16451, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353}}, -- Vault of the Incarnates
    {C, 2120, 2119}, -- Vault of the Incarnates
    {C, 2121, 2119}, -- Vault of the Incarnates
    {C, 2122, 2119}, -- Vault of the Incarnates
    {C, 2123, 2119}, -- Vault of the Incarnates
    {C, 2124, 2119}, -- Vault of the Incarnates
    {C, 2125, 2119}, -- Vault of the Incarnates
    {C, 2126, 2119}, -- Vault of the Incarnates
    {A, 2133, {17785, 17841, 18271, 17766, 17783, 17786, 17741, 17781, 17567, 17832, 17833, 17878, 18100, 18255, 18257, 18284, 18361, 17851, 17852, 17510, 17511, 17512, 17513, 17514, 17515, 17516, 17517, 18150, 17483, 17484, 17485, 17486, 17487, 17488, 17489, 17490, 17491, 17492, 17493, 17494, 18786, 18787, 18788, 41175, 41183}}, -- Zaralek Cavern
    {C, 2150, 2100}, -- Dragonskull Island
    {C, 2151, 2100}, -- The Forbidden Reach
    {C, 2154, 2100}, -- Froststone Vault
    {A, 2166, {18163, 18164, 18165, 18167, 18160, 18161, 18162, 18253, 18254, 17765, 18256, 18027, 18380, 19567, 19568, 19569, 18229, 18168, 18173, 18228, 18230, 18193, 18172, 18149, 17877, 18151, 18152, 18153, 18154, 18155, 18156, 18157, 18158, 18159}}, -- Aberrus
    {C, 2167, 2166}, -- Aberrus
    {C, 2168, 2166}, -- Aberrus
    {C, 2169, 2166}, -- Aberrus
    {C, 2170, 2166}, -- Aberrus
    {C, 2171, 2166}, -- Aberrus
    {C, 2172, 2166}, -- Aberrus
    {C, 2173, 2166}, -- Aberrus
    {C, 2174, 2166}, -- Aberrus
    {C, 2184, 2133}, -- Zaralek Cavern
    {A, 2190, {18589, 18556, 18612, 18539, 18703, 18704, 18705, 18706, 19088}}, -- Sanctum of Chronology
    {C, 2191, 2190}, -- Millennia's Threshold
    {C, 2192, 2190}, -- Locus of Eternity
    {C, 2193, 2190}, -- Spoke of Endless Winter
    {C, 2194, 2190}, -- Crossroads of Fate
    {C, 2195, 2190}, -- Infinite Conflux
    {C, 2196, 2190}, -- Twisting Approach
    {C, 2197, 2190}, -- Immemorial Battlefield
    {C, 2198, 2190}, -- Dawn of the Infinite
    {A, 2199, {18554, 18615, 18635, 18636, 18637, 18638, 18639, 18640, 18641, 19485}}, -- Tyrhold Reservoir
    {A, 2200, {19318, 19026, 19293, 19309, 19316, 19317, 19013, 19194, 19196, 19198, 19461, 19294, 41176, 41177, 19296, 19297, 19298, 19299, 19300, 19301, 19302, 19303, 19306, 19109, 19110, 19111, 19112, 19113, 19114, 19115, 19116, 19117, 19118, 19119, 19120, 19121, 19122, 19123, 19124, 19125, 19126, 19127, 19128, 19129, 19310, 19312, 19313, 19315}}, -- Emerald Dream
    {C, 2201, 2199}, -- Azq'roth
    {C, 2202, 2199}, -- Azewrath
    {C, 2203, 2199}, -- Azmourne
    {C, 2204, 2199}, -- Azmerloth
    {C, 2205, 2199}, -- Ulderoth
    {C, 2206, 2199}, -- A.Z.E.R.O.T.H.
    {C, 2207, 2199}, -- The Warlands
    -- {A, 2213, {19559, 40636, 40832, 40833, 40835, 40620, 40869, 40822, 40828, 40840, 40705, 40542, 40634, 40624, 40632, 40843, 40629, 40727, 40633, 40086, 41149, 41164, 40874, 40875, 40876}}, -- City of Threads
    -- {A, 2214, {19560, 40799, 40507, 40623, 40630, 40825, 40837, 40724, 40703, 40628, 40473, 40475, 40614, 40731, 40504, 40585, 40662, 40084, 41165, 41166}}, -- The Ringing Deeps
    -- {A, 2215, {20598, 40844, 20594, 40150, 40082, 40360, 40308, 40311, 40312, 40313, 40826, 40848, 40851, 40704, 40151, 40618, 40625, 40622, 40729, 40085, 41167, 41168}}, -- Hallowfall
    -- {C, 2216, 2213}, -- City of Threads - Lower
    {A, 2232, {19344, 19345, 19346, 19347, 19331, 19333, 19334, 19350, 19351, 19442, 19450, 19396, 19420, 19570, 19571, 19572, 19322, 19320, 19321, 19193, 19089, 19394, 19319, 19393, 19390, 19335, 19336, 19337, 19338, 19339, 19340, 19341, 19342, 19343}}, -- Amirdrassil
    {C, 2233, 2232}, -- Amirdrassil
    {C, 2234, 2232}, -- Amirdrassil
    {C, 2235, 2232}, -- The Northern Boughs
    {C, 2236, 2232}, -- The Eastern Boughs
    {C, 2237, 2232}, -- The Southern Boughs
    {C, 2238, 2232}, -- Amirdrassil
    {C, 2240, 2232}, -- Amirdrassil
    {C, 2244, 2232}, -- Amirdrassil
    -- {A, 2248, {20118, 20595, 40831, 40435, 40434, 40166, 40606, 40083, 41161, 41162}}, -- Isle of Dorn
    -- {A, 2249, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40525, 40803, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Fungal Folly
    -- {A, 2250, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40526, 40807, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Kriegval's Rest
    -- {A, 2251, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40528, 40816, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- The Waterworks
    {C, 2253, 2200}, -- Sor'theril Barrow Den
    {C, 2254, 2200}, -- Barrows of Reverie
    -- {C, 2255, 2213}, -- Azj-Kahet
    -- {C, 2256, 2213}, -- Azj-Kahet - Lower
    -- {A, 2259, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40535, 40811, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Tak-Rethan Abyss
    -- {A, 2269, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40527, 40806, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Earthcrawl Mines
    -- {A, 2277, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40530, 40809, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Nightfall Sanctum
    -- {A, 2291, {40247, 40248, 40249, 40244, 40245, 40246, 40253, 40254, 40469, 40660, 40723, 40261, 40260, 40255, 40262, 40263, 40264, 40730, 40266, 40236, 40237, 40238, 40239, 40240, 40241, 40242, 40243}}, -- The Pulsing Pit
    -- {C, 2292, 2291}, -- Nerub-ar Palace - Grand Rampart
    -- {C, 2293, 2291}, -- Terrace of Majesty
    -- {C, 2294, 2291}, -- The Narthex
    -- {C, 2295, 2291}, -- The Crown of Shadows
    -- {C, 2296, 2291}, -- The Crown of Shadows - Upper
    -- {A, 2299, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40534, 40815, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- The Underkeep
    -- {A, 2301, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40532, 40813, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- The Sinkhole
    -- {A, 2302, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40529, 40812, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- The Dread Pit
    -- {A, 2303, {40427, 40428, 40429, 20584}}, -- Darkflame Cleft
    -- {A, 2308, {40590, 40592, 40596, 20581}}, -- Priori of the Sacred Flame - Sanctified Grounds
    -- {C, 2309, 2308}, -- Priori of the Sacred Flame
    -- {A, 2310, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40533, 40810, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Skittering Breach
    -- {A, 2312, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40531, 40808, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Mycomancer Cavern
    -- {A, 2315, {40621, 40637, 40642, 20579}}, -- The Rookery - The Rookery Landing
    -- {C, 2316, 2315}, -- Storm's Roost
    -- {C, 2317, 2315}, -- Storm Rookery
    -- {C, 2318, 2315}, -- Stormrider Barracks
    -- {C, 2319, 2315}, -- Crashing Storm Hall
    -- {C, 2320, 2315}, -- Abandoned Mines
    -- {C, 2322, 2248}, -- Hall of Awakening
    -- {A, 2328, {40859, 40860}}, -- Khaz Algar - Proscenium
    -- {A, 2335, {40361, 40363, 40366, 20583}}, -- Cinderbrew Meadery
    -- {C, 2339, 2248}, -- Dornogal
    -- {A, 2341, {40643, 40644, 40648, 20580}}, -- The Stonevault
    -- {A, 2343, {40376, 40377, 40379, 20582}}, -- City of Threads
    -- {C, 2344, 2343}, -- City of Threads - The Transformatory
    -- {A, 2347, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40536, 40814, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- The Spiral Weave
    -- {A, 2348, {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40515, 40516, 40517, 40518, 40519, 40520, 40521, 40726, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40438, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40524, 40763, 40789, 40458, 40538, 40820, 40523, 40635, 40732, 40103, 40431, 40433, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}}, -- Zekvir's Lair
    -- {A, 2357, {40370, 40374, 40375, 20586}}, -- Ara-Kara, City of Echoes - Echoing Overlook
    -- {C, 2358, 2357}, -- Ara-Kara, City of Echoes - The Undercache
    -- {A, 2359, {40599, 40601, 40604, 20585}}, -- The Dawnbreaker
    -- {C, 2367, 2248}, -- Vault of Memory
    -- {C, 2368, 2248}, -- Hall of Awakening
    -- {A, 2369, {41042, 41043, 41045, 41046, 41050, 41131, 41133, 41185}}, -- Siren Isle
    -- {C, 2375, 2369}, -- The Forgotten Vault
    -- { -- Excavation Site 9
    --     A,
    --     2396,
    --     {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40763, 40458, 40538, 40820, 40523, 40635, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}
    -- },
    -- { -- Sidestreet Sluice
    --     A,
    --     {2420, 2421, 2422, 2423},
    --     {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40763, 40458, 40538, 40820, 40523, 40635, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}
    -- },
    -- { -- Demolition Dome
    --     A,
    --     2425,
    --     {40436, 40460, 40462, 40463, 40819, 40788, 40882, 40885, 40817, 40863, 40864, 40631, 40512, 40514, 40725, 40537, 40506, 40445, 40446, 40452, 40453, 40454, 40437, 40447, 40448, 40449, 40455, 40450, 40451, 40456, 40457, 40461, 40100, 40098, 40459, 40763, 40458, 40538, 40820, 40523, 40635, 41191, 41192, 41198, 41193, 41194, 41195, 41196, 41197}
    -- },
};

-- EXCAVATION_SITE_9 = {2396};
-- SIDESTREET_SLUICE = {2420, 2421, 2422, 2423};