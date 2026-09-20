local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

local expansion = KrowiAF.NewExpansion(CT.Classic)

local zones = expansion:Zones{
    1206, -- To All The Squirrels I've Loved Before
    944, -- They Love Me In That Tunnel
    942, -- The Diplomat
    943, -- The Diplomat
}
local easternKingdoms = zones:Zone(13, {
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    19719, -- Reclamation of Gilneas
})
local stormwindCity = easternKingdoms:Zone(84, {
    615, -- Storming Stormwind
    14815, -- Executing the Exarch
    388, -- City Defender
    11065, -- It All Makes Sense Now
    603, -- Wrath of the Horde
})
stormwindCity:Exploration{
    9924, -- Field Photographer
}
stormwindCity:Reputation{
    948, -- Ambassador of the Alliance
}
easternKingdoms:Zone(87, {
    616, -- Overthrow the Council
    619, -- For the Horde!
    603, -- Wrath of the Horde
})
easternKingdoms:Zone(addon.Util.IsMainline and 90 or 998, {
    612, -- Downing the Dark Lady
    604, -- Wrath of the Alliance
})
local dunMorogh = easternKingdoms:Zone(27, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    4786, -- Operation: Gnomeregan
})
dunMorogh:Exploration{
    627, -- Explore Dun Morogh
}
dunMorogh:Reputation{
    948, -- Ambassador of the Alliance
}
local elwynnForest = easternKingdoms:Zone(37)
elwynnForest:Exploration{
    776, -- Explore Elwynn Forest
    9924, -- Field Photographer
}
elwynnForest:Reputation{
    948, -- Ambassador of the Alliance
}
local tirisfalGlades = easternKingdoms:Zone(18)
tirisfalGlades:Quests{
    15579, -- Return to Lordaeron
}
tirisfalGlades:Exploration{
    768, -- Explore Tirisfal Glades
}
tirisfalGlades:Reputation{
    762, -- Ambassador of the Horde
}
local westfall = easternKingdoms:Zone(52, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
})
westfall:Quests{
    4903, -- Westfall Quests
    12455, -- Westfall & Duskwood Quests
}
westfall:Exploration{
    802, -- Explore Westfall
    9924, -- Field Photographer
}
westfall:Reputation{
    948, -- Ambassador of the Alliance
}
local lochModan = easternKingdoms:Zone(48)
lochModan:Quests{
    4899, -- Loch Modan Quests
    12456, -- Loch Modan & Wetlands Quests
}
lochModan:Exploration{
    779, -- Explore Loch Modan
    9924, -- Field Photographer
}
lochModan:Reputation{
    948, -- Ambassador of the Alliance
}
local silverpineForest = easternKingdoms:Zone(21)
silverpineForest:Quests{
    4894, -- Silverpine Forest Quests
}
silverpineForest:Exploration{
    769, -- Explore Silverpine Forest
}
silverpineForest:Reputation{
    762, -- Ambassador of the Horde
}
local redridgeMountains = easternKingdoms:Zone(49)
redridgeMountains:Quests{
    4902, -- Redridge Mountains Quests
}
redridgeMountains:Exploration{
    780, -- Explore Redridge Mountains
}
redridgeMountains:Reputation{
    948, -- Ambassador of the Alliance
}
local duskwood = easternKingdoms:Zone(47)
duskwood:Quests{
    12430, -- Duskwood Quests
    12455, -- Westfall & Duskwood Quests
}
duskwood:Exploration{
    778, -- Explore Duskwood
    9924, -- Field Photographer
}
duskwood:Reputation{
    948, -- Ambassador of the Alliance
}
local wetlands = easternKingdoms:Zone(56)
wetlands:Quests{
    12429, -- Wetlands Quests
    12456, -- Loch Modan & Wetlands Quests
}
wetlands:Exploration{
    841, -- Explore Wetlands
    9924, -- Field Photographer
}
wetlands:Reputation{
    948, -- Ambassador of the Alliance
}
local hillsbradFoothills = easternKingdoms:Zone(25, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
})
hillsbradFoothills:Quests{
    5364, -- Don't Want No Zombies on My Lawn
    5365, -- Bloom and Doom
    4895, -- Hillsbrad Foothills Quests
}
hillsbradFoothills:Exploration{
    772, -- Explore Hillsbrad Foothills
    9924, -- Field Photographer
}
hillsbradFoothills:Reputation{
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
}
local arathiHighlands = easternKingdoms:Zone(14)
arathiHighlands:Quests{
    4896, -- Arathi Highlands Quests
}
arathiHighlands:Exploration{
    761, -- Explore Arathi Highlands
}
arathiHighlands:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local northernStranglethorn = easternKingdoms:Zone(50)
northernStranglethorn:Quests{
    4906, -- Northern Stranglethorn Quests
    940, -- The Green Hills of Stranglethorn
    941, -- Hemet Nesingwary: The Collected Quests
}
northernStranglethorn:Exploration{
    781, -- Explore Northern Stranglethorn
    17366, -- Relics of a Fallen Empire
}
northernStranglethorn:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local theCapeOfStranglethorn = easternKingdoms:Zone(210)
theCapeOfStranglethorn:Quests{
    4905, -- Cape of Stranglethorn Quests
}
theCapeOfStranglethorn:Exploration{
    4995, -- Explore the Cape of Stranglethorn
    9924, -- Field Photographer
}
theCapeOfStranglethorn:Named(CT.PvP, {
    389, -- Gurubashi Arena Master
    396, -- Gurubashi Arena Grand Master
})
theCapeOfStranglethorn:Reputation{
    762, -- Ambassador of the Horde
    871, -- Avast Ye, Admiral!
    2336, -- Insane in the Membrane
}
local westernPlaguelands = easternKingdoms:Zone(22)
westernPlaguelands:Quests{
    4893, -- Western Plaguelands Quests
}
westernPlaguelands:Exploration{
    770, -- Explore Western Plaguelands
    9924, -- Field Photographer
}
westernPlaguelands:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local theHinterlands = easternKingdoms:Zone(26)
theHinterlands:Quests{
    4897, -- Hinterlands Quests
}
theHinterlands:Exploration{
    773, -- Explore The Hinterlands
}
theHinterlands:Reputation{
    762, -- Ambassador of the Horde
}
local easternPlaguelands = easternKingdoms:Zone(23, {
    11297, -- The Balance of Light and Shadow
})
easternPlaguelands:Quests{
    4892, -- Eastern Plaguelands Quests
    5442, -- Full Caravan
}
easternPlaguelands:Exploration{
    771, -- Explore Eastern Plaguelands
    9924, -- Field Photographer
}
easternPlaguelands:Reputation{
    946, -- The Argent Dawn
    945, -- The Argent Champion
}
local badlands = easternKingdoms:Zone(15, {
    16431, -- Against the Elements
})
badlands:Quests{
    4900, -- Badlands Quests
    5444, -- Ready, Set, Goat!
}
badlands:Exploration{
    765, -- Explore Badlands
}
local searingGorge = easternKingdoms:Zone(32, {
    40796, -- This Takes Me Back
})
searingGorge:Quests{
    4910, -- Searing Gorge Quests
}
searingGorge:Exploration{
    774, -- Explore Searing Gorge
}
local swampOfSorrows = easternKingdoms:Zone(51)
swampOfSorrows:Quests{
    4904, -- Swamp of Sorrows Quests
}
swampOfSorrows:Exploration{
    782, -- Explore Swamp of Sorrows
}
swampOfSorrows:Reputation{
    948, -- Ambassador of the Alliance
}
local burningSteppes = easternKingdoms:Zone(36, {
    11296, -- The Ancient Keeper
})
burningSteppes:Quests{
    4901, -- Burning Steppes Quests
}
burningSteppes:Exploration{
    775, -- Explore Burning Steppes
    9924, -- Field Photographer
}
local blastedLands = easternKingdoms:Zone(17, {
    9618, -- The Iron Invasion
    11297, -- The Balance of Light and Shadow
})
blastedLands:Quests{
    4909, -- Blasted Lands Quests
}
blastedLands:Exploration{
    766, -- Explore Blasted Lands
    9924, -- Field Photographer
}
blastedLands:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local deadwindPass = easternKingdoms:Zone(42)
deadwindPass:Exploration{
    777, -- Explore Deadwind Pass
}
local kalimdor = zones:Zone(12, {
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    7520, -- The Loremaster
})
kalimdor:Zone(89, {
    617, -- Immortal No More
    603, -- Wrath of the Horde
})
local orgrimmar = kalimdor:Zone(85, {
    610, -- Orgrimmar Offensive
    14817, -- Opposing Orgrimmar
    614, -- For the Alliance!
    1006, -- City Defender
    11065, -- It All Makes Sense Now
    604, -- Wrath of the Alliance
})
orgrimmar:Reputation{
    762, -- Ambassador of the Horde
}
kalimdor:Zone(88, {
    611, -- Bleeding Bloodhoof
    604, -- Wrath of the Alliance
})
local teldrassil = kalimdor:Zone(57)
teldrassil:Exploration{
    842, -- Explore Teldrassil
}
teldrassil:Reputation{
    948, -- Ambassador of the Alliance
}
local durotar = kalimdor:Zone(1, {
    4790, -- Zalazane's Fall
})
durotar:Exploration{
    728, -- Explore Durotar
    9924, -- Field Photographer
}
durotar:Reputation{
    762, -- Ambassador of the Horde
}
local mulgore = kalimdor:Zone(7)
mulgore:Exploration{
    736, -- Explore Mulgore
}
mulgore:Reputation{
    762, -- Ambassador of the Horde
}
local moonglade = kalimdor:Zone(80)
moonglade:Exploration{
    855, -- Explore Moonglade
    9924, -- Field Photographer
}
local northernBarrens = kalimdor:Zone(10, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    16431, -- Against the Elements
})
northernBarrens:Quests{
    4933, -- Northern Barrens Quests
}
northernBarrens:Exploration{
    750, -- Explore Northern Barrens
}
northernBarrens:Reputation{
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
}
local darkshore = kalimdor:Zone(62)
darkshore:Quests{
    4928, -- Darkshore Quests
    5453, -- Ghosts in the Dark
}
darkshore:Exploration{
    844, -- Explore Darkshore
}
darkshore:Reputation{
    948, -- Ambassador of the Alliance
}
local azshara = kalimdor:Zone(76, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
})
azshara:Quests{
    4927, -- Azshara Quests
    5454, -- Joy Ride
    5448, -- Glutton for Fiery Punishment
    5546, -- Glutton for Icy Punishment
    5547, -- Glutton for Shadowy Punishment
}
azshara:Exploration{
    852, -- Explore Azshara
}
azshara:Reputation{
    762, -- Ambassador of the Horde
}
local ashenvale = kalimdor:Zone(63)
ashenvale:Quests{
    4925, -- Ashenvale Quests
    4976, -- Ashenvale Quests
}
ashenvale:Exploration{
    845, -- Explore Ashenvale
}
ashenvale:Reputation{
    948, -- Ambassador of the Alliance
}
local stonetalonMountains = kalimdor:Zone(65)
stonetalonMountains:Quests{
    4936, -- Stonetalon Mountains Quests
    4980, -- Stonetalon Mountains Quests
}
stonetalonMountains:Exploration{
    847, -- Explore Stonetalon Mountains
}
stonetalonMountains:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local desolace = kalimdor:Zone(66)
desolace:Quests{
    4930, -- Desolace Quests
}
desolace:Exploration{
    848, -- Explore Desolace
}
desolace:Reputation{
    762, -- Ambassador of the Horde
}
local southernBarrens = kalimdor:Zone(199)
southernBarrens:Quests{
    4937, -- Southern Barrens Quests
    4981, -- Southern Barrens Quests
}
southernBarrens:Exploration{
    4996, -- Explore Southern Barrens
}
southernBarrens:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local feralas = kalimdor:Zone(69)
feralas:Quests{
    4932, -- Feralas Quests
    4979, -- Feralas Quests
}
feralas:Exploration{
    849, -- Explore Feralas
    9924, -- Field Photographer
}
feralas:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local dustwallowMarsh = kalimdor:Zone(70, {
    40796, -- This Takes Me Back
})
dustwallowMarsh:Quests{
    4929, -- Dustwallow Marsh Quests
    4978, -- Dustwallow Marsh Quests
}
dustwallowMarsh:Exploration{
    850, -- Explore Dustwallow Marsh
}
dustwallowMarsh:Reputation{
    948, -- Ambassador of the Alliance
}
local thousandNeedles = kalimdor:Zone(64)
thousandNeedles:Quests{
    4938, -- Thousand Needles Quests
}
thousandNeedles:Exploration{
    846, -- Explore Thousand Needles
}
thousandNeedles:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local tanaris = kalimdor:Zone(71, {
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
})
tanaris:Quests{
    4935, -- Tanaris Quests
}
tanaris:Exploration{
    851, -- Explore Tanaris
    9924, -- Field Photographer
}
tanaris:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
}
local felwood = kalimdor:Zone(77, {
    11296, -- The Ancient Keeper
})
felwood:Quests{
    4931, -- Felwood Quests
}
felwood:Exploration{
    853, -- Explore Felwood
}
felwood:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local ungoroCrater = kalimdor:Zone(78, {
    3357, -- Venomhide Ravasaur
    11296, -- The Ancient Keeper
    16431, -- Against the Elements
})
ungoroCrater:Quests{
    4939, -- Un'Goro Crater Quests
}
ungoroCrater:Exploration{
    854, -- Explore Un'Goro Crater
    9924, -- Field Photographer
}
local silithus = kalimdor:Zone(81, {
    416, -- Scarab Lord
    5533, -- Veteran of the Shifting Sands
    11296, -- The Ancient Keeper
})
silithus:Quests{
    4934, -- Silithus Quests
}
silithus:Exploration{
    856, -- Explore Silithus
    9924, -- Field Photographer
}
silithus:Reputation{
    953, -- Guardian of Cenarius
}
local winterspring = kalimdor:Zone(83, {
    3356, -- Winterspring Frostsaber
    11296, -- The Ancient Keeper
})
winterspring:Quests{
    4940, -- Winterspring Quests
    5443, -- E'ko Madness
}
winterspring:Exploration{
    857, -- Explore Winterspring
}
winterspring:Reputation{
    2336, -- Insane in the Membrane
}
local dungeons = expansion:Dungeons{
    1283, -- Classic Dungeonmaster
}
dungeons:Dungeon(226, {
    629, -- Ragefire Chasm
})
dungeons:Dungeon(240, {
    630, -- Wailing Caverns
    11765, -- Pet Battle Challenge: Wailing Caverns
})
dungeons:Dungeon(227, {
    632, -- Blackfathom Deeps
})
dungeons:Dungeon(238, {
    633, -- Stormwind Stockade
})
dungeons:Dungeon(231, {
    634, -- Gnomeregan
    13269, -- Pet Battle Challenge: Gnomeregan
})
dungeons:Dungeon(234, {
    635, -- Razorfen Kraul
})
dungeons:Dungeon(233, {
    636, -- Razorfen Downs
})
dungeons:Dungeon(239, {
    638, -- Uldaman
})
dungeons:Dungeon(241, {
    639, -- Zul'Farrak
})
dungeons:Dungeon(232, {
    640, -- Maraudon
})
dungeons:Dungeon(237, {
    641, -- Sunken Temple
})
dungeons:Dungeon(228, {
    642, -- Blackrock Depths
    3496, -- A Brew-FAST Mount
    14020, -- Pet Battle Challenge: Blackrock Depths
})
dungeons:Dungeon(229, {
    643, -- Lower Blackrock Spire
})
dungeons:Named(addon.GetInstanceInfoName(559) .. (addon.Util.IsMainline and CT.Legacy or ""), {
    1307, -- Upper Blackrock Spire (Classic)
    2188, -- Leeeeeeeeeeeeeroy!
})
dungeons:Dungeon(230, {
    644, -- King of Dire Maul
    5788, -- Agent of the Shen'dralar
})
dungeons:Named(addon.GetInstanceInfoName(246) .. CT.Legacy, {
    18368, -- Memory of Scholomance
    18558, -- Leaders of Scholomance
})
dungeons:Dungeon(236, {
    646, -- Stratholme
    729, -- Deathcharger's Reins
    13627, -- Pet Battle Challenge: Stratholme
    13766, -- Malowned
})
local raids = expansion:Raids{
    1285, -- Classic Raider
}
local moltenCore = raids:Raid(741, {
    686, -- Molten Core
    11741, -- So Hot Right Now
    429, -- Sulfuras, Hand of Ragnaros
    428, -- Thunderfury, Blessed Blade of the Windseeker
    9550, -- Boldly, You Sought the Power of Ragnaros
    7934, -- Raiding with Leashes
    11296, -- The Ancient Keeper
    11297, -- The Balance of Light and Shadow
    15330, -- Survivor of the Firelord (Season of Mastery)
})
moltenCore:Named(CT.Reputation, {
    955, -- Hydraxian Waterlords
    2496, -- The Fifth Element
}):Merge()
raids:Named(addon.GetInstanceInfoName(760) .. CT.Legacy, {
    684, -- Onyxia's Lair (Level 60)
    11296, -- The Ancient Keeper
})
raids:Raid(742, {
    685, -- Blackwing Lair
    11742, -- Dress in Lairs
    7934, -- Raiding with Leashes
    15333, -- Survivor of the Shadow Flame (Season of Mastery)
})
local zulgurub = raids:Named(addon.GetInstanceInfoName(76) .. CT.Legacy, {
    560, -- Deadliest Catch
    688, -- Zul'Gurub
    880, -- Swift Zulian Tiger
    881, -- Swift Razzashi Raptor
})
zulgurub:Named(CT.Reputation, {
    957, -- Hero of the Zandalar Tribe
})
local ruinsOfAhnQiraj = raids:Raid(743, {
    689, -- Ruins of Ahn'Qiraj
})
ruinsOfAhnQiraj:Named(CT.Reputation, {
    953, -- Guardian of Cenarius
})
local templeOfAhnQiraj = raids:Raid(744, {
    687, -- Temple of Ahn'Qiraj
    424, -- Why? Because It's Red
    11743, -- Accessor-Eyes
    7934, -- Raiding with Leashes
    15334, -- Survivor of the Old God (Season of Mastery)
})
templeOfAhnQiraj:Named(CT.Reputation, {
    956, -- Brood of Nozdormu
}):Merge()
raids:Named(addon.GetInstanceInfoName(754) .. CT.Legacy, {
    11744, -- Drop Dead, Gorgeous
    425, -- Atiesh, Greatstaff of the Guardian
    15335, -- Survivor of the Damned (Season of Mastery)
    15637, -- The Immortal (Season of Mastery)
    18372, -- Wards of the Dread Citadel
    18557, -- Never Bothered, Anyway
    18616, -- Putting Wilhelm Out of Business
})
local professions = expansion:Professions{
    116, -- Professional Journeyman
    731, -- Professional Expert
    732, -- Professional Classic Master
    18728, -- Working from the Start
    18720, -- Classic Master of All
    62357, -- Classically Trained Lumberjack
    131, -- Journeyman Medic
    132, -- Expert Medic
    133, -- Artisan Medic
}
professions:Named(CT.Archaeology, {
    4857, -- Journeyman Archaeologist
    4919, -- Expert Archaeologist
    4920, -- Artisan Archaeologist
    4858, -- Seven Scepters
    5191, -- Tragedy in Three Acts
    5193, -- Blue Streak
    4859, -- Kings Under the Mountain
}):Merge()
professions:Blacksmithing{
    18765, -- Destined to be Legendary
    18853, -- Seething Flames of Hatred
}
professions:Cooking{
    121, -- Journeyman Cook
    122, -- Expert Cook
    123, -- Classic Cook
    5842, -- Let's Do Lunch: Darnassus
    5841, -- Let's Do Lunch: Ironforge
    5474, -- Let's Do Lunch: Stormwind
    5475, -- Let's Do Lunch: Orgrimmar
    5843, -- Let's Do Lunch: Thunder Bluff
    5844, -- Let's Do Lunch: Undercity
    5845, -- A Bunch of Lunch
    5779, -- You'll Feel Right as Rain
}
professions:Fishing{
    126, -- Journeyman Fisherman
    127, -- Expert Fisherman
    128, -- Artisan Fisherman
    150, -- The Fishing Diplomat
    306, -- Master Angler of Azeroth
    878, -- One That Didn't Get Away
    1836, -- Old Crafty
    1837, -- Old Ironjaw
    5848, -- Fish or Cut Bait: Darnassus
    5847, -- Fish or Cut Bait: Ironforge
    5476, -- Fish or Cut Bait: Stormwind
    5477, -- Fish or Cut Bait: Orgrimmar
    5849, -- Fish or Cut Bait: Thunder Bluff
    5850, -- Fish or Cut Bait: Undercity
    5851, -- Gone Fishin'
    17367, -- Deadliest Cache
}
professions:Leatherworking{
    18899, -- You Saw Nothing
}
professions:Mining{
    18841, -- Doing Your Share
}
professions:Tailoring{
    18903, -- Ton of Tops
}
expansion:PetBattles{
    6586, -- Eastern Kingdoms Safari
    6585, -- Kalimdor Safari
    6613, -- Eastern Kingdoms Tamer
    6612, -- Kalimdor Tamer
    6603, -- Taming Eastern Kingdoms
    61029, -- Aquatic Battler of Eastern Kingdoms
    61030, -- Beast Battler of Eastern Kingdoms
    61031, -- Critter Battler of Eastern Kingdoms
    61032, -- Dragonkin Battler of Eastern Kingdoms
    61033, -- Elemental Battler of Eastern Kingdoms
    61034, -- Flying Battler of Eastern Kingdoms
    61035, -- Humanoid Battler of Eastern Kingdoms
    61036, -- Magic Battler of Eastern Kingdoms
    61037, -- Mechanical Battler of Eastern Kingdoms
    61028, -- Undead Battler of Eastern Kingdoms
    61040, -- Family Battler of Eastern Kingdoms
    6602, -- Taming Kalimdor
    61041, -- Aquatic Battler of Kalimdor
    61042, -- Beast Battler of Kalimdor
    61043, -- Critter Battler of Kalimdor
    61044, -- Dragonkin Battler of Kalimdor
    61045, -- Elemental Battler of Kalimdor
    61046, -- Flying Battler of Kalimdor
    61047, -- Humanoid Battler of Kalimdor
    61048, -- Magic Battler of Kalimdor
    61049, -- Mechanical Battler of Kalimdor
    61050, -- Undead Battler of Kalimdor
    61051, -- Family Battler of Kalimdor
    61094, -- Old World Family Battler
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    14021, -- The Shadows Revealed
    6584, -- Big City Pet Brawlin' - Alliance
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
}
local dragonridingRaces = expansion:Named(addon.L["Dragonriding Races"])
dragonridingRaces:Named(addon.L["Kalimdor Cup"], {
    17712, -- Kalimdor: Bronze
    17713, -- Kalimdor: Silver
    17714, -- Kalimdor: Gold
    17715, -- Kalimdor Advanced: Bronze
    17716, -- Kalimdor Advanced: Silver
    17717, -- Kalimdor Advanced: Gold
    17718, -- Kalimdor Reverse: Bronze
    17719, -- Kalimdor Reverse: Silver
    17720, -- Kalimdor Reverse: Gold
    17721, -- Kalimdor Racing Completionist
    17722, -- Kalimdor Racing Completionist: Silver
    17723, -- Kalimdor Racing Completionist: Gold
})
dragonridingRaces:Named(addon.L["Eastern Kingdoms Cup"], {
    18566, -- Eastern Kingdoms: Bronze
    18567, -- Eastern Kingdoms: Silver
    18568, -- Eastern Kingdoms: Gold
    18569, -- Eastern Kingdoms Advanced: Bronze
    18570, -- Eastern Kingdoms Advanced: Silver
    18571, -- Eastern Kingdoms Advanced: Gold
    18572, -- Eastern Kingdoms Reverse: Bronze
    18573, -- Eastern Kingdoms Reverse: Silver
    18574, -- Eastern Kingdoms Reverse: Gold
    18939, -- Eastern Kingdoms Racing Completionist
    18940, -- Eastern Kingdoms Racing Completionist: Silver
    18942, -- Eastern Kingdoms Racing Completionist: Gold
})