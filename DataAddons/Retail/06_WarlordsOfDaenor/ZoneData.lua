local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("WarlordsOfDaenor")

zoneData:Zone({601, 602}, { -- Skyreach (dungeon)
    9033, -- Ready for Raiding IV
    9035, -- I Saw Solis
    9034, -- Magnify... Enhance
    9036, -- Monomania
    8843, -- Skyreach
    8844, -- Heroic: Skyreach
    10081, -- Mythic: Skyreach
    61272, -- Keystone Hero: Skyreach
    61594, -- Keystone Victor: Skyreach
    8871, -- Skyreach Challenger
    8872, -- Skyreach: Bronze
    8873, -- Skyreach: Silver
    8874, -- Skyreach: Gold
    9623, -- Challenge Master: Skyreach
})

zoneData:Zone({616, 617, 618}, { -- Upper Blackrock Spire (dungeon)
    1307, -- Upper Blackrock Spire (Classic)
    2188, -- Leeeeeeeeeeeeeroy!
    9045, -- Magnets, How Do They Work?
    9058, -- Leeeeeeeeeeeeeroy...?
    9056, -- Bridge Over Troubled Fire
    9057, -- Dragonmaw? More Like Dragonfall!
    9042, -- Upper Blackrock Spire
    9055, -- Heroic: Upper Blackrock Spire
    10085, -- Mythic: Upper Blackrock Spire
    8891, -- Upper Blackrock Spire Challenger
    8892, -- Upper Blackrock Spire: Bronze
    8893, -- Upper Blackrock Spire: Silver
    8894, -- Upper Blackrock Spire: Gold
    9627, -- Challenge Master: Upper Blackrock Spire
})