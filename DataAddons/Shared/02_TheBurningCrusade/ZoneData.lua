local _, addon = ...
addon.Data.ZoneData.Shared.TheBurningCrusade = {}
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("TheBurningCrusade")

zoneData:Zone(112, { -- Eye of the Storm (battleground)
    shared.GenericBattleground,
    208, -- Eye of the Storm
    209, -- Eye of the Storm Victory
    783, -- Eye of the Storm Veteran
    784, -- Eye of the Storm Dominance
    214, -- Ironman
    213, -- Flurry
    212, -- Storm Capper
    216, -- Four Bases in Eye of the Storm
    233, -- Stormtrooper
    1171, -- Resilient Victory
    587, -- The Eye of the Storm
    1258, -- Stormy Assassin
    211, -- Veteran of the Eye of the Storm
    230, -- Battlemaster
})

zoneData:Zone(122, { -- Isle of Quel'Danas (zone)
    42, -- Eastern Kingdoms Explorer
    897, -- You're So Offensive
    868, -- Explore Isle of Quel'Danas
    46, -- Universal Explorer
})

zoneData:Zone(347, { -- Hellfire Ramparts
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    647, -- Hellfire Ramparts
    667, -- Heroic: Hellfire Ramparts
})

zoneData:Zone(261, { -- The Blood Furnace
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    648, -- The Blood Furnace
    668, -- Heroic: The Blood Furnace
})

zoneData:Zone(246, { -- The Shattered Halls
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    657, -- The Shattered Halls
    678, -- Heroic: The Shattered Halls
})

zoneData:Zone(265, { -- The Slave Pens
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    649, -- The Slave Pens
    669, -- Heroic: The Slave Pens
    263, -- Ice the Frost Lord
})

zoneData:Zone(262, { -- The Underbog
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    650, -- The Underbog
    670, -- Heroic: The Underbog
})

zoneData:Zone({263, 264}, { -- The Steamvault
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    656, -- The Steamvault
    677, -- Heroic: The Steamvault
})

zoneData:Zone(272, { -- Mana-Tombs
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    902, -- Chief Exalted Officer
    651, -- Mana-Tombs
    671, -- Heroic: Mana-Tombs
})

zoneData:Zone({256, 257}, { -- Auchenai Crypts
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    666, -- Auchenai Crypts
    672, -- Heroic: Auchenai Crypts
})

zoneData:Zone({258, 259}, { -- Sethekk Halls
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    653, -- Sethekk Halls
    674, -- Heroic: Sethekk Halls
    883, -- Reins of the Raven Lord
})

zoneData:Zone(260, { -- Shadow Labyrinth
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    654, -- Shadow Labyrinth
    675, -- Heroic: Shadow Labyrinth
})

zoneData:Zone(274, { -- Old Hillsbrad Foothills
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    652, -- The Escape From Durnholde
    673, -- Heroic: The Escape From Durnholde
})

zoneData:Zone(273, { -- The Black Morass
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    655, -- Opening of the Dark Portal
    676, -- Heroic: Opening of the Dark Portal
})

zoneData:Zone({267, 268}, { -- The Mechanar
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    658, -- The Mechanar
    679, -- Heroic: The Mechanar
})

zoneData:Zone(266, { -- The Botanica
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    659, -- The Botanica
    680, -- Heroic: The Botanica
})

zoneData:Zone({269, 270, 271}, { -- The Arcatraz
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    660, -- The Arcatraz
    681, -- Heroic: The Arcatraz
})

zoneData:Zone({348, 349}, { -- Magisters' Terrace
    897, -- You're So Offensive
    661, -- Magister's Terrace
    682, -- Heroic: Magister's Terrace
    884, -- Swift White Hawkstrider
})

zoneData:Zone(333, { -- Zul'Aman
    691, -- Zul'Aman
    430, -- Amani War Bear
    5858, -- Bear-ly Made It
    5750, -- Zul'Aman
    5761, -- Heroic: Zul'Aman
    5760, -- Heroic: Zul'Aman
    5769, -- Zul'Aman
})

