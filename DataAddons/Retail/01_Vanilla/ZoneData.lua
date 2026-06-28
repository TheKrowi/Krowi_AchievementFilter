local _, addon = ...
local shared = addon.Data.ZoneData.Shared
local sharedVanilla = addon.Data.ZoneData.Shared.Vanilla

local zoneData = sharedVanilla.ZoneData

-- [[ Eastern Kingdoms ]] --

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
})

zoneData:Zone({18, 19, 20, 465, 466}, { -- Tirisfal Glades (zone)
    1206, -- To All The Squirrels I've Loved Before
    42, -- Eastern Kingdoms Explorer
    15579, -- Return to Lordaeron
    768, -- Explore Tirisfal Glades
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
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
})

zoneData:Zone({27, 28, 29, 30, 31, 427, 428, 469, 470}, { -- Dun Morogh (zone)
    42, -- Eastern Kingdoms Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4786, -- Operation: Gnomeregan
    627, -- Explore Dun Morogh
    948, -- Ambassador of the Alliance
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    46, -- Universal Explorer
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
    46, -- Universal Explorer
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
})

zoneData:Zone({32, 35}, { -- Searing Gorge (zone)
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
})

zoneData:Zone({33, 34, 36}, { -- Burning Steppes (zone)
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
})

-- [[ Kalimdor ]] --

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
})

zoneData:Zone({57, 58, 59, 60, 61, 460}, { -- Teldrassil (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    842, -- Explore Teldrassil
    948, -- Ambassador of the Alliance
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    46, -- Universal Explorer
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
})

zoneData:Zone(80, { -- Moonglade (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    855, -- Explore Moonglade
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
})

zoneData:Zone({7, 8, 9, 462}, { -- Mulgore (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    736, -- Explore Mulgore
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    shared.OldWorldPetAchievements,
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone({1, 2, 3, 4, 5, 6, 461, 463, 464}, { -- Durotar (zone)
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
    46, -- Universal Explorer
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
})

-- [[ Cities ]] --

zoneData:Zone(84, { -- Stormwind City (city)
    1206, -- To All The Squirrels I've Loved Before
    615, -- Storming Stormwind
    14815, -- Executing the Exarch
    388, -- City Defender
    11065, -- It All Makes Sense Now
    603, -- Wrath of the Horde
    9924, -- Field Photographer
    948, -- Ambassador of the Alliance
    5474, -- Let's Do Lunch: Stormwind
    5476, -- Fish or Cut Bait: Stormwind
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
    18854, -- Seeing Red
})

zoneData:Zone({85, 86, 1534}, { -- Orgrimmar (city)
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
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
    18854, -- Seeing Red
})

zoneData:Zone({87, 1361}, { -- Ironforge (city)
    388, -- City Defender
    616, -- Overthrow the Council
    619, -- For the Horde!
    603, -- Wrath of the Horde
    5841, -- Let's Do Lunch: Ironforge
    1837, -- Old Ironjaw
    5847, -- Fish or Cut Bait: Ironforge
    6584, -- Big City Pet Brawlin' - Alliance
    6622, -- Big City Pet Brawler
})

zoneData:Zone(88, { -- Thunder Bluff (city)
    1206, -- To All The Squirrels I've Loved Before
    1006, -- City Defender
    611, -- Bleeding Bloodhoof
    604, -- Wrath of the Alliance
    5843, -- Let's Do Lunch: Thunder Bluff
    5849, -- Fish or Cut Bait: Thunder Bluff
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
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
    2556, -- Pest Control
})

zoneData:Zone(90, { -- Undercity (city)
    612, -- Downing the Dark Lady
    604, -- Wrath of the Alliance
    1006, -- City Defender
    5844, -- Let's Do Lunch: Undercity
    5850, -- Fish or Cut Bait: Undercity
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    2556, -- Pest Control
})

-- [[ Vanilla Battleground ]] --

zoneData:Zone({91, 1537, 2162}, { -- Alterac Valley (battleground)
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
})

-- [[ Vanilla Dungeons ]] --

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
    3496, -- A Brew-FAST Mount
    14020, -- Pet Battle Challenge: Blackrock Depths
    14021, -- The Shadows Revealed
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
})

zoneData:Zone({310, 311, 312, 313, 314, 315, 316}, { -- Shadowfang Keep (dungeon)
    5503, -- Pardon Denied
    5504, -- To the Ground!
    5505, -- Bullet Time
    631, -- Shadowfang Keep
    5093, -- Heroic: Shadowfang Keep
    4627, -- X-45 Heartbreaker
})

zoneData:Zone({317, 318}, { -- Stratholme (dungeon)
    646, -- Stratholme
    729, -- Deathcharger's Reins
    13627, -- Pet Battle Challenge: Stratholme
    13766, -- Malowned
    14021, -- The Shadows Revealed
})

-- [[ Vanilla Raids ]] --

zoneData:Zone(232, { -- Molten Core (raid)
    sharedVanilla.MoltenCore,
    11741, -- So Hot Right Now
    9550, -- Boldly, You Sought the Power of Ragnaros
    7934, -- Raiding with Leashes
    11296, -- The Ancient Keeper
    11297, -- The Balance of Light and Shadow
})

zoneData:Zone({287, 288, 289, 290}, { -- Blackwing Lair (raid)
    sharedVanilla.BlackwingLair,
    11742, -- Dress in Lairs
    7934, -- Raiding with Leashes
})

zoneData:Zone({319, 320, 321}, { -- Ahn'Qiraj (raid)
    sharedVanilla.AhnQiraj,
    11743, -- Accessor-Eyes
    7934, -- Raiding with Leashes
})
