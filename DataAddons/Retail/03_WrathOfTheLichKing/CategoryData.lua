local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Wrath of the Lich King
    83,
    addon.GetCategoryInfoTitle(14866),
    { -- Zones
        577,
        addon.L["Zones"],
        { -- Dalaran
            614,
            addon.GetMapName(125),
            {
                1956, -- Higher Learning
                2084, -- Ring of the Kirin Tor
                2076, -- Armored Brown Bear
                2077, -- Wooly Mammoth
                2078, -- Traveler's Tundra Mammoth
            },
        },
        { -- Borean Tundra
            578,
            addon.GetMapName(114),
            { -- Quests
                586,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    33, -- Nothing Boring About Borean
                    1358, -- Nothing Boring About Borean
                    561, -- D.E.H.T.A's Little P.I.T.A.
                    61910, -- Mrglgrgl of Grglmrgl
                },
            },
            { -- Exploration
                587,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1264, -- Explore Borean Tundra
                },
            },
            { -- Reputation
                588,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    949, -- Tuskarrmageddon
                },
            },
        },
        { -- Howling Fjord
            579,
            addon.GetMapName(117),
            { -- Quests
                589,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    34, -- I've Toured the Fjord
                    1356, -- I've Toured the Fjord
                },
            },
            { -- Exploration
                590,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1263, -- Explore Howling Fjord
                    1254, -- Friend or Fowl?
                    9924, -- Field Photographer
                },
            },
        },
        { -- Dragonblight
            580,
            addon.GetMapName(115),
            { -- Quests
                592,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    35, -- Might of Dragonblight
                    1359, -- Might of Dragonblight
                    547, -- Veteran of the Wrathgate
                    1277, -- Rapid Defense
                },
            },
            { -- Exploration
                593,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1265, -- Explore Dragonblight
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                594,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    1007, -- The Wyrmrest Accord
                },
            },
            {
                40796, -- This Takes Me Back
            },
        },
        { -- Grizzly Hills
            581,
            addon.GetMapName(116),
            { -- Quests
                595,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    37, -- Fo' Grizzle My Shizzle
                    1357, -- Fo' Grizzle My Shizzle
                },
            },
            { -- Exploration
                596,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1266, -- Explore Grizzly Hills
                },
            },
            { -- PvP
                782,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    2016, -- Grizzled Veteran
                    2017, -- Grizzled Veteran
                },
            },
        },
        { -- Zul'Drak
            582,
            addon.GetMapName(121),
            { -- Quests
                598,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    36, -- The Empire of Zul'Drak
                    1596, -- Guru of Drakuru
                    1576, -- Of Blood and Anguish
                    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
                },
            },
            { -- Exploration
                599,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1267, -- Explore Zul'Drak
                },
            },
        },
        { -- Sholazar Basin
            583,
            addon.GetMapName(119),
            { -- Quests
                601,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    39, -- Into the Basin
                    961, -- Honorary Frenzyheart
                    962, -- Savior of the Oracles
                    938, -- The Snows of Northrend
                    941, -- Hemet Nesingwary: The Collected Quests
                },
            },
            { -- Exploration
                602,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1268, -- Explore Sholazar Basin
                },
            },
            { -- Reputation
                603,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    950, -- Frenzyheart Tribe
                    951, -- The Oracles
                    952, -- Mercenary of Sholazar
                },
            },
        },
        { -- Crystalsong Forest
            610,
            addon.GetMapName(127),
            {
                1457, -- Explore Crystalsong Forest
                9924, -- Field Photographer
            },
        },
        { -- Storm Peaks
            584,
            addon.GetMapName(120),
            { -- Quests
                604,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    38, -- The Summit of Storm Peaks
                    1428, -- Mine Sweeper
                },
            },
            { -- Exploration
                612,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1269, -- Explore Storm Peaks
                },
            },
            { -- Reputation
                606,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    2082, -- Ice Mammoth
                    2083, -- Grand Ice Mammoth
                },
            },
        },
        { -- Icecrown
            585,
            addon.GetMapName(118),
            { -- Quests
                607,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    40, -- Icecrown: The Final Goal
                },
            },
            { -- Exploration
                608,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    1270, -- Explore Icecrown
                },
            },
            { -- Reputation
                609,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    947, -- The Argent Crusade
                    945, -- The Argent Champion
                },
            },
            {
                14750, -- Death Rising
            },
        },
        { -- Wintergrasp
            1034,
            addon.GetMapName(123),
            {
                9924, -- Field Photographer
            },
        },
        {
            41, -- Loremaster of Northrend
            2256, -- Northern Exposure
            2257, -- Frostbitten
            2557, -- To All The Squirrels Who Shared My Life
            45, -- Northrend Explorer
            1008, -- The Kirin Tor
            1009, -- Knights of the Ebon Blade
            1010, -- Northrend Vanguard
            1011, -- The Winds of the North
            1012, -- The Winds of the North
            2556, -- Pest Control
            7520, -- The Loremaster
        },
    },
    { -- Dungeons
        84,
        addon.GetCategoryInfoTitle(15272),
        { -- Utgarde Keep
            86,
            addon.GetInstanceInfoName(285),
            {
                1919, -- On The Rocks
                477, -- Utgarde Keep
                489, -- Heroic: Utgarde Keep
                17213, -- Defense Protocol Alpha: Utgarde Keep
                18590, -- Defense Protocol Beta: Utgarde Keep
                19427, -- Defense Protocol Gamma: Utgarde Keep
            },
        },
        { -- The Nexus
            87,
            addon.GetInstanceInfoName(281),
            {
                2150, -- Split Personality
                2037, -- Chaos Theory
                2036, -- Intense Cold
                478, -- The Nexus
                490, -- Heroic: The Nexus
                17283, -- Defense Protocol Alpha: The Nexus
                18591, -- Defense Protocol Beta: The Nexus
                19428, -- Defense Protocol Gamma: The Nexus
            },
        },
        { -- Azjol-Nerub
            88,
            addon.GetInstanceInfoName(272),
            {
                1296, -- Watch Him Die
                1297, -- Hadronox Denied
                1860, -- Gotta Go!
                480, -- Azjol-Nerub
                491, -- Heroic: Azjol-Nerub
                17285, -- Defense Protocol Alpha: Azjol-Nerub
                18592, -- Defense Protocol Beta: Azjol-Nerub
                19429, -- Defense Protocol Gamma: Azjol-Nerub
            },
        },
        { -- Ahn'kahet: The Old Kingdom
            89,
            addon.GetInstanceInfoName(271),
            {
                2038, -- Respect Your Elders
                2056, -- Volunteer Work
                1862, -- Volazj's Quick Demise
                481, -- Ahn'kahet: The Old Kingdom
                492, -- Heroic: Ahn'kahet: The Old Kingdom
                17291, -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
                18593, -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
                19430, -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
            },
        },
        { -- Drak'Tharon Keep
            90,
            addon.GetInstanceInfoName(273),
            {
                2151, -- Consumption Junction
                2057, -- Oh Novos!
                2039, -- Better Off Dred
                482, -- Drak'Tharon Keep
                493, -- Heroic: Drak'Tharon Keep
                17292, -- Defense Protocol Alpha: Drak'Tharon Keep
                18594, -- Defense Protocol Beta: Drak'Tharon Keep
                19431, -- Defense Protocol Gamma: Drak'Tharon Keep
            },
        },
        { -- The Violet Hold
            91,
            addon.GetInstanceInfoName(283),
            {
                1865, -- Lockdown!
                2041, -- Dehydration
                2153, -- A Void Dance
                1816, -- Defenseless
                483, -- The Violet Hold
                494, -- Heroic: The Violet Hold
                17293, -- Defense Protocol Alpha: The Violet Hold
                18595, -- Defense Protocol Beta: The Violet Hold
                19432, -- Defense Protocol Gamma: The Violet Hold
            },
        },
        { -- Gundrak
            92,
            addon.GetInstanceInfoName(274),
            {
                2058, -- Snakes. Why'd It Have To Be Snakes?
                2040, -- Less-rabi
                1864, -- What the Eck?
                2152, -- Share The Love
                484, -- Gundrak
                495, -- Heroic: Gundrak
                17295, -- Defense Protocol Alpha: Gundrak
                18596, -- Defense Protocol Beta: Gundrak
                19433, -- Defense Protocol Gamma: Gundrak
            },
        },
        { -- Halls of Stone
            93,
            addon.GetInstanceInfoName(277),
            {
                1866, -- Good Grief
                2154, -- Brann Spankin' New
                2155, -- Abuse the Ooze
                485, -- Halls of Stone
                496, -- Heroic: Halls of Stone
                17297, -- Defense Protocol Alpha: Halls of Stone
                18597, -- Defense Protocol Beta: Halls of Stone
                19434, -- Defense Protocol Gamma: Halls of Stone
            },
        },
        { -- Halls of Lightning
            94,
            addon.GetInstanceInfoName(275),
            {
                1834, -- Lightning Struck
                2042, -- Shatter Resistant
                1867, -- Timely Death
                486, -- Halls of Lightning
                497, -- Heroic: Halls of Lightning
                17299, -- Defense Protocol Alpha: Halls of Lightning
                18598, -- Defense Protocol Beta: Halls of Lightning
                19435, -- Defense Protocol Gamma: Halls of Lightning
            },
        },
        { -- The Oculus
            95,
            addon.GetInstanceInfoName(282),
            {
                1868, -- Make It Count
                2046, -- Amber Void
                2045, -- Emerald Void
                2044, -- Ruby Void
                1871, -- Experienced Drake Rider
                487, -- The Oculus
                498, -- Heroic: The Oculus
                17300, -- Defense Protocol Alpha: The Oculus
                18599, -- Defense Protocol Beta: The Oculus
                19436, -- Defense Protocol Gamma: The Oculus
            },
        },
        { -- Utgarde Pinnacle
            97,
            addon.GetInstanceInfoName(286),
            {
                2043, -- The Incredible Hulk
                1873, -- Lodi Dodi We Loves the Skadi
                2156, -- My Girl Loves to Skadi All the Time
                2157, -- King's Bane
                488, -- Utgarde Pinnacle
                499, -- Heroic: Utgarde Pinnacle
                17301, -- Defense Protocol Alpha: Utgarde Pinnacle
                18600, -- Defense Protocol Beta: Utgarde Pinnacle
                19437, -- Defense Protocol Gamma: Utgarde Pinnacle
            },
        },
        { -- The Culling of Stratholme
            96,
            addon.GetInstanceInfoName(279),
            {
                1872, -- Zombiefest!
                1817, -- The Culling of Time
                479, -- The Culling of Stratholme
                500, -- Heroic: The Culling of Stratholme
                17302, -- Defense Protocol Alpha: The Culling of Stratholme
                18601, -- Defense Protocol Beta: The Culling of Stratholme
                19438, -- Defense Protocol Gamma: The Culling of Stratholme
            },
        },
        { -- Trial of the Champion
            98,
            addon.GetInstanceInfoName(284),
            {
                3803, -- The Faceroller
                3802, -- Argent Confessor
                3804, -- I've Had Worse
                4296, -- Trial of the Champion
                3778, -- Trial of the Champion
                4298, -- Heroic: Trial of the Champion
                4297, -- Heroic: Trial of the Champion
                18677, -- Defense Protocol Beta: Trial of the Champion
                18678, -- Defense Protocol Beta: Trial of the Champion
                19426, -- Defense Protocol Gamma: Trial of the Champion
                19425, -- Defense Protocol Gamma: Trial of the Champion
            },
        },
        { -- The Forge of Souls
            99,
            addon.GetInstanceInfoName(280),
            {
                4522, -- Soul Power
                4523, -- Three Faced
                4516, -- The Forge of Souls
                4519, -- Heroic: The Forge of Souls
            },
        },
        { -- Pit of Saron
            100,
            addon.GetInstanceInfoName(278),
            {
                4524, -- Doesn't Go to Eleven
                4525, -- Don't Look Up
                4517, -- The Pit of Saron
                4520, -- Heroic: The Pit of Saron
                61271, -- Keystone Hero: Pit of Saron
                61592, -- Keystone Victor: Pit of Saron
            },
        },
        { -- Halls of Reflection
            101,
            addon.GetInstanceInfoName(276),
            {
                4526, -- We're Not Retreating; We're Advancing in a Different Direction.
                4518, -- The Halls of Reflection
                4521, -- Heroic: The Halls of Reflection
            },
        },
        {
            1288, -- Northrend Dungeonmaster
            1289, -- Northrend Dungeon Hero
            17304, -- Defense Protocol Alpha: Terminated
            18614, -- Defense Protocol Beta: Terminated
            18688, -- Defense Protocol Beta: Terminated
            19439, -- Defense Protocol Gamma: Terminated
            19440, -- Defense Protocol Gamma: Terminated
            1658, -- Champion of the Frozen Wastes
            2136, -- Glory of the Hero
            2018, -- Timear Foresees
            2019, -- Proof of Demise
            2085, -- 50 Stone Keeper's Shards
            2086, -- 100 Stone Keeper's Shards
            2087, -- 250 Stone Keeper's Shards
            2088, -- 500 Stone Keeper's Shards
            2089, -- 1000 Stone Keeper's Shards
            4784, -- Emblematic
            4785, -- Emblematic
            3838, -- Dungeon & Raid Emblem
            3839, -- 25 Dungeon & Raid Emblems
            3840, -- 50 Dungeon & Raid Emblems
            3841, -- 100 Dungeon & Raid Emblems
            3842, -- 250 Dungeon & Raid Emblems
            3843, -- 500 Dungeon & Raid Emblems
            3844, -- 1000 Dungeon & Raid Emblems
            3876, -- 1500 Dungeon & Raid Emblems
            4316, -- 2500 Dungeon & Raid Emblems
        },
    },
    { -- Raids
        85,
        addon.GetCategoryInfoTitle(15271),
        { -- Vault of Archavon
            102,
            addon.GetInstanceInfoName(753),
            { -- Vault of Archavon 10
                103,
                (GetDifficultyInfo(3)),
                {
                    4016, -- Earth, Wind & Fire (10 player)
                    1722, -- Archavon the Stone Watcher (10 player)
                    3136, -- Emalon the Storm Watcher (10 player)
                    3836, -- Koralon the Flame Watcher (10 player)
                    4585, -- Toravon the Ice Watcher (10 player)
                },
            },
            { -- Vault of Archavon 25
                104,
                (GetDifficultyInfo(4)),
                {
                    4017, -- Earth, Wind & Fire (25 player)
                    1721, -- Archavon the Stone Watcher (25 player)
                    3137, -- Emalon the Storm Watcher (25 player)
                    3837, -- Koralon the Flame Watcher (25 player)
                    4586, -- Toravon the Ice Watcher (25 player)
                },
            },
            {
                2081, -- Grand Black War Mammoth
            },
        },
        { -- Naxxramas
            105,
            addon.GetInstanceInfoName(754),
            { -- Naxxramas 10
                106,
                (GetDifficultyInfo(3)),
                {
                    1997, -- Momma Said Knock You Out (10 player)
                    1858, -- Arachnophobia (10 player)
                    1856, -- Make Quick Werk of Him (10 player)
                    2178, -- Shocking! (10 player)
                    2180, -- Subtraction (10 player)
                    1996, -- The Safety Dance (10 player)
                    2182, -- Spore Loser (10 player)
                    2176, -- And They Would All Go Down Together (10 player)
                    2146, -- The Hundred Club (10 player)
                    2184, -- Just Can't Get Enough (10 player)
                    578, -- The Dedicated Few (10 player)
                    562, -- The Arachnid Quarter (10 player)
                    564, -- The Construct Quarter (10 player)
                    566, -- The Plague Quarter (10 player)
                    568, -- The Military Quarter (10 player)
                    572, -- Sapphiron's Demise (10 player)
                    574, -- Kel'Thuzad's Defeat (10 player)
                    576, -- The Fall of Naxxramas (10 player)
                    2187, -- The Undying
                },
            },
            { -- Naxxramas 25
                107,
                (GetDifficultyInfo(4)),
                {
                    2140, -- Momma Said Knock You Out (25 player)
                    1859, -- Arachnophobia (25 player)
                    1857, -- Make Quick Werk of Him (25 player)
                    2179, -- Shocking! (25 player)
                    2181, -- Subtraction (25 player)
                    2139, -- The Safety Dance (25 player)
                    2183, -- Spore Loser (25 player)
                    2177, -- And They Would All Go Down Together (25 player)
                    2147, -- The Hundred Club (25 player)
                    2185, -- Just Can't Get Enough (25 player)
                    579, -- The Dedicated Few (25 player)
                    563, -- The Arachnid Quarter (25 player)
                    565, -- The Construct Quarter (25 player)
                    567, -- The Plague Quarter (25 player)
                    569, -- The Military Quarter (25 player)
                    573, -- Sapphiron's Demise (25 player)
                    575, -- Kel'Thuzad's Defeat (25 player)
                    577, -- The Fall of Naxxramas (25 player)
                    2186, -- The Immortal
                },
            },
            {
                11750, -- Undying Aesthetic
                7934, -- Raiding with Leashes
                9924, -- Field Photographer
            },
        },
        { -- The Obsidian Sanctum
            108,
            addon.GetInstanceInfoName(755),
            { -- The Obsidian Sanctum 10
                109,
                (GetDifficultyInfo(3)),
                {
                    2047, -- Gonna Go When the Volcano Blows (10 player)
                    2049, -- Twilight Assist (10 player)
                    2050, -- Twilight Duo (10 player)
                    2051, -- The Twilight Zone (10 player)
                    624, -- Less Is More (10 player)
                    1876, -- Besting the Black Dragonflight (10 player)
                },
            },
            { -- The Obsidian Sanctum 25
                110,
                (GetDifficultyInfo(4)),
                {
                    2048, -- Gonna Go When the Volcano Blows (25 player)
                    2052, -- Twilight Assist (25 player)
                    2053, -- Twilight Duo (25 player)
                    2054, -- The Twilight Zone (25 player)
                    1877, -- Less Is More (25 player)
                    625, -- Besting the Black Dragonflight (25 player)
                },
            },
        },
        { -- The Eye of Eternity
            111,
            addon.GetInstanceInfoName(756),
            { -- The Eye of Eternity 10
                112,
                (GetDifficultyInfo(3)),
                {
                    2148, -- Denyin' the Scion (10 player)
                    1874, -- You Don't Have an Eternity (10 player)
                    1869, -- A Poke in the Eye (10 player)
                    622, -- The Spellweaver's Downfall (10 player)
                },
            },
            { -- The Eye of Eternity 25
                113,
                (GetDifficultyInfo(4)),
                {
                    2149, -- Denyin' the Scion (25 player)
                    1875, -- You Don't Have an Eternity (25 player)
                    1870, -- A Poke in the Eye (25 player)
                    623, -- The Spellweaver's Downfall (25 player)
                },
            },
        },
        { -- Ulduar
            114,
            addon.GetInstanceInfoName(759),
            { -- Ulduar 10
                115,
                (GetDifficultyInfo(3)),
                {
                    3097, -- Dwarfageddon (10 player)
                    2907, -- Three Car Garage (10 player)
                    2905, -- Unbroken (10 player)
                    2911, -- Shutout (10 player)
                    2909, -- Take Out Those Turrets (10 player)
                    2913, -- Orbital Bombardment (10 player)
                    2914, -- Orbital Devastation (10 player)
                    2915, -- Nuked from Orbit (10 player)
                    3056, -- Orbit-uary (10 player)
                    2925, -- Shattered (10 player)
                    2927, -- Hot Pocket (10 player)
                    2930, -- Stokin' the Furnace (10 player)
                    2919, -- A Quick Shave (10 player)
                    2923, -- Iron Dwarf, Medium Rare (10 player)
                    2931, -- Nerf Engineering (10 player)
                    2933, -- Nerf Scrapbots (10 player)
                    2934, -- Nerf Gravity Bombs (10 player)
                    2937, -- Must Deconstruct Faster (10 player)
                    3058, -- Heartbreaker (10 player)
                    2945, -- But I'm On Your Side (10 player)
                    2947, -- Can't Do That While Stunned (10 player)
                    2939, -- I Choose You, Runemaster Molgeim (10 player)
                    2940, -- I Choose You, Stormcaller Brundir (10 player)
                    2941, -- I Choose You, Steelbreaker (10 player)
                    2955, -- If Looks Could Kill (10 player)
                    2959, -- Rubble and Roll (10 player)
                    2951, -- With Open Arms (10 player)
                    2953, -- Disarmed (10 player)
                    3076, -- Nine Lives (10 player)
                    3006, -- Crazy Cat Lady (10 player)
                    2961, -- Cheese the Freeze (10 player)
                    2963, -- I Have the Coolest Friends (10 player)
                    2967, -- Getting Cold in Here (10 player)
                    2969, -- Staying Buffed All Winter (10 player)
                    3182, -- I Could Say That This Cache Was Rare (10 player)
                    2971, -- Don't Stand in the Lightning (10 player)
                    2973, -- I'll Take You All On (10 player)
                    2975, -- Who Needs Bloodlust? (10 player)
                    2977, -- Siffed (10 player)
                    3176, -- Lose Your Illusion (10 player)
                    2979, -- Lumberjacked (10 player)
                    2980, -- Con-speed-atory (10 player)
                    2985, -- Deforestation (10 player)
                    2982, -- Getting Back to Nature (10 player)
                    3177, -- Knock on Wood (10 player)
                    3178, -- Knock, Knock on Wood (10 player)
                    3179, -- Knock, Knock, Knock on Wood (10 player)
                    2989, -- Set Up Us the Bomb (10 player)
                    3138, -- Not-So-Friendly Fire (10 player)
                    3180, -- Firefighter (10 player)
                    2996, -- Shadowdodger (10 player)
                    3181, -- I Love the Smell of Saronite in the Morning (10 player)
                    3009, -- Kiss and Make Up (10 player)
                    3008, -- Drive Me Crazy (10 player)
                    3012, -- He's Not Getting Any Older (10 player)
                    3014, -- They're Coming Out of the Walls (10 player)
                    3015, -- In His House He Waits Dreaming (10 player)
                    3157, -- Three Lights in the Darkness (10 player)
                    3141, -- Two Lights in the Darkness (10 player)
                    3158, -- One Light in the Darkness (10 player)
                    3159, -- Alone in the Darkness (10 player)
                    3003, -- Supermassive (10 player)
                    2886, -- The Siege of Ulduar (10 player)
                    2888, -- The Antechamber of Ulduar (10 player)
                    2890, -- The Keepers of Ulduar (10 player)
                    2892, -- The Descent into Madness (10 player)
                    2894, -- The Secrets of Ulduar (10 player)
                    3036, -- Observed (10 player)
                    3004, -- He Feeds On Your Tears (10 player)
                    2903, -- Champion of Ulduar
                },
            },
            { -- Ulduar 25
                116,
                (GetDifficultyInfo(4)),
                {
                    3098, -- Dwarfageddon (25 player)
                    2908, -- Three Car Garage (25 player)
                    2906, -- Unbroken (25 player)
                    2912, -- Shutout (25 player)
                    2910, -- Take Out Those Turrets (25 player)
                    2918, -- Orbital Bombardment (25 player)
                    2916, -- Orbital Devastation (25 player)
                    2917, -- Nuked from Orbit (25 player)
                    3057, -- Orbit-uary (25 player)
                    2926, -- Shattered (25 player)
                    2928, -- Hot Pocket (25 player)
                    2929, -- Stokin' the Furnace (25 player)
                    2921, -- A Quick Shave (25 player)
                    2924, -- Iron Dwarf, Medium Rare (25 player)
                    2932, -- Nerf Engineering (25 player)
                    2935, -- Nerf Scrapbots (25 player)
                    2936, -- Nerf Gravity Bombs (25 player)
                    2938, -- Must Deconstruct Faster (25 player)
                    3059, -- Heartbreaker (25 player)
                    2946, -- But I'm On Your Side (25 player)
                    2948, -- Can't Do That While Stunned (25 player)
                    2942, -- I Choose You, Runemaster Molgeim (25 player)
                    2943, -- I Choose You, Stormcaller Brundir (25 player)
                    2944, -- I Choose You, Steelbreaker (25 player)
                    2956, -- If Looks Could Kill (25 player)
                    2960, -- Rubble and Roll (25 player)
                    2952, -- With Open Arms (25 player)
                    2954, -- Disarmed (25 player)
                    3077, -- Nine Lives (25 player)
                    3007, -- Crazy Cat Lady (25 player)
                    2962, -- Cheese the Freeze (25 player)
                    2965, -- I Have the Coolest Friends (25 player)
                    2968, -- Getting Cold in Here (25 player)
                    2970, -- Staying Buffed All Winter (25 player)
                    3184, -- I Could Say That This Cache Was Rare (25 player)
                    2972, -- Don't Stand in the Lightning (25 player)
                    2974, -- I'll Take You All On (25 player)
                    2976, -- Who Needs Bloodlust? (25 player)
                    2978, -- Siffed (25 player)
                    3183, -- Lose Your Illusion (25 player)
                    3118, -- Lumberjacked (25 player)
                    2981, -- Con-speed-atory (25 player)
                    2984, -- Deforestation (25 player)
                    2983, -- Getting Back to Nature (25 player)
                    3185, -- Knock on Wood (25 player)
                    3186, -- Knock, Knock on Wood (25 player)
                    3187, -- Knock, Knock, Knock on Wood (25 player)
                    3237, -- Set Up Us the Bomb (25 player)
                    2995, -- Not-So-Friendly Fire (25 player)
                    3189, -- Firefighter (25 player)
                    2997, -- Shadowdodger (25 player)
                    3188, -- I Love the Smell of Saronite in the Morning (25 player)
                    3011, -- Kiss and Make Up (25 player)
                    3010, -- Drive Me Crazy (25 player)
                    3013, -- He's Not Getting Any Older (25 player)
                    3017, -- They're Coming Out of the Walls (25 player)
                    3016, -- In His House He Waits Dreaming (25 player)
                    3161, -- Three Lights in the Darkness (25 player)
                    3162, -- Two Lights in the Darkness (25 player)
                    3163, -- One Light in the Darkness (25 player)
                    3164, -- Alone in the Darkness (25 player)
                    3002, -- Supermassive (25 player)
                    2887, -- The Siege of Ulduar (25 player)
                    2889, -- The Antechamber of Ulduar (25 player)
                    2891, -- The Keepers of Ulduar (25 player)
                    2893, -- The Descent into Madness (25 player)
                    2895, -- The Secrets of Ulduar (25 player)
                    3037, -- Observed (25 player)
                    3005, -- He Feeds On Your Tears (25 player)
                    2904, -- Conqueror of Ulduar
                },
            },
            {
                12312, -- Dwarfageddon
                12314, -- Three Car Garage
                12313, -- Unbroken
                12316, -- Shutout
                12315, -- Take Out Those Turrets
                12317, -- Orbital Bombardment
                12318, -- Orbital Devastation
                12319, -- Nuked from Orbit
                12320, -- Orbit-uary
                12323, -- Shattered
                12324, -- Hot Pocket
                12325, -- Stokin' the Furnace
                12321, -- A Quick Shave
                12322, -- Iron Dwarf, Medium Rare
                12326, -- Nerf Engineering
                12327, -- Nerf Scrapbots
                12328, -- Nerf Gravity Bombs
                12329, -- Must Deconstruct Faster
                12330, -- Heartbreaker
                12335, -- But I'm On Your Side
                12336, -- Can't Do That While Stunned
                12332, -- I Choose You, Runemaster Molgeim
                12333, -- I Choose You, Stormcaller Brundir
                12334, -- I Choose You, Steelbreaker
                12339, -- If Looks Could Kill
                12340, -- Rubble and Roll
                12337, -- With Open Arms
                12338, -- Disarmed
                12342, -- Nine Lives
                12341, -- Crazy Cat Lady
                12343, -- Cheese the Freeze
                12344, -- I Have the Coolest Friends
                12345, -- Getting Cold in Here
                12346, -- Staying Buffed All Winter
                12347, -- I Could Say That This Cache Was Rare
                12348, -- Don't Stand in the Lightning
                12349, -- I'll Take You All On
                12350, -- Who Needs Bloodlust?
                12351, -- Siffed
                12352, -- Lose Your Illusion
                12360, -- Lumberjacked
                12361, -- Con-speed-atory
                12362, -- Deforestation
                12363, -- Getting Back to Nature
                12364, -- Knock on Wood
                12365, -- Knock, Knock on Wood
                12366, -- Knock, Knock, Knock on Wood
                12367, -- Set Up Us the Bomb
                12368, -- Not-So-Friendly Fire
                12369, -- Firefighter
                12372, -- Shadowdodger
                12373, -- I Love the Smell of Saronite in the Morning
                12384, -- Kiss and Make Up
                12395, -- Drive Me Crazy
                12396, -- He's Not Getting Any Older
                12397, -- They're Coming Out of the Walls
                12398, -- In His House He Waits Dreaming
                12385, -- Three Lights in the Darkness
                12386, -- Two Lights in the Darkness
                12387, -- One Light in the Darkness
                12388, -- Alone in the Darkness
                12400, -- Supermassive
                12297, -- The Siege of Ulduar
                12302, -- The Antechamber of Ulduar
                12309, -- The Keepers of Ulduar
                12310, -- The Descent into Madness
                12311, -- The Secrets of Ulduar
                12399, -- Observed
                11751, -- Mogg-Saron
                4626, -- And I'll Form the Head!
                3142, -- Val'anyr, Hammer of Ancient Kings
                3316, -- Herald of the Titans
                11320, -- Raiding with Leashes IV: Wrath of the Lick King
                17340, -- Ahead of the Curve: Yogg-Saron
                17341, -- Cutting Edge: Ulduar
            },
        },
        { -- Trial of the Crusader
            117,
            addon.GetInstanceInfoName(757),
            { -- Trial of the Crusader 10
                118,
                (GetDifficultyInfo(3)),
                {
                    3797, -- Upper Back Pain (10 player)
                    3936, -- Not One, But Two Jormungars (10 player)
                    3996, -- Three Sixty Pain Spike (10 player)
                    3798, -- Resilience Will Fix It (10 player)
                    3799, -- Salt and Pepper (10 player)
                    3800, -- The Traitor King (10 player)
                    3917, -- Call of the Crusade (10 player)
                    3918, -- Call of the Grand Crusade (10 player)
                    3808, -- A Tribute to Skill (10 player)
                    3809, -- A Tribute to Mad Skill (10 player)
                    3810, -- A Tribute to Insanity (10 player)
                    4080, -- A Tribute to Dedicated Insanity
                },
            },
            { -- Trial of the Crusader 25
                119,
                (GetDifficultyInfo(4)),
                {
                    3813, -- Upper Back Pain (25 player)
                    3937, -- Not One, But Two Jormungars (25 player)
                    3997, -- Three Sixty Pain Spike (25 player)
                    3814, -- Resilience Will Fix It (25 player)
                    3815, -- Salt and Pepper (25 player)
                    3816, -- The Traitor King (25 player)
                    3916, -- Call of the Crusade (25 player)
                    3812, -- Call of the Grand Crusade (25 player)
                    3817, -- A Tribute to Skill (25 player)
                    3818, -- A Tribute to Mad Skill (25 player)
                    3819, -- A Tribute to Insanity (25 player)
                    4156, -- A Tribute to Immortality
                    4079, -- A Tribute to Immortality
                },
            },
            {
                11752, -- Style of the Crusader
                11320, -- Raiding with Leashes IV: Wrath of the Lick King
            },
        },
        { -- Onyxia's Lair
            120,
            addon.GetInstanceInfoName(760),
            { -- Onyxia's Lair 10
                121,
                (GetDifficultyInfo(3)),
                {
                    4402, -- More Dots! (10 player)
                    4403, -- Many Whelps! Handle It! (10 player)
                    4404, -- She Deep Breaths More (10 player)
                    4396, -- Onyxia's Lair (10 player)
                },
            },
            { -- Onyxia's Lair 25
                122,
                (GetDifficultyInfo(4)),
                {
                    4405, -- More Dots! (25 player)
                    4406, -- Many Whelps! Handle It! (25 player)
                    4407, -- She Deep Breaths More (25 player)
                    4397, -- Onyxia's Lair (25 player)
                },
            },
            {
                9924, -- Field Photographer
            },
        },
        { -- Icecrown Citadel
            123,
            addon.GetInstanceInfoName(758),
            { -- Icecrown Citadel 10
                124,
                (GetDifficultyInfo(3)),
                {
                    4534, -- Boned (10 player)
                    4535, -- Full House (10 player)
                    4536, -- I'm on a Boat (10 player)
                    4537, -- I've Gone and Made a Mess (10 player)
                    4577, -- Flu Shot Shortage (10 player)
                    4538, -- Dances with Oozes (10 player)
                    4578, -- Nausea, Heartburn, Indigestion... (10 player)
                    4582, -- The Orb Whisperer (10 player)
                    4539, -- Once Bitten, Twice Shy (10 player)
                    4579, -- Portal Jockey (10 player)
                    4580, -- All You Can Eat (10 player)
                    4601, -- Been Waiting a Long Time for This (10 player)
                    4581, -- Neck-Deep in Vile (10 player)
                    4531, -- Storming the Citadel (10 player)
                    4528, -- The Plagueworks (10 player)
                    4529, -- The Crimson Hall (10 player)
                    4527, -- The Frostwing Halls (10 player)
                    4530, -- The Frozen Throne (10 player)
                    4532, -- Fall of the Lich King (10 player)
                    4628, -- Heroic: Storming the Citadel (10 player)
                    4629, -- Heroic: The Plagueworks (10 player)
                    4630, -- Heroic: The Crimson Hall (10 player)
                    4631, -- Heroic: The Frostwing Halls (10 player)
                    4583, -- Bane of the Fallen King
                    4636, -- Heroic: Fall of the Lich King (10 player)
                },
            },
            { -- Icecrown Citadel 25
                125,
                (GetDifficultyInfo(4)),
                {
                    4610, -- Boned (25 player)
                    4611, -- Full House (25 player)
                    4612, -- I'm on a Boat (25 player)
                    4613, -- I've Gone and Made a Mess (25 player)
                    4615, -- Flu Shot Shortage (25 player)
                    4614, -- Dances with Oozes (25 player)
                    4616, -- Nausea, Heartburn, Indigestion... (25 player)
                    4617, -- The Orb Whisperer (25 player)
                    4618, -- Once Bitten, Twice Shy (25 player)
                    4619, -- Portal Jockey (25 player)
                    4620, -- All You Can Eat (25 player)
                    4621, -- Been Waiting a Long Time for This (25 player)
                    4622, -- Neck-Deep in Vile (25 player)
                    4604, -- Storming the Citadel (25 player)
                    4605, -- The Plagueworks (25 player)
                    4606, -- The Crimson Hall (25 player)
                    4607, -- The Frostwing Halls (25 player)
                    4597, -- The Frozen Throne (25 player)
                    4608, -- Fall of the Lich King (25 player)
                    4632, -- Heroic: Storming the Citadel (25 player)
                    4633, -- Heroic: The Plagueworks (25 player)
                    4634, -- Heroic: The Crimson Hall (25 player)
                    4635, -- Heroic: The Frostwing Halls (25 player)
                    4584, -- The Light of Dawn
                    4637, -- Heroic: Fall of the Lich King (25 player)
                },
            },
            { -- Reputation
                615,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    4598, -- The Ashen Verdict
                },
            },
            {
                11753, -- Winter Catalog
                4625, -- Invincible's Reins
                4623, -- Shadowmourne
                11320, -- Raiding with Leashes IV: Wrath of the Lick King
                9924, -- Field Photographer
            },
        },
        { -- The Ruby Sanctum
            126,
            addon.GetInstanceInfoName(761),
            { -- The Ruby Sanctum 10
                127,
                (GetDifficultyInfo(3)),
                {
                    4817, -- The Twilight Destroyer (10 player)
                    4818, -- Heroic: The Twilight Destroyer (10 player)
                },
            },
            { -- The Ruby Sanctum 25
                128,
                (GetDifficultyInfo(4)),
                {
                    4815, -- The Twilight Destroyer (25 player)
                    4816, -- Heroic: The Twilight Destroyer (25 player)
                },
            },
        },
        {
            1658, -- Champion of the Frozen Wastes
            2137, -- Glory of the Raider (10 player)
            2138, -- Glory of the Raider (25 player)
            12401, -- Glory of the Ulduar Raider
            4602, -- Glory of the Icecrown Raider (10 player)
            4603, -- Glory of the Icecrown Raider (25 player)
            2957, -- Glory of the Ulduar Raider (10 player)
            2958, -- Glory of the Ulduar Raider (25 player)
            4784, -- Emblematic
            4785, -- Emblematic
            3838, -- Dungeon & Raid Emblem
            3839, -- 25 Dungeon & Raid Emblems
            3840, -- 50 Dungeon & Raid Emblems
            3841, -- 100 Dungeon & Raid Emblems
            3842, -- 250 Dungeon & Raid Emblems
            3843, -- 500 Dungeon & Raid Emblems
            3844, -- 1000 Dungeon & Raid Emblems
            3876, -- 1500 Dungeon & Raid Emblems
            4316, -- 2500 Dungeon & Raid Emblems
        },
    },
    { -- Professions
        1152,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1470,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                4922, -- Grand Master Archaeologist
            },
        },
        { -- Cooking
            1479,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                125, -- Northrend Cook
                1777, -- The Northrend Gourmet
                1778, -- The Northrend Gourmet
                1779, -- The Northrend Gourmet
                1780, -- Second That Emotion
                1781, -- Critter Gitter
                1782, -- Our Daily Bread
                1783, -- Our Daily Bread
            },
        },
        { -- Fishing
            1498,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                130, -- Northrend Fisherman
                1517, -- Northrend Angler
                3217, -- Chasing Marcia
                2094, -- A Penny For Your Thoughts
                2095, -- Silver in the City
                1957, -- There's Gold In That There Fountain
                1958, -- I Smell A Giant Rat
                2096, -- The Coin Master
            },
        },
        { -- Inscription
            1506,
            addon.GetCategoryInfoTitle(15493),
            true,
            {
                18725, -- Best Stellar
            },
        },
        { -- Tailoring
            1526,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                137, -- Stocking Up
            },
        },
        {
            734, -- Professional Northrend Master
            735, -- Working In the Cold
            18722, -- Northrend Master of All
            62359, -- Wrathful Lumberjack
            135, -- Grand Master Medic
            730, -- Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        787,
        addon.GetCategoryInfoTitle(15117),
        {
            6588, -- Northrend Safari
            6615, -- Northrend Tamer
            6605, -- Taming Northrend
            60942, -- Aquatic Battler of Northrend
            60951, -- Beast Battler of Northrend
            60943, -- Critter Battler of Northrend
            60944, -- Dragonkin Battler of Northrend
            60948, -- Elemental Battler of Northrend
            60949, -- Flying Battler of Northrend
            60950, -- Humanoid Battler of Northrend
            60952, -- Magic Battler of Northrend
            60953, -- Mechanical Battler of Northrend
            60954, -- Undead Battler of Northrend
            60956, -- Family Battler of Northrend
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            6611, -- Continental Tamer
            6590, -- World Safari
            8348, -- The Longest Day
        },
    },
    { -- Wintergrasp
        1138,
        addon.GetCategoryInfoTitle(14901),
        {
            1717, -- Wintergrasp Victory
            1718, -- Wintergrasp Veteran
            1755, -- Within Our Grasp
            2199, -- Wintergrasp Ranger
            2080, -- Black War Mammoth
            1737, -- Destruction Derby
            2476, -- Destruction Derby
            1723, -- Vehicular Gnomeslaughter
            1727, -- Leaning Tower
            1751, -- Didn't Stand a Chance
            1752, -- Master of Wintergrasp
        },
    },
    { -- Argent Tournament
        781,
        addon.GetCategoryInfoTitle(14941),
        {
            2756, -- Argent Aspiration
            2758, -- Argent Valor
            2772, -- Tilted!
            2836, -- Lance a Lot
            2773, -- It's Just a Flesh Wound
            3736, -- Pony Up!
            2777, -- Champion of Darnassus
            2787, -- Champion of the Undercity
            2760, -- Exalted Champion of Darnassus
            2769, -- Exalted Champion of the Undercity
            2778, -- Champion of the Exodar
            2785, -- Champion of Silvermoon City
            2761, -- Exalted Champion of the Exodar
            2767, -- Exalted Champion of Silvermoon City
            2779, -- Champion of Gnomeregan
            2786, -- Champion of Thunder Bluff
            2762, -- Exalted Champion of Gnomeregan
            2768, -- Exalted Champion of Thunder Bluff
            2780, -- Champion of Ironforge
            2784, -- Champion of Sen'jin
            2763, -- Exalted Champion of Ironforge
            2766, -- Exalted Champion of Sen'jin
            2781, -- Champion of Stormwind
            2783, -- Champion of Orgrimmar
            2764, -- Exalted Champion of Stormwind
            2765, -- Exalted Champion of Orgrimmar
            2782, -- Champion of the Alliance
            2788, -- Champion of the Horde
            2770, -- Exalted Champion of the Alliance
            2771, -- Exalted Champion of the Horde
            2817, -- Exalted Argent Champion of the Alliance
            2816, -- Exalted Argent Champion of the Horde
            3676, -- A Silver Confidant
            3677, -- The Sunreavers
            4596, -- The Sword in the Skull
        },
    },
    { -- Dragonriding Races
        1558,
        addon.L["Dragonriding Races"],
        {
            19674, -- Northrend: Bronze
            19675, -- Northrend: Silver
            19676, -- Northrend: Gold
            19677, -- Northrend Advanced: Bronze
            19679, -- Northrend Advanced: Silver
            19681, -- Northrend Advanced: Gold
            19682, -- Northrend Reverse: Bronze
            19683, -- Northrend Reverse: Silver
            19684, -- Northrend Reverse: Gold
            19721, -- Northrend Racing Completionist
            19722, -- Northrend Racing Completionist: Silver
            19723, -- Northrend Racing Completionist: Gold
        },
    },
});