local _, addon = ...
addon.Data.ZoneData.Shared.MistsOfPandaria = {}
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("MistsOfPandaria")

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
    shared.GenericBattleground,
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
    shared.GenericBattleground,
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

zoneData:Zone({520, 521}, { -- Dark Heart of Pandaria (scenario)
    8317, -- Dark Heart of Pandaria
    8318, -- Heroic: Dark Heart of Pandaria
    8319, -- Accelerated Archaeology
    19942, -- Dark Heart of Pandaria
    19943, -- Heroic: Dark Heart of Pandaria
})

zoneData:Zone({371, 372, 373, 374, 375}, { -- The Jade Forest (zone)
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
    6855, -- The Seven Burdens of Shaohao
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
    6543, -- The August Celestials
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6300, -- Upjade Complete
    6534, -- Upjade Complete
    7289, -- Shadow Hopper
    7290, -- How To Strain Your Dragon
    7291, -- In a Trail of Smoke
    6351, -- Explore Jade Forest
    7381, -- Restore Balance
    6550, -- Order of the Cloud Serpent
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
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
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
    19882, -- Campaign: The Jade Forest
    19883, -- Campaign: The Jade Forest
    19912, -- Order of the Cloud Serpent
    20026, -- Explore Jade Forest
    19993, -- Elusive Foes: The Jade Forest
    19977, -- Hidden Treasures: The Jade Forest
    19962, -- Tour The Jade Forest
    20008, -- Looking For Group: The Jade Forest
    19872, -- The Jade Forest
})

zoneData:Zone({376, 377}, { -- Valley of the Four Winds (zone)
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
    6846, -- Fish Tales
    6850, -- Hozen in the Mist
    6856, -- Ballad of Liu Lang
    6858, -- What Is Worth Fighting For
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
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6517, -- Extinction Event
    6301, -- Rally the Valley
    7292, -- Green Acres
    7293, -- Till the Break of Dawn
    7294, -- A Taste of Things to Come
    7295, -- Listen to the Drunk Fish
    7296, -- Ain't Lost No More
    7502, -- Savior of Stoneplow
    6969, -- Explore Valley of the Four Winds
    9924, -- Field Photographer
    6544, -- The Tillers
    6551, -- Friend on the Farm
    6552, -- Friends on the Farm
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
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
    7300, -- Master of the Grill
    7301, -- Master of the Wok
    7302, -- Master of the Pot
    7303, -- Master of the Steamer
    7304, -- Master of the Oven
    7305, -- Master of the Brew
    7306, -- Master of Pandaren Cooking
    7325, -- Now I Am the Master
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
    19884, -- Campaign: Valley of the Four Winds
    20027, -- Explore Valley of the Four Winds
    19994, -- Elusive Foes: Valley of the Four Winds
    19978, -- Hidden Treasures: Valley of the Four Winds
    19963, -- Tour Valley of the Four Winds
    20017, -- Salyis's Warband
    20009, -- Looking For Group: Valley of the Four Winds
    19873, -- Valley of the Four Winds
})

zoneData:Zone({379, 380, 381, 382, 383, 384, 385, 386, 387}, { -- Kun-Lai Summit (zone)
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
    6754, -- The Dark Heart of the Mogu
    6846, -- Fish Tales
    6850, -- Hozen in the Mist
    6847, -- The Song of the Yaungol
    6855, -- The Seven Burdens of Shaohao
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
    6974, -- Pandaria Explorer
    7479, -- The Shado-Master
    6543, -- The August Celestials
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6480, -- Settle Down, Bro
    7386, -- Grand Expedition Yak
    6537, -- Slum It in the Summit
    6538, -- Slum It in the Summit
    7286, -- Finish Them!
    6976, -- Explore Kun-Lai Summit
    9924, -- Field Photographer
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
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
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
    19887, -- Campaign: Kun-Lai Summit
    19888, -- Campaign: Kun-Lai Summit
    20029, -- Explore Kun-Lai Summit
    19996, -- Elusive Foes: Kun-Lai Summit
    19980, -- Hidden Treasures: Kun-Lai Summit
    19965, -- Tour Kun-Lai Summit
    20018, -- Sha of Anger
    20011, -- Looking For Group: Kun-Lai Summit
    19875, -- Kun-Lai Summit
})

