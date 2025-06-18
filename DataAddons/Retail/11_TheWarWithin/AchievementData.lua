local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["11_00_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 0},
    {19408}, -- Professional Algari Master
    {19409}, -- Working Underground
    {19410}, -- Algari Master of All
    {19414}, -- Algari Cook
    {19415}, -- Algari Fisherman
    {19459}, -- Level 80
    { -- Two Warband Mentors: The War Within
		19460,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- One Warband Mentor: The War Within
		19470,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Three Warband Mentors: The War Within
		19475,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Four Warband Mentors: The War Within
		19476,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Five Warband Mentors: The War Within
		19477,
		{
			RewardType = rewardType.Other,
		},
	},
    {19489}, -- Class Connoisseur
    { -- Algari Master of Many
		19515,
		{
			RewardType = rewardType.Transmog,
		},
	},
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
            RewardType = rewardType.Title,
            {"PvE Season", 13},
        },
    },
    { -- The War Within Keystone Master: Season One
        20525,
        {
            RewardType = rewardType.Mount,
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
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: The Stonevault
        20580,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Priory of the Sacred Flame
        20581,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: City of Threads
        20582,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Cinderbrew Meadery
        20583,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: Darkflame Cleft
        20584,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: The Dawnbreaker
        20585,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Ara-Kara, City of Echoes
        20586,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Siege of Boralus
        20587,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Keystone Hero: Grim Batol
        20588,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 13},
        },
    },
    { -- Tempered Hero: The War Within Season 1
        20589,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 13},
        },
    },
    {20594}, -- Flamegard's Hope
    {20595}, -- Sojourner of Isle of Dorn
    { -- Loremaster of Khaz Algar
		20596,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {20597}, -- The War Within
    {20598}, -- Hallowfall
    {40082}, -- Never Enough
    {40083}, -- Tour of Duty: Isle of Dorn
    {40084}, -- Tour of Duty: The Ringing Deeps
    {40085}, -- Tour of Duty: Hallowfall
    {40086}, -- Tour of Duty: Azj-Kahet
    {40087}, -- Unbound Battle
	{ -- A Champion's Tour: The War Within
		40088,
		{
			RewardType = rewardType.Pet,
		},
	},
    {40089}, -- Spoiled Goods
    {40090}, -- Spoiled Goods
    {40091}, -- Slightly Spoiled
    {40095}, -- Sparking Battle
	{ -- Sparking Battle
		40096,
		{
			RewardType = rewardType.Toy,
		},
	},
	{ -- Ruffious's Bid
		40097,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Immortal Spelunker
		40098,
		{
			RewardType = rewardType.Title,
		},
	},
    {40100}, -- Undying Caver
    { -- My First Nemesis
        40103,
        {
            {"PvE Season", 13},
        },
    },
    { -- Harbinger of the Weathered
		40107,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- Harbinger of the Carved
		40115,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- Harbinger of the Runed
		40118,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- Algari Dungeoneer
		40138,
		{
			RewardType = rewardType.Transmog,
		},
	},
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
	{ -- Khaz Algar Safari
		40194,
		{
			RewardType = rewardType.Pet,
		},
	},
    {40210}, -- Deephaul Ravine Victory
    {40211}, -- Deephaul Ravine Veteran
    {40215}, -- Deephaul Ravine Shutout
    {40216}, -- Deephaul Ravine Expedience
    {40217}, -- Battleground Blitzer
    {40219}, -- Battleground Blitzest
    {40220}, -- Setting Records
    {40221}, -- Battleground Blitz Master
	{ -- Echoes of Danger
		40222,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- The War Within Pathfinder
		40231,
		{
			RewardType = rewardType.Other,
		},
	},
	{ -- Glory of the Nerub-ar Raider
		40232,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Strategist: The War Within Season 1
        40233,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Warlord: The War Within Season 1
        40234,
        faction.Horde,
        40235,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Marshal: The War Within Season 1
        40235,
        faction.Alliance,
        40234,
        {
            RewardType = rewardType.Title,
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
	{ -- Mythic: Queen Ansurek
		40243,
		{
			RewardType = rewardType.Title,
		},
	},
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
    { -- Allied Races: Earthen
		40307,
		{
			RewardType = rewardType.AlliedRace,
		},
	},
    {40308}, -- Beacon of Hope
    { -- Heritage of the Earthen
		40309,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {40311}, -- Sharing the Light
    {40312}, -- Starting the Flames
    {40313}, -- Igniting the Keyflames
	{ -- Fragments of Memories
		40314,
		{
			RewardType = rewardType.Toy,
		},
	},
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
	{ -- Khaz Algar Completionist: Gold
		40354,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Life on the Farm
		40360,
		{
			RewardType = rewardType.Transmog,
		},
	},
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
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Forged Legend: The War Within Season 1
        40381,
        {
            RewardType = rewardType.Title,
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
            RewardType = rewardType.Title,
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
            RewardType = rewardType.Title,
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
            RewardType = rewardType.Title,
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
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Elite: The War Within Season 1
        40392,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Gladiator: The War Within Season 1
        40393,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Legend: The War Within Season 1
        40395,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
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
    { -- Khaz Algar Flight Master
		40430,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Hunting the Hunter
        40431,
        {
            {"PvE Season", 13},
        },
    },
    { -- Let Me Solo Him: Zekvir
        40433,
        {
            {"PvE Season", 13},
        },
    },
    {40434}, -- Treasures of the Isle of Dorn
    {40435}, -- Adventurer of the Isle of Dorn
    {40436}, -- You're Getting a Delve!
    {40437}, -- Delver of the Depths
	{ -- Glory of the Delver
		40438,
		{
			RewardType = rewardType.Mount,
		},
	},
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
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    {40473}, -- Not So Quick Fix
    {40475}, -- To All the Slimes I Love
    { -- 10 Algari Seekerthread
		40476,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 20 Algari Seekerthread
		40480,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 30 Algari Seekerthread
		40484,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 40 Algari Seekerthread
		40485,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 50 Algari Seekerthread
		40487,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 60 Algari Seekerthread
		40488,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 70 Algari Seekerthread
		40489,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 80 Algari Seekerthread
		40490,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 90 Algari Seekerthread
		40491,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 100 Algari Seekerthread
		40492,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 10 Algari Anglerthread
		40494,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 20 Algari Anglerthread
		40495,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 60 Algari Anglerthread
		40496,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 30 Algari Anglerthread
		40497,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 70 Algari Anglerthread
		40498,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 40 Algari Anglerthread
		40499,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 80 Algari Anglerthread
		40500,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 100 Algari Anglerthread
		40501,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 50 Algari Anglerthread
		40502,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- 90 Algari Anglerthread
		40503,
		{
			RewardType = rewardType.Other,
		},
	},
    {40504}, -- Rocked to Sleep
	{ -- Leave No Treasure Unfound
		40506,
		{
			RewardType = rewardType.Title,
		},
	},
    {40507}, -- Hanging Tight
    { -- War Within Delves: Tier 2
		40512,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- War Within Delves: Tier 3
		40514,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- War Within Delves: Tier 4 (Season 1)
		40515,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 5 (Season 1)
		40516,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 6 (Season 1)
		40517,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 7 (Season 1)
		40518,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 8 (Season 1)
		40519,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 9 (Season 1)
		40520,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
    { -- War Within Delves: Tier 10 (Season 1)
		40521,
		{
			RewardType = rewardType.Other,
            {"PvE Season", 13},
		},
	},
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
	{ -- The Derby Dash
		40539,
		{
			RewardType = rewardType.Mount,
		},
	},
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
	{ -- Deepholla
		40617,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Lost and Found
		40618,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {40620}, -- Back to the Wall
    {40621}, -- The Rookery
    {40622}, -- Biblo Archivist
    {40623}, -- I Only Need One Trip
    {40624}, -- Itsy Bitsy Spider
    {40625}, -- The Missing Lynx
    {40628}, -- Notable Machines
    {40629}, -- Bookworm
    {40630}, -- For the Collective
    { -- War Within Delves: Tier 1
		40631,
		{
			RewardType = rewardType.Other,
		},
	},
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
    { -- The War Within Season 1: Spelunker Supreme
		40660,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- It's Not Much, But It's Honest Work
		40662,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Khaz Algar Glyph Hunter
		40702,
		{
			RewardType = rewardType.Mount,
		},
	},
    {40703}, -- The Ringing Deeps Glyph Hunter
    {40704}, -- Hallowfall Glyph Hunter
    {40705}, -- Azj-Kahet Glyph Hunter
    { -- Web-Wrapped in the Finest Silks
		40723,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {40724}, -- Treasures of The Ringing Deeps
    { -- War Within Delves: Endgame
		40725,
		{
			RewardType = rewardType.Other,
		},
	},
	{ -- War Within Delves: Tier 11 (Season 1)
		40726,
		{
			RewardType = rewardType.Title,
            {"PvE Season", 13},
		},
	},
    {40727}, -- Skittershaw Spin
    { -- Forged Finery
        40728,
        {
            IsPvP = true,
        },
    },
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
            RewardType = rewardType.Toy,
            IsPvP = true,
            {"PvP Season", 38},
        },
    },
    { -- Battleground Blitz Medic: The War Within
        40795,
        {
            RewardType = rewardType.Toy,
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
    { -- Worm Theory
		40869,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- The Grand Tapestry
		40874,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- True Strength
		40875,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Vox Arachni
		40876,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Copious Coffers
		40882,
		{
			RewardType = rewardType.Title,
		},
	},
    {40885}, -- The Key to Madness
    -- {40904}, -- Cornerstone of Dornogal [Removed in 11.0.7, replaced by 41162]
    -- {40905}, -- From Many, One [Removed in 11.0.7, replaced by 41166]
    -- {40906}, -- The Flame Burns Within [Removed in 11.0.7, replaced by 41168]
    -- {40907}, -- We Rise Anew [Removed in 11.0.7, replaced by 41164]
    { -- Harbinger of the Gilded
        40939,
        {
            {"PvE Season", 13},
        }
    },
};

KrowiAF.AchievementData["11_00_05"] = {
    {KrowiAF.SetAchievementPatch, 11, 0, 5},
	{ -- Good Things Come in Small Packages
		15644,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- Court is Now in Session
		16731,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Zoomies!
        40661,
        {
            {"Event", 1592},
        },
    },
	{ -- Azeroth's Greatest Detective
		40870,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Assistant to the Assistant Guest Relations Manager
		40871,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- I Saved the Party and All I Got Was This Lousy Hat
		40872,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {40873}, -- Crate Insurance Agent
    {40967}, -- Ratts' Revenge
    { -- A Cool Twenty Years
        40976,
        {
            RewardType = rewardType.Mount,
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
    { -- Family Battler of Khaz Algar
		40980,
		{
			RewardType = rewardType.Pet,
		},
	},
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
    { -- Upgraded Apparel
		41013,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- A Dark Iron Past
        41015,
        {
            {"Event", 1592},
        },
    },
    { -- Classy Dresser
		41033,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Token Collector
        41038,
        {
            RewardType = rewardType.Other,
            {"Event", 1592},
        },
    },
    { -- Forged Weapons of Conquest
        41044,
        {
            RewardType = rewardType.Transmog,
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
	{ -- Fate of the Kirin Tor
		40791,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- A Farewell to Arms
		40953,
		{
			RewardType = rewardType.Mount,
		},
	},
    {40955}, -- War Stories
	{ -- I'm On Island Time
		40956,
		{
			RewardType = rewardType.Mount,
		},
	},
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
    { -- Lingering Shadows
		41052,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Master of the Turbulent Timeways II
        41056,
        {
            RewardType = rewardType.Mount,
            {"Event", 1425, false},
        },
    },
    { -- Elders of Khaz Algar
        41130,
        {
            {"Event", 327},
        },
    },
    {41131}, -- Treasures of the Storm
	{ -- Isle Remember You
		41133,
		{
			RewardType = rewardType.Mount,
		},
	},
    {41149}, -- The Severed Threads
    { -- Lub and Plunder
        41152,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- Swabbie Swag
        41153,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- Decked Out
        41154,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- Buckled Up
        41156,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- Plunder Siege
        41157,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- It's a Plunderful Life
        41160,
        -- {
        --     {"Event", 1601},
        -- },
    },
    {41161}, -- Council of Dornogal
    {41162}, -- Cornerstone of Dornogal
    { -- Lord of the Bling
        41163,
        -- {
        --     {"Event", 1601},
        -- },
    },
    {41164}, -- We Rise Anew
    {41165}, -- Assembly of the Deeps
    {41166}, -- From Many, One
    {41167}, -- Hallowfall Arathi
    {41168}, -- The Flame Burns Within
    { -- Khaz Algar Diplomat
		41169,
		{
			RewardType = rewardType.Transmog,
		},
	},
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
	{ -- You Xal Not Pass
		41201,
		{
			RewardType = rewardType.Mount,
		},
	},
    {41202}, -- Hot Tropic
    {41203}, -- Bwon Voyage
    {41204}, -- Dune Squad
    {41205}, -- Sound Off
    {41206}, -- Songs of Storms
    {41207}, -- When the Drust Settles
    {41209}, -- Dressed to Kill: Battle for Azeroth
};

KrowiAF.AchievementData["11_01_00"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 0},
    {40142}, -- Learning to Share
    {40145}, -- So Much Sharing
    {40894}, -- Sojourner of Undermine
    {40900}, -- Undermined
    { -- The War Within Season 2: Master Blaster
        40911,
		{
			RewardType = rewardType.Transmog,
		},
    },
    {40936}, -- Undermine Skyrocketing: Bronze
    {40937}, -- Undermine Skyrocketing: Silver
    { -- Undermine Skyrocketing: Gold
        40938,
        {
            RewardType = rewardType.Title,
        },
    },
    {-- Weathered of the Undermine
        40942,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- Carved of the Undermine
        40943,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- Runed of the Undermine
        40944,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- Gilded of the Undermined
        40945,
        {
            {"PvE Season", 14},
        }
    },
    {40948}, -- Nine-Tenths of the Law
    { -- The War Within Keystone Explorer: Season Two
        40949,
        {
            {"PvE Season", 14},
        },
    },
    { -- The War Within Keystone Conqueror: Season Two
        40950,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 14},
        },
    },
    { -- The War Within Keystone Legend: Season Two
        40951,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 14},
        },
    },
    { -- The War Within Keystone Hero: Season Two
        40952,
        {
            {"PvE Season", 14},
        },
    },
    { -- Enterprising Hero: The War Within Season Two
        40954,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: The MOTHERLODE!!
        40965,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Keystone Hero: Operation: Mechagon - Workshop
        40966,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- Rival I: The War Within Season 2
        41016,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Rival II: The War Within Season 2
        41017,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Duelist: The War Within Season 2
        41018,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Elite: The War Within Season 2
        41019,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Combatant I: The War Within Season 2
        41020,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Combatant II: The War Within Season 2
        41021,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Challenger I: The War Within Season 2
        41022,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Challenger II: The War Within Season 2
        41023,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Gladiator: The War Within Season 2
        41032,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Prized Weapons of Conquest
        41047,
        {
            RewardType = rewardType.Transmog,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Undermine Breaknecking: Bronze
        41081,
		{
			RewardType = rewardType.Mount,
		},
    },
    {41083}, -- Undermine Breaknecking: Silver
    { -- Undermine Breaknecking: Gold
        41084,
		{
			RewardType = {rewardType.Mount, rewardType.Title},
		},
    },
    { -- Ally of Undermine
        41086,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Undermine Safari
        41092,
        {
            RewardType = rewardType.Pet,
        },
    },
    { -- Delve Beyond
        41095,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Delve Infinite
        41096,
        {
            RewardType = rewardType.Title,
        },
    },
    {41097}, -- Curiosity Never Killed the Looter
    {41098}, -- Excavation Site 9 Stories
    {41099}, -- Sidestreet Sluice Stories
    {41100}, -- Excavation Site 9 Discoveries
    {41101}, -- Sidestreet Sluice Discoveries
    {41105}, -- Prodigious Plentiful Perplexing Puzzles
    {41106}, -- Algari Delver Damage Dealer
    {41107}, -- Algari Delver Healer
    {41108}, -- Algari Delver Tank
    {41109}, -- Algari Delver Damage Dealer II
    {41110}, -- Algari Delver Damage Dealer III
    {41111}, -- Algari Delver Healer II
    {41112}, -- Algari Delver Healer III
    {41113}, -- Algari Delver Tank II
    {41114}, -- Algari Delver Tank III
    {41115}, -- Algari Delver
    {41116}, -- Algari Delver II
    {41119}, -- One Rank Higher
    {41120}, -- Two Ranks Higher
    {41121}, -- Three Ranks Higher
    { -- Best In Class
        41122,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- War Within Delves: Tier 4 (Season 2)
        41191,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 5 (Season 2)
        41192,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 7 (Season 2)
        41193,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 8 (Season 2)
        41194,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 9 (Season 2)
        41195,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 10 (Season 2)
        41196,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 11 (Season 2)
        41197,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 14},
        },
    },
    { -- War Within Delves: Tier 6 (Season 2)
        41198,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 14},
        },
    },
    {41208}, -- Hold My Gear!
    { -- Let Me Solo Him: The Underpin
        41210,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 14},
        },
    },
    { -- A Good Day to Dye Hard
        41211,
        {
            RewardType = rewardType.Toy,
        },
    },
    {41214}, -- Under the Echoes
    {41215}, -- Echoes of Deeper Dangers
    {41216}, -- Adventurer of Undermine
    {41217}, -- Treasures of Undermine
    {41222}, -- Liberation of Undermine
    {41223}, -- Heroic: Liberation of Undermine
    {41224}, -- Mythic: Liberation of Undermine
    {41225}, -- Shock and Awesome
    {41226}, -- Maniacal Machinist
    {41227}, -- Beating the Odds
    {41228}, -- Fall of the Chrome King
    {41229}, -- Mythic: Vexie and the Geargrinders
    {41230}, -- Mythic: Cauldron of Carnage
    {41231}, -- Mythic: Rik Reverb
    {41232}, -- Mythic: Stix Bunkjunker
    {41233}, -- Mythic: Sprocketmonger Lockenstock
    {41234}, -- Mythic: The One-Armed Bandit
    {41235}, -- Mythic: Mug'Zee, Heads of Security
    { -- Mythic: Chrome King Gallywix
        41236,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Glory of the Liberation of Undermine Raider
        41286,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Cutting Edge: Chrome King Gallywix
        41297,
        {
            {"PvE Season", 14},
        },
    },
    { -- Ahead of the Curve: Chrome King Gallywix
        41298,
        {
            {"PvE Season", 14},
        },
    },
    {41337}, -- Sleep with the Fishes
    {41338}, -- Just /Dance
    {41339}, -- Operation: Floodgate
    {41340}, -- Heroic: Operation: Floodgate
    {41341}, -- Mythic: Operation: Floodgate
    {41347}, -- Scheming on a Thing
    { -- Keystone Hero: Operation: Floodgate
        41348,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 14},
        },
    },
    { -- In with the Cartels
        41349,
        {
            RewardType = rewardType.Pet,
        },
    },
    { -- A Long Fuse
        41350,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Cartels Bestie
        41351,
        {
            RewardType = rewardType.Transmog,
        },
    },
    { -- Trade-Duke
        41352,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Prized Gladiator: The War Within Season 2
        41354,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Prized Legend: The War Within Season 2
        41355,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Prized Warlord: The War Within Season 2
        41356,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Prized Marshal: The War Within Season 2
        41357,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Legend: The War Within Season 2
        41358,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Battle Mender: The War Within Season 2
        41359,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Hero of the Horde: Prized
        41360,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Hero of the Alliance: Prized
        41361,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Prized Gladiator's Fel Bat
        41362,
        {
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    { -- Strategist: The War Within Season 2
        41363,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
            IsPvP = true,
            {"PvP Season", 39},
        },
    },
    {41522}, -- Tour of Duty: Undermine
    {41525}, -- Can You Please Spell "Gobanna?"
    { -- Breaking the Bank
        41529,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 14},
        },
    },
    { -- My New Nemesis
        41530,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 14},
        },
    },
    { -- The Hataclysm
        41531,
        {
            {"PvE Season", 14},
        },
    },
    {41532}, -- I've Got a Flying Machine?
    { -- The War Within Keystone Master: Season Two
        41533,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 14},
        },
    },
    {41537}, -- Buddy System VII
    {41541}, -- Critter Battler of Undermine
    {41542}, -- Aquatic Battler of Undermine
    {41543}, -- Beast Battler of Undermine
    {41544}, -- Dragonkin Battler of Undermine
    {41545}, -- Elemental Battler of Undermine
    {41546}, -- Flying Battler of Undermine
    {41547}, -- Humanoid Battler of Undermine
    {41548}, -- Magic Battler of Undermine
    {41549}, -- Mechanical Battler of Undermine
    {41550}, -- Undead Battler of Undermine
    { -- Family Battler of Undermine
        41551,
        {
            RewardType = rewardType.Pet,
        },
    },
    {41554}, -- The Splash Zone
    { -- All That Khaz
        41555,
        {
            RewardType = rewardType.WarbandCampsite,
        },
    },
    { -- Going Goblin Mode
        41586,
        {
            RewardType = rewardType.WarbandCampsite,
        },
    },
    {41587}, -- Explore Undermine
    { -- Read Between the Lines
        41588,
        {
            RewardType = rewardType.Toy,
        },
    },
    {41589}, -- That Can-Do Attitude
    {41590}, -- No Littering
    {41591}, -- Really No Littering
    {41592}, -- Absolutely Zero Littering
    {41593}, -- Cleanin' the Streets
    {41594}, -- Can You Believe What People Throw Away?
    { -- Prized Guise
        41595,
        {
            IsPvP = true,
        }
    },
    { -- Garbage In, Garbage Out
        41596,
        {
            RewardType = rewardType.Title,
        },
    },
    {41626, }, -- C.H.E.T.T. a Look
    {41627, }, -- C.H.E.T.T.ing it Twice
    { -- C.H.E.T.T.mate
        41629,
        {
            RewardType = rewardType.Title,
        },
    },
    {41630, }, -- "Employee" of the Month
    { -- Dressed to the Mines
        41665,
		{
			RewardType = rewardType.Transmog,
		},
    },
    {41694}, -- Flarendo's Biggest Fan
    {41695}, -- Torq's Biggest Fan
    {41708}, -- You're My Friend Now
    { -- Journey's End (Season 2)
        41709,
        {
            {"PvE Season", 14},
        },
    },
    {41711}, -- Conveyor Slayer
    {41714}, -- From Trash to Treasure
    {41723}, -- Buddy System VIII
};

