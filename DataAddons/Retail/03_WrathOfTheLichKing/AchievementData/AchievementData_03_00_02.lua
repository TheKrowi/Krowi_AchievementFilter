local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_00_02"] = {
    {6}, -- Level 10
    {7}, -- Level 20
    {8}, -- Level 30
    {9}, -- Level 40
    { -- Level 50 (Legacy)
        10,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 60 (Legacy)
        11,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 70 (Legacy)
        12,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Level 80 (Legacy)
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
    {41}, -- Loremaster of Northrend
    {42}, -- Eastern Kingdoms Explorer
    {43}, -- Kalimdor Explorer
    {44}, -- Outland Explorer
    {45}, -- Northrend Explorer
    {46}, -- Universal Explorer
    { -- Disgracin' The Basin
        73,
        {
            IsPvP = true,
        },
    },
    {116}, -- Professional Journeyman
    {121}, -- Journeyman Cook
    {122}, -- Expert Cook
    {123}, -- Classic Cook
    {124}, -- Outland Cook
    {125}, -- Northrend Cook
    {126}, -- Journeyman Fisherman
    {127}, -- Expert Fisherman
    {128}, -- Artisan Fisherman
    {129}, -- Outland Fisherman
    {130}, -- Northrend Fisherman
    { -- Journeyman Medic
        131,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Expert Medic
        132,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Artisan Medic
        133,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Master Medic
        134,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Grand Master Medic
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
    { -- Save the Day
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
    {411}, -- Murky
    {412}, -- Murloc Costume
    {414}, -- Tyrael's Hilt
    {415}, -- Big Blizzard Bear
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
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Field Marshal
        434,
        faction.Alliance,
        445,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Commander
        435,
        faction.Alliance,
        444,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Lieutenant Commander
        436,
        faction.Alliance,
        447,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Knight-Champion
        437,
        faction.Alliance,
        448,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Knight-Captain
        438,
        faction.Alliance,
        469,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Knight
        439,
        faction.Alliance,
        451,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Sergeant Major
        440,
        faction.Alliance,
        452,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Master Sergeant
        441,
        faction.Alliance,
        450,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Private
        442,
        faction.Alliance,
        454,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- High Warlord
        443,
        faction.Horde,
        433,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Lieutenant General
        444,
        faction.Horde,
        435,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Warlord
        445,
        faction.Horde,
        434,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- General
        446,
        faction.Horde,
        473,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Champion
        447,
        faction.Horde,
        436,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Centurion
        448,
        faction.Horde,
        437,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Blood Guard
        449,
        faction.Horde,
        472,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Senior Sergeant
        450,
        faction.Horde,
        441,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Stone Guard
        451,
        faction.Horde,
        439,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- First Sergeant
        452,
        faction.Horde,
        440,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Sergeant
        453,
        faction.Horde,
        471,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Scout
        454,
        faction.Horde,
        442,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Realm First! Obsidian Slayer
        456,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 (Legacy)
        457,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Rogue (Legacy)
        458,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Warrior (Legacy)
        459,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Mage (Legacy)
        460,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Death Knight (Legacy)
        461,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Hunter (Legacy)
        462,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Warlock (Legacy)
        463,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Priest (Legacy)
        464,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Paladin (Legacy)
        465,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Druid (Legacy)
        466,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Shaman (Legacy)
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
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Legionnaire
        469,
        faction.Horde,
        438,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Corporal
        470,
        faction.Alliance,
        468,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Sergeant
        471,
        faction.Alliance,
        453,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Knight-Lieutenant
        472,
        faction.Alliance,
        449,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
        },
    },
    { -- Marshal
        473,
        faction.Alliance,
        446,
        true,
        {
            {"Before", "Version", {2, 0, 1}},
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
    { -- Orgrimmar Offensive
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
    { -- For the Alliance!
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
    { -- For the Horde!
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
    {662}, -- Collector's Edition: Mini-Diablo
    {663}, -- Collector's Edition: Panda
    {664}, -- Collector's Edition: Zergling
    {665}, -- Collector's Edition: Netherwhelp
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
    {683}, -- Collector's Edition: Frost Wyrm Whelp
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
        true,
        {
            {"PvP Season", 5},
        },
    },
    { -- Freedom of the Alliance
        701,
        faction.Alliance,
        700,
        true,
        {
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
    {732}, -- Professional Classic Master
    {733}, -- Professional Outland Master
    {734}, -- Professional Northrend Master
    {735}, -- Working In the Cold
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
    {890}, -- Into the Wild Blue Yonder
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
            {"Event", 1592},
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
        971,
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
    {973}, -- 5 Daily Quests Completed
    {974}, -- 50 Daily Quests Completed
    {975}, -- 200 Daily Quests Completed
    {976}, -- 500 Daily Quests Completed
    {977}, -- 1000 Daily Quests Completed
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
        {
            IsPvP = true,
        },
    },
    { -- Master of Arathi Basin
        1169,
        {
            IsPvP = true,
        },
    },
    { -- Master of Eye of the Storm
        1171,
        {
            IsPvP = true,
        },
    },
    { -- Master of Warsong Gulch
        1172,
        {
            IsPvP = true,
        },
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
    {1262}, -- Loremaster of Outland
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
    { -- Upper Blackrock Spire (Classic)
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
    { -- Realm First! Level 80 Gnome (Legacy)
        1404,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Blood Elf (Legacy)
        1405,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Draenei (Legacy)
        1406,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Dwarf (Legacy)
        1407,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Human (Legacy)
        1408,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Night Elf (Legacy)
        1409,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Orc (Legacy)
        1410,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Tauren (Legacy)
        1411,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Troll (Legacy)
        1412,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 80 Forsaken (Legacy)
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
    { -- Realm First! Grand Master Cook
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
    { -- Realm First! Grand Master Medic
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
            {"Before", "Date", {2019, 6, 11}}
        }
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
    {1563}, -- Hail to the Chef
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
        {
            {"Event", 324},
        },
    },
    {1658}, -- Champion of the Frozen Wastes
    {1676}, -- Loremaster of Eastern Kingdoms
    {1678}, -- Loremaster of Kalimdor
    { -- Brewmaster
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
        {
            {"Event", 141},
        },
    },
    { -- Fool For Love
        1693,
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
        {
            IsPvP = true,
        },
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
    {2144}, -- "What a Long, Strange Trip It's Been"
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
            {}
        }
    },
    { -- Vampire Hunter
        2456,
        {
            {"From", "Date", {2008, 10, 22}, "Until", "Date", {2008, 11, 4}}
        }
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
            {"Before", "Version", {3, 0, 8}},
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
            {"Before", "Version", {3, 0, 8}},
        },
    },
    { -- Brew of the Month
        2796,
        {
            {"Event", 372},
        },
    },
    {3496}, -- A Brew-FAST Mount
    {KrowiAF.SetAchievementPatch, 3, 0, 2}, -- Rework loading so this can go to the top, future me problem
};