zoneData:Zone(94, { -- Eversong Woods (zone)
    42, -- Eastern Kingdoms Explorer
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    859, -- Explore Eversong Woods
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    967, -- Tricks and Treats of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({95, 96}, { -- Ghostlands (zone)
    42, -- Eastern Kingdoms Explorer
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    4908, -- Ghostlands Quests
    858, -- Explore Ghostlands
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    46, -- Universal Explorer
    967, -- Tricks and Treats of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({97, 98, 99, 106}, { -- Azuremyst Isle (zone)
    43, -- Kalimdor Explorer
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    860, -- Explore Azuremyst Isle
    948, -- Ambassador of the Alliance
    2556, -- Pest Control
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    963, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(106, { -- Bloodmyst Isle (zone)
    7520, -- The Loremaster
    1678, -- Explore Kalimdor
    43, -- Kalimdor Explorer
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    4926, -- Bloodmyst Isle Quests
    861, -- Explore Bloodmyst Isle
    948, -- Ambassador of the Alliance
    2556, -- Pest Control
    46, -- Universal Explorer
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(101, { -- Outland (continent)
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    46, -- Universal Explorer
    971, -- Tricks and Treats of Azeroth
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
    1034, -- The Fires of Azeroth
    1035, -- Desecration of the Horde
    1036, -- The Fires of Azeroth
    1037, -- Desecration of the Alliance
})

zoneData:Zone(100, { -- Hellfire Peninsula (zone)
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    1189, -- To Hellfire and Back
    1271, -- To Hellfire and Back
    862, -- Explore Hellfire Peninsula
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(102, { -- Zangarmarsh (zone)
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    1190, -- Mysteries of the Marsh
    863, -- Explore Zangarmarsh
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    893, -- Cenarion War Hippogryph
    953, -- Guardian of Cenarius
    900, -- The Czar of Sporeggar
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(103, { -- The Exodar (city)
    388, -- Ambassador
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    618, -- Putting Out the Light
    619, -- For the Horde!
    603, -- Wrath of the Horde
    915, -- Elders of the Alliance
    2556, -- Pest Control
    963, -- Tricks and Treats of Kalimdor
})

zoneData:Zone(104, { -- Shadowmoon Valley (zone)
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    1195, -- Shadow of the Betrayer
    431, -- Hand of A'dal
    864, -- Explore Shadowmoon Valley
    898, -- On Wings of Nether
    1638, -- Skyshattered
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(105, { -- Blade's Edge Mountains (zone)
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6611, -- Continental Tamer
    6590, -- World Safari
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    894, -- Flying High Over Skettis
    1193, -- On the Blade's Edge
    1276, -- Blade's Edge Bomberman
    865, -- Explore Blade's Edge Mountains
    896, -- A Quest a Day Keeps the Ogres at Bay
    6587, -- Outland Safari
    6614, -- Outland Tamer
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(107, { -- Nagrand (zone)
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    902, -- Chief Exalted Officer
    1192, -- Nagrand Slam
    1273, -- Nagrand Slam
    939, -- Hills Like White Elekk
    941, -- Hemet Nesingwary: The Collected Quests
    1576, -- Of Blood and Anguish
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    866, -- Explore Nagrand
    899, -- Oh My, Kurenai
    901, -- Mag'har of Draenor
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(108, { -- Terokkar Forest (zone)
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6611, -- Continental Tamer
    6590, -- World Safari
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    894, -- Flying High Over Skettis
    1191, -- Terror of Terokkar
    1272, -- Terror of Terokkar
    1275, -- Bombs Away
    867, -- Explore Terokkar Forest
    726, -- Mr. Pinchy's Magical Crawdad Box
    905, -- Old Man Barlowned
    903, -- Shattrath Divided
    1205, -- Hero of Shattrath
    6587, -- Outland Safari
    6614, -- Outland Tamer
    2556, -- Pest Control
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(109, { -- Netherstorm (zone)
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6611, -- Continental Tamer
    6590, -- World Safari
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    902, -- Chief Exalted Officer
    1194, -- Into the Nether
    843, -- Explore Netherstorm
    9924, -- Field Photographer
    6587, -- Outland Safari
    6614, -- Outland Tamer
    46, -- Universal Explorer
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
    1024, -- Flame Warden of Outland
    1027, -- Flame Keeper of Outland
    1030, -- Extinguishing Outland
    1033, -- Extinguishing Outland
})

zoneData:Zone(110, { -- Silvermoon City (city)
    1006, -- City Defender
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    613, -- Killed in Quel'Thalas
    614, -- For the Alliance!
    604, -- Wrath of the Alliance
    914, -- Elders of the Horde
    2556, -- Pest Control
    967, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone(111, { -- Shattrath City (city)
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1165, -- My Storage is "Gigantique"
    906, -- Kickin' It Up a Notch
    432, -- Champion of the Naaru
    9924, -- Field Photographer
    6604, -- Taming Outland
    275, -- Veteran Nanny
    968, -- Tricks and Treats of Outland
    969, -- Tricks and Treats of Outland
})

zoneData:Zone({350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366}, { -- Karazhan
    690, -- Karazhan
    882, -- Fiery Warhorse's Reins
    2456, -- Vampire Hunter
    960, -- The Violet Eye
    11746, -- Outlandish Style
    8293, -- Raiding with Leashes II: Attunement Edition
    9924, -- Field Photographer
})

zoneData:Zone(330, { -- Gruul's Lair
    692, -- Gruul's Lair
    11746, -- Outlandish Style
})

zoneData:Zone(331, { -- Magtheridon's Lair
    693, -- Magtheridon's Lair
    11746, -- Outlandish Style
})

zoneData:Zone(332, { -- Serpentshrine Cavern
    694, -- Serpentshrine Cavern
    144, -- The Lurker Above
    11747, -- Merely a Set
    8293, -- Raiding with Leashes II: Attunement Edition
})

zoneData:Zone(334, { -- The Eye (Tempest Keep)
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    696, -- Tempest Keep
    885, -- Ashes of Al'ar
    8293, -- Raiding with Leashes II: Attunement Edition
})

zoneData:Zone(329, { -- The Battle for Mount Hyjal
    695, -- The Battle for Mount Hyjal
    959, -- The Scale of the Sands
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})

zoneData:Zone({339, 340, 341, 342, 343, 344, 345, 346}, { -- Black Temple
    697, -- The Black Temple
    426, -- Warglaives of Azzinoth
    958, -- Sworn to the Deathsworn
    11748, -- Black is the New Black
    9016, -- Breaker of the Black Harvest
    11869, -- I'll Hold These For You Until You Get Out
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})

zoneData:Zone({335, 336}, { -- Sunwell Plateau
    698, -- Sunwell Plateau
    725, -- Thori'dal, the Stars' Fury
    11749, -- Suns Out, Thori'dals Out
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})
