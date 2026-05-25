local _, addon = ...;

local crossExpansion = { -- Cross-Expansion
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
};

KrowiAF.CategoryData.Expansions = { -- TAB - Expansions
    883,
    addon.L["Expansions"],
    {
        TabName = "Expansions",
    },
    crossExpansion,
};