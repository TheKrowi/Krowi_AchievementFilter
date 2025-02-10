local _, addon = ...;

local crossExpansion = { -- Cross-Expansion
    1431,
    addon.L["Cross-Expansion"],
    { -- Zones
        1160,
        addon.L["Zones"],
        { -- Exile's Reach
            953,
            addon.GetAchievmentName(14222),
            {
                14222, -- Exile's Reach
            },
        },
    },
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
            19489, -- Class Connoisseur
            546, -- Safe Deposit
            40142, -- Learning to Share
            40145, -- So Much Sharing
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
            11132, -- 10,000 World Quests Completed
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
    { -- Delves
        1670,
        addon.GetCategoryInfoTitle(15522),
        {
            40436, -- You're Getting a Delve!
            40460, -- Delve Deep
            40462, -- Delve Deeper
            40463, -- Delve Deepest
            41095, -- Delve Beyond
            41096, -- Delve Infinite
            40819, -- Ready to Turn
            40788, -- I Got the Keys
            40882, -- Copious Coffers
            40885, -- The Key to Madness
            40817, -- A Delver's Bounty
            40863, -- Perplexing Puzzle
            40864, -- Plentiful Perplexing Puzzles
            41105, -- Prodigious Plentiful Perplexing Puzzles
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
        { -- Alchemy
            1456,
            addon.GetCategoryInfoTitle(15489),
            {
                18726, -- A Cure for All Ails I
                18731, -- A Cure for All Ails II
                18732, -- A Cure for All Ails III
                18733, -- A Cure for All Ails IV
                18734, -- Powerful Concoctions I
                18735, -- Powerful Concoctions II
                18736, -- Powerful Concoctions III
                18737, -- Powerful Concoctions IV
                18934, -- Excessive Experimentation
                18723, -- Look, You're Specialized!
                18904, -- Iron to Vendor Gold
                18963, -- Burst Damage
            },
        },
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
                9422, -- The Search For Fact, Not Truth
                5511, -- It's Always in the Last Place You Look
            },
        },
        { -- Blacksmithing
            1457,
            addon.GetCategoryInfoTitle( 15490),
            {
                18862, -- Anvil Mastery I
                18864, -- Anvil Mastery II
                18865, -- Anvil Mastery III
                18866, -- Anvil Mastery IV
                18851, -- Skeletons in the Lockbox
                18852, -- Weaponsmithing, Reborn
                17496, -- Renowned Weaponsmith
                17497, -- Renowned Armorsmith
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
        { -- Enchanting
            1460,
            addon.GetCategoryInfoTitle(15491),
            {
                18766, -- Disenchantment I
                18767, -- Disenchantment II
                18768, -- Disenchantment III
                18769, -- Disenchantment IV
                18868, -- Enchantment I
                18869, -- Enchantment II
                18870, -- Enchantment III
                18871, -- Enchantment IV
                18785, -- Shattered Expectations
                18789, -- Simply Enchanting
            },
        },
        { -- Engineering
            1461,
            addon.GetCategoryInfoTitle(15492),
            {
                18872, -- Dangerous Devices I
                18873, -- Dangerous Devices II
                18874, -- Dangerous Devices III
                18875, -- Dangerous Devices IV
                18730, -- Goblins vs Gnomes
                18855, -- Portal to Everywhere
                18895, -- You Had it Coming
                18901, -- Chromatic Calibration: Holo-Gogs
                18908, -- Chromatic Calibration: Bio-Optic Killshades
                18905, -- Chromatic Calibration: Retinal Armor
                18906, -- Chromatic Calibration: Cranial Cannons
                18907, -- Chromatic Calibration: Ectoplasmic Specs
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
        { -- Inscription
            1464,
            addon.GetCategoryInfoTitle(15493),
            {
                18876, -- Ink and Quill I
                18877, -- Ink and Quill II
                18878, -- Ink and Quill III
                18879, -- Ink and Quill IV
                18892, -- Massive Mills
                18724, -- Gaining an Advantus
                18738, -- Population In-Crease
                18858, -- Forge and Befuddle
                18859, -- Forge and Befuddle
            },
        },
        { -- Jewelcrafting
            1465,
            addon.GetCategoryInfoTitle(15494),
            {
                18880, -- Generations of Gemstones I
                18889, -- Generations of Gemstones II
                18890, -- Generations of Gemstones III
                18891, -- Generations of Gemstones IV
                18893, -- Plentiful Prospects
                18897, -- Can't Crush These
                18909, -- Fantastic Figurines
            },
        },
        { -- Leatherworking
            1510,
            addon.GetCategoryInfoTitle(15495),
            {
                18881, -- A Test of Scale I
                18882, -- A Test of Scale II
                18883, -- A Test of Scale III
                18884, -- A Test of Scale IV
                18793, -- Always Be Camping
                18898, -- That's Just Cruel
                18900, -- Budget Bard
                17498, -- Renowned Leatherworking Specialist
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
                1250, -- Shop Smart, Shop Pet...Smart
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
        { -- Battle
            1434,
            addon.GetCategoryInfoTitle(15119),
            true,
            {
                6594, -- Cat Fight!
                6593, -- Experienced Pet Battler
                6462, -- Master Pet Battler
                6591, -- Grand Master Pet Battler
                6592, -- Legendary Pet Battler
                6851, -- Take 'Em All On!
                6595, -- Pet Brawler
                6596, -- Experienced Pet Brawler
                6597, -- Master Pet Brawler
                6598, -- Grand Master Pet Brawler
                6599, -- Legendary Pet Brawler
                8297, -- Merciless Pet Brawler
                8298, -- Vengeful Pet Brawler
                8300, -- Brutal Pet Brawler
                8301, -- Deadly Pet Brawler
                12279, -- Mechanical Brawler
                12280, -- Aquatic Brawler
                12281, -- Beast Brawler
                12282, -- Elemental Brawler
                12283, -- Magic Brawler
                12284, -- Critter Brawler
                12285, -- Undead Brawler
                12286, -- Flying Brawler
                12287, -- Dragonkin Brawler
                12289, -- Humanoid Brawler
                12290, -- Family Brawler
                6618, -- On A Roll
                6619, -- Win Streak
                6620, -- No Time To Heal
            },
        },
        { -- Level
            1435,
            addon.GetCategoryInfoTitle(15120),
            true,
            {
                7433, -- Newbie
                6566, -- Just a Pup
                6567, -- Growing Up
                6568, -- Time for a Leash
                6569, -- Old Timer
                6570, -- All Growns Up!
                6579, -- Rookie Pet Group
                6580, -- Rookie Pet Crew
                6583, -- Rookie Pet Mob
                6578, -- Pro Pet Group
                6581, -- Pro Pet Crew
                6582, -- Pro Pet Mob
                6609, -- No Favorites
                6610, -- All Pets Allowed
                9070, -- Overstuffed
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
};

local classic = { -- Classic
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
                addon.GetMapName(56),
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
            6602, -- Taming Kalimdor
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
};

local theBurningCrusade = { -- The Burning Crusade
    55,
    addon.GetCategoryInfoTitle(14865),
    { -- Zones
        616,
        addon.L["Zones"],
        { -- Shattrath City
            794,
            addon.GetMapName(111),
            {
                1165, -- My Storage is "Gigantique"""
                9924, -- Field Photographer
            },
        },
        { -- Silvermoon City
            924,
            addon.GetMapName(110),
            {
                613, -- Killed in Quel'Thalas
                614, -- For the Alliance!
                604, -- Wrath of the Alliance
            },
        },
        { -- The Exodar
            969,
            addon.GetMapName(103),
            {
                618, -- Putting Out the Light
                619, -- For the Horde!
                603, -- Wrath of the Horde
            },
        },
        { -- Azuremyst Isle
            758,
            addon.GetMapName(97),
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
            addon.GetMapName(106),
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
            addon.GetMapName(94),
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
            addon.GetMapName(95),
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
            addon.GetMapName(100),
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
            addon.GetMapName(102),
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
            addon.GetMapName(108),
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
            addon.GetMapName(107),
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
                    899, -- Oh My, Kurenai
                    901, -- Mag'har of Draenor
                    942, -- The Diplomat
                    943, -- The Diplomat
                },
            },
        },
        { -- Blade's Edge Mountains
            621,
            addon.GetMapName(105),
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
            addon.GetMapName(109),
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
            addon.GetMapName(104),
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
            addon.GetMapName(122),
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
                11749, -- Suns Out, Thori'dals Out
                725, -- Thori'dal, the Stars' Fury
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
        { -- Engineering
            1570,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                18856, -- Just an Ordinary Gas Cloud
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
        { -- Leatherworking
            1512,
            addon.GetCategoryInfoTitle(15495),
            true,
            {
                18894, -- Free Stylin'
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
    { -- Pet Battles
        786,
        addon.GetCategoryInfoTitle(15117),
        {
            6587, -- Outland Safari
            6614, -- Outland Tamer
            6604, -- Taming Outland
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            6584, -- Big City Pet Brawlin' - Alliance
            6621, -- Big City Pet Brawlin' - Horde
            6622, -- Big City Pet Brawler
            6611, -- Continental Tamer
            6590, -- World Safari
            8348, -- The Longest Day
        },
    },
    { -- Dragonriding Races
        1536,
        addon.L["Dragonriding Races"],
        {
            19092, -- Outland: Bronze
            19097, -- Outland: Silver
            19098, -- Outland: Gold
            19099, -- Outland Advanced: Bronze
            19100, -- Outland Advanced: Silver
            19101, -- Outland Advanced: Gold
            19102, -- Outland Reverse: Bronze
            19103, -- Outland Reverse: Silver
            19104, -- Outland Reverse: Gold
            19105, -- Outland Racing Completionist
            19106, -- Outland Racing Completionist: Silver
            19107, -- Outland Racing Completionist: Gold
        },
    },
};

local wrathOfTheLichKing = { -- Wrath of the Lich King
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
        { -- Wintergrasp
            1034,
            addon.GetMapName(123),
            {
                9924, -- Field Photographer
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
};

local cataclysm = { -- Cataclysm
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
                    5318, -- 20,000 Leagues Under the Sea
                    5319, -- 20,000 Leagues Under the Sea
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
                5765, -- Here, Kitty Kitty...
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
                5839, -- Dragonwrath, Tarecgosa's Rest
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
    { -- Pet Battles
        788,
        addon.GetCategoryInfoTitle(15117),
        {
            7525, -- Taming Cataclysm
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            14021, -- The Shadows Revealed
            8348, -- The Longest Day
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
        5537, -- 25,000 Valor Points
        5538, -- 50,000 Valor Points
        6924, -- 100,000 Valor Points
    },
};

local mistsOfPandaria = { -- Mists of Pandaria
    189,
    addon.GetCategoryInfoTitle(15164),
    { -- Zones
        491,
        addon.L["Zones"],
        { -- Pandaria
            526,
            addon.GetMapName(424),
            { -- Quests
                527,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6541, -- Loremaster of Pandaria
                    7285, -- Every Day I'm Pand-a-ren
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                528,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6716, -- Between a Saurok and a Hard Place
                    6754, -- The Dark Heart of the Mogu
                    6846, -- Fish Tales
                    6850, -- Hozen in the Mist
                    6847, -- The Song of the Yaungol
                    6855, -- The Seven Burdens of Shaohao
                    6856, -- Ballad of Liu Lang
                    6858, -- What Is Worth Fighting For
                    7230, -- Legend of the Brewfathers
                    7994, -- Treasure of Pandaria
                    7995, -- Fortune of Pandaria
                    7996, -- Bounty of Pandaria
                    7997, -- Riches of Pandaria
                    7281, -- Lost and Found
                    7282, -- Finders Keepers
                    7283, -- One Man's Trash...
                    7284, -- Is Another Man's Treasure
                    7437, -- A Worthy Opponent
                    7438, -- Could We Find More Like That?
                    7439, -- Glorious!
                    8078, -- Zul'Again
                    6350, -- To All the Squirrels I Once Caressed?
                    7329, -- Pandaren Cuisine
                    7330, -- Pandaren Delicacies
                    6974, -- Pandaria Explorer
                },
            },
            { -- Reputation
                529,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    7479, -- The Shado-Master
                    6543, -- The August Celestials
                    6547, -- The Anglers
                    6548, -- The Lorewalkers
                    6827, -- Pandaren Ambassador
                    6828, -- Pandaren Ambassador
                },
            },
        },
        { -- The Jade Forest
            492,
            addon.GetMapName(371),
            { -- Quests
                519,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6300, -- Upjade Complete
                    6534, -- Upjade Complete
                    7289, -- Shadow Hopper
                    7290, -- How To Strain Your Dragon
                    7291, -- In a Trail of Smoke
                },
            },
            { -- Exploration
                545,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6351, -- Explore Jade Forest
                    7381, -- Restore Balance
                },
            },
            { -- Reputation
                546,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6550, -- Order of the Cloud Serpent
                },
            },
        },
        { -- Valley of the Four Winds
            493,
            addon.GetMapName(376),
            { -- Quests
                516,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6301, -- Rally the Valley
                    7292, -- Green Acres
                    7293, -- Till the Break of Dawn
                    7294, -- A Taste of Things to Come
                    7295, -- Listen to the Drunk Fish
                    7296, -- Ain't Lost No More
                    7502, -- Savior of Stoneplow
                },
            },
            { -- Exploration
                544,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6969, -- Explore Valley of the Four Winds
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                518,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6544, -- The Tillers
                    6551, -- Friend on the Farm
                    6552, -- Friends on the Farm
                },
            },
            {
                6517, -- Extinction Event
            },
        },
        { -- Krasarang Wilds
            494,
            addon.GetMapName(418),
            { -- Quests
                513,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6535, -- Mighty Roamin' Krasaranger
                    6536, -- Mighty Roamin' Krasaranger
                    7287, -- Champion of Chi-Ji
                    7928, -- Operation: Shieldwall Campaign
                    7929, -- Dominance Offensive Campaign
                },
            },
            { -- Exploration
                514,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6975, -- Explore Krasarang Wilds
                    7518, -- Wanderers, Dreamers, and You
                    7932, -- I'm In Your Base, Killing Your Dudes
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                543,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8205, -- Operation: Shieldwall
                    8206, -- Dominance Offensive
                },
            },
        },
        { -- Kun-Lai Summit
            495,
            addon.GetMapName(379),
            { -- Quests
                510,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6537, -- Slum It in the Summit
                    6538, -- Slum It in the Summit
                    7286, -- Finish Them!
                },
            },
            { -- Exploration
                542,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6976, -- Explore Kun-Lai Summit
                    9924, -- Field Photographer
                },
            },
            {
                6480, -- Settle Down, Bro
                7386, -- Grand Expedition Yak
            },
        },
        { -- Townlong Steppes
            496,
            addon.GetMapName(388),
            { -- Quests
                507,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6539, -- One Steppe Forward, Two Steppes Back
                    7288, -- Yak Attack
                    7297, -- Proven Strength
                    7298, -- Getting Around with the Shado-Pan
                    7299, -- Loner and a Rebel
                    7307, -- Silent Assassin
                    7308, -- Know Your Role
                    7309, -- Fire in the Yaung-hole!
                    7310, -- Defender of Gods
                },
            },
            { -- Exploration
                540,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6977, -- Explore Townlong Steppes
                },
            },
            { -- Reputation
                541,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6366, -- Shado-Pan
                },
            },
        },
        { -- Dread Wastes
            497,
            addon.GetMapName(422),
            { -- Quests
                504,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6540, -- Dread Haste Makes Dread Waste
                    7312, -- Amber is the Color of My Energy
                    7313, -- Stay Klaxxi
                    7314, -- Test Drive
                    7316, -- Over Their Heads
                },
            },
            { -- Exploration
                538,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6978, -- Explore Dread Wastes
                    6857, -- Heart of the Mantid Swarm
                },
            },
            { -- Reputation
                539,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6545, -- Klaxxi
                    8023, -- Wakener
                },
            },
        },
        { -- Vale of Eternal Blossoms
            498,
            addon.GetMapName(390),
            { -- Quests
                501,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    7317, -- One Many Army
                    7318, -- A Taste of History
                    7319, -- Ready for Raiding III
                    7320, -- Dog Pile
                    7321, -- Spreading the Warmth
                    7322, -- Roll Club
                    7323, -- Collateral Damage
                    7324, -- One Step at a Time
                    7315, -- Eternally in the Vale
                },
            },
            { -- Exploration
                536,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6979, -- Explore Vale of Eternal Blossoms
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                537,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6546, -- The Golden Lotus
                },
            },
        },
        { -- Isle of Giants
            534,
            addon.GetMapName(507),
            {
                8123, -- Millions of Years of Evolution vs. My Fist
                8092, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
            },
        },
        { -- Isle of Thunder
            522,
            addon.GetMapName(504),
            { -- Quests
                523,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8099, -- Isle of Thunder
                    8100, -- Pay to Slay
                    8101, -- It Was Worth Every Ritual Stone
                    8104, -- Thunder Plunder
                    8105, -- The Crumble Bundle
                    8107, -- Ready for RAAAAIIIIDDD?!?ing
                    8108, -- When in Ihgaluk, Do as the Skumblade Do
                    8109, -- The Mogu Below-gu
                    8110, -- These Mogu Have Gotta Go-gu
                    8111, -- This Isn't Even My Final Form
                    8112, -- Blue Response
                    8114, -- Platform Hero
                    8115, -- Speed Metal
                    8116, -- You Made Me Bleed My Own Blood
                    8117, -- For the Ward!
                    8118, -- Boop
                    8119, -- Our Powers Combined
                    8120, -- Direhorn in a China Shop
                    8212, -- Zandalari Library Card
                    8121, -- Stormbreaker
                    8106, -- In the Hall of the Thunder King
                },
            },
            { -- Exploration
                524,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8103, -- Champions of Lei Shen
                    8049, -- The Zandalari Prophecy
                    8050, -- Rumbles of Thunder
                    8051, -- Gods and Monsters
                },
            },
            { -- Reputation
                525,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8208, -- Kirin Tor Offensive
                    8209, -- Sunreaver Onslaught
                    8210, -- Shado-Pan Assault
                },
            },
            {
                8028, -- Praise the Sun!
            },
        },
        { -- Timeless Isle
            530,
            addon.GetMapName(554),
            { -- Exploration
                531,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8712, -- Killing Time
                    8714, -- Timeless Champion
                    8722, -- Timeless Nutriment
                    8724, -- Pilgrimage
                    8723, -- Legend of the Past
                    8784, -- Timeless Legends
                    8725, -- Eyes On The Ground
                    8726, -- Extreme Treasure Hunter
                    8727, -- Where There's Pirates, There's Booty
                    8729, -- Treasure, Treasure Everywhere
                    8730, -- Rolo's Riddle
                    8743, -- Zarhym Altogether
                    8716, -- Emissary of Ordos
                    8717, -- Candlekeeper
                    8718, -- Oathguard
                    8719, -- Blazebinder
                    8720, -- Kilnmaster
                    8721, -- Fire-Watcher
                    8728, -- Going To Need A Bigger Bag
                },
            },
            { -- Reputation
                535,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8715, -- Emperor Shaohao
                },
            },
            {
                8535, -- Celestial Challenge
                8533, -- Ordos
            },
        },
    },
    { -- Dungeons
        190,
        addon.GetCategoryInfoTitle(15272),
        { -- Temple of the Jade Serpent
            193,
            addon.GetInstanceInfoName(313),
            {
                6475, -- Cleaning Up
                6460, -- Hydrophobia
                6671, -- Seeds of Doubt
                6757, -- Temple of the Jade Serpent
                6758, -- Heroic: Temple of the Jade Serpent
                6884, -- Temple of the Jade Serpent Challenger
                6885, -- Temple of the Jade Serpent: Bronze
                6886, -- Temple of the Jade Serpent: Silver
                6887, -- Temple of the Jade Serpent: Gold
                8430, -- Challenge Master: Temple of the Jade Serpent
                16661, -- Keystone Hero: Temple of the Jade Serpent
            },
        },
        { -- Stormstout Brewery
            194,
            addon.GetInstanceInfoName(302),
            {
                6402, -- Ling-Ting's Herbal Journey
                6089, -- Keep Rollin' Rollin' Rollin'
                6400, -- How Did He Get Up There?
                6420, -- Hopocalypse Now!
                6457, -- Stormstout Brewery
                6456, -- Heroic: Stormstout Brewery
                6888, -- Stormstout Brewery Challenger
                6889, -- Stormstout Brewery: Bronze
                6890, -- Stormstout Brewery: Silver
                6891, -- Stormstout Brewery: Gold
                8431, -- Challenge Master: Stormstout Brewery
            },
        },
        { -- Mogu'shan Palace
            195,
            addon.GetInstanceInfoName(321),
            {
                6713, -- Quarrelsome Quilen Quintet
                6478, -- Glintrok N' Roll
                6736, -- What Does This Button Do?
                6755, -- Mogu'shan Palace
                6756, -- Heroic: Mogu'shan Palace
                6892, -- Mogu'shan Palace Challenger
                6899, -- Mogu'shan Palace: Bronze
                6900, -- Mogu'shan Palace: Silver
                6901, -- Mogu'shan Palace: Gold
                8433, -- Challenge Master: Mogu'shan Palace
            },
        },
        { -- Shado-Pan Monastery
            196,
            addon.GetInstanceInfoName(312),
            {
                6477, -- Respect
                6472, -- The Obvious Solution
                6471, -- Hate Leads to Suffering
                6469, -- Shado-Pan Monastery
                6470, -- Heroic: Shado-Pan Monastery
                6893, -- Shado-Pan Monastery Challenger
                6902, -- Shado-Pan Monastery: Bronze
                6903, -- Shado-Pan Monastery: Silver
                6904, -- Shado-Pan Monastery: Gold
                8432, -- Challenge Master: Shado-Pan Monastery
            },
        },
        { -- Gate of the Setting Sun
            197,
            addon.GetInstanceInfoName(303),
            {
                6479, -- Bomberman
                6476, -- Conscriptinator
                6945, -- Mantid Swarm
                10010, -- Gate of the Setting Sun
                6759, -- Heroic: Gate of the Setting Sun
                6894, -- Gate of the Setting Sun Challenger
                6905, -- Gate of the Setting Sun: Bronze
                6906, -- Gate of the Setting Sun: Silver
                6907, -- Gate of the Setting Sun: Gold
                8434, -- Challenge Master: Gate of the Setting Sun
            },
        },
        { -- Siege of Niuzao Temple
            198,
            addon.GetInstanceInfoName(324),
            {
                6688, -- Where's My Air Support?
                6485, -- Return to Sender
                6822, -- Run with the Wind
                10011, -- Siege of Niuzao Temple
                6763, -- Heroic: Siege of Niuzao Temple
                6898, -- Siege of Niuzao Temple Challenger
                6917, -- Siege of Niuzao Temple: Bronze
                6918, -- Siege of Niuzao Temple: Silver
                6919, -- Siege of Niuzao Temple: Gold
                8439, -- Challenge Master: Siege of Niuzao Temple
            },
        },
        { -- Scarlet Halls
            199,
            addon.GetInstanceInfoName(311),
            {
                6684, -- Humane Society
                6427, -- Mosh Pit
                7413, -- Scarlet Halls
                6760, -- Heroic: Scarlet Halls
                6895, -- Scarlet Halls Challenger
                6908, -- Scarlet Halls: Bronze
                6909, -- Scarlet Halls: Silver
                6910, -- Scarlet Halls: Gold
                8436, -- Challenge Master: Scarlet Halls
            },
        },
        { -- Scarlet Monastery
            200,
            addon.GetInstanceInfoName(316),
            {
                6946, -- Empowered Spiritualist
                6928, -- Burning Man
                6929, -- And Stay Dead!
                637, -- Scarlet Monastery
                6761, -- Heroic: Scarlet Monastery
                6896, -- Scarlet Monastery Challenger
                6911, -- Scarlet Monastery: Bronze
                6912, -- Scarlet Monastery: Silver
                6913, -- Scarlet Monastery: Gold
                8437, -- Challenge Master: Scarlet Monastery
                980, -- The Horseman's Reins
            },
        },
        { -- Scholomance
            201,
            addon.GetInstanceInfoName(246),
            {
                6531, -- Attention to Detail
                6394, -- Rattle No More
                6396, -- Sanguinarian
                6715, -- Polyformic Acid Science
                6821, -- School's Out Forever
                645, -- Scholomance
                6762, -- Heroic: Scholomance
                6897, -- Scholomance Challenger
                6914, -- Scholomance: Bronze
                6915, -- Scholomance: Silver
                6916, -- Scholomance: Gold
                8438, -- Challenge Master: Scholomance
            },
        },
        {
            6925, -- Pandaria Dungeon Hero
            6927, -- Glory of the Pandaria Hero
            8903, -- Mistwalker
            6920, -- Challenge Conqueror
            6374, -- Challenge Conqueror: Bronze
            6375, -- Challenge Conqueror: Silver
            6378, -- Challenge Conqueror: Gold
        },
    },
    { -- Raids
        191,
        addon.GetCategoryInfoTitle(15271),
        { -- Mogu'shan Vaults
            202,
            addon.GetInstanceInfoName(317),
            { -- Glory
                892,
                addon.L["Glory"],
                {
                    6823, -- Must Love Dogs
                    6674, -- Anything You Can Do, I Can Do Better...
                    7056, -- Sorry, Were You Looking for This?
                    6686, -- Straight Six
                },
            },
            { -- Heroic
                893,
                addon.L["Heroic"],
                {
                    6719, -- Heroic: Stone Guard
                    6720, -- Heroic: Feng the Accursed
                    6721, -- Heroic: Gara'jal the Spiritbinder
                    6722, -- Heroic: Four Kings
                    6723, -- Heroic: Elegon
                    6724, -- Heroic: Will of the Emperor
                },
            },
            {
                7933, -- And... It's Good!
                6687, -- Getting Hot In Here
                6455, -- Show Me Your Moves!
                6458, -- Guardians of Mogu'shan
                6844, -- The Vault of Mysteries
                6954, -- Ahead of the Curve: Will of the Emperor
                7485, -- Cutting Edge: Will of the Emperor
            },
        },
        { -- Heart of Fear
            203,
            addon.GetInstanceInfoName(330),
            { -- Glory
                894,
                addon.L["Glory"],
                {
                    6937, -- Overzealous
                    6936, -- Candle in the Wind
                    6553, -- Like an Arrow to the Face
                    6683, -- Less Than Three
                    6518, -- I Heard You Like Amber...
                    6922, -- Timing is Everything
                },
            },
            { -- Heroic
                895,
                addon.L["Heroic"],
                {
                    6725, -- Heroic: Imperial Vizier Zor'lok
                    6726, -- Heroic: Blade Lord Ta'yak
                    6727, -- Heroic: Garalon
                    6728, -- Heroic: Wind Lord Mel'jarak
                    6729, -- Heroic: Amber-Shaper Un'sok
                    6730, -- Heroic: Grand Empress Shek'zeer
                },
            },
            {
                6718, -- The Dread Approach
                6845, -- Nightmare of Shek'zeer
                8246, -- Ahead of the Curve: Grand Empress Shek'zeer
                7486, -- Cutting Edge: Grand Empress Shek'zeer
                11757, -- Sha of Fabulous
            },
        },
        { -- Terrace of Endless Spring
            204,
            addon.GetInstanceInfoName(320),
            { -- Glory
                896,
                addon.L["Glory"],
                {
                    6717, -- Power Overwhelming
                    6933, -- Who's Got Two Green Thumbs?
                    6824, -- Face Clutchers
                    6825, -- The Mind-Killer
                },
            },
            { -- Heroic
                897,
                addon.L["Heroic"],
                {
                    6731, -- Heroic: Protectors of the Endless
                    6732, -- Heroic: Tsulong
                    6733, -- Heroic: Lei Shi
                    6734, -- Heroic: Sha of Fear
                },
            },
            {
                6689, -- Terrace of Endless Spring
                8248, -- Ahead of the Curve: Sha of Fear
                7487, -- Cutting Edge: Sha of Fear
                11757, -- Sha of Fabulous
            },
        },
        { -- Throne of Thunder
            205,
            addon.GetInstanceInfoName(362),
            { -- Glory
                898,
                addon.L["Glory"],
                {
                    8094, -- Lightning Overload
                    8038, -- Cretaceous Collector
                    8073, -- Cage Match
                    8077, -- One-Up
                    8082, -- Head Case
                    8097, -- Soft Hands
                    8098, -- You Said Crossing the Streams Was Bad
                    8037, -- Genetically Unmodified Organism
                    8081, -- Ritualist Who?
                    8087, -- Can't Touch This
                    8086, -- From Dusk 'til Dawn
                    8090, -- A Complete Circuit
                },
            },
            { -- Heroic
                899,
                addon.L["Heroic"],
                {
                    8056, -- Heroic: Jin'rokh the Breaker
                    8057, -- Heroic: Horridon
                    8058, -- Heroic: Council of Elders
                    8059, -- Heroic: Tortos
                    8060, -- Heroic: Megaera
                    8061, -- Heroic: Ji-Kun
                    8062, -- Heroic: Durumu the Forgotten
                    8063, -- Heroic: Primordius
                    8064, -- Heroic: Dark Animus
                    8065, -- Heroic: Iron Qon
                    8066, -- Heroic: Twin Empyreans
                    8067, -- Heroic: Lei Shen
                    8068, -- Heroic: Ra-den
                },
            },
            {
                8069, -- Last Stand of the Zandalari
                8070, -- Forgotten Depths
                8071, -- Halls of Flesh-Shaping
                8072, -- Pinnacle of Storms
                8089, -- I Thought He Was Supposed to Be Hard?
                8249, -- Ahead of the Curve: Lei Shen
                8238, -- Cutting Edge: Lei Shen
                8260, -- Cutting Edge: Ra-den
                11758, -- Thunderwear
            },
        },
        { -- Siege of Orgrimmar
            206,
            addon.GetInstanceInfoName(369),
            { -- Glory
                900,
                addon.L["Glory"],
                {
                    8536, -- No More Tears
                    8528, -- Go Long
                    8532, -- None Shall Pass
                    8521, -- Swallow Your Pride
                    8530, -- The Immortal Vanguard
                    8520, -- Fire in the Hole!
                    8453, -- Rescue Raiders
                    8448, -- Gamon Will Save Us!
                    8538, -- Unlimited Potential
                    8529, -- Criss Cross
                    8527, -- Giant Dinosaur vs. Mega Snail
                    8543, -- Lasers and Magnets and Drills! Oh My!
                    8531, -- Now We are the Paragon
                    8537, -- Strike!
                },
            },
            { -- Mythic
                901,
                addon.L["Mythic"],
                {
                    8463, -- Mythic: Immerseus
                    8465, -- Mythic: Fallen Protectors
                    8466, -- Mythic: Norushen
                    8467, -- Mythic: Sha of Pride
                    8468, -- Mythic: Galakras
                    8469, -- Mythic: Iron Juggernaut
                    8470, -- Mythic: Kor'kron Dark Shaman
                    8471, -- Mythic: General Nazgrim
                    8472, -- Mythic: Malkorok
                    8478, -- Mythic: Spoils of Pandaria
                    8479, -- Mythic: Thok the Bloodthirsty
                    8480, -- Mythic: Siegecrafter Blackfuse
                    8481, -- Mythic: Paragons of the Klaxxi
                    8482, -- Mythic: Garrosh Hellscream
                },
            },
            {
                8458, -- Vale of Eternal Sorrows
                8459, -- Gates of Retribution
                8461, -- The Underhold
                8462, -- Downfall
                8679, -- Conqueror of Orgrimmar
                8680, -- Liberator of Orgrimmar
                8398, -- Ahead of the Curve: Garrosh Hellscream (10 player)
                8400, -- Cutting Edge: Garrosh Hellscream (10 player)
                8399, -- Ahead of the Curve: Garrosh Hellscream (25 player)
                8401, -- Cutting Edge: Garrosh Hellscream (25 player)
                11759, -- Yaass'shaarj
            },
        },
        {
            6932, -- Glory of the Pandaria Raider
            8124, -- Glory of the Thundering Raider
            8454, -- Glory of the Orgrimmar Raider
        },
    },
    { -- Professions
        1437,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1440,
            addon.GetCategoryInfoTitle(15071),
            { -- Pandaren
                1441,
                addon.L["Pandaren"],
                true,
                {
                    7331, -- The Three Brew Fathers
                    7332, -- The Broken Hearted
                    7333, -- The Four Celestials
                    7338, -- Collector: Pandaren Tea Sets
                    7358, -- Collector: Pandaren Tea Sets
                    7339, -- Collector: Pandaren Game Boards
                    7359, -- Collector: Pandaren Game Boards
                    7340, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
                    7360, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
                    7341, -- Collector: Walking Canes of Brewfather Ren Yun
                    7361, -- Collector: Walking Canes of Brewfather Ren Yun
                    7342, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
                    7362, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
                    7343, -- Collector: Carved Bronze Mirrors
                    7363, -- Collector: Carved Bronze Mirrors
                    7344, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
                    7364, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
                    7345, -- Collector: Apothecary Tins
                    7365, -- Collector: Apothecary Tins
                    7346, -- Collector: Pearls of Yu'lon
                    7366, -- Collector: Pearls of Yu'lon
                    7347, -- Collector: Standards of Niuzao
                    7367, -- Collector: Standards of Niuzao
                },
            },
            { -- Mogu
                1442,
                addon.L["Mogu"],
                true,
                {
                    7334, -- Instruments of Cruelty
                    7335, -- Symbols of Strength
                    7337, -- Documents of a Dark History
                    7336, -- Stone Servants
                    7348, -- Collector: Manacles of Rebellion
                    7368, -- Collector: Manacles of Rebellion
                    7349, -- Collector: Cracked Mogu Runestones
                    7369, -- Collector: Cracked Mogu Runestones
                    7350, -- Collector: Terracotta Arms
                    7370, -- Collector: Terracotta Arms
                    7351, -- Collector: Petrified Bone Whips
                    7371, -- Collector: Petrified Bone Whips
                    7352, -- Collector: Thunder King Insignias
                    7372, -- Collector: Thunder King Insignias
                    7373, -- Collector: Edicts of the Thunder King
                    7353, -- Collector: Edicts of the Thunder King
                    7354, -- Collector: Iron Amulets
                    7374, -- Collector: Iron Amulets
                    7355, -- Collector: Warlord's Branding Irons
                    7375, -- Collector: Warlord's Branding Irons
                    7356, -- Collector: Mogu Coins
                    7376, -- Collector: Mogu Coins
                    7357, -- Collector: Worn Monument Ledgers
                    7377, -- Collector: Worn Monument Ledgers
                },
            },
            { -- Mantid
                1443,
                addon.L["Mantid"],
                true,
                {
                    8220, -- Collector: Banners of the Mantid Empire
                    8221, -- Collector: Banners of the Mantid Empire
                    8222, -- Collector: Ancient Sap Feeders
                    8223, -- Collector: Ancient Sap Feeders
                    8224, -- Collector: Praying Mantids
                    8225, -- Collector: Praying Mantids
                    8226, -- Collector: Inert Sound Beacons
                    8227, -- Collector: Inert Sound Beacons
                    8228, -- Collector: Remains of Paragons
                    8229, -- Collector: Remains of Paragons
                    8230, -- Collector: Mantid Lamps
                    8231, -- Collector: Mantid Lamps
                    8232, -- Collector: Pollen Collectors
                    8233, -- Collector: Pollen Collectors
                    8234, -- Collector: Kypari Sap Containers
                    8235, -- Collector: Kypari Sap Containers
                },
            },
            {
                6837, -- Zen Master Archaeologist
                7612, -- The Seat of Knowledge
                8219, -- History of the Mantid
            },
        },
        { -- Cooking
            1143,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                6365, -- Zen Master Cook
                7300, -- Master of the Grill
                7301, -- Master of the Wok
                7302, -- Master of the Pot
                7303, -- Master of the Steamer
                7304, -- Master of the Oven
                7305, -- Master of the Brew
                7306, -- Master of Pandaren Cooking
                7325, -- Now I Am the Master
                7326, -- The Pandaren Gourmet
                7327, -- The Pandaren Gourmet
            },
        },
        { -- Fishing
            1438,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                6839, -- Zen Master Fisherman
                7611, -- Pandarian Angler
                7614, -- Locking Down the Docks
                7274, -- Learning from the Best
            },
        },
        {
            6830, -- Professional Zen Master
            6835, -- Working For a Living
            7378, -- Jack of All Trades
            7379, -- Pandaren Master of All
            6838, -- Zen Master Medic
            6836, -- Serious Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        549,
        addon.GetCategoryInfoTitle(15117),
        {
            6616, -- Pandaria Tamer
            6589, -- Pandaria Safari
            8519, -- Celestial Family
            13469, -- Raiding with Leashes VI: Pets of Pandaria
            6606, -- Taming Pandaria
            8410, -- The Celestial Tournament
            8518, -- Master of the Masters
            7908, -- I Choose You
            7936, -- Pandaren Spirit Tamer
            8080, -- Fabled Pandaren Tamer
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
    { -- Brawler's Guild
        790,
        addon.L["Brawler's Guild"],
        {
            7937, -- You Are Not Your $#*@! Legplates (Season 1)
            8020, -- You Are Not Your $#*@! Legplates (Season 1)
            7940, -- The Second Rule of Brawler's Guild (Season 1)
            7939, -- The Second Rule of Brawler's Guild (Season 1)
            7941, -- Brawlin' and Shot Callin' (Season 1)
            7942, -- Brawlin' and Shot Callin' (Season 1)
            8335, -- Having a Brawl (Season 1)
            8337, -- Having a Brawl (Season 1)
            8336, -- I've Got the Biggest Brawls of Them All (Season 1)
            8338, -- I've Got the Biggest Brawls of Them All (Season 1)
            7946, -- Now You're Just Showing Off (Season 1)
            8022, -- Now You're Just Showing Off (Season 1)
            8340, -- Deck Your Collection (Season 1)
            8343, -- Deck Your Collection (Season 1)
            7947, -- The First Rule of Brawler's Guild (Season 1 or 2)
            7948, -- The First Rule of Brawler's Guild (Season 1 or 2)
        },
    },
    { -- Scenarios
        192,
        addon.L["Scenarios"],
        { -- A Brewing Storm
            207,
            (addon.GetLFGDungeonInfo(517)),
            {
                7252, -- A Brewing Storm
                8310, -- Heroic: A Brewing Storm
                7257, -- Don't Shake the Keg
                7261, -- The Perfect Pour
                7258, -- Party of Six
            },
        },
        { -- A Little Patience
            499,
            (addon.GetLFGDungeonInfo(589)),
            {
                7988, -- A Little Patience
                7989, -- Bubbletrapped!
                7990, -- Cannonballer
                7992, -- I Used To Love Them
                7993, -- We've Been Dancin'
                7991, -- Which Came First?
            },
        },
        { -- Arena of Annihilation
            208,
            (addon.GetLFGDungeonInfo(511)),
            {
                7271, -- Arena of Annihilation
                7273, -- Beat the Heat
                7272, -- In the Eye of the Tiger
            },
        },
        { -- Assault on Zan'vess
            214,
            (addon.GetLFGDungeonInfo(593)),
            {
                8016, -- Assault on Zan'vess
                8017, -- For the Swarm
            },
        },
        { -- Blood in the Snow
            220,
            (addon.GetLFGDungeonInfo(646)),
            {
                8316, -- Blood in the Snow
                8312, -- Heroic: Blood in the Snow
                8329, -- Heed the Weed
                8330, -- Hekima's Heal-Halter
            },
        },
        { -- Brewmoon Festival
            209,
            (addon.GetLFGDungeonInfo(539)),
            {
                6923, -- Brewmoon Festival
                6931, -- Binan Village All-Star
                6930, -- Yaungolian Barbecue
            },
        },
        { -- Crypt of Forgotten Kings
            210,
            (addon.GetLFGDungeonInfo(504)),
            {
                7522, -- Crypt of Forgotten Kings
                8311, -- Heroic: Crypt of Forgotten Kings
                7276, -- Fancy Footwork
                7275, -- It's a Trap!
                8368, -- Fight Anger with Anger
            },
        },
        { -- Dagger in the Dark
            215,
            (addon.GetLFGDungeonInfo(616)),
            {
                8009, -- Dagger in the Dark
                7987, -- No Egg Left Behind
                7984, -- Watery Grave
                7986, -- You Mean That Wasn't a Void Zone?
            },
        },
        { -- Dark Heart of Pandaria
            221,
            (addon.GetLFGDungeonInfo(647)),
            {
                8317, -- Dark Heart of Pandaria
                8318, -- Heroic: Dark Heart of Pandaria
                8319, -- Accelerated Archaeology
            },
        },
        { -- Domination Point
            218,
            (addon.GetLFGDungeonInfo(595)),
            {
                8013, -- Domination Point
                8014, -- Number Five Is Alive
                8015, -- Waste Not, Want Not
            },
        },
        { -- Greenstone Village
            211,
            (addon.GetLFGDungeonInfo(492)),
            {
                7265, -- Greenstone Village
                7267, -- Perfect Delivery
                7266, -- Save it for Later
            },
        },
        { -- Lion's Landing
            216,
            (addon.GetLFGDungeonInfo(590)),
            {
                8010, -- Lion's Landing
                8011, -- Number Five Is Alive
                8012, -- Waste Not, Want Not
            },
        },
        { -- The Secrets of Ragefire
            222,
            (addon.GetLFGDungeonInfo(649)),
            {
                8294, -- The Secrets of Ragefire
                8327, -- Heroic: The Secrets of Ragefire
                8295, -- The Few, the Proud, the Gob Squad
            },
        },
        { -- Theramore's Fall
            212,
            (addon.GetLFGDungeonInfo(566)),
            {
                7523, -- Theramore's Fall
                7524, -- Theramore's Fall
                7526, -- Kite Fight
                7529, -- Kite Fight
                7527, -- No Tank You
                7530, -- No Tank You
                7467, -- Theramore's Fall
                7468, -- Theramore's Fall
            },
        },
        { -- Unga Ingoo
            213,
            (addon.GetLFGDungeonInfo(499)),
            {
                7249, -- Unga Ingoo
                7232, -- The Keg Runner
                7239, -- Monkey in the Middle
                7248, -- Monkey See, Monkey Kill
                7231, -- Spill No Evil
            },
        },
        { -- Battle on the High Seas
            219,
            (addon.GetLFGDungeonInfo(655)),
            {
                8314, -- Battle on the High Seas
                8315, -- Battle on the High Seas
                8364, -- Heroic: Battle on the High Seas
                8366, -- Heroic: Battle on the High Seas
                8347, -- Keep those Bombs Away! (From Me)
            },
        },
        {
            6943, -- Queuing Spree
            7385, -- Pub Crawl
            6874, -- Scenaturday
            7509, -- Scenaturday
        },
    },
    { -- Proving Grounds
        490,
        addon.GetCategoryInfoTitle(15222),
        {
            9572, -- Proving Yourself: Bronze Damage
            9573, -- Proving Yourself: Silver Damage
            9574, -- Proving Yourself: Gold Damage
            9575, -- Proving Yourself: Endless Damage (Wave 10)
            9576, -- Proving Yourself: Endless Damage (Wave 20)
            9577, -- Proving Yourself: Endless Damage (Wave 30)
            9578, -- Proving Yourself: Bronze Tank
            9579, -- Proving Yourself: Silver Tank
            9580, -- Proving Yourself: Gold Tank
            9581, -- Proving Yourself: Endless Tank (Wave 10)
            9582, -- Proving Yourself: Endless Tank (Wave 20)
            9583, -- Proving Yourself: Endless Tank (Wave 30)
            9584, -- Proving Yourself: Bronze Healer
            9585, -- Proving Yourself: Silver Healer
            9586, -- Proving Yourself: Gold Healer
            9587, -- Proving Yourself: Endless Healer (Wave 10)
            9588, -- Proving Yourself: Endless Healer (Wave 20)
            9589, -- Proving Yourself: Endless Healer (Wave 30)
            9590, -- You're Doing it Wrong
            9597, -- You're Really Doing It Wrong
            8486, -- Proving Yourself: Bronze Damage (Level 90)
            8491, -- Proving Yourself: Silver Damage (Level 90)
            8496, -- Proving Yourself: Gold Damage (Level 90)
            8501, -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
            8504, -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
            8507, -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
            8487, -- Proving Yourself: Bronze Tank (Level 90)
            8492, -- Proving Yourself: Silver Tank (Level 90)
            8497, -- Proving Yourself: Gold Tank (Level 90)
            8502, -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
            8505, -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
            8508, -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
            8488, -- Proving Yourself: Bronze Healer (Level 90)
            8493, -- Proving Yourself: Silver Healer (Level 90)
            8498, -- Proving Yourself: Gold Healer (Level 90)
            8503, -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
            8506, -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
            8509, -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
            8697, -- You're Doing it Wrong (Level 90)
            8812, -- You're Really Doing It Wrong (Level 90)
        },
    },
    {
        6926, -- Tranquil Master
        7533, -- Chapter I: Trial of the Black Prince
        8030, -- A Test of Valor
        8031, -- A Test of Valor
        7534, -- Chapter II: Wrathion's War
        8008, -- Chapter II: Wrathion's War
        7535, -- Chapter III: Two Princes
        7536, -- Chapter IV: Celestial Blessings
        8325, -- Chapter V: Judgment of the Black Prince
        8306, -- Hordebreaker
        8307, -- Darkspear Revolutionary
    },
};

local warlordsOfDreanor = { -- Warlords of Dreanor
    223,
    addon.GetCategoryInfoTitle(15233),
    { -- Zones
        449,
        addon.L["Zones"],
        { -- Draenor
            486,
            addon.GetMapName(572),
            { -- Quests
                487,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8921, -- Welcome to Draenor
                    8922, -- Welcome to Draenor
                    9491, -- The Garrison Campaign
                    9492, -- The Garrison Campaign
                    9564, -- Securing Draenor
                    9562, -- Securing Draenor
                    9833, -- Loremaster of Draenor
                    9923, -- Loremaster of Draenor
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                488,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    9726, -- Treasure Hunter
                    9727, -- Expert Treasure Hunter
                    10348, -- Master Treasure Hunter
                    9728, -- Grand Treasure Hunter
                    9502, -- Draenor Cuisine
                    14728, -- To All the Squirrels Through Time and Space
                    8935, -- Draenor Explorer
                },
            },
            { -- Reputation
                489,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9477, -- Savage Friends
                    9478, -- Savage Friends
                },
            },
            {
                10053, -- I Found Pepe!
            },
        },
        { -- Shadowmoon Valley
            450,
            addon.GetMapName(539),
            { -- Quests
                457,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8845, -- As I Walk Through the Valley of the Shadow of Moon
                    9602, -- Shoot For the Moon
                    9528, -- On the Shadow's Trail
                    9433, -- A-VOID-ance
                    9434, -- One of Us! One of Us!
                    9432, -- Would You Like a Pamphlet?
                    9436, -- It's the Stones!
                    9435, -- Take From Them Everything
                    9437, -- A Demidos of Reality
                    9483, -- I Was Framed!
                    9479, -- You Can't Make a Giant Omelette...
                    9481, -- You Have Been Rylakinated!
                },
            },
            { -- Exploration
                458,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8938, -- Explore Shadowmoon Valley
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                460,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9470, -- Council of Exarchs
                },
            },
        },
        { -- Frostfire Ridge
            451,
            addon.GetMapName(525),
            { -- Quests
                461,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8671, -- You'll Get Caught Up In The... Frostfire!
                    9606, -- Frostfire Fridge
                    9529, -- On the Shadow's Trail
                    9533, -- Breaker of Chains
                    9530, -- Writing in the Snow
                    9531, -- Writing in the Snow
                    9534, -- Delectable Ogre Delicacies
                    9537, -- By Fire Be... Merged?
                    9536, -- Slagnarok
                    9535, -- That Was Entirely Unnecessary
                    9710, -- Poisoning the Well
                    9711, -- Planned to Fail
                },
            },
            { -- Exploration
                462,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8937, -- Explore Frostfire Ridge
                },
            },
            { -- Reputation
                464,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9471, -- Frostwolf Orcs
                },
            },
        },
        { -- Gorgrond
            452,
            addon.GetMapName(543),
            { -- Quests
                465,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8923, -- Putting the Gore in Gorgrond
                    8924, -- Putting the Gore in Gorgrond
                    9607, -- Make It a Bonus
                    9655, -- Fight the Power
                    9656, -- In Plain Sight
                    9659, -- Iron Wings
                    9678, -- Ancient No More
                    9667, -- Burn It to the Ground
                    9654, -- Mean and Green
                    9658, -- Pillars of Draenor
                    9663, -- Picky Palate
                },
            },
            { -- Exploration
                466,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8939, -- Explore Gorgrond
                    9400, -- Gorgrond Monster Hunter
                    9401, -- Shredder Maniac
                    9402, -- Prove Your Strength
                },
            },
            { -- Reputation
                468,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9475, -- Laughing Skull Orcs
                },
            },
            {
                9423, -- Goliaths of Gorgrond
            },
        },
        { -- Talador
            453,
            addon.GetMapName(535),
            { -- Quests
                469,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8920, -- Don't Let the Tala-door Hit You on the Way Out
                    8919, -- Don't Let the Tala-door Hit You on the Way Out
                    9674, -- I Want More Talador
                    9633, -- Cut off the Head
                    9638, -- Heralds of the Legion
                    9635, -- Bobbing for Orcs
                    9634, -- Charged Up
                    9636, -- United We Stand
                    9632, -- The Power Is Yours
                    9637, -- Poor Communication
                    9486, -- Goodness Gracious
                },
            },
            { -- Exploration
                470,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8940, -- Explore Talador
                },
            },
            { -- Reputation
                472,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9476, -- Sha'tari Defense
                },
            },
        },
        { -- Spires of Arak
            454,
            addon.GetMapName(542),
            { -- Quests
                473,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8925, -- Between Arak and a Hard Place
                    8926, -- Between Arak and a Hard Place
                    9605, -- Arak Star
                    9612, -- Eggs in One Basket
                    9613, -- Fish Gotta Swim, Birds Gotta Eat
                    9601, -- King of the Monsters
                    9600, -- Monster Mash
                },
            },
            { -- Exploration
                474,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8941, -- Explore Spires of Arak
                },
            },
            { -- Reputation
                476,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9469, -- Arakkoa Outcasts
                    9072, -- Mantle of the Talon King
                },
            },
            {
                9425, -- So Grossly Incandescent
            },
        },
        { -- Nagrand
            455,
            addon.GetMapName(550),
            { -- Quests
                477,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8927, -- Nagrandeur
                    8928, -- Nagrandeur
                    9615, -- With a Nagrand Cherry On Top
                    9610, -- History of Violence
                    9571, -- Broke Back Precipice
                    9548, -- Buried Treasures
                    9541, -- The Song of Silence
                    9617, -- Making the Cut
                },
            },
            { -- Exploration
                478,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8942, -- Explore Nagrand
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                480,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9472, -- Steamwheedle Preservation Society
                },
            },
        },
        { -- Tanaan Jungle
            456,
            addon.GetMapName(534),
            { -- Quests
                481,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10067, -- In Pursuit of Gul'dan
                    10074, -- In Pursuit of Gul'dan
                    10068, -- Draenor's Last Stand
                    10075, -- Draenor's Last Stand
                    10072, -- Rumble in the Jungle
                    10265, -- Rumble in the Jungle
                },
            },
            { -- Exploration
                482,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10261, -- Jungle Treasure Hunter
                    10262, -- Jungle Treasure Master
                    10260, -- Explore Tanaan Jungle
                    10069, -- I Came, I Clawed, I Conquered
                    10061, -- Hellbane
                    10259, -- Jungle Hunter
                    10070, -- Jungle Stalker
                    10334, -- Predator
                },
            },
            { -- Reputation
                484,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10349, -- Tanaan Diplomat
                    10350, -- Tanaan Diplomat
                },
            },
            {
                10071, -- The Legion Will NOT Conquer All
            },
        },
    },
    { -- Dungeons
        224,
        addon.GetCategoryInfoTitle(15272),
        { -- Bloodmaul Slag Mines
            226,
            addon.GetInstanceInfoName(385),
            {
                9005, -- Come With Me If You Want to Live
                8993, -- A Gift of Earth and Fire
                9008, -- Is Draenor on Fire?
                9037, -- Bloodmaul Slag Mines
                9046, -- Heroic: Bloodmaul Slag Mines
                10076, -- Mythic: Bloodmaul Slag Mines
                8875, -- Bloodmaul Slag Mines Challenger
                8876, -- Bloodmaul Slag Mines: Bronze
                8877, -- Bloodmaul Slag Mines: Silver
                8878, -- Bloodmaul Slag Mines: Gold
                9620, -- Challenge Master: Bloodmaul Slag Mines
            },
        },
        { -- Iron Docks
            227,
            addon.GetInstanceInfoName(558),
            {
                9081, -- Expert Timing
                9083, -- Militaristic, Expansionist
                9082, -- Take Cover!
                9038, -- Iron Docks
                9047, -- Heroic: Iron Docks
                10079, -- Mythic: Iron Docks
                8997, -- Iron Docks Challenger
                8998, -- Iron Docks: Bronze
                8999, -- Iron Docks: Silver
                9000, -- Iron Docks: Gold
                9621, -- Challenge Master: Iron Docks
                15694, -- Keystone Hero: Iron Docks
            },
        },
        { -- Auchindoun
            228,
            addon.GetInstanceInfoName(547),
            {
                9023, -- ...They All Fall Down
                9551, -- Demon's Souls
                9552, -- No Tag-backs!
                9039, -- Auchindoun
                9049, -- Heroic: Auchindoun
                10080, -- Mythic: Auchindoun
                8879, -- Auchindoun Challenger
                8880, -- Auchindoun: Bronze
                8881, -- Auchindoun: Silver
                8882, -- Auchindoun: Gold
                9622, -- Challenge Master: Auchindoun
                9924, -- Field Photographer
            },
        },
        { -- Skyreach
            229,
            addon.GetInstanceInfoName(476),
            {
                9033, -- Ready for Raiding IV
                9035, -- I Saw Solis
                9034, -- Magnify... Enhance
                9036, -- Monomania
                8843, -- Skyreach
                8844, -- Heroic: Skyreach
                10081, -- Mythic: Skyreach
                8871, -- Skyreach Challenger
                8872, -- Skyreach: Bronze
                8873, -- Skyreach: Silver
                8874, -- Skyreach: Gold
                9623, -- Challenge Master: Skyreach
            },
        },
        { -- Grimrail Depot
            230,
            addon.GetInstanceInfoName(536),
            {
                9024, -- This Is Why We Can't Have Nice Things
                9007, -- No Ticket
                9043, -- Grimrail Depot
                9052, -- Heroic: Grimrail Depot
                10082, -- Mythic: Grimrail Depot
                8887, -- Grimrail Depot Challenger
                8888, -- Grimrail Depot: Bronze
                8889, -- Grimrail Depot: Silver
                8890, -- Grimrail Depot: Gold
                9625, -- Challenge Master: Grimrail Depot
                15695, -- Keystone Hero: Grimrail Depot
            },
        },
        { -- The Everbloom
            231,
            addon.GetInstanceInfoName(556),
            {
                9017, -- Water Management
                9493, -- They Burn, Burn, Burn
                9223, -- Weed Whacker
                9044, -- The Everbloom
                9053, -- Heroic: The Everbloom
                10083, -- Mythic: The Everbloom
                9001, -- The Everbloom Challenger
                9002, -- The Everbloom: Bronze
                9003, -- The Everbloom: Silver
                9004, -- The Everbloom: Gold
                9624, -- Challenge Master: The Everbloom
                19083, -- Keystone Hero: The Everbloom
            },
        },
        { -- Shadowmoon Burial Grounds
            232,
            addon.GetInstanceInfoName(537),
            {
                9018, -- What's Your Sign?
                9025, -- Icky Ichors
                9026, -- Souls of the Lost
                9041, -- Shadowmoon Burial Grounds
                9054, -- Heroic: Shadowmoon Burial Grounds
                10084, -- Mythic: Shadowmoon Burial Grounds
                8883, -- Shadowmoon Burial Grounds Challenger
                8884, -- Shadowmoon Burial Grounds: Bronze
                8885, -- Shadowmoon Burial Grounds: Silver
                8886, -- Shadowmoon Burial Grounds: Gold
                9626, -- Challenge Master: Shadowmoon Burial Grounds
                16660, -- Keystone Hero: Shadowmoon Burial Grounds
            },
        },
        { -- Upper Blackrock Spire
            233,
            addon.GetInstanceInfoName(559),
            {
                9045, -- Magnets, How Do They Work?
                9058, -- Leeeeeeeeeeeeeroy...?
                9056, -- Bridge Over Troubled Fire
                9057, -- Dragonmaw? More Like Dragonfall!
                9042, -- Upper Blackrock Spire
                9055, -- Heroic: Upper Blackrock Spire
                10085, -- Mythic: Upper Blackrock Spire
                8891, -- Upper Blackrock Spire Challenger
                8892, -- Upper Blackrock Spire: Bronze
                8893, -- Upper Blackrock Spire: Silver
                8894, -- Upper Blackrock Spire: Gold
                9627, -- Challenge Master: Upper Blackrock Spire
            },
        },
        {
            9391, -- Draenor Dungeon Hero
            9619, -- Savage Hero
            9396, -- Glory of the Draenor Hero
            8895, -- Challenge Warlord
            8897, -- Challenge Warlord: Bronze
            8898, -- Challenge Warlord: Silver
            8899, -- Challenge Warlord: Gold
        },
    },
    { -- Raids
        225,
        addon.GetCategoryInfoTitle(15271),
        { -- Highmaul
            234,
            addon.GetInstanceInfoName(477),
            { -- Glory
                886,
                addon.L["Glory"],
                {
                    8948, -- Flame On!
                    8947, -- Hurry Up, Maggot!
                    8974, -- More Like Wrecked-us
                    8975, -- A Fungus Among Us
                    8958, -- Brothers in Arms
                    8976, -- Pair Annihilation
                    8977, -- Lineage of Power
                },
            },
            { -- Mythic
                887,
                addon.L["Mythic"],
                {
                    8949, -- Mythic: Kargath Bladefist
                    8960, -- Mythic: The Butcher
                    8961, -- Mythic: Tectus
                    8962, -- Mythic: Brackenspore
                    8963, -- Mythic: Twin Ogron
                    8964, -- Mythic: Ko'ragh
                    8965, -- Mythic: Imperator's Fall
                },
            },
            {
                8986, -- The Walled City
                8987, -- Arcane Sanctum
                8988, -- Imperator's Fall
                9441, -- Ahead of the Curve: Imperator's Fall
                9442, -- Cutting Edge: Imperator's Fall
            },
        },
        { -- Blackrock Foundry
            235,
            addon.GetInstanceInfoName(457),
            { -- Glory
                888,
                addon.L["Glory"],
                {
                    8979, -- He Shoots, He Ores
                    8978, -- The Iron Price
                    8930, -- Ya, We've Got Time...
                    8980, -- Stamp Stamp Revolution
                    8929, -- The Steel Has Been Brought
                    8983, -- Would You Give Me a Hand?
                    8981, -- Fain Would Lie Down
                    8982, -- There's Always a Bigger Train
                    8984, -- Be Quick or Be Dead
                    8952, -- Ashes, Ashes...
                },
            },
            { -- Mythic
                889,
                addon.L["Mythic"],
                {
                    8967, -- Mythic: Oregorger
                    8966, -- Mythic: Gruul
                    8970, -- Mythic: Blast Furnace
                    8968, -- Mythic: Hans'gar and Franzok
                    8932, -- Mythic: Flamebender Ka'graz
                    8971, -- Mythic: Kromog
                    8956, -- Mythic: Beastlord Darmac
                    8969, -- Mythic: Operator Thogar
                    8972, -- Mythic: Iron Maidens
                    8973, -- Mythic: Blackhand's Crucible
                },
            },
            {
                8989, -- Slagworks
                8990, -- Black Forge
                8991, -- Iron Assembly
                8992, -- Blackhand's Crucible
                9444, -- Ahead of the Curve: Blackhand's Crucible
                9443, -- Cutting Edge: Blackhand's Crucible
                11740, -- Make it W-orc W-orc
            },
        },
        { -- Hellfire Citadel
            236,
            addon.GetInstanceInfoName(669),
            { -- Glory
                890,
                addon.L["Glory"],
                {
                    10026, -- Nearly Indestructible
                    10057, -- Turning the Tide
                    10013, -- Waves Came Crashing Down All Around
                    10054, -- Don't Fear the Reaper
                    9972, -- A Race Against Slime
                    9979, -- Get In My Belly!
                    9988, -- Pro Toss
                    10086, -- I'm a Soul Man
                    9989, -- Non-Lethal Enforcer
                    10012, -- This Land Was Green and Good Until...
                    10087, -- You Gotta Keep 'em Separated
                    10030, -- Bad Manner(oth)
                    10073, -- Echoes of Doomfire
                },
            },
            { -- Mythic
                891,
                addon.L["Mythic"],
                {
                    10027, -- Mythic: Hellfire Assault
                    10032, -- Mythic: Iron Reaver
                    10033, -- Mythic: Kormrok
                    10034, -- Mythic: Hellfire High Council
                    10035, -- Mythic: Kilrogg Deadeye
                    10253, -- Mythic: Gorefiend
                    10037, -- Mythic: Shadow-Lord Iskar
                    10040, -- Mythic: Socrethar the Eternal
                    10041, -- Mythic: Tyrant Velhari
                    10038, -- Mythic: Fel Lord Zakuun
                    10039, -- Mythic: Xhul'horac
                    10042, -- Mythic: Mannoroth
                    10043, -- Mythic: Archimonde
                },
            },
            {
                10023, -- Hellbreach
                10024, -- Halls of Blood
                10025, -- Bastion of Shadows
                10020, -- Destructor's Rise
                10019, -- The Black Gate
                9680, -- Time is a Flat Circle
                10044, -- Ahead of the Curve: The Black Gate
                10045, -- Cutting Edge: The Black Gate
                11631, -- Extreme Makeover: Fel Edition
            },
        },
        {
            9619, -- Savage Hero
            8985, -- Glory of the Draenor Raider
            10149, -- Glory of the Hellfire Raider
        },
    },
    { -- Professions
        1155,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1472,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                9409, -- Draenor Archaeologist
                9413, -- Strength and Honor
                9414, -- Ogre Observer
                9415, -- Secrets of Skettis
                9410, -- Unite the Clans
                9411, -- Highmaul Historian
                9412, -- Arakkoa Archivist
                9419, -- Draenor Curator
            },
        },
        { -- Cooking
            1481,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                9500, -- Draenor Cook
                9501, -- The Draenor Gourmet
            },
        },
        { -- Engineering
            1490,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                9071, -- Inspector Gadgetzan
            },
        },
        { -- Fishing
            1496,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                9503, -- Draenor Fisherman
                9455, -- Fire Ammonite Angler
                9456, -- Abyssal Gulper Eel Angler
                9457, -- Blackwater Whiptail Angler
                9458, -- Blind Lake Sturgeon Angler
                9459, -- Fat Sleeper Angler
                9460, -- Jawless Skulker Angler
                9461, -- Sea Scorpion Angler
                9462, -- Draenor Angler
                9547, -- Everything Is Awesome!
            },
        },
        { -- Herbalism
            1501,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                9454, -- Draenic Seed Collector
            },
        },
        { -- Mining
            1515,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                9453, -- Draenic Stone Collector
            },
        },
        {
            9464, -- Professional Draenor Master
            9507, -- Working in Draenor
            9087, -- Draenor Master of All
            9505, -- Draenor Medic
            9506, -- Savage Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        548,
        addon.GetCategoryInfoTitle(15117),
        {
            9685, -- Draenor Safari
            9069, -- An Awfully Big Adventure
            9463, -- Draenic Pet Battler
            9724, -- Taming Draenor
            10052, -- Tiny Terrors in Tanaan
        },
    },
    { -- Brawler's Guild
        791,
        addon.L["Brawler's Guild"],
        {
            9168, -- You Are Not Your $#*@! Legplates (Season 2)
            9172, -- You Are Not Your $#*@! Legplates (Season 2)
            9169, -- The Second Rule of Brawler's Guild (Season 2)
            9173, -- The Second Rule of Brawler's Guild (Season 2)
            9170, -- Brawlin' and Shot Callin' (Season 2)
            9174, -- Brawlin' and Shot Callin' (Season 2)
            9171, -- Now You're Just Showing Off (Season 2)
            9175, -- Now You're Just Showing Off (Season 2)
            8339, -- Collect Your Deck (Season 2)
            8342, -- Collect Your Deck (Season 2)
            9176, -- Deck Your Collection (Season 2)
            9177, -- Deck Your Collection (Season 2)
            7949, -- Rabble Rabble Rabble (Season 2)
            7950, -- Rabble Rabble Rabble (Season 2)
            7943, -- I'm Your Number One Fan (Season 2)
            7945, -- Haters Gonna Hate (Season 2)
            7944, -- Bottle Service (Season 2)
            7947, -- The First Rule of Brawler's Guild (Season 1 or 2)
            7948, -- The First Rule of Brawler's Guild (Season 1 or 2)
        },
    },
    { -- Garrison
        432,
        addon.L["Garrison"],
        { -- Quests
            485,
            addon.GetCategoryInfoTitle(96),
            true,
            {
                9825, -- Master Relic Hunter
                9836, -- Master Relic Hunter
            },
        },
        { -- Buildings
            852,
            addon.L["Buildings"],
            { -- Stables
                854,
                addon.L["Stables"],
                true,
                {
                    9526, -- Master of Mounts
                    9539, -- Advanced Husbandry
                    9705, -- Advanced Husbandry
                    9540, -- The Stable Master
                    9706, -- The Stable Master
                },
            },
            { -- Gladiator's Sanctum
                853,
                addon.L["Gladiator's Sanctum"],
                true,
                {
                    9517, -- Nemesis: Death Stalker
                    9513, -- Nemesis: Scourge of the Kaldorei
                    9516, -- Nemesis: Slayer of Sin'dorei
                    9509, -- Nemesis: Draenei Destroyer
                    9521, -- Nemesis: The Butcher
                    9511, -- Nemesis: Gnomebane
                    9522, -- Nemesis: Troll Hunter
                    9510, -- Nemesis: Dwarfstalker
                    9519, -- Nemesis: Orcslayer
                    9512, -- Nemesis: Manslayer
                    9518, -- Nemesis: Killer of Kezan
                    9515, -- Nemesis: Worgen Hunter
                    9520, -- Nemesis: Huojin's Fall
                    9514, -- Nemesis: Terror of the Tushui
                    9639, -- Fight, Kill, Salute!
                    9508, -- Warlord of Draenor
                    9738, -- Warlord of Draenor
                },
            },
            { -- Shipyard
                856,
                addon.L["Shipyard"],
                true,
                {
                    10177, -- Set Sail!
                    10169, -- Naval Fleet
                    10168, -- Naval Armada
                    10170, -- Seaman
                    10172, -- Petty Officer
                    10255, -- Petty Officer
                    10173, -- Fleet Commander
                    10275, -- Fleet Commander
                    10174, -- Admiral
                    10276, -- Admiral
                    10156, -- Naval Combat Specialist
                    10154, -- Naval Combat Expert
                    10159, -- Naval Treasure Specialist
                    10160, -- Naval Treasure Expert
                    10161, -- Naval Siege Specialist
                    10155, -- Naval Siege Expert
                    10162, -- Naval Training Specialist
                    10163, -- Naval Training Expert
                    10017, -- Naval Bonus Specialist
                    10036, -- Naval Bonus Expert
                    10164, -- Master of the Seas
                    10165, -- Ironsides
                    10166, -- Naval Mechanics
                    10256, -- Charting a Course
                    10258, -- Charting a Course
                    10167, -- Exploring the High Seas
                    10307, -- Exploring the High Seas
                },
            },
            {
                9125, -- Draftsman
                9126, -- Master Draftsman
                9128, -- Grand Master Draftsman
                9095, -- Builder
                9096, -- Master Builder
                9097, -- Keepin' Busy
                9094, -- Garrison Architect
                9487, -- Got My Mind On My Draenor Money
                9076, -- Choppin' Some Logs
                9077, -- Choppin' Some More Logs
                9080, -- Choppin' Even More Logs
                9078, -- Choppin' Even More Logs
                9429, -- Upgrading the Mill
                9099, -- Time for an Upgrade
                9098, -- Movin' On Up
                9405, -- Working Some Orders
                9406, -- Working More Orders
                9407, -- Working Many Orders
                9450, -- The Trap Game
                9565, -- Master Trapper
                9451, -- Trapper's Delight
                9452, -- Trap Superstar
                9468, -- Salvaging Pays Off
                9495, -- The Bone Collector
                9497, -- Finding Your Waystones
                9498, -- Wingman
                9499, -- Wingmen
                9538, -- Intro to Husbandry
                9527, -- Terrific Technology
                9703, -- Stay Awhile and Listen
                9453, -- Draenic Stone Collector
                9454, -- Draenic Seed Collector
            },
        },
        { -- Invasions
            855,
            addon.L["Invasions"],
            true,
            {
                9167, -- Invasion Specialist
                9543, -- Invasion? What Invasion?
                9244, -- Invasions Are Better with Friends
                9205, -- Iron Horde Invasion
                9206, -- Shadowmoon Clan Invasion
                9203, -- Shadow Council Invasion
                9204, -- Ogre Invasion
                9207, -- Goren Invasion
                9208, -- Botani Invasion
                9162, -- Bronze Defender
                9164, -- Silver Defender
                9165, -- Golden Defender
                9826, -- Platinum Defender
                9209, -- Master Defender
                9827, -- Impervious Defender
                9181, -- Save Those Buildings!
                9858, -- Master and Commander
            },
        },
        {
            9100, -- More Plots
            9545, -- More Plots
            9101, -- Even More Plots
            9546, -- Even More Plots
            9210, -- Garrison Buddies
            9132, -- Garrison Buddies
            8933, -- Staying Regular
            9928, -- Don't Call Me Junior
            9901, -- Don't Call Me Junior
            9828, -- Ten Hit Tunes
            9897, -- Ten Hit Tunes
            9912, -- Azeroth's Top Twenty Tunes
            9914, -- Azeroth's Top Twenty Tunes
            10015, -- Full Discography
            10016, -- Full Discography
            9107, -- Follow the Leader
            9108, -- Where You Go, They Will Follow
            9109, -- Fearless Leader
            9494, -- Commander
            9110, -- Following Up
            9111, -- Raising the Bar
            9129, -- Filling the Ranks
            9130, -- A Rare Friend
            9131, -- An Epic Buddy
            9211, -- My Item Level Is Higher than Yours
            9212, -- My Item Level Is Way Higher than Yours
            9213, -- Item Level Army
            9243, -- Item Level Force
            9152, -- It's an Invasion!
            9133, -- On a Mission
            9134, -- On a Few Missions
            9138, -- On a Lot of Missions
            9139, -- On a Massive Number of Missions
            9140, -- On a Metric Ton of Missions
            9141, -- A Rare Mission
            9142, -- Keeping It Rare
            9143, -- The Rarer the Better
            9145, -- Treasure Mission Specialist
            9524, -- Treasure Master
            9146, -- Patrol Mission Specialist
            9523, -- Patrolling Draenor
            9147, -- Mission Specialist
            9150, -- Exploration Mission Specialist
            9900, -- Exploration Mission Master
            9246, -- Master Draenor Crafter
            9248, -- Defender of Draenor
            9630, -- Defender of Draenor
            9255, -- Mythic Draenor Raider
            9631, -- Mythic Draenor Raider
            9264, -- Draenor Pet Brawler
            9265, -- Master of Apexis
        },
    },
    {
        9838, -- What A Strange, Interdimensional Trip It's Been
        9640, -- Chapter I: Call of the Archmage
        9641, -- Chapter II: Gul'dan Strikes Back
        9642, -- Chapter III: The Foundry Falls
        10021, -- Chapter IV: Darkness Incarnate
        10148, -- Chapter IV: Darkness Incarnate
        10018, -- Draenor Pathfinder
    },
};

