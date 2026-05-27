local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

tinsert(KrowiAF.CategoryData.Expansions, { -- Classic
    CT.Classic,
    { -- Zones
        addon.L["Zones"],
        { -- Eastern Kingdoms
            addon.GetMapName(1415),
            { -- Stormwind City
                addon.GetMapName(1453),
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
                {
                    615, -- Storming Stormwind
                    14815, -- Executing the Exarch
                    388, -- City Defender
                    11065, -- It All Makes Sense Now
                    603, -- Wrath of the Horde
                },
            },
            { -- Ironforge
                addon.GetMapName(1455),
                {
                    616, -- Overthrow the Council
                    619, -- For the Horde!
                    603, -- Wrath of the Horde
                },
            },
            { -- Undercity
                addon.GetMapName(1458),
                {
                    612, -- Downing the Dark Lady
                    604, -- Wrath of the Alliance
                },
            },
            { -- Dun Morogh
                addon.GetMapName(1426),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        627, -- Explore Dun Morogh
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                    4786, -- Operation: Gnomeregan
                },
            },
            { -- Elwynn Forest
                addon.GetMapName(1429),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        776, -- Explore Elwynn Forest
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Tirisfal Glades
                addon.GetMapName(1420),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        768, -- Explore Tirisfal Glades
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Westfall
                addon.GetMapName(1436),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4903, -- Westfall Quests
                        12455, -- Westfall & Duskwood Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        802, -- Explore Westfall
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                },
            },
            { -- Loch Modan
                addon.GetMapName(1432),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4899, -- Loch Modan Quests
                        12456, -- Loch Modan & Wetlands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        779, -- Explore Loch Modan
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Silverpine Forest
                addon.GetMapName(1421),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4894, -- Silverpine Forest Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        769, -- Explore Silverpine Forest
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Redridge Mountains
                addon.GetMapName(1433),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4902, -- Redridge Mountains Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        780, -- Explore Redridge Mountains
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Duskwood
                addon.GetMapName(1431),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        12430, -- Duskwood Quests
                        12455, -- Westfall & Duskwood Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        778, -- Explore Duskwood
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Wetlands
                addon.GetMapName(1437),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        12429, -- Wetlands Quests
                        12456, -- Loch Modan & Wetlands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        841, -- Explore Wetlands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Hillsbrad Foothills
                addon.GetMapName(1424),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        5364, -- Don't Want No Zombies on My Lawn
                        5365, -- Bloom and Doom
                        4895, -- Hillsbrad Foothills Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        772, -- Explore Hillsbrad Foothills
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                        2336, -- Insane in the Membrane
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                },
            },
            { -- Arathi Highlands
                addon.GetMapName(1417),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4896, -- Arathi Highlands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        761, -- Explore Arathi Highlands
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Northern Stranglethorn
                addon.GetMapName(50),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4906, -- Northern Stranglethorn Quests
                        940, -- The Green Hills of Stranglethorn
                        941, -- Hemet Nesingwary: The Collected Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        781, -- Explore Northern Stranglethorn
                        17366, -- Relics of a Fallen Empire
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- The Cape of Stranglethorn
                addon.GetMapName(210),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4905, -- Cape of Stranglethorn Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        4995, -- Explore the Cape of Stranglethorn
                        9924, -- Field Photographer
                    },
                },
                { -- Player vs. Player
                    CT.PvP,
                    {
                        389, -- Gurubashi Arena Master
                        396, -- Gurubashi Arena Grand Master
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                        871, -- "Avast Ye, Admiral!"
                        2336, -- Insane in the Membrane
                    },
                },
            },
            { -- Western Plaguelands
                addon.GetMapName(1422),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4893, -- Western Plaguelands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        770, -- Explore Western Plaguelands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- The Hinterlands
                addon.GetMapName(1425),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4897, -- Hinterlands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        773, -- Explore The Hinterlands
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Eastern Plaguelands
                addon.GetMapName(1423),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4892, -- Eastern Plaguelands Quests
                        5442, -- Full Caravan
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        771, -- Explore Eastern Plaguelands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        946, -- The Argent Dawn
                        945, -- The Argent Champion
                    },
                },
                {
                    11297, -- The Balance of Light and Shadow
                },
            },
            { -- Badlands
                addon.GetMapName(1418),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4900, -- Badlands Quests
                        5444, -- "Ready, Set, Goat!"
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        765, -- Explore Badlands
                    },
                },
                {
                    16431, -- Against the Elements
                },
            },
            { -- Searing Gorge
                addon.GetMapName(1427),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4910, -- Searing Gorge Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        774, -- Explore Searing Gorge
                    },
                },
                {
                    40796, -- This Takes Me Back
                },
            },
            { -- Swamp of Sorrows
                addon.GetMapName(1435),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4904, -- Swamp of Sorrows Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        782, -- Explore Swamp of Sorrows
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Burning Steppes
                addon.GetMapName(1428),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4901, -- Burning Steppes Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        775, -- Explore Burning Steppes
                        9924, -- Field Photographer
                    },
                },
                {
                    11296, -- The Ancient Keeper
                },
            },
            { -- Blasted Lands
                addon.GetMapName(1419),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4909, -- Blasted Lands Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        766, -- Explore Blasted Lands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
                {
                    9618, -- The Iron Invasion
                    11297, -- The Balance of Light and Shadow
                },
            },
            { -- Deadwind Pass
                addon.GetMapName(1430),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        777, -- Explore Deadwind Pass
                    },
                },
            },
            {
                1676, -- Loremaster of Eastern Kingdoms
                42, -- Eastern Kingdoms Explorer
                7520, -- The Loremaster
                19719, -- Reclamation of Gilneas
            },
        },
        { -- Kalimdor
            addon.GetMapName(1414),
            { -- Darnassus
                addon.GetMapName(1457),
                {
                    617, -- Immortal No More
                    603, -- Wrath of the Horde
                },
            },
            { -- Orgrimmar
                addon.GetMapName(1454),
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
                {
                    610, -- Orgrimmar Offensive
                    14817, -- Opposing Orgrimmar
                    614, -- For the Alliance!
                    1006, -- City Defender
                    11065, -- It All Makes Sense Now
                    604, -- Wrath of the Alliance
                },
            },
            { -- Thunder Bluff
                addon.GetMapName(1456),
                {
                    611, -- Bleeding Bloodhoof
                    604, -- Wrath of the Alliance
                },
            },
            { -- Teldrassil
                addon.GetMapName(1438),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        842, -- Explore Teldrassil
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Durotar
                addon.GetMapName(1411),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        728, -- Explore Durotar
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
                {
                    4790, -- Zalazane's Fall
                },
            },
            { -- Mulgore
                addon.GetMapName(1412),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        736, -- Explore Mulgore
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Moonglade
                addon.GetMapName(1450),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        855, -- Explore Moonglade
                        9924, -- Field Photographer
                    },
                },
            },
            { -- The Barrens
                addon.GetMapName(1413),
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        750, -- Explore Northern Barrens
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                        2336, -- Insane in the Membrane
                    },
                },
            },
            { -- Darkshore
                addon.GetMapName(1439),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4928, -- Darkshore Quests
                        5453, -- Ghosts in the Dark
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        844, -- Explore Darkshore
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Azshara
                addon.GetMapName(1447),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4927, -- Azshara Quests
                        5454, -- Joy Ride
                        5448, -- Glutton for Fiery Punishment
                        5546, -- Glutton for Icy Punishment
                        5547, -- Glutton for Shadowy Punishment
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        852, -- Explore Azshara
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                },
            },
            { -- Ashenvale
                addon.GetMapName(1440),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4925, -- Ashenvale Quests
                        4976, -- Ashenvale Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        845, -- Explore Ashenvale
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Stonetalon Mountains
                addon.GetMapName(1442),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4936, -- Stonetalon Mountains Quests
                        4980, -- Stonetalon Mountains Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        847, -- Explore Stonetalon Mountains
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Desolace
                addon.GetMapName(1443),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4930, -- Desolace Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        848, -- Explore Desolace
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Feralas
                addon.GetMapName(1444),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4932, -- Feralas Quests
                        4979, -- Feralas Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        849, -- Explore Feralas
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Dustwallow Marsh
                addon.GetMapName(1445),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4929, -- Dustwallow Marsh Quests
                        4978, -- Dustwallow Marsh Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        850, -- Explore Dustwallow Marsh
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
                {
                    40796, -- This Takes Me Back
                },
            },
            { -- Thousand Needles
                addon.GetMapName(1441),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4938, -- Thousand Needles Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        846, -- Explore Thousand Needles
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Tanaris
                addon.GetMapName(1446),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4935, -- Tanaris Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        851, -- Explore Tanaris
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                        2336, -- Insane in the Membrane
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                },
            },
            { -- Felwood
                addon.GetMapName(1448),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4931, -- Felwood Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        853, -- Explore Felwood
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
                {
                    11296, -- The Ancient Keeper
                },
            },
            { -- Un'Goro Crater
                addon.GetMapName(1449),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4939, -- Un'Goro Crater Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        854, -- Explore Un'Goro Crater
                        9924, -- Field Photographer
                    },
                },
                {
                    3357, -- Venomhide Ravasaur
                    11296, -- The Ancient Keeper
                    16431, -- Against the Elements
                },
            },
            { -- Silithus
                addon.GetMapName(1451),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4934, -- Silithus Quests
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        856, -- Explore Silithus
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        953, -- Guardian of Cenarius
                    },
                },
                {
                    416, -- Scarab Lord
                    5533, -- Veteran of the Shifting Sands
                    11296, -- The Ancient Keeper
                },
            },
            { -- Winterspring
                addon.GetMapName(1452),
                { -- Quests
                    CT.Quests,
                    true,
                    {
                        4940, -- Winterspring Quests
                        5443, -- E'ko Madness
                    },
                },
                { -- Exploration
                    CT.Exploration,
                    true,
                    {
                        857, -- Explore Winterspring
                    },
                },
                { -- Reputation
                    CT.Reputation,
                    true,
                    {
                        2336, -- Insane in the Membrane
                    },
                },
                {
                    3356, -- Winterspring Frostsaber
                    11296, -- The Ancient Keeper
                },
            },
            {
                1678, -- Loremaster of Kalimdor
                43, -- Kalimdor Explorer
                7520, -- The Loremaster
            },
        },
        {
            1206, -- To All The Squirrels I've Loved Before
            944, -- They Love Me In That Tunnel
            942, -- The Diplomat
            943, -- The Diplomat
        },
    },
    { -- Dungeons
        CT.Dungeons,
        { -- Ragefire Chasm
            addon.GetLFGActivityShortName(798),
            {
                629, -- Ragefire Chasm
            },
        },
        { -- Wailing Caverns
            addon.GetLFGActivityShortName(796),
            {
                630, -- Wailing Caverns
                11765, -- Pet Battle Challenge: Wailing Caverns
            },
        },
        { -- Blackfathom Deeps
            addon.GetLFGActivityShortName(801),
            {
                632, -- Blackfathom Deeps
            },
        },
        { -- Stormwind Stockades
            addon.GetLFGActivityShortName(802),
            {
                633, -- Stormwind Stockade
            },
        },
        { -- Gnomeregan
            addon.GetLFGActivityShortName(803),
            {
                634, -- Gnomeregan
                13269, -- Pet Battle Challenge: Gnomeregan
            },
        },
        { -- Razorfen Kraul
            addon.GetLFGActivityShortName(804),
            {
                635, -- Razorfen Kraul
            },
        },
        { -- Razorfen Downs
            addon.GetLFGActivityShortName(806),
            {
                636, -- Razorfen Downs
            },
        },
        { -- Scarlet Monastery
            addon.GetInstanceInfoName(316),
            {
                637, -- Scarlet Monastery
                980, -- The Horseman's Reins
            },
        },
        { -- Uldaman
            addon.GetLFGActivityShortName(807),
            {
                638, -- Uldaman
            },
        },
        { -- Zul'Farrak
            addon.GetLFGActivityShortName(808),
            {
                639, -- Zul'Farrak
            },
        },
        { -- Maraudon
            addon.GetLFGActivityShortName(809),
            {
                640, -- Maraudon
            },
        },
        { -- Sunken Temple
            addon.GetLFGActivityShortName(810),
            {
                641, -- Sunken Temple
            },
        },
        { -- Blackrock Depths
            addon.GetLFGActivityShortName(811),
            {
                642, -- Blackrock Depths
                3496, -- A Brew-FAST Mount
                14020, -- Pet Battle Challenge: Blackrock Depths
            },
        },
        { -- Lower Blackrock Spire
            addon.GetLFGActivityShortName(812),
            {
                643, -- Lower Blackrock Spire
            },
        },
        { -- Upper Blackrock Spire
            addon.GetInstanceInfoName(559),
            {
                1307, -- Upper Blackrock Spire (Classic)
                2188, -- Leeeeeeeeeeeeeroy!
            },
        },
        { -- Dire Maul
            addon.GetInstanceInfoName(230),
            {
                644, -- King of Dire Maul
                5788, -- Agent of the Shen'dralar
            },
        },
        { -- Scholomance
            addon.GetInstanceInfoName(246),
            {
                645, -- Scholomance
            },
        },
        { -- Stratholme
            addon.GetLFGActivityShortName(816),
            {
                646, -- Stratholme
                729, -- Deathcharger's Reins
                13627, -- Pet Battle Challenge: Stratholme
                13766, -- Malowned
            },
        },
        {
            1283, -- Classic Dungeonmaster
        },
    },
    { -- Raids
        CT.Raids,
        { -- Molten Core
            addon.GetInstanceInfoName(741),
            { -- Reputation
                    CT.Reputation,
                    true,
                {
                    955, -- Hydraxian Waterlords
                    2496, -- The Fifth Element
                },
            },
            {
                686, -- Molten Core
                11741, -- So Hot Right Now
                429, -- "Sulfuras, Hand of Ragnaros"
                428, -- "Thunderfury, Blessed Blade of the Windseeker"
                9550, -- "Boldly, You Sought the Power of Ragnaros"
                7934, -- Raiding with Leashes
                11296, -- The Ancient Keeper
                11297, -- The Balance of Light and Shadow
                15330, -- Survivor of the Firelord (Season of Mastery)
            },
        },
        { -- Onyxia's Lair
            addon.GetInstanceInfoName(760),
            {
                684, -- Onyxia's Lair (Level 60)
                11296, -- The Ancient Keeper
            },
        },
        { -- Blackwing Lair
            addon.GetInstanceInfoName(742),
            {
                685, -- Blackwing Lair
                11742, -- Dress in Lairs
                7934, -- Raiding with Leashes
                15333, -- Survivor of the Shadow Flame (Season of Mastery)
            },
        },
        { -- Zul'Gurub
            addon.GetInstanceInfoName(76),
            { -- Reputation
                CT.Reputation,
                {
                    957, -- Hero of the Zandalar Tribe
                },
            },
            {
                560, -- Deadliest Catch
                688, -- Zul'Gurub
                880, -- Swift Zulian Tiger
                881, -- Swift Razzashi Raptor
            },
        },
        { -- Ruins of Ahn'Qiraj
            addon.GetInstanceInfoName(743),
            { -- Reputation
                CT.Reputation,
                {
                    953, -- Guardian of Cenarius
                },
            },
            {
                689, -- Ruins of Ahn'Qiraj
            },
        },
        { -- Temple of Ahn'Qiraj
            addon.GetInstanceInfoName(744),
            { -- Reputation
                    CT.Reputation,
                    true,
                {
                    956, -- Brood of Nozdormu
                },
            },
            {
                687, -- Temple of Ahn'Qiraj
                424, -- Why? Because It's Red
                11743, -- Accessor-Eyes
                7934, -- Raiding with Leashes
                15334, -- Survivor of the Old God (Season of Mastery)
            },
        },
        { -- Naxxramas
            addon.GetInstanceInfoName(754),
            {
                11744, -- "Drop Dead, Gorgeous"
                425, -- "Atiesh, Greatstaff of the Guardian"
                15335, -- Survivor of the Damned (Season of Mastery)
                15637, -- The Immortal (Season of Mastery)
                18372, -- Wards of the Dread Citadel
                18557, -- "Never Bothered, Anyway"
                18616, -- Putting Wilhelm Out of Business
            },
        },
        {
            1285, -- Classic Raider
        },
    },
    { -- Professions
        CT.Professions,
        { -- Archaeology
            CT.Archaeology,
                    true,
            {
                4857, -- Journeyman Archaeologist
                4919, -- Expert Archaeologist
                4920, -- Artisan Archaeologist
                4858, -- Seven Scepters
                5191, -- Tragedy in Three Acts
                5193, -- Blue Streak
                4859, -- Kings Under the Mountain
            },
        },
        { -- Cooking
            CT.Cooking,
                    true,
            {
                121, -- Journeyman Cook
                122, -- Expert Cook
                123, -- Classic Cook
                5842, -- Let's Do Lunch: Darnassus
                5841, -- Let's Do Lunch: Ironforge
                5474, -- Let's Do Lunch: Stormwind
                5475, -- Let's Do Lunch: Orgrimmar
                5843, -- Let's Do Lunch: Thunder Bluff
                5844, -- Let's Do Lunch: Undercity
                5845, -- A Bunch of Lunch
                5779, -- You'll Feel Right as Rain
            },
        },
        { -- Fishing
            CT.Fishing,
                    true,
            {
                126, -- Journeyman Fisherman
                127, -- Expert Fisherman
                128, -- Artisan Fisherman
                150, -- The Fishing Diplomat
                306, -- Master Angler of Azeroth
                878, -- One That Didn't Get Away
                1836, -- Old Crafty
                1837, -- Old Ironjaw
                5848, -- Fish or Cut Bait: Darnassus
                5847, -- Fish or Cut Bait: Ironforge
                5476, -- Fish or Cut Bait: Stormwind
                5477, -- Fish or Cut Bait: Orgrimmar
                5849, -- Fish or Cut Bait: Thunder Bluff
                5850, -- Fish or Cut Bait: Undercity
                5851, -- Gone Fishin'
                17367, -- Deadliest Cache
            },
        },
        {
            116, -- Professional Journeyman
            731, -- Professional Expert
            732, -- Professional Classic Master
            18728, -- Working from the Start
            18720, -- Classic Master of All
            131, -- Journeyman Medic
            132, -- Expert Medic
            133, -- Artisan Medic
        },
    },
});
