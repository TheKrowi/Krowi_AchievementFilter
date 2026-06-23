local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

local expansion = KrowiAF.NewExpansion(CT.Midnight, {
    62387, -- It's Nearly Midnight
    62273, -- Echoes of Midnight
    41805, -- Arator's Journey
    42117, -- The War of Light and Shadow
    60891, -- The Crimson Rogue
    62191, -- Call of the Light
    61839, -- Midnight Pathfinder (Reward: Steady Flight unlocked within Midnight, Finery Funds)
})

expansion:Character{
    61678, -- Midnight Superior
    61679, -- Midnight Epic
    42328, -- One Warband Mentor: Midnight
    42329, -- Two Warband Mentors: Midnight
    42330, -- Three Warband Mentors: Midnight
    42331, -- Four Warband Mentors: Midnight
    42332, -- Five Warband Mentors: Midnight
    61519, -- Midnight Season 1: Catalyst Unbound
    61809, -- Adventurer of the Dawn
    42767, -- Veteran of the Dawn
    42768, -- Champion of the Dawn
    42769, -- Hero of the Dawn
    42770, -- Myth of the Dawn
}

local zones = expansion:Zones{
    62386, -- Light Up the Night
}

local quelThalas = zones:Zone(2537)
quelThalas:Quests{
    62110, -- Loremaster of Midnight
    42045, -- Midnight
}
quelThalas:Exploration{
    61859, -- Midnight Flight Master
    61854, -- The Midnight Explorer
    61584, -- Midnight Glyph Hunter
    61941, -- Abundance: Acolyte of a Glorious Entity
    61943, -- Abundance: Prosperous Plentitude!
    62268, -- Abundance: Professionals Only
    61681, -- Abundance: You Should See Him in a Crown
    62266, -- Abundance: An Acolyte no Longer
    62324, -- Abundance: Loa of all Trades
    62333, -- Abundance: Harvester
    62336, -- Abundance: Contributer
    62337, -- Abundance: Professional
    62338, -- Abundance: Artisan
    62340, -- Abundance: Investor
    62339, -- Abundance: Gambler
    62325, -- Abundance: Treasures Aplenty
    62326, -- Abundance: Golden Opportunities
    62329, -- Abundance: Squash the Competition
    62330, -- Abundance: One Bite at a Time
    62331, -- Abundance: Drops of Prosperity
    62332, -- Abundance: Dundun's Favored
    42283, -- Abundance: Azeroth Runs on Dundun
    62341, -- Abundance: Ain't Dun Till It's Dun
    62057, -- Midnight: The Highest Peaks
    62104, -- Midnight Lore Hunter
    63343, -- Goal!
}
quelThalas:PvP{
    61464, -- Spark in the Night
    61465, -- Spark in the Night
    61234, -- Hunt in the Night
    61238, -- Midnight Hunter
    61225, -- Investigating the Rise
    61226, -- Uprising
    61227, -- Entering the Void
    61228, -- Embracing the Void
    61229, -- Dedication in the Void
    61265, -- Spectral Capture
    61266, -- Spectral Stocker
    61231, -- Midnight Loot
    61232, -- Midnight Treasures
    61230, -- Remains in the Rise
    61447, -- Partake in the Rise
    61448, -- Frequent the Rise
    61449, -- Customary Rise
    61446, -- Slayer's Mastery (Title: Voidslayer)
}
quelThalas:Reputation{
    62192, -- Midnight Diplomat (Reward: Finery Funds)
}

local eversong = zones:Zone(2395, {
    62261, -- Forever Song
})
eversong:Quests{
    41802, -- Eversong In Reprise
    61957, -- Sojourner of Eversong Woods
}
eversong:Exploration{
    61855, -- Explore Eversong Woods
    61960, -- Treasures of Eversong Woods
    62288, -- Eversong Woods: The Highest Peaks
    61507, -- A Bloody Song
    61576, -- Eversong Woods Glyph Hunter
    61937, -- Abundance: Artisan of Mausoloa
    61961, -- Runestone Rush
    62186, -- The Party Must Go On
    62187, -- Grand Magister's Sommelier
    62185, -- Ever Painting
}
eversong:PvP{
    61221, -- Tour of Duty: Eversong Woods
}
eversong:Reputation{
    62190, -- Life of the Party
    62262, -- Silvermoon Court Champion
}