zoneData:Zone({388, 389}, { -- Townlong Steppes (zone)
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
    6847, -- The Song of the Yaungol
    6855, -- The Seven Burdens of Shaohao
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
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6539, -- One Steppe Forward, Two Steppes Back
    7288, -- Yak Attack
    7297, -- Proven Strength
    7298, -- Getting Around with the Shado-Pan
    7299, -- Loner and a Rebel
    7307, -- Silent Assassin
    7308, -- Know Your Role
    7309, -- Fire in the Yaung-hole!
    7310, -- Defender of Gods
    6977, -- Explore Townlong Steppes
    6366, -- Shado-Pan
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
    19889, -- Campaign: Townlong Steppes
    19914, -- Shado-Pan
    20030, -- Explore Townlong Steppes
    19997, -- Elusive Foes: Townlong Steppes
    19981, -- Hidden Treasures: Townlong Steppes
    19966, -- Tour Townlong Steppes
    20012, -- Looking For Group: Townlong Steppes
    19877, -- Townlong Steppes
})

zoneData:Zone({390, 395, 396}, { -- Vale of Eternal Blossoms (zone)
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
    7285, -- Every Day I'm Pand-a-ren
    6754, -- The Dark Heart of the Mogu
    6855, -- The Seven Burdens of Shaohao
    6858, -- What Is Worth Fighting For
    7437, -- A Worthy Opponent
    7438, -- Could We Find More Like That?
    7439, -- Glorious!
    6350, -- To All the Squirrels I Once Caressed?
    6974, -- Pandaria Explorer
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    7317, -- One Many Army
    7318, -- A Taste of History
    7319, -- Ready for Raiding III
    7320, -- Dog Pile
    7321, -- Spreading the Warmth
    7322, -- Roll Club
    7323, -- Collateral Damage
    7324, -- One Step at a Time
    7315, -- Eternally in the Vale
    6979, -- Explore Vale of Eternal Blossoms
    9924, -- Field Photographer
    6546, -- The Golden Lotus
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
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
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
    19913, -- The August Celestials
    19916, -- Golden Lotus
    20069, -- Elusive Foes: Vale of Eternal Blossoms
    20014, -- Looking For Group: Vale of Eternal Blossoms
    19876, -- Vale of Eternal Blossoms
})

zoneData:Zone({416, 483}, { -- Theramore's Fall (scenario)
    7523, -- Theramore's Fall
    7524, -- Theramore's Fall
    7526, -- Kite Fight
    7529, -- Kite Fight
    7527, -- No Tank You
    7530, -- No Tank You
    7467, -- Theramore's Fall
    7468, -- Theramore's Fall
    19938, -- Theramore's Fall
    19939, -- Theramore's Fall
})

zoneData:Zone({418, 419, 420, 421}, { -- Krasarang Wilds (zone)
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
    6855, -- The Seven Burdens of Shaohao
    6856, -- Ballad of Liu Lang
    7230, -- Legend of the Brewfathers
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
    6543, -- The August Celestials
    6547, -- The Anglers
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6535, -- Mighty Roamin' Krasaranger
    6536, -- Mighty Roamin' Krasaranger
    7287, -- Fish Are Friends, Not Food
    7928, -- Operation: Shieldwall / Dominance Offensive Campaign
    7929, -- Dominance Offensive Campaign
    6975, -- Explore Krasarang Wilds
    7518, -- Riverblade Stalker
    7932, -- It's A Trap!
    9924, -- Field Photographer
    8205, -- Operation: Shieldwall / Dominance Offensive
    8206, -- Dominance Offensive
    6837, -- Zen Master Archaeologist
    7612, -- The Seat of Knowledge
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
    6616, -- Pandaria Tamer
    6589, -- Pandaria Safari
    6606, -- Taming Pandaria
    46, -- Universal Explorer
    19885, -- Campaign: Krasarang Wilds
    19886, -- Campaign: Krasarang Wilds
    20028, -- Explore Krasarang Wilds
    19995, -- Elusive Foes: Krasarang Wilds
    19979, -- Hidden Treasures: Krasarang Wilds
    19964, -- Tour Krasarang Wilds
    19874, -- Krasarang Wilds
    19891, -- Operation: Shieldwall / Dominance Offensive Campaign
    19917, -- Operation: Shieldwall / Dominance Offensive Campaign
    19918, -- Dominance Offensive
    19999, -- Elusive Foes: Krasarang Wilds
    19879, -- Krasarang Wilds
})

