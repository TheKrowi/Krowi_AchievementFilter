local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["10_00_00"] = {
    {KrowiAF.SetAchievementPatch, 10, 0, 0},
    { -- Dracthyr, Awaken
        15325,
        faction.Alliance,
    },
    {15394}, -- Ohn'a'Roll
    { -- Dracthyr, Awaken
        15638,
        faction.Horde,
    },
	{ -- Many More Mini Minions
		15641,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- Proven Pet Parent
		15642,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- What Can I Say? They Love Me.
		15643,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- The Joy of Toy
		15781,
		{
			RewardType = rewardType.Toy,
		},
	},
    {15794}, -- A New Friend
    {15795}, -- Together in the Skies
    {15796}, -- Cliffside Companion
    {15797}, -- An Azure Ally
    {15805}, -- Level 70
    { -- Thanks for the Carry!
        15833,
        faction.Horde,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Thanks for the Carry!
        15834,
        faction.Alliance,
        {
            RewardType = rewardType.Mount,
        },
    },
	{ -- River Rapids Wrangler
		15889,
		{
			RewardType = rewardType.Toy,
		},
	},
    {15890}, -- Dragonscale Expedition: The Highest Peaks
    {15915}, -- Waking Shores: Bronze
	{ -- Waking Shores: Silver
		15916,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15917}, -- Waking Shores: Gold
    {15918}, -- Ohn'ahran Plains: Bronze
	{ -- Ohn'ahran Plains: Silver
		15919,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15920}, -- Ohn'ahran Plains: Gold
    {15921}, -- Azure Span: Bronze
	{ -- Azure Span: Silver
		15922,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15923}, -- Azure Span: Gold
    {15924}, -- Thaldraszus: Bronze
	{ -- Thaldraszus: Silver
		15925,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15926}, -- Thaldraszus: Gold
    {15927}, -- Waking Shores Advanced: Bronze
	{ -- Waking Shores Advanced: Silver
		15928,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15929}, -- Waking Shores Advanced: Gold
    {15930}, -- Ohn'ahran Plains Advanced: Bronze
	{ -- Ohn'ahran Plains Advanced: Silver
		15931,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15932}, -- Ohn'ahran Plains Advanced: Gold
    {15933}, -- Azure Span Advanced: Bronze
	{ -- Azure Span Advanced: Silver
		15934,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15935}, -- Azure Span Advanced: Gold
    {15936}, -- Thaldraszus Advanced: Bronze
	{ -- Thaldraszus Advanced: Silver
		15937,
		{
			RewardType = rewardType.Mount,
		},
	},
    {15938}, -- Thaldraszus Advanced: Gold
    { -- Dragon Racing Completionist: Bronze
		15939,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- Dragon Racing Completionist: Silver
		15940,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- Dragon Racing Completionist: Gold
		15941,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Crimson Gladiator: Dragonflight Season 1
        15951,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Rival I: Dragonflight Season 1
        15952,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Rival II: Dragonflight Season 1
        15953,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Duelist: Dragonflight Season 1
        15954,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Challenger I: Dragonflight Season 1
        15955,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Challenger II: Dragonflight Season 1
        15956,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Gladiator: Dragonflight Season 1
        15957,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Hero of the Horde: Crimson
        15958,
        faction.Horde,
        15959,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Hero of the Alliance: Crimson
        15959,
        faction.Alliance,
        15958,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Combatant I: Dragonflight Season 1
        15960,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Combatant II: Dragonflight Season 1
        15961,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Elite: Dragonflight Season 1
        15984,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    {15985}, -- Dragon Glyphs: Skytop Observatory Tower
    {15986}, -- Dragon Glyphs: Wingrest Embassy
    {15987}, -- Dragon Glyphs: Obsidian Bulwark
    {15988}, -- Dragon Glyphs: Ruby Life Pools Peaks
    {15989}, -- Dragon Glyphs: The Overflowing Spring
    {15990}, -- Dragon Glyphs: Life-Binder Observatory
    {15991}, -- Dragon Glyphs: Crumbling Life Archway
    {16051}, -- Dragon Glyphs: Dragonheart Outpost
    {16052}, -- Dragon Glyphs: Scalecracker Peak
    {16053}, -- Dragon Glyphs: Obsidian Throne
    {16054}, -- Dragon Glyphs: Ohn'ahra's Roost
    {16055}, -- Dragon Glyphs: Nokhudon Hold
    {16056}, -- Dragon Glyphs: Emerald Gardens
    {16057}, -- Dragon Glyphs: The Eternal Kurgans
    {16058}, -- Dragon Glyphs: Szar Skeleth
    {16059}, -- Dragon Glyphs: Mirror of the Sky
    {16060}, -- Dragon Glyphs: Ohn'iri Springs
    {16061}, -- Dragon Glyphs: Dragonsprings Summit
    {16062}, -- Dragon Glyphs: Rusza'thar Reach
    {16063}, -- Dragon Glyphs: Windsong Rise
    {16064}, -- Dragon Glyphs: Cobalt Assembly
    {16065}, -- Dragon Glyphs: Azure Archives
    {16066}, -- Dragon Glyphs: Ruins of Karnthar
    {16067}, -- Dragon Glyphs: Lost Ruins
    {16068}, -- Dragon Glyphs: Brackenhide Hollow
    {16069}, -- Dragon Glyphs: Drake Eye's Pond
    {16070}, -- Dragon Glyphs: Imbu
    {16071}, -- Dragon Glyphs: Zelthrak Outpost
    {16072}, -- Dragon Glyphs: Rhonin's Shield
    {16073}, -- Dragon Glyphs: Vakthros Range
    {16098}, -- Dragon Glyphs: Temporal Conflux
    {16099}, -- Dragon Glyphs: Stormshroud Peak
    {16100}, -- Dragon Glyphs: South Hold Gate
    {16101}, -- Dragon Glyphs: Valdrakken
    {16102}, -- Dragon Glyphs: Algeth'era
    {16103}, -- Dragon Glyphs: Tyrhold
    {16104}, -- Dragon Glyphs: Algeth'ar Academy
    {16105}, -- Dragon Glyphs: Veiled Ossuary
    {16106}, -- Dragon Glyphs: Vault of the Incarnates
    {16107}, -- Dragon Glyphs: Thaldraszus Apex
    {16110}, -- Subscribed to Hyena Facts
    {16255}, -- Brackenhide Hollow
    {16256}, -- Heroic: Brackenhide Hollow
    {16257}, -- Mythic: Brackenhide Hollow
    {16260}, -- Halls of Infusion
    {16261}, -- Heroic: Halls of Infusion
    {16262}, -- Mythic: Halls of Infusion
    {16263}, -- Neltharus
    {16264}, -- Heroic: Neltharus
    {16265}, -- Mythic: Neltharus
    {16266}, -- Ruby Life Pools
    {16267}, -- Heroic: Ruby Life Pools
    {16268}, -- Mythic: Ruby Life Pools
    {16269}, -- Algeth'ar Academy
    {16270}, -- Heroic: Algeth'ar Academy
    {16271}, -- Mythic: Algeth'ar Academy
    {16272}, -- The Azure Vault
    {16273}, -- Heroic: The Azure Vault
    {16274}, -- Mythic: The Azure Vault
    {16275}, -- The Nokhud Offensive
    {16276}, -- Heroic: The Nokhud Offensive
    {16277}, -- Mythic: The Nokhud Offensive
    {16278}, -- Uldaman: Legacy of Tyr
    {16279}, -- Heroic: Uldaman: Legacy of Tyr
    {16280}, -- Mythic: Uldaman: Legacy of Tyr
    {16281}, -- Like Sands Through the Hourglass
    {16282}, -- No, You're Stunning!
    {16291}, -- An Ancient Awakening
    {16292}, -- Mastering the Waygates
    {16294}, -- Dragonflight Dungeon Hero
	{ -- Glory of the Dragonflight Hero
		16295,
		{
			RewardType = rewardType.Mount,
		},
	},
    {16296}, -- Growlbossify
    {16297}, -- Treasures of The Waking Shores
    {16298}, -- Treasure Hunter of the Dragon Isles
    {16299}, -- Treasures of the Ohn'ahran Plains
    {16300}, -- Treasures of The Azure Span
    {16301}, -- Treasures of Thaldraszus
    {16317}, -- Secret Fishing Spots
    {16320}, -- Does Steam Do Fire Damage?
    {16321}, -- Cutting Tusk Equipment
    {16322}, -- Best in Slot
    {16323}, -- Fragments of History
    {16329}, -- Duck, Duck, Spruce!
    {16330}, -- You Must Be Made of Hide
    {16331}, -- The Cracked Crystal
    {16334}, -- Waking Hope
    {16335}, -- What Frozen Things Do
    {16336}, -- Azure Spanner
    {16337}, -- It's a Trogg Eat Trogg World
    {16338}, -- Fang Flap Fire Fighter
    {16339}, -- Myths of the Dragonflight Dungeons
    {16343}, -- Vault of the Incarnates
    {16345}, -- Heroic: Vault of the Incarnates
    {16346}, -- Mythic: Eranog
    {16347}, -- Mythic: Terros
    {16348}, -- Mythic: The Primal Council
    {16349}, -- Mythic: Sennarth, The Cold Breath
    {16350}, -- Mythic: Dathea, Ascended
    {16351}, -- Mythic: Kurog Grimtotem
    {16352}, -- Mythic: Broodkeeper Diurna
	{ -- Mythic: Raszageth the Storm-Eater
		16353,
		{
			RewardType = rewardType.Title,
		},
	},
    {16354}, -- Mythic: Vault of the Incarnates
	{ -- Glory of the Vault Raider
		16355,
		{
			RewardType = rewardType.Mount,
		},
	},
    {16363}, -- Just Don't Ask Me to Spell It
    {16364}, -- The Lunker Below
    {16365}, -- Little Friends
    {16395}, -- Vaulternative Fashion
    {16398}, -- Sojourner of Thaldraszus
    {16399}, -- Lovin' Lubbins
    {16400}, -- Explore the Waking Shores
    {16401}, -- Sojourner of the Waking Shores
    {16402}, -- Dragon Kill Points
    {16404}, -- So You Can Kill This in a Way That Matters...
    {16405}, -- Sojourner of Ohn'ahran Plains
    {16406}, -- All Sides of the Story
    {16409}, -- Let's Get Quacking
    {16410}, -- Siege on Dragonbane Keep: Snack Attack
    {16411}, -- Siege on Dragonbane Keep: Home Sweet Home
    {16412}, -- Siege on Dragonbane Keep: Chiseled Record
    {16419}, -- I Was Saving That For Later
	{ -- Honor Our Ancestors
		16423,
		{
			RewardType = rewardType.Toy,
		},
	},
    {16424}, -- Who's a Good Bakar?
    {16426}, -- Hungry Hungry Hornswog
    {16427}, -- Go With the Flow
    {16428}, -- Sojourner of Azure Span
    { -- Thundering Hero: Dragonflight Season 1
        16429,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 9},
        },
    },
    {16430}, -- All Bark, All Bite
    { -- Against the Elements
        16431,
        {
            {"From", "Date", {2022, 11, 15}, "Until", "Date", {2022, 11, 28}},
        },
    },
    {16432}, -- Ready for Raiding VIII
    {16434}, -- See Me After Class
    {16438}, -- Knowledge is... Preserved?
    {16440}, -- Are You My Broodmother?
    {16441}, -- Squad Goals
    {16442}, -- Incubation Extermination
	{ -- Soupervisor
		16443,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Leftovers' Revenge
		16444,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {16445}, -- Icy What You Did There
	{ -- That's Pretty Neat!
		16446,
		{
			RewardType = rewardType.Title,
		},
	},
    {16447}, -- What Are The Chances...
    {16450}, -- The Power is MINE!
    {16451}, -- The Ol Raszle Daszle
    {16452}, -- Famliar Skies
    {16453}, -- Liquid Hot Magma
    {16456}, -- Weapons of the Maruukai
    {16457}, -- Explore the Ohn'ahran Plains
    {16458}, -- Nothing But Air
    {16460}, -- Explore the Azure Span
    {16461}, -- Stormed Off
    {16462}, -- The Ohn'ahran Trail
    {16463}, -- Thunderstorms in The Waking Shores
    {16464}, -- Battle on the Dragon Isles
    {16465}, -- Sandstorms in The Waking Shores
    {16466}, -- Firestorms in The Waking Shores
    {16467}, -- Snowstorms in The Waking Shores
    {16468}, -- Chasing Storms in The Waking Shores
    {16474}, -- Do You Wanna Build a Snowman?
    {16475}, -- Thunderstorms in the Ohn'ahran Plains
    {16476}, -- Chasing Storms in the Ohn'ahran Plains
    {16477}, -- Sandstorms in the Ohn'ahran Plains
    {16478}, -- Firestorms in the Ohn'ahran Plains
    {16479}, -- Snowstorms in the Ohn'ahran Plains
    {16480}, -- Thunderstorms in The Azure Span
    {16481}, -- Sandstorms in The Azure Span
    {16482}, -- Firestorms in The Azure Span
    {16483}, -- Snowstorms in The Azure Span
    {16484}, -- Chasing Storms in The Azure Span
    {16485}, -- Thunderstorms in Thaldraszus
    {16486}, -- Sandstorms in Thaldraszus
    {16487}, -- Firestorms in Thaldraszus
    {16488}, -- Snowstorms in Thaldraszus
    {16489}, -- Chasing Storms in Thaldraszus
    {16490}, -- Storm Chaser
	{ -- Into the Storm
		16492,
		{
			RewardType = rewardType.Mount,
		},
	},
    {16493}, -- Petty Theft Mammoth
	{ -- Loyalty to the Prince
		16494,
		{
			RewardType = rewardType.Title,
		},
	},
    {16495}, -- Obsidian Keymaster
    {16496}, -- Obsidian Champion
    {16497}, -- I'm Playing All Sides
    {16498}, -- Elemental Overflow
    {16499}, -- Elemental Overflowing
    {16500}, -- Elemental Overload
    {16501}, -- Aquatic Battler of the Dragon Isles
    {16502}, -- Storming the Runway
    {16503}, -- Beast Battler of the Dragon Isles
    {16504}, -- Critter Battler of the Dragon Isles
    {16505}, -- Dragonkin Battler of the Dragon Isles
    {16506}, -- Elemental Battler of the Dragon Isles
    {16507}, -- Flying Battler of the Dragon Isles
    {16508}, -- Humanoid Battler of the Dragon Isles
    {16509}, -- Magic Battler of the Dragon Isles
    {16510}, -- Mechanical Battler of the Dragon Isles
    {16511}, -- Undead Battler of the Dragon Isles
	{ -- Family Battler of the Dragon Isles
		16512,
		{
			RewardType = rewardType.Pet,
		},
	},
    {16517}, -- Toxicity Strike Team
    {16518}, -- Explore Thaldraszus
    {16519}, -- Dragon Isles Safari
    -- {16522}, -- A True Explorer [Removed in 11.0.7, replaced by 41174]
    -- {16528}, -- Joining the Khansguard [Removed in 11.0.7, replaced by 41180]
    -- {16529}, -- Joining the Community [Removed in 11.0.7, replaced by 41181]
    -- {16530}, -- Ally of the Flights [Removed in 11.0.7, replaced by 41182]
    {16531}, -- A Whole Heap of Lunkers
    {16532}, -- True Friends with Sabellian
    {16533}, -- Lots of Lunkers
    {16536}, -- True Friends with Wrathion
    {16537}, -- Maximum Power!
    {16539}, -- In High Esteem
    {16540}, -- Hunt Master
    {16541}, -- Longhunter
    {16542}, -- The Disgruntled Hunter
    {16543}, -- Tetrachromancer
    {16544}, -- Grand Hunter
    {16545}, -- The Best at What I Do
    {16546}, -- What's Down There?
    {16547}, -- Pulled!
    {16548}, -- It Takes a Tuskarr Buddy
    -- {16549}, -- Popular Around the Isles [Removed in 11.0.7, replaced by 41179]
    {16550}, -- Giving Back to Nature
    {16551}, -- Giving More Back to Nature
    {16552}, -- Giving Even More Back to Nature
    {16553}, -- Taking From Nature
    {16556}, -- Great Gourmand of The Ruby Feast
    {16560}, -- Wildlife Photographer
    {16561}, -- Lunkers, Lunkers Everywhere
    {16562}, -- That's not a Fish...
    {16563}, -- We're Going to Need a Bigger Harpoon
    {16564}, -- It Takes a Tuskarr Family
    {16565}, -- It Takes a Tuskarr Village
    {16566}, -- Great Shot!
    {16567}, -- A Lot of Great Shots!
    {16568}, -- Great Shots Galore!
    {16569}, -- Cobalt Enthusiast
    {16570}, -- A Legendary Album
    {16571}, -- Well Supplied
    {16572}, -- Legendary Photograph
    {16573}, -- Legendary Photographs
    {16574}, -- Sleeping on the Job
    {16575}, -- Waking Shores Glyph Hunter
    {16576}, -- Ohn'ahran Plains Glyph Hunter
    {16577}, -- Azure Span Glyph Hunter
    {16578}, -- Thaldraszus Glyph Hunter
    {16580}, -- Lend a Helping Span
    {16581}, -- Seeing Blue
    {16583}, -- Knew You Nokhud Do It!
    {16584}, -- Symbols of Hope
    {16585}, -- Loremaster of the Dragon Isles
    {16587}, -- Lead Climber
    {16588}, -- How Did These Get Here?
    { -- Malicia's Challenge
        16589,
        {
            IsPvP = true,
        },
    },
    { -- A Champion's Tour: Dragon Isles
        16590,
        {
            IsPvP = true,
        },
    },
    {16591}, -- The Gentleman Elemental
    { -- Tour of Duty: The Waking Shores
        16592,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Thaldraszus
        16593,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: The Azure Span
        16594,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Ohn'ahran Plains
        16595,
        {
            IsPvP = true,
        },
    },
    { -- A Champion's Pursuit
        16599,
        {
            IsPvP = true,
        },
    },
    {16600}, -- Isles Ascender
    { -- Dragonfight Club
        16601,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    {16602}, -- Nokhud Deed Goes Unnoticed
    { -- Bounty Hunter
        16603,
        {
            IsPvP = true,
        },
    },
    { -- Resource Scavanger
        16611,
        {
            IsPvP = true,
        },
    },
    { -- Bounty Vigalante
        16612,
        {
            IsPvP = true,
        },
    },
    { -- Finder's Keepers
        16613,
        {
            IsPvP = true,
        },
    },
    { -- Bloodstained Bounty
        16614,
        {
            IsPvP = true,
        },
    },
    { -- Blood Bank
        16615,
        {
            IsPvP = true,
        },
    },
    { -- Prosperously Bloody
        16616,
        {
            IsPvP = true,
        },
    },
    {16620}, -- Ohuna Incubation
    {16621}, -- One of Everything, Please
    {16622}, -- Three Minutes or It's Free
    {16623}, -- Toe Tension
    {16624}, -- Which Knot Was It Again?
    {16625}, -- Belay On!
    {16626}, -- Working with Wyrms
    {16627}, -- Professional Draconic Master
    {16630}, -- Draconic Master of All
    {16631}, -- Dragon Isles Cook
    {16632}, -- Dragon Isles Fisherman
    {16634}, -- Framing a New Perspective
    {16638}, -- Ley Line in the Span
    { -- Keystone Hero: Uldaman: Legacy of Tyr
        16639,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: Ruby Life Pools
        16640,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: The Nokhud Offensive
        16641,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: Brackenhide Hollow
        16642,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: Algeth'ar Academy
        16643,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: Neltharus
        16644,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: The Azure Vault
        16645,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
            {"PvE Season", 12},
        },
    },
    { -- Keystone Hero: Halls of Infusion
        16646,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
            {"PvE Season", 12},
        },
    },
    { -- Dragonflight Keystone Explorer: Season One
        16647,
        {
            {"PvE Season", 9},
        },
    },
    { -- Dragonflight Keystone Conqueror: Season One
        16648,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 9},
        },
    },
    { -- Dragonflight Keystone Master: Season One
        16649,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 9},
        },
    },
    { -- Dragonflight Keystone Hero: Season One
        16650,
        {
            {"PvE Season", 9},
        },
    },
    { -- Keystone Hero: Court of Stars
        16658,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
        },
    },
    { -- Keystone Hero: Halls of Valor
        16659,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
        },
    },
    { -- Keystone Hero: Shadowmoon Burial Grounds
        16660,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
        },
    },
    { -- Keystone Hero: Temple of the Jade Serpent
        16661,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 9},
        },
    },
    {16666}, -- Dragon Glyphs: Gelikyr Overlook
    {16667}, -- Dragon Glyphs: Passage of Time
    {16668}, -- Dragon Glyphs: Skytop Observatory Rostrum
    {16669}, -- Dragon Glyphs: Flashfrost Enclave
    {16670}, -- Dragon Glyphs: Rubyscale Outpost
    {16671}, -- Dragon Glyphs: Mirewood Fen
    {16672}, -- Dragon Glyphs: Forkriver Crossing
    {16673}, -- Dragon Glyphs: The Fallen Course
    {16676}, -- Adventurer of The Waking Shores
    {16677}, -- Adventurer of the Ohn'ahran Plains
    {16678}, -- Adventurer of The Azure Span
    {16679}, -- Adventurer of Thaldraszus
    {16683}, -- In Tyr's Footsteps
};

