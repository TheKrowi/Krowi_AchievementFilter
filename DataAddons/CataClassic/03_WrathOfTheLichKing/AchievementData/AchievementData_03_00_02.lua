local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_00_02"] = {
    { -- Level 10
        6,
    },
    { -- Level 20
        7,
    },
    { -- Level 30
        8,
    },
    { -- Level 40
        9,
    },
    { -- Level 50 (Legacy)
        10,
    },
    { -- Level 60 (Legacy)
        11,
    },
    { -- Level 70 (Legacy)
        12,
    },
    { -- Level 80 (Legacy)
        13,
    },
    { -- Plenty of Pets
        15,
    },
    { -- Did Somebody Order a Knuckle Sandwich?
        16,
    },
    { -- A Simple Re-Quest
        31,
    },
    { -- 2000 Quests Completed
        32,
    },
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
    { -- The Empire of Zul'Drak
        36,
    },
    { -- Fo' Grizzle My Shizzle
        37,
        faction.Alliance,
        1357,
    },
    { -- The Summit of Storm Peaks
        38,
    },
    { -- Into the Basin
        39,
    },
    { -- Icecrown: The Final Goal
        40,
    },
    { -- Loremaster of Northrend
        41,
        faction.Alliance,
    },
    { -- Eastern Kingdoms Explorer
        42,
    },
    { -- Kalimdor Explorer
        43,
    },
    { -- Outland Explorer
        44,
    },
    { -- Northrend Explorer
        45,
    },
    { -- Universal Explorer
        46,
    },
    { -- Disgracin' The Basin
        73,
        {
            IsPvP = true,
        },
    },
    { -- Professional Journeyman
        116,
    },
    { -- Journeyman Cook
        121,
    },
    { -- Expert Cook
        122,
    },
    { -- Classic Cook
        123,
    },
    { -- Outland Cook
        124,
    },
    { -- Northrend Cook
        125,
    },
    { -- Journeyman Fisherman
        126,
    },
    { -- Expert Fisherman
        127,
    },
    { -- Artisan Fisherman
        128,
    },
    { -- Outland Fisherman
        129,
    },
    { -- Northrend Fisherman
        130,
    },
    { -- Journeyman Medic
        131,
    },
    { -- Expert Medic
        132,
    },
    { -- Artisan Medic
        133,
    },
    { -- Master Medic
        134,
    },
    { -- Grand Master Medic
        135,
    },
    { -- Stocking Up
        137,
    },
    { -- Ultimate Triage
        141,
    },
    { -- The Lurker Above
        144,
    },
    { -- The Fishing Diplomat
        150,
    },
    { -- The Old Gnome and the Sea
        153,
    },
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
    },
    { -- Dressed for the Occasion
        249,
    },
    { -- With a Little Helper from My Friends
        252,
        {
            IsPvP = true,
        },
    },
    { -- Bring Me The Head of... Oh Wait
        255,
    },
    { -- Scrooge
        259,
        faction.Horde,
        1255,
    },
    { -- Charming
        260,
    },
    { -- Ice the Frost Lord
        263,
    },
    { -- Burning Hot Pole Dance
        271,
    },
    { -- Torch Juggler
        272,
    },
    { -- On Metzen!
        273,
    },
    { -- Veteran Nanny
        275,
    },
    { -- 'Tis the Season
        277,
    },
    { -- Simply Abominable
        279,
    },
    { -- The Masquerade
        283,
    },
    { -- A Mask for All Occasions
        284,
    },
    { -- Out With It
        288,
    },
    { -- The Savior of Hallow's End
        289,
    },
    { -- Check Your Head
        291,
    },
    { -- Sinister Calling
        292,
    },
    { -- Disturbing the Peace
        293,
    },
    { -- Direbrewfest
        295,
    },
    { -- "Have Keg, Will Travel"
        303,
    },
    { -- Master Angler of Azeroth
        306,
    },
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
        },
    },
    { -- High Five: 1750
        407,
        {
            IsPvP = true,
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
        },
    },
    { -- Murky
        411,
    },
    { -- Murloc Costume
        412,
    },
    { -- Tyrael's Hilt
        414,
    },
    { -- Big Blizzard Bear
        415,
    },
    { -- Scarab Lord
        416,
    },
    { -- Merciless Gladiator
        418,
        {
            IsPvP = true,
        },
    },
    { -- Vengeful Gladiator
        419,
        {
            IsPvP = true,
        },
    },
    { -- Brutal Gladiator
        420,
        {
            IsPvP = true,
        },
    },
    { -- Why? Because It's Red
        424,
    },
    { -- "Atiesh, Greatstaff of the Guardian"
        425,
    },
    { -- Warglaives of Azzinoth
        426,
    },
    { -- "Thunderfury, Blessed Blade of the Windseeker"
        428,
    },
    { -- "Sulfuras, Hand of Ragnaros"
        429,
    },
    { -- Amani War Bear
        430,
    },
    { -- Hand of A'dal
        431,
    },
    { -- Champion of the Naaru
        432,
    },
    { -- Grand Marshal
        433,
        faction.Alliance,
        443,
        true,
    },
    { -- Field Marshal
        434,
        faction.Alliance,
        445,
        true,
    },
    { -- Commander
        435,
        faction.Alliance,
        444,
        true,
    },
    { -- Lieutenant Commander
        436,
        faction.Alliance,
        447,
        true,
    },
    { -- Knight-Champion
        437,
        faction.Alliance,
        448,
        true,
    },
    { -- Knight-Captain
        438,
        faction.Alliance,
        469,
        true,
    },
    { -- Knight
        439,
        faction.Alliance,
        451,
        true,
    },
    { -- Sergeant Major
        440,
        faction.Alliance,
        452,
        true,
    },
    { -- Master Sergeant
        441,
        faction.Alliance,
        450,
        true,
    },
    { -- Private
        442,
        faction.Alliance,
        454,
        true,
    },
    { -- High Warlord
        443,
        faction.Horde,
        433,
        true,
    },
    { -- Lieutenant General
        444,
        faction.Horde,
        435,
        true,
    },
    { -- Warlord
        445,
        faction.Horde,
        434,
        true,
    },
    { -- General
        446,
        faction.Horde,
        473,
        true,
    },
    { -- Champion
        447,
        faction.Horde,
        436,
        true,
    },
    { -- Centurion
        448,
        faction.Horde,
        437,
        true,
    },
    { -- Blood Guard
        449,
        faction.Horde,
        472,
        true,
    },
    { -- Senior Sergeant
        450,
        faction.Horde,
        441,
        true,
    },
    { -- Stone Guard
        451,
        faction.Horde,
        439,
        true,
    },
    { -- First Sergeant
        452,
        faction.Horde,
        440,
        true,
    },
    { -- Sergeant
        453,
        faction.Horde,
        471,
        true,
    },
    { -- Scout
        454,
        faction.Horde,
        442,
        true,
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
    },
    { -- Legionnaire
        469,
        faction.Horde,
        438,
        true,
    },
    { -- Corporal
        470,
        faction.Alliance,
        468,
        true,
    },
    { -- Sergeant
        471,
        faction.Alliance,
        453,
        true,
    },
    { -- Knight-Lieutenant
        472,
        faction.Alliance,
        449,
        true,
    },
    { -- Marshal
        473,
        faction.Alliance,
        446,
        true,
    },
    { -- Utgarde Keep
        477,
    },
    { -- The Nexus
        478,
    },
    { -- The Culling of Stratholme
        479,
    },
    { -- Azjol-Nerub
        480,
    },
    { -- Ahn'kahet: The Old Kingdom
        481,
    },
    { -- Drak'Tharon Keep
        482,
    },
    { -- The Violet Hold
        483,
    },
    { -- Gundrak
        484,
    },
    { -- Halls of Stone
        485,
    },
    { -- Halls of Lightning
        486,
    },
    { -- The Oculus
        487,
    },
    { -- Utgarde Pinnacle
        488,
    },
    { -- Heroic: Utgarde Keep
        489,
    },
    { -- Heroic: The Nexus
        490,
    },
    { -- Heroic: Azjol-Nerub
        491,
    },
    { -- Heroic: Ahn'kahet: The Old Kingdom
        492,
    },
    { -- Heroic: Drak'Tharon Keep
        493,
    },
    { -- Heroic: The Violet Hold
        494,
    },
    { -- Heroic: Gundrak
        495,
    },
    { -- Heroic: Halls of Stone
        496,
    },
    { -- Heroic: Halls of Lightning
        497,
    },
    { -- Heroic: The Oculus
        498,
    },
    { -- Heroic: Utgarde Pinnacle
        499,
    },
    { -- Heroic: The Culling of Stratholme
        500,
    },
    { -- 50 Quests Completed
        503,
    },
    { -- 100 Quests Completed
        504,
    },
    { -- 250 Quests Completed
        505,
    },
    { -- 500 Quests Completed
        506,
    },
    { -- 1000 Quests Completed
        507,
    },
    { -- 1500 Quests Completed
        508,
    },
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
    { -- 30 Exalted Reputations
        518,
    },
    { -- 25 Exalted Reputations
        519,
    },
    { -- 20 Exalted Reputations
        520,
    },
    { -- 15 Exalted Reputations
        521,
    },
    { -- Somebody Likes Me
        522,
    },
    { -- 5 Exalted Reputations
        523,
    },
    { -- 10 Exalted Reputations
        524,
    },
    { -- Shave and a Haircut
        545,
    },
    { -- Safe Deposit
        546,
    },
    { -- Veteran of the Wrathgate
        547,
    },
    { -- Epic
        556,
    },
    { -- Superior
        557,
    },
    { -- Greedy
        558,
    },
    { -- Needy
        559,
    },
    { -- Deadliest Catch
        560,
    },
    { -- D.E.H.T.A's Little P.I.T.A.
        561,
    },
    { -- The Arachnid Quarter (10 player)
        562,
    },
    { -- The Arachnid Quarter (25 player)
        563,
    },
    { -- The Construct Quarter (10 player)
        564,
    },
    { -- The Construct Quarter (25 player)
        565,
    },
    { -- The Plague Quarter (10 player)
        566,
    },
    { -- The Plague Quarter (25 player)
        567,
    },
    { -- The Military Quarter (10 player)
        568,
    },
    { -- The Military Quarter (25 player)
        569,
    },
    { -- Sapphiron's Demise (10 player)
        572,
    },
    { -- Sapphiron's Demise (25 player)
        573,
    },
    { -- Kel'Thuzad's Defeat (10 player)
        574,
    },
    { -- Kel'Thuzad's Defeat (25 player)
        575,
    },
    { -- The Fall of Naxxramas (10 player)
        576,
    },
    { -- The Fall of Naxxramas (25 player)
        577,
    },
    { -- The Dedicated Few (10 player)
        578,
    },
    { -- The Dedicated Few (25 player)
        579,
    },
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
    },
    { -- 5 Coins of Ancestry
        606,
    },
    { -- 10 Coins of Ancestry
        607,
    },
    { -- 25 Coins of Ancestry
        608,
    },
    { -- 50 Coins of Ancestry
        609,
    },
    { -- Orgrimmar Offensive
        610,
        faction.Alliance,
        615,
        true,
    },
    { -- Bleeding Bloodhoof
        611,
        faction.Alliance,
        616,
        true,
    },
    { -- Downing the Dark Lady
        612,
        faction.Alliance,
        617,
        true,
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
    { -- Represent
        621,
    },
    { -- The Spellweaver's Downfall (10 player)
        622,
    },
    { -- The Spellweaver's Downfall (25 player)
        623,
    },
    { -- Less Is More (10 player)
        624,
    },
    { -- Besting the Black Dragonflight (25 player)
        625,
    },
    { -- Lunar Festival Finery
        626,
    },
    { -- Explore Dun Morogh
        627,
    },
    { -- Deadmines
        628,
    },
    { -- Ragefire Chasm
        629,
    },
    { -- Wailing Caverns
        630,
    },
    { -- Shadowfang Keep
        631,
    },
    { -- Blackfathom Deeps
        632,
    },
    { -- Stormwind Stockade
        633,
    },
    { -- Gnomeregan
        634,
    },
    { -- Razorfen Kraul
        635,
    },
    { -- Razorfen Downs
        636,
    },
    { -- Scarlet Monastery
        637,
    },
    { -- Uldaman
        638,
    },
    { -- Zul'Farrak
        639,
    },
    { -- Maraudon
        640,
    },
    { -- Sunken Temple
        641,
    },
    { -- Blackrock Depths
        642,
    },
    { -- Lower Blackrock Spire
        643,
    },
    { -- King of Dire Maul
        644,
    },
    { -- Scholomance
        645,
    },
    { -- Stratholme
        646,
    },
    { -- Hellfire Ramparts
        647,
    },
    { -- The Blood Furnace
        648,
    },
    { -- The Slave Pens
        649,
    },
    { -- Underbog
        650,
    },
    { -- Mana-Tombs
        651,
    },
    { -- The Escape From Durnholde
        652,
    },
    { -- Sethekk Halls
        653,
    },
    { -- Shadow Labyrinth
        654,
    },
    { -- Opening of the Dark Portal
        655,
    },
    { -- The Steamvault
        656,
    },
    { -- The Shattered Halls
        657,
    },
    { -- The Mechanar
        658,
    },
    { -- The Botanica
        659,
    },
    { -- The Arcatraz
        660,
    },
    { -- Magister's Terrace
        661,
    },
    { -- Collector's Edition: Mini-Diablo
        662,
    },
    { -- Collector's Edition: Panda
        663,
    },
    { -- Collector's Edition: Zergling
        664,
    },
    { -- Collector's Edition: Netherwhelp
        665,
    },
    { -- Auchenai Crypts
        666,
    },
    { -- Heroic: Hellfire Ramparts
        667,
    },
    { -- Heroic: The Blood Furnace
        668,
    },
    { -- Heroic: The Slave Pens
        669,
    },
    { -- Heroic: Underbog
        670,
    },
    { -- Heroic: Mana-Tombs
        671,
    },
    { -- Heroic: Auchenai Crypts
        672,
    },
    { -- Heroic: The Escape From Durnholde
        673,
    },
    { -- Heroic: Sethekk Halls
        674,
    },
    { -- Heroic: Shadow Labyrinth
        675,
    },
    { -- Heroic: Opening of the Dark Portal
        676,
    },
    { -- Heroic: The Steamvault
        677,
    },
    { -- Heroic: The Shattered Halls
        678,
    },
    { -- Heroic: The Mechanar
        679,
    },
    { -- Heroic: The Botanica
        680,
    },
    { -- Heroic: The Arcatraz
        681,
    },
    { -- Heroic: Magister's Terrace
        682,
    },
    { -- Collector's Edition: Frost Wyrm Whelp
        683,
    },
    { -- Onyxia's Lair (Level 60)
        684,
    },
    { -- Blackwing Lair
        685,
    },
    { -- Molten Core
        686,
    },
    { -- Temple of Ahn'Qiraj
        687,
    },
    { -- Zul'Gurub
        688,
    },
    { -- Ruins of Ahn'Qiraj
        689,
    },
    { -- Karazhan
        690,
    },
    { -- Zul'Aman
        691,
    },
    { -- Gruul's Lair
        692,
    },
    { -- Magtheridon's Lair
        693,
    },
    { -- Serpentshrine Cavern
        694,
    },
    { -- The Battle for Mount Hyjal
        695,
    },
    { -- Tempest Keep
        696,
    },
    { -- The Black Temple
        697,
    },
    { -- Sunwell Plateau
        698,
    },
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
    },
    { -- Freedom of the Alliance
        701,
        faction.Alliance,
        700,
        true,
    },
    { -- Master of Arms
        705,
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
    { -- "Thori'dal, the Stars' Fury"
        725,
    },
    { -- Mr. Pinchy's Magical Crawdad Box
        726,
    },
    { -- Call in the Cavalry
        727,
        {
            IsPvP = true,
        },
    },
    { -- Explore Durotar
        728,
    },
    { -- Deathcharger's Reins
        729,
    },
    { -- Skills to Pay the Bills
        730,
    },
    { -- Professional Expert
        731,
    },
    { -- Professional Classic Master
        732,
    },
    { -- Professional Outland Master
        733,
    },
    { -- Professional Northrend Master
        734,
    },
    { -- Working In the Cold
        735,
    },
    { -- Explore Mulgore
        736,
    },
    { -- Explore Northern Barrens
        750,
    },
    { -- Explore Arathi Highlands
        761,
    },
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
    { -- Explore Badlands
        765,
    },
    { -- Explore Blasted Lands
        766,
    },
    { -- Explore Tirisfal Glades
        768,
    },
    { -- Explore Silverpine Forest
        769,
    },
    { -- Explore Western Plaguelands
        770,
    },
    { -- Explore Eastern Plaguelands
        771,
    },
    { -- Explore Hillsbrad Foothills
        772,
    },
    { -- Explore The Hinterlands
        773,
    },
    { -- Explore Searing Gorge
        774,
    },
    { -- Explore Burning Steppes
        775,
    },
    { -- Explore Elwynn Forest
        776,
    },
    { -- Explore Deadwind Pass
        777,
    },
    { -- Explore Duskwood
        778,
    },
    { -- Explore Loch Modan
        779,
    },
    { -- Explore Redridge Mountains
        780,
    },
    { -- Explore Northern Stranglethorn
        781,
    },
    { -- Explore Swamp of Sorrows
        782,
    },
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
    { -- Explore Westfall
        802,
    },
    { -- Explore Wetlands
        841,
    },
    { -- Explore Teldrassil
        842,
    },
    { -- Explore Netherstorm
        843,
    },
    { -- Explore Darkshore
        844,
    },
    { -- Explore Ashenvale
        845,
    },
    { -- Explore Thousand Needles
        846,
    },
    { -- Explore Stonetalon Mountains
        847,
    },
    { -- Explore Desolace
        848,
    },
    { -- Explore Feralas
        849,
    },
    { -- Explore Dustwallow Marsh
        850,
    },
    { -- Explore Tanaris
        851,
    },
    { -- Explore Azshara
        852,
    },
    { -- Explore Felwood
        853,
    },
    { -- Explore Un'Goro Crater
        854,
    },
    { -- Explore Moonglade
        855,
    },
    { -- Explore Silithus
        856,
    },
    { -- Explore Winterspring
        857,
    },
    { -- Explore Ghostlands
        858,
    },
    { -- Explore Eversong Woods
        859,
    },
    { -- Explore Azuremyst Isle
        860,
    },
    { -- Explore Bloodmyst Isle
        861,
    },
    { -- Explore Hellfire Peninsula
        862,
    },
    { -- Explore Zangarmarsh
        863,
    },
    { -- Explore Shadowmoon Valley
        864,
    },
    { -- Explore Blade's Edge Mountains
        865,
    },
    { -- Explore Nagrand
        866,
    },
    { -- Explore Terokkar Forest
        867,
    },
    { -- Explore Isle of Quel'Danas
        868,
    },
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
    { -- "Avast Ye, Admiral!"
        871,
    },
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
    { -- The Cake Is Not A Lie
        877,
    },
    { -- One That Didn't Get Away
        878,
    },
    { -- Old School Ride
        879,
    },
    { -- Swift Zulian Tiger
        880,
    },
    { -- Swift Razzashi Raptor
        881,
    },
    { -- Fiery Warhorse's Reins
        882,
    },
    { -- Reins of the Raven Lord
        883,
    },
    { -- Swift White Hawkstrider
        884,
    },
    { -- Ashes of Al'ar
        885,
    },
    { -- Swift Nether Drake
        886,
        {
            IsPvP = true,
        },
    },
    { -- Merciless Nether Drake
        887,
        {
            IsPvP = true,
        },
    },
    { -- Vengeful Nether Drake
        888,
        {
            IsPvP = true,
        },
    },
    { -- Fast and Furious
        889,
    },
    { -- Into the Wild Blue Yonder
        890,
    },
    { -- Giddy Up!
        891,
    },
    { -- The Right Stuff
        892,
    },
    { -- Cenarion War Hippogryph
        893,
    },
    { -- Flying High Over Skettis
        894,
    },
    { -- A Quest a Day Keeps the Ogres at Bay
        896,
    },
    { -- You're So Offensive
        897,
    },
    { -- On Wings of Nether
        898,
    },
    { -- "Oh My, Kurenai"
        899,
        faction.Alliance,
        901,
    },
    { -- The Czar of Sporeggar
        900,
    },
    { -- Mag'har of Draenor
        901,
        faction.Horde,
        899,
    },
    { -- Chief Exalted Officer
        902,
    },
    { -- Shattrath Divided
        903,
    },
    { -- Old Man Barlowned
        905,
    },
    { -- Kickin' It Up a Notch
        906,
    },
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
    },
    { -- Elders of Kalimdor
        911,
    },
    { -- Elders of Eastern Kingdoms
        912,
    },
    { -- To Honor One's Elders
        913,
    },
    { -- Elders of the Horde
        914,
    },
    { -- Elders of the Alliance
        915,
    },
    { -- Elune's Blessing
        937,
    },
    { -- The Snows of Northrend
        938,
    },
    { -- Hills Like White Elekk
        939,
    },
    { -- The Green Hills of Stranglethorn
        940,
    },
    { -- Hemet Nesingwary: The Collected Quests
        941,
    },
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
    { -- They Love Me In That Tunnel
        944,
    },
    { -- The Argent Champion
        945,
    },
    { -- The Argent Dawn
        946,
    },
    { -- The Argent Crusade
        947,
    },
    { -- Ambassador of the Alliance
        948,
        faction.Alliance,
        762,
    },
    { -- Tuskarrmageddon
        949,
    },
    { -- Frenzyheart Tribe
        950,
    },
    { -- The Oracles
        951,
    },
    { -- Mercenary of Sholazar
        952,
    },
    { -- Guardian of Cenarius
        953,
    },
    { -- Hydraxian Waterlords
        955,
    },
    { -- Brood of Nozdormu
        956,
    },
    { -- Hero of the Zandalar Tribe
        957,
    },
    { -- Sworn to the Deathsworn
        958,
    },
    { -- The Scale of the Sands
        959,
    },
    { -- The Violet Eye
        960,
    },
    { -- Honorary Frenzyheart
        961,
    },
    { -- Savior of the Oracles
        962,
    },
    { -- Tricks and Treats of Kalimdor
        963,
        faction.Alliance,
        965,
    },
    { -- Going Down?
        964,
    },
    { -- Tricks and Treats of Kalimdor
        965,
        faction.Horde,
        963,
    },
    { -- Tricks and Treats of Eastern Kingdoms
        966,
        faction.Alliance,
        967,
    },
    { -- Tricks and Treats of Eastern Kingdoms
        967,
        faction.Horde,
        966,
    },
    { -- Tricks and Treats of Outland
        968,
        faction.Horde,
        969,
    },
    { -- Tricks and Treats of Outland
        969,
        faction.Alliance,
        968,
    },
    { -- Tricks and Treats of Azeroth
        970,
        faction.Alliance,
    },
    { -- Tricks and Treats of Azeroth
        971,
        faction.Horde,
    },
    { -- Trick or Treat!
        972,
    },
    { -- 5 Daily Quests Completed
        973,
    },
    { -- 50 Daily Quests Completed
        974,
    },
    { -- 200 Daily Quests Completed
        975,
    },
    { -- 500 Daily Quests Completed
        976,
    },
    { -- 1000 Daily Quests Completed
        977,
    },
    { -- 3000 Quests Completed
        978,
    },
    { -- The Mask Task
        979,
    },
    { -- The Horseman's Reins
        980,
    },
    { -- That Sparkling Smile
        981,
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
    { -- The Wyrmrest Accord
        1007,
    },
    { -- The Kirin Tor
        1008,
    },
    { -- Knights of the Ebon Blade
        1009,
    },
    { -- Northrend Vanguard
        1010,
    },
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
    { -- 35 Exalted Reputations
        1014,
    },
    { -- 40 Exalted Reputations
        1015,
    },
    { -- Can I Keep Him?
        1017,
    },
    { -- Ten Tabards
        1020,
    },
    { -- Twenty-Five Tabards
        1021,
    },
    { -- Flame Warden of Eastern Kingdoms
        1022,
        faction.Alliance,
        1025,
    },
    { -- Flame Warden of Kalimdor
        1023,
        faction.Alliance,
        1026,
    },
    { -- Flame Warden of Outland
        1024,
        faction.Alliance,
        1027,
    },
    { -- Flame Keeper of Eastern Kingdoms
        1025,
        faction.Horde,
        1022,
    },
    { -- Flame Keeper of Kalimdor
        1026,
        faction.Horde,
        1023,
    },
    { -- Flame Keeper of Outland
        1027,
        faction.Horde,
        1024,
    },
    { -- Extinguishing Eastern Kingdoms
        1028,
        faction.Alliance,
        1031,
    },
    { -- Extinguishing Kalimdor
        1029,
        faction.Alliance,
        1032,
    },
    { -- Extinguishing Outland
        1030,
        faction.Alliance,
        1033,
    },
    { -- Extinguishing Eastern Kingdoms
        1031,
        faction.Horde,
        1028,
    },
    { -- Extinguishing Kalimdor
        1032,
        faction.Horde,
        1029,
    },
    { -- Extinguishing Outland
        1033,
        faction.Horde,
        1030,
    },
    { -- The Fires of Azeroth
        1034,
        faction.Alliance,
        1036,
    },
    { -- Desecration of the Horde
        1035,
        faction.Alliance,
        1037,
    },
    { -- The Fires of Azeroth
        1036,
        faction.Horde,
        1034,
    },
    { -- Desecration of the Alliance
        1037,
        faction.Horde,
        1035,
    },
    { -- The Flame Warden
        1038,
        faction.Alliance,
        1039,
    },
    { -- The Flame Keeper
        1039,
        faction.Horde,
        1038,
    },
    { -- Rotten Hallow
        1040,
        faction.Alliance,
        1041,
    },
    { -- Rotten Hallow
        1041,
        faction.Horde,
        1040,
    },
    { -- King of the Fire Festival
        1145,
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
    { -- "My Storage is ""Gigantique"""
        1165,
    },
    { -- To the Looter Go the Spoils
        1166,
        {
            IsPvP = true,
        },
    },
    { -- Master of Alterac Valley
        1167,
        faction.Alliance,
        nil,
        true,
    },
    { -- Master of Alterac Valley
        1168,
        faction.Horde,
    },
    { -- Master of Arathi Basin
        1169,
        faction.Alliance,
        nil,
        true,
    },
    { -- Master of Arathi Basin
        1170,
        faction.Horde,
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
        nil,
        true,
    },
    { -- Master of Warsong Gulch
        1173,
        faction.Horde,
    },
    { -- The Arena Master
        1174,
        {
            IsPvP = true,
        },
    },
    { -- Battlemaster
        1175,
        faction.Horde,
        230,
        true,
    },
    { -- Got My Mind On My Money
        1176,
    },
    { -- Got My Mind On My Money
        1177,
    },
    { -- Got My Mind On My Money
        1178,
    },
    { -- Got My Mind On My Money
        1180,
    },
    { -- Got My Mind On My Money
        1181,
    },
    { -- The Bread Winner
        1182,
    },
    { -- Brew of the Year
        1183,
    },
    { -- Strange Brew
        1184,
        faction.Alliance,
        1203,
    },
    { -- The Brewfest Diet
        1185,
    },
    { -- Down With The Dark Iron
        1186,
    },
    { -- Shafted!
        1188,
    },
    { -- To Hellfire and Back
        1189,
        faction.Alliance,
        1271,
    },
    { -- Mysteries of the Marsh
        1190,
    },
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
    { -- On the Blade's Edge
        1193,
    },
    { -- Into the Nether
        1194,
    },
    { -- Shadow of the Betrayer
        1195,
    },
    { -- Strange Brew
        1203,
        faction.Horde,
        1184,
    },
    { -- Hero of Shattrath
        1205,
    },
    { -- To All The Squirrels I've Loved Before
        1206,
    },
    { -- Outland Angler
        1225,
    },
    { -- Fish Don't Leave Footprints
        1243,
    },
    { -- Well Read
        1244,
    },
    { -- Plethora of Pets
        1248,
    },
    { -- "Shop Smart, Shop Pet...Smart"
        1250,
    },
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
    { -- Friend or Fowl?
        1254,
    },
    { -- Scrooge
        1255,
        faction.Alliance,
        259,
    },
    { -- The Scavenger
        1257,
    },
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
    },
    { -- G.N.E.R.D. Rage
        1261,
    },
    { -- Loremaster of Outland
        1262,
        faction.Alliance,
    },
    { -- Explore Howling Fjord
        1263,
    },
    { -- Explore Borean Tundra
        1264,
    },
    { -- Explore Dragonblight
        1265,
    },
    { -- Explore Grizzly Hills
        1266,
    },
    { -- Explore Zul'Drak
        1267,
    },
    { -- Explore Sholazar Basin
        1268,
    },
    { -- Explore Storm Peaks
        1269,
    },
    { -- Explore Icecrown
        1270,
    },
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
    },
    { -- Bombs Away
        1275,
    },
    { -- Blade's Edge Bomberman
        1276,
    },
    { -- Rapid Defense
        1277,
    },
    { -- Flirt With Disaster
        1279,
        faction.Alliance,
        1280,
    },
    { -- Flirt With Disaster
        1280,
        faction.Horde,
        1279,
    },
    { -- The Rocket's Red Glare
        1281,
    },
    { -- Fa-la-la-la-Ogri'la
        1282,
    },
    { -- Classic Dungeonmaster
        1283,
    },
    { -- Outland Dungeonmaster
        1284,
    },
    { -- Classic Raider
        1285,
    },
    { -- Outland Raider
        1286,
    },
    { -- Outland Dungeon Hero
        1287,
    },
    { -- Northrend Dungeonmaster
        1288,
    },
    { -- Northrend Dungeon Hero
        1289,
    },
    { -- Lonely?
        1291,
    },
    { -- Yellow Brewfest Stein
        1292,
    },
    { -- Blue Brewfest Stein
        1293,
    },
    { -- Crashin' & Thrashin'
        1295,
    },
    { -- Watch Him Die
        1296,
    },
    { -- Hadronox Denied
        1297,
    },
    { -- Upper Blackrock Spire (Classic)
        1307,
    },
    { -- Strand of the Ancients Victory
        1308,
        {
            IsPvP = true,
        },
    },
    { -- Strand of the Ancients Veteran
        1309,
        {
            IsPvP = true,
        },
    },
    { -- Storm the Beach
        1310,
        {
            IsPvP = true,
        },
    },
    { -- Medium Rare
        1311,
    },
    { -- Bloody Rare
        1312,
    },
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
    },
    { -- Elders of Northrend
        1396,
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
    { -- Mine Sweeper
        1428,
    },
    { -- Friends In High Places
        1436,
    },
    { -- Explore Crystalsong Forest
        1457,
    },
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
    { -- Accomplished Angler
        1516,
    },
    { -- Northrend Angler
        1517,
    },
    { -- Frenzied Firecracker
        1552,
    },
    { -- 25 Fish
        1556,
    },
    { -- 50 Fish
        1557,
    },
    { -- 100 Fish
        1558,
    },
    { -- 250 Fish
        1559,
    },
    { -- 500 Fish
        1560,
    },
    { -- 1000 Fish
        1561,
    },
    { -- Hail to the Chef
        1563,
        faction.Alliance,
        1784,
    },
    { -- Of Blood and Anguish
        1576,
    },
    { -- Guru of Drakuru
        1596,
    },
    { -- Competitor's Tabard
        1636,
    },
    { -- Spirit of Competition
        1637,
    },
    { -- Skyshattered
        1638,
    },
    { -- Hallowed Be Thy Name
        1656,
        faction.Alliance,
    },
    { -- Hallowed Be Thy Name
        1657,
        faction.Horde,
    },
    { -- Champion of the Frozen Wastes
        1658,
    },
    { -- Loremaster of Eastern Kingdoms
        1676,
        faction.Alliance,
    },
    { -- Loremaster of Eastern Kingdoms
        1677,
        faction.Horde,
    },
    { -- Loremaster of Kalimdor
        1678,
        faction.Alliance,
    },
    { -- Loremaster of Kalimdor
        1680,
        faction.Horde,
    },
    { -- The Loremaster
        1681,
        faction.Alliance,
    },
    { -- The Loremaster
        1682,
        faction.Horde,
    },
    { -- Brewmaster
        1683,
        faction.Horde,
    },
    { -- Brewmaster
        1684,
        faction.Alliance,
    },
    { -- Holiday Bromance
        1685,
        faction.Horde,
        1686,
    },
    { -- Holiday Bromance
        1686,
        faction.Alliance,
        1685,
    },
    { -- Let It Snow
        1687,
    },
    { -- The Winter Veil Gourmet
        1688,
    },
    { -- He Knows If You've Been Naughty
        1689,
    },
    { -- A Frosty Shake
        1690,
    },
    { -- Merrymaker
        1691,
        faction.Horde,
    },
    { -- Merrymaker
        1692,
        faction.Alliance,
    },
    { -- Fool For Love
        1693,
        faction.Horde,
    },
    { -- Lovely Luck Is On Your Side
        1694,
    },
    { -- Dangerous Love
        1695,
    },
    { -- The Rocket's Pink Glare
        1696,
    },
    { -- Nation of Adoration
        1697,
        faction.Alliance,
        1698,
    },
    { -- Nation of Adoration
        1698,
        faction.Horde,
        1697,
    },
    { -- Fistful of Love
        1699,
    },
    { -- Perma-Peddle
        1700,
    },
    { -- Be Mine!
        1701,
    },
    { -- Sweet Tooth
        1702,
    },
    { -- "My Love is Like a Red, Red Rose"
        1703,
    },
    { -- I Pitied The Fool
        1704,
    },
    { -- Clockwork Rocket Bot
        1705,
    },
    { -- Crashin' Thrashin' Racer
        1706,
    },
    { -- Fool For Love
        1707,
        faction.Alliance,
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
    { -- Archavon the Stone Watcher (25 player)
        1721,
    },
    { -- Archavon the Stone Watcher (10 player)
        1722,
    },
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
        nil,
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
    },
    { -- The Dapper Sapper
        1761,
        {
            IsPvP = true,
        },
    },
    { -- Not Even a Scratch
        1762,
        faction.Alliance,
        2192,
        true,
    },
    { -- Artillery Veteran
        1763,
        {
            IsPvP = true,
        },
    },
    { -- Drop It!
        1764,
        {
            IsPvP = true,
        },
    },
    { -- Steady Hands
        1765,
        {
            IsPvP = true,
        },
    },
    { -- Ancient Protector
        1766,
        {
            IsPvP = true,
        },
    },
    { -- The Northrend Gourmet
        1777,
    },
    { -- The Northrend Gourmet
        1778,
    },
    { -- The Northrend Gourmet
        1779,
    },
    { -- Second That Emotion
        1780,
    },
    { -- Critter Gitter
        1781,
    },
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
    { -- Dinner Impossible
        1785,
    },
    { -- School of Hard Knocks
        1786,
    },
    { -- Bad Example
        1788,
    },
    { -- Daily Chores
        1789,
    },
    { -- "Hail To The King, Baby"
        1790,
    },
    { -- Home Alone
        1791,
    },
    { -- "Aw, Isn't It Cute?"
        1792,
    },
    { -- For the Children
        1793,
    },
    { -- Lunch Lady
        1795,
    },
    { -- Short Order Cook
        1796,
    },
    { -- Chef de Partie
        1797,
    },
    { -- Sous Chef
        1798,
    },
    { -- Chef de Cuisine
        1799,
    },
    { -- The Outland Gourmet
        1800,
    },
    { -- Captain Rumsey's Lager
        1801,
    },
    { -- Defenseless
        1816,
    },
    { -- The Culling of Time
        1817,
    },
    { -- Tastes Like Chicken
        1832,
    },
    { -- It's Happy Hour Somewhere
        1833,
    },
    { -- Lightning Struck
        1834,
    },
    { -- Old Crafty
        1836,
    },
    { -- Old Ironjaw
        1837,
    },
    { -- Make Quick Werk of Him (10 player)
        1856,
    },
    { -- Make Quick Werk of Him (25 player)
        1857,
    },
    { -- Arachnophobia (10 player)
        1858,
    },
    { -- Arachnophobia (25 player)
        1859,
    },
    { -- Gotta Go!
        1860,
    },
    { -- Volazj's Quick Demise
        1862,
    },
    { -- What the Eck?
        1864,
    },
    { -- Lockdown!
        1865,
    },
    { -- Good Grief
        1866,
    },
    { -- Timely Death
        1867,
    },
    { -- Make It Count
        1868,
    },
    { -- A Poke in the Eye (10 player)
        1869,
    },
    { -- A Poke in the Eye (25 player)
        1870,
    },
    { -- Experienced Drake Rider
        1871,
    },
    { -- Zombiefest!
        1872,
    },
    { -- Lodi Dodi We Loves the Skadi
        1873,
    },
    { -- You Don't Have an Eternity (10 player)
        1874,
    },
    { -- You Don't Have an Eternity (25 player)
        1875,
    },
    { -- Besting the Black Dragonflight (10 player)
        1876,
    },
    { -- Less Is More (25 player)
        1877,
    },
    { -- On The Rocks
        1919,
    },
    { -- Does Your Wolpertinger Linger?
        1936,
    },
    { -- Higher Learning
        1956,
    },
    { -- There's Gold In That There Fountain
        1957,
    },
    { -- I Smell A Giant Rat
        1958,
    },
    { -- The Safety Dance (10 player)
        1996,
    },
    { -- Momma Said Knock You Out (10 player)
        1997,
    },
    { -- Cooking Award
        1998,
    },
    { -- 10 Cooking Awards
        1999,
    },
    { -- 25 Cooking Awards
        2000,
    },
    { -- 50 Cooking Awards
        2001,
    },
    { -- 100 Cooking Awards
        2002,
    },
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
    },
    { -- Proof of Demise
        2019,
    },
    { -- Intense Cold
        2036,
    },
    { -- Chaos Theory
        2037,
    },
    { -- Respect Your Elders
        2038,
    },
    { -- Better Off Dred
        2039,
    },
    { -- Less-rabi
        2040,
    },
    { -- Dehydration
        2041,
    },
    { -- Shatter Resistant
        2042,
    },
    { -- The Incredible Hulk
        2043,
    },
    { -- Ruby Void
        2044,
    },
    { -- Emerald Void
        2045,
    },
    { -- Amber Void
        2046,
    },
    { -- Gonna Go When the Volcano Blows (10 player)
        2047,
    },
    { -- Gonna Go When the Volcano Blows (25 player)
        2048,
    },
    { -- Twilight Assist (10 player)
        2049,
    },
    { -- Twilight Duo (10 player)
        2050,
    },
    { -- The Twilight Zone (10 player)
        2051,
    },
    { -- Twilight Assist (25 player)
        2052,
    },
    { -- Twilight Duo (25 player)
        2053,
    },
    { -- The Twilight Zone (25 player)
        2054,
    },
    { -- Volunteer Work
        2056,
    },
    { -- Oh Novos!
        2057,
    },
    { -- Snakes. Why'd It Have To Be Snakes?
        2058,
    },
    { -- Armored Brown Bear
        2076,
    },
    { -- Wooly Mammoth
        2077,
    },
    { -- Traveler's Tundra Mammoth
        2078,
    },
    { -- Tabard of the Protector
        2079,
    },
    { -- Black War Mammoth
        2080,
        {
            IsPvP = true,
        },
    },
    { -- Grand Black War Mammoth
        2081,
    },
    { -- Ice Mammoth
        2082,
    },
    { -- Grand Ice Mammoth
        2083,
    },
    { -- Ring of the Kirin Tor
        2084,
    },
    { -- 50 Stone Keeper's Shards
        2085,
        {
            IsPvP = true,
        },
    },
    { -- 100 Stone Keeper's Shards
        2086,
        {
            IsPvP = true,
        },
    },
    { -- 250 Stone Keeper's Shards
        2087,
        {
            IsPvP = true,
        },
    },
    { -- 500 Stone Keeper's Shards
        2088,
        {
            IsPvP = true,
        },
    },
    { -- 1000 Stone Keeper's Shards
        2089,
        {
            IsPvP = true,
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
    { -- A Penny For Your Thoughts
        2094,
    },
    { -- Silver in the City
        2095,
    },
    { -- The Coin Master
        2096,
    },
    { -- Get to the Choppa!
        2097,
    },
    { -- Tabard of the Argent Dawn
        2116,
    },
    { -- Glory of the Hero
        2136,
    },
    { -- Glory of the Raider (10 player)
        2137,
    },
    { -- Glory of the Raider (25 player)
        2138,
    },
    { -- The Safety Dance (25 player)
        2139,
    },
    { -- Momma Said Knock You Out (25 player)
        2140,
    },
    { -- Stable Keeper
        2141,
    },
    { -- Filling Up The Barn
        2142,
    },
    { -- Leading the Cavalry
        2143,
    },
    { -- "What a Long, Strange Trip It's Been"
        2144,
        faction.Alliance,
    },
    { -- "What A Long, Strange Trip It's Been"
        2145,
        faction.Horde,
    },
    { -- The Hundred Club (10 player)
        2146,
    },
    { -- The Hundred Club (25 player)
        2147,
    },
    { -- Denyin' the Scion (10 player)
        2148,
    },
    { -- Denyin' the Scion (25 player)
        2149,
    },
    { -- Split Personality
        2150,
    },
    { -- Consumption Junction
        2151,
    },
    { -- Share The Love
        2152,
    },
    { -- A Void Dance
        2153,
    },
    { -- Brann Spankin' New
        2154,
    },
    { -- Abuse the Ooze
        2155,
    },
    { -- My Girl Loves to Skadi All the Time
        2156,
    },
    { -- King's Bane
        2157,
    },
    { -- And They Would All Go Down Together (10 player)
        2176,
    },
    { -- And They Would All Go Down Together (25 player)
        2177,
    },
    { -- Shocking! (10 player)
        2178,
    },
    { -- Shocking! (25 player)
        2179,
    },
    { -- Subtraction (10 player)
        2180,
    },
    { -- Subtraction (25 player)
        2181,
    },
    { -- Spore Loser (10 player)
        2182,
    },
    { -- Spore Loser (25 player)
        2183,
    },
    { -- Just Can't Get Enough (10 player)
        2184,
    },
    { -- Just Can't Get Enough (25 player)
        2185,
    },
    { -- The Immortal
        2186,
    },
    { -- The Undying
        2187,
    },
    { -- Leeeeeeeeeeeeeroy!
        2188,
    },
    { -- Artillery Expert
        2189,
        {
            IsPvP = true,
        },
    },
    { -- Drop It Now!
        2190,
        {
            IsPvP = true,
        },
    },
    { -- Ancient Courtyard Protector
        2191,
        {
            IsPvP = true,
        },
    },
    { -- Not Even a Scratch
        2192,
        faction.Horde,
        1762,
        true,
    },
    { -- Explosives Expert
        2193,
        {
            IsPvP = true,
        },
    },
    { -- Master of Strand of the Ancients
        2194,
        faction.Alliance,
        nil,
        true,
    },
    { -- Master of Strand of the Ancients
        2195,
        faction.Horde,
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
    },
    { -- Northern Exposure
        2256,
    },
    { -- Frostbitten
        2257,
    },
    { -- Brutal Nether Drake
        2316,
        {
            IsPvP = true,
        },
    },
    { -- Insane in the Membrane
        2336,
    },
    { -- Dreadsteed of Xoroth
        2357,
    },
    { -- Charger
        2358,
    },
    { -- Swift Flight Form
        2359,
    },
    { -- WoW's 4th Anniversary
        2398,
    },
    { -- Vampire Hunter
        2456,
    },
    { -- Destruction Derby
        2476,
        faction.Horde,
        1737,
        true,
    },
    { -- The Fifth Element
        2496,
    },
    { -- Spring Fling
        2497,
        faction.Horde,
        2419,
    },
    { -- Lil' Game Hunter
        2516,
    },
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
    { -- Pest Control
        2556,
    },
    { -- To All The Squirrels Who Shared My Life
        2557,
    },
    { -- Dual Talent Specialization
        2716,
    },
    { -- Master of Wintergrasp
        2776,
        faction.Horde,
    },
    { -- Brew of the Month
        2796,
    },
    { -- A Brew-FAST Mount
        3496,
    },
    {KrowiAF.SetAchievementPatch, 3, 0, 2}, -- Rework loading so this can go to the top, future me problem
};