zoneData:Zone(422, { -- Dread Wastes (zone)
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
    7281, -- Lost and Found
    7282, -- Finders Keepers
    7283, -- One Man's Trash...
    7284, -- Is Another Man's Treasure
    7437, -- A Worthy Opponent
    7438, -- Could We Find More Like That?
    7439, -- Glorious!
    6350, -- To All the Squirrels I Once Caressed?
    6974, -- Pandaria Explorer
    6547, -- The Anglers
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    6540, -- Dread Haste Makes Dread Waste
    7312, -- Amber is the Color of My Energy
    7313, -- Stay Klaxxi
    7314, -- Test Drive
    7316, -- Over Their Heads
    6978, -- Explore Dread Wastes
    6857, -- Heart of the Mantid Swarm
    6545, -- Klaxxi
    8023, -- Wakener
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
    19890, -- Campaign: Dread Wastes
    19915, -- The Klaxxi
    20031, -- Explore Dread Wastes
    19998, -- Elusive Foes: Dread Wastes
    19967, -- Tour Dread Wastes
    19878, -- Dread Wastes
})

zoneData:Zone({429, 430}, { -- Temple of the Jade Serpent (dungeon)
    6475, -- Cleaning Up
    6460, -- Hydrophobia
    6671, -- Seeds of Doubt
    6757, -- Temple of the Jade Serpent
    6758, -- Heroic: Temple of the Jade Serpent
    6884, -- Temple of the Jade Serpent Challenger
    6885, -- Temple of the Jade Serpent: Bronze
    6886, -- Temple of the Jade Serpent: Silver
    6887, -- Temple of the Jade Serpent: Gold
    8430, -- Challenge Master: Temple of the Jade Serpent
    16661, -- Keystone Hero: Temple of the Jade Serpent
    19894, -- Temple of the Jade Serpent
    19895, -- Heroic: Temple of the Jade Serpent
})

zoneData:Zone({431, 432}, { -- Scarlet Halls (dungeon)
    6684, -- Humane Society
    6427, -- Mosh Pit
    7413, -- Scarlet Halls
    6760, -- Heroic: Scarlet Halls
    6895, -- Scarlet Halls Challenger
    6908, -- Scarlet Halls: Bronze
    6909, -- Scarlet Halls: Silver
    6910, -- Scarlet Halls: Gold
    8436, -- Challenge Master: Scarlet Halls
    19906, -- Scarlet Halls
    19907, -- Heroic: Scarlet Halls
})

zoneData:Zone({435, 436}, { -- Scarlet Monastery (dungeon)
    255, -- Bring Me The Head of... Oh Wait
    6946, -- Empowered Spiritualist
    6928, -- Burning Man
    6929, -- And Stay Dead!
    637, -- Scarlet Monastery
    6761, -- Heroic: Scarlet Monastery
    6896, -- Scarlet Monastery Challenger
    6911, -- Scarlet Monastery: Bronze
    6912, -- Scarlet Monastery: Silver
    6913, -- Scarlet Monastery: Gold
    8437, -- Challenge Master: Scarlet Monastery
    980, -- The Horseman's Reins
    19908, -- Scarlet Monastery
    19909, -- Heroic: Scarlet Monastery
})

zoneData:Zone({437, 438}, { -- Gate of the Setting Sun (dungeon)
    6479, -- Bomberman
    6476, -- Conscriptinator
    6945, -- Mantid Swarm
    10010, -- Gate of the Setting Sun
    6759, -- Heroic: Gate of the Setting Sun
    6894, -- Gate of the Setting Sun Challenger
    6905, -- Gate of the Setting Sun: Bronze
    6906, -- Gate of the Setting Sun: Silver
    6907, -- Gate of the Setting Sun: Gold
    8434, -- Challenge Master: Gate of the Setting Sun
    19902, -- Gate of the Setting Sun
    19903, -- Heroic: Gate of the Setting Sun
})