KrowiAF.AchievementData["11_01_05"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 5},
    { -- Flame Warden of Khaz Algar
        41631,
        faction.Alliance,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Khaz Algar
        41632,
        faction.Horde,
        {
            {"Event", 341},
        },
    },
    { -- Dastardly Duos Weekly High Score
        41706,
        {
            {"Event", 1599},
        },
    },
    { -- Dastardly Devices
        41707,
        {
            {"Event", 1599},
        },
    },
    { -- Fiendishly Famous
        41715,
        {
            RewardType = rewardType.Other,
            {"Event", 1599},
        },
    },
    { -- Duo Darling
        41716,
        {
            RewardType = rewardType.Other,
            {"Event", 1599},
        },
    },
    { -- Duos Underdog
        41717,
        {
            {"Event", 1599},
        },
    },
    { -- Inside Connections
        41722,
        {
            RewardType = rewardType.Other,
            {"Event", 1599},
        },
    },
    {41725}, -- We Have the Memories
    { -- Winner's Podium
        41810,
        {
            {"Event", 1599},
        },
    },
    {41853}, -- Horrific Vision of Stormwind
    {41854}, -- The Even More Horrific Vision of Stormwind
    {41855}, -- The Most Horrific Vision of Stormwind
    { -- Masked Soliloquy
        41857,
        {
            RewardType = rewardType.Other,
        },
    },
    {41858}, -- Masked Sextet
    {41859}, -- Thanks For The Mementos
    { -- Incremental Progress
        41873,
		{
			RewardType = rewardType.Transmog,
		},
    },
    { -- Symphony of Masks
        41874,
		{
			RewardType = rewardType.Transmog,
		},
    },
    {41875}, -- Horrific Vision of Orgrimmar
    {41876}, -- The Even More Horrific Vision of Orgrimmar
    {41879}, -- The Most Horrific Vision of Orgrimmar
    {41889}, -- Horrific Masquerade
    {41890}, -- Masked Duet
    {41891}, -- Masked Trio
    {41893}, -- Masked Quartet
    {41894}, -- Masked Septet
    {41895}, -- Orchestra of Masks
    {41896}, -- Memento Mori
    {41897}, -- A Monumental Amount of Mementos
    {41898}, -- A Mountain of Mementos
    { -- Center of Attention
        41905,
        {
            {"Event", 1599},
        },
    },
    { -- My Way, The Highway
        41916,
        {
            {"Event", 1599},
        },
    },
    { -- Undefeatable
        41922,
        {
            {"Event", 1599},
        },
    },
    { -- Reeking of Visions
        41928,
        {
            RewardType = rewardType.Pet,
        },
    },
    { -- Through the Depths of Visions
        41929,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Defeat the Dastardlies
        41948,
        {
            {"Event", 1599},
        },
    },
    { -- Defeat the Dastardlies
        41949,
        {
            {"Event", 1599},
        },
    },
    { -- Defeat the Dastardlies
        41950,
        {
            {"Event", 1599},
        },
    },
    { -- Defeat the Dastardlies
        41951,
        {
            {"Event", 1599},
        },
    },
    { -- Defeat the Dastardlies
        41952,
        {
            {"Event", 1599},
        },
    },
    { -- Mad World
        41953,
        {
            RewardType = rewardType.Title,
        },
    },
    {41964}, -- Beyond the Most Horrific Vision of Stormwind
    {41965}, -- Beyond the Most Horrific Vision of Orgrimmar
    { -- Mastering the Visions
        41966,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Through the Looking Glass
        41971,
        {
            RewardType = rewardType.Title,
        },
    },
    {41983}, -- Memento Mania
    { -- Boot Hill
        41995,
        {
            {"Event", 1599},
        },
    },
    {41996}, -- I'm Doing My Part
    {41997}, -- Owner of a Radiant Heart
    {41998}, -- Turning the Venom Tide
    {41999}, -- Fighter of the Nightman
    { -- Bullhorn of Plenty
        42002,
        {
            {"Event", 1599},
        },
    },
    { -- Bullhorn of More Plenty
        42003,
        {
            {"Event", 1599},
        },
    },
    { -- Bullhorn of Most Plenty
        42004,
        {
            {"Event", 1599},
        },
    },
    { -- The Enterprising Tank
        42139,
        {
            {"PvE Season", 14},
        },
    },
    { -- The Enterprising Healer
        42141,
        {
            {"PvE Season", 14},
        },
    },
    { -- The Enterprising Damage Dealer
        42144,
        {
            {"PvE Season", 14},
        },
    },
    { -- The Enterprising Dungeon Master
        42148,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 14},
        },
    },
};

KrowiAF.AchievementData["11_01_07"] = {
    {KrowiAF.SetAchievementPatch, 11, 1, 7},
    { -- Master of the Turbulent Timeways III
        41779,
        {
            RewardType = rewardType.Mount,
            {"Event", 1425},
        },
    },
    { -- Rise of the Red Dawn
        41818,
        faction.Alliance,
        41820,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Rise of the Red Dawn
        41820,
        faction.Horde,
        41818,
        {
            RewardType = rewardType.Title,
        },
    },
    {42029}, -- The Emerald Nightmare
    {42030}, -- The Nighthold
    {42031}, -- Tomb of Sargeras
    {42032}, -- Antorus, the Burning Throne
    {42187}, -- Lorewalking: Ethereal Wisdom
    {42188}, -- Lorewalking: Blade's Bane
    {42189}, -- Lorewalking: The Lich King
    { -- Titan Console Overcharged
        42212,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Overcharged Delver
        42241,
        {
            RewardType = rewardType.Toy,
        },
    },
};