KrowiAF.AchievementData["10_00_02"] = {
    {KrowiAF.SetAchievementPatch, 10, 0, 2},
    {15640}, -- Return to Darkness
    {16729}, -- To All the Squirrels Hidden Til Now
    { -- Crimson Gladiator's Drake
        16730,
        {
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    { -- Court is Now in Session
		16731,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Crimson Legend: Dragonflight Season 1
        16734,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
    {16736}, -- Grand Theft Mammoth
    {16758}, -- Ready, Aim, Catalog!
	{ -- The Obsidian Bloodline
		16760,
		{
			RewardType = rewardType.Title,
		},
	},
    {16761}, -- Dragon Isles Explorer
	{ -- The Vegetarian Diet
		16762,
		{
			RewardType = rewardType.Toy,
		},
	},
    { -- Crimson Carpet Fashion
        16764,
        {
            IsPvP = true,
        },
    },
    {16789}, -- Lucky Penny
    {16790}, -- Curious Coin
	{ -- Merchant Artisan
		16791,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Personal Crafter
		16799,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Realm First! Dragonflight Keystone Hero
        16801,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {16808}, -- Friend of the Dragon Isles
    -- {16884}, -- Friends in the Field [Removed in 11.0.7, replaced by 41172]
    -- {16944}, -- Friend of the Family [Removed in 11.0.7, replaced by 41173]
    -- {16994}, -- Friends in the Accord [Removed in 11.0.7, replaced by 41171]
    -- {17064}, -- Friends in the Plains [Removed in 11.0.7, replaced by 41170]
    { -- Ahead of the Curve: Raszageth the Storm-Eater
        17107,
        {
            {"PvE Season", 9},
        },
    },
    { -- Cutting Edge: Raszageth the Storm-Eater
        17108,
        {
            {"PvE Season", 9},
        },
    },
    {17110}, -- The Primal Bulwark
    {17111}, -- Caverns of Infusion
    {17112}, -- Fury of the Storm
    { -- Deep Cuts From the Vault
		17119,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {17314}, -- Heroic Edition: Tangled Dreamweaver
    { -- Legend: Dragonflight Season 1
        17339,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 34},
        },
    },
};

KrowiAF.AchievementData["10_00_05"] = {
    {KrowiAF.SetAchievementPatch, 10, 0, 5},
    {16696}, -- Renewed Proto-Drake Armor
    {16697}, -- Renewed Proto-Drake Head Features
    {16698}, -- Renewed Proto-Drake Tail Features
    {16699}, -- Renewed Proto-Drake Scales and Patterns
    {16700}, -- Renewed Proto-Drake Horns and Hair
    {16701}, -- Windborne Velocidrake Scales and Patterns
    {16702}, -- Windborne Velocidrake Armor
    {16704}, -- Windborne Velocidrake Horns and Fur
    {16705}, -- Windborne Velocidrake Head Features
    {16706}, -- Windborne Velocidrake Back and Tail
    {16707}, -- Highland Drake Scales and Patterns
    {16708}, -- Highland Drake Armor
    {16710}, -- Highland Drake Horns and Hair
    {16711}, -- Highland Drake Back and Tail
    {16712}, -- Highland Drake Head Features
    {16723}, -- Cliffside Wylderdrake Scales and Patterns
    {16724}, -- Cliffside Wylderdrake Armor
    {16725}, -- Cliffside Wylderdrake Horns and Manes
    {16726}, -- Cliffside Wylderdrake Back and Tail
    {16727}, -- Cliffside Wylderdrake Head Features
    {17195}, -- Waking Shores Reverse: Bronze
    {17196}, -- Waking Shores Reverse: Silver
    {17197}, -- Waking Shores Reverse: Gold
    {17198}, -- Ohn'ahran Plains Reverse: Bronze
    {17199}, -- Ohn'ahran Plains Reverse: Silver
    {17200}, -- Ohn'ahran Plains Reverse: Gold
    {17201}, -- Azure Span Reverse: Bronze
    {17202}, -- Azure Span Reverse: Silver
    {17203}, -- Azure Span Reverse: Gold
    {17204}, -- Thaldraszus Reverse: Bronze
    {17205}, -- Thaldraszus Reverse: Silver
    {17206}, -- Thaldraszus Reverse: Gold
	{ -- Discombobberlated
		17207,
		{
			RewardType = rewardType.Toy,
		},
	},
    { -- Trading Post: Dragonflight
		17305,
		{
			RewardType = rewardType.TradersTender,
		},
	},
    { -- Elders of the Dragon Isles
        17321,
        {
            {"Event", 327},
        },
    },
    {17330}, -- Reverse Racer: Bronze
    {17331}, -- Reverse Racer: Silver
	{ -- Reverse Racer: Gold
		17332,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Trading Post Enthusiast
		17334,
		{
			RewardType = {rewardType.Transmog, rewardType.TradersTender},
		},
	},
    { -- Airborne Tumbler
        17335,
        {
            IsPvP = true,
        },
    },
    { -- Airborne Tumbler
        17336,
        {
            IsPvP = true,
        },
    },
    {17342}, -- The Future We Make
    {17343}, -- Drop It Like It's Hot
    { -- Airborne Tumbler
        17345,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
};

KrowiAF.AchievementData["10_00_07"] = {
    {KrowiAF.SetAchievementPatch, 10, 0, 7},
    {17279}, -- Forbidden Reach: Bronze
    {17280}, -- Forbidden Reach: Silver
    {17281}, -- Forbidden Reach: Gold
    {17284}, -- Forbidden Reach Advanced: Bronze
    {17286}, -- Forbidden Reach Advanced: Silver
    {17287}, -- Forbidden Reach Advanced: Gold
    {17288}, -- Forbidden Reach Reverse: Bronze
    {17289}, -- Forbidden Reach Reverse: Silver
    {17290}, -- Forbidden Reach Reverse: Gold
    {17294}, -- Forbidden Reach Racing Completionist
    {17296}, -- Forbidden Reach Racing Completionist: Silver
	{ -- Forbidden Reach Racing Completionist: Gold
		17298,
		{
			RewardType = rewardType.Title,
		},
	},
    {17315}, -- While We Were Sleeping
    { -- Relics of a Fallen Empire
		17366,
		{
			RewardType = rewardType.Other,
		},
	},
    {17367}, -- Deadliest Cache
    {17397}, -- Door To Door
    {17398}, -- Dragon Glyphs: Winglord's Perch
    {17399}, -- Dragon Glyphs: Talon's Watch
    {17400}, -- Dragon Glyphs: Froststone Peak
    {17401}, -- Dragon Glyphs: Dragonskull Island
    {17402}, -- Dragon Glyphs: Stormsunder Mountain
    {17403}, -- Dragon Glyphs: The Frosted Spine
    {17404}, -- Dragon Glyphs: Talonlords' Perch
    {17405}, -- Dragon Glyphs: Caldera of the Menders
    {17406}, -- Battle on the Dragon Isles II
    { -- Craftsman of the Zandalar Tribe
        17410,
        {
            {"Never"},
        },
    },
    {17411}, -- Forbidden Reach Glyph Hunter
    { -- Craftsman of the Argent Dawn
        17412,
        {
            {"Never"},
        },
    },
	{ -- Door Buster
		17413,
		{
			RewardType = rewardType.Title,
		},
	},
    {17426}, -- Toolbox Trouble
    {17427}, -- Winterpelt Conversationalist
    { -- Renowned Weaponsmith
        17496,
        {
            {"Never"},
        },
    },
    { -- Renowned Armorsmith
        17497,
        {
            {"Never"},
        },
    },
    { -- Renowned Leatherworking Specialist
        17498,
        {
            {"Never"},
        },
    },
    { -- Renowned Tailoring Specialist
        17499,
        {
            {"Never"},
        },
    },
    {17509}, -- Every Door, Everywhere, All At Once
    {17524}, -- Adventurer of the Forbidden Reach
    {17525}, -- Champion of the Forbidden Reach
    {17526}, -- Treasures of the Forbidden Reach
    {17527}, -- Scavenger of the Forbidden Reach
    {17528}, -- Hoarder of the Forbidden Reach
    {17529}, -- Forbidden Spoils
    {17530}, -- Librarian of the Reach
    {17531}, -- X Marks the Spot
    {17532}, -- Scroll Hunter
    {17534}, -- Explore the Forbidden Reach
    {17540}, -- Under the Weather
    {17541}, -- Global Swarming
	{ -- You Know How to Reach Me
		17543,
		{
			RewardType = rewardType.Title,
		},
	},
    {17546}, -- A New Beginning
};

KrowiAF.AchievementData["10_01_00"] = {
    {KrowiAF.SetAchievementPatch, 10, 1, 0},
    {17483}, -- Zaralek Cavern: Bronze
	{ -- Zaralek Cavern: Silver
		17484,
		{
			RewardType = rewardType.Mount,
		},
	},
    {17485}, -- Zaralek Cavern: Gold
    {17486}, -- Zaralek Cavern Advanced: Bronze
	{ -- Zaralek Cavern Advanced: Silver
		17487,
		{
			RewardType = rewardType.Mount,
		},
	},
    {17488}, -- Zaralek Cavern Advanced: Gold
    {17489}, -- Zaralek Cavern Reverse: Bronze
    {17490}, -- Zaralek Cavern Reverse: Silver
    {17491}, -- Zaralek Cavern Reverse: Gold
    {17492}, -- Zaralek Cavern Racing Completionist
    {17493}, -- Zaralek Cavern Racing Completionist: Silver
	{ -- Zaralek Cavern Racing Completionist: Gold
		17494,
		{
			RewardType = rewardType.Title,
		},
	},
    {17506}, -- Still Standing in the Fire
    {17510}, -- Dragon Glyphs: Glimmerogg
    {17511}, -- Dragon Glyphs: Nal ks'kol
    {17512}, -- Dragon Glyphs: Loamm
    {17513}, -- Dragon Glyphs: Zaqali Caldera
    {17514}, -- Dragon Glyphs: Slitherdrake Roost
    {17515}, -- Dragon Glyphs: The Throughway
    {17516}, -- Dragon Glyphs: Acidbite Ravine
    {17517}, -- Dragon Glyphs: Aberrus Approach
    {17560}, -- Ancient Stones of the Dragon Isles
    {17561}, -- Ancient Stones of the Waking Shores
    {17562}, -- Ancient Stones of the Ohn'ahran Plains
    {17563}, -- Ancient Stones of the Azure Span
    {17564}, -- Ancient Stones of Thaldraszus
    {17567}, -- Ancient Stones of Zaralek
	{ -- Active Listening Skills
		17734,
		{
			RewardType = rewardType.Title,
		},
	},
    {17735}, -- We Didn't Start the Fire
	{ -- The Gift of Cheese
		17736,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- Flame Warden of the Dragon Isles
        17737,
        faction.Alliance,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of the Dragon Isles
        17738,
        faction.Horde,
        {
            {"Event", 341},
        },
    },
    {17739}, -- Embers of Neltharion
    { -- Gladiator: Dragonflight Season 2
        17740,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
	{ -- Slow and Steady Wins the Race
		17741,
		{
			RewardType = rewardType.Pet,
		},
	},
    -- {17756}, -- Friends in Loamm Places [Removed in 11.0.7, replaced by 41175]
    -- {17763}, -- There's No Place Like Loamm [Removed in 11.0.7, replaced by 41183]
    { -- Obsidian Gladiator: Dragonflight Season 2
        17764,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    {17765}, -- What We Wear In The Shadowflame
    {17766}, -- Explore Zaralek Cavern
    { -- Obsidian Legend: Dragonflight Season 2
        17767,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Hero of the Alliance: Obsidian
        17768,
        faction.Alliance,
        17772,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Hero of the Horde: Obsidian
        17772,
        faction.Horde,
        17768,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Obsidian Gladiator's Slitherdrake
        17778,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    {17779}, -- A Serpentine Discovery
    {17781}, -- The Smell of Money
    {17783}, -- Adventurer of Zaralek Cavern
	{ -- Que Zara(lek), Zara(lek)
		17785,
		{
			RewardType = rewardType.Mount,
		},
	},
    {17786}, -- Treasures of Zaralek Cavern
    { -- Duelist: Dragonflight Season 2
        17794,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Rival I: Dragonflight Season 2
        17795,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Rival II: Dragonflight Season 2
        17796,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Challenger I: Dragonflight Season 2
        17797,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Challenger II: Dragonflight Season 2
        17798,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Combatant I: Dragonflight Season 2
        17799,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Combatant II: Dragonflight Season 2
        17800,
        {
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    { -- Legend: Dragonflight Season 2
        17801,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    {17830}, -- Stones Can't Fly!
    { -- Elite: Dragonflight Season 2
        17831,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 35},
        },
    },
    {17832}, -- Sniffen Around
    {17833}, -- Sniffen Sage
	{ -- Pyramid Scheme
		17841,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Dragonflight Keystone Explorer: Season Two
        17842,
        {
            {"PvE Season", 10},
        },
    },
    { -- Dragonflight Keystone Conqueror: Season Two
        17843,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 10},
        },
    },
    { -- Dragonflight Keystone Master: Season Two
        17844,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 10},
        },
    },
    { -- Dragonflight Keystone Hero: Season Two
        17845,
        {
            {"PvE Season", 10},
        },
    },
    { -- Smoldering Hero: Dragonflight Season 2
        17846,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 10},
        },
    },
    { -- Keystone Hero: The Vortex Pinnacle
        17847,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
        },
    },
    { -- Keystone Hero: Freehold
        17848,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
        },
    },
    { -- Keystone Hero: The Underrot
        17849,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
        },
    },
    { -- Keystone Hero: Neltharion's Lair
        17850,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 10},
        },
    },
    { -- Tour of Duty: Zaralek Cavern
        17851,
        {
            IsPvP = true,
        },
    },
    { -- Elemental Conjuror
        17852,
        {
            IsPvP = true,
        },
    },
    {17877}, -- We'll Never See That Again, Surely
    {17878}, -- Me Want Bite
    {17879}, -- Zaralek Cavern Safari
    {17880}, -- Battle in Zaralek Cavern
    {17881}, -- Aquatic Battler of Zaralek Cavern
    {17882}, -- Beast Battler of Zaralek Cavern
    {17883}, -- Critter Battler of Zaralek Cavern
    {17890}, -- Dragonkin Battler of Zaralek Cavern
    {17904}, -- Elemental Battler of Zaralek Cavern
    {17905}, -- Flying Battler of Zaralek Cavern
    {17915}, -- Humanoid Battler of Zaralek Cavern
    {17916}, -- Magic Battler of Zaralek Cavern
    {17917}, -- Mechanical Battler of Zaralek Cavern
    {17918}, -- Undead Battler of Zaralek Cavern
	{ -- Family Battler of Zaralek Cavern
		17934,
		{
			RewardType = rewardType.Pet,
		},
	},
    {17977}, -- Stones Can Try To Fly!
    {17978}, -- Stones Can Fly!
    { -- Dragonflight Season 2 Master
		18027,
		{
			RewardType = rewardType.Other,
		},
	},
	{ -- Cavern Clawbbering
		18100,
		{
			RewardType = rewardType.Toy,
		},
	},
    {18149}, -- Objects in Transit May Shatter
    {18150}, -- Zaralek Cavern Glyph Hunter
    {18151}, -- Mythic: Kazzara, the Hellforged
    {18152}, -- Mythic: The Amalgamation Chamber
    {18153}, -- Mythic: The Forgotten Experiments
    {18154}, -- Mythic: Assault of the Zaqali
    {18155}, -- Mythic: Rashok, the Elder
    {18156}, -- Mythic: The Vigilant Steward, Zskarn
    {18157}, -- Mythic: Magmorax
    {18158}, -- Mythic: Echo of Neltharion
	{ -- Mythic: Scalecommander Sarkareth
		18159,
		{
			RewardType = rewardType.Title,
		},
	},
    {18160}, -- Aberrus, the Shadowed Crucible
    {18161}, -- Heroic: Aberrus, the Shadowed Crucible
    {18162}, -- Mythic: Aberrus, the Shadowed Crucible
    {18163}, -- Discarded Works
    {18164}, -- Fury of Giants
    {18165}, -- Neltharion's Shadow
    {18167}, -- Edge of the Void
    {18168}, -- I'll Make My Own Shadowflame
    {18172}, -- Escar-Go-Go-Go
    {18173}, -- Tabula Rasa
    {18174}, -- Contaminant Cleaner
    {18193}, -- Eggscellent Eggsecution
    {18199}, -- Zaqali Ritual Buster
	{ -- Cooling the Research Field
		18200,
		{
			RewardType = rewardType.Title,
		},
	},
    {18201}, -- Lockdown Mystery
    {18202}, -- Rockin Research
    {18203}, -- A Research Sampler
    {18204}, -- Research Mishap
    {18205}, -- A Pillar of the Research Community
    {18206}, -- A Djaradin Puzzle
    {18207}, -- Hot Research Zone
    {18208}, -- The Small Disruptions
    {18209}, -- Nothing Stops the Research
    {18228}, -- Are You Even Trying?
    {18229}, -- Cosplate
    {18230}, -- Whac-A-Swog
    { -- Obsidian Tie Event
        18249,
        {
            IsPvP = true,
        },
    },
	{ -- Glory of the Aberrus Raider
		18251,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Ahead of the Curve: Scalecommander Sarkareth
        18253,
        {
            {"PvE Season", 10},
        },
    },
    { -- Cutting Edge: Scalecommander Sarkareth
        18254,
        {
            {"PvE Season", 10},
        },
    },
    {18255}, -- Proof of Myrrit
    {18256}, -- Nasz'uro, the Unbound Legacy
    {18257}, -- Can You Dig It?
    {18258}, -- Little Lord of Lies
    {18271}, -- He'sSss All Mine
	{ -- A Niffen's Best Buddy
		18284,
		{
			RewardType = rewardType.Title,
		},
	},
    {18361}, -- To All the Squirrels Burrowed Beneath
    { -- Dragonflight Season 2 Hero
		18380,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Dragonflight Keystone Master: Season Two
        18542,
        {
            {"PvE Season", 10},
        },
    },
};

