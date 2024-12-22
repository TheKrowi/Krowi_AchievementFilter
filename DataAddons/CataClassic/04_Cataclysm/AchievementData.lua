local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["04_00_01"] = {
    {KrowiAF.SetAchievementPatch, 4, 0, 1},
    { -- Friends In Even Higher Places
        4832,
        {
            {"Never"},
        },
    },
    { -- Tripping the Rifts
        4887,
        {
            {"Never"},
        },
    },
    { -- Collector's Edition: Lil' Deathwing
        5377,
        {
            {"Never"},
        },
    },
    { -- Deathy
        5378,
        {
            {"Never"},
        },
    },
    { -- WoW's 6th Anniversary
        5512,
        {
            {"Never"},
        },
    },
    { -- 1000 Valor Points
        5535,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- 5000 Valor Points
        5536,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- 25,000 Valor Points
        5537,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- 50,000 Valor Points
        5538,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
};

KrowiAF.AchievementData["04_00_03"] = {
    {KrowiAF.SetAchievementPatch, 4, 0, 3},
    {4825}, -- Explore Vashj'ir
    { -- Level 85
        4826,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {4827}, -- Surveying the Damage
    {4833}, -- Blackrock Caverns
    {4839}, -- Throne of the Tides
    {4840}, -- Grim Batol
    {4841}, -- Halls of Origination
    {4842}, -- Blackwing Descent
    {4844}, -- Cataclysm Dungeon Hero
	{ -- Glory of the Cataclysm Hero
		4845,
		{
			RewardType = rewardType.Mount,
		},
	},
    {4846}, -- The Stonecore
    {4847}, -- The Vortex Pinnacle
    {4848}, -- Lost City of the Tol'vir
    {4849}, -- Keeping it in the Family
    {4850}, -- The Bastion of Twilight
    {4851}, -- Throne of the Four Winds
    {4852}, -- Double Dragon
	{ -- Glory of the Cataclysm Raider
		4853,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- I Had It in My Hand
        4854,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- What was Briefly Yours is Now Mine
        4855,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- It Belongs in a Museum!
        4856,
        {
            RewardType = rewardType.Title,
        },
    },
    {4857}, -- Journeyman in Archaeology
    {4858}, -- Seven Scepters
    {4859}, -- Kings Under the Mountain
    {4863}, -- Explore Hyjal
    {4864}, -- Explore Deepholm
    {4865}, -- Explore Uldum
    {4866}, -- Explore Twilight Highlands
    {4868}, -- Explore Cataclysm
    { -- Sinking into Vashj'ir
        4869,
        faction.Alliance,
        4982,
    },
    {4870}, -- Coming Down the Mountain
    {4871}, -- Deep into Deepholm
    {4872}, -- Unearthing Uldum
    { -- Fading into Twilight
        4873,
        faction.Alliance,
        5501,
    },
    {4874}, -- Breaking Out of Tol Barad
    { -- Loremaster of Cataclysm
        4875,
        faction.Alliance,
        4983,
    },
    {4881}, -- The Earthen Ring
    {4882}, -- The Guardians of Hyjal
    {4883}, -- Therazane
    {4884}, -- Ramkahen
    { -- Wildhammer Clan
        4885,
        faction.Alliance,
        4886,
    },
    { -- Dragonmaw Clan
        4886,
        faction.Horde,
        4885,
    },
    {4888}, -- One Hump or Two?
    {4892}, -- Eastern Plaguelands Quests
    {4893}, -- Western Plaguelands Quests
    { -- Silverpine Forest Quests
        4894,
        faction.Horde,
        4907,
    },
    { -- Hillsbrad Foothills Quests
        4895,
        faction.Horde,
        4902,
    },
    {4896}, -- Arathi Highlands Quests
    {4897}, -- Hinterlands Quests
    { -- Wetlands Quests
        4898,
        faction.Alliance,
        4908,
    },
    { -- Loch Modan Quests
        4899,
        faction.Alliance,
    },
    {4900}, -- Badlands Quests
    {4901}, -- Burning Steppes Quests
    { -- Redridge Mountains Quests
        4902,
        faction.Alliance,
        4895,
    },
    { -- Westfall Quests
        4903,
        faction.Alliance,
    },
    {4904}, -- Swamp of Sorrows Quests
    {4905}, -- Cape of Stranglethorn Quests
    {4906}, -- Northern Stranglethorn Quests
    { -- Duskwood Quests
        4907,
        faction.Alliance,
        4894,
    },
    { -- Ghostlands Quests
        4908,
        faction.Horde,
        4898,
    },
    {4909}, -- Blasted Lands Quests
    {4910}, -- Searing Gorge Quests
    {4914}, -- Working Around the Clock
    { -- More Skills to Pay the Bills
        4915,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {4916}, -- Illustrious Grand Master Cook
    {4917}, -- Illustrious Grand Master Fisherman
        { -- Illustrious Grand Master in First Aid
        4918,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {4919}, -- Expert in Archaeology
    {4920}, -- Artisan in Archaeology
    {4921}, -- Master in Archaeology
    {4922}, -- Grand Master in Archaeology
    {4923}, -- Illustrious Grand Master in Archaeology
    {4924}, -- Professional Illustrious Grand Master
    { -- Ashenvale Quests
        4925,
        faction.Alliance,
        4976,
    },
    { -- Bloodmyst Isle Quests
        4926,
        faction.Alliance,
        4933,
    },
    { -- Azshara Quests
        4927,
        faction.Horde,
        4928,
    },
    { -- Darkshore Quests
        4928,
        faction.Alliance,
        4927,
    },
    { -- Dustwallow Marsh Quests
        4929,
        faction.Alliance,
        4978,
    },
    {4930}, -- Desolace Quests
    {4931}, -- Felwood Quests
    { -- Feralas Quests
        4932,
        faction.Alliance,
        4979,
    },
    { -- Northern Barrens Quests
        4933,
        faction.Horde,
        4926,
    },
    {4934}, -- Silithus Quests
    {4935}, -- Tanaris Quests
    { -- Stonetalon Mountains Quests
        4936,
        faction.Alliance,
        4980,
    },
    { -- Southern Barrens Quests
        4937,
        faction.Alliance,
        4981,
    },
    {4938}, -- Thousand Needles Quests
    {4939}, -- Un'Goro Crater Quests
    {4940}, -- Winterspring Quests
    {4956}, -- 5 Dungeon Quests Completed
    {4957}, -- 20 Dungeon Quests Completed
    {4958}, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    {4959}, -- Beware of the 'Unbeatable?' Pterodactyl
    {4960}, -- Round Three. Fight!
    {4961}, -- In a Thousand Years Even You Might be Worth Something
    {4975}, -- From Hell's Heart I Stab at Thee
    { -- Ashenvale Quests
        4976,
        faction.Horde,
        4925,
    },
    { -- Dustwallow Marsh Quests
        4978,
        faction.Horde,
        4929,
    },
    { -- Feralas Quests
        4979,
        faction.Horde,
        4932,
    },
    { -- Stonetalon Mountains Quests
        4980,
        faction.Horde,
        4936,
    },
    { -- Southern Barrens Quests
        4981,
        faction.Horde,
        4937,
    },
    { -- Sinking into Vashj'ir
        4982,
        faction.Horde,
        4869,
    },
    { -- Loremaster of Cataclysm
        4983,
        faction.Horde,
        4875,
    },
    {4995}, -- Explore the Cape of Stranglethorn
    {4996}, -- Explore Southern Barrens
    { -- Realm First! Level 85 Shaman
        4998,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85
        4999,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Druid
        5000,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Paladin
        5001,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Priest
        5002,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Warlock
        5003,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Hunter
        5004,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Death Knight
        5005,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Mage
        5006,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Warrior
        5007,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 85 Rogue
        5008,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {5060}, -- Heroic: Blackrock Caverns
    {5061}, -- Heroic: Throne of the Tides
    {5062}, -- Heroic: Grim Batol
    {5063}, -- Heroic: The Stonecore
    {5064}, -- Heroic: The Vortex Pinnacle
    {5065}, -- Heroic: Halls of Origination
    {5066}, -- Heroic: Lost City of the Tol'vir
    {5083}, -- Heroic: Deadmines
    {5093}, -- Heroic: Shadowfang Keep
    {5094}, -- Heroic: Magmaw
    {5107}, -- Heroic: Omnotron Defense System
    {5108}, -- Heroic: Maloriak
    {5109}, -- Heroic: Atramedes
    {5115}, -- Heroic: Chimaeron
    { -- Heroic: Nefarian
        5116,
        {
            RewardType = rewardType.Title,
        },
    },
    {5117}, -- Heroic: Valiona and Theralion
    {5118}, -- Heroic: Halfus Wyrmbreaker
    {5119}, -- Heroic: Ascendant Council
    {5120}, -- Heroic: Cho'gall
    { -- Heroic: Sinestra
        5121,
        {
            RewardType = rewardType.Title,
        },
    },
    {5122}, -- Heroic: Conclave of Wind
    { -- Heroic: Al'Akir
        5123,
        {
            RewardType = rewardType.Title,
        },
    },
    {5180}, -- Breaking The Sound Barrier
    {5191}, -- Tragedy in Three Acts
    {5192}, -- The Harder they Fall
    {5193}, -- Blue Streak
    { -- Twin Peaking
        5208,
        {
            IsPvP = true,
        },
    },
    { -- Twin Peaks Veteran
        5209,
        {
            IsPvP = true,
        },
    },
    { -- Two-Timer
        5210,
        {
            IsPvP = true,
        },
    },
    { -- Top Defender
        5211,
        {
            IsPvP = true,
        },
    },
    { -- Soaring Spirits
        5213,
        faction.Alliance,
        5214,
        true,
    },
    { -- Soaring Spirits
        5214,
        faction.Horde,
        5213,
        true,
    },
    { -- Twin Peaks Perfection
        5215,
        {
            IsPvP = true,
        },
    },
    { -- Peak Speed
        5216,
        {
            IsPvP = true,
        },
    },
    { -- I'm in the White Lodge
        5219,
        faction.Alliance,
        5220,
        true,
    },
    { -- I'm in the Black Lodge
        5220,
        faction.Horde,
        5219,
        true,
    },
    { -- Fire, Walk With Me
        5221,
        faction.Alliance,
        5222,
        true,
    },
    { -- Fire, Walk With Me
        5222,
        faction.Horde,
        5221,
        true,
    },
    { -- Master of Twin Peaks
        5223,
        faction.Alliance,
        5259,
        true,
    },
    { -- Cloud Nine
        5226,
        faction.Alliance,
        5227,
        true,
    },
    { -- Cloud Nine
        5227,
        faction.Horde,
        5226,
        true,
    },
    { -- Wild Hammering
        5228,
        faction.Horde,
        5229,
        true,
    },
    { -- Drag a Maw
        5229,
        faction.Alliance,
        5228,
        true,
    },
    { -- Twin Peaks Mountaineer
        5230,
        {
            IsPvP = true,
        },
    },
    { -- Double Jeopardy
        5231,
        faction.Alliance,
        5552,
        true,
    },
    { -- Battle for Gilneas Victory
        5245,
        {
            IsPvP = true,
        },
    },
    { -- Battle for Gilneas Veteran
        5246,
        {
            IsPvP = true,
        },
    },
    { -- Battle for Gilneas Perfection
        5247,
        {
            IsPvP = true,
        },
    },
    { -- Bustin' Caps to Make It Haps
        5248,
        {
            IsPvP = true,
        },
    },
    { -- One Two Three You Don't Know About Me
        5249,
        {
            IsPvP = true,
        },
    },
    { -- Out of the Fog
        5250,
        {
            IsPvP = true,
        },
    },
    { -- Not Your Average PUG'er
        5251,
        {
            IsPvP = true,
        },
    },
    { -- Don't Get Cocky Kid
        5252,
        {
            IsPvP = true,
        },
    },
    { -- Full Coverage
        5253,
        {
            IsPvP = true,
        },
    },
    { -- Newbs to Plowshares
        5254,
        {
            IsPvP = true,
        },
    },
    { -- Jugger Not
        5255,
        {
            IsPvP = true,
        },
    },
    { -- Battle for Gilneas All-Star
        5256,
        {
            IsPvP = true,
        },
    },
    { -- Battle for Gilneas Assassin
        5257,
        {
            IsPvP = true,
        },
    },
    { -- Master of the Battle for Gilneas
        5258,
        {
            IsPvP = true,
        },
    },
    { -- Master of Twin Peaks
        5259,
        faction.Horde,
        5223,
        true,
    },
    { -- Double Rainbow
        5262,
        {
            IsPvP = true,
        },
    },
    { -- Three's Company: 2400
        5266,
        {
            IsPvP = true,
        },
    },
    { -- Three's Company: 2700
        5267,
        {
            IsPvP = true,
        },
    },
    { -- In Service of the Alliance
        5268,
        faction.Alliance,
        5269,
        true,
    },
    { -- In Service of the Horde
        5269,
        faction.Horde,
        5268,
        true,
    },
    {5281}, -- Crushing Bones and Cracking Skulls
    {5282}, -- Arrested Development
    {5283}, -- Too Hot to Handle
    {5284}, -- Ascendant Descending
    {5285}, -- Old Faithful
    {5286}, -- Prince of Tides
    {5287}, -- Rotten to the Core
    {5288}, -- No Static at All
    {5289}, -- Extra Credit Bonus Stage
    {5290}, -- Kill It With Fire!
    {5291}, -- Acrocalypse Now
    {5292}, -- Headed South
    {5293}, -- I Hate That Song
    {5294}, -- Straw That Broke the Camel's Back
    {5295}, -- Sun of a....
    {5296}, -- Faster Than the Speed of Light
    {5297}, -- Umbrage for Umbriss
    {5298}, -- Don't Need to Break Eggs to Make an Omelet
    {5300}, -- The Only Escape
    {5301}, -- The Boy Who Would be King
    {5304}, -- Stay Chill
    {5305}, -- Four Play
    {5306}, -- Parasite Evening
    {5307}, -- Achieve-a-tron
    {5308}, -- Silence is Golden
    {5309}, -- Full of Sound and Fury
    {5310}, -- Aberrant Behavior
    {5311}, -- Elementary
    {5312}, -- The Abyss Will Gaze Back Into You
    { -- I Can't Hear You Over the Sound of How Awesome I Am
        5313,
        {
            {"Before", "Version", {5, 0, 5}},
        },
    },
    {5315}, -- Digger
    {5317}, -- Help the Bombardier! I'm the Bombardier!
    { -- 20,000 Leagues Under the Sea
        5318,
        faction.Alliance,
        5319,
    },
    { -- 20,000 Leagues Under the Sea
        5319,
        faction.Horde,
        5318,
    },
    { -- King of the Mountain
        5320,
        faction.Alliance,
        5321,
    },
    { -- King of the Mountain
        5321,
        faction.Horde,
        5320,
    },
    { -- In Service of the Alliance
        5322,
        faction.Alliance,
        5323,
        true,
    },
    { -- In Service of the Horde
        5323,
        faction.Horde,
        5322,
        true,
    },
    { -- In Service of the Horde
        5324,
        faction.Horde,
        5327,
        true,
    },
    { -- Veteran of the Horde
        5325,
        faction.Horde,
        5328,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Warbringer of the Horde
        5326,
        faction.Horde,
        5329,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- In Service of the Alliance
        5327,
        faction.Alliance,
        5324,
        true,
    },
    { -- Veteran of the Alliance
        5328,
        faction.Alliance,
        5325,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Warbound Veteran of the Alliance
        5329,
        faction.Alliance,
        5326,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Private
        5330,
        faction.Alliance,
        5345,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Corporal
        5331,
        faction.Alliance,
        5346,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Sergeant
        5332,
        faction.Alliance,
        5347,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Master Sergeant
        5333,
        faction.Alliance,
        5348,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Sergeant Major
        5334,
        faction.Alliance,
        5349,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Knight
        5335,
        faction.Alliance,
        5350,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Knight-Lieutenant
        5336,
        faction.Alliance,
        5351,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Knight-Captain
        5337,
        faction.Alliance,
        5352,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Centurion
        5338,
        faction.Horde,
        5359,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Lieutenant Commander
        5339,
        faction.Alliance,
        5353,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Commander
        5340,
        faction.Alliance,
        5354,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Marshal
        5341,
        faction.Alliance,
        5355,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Warlord
        5342,
        faction.Horde,
        5357,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Grand Marshal
        5343,
        faction.Alliance,
        5356,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Vicious
        5344,
        faction.Alliance,
        5358,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 9},
        },
    },
    { -- Scout
        5345,
        faction.Horde,
        5330,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Grunt
        5346,
        faction.Horde,
        5331,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Sergeant
        5347,
        faction.Horde,
        5332,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Senior Sergeant
        5348,
        faction.Horde,
        5333,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- First Sergeant
        5349,
        faction.Horde,
        5334,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Stone Guard
        5350,
        faction.Horde,
        5335,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Blood Guard
        5351,
        faction.Horde,
        5336,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Legionnaire
        5352,
        faction.Horde,
        5337,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Champion
        5353,
        faction.Horde,
        5339,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Lieutenant General
        5354,
        faction.Horde,
        5340,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- General
        5355,
        faction.Horde,
        5341,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- High Warlord
        5356,
        faction.Horde,
        5343,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Field Marshal
        5357,
        faction.Alliance,
        5342,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Vicious
        5358,
        faction.Horde,
        5344,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 9},
        },
    },
    { -- Knight-Champion
        5359,
        faction.Alliance,
        5338,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- 250000 Honorable Kills
        5363,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Don't Want No Zombies on My Lawn
        5364,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Bloom and Doom
        5365,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {5366}, -- Ready for Raiding
    {5367}, -- Rat Pack
    {5368}, -- Prototype Prodigy
    {5369}, -- It's Frost Damage
    {5370}, -- I'm on a Diet
    {5371}, -- Vigorous VanCleef Vindicator
    { -- Cataclysmically Epic
        5372,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Cataclysmically Superior
        5373,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {5374}, -- 45 Exalted Reputations
    { -- Baradin's Wardens
        5375,
        faction.Alliance,
        5376,
    },
    { -- Hellscream's Reach
        5376,
        faction.Horde,
        5375,
    },
    { -- Realm First! Illustrious Alchemist
        5381,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Blacksmith
        5382,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Cooking
        5383,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Enchanter
        5384,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Engineer
        5385,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious First Aid
        5386,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Angler
        5387,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Herbalism
        5388,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Scribe
        5389,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Jewelcrafter
        5390,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Leatherworker
        5391,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Miner
        5392,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Skinner
        5393,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Tailor
        5394,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Grand Master Archaeologist
        5395,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Illustrious Archaeologist
        5396,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Tol Barad Victory
        5412,
        {
            IsPvP = true,
        },
    },
    { -- Tower Plower
        5415,
        {
            IsPvP = true,
        },
    },
    {5416}, -- Pit Lord Argaloth
    { -- Tol Barad Veteran
        5417,
        faction.Alliance,
        5418,
        true,
    },
    { -- Tol Barad Veteran
        5418,
        faction.Horde,
        5417,
        true,
    },
    {5442}, -- Full Caravan
    {5443}, -- E'ko Madness
    {5444}, -- Ready, Set, Goat!
    {5445}, -- Fungalophobia
    {5446}, -- The Glop Family Line
    {5447}, -- My Very Own Broodmother
    {5448}, -- Glutton for Fiery Punishment
    {5449}, -- Rock Lover
    {5450}, -- Fungal Frenzy
    {5451}, -- Consumed by Nightmare
    {5452}, -- Visions of Vashj'ir Past
    { -- Ghosts in the Dark
        5453,
        faction.Alliance,
    },
    { -- Joy Ride
        5454,
        faction.Horde,
    },
    {5455}, -- Got My Mind On My Money
    {5456}, -- Got My Mind On My Money
    {5469}, -- Diggerer
    {5470}, -- Diggerest
    {5471}, -- Iron Chef
    {5472}, -- The Cataclysmic Gourmet
    {5473}, -- The Cataclysmic Gourmet
    { -- Let's Do Lunch: Stormwind
        5474,
        faction.Alliance,
        5475,
    },
    { -- Let's Do Lunch: Orgrimmar
        5475,
        faction.Horde,
        5474,
    },
    { -- Fish or Cut Bait: Stormwind
        5476,
        faction.Alliance,
        5477,
    },
    { -- Fish or Cut Bait: Orgrimmar
        5477,
        faction.Horde,
        5476,
    },
    {5478}, -- The Limnologist
    {5479}, -- The Oceanographer
    {5480}, -- Preparing for Disaster
    { -- Wildhammer Tour of Duty
        5481,
        faction.Alliance,
        5482,
    },
    { -- Dragonmaw Tour of Duty
        5482,
        faction.Horde,
        5481,
    },
    {5483}, -- Bounce
    { -- Tol Barad All-Star
        5486,
        {
            IsPvP = true,
        },
    },
    { -- Tol Barad Saboteur
        5487,
        {
            IsPvP = true,
        },
    },
    { -- Towers of Power
        5488,
        {
            IsPvP = true,
        },
    },
    { -- Master of Tol Barad
        5489,
        faction.Alliance,
        5490,
        true,
    },
    { -- Master of Tol Barad
        5490,
        faction.Horde,
        5489,
        true,
    },
    { -- Fading into Twilight
        5501,
        faction.Horde,
        4873,
    },
    {5503}, -- Pardon Denied
    {5504}, -- To the Ground!
    {5505}, -- Bullet Time
    { -- Defender of a Shattered World
        5506,
        {
            RewardType = rewardType.Title,
        },
    },
    {5511}, -- It's Always in the Last Place You Look
    {5518}, -- Stood in the Fire
    { -- Veteran of the Shifting Sands
        5533,
        {
            {"Never"},
        },
    },
    { -- 50,000 Conquest Points
        5539,
        {
            IsPvP = true,
            {"From", "PvP Season", 9, "Until", "PvP Season", 18},
        },
    },
    { -- 25,000 Conquest Points
        5540,
        {
            IsPvP = true,
            {"From", "PvP Season", 9, "Until", "PvP Season", 18},
        },
    },
    { -- 5000 Conquest Points
        5541,
        {
            IsPvP = true,
            {"From", "PvP Season", 9, "Until", "PvP Season", 18},
        },
    },
    { -- 1000 Conquest Points
        5542,
        {
            IsPvP = true,
            {"From", "PvP Season", 9, "Until", "PvP Season", 18},
        },
    },
    {5546}, -- Glutton for Icy Punishment
    {5547}, -- Glutton for Shadowy Punishment
    {5548}, -- To All the Squirrels Who Cared for Me
    { -- Double Jeopardy
        5552,
        faction.Horde,
        5231,
        true,
    },
};

KrowiAF.AchievementData["04_00_06"] = {
    {KrowiAF.SetAchievementPatch, 4, 0, 6},
    { -- Just Another Day in Tol Barad
        5718,
        faction.Alliance,
        5719,
    },
    { -- Just Another Day in Tol Barad
        5719,
        faction.Horde,
        5718,
    },
    {5723}, -- 50 Exalted Reputations
};

KrowiAF.AchievementData["04_01_00"] = {
    {KrowiAF.SetAchievementPatch, 4, 1, 0},
    {5743}, -- It's Not Easy Being Green
    {5744}, -- Gurubashi Headhunter
    {5749}, -- Vial of the Sands
    {5750}, -- Tunnel Vision
    {5751}, -- 2500 Daily Quests Complete
    {5752}, -- Justly Rewarded
    {5753}, -- Cataclysmically Delicious
    {5754}, -- Drown Your Sorrows
    {5755}, -- Thirty Tabards
    {5759}, -- Spirit Twister
    {5760}, -- Ring Out!
    {5761}, -- Hex Mix
    {5762}, -- Ohganot So Fast!
    {5765}, -- Here, Kitty Kitty...
    { -- Scourer of the Eternal Sands
        5767,
        {
            RewardType = rewardType.Title,
        },
    },
    {5768}, -- Heroic: Zul'Gurub
    {5769}, -- Heroic: Zul'Aman
    {5779}, -- You'll Feel Right as Rain
    { -- Agent of the Shen'dralar
        5788,
        {
            {"Never"},
        },
    },
};

KrowiAF.AchievementData["04_02_00"] = {
    {KrowiAF.SetAchievementPatch, 4, 2, 0},
    {5794}, -- Time Flies When You're Having Fun
    {5799}, -- Only the Penitent...
    {5802}, -- Firelands
    { -- Heroic: Ragnaros
        5803,
        {
            RewardType = rewardType.Title,
        },
    },
    {5804}, -- Heroic: Majordomo Fandral Staghelm
    {5805}, -- Heroic: Baleroc
    {5806}, -- Heroic: Shannox
    {5807}, -- Heroic: Beth'tilac
    {5808}, -- Heroic: Lord Rhyolith
    {5809}, -- Heroic: Alysrazor
    {5810}, -- Not an Ambi-Turner
    {5813}, -- Do a Barrel Roll!
    {5821}, -- Death from Above
    { -- Veteran of the Alliance II
        5823,
        faction.Alliance,
        5824,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Veteran of the Horde II
        5824,
        faction.Horde,
        5823,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
        },
    },
    { -- Avengers of Hyjal
        5827,
        {
            RewardType = rewardType.Title,
        },
    },
	{ -- Glory of the Firelands Raider
		5828,
		{
			RewardType = rewardType.Mount,
		},
	},
    {5829}, -- Bucket List
    {5830}, -- Share the Pain
    { -- Tricks and Treats of Northrend
        5835,
        faction.Horde,
        5836,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Northrend
        5836,
        faction.Alliance,
        5835,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of the Cataclysm
        5837,
        faction.Alliance,
        5838,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of the Cataclysm
        5838,
        faction.Horde,
        5837,
        {
            {"Event", 324},
        },
    },
    {5839}, -- Dragonwrath, Tarecgosa's Rest
    { -- Let's Do Lunch: Ironforge
        5841,
        faction.Alliance,
        5843,
    },
    { -- Let's Do Lunch: Darnassus
        5842,
        faction.Alliance,
        5844,
    },
    { -- Let's Do Lunch: Thunder Bluff
        5843,
        faction.Horde,
        5841,
    },
    { -- Let's Do Lunch: Undercity
        5844,
        faction.Horde,
        5842,
    },
    { -- A Bunch of Lunch
        5845,
        faction.Alliance,
        5846,
    },
    { -- A Bunch of Lunch
        5846,
        faction.Horde,
        5845,
    },
    { -- Fish or Cut Bait: Ironforge
        5847,
        faction.Alliance,
        5849,
    },
    { -- Fish or Cut Bait: Darnassus
        5848,
        faction.Alliance,
        5850,
    },
    { -- Fish or Cut Bait: Thunder Bluff
        5849,
        faction.Horde,
        5847,
    },
    { -- Fish or Cut Bait: Undercity
        5850,
        faction.Horde,
        5848,
    },
    { -- Gone Fishin'
        5851,
        faction.Alliance,
        5852,
    },
    { -- Gone Fishin'
        5852,
        faction.Horde,
        5851,
    },
    {5855}, -- Ragnar-O's
    {5858}, -- Bear-ly Made It
    {5859}, -- Legacy of Leyara
    {5860}, -- The 'Unbeatable?' Pterodactyl: BEATEN.
    {5861}, -- The Fiery Lords of Sethria's Roost
    {5862}, -- Ludicrous Speed
    { -- WoW's 7th Anniversary
        5863,
        {
            {"Never"},
        },
    },
    {5864}, -- Gang War
    {5865}, -- Have... Have We Met?
	{ -- The Molten Front Offensive
		5866,
		{
			RewardType = rewardType.Mount,
		},
	},
    {5867}, -- Flawless Victory
    {5868}, -- And the Meek Shall Inherit Kalimdor
    {5869}, -- Infernal Ambassadors
    {5870}, -- Fireside Chat
    {5871}, -- Master of the Molten Flow
    {5872}, -- King of the Spider-Hill
    {5873}, -- Ready for Raiding II
    {5874}, -- Death From Above
    {5875}, -- Littlest Pet Shop
    {5876}, -- Petting Zoo
    {5877}, -- Menagerie
    { -- Veteran of the Molten Front
        5879,
        {
            RewardType = rewardType.Title,
        },
    },
};

KrowiAF.AchievementData["04_02_02"] = {
    {KrowiAF.SetAchievementPatch, 4, 2, 2},
    {6045}, -- Occu'thar
};

KrowiAF.AchievementData["04_03_00"] = {
    {KrowiAF.SetAchievementPatch, 4, 3, 0},
    { -- A-Caroling We Will Go
        5853,
        faction.Alliance,
        5854,
        {
            {"Event", 141},
        },
    },
    { -- A-Caroling We Will Go
        5854,
        faction.Horde,
        5853,
        {
            {"Event", 141},
        },
    },
    {5995}, -- Moon Guard
    { -- Vicious Gladiator
        6002,
        {
            IsPvP = true,
            {"PvP Season", 9},
        },
    },
    { -- Vicious Gladiator's Twilight Drake
        6003,
        {
            IsPvP = true,
            {"PvP Season", 9},
        },
    },
    { -- Elders of Cataclysm
        6006,
        {
            {"Event", 327},
        },
    },
    { -- Extinguishing Northrend
        6007,
        faction.Alliance,
        6010,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Northrend
        6008,
        faction.Alliance,
        6009,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Northrend
        6009,
        faction.Horde,
        6008,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Northrend
        6010,
        faction.Horde,
        6007,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Cataclysm
        6011,
        faction.Alliance,
        6012,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Cataclysm
        6012,
        faction.Horde,
        6011,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing the Cataclysm
        6013,
        faction.Alliance,
        6014,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing the Cataclysm
        6014,
        faction.Horde,
        6013,
        {
            {"Event", 341},
        },
    },
    { -- Come One, Come All!
        6019,
        {
            {"Event", 374},
        },
    },
    { -- Step Right Up
        6020,
        {
            {"Event", 374},
        },
    },
    { -- Blastenheimer Bullseye
        6021,
        {
            {"Event", 374},
        },
    },
    { -- Quick Shot
        6022,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Duelist
        6023,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Dominator
        6024,
        {
            {"Event", 374},
        },
    },
    { -- I Was Promised a Pony
        6025,
        {
            {"Event", 374},
        },
    },
    { -- Fairegoer's Feast
        6026,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Dungeoneer
        6027,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Defender
        6028,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Despoiler
        6029,
        {
            {"Event", 374},
        },
    },
    { -- Taking the Show on the Road
        6030,
        faction.Alliance,
        6031,
        {
            {"Event", 374},
        },
    },
    { -- Taking the Show on the Road
        6031,
        faction.Horde,
        6030,
        {
            {"Event", 374},
        },
    },
    { -- Faire Favors
        6032,
        {
            {"Event", 374},
        },
    },
    {6059}, -- Red Rider Air Rifle
    {6060}, -- MiniZep Controller
    {6061}, -- Gaudy Winter Veil Sweater
    {6070}, -- That's Not Canon!
    {6084}, -- Minutes to Midnight
    {6105}, -- Deck Defender
    {6106}, -- Siege of Wyrmrest Temple
    {6107}, -- Fall of Deathwing
    {6108}, -- Alizabal
    {6109}, -- Heroic: Morchok
    {6110}, -- Heroic: Warlord Zon'ozz
    {6111}, -- Heroic: Yor'sahj the Unsleeping
    {6112}, -- Heroic: Hagara the Stormbinder
    {6113}, -- Heroic: Ultraxion
    {6114}, -- Heroic: Warmaster Blackhorn
    {6115}, -- Heroic: Spine of Deathwing
    { -- Heroic: Madness of Deathwing
        6116,
        {
            RewardType = rewardType.Title,
        },
    },
    {6117}, -- Heroic: End Time
    {6118}, -- Heroic: Well of Eternity
    {6119}, -- Heroic: Hour of Twilight
    { -- Ruthless Gladiator
        6124,
        {
            IsPvP = true,
            {"PvP Season", 10},
        },
    },
    {6127}, -- Lazy Eye
    {6128}, -- Ping Pong Champion
    {6129}, -- Taste the Rainbow!
    {6130}, -- Severed Ties
    { -- WoW's 8th Anniversary
        6131,
        {
            {"Never"},
        },
    },
    {6132}, -- Eclipse
    {6133}, -- Maybe He'll Get Dizzy...
	{ -- Glory of the Dragon Soul Raider
		6169,
		{
			RewardType = rewardType.Mount,
		},
	},
    {6174}, -- Don't Stand So Close to Me
    {6175}, -- Holding Hands
    { -- Destroyer's End
        6177,
        {
            RewardType = rewardType.Title,
        },
    },
    {6180}, -- Chromatic Champion
    {6181}, -- Fangs of the Father
    { -- Murkablo
        6185,
        {
            {"Never"},
        },
    },
};

KrowiAF.AchievementData["04_03_02"] = {
    {KrowiAF.SetAchievementPatch, 4, 3, 2},
    { -- Hero of the Alliance: Ruthless
        6316,
        faction.Alliance,
        6317,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 10},
        },
    },
    { -- Hero of the Horde: Ruthless
        6317,
        faction.Horde,
        6316,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 10},
        },
    },
    { -- Ruthless Gladiator's Twilight Drake
        6322,
        {
            IsPvP = true,
            {"PvP Season", 10},
        },
    },
};

KrowiAF.AchievementData["04_04_00"] = {
    {KrowiAF.SetAchievementPatch, 4, 4, 0},
    { -- Ruthless Gladiator's Twilight Drake
        6321,
        {
            IsPvP = true,
            {"PvP Season", 10},
        },
    },
};

KrowiAF.AchievementData["04_04_01"] = {
    {KrowiAF.SetAchievementPatch, 4, 4, 1},
    {41139}, -- Protocol Inferno: Blackrock Caverns
    {41140}, -- Protocol Inferno: Throne of the Tides
    {41141}, -- Protocol Inferno: The Stonecore
    {41142}, -- Protocol Inferno: The Vortex Pinnacle
    {41143}, -- Protocol Inferno: Grim Batol
    {41144}, -- Protocol Inferno: Halls of Origination
    {41145}, -- Protocol Inferno: Lost City of the Tol'vir
    {41146}, -- Protocol Inferno: Deadmines
    {41147}, -- Protocol Inferno: Shadowfang Keep
    {41148}, -- Protocol Inferno: Terminated
};