local _, addon = ...
addon.Data.ZoneData.Shared.Vanilla = {}
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("Vanilla")

zoneData:Zone({74, 75}, { -- Caverns of Time (zone)
    763, -- The Burning Crusader
    764, -- The Burning Crusader
})

zoneData:Zone({92, 1339}, { -- Warsong Gulch (battleground)
    shared.GenericBattleground,
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
    907, -- The Justicar
    714, -- The Conqueror
    230, -- Battlemaster
})

zoneData:Zone({93, 1366, 1383}, { -- Arathi Basin (battleground)
    shared.GenericBattleground,
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
    907, -- The Justicar
    714, -- The Conqueror
    230, -- Battlemaster
})

zoneData:Zone(213, { -- Ragefire Chasm (dungeon)
    629, -- Ragefire Chasm
})

zoneData:Zone(219, { -- Zul'Farrak (dungeon)
    639, -- Zul'Farrak
    910, -- Elders of the Dungeons
})

zoneData:Zone(220, { -- The Temple of Atal'Hakkar (dungeon)
    641, -- Sunken Temple
    910, -- Elders of the Dungeons
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
    911, -- Elders of Kalimdor
})

zoneData:Zone(247, { -- Ruins of Ahn'Qiraj (raid)
    689, -- Ruins of Ahn'Qiraj
    953, -- Guardian of Cenarius
})

zoneData:Zone({250, 251, 252, 253, 254, 255}, { -- Blackrock Spire (dungeon)
    643, -- Lower Blackrock Spire
    910, -- Elders of the Dungeons
})

zoneData:Zone({280, 281}, { -- Maraudon (dungeon)
    640, -- Maraudon
    910, -- Elders of the Dungeons
})

zoneData:Zone(300, { -- Razorfen Downs (dungeon)
    636, -- Razorfen Downs
})

zoneData:Zone(301, { -- Razorfen Kraul (dungeon)
    635, -- Razorfen Kraul
})

zoneData:Zone(13, { -- Eastern Kingdoms (continent)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    897, -- You're So Offensive
    4875, -- Loremaster of Cataclysm
    4827, -- Surveying the Damage
    5548, -- To All the Squirrels Who Cared for Me
    4868, -- Cataclysm Explorer
    4881, -- The Earthen Ring
    7525, -- Taming Cataclysm
    46, -- Universal Explorer
    971, -- Tricks and Treats of Azeroth
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
    1034, -- The Fires of Azeroth
    1035, -- Desecration of the Horde
    1036, -- The Fires of Azeroth
    1037, -- Desecration of the Alliance
})

