local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

local expansion = KrowiAF.NewExpansion(CT.TheBurningCrusade)

local zones = expansion:Zones{
    1262, -- Loremaster of Outland
    1311, -- Medium Rare
    1312, -- Bloody Rare
    44, -- Outland Explorer
    763, -- The Burning Crusader
    764, -- The Burning Crusader
    894, -- Flying High Over Skettis
    897, -- You're So Offensive
    902, -- Chief Exalted Officer
    7520, -- The Loremaster
}
zones:Zone(111, {
    1165, -- My Storage is "Gigantique"""
    9924, -- Field Photographer
})
zones:Zone(110, {
    613, -- Killed in Quel'Thalas
    614, -- For the Alliance!
    604, -- Wrath of the Alliance
})
zones:Zone(103, {
    618, -- Putting Out the Light
    619, -- For the Horde!
    603, -- Wrath of the Horde
})
local azuremystIsle = zones:Zone(97)
azuremystIsle:Exploration{
    860, -- Explore Azuremyst Isle
}
azuremystIsle:Reputation{
    948, -- Ambassador of the Alliance
}
local bloodmystIsle = zones:Zone(106)
bloodmystIsle:Quests{
    4926, -- Bloodmyst Isle Quests
}
bloodmystIsle:Exploration{
    861, -- Explore Bloodmyst Isle
}
bloodmystIsle:Reputation{
    948, -- Ambassador of the Alliance
}
local eversongWoods = zones:Zone(94)
eversongWoods:Exploration{
    859, -- Explore Eversong Woods
}
eversongWoods:Reputation{
    762, -- Ambassador of the Horde
}
local ghostlands = zones:Zone(95)
ghostlands:Quests{
    4908, -- Ghostlands Quests
}
ghostlands:Exploration{
    858, -- Explore Ghostlands
}
ghostlands:Reputation{
    762, -- Ambassador of the Horde
}
local hellfirePeninsula = zones:Zone(100)
hellfirePeninsula:Quests{
    1189, -- To Hellfire and Back
    1271, -- To Hellfire and Back
}
hellfirePeninsula:Exploration{
    862, -- Explore Hellfire Peninsula
    9924, -- Field Photographer
}
hellfirePeninsula:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
}
local zangarmarsh = zones:Zone(102)
zangarmarsh:Quests{
    1190, -- Mysteries of the Marsh
}
zangarmarsh:Exploration{
    863, -- Explore Zangarmarsh
}
zangarmarsh:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    893, -- Cenarion War Hippogryph
    953, -- Guardian of Cenarius
    900, -- The Czar of Sporeggar
    942, -- The Diplomat
    943, -- The Diplomat
}
local terokkarForest = zones:Zone(108)
terokkarForest:Quests{
    1191, -- Terror of Terokkar
    1272, -- Terror of Terokkar
    1275, -- Bombs Away
}
terokkarForest:Exploration{
    867, -- Explore Terokkar Forest
}
terokkarForest:Reputation{
    903, -- Shattrath Divided
    1205, -- Hero of Shattrath
}
local nagrand = zones:Zone(107)
nagrand:Quests{
    1192, -- Nagrand Slam
    1273, -- Nagrand Slam
    939, -- Hills Like White Elekk
    941, -- Hemet Nesingwary: The Collected Quests
    1576, -- Of Blood and Anguish
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
}
nagrand:Exploration{
    866, -- Explore Nagrand
}
nagrand:Reputation{
    899, -- Oh My, Kurenai
    901, -- Mag'har of Draenor
    942, -- The Diplomat
    943, -- The Diplomat
}
local bladesEdgeMountains = zones:Zone(105)
bladesEdgeMountains:Quests{
    1193, -- On the Blade's Edge
    1276, -- Blade's Edge Bomberman
}
bladesEdgeMountains:Exploration{
    865, -- Explore Blade's Edge Mountains
}
bladesEdgeMountains:Reputation{
    896, -- A Quest a Day Keeps the Ogres at Bay
}
local netherstorm = zones:Zone(109)
netherstorm:Quests{
    1194, -- Into the Nether
}
netherstorm:Exploration{
    843, -- Explore Netherstorm
    9924, -- Field Photographer
}
local shadowmoonValley = zones:Zone(104)
shadowmoonValley:Quests{
    1195, -- Shadow of the Betrayer
}
shadowmoonValley:Exploration{
    864, -- Explore Shadowmoon Valley
}
shadowmoonValley:Reputation{
    898, -- On Wings of Nether
    1638, -- Skyshattered
}
local isleOfQuelDanas = zones:Zone(122)
isleOfQuelDanas:Exploration{
    868, -- Explore Isle of Quel'Danas
}
local dungeons = expansion:Dungeons{
    1284, -- Outland Dungeonmaster
    1287, -- Outland Dungeon Hero
}
dungeons:Dungeon(248, {
    647, -- Hellfire Ramparts
    667, -- Heroic: Hellfire Ramparts
})
dungeons:Dungeon(256, {
    648, -- The Blood Furnace
    668, -- Heroic: The Blood Furnace
})
dungeons:Dungeon(259, {
    657, -- The Shattered Halls
    678, -- Heroic: The Shattered Halls
})
dungeons:Dungeon(260, {
    649, -- The Slave Pens
    669, -- Heroic: The Slave Pens
})
dungeons:Dungeon(262, {
    650, -- Underbog
    670, -- Heroic: Underbog
})
dungeons:Dungeon(261, {
    656, -- The Steamvault
    677, -- Heroic: The Steamvault
})
dungeons:Dungeon(250, {
    651, -- Mana-Tombs
    671, -- Heroic: Mana-Tombs
})
dungeons:Dungeon(247, {
    666, -- Auchenai Crypts
    672, -- Heroic: Auchenai Crypts
})
dungeons:Dungeon(252, {
    653, -- Sethekk Halls
    674, -- Heroic: Sethekk Halls
    883, -- Reins of the Raven Lord
})
dungeons:Dungeon(253, {
    654, -- Shadow Labyrinth
    675, -- Heroic: Shadow Labyrinth
})
dungeons:Dungeon(251, {
    652, -- The Escape From Durnholde
    673, -- Heroic: The Escape From Durnholde
})
dungeons:Dungeon(255, {
    655, -- Opening of the Dark Portal
    676, -- Heroic: Opening of the Dark Portal
})
dungeons:Dungeon(258, {
    658, -- The Mechanar
    679, -- Heroic: The Mechanar
})
dungeons:Dungeon(257, {
    659, -- The Botanica
    680, -- Heroic: The Botanica
})
dungeons:Dungeon(254, {
    660, -- The Arcatraz
    681, -- Heroic: The Arcatraz
})
dungeons:Dungeon(249, {
    661, -- Magister's Terrace
    682, -- Heroic: Magister's Terrace
    884, -- Swift White Hawkstrider
})
local raids = expansion:Raids{
    1286, -- Outland Raider
    432, -- Champion of the Naaru
    431, -- Hand of A'dal
}
local karazhan = raids:Raid(745, {
    690, -- Karazhan
    882, -- Fiery Warhorse's Reins
    11746, -- Outlandish Style
    2456, -- Vampire Hunter
    8293, -- Raiding with Leashes II: Attunement Edition
    9924, -- Field Photographer
})
karazhan:Named(CT.Reputation, {
    960, -- The Violet Eye
}):Merge()
raids:Raid(746, {
    692, -- Gruul's Lair
    11746, -- Outlandish Style
})
raids:Raid(747, {
    693, -- Magtheridon's Lair
    11746, -- Outlandish Style
})
raids:Raid(748, {
    694, -- Serpentshrine Cavern
    11747, -- Merely a Set
    8293, -- Raiding with Leashes II: Attunement Edition
})
raids:Raid(749, {
    696, -- Tempest Keep
    885, -- Ashes of Al'ar
    8293, -- Raiding with Leashes II: Attunement Edition
})
local theBattleForMountHyjal = raids:Raid(750, {
    695, -- The Battle for Mount Hyjal
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})
theBattleForMountHyjal:Named(CT.Reputation, {
    959, -- The Scale of the Sands
}):Merge()
local blackTemple = raids:Raid(751, {
    697, -- The Black Temple
    11748, -- Black is the New Black
    9016, -- Breaker of the Black Harvest
    426, -- Warglaives of Azzinoth
    11869, -- I'll Hold These For You Until You Get Out
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})
blackTemple:Named(CT.Reputation, {
    958, -- Sworn to the Deathsworn
}):Merge()
raids:Named(addon.GetInstanceInfoName(77) .. CT.Legacy, {
    691, -- Zul'Aman
    430, -- Amani War Bear
})
raids:Raid(752, {
    698, -- Sunwell Plateau
    11749, -- Suns Out, Thori'dals Out
    725, -- Thori'dal, the Stars' Fury
    9824, -- Raiding with Leashes III: Drinkin' From the Sunwell
})
local professions = expansion:Professions{
    733, -- Professional Outland Master
    18729, -- Working in Hellfire
    18721, -- Outland Master of All
    62358, -- Outlandish Lumberjack
    1257, -- The Scavenger
    134, -- Master Medic
}
professions:Named(CT.Archaeology, {
    4921, -- Master Archaeologist
    5192, -- The Harder they Fall
}):Merge()
professions:Cooking{
    124, -- Outland Cook
    877, -- The Cake Is Not A Lie
    906, -- Kickin' It Up a Notch
    1800, -- The Outland Gourmet
    1801, -- Captain Rumsey's Lager
}
professions:Engineering{
    18856, -- Just an Ordinary Gas Cloud
}
professions:Fishing{
    129, -- Outland Fisherman
    726, -- Mr. Pinchy's Magical Crawdad Box
    144, -- The Lurker Above
    905, -- Old Man Barlowned
    1225, -- Outland Angler
}
professions:Leatherworking{
    18894, -- Free Stylin'
}
expansion:PetBattles{
    6587, -- Outland Safari
    6614, -- Outland Tamer
    6604, -- Taming Outland
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6584, -- Big City Pet Brawlin' - Alliance
    6621, -- Big City Pet Brawlin' - Horde
    6622, -- Big City Pet Brawler
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    62466, -- Aquatic Battler of Outland
    62467, -- Beast Battler of Outland
    62468, -- Critter Battler of Outland
    62469, -- Dragonkin Battler of Outland
    62470, -- Elemental Battler of Outland
    62471, -- Flying Battler of Outland
    62472, -- Humanoid Battler of Outland
    62473, -- Magic Battler of Outland
    62474, -- Mechanical Battler of Outland
    62475, -- Undead Battler of Outland
    62460, -- Family Battler of Outland
}
expansion:Named(addon.L["Dragonriding Races"], {
    19092, -- Outland: Bronze
    19097, -- Outland: Silver
    19098, -- Outland: Gold
    19099, -- Outland Advanced: Bronze
    19100, -- Outland Advanced: Silver
    19101, -- Outland Advanced: Gold
    19102, -- Outland Reverse: Bronze
    19103, -- Outland Reverse: Silver
    19104, -- Outland Reverse: Gold
    19105, -- Outland Racing Completionist
    19106, -- Outland Racing Completionist: Silver
    19107, -- Outland Racing Completionist: Gold
})