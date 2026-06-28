local _, addon = ...
addon.Data.ZoneData.Shared.TheBurningCrusade = {}
local sharedTBC = addon.Data.ZoneData.Shared.TheBurningCrusade

local zoneData = KrowiAF.NewZoneData("TheBurningCrusade")
sharedTBC.ZoneData = zoneData

sharedTBC.Karazhan = {
    690, -- Karazhan
    882, -- Fiery Warhorse's Reins
    2456, -- Vampire Hunter
    960, -- The Violet Eye
}

sharedTBC.GrullsLair = {
    692, -- Gruul's Lair
}

sharedTBC.MagtheridonsLair = {
    693, -- Magtheridon's Lair
}

sharedTBC.SerpentshineCavern = {
    694, -- Serpentshrine Cavern
    144, -- The Lurker Above
}

sharedTBC.TheEye = {
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    696, -- Tempest Keep
    885, -- Ashes of Al'ar
}

sharedTBC.BattleForMountHyjal = {
    695, -- The Battle for Mount Hyjal
    959, -- The Scale of the Sands
}

sharedTBC.BlackTemple = {
    697, -- The Black Temple
    426, -- Warglaives of Azzinoth
    958, -- Sworn to the Deathsworn
}

sharedTBC.SunwellPlateau = {
    698, -- Sunwell Plateau
    725, -- Thori'dal, the Stars' Fury
}

-- [[ Zones identical in Retail and Classic ]] --

zoneData:Zone(112, { -- Eye of the Storm (battleground)
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
})

zoneData:Zone(122, { -- Isle of Quel'Danas (zone)
    42, -- Eastern Kingdoms Explorer
    897, -- You're So Offensive
    868, -- Explore Isle of Quel'Danas
    46, -- Universal Explorer
})

-- [[ TBC Dungeons — identical in Retail and Classic ]] --

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

-- [[ TBC Raids — identical in Retail and Classic ]] --

zoneData:Zone(333, { -- Zul'Aman
    691, -- Zul'Aman
    430, -- Amani War Bear
    5858, -- Bear-ly Made It
    5750, -- Zul'Aman
    5761, -- Heroic: Zul'Aman
    5760, -- Heroic: Zul'Aman
    5769, -- Zul'Aman
})