local legion = { -- Legion
    237,
    addon.GetCategoryInfoTitle(15258),
    { -- Zones
        381,
        addon.L["Zones"],
        { -- Broken Isles
            396,
            addon.GetMapName(619),
            { -- Quests
                397,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11157, -- Loremaster of Legion
                    10877, -- Pillars of Creation
                    11189, -- Variety is the Spice of Life
                    11186, -- Tehd & Marius' Excellent Adventure
                    11240, -- Harbinger
                    11544, -- Defender of the Broken Isles
                    11846, -- Champions of Legionfall
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                398,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14729, -- To All the Squirrels I Love Despite Their Scars
                    11188, -- Broken Isles Explorer
                },
            },
            { -- PvP
                413,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11474, -- Free For All, More For Me
                },
            },
            { -- Reputation
                414,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10672, -- Broken Isles Diplomat
                    11159, -- Friends in a Broken Land
                    11652, -- The Reputable
                    11653, -- Paragon of the Broken Isles
                    11941, -- Chromie Homie
                },
            },
            {
                11160, -- Unleashed Monstrosities
            },
        },
        { -- Dalaran
            382,
            addon.GetMapName(626),
            { -- Quests
                383,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12416, -- The Total Package
                    12431, -- Post Haste
                    12439, -- Priority Mail
                },
            },
            { -- Exploration
                405,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    11066, -- Underbelly Tycoon
                },
            },
            { -- Professions
                1448,
                addon.GetCategoryInfoTitle(169),
                true,
                {
                    10585, -- Fel-Smelter
                    10586, -- Mass Obliteration
                },
            },
            {
                10770, -- The Tangerine Traveler
            },
        },
        { -- Azsuna
            384,
            addon.GetMapName(630),
            { -- Quests
                385,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10763, -- Azsuna Matata
                },
            },
            { -- Exploration
                399,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10665, -- Explore Azsuna
                    11175, -- Higher Dimensional Learning
                    11256, -- Treasures of Azsuna
                    11261, -- Adventurer of Azsuna
                },
            },
            { -- PvP
                412,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11475, -- Mission Accomplished
                },
            },
        },
        { -- Val'sharah
            387,
            addon.GetMapName(641),
            { -- Quests
                391,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10698, -- That's Val'sharah Folks!
                },
            },
            { -- Exploration
                400,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10666, -- Explore Val'sharah
                    11258, -- Treasures of Val'sharah
                    11262, -- Adventurer of Val'sharah
                },
            },
            { -- PvP
                411,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11477, -- Off the Top Rook
                },
            },
        },
        { -- Highmountain
            388,
            addon.GetMapName(650),
            { -- Quests
                392,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10059, -- Ain't No Mountain High Enough
                    10774, -- Hatchling of the Talon
                    10626, -- Zoom!
                    10398, -- Drum Circle
                    11427, -- No Shellfish Endeavor
                },
            },
            { -- Exploration
                401,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10667, -- Explore Highmountain
                    11257, -- Treasures of Highmountain
                    11264, -- Adventurer of Highmountain
                },
            },
            { -- PvP
                410,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11478, -- The Darkbrul-oh
                },
            },
            { -- Reputation
                416,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12292, -- Highmountain Tribe
                },
            },
        },
        { -- Stormheim
            386,
            addon.GetMapName(634),
            { -- Quests
                390,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10790, -- Vrykul Story, Bro
                    10793, -- What a Ripoff!
                    11232, -- Lock, Stock and Two Smoking Goblins
                    11427, -- No Shellfish Endeavor
                },
            },
            { -- Exploration
                402,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10668, -- Explore Stormheim
                    10627, -- Going Up
                    11259, -- Treasures of Stormheim
                    11263, -- Adventurer of Stormheim
                    11178, -- Wake the Dragon
                },
            },
            { -- PvP
                409,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11476, -- Saddle Sore
                },
            },
        },
        { -- Suramar
            389,
            addon.GetMapName(680),
            { -- Quests
                393,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10617, -- Nightfallen But Not Forgotten
                    11124, -- Good Suramaritan
                    10756, -- Leyline Bling
                    11125, -- Now You're Thinking With Portals
                    11133, -- Why Can't I Hold All This Mana?
                    11340, -- Insurrection
                    11427, -- No Shellfish Endeavor
                },
            },
            { -- Exploration
                403,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10669, -- Explore Suramar
                    11260, -- Treasures of Suramar
                    11265, -- Adventurer of Suramar
                },
            },
            { -- Reputation
                415,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10778, -- The Nightfallen
                },
            },
        },
        { -- Broken Shore
            394,
            addon.GetMapName(646),
            { -- Quests
                395,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11607, -- They See Me Rolling
                    11546, -- Breaching the Tomb
                    11681, -- Crate Expectations
                    11731, -- A Magic Contribution
                    11732, -- A Magnificent Contribution
                    11735, -- Take Command
                    11736, -- Assume Command
                    11737, -- Disrupting the Nether
                    11738, -- It'll Nether Happen
                },
            },
            { -- Exploration
                404,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    11543, -- Explore Broken Shore
                    11802, -- Bringing Home the Beacon
                    11841, -- Naxt Victim
                },
            },
            { -- Reputation
                417,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    11545, -- Legionfall Commander
                    11796, -- Armies of Legionfall
                },
            },
            {
                11786, -- Terrors of the Shore
            },
        },
        { -- Argus
            406,
            addon.GetMapName(905),
            { -- Quests
                407,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12066, -- You Are Now Prepared!
                    12073, -- Locked and Loaded
                    18854, -- Seeing Red
                },
            },
            { -- Exploration
                408,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12074, -- Shoot First, Loot Later
                    12084, -- Infused and Abused
                    12028, -- Envision Invasion Eradication
                    12026, -- Invasion Obliteration
                    12069, -- Explore Argus
                    12077, -- Adventurer of Argus
                    12078, -- Commander of Argus
                    12083, -- Paragon of Argus
                    12101, -- We Came Here For Two Reasons
                    12102, -- To Kill Demons...
                    12103, -- ...And Chew Mana Buns
                    12104, -- And We're All Out of Mana Buns
                },
            },
            { -- Reputation
                418,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12076, -- Protector of the Argussian Reach
                    12081, -- Officer of the Light
                },
            },
        },
    },
    { -- Dungeons
        238,
        addon.GetCategoryInfoTitle(15272),
        { -- Eye of Azshara
            240,
            addon.GetInstanceInfoName(716),
            {
                10456, -- But You Say He's Just a Friend
                10457, -- Stay Salty
                10458, -- Ready for Raiding V
                10780, -- Eye of Azshara
                10781, -- Heroic: Eye of Azshara
                10782, -- Mythic: Eye of Azshara
            },
        },
        { -- Darkheart Thicket
            241,
            addon.GetInstanceInfoName(762),
            {
                10766, -- Egg-cellent!
                10769, -- Burning Down the House
                10783, -- Darkheart Thicket
                10784, -- Heroic: Darkheart Thicket
                10785, -- Mythic: Darkheart Thicket
                19085, -- Keystone Hero: Darkheart Thicket
            },
        },
        { -- Halls of Valor
            242,
            addon.GetInstanceInfoName(721),
            {
                10544, -- Stag Party
                10542, -- I Got What You Mead
                10543, -- Surge Protector
                10786, -- Halls of Valor
                10788, -- Heroic: Halls of Valor
                10789, -- Mythic: Halls of Valor
                16659, -- Keystone Hero: Halls of Valor
            },
        },
        { -- Neltharions Lair
            243,
            addon.GetInstanceInfoName(767),
            {
                10996, -- Got to Ketchum All
                10875, -- Can't Eat Just One
                10795, -- Neltharion's Lair
                10796, -- Heroic: Neltharion's Lair
                10797, -- Mythic: Neltharion's Lair
                17850, -- Keystone Hero: Neltharion's Lair
            },
        },
        { -- Assault on Violet Hold
            244,
            addon.GetInstanceInfoName(777),
            {
                10554, -- I Made a Food!
                10553, -- You're Just Making It WORSE!
                10798, -- Assault on Violet Hold
                10799, -- Heroic: Assault on Violet Hold
                10800, -- Mythic: Assault on Violet Hold
            },
        },
        { -- Vault of the Wardens
            245,
            addon.GetInstanceInfoName(707),
            {
                10679, -- I Ain't Even Cold
                10680, -- Who's Afraid of the Dark?
                10707, -- A Specter, Illuminated
                10801, -- Vault of the Wardens
                10802, -- Heroic: Vault of the Wardens
                10803, -- Mythic: Vault of the Wardens
            },
        },
        { -- Black Rook Hold
            246,
            addon.GetInstanceInfoName(740),
            {
                10710, -- Black Rook Moan
                10709, -- You Used to Scrawl Me In Your Fel Tome
                10711, -- Adds? More Like Bads
                10804, -- Black Rook Hold
                10805, -- Heroic: Black Rook Hold
                10806, -- Mythic: Black Rook Hold
                19084, -- Keystone Hero: Black Rook Hold
            },
        },
        { -- Maw of Souls
            247,
            addon.GetInstanceInfoName(727),
            {
                10413, -- Instant Karma
                10411, -- Helheim Hath No Fury
                10412, -- Poor Unfortunate Souls
                10807, -- Maw of Souls
                10808, -- Heroic: Maw of Souls
                10809, -- Mythic: Maw of Souls
            },
        },
        { -- The Arcway
            248,
            addon.GetInstanceInfoName(726),
            {
                10773, -- Arcanic Cling
                10775, -- Clean House
                10776, -- No Time to Waste
                10813, -- Mythic: The Arcway
            },
        },
        { -- Court of Stars
            249,
            addon.GetInstanceInfoName(800),
            {
                10610, -- Waiting for Gerdo
                10611, -- Dropping Some Eaves
                10816, -- Mythic: Court of Stars
                16658, -- Keystone Hero: Court of Stars
            },
        },
        { -- Return to Karazhan
            250,
            addon.GetInstanceInfoName(860),
            {
                11430, -- One Night in Karazhan
                11335, -- Season Tickets
                11338, -- Dine and Bash
                11432, -- Scared Straight
                11431, -- The Rat Pack
                11433, -- Burn After Reading
                11929, -- Heroic: Return to Karazhan
                11429, -- Mythic: Return to Karazhan
                15692, -- Keystone Hero: Return to Karazhan
            },
        },
        { -- Cathedral of Eternal Night
            251,
            addon.GetInstanceInfoName(900),
            {
                11768, -- Boom Bloom
                11769, -- A Steamy Romance Saga
                11703, -- Master of Shadows
                11700, -- Cathedral of Eternal Night
                11701, -- Heroic: Cathedral of Eternal Night
                11702, -- Mythic: Cathedral of Eternal Night
            },
        },
        { -- Seat of the Triumvirate
            252,
            addon.GetInstanceInfoName(945),
            {
                12004, -- Welcome the Void
                12005, -- Let it All Out
                12009, -- Darker Side
                12007, -- Heroic: Seat of the Triumvirate
                12008, -- Mythic: Seat of the Triumvirate
            },
        },
        {
            11164, -- Legion Dungeon Hero
            11163, -- Glory of the Legion Hero
            11181, -- Legion Keymaster
        },
    },
    { -- Raids
        239,
        addon.GetCategoryInfoTitle(15271),
        { -- The Emerald Nightmare
            253,
            addon.GetInstanceInfoName(768),
            { -- Glory
                873,
                addon.L["Glory"],
                {
                    10555, -- Buggy Fight
                    10830, -- Took the Red Eye Down
                    10771, -- Webbing Crashers
                    10753, -- Scare Bear
                    10663, -- Imagined Dragons World Tour
                    10772, -- Use the Force(s)
                    10755, -- I Attack the Darkness
                },
            },
            { -- Mythic
                874,
                addon.L["Mythic"],
                {
                    10821, -- Mythic: Nythendra
                    10823, -- Mythic: Il'gynoth
                    10822, -- Mythic: Elerethe Renferal
                    10824, -- Mythic: Ursoc
                    10825, -- Mythic: Dragons of Nightmare
                    10826, -- Mythic: Cenarius
                    10827, -- Mythic: Xavius
                },
            },
            {
                10818, -- Darkbough
                10819, -- Tormented Guardians
                10820, -- Rift of Aln
                11194, -- Ahead of the Curve: Xavius
                11191, -- Cutting Edge: Xavius
            },
        },
        { -- The Nighthold
            254,
            addon.GetInstanceInfoName(786),
            { -- Glory
                875,
                addon.L["Glory"],
                {
                    10678, -- Cage Rematch
                    10697, -- Grand Opening
                    10742, -- Gluten Free
                    10817, -- A Change In Scenery
                    10851, -- Elementalry!
                    10754, -- Fruit of All Evil
                    10575, -- Burning Bridges
                    10704, -- Not For You
                    10699, -- Infinitesimal
                    10696, -- I've Got My Eyes On You
                },
            },
            { -- Mythic
                876,
                addon.L["Mythic"],
                {
                    10840, -- Mythic: Skorpyron
                    10842, -- Mythic: Chronomatic Anomaly
                    10843, -- Mythic: Trilliax
                    10844, -- Mythic: Spellblade Aluriel
                    10845, -- Mythic: Star Augur Etraeus
                    10846, -- Mythic: High Botanist Tel'arn
                    10848, -- Mythic: Krosus
                    10847, -- Mythic: Tichondrius
                    10849, -- Mythic: Grand Magistrix Elisande
                    10850, -- Mythic: Gul'dan
                },
            },
            {
                10829, -- Arcing Aqueducts
                10837, -- Royal Athenaeum
                10838, -- Nightspire
                10839, -- Betrayer's Rise
                11195, -- Ahead of the Curve: Gul'dan
                11192, -- Cutting Edge: Gul'dan
                11628, -- That's So Last Millennium
            },
        },
        { -- Trial of Valor
            255,
            addon.GetInstanceInfoName(861),
            {
                11337, -- You Runed Everything!
                11386, -- Boneafide Tri Tip
                11377, -- Patient Zero
                11394, -- Trial of Valor
                11426, -- Heroic: Trial of Valor
                11396, -- Mythic: Odyn
                11397, -- Mythic: Guarm
                11398, -- Mythic: Helya
                11387, -- The Chosen
                11581, -- Ahead of the Curve: Helya
                11580, -- Cutting Edge: Helya
                11762, -- Can I Get A Helya
            },
        },
        { -- Tomb of Sargeras
            256,
            addon.GetInstanceInfoName(875),
            { -- Glory
                879,
                addon.L["Glory"],
                {
                    11724, -- Fel Turkey!
                    11699, -- Grand Fin-ale
                    11676, -- Five Course Seafood Buffet
                    11696, -- Grin and Bear It
                    11773, -- Wax On, Wax Off
                    11674, -- Great Soul, Great Purpose
                    11675, -- Sky Walker
                    11683, -- Bingo!
                    11770, -- Dark Souls
                },
            },
            { -- Mythic
                880,
                addon.L["Mythic"],
                {
                    11767, -- Mythic: Goroth
                    11775, -- Mythic: Harjatan
                    11776, -- Mythic: Mistress Sassz'ine
                    11774, -- Mythic: Demonic Inquisition
                    11777, -- Mythic: Sisters of the Moon
                    11778, -- Mythic: The Desolate Host
                    11779, -- Mythic: Maiden of Vigilance
                    11780, -- Mythic: Fallen Avatar
                    11781, -- Mythic: Kil'jaeden
                },
            },
            {
                11787, -- The Gates of Hell
                11788, -- Wailing Halls
                11789, -- Chamber of the Avatar
                11790, -- Deceiver's Fall
                11874, -- Ahead of the Curve: Kil'jaeden
                11875, -- Cutting Edge: Kil'jaeden
                11760, -- Retro Trend
            },
        },
        { -- Antorus, the Burning Throne
            257,
            addon.GetInstanceInfoName(946),
            { -- Glory
                881,
                addon.L["Glory"],
                {
                    11930, -- Worm-monger
                    12065, -- Hounds Good To Me
                    12129, -- This is the War Room!
                    11928, -- Portal Combat
                    12067, -- Spheres of Influence
                    11949, -- Hard to Kill
                    12030, -- The World Revolves Around Me
                    11948, -- Together We Stand
                    12046, -- Remember the Titans
                    11915, -- Don't Sweat the Technique
                    12257, -- Stardust Crusaders
                },
            },
            { -- Mythic
                882,
                addon.L["Mythic"],
                {
                    11992, -- Mythic: Garothi Worldbreaker
                    11993, -- Mythic: Hounds of Sargeras
                    11994, -- Mythic: Antoran High Command
                    11995, -- Mythic: Portal Keeper Hasabel
                    11996, -- Mythic: Eonar
                    11997, -- Mythic: Imonar the Soulhunter
                    11998, -- Mythic: Kin'garoth
                    11999, -- Mythic: Varimathras
                    12000, -- Mythic: The Coven of Shivarra
                    12001, -- Mythic: Aggramar
                    12002, -- Mythic: Argus the Unmaker
                },
            },
            {
                11988, -- Light's Breach
                11990, -- Hope's End
                11989, -- Forbidden Descent
                11991, -- Seat of the Pantheon
                12110, -- Ahead of the Curve: Argus the Unmaker
                12111, -- Cutting Edge: Argus the Unmaker
                12020, -- Argussy Up
            },
        },
        {
            11180, -- Glory of the Legion Raider
            11763, -- Glory of the Tomb Raider
            11987, -- Glory of the Argus Raider
        },
    },
    { -- Professions
        1156,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1473,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                10600, -- Legion Archaeologist
                10601, -- Surveying the Land
                10602, -- This Side Up
                10603, -- A Keen Eye
                10604, -- Legion Curator
                10605, -- Handle With Care
                10606, -- The Dwarven Dream
                10607, -- Getting Your Hands Dirty
                10608, -- Sifting Through the Sand
                10609, -- No Stone Unturned
            },
        },
        { -- Cooking
            1482,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                10589, -- Legion Cook
                10591, -- All Grown Up
                10592, -- Never A Day's Rest
                10762, -- The Legion Menu
                10593, -- Everything Tastes Better
            },
        },
        { -- Engineering
            1489,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                10588, -- The Shortest Distance
            },
        },
        { -- Fishing
            1495,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                10594, -- Legion Fisherman
                10597, -- Legion Aquaculture
                10595, -- A Cast Above the Rest
                10596, -- Bigger Fish to Fry
                10598, -- Fishing 'Round the Isles
                10722, -- The Wish Remover
                11725, -- Fisherfriend of the Isles
            },
        },
        { -- Herbalism
            1502,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18837, -- Broken Isles Herbalism Techniques
            },
        },
        { -- Jewelcrafting
            1508,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                10587, -- Hot Swapper
            },
        },
        { -- Mining
            1517,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18839, -- Broken Isles Mining Techniques
            },
        },
        { -- Skinning
            1521,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18834, -- Broken Isles Skinning Techniques
            },
        },
        {
            10582, -- Professional Legion Master
            10581, -- Working the Isles
            10583, -- Legion Master of All
            10761, -- Resourceful
            10599, -- Legion Medic
            10580, -- Heroic Skills to Pay the Bills
            11138, -- Is There a Medic in the Zone?
            11139, -- Field Medic
        },
    },
    { -- Pet Battles
        430,
        addon.GetCategoryInfoTitle(15117),
        {
            11233, -- Broken Isles Safari
            10876, -- Battle on the Broken Isles
            9686, -- Aquatic Acquiescence
            9687, -- Best of the Beasts
            9688, -- Mousing Around
            9689, -- Dragons!
            9690, -- Ragnaros, Watch and Learn
            9691, -- Flock Together
            9692, -- Murlocs, Harpies, and Wolvar, Oh My!
            9693, -- Master of Magic
            9694, -- Roboteer
            9695, -- The Lil' Necromancer
            9696, -- Family Familiar
            12088, -- Anomalous Animals of Argus
            12089, -- Aquatic Assault
            12091, -- Beast Blitz
            12092, -- Critical Critters
            12093, -- Draconic Destruction
            12094, -- Elemental Escalation
            12095, -- Fierce Fliers
            12096, -- Humanoid Havoc
            12097, -- Magical Mayhem
            12098, -- Mechanical Melee
            12099, -- Unstoppable Undead
            12100, -- Family Fighter
        },
    },
    { -- Brawler's Guild
        792,
        addon.L["Brawler's Guild"],
        {
            11560, -- You Are Not Your $#*@! Legplates (Season 3)
            11561, -- You Are Not Your $#*@! Legplates (Season 3)
            11563, -- The Second Rule of Brawler's Guild (Season 3)
            11564, -- The Second Rule of Brawler's Guild (Season 3)
            11565, -- King of the Guild (Season 3)
            11566, -- King of the Guild (Season 3)
            11572, -- I Am Thrall's Complete Lack Of Surprise (Season 3)
        },
    },
    { -- Class Hall
        429,
        addon.L["Class Hall"],
        {
            10994, -- A Glorious Campaign
            11135, -- A Heroic Campaign
            11136, -- An Epic Campaign
            10706, -- Training the Troops
            11212, -- Raise an Army
            11213, -- Lead a Legion
            11214, -- Many Missions
            11215, -- Quite a Few Missions
            11216, -- So Many Missions
            11217, -- Many Many Missions, Handle It!
            11219, -- Need Backup
            11220, -- Roster of Champions
            11221, -- Champions Rise
            11222, -- Champions of Power
            11223, -- Legendary Research
            11298, -- A Classy Outfit
            10746, -- Forged for Battle
            10459, -- Improving on History
            10743, -- The Prestige
            10745, -- The Prestige
            10460, -- Hidden Potential
            10461, -- Fighting with Style: Classic
            10747, -- Fighting with Style: Upgraded
            10748, -- Fighting with Style: Valorous
            11173, -- Fighting with Style: War-torn
            10749, -- Fighting with Style: War-torn
            10750, -- Fighting with Style: Hidden
            11171, -- Arsenal of Power
            11137, -- A Legendary Campaign
            11611, -- A Challenging Look
            11612, -- Fighting with Style: Challenging
            11144, -- Power Realized
            11772, -- Power Ascended
            11609, -- Power Unbound
            11610, -- Power Unleashed
            10852, -- Artifact or Artifiction
            10853, -- Part of History
            12071, -- Crucible's Promise
            12072, -- Now You're Cooking with Netherlight
            11218, -- There's a Boss In There
        },
    },
    {
        11190, -- Broken Isles Pathfinder, Part One
        11446, -- Broken Isles Pathfinder, Part Two
    },
};