local zulaman = zones:Zone(2437, {
    61453, -- Making an Amani Out of You
})
zulaman:Quests{
    41803, -- For Zul'Aman! (Customization Reward: Amani Appearances for Darkspear Troll)
    61452, -- Sojourner of Zul'Aman
    61910, -- Mrglgrgl of Grglmrgl
    62413, -- The Curse of Ula'tek
}
zulaman:Exploration{
    61856, -- Explore Zul'Aman
    62125, -- Treasures of Zul'Aman
    62289, -- Zul'Aman: The Highest Peaks
    62122, -- Tallest Tree in the Forest
    61581, -- Zul'Aman Glyph Hunter
    61938, -- Abundance: Artisan of Loaknit
    61455, -- Shadowpine Scattered
    62120, -- Altar of Blessings: The Penitent Troll
    62121, -- Altar of Blessings: Sacred Buffet Devotee
    62269, -- Altar of Blessings: Amani Curious
    62270, -- Altar of Blessings: One for Altar
    62199, -- Put a Pin in It
    62200, -- Gnome Alone
    62201, -- The Frog and the Princesses
    62202, -- Spiritpaw Marathon
    62267, -- A Most Violent Loa
}
zulaman:PvP{
    61222, -- Tour of Duty: Zul'Aman
}
zulaman:Reputation{
    62263, -- Amani Tribe Champion
}

local harandar = zones:Zone(2413, {
    62260, -- That's Aln, Folks!
    61706, -- Herald of the Goddess
})
harandar:Quests{
    41804, -- One Does Not Simply Walk Into Harandar
    61739, -- Sojourner of Harandar
    42278, -- The Empty Cradle
    61219, -- No Time to Paws
}
harandar:Exploration{
    61520, -- Explore Harandar
    61263, -- Treasures of Harandar
    62290, -- Harandar: The Highest Peaks
    61264, -- Leaf None Behind
    61582, -- Harandar Glyph Hunter
    61939, -- Abundance: Artisan of Floaret
    61860, -- From The Cradle to the Grave
    62188, -- More Than Just Their Roots
    61052, -- Dust 'Em Off (Reward: Title: "Dustlord")
    61344, -- Chronicler of the Haranir
    61574, -- Legends Never Die
    61917, -- "Hold aggro, I got this"
}
harandar:PvP{
    61223, -- Tour of Duty: Harandar
}
harandar:Reputation{
    62264, -- Hara'ti Champion
}

local voidstorm = zones:Zone(2405, {
    62256, -- Yelling into the Voidstorm
})
voidstorm:Quests{
    41806, -- Breaching the Voidstorm
    61864, -- Sojourner of Voidstorm
    62105, -- Lysikas Would Be Proud
    62385, -- Staring Into The Void
}
voidstorm:Exploration{
    61857, -- Explore Voidstorm
    62126, -- Treasures of Voidstorm
    62291, -- Voidstorm: The Highest Peaks
    62130, -- The Ultimate Predator
    61583, -- Voidstorm Glyph Hunter
    61940, -- Abundance: Artisan of Loanite
    61861, -- Oh, No You Don't!
    61912, -- Anchoring the Defense
    61913, -- A Singular Problem
    61922, -- Ninety Percent is Good Enough
    62133, -- Thrill of the Chase
}
voidstorm:PvP{
    61224, -- Tour of Duty: Voidstorm
}
voidstorm:Reputation{
    62265, -- The Singularity Champion
}