KrowiAF.AchievementData["10_01_05"] = {
    {KrowiAF.SetAchievementPatch, 10, 1, 5},
    { -- Kalimdor: Bronze
        17712,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor: Silver
        17713,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor: Gold
        17714,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Advanced: Bronze
        17715,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Advanced: Silver
        17716,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Advanced: Gold
        17717,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Reverse: Bronze
        17718,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Reverse: Silver
        17719,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Reverse: Gold
        17720,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Racing Completionist
        17721,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Racing Completionist: Silver
        17722,
        {
            {"Event", 1395},
        },
    },
    { -- Kalimdor Racing Completionist: Gold
        17723,
        {
            RewardType = rewardType.Title,
            {"Event", 1395},
        },
    },
	{ -- Daycare Derby
		17782,
		{
			RewardType = rewardType.Toy,
		},
	},
    { -- Tricks and Treats of the Dragon Isles
        18360,
        faction.Alliance,
        {
            {"Event", 324},
        },
    },
    { -- Memory of Scholomance
		18368,
		{
			RewardType = rewardType.Other,
		},
	},
    { -- Wards of the Dread Citadel
		18372,
		{
			RewardType = rewardType.Other,
		},
	},
	{ -- Hey Nanny Nanny
		18383,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Whelp, There It Is
		18384,
		{
			RewardType = rewardType.Pet,
		},
	},
    {18471}, -- 110 Exalted Reputations
    {18539}, -- Back En-masse
	{ -- Temporal Acquisitions Specialist
		18554,
		{
			RewardType = rewardType.Toy,
		},
	},
    {18556}, -- Chaotic Time
    {18557}, -- Never Bothered, Anyway
    {18558}, -- Leaders of Scholomance
	{ -- Many Boxes, Many Rockses
		18559,
		{
			RewardType = rewardType.Toy,
		},
	},
    { -- Eastern Kingdoms: Bronze
        18566,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms: Silver
        18567,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms: Gold
        18568,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Advanced: Bronze
        18569,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Advanced: Silver
        18570,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Advanced: Gold
        18571,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Reverse: Bronze
        18572,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Reverse: Silver
        18573,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Reverse: Gold
        18574,
        {
            {"Event", 1400},
        },
    },
    {18589}, -- Crunch Time
    {18612}, -- A Slime in Need
    {18615}, -- Legend of the Multiverse
    {18616}, -- Putting Wilhelm Out of Business
    {18635}, -- Verified Rifter
    {18636}, -- Just Following Chronological Orders
    {18637}, -- Chronograde Connoisseur
    {18638}, -- Minute Menagerie
    {18639}, -- Collapsed Reality
    {18640}, -- Lock and Load
    {18641}, -- To All The Squirrels I've BEEN Before
	{ -- The Inquisitive
		18642,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Community Rumors
		18643,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- Community Rumor Mill
		18644,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- Tools of the Trade
		18645,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- Whodunnit?
		18646,
		{
            RewardType = {rewardType.Title, rewardType.Mount},
		},
	},
    {18703}, -- Dawn of the Infinite: Galakrond's Fall
    {18704}, -- Dawn of the Infinite: Murozond's Rise
	{ -- Defender of the Timeways
		18705,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Put That Thing Back Where It Came From
		18706,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Draconically Superior
        18976,
        {
            {"Before", "Version", {11, 0, 0}},
        },
    },
    { -- Draconically Epic
        18977,
        {
            {"Before", "Version", {11, 0, 0}},
        },
    },
};