local battleForAzeroth = { -- Battle for Azeroth
    258,
    addon.GetCategoryInfoTitle(15305),
    { -- Zones
        259,
        addon.L["Zones"],
        { -- Kul Tiras & Zandalar
            271,
            addon.GetMapName(876) .. " & " .. addon.GetMapName(875),
            { -- Quests
                272,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12582, -- Come Sail Away
                    12555, -- Welcome to Zandalar
                    12997, -- The Pride of Kul Tiras
                    12593, -- Loremaster of Kul Tiras
                    13294, -- Loremaster of Zandalar
                    12891, -- A Nation United
                    12479, -- Zandalar Forever!
                    13512, -- Master Calligrapher
                    13384, -- Kul Tirans Don't Look at Explosions
                    12510, -- Ready for War
                    12509, -- Ready for War
                    13467, -- Tides of Vengeance
                    13466, -- Tides of Vengeance
                    13925, -- The Fourth War
                    13924, -- The Fourth War
                    13517, -- Two Sides to Every Tale
                    13251, -- In Teldrassil's Shadow
                    13144, -- Wide World of Quests
                    13263, -- The Shadow Hunter
                    14157, -- The Corruptor's End
                    7520, -- The Loremaster
                    40955, -- War Stories
                },
            },
            { -- Exploration
                273,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13061, -- Three Sheets to the Wind
                    12482, -- Get Hek'd
                    13036, -- A Loa of a Tale
                    13029, -- Eating Out of the Palm of My Tiny Hand
                    13027, -- Mushroom Harvest
                    14730, -- To All the Squirrels I Set Sail to See
                    12988, -- Battle for Azeroth Explorer
                    40956, -- I'm On Island Time
                },
            },
            { -- PvP
                274,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13429, -- Azerfighter
                    12572, -- War Supplied
                    12573, -- Band of Brothers
                    12605, -- Conqueror of Azeroth
                    12604, -- Conqueror of Azeroth
                },
            },
            { -- Reputation
                275,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12947, -- Azerothian Diplomat
                    12955, -- Champions of Azeroth
                    12956, -- Tortollan Seekers
                },
            },
            {
                14183, -- Conspicuous Consumption
                12587, -- Unbound Monstrosities
            },
        },
        { -- Boralus & Dazar'alor
            1447,
            addon.GetMapName(1161) .. " & " .. addon.GetMapName(1165),
            {
                12741, -- Giving a Scrap
                13056, -- Giving a Scrap
                12738, -- Holy Scrap!
                12739, -- Scraptastic!
                12740, -- Full of Scrap!
            },
        },
        { -- Tiragarde Sound
            276,
            addon.GetMapName(895),
            { -- Quests
                281,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12473, -- A Sound Plan
                    13060, -- Kul Runnings
                    13059, -- Drag Race
                    13050, -- Bless the Rains Down in Freehold
                    13049, -- The Long Con
                    12087, -- The Reining Champion
                    13285, -- Upright Citizens
                },
            },
            { -- Exploration
                278,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12556, -- Explore Tiragarde Sound
                    12939, -- Adventurer of Tiragarde Sound
                    12852, -- Treasures of Tiragarde Sound
                    13057, -- Shanty Raid
                    13058, -- Kul Tiran Up the Dance Floor
                },
            },
            { -- PvP
                279,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12577, -- Tour of Duty: Tiragarde Sound
                },
            },
            { -- Reputation
                280,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12951, -- Proudmoore Admiralty
                    12954, -- Champion of the 7th Legion
                },
            },
            {
                41205, -- Sound Off
            },
        },
        { -- Drustvar
            282,
            addon.GetMapName(896),
            { -- Quests
                283,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12497, -- Drust Do It.
                },
            },
            { -- Exploration
                284,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12557, -- Explore Drustvar
                    12941, -- Adventurer of Drustvar
                    12995, -- Treasures of Drustvar
                    13087, -- Sausage Sampler
                    13083, -- Better, Faster, Stronger
                    13082, -- Everything Old Is New Again
                    13064, -- Drust the Facts, Ma'am
                    13094, -- Cursed Game Hunter
                },
            },
            { -- PvP
                285,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12579, -- Tour of Duty: Drustvar
                },
            },
            { -- Reputation
                286,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12952, -- Order of Embers
                },
            },
            {
                41207, -- When the Drust Settles
            },
        },
        { -- Stormsong Valley
            287,
            addon.GetMapName(942),
            { -- Quests
                288,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12496, -- Stormsong and Dance
                    13054, -- Sabertron Assemble
                    13053, -- Deadliest Cache
                    13047, -- Clever Use of Mechanical Explosives
                    13046, -- These Hills Sing
                    13045, -- Every Day I'm Truffling
                    13042, -- About To Break
                    13062, -- Let's Bee Friends
                },
            },
            { -- Exploration
                289,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12558, -- Explore Stormsong Valley
                    12940, -- Adventurer of Stormsong Valley
                    12853, -- Treasures of Stormsong Valley
                    13051, -- Legends of the Tidesages
                },
            },
            { -- PvP
                290,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12578, -- Tour of Duty: Stormsong Valley
                },
            },
            { -- Reputation
                291,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12953, -- Storm's Wake
                },
            },
            {
                41206, -- Songs of Storms
            },
        },
        { -- Zuldazar
            292,
            addon.GetMapName(862),
            { -- Quests
                293,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11861, -- The Throne of Zuldazar
                    12480, -- A Bargain of Blood
                    12481, -- The Final Seal
                    13441, -- Pushing the Payload
                    13039, -- Paku'ai
                    13048, -- Life Finds a Way... To Die!
                    13038, -- Raptari Rider
                    12719, -- Spirits Be With You
                    13020, -- Bow to Your Masters
                    12614, -- Loa Expectations
                    13030, -- How to Ptrain Your Pterrordax
                    13573, -- How to Ptrain Your Pterrordax
                    13542, -- How to Train Your Direhorn
                    13035, -- By de Power of de Loa!
                    13440, -- Pushing the Payload
                },
            },
            { -- Exploration
                294,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12559, -- Explore Zuldazar
                    12944, -- Adventurer of Zuldazar
                    12851, -- Treasures of Zuldazar
                },
            },
            { -- PvP
                295,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12575, -- Tour of Duty: Zuldazar
                    13439, -- Boxing Match
                    13438, -- Boxing Match
                },
            },
            { -- Reputation
                296,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12950, -- Zandalari Empire
                    12957, -- Champion of the Honorbound
                },
            },
            {
                41202, -- Hot Tropic
            },
        },
        { -- Nazmir
            297,
            addon.GetMapName(863),
            { -- Quests
                298,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13026, -- 7th Legion Spycatcher
                    13025, -- Zandalari Spycatcher
                    11868, -- The Dark Heart of Nazmir
                    13048, -- Life Finds a Way... To Die!
                    13023, -- It's Really Getting Out of Hand
                    13022, -- Revenge is Best Served Speedily
                    13021, -- A Most Efficient Apocalypse
                    13426, -- Come On and Slam
                },
            },
            { -- Exploration
                299,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12561, -- Explore Nazmir
                    12942, -- Adventurer of Nazmir
                    12771, -- Treasures of Nazmir
                    12588, -- Eat Your Greens
                    13024, -- Carved in Stone, Written in Blood
                    13028, -- Hoppin' Sad
                },
            },
            { -- PvP
                300,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12574, -- Tour of Duty: Nazmir
                },
            },
            { -- Reputation
                301,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12948, -- Talanji's Expedition
                },
            },
            {
                41203, -- Bwon Voyage
            },
        },
        { -- Vol'dun
            302,
            addon.GetMapName(864),
            { -- Quests
                303,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12478, -- Secrets in the Sands
                    13009, -- Adept Sandfisher
                    13011, -- Scourge of Zem'lan
                    13014, -- Vorrik's Champion
                    13041, -- Hungry, Hungry Ranishu
                    13017, -- Champion of the Vulpera
                    13437, -- Scavenge like a Vulpera
                },
            },
            { -- Exploration
                304,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12560, -- Explore Vol'dun
                    12943, -- Adventurer of Vol'dun
                    12849, -- Treasures of Vol'dun
                    13016, -- Scavenger of the Sands
                    13018, -- Dune Rider
                },
            },
            { -- PvP
                305,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12576, -- Tour of Duty: Vol'dun
                },
            },
            { -- Reputation
                306,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12949, -- The Voldunai
                },
            },
            {
                41204, -- Dune Squad
            },
        },
        { -- Mechagon Island
            307,
            addon.GetMapName(1462),
            { -- Quests
                308,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13553, -- The Mechagonian Threat
                    13700, -- The Mechagonian Threat
                    13790, -- Armed for Action
                    13791, -- Making the Mount
                },
            },
            { -- Exploration
                309,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13776, -- Explore Mechagon
                    13470, -- Rest In Pistons
                    13472, -- Deep Pockets
                    13482, -- Head Financier of Mechagon
                    13473, -- Diversified Investments
                    13474, -- Junkyard Machinist
                    13696, -- Scrappy's Best Friend
                    13686, -- Junkyard Melomaniac
                    13475, -- Junkyard Scavenger
                    13477, -- Junkyard Apprentice
                    13476, -- Junkyard Tinkerer
                    13555, -- Junkyard Tinkmaster
                    13478, -- Junkyard Collector
                    13479, -- Junkyard Architect
                    13556, -- Outside Influences
                    13513, -- Available in Eight Colors
                    13541, -- Mecha-Done
                },
            },
            { -- PvP
                310,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13570, -- Tour of Duty: Mechagon
                },
            },
            { -- Reputation
                311,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    13557, -- Rustbolt Rebellion
                },
            },
            {
                13708, -- Most Minis Wins
            },
        },
        { -- Nazjatar
            312,
            addon.GetMapName(1355),
            { -- Quests
                313,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13710, -- Sunken Ambitions
                    13709, -- Unfathomable
                },
            },
            { -- Exploration
                314,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13712, -- Explore Nazjatar
                    13635, -- Tour of the Depths
                    13690, -- Nazjatarget Eliminated
                    13691, -- I Thought You Said They'd Be Rare?
                    13692, -- Give Me the Biggest Bag You've Got
                    13743, -- Seasoned: Hunter Akana
                    13746, -- Seasoned: Neri Sharpfin
                    13753, -- Veteran: Hunter Akana
                    13749, -- Veteran: Neri Sharpfin
                    13758, -- Battle-Scarred: Hunter Akana
                    13750, -- Battle-Scarred: Neri Sharpfin
                    13744, -- Seasoned: Bladesman Inowari
                    13747, -- Seasoned: Poen Gillbrack
                    13754, -- Veteran: Bladesman Inowari
                    13751, -- Veteran: Poen Gillbrack
                    13759, -- Battle-Scarred: Bladesman Inowari
                    13756, -- Battle-Scarred: Poen Gillbrack
                    13745, -- Seasoned: Farseer Ori
                    13748, -- Seasoned: Vim Brineheart
                    13755, -- Veteran: Farseer Ori
                    13752, -- Veteran: Vim Brineheart
                    13760, -- Battle-Scarred: Farseer Ori
                    13757, -- Battle-Scarred: Vim Brineheart
                    13704, -- Nautical Battlefield Training
                    13645, -- Nautical Battlefield Training
                    13762, -- Aqua Team Murder Force
                    13761, -- Aqua Team Murder Force
                    13711, -- A Fistful of Manapearls
                    13765, -- Subaquatic Support
                    13549, -- Trove Tracker
                    13722, -- Terror of the Tadpoles
                    13699, -- Periodic Destruction
                    13713, -- Nothing To Scry About
                    13707, -- Mrrl's Secret Stash
                    13763, -- Back to the Depths!
                    13764, -- Puzzle Performer
                    13836, -- Feline Figurines Found
                    13638, -- Undersea Usurper
                },
            },
            { -- PvP
                315,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13569, -- Tour of Duty: Nazjatar
                    13568, -- For Nazjatar!
                    13720, -- Supplying the Assassins
                },
            },
            { -- Reputation
                316,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    13558, -- Waveblade Ankoan
                    13559, -- The Unshackled
                },
            },
        },
        { -- Vale of Eternal Blossoms
            317,
            addon.GetMapName(1530),
            { -- Quests
                318,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14154, -- Defend the Vale
                    14161, -- All Consuming
                },
            },
            { -- Exploration
                447,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14160, -- Rare to Well Done
                    14159, -- Combating the Corruption
                    14158, -- It's Not A Tumor!
                },
            },
            { -- Reputation
                321,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14156, -- The Rajani
                },
            },
            {
                40959, -- Black Empire State of Mind
            }
        },
        { -- Uldum
            322,
            addon.GetMapName(1527),
            { -- Quests
                323,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14153, -- Uldum Under Assault
                    14161, -- All Consuming
                },
            },
            { -- Exploration
                448,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14160, -- Rare to Well Done
                    14159, -- Combating the Corruption
                    14158, -- It's Not A Tumor!
                },
            },
            { -- Reputation
                324,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14155, -- Uldum Accord
                },
            },
            {
                40959, -- Black Empire State of Mind
            }
        },
        {
            46, -- Universal Explorer
        },
    },
    { -- Dungeons
        325,
        addon.GetCategoryInfoTitle(15272),
        { -- Freelhold
            327,
            addon.GetInstanceInfoName(1001),
            {
                12550, -- Pecking Order
                12548, -- I'm in Charge Now!
                12998, -- That Sweete Booty
                12831, -- Freehold
                12832, -- Heroic: Freehold
                12833, -- Mythic: Freehold
                17848, -- Keystone Hero: Freehold
            },
        },
        { -- Waycrest Manor
            328,
            addon.GetInstanceInfoName(1021),
            {
                12495, -- Run Wild Like a Man On Fire
                12490, -- Alchemical Romance
                12489, -- Losing My Profession
                12483, -- Waycrest Manor
                12484, -- Heroic: Waycrest Manor
                12488, -- Mythic: Waycrest Manor
                19086, -- Keystone Hero: Waycrest Manor
            },
        },
        { -- Shrine of the Storm
            329,
            addon.GetInstanceInfoName(1036),
            {
                12600, -- Breath of the Shrine
                12601, -- The Void Lies Sleeping
                12602, -- Trust No One
                12835, -- Shrine of the Storm
                12837, -- Heroic: Shrine of the Storm
                12838, -- Mythic: Shrine of the Storm
            },
        },
        { -- Atal'Dazar
            330,
            addon.GetInstanceInfoName(968),
            {
                12270, -- Bringing Hexy Back
                12272, -- Gold Fever
                12273, -- It's Lit!
                12824, -- Atal'Dazar
                12825, -- Heroic: Atal'Dazar
                12826, -- Mythic: Atal'Dazar
                19087, -- Keystone Hero: Atal'Dazar
            },
        },
        { -- The Underrot
            331,
            addon.GetInstanceInfoName(1022),
            {
                12498, -- Taint Nobody Got Time For That
                12549, -- Not a Fun Guy
                12499, -- Sporely Alive
                12500, -- Underrot
                12501, -- Heroic: Underrot
                12502, -- Mythic: Underrot
                17849, -- Keystone Hero: The Underrot
            },
        },
        { -- Temple of Sethraliss
            332,
            addon.GetInstanceInfoName(1030),
            {
                12507, -- Snake Eater
                12503, -- Snake Eyes
                12508, -- Good Night, Sweet Prince
                12504, -- The Temple of Sethraliss
                12505, -- Heroic: The Temple of Sethraliss
                12506, -- Mythic: The Temple of Sethraliss
            },
        },
        { -- Tol Dagor
            333,
            addon.GetInstanceInfoName(1002),
            {
                12457, -- Remix to Ignition
                12462, -- Shot Through the Heart
                12840, -- Tol Dagor
                12841, -- Heroic: Tol Dagor
                12842, -- Mythic: Tol Dagor
            },
        },
        { -- The MOTHERLODE!!
            334,
            addon.GetInstanceInfoName(1012),
            {
                12855, -- Pitch Invasion
                12854, -- Ready for Raiding VI
                12844, -- The MOTHERLODE!!
                12845, -- Heroic: The MOTHERLODE!!
                12846, -- Mythic: The MOTHERLODE!!
                40965, -- Keystone Hero: The MOTHERLODE!!
            },
        },
        { -- Siege of Boralus
            335,
            addon.GetInstanceInfoName(1023),
            {
                12727, -- Stand by Me
                12726, -- A Fish Out of Water
                12489, -- Losing My Profession
                12847, -- Siege of Boralus
                20587, -- Keystone Hero: Siege of Boralus
            },
        },
        { -- Kings' Rest
            336,
            addon.GetInstanceInfoName(1041),
            {
                12722, -- It Belongs in a Mausoleum!
                12721, -- Wrap God
                12723, -- How to Keep a Mummy
                12848, -- Kings' Rest
            },
        },
        { -- Operation: Mechagon
            337,
            addon.GetInstanceInfoName(1178),
            {
                13706, -- Stay Positive
                13698, -- Clean Up On Aisle Mechagon
                13723, -- M.C., Hammered
                13545, -- Go Ahead, Make My Daisy
                13624, -- Keep DPS-ing and Nobody Explodes
                13789, -- Hertz Locker
                15693, -- Keystone Hero: Operation: Mechagon
                40966, -- Keystone Hero: Operation: Mechagon - Workshop
            },
        },
        {
            12807, -- Battle for Azeroth Dungeon Hero
            12812, -- Glory of the Wartorn Hero
            13075, -- Battle for Azeroth Keymaster
            13079, -- Battle for Azeroth Keystone Conqueror: Season One
            13080, -- Battle for Azeroth Keystone Master: Season One
            13448, -- Battle for Azeroth Keystone Conqueror: Season Two
            13449, -- Battle for Azeroth Keystone Master: Season Two
            13780, -- Battle for Azeroth Keystone Conqueror: Season Three
            13781, -- Battle for Azeroth Keystone Master: Season Three
            14144, -- Battle for Azeroth Keystone Conqueror: Season Four
            14145, -- Battle for Azeroth Keystone Master: Season Four
        },
    },
    { -- Raids
        326,
        addon.GetCategoryInfoTitle(15271),
        { -- Uldir
            338,
            addon.GetInstanceInfoName(1031),
            { -- Glory
                862,
                addon.L["Glory"],
                {
                    12937, -- Elevator Music
                    12938, -- Parental Controls
                    12828, -- What's in the Box?
                    12823, -- Thrash Mouth - All Stars
                    12772, -- Now We Got Bad Blood
                    12830, -- Edgelords
                    12836, -- Existential Crisis
                    12551, -- Double Dribble
                },
            },
            { -- Mythic
                864,
                addon.L["Mythic"],
                {
                    12524, -- Mythic: Taloc
                    12526, -- Mythic: MOTHER
                    12527, -- Mythic: Zek'voz
                    12530, -- Mythic: Fetid Devourer
                    12529, -- Mythic: Vectis
                    12531, -- Mythic: Zul
                    12532, -- Mythic: Mythrax the Unraveler
                    12533, -- Mythic: G'huun
                },
            },
            {
                12521, -- Halls of Containment
                12522, -- Crimson Descent
                12523, -- Heart of Corruption
                40960, -- Uldir
                12536, -- Ahead of the Curve: G'huun
                12535, -- Cutting Edge: G'huun
                12991, -- New Mog, G'huun This?
            },
        },
        { -- Battle of Dazar'alor
            339,
            addon.GetInstanceInfoName(1176),
            { -- Glory
                865,
                addon.L["Glory"],
                {
                    13316, -- Can I Get a Hek Hek Hek Yeah?
                    13431, -- Hidden Dragon
                    13383, -- Barrel of Monkeys
                    13345, -- Praise the Sunflower
                    13325, -- Walk the Dinosaur
                    13425, -- We Got Spirit, How About You?
                    13401, -- I Got Next!
                    13430, -- De Lurker Be'loa
                    13410, -- Snow Fun Allowed
                },
            },
            { -- Mythic
                866,
                addon.L["Mythic"],
                {
                    13292, -- Mythic: Champion of the Light
                    13298, -- Mythic: Jadefire Masters
                    13293, -- Mythic: Grong
                    13295, -- Mythic: Jadefire Masters
                    13299, -- Mythic: Opulence
                    13300, -- Mythic: Conclave of the Chosen
                    13311, -- Mythic: King Rastakhan
                    13312, -- Mythic: Mekkatorque
                    13313, -- Mythic: Stormwall Blockade
                    13314, -- Mythic: Lady Jaina Proudmoore
                },
            },
            {
                13286, -- Siege of Dazar'alor
                13289, -- Defense of Dazar'alor
                13287, -- Empire's Fall
                13290, -- Death's Bargain
                13288, -- Might of the Alliance
                13291, -- Victory or Death
                40961, -- Battle of Dazar'alor
                13322, -- Ahead of the Curve: Lady Jaina Proudmoore
                13323, -- Cutting Edge: Lady Jaina Proudmoore
                13385, -- Daz'aling Attire
            },
        },
        { -- Crucible of Storms
            340,
            addon.GetInstanceInfoName(1177),
            {
                13501, -- Gotta Bounce
                13506, -- A Good Eye-dea
                13414, -- Crucible of Storms
                13416, -- Mythic: The Restless Cabal
                13417, -- Mythic: Uu'nat, Harbinger of the Void
                13418, -- Ahead of the Curve: Uu'nat, Harbinger of the Void
                13419, -- Cutting Edge: Uu'nat, Harbinger of the Void
            },
        },
        { -- The Eternal Palace
            341,
            addon.GetInstanceInfoName(1179),
            { -- Glory
                869,
                addon.L["Glory"],
                {
                    13684, -- You and What Army?
                    13628, -- Intro to Marine Biology
                    13767, -- Fun Run
                    13629, -- Simple Geometry
                    13724, -- A Smack of Jellyfish
                    13633, -- If It Pleases the Court
                    13716, -- Lactose Intolerant
                    13768, -- The Best of Us
                },
            },
            { -- Mythic
                870,
                addon.L["Mythic"],
                {
                    13726, -- Mythic: Abyssal Commander Sivara
                    13728, -- Mythic: Blackwater Behemoth
                    13727, -- Mythic: Radiance of Azshara
                    13729, -- Mythic: Lady Ashvane
                    13730, -- Mythic: Orgozoa
                    13731, -- Mythic: The Queen's Court
                    13732, -- Mythic: Za'qul
                    13733, -- Mythic: Queen Azshara
                },
            },
            {
                13718, -- The Grand Reception
                13719, -- Depths of the Devoted
                13725, -- The Circle of Stars
                40962, -- The Eternal Palace
                13784, -- Ahead of the Curve: Queen Azshara
                13785, -- Cutting Edge: Queen Azshara
                13571, -- Under the Seams
            },
        },
        { -- Ny'alotha, the Waking City
            342,
            addon.GetInstanceInfoName(1180),
            { -- Glory
                871,
                addon.L["Glory"],
                {
                    14019, -- Smoke Test
                    14008, -- Mana Sponge
                    14037, -- Phase 3: Prophet
                    14024, -- Buzzer Beater
                    14139, -- Total Annihilation
                    14023, -- Realizing Your Potential
                    13999, -- How? Isn't it Obelisk?
                    13990, -- You Can Pet the Dog, But...
                    14026, -- Temper Tantrum
                    14038, -- Bloody Mess
                    14147, -- Cleansing Treatment
                    14148, -- It's Not A Cult
                },
            },
            { -- Mythic
                872,
                addon.L["Mythic"],
                {
                    14041, -- Mythic: Wrathion, the Black Emperor
                    14043, -- Mythic: Maut
                    14044, -- Mythic: The Prophet Skitra
                    14045, -- Mythic: Dark Inquisitor Xanesh
                    14050, -- Mythic: Vexiona
                    14046, -- Mythic: The Hivemind
                    14051, -- Mythic: Ra-den the Despoiled
                    14048, -- Mythic: Shad'har the Insatiable
                    14049, -- Mythic: Drest'agath
                    14052, -- Mythic: Il'gynoth, Corruption Reborn
                    14054, -- Mythic: Carapace of N'Zoth
                    14055, -- Mythic: N'Zoth the Corruptor
                },
            },
            {
                14193, -- Vision of Destiny
                14194, -- Halls of Devotion
                14195, -- Gift of Flesh
                14196, -- The Waking Dream
                40963, -- Ny'alotha, the Waking City
                14068, -- Ahead of the Curve: N'Zoth the Corruptor
                14069, -- Cutting Edge: N'Zoth the Corruptor
                14058, -- All Eyes On Me
            },
        },
        {
            12806, -- Glory of the Uldir Raider
            13315, -- Glory of the Dazar'alor Raider
            13687, -- Glory of the Eternal Raider
            14146, -- Glory of the Ny'alotha Raider
        },
    },
    { -- Professions
        1157,
        addon.GetCategoryInfoTitle(169),
        { -- Alchemy
            1467,
            addon.GetCategoryInfoTitle(15489),
            true,
            {
                18770, -- Silas' Sphere of Transmutation
            },
        },
        { -- Archaeology
            1474,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                12760, -- Kul Tiran Archaeologist
                12761, -- Zandalari Archaeologist
                12762, -- Kul Tiran Curator
                12764, -- Zandalari Curator
                12765, -- Exotic Discoveries
                12769, -- Light Travel
                12770, -- Lengthy Legwork
            },
        },
        { -- Blacksmithing
            1475,
            addon.GetCategoryInfoTitle(15490),
            true,
            {
                18771, -- Khaz'gorian Smithing Hammer
            },
        },
        { -- Cooking
            1483,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                12742, -- Kul Tiran Cook
                12743, -- Zandalari Cook
                12744, -- The Kul Tiran Menu
                12746, -- The Zandalari Menu
                12747, -- Catering for Combat
            },
        },
        { -- Enchanting
            1486,
            addon.GetCategoryInfoTitle(15491),
            true,
            {
                18775, -- Iwen's Enchanting Rod
            },
        },
        { -- Engineering
            1488,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                18776, -- The Ub3r-Spanner
            },
        },
        { -- Fishing
            1494,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                12753, -- Kul Tiran Fisherman
                12754, -- Zandalari Fisherman
                12757, -- Angling for Battle
                12755, -- Scent of the Sea
                12756, -- Fish Me In the Moonlight
                12758, -- Baiting the Enemy
                12759, -- Baiting the Enemy
                12990, -- Catchin' Some Rays
                13489, -- Secret Fish of Mechagon
            },
        },
        { -- Herbalism
            1503,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18838, -- Fourth War Herbalism Techniques
            },
        },
        { -- Inscription
            1505,
            addon.GetCategoryInfoTitle(15493),
            true,
            {
                18772, -- Sanguine Feather Quill of Lana'thel
            },
        },
        { -- Jewelcrafting
            1507,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                18773, -- Jewelhammer's Focus
            },
        },
        { -- Leatherworking
            1511,
            addon.GetCategoryInfoTitle(15495),
            true,
            {
                18777, -- Mallet of Thunderous Skins
            },
        },
        { -- Mining
            1518,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18840, -- Fourth War Mining Techniques
            },
        },
        { -- Skinning
            1522,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18835, -- Fourth War Skinning Techniques
            },
        },
        { -- Tailoring
            1525,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                18774, -- Synchronous Thread
                18896, -- United as Three
            },
        },
        {
            12731, -- Professional Kul Tiran Master
            12733, -- Professional Zandalari Master
            12734, -- Working in Kul Tiras
            12735, -- Working in Zandalar
            12736, -- Kul Tiran Master of All
            12737, -- Zandalari Master of All
            13516, -- Massive Tool
            18778, -- Massive Toolshed
        },
    },
    { -- Pet Battles
        343,
        addon.GetCategoryInfoTitle(15117),
        {
            12930, -- Battle Safari
            13693, -- Mecha-Safari
            13694, -- Nazjatari Safari
            13715, -- From The Belly Of The Jelly
            12936, -- Battle on Zandalar and Kul Tiras
            13280, -- Hobbyist Aquarist
            13270, -- Beast Mode
            13271, -- Critters With Huge Teeth
            13272, -- Dragons Make Everything Better
            13273, -- Element of Success
            13274, -- Fun With Flying
            13281, -- Human Resources
            13275, -- Magician's Secrets
            13277, -- Machine Learning
            13278, -- Not Quite Dead Yet
            13279, -- Family Battler
            13625, -- Mighty Minions of Mechagon
            13626, -- Nautical Nuisances of Nazjatar
            13695, -- Team Aquashock
        },
    },
    { -- Brawler's Guild
        793,
        addon.L["Brawler's Guild"],
        {
            11558, -- The First Rule of Brawler's Guild
            11559, -- The First Rule of Brawler's Guild
            13186, -- You Are Not Your $#*@! Legplates
            13188, -- You Are Not Your $#*@! Legplates
            13189, -- The Second Rule of Brawler's Guild
            13190, -- The Second Rule of Brawler's Guild
            13191, -- Brawler for Azeroth
            13192, -- Brawler for Azeroth
            11567, -- You Are Not The Contents Of Your Wallet
            11570, -- Educated Guesser
            13194, -- I Am Thrall's Complete Lack Of Surprise
            11573, -- Rumble Club
        },
    },
    { -- Dueler's Guild
        851,
        addon.L["Dueler's Guild"],
        {
            12856, -- The First Rule of Dueler's Guild
            12857, -- Trial by Combat
            12858, -- Slugfest
            12860, -- Contender
            12863, -- Dueling Master
            12859, -- Prize Fighter
            12861, -- Master of Duels
            12862, -- Thirty Six and Two
            13623, -- Fighting on Two Fronts
        },
    },
    { -- Island Expeditions
        425,
        addon.GetCategoryInfoTitle(15307),
        { -- Un'gol Ruins
            436,
            (addon.GetLFGDungeonInfo(1687)),
            {
                12590, -- Un'gol Ruins
                12589, -- Heroic: Un'gol Ruins
                12591, -- Mythic: Un'gol Ruins
                12592, -- Ruined the Ruins
            },
        },
        { -- The Dread Chain
            437,
            (addon.GetLFGDungeonInfo(1734)),
            {
                13095, -- Dread Chain
                13096, -- Heroic: Dread Chain
                13097, -- Mythic: Dread Chain
                13098, -- Bane of the Chain
            },
        },
        { -- The Rotting Mire
            438,
            (addon.GetLFGDungeonInfo(1723)),
            {
                13103, -- Rotting Mire
                13104, -- Heroic: Rotting Mire
                13105, -- Mythic: Rotting Mire
                13106, -- Mire Marauder
            },
        },
        { -- The Molten Cay
            439,
            (addon.GetLFGDungeonInfo(1750)),
            {
                13099, -- Molten Cay
                13100, -- Heroic: Molten Cay
                13101, -- Mythic: Molten Cay
                13102, -- Clash at the Cay
            },
        },
        { -- Verdant Wilds
            440,
            (addon.GetLFGDungeonInfo(1724)),
            {
                13111, -- Verdant Wilds
                13112, -- Heroic: Verdant Wilds
                13113, -- Mythic: Verdant Wilds
                13114, -- War for the Wilds
            },
        },
        { -- Skittering Hollow
            441,
            (addon.GetLFGDungeonInfo(1725)),
            {
                13107, -- Skittering Hollow
                13108, -- Heroic: Skittering Hollow
                13109, -- Mythic: Skittering Hollow
                13110, -- Skittering Smashed
            },
        },
        { -- The Whispering Reef
            442,
            (addon.GetLFGDungeonInfo(1735)),
            {
                13119, -- Whispering Reef
                13118, -- Heroic: Whispering Reef
                13116, -- Mythic: Whispering Reef
                13115, -- Reef Madness
            },
        },
        { -- Jorundall
            443,
            (addon.GetLFGDungeonInfo(1932)),
            {
                13389, -- Jorundall
                13394, -- Heroic: Jorundall
                13395, -- Mythic: Jorundall
                13399, -- Jorundall Justice
            },
        },
        { -- Havenswood
            444,
            (addon.GetLFGDungeonInfo(1928)),
            {
                13396, -- Havenswood
                13397, -- Heroic: Havenswood
                13398, -- Mythic: Havenswood
                13400, -- Havenswood Hero
            },
        },
        { -- Crestfall
            445,
            (addon.GetLFGDungeonInfo(1984)),
            {
                13577, -- Crestfall
                13578, -- Heroic: Crestfall
                13579, -- Mythic: Crestfall
                13580, -- Crestfallen
            },
        },
        { -- Snowblossom Village
            446,
            (addon.GetLFGDungeonInfo(1983)),
            {
                13581, -- Snowblossom Village
                13582, -- Heroic: Snowblossom Village
                13583, -- Mythic: Snowblossom Village
                13584, -- Snowblossom Scrapper
            },
        },
        {
            13142, -- Archipelago Explorer
            13122, -- Island Conqueror
            13141, -- Island Slayer
            12596, -- No Tourist
            12594, -- Competent Captain
            12595, -- Expert Expeditioner
            12597, -- Bayside Brawler
            13120, -- Blood in the Water
            13121, -- Notorious
            13129, -- Sucker Punch
            13123, -- My Dubs
            13124, -- Metal Detector
            13125, -- Azerite Admiral
            13126, -- Give Me The Energy
            13127, -- Tell Me A Tale
            13128, -- I'm Here for the Pets
            13132, -- Helping Hand
            13133, -- Team Deathmatch
            13135, -- Team Deathmatch
            13134, -- Expedition Leader
            13701, -- Battlefield Brawler
            13702, -- Battlefield Tactician
            13703, -- Battlefield Master
        },
    },
    { -- War Effort
        426,
        addon.GetCategoryInfoTitle(15308),
        { -- Battle for Stromgarde
            434,
            (addon.GetLFGDungeonInfo(1615)),
            {
                12881, -- War is Hell
                12873, -- War is Hell
                13737, -- Heroic: War is Hell
                13735, -- Heroic: War is Hell
                12888, -- Strike Hard
                12877, -- Strike Hard
                12889, -- Strike Fast
                12876, -- Strike Fast
                12884, -- Leader of Troops
                12878, -- Leader of Troops
                12886, -- Tour of War
                12879, -- Tour of War
                13739, -- Heroic: Tour of War
                13738, -- Heroic: Tour of War
                12874, -- An Eventful Battle
            },
        },
        { -- The Battle for Darkshore
            435,
            (addon.GetLFGDungeonInfo(1901)),
            {
                13297, -- War for the Shore
                13296, -- War for the Shore
                14150, -- Heroic: War for the Shore
                14149, -- Heroic: War for the Shore
                13302, -- Under Cover of Darkness
                13301, -- Under Cover of Darkness
                13305, -- Night Moves
                13306, -- Night Moves
                13308, -- Recruitment Officer
                13307, -- Recruitment Officer
                13310, -- By Nature's Call
                13309, -- Deforester
            },
        },
        {
            12867, -- Azeroth at War: The Barrens
            12896, -- Azeroth at War: The Barrens
            12869, -- Azeroth at War: After Lordaeron
            12898, -- Azeroth at War: After Lordaeron
            12870, -- Azeroth at War: Kalimdor on Fire
            12899, -- Azeroth at War: Kalimdor on Fire
            12872, -- The Dirty Five
            40957, -- Maximum Effort
        },
    },
    { -- Heart of Azeroth
        427,
        addon.GetCategoryInfoTitle(15417),
        {
            12918, -- Have a Heart
            13998, -- Pure of Heart
            13572, -- The Heart Forge
            13769, -- Power Up
            13770, -- Power Creep
            13771, -- Power Is Beautiful
            13772, -- Essence Essentials
            13773, -- Essence Gains
            13775, -- Essence Overload
            13777, -- My Heart Container is Full
            13779, -- Phenomenal Cosmic Power
            40958, -- Full Heart, Can't Lose
        },
    },
    { -- Visions of N'Zoth
        428,
        addon.GetCategoryInfoTitle(15426),
        {
            14143, -- Reeking of Visions
            13994, -- Through the Depths of Visions
            14060, -- Unwavering Resolve
            14061, -- We Have the Technology
            14062, -- Horrific Vision of Stormwind
            14064, -- The Even More Horrific Vision of Stormwind
            14066, -- The Most Horrific Vision of Stormwind
            14063, -- Horrific Vision of Orgrimmar
            14065, -- The Even More Horrific Vision of Orgrimmar
            14067, -- The Most Horrific Vision of Orgrimmar
            14162, -- Horrific Masquerade
            14165, -- Masked Soliloquy
            14166, -- Masked Duet
            14167, -- Masked Trio
            14168, -- Masked Quartet
            14169, -- Symphony of Masks
            14170, -- Thanks For The Mementos
            14171, -- Memento Mori
            14172, -- A Monumental Amount of Mementos
            14173, -- A Mountain of Mementos
            14140, -- Mad World
        },
    },
    {
        12989, -- Battle for Azeroth Pathfinder, Part One
        13250, -- Battle for Azeroth Pathfinder, Part Two
        40953, -- A Farewell to Arms
        41209, -- Dressed to Kill: Battle for Azeroth
    },
};

