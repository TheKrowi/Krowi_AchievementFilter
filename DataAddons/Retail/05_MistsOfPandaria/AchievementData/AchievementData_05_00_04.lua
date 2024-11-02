local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_00_04"] = {
    { -- Keep Rollin' Rollin' Rollin'
        6089,
    },
    { -- Level 90 (Legacy)
        6193,
    },
    { -- Upjade Complete
        6300,
        faction.Alliance,
        6534,
    },
    { -- Rally the Valley
        6301,
    },
    { -- That Rabbit's Dynamite!
        6332,
    },
    { -- Mystically Superior
        6348,
    },
    { -- Mystically Epic
        6349,
    },
    { -- To All the Squirrels I Once Caressed?
        6350,
    },
    { -- Explore Jade Forest
        6351,
    },
    { -- Zen Master Cook
        6365,
    },
    { -- Shado-Pan
        6366,
    },
    { -- Challenge Conqueror: Bronze
        6374,
    },
    { -- Challenge Conqueror: Silver
        6375,
    },
    { -- Challenge Conqueror: Gold
        6378,
    },
    { -- Rattle No More
        6394,
    },
    { -- Sanguinarian
        6396,
    },
    { -- How Did He Get Up There?
        6400,
    },
    { -- Ling-Ting's Herbal Journey
        6402,
    },
    { -- Hopocalypse Now!
        6420,
    },
    { -- Mosh Pit
        6427,
    },
    { -- Realm First! Challenge Conqueror: Gold
        6433,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Show Me Your Moves!
        6455,
    },
    { -- Heroic: Stormstout Brewery
        6456,
    },
    { -- Stormstout Brewery
        6457,
    },
    { -- Guardians of Mogu'shan
        6458,
    },
    { -- Hydrophobia
        6460,
    },
    { -- Master Pet Battler
        6462,
    },
    { -- Shado-Pan Monastery
        6469,
    },
    { -- Heroic: Shado-Pan Monastery
        6470,
    },
    { -- Hate Leads to Suffering
        6471,
    },
    { -- The Obvious Solution
        6472,
    },
    { -- Cleaning Up
        6475,
    },
    { -- Conscriptinator
        6476,
    },
    { -- Respect
        6477,
    },
    { -- Glintrok N' Roll
        6478,
    },
    { -- Bomberman
        6479,
    },
    { -- "Settle Down, Bro"
        6480,
    },
    { -- Return to Sender
        6485,
    },
    { -- Extinction Event
        6517,
    },
    { -- I Heard You Like Amber...
        6518,
    },
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
    { -- Attention to Detail
        6531,
    },
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
    { -- "One Steppe Forward, Two Steppes Back"
        6539,
    },
    { -- Dread Haste Makes Dread Waste
        6540,
    },
    { -- Loremaster of Pandaria
        6541,
    },
    { -- The August Celestials
        6543,
    },
    { -- The Tillers
        6544,
    },
    { -- Klaxxi
        6545,
    },
    { -- The Golden Lotus
        6546,
    },
    { -- The Anglers
        6547,
    },
    { -- The Lorewalkers
        6548,
    },
    { -- Order of the Cloud Serpent
        6550,
    },
    { -- Friend on the Farm
        6551,
    },
    { -- Friends on the Farm
        6552,
    },
    { -- Like an Arrow to the Face
        6553,
    },
    { -- He's Mine!
        6554,
    },
    { -- Building a Team
        6555,
    },
    { -- Going to Need More Traps
        6556,
    },
    { -- Master Pet Hunter
        6557,
    },
    { -- Local Pet Mauler
        6558,
    },
    { -- Traveling Pet Mauler
        6559,
    },
    { -- World Pet Mauler
        6560,
    },
    { -- Just a Pup
        6566,
    },
    { -- Growing Up
        6567,
    },
    { -- Time for a Leash
        6568,
    },
    { -- Old Timer
        6569,
    },
    { -- All Growns Up!
        6570,
    },
    { -- That Was Close!
        6571,
    },
    { -- Pro Pet Group
        6578,
    },
    { -- Rookie Pet Group
        6579,
    },
    { -- Rookie Pet Crew
        6580,
    },
    { -- Pro Pet Crew
        6581,
    },
    { -- Pro Pet Mob
        6582,
    },
    { -- Rookie Pet Mob
        6583,
    },
    { -- Big City Pet Brawlin' - Alliance
        6584,
    },
    { -- Kalimdor Safari
        6585,
    },
    { -- Eastern Kingdoms Safari
        6586,
    },
    { -- Outland Safari
        6587,
    },
    { -- Northrend Safari
        6588,
    },
    { -- Pandaria Safari
        6589,
    },
    { -- World Safari
        6590,
    },
    { -- Grand Master Pet Battler
        6591,
    },
    { -- Legendary Pet Battler
        6592,
    },
    { -- Experienced Pet Battler
        6593,
    },
    { -- Cat Fight!
        6594,
    },
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
    { -- Ultimate Trainer
        6600,
    },
    { -- Taming the Wild
        6601,
    },
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
    { -- Taming Outland
        6604,
    },
    { -- Taming Northrend
        6605,
    },
    { -- Taming Pandaria
        6606,
    },
    { -- Taming Azeroth
        6607,
    },
    { -- Family Reunion
        6608,
    },
    { -- No Favorites
        6609,
    },
    { -- All Pets Allowed
        6610,
    },
    { -- Continental Tamer
        6611,
    },
    { -- Kalimdor Tamer
        6612,
    },
    { -- Eastern Kingdoms Tamer
        6613,
    },
    { -- Outland Tamer
        6614,
    },
    { -- Northrend Tamer
        6615,
    },
    { -- Pandaria Tamer
        6616,
    },
    { -- On A Roll
        6618,
    },
    { -- Win Streak
        6619,
    },
    { -- No Time To Heal
        6620,
        {
            IsPvP = true,
        },
    },
    { -- Big City Pet Brawlin' - Horde
        6621,
    },
    { -- Big City Pet Brawler
        6622,
    },
    { -- Seeds of Doubt
        6671,
    },
    { -- "Anything You Can Do, I Can Do Better..."
        6674,
    },
    { -- Less Than Three
        6683,
    },
    { -- Humane Society
        6684,
    },
    { -- Straight Six
        6686,
    },
    { -- Getting Hot In Here
        6687,
    },
    { -- Where's My Air Support?
        6688,
    },
    { -- Terrace of Endless Spring
        6689,
    },
    { -- Quarrelsome Quilen Quintet
        6713,
    },
    { -- Polyformic Acid Science
        6715,
    },
    { -- Between a Saurok and a Hard Place
        6716,
    },
    { -- Power Overwhelming
        6717,
    },
    { -- The Dread Approach
        6718,
    },
    { -- Heroic: Stone Guard
        6719,
    },
    { -- Heroic: Feng the Accursed
        6720,
    },
    { -- Heroic: Gara'jal the Spiritbinder
        6721,
    },
    { -- Heroic: Four Kings
        6722,
    },
    { -- Heroic: Elegon
        6723,
    },
    { -- Heroic: Will of the Emperor
        6724,
    },
    { -- Heroic: Imperial Vizier Zor'lok
        6725,
    },
    { -- Heroic: Blade Lord Ta'yak
        6726,
    },
    { -- Heroic: Garalon
        6727,
    },
    { -- Heroic: Wind Lord Mel'jarak
        6728,
    },
    { -- Heroic: Amber-Shaper Un'sok
        6729,
    },
    { -- Heroic: Grand Empress Shek'zeer
        6730,
    },
    { -- Heroic: Protectors of the Endless
        6731,
    },
    { -- Heroic: Tsulong
        6732,
    },
    { -- Heroic: Lei Shi
        6733,
    },
    { -- Heroic: Sha of Fear
        6734,
    },
    { -- What Does This Button Do?
        6736,
    },
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
        },
    },
    { -- 60 Exalted Reputations
        6742,
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
    { -- Got My Mind On My Money
        6753,
    },
    { -- The Dark Heart of the Mogu
        6754,
    },
    { -- Mogu'shan Palace
        6755,
    },
    { -- Heroic: Mogu'shan Palace
        6756,
    },
    { -- Temple of the Jade Serpent
        6757,
    },
    { -- Heroic: Temple of the Jade Serpent
        6758,
    },
    { -- Heroic: Gate of the Setting Sun
        6759,
    },
    { -- Heroic: Scarlet Halls
        6760,
    },
    { -- Heroic: Scarlet Monastery
        6761,
    },
    { -- Heroic: Scholomance
        6762,
    },
    { -- Heroic: Siege of Niuzao Temple
        6763,
    },
    { -- School's Out Forever
        6821,
    },
    { -- Run with the Wind
        6822,
    },
    { -- Must Love Dogs
        6823,
    },
    { -- Face Clutchers
        6824,
    },
    { -- The Mind-Killer
        6825,
    },
    { -- 55 Exalted Reputations
        6826,
    },
    { -- Pandaren Ambassador
        6827,
        faction.Horde,
        6828,
    },
    { -- Pandaren Ambassador
        6828,
        faction.Alliance,
        6827,
    },
    { -- Realm First! Pandaren Ambassador
        6829,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Professional Zen Master
        6830,
    },
    { -- Working For a Living
        6835,
    },
    { -- Serious Skills to Pay the Bills
        6836,
    },
    { -- Zen Master Archaeologist
        6837,
    },
    { -- Zen Master Medic
        6838,
    },
    { -- Zen Master Fisherman
        6839,
    },
    { -- The Vault of Mysteries
        6844,
    },
    { -- Nightmare of Shek'zeer
        6845,
    },
    { -- Fish Tales
        6846,
    },
    { -- The Song of the Yaungol
        6847,
    },
    { -- Collector's Edition: Lucky Quilen Cub
        6848,
    },
    { -- Collector's Edition: Imperial Quilen
        6849,
    },
    { -- Hozen in the Mist
        6850,
    },
    { -- Take 'Em All On!
        6851,
    },
    { -- The Seven Burdens of Shaohao
        6855,
    },
    { -- Ballad of Liu Lang
        6856,
    },
    { -- Heart of the Mantid Swarm
        6857,
    },
    { -- What Is Worth Fighting For
        6858,
    },
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
    },
    { -- Temple of the Jade Serpent: Bronze
        6885,
    },
    { -- Temple of the Jade Serpent: Silver
        6886,
    },
    { -- Temple of the Jade Serpent: Gold
        6887,
    },
    { -- Stormstout Brewery Challenger
        6888,
    },
    { -- Stormstout Brewery: Bronze
        6889,
    },
    { -- Stormstout Brewery: Silver
        6890,
    },
    { -- Stormstout Brewery: Gold
        6891,
    },
    { -- Mogu'shan Palace Challenger
        6892,
    },
    { -- Shado-Pan Monastery Challenger
        6893,
    },
    { -- Gate of the Setting Sun Challenger
        6894,
    },
    { -- Scarlet Halls Challenger
        6895,
    },
    { -- Scarlet Monastery Challenger
        6896,
    },
    { -- Scholomance Challenger
        6897,
    },
    { -- Siege of Niuzao Temple Challenger
        6898,
    },
    { -- Mogu'shan Palace: Bronze
        6899,
    },
    { -- Mogu'shan Palace: Silver
        6900,
    },
    { -- Mogu'shan Palace: Gold
        6901,
    },
    { -- Shado-Pan Monastery: Bronze
        6902,
    },
    { -- Shado-Pan Monastery: Silver
        6903,
    },
    { -- Shado-Pan Monastery: Gold
        6904,
    },
    { -- Gate of the Setting Sun: Bronze
        6905,
    },
    { -- Gate of the Setting Sun: Silver
        6906,
    },
    { -- Gate of the Setting Sun: Gold
        6907,
    },
    { -- Scarlet Halls: Bronze
        6908,
    },
    { -- Scarlet Halls: Silver
        6909,
    },
    { -- Scarlet Halls: Gold
        6910,
    },
    { -- Scarlet Monastery: Bronze
        6911,
    },
    { -- Scarlet Monastery: Silver
        6912,
    },
    { -- Scarlet Monastery: Gold
        6913,
    },
    { -- Scholomance: Bronze
        6914,
    },
    { -- Scholomance: Silver
        6915,
    },
    { -- Scholomance: Gold
        6916,
    },
    { -- Siege of Niuzao Temple: Bronze
        6917,
    },
    { -- Siege of Niuzao Temple: Silver
        6918,
    },
    { -- Siege of Niuzao Temple: Gold
        6919,
    },
    { -- Challenge Conqueror
        6920,
    },
    { -- Timing is Everything
        6922,
    },
    { -- Brewmoon Festival
        6923,
    },
    { -- "100,000 Valor Points"
        6924,
    },
    { -- Pandaria Dungeon Hero
        6925,
    },
    { -- Tranquil Master
        6926,
    },
    { -- Glory of the Pandaria Hero
        6927,
    },
    { -- Burning Man
        6928,
    },
    { -- And Stay Dead!
        6929,
    },
    { -- Yaungolian Barbecue
        6930,
    },
    { -- Binan Village All-Star
        6931,
    },
    { -- Glory of the Pandaria Raider
        6932,
    },
    { -- Who's Got Two Green Thumbs?
        6933,
    },
    { -- Candle in the Wind
        6936,
    },
    { -- Overzealous
        6937,
    },
    { -- Cataclysmic Gladiator
        6938,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Cataclysmic
        6939,
        faction.Alliance,
        6940,
        true,
    },
    { -- Hero of the Horde: Cataclysmic
        6940,
        faction.Horde,
        6939,
        true,
    },
    { -- Hero of the Horde
        6941,
        faction.Horde,
        6942,
        true,
    },
    { -- Hero of the Alliance
        6942,
        faction.Alliance,
        6941,
        true,
    },
    { -- Queuing Spree
        6943,
    },
    { -- Mantid Swarm
        6945,
    },
    { -- Empowered Spiritualist
        6946,
    },
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
    { -- Explore Valley of the Four Winds
        6969,
    },
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
    { -- Pandaria Explorer
        6974,
    },
    { -- Explore Krasarang Wilds
        6975,
    },
    { -- Explore Kun-Lai Summit
        6976,
    },
    { -- Explore Townlong Steppes
        6977,
    },
    { -- Explore Dread Wastes
        6978,
    },
    { -- Explore Vale of Eternal Blossoms
        6979,
    },
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
    { -- "Sorry, Were You Looking for This?"
        7056,
    },
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
    { -- Legend of the Brewfathers
        7230,
    },
    { -- Spill No Evil
        7231,
    },
    { -- The Keg Runner
        7232,
    },
    { -- Monkey in the Middle
        7239,
    },
    { -- "Monkey See, Monkey Kill"
        7248,
    },
    { -- Unga Ingoo
        7249,
    },
    { -- A Brewing Storm
        7252,
    },
    { -- Don't Shake the Keg
        7257,
    },
    { -- Party of Six
        7258,
    },
    { -- The Perfect Pour
        7261,
    },
    { -- Greenstone Village
        7265,
    },
    { -- Save it for Later
        7266,
    },
    { -- Perfect Delivery
        7267,
    },
    { -- Arena of Annihilation
        7271,
    },
    { -- In the Eye of the Tiger
        7272,
    },
    { -- Beat the Heat
        7273,
    },
    { -- Learning from the Best
        7274,
    },
    { -- It's a Trap!
        7275,
    },
    { -- Fancy Footwork
        7276,
    },
    { -- Lost and Found
        7281,
    },
    { -- Finders Keepers
        7282,
    },
    { -- One Man's Trash...
        7283,
    },
    { -- Is Another Man's Treasure
        7284,
    },
    { -- Every Day I'm Pand-a-ren
        7285,
    },
    { -- Finish Them!
        7286,
    },
    { -- Champion of Chi-Ji
        7287,
    },
    { -- Yak Attack
        7288,
    },
    { -- Shadow Hopper
        7289,
    },
    { -- How To Strain Your Dragon
        7290,
    },
    { -- In a Trail of Smoke
        7291,
    },
    { -- Green Acres
        7292,
    },
    { -- Till the Break of Dawn
        7293,
    },
    { -- A Taste of Things to Come
        7294,
    },
    { -- Listen to the Drunk Fish
        7295,
    },
    { -- Ain't Lost No More
        7296,
    },
    { -- Proven Strength
        7297,
    },
    { -- Getting Around with the Shado-Pan
        7298,
    },
    { -- Loner and a Rebel
        7299,
    },
    { -- Master of the Grill
        7300,
    },
    { -- Master of the Wok
        7301,
    },
    { -- Master of the Pot
        7302,
    },
    { -- Master of the Steamer
        7303,
    },
    { -- Master of the Oven
        7304,
    },
    { -- Master of the Brew
        7305,
    },
    { -- Master of Pandaren Cooking
        7306,
    },
    { -- Silent Assassin
        7307,
    },
    { -- Know Your Role
        7308,
    },
    { -- Fire in the Yaung-hole!
        7309,
    },
    { -- Defender of Gods
        7310,
    },
    { -- Amber is the Color of My Energy
        7312,
    },
    { -- Stay Klaxxi
        7313,
    },
    { -- Test Drive
        7314,
    },
    { -- Eternally in the Vale
        7315,
    },
    { -- Over Their Heads
        7316,
    },
    { -- One Many Army
        7317,
    },
    { -- A Taste of History
        7318,
    },
    { -- Ready for Raiding III
        7319,
    },
    { -- Dog Pile
        7320,
    },
    { -- Spreading the Warmth
        7321,
    },
    { -- Roll Club
        7322,
    },
    { -- Collateral Damage
        7323,
    },
    { -- One Step at a Time
        7324,
    },
    { -- Now I Am the Master
        7325,
    },
    { -- The Pandaren Gourmet
        7326,
    },
    { -- The Pandaren Gourmet
        7327,
    },
    { -- Ironpaw Chef
        7328,
    },
    { -- Pandaren Cuisine
        7329,
    },
    { -- Pandaren Delicacies
        7330,
    },
    { -- The Three Brew Fathers
        7331,
    },
    { -- The Broken Hearted
        7332,
    },
    { -- The Four Celestials
        7333,
    },
    { -- Instruments of Cruelty
        7334,
    },
    { -- Symbols of Strength
        7335,
    },
    { -- Stone Servants
        7336,
    },
    { -- Documents of a Dark History
        7337,
    },
    { -- Collector: Pandaren Tea Sets
        7338,
    },
    { -- Collector: Pandaren Game Boards
        7339,
    },
    { -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
        7340,
    },
    { -- Collector: Walking Canes of Brewfather Ren Yun
        7341,
    },
    { -- Collector: Empty Kegs of Brewfather Xin Wo Yin
        7342,
    },
    { -- Collector: Carved Bronze Mirrors
        7343,
    },
    { -- Collector: Gold-Inlaid Porcelain Funerary Figurines
        7344,
    },
    { -- Collector: Apothecary Tins
        7345,
    },
    { -- Collector: Pearls of Yu'lon
        7346,
    },
    { -- Collector: Standards of Niuzao
        7347,
    },
    { -- Collector: Manacles of Rebellion
        7348,
    },
    { -- Collector: Cracked Mogu Runestones
        7349,
    },
    { -- Collector: Terracotta Arms
        7350,
    },
    { -- Collector: Petrified Bone Whips
        7351,
    },
    { -- Collector: Thunder King Insignias
        7352,
    },
    { -- Collector: Edicts of the Thunder King
        7353,
    },
    { -- Collector: Iron Amulets
        7354,
    },
    { -- Collector: Warlord's Branding Irons
        7355,
    },
    { -- Collector: Mogu Coins
        7356,
    },
    { -- Collector: Worn Monument Ledgers
        7357,
    },
    { -- Collector: Pandaren Tea Sets
        7358,
    },
    { -- Collector: Pandaren Game Boards
        7359,
    },
    { -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
        7360,
    },
    { -- Collector: Walking Canes of Brewfather Ren Yun
        7361,
    },
    { -- Collector: Empty Kegs of Brewfather Xin Wo Yin
        7362,
    },
    { -- Collector: Carved Bronze Mirrors
        7363,
    },
    { -- Collector: Gold-Inlaid Porcelain Funerary Figurines
        7364,
    },
    { -- Collector: Apothecary Tins
        7365,
    },
    { -- Collector: Pearls of Yu'lon
        7366,
    },
    { -- Collector: Standards of Niuzao
        7367,
    },
    { -- Collector: Manacles of Rebellion
        7368,
    },
    { -- Collector: Cracked Mogu Runestones
        7369,
    },
    { -- Collector: Terracotta Arms
        7370,
    },
    { -- Collector: Petrified Bone Whips
        7371,
    },
    { -- Collector: Thunder King Insignias
        7372,
    },
    { -- Collector: Edicts of the Thunder King
        7373,
    },
    { -- Collector: Iron Amulets
        7374,
    },
    { -- Collector: Warlord's Branding Irons
        7375,
    },
    { -- Collector: Mogu Coins
        7376,
    },
    { -- Collector: Worn Monument Ledgers
        7377,
    },
    { -- Jack of All Trades
        7378,
    },
    { -- Pandaren Master of All
        7379,
    },
    { -- Double Agent
        7380,
    },
    { -- Restore Balance
        7381,
    },
    { -- Dynamic Duo
        7382,
    },
    { -- Terrific Trio
        7383,
    },
    { -- Quintessential Quintet
        7384,
    },
    { -- Pub Crawl
        7385,
    },
    { -- Grand Expedition Yak
        7386,
    },
    { -- 5000 Daily Quests Completed
        7410,
    },
    { -- 10000 Daily Quests Completed
        7411,
    },
    { -- Collector's Edition: Fetish Shaman
        7412,
    },
    { -- Scarlet Halls
        7413,
    },
    { -- Newbie
        7433,
    },
    { -- Zen Pet Hunter
        7436,
    },
    { -- A Worthy Opponent
        7437,
    },
    { -- Could We Find More Like That?
        7438,
    },
    { -- Glorious!
        7439,
    },
    { -- A Rare Catch
        7462,
    },
    { -- Lots of Rarity
        7463,
    },
    { -- Quality & Quantity
        7464,
    },
    { -- An Uncommon Find
        7465,
    },
    { -- Theramore's Fall
        7467,
        faction.Alliance,
        7468,
    },
    { -- Theramore's Fall
        7468,
        faction.Horde,
        7467,
    },
    { -- The Shado-Master
        7479,
    },
    { -- Trainer Extraordinaire
        7482,
    },
    { -- Battle Master
        7483,
    },
    { -- Cutting Edge: Will of the Emperor
        7485,
    },
    { -- Cutting Edge: Grand Empress Shek'zeer
        7486,
    },
    { -- Cutting Edge: Sha of Fear
        7487,
    },
    { -- Taming the Great Outdoors
        7498,
    },
    { -- Taming the World
        7499,
    },
    { -- Going to Need More Leashes
        7500,
    },
    { -- That's a Lot of Pet Food
        7501,
    },
    { -- Savior of Stoneplow
        7502,
    },
    { -- Scenaturday
        7509,
        faction.Horde,
        6874,
    },
    { -- "Wanderers, Dreamers, and You"
        7518,
    },
    { -- The Loremaster
        7520,
    },
    { -- Time to Open a Pet Store
        7521,
    },
    { -- Crypt of Forgotten Kings
        7522,
    },
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
    { -- Taming Cataclysm
        7525,
    },
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
    },
    { -- Chapter II: Wrathion's War
        7534,
        faction.Alliance,
        8008,
    },
    { -- Chapter III: Two Princes
        7535,
    },
    { -- Chapter IV: Celestial Blessings
        7536,
    },
    { -- Tricks and Treats of Pandaria
        7601,
        faction.Alliance,
        7602,
    },
    { -- Tricks and Treats of Pandaria
        7602,
        faction.Horde,
        7601,
    },
    { -- Pandarian Angler
        7611,
    },
    { -- The Seat of Knowledge
        7612,
    },
    { -- Locking Down the Docks
        7614,
    },
    { -- Collector's Edition: Baneling
        7842,
    },
    {KrowiAF.SetAchievementPatch, 5, 0, 4}, -- Rework loading so this can go to the top, future me problem
};