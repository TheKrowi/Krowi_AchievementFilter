local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;

KrowiAF.AchievementData["11_00_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 0},
    {19408}, -- Professional Algari Master
    {19409}, -- Working Underground
    {19410}, -- Algari Master of All
    {19414}, -- Algari Cook
    {19415}, -- Algari Fisherman
    {19459}, -- Level 80
    {19460}, -- Two Warband Mentors: The War Within
    {19470}, -- One Warband Mentor: The War Within
    {19475}, -- Three Warband Mentors: The War Within
    {19476}, -- Four Warband Mentors: The War Within
    {19477}, -- Five Warband Mentors: The War Within
    {19489}, -- Class Connoisseur
    {19515}, -- Algari Master of Many
    {19559}, -- Azj-Kahet
    {19560}, -- The Ringing Deeps
    {19704}, -- Overflowing Algari Flasks
    {19716}, -- Plentiful Algari Potions
    {20118}, -- The Isle of Dorn
    {20510}, -- What Could it be?
    {20511}, -- Gotta Punt em' All
    { -- The War Within Keystone Explorer: Season One
        20523,
        {
            {"PvE Season", 13},
        },
    },
    { -- The War Within Keystone Conqueror: Season One
        20524,
        {
            {"PvE Season", 13},
        },
    },
    { -- The War Within Keystone Master: Season One
        20525,
        {
            {"PvE Season", 13},
        },
    },
    { -- The War Within Keystone Hero: Season One
        20526,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: The Rookery
        20579,
        {
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: The Stonevault
        20580,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Priory of the Sacred Flame
        20581,
        {
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: City of Threads
        20582,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Cinderbrew Meadery
        20583,
        {
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: Darkflame Cleft
        20584,
        {
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: The Dawnbreaker
        20585,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Ara-Kara, City of Echoes
        20586,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Siege of Boralus
        20587,
        {
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Grim Batol
        20588,
        {
            {"PvE Season", 13},
        },
    },
    { -- Tempered Hero: The War Within Season 1
        20589,
        {
            {"PvE Season", 13},
        },
    },
    {20594}, -- Flamegard's Hope
    {20595}, -- Sojourner of Isle of Dorn
    {20596}, -- Loremaster of Khaz Algar
    {20597}, -- The War Within
    {20598}, -- Hallowfall
    {40082}, -- Never Enough
    {40083}, -- Tour of Duty: Isle of Dorn
    {40084}, -- Tour of Duty: The Ringing Deeps
    {40085}, -- Tour of Duty: Hallowfall
    {40086}, -- Tour of Duty: Azj-Kahet
    {40087}, -- Unbound Battle
    {40088}, -- A Champion's Tour: The War Within
    {40089}, -- Spoiled Goods
    {40090}, -- Spoiled Goods
    {40091}, -- Slightly Spoiled
    {40095}, -- Sparking Battle
    {40096}, -- Sparking Battle
    {40097}, -- Ruffious's Bid
    {40098}, -- Immortal Spelunker
    {40100}, -- Undying Caver
    { -- Nemesis
        40103,
        {
            {"PvE Season", 13},
        },
    },
    {40107}, -- Harbinger of the Weathered
    {40115}, -- Harbinger of the Carved
    {40118}, -- Harbinger of the Runed
    {40138}, -- Algari Dungeoneer
    {40139}, -- Algari Dungeon Damage Dealer
    {40140}, -- Algari Dungeon Healer
    {40141}, -- Algari Dungeon Tank
    {40146}, -- War Within Superior
    {40147}, -- War Within Epic
    {40150}, -- Children's Entertainer
    {40151}, -- Mereldar Menace
    {40153}, -- Battle on Khaz Algar
    {40154}, -- Aquatic Battler of Khaz Algar
    {40155}, -- Beast Battler of Khaz Algar
    {40156}, -- Critter Battler of Khaz Algar
    {40157}, -- Dragonkin Battler of Khaz Algar
    {40158}, -- Elemental Battler of Khaz Algar
    {40161}, -- Flying Battler of Khaz Algar
    {40162}, -- Humanoid Battler of Khaz Algar
    {40163}, -- Magic Battler of Khaz Algar
    {40164}, -- Mechanical Battler of Khaz Algar
    {40165}, -- Undead Battler of Khaz Algar
    {40166}, -- Isle of Dorn Glyph Hunter
    {40194}, -- Khaz Algar Safari
    {40210}, -- Deephaul Ravine Victory
    {40211}, -- Deephaul Ravine Veteran
    {40215}, -- Deephaul Ravine Shutout
    {40216}, -- Deephaul Ravine Expedience
    {40217}, -- Battleground Blitzer
    {40219}, -- Battleground Blitzest
    {40220}, -- Setting Records
    {40221}, -- Battleground Blitz Master
    {40222}, -- Echoes of Danger
    {40231}, -- The War Within Pathfinder
    {40232}, -- Glory of the Nerub-ar Raider
    { -- Strategist: The War Within Season 1
        40233,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Warlord: The War Within Season 1
        40234,
        faction.Horde,
        40235,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Marshal: The War Within Season 1
        40235,
        faction.Alliance,
        40234,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    {40236}, -- Mythic: Ulgrax the Devourer
    {40237}, -- Mythic: The Bloodbound Horror
    {40238}, -- Mythic: Sikran, Captain of the Sureki
    {40239}, -- Mythic: Rasha'nan
    {40240}, -- Mythic: Broodtwister Ovi'nax
    {40241}, -- Mythic: Nexus-Princess Ky'veza
    {40242}, -- Mythic: The Silken Court
    {40243}, -- Mythic: Queen Ansurek
    {40244}, -- Nerub-ar Palace
    {40245}, -- Heroic: Nerub-ar Palace
    {40246}, -- Mythic: Nerub-ar Palace
    {40247}, -- The Skittering Battlements
    {40248}, -- Secrets of Nerub-ar Palace
    {40249}, -- A Queen's Fall
    {40250}, -- The First Echo
    {40251}, -- Many Echoes
    {40252}, -- A Series of Echoes
    { -- Ahead of the Curve: Queen Ansurek
        40253,
        {
            {"PvE Season", 13},
        },
    },
    { -- Cutting Edge: Queen Ansurek
        40254,
        {
            {"PvE Season", 13},
        },
    },
    {40255}, -- Sik Parry Bro
    {40260}, -- You Can't See Me
    {40261}, -- Slimy Yet Satisfying
    {40262}, -- Cowabunga
    {40263}, -- Would You Still /love Me if I Was a Worm...
    {40264}, -- Kill Streak
    {40266}, -- Missed 'Em by That Much
    {40307}, -- Allied Races: Earthen
    {40308}, -- Beacon of Hope
    {40309}, -- Heritage of the Earthen
    {40311}, -- Sharing the Light
    {40312}, -- Starting the Flames
    {40313}, -- Igniting the Keyflames
    {40314}, -- Fragments of Memories
    {40316}, -- Isle of Dorn: Bronze
    {40317}, -- Isle of Dorn: Silver
    {40318}, -- Isle of Dorn: Gold
    {40319}, -- Isle of Dorn Advanced: Bronze
    {40320}, -- Isle of Dorn Advanced: Silver
    {40321}, -- Isle of Dorn Advanced: Gold
    {40322}, -- Isle of Dorn Reverse: Bronze
    {40323}, -- Isle of Dorn Reverse: Silver
    {40324}, -- Isle of Dorn Reverse: Gold
    {40325}, -- The Ringing Deeps: Bronze
    {40326}, -- The Ringing Deeps: Silver
    {40327}, -- The Ringing Deeps: Gold
    {40328}, -- The Ringing Deeps Advanced: Bronze
    {40329}, -- The Ringing Deeps Advanced: Silver
    {40330}, -- The Ringing Deeps Advanced: Gold
    {40331}, -- The Ringing Deeps Reverse: Bronze
    {40332}, -- The Ringing Deeps Reverse: Silver
    {40333}, -- The Ringing Deeps Reverse: Gold
    {40334}, -- Hallowfall: Bronze
    {40335}, -- Hallowfall: Silver
    {40336}, -- Hallowfall: Gold
    {40337}, -- Hallowfall Advanced: Bronze
    {40338}, -- Hallowfall Advanced: Silver
    {40339}, -- Hallowfall Advanced: Gold
    {40340}, -- Hallowfall Reverse: Bronze
    {40341}, -- Hallowfall Reverse: Silver
    {40342}, -- Hallowfall Reverse: Gold
    {40343}, -- Azj-Kahet: Bronze
    {40344}, -- Azj-Kahet: Silver
    {40345}, -- Azj-Kahet: Gold
    {40346}, -- Azj-Kahet Advanced: Bronze
    {40347}, -- Azj-Kahet Advanced: Silver
    {40348}, -- Azj-Kahet Advanced: Gold
    {40349}, -- Azj-Kahet Reverse: Bronze
    {40350}, -- Azj-Kahet Reverse: Silver
    {40351}, -- Azj-Kahet Reverse: Gold
    {40352}, -- Khaz Algar Completionist: Bronze
    {40353}, -- Khaz Algar Completionist: Silver
    {40354}, -- Khaz Algar Completionist: Gold
    {40360}, -- Life on the Farm
    {40361}, -- Cinderbrew Meadery
    {40363}, -- Heroic: Cinderbrew Meadery
    {40366}, -- Mythic: Cinderbrew Meadery
    {40370}, -- Ara-Kara, City of Echoes
    {40374}, -- Heroic: Ara-Kara, City of Echoes
    {40375}, -- Mythic: Ara-Kara, City of Echoes
    {40376}, -- City of Threads
    {40377}, -- Heroic: City of Threads
    {40379}, -- Mythic: City of Threads
    { -- Forged Gladiator: The War Within Season 1
        40380,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Legend: The War Within Season 1
        40381,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Hero of the Alliance: Forged
        40383,
        faction.Alliance,
        40384,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Hero of the Horde: Forged
        40384,
        faction.Horde,
        40383,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Combatant I: The War Within Season 1
        40385,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Combatant II: The War Within Season 1
        40386,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Challenger I: The War Within Season 1
        40387,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Challenger II: The War Within Season 1
        40388,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Rival I: The War Within Season 1
        40389,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Rival II: The War Within Season 1
        40390,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Duelist: The War Within Season 1
        40391,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Elite: The War Within Season 1
        40392,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Gladiator: The War Within Season 1
        40393,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Legend: The War Within Season 1
        40395,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Gladiator's Fel Bat
        40398,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    {40427}, -- Darkflame Cleft
    {40428}, -- Heroic: Darkflame Cleft
    {40429}, -- Mythic: Darkflame Cleft
    {40430}, -- Khaz Algar Flight Master
    { -- Hunting the Hunter
        40431,
        {
            {"PvE Season", 13},
        },
    },
    { -- Let Me Solo Him
        40433,
        {
            {"PvE Season", 13},
        },
    },
    {40434}, -- Treasures of the Isle of Dorn
    {40435}, -- Adventurer of the Isle of Dorn
    {40436}, -- You're Getting a Delve!
    {40437}, -- Delver of the Depths
    {40438}, -- Glory of the Delver
    {40445}, -- Sporesweeper
    {40446}, -- I TAKE Candle!
    {40447}, -- Delver of the Depths II
    {40448}, -- Delver of the Depths III
    {40449}, -- Delver of the Depths IV
    {40450}, -- Buddy System II
    {40451}, -- Buddy System III
    {40452}, -- Just Keep Swimming
    {40453}, -- Spider Senses
    {40454}, -- Daystormer
    {40455}, -- Buddy System
    {40456}, -- Buddy System IV
    {40457}, -- Buddy System V
    {40458}, -- Stranger Delves
    {40459}, -- I've Got a Flying Machine!
    {40460}, -- Delve Deep
    {40461}, -- Buddy System VI
    {40462}, -- Delve Deeper
    {40463}, -- Delve Deepest
    {40464}, -- Bounty Master
    {40465}, -- Unbound Bounty
    {40466}, -- Unbound Glory
    {40467}, -- Unbound Glory
    {40468}, -- Unbound Glory
    {40469}, -- I'm Bringing Nerub-ack
    { -- Battle Mender: The War Within Season 1
        40472,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    {40473}, -- Not So Quick Fix
    {40475}, -- To All the Slimes I Love
    {40476}, -- 10 Algari Seekerthread
    {40480}, -- 20 Algari Seekerthread
    {40484}, -- 30 Algari Seekerthread
    {40485}, -- 40 Algari Seekerthread
    {40487}, -- 50 Algari Seekerthread
    {40488}, -- 60 Algari Seekerthread
    {40489}, -- 70 Algari Seekerthread
    {40490}, -- 80 Algari Seekerthread
    {40491}, -- 90 Algari Seekerthread
    {40492}, -- 100 Algari Seekerthread
    {40494}, -- 10 Algari Anglerthread
    {40495}, -- 20 Algari Anglerthread
    {40496}, -- 60 Algari Anglerthread
    {40497}, -- 30 Algari Anglerthread
    {40498}, -- 70 Algari Anglerthread
    {40499}, -- 40 Algari Anglerthread
    {40500}, -- 80 Algari Anglerthread
    {40501}, -- 100 Algari Anglerthread
    {40502}, -- 50 Algari Anglerthread
    {40503}, -- 90 Algari Anglerthread
    {40504}, -- Rocked to Sleep
    {40506}, -- Leave No Treasure Unfound
    {40507}, -- Hanging Tight
    {40512}, -- War Within Delves: Tier 2
    {40514}, -- War Within Delves: Tier 3
    {40515}, -- War Within Delves: Tier 4
    {40516}, -- War Within Delves: Tier 5
    {40517}, -- War Within Delves: Tier 6
    {40518}, -- War Within Delves: Tier 7
    {40519}, -- War Within Delves: Tier 8
    {40520}, -- War Within Delves: Tier 9
    {40521}, -- War Within Delves: Tier 10
    {40523}, -- On Brand
    {40524}, -- Good Deed Delver
    {40525}, -- Fungal Folly Stories
    {40526}, -- Kriegval's Rest Stories
    {40527}, -- Earthcrawl Mines Stories
    {40528}, -- The Waterworks Stories
    {40529}, -- The Dread Pit Stories
    {40530}, -- Nightfall Sanctum Stories
    {40531}, -- Mycomancer Cavern Stories
    {40532}, -- The Sinkhole Stories
    {40533}, -- Skittering Breach Stories
    {40534}, -- The Underkeep Stories
    {40535}, -- Tak-Rethan Abyss Stories
    {40536}, -- The Spiral Weave Stories
    {40537}, -- Delve Loremaster: War Within
    {40538}, -- Brann Development
    {40539}, -- The Derby Dash
    {40542}, -- Smelling History
    {40585}, -- Super Size Snuffling
    {40590}, -- Priory of the Sacred Flame
    -- {40591}, -- Khaz Algar Diplomat [Removed in 11.0.7, replaced by 41169]
    {40592}, -- Heroic: Priory of the Sacred Flame
    {40596}, -- Mythic: Priory of the Sacred Flame
    {40599}, -- The Dawnbreaker
    {40601}, -- Heroic: The Dawnbreaker
    {40604}, -- Mythic: The Dawnbreaker
    {40606}, -- Flat Earthen
    {40607}, -- Wandering in the Ravine
    {40608}, -- Running in the Ravine
    {40612}, -- Sprinting in the Ravine
    {40613}, -- Resilient Runner
    {40614}, -- Gobblin' with Glublurp
    {40615}, -- Unexpected Arrival
    {40616}, -- Unexpected Arrivals
    {40617}, -- Deepholla
    {40618}, -- Lost and Found
    {40620}, -- Back to the Wall
    {40621}, -- The Rookery
    {40622}, -- Biblo Archivist
    {40623}, -- I Only Need One Trip
    {40624}, -- Itsy Bitsy Spider
    {40625}, -- The Missing Lynx
    {40628}, -- Notable Machines
    {40629}, -- Bookworm
    {40630}, -- For the Collective
    {40631}, -- War Within Delves: Tier 1
    {40632}, -- No Harm Ever Came From Reading A Book
    {40633}, -- The Unseeming
    {40634}, -- You Can't Hang With Us
    {40635}, -- Branntastic
    {40636}, -- Sojourner of Azj-Kahet
    {40637}, -- Heroic: The Rookery
    {40642}, -- Mythic: The Rookery
    {40643}, -- The Stonevault
    {40644}, -- Heroic: The Stonevault
    {40648}, -- Mythic: The Stonevault
    {40660}, -- The War Within Season 1: Spelunker Supreme
    {40662}, -- It's Not Much, But It's Honest Work
    {40702}, -- Khaz Algar Glyph Hunter
    {40703}, -- The Ringing Deeps Glyph Hunter
    {40704}, -- Hallowfall Glyph Hunter
    {40705}, -- Azj-Kahet Glyph Hunter
    {40723}, -- Web-Wrapped in the Finest Silks
    {40724}, -- Treasures of The Ringing Deeps
    {40725}, -- War Within Delves: Endgame
    {40726}, -- War Within Delves: Tier 11
    {40727}, -- Skittershaw Spin
    {40728}, -- Forged Finery
    {40729}, -- Light's Gambit Champion
    {40730}, -- Love is in the Lair
    {40731}, -- Panhandled
    {40732}, -- Heavy-Handed
    {40763}, -- I'm not a Thief, I'm a Treasure Hunter
    {40788}, -- I Got the Keys
    {40789}, -- Flying in Style
    {40790}, -- Khaz Algar Explorer
    { -- Solo Shuffle Medic: The War Within
        40792,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Battleground Blitz Medic: The War Within
        40795,
        {
            IsPvP = true,
            {"From", "PvP Season", 38, "Until", "PvP Season", 40},
        },
    },
    { -- This Takes Me Back
        40796,
        {
            {"From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26}},
        },
    },
    {40799}, -- Sojourner of The Ringing Deeps
    {40803}, -- Fungal Folly Discoveries
    {40806}, -- Earthcrawl Mines Discoveries
    {40807}, -- Kriegval's Rest Discoveries
    {40808}, -- Mycomancer Cavern Discoveries
    {40809}, -- Nightfall Sanctum Discoveries
    {40810}, -- Skittering Breach Discoveries
    {40811}, -- Tak-Rethan Abyss Discoveries
    {40812}, -- The Dread Pit Discoveries
    {40813}, -- The Sinkhole Discoveries
    {40814}, -- The Spiral Weave Discoveries
    {40815}, -- The Underkeep Discoveries
    {40816}, -- The Waterworks Discoveries
    {40817}, -- A Delver's Bounty
    {40819}, -- Ready to Turn
    {40820}, -- Raisin' Brann
    {40822}, -- Explore Azj-Kahet
    {40825}, -- Explore The Ringing Deeps
    {40826}, -- Explore Hallowfall
    {40828}, -- Treasures of Azj-Kahet
    {40831}, -- Explore the Isle of Dorn
    {40832}, -- Leave it to Weaver
    {40833}, -- The General's Salute
    {40835}, -- Vizier than Ever
    -- {40836}, -- Assembly of the Deeps [Removed in 11.0.7, replaced by 41165]
    {40837}, -- Adventurer of The Ringing Deeps
    -- {40838}, -- The Severed Threads [Removed in 11.0.7, replaced by 41149]
    {40840}, -- Adventurer of Azj-Kahet
    {40843}, -- Mine Poppin'
    {40844}, -- Sojourner of Hallowfall
    -- {40845}, -- Hallowfall Arathi [Removed in 11.0.7, replaced by 41167]
    {40848}, -- Treasures of Hallowfall
    {40851}, -- Adventurer of Hallowfall
    -- {40856}, -- Council of Dornogal [Removed in 11.0.7, replaced by 41161]
    {40859}, -- We're Here All Night
    {40860}, -- A Star of Dorn
};

KrowiAF.AchievementData["11_00_02"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 2},
    { -- Tricks and Treats of Khaz Algar
        40862,
        {
            {"Event", 324},
        },
    },
    {40863}, -- Perplexing Puzzle
    {40864}, -- Plentiful Perplexing Puzzles
    {40869}, -- Worm Theory
    {40874}, -- The Grand Tapestry
    {40875}, -- True Strength
    {40876}, -- Vox Arachni
    {40882}, -- Copious Coffers
    {40885}, -- The Key to Madness
    -- {40904}, -- Cornerstone of Dornogal [Removed in 11.0.7, replaced by 41162]
    -- {40905}, -- From Many, One [Removed in 11.0.7, replaced by 41166]
    -- {40906}, -- The Flame Burns Within [Removed in 11.0.7, replaced by 41168]
    -- {40907}, -- We Rise Anew [Removed in 11.0.7, replaced by 41164]
    {40939}, -- Harbinger of the Gilded
};

KrowiAF.AchievementData["11_00_05"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 5},
    {15644}, -- Good Things Come in Small Packages
    {16731}, -- Court is Now in Session
    { -- Zoomies!
        40661,
        {
            {"Event", 1592},
        },
    },
    {40870}, -- Azeroth's Greatest Detective
    {40871}, -- Assistant to the Assistant Guest Relations Manager
    {40872}, -- I Saved the Party and All I Got Was This Lousy Hat
    {40873}, -- Crate Insurance Agent
    {40967}, -- Ratts' Revenge
    { -- A Cool Twenty Years
        40976,
        {
            {"Event", 1592},
        },
    },
    { -- Codex Editor: Ahn'Qiraj
        40977,
        {
            {"Event", 1592},
        },
    },
    {40979}, -- No Crate Left Behind
    {40980}, -- Family Battler of Khaz Algar
    { -- Big Fan
        40984,
        {
            {"Event", 1592},
        },
    },
    { -- I Have That One!
        40985,
        {
            {"Event", 1592},
        },
    },
    { -- Mount Master
        40986,
        {
            {"Event", 1592},
        },
    },
    { -- Fashion Critic
        40987,
        {
            {"Event", 1592},
        },
    },
    {40988}, -- Photo Op!
    { -- Pet Mischief
        40989,
        {
            {"Event", 1592},
        },
    },
    { -- Balloonist
        40990,
        {
            {"Event", 1592},
        },
    },
    { -- Frequent Flyer
        40991,
        {
            {"Event", 1592},
        },
    },
    { -- Peanut Gallery
        40992,
        {
            {"Event", 1592},
        },
    },
    { -- Avid Listener
        40993,
        {
            {"Event", 1592},
        },
    },
    { -- An Original
        40994,
        {
            {"Event", 1592},
        },
    },
    { -- The Originals
        40995,
        {
            {"Event", 1592},
        },
    },
    { -- A Gatecrasher
        40996,
        {
            {"Event", 1592},
        },
    },
    { -- The Gatecrashers
        40997,
        {
            {"Event", 1592},
        },
    },
    {40998}, -- A Timewalking Step Back to a Classic Dungeon Time
    { -- You're in Your Blackrock Depths
        40999,
        {
            {"Event", 1592},
        },
    },
    {41000}, -- A Timewalking Journey Back to a Classic Dungeon Time
    {41013}, -- Upgraded Apparel
    { -- A Dark Iron Past
        41015,
        {
            {"Event", 1592},
        },
    },
    {41033}, -- Classy Dresser
    { -- Token Collector
        41038,
        {
            {"Event", 1592},
        },
    },
    { -- Forged Weapons of Conquest
        41044,
        {
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- WoW's 20th Anniversary
        41220,
        {
            {"Event", 1592},
        },
    },
};

KrowiAF.AchievementData["11_00_07"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 7},
    {40762}, -- Khaz Algar Lore Hunter
    {40791}, -- Fate of the Kirin Tor
    {40953}, -- A Farewell to Arms
    {40955}, -- War Stories
    {40956}, -- I'm On Island Time
    {40957}, -- Maximum Effort
    {40958}, -- Full Heart, Can't Lose
    {40959}, -- Black Empire State of Mind
    {40960}, -- Uldir
    {40961}, -- Battle of Dazar'alor
    {40962}, -- The Eternal Palace
    {40963}, -- Ny'alotha, the Waking City
    {41042}, -- Siren-ity Now!
    {41043}, -- Excavation Projects
    {41045}, -- A Song of Secrets
    {41046}, -- Clean Up on Isle Siren
    {41050}, -- A Choir of Citrines
    {41052}, -- Lingering Shadows
    { -- Master of the Turbulent Timeways II
        41056,
        {
            {"Event", 1425},
        },
    },
    { -- Elders of Khaz Algar
        41130,
        {
            {"Event", 327},
        },
    },
    {41131}, -- Treasures of the Storm
    {41133}, -- Isle Remember You
    {41149}, -- The Severed Threads
    { -- Lub and Plunder
        41152,
        {
            {"Event", 1601},
        },
    },
    { -- Swabbie Swag
        41153,
        {
            {"Event", 1601},
        },
    },
    { -- Decked Out
        41154,
        {
            {"Event", 1601},
        },
    },
    { -- Buckled Up
        41156,
        {
            {"Event", 1601},
        },
    },
    { -- Plunder Siege
        41157,
        {
            {"Event", 1601},
        },
    },
    { -- It's a Plunderful Life
        41160,
        {
            {"Event", 1601},
        },
    },
    {41161}, -- Council of Dornogal
    {41162}, -- Cornerstone of Dornogal
    { -- Lord of the Bling
        41163,
        {
            {"Event", 1601},
        },
    },
    {41164}, -- We Rise Anew
    {41165}, -- Assembly of the Deeps
    {41166}, -- From Many, One
    {41167}, -- Hallowfall Arathi
    {41168}, -- The Flame Burns Within
    {41169}, -- Khaz Algar Diplomat
    {41170}, -- Friends in the Plains
    {41171}, -- Friends in the Accord
    {41172}, -- Friends in the Field
    {41173}, -- Friend of the Family
    {41174}, -- A True Explorer
    {41175}, -- Friends in Loamm Places
    {41176}, -- Friends in the Dream
    {41177}, -- Warden of the Dream
    {41179}, -- Popular Around the Isles
    {41180}, -- Joining the Khansguard
    {41181}, -- Joining the Community
    {41182}, -- Ally of the Flights
    {41183}, -- There's No Place Like Loamm
    {41184}, -- Freshscales Fifteen
    {41185}, -- Siren's Squall
    {41186}, -- Slate of the Union
    {41187}, -- Rage Aside the Machine
    {41188}, -- Crystal Chronicled
    {41189}, -- Azj the World Turns
    {41201}, -- You Xal Not Pass
    {41202}, -- Hot Tropic
    {41203}, -- Bwon Voyage
    {41204}, -- Dune Squad
    {41205}, -- Sound Off
    {41206}, -- Songs of Storms
    {41207}, -- When the Drust Settles
    {41209}, -- Dressed to Kill: Battle for Azeroth
};