local shadowlands = { -- Shadowlands
    6,
    addon.GetCategoryInfoTitle(15439),
    { -- Zones
        344,
        addon.L["Zones"],
        { -- Bastion
            345,
            addon.GetMapName(1533),
            { -- Quests
                346,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14281, -- The Path to Ascension
                    14801, -- Sojourner of Bastion
                    14737, -- What Bastion Remembered
                    14735, -- Flight School Graduate
                    14741, -- Aerial Ace
                    14762, -- Breaking the Stratus Fear
                },
            },
            { -- Exploration
                347,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14303, -- Explore Bastion
                    14307, -- Adventurer of Bastion
                    14311, -- Treasures of Bastion
                    14339, -- Shard Labor
                    14734, -- Rallying Cry of the Ascended
                    14767, -- Count Your Blessings
                    14768, -- What is that Melody?
                    14733, -- In the Hot Seat
                },
            },
            { -- PvP
                348,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14514, -- Tour of Duty: Bastion
                },
            },
            { -- Reputation
                349,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14335, -- The Ascended
                },
            },
        },
        { -- Maldraxxus
            350,
            addon.GetMapName(1536),
            { -- Quests
                351,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14206, -- Blade of the Primus
                    14799, -- Sojourner of Maldraxxus
                },
            },
            { -- Exploration
                352,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14305, -- Explore Maldraxxus
                    14308, -- Adventurer of Maldraxxus
                    14312, -- Treasures of Maldraxxus
                    14626, -- Harvester of Sorrow
                    14802, -- Bloodsport
                    14721, -- It's In The Mix
                    14634, -- Nine Afterlives
                },
            },
            { -- PvP
                353,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14513, -- Tour of Duty: Maldraxxus
                },
            },
            { -- Reputation
                354,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14336, -- Undying Army
                },
            },
        },
        { -- Ardenweald
            355,
            addon.GetMapName(1565),
            { -- Quests
                356,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14164, -- Awaken, Ardenweald
                    14800, -- Sojourner of Ardenweald
                    14671, -- Something's Not Quite Right....
                    14672, -- A Bit of This, A Bit of That
                },
            },
            { -- Exploration
                357,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14304, -- Explore Ardenweald
                    14309, -- Adventurer of Ardenweald
                    14313, -- Treasures of Ardenweald
                    14353, -- Ardenweald's a Stage
                    14791, -- Toss a Seed to Your Hunter...
                    14774, -- Ardenweald Gourmand
                    14788, -- Fractured Faerie Tales
                    14779, -- Wild Hunting
                    14504, -- Niya, As Xavius
                    14505, -- Senthii, As Gul'dan
                    14506, -- Glimmerdust, As Kil'jaeden
                    14507, -- Mi'kai, As Argus
                    14508, -- Glimmerdust, As Jaina
                    14509, -- Astra, As Azshara
                    14510, -- Dreamweaver, As N'Zoth
                },
            },
            { -- PvP
                358,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14511, -- Tour of Duty: Ardenweald
                },
            },
            { -- Reputation
                359,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14337, -- The Wild Hunt
                },
            },
        },
        { -- Revendreth
            360,
            addon.GetMapName(1525),
            { -- Quests
                361,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13878, -- The Master of Revendreth
                    14798, -- Sojourner of Revendreth
                    14233, -- Tea Tales
                    14765, -- Ramparts Racer
                    14766, -- Parasoling
                    14772, -- Caught in a Bat Romance
                },
            },
            { -- Exploration
                362,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14306, -- Explore Revendreth
                    14310, -- Adventurer of Revendreth
                    14314, -- Treasures of Revendreth
                    14277, -- The Accuser's Avowed
                    14274, -- Absolution for All
                    14272, -- Best Bud With Benefits
                    14276, -- It's Always Sinny in Revendreth
                    14769, -- Bat!
                    14771, -- The Afterlife Express
                    14770, -- What We Ride in the Shadows
                    14273, -- Crypt Kicker
                },
            },
            { -- PvP
                363,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14512, -- Tour of Duty: Revendreth
                },
            },
            { -- Reputation
                364,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14338, -- Court of Harvesters
                },
            },
        },
        { -- The Maw
            365,
            addon.GetMapName(1543),
            { -- Quests
                366,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14334, -- Into the Maw
                    14961, -- Chains of Domination
                    15000, -- United Front
                    15001, -- Jailer's Personal Stash
                    15037, -- This Army
                    15039, -- Up For Grabs
                    15041, -- The Zovaal Shuffle
                    15043, -- Hoarder of Torghast
                    15042, -- Tea for the Troubled
                    15044, -- Krrprripripkraak's Heroes
                    15035, -- On the Offensive
                    15036, -- Rooting Out the Evil
                    15034, -- Wings Against the Flames
                    15033, -- Taking the Tremaculum
                    15032, -- Breaking Their Hold
                },
            },
            { -- Exploration
                367,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14663, -- Explore The Maw
                    14658, -- Soulkeeper's Burden
                    14659, -- Handling His Henchmen
                    14660, -- It's About Sending a Message
                    14738, -- Hunting Party
                    14742, -- Who Sent You?
                    14743, -- Deadly Serious
                    14744, -- Better to Be Lucky Than Dead
                    14745, -- Grand Theft Shadehound
                    14746, -- Prepare for Trouble!
                    14747, -- Make it Double!
                    14761, -- Deciphering Death's Intentions
                    14894, -- To 'Ghast, Two Curios
                    14895, -- 'Ghast Five
                    15054, -- Minions of the Cold Dark
                    15107, -- Conquering Korthia
                    14943, -- Guarmageddon
                },
            },
            { -- Reputation
                368,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14656, -- Trading Partners
                },
            },
            {
                15648, -- Walking in Maw-mphis
            },
        },
        { -- Korthia
            812,
            addon.GetMapName(1961),
            { -- Quests
                817,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15066, -- Reliquary Restoration
                    15055, -- Friend of Ooz
                    15056, -- Friend of Bloop
                    15057, -- Friend of Plaguey
                },
            },
            { -- Exploration
                818,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    15053, -- Explore Korthia
                    15107, -- Conquering Korthia
                    15099, -- Treasures of Korthia
                },
            },
            { -- Reputation
                813,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    15059, -- Death's Advance
                    15069, -- The Archivists' Codex
                },
            },
        },
        { -- Zereth Mortis
            1035,
            addon.GetMapName(1970),
            { -- Quests
                1036,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15229, -- Traversing the Spheres
                    15336, -- From A to Zereth
                    15259, -- Secrets of the First Ones
                    15515, -- Path to Enlightenment
                    15518, -- A Means to an End
                },
            },
            { -- Exploration
                1037,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    15224, -- Explore Zereth Mortis
                    15391, -- Adventurer of Zereth Mortis
                    15392, -- Dune Dominance
                    15331, -- Treasures of Zereth Mortis
                    15211, -- Completing the Code
                    15402, -- Cyphers of the First Ones
                    15502, -- Sand, Sand Everywhere!
                    15406, -- Synthesized!
                    15407, -- Synthe-fived!
                    15410, -- Synthe-superfived!
                    15411, -- Synthe-supersized!
                    15508, -- Fashion of the First Ones
                    15404, -- Cosmic Empowerment
                    15509, -- Tales of the Exile
                    15512, -- Adventures in Zereth Mortis
                    15513, -- Curious Collections
                    15514, -- Unlocking the Secrets
                    15542, -- Apocopocolypse Now
                },
            },
            { -- Reputation
                1038,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    15220, -- The Enlightened
                },
            },
        },
        {
            14280, -- Loremaster of Shadowlands
            14758, -- The World Beyond
            15388, -- Shadowlands Explorer
            14825, -- Shadowlands Voyager
            14731, -- To All the Squirrels I've Loved and Lost
            14515, -- Zo'Sorg's Bidding
            14516, -- Impressing Zo'Sorg
            14519, -- Covenant Combat
            14315, -- Shadowlands Diplomat
            15064, -- Breaking the Chains
            7520, -- The Loremaster
        },
    },
    { -- Dungeons
        369,
        addon.GetCategoryInfoTitle(15272),
        { -- The Necrotic Wake
            371,
            addon.GetInstanceInfoName(1182),
            {
                14295, -- Bountiful Harvest
                14320, -- Surgeon's Supplies
                14285, -- Ready for Raiding VII
                14366, -- The Necrotic Wake
                14367, -- Heroic: The Necrotic Wake
                14368, -- Mythic: The Necrotic Wake
                15045, -- Keystone Hero: The Necrotic Wake
            },
        },
        { -- Plaguefall
            372,
            addon.GetInstanceInfoName(1183),
            {
                14292, -- Riding with my Slimes
                14347, -- Full Gores Meal
                14296, -- Going Viral
                14369, -- Plaguefall
                14414, -- Heroic: Plaguefall
                14415, -- Mythic: Plaguefall
                15046, -- Keystone Hero: Plaguefall
            },
        },
        { -- Mists of Tirna Scithe
            373,
            addon.GetInstanceInfoName(1184),
            {
                14503, -- Hooked On Hydroponics
                14291, -- Someone Could Trip on These!
                14375, -- Hunger for Knowledge
                14371, -- Mists of Tirna Scithe
                14412, -- Heroic: Mists of Tirna Scithe
                14413, -- Mythic: Mists of Tirna Scithe
                15047, -- Keystone Hero: Mists of Tirna Scithe
            },
        },
        { -- Halls of Atonement
            374,
            addon.GetInstanceInfoName(1185),
            {
                14567, -- Picking Up the Pieces
                14284, -- Breaking Bad
                14352, -- Nobody Puts Denathrius in a Corner
                14370, -- Halls of Atonement
                14410, -- Heroic: Halls of Atonement
                14411, -- Mythic: Halls of Atonement
                15048, -- Keystone Hero: Halls of Atonement
            },
        },
        { -- Spires of Ascension
            375,
            addon.GetInstanceInfoName(1186),
            {
                14331, -- Goliath Offline
                14323, -- ExSPEARiential
                14327, -- I Can See My House From Here
                14326, -- Spires of Ascension
                14324, -- Heroic: Spires of Ascension
                14325, -- Mythic: Spires of Ascension
                15049, -- Keystone Hero: Spires of Ascension
            },
        },
        { -- Theater of Pain
            376,
            addon.GetInstanceInfoName(1187),
            {
                14297, -- Three Choose One
                14607, -- Fresh Meat!
                14533, -- Royal Rumble
                14372, -- Theater of Pain
                14416, -- Heroic: Theater of Pain
                14417, -- Mythic: Theater of Pain
                15050, -- Keystone Hero: Theater of Pain
            },
        },
        { -- De Other Side
            377,
            addon.GetInstanceInfoName(1188),
            {
                14354, -- Highly Communicable
                14374, -- Couple's Therapy
                14606, -- Thinking with...
                14373, -- De Other Side
                14408, -- Heroic: De Other Side
                14409, -- Mythic: De Other Side
                15051, -- Keystone Hero: De Other Side
            },
        },
        { -- Sanguine Depths
            378,
            addon.GetInstanceInfoName(1189),
            {
                14286, -- Residue Evil
                14290, -- I Only Have Eyes For You
                14289, -- Kaal-ed Shot
                14197, -- Sanguine Depths
                14198, -- Heroic: Sanguine Depths
                14199, -- Mythic: Sanguine Depths
                15052, -- Keystone Hero: Sanguine Depths
            },
        },
        { -- Tazavesh, the Veiled Market
            823,
            addon.GetInstanceInfoName(1194),
            {
                15109, -- Will it Blend?
                15106, -- Quality Control
                15179, -- This is Fine
                15190, -- Mischief!
                15178, -- Fake It 'Til You Make It
                15177, -- Tazavesh, the Veiled Market
                15650, -- Mythic: Streets of Wonder
                15652, -- Mythic: So'leah's Gambit
                15500, -- Keystone Hero: Tazavesh, the Veiled Market
            },
        },
        {
            14418, -- Shadowlands Dungeon Hero
            15651, -- Myths of the Shadowlands Dungeons
            14322, -- Glory of the Shadowlands Hero
            11183, -- Keystone Initiate
            11184, -- Keystone Challenger
            11185, -- Keystone Conqueror
            11162, -- Keystone Master
            14938, -- Shadowlands Keystone Explorer: Season One
            14531, -- Shadowlands Keystone Conqueror: Season One
            14532, -- Shadowlands Keystone Master: Season One
            15073, -- Shadowlands Keystone Explorer: Season Two
            15077, -- Shadowlands Keystone Conqueror: Season Two
            15078, -- Shadowlands Keystone Master: Season Two
            15327, -- Tormented Hero: Shadowlands Season 2
            15496, -- Shadowlands Keystone Explorer: Season Three
            15498, -- Shadowlands Keystone Conqueror: Season Three
            15499, -- Shadowlands Keystone Master: Season Three
            15506, -- Shadowlands Keystone Hero: Season Three
            15691, -- Cryptic Hero: Shadowlands Season 3
            15688, -- Shadowlands Keystone Explorer: Season Four
            15689, -- Shadowlands Keystone Conqueror: Season Four
            15690, -- Shadowlands Keystone Master: Season Four
            15756, -- Shrouded Hero: Shadowlands Season 4
        },
    },
    { -- Raids
        370,
        addon.GetCategoryInfoTitle(15271),
        { -- Castle Nathria
            379,
            addon.GetInstanceInfoName(1190),
            { -- Glory
                860,
                addon.L["Glory"],
                {
                    14293, -- Blind as a Bat
                    14523, -- Taking Care of Business
                    14376, -- Feed the Beast
                    14524, -- I Don't Know What I Expected
                    14617, -- Private Stock
                    14608, -- Burning Bright
                    14619, -- Pour Decision Making
                    14294, -- Dirtflap's Revenge
                    14525, -- Feed Me, Seymour!
                    14610, -- Clear Conscience
                },
            },
            { -- Mythic
                861,
                addon.L["Mythic"],
                {
                    14356, -- Mythic: Shriekwing
                    14357, -- Mythic: Huntsman Altimor
                    14358, -- Mythic: Hungering Destroyer
                    14361, -- Mythic: Lady Inerva Darkvein
                    14359, -- Mythic: Artificer Xy'mox
                    14360, -- Mythic: Sun King's Salvation
                    14362, -- Mythic: The Council of Blood
                    14363, -- Mythic: Sludgefist
                    14364, -- Mythic: Stone Legion Generals
                    14365, -- Mythic: Sire Denathrius
                },
            },
            {
                14715, -- Castle Nathria
                14717, -- Heroic: Castle Nathria
                14718, -- Mythic: Castle Nathria
                14460, -- Ahead of the Curve: Sire Denathrius
                14461, -- Cutting Edge: Sire Denathrius
                14614, -- Castle Vain
                15663, -- Fate of Nathria
                15664, -- Heroic: Fate of Nathria
                15665, -- Mythic: Fate of Nathria
            },
        },
        { -- Sanctum of Domination
            821,
            addon.GetInstanceInfoName(1193),
            { -- Glory
                858,
                addon.L["Glory"],
                {
                    14998, -- Name A Better Duo, I'll Wait
                    15065, -- Eye Wish You Were Here
                    15003, -- To the Nines
                    15058, -- I Used to Bullseye Deeprun Rats Back Home
                    15105, -- Tormentor's Tango
                    15131, -- Whack-A-Soul
                    15132, -- Knowledge is Power
                    15040, -- Flawless Fate
                    15108, -- Together Forever
                    15133, -- This World is a Prism
                },
            },
            { -- Mythic
                859,
                addon.L["Mythic"],
                {
                    15112, -- Mythic: The Tarragrue
                    15113, -- Mythic: The Eye of the Jailer
                    15114, -- Mythic: The Nine
                    15115, -- Mythic: Remnant of Ner'zhul
                    15116, -- Mythic: Soulrender Dormazain
                    15117, -- Mythic: Painsmith Raznal
                    15118, -- Mythic: Guardian of the First Ones
                    15119, -- Mythic: Fatescribe Roh-Kalo
                    15120, -- Mythic: Kel'Thuzad
                    15121, -- Mythic: Sylvanas Windrunner
                },
            },
            {
                15122, -- The Jailer's Vanguard
                15123, -- The Dark Bastille
                15124, -- Shackles of Fate
                15125, -- The Reckoning
                15126, -- Sanctum of Domination
                15127, -- Heroic: Sanctum of Domination
                15128, -- Mythic: Sanctum of Domination
                15134, -- Ahead of the Curve: Sylvanas Windrunner
                15135, -- Cutting Edge: Sylvanas Windrunner
                15110, -- Dominating the Catwalk
                15191, -- Rae'shalare, Death's Whisper
                15667, -- Fate of Domination
                15668, -- Heroic: Fate of Domination
                15669, -- Mythic: Fate of Domination
            },
        },
        { -- Sepulcher of the First Ones
            1040,
            addon.GetInstanceInfoName(1195),
            { -- Glory
                1041,
                addon.L["Glory"],
                {
                    15381, -- Power ON
                    15401, -- Wisdom Comes From the Desert
                    15398, -- Xy Never, Ever Marks the Spot.
                    15397, -- Four Ring Circus
                    15400, -- Where the Wild Corgis Are
                    15419, -- The Protoform Matrix
                    15386, -- Shimmering Secrets
                    15399, -- Coming to Terms
                    15315, -- Amidst Ourselves
                    15396, -- We Are All Made of Stars
                    15494, -- Damnation Aviation
                },
            },
            { -- Mythic
                1042,
                addon.L["Mythic"],
                {
                    15479, -- Mythic: Vigilant Guardian
                    15480, -- Mythic: Skolex
                    15481, -- Mythic: Artificer Xy'mox
                    15482, -- Mythic: Dausegne
                    15483, -- Mythic: Prototype Pantheon
                    15484, -- Mythic: Lihuvim
                    15485, -- Mythic: Halondrus
                    15486, -- Mythic: Anduin Wrynn
                    15487, -- Mythic: Lords of Dread
                    15488, -- Mythic: Rygelon
                    15489, -- Mythic: The Jailer
                },
            },
            {
                15492, -- Cornerstone of Creation
                15493, -- Ephemeral Plains
                15416, -- Domination's Grasp
                15418, -- The Grand Design
                15417, -- Sepulcher of the First Ones
                15478, -- Heroic: Sepulcher of the First Ones
                15490, -- Mythic: Sepulcher of the First Ones
                15396, -- We Are All Made of Stars
                15468, -- We Are All Made of Stars (Heroic)
                15469, -- We Are All Made of Stars (Mythic)
                15470, -- Ahead of the Curve: The Jailer
                15471, -- Cutting Edge: The Jailer
                15409, -- First Wonders
                15681, -- Fate of the Sepulcher
                15682, -- Heroic: Fate of the Sepulcher
                15683, -- Mythic: Fate of the Sepulcher
            },
        },
        {
            14355, -- Glory of the Nathria Raider
            15130, -- Glory of the Dominant Raider
            15491, -- Glory of the Sepulcher Raider
            15684, -- Fates of the Shadowlands Raids
            15685, -- Heroic: Fates of the Shadowlands Raids
            15687, -- Mythic: Fates of the Shadowlands Raids
        },
    },
    { -- Professions
        1158,
        addon.GetCategoryInfoTitle(169),
        { -- Cooking
            1484,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                14332, -- Shadowlands Cook
            },
        },
        { -- Fishing
            1493,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                14333, -- Shadowlands Fisherman
            },
        },
        {
            14328, -- Professional Shadowlands Master
            14329, -- Working the Afterlife
            14330, -- Shadowlands Master of All
        },
    },
    { -- Pet Battles
        380,
        addon.GetCategoryInfoTitle(15117),
        {
            14867, -- Shadowlands Safari
            14625, -- Battle in the Shadowlands
            14868, -- Aquatic Apparitions
            14869, -- Beast Busters
            14870, -- Creepy Critters
            14871, -- Deathly Dragonkin
            14872, -- Eerie Elementals
            14873, -- Flickering Fliers
            14874, -- Haunted Humanoids
            14875, -- Mummified Magics
            14876, -- Macabre Mechanicals
            14877, -- Unholy Undead
            14879, -- Family Exorcist
            14881, -- Abhorrent Adversaries of the Afterlife
            15004, -- A Sly Fox
        },
    },
    { -- Torghast
        424,
        addon.GetCategoryInfoTitle(15440),
        { -- Skoldus Hall
            843,
            addon.GetAchievmentName(14463),
            true,
            {
                14463, -- Skoldus Hall
                15081, -- Flawless: Skoldus Hall (Layer 12)
                15314, -- Flawless: Skoldus Hall (Layer 16)
            },
        },
        { -- Fracture Chambers
            844,
            addon.GetAchievmentName(14473),
            true,
            {
                14473, -- Fracture Chambers
                15082, -- Flawless: Fracture Chambers (Layer 12)
                15316, -- Flawless: Fracture Chambers (Layer 16)
            },
        },
        { -- The Soulforges
            845,
            addon.GetAchievmentName(14478),
            true,
            {
                14478, -- The Soulforges
                15084, -- Flawless: The Soulforges (Layer 12)
                15317, -- Flawless: The Soulforges (Layer 16)
            },
        },
        { -- Coldheart Interstitia
            846,
            addon.GetAchievmentName(14483),
            true,
            {
                14483, -- Coldheart Interstitia
                15083, -- Flawless: Coldheart Interstitia (Layer 12)
                15318, -- Flawless: Coldheart Interstitia (Layer 16)
            },
        },
        { -- Mort'regar
            847,
            addon.GetAchievmentName(14488),
            true,
            {
                14488, -- Mort'regar
                15087, -- Flawless: Mort'regar (Layer 12)
                15319, -- Flawless: Mort'regar (Layer 16)
            },
        },
        { -- The Upper Reaches
            848,
            addon.GetAchievmentName(14493),
            true,
            {
                14493, -- The Upper Reaches
                15088, -- Flawless: The Upper Reaches (Layer 12)
                15320, -- Flawless: The Upper Reaches (Layer 16)
            },
        },
        { -- Other wings
            1039,
            addon.L["Other wings"],
            {
                14468, -- Twisting Corridors: Layer 1
                14469, -- Twisting Corridors: Layer 2
                14470, -- Twisting Corridors: Layer 3
                14471, -- Twisting Corridors: Layer 4
                14472, -- Twisting Corridors: Layer 5
                14568, -- Twisting Corridors: Layer 6
                14569, -- Twisting Corridors: Layer 7
                14570, -- Twisting Corridors: Layer 8
                15251, -- The Jailer's Gauntlet: Layer 1
                15252, -- The Jailer's Gauntlet: Layer 2
                15253, -- The Jailer's Gauntlet: Layer 3
                15254, -- The Jailer's Gauntlet: Layer 4
                15255, -- The Jailer's Gauntlet: Layer 5
                15256, -- The Jailer's Gauntlet: Layer 6
                15257, -- The Jailer's Gauntlet: Layer 7
                15258, -- The Jailer's Gauntlet: Layer 8
            },
        },
        {
            14808, -- Touring Torghast
            14809, -- Traversing Torghast
            14810, -- Terror of Torghast
            15091, -- A Taste of Perfection
            15089, -- Flawless Master (Layer 12)
            15322, -- Flawless Master (Layer 16)
            14499, -- Phanciful
            14500, -- Phantastic
            14501, -- Phanatical
            14498, -- Gatekeepers of Torghast
            14773, -- Explosive Extermination
            14776, -- For the Hoarder!
            14778, -- Extremely Ravenous
            14754, -- The Forgotten One
            14755, -- Legendary Accord
            14759, -- It's Coming Back to Me...
            14760, -- Recollection Collection
            14795, -- Clearing the Fog
            15067, -- Adamant Vaults
            15075, -- Infiltrators
            15076, -- The Box of Many Things
            15080, -- So Blessed
            15079, -- Many, Many Things
            15093, -- Avenge Me!
            15095, -- No Doubt
            15094, -- Rampage
            15096, -- Crowd Pleaser
            15092, -- Master of Torment
            15324, -- Tower Ranger
        },
    },
    { -- Covenant Sanctums
        419,
        addon.GetCategoryInfoTitle(15441),
        { -- Kyrian
            423,
            addon.GetCovenantName(1),
            {
                14851, -- Bastion of Protection
                14852, -- The Hoot of the Issue
                14853, -- All The Colors of the Painbow
                14854, -- It's Not What You Wear
                14502, -- Pursuing Loyalty
                14856, -- Charmed, I'm Sure
                14857, -- Itsy Bitsy Fighters
                14858, -- Curse of Thirst
                14859, -- Inside the Park Home Run
                14860, -- Bare Necessities
                14861, -- Learning from the Masters
                14862, -- It's How You Wear It
                14863, -- Death Foursworn
                14864, -- Personal Nightmare
                14865, -- Disciple of Humility
                14866, -- Master of the Path
                14887, -- To the Moon
            },
        },
        { -- Venthyr
            421,
            addon.GetCovenantName(2),
            {
                14678, -- Court Favors
                14679, -- Party Palace
                14680, -- Something for Everyone
                14681, -- Dredger Academy
                14682, -- The Party Herald
                14683, -- Dredger Style
                14723, -- Be Our Guest
                14724, -- People Pleaser
                14725, -- We Happy Few
                14726, -- It's Certainly Never Boring
                14727, -- Master of Ceremonies
                14749, -- Rendle's Big Day
                16731, -- Court is Now in Session
            },
        },
        { -- Night Fae
            422,
            addon.GetCovenantName(3),
            {
                14670, -- That's the Spirit
                14675, -- Spirit Talker
                14676, -- Divine Spirit Savior
                14677, -- Spiritual Observations
                14775, -- Mush Appreciated
                14780, -- Meditation Master
                14789, -- All Spirits Great and Small
            },
        },
        { -- Necrolord
            420,
            addon.GetCovenantName(4),
            {
                14684, -- Abominable Lives
                14748, -- Wardrobe Makeover
                14751, -- The Gang's All Here
                14752, -- Things To Do When You're Dead
                14753, -- It's a Wrap
                14764, -- The Great Luckydo
                14833, -- Fashion Abomination
                14763, -- Crypt Couture
            },
        },
        {
            14627, -- Choosing Your Purpose
            14790, -- Covenant Campaign
            15647, -- Dead Men Tell Some Tales
            14834, -- Bound with Purpose
            14835, -- A Resolute Bond
            14836, -- Unwavering Bond
            14837, -- Nexus of Bonds
            14628, -- The Road to Renown
            14629, -- Gaining Respect
            14630, -- Becoming a Hero
            14631, -- Champion of the Covenant
            15241, -- Renowned
            15646, -- Re-Re-Re-Renowned
            14632, -- Conducting Anima
            14633, -- Master Navigator
            14636, -- Adventurer in Chief
            14839, -- Adventures: Off To Adventure
            14840, -- Adventures: Learning the Ropes
            14841, -- Adventures: Now You're Cooking
            14842, -- Adventures: Strength and Resilience
            14843, -- Adventures: Harmony of Purpose
            14844, -- Adventures: Into the Breach
            14845, -- Adventures: A Step in the Right Direction
            14846, -- Adventures: Leaves in the Forest
            14847, -- Adventures: Protector of the Shadowlands
            14637, -- Your Covenant's Flavor
            14638, -- The Anima Must Flow
            14639, -- Dedication to the Restoration
            14777, -- Restoration Expert
            15023, -- We Can Rebuild
            15024, -- Denying the Drought
            15025, -- Sanctum Superior
            15649, -- Shadowlands Dilettante
        },
    },
    {
        15654, -- Back from the Beyond (Legacy)
        20501, -- Back from the Beyond
    },
};

