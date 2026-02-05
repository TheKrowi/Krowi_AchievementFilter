local _, addon = ...
addon.Data.CategoryData = {}
addon.Data.CategoryData.Shared = {}
local shared = addon.Data.CategoryData.Shared

KrowiAF.CategoryData.Expansions = { -- TAB - Expansions
    883,
    addon.L["Expansions"],
    {
        TabName = "Expansions",
    },
    { -- Cross-Expansion
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
                42191, -- Safer Deposit
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
                61506, -- Allied Race: Haranir (Reward: Haranir Race Unlocked)
                61942, -- Heritage of the Haranir (Reward: Haranir Heritage Armor)
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
                    16731, -- Court is Now in Session
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
                61211, -- Welcome Home
                61308, -- Score a Decor
                61309, -- Amateur Antiquarian
                61310, -- Casual Collector
                61311, -- Ready to Remodel
                61312, -- Center Stager
                61313, -- Well-Travelled Collection
                61314, -- Furniture Historian
                61315, -- Array of Antiquities
                61316, -- Custom Cabinets
                61317, -- Domicile Designer
                61318, -- Fully Furnished
                62371, -- Couponing for Beginners
                62373, -- Coupon Collector
                62374, -- You Get The Best Deals Anywhere
                62375, -- Buying in Bulk
                62376, -- Extreme Couponing
                62377, -- A Fist Full of Coupons
                62378, -- A Few Coupons More
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
    }
};

shared.TheWarWithin = {}
local theWarWithin = shared.TheWarWithin

theWarWithin.MythicPlus = {
    { -- Season 1
        addon.L["Season"] .. " " .. 1,
        true,
        {
            20586, -- Keystone Hero: Ara-Kara, City of Echoes
            20582, -- Keystone Hero: City of Threads
            20585, -- Keystone Hero: The Dawnbreaker
            20580, -- Keystone Hero: The Stonevault
            15047, -- Keystone Hero: Mists of Tirna Scithe
            15045, -- Keystone Hero: The Necrotic Wake
            20587, -- Keystone Hero: Siege of Boralus
            20588, -- Keystone Hero: Grim Batol
            20523, -- The War Within Keystone Explorer: Season One
            20524, -- The War Within Keystone Conqueror: Season One
            20525, -- The War Within Keystone Master: Season One
            20526, -- The War Within Keystone Hero: Season One
            20589, -- Tempered Hero: The War Within Season 1
        },
    },
    { -- Season 2
        addon.L["Season"] .. " " .. 2,
        true,
        {
            20583, -- Keystone Hero: Cinderbrew Meadery
            20584, -- Keystone Hero: Darkflame Cleft
            20581, -- Keystone Hero: Priory of the Sacred Flame
            20579, -- Keystone Hero: The Rookery
            41348, -- Keystone Hero: Operation: Floodgate
            15050, -- Keystone Hero: Theater of Pain
            40966, -- Keystone Hero: Operation: Mechagon - Workshop
            40965, -- Keystone Hero: The MOTHERLODE!!
            40949, -- The War Within Keystone Explorer: Season Two
            40950, -- The War Within Keystone Conqueror: Season Two
            41533, -- The War Within Keystone Master: Season Two
            40952, -- The War Within Keystone Hero: Season Two
            40951, -- The War Within Keystone Legend: Season Two
            42139, -- The Enterprising Tank
            42141, -- The Enterprising Healer
            42144, -- The Enterprising Damage Dealer
            42148, -- The Enterprising Dungeon Master
            40954, -- Enterprising Hero: The War Within Season Two
        },
    },
    { -- Season 3
        addon.L["Season"] .. " " .. 3,
        {
            addon.L["KeystoneResilience"],
            true,
            {
                42149, -- The War Within Season 3: Resilient Keystone 12
                42150, -- The War Within Season 3: Resilient Keystone 13
                42151, -- The War Within Season 3: Resilient Keystone 14
                42152, -- The War Within Season 3: Resilient Keystone 15
                42153, -- The War Within Season 3: Resilient Keystone 16
                42154, -- The War Within Season 3: Resilient Keystone 17
                42155, -- The War Within Season 3: Resilient Keystone 18
                42156, -- The War Within Season 3: Resilient Keystone 19
                42157, -- The War Within Season 3: Resilient Keystone 20
                42158, -- The War Within Season 3: Resilient Keystone 21
                42159, -- The War Within Season 3: Resilient Keystone 22
                42160, -- The War Within Season 3: Resilient Keystone 23
                42161, -- The War Within Season 3: Resilient Keystone 24
                42162, -- The War Within Season 3: Resilient Keystone 25
                42802, -- The War Within Season 3: Resilient Keystone 26
                42803, -- The War Within Season 3: Resilient Keystone 27
                42804, -- The War Within Season 3: Resilient Keystone 28
                42805, -- The War Within Season 3: Resilient Keystone 29
                42806, -- The War Within Season 3: Resilient Keystone 30
            }
        },
        {
            20586, -- Keystone Hero: Ara-Kara, City of Echoes
            20585, -- Keystone Hero: The Dawnbreaker
            20581, -- Keystone Hero: Priory of the Sacred Flame
            41348, -- Keystone Hero: Operation: Floodgate
            42173, -- Keystone Hero: Eco-Dome Al'dani
            15048, -- Keystone Hero: Halls of Atonement
            15500, -- Keystone Hero: Tazavesh, the Veiled Market
            42169, -- The War Within Keystone Explorer: Season Three
            42170, -- The War Within Keystone Conqueror: Season Three
            41973, -- The War Within Keystone Master: Season Three
            42171, -- The War Within Keystone Hero: Season Three
            42172, -- The War Within Keystone Legend: Season Three
            61874, -- The Unbound Tank
            61875, -- The Unbound Healer
            61876, -- The Unbound Damage Dealer
            61877, -- The Unbound Dungeon Master
            42174, -- Unbound Hero: The War Within Season Three
        },
    },
    {
        40660, -- The War Within Season 1: Spelunker Supreme
        40723, -- Web-Wrapped in the Finest Silks
        40911, -- The War Within Season 2: Master Blaster
        41665, -- Dressed to the Mines
        41937, -- The War Within Season 3: Voidborne Victor
        42325, -- Void Wear Prohibited
    },
}

