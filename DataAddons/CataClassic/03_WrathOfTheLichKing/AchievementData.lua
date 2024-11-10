local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_00_02"] = {
    {KrowiAF.SetAchievementPatch, 3, 0, 2},
    {6}, -- Level 10
    {7}, -- Level 20
    {8}, -- Level 30
    {9}, -- Level 40
    { -- Level 50
        10,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 60
        11,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 70
        12,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 80
        13,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {15}, -- Plenty of Pets
    { -- Did Somebody Order a Knuckle Sandwich?
        16,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {31}, -- A Simple Re-Quest
    {32}, -- 2000 Quests Completed
    { -- Nothing Boring About Borean
        33,
        faction.Alliance,
        1358,
    },
    { -- I've Toured the Fjord
        34,
        faction.Alliance,
        1356,
    },
    { -- Might of Dragonblight
        35,
        faction.Alliance,
        1359,
    },
    {36}, -- The Empire of Zul'Drak
    { -- Fo' Grizzle My Shizzle
        37,
        faction.Alliance,
        1357,
    },
    {38}, -- The Summit of Storm Peaks
    {39}, -- Into the Basin
    {40}, -- Icecrown: The Final Goal
    { -- Loremaster of Northrend
        41,
        faction.Alliance,
        1360,
    },
    {42}, -- Explore Eastern Kingdoms
    {43}, -- Explore Kalimdor
    {44}, -- Explore Outland
    {45}, -- Explore Northrend
    {46}, -- World Explorer
    { -- Disgracin' The Basin
        73,
        {
            IsPvP = true,
        },
    },
    {116}, -- Professional Journeyman
    {121}, -- Journeyman Cook
    {122}, -- Expert Cook
    {123}, -- Artisan Cook
    {124}, -- Master Cook
    {125}, -- Grand Master Cook
    {126}, -- Journeyman Fisherman
    {127}, -- Expert Fisherman
    {128}, -- Artisan Fisherman
    {129}, -- Master Fisherman
    {130}, -- Grand Master Fisherman
    { -- Journeyman in First Aid
        131,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Expert in First Aid
        132,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Artisan in First Aid
        133,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Master in First Aid
        134,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Grand Master in First Aid
        135,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {137}, -- Stocking Up
    {141}, -- Ultimate Triage
    {144}, -- The Lurker Above
    {150}, -- The Fishing Diplomat
    {153}, -- The Old Gnome and the Sea
    { -- Arathi Basin Victory
        154,
        {
            IsPvP = true,
        },
    },
    { -- Arathi Basin Veteran
        155,
        {
            IsPvP = true,
        },
    },
    { -- Territorial Dominance
        156,
        {
            IsPvP = true,
        },
    },
    { -- To The Rescue!
        157,
        {
            IsPvP = true,
        },
    },
    { -- Me and the Cappin' Makin' it Happen
        158,
        {
            IsPvP = true,
        },
    },
    { -- Let's Get This Done
        159,
        {
            IsPvP = true,
        },
    },
    { -- Resilient Victory
        161,
        {
            IsPvP = true,
        },
    },
    { -- We Had It All Along *cough*
        162,
        {
            IsPvP = true,
        },
    },
    { -- Arathi Basin Perfection
        165,
        {
            IsPvP = true,
        },
    },
    { -- Warsong Gulch Victory
        166,
        {
            IsPvP = true,
        },
    },
    { -- Warsong Gulch Veteran
        167,
        {
            IsPvP = true,
        },
    },
    { -- Warsong Gulch Perfection
        168,
        {
            IsPvP = true,
        },
    },
    { -- Capture the Flag
        199,
        {
            IsPvP = true,
        },
    },
    { -- Persistent Defender
        200,
        {
            IsPvP = true,
        },
    },
    { -- Warsong Expedience
        201,
        {
            IsPvP = true,
        },
    },
    { -- Quick Cap
        202,
        faction.Alliance,
        1502,
        true,
    },
    { -- Not In My House
        203,
        faction.Alliance,
        1251,
        true,
    },
    { -- Ironman
        204,
        {
            IsPvP = true,
        },
    },
    { -- Supreme Defender
        206,
        faction.Alliance,
        1252,
        true,
    },
    { -- Save The Day
        207,
        {
            IsPvP = true,
        },
    },
    { -- Eye of the Storm Victory
        208,
        {
            IsPvP = true,
        },
    },
    { -- Eye of the Storm Veteran
        209,
        {
            IsPvP = true,
        },
    },
    { -- Storm Glory
        211,
        {
            IsPvP = true,
        },
    },
    { -- Storm Capper
        212,
        {
            IsPvP = true,
        },
    },
    { -- Stormtrooper
        213,
        {
            IsPvP = true,
        },
    },
    { -- Flurry
        214,
        {
            IsPvP = true,
        },
    },
    { -- Bound for Glory
        216,
        {
            IsPvP = true,
        },
    },
    { -- Alterac Valley Victory
        218,
        {
            IsPvP = true,
        },
    },
    { -- Alterac Valley Veteran
        219,
        {
            IsPvP = true,
        },
    },
    { -- Stormpike Perfection
        220,
        faction.Alliance,
        873,
        true,
    },
    { -- Alterac Grave Robber
        221,
        {
            IsPvP = true,
        },
    },
    { -- Tower Defense
        222,
        {
            IsPvP = true,
        },
    },
    { -- The Sickly Gazelle
        223,
        {
            IsPvP = true,
        },
    },
    { -- Loyal Defender
        224,
        faction.Horde,
        1151,
        true,
    },
    { -- Everything Counts
        225,
        faction.Alliance,
        1164,
        true,
    },
    { -- The Alterac Blitz
        226,
        {
            IsPvP = true,
        },
    },
    { -- Damage Control
        227,
        {
            IsPvP = true,
        },
    },
    { -- The Grim Reaper
        229,
        {
            IsPvP = true,
        },
    },
    { -- Battlemaster
        230,
        faction.Alliance,
        1175,
        true,
    },
    { -- Wrecking Ball
        231,
        {
            IsPvP = true,
        },
    },
    { -- Bloodthirsty Berserker
        233,
        {
            IsPvP = true,
        },
    },
    { -- An Honorable Kill
        238,
        {
            IsPvP = true,
        },
    },
    { -- 25000 Honorable Kills
        239,
        {
            IsPvP = true,
        },
    },
    { -- That Takes Class
        245,
        {
            IsPvP = true,
        },
    },
    { -- Know Thy Enemy
        246,
        faction.Alliance,
        1005,
        true,
    },
    { -- "Make Love, Not Warcraft"
        247,
        {
            IsPvP = true,
        },
    },
    { -- Sunday's Finest
        248,
        {
            {"Event", 181},
        },
    },
    { -- Dressed for the Occasion
        249,
        {
            {"Event", 181},
        },
    },
    { -- With a Little Helper from My Friends
        252,
        {
            IsPvP = true,
            {"Event", 141},
        },
    },
    { -- Bring Me The Head of... Oh Wait
        255,
        {
            {"Event", 324},
        },
    },
    { -- Scrooge
        259,
        faction.Horde,
        1255,
        {
            {"Event", 141},
        },
    },
    { -- Charming
        260,
        {
            {"Before", "Version", {10, 2, 5}},
        },
    },
    { -- Ice the Frost Lord
        263,
        {
            {"Event", 341},
        },
    },
    { -- Burning Hot Pole Dance
        271,
        {
            {"Event", 341},
        },
    },
    { -- Torch Juggler
        272,
        {
            {"Event", 341},
        },
    },
    { -- On Metzen!
        273,
        {
            {"Event", 141},
        },
    },
    { -- Veteran Nanny
        275,
        {
            {"Event", 201},
        },
    },
    { -- 'Tis the Season
        277,
        {
            {"Event", 141},
        },
    },
    { -- Simply Abominable
        279,
        {
            {"Event", 141},
        },
    },
    { -- The Masquerade
        283,
        {
            {"Event", 324},
        },
    },
    { -- A Mask for All Occasions
        284,
        {
            {"Event", 324},
        },
    },
    { -- Out With It
        288,
        {
            {"Event", 324},
        },
    },
    { -- The Savior of Hallow's End
        289,
        {
            {"Event", 324},
        },
    },
    { -- Check Your Head
        291,
        {
            {"Event", 324},
        },
    },
    { -- Sinister Calling
        292,
        {
            {"Event", 324},
        },
    },
    { -- Disturbing the Peace
        293,
        {
            {"Event", 372},
        },
    },
    { -- Direbrewfest
        295,
        {
            {"Event", 372},
        },
    },
    { -- "Have Keg, Will Travel"
        303,
        {
            {"Event", 372},
        },
    },
    {306}, -- Master Angler of Azeroth
    { -- City Defender
        388,
        faction.Alliance,
        1006,
        true,
    },
    { -- Gurubashi Arena Master
        389,
        {
            IsPvP = true,
        },
    },
    { -- Gurubashi Arena Grand Master
        396,
        {
            IsPvP = true,
        },
    },
    { -- Step Into The Arena
        397,
        {
            IsPvP = true,
        },
    },
    { -- Mercilessly Dedicated
        398,
        {
            IsPvP = true,
        },
    },
    { -- Just the Two of Us: 1550
        399,
        {
            IsPvP = true,
        },
    },
    { -- Just the Two of Us: 1750
        400,
        {
            IsPvP = true,
        },
    },
    { -- Just the Two of Us: 2000
        401,
        {
            IsPvP = true,
        },
    },
    { -- Three's Company: 1550
        402,
        {
            IsPvP = true,
        },
    },
    { -- Three's Company: 1750
        403,
        {
            IsPvP = true,
        },
    },
    { -- High Five: 2000
        404,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Three's Company: 2000
        405,
        {
            IsPvP = true,
        },
    },
    { -- High Five: 1550
        406,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- High Five: 1750
        407,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Hot Streak
        408,
        {
            IsPvP = true,
        },
    },
    { -- Last Man Standing
        409,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Murky
        411,
        {
            {"Never"},
        },
    },
    { -- Murloc Costume
        412,
        {
            {"Never"},
        },
    },
    { -- Tyrael's Hilt
        414,
        {
            {"Never"},
        },
    },
    { -- Big Blizzard Bear
        415,
        {
            {"Never"},
        },
    },
    { -- Scarab Lord
        416,
        {
            {"Never"},
        },
    },
    { -- Merciless Gladiator
        418,
        {
            IsPvP = true,
            {"PvP Season", 2},
        },
    },
    { -- Vengeful Gladiator
        419,
        {
            IsPvP = true,
            {"PvP Season", 3},
        },
    },
    { -- Brutal Gladiator
        420,
        {
            IsPvP = true,
            {"PvP Season", 4},
        },
    },
    {424}, -- Why? Because It's Red
    { -- "Atiesh, Greatstaff of the Guardian"
        425,
        {
            {"Never"},
        },
    },
    {426}, -- Warglaives of Azzinoth
    {428}, -- "Thunderfury, Blessed Blade of the Windseeker"
    {429}, -- "Sulfuras, Hand of Ragnaros"
    { -- Amani War Bear
        430,
        {
            {"Never"},
        },
    },
    { -- Hand of A'dal
        431,
        {
            {"Never"},
        },
    },
    { -- Champion of the Naaru
        432,
        {
            {"Never"},
        },
    },
    { -- Grand Marshal
        433,
        faction.Alliance,
        443,
        true,
        {
            {"Never"},
        },
    },
    { -- Field Marshal
        434,
        faction.Alliance,
        445,
        true,
        {
            {"Never"},
        },
    },
    { -- Commander
        435,
        faction.Alliance,
        444,
        true,
        {
            {"Never"},
        },
    },
    { -- Lieutenant Commander
        436,
        faction.Alliance,
        447,
        true,
        {
            {"Never"},
        },
    },
    { -- Knight-Champion
        437,
        faction.Alliance,
        448,
        true,
        {
            {"Never"},
        },
    },
    { -- Knight-Captain
        438,
        faction.Alliance,
        469,
        true,
        {
            {"Never"},
        },
    },
    { -- Knight
        439,
        faction.Alliance,
        451,
        true,
        {
            {"Never"},
        },
    },
    { -- Sergeant Major
        440,
        faction.Alliance,
        452,
        true,
        {
            {"Never"},
        },
    },
    { -- Master Sergeant
        441,
        faction.Alliance,
        450,
        true,
        {
            {"Never"},
        },
    },
    { -- Private
        442,
        faction.Alliance,
        454,
        true,
        {
            {"Never"},
        },
    },
    { -- High Warlord
        443,
        faction.Horde,
        433,
        true,
        {
            {"Never"},
        },
    },
    { -- Lieutenant General
        444,
        faction.Horde,
        435,
        true,
        {
            {"Never"},
        },
    },
    { -- Warlord
        445,
        faction.Horde,
        434,
        true,
        {
            {"Never"},
        },
    },
    { -- General
        446,
        faction.Horde,
        473,
        true,
        {
            {"Never"},
        },
    },
    { -- Champion
        447,
        faction.Horde,
        436,
        true,
        {
            {"Never"},
        },
    },
    { -- Centurion
        448,
        faction.Horde,
        437,
        true,
        {
            {"Never"},
        },
    },
    { -- Blood Guard
        449,
        faction.Horde,
        472,
        true,
        {
            {"Never"},
        },
    },
    { -- Senior Sergeant
        450,
        faction.Horde,
        441,
        true,
        {
            {"Never"},
        },
    },
    { -- Stone Guard
        451,
        faction.Horde,
        439,
        true,
        {
            {"Never"},
        },
    },
    { -- First Sergeant
        452,
        faction.Horde,
        440,
        true,
        {
            {"Never"},
        },
    },
    { -- Sergeant
        453,
        faction.Horde,
        471,
        true,
        {
            {"Never"},
        },
    },
    { -- Scout
        454,
        faction.Horde,
        442,
        true,
        {
            {"Never"},
        },
    },
    { -- Realm First! Obsidian Slayer
        456,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80
        457,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Rogue
        458,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Warrior
        459,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Mage
        460,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Death Knight
        461,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Hunter
        462,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Warlock
        463,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Priest
        464,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Paladin
        465,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Druid
        466,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Shaman
        467,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Grunt
        468,
        faction.Horde,
        470,
        true,
        {
            {"Never"},
        },
    },
    { -- Legionnaire
        469,
        faction.Horde,
        438,
        true,
        {
            {"Never"},
        },
    },
    { -- Corporal
        470,
        faction.Alliance,
        468,
        true,
        {
            {"Never"},
        },
    },
    { -- Sergeant
        471,
        faction.Alliance,
        453,
        true,
        {
            {"Never"},
        },
    },
    { -- Knight-Lieutenant
        472,
        faction.Alliance,
        449,
        true,
        {
            {"Never"},
        },
    },
    { -- Marshal
        473,
        faction.Alliance,
        446,
        true,
        {
            {"Never"},
        },
    },
    {477}, -- Utgarde Keep
    {478}, -- The Nexus
    {479}, -- The Culling of Stratholme
    {480}, -- Azjol-Nerub
    {481}, -- Ahn'kahet: The Old Kingdom
    {482}, -- Drak'Tharon Keep
    {483}, -- The Violet Hold
    {484}, -- Gundrak
    {485}, -- Halls of Stone
    {486}, -- Halls of Lightning
    {487}, -- The Oculus
    {488}, -- Utgarde Pinnacle
    {489}, -- Heroic: Utgarde Keep
    {490}, -- Heroic: The Nexus
    {491}, -- Heroic: Azjol-Nerub
    {492}, -- Heroic: Ahn'kahet: The Old Kingdom
    {493}, -- Heroic: Drak'Tharon Keep
    {494}, -- Heroic: The Violet Hold
    {495}, -- Heroic: Gundrak
    {496}, -- Heroic: Halls of Stone
    {497}, -- Heroic: Halls of Lightning
    {498}, -- Heroic: The Oculus
    {499}, -- Heroic: Utgarde Pinnacle
    {500}, -- Heroic: The Culling of Stratholme
    {503}, -- 50 Quests Completed
    {504}, -- 100 Quests Completed
    {505}, -- 250 Quests Completed
    {506}, -- 500 Quests Completed
    {507}, -- 1000 Quests Completed
    {508}, -- 1500 Quests Completed
    { -- 10000 Honorable Kills
        509,
        {
            IsPvP = true,
        },
    },
    { -- 5000 Honorable Kills
        512,
        {
            IsPvP = true,
        },
    },
    { -- 100 Honorable Kills
        513,
        {
            IsPvP = true,
        },
    },
    { -- 500 Honorable Kills
        515,
        {
            IsPvP = true,
        },
    },
    { -- 1000 Honorable Kills
        516,
        {
            IsPvP = true,
        },
    },
    {518}, -- 30 Exalted Reputations
    {519}, -- 25 Exalted Reputations
    {520}, -- 20 Exalted Reputations
    {521}, -- 15 Exalted Reputations
    {522}, -- Somebody Likes Me
    {523}, -- 5 Exalted Reputations
    {524}, -- 10 Exalted Reputations
    {545}, -- Shave and a Haircut
    {546}, -- Safe Deposit
    {547}, -- Veteran of the Wrathgate
    { -- Epic
        556,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Superior
        557,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Greedy
        558,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Needy
        559,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Deadliest Catch
        560,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {561}, -- D.E.H.T.A's Little P.I.T.A.
    {562}, -- The Arachnid Quarter (10 player)
    {563}, -- The Arachnid Quarter (25 player)
    {564}, -- The Construct Quarter (10 player)
    {565}, -- The Construct Quarter (25 player)
    {566}, -- The Plague Quarter (10 player)
    {567}, -- The Plague Quarter (25 player)
    {568}, -- The Military Quarter (10 player)
    {569}, -- The Military Quarter (25 player)
    {572}, -- Sapphiron's Demise (10 player)
    {573}, -- Sapphiron's Demise (25 player)
    {574}, -- Kel'Thuzad's Defeat (10 player)
    {575}, -- Kel'Thuzad's Defeat (25 player)
    {576}, -- The Fall of Naxxramas (10 player)
    {577}, -- The Fall of Naxxramas (25 player)
    {578}, -- The Dedicated Few (10 player)
    {579}, -- The Dedicated Few (25 player)
    { -- Alterac Valley All-Star
        582,
        {
            IsPvP = true,
        },
    },
    { -- Arathi Basin All-Star
        583,
        {
            IsPvP = true,
        },
    },
    { -- Arathi Basin Assassin
        584,
        {
            IsPvP = true,
        },
    },
    { -- Stormy Assassin
        587,
        {
            IsPvP = true,
        },
    },
    { -- Wrath of the Horde
        603,
        faction.Horde,
        604,
        true,
    },
    { -- Wrath of the Alliance
        604,
        faction.Alliance,
        603,
        true,
    },
    { -- A Coin of Ancestry
        605,
        {
            {"Event", 327},
        },
    },
    { -- 5 Coins of Ancestry
        606,
        {
            {"Event", 327},
        },
    },
    { -- 10 Coins of Ancestry
        607,
        {
            {"Event", 327},
        },
    },
    { -- 25 Coins of Ancestry
        608,
        {
            {"Event", 327},
        },
    },
    { -- 50 Coins of Ancestry
        609,
        {
            {"Event", 327},
        },
    },
    { -- Death to the Warchief!
        610,
        faction.Alliance,
        615,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Bleeding Bloodhoof
        611,
        faction.Alliance,
        616,
        true,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Downing the Dark Lady
        612,
        faction.Alliance,
        617,
        true,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Killed in Quel'Thalas
        613,
        faction.Alliance,
        618,
        true,
    },
    { -- For The Alliance!
        614,
        faction.Alliance,
        619,
        true,
    },
    { -- Storming Stormwind
        615,
        faction.Horde,
        610,
        true,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Overthrow the Council
        616,
        faction.Horde,
        611,
        true,
    },
    { -- Immortal No More
        617,
        faction.Horde,
        612,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Putting Out the Light
        618,
        faction.Horde,
        613,
        true,
    },
    { -- For The Horde!
        619,
        faction.Horde,
        614,
        true,
    },
    {621}, -- Represent
    {622}, -- The Spellweaver's Downfall (10 player)
    {623}, -- The Spellweaver's Downfall (25 player)
    {624}, -- Less Is More (10 player)
    {625}, -- Besting the Black Dragonflight (25 player)
    { -- Lunar Festival Finery
        626,
        {
            {"Event", 327},
        },
    },
    {627}, -- Explore Dun Morogh
    {628}, -- Deadmines
    {629}, -- Ragefire Chasm
    {630}, -- Wailing Caverns
    {631}, -- Shadowfang Keep
    {632}, -- Blackfathom Deeps
    {633}, -- Stormwind Stockade
    {634}, -- Gnomeregan
    {635}, -- Razorfen Kraul
    {636}, -- Razorfen Downs
    {637}, -- Scarlet Monastery
    {638}, -- Uldaman
    {639}, -- Zul'Farrak
    {640}, -- Maraudon
    {641}, -- Sunken Temple
    {642}, -- Blackrock Depths
    {643}, -- Lower Blackrock Spire
    {644}, -- King of Dire Maul
    {645}, -- Scholomance
    {646}, -- Stratholme
    {647}, -- Hellfire Ramparts
    {648}, -- The Blood Furnace
    {649}, -- The Slave Pens
    {650}, -- Underbog
    {651}, -- Mana-Tombs
    {652}, -- The Escape From Durnholde
    {653}, -- Sethekk Halls
    {654}, -- Shadow Labyrinth
    {655}, -- Opening of the Dark Portal
    {656}, -- The Steamvault
    {657}, -- The Shattered Halls
    {658}, -- The Mechanar
    {659}, -- The Botanica
    {660}, -- The Arcatraz
    {661}, -- Magister's Terrace
    { -- Collector's Edition: Mini-Diablo
        662,
        {
            {"Never"},
        },
    },
    { -- Collector's Edition: Panda
        663,
        {
            {"Never"},
        },
    },
    { -- Collector's Edition: Zergling
        664,
        {
            {"Never"},
        },
    },
    { -- Collector's Edition: Netherwhelp
        665,
        {
            {"Never"},
        },
    },
    {666}, -- Auchenai Crypts
    {667}, -- Heroic: Hellfire Ramparts
    {668}, -- Heroic: The Blood Furnace
    {669}, -- Heroic: The Slave Pens
    {670}, -- Heroic: Underbog
    {671}, -- Heroic: Mana-Tombs
    {672}, -- Heroic: Auchenai Crypts
    {673}, -- Heroic: The Escape From Durnholde
    {674}, -- Heroic: Sethekk Halls
    {675}, -- Heroic: Shadow Labyrinth
    {676}, -- Heroic: Opening of the Dark Portal
    {677}, -- Heroic: The Steamvault
    {678}, -- Heroic: The Shattered Halls
    {679}, -- Heroic: The Mechanar
    {680}, -- Heroic: The Botanica
    {681}, -- Heroic: The Arcatraz
    {682}, -- Heroic: Magister's Terrace
    { -- Collector's Edition: Frost Wyrm Whelp
        683,
        {
            {"Never"},
        },
    },
    { -- Onyxia's Lair (Level 60)
        684,
        {
            {"Never"},
        },
    },
    {685}, -- Blackwing Lair
    {686}, -- Molten Core
    {687}, -- Temple of Ahn'Qiraj
    { -- Zul'Gurub
        688,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {689}, -- Ruins of Ahn'Qiraj
    {690}, -- Karazhan
    { -- Zul'Aman
        691,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {692}, -- Gruul's Lair
    {693}, -- Magtheridon's Lair
    {694}, -- Serpentshrine Cavern
    {695}, -- The Battle for Mount Hyjal
    {696}, -- Tempest Keep
    {697}, -- The Black Temple
    {698}, -- Sunwell Plateau
    { -- World Wide Winner
        699,
        {
            IsPvP = true,
        },
    },
    { -- Freedom of the Horde
        700,
        faction.Horde,
        701,
        {
            IsPvP = true,
            {"PvP Season", 5},
        },
    },
    { -- Freedom of the Alliance
        701,
        faction.Alliance,
        700,
        {
            IsPvP = true,
            {"PvP Season", 5},
        },
    },
    { -- Master of Arms
        705,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- Frostwolf Howler
        706,
        faction.Horde,
        707,
        true,
    },
    { -- Stormpike Battle Charger
        707,
        faction.Alliance,
        706,
        true,
    },
    { -- Hero of the Frostwolf Clan
        708,
        faction.Horde,
        709,
        true,
    },
    { -- Hero of the Stormpike Guard
        709,
        faction.Alliance,
        708,
        true,
    },
    { -- The Defiler
        710,
        faction.Horde,
        711,
        true,
    },
    { -- Knight of Arathor
        711,
        faction.Alliance,
        710,
        true,
    },
    { -- Warsong Outrider
        712,
        faction.Horde,
        713,
        true,
    },
    { -- Silverwing Sentinel
        713,
        faction.Alliance,
        712,
        true,
    },
    { -- The Conqueror
        714,
        faction.Horde,
        907,
        true,
    },
    {725}, -- "Thori'dal, the Stars' Fury"
    {726}, -- Mr. Pinchy's Magical Crawdad Box
    { -- Call in the Cavalry
        727,
        {
            IsPvP = true,
        },
    },
    {728}, -- Explore Durotar
    {729}, -- Deathcharger's Reins
    { -- Skills to Pay the Bills
        730,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {731}, -- Professional Expert
    {732}, -- Professional Artisan
    {733}, -- Professional Master
    {734}, -- Professional Grand Master
    {735}, -- Working Day and Night
    {736}, -- Explore Mulgore
    {750}, -- Explore Northern Barrens
    {761}, -- Explore Arathi Highlands
    { -- Ambassador of the Horde
        762,
        faction.Horde,
        948,
    },
    { -- The Burning Crusader
        763,
        faction.Horde,
        764,
    },
    { -- The Burning Crusader
        764,
        faction.Alliance,
        763,
    },
    {765}, -- Explore Badlands
    {766}, -- Explore Blasted Lands
    {768}, -- Explore Tirisfal Glades
    {769}, -- Explore Silverpine Forest
    {770}, -- Explore Western Plaguelands
    {771}, -- Explore Eastern Plaguelands
    {772}, -- Explore Hillsbrad Foothills
    {773}, -- Explore The Hinterlands
    {774}, -- Explore Searing Gorge
    {775}, -- Explore Burning Steppes
    {776}, -- Explore Elwynn Forest
    {777}, -- Explore Deadwind Pass
    {778}, -- Explore Duskwood
    {779}, -- Explore Loch Modan
    {780}, -- Explore Redridge Mountains
    {781}, -- Explore Northern Stranglethorn
    {782}, -- Explore Swamp of Sorrows
    { -- The Perfect Storm
        783,
        {
            IsPvP = true,
        },
    },
    { -- Eye of the Storm Domination
        784,
        {
            IsPvP = true,
        },
    },
    {802}, -- Explore Westfall
    {841}, -- Explore Wetlands
    {842}, -- Explore Teldrassil
    {843}, -- Explore Netherstorm
    {844}, -- Explore Darkshore
    {845}, -- Explore Ashenvale
    {846}, -- Explore Thousand Needles
    {847}, -- Explore Stonetalon Mountains
    {848}, -- Explore Desolace
    {849}, -- Explore Feralas
    {850}, -- Explore Dustwallow Marsh
    {851}, -- Explore Tanaris
    {852}, -- Explore Azshara
    {853}, -- Explore Felwood
    {854}, -- Explore Un'Goro Crater
    {855}, -- Explore Moonglade
    {856}, -- Explore Silithus
    {857}, -- Explore Winterspring
    {858}, -- Explore Ghostlands
    {859}, -- Explore Eversong Woods
    {860}, -- Explore Azuremyst Isle
    {861}, -- Explore Bloodmyst Isle
    {862}, -- Explore Hellfire Peninsula
    {863}, -- Explore Zangarmarsh
    {864}, -- Explore Shadowmoon Valley
    {865}, -- Explore Blade's Edge Mountains
    {866}, -- Explore Nagrand
    {867}, -- Explore Terokkar Forest
    {868}, -- Explore Isle of Quel'Danas
    { -- 50000 Honorable Kills
        869,
        {
            IsPvP = true,
        },
    },
    { -- 100000 Honorable Kills
        870,
        {
            IsPvP = true,
        },
    },
    {871}, -- "Avast Ye, Admiral!"
    { -- Frenzied Defender
        872,
        {
            IsPvP = true,
        },
    },
    { -- Frostwolf Perfection
        873,
        faction.Horde,
        220,
        true,
    },
    { -- Vengefully Dedicated
        875,
        {
            IsPvP = true,
        },
    },
    { -- Brutally Dedicated
        876,
        {
            IsPvP = true,
        },
    },
    {877}, -- The Cake Is Not A Lie
    {878}, -- One That Didn't Get Away
    { -- Old School Ride
        879,
        {
            {"Never"},
        },
    },
    { -- Swift Zulian Tiger
        880,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- Swift Razzashi Raptor
        881,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {882}, -- Fiery Warhorse's Reins
    {883}, -- Reins of the Raven Lord
    {884}, -- Swift White Hawkstrider
    {885}, -- Ashes of Al'ar
    { -- Swift Nether Drake
        886,
        {
            IsPvP = true,
            {"PvP Season", 1},
        },
    },
    { -- Merciless Nether Drake
        887,
        {
            IsPvP = true,
            {"PvP Season", 2},
        },
    },
    { -- Vengeful Nether Drake
        888,
        {
            IsPvP = true,
            {"PvP Season", 3},
        },
    },
    {889}, -- Fast and Furious
    {890}, -- Into The Wild Blue Yonder
    {891}, -- Giddy Up!
    { -- The Right Stuff
        892,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {893}, -- Cenarion War Hippogryph
    {894}, -- Flying High Over Skettis
    {896}, -- A Quest a Day Keeps the Ogres at Bay
    {897}, -- You're So Offensive
    {898}, -- On Wings of Nether
    { -- "Oh My, Kurenai"
        899,
        faction.Alliance,
        901,
    },
    {900}, -- The Czar of Sporeggar
    { -- Mag'har of Draenor
        901,
        faction.Horde,
        899,
    },
    {902}, -- Chief Exalted Officer
    {903}, -- Shattrath Divided
    {905}, -- Old Man Barlowned
    {906}, -- Kickin' It Up a Notch
    { -- The Justicar
        907,
        faction.Alliance,
        714,
        true,
    },
    { -- Call to Arms!
        908,
        faction.Alliance,
        909,
        true,
    },
    { -- Call to Arms!
        909,
        faction.Horde,
        908,
        true,
    },
    { -- Elders of the Dungeons
        910,
        {
            {"Event", 327},
        },
    },
    { -- Elders of Kalimdor
        911,
        {
            {"Event", 327},
        },
    },
    { -- Elders of Eastern Kingdoms
        912,
        {
            {"Event", 327},
        },
    },
    { -- To Honor One's Elders
        913,
        {
            {"Event", 327},
        },
    },
    { -- Elders of the Horde
        914,
        {
            {"Event", 327},
        },
    },
    { -- Elders of the Alliance
        915,
        {
            {"Event", 327},
        },
    },
    { -- Elune's Blessing
        937,
        {
            {"Event", 327},
        },
    },
    {938}, -- The Snows of Northrend
    {939}, -- Hills Like White Elekk
    {940}, -- The Green Hills of Stranglethorn
    {941}, -- Hemet Nesingwary: The Collected Quests
    { -- The Diplomat
        942,
        faction.Alliance,
        943,
    },
    { -- The Diplomat
        943,
        faction.Horde,
        942,
    },
    {944}, -- They Love Me In That Tunnel
    {945}, -- The Argent Champion
    {946}, -- The Argent Dawn
    {947}, -- The Argent Crusade
    { -- Ambassador of the Alliance
        948,
        faction.Alliance,
        762,
    },
    {949}, -- Tuskarrmageddon
    {950}, -- Frenzyheart Tribe
    {951}, -- The Oracles
    {952}, -- Mercenary of Sholazar
    {953}, -- Guardian of Cenarius
    {955}, -- Hydraxian Waterlords
    {956}, -- Brood of Nozdormu
    { -- Hero of the Zandalar Tribe
        957,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    {958}, -- Sworn to the Deathsworn
    {959}, -- The Scale of the Sands
    {960}, -- The Violet Eye
    {961}, -- Honorary Frenzyheart
    {962}, -- Savior of the Oracles
    { -- Tricks and Treats of Kalimdor
        963,
        faction.Alliance,
        965,
        {
            {"Event", 324},
        },
    },
    {964}, -- Going Down?
    { -- Tricks and Treats of Kalimdor
        965,
        faction.Horde,
        963,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Eastern Kingdoms
        966,
        faction.Alliance,
        967,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Eastern Kingdoms
        967,
        faction.Horde,
        966,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Outland
        968,
        faction.Horde,
        969,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Outland
        969,
        faction.Alliance,
        968,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Azeroth
        970,
        faction.Alliance,
        971,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Azeroth
        971,
        faction.Horde,
        970,
        {
            {"Event", 324},
        },
    },
    { -- Trick or Treat!
        972,
        {
            {"Event", 324},
        },
    },
    {973}, -- 5 Daily Quests Complete
    {974}, -- 50 Daily Quests Complete
    {975}, -- 200 Daily Quests Complete
    {976}, -- 500 Daily Quests Complete
    {977}, -- 1000 Daily Quests Complete
    {978}, -- 3000 Quests Completed
    { -- The Mask Task
        979,
        {
            {"Event", 324},
        },
    },
    { -- The Horseman's Reins
        980,
        {
            {"Event", 324},
        },
    },
    { -- That Sparkling Smile
        981,
        {
            {"Event", 324},
        },
    },
    { -- Know Thy Enemy
        1005,
        faction.Horde,
        246,
        true,
    },
    { -- City Defender
        1006,
        faction.Horde,
        388,
        true,
    },
    {1007}, -- The Wyrmrest Accord
    {1008}, -- The Kirin Tor
    {1009}, -- Knights of the Ebon Blade
    {1010}, -- Northrend Vanguard
    { -- The Winds of the North
        1011,
        faction.Horde,
        1012,
    },
    { -- The Winds of the North
        1012,
        faction.Alliance,
        1011,
    },
    {1014}, -- 35 Exalted Reputations
    {1015}, -- 40 Exalted Reputations
    {1017}, -- Can I Keep Him?
    {1020}, -- Ten Tabards
    {1021}, -- Twenty-Five Tabards
    { -- Flame Warden of Eastern Kingdoms
        1022,
        faction.Alliance,
        1025,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Kalimdor
        1023,
        faction.Alliance,
        1026,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Outland
        1024,
        faction.Alliance,
        1027,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Eastern Kingdoms
        1025,
        faction.Horde,
        1022,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Kalimdor
        1026,
        faction.Horde,
        1023,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Outland
        1027,
        faction.Horde,
        1024,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Eastern Kingdoms
        1028,
        faction.Alliance,
        1031,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Kalimdor
        1029,
        faction.Alliance,
        1032,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Outland
        1030,
        faction.Alliance,
        1033,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Eastern Kingdoms
        1031,
        faction.Horde,
        1028,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Kalimdor
        1032,
        faction.Horde,
        1029,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Outland
        1033,
        faction.Horde,
        1030,
        {
            {"Event", 341},
        },
    },
    { -- The Fires of Azeroth
        1034,
        faction.Alliance,
        1036,
        {
            {"Event", 341},
        },
    },
    { -- Desecration of the Horde
        1035,
        faction.Alliance,
        1037,
        {
            {"Event", 341},
        },
    },
    { -- The Fires of Azeroth
        1036,
        faction.Horde,
        1034,
        {
            {"Event", 341},
        },
    },
    { -- Desecration of the Alliance
        1037,
        faction.Horde,
        1035,
        {
            {"Event", 341},
        },
    },
    { -- The Flame Warden
        1038,
        faction.Alliance,
        1039,
        {
            {"Event", 341},
        },
    },
    { -- The Flame Keeper
        1039,
        faction.Horde,
        1038,
        {
            {"Event", 341},
        },
    },
    { -- Rotten Hallow
        1040,
        faction.Alliance,
        1041,
        {
            {"Event", 324},
        },
    },
    { -- Rotten Hallow
        1041,
        faction.Horde,
        1040,
        {
            {"Event", 324},
        },
    },
    { -- King of the Fire Festival
        1145,
        {
            {"Event", 341},
        },
    },
    { -- Loyal Defender
        1151,
        faction.Alliance,
        224,
        true,
    },
    { -- Overly Defensive
        1153,
        {
            IsPvP = true,
        },
    },
    { -- Duel-icious
        1157,
        {
            IsPvP = true,
        },
    },
    { -- Just the Two of Us: 2200
        1159,
        {
            IsPvP = true,
        },
    },
    { -- Three's Company: 2200
        1160,
        {
            IsPvP = true,
        },
    },
    { -- High Five: 2200
        1161,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Hotter Streak
        1162,
        {
            IsPvP = true,
        },
    },
    { -- Everything Counts
        1164,
        faction.Horde,
        225,
        true,
    },
    {1165}, -- "My Storage is ""Gigantique"""
    { -- To the Looter Go the Spoils
        1166,
        {
            IsPvP = true,
        },
    },
    { -- Master of Alterac Valley
        1167,
        faction.Alliance,
        1168,
        true,
    },
    { -- Master of Alterac Valley
        1168,
        faction.Horde,
        1167,
        true,
    },
    { -- Master of Arathi Basin
        1169,
        faction.Alliance,
        1170,
        true,
    },
    { -- Master of Arathi Basin
        1170,
        faction.Horde,
        1169,
        true,
    },
    { -- Master of Eye of the Storm
        1171,
        {
            IsPvP = true,
        },
    },
    { -- Master of Warsong Gulch
        1172,
        faction.Alliance,
        1173,
        true,
    },
    { -- Master of Warsong Gulch
        1173,
        faction.Horde,
        1172,
        true,
    },
    { -- The Arena Master
        1174,
        {
            IsPvP = true,
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Battlemaster
        1175,
        faction.Horde,
        230,
        true,
    },
    {1176}, -- Got My Mind On My Money
    {1177}, -- Got My Mind On My Money
    {1178}, -- Got My Mind On My Money
    {1180}, -- Got My Mind On My Money
    {1181}, -- Got My Mind On My Money
    {1182}, -- The Bread Winner
    { -- Brew of the Year
        1183,
        {
            {"Event", 372},
        },
    },
    { -- Strange Brew
        1184,
        faction.Alliance,
        1203,
        {
            {"Event", 372},
        },
    },
    { -- The Brewfest Diet
        1185,
        {
            {"Event", 372},
        },
    },
    { -- Down With The Dark Iron
        1186,
        {
            {"Before", "Version", {8, 2, 0}},
        },
    },
    { -- Shafted!
        1188,
        {
            {"Event", 423},
        },
    },
    { -- To Hellfire and Back
        1189,
        faction.Alliance,
        1271,
    },
    {1190}, -- Mysteries of the Marsh
    { -- Terror of Terokkar
        1191,
        faction.Alliance,
        1272,
    },
    { -- Nagrand Slam
        1192,
        faction.Alliance,
        1273,
    },
    {1193}, -- On the Blade's Edge
    {1194}, -- Into the Nether
    {1195}, -- Shadow of the Betrayer
    { -- Strange Brew
        1203,
        faction.Horde,
        1184,
        {
            {"Event", 372},
        },
    },
    {1205}, -- Hero of Shattrath
    {1206}, -- To All The Squirrels I've Loved Before
    {1225}, -- Outland Angler
    {1243}, -- Fish Don't Leave Footprints
    {1244}, -- Well Read
    {1248}, -- Plethora of Pets
    {1250}, -- "Shop Smart, Shop Pet...Smart"
    { -- Not In My House
        1251,
        faction.Horde,
        203,
        true,
    },
    { -- Supreme Defender
        1252,
        faction.Horde,
        206,
        true,
    },
    {1254}, -- Friend or Fowl?
    { -- Scrooge
        1255,
        faction.Alliance,
        259,
        {
            {"Event", 141},
        },
    },
    {1257}, -- The Scavenger
    { -- Take a Chill Pill
        1258,
        {
            IsPvP = true,
        },
    },
    { -- Not So Fast
        1259,
        {
            IsPvP = true,
        },
    },
    { -- Almost Blind Luck
        1260,
        {
            {"Event", 372},
        },
    },
    { -- G.N.E.R.D. Rage
        1261,
        {
            {"Event", 324},
        },
    },
    { -- Loremaster of Outland
        1262,
        faction.Alliance,
        1274,
    },
    {1263}, -- Explore Howling Fjord
    {1264}, -- Explore Borean Tundra
    {1265}, -- Explore Dragonblight
    {1266}, -- Explore Grizzly Hills
    {1267}, -- Explore Zul'Drak
    {1268}, -- Explore Sholazar Basin
    {1269}, -- Explore Storm Peaks
    {1270}, -- Explore Icecrown
    { -- To Hellfire and Back
        1271,
        faction.Horde,
        1189,
    },
    { -- Terror of Terokkar
        1272,
        faction.Horde,
        1191,
    },
    { -- Nagrand Slam
        1273,
        faction.Horde,
        1192,
    },
    { -- Loremaster of Outland
        1274,
        faction.Horde,
        1262,
    },
    {1275}, -- Bombs Away
    {1276}, -- Blade's Edge Bomberman
    {1277}, -- Rapid Defense
    { -- Flirt With Disaster
        1279,
        faction.Alliance,
        1280,
        {
            {"Before", "Version", {10, 2, 5}},
        },
    },
    { -- Flirt With Disaster
        1280,
        faction.Horde,
        1279,
        {
            {"Before", "Version", {10, 2, 5}},
        },
    },
    { -- The Rocket's Red Glare
        1281,
        {
            {"Event", 327},
        },
    },
    { -- Fa-la-la-la-Ogri'la
        1282,
        {
            {"Event", 141},
        },
    },
    {1283}, -- Classic Dungeonmaster
    {1284}, -- Outland Dungeonmaster
    {1285}, -- Classic Raider
    {1286}, -- Outland Raider
    {1287}, -- Outland Dungeon Hero
    {1288}, -- Northrend Dungeonmaster
    {1289}, -- Northrend Dungeon Hero
    { -- Lonely?
        1291,
        {
            {"Event", 423},
        },
    },
    { -- Yellow Brewfest Stein
        1292,
        {
            {"Never"},
        },
    },
    { -- Blue Brewfest Stein
        1293,
        {
            {"Never"},
        },
    },
    { -- Crashin' & Thrashin'
        1295,
        {
            {"Event", 141},
        },
    },
    {1296}, -- Watch Him Die
    {1297}, -- Hadronox Denied
    { -- Upper Blackrock Spire
        1307,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Strand of the Ancients Victory
        1308,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Strand of the Ancients Veteran
        1309,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Storm the Beach
        1310,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {1311}, -- Medium Rare
    {1312}, -- Bloody Rare
    { -- I've Toured the Fjord
        1356,
        faction.Horde,
        34,
    },
    { -- Fo' Grizzle My Shizzle
        1357,
        faction.Horde,
        37,
    },
    { -- Nothing Boring About Borean
        1358,
        faction.Horde,
        33,
    },
    { -- Might of Dragonblight
        1359,
        faction.Horde,
        35,
    },
    { -- Loremaster of Northrend
        1360,
        faction.Horde,
        41,
    },
    { -- Elders of Northrend
        1396,
        {
            {"Event", 327},
        },
    },
    { -- Realm First! Magic Seeker
        1400,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Conqueror of Naxxramas
        1402,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Gnome
        1404,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Blood Elf
        1405,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Draenei
        1406,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Dwarf
        1407,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Human
        1408,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Night Elf
        1409,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Orc
        1410,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Tauren
        1411,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Troll
        1412,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Forsaken
        1413,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Blacksmith
        1414,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Alchemist
        1415,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Cooking Grand Master
        1416,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Enchanter
        1417,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Engineer
        1418,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! First Aid Grand Master
        1419,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Angler
        1420,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Herbalist
        1421,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Scribe
        1422,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Jewelcrafter
        1423,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Leatherworker
        1424,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Miner
        1425,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Skinner
        1426,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Tailor
        1427,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {1428}, -- Mine Sweeper
    { -- Friends In High Places
        1436,
        {
            {"Never"},
        },
    },
    {1457}, -- Explore Crystalsong Forest
    { -- Realm First! Northrend Vanguard
        1463,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Quick Cap
        1502,
        faction.Horde,
        202,
        true,
    },
    {1516}, -- Accomplished Angler
    {1517}, -- Northrend Angler
    { -- Frenzied Firecracker
        1552,
        {
            {"Event", 327},
        },
    },
    {1556}, -- 25 Fish
    {1557}, -- 50 Fish
    {1558}, -- 100 Fish
    {1559}, -- 250 Fish
    {1560}, -- 500 Fish
    {1561}, -- 1000 Fish
    { -- Hail to the Chef
        1563,
        faction.Alliance,
        1784,
    },
    {1576}, -- Of Blood and Anguish
    {1596}, -- Guru of Drakuru
    { -- Competitor's Tabard
        1636,
        {
            {"Never"},
        },
    },
    { -- Spirit of Competition
        1637,
        {
            {"Never"},
        },
    },
    {1638}, -- Skyshattered
    { -- Hallowed Be Thy Name
        1656,
        faction.Alliance,
        1657,
        {
            {"Event", 324},
        },
    },
    { -- Hallowed Be Thy Name
        1657,
        faction.Horde,
        1656,
        {
            {"Event", 324},
        },
    },
    {1658}, -- Champion of the Frozen Wastes
    { -- Loremaster of Eastern Kingdoms
        1676,
        faction.Alliance,
        1677,
    },
    { -- Loremaster of Eastern Kingdoms
        1677,
        faction.Horde,
        1676,
    },
    { -- Loremaster of Kalimdor
        1678,
        faction.Alliance,
        1680,
    },
    { -- Loremaster of Kalimdor
        1680,
        faction.Horde,
        1678,
    },
    { -- The Loremaster
        1681,
        faction.Alliance,
        1682,
    },
    { -- The Loremaster
        1682,
        faction.Horde,
        1681,
    },
    { -- Brewmaster
        1683,
        faction.Horde,
        1684,
        {
            {"Event", 372},
        },
    },
    { -- Brewmaster
        1684,
        faction.Alliance,
        1683,
        {
            {"Event", 372},
        },
    },
    { -- Holiday Bromance
        1685,
        faction.Horde,
        1686,
        {
            {"Event", 141},
        },
    },
    { -- Holiday Bromance
        1686,
        faction.Alliance,
        1685,
        {
            {"Event", 141},
        },
    },
    { -- Let It Snow
        1687,
        {
            {"Event", 141},
        },
    },
    { -- The Winter Veil Gourmet
        1688,
        {
            {"Event", 141},
        },
    },
    { -- He Knows If You've Been Naughty
        1689,
        {
            {"Event", 141},
        },
    },
    { -- A Frosty Shake
        1690,
        {
            {"Event", 141},
        },
    },
    { -- Merrymaker
        1691,
        faction.Horde,
        1692,
        {
            {"Event", 141},
        },
    },
    { -- Merrymaker
        1692,
        faction.Alliance,
        1691,
        {
            {"Event", 141},
        },
    },
    { -- Fool For Love
        1693,
        faction.Horde,
        1707,
        {
            {"Event", 423},
        },
    },
    { -- Lovely Luck Is On Your Side
        1694,
        {
            {"Event", 423},
        },
    },
    { -- Dangerous Love
        1695,
        {
            {"Event", 423},
        },
    },
    { -- The Rocket's Pink Glare
        1696,
        {
            {"Event", 423},
        },
    },
    { -- Nation of Adoration
        1697,
        faction.Alliance,
        1698,
        {
            {"Before", "Version", {10, 2, 5}},
        },
    },
    { -- Nation of Adoration
        1698,
        faction.Horde,
        1697,
        {
            {"Before", "Version", {10, 2, 5}},
        },
    },
    { -- Fistful of Love
        1699,
        {
            {"Event", 423},
        },
    },
    { -- Perma-Peddle
        1700,
        {
            {"Event", 423},
        },
    },
    { -- Be Mine!
        1701,
        {
            {"Event", 423},
        },
    },
    { -- Sweet Tooth
        1702,
        {
            {"Event", 423},
        },
    },
    { -- "My Love is Like a Red, Red Rose"
        1703,
        {
            {"Event", 423},
        },
    },
    { -- I Pitied The Fool
        1704,
        {
            {"Event", 423},
        },
    },
    {1705}, -- Clockwork Rocket Bot
    {1706}, -- Crashin' Thrashin' Racer
    { -- Fool For Love
        1707,
        faction.Alliance,
        1693,
        {
            {"Event", 423},
        },
    },
    { -- Wintergrasp Victory
        1717,
        {
            IsPvP = true,
        },
    },
    { -- Wintergrasp Veteran
        1718,
        {
            IsPvP = true,
        },
    },
    {1721}, -- Archavon the Stone Watcher (25 player)
    {1722}, -- Archavon the Stone Watcher (10 player)
    { -- Vehicular Gnomeslaughter
        1723,
        {
            IsPvP = true,
        },
    },
    { -- Leaning Tower
        1727,
        {
            IsPvP = true,
        },
    },
    { -- Destruction Derby
        1737,
        faction.Alliance,
        2476,
        true,
    },
    { -- Didn't Stand a Chance
        1751,
        {
            IsPvP = true,
        },
    },
    { -- Master of Wintergrasp
        1752,
        faction.Alliance,
        2776,
        true,
    },
    { -- Within Our Grasp
        1755,
        {
            IsPvP = true,
        },
    },
    { -- Defense of the Ancients
        1757,
        faction.Alliance,
        2200,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- The Dapper Sapper
        1761,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Not Even a Scratch
        1762,
        faction.Alliance,
        2192,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Artillery Veteran
        1763,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Drop It!
        1764,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Steady Hands
        1765,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Ancient Protector
        1766,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {1777}, -- The Northrend Gourmet
    {1778}, -- The Northrend Gourmet
    {1779}, -- The Northrend Gourmet
    {1780}, -- Second That Emotion
    {1781}, -- Critter Gitter
    { -- Our Daily Bread
        1782,
        faction.Alliance,
        1783,
    },
    { -- Our Daily Bread
        1783,
        faction.Horde,
        1782,
    },
    { -- Hail to the Chef
        1784,
        faction.Horde,
        1563,
    },
    {1785}, -- Dinner Impossible
    { -- School of Hard Knocks
        1786,
        {
            {"Event", 201},
        },
    },
    { -- Bad Example
        1788,
        {
            {"Event", 201},
        },
    },
    { -- Daily Chores
        1789,
        {
            {"Event", 201},
        },
    },
    { -- "Hail To The King, Baby"
        1790,
        {
            {"Event", 201},
        },
    },
    { -- Home Alone
        1791,
        {
            {"Event", 201},
        },
    },
    { -- "Aw, Isn't It Cute?"
        1792,
        {
            {"Event", 201},
        },
    },
    { -- For the Children
        1793,
        {
            {"Event", 201},
        },
    },
    {1795}, -- Lunch Lady
    {1796}, -- Short Order Cook
    {1797}, -- Chef de Partie
    {1798}, -- Sous Chef
    {1799}, -- Chef de Cuisine
    {1800}, -- The Outland Gourmet
    {1801}, -- Captain Rumsey's Lager
    {1816}, -- Defenseless
    {1817}, -- The Culling of Time
    {1832}, -- Tastes Like Chicken
    {1833}, -- It's Happy Hour Somewhere
    {1834}, -- Lightning Struck
    {1836}, -- Old Crafty
    {1837}, -- Old Ironjaw
    {1856}, -- Make Quick Werk of Him (10 player)
    {1857}, -- Make Quick Werk of Him (25 player)
    {1858}, -- Arachnophobia (10 player)
    {1859}, -- Arachnophobia (25 player)
    {1860}, -- Gotta Go!
    {1862}, -- Volazj's Quick Demise
    {1864}, -- What the Eck?
    {1865}, -- Lockdown!
    {1866}, -- Good Grief
    {1867}, -- Timely Death
    {1868}, -- Make It Count
    {1869}, -- A Poke in the Eye (10 player)
    {1870}, -- A Poke in the Eye (25 player)
    {1871}, -- Experienced Drake Rider
    {1872}, -- Zombiefest!
    {1873}, -- Lodi Dodi We Loves the Skadi
    {1874}, -- You Don't Have an Eternity (10 player)
    {1875}, -- You Don't Have an Eternity (25 player)
    {1876}, -- Besting the Black Dragonflight (10 player)
    {1877}, -- Less Is More (25 player)
    {1919}, -- On The Rocks
    { -- Does Your Wolpertinger Linger?
        1936,
        {
            {"Event", 372},
        },
    },
    {1956}, -- Higher Learning
    {1957}, -- There's Gold In That There Fountain
    {1958}, -- I Smell A Giant Rat
    {1996}, -- The Safety Dance (10 player)
    {1997}, -- Momma Said Knock You Out (10 player)
    {1998}, -- Cooking Award
    {1999}, -- 10 Cooking Awards
    {2000}, -- 25 Cooking Awards
    {2001}, -- 50 Cooking Awards
    {2002}, -- 100 Cooking Awards
    { -- Grizzled Veteran
        2016,
        faction.Alliance,
        2017,
        true,
    },
    { -- Grizzled Veteran
        2017,
        faction.Horde,
        2016,
        true,
    },
    { -- Timear Foresees
        2018,
        {
            {"Before", "Version", {3, 3, 0}},
        },
    },
    { -- Proof of Demise
        2019,
        {
            {"Before", "Version", {3, 3, 0}},
        },
    },
    {2036}, -- Intense Cold
    {2037}, -- Chaos Theory
    {2038}, -- Respect Your Elders
    {2039}, -- Better Off Dred
    {2040}, -- Less-rabi
    {2041}, -- Dehydration
    {2042}, -- Shatter Resistant
    {2043}, -- The Incredible Hulk
    {2044}, -- Ruby Void
    {2045}, -- Emerald Void
    {2046}, -- Amber Void
    {2047}, -- Gonna Go When the Volcano Blows (10 player)
    {2048}, -- Gonna Go When the Volcano Blows (25 player)
    {2049}, -- Twilight Assist (10 player)
    {2050}, -- Twilight Duo (10 player)
    {2051}, -- The Twilight Zone (10 player)
    {2052}, -- Twilight Assist (25 player)
    {2053}, -- Twilight Duo (25 player)
    {2054}, -- The Twilight Zone (25 player)
    {2056}, -- Volunteer Work
    {2057}, -- Oh Novos!
    {2058}, -- Snakes. Why'd It Have To Be Snakes?
    {2076}, -- Armored Brown Bear
    {2077}, -- Wooly Mammoth
    {2078}, -- Traveler's Tundra Mammoth
    { -- Tabard of the Protector
        2079,
        {
            {"Never"},
        },
    },
    { -- Black War Mammoth
        2080,
        {
            IsPvP = true,
        },
    },
    {2081}, -- Grand Black War Mammoth
    {2082}, -- Ice Mammoth
    {2083}, -- Grand Ice Mammoth
    {2084}, -- Ring of the Kirin Tor
    { -- 50 Stone Keeper's Shards
        2085,
        {
            IsPvP = true,
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- 100 Stone Keeper's Shards
        2086,
        {
            IsPvP = true,
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- 250 Stone Keeper's Shards
        2087,
        {
            IsPvP = true,
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- 500 Stone Keeper's Shards
        2088,
        {
            IsPvP = true,
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- 1000 Stone Keeper's Shards
        2089,
        {
            IsPvP = true,
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- Challenger
        2090,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator
        2091,
        {
            IsPvP = true,
        },
    },
    { -- Duelist
        2092,
        {
            IsPvP = true,
        },
    },
    { -- Rival
        2093,
        {
            IsPvP = true,
        },
    },
    {2094}, -- A Penny For Your Thoughts
    {2095}, -- Silver in the City
    {2096}, -- The Coin Master
    {2097}, -- Get to the Choppa!
    { -- Tabard of the Argent Dawn
        2116,
        {
            {"Never"},
        },
    },
    {2136}, -- Glory of the Hero
    {2137}, -- Glory of the Raider (10 player)
    {2138}, -- Glory of the Raider (25 player)
    {2139}, -- The Safety Dance (25 player)
    {2140}, -- Momma Said Knock You Out (25 player)
    {2141}, -- Stable Keeper
    {2142}, -- Filling Up The Barn
    {2143}, -- Leading the Cavalry
    { -- "What A Long, Strange Trip It's Been"
        2144,
        faction.Alliance,
        2145,
    },
    { -- "What A Long, Strange Trip It's Been"
        2145,
        faction.Horde,
        2144,
    },
    {2146}, -- The Hundred Club (10 player)
    {2147}, -- The Hundred Club (25 player)
    {2148}, -- Denyin' the Scion (10 player)
    {2149}, -- Denyin' the Scion (25 player)
    {2150}, -- Split Personality
    {2151}, -- Consumption Junction
    {2152}, -- Share The Love
    {2153}, -- A Void Dance
    {2154}, -- Brann Spankin' New
    {2155}, -- Abuse the Ooze
    {2156}, -- My Girl Loves to Skadi All the Time
    {2157}, -- King's Bane
    {2176}, -- And They Would All Go Down Together (10 player)
    {2177}, -- And They Would All Go Down Together (25 player)
    {2178}, -- Shocking! (10 player)
    {2179}, -- Shocking! (25 player)
    {2180}, -- Subtraction (10 player)
    {2181}, -- Subtraction (25 player)
    {2182}, -- Spore Loser (10 player)
    {2183}, -- Spore Loser (25 player)
    {2184}, -- Just Can't Get Enough (10 player)
    {2185}, -- Just Can't Get Enough (25 player)
    { -- The Immortal
        2186,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- The Undying
        2187,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Leeeeeeeeeeeeeroy!
        2188,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Artillery Expert
        2189,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Drop It Now!
        2190,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Ancient Courtyard Protector
        2191,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Not Even a Scratch
        2192,
        faction.Horde,
        1762,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Explosives Expert
        2193,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Master of Strand of the Ancients
        2194,
        faction.Alliance,
        2195,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Master of Strand of the Ancients
        2195,
        faction.Horde,
        2194,
        {
            IsPvP = true,
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Wintergrasp Ranger
        2199,
        {
            IsPvP = true,
        },
    },
    { -- Defense of the Ancients
        2200,
        faction.Horde,
        1757,
        true,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {2256}, -- Northern Exposure
    {2257}, -- Frostbitten
    { -- Brutal Nether Drake
        2316,
        {
            IsPvP = true,
            {"PvP Season", 4},
        },
    },
    { -- Insane in the Membrane
        2336,
        {
            {"Event", 374},
        },
    },
    { -- Dreadsteed of Xoroth
        2357,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Charger
        2358,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Swift Flight Form
        2359,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- WoW's 4th Anniversary
        2398,
        {
            {"Never"},
        },
    },
    { -- Vampire Hunter
        2456,
        {
            {"Never"},
        },
    },
    { -- Destruction Derby
        2476,
        faction.Horde,
        1737,
        true,
    },
    { -- The Fifth Element
        2496,
        {
            {"Never"},
        },
    },
    { -- Spring Fling
        2497,
        faction.Horde,
        2419,
        {
            {"Event", 181},
        },
    },
    {2516}, -- Lil' Game Hunter
    { -- Mountain o' Mounts
        2536,
        faction.Alliance,
        2537,
    },
    { -- Mountain o' Mounts
        2537,
        faction.Horde,
        2536,
    },
    {2556}, -- Pest Control
    {2557}, -- To All The Squirrels Who Shared My Life
    { -- Dual Talent Specialization
        2716,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Master of Wintergrasp
        2776,
        faction.Horde,
        1752,
        true,
    },
    { -- Brew of the Month
        2796,
        {
            {"Event", 372},
        },
    },
    {3496}, -- A Brew-FAST Mount
};

KrowiAF.AchievementData["03_01_00"] = {
    {KrowiAF.SetAchievementPatch, 3, 1, 0},
    { -- Hard Boiled
        2416,
        {
            {"Event", 181},
        },
    },
    { -- Chocolate Lover
        2417,
        {
            {"Event", 181},
        },
    },
    { -- Chocoholic
        2418,
        {
            {"Event", 181},
        },
    },
    { -- Spring Fling
        2419,
        faction.Alliance,
        2497,
        {
            {"Event", 181},
        },
    },
    { -- Noble Garden
        2420,
        faction.Horde,
        2421,
        {
            {"Event", 181},
        },
    },
    { -- Noble Garden
        2421,
        faction.Alliance,
        2420,
        {
            {"Event", 181},
        },
    },
    { -- Shake Your Bunny-Maker
        2422,
        {
            {"Event", 181},
        },
    },
    { -- Desert Rose
        2436,
        {
            {"Event", 181},
        },
    },
    { -- Blushing Bride
        2576,
        {
            {"Event", 181},
        },
    },
    { -- I Found One!
        2676,
        {
            {"Event", 181},
        },
    },
    {2756}, -- Argent Aspiration
    {2758}, -- Argent Valor
    { -- Exalted Champion of Darnassus
        2760,
        faction.Alliance,
        2769,
    },
    { -- Exalted Champion of the Exodar
        2761,
        faction.Alliance,
        2767,
    },
    { -- Exalted Champion of Gnomeregan
        2762,
        faction.Alliance,
        2768,
    },
    { -- Exalted Champion of Ironforge
        2763,
        faction.Alliance,
        2766,
    },
    { -- Exalted Champion of Stormwind
        2764,
        faction.Alliance,
        2765,
    },
    { -- Exalted Champion of Orgrimmar
        2765,
        faction.Horde,
        2764,
    },
    { -- Exalted Champion of Sen'jin
        2766,
        faction.Horde,
        2763,
    },
    { -- Exalted Champion of Silvermoon City
        2767,
        faction.Horde,
        2761,
    },
    { -- Exalted Champion of Thunder Bluff
        2768,
        faction.Horde,
        2762,
    },
    { -- Exalted Champion of the Undercity
        2769,
        faction.Horde,
        2760,
    },
    { -- Exalted Champion of the Alliance
        2770,
        faction.Alliance,
        2771,
    },
    { -- Exalted Champion of the Horde
        2771,
        faction.Horde,
        2770,
    },
    {2772}, -- Tilted!
    {2773}, -- It's Just a Flesh Wound
    { -- Champion of Darnassus
        2777,
        faction.Alliance,
        2787,
    },
    { -- Champion of the Exodar
        2778,
        faction.Alliance,
        2785,
    },
    { -- Champion of Gnomeregan
        2779,
        faction.Alliance,
        2786,
    },
    { -- Champion of Ironforge
        2780,
        faction.Alliance,
        2784,
    },
    { -- Champion of Stormwind
        2781,
        faction.Alliance,
        2783,
    },
    { -- Champion of the Alliance
        2782,
        faction.Alliance,
        2788,
    },
    { -- Champion of Orgrimmar
        2783,
        faction.Horde,
        2781,
    },
    { -- Champion of Sen'jin
        2784,
        faction.Horde,
        2780,
    },
    { -- Champion of Silvermoon City
        2785,
        faction.Horde,
        2778,
    },
    { -- Champion of Thunder Bluff
        2786,
        faction.Horde,
        2779,
    },
    { -- Champion of the Undercity
        2787,
        faction.Horde,
        2777,
    },
    { -- Champion of the Horde
        2788,
        faction.Horde,
        2782,
    },
    { -- Noble Gardener
        2797,
        faction.Alliance,
        2798,
        {
            {"Event", 181},
        },
    },
    { -- Noble Gardener
        2798,
        faction.Horde,
        2797,
        {
            {"Event", 181},
        },
    },
    { -- Exalted Argent Champion of the Horde
        2816,
        faction.Horde,
        2817,
    },
    { -- Exalted Argent Champion of the Alliance
        2817,
        faction.Alliance,
        2816,
    },
    {2836}, -- Lance a Lot
    { -- The Siege of Ulduar (10 player)
        2886,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Siege of Ulduar (25 player)
        2887,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Antechamber of Ulduar (10 player)
        2888,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Antechamber of Ulduar (25 player)
        2889,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Keepers of Ulduar (10 player)
        2890,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Keepers of Ulduar (25 player)
        2891,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Descent into Madness (10 player)
        2892,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Descent into Madness (25 player)
        2893,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Secrets of Ulduar (10 player)
        2894,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- The Secrets of Ulduar (25 player)
        2895,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Champion of Ulduar
        2903,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Conqueror of Ulduar
        2904,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Unbroken (10 player)
        2905,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Unbroken (25 player)
        2906,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Three Car Garage (10 player)
        2907,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Three Car Garage (25 player)
        2908,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Take Out Those Turrets (10 player)
        2909,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Take Out Those Turrets (25 player)
        2910,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shutout (10 player)
        2911,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shutout (25 player)
        2912,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbital Bombardment (10 player)
        2913,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbital Devastation (10 player)
        2914,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nuked from Orbit (10 player)
        2915,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbital Devastation (25 player)
        2916,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nuked from Orbit (25 player)
        2917,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbital Bombardment (25 player)
        2918,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- A Quick Shave (10 player)
        2919,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- A Quick Shave (25 player)
        2921,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Iron Dwarf, Medium Rare (10 player)"
        2923,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Iron Dwarf, Medium Rare (25 player)"
        2924,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shattered (10 player)
        2925,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shattered (25 player)
        2926,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Hot Pocket (10 player)
        2927,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Hot Pocket (25 player)
        2928,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Stokin' the Furnace (25 player)
        2929,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Stokin' the Furnace (10 player)
        2930,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Engineering (10 player)
        2931,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Engineering (25 player)
        2932,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Scrapbots (10 player)
        2933,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Gravity Bombs (10 player)
        2934,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Scrapbots (25 player)
        2935,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nerf Gravity Bombs (25 player)
        2936,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Must Deconstruct Faster (10 player)
        2937,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Must Deconstruct Faster (25 player)
        2938,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Runemaster Molgeim (10 player)"
        2939,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Stormcaller Brundir (10 player)"
        2940,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Steelbreaker (10 player)"
        2941,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Runemaster Molgeim (25 player)"
        2942,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Stormcaller Brundir (25 player)"
        2943,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "I Choose You, Steelbreaker (25 player)"
        2944,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- But I'm On Your Side (10 player)
        2945,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- But I'm On Your Side (25 player)
        2946,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Can't Do That While Stunned (10 player)
        2947,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Can't Do That While Stunned (25 player)
        2948,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- With Open Arms (10 player)
        2951,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- With Open Arms (25 player)
        2952,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Disarmed (10 player)
        2953,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Disarmed (25 player)
        2954,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- If Looks Could Kill (10 player)
        2955,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- If Looks Could Kill (25 player)
        2956,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Glory of the Ulduar Raider (10 player)
        2957,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Glory of the Ulduar Raider (25 player)
        2958,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Rubble and Roll (10 player)
        2959,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Rubble and Roll (25 player)
        2960,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Cheese the Freeze (10 player)
        2961,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Cheese the Freeze (25 player)
        2962,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Have the Coolest Friends (10 player)
        2963,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Have the Coolest Friends (25 player)
        2965,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Getting Cold in Here (10 player)
        2967,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Getting Cold in Here (25 player)
        2968,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Staying Buffed All Winter (10 player)
        2969,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Staying Buffed All Winter (25 player)
        2970,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Don't Stand in the Lightning (10 player)
        2971,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Don't Stand in the Lightning (25 player)
        2972,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I'll Take You All On (10 player)
        2973,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I'll Take You All On (25 player)
        2974,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Who Needs Bloodlust? (10 player)
        2975,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Who Needs Bloodlust? (25 player)
        2976,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Siffed (10 player)
        2977,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Siffed (25 player)
        2978,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Lumberjacked (10 player)
        2979,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Con-speed-atory (10 player)
        2980,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Con-speed-atory (25 player)
        2981,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Getting Back to Nature (10 player)
        2982,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Getting Back to Nature (25 player)
        2983,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Deforestation (25 player)
        2984,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Deforestation (10 player)
        2985,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Set Up Us the Bomb (10 player)
        2989,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Not-So-Friendly Fire (25 player)
        2995,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shadowdodger (10 player)
        2996,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Shadowdodger (25 player)
        2997,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Supermassive (25 player)
        3002,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Supermassive (10 player)
        3003,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- He Feeds On Your Tears (10 player)
        3004,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- He Feeds On Your Tears (25 player)
        3005,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Crazy Cat Lady (10 player)
        3006,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Crazy Cat Lady (25 player)
        3007,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Drive Me Crazy (10 player)
        3008,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Kiss and Make Up (10 player)
        3009,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Drive Me Crazy (25 player)
        3010,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Kiss and Make Up (25 player)
        3011,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- He's Not Getting Any Older (10 player)
        3012,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- He's Not Getting Any Older (25 player)
        3013,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- They're Coming Out of the Walls (10 player)
        3014,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- In His House He Waits Dreaming (10 player)
        3015,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- In His House He Waits Dreaming (25 player)
        3016,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- They're Coming Out of the Walls (25 player)
        3017,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Observed (10 player)
        3036,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Observed (25 player)
        3037,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbit-uary (10 player)
        3056,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Orbit-uary (25 player)
        3057,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Heartbreaker (10 player)
        3058,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Heartbreaker (25 player)
        3059,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nine Lives (10 player)
        3076,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Nine Lives (25 player)
        3077,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Deadly Gladiator's Frost Wyrm
        3096,
        {
            IsPvP = true,
            {"PvP Season", 5},
        },
    },
    { -- Dwarfageddon (10 player)
        3097,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Dwarfageddon (25 player)
        3098,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    {3097}, -- Dwarfageddon (10 player)
    {3098}, -- Dwarfageddon (25 player)
    { -- Realm First! Death's Demise
        3117,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Lumberjacked (25 player)
        3118,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    {3136}, -- Emalon the Storm Watcher (10 player)
    {3137}, -- Emalon the Storm Watcher (25 player)
    { -- Not-So-Friendly Fire (10 player)
        3138,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Two Lights in the Darkness (10 player)
        3141,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    {3142}, -- "Val'anyr, Hammer of Ancient Kings"
    { -- Three Lights in the Darkness (10 player)
        3157,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- One Light in the Darkness (10 player)
        3158,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Alone in the Darkness (10 player)
        3159,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Three Lights in the Darkness (25 player)
        3161,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Two Lights in the Darkness (25 player)
        3162,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- One Light in the Darkness (25 player)
        3163,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Alone in the Darkness (25 player)
        3164,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Lose Your Illusion (10 player)
        3176,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Knock on Wood (10 player)
        3177,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Knock, Knock on Wood (10 player)"
        3178,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Knock, Knock, Knock on Wood (10 player)"
        3179,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Firefighter (10 player)
        3180,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Love the Smell of Saronite in the Morning (10 player)
        3181,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Could Say That This Cache Was Rare (10 player)
        3182,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Lose Your Illusion (25 player)
        3183,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Could Say That This Cache Was Rare (25 player)
        3184,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Knock on Wood (25 player)
        3185,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Knock, Knock on Wood (25 player)"
        3186,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- "Knock, Knock, Knock on Wood (25 player)"
        3187,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- I Love the Smell of Saronite in the Morning (25 player)
        3188,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Firefighter (25 player)
        3189,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    {3217}, -- Chasing Marcia
    {3218}, -- Turtles All the Way Down
    { -- Set Up Us the Bomb (25 player)
        3237,
        {
            {"Before", "Version", {7, 3, 5}},
        },
    },
    { -- Realm First! Celestial Defender
        3259,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {3296}, -- Cooking with Style
    {3316}, -- Herald of the Titans
    { -- Deadly Gladiator
        3336,
        {
            IsPvP = true,
            {"PvP Season", 5},
        },
    },
    { -- Winterspring Frostsaber
        3356,
        faction.Alliance,
        3357,
    },
    { -- Venomhide Ravasaur
        3357,
        faction.Horde,
        3356,
    },
    { -- Furious Gladiator
        3436,
        {
            IsPvP = true,
            {"PvP Season", 6},
        },
    },
    { -- A Silver Confidant
        3676,
        faction.Alliance,
        3677,
    },
    { -- The Sunreavers
        3677,
        faction.Horde,
        3676,
    },
    {3736}, -- Pony Up!
    { -- Furious Gladiator's Frost Wyrm
        3756,
        {
            IsPvP = true,
            {"PvP Season", 6},
        },
    },
};

KrowiAF.AchievementData["03_02_00"] = {
    {KrowiAF.SetAchievementPatch, 3, 2, 0},
    { -- Dead Man's Party
        3456,
        {
            {"Event", 409},
        },
    },
    { -- The Captain's Booty
        3457,
        {
            {"Event", 398},
        },
    },
    { -- Pilgrim
        3478,
        faction.Alliance,
        3656,
        {
            {"Event", 404},
        },
    },
    { -- The Marine Marine
        3536,
        {
            {"Never"},
        },
    },
    { -- Pilgrim's Paunch
        3556,
        faction.Alliance,
        3557,
        {
            {"Event", 404},
        },
    },
    { -- Pilgrim's Paunch
        3557,
        faction.Horde,
        3556,
        {
            {"Event", 404},
        },
    },
    { -- Sharing is Caring
        3558,
        {
            {"Event", 404},
        },
    },
    { -- Turkey Lurkey
        3559,
        {
            {"Event", 404},
        },
    },
    { -- Now We're Cookin'
        3576,
        faction.Alliance,
        3577,
        {
            {"Event", 404},
        },
    },
    { -- Now We're Cookin'
        3577,
        faction.Horde,
        3576,
        {
            {"Event", 404},
        },
    },
    { -- The Turkinator
        3578,
        {
            {"Event", 404},
        },
    },
    { -- """FOOD FIGHT!"""
        3579,
        {
            {"Event", 404},
        },
    },
    { -- Pilgrim's Peril
        3580,
        faction.Alliance,
        3581,
        {
            {"Event", 404},
        },
    },
    { -- Pilgrim's Peril
        3581,
        faction.Horde,
        3580,
        {
            {"Event", 404},
        },
    },
    { -- Terokkar Turkey Time
        3582,
        {
            {"Event", 404},
        },
    },
    { -- Pilgrim's Progress
        3596,
        faction.Alliance,
        3597,
        {
            {"Event", 404},
        },
    },
    { -- Pilgrim's Progress
        3597,
        faction.Horde,
        3596,
        {
            {"Event", 404},
        },
    },
    { -- Murkimus the Gladiator
        3618,
        {
            IsPvP = true,
            {"Never"},
        },
    },
    { -- Jade Tiger
        3636,
        {
            {"Never"},
        },
    },
    { -- Pilgrim
        3656,
        faction.Horde,
        3478,
        {
            {"Event", 404},
        },
    },
    { -- Relentless Gladiator's Frost Wyrm
        3757,
        {
            IsPvP = true,
            {"PvP Season", 7},
        },
    },
    { -- Relentless Gladiator
        3758,
        {
            IsPvP = true,
            {"PvP Season", 7},
        },
    },
    { -- Isle of Conquest Victory
        3776,
        {
            IsPvP = true,
        },
    },
    { -- Isle of Conquest Veteran
        3777,
        {
            IsPvP = true,
        },
    },
    { -- Trial of the Champion
        3778,
        faction.Horde,
        4296,
    },
    {3797}, -- Upper Back Pain (10 player)
    {3798}, -- Resilience Will Fix It (10 player)
    {3799}, -- Salt and Pepper (10 player)
    {3800}, -- The Traitor King (10 player)
    {3802}, -- Argent Confessor
    {3803}, -- The Faceroller
    {3804}, -- I've Had Worse
    { -- A Tribute to Skill (10 player)
        3808,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Mad Skill (10 player)
        3809,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Insanity (10 player)
        3810,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    {3812}, -- Call of the Grand Crusade (25 player)
    {3813}, -- Upper Back Pain (25 player)
    {3815}, -- Salt and Pepper (25 player)
    {3816}, -- The Traitor King (25 player)
    { -- A Tribute to Skill (25 player)
        3817,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Mad Skill (25 player)
        3818,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Insanity (25 player)
        3819,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    {3836}, -- Koralon the Flame Watcher (10 player)
    {3837}, -- Koralon the Flame Watcher (25 player)
    { -- 1000 Dungeon & Raid Emblems
        3844,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Isle of Conquest All-Star
        3845,
        {
            IsPvP = true,
        },
    },
    { -- Resource Glut
        3846,
        faction.Alliance,
        4176,
        true,
    },
    { -- Four Car Garage
        3847,
        {
            IsPvP = true,
        },
    },
    { -- A-bomb-inable
        3848,
        {
            IsPvP = true,
        },
    },
    { -- A-bomb-ination
        3849,
        {
            IsPvP = true,
        },
    },
    { -- Mowed Down
        3850,
        {
            IsPvP = true,
        },
    },
    { -- Mine
        3851,
        faction.Alliance,
        4177,
        true,
    },
    { -- Cut the Blue Wire... No the Red Wire!
        3852,
        {
            IsPvP = true,
        },
    },
    { -- All Over the Isle
        3853,
        {
            IsPvP = true,
        },
    },
    { -- Back Door Job
        3854,
        {
            IsPvP = true,
        },
    },
    { -- Glaive Grave
        3855,
        {
            IsPvP = true,
        },
    },
    { -- Demolition Derby
        3856,
        faction.Alliance,
        4256,
        true,
    },
    { -- Master of Isle of Conquest
        3857,
        faction.Alliance,
        3957,
        true,
    },
    { -- Onyx Panther
        3896,
        {
            {"Never"},
        },
    },
    {3916}, -- Call of the Crusade (25 player)
    {3917}, -- Call of the Crusade (10 player)
    {3918}, -- Call of the Grand Crusade (10 player)
    {3936}, -- "Not One, But Two Jormungars (10 player)"
    {3937}, -- "Not One, But Two Jormungars (25 player)"
    { -- Master of Isle of Conquest
        3957,
        faction.Horde,
        3857,
        true,
    },
    {3996}, -- Three Sixty Pain Spike (10 player)
    {3997}, -- Three Sixty Pain Spike (25 player)
    {4016}, -- "Earth, Wind & Fire (10 player)"
    {4017}, -- "Earth, Wind & Fire (25 player)"
    { -- Realm First! Grand Crusader
        4078,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- A Tribute to Immortality
        4079,
        faction.Horde,
        4156,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Dedicated Insanity
        4080,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- A Tribute to Immortality
        4156,
        faction.Alliance,
        4079,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
    { -- Resource Glut
        4176,
        faction.Horde,
        3846,
        true,
    },
    { -- Mine
        4177,
        faction.Horde,
        3851,
        true,
    },
    { -- Demolition Derby
        4256,
        faction.Horde,
        3856,
        true,
    },
    { -- Trial of the Champion
        4296,
        faction.Alliance,
        3778,
    },
    { -- Heroic: Trial of the Champion
        4297,
        faction.Horde,
        4298,
    },
    { -- Heroic: Trial of the Champion
        4298,
        faction.Alliance,
        4297,
    },
    { -- 2500 Dungeon & Raid Emblems
        4316,
        {
            {"Before", "Version", {4, 0, 3}},
        },
    },
};

KrowiAF.AchievementData["03_02_02"] = {
    {KrowiAF.SetAchievementPatch, 3, 2, 2},
    {4396}, -- Onyxia's Lair (10 player)
    {4397}, -- Onyxia's Lair (25 player)
    { -- WoW's 5th Anniversary
        4400,
        {
            {"Never"},
        },
    },
    {4402}, -- More Dots! (10 player)
    {4403}, -- Many Whelps! Handle It! (10 player)
    {4404}, -- She Deep Breaths More (10 player)
    {4405}, -- More Dots! (25 player)
    {4406}, -- Many Whelps! Handle It! (25 player)
    {4407}, -- She Deep Breaths More (25 player)
    { -- BB King
        4436,
        faction.Alliance,
        4437,
        {
            {"Event", 141},
        },
    },
    { -- BB King
        4437,
        faction.Horde,
        4436,
        {
            {"Event", 141},
        },
    },
    {4476}, -- Looking For More
    {4477}, -- Looking For Many
    {4478}, -- Looking For Multitudes
    {4496}, -- It's Over Nine Thousand!
    {4585}, -- Toravon the Ice Watcher (10 player)
    {4586}, -- Toravon the Ice Watcher (25 player)
};

KrowiAF.AchievementData["03_03_00"] = {
    {KrowiAF.SetAchievementPatch, 3, 3, 0},
    {4516}, -- The Forge of Souls
    {4517}, -- The Pit of Saron
    {4518}, -- The Halls of Reflection
    {4519}, -- Heroic: The Forge of Souls
    {4520}, -- Heroic: The Pit of Saron
    {4521}, -- Heroic: The Halls of Reflection
    {4522}, -- Soul Power
    {4523}, -- Three Faced
    {4524}, -- Doesn't Go to Eleven
    {4525}, -- Don't Look Up
    {4526}, -- We're Not Retreating; We're Advancing in a Different Direction.
    {4527}, -- The Frostwing Halls (10 player)
    {4528}, -- The Plagueworks (10 player)
    {4529}, -- The Crimson Hall (10 player)
    {4530}, -- The Frozen Throne (10 player)
    {4531}, -- Storming the Citadel (10 player)
    {4532}, -- Fall of the Lich King (10 player)
    {4534}, -- Boned (10 player)
    {4535}, -- Full House (10 player)
    {4536}, -- I'm on a Boat (10 player)
    {4537}, -- I've Gone and Made a Mess (10 player)
    {4538}, -- Dances with Oozes (10 player)
    {4539}, -- "Once Bitten, Twice Shy (10 player)"
    { -- Realm First! Fall of the Lich King
        4576,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {4577}, -- Flu Shot Shortage (10 player)
    {4578}, -- "Nausea, Heartburn, Indigestion... (10 player)"
    {4579}, -- Portal Jockey (10 player)
    {4580}, -- All You Can Eat (10 player)
    {4581}, -- Neck-Deep in Vile (10 player)
    {4582}, -- The Orb Whisperer (10 player)
    {4583}, -- Bane of the Fallen King
    {4584}, -- The Light of Dawn
    {4596}, -- The Sword in the Skull
    {4597}, -- The Frozen Throne (25 player)
    {4598}, -- The Ashen Verdict
    { -- Wrathful Gladiator
        4599,
        {
            IsPvP = true,
            {"PvP Season", 8},
        },
    },
    { -- Wrathful Gladiator's Frost Wyrm
        4600,
        {
            IsPvP = true,
            {"PvP Season", 8},
        },
    },
    {4601}, -- Been Waiting a Long Time for This (10 player)
    {4602}, -- Glory of the Icecrown Raider (10 player)
    {4603}, -- Glory of the Icecrown Raider (25 player)
    {4604}, -- Storming the Citadel (25 player)
    {4605}, -- The Plagueworks (25 player)
    {4606}, -- The Crimson Hall (25 player)
    {4607}, -- The Frostwing Halls (25 player)
    {4608}, -- Fall of the Lich King (25 player)
    {4610}, -- Boned (25 player)
    {4611}, -- Full House (25 player)
    {4612}, -- I'm on a Boat (25 player)
    {4613}, -- I've Gone and Made a Mess (25 player)
    {4614}, -- Dances with Oozes (25 player)
    {4615}, -- Flu Shot Shortage (25 player)
    {4616}, -- "Nausea, Heartburn, Indigestion... (25 player)"
    {4617}, -- The Orb Whisperer (25 player)
    {4618}, -- "Once Bitten, Twice Shy (25 player)"
    {4619}, -- Portal Jockey (25 player)
    {4620}, -- All You Can Eat (25 player)
    {4621}, -- Been Waiting a Long Time for This (25 player)
    {4622}, -- Neck-Deep in Vile (25 player)
    {4623}, -- Shadowmourne
    { -- Tough Love
        4624,
        {
            {"Event", 423},
        },
    },
    {4625}, -- Invincible's Reins
    {4626}, -- And I'll Form the Head!
    {4627}, -- X-45 Heartbreaker
    {4628}, -- Heroic: Storming the Citadel (10 player)
    {4629}, -- Heroic: The Plagueworks (10 player)
    {4630}, -- Heroic: The Crimson Hall (10 player)
    {4631}, -- Heroic: The Frostwing Halls (10 player)
    {4632}, -- Heroic: Storming the Citadel (25 player)
    {4633}, -- Heroic: The Plagueworks (25 player)
    {4634}, -- Heroic: The Crimson Hall (25 player)
    {4635}, -- Heroic: The Frostwing Halls (25 player)
    {4636}, -- Heroic: Fall of the Lich King (10 player)
    {4637}, -- Heroic: Fall of the Lich King (25 player)
};

KrowiAF.AchievementData["03_03_03"] = {
    {KrowiAF.SetAchievementPatch, 3, 3, 3},
    { -- Green Brewfest Stein
        4782,
        {
            {"Never"},
        },
    },
    { -- Operation: Gnomeregan
        4786,
        faction.Alliance,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
    { -- Zalazane's Fall
        4790,
        faction.Horde,
        {
            {"Before", "Version", {4, 0, 1}},
        },
    },
};

KrowiAF.AchievementData["03_03_05"] = {
    {KrowiAF.SetAchievementPatch, 3, 3, 5},
    {4815}, -- The Twilight Destroyer (25 player)
    {4816}, -- Heroic: The Twilight Destroyer (25 player)
    {4817}, -- The Twilight Destroyer (10 player)
    {4818}, -- Heroic: The Twilight Destroyer (10 player)
    { -- Collector's Edition: Mini Thor
        4824,
        {
            {"Never"},
        },
    },
};

KrowiAF.AchievementData["03_04_00"] = {
    {KrowiAF.SetAchievementPatch, 3, 4, 0},
    { -- Survivor of the Firelord (Season of Mastery)
        15330,
        {
            {"Never"},
        },
    },
    { -- Survivor of the Shadow Flame (Season of Mastery)
        15333,
        {
            {"Never"},
        },
    },
    { -- Survivor of the Old God (Season of Mastery)
        15334,
        {
            {"Never"},
        },
    },
    { -- Survivor of the Damned (Season of Mastery)
        15335,
        {
            {"Never"},
        },
    },
    { -- The Immortal (Season of Mastery)
        15637,
        {
            {"Never"},
        },
    },
    {16332}, -- The Perfect Pebble
    { -- Soul of Iron (Season of Mastery)
        16433,
        {
            {"Never"},
        },
    },
};

KrowiAF.AchievementData["03_04_01"] = {
    {KrowiAF.SetAchievementPatch, 3, 4, 1},
    {17213}, -- Defense Protocol Alpha: Utgarde Keep
    {17283}, -- Defense Protocol Alpha: The Nexus
    {17285}, -- Defense Protocol Alpha: Azjol-Nerub
    {17291}, -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    {17292}, -- Defense Protocol Alpha: Drak'Tharon Keep
    {17293}, -- Defense Protocol Alpha: The Violet Hold
    {17295}, -- Defense Protocol Alpha: Gundrak
    {17297}, -- Defense Protocol Alpha: Halls of Stone
    {17299}, -- Defense Protocol Alpha: Halls of Lightning
    {17300}, -- Defense Protocol Alpha: The Oculus
    {17301}, -- Defense Protocol Alpha: Utgarde Pinnacle
    {17302}, -- Defense Protocol Alpha: The Culling of Stratholme
    {17304}, -- Defense Protocol Alpha: Terminated
};

KrowiAF.AchievementData["03_04_02"] = {
    {KrowiAF.SetAchievementPatch, 3, 4, 2},
    { -- Ahead of the Curve: Yogg-Saron
        17340,
        {
            {"Before", "Version", {3, 4, 3}},
        },
    },
    { -- Cutting Edge: Ulduar
        17341,
        {
            {"Before", "Version", {3, 4, 3}},
        },
    },
    {18590}, -- Defense Protocol Beta: Utgarde Keep
    {18591}, -- Defense Protocol Beta: The Nexus
    {18592}, -- Defense Protocol Beta: Azjol-Nerub
    {18593}, -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
    {18594}, -- Defense Protocol Beta: Drak'Tharon Keep
    {18595}, -- Defense Protocol Beta: The Violet Hold
    {18596}, -- Defense Protocol Beta: Gundrak
    {18597}, -- Defense Protocol Beta: Halls of Stone
    {18598}, -- Defense Protocol Beta: Halls of Lightning
    {18599}, -- Defense Protocol Beta: The Oculus
    {18600}, -- Defense Protocol Beta: Utgarde Pinnacle
    {18601}, -- Defense Protocol Beta: The Culling of Stratholme
    { -- Defense Protocol Beta: Terminated
        18614,
        faction.Alliance,
    },
    { -- Defense Protocol Beta: Trial of the Champion
        18677,
        faction.Alliance,
    },
    { -- Defense Protocol Beta: Trial of the Champion
        18678,
        faction.Horde,
    },
    { -- Defense Protocol Beta: Terminated
        18688,
        faction.Horde,
    },
};

KrowiAF.AchievementData["03_04_03"] = {
    {KrowiAF.SetAchievementPatch, 3, 4, 3},
    { -- Defense Protocol Gamma: Trial of the Champion
        19425,
        faction.Horde,
    },
    { -- Defense Protocol Gamma: Trial of the Champion
        19426,
        faction.Alliance,
    },
    {19427}, -- Defense Protocol Gamma: Utgarde Keep
    {19428}, -- Defense Protocol Gamma: The Nexus
    {19429}, -- Defense Protocol Gamma: Azjol-Nerub
    {19430}, -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
    {19431}, -- Defense Protocol Gamma: Drak'Tharon Keep
    {19432}, -- Defense Protocol Gamma: The Violet Hold
    {19433}, -- Defense Protocol Gamma: Gundrak
    {19434}, -- Defense Protocol Gamma: Halls of Stone
    {19435}, -- Defense Protocol Gamma: Halls of Lightning
    {19436}, -- Defense Protocol Gamma: The Oculus
    {19437}, -- Defense Protocol Gamma: Utgarde Pinnacle
    {19438}, -- Defense Protocol Gamma: The Culling of Stratholme
    { -- Defense Protocol Gamma: Terminated
        19439,
        faction.Alliance,
    },
    { -- Defense Protocol Gamma: Terminated
        19440,
        faction.Horde,
    },
};