local dragonflight = { -- Dragonflight
    1207,
    addon.GetCategoryInfoTitle(15466),
    { -- Character
        1610,
        addon.GetCategoryInfoTitle(92),
        {
            18976, -- Draconically Superior
            18977, -- Draconically Epic
            19326, -- Dreaming of Drakes
            19397, -- Dreaming of Wyrms
            19398, -- Dreaming of the Aspects
        },
    },
    { -- Zones
        1228,
        addon.L["Zones"],
        { -- Dragon Isles
            1341,
            addon.GetCategoryInfoTitle(15465),
            { -- Quests
                1342,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16585, -- Loremaster of the Dragon Isles
                    16291, -- An Ancient Awakening
                    16292, -- Mastering the Waygates
                    16808, -- Friend of the Dragon Isles
                    17739, -- Embers of Neltharion
                    16683, -- In Tyr's Footsteps
                    18958, -- Of the Tyr's Guard
                    20206, -- Champion of the Dragonflights
                    19463, -- Dragon Quests
                },
            },
            { -- Exploration
                1343,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16761, -- Dragon Isles Explorer
                    16446, -- That's Pretty Neat!
                    16298, -- Treasure Hunter of the Dragon Isles
                    15890, -- Dragonscale Expedition: The Highest Peaks
                    16323, -- Fragments of History
                    16338, -- Fang Flap Fire Fighter
                    16729, -- To All the Squirrels Hidden Til Now
                    17830, -- Stones Can't Fly!
                    17977, -- Stones Can Try To Fly!
                    17978, -- Stones Can Fly!
                    17560, -- Ancient Stones of the Dragon Isles
                },
            },
            { -- Player vs. Player
                1390,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16589, -- Malicia's Challenge
                    16590, -- A Champion's Tour: Dragon Isles
                    16599, -- A Champion's Pursuit
                    16601, -- Dragonfight Club
                    16603, -- Bounty Hunter
                    16612, -- Bounty Vigalante
                    16611, -- Resource Scavanger
                    16613, -- Finder's Keepers
                    16614, -- Bloodstained Bounty
                    16616, -- Prosperously Bloody
                    16615, -- Blood Bank
                    17335, -- Airborne Tumbler
                    17336, -- Airborne Tumbler
                    17345, -- Airborne Tumbler
                },
            },
            { -- Reputation
                1361,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41172, -- Friends in the Field
                    41174, -- A True Explorer
                    41171, -- Friends in the Accord
                    41182, -- Ally of the Flights
                    41179, -- Popular Around the Isles
                    16571, -- Well Supplied
                    16560, -- Wildlife Photographer
                    16566, -- Great Shot!
                    16567, -- A Lot of Great Shots!
                    16568, -- Great Shots Galore!
                    16572, -- Legendary Photograph
                    16573, -- Legendary Photographs
                    16570, -- A Legendary Album
                    16587, -- Lead Climber
                    16588, -- How Did These Get Here?
                    16591, -- The Gentleman Elemental
                    16600, -- Isles Ascender
                    16623, -- Toe Tension
                    16624, -- Which Knot Was It Again?
                    16625, -- Belay On!
                    16758, -- Ready, Aim, Catalog!
                    41184, -- Freshscales Fifteen
                    19466, -- Oh My God, They Were Clutchmates
                    19483, -- Flight Club
                    19486, -- Across the Isles
                },
            },
            { -- Dragonriding Races
                1577,
                addon.L["Dragonriding Races"],
                true,
                {
                    19478, -- Now THIS is Dragon Racing!
                },
            },
        },
        { -- Valdrakken
            1362,
            addon.GetMapName(2112),
            {
                16556, -- Great Gourmand of The Ruby Feast
                17734, -- Active Listening Skills
                18383, -- Hey Nanny Nanny
                18384, -- Whelp, There It Is
                17782, -- Daycare Derby
            },
        },
        { -- The Waking Shores
            1232,
            addon.GetMapName(2022),
            { -- Quests
                1237,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16334, -- Waking Hope
                    16401, -- Sojourner of the Waking Shores
                },
            },
            { -- Exploration
                1242,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16400, -- Explore the Waking Shores
                    16676, -- Adventurer of The Waking Shores
                    16297, -- Treasures of The Waking Shores
                    16411, -- Siege on Dragonbane Keep: Home Sweet Home
                    16412, -- Siege on Dragonbane Keep: Chiseled Record
                    16410, -- Siege on Dragonbane Keep: Snack Attack
                    16406, -- All Sides of the Story
                    16409, -- Let's Get Quacking
                    16494, -- Loyalty to the Prince
                    16495, -- Obsidian Keymaster
                    16496, -- Obsidian Champion
                    16497, -- I'm Playing All Sides
                    16584, -- Symbols of Hope
                    17561, -- Ancient Stones of the Waking Shores
                    16493, -- Petty Theft Mammoth
                    16736, -- Grand Theft Mammoth
                    18559, -- Many Boxes, Many Rockses
                },
            },
            { -- PvP
                1247,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16592, -- Tour of Duty: The Waking Shores
                },
            },
            { -- Reputation
                1248,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    16539, -- In High Esteem
                    16532, -- True Friends with Sabellian
                    16536, -- True Friends with Wrathion
                    16760, -- The Obsidian Bloodline
                    19479, -- Wake Me Up
                },
            },
            { -- Dragon Glyphs
                1306,
                addon.L["Dragon Glyphs"],
                true,
                {
                    15991, -- Dragon Glyphs: Crumbling Life Archway
                    16051, -- Dragon Glyphs: Dragonheart Outpost
                    16669, -- Dragon Glyphs: Flashfrost Enclave
                    15990, -- Dragon Glyphs: Life-Binder Observatory
                    15987, -- Dragon Glyphs: Obsidian Bulwark
                    16053, -- Dragon Glyphs: Obsidian Throne
                    15988, -- Dragon Glyphs: Ruby Life Pools Peaks
                    16052, -- Dragon Glyphs: Scalecracker Peak
                    16668, -- Dragon Glyphs: Skytop Observatory Rostrum
                    15985, -- Dragon Glyphs: Skytop Observatory Tower
                    15989, -- Dragon Glyphs: The Overflowing Spring
                    15986, -- Dragon Glyphs: Wingrest Embassy
                    16575, -- Waking Shores Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1310,
                addon.L["Dragonriding Races"],
                true,
                {
                    15915, -- Waking Shores: Bronze
                    15916, -- Waking Shores: Silver
                    15917, -- Waking Shores: Gold
                    15927, -- Waking Shores Advanced: Bronze
                    15928, -- Waking Shores Advanced: Silver
                    15929, -- Waking Shores Advanced: Gold
                    17195, -- Waking Shores Reverse: Bronze
                    17196, -- Waking Shores Reverse: Silver
                    17197, -- Waking Shores Reverse: Gold
                    18748, -- Waking Shores Challenge: Bronze
                    18749, -- Waking Shores Challenge: Silver
                    18750, -- Waking Shores Challenge: Gold
                },
            },
            { -- Primal Storms
                1363,
                addon.L["Primal Storms"],
                true,
                {
                    16463, -- Thunderstorms in The Waking Shores
                    16465, -- Sandstorms in The Waking Shores
                    16466, -- Firestorms in The Waking Shores
                    16467, -- Snowstorms in The Waking Shores
                    16468, -- Chasing Storms in The Waking Shores
                },
            },
        },
        { -- Ohn'ahran Plains
            1233,
            addon.GetMapName(2023),
            { -- Quests
                1238,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15394, -- Ohn'a'Roll
                    16405, -- Sojourner of Ohn'ahran Plains
                    16574, -- Sleeping on the Job
                    17546, -- A New Beginning
                    17735, -- We Didn't Start the Fire
                    18867, -- Through the Ashes and Flames
                },
            },
            { -- Exploration
                1243,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16457, -- Explore the Ohn'ahran Plains
                    16677, -- Adventurer of the Ohn'ahran Plains
                    16299, -- Treasures of the Ohn'ahran Plains
                    16423, -- Honor Our Ancestors
                    16424, -- Who's a Good Bakar?
                    16462, -- The Ohn'ahran Trail
                    16583, -- Knew You Nokhud Do It!
                    17506, -- Still Standing in the Fire
                    17562, -- Ancient Stones of the Ohn'ahran Plains
                },
            },
            { -- PvP
                1249,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16595, -- Tour of Duty: Ohn'ahran Plains
                },
            },
            { -- Reputation
                1253,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41170, -- Friends in the Plains
                    41180, -- Joining the Khansguard
                    16544, -- Grand Hunter
                    16540, -- Hunt Master
                    16545, -- The Best at What I Do
                    16541, -- Longhunter
                    16542, -- The Disgruntled Hunter
                    16543, -- Tetrachromancer
                    19481, -- Centaur of Attention
                },
            },
            { -- Dragon Glyphs
                1307,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16061, -- Dragon Glyphs: Dragonsprings Summit
                    16056, -- Dragon Glyphs: Emerald Gardens
                    16671, -- Dragon Glyphs: Mirewood Fen
                    16059, -- Dragon Glyphs: Mirror of the Sky
                    16055, -- Dragon Glyphs: Nokhudon Hold
                    16054, -- Dragon Glyphs: Ohn'ahra's Roost
                    16060, -- Dragon Glyphs: Ohn'iri Springs
                    16670, -- Dragon Glyphs: Rubyscale Outpost
                    16062, -- Dragon Glyphs: Rusza'thar Reach
                    16058, -- Dragon Glyphs: Szar Skeleth
                    16057, -- Dragon Glyphs: The Eternal Kurgans
                    16063, -- Dragon Glyphs: Windsong Rise
                    16576, -- Ohn'ahran Plains Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1311,
                addon.L["Dragonriding Races"],
                true,
                {
                    15918, -- Ohn'ahran Plains: Bronze
                    15919, -- Ohn'ahran Plains: Silver
                    15920, -- Ohn'ahran Plains: Gold
                    15930, -- Ohn'ahran Plains Advanced: Bronze
                    15931, -- Ohn'ahran Plains Advanced: Silver
                    15932, -- Ohn'ahran Plains Advanced: Gold
                    17198, -- Ohn'ahran Plains Reverse: Bronze
                    17199, -- Ohn'ahran Plains Reverse: Silver
                    17200, -- Ohn'ahran Plains Reverse: Gold
                    18754, -- Ohn'ahran Plains Challenge: Bronze
                    18755, -- Ohn'ahran Plains Challenge: Silver
                    18756, -- Ohn'ahran Plains Challenge: Gold
                },
            },
            { -- Primal Storms
                1364,
                addon.L["Primal Storms"],
                true,
                {
                    16475, -- Thunderstorms in the Ohn'ahran Plains
                    16477, -- Sandstorms in the Ohn'ahran Plains
                    16478, -- Firestorms in the Ohn'ahran Plains
                    16479, -- Snowstorms in the Ohn'ahran Plains
                    16476, -- Chasing Storms in the Ohn'ahran Plains
                },
            },
        },
        { -- The Azure Span
            1234,
            addon.GetMapName(2024),
            { -- Quests
                1239,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16336, -- Azure Spanner
                    16428, -- Sojourner of Azure Span
                    15889, -- River Rapids Wrangler
                    16580, -- Lend a Helping Span
                    17735, -- We Didn't Start the Fire
                    18867, -- Through the Ashes and Flames
                    17773, -- A Blue Dawn
                },
            },
            { -- Exploration
                1245,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16460, -- Explore the Azure Span
                    16678, -- Adventurer of The Azure Span
                    16300, -- Treasures of The Azure Span
                    16474, -- Do You Wanna Build a Snowman?
                    16569, -- Cobalt Enthusiast
                    16638, -- Ley Line in the Span
                    16622, -- Three Minutes or It's Free
                    16581, -- Seeing Blue
                    17506, -- Still Standing in the Fire
                    17563, -- Ancient Stones of the Azure Span
                },
            },
            { -- PvP
                1250,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16594, -- Tour of Duty: The Azure Span
                },
            },
            { -- Reputation
                1256,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41173, -- Friend of the Family
                    41181, -- Joining the Community
                    16533, -- Lots of Lunkers
                    16531, -- A Whole Heap of Lunkers
                    16546, -- What's Down There?
                    16547, -- Pulled!
                    16548, -- It Takes a Tuskarr Buddy
                    16550, -- Giving Back to Nature
                    16551, -- Giving More Back to Nature
                    16552, -- Giving Even More Back to Nature
                    16553, -- Taking From Nature
                    16561, -- Lunkers, Lunkers Everywhere
                    16562, -- That's not a Fish...
                    16563, -- We're Going to Need a Bigger Harpoon
                    16564, -- It Takes a Tuskarr Family
                    16565, -- It Takes a Tuskarr Village
                    16537, -- Maximum Power!
                    16317, -- Secret Fishing Spots
                    16321, -- Cutting Tusk Equipment
                    16322, -- Best in Slot
                    16444, -- Leftovers' Revenge
                    16443, -- Soupervisor
                    17427, -- Winterpelt Conversationalist
                    19482, -- Army of the Fed
                },
            },
            { -- Dragon Glyphs
                1308,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16065, -- Dragon Glyphs: Azure Archives
                    16068, -- Dragon Glyphs: Brackenhide Hollow
                    16064, -- Dragon Glyphs: Cobalt Assembly
                    16069, -- Dragon Glyphs: Drake Eye's Pond
                    16672, -- Dragon Glyphs: Forkriver Crossing
                    16070, -- Dragon Glyphs: Imbu
                    16072, -- Dragon Glyphs: Rhonin's Shield
                    16067, -- Dragon Glyphs: Lost Ruins
                    16066, -- Dragon Glyphs: Ruins of Karnthar
                    16673, -- Dragon Glyphs: The Fallen Course
                    16073, -- Dragon Glyphs: Vakthros Range
                    16071, -- Dragon Glyphs: Zelthrak Outpost
                    16577, -- Azure Span Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1312,
                addon.L["Dragonriding Races"],
                true,
                {
                    15921, -- Azure Span: Bronze
                    15922, -- Azure Span: Silver
                    15923, -- Azure Span: Gold
                    15933, -- Azure Span Advanced: Bronze
                    15934, -- Azure Span Advanced: Silver
                    15935, -- Azure Span Advanced: Gold
                    17201, -- Azure Span Reverse: Bronze
                    17202, -- Azure Span Reverse: Silver
                    17203, -- Azure Span Reverse: Gold
                    18757, -- Azure Span Challenge: Bronze
                    18758, -- Azure Span Challenge: Silver
                    18759, -- Azure Span Challenge: Gold
                },
            },
            { -- Primal Storms
                1365,
                addon.L["Primal Storms"],
                true,
                {
                    16480, -- Thunderstorms in The Azure Span
                    16481, -- Sandstorms in The Azure Span
                    16482, -- Firestorms in The Azure Span
                    16483, -- Snowstorms in The Azure Span
                    16484, -- Chasing Storms in The Azure Span
                },
            },
        },
        { -- Thaldraszus
            1235,
            addon.GetMapName(2025),
            { -- Quests
                1240,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16363, -- Just Don't Ask Me to Spell It
                    16398, -- Sojourner of Thaldraszus
                    17342, -- The Future We Make
                    17343, -- Drop It Like It's Hot
                    19507, -- Fringe Benefits
                },
            },
            { -- Exploration
                1246,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16518, -- Explore Thaldraszus
                    16679, -- Adventurer of Thaldraszus
                    16301, -- Treasures of Thaldraszus
                    16634, -- Framing a New Perspective
                    16621, -- One of Everything, Please
                    17564, -- Ancient Stones of Thaldraszus
                },
            },
            { -- PvP
                1251,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16593, -- Tour of Duty: Thaldraszus
                },
            },
            { -- Dragon Glyphs
                1309,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16104, -- Dragon Glyphs: Algeth'ar Academy
                    16102, -- Dragon Glyphs: Algeth'era
                    16666, -- Dragon Glyphs: Gelikyr Overlook
                    16667, -- Dragon Glyphs: Passage of Time
                    16100, -- Dragon Glyphs: South Hold Gate
                    16099, -- Dragon Glyphs: Stormshroud Peak
                    16098, -- Dragon Glyphs: Temporal Conflux
                    16107, -- Dragon Glyphs: Thaldraszus Apex
                    16103, -- Dragon Glyphs: Tyrhold
                    16101, -- Dragon Glyphs: Valdrakken
                    16106, -- Dragon Glyphs: Vault of the Incarnates
                    16105, -- Dragon Glyphs: Veiled Ossuary
                    16578, -- Thaldraszus Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1313,
                addon.L["Dragonriding Races"],
                true,
                {
                    15924, -- Thaldraszus: Bronze
                    15925, -- Thaldraszus: Silver
                    15926, -- Thaldraszus: Gold
                    15936, -- Thaldraszus Advanced: Bronze
                    15937, -- Thaldraszus Advanced: Silver
                    15938, -- Thaldraszus Advanced: Gold
                    17204, -- Thaldraszus Reverse: Bronze
                    17205, -- Thaldraszus Reverse: Silver
                    17206, -- Thaldraszus Reverse: Gold
                    18760, -- Thaldraszus Challenge: Bronze
                    18761, -- Thaldraszus Challenge: Silver
                    18762, -- Thaldraszus Challenge: Gold
                },
            },
            { -- Primal Storms
                1366,
                addon.L["Primal Storms"],
                true,
                {
                    16485, -- Thunderstorms in Thaldraszus
                    16486, -- Sandstorms in Thaldraszus
                    16487, -- Firestorms in Thaldraszus
                    16488, -- Snowstorms in Thaldraszus
                    16489, -- Chasing Storms in Thaldraszus
                },
            },
        },
        { -- The Forbidden Reach
            1236,
            addon.GetMapName(2107),
            { -- Quests
                1241,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15325, -- Dracthyr, Awaken
                    15638, -- Dracthyr, Awaken
                },
            },
            { -- Exploration
                1244,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16452, -- Famliar Skies
                    17534, -- Explore the Forbidden Reach
                    17315, -- While We Were Sleeping
                    17524, -- Adventurer of the Forbidden Reach
                    17525, -- Champion of the Forbidden Reach
                    17526, -- Treasures of the Forbidden Reach
                    17527, -- Scavenger of the Forbidden Reach
                    17528, -- Hoarder of the Forbidden Reach
                    17529, -- Forbidden Spoils
                    17530, -- Librarian of the Reach
                    17531, -- X Marks the Spot
                    17532, -- Scroll Hunter
                    17397, -- Door To Door
                    17413, -- Door Buster
                    17509, -- Every Door, Everywhere, All At Once
                    17543, -- You Know How to Reach Me
                },
            },
            { -- Dragon Glyphs
                1408,
                addon.L["Dragon Glyphs"],
                true,
                {
                    17398, -- Dragon Glyphs: Winglord's Perch
                    17399, -- Dragon Glyphs: Talon's Watch
                    17400, -- Dragon Glyphs: Froststone Peak
                    17401, -- Dragon Glyphs: Dragonskull Island
                    17402, -- Dragon Glyphs: Stormsunder Mountain
                    17403, -- Dragon Glyphs: The Frosted Spine
                    17404, -- Dragon Glyphs: Talonlords' Perch
                    17405, -- Dragon Glyphs: Caldera of the Menders
                    17411, -- Forbidden Reach Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1407,
                addon.L["Dragonriding Races"],
                true,
                {
                    17279, -- Forbidden Reach: Bronze
                    17280, -- Forbidden Reach: Silver
                    17281, -- Forbidden Reach: Gold
                    17284, -- Forbidden Reach Advanced: Bronze
                    17286, -- Forbidden Reach Advanced: Silver
                    17287, -- Forbidden Reach Advanced: Gold
                    17288, -- Forbidden Reach Reverse: Bronze
                    17289, -- Forbidden Reach Reverse: Silver
                    17290, -- Forbidden Reach Reverse: Gold
                    17294, -- Forbidden Reach Racing Completionist
                    17296, -- Forbidden Reach Racing Completionist: Silver
                    17298, -- Forbidden Reach Racing Completionist: Gold
                    18779, -- Forbidden Reach Challenge: Bronze
                    18780, -- Forbidden Reach Challenge: Silver
                    18781, -- Forbidden Reach Challenge: Gold
                },
            },
            { -- Primal Storms
                1410,
                addon.L["Primal Storms"],
                true,
                {
                    17540, -- Under the Weather
                },
            },
        },
        { -- Zaralek Cavern
            1414,
            addon.GetMapName(2133),
            { -- Exploration
                1416,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    17766, -- Explore Zaralek Cavern
                    17783, -- Adventurer of Zaralek Cavern
                    17786, -- Treasures of Zaralek Cavern
                    17741, -- Slow and Steady Wins the Race
                    17781, -- The Smell of Money
                    17567, -- Ancient Stones of Zaralek
                    17832, -- Sniffen Around
                    17833, -- Sniffen Sage
                    17878, -- Me Want Bite
                    18100, -- Cavern Clawbbering
                    18255, -- Proof of Myrrit
                    18257, -- Can You Dig It?
                    18284, -- A Niffen's Best Buddy
                    18361, -- To All the Squirrels Burrowed Beneath
                },
            },
            { -- Player vs. Player
                1417,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    17851, -- Tour of Duty: Zaralek Cavern
                    17852, -- Elemental Conjuror
                },
            },
            { -- Reputation
                1418,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41175, -- Friends in Loamm Places
                    41183, -- There's No Place Like Loamm
                },
            },
            { -- Dragon Glyphs
                1427,
                addon.L["Dragon Glyphs"],
                true,
                {
                    17510, -- Dragon Glyphs: Glimmerogg
                    17511, -- Dragon Glyphs: Nal ks'kol
                    17512, -- Dragon Glyphs: Loamm
                    17513, -- Dragon Glyphs: Zaqali Caldera
                    17514, -- Dragon Glyphs: Slitherdrake Roost
                    17515, -- Dragon Glyphs: The Throughway
                    17516, -- Dragon Glyphs: Acidbite Ravine
                    17517, -- Dragon Glyphs: Aberrus Approach
                    18150, -- Zaralek Cavern Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1424,
                addon.L["Dragonriding Races"],
                true,
                {
                    17483, -- Zaralek Cavern: Bronze
                    17484, -- Zaralek Cavern: Silver
                    17485, -- Zaralek Cavern: Gold
                    17486, -- Zaralek Cavern Advanced: Bronze
                    17487, -- Zaralek Cavern Advanced: Silver
                    17488, -- Zaralek Cavern Advanced: Gold
                    17489, -- Zaralek Cavern Reverse: Bronze
                    17490, -- Zaralek Cavern Reverse: Silver
                    17491, -- Zaralek Cavern Reverse: Gold
                    17492, -- Zaralek Cavern Racing Completionist
                    17493, -- Zaralek Cavern Racing Completionist: Silver
                    17494, -- Zaralek Cavern Racing Completionist: Gold
                    18786, -- Zaralek Cavern Challenge: Bronze
                    18787, -- Zaralek Cavern Challenge: Silver
                    18788, -- Zaralek Cavern Challenge: Gold
                },
            },
            {
                17785, -- Que Zara(lek), Zara(lek)
                17841, -- Pyramid Scheme
                18271, -- He'sSss All Mine
            },
        },
        { -- Emerald Dream
            1541,
            addon.GetMapName(2200),
            { -- Quests
                1548,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    19026, -- Defenders of the Dream
                    19293, -- Friends In Feathers
                },
            },
            { -- Exploration
                1549,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    19309, -- Explore the Emerald Dream
                    19316, -- Adventurer of the Emerald Dream
                    19317, -- Treasures of the Emerald Dream
                    19013, -- I Dream of Seeds
                    19194, -- The Emerald Bounty
                    19196, -- Sowing the Seeds
                    19198, -- The Seeds I Sow
                    19461, -- Kissed by the Wind
                },
            },
            { -- Player vs. Player
                1546,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    19294, -- Tour of Duty: Emerald Dream
                },
            },
            { -- Reputation
                1547,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41176, -- Friends in the Dream
                    41177, -- Warden of the Dream
                },
            },
            { -- Dragon Glyphs
                1551,
                addon.L["Dragon Glyphs"],
                true,
                {
                    19296, -- Dragon Glyphs: Eye of Ysera
                    19297, -- Dragon Glyphs: Furnace Coil
                    19298, -- Dragon Glyphs: Smoldering Copse
                    19299, -- Dragon Glyphs: Cinder Summit
                    19300, -- Dragon Glyphs: Dreamsurge Basin
                    19301, -- Dragon Glyphs: Amirdrassil
                    19302, -- Dragon Glyphs: Whorlwing Basin
                    19303, -- Dragon Glyphs: Wakeful Vista
                    19306, -- Emerald Dream Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1542,
                addon.L["Dragonriding Races"],
                true,
                {
                    19109, -- Emerald Dream: Bronze
                    19110, -- Emerald Dream: Silver
                    19111, -- Emerald Dream: Gold
                    19112, -- Emerald Dream Advanced: Bronze
                    19113, -- Emerald Dream Advanced: Silver
                    19114, -- Emerald Dream Advanced: Gold
                    19115, -- Emerald Dream Reverse: Bronze
                    19116, -- Emerald Dream Reverse: Silver
                    19117, -- Emerald Dream Reverse: Gold
                    19118, -- Emerald Dream Racing Completionist
                    19119, -- Emerald Dream Racing Completionist: Silver
                    19120, -- Emerald Dream Racing Completionist: Gold
                    19121, -- Emerald Dream Challenge: Bronze
                    19122, -- Emerald Dream Challenge: Silver
                    19123, -- Emerald Dream Challenge: Gold
                    19124, -- Emerald Dream Reverse Challenge: Bronze
                    19125, -- Emerald Dream Reverse Challenge: Silver
                    19126, -- Emerald Dream Reverse Challenge: Gold
                    19127, -- Emerald Dream Challenge Racing Completionist
                    19128, -- Emerald Dream Challenge Racing Completionist: Silver
                    19129, -- Emerald Dream Challenge Racing Completionist: Gold
                },
            },
            {
                19318, -- Dream On
            },
        },
    },
    { -- Dungeons
        1229,
        addon.GetCategoryInfoTitle(15272),
        { -- Algeth'ar Academy
            1257,
            addon.GetInstanceInfoName(1201),
            {
                16434, -- See Me After Class
                16329, -- Duck, Duck, Spruce!
                16441, -- Squad Goals
                16269, -- Algeth'ar Academy
                16270, -- Heroic: Algeth'ar Academy
                16271, -- Mythic: Algeth'ar Academy
                16643, -- Keystone Hero: Algeth'ar Academy
            },
        },
        { -- Brackenhide Hollow
            1258,
            addon.GetInstanceInfoName(1196),
            {
                16110, -- Subscribed to Hyena Facts
                16296, -- Growlbossify
                16430, -- All Bark, All Bite
                16404, -- So You Can Kill This in a Way That Matters...
                16762, -- The Vegetarian Diet
                16255, -- Brackenhide Hollow
                16256, -- Heroic: Brackenhide Hollow
                16257, -- Mythic: Brackenhide Hollow
                16642, -- Keystone Hero: Brackenhide Hollow
            },
        },
        { -- Halls of Infusion
            1259,
            addon.GetInstanceInfoName(1204),
            {
                16426, -- Hungry Hungry Hornswog
                16427, -- Go With the Flow
                16517, -- Toxicity Strike Team
                16260, -- Halls of Infusion
                16261, -- Heroic: Halls of Infusion
                16262, -- Mythic: Halls of Infusion
                16646, -- Keystone Hero: Halls of Infusion
            },
        },
        { -- Neltharus
            1260,
            addon.GetInstanceInfoName(1199),
            {
                16438, -- Knowledge is... Preserved?
                16432, -- Ready for Raiding VIII
                16453, -- Liquid Hot Magma
                16263, -- Neltharus
                16264, -- Heroic: Neltharus
                16265, -- Mythic: Neltharus
                16644, -- Keystone Hero: Neltharus
            },
        },
        { -- Ruby Life Pools
            1261,
            addon.GetInstanceInfoName(1202),
            {
                16402, -- Dragon Kill Points
                16320, -- Does Steam Do Fire Damage?
                16440, -- Are You My Broodmother?
                16266, -- Ruby Life Pools
                16267, -- Heroic: Ruby Life Pools
                16268, -- Mythic: Ruby Life Pools
                16640, -- Keystone Hero: Ruby Life Pools
            },
        },
        { -- The Azure Vault
            1262,
            addon.GetInstanceInfoName(1203),
            {
                16445, -- Icy What You Did There
                16331, -- The Cracked Crystal
                16330, -- You Must Be Made of Hide
                16272, -- The Azure Vault
                16273, -- Heroic: The Azure Vault
                16274, -- Mythic: The Azure Vault
                16645, -- Keystone Hero: The Azure Vault
            },
        },
        { -- The Nokhud Offensive
            1263,
            addon.GetInstanceInfoName(1198),
            {
                16447, -- What Are The Chances...
                16456, -- Weapons of the Maruukai
                16602, -- Nokhud Deed Goes Unnoticed
                16620, -- Ohuna Incubation
                16275, -- The Nokhud Offensive
                16276, -- Heroic: The Nokhud Offensive
                16277, -- Mythic: The Nokhud Offensive
                16641, -- Keystone Hero: The Nokhud Offensive
            },
        },
        { -- Uldaman: Legacy of Tyr
            1264,
            addon.GetInstanceInfoName(1197),
            {
                16337, -- It's a Trogg Eat Trogg World
                16282, -- No, You're Stunning!
                16281, -- Like Sands Through the Hourglass
                16278, -- Uldaman: Legacy of Tyr
                16279, -- Heroic: Uldaman: Legacy of Tyr
                16280, -- Mythic: Uldaman: Legacy of Tyr
                16639, -- Keystone Hero: Uldaman: Legacy of Tyr
            },
        },
        { -- Dawn of the Infinite
            1450,
            addon.GetInstanceInfoName(1209),
            {
                18589, -- Crunch Time
                18556, -- Chaotic Time
                18612, -- A Slime in Need
                18539, -- Back En-masse
                18703, -- Dawn of the Infinite: Galakrond's Fall
                18704, -- Dawn of the Infinite: Murozond's Rise
                18705, -- Defender of the Timeways
                18706, -- Put That Thing Back Where It Came From
                19088, -- Keystone Hero: Dawn of the Infinite
            },
        },
        {
            16294, -- Dragonflight Dungeon Hero
            16339, -- Myths of the Dragonflight Dungeons
            16295, -- Glory of the Dragonflight Hero
            16647, -- Dragonflight Keystone Explorer: Season One
            16648, -- Dragonflight Keystone Conqueror: Season One
            16649, -- Dragonflight Keystone Master: Season One
            16650, -- Dragonflight Keystone Hero: Season One
            16429, -- Thundering Hero: Dragonflight Season 1
            17119, -- Deep Cuts From the Vault
            17842, -- Dragonflight Keystone Explorer: Season Two
            17843, -- Dragonflight Keystone Conqueror: Season Two
            17844, -- Dragonflight Keystone Master: Season Two
            17845, -- Dragonflight Keystone Hero: Season Two
            18542, -- Dragonflight Keystone Master: Season Two
            17846, -- Smoldering Hero: Dragonflight Season 2
            18027, -- Dragonflight Season 2 Master
            18380, -- Dragonflight Season 2 Hero
            17830, -- Stones Can't Fly!
            17977, -- Stones Can Try To Fly!
            17978, -- Stones Can Fly!
            19009, -- Dragonflight Keystone Explorer: Season Three
            19010, -- Dragonflight Keystone Conqueror: Season Three
            19011, -- Dragonflight Keystone Master: Season Three
            19012, -- Dragonflight Keystone Hero: Season Three
            19449, -- Dreaming Hero: Dragonflight Season 3
            19396, -- Dragonflight Season 3 Master
            19420, -- Dragonflight Season 3 Hero
            19780, -- Dragonflight Keystone Explorer: Season Four
            19781, -- Dragonflight Keystone Conqueror: Season Four
            19782, -- Dragonflight Keystone Master: Season Four
            19783, -- Dragonflight Keystone Hero: Season Four
            19785, -- Draconic Hero: Dragonflight Season 4
            20481, -- Dragonflight Season 4 Master
        },
    },
    { -- Raids
        1230,
        addon.GetCategoryInfoTitle(15271),
        { -- Vault of the Incarnates
            1265,
            addon.GetInstanceInfoName(1200),
            { -- Glory
                1266,
                addon.L["Glory"],
                {
                    16335, -- What Frozen Things Do
                    16365, -- Little Friends
                    16364, -- The Lunker Below
                    16419, -- I Was Saving That For Later
                    16458, -- Nothing But Air
                    16450, -- The Power is MINE!
                    16442, -- Incubation Extermination
                    16451, -- The Ol Raszle Daszle
                },
            },
            { -- Mythic
                1267,
                addon.L["Mythic"],
                {
                    16346, -- Mythic: Eranog
                    16347, -- Mythic: Terros
                    16348, -- Mythic: The Primal Council
                    16349, -- Mythic: Sennarth, The Cold Breath
                    16350, -- Mythic: Dathea, Ascended
                    16351, -- Mythic: Kurog Grimtotem
                    16352, -- Mythic: Broodkeeper Diurna
                    16353, -- Mythic: Raszageth the Storm-Eater
                },
            },
            {
                17110, -- The Primal Bulwark
                17111, -- Caverns of Infusion
                17112, -- Fury of the Storm
                16343, -- Vault of the Incarnates
                16345, -- Heroic: Vault of the Incarnates
                16354, -- Mythic: Vault of the Incarnates
                17107, -- Ahead of the Curve: Raszageth the Storm-Eater
                17108, -- Cutting Edge: Raszageth the Storm-Eater
                16395, -- Vaulternative Fashion
                17119, -- Deep Cuts From the Vault
                19564, -- Awakened Storms
                19565, -- Heroic: Awakened Storms
                19566, -- Mythic: Awakened Storms
            },
        },
        { -- Aberrus, the Shadowed Crucible
            1420,
            addon.GetInstanceInfoName(1208),
            { -- Glory
                1421,
                addon.L["Glory"],
                {
                    18229, -- Cosplate
                    18168, -- I'll Make My Own Shadowflame
                    18173, -- Tabula Rasa
                    18228, -- Are You Even Trying?
                    18230, -- Whac-A-Swog
                    18193, -- Eggscellent Eggsecution
                    18172, -- Escar-Go-Go-Go
                    18149, -- Objects in Transit May Shatter
                    17877, -- We'll Never See That Again, Surely
                },
            },
            { -- Mythic
                1422,
                addon.L["Mythic"],
                {
                    18151, -- Mythic: Kazzara, the Hellforged
                    18152, -- Mythic: The Amalgamation Chamber
                    18153, -- Mythic: The Forgotten Experiments
                    18154, -- Mythic: Assault of the Zaqali
                    18155, -- Mythic: Rashok, the Elder
                    18156, -- Mythic: The Vigilant Steward, Zskarn
                    18157, -- Mythic: Magmorax
                    18158, -- Mythic: Echo of Neltharion
                    18159, -- Mythic: Scalecommander Sarkareth
                },
            },
            {
                18163, -- Discarded Works
                18164, -- Fury of Giants
                18165, -- Neltharion's Shadow
                18167, -- Edge of the Void
                18160, -- Aberrus, the Shadowed Crucible
                18161, -- Heroic: Aberrus, the Shadowed Crucible
                18162, -- Mythic: Aberrus, the Shadowed Crucible
                18253, -- Ahead of the Curve: Scalecommander Sarkareth
                18254, -- Cutting Edge: Scalecommander Sarkareth
                17765, -- What We Wear In The Shadowflame
                18256, -- Nasz'uro, the Unbound Legacy
                18027, -- Dragonflight Season 2 Master
                18380, -- Dragonflight Season 2 Hero
                19567, -- Awakened Shadows
                19568, -- Heroic: Awakened Shadows
                19569, -- Mythic: Awakened Shadows
            },
        },
        { -- Amirdrassil, the Dream's Hope
            1543,
            addon.GetInstanceInfoName(1207),
            { -- Glory
                1544,
                addon.L["Glory"],
                {
                    19322, -- Meaner Pastures
                    19320, -- Cruelty Free
                    19321, -- Swog Champion
                    19193, -- Ducks In A Row
                    19089, -- Don't Let the Doe Hit You On The Way Out
                    19394, -- A Dream Within a Dream
                    19319, -- Haven't We Done This Before?
                    19393, -- Whelp, I'm Lost
                    19390, -- Memories of Teldrassil
                },
            },
            { -- Mythic
                1545,
                addon.L["Mythic"],
                {
                    19335, -- Mythic: Gnarlroot
                    19336, -- Mythic: Igira the Cruel
                    19337, -- Mythic: Volcoross
                    19338, -- Mythic: Council of Dreams
                    19339, -- Mythic: Larodar, Keeper of the Flame
                    19340, -- Mythic: Nymue, Weaver of the Cycle
                    19341, -- Mythic: Smolderon
                    19342, -- Mythic: Tindral Sageswift, Seer of the Flame
                    19343, -- Mythic: Fyrakk the Blazing
                },
            },
            {
                19344, -- Incarnate's Wake
                19345, -- Molten Incursion
                19346, -- The Viridian Weave
                19347, -- Fate of Amirdrassil
                19331, -- Amirdrassil, the Dream's Hope
                19333, -- Heroic: Amirdrassil, the Dream's Hope
                19334, -- Mythic: Amirdrassil, the Dream's Hope
                19350, -- Ahead of the Curve: Fyrakk the Blazing
                19351, -- Cutting Edge: Fyrakk the Blazing
                19442, -- Fire Catwalk With Me
                19450, -- Fyr'alath the Dreamrender
                19396, -- Dragonflight Season 3 Master
                19420, -- Dragonflight Season 3 Hero
                19570, -- Awakened Flames
                19571, -- Heroic: Awakened Flames
                19572, -- Mythic: Awakened Flames
            },
        },
        {
            16355, -- Glory of the Vault Raider
            18251, -- Glory of the Aberrus Raider
            17830, -- Stones Can't Fly!
            17977, -- Stones Can Try To Fly!
            17978, -- Stones Can Fly!
            19349, -- Glory of the Dream Raider
            19574, -- Awakening the Dragonflight Raids
            19575, -- Heroic: Awakening the Dragonflight Raids
            19576, -- Mythic: Awakening the Dragonflight Raids
        },
    },
    { -- Professions
        1391,
        addon.GetCategoryInfoTitle(169),
        { -- Alchemy
            1466,
            addon.GetCategoryInfoTitle(15489),
            true,
            {
                18805, -- Draconic Phial Cabinet
            },
        },
        { -- Cooking
            1485,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                16631, -- Dragon Isles Cook
            },
        },
        { -- Enchanting
            1487,
            addon.GetCategoryInfoTitle(15491),
            true,
            {
                18763, -- Spectre of Spectacles
                18764, -- Break Upon Your Body
            },
        },
        { -- Engineering
            1491,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                18857, -- That's No Ordinary Gas Cloud!
            },
        },
        { -- Fishing
            1492,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                16632, -- Dragon Isles Fisherman
            },
        },
        { -- Herbalism
            1504,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18822, -- Botanist's Log - Hochenblume
                18823, -- Botanist's Log - Saxifrage
                18824, -- Botanist's Log - Bubble Poppy
                18825, -- Botanist's Log - Writhebark
                18829, -- Botanist's Log - Overloaded Elements
                18828, -- Botanist's Log: Dragon Isles
            },
        },
        { -- Jewelcrafting
            1509,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                18727, -- Rave Leader
                18941, -- Dazzling Dragons
            },
        },
        { -- Mining
            1519,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18818, -- Geologist's Ledger - Serevite
                18819, -- Geologist's Ledger - Draconium
                18821, -- Geologist's Ledger - Overloaded Elements
                18820, -- Geologist's Ledger: Dragon Isles
            },
        },
        { -- Skinning
            1523,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18832, -- Elusive Legend of the Dragon Isles
                18833, -- Elusive Legends of the Dragon Isles
                18831, -- Elusive Beasts of the Dragon Isles
            },
        },
        { -- Tailoring
            1528,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                18902, -- Uncertified Nurse
            },
        },
        {
            16627, -- Professional Draconic Master
            16626, -- Working with Wyrms
            16630, -- Draconic Master of All
        },
    },
    { -- Pet Battles
        1231,
        addon.GetCategoryInfoTitle(15117),
        {
            16519, -- Dragon Isles Safari
            16464, -- Battle on the Dragon Isles
            17406, -- Battle on the Dragon Isles II
            16501, -- Aquatic Battler of the Dragon Isles
            16503, -- Beast Battler of the Dragon Isles
            16504, -- Critter Battler of the Dragon Isles
            16505, -- Dragonkin Battler of the Dragon Isles
            16506, -- Elemental Battler of the Dragon Isles
            16507, -- Flying Battler of the Dragon Isles
            16508, -- Humanoid Battler of the Dragon Isles
            16509, -- Magic Battler of the Dragon Isles
            16510, -- Mechanical Battler of the Dragon Isles
            16511, -- Undead Battler of the Dragon Isles
            16512, -- Family Battler of the Dragon Isles
            16399, -- Lovin' Lubbins
            17541, -- Global Swarming
            17879, -- Zaralek Cavern Safari
            17880, -- Battle in Zaralek Cavern
            17881, -- Aquatic Battler of Zaralek Cavern
            17882, -- Beast Battler of Zaralek Cavern
            17883, -- Critter Battler of Zaralek Cavern
            17890, -- Dragonkin Battler of Zaralek Cavern
            17904, -- Elemental Battler of Zaralek Cavern
            17905, -- Flying Battler of Zaralek Cavern
            17915, -- Humanoid Battler of Zaralek Cavern
            17916, -- Magic Battler of Zaralek Cavern
            17917, -- Mechanical Battler of Zaralek Cavern
            17918, -- Undead Battler of Zaralek Cavern
            17934, -- Family Battler of Zaralek Cavern
            19401, -- Emerald Dream Safari
        },
    },
    { -- Dragonriding
        1268,
        addon.L["Dragonriding"],
        { -- The Waking Shores
            1302,
            addon.GetMapName(2022),
            true,
            {
                15991, -- Dragon Glyphs: Crumbling Life Archway
                16051, -- Dragon Glyphs: Dragonheart Outpost
                16669, -- Dragon Glyphs: Flashfrost Enclave
                15990, -- Dragon Glyphs: Life-Binder Observatory
                15987, -- Dragon Glyphs: Obsidian Bulwark
                16053, -- Dragon Glyphs: Obsidian Throne
                15988, -- Dragon Glyphs: Ruby Life Pools Peaks
                16052, -- Dragon Glyphs: Scalecracker Peak
                16668, -- Dragon Glyphs: Skytop Observatory Rostrum
                15985, -- Dragon Glyphs: Skytop Observatory Tower
                15989, -- Dragon Glyphs: The Overflowing Spring
                15986, -- Dragon Glyphs: Wingrest Embassy
                16575, -- Waking Shores Glyph Hunter
            },
        },
        { -- Ohn'ahran Plains
            1303,
            addon.GetMapName(2023),
            true,
            {
                16061, -- Dragon Glyphs: Dragonsprings Summit
                16056, -- Dragon Glyphs: Emerald Gardens
                16671, -- Dragon Glyphs: Mirewood Fen
                16059, -- Dragon Glyphs: Mirror of the Sky
                16055, -- Dragon Glyphs: Nokhudon Hold
                16054, -- Dragon Glyphs: Ohn'ahra's Roost
                16060, -- Dragon Glyphs: Ohn'iri Springs
                16670, -- Dragon Glyphs: Rubyscale Outpost
                16062, -- Dragon Glyphs: Rusza'thar Reach
                16058, -- Dragon Glyphs: Szar Skeleth
                16057, -- Dragon Glyphs: The Eternal Kurgans
                16063, -- Dragon Glyphs: Windsong Rise
                16576, -- Ohn'ahran Plains Glyph Hunter
            },
        },
        { -- The Azure Span
            1304,
            addon.GetMapName(2024),
            true,
            {
                16065, -- Dragon Glyphs: Azure Archives
                16068, -- Dragon Glyphs: Brackenhide Hollow
                16064, -- Dragon Glyphs: Cobalt Assembly
                16069, -- Dragon Glyphs: Drake Eye's Pond
                16672, -- Dragon Glyphs: Forkriver Crossing
                16070, -- Dragon Glyphs: Imbu
                16072, -- Dragon Glyphs: Rhonin's Shield
                16067, -- Dragon Glyphs: Lost Ruins
                16066, -- Dragon Glyphs: Ruins of Karnthar
                16073, -- Dragon Glyphs: Vakthros Range
                16673, -- Dragon Glyphs: The Fallen Course
                16071, -- Dragon Glyphs: Zelthrak Outpost
                16577, -- Azure Span Glyph Hunter
            },
        },
        { -- Thaldraszus
            1305,
            addon.GetMapName(2025),
            true,
            {
                16104, -- Dragon Glyphs: Algeth'ar Academy
                16102, -- Dragon Glyphs: Algeth'era
                16666, -- Dragon Glyphs: Gelikyr Overlook
                16667, -- Dragon Glyphs: Passage of Time
                16100, -- Dragon Glyphs: South Hold Gate
                16099, -- Dragon Glyphs: Stormshroud Peak
                16098, -- Dragon Glyphs: Temporal Conflux
                16107, -- Dragon Glyphs: Thaldraszus Apex
                16103, -- Dragon Glyphs: Tyrhold
                16101, -- Dragon Glyphs: Valdrakken
                16106, -- Dragon Glyphs: Vault of the Incarnates
                16105, -- Dragon Glyphs: Veiled Ossuary
                16578, -- Thaldraszus Glyph Hunter
            },
        },
        { -- Zaralek Cavern
            1426,
            addon.GetMapName(2133),
            true,
            {
                17510, -- Dragon Glyphs: Glimmerogg
                17511, -- Dragon Glyphs: Nal ks'kol
                17512, -- Dragon Glyphs: Loamm
                17513, -- Dragon Glyphs: Zaqali Caldera
                17514, -- Dragon Glyphs: Slitherdrake Roost
                17515, -- Dragon Glyphs: The Throughway
                17516, -- Dragon Glyphs: Acidbite Ravine
                17517, -- Dragon Glyphs: Aberrus Approach
                18150, -- Zaralek Cavern Glyph Hunter
            },
        },
        { -- Emerald Dream
            1550,
            addon.GetMapName(2200),
            true,
            {
                19296, -- Dragon Glyphs: Eye of Ysera
                19297, -- Dragon Glyphs: Furnace Coil
                19298, -- Dragon Glyphs: Smoldering Copse
                19299, -- Dragon Glyphs: Cinder Summit
                19300, -- Dragon Glyphs: Dreamsurge Basin
                19301, -- Dragon Glyphs: Amirdrassil
                19302, -- Dragon Glyphs: Whorlwing Basin
                19303, -- Dragon Glyphs: Wakeful Vista
                19306, -- Emerald Dream Glyph Hunter
            },
        },
        {
            15794, -- A New Friend
            15795, -- Together in the Skies
            15797, -- An Azure Ally
            15796, -- Cliffside Companion
            17779, -- A Serpentine Discovery
        },
    },
    { -- Dragonriding Races
        1269,
        addon.L["Dragonriding Races"],
        { -- The Waking Shores
            1293,
            addon.GetMapName(2022),
            {
                15915, -- Waking Shores: Bronze
                15916, -- Waking Shores: Silver
                15917, -- Waking Shores: Gold
                15927, -- Waking Shores Advanced: Bronze
                15928, -- Waking Shores Advanced: Silver
                15929, -- Waking Shores Advanced: Gold
                17195, -- Waking Shores Reverse: Bronze
                17196, -- Waking Shores Reverse: Silver
                17197, -- Waking Shores Reverse: Gold
                18748, -- Waking Shores Challenge: Bronze
                18749, -- Waking Shores Challenge: Silver
                18750, -- Waking Shores Challenge: Gold
            },
        },
        { -- Ohn'ahran Plains
            1285,
            addon.GetMapName(2023),
            {
                15918, -- Ohn'ahran Plains: Bronze
                15919, -- Ohn'ahran Plains: Silver
                15920, -- Ohn'ahran Plains: Gold
                15930, -- Ohn'ahran Plains Advanced: Bronze
                15931, -- Ohn'ahran Plains Advanced: Silver
                15932, -- Ohn'ahran Plains Advanced: Gold
                17198, -- Ohn'ahran Plains Reverse: Bronze
                17199, -- Ohn'ahran Plains Reverse: Silver
                17200, -- Ohn'ahran Plains Reverse: Gold
                18754, -- Ohn'ahran Plains Challenge: Bronze
                18755, -- Ohn'ahran Plains Challenge: Silver
                18756, -- Ohn'ahran Plains Challenge: Gold
            },
        },
        { -- The Azure Span
            1278,
            addon.GetMapName(2024),
            {
                15921, -- Azure Span: Bronze
                15922, -- Azure Span: Silver
                15923, -- Azure Span: Gold
                15933, -- Azure Span Advanced: Bronze
                15934, -- Azure Span Advanced: Silver
                15935, -- Azure Span Advanced: Gold
                17201, -- Azure Span Reverse: Bronze
                17202, -- Azure Span Reverse: Silver
                17203, -- Azure Span Reverse: Gold
                18757, -- Azure Span Challenge: Bronze
                18758, -- Azure Span Challenge: Silver
                18759, -- Azure Span Challenge: Gold
            },
        },
        { -- Thaldraszus
            1276,
            addon.GetMapName(2025),
            {
                15924, -- Thaldraszus: Bronze
                15925, -- Thaldraszus: Silver
                15926, -- Thaldraszus: Gold
                15936, -- Thaldraszus Advanced: Bronze
                15937, -- Thaldraszus Advanced: Silver
                15938, -- Thaldraszus Advanced: Gold
                17204, -- Thaldraszus Reverse: Bronze
                17205, -- Thaldraszus Reverse: Silver
                17206, -- Thaldraszus Reverse: Gold
                18760, -- Thaldraszus Challenge: Bronze
                18761, -- Thaldraszus Challenge: Silver
                18762, -- Thaldraszus Challenge: Gold
            },
        },
        { -- The Forbidden Reach
            1411,
            addon.GetMapName(2107),
            {
                17279, -- Forbidden Reach: Bronze
                17280, -- Forbidden Reach: Silver
                17281, -- Forbidden Reach: Gold
                17284, -- Forbidden Reach Advanced: Bronze
                17286, -- Forbidden Reach Advanced: Silver
                17287, -- Forbidden Reach Advanced: Gold
                17288, -- Forbidden Reach Reverse: Bronze
                17289, -- Forbidden Reach Reverse: Silver
                17290, -- Forbidden Reach Reverse: Gold
                17294, -- Forbidden Reach Racing Completionist
                17296, -- Forbidden Reach Racing Completionist: Silver
                17298, -- Forbidden Reach Racing Completionist: Gold
                18779, -- Forbidden Reach Challenge: Bronze
                18780, -- Forbidden Reach Challenge: Silver
                18781, -- Forbidden Reach Challenge: Gold
            },
        },
        { -- Zaralek Cavern
            1423,
            addon.GetMapName(2133),
            {
                17483, -- Zaralek Cavern: Bronze
                17484, -- Zaralek Cavern: Silver
                17485, -- Zaralek Cavern: Gold
                17486, -- Zaralek Cavern Advanced: Bronze
                17487, -- Zaralek Cavern Advanced: Silver
                17488, -- Zaralek Cavern Advanced: Gold
                17489, -- Zaralek Cavern Reverse: Bronze
                17490, -- Zaralek Cavern Reverse: Silver
                17491, -- Zaralek Cavern Reverse: Gold
                17492, -- Zaralek Cavern Racing Completionist
                17493, -- Zaralek Cavern Racing Completionist: Silver
                17494, -- Zaralek Cavern Racing Completionist: Gold
                18786, -- Zaralek Cavern Challenge: Bronze
                18787, -- Zaralek Cavern Challenge: Silver
                18788, -- Zaralek Cavern Challenge: Gold
            },
        },
        {
            15939, -- Dragon Racing Completionist: Bronze
            15940, -- Dragon Racing Completionist: Silver
            15941, -- Dragon Racing Completionist: Gold
            17330, -- Reverse Racer: Bronze
            17331, -- Reverse Racer: Silver
            17332, -- Reverse Racer: Gold
            18790, -- Dragonriding Challenge: Dragon Isles: Bronze
            18791, -- Dragonriding Challenge: Dragon Isles: Silver
            18792, -- Dragonriding Challenge: Dragon Isles: Gold
            19478, -- Now THIS is Dragon Racing!
        },
    },
    { -- Primal Storms
        1360,
        addon.L["Primal Storms"],
        {
            16492, -- Into the Storm
            16498, -- Elemental Overflow
            16499, -- Elemental Overflowing
            16500, -- Elemental Overload
            16461, -- Stormed Off
            16490, -- Storm Chaser
            16468, -- Chasing Storms in The Waking Shores
            16463, -- Thunderstorms in The Waking Shores
            16465, -- Sandstorms in The Waking Shores
            16466, -- Firestorms in The Waking Shores
            16467, -- Snowstorms in The Waking Shores
            16476, -- Chasing Storms in the Ohn'ahran Plains
            16475, -- Thunderstorms in the Ohn'ahran Plains
            16477, -- Sandstorms in the Ohn'ahran Plains
            16478, -- Firestorms in the Ohn'ahran Plains
            16479, -- Snowstorms in the Ohn'ahran Plains
            16484, -- Chasing Storms in The Azure Span
            16480, -- Thunderstorms in The Azure Span
            16481, -- Sandstorms in The Azure Span
            16482, -- Firestorms in The Azure Span
            16483, -- Snowstorms in The Azure Span
            16489, -- Chasing Storms in Thaldraszus
            16485, -- Thunderstorms in Thaldraszus
            16486, -- Sandstorms in Thaldraszus
            16487, -- Firestorms in Thaldraszus
            16488, -- Snowstorms in Thaldraszus
            16502, -- Storming the Runway
        },
    },
    { -- Dragon Isle Drake Cosmetics
        1401,
        addon.GetCategoryInfoTitle(15478),
        {
            16696, -- Renewed Proto-Drake Armor
            16697, -- Renewed Proto-Drake Head Features
            16698, -- Renewed Proto-Drake Tail Features
            16699, -- Renewed Proto-Drake Scales and Patterns
            16700, -- Renewed Proto-Drake Horns and Hair
            16701, -- Windborne Velocidrake Scales and Patterns
            16702, -- Windborne Velocidrake Armor
            16704, -- Windborne Velocidrake Horns and Fur
            16705, -- Windborne Velocidrake Head Features
            16706, -- Windborne Velocidrake Back and Tail
            16707, -- Highland Drake Scales and Patterns
            16708, -- Highland Drake Armor
            16710, -- Highland Drake Horns and Hair
            16711, -- Highland Drake Back and Tail
            16712, -- Highland Drake Head Features
            16723, -- Cliffside Wylderdrake Scales and Patterns
            16724, -- Cliffside Wylderdrake Armor
            16725, -- Cliffside Wylderdrake Horns and Manes
            16726, -- Cliffside Wylderdrake Back and Tail
            16727, -- Cliffside Wylderdrake Head Features
        },
    },
    {
        18804, -- Neltharion's Legacy
        19307, -- Dragon Isles Pathfinder
        19458, -- A World Awoken
        40382, -- Hunt the Harbinger
    },
};