local delves = expansion:Delves{
    61832, -- Midnight Delves: Tier 1 (Unlock: Tier 2 delves in Midnight)
    61835, -- Midnight Delves: Tier 2 (Unlock: Tier 3 delves in Midnight)
    61836, -- Midnight Delves: Tier 3
    61734, -- Midnight Delves: Endgame (Unlock: Tier 4 delves in Midnight)
    61741, -- Delve Loremaster: Midnight
    61901, -- Midnight: Leave No Treasure Unfound (Title: Treasure Seeker)
    61906, -- Glory of the Midnight Delver (Mount: Giganto Manis)
    61707, -- Delver of the Depths: Midnight
    61708, -- Delver of the Depths II: Midnight
    61709, -- Delver of the Depths III: Midnight
    61710, -- Delver of the Depths IV: Midnight
    61722, -- Curio Enthusiast: Midnight
    61723, -- Curio Fanatic: Midnight
    61711, -- Midnight Delver Damage Dealer
    61712, -- Midnight Delver Damage Dealer II
    61713, -- Midnight Delver Damage Dealer III
    61714, -- Midnight Delver Healer
    61715, -- Midnight Delver Healer II
    61716, -- Midnight Delver Healer III
    61717, -- Midnight Delver Tank
    61718, -- Midnight Delver Tank II
    61719, -- Midnight Delver Tank III
    61720, -- Midnight Delver
    61721, -- Midnight Delver II (Reward: Finery Funds)
    62206, -- Midnight Delver III
}
delves:Seasonal{
    61800, -- Midnight Delves: Tier 4 (Season 1) (Unlock: Tier 5 delves in Midnight Season 1)
    61801, -- Midnight Delves: Tier 5 (Season 1) (Unlock: Tier 6 delves in Midnight Season 1)
    61802, -- Midnight Delves: Tier 6 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
    61803, -- Midnight Delves: Tier 7 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
    61804, -- Midnight Delves: Tier 8 (Season 1) (Unlock: Tier 9 delves in Midnight Season 1)
    61805, -- Midnight Delves: Tier 9 (Season 1) (Unlock: Tier 10 delves in Midnight Season 1)
    61806, -- Midnight Delves: Tier 10 (Season 1) (Unlock: Tier 11 delves in Midnight Season 1)
    61807, -- Midnight Delves: Tier 11 (Season 1) (Title: High Explorer)
    61796, -- Midnight: Journey's End (Season 1)
}
delves:Delve(2535, { -- Atal'Aman
    61729, -- Atal'Aman Stories
    61863, -- Atal'Aman Discoveries
})
delves:Delve(2547, { -- Collegiate Calamity
    61726, -- Collegiate Calamity Stories
    61894, -- Collegiate Calamity Discoveries
})
delves:Delve(2525, { -- The Darkway
    61728, -- The Darkway Stories
    61895, -- The Darkway Discoveries
})
delves:Delve(2510, { -- The Grudge Pit
    61724, -- The Grudge Pit Stories
    61897, -- The Grudge Pit Discoveries
})
delves:Delve(2505, { -- The Gulf of Memory
    61731, -- The Gulf of Memory Stories
    61898, -- The Gulf of Memory Discoveries
})
delves:Delve(2545, { -- Parhelion Plaza
    61725, -- Parhelion Plaza Stories
    61893, -- Parhelion Plaza Discoveries
})
delves:Delve(2506, { -- Shadowguard Point
    61733, -- Shadowguard Point Stories
    61900, -- Shadowguard Point Discoveries
})
delves:Delve(2502, { -- Shadow Enclave
    61727, -- The Shadow Enclave Stories
    61892, -- The Shadow Enclave Discoveries
})
delves:Delve(2528, { -- Sunkiller Sanctum
    61732, -- Sunkiller Sanctum Stories
    61899, -- Sunkiller Sanctum Discoveries
})
delves:Delve(2503, { -- Twilight Crypts
    61730, -- Twilight Crypts Stories
    61896, -- Twilight Crypts Discoveries
})
delves:Delve(2507, { -- Torment's Rise
    40732, -- Heavy-Handed
    61797, -- My Shady Nemesis (Reward: Nullaeus Domaneye)
    61798, -- Lighting the Dark (Title: the Ominous)
    61799, -- Let Me Solo Him: Nullaeus (Reward: Arcanovoid Construct)
    61808, -- Fabled Let Me Solo Him: Nullaeus (Title: Fabled Vanquisher of Nullaeus)
})

