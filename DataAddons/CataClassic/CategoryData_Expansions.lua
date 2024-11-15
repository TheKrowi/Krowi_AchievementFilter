local _, addon = ...;

KrowiAF.CategoryData.Expansions = { -- TAB - Expansions
    883,
    addon.L["Expansions"],
    {
        IsTab = true,
        TabName = "Expansions",
    },
    { -- Cross-Expansion
        1431,
        addon.L["Cross-Expansion"],
        { -- Character
            1432,
            addon.GetCategoryInfoTitle(92),
            {
                6, -- Level 10
                7, -- Level 20
                8, -- Level 30
                9, -- Level 40
                14782, -- Level 50
                14783, -- Level 60
                15805, -- Level 70
                19459, -- Level 80
                10, -- Level 50 (Legacy)
                11, -- Level 60 (Legacy)
                12, -- Level 70 (Legacy)
                13, -- Level 80 (Legacy)
                4826, -- Level 85 (Legacy)
                6193, -- Level 90 (Legacy)
                9060, -- Level 100 (Legacy)
                10671, -- Level 110 (Legacy)
                12544, -- Level 120 (Legacy)
                16433, -- Soul of Iron (Season of Mastery)
                7382, -- Dynamic Duo
                7383, -- Terrific Trio
                7384, -- Quintessential Quintet
                7380, -- Double Agent
                546, -- Safe Deposit
                1176, -- Got My Mind On My Money
                1177, -- Got My Mind On My Money
                1178, -- Got My Mind On My Money
                1180, -- Got My Mind On My Money
                1181, -- Got My Mind On My Money
                5455, -- Got My Mind On My Money
                5456, -- Got My Mind On My Money
                6753, -- Got My Mind On My Money
                558, -- Greedy
                559, -- Needy
                891, -- Giddy Up!
                889, -- Fast and Furious
                890, -- Into the Wild Blue Yonder
                5180, -- Breaking the Sound Barrier
                892, -- The Right Stuff
                2357, -- Dreadsteed of Xoroth
                2358, -- Charger
                2359, -- Swift Flight Form
                545, -- Shave and a Haircut
                557, -- Superior
                556, -- Epic
                5373, -- Cataclysmically Superior
                5372, -- Cataclysmically Epic
                6348, -- Mystically Superior
                6349, -- Mystically Epic
                9707, -- Savagely Superior
                9708, -- Savagely Epic
                10764, -- Brokenly Superior
                10765, -- Brokenly Epic
                12546, -- Superior (Battle)
                12547, -- Epic (Battle)
                14796, -- Superior (Shadowlands)
                14797, -- Epic (Shadowlands)
                705, -- Master of Arms
                16, -- Did Somebody Order a Knuckle Sandwich?
                2716, -- Dual Talent Specialization
                1187, -- The Keymaster
                17334, -- Trading Post Enthusiast
                19489, -- Class Connoisseur
            },
        },
        { -- Quests
            1159,
            addon.GetCategoryInfoTitle(96),
            {
                503, -- 50 Quests Completed
                504, -- 100 Quests Completed
                505, -- 250 Quests Completed
                506, -- 500 Quests Completed
                507, -- 1000 Quests Completed
                508, -- 1500 Quests Completed
                32, -- 2000 Quests Completed
                978, -- 3000 Quests Completed
                973, -- 5 Daily Quests Completed
                974, -- 50 Daily Quests Completed
                975, -- 200 Daily Quests Completed
                976, -- 500 Daily Quests Completed
                977, -- 1000 Daily Quests Completed
                5751, -- 2500 Daily Quests Completed
                7410, -- 5000 Daily Quests Completed
                7411, -- 10000 Daily Quests Completed
                31, -- A Simple Re-Quest
                11126, -- 50 World Quests Completed
                11127, -- 200 World Quests Completed
                11128, -- 500 World Quests Completed
                11129, -- 1000 World Quests Completed
                11130, -- 2500 World Quests Completed
                11131, -- 5000 World Quests Completed
                11132, -- "10,000 World Quests Completed"
                4956, -- 5 Dungeon Quests Completed
                4957, -- 20 Dungeon Quests Completed
                1182, -- The Bread Winner
                5752, -- Justly Rewarded
            },
        },
        { -- Exploration
            1161,
            addon.GetCategoryInfoTitle(97),
            {
                964, -- Going Down?
                1244, -- Well Read
                1832, -- Tastes Like Chicken
                1833, -- It's Happy Hour Somewhere
                16789, -- Lucky Penny
                16790, -- Curious Coin
            },
        },
        { -- Dungeons & Raids
            1169,
            addon.GetCategoryInfoTitle(168),
            {
                4476, -- Looking For More
                4477, -- Looking For Many
                4478, -- Looking For Multitudes
            },
        },
        { -- Professions
            1149,
            addon.GetCategoryInfoTitle(169),
            { -- Archaeology
                1459,
                addon.GetCategoryInfoTitle(15071),
                {
                    5315, -- Digger
                    5469, -- Diggerer
                    5470, -- Diggerest
                    4854, -- I Had It in My Hand
                    4855, -- What was Briefly Yours is Now Mine
                    4856, -- It Belongs in a Museum!
                    9422, -- "The Search For Fact, Not Truth"
                    5511, -- It's Always in the Last Place You Look
                },
            },
            { -- Cooking
                1458,
                addon.GetCategoryInfoTitle(170),
                {
                    1998, -- Cooking Award
                    1999, -- 10 Cooking Awards
                    2000, -- 25 Cooking Awards
                    2001, -- 50 Cooking Awards
                    2002, -- 100 Cooking Awards
                    1785, -- Dinner Impossible
                    1795, -- Lunch Lady
                    1796, -- Short Order Cook
                    1797, -- Chef de Partie
                    1798, -- Sous Chef
                    1799, -- Chef de Cuisine
                    5471, -- Iron Chef
                    7328, -- Ironpaw Chef
                    18816, -- Serious Chef
                    18817, -- Showoff Chef
                    3296, -- Cooking with Style
                    1563, -- Hail to the Chef
                    1784, -- Hail to the Chef
                    17736, -- The Gift of Cheese
                },
            },
            { -- Fishing
                1462,
                addon.GetCategoryInfoTitle(171),
                {
                    153, -- The Old Gnome and the Sea
                    1257, -- The Scavenger
                    5478, -- The Limnologist
                    5479, -- The Oceanographer
                    1243, -- Fish Don't Leave Footprints
                    3218, -- Turtles All the Way Down
                    1556, -- 25 Fish
                    1557, -- 50 Fish
                    1558, -- 100 Fish
                    1559, -- 250 Fish
                    1560, -- 500 Fish
                    1561, -- 1000 Fish
                    1516, -- Accomplished Angler
                    13502, -- Secret Fish and Where to Find Them
                    17207, -- Discombobberlated
                },
            },
            { -- Tailoring
                1524,
                addon.GetCategoryInfoTitle(15496),
                {
                    18885, -- Quite the Quilt I
                    18886, -- Quite the Quilt II
                    18887, -- Quite the Quilt III
                    18888, -- Quite the Quilt IV
                    141, -- Ultimate Triage
                    17499, -- Renowned Tailoring Specialist
                },
            },
            {
                16799, -- Personal Crafter
                16791, -- Merchant Artisan
                17410, -- Craftsman of the Zandalar Tribe
                17412, -- Craftsman of the Argent Dawn
            },
        },
        { -- Reputation
            1163,
            addon.GetCategoryInfoTitle(201),
            {
                522, -- Somebody Likes Me
                523, -- 5 Exalted Reputations
                524, -- 10 Exalted Reputations
                521, -- 15 Exalted Reputations
                520, -- 20 Exalted Reputations
                519, -- 25 Exalted Reputations
                518, -- 30 Exalted Reputations
                1014, -- 35 Exalted Reputations
                5374, -- 45 Exalted Reputations
                5723, -- 50 Exalted Reputations
                6826, -- 55 Exalted Reputations
                6742, -- 60 Exalted Reputations
                11177, -- 70 Exalted Reputations
                12864, -- 80 Exalted Reputations
                12865, -- 90 Exalted Reputations
                12866, -- 100 Exalted Reputations
                18471, -- 110 Exalted Reputations
                5794, -- Time Flies When You're Having Fun
                12243, -- Allied Races: Lightforged Draenei
                12414, -- Heritage of the Lightforged
                14013, -- Allied Races: Mechagnome
                14014, -- Heritage of the Mechagnome
                12242, -- Allied Races: Void Elf
                12291, -- Heritage of the Void
                12515, -- Allied Races: Dark Iron Dwarf
                13076, -- Heritage of the Dark Iron
                13163, -- Allied Races: Kul Tiran
                13504, -- Heritage of the Kul Tirans
                12245, -- Allied Races: Highmountain Tauren
                12415, -- Heritage of Highmountain
                12244, -- Allied Races: Nightborne
                12413, -- Heritage of the Nightborne
                12518, -- Allied Races: Mag'har Orc
                13077, -- Heritage of the Mag'har
                13161, -- Allied Races: Zandalari Troll
                13503, -- Heritage of the Zandalari
                13206, -- Allied Races: Vulpera
                14002, -- Heritage of the Vulpera
                40307, -- Allied Races: Earthen
                40309, -- Heritage of the Earthen
            },
        },
        { -- Pet Battles
            1170,
            addon.GetCategoryInfoTitle(15117),
            { -- Collect
                1433,
                addon.GetCategoryInfoTitle(15118),
                true,
                {
                    7482, -- Trainer Extraordinaire
                    7483, -- Battle Master
                    6600, -- Ultimate Trainer
                    7521, -- Time to Open a Pet Store
                    9712, -- Shiny Pet Charmer
                    12927, -- Polished Pet Charmer
                    1017, -- Can I Keep Him?
                    15, -- Plenty of Pets
                    1248, -- Plethora of Pets
                    1250, -- "Shop Smart, Shop Pet...Smart"
                    2516, -- Lil' Game Hunter
                    5876, -- Petting Zoo
                    5877, -- Menagerie
                    5875, -- Littlest Pet Shop
                    7500, -- Going to Need More Leashes
                    7501, -- That's a Lot of Pet Food
                    9643, -- So. Many. Pets.
                    12992, -- Pet Emporium
                    12958, -- Master of Minions
                    15641, -- Many More Mini Minions
                    15642, -- Proven Pet Parent
                    15643, -- What Can I Say? They Love Me.
                    15644, -- Good Things Come in Small Packages
                    6554, -- He's Mine!
                    6555, -- Building a Team
                    6556, -- Going to Need More Traps
                    6557, -- Master Pet Hunter
                    7436, -- Zen Pet Hunter
                    7465, -- An Uncommon Find
                    7462, -- A Rare Catch
                    7463, -- Lots of Rarity
                    7464, -- Quality & Quantity
                    6608, -- Family Reunion
                    6571, -- That Was Close!
                },
            },
        },
        { -- Collections
            1171,
            addon.GetCategoryInfoTitle(15246),
            {
                621, -- Represent
                1020, -- Ten Tabards
                1021, -- Twenty-Five Tabards
                5755, -- Thirty Tabards
                9911, -- Where's the Mailbox?
                9906, -- Alt-ernative Lifestyle
                9908, -- Ready for Powerleveling
                9670, -- Toying Around
                9671, -- Having a Ball
                9672, -- Tons of Toys
                9673, -- The Toymaster
                11176, -- Remember to Share
                12996, -- Toybox Tycoon
                15781, -- The Joy of Toy
            },
        },
        { -- Feats of Strength
            1172,
            addon.GetCategoryInfoTitle(81),
            {
                4496, -- It's Over Nine Thousand!
                3636, -- Jade Tiger
                3896, -- Onyx Panther
            },
        },
    },
    { -- Classic
        1,
        addon.GetCategoryInfoTitle(14864),
        { -- Zones
            648,
            addon.L["Zones"],
            { -- Eastern Kingdoms
                687,
                addon.GetMapName(1415),
                { -- Stormwind City
                    922,
                    addon.GetMapName(1453),
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
                    addon.GetMapName(1455),
                    {
                        616, -- Overthrow the Council
                        619, -- For the Horde!
                        603, -- Wrath of the Horde
                    },
                },
                { -- Undercity
                    974,
                    addon.GetMapName(1458),
                    {
                        612, -- Downing the Dark Lady
                        604, -- Wrath of the Alliance
                    },
                },
                { -- Dun Morogh
                    721,
                    addon.GetMapName(1426),
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
                    addon.GetMapName(1429),
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
                    addon.GetMapName(1420),
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
                    addon.GetMapName(1436),
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
                    addon.GetMapName(1432),
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
                    addon.GetMapName(1421),
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
                    addon.GetMapName(1433),
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
                    addon.GetMapName(1431),
                    { -- Quests
                        654,
                                addon.GetCategoryInfoTitle(96),
                true,
                        {
                            4907, -- Duskwood Quests
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
                    addon.GetMapName(1437),
                    { -- Quests
                        658,
                                addon.GetCategoryInfoTitle(96),
                true,
                        {
                            4898, -- Wetlands Quests
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
                    addon.GetMapName(1424),
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
                    addon.GetMapName(1417),
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
                            871, -- "Avast Ye, Admiral!"
                            2336, -- Insane in the Membrane
                        },
                    },
                },
                { -- Western Plaguelands
                    685,
                    addon.GetMapName(1422),
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
                    addon.GetMapName(1425),
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
                    addon.GetMapName(1423),
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
                    addon.GetMapName(1418),
                    { -- Quests
                        661,
                                addon.GetCategoryInfoTitle(96),
                true,
                        {
                            4900, -- Badlands Quests
                            5444, -- "Ready, Set, Goat!"
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
                    addon.GetMapName(1427),
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
                    addon.GetMapName(1435),
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
                    addon.GetMapName(1428),
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
                    addon.GetMapName(1419),
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
                    addon.GetMapName(1430),
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
                    1677, -- Loremaster of Eastern Kingdoms
                    42, -- Eastern Kingdoms Explorer
                    1681, -- The Loremaster
                    1682, -- The Loremaster
                    7520, -- The Loremaster
                    19719, -- Reclamation of Gilneas
                },
            },
            { -- Kalimdor
                688,
                addon.GetMapName(1414),
                { -- Darnassus
                    975,
                    addon.GetMapName(1457),
                    {
                        617, -- Immortal No More
                        603, -- Wrath of the Horde
                    },
                },
                { -- Orgrimmar
                    921,
                    addon.GetMapName(1454),
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
                    addon.GetMapName(1456),
                    {
                        611, -- Bleeding Bloodhoof
                        604, -- Wrath of the Alliance
                    },
                },
                { -- Teldrassil
                    756,
                    addon.GetMapName(1438),
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
                    addon.GetMapName(1411),
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
                    addon.GetMapName(1412),
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
                    addon.GetMapName(1450),
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
                { -- The Barrens
                    1379,
                    addon.GetMapName(1413),
                    { -- Exploration
                        1381,
                                addon.GetCategoryInfoTitle(97),
                true,
                        {
                            750, -- Explore Northern Barrens
                        },
                    },
                    { -- Reputation
                        1382,
                                addon.GetCategoryInfoTitle(201),
                true,
                        {
                            762, -- Ambassador of the Horde
                            2336, -- Insane in the Membrane
                        },
                    },
                },
                { -- Darkshore
                    695,
                    addon.GetMapName(1439),
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
                    addon.GetMapName(1447),
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
                    addon.GetMapName(1440),
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
                    addon.GetMapName(1442),
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
                    addon.GetMapName(1443),
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
                { -- Feralas
                    703,
                    addon.GetMapName(1444),
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
                    addon.GetMapName(1445),
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
                    addon.GetMapName(1441),
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
                    addon.GetMapName(1446),
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
                    addon.GetMapName(1448),
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
                    addon.GetMapName(1449),
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
                    addon.GetMapName(1451),
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
                    addon.GetMapName(1452),
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
                    1680, -- Loremaster of Kalimdor
                    43, -- Kalimdor Explorer
                    1681, -- The Loremaster
                    1682, -- The Loremaster
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
                addon.GetLFGActivityShortName(798),
                {
                    629, -- Ragefire Chasm
                },
            },
            { -- Wailing Caverns
                8,
                addon.GetLFGActivityShortName(796),
                {
                    630, -- Wailing Caverns
                    11765, -- Pet Battle Challenge: Wailing Caverns
                },
            },
            { -- Blackfathom Deeps
                10,
                addon.GetLFGActivityShortName(801),
                {
                    632, -- Blackfathom Deeps
                },
            },
            { -- Stormwind Stockades
                11,
                addon.GetLFGActivityShortName(802),
                {
                    633, -- Stormwind Stockade
                },
            },
            { -- Gnomeregan
                12,
                addon.GetLFGActivityShortName(803),
                {
                    634, -- Gnomeregan
                    13269, -- Pet Battle Challenge: Gnomeregan
                },
            },
            { -- Razorfen Kraul
                13,
                addon.GetLFGActivityShortName(804),
                {
                    635, -- Razorfen Kraul
                },
            },
            { -- Razorfen Downs
                14,
                addon.GetLFGActivityShortName(806),
                {
                    636, -- Razorfen Downs
                },
            },
            { -- Scarlet Monastery
                16,
                addon.GetInstanceInfoName(316),
                {
                    637, -- Scarlet Monastery
                    980, -- The Horseman's Reins
                },
            },
            { -- Uldaman
                17,
                addon.GetLFGActivityShortName(807),
                {
                    638, -- Uldaman
                },
            },
            { -- Zul'Farrak
                18,
                addon.GetLFGActivityShortName(808),
                {
                    639, -- Zul'Farrak
                },
            },
            { -- Maraudon
                19,
                addon.GetLFGActivityShortName(809),
                {
                    640, -- Maraudon
                },
            },
            { -- Sunken Temple
                20,
                addon.GetLFGActivityShortName(810),
                {
                    641, -- Sunken Temple
                },
            },
            { -- Blackrock Depths
                21,
                addon.GetLFGActivityShortName(811),
                {
                    642, -- Blackrock Depths
                    3496, -- A Brew-FAST Mount
                    14020, -- Pet Battle Challenge: Blackrock Depths
                },
            },
            { -- Lower Blackrock Spire
                22,
                addon.GetLFGActivityShortName(812),
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
                1455,
                addon.GetInstanceInfoName(246),
                {
                    645, -- Scholomance
                },
            },
            { -- Stratholme
                25,
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
                    5846, -- A Bunch of Lunch
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
                    5852, -- Gone Fishin'
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
    },
    { -- The Burning Crusade
        55,
        addon.GetCategoryInfoTitle(14865),
        { -- Zones
            616,
            addon.L["Zones"],
            { -- Shattrath City
                794,
                addon.GetMapName(1955),
                {
                    1165, -- "My Storage is ""Gigantique"""
                    9924, -- Field Photographer
                },
            },
            { -- Silvermoon City
                924,
                addon.GetMapName(1954),
                {
                    613, -- Killed in Quel'Thalas
                    614, -- For the Alliance!
                    604, -- Wrath of the Alliance
                },
            },
            { -- The Exodar
                969,
                addon.GetMapName(1947),
                {
                    618, -- Putting Out the Light
                    619, -- For the Horde!
                    603, -- Wrath of the Horde
                },
            },
            { -- Azuremyst Isle
                758,
                addon.GetMapName(1943),
                { -- Exploration
                    759,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        860, -- Explore Azuremyst Isle
                    },
                },
                { -- Reputation
                    998,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Bloodmyst Isle
                693,
                addon.GetMapName(1950),
                { -- Quests
                    694,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4926, -- Bloodmyst Isle Quests
                    },
                },
                { -- Exploration
                    763,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        861, -- Explore Bloodmyst Isle
                    },
                },
                { -- Reputation
                    1000,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                    },
                },
            },
            { -- Eversong Woods
                727,
                addon.GetMapName(1941),
                { -- Exploration
                    728,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        859, -- Explore Eversong Woods
                    },
                },
                { -- Reputation
                    1008,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Ghostlands
                669,
                addon.GetMapName(1942),
                { -- Quests
                    670,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4908, -- Ghostlands Quests
                    },
                },
                { -- Exploration
                    733,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        858, -- Explore Ghostlands
                    },
                },
                { -- Reputation
                    1010,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Hellfire Peninsula
                617,
                addon.GetMapName(1944),
                { -- Quests
                    624,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1189, -- To Hellfire and Back
                        1271, -- To Hellfire and Back
                    },
                },
                { -- Exploration
                    631,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        862, -- Explore Hellfire Peninsula
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    1011,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                    },
                },
            },
            { -- Zangarmarsh
                618,
                addon.GetMapName(1946),
                { -- Quests
                    625,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1190, -- Mysteries of the Marsh
                    },
                },
                { -- Exploration
                    632,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        863, -- Explore Zangarmarsh
                    },
                },
                { -- Reputation
                    643,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                        893, -- Cenarion War Hippogryph
                        953, -- Guardian of Cenarius
                        900, -- The Czar of Sporeggar
                        942, -- The Diplomat
                        943, -- The Diplomat
                    },
                },
            },
            { -- Terokkar Forest
                619,
                addon.GetMapName(1952),
                { -- Quests
                    626,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1191, -- Terror of Terokkar
                        1272, -- Terror of Terokkar
                        1275, -- Bombs Away
                    },
                },
                { -- Exploration
                    633,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        867, -- Explore Terokkar Forest
                    },
                },
                { -- Reputation
                    642,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        903, -- Shattrath Divided
                        1205, -- Hero of Shattrath
                    },
                },
            },
            { -- Nagrand
                620,
                addon.GetMapName(1951),
                { -- Quests
                    627,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1192, -- Nagrand Slam
                        1273, -- Nagrand Slam
                        939, -- Hills Like White Elekk
                        941, -- Hemet Nesingwary: The Collected Quests
                        1576, -- Of Blood and Anguish
                        4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
                    },
                },
                { -- Exploration
                    634,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        866, -- Explore Nagrand
                    },
                },
                { -- Reputation
                    641,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        899, -- "Oh My, Kurenai"
                        901, -- Mag'har of Draenor
                        942, -- The Diplomat
                        943, -- The Diplomat
                    },
                },
            },
            { -- Blade's Edge Mountains
                621,
                addon.GetMapName(1949),
                { -- Quests
                    628,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1193, -- On the Blade's Edge
                        1276, -- Blade's Edge Bomberman
                    },
                },
                { -- Exploration
                    635,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        865, -- Explore Blade's Edge Mountains
                    },
                },
                { -- Reputation
                    640,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        896, -- A Quest a Day Keeps the Ogres at Bay
                    },
                },
            },
            { -- Netherstorm
                622,
                addon.GetMapName(1953),
                { -- Quests
                    629,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1194, -- Into the Nether
                    },
                },
                { -- Exploration
                    636,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        843, -- Explore Netherstorm
                        9924, -- Field Photographer
                    },
                },
            },
            { -- Shadowmoon Valley
                623,
                addon.GetMapName(1948),
                { -- Quests
                    630,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        1195, -- Shadow of the Betrayer
                    },
                },
                { -- Exploration
                    637,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        864, -- Explore Shadowmoon Valley
                    },
                },
                { -- Reputation
                    638,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        898, -- On Wings of Nether
                        1638, -- Skyshattered
                    },
                },
            },
            { -- Isle of Quel'Danas
                750,
                addon.GetMapName(1957),
                { -- Exploration
                    751,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        868, -- Explore Isle of Quel'Danas
                    },
                },
            },
            {
                1262, -- Loremaster of Outland
                1274, -- Loremaster of Outland
                1311, -- Medium Rare
                1312, -- Bloody Rare
                44, -- Outland Explorer
                763, -- The Burning Crusader
                764, -- The Burning Crusader
                894, -- Flying High Over Skettis
                897, -- You're So Offensive
                902, -- Chief Exalted Officer
                1681, -- The Loremaster
                1682, -- The Loremaster
                7520, -- The Loremaster
            },
        },
        { -- Dungeons
            56,
            addon.GetCategoryInfoTitle(15272),
            { -- Hellfire Ramparts
                57,
                addon.GetInstanceInfoName(248),
                {
                    647, -- Hellfire Ramparts
                    667, -- Heroic: Hellfire Ramparts
                },
            },
            { -- The Blood Furnace
                58,
                addon.GetInstanceInfoName(256),
                {
                    648, -- The Blood Furnace
                    668, -- Heroic: The Blood Furnace
                },
            },
            { -- The Shattered Halls
                59,
                addon.GetInstanceInfoName(259),
                {
                    657, -- The Shattered Halls
                    678, -- Heroic: The Shattered Halls
                },
            },
            { -- The Slave Pens
                60,
                addon.GetInstanceInfoName(260),
                {
                    649, -- The Slave Pens
                    669, -- Heroic: The Slave Pens
                },
            },
            { -- The Underbog
                61,
                addon.GetInstanceInfoName(262),
                {
                    650, -- Underbog
                    670, -- Heroic: Underbog
                },
            },
            { -- The Steamvault
                62,
                addon.GetInstanceInfoName(261),
                {
                    656, -- The Steamvault
                    677, -- Heroic: The Steamvault
                },
            },
            { -- Mana-Tombs
                63,
                addon.GetInstanceInfoName(250),
                {
                    651, -- Mana-Tombs
                    671, -- Heroic: Mana-Tombs
                },
            },
            { -- Auchenai Crypts
                64,
                addon.GetInstanceInfoName(247),
                {
                    666, -- Auchenai Crypts
                    672, -- Heroic: Auchenai Crypts
                },
            },
            { -- Sethekk Halls
                65,
                addon.GetInstanceInfoName(252),
                {
                    653, -- Sethekk Halls
                    674, -- Heroic: Sethekk Halls
                    883, -- Reins of the Raven Lord
                },
            },
            { -- Shadow Labyrinth
                66,
                addon.GetInstanceInfoName(253),
                {
                    654, -- Shadow Labyrinth
                    675, -- Heroic: Shadow Labyrinth
                },
            },
            { -- Old Hillsbrad Foothills
                67,
                addon.GetInstanceInfoName(251),
                {
                    652, -- The Escape From Durnholde
                    673, -- Heroic: The Escape From Durnholde
                },
            },
            { -- The Black Morass
                68,
                addon.GetInstanceInfoName(255),
                {
                    655, -- Opening of the Dark Portal
                    676, -- Heroic: Opening of the Dark Portal
                },
            },
            { -- The Mechanar
                69,
                addon.GetInstanceInfoName(258),
                {
                    658, -- The Mechanar
                    679, -- Heroic: The Mechanar
                },
            },
            { -- The Botanica
                70,
                addon.GetInstanceInfoName(257),
                {
                    659, -- The Botanica
                    680, -- Heroic: The Botanica
                },
            },
            { -- The Arcatraz
                71,
                addon.GetInstanceInfoName(254),
                {
                    660, -- The Arcatraz
                    681, -- Heroic: The Arcatraz
                },
            },
            { -- Magisters Terrace
                72,
                addon.GetInstanceInfoName(249),
                {
                    661, -- Magister's Terrace
                    682, -- Heroic: Magister's Terrace
                    884, -- Swift White Hawkstrider
                },
            },
            {
                1284, -- Outland Dungeonmaster
                1287, -- Outland Dungeon Hero
            },
        },
        { -- Raids
            73,
            addon.GetCategoryInfoTitle(15271),
            { -- Karazhan
                74,
                addon.GetInstanceInfoName(745),
                { -- Reputation
                    647,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        960, -- The Violet Eye
                    },
                },
                {
                    690, -- Karazhan
                    882, -- Fiery Warhorse's Reins
                    11746, -- Outlandish Style
                    2456, -- Vampire Hunter
                    8293, -- Raiding with Leashes II: Attunement Edition
                    9924, -- Field Photographer
                },
            },
            { -- Gruul's Lair
                75,
                addon.GetInstanceInfoName(746),
                {
                    692, -- Gruul's Lair
                    11746, -- Outlandish Style
                },
            },
            { -- Magtheridon's Lair
                76,
                addon.GetInstanceInfoName(747),
                {
                    693, -- Magtheridon's Lair
                    11746, -- Outlandish Style
                },
            },
            { -- Serpentshrine Cavern
                77,
                addon.GetInstanceInfoName(748),
                {
                    694, -- Serpentshrine Cavern
                    11747, -- Merely a Set
                    8293, -- Raiding with Leashes II: Attunement Edition
                },
            },
            { -- The Eye
                78,
                addon.GetInstanceInfoName(749),
                {
                    696, -- Tempest Keep
                    885, -- Ashes of Al'ar
                    8293, -- Raiding with Leashes II: Attunement Edition
                },
            },
            { -- The Battle for Mount Hyjal
                79,
                addon.GetInstanceInfoName(750),
                { -- Reputation
                    646,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        959, -- The Scale of the Sands
                    },
                },
                {
                    695, -- The Battle for Mount Hyjal
                    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
                },
            },
            { -- Black Temple
                80,
                addon.GetInstanceInfoName(751),
                { -- Reputation
                    645,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        958, -- Sworn to the Deathsworn
                    },
                },
                {
                    697, -- The Black Temple
                    11748, -- Black is the New Black
                    9016, -- Breaker of the Black Harvest
                    426, -- Warglaives of Azzinoth
                    11869, -- I'll Hold These For You Until You Get Out
                    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
                },
            },
            { -- Zul'Aman
                81,
                addon.GetInstanceInfoName(77),
                {
                    691, -- Zul'Aman
                    430, -- Amani War Bear
                },
            },
            { -- Sunwell Plateau
                82,
                addon.GetInstanceInfoName(752),
                {
                    698, -- Sunwell Plateau
                    11749, -- "Suns Out, Thori'dals Out"
                    725, -- "Thori'dal, the Stars' Fury"
                    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
                },
            },
            {
                1286, -- Outland Raider
                432, -- Champion of the Naaru
                431, -- Hand of A'dal
            },
        },
        { -- Professions
            1151,
            addon.GetCategoryInfoTitle(169),
            { -- Archaeology
                1469,
                addon.GetCategoryInfoTitle(15071),
                true,
                {
                    4921, -- Master Archaeologist
                    5192, -- The Harder they Fall
                },
            },
            { -- Cooking
                1478,
                addon.GetCategoryInfoTitle(170),
                true,
                {
                    124, -- Outland Cook
                    877, -- The Cake Is Not A Lie
                    906, -- Kickin' It Up a Notch
                    1800, -- The Outland Gourmet
                    1801, -- Captain Rumsey's Lager
                },
            },
            { -- Fishing
                1499,
                addon.GetCategoryInfoTitle(171),
                true,
                {
                    129, -- Outland Fisherman
                    726, -- Mr. Pinchy's Magical Crawdad Box
                    144, -- The Lurker Above
                    905, -- Old Man Barlowned
                    1225, -- Outland Angler
                },
            },
            {
                733, -- Professional Outland Master
                18729, -- Working in Hellfire
                18721, -- Outland Master of All
                1257, -- The Scavenger
                134, -- Master Medic
            },
        },
    },
    { -- Wrath of the Lich King
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
            {
                41, -- Loremaster of Northrend
                1360, -- Loremaster of Northrend
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
                1681, -- The Loremaster
                1682, -- The Loremaster
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
                        4016, -- "Earth, Wind & Fire (10 player)"
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
                        4017, -- "Earth, Wind & Fire (25 player)"
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
                        2923, -- "Iron Dwarf, Medium Rare (10 player)"
                        2931, -- Nerf Engineering (10 player)
                        2933, -- Nerf Scrapbots (10 player)
                        2934, -- Nerf Gravity Bombs (10 player)
                        2937, -- Must Deconstruct Faster (10 player)
                        3058, -- Heartbreaker (10 player)
                        2945, -- But I'm On Your Side (10 player)
                        2947, -- Can't Do That While Stunned (10 player)
                        2939, -- "I Choose You, Runemaster Molgeim (10 player)"
                        2940, -- "I Choose You, Stormcaller Brundir (10 player)"
                        2941, -- "I Choose You, Steelbreaker (10 player)"
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
                        3178, -- "Knock, Knock on Wood (10 player)"
                        3179, -- "Knock, Knock, Knock on Wood (10 player)"
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
                        2924, -- "Iron Dwarf, Medium Rare (25 player)"
                        2932, -- Nerf Engineering (25 player)
                        2935, -- Nerf Scrapbots (25 player)
                        2936, -- Nerf Gravity Bombs (25 player)
                        2938, -- Must Deconstruct Faster (25 player)
                        3059, -- Heartbreaker (25 player)
                        2946, -- But I'm On Your Side (25 player)
                        2948, -- Can't Do That While Stunned (25 player)
                        2942, -- "I Choose You, Runemaster Molgeim (25 player)"
                        2943, -- "I Choose You, Stormcaller Brundir (25 player)"
                        2944, -- "I Choose You, Steelbreaker (25 player)"
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
                        3186, -- "Knock, Knock on Wood (25 player)"
                        3187, -- "Knock, Knock, Knock on Wood (25 player)"
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
                    12322, -- "Iron Dwarf, Medium Rare"
                    12326, -- Nerf Engineering
                    12327, -- Nerf Scrapbots
                    12328, -- Nerf Gravity Bombs
                    12329, -- Must Deconstruct Faster
                    12330, -- Heartbreaker
                    12335, -- But I'm On Your Side
                    12336, -- Can't Do That While Stunned
                    12332, -- "I Choose You, Runemaster Molgeim"
                    12333, -- "I Choose You, Stormcaller Brundir"
                    12334, -- "I Choose You, Steelbreaker"
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
                    12365, -- "Knock, Knock on Wood"
                    12366, -- "Knock, Knock, Knock on Wood"
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
                    3142, -- "Val'anyr, Hammer of Ancient Kings"
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
                        3936, -- "Not One, But Two Jormungars (10 player)"
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
                        3937, -- "Not One, But Two Jormungars (25 player)"
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
                        4578, -- "Nausea, Heartburn, Indigestion... (10 player)"
                        4582, -- The Orb Whisperer (10 player)
                        4539, -- "Once Bitten, Twice Shy (10 player)"
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
                        4616, -- "Nausea, Heartburn, Indigestion... (25 player)"
                        4617, -- The Orb Whisperer (25 player)
                        4618, -- "Once Bitten, Twice Shy (25 player)"
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
                135, -- Grand Master Medic
                730, -- Skills to Pay the Bills
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
    },
    { -- Cataclysm
        129,
        addon.GetCategoryInfoTitle(15072),
        { -- Zones
            550,
            addon.L["Zones"],
            { -- Vashj'ir
                551,
                addon.GetMapName(203),
                { -- Quests
                    557,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4869, -- Sinking into Vashj'ir
                        4982, -- Sinking into Vashj'ir
                        5452, -- Visions of Vashj'ir Past
                        5318, -- "20,000 Leagues Under the Sea"
                        5319, -- "20,000 Leagues Under the Sea"
                    },
                },
                { -- Exploration
                    564,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4825, -- Explore Vashj'ir
                        4975, -- From Hell's Heart I Stab at Thee
                        9924, -- Field Photographer
                    },
                },
            },
            { -- Mount Hyjal
                552,
                addon.GetMapName(198),
                { -- Quests
                    558,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4870, -- Coming Down the Mountain
                        4959, -- Beware of the 'Unbeatable?' Pterodactyl
                        5860, -- The 'Unbeatable?' Pterodactyl: BEATEN.
                        5483, -- Bounce
                        5859, -- Legacy of Leyara
                        5866, -- The Molten Front Offensive
                        5861, -- The Fiery Lords of Sethria's Roost
                        5870, -- Fireside Chat
                        5862, -- Ludicrous Speed
                        5868, -- And the Meek Shall Inherit Kalimdor
                        5864, -- Gang War
                        5865, -- Have... Have We Met?
                        5869, -- Infernal Ambassadors
                        5879, -- Veteran of the Molten Front
                    },
                },
                { -- Exploration
                    565,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4863, -- Explore Hyjal
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    571,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        4882, -- The Guardians of Hyjal
                    },
                },
            },
            { -- Deepholm
                553,
                addon.GetMapName(207),
                { -- Quests
                    559,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4871, -- Deep into Deepholm
                        5445, -- Fungalophobia
                        5446, -- The Glop Family Line
                        5449, -- Rock Lover
                        5450, -- Fungal Frenzy
                        5447, -- My Very Own Broodmother
                    },
                },
                { -- Exploration
                    566,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4864, -- Explore Deepholm
                        9924, -- Field Photographer
                    },
                },
                { -- Reputation
                    572,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        4883, -- Therazane
                    },
                },
            },
            { -- Uldum
                554,
                addon.GetMapName(249),
                { -- Quests
                    560,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4872, -- Unearthing Uldum
                        4961, -- In a Thousand Years Even You Might be Worth Something
                        5317, -- Help the Bombardier! I'm the Bombardier!
                    },
                },
                { -- Exploration
                    567,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4865, -- Explore Uldum
                    },
                },
                { -- Reputation
                    574,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        4884, -- Ramkahen
                    },
                },
                {
                    5767, -- Scourer of the Eternal Sands
                    4888, -- One Hump or Two?
                },
            },
            { -- Twilight Highlands
                555,
                addon.GetMapName(241),
                { -- Quests
                    561,
                        addon.GetCategoryInfoTitle(96),
                true,
                    {
                        4873, -- Fading into Twilight
                        5501, -- Fading into Twilight
                        4960, -- Round Three. Fight!
                        5481, -- Wildhammer Tour of Duty
                        5482, -- Dragonmaw Tour of Duty
                        5320, -- King of the Mountain
                        5321, -- King of the Mountain
                        5451, -- Consumed by Nightmare
                        4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
                    },
                },
                { -- Exploration
                    568,
                        addon.GetCategoryInfoTitle(97),
                true,
                    {
                        4866, -- Explore Twilight Highlands
                    },
                },
                { -- Reputation
                    573,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        948, -- Ambassador of the Alliance
                        762, -- Ambassador of the Horde
                        4885, -- Wildhammer Clan
                        4886, -- Dragonmaw Clan
                    },
                },
            },
            { -- Molten Front
                556,
                addon.GetMapName(338),
                {
                    5859, -- Legacy of Leyara
                    5866, -- The Molten Front Offensive
                    5867, -- Flawless Victory
                    5871, -- Master of the Molten Flow
                    5872, -- King of the Spider-Hill
                    5874, -- Death From Above
                    5873, -- Ready for Raiding II
                    5879, -- Veteran of the Molten Front
                },
            },
            {
                4875, -- Loremaster of Cataclysm
                4983, -- Loremaster of Cataclysm
                4827, -- Surveying the Damage
                5548, -- To All the Squirrels Who Cared for Me
                5754, -- Drown Your Sorrows
                5753, -- Cataclysmically Delicious
                4868, -- Cataclysm Explorer
                4881, -- The Earthen Ring
                7520, -- The Loremaster
            },
        },
        { -- Dungeons
            130,
            addon.GetCategoryInfoTitle(15272),
            { -- Blackrock Caverns
                132,
                addon.GetInstanceInfoName(66),
                {
                    5281, -- Crushing Bones and Cracking Skulls
                    5282, -- Arrested Development
                    5283, -- Too Hot to Handle
                    5284, -- Ascendant Descending
                    4833, -- Blackrock Caverns
                    5060, -- Heroic: Blackrock Caverns
                    41139, -- Protocol Inferno: Blackrock Caverns
                },
            },
            { -- Throne of the Tides
                133,
                addon.GetInstanceInfoName(65),
                {
                    5285, -- Old Faithful
                    5286, -- Prince of Tides
                    4839, -- Throne of the Tides
                    5061, -- Heroic: Throne of the Tides
                    41140, -- Protocol Inferno: Throne of the Tides
                    19082, -- Keystone Hero: Throne of the Tides
                },
            },
            { -- The Stonecore
                134,
                addon.GetInstanceInfoName(67),
                {
                    5287, -- Rotten to the Core
                    4846, -- The Stonecore
                    5063, -- Heroic: The Stonecore
                    41141, -- Protocol Inferno: The Stonecore
                },
            },
            { -- The Vortex Pinnacle
                135,
                addon.GetInstanceInfoName(68),
                {
                    5289, -- Extra Credit Bonus Stage
                    5288, -- No Static at All
                    4847, -- The Vortex Pinnacle
                    5064, -- Heroic: The Vortex Pinnacle
                    41142, -- Protocol Inferno: The Vortex Pinnacle
                    17847, -- Keystone Hero: The Vortex Pinnacle
                },
            },
            { -- Grim Batol
                136,
                addon.GetInstanceInfoName(71),
                {
                    5297, -- Umbrage for Umbriss
                    5298, -- Don't Need to Break Eggs to Make an Omelet
                    4840, -- Grim Batol
                    5062, -- Heroic: Grim Batol
                    41143, -- Protocol Inferno: Grim Batol
                    20588, -- Keystone Hero: Grim Batol
                },
            },
            { -- Halls of Origination
                137,
                addon.GetInstanceInfoName(70),
                {
                    5293, -- I Hate That Song
                    5294, -- Straw That Broke the Camel's Back
                    5296, -- Faster Than the Speed of Light
                    5295, -- Sun of a....
                    4841, -- Halls of Origination
                    5065, -- Heroic: Halls of Origination
                    41144, -- Protocol Inferno: Halls of Origination
                    9924, -- Field Photographer
                },
            },
            { -- Lost City of the Tol'vir
                138,
                addon.GetInstanceInfoName(69),
                {
                    5291, -- Acrocalypse Now
                    5290, -- Kill It With Fire!
                    5292, -- Headed South
                    4848, -- Lost City of the Tol'vir
                    5066, -- Heroic: Lost City of the Tol'vir
                    41145, -- Protocol Inferno: Lost City of the Tol'vir
                },
            },
            { -- Deadmines
                139,
                addon.GetInstanceInfoName(63),
                {
                    5366, -- Ready for Raiding
                    5367, -- Rat Pack
                    5368, -- Prototype Prodigy
                    5369, -- It's Frost Damage
                    5370, -- I'm on a Diet
                    5371, -- Vigorous VanCleef Vindicator
                    628, -- Deadmines
                    5083, -- Heroic: Deadmines
                    41146, -- Protocol Inferno: Deadmines
                    11856, -- Pet Battle Challenge: Deadmines
                    9924, -- Field Photographer
                },
            },
            { -- Shadowfang Keep
                140,
                addon.GetInstanceInfoName(64),
                {
                    5503, -- Pardon Denied
                    5504, -- To the Ground!
                    5505, -- Bullet Time
                    631, -- Shadowfang Keep
                    5093, -- Heroic: Shadowfang Keep
                    41147, -- Protocol Inferno: Shadowfang Keep
                    4627, -- X-45 Heartbreaker
                },
            },
            { -- Zul'Gurub
                141,
                addon.GetInstanceInfoName(76),
                {
                    5743, -- It's Not Easy Being Green
                    5762, -- Ohganot So Fast!
                    5765, -- "Here, Kitty Kitty..."
                    5759, -- Spirit Twister
                    5744, -- Gurubashi Headhunter
                    5768, -- Heroic: Zul'Gurub
                },
            },
            { -- Zul'Aman
                142,
                addon.GetInstanceInfoName(77),
                {
                    5858, -- Bear-ly Made It
                    5750, -- Tunnel Vision
                    5761, -- Hex Mix
                    5760, -- Ring Out!
                    5769, -- Heroic: Zul'Aman
                },
            },
            { -- End Time
                143,
                addon.GetInstanceInfoName(184),
                {
                    5995, -- Moon Guard
                    6130, -- Severed Ties
                    6117, -- Heroic: End Time
                },
            },
            { -- Well of Eternity
                144,
                addon.GetInstanceInfoName(185),
                {
                    6127, -- Lazy Eye
                    6070, -- That's Not Canon!
                    6118, -- Heroic: Well of Eternity
                },
            },
            { -- Hour of Twilight
                145,
                addon.GetInstanceInfoName(186),
                {
                    6132, -- Eclipse
                    6119, -- Heroic: Hour of Twilight
                },
            },
            {
                4844, -- Cataclysm Dungeon Hero
                41148, -- Protocol Inferno: Terminated
                5506, -- Defender of a Shattered World
                4845, -- Glory of the Cataclysm Hero
            },
        },
        { -- Raids
            131,
            addon.GetCategoryInfoTitle(15271),
            { -- Baradin Hold
                146,
                addon.GetInstanceInfoName(75),
                {
                    5416, -- Pit Lord Argaloth
                    6045, -- Occu'thar
                    6108, -- Alizabal
                },
            },
            { -- Blackwing Descent
                147,
                addon.GetInstanceInfoName(73),
                { -- Glory
                    902,
                    addon.L["Glory"],
                    {
                        5306, -- Parasite Evening
                        5307, -- Achieve-a-tron
                        5309, -- Full of Sound and Fury
                        5308, -- Silence is Golden
                        5310, -- Aberrant Behavior
                        4849, -- Keeping it in the Family
                    },
                },
                { -- Heroic
                    903,
                    addon.L["Heroic"],
                    {
                        5094, -- Heroic: Magmaw
                        5107, -- Heroic: Omnotron Defense System
                        5115, -- Heroic: Chimaeron
                        5109, -- Heroic: Atramedes
                        5108, -- Heroic: Maloriak
                        5116, -- Heroic: Nefarian
                    },
                },
                {
                    4842, -- Blackwing Descent
                    11754, -- Glamour of Twilight
                    12079, -- Raiding with Leashes V: Cuteaclysm
                },
            },
            { -- The Bastion of Twilight
                148,
                addon.GetInstanceInfoName(72),
                { -- Glory
                    904,
                    addon.L["Glory"],
                    {
                        5300, -- The Only Escape
                        4852, -- Double Dragon
                        5311, -- Elementary
                        5312, -- The Abyss Will Gaze Back Into You
                    },
                },
                { -- Heroic
                    905,
                    addon.L["Heroic"],
                    {
                        5118, -- Heroic: Halfus Wyrmbreaker
                        5117, -- Heroic: Valiona and Theralion
                        5119, -- Heroic: Ascendant Council
                        5120, -- Heroic: Cho'gall
                        5121, -- Heroic: Sinestra
                    },
                },
                {
                    4850, -- The Bastion of Twilight
                    5313, -- I Can't Hear You Over the Sound of How Awesome I Am
                    11754, -- Glamour of Twilight
                    12079, -- Raiding with Leashes V: Cuteaclysm
                },
            },
            { -- Throne of the Four Winds
                149,
                addon.GetInstanceInfoName(74),
                {
                    5304, -- Stay Chill
                    5305, -- Four Play
                    5122, -- Heroic: Conclave of Wind
                    5123, -- Heroic: Al'Akir
                    4851, -- Throne of the Four Winds
                    12079, -- Raiding with Leashes V: Cuteaclysm
                },
            },
            { -- Firelands
                150,
                addon.GetInstanceInfoName(78),
                { -- Glory
                    906,
                    addon.L["Glory"],
                    {
                        5821, -- Death from Above
                        5813, -- Do a Barrel Roll!
                        5810, -- Not an Ambi-Turner
                        5829, -- Bucket List
                        5830, -- Share the Pain
                        5799, -- Only the Penitent...
                    },
                },
                { -- Heroic
                    907,
                    addon.L["Heroic"],
                    {
                        5807, -- Heroic: Beth'tilac
                        5809, -- Heroic: Alysrazor
                        5808, -- Heroic: Lord Rhyolith
                        5806, -- Heroic: Shannox
                        5805, -- Heroic: Baleroc
                        5804, -- Heroic: Majordomo Fandral Staghelm
                        5803, -- Heroic: Ragnaros
                    },
                },
                { -- Reputation
                    576,
                        addon.GetCategoryInfoTitle(201),
                true,
                    {
                        5827, -- Avengers of Hyjal
                    },
                },
                {
                    5855, -- Ragnar-O's
                    5802, -- Firelands
                    11755, -- Hot Couture
                    5839, -- "Dragonwrath, Tarecgosa's Rest"
                    12079, -- Raiding with Leashes V: Cuteaclysm
                },
            },
            { -- Dragon Soul
                151,
                addon.GetInstanceInfoName(187),
                { -- Glory
                    908,
                    addon.L["Glory"],
                    {
                        6174, -- Don't Stand So Close to Me
                        6128, -- Ping Pong Champion
                        6129, -- Taste the Rainbow!
                        6084, -- Minutes to Midnight
                        6105, -- Deck Defender
                        6133, -- Maybe He'll Get Dizzy...
                        6180, -- Chromatic Champion
                    },
                },
                { -- Heroic
                    909,
                    addon.L["Heroic"],
                    {
                        6109, -- Heroic: Morchok
                        6110, -- Heroic: Warlord Zon'ozz
                        6111, -- Heroic: Yor'sahj the Unsleeping
                        6112, -- Heroic: Hagara the Stormbinder
                        6113, -- Heroic: Ultraxion
                        6114, -- Heroic: Warmaster Blackhorn
                        6115, -- Heroic: Spine of Deathwing
                        6116, -- Heroic: Madness of Deathwing
                    },
                },
                {
                    6175, -- Holding Hands
                    5518, -- Stood in the Fire
                    6106, -- Siege of Wyrmrest Temple
                    6107, -- Fall of Deathwing
                    6177, -- Destroyer's End
                    11756, -- Wardrobe of the Old Gods
                    6181, -- Fangs of the Father
                    12079, -- Raiding with Leashes V: Cuteaclysm
                },
            },
            {
                5506, -- Defender of a Shattered World
                4853, -- Glory of the Cataclysm Raider
                5828, -- Glory of the Firelands Raider
                6169, -- Glory of the Dragon Soul Raider
            },
        },
        { -- Professions
            1153,
            addon.GetCategoryInfoTitle(169),
            { -- Archaeology
                1471,
                addon.GetCategoryInfoTitle(15071),
                true,
                {
                    4923, -- Illustrious Grand Master Archaeologist
                    5301, -- The Boy Who Would be King
                },
            },
            { -- Cooking
                1480,
                addon.GetCategoryInfoTitle(170),
                true,
                {
                    4916, -- Cataclysmic Cook
                    5472, -- The Cataclysmic Gourmet
                    5473, -- The Cataclysmic Gourmet
                },
            },
            { -- Fishing
                1497,
                addon.GetCategoryInfoTitle(171),
                true,
                {
                    4917, -- Cataclysmic Fisherman
                },
            },
            { -- Tailoring
                1527,
                addon.GetCategoryInfoTitle(15496),
                true,
                {
                    5480, -- Preparing for Disaster
                    18815, -- Speed Dreamin'
                },
            },
            {
                4924, -- Professional Cataclysmic Master
                4914, -- Working In the Heat
                18719, -- Cataclysmic Master of All
                4918, -- Illustrious Grand Master Medic
                4915, -- More Skills to Pay the Bills
            },
        },
        { -- Tol Barad
            547,
            addon.GetCategoryInfoTitle(15075),
            { -- Quests
                563,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4874, -- Breaking Out of Tol Barad
                    5718, -- Just Another Day in Tol Barad
                    5719, -- Just Another Day in Tol Barad
                },
            },
            { -- PvP
                569,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    5412, -- Tol Barad Victory
                    5418, -- Tol Barad Veteran
                    5417, -- Tol Barad Veteran
                    5415, -- Tower Plower
                    5488, -- Towers of Power
                    5487, -- Tol Barad Saboteur
                    5486, -- Tol Barad All-Star
                },
            },
            { -- Reputation
                575,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    5375, -- Baradin's Wardens
                    5376, -- Hellscream's Reach
                },
            },
            {
                5489, -- Master of Tol Barad
                5490, -- Master of Tol Barad
            },
        },
        {
            4887, -- Tripping the Rifts
            5535, -- 1000 Valor Points
            5536, -- 5000 Valor Points
            5537, -- "25,000 Valor Points"
            5538, -- "50,000 Valor Points"
            6924, -- "100,000 Valor Points"
        },
    },
};