zoneData:Zone({439, 440, 441, 442}, { -- Stormstout Brewery (dungeon)
    6402, -- Ling-Ting's Herbal Journey
    6089, -- Keep Rollin' Rollin' Rollin'
    6400, -- How Did He Get Up There?
    6420, -- Hopocalypse Now!
    6457, -- Stormstout Brewery
    6456, -- Heroic: Stormstout Brewery
    6888, -- Stormstout Brewery Challenger
    6889, -- Stormstout Brewery: Bronze
    6890, -- Stormstout Brewery: Silver
    6891, -- Stormstout Brewery: Gold
    8431, -- Challenge Master: Stormstout Brewery
    19896, -- Stormstout Brewery
    19897, -- Heroic: Stormstout Brewery
})

zoneData:Zone({443, 444, 445, 446}, { -- Shado-Pan Monastery (dungeon)
    7479, -- The Shado-Master
    6477, -- Respect
    6472, -- The Obvious Solution
    6471, -- Hate Leads to Suffering
    6469, -- Shado-Pan Monastery
    6470, -- Heroic: Shado-Pan Monastery
    6893, -- Shado-Pan Monastery Challenger
    6902, -- Shado-Pan Monastery: Bronze
    6903, -- Shado-Pan Monastery: Silver
    6904, -- Shado-Pan Monastery: Gold
    8432, -- Challenge Master: Shado-Pan Monastery
    19898, -- Shado-Pan Monastery
    19899, -- Heroic: Shado-Pan Monastery
})

zoneData:Zone(447, { -- A Brewing Storm (scenario)
    7252, -- A Brewing Storm
    8310, -- Heroic: A Brewing Storm
    7257, -- Don't Shake the Keg
    7261, -- The Perfect Pour
    7258, -- Party of Six
    19893, -- A Brewing Storm
    19924, -- Heroic: A Brewing Storm
})

zoneData:Zone(448, { -- Greenstone Village (scenario)
    7265, -- Greenstone Village
    7267, -- Perfect Delivery
    7266, -- Save it for Later
    19923, -- Greenstone Village
})

zoneData:Zone(450, { -- Unga Ingoo (scenario)
    7249, -- Unga Ingoo
    7232, -- The Keg Runner
    7239, -- Monkey in the Middle
    7248, -- Monkey See, Monkey Kill
    7231, -- Spill No Evil
    19925, -- Unga Ingoo
})

zoneData:Zone(451, { -- Assault on Zan'vess (scenario)
    8016, -- Assault on Zan'vess
    8017, -- For the Swarm
    19930, -- Assault on Zan'vess
})

zoneData:Zone(452, { -- Brewmoon Festival (scenario)
    6923, -- Brewmoon Festival
    6931, -- Binan Village All-Star
    6930, -- Yaungolian Barbecue
    19926, -- Brewmoon Festival
})

zoneData:Zone({453, 454, 455}, { -- Mogu'shan Palace (dungeon)
    6713, -- Quarrelsome Quilen Quintet
    6478, -- Glintrok N' Roll
    6736, -- What Does This Button Do?
    6755, -- Mogu'shan Palace
    6756, -- Heroic: Mogu'shan Palace
    6892, -- Mogu'shan Palace Challenger
    6899, -- Mogu'shan Palace: Bronze
    6900, -- Mogu'shan Palace: Silver
    6901, -- Mogu'shan Palace: Gold
    8433, -- Challenge Master: Mogu'shan Palace
    19904, -- Mogu'shan Palace
    19905, -- Heroic: Mogu'shan Palace
})

