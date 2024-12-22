local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["05_00_04"] = {
    {KrowiAF.SetAchievementPatch, 5, 0, 4},
    {6089}, -- Keep Rollin' Rollin' Rollin'
    { -- Level 90 (Legacy)
        6193,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Upjade Complete
        6300,
        faction.Alliance,
        6534,
    },
    {6301}, -- Rally the Valley
    { -- That Rabbit's Dynamite!
        6332,
        {
            {"Event", 374},
        },
    },
    { -- Mystically Superior
        6348,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Mystically Epic
        6349,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {6350}, -- To All the Squirrels I Once Caressed?
    {6351}, -- Explore Jade Forest
    {6365}, -- Zen Master Cook
    {6366}, -- Shado-Pan
    { -- Challenge Conqueror: Bronze
        6374,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Conqueror: Silver
        6375,
        {
            RewardType = rewardType.Mount,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Conqueror: Gold
        6378,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {6394}, -- Rattle No More
    {6396}, -- Sanguinarian
    {6400}, -- How Did He Get Up There?
    {6402}, -- Ling-Ting's Herbal Journey
    {6420}, -- Hopocalypse Now!
    {6427}, -- Mosh Pit
    { -- Realm First! Challenge Conqueror: Gold
        6433,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {6455}, -- Show Me Your Moves!
    {6456}, -- Heroic: Stormstout Brewery
    {6457}, -- Stormstout Brewery
    {6458}, -- Guardians of Mogu'shan
    {6460}, -- Hydrophobia
    {6462}, -- Master Pet Battler
    {6469}, -- Shado-Pan Monastery
    {6470}, -- Heroic: Shado-Pan Monastery
    {6471}, -- Hate Leads to Suffering
    {6472}, -- The Obvious Solution
    {6475}, -- Cleaning Up
    {6476}, -- Conscriptinator
    {6477}, -- Respect
    {6478}, -- Glintrok N' Roll
    {6479}, -- Bomberman
    {6480}, -- Settle Down, Bro
    {6485}, -- Return to Sender
    {6517}, -- Extinction Event
    {6518}, -- I Heard You Like Amber...
    { -- Realm First! Level 90 Shaman (Legacy)
        6523,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 (Legacy)
        6524,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {6531}, -- Attention to Detail
    { -- Upjade Complete
        6534,
        faction.Horde,
        6300,
    },
    { -- Mighty Roamin' Krasaranger
        6535,
        faction.Alliance,
        6536,
    },
    { -- Mighty Roamin' Krasaranger
        6536,
        faction.Horde,
        6535,
    },
    { -- Slum It in the Summit
        6537,
        faction.Alliance,
        6538,
    },
    { -- Slum It in the Summit
        6538,
        faction.Horde,
        6537,
    },
    {6539}, -- One Steppe Forward, Two Steppes Back
    {6540}, -- Dread Haste Makes Dread Waste
    {6541}, -- Loremaster of Pandaria
    {6543}, -- The August Celestials
    {6544}, -- The Tillers
    {6545}, -- Klaxxi
    {6546}, -- The Golden Lotus
    {6547}, -- The Anglers
    {6548}, -- The Lorewalkers
    {6550}, -- Order of the Cloud Serpent
    {6551}, -- Friend on the Farm
    {6552}, -- Friends on the Farm
    {6553}, -- Like an Arrow to the Face
    {6554}, -- He's Mine!
    {6555}, -- Building a Team
    {6556}, -- Going to Need More Traps
    {6557}, -- Master Pet Hunter
    {6558}, -- Local Pet Mauler
    {6559}, -- Traveling Pet Mauler
    {6560}, -- World Pet Mauler
    {6566}, -- Just a Pup
    {6567}, -- Growing Up
    {6568}, -- Time for a Leash
    {6569}, -- Old Timer
    {6570}, -- All Growns Up!
    {6571}, -- That Was Close!
    {6578}, -- Pro Pet Group
    {6579}, -- Rookie Pet Group
    {6580}, -- Rookie Pet Crew
    {6581}, -- Pro Pet Crew
    {6582}, -- Pro Pet Mob
    {6583}, -- Rookie Pet Mob
    {6584}, -- Big City Pet Brawlin' - Alliance
    {6585}, -- Kalimdor Safari
    {6586}, -- Eastern Kingdoms Safari
    {6587}, -- Outland Safari
    {6588}, -- Northrend Safari
    {6589}, -- Pandaria Safari
    { -- World Safari
        6590,
        {
            RewardType = rewardType.Title,
        },
    },
    {6591}, -- Grand Master Pet Battler
    {6592}, -- Legendary Pet Battler
    {6593}, -- Experienced Pet Battler
    {6594}, -- Cat Fight!
    { -- Pet Brawler
        6595,
        {
            IsPvP = true,
        },
    },
    { -- Experienced Pet Brawler
        6596,
        {
            IsPvP = true,
        },
    },
    { -- Master Pet Brawler
        6597,
        {
            IsPvP = true,
        },
    },
    { -- Grand Master Pet Brawler
        6598,
        {
            IsPvP = true,
        },
    },
    { -- Legendary Pet Brawler
        6599,
        {
            IsPvP = true,
        },
    },
    {6600}, -- Ultimate Trainer
    {6601}, -- Taming the Wild
    { -- Taming Kalimdor
        6602,
        faction.Horde,
        6603,
    },
    { -- Taming Eastern Kingdoms
        6603,
        faction.Alliance,
        6602,
    },
    {6604}, -- Taming Outland
    {6605}, -- Taming Northrend
    {6606}, -- Taming Pandaria
    { -- Taming Azeroth
        6607,
        {
            RewardType = rewardType.Title,
        },
    },
    {6608}, -- Family Reunion
    {6609}, -- No Favorites
    {6610}, -- All Pets Allowed
    {6611}, -- Continental Tamer
    {6612}, -- Kalimdor Tamer
    {6613}, -- Eastern Kingdoms Tamer
    {6614}, -- Outland Tamer
    {6615}, -- Northrend Tamer
    {6616}, -- Pandaria Tamer
    {6618}, -- On A Roll
    {6619}, -- Win Streak
    { -- No Time To Heal
        6620,
        {
            IsPvP = true,
        },
    },
    {6621}, -- Big City Pet Brawlin' - Horde
    {6622}, -- Big City Pet Brawler
    {6671}, -- Seeds of Doubt
    {6674}, -- Anything You Can Do, I Can Do Better...
    {6683}, -- Less Than Three
    {6684}, -- Humane Society
    {6686}, -- Straight Six
    {6687}, -- Getting Hot In Here
    {6688}, -- Where's My Air Support?
    {6689}, -- Terrace of Endless Spring
    {6713}, -- Quarrelsome Quilen Quintet
    {6715}, -- Polyformic Acid Science
    {6716}, -- Between a Saurok and a Hard Place
    {6717}, -- Power Overwhelming
    {6718}, -- The Dread Approach
    {6719}, -- Heroic: Stone Guard
    {6720}, -- Heroic: Feng the Accursed
    {6721}, -- Heroic: Gara'jal the Spiritbinder
    {6722}, -- Heroic: Four Kings
    {6723}, -- Heroic: Elegon
	{ -- Heroic: Will of the Emperor
		6724,
		{
			RewardType = rewardType.Title,
		},
	},
    {6725}, -- Heroic: Imperial Vizier Zor'lok
    {6726}, -- Heroic: Blade Lord Ta'yak
    {6727}, -- Heroic: Garalon
    {6728}, -- Heroic: Wind Lord Mel'jarak
    {6729}, -- Heroic: Amber-Shaper Un'sok
    {6730}, -- Heroic: Grand Empress Shek'zeer
    {6731}, -- Heroic: Protectors of the Endless
    {6732}, -- Heroic: Tsulong
    {6733}, -- Heroic: Lei Shi
	{ -- Heroic: Sha of Fear
		6734,
		{
			RewardType = rewardType.Title,
		},
	},
    {6736}, -- What Does This Button Do?
    { -- Silvershard Mines Victory
        6739,
        {
            IsPvP = true,
        },
    },
    { -- Temple of Kotmogu Victory
        6740,
        {
            IsPvP = true,
        },
    },
    { -- Cataclysmic Gladiator's Twilight Drake
        6741,
        {
            IsPvP = true,
            {"PvP Season", 11},
        },
    },
	{ -- 60 Exalted Reputations
		6742,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Realm First! Level 90 Druid (Legacy)
        6743,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Paladin (Legacy)
        6744,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Priest (Legacy)
        6745,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Warlock (Legacy)
        6746,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Hunter (Legacy)
        6747,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Death Knight (Legacy)
        6748,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Mage (Legacy)
        6749,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Warrior (Legacy)
        6750,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Rogue (Legacy)
        6751,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Level 90 Monk (Legacy)
        6752,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {6753}, -- Got My Mind On My Money
    {6754}, -- The Dark Heart of the Mogu
    {6755}, -- Mogu'shan Palace
    {6756}, -- Heroic: Mogu'shan Palace
    {6757}, -- Temple of the Jade Serpent
    {6758}, -- Heroic: Temple of the Jade Serpent
    {6759}, -- Heroic: Gate of the Setting Sun
    {6760}, -- Heroic: Scarlet Halls
    {6761}, -- Heroic: Scarlet Monastery
    {6762}, -- Heroic: Scholomance
    {6763}, -- Heroic: Siege of Niuzao Temple
    {6821}, -- School's Out Forever
    {6822}, -- Run with the Wind
    {6823}, -- Must Love Dogs
    {6824}, -- Face Clutchers
    {6825}, -- The Mind-Killer
    {6826}, -- 55 Exalted Reputations
    { -- Pandaren Ambassador
        6827,
        faction.Horde,
        6828,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Pandaren Ambassador
        6828,
        faction.Alliance,
        6827,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Realm First! Pandaren Ambassador
        6829,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {6830}, -- Professional Zen Master
    {6835}, -- Working For a Living
    { -- Serious Skills to Pay the Bills
        6836,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {6837}, -- Zen Master Archaeologist
    { -- Zen Master Medic
        6838,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {6839}, -- Zen Master Fisherman
    {6844}, -- The Vault of Mysteries
    {6845}, -- Nightmare of Shek'zeer
    {6846}, -- Fish Tales
    {6847}, -- The Song of the Yaungol
    {6848}, -- Collector's Edition: Lucky Quilen Cub
    {6849}, -- Collector's Edition: Imperial Quilen
    {6850}, -- Hozen in the Mist
    {6851}, -- Take 'Em All On!
    {6855}, -- The Seven Burdens of Shaohao
    {6856}, -- Ballad of Liu Lang
    {6857}, -- Heart of the Mantid Swarm
    {6858}, -- What Is Worth Fighting For
    { -- Realm First! Zen Master Alchemist
        6859,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Blacksmith
        6860,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Cook
        6861,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Enchanter
        6862,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Engineer
        6863,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Medic
        6864,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Angler
        6865,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Herbalist
        6866,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Scribe
        6867,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Jewelcrafter
        6868,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Leatherworker
        6869,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Miner
        6870,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Skinner
        6871,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Tailor
        6872,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Realm First! Zen Master Archaeologist
        6873,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Scenaturday
        6874,
        faction.Alliance,
        7509,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Temple of Kotmogu Veteran
        6882,
        {
            IsPvP = true,
        },
    },
    { -- Silvershard Mines Veteran
        6883,
        {
            IsPvP = true,
        },
    },
    { -- Temple of the Jade Serpent Challenger
        6884,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Temple of the Jade Serpent: Bronze
        6885,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Temple of the Jade Serpent: Silver
        6886,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Temple of the Jade Serpent: Gold
        6887,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Stormstout Brewery Challenger
        6888,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Stormstout Brewery: Bronze
        6889,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Stormstout Brewery: Silver
        6890,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Stormstout Brewery: Gold
        6891,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Mogu'shan Palace Challenger
        6892,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Shado-Pan Monastery Challenger
        6893,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Gate of the Setting Sun Challenger
        6894,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Halls Challenger
        6895,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Monastery Challenger
        6896,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scholomance Challenger
        6897,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Siege of Niuzao Temple Challenger
        6898,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Mogu'shan Palace: Bronze
        6899,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Mogu'shan Palace: Silver
        6900,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Mogu'shan Palace: Gold
        6901,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Shado-Pan Monastery: Bronze
        6902,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Shado-Pan Monastery: Silver
        6903,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Shado-Pan Monastery: Gold
        6904,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Gate of the Setting Sun: Bronze
        6905,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Gate of the Setting Sun: Silver
        6906,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Gate of the Setting Sun: Gold
        6907,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Halls: Bronze
        6908,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Halls: Silver
        6909,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Halls: Gold
        6910,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Monastery: Bronze
        6911,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Monastery: Silver
        6912,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scarlet Monastery: Gold
        6913,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scholomance: Bronze
        6914,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scholomance: Silver
        6915,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Scholomance: Gold
        6916,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Siege of Niuzao Temple: Bronze
        6917,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Siege of Niuzao Temple: Silver
        6918,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Siege of Niuzao Temple: Gold
        6919,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Conqueror
        6920,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {6922}, -- Timing is Everything
    {6923}, -- Brewmoon Festival
    { -- 100,000 Valor Points
        6924,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {6925}, -- Pandaria Dungeon Hero
	{ -- Tranquil Master
		6926,
		{
			RewardType = rewardType.Title,
		},
	},
	{ -- Glory of the Pandaria Hero
		6927,
		{
			RewardType = rewardType.Mount,
		},
	},
    {6928}, -- Burning Man
    {6929}, -- And Stay Dead!
    {6930}, -- Yaungolian Barbecue
    {6931}, -- Binan Village All-Star
	{ -- Glory of the Pandaria Raider
		6932,
		{
			RewardType = rewardType.Mount,
		},
	},
    {6933}, -- Who's Got Two Green Thumbs?
    {6936}, -- Candle in the Wind
    {6937}, -- Overzealous
    { -- Cataclysmic Gladiator
        6938,
        {
            IsPvP = true,
            {"PvP Season", 11},
        },
    },
    { -- Hero of the Alliance: Cataclysmic
        6939,
        faction.Alliance,
        6940,
        {
            IsPvP = true,
            {"PvP Season", 11},
        },
    },
    { -- Hero of the Horde: Cataclysmic
        6940,
        faction.Horde,
        6939,
        {
            IsPvP = true,
            {"PvP Season", 11},
        },
    },
    { -- Hero of the Horde
        6941,
        faction.Horde,
        6942,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance
        6942,
        faction.Alliance,
        6941,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    {6943}, -- Queuing Spree
    {6945}, -- Mantid Swarm
    {6946}, -- Empowered Spiritualist
    { -- Four Square
        6947,
        {
            IsPvP = true,
        },
    },
    { -- Powerball
        6950,
        {
            IsPvP = true,
        },
    },
    {6969}, -- Explore Valley of the Four Winds
    { -- Blackout
        6970,
        {
            IsPvP = true,
        },
    },
    { -- I've Got the Power
        6971,
        {
            IsPvP = true,
        },
    },
    { -- What is Best in Life?
        6972,
        {
            IsPvP = true,
        },
    },
    { -- Can't Stop Won't Stop
        6973,
        {
            IsPvP = true,
        },
    },
    {6974}, -- Pandaria Explorer
    {6975}, -- Explore Krasarang Wilds
    {6976}, -- Explore Kun-Lai Summit
    {6977}, -- Explore Townlong Steppes
    {6978}, -- Explore Dread Wastes
    {6979}, -- Explore Vale of Eternal Blossoms
    { -- Temple of Kotmogu All-Star
        6980,
        {
            IsPvP = true,
        },
    },
    { -- Master of Temple of Kotmogu
        6981,
        {
            IsPvP = true,
        },
    },
    { -- The Long Riders
        7039,
        {
            IsPvP = true,
        },
    },
    { -- Mine Cart Courier
        7049,
        {
            IsPvP = true,
        },
    },
    {7056}, -- Sorry, Were You Looking for This?
    { -- End of the Line
        7057,
        {
            IsPvP = true,
        },
    },
    { -- Mine Mine Mine!
        7062,
        {
            IsPvP = true,
        },
    },
    { -- Five for Five
        7099,
        {
            IsPvP = true,
        },
    },
    { -- My Diamonds and Your Rust
        7100,
        {
            IsPvP = true,
        },
    },
    { -- Escort Service
        7102,
        {
            IsPvP = true,
        },
    },
    { -- Greed is Good
        7103,
        {
            IsPvP = true,
        },
    },
    { -- Master of Silvershard Mines
        7106,
        {
            IsPvP = true,
        },
    },
    {7230}, -- Legend of the Brewfathers
    {7231}, -- Spill No Evil
    {7232}, -- The Keg Runner
    {7239}, -- Monkey in the Middle
    {7248}, -- Monkey See, Monkey Kill
    {7249}, -- Unga Ingoo
    {7252}, -- A Brewing Storm
    {7257}, -- Don't Shake the Keg
    {7258}, -- Party of Six
    {7261}, -- The Perfect Pour
    {7265}, -- Greenstone Village
    {7266}, -- Save it for Later
    {7267}, -- Perfect Delivery
    {7271}, -- Arena of Annihilation
    {7272}, -- In the Eye of the Tiger
    {7273}, -- Beat the Heat
    {7274}, -- Learning from the Best
    {7275}, -- It's a Trap!
    {7276}, -- Fancy Footwork
    {7281}, -- Lost and Found
    {7282}, -- Finders Keepers
    {7283}, -- One Man's Trash...
	{ -- Is Another Man's Treasure
		7284,
		{
			RewardType = rewardType.Title,
		},
	},
    {7285}, -- Every Day I'm Pand-a-ren
    {7286}, -- Finish Them!
    {7287}, -- Champion of Chi-Ji
    {7288}, -- Yak Attack
    {7289}, -- Shadow Hopper
    {7290}, -- How To Strain Your Dragon
    {7291}, -- In a Trail of Smoke
    {7292}, -- Green Acres
    {7293}, -- Till the Break of Dawn
    {7294}, -- A Taste of Things to Come
    {7295}, -- Listen to the Drunk Fish
    {7296}, -- Ain't Lost No More
    {7297}, -- Proven Strength
    {7298}, -- Getting Around with the Shado-Pan
    {7299}, -- Loner and a Rebel
    {7300}, -- Master of the Grill
    {7301}, -- Master of the Wok
    {7302}, -- Master of the Pot
    {7303}, -- Master of the Steamer
    {7304}, -- Master of the Oven
    {7305}, -- Master of the Brew
	{ -- Master of Pandaren Cooking
		7306,
		{
			RewardType = rewardType.Title,
		},
	},
    {7307}, -- Silent Assassin
    {7308}, -- Know Your Role
    {7309}, -- Fire in the Yaung-hole!
    {7310}, -- Defender of Gods
    {7312}, -- Amber is the Color of My Energy
    {7313}, -- Stay Klaxxi
    {7314}, -- Test Drive
    { -- Eternally in the Vale
        7315,
        {
            {"Before", "Version", {5, 4, 0}},
        },
    },
    {7316}, -- Over Their Heads
    {7317}, -- One Many Army
    {7318}, -- A Taste of History
    {7319}, -- Ready for Raiding III
    {7320}, -- Dog Pile
    {7321}, -- Spreading the Warmth
    {7322}, -- Roll Club
    {7323}, -- Collateral Damage
    {7324}, -- One Step at a Time
    {7325}, -- Now I Am the Master
    {7326}, -- The Pandaren Gourmet
    {7327}, -- The Pandaren Gourmet
    {7328}, -- Ironpaw Chef
    {7329}, -- Pandaren Cuisine
    {7330}, -- Pandaren Delicacies
    {7331}, -- The Three Brew Fathers
    {7332}, -- The Broken Hearted
    {7333}, -- The Four Celestials
    {7334}, -- Instruments of Cruelty
    {7335}, -- Symbols of Strength
    {7336}, -- Stone Servants
    {7337}, -- Documents of a Dark History
    {7338}, -- Collector: Pandaren Tea Sets
    {7339}, -- Collector: Pandaren Game Boards
    {7340}, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    {7341}, -- Collector: Walking Canes of Brewfather Ren Yun
    {7342}, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    {7343}, -- Collector: Carved Bronze Mirrors
    {7344}, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    {7345}, -- Collector: Apothecary Tins
    {7346}, -- Collector: Pearls of Yu'lon
    {7347}, -- Collector: Standards of Niuzao
    {7348}, -- Collector: Manacles of Rebellion
    {7349}, -- Collector: Cracked Mogu Runestones
    {7350}, -- Collector: Terracotta Arms
    {7351}, -- Collector: Petrified Bone Whips
    {7352}, -- Collector: Thunder King Insignias
    {7353}, -- Collector: Edicts of the Thunder King
    {7354}, -- Collector: Iron Amulets
    {7355}, -- Collector: Warlord's Branding Irons
    {7356}, -- Collector: Mogu Coins
    {7357}, -- Collector: Worn Monument Ledgers
    {7358}, -- Collector: Pandaren Tea Sets
    {7359}, -- Collector: Pandaren Game Boards
    {7360}, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    {7361}, -- Collector: Walking Canes of Brewfather Ren Yun
    {7362}, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    {7363}, -- Collector: Carved Bronze Mirrors
    {7364}, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    {7365}, -- Collector: Apothecary Tins
    {7366}, -- Collector: Pearls of Yu'lon
    {7367}, -- Collector: Standards of Niuzao
    {7368}, -- Collector: Manacles of Rebellion
    {7369}, -- Collector: Cracked Mogu Runestones
    {7370}, -- Collector: Terracotta Arms
    {7371}, -- Collector: Petrified Bone Whips
    {7372}, -- Collector: Thunder King Insignias
    {7373}, -- Collector: Edicts of the Thunder King
    {7374}, -- Collector: Iron Amulets
    {7375}, -- Collector: Warlord's Branding Irons
    {7376}, -- Collector: Mogu Coins
    {7377}, -- Collector: Worn Monument Ledgers
    {7378}, -- Jack of All Trades
    {7379}, -- Pandaren Master of All
    {7380}, -- Double Agent
    {7381}, -- Restore Balance
    {7382}, -- Dynamic Duo
    {7383}, -- Terrific Trio
    {7384}, -- Quintessential Quintet
    {7385}, -- Pub Crawl
    {7386}, -- Grand Expedition Yak
    {7410}, -- 5000 Daily Quests Completed
    {7411}, -- 10000 Daily Quests Completed
    {7412}, -- Collector's Edition: Fetish Shaman
    {7413}, -- Scarlet Halls
    {7433}, -- Newbie
    {7436}, -- Zen Pet Hunter
    {7437}, -- A Worthy Opponent
    {7438}, -- Could We Find More Like That?
    {7439}, -- Glorious!
    {7462}, -- A Rare Catch
    {7463}, -- Lots of Rarity
    {7464}, -- Quality & Quantity
    {7465}, -- An Uncommon Find
    { -- Theramore's Fall
        7467,
        faction.Alliance,
        7468,
        {
            {"Never"},
        },
    },
    { -- Theramore's Fall
        7468,
        faction.Horde,
        7467,
        {
            {"Never"},
        },
    },
	{ -- The Shado-Master
		7479,
		{
			RewardType = rewardType.Title,
		},
	},
    {7482}, -- Trainer Extraordinaire
    {7483}, -- Battle Master
    { -- Cutting Edge: Will of the Emperor
        7485,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    { -- Cutting Edge: Grand Empress Shek'zeer
        7486,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    { -- Cutting Edge: Sha of Fear
        7487,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    {7498}, -- Taming the Great Outdoors
    {7499}, -- Taming the World
    {7500}, -- Going to Need More Leashes
    {7501}, -- That's a Lot of Pet Food
    {7502}, -- Savior of Stoneplow
    { -- Scenaturday
        7509,
        faction.Horde,
        6874,
        {
            RewardType = rewardType.Title,
        },
    },
    {7518}, -- Wanderers, Dreamers, and You
	{ -- The Loremaster
		7520,
		{
			RewardType = rewardType.Title,
		},
	},
    {7521}, -- Time to Open a Pet Store
    {7522}, -- Crypt of Forgotten Kings
    { -- Theramore's Fall
        7523,
        faction.Alliance,
        7524,
    },
    { -- Theramore's Fall
        7524,
        faction.Horde,
        7523,
    },
    {7525}, -- Taming Cataclysm
    { -- Kite Fight
        7526,
        faction.Alliance,
        7529,
    },
    { -- No Tank You
        7527,
        faction.Alliance,
        7530,
    },
    { -- Kite Fight
        7529,
        faction.Horde,
        7526,
    },
    { -- No Tank You
        7530,
        faction.Horde,
        7527,
    },
    { -- Chapter I: Trial of the Black Prince
        7533,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Chapter II: Wrathion's War
        7534,
        faction.Alliance,
        8008,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Chapter III: Two Princes
        7535,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Chapter IV: Celestial Blessings
        7536,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Tricks and Treats of Pandaria
        7601,
        faction.Alliance,
        7602,
        {
            {"Event", 324},
        },
    },
    { -- Tricks and Treats of Pandaria
        7602,
        faction.Horde,
        7601,
        {
            {"Event", 324},
        },
    },
    {7611}, -- Pandarian Angler
	{ -- The Seat of Knowledge
		7612,
		{
			RewardType = rewardType.Title,
		},
	},
    {7614}, -- Locking Down the Docks
    {7842}, -- Collector's Edition: Baneling
};

KrowiAF.AchievementData["05_01_00"] = {
    {KrowiAF.SetAchievementPatch, 5, 1, 0},
    {7852}, -- They're Both Footballs?
    { -- WoW's 9th Anniversary
        7853,
        {
            {},
        },
    },
    { -- We're Going to Need More Saddles
        7860,
        faction.Alliance,
        7862,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- We're Going to Need More Saddles
        7862,
        faction.Horde,
        7860,
        {
            RewardType = rewardType.Mount,
        },
    },
    {7908}, -- I Choose You
    { -- Operation: Shieldwall Campaign
        7928,
        faction.Alliance,
        7929,
    },
    { -- Dominance Offensive Campaign
        7929,
        faction.Horde,
        7928,
    },
    {7932}, -- I'm In Your Base, Killing Your Dudes
    {7933}, -- And... It's Good!
    {7934}, -- Raiding with Leashes
    {7936}, -- Pandaren Spirit Tamer
    { -- You Are Not Your $#*@! Legplates (Season 1)
        7937,
        faction.Alliance,
        8020,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 1)
        7939,
        faction.Horde,
        7940,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 1)
        7940,
        faction.Alliance,
        7939,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Brawlin' and Shot Callin' (Season 1)
        7941,
        faction.Alliance,
        7942,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Brawlin' and Shot Callin' (Season 1)
        7942,
        faction.Horde,
        7941,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- I'm Your Number One Fan (Season 2)
        7943,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Bottle Service (Season 2)
        7944,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Haters Gonna Hate (Season 2)
        7945,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Now You're Just Showing Off (Season 1)
        7946,
        faction.Alliance,
        8022,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- The First Rule of Brawler's Guild (Season 1 or 2)
        7947,
        faction.Alliance,
        7948,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- The First Rule of Brawler's Guild (Season 1 or 2)
        7948,
        faction.Horde,
        7947,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Rabble Rabble Rabble (Season 2)
        7949,
        faction.Alliance,
        7950,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Rabble Rabble Rabble (Season 2)
        7950,
        faction.Horde,
        7949,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    {7984}, -- Watery Grave
    {7986}, -- You Mean That Wasn't a Void Zone?
    {7987}, -- No Egg Left Behind
    {7988}, -- A Little Patience
    {7989}, -- Bubbletrapped!
    {7990}, -- Cannonballer
    {7991}, -- Which Came First?
    {7992}, -- I Used To Love Them
    {7993}, -- We've Been Dancin'
    {7994}, -- Treasure of Pandaria
    {7995}, -- Fortune of Pandaria
    {7996}, -- Bounty of Pandaria
    {7997}, -- Riches of Pandaria
    { -- Chapter II: Wrathion's War
        8008,
        faction.Horde,
        7534,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8009}, -- Dagger in the Dark
    { -- Lion's Landing
        8010,
        faction.Alliance,
        8013,
    },
    { -- Number Five Is Alive
        8011,
        faction.Alliance,
        8014,
    },
    { -- Waste Not, Want Not
        8012,
        faction.Alliance,
        8015,
    },
    { -- Domination Point
        8013,
        faction.Horde,
        8010,
    },
    { -- Number Five Is Alive
        8014,
        faction.Horde,
        8011,
    },
    { -- Waste Not, Want Not
        8015,
        faction.Horde,
        8012,
    },
    {8016}, -- Assault on Zan'vess
    {8017}, -- For the Swarm
    { -- You Are Not Your $#*@! Legplates (Season 1)
        8020,
        faction.Horde,
        7937,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Now You're Just Showing Off (Season 1)
        8022,
        faction.Horde,
        7946,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
	{ -- Wakener
		8023,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- A Test of Valor
        8030,
        faction.Alliance,
        8031,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- A Test of Valor
        8031,
        faction.Horde,
        8030,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
};

KrowiAF.AchievementData["05_02_00"] = {
    {KrowiAF.SetAchievementPatch, 5, 2, 0},
    { -- Ahead of the Curve: Will of the Emperor
        6954,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    {8028}, -- Praise the Sun!
    {8037}, -- Genetically Unmodified Organism
    {8038}, -- Cretaceous Collector
    { -- Extinguishing Pandaria
        8042,
        faction.Alliance,
        8043,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Pandaria
        8043,
        faction.Horde,
        8042,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Pandaria
        8044,
        faction.Horde,
        8045,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Pandaria
        8045,
        faction.Alliance,
        8044,
        {
            {"Event", 341},
        },
    },
    {8049}, -- The Zandalari Prophecy
    {8050}, -- Rumbles of Thunder
    {8051}, -- Gods and Monsters
    { -- Khan
        8052,
        faction.Alliance,
        8055,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Khan
        8055,
        faction.Horde,
        8052,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    {8056}, -- Heroic: Jin'rokh the Breaker
    {8057}, -- Heroic: Horridon
    {8058}, -- Heroic: Council of Elders
    {8059}, -- Heroic: Tortos
    {8060}, -- Heroic: Megaera
    {8061}, -- Heroic: Ji-Kun
    {8062}, -- Heroic: Durumu the Forgotten
    {8063}, -- Heroic: Primordius
    {8064}, -- Heroic: Dark Animus
    {8065}, -- Heroic: Iron Qon
    {8066}, -- Heroic: Twin Empyreans
	{ -- Heroic: Lei Shen
		8067,
		{
			RewardType = rewardType.Title,
		},
	},
    {8068}, -- Heroic: Ra-den
    {8069}, -- Last Stand of the Zandalari
    {8070}, -- Forgotten Depths
    {8071}, -- Halls of Flesh-Shaping
    {8072}, -- Pinnacle of Storms
    {8073}, -- Cage Match
    {8077}, -- One-Up
    {8078}, -- Zul'Again
    {8080}, -- Fabled Pandaren Tamer
    {8081}, -- Ritualist Who?
    {8082}, -- Head Case
    {8086}, -- From Dusk 'til Dawn
    {8087}, -- Can't Touch This
    { -- I Thought He Was Supposed to Be Hard?
        8089,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8090}, -- A Complete Circuit
    {8092}, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    { -- Tyrannical Conquest
        8093,
        faction.Horde,
        8218,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
    {8094}, -- Lightning Overload
    {8097}, -- Soft Hands
    {8098}, -- You Said Crossing the Streams Was Bad
    {8099}, -- Isle of Thunder
    {8100}, -- Pay to Slay
    {8101}, -- It Was Worth Every Ritual Stone
    {8103}, -- Champions of Lei Shen
    {8104}, -- Thunder Plunder
    {8105}, -- The Crumble Bundle
    {8106}, -- In the Hall of the Thunder King
    {8107}, -- Ready for RAAAAIIIIDDD?!?ing
    {8108}, -- When in Ihgaluk, Do as the Skumblade Do
    {8109}, -- The Mogu Below-gu
    {8110}, -- These Mogu Have Gotta Go-gu
    {8111}, -- This Isn't Even My Final Form
    {8112}, -- Blue Response
    {8114}, -- Platform Hero
    {8115}, -- Speed Metal
    {8116}, -- You Made Me Bleed My Own Blood
    {8117}, -- For the Ward!
    {8118}, -- Boop
    {8119}, -- Our Powers Combined
    {8120}, -- Direhorn in a China Shop
	{ -- Stormbreaker
		8121,
		{
			RewardType = rewardType.Title,
		},
	},
    {8123}, -- Millions of Years of Evolution vs. My Fist
	{ -- Glory of the Thundering Raider
		8124,
		{
			RewardType = rewardType.Mount,
		},
	},
    { -- Operation: Shieldwall
        8205,
        faction.Alliance,
        8206,
    },
    { -- Dominance Offensive
        8206,
        faction.Horde,
        8205,
    },
    { -- Kirin Tor Offensive
        8208,
        faction.Alliance,
        8209,
    },
    { -- Sunreaver Onslaught
        8209,
        faction.Horde,
        8208,
    },
    {8210}, -- Shado-Pan Assault
    {8212}, -- Zandalari Library Card
    { -- Friends In Places Higher Yet
        8213,
        {
            {"Before", "Date", {2019, 6, 11}},
        },
    },
    { -- Malevolent Gladiator
        8214,
        {
            IsPvP = true,
            {"PvP Season", 12},
        },
    },
    { -- Malevolent Gladiator's Cloud Serpent
        8216,
        {
            IsPvP = true,
            {"PvP Season", 12},
        },
    },
    { -- Tyrannical Conquest
        8218,
        faction.Alliance,
        8093,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
    {8219}, -- History of the Mantid
    {8220}, -- Collector: Banners of the Mantid Empire
    {8221}, -- Collector: Banners of the Mantid Empire
    {8222}, -- Collector: Ancient Sap Feeders
    {8223}, -- Collector: Ancient Sap Feeders
    {8224}, -- Collector: Praying Mantids
    {8225}, -- Collector: Praying Mantids
    {8226}, -- Collector: Inert Sound Beacons
    {8227}, -- Collector: Inert Sound Beacons
    {8228}, -- Collector: Remains of Paragons
    {8229}, -- Collector: Remains of Paragons
    {8230}, -- Collector: Mantid Lamps
    {8231}, -- Collector: Mantid Lamps
    {8232}, -- Collector: Pollen Collectors
    {8233}, -- Collector: Pollen Collectors
    {8234}, -- Collector: Kypari Sap Containers
    {8235}, -- Collector: Kypari Sap Containers
    { -- Cutting Edge: Lei Shen
        8238,
        {
            {"Before", "Version", {5, 4, 0}},
        },
    },
    { -- Hero of the Alliance: Malevolent
        8243,
        faction.Alliance,
        8244,
        {
            IsPvP = true,
            {"PvP Season", 12},
        },
    },
    { -- Hero of the Horde: Malevolent
        8244,
        faction.Horde,
        8243,
        {
            IsPvP = true,
            {"PvP Season", 12},
        },
    },
    { -- Ahead of the Curve: Grand Empress Shek'zeer
        8246,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    { -- Ahead of the Curve: Sha of Fear
        8248,
        {
            {"Before", "Version", {5, 2, 0}},
        },
    },
    { -- Ahead of the Curve: Lei Shen
        8249,
        {
            {"Before", "Version", {5, 4, 0}},
        },
    },
    { -- Cutting Edge: Ra-den
        8260,
        {
            {"Before", "Version", {5, 4, 0}},
        },
    },
};

KrowiAF.AchievementData["05_03_00"] = {
    {KrowiAF.SetAchievementPatch, 5, 3, 0},
    {8293}, -- Raiding with Leashes II: Attunement Edition
    {8294}, -- The Secrets of Ragefire
    {8295}, -- The Few, the Proud, the Gob Squad
    { -- Merciless Pet Brawler
        8297,
        {
            IsPvP = true,
        },
    },
    { -- Vengeful Pet Brawler
        8298,
        {
            IsPvP = true,
        },
    },
    { -- Brutal Pet Brawler
        8300,
        {
            IsPvP = true,
        },
    },
    { -- Deadly Pet Brawler
        8301,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Mount Parade
        8302,
        faction.Horde,
        8304,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Mount Parade
        8304,
        faction.Alliance,
        8302,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Hordebreaker
        8306,
        faction.Alliance,
        8307,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {5, 4, 0}},
        },
    },
    { -- Darkspear Revolutionary
        8307,
        faction.Horde,
        8306,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {5, 4, 0}},
        },
    },
    {8310}, -- Heroic: A Brewing Storm
    {8311}, -- Heroic: Crypt of Forgotten Kings
    {8312}, -- Heroic: Blood in the Snow
    { -- Battle on the High Seas
        8314,
        faction.Alliance,
        8315,
    },
    { -- Battle on the High Seas
        8315,
        faction.Horde,
        8314,
    },
    {8316}, -- Blood in the Snow
    {8317}, -- Dark Heart of Pandaria
    {8318}, -- Heroic: Dark Heart of Pandaria
    {8319}, -- Accelerated Archaeology
    { -- Chapter V: Judgment of the Black Prince
        8325,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8327}, -- Heroic: The Secrets of Ragefire
    {8329}, -- Heed the Weed
    {8330}, -- Hekima's Heal-Halter
    { -- Deepwind Gorge Victory
        8331,
        {
            IsPvP = true,
        },
    },
    { -- Deepwind Gorge Veteran
        8332,
        {
            IsPvP = true,
        },
    },
    { -- Deepwind Gorge Perfection
        8333,
        {
            IsPvP = true,
        },
    },
    { -- Having a Brawl (Season 1)
        8335,
        faction.Alliance,
        8337,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- I've Got the Biggest Brawls of Them All (Season 1)
        8336,
        faction.Alliance,
        8338,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Having a Brawl (Season 1)
        8337,
        faction.Horde,
        8335,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- I've Got the Biggest Brawls of Them All (Season 1)
        8338,
        faction.Horde,
        8336,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Collect Your Deck (Season 2)
        8339,
        faction.Alliance,
        8342,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Deck Your Collection (Season 1)
        8340,
        faction.Alliance,
        8343,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Collect Your Deck (Season 2)
        8342,
        faction.Horde,
        8339,
        {
            {"From", "Version", {6, 0, 3}, "Before", "Version", {7, 0, 3}},
        },
    },
    { -- Deck Your Collection (Season 1)
        8343,
        faction.Horde,
        8340,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8345}, -- Hearthstoned
    {8347}, -- Keep those Bombs Away! (From Me)
    {8348}, -- The Longest Day
    { -- Mine! Mine! Mine!
        8350,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Other People's Property
        8351,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Puddle Jumper
        8354,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Weighed Down
        8355,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Deepwind Gorge All-Star
        8358,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Capping Spree
        8359,
        {
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Master of Deepwind Gorge
        8360,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"Before", "Version", {8, 3, 0}},
        },
    },
    { -- Heroic: Battle on the High Seas
        8364,
        faction.Alliance,
        8366,
    },
    { -- Heroic: Battle on the High Seas
        8366,
        faction.Horde,
        8364,
    },
    {8368}, -- Fight Anger with Anger
    { -- Tournament Participation 2013
        8391,
        {
            IsPvP = true,
            {"From", "Date", {2013, 6, 18}, "Until", "Date", {2013, 8, 27}},
        },
    },
    { -- Tournament Glory 2013
        8392,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"From", "Date", {2013, 6, 18}, "Until", "Date", {2013, 8, 27}},
        },
    },
};

KrowiAF.AchievementData["05_04_00"] = {
    {KrowiAF.SetAchievementPatch, 5, 4, 0},
    { -- Grievous Conquest
        8381,
        faction.Horde,
        8382,
        {
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Grievous Conquest
        8382,
        faction.Alliance,
        8381,
        {
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
	{ -- Crazy for Cats
		8397,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Ahead of the Curve: Garrosh Hellscream (10 player)
        8398,
        {
            RewardType = rewardType.Mount,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Ahead of the Curve: Garrosh Hellscream (25 player)
        8399,
        {
            RewardType = rewardType.Mount,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Cutting Edge: Garrosh Hellscream (10 player)
        8400,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Cutting Edge: Garrosh Hellscream (25 player)
        8401,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8410}, -- The Celestial Tournament
    { -- Challenge Master: Temple of the Jade Serpent
        8430,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Stormstout Brewery
        8431,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Shado-Pan Monastery
        8432,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Mogu'shan Palace
        8433,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Gate of the Setting Sun
        8434,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Scarlet Halls
        8436,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Scarlet Monastery
        8437,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Scholomance
        8438,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Challenge Master: Siege of Niuzao Temple
        8439,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8448}, -- Gamon Will Save Us!
    { -- Prideful Conquest
        8450,
        faction.Horde,
        8451,
        {
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Prideful Conquest
        8451,
        faction.Alliance,
        8450,
        {
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    {8453}, -- Rescue Raiders
	{ -- Glory of the Orgrimmar Raider
		8454,
		{
			RewardType = rewardType.Mount,
		},
	},
    {8458}, -- Vale of Eternal Sorrows
    {8459}, -- Gates of Retribution
    {8461}, -- The Underhold
    {8462}, -- Downfall
    {8463}, -- Mythic: Immerseus
    {8465}, -- Mythic: Fallen Protectors
    {8466}, -- Mythic: Norushen
    {8467}, -- Mythic: Sha of Pride
    {8468}, -- Mythic: Galakras
    {8469}, -- Mythic: Iron Juggernaut
    {8470}, -- Mythic: Kor'kron Dark Shaman
    {8471}, -- Mythic: General Nazgrim
    {8472}, -- Mythic: Malkorok
    {8478}, -- Mythic: Spoils of Pandaria
    {8479}, -- Mythic: Thok the Bloodthirsty
    {8480}, -- Mythic: Siegecrafter Blackfuse
    {8481}, -- Mythic: Paragons of the Klaxxi
	{ -- Mythic: Garrosh Hellscream
		8482,
		{
			RewardType = rewardType.Title,
		},
	},
    { -- Grievous Combatant
        8484,
        faction.Horde,
        8485,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Grievous Combatant
        8485,
        faction.Alliance,
        8484,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Proving Yourself: Bronze Damage (Level 90)
        8486,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Bronze Tank (Level 90)
        8487,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Bronze Healer (Level 90)
        8488,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Silver Damage (Level 90)
        8491,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Silver Tank (Level 90)
        8492,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Silver Healer (Level 90)
        8493,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Gold Damage (Level 90)
        8496,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Gold Tank (Level 90)
        8497,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Gold Healer (Level 90)
        8498,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
        8501,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
        8502,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
        8503,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
        8504,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
        8505,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
        8506,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
        8507,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
        8508,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
        8509,
        {
            RewardType = rewardType.Title,
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8518}, -- Master of the Masters
    {8519}, -- Celestial Family
    {8520}, -- Fire in the Hole!
    {8521}, -- Swallow Your Pride
    {8527}, -- Giant Dinosaur vs. Mega Snail
    {8528}, -- Go Long
    {8529}, -- Criss Cross
    {8530}, -- The Immortal Vanguard
    {8531}, -- Now We are the Paragon
    {8532}, -- None Shall Pass
    {8533}, -- Ordos
    {8535}, -- Celestial Challenge
    {8536}, -- No More Tears
    {8537}, -- Strike!
    {8538}, -- Unlimited Potential
    {8543}, -- Lasers and Magnets and Drills! Oh My!
    { -- Prideful Combatant
        8641,
        faction.Horde,
        8642,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Prideful Combatant
        8642,
        faction.Alliance,
        8641,
        {
            RewardType = rewardType.Mount,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Grievous Gladiator: Season 14
        8643,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Gladiator: Season 14
        8644,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Duelist: Season 14
        8645,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Rival: Season 14
        8646,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Challenger: Season 14
        8649,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Hero of the Alliance: Tyrannical
        8652,
        faction.Alliance,
        8653,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
    { -- Hero of the Horde: Tyrannical
        8653,
        faction.Horde,
        8652,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
    { -- Hero of the Alliance: Grievous
        8654,
        faction.Alliance,
        8657,
        {
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Hero of the Horde: Grievous
        8657,
        faction.Horde,
        8654,
        {
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Hero of the Alliance: Prideful
        8658,
        faction.Alliance,
        8659,
        {
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Hero of the Horde: Prideful
        8659,
        faction.Horde,
        8658,
        {
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Prideful Gladiator: Season 15
        8666,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Gladiator: Season 15
        8667,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Duelist: Season 15
        8668,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Rival: Season 15
        8669,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Challenger: Season 15
        8670,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    { -- Tyrannical Gladiator's Cloud Serpent
        8678,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
    { -- Conqueror of Orgrimmar
        8679,
        faction.Alliance,
        8680,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Liberator of Orgrimmar
        8680,
        faction.Horde,
        8679,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- You're Doing it Wrong (Level 90)
        8697,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {8698}, -- Crashin' Thrashin' Flyer
    { -- The Danger Zone
        8699,
        {
            {"Event", 141},
        },
    },
    { -- Grievous Gladiator's Cloud Serpent
        8705,
        {
            IsPvP = true,
            {"PvP Season", 14},
        },
    },
    { -- Prideful Gladiator's Cloud Serpent
        8707,
        {
            IsPvP = true,
            {"PvP Season", 15},
        },
    },
    {8712}, -- Killing Time
    {8714}, -- Timeless Champion
    {8715}, -- Emperor Shaohao
    {8716}, -- Emissary of Ordos
    { -- Candlekeeper
        8717,
        {
            IsPvP = true,
        },
    },
    { -- Oathguard
        8718,
        {
            IsPvP = true,
        },
    },
    { -- Blazebinder
        8719,
        {
            IsPvP = true,
        },
    },
    { -- Kilnmaster
        8720,
        {
            IsPvP = true,
        },
    },
    { -- Fire-Watcher
        8721,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    {8722}, -- Timeless Nutriment
    {8723}, -- Legend of the Past
    {8724}, -- Pilgrimage
    {8725}, -- Eyes On The Ground
    {8726}, -- Extreme Treasure Hunter
    {8727}, -- Where There's Pirates, There's Booty
    {8728}, -- Going To Need A Bigger Bag
    {8729}, -- Treasure, Treasure Everywhere
    {8730}, -- Rolo's Riddle
    {8743}, -- Zarhym Altogether
    {8784}, -- Timeless Legends
    { -- Tyrannical Gladiator
        8791,
        {
            IsPvP = true,
            {"PvP Season", 13},
        },
    },
};

KrowiAF.AchievementData["05_04_01"] = {
    {KrowiAF.SetAchievementPatch, 5, 4, 1},
    {8793}, -- Murkalot
    { -- Friends In Places Even Higher Than That
        8794,
        {
            {"Before", "Date", {2019, 6, 11}},
        },
    },
};

KrowiAF.AchievementData["05_04_02"] = {
    {KrowiAF.SetAchievementPatch, 5, 4, 2},
    {8795}, -- Collector's Edition: Treasure Goblin
};