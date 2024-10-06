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
    N(id, "", achievementIds);
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

-- [[ Exported at 2024-09-12 20-08-20 ]] --
tasks = {
    {C, 2104, 123}, -- Wintergrasp (Wrath Classic)
    {C, 2070, 18}, -- Tirisfal Glades
    {C, 1957, 122}, -- Isle of Quel'Danas (Wrath Classic)
    {C, 1956, 112}, -- Eye of the Storm (Wrath Classic)
    {C, 1955, 111}, -- Shattrath City (Wrath Classic)
    {C, 1954, 110}, -- Silvermoon City (Wrath Classic)
    {C, 1953, 109}, -- Netherstorm (Wrath Classic)
    {C, 1952, 108}, -- Terokkar Forest (Wrath Classic)
    {C, 1951, 107}, -- Nagrand (Wrath Classic)
    {C, 1950, 106}, -- Bloodmyst Isle (Wrath Classic)
    {C, 1949, 105}, -- Blade's Edge Mountains (Wrath Classic)
    {C, 1948, 104}, -- Shadowmoon Valley (Wrath Classic)
    {C, 1947, 103}, -- The Exodar (Wrath Classic)
    {C, 1946, 102}, -- Zangarmarsh (Wrath Classic)
    {C, 1945, 101}, -- Outland (Wrath Classic)
    {C, 1944, 100}, -- Hellfire Peninsula (Wrath Classic)
    {C, 1943, 97}, -- Azuremyst Isle (Wrath Classic)
    {C, 1942, 95}, -- Ghostlands (Wrath Classic)
    {C, 1941, 94}, -- Eversong Woods (Wrath Classic)
    {C, 1571, 1527}, -- Uldum
    {C, 1553, 74}, -- Caverns of Time
    {C, 1552, 74}, -- Caverns of Time
    {C, 1537, 91}, -- Alterac Valley
    {C, 1534, 85}, -- Orgrimmar
    {A, 1527, {5548}}, -- Uldum
    {C, 1461, 93}, -- Arathi Basin (Wrath Classic)
    {C, 1460, 92}, -- Warsong Gulch (Wrath Classic)
    {C, 1459, 91}, -- Alterac Valley (Wrath Classic)
    {C, 1458, 90}, -- Undercity (Wrath Classic)
    {C, 1457, 89}, -- Darnassus (Wrath Classic)
    {C, 1456, 88}, -- Thunder Bluff (Wrath Classic)
    {C, 1455, 87}, -- Ironforge (Wrath Classic)
    {C, 1454, 85}, -- Orgrimmar (Wrath Classic)
    {C, 1453, 84}, -- Stormwind City (Wrath Classic)
    {C, 1452, 83}, -- Winterspring (Wrath Classic)
    {C, 1451, 81}, -- Silithus (Wrath Classic)
    {C, 1450, 80}, -- Moonglade (Wrath Classic)
    {C, 1449, 78}, -- Un'Goro Crater (Wrath Classic)
    {C, 1448, 77}, -- Felwood (Wrath Classic)
    {C, 1447, 76}, -- Azshara (Wrath Classic)
    {C, 1446, 71}, -- Tanaris (Wrath Classic)
    {C, 1445, 70}, -- Dustwallow Marsh (Wrath Classic)
    {C, 1444, 69}, -- Feralas (Wrath Classic)
    {C, 1443, 66}, -- Desolace (Wrath Classic)
    {C, 1442, 65}, -- Stonetalon Mountains (Wrath Classic)
    {C, 1441, 64}, -- Thousand Needles (Wrath Classic)
    {C, 1440, 63}, -- Ashenvale (Wrath Classic)
    {C, 1439, 62}, -- Darkshore (Wrath Classic)
    {C, 1438, 57}, -- Teldrassil (Wrath Classic)
    {C, 1437, 56}, -- Wetlands (Wrath Classic)
    {C, 1436, 52}, -- Westfall (Wrath Classic)
    {C, 1435, 51}, -- Swamp of Sorrows (Wrath Classic)
    {A, 1434, {4906, 940, 941, 781, 948, 762}}, -- Stranglethorn Vale (Wrath Classic)
    {C, 1433, 49}, -- Redridge Mountains (Wrath Classic)
    {C, 1432, 48}, -- Loch Modan (Wrath Classic)
    {C, 1431, 47}, -- Duskwood (Wrath Classic)
    {C, 1430, 42}, -- Deadwind Pass (Wrath Classic)
    {C, 1429, 37}, -- Elwynn Forest (Wrath Classic)
    {C, 1428, 33}, -- Burning Steppes (Wrath Classic)
    {C, 1427, 32}, -- Searing Gorge (Wrath Classic)
    {C, 1426, 27}, -- Dun Morogh (Wrath Classic)
    {C, 1425, 26}, -- The Hinterlands (Wrath Classic)
    {C, 1424, 25}, -- Hillsbrad Foothills (Wrath Classic)
    {C, 1423, 23}, -- Eastern Plaguelands (Wrath Classic)
    {C, 1422, 22}, -- Western Plaguelands (Wrath Classic)
    {C, 1421, 21}, -- Silverpine Forest (Wrath Classic)
    {C, 1420, 18}, -- Tirisfal Glades (Wrath Classic)
    {C, 1419, 17}, -- Blasted Lands (Wrath Classic)
    {C, 1418, 15}, -- Badlands (Wrath Classic)
    {C, 1417, 14}, -- Arathi Highlands (Wrath Classic)
    {C, 1415, 13}, -- Eastern Kingdoms (Wrath Classic)
    {C, 1414, 12}, -- Kalimdor (Wrath Classic)
    {A, 1413, {750, 762, 2336}}, -- The Barrens (Wrath Classic)
    {C, 1412, 7}, -- Mulgore (Wrath Classic)
    {C, 1411, 1}, -- Durotar (Wrath Classic)
    {C, 1404, 123}, -- Wintergrasp
    {C, 1383, 93}, -- Arathi Basin
    {C, 1375, 140}, -- Halls of Stone
    {C, 1366, 93}, -- Arathi Basin
    {C, 1361, 87}, -- OldIronforge
    {C, 1339, 92}, -- Warsong Gulch
    {C, 1334, 123}, -- Wintergrasp
    {C, 1185, 371}, -- Tiragarde Sound - Winterchill Mine - Upper Cave
    {C, 1184, 371}, -- Tiragarde Sound - Winterchill Mine - Lower Cave
    {C, 1183, 371}, -- Stormsong Valley - Thornheart
    {C, 1182, 371}, -- Stormsong Valley - Saltstone Mine
    {C, 1180, 371}, -- Stormsong Valley - Abyssal Melody - Lower Deck
    {C, 1179, 371}, -- Stormsong Valley - Abyssal Melody - Upper Deck
    {C, 1177, 371}, -- Zuldazar - Breath Of Pa'ku - Lower Deck
    {C, 1176, 371}, -- Zuldazar - Breath Of Pa'ku - Upper Deck
    {C, 1174, 371}, -- Zuldazar - Rastakhan's Might - Lower Decks
    {C, 1173, 371}, -- Zuldazar - Rastakhan's Might - Upper Decks
    {C, 1172, 371}, -- Tiragarde Sound - Gol Thovas - Upper Cave
    {C, 1171, 371}, -- Tiragarde Sound - Gol Thovas - Lower Cave
    {C, 1169, 371}, -- Tiragarde Sound - Tol Dagor
    {C, 1167, 371}, -- Zanchul - Hall of the High Priests
    {C, 1166, 371}, -- Zanchul - Council Chambers
    {C, 1045, 539}, -- Drustvar - Thros, The Blighted Lands
    {C, 942, 371}, -- Stormsong Valley
    {C, 896, 539}, -- Drustvar
    {C, 895, 371}, -- Tiragarde Sound
    {C, 888, 119}, -- Hall of Communion
    {C, 876, 371}, -- Kul Tiras
    {C, 875, 371}, -- Zandalar
    {C, 870, 539}, -- Highmountain - Floor 2
    {C, 869, 539}, -- Highmountain - Floor 1
    {C, 868, 371}, -- Val'sharah
    {C, 867, 371}, -- Azsuna
    {C, 866, 371}, -- Stormheim - Floor 2
    {C, 865, 371}, -- Stormheim - Floor 1
    {C, 864, 371}, -- Vol'dun
    {C, 863, 371}, -- Nazmir
    {C, 862, 371}, -- Zuldazar
    {C, 859, 92}, -- Warsong Gulch
    {C, 844, 93}, -- Arathi Basin
    {C, 837, 93}, -- Arathi Basin
    {C, 750, 539}, -- Highmountain - Thunder Totem
    {C, 729, 207}, -- Deepholm - Crumbling Depths
    {C, 691, 371}, -- Suramar - Nyell's Workshop
    {C, 690, 371}, -- Suramar - Ley Station Aethenar
    {C, 689, 371}, -- Suramar - Ley Station Moonfall
    {C, 688, 371}, -- Suramar - Ley Station Anora
    {C, 687, 371}, -- Suramar - Kel'balor
    {C, 686, 371}, -- Suramar - Elor'shan
    {C, 685, 371}, -- Suramar - Shattered Locus - Falanaar Tunnels
    {C, 684, 371}, -- Suramar - Shattered Locus - Temple of Fal'adora
    {C, 683, 371}, -- Suramar - The Arcway Vaults
    {C, 682, 371}, -- Suramar - Felsoul Hold
    {C, 681, 371}, -- Suramar - The Arcway Vaults
    {C, 680, 371}, -- Suramar
    {C, 671, 371}, -- The Cove of Nashal
    {C, 660, 539}, -- Highmountain - Feltotem Caverns
    {C, 659, 539}, -- Highmountain - Stonedark Grotto
    {C, 658, 539}, -- Highmountain - Path of Huln - Floor 2
    {C, 657, 539}, -- Highmountain - Path of Huln - Floor 1
    {C, 656, 539}, -- Highmountain - Lifespring Cavern - Lifespring Upper Cavern
    {C, 655, 539}, -- Highmountain - Lifespring Cavern - Lifespring Lower Cavern
    {C, 654, 539}, -- Highmountain - Mucksnout Den
    {C, 653, 539}, -- Highmountain - Cave of the Blood Trial
    {C, 652, 539}, -- Highmountain - Thunder Totem
    {C, 651, 539}, -- Highmountain - Bitestone Enclave
    {C, 650, 539}, -- Highmountain
    {C, 649, 371}, -- Stormheim - Helheim
    {C, 644, 371}, -- Val'sharah - Sleeper's Barrow - Upper Sleepers Barrow
    {C, 643, 371}, -- Val'sharah - Sleeper's Barrow - Lower Sleepers Barrow
    {C, 642, 371}, -- Val'sharah - Darkpens
    {C, 641, 371}, -- Val'sharah
    {C, 640, 371}, -- Stormheim - Vault of Eyir
    {C, 639, 371}, -- Stormheim - Aggramar's Vault
    {C, 638, 371}, -- Stormheim - Thorignir Refuge - Floor 2
    {C, 637, 371}, -- Stormheim - Thorignir Refuge - Floor 1
    {C, 636, 371}, -- Stormheim - Stormscale Cavern
    {C, 635, 371}, -- Stormheim - Shield's Rest
    {C, 634, 371}, -- Stormheim
    {C, 633, 371}, -- Azsuna - Temple of a Thousand Lights
    {C, 632, 371}, -- Azsuna - Oceanus Cove
    {C, 631, 371}, -- Azsuna - Nar'thalas Academy
    {C, 630, 371}, -- Azsuna
    {C, 619, 371}, -- Broken Isles
    {C, 618, 616}, -- Upper Blackrock Spire - Hall of Blackhand
    {C, 617, 616}, -- Upper Blackrock Spire - The Rookery
    {A, 616, {1307, 2188}}, -- Upper Blackrock Spire - Dragonspire Hall
    {C, 572, 371}, -- Draenor
    {C, 555, 534}, -- Timeless Isle - Cavern of Lost Spirits
    {C, 554, 534}, -- Timeless Isle
    {C, 553, 539}, -- Nagrand - Oshu'gun
    {C, 552, 539}, -- Nagrand - Stonecrag Gorge
    {C, 551, 539}, -- Nagrand - The Masters' Cavern
    {C, 550, 539}, -- Nagrand
    {C, 549, 539}, -- Gorgrond - Cragplume Cauldron - Cragplume Depths
    {C, 548, 539}, -- Gorgrond - Cragplume Cauldron - Cragplume Crater
    {C, 547, 539}, -- Gorgrond - Fissure of Fury - Heart of Fury
    {C, 546, 539}, -- Gorgrond - Fissure of Fury - Fissure of Fury
    {C, 545, 539}, -- Gorgrond - Moira's Reach - The Armory
    {C, 544, 539}, -- Gorgrond - Moira's Reach - Moira's Bastion
    {C, 543, 539}, -- Gorgrond
    {C, 542, 539}, -- Spires of Arak
    {C, 541, 539}, -- Shadowmoon Valley - Den of Secrets
    {C, 540, 539}, -- Shadowmoon Valley - Bloodthorn Cave
    {A, 539, {2556, 46}}, -- Shadowmoon Valley
    {C, 538, 371}, -- Talador - The Breached Ossuary
    {C, 537, 371}, -- Talador - Tomb of Souls
    {C, 536, 371}, -- Talador - Tomb of Lights
    {C, 535, 371}, -- Talador
    {A, 534, {2556}}, -- Tanaan Jungle
    {C, 533, 371}, -- Frostfire Ridge - Snowfall Alcove
    {C, 532, 371}, -- Frostfire Ridge - Grulloc's Grotto - Grulloc's Lair
    {C, 531, 371}, -- Frostfire Ridge - Grulloc's Grotto - Grulloc's Grotto
    {C, 530, 371}, -- Frostfire Ridge - Grom'gar
    {C, 529, 371}, -- Frostfire Ridge - Turgall's Den - Sootstained Mines
    {C, 528, 371}, -- Frostfire Ridge - Turgall's Den - Bladespire Throne
    {C, 527, 371}, -- Frostfire Ridge - Turgall's Den - Bladespire Courtyard
    {C, 526, 371}, -- Frostfire Ridge - Turgall's Den - Bladespire Citadel
    {C, 525, 371}, -- Frostfire Ridge
    {C, 470, 27}, -- Frostmane Hold
    {C, 469, 27}, -- Dun Morogh - New Tinkertown
    {C, 468, 97}, -- Ammen Vale
    {C, 467, 94}, -- Sunstrider Isle
    {C, 466, 18}, -- Night Web's Hollow
    {C, 465, 18}, -- Tirisfal Glades - Deathknell
    {C, 464, 1}, -- Spitescale Cavern
    {C, 463, 1}, -- Echo Isles
    {C, 462, 7}, -- Mulgore - Camp Narache
    {C, 461, 1}, -- Durotar - Valley of Trials
    {C, 460, 57}, -- Shadowglen
    {C, 436, 435}, -- Scarlet Monastery - Crusader's Chapel
    {A, 435, {637, 980}}, -- Scarlet Monastery - Forlorn Cloister
    {C, 434, 371}, -- Kun-Lai Summit - The Ancient Passage
    {C, 428, 27}, -- Frostmane Hovel
    {C, 427, 27}, -- Dun Morogh - Coldridge Valley
    {C, 426, 37}, -- Echo Ridge Mine
    {C, 425, 37}, -- Northshire
    {C, 424, 371}, -- Pandaria
    {C, 422, 371}, -- Dread Wastes
    {C, 421, 371}, -- Krasarang Wilds - Ruins of Ogudei - Reliquary Incursion
    {C, 420, 371}, -- Krasarang Wilds - Ruins of Ogudei - Ruins of Ogudei
    {C, 419, 371}, -- Krasarang Wilds - Ruins of Ogudei - Alliance Excavation
    {C, 418, 371}, -- Krasarang Wilds
    {C, 415, 409}, -- Dragon Soul - The Maelstrom
    {C, 414, 409}, -- Dragon Soul - Spine of Deathwing
    {C, 413, 409}, -- Dragon Soul - Skyfire Airship
    {C, 412, 409}, -- Dragon Soul - Eye of Eternity
    {C, 411, 409}, -- Dragon Soul - Maw of Shu'ma
    {C, 410, 409}, -- Dragon Soul - Maw of Go'rath
    {A, 409, {6175, 5518, 6106, 6107, 6177, 6181, 6174, 6128, 6129, 6084, 6105, 6133, 6180, 6109, 6110, 6111, 6112, 6113, 6114, 6115, 6116}}, -- Dragon Soul - Dragon Soul
    {C, 408, 407}, -- Darkmoon Island
    {A, 407, {6019, 6021, 6023, 6024, 6027, 6028, 6029, 6032, 6026, 6025, 6022, 6020, 6030, 6031, 2336}}, -- Darkmoon Island
    {C, 406, 401}, -- End Time - Bronze Dragonshrine
    {C, 405, 401}, -- End Time - Emerald Dragonshrine
    {C, 404, 401}, -- End Time - Obsidian Dragonshrine
    {C, 403, 401}, -- End Time - Ruby Dragonshrine
    {C, 402, 401}, -- End Time - Azure Dragonshrine
    {A, 401, {5995, 6130, 6117}}, -- End Time - End Time
    {C, 400, 399}, -- Hour of Twilight - Wyrmrest Temple
    {A, 399, {6132, 6119}}, -- Hour of Twilight - Hour of Twilight
    {A, 398, {6127, 6070, 6118}}, -- Well of Eternity
    {C, 397, 112}, -- Eye of the Storm
    {C, 396, 371}, -- Vale of Eternal Blossoms - Guo-Lai Halls - The Hall of the Serpent
    {C, 395, 371}, -- Vale of Eternal Blossoms - Guo-Lai Halls - Guo-Lai Halls
    {C, 394, 371}, -- Vale of Eternal Blossoms - Shrine of Seven Stars - The Imperial Exchange
    {C, 393, 371}, -- Vale of Eternal Blossoms - Shrine of Seven Stars - The Emperor's Step
    {C, 392, 371}, -- Vale of Eternal Blossoms - Shrine of Two Moons - The Imperial Mercantile
    {C, 391, 371}, -- Vale of Eternal Blossoms - Shrine of Two Moons - Hall of the Crescent Moon
    {C, 390, 371}, -- Vale of Eternal Blossoms
    {C, 389, 371}, -- Townlong Steppes - Niuzao Catacombs
    {C, 388, 371}, -- Townlong Steppes
    {C, 387, 371}, -- Kun-Lai Summit - Ruins of Korune - Crypt of Korune
    {C, 386, 371}, -- Kun-Lai Summit - Ruins of Korune - Ruins of Korune
    {C, 385, 371}, -- Kun-Lai Summit - Tomb of Conquerors
    {C, 384, 371}, -- Kun-Lai Summit - The Deeper - Lower Deep
    {C, 383, 371}, -- Kun-Lai Summit - The Deeper - Upper Deep
    {C, 382, 371}, -- Kun-Lai Summit - Knucklethump Hole
    {C, 381, 371}, -- Kun-Lai Summit - Pranksters' Hollow
    {C, 380, 371}, -- Kun-Lai Summit - Howlingwind Cavern
    {C, 379, 371}, -- Kun-Lai Summit
    {C, 377, 371}, -- Valley of the Four Winds - Cavern of Endless Echoes
    {C, 376, 371}, -- Valley of the Four Winds
    {C, 375, 371}, -- The Jade Forest - Oona Kagu
    {C, 374, 371}, -- The Jade Forest - The Widow's Wail
    {C, 373, 371}, -- The Jade Forest - Greenstone Quarry - Lower Quarry
    {C, 372, 371}, -- The Jade Forest - Greenstone Quarry - Upper Quarry
    {A, 371, {46}}, -- The Jade Forest
    {C, 369, 367}, -- Firelands - Sulfuron Keep
    {C, 368, 367}, -- Firelands - The Anvil of Conflagration
    {A, 367, {5855, 5802, 5839, 5821, 5813, 5810, 5829, 5830, 5799, 5807, 5809, 5808, 5806, 5805, 5804, 5803, 5827}}, -- Firelands - Firelands
    {C, 366, 350}, -- Karazhan - Netherspace
    {C, 365, 350}, -- Karazhan - The Power Station
    {C, 364, 350}, -- Karazhan - Medivh's Chambers
    {C, 363, 350}, -- Karazhan - Gamesman's Hall
    {C, 362, 350}, -- Karazhan - The Celestial Watch
    {C, 361, 350}, -- Karazhan - Upper Library
    {C, 360, 350}, -- Karazhan - The Repository
    {C, 359, 350}, -- Karazhan - Guardian's Library
    {C, 358, 350}, -- Karazhan - The Menagerie
    {C, 357, 350}, -- Karazhan - Upper Broken Stair
    {C, 356, 350}, -- Karazhan - Lower Broken Stair
    {C, 355, 350}, -- Karazhan - Master's Terrace
    {C, 354, 350}, -- Karazhan - Opera Hall Balcony
    {C, 353, 350}, -- Karazhan - The Guest Chambers
    {C, 352, 350}, -- Karazhan - The Banquet Hall
    {C, 351, 350}, -- Karazhan - Upper Livery Stables
    {A, 350, {690, 882, 2456, 960}}, -- Karazhan - Servant's Quarters
    {C, 349, 348}, -- Magisters' Terrace - Observation Grounds
    {A, 348, {897, 661, 682, 884}}, -- Magisters' Terrace - Grand Magister's Asylum
    {A, 347, {763, 764, 647, 667}}, -- Hellfire Ramparts
    {C, 346, 339}, -- Black Temple - Temple Summit
    {C, 345, 339}, -- Black Temple - Chamber of Command
    {C, 344, 339}, -- Black Temple - Den of Mortal Delights
    {C, 343, 339}, -- Black Temple - Gorefiend's Vigil
    {C, 342, 339}, -- Black Temple - Halls of Anguish
    {C, 341, 339}, -- Black Temple - Sanctuary of Shadows
    {C, 340, 339}, -- Black Temple - Karabor Sewers
    {A, 339, {697, 426, 958}}, -- Black Temple - Black Temple
    {A, 338, {5859, 5866, 5867, 5871, 5872, 5874, 5873, 5879}}, -- Molten Front
    {A, 337, {560, 688, 880, 881, 957, 5743, 5762, 5765, 5759, 5744, 5768}}, -- Zul'Gurub
    {C, 336, 335}, -- Sunwell Plateau - Shrine of the Eclipse
    {A, 335, {698, 725}}, -- Sunwell Plateau - Sunwell Plateau
    {A, 334, {763, 764, 696, 885}}, -- The Eye (Tempest Keep)
    {A, 333, {691, 430, 5858, 5750, 5761, 5760, 5769}}, -- Zul'Aman
    {A, 332, {694, 144}}, -- Serpentshrine Cavern
    {A, 331, {693}}, -- Magtheridon's Lair
    {A, 330, {692}}, -- Gruul's Lair
    {A, 329, {695, 959}}, -- The Battle for Mount Hyjal (Hyjal Summit)
    {A, 328, {5304, 5305, 5122, 5123, 4851}}, -- Throne of the Four Winds
    {A, 325, {5289, 5288, 4847, 5064}}, -- The Vortex Pinnacle
    {A, 324, {5287, 4846, 5063}}, -- The Stonecore
    {C, 323, 322}, -- Throne of the Tides - Throne of Neptulon
    {A, 322, {5285, 5286, 4839, 5061}}, -- Throne of the Tides - Abyssal Halls
    {C, 321, 319}, -- Ahn'Qiraj - Vault of C'Thun
    {C, 320, 319}, -- Ahn'Qiraj - The Temple Gates
    {A, 319, {687, 424, 15334, 956}}, -- Ahn'Qiraj - The Hive Undergrounds
    {C, 318, 317}, -- Stratholme - The Gauntlet
    {A, 317, {646, 729}}, -- Stratholme - Crusader's Square
    {C, 316, 310}, -- Shadowfang Keep - The Wall Walk
    {C, 315, 310}, -- Shadowfang Keep - Lord Godfrey's Chamber
    {C, 314, 310}, -- Shadowfang Keep - Upper Observatory
    {C, 313, 310}, -- Shadowfang Keep - Lower Observatory
    {C, 312, 310}, -- Shadowfang Keep - The Vacant Den
    {C, 311, 310}, -- Shadowfang Keep - Dining Hall
    {A, 310, {5503, 5504, 5505, 631, 5093, 4627}}, -- Shadowfang Keep - The Courtyard
    {A, 301, {635}}, -- Razorfen Kraul
    {A, 300, {636}}, -- Razorfen Downs
    {C, 299, 297}, -- Halls of Origination - The Four Seats
    {C, 298, 297}, -- Halls of Origination - Tomb of the Earthrager
    {A, 297, {5293, 5294, 5296, 5295, 4841, 5065}}, -- Halls of Origination - The Vault of Lights
    {C, 296, 294}, -- The Bastion of Twilight - The Twilight Caverns
    {C, 295, 294}, -- The Bastion of Twilight - Throne of the Apocalypse
    {A, 294, {4850, 5313, 5300, 4852, 5311, 5312, 5118, 5117, 5119, 5120, 5121}}, -- The Bastion of Twilight - The Twilight Enclave
    {A, 293, {5297, 5298, 4840, 5062}}, -- Grim Batol
    {C, 292, 291}, -- The Deadmines - Ironclad Cove
    {A, 291, {5366, 5367, 5368, 5369, 5370, 5371, 628, 5083}}, -- The Deadmines - The Deadmines
    {C, 290, 287}, -- Blackwing Lair - Nefarian's Lair
    {C, 289, 287}, -- Blackwing Lair - Crimson Laboratories
    {C, 288, 287}, -- Blackwing Lair - Halls of Strife
    {A, 287, {685, 15333}}, -- Blackwing Lair - Dragonmaw Garrison
    {C, 286, 285}, -- Blackwing Descent - Vault of the Shadowflame
    {A, 285, {4842, 5306, 5307, 5309, 5308, 5310, 4849, 5094, 5107, 5115, 5109, 5108, 5116}}, -- Blackwing Descent - The Broken Hall
    {C, 284, 283}, -- Blackrock Caverns - Twilight Forge
    {A, 283, {5281, 5282, 5283, 5284, 4833, 5060}}, -- Blackrock Caverns - Chamber of Incineration
    {A, 282, {5416, 6045, 6108}}, -- Baradin Hold
    {C, 281, 280}, -- Maraudon - Zaetar's Grave
    {A, 280, {640}}, -- Maraudon - Caverns of Maraudon
    {A, 279, {630}}, -- Wailing Caverns
    {A, 277, {5291, 5290, 5292, 4848, 5066}}, -- Lost City of the Tol'vir
    {A, 275, {5245, 5246, 5247, 5248, 5249, 5250, 5251, 5252, 5253, 5254, 5255, 5256, 5257, 5262, 5258}}, -- The Battle for Gilneas
    {A, 274, {763, 764, 652, 673}}, -- Old Hillsbrad Foothills
    {A, 273, {763, 764, 655, 676}}, -- The Black Morass
    {A, 272, {902, 651, 671}}, -- Mana-Tombs
    {C, 271, 269}, -- The Arcatraz - Containment Core
    {C, 270, 269}, -- The Arcatraz - Stasis Block: Maximus
    {A, 269, {763, 764, 660, 681}}, -- The Arcatraz - Stasis Block: Trion
    {C, 268, 267}, -- The Mechanar - Calculation Chamber
    {A, 267, {763, 764, 658, 679}}, -- The Mechanar - The Mechanar
    {A, 266, {763, 764, 659, 680}}, -- The Botanica
    {A, 265, {763, 764, 649, 669}}, -- The Slave Pens
    {C, 264, 263}, -- The Steamvault - The Cooling Pools
    {A, 263, {763, 764, 656, 677}}, -- The Steamvault - The Steamvault
    {A, 262, {763, 764, 650, 670}}, -- The Underbog
    {A, 261, {763, 764, 648, 668}}, -- The Blood Furnace
    {A, 260, {763, 764, 654, 675}}, -- Shadow Labyrinth
    {C, 259, 258}, -- Sethekk Halls - Halls of Mourning
    {A, 258, {763, 764, 653, 674, 883}}, -- Sethekk Halls - Veil Sethekk
    {C, 257, 256}, -- Auchenai Crypts - Bridge of Souls
    {A, 256, {763, 764, 666, 672}}, -- Auchenai Crypts - Halls of the Hereafter
    {C, 255, 250}, -- Blackrock Spire - Chamber of Battle
    {C, 254, 250}, -- Blackrock Spire - Halycon's Lair
    {C, 253, 250}, -- Blackrock Spire - Hall of Blackhand
    {C, 252, 250}, -- Blackrock Spire - Hordemar City
    {C, 251, 250}, -- Blackrock Spire - Skitterweb Tunnels
    {A, 250, {643}}, -- Blackrock Spire - Tazz'Alor
    {A, 249, {1206, 4875, 4868, 5767, 4888, 4872, 4961, 5317, 4865, 4884, 46}}, -- Uldum
    {A25, 248, {4405, 4406, 4407, 4397}}, -- Onyxia's Lair
    {A10, 248, {4402, 4403, 4404, 4396}}, -- Onyxia's Lair
    {A, 248, {684}}, -- Onyxia's Lair
    {A, 247, {689, 953}}, -- Ruins of Ahn'Qiraj
    {A, 246, {763, 764, 657, 678}}, -- The Shattered Halls
    {A, 245, {2556, 5548, 5489, 5490, 4874, 5718, 5719, 5412, 5418, 5417, 5415, 5488, 5487, 5486, 5375, 5376}}, -- Tol Barad Peninsula
    {A, 244, {5548, 5489, 5490, 4874, 5718, 5719, 5412, 5418, 5417, 5415, 5488, 5487, 5486, 5375, 5376}}, -- Tol Barad
    {C, 243, 242}, -- Blackrock Depths - Shadowforge City
    {A, 242, {642, 3496}}, -- Blackrock Depths - Detention Block
    {A, 241, {2556, 4875, 5548, 4868, 4881, 4873, 5501, 4960, 5481, 5482, 5320, 5321, 5451, 4958, 4866, 948, 762, 4885, 4886, 46}}, -- Twilight Highlands
    {C, 240, 235}, -- Dire Maul - The Shrine of Eldretharr
    {C, 239, 235}, -- Dire Maul - Warpwood Quarter
    {C, 238, 235}, -- Dire Maul - Prison of Immol'Thar
    {C, 237, 235}, -- Dire Maul - Court of the Highborne
    {C, 236, 235}, -- Dire Maul - Capital Gardens
    {A, 235, {644, 5788}}, -- Dire Maul - Gordok Commons
    {A, 232, {686, 429, 428, 15330, 955, 2496}}, -- Molten Core
    {C, 231, 230}, -- Uldaman - Khaz'Goroth's Seat
    {A, 230, {638}}, -- Uldaman - Hall of the Keepers
    {C, 229, 226}, -- Gnomeregan - Tinkers' Court
    {C, 228, 226}, -- Gnomeregan - Launch Bay
    {C, 227, 226}, -- Gnomeregan - The Dormitory
    {A, 226, {634}}, -- Gnomeregan - The Hall of Gears
    {A, 225, {633}}, -- The Stockade
    {A, 224, {1206, 1676, 1677, 42, 2556, 4827, 46}}, -- Stranglethorn Vale
    {C, 223, 221}, -- Blackfathom Deeps - The Forgotten Pool
    {C, 222, 221}, -- Blackfathom Deeps - Moonshrine Sanctum
    {A, 221, {632}}, -- Blackfathom Deeps - The Pool of Ask'Ar
    {A, 220, {641}}, -- The Temple of Atal'Hakkar
    {A, 219, {639}}, -- Zul'Farrak
    {C, 218, 217}, -- Ruins of Gilneas City
    {A, 217, {1206}}, -- Ruins of Gilneas
    {A, 213, {629}}, -- Ragefire Chasm
    {A, 210, {1206, 1676, 1677, 42, 4905, 4995, 389, 396, 762, 871, 2336, 2556, 4827, 46}}, -- The Cape of Stranglethorn
    {C, 209, 207}, -- Deepholm - Twilight Depths - Floor 2
    {C, 208, 207}, -- Deepholm - Twilight Depths - Floor 1
    {A, 207, {4875, 4868, 4881, 4871, 5445, 5446, 5449, 5450, 5447, 4864, 4883, 46}}, -- Deepholm
    {A, 206, {5208, 5209, 5210, 5211, 5213, 5214, 5215, 5216, 5226, 5227, 5229, 5228, 5219, 5220, 5221, 5222, 5230, 5231, 5552, 5223, 5259}}, -- Twin Peaks
    {C, 205, 201}, -- Vashj'ir - Shimmering Expanse
    {C, 204, 201}, -- Vashj'ir - Abyssal Depths
    {C, 203, 201}, -- Vashj'ir
    {A, 201, {4875, 5548, 4868, 4881, 4869, 4982, 5452, 5318, 5319, 4825, 4975, 46}}, -- Vashj'ir - Kelp'thar Forest
    {A25, 200, {4815, 4816}}, -- The Ruby Sanctum
    {A10, 200, {4817, 4818}}, -- The Ruby Sanctum
    {A, 199, {1206, 1678, 43, 2556, 4827, 46}}, -- Southern Barrens
    {A, 198, {2556, 4875, 5548, 4868, 4870, 4959, 5860, 5483, 5859, 5866, 5861, 5870, 5862, 5868, 5864, 5865, 5869, 5879, 4863, 4882, 46}}, -- Mount Hyjal
    {C, 193, 186}, -- Icecrown Citadel
    {C, 193, 186}, -- Icecrown Citadel
    {C, 193, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 192, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 191, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 190, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 189, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 188, 186}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {C, 187, 186}, -- Icecrown Citadel
    {A25, 186, {4610, 4611, 4612, 4613, 4615, 4614, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4604, 4605, 4606, 4607, 4597, 4608, 4632, 4633, 4634, 4635, 4584, 4637}}, -- Icecrown Citadel
    {A10, 186, {4534, 4535, 4536, 4537, 4577, 4538, 4578, 4582, 4539, 4579, 4580, 4601, 4581, 4531, 4528, 4529, 4527, 4530, 4532, 4628, 4629, 4630, 4631, 4583, 4636}}, -- Icecrown Citadel
    {A, 186, {4625, 4623, 4598}}, -- Icecrown Citadel
    {A, 185, {4526, 4518, 4521}}, -- Halls of Reflection
    {A, 184, {4524, 4525, 4517, 4520}}, -- Pit of Saron
    {A, 183, {4522, 4523, 4516, 4519}}, -- The Forge of Souls
    {C, 173, 172}, -- Trial of the Crusader - The Icy Depths
    {C, 173, 172}, -- Trial of the Crusader - The Icy Depths
    {A25, 172, {3813, 3937, 3997, 3815, 3816, 3916, 3812, 3817, 3818, 3819, 4156, 4079}}, -- Trial of the Crusader - The Argent Coliseum
    {A10, 172, {3797, 3936, 3996, 3798, 3799, 3800, 3917, 3918, 3808, 3809, 3810, 4080}}, -- Trial of the Crusader - The Argent Coliseum
    {A, 171, {3803, 3802, 3804, 4296, 3778, 4298, 4297, 18677, 18678, 19426, 19425}}, -- Trial of the Champion
    {C, 170, 118}, -- Icecrown - Hrothgar's Landing
    {A, 169, {3776, 3777, 3851, 4177, 3847, 3848, 3849, 3850, 3852, 3853, 3854, 3856, 4256, 3855, 3857, 3957, 3845, 3846, 4176}}, -- Isle of Conquest
    {A, 168, {1865, 2041, 2153, 1816, 483, 494, 17293, 18595, 19432}}, -- The Violet Hold
    {C, 167, 162}, -- Naxxramas - The Upper Necropolis
    {C, 167, 162}, -- Naxxramas - The Upper Necropolis
    {C, 166, 162}, -- Naxxramas - The Lower Necropolis
    {C, 166, 162}, -- Naxxramas - The Lower Necropolis
    {C, 165, 162}, -- Naxxramas - The Plague Quarter
    {C, 165, 162}, -- Naxxramas - The Plague Quarter
    {C, 164, 162}, -- Naxxramas - The Military Quarter
    {C, 164, 162}, -- Naxxramas - The Military Quarter
    {C, 163, 162}, -- Naxxramas - The Arachnid Quarter
    {C, 163, 162}, -- Naxxramas - The Arachnid Quarter
    {A25, 162, {2140, 1859, 1857, 2179, 2181, 2139, 2183, 2177, 2147, 2185, 579, 563, 565, 567, 569, 573, 575, 577, 2186}}, -- Naxxramas - The Construct Quarter
    {A10, 162, {1997, 1858, 1856, 2178, 2180, 1996, 2182, 2176, 2146, 2184, 578, 562, 564, 566, 568, 572, 574, 576, 2187}}, -- Naxxramas - The Construct Quarter
    {C, 161, 160}, -- Drak'Tharon Keep - Drak'Tharon Overlook
    {A, 160, {2151, 2057, 2039, 482, 493, 17292, 18594, 19431}}, -- Drak'Tharon Keep - The Vestibules of Drak'Tharon
    {C, 159, 157}, -- Azjol-Nerub - The Gilded Gate
    {C, 158, 157}, -- Azjol-Nerub - Hadronox's Lair
    {A, 157, {1296, 1297, 1860, 480, 491, 17285, 18592, 19429}}, -- Azjol-Nerub - The Brood Pit
    {A25, 156, {4017, 1721, 3137, 3837, 4586}}, -- Vault of Archavon
    {A10, 156, {4016, 1722, 3136, 3836, 4585}}, -- Vault of Archavon
    {A, 156, {2081}}, -- Vault of Archavon
    {A25, 155, {2048, 2052, 2053, 2054, 1877, 625}}, -- The Obsidian Sanctum
    {A10, 155, {2047, 2049, 2050, 2051, 624, 1876}}, -- The Obsidian Sanctum
    {A, 154, {2058, 2040, 1864, 2152, 484, 495, 17295, 18596, 19433}}, -- Gundrak
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {C, 152, 147}, -- Ulduar - The Mind's Eye
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 151, 147}, -- Ulduar - The Spark of Imagination
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 150, 147}, -- Ulduar - The Prison of Yogg-Saron
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 149, 147}, -- Ulduar - The Inner Sanctum of Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {C, 148, 147}, -- Ulduar - The Antechamber of Ulduar
    {A25, 147, {3098, 2908, 2906, 2912, 2910, 2918, 2916, 2917, 3057, 2926, 2928, 2929, 2921, 2924, 2932, 2935, 2936, 2938, 3059, 2946, 2948, 2942, 2943, 2944, 2956, 2960, 2952, 2954, 3077, 3007, 2962, 2965, 2968, 2970, 3184, 2972, 2974, 2976, 2978, 3183, 3118, 2981, 2984, 2983, 3185, 3186, 3187, 3237, 2995, 3189, 2997, 3188, 3011, 3010, 3013, 3017, 3016, 3161, 3162, 3163, 3164, 3002, 2887, 2889, 2891, 2893, 2895, 3037, 3005, 2904}}, -- Ulduar - Ulduar
    {A10, 147, {3097, 2907, 2905, 2911, 2909, 2913, 2914, 2915, 3056, 2925, 2927, 2930, 2919, 2923, 2931, 2933, 2934, 2937, 3058, 2945, 2947, 2939, 2940, 2941, 2955, 2959, 2951, 2953, 3076, 3006, 2961, 2963, 2967, 2969, 3182, 2971, 2973, 2975, 2977, 3176, 2979, 2980, 2985, 2982, 3177, 3178, 3179, 2989, 3138, 3180, 2996, 3181, 3009, 3008, 3012, 3014, 3015, 3157, 3141, 3158, 3159, 3003, 2886, 2888, 2890, 2892, 2894, 3036, 3004, 2903}}, -- Ulduar - Ulduar
    {A, 147, {4626, 3142, 3316, 17340, 17341}}, -- Ulduar - Ulduar
    {C, 146, 143}, -- The Oculus - Band of Alignment
    {C, 145, 143}, -- The Oculus - Band of Transmutation
    {C, 144, 143}, -- The Oculus - Band of Acceleration
    {A, 143, {1868, 2046, 2045, 2044, 1871, 487, 498, 17300, 18599, 19436}}, -- The Oculus - Band of Variance
    {A25, 141, {2149, 1875, 1870, 623}}, -- The Eye of Eternity
    {A10, 141, {2148, 1874, 1869, 622}}, -- The Eye of Eternity
    {A, 140, {1866, 2154, 2155, 485, 496, 17297, 18597, 19434}}, -- Halls of Stone
    {C, 139, 138}, -- Halls of Lightning - Walk of the Makers
    {A, 138, {1834, 2042, 1867, 486, 497, 17299, 18598, 19435}}, -- Halls of Lightning - Unyielding Garrison
    {C, 137, 136}, -- Utgarde Pinnacle - Upper Pinnacle
    {A, 136, {2043, 1873, 2156, 2157, 488, 499, 17301, 18600, 19437}}, -- Utgarde Pinnacle - Lower Pinnacle
    {C, 135, 133}, -- Utgarde Keep - Tyr's Terrace
    {C, 134, 133}, -- Utgarde Keep - Dragonflayer Ascent
    {A, 133, {1919, 477, 489, 17213, 18590, 19427}}, -- Utgarde Keep - Njorndir Preparation
    {A, 132, {2038, 2056, 1862, 481, 492, 17291, 18593, 19430}}, -- Ahn'kahet: The Old Kingdom
    {C, 131, 130}, -- The Culling of Stratholme - Stratholme City
    {A, 130, {1872, 1817, 479, 500, 17302, 18601, 19438}}, -- The Culling of Stratholme - The Culling of Stratholme
    {A, 129, {2150, 2037, 2036, 478, 490, 17283, 18591, 19428}}, -- The Nexus
    {A, 127, {45, 2556, 1457, 46}}, -- Crystalsong Forest
    {A, 126, {1008, 1010, 2556, 1956, 2084, 2076, 2077, 2078, 2094, 2095, 1957, 1958, 2096}}, -- Dalaran - The Underbelly
    {A, 125, {1008, 1010, 1956, 2084, 2076, 2077, 2078, 2094, 2095, 1957, 1958, 2096}}, -- Dalaran - Dalaran City
    {A, 123, {1717, 1718, 1755, 2199, 2080, 1737, 2476, 1723, 1727, 1751, 1752, 2776}}, -- Wintergrasp
    {A, 122, {42, 897, 868, 46}}, -- Isle of Quel'Danas
    {A, 121, {1681, 1682, 41, 2256, 2257, 2557, 45, 1009, 1010, 2556, 36, 1596, 1576, 4958, 1267, 46}}, -- Zul'Drak
    {A, 120, {1681, 1682, 41, 2256, 2257, 2557, 45, 1012, 2556, 38, 1428, 1269, 2082, 2083, 46}}, -- The Storm Peaks
    {A, 119, {1681, 1682, 41, 2256, 2257, 2557, 45, 2556, 39, 961, 962, 938, 941, 1268, 950, 951, 952, 46}}, -- Sholazar Basin
    {A, 118, {1681, 1682, 41, 2256, 2257, 2557, 45, 1009, 1010, 1011, 1012, 40, 1270, 947, 945, 2756, 2758, 2772, 2836, 2773, 3736, 2777, 2787, 2760, 2769, 2778, 2785, 2761, 2767, 2779, 2786, 2762, 2768, 2780, 2784, 2763, 2766, 2781, 2783, 2764, 2765, 2782, 2788, 2770, 2771, 2817, 2816, 3676, 3677, 4596, 46}}, -- Icecrown
    {A, 117, {1681, 1682, 41, 2256, 2257, 2557, 45, 1011, 1012, 2556, 34, 1356, 1263, 1254, 46}}, -- Howling Fjord
    {A, 116, {1681, 1682, 41, 2256, 2257, 2557, 45, 37, 1357, 1266, 2016, 2017, 46}}, -- Grizzly Hills
    {A, 115, {1681, 1682, 41, 2256, 2257, 2557, 45, 1008, 1010, 1011, 1012, 35, 1359, 547, 1277, 1265, 1007, 46}}, -- Dragonblight
    {A, 114, {1681, 1682, 41, 2256, 2257, 2557, 45, 1008, 1010, 1011, 1012, 33, 1358, 561, 1264, 949, 46}}, -- Borean Tundra
    {A, 113, {1681, 1682, 41, 2256, 2257, 2557, 45, 1008, 1009, 1010, 1011, 1012, 2556, 46}}, -- Northrend
    {A, 112, {208, 209, 783, 784, 214, 213, 212, 216, 233, 1171, 587, 1258, 211}}, -- Eye of the Storm
    {A, 111, {1165}}, -- Shattrath City
    {A, 110, {1006, 613, 614, 604, 2556}}, -- Silvermoon City
    {A, 109, {1681, 1682, 1262, 1311, 1312, 44, 902, 1194, 843, 46}}, -- Netherstorm
    {A, 108, {1681, 1682, 1262, 1311, 1312, 44, 763, 764, 894, 1191, 1272, 1275, 867, 903, 1205, 2556, 46}}, -- Terokkar Forest
    {A, 107, {942, 943, 1681, 1682, 1262, 1311, 1312, 44, 902, 1192, 1273, 939, 941, 1576, 4958, 866, 899, 901, 2556, 46}}, -- Nagrand
    {A, 106, {1681, 1682, 1678, 43, 4926, 861, 948, 2556, 46}}, -- Bloodmyst Isle
    {A, 105, {1681, 1682, 1262, 1311, 1312, 44, 894, 1193, 1276, 865, 896, 2556, 46}}, -- Blade's Edge Mountains
    {A, 104, {1681, 1682, 1262, 1311, 1312, 44, 1195, 864, 898, 1638, 2556, 46}}, -- Shadowmoon Valley
    {A, 103, {388, 618, 619, 603, 2556}}, -- The Exodar
    {A, 102, {942, 943, 1681, 1682, 1262, 1311, 1312, 44, 763, 764, 1190, 863, 948, 762, 893, 953, 900, 2556, 46}}, -- Zangarmarsh
    {A, 101, {942, 943, 1681, 1682, 1262, 1311, 1312, 44, 763, 764, 894, 902, 46}}, -- Outland
    {A, 100, {1681, 1682, 1262, 1311, 1312, 44, 763, 764, 1189, 1271, 862, 948, 762, 2556, 46}}, -- Hellfire Peninsula
    {C, 99, 97}, -- Stillpine Hold
    {C, 98, 97}, -- Tides' Hollow
    {A, 97, {43, 860, 948, 2556, 46}}, -- Azuremyst Isle
    {C, 96, 95}, -- Amani Catacombs
    {A, 95, {42, 4908, 858, 762, 2556, 46}}, -- Ghostlands
    {A, 94, {42, 859, 762, 2556, 46}}, -- Eversong Woods
    {A, 93, {154, 155, 165, 158, 73, 1153, 157, 161, 156, 159, 162, 583, 584, 1169, 1170, 711, 710}}, -- Arathi Basin
    {A, 92, {166, 167, 199, 200, 872, 168, 201, 204, 203, 1251, 202, 1502, 206, 1252, 207, 1172, 1173, 1259, 713, 712}}, -- Warsong Gulch
    {A, 91, {218, 219, 221, 222, 1151, 224, 225, 1164, 223, 220, 873, 582, 707, 706, 1166, 1167, 1168, 226, 709, 708}}, -- Alterac Valley
    {A, 90, {612, 604, 1006, 5844, 5850, 2556}}, -- Undercity
    {A, 89, {1206, 388, 617, 603, 5842, 5848, 2556}}, -- Darnassus
    {A, 88, {1206, 1006, 611, 604, 5843, 5849, 2556}}, -- Thunder Bluff
    {A, 87, {388, 616, 619, 603, 5841, 1837, 5847}}, -- Ironforge
    {C, 86, 85}, -- Orgrimmar - Cleft of Shadow
    {A, 85, {1206, 610, 614, 1006, 604, 762, 5475, 1836, 5477, 2556}}, -- Orgrimmar - Orgrimmar
    {A, 84, {1206, 615, 388, 603, 948, 5474, 5476, 2556}}, -- Stormwind City
    {A, 83, {944, 942, 943, 1681, 1682, 1678, 43, 3356, 4940, 5443, 857, 2336, 2556, 46}}, -- Winterspring
    {C, 82, 81}, -- Silithus - Twilight's Run
    {A, 81, {1681, 1682, 1678, 43, 416, 5533, 4934, 856, 953, 2556, 46}}, -- Silithus
    {A, 80, {1206, 43, 855, 2556, 46}}, -- Moonglade
    {C, 79, 78}, -- Un'Goro Crater - The Slithering Scar
    {A, 78, {1206, 1681, 1682, 1678, 43, 3357, 4939, 854, 2556, 46}}, -- Un'Goro Crater
    {A, 77, {1206, 944, 942, 943, 1681, 1682, 1678, 43, 4931, 853, 948, 762, 46}}, -- Felwood
    {A, 76, {1206, 43, 4927, 5454, 5448, 5546, 5547, 852, 762, 2556, 46}}, -- Azshara
    {C, 75, 74}, -- Caverns of Time - Caverns of Time
    {A, 74, {763, 764}}, -- Caverns of Time - Timeless Tunnel
    {C, 73, 71}, -- Tanaris - The Gaping Chasm
    {C, 72, 71}, -- Tanaris - The Noxious Lair
    {A, 71, {1681, 1682, 1678, 43, 4935, 851, 948, 762, 2336, 2556, 4827, 46}}, -- Tanaris
    {A, 70, {1206, 1681, 1682, 1678, 43, 4929, 4978, 850, 948, 2556, 46}}, -- Dustwallow Marsh
    {A, 69, {1206, 1681, 1682, 1678, 43, 4932, 4979, 849, 948, 762, 2556, 46}}, -- Feralas
    {C, 68, 66}, -- Desolace - Maraudon - Foulspore Cavern
    {C, 67, 66}, -- Desolace - Maraudon - The Wicked Grotto
    {A, 66, {1206, 1681, 1682, 1678, 43, 4930, 848, 762, 2556, 4827, 46}}, -- Desolace
    {A, 65, {1206, 1681, 1682, 1678, 43, 4936, 4980, 847, 948, 762, 2556, 46}}, -- Stonetalon Mountains
    {A, 64, {1681, 1682, 1678, 43, 4938, 846, 948, 762, 2556, 4827, 46}}, -- Thousand Needles
    {A, 63, {1206, 1681, 1682, 1678, 43, 4925, 4976, 845, 948, 2556, 4827, 46}}, -- Ashenvale
    {A, 62, {1206, 1681, 1682, 1678, 43, 4928, 5453, 844, 948, 2556, 4827, 46}}, -- Darkshore
    {C, 61, 57}, -- Ban'ethil Barrow Den - Lower Den
    {C, 60, 57}, -- Ban'ethil Barrow Den - Upper Den
    {C, 59, 57}, -- Fel Rock
    {C, 58, 57}, -- Shadowthread Cave
    {A, 57, {1206, 43, 842, 948, 46}}, -- Teldrassil
    {A, 56, {1206, 1676, 1677, 42, 1681, 1682, 4898, 841, 948, 2556, 46}}, -- Wetlands
    {C, 55, 52}, -- Westfall - The Deadmines
    {C, 54, 52}, -- Westfall - Jangolode Mine
    {C, 53, 52}, -- Westfall - Gold Coast Quarry
    {A, 52, {1206, 1676, 1677, 42, 1681, 1682, 4903, 802, 948, 2556, 4827, 46}}, -- Westfall
    {A, 51, {1206, 1676, 1677, 42, 1681, 1682, 4904, 782, 948, 2556, 46}}, -- Swamp of Sorrows
    {A, 50, {1206, 1676, 1677, 42, 4906, 940, 941, 781, 948, 762, 2556, 4827, 46}}, -- Northern Stranglethorn
    {A, 49, {1206, 1676, 1677, 42, 1681, 1682, 4902, 780, 948, 2556, 46}}, -- Redridge Mountains
    {A, 48, {1206, 1676, 1677, 42, 1681, 1682, 4899, 779, 948, 4827, 46}}, -- Loch Modan
    {A, 47, {1206, 1676, 1677, 42, 1681, 1682, 4907, 778, 948, 2556, 46}}, -- Duskwood
    {C, 46, 42}, -- Deadwind Pass - Karazhan Catacombs
    {C, 45, 42}, -- Deadwind Pass - The Master's Cellar - Lower Cellar
    {C, 44, 42}, -- Deadwind Pass - The Master's Cellar - The Master's Cellar
    {C, 43, 42}, -- Deadwind Pass - The Master's Cellar
    {A, 42, {42, 777, 46}}, -- Deadwind Pass
    {C, 40, 37}, -- Elwynn Forest - Jasperlode Mine
    {C, 39, 37}, -- Elwynn Forest - Fargodeep Mine - Lower Mines
    {C, 38, 37}, -- Elwynn Forest - Fargodeep Mine - Fargodeep Mine
    {A, 37, {1206, 42, 776, 948, 46}}, -- Elwynn Forest
    {C, 36, 33}, -- Burning Steppes
    {C, 35, 32}, -- Searing Gorge - Blackrock Mountain - Blackrock Depths
    {C, 34, 33}, -- Burning Steppes - Blackrock Mountain - Blackrock Caverns
    {A, 33, {1676, 1677, 42, 1681, 1682, 4901, 775, 2556, 46}}, -- Burning Steppes - Blackrock Mountain - Blackrock Spire
    {A, 32, {1676, 1677, 42, 1681, 1682, 4910, 774, 2556, 46}}, -- Searing Gorge
    {C, 31, 27}, -- Dun Morogh - Gol'Bolar Quarry
    {C, 30, 27}, -- Dun Morogh - New Tinkertown
    {C, 29, 27}, -- Dun Morogh - The Grizzled Den
    {C, 28, 27}, -- Dun Morogh - Coldridge Pass
    {A, 27, {42, 4786, 627, 948, 46}}, -- Dun Morogh
    {A, 26, {1206, 1676, 1677, 42, 1681, 1682, 4897, 773, 762, 2556, 46}}, -- The Hinterlands
    {A, 25, {1206, 42, 5364, 5365, 4895, 772, 762, 2336, 2556, 4827, 46}}, -- Hillsbrad Foothills
    {A, 23, {1676, 1677, 42, 1681, 1682, 4892, 5442, 771, 946, 945, 2556, 46}}, -- Eastern Plaguelands
    {A, 22, {1206, 1676, 1677, 42, 1681, 1682, 4893, 770, 948, 762, 2556, 46}}, -- Western Plaguelands
    {A, 21, {42, 4894, 769, 762, 2556, 4827, 46}}, -- Silverpine Forest
    {C, 20, 18}, -- Tirisfal Glades - Keeper's Rest
    {C, 19, 18}, -- Tirisfal Glades - Scarlet Monastery Entrance
    {A, 18, {1206, 42, 768, 762, 2556, 46}}, -- Tirisfal Glades
    {A, 17, {1676, 1677, 42, 1681, 1682, 4909, 766, 948, 762, 2556, 46}}, -- Blasted Lands
    {C, 16, 15}, -- Badlands - Uldaman
    {A, 15, {1676, 1677, 42, 1681, 1682, 4900, 5444, 765, 2556, 4827, 46}}, -- Badlands
    {A, 14, {1206, 1676, 1677, 42, 1681, 1682, 4896, 761, 948, 762, 2556, 46}}, -- Arathi Highlands
    {A, 13, {1206, 1676, 1677, 42, 1681, 1682, 897, 4875, 4827, 5548, 4868, 4881, 46}}, -- Eastern Kingdoms
    {A, 12, {1206, 944, 942, 943, 1681, 1682, 1678, 43, 4875, 4827, 5548, 4868, 46}}, -- Kalimdor
    {C, 11, 10}, -- Northern Barrens - Wailing Caverns
    {A, 10, {1206, 43, 2556, 46}}, -- Northern Barrens
    {C, 9, 7}, -- Mulgore - The Venture Co. Mine
    {C, 8, 7}, -- Mulgore - Palemane Rock
    {A, 7, {1206, 43, 736, 762, 2556, 46}}, -- Mulgore
    {C, 6, 1}, -- Durotar - Dustwind Cave
    {C, 5, 1}, -- Durotar - Skull Rock
    {C, 4, 1}, -- Durotar - Tiragarde Keep - Great Hall
    {C, 3, 1}, -- Durotar - Tiragarde Keep - Tiragarde Keep
    {C, 2, 1}, -- Durotar - Burning Blade Coven
    {A, 1, {1206, 43, 4790, 728, 762, 2556, 4827, 46}}, -- Durotar
};