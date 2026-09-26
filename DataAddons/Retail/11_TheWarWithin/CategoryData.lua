local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

local expansion = KrowiAF.NewExpansion(CT.TheWarWithin, {
    40231, -- The War Within Pathfinder
    61451, -- Worldsoul-Searching
    42299, -- Visions of a Shadowed Sun
    61498, -- Ready for Midnight
})

expansion:Character{
    40146, -- War Within Superior
    40147, -- War Within Epic
    19470, -- One Warband Mentor: The War Within
    19460, -- Two Warband Mentors: The War Within
    19475, -- Three Warband Mentors: The War Within
    19476, -- Four Warband Mentors: The War Within
    19477, -- Five Warband Mentors: The War Within
    40107, -- Harbinger of the Weathered
    40115, -- Harbinger of the Carved
    40118, -- Harbinger of the Runed
    40939, -- Harbinger of the Gilded
    40942, -- Weathered of the Undermine
    40943, -- Carved of the Undermine
    40944, -- Runed of the Undermine
    40945, -- Gilded of the Undermined
    41886, -- Weathered of the Ethereal
    41887, -- Carved of the Ethereal
    41888, -- Runed of the Ethereal
    41892, -- Gilded of the Ethereal
}
local zones = expansion:Zones{
    41201, -- You Xal Not Pass
}
local khazAlgar = zones:Zone(2274, {
    41555, -- All That Khaz
})
khazAlgar:Quests{
    20596, -- Loremaster of Khaz Algar
    20597, -- The War Within
    41052, -- Lingering Shadows
    40791, -- Fate of the Kirin Tor
    41818, -- Rise of the Red Dawn
    41820, -- Rise of the Red Dawn
}
khazAlgar:Exploration{
    40430, -- Khaz Algar Flight Master
    40702, -- Khaz Algar Glyph Hunter
    40790, -- Khaz Algar Explorer
    40762, -- Khaz Algar Lore Hunter
    40250, -- The First Echo
    40251, -- Many Echoes
    40252, -- A Series of Echoes
    40222, -- Echoes of Danger
    40314, -- Fragments of Memories
}
khazAlgar:PvP{
    40087, -- Unbound Battle
    40088, -- A Champion's Tour: The War Within
    40089, -- Spoiled Goods
    40090, -- Spoiled Goods
    40091, -- Slightly Spoiled
    40095, -- Sparking Battle
    40096, -- Sparking Battle
    40097, -- Ruffious's Bid
    40465, -- Unbound Bounty
    40468, -- Unbound Glory
    40466, -- Unbound Glory
    40467, -- Unbound Glory
}
khazAlgar:Reputation{
    41169, -- Khaz Algar Diplomat
}
local isleOfDorn = zones:Zone(2248, {
    41186, -- Slate of the Union
})
isleOfDorn:Quests{
    20118, -- The Isle of Dorn
    20595, -- Sojourner of Isle of Dorn
}
isleOfDorn:Exploration{
    40831, -- Explore the Isle of Dorn
    40435, -- Adventurer of the Isle of Dorn
    40434, -- Treasures of the Isle of Dorn
    40166, -- Isle of Dorn Glyph Hunter
    40606, -- Flat Earthen
}
isleOfDorn:PvP{
    40083, -- Tour of Duty: Isle of Dorn
}
isleOfDorn:Reputation{
    41161, -- Council of Dornogal
    41162, -- Cornerstone of Dornogal
}
isleOfDorn:Named(addon.L["Skyriding Races"], {
    40316, -- Isle of Dorn: Bronze
    40317, -- Isle of Dorn: Silver
    40318, -- Isle of Dorn: Gold
    40319, -- Isle of Dorn Advanced: Bronze
    40320, -- Isle of Dorn Advanced: Silver
    40321, -- Isle of Dorn Advanced: Gold
    40322, -- Isle of Dorn Reverse: Bronze
    40323, -- Isle of Dorn Reverse: Silver
    40324, -- Isle of Dorn Reverse: Gold
}):Merge()
local theRingingDeeps = zones:Zone(2214, {
    41187, -- Rage Aside the Machine
})
theRingingDeeps:Quests{
    19560, -- The Ringing Deeps
    40799, -- Sojourner of The Ringing Deeps
    40507, -- Hanging Tight
    40623, -- I Only Need One Trip
    40630, -- For the Collective
}
theRingingDeeps:Exploration{
    40825, -- Explore The Ringing Deeps
    40837, -- Adventurer of The Ringing Deeps
    40724, -- Treasures of The Ringing Deeps
    40703, -- The Ringing Deeps Glyph Hunter
    40628, -- Notable Machines
    40473, -- Not So Quick Fix
    40475, -- To All the Slimes I Love
    40614, -- Gobblin' with Glublurp
    40731, -- Panhandled
    40504, -- Rocked to Sleep
    40585, -- Super Size Snuffling
    40662, -- It's Not Much, But It's Honest Work
}
theRingingDeeps:PvP{
    40084, -- Tour of Duty: The Ringing Deeps
}
theRingingDeeps:Reputation{
    41165, -- Assembly of the Deeps
    41166, -- From Many, One
}
theRingingDeeps:Named(addon.L["Skyriding Races"], {
    40325, -- The Ringing Deeps: Bronze
    40326, -- The Ringing Deeps: Silver
    40327, -- The Ringing Deeps: Gold
    40328, -- The Ringing Deeps Advanced: Bronze
    40329, -- The Ringing Deeps Advanced: Silver
    40330, -- The Ringing Deeps Advanced: Gold
    40331, -- The Ringing Deeps Reverse: Bronze
    40332, -- The Ringing Deeps Reverse: Silver
    40333, -- The Ringing Deeps Reverse: Gold
}):Merge()
local hallowfall = zones:Zone(2215, {
    41188, -- Crystal Chronicled
})
hallowfall:Quests{
    20598, -- Hallowfall
    40844, -- Sojourner of Hallowfall
    20594, -- Flamegard's Hope
    40150, -- Children's Entertainer
    40082, -- Never Enough
    40360, -- Life on the Farm
    40308, -- Beacon of Hope
    40311, -- Sharing the Light
    40312, -- Starting the Flames
    40313, -- Igniting the Keyflames
}
hallowfall:Exploration{
    40826, -- Explore Hallowfall
    40848, -- Treasures of Hallowfall
    40851, -- Adventurer of Hallowfall
    40704, -- Hallowfall Glyph Hunter
    40151, -- Mereldar Menace
    40618, -- Lost and Found
    40625, -- The Missing Lynx
    40622, -- Biblo Archivist
    40729, -- Light's Gambit Champion
}
hallowfall:PvP{
    40085, -- Tour of Duty: Hallowfall
}
hallowfall:Reputation{
    41167, -- Hallowfall Arathi
    41168, -- The Flame Burns Within
}
hallowfall:Named(addon.L["Skyriding Races"], {
    40334, -- Hallowfall: Bronze
    40335, -- Hallowfall: Silver
    40336, -- Hallowfall: Gold
    40337, -- Hallowfall Advanced: Bronze
    40338, -- Hallowfall Advanced: Silver
    40339, -- Hallowfall Advanced: Gold
    40340, -- Hallowfall Reverse: Bronze
    40341, -- Hallowfall Reverse: Silver
    40342, -- Hallowfall Reverse: Gold
}):Merge()
local azjKahet = zones:Zone(2255, {
    41189, -- Azj the World Turns
})
azjKahet:Quests{
    19559, -- Azj-Kahet
    40636, -- Sojourner of Azj-Kahet
    40832, -- Leave it to Weaver
    40833, -- The General's Salute
    40835, -- Vizier than Ever
    40620, -- Back to the Wall
    40869, -- Worm Theory
}
azjKahet:Exploration{
    40822, -- Explore Azj-Kahet
    40828, -- Treasures of Azj-Kahet
    40840, -- Adventurer of Azj-Kahet
    40705, -- Azj-Kahet Glyph Hunter
    40542, -- Smelling History
    40634, -- You Can't Hang With Us
    40624, -- Itsy Bitsy Spider
    40632, -- No Harm Ever Came From Reading A Book
    40843, -- Mine Poppin'
    40629, -- Bookworm
    40727, -- Skittershaw Spin
    40633, -- The Unseeming
}
azjKahet:PvP{
    40086, -- Tour of Duty: Azj-Kahet
}
azjKahet:Reputation{
    41149, -- The Severed Threads
    41164, -- We Rise Anew
    40874, -- The Grand Tapestry
    40875, -- True Strength
    40876, -- Vox Arachni
}
azjKahet:Named(addon.L["Skyriding Races"], {
    40343, -- Azj-Kahet: Bronze
    40344, -- Azj-Kahet: Silver
    40345, -- Azj-Kahet: Gold
    40346, -- Azj-Kahet Advanced: Bronze
    40347, -- Azj-Kahet Advanced: Silver
    40348, -- Azj-Kahet Advanced: Gold
    40349, -- Azj-Kahet Reverse: Bronze
    40350, -- Azj-Kahet Reverse: Silver
    40351, -- Azj-Kahet Reverse: Gold
}):Merge()
local sirenIsle = zones:Zone(2369, {
    41133, -- Isle Remember You
})
sirenIsle:Quests{
    41042, -- Siren-ity Now!
    41043, -- Excavation Projects
    41045, -- A Song of Secrets
    41185, -- Siren's Squall
}
sirenIsle:Exploration{
    41046, -- Clean Up on Isle Siren
    41050, -- A Choir of Citrines
    41131, -- Treasures of the Storm
}
local undermine = zones:Zone(2346, {
    41586, -- Going Goblin Mode
})
undermine:Quests{
    40900, -- Undermined
    40894, -- Sojourner of Undermine
}
undermine:Exploration{
    41587, -- Explore Undermine
    41217, -- Treasures of Undermine
    41216, -- Adventurer of Undermine
    40948, -- Nine-Tenths of the Law
    41588, -- Read Between the Lines
    41589, -- That Can-Do Attitude
    41708, -- You're My Friend Now
    41590, -- No Littering
    41591, -- Really No Littering
    41592, -- Absolutely Zero Littering
    41593, -- Cleanin' the Streets
    41594, -- Can You Believe What People Throw Away?
    41626, -- C.H.E.T.T. a Look
    41627, -- C.H.E.T.T.ing it Twice
    41629, -- C.H.E.T.T.mate
    41630, -- "Employee" of the Month
    41214, -- Under the Echoes
    41215, -- Echoes of Deeper Dangers
}
undermine:PvP{
    41522, -- Tour of Duty: Undermine
}
undermine:Reputation{
    41349, -- In with the Cartels
    41351, -- Cartels Bestie
    41352, -- Trade-Duke
    41086, -- Ally of Undermine
    41350, -- A Long Fuse
}
undermine:Named(addon.L["Skyrocketing Races"], {
    40936, -- Undermine Skyrocketing: Bronze
    40937, -- Undermine Skyrocketing: Silver
    40938, -- Undermine Skyrocketing: Gold
}):Merge()
undermine:Named(addon.L["Breaknecking Races"], {
    41081, -- Undermine Breaknecking: Bronze
    41083, -- Undermine Breaknecking: Silver
    41084, -- Undermine Breaknecking: Gold
}):Merge()
local karesh = zones:Zone(2371, {
    60889, -- Unraveled and Persevering
})
karesh:Quests{
    41970, -- The Knife's Edge
    42739, -- Sojourner of K'aresh
    41808, -- Otherworldly Ecologist
    41809, -- Ecological Variety
    41811, -- Ecological Stability
    41812, -- Expertly Done
    41815, -- Ecological Succession
    41978, -- Moonlighter
    41979, -- Bounty Seeker
    41980, -- Vigilante
    42731, -- Become a Hero. Become a Phasediver!
    42737, -- Capstoned
    61916, -- Rage of the Ren'dorei (Reward: Void Elf Demon Hunter Unlocked)
}
karesh:Exploration{
    42740, -- Explore K'aresh
    42741, -- Treasures of K'aresh
    42761, -- Remnants of a Shattered World
    42727, -- K'aresh Glyph Hunter
    42729, -- Dangerous Prowlers of K'aresh
    42730, -- Jump, Jump, and Away!
    42736, -- Ixthar's Legacy
    42738, -- We've All Got Swords!
    42742, -- Power of the Reshii
    60890, -- Secrets of the K'areshi
    61017, -- Phase-Lost-and-Found
}
karesh:PvP{
    42131, -- Tour of Duty: K'aresh
}
karesh:Reputation{
    42022, -- A Trusted Partner
}
karesh:Named(addon.L["Skyriding Races"], {
    41778, -- Brokers Don't Care How You Win
}):Merge()
local delves = expansion:Delves{
    40631, -- War Within Delves: Tier 1
    40512, -- War Within Delves: Tier 2
    40514, -- War Within Delves: Tier 3
    40725, -- War Within Delves: Endgame
    40515, -- War Within Delves: Tier 4 (Season 1)
    40516, -- War Within Delves: Tier 5 (Season 1)
    40517, -- War Within Delves: Tier 6 (Season 1)
    40518, -- War Within Delves: Tier 7 (Season 1)
    40519, -- War Within Delves: Tier 8 (Season 1)
    40520, -- War Within Delves: Tier 9 (Season 1)
    40521, -- War Within Delves: Tier 10 (Season 1)
    40726, -- War Within Delves: Tier 11 (Season 1)
    41191, -- War Within Delves: Tier 4 (Season 2)
    41192, -- War Within Delves: Tier 5 (Season 2)
    41198, -- War Within Delves: Tier 6 (Season 2)
    41193, -- War Within Delves: Tier 7 (Season 2)
    41194, -- War Within Delves: Tier 8 (Season 2)
    41195, -- War Within Delves: Tier 9 (Season 2)
    41196, -- War Within Delves: Tier 10 (Season 2)
    41197, -- War Within Delves: Tier 11 (Season 2)
    42196, -- War Within Delves: Tier 4 (Season 3)
    42197, -- War Within Delves: Tier 5 (Season 3)
    42198, -- War Within Delves: Tier 6 (Season 3)
    42199, -- War Within Delves: Tier 7 (Season 3)
    42200, -- War Within Delves: Tier 8 (Season 3)
    42201, -- War Within Delves: Tier 9 (Season 3)
    42202, -- War Within Delves: Tier 10 (Season 3)
    42203, -- War Within Delves: Tier 11 (Season 3)
    40537, -- Delve Loremaster: War Within
    40506, -- Leave No Treasure Unfound
    40445, -- Sporesweeper
    40446, -- I TAKE Candle!
    40452, -- Just Keep Swimming
    40453, -- Spider Senses
    40454, -- Daystormer
    40438, -- Glory of the Delver
    40437, -- Delver of the Depths
    40447, -- Delver of the Depths II
    40448, -- Delver of the Depths III
    40449, -- Delver of the Depths IV
    40455, -- Buddy System
    40450, -- Buddy System II
    40451, -- Buddy System III
    40456, -- Buddy System IV
    40457, -- Buddy System V
    40461, -- Buddy System VI
    41537, -- Buddy System VII
    41723, -- Buddy System VIII
    61342, -- Buddy System IX
    42676, -- Buddy System X
    40100, -- Undying Caver
    40098, -- Immortal Spelunker
    40459, -- I've Got a Flying Machine!
    40789, -- Flying in Style
    41532, -- I've Got a Flying Machine?
    41714, -- From Trash to Treasure
    42677, -- This Machine Flies?! Don't Care I Got It!
    42678, -- So That's Where My Manaflux Capacitor Was!
    40524, -- Good Deed Delver
    40763, -- I'm not a Thief, I'm a Treasure Hunter
    41097, -- Curiosity Never Killed the Looter
    40458, -- Stranger Delves
    40538, -- Brann Development
    40820, -- Raisin' Brann
    40523, -- On Brand
    40635, -- Branntastic
    41106, -- Algari Delver Damage Dealer
    41109, -- Algari Delver Damage Dealer II
    41110, -- Algari Delver Damage Dealer III
    41107, -- Algari Delver Healer
    41111, -- Algari Delver Healer II
    41112, -- Algari Delver Healer III
    41108, -- Algari Delver Tank
    41113, -- Algari Delver Tank II
    41114, -- Algari Delver Tank III
    41115, -- Algari Delver
    41116, -- Algari Delver II
    41709, -- Journey's End (Season 2)
    42212, -- Titan Console Overcharged
    42241, -- Overcharged Delver
    42801, -- Journey's End (Season 3)
    60934, -- With Flying Colors
    60933, -- With Flying Colors
    42799, -- Let Her Solo Me
    42778, -- A Flicker in the Dark
    42779, -- A Flash in the Void
}
delves:Delve(7864, {
    40525, -- Fungal Folly Stories
    40803, -- Fungal Folly Discoveries
})
delves:Delve(7865, {
    40526, -- Kriegval's Rest Stories
    40807, -- Kriegval's Rest Discoveries
})
delves:Delve(7863, {
    40527, -- Earthcrawl Mines Stories
    40806, -- Earthcrawl Mines Discoveries
})
delves:Delve(7866, {
    40528, -- The Waterworks Stories
    40816, -- The Waterworks Discoveries
})
delves:Delve(7867, {
    40529, -- The Dread Pit Stories
    40812, -- The Dread Pit Discoveries
})
delves:Delve(7868, {
    40530, -- Nightfall Sanctum Stories
    40809, -- Nightfall Sanctum Discoveries
})
delves:Delve(7869, {
    40531, -- Mycomancer Cavern Stories
    40808, -- Mycomancer Cavern Discoveries
})
delves:Delve(7870, {
    40532, -- The Sinkhole Stories
    40813, -- The Sinkhole Discoveries
})
delves:Delve(7871, {
    40533, -- Skittering Breach Stories
    40810, -- Skittering Breach Discoveries
})
delves:Delve(7872, {
    40534, -- The Underkeep Stories
    40815, -- The Underkeep Discoveries
})
delves:Delve(7873, {
    40535, -- Tak-Rethan Abyss Stories
    40811, -- Tak-Rethan Abyss Discoveries
})
delves:Delve(7874, {
    40536, -- The Spiral Weave Stories
    40814, -- The Spiral Weave Discoveries
})
delves:Delve(7875, {
    40732, -- Heavy-Handed
    40103, -- My First Nemesis
    40431, -- Hunting the Hunter
    40433, -- Let Me Solo Him: Zekvir
})
delves:Delve(8143, {
    41098, -- Excavation Site 9 Stories
    41100, -- Excavation Site 9 Discoveries
})
delves:Delve(8140, {
    41099, -- Sidestreet Sluice Stories
    41101, -- Sidestreet Sluice Discoveries
})
delves:Delve(8142, {
    40732, -- Heavy-Handed
    41530, -- My New Nemesis
    41529, -- Breaking the Bank
    41210, -- Let Me Solo Him: The Underpin
    41531, -- The Hataclysm
})
delves:Delve(8274, {
    42771, -- Archival Assault Stories
    42679, -- Archival Assault Discoveries
})
delves:Delve(8323, {
    40732, -- Heavy-Handed
    42193, -- My Stab-Happy Nemesis
    42194, -- Pruning the Princess
    42190, -- Let Me Solo Her: Nexus-Princess Ky'veza
})
local dungeons = expansion:Dungeons{
    61565, -- War Within Dungeon Hero (Pet: Moss Skipper)
    61566, -- Glory of the War Within Hero
    40141, -- Algari Dungeon Tank
    40140, -- Algari Dungeon Healer
    40139, -- Algari Dungeon Damage Dealer
    40138, -- Algari Dungeoneer
}
dungeons:MythicPlus(shared.GetTheWarWithinMythicPlus)
dungeons:Dungeon(1271, {
    40370, -- Ara-Kara, City of Echoes
    40374, -- Heroic: Ara-Kara, City of Echoes
    40375, -- Mythic: Ara-Kara, City of Echoes
    20586, -- Keystone Hero: Ara-Kara, City of Echoes
})
dungeons:Dungeon(1272, {
    40361, -- Cinderbrew Meadery
    40363, -- Heroic: Cinderbrew Meadery
    40366, -- Mythic: Cinderbrew Meadery
    20583, -- Keystone Hero: Cinderbrew Meadery
})
dungeons:Dungeon(1274, {
    40376, -- City of Threads
    40377, -- Heroic: City of Threads
    40379, -- Mythic: City of Threads
    20582, -- Keystone Hero: City of Threads
})
dungeons:Dungeon(1210, {
    40427, -- Darkflame Cleft
    40428, -- Heroic: Darkflame Cleft
    40429, -- Mythic: Darkflame Cleft
    20584, -- Keystone Hero: Darkflame Cleft
})
dungeons:Dungeon(1267, {
    40590, -- Priory of the Sacred Flame
    40592, -- Heroic: Priory of the Sacred Flame
    40596, -- Mythic: Priory of the Sacred Flame
    20581, -- Keystone Hero: Priory of the Sacred Flame
})
dungeons:Dungeon(1270, {
    40599, -- The Dawnbreaker
    40601, -- Heroic: The Dawnbreaker
    40604, -- Mythic: The Dawnbreaker
    20585, -- Keystone Hero: The Dawnbreaker
})
dungeons:Dungeon(1268, {
    40621, -- The Rookery
    40637, -- Heroic: The Rookery
    40642, -- Mythic: The Rookery
    20579, -- Keystone Hero: The Rookery
})
dungeons:Dungeon(1269, {
    40643, -- The Stonevault
    40644, -- Heroic: The Stonevault
    40648, -- Mythic: The Stonevault
    20580, -- Keystone Hero: The Stonevault
})
dungeons:Dungeon(1298, {
    41339, -- Operation: Floodgate
    41340, -- Heroic: Operation: Floodgate
    41341, -- Mythic: Operation: Floodgate
    41348, -- Keystone Hero: Operation: Floodgate
})
dungeons:Dungeon(1303, {
    42780, -- Eco-Dome Al'dani
    42781, -- Heroic: Eco-Dome Al'dani
    42782, -- Mythic: Eco-Dome Al'dani
    42173, -- Keystone Hero: Eco-Dome Al'dani
})
local raids = expansion:Raids{
    40232, -- Glory of the Nerub-ar Raider
    41286, -- Glory of the Liberation of Undermine Raider
    41597, -- Glory of the Omega Raider
}
local nerubArPalace = raids:Raid(1273, {
    40247, -- The Skittering Battlements
    40248, -- Secrets of Nerub-ar Palace
    40249, -- A Queen's Fall
    40244, -- Nerub-ar Palace
    40245, -- Heroic: Nerub-ar Palace
    40246, -- Mythic: Nerub-ar Palace
    40253, -- Ahead of the Curve: Queen Ansurek
    40254, -- Cutting Edge: Queen Ansurek
    40469, -- I'm Bringing Nerub-ack
    40660, -- The War Within Season 1: Spelunker Supreme
    40723, -- Web-Wrapped in the Finest Silks
})
nerubArPalace:Glory{
    40261, -- Slimy Yet Satisfying
    40260, -- You Can't See Me
    40255, -- Sik Parry Bro
    40262, -- Cowabunga
    40263, -- Would You Still /love Me if I Was a Worm...
    40264, -- Kill Streak
    40730, -- Love is in the Lair
    40266, -- Missed 'Em by That Much
}
nerubArPalace:Mythic{
    40236, -- Mythic: Ulgrax the Devourer
    40237, -- Mythic: The Bloodbound Horror
    40238, -- Mythic: Sikran, Captain of the Sureki
    40239, -- Mythic: Rasha'nan
    40240, -- Mythic: Broodtwister Ovi'nax
    40241, -- Mythic: Nexus-Princess Ky'veza
    40242, -- Mythic: The Silken Court
    40243, -- Mythic: Queen Ansurek
}
local liberationOfUndermine = raids:Raid(1296, {
    41225, -- Shock and Awesome
    41226, -- Maniacal Machinist
    41227, -- Beating the Odds
    41228, -- Fall of the Chrome King
    41222, -- Liberation of Undermine
    41223, -- Heroic: Liberation of Undermine
    41224, -- Mythic: Liberation of Undermine
    41298, -- Ahead of the Curve: Chrome King Gallywix
    41297, -- Cutting Edge: Chrome King Gallywix
    41694, -- Flarendo's Biggest Fan
    41695, -- Torq's Biggest Fan
    41211, -- A Good Day to Dye Hard
    41525, -- Can You Please Spell "Gobanna?"
    40911, -- The War Within Season 2: Master Blaster
    41665, -- Dressed to the Mines
})
liberationOfUndermine:Glory{
    41208, -- Hold My Gear!
    41554, -- The Splash Zone
    41338, -- Just /Dance
    41596, -- Garbage In, Garbage Out
    41711, -- Conveyor Slayer
    41119, -- One Rank Higher
    41120, -- Two Ranks Higher
    41121, -- Three Ranks Higher
    41122, -- Best In Class
    41337, -- Sleep with the Fishes
    41347, -- Scheming on a Thing
}
liberationOfUndermine:Mythic{
    41229, -- Mythic: Vexie and the Geargrinders
    41230, -- Mythic: Cauldron of Carnage
    41231, -- Mythic: Rik Reverb
    41232, -- Mythic: Stix Bunkjunker
    41233, -- Mythic: Sprocketmonger Lockenstock
    41234, -- Mythic: The One-Armed Bandit
    41235, -- Mythic: Mug'Zee, Heads of Security
    41236, -- Mythic: Chrome King Gallywix
}
liberationOfUndermine:Named(CT.Reputation, {
    60939, -- Bringing Down the House
}):Merge()
local manaforgeOmega = raids:Raid(1302, {
    41601, -- Might of the Shadowguard
    41602, -- Monsters of the Sands
    41603, -- Heart of Darkness
    41598, -- Manaforge Omega
    41599, -- Heroic: Manaforge Omega
    41600, -- Mythic: Manaforge Omega
    41624, -- Ahead of the Curve: Dimensius, the All-Devouring
    41625, -- Cutting Edge: Dimensius, the All-Devouring
    42316, -- Fractals? For Spring? Groundbreaking.
    41937, -- The War Within Season 3: Voidborne Victor
    42325, -- Void Wear Prohibited
})
manaforgeOmega:Glory{
    42118, -- Of Mice and Manaforges
    41613, -- Time to Vote! Cute or Scary?
    41614, -- Mother of All Tantrums
    41615, -- Cheat Meal
    41616, -- I See... Absolutely Nothing
    41617, -- Breaking the Fourth Wall
    41618, -- King's Ransom
    41619, -- Defying Gravity
}
manaforgeOmega:Mythic{
    41604, -- Mythic: Plexus Sentinel
    41605, -- Mythic: Loom'ithar
    41606, -- Mythic: Soulbinder Naazindhri
    41607, -- Mythic: Forgeweaver Araz
    41608, -- Mythic: The Soul Hunters
    41609, -- Mythic: Fractillus
    41610, -- Mythic: Nexus-King Salhadaar
    41611, -- Mythic: Dimensius, the All-Devouring
}
manaforgeOmega:Named(CT.Reputation, {
    60940, -- Vandals! In! Space!
}):Merge()
local professions = expansion:Professions{
    19408, -- Professional Algari Master
    19409, -- Working Underground
    19515, -- Algari Master of Many
    19410, -- Algari Master of All
    62369, -- The Lumberjack Within
}
professions:Alchemy{
    19704, -- Overflowing Algari Flasks
    19716, -- Plentiful Algari Potions
}
professions:Cooking{
    19414, -- Algari Cook
}
professions:Fishing{
    19415, -- Algari Fisherman
    40476, -- 10 Algari Seekerthread
    40480, -- 20 Algari Seekerthread
    40484, -- 30 Algari Seekerthread
    40485, -- 40 Algari Seekerthread
    40487, -- 50 Algari Seekerthread
    40488, -- 60 Algari Seekerthread
    40489, -- 70 Algari Seekerthread
    40490, -- 80 Algari Seekerthread
    40491, -- 90 Algari Seekerthread
    40492, -- 100 Algari Seekerthread
    40494, -- 10 Algari Anglerthread
    40495, -- 20 Algari Anglerthread
    40497, -- 30 Algari Anglerthread
    40499, -- 40 Algari Anglerthread
    40502, -- 50 Algari Anglerthread
    40496, -- 60 Algari Anglerthread
    40498, -- 70 Algari Anglerthread
    40500, -- 80 Algari Anglerthread
    40503, -- 90 Algari Anglerthread
    40501, -- 100 Algari Anglerthread
    40539, -- The Derby Dash
}
expansion:PetBattles{
    40194, -- Khaz Algar Safari
    40153, -- Battle on Khaz Algar
    40154, -- Aquatic Battler of Khaz Algar
    40155, -- Beast Battler of Khaz Algar
    40156, -- Critter Battler of Khaz Algar
    40157, -- Dragonkin Battler of Khaz Algar
    40158, -- Elemental Battler of Khaz Algar
    40161, -- Flying Battler of Khaz Algar
    40162, -- Humanoid Battler of Khaz Algar
    40163, -- Magic Battler of Khaz Algar
    40164, -- Mechanical Battler of Khaz Algar
    40165, -- Undead Battler of Khaz Algar
    40980, -- Family Battler of Khaz Algar
    41092, -- Undermine Safari
    41542, -- Aquatic Battler of Undermine
    41543, -- Beast Battler of Undermine
    41541, -- Critter Battler of Undermine
    41544, -- Dragonkin Battler of Undermine
    41545, -- Elemental Battler of Undermine
    41546, -- Flying Battler of Undermine
    41547, -- Humanoid Battler of Undermine
    41548, -- Magic Battler of Undermine
    41549, -- Mechanical Battler of Undermine
    41550, -- Undead Battler of Undermine
    41551, -- Family Battler of Undermine
}
local skyridingRaces = expansion:Named(addon.L["Skyriding Races"], {
    40352, -- Khaz Algar Completionist: Bronze
    40353, -- Khaz Algar Completionist: Silver
    40354, -- Khaz Algar Completionist: Gold
})
skyridingRaces:Named(addon.GetMapName(2248), {
    40316, -- Isle of Dorn: Bronze
    40317, -- Isle of Dorn: Silver
    40318, -- Isle of Dorn: Gold
    40319, -- Isle of Dorn Advanced: Bronze
    40320, -- Isle of Dorn Advanced: Silver
    40321, -- Isle of Dorn Advanced: Gold
    40322, -- Isle of Dorn Reverse: Bronze
    40323, -- Isle of Dorn Reverse: Silver
    40324, -- Isle of Dorn Reverse: Gold
})
skyridingRaces:Named(addon.GetMapName(2214), {
    40325, -- The Ringing Deeps: Bronze
    40326, -- The Ringing Deeps: Silver
    40327, -- The Ringing Deeps: Gold
    40328, -- The Ringing Deeps Advanced: Bronze
    40329, -- The Ringing Deeps Advanced: Silver
    40330, -- The Ringing Deeps Advanced: Gold
    40331, -- The Ringing Deeps Reverse: Bronze
    40332, -- The Ringing Deeps Reverse: Silver
    40333, -- The Ringing Deeps Reverse: Gold
})
skyridingRaces:Named(addon.GetMapName(2215), {
    40334, -- Hallowfall: Bronze
    40335, -- Hallowfall: Silver
    40336, -- Hallowfall: Gold
    40337, -- Hallowfall Advanced: Bronze
    40338, -- Hallowfall Advanced: Silver
    40339, -- Hallowfall Advanced: Gold
    40340, -- Hallowfall Reverse: Bronze
    40341, -- Hallowfall Reverse: Silver
    40342, -- Hallowfall Reverse: Gold
})
skyridingRaces:Named(addon.GetMapName(2255), {
    40343, -- Azj-Kahet: Bronze
    40344, -- Azj-Kahet: Silver
    40345, -- Azj-Kahet: Gold
    40346, -- Azj-Kahet Advanced: Bronze
    40347, -- Azj-Kahet Advanced: Silver
    40348, -- Azj-Kahet Advanced: Gold
    40349, -- Azj-Kahet Reverse: Bronze
    40350, -- Azj-Kahet Reverse: Silver
    40351, -- Azj-Kahet Reverse: Gold
})
local skyrocketingRaces = expansion:Named(addon.L["Skyrocketing Races"])
skyrocketingRaces:Named(addon.GetMapName(2346), {
    40936, -- Undermine Skyrocketing: Bronze
    40937, -- Undermine Skyrocketing: Silver
    40938, -- Undermine Skyrocketing: Gold
})
local breakneckingRaces = expansion:Named(addon.L["Breaknecking Races"])
breakneckingRaces:Named(addon.GetMapName(2346), {
    41081, -- Undermine Breaknecking: Bronze
    41083, -- Undermine Breaknecking: Silver
    41084, -- Undermine Breaknecking: Gold
})
expansion:Named(addon.L["Horrific Visions Revisited"], {
    41853, -- Horrific Vision of Stormwind
    41854, -- The Even More Horrific Vision of Stormwind
    41855, -- The Most Horrific Vision of Stormwind
    41964, -- Beyond the Most Horrific Vision of Stormwind
    41875, -- Horrific Vision of Orgrimmar
    41876, -- The Even More Horrific Vision of Orgrimmar
    41879, -- The Most Horrific Vision of Orgrimmar
    41965, -- Beyond the Most Horrific Vision of Orgrimmar
    41725, -- We Have the Memories
    41928, -- Reeking of Visions
    41929, -- Through the Depths of Visions
    41966, -- Mastering the Visions
    41857, -- Masked Soliloquy
    41858, -- Masked Sextet
    41859, -- Thanks For The Mementos
    41896, -- Memento Mori
    41983, -- Memento Mania
    41897, -- A Monumental Amount of Mementos
    41898, -- A Mountain of Mementos
    41873, -- Incremental Progress
    41889, -- Horrific Masquerade
    41890, -- Masked Duet
    41891, -- Masked Trio
    41893, -- Masked Quartet
    41874, -- Symphony of Masks
    41894, -- Masked Septet
    41895, -- Orchestra of Masks
    41953, -- Mad World
    41971, -- Through the Looking Glass
})