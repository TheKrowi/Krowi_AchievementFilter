local _, addon = ...
addon.Data.ZoneData.Shared.Vanilla = {}
local sharedVanilla = addon.Data.ZoneData.Shared.Vanilla

local zoneData = KrowiAF.NewZoneData("Vanilla")
sharedVanilla.ZoneData = zoneData

sharedVanilla.MoltenCore = {
    686, -- Molten Core
    429, -- Sulfuras, Hand of Ragnaros
    428, -- Thunderfury, Blessed Blade of the Windseeker
    955, -- Hydraxian Waterlords
    2496, -- The Fifth Element
}

sharedVanilla.BlackwingLair = {
    685, -- Blackwing Lair
}

sharedVanilla.AhnQiraj = {
    687, -- Temple of Ahn'Qiraj
    424, -- Why? Because It's Red
    956, -- Brood of Nozdormu
}

-- [[ Zones identical in Retail and Classic ]] --

zoneData:Zone({74, 75}, { -- Caverns of Time (zone)
    763, -- The Burning Crusader
    764, -- The Burning Crusader
})

-- [[ Vanilla Battlegrounds — identical in Retail and Classic ]] --

zoneData:Zone({92, 1339}, { -- Warsong Gulch (battleground)
    166, -- Warsong Gulch Victory
    167, -- Warsong Gulch Veteran
    199, -- Capture the Flag
    200, -- Persistent Defender
    872, -- Frenzied Defender
    168, -- Warsong Gulch Perfection
    201, -- Warsong Expedience
    204, -- Ironman
    203, -- Not In My House
    1251, -- Not In My House
    202, -- Quick Cap
    1502, -- Quick Cap
    206, -- Supreme Defender
    1252, -- Supreme Defender
    207, -- Save the Day
    1172, -- Master of Warsong Gulch
    1259, -- Not So Fast
    713, -- Silverwing Sentinel
    712, -- Warsong Outrider
})

zoneData:Zone({93, 1366, 1383}, { -- Arathi Basin (battleground)
    154, -- Arathi Basin Victory
    155, -- Arathi Basin Veteran
    165, -- Arathi Basin Perfection
    158, -- Me and the Cappin' Makin' it Happen
    73, -- Disgracin' The Basin
    1153, -- Overly Defensive
    157, -- To The Rescue!
    161, -- Resilient Victory
    156, -- Territorial Dominance
    159, -- Let's Get This Done
    162, -- We Had It All Along *cough*
    583, -- Arathi Basin All-Star
    584, -- Arathi Basin Assassin
    1169, -- Master of Arathi Basin
    711, -- Knight of Arathor
    710, -- The Defiler
})

-- [[ Vanilla Dungeons — identical in Retail and Classic ]] --

zoneData:Zone(213, { -- Ragefire Chasm (dungeon)
    629, -- Ragefire Chasm
})

zoneData:Zone(219, { -- Zul'Farrak (dungeon)
    639, -- Zul'Farrak
})

zoneData:Zone(220, { -- The Temple of Atal'Hakkar (dungeon)
    641, -- Sunken Temple
})

zoneData:Zone({221, 222, 223}, { -- Blackfathom Deeps (dungeon)
    632, -- Blackfathom Deeps
})

zoneData:Zone(225, { -- The Stockade (dungeon)
    633, -- Stormwind Stockade
})

zoneData:Zone({230, 231}, { -- Uldaman (dungeon)
    638, -- Uldaman
})

zoneData:Zone({235, 236, 237, 238, 239, 240}, { -- Dire Maul (dungeon)
    644, -- King of Dire Maul
    5788, -- Agent of the Shen'dralar
})

zoneData:Zone(247, { -- Ruins of Ahn'Qiraj (raid)
    689, -- Ruins of Ahn'Qiraj
    953, -- Guardian of Cenarius
})

zoneData:Zone({250, 251, 252, 253, 254, 255}, { -- Blackrock Spire (dungeon)
    643, -- Lower Blackrock Spire
})

zoneData:Zone({280, 281}, { -- Maraudon (dungeon)
    640, -- Maraudon
})

zoneData:Zone(300, { -- Razorfen Downs (dungeon)
    636, -- Razorfen Downs
})

zoneData:Zone(301, { -- Razorfen Kraul (dungeon)
    635, -- Razorfen Kraul
})
