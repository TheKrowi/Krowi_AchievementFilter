local _, addon = ...;
local shared = addon.Data.ZoneData.Shared;

local delves = {
    40436, -- You're Getting a Delve!
    40460, -- Delve Deep
    40462, -- Delve Deeper
    40463, -- Delve Deepest
    41095, -- Delve Beyond
    41096, -- Delve Infinite
    40819, -- Ready to Turn
    40788, -- I Got the Keys
    40882, -- Copious Coffers
    40885, -- The Key to Madness
    40817, -- A Delver's Bounty
    40863, -- Perplexing Puzzle
    40864, -- Plentiful Perplexing Puzzles
    41105, -- Prodigious Plentiful Perplexing Puzzles
};

local delvesTheWarWithin = {
    delves,
    40631, -- War Within Delves: Tier 1
    40512, -- War Within Delves: Tier 2
    40514, -- War Within Delves: Tier 3
    40725, -- War Within Delves: Endgame
    40537, -- Delve Loremaster: War Within
    40506, -- Leave No Treasure Unfound
    40445, -- Sporesweeper
    40446, -- I TAKE Candle!
    40452, -- Just Keep Swimming
    40453, -- Spider Senses
    40454, -- Daystormer
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
    40100, -- Undying Caver
    40098, -- Immortal Spelunker
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
};

local delvesTheWarWithinS1Progress = {
    40515, -- War Within Delves: Tier 4 (Season 1)
    40516, -- War Within Delves: Tier 5 (Season 1)
    40517, -- War Within Delves: Tier 6 (Season 1)
    40518, -- War Within Delves: Tier 7 (Season 1)
    40519, -- War Within Delves: Tier 8 (Season 1)
    40520, -- War Within Delves: Tier 9 (Season 1)
    40521, -- War Within Delves: Tier 10 (Season 1)
    40726, -- War Within Delves: Tier 11 (Season 1)
};

local delvesTheWarWithinS1 = {
    delvesTheWarWithin,
    delvesTheWarWithinS1Progress,
    40459, -- I've Got a Flying Machine!
    40789, -- Flying in Style
    40438, -- Glory of the Delver
};

local delvesTheWarWithinS2Progress = {
    41191, -- War Within Delves: Tier 4 (Season 2)
    41192, -- War Within Delves: Tier 5 (Season 2)
    41198, -- War Within Delves: Tier 6 (Season 2)
    41193, -- War Within Delves: Tier 7 (Season 2)
    41194, -- War Within Delves: Tier 8 (Season 2)
    41195, -- War Within Delves: Tier 9 (Season 2)
    41196, -- War Within Delves: Tier 10 (Season 2)
    41197, -- War Within Delves: Tier 11 (Season 2)
};

local delvesTheWarWithinS2 = {
    delvesTheWarWithin,
    delvesTheWarWithinS2Progress
};

local horrificVisionsRevisited = {
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
    41874, -- Symphony of Masks
    41889, -- Horrific Masquerade
    41890, -- Masked Duet
    41891, -- Masked Trio
    41893, -- Masked Quartet
    41894, -- Masked Septet
    41895, -- Orchestra of Masks
    41953, -- Mad World
    41971, -- Through the Looking Glass
};