zoneData:Zone({18, 19, 20}, { -- Tirisfal Glades (zone)
    1206, -- To All The Squirrels I've Loved Before
    42, -- Eastern Kingdoms Explorer
    15579, -- Return to Lordaeron
    768, -- Explore Tirisfal Glades
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(21, { -- Silverpine Forest (zone)
    42, -- Eastern Kingdoms Explorer
    4894, -- Silverpine Forest Quests
    769, -- Explore Silverpine Forest
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(22, { -- Western Plaguelands (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4893, -- Western Plaguelands Quests
    770, -- Explore Western Plaguelands
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(23, { -- Eastern Plaguelands (zone)
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    11297, -- The Balance of Light and Shadow
    4892, -- Eastern Plaguelands Quests
    5442, -- Full Caravan
    771, -- Explore Eastern Plaguelands
    9924, -- Field Photographer
    946, -- The Argent Dawn
    945, -- The Argent Champion
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone(26, { -- The Hinterlands (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4897, -- Hinterlands Quests
    773, -- Explore The Hinterlands
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
})

zoneData:Zone(25, { -- Hillsbrad Foothills (zone)
    1206, -- To All The Squirrels I've Loved Before
    42, -- Eastern Kingdoms Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4895, -- Hillsbrad Foothills Quests
    772, -- Explore Hillsbrad Foothills
    9924, -- Field Photographer
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    5364, -- Don't Want No Zombies on My Lawn
    5365, -- Bloom and Doom
    273, -- On Metzen!
    967, -- Tricks and Treats of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(14, { -- Arathi Highlands (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4896, -- Arathi Highlands Quests
    761, -- Explore Arathi Highlands
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(56, { -- Wetlands (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    12429, -- Wetlands Quests
    12456, -- Loch Modan & Wetlands Quests
    841, -- Explore Wetlands
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(48, { -- Loch Modan (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4899, -- Loch Modan Quests
    12456, -- Loch Modan & Wetlands Quests
    779, -- Explore Loch Modan
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({27, 28, 29, 30, 31, 427, 428}, { -- Dun Morogh (zone)
    42, -- Eastern Kingdoms Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4786, -- Operation: Gnomeregan
    627, -- Explore Dun Morogh
    948, -- Ambassador of the Alliance
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(49, { -- Redridge Mountains (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4902, -- Redridge Mountains Quests
    780, -- Explore Redridge Mountains
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({37, 38, 39, 40, 425, 426}, { -- Elwynn Forest (zone)
    1206, -- To All The Squirrels I've Loved Before
    42, -- Eastern Kingdoms Explorer
    776, -- Explore Elwynn Forest
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({15, 16}, { -- Badlands (zone)
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    16431, -- Against the Elements
    4900, -- Badlands Quests
    5444, -- Ready, Set, Goat!
    765, -- Explore Badlands
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(32, { -- Searing Gorge (zone)
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    40796, -- This Takes Me Back
    4910, -- Searing Gorge Quests
    774, -- Explore Searing Gorge
    6603, -- Taming Eastern Kingdoms
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone(36, { -- Burning Steppes (zone)
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    11296, -- The Ancient Keeper
    4901, -- Burning Steppes Quests
    775, -- Explore Burning Steppes
    9924, -- Field Photographer
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({42, 43, 44, 45, 46}, { -- Deadwind Pass (zone)
    42, -- Eastern Kingdoms Explorer
    777, -- Explore Deadwind Pass
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    11240, -- Harbinger
    46, -- Universal Explorer
})

zoneData:Zone(47, { -- Duskwood (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    12430, -- Duskwood Quests
    12455, -- Westfall & Duskwood Quests
    778, -- Explore Duskwood
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    4907, -- Duskwood Quests
    966, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(51, { -- Swamp of Sorrows (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4904, -- Swamp of Sorrows Quests
    782, -- Explore Swamp of Sorrows
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(17, { -- Blasted Lands (zone)
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    9618, -- The Iron Invasion
    11297, -- The Balance of Light and Shadow
    4909, -- Blasted Lands Quests
    766, -- Explore Blasted Lands
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({52, 53, 54, 55}, { -- Westfall (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4903, -- Westfall Quests
    12455, -- Westfall & Duskwood Quests
    802, -- Explore Westfall
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(12, { -- Kalimdor (continent)
    1206, -- To All The Squirrels I've Loved Before
    944, -- They Love Me In That Tunnel
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    6602, -- Taming Kalimdor
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    4875, -- Loremaster of Cataclysm
    4827, -- Surveying the Damage
    5548, -- To All the Squirrels Who Cared for Me
    4868, -- Cataclysm Explorer
    7525, -- Taming Cataclysm
    46, -- Universal Explorer
    971, -- Tricks and Treats of Azeroth
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
    1034, -- The Fires of Azeroth
    1035, -- Desecration of the Horde
    1036, -- The Fires of Azeroth
    1037, -- Desecration of the Alliance
})

zoneData:Zone({57, 58, 59, 60, 61}, { -- Teldrassil (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    842, -- Explore Teldrassil
    948, -- Ambassador of the Alliance
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(62, { -- Darkshore (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4928, -- Darkshore Quests
    5453, -- Ghosts in the Dark
    844, -- Explore Darkshore
    948, -- Ambassador of the Alliance
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    12572, -- War Supplied
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(63, { -- Ashenvale (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4925, -- Ashenvale Quests
    4976, -- Ashenvale Quests
    845, -- Explore Ashenvale
    948, -- Ambassador of the Alliance
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(65, { -- Stonetalon Mountains (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4936, -- Stonetalon Mountains Quests
    4980, -- Stonetalon Mountains Quests
    847, -- Explore Stonetalon Mountains
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(80, { -- Moonglade (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    855, -- Explore Moonglade
    937, -- Elune's Blessing
    9924, -- Field Photographer
    6602, -- Taming Kalimdor
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(77, { -- Felwood (zone)
    1206, -- To All The Squirrels I've Loved Before
    944, -- They Love Me In That Tunnel
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    11296, -- The Ancient Keeper
    4931, -- Felwood Quests
    853, -- Explore Felwood
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
})

zoneData:Zone({7, 8, 9}, { -- Mulgore (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    736, -- Explore Mulgore
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
})

zoneData:Zone({1, 2, 3, 4, 5, 6}, { -- Durotar (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    4790, -- Zalazane's Fall
    728, -- Explore Durotar
    9924, -- Field Photographer
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    289, -- The Savior of Hallow's End
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
})

zoneData:Zone(64, { -- Thousand Needles (zone)
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4938, -- Thousand Needles Quests
    846, -- Explore Thousand Needles
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
})

zoneData:Zone({66, 67, 68}, { -- Desolace (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4930, -- Desolace Quests
    848, -- Explore Desolace
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(69, { -- Feralas (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4932, -- Feralas Quests
    4979, -- Feralas Quests
    849, -- Explore Feralas
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(70, { -- Dustwallow Marsh (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    40796, -- This Takes Me Back
    4929, -- Dustwallow Marsh Quests
    4978, -- Dustwallow Marsh Quests
    850, -- Explore Dustwallow Marsh
    948, -- Ambassador of the Alliance
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone({71, 72, 73}, { -- Tanaris (zone)
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4935, -- Tanaris Quests
    851, -- Explore Tanaris
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(76, { -- Azshara (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4927, -- Azshara Quests
    5454, -- Joy Ride
    5448, -- Glutton for Fiery Punishment
    5546, -- Glutton for Icy Punishment
    5547, -- Glutton for Shadowy Punishment
    852, -- Explore Azshara
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
})

zoneData:Zone(83, { -- Winterspring (zone)
    944, -- They Love Me In That Tunnel
    942, -- The Diplomat
    943, -- The Diplomat
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    3356, -- Winterspring Frostsaber
    11296, -- The Ancient Keeper
    4940, -- Winterspring Quests
    5443, -- E'ko Madness
    857, -- Explore Winterspring
    2336, -- Insane in the Membrane
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    shared.OldWorldPetAchievements,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone({78, 79}, { -- Un'Goro Crater (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    3357, -- Venomhide Ravasaur
    11296, -- The Ancient Keeper
    16431, -- Against the Elements
    4939, -- Un'Goro Crater Quests
    854, -- Explore Un'Goro Crater
    9924, -- Field Photographer
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone({81, 82}, { -- Silithus (zone)
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    416, -- Scarab Lord
    5533, -- Veteran of the Shifting Sands
    11296, -- The Ancient Keeper
    4934, -- Silithus Quests
    856, -- Explore Silithus
    9924, -- Field Photographer
    953, -- Guardian of Cenarius
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone(84, { -- Stormwind City (city)
    1206, -- To All The Squirrels I've Loved Before
    615, -- Storming Stormwind
    619, -- For the Horde!
    14815, -- Executing the Exarch
    388, -- City Defender
    11065, -- It All Makes Sense Now
    603, -- Wrath of the Horde
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    5474, -- Let's Do Lunch: Stormwind
    5476, -- Fish or Cut Bait: Stormwind
    150, -- The Fishing Diplomat
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    915, -- Elders of the Alliance
    2556, -- Pest Control
    18854, -- Seeing Red
    275, -- Veteran Nanny
    966, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone({85, 86}, { -- Orgrimmar (city)
    1206, -- To All The Squirrels I've Loved Before
    610, -- Orgrimmar Offensive
    14817, -- Opposing Orgrimmar
    614, -- For the Alliance!
    1006, -- City Defender
    11065, -- It All Makes Sense Now
    604, -- Wrath of the Alliance
    762, -- Ambassador of the Horde
    5475, -- Let's Do Lunch: Orgrimmar
    1836, -- Old Crafty
    5477, -- Fish or Cut Bait: Orgrimmar
    150, -- The Fishing Diplomat
    279, -- Simply Abominable
    914, -- Elders of the Horde
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
    18854, -- Seeing Red
    275, -- Veteran Nanny
    965, -- Tricks and Treats of Kalimdor
})

zoneData:Zone({87, 1361}, { -- Ironforge (city)
    388, -- City Defender
    616, -- Overthrow the Council
    619, -- For the Horde!
    603, -- Wrath of the Horde
    5841, -- Let's Do Lunch: Ironforge
    1837, -- Old Ironjaw
    5847, -- Fish or Cut Bait: Ironforge
    279, -- Simply Abominable
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    915, -- Elders of the Alliance
    966, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone(88, { -- Thunder Bluff (city)
    1206, -- To All The Squirrels I've Loved Before
    1006, -- City Defender
    611, -- Bleeding Bloodhoof
    604, -- Wrath of the Alliance
    5843, -- Let's Do Lunch: Thunder Bluff
    5849, -- Fish or Cut Bait: Thunder Bluff
    914, -- Elders of the Horde
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
    259, -- Scrooge
    965, -- Tricks and Treats of Kalimdor
})

zoneData:Zone(89, { -- Darnassus (city)
    1206, -- To All The Squirrels I've Loved Before
    388, -- City Defender
    617, -- Immortal No More
    603, -- Wrath of the Horde
    5842, -- Let's Do Lunch: Darnassus
    5848, -- Fish or Cut Bait: Darnassus
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    915, -- Elders of the Alliance
    2556, -- Pest Control
    963, -- Tricks and Treats of Kalimdor
})

zoneData:Zone(90, { -- Undercity (city)
    612, -- Downing the Dark Lady
    604, -- Wrath of the Alliance
    1006, -- City Defender
    5844, -- Let's Do Lunch: Undercity
    5850, -- Fish or Cut Bait: Undercity
    914, -- Elders of the Horde
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
    967, -- Tricks and Treats of Eastern Kingdoms
})

zoneData:Zone({91, 1537, 2162}, { -- Alterac Valley (battleground)
    shared.GenericBattleground,
    13928, -- Alterac Valley of Olde
    13930, -- Alterac Valley of Olde
    218, -- Alterac Valley Victory
    219, -- Alterac Valley Veteran
    221, -- Alterac Grave Robber
    222, -- Tower Defense
    1151, -- Loyal Defender
    224, -- Loyal Defender
    225, -- Everything Counts
    1164, -- Everything Counts
    223, -- The Sickly Gazelle
    220, -- Stormpike Perfection
    873, -- Frostwolf Perfection
    582, -- Alterac Valley All-Star
    707, -- Stormpike Battle Charger
    706, -- Frostwolf Howler
    1166, -- To the Looter Go the Spoils
    1167, -- Master of Alterac Valley
    226, -- The Alterac Blitz
    709, -- Hero of the Stormpike Guard
    708, -- Hero of the Frostwolf Clan
    907, -- The Justicar
    714, -- The Conqueror
    230, -- Battlemaster
})

zoneData:Zone(279, { -- Wailing Caverns (dungeon)
    630, -- Wailing Caverns
    11765, -- Pet Battle Challenge: Wailing Caverns
    14021, -- The Shadows Revealed
})

zoneData:Zone({226, 227, 228, 229}, { -- Gnomeregan (dungeon)
    634, -- Gnomeregan
    13269, -- Pet Battle Challenge: Gnomeregan
    14021, -- The Shadows Revealed
})

zoneData:Zone({242, 243}, { -- Blackrock Depths (dungeon)
    642, -- Blackrock Depths
    295, -- Direbrewfest
    3496, -- A Brew-FAST Mount
    14020, -- Pet Battle Challenge: Blackrock Depths
    14021, -- The Shadows Revealed
    910, -- Elders of the Dungeons
})

zoneData:Zone({291, 292}, { -- The Deadmines (dungeon)
    14021, -- The Shadows Revealed
    5366, -- Ready for Raiding
    5367, -- Rat Pack
    5368, -- Prototype Prodigy
    5369, -- It's Frost Damage
    5370, -- I'm on a Diet
    5371, -- Vigorous VanCleef Vindicator
    628, -- Deadmines
    5083, -- Heroic: Deadmines
    11856, -- Pet Battle Challenge: Deadmines
    9924, -- Field Photographer
    41146, -- Protocol Inferno: Deadmines
})

zoneData:Zone({310, 311, 312, 313, 314, 315, 316}, { -- Shadowfang Keep (dungeon)
    5503, -- Pardon Denied
    5504, -- To the Ground!
    5505, -- Bullet Time
    631, -- Shadowfang Keep
    5093, -- Heroic: Shadowfang Keep
    4627, -- X-45 Heartbreaker
    41147, -- Protocol Inferno: Shadowfang Keep
})

zoneData:Zone({317, 318}, { -- Stratholme (dungeon)
    646, -- Stratholme
    729, -- Deathcharger's Reins
    13627, -- Pet Battle Challenge: Stratholme
    13766, -- Malowned
    14021, -- The Shadows Revealed
    910, -- Elders of the Dungeons
})

zoneData:Zone(232, { -- Molten Core (raid)
    686, -- Molten Core
    429, -- Sulfuras, Hand of Ragnaros
    428, -- Thunderfury, Blessed Blade of the Windseeker
    955, -- Hydraxian Waterlords
    2496, -- The Fifth Element
    11741, -- So Hot Right Now
    9550, -- Boldly, You Sought the Power of Ragnaros
    7934, -- Raiding with Leashes
    11296, -- The Ancient Keeper
    11297, -- The Balance of Light and Shadow
    15330, -- Survivor of the Firelord (Season of Mastery)
})

zoneData:Zone({287, 288, 289, 290}, { -- Blackwing Lair (raid)
    685, -- Blackwing Lair
    11742, -- Dress in Lairs
    7934, -- Raiding with Leashes
    15333, -- Survivor of the Shadow Flame (Season of Mastery)
})

zoneData:Zone({319, 320, 321}, { -- Ahn'Qiraj (raid)
    687, -- Temple of Ahn'Qiraj
    424, -- Why? Because It's Red
    956, -- Brood of Nozdormu
    11743, -- Accessor-Eyes
    7934, -- Raiding with Leashes
    15334, -- Survivor of the Old God (Season of Mastery)
})

zoneData:Zone({616, 617, 618}, { -- Upper Blackrock Spire (dungeon)
    1307, -- Upper Blackrock Spire (Classic)
    2188, -- Leeeeeeeeeeeeeroy!
})
