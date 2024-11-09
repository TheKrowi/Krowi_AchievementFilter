local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_00_02"] = {
    {6}, -- Level 10
    {7}, -- Level 20
    {8}, -- Level 30
    {9}, -- Level 40
    {10}, -- Level 50
    {11}, -- Level 60
    {12}, -- Level 70
    {13}, -- Level 80
    {15}, -- Plenty of Pets
    {16}, -- Did Somebody Order a Knuckle Sandwich?
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
    },
    {42}, -- Explore Eastern Kingdoms
    {43}, -- Explore Kalimdor
    {44}, -- Explore Outland
    {45}, -- Explore Northrend
    {46}, -- World Explorer
    { -- Disgracin' The Basin
        73,
        nil,
        nil,
        true,
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
    {131}, -- Journeyman in First Aid
    {132}, -- Expert in First Aid
    {133}, -- Artisan in First Aid
    {134}, -- Master in First Aid
    {135}, -- Grand Master in First Aid
    {137}, -- Stocking Up
    {141}, -- Ultimate Triage
    {144}, -- The Lurker Above
    {150}, -- The Fishing Diplomat
    {153}, -- The Old Gnome and the Sea
    { -- Arathi Basin Victory
        154,
        nil,
        nil,
        true,
    },
    { -- Arathi Basin Veteran
        155,
        nil,
        nil,
        true,
    },
    { -- Territorial Dominance
        156,
        nil,
        nil,
        true,
    },
    { -- To The Rescue!
        157,
        nil,
        nil,
        true,
    },
    { -- Me and the Cappin' Makin' it Happen
        158,
        nil,
        nil,
        true,
    },
    { -- Let's Get This Done
        159,
        nil,
        nil,
        true,
    },
    { -- Resilient Victory
        161,
        nil,
        nil,
        true,
    },
    { -- We Had It All Along *cough*
        162,
        nil,
        nil,
        true,
    },
    { -- Arathi Basin Perfection
        165,
        nil,
        nil,
        true,
    },
    { -- Warsong Gulch Victory
        166,
        nil,
        nil,
        true,
    },
    { -- Warsong Gulch Veteran
        167,
        nil,
        nil,
        true,
    },
    { -- Warsong Gulch Perfection
        168,
        nil,
        nil,
        true,
    },
    { -- Capture the Flag
        199,
        nil,
        nil,
        true,
    },
    { -- Persistent Defender
        200,
        nil,
        nil,
        true,
    },
    { -- Warsong Expedience
        201,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- Supreme Defender
        206,
        faction.Alliance,
        1252,
        true,
    },
    { -- Save The Day
        207,
        nil,
        nil,
        true,
    },
    { -- Eye of the Storm Victory
        208,
        nil,
        nil,
        true,
    },
    { -- Eye of the Storm Veteran
        209,
        nil,
        nil,
        true,
    },
    { -- Storm Glory
        211,
        nil,
        nil,
        true,
    },
    { -- Storm Capper
        212,
        nil,
        nil,
        true,
    },
    { -- Stormtrooper
        213,
        nil,
        nil,
        true,
    },
    { -- Flurry
        214,
        nil,
        nil,
        true,
    },
    { -- Bound for Glory
        216,
        nil,
        nil,
        true,
    },
    { -- Alterac Valley Victory
        218,
        nil,
        nil,
        true,
    },
    { -- Alterac Valley Veteran
        219,
        nil,
        nil,
        true,
    },
    { -- Stormpike Perfection
        220,
        faction.Alliance,
        873,
        true,
    },
    { -- Alterac Grave Robber
        221,
        nil,
        nil,
        true,
    },
    { -- Tower Defense
        222,
        nil,
        nil,
        true,
    },
    { -- The Sickly Gazelle
        223,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- Damage Control
        227,
        nil,
        nil,
        true,
    },
    { -- The Grim Reaper
        229,
        nil,
        nil,
        true,
    },
    { -- Battlemaster
        230,
        faction.Alliance,
        1175,
        true,
    },
    { -- Wrecking Ball
        231,
        nil,
        nil,
        true,
    },
    { -- Bloodthirsty Berserker
        233,
        nil,
        nil,
        true,
    },
    { -- An Honorable Kill
        238,
        nil,
        nil,
        true,
    },
    { -- 25000 Honorable Kills
        239,
        nil,
        nil,
        true,
    },
    { -- That Takes Class
        245,
        nil,
        nil,
        true,
    },
    { -- Know Thy Enemy
        246,
        faction.Alliance,
        1005,
        true,
    },
    { -- "Make Love, Not Warcraft"
        247,
        nil,
        nil,
        true,
    },
    {248}, -- Sunday's Finest
    {249}, -- Dressed for the Occasion
    { -- With a Little Helper from My Friends
        252,
        nil,
        nil,
        true,
    },
    {255}, -- Bring Me The Head of... Oh Wait
    { -- Scrooge
        259,
        faction.Horde,
        1255,
    },
    {260}, -- Charming
    {263}, -- Ice the Frost Lord
    {271}, -- Burning Hot Pole Dance
    {272}, -- Torch Juggler
    {273}, -- On Metzen!
    {275}, -- Veteran Nanny
    {277}, -- 'Tis the Season
    {279}, -- Simply Abominable
    {283}, -- The Masquerade
    {284}, -- A Mask for All Occasions
    {288}, -- Out With It
    {289}, -- The Savior of Hallow's End
    {291}, -- Check Your Head
    {292}, -- Sinister Calling
    {293}, -- Disturbing the Peace
    {295}, -- Direbrewfest
    {303}, -- "Have Keg, Will Travel"
    {306}, -- Master Angler of Azeroth
    { -- City Defender
        388,
        faction.Alliance,
        1006,
        true,
    },
    { -- Gurubashi Arena Master
        389,
        nil,
        nil,
        true,
    },
    { -- Gurubashi Arena Grand Master
        396,
        nil,
        nil,
        true,
    },
    { -- Step Into The Arena
        397,
        nil,
        nil,
        true,
    },
    { -- Mercilessly Dedicated
        398,
        nil,
        nil,
        true,
    },
    { -- Just the Two of Us: 1550
        399,
        nil,
        nil,
        true,
    },
    { -- Just the Two of Us: 1750
        400,
        nil,
        nil,
        true,
    },
    { -- Just the Two of Us: 2000
        401,
        nil,
        nil,
        true,
    },
    { -- Three's Company: 1550
        402,
        nil,
        nil,
        true,
    },
    { -- Three's Company: 1750
        403,
        nil,
        nil,
        true,
    },
    { -- High Five: 2000
        404,
        nil,
        nil,
        true,
    },
    { -- Three's Company: 2000
        405,
        nil,
        nil,
        true,
    },
    { -- High Five: 1550
        406,
        nil,
        nil,
        true,
    },
    { -- High Five: 1750
        407,
        nil,
        nil,
        true,
    },
    { -- Hot Streak
        408,
        nil,
        nil,
        true,
    },
    { -- Last Man Standing
        409,
        nil,
        nil,
        true,
    },
    {411}, -- Murky
    {412}, -- Murloc Costume
    {414}, -- Tyrael's Hilt
    {415}, -- Big Blizzard Bear
    {416}, -- Scarab Lord
    { -- Merciless Gladiator
        418,
        nil,
        nil,
        true,
    },
    { -- Vengeful Gladiator
        419,
        nil,
        nil,
        true,
    },
    { -- Brutal Gladiator
        420,
        nil,
        nil,
        true,
    },
    {424}, -- Why? Because It's Red
    {425}, -- "Atiesh, Greatstaff of the Guardian"
    {426}, -- Warglaives of Azzinoth
    {428}, -- "Thunderfury, Blessed Blade of the Windseeker"
    {429}, -- "Sulfuras, Hand of Ragnaros"
    {430}, -- Amani War Bear
    {431}, -- Hand of A'dal
    {432}, -- Champion of the Naaru
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
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80
        457,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Rogue
        458,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Warrior
        459,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Mage
        460,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Death Knight
        461,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Hunter
        462,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Warlock
        463,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Priest
        464,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Paladin
        465,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Druid
        466,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Shaman
        467,
        nil,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- 5000 Honorable Kills
        512,
        nil,
        nil,
        true,
    },
    { -- 100 Honorable Kills
        513,
        nil,
        nil,
        true,
    },
    { -- 500 Honorable Kills
        515,
        nil,
        nil,
        true,
    },
    { -- 1000 Honorable Kills
        516,
        nil,
        nil,
        true,
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
    {556}, -- Epic
    {557}, -- Superior
    {558}, -- Greedy
    {559}, -- Needy
    {560}, -- Deadliest Catch
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
        nil,
        nil,
        true,
    },
    { -- Arathi Basin All-Star
        583,
        nil,
        nil,
        true,
    },
    { -- Arathi Basin Assassin
        584,
        nil,
        nil,
        true,
    },
    { -- Stormy Assassin
        587,
        nil,
        nil,
        true,
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
    {605}, -- A Coin of Ancestry
    {606}, -- 5 Coins of Ancestry
    {607}, -- 10 Coins of Ancestry
    {608}, -- 25 Coins of Ancestry
    {609}, -- 50 Coins of Ancestry
    { -- Death to the Warchief!
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
    {626}, -- Lunar Festival Finery
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
    {684}, -- Onyxia's Lair (Level 60)
    {685}, -- Blackwing Lair
    {686}, -- Molten Core
    {687}, -- Temple of Ahn'Qiraj
    {688}, -- Zul'Gurub
    {689}, -- Ruins of Ahn'Qiraj
    {690}, -- Karazhan
    {691}, -- Zul'Aman
    {692}, -- Gruul's Lair
    {693}, -- Magtheridon's Lair
    {694}, -- Serpentshrine Cavern
    {695}, -- The Battle for Mount Hyjal
    {696}, -- Tempest Keep
    {697}, -- The Black Temple
    {698}, -- Sunwell Plateau
    { -- World Wide Winner
        699,
        nil,
        nil,
        true,
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
    {705}, -- Master of Arms
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
        nil,
        nil,
        true,
    },
    {728}, -- Explore Durotar
    {729}, -- Deathcharger's Reins
    {730}, -- Skills to Pay the Bills
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
        nil,
        nil,
        true,
    },
    { -- Eye of the Storm Domination
        784,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- 100000 Honorable Kills
        870,
        nil,
        nil,
        true,
    },
    {871}, -- "Avast Ye, Admiral!"
    { -- Frenzied Defender
        872,
        nil,
        nil,
        true,
    },
    { -- Frostwolf Perfection
        873,
        faction.Horde,
        220,
        true,
    },
    { -- Vengefully Dedicated
        875,
        nil,
        nil,
        true,
    },
    { -- Brutally Dedicated
        876,
        nil,
        nil,
        true,
    },
    {877}, -- The Cake Is Not A Lie
    {878}, -- One That Didn't Get Away
    {879}, -- Old School Ride
    {880}, -- Swift Zulian Tiger
    {881}, -- Swift Razzashi Raptor
    {882}, -- Fiery Warhorse's Reins
    {883}, -- Reins of the Raven Lord
    {884}, -- Swift White Hawkstrider
    {885}, -- Ashes of Al'ar
    { -- Swift Nether Drake
        886,
        nil,
        nil,
        true,
    },
    { -- Merciless Nether Drake
        887,
        nil,
        nil,
        true,
    },
    { -- Vengeful Nether Drake
        888,
        nil,
        nil,
        true,
    },
    {889}, -- Fast and Furious
    {890}, -- Into The Wild Blue Yonder
    {891}, -- Giddy Up!
    {892}, -- The Right Stuff
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
    {910}, -- Elders of the Dungeons
    {911}, -- Elders of Kalimdor
    {912}, -- Elders of Eastern Kingdoms
    {913}, -- To Honor One's Elders
    {914}, -- Elders of the Horde
    {915}, -- Elders of the Alliance
    {937}, -- Elune's Blessing
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
    {957}, -- Hero of the Zandalar Tribe
    {958}, -- Sworn to the Deathsworn
    {959}, -- The Scale of the Sands
    {960}, -- The Violet Eye
    {961}, -- Honorary Frenzyheart
    {962}, -- Savior of the Oracles
    { -- Tricks and Treats of Kalimdor
        963,
        faction.Alliance,
        965,
    },
    {964}, -- Going Down?
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
    {972}, -- Trick or Treat!
    {973}, -- 5 Daily Quests Complete
    {974}, -- 50 Daily Quests Complete
    {975}, -- 200 Daily Quests Complete
    {976}, -- 500 Daily Quests Complete
    {977}, -- 1000 Daily Quests Complete
    {978}, -- 3000 Quests Completed
    {979}, -- The Mask Task
    {980}, -- The Horseman's Reins
    {981}, -- That Sparkling Smile
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
    {1145}, -- King of the Fire Festival
    { -- Loyal Defender
        1151,
        faction.Alliance,
        224,
        true,
    },
    { -- Overly Defensive
        1153,
        nil,
        nil,
        true,
    },
    { -- Duel-icious
        1157,
        nil,
        nil,
        true,
    },
    { -- Just the Two of Us: 2200
        1159,
        nil,
        nil,
        true,
    },
    { -- Three's Company: 2200
        1160,
        nil,
        nil,
        true,
    },
    { -- High Five: 2200
        1161,
        nil,
        nil,
        true,
    },
    { -- Hotter Streak
        1162,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
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
    {1183}, -- Brew of the Year
    { -- Strange Brew
        1184,
        faction.Alliance,
        1203,
    },
    {1185}, -- The Brewfest Diet
    {1186}, -- Down With The Dark Iron
    {1188}, -- Shafted!
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
    },
    {1257}, -- The Scavenger
    { -- Take a Chill Pill
        1258,
        nil,
        nil,
        true,
    },
    { -- Not So Fast
        1259,
        nil,
        nil,
        true,
    },
    {1260}, -- Drunken Stupor
    {1261}, -- G.N.E.R.D. Rage
    { -- Loremaster of Outland
        1262,
        faction.Alliance,
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
    },
    {1275}, -- Bombs Away
    {1276}, -- Blade's Edge Bomberman
    {1277}, -- Rapid Defense
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
    {1281}, -- The Rocket's Red Glare
    {1282}, -- Fa-la-la-la-Ogri'la
    {1283}, -- Classic Dungeonmaster
    {1284}, -- Outland Dungeonmaster
    {1285}, -- Classic Raider
    {1286}, -- Outland Raider
    {1287}, -- Outland Dungeon Hero
    {1288}, -- Northrend Dungeonmaster
    {1289}, -- Northrend Dungeon Hero
    {1291}, -- Lonely?
    {1292}, -- Yellow Brewfest Stein
    {1293}, -- Blue Brewfest Stein
    {1295}, -- Crashin' & Thrashin'
    {1296}, -- Watch Him Die
    {1297}, -- Hadronox Denied
    {1307}, -- Upper Blackrock Spire
    { -- Strand of the Ancients Victory
        1308,
        nil,
        nil,
        true,
    },
    { -- Strand of the Ancients Veteran
        1309,
        nil,
        nil,
        true,
    },
    { -- Storm the Beach
        1310,
        nil,
        nil,
        true,
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
    },
    {1396}, -- Elders of Northrend
    { -- Realm First! Magic Seeker
        1400,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Conqueror of Naxxramas
        1402,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Gnome
        1404,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Blood Elf
        1405,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Draenei
        1406,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Dwarf
        1407,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Human
        1408,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Night Elf
        1409,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Orc
        1410,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Tauren
        1411,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Troll
        1412,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Level 80 Forsaken
        1413,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Blacksmith
        1414,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Alchemist
        1415,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Cooking Grand Master
        1416,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Enchanter
        1417,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Engineer
        1418,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! First Aid Grand Master
        1419,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Angler
        1420,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Herbalist
        1421,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Scribe
        1422,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Jewelcrafter
        1423,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Leatherworker
        1424,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Miner
        1425,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Skinner
        1426,
        nil,
        nil,
        nil,
        true,
    },
    { -- Realm First! Grand Master Tailor
        1427,
        nil,
        nil,
        nil,
        true,
    },
    {1428}, -- Mine Sweeper
    {1436}, -- Friends In High Places
    {1457}, -- Explore Crystalsong Forest
    { -- Realm First! Northrend Vanguard
        1463,
        nil,
        nil,
        nil,
        true,
    },
    { -- Quick Cap
        1502,
        faction.Horde,
        202,
        true,
    },
    {1516}, -- Accomplished Angler
    {1517}, -- Northrend Angler
    {1552}, -- Frenzied Firecracker
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
    {1636}, -- Competitor's Tabard
    {1637}, -- Spirit of Competition
    {1638}, -- Skyshattered
    { -- Hallowed Be Thy Name
        1656,
        faction.Alliance,
    },
    { -- Hallowed Be Thy Name
        1657,
        faction.Horde,
    },
    {1658}, -- Champion of the Frozen Wastes
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
    {1687}, -- Let It Snow
    {1688}, -- The Winter Veil Gourmet
    {1689}, -- He Knows If You've Been Naughty
    {1690}, -- A Frosty Shake
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
    {1694}, -- Lovely Luck Is On Your Side
    {1695}, -- Dangerous Love
    {1696}, -- The Rocket's Pink Glare
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
    {1699}, -- Fistful of Love
    {1700}, -- Perma-Peddle
    {1701}, -- Be Mine!
    {1702}, -- Sweet Tooth
    {1703}, -- "My Love is Like a Red, Red Rose"
    {1704}, -- I Pitied The Fool
    {1705}, -- Clockwork Rocket Bot
    {1706}, -- Crashin' Thrashin' Racer
    { -- Fool For Love
        1707,
        faction.Alliance,
    },
    { -- Wintergrasp Victory
        1717,
        nil,
        nil,
        true,
    },
    { -- Wintergrasp Veteran
        1718,
        nil,
        nil,
        true,
    },
    {1721}, -- Archavon the Stone Watcher (25 player)
    {1722}, -- Archavon the Stone Watcher (10 player)
    { -- Vehicular Gnomeslaughter
        1723,
        nil,
        nil,
        true,
    },
    { -- Leaning Tower
        1727,
        nil,
        nil,
        true,
    },
    { -- Destruction Derby
        1737,
        faction.Alliance,
        2476,
        true,
    },
    { -- Didn't Stand a Chance
        1751,
        nil,
        nil,
        true,
    },
    { -- Master of Wintergrasp
        1752,
        faction.Alliance,
        nil,
        true,
    },
    { -- Within Our Grasp
        1755,
        nil,
        nil,
        true,
    },
    { -- Defense of the Ancients
        1757,
        faction.Alliance,
        2200,
        true,
    },
    { -- The Dapper Sapper
        1761,
        nil,
        nil,
        true,
    },
    { -- Not Even a Scratch
        1762,
        faction.Alliance,
        2192,
        true,
    },
    { -- Artillery Veteran
        1763,
        nil,
        nil,
        true,
    },
    { -- Drop It!
        1764,
        nil,
        nil,
        true,
    },
    { -- Steady Hands
        1765,
        nil,
        nil,
        true,
    },
    { -- Ancient Protector
        1766,
        nil,
        nil,
        true,
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
    {1786}, -- School of Hard Knocks
    {1788}, -- Bad Example
    {1789}, -- Daily Chores
    {1790}, -- "Hail To The King, Baby"
    {1791}, -- Home Alone
    {1792}, -- "Aw, Isn't It Cute?"
    {1793}, -- For The Children
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
    {1936}, -- Does Your Wolpertinger Linger?
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
    {2018}, -- Timear Foresees
    {2019}, -- Proof of Demise
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
    {2079}, -- Tabard of the Protector
    { -- Black War Mammoth
        2080,
        nil,
        nil,
        true,
    },
    {2081}, -- Grand Black War Mammoth
    {2082}, -- Ice Mammoth
    {2083}, -- Grand Ice Mammoth
    {2084}, -- Ring of the Kirin Tor
    { -- 50 Stone Keeper's Shards
        2085,
        nil,
        nil,
        true,
    },
    { -- 100 Stone Keeper's Shards
        2086,
        nil,
        nil,
        true,
    },
    { -- 250 Stone Keeper's Shards
        2087,
        nil,
        nil,
        true,
    },
    { -- 500 Stone Keeper's Shards
        2088,
        nil,
        nil,
        true,
    },
    { -- 1000 Stone Keeper's Shards
        2089,
        nil,
        nil,
        true,
    },
    { -- Challenger
        2090,
        nil,
        nil,
        true,
    },
    { -- Gladiator
        2091,
        nil,
        nil,
        true,
    },
    { -- Duelist
        2092,
        nil,
        nil,
        true,
    },
    { -- Rival
        2093,
        nil,
        nil,
        true,
    },
    {2094}, -- A Penny For Your Thoughts
    {2095}, -- Silver in the City
    {2096}, -- The Coin Master
    {2097}, -- Get to the Choppa!
    {2116}, -- Tabard of the Argent Dawn
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
    },
    { -- "What A Long, Strange Trip It's Been"
        2145,
        faction.Horde,
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
    {2186}, -- The Immortal
    {2187}, -- The Undying
    {2188}, -- Leeeeeeeeeeeeeroy!
    { -- Artillery Expert
        2189,
        nil,
        nil,
        true,
    },
    { -- Drop It Now!
        2190,
        nil,
        nil,
        true,
    },
    { -- Ancient Courtyard Protector
        2191,
        nil,
        nil,
        true,
    },
    { -- Not Even a Scratch
        2192,
        faction.Horde,
        1762,
        true,
    },
    { -- Explosives Expert
        2193,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- Defense of the Ancients
        2200,
        faction.Horde,
        1757,
        true,
    },
    {2256}, -- Northern Exposure
    {2257}, -- Frostbitten
    { -- Brutal Nether Drake
        2316,
        nil,
        nil,
        true,
    },
    {2336}, -- Insane in the Membrane
    {2357}, -- Dreadsteed of Xoroth
    {2358}, -- Charger
    {2359}, -- Swift Flight Form
    {2398}, -- WoW's 4th Anniversary
    {2456}, -- Vampire Hunter
    { -- Destruction Derby
        2476,
        faction.Horde,
        1737,
        true,
    },
    {2496}, -- The Fifth Element
    { -- Spring Fling
        2497,
        faction.Horde,
        2419,
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
    {2716}, -- Dual Talent Specialization
    { -- Master of Wintergrasp
        2776,
        faction.Horde,
    },
    {2796}, -- Brew of the Month
    {3496}, -- A Brew-FAST Mount
    {KrowiAF.SetAchievementPatch, 3, 0, 2}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_01_00"] = {
    {2416}, -- Hard Boiled
    {2417}, -- Chocolate Lover
    {2418}, -- Chocoholic
    { -- Spring Fling
        2419,
        faction.Alliance,
        2497,
    },
    { -- Noble Garden
        2420,
        faction.Horde,
        2421,
    },
    { -- Noble Garden
        2421,
        faction.Alliance,
        2420,
    },
    {2422}, -- Shake Your Bunny-Maker
    {2436}, -- Desert Rose
    {2576}, -- Blushing Bride
    {2676}, -- I Found One!
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
    },
    { -- Noble Gardener
        2798,
        faction.Horde,
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
    {2886}, -- The Siege of Ulduar (10 player)
    {2887}, -- The Siege of Ulduar (25 player)
    {2888}, -- The Antechamber of Ulduar (10 player)
    {2889}, -- The Antechamber of Ulduar (25 player)
    {2890}, -- The Keepers of Ulduar (10 player)
    {2891}, -- The Keepers of Ulduar (25 player)
    {2892}, -- The Descent into Madness (10 player)
    {2893}, -- The Descent into Madness (25 player)
    {2894}, -- The Secrets of Ulduar (10 player)
    {2895}, -- The Secrets of Ulduar (25 player)
    {2903}, -- Champion of Ulduar
    {2904}, -- Conqueror of Ulduar
    {2905}, -- Unbroken (10 player)
    {2906}, -- Unbroken (25 player)
    {2907}, -- Three Car Garage (10 player)
    {2908}, -- Three Car Garage (25 player)
    {2909}, -- Take Out Those Turrets (10 player)
    {2910}, -- Take Out Those Turrets (25 player)
    {2911}, -- Shutout (10 player)
    {2912}, -- Shutout (25 player)
    {2913}, -- Orbital Bombardment (10 player)
    {2914}, -- Orbital Devastation (10 player)
    {2915}, -- Nuked from Orbit (10 player)
    {2916}, -- Orbital Devastation (25 player)
    {2917}, -- Nuked from Orbit (25 player)
    {2918}, -- Orbital Bombardment (25 player)
    {2919}, -- A Quick Shave (10 player)
    {2921}, -- A Quick Shave (25 player)
    {2923}, -- "Iron Dwarf, Medium Rare (10 player)"
    {2924}, -- "Iron Dwarf, Medium Rare (25 player)"
    {2925}, -- Shattered (10 player)
    {2926}, -- Shattered (25 player)
    {2927}, -- Hot Pocket (10 player)
    {2928}, -- Hot Pocket (25 player)
    {2929}, -- Stokin' the Furnace (25 player)
    {2930}, -- Stokin' the Furnace (10 player)
    {2931}, -- Nerf Engineering (10 player)
    {2932}, -- Nerf Engineering (25 player)
    {2933}, -- Nerf Scrapbots (10 player)
    {2934}, -- Nerf Gravity Bombs (10 player)
    {2935}, -- Nerf Scrapbots (25 player)
    {2936}, -- Nerf Gravity Bombs (25 player)
    {2937}, -- Must Deconstruct Faster (10 player)
    {2938}, -- Must Deconstruct Faster (25 player)
    {2939}, -- "I Choose You, Runemaster Molgeim (10 player)"
    {2940}, -- "I Choose You, Stormcaller Brundir (10 player)"
    {2941}, -- "I Choose You, Steelbreaker (10 player)"
    {2942}, -- "I Choose You, Runemaster Molgeim (25 player)"
    {2943}, -- "I Choose You, Stormcaller Brundir (25 player)"
    {2944}, -- "I Choose You, Steelbreaker (25 player)"
    {2945}, -- But I'm On Your Side (10 player)
    {2946}, -- But I'm On Your Side (25 player)
    {2947}, -- Can't Do That While Stunned (10 player)
    {2948}, -- Can't Do That While Stunned (25 player)
    {2951}, -- With Open Arms (10 player)
    {2952}, -- With Open Arms (25 player)
    {2953}, -- Disarmed (10 player)
    {2954}, -- Disarmed (25 player)
    {2955}, -- If Looks Could Kill (10 player)
    {2956}, -- If Looks Could Kill (25 player)
    {2957}, -- Glory of the Ulduar Raider (10 player)
    {2958}, -- Glory of the Ulduar Raider (25 player)
    {2959}, -- Rubble and Roll (10 player)
    {2960}, -- Rubble and Roll (25 player)
    {2961}, -- Cheese the Freeze (10 player)
    {2962}, -- Cheese the Freeze (25 player)
    {2963}, -- I Have the Coolest Friends (10 player)
    {2965}, -- I Have the Coolest Friends (25 player)
    {2967}, -- Getting Cold in Here (10 player)
    {2968}, -- Getting Cold in Here (25 player)
    {2969}, -- Staying Buffed All Winter (10 player)
    {2970}, -- Staying Buffed All Winter (25 player)
    {2971}, -- Don't Stand in the Lightning (10 player)
    {2972}, -- Don't Stand in the Lightning (25 player)
    {2973}, -- I'll Take You All On (10 player)
    {2974}, -- I'll Take You All On (25 player)
    {2975}, -- Who Needs Bloodlust? (10 player)
    {2976}, -- Who Needs Bloodlust? (25 player)
    {2977}, -- Siffed (10 player)
    {2978}, -- Siffed (25 player)
    {2979}, -- Lumberjacked (10 player)
    {2980}, -- Con-speed-atory (10 player)
    {2981}, -- Con-speed-atory (25 player)
    {2982}, -- Getting Back to Nature (10 player)
    {2983}, -- Getting Back to Nature (25 player)
    {2984}, -- Deforestation (25 player)
    {2985}, -- Deforestation (10 player)
    {2989}, -- Set Up Us the Bomb (10 player)
    {2995}, -- Not-So-Friendly Fire (25 player)
    {2996}, -- Shadowdodger (10 player)
    {2997}, -- Shadowdodger (25 player)
    {3002}, -- Supermassive (25 player)
    {3003}, -- Supermassive (10 player)
    {3004}, -- He Feeds On Your Tears (10 player)
    {3005}, -- He Feeds On Your Tears (25 player)
    {3006}, -- Crazy Cat Lady (10 player)
    {3007}, -- Crazy Cat Lady (25 player)
    {3008}, -- Drive Me Crazy (10 player)
    {3009}, -- Kiss and Make Up (10 player)
    {3010}, -- Drive Me Crazy (25 player)
    {3011}, -- Kiss and Make Up (25 player)
    {3012}, -- He's Not Getting Any Older (10 player)
    {3013}, -- He's Not Getting Any Older (25 player)
    {3014}, -- They're Coming Out of the Walls (10 player)
    {3015}, -- In His House He Waits Dreaming (10 player)
    {3016}, -- In His House He Waits Dreaming (25 player)
    {3017}, -- They're Coming Out of the Walls (25 player)
    {3036}, -- Observed (10 player)
    {3037}, -- Observed (25 player)
    {3056}, -- Orbit-uary (10 player)
    {3057}, -- Orbit-uary (25 player)
    {3058}, -- Heartbreaker (10 player)
    {3059}, -- Heartbreaker (25 player)
    {3076}, -- Nine Lives (10 player)
    {3077}, -- Nine Lives (25 player)
    { -- Deadly Gladiator's Frost Wyrm
        3096,
        nil,
        nil,
        true,
    },
    {3097}, -- Dwarfageddon (10 player)
    {3098}, -- Dwarfageddon (25 player)
    { -- Realm First! Death's Demise
        3117,
        nil,
        nil,
        nil,
        true,
    },
    {3118}, -- Lumberjacked (25 player)
    {3136}, -- Emalon the Storm Watcher (10 player)
    {3137}, -- Emalon the Storm Watcher (25 player)
    {3138}, -- Not-So-Friendly Fire (10 player)
    {3141}, -- Two Lights in the Darkness (10 player)
    {3142}, -- "Val'anyr, Hammer of Ancient Kings"
    {3157}, -- Three Lights in the Darkness (10 player)
    {3158}, -- One Light in the Darkness (10 player)
    {3159}, -- Alone in the Darkness (10 player)
    {3161}, -- Three Lights in the Darkness (25 player)
    {3162}, -- Two Lights in the Darkness (25 player)
    {3163}, -- One Light in the Darkness (25 player)
    {3164}, -- Alone in the Darkness (25 player)
    {3176}, -- Lose Your Illusion (10 player)
    {3177}, -- Knock on Wood (10 player)
    {3178}, -- "Knock, Knock on Wood (10 player)"
    {3179}, -- "Knock, Knock, Knock on Wood (10 player)"
    {3180}, -- Firefighter (10 player)
    {3181}, -- I Love the Smell of Saronite in the Morning (10 player)
    {3182}, -- I Could Say That This Cache Was Rare (10 player)
    {3183}, -- Lose Your Illusion (25 player)
    {3184}, -- I Could Say That This Cache Was Rare (25 player)
    {3185}, -- Knock on Wood (25 player)
    {3186}, -- "Knock, Knock on Wood (25 player)"
    {3187}, -- "Knock, Knock, Knock on Wood (25 player)"
    {3188}, -- I Love the Smell of Saronite in the Morning (25 player)
    {3189}, -- Firefighter (25 player)
    {3217}, -- Chasing Marcia
    {3218}, -- Turtles All the Way Down
    {3237}, -- Set Up Us the Bomb (25 player)
    { -- Realm First! Celestial Defender
        3259,
        nil,
        nil,
        nil,
        true,
    },
    {3296}, -- Cooking with Style
    {3316}, -- Herald of the Titans
    { -- Deadly Gladiator
        3336,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    {KrowiAF.SetAchievementPatch, 3, 1, 0}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_02_00"] = {
    {3456}, -- Dead Man's Party
    {3457}, -- The Captain's Booty
    { -- Pilgrim
        3478,
        faction.Alliance,
    },
    {3536}, -- The Marine Marine
    { -- Pilgrim's Paunch
        3556,
        faction.Alliance,
        3557,
    },
    { -- Pilgrim's Paunch
        3557,
        faction.Horde,
        3556,
    },
    {3558}, -- Sharing is Caring
    {3559}, -- Turkey Lurkey
    { -- Now We're Cookin'
        3576,
        faction.Alliance,
        3577,
    },
    { -- Now We're Cookin'
        3577,
        faction.Horde,
        3576,
    },
    {3578}, -- The Turkinator
    {3579}, -- """FOOD FIGHT!"""
    { -- Pilgrim's Peril
        3580,
        faction.Alliance,
        3581,
    },
    { -- Pilgrim's Peril
        3581,
        faction.Horde,
        3580,
    },
    {3582}, -- Terokkar Turkey Time
    { -- Pilgrim's Progress
        3596,
        faction.Alliance,
        3597,
    },
    { -- Pilgrim's Progress
        3597,
        faction.Horde,
        3596,
    },
    { -- Murkimus the Gladiator
        3618,
        nil,
        nil,
        true,
    },
    {3636}, -- Jade Tiger
    { -- Pilgrim
        3656,
        faction.Horde,
    },
    { -- Relentless Gladiator's Frost Wyrm
        3757,
        nil,
        nil,
        true,
    },
    { -- Relentless Gladiator
        3758,
        nil,
        nil,
        true,
    },
    { -- Isle of Conquest Victory
        3776,
        nil,
        nil,
        true,
    },
    { -- Isle of Conquest Veteran
        3777,
        nil,
        nil,
        true,
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
    {3808}, -- A Tribute to Skill (10 player)
    {3809}, -- A Tribute to Mad Skill (10 player)
    {3810}, -- A Tribute to Insanity (10 player)
    {3812}, -- Call of the Grand Crusade (25 player)
    {3813}, -- Upper Back Pain (25 player)
    {3815}, -- Salt and Pepper (25 player)
    {3816}, -- The Traitor King (25 player)
    {3817}, -- A Tribute to Skill (25 player)
    {3818}, -- A Tribute to Mad Skill (25 player)
    {3819}, -- A Tribute to Insanity (25 player)
    {3836}, -- Koralon the Flame Watcher (10 player)
    {3837}, -- Koralon the Flame Watcher (25 player)
    {3844}, -- 1000 Dungeon & Raid Emblems
    { -- Isle of Conquest All-Star
        3845,
        nil,
        nil,
        true,
    },
    { -- Resource Glut
        3846,
        faction.Alliance,
        4176,
        true,
    },
    { -- Four Car Garage
        3847,
        nil,
        nil,
        true,
    },
    { -- A-bomb-inable
        3848,
        nil,
        nil,
        true,
    },
    { -- A-bomb-ination
        3849,
        nil,
        nil,
        true,
    },
    { -- Mowed Down
        3850,
        nil,
        nil,
        true,
    },
    { -- Mine
        3851,
        faction.Alliance,
        4177,
        true,
    },
    { -- Cut the Blue Wire... No the Red Wire!
        3852,
        nil,
        nil,
        true,
    },
    { -- All Over the Isle
        3853,
        nil,
        nil,
        true,
    },
    { -- Back Door Job
        3854,
        nil,
        nil,
        true,
    },
    { -- Glaive Grave
        3855,
        nil,
        nil,
        true,
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
    {3896}, -- Onyx Panther
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
        nil,
        nil,
        nil,
        true,
    },
    { -- A Tribute to Immortality
        4079,
        faction.Horde,
        4156,
    },
    {4080}, -- A Tribute to Dedicated Insanity
    { -- A Tribute to Immortality
        4156,
        faction.Alliance,
        4079,
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
    {4316}, -- 2500 Dungeon & Raid Emblems
    {KrowiAF.SetAchievementPatch, 3, 2, 0}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_02_02"] = {
    {4396}, -- Onyxia's Lair (10 player)
    {4397}, -- Onyxia's Lair (25 player)
    {4400}, -- WoW's 5th Anniversary
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
    },
    { -- BB King
        4437,
        faction.Horde,
        4436,
    },
    {4476}, -- Looking For More
    {4477}, -- Looking For Many
    {4478}, -- Looking For Multitudes
    {4496}, -- It's Over Nine Thousand!
    {4585}, -- Toravon the Ice Watcher (10 player)
    {4586}, -- Toravon the Ice Watcher (25 player)
    {KrowiAF.SetAchievementPatch, 3, 2, 2}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_03_00"] = {
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
        nil,
        nil,
        nil,
        true,
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
        nil,
        nil,
        true,
    },
    { -- Wrathful Gladiator's Frost Wyrm
        4600,
        nil,
        nil,
        true,
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
    {4624}, -- Tough Love
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
    {KrowiAF.SetAchievementPatch, 3, 3, 0}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_03_03"] = {
    {4782}, -- Green Brewfest Stein
    { -- Operation: Gnomeregan
        4786,
        faction.Alliance,
    },
    { -- Zalazane's Fall
        4790,
        faction.Horde,
    },
    {KrowiAF.SetAchievementPatch, 3, 3, 3}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["03_03_05"] = {
    {4815}, -- The Twilight Destroyer (25 player)
    {4816}, -- Heroic: The Twilight Destroyer (25 player)
    {4817}, -- The Twilight Destroyer (10 player)
    {4818}, -- Heroic: The Twilight Destroyer (10 player)
    {4824}, -- Collector's Edition: Mini Thor
    {KrowiAF.SetAchievementPatch, 3, 3, 5}, -- Rework loading so this can go to the top, future me problem
};