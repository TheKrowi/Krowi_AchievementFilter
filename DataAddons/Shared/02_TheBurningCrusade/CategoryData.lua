local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

tinsert(KrowiAF.CategoryData.Expansions, { -- The Burning Crusade
    CT.TheBurningCrusade,
    { -- Zones
        addon.L["Zones"],
        { -- Shattrath City
            addon.GetMapName(111),
            {
                1165, -- My Storage is "Gigantique"""
                9924, -- Field Photographer
            },
        },
        { -- Silvermoon City
            addon.GetMapName(110),
            {
                613, -- Killed in Quel'Thalas
                614, -- For the Alliance!
                604, -- Wrath of the Alliance
            },
        },
        { -- The Exodar
            addon.GetMapName(103),
            {
                618, -- Putting Out the Light
                619, -- For the Horde!
                603, -- Wrath of the Horde
            },
        },
        { -- Azuremyst Isle
            addon.GetMapName(97),
            { -- Exploration
                CT.Exploration,
                true,
                {
                    860, -- Explore Azuremyst Isle
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    948, -- Ambassador of the Alliance
                },
            },
        },
        { -- Bloodmyst Isle
            addon.GetMapName(106),
            { -- Quests
                CT.Quests,
                true,
                {
                    4926, -- Bloodmyst Isle Quests
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    861, -- Explore Bloodmyst Isle
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    948, -- Ambassador of the Alliance
                },
            },
        },
        { -- Eversong Woods
            addon.GetMapName(94),
            { -- Exploration
                CT.Exploration,
                true,
                {
                    859, -- Explore Eversong Woods
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    762, -- Ambassador of the Horde
                },
            },
        },
        { -- Ghostlands
            addon.GetMapName(95),
            { -- Quests
                CT.Quests,
                true,
                {
                    4908, -- Ghostlands Quests
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    858, -- Explore Ghostlands
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    762, -- Ambassador of the Horde
                },
            },
        },
        { -- Hellfire Peninsula
            addon.GetMapName(100),
            { -- Quests
                CT.Quests,
                true,
                {
                    1189, -- To Hellfire and Back
                    1271, -- To Hellfire and Back
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    862, -- Explore Hellfire Peninsula
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    948, -- Ambassador of the Alliance
                    762, -- Ambassador of the Horde
                },
            },
        },
        { -- Zangarmarsh
            addon.GetMapName(102),
            { -- Quests
                CT.Quests,
                true,
                {
                    1190, -- Mysteries of the Marsh
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    863, -- Explore Zangarmarsh
                },
            },
            { -- Reputation
                CT.Reputation,
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
            addon.GetMapName(108),
            { -- Quests
                CT.Quests,
                true,
                {
                    1191, -- Terror of Terokkar
                    1272, -- Terror of Terokkar
                    1275, -- Bombs Away
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    867, -- Explore Terokkar Forest
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    903, -- Shattrath Divided
                    1205, -- Hero of Shattrath
                },
            },
        },
        { -- Nagrand
            addon.GetMapName(107),
            { -- Quests
                CT.Quests,
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
                CT.Exploration,
                true,
                {
                    866, -- Explore Nagrand
                },
            },
            { -- Reputation
                CT.Reputation,
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
            addon.GetMapName(105),
            { -- Quests
                CT.Quests,
                true,
                {
                    1193, -- On the Blade's Edge
                    1276, -- Blade's Edge Bomberman
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    865, -- Explore Blade's Edge Mountains
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    896, -- A Quest a Day Keeps the Ogres at Bay
                },
            },
        },
        { -- Netherstorm
            addon.GetMapName(109),
            { -- Quests
                CT.Quests,
                true,
                {
                    1194, -- Into the Nether
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    843, -- Explore Netherstorm
                    9924, -- Field Photographer
                },
            },
        },
        { -- Shadowmoon Valley
            addon.GetMapName(104),
            { -- Quests
                CT.Quests,
                true,
                {
                    1195, -- Shadow of the Betrayer
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    864, -- Explore Shadowmoon Valley
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    898, -- On Wings of Nether
                    1638, -- Skyshattered
                },
            },
        },
        { -- Isle of Quel'Danas
            addon.GetMapName(122),
            { -- Exploration
                CT.Exploration,
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
        CT.Dungeons,
        { -- Hellfire Ramparts
            addon.GetInstanceInfoName(248),
            {
                647, -- Hellfire Ramparts
                667, -- Heroic: Hellfire Ramparts
            },
        },
        { -- The Blood Furnace
            addon.GetInstanceInfoName(256),
            {
                648, -- The Blood Furnace
                668, -- Heroic: The Blood Furnace
            },
        },
        { -- The Shattered Halls
            addon.GetInstanceInfoName(259),
            {
                657, -- The Shattered Halls
                678, -- Heroic: The Shattered Halls
            },
        },
        { -- The Slave Pens
            addon.GetInstanceInfoName(260),
            {
                649, -- The Slave Pens
                669, -- Heroic: The Slave Pens
            },
        },
        { -- The Underbog
            addon.GetInstanceInfoName(262),
            {
                650, -- Underbog
                670, -- Heroic: Underbog
            },
        },
        { -- The Steamvault
            addon.GetInstanceInfoName(261),
            {
                656, -- The Steamvault
                677, -- Heroic: The Steamvault
            },
        },
        { -- Mana-Tombs
            addon.GetInstanceInfoName(250),
            {
                651, -- Mana-Tombs
                671, -- Heroic: Mana-Tombs
            },
        },
        { -- Auchenai Crypts
            addon.GetInstanceInfoName(247),
            {
                666, -- Auchenai Crypts
                672, -- Heroic: Auchenai Crypts
            },
        },
        { -- Sethekk Halls
            addon.GetInstanceInfoName(252),
            {
                653, -- Sethekk Halls
                674, -- Heroic: Sethekk Halls
                883, -- Reins of the Raven Lord
            },
        },
        { -- Shadow Labyrinth
            addon.GetInstanceInfoName(253),
            {
                654, -- Shadow Labyrinth
                675, -- Heroic: Shadow Labyrinth
            },
        },
        { -- Old Hillsbrad Foothills
            addon.GetInstanceInfoName(251),
            {
                652, -- The Escape From Durnholde
                673, -- Heroic: The Escape From Durnholde
            },
        },
        { -- The Black Morass
            addon.GetInstanceInfoName(255),
            {
                655, -- Opening of the Dark Portal
                676, -- Heroic: Opening of the Dark Portal
            },
        },
        { -- The Mechanar
            addon.GetInstanceInfoName(258),
            {
                658, -- The Mechanar
                679, -- Heroic: The Mechanar
            },
        },
        { -- The Botanica
            addon.GetInstanceInfoName(257),
            {
                659, -- The Botanica
                680, -- Heroic: The Botanica
            },
        },
        { -- The Arcatraz
            addon.GetInstanceInfoName(254),
            {
                660, -- The Arcatraz
                681, -- Heroic: The Arcatraz
            },
        },
        { -- Magisters Terrace
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
        CT.Raids,
        { -- Karazhan
            addon.GetInstanceInfoName(745),
            { -- Reputation
                CT.Reputation,
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
            addon.GetInstanceInfoName(746),
            {
                692, -- Gruul's Lair
                11746, -- Outlandish Style
            },
        },
        { -- Magtheridon's Lair
            addon.GetInstanceInfoName(747),
            {
                693, -- Magtheridon's Lair
                11746, -- Outlandish Style
            },
        },
        { -- Serpentshrine Cavern
            addon.GetInstanceInfoName(748),
            {
                694, -- Serpentshrine Cavern
                11747, -- Merely a Set
                8293, -- Raiding with Leashes II: Attunement Edition
            },
        },
        { -- The Eye
            addon.GetInstanceInfoName(749),
            {
                696, -- Tempest Keep
                885, -- Ashes of Al'ar
                8293, -- Raiding with Leashes II: Attunement Edition
            },
        },
        { -- The Battle for Mount Hyjal
            addon.GetInstanceInfoName(750),
            { -- Reputation
                CT.Reputation,
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
            addon.GetInstanceInfoName(751),
            { -- Reputation
                CT.Reputation,
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
            addon.GetInstanceInfoName(77) .. CT.Legacy,
            {
                691, -- Zul'Aman
                430, -- Amani War Bear
            },
        },
        { -- Sunwell Plateau
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
        CT.Professions,
        { -- Archaeology
            CT.Archaeology,
            true,
            {
                4921, -- Master Archaeologist
                5192, -- The Harder they Fall
            },
        },
        { -- Cooking
            CT.Cooking,
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
            CT.Engineering,
            true,
            {
                18856, -- Just an Ordinary Gas Cloud
            },
        },
        { -- Fishing
            CT.Fishing,
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
            CT.Leatherworking,
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
        CT.PetBattles,
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
})