local zoneData = KrowiAF.NewZoneData("VanillaClassic")

-- Classic keeps Upper Blackrock Spire inside the Blackrock Spire maps; Retail moved it to 616-618 (Retail/06_WarlordsOfDaenor), decision D15
zoneData:Zone({250, 251, 252, 253, 254, 255}, { -- Blackrock Spire (dungeon)
    1307, -- Upper Blackrock Spire (Classic)
    2188, -- Leeeeeeeeeeeeeroy!
})