zoneData:Zone(456, { -- Terrace of Endless Spring (raid)
    6689, -- Terrace of Endless Spring
    8248, -- Ahead of the Curve: Sha of Fear
    7487, -- Cutting Edge: Sha of Fear
    11757, -- Sha of Fabulous
    6717, -- Power Overwhelming
    6933, -- Who's Got Two Green Thumbs?
    6824, -- Face Clutchers
    6825, -- The Mind-Killer
    6731, -- Heroic: Protectors of the Endless
    6732, -- Heroic: Tsulong
    6733, -- Heroic: Lei Shi
    6734, -- Heroic: Sha of Fear
    19952, -- Raid Finder: Terrace of Endless Spring
    19953, -- Terrace of Endless Spring
    19954, -- Heroic: Terrace of Endless Spring
})

zoneData:Zone({457, 458, 459}, { -- Siege of Niuzao Temple (dungeon)
    6688, -- Where's My Air Support?
    6485, -- Return to Sender
    6822, -- Run with the Wind
    10011, -- Siege of Niuzao Temple
    6763, -- Heroic: Siege of Niuzao Temple
    6898, -- Siege of Niuzao Temple Challenger
    6917, -- Siege of Niuzao Temple: Bronze
    6918, -- Siege of Niuzao Temple: Silver
    6919, -- Siege of Niuzao Temple: Gold
    8439, -- Challenge Master: Siege of Niuzao Temple
    19900, -- Siege of Niuzao Temple
    19901, -- Heroic: Siege of Niuzao Temple
})

zoneData:Zone({471, 472, 473}, { -- Mogu'shan Vaults (raid)
    7933, -- And... It's Good!
    6687, -- Getting Hot In Here
    6455, -- Show Me Your Moves!
    6458, -- Guardians of Mogu'shan
    6844, -- The Vault of Mysteries
    6954, -- Ahead of the Curve: Will of the Emperor
    7485, -- Cutting Edge: Will of the Emperor
    6823, -- Must Love Dogs
    6674, -- Anything You Can Do, I Can Do Better...
    7056, -- Sorry, Were You Looking for This?
    6686, -- Straight Six
    6719, -- Heroic: Stone Guard
    6720, -- Heroic: Feng the Accursed
    6721, -- Heroic: Gara'jal the Spiritbinder
    6722, -- Heroic: Four Kings
    6723, -- Heroic: Elegon
    6724, -- Heroic: Will of the Emperor
    19946, -- Raid Finder: Mogu'shan Vaults
    19947, -- Mogu'shan Vaults
    19948, -- Heroic: Mogu'shan Vaults
})

zoneData:Zone({474, 475}, { -- Heart of Fear (raid)
    6718, -- The Dread Approach
    6845, -- Nightmare of Shek'zeer
    8246, -- Ahead of the Curve: Grand Empress Shek'zeer
    7486, -- Cutting Edge: Grand Empress Shek'zeer
    11757, -- Sha of Fabulous
    6937, -- Overzealous
    6936, -- Candle in the Wind
    6553, -- Like an Arrow to the Face
    6683, -- Less Than Three
    6518, -- I Heard You Like Amber...
    6922, -- Timing is Everything
    6725, -- Heroic: Imperial Vizier Zor'lok
    6726, -- Heroic: Blade Lord Ta'yak
    6727, -- Heroic: Garalon
    6728, -- Heroic: Wind Lord Mel'jarak
    6729, -- Heroic: Amber-Shaper Un'sok
    6730, -- Heroic: Grand Empress Shek'zeer
    19949, -- Raid Finder: Heart of Fear
    19950, -- Heart of Fear
    19951, -- Heroic: Heart of Fear
})

zoneData:Zone({476, 477, 478, 479}, { -- Scholomance (dungeon)
    18368, -- Memory of Scholomance
    18558, -- Leaders of Scholomance
    6531, -- Attention to Detail
    6394, -- Rattle No More
    6396, -- Sanguinarian
    6715, -- Polyformic Acid Science
    6821, -- School's Out Forever
    645, -- Scholomance
    6762, -- Heroic: Scholomance
    6897, -- Scholomance Challenger
    6914, -- Scholomance: Bronze
    6915, -- Scholomance: Silver
    6916, -- Scholomance: Gold
    8438, -- Challenge Master: Scholomance
    19910, -- Scholomance
    19911, -- Heroic: Scholomance
    912, -- Elders of Eastern Kingdoms
})