local dungeons = expansion:Dungeons{
    61567, -- Midnight Dungeon Hero (Pet: Niblet)
    61568, -- Glory of the Midnight Hero
    62195, -- Midnight Dungeon Tank
    62194, -- Midnight Dungeon Healer
    62193, -- Midnight Dungeon Damage Dealer
    62196, -- Midnight Dungeoneer
    62388, -- Illicit Rain: Five Stars
}
dungeons:MythicPlus(shared.GetMidnightMythicPlus)
dungeons:Dungeon(1311, { -- Den of Nalorakk
    61638, -- Den of Nalorakk
    61642, -- Heroic: Den of Nalorakk
    61643, -- Mythic: Den of Nalorakk
})
dungeons:Dungeon(1300, { -- Magisters' Terrace
    61212, -- Magisters' Terrace
    61213, -- Heroic: Magisters' Terrace
    61214, -- Mythic: Magisters' Terrace
    61267, -- Keystone Hero: Magisters' Terrace
    61587, -- Keystone Victor: Magisters' Terrace (Midnight)
})
dungeons:Dungeon(1315, { -- Maisara Caverns
    61639, -- Maisara Caverns
    61644, -- Heroic: Maisara Caverns
    61645, -- Mythic: Maisara Caverns
    61269, -- Keystone Hero: Maisara Caverns
    61588, -- Keystone Victor: Maisara Caverns
})
dungeons:Dungeon(1304, { -- Murder Row
    41960, -- Murder Row
    41961, -- Heroic: Murder Row
    41962, -- Mythic: Murder Row
})
dungeons:Dungeon(1316, { -- Nexus-Point Xenas
    61585, -- You Conduit!
    61640, -- Nexus-Point Xenas
    61646, -- Heroic: Nexus-Point Xenas
    61647, -- Mythic: Nexus-Point Xenas
    61268, -- Keystone Hero: Nexus-Point Xenas
    61589, -- Keystone Victor: Nexus-Point Xenas
})
dungeons:Dungeon(1309, { -- The Blinding Vale
    61641, -- The Blinding Vale
    61648, -- Heroic: The Blinding Vale
    61649, -- Mythic: The Blinding Vale
})
dungeons:Dungeon(1313, { -- Voidscar Arena
    61508, -- Voidscar Arena
    61509, -- Heroic: Voidscar Arena
    61510, -- Mythic: Voidscar Arena
})
dungeons:Dungeon(1299, { -- Windrunner Spire
    41287, -- Windrunner Spire
    41288, -- Heroic: Windrunner Spire
    41291, -- Mythic: Windrunner Spire
    61262, -- Keystone Hero: Windrunner Spire
    61590, -- Keystone Victor: Windrunner Spire
})

local raids = expansion:Raids{
    62352, -- Nothing to See Here
    61380, -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
    61843, -- Quel'Dressed
}

local voidspire = raids:Raid(1307, { -- The Voidspire
    61635, -- Voidspire: Weapons of the Void
    61636, -- Voidspire: Fanatics of the Light
    61637, -- Voidspire: Crown of the Cosmos
    61366, -- The Voidspire
    61368, -- Heroic: The Voidspire
    61370, -- Mythic: The Voidspire
    61624, -- Ahead of the Curve: Crown of the Cosmos
    61625, -- Cutting Edge: Crown of the Cosmos
})
voidspire:Glory{
    62106, -- The Only Winning Move Is Not To Play
    62058, -- Hungry Hungry Hatchlings
    61514, -- It's Treason Then
    61911, -- Ready, Set, Snap!
    61936, -- Aura Farming
    61346, -- We Will, In Fact, See It Again
}
voidspire:Mythic{
    61372, -- Mythic: Imperator Averzian
    61373, -- Mythic: Vorasius
    61374, -- Mythic: Fallen-King Salhadaar
    61375, -- Mythic: Vaelgor & Ezzorak
    61376, -- Mythic: Lightblinded Vanguard
    61377, -- Mythic: Crown of the Cosmos (Title: Spirebane)
}

local dreamrift = raids:Raid(1314, { -- Dreamrift
    61487, -- Chimaerus, the Undreamt God
    61488, -- Heroic: Chimaerus, the Undreamt God
    61489, -- Mythic: Chimaerus, the Undreamt God (Title: Dream-Eater)
    61491, -- Ahead of the Curve: Chimaerus, the Undreamt God
    61492, -- Cutting Edge: Chimaerus, the Undreamt God
})
dreamrift:Glory{
    61454, -- Falling Between The Quacks
}

local march = raids:Raid(1308, { -- March on Quel'Danas
    61367, -- March on Quel'Danas
    61369, -- Heroic: March on Quel'Danas
    61371, -- Mythic: March on Quel'Danas
    61626, -- Ahead of the Curve: Midnight Falls
    61627, -- Cutting Edge: Midnight Falls
})
march:Glory{
    61381, -- Eggsistential Crisis
    62406, -- All the Things She Said
}
march:Mythic{
    61378, -- Mythic: Belo'ren, Child of Al'ar
    61379, -- Mythic: Midnight Falls (Title: Dawnbringer)
}

raids:Raid(1305, { -- Sporefall
    63237, -- Rotmire
    63240, -- Heroic: Rotmire
    63241, -- Mythic: Rotmire
})

