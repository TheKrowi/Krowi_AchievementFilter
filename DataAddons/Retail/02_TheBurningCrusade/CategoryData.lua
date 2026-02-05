local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- The Burning Crusade
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
            1311, -- Medium Rare
            1312, -- Bloody Rare
            44, -- Outland Explorer
            763, -- The Burning Crusader
            764, -- The Burning Crusader
            894, -- Flying High Over Skettis
            897, -- You're So Offensive
            902, -- Chief Exalted Officer
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
            62358, -- Outlandish Lumberjack
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
});