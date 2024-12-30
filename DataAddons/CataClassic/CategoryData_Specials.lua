local _, addon = ...;

KrowiAF.CategoryData.Specials = { -- TAB - Specials
    971,
    addon.L["Specials"],
    {
        TabName = "Specials",
    },
    { -- Bur's Mount Collection
        972,
        addon.L["Bur's Mount Collection"],
        { -- Collections
            976,
            addon.GetCategoryInfoTitle(15246),
            {
                2141, -- Stable Keeper
                2142, -- Filling Up The Barn
                2143, -- Leading the Cavalry
                2536, -- Mountain o' Mounts
                2537, -- Mountain o' Mounts
                7860, -- We're Going to Need More Saddles
                7862, -- We're Going to Need More Saddles
                8304, -- Mount Parade
                8302, -- Mount Parade
                9598, -- Mountacular
                9599, -- Mountacular
                10356, -- Lord of the Reins
                10355, -- Lord of the Reins
                12932, -- No Stable Big Enough
                12931, -- No Stable Big Enough
                12933, -- A Horde of Hoofbeats
                12934, -- A Horde of Hoofbeats
                15834, -- Thanks for the Carry!
                15833, -- Thanks for the Carry!
                9713, -- Awake the Drakes
            },
        },
        { -- Vendor
            985,
            addon.L["Vendor"],
            {
                2076, -- Armored Brown Bear
                2077, -- Wooly Mammoth
                2078, -- Traveler's Tundra Mammoth
                4888, -- One Hump or Two?
                7386, -- Grand Expedition Yak
                8092, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
                9909, -- Heirloom Hoarder
                14183, -- Conspicuous Consumption
            },
        },
        { -- Professions
            986,
            addon.GetCategoryInfoTitle(169),
            {
                2097, -- Get to the Choppa!
                5749, -- Vial of the Sands
            },
        },
        { -- Events
            987,
            addon.L["Events"],
            {
                416, -- Scarab Lord
                980, -- The Horseman's Reins
                3496, -- A Brew-FAST Mount
                4627, -- X-45 Heartbreaker
                2144, -- "What a Long, Strange Trip It's Been"
                2145, -- "What A Long, Strange Trip It's Been"
                9496, -- Warlord's Deathwheel
                9550, -- "Boldly, You Sought the Power of Ragnaros"
                13931, -- "Memories of Fel, Frost and Fire"
            },
        },
        { -- Achievements
            989,
            addon.L["Achievements"],
            {
                879, -- Old School Ride
                5767, -- Scourer of the Eternal Sands
                11066, -- Underbelly Tycoon
                13517, -- Two Sides to Every Tale
                13638, -- Undersea Usurper
                13994, -- Through the Depths of Visions
                14751, -- The Gang's All Here
                14752, -- Things To Do When You're Dead
                14570, -- Twisting Corridors: Layer 8
                15254, -- The Jailer's Gauntlet: Layer 4
                15089, -- Flawless Master (Layer 12)
                15322, -- Flawless Master (Layer 16)
                15064, -- Breaking the Chains
                15402, -- Cyphers of the First Ones
                15336, -- From A to Zereth
            },
        },
        { -- Dungeons
            979,
            addon.GetCategoryInfoTitle(15272),
            { -- Drops
                983,
                addon.L["Drops"],
                true,
                {
                    729, -- Deathcharger's Reins
                    883, -- Reins of the Raven Lord
                    884, -- Swift White Hawkstrider
                },
            },
            { -- Glory
                980,
                addon.L["Glory"],
                true,
                {
                    2136, -- Glory of the Hero
                    4845, -- Glory of the Cataclysm Hero
                    6927, -- Glory of the Pandaria Hero
                    9396, -- Glory of the Draenor Hero
                    11163, -- Glory of the Legion Hero
                    12812, -- Glory of the Wartorn Hero
                    14322, -- Glory of the Shadowlands Hero
                },
            },
            {
                6375, -- Challenge Conqueror: Silver
                8898, -- Challenge Warlord: Silver
                14145, -- Battle for Azeroth Keystone Master: Season Four
                14532, -- Shadowlands Keystone Master: Season One
                15078, -- Shadowlands Keystone Master: Season Two
                15499, -- Shadowlands Keystone Master: Season Three
                15178, -- Fake It 'Til You Make It
            },
        },
        { -- Raids
            982,
            addon.GetCategoryInfoTitle(15271),
            { -- Drops
                984,
                addon.L["Drops"],
                true,
                {
                    880, -- Swift Zulian Tiger
                    881, -- Swift Razzashi Raptor
                    424, -- Why? Because It's Red
                    882, -- Fiery Warhorse's Reins
                    885, -- Ashes of Al'ar
                    430, -- Amani War Bear
                    2081, -- Grand Black War Mammoth
                    4626, -- And I'll Form the Head!
                    4625, -- Invincible's Reins
                },
            },
            { -- Glory
                981,
                addon.L["Glory"],
                true,
                {
                    12401, -- Glory of the Ulduar Raider
                    2957, -- Glory of the Ulduar Raider (10 player)
                    2958, -- Glory of the Ulduar Raider (25 player)
                    4602, -- Glory of the Icecrown Raider (10 player)
                    4603, -- Glory of the Icecrown Raider (25 player)
                    4853, -- Glory of the Cataclysm Raider
                    5828, -- Glory of the Firelands Raider
                    6169, -- Glory of the Dragon Soul Raider
                    6932, -- Glory of the Pandaria Raider
                    8124, -- Glory of the Thundering Raider
                    8454, -- Glory of the Orgrimmar Raider
                    8985, -- Glory of the Draenor Raider
                    10149, -- Glory of the Hellfire Raider
                    11180, -- Glory of the Legion Raider
                    11987, -- Glory of the Argus Raider
                    12806, -- Glory of the Uldir Raider
                    13315, -- Glory of the Dazar'alor Raider
                    13687, -- Glory of the Eternal Raider
                    14146, -- Glory of the Ny'alotha Raider
                    14355, -- Glory of the Nathria Raider
                    15130, -- Glory of the Dominant Raider
                    15491, -- Glory of the Sepulcher Raider
                },
            },
            {
                8398, -- Ahead of the Curve: Garrosh Hellscream (10 player)
                8399, -- Ahead of the Curve: Garrosh Hellscream (25 player)
                15684, -- Fates of the Shadowlands Raids
            },
        },
        { -- PvP
            977,
            addon.GetCategoryInfoTitle(95),
            { -- Gladiator
                978,
                addon.GetAchievmentName(2091),
                true,
                {
                    886, -- Swift Nether Drake
                    887, -- Merciless Nether Drake
                    888, -- Vengeful Nether Drake
                    2316, -- Brutal Nether Drake
                    3096, -- Deadly Gladiator's Frost Wyrm
                    3756, -- Furious Gladiator's Frost Wyrm
                    3757, -- Relentless Gladiator's Frost Wyrm
                    4600, -- Wrathful Gladiator's Frost Wyrm
                    6003, -- Vicious Gladiator's Twilight Drake
                    6321, -- Ruthless Gladiator's Twilight Drake
                    6322, -- Ruthless Gladiator's Twilight Drake
                    6741, -- Cataclysmic Gladiator's Twilight Drake
                    8216, -- Malevolent Gladiator's Cloud Serpent
                    8678, -- Tyrannical Gladiator's Cloud Serpent
                    8705, -- Grievous Gladiator's Cloud Serpent
                    8707, -- Prideful Gladiator's Cloud Serpent
                    9229, -- Primal Gladiator's Felblood Gronnling
                    10137, -- Wild Gladiator's Felblood Gronnling
                    10146, -- Warmongering Gladiator's Felblood Gronnling
                    10999, -- Vindictive Gladiator's Storm Dragon
                    11000, -- Fearless Gladiator's Storm Dragon
                    11001, -- Cruel Gladiator's Storm Dragon
                    11002, -- Ferocious Gladiator's Storm Dragon
                    13450, -- Fierce Gladiator's Storm Dragon
                    12139, -- Dominant Gladiator's Storm Dragon
                    12140, -- Demonic Gladiator's Storm Dragon
                    12961, -- Gladiator: Battle for Azeroth Season 1
                    13093, -- Dread Gladiator's Proto-Drake
                    13212, -- Gladiator: Battle for Azeroth Season 2
                    13202, -- Sinister Gladiator's Proto-Drake
                    13647, -- Gladiator: Battle for Azeroth Season 3
                    13632, -- Notorious Gladiator's Proto-Drake
                    13967, -- Gladiator: Battle for Azeroth Season 4
                    13958, -- Corrupted Gladiator's Proto-Drake
                    14689, -- Gladiator: Shadowlands Season 1
                    14816, -- Sinful Gladiator's Soul Eater
                    14972, -- Gladiator: Shadowlands Season 2
                    14999, -- Unchained Gladiator's Soul Eater
                    15352, -- Gladiator: Shadowlands Season 3
                    15384, -- Cosmic Gladiator's Soul Eater
                    15605, -- Gladiator: Shadowlands Season 4
                    15612, -- Eternal Gladiator's Soul Eater
                    15957, -- Gladiator: Dragonflight Season 1
                    16730, -- Crimson Gladiator's Drake
                    17740, -- Gladiator: Dragonflight Season 2
                    17778, -- Obsidian Gladiator's Slitherdrake
                    19091, -- Gladiator: Dragonflight Season 3
                    19295, -- Verdant Gladiator's Slitherdrake
                    19490, -- Gladiator: Dragonflight Season 4
                    19503, -- Draconic Gladiator's Drake
                    40393, -- Gladiator: The War Within Season 1
                    40398, -- Forged Gladiator's Fel Bat
                },
            },
            {
                12895, -- Honor Level 15
                12903, -- Honor Level 40
                12906, -- Honor Level 70
                12910, -- Honor Level 125
                12911, -- Honor Level 150
                12914, -- Honor Level 250
                12917, -- Honor Level 500
                9238, -- Primal Combatant
                9236, -- Primal Combatant
                11474, -- "Free For All, More For Me"
            },
        },
        { -- Recruit-a-Friend
            988,
            addon.L["Recruit-a-Friend"],
            {
                1436, -- Friends In High Places
                4832, -- Friends In Even Higher Places
                8213, -- Friends In Places Higher Yet
                8794, -- Friends In Places Even Higher Than That
                9925, -- Friends In Places Yet Even Higher Than That
            },
        },
        {
            3356, -- Winterspring Frostsaber
            3357, -- Venomhide Ravasaur
            12866, -- 100 Exalted Reputations
        },
    },
    { -- The Entitled Player
        1043,
        addon.L["The Entitled"] .. " " .. (UnitName("player")),
        { -- Classic
            1045,
            addon.GetCategoryInfoTitle(14864),
            { -- Reputation
                1065,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    948, -- Ambassador of the Alliance
                    762, -- Ambassador of the Horde
                    871, -- "Avast Ye, Admiral!"
                    2336, -- Insane in the Membrane
                },
            },
            {
                15579, -- Return to Lordaeron
            },
        },
        { -- Wrath of the Lich King
            1047,
            addon.GetCategoryInfoTitle(14866),
            { -- Reputation
                1054,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    942, -- The Diplomat
                    943, -- The Diplomat
                    4598, -- The Ashen Verdict
                    953, -- Guardian of Cenarius
                    945, -- The Argent Champion
                    2764, -- Exalted Champion of Stormwind
                    2765, -- Exalted Champion of Orgrimmar
                    2763, -- Exalted Champion of Ironforge
                    2769, -- Exalted Champion of the Undercity
                    2760, -- Exalted Champion of Darnassus
                    2768, -- Exalted Champion of Thunder Bluff
                    2761, -- Exalted Champion of the Exodar
                    2767, -- Exalted Champion of Silvermoon City
                    2762, -- Exalted Champion of Gnomeregan
                    2766, -- Exalted Champion of Sen'jin
                    2817, -- Exalted Argent Champion of the Alliance
                    2816, -- Exalted Argent Champion of the Horde
                },
            },
            { -- Raids
                1056,
                addon.GetCategoryInfoTitle(15271),
                true,
                {
                    2051, -- The Twilight Zone (10 player)
                    2054, -- The Twilight Zone (25 player)
                    1658, -- Champion of the Frozen Wastes
                    3316, -- Herald of the Titans
                    3036, -- Observed (10 player)
                    3037, -- Observed (25 player)
                    4583, -- Bane of the Fallen King
                    4597, -- The Frozen Throne (25 player)
                    4584, -- The Light of Dawn
                },
            },
        },
        { -- Cataclysm
            1048,
            addon.GetCategoryInfoTitle(15072),
            { -- Exploration
                1058,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    5879, -- Veteran of the Molten Front
                },
            },
            { -- Reputation
                1059,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    5827, -- Avengers of Hyjal
                },
            },
            { -- Raids
                1060,
                addon.GetCategoryInfoTitle(15271),
                true,
                {
                    5116, -- Heroic: Nefarian
                    5121, -- Heroic: Sinestra
                    5123, -- Heroic: Al'Akir
                    5506, -- Defender of a Shattered World
                    5803, -- Heroic: Ragnaros
                    6177, -- Destroyer's End
                    6116, -- Heroic: Madness of Deathwing
                },
            },
            {
                5767, -- Scourer of the Eternal Sands
            },
        },
        { -- Other
            1084,
            addon.L["Other"],
            { -- Quests
                1085,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    978, -- 3000 Quests Completed
                    1681, -- The Loremaster
                    1682, -- The Loremaster
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                1086,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    46, -- Universal Explorer
                    9924, -- Field Photographer
                    12439, -- Priority Mail
                },
            },
            { -- Reputation
                1088,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    1015, -- 40 Exalted Reputations
                    6742, -- 60 Exalted Reputations
                    12864, -- 80 Exalted Reputations
                    12866, -- 100 Exalted Reputations
                },
            },
            { -- Dungeons
                1087,
                addon.GetCategoryInfoTitle(15272),
                true,
                {
                    4477, -- Looking For Many
                },
            },
            { -- Professions
                1092,
                addon.GetCategoryInfoTitle(169),
                true,
                {
                    1516, -- Accomplished Angler
                    7306, -- Master of Pandaren Cooking
                    9464, -- Professional Draenor Master
                    4855, -- What was Briefly Yours is Now Mine
                    4856, -- It Belongs in a Museum!
                    1563, -- Hail to the Chef
                    1784, -- Hail to the Chef
                },
            },
            { -- Events
                1094,
                addon.L["Events"],
                true,
                {
                    913, -- To Honor One's Elders
                    1707, -- Fool For Love
                    1693, -- Fool For Love
                    2797, -- Noble Gardener
                    2798, -- Noble Gardener
                    1793, -- For the Children
                    1038, -- The Flame Warden
                    1039, -- The Flame Keeper
                    1684, -- Brewmaster
                    1683, -- Brewmaster
                    1656, -- Hallowed Be Thy Name
                    1657, -- Hallowed Be Thy Name
                    3478, -- Pilgrim
                    3656, -- Pilgrim
                    1692, -- Merrymaker
                    1691, -- Merrymaker
                },
            },
            { -- PvP
                1093,
                addon.GetCategoryInfoTitle(95),
                { -- Honor
                true,
                    1096,
                        addon.GetCategoryInfoTitle(15266),
                true,
                    {
                        12901, -- Honor Level 25
                        12904, -- Honor Level 50
                        12907, -- Honor Level 80
                        12909, -- Honor Level 100
                        12913, -- Honor Level 200
                        12915, -- Honor Level 300
                        870, -- 100000 Honorable Kills
                        5363, -- 250000 Honorable Kills
                    },
                },
                { -- Battlegrounds
                    1098,
                        addon.GetCategoryInfoTitle(153),
                true,
                    {
                        907, -- The Justicar
                        714, -- The Conqueror
                        8360, -- Master of Deepwind Gorge
                        12412, -- Master of Seething Shore
                        230, -- Battlemaster
                        1175, -- Battlemaster
                        8052, -- Khan
                        8055, -- Khan
                    },
                },
                { -- Rated
                    1099,
                        addon.L["Rated"],
                true,
                    {
                        5328, -- Veteran of the Alliance
                        5325, -- Veteran of the Horde
                        5329, -- Warbound Veteran of the Alliance
                        5326, -- Warbringer of the Horde
                        5330, -- Private
                        5345, -- Scout
                        5331, -- Corporal
                        5346, -- Grunt
                        5332, -- Sergeant
                        5347, -- Sergeant
                        5333, -- Master Sergeant
                        5348, -- Senior Sergeant
                        5334, -- Sergeant Major
                        5349, -- First Sergeant
                        5335, -- Knight
                        5350, -- Stone Guard
                        5336, -- Knight-Lieutenant
                        5351, -- Blood Guard
                        5337, -- Knight-Captain
                        5352, -- Legionnaire
                        5359, -- Knight-Champion
                        5338, -- Centurion
                        5339, -- Lieutenant Commander
                        5353, -- Champion
                        5340, -- Commander
                        5354, -- Lieutenant General
                        5341, -- Marshal
                        5355, -- General
                        5357, -- Field Marshal
                        5342, -- Warlord
                        5343, -- Grand Marshal
                        5356, -- High Warlord
                    },
                },
            },
        },
    },
    { -- Realm First!
        1105,
        addon.L["Realm First!"],
        { -- Leveling
            1106,
            addon.L["Leveling"],
            { -- Level 80
                1107,
                addon.L["Level 80"],
                true,
                {
                    457, -- Realm First! Level 80 (Legacy)
                    459, -- Realm First! Level 80 Warrior (Legacy)
                    465, -- Realm First! Level 80 Paladin (Legacy)
                    462, -- Realm First! Level 80 Hunter (Legacy)
                    458, -- Realm First! Level 80 Rogue (Legacy)
                    464, -- Realm First! Level 80 Priest (Legacy)
                    461, -- Realm First! Level 80 Death Knight (Legacy)
                    467, -- Realm First! Level 80 Shaman (Legacy)
                    460, -- Realm First! Level 80 Mage (Legacy)
                    463, -- Realm First! Level 80 Warlock (Legacy)
                    466, -- Realm First! Level 80 Druid (Legacy)
                    1408, -- Realm First! Level 80 Human (Legacy)
                    1410, -- Realm First! Level 80 Orc (Legacy)
                    1407, -- Realm First! Level 80 Dwarf (Legacy)
                    1409, -- Realm First! Level 80 Night Elf (Legacy)
                    1413, -- Realm First! Level 80 Forsaken (Legacy)
                    1411, -- Realm First! Level 80 Tauren (Legacy)
                    1404, -- Realm First! Level 80 Gnome (Legacy)
                    1412, -- Realm First! Level 80 Troll (Legacy)
                    1405, -- Realm First! Level 80 Blood Elf (Legacy)
                    1406, -- Realm First! Level 80 Draenei (Legacy)
                },
            },
            { -- Level 85
                1108,
                addon.L["Level 85"],
                true,
                {
                    4999, -- Realm First! Level 85 (Legacy)
                    5007, -- Realm First! Level 85 Warrior (Legacy)
                    5001, -- Realm First! Level 85 Paladin (Legacy)
                    5004, -- Realm First! Level 85 Hunter (Legacy)
                    5008, -- Realm First! Level 85 Rogue (Legacy)
                    5002, -- Realm First! Level 85 Priest (Legacy)
                    5005, -- Realm First! Level 85 Death Knight (Legacy)
                    4998, -- Realm First! Level 85 Shaman (Legacy)
                    5006, -- Realm First! Level 85 Mage (Legacy)
                    5003, -- Realm First! Level 85 Warlock (Legacy)
                    5000, -- Realm First! Level 85 Druid (Legacy)
                },
            },
        },
        { -- Professions
            1110,
            addon.GetCategoryInfoTitle(169),
            { -- 450 skill
                1111,
                addon.L["450 skill"],
                true,
                {
                    1415, -- Realm First! Grand Master Alchemist
                    1420, -- Realm First! Grand Master Angler
                    5395, -- Realm First! Grand Master Archaeologist
                    1414, -- Realm First! Grand Master Blacksmith
                    1416, -- Realm First! Grand Master Cook
                    1417, -- Realm First! Grand Master Enchanter
                    1418, -- Realm First! Grand Master Engineer
                    1421, -- Realm First! Grand Master Herbalist
                    1423, -- Realm First! Grand Master Jewelcrafter
                    1424, -- Realm First! Grand Master Leatherworker
                    1419, -- Realm First! Grand Master Medic
                    1425, -- Realm First! Grand Master Miner
                    1422, -- Realm First! Grand Master Scribe
                    1426, -- Realm First! Grand Master Skinner
                    1427, -- Realm First! Grand Master Tailor
                },
            },
            { -- 525 skill
                1112,
                addon.L["525 skill"],
                true,
                {
                    5381, -- Realm First! Illustrious Alchemist
                    5387, -- Realm First! Illustrious Angler
                    5396, -- Realm First! Illustrious Archaeologist
                    5382, -- Realm First! Illustrious Blacksmith
                    5383, -- Realm First! Illustrious Cook
                    5384, -- Realm First! Illustrious Enchanter
                    5385, -- Realm First! Illustrious Engineer
                    5388, -- Realm First! Illustrious Herbalist
                    5390, -- Realm First! Illustrious Jewelcrafter
                    5391, -- Realm First! Illustrious Leatherworker
                    5386, -- Realm First! Illustrious Medic
                    5392, -- Realm First! Illustrious Miner
                    5389, -- Realm First! Illustrious Scribe
                    5393, -- Realm First! Illustrious Skinner
                    5394, -- Realm First! Illustrious Tailor
                },
            },
        },
        { -- Reputation
            1116,
            true,
            addon.GetCategoryInfoTitle(201),
            {
                1463, -- Realm First! Northrend Vanguard
                6829, -- Realm First! Pandaren Ambassador
            },
        },
        { -- Raids
            1115,
            true,
            addon.GetCategoryInfoTitle(15271),
            {
                1402, -- Realm First! Conqueror of Naxxramas
                456, -- Realm First! Obsidian Slayer
                1400, -- Realm First! Magic Seeker
                3117, -- Realm First! Death's Demise
                3259, -- Realm First! Celestial Defender
                4078, -- Realm First! Grand Crusader
                4576, -- Realm First! Fall of the Lich King
            },
        },
    },
    { -- Promotions
        1117,
        addon.GetCategoryInfoTitle(15268),
        { -- BlizzCon
            1118,
            true,
            addon.L["BlizzCon"],
            {
                411, -- Murky
                412, -- Murloc Costume
                415, -- Big Blizzard Bear
                3536, -- The Marine Marine
                5378, -- Deathy
                6185, -- Murkablo
                8793, -- Murkalot
                9763, -- Grommloc
                10322, -- Murkidan
                11294, -- Murloc Battlemasters
                11931, -- Rides of War
                13138, -- Flying Colors
                14027, -- Battle for Mrrglroth
                14904, -- Netherwhelp Online
                18250, -- Ysergle The Dreamurk
            },
        },
        { -- Collector's Edition
            1119,
            true,
            addon.L["Collector's Edition"],
            {
                662, -- Collector's Edition: Mini-Diablo
                663, -- Collector's Edition: Panda
                664, -- Collector's Edition: Zergling
                665, -- Collector's Edition: Netherwhelp
                683, -- Collector's Edition: Frost Wyrm Whelp
                5377, -- Collector's Edition: Lil' Deathwing
                6849, -- Collector's Edition: Imperial Quilen
                6848, -- Collector's Edition: Lucky Quilen Cub
                8916, -- Collector's Edition: Dread Raven
                8917, -- Collector's Edition: Dread Hatchling
                10320, -- Collector's Edition: Illidari Felstalker
                10321, -- Collector's Edition: Nibbles
                12229, -- Collector's Edition: Seabraid Stallion
                12230, -- Collector's Edition: Gilded Ravasaur
                12232, -- Collector's Edition: Tottle
                14283, -- Heroic Edition: Ensorcelled Everwyrm
                16332, -- The Perfect Pebble
                17314, -- Heroic Edition: Tangled Dreamweaver
                19027, -- Heroic Edition: Algarian Stormrider
                18928, -- Storm Rider: Bronze
                18929, -- Storm Rider: Silver
                18931, -- Storm Rider: Gold
                19030, -- Squally
            },
        },
        { -- StarCraft II
            1122,
            true,
            addon.L["StarCraft II"],
            {
                4824, -- Collector's Edition: Mini Thor
                7842, -- Collector's Edition: Baneling
                10309, -- Collector's Edition: Zeradar
                12454, -- Salute to StarCraft
            },
        },
        {
            414, -- Tyrael's Hilt
            10537, -- Patron of War
            10657, -- Fledgling Hero of Warcraft
            11210, -- Fight for the Alliance
            11211, -- Fight for the Horde
            15594, -- Fearless Spectator
            17305, -- Trading Post: Dragonflight
            19029, -- Lil' Maggz
            19031, -- Fyrn
        },
    },
    { -- Ta's Pet Collection
        1346,
        addon.L["Ta's Pet Collection"],
        { -- Pet Battles
            1353,
            addon.GetCategoryInfoTitle(15117),
            {
                1250, -- "Shop Smart, Shop Pet...Smart"
                2516, -- Lil' Game Hunter
                5876, -- Petting Zoo
                5877, -- Menagerie
                5875, -- Littlest Pet Shop
                7521, -- Time to Open a Pet Store
                6582, -- Pro Pet Mob
                9069, -- An Awfully Big Adventure
                8297, -- Merciless Pet Brawler
                8298, -- Vengeful Pet Brawler
                8300, -- Brutal Pet Brawler
            },
        },
        { -- Wrath of the Lich King
            1378,
            addon.GetCategoryInfoTitle(14866),
            {
                1956, -- Higher Learning
            },
        },
        { -- Cataclysm
            1352,
            addon.GetCategoryInfoTitle(15072),
            {
                5449, -- Rock Lover
            },
        },
        {
            8820, -- WoW's 10th Anniversary
            3478, -- Pilgrim
        },
    },
};