zoneData:Zone(480, { -- Arena of Annihilation (scenario)
    7271, -- Arena of Annihilation
    7273, -- Beat the Heat
    7272, -- In the Eye of the Tiger
    9572, -- Proving Yourself: Bronze Damage
    9573, -- Proving Yourself: Silver Damage
    9574, -- Proving Yourself: Gold Damage
    9575, -- Proving Yourself: Endless Damage (Wave 10)
    9576, -- Proving Yourself: Endless Damage (Wave 20)
    9577, -- Proving Yourself: Endless Damage (Wave 30)
    9578, -- Proving Yourself: Bronze Tank
    9579, -- Proving Yourself: Silver Tank
    9580, -- Proving Yourself: Gold Tank
    9581, -- Proving Yourself: Endless Tank (Wave 10)
    9582, -- Proving Yourself: Endless Tank (Wave 20)
    9583, -- Proving Yourself: Endless Tank (Wave 30)
    9584, -- Proving Yourself: Bronze Healer
    9585, -- Proving Yourself: Silver Healer
    9586, -- Proving Yourself: Gold Healer
    9587, -- Proving Yourself: Endless Healer (Wave 10)
    9588, -- Proving Yourself: Endless Healer (Wave 20)
    9589, -- Proving Yourself: Endless Healer (Wave 30)
    9590, -- You're Doing it Wrong
    9597, -- You're Really Doing It Wrong
    8486, -- Proving Yourself: Bronze Damage (Level 90)
    8491, -- Proving Yourself: Silver Damage (Level 90)
    8496, -- Proving Yourself: Gold Damage (Level 90)
    8501, -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
    8504, -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
    8507, -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
    8487, -- Proving Yourself: Bronze Tank (Level 90)
    8492, -- Proving Yourself: Silver Tank (Level 90)
    8497, -- Proving Yourself: Gold Tank (Level 90)
    8502, -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
    8505, -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
    8508, -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
    8488, -- Proving Yourself: Bronze Healer (Level 90)
    8493, -- Proving Yourself: Silver Healer (Level 90)
    8498, -- Proving Yourself: Gold Healer (Level 90)
    8503, -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
    8506, -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
    8509, -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
    8697, -- You're Doing it Wrong (Level 90)
    8812, -- You're Really Doing It Wrong (Level 90)
    19927, -- Arena of Annihilation
})

zoneData:Zone({481, 482}, { -- Crypt of Forgotten Kings (scenario)
    7522, -- Crypt of Forgotten Kings
    8311, -- Heroic: Crypt of Forgotten Kings
    7276, -- Fancy Footwork
    7275, -- It's a Trap!
    8368, -- Fight Anger with Anger
    19928, -- Crypt of Forgotten Kings
    19929, -- Heroic: Crypt of Forgotten Kings
})

zoneData:Zone(486, { -- Lion's Landing (scenario)
    8010, -- Lion's Landing / Domination Point
    8011, -- Number Five Is Alive
    8012, -- Waste Not, Want Not
    20500, -- Lion's Landing
})

zoneData:Zone(487, { -- A Little Patience (scenario)
    7988, -- A Little Patience
    7989, -- Bubbletrapped!
    7990, -- Cannonballer
    7992, -- I Used To Love Them
    7993, -- We've Been Dancin'
    7991, -- Which Came First?
    19931, -- A Little Patience
})

zoneData:Zone({488, 489}, { -- Dagger in the Dark (scenario)
    8009, -- Dagger in the Dark
    7987, -- No Egg Left Behind
    7984, -- Watery Grave
    7986, -- You Mean That Wasn't a Void Zone?
    19933, -- Dagger in the Dark
})

zoneData:Zone(498, { -- Domination Point (scenario)
    8013, -- Domination Point
    8014, -- Number Five Is Alive
    8015, -- Waste Not, Want Not
    19932, -- Domination Point / Lion's Landing
})