KrowiAF.AchievementData["10_01_07"] = {
    {KrowiAF.SetAchievementPatch, 10, 1, 7},
    {15344}, -- "S.A.F.E"" Pilot"
    {17344}, -- Warcraft Rumble Minis, Get 'Em All!
    {17346}, -- Warcraft Rumble Minis, Maiev's New Look
    {17347}, -- Warcraft Rumble Minis, Sneed's New Look
    {17348}, -- Warcraft Rumble Minis, Huntress' New Look
    {17349}, -- Warcraft Rumble Minis, Tauren's New Look
    {17350}, -- Warcraft Rumble Minis, Ghoul's New Look
    {17351}, -- Warcraft Rumble Minis, Murloc's New Look
    {17352}, -- Warcraft Rumble Minis, Whelp Egg's New Look
    {17353}, -- Warcraft Rumble Minis, Maiev's Newer Look
    {17354}, -- Warcraft Rumble Minis, Sneed's Newer Look
    {17355}, -- Warcraft Rumble Minis, Huntress' Newer Look
    {17356}, -- Warcraft Rumble Minis, Tauren's Newer Look
    {17357}, -- Warcraft Rumble Minis, Ghoul's Newer Look
    {17358}, -- Warcraft Rumble Minis, Murloc's Newer Look
    {17359}, -- Warcraft Rumble Minis, Whelp Egg's Newer Look
    {17360}, -- Warcraft Rumble Minis, New Looks!
    {17361}, -- Rumble Minis, All the Looks!
    { -- The Lick King
        17547,
        {
            {"Event", 324},
        },
    },
    {17773}, -- A Blue Dawn
    {18250}, -- Ysergle The Dreamurk
    { -- A Round on the House
        18579,
        {
            {"Event", 372},
        },
    },
    { -- WoW's 19th Anniversary
        18702,
        {
            {"Event", 1397},
        },
    },
    {18719}, -- Cataclysmic Master of All
    {18720}, -- Classic Master of All
    {18721}, -- Outland Master of All
    {18722}, -- Northrend Master of All
    {18723}, -- Look, You're Specialized!
    {18724}, -- Gaining an Advantus
	{ -- Best Stellar
		18725,
		{
			RewardType = rewardType.Toy,
		},
	},
    {18726}, -- A Cure for All Ails I
    {18727}, -- Rave Leader
    {18728}, -- Working from the Start
    {18729}, -- Working in Hellfire
    {18730}, -- Goblins vs Gnomes
    {18731}, -- A Cure for All Ails II
    {18732}, -- A Cure for All Ails III
    {18733}, -- A Cure for All Ails IV
    {18734}, -- Powerful Concoctions I
    {18735}, -- Powerful Concoctions II
    {18736}, -- Powerful Concoctions III
    {18737}, -- Powerful Concoctions IV
    {18738}, -- Population In-Crease
    {18748}, -- Waking Shores Challenge: Bronze
    {18749}, -- Waking Shores Challenge: Silver
    {18750}, -- Waking Shores Challenge: Gold
    {18754}, -- Ohn'ahran Plains Challenge: Bronze
    {18755}, -- Ohn'ahran Plains Challenge: Silver
    {18756}, -- Ohn'ahran Plains Challenge: Gold
    {18757}, -- Azure Span Challenge: Bronze
    {18758}, -- Azure Span Challenge: Silver
    {18759}, -- Azure Span Challenge: Gold
    {18760}, -- Thaldraszus Challenge: Bronze
    {18761}, -- Thaldraszus Challenge: Silver
    {18762}, -- Thaldraszus Challenge: Gold
    {18763}, -- Spectre of Spectacles
    {18764}, -- Break Upon Your Body
    {18765}, -- Destined to be Legendary
    {18766}, -- Disenchantment I
    {18767}, -- Disenchantment II
    {18768}, -- Disenchantment III
    {18769}, -- Disenchantment IV
    {18770}, -- Silas' Sphere of Transmutation
    {18771}, -- Khaz'gorian Smithing Hammer
    {18772}, -- Sanguine Feather Quill of Lana'thel
    {18773}, -- Jewelhammer's Focus
    {18774}, -- Synchronous Thread
    {18775}, -- Iwen's Enchanting Rod
    {18776}, -- The Ub3r-Spanner
    {18777}, -- Mallet of Thunderous Skins
    {18778}, -- Massive Toolshed
    {18779}, -- Forbidden Reach Challenge: Bronze
    {18780}, -- Forbidden Reach Challenge: Silver
    {18781}, -- Forbidden Reach Challenge: Gold
    {18785}, -- Shattered Expectations
    {18786}, -- Zaralek Cavern Challenge: Bronze
    {18787}, -- Zaralek Cavern Challenge: Silver
    {18788}, -- Zaralek Cavern Challenge: Gold
    {18789}, -- Simply Enchanting
	{ -- Dragonriding Challenge: Dragon Isles: Bronze
		18790,
		{
			RewardType = rewardType.Toy,
		},
	},
    {18791}, -- Dragonriding Challenge: Dragon Isles: Silver
	{ -- Dragonriding Challenge: Dragon Isles: Gold
		18792,
		{
			RewardType = rewardType.Title,
		},
	},
    {18793}, -- Always Be Camping
    { -- Neltharion's Legacy
		18804,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {18805}, -- Draconic Phial Cabinet
    {18815}, -- Speed Dreamin'
    {18816}, -- Serious Chef
    {18817}, -- Showoff Chef
    {18818}, -- Geologist's Ledger - Serevite
    {18819}, -- Geologist's Ledger - Draconium
    {18820}, -- Geologist's Ledger: Dragon Isles
    {18821}, -- Geologist's Ledger - Overloaded Elements
    {18822}, -- Botanist's Log - Hochenblume
    {18823}, -- Botanist's Log - Saxifrage
    {18824}, -- Botanist's Log - Bubble Poppy
    {18825}, -- Botanist's Log - Writhebark
    {18828}, -- Botanist's Log: Dragon Isles
    {18829}, -- Botanist's Log - Overloaded Elements
    {18831}, -- Elusive Beasts of the Dragon Isles
    {18832}, -- Elusive Legend of the Dragon Isles
    {18833}, -- Elusive Legends of the Dragon Isles
    {18834}, -- Broken Isles Skinning Techniques
    {18835}, -- Fourth War Skinning Techniques
    {18837}, -- Broken Isles Herbalism Techniques
    {18838}, -- Fourth War Herbalism Techniques
    {18839}, -- Broken Isles Mining Techniques
    {18840}, -- Fourth War Mining Techniques
    {18841}, -- Doing Your Share
    {18851}, -- Skeletons in the Lockbox
    {18852}, -- Weaponsmithing, Reborn
    {18853}, -- Seething Flames of Hatred
    { -- Seeing Red
		18854,
		{
			RewardType = rewardType.Other,
		},
	},
    {18855}, -- Portal to Everywhere
    {18856}, -- Just an Ordinary Gas Cloud
    {18857}, -- That's No Ordinary Gas Cloud!
    { -- Forge and Befuddle
        18858,
        faction.Horde,
        18859,
    },
    { -- Forge and Befuddle
        18859,
        faction.Alliance,
        18858,
    },
    {18862}, -- Anvil Mastery I
    {18864}, -- Anvil Mastery II
    {18865}, -- Anvil Mastery III
    {18866}, -- Anvil Mastery IV
    {18867}, -- Through the Ashes and Flames
    {18868}, -- Enchantment I
    {18869}, -- Enchantment II
    {18870}, -- Enchantment III
    {18871}, -- Enchantment IV
    {18872}, -- Dangerous Devices I
    {18873}, -- Dangerous Devices II
    {18874}, -- Dangerous Devices III
    {18875}, -- Dangerous Devices IV
    {18876}, -- Ink and Quill I
    {18877}, -- Ink and Quill II
    {18878}, -- Ink and Quill III
    {18879}, -- Ink and Quill IV
    {18880}, -- Generations of Gemstones I
    {18881}, -- A Test of Scale I
    {18882}, -- A Test of Scale II
    {18883}, -- A Test of Scale III
    {18884}, -- A Test of Scale IV
    {18885}, -- Quite the Quilt I
    {18886}, -- Quite the Quilt II
    {18887}, -- Quite the Quilt III
    {18888}, -- Quite the Quilt IV
    {18889}, -- Generations of Gemstones II
    {18890}, -- Generations of Gemstones III
    {18891}, -- Generations of Gemstones IV
    {18892}, -- Massive Mills
    {18893}, -- Plentiful Prospects
    {18894}, -- Free Stylin'
    {18895}, -- You Had it Coming
    {18896}, -- United as Three
    {18897}, -- Can't Crush These
    {18898}, -- That's Just Cruel
    {18899}, -- You Saw Nothing
    {18900}, -- Budget Bard
    { -- Chromatic Calibration: Holo-Gogs
		18901,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {18902}, -- Uncertified Nurse
    {18903}, -- Ton of Tops
    {18904}, -- Iron to Vendor Gold
    { -- Chromatic Calibration: Retinal Armor
		18905,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Chromatic Calibration: Cranial Cannons
		18906,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Chromatic Calibration: Ectoplasmic Specs
		18907,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Chromatic Calibration: Bio-Optic Killshades
		18908,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {18909}, -- Fantastic Figurines
    {18928}, -- Storm Rider: Bronze
    {18929}, -- Storm Rider: Silver
	{ -- Storm Rider: Gold
		18931,
		{
			RewardType = rewardType.Title,
		},
	},
    {18934}, -- Excessive Experimentation
    { -- Eastern Kingdoms Racing Completionist
        18939,
        {
            {"Event", 1400},
        },
    },
    { -- Eastern Kingdoms Racing Completionist: Silver
        18940,
        {
            {"Event", 1400},
        },
    },
    {18941}, -- Dazzling Dragons
    { -- Eastern Kingdoms Racing Completionist: Gold
        18942,
        {
            RewardType = rewardType.Title,
            {"Event", 1400},
        },
    },
    { -- Don't Lose Your Head, Man
        18959,
        {
            {"Event", 324},
        },
    },
    { -- Kickin' With the Wick
        18960,
        {
            {"Event", 324},
        },
    },
    { -- A Cleansing Fire
        18962,
        {
            {"Event", 324},
        },
    },
    {18963}, -- Burst Damage
    {19008}, -- Dream Shaper
    {19027}, -- Heroic Edition: Algarian Stormrider
    {19029}, -- Lil' Maggz
    {19030}, -- Squally
    { -- Master of the Turbulent Timeways
        19079,
        {
            RewardType = rewardType.Mount,
            {"Event", 1425, false},
        },
    },
    { -- Arcane Influence
        19080,
        {
            {"From", "Date", {2023, 9, 10}, "Until", "Date", {2023, 9, 14}},
        },
    },
    { -- Outland: Bronze
        19092,
        {
            {"Event", 1407},
        },
    },
    { -- Outland: Silver
        19097,
        {
            {"Event", 1407},
        },
    },
    { -- Outland: Gold
        19098,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Advanced: Bronze
        19099,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Advanced: Silver
        19100,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Advanced: Gold
        19101,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Reverse: Bronze
        19102,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Reverse: Silver
        19103,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Reverse: Gold
        19104,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Racing Completionist
        19105,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Racing Completionist: Silver
        19106,
        {
            {"Event", 1407},
        },
    },
    { -- Outland Racing Completionist: Gold
        19107,
        {
            RewardType = {rewardType.Title, rewardType.Tabard},
            {"Event", 1407},
        },
    },
    {19192}, -- Lil' Frostwing
};

KrowiAF.AchievementData["10_02_00"] = {
    {KrowiAF.SetAchievementPatch, 10, 2, 0},
	{ -- Of the Tyr's Guard
		18958,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Dragonflight Keystone Explorer: Season Three
        19009,
        {
            {"PvE Season", 11},
        },
    },
    { -- Dragonflight Keystone Conqueror: Season Three
        19010,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 11},
        },
    },
    { -- Dragonflight Keystone Master: Season Three
        19011,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 11},
        },
    },
    { -- Dragonflight Keystone Hero: Season Three
        19012,
        {
            {"PvE Season", 11},
        },
    },
    {19013}, -- I Dream of Seeds
    {19026}, -- Defenders of the Dream
    {19031}, -- Fyrn
    {19077}, -- Catch Me If You Can!
    { -- Keystone Hero: Throne of the Tides
        19082,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: The Everbloom
        19083,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: Black Rook Hold
        19084,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: Darkheart Thicket
        19085,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: Waycrest Manor
        19086,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: Atal'Dazar
        19087,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
    { -- Keystone Hero: Dawn of the Infinite
        19088,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 11},
        },
    },
	{ -- Don't Let the Doe Hit You On The Way Out
		19089,
		{
			RewardType = rewardType.Pet,
		},
	},
    { -- Elite: Dragonflight Season 3
        19090,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Gladiator: Dragonflight Season 3
        19091,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    {19109}, -- Emerald Dream: Bronze
    {19110}, -- Emerald Dream: Silver
    {19111}, -- Emerald Dream: Gold
    {19112}, -- Emerald Dream Advanced: Bronze
    {19113}, -- Emerald Dream Advanced: Silver
    {19114}, -- Emerald Dream Advanced: Gold
    {19115}, -- Emerald Dream Reverse: Bronze
    {19116}, -- Emerald Dream Reverse: Silver
    {19117}, -- Emerald Dream Reverse: Gold
    {19118}, -- Emerald Dream Racing Completionist
    {19119}, -- Emerald Dream Racing Completionist: Silver
	{ -- Emerald Dream Racing Completionist: Gold
		19120,
		{
			RewardType = rewardType.Title,
		},
	},
    {19121}, -- Emerald Dream Challenge: Bronze
    {19122}, -- Emerald Dream Challenge: Silver
    {19123}, -- Emerald Dream Challenge: Gold
    {19124}, -- Emerald Dream Reverse Challenge: Bronze
    {19125}, -- Emerald Dream Reverse Challenge: Silver
    {19126}, -- Emerald Dream Reverse Challenge: Gold
    {19127}, -- Emerald Dream Challenge Racing Completionist
    {19128}, -- Emerald Dream Challenge Racing Completionist: Silver
	{ -- Emerald Dream Challenge Racing Completionist: Gold
		19129,
		{
			RewardType = rewardType.Title,
		},
	},
    {19130}, -- Junior Racing Champion
    { -- Verdant Legend: Dragonflight Season 3
        19131,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Verdant Gladiator: Dragonflight Season 3
        19132,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Rival I: Dragonflight Season 3
        19133,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Rival II: Dragonflight Season 3
        19155,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Duelist: Dragonflight Season 3
        19156,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Combatant I: Dragonflight Season 3
        19157,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Combatant II: Dragonflight Season 3
        19158,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Challenger I: Dragonflight Season 3
        19159,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Challenger II: Dragonflight Season 3
        19160,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Hero of the Horde: Verdant
        19161,
        faction.Horde,
        19162,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Hero of the Alliance: Verdant
        19162,
        faction.Alliance,
        19161,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    {19193}, -- Ducks In A Row
    {19194}, -- The Emerald Bounty
    {19196}, -- Sowing the Seeds
	{ -- The Seeds I Sow
		19198,
		{
			RewardType = rewardType.Title,
		},
	},
    -- {19230}, -- Friends in the Dream [Removed in 11.0.7, replaced by 41176]
    -- {19235}, -- Warden of the Dream [Removed in 11.0.7, replaced by 41177]
    { -- Verdant Vogue
        19276,
        {
            IsPvP = true,
        },
    },
	{ -- Friends In Feathers
		19293,
		{
			RewardType = rewardType.Pet,
		},
	},
    {19294}, -- Tour of Duty: Emerald Dream
    { -- Verdant Gladiator's Slitherdrake
        19295,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    {19296}, -- Dragon Glyphs: Eye of Ysera
    {19297}, -- Dragon Glyphs: Furnace Coil
    {19298}, -- Dragon Glyphs: Smoldering Copse
    {19299}, -- Dragon Glyphs: Cinder Summit
    {19300}, -- Dragon Glyphs: Dreamsurge Basin
    {19301}, -- Dragon Glyphs: Amirdrassil
    {19302}, -- Dragon Glyphs: Whorlwing Basin
    {19303}, -- Dragon Glyphs: Wakeful Vista
    { -- Legend: Dragonflight Season 3
        19304,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    {19306}, -- Emerald Dream Glyph Hunter
    {19307}, -- Dragon Isles Pathfinder
    -- {19308}, -- Freshscales Fifteen [Removed in 11.0.7, replaced by 41184]
    {19309}, -- Explore the Emerald Dream
    {19310}, -- Fruit of the Bloom
    {19312}, -- Super Duper Bloom
    {19313}, -- Bloom Man Group
    {19315}, -- Dream Chaser
    {19316}, -- Adventurer of the Emerald Dream
    { -- Treasures of the Emerald Dream
		19317,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- Dream On
		19318,
		{
			RewardType = rewardType.Title,
		},
	},
    {19319}, -- Haven't We Done This Before?
    {19320}, -- Cruelty Free
    {19321}, -- Swog Champion
    {19322}, -- Meaner Pastures
    { -- Dreaming of Drakes
        19326,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 11},
        },
    },
    {19331}, -- Amirdrassil, the Dream's Hope
    {19333}, -- Heroic: Amirdrassil, the Dream's Hope
    {19334}, -- Mythic: Amirdrassil, the Dream's Hope
    {19335}, -- Mythic: Gnarlroot
    {19336}, -- Mythic: Igira the Cruel
    {19337}, -- Mythic: Volcoross
    {19338}, -- Mythic: Council of Dreams
    {19339}, -- Mythic: Larodar, Keeper of the Flame
    {19340}, -- Mythic: Nymue, Weaver of the Cycle
    {19341}, -- Mythic: Smolderon
    {19342}, -- Mythic: Tindral Sageswift, Seer of the Flame
	{ -- Mythic: Fyrakk the Blazing
		19343,
		{
			RewardType = rewardType.Title,
		},
	},
    {19344}, -- Incarnate's Wake
    {19345}, -- Molten Incursion
    {19346}, -- The Viridian Weave
    {19347}, -- Fate of Amirdrassil
	{ -- Glory of the Dream Raider
		19349,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Ahead of the Curve: Fyrakk the Blazing
        19350,
        {
            {"PvE Season", 11},
        },
    },
    { -- Cutting Edge: Fyrakk the Blazing
        19351,
        {
            {"PvE Season", 11},
        },
    },
    {19390}, -- Memories of Teldrassil
    {19393}, -- Whelp, I'm Lost
    {19394}, -- A Dream Within a Dream
    { -- Dragonflight Season 3 Master
		19396,
		{
			RewardType = rewardType.Transmog,
		},
	},
    { -- Dreaming of Wyrms
        19397,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 11},
        },
    },
    { -- Dreaming of the Aspects
        19398,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 11},
        },
    },
    {19401}, -- Emerald Dream Safari
    { -- Battleground Blitz Novice
        19411,
        {
            IsPvP = true,
        },
    },
    { -- Battleground Blitz Apprentice
        19412,
        {
            IsPvP = true,
        },
    },
    { -- Battleground Blitz Veteran
        19413,
        {
            IsPvP = true,
        },
    },
    { -- Learning the Ropes
        19416,
        {
            IsPvP = true,
        },
    },
    { -- Brawlroom Blitzer
        19417,
        {
            IsPvP = true,
        },
    },
    { -- Battle-scarred Battler
        19418,
        {
            IsPvP = true,
        },
    },
    { -- Dragonflight Season 3 Hero
		19420,
		{
			RewardType = rewardType.Transmog,
		},
	},
    {19442}, -- Fire Catwalk With Me
    { -- Battle Mender: Dragonflight Season 3
        19443,
        {
            IsPvP = true,
            {"PvP Season", 36},
        },
    },
    { -- Dreaming Hero: Dragonflight Season 3
        19449,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 11},
        },
    },
    {19450}, -- Fyr'alath the Dreamrender
    {19461}, -- Kissed by the Wind
};

