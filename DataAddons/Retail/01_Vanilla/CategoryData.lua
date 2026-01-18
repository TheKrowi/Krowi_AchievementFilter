local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Classic
    1,
    addon.GetCategoryInfoTitle(14864),
    { -- Zones
        648,
        addon.L["Zones"],
        { -- Eastern Kingdoms
            687,
            addon.GetMapName(13),
            { -- Stormwind City
                922,
                addon.GetMapName(84),
                { -- Exploration
                    1033,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1022,
                        addon.GetCategoryInfoTitle(201),
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
                970,
                addon.GetMapName(87),
                {
                    616, -- Overthrow the Council
                    619, -- For the Horde!
                    603, -- Wrath of the Horde
                },
            },
            { -- Undercity
                974,
                addon.GetMapName(90),
                {
                    612, -- Downing the Dark Lady
                    604, -- Wrath of the Alliance
                },
            },
            { -- Dun Morogh
                721,
                addon.GetMapName(27),
                { -- Exploration
                    723,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        627, -- Explore Dun Morogh
                    },
                },
                { -- Reputation
                    1005,
                        addon.GetCategoryInfoTitle(201),
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
                722,
                addon.GetMapName(37),
                { -- Exploration
                    724,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        776, -- Explore Elwynn Forest
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1006,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Tirisfal Glades
                725,
                addon.GetMapName(18),
                { -- Quests
                    1201,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        15579, -- Return to Lordaeron
                    },
                },
                { -- Exploration
                    726,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        768, -- Explore Tirisfal Glades
                    },
                },
                { -- Reputation
                    1026,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Westfall
                651,
                addon.GetMapName(52),
                { -- Quests
                    653,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4903, -- Westfall Quests
                        12455, -- Westfall & Duskwood Quests
                    },
                },
                { -- Exploration
                    730,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        802, -- Explore Westfall
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1028,
                        addon.GetCategoryInfoTitle(201),
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
                655,
                addon.GetMapName(48),
                { -- Quests
                    657,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4899, -- Loch Modan Quests
                        12456, -- Loch Modan & Wetlands Quests
                    },
                },
                { -- Exploration
                    729,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        779, -- Explore Loch Modan
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1013,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Silverpine Forest
                681,
                addon.GetMapName(21),
                { -- Quests
                    682,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4894, -- Silverpine Forest Quests
                    },
                },
                { -- Exploration
                    732,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        769, -- Explore Silverpine Forest
                    },
                },
                { -- Reputation
                    1020,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Redridge Mountains
                678,
                addon.GetMapName(49),
                { -- Quests
                    677,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4902, -- Redridge Mountains Quests
                    },
                },
                { -- Exploration
                    734,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        780, -- Explore Redridge Mountains
                    },
                },
                { -- Reputation
                    1017,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Duskwood
                652,
                addon.GetMapName(47),
                { -- Quests
                    654,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        12430, -- Duskwood Quests
                        12455, -- Westfall & Duskwood Quests
                    },
                },
                { -- Exploration
                    735,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        778, -- Explore Duskwood
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1007,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Wetlands
                656,
                addon.GetMapName(56),
                { -- Quests
                    658,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        12429, -- Wetlands Quests
                        12456, -- Loch Modan & Wetlands Quests
                    },
                },
                { -- Exploration
                    731,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        841, -- Explore Wetlands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1029,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Hillsbrad Foothills
                671,
                addon.GetMapName(25),
                { -- Quests
                    672,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        5364, -- Don't Want No Zombies on My Lawn
                        5365, -- Bloom and Doom
                        4895, -- Hillsbrad Foothills Quests
                    },
                },
                { -- Exploration
                    736,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        772, -- Explore Hillsbrad Foothills
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1012,
                        addon.GetCategoryInfoTitle(201),
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
                649,
                addon.GetMapName(14),
                { -- Quests
                    650,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4896, -- Arathi Highlands Quests
                    },
                },
                { -- Exploration
                    741,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        761, -- Explore Arathi Highlands
                    },
                },
                { -- Reputation
                    996,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Northern Stranglethorn
                675,
                addon.GetMapName(50),
                { -- Quests
                    676,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4906, -- Northern Stranglethorn Quests
                        940, -- The Green Hills of Stranglethorn
                        941, -- Hemet Nesingwary: The Collected Quests
                    },
                },
                { -- Exploration
                    739,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        781, -- Explore Northern Stranglethorn
                        17366, -- Relics of a Fallen Empire
                    },
                },
                { -- Reputation
                    1016,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- The Cape of Stranglethorn
                665,
                addon.GetMapName(210),
                { -- Quests
                    666,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4905, -- Cape of Stranglethorn Quests
                    },
                },
                { -- Exploration
                    740,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4995, -- Explore the Cape of Stranglethorn
                        9924, -- Field Photographer
                    },
                },
                { -- Player vs. Player
                    1164,
                    addon.GetCategoryInfoTitle(95),
                    {
                        389, -- Gurubashi Arena Master
                        396, -- Gurubashi Arena Grand Master
                    },
                },
                { -- Reputation
                    993,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                        871, -- Avast Ye, Admiral!
                        2336, -- Insane in the Membrane
                    },
                },
            },
            { -- Western Plaguelands
                685,
                addon.GetMapName(22),
                { -- Quests
                    686,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4893, -- Western Plaguelands Quests
                    },
                },
                { -- Exploration
                    746,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        770, -- Explore Western Plaguelands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1027,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- The Hinterlands
                673,
                addon.GetMapName(26),
                { -- Quests
                    674,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4897, -- Hinterlands Quests
                    },
                },
                { -- Exploration
                    742,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        773, -- Explore The Hinterlands
                    },
                },
                { -- Reputation
                    1024,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Eastern Plaguelands
                667,
                addon.GetMapName(23),
                { -- Quests
                    668,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4892, -- Eastern Plaguelands Quests
                        5442, -- Full Caravan
                    },
                },
                { -- Exploration
                    747,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        771, -- Explore Eastern Plaguelands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    778,
                        addon.GetCategoryInfoTitle(201),
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
                659,
                addon.GetMapName(15),
                { -- Quests
                    661,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4900, -- Badlands Quests
                        5444, -- Ready, Set, Goat!
                    },
                },
                { -- Exploration
                    738,
                        addon.GetCategoryInfoTitle(97),
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
                679,
                addon.GetMapName(32),
                { -- Quests
                    680,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4910, -- Searing Gorge Quests
                    },
                },
                { -- Exploration
                    743,
                        addon.GetCategoryInfoTitle(97),
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
                683,
                addon.GetMapName(51),
                { -- Quests
                    684,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4904, -- Swamp of Sorrows Quests
                    },
                },
                { -- Exploration
                    737,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        782, -- Explore Swamp of Sorrows
                    },
                },
                { -- Reputation
                    1023,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Burning Steppes
                663,
                addon.GetMapName(36),
                { -- Quests
                    664,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4901, -- Burning Steppes Quests
                    },
                },
                { -- Exploration
                    745,
                        addon.GetCategoryInfoTitle(97),
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
                660,
                addon.GetMapName(17),
                { -- Quests
                    662,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4909, -- Blasted Lands Quests
                    },
                },
                { -- Exploration
                    744,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        766, -- Explore Blasted Lands
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    999,
                        addon.GetCategoryInfoTitle(201),
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
                748,
                addon.GetMapName(42),
                { -- Exploration
                    749,
                        addon.GetCategoryInfoTitle(97),
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
            688,
            addon.GetMapName(12),
            { -- Darnassus
                975,
                addon.GetMapName(89),
                {
                    617, -- Immortal No More
                    603, -- Wrath of the Horde
                },
            },
            { -- Orgrimmar
                921,
                addon.GetMapName(85),
                { -- Reputation
                    1018,
                        addon.GetCategoryInfoTitle(201),
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
                923,
                addon.GetMapName(88),
                {
                    611, -- Bleeding Bloodhoof
                    604, -- Wrath of the Alliance
                },
            },
            { -- Teldrassil
                756,
                addon.GetMapName(57),
                { -- Exploration
                    757,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        842, -- Explore Teldrassil
                    },
                },
                { -- Reputation
                    1025,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Durotar
                752,
                addon.GetMapName(1),
                { -- Exploration
                    753,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        728, -- Explore Durotar
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1003,
                        addon.GetCategoryInfoTitle(201),
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
                754,
                addon.GetMapName(7),
                { -- Exploration
                    755,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        736, -- Explore Mulgore
                    },
                },
                { -- Reputation
                    1014,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Moonglade
                774,
                addon.GetMapName(80),
                { -- Exploration
                    775,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        855, -- Explore Moonglade
                        9924, -- Field Photographer
                    },
                },
            },
            { -- Northern Barrens
                705,
                addon.GetMapName(10),
                { -- Quests
                    706,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4933, -- Northern Barrens Quests
                    },
                },
                { -- Exploration
                    760,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        750, -- Explore Northern Barrens
                    },
                },
                { -- Reputation
                    1015,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                        2336, -- Insane in the Membrane
                    },
                },
                {
                    11200, -- Stand Against the Legion
                    11201, -- Defender of Azeroth: Legion Invasions
                    16431, -- Against the Elements
                },
            },
            { -- Darkshore
                695,
                addon.GetMapName(62),
                { -- Quests
                    696,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4928, -- Darkshore Quests
                        5453, -- Ghosts in the Dark
                    },
                },
                { -- Exploration
                    762,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        844, -- Explore Darkshore
                    },
                },
                { -- Reputation
                    1001,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Azshara
                691,
                addon.GetMapName(76),
                { -- Quests
                    692,
                        addon.GetCategoryInfoTitle(96),
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
                    771,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        852, -- Explore Azshara
                    },
                },
                { -- Reputation
                    990,
                        addon.GetCategoryInfoTitle(201),
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
                689,
                addon.GetMapName(63),
                { -- Quests
                    690,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4925, -- Ashenvale Quests
                        4976, -- Ashenvale Quests
                    },
                },
                { -- Exploration
                    764,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        845, -- Explore Ashenvale
                    },
                },
                { -- Reputation
                    997,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Stonetalon Mountains
                709,
                addon.GetMapName(65),
                { -- Quests
                    710,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4936, -- Stonetalon Mountains Quests
                        4980, -- Stonetalon Mountains Quests
                    },
                },
                { -- Exploration
                    766,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        847, -- Explore Stonetalon Mountains
                    },
                },
                { -- Reputation
                    1021,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Desolace
                697,
                addon.GetMapName(66),
                { -- Quests
                    698,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4930, -- Desolace Quests
                    },
                },
                { -- Exploration
                    767,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        848, -- Explore Desolace
                    },
                },
                { -- Reputation
                    1002,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Southern Barrens
                711,
                addon.GetMapName(199),
                { -- Quests
                    712,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4937, -- Southern Barrens Quests
                        4981, -- Southern Barrens Quests
                    },
                },
                { -- Exploration
                    761,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4996, -- Explore Southern Barrens
                    },
                },
                { -- Reputation
                    1019,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Feralas
                703,
                addon.GetMapName(69),
                { -- Quests
                    704,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4932, -- Feralas Quests
                        4979, -- Feralas Quests
                    },
                },
                { -- Exploration
                    769,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        849, -- Explore Feralas
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1009,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Dustwallow Marsh
                699,
                addon.GetMapName(70),
                { -- Quests
                    700,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4929, -- Dustwallow Marsh Quests
                        4978, -- Dustwallow Marsh Quests
                    },
                },
                { -- Exploration
                    768,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        850, -- Explore Dustwallow Marsh
                    },
                },
                { -- Reputation
                    1004,
                        addon.GetCategoryInfoTitle(201),
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
                715,
                addon.GetMapName(64),
                { -- Quests
                    716,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4938, -- Thousand Needles Quests
                    },
                },
                { -- Exploration
                    765,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        846, -- Explore Thousand Needles
                    },
                },
                { -- Reputation
                    994,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Tanaris
                713,
                addon.GetMapName(71),
                { -- Quests
                    714,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4935, -- Tanaris Quests
                    },
                },
                { -- Exploration
                    770,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        851, -- Explore Tanaris
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    992,
                        addon.GetCategoryInfoTitle(201),
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
                701,
                addon.GetMapName(77),
                { -- Quests
                    702,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4931, -- Felwood Quests
                    },
                },
                { -- Exploration
                    772,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        853, -- Explore Felwood
                    },
                },
                { -- Reputation
                    991,
                        addon.GetCategoryInfoTitle(201),
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
                717,
                addon.GetMapName(78),
                { -- Quests
                    718,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4939, -- Un'Goro Crater Quests
                    },
                },
                { -- Exploration
                    773,
                        addon.GetCategoryInfoTitle(97),
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
                707,
                addon.GetMapName(81),
                { -- Quests
                    708,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4934, -- Silithus Quests
                    },
                },
                { -- Exploration
                    776,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        856, -- Explore Silithus
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    783,
                        addon.GetCategoryInfoTitle(201),
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
                719,
                addon.GetMapName(83),
                { -- Quests
                    720,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4940, -- Winterspring Quests
                        5443, -- E'ko Madness
                    },
                },
                { -- Exploration
                    777,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        857, -- Explore Winterspring
                    },
                },
                { -- Reputation
                    1031,
                        addon.GetCategoryInfoTitle(201),
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
        2,
        addon.GetCategoryInfoTitle(15272),
        { -- Ragefire Chasm
            5,
            addon.GetLFGActivityShortName(52),
            {
                629, -- Ragefire Chasm
            },
        },
        { -- Wailing Caverns
            8,
            addon.GetLFGActivityShortName(50),
            {
                630, -- Wailing Caverns
                11765, -- Pet Battle Challenge: Wailing Caverns
            },
        },
        { -- Blackfathom Deeps
            10,
            addon.GetLFGActivityShortName(54),
            {
                632, -- Blackfathom Deeps
            },
        },
        { -- Stormwind Stockades
            11,
            addon.GetLFGActivityShortName(55),
            {
                633, -- Stormwind Stockade
            },
        },
        { -- Gnomeregan
            12,
            addon.GetLFGActivityShortName(56),
            {
                634, -- Gnomeregan
                13269, -- Pet Battle Challenge: Gnomeregan
            },
        },
        { -- Razorfen Kraul
            13,
            addon.GetLFGActivityShortName(57),
            {
                635, -- Razorfen Kraul
            },
        },
        { -- Razorfen Downs
            14,
            addon.GetLFGActivityShortName(58),
            {
                636, -- Razorfen Downs
            },
        },
        { -- Uldaman
            17,
            addon.GetLFGActivityShortName(59),
            {
                638, -- Uldaman
            },
        },
        { -- Zul'Farrak
            18,
            addon.GetLFGActivityShortName(60),
            {
                639, -- Zul'Farrak
            },
        },
        { -- Maraudon
            19,
            addon.GetLFGActivityShortName(61),
            {
                640, -- Maraudon
            },
        },
        { -- Sunken Temple
            20,
            addon.GetLFGActivityShortName(62),
            {
                641, -- Sunken Temple
            },
        },
        { -- Blackrock Depths
            21,
            addon.GetLFGActivityShortName(63),
            {
                642, -- Blackrock Depths
                3496, -- A Brew-FAST Mount
                14020, -- Pet Battle Challenge: Blackrock Depths
            },
        },
        { -- Lower Blackrock Spire
            22,
            addon.GetLFGActivityShortName(64),
            {
                643, -- Lower Blackrock Spire
            },
        },
        { -- Upper Blackrock Spire
            797,
            addon.GetInstanceInfoName(559),
            {
                1307, -- Upper Blackrock Spire (Classic)
                2188, -- Leeeeeeeeeeeeeroy!
            },
        },
        { -- Dire Maul
            23,
            addon.GetInstanceInfoName(230),
            {
                644, -- King of Dire Maul
                5788, -- Agent of the Shen'dralar
            },
        },
        { -- Scholomance
            24,
            addon.GetInstanceInfoName(246),
            {
                18368, -- Memory of Scholomance
                18558, -- Leaders of Scholomance
            },
        },
        { -- Stratholme
            25,
            addon.GetLFGActivityShortName(66),
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
        3,
        addon.GetCategoryInfoTitle(15271),
        { -- Molten Core
            7,
            addon.GetInstanceInfoName(741),
            { -- Reputation
                779,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    955, -- Hydraxian Waterlords
                    2496, -- The Fifth Element
                },
            },
            {
                686, -- Molten Core
                11741, -- So Hot Right Now
                429, -- Sulfuras, Hand of Ragnaros
                428, -- Thunderfury, Blessed Blade of the Windseeker
                9550, -- Boldly, You Sought the Power of Ragnaros
                7934, -- Raiding with Leashes
                11296, -- The Ancient Keeper
                11297, -- The Balance of Light and Shadow
                15330, -- Survivor of the Firelord (Season of Mastery)
            },
        },
        { -- Onyxia's Lair
            26,
            addon.GetInstanceInfoName(760),
            {
                684, -- Onyxia's Lair (Level 60)
                11296, -- The Ancient Keeper
            },
        },
        { -- Blackwing Lair
            27,
            addon.GetInstanceInfoName(742),
            {
                685, -- Blackwing Lair
                11742, -- Dress in Lairs
                7934, -- Raiding with Leashes
                15333, -- Survivor of the Shadow Flame (Season of Mastery)
            },
        },
        { -- Zul'Gurub
            28,
            addon.GetInstanceInfoName(76),
            { -- Reputation
                789,
                addon.GetCategoryInfoTitle(201),
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
            29,
            addon.GetInstanceInfoName(743),
            { -- Reputation
                784,
                addon.GetCategoryInfoTitle(201),
                {
                    953, -- Guardian of Cenarius
                },
            },
            {
                689, -- Ruins of Ahn'Qiraj
            },
        },
        { -- Temple of Ahn'Qiraj
            30,
            addon.GetInstanceInfoName(744),
            { -- Reputation
                780,
                addon.GetCategoryInfoTitle(201),
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
            796,
            addon.GetInstanceInfoName(754),
            {
                11744, -- Drop Dead, Gorgeous
                425, -- Atiesh, Greatstaff of the Guardian
                15335, -- Survivor of the Damned (Season of Mastery)
                15637, -- The Immortal (Season of Mastery)
                18372, -- Wards of the Dread Citadel
                18557, -- Never Bothered, Anyway
                18616, -- Putting Wilhelm Out of Business
            },
        },
        {
            1285, -- Classic Raider
        },
    },
    { -- Professions
        1150,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1468,
            addon.GetCategoryInfoTitle(15071),
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
        { -- Blacksmithing
            1476,
            addon.GetCategoryInfoTitle(15490),
            true,
            {
                18765, -- Destined to be Legendary
                18853, -- Seething Flames of Hatred
            },
        },
        { -- Cooking
            1477,
            addon.GetCategoryInfoTitle(170),
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
            1500,
            addon.GetCategoryInfoTitle(171),
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
        { -- Leatherworking
            1513,
            addon.GetCategoryInfoTitle(15495),
            true,
            {
                18899, -- You Saw Nothing
            },
        },
        { -- Mining
            1516,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18841, -- Doing Your Share
            },
        },
        { -- Tailoring
            1529,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                18903, -- Ton of Tops
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
    { -- Pet Battles
        785,
        addon.GetCategoryInfoTitle(15117),
        {
            6586, -- Eastern Kingdoms Safari
            6585, -- Kalimdor Safari
            6613, -- Eastern Kingdoms Tamer
            6612, -- Kalimdor Tamer
            6603, -- Taming Eastern Kingdoms
            61029, -- Aquatic Battler of Eastern Kingdoms
            61030, -- Beast Battler of Eastern Kingdoms
            61031, -- Critter Battler of Eastern Kingdoms
            61032, -- Dragonkin Battler of Eastern Kingdoms
            61033, -- Elemental Battler of Eastern Kingdoms
            61034, -- Flying Battler of Eastern Kingdoms
            61035, -- Humanoid Battler of Eastern Kingdoms
            61036, -- Magic Battler of Eastern Kingdoms
            61037, -- Mechanical Battler of Eastern Kingdoms
            61028, -- Undead Battler of Eastern Kingdoms
            61040, -- Family Battler of Eastern Kingdoms
            6602, -- Taming Kalimdor
            61041, -- Aquatic Battler of Kalimdor
            61042, -- Beast Battler of Kalimdor
            61043, -- Critter Battler of Kalimdor
            61044, -- Dragonkin Battler of Kalimdor
            61045, -- Elemental Battler of Kalimdor
            61046, -- Flying Battler of Kalimdor
            61047, -- Humanoid Battler of Kalimdor
            61048, -- Magic Battler of Kalimdor
            61049, -- Mechanical Battler of Kalimdor
            61050, -- Undead Battler of Kalimdor
            61051, -- Family Battler of Kalimdor
            61094, -- Old World Family Battler
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            14021, -- The Shadows Revealed
            6584, -- Big City Pet Brawlin' - Alliance
            6621, -- Big City Pet Brawlin' - Horde
            6622, -- Big City Pet Brawler
            6611, -- Continental Tamer
            6590, -- World Safari
            8348, -- The Longest Day
        },
    },
    { -- Dragonriding Races
        1530,
        addon.L["Dragonriding Races"],
        { -- Kalimdor Cup
            1449,
            addon.L["Kalimdor Cup"],
            {
                17712, -- Kalimdor: Bronze
                17713, -- Kalimdor: Silver
                17714, -- Kalimdor: Gold
                17715, -- Kalimdor Advanced: Bronze
                17716, -- Kalimdor Advanced: Silver
                17717, -- Kalimdor Advanced: Gold
                17718, -- Kalimdor Reverse: Bronze
                17719, -- Kalimdor Reverse: Silver
                17720, -- Kalimdor Reverse: Gold
                17721, -- Kalimdor Racing Completionist
                17722, -- Kalimdor Racing Completionist: Silver
                17723, -- Kalimdor Racing Completionist: Gold
            },
        },
        { -- Eastern Kingdoms Cup
            1533,
            addon.L["Eastern Kingdoms Cup"],
            {
                18566, -- Eastern Kingdoms: Bronze
                18567, -- Eastern Kingdoms: Silver
                18568, -- Eastern Kingdoms: Gold
                18569, -- Eastern Kingdoms Advanced: Bronze
                18570, -- Eastern Kingdoms Advanced: Silver
                18571, -- Eastern Kingdoms Advanced: Gold
                18572, -- Eastern Kingdoms Reverse: Bronze
                18573, -- Eastern Kingdoms Reverse: Silver
                18574, -- Eastern Kingdoms Reverse: Gold
                18939, -- Eastern Kingdoms Racing Completionist
                18940, -- Eastern Kingdoms Racing Completionist: Silver
                18942, -- Eastern Kingdoms Racing Completionist: Gold
            },
        },
    },
});