local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["08_00_01"] = {
    {KrowiAF.SetAchievementPatch, 8, 0, 1},
    { -- The Throne of Zuldazar
        11861,
        faction.Horde,
        12473,
    },
    { -- The Dark Heart of Nazmir
        11868,
        faction.Horde,
        12497,
    },
    { -- The Reining Champion
        12087,
        faction.Alliance,
    },
    { -- Collector's Edition: Seabraid Stallion
        12229,
        faction.Alliance,
        12230,
    },
    { -- Collector's Edition: Gilded Ravasaur
        12230,
        faction.Horde,
        12229,
    },
    {12232}, -- Collector's Edition: Tottle
    {12270}, -- Bringing Hexy Back
    {12272}, -- Gold Fever
    {12273}, -- It's Lit!
    { -- Salute to StarCraft
        12454,
        {
            {"From", "Date", {2018, 3, 31}, "Until", "Date", {2018, 4, 6}},
        },
    },
    {12457}, -- Remix to Ignition
    {12462}, -- Shot Through the Heart
    { -- A Sound Plan
        12473,
        faction.Alliance,
        11861,
    },
    { -- Secrets in the Sands
        12478,
        faction.Horde,
        12496,
    },
    { -- Zandalar Forever!
        12479,
        faction.Horde,
        12891,
    },
    { -- A Bargain of Blood
        12480,
        faction.Horde,
    },
    { -- The Final Seal
        12481,
        faction.Horde,
    },
    {12482}, -- Get Hek'd
    {12483}, -- Waycrest Manor
    {12484}, -- Heroic: Waycrest Manor
    {12488}, -- Mythic: Waycrest Manor
    {12489}, -- Losing My Profession
    {12490}, -- Alchemical Romance
    {12495}, -- Run Wild Like a Man On Fire
    { -- Stormsong and Dance
        12496,
        faction.Alliance,
        12478,
    },
    { -- Drust Do It.
        12497,
        faction.Alliance,
        11868,
    },
    {12498}, -- Taint Nobody Got Time For That
    {12499}, -- Sporely Alive
    {12500}, -- Underrot
    {12501}, -- Heroic: Underrot
    {12502}, -- Mythic: Underrot
    {12503}, -- Snake Eyes
    {12504}, -- The Temple of Sethraliss
    {12505}, -- Heroic: The Temple of Sethraliss
    {12506}, -- Mythic: The Temple of Sethraliss
    {12507}, -- Snake Eater
    {12508}, -- Good Night, Sweet Prince
    { -- Ready for War
        12509,
        faction.Horde,
        12510,
    },
    { -- Ready for War
        12510,
        faction.Alliance,
        12509,
    },
    { -- Allied Races: Dark Iron Dwarf
        12515,
        faction.Alliance,
    },
    { -- Allied Races: Mag'har Orc
        12518,
        faction.Horde,
    },
    {12521}, -- Halls of Containment
    {12522}, -- Crimson Descent
    {12523}, -- Heart of Corruption
    {12524}, -- Mythic: Taloc
    {12526}, -- Mythic: MOTHER
    {12527}, -- Mythic: Zek'voz
    {12529}, -- Mythic: Vectis
    {12530}, -- Mythic: Fetid Devourer
    {12531}, -- Mythic: Zul
    {12532}, -- Mythic: Mythrax the Unraveler
	{ -- Mythic: G'huun
		12533,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Cutting Edge: G'huun
        12535,
        {
            {"PvE Season", 1},
        },
    },
    { -- Ahead of the Curve: G'huun
        12536,
        {
            {"PvE Season", 1},
        },
    },
    { -- Level 120 (Legacy)
        12544,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Superior (Battle)
        12546,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Epic (Battle)
        12547,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {12548}, -- I'm in Charge Now!
    {12549}, -- Not a Fun Guy
    {12550}, -- Pecking Order
    {12551}, -- Double Dribble
    { -- Welcome to Zandalar
        12555,
        faction.Horde,
        12582,
    },
    {12556}, -- Explore Tiragarde Sound
    {12557}, -- Explore Drustvar
    {12558}, -- Explore Stormsong Valley
    {12559}, -- Explore Zuldazar
    {12560}, -- Explore Vol'dun
    {12561}, -- Explore Nazmir
    { -- The Horde Slayer
        12567,
        faction.Alliance,
        12568,
        true,
    },
    { -- The Alliance Slayer
        12568,
        faction.Horde,
        12567,
        true,
    },
    { -- Bounty Hunting
        12571,
        {
            IsPvP = true,
        },
    },
    { -- War Supplied
        12572,
        {
            IsPvP = true,
        },
    },
    { -- Band of Brothers
        12573,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Nazmir
        12574,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Zuldazar
        12575,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Vol'dun
        12576,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Tiragarde Sound
        12577,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Stormsong Valley
        12578,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Drustvar
        12579,
        {
            IsPvP = true,
        },
    },
    { -- Come Sail Away
        12582,
        faction.Alliance,
        12555,
    },
    {12587}, -- Unbound Monstrosities
    {12588}, -- Eat Your Greens
    {12589}, -- Heroic: Un'gol Ruins
    {12590}, -- Un'gol Ruins
    {12591}, -- Mythic: Un'gol Ruins
    { -- Ruined the Ruins
        12592,
        {
            IsPvP = true,
        },
    },
    { -- Loremaster of Kul Tiras
        12593,
        faction.Alliance,
        13294,
    },
    {12594}, -- Competent Captain
    {12595}, -- Expert Expeditioner
    {12596}, -- No Tourist
    { -- Bayside Brawler
        12597,
        {
            IsPvP = true,
        },
    },
    {12600}, -- Breath of the Shrine
    {12601}, -- The Void Lies Sleeping
    {12602}, -- Trust No One
    { -- Conqueror of Azeroth
        12604,
        faction.Horde,
        12605,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Conqueror of Azeroth
        12605,
        faction.Alliance,
        12604,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Loa Expectations
        12614,
        faction.Horde,
    },
    { -- Spirits Be With You
        12719,
        faction.Horde,
    },
    {12721}, -- Wrap God
    {12722}, -- It Belongs in a Mausoleum!
	{ -- How to Keep a Mummy
		12723,
		{
			RewardType = rewardType.Pet,
		},
	},
    {12726}, -- A Fish Out of Water
    {12727}, -- Stand by Me
    { -- Professional Kul Tiran Master
        12731,
        faction.Alliance,
        12733,
    },
    { -- Professional Zandalari Master
        12733,
        faction.Horde,
        12731,
    },
    { -- Working in Kul Tiras
        12734,
        faction.Alliance,
        12735,
    },
    { -- Working in Zandalar
        12735,
        faction.Horde,
        12734,
    },
    { -- Kul Tiran Master of All
        12736,
        faction.Alliance,
        12737,
    },
    { -- Zandalari Master of All
        12737,
        faction.Horde,
        12736,
    },
    {12738}, -- Holy Scrap!
    {12739}, -- Scraptastic!
    {12740}, -- Full of Scrap!
    { -- Giving a Scrap
        12741,
        faction.Alliance,
        13056,
    },
    { -- Kul Tiran Cook
        12742,
        faction.Alliance,
        12743,
    },
    { -- Zandalari Cook
        12743,
        faction.Horde,
        12742,
    },
    { -- The Kul Tiran Menu
        12744,
        faction.Alliance,
        12746,
    },
    { -- The Zandalari Menu
        12746,
        faction.Horde,
        12744,
    },
    {12747}, -- Catering for Combat
    { -- Kul Tiran Fisherman
        12753,
        faction.Alliance,
        12754,
    },
    { -- Zandalari Fisherman
        12754,
        faction.Horde,
        12753,
    },
    {12755}, -- Scent of the Sea
    {12756}, -- Fish Me In the Moonlight
    {12757}, -- Angling for Battle
    { -- Baiting the Enemy
        12758,
        faction.Alliance,
        12759,
    },
    { -- Baiting the Enemy
        12759,
        faction.Horde,
        12758,
    },
    { -- Kul Tiran Archaeologist
        12760,
        faction.Alliance,
        12761,
    },
    { -- Zandalari Archaeologist
        12761,
        faction.Horde,
        12760,
    },
    { -- Kul Tiran Curator
        12762,
        faction.Alliance,
        12764,
    },
    { -- Zandalari Curator
        12764,
        faction.Horde,
        12762,
    },
    {12765}, -- Exotic Discoveries
    {12769}, -- Light Travel
    {12770}, -- Lengthy Legwork
    {12771}, -- Treasures of Nazmir
    {12772}, -- Now We Got Bad Blood
	{ -- Glory of the Uldir Raider
		12806,
		{
			RewardType = rewardType.Mount,
		},
	},
    {12807}, -- Battle for Azeroth Dungeon Hero
	{ -- Glory of the Wartorn Hero
		12812,
		{
			RewardType = rewardType.Mount,
		},
	},
    {12823}, -- Thrash Mouth - All Stars
    {12824}, -- Atal'Dazar
    {12825}, -- Heroic: Atal'Dazar
    {12826}, -- Mythic: Atal'Dazar
    { -- WoW's 14th Anniversary
        12827,
        {
            {},
        },
    },
    {12828}, -- What's in the Box?
    {12830}, -- Edgelords
    {12831}, -- Freehold
    {12832}, -- Heroic: Freehold
    {12833}, -- Mythic: Freehold
    {12835}, -- Shrine of the Storm
    {12836}, -- Existential Crisis
    {12837}, -- Heroic: Shrine of the Storm
    {12838}, -- Mythic: Shrine of the Storm
    {12840}, -- Tol Dagor
    {12841}, -- Heroic: Tol Dagor
    {12842}, -- Mythic: Tol Dagor
    {12844}, -- The MOTHERLODE!!
    {12845}, -- Heroic: The MOTHERLODE!!
    {12846}, -- Mythic: The MOTHERLODE!!
    {12847}, -- Siege of Boralus
    {12848}, -- Kings' Rest
    {12849}, -- Treasures of Vol'dun
    {12850}, -- At Least You're Being Careful
    {12851}, -- Treasures of Zuldazar
    {12852}, -- Treasures of Tiragarde Sound
    {12853}, -- Treasures of Stormsong Valley
    {12854}, -- Ready for Raiding VI
    {12855}, -- Pitch Invasion
    { -- The First Rule of Dueler's Guild
        12856,
        {
            IsPvP = true,
        },
    },
    { -- Trial by Combat
        12857,
        {
            IsPvP = true,
        },
    },
    { -- Slugfest
        12858,
        {
            IsPvP = true,
        },
    },
    { -- Prize Fighter
        12859,
        {
            IsPvP = true,
        },
    },
    { -- Contender
        12860,
        {
            IsPvP = true,
        },
    },
    { -- Master of Duels
        12861,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Thirty Six and Two
        12862,
        {
            IsPvP = true,
        },
    },
    { -- Dueling Master
        12863,
        {
            RewardType = rewardType.Tabard,
            IsPvP = true,
        },
    },
	{ -- 80 Exalted Reputations
		12864,
		{
			RewardType = rewardType.Title,
		},
	},
    {12865}, -- 90 Exalted Reputations
	{ -- 100 Exalted Reputations
		12866,
		{
            RewardType = {rewardType.Title, rewardType.Mount},
		},
	},
    { -- Azeroth at War: The Barrens
        12867,
        faction.Horde,
        12896,
    },
    { -- Azeroth at War: After Lordaeron
        12869,
        faction.Horde,
        12898,
    },
    { -- Azeroth at War: Kalimdor on Fire
        12870,
        faction.Horde,
        12899,
    },
    {12872}, -- The Dirty Five
    { -- War is Hell
        12873,
        faction.Horde,
        12881,
    },
    {12874}, -- An Eventful Battle
    { -- Strike Fast
        12876,
        faction.Horde,
        12889,
    },
    { -- Strike Hard
        12877,
        faction.Horde,
        12888,
    },
    { -- Leader of Troops
        12878,
        faction.Horde,
        12884,
    },
    { -- Tour of War
        12879,
        faction.Horde,
        12886,
    },
    { -- War is Hell
        12881,
        faction.Alliance,
        12873,
    },
    { -- Leader of Troops
        12884,
        faction.Alliance,
        12878,
    },
    { -- Tour of War
        12886,
        faction.Alliance,
        12879,
    },
    { -- Strike Hard
        12888,
        faction.Alliance,
        12877,
    },
    { -- Strike Fast
        12889,
        faction.Alliance,
        12876,
    },
    { -- A Nation United
        12891,
        faction.Alliance,
        12479,
    },
    { -- Honor Level 5
        12893,
        {
            RewardType = rewardType.Pet,
            IsPvP = true,
        },
    },
    { -- Honor Level 10
        12894,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
        },
    },
    { -- Honor Level 15
        12895,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Azeroth at War: The Barrens
        12896,
        faction.Alliance,
        12867,
    },
    { -- Azeroth at War: After Lordaeron
        12898,
        faction.Alliance,
        12869,
    },
    { -- Azeroth at War: Kalimdor on Fire
        12899,
        faction.Alliance,
        12870,
    },
    { -- Honor Level 20
        12900,
        {
            RewardType = rewardType.Pet,
            IsPvP = true,
        },
    },
    { -- Honor Level 25
        12901,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 30
        12902,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
        },
    },
    { -- Honor Level 40
        12903,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Honor Level 50
        12904,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 60
        12905,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
        },
    },
    { -- Honor Level 70
        12906,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Honor Level 80
        12907,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 90
        12908,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
        },
    },
    { -- Honor Level 100
        12909,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 125
        12910,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Honor Level 150
        12911,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Honor Level 175
        12912,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
        },
    },
    { -- Honor Level 200
        12913,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 250
        12914,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Honor Level 300
        12915,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Honor Level 400
        12916,
        {
            RewardType = rewardType.Pet,
            IsPvP = true,
        },
    },
    { -- Honor Level 500
        12917,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    {12918}, -- Have a Heart
    {12927}, -- Polished Pet Charmer
	{ -- Battle Safari
		12930,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- No Stable Big Enough
        12931,
        faction.Horde,
        12932,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- No Stable Big Enough
        12932,
        faction.Alliance,
        12931,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- A Horde of Hoofbeats
        12933,
        faction.Alliance,
        12934,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- A Horde of Hoofbeats
        12934,
        faction.Horde,
        12933,
        {
            RewardType = rewardType.Mount,
        },
    },
	{ -- Battle on Zandalar and Kul Tiras
		12936,
		{
			RewardType = rewardType.Toy,
		},
	},
    {12937}, -- Elevator Music
    {12938}, -- Parental Controls
    {12939}, -- Adventurer of Tiragarde Sound
    {12940}, -- Adventurer of Stormsong Valley
    {12941}, -- Adventurer of Drustvar
    {12942}, -- Adventurer of Nazmir
    {12943}, -- Adventurer of Vol'dun
    {12944}, -- Adventurer of Zuldazar
    { -- Dread Gladiator: Battle for Azeroth Season 1
        12945,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    {12947}, -- Azerothian Diplomat
    { -- Talanji's Expedition
        12948,
        faction.Horde,
        12952,
    },
    { -- The Voldunai
        12949,
        faction.Horde,
        12953,
    },
    { -- Zandalari Empire
        12950,
        faction.Horde,
        12951,
    },
    { -- Proudmoore Admiralty
        12951,
        faction.Alliance,
        12950,
    },
    { -- Order of Embers
        12952,
        faction.Alliance,
        12948,
    },
    { -- Storm's Wake
        12953,
        faction.Alliance,
        12949,
    },
    { -- Champion of the 7th Legion
        12954,
        faction.Alliance,
        12957,
    },
    {12955}, -- Champions of Azeroth
    {12956}, -- Tortollan Seekers
    { -- Champion of the Honorbound
        12957,
        faction.Horde,
        12954,
    },
	{ -- Master of Minions
		12958,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- Challenger: Battle for Azeroth Season 1
        12959,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Rival: Battle for Azeroth Season 1
        12960,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Gladiator: Battle for Azeroth Season 1
        12961,
        {
            RewardType = {rewardType.Title, rewardType.Mount},
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Duelist: Battle for Azeroth Season 1
        12962,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Hero of the Alliance: Dread
        12963,
        faction.Alliance,
        12964,
        {
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Hero of the Horde: Dread
        12964,
        faction.Horde,
        12963,
        {
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    {12988}, -- Battle for Azeroth Explorer
    {12989}, -- Battle for Azeroth Pathfinder, Part One
    {12990}, -- Catchin' Some Rays
    {12991}, -- New Mog, G'huun This?
	{ -- Pet Emporium
		12992,
		{
			RewardType = rewardType.Pet,
		},
	},
    {12993}, -- Don't Warfront Me
    {12995}, -- Treasures of Drustvar
	{ -- Toybox Tycoon
		12996,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- The Pride of Kul Tiras
        12997,
        faction.Alliance,
    },
    {12998}, -- That Sweete Booty
    { -- Adept Sandfisher
        13009,
        faction.Horde,
    },
    {13011}, -- Scourge of Zem'lan
    { -- Vorrik's Champion
        13014,
        faction.Horde,
    },
    {13016}, -- Scavenger of the Sands
    { -- Champion of the Vulpera
        13017,
        faction.Horde,
    },
    {13018}, -- Dune Rider
    { -- Bow to Your Masters
        13020,
        faction.Horde,
    },
    { -- A Most Efficient Apocalypse
        13021,
        faction.Horde,
    },
    { -- Revenge is Best Served Speedily
        13022,
        faction.Horde,
    },
    {13023}, -- It's Really Getting Out of Hand
    {13024}, -- Carved in Stone, Written in Blood
    { -- Zandalari Spycatcher
        13025,
        faction.Horde,
    },
    { -- 7th Legion Spycatcher
        13026,
        faction.Alliance,
    },
    {13027}, -- Mushroom Harvest
    {13028}, -- Hoppin' Sad
    {13029}, -- Eating Out of the Palm of My Tiny Hand
    { -- How to Ptrain Your Pterrordax
        13030,
        faction.Horde,
    },
    {13035}, -- By de Power of de Loa!
    {13036}, -- A Loa of a Tale
    { -- Raptari Rider
        13038,
        faction.Horde,
    },
    { -- Paku'ai
        13039,
        faction.Horde,
    },
    { -- Hungry, Hungry Ranishu
        13041,
        faction.Horde,
    },
    {13042}, -- About To Break
    {13045}, -- Every Day I'm Truffling
    {13046}, -- These Hills Sing
    {13047}, -- Clever Use of Mechanical Explosives
    {13048}, -- Life Finds a Way... To Die!
    { -- The Long Con
        13049,
        faction.Alliance,
    },
    {13050}, -- Bless the Rains Down in Freehold
    {13051}, -- Legends of the Tidesages
    { -- Deadliest Cache
        13053,
        faction.Alliance,
    },
    {13054}, -- Sabertron Assemble
    { -- Giving a Scrap
        13056,
        faction.Horde,
        12741,
    },
    {13057}, -- Shanty Raid
    {13058}, -- Kul Tiran Up the Dance Floor
    { -- Drag Race
        13059,
        faction.Alliance,
    },
    { -- Kul Runnings
        13060,
        faction.Alliance,
    },
    {13061}, -- Three Sheets to the Wind
    { -- Let's Bee Friends
        13062,
        faction.Alliance,
        {
            RewardType = rewardType.Pet,
        },
    },
    {13064}, -- Drust the Facts, Ma'am
    {13075}, -- Battle for Azeroth Keymaster
    { -- Heritage of the Dark Iron
        13076,
        faction.Alliance,
    },
    { -- Heritage of the Mag'har
        13077,
        faction.Horde,
    },
    { -- Realm First! Battle for Azeroth Keystone Master
        13078,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Battle for Azeroth Keystone Conqueror: Season One
        13079,
        {
            {"PvE Season", 1},
        },
    },
    { -- Battle for Azeroth Keystone Master: Season One
        13080,
        {
            {"PvE Season", 1},
        },
    },
    { -- Everything Old Is New Again
        13082,
        faction.Alliance,
    },
    {13083}, -- Better, Faster, Stronger
    {13087}, -- Sausage Sampler
    { -- Dread Gladiator's Proto-Drake
        13093,
        {
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    {13094}, -- Cursed Game Hunter
    {13095}, -- Dread Chain
    {13096}, -- Heroic: Dread Chain
    {13097}, -- Mythic: Dread Chain
    { -- Bane of the Chain
        13098,
        {
            IsPvP = true,
        },
    },
    {13099}, -- Molten Cay
    {13100}, -- Heroic: Molten Cay
    {13101}, -- Mythic: Molten Cay
    { -- Clash at the Cay
        13102,
        {
            IsPvP = true,
        },
    },
    {13103}, -- Rotting Mire
    {13104}, -- Heroic: Rotting Mire
    {13105}, -- Mythic: Rotting Mire
    { -- Mire Marauder
        13106,
        {
            IsPvP = true,
        },
    },
    {13107}, -- Skittering Hollow
    {13108}, -- Heroic: Skittering Hollow
    {13109}, -- Mythic: Skittering Hollow
    { -- Skittering Smashed
        13110,
        {
            IsPvP = true,
        },
    },
    {13111}, -- Verdant Wilds
    {13112}, -- Heroic: Verdant Wilds
    {13113}, -- Mythic: Verdant Wilds
    { -- War for the Wilds
        13114,
        {
            IsPvP = true,
        },
    },
    { -- Reef Madness
        13115,
        {
            IsPvP = true,
        },
    },
    {13116}, -- Mythic: Whispering Reef
    {13118}, -- Heroic: Whispering Reef
    {13119}, -- Whispering Reef
    { -- Blood in the Water
        13120,
        {
            IsPvP = true,
        },
    },
    { -- Notorious
        13121,
        {
            IsPvP = true,
        },
    },
    {13122}, -- Island Conqueror
    {13123}, -- My Dubs
    {13124}, -- Metal Detector
    {13125}, -- Azerite Admiral
    {13126}, -- Give Me The Energy
    {13127}, -- Tell Me A Tale
    {13128}, -- I'm Here for the Pets
    { -- Sucker Punch
        13129,
        {
            IsPvP = true,
        },
    },
    {13132}, -- Helping Hand
    { -- Team Deathmatch
        13133,
        faction.Alliance,
        13135,
    },
    { -- Expedition Leader
        13134,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Team Deathmatch
        13135,
        faction.Horde,
        13133,
    },
    { -- Island Slayer
        13141,
        {
            IsPvP = true,
        },
    },
    {13142}, -- Archipelago Explorer
    {13144}, -- Wide World of Quests
};

KrowiAF.AchievementData["08_01_00"] = {
    {KrowiAF.SetAchievementPatch, 8, 1, 0},
    {13138}, -- Flying Colors
    {13196}, -- Meat Marauder
    { -- Combatant: Battle for Azeroth Season 1
        13199,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Sinister Gladiator: Battle for Azeroth Season 2
        13200,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Sinister Gladiator's Proto-Drake
        13202,
        {
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Challenger: Battle for Azeroth Season 2
        13203,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Combatant: Battle for Azeroth Season 2
        13204,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Rival: Battle for Azeroth Season 2
        13205,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Duelist: Battle for Azeroth Season 2
        13209,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Hero of the Alliance: Sinister
        13210,
        faction.Alliance,
        13211,
        {
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Hero of the Horde: Sinister
        13211,
        faction.Horde,
        13210,
        {
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- Gladiator: Battle for Azeroth Season 2
        13212,
        {
            RewardType = {rewardType.Title, rewardType.Mount},
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
    { -- In Teldrassil's Shadow
        13251,
        faction.Alliance,
        13263,
    },
    { -- The Shadow Hunter
        13263,
        faction.Horde,
        13251,
    },
	{ -- Pet Battle Challenge: Gnomeregan
		13269,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13270}, -- Beast Mode
    {13271}, -- Critters With Huge Teeth
    {13272}, -- Dragons Make Everything Better
    {13273}, -- Element of Success
    {13274}, -- Fun With Flying
    {13275}, -- Magician's Secrets
    {13277}, -- Machine Learning
    {13278}, -- Not Quite Dead Yet
	{ -- Family Battler
		13279,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13280}, -- Hobbyist Aquarist
    {13281}, -- Human Resources
    { -- Frontline Warrior
        13283,
        faction.Alliance,
        13284,
    },
    { -- Frontline Warrior
        13284,
        faction.Horde,
        13283,
    },
    { -- Upright Citizens
        13285,
        faction.Alliance,
        {
            RewardType = rewardType.Toy,
        },
    },
    { -- Siege of Dazar'alor
        13286,
        faction.Alliance,
        13289,
    },
    { -- Empire's Fall
        13287,
        faction.Alliance,
        13290,
    },
    { -- Might of the Alliance
        13288,
        faction.Alliance,
        13291,
    },
    { -- Defense of Dazar'alor
        13289,
        faction.Horde,
        13286,
    },
    { -- Death's Bargain
        13290,
        faction.Horde,
        13287,
    },
    { -- Victory or Death
        13291,
        faction.Horde,
        13288,
    },
    {13292}, -- Mythic: Champion of the Light
    {13293}, -- Mythic: Grong
    { -- Loremaster of Zandalar
        13294,
        faction.Horde,
        12593,
    },
    { -- Mythic: Jadefire Masters
        13295,
        faction.Horde,
        13298,
    },
    { -- War for the Shore
        13296,
        faction.Horde,
        13297,
    },
    { -- War for the Shore
        13297,
        faction.Alliance,
        13296,
    },
    { -- Mythic: Jadefire Masters
        13298,
        faction.Alliance,
        13295,
    },
    {13299}, -- Mythic: Opulence
    {13300}, -- Mythic: Conclave of the Chosen
    { -- Under Cover of Darkness
        13301,
        faction.Horde,
        13302,
    },
    { -- Under Cover of Darkness
        13302,
        faction.Alliance,
        13301,
    },
    { -- Night Moves
        13305,
        faction.Alliance,
        13306,
    },
    { -- Night Moves
        13306,
        faction.Horde,
        13305,
    },
    { -- Recruitment Officer
        13307,
        faction.Horde,
        13308,
    },
    { -- Recruitment Officer
        13308,
        faction.Alliance,
        13307,
    },
    { -- Deforester
        13309,
        faction.Horde,
        13310,
    },
    { -- By Nature's Call
        13310,
        faction.Alliance,
        13309,
    },
    {13311}, -- Mythic: King Rastakhan
    {13312}, -- Mythic: Mekkatorque
    {13313}, -- Mythic: Stormwall Blockade
	{ -- Mythic: Lady Jaina Proudmoore
		13314,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Glory of the Dazar'alor Raider
		13315,
		{
			RewardType = rewardType.Mount,
		},
	},
    {13316}, -- Can I Get a Hek Hek Hek Yeah?
    { -- Supplied and Ready
        13317,
        {
            IsPvP = true,
        },
    },
    { -- Ahead of the Curve: Lady Jaina Proudmoore
        13322,
        {
            {"PvE Season", 2},
        },
    },
    { -- Cutting Edge: Lady Jaina Proudmoore
        13323,
        {
            {"PvE Season", 2},
        },
    },
    {13325}, -- Walk the Dinosaur
    {13345}, -- Praise the Sunflower
    {13383}, -- Barrel of Monkeys
    { -- Kul Tirans Don't Look at Explosions
        13384,
        faction.Alliance,
    },
    {13385}, -- Daz'aling Attire
    { -- Frontline Veteran
        13387,
        faction.Alliance,
        13388,
        true,
    },
    { -- Frontline Veteran
        13388,
        faction.Horde,
        13387,
        true,
    },
    {13389}, -- Jorundall
    {13394}, -- Heroic: Jorundall
    {13395}, -- Mythic: Jorundall
    {13396}, -- Havenswood
    {13397}, -- Heroic: Havenswood
    {13398}, -- Mythic: Havenswood
    { -- Jorundall Justice
        13399,
        {
            IsPvP = true,
        },
    },
    { -- Havenswood Hero
        13400,
        {
            IsPvP = true,
        },
    },
    {13401}, -- I Got Next!
    { -- Frontline Slayer
        13402,
        faction.Alliance,
        13403,
        true,
    },
    { -- Frontline Slayer
        13403,
        faction.Horde,
        13402,
        true,
    },
    {13410}, -- Snow Fun Allowed
    {13414}, -- Crucible of Storms
    {13416}, -- Mythic: The Restless Cabal
    {13417}, -- Mythic: Uu'nat, Harbinger of the Void
    { -- Ahead of the Curve: Uu'nat, Harbinger of the Void
        13418,
        {
            {"PvE Season", 2},
        },
    },
    { -- Cutting Edge: Uu'nat, Harbinger of the Void
        13419,
        {
            {"PvE Season", 2},
        },
    },
    {13425}, -- We Got Spirit, How About You?
    { -- Come On and Slam
        13426,
        faction.Alliance,
    },
    { -- Azerfighter
        13429,
        {
            IsPvP = true,
        },
    },
    {13430}, -- De Lurker Be'loa
    {13431}, -- Hidden Dragon
    {13433}, -- Tall, Dark, and Sinister
    { -- Doomsoul Surprise
        13435,
        faction.Horde,
    },
    { -- Scavenge like a Vulpera
        13437,
        faction.Horde,
    },
    { -- Boxing Match
        13438,
        faction.Horde,
        13439,
        true,
    },
    { -- Boxing Match
        13439,
        faction.Alliance,
        13438,
        true,
    },
    { -- Pushing the Payload
        13440,
        faction.Alliance,
        13441,
    },
    { -- Pushing the Payload
        13441,
        faction.Horde,
        13440,
    },
    { -- Battle for Azeroth Keystone Conqueror: Season Two
        13448,
        {
            {"PvE Season", 2},
        },
    },
    { -- Battle for Azeroth Keystone Master: Season Two
        13449,
        {
            {"PvE Season", 2},
        },
    },
    { -- Fierce Gladiator's Storm Dragon
        13450,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Elite: Battle for Azeroth Season 2
        13451,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 27},
        },
    },
};

KrowiAF.AchievementData["08_01_05"] = {
    {KrowiAF.SetAchievementPatch, 8, 1, 5},
    { -- Allied Races: Zandalari Troll
        13161,
        faction.Horde,
    },
    { -- Allied Races: Kul Tiran
        13163,
        faction.Alliance,
    },
    { -- You Are Not Your $#*@! Legplates
        13186,
        faction.Alliance,
        13188,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- You Are Not Your $#*@! Legplates
        13188,
        faction.Horde,
        13186,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- The Second Rule of Brawler's Guild
        13189,
        faction.Alliance,
        13190,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- The Second Rule of Brawler's Guild
        13190,
        faction.Horde,
        13189,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Brawler for Azeroth
        13191,
        faction.Alliance,
        13192,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Brawler for Azeroth
        13192,
        faction.Horde,
        13191,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- I Am Thrall's Complete Lack Of Surprise
        13194,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Flame Keeper of Zandalar
        13340,
        faction.Horde,
        13341,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Kul Tiras
        13341,
        faction.Alliance,
        13340,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Kul Tiras
        13342,
        faction.Horde,
        13343,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Zandalar
        13343,
        faction.Alliance,
        13342,
        {
            {"Event", 341},
        },
    },
    { -- Elite: Battle for Azeroth Season 1
        13465,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 26},
        },
    },
    { -- Tides of Vengeance
        13466,
        faction.Horde,
        13467,
    },
    { -- Tides of Vengeance
        13467,
        faction.Alliance,
        13466,
    },
	{ -- Raiding with Leashes VI: Pets of Pandaria
		13469,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13501}, -- Gotta Bounce
    { -- Heritage of the Zandalari
        13503,
        faction.Horde,
    },
    { -- Heritage of the Kul Tirans
        13504,
        faction.Alliance,
    },
    {13506}, -- A Good Eye-dea
    {13512}, -- Master Calligrapher
    {13516}, -- Massive Tool
	{ -- Two Sides to Every Tale
		13517,
		{
			RewardType = rewardType.Mount,
		},
	},
};

KrowiAF.AchievementData["08_02_00"] = {
    {KrowiAF.SetAchievementPatch, 8, 2, 0},
	{ -- Battle for Azeroth Pathfinder, Part Two
		13250,
		{
			RewardType = rewardType.Mount,
		},
	},
    {13470}, -- Rest In Pistons
    {13472}, -- Deep Pockets
    {13473}, -- Diversified Investments
    {13474}, -- Junkyard Machinist
    {13475}, -- Junkyard Scavenger
    {13476}, -- Junkyard Tinkerer
    {13477}, -- Junkyard Apprentice
    {13478}, -- Junkyard Collector
    {13479}, -- Junkyard Architect
    {13482}, -- Head Financier of Mechagon
	{ -- Secret Fish of Mechagon
		13489,
		{
			RewardType = rewardType.Toy,
		},
	},
	{ -- Secret Fish and Where to Find Them
		13502,
		{
			RewardType = rewardType.Toy,
		},
	},
	{ -- Available in Eight Colors
		13513,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Mecha-Done
		13541,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- How to Train Your Direhorn
        13542,
        faction.Horde,
    },
    {13545}, -- Go Ahead, Make My Daisy
    {13549}, -- Trove Tracker
    { -- The Mechagonian Threat
        13553,
        faction.Alliance,
    },
	{ -- Junkyard Tinkmaster
		13555,
		{
			RewardType = rewardType.Title,
		},
	},
    {13556}, -- Outside Influences
    {13557}, -- Rustbolt Rebellion
    { -- Waveblade Ankoan
        13558,
        faction.Alliance,
    },
    { -- The Unshackled
        13559,
        faction.Horde,
    },
    { -- For Nazjatar!
        13568,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Nazjatar
        13569,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Mechagon
        13570,
        {
            IsPvP = true,
        },
    },
    {13571}, -- Under the Seams
    {13572}, -- The Heart Forge
    { -- How to Ptrain Your Pterrordax
        13573,
        faction.Horde,
    },
    {13577}, -- Crestfall
    {13578}, -- Heroic: Crestfall
    {13579}, -- Mythic: Crestfall
    { -- Crestfallen
        13580,
        {
            IsPvP = true,
        },
    },
    {13581}, -- Snowblossom Village
    {13582}, -- Heroic: Snowblossom Village
    {13583}, -- Mythic: Snowblossom Village
    { -- Snowblossom Scrapper
        13584,
        {
            IsPvP = true,
        },
    },
    {13585}, -- Never Lose, Never Choose To
    { -- Fighting on Two Fronts
        13623,
        {
            IsPvP = true,
        },
    },
    {13624}, -- Keep DPS-ing and Nobody Explodes
    {13625}, -- Mighty Minions of Mechagon
    {13626}, -- Nautical Nuisances of Nazjatar
	{ -- Pet Battle Challenge: Stratholme
		13627,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13628}, -- Intro to Marine Biology
    {13629}, -- Simple Geometry
    { -- Notorious Gladiator: Battle for Azeroth Season 3
        13630,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Notorious Gladiator's Proto-Drake
        13632,
        {
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    {13633}, -- If It Pleases the Court
    { -- Challenger: Battle for Azeroth Season 3
        13634,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    {13635}, -- Tour of the Depths
	{ -- Undersea Usurper
		13638,
		{
            RewardType = {rewardType.Title, rewardType.Mount},
		},
	},
    { -- Combatant: Battle for Azeroth Season 3
        13639,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Rival: Battle for Azeroth Season 3
        13641,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Duelist: Battle for Azeroth Season 3
        13642,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Hero of the Alliance: Notorious
        13643,
        faction.Alliance,
        13644,
        {
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Hero of the Horde: Notorious
        13644,
        faction.Horde,
        13643,
        {
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Nautical Battlefield Training
        13645,
        faction.Horde,
        13704,
    },
    { -- Gladiator: Battle for Azeroth Season 3
        13647,
        {
            RewardType = {rewardType.Title, rewardType.Mount},
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    { -- Elite: Battle for Azeroth Season 3
        13676,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 28},
        },
    },
    {13684}, -- You and What Army?
    {13686}, -- Junkyard Melomaniac
	{ -- Glory of the Eternal Raider
		13687,
		{
			RewardType = rewardType.Mount,
		},
	},
    {13690}, -- Nazjatarget Eliminated
    {13691}, -- I Thought You Said They'd Be Rare?
    {13692}, -- Give Me the Biggest Bag You've Got
    {13693}, -- Mecha-Safari
    {13694}, -- Nazjatari Safari
	{ -- Team Aquashock
		13695,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13696}, -- Scrappy's Best Friend
    {13698}, -- Clean Up On Aisle Mechagon
    {13699}, -- Periodic Destruction
    { -- The Mechagonian Threat
        13700,
        faction.Horde,
    },
    { -- Battlefield Brawler
        13701,
        {
            IsPvP = true,
        },
    },
    { -- Battlefield Tactician
        13702,
        {
            IsPvP = true,
        },
    },
    { -- Battlefield Master
        13703,
        {
            IsPvP = true,
        },
    },
    { -- Nautical Battlefield Training
        13704,
        faction.Alliance,
        13645,
    },
    {13706}, -- Stay Positive
    {13707}, -- Mrrl's Secret Stash
    {13708}, -- Most Minis Wins
    { -- Unfathomable
        13709,
        faction.Horde,
        13710,
    },
    { -- Sunken Ambitions
        13710,
        faction.Alliance,
        13709,
    },
    {13711}, -- A Fistful of Manapearls
    {13712}, -- Explore Nazjatar
    {13713}, -- Nothing To Scry About
    {13715}, -- From The Belly Of The Jelly
    {13716}, -- Lactose Intolerant
    {13718}, -- The Grand Reception
    {13719}, -- Depths of the Devoted
    { -- Supplying the Assassins
        13720,
        {
            IsPvP = true,
        },
    },
    {13722}, -- Terror of the Tadpoles
    {13723}, -- M.C., Hammered
    {13724}, -- A Smack of Jellyfish
    {13725}, -- The Circle of Stars
    {13726}, -- Mythic: Abyssal Commander Sivara
    {13727}, -- Mythic: Radiance of Azshara
    {13728}, -- Mythic: Blackwater Behemoth
    {13729}, -- Mythic: Lady Ashvane
    {13730}, -- Mythic: Orgozoa
    {13731}, -- Mythic: The Queen's Court
    {13732}, -- Mythic: Za'qul
	{ -- Mythic: Queen Azshara
		13733,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Heroic: War is Hell
        13735,
        faction.Horde,
        13737,
    },
    { -- Heroic: War is Hell
        13737,
        faction.Alliance,
        13735,
    },
    { -- Heroic: Tour of War
        13738,
        faction.Horde,
        13739,
    },
    { -- Heroic: Tour of War
        13739,
        faction.Alliance,
        13738,
    },
    { -- Seasoned: Hunter Akana
        13743,
        faction.Alliance,
        13746,
    },
    { -- Seasoned: Bladesman Inowari
        13744,
        faction.Alliance,
        13747,
    },
    { -- Seasoned: Farseer Ori
        13745,
        faction.Alliance,
        13748,
    },
    { -- Seasoned: Neri Sharpfin
        13746,
        faction.Horde,
        13743,
    },
    { -- Seasoned: Poen Gillbrack
        13747,
        faction.Horde,
        13744,
    },
    { -- Seasoned: Vim Brineheart
        13748,
        faction.Horde,
        13745,
    },
    { -- Veteran: Neri Sharpfin
        13749,
        faction.Horde,
        13753,
    },
    { -- Battle-Scarred: Neri Sharpfin
        13750,
        faction.Horde,
        13758,
    },
    { -- Veteran: Poen Gillbrack
        13751,
        faction.Horde,
        13754,
    },
    { -- Veteran: Vim Brineheart
        13752,
        faction.Horde,
        13755,
    },
    { -- Veteran: Hunter Akana
        13753,
        faction.Alliance,
        13749,
    },
    { -- Veteran: Bladesman Inowari
        13754,
        faction.Alliance,
        13751,
    },
    { -- Veteran: Farseer Ori
        13755,
        faction.Alliance,
        13752,
    },
    { -- Battle-Scarred: Poen Gillbrack
        13756,
        faction.Horde,
        13759,
    },
    { -- Battle-Scarred: Vim Brineheart
        13757,
        faction.Horde,
        13760,
    },
    { -- Battle-Scarred: Hunter Akana
        13758,
        faction.Alliance,
        13750,
    },
    { -- Battle-Scarred: Bladesman Inowari
        13759,
        faction.Alliance,
        13756,
    },
    { -- Battle-Scarred: Farseer Ori
        13760,
        faction.Alliance,
        13757,
    },
    { -- Aqua Team Murder Force
        13761,
        faction.Horde,
        13762,
    },
    { -- Aqua Team Murder Force
        13762,
        faction.Alliance,
        13761,
    },
    {13763}, -- Back to the Depths!
    {13764}, -- Puzzle Performer
    {13765}, -- Subaquatic Support
	{ -- Malowned
		13766,
		{
			RewardType = rewardType.Pet,
		},
	},
    {13767}, -- Fun Run
    {13768}, -- The Best of Us
    {13769}, -- Power Up
    {13770}, -- Power Creep
    {13771}, -- Power Is Beautiful
    { -- Essence Essentials
        13772,
        {
            IsPvP = true,
        },
    },
    { -- Essence Gains
        13773,
        {
            IsPvP = true,
        },
    },
    { -- Essence Overload
        13775,
        {
            IsPvP = true,
        },
    },
    {13776}, -- Explore Mechagon
    {13777}, -- My Heart Container is Full
    { -- Phenomenal Cosmic Power
        13779,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Battle for Azeroth Keystone Conqueror: Season Three
        13780,
        {
            {"PvE Season", 3},
        },
    },
    { -- Battle for Azeroth Keystone Master: Season Three
        13781,
        {
            {"PvE Season", 3},
        },
    },
    { -- Ahead of the Curve: Queen Azshara
        13784,
        {
            {"PvE Season", 3},
        },
    },
    { -- Cutting Edge: Queen Azshara
        13785,
        {
            {"PvE Season", 3},
        },
    },
    { -- Hertz Locker
        13789,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {13790}, -- Armed for Action
    {13791}, -- Making the Mount
    {13836}, -- Feline Figurines Found
};

KrowiAF.AchievementData["08_02_05"] = {
    {KrowiAF.SetAchievementPatch, 8, 2, 5},
    { -- WoW's 15th Anniversary
        13917,
        {
            {"From", "Date", {2019, 11, 5}, "Until", "Date", {2020, 1, 7}},
        },
    },
    { -- The Fourth War
        13924,
        faction.Horde,
        13925,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- The Fourth War
        13925,
        faction.Alliance,
        13924,
        {
            RewardType = rewardType.Title,
        },
    },
    {13927}, -- Crashin' Splashin'
    { -- Alterac Valley of Olde
        13928,
        faction.Alliance,
        13930,
        true,
    },
    { -- Alterac Valley of Olde
        13930,
        faction.Horde,
        13928,
        true,
    },
    { -- Memories of Fel, Frost and Fire
        13931,
        {
            RewardType = rewardType.Mount,
            {"From", "Date", {2019, 11, 5}, "Until", "Date", {2020, 1, 7}},
        },
    },
};

KrowiAF.AchievementData["08_03_00"] = {
    {KrowiAF.SetAchievementPatch, 8, 3, 0},
    { -- Allied Races: Vulpera
        13206,
        faction.Horde,
    },
    { -- Corrupted Gladiator: Battle for Azeroth Season 4
        13957,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Corrupted Gladiator's Proto-Drake
        13958,
        {
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Challenger: Battle for Azeroth Season 4
        13959,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Combatant: Battle for Azeroth Season 4
        13962,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Rival: Battle for Azeroth Season 4
        13963,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Duelist: Battle for Azeroth Season 4
        13964,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Hero of the Horde: Corrupted
        13965,
        faction.Horde,
        13966,
        {
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Hero of the Alliance: Corrupted
        13966,
        faction.Alliance,
        13965,
        {
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Gladiator: Battle for Azeroth Season 4
        13967,
        {
            RewardType = {rewardType.Title, rewardType.Mount},
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    { -- Elite: Battle for Azeroth Season 4
        13989,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 29},
        },
    },
    {13990}, -- You Can Pet the Dog, But...
	{ -- Through the Depths of Visions
		13994,
		{
			RewardType = rewardType.Mount,
		},
	},
    {13998}, -- Pure of Heart
    {13999}, -- How? Isn't it Obelisk?
    { -- Heritage of the Vulpera
        14002,
        faction.Horde,
    },
    {14008}, -- Mana Sponge
    { -- Allied Races: Mechagnome
        14013,
        faction.Alliance,
    },
    { -- Heritage of the Mechagnome
        14014,
        faction.Alliance,
    },
    {14019}, -- Smoke Test
	{ -- Pet Battle Challenge: Blackrock Depths
		14020,
		{
			RewardType = rewardType.Toy,
		},
	},
	{ -- The Shadows Revealed
		14021,
		{
			RewardType = rewardType.Toy,
		},
	},
    {14023}, -- Realizing Your Potential
    {14024}, -- Buzzer Beater
    {14026}, -- Temper Tantrum
    {14027}, -- Battle for Mrrglroth
    {14037}, -- Phase 3: Prophet
    {14038}, -- Bloody Mess
    {14041}, -- Mythic: Wrathion, the Black Emperor
    {14043}, -- Mythic: Maut
    {14044}, -- Mythic: The Prophet Skitra
    {14045}, -- Mythic: Dark Inquisitor Xanesh
    {14046}, -- Mythic: The Hivemind
    {14048}, -- Mythic: Shad'har the Insatiable
    {14049}, -- Mythic: Drest'agath
    {14050}, -- Mythic: Vexiona
    {14051}, -- Mythic: Ra-den the Despoiled
    {14052}, -- Mythic: Il'gynoth, Corruption Reborn
    {14054}, -- Mythic: Carapace of N'Zoth
	{ -- Mythic: N'Zoth the Corruptor
		14055,
		{
			RewardType = rewardType.Title,
		},
	},
    {14058}, -- All Eyes On Me
    {14059}, -- The Eyes Have It
    {14060}, -- Unwavering Resolve
    {14061}, -- We Have the Technology
    {14062}, -- Horrific Vision of Stormwind
    {14063}, -- Horrific Vision of Orgrimmar
    {14064}, -- The Even More Horrific Vision of Stormwind
    {14065}, -- The Even More Horrific Vision of Orgrimmar
    {14066}, -- The Most Horrific Vision of Stormwind
    {14067}, -- The Most Horrific Vision of Orgrimmar
    { -- Ahead of the Curve: N'Zoth the Corruptor
        14068,
        {
            {"PvE Season", 4},
        },
    },
    { -- Cutting Edge: N'Zoth the Corruptor
        14069,
        {
            {"PvE Season", 4},
        },
    },
    {14139}, -- Total Annihilation
    { -- Mad World
        14140,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 4},
        },
    },
	{ -- Reeking of Visions
		14143,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- Battle for Azeroth Keystone Conqueror: Season Four
        14144,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 4},
        },
    },
    { -- Battle for Azeroth Keystone Master: Season Four
        14145,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 4},
        },
    },
	{ -- Glory of the Ny'alotha Raider
		14146,
		{
			RewardType = rewardType.Mount,
		},
	},
    {14147}, -- Cleansing Treatment
    {14148}, -- It's Not A Cult
    { -- Heroic: War for the Shore
        14149,
        faction.Horde,
        14150,
    },
    { -- Heroic: War for the Shore
        14150,
        faction.Alliance,
        14149,
    },
    {14153}, -- Uldum Under Assault
    {14154}, -- Defend the Vale
    {14155}, -- Uldum Accord
    {14156}, -- The Rajani
    {14157}, -- The Corruptor's End
    {14158}, -- It's Not A Tumor!
    {14159}, -- Combating the Corruption
    {14160}, -- Rare to Well Done
    {14161}, -- All Consuming
    {14162}, -- Horrific Masquerade
    {14165}, -- Masked Soliloquy
    {14166}, -- Masked Duet
    {14167}, -- Masked Trio
    {14168}, -- Masked Quartet
    {14169}, -- Symphony of Masks
    {14170}, -- Thanks For The Mementos
    {14171}, -- Memento Mori
    {14172}, -- A Monumental Amount of Mementos
    {14173}, -- A Mountain of Mementos
    { -- Master of Deepwind Gorge
        14175,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Conspicuous Consumption
        14183,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Market Dominance
        14186,
        {
            IsPvP = true,
        },
    },
    { -- Cruisin' for a Brewsin'
        14187,
        {
            IsPvP = true,
        },
    },
    { -- Well Gorged
        14188,
        {
            IsPvP = true,
        },
    },
    { -- Servant of N'Zoth
        14191,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    {14193}, -- Vision of Destiny
    {14194}, -- Halls of Devotion
    {14195}, -- Gift of Flesh
    {14196}, -- The Waking Dream
};