local _, addon = ...
addon.Data.ZoneData.Shared.MistsOfPandaria = {}
local sharedMoP = addon.Data.ZoneData.Shared.MistsOfPandaria

local zoneData = KrowiAF.NewZoneData("MistsOfPandaria")
sharedMoP.ZoneData = zoneData

zoneData:Zone(424, { -- Pandaria (continent)
    7520, -- The Loremaster
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    6541, -- Loremaster of Pandaria
    7285, -- Every Day I'm Pand-a-ren
    6716, -- Between a Saurok and a Hard Place
    6754, -- The Dark Heart of the Mogu
    6846, -- Fish Tales
    6850, -- Hozen in the Mist
    6847, -- The Song of the Yaungol
    6855, -- The Seven Burdens of Shaohao
    6856, -- Ballad of Liu Lang
    6858, -- What Is Worth Fighting For
    7230, -- Legend of the Brewfathers
    7994, -- Treasure of Pandaria
    7995, -- Fortune of Pandaria
    7996, -- Bounty of Pandaria
    7997, -- Riches of Pandaria
    7281, -- Lost and Found
    7282, -- Finders Keepers
    7283, -- One Man's Trash...
    7284, -- Is Another Man's Treasure
    7437, -- A Worthy Opponent
    7438, -- Could We Find More Like That?
    7439, -- Glorious!
    8078, -- Zul'Again
    6350, -- To All the Squirrels I Once Caressed?
    6974, -- Pandaria Explorer
    7479, -- The Shado-Master
    6543, -- The August Celestials
    6547, -- The Anglers
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    7331, -- The Three Brew Fathers
    7332, -- The Broken Hearted
    7333, -- The Four Celestials
    7338, -- Collector: Pandaren Tea Sets
    7358, -- Collector: Pandaren Tea Sets
    7339, -- Collector: Pandaren Game Boards
    7359, -- Collector: Pandaren Game Boards
    7340, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    7360, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    7341, -- Collector: Walking Canes of Brewfather Ren Yun
    7361, -- Collector: Walking Canes of Brewfather Ren Yun
    7342, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    7362, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    7343, -- Collector: Carved Bronze Mirrors
    7363, -- Collector: Carved Bronze Mirrors
    7344, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    7364, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    7345, -- Collector: Apothecary Tins
    7365, -- Collector: Apothecary Tins
    7346, -- Collector: Pearls of Yu'lon
    7366, -- Collector: Pearls of Yu'lon
    7347, -- Collector: Standards of Niuzao
    7367, -- Collector: Standards of Niuzao
    7334, -- Instruments of Cruelty
    7335, -- Symbols of Strength
    7337, -- Documents of a Dark History
    7336, -- Stone Servants
    7348, -- Collector: Manacles of Rebellion
    7368, -- Collector: Manacles of Rebellion
    7349, -- Collector: Cracked Mogu Runestones
    7369, -- Collector: Cracked Mogu Runestones
    7350, -- Collector: Terracotta Arms
    7370, -- Collector: Terracotta Arms
    7351, -- Collector: Petrified Bone Whips
    7371, -- Collector: Petrified Bone Whips
    7352, -- Collector: Thunder King Insignias
    7372, -- Collector: Thunder King Insignias
    7373, -- Collector: Edicts of the Thunder King
    7353, -- Collector: Edicts of the Thunder King
    7354, -- Collector: Iron Amulets
    7374, -- Collector: Iron Amulets
    7355, -- Collector: Warlord's Branding Irons
    7375, -- Collector: Warlord's Branding Irons
    7356, -- Collector: Mogu Coins
    7376, -- Collector: Mogu Coins
    7357, -- Collector: Worn Monument Ledgers
    7377, -- Collector: Worn Monument Ledgers
    8220, -- Collector: Banners of the Mantid Empire
    8221, -- Collector: Banners of the Mantid Empire
    8222, -- Collector: Ancient Sap Feeders
    8223, -- Collector: Ancient Sap Feeders
    8224, -- Collector: Praying Mantids
    8225, -- Collector: Praying Mantids
    8226, -- Collector: Inert Sound Beacons
    8227, -- Collector: Inert Sound Beacons
    8228, -- Collector: Remains of Paragons
    8229, -- Collector: Remains of Paragons
    8230, -- Collector: Mantid Lamps
    8231, -- Collector: Mantid Lamps
    8232, -- Collector: Pollen Collectors
    8233, -- Collector: Pollen Collectors
    8234, -- Collector: Kypari Sap Containers
    8235, -- Collector: Kypari Sap Containers
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
})

zoneData:Zone(417, { -- Temple of Kotmogu (battleground)
    6740, -- Temple of Kotmogu Victory
    6882, -- Temple of Kotmogu Veteran
    6947, -- Four Square
    6950, -- Powerball
    6970, -- Blackout
    6973, -- Can't Stop Won't Stop
    6971, -- I've Got the Power
    6972, -- What is Best in Life?
    6980, -- Temple of Kotmogu All-Star
    6981, -- Master of Temple of Kotmogu
})

zoneData:Zone(423, { -- Silvershard Mines (battleground)
    6739, -- Silvershard Mines Victory
    6883, -- Silvershard Mines Veteran
    7039, -- The Long Riders
    7049, -- Mine Cart Courier
    7057, -- End of the Line
    7062, -- Mine Mine Mine!
    7099, -- Five for Five
    7100, -- My Diamonds and Your Rust
    7102, -- Escort Service
    7103, -- Greed is Good
    7106, -- Master of Silvershard Mines
})

zoneData:Zone({433, 434}, { -- The Veiled Stair (zone)
    6716, -- Between a Saurok and a Hard Place
    7994, -- Treasure of Pandaria
    7995, -- Fortune of Pandaria
    7996, -- Bounty of Pandaria
    7997, -- Riches of Pandaria
    7281, -- Lost and Found
    7282, -- Finders Keepers
    7283, -- One Man's Trash...
    7284, -- Is Another Man's Treasure
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
    7334, -- Instruments of Cruelty
    7335, -- Symbols of Strength
    7337, -- Documents of a Dark History
    7336, -- Stone Servants
    7348, -- Collector: Manacles of Rebellion
    7368, -- Collector: Manacles of Rebellion
    7349, -- Collector: Cracked Mogu Runestones
    7369, -- Collector: Cracked Mogu Runestones
    7350, -- Collector: Terracotta Arms
    7370, -- Collector: Terracotta Arms
    7351, -- Collector: Petrified Bone Whips
    7371, -- Collector: Petrified Bone Whips
    7352, -- Collector: Thunder King Insignias
    7372, -- Collector: Thunder King Insignias
    7373, -- Collector: Edicts of the Thunder King
    7353, -- Collector: Edicts of the Thunder King
    7354, -- Collector: Iron Amulets
    7374, -- Collector: Iron Amulets
    7355, -- Collector: Warlord's Branding Irons
    7375, -- Collector: Warlord's Branding Irons
    7356, -- Collector: Mogu Coins
    7376, -- Collector: Mogu Coins
    7357, -- Collector: Worn Monument Ledgers
    7377, -- Collector: Worn Monument Ledgers
})

zoneData:Zone(522, { -- The Secrets of Ragefire (scenario)
    8294, -- The Secrets of Ragefire
    8327, -- Heroic: The Secrets of Ragefire
    8295, -- The Few, the Proud, the Gob Squad
})