zoneData:Zone({504, 505, 506}, { -- Isle of Thunder (zone)
    7285, -- Every Day I'm Pand-a-ren
    6548, -- The Lorewalkers
    6827, -- Pandaren Ambassador
    6828, -- Pandaren Ambassador
    8028, -- Praise the Sun!
    8099, -- Isle of Thunder
    8100, -- Pay to Slay
    8101, -- It Was Worth Every Ritual Stone
    8104, -- Thunder Plunder
    8105, -- The Crumble Bundle
    8107, -- Ready for RAAAAIIIIDDD?!?ing
    8108, -- When in Ihgaluk, Do as the Skumblade Do
    8109, -- The Mogu Below-gu
    8110, -- These Mogu Have Gotta Go-gu
    8111, -- This Isn't Even My Final Form
    8112, -- Blue Response
    8114, -- Platform Hero
    8115, -- Speed Metal
    8116, -- You Made Me Bleed My Own Blood
    8117, -- For the Ward!
    8118, -- Boop
    8119, -- Our Powers Combined
    8120, -- Direhorn in a China Shop
    8212, -- Zandalari Library Card
    8121, -- Stormbreaker
    8106, -- In the Hall of the Thunder King
    8103, -- Champions of Lei Shen
    8049, -- The Zandalari Prophecy
    8050, -- Rumbles of Thunder
    8051, -- Gods and Monsters
    8208, -- Kirin Tor Offensive / Sunreaver Onslaught
    8209, -- Sunreaver Onslaught
    8210, -- Shado-Pan Assault
    19892, -- Campaign: Isle of Thunder
    19919, -- Kirin Tor Offensive / Sunreaver Onslaught
    19920, -- Sunreaver Onslaught
    19921, -- Shado-Pan Assault
    20000, -- Elusive Foes: Isle of Thunder
    20019, -- Nalak, the Storm Lord
    20015, -- Looking For Group: Isle of Thunder
    19880, -- Isle of Thunder
})

zoneData:Zone(507, { -- Isle of Giants (zone)
    8123, -- Millions of Years of Evolution vs. My Fist
    8092, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    20020, -- Oondasta
})

zoneData:Zone({508, 509, 510, 511, 512, 513, 514, 515}, { -- Throne of Thunder (raid)
    8069, -- Last Stand of the Zandalari
    8070, -- Forgotten Depths
    8071, -- Halls of Flesh-Shaping
    8072, -- Pinnacle of Storms
    8089, -- I Thought He Was Supposed to Be Hard?
    8249, -- Ahead of the Curve: Lei Shen
    8238, -- Cutting Edge: Lei Shen
    8260, -- Cutting Edge: Ra-den
    11758, -- Thunderwear
    8094, -- Lightning Overload
    8038, -- Cretaceous Collector
    8073, -- Cage Match
    8077, -- One-Up
    8082, -- Head Case
    8097, -- Soft Hands
    8098, -- You Said Crossing the Streams Was Bad
    8037, -- Genetically Unmodified Organism
    8081, -- Ritualist Who?
    8087, -- Can't Touch This
    8086, -- From Dusk 'til Dawn
    8090, -- A Complete Circuit
    8056, -- Heroic: Jin'rokh the Breaker
    8057, -- Heroic: Horridon
    8058, -- Heroic: Council of Elders
    8059, -- Heroic: Tortos
    8060, -- Heroic: Megaera
    8061, -- Heroic: Ji-Kun
    8062, -- Heroic: Durumu the Forgotten
    8063, -- Heroic: Primordius
    8064, -- Heroic: Dark Animus
    8065, -- Heroic: Iron Qon
    8066, -- Heroic: Twin Empyreans
    8067, -- Heroic: Lei Shen
    8068, -- Heroic: Ra-den
    19955, -- Raid Finder: Throne of Thunder
    19956, -- Throne of Thunder
    19957, -- Heroic: Throne of Thunder
})