local theWarWithin = { -- The War Within
    1598,
    addon.GetCategoryInfoTitle(15520),
    { -- Character
        1609,
        addon.GetCategoryInfoTitle(92),
        {
            40146, -- War Within Superior
            40147, -- War Within Epic
            19470, -- One Warband Mentor: The War Within
            19460, -- Two Warband Mentors: The War Within
            19475, -- Three Warband Mentors: The War Within
            19476, -- Four Warband Mentors: The War Within
            19477, -- Five Warband Mentors: The War Within
            40107, -- Harbinger of the Weathered
            40115, -- Harbinger of the Carved
            40118, -- Harbinger of the Runed
            40939, -- Harbinger of the Gilded
            40942, -- Weathered of the Undermine
            40943, -- Carved of the Undermine
            40944, -- Runed of the Undermine
            40945, -- Gilded of the Undermined
        },
    },
    { -- Zones
        1599,
        addon.L["Zones"],
        { -- Khaz Algar
            1642,
            addon.GetMapName(2274),
            { -- Quests
                1643,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    20596, -- Loremaster of Khaz Algar
                    20597, -- The War Within
                    41052, -- Lingering Shadows
                    40791, -- Fate of the Kirin Tor
                },
            },
            { -- Exploration
                1644,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    40430, -- Khaz Algar Flight Master
                    40702, -- Khaz Algar Glyph Hunter
                    40790, -- Khaz Algar Explorer
                    40762, -- Khaz Algar Lore Hunter
                    40250, -- The First Echo
                    40251, -- Many Echoes
                    40252, -- A Series of Echoes
                    40222, -- Echoes of Danger
                    40314, -- Fragments of Memories
                },
            },
            { -- Player vs. Player
                1645,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    40087, -- Unbound Battle
                    40088, -- A Champion's Tour: The War Within
                    40089, -- Spoiled Goods
                    40090, -- Spoiled Goods
                    40091, -- Slightly Spoiled
                    40095, -- Sparking Battle
                    40096, -- Sparking Battle
                    40097, -- Ruffious's Bid
                    40465, -- Unbound Bounty
                    40468, -- Unbound Glory
                    40466, -- Unbound Glory
                    40467, -- Unbound Glory
                },
            },
            { -- Reputation
                1646,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41169, -- Khaz Algar Diplomat
                },
            },
            {
                41555, -- All That Khaz
            }
        },
        { -- Isle of Dorn
            1611,
            addon.GetMapName(2248),
            { -- Quests
                1615,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    20118, -- The Isle of Dorn
                    20595, -- Sojourner of Isle of Dorn
                },
            },
            { -- Exploration
                1619,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    40831, -- Explore the Isle of Dorn
                    40435, -- Adventurer of the Isle of Dorn
                    40434, -- Treasures of the Isle of Dorn
                    40166, -- Isle of Dorn Glyph Hunter
                    40606, -- Flat Earthen
                },
            },
            { -- Player vs. Player
                1620,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    40083, -- Tour of Duty: Isle of Dorn
                },
            },
            { -- Reputation
                1621,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41161, -- Council of Dornogal
                    41162, -- Cornerstone of Dornogal
                },
            },
            { -- Skyriding Races
                addon.L["Skyriding Races"],
                true,
                {
                    40316, -- Isle of Dorn: Bronze
                    40317, -- Isle of Dorn: Silver
                    40318, -- Isle of Dorn: Gold
                    40319, -- Isle of Dorn Advanced: Bronze
                    40320, -- Isle of Dorn Advanced: Silver
                    40321, -- Isle of Dorn Advanced: Gold
                    40322, -- Isle of Dorn Reverse: Bronze
                    40323, -- Isle of Dorn Reverse: Silver
                    40324, -- Isle of Dorn Reverse: Gold
                },
            },
            {
                41186, -- Slate of the Union
            },
        },
        { -- The Ringing Deeps
            1612,
            addon.GetMapName(2214),
            { -- Quests
                1616,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    19560, -- The Ringing Deeps
                    40799, -- Sojourner of The Ringing Deeps
                    40507, -- Hanging Tight
                    40623, -- I Only Need One Trip
                    40630, -- For the Collective
                },
            },
            { -- Exploration
                1622,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    40825, -- Explore The Ringing Deeps
                    40837, -- Adventurer of The Ringing Deeps
                    40724, -- Treasures of The Ringing Deeps
                    40703, -- The Ringing Deeps Glyph Hunter
                    40628, -- Notable Machines
                    40473, -- Not So Quick Fix
                    40475, -- To All the Slimes I Love
                    40614, -- Gobblin' with Glublurp
                    40731, -- Panhandled
                    40504, -- Rocked to Sleep
                    40585, -- Super Size Snuffling
                    40509, -- Awakening The Machine: Wave 10
                    40586, -- Awakening The Machine: Wave 20
                    40587, -- Awakening The Machine: Wave 30
                    40588, -- Awakening The Machine: Wave 40
                    40589, -- Awakening The Machine: Wave 50
                    40662, -- It's Not Much, But It's Honest Work
                },
            },
            { -- Player vs. Player
                1623,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    40084, -- Tour of Duty: The Ringing Deeps
                },
            },
            { -- Reputation
                1624,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41165, -- Assembly of the Deeps
                    41166, -- From Many, One
                },
            },
            { -- Skyriding Races
                addon.L["Skyriding Races"],
                true,
                {
                    40325, -- The Ringing Deeps: Bronze
                    40326, -- The Ringing Deeps: Silver
                    40327, -- The Ringing Deeps: Gold
                    40328, -- The Ringing Deeps Advanced: Bronze
                    40329, -- The Ringing Deeps Advanced: Silver
                    40330, -- The Ringing Deeps Advanced: Gold
                    40331, -- The Ringing Deeps Reverse: Bronze
                    40332, -- The Ringing Deeps Reverse: Silver
                    40333, -- The Ringing Deeps Reverse: Gold
                },
            },
            {
                41187, -- Rage Aside the Machine
            },
        },
        { -- Hallowfall
            1613,
            addon.GetMapName(2215),
            { -- Quests
                1617,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    20598, -- Hallowfall
                    40844, -- Sojourner of Hallowfall
                    20594, -- Flamegard's Hope
                    40150, -- Children's Entertainer
                    40082, -- Never Enough
                    40360, -- Life on the Farm
                    40308, -- Beacon of Hope
                    40311, -- Sharing the Light
                    40312, -- Starting the Flames
                    40313, -- Igniting the Keyflames
                },
            },
            { -- Exploration
                1625,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    40826, -- Explore Hallowfall
                    40848, -- Treasures of Hallowfall
                    40851, -- Adventurer of Hallowfall
                    40704, -- Hallowfall Glyph Hunter
                    40151, -- Mereldar Menace
                    40618, -- Lost and Found
                    40625, -- The Missing Lynx
                    40622, -- Biblo Archivist
                    40729, -- Light's Gambit Champion
                },
            },
            { -- Player vs. Player
                1626,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    40085, -- Tour of Duty: Hallowfall
                },
            },
            { -- Reputation
                1627,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41167, -- Hallowfall Arathi
                    41168, -- The Flame Burns Within
                },
            },
            { -- Skyriding Races
                addon.L["Skyriding Races"],
                true,
                {
                    40334, -- Hallowfall: Bronze
                    40335, -- Hallowfall: Silver
                    40336, -- Hallowfall: Gold
                    40337, -- Hallowfall Advanced: Bronze
                    40338, -- Hallowfall Advanced: Silver
                    40339, -- Hallowfall Advanced: Gold
                    40340, -- Hallowfall Reverse: Bronze
                    40341, -- Hallowfall Reverse: Silver
                    40342, -- Hallowfall Reverse: Gold
                },
            },
            {
                41188, -- Crystal Chronicled
            },
        },
        { -- Azj-Kahet
            1614,
            addon.GetMapName(2255),
            { -- Quests
                1618,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    19559, -- Azj-Kahet
                    40636, -- Sojourner of Azj-Kahet
                    40832, -- Leave it to Weaver
                    40833, -- The General's Salute
                    40835, -- Vizier than Ever
                    40620, -- Back to the Wall
                    40869, -- Worm Theory
                },
            },
            { -- Exploration
                1628,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    40822, -- Explore Azj-Kahet
                    40828, -- Treasures of Azj-Kahet
                    40840, -- Adventurer of Azj-Kahet
                    40705, -- Azj-Kahet Glyph Hunter
                    40542, -- Smelling History
                    40634, -- You Can't Hang With Us
                    40624, -- Itsy Bitsy Spider
                    40632, -- No Harm Ever Came From Reading A Book
                    40843, -- Mine Poppin'
                    40629, -- Bookworm
                    40727, -- Skittershaw Spin
                    40633, -- The Unseeming
                },
            },
            { -- Player vs. Player
                1629,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    40086, -- Tour of Duty: Azj-Kahet
                },
            },
            { -- Reputation
                1630,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41149, -- The Severed Threads
                    41164, -- We Rise Anew
                    40874, -- The Grand Tapestry
                    40875, -- True Strength
                    40876, -- Vox Arachni
                },
            },
            { -- Skyriding Races
                addon.L["Skyriding Races"],
                true,
                {
                    40343, -- Azj-Kahet: Bronze
                    40344, -- Azj-Kahet: Silver
                    40345, -- Azj-Kahet: Gold
                    40346, -- Azj-Kahet Advanced: Bronze
                    40347, -- Azj-Kahet Advanced: Silver
                    40348, -- Azj-Kahet Advanced: Gold
                    40349, -- Azj-Kahet Reverse: Bronze
                    40350, -- Azj-Kahet Reverse: Silver
                    40351, -- Azj-Kahet Reverse: Gold
                },
            },
            {
                41189, -- Azj the World Turns
            },
        },
        { -- Siren Isle
            addon.GetMapName(2369),
            { -- Quests
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    41042, -- Siren-ity Now!
                    41043, -- Excavation Projects
                    41045, -- A Song of Secrets
                    41185, -- Siren's Squall
                },
            },
            { -- Exploration
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    41046, -- Clean Up on Isle Siren
                    41050, -- A Choir of Citrines
                    41131, -- Treasures of the Storm
                },
            },
            {
                41133, -- Isle Remember You
            },
        },
        { -- Undermine
            addon.GetMapName(2346),
            { -- Quests
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    40900, -- Undermined
                    40894, -- Sojourner of Undermine
                },
            },
            { -- Exploration
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    41587, -- Explore Undermine
                    41217, -- Treasures of Undermine
                    41216, -- Adventurer of Undermine
                    40948, -- Nine-Tenths of the Law
                    41588, -- Read Between the Lines
                    41589, -- That Can-Do Attitude
                    41708, -- You're My Friend Now
                    41214, -- Under the Echoes
                    41215, -- Echoes of Deeper Dangers
                },
            },
            { -- Player vs. Player
                1629,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    41522, -- Tour of Duty: Undermine
                },
            },
            { -- Reputation
                1630,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                },
            },
            { -- Skyrocketing Races
                addon.L["Skyrocketing Races"],
                true,
                {
                    40936, -- Undermine Skyrocketing: Bronze
                    40937, -- Undermine Skyrocketing: Silver
                    40938, -- Undermine Skyrocketing: Gold
                },
            },
            { -- Breaknecking Races
                addon.L["Breaknecking Races"],
                true,
                {
                    41081, -- Undermine Breaknecking: Bronze
                    41083, -- Undermine Breaknecking: Silver
                    41084, -- Undermine Breaknecking: Gold
                },
            },
            {
                41586, -- Going Goblin Mode
            }
        },
        {
            41201, -- You Xal Not Pass
        }
    },
    { -- Delves
        1600,
        addon.GetCategoryInfoTitle(15522),
        { -- Fungal Folly
            1658,
            addon.GetMapName(2249),
            {
                40525, -- Fungal Folly Stories
                40803, -- Fungal Folly Discoveries
            },
        },
        { -- Kriegval's Rest
            1659,
            addon.GetMapName(2250),
            {
                40526, -- Kriegval's Rest Stories
                40807, -- Kriegval's Rest Discoveries
            },
        },
        { -- Earthcrawl Mines
            1660,
            addon.GetMapName(2269),
            {
                40527, -- Earthcrawl Mines Stories
                40806, -- Earthcrawl Mines Discoveries
            },
        },
        { -- The Waterworks
            1661,
            addon.GetMapName(2251),
            {
                40528, -- The Waterworks Stories
                40816, -- The Waterworks Discoveries
            },
        },
        { -- The Dread Pit
            1662,
            addon.GetMapName(2302),
            {
                40529, -- The Dread Pit Stories
                40812, -- The Dread Pit Discoveries
            },
        },
        { -- Nightfall Sanctum
            1663,
            addon.GetMapName(2277),
            {
                40530, -- Nightfall Sanctum Stories
                40809, -- Nightfall Sanctum Discoveries
            },
        },
        { -- Mycomancer Cavern
            1664,
            addon.GetMapName(2312),
            {
                40531, -- Mycomancer Cavern Stories
                40808, -- Mycomancer Cavern Discoveries
            },
        },
        { -- The Sinkhole
            1665,
            addon.GetMapName(2301),
            {
                40532, -- The Sinkhole Stories
                40813, -- The Sinkhole Discoveries
            },
        },
        { -- Skittering Breach
            1666,
            addon.GetMapName(2310),
            {
                40533, -- Skittering Breach Stories
                40810, -- Skittering Breach Discoveries
            },
        },
        { -- The Underkeep
            1667,
            addon.GetMapName(2299),
            {
                40534, -- The Underkeep Stories
                40815, -- The Underkeep Discoveries
            },
        },
        { -- Tak-Rethan Abyss
            1668,
            addon.GetMapName(2259),
            {
                40535, -- Tak-Rethan Abyss Stories
                40811, -- Tak-Rethan Abyss Discoveries
            },
        },
        { -- The Spiral Weave
            1669,
            addon.GetMapName(2347),
            {
                40536, -- The Spiral Weave Stories
                40814, -- The Spiral Weave Discoveries
            },
        },
        { -- Zekvir's Lair
            1675,
            addon.GetMapName(2348),
            {
                40732, -- Heavy-Handed
                40103, -- My First Nemesis
                40431, -- Hunting the Hunter
                40433, -- Let Me Solo Him: Zekvir
            },
        },
        { -- Excavation Site 9
            addon.GetMapName(2396),
            {
                41098, -- Excavation Site 9 Stories
                41100, -- Excavation Site 9 Discoveries
            },
        },
        { -- Sidestreet Sluice
            addon.GetMapName(2420),
            {
                41099, -- Sidestreet Sluice Stories
                41101, -- Sidestreet Sluice Discoveries
            },
        },
        { -- Demolition Dome
            addon.GetMapName(2425),
            {
                40732, -- Heavy-Handed
                41530, -- My New Nemesis
                41529, -- Breaking the Bank
                41210, -- Let Me Solo Him: The Underpin
            },
        },
        {
            40631, -- War Within Delves: Tier 1
            40512, -- War Within Delves: Tier 2
            40514, -- War Within Delves: Tier 3
            40725, -- War Within Delves: Endgame
            40515, -- War Within Delves: Tier 4 (Season 1)
            40516, -- War Within Delves: Tier 5 (Season 1)
            40517, -- War Within Delves: Tier 6 (Season 1)
            40518, -- War Within Delves: Tier 7 (Season 1)
            40519, -- War Within Delves: Tier 8 (Season 1)
            40520, -- War Within Delves: Tier 9 (Season 1)
            40521, -- War Within Delves: Tier 10 (Season 1)
            40726, -- War Within Delves: Tier 11 (Season 1)
            41191, -- War Within Delves: Tier 4 (Season 2)
            41192, -- War Within Delves: Tier 5 (Season 2)
            41198, -- War Within Delves: Tier 6 (Season 2)
            41193, -- War Within Delves: Tier 7 (Season 2)
            41194, -- War Within Delves: Tier 8 (Season 2)
            41195, -- War Within Delves: Tier 9 (Season 2)
            41196, -- War Within Delves: Tier 10 (Season 2)
            41197, -- War Within Delves: Tier 11 (Season 2)
            40537, -- Delve Loremaster: War Within
            40506, -- Leave No Treasure Unfound
            40445, -- Sporesweeper
            40446, -- I TAKE Candle!
            40452, -- Just Keep Swimming
            40453, -- Spider Senses
            40454, -- Daystormer
            40438, -- Glory of the Delver
            40437, -- Delver of the Depths
            40447, -- Delver of the Depths II
            40448, -- Delver of the Depths III
            40449, -- Delver of the Depths IV
            40455, -- Buddy System
            40450, -- Buddy System II
            40451, -- Buddy System III
            40456, -- Buddy System IV
            40457, -- Buddy System V
            40461, -- Buddy System VI
            41537, -- Buddy System VII
            41723, -- Buddy System VIII
            40100, -- Undying Caver
            40098, -- Immortal Spelunker
            40459, -- I've Got a Flying Machine!
            40789, -- Flying in Style
            40524, -- Good Deed Delver
            40763, -- I'm not a Thief, I'm a Treasure Hunter
            41097, -- Curiosity Never Killed the Looter
            40458, -- Stranger Delves
            40538, -- Brann Development
            40820, -- Raisin' Brann
            40523, -- On Brand
            40635, -- Branntastic
            41106, -- Algari Delver Damage Dealer
            41109, -- Algari Delver Damage Dealer II
            41110, -- Algari Delver Damage Dealer III
            41107, -- Algari Delver Healer
            41111, -- Algari Delver Healer II
            41112, -- Algari Delver Healer III
            41108, -- Algari Delver Tank
            41113, -- Algari Delver Tank II
            41114, -- Algari Delver Tank III
            41115, -- Algari Delver
            41116, -- Algari Delver II
            41709, -- Journey's End (Season 2)
        },
    },
    { -- Dungeons
        1601,
        addon.GetCategoryInfoTitle(15272),
        { -- The Rookery
            1632,
            addon.GetInstanceInfoName(1268),
            {
                40621, -- The Rookery
                40637, -- Heroic: The Rookery
                40642, -- Mythic: The Rookery
                20579, -- Keystone Hero: The Rookery
            },
        },
        { -- The Stonevault
            1633,
            addon.GetInstanceInfoName(1269),
            {
                40643, -- The Stonevault
                40644, -- Heroic: The Stonevault
                40648, -- Mythic: The Stonevault
                20580, -- Keystone Hero: The Stonevault
            },
        },
        { -- Priory of the Sacred Flame
            1634,
            addon.GetInstanceInfoName(1267),
            {
                40590, -- Priory of the Sacred Flame
                40592, -- Heroic: Priory of the Sacred Flame
                40596, -- Mythic: Priory of the Sacred Flame
                20581, -- Keystone Hero: Priory of the Sacred Flame
            },
        },
        { -- City of Threads
            1635,
            addon.GetInstanceInfoName(1274),
            {
                40376, -- City of Threads
                40377, -- Heroic: City of Threads
                40379, -- Mythic: City of Threads
                20582, -- Keystone Hero: City of Threads
            },
        },
        { -- Cinderbrew Meadery
            1636,
            addon.GetInstanceInfoName(1272),
            {
                40361, -- Cinderbrew Meadery
                40363, -- Heroic: Cinderbrew Meadery
                40366, -- Mythic: Cinderbrew Meadery
                20583, -- Keystone Hero: Cinderbrew Meadery
            },
        },
        { -- Darkflame Cleft
            1637,
            addon.GetInstanceInfoName(1210),
            {
                40427, -- Darkflame Cleft
                40428, -- Heroic: Darkflame Cleft
                40429, -- Mythic: Darkflame Cleft
                20584, -- Keystone Hero: Darkflame Cleft
            },
        },
        { -- The Dawnbreaker
            1638,
            addon.GetInstanceInfoName(1270),
            {
                40599, -- The Dawnbreaker
                40601, -- Heroic: The Dawnbreaker
                40604, -- Mythic: The Dawnbreaker
                20585, -- Keystone Hero: The Dawnbreaker
            },
        },
        { -- Ara-Kara, City of Echoes
            1639,
            addon.GetInstanceInfoName(1271),
            {
                40370, -- Ara-Kara, City of Echoes
                40374, -- Heroic: Ara-Kara, City of Echoes
                40375, -- Mythic: Ara-Kara, City of Echoes
                20586, -- Keystone Hero: Ara-Kara, City of Echoes
            },
        },
        { -- Operation: Floodgate
            addon.GetInstanceInfoName(1298),
            {
                41339, -- Operation: Floodgate
                41340, -- Heroic: Operation: Floodgate
                41341, -- Mythic: Operation: Floodgate
                41348, -- Keystone Hero: Operation: Floodgate
            },
        },
        {
            40141, -- Algari Dungeon Tank
            40140, -- Algari Dungeon Healer
            40139, -- Algari Dungeon Damage Dealer
            40138, -- Algari Dungeoneer
            20523, -- The War Within Keystone Explorer: Season One
            20524, -- The War Within Keystone Conqueror: Season One
            20525, -- The War Within Keystone Master: Season One
            20526, -- The War Within Keystone Hero: Season One
            20589, -- Tempered Hero: The War Within Season 1
            40660, -- The War Within Season 1: Spelunker Supreme
            40723, -- Web-Wrapped in the Finest Silks
            40949, -- The War Within Keystone Explorer: Season Two
            40950, -- The War Within Keystone Conqueror: Season Two
            41533, -- The War Within Keystone Master: Season Two
            40952, -- The War Within Keystone Hero: Season Two
            40951, -- The War Within Keystone Legend: Season Two
            40954, -- Enterprising Hero: The War Within Season Two
            40911, -- The War Within Season 2: Master Blaster
        },
    },
    { -- Raids
        1602,
        addon.GetCategoryInfoTitle(15271),
        { -- Nerub-ar Palace
            1648,
            addon.GetInstanceInfoName(1273),
            { -- Glory
                1649,
                addon.L["Glory"],
                {
                    40261, -- Slimy Yet Satisfying
                    40260, -- You Can't See Me
                    40255, -- Sik Parry Bro
                    40262, -- Cowabunga
                    40263, -- Would You Still /love Me if I Was a Worm...
                    40264, -- Kill Streak
                    40730, -- Love is in the Lair
                    40266, -- Missed 'Em by That Much
                },
            },
            { -- Mythic
                1650,
                addon.L["Mythic"],
                {
                    40236, -- Mythic: Ulgrax the Devourer
                    40237, -- Mythic: The Bloodbound Horror
                    40238, -- Mythic: Sikran, Captain of the Sureki
                    40239, -- Mythic: Rasha'nan
                    40240, -- Mythic: Broodtwister Ovi'nax
                    40241, -- Mythic: Nexus-Princess Ky'veza
                    40242, -- Mythic: The Silken Court
                    40243, -- Mythic: Queen Ansurek
                },
            },
            {
                40247, -- The Skittering Battlements
                40248, -- Secrets of Nerub-ar Palace
                40249, -- A Queen's Fall
                40244, -- Nerub-ar Palace
                40245, -- Heroic: Nerub-ar Palace
                40246, -- Mythic: Nerub-ar Palace
                40253, -- Ahead of the Curve: Queen Ansurek
                40254, -- Cutting Edge: Queen Ansurek
                40469, -- I'm Bringing Nerub-ack
                40660, -- The War Within Season 1: Spelunker Supreme
                40723, -- Web-Wrapped in the Finest Silks
            },
        },
        { -- Liberation of Undermine
            addon.GetInstanceInfoName(1296),
            { -- Glory
                addon.L["Glory"],
                {
                    41208, -- Hold My Gear!
                    41554, -- The Splash Zone
                    41338, -- Just /Dance
                    41596, -- Garbage In, Garbage Out
                    41711, -- Conveyor Slayer
                    41119, -- One Rank Higher
                    41120, -- Two Ranks Higher
                    41121, -- Three Ranks Higher
                    41122, -- Best In Class
                    41337, -- Sleep with the Fishes
                    41347, -- Scheming on a Thing
                },
            },
            { -- Mythic
                addon.L["Mythic"],
                {
                    41229, -- Mythic: Vexie and the Geargrinders
                    41230, -- Mythic: Cauldron of Carnage
                    41231, -- Mythic: Rik Reverb
                    41232, -- Mythic: Stix Bunkjunker
                    41233, -- Mythic: Sprocketmonger Lockenstock
                    41234, -- Mythic: The One-Armed Bandit
                    41235, -- Mythic: Mug'Zee, Heads of Security
                    41236, -- Mythic: Chrome King Gallywix
                },
            },
            {
                41225, -- Shock and Awesome
                41226, -- Maniacal Machinist
                41227, -- Beating the Odds
                41228, -- Fall of the Chrome King
                41222, -- Liberation of Undermine
                41223, -- Heroic: Liberation of Undermine
                41224, -- Mythic: Liberation of Undermine
                41298, -- Ahead of the Curve: Chrome King Gallywix
                41297, -- Cutting Edge: Chrome King Gallywix
                41694, -- Flarendo's Biggest Fan
                41695, -- Torq's Biggest Fan
                41211, -- A Good Day to Dye Hard
                41525, -- Can You Please Spell "Gobanna?"
                40911, -- The War Within Season 2: Master Blaster
                -- 40723, -- Web-Wrapped in the Finest Silks
            },
        },
        {
            40232, -- Glory of the Nerub-ar Raider
            41286, -- Glory of the Liberation of Undermine Raider
        },
    },
    { -- Professions
        1603,
        addon.GetCategoryInfoTitle(169),
        { -- Alchemy
            1631,
            addon.GetCategoryInfoTitle(15489),
            true,
            {
                19704, -- Overflowing Algari Flasks
                19716, -- Plentiful Algari Potions
            },
        },
        { -- Cooking
            1607,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                19414, -- Algari Cook
            },
        },
        { -- Fishing
            1608,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                19415, -- Algari Fisherman
                40476, -- 10 Algari Seekerthread
                40480, -- 20 Algari Seekerthread
                40484, -- 30 Algari Seekerthread
                40485, -- 40 Algari Seekerthread
                40487, -- 50 Algari Seekerthread
                40488, -- 60 Algari Seekerthread
                40489, -- 70 Algari Seekerthread
                40490, -- 80 Algari Seekerthread
                40491, -- 90 Algari Seekerthread
                40492, -- 100 Algari Seekerthread
                40494, -- 10 Algari Anglerthread
                40495, -- 20 Algari Anglerthread
                40497, -- 30 Algari Anglerthread
                40499, -- 40 Algari Anglerthread
                40502, -- 50 Algari Anglerthread
                40496, -- 60 Algari Anglerthread
                40498, -- 70 Algari Anglerthread
                40500, -- 80 Algari Anglerthread
                40503, -- 90 Algari Anglerthread
                40501, -- 100 Algari Anglerthread
                40539, -- The Derby Dash
            },
        },
        {
            19408, -- Professional Algari Master
            19409, -- Working Underground
            19515, -- Algari Master of Many
            19410, -- Algari Master of All
        },
    },
    { -- Pet Battles
        1604,
        addon.GetCategoryInfoTitle(15117),
        {
            40194, -- Khaz Algar Safari
            40153, -- Battle on Khaz Algar
            40154, -- Aquatic Battler of Khaz Algar
            40155, -- Beast Battler of Khaz Algar
            40156, -- Critter Battler of Khaz Algar
            40157, -- Dragonkin Battler of Khaz Algar
            40158, -- Elemental Battler of Khaz Algar
            40161, -- Flying Battler of Khaz Algar
            40162, -- Humanoid Battler of Khaz Algar
            40163, -- Magic Battler of Khaz Algar
            40164, -- Mechanical Battler of Khaz Algar
            40165, -- Undead Battler of Khaz Algar
            40980, -- Family Battler of Khaz Algar
            41092, -- Undermine Safari
            41542, -- Aquatic Battler of Undermine
            41543, -- Beast Battler of Undermine
            41541, -- Critter Battler of Undermine
            41544, -- Dragonkin Battler of Undermine
            41545, -- Elemental Battler of Undermine
            41546, -- Flying Battler of Undermine
            41547, -- Humanoid Battler of Undermine
            41548, -- Magic Battler of Undermine
            41549, -- Mechanical Battler of Undermine
            41550, -- Undead Battler of Undermine
            41551, -- Family Battler of Undermine
        },
    },
    { -- Skyriding Races
        1606,
        addon.L["Skyriding Races"],
        { -- Isle of Dorn
            1654,
            addon.GetMapName(2248),
            {
                40316, -- Isle of Dorn: Bronze
                40317, -- Isle of Dorn: Silver
                40318, -- Isle of Dorn: Gold
                40319, -- Isle of Dorn Advanced: Bronze
                40320, -- Isle of Dorn Advanced: Silver
                40321, -- Isle of Dorn Advanced: Gold
                40322, -- Isle of Dorn Reverse: Bronze
                40323, -- Isle of Dorn Reverse: Silver
                40324, -- Isle of Dorn Reverse: Gold
            },
        },
        { -- The Ringing Deeps
            1655,
            addon.GetMapName(2214),
            {
                40325, -- The Ringing Deeps: Bronze
                40326, -- The Ringing Deeps: Silver
                40327, -- The Ringing Deeps: Gold
                40328, -- The Ringing Deeps Advanced: Bronze
                40329, -- The Ringing Deeps Advanced: Silver
                40330, -- The Ringing Deeps Advanced: Gold
                40331, -- The Ringing Deeps Reverse: Bronze
                40332, -- The Ringing Deeps Reverse: Silver
                40333, -- The Ringing Deeps Reverse: Gold
            },
        },
        { -- Hallowfall
            1656,
            addon.GetMapName(2215),
            {
                40334, -- Hallowfall: Bronze
                40335, -- Hallowfall: Silver
                40336, -- Hallowfall: Gold
                40337, -- Hallowfall Advanced: Bronze
                40338, -- Hallowfall Advanced: Silver
                40339, -- Hallowfall Advanced: Gold
                40340, -- Hallowfall Reverse: Bronze
                40341, -- Hallowfall Reverse: Silver
                40342, -- Hallowfall Reverse: Gold
            },
        },
        { -- Azj-Kahet
            1657,
            addon.GetMapName(2255),
            {
                40343, -- Azj-Kahet: Bronze
                40344, -- Azj-Kahet: Silver
                40345, -- Azj-Kahet: Gold
                40346, -- Azj-Kahet Advanced: Bronze
                40347, -- Azj-Kahet Advanced: Silver
                40348, -- Azj-Kahet Advanced: Gold
                40349, -- Azj-Kahet Reverse: Bronze
                40350, -- Azj-Kahet Reverse: Silver
                40351, -- Azj-Kahet Reverse: Gold
            },
        },
        {
            40352, -- Khaz Algar Completionist: Bronze
            40353, -- Khaz Algar Completionist: Silver
            40354, -- Khaz Algar Completionist: Gold
        },
    },
    { -- Skyrocketing Races
        addon.L["Skyrocketing Races"],
        { -- Undermine
            addon.GetMapName(2346),
            {
                40936, -- Undermine Skyrocketing: Bronze
                40937, -- Undermine Skyrocketing: Silver
                40938, -- Undermine Skyrocketing: Gold
            },
        },
    },
    { -- Breaknecking Races
        addon.L["Breaknecking Races"],
        { -- Undermine
            addon.GetMapName(2346),
            {
                41081, -- Undermine Breaknecking: Bronze
                41083, -- Undermine Breaknecking: Silver
                41084, -- Undermine Breaknecking: Gold
            },
        },
    },
    {
        40231, -- The War Within Pathfinder
    },
};

KrowiAF.CategoryData.Expansions = { -- TAB - Expansions
    883,
    addon.L["Expansions"],
    {
        TabName = "Expansions",
    },
    crossExpansion,
    classic,
    theBurningCrusade,
    wrathOfTheLichKing,
    cataclysm,
    mistsOfPandaria,
    warlordsOfDreanor,
    legion,
    battleForAzeroth,
    shadowlands,
    dragonflight,
    theWarWithin,
};