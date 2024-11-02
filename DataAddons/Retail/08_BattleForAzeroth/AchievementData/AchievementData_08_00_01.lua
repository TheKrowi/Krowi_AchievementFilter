local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_00_01"] = {
    { -- The Throne of Zuldazar
        11861,
        faction.Horde,
        12473,
    },
    { -- The Dark Heart of Nazmir
        11868,
        faction.Horde,
        12497,
    },
    { -- The Reining Champion
        12087,
        faction.Alliance,
    },
    { -- Collector's Edition: Seabraid Stallion
        12229,
        faction.Alliance,
        12230,
    },
    { -- Collector's Edition: Gilded Ravasaur
        12230,
        faction.Horde,
        12229,
    },
    { -- Collector's Edition: Tottle
        12232,
    },
    { -- Bringing Hexy Back
        12270,
    },
    { -- Gold Fever
        12272,
    },
    { -- It's Lit!
        12273,
    },
    { -- Salute to StarCraft
        12454,
    },
    { -- Remix to Ignition
        12457,
    },
    { -- Shot Through the Heart
        12462,
    },
    { -- A Sound Plan
        12473,
        faction.Alliance,
        11861,
    },
    { -- Secrets in the Sands
        12478,
        faction.Horde,
        12496,
    },
    { -- Zandalar Forever!
        12479,
        faction.Horde,
        12891,
    },
    { -- A Bargain of Blood
        12480,
        faction.Horde,
    },
    { -- The Final Seal
        12481,
        faction.Horde,
    },
    { -- Get Hek'd
        12482,
    },
    { -- Waycrest Manor
        12483,
    },
    { -- Heroic: Waycrest Manor
        12484,
    },
    { -- Mythic: Waycrest Manor
        12488,
    },
    { -- Losing My Profession
        12489,
    },
    { -- Alchemical Romance
        12490,
    },
    { -- Run Wild Like a Man On Fire
        12495,
    },
    { -- Stormsong and Dance
        12496,
        faction.Alliance,
        12478,
    },
    { -- Drust Do It.
        12497,
        faction.Alliance,
        11868,
    },
    { -- Taint Nobody Got Time For That
        12498,
    },
    { -- Sporely Alive
        12499,
    },
    { -- Underrot
        12500,
    },
    { -- Heroic: Underrot
        12501,
    },
    { -- Mythic: Underrot
        12502,
    },
    { -- Snake Eyes
        12503,
    },
    { -- The Temple of Sethraliss
        12504,
    },
    { -- Heroic: The Temple of Sethraliss
        12505,
    },
    { -- Mythic: The Temple of Sethraliss
        12506,
    },
    { -- Snake Eater
        12507,
    },
    { -- "Good Night, Sweet Prince"
        12508,
    },
    { -- Ready for War
        12509,
        faction.Horde,
        12510,
    },
    { -- Ready for War
        12510,
        faction.Alliance,
        12509,
    },
    { -- Allied Races: Dark Iron Dwarf
        12515,
        faction.Alliance,
    },
    { -- Allied Races: Mag'har Orc
        12518,
        faction.Horde,
    },
    { -- Halls of Containment
        12521,
    },
    { -- Crimson Descent
        12522,
    },
    { -- Heart of Corruption
        12523,
    },
    { -- Mythic: Taloc
        12524,
    },
    { -- Mythic: MOTHER
        12526,
    },
    { -- Mythic: Zek'voz
        12527,
    },
    { -- Mythic: Vectis
        12529,
    },
    { -- Mythic: Fetid Devourer
        12530,
    },
    { -- Mythic: Zul
        12531,
    },
    { -- Mythic: Mythrax the Unraveler
        12532,
    },
    { -- Mythic: G'huun
        12533,
    },
    { -- Cutting Edge: G'huun
        12535,
    },
    { -- Ahead of the Curve: G'huun
        12536,
    },
    { -- Level 120 (Legacy)
        12544,
    },
    { -- Superior (Battle)
        12546,
    },
    { -- Epic (Battle)
        12547,
    },
    { -- I'm in Charge Now!
        12548,
    },
    { -- Not a Fun Guy
        12549,
    },
    { -- Pecking Order
        12550,
    },
    { -- Double Dribble
        12551,
    },
    { -- Welcome to Zandalar
        12555,
        faction.Horde,
        12582,
    },
    { -- Explore Tiragarde Sound
        12556,
    },
    { -- Explore Drustvar
        12557,
    },
    { -- Explore Stormsong Valley
        12558,
    },
    { -- Explore Zuldazar
        12559,
    },
    { -- Explore Vol'dun
        12560,
    },
    { -- Explore Nazmir
        12561,
    },
    { -- The Horde Slayer
        12567,
        faction.Alliance,
        12568,
        true,
    },
    { -- The Alliance Slayer
        12568,
        faction.Horde,
        12567,
        true,
    },
    { -- Bounty Hunting
        12571,
        {
            IsPvP = true,
        },
    },
    { -- War Supplied
        12572,
        {
            IsPvP = true,
        },
    },
    { -- Band of Brothers
        12573,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Nazmir
        12574,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Zuldazar
        12575,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Vol'dun
        12576,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Tiragarde Sound
        12577,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Stormsong Valley
        12578,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Drustvar
        12579,
        {
            IsPvP = true,
        },
    },
    { -- Come Sail Away
        12582,
        faction.Alliance,
        12555,
    },
    { -- Unbound Monstrosities
        12587,
    },
    { -- Eat Your Greens
        12588,
    },
    { -- Heroic: Un'gol Ruins
        12589,
    },
    { -- Un'gol Ruins
        12590,
    },
    { -- Mythic: Un'gol Ruins
        12591,
    },
    { -- Ruined the Ruins
        12592,
        {
            IsPvP = true,
        },
    },
    { -- Loremaster of Kul Tiras
        12593,
        faction.Alliance,
        13294,
    },
    { -- Competent Captain
        12594,
    },
    { -- Expert Expeditioner
        12595,
    },
    { -- No Tourist
        12596,
    },
    { -- Bayside Brawler
        12597,
        {
            IsPvP = true,
        },
    },
    { -- Breath of the Shrine
        12600,
    },
    { -- The Void Lies Sleeping
        12601,
    },
    { -- Trust No One
        12602,
    },
    { -- Conqueror of Azeroth
        12604,
        faction.Horde,
        12605,
        true,
    },
    { -- Conqueror of Azeroth
        12605,
        faction.Alliance,
        12604,
        true,
    },
    { -- Loa Expectations
        12614,
        faction.Horde,
    },
    { -- Spirits Be With You
        12719,
        faction.Horde,
    },
    { -- Wrap God
        12721,
    },
    { -- It Belongs in a Mausoleum!
        12722,
    },
    { -- How to Keep a Mummy
        12723,
    },
    { -- A Fish Out of Water
        12726,
    },
    { -- Stand by Me
        12727,
    },
    { -- Professional Kul Tiran Master
        12731,
        faction.Alliance,
        12733,
    },
    { -- Professional Zandalari Master
        12733,
        faction.Horde,
        12731,
    },
    { -- Working in Kul Tiras
        12734,
        faction.Alliance,
        12735,
    },
    { -- Working in Zandalar
        12735,
        faction.Horde,
        12734,
    },
    { -- Kul Tiran Master of All
        12736,
        faction.Alliance,
        12737,
    },
    { -- Zandalari Master of All
        12737,
        faction.Horde,
        12736,
    },
    { -- Holy Scrap!
        12738,
    },
    { -- Scraptastic!
        12739,
    },
    { -- Full of Scrap!
        12740,
    },
    { -- Giving a Scrap
        12741,
        faction.Alliance,
        13056,
    },
    { -- Kul Tiran Cook
        12742,
        faction.Alliance,
        12743,
    },
    { -- Zandalari Cook
        12743,
        faction.Horde,
        12742,
    },
    { -- The Kul Tiran Menu
        12744,
        faction.Alliance,
        12746,
    },
    { -- The Zandalari Menu
        12746,
        faction.Horde,
        12744,
    },
    { -- Catering for Combat
        12747,
    },
    { -- Kul Tiran Fisherman
        12753,
        faction.Alliance,
        12754,
    },
    { -- Zandalari Fisherman
        12754,
        faction.Horde,
        12753,
    },
    { -- Scent of the Sea
        12755,
    },
    { -- Fish Me In the Moonlight
        12756,
    },
    { -- Angling for Battle
        12757,
    },
    { -- Baiting the Enemy
        12758,
        faction.Alliance,
        12759,
    },
    { -- Baiting the Enemy
        12759,
        faction.Horde,
        12758,
    },
    { -- Kul Tiran Archaeologist
        12760,
        faction.Alliance,
        12761,
    },
    { -- Zandalari Archaeologist
        12761,
        faction.Horde,
        12760,
    },
    { -- Kul Tiran Curator
        12762,
        faction.Alliance,
        12764,
    },
    { -- Zandalari Curator
        12764,
        faction.Horde,
        12762,
    },
    { -- Exotic Discoveries
        12765,
    },
    { -- Light Travel
        12769,
    },
    { -- Lengthy Legwork
        12770,
    },
    { -- Treasures of Nazmir
        12771,
    },
    { -- Now We Got Bad Blood
        12772,
    },
    { -- Glory of the Uldir Raider
        12806,
    },
    { -- Battle for Azeroth Dungeon Hero
        12807,
    },
    { -- Glory of the Wartorn Hero
        12812,
    },
    { -- Thrash Mouth - All Stars
        12823,
    },
    { -- Atal'Dazar
        12824,
    },
    { -- Heroic: Atal'Dazar
        12825,
    },
    { -- Mythic: Atal'Dazar
        12826,
    },
    { -- WoW's 14th Anniversary
        12827,
    },
    { -- What's in the Box?
        12828,
    },
    { -- Edgelords
        12830,
    },
    { -- Freehold
        12831,
    },
    { -- Heroic: Freehold
        12832,
    },
    { -- Mythic: Freehold
        12833,
    },
    { -- Shrine of the Storm
        12835,
    },
    { -- Existential Crisis
        12836,
    },
    { -- Heroic: Shrine of the Storm
        12837,
    },
    { -- Mythic: Shrine of the Storm
        12838,
    },
    { -- Tol Dagor
        12840,
    },
    { -- Heroic: Tol Dagor
        12841,
    },
    { -- Mythic: Tol Dagor
        12842,
    },
    { -- The MOTHERLODE!!
        12844,
    },
    { -- Heroic: The MOTHERLODE!!
        12845,
    },
    { -- Mythic: The MOTHERLODE!!
        12846,
    },
    { -- Siege of Boralus
        12847,
    },
    { -- Kings' Rest
        12848,
    },
    { -- Treasures of Vol'dun
        12849,
    },
    { -- At Least You're Being Careful
        12850,
    },
    { -- Treasures of Zuldazar
        12851,
    },
    { -- Treasures of Tiragarde Sound
        12852,
    },
    { -- Treasures of Stormsong Valley
        12853,
    },
    { -- Ready for Raiding VI
        12854,
    },
    { -- Pitch Invasion
        12855,
    },
    { -- The First Rule of Dueler's Guild
        12856,
        {
            IsPvP = true,
        },
    },
    { -- Trial by Combat
        12857,
        {
            IsPvP = true,
        },
    },
    { -- Slugfest
        12858,
        {
            IsPvP = true,
        },
    },
    { -- Prize Fighter
        12859,
        {
            IsPvP = true,
        },
    },
    { -- Contender
        12860,
        {
            IsPvP = true,
        },
    },
    { -- Master of Duels
        12861,
        {
            IsPvP = true,
        },
    },
    { -- Thirty Six and Two
        12862,
        {
            IsPvP = true,
        },
    },
    { -- Dueling Master
        12863,
        {
            IsPvP = true,
        },
    },
    { -- 80 Exalted Reputations
        12864,
    },
    { -- 90 Exalted Reputations
        12865,
    },
    { -- 100 Exalted Reputations
        12866,
    },
    { -- Azeroth at War: The Barrens
        12867,
        faction.Horde,
        12896,
    },
    { -- Azeroth at War: After Lordaeron
        12869,
        faction.Horde,
        12898,
    },
    { -- Azeroth at War: Kalimdor on Fire
        12870,
        faction.Horde,
        12899,
    },
    { -- The Dirty Five
        12872,
    },
    { -- War is Hell
        12873,
        faction.Horde,
        12881,
    },
    { -- An Eventful Battle
        12874,
    },
    { -- Strike Fast
        12876,
        faction.Horde,
        12889,
    },
    { -- Strike Hard
        12877,
        faction.Horde,
        12888,
    },
    { -- Leader of Troops
        12878,
        faction.Horde,
        12884,
    },
    { -- Tour of War
        12879,
        faction.Horde,
        12886,
    },
    { -- War is Hell
        12881,
        faction.Alliance,
        12873,
    },
    { -- Leader of Troops
        12884,
        faction.Alliance,
        12878,
    },
    { -- Tour of War
        12886,
        faction.Alliance,
        12879,
    },
    { -- Strike Hard
        12888,
        faction.Alliance,
        12877,
    },
    { -- Strike Fast
        12889,
        faction.Alliance,
        12876,
    },
    { -- A Nation United
        12891,
        faction.Alliance,
        12479,
    },
    { -- Honor Level 5
        12893,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 10
        12894,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 15
        12895,
        {
            IsPvP = true,
        },
    },
    { -- Azeroth at War: The Barrens
        12896,
        faction.Alliance,
        12867,
    },
    { -- Azeroth at War: After Lordaeron
        12898,
        faction.Alliance,
        12869,
    },
    { -- Azeroth at War: Kalimdor on Fire
        12899,
        faction.Alliance,
        12870,
    },
    { -- Honor Level 20
        12900,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 25
        12901,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 30
        12902,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 40
        12903,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 50
        12904,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 60
        12905,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 70
        12906,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 80
        12907,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 90
        12908,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 100
        12909,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 125
        12910,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 150
        12911,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 175
        12912,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 200
        12913,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 250
        12914,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 300
        12915,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 400
        12916,
        {
            IsPvP = true,
        },
    },
    { -- Honor Level 500
        12917,
        {
            IsPvP = true,
        },
    },
    { -- Have a Heart
        12918,
    },
    { -- Polished Pet Charmer
        12927,
    },
    { -- Battle Safari
        12930,
    },
    { -- No Stable Big Enough
        12931,
        faction.Horde,
        12932,
    },
    { -- No Stable Big Enough
        12932,
        faction.Alliance,
        12931,
    },
    { -- A Horde of Hoofbeats
        12933,
        faction.Alliance,
        12934,
    },
    { -- A Horde of Hoofbeats
        12934,
        faction.Horde,
        12933,
    },
    { -- Battle on Zandalar and Kul Tiras
        12936,
    },
    { -- Elevator Music
        12937,
    },
    { -- Parental Controls
        12938,
    },
    { -- Adventurer of Tiragarde Sound
        12939,
    },
    { -- Adventurer of Stormsong Valley
        12940,
    },
    { -- Adventurer of Drustvar
        12941,
    },
    { -- Adventurer of Nazmir
        12942,
    },
    { -- Adventurer of Vol'dun
        12943,
    },
    { -- Adventurer of Zuldazar
        12944,
    },
    { -- Dread Gladiator: Battle for Azeroth Season 1
        12945,
        {
            IsPvP = true,
        },
    },
    { -- Azerothian Diplomat
        12947,
    },
    { -- Talanji's Expedition
        12948,
        faction.Horde,
        12952,
    },
    { -- The Voldunai
        12949,
        faction.Horde,
        12953,
    },
    { -- Zandalari Empire
        12950,
        faction.Horde,
        12951,
    },
    { -- Proudmoore Admiralty
        12951,
        faction.Alliance,
        12950,
    },
    { -- Order of Embers
        12952,
        faction.Alliance,
        12948,
    },
    { -- Storm's Wake
        12953,
        faction.Alliance,
        12949,
    },
    { -- Champion of the 7th Legion
        12954,
        faction.Alliance,
        12957,
    },
    { -- Champions of Azeroth
        12955,
    },
    { -- Tortollan Seekers
        12956,
    },
    { -- Champion of the Honorbound
        12957,
        faction.Horde,
        12954,
    },
    { -- Master of Minions
        12958,
    },
    { -- Challenger: Battle for Azeroth Season 1
        12959,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Battle for Azeroth Season 1
        12960,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Battle for Azeroth Season 1
        12961,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Battle for Azeroth Season 1
        12962,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Dread
        12963,
        faction.Alliance,
        12964,
        true,
    },
    { -- Hero of the Horde: Dread
        12964,
        faction.Horde,
        12963,
        true,
    },
    { -- Battle for Azeroth Explorer
        12988,
    },
    { -- "Battle for Azeroth Pathfinder, Part One"
        12989,
    },
    { -- Catchin' Some Rays
        12990,
    },
    { -- "New Mog, G'huun This?"
        12991,
    },
    { -- Pet Emporium
        12992,
    },
    { -- Don't Warfront Me
        12993,
    },
    { -- Treasures of Drustvar
        12995,
    },
    { -- Toybox Tycoon
        12996,
    },
    { -- The Pride of Kul Tiras
        12997,
        faction.Alliance,
    },
    { -- That Sweete Booty
        12998,
    },
    { -- Adept Sandfisher
        13009,
        faction.Horde,
    },
    { -- Scourge of Zem'lan
        13011,
    },
    { -- Vorrik's Champion
        13014,
        faction.Horde,
    },
    { -- Scavenger of the Sands
        13016,
    },
    { -- Champion of the Vulpera
        13017,
        faction.Horde,
    },
    { -- Dune Rider
        13018,
    },
    { -- Bow to Your Masters
        13020,
        faction.Horde,
    },
    { -- A Most Efficient Apocalypse
        13021,
        faction.Horde,
    },
    { -- Revenge is Best Served Speedily
        13022,
        faction.Horde,
    },
    { -- It's Really Getting Out of Hand
        13023,
    },
    { -- "Carved in Stone, Written in Blood"
        13024,
    },
    { -- Zandalari Spycatcher
        13025,
        faction.Horde,
    },
    { -- 7th Legion Spycatcher
        13026,
        faction.Alliance,
    },
    { -- Mushroom Harvest
        13027,
    },
    { -- Hoppin' Sad
        13028,
    },
    { -- Eating Out of the Palm of My Tiny Hand
        13029,
    },
    { -- How to Ptrain Your Pterrordax
        13030,
        faction.Horde,
    },
    { -- By de Power of de Loa!
        13035,
    },
    { -- A Loa of a Tale
        13036,
    },
    { -- Raptari Rider
        13038,
        faction.Horde,
    },
    { -- Paku'ai
        13039,
        faction.Horde,
    },
    { -- "Hungry, Hungry Ranishu"
        13041,
        faction.Horde,
    },
    { -- About To Break
        13042,
    },
    { -- Every Day I'm Truffling
        13045,
    },
    { -- These Hills Sing
        13046,
    },
    { -- Clever Use of Mechanical Explosives
        13047,
    },
    { -- Life Finds a Way... To Die!
        13048,
    },
    { -- The Long Con
        13049,
        faction.Alliance,
    },
    { -- Bless the Rains Down in Freehold
        13050,
    },
    { -- Legends of the Tidesages
        13051,
    },
    { -- Deadliest Cache
        13053,
        faction.Alliance,
    },
    { -- Sabertron Assemble
        13054,
    },
    { -- Giving a Scrap
        13056,
        faction.Horde,
        12741,
    },
    { -- Shanty Raid
        13057,
    },
    { -- Kul Tiran Up the Dance Floor
        13058,
    },
    { -- Drag Race
        13059,
        faction.Alliance,
    },
    { -- Kul Runnings
        13060,
        faction.Alliance,
    },
    { -- Three Sheets to the Wind
        13061,
    },
    { -- Let's Bee Friends
        13062,
        faction.Alliance,
    },
    { -- "Drust the Facts, Ma'am"
        13064,
    },
    { -- Battle for Azeroth Keymaster
        13075,
    },
    { -- Heritage of the Dark Iron
        13076,
        faction.Alliance,
    },
    { -- Heritage of the Mag'har
        13077,
        faction.Horde,
    },
    { -- Realm First! Battle for Azeroth Keystone Master
        13078,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Battle for Azeroth Keystone Conqueror: Season One
        13079,
    },
    { -- Battle for Azeroth Keystone Master: Season One
        13080,
    },
    { -- Everything Old Is New Again
        13082,
        faction.Alliance,
    },
    { -- "Better, Faster, Stronger"
        13083,
    },
    { -- Sausage Sampler
        13087,
    },
    { -- Dread Gladiator's Proto-Drake
        13093,
        {
            IsPvP = true,
        },
    },
    { -- Cursed Game Hunter
        13094,
    },
    { -- Dread Chain
        13095,
    },
    { -- Heroic: Dread Chain
        13096,
    },
    { -- Mythic: Dread Chain
        13097,
    },
    { -- Bane of the Chain
        13098,
        {
            IsPvP = true,
        },
    },
    { -- Molten Cay
        13099,
    },
    { -- Heroic: Molten Cay
        13100,
    },
    { -- Mythic: Molten Cay
        13101,
    },
    { -- Clash at the Cay
        13102,
        {
            IsPvP = true,
        },
    },
    { -- Rotting Mire
        13103,
    },
    { -- Heroic: Rotting Mire
        13104,
    },
    { -- Mythic: Rotting Mire
        13105,
    },
    { -- Mire Marauder
        13106,
        {
            IsPvP = true,
        },
    },
    { -- Skittering Hollow
        13107,
    },
    { -- Heroic: Skittering Hollow
        13108,
    },
    { -- Mythic: Skittering Hollow
        13109,
    },
    { -- Skittering Smashed
        13110,
        {
            IsPvP = true,
        },
    },
    { -- Verdant Wilds
        13111,
    },
    { -- Heroic: Verdant Wilds
        13112,
    },
    { -- Mythic: Verdant Wilds
        13113,
    },
    { -- War for the Wilds
        13114,
        {
            IsPvP = true,
        },
    },
    { -- Reef Madness
        13115,
        {
            IsPvP = true,
        },
    },
    { -- Mythic: Whispering Reef
        13116,
    },
    { -- Heroic: Whispering Reef
        13118,
    },
    { -- Whispering Reef
        13119,
    },
    { -- Blood in the Water
        13120,
        {
            IsPvP = true,
        },
    },
    { -- Notorious
        13121,
        {
            IsPvP = true,
        },
    },
    { -- Island Conqueror
        13122,
    },
    { -- My Dubs
        13123,
    },
    { -- Metal Detector
        13124,
    },
    { -- Azerite Admiral
        13125,
    },
    { -- Give Me The Energy
        13126,
    },
    { -- Tell Me A Tale
        13127,
    },
    { -- I'm Here for the Pets
        13128,
    },
    { -- Sucker Punch
        13129,
        {
            IsPvP = true,
        },
    },
    { -- Helping Hand
        13132,
    },
    { -- Team Deathmatch
        13133,
        faction.Alliance,
        13135,
    },
    { -- Expedition Leader
        13134,
        {
            IsPvP = true,
        },
    },
    { -- Team Deathmatch
        13135,
        faction.Horde,
        13133,
    },
    { -- Island Slayer
        13141,
        {
            IsPvP = true,
        },
    },
    { -- Archipelago Explorer
        13142,
    },
    { -- Wide World of Quests
        13144,
    },
    {KrowiAF.SetAchievementPatch, 8, 0, 1}, -- Rework loading so this can go to the top, future me problem
};