shared.GetTheWarWithinMythicPlus = function(categoryName)
    return {
        categoryName,
        unpack(theWarWithin.MythicPlus)
    }
end

shared.Midnight = {}
local midnight = shared.Midnight

midnight.MythicPlus = {
    { -- Season 1
        addon.L["Season"] .. " " .. 1,
        {
            addon.L["KeystoneResilience"],
            true,
            {
                61233, -- Midnight Season 1: Resilient Keystone 12
                61235, -- Midnight Season 1: Resilient Keystone 13
                61236, -- Midnight Season 1: Resilient Keystone 14
                61237, -- Midnight Season 1: Resilient Keystone 15
                61239, -- Midnight Season 1: Resilient Keystone 16
                61240, -- Midnight Season 1: Resilient Keystone 17
                61241, -- Midnight Season 1: Resilient Keystone 18
                61242, -- Midnight Season 1: Resilient Keystone 19
                61243, -- Midnight Season 1: Resilient Keystone 20
                61244, -- Midnight Season 1: Resilient Keystone 21
                61245, -- Midnight Season 1: Resilient Keystone 22
                61246, -- Midnight Season 1: Resilient Keystone 23
                61247, -- Midnight Season 1: Resilient Keystone 24
                61248, -- Midnight Season 1: Resilient Keystone 25
                61249, -- Midnight Season 1: Resilient Keystone 26
                61250, -- Midnight Season 1: Resilient Keystone 27
                61251, -- Midnight Season 1: Resilient Keystone 28
                61252, -- Midnight Season 1: Resilient Keystone 29
                61253, -- Midnight Season 1: Resilient Keystone 30
            }
        },
        {
            61267, -- Keystone Hero: Magisters' Terrace
            61269, -- Keystone Hero: Maisara Caverns
            61268, -- Keystone Hero: Nexus-Point Xenas
            61262, -- Keystone Hero: Windrunner Spire
            16643, -- Keystone Hero: Algeth'ar Academy
            61270, -- Keystone Hero: Seat of the Triumvirate
            61272, -- Keystone Hero: Skyreach
            61271, -- Keystone Hero: Pit of Saron
            61254, -- Midnight Keystone Explorer: Season One
            61255, -- Midnight Keystone Conqueror: Season One
            61256, -- Midnight Keystone Master: Season One
            61257, -- Midnight Keystone Hero: Season One
            61258, -- Midnight Keystone Legend: Season One
            61259, -- Umbral Hero: Midnight Season One
        },
    },
}

shared.GetMidnightMythicPlus = function(categoryName)
    return {
        categoryName,
        unpack(midnight.MythicPlus),
    }
end