zoneData:Zone({519, 1576}, { -- Deepwind Gorge (battleground)
    shared.GenericBattleground,
    8331, -- Deepwind Gorge Victory
    8332, -- Deepwind Gorge Veteran
    8333, -- Deepwind Gorge Perfection
    14187, -- Cruisin' for a Brewsin'
    14186, -- Market Dominance
    14188, -- Well Gorged
    14175, -- Master of Deepwind Gorge
    8350, -- Mine! Mine! Mine!
    8351, -- Other People's Property
    8354, -- Puddle Jumper
    8355, -- Weighed Down
    8359, -- Capping Spree
    8358, -- Deepwind Gorge All-Star
    8360, -- Master of Deepwind Gorge
})

zoneData:Zone(523, { -- Blood in the Snow (scenario)
    19940, -- Blood in the Snow
    19941, -- Heroic: Blood in the Snow
})

zoneData:Zone(524, { -- Battle on the High Seas (scenario)
    8314, -- Battle on the High Seas
    8315, -- Battle on the High Seas
    8364, -- Heroic: Battle on the High Seas
    8366, -- Heroic: Battle on the High Seas
    8347, -- Keep those Bombs Away! (From Me)
    19934, -- Battle on the High Seas
    19935, -- Heroic: Battle on the High Seas
    19936, -- Battle on the High Seas
    19937, -- Heroic: Battle on the High Seas
})

zoneData:Zone({554, 555}, { -- Timeless Isle (zone)
    2556, -- Pest Control
    7285, -- Every Day I'm Pand-a-ren
    8535, -- Celestial Challenge
    8533, -- Ordos
    19922, -- Emperor Shaohao
    20001, -- Elusive Foes: Timeless Isle
    19982, -- Hidden Treasures: Timeless Isle
    20002, -- Powerful Enemies: Timeless Isle
    19970, -- Tour Timeless Isle
    20021, -- Chi-ji, the Red Crane
    20022, -- Yu'lon, the Jade Serpent
    20023, -- Niuzao, the Black Ox
    20024, -- Xuen, the White Tiger
    20025, -- Ordos
    20016, -- Looking For Group: Timeless Isle
    20003, -- Timeless Isle
})

zoneData:Zone({556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570}, { -- Siege of Orgrimmar (raid)
    8458, -- Vale of Eternal Sorrows
    8459, -- Gates of Retribution
    8461, -- The Underhold
    8462, -- Downfall
    8679, -- Conqueror / Liberator of Orgrimmar
    8680, -- Liberator of Orgrimmar
    8398, -- Ahead of the Curve: Garrosh Hellscream (10 player)
    8400, -- Cutting Edge: Garrosh Hellscream (10 player)
    8399, -- Ahead of the Curve: Garrosh Hellscream (25 player)
    8401, -- Cutting Edge: Garrosh Hellscream (25 player)
    11759, -- Yaass'shaarj
    8536, -- No More Tears
    8528, -- Go Long
    8532, -- None Shall Pass
    8521, -- Swallow Your Pride
    8530, -- The Immortal Vanguard
    8520, -- Fire in the Hole!
    8453, -- Rescue Raiders
    8448, -- Gamon Will Save Us!
    8538, -- Unlimited Potential
    8529, -- Criss Cross
    8527, -- Giant Dinosaur vs. Mega Snail
    8543, -- Lasers and Magnets and Drills! Oh My!
    8531, -- Now We are the Paragon
    8537, -- Strike!
    8463, -- Mythic: Immerseus
    8465, -- Mythic: Fallen Protectors
    8466, -- Mythic: Norushen
    8467, -- Mythic: Sha of Pride
    8468, -- Mythic: Galakras
    8469, -- Mythic: Iron Juggernaut
    8470, -- Mythic: Kor'kron Dark Shaman
    8471, -- Mythic: General Nazgrim
    8472, -- Mythic: Malkorok
    8478, -- Mythic: Spoils of Pandaria
    8479, -- Mythic: Thok the Bloodthirsty
    8480, -- Mythic: Siegecrafter Blackfuse
    8481, -- Mythic: Paragons of the Klaxxi
    8482, -- Mythic: Garrosh Hellscream
    19958, -- Raid Finder: Siege of Orgrimmar
    19959, -- Siege of Orgrimmar
    19960, -- Heroic: Siege of Orgrimmar
    19961, -- Mythic Remix: Siege of Orgrimmar
})