KrowiAF.AchievementData["10_02_05"] = {
    {KrowiAF.SetAchievementPatch, 10, 2, 5},
    { -- Support Your Local Artisans
        19400,
        {
            {"Event", 423},
        },
    },
    { -- Love Language Expert
        19508,
        {
            {"Event", 423},
        },
    },
    { -- Northrend: Bronze
        19674,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend: Silver
        19675,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend: Gold
        19676,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Advanced: Bronze
        19677,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Advanced: Silver
        19679,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Advanced: Gold
        19681,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Reverse: Bronze
        19682,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Reverse: Silver
        19683,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Reverse: Gold
        19684,
        {
            {"Event", 1429},
        },
    },
    {19685}, -- Tenured Archivist
    {19719}, -- Reclamation of Gilneas
    { -- Northrend Racing Completionist
        19721,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Racing Completionist: Silver
        19722,
        {
            {"Event", 1429},
        },
    },
    { -- Northrend Racing Completionist: Gold
        19723,
        {
            RewardType = {rewardType.Title, rewardType.Tabard},
            {"Event", 1429},
        },
    },
    {19724}, -- Hearthstone Card Collection
    {19786}, -- When a Rock is Just a Rock
    {19787}, -- Clued In
    {19788}, -- Tome Comber
    {19789}, -- Relic Rescuer
	{ -- The Archives Called, You Answered
		19790,
		{
			RewardType = rewardType.Title,
		},
	},
    {19791}, -- Goggle Wobble
	{ -- Just One More Thing
		19792,
		{
			RewardType = rewardType.Pet,
		},
	},
	{ -- Finally At Rest
		19793,
		{
			RewardType = rewardType.Pet,
		},
	},
    {19866}, -- Hearthstoned: Fiery Edition
	{ -- Hearthstone Beginner
		20033,
		{
			RewardType = rewardType.Toy,
		},
	},
	{ -- Champion of the Dragonflights
		20206,
		{
			RewardType = rewardType.Title,
		},
	},
};

