local _, addon = ...
local shared = addon.Data.ZoneData.Shared
local sharedTBC = addon.Data.ZoneData.Shared.TheBurningCrusade

local zoneData = sharedTBC.ZoneData

zoneData:Zone({94, 467}, { -- Eversong Woods (zone)
    42, -- Eastern Kingdoms Explorer
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    859, -- Explore Eversong Woods
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    46, -- Universal Explorer
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
})

zoneData:Zone({97, 98, 99, 468}, { -- Azuremyst Isle (zone)
    43, -- Kalimdor Explorer
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    860, -- Explore Azuremyst Isle
    948, -- Ambassador of the Alliance
    2556, -- Pest Control
    46, -- Universal Explorer
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
    894, -- Flying High Over Skettis
    902, -- Chief Exalted Officer
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    46, -- Universal Explorer
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
})

zoneData:Zone(103, { -- The Exodar (city)
    388, -- Ambassador
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    618, -- Putting Out the Light
    619, -- For the Horde!
    603, -- Wrath of the Horde
    2556, -- Pest Control
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
    864, -- Explore Shadowmoon Valley
    898, -- On Wings of Nether
    1638, -- Skyshattered
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    2556, -- Pest Control
    46, -- Universal Explorer
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
    903, -- Shattrath Divided
    1205, -- Hero of Shattrath
    6587, -- Outland Safari
    6614, -- Outland Tamer
    2556, -- Pest Control
    46, -- Universal Explorer
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
    902, -- Chief Exalted Officer
    1194, -- Into the Nether
    843, -- Explore Netherstorm
    9924, -- Field Photographer
    6587, -- Outland Safari
    6614, -- Outland Tamer
    46, -- Universal Explorer
})

zoneData:Zone(110, { -- Silvermoon City (city)
    1006, -- City Defender
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    613, -- Killed in Quel'Thalas
    614, -- For the Alliance!
    604, -- Wrath of the Alliance
    2556, -- Pest Control
})

zoneData:Zone(111, { -- Shattrath City (city)
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1165, -- My Storage is "Gigantique"
    9924, -- Field Photographer
    6604, -- Taming Outland
})

-- [[ TBC Raids ]] --

zoneData:Zone({350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366}, { -- Karazhan
    sharedTBC.Karazhan,
    11746, -- Outlandish Style
    8293, -- Raiding with Leashes II: Attunement Edition
    9924, -- Field Photographer
})

zoneData:Zone(330, { -- Gruul's Lair
    sharedTBC.GrullsLair,
    11746, -- Outlandish Style
})

zoneData:Zone(331, { -- Magtheridon's Lair
    sharedTBC.MagtheridonsLair,
    11746, -- Outlandish Style
})

zoneData:Zone(332, { -- Serpentshrine Cavern
    sharedTBC.SerpentshineCavern,
    11747, -- Merely a Set
    8293, -- Raiding with Leashes II: Attunement Edition
})

zoneData:Zone(334, { -- The Eye (Tempest Keep)
    sharedTBC.TheEye,
    8293, -- Raiding with Leashes II: Attunement Edition
})

zoneData:Zone(329, { -- The Battle for Mount Hyjal
    sharedTBC.BattleForMountHyjal,
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})

zoneData:Zone({339, 340, 341, 342, 343, 344, 345, 346}, { -- Black Temple
    sharedTBC.BlackTemple,
    11748, -- Black is the New Black
    9016, -- Breaker of the Black Harvest
    11869, -- I'll Hold These For You Until You Get Out
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})

zoneData:Zone({335, 336}, { -- Sunwell Plateau
    sharedTBC.SunwellPlateau,
    11749, -- Suns Out, Thori'dals Out
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})
