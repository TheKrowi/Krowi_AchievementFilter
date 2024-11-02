local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["11_00_00"] = {
    { -- Professional Algari Master
        19408,
    },
    { -- Working Underground
        19409,
    },
    { -- Algari Master of All
        19410,
    },
    { -- Algari Cook
        19414,
    },
    { -- Algari Fisherman
        19415,
    },
    { -- Level 80
        19459,
    },
    { -- Two Warband Mentors: The War Within
        19460,
    },
    { -- One Warband Mentor: The War Within
        19470,
    },
    { -- Three Warband Mentors: The War Within
        19475,
    },
    { -- Four Warband Mentors: The War Within
        19476,
    },
    { -- Five Warband Mentors: The War Within
        19477,
    },
    { -- Class Connoisseur
        19489,
    },
    { -- Algari Master of Many
        19515,
    },
    { -- Azj-Kahet
        19559,
    },
    { -- The Ringing Deeps
        19560,
    },
    { -- Overflowing Algari Flasks
        19704,
    },
    { -- Plentiful Algari Potions
        19716,
    },
    { -- The Isle of Dorn
        20118,
    },
    { -- What Could it be?
        20510,
    },
    { -- Gotta Punt em' All
        20511,
    },
    { -- The War Within Keystone Explorer: Season One
        20523,
    },
    { -- The War Within Keystone Conqueror: Season One
        20524,
    },
    { -- The War Within Keystone Master: Season One
        20525,
    },
    { -- The War Within Keystone Hero: Season One
        20526,
    },
    { -- Keystone Hero: The Rookery
        20579,
    },
    { -- Keystone Hero: The Stonevault
        20580,
    },
    { -- Keystone Hero: Priory of the Sacred Flame
        20581,
    },
    { -- Keystone Hero: City of Threads
        20582,
    },
    { -- Keystone Hero: Cinderbrew Meadery
        20583,
    },
    { -- Keystone Hero: Darkflame Cleft
        20584,
    },
    { -- Keystone Hero: The Dawnbreaker
        20585,
    },
    { -- "Keystone Hero: Ara-Kara, City of Echoes"
        20586,
    },
    { -- Keystone Hero: Siege of Boralus
        20587,
    },
    { -- Keystone Hero: Grim Batol
        20588,
    },
    { -- Tempered Hero: The War Within Season 1
        20589,
    },
    { -- Flamegard's Hope
        20594,
    },
    { -- Sojourner of Isle of Dorn
        20595,
    },
    { -- Loremaster of Khaz Algar
        20596,
    },
    { -- The War Within
        20597,
    },
    { -- Hallowfall
        20598,
    },
    { -- Never Enough
        40082,
    },
    { -- Tour of Duty: Isle of Dorn
        40083,
    },
    { -- Tour of Duty: The Ringing Deeps
        40084,
    },
    { -- Tour of Duty: Hallowfall
        40085,
    },
    { -- Tour of Duty: Azj-Kahet
        40086,
    },
    { -- Unbound Battle
        40087,
    },
    { -- A Champion's Tour: The War Within
        40088,
    },
    { -- Spoiled Goods
        40089,
    },
    { -- Spoiled Goods
        40090,
    },
    { -- Slightly Spoiled
        40091,
    },
    { -- Sparking Battle
        40095,
    },
    { -- Sparking Battle
        40096,
    },
    { -- Ruffious's Bid
        40097,
    },
    { -- Immortal Spelunker
        40098,
    },
    { -- Undying Caver
        40100,
    },
    { -- Nemesis
        40103,
    },
    { -- Harbinger of the Weathered
        40107,
    },
    { -- Harbinger of the Carved
        40115,
    },
    { -- Harbinger of the Runed
        40118,
    },
    { -- Algari Dungeoneer
        40138,
    },
    { -- Algari Dungeon Damage Dealer
        40139,
    },
    { -- Algari Dungeon Healer
        40140,
    },
    { -- Algari Dungeon Tank
        40141,
    },
    { -- War Within Superior
        40146,
    },
    { -- War Within Epic
        40147,
    },
    { -- Children's Entertainer
        40150,
    },
    { -- Mereldar Menace
        40151,
    },
    { -- Battle on Khaz Algar
        40153,
    },
    { -- Aquatic Battler of Khaz Algar
        40154,
    },
    { -- Beast Battler of Khaz Algar
        40155,
    },
    { -- Critter Battler of Khaz Algar
        40156,
    },
    { -- Dragonkin Battler of Khaz Algar
        40157,
    },
    { -- Elemental Battler of Khaz Algar
        40158,
    },
    { -- Flying Battler of Khaz Algar
        40161,
    },
    { -- Humanoid Battler of Khaz Algar
        40162,
    },
    { -- Magic Battler of Khaz Algar
        40163,
    },
    { -- Mechanical Battler of Khaz Algar
        40164,
    },
    { -- Undead Battler of Khaz Algar
        40165,
    },
    { -- Isle of Dorn Glyph Hunter
        40166,
    },
    { -- Khaz Algar Safari
        40194,
    },
    { -- Deephaul Ravine Victory
        40210,
    },
    { -- Deephaul Ravine Veteran
        40211,
    },
    { -- Deephaul Ravine Shutout
        40215,
    },
    { -- Deephaul Ravine Expedience
        40216,
    },
    { -- Battleground Blitzer
        40217,
    },
    { -- Battleground Blitzest
        40219,
    },
    { -- Setting Records
        40220,
    },
    { -- Battleground Blitz Master
        40221,
    },
    { -- Echoes of Danger
        40222,
    },
    { -- The War Within Pathfinder
        40231,
    },
    { -- Glory of the Nerub-ar Raider
        40232,
    },
    { -- Strategist: The War Within Season 1
        40233,
    },
    { -- Forged Warlord: The War Within Season 1
        40234,
        faction.Horde,
    },
    { -- Forged Marshal: The War Within Season 1
        40235,
        faction.Alliance,
    },
    { -- Mythic: Ulgrax the Devourer
        40236,
    },
    { -- Mythic: The Bloodbound Horror
        40237,
    },
    { -- "Mythic: Sikran, Captain of the Sureki"
        40238,
    },
    { -- Mythic: Rasha'nan
        40239,
    },
    { -- Mythic: Broodtwister Ovi'nax
        40240,
    },
    { -- Mythic: Nexus-Princess Ky'veza
        40241,
    },
    { -- Mythic: The Silken Court
        40242,
    },
    { -- Mythic: Queen Ansurek
        40243,
    },
    { -- Nerub-ar Palace
        40244,
    },
    { -- Heroic: Nerub-ar Palace
        40245,
    },
    { -- Mythic: Nerub-ar Palace
        40246,
    },
    { -- The Skittering Battlements
        40247,
    },
    { -- Secrets of Nerub-ar Palace
        40248,
    },
    { -- A Queen's Fall
        40249,
    },
    { -- The First Echo
        40250,
    },
    { -- Many Echoes
        40251,
    },
    { -- A Series of Echoes
        40252,
    },
    { -- Ahead of the Curve: Queen Ansurek
        40253,
    },
    { -- Cutting Edge: Queen Ansurek
        40254,
    },
    { -- Sik Parry Bro
        40255,
    },
    { -- You Can't See Me
        40260,
    },
    { -- Slimy Yet Satisfying
        40261,
    },
    { -- Cowabunga
        40262,
    },
    { -- Would You Still /love Me if I Was a Worm...
        40263,
    },
    { -- Kill Streak
        40264,
    },
    { -- Missed 'Em by That Much
        40266,
    },
    { -- Allied Races: Earthen
        40307,
    },
    { -- Beacon of Hope
        40308,
    },
    { -- Heritage of the Earthen
        40309,
    },
    { -- Sharing the Light
        40311,
    },
    { -- Starting the Flames
        40312,
    },
    { -- Igniting the Keyflames
        40313,
    },
    { -- Fragments of Memories
        40314,
    },
    { -- Isle of Dorn: Bronze
        40316,
    },
    { -- Isle of Dorn: Silver
        40317,
    },
    { -- Isle of Dorn: Gold
        40318,
    },
    { -- Isle of Dorn Advanced: Bronze
        40319,
    },
    { -- Isle of Dorn Advanced: Silver
        40320,
    },
    { -- Isle of Dorn Advanced: Gold
        40321,
    },
    { -- Isle of Dorn Reverse: Bronze
        40322,
    },
    { -- Isle of Dorn Reverse: Silver
        40323,
    },
    { -- Isle of Dorn Reverse: Gold
        40324,
    },
    { -- The Ringing Deeps: Bronze
        40325,
    },
    { -- The Ringing Deeps: Silver
        40326,
    },
    { -- The Ringing Deeps: Gold
        40327,
    },
    { -- The Ringing Deeps Advanced: Bronze
        40328,
    },
    { -- The Ringing Deeps Advanced: Silver
        40329,
    },
    { -- The Ringing Deeps Advanced: Gold
        40330,
    },
    { -- The Ringing Deeps Reverse: Bronze
        40331,
    },
    { -- The Ringing Deeps Reverse: Silver
        40332,
    },
    { -- The Ringing Deeps Reverse: Gold
        40333,
    },
    { -- Hallowfall: Bronze
        40334,
    },
    { -- Hallowfall: Silver
        40335,
    },
    { -- Hallowfall: Gold
        40336,
    },
    { -- Hallowfall Advanced: Bronze
        40337,
    },
    { -- Hallowfall Advanced: Silver
        40338,
    },
    { -- Hallowfall Advanced: Gold
        40339,
    },
    { -- Hallowfall Reverse: Bronze
        40340,
    },
    { -- Hallowfall Reverse: Silver
        40341,
    },
    { -- Hallowfall Reverse: Gold
        40342,
    },
    { -- Azj-Kahet: Bronze
        40343,
    },
    { -- Azj-Kahet: Silver
        40344,
    },
    { -- Azj-Kahet: Gold
        40345,
    },
    { -- Azj-Kahet Advanced: Bronze
        40346,
    },
    { -- Azj-Kahet Advanced: Silver
        40347,
    },
    { -- Azj-Kahet Advanced: Gold
        40348,
    },
    { -- Azj-Kahet Reverse: Bronze
        40349,
    },
    { -- Azj-Kahet Reverse: Silver
        40350,
    },
    { -- Azj-Kahet Reverse: Gold
        40351,
    },
    { -- Khaz Algar Completionist: Bronze
        40352,
    },
    { -- Khaz Algar Completionist: Silver
        40353,
    },
    { -- Khaz Algar Completionist: Gold
        40354,
    },
    { -- Life on the Farm
        40360,
    },
    { -- Cinderbrew Meadery
        40361,
    },
    { -- Heroic: Cinderbrew Meadery
        40363,
    },
    { -- Mythic: Cinderbrew Meadery
        40366,
    },
    { -- "Ara-Kara, City of Echoes"
        40370,
    },
    { -- "Heroic: Ara-Kara, City of Echoes"
        40374,
    },
    { -- "Mythic: Ara-Kara, City of Echoes"
        40375,
    },
    { -- City of Threads
        40376,
    },
    { -- Heroic: City of Threads
        40377,
    },
    { -- Mythic: City of Threads
        40379,
    },
    { -- Forged Gladiator: The War Within Season 1
        40380,
    },
    { -- Forged Legend: The War Within Season 1
        40381,
    },
    { -- Hero of the Alliance: Forged
        40383,
        faction.Alliance,
    },
    { -- Hero of the Horde: Forged
        40384,
        faction.Horde,
    },
    { -- Combatant I: The War Within Season 1
        40385,
    },
    { -- Combatant II: The War Within Season 1
        40386,
    },
    { -- Challenger I: The War Within Season 1
        40387,
    },
    { -- Challenger II: The War Within Season 1
        40388,
    },
    { -- Rival I: The War Within Season 1
        40389,
    },
    { -- Rival II: The War Within Season 1
        40390,
    },
    { -- Duelist: The War Within Season 1
        40391,
    },
    { -- Elite: The War Within Season 1
        40392,
    },
    { -- Gladiator: The War Within Season 1
        40393,
    },
    { -- Legend: The War Within Season 1
        40395,
    },
    { -- Forged Gladiator's Fel Bat
        40398,
    },
    { -- Darkflame Cleft
        40427,
    },
    { -- Heroic: Darkflame Cleft
        40428,
    },
    { -- Mythic: Darkflame Cleft
        40429,
    },
    { -- Khaz Algar Flight Master
        40430,
    },
    { -- Hunting the Hunter
        40431,
    },
    { -- Let Me Solo Him
        40433,
    },
    { -- Treasures of the Isle of Dorn
        40434,
    },
    { -- Adventurer of the Isle of Dorn
        40435,
    },
    { -- You're Getting a Delve!
        40436,
    },
    { -- Delver of the Depths
        40437,
    },
    { -- Glory of the Delver
        40438,
    },
    { -- Sporesweeper
        40445,
    },
    { -- I TAKE Candle!
        40446,
    },
    { -- Delver of the Depths II
        40447,
    },
    { -- Delver of the Depths III
        40448,
    },
    { -- Delver of the Depths IV
        40449,
    },
    { -- Buddy System II
        40450,
    },
    { -- Buddy System III
        40451,
    },
    { -- Just Keep Swimming
        40452,
    },
    { -- Spider Senses
        40453,
    },
    { -- Daystormer
        40454,
    },
    { -- Buddy System
        40455,
    },
    { -- Buddy System IV
        40456,
    },
    { -- Buddy System V
        40457,
    },
    { -- Stranger Delves
        40458,
    },
    { -- I've Got a Flying Machine!
        40459,
    },
    { -- Delve Deep
        40460,
    },
    { -- Buddy System VI
        40461,
    },
    { -- Delve Deeper
        40462,
    },
    { -- Delve Deepest
        40463,
    },
    { -- Bounty Master
        40464,
    },
    { -- Unbound Bounty
        40465,
    },
    { -- Unbound Glory
        40466,
    },
    { -- Unbound Glory
        40467,
    },
    { -- Unbound Glory
        40468,
    },
    { -- I'm Bringing Nerub-ack
        40469,
    },
    { -- Battle Mender: The War Within Season 1
        40472,
    },
    { -- Not So Quick Fix
        40473,
    },
    { -- To All the Slimes I Love
        40475,
    },
    { -- 10 Algari Seekerthread
        40476,
    },
    { -- 20 Algari Seekerthread
        40480,
    },
    { -- 30 Algari Seekerthread
        40484,
    },
    { -- 40 Algari Seekerthread
        40485,
    },
    { -- 50 Algari Seekerthread
        40487,
    },
    { -- 60 Algari Seekerthread
        40488,
    },
    { -- 70 Algari Seekerthread
        40489,
    },
    { -- 80 Algari Seekerthread
        40490,
    },
    { -- 90 Algari Seekerthread
        40491,
    },
    { -- 100 Algari Seekerthread
        40492,
    },
    { -- 10 Algari Anglerthread
        40494,
    },
    { -- 20 Algari Anglerthread
        40495,
    },
    { -- 60 Algari Anglerthread
        40496,
    },
    { -- 30 Algari Anglerthread
        40497,
    },
    { -- 70 Algari Anglerthread
        40498,
    },
    { -- 40 Algari Anglerthread
        40499,
    },
    { -- 80 Algari Anglerthread
        40500,
    },
    { -- 100 Algari Anglerthread
        40501,
    },
    { -- 50 Algari Anglerthread
        40502,
    },
    { -- 90 Algari Anglerthread
        40503,
    },
    { -- Rocked to Sleep
        40504,
    },
    { -- Leave No Treasure Unfound
        40506,
    },
    { -- Hanging Tight
        40507,
    },
    { -- War Within Delves: Tier 2
        40512,
    },
    { -- War Within Delves: Tier 3
        40514,
    },
    { -- War Within Delves: Tier 4
        40515,
    },
    { -- War Within Delves: Tier 5
        40516,
    },
    { -- War Within Delves: Tier 6
        40517,
    },
    { -- War Within Delves: Tier 7
        40518,
    },
    { -- War Within Delves: Tier 8
        40519,
    },
    { -- War Within Delves: Tier 9
        40520,
    },
    { -- War Within Delves: Tier 10
        40521,
    },
    { -- On Brand
        40523,
    },
    { -- Good Deed Delver
        40524,
    },
    { -- Fungal Folly Stories
        40525,
    },
    { -- Kriegval's Rest Stories
        40526,
    },
    { -- Earthcrawl Mines Stories
        40527,
    },
    { -- The Waterworks Stories
        40528,
    },
    { -- The Dread Pit Stories
        40529,
    },
    { -- Nightfall Sanctum Stories
        40530,
    },
    { -- Mycomancer Cavern Stories
        40531,
    },
    { -- The Sinkhole Stories
        40532,
    },
    { -- Skittering Breach Stories
        40533,
    },
    { -- The Underkeep Stories
        40534,
    },
    { -- Tak-Rethan Abyss Stories
        40535,
    },
    { -- The Spiral Weave Stories
        40536,
    },
    { -- Delve Loremaster: War Within
        40537,
    },
    { -- Brann Development
        40538,
    },
    { -- The Derby Dash
        40539,
    },
    { -- Smelling History
        40542,
    },
    { -- Super Size Snuffling
        40585,
    },
    { -- Priory of the Sacred Flame
        40590,
    },
    { -- Khaz Algar Diplomat
        40591,
    },
    { -- Heroic: Priory of the Sacred Flame
        40592,
    },
    { -- Mythic: Priory of the Sacred Flame
        40596,
    },
    { -- The Dawnbreaker
        40599,
    },
    { -- Heroic: The Dawnbreaker
        40601,
    },
    { -- Mythic: The Dawnbreaker
        40604,
    },
    { -- Flat Earthen
        40606,
    },
    { -- Wandering in the Ravine
        40607,
    },
    { -- Running in the Ravine
        40608,
    },
    { -- Sprinting in the Ravine
        40612,
    },
    { -- Resilient Runner
        40613,
    },
    { -- Gobblin' with Glublurp
        40614,
    },
    { -- Unexpected Arrival
        40615,
    },
    { -- Unexpected Arrivals
        40616,
    },
    { -- Deepholla
        40617,
    },
    { -- Lost and Found
        40618,
    },
    { -- Back to the Wall
        40620,
    },
    { -- The Rookery
        40621,
    },
    { -- Biblo Archivist
        40622,
    },
    { -- I Only Need One Trip
        40623,
    },
    { -- Itsy Bitsy Spider
        40624,
    },
    { -- The Missing Lynx
        40625,
    },
    { -- Notable Machines
        40628,
    },
    { -- Bookworm
        40629,
    },
    { -- For the Collective
        40630,
    },
    { -- War Within Delves: Tier 1
        40631,
    },
    { -- No Harm Ever Came From Reading A Book
        40632,
    },
    { -- The Unseeming
        40633,
    },
    { -- You Can't Hang With Us
        40634,
    },
    { -- Branntastic
        40635,
    },
    { -- Sojourner of Azj-Kahet
        40636,
    },
    { -- Heroic: The Rookery
        40637,
    },
    { -- Mythic: The Rookery
        40642,
    },
    { -- The Stonevault
        40643,
    },
    { -- Heroic: The Stonevault
        40644,
    },
    { -- Mythic: The Stonevault
        40648,
    },
    { -- The War Within Season 1: Spelunker Supreme
        40660,
    },
    { -- "It's Not Much, But It's Honest Work"
        40662,
    },
    { -- Khaz Algar Glyph Hunter
        40702,
    },
    { -- The Ringing Deeps Glyph Hunter
        40703,
    },
    { -- Hallowfall Glyph Hunter
        40704,
    },
    { -- Azj-Kahet Glyph Hunter
        40705,
    },
    { -- Web-Wrapped in the Finest Silks
        40723,
    },
    { -- Treasures of The Ringing Deeps
        40724,
    },
    { -- War Within Delves: Endgame
        40725,
    },
    { -- War Within Delves: Tier 11
        40726,
    },
    { -- Skittershaw Spin
        40727,
    },
    { -- Forged Finery
        40728,
    },
    { -- Light's Gambit Champion
        40729,
    },
    { -- Love is in the Lair
        40730,
    },
    { -- Panhandled
        40731,
    },
    { -- Heavy-Handed
        40732,
    },
    { -- "I'm not a Thief, I'm a Treasure Hunter"
        40763,
    },
    { -- I Got the Keys
        40788,
    },
    { -- Flying in Style
        40789,
    },
    { -- Khaz Algar Explorer
        40790,
    },
    { -- Solo Shuffle Medic: The War Within
        40792,
    },
    { -- Battleground Blitz Medic: The War Within
        40795,
    },
    { -- This Takes Me Back
        40796,
    },
    { -- Sojourner of The Ringing Deeps
        40799,
    },
    { -- Fungal Folly Discoveries
        40803,
    },
    { -- Earthcrawl Mines Discoveries
        40806,
    },
    { -- Kriegval's Rest Discoveries
        40807,
    },
    { -- Mycomancer Cavern Discoveries
        40808,
    },
    { -- Nightfall Sanctum Discoveries
        40809,
    },
    { -- Skittering Breach Discoveries
        40810,
    },
    { -- Tak-Rethan Abyss Discoveries
        40811,
    },
    { -- The Dread Pit Discoveries
        40812,
    },
    { -- The Sinkhole Discoveries
        40813,
    },
    { -- The Spiral Weave Discoveries
        40814,
    },
    { -- The Underkeep Discoveries
        40815,
    },
    { -- The Waterworks Discoveries
        40816,
    },
    { -- A Delver's Bounty
        40817,
    },
    { -- Ready to Turn
        40819,
    },
    { -- Raisin' Brann
        40820,
    },
    { -- Explore Azj-Kahet
        40822,
    },
    { -- Explore The Ringing Deeps
        40825,
    },
    { -- Explore Hallowfall
        40826,
    },
    { -- Treasures of Azj-Kahet
        40828,
    },
    { -- Explore the Isle of Dorn
        40831,
    },
    { -- Leave it to Weaver
        40832,
    },
    { -- The General's Salute
        40833,
    },
    { -- Vizier than Ever
        40835,
    },
    { -- Assembly of the Deeps
        40836,
    },
    { -- Adventurer of The Ringing Deeps
        40837,
    },
    { -- The Severed Threads
        40838,
    },
    { -- Adventurer of Azj-Kahet
        40840,
    },
    { -- Mine Poppin'
        40843,
    },
    { -- Sojourner of Hallowfall
        40844,
    },
    { -- Hallowfall Arathi
        40845,
    },
    { -- Treasures of Hallowfall
        40848,
    },
    { -- Adventurer of Hallowfall
        40851,
    },
    { -- Council of Dornogal
        40856,
    },
    { -- We're Here All Night
        40859,
    },
    { -- A Star of Dorn
        40860,
    },
    {KrowiAF.SetAchievementPatch, 11, 0, 0}, -- Rework loading so this can go to the top, future me problem
};