KrowiAF.AchievementData["10_02_06"] = {
    {KrowiAF.SetAchievementPatch, 10, 2, 6},
    { -- Draconic Legend: Dragonflight Season 4
        19453,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Draconic Gladiator: Dragonflight Season 4
        19454,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Hero of the Alliance: Draconic
        19455,
        faction.Alliance,
        19456,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Hero of the Horde: Draconic
        19456,
        faction.Horde,
        19455,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
	{ -- A World Awoken
		19458,
		{
			RewardType = rewardType.Mount,
		},
	},
    {19463}, -- Dragon Quests
    {19466}, -- Oh My God, They Were Clutchmates
	{ -- Now THIS is Dragon Racing!
		19478,
		{
			RewardType = rewardType.Mount,
		},
	},

	{ -- Wake Me Up
		19479,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Centaur of Attention
		19481,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Army of the Fed
		19482,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Flight Club
		19483,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Closing Time
		19485,
		{
			RewardType = rewardType.Mount,
		},
	},
	{ -- Across the Isles
		19486,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Gladiator: Dragonflight Season 4
        19490,
        {
            RewardType = {rewardType.Title, rewardType.Mount, rewardType.Transmog},
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Duelist: Dragonflight Season 4
        19492,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Rival I: Dragonflight Season 4
        19493,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Combatant I: Dragonflight Season 4
        19494,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Combatant II: Dragonflight Season 4
        19495,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Challenger I: Dragonflight Season 4
        19497,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Rival II: Dragonflight Season 4
        19498,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Challenger II: Dragonflight Season 4
        19499,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Legend: Dragonflight Season 4
        19500,
        {
            RewardType = {rewardType.Title, rewardType.Toy},
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Draconic Gladiator's Drake
        19503,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    {19507}, -- Fringe Benefits
    { -- Elite: Dragonflight Season 4
        19509,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Battle Mender: Dragonflight Season 4
        19513,
        {
            IsPvP = true,
            {"PvP Season", 37},
        },
    },
    { -- Awakened Storms
        19564,
        {
            {"PvE Season", 12},
        },
    },
    { -- Heroic: Awakened Storms
        19565,
        {
            {"PvE Season", 12},
        },
    },
    { -- Mythic: Awakened Storms
        19566,
        {
            {"PvE Season", 12},
        },
    },
    { -- Awakened Shadows
        19567,
        {
            {"PvE Season", 12},
        },
    },
    { -- Heroic: Awakened Shadows
        19568,
        {
            {"PvE Season", 12},
        },
    },
    { -- Mythic: Awakened Shadows
        19569,
        {
            {"PvE Season", 12},
        },
    },
    { -- Awakened Flames
        19570,
        {
            {"PvE Season", 12},
        },
    },
    { -- Heroic: Awakened Flames
        19571,
        {
            {"PvE Season", 12},
        },
    },
    { -- Mythic: Awakened Flames
        19572,
        {
            {"PvE Season", 12},
        },
    },
    { -- Awakening the Dragonflight Raids
        19574,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 12},
        },
    },
    { -- Heroic: Awakening the Dragonflight Raids
        19575,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 12},
        },
    },
    { -- Mythic: Awakening the Dragonflight Raids
        19576,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 12},
        },
    },
    { -- Dragonflight Keystone Explorer: Season Four
        19780,
        {
            {"PvE Season", 12},
        },
    },
    { -- Dragonflight Keystone Conqueror: Season Four
        19781,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 12},
        },
    },
    { -- Dragonflight Keystone Master: Season Four
        19782,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 12},
        },
    },
    { -- Dragonflight Keystone Hero: Season Four
        19783,
        {
            {"PvE Season", 12},
        },
    },
    { -- Draconic Hero: Dragonflight Season 4
        19785,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 12},
        },
    },
    { -- Quacked Killer
        20209,
        {
            {"Event", 181},
        },
    },
    { -- Dragonflight Season 4 Master
		20481,
		{
			RewardType = rewardType.Transmog,
		},
	},
	{ -- Back from the Beyond
		20501,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Plunder Wonder
        20508,
        -- {
        --     {"Event", 1601},
        -- },
    },
    { -- Plunderkind
        20509,
        -- {
        --     {"Event", 1601},
        -- },
    },
};