KrowiAF.ZoneData.TheWarWithin = {
    { -- Azj-Kahet (zone)
        {2213, 2216, 2255, 2256},
        {
            19559, -- Azj-Kahet
            40636, -- Sojourner of Azj-Kahet
            40832, -- Leave it to Weaver
            40833, -- The General's Salute
            40835, -- Vizier than Ever
            40620, -- Back to the Wall
            40869, -- Worm Theory
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
            40086, -- Tour of Duty: Azj-Kahet
            41149, -- The Severed Threads
            41164, -- We Rise Anew
            40874, -- The Grand Tapestry
            40875, -- True Strength
            40876, -- Vox Arachni
            41189, -- Azj the World Turns
            40343, -- Azj-Kahet: Bronze
            40344, -- Azj-Kahet: Silver
            40345, -- Azj-Kahet: Gold
            40346, -- Azj-Kahet Advanced: Bronze
            40347, -- Azj-Kahet Advanced: Silver
            40348, -- Azj-Kahet Advanced: Gold
            40349, -- Azj-Kahet Reverse: Bronze
            40350, -- Azj-Kahet Reverse: Silver
            40351, -- Azj-Kahet Reverse: Gold
        }
    },
    { -- The Ringing Deeps (zone)
        2214,
        {
            19560, -- The Ringing Deeps
            40799, -- Sojourner of The Ringing Deeps
            40507, -- Hanging Tight
            40623, -- I Only Need One Trip
            40630, -- For the Collective
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
            40084, -- Tour of Duty: The Ringing Deeps
            41165, -- Assembly of the Deeps
            41166, -- From Many, One
            41187, -- Rage Aside the Machine
            40325, -- The Ringing Deeps: Bronze
            40326, -- The Ringing Deeps: Silver
            40327, -- The Ringing Deeps: Gold
            40328, -- The Ringing Deeps Advanced: Bronze
            40329, -- The Ringing Deeps Advanced: Silver
            40330, -- The Ringing Deeps Advanced: Gold
            40331, -- The Ringing Deeps Reverse: Bronze
            40332, -- The Ringing Deeps Reverse: Silver
            40333, -- The Ringing Deeps Reverse: Gold
        }
    },
    { -- Hallowfall (zone)
        2215,
        {
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
            40826, -- Explore Hallowfall
            40848, -- Treasures of Hallowfall
            40851, -- Adventurer of Hallowfall
            40704, -- Hallowfall Glyph Hunter
            40151, -- Mereldar Menace
            40618, -- Lost and Found
            40625, -- The Missing Lynx
            40622, -- Biblo Archivist
            40729, -- Light's Gambit Champion
            40085, -- Tour of Duty: Hallowfall
            41167, -- Hallowfall Arathi
            41168, -- The Flame Burns Within
            41188, -- Crystal Chronicled
            40334, -- Hallowfall: Bronze
            40335, -- Hallowfall: Silver
            40336, -- Hallowfall: Gold
            40337, -- Hallowfall Advanced: Bronze
            40338, -- Hallowfall Advanced: Silver
            40339, -- Hallowfall Advanced: Gold
            40340, -- Hallowfall Reverse: Bronze
            40341, -- Hallowfall Reverse: Silver
            40342, -- Hallowfall Reverse: Gold
        }
    },
    { -- Isle of Dorn (zone)
        {2248, 2322, 2339, 2367, 2368},
        {
            20118, -- The Isle of Dorn
            20595, -- Sojourner of Isle of Dorn
            40831, -- Explore the Isle of Dorn
            40435, -- Adventurer of the Isle of Dorn
            40434, -- Treasures of the Isle of Dorn
            40166, -- Isle of Dorn Glyph Hunter
            40606, -- Flat Earthen
            40083, -- Tour of Duty: Isle of Dorn
            41161, -- Council of Dornogal
            41162, -- Cornerstone of Dornogal
            41186, -- Slate of the Union
            40316, -- Isle of Dorn: Bronze
            40317, -- Isle of Dorn: Silver
            40318, -- Isle of Dorn: Gold
            40319, -- Isle of Dorn Advanced: Bronze
            40320, -- Isle of Dorn Advanced: Silver
            40321, -- Isle of Dorn Advanced: Gold
            40322, -- Isle of Dorn Reverse: Bronze
            40323, -- Isle of Dorn Reverse: Silver
            40324, -- Isle of Dorn Reverse: Gold
        }
    },
    { -- Fungal Folly (delve)
        2249,
        {
            delvesTheWarWithinS1,
            40525, -- Fungal Folly Stories
            40803, -- Fungal Folly Discoveries,
            delvesTheWarWithinS2Progress
        }
    },
    { -- Kriegval's Rest (delve)
        2250,
        {
            delvesTheWarWithinS1,
            40526, -- Kriegval's Rest Stories
            40807, -- Kriegval's Rest Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- The Waterworks (delve)
        2251,
        {
            delvesTheWarWithinS1,
            40528, -- The Waterworks Stories
            40816, -- The Waterworks Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Tak-Rethan Abyss (delve)
        2259,
        {
            delvesTheWarWithinS1,
            40535, -- Tak-Rethan Abyss Stories
            40811, -- Tak-Rethan Abyss Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Earthcrawl Mines (delve)
        2269,
        {
            delvesTheWarWithinS1,
            40527, -- Earthcrawl Mines Stories
            40806, -- Earthcrawl Mines Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Nightfall Sanctum (delve)
        2277,
        {
            delvesTheWarWithinS1,
            40530, -- Nightfall Sanctum Stories
            40809, -- Nightfall Sanctum Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Nerub-ar Palace (raid)
        {2291, 2292, 2293, 2294, 2295, 2296},
        {
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
            40261, -- Slimy Yet Satisfying
            40260, -- You Can't See Me
            40255, -- Sik Parry Bro
            40262, -- Cowabunga
            40263, -- Would You Still /love Me if I Was a Worm...
            40264, -- Kill Streak
            40730, -- Love is in the Lair
            40266, -- Missed 'Em by That Much
            40232, -- Glory of the Nerub-ar Raider
            40236, -- Mythic: Ulgrax the Devourer
            40237, -- Mythic: The Bloodbound Horror
            40238, -- Mythic: Sikran, Captain of the Sureki
            40239, -- Mythic: Rasha'nan
            40240, -- Mythic: Broodtwister Ovi'nax
            40241, -- Mythic: Nexus-Princess Ky'veza
            40242, -- Mythic: The Silken Court
            40243, -- Mythic: Queen Ansurek
        }
    },
    { -- The Underkeep (delve)
        2299,
        {
            delvesTheWarWithinS1,
            40534, -- The Underkeep Stories
            40815, -- The Underkeep Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- The Sinkhole (delve)
        2301,
        {
            delvesTheWarWithinS1,
            40532, -- The Sinkhole Stories
            40813, -- The Sinkhole Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- The Dread Pit (delve)
        2302,
        {
            delvesTheWarWithinS1,
            40529, -- The Dread Pit Stories
            40812, -- The Dread Pit Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Darkflame Cleft (dungeon)
        2303,
        {
            40427, -- Darkflame Cleft
            40428, -- Heroic: Darkflame Cleft
            40429, -- Mythic: Darkflame Cleft
            20584, -- Keystone Hero: Darkflame Cleft
        },
    },
    { -- Priori of the Sacred Flame (dungeon)
        {2308, 2309},
        {
            40590, -- Priory of the Sacred Flame
            40592, -- Heroic: Priory of the Sacred Flame
            40596, -- Mythic: Priory of the Sacred Flame
            20581, -- Keystone Hero: Priory of the Sacred Flame
        },
    },
    { -- Skittering Breach (delve)
        2310,
        {
            delvesTheWarWithinS1,
            40533, -- Skittering Breach Stories
            40810, -- Skittering Breach Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Mycomancer Cavern (delve)
        2312,
        {
            delvesTheWarWithinS1,
            40531, -- Mycomancer Cavern Stories
            40808, -- Mycomancer Cavern Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- The Rookery (dungeon)
        {2315, 2316, 2317, 2318, 2319, 2320},
        {
            40621, -- The Rookery
            40637, -- Heroic: The Rookery
            40642, -- Mythic: The Rookery
            20579, -- Keystone Hero: The Rookery
        },
    },
    { -- Isle of Dorn - The Proscenium (zone)
        2328,
        {
            40859, -- We're Here All Night
            40860, -- A Star of Dorn
        }
    },
    { -- Cinderbrew Meadery (dungeon)
        2335,
        {
            40361, -- Cinderbrew Meadery
            40363, -- Heroic: Cinderbrew Meadery
            40366, -- Mythic: Cinderbrew Meadery
            20583, -- Keystone Hero: Cinderbrew Meadery
        },
    },
    { -- The Stonevault (dungeon)
        2341,
        {
            40643, -- The Stonevault
            40644, -- Heroic: The Stonevault
            40648, -- Mythic: The Stonevault
            20580, -- Keystone Hero: The Stonevault
        },
    },
    { -- City of Threads (dungeon)
        {2343, 2344},
        {
            40376, -- City of Threads
            40377, -- Heroic: City of Threads
            40379, -- Mythic: City of Threads
            20582, -- Keystone Hero: City of Threads
        },
    },
    { -- Undermine (zone)
        2346,
        {
            40900, -- Undermined
            40894, -- Sojourner of Undermine
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
            41522, -- Tour of Duty: Undermine
            41349, -- In with the Cartels
            41351, -- Cartels Bestie
            41352, -- Trade-Duke
            41086, -- Ally of Undermine
            41350, -- A Long Fuse
            41586, -- Going Goblin Mode
            40936, -- Undermine Skyrocketing: Bronze
            40937, -- Undermine Skyrocketing: Silver
            40938, -- Undermine Skyrocketing: Gold
            41081, -- Undermine Breaknecking: Bronze
            41083, -- Undermine Breaknecking: Silver
            41084, -- Undermine Breaknecking: Gold
        }
    },
    { -- The Spiral Weave (delve)
        2347,
        {
            delvesTheWarWithinS1,
            40536, -- The Spiral Weave Stories
            40814, -- The Spiral Weave Discoveries
            delvesTheWarWithinS2Progress
        }
    },
    { -- Zekvir's Lair (delve)
        2348,
        {
            delvesTheWarWithinS1,
            40732, -- Heavy-Handed
            40103, -- My First Nemesis
            40431, -- Hunting the Hunter
            40433, -- Let Me Solo Him: Zekvir
            delvesTheWarWithinS2Progress
        }
    },
    { -- Ara-Kara, City of Echoes (dungeon)
        {2357, 2358},
        {
            40370, -- Ara-Kara, City of Echoes
            40374, -- Heroic: Ara-Kara, City of Echoes
            40375, -- Mythic: Ara-Kara, City of Echoes
            20586, -- Keystone Hero: Ara-Kara, City of Echoes
        },
    },
    { -- The Dawnbreaker (dungeon)
        2359,
        {
            40599, -- The Dawnbreaker
            40601, -- Heroic: The Dawnbreaker
            40604, -- Mythic: The Dawnbreaker
            20585, -- Keystone Hero: The Dawnbreaker
        },
    },
    { -- Siren Isle (zone)
        {2369, 2375},
        {
            41042, -- Siren-ity Now!
            41043, -- Excavation Projects
            41045, -- A Song of Secrets
            41185, -- Siren's Squall
            41046, -- Clean Up on Isle Siren
            41050, -- A Choir of Citrines
            41131, -- Treasures of the Storm
            41133, -- Isle Remember You
        }
    },
    { -- Operation: Floodgate (dungeon)
        {2387, 2388},
        {
            41339, -- Operation: Floodgate
            41340, -- Heroic: Operation: Floodgate
            41341, -- Mythic: Operation: Floodgate
            41348, -- Keystone Hero: Operation: Floodgate
        },
    },
    { -- Excavation Site 9 (delve)
        2396,
        {
            delvesTheWarWithinS2,
            41098, -- Excavation Site 9 Stories
            41100, -- Excavation Site 9 Discoveries
        }
    },
    { -- Vision of Stormwind
        2404,
        horrificVisionsRevisited
    },
    { -- Liberation of Undermine (raid)
        {2406, 2407, 2408, 2409, 2411, 2428},
        {
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
            41286, -- Glory of the Liberation of Undermine Raider
            41229, -- Mythic: Vexie and the Geargrinders
            41230, -- Mythic: Cauldron of Carnage
            41231, -- Mythic: Rik Reverb
            41232, -- Mythic: Stix Bunkjunker
            41233, -- Mythic: Sprocketmonger Lockenstock
            41234, -- Mythic: The One-Armed Bandit
            41235, -- Mythic: Mug'Zee, Heads of Security
            41236, -- Mythic: Chrome King Gallywix
        }
    },
    { -- Sidestreet Sluice (delve)
        {2420, 2421, 2422, 2423},
        {
            delvesTheWarWithinS2,
            41099, -- Sidestreet Sluice Stories
            41101, -- Sidestreet Sluice Discoveries
        }
    },
    { -- Demolition Dome (delve)
        {2425, 2426},
        {
            delvesTheWarWithinS2,
            40732, -- Heavy-Handed
            41530, -- My New Nemesis
            41529, -- Breaking the Bank
            41210, -- Let Me Solo Him: The Underpin
            41531, -- The Hataclysm
        }
    },
    { -- Dastardly Dome
        2447,
        {
            41706, -- Dastardly Duos Weekly High Score
            41707, -- Dastardly Devices
            41715, -- Fiendishly Famous
            41716, -- Duo Darling
            41717, -- Duos Underdog
            41722, -- Inside Connections
            41905, -- Center of Attention
            41916, -- My Way, The Highway
            41922, -- Undefeatable
            41995, -- Boot Hill
            42002, -- Bullhorn of Plenty
            42003, -- Bullhorn of More Plenty
            42004, -- Bullhorn of Most Plenty
            41810, -- Winner's Podium
            41948, -- Defeat the Dastardlies
            41949, -- Defeat the Dastardlies
            41950, -- Defeat the Dastardlies
            41951, -- Defeat the Dastardlies
            41952, -- Defeat the Dastardlies
        }
    },
};