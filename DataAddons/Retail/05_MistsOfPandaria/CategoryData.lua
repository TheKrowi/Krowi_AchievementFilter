local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Mists of Pandaria
    189,
    addon.GetCategoryInfoTitle(15164),
    { -- Zones
        491,
        addon.L["Zones"],
        { -- Pandaria
            526,
            addon.GetMapName(424),
            { -- Quests
                527,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6541, -- Loremaster of Pandaria
                    7285, -- Every Day I'm Pand-a-ren
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                528,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6716, -- Between a Saurok and a Hard Place
                    6754, -- The Dark Heart of the Mogu
                    6846, -- Fish Tales
                    6850, -- Hozen in the Mist
                    6847, -- The Song of the Yaungol
                    6855, -- The Seven Burdens of Shaohao
                    6856, -- Ballad of Liu Lang
                    6858, -- What Is Worth Fighting For
                    7230, -- Legend of the Brewfathers
                    7994, -- Treasure of Pandaria
                    7995, -- Fortune of Pandaria
                    7996, -- Bounty of Pandaria
                    7997, -- Riches of Pandaria
                    7281, -- Lost and Found
                    7282, -- Finders Keepers
                    7283, -- One Man's Trash...
                    7284, -- Is Another Man's Treasure
                    7437, -- A Worthy Opponent
                    7438, -- Could We Find More Like That?
                    7439, -- Glorious!
                    8078, -- Zul'Again
                    6350, -- To All the Squirrels I Once Caressed?
                    7329, -- Pandaren Cuisine
                    7330, -- Pandaren Delicacies
                    6974, -- Pandaria Explorer
                },
            },
            { -- Reputation
                529,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    7479, -- The Shado-Master
                    6543, -- The August Celestials
                    6547, -- The Anglers
                    6548, -- The Lorewalkers
                    6827, -- Pandaren Ambassador
                    6828, -- Pandaren Ambassador
                },
            },
        },
        { -- The Jade Forest
            492,
            addon.GetMapName(371),
            { -- Quests
                519,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6300, -- Upjade Complete
                    6534, -- Upjade Complete
                    7289, -- Shadow Hopper
                    7290, -- How To Strain Your Dragon
                    7291, -- In a Trail of Smoke
                },
            },
            { -- Exploration
                545,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6351, -- Explore Jade Forest
                    7381, -- Restore Balance
                },
            },
            { -- Reputation
                546,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6550, -- Order of the Cloud Serpent
                },
            },
        },
        { -- Valley of the Four Winds
            493,
            addon.GetMapName(376),
            { -- Quests
                516,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6301, -- Rally the Valley
                    7292, -- Green Acres
                    7293, -- Till the Break of Dawn
                    7294, -- A Taste of Things to Come
                    7295, -- Listen to the Drunk Fish
                    7296, -- Ain't Lost No More
                    7502, -- Savior of Stoneplow
                },
            },
            { -- Exploration
                544,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6969, -- Explore Valley of the Four Winds
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                518,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6544, -- The Tillers
                    6551, -- Friend on the Farm
                    6552, -- Friends on the Farm
                },
            },
            {
                6517, -- Extinction Event
            },
        },
        { -- Krasarang Wilds
            494,
            addon.GetMapName(418),
            { -- Quests
                513,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6535, -- Mighty Roamin' Krasaranger
                    6536, -- Mighty Roamin' Krasaranger
                    7287, -- Champion of Chi-Ji
                    7928, -- Operation: Shieldwall Campaign
                    7929, -- Dominance Offensive Campaign
                },
            },
            { -- Exploration
                514,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6975, -- Explore Krasarang Wilds
                    7518, -- Wanderers, Dreamers, and You
                    7932, -- I'm In Your Base, Killing Your Dudes
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                543,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8205, -- Operation: Shieldwall
                    8206, -- Dominance Offensive
                },
            },
        },
        { -- Kun-Lai Summit
            495,
            addon.GetMapName(379),
            { -- Quests
                510,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6537, -- Slum It in the Summit
                    6538, -- Slum It in the Summit
                    7286, -- Finish Them!
                },
            },
            { -- Exploration
                542,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6976, -- Explore Kun-Lai Summit
                    9924, -- Field Photographer
                },
            },
            {
                6480, -- Settle Down, Bro
                7386, -- Grand Expedition Yak
            },
        },
        { -- Townlong Steppes
            496,
            addon.GetMapName(388),
            { -- Quests
                507,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6539, -- One Steppe Forward, Two Steppes Back
                    7288, -- Yak Attack
                    7297, -- Proven Strength
                    7298, -- Getting Around with the Shado-Pan
                    7299, -- Loner and a Rebel
                    7307, -- Silent Assassin
                    7308, -- Know Your Role
                    7309, -- Fire in the Yaung-hole!
                    7310, -- Defender of Gods
                },
            },
            { -- Exploration
                540,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6977, -- Explore Townlong Steppes
                },
            },
            { -- Reputation
                541,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6366, -- Shado-Pan
                },
            },
        },
        { -- Dread Wastes
            497,
            addon.GetMapName(422),
            { -- Quests
                504,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    6540, -- Dread Haste Makes Dread Waste
                    7312, -- Amber is the Color of My Energy
                    7313, -- Stay Klaxxi
                    7314, -- Test Drive
                    7316, -- Over Their Heads
                },
            },
            { -- Exploration
                538,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6978, -- Explore Dread Wastes
                    6857, -- Heart of the Mantid Swarm
                },
            },
            { -- Reputation
                539,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6545, -- Klaxxi
                    8023, -- Wakener
                },
            },
        },
        { -- Vale of Eternal Blossoms
            498,
            addon.GetMapName(390),
            { -- Quests
                501,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    7317, -- One Many Army
                    7318, -- A Taste of History
                    7319, -- Ready for Raiding III
                    7320, -- Dog Pile
                    7321, -- Spreading the Warmth
                    7322, -- Roll Club
                    7323, -- Collateral Damage
                    7324, -- One Step at a Time
                    7315, -- Eternally in the Vale
                },
            },
            { -- Exploration
                536,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    6979, -- Explore Vale of Eternal Blossoms
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                537,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    6546, -- The Golden Lotus
                },
            },
        },
        { -- Isle of Giants
            534,
            addon.GetMapName(507),
            {
                8123, -- Millions of Years of Evolution vs. My Fist
                8092, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
            },
        },
        { -- Isle of Thunder
            522,
            addon.GetMapName(504),
            { -- Quests
                523,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8099, -- Isle of Thunder
                    8100, -- Pay to Slay
                    8101, -- It Was Worth Every Ritual Stone
                    8104, -- Thunder Plunder
                    8105, -- The Crumble Bundle
                    8107, -- Ready for RAAAAIIIIDDD?!?ing
                    8108, -- When in Ihgaluk, Do as the Skumblade Do
                    8109, -- The Mogu Below-gu
                    8110, -- These Mogu Have Gotta Go-gu
                    8111, -- This Isn't Even My Final Form
                    8112, -- Blue Response
                    8114, -- Platform Hero
                    8115, -- Speed Metal
                    8116, -- You Made Me Bleed My Own Blood
                    8117, -- For the Ward!
                    8118, -- Boop
                    8119, -- Our Powers Combined
                    8120, -- Direhorn in a China Shop
                    8212, -- Zandalari Library Card
                    8121, -- Stormbreaker
                    8106, -- In the Hall of the Thunder King
                },
            },
            { -- Exploration
                524,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8103, -- Champions of Lei Shen
                    8049, -- The Zandalari Prophecy
                    8050, -- Rumbles of Thunder
                    8051, -- Gods and Monsters
                },
            },
            { -- Reputation
                525,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8208, -- Kirin Tor Offensive
                    8209, -- Sunreaver Onslaught
                    8210, -- Shado-Pan Assault
                },
            },
            {
                8028, -- Praise the Sun!
            },
        },
        { -- Timeless Isle
            530,
            addon.GetMapName(554),
            { -- Exploration
                531,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8712, -- Killing Time
                    8714, -- Timeless Champion
                    8722, -- Timeless Nutriment
                    8724, -- Pilgrimage
                    8723, -- Legend of the Past
                    8784, -- Timeless Legends
                    8725, -- Eyes On The Ground
                    8726, -- Extreme Treasure Hunter
                    8727, -- Where There's Pirates, There's Booty
                    8729, -- Treasure, Treasure Everywhere
                    8730, -- Rolo's Riddle
                    8743, -- Zarhym Altogether
                    8716, -- Emissary of Ordos
                    8717, -- Candlekeeper
                    8718, -- Oathguard
                    8719, -- Blazebinder
                    8720, -- Kilnmaster
                    8721, -- Fire-Watcher
                    8728, -- Going To Need A Bigger Bag
                },
            },
            { -- Reputation
                535,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    8715, -- Emperor Shaohao
                },
            },
            {
                8535, -- Celestial Challenge
                8533, -- Ordos
            },
        },
    },
    { -- Dungeons
        190,
        addon.GetCategoryInfoTitle(15272),
        { -- Temple of the Jade Serpent
            193,
            addon.GetInstanceInfoName(313),
            {
                6475, -- Cleaning Up
                6460, -- Hydrophobia
                6671, -- Seeds of Doubt
                6757, -- Temple of the Jade Serpent
                6758, -- Heroic: Temple of the Jade Serpent
                6884, -- Temple of the Jade Serpent Challenger
                6885, -- Temple of the Jade Serpent: Bronze
                6886, -- Temple of the Jade Serpent: Silver
                6887, -- Temple of the Jade Serpent: Gold
                8430, -- Challenge Master: Temple of the Jade Serpent
                16661, -- Keystone Hero: Temple of the Jade Serpent
            },
        },
        { -- Stormstout Brewery
            194,
            addon.GetInstanceInfoName(302),
            {
                6402, -- Ling-Ting's Herbal Journey
                6089, -- Keep Rollin' Rollin' Rollin'
                6400, -- How Did He Get Up There?
                6420, -- Hopocalypse Now!
                6457, -- Stormstout Brewery
                6456, -- Heroic: Stormstout Brewery
                6888, -- Stormstout Brewery Challenger
                6889, -- Stormstout Brewery: Bronze
                6890, -- Stormstout Brewery: Silver
                6891, -- Stormstout Brewery: Gold
                8431, -- Challenge Master: Stormstout Brewery
            },
        },
        { -- Mogu'shan Palace
            195,
            addon.GetInstanceInfoName(321),
            {
                6713, -- Quarrelsome Quilen Quintet
                6478, -- Glintrok N' Roll
                6736, -- What Does This Button Do?
                6755, -- Mogu'shan Palace
                6756, -- Heroic: Mogu'shan Palace
                6892, -- Mogu'shan Palace Challenger
                6899, -- Mogu'shan Palace: Bronze
                6900, -- Mogu'shan Palace: Silver
                6901, -- Mogu'shan Palace: Gold
                8433, -- Challenge Master: Mogu'shan Palace
            },
        },
        { -- Shado-Pan Monastery
            196,
            addon.GetInstanceInfoName(312),
            {
                6477, -- Respect
                6472, -- The Obvious Solution
                6471, -- Hate Leads to Suffering
                6469, -- Shado-Pan Monastery
                6470, -- Heroic: Shado-Pan Monastery
                6893, -- Shado-Pan Monastery Challenger
                6902, -- Shado-Pan Monastery: Bronze
                6903, -- Shado-Pan Monastery: Silver
                6904, -- Shado-Pan Monastery: Gold
                8432, -- Challenge Master: Shado-Pan Monastery
            },
        },
        { -- Gate of the Setting Sun
            197,
            addon.GetInstanceInfoName(303),
            {
                6479, -- Bomberman
                6476, -- Conscriptinator
                6945, -- Mantid Swarm
                10010, -- Gate of the Setting Sun
                6759, -- Heroic: Gate of the Setting Sun
                6894, -- Gate of the Setting Sun Challenger
                6905, -- Gate of the Setting Sun: Bronze
                6906, -- Gate of the Setting Sun: Silver
                6907, -- Gate of the Setting Sun: Gold
                8434, -- Challenge Master: Gate of the Setting Sun
            },
        },
        { -- Siege of Niuzao Temple
            198,
            addon.GetInstanceInfoName(324),
            {
                6688, -- Where's My Air Support?
                6485, -- Return to Sender
                6822, -- Run with the Wind
                10011, -- Siege of Niuzao Temple
                6763, -- Heroic: Siege of Niuzao Temple
                6898, -- Siege of Niuzao Temple Challenger
                6917, -- Siege of Niuzao Temple: Bronze
                6918, -- Siege of Niuzao Temple: Silver
                6919, -- Siege of Niuzao Temple: Gold
                8439, -- Challenge Master: Siege of Niuzao Temple
            },
        },
        { -- Scarlet Halls
            199,
            addon.GetInstanceInfoName(311),
            {
                6684, -- Humane Society
                6427, -- Mosh Pit
                7413, -- Scarlet Halls
                6760, -- Heroic: Scarlet Halls
                6895, -- Scarlet Halls Challenger
                6908, -- Scarlet Halls: Bronze
                6909, -- Scarlet Halls: Silver
                6910, -- Scarlet Halls: Gold
                8436, -- Challenge Master: Scarlet Halls
            },
        },
        { -- Scarlet Monastery
            200,
            addon.GetInstanceInfoName(316),
            {
                6946, -- Empowered Spiritualist
                6928, -- Burning Man
                6929, -- And Stay Dead!
                637, -- Scarlet Monastery
                6761, -- Heroic: Scarlet Monastery
                6896, -- Scarlet Monastery Challenger
                6911, -- Scarlet Monastery: Bronze
                6912, -- Scarlet Monastery: Silver
                6913, -- Scarlet Monastery: Gold
                8437, -- Challenge Master: Scarlet Monastery
                980, -- The Horseman's Reins
            },
        },
        { -- Scholomance
            201,
            addon.GetInstanceInfoName(246),
            {
                6531, -- Attention to Detail
                6394, -- Rattle No More
                6396, -- Sanguinarian
                6715, -- Polyformic Acid Science
                6821, -- School's Out Forever
                645, -- Scholomance
                6762, -- Heroic: Scholomance
                6897, -- Scholomance Challenger
                6914, -- Scholomance: Bronze
                6915, -- Scholomance: Silver
                6916, -- Scholomance: Gold
                8438, -- Challenge Master: Scholomance
            },
        },
        {
            6925, -- Pandaria Dungeon Hero
            6927, -- Glory of the Pandaria Hero
            8903, -- Mistwalker
            6920, -- Challenge Conqueror
            6374, -- Challenge Conqueror: Bronze
            6375, -- Challenge Conqueror: Silver
            6378, -- Challenge Conqueror: Gold
        },
    },
    { -- Raids
        191,
        addon.GetCategoryInfoTitle(15271),
        { -- Mogu'shan Vaults
            202,
            addon.GetInstanceInfoName(317),
            { -- Glory
                892,
                addon.L["Glory"],
                {
                    6823, -- Must Love Dogs
                    6674, -- Anything You Can Do, I Can Do Better...
                    7056, -- Sorry, Were You Looking for This?
                    6686, -- Straight Six
                },
            },
            { -- Heroic
                893,
                addon.L["Heroic"],
                {
                    6719, -- Heroic: Stone Guard
                    6720, -- Heroic: Feng the Accursed
                    6721, -- Heroic: Gara'jal the Spiritbinder
                    6722, -- Heroic: Four Kings
                    6723, -- Heroic: Elegon
                    6724, -- Heroic: Will of the Emperor
                },
            },
            {
                7933, -- And... It's Good!
                6687, -- Getting Hot In Here
                6455, -- Show Me Your Moves!
                6458, -- Guardians of Mogu'shan
                6844, -- The Vault of Mysteries
                6954, -- Ahead of the Curve: Will of the Emperor
                7485, -- Cutting Edge: Will of the Emperor
            },
        },
        { -- Heart of Fear
            203,
            addon.GetInstanceInfoName(330),
            { -- Glory
                894,
                addon.L["Glory"],
                {
                    6937, -- Overzealous
                    6936, -- Candle in the Wind
                    6553, -- Like an Arrow to the Face
                    6683, -- Less Than Three
                    6518, -- I Heard You Like Amber...
                    6922, -- Timing is Everything
                },
            },
            { -- Heroic
                895,
                addon.L["Heroic"],
                {
                    6725, -- Heroic: Imperial Vizier Zor'lok
                    6726, -- Heroic: Blade Lord Ta'yak
                    6727, -- Heroic: Garalon
                    6728, -- Heroic: Wind Lord Mel'jarak
                    6729, -- Heroic: Amber-Shaper Un'sok
                    6730, -- Heroic: Grand Empress Shek'zeer
                },
            },
            {
                6718, -- The Dread Approach
                6845, -- Nightmare of Shek'zeer
                8246, -- Ahead of the Curve: Grand Empress Shek'zeer
                7486, -- Cutting Edge: Grand Empress Shek'zeer
                11757, -- Sha of Fabulous
            },
        },
        { -- Terrace of Endless Spring
            204,
            addon.GetInstanceInfoName(320),
            { -- Glory
                896,
                addon.L["Glory"],
                {
                    6717, -- Power Overwhelming
                    6933, -- Who's Got Two Green Thumbs?
                    6824, -- Face Clutchers
                    6825, -- The Mind-Killer
                },
            },
            { -- Heroic
                897,
                addon.L["Heroic"],
                {
                    6731, -- Heroic: Protectors of the Endless
                    6732, -- Heroic: Tsulong
                    6733, -- Heroic: Lei Shi
                    6734, -- Heroic: Sha of Fear
                },
            },
            {
                6689, -- Terrace of Endless Spring
                8248, -- Ahead of the Curve: Sha of Fear
                7487, -- Cutting Edge: Sha of Fear
                11757, -- Sha of Fabulous
            },
        },
        { -- Throne of Thunder
            205,
            addon.GetInstanceInfoName(362),
            { -- Glory
                898,
                addon.L["Glory"],
                {
                    8094, -- Lightning Overload
                    8038, -- Cretaceous Collector
                    8073, -- Cage Match
                    8077, -- One-Up
                    8082, -- Head Case
                    8097, -- Soft Hands
                    8098, -- You Said Crossing the Streams Was Bad
                    8037, -- Genetically Unmodified Organism
                    8081, -- Ritualist Who?
                    8087, -- Can't Touch This
                    8086, -- From Dusk 'til Dawn
                    8090, -- A Complete Circuit
                },
            },
            { -- Heroic
                899,
                addon.L["Heroic"],
                {
                    8056, -- Heroic: Jin'rokh the Breaker
                    8057, -- Heroic: Horridon
                    8058, -- Heroic: Council of Elders
                    8059, -- Heroic: Tortos
                    8060, -- Heroic: Megaera
                    8061, -- Heroic: Ji-Kun
                    8062, -- Heroic: Durumu the Forgotten
                    8063, -- Heroic: Primordius
                    8064, -- Heroic: Dark Animus
                    8065, -- Heroic: Iron Qon
                    8066, -- Heroic: Twin Empyreans
                    8067, -- Heroic: Lei Shen
                    8068, -- Heroic: Ra-den
                },
            },
            {
                8069, -- Last Stand of the Zandalari
                8070, -- Forgotten Depths
                8071, -- Halls of Flesh-Shaping
                8072, -- Pinnacle of Storms
                8089, -- I Thought He Was Supposed to Be Hard?
                8249, -- Ahead of the Curve: Lei Shen
                8238, -- Cutting Edge: Lei Shen
                8260, -- Cutting Edge: Ra-den
                11758, -- Thunderwear
            },
        },
        { -- Siege of Orgrimmar
            206,
            addon.GetInstanceInfoName(369),
            { -- Glory
                900,
                addon.L["Glory"],
                {
                    8536, -- No More Tears
                    8528, -- Go Long
                    8532, -- None Shall Pass
                    8521, -- Swallow Your Pride
                    8530, -- The Immortal Vanguard
                    8520, -- Fire in the Hole!
                    8453, -- Rescue Raiders
                    8448, -- Gamon Will Save Us!
                    8538, -- Unlimited Potential
                    8529, -- Criss Cross
                    8527, -- Giant Dinosaur vs. Mega Snail
                    8543, -- Lasers and Magnets and Drills! Oh My!
                    8531, -- Now We are the Paragon
                    8537, -- Strike!
                },
            },
            { -- Mythic
                901,
                addon.L["Mythic"],
                {
                    8463, -- Mythic: Immerseus
                    8465, -- Mythic: Fallen Protectors
                    8466, -- Mythic: Norushen
                    8467, -- Mythic: Sha of Pride
                    8468, -- Mythic: Galakras
                    8469, -- Mythic: Iron Juggernaut
                    8470, -- Mythic: Kor'kron Dark Shaman
                    8471, -- Mythic: General Nazgrim
                    8472, -- Mythic: Malkorok
                    8478, -- Mythic: Spoils of Pandaria
                    8479, -- Mythic: Thok the Bloodthirsty
                    8480, -- Mythic: Siegecrafter Blackfuse
                    8481, -- Mythic: Paragons of the Klaxxi
                    8482, -- Mythic: Garrosh Hellscream
                },
            },
            {
                8458, -- Vale of Eternal Sorrows
                8459, -- Gates of Retribution
                8461, -- The Underhold
                8462, -- Downfall
                8679, -- Conqueror of Orgrimmar
                8680, -- Liberator of Orgrimmar
                8398, -- Ahead of the Curve: Garrosh Hellscream (10 player)
                8400, -- Cutting Edge: Garrosh Hellscream (10 player)
                8399, -- Ahead of the Curve: Garrosh Hellscream (25 player)
                8401, -- Cutting Edge: Garrosh Hellscream (25 player)
                11759, -- Yaass'shaarj
            },
        },
        {
            6932, -- Glory of the Pandaria Raider
            8124, -- Glory of the Thundering Raider
            8454, -- Glory of the Orgrimmar Raider
        },
    },
    { -- Professions
        1437,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1440,
            addon.GetCategoryInfoTitle(15071),
            { -- Pandaren
                1441,
                addon.L["Pandaren"],
                true,
                {
                    7331, -- The Three Brew Fathers
                    7332, -- The Broken Hearted
                    7333, -- The Four Celestials
                    7338, -- Collector: Pandaren Tea Sets
                    7358, -- Collector: Pandaren Tea Sets
                    7339, -- Collector: Pandaren Game Boards
                    7359, -- Collector: Pandaren Game Boards
                    7340, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
                    7360, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
                    7341, -- Collector: Walking Canes of Brewfather Ren Yun
                    7361, -- Collector: Walking Canes of Brewfather Ren Yun
                    7342, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
                    7362, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
                    7343, -- Collector: Carved Bronze Mirrors
                    7363, -- Collector: Carved Bronze Mirrors
                    7344, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
                    7364, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
                    7345, -- Collector: Apothecary Tins
                    7365, -- Collector: Apothecary Tins
                    7346, -- Collector: Pearls of Yu'lon
                    7366, -- Collector: Pearls of Yu'lon
                    7347, -- Collector: Standards of Niuzao
                    7367, -- Collector: Standards of Niuzao
                },
            },
            { -- Mogu
                1442,
                addon.L["Mogu"],
                true,
                {
                    7334, -- Instruments of Cruelty
                    7335, -- Symbols of Strength
                    7337, -- Documents of a Dark History
                    7336, -- Stone Servants
                    7348, -- Collector: Manacles of Rebellion
                    7368, -- Collector: Manacles of Rebellion
                    7349, -- Collector: Cracked Mogu Runestones
                    7369, -- Collector: Cracked Mogu Runestones
                    7350, -- Collector: Terracotta Arms
                    7370, -- Collector: Terracotta Arms
                    7351, -- Collector: Petrified Bone Whips
                    7371, -- Collector: Petrified Bone Whips
                    7352, -- Collector: Thunder King Insignias
                    7372, -- Collector: Thunder King Insignias
                    7373, -- Collector: Edicts of the Thunder King
                    7353, -- Collector: Edicts of the Thunder King
                    7354, -- Collector: Iron Amulets
                    7374, -- Collector: Iron Amulets
                    7355, -- Collector: Warlord's Branding Irons
                    7375, -- Collector: Warlord's Branding Irons
                    7356, -- Collector: Mogu Coins
                    7376, -- Collector: Mogu Coins
                    7357, -- Collector: Worn Monument Ledgers
                    7377, -- Collector: Worn Monument Ledgers
                },
            },
            { -- Mantid
                1443,
                addon.L["Mantid"],
                true,
                {
                    8220, -- Collector: Banners of the Mantid Empire
                    8221, -- Collector: Banners of the Mantid Empire
                    8222, -- Collector: Ancient Sap Feeders
                    8223, -- Collector: Ancient Sap Feeders
                    8224, -- Collector: Praying Mantids
                    8225, -- Collector: Praying Mantids
                    8226, -- Collector: Inert Sound Beacons
                    8227, -- Collector: Inert Sound Beacons
                    8228, -- Collector: Remains of Paragons
                    8229, -- Collector: Remains of Paragons
                    8230, -- Collector: Mantid Lamps
                    8231, -- Collector: Mantid Lamps
                    8232, -- Collector: Pollen Collectors
                    8233, -- Collector: Pollen Collectors
                    8234, -- Collector: Kypari Sap Containers
                    8235, -- Collector: Kypari Sap Containers
                },
            },
            {
                6837, -- Zen Master Archaeologist
                7612, -- The Seat of Knowledge
                8219, -- History of the Mantid
            },
        },
        { -- Cooking
            1143,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                6365, -- Zen Master Cook
                7300, -- Master of the Grill
                7301, -- Master of the Wok
                7302, -- Master of the Pot
                7303, -- Master of the Steamer
                7304, -- Master of the Oven
                7305, -- Master of the Brew
                7306, -- Master of Pandaren Cooking
                7325, -- Now I Am the Master
                7326, -- The Pandaren Gourmet
                7327, -- The Pandaren Gourmet
            },
        },
        { -- Fishing
            1438,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                6839, -- Zen Master Fisherman
                7611, -- Pandarian Angler
                7614, -- Locking Down the Docks
                7274, -- Learning from the Best
            },
        },
        {
            6830, -- Professional Zen Master
            6835, -- Working For a Living
            7378, -- Jack of All Trades
            7379, -- Pandaren Master of All
            6838, -- Zen Master Medic
            6836, -- Serious Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        549,
        addon.GetCategoryInfoTitle(15117),
        {
            6616, -- Pandaria Tamer
            6589, -- Pandaria Safari
            8519, -- Celestial Family
            13469, -- Raiding with Leashes VI: Pets of Pandaria
            6606, -- Taming Pandaria
            8410, -- The Celestial Tournament
            8518, -- Master of the Masters
            7908, -- I Choose You
            7936, -- Pandaren Spirit Tamer
            8080, -- Fabled Pandaren Tamer
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            6611, -- Continental Tamer
            6590, -- World Safari
            8348, -- The Longest Day
        },
    },
    { -- Brawler's Guild
        790,
        addon.L["Brawler's Guild"],
        {
            7937, -- You Are Not Your $#*@! Legplates (Season 1)
            8020, -- You Are Not Your $#*@! Legplates (Season 1)
            7940, -- The Second Rule of Brawler's Guild (Season 1)
            7939, -- The Second Rule of Brawler's Guild (Season 1)
            7941, -- Brawlin' and Shot Callin' (Season 1)
            7942, -- Brawlin' and Shot Callin' (Season 1)
            8335, -- Having a Brawl (Season 1)
            8337, -- Having a Brawl (Season 1)
            8336, -- I've Got the Biggest Brawls of Them All (Season 1)
            8338, -- I've Got the Biggest Brawls of Them All (Season 1)
            7946, -- Now You're Just Showing Off (Season 1)
            8022, -- Now You're Just Showing Off (Season 1)
            8340, -- Deck Your Collection (Season 1)
            8343, -- Deck Your Collection (Season 1)
            7947, -- The First Rule of Brawler's Guild (Season 1 or 2)
            7948, -- The First Rule of Brawler's Guild (Season 1 or 2)
        },
    },
    { -- Scenarios
        192,
        addon.L["Scenarios"],
        { -- A Brewing Storm
            207,
            (addon.GetLFGDungeonInfo(517)),
            {
                7252, -- A Brewing Storm
                8310, -- Heroic: A Brewing Storm
                7257, -- Don't Shake the Keg
                7261, -- The Perfect Pour
                7258, -- Party of Six
            },
        },
        { -- A Little Patience
            499,
            (addon.GetLFGDungeonInfo(589)),
            {
                7988, -- A Little Patience
                7989, -- Bubbletrapped!
                7990, -- Cannonballer
                7992, -- I Used To Love Them
                7993, -- We've Been Dancin'
                7991, -- Which Came First?
            },
        },
        { -- Arena of Annihilation
            208,
            (addon.GetLFGDungeonInfo(511)),
            {
                7271, -- Arena of Annihilation
                7273, -- Beat the Heat
                7272, -- In the Eye of the Tiger
            },
        },
        { -- Assault on Zan'vess
            214,
            (addon.GetLFGDungeonInfo(593)),
            {
                8016, -- Assault on Zan'vess
                8017, -- For the Swarm
            },
        },
        { -- Blood in the Snow
            220,
            (addon.GetLFGDungeonInfo(646)),
            {
                8316, -- Blood in the Snow
                8312, -- Heroic: Blood in the Snow
                8329, -- Heed the Weed
                8330, -- Hekima's Heal-Halter
            },
        },
        { -- Brewmoon Festival
            209,
            (addon.GetLFGDungeonInfo(539)),
            {
                6923, -- Brewmoon Festival
                6931, -- Binan Village All-Star
                6930, -- Yaungolian Barbecue
            },
        },
        { -- Crypt of Forgotten Kings
            210,
            (addon.GetLFGDungeonInfo(504)),
            {
                7522, -- Crypt of Forgotten Kings
                8311, -- Heroic: Crypt of Forgotten Kings
                7276, -- Fancy Footwork
                7275, -- It's a Trap!
                8368, -- Fight Anger with Anger
            },
        },
        { -- Dagger in the Dark
            215,
            (addon.GetLFGDungeonInfo(616)),
            {
                8009, -- Dagger in the Dark
                7987, -- No Egg Left Behind
                7984, -- Watery Grave
                7986, -- You Mean That Wasn't a Void Zone?
            },
        },
        { -- Dark Heart of Pandaria
            221,
            (addon.GetLFGDungeonInfo(647)),
            {
                8317, -- Dark Heart of Pandaria
                8318, -- Heroic: Dark Heart of Pandaria
                8319, -- Accelerated Archaeology
            },
        },
        { -- Domination Point
            218,
            (addon.GetLFGDungeonInfo(595)),
            {
                8013, -- Domination Point
                8014, -- Number Five Is Alive
                8015, -- Waste Not, Want Not
            },
        },
        { -- Greenstone Village
            211,
            (addon.GetLFGDungeonInfo(492)),
            {
                7265, -- Greenstone Village
                7267, -- Perfect Delivery
                7266, -- Save it for Later
            },
        },
        { -- Lion's Landing
            216,
            (addon.GetLFGDungeonInfo(590)),
            {
                8010, -- Lion's Landing
                8011, -- Number Five Is Alive
                8012, -- Waste Not, Want Not
            },
        },
        { -- The Secrets of Ragefire
            222,
            (addon.GetLFGDungeonInfo(649)),
            {
                8294, -- The Secrets of Ragefire
                8327, -- Heroic: The Secrets of Ragefire
                8295, -- The Few, the Proud, the Gob Squad
            },
        },
        { -- Theramore's Fall
            212,
            (addon.GetLFGDungeonInfo(566)),
            {
                7523, -- Theramore's Fall
                7524, -- Theramore's Fall
                7526, -- Kite Fight
                7529, -- Kite Fight
                7527, -- No Tank You
                7530, -- No Tank You
                7467, -- Theramore's Fall
                7468, -- Theramore's Fall
            },
        },
        { -- Unga Ingoo
            213,
            (addon.GetLFGDungeonInfo(499)),
            {
                7249, -- Unga Ingoo
                7232, -- The Keg Runner
                7239, -- Monkey in the Middle
                7248, -- Monkey See, Monkey Kill
                7231, -- Spill No Evil
            },
        },
        { -- Battle on the High Seas
            219,
            (addon.GetLFGDungeonInfo(655)),
            {
                8314, -- Battle on the High Seas
                8315, -- Battle on the High Seas
                8364, -- Heroic: Battle on the High Seas
                8366, -- Heroic: Battle on the High Seas
                8347, -- Keep those Bombs Away! (From Me)
            },
        },
        {
            6943, -- Queuing Spree
            7385, -- Pub Crawl
            6874, -- Scenaturday
            7509, -- Scenaturday
        },
    },
    { -- Proving Grounds
        490,
        addon.GetCategoryInfoTitle(15222),
        {
            9572, -- Proving Yourself: Bronze Damage
            9573, -- Proving Yourself: Silver Damage
            9574, -- Proving Yourself: Gold Damage
            9575, -- Proving Yourself: Endless Damage (Wave 10)
            9576, -- Proving Yourself: Endless Damage (Wave 20)
            9577, -- Proving Yourself: Endless Damage (Wave 30)
            9578, -- Proving Yourself: Bronze Tank
            9579, -- Proving Yourself: Silver Tank
            9580, -- Proving Yourself: Gold Tank
            9581, -- Proving Yourself: Endless Tank (Wave 10)
            9582, -- Proving Yourself: Endless Tank (Wave 20)
            9583, -- Proving Yourself: Endless Tank (Wave 30)
            9584, -- Proving Yourself: Bronze Healer
            9585, -- Proving Yourself: Silver Healer
            9586, -- Proving Yourself: Gold Healer
            9587, -- Proving Yourself: Endless Healer (Wave 10)
            9588, -- Proving Yourself: Endless Healer (Wave 20)
            9589, -- Proving Yourself: Endless Healer (Wave 30)
            9590, -- You're Doing it Wrong
            9597, -- You're Really Doing It Wrong
            8486, -- Proving Yourself: Bronze Damage (Level 90)
            8491, -- Proving Yourself: Silver Damage (Level 90)
            8496, -- Proving Yourself: Gold Damage (Level 90)
            8501, -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
            8504, -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
            8507, -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
            8487, -- Proving Yourself: Bronze Tank (Level 90)
            8492, -- Proving Yourself: Silver Tank (Level 90)
            8497, -- Proving Yourself: Gold Tank (Level 90)
            8502, -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
            8505, -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
            8508, -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
            8488, -- Proving Yourself: Bronze Healer (Level 90)
            8493, -- Proving Yourself: Silver Healer (Level 90)
            8498, -- Proving Yourself: Gold Healer (Level 90)
            8503, -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
            8506, -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
            8509, -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
            8697, -- You're Doing it Wrong (Level 90)
            8812, -- You're Really Doing It Wrong (Level 90)
        },
    },
    {
        6926, -- Tranquil Master
        7533, -- Chapter I: Trial of the Black Prince
        8030, -- A Test of Valor
        8031, -- A Test of Valor
        7534, -- Chapter II: Wrathion's War
        8008, -- Chapter II: Wrathion's War
        7535, -- Chapter III: Two Princes
        7536, -- Chapter IV: Celestial Blessings
        8325, -- Chapter V: Judgment of the Black Prince
        8306, -- Hordebreaker
        8307, -- Darkspear Revolutionary
    },
});