KrowiAF.AchievementData["10_02_07"] = {
    {KrowiAF.SetAchievementPatch, 10, 2, 7},
    { -- Infinite Power
        19871,
        {
            {"Event", 1514},
        },
    },
    { -- The Jade Forest
        19872,
        {
            RewardType = rewardType.Toy,
            {"Event", 1514},
        },
    },
    { -- Valley of the Four Winds
        19873,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Krasarang Wilds
        19874,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Kun-Lai Summit
        19875,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Vale of Eternal Blossoms
        19876,
        {
            RewardType = rewardType.Mount,
            {"Event", 1514},
        },
    },
    { -- Townlong Steppes
        19877,
        {
            RewardType = rewardType.Pet,
            {"Event", 1514},
        },
    },
    { -- Dread Wastes
        19878,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Landfall
        19879,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Isle of Thunder
        19880,
        {
            RewardType = rewardType.Transmog,
            {"Event", 1514},
        },
    },
    { -- Escalation
        19881,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Campaign: The Jade Forest
        19882,
        faction.Alliance,
        19883,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: The Jade Forest
        19883,
        faction.Horde,
        19882,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Valley of the Four Winds
        19884,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Krasarang Wilds
        19885,
        faction.Alliance,
        19886,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Krasarang Wilds
        19886,
        faction.Horde,
        19885,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Kun-Lai Summit
        19887,
        faction.Alliance,
        19888,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Kun-Lai Summit
        19888,
        faction.Horde,
        19887,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Townlong Steppes
        19889,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Dread Wastes
        19890,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Landfall
        19891,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Campaign: Isle of Thunder
        19892,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- A Brewing Storm
        19893,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Temple of the Jade Serpent
        19894,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Temple of the Jade Serpent
        19895,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Stormstout Brewery
        19896,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Stormstout Brewery
        19897,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Shado-Pan Monastery
        19898,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Shado-Pan Monastery
        19899,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Siege of Niuzao Temple
        19900,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Siege of Niuzao Temple
        19901,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Gate of the Setting Sun
        19902,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Gate of the Setting Sun
        19903,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Mogu'shan Palace
        19904,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Mogu'shan Palace
        19905,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Scarlet Halls
        19906,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Scarlet Halls
        19907,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Scarlet Monastery
        19908,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Scarlet Monastery
        19909,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Scholomance
        19910,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Scholomance
        19911,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Order of the Cloud Serpent
        19912,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- The August Celestials
        19913,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Shado-Pan
        19914,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- The Klaxxi
        19915,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Golden Lotus
        19916,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Operation: Shieldwall
        19917,
        faction.Alliance,
        19918,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Dominance Offensive
        19918,
        faction.Horde,
        19917,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Kirin Tor Offensive
        19919,
        faction.Alliance,
        19920,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Sunreaver Onslaught
        19920,
        faction.Horde,
        19919,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Shado-Pan Assault
        19921,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Emperor Shaohao
        19922,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Greenstone Village
        19923,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: A Brewing Storm
        19924,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Unga Ingoo
        19925,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Brewmoon Festival
        19926,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Arena of Annihilation
        19927,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Crypt of Forgotten Kings
        19928,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Crypt of Forgotten Kings
        19929,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Assault on Zan'vess
        19930,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- A Little Patience
        19931,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Domination Point
        19932,
        faction.Horde,
        20500,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Dagger in the Dark
        19933,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Battle on the High Seas
        19934,
        faction.Alliance,
        19936,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Battle on the High Seas
        19935,
        faction.Alliance,
        19937,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Battle on the High Seas
        19936,
        faction.Horde,
        19934,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Battle on the High Seas
        19937,
        faction.Horde,
        19935,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Theramore's Fall
        19938,
        faction.Alliance,
        19939,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Theramore's Fall
        19939,
        faction.Horde,
        19938,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Blood in the Snow
        19940,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Blood in the Snow
        19941,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Dark Heart of Pandaria
        19942,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Dark Heart of Pandaria
        19943,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Secrets of Ragefire
        19944,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Secrets of Ragefire
        19945,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Raid Finder: Mogu'shan Vaults
        19946,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Mogu'shan Vaults
        19947,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Mogu'shan Vaults
        19948,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Raid Finder: Heart of Fear
        19949,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heart of Fear
        19950,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Heart of Fear
        19951,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Raid Finder: Terrace of Endless Spring
        19952,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Terrace of Endless Spring
        19953,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Terrace of Endless Spring
        19954,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Raid Finder: Throne of Thunder
        19955,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Throne of Thunder
        19956,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Throne of Thunder
        19957,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Raid Finder: Siege of Orgrimmar
        19958,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Siege of Orgrimmar
        19959,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Heroic: Siege of Orgrimmar
        19960,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Mythic Remix: Siege of Orgrimmar
        19961,
        {
            RewardType = rewardType.Title,
            {"Event", 1514},
        },
    },
    { -- Tour The Jade Forest
        19962,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Valley of the Four Winds
        19963,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Krasarang Wilds
        19964,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Kun-Lai Summit
        19965,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Townlong Steppes
        19966,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Dread Wastes
        19967,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Tour Timeless Isle
        19970,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: The Jade Forest
        19977,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: Valley of the Four Winds
        19978,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: Krasarang Wilds
        19979,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: Kun-Lai Summit
        19980,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: Townlong Steppes
        19981,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Hidden Treasures: Timeless Isle
        19982,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: The Jade Forest
        19993,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Valley of the Four Winds
        19994,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Krasarang Wilds
        19995,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Kun-Lai Summit
        19996,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Townlong Steppes
        19997,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Dread Wastes
        19998,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Landfall
        19999,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Isle of Thunder
        20000,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Timeless Isle
        20001,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Powerful Enemies: Timeless Isle
        20002,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Timeless Isle
        20003,
        {
            RewardType = rewardType.Pet,
            {"Event", 1514},
        },
    },
    { -- Heroic: Pandaria Scenarios
        20004,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Heroic: Pandaria Dungeons
        20005,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Pandaria Raids
        20006,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Heroic: Pandaria Raids
        20007,
        {
            RewardType = rewardType.Title,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: The Jade Forest
        20008,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Valley of the Four Winds
        20009,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Kun-Lai Summit
        20011,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Townlong Steppes
        20012,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Vale of Eternal Blossoms
        20014,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Isle of Thunder
        20015,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Looking For Group: Timeless Isle
        20016,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Salyis's Warband
        20017,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Sha of Anger
        20018,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Nalak, the Storm Lord
        20019,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Oondasta
        20020,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Chi-ji, the Red Crane
        20021,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Yu'lon, the Jade Serpent
        20022,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Niuzao, the Black Ox
        20023,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Xuen, the White Tiger
        20024,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Ordos
        20025,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Jade Forest
        20026,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Valley of the Four Winds
        20027,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Krasarang Wilds
        20028,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Kun-Lai Summit
        20029,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Townlong Steppes
        20030,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Explore Dread Wastes
        20031,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Elusive Foes: Vale of Eternal Blossoms
        20069,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Lion's Landing
        20500,
        faction.Alliance,
        19932,
        {
            RewardType = rewardType.RemixPandariaBronze,
            {"Event", 1514},
        },
    },
    { -- Infinite Power I
        20527,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power II
        20528,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power III
        20529,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power IV
        20530,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power V
        20531,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power VI
        20532,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power VII
        20533,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power VIII
        20534,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power IX
        20535,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power X
        20536,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power XI
        20537,
        {
            RewardType = rewardType.Other,
            {"Event", 1514},
        },
    },
    { -- Infinite Power XII
        20538,
        {
            RewardType = rewardType.Toy,
            {"Event", 1514},
        },
    },
    { -- Time Trial
        20593,
        {
            RewardType = rewardType.Mount,
            {"Event", 1514},
        },
    },
    { -- Timerunner
        40223,
        {
            RewardType = {rewardType.Title, rewardType.Other},
            {"Event", 1514},
        },
    },
    {40382}, -- Hunt the Harbinger
};