local professions = expansion:Professions{
    61438, -- Thalassian Profession Master
    61439, -- Thalassian Artisan
    61440, -- Thalassian Polymath (Reward: Finery Funds)
    61441, -- Working WAY Past Midnight
    62370, -- Midnight Lumberjack
}
professions:Alchemy{
    42788, -- Alchemizing at Midnight
    62223, -- Alchemy-on-Demand
    62239, -- Dedicated to the Craft: Alchemy
}
professions:Blacksmithing{
    42792, -- Blacksmithing at Midnight
    62232, -- Blacksmithing-on-Demand
    62240, -- Dedicated to the Craft: Blacksmithing
}
professions:Cooking{
    42795, -- Cooking at Midnight
}
professions:Enchanting{
    42787, -- Enchanting at Midnight
    62233, -- Enchanting-on-Demand
    62241, -- Dedicated to the Craft: Enchanting
}
professions:Engineering{
    42798, -- Engineering at Midnight
    62234, -- Engineering-on-Demand
    62242, -- Dedicated to the Craft: Engineering
    60888, -- Pushing My Buttons
}
professions:Fishing{
    42797, -- Fishing at Midnight
}
professions:Herbalism{
    42793, -- Herbalism at Midnight
    62247, -- Herbalism-on-Demand
    62250, -- Dedicated to the Craft: Herbalism
}
professions:Inscription{
    42796, -- Inscribing at Midnight
    62235, -- Inscription-on-Demand
    62243, -- Dedicated to the Craft: Inscription
}
professions:Jewelcrafting{
    42789, -- Jewelcrafting at Midnight
    62236, -- Jewelcrafting-on-Demand
    62244, -- Dedicated to the Craft: Jewelcrafting
}
professions:Leatherworking{
    42786, -- Leatherworking at Midnight
    62237, -- Leatherworking-on-Demand
    62245, -- Dedicated to the Craft: Leatherworking
}
professions:Mining{
    42791, -- Mining at Midnight
    62248, -- Mining-on-Demand
    62251, -- Dedicated to the Craft: Mining
}
professions:Skinning{
    42790, -- Skinning at Midnight
    62249, -- Skinning-on-Demand
    62252, -- Dedicated to the Craft: Skinning
}
professions:Tailoring{
    42794, -- Tailoring at Midnight
    62238, -- Tailoring-on-Demand
    62246, -- Dedicated to the Craft: Tailoring
}

expansion:PetBattles{
    61091, -- Midnight Safari
}

local prey = expansion:Named(CT.Prey, { -- Prey
    61387, -- Prey: Normal Mode I
    61386, -- Prey: Normal Mode II
    42701, -- Prey: Normal Mode III
    62383, -- Gotta Hunt Them All
    62134, -- The Deadliest of Prey
    62143, -- Trapped In The Middle With You
    62142, -- I Didn't Hear No Bell
    62139, -- Midnight Hunter
    62137, -- I'm Not Trapped In Here With You
    62138, -- You're Trapped In Here With Me
    62351, -- Preying For Midnight
    63164, -- Big Prey Hunter (Season 1)
})
prey:Named(addon.L["Hard"], {
    62144, -- Prey: Mad Magisters (Hard)
    62153, -- Prey: Insane Inventors (Hard)
    62154, -- Prey: A Different Kind of Void (Hard)
    62155, -- Prey: Ethereal Assassins (Hard)
    62156, -- Prey: Anger Management (Hard)
    62157, -- Prey: Sadistic Shamans (Hard)
    62158, -- Prey: The Fallen Farstriders (Hard)
    62159, -- Prey: Bloody Green Thumbs (Hard)
    62160, -- Prey: Blinded By The Light (Hard)
    62161, -- Prey: Outsmarting the Schemers (Hard)
    62162, -- Prey: Dominating the Void (Hard)
    62163, -- Prey: Chasing Death (Hard)
    62164, -- Prey: No Rest for the Wretched (Hard)
    62165, -- Prey: A Thorn in the Side (Hard)
    62166, -- Prey: Breaking the Blade (Hard)
    61389, -- Prey: Hard Mode I
    61388, -- Prey: Hard Mode II
    42702, -- Prey: Hard Mode III
})
prey:Named(addon.L["Nightmare"], {
    62135, -- Now It's A Party
    62136, -- I'm Good At What I Do
    62141, -- Look, I'm Just Trying To Fish Here
    62140, -- Kitchen Nightmare
    62403, -- 'Tis But A Scratch
    62167, -- Prey: Mad Magisters (Nightmare)
    62168, -- Prey: Insane Inventors (Nightmare)
    62169, -- Prey: A Different Kind of Void (Nightmare)
    62173, -- Prey: Ethereal Assassins (Nightmare)
    62174, -- Prey: Anger Management (Nightmare)
    62175, -- Prey: Sadistic Shamans (Nightmare)
    62176, -- Prey: The Fallen Farstriders (Nightmare)
    62177, -- Prey: Bloody Green Thumbs (Nightmare)
    62178, -- Prey: Blinded By The Light (Nightmare)
    62179, -- Prey: Outsmarting the Schemers (Nightmare)
    62180, -- Prey: Dominating the Void (Nightmare)
    62181, -- Prey: Chasing Death (Nightmare)
    62182, -- Prey: No Rest for the Wretched (Nightmare)
    62183, -- Prey: A Thorn in the Side (Nightmare)
    62184, -- Prey: Breaking the Blade (Nightmare)
    61392, -- Prey: Nightmare Mode I
    61391, -- Prey: Nightmare Mode II
    42703, -- Prey: Nightmare Mode III
})

