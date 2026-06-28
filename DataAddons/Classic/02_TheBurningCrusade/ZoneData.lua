local _, addon = ...
local sharedTBC = addon.Data.ZoneData.Shared.TheBurningCrusade

local zoneData = sharedTBC.ZoneData

zoneData:Zone({94, 467}, { -- Eversong Woods (zone)
    42, -- Eastern Kingdoms Explorer
    859, -- Explore Eversong Woods
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone({95, 96}, { -- Ghostlands (zone)
    42, -- Eastern Kingdoms Explorer
    4908, -- Ghostlands Quests
    858, -- Explore Ghostlands
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone({97, 98, 99, 468}, { -- Azuremyst Isle (zone)
    43, -- Kalimdor Explorer
    860, -- Explore Azuremyst Isle
    948, -- Ambassador of the Alliance
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(106, { -- Bloodmyst Isle (zone)
    1678, -- Explore Kalimdor
    43, -- Kalimdor Explorer
    4926, -- Bloodmyst Isle Quests
    861, -- Explore Bloodmyst Isle
    948, -- Ambassador of the Alliance
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(101, { -- Outland (continent)
    942, -- The Diplomat
    943, -- The Diplomat
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    894, -- Flying High Over Skettis
    902, -- Chief Exalted Officer
    46, -- Universal Explorer
})

zoneData:Zone(100, { -- Hellfire Peninsula (zone)
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    1189, -- To Hellfire and Back
    1271, -- To Hellfire and Back
    862, -- Explore Hellfire Peninsula
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(102, { -- Zangarmarsh (zone)
    942, -- The Diplomat
    943, -- The Diplomat
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
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(103, { -- The Exodar (city)
    388, -- Ambassador
    618, -- Putting Out the Light
    619, -- For the Horde!
    603, -- Wrath of the Horde
    2556, -- Pest Control
})

zoneData:Zone(104, { -- Shadowmoon Valley (zone)
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    1195, -- Shadow of the Betrayer
    864, -- Explore Shadowmoon Valley
    898, -- On Wings of Nether
    1638, -- Skyshattered
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(105, { -- Blade's Edge Mountains (zone)
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    894, -- Flying High Over Skettis
    1193, -- On the Blade's Edge
    1276, -- Blade's Edge Bomberman
    865, -- Explore Blade's Edge Mountains
    896, -- A Quest a Day Keeps the Ogres at Bay
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(107, { -- Nagrand (zone)
    942, -- The Diplomat
    943, -- The Diplomat
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
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(108, { -- Terokkar Forest (zone)
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
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(109, { -- Netherstorm (zone)
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    902, -- Chief Exalted Officer
    1194, -- Into the Nether
    843, -- Explore Netherstorm
    46, -- Universal Explorer
})

zoneData:Zone(110, { -- Silvermoon City (city)
    1006, -- City Defender
    613, -- Killed in Quel'Thalas
    614, -- For the Alliance!
    604, -- Wrath of the Alliance
    2556, -- Pest Control
})

zoneData:Zone(111, { -- Shattrath City (city)
    1165, -- My Storage is "Gigantique"
})

-- [[ TBC Raids ]] --

zoneData:Zone({350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366}, sharedTBC.Karazhan) -- Karazhan

zoneData:Zone(330, sharedTBC.GrullsLair) -- Gruul's Lair

zoneData:Zone(331, sharedTBC.MagtheridonsLair) -- Magtheridon's Lair

zoneData:Zone(332, sharedTBC.SerpentshineCavern) -- Serpentshrine Cavern

zoneData:Zone(334, sharedTBC.TheEye) -- The Eye (Tempest Keep)

zoneData:Zone(329, sharedTBC.BattleForMountHyjal) -- The Battle for Mount Hyjal

zoneData:Zone({339, 340, 341, 342, 343, 344, 345, 346}, sharedTBC.BlackTemple) -- Black Temple

zoneData:Zone({335, 336}, sharedTBC.SunwellPlateau) -- Sunwell Plateau
