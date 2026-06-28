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

local function C(mId1, mId2)
    maps[mId1] = maps[mId2];
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-11-10 06-03-24 ]] --
tasks = {
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
    {A, 416, {7523, 7524, 7526, 7529, 7527, 7530, 7467, 7468}}, -- Theramore's Fall
    {A, 417, {6740, 6882, 6947, 6950, 6970, 6973, 6971, 6972, 6980, 6981}}, -- Temple of Kotmogu
    {A, 418, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 6754, 6846, 6850, 6855, 6856, 7230, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 6543, 6547, 6548, 6827, 6828, 6535, 6536, 7287, 7928, 7929, 6975, 7518, 7932, 9924, 8205, 8206, 6837, 7612, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 6616, 6589, 6606, 46, 19885, 19886, 20028, 19995, 19979, 19964, 19874, 19891, 19917, 19918, 19999, 19879}}, -- Krasarang Wilds
    {C, 419, 418}, -- Krasarang Wilds - Ruins of Ogudei - Alliance Excavation
    {C, 420, 418}, -- Krasarang Wilds - Ruins of Ogudei - Ruins of Ogudei
    {C, 421, 418}, -- Krasarang Wilds - Ruins of Ogudei - Reliquary Incursion
    {A, 422, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 6350, 6974, 6547, 6548, 6827, 6828, 6540, 7312, 7313, 7314, 7316, 6978, 6857, 6545, 8023, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 6616, 6589, 6606, 46, 19890, 19915, 20031, 19998, 19967, 19878}}, -- Dread Wastes
    {A, 423, {6739, 6883, 7039, 7049, 7057, 7062, 7099, 7100, 7102, 7103, 7106}}, -- Silvershard Mines
    {A, 424, {7520, 6558, 6559, 6560, 6607, 6601, 7498, 7499, 6611, 6590, 8348, 6541, 7285, 6716, 6754, 6846, 6850, 6847, 6855, 6856, 6858, 7230, 7994, 7995, 7996, 7997, 7281, 7282, 7283, 7284, 7437, 7438, 7439, 8078, 6350, 6974, 7479, 6543, 6547, 6548, 6827, 6828, 7331, 7332, 7333, 7338, 7358, 7339, 7359, 7340, 7360, 7341, 7361, 7342, 7362, 7343, 7363, 7344, 7364, 7345, 7365, 7346, 7366, 7347, 7367, 7334, 7335, 7337, 7336, 7348, 7368, 7349, 7369, 7350, 7370, 7351, 7371, 7352, 7372, 7373, 7353, 7354, 7374, 7355, 7375, 7356, 7376, 7357, 7377, 8220, 8221, 8222, 8223, 8224, 8225, 8226, 8227, 8228, 8229, 8230, 8231, 8232, 8233, 8234, 8235, 6616, 6589, 6606, 46}}, -- Pandaria
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
    {A, 619, {7520, 11190, 11446, 11160, 11157, 10877, 11189, 11186, 11544, 11846, 14729, 11188, 11474, 10672, 11159, 11652, 11653, 46}}, -- Broken Isles
    {A, 620, {9017, 9493, 9223, 9044, 9053, 10083, 9001, 9002, 9003, 9004, 9624, 19083}}, -- The Everbloom - The Everbloom
    {C, 621, 620}, -- The Everbloom - The Overlook
    {C, 622, 588}, -- Stormshield
    {C, 624, 588}, -- Warspear
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
    {C, 649, 634}, -- Stormheim - Helheim
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
    {A, 703, {11164, 11163, 11181, 10544, 10542, 10543, 10786, 10788, 10789, 16659}}, -- Halls of Valor - Halls of Valor
    {C, 704, 703}, -- Halls of Valor - The High Gate
    {C, 705, 703}, -- Halls of Valor - Halls of Valor
    {A, 706, {11164, 11163, 11181, 10413, 10411, 10412, 10807, 10808, 10809}}, -- Maw of Souls - Helmouth Cliffs - Helmouth Cliffs
    {C, 707, 706}, -- Maw of Souls - Helmouth Cliffs - The Hold
    {C, 708, 706}, -- Maw of Souls - Helmouth Cliffs - The Naglfar
    {A, 710, {11240, 11164, 11163, 11181, 10679, 10680, 10707, 10801, 10802, 10803}}, -- Vault of the Wardens - The Warden's Court
    {C, 711, 710}, -- Vault of the Wardens - Vault of the Wardens
    {C, 712, 710}, -- Vault of the Wardens - Vault of the Betrayer
    {A, 713, {11164, 11163, 11181, 10456, 10457, 10458, 10780, 10781, 10782}}, -- Eye of Azshara
    {C, 729, 207}, -- Deepholm - Crumbling Depths
    {A, 731, {11164, 11163, 11181, 10996, 10875, 10795, 10796, 10797, 17850}}, -- Neltharion's Lair
    {A, 732, {11164, 11163, 10554, 10553, 10798, 10799, 10800}}, -- Violet Hold
    {A, 733, {11164, 11163, 11181, 10766, 10769, 10783, 10784, 10785, 19085}}, -- Darkheart Thicket
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
    {A, 895, {7520, 12989, 13250, 46, 12587, 12997, 12593, 12891, 13512, 13384, 12509, 13467, 13466, 13517, 13144, 13061, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12473, 13060, 13059, 13050, 13049, 12087, 13285, 12556, 12939, 12852, 13057, 13058, 12577, 12951, 12954, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Tiragarde Sound
    {A, 896, {7520, 2556, 12989, 13250, 46, 12587, 12997, 12593, 12891, 13512, 12509, 13517, 13144, 13061, 14730, 12988, 12572, 12573, 12605, 12604, 12947, 12955, 12956, 12497, 12557, 12941, 12995, 13087, 13083, 13082, 13064, 13094, 12579, 12952, 13317, 13283, 13284, 13387, 13388, 13402, 13403, 12571}}, -- Drustvar
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
    {A, 1336, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13396, 13397, 13398, 13400}}, -- Havenswood
    {A, 1337, {13142, 13122, 13141, 12596, 12594, 12595, 12597, 13120, 13121, 13129, 13123, 13124, 13125, 13126, 13127, 13128, 13132, 13133, 13135, 13134, 13701, 13702, 13703, 13389, 13394, 13395, 13399}}, -- Jorundall
    {C, 1338, 1203}, -- The Battle for Darkshore
    {A, 1345, {13501, 13506, 13414, 13416, 13417, 13418, 13419}}, -- Crucible of Storms - Shrine of Shadows
    {C, 1346, 1345}, -- Crucible of Storms - Tendril of Corruption
    {A, 1352, {13315, 13286, 13289, 13287, 13290, 13288, 13291, 40961, 13322, 13323, 13385, 13316, 13431, 13383, 13345, 13325, 13425, 13401, 13430, 13410, 13292, 13298, 13293, 13295, 13299, 13300, 13311, 13312, 13313, 13314}}, -- Battle of Dazar'alor - Port of Zandalar
    {C, 1353, 1352}, -- Battle of Dazar'alor - Halls of Opulence
    {C, 1354, 1352}, -- Battle of Dazar'alor - Loa's Sanctum
    {A, 1355, {13250, 12572, 12573, 12605, 12604, 13710, 13709, 13712, 13635, 13690, 13691, 13692, 13743, 13746, 13753, 13749, 13758, 13750, 13744, 13747, 13754, 13751, 13759, 13756, 13745, 13748, 13755, 13752, 13760, 13757, 13704, 13645, 13762, 13761, 13711, 13765, 13549, 13722, 13699, 13713, 13707, 13763, 13764, 13836, 13638, 13569, 13568, 13720, 13558, 13559, 12571}}, -- Nazjatar
    {C, 1356, 1352}, -- Battle of Dazar'alor - Walk of Kings
    {C, 1357, 1352}, -- Battle of Dazar'alor - Heart of the Empire
    {C, 1358, 1352}, -- Battle of Dazar'alor - The Zocalo
    {C, 1364, 1352}, -- Battle of Dazar'alor - The Great Sea
    {C, 1367, 1352}, -- Battle of Dazar'alor - Boralus
    {C, 1375, 140}, -- Halls of Stone
    {C, 1408, 588}, -- Ashran
    {A, 1409, {14222}}, -- Exile's Reach
    {A, 1434, {4906, 940, 941, 781, 17366, 948, 762}}, -- Stranglethorn Vale (Wrath Classic)
    {A, 1462, {13250, 12573, 12605, 12604, 13708, 13553, 13700, 13790, 13791, 13776, 13470, 13472, 13482, 13473, 13474, 13696, 13686, 13475, 13477, 13476, 13555, 13478, 13479, 13556, 13513, 13541, 13570, 13557, 12571}}, -- Mechagon Island
    {A, 1469, {14143, 13994, 14060, 14061, 14062, 14064, 14066, 14063, 14065, 14067, 14162, 14165, 14166, 14167, 14168, 14169, 14170, 14171, 14172, 14173, 14140}}, -- Vision of Orgrimmar
    {C, 1470, 1469}, -- Vision of Stormwind
    {C, 1473, 1021}, -- Chamber of Heart
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
    {A, 1527, {5548, 14153, 14161, 14160, 14159, 14158, 14155}}, -- Uldum
    {C, 1528, 1355}, -- Nazjatar - Raid Entrance
    {A, 1530, {14154, 14161, 14160, 14159, 14158, 14156}}, -- Vale of Eternal Blossoms
    {A, 1550, {14280, 14758, 15388, 14825, 14731, 14515, 14516, 14519, 14315, 15064, 7520}}, -- The Shadowlands
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
    {A, 1644, {14678, 14679, 14680, 14681, 14682, 14683, 14723, 14724, 14725, 14726, 14727, 14749, 16731}}, -- Ember Court
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
    {A, 1707, {14627, 14790, 15647, 14834, 14835, 14836, 14837, 14628, 14629, 14630, 14631, 15241, 15646, 14632, 14633, 14636, 14839, 14840, 14841, 14842, 14843, 14844, 14845, 14846, 14847, 14637, 14638, 14639, 14777, 15023, 15024, 15025, 15649, 14851, 14852, 14853, 14854, 14502, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14887}}, -- Elysian Hold - Archon's Rise
    {C, 1708, 1707}, -- Elysian Hold - Sanctum of Binding
    {A, 1711, {14851, 14852, 14853, 14854, 14502, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14887}}, -- Ascension Coliseum
    {C, 1819, 1701}, -- Ardenweald - Fungal Terminus
    {A, 1978, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478}}, -- Dragon Isles
    {A, 2022, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16334, 16401, 16400, 16676, 16297, 16411, 16412, 16410, 16406, 16409, 16494, 16495, 16496, 16497, 16584, 17561, 16493, 16736, 18559, 16592, 16539, 16532, 16536, 16760, 19479, 15991, 16051, 16669, 15990, 15987, 16053, 15988, 16052, 16668, 15985, 15989, 15986, 16575, 15915, 15916, 15917, 15927, 15928, 15929, 17195, 17196, 17197, 18748, 18749, 18750, 16463, 16465, 16466, 16467, 16468}}, -- The Waking Shores
    {A, 2023, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 15394, 16405, 16574, 17546, 17735, 18867, 16457, 16677, 16299, 16423, 16424, 16462, 16583, 17506, 17562, 16595, 41170, 41180, 16544, 16540, 16545, 16541, 16542, 16543, 19481, 16061, 16056, 16671, 16059, 16055, 16054, 16060, 16670, 16062, 16058, 16057, 16063, 16576, 15918, 15919, 15920, 15930, 15931, 15932, 17198, 17199, 17200, 18754, 18755, 18756, 16475, 16477, 16478, 16479, 16476}}, -- Ohn'ahran Plains
    {A, 2024, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16336, 16428, 15889, 16580, 17735, 18867, 17773, 16460, 16678, 16300, 16474, 16569, 16638, 16622, 16581, 17506, 17563, 16594, 41173, 41181, 16533, 16531, 16546, 16547, 16548, 16550, 16551, 16552, 16553, 16561, 16562, 16563, 16564, 16565, 16537, 16317, 16321, 16322, 16444, 16443, 17427, 19482, 16065, 16068, 16064, 16069, 16672, 16070, 16072, 16067, 16066, 16673, 16073, 16071, 16577, 15921, 15922, 15923, 15933, 15934, 15935, 17201, 17202, 17203, 18757, 18758, 18759, 16480, 16481, 16482, 16483, 16484}}, -- The Azure Span
    {A, 2025, {16585, 16291, 16292, 16808, 17739, 16683, 18958, 20206, 19463, 16761, 16446, 16298, 15890, 16323, 16338, 16729, 17830, 17977, 17978, 17560, 16589, 16590, 16599, 16601, 16603, 16612, 16611, 16613, 16614, 16616, 16615, 17335, 17336, 17345, 41172, 41174, 41171, 41182, 41179, 16571, 16560, 16566, 16567, 16568, 16572, 16573, 16570, 16587, 16588, 16591, 16600, 16623, 16624, 16625, 16758, 41184, 19466, 19483, 19486, 19478, 16363, 16398, 17342, 17343, 19507, 16518, 16679, 16301, 16634, 16621, 17564, 16593, 16104, 16102, 16666, 16667, 16100, 16099, 16098, 16107, 16103, 16101, 16106, 16105, 16578, 15924, 15925, 15926, 15936, 15937, 15938, 17204, 17205, 17206, 18760, 18761, 18762, 16485, 16486, 16487, 16488, 16489}}, -- Thaldraszus
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
    {A, 2100, {16452, 17534, 17315, 17524, 17525, 17526, 17527, 17528, 17529, 17530, 17531, 17532, 17397, 17413, 17509, 17543, 17398, 17399, 17400, 17401, 17402, 17403, 17404, 17405, 17411, 17279, 17280, 17281, 17284, 17286, 17287, 17288, 17289, 17290, 17294, 17296, 17298, 18779, 18780, 18781, 17540}}, -- The Siege Creche
    {C, 2101, 2100}, -- The Support Creche
    {C, 2102, 2100}, -- The War Creche
    {C, 2106, 2096}, -- Brackenhide Hollow - Den of Decay
    {A, 2107, {15325, 15638}}, -- The Forbidden Reach (Dracthyr)
    {C, 2109, 2107}, -- The War Creche
    {C, 2110, 2107}, -- The Support Creche
    {C, 2111, 2107}, -- The Siege Creche
    {A, 2112, {16556, 17734, 18383, 18384, 17782, 16634}}, -- Valdrakken
    {A, 2133, {17785, 17841, 18271, 17766, 17783, 17786, 17741, 17781, 17567, 17832, 17833, 17878, 18100, 18255, 18257, 18284, 18361, 17851, 17852, 17510, 17511, 17512, 17513, 17514, 17515, 17516, 17517, 18150, 17483, 17484, 17485, 17486, 17487, 17488, 17489, 17490, 17491, 17492, 17493, 17494, 18786, 18787, 18788, 41175, 41183}}, -- Zaralek Cavern
    {C, 2150, 2100}, -- Dragonskull Island
    {C, 2151, 2100}, -- The Forbidden Reach
    {C, 2154, 2100}, -- Froststone Vault
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
    {C, 2253, 2200}, -- Sor'theril Barrow Den
    {C, 2254, 2200}, -- Barrows of Reverie
};