expansion:Named(addon.L["The Arcantina"], { -- The Arcantina
    61081, -- Share a Drink
    61082, -- Old Soldiers
    61083, -- Highly Decorated
})

expansion:Named(addon.L["Abyss Anglers"], { -- Abyss Anglers
    62118, -- Abyss Anglers: Amazardhide Catch Case
    62117, -- Abyss Anglers: Boarhide Catch Sack
    62272, -- Abyss Anglers: Certified Depthdiver
    62208, -- Abyss Anglers: Depth Grease
    62210, -- Abyss Anglers: Depthdiver's Used Tank
    62218, -- Abyss Anglers: Even The Best
    62211, -- Abyss Anglers: Fathom-Tested Tank
    62342, -- Abyss Anglers: The Finest of Fish
    62221, -- Abyss Anglers: Fresh Depth Tech
    62217, -- Abyss Anglers: Idol of the Depths
    62773, -- Abyss Anglers: Jeju's New Rival
    62119, -- Abyss Anglers: Loaknit-Woven Catch Satchel
    62778, -- Abyss Anglers: Luck of the Loa
    62343, -- Abyss Anglers: Myths from Beneath
    62212, -- Abyss Anglers: Nalorakk's Breath Tank
    62219, -- Abyss Anglers: No Sea Can Hold Me
    62774, -- Abyss Anglers: Not Done Yet
    62772, -- Abyss Anglers: Now That's Anglin'
    62761, -- Abyss Anglers: One with the Depths
    62209, -- Abyss Anglers: Pahk Trench Fins
    62777, -- Abyss Anglers: Pearls to the Abyss
    62506, -- Abyss Anglers: Pressurized Eyeglass
    62220, -- Abyss Anglers: Proper Procedure
    62207, -- Abyss Anglers: Reinforced Joints
    62829, -- Abyss Anglers: Don't Know What You Expected
    62832, -- Abyss Anglers: Reservation for One
    62213, -- Abyss Anglers: Shallows Net
    62222, -- Abyss Anglers: The Amani Way
    62762, -- Abyss Anglers: Top of the Class
    62271, -- Abyss Anglers: Trench Berserker
    62214, -- Abyss Anglers: Triple-Thread Net
    62763, -- Abyss Anglers: Vintage Collector
    62760, -- Abyss Anglers: Angler Physics
    62776, -- Abyss Anglers: All Blue Angler (Pet: Ka'bubb)
    62775, -- Abyss Anglers: Delicate Diver
    62759, -- Abyss Anglers: History Below
})

local ritualSites = expansion:Named(CT.RitualSites, { -- Ritual Sites
    62450, -- Ritual Sites 101: An Introduction to Basic Magical Rituals
    62451, -- Ritual Sites 200: Intermediate Ritual Practices
    62452, -- Ritual Sites 320: Ritual Items and Their Uses in Quel'Thalas
    62453, -- Ritual Sites 415: Applied Ritual Strategies
    62454, -- Ritual Sites 505: A Seminar in Void Ritual Nuance
    62940, -- Ritual Sites 612: Practical Ritual Work
    62529, -- Ritual Site Starter
    62530, -- Ritual Site Achiever
    62531, -- Ritual Site Adept
    62532, -- Ritual Site Handler
    62533, -- Ritual Site Master
    62562, -- Ritual Site Disruptor
    62621, -- Challenging Sites
    62622, -- Ritual Renown
    62941, -- Pinnacle Ritual Work
    63182, -- Advanced Ritual Site Studies
})
ritualSites:Named(addon.L["Broken Throne"], {
    62521, -- Ritual Site: Broken Throne
    62523, -- Ritual Site Mastery: Broken Throne
    62524, -- Ritual Site Challenge: Broken Throne
    62525, -- Ritual Site Extreme: Broken Throne
    62534, -- Ritual Site Rogue: Broken Throne
    62536, -- Neighborhood Ritual Watch: Broken Throne
    62537, -- Neighborhood Ritual Team: Broken Throne
})
ritualSites:Named(addon.L["Daggerspine Point"], {
    62522, -- Ritual Site: Daggerspine Point
    62526, -- Ritual Site Mastery: Daggerspine Point
    62527, -- Ritual Site Challenge: Daggerspine Point
    62528, -- Ritual Site Extreme: Daggerspine Point
    62535, -- Ritual Site Rogue: Daggerspine Point
    62538, -- Neighborhood Ritual Watch: Daggerspine Point
    62539, -- Neighborhood Ritual Team: Daggerspine Point
})
ritualSites:Named(addon.L["Challenges"], {
    62540, -- Challenge: Tendrils
    62541, -- Challenge: Tainted Corpses
    62542, -- Challenge: Manifestations
    62543, -- Challenge: Patrols!
    62544, -- Challenge: Magical Alarm Bells
    62545, -- Challenge: Malevolent Boons
    62546, -- Challenge: Reinforced
    62547, -- Challenge: Embers
    62548, -- Expert Challenge: Tendrils
    62549, -- Expert Challenge: Tainted Corpses
    62550, -- Expert Challenge: Manifestations
    62551, -- Expert Challenge: Patrols!
    62552, -- Expert Challenge: Magical Alarm Bells
    62553, -- Expert Challenge: Malevolent Boons
    62554, -- Expert Challenge: Reinforced
    62555, -- Expert Challenge: Embers
    62556, -- Quick Reflexes
    62558, -- Patrol Ambusher
    62559, -- Malevolence Shrugged
    62560, -- Ember Still Burning
    62561, -- Reinforcement Obliteration
})

local voidAssaults = expansion:Named(CT.VoidAssaults, { -- Void Assaults
    62498, -- Void Assault: Eversong
    62507, -- Void Smasher: Eversong
    62508, -- Void Eradicator: Eversong
    62509, -- Void Bane: Eversong
    62499, -- Void Assault: Zul'Aman
    62510, -- Void Smasher: Zul'Aman
    62511, -- Void Eradicator: Zul'Aman
    62512, -- Void Bane: Zul'Aman
    62513, -- Outstanding in the Field
    62518, -- Cosmic Exterminator (Pet: Cappy)
    62563, -- Void Response Team (Mount: Unbound Manawyrm)
    62568, -- Void Shmoid
    62569, -- Traces in the Dark
    62570, -- Cosmic Slayer
    62571, -- Everybody Gets One
    62572, -- Battery Bombardment
    62573, -- Air Traffic Controller
    62574, -- Accolade to Rest
})
voidAssaults:Named(addon.L["Omnium Folio"], {
    62606, -- The Sunstrider Omnium
    63325, -- Omnium Folio Studies
})
voidAssaults:Named(addon.L["Val and Naigtal"], {
    63383, -- Into the Stars
    63384, -- Prepared for a Showdown
    63385, -- A Hal'hadar Walks into a Swamp
    63386, -- Frosty Domanaar Politics
    62880, -- Showdown Success: Val
    62881, -- Showdown Slugger: Val
    62882, -- Showdown Success: Naigtal
    62883, -- Showdown Slugger: Naigtal
    62903, -- Climate Strange: Val
    62904, -- Climate Strange: Naigtal
    62917, -- Heroic Climate Strange: Val
    62919, -- Heroic Climate Strange: Naigtal
    62905, -- Pain of Command
    62909, -- Heroic: Pain of Command
    62887, -- Heroic: Worlds Ahead
    62901, -- Heroic: Power Creep
    63264, -- Heroic Showdowns
    63348, -- Heroic Slugger
    62842, -- A Celestial Pain
    63349, -- Ultradon Carnage
    62873, -- A Trip Around the Stars
    62874, -- A Trip Through the Stars
})