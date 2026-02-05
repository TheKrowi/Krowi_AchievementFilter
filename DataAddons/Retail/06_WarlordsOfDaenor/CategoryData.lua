local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Warlords of Dreanor
    223,
    addon.GetCategoryInfoTitle(15233),
    { -- Zones
        449,
        addon.L["Zones"],
        { -- Draenor
            486,
            addon.GetMapName(572),
            { -- Quests
                487,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8921, -- Welcome to Draenor
                    8922, -- Welcome to Draenor
                    9491, -- The Garrison Campaign
                    9492, -- The Garrison Campaign
                    9564, -- Securing Draenor
                    9562, -- Securing Draenor
                    9833, -- Loremaster of Draenor
                    9923, -- Loremaster of Draenor
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                488,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    9726, -- Treasure Hunter
                    9727, -- Expert Treasure Hunter
                    10348, -- Master Treasure Hunter
                    9728, -- Grand Treasure Hunter
                    9502, -- Draenor Cuisine
                    14728, -- To All the Squirrels Through Time and Space
                    8935, -- Draenor Explorer
                },
            },
            { -- Reputation
                489,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9477, -- Savage Friends
                    9478, -- Savage Friends
                },
            },
            {
                10053, -- I Found Pepe!
            },
        },
        { -- Shadowmoon Valley
            450,
            addon.GetMapName(539),
            { -- Quests
                457,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8845, -- As I Walk Through the Valley of the Shadow of Moon
                    9602, -- Shoot For the Moon
                    9528, -- On the Shadow's Trail
                    9433, -- A-VOID-ance
                    9434, -- One of Us! One of Us!
                    9432, -- Would You Like a Pamphlet?
                    9436, -- It's the Stones!
                    9435, -- Take From Them Everything
                    9437, -- A Demidos of Reality
                    9483, -- I Was Framed!
                    9479, -- You Can't Make a Giant Omelette...
                    9481, -- You Have Been Rylakinated!
                },
            },
            { -- Exploration
                458,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8938, -- Explore Shadowmoon Valley
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                460,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9470, -- Council of Exarchs
                },
            },
        },
        { -- Frostfire Ridge
            451,
            addon.GetMapName(525),
            { -- Quests
                461,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8671, -- You'll Get Caught Up In The... Frostfire!
                    9606, -- Frostfire Fridge
                    9529, -- On the Shadow's Trail
                    9533, -- Breaker of Chains
                    9530, -- Writing in the Snow
                    9531, -- Writing in the Snow
                    9534, -- Delectable Ogre Delicacies
                    9537, -- By Fire Be... Merged?
                    9536, -- Slagnarok
                    9535, -- That Was Entirely Unnecessary
                    9710, -- Poisoning the Well
                    9711, -- Planned to Fail
                },
            },
            { -- Exploration
                462,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8937, -- Explore Frostfire Ridge
                },
            },
            { -- Reputation
                464,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9471, -- Frostwolf Orcs
                },
            },
        },
        { -- Gorgrond
            452,
            addon.GetMapName(543),
            { -- Quests
                465,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8923, -- Putting the Gore in Gorgrond
                    8924, -- Putting the Gore in Gorgrond
                    9607, -- Make It a Bonus
                    9655, -- Fight the Power
                    9656, -- In Plain Sight
                    9659, -- Iron Wings
                    9678, -- Ancient No More
                    9667, -- Burn It to the Ground
                    9654, -- Mean and Green
                    9658, -- Pillars of Draenor
                    9663, -- Picky Palate
                },
            },
            { -- Exploration
                466,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8939, -- Explore Gorgrond
                    9400, -- Gorgrond Monster Hunter
                    9401, -- Shredder Maniac
                    9402, -- Prove Your Strength
                },
            },
            { -- Reputation
                468,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9475, -- Laughing Skull Orcs
                },
            },
            {
                9423, -- Goliaths of Gorgrond
            },
        },
        { -- Talador
            453,
            addon.GetMapName(535),
            { -- Quests
                469,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8920, -- Don't Let the Tala-door Hit You on the Way Out
                    8919, -- Don't Let the Tala-door Hit You on the Way Out
                    9674, -- I Want More Talador
                    9633, -- Cut off the Head
                    9638, -- Heralds of the Legion
                    9635, -- Bobbing for Orcs
                    9634, -- Charged Up
                    9636, -- United We Stand
                    9632, -- The Power Is Yours
                    9637, -- Poor Communication
                    9486, -- Goodness Gracious
                },
            },
            { -- Exploration
                470,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8940, -- Explore Talador
                },
            },
            { -- Reputation
                472,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9476, -- Sha'tari Defense
                },
            },
        },
        { -- Spires of Arak
            454,
            addon.GetMapName(542),
            { -- Quests
                473,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8925, -- Between Arak and a Hard Place
                    8926, -- Between Arak and a Hard Place
                    9605, -- Arak Star
                    9612, -- Eggs in One Basket
                    9613, -- Fish Gotta Swim, Birds Gotta Eat
                    9601, -- King of the Monsters
                    9600, -- Monster Mash
                },
            },
            { -- Exploration
                474,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8941, -- Explore Spires of Arak
                },
            },
            { -- Reputation
                476,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9469, -- Arakkoa Outcasts
                    9072, -- Mantle of the Talon King
                },
            },
            {
                9425, -- So Grossly Incandescent
            },
        },
        { -- Nagrand
            455,
            addon.GetMapName(550),
            { -- Quests
                477,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    8927, -- Nagrandeur
                    8928, -- Nagrandeur
                    9615, -- With a Nagrand Cherry On Top
                    9610, -- History of Violence
                    9571, -- Broke Back Precipice
                    9548, -- Buried Treasures
                    9541, -- The Song of Silence
                    9617, -- Making the Cut
                },
            },
            { -- Exploration
                478,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    8942, -- Explore Nagrand
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                480,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    9472, -- Steamwheedle Preservation Society
                },
            },
        },
        { -- Tanaan Jungle
            456,
            addon.GetMapName(534),
            { -- Quests
                481,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10067, -- In Pursuit of Gul'dan
                    10074, -- In Pursuit of Gul'dan
                    10068, -- Draenor's Last Stand
                    10075, -- Draenor's Last Stand
                    10072, -- Rumble in the Jungle
                    10265, -- Rumble in the Jungle
                },
            },
            { -- Exploration
                482,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10261, -- Jungle Treasure Hunter
                    10262, -- Jungle Treasure Master
                    10260, -- Explore Tanaan Jungle
                    10069, -- I Came, I Clawed, I Conquered
                    10061, -- Hellbane
                    10259, -- Jungle Hunter
                    10070, -- Jungle Stalker
                    10334, -- Predator
                },
            },
            { -- Reputation
                484,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10349, -- Tanaan Diplomat
                    10350, -- Tanaan Diplomat
                },
            },
            {
                10071, -- The Legion Will NOT Conquer All
            },
        },
    },
    { -- Dungeons
        224,
        addon.GetCategoryInfoTitle(15272),
        { -- Bloodmaul Slag Mines
            226,
            addon.GetInstanceInfoName(385),
            {
                9005, -- Come With Me If You Want to Live
                8993, -- A Gift of Earth and Fire
                9008, -- Is Draenor on Fire?
                9037, -- Bloodmaul Slag Mines
                9046, -- Heroic: Bloodmaul Slag Mines
                10076, -- Mythic: Bloodmaul Slag Mines
                8875, -- Bloodmaul Slag Mines Challenger
                8876, -- Bloodmaul Slag Mines: Bronze
                8877, -- Bloodmaul Slag Mines: Silver
                8878, -- Bloodmaul Slag Mines: Gold
                9620, -- Challenge Master: Bloodmaul Slag Mines
            },
        },
        { -- Iron Docks
            227,
            addon.GetInstanceInfoName(558),
            {
                9081, -- Expert Timing
                9083, -- Militaristic, Expansionist
                9082, -- Take Cover!
                9038, -- Iron Docks
                9047, -- Heroic: Iron Docks
                10079, -- Mythic: Iron Docks
                8997, -- Iron Docks Challenger
                8998, -- Iron Docks: Bronze
                8999, -- Iron Docks: Silver
                9000, -- Iron Docks: Gold
                9621, -- Challenge Master: Iron Docks
                15694, -- Keystone Hero: Iron Docks
            },
        },
        { -- Auchindoun
            228,
            addon.GetInstanceInfoName(547),
            {
                9023, -- ...They All Fall Down
                9551, -- Demon's Souls
                9552, -- No Tag-backs!
                9039, -- Auchindoun
                9049, -- Heroic: Auchindoun
                10080, -- Mythic: Auchindoun
                8879, -- Auchindoun Challenger
                8880, -- Auchindoun: Bronze
                8881, -- Auchindoun: Silver
                8882, -- Auchindoun: Gold
                9622, -- Challenge Master: Auchindoun
                9924, -- Field Photographer
            },
        },
        { -- Skyreach
            229,
            addon.GetInstanceInfoName(476),
            {
                9033, -- Ready for Raiding IV
                9035, -- I Saw Solis
                9034, -- Magnify... Enhance
                9036, -- Monomania
                8843, -- Skyreach
                8844, -- Heroic: Skyreach
                10081, -- Mythic: Skyreach
                61272, -- Keystone Hero: Skyreach
                61594, -- Keystone Victor: Skyreach
                8871, -- Skyreach Challenger
                8872, -- Skyreach: Bronze
                8873, -- Skyreach: Silver
                8874, -- Skyreach: Gold
                9623, -- Challenge Master: Skyreach
            },
        },
        { -- Grimrail Depot
            230,
            addon.GetInstanceInfoName(536),
            {
                9024, -- This Is Why We Can't Have Nice Things
                9007, -- No Ticket
                9043, -- Grimrail Depot
                9052, -- Heroic: Grimrail Depot
                10082, -- Mythic: Grimrail Depot
                8887, -- Grimrail Depot Challenger
                8888, -- Grimrail Depot: Bronze
                8889, -- Grimrail Depot: Silver
                8890, -- Grimrail Depot: Gold
                9625, -- Challenge Master: Grimrail Depot
                15695, -- Keystone Hero: Grimrail Depot
            },
        },
        { -- The Everbloom
            231,
            addon.GetInstanceInfoName(556),
            {
                9017, -- Water Management
                9493, -- They Burn, Burn, Burn
                9223, -- Weed Whacker
                9044, -- The Everbloom
                9053, -- Heroic: The Everbloom
                10083, -- Mythic: The Everbloom
                9001, -- The Everbloom Challenger
                9002, -- The Everbloom: Bronze
                9003, -- The Everbloom: Silver
                9004, -- The Everbloom: Gold
                9624, -- Challenge Master: The Everbloom
                19083, -- Keystone Hero: The Everbloom
            },
        },
        { -- Shadowmoon Burial Grounds
            232,
            addon.GetInstanceInfoName(537),
            {
                9018, -- What's Your Sign?
                9025, -- Icky Ichors
                9026, -- Souls of the Lost
                9041, -- Shadowmoon Burial Grounds
                9054, -- Heroic: Shadowmoon Burial Grounds
                10084, -- Mythic: Shadowmoon Burial Grounds
                8883, -- Shadowmoon Burial Grounds Challenger
                8884, -- Shadowmoon Burial Grounds: Bronze
                8885, -- Shadowmoon Burial Grounds: Silver
                8886, -- Shadowmoon Burial Grounds: Gold
                9626, -- Challenge Master: Shadowmoon Burial Grounds
                16660, -- Keystone Hero: Shadowmoon Burial Grounds
            },
        },
        { -- Upper Blackrock Spire
            233,
            addon.GetInstanceInfoName(559),
            {
                9045, -- Magnets, How Do They Work?
                9058, -- Leeeeeeeeeeeeeroy...?
                9056, -- Bridge Over Troubled Fire
                9057, -- Dragonmaw? More Like Dragonfall!
                9042, -- Upper Blackrock Spire
                9055, -- Heroic: Upper Blackrock Spire
                10085, -- Mythic: Upper Blackrock Spire
                8891, -- Upper Blackrock Spire Challenger
                8892, -- Upper Blackrock Spire: Bronze
                8893, -- Upper Blackrock Spire: Silver
                8894, -- Upper Blackrock Spire: Gold
                9627, -- Challenge Master: Upper Blackrock Spire
            },
        },
        {
            9391, -- Draenor Dungeon Hero
            9619, -- Savage Hero
            9396, -- Glory of the Draenor Hero
            8895, -- Challenge Warlord
            8897, -- Challenge Warlord: Bronze
            8898, -- Challenge Warlord: Silver
            8899, -- Challenge Warlord: Gold
        },
    },
    { -- Raids
        225,
        addon.GetCategoryInfoTitle(15271),
        { -- Highmaul
            234,
            addon.GetInstanceInfoName(477),
            { -- Glory
                886,
                addon.L["Glory"],
                {
                    8948, -- Flame On!
                    8947, -- Hurry Up, Maggot!
                    8974, -- More Like Wrecked-us
                    8975, -- A Fungus Among Us
                    8958, -- Brothers in Arms
                    8976, -- Pair Annihilation
                    8977, -- Lineage of Power
                },
            },
            { -- Mythic
                887,
                addon.L["Mythic"],
                {
                    8949, -- Mythic: Kargath Bladefist
                    8960, -- Mythic: The Butcher
                    8961, -- Mythic: Tectus
                    8962, -- Mythic: Brackenspore
                    8963, -- Mythic: Twin Ogron
                    8964, -- Mythic: Ko'ragh
                    8965, -- Mythic: Imperator's Fall
                },
            },
            {
                8986, -- The Walled City
                8987, -- Arcane Sanctum
                8988, -- Imperator's Fall
                9441, -- Ahead of the Curve: Imperator's Fall
                9442, -- Cutting Edge: Imperator's Fall
            },
        },
        { -- Blackrock Foundry
            235,
            addon.GetInstanceInfoName(457),
            { -- Glory
                888,
                addon.L["Glory"],
                {
                    8979, -- He Shoots, He Ores
                    8978, -- The Iron Price
                    8930, -- Ya, We've Got Time...
                    8980, -- Stamp Stamp Revolution
                    8929, -- The Steel Has Been Brought
                    8983, -- Would You Give Me a Hand?
                    8981, -- Fain Would Lie Down
                    8982, -- There's Always a Bigger Train
                    8984, -- Be Quick or Be Dead
                    8952, -- Ashes, Ashes...
                },
            },
            { -- Mythic
                889,
                addon.L["Mythic"],
                {
                    8967, -- Mythic: Oregorger
                    8966, -- Mythic: Gruul
                    8970, -- Mythic: Blast Furnace
                    8968, -- Mythic: Hans'gar and Franzok
                    8932, -- Mythic: Flamebender Ka'graz
                    8971, -- Mythic: Kromog
                    8956, -- Mythic: Beastlord Darmac
                    8969, -- Mythic: Operator Thogar
                    8972, -- Mythic: Iron Maidens
                    8973, -- Mythic: Blackhand's Crucible
                },
            },
            {
                8989, -- Slagworks
                8990, -- Black Forge
                8991, -- Iron Assembly
                8992, -- Blackhand's Crucible
                9444, -- Ahead of the Curve: Blackhand's Crucible
                9443, -- Cutting Edge: Blackhand's Crucible
                11740, -- Make it W-orc W-orc
            },
        },
        { -- Hellfire Citadel
            236,
            addon.GetInstanceInfoName(669),
            { -- Glory
                890,
                addon.L["Glory"],
                {
                    10026, -- Nearly Indestructible
                    10057, -- Turning the Tide
                    10013, -- Waves Came Crashing Down All Around
                    10054, -- Don't Fear the Reaper
                    9972, -- A Race Against Slime
                    9979, -- Get In My Belly!
                    9988, -- Pro Toss
                    10086, -- I'm a Soul Man
                    9989, -- Non-Lethal Enforcer
                    10012, -- This Land Was Green and Good Until...
                    10087, -- You Gotta Keep 'em Separated
                    10030, -- Bad Manner(oth)
                    10073, -- Echoes of Doomfire
                },
            },
            { -- Mythic
                891,
                addon.L["Mythic"],
                {
                    10027, -- Mythic: Hellfire Assault
                    10032, -- Mythic: Iron Reaver
                    10033, -- Mythic: Kormrok
                    10034, -- Mythic: Hellfire High Council
                    10035, -- Mythic: Kilrogg Deadeye
                    10253, -- Mythic: Gorefiend
                    10037, -- Mythic: Shadow-Lord Iskar
                    10040, -- Mythic: Socrethar the Eternal
                    10041, -- Mythic: Tyrant Velhari
                    10038, -- Mythic: Fel Lord Zakuun
                    10039, -- Mythic: Xhul'horac
                    10042, -- Mythic: Mannoroth
                    10043, -- Mythic: Archimonde
                },
            },
            {
                10023, -- Hellbreach
                10024, -- Halls of Blood
                10025, -- Bastion of Shadows
                10020, -- Destructor's Rise
                10019, -- The Black Gate
                9680, -- Time is a Flat Circle
                10044, -- Ahead of the Curve: The Black Gate
                10045, -- Cutting Edge: The Black Gate
                11631, -- Extreme Makeover: Fel Edition
            },
        },
        {
            9619, -- Savage Hero
            8985, -- Glory of the Draenor Raider
            10149, -- Glory of the Hellfire Raider
        },
    },
    { -- Professions
        1155,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1472,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                9409, -- Draenor Archaeologist
                9413, -- Strength and Honor
                9414, -- Ogre Observer
                9415, -- Secrets of Skettis
                9410, -- Unite the Clans
                9411, -- Highmaul Historian
                9412, -- Arakkoa Archivist
                9419, -- Draenor Curator
            },
        },
        { -- Cooking
            1481,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                9500, -- Draenor Cook
                9501, -- The Draenor Gourmet
            },
        },
        { -- Engineering
            1490,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                9071, -- Inspector Gadgetzan
            },
        },
        { -- Fishing
            1496,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                9503, -- Draenor Fisherman
                9455, -- Fire Ammonite Angler
                9456, -- Abyssal Gulper Eel Angler
                9457, -- Blackwater Whiptail Angler
                9458, -- Blind Lake Sturgeon Angler
                9459, -- Fat Sleeper Angler
                9460, -- Jawless Skulker Angler
                9461, -- Sea Scorpion Angler
                9462, -- Draenor Angler
                9547, -- Everything Is Awesome!
            },
        },
        { -- Herbalism
            1501,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                9454, -- Draenic Seed Collector
            },
        },
        { -- Mining
            1515,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                9453, -- Draenic Stone Collector
            },
        },
        {
            9464, -- Professional Draenor Master
            9507, -- Working in Draenor
            9087, -- Draenor Master of All
            62362, -- Lumberjack Warlord
            9505, -- Draenor Medic
            9506, -- Savage Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        548,
        addon.GetCategoryInfoTitle(15117),
        {
            9685, -- Draenor Safari
            9069, -- An Awfully Big Adventure
            9463, -- Draenic Pet Battler
            9724, -- Taming Draenor
            10052, -- Tiny Terrors in Tanaan
        },
    },
    { -- Brawler's Guild
        791,
        addon.L["Brawler's Guild"],
        {
            9168, -- You Are Not Your $#*@! Legplates (Season 2)
            9172, -- You Are Not Your $#*@! Legplates (Season 2)
            9169, -- The Second Rule of Brawler's Guild (Season 2)
            9173, -- The Second Rule of Brawler's Guild (Season 2)
            9170, -- Brawlin' and Shot Callin' (Season 2)
            9174, -- Brawlin' and Shot Callin' (Season 2)
            9171, -- Now You're Just Showing Off (Season 2)
            9175, -- Now You're Just Showing Off (Season 2)
            8339, -- Collect Your Deck (Season 2)
            8342, -- Collect Your Deck (Season 2)
            9176, -- Deck Your Collection (Season 2)
            9177, -- Deck Your Collection (Season 2)
            7949, -- Rabble Rabble Rabble (Season 2)
            7950, -- Rabble Rabble Rabble (Season 2)
            7943, -- I'm Your Number One Fan (Season 2)
            7945, -- Haters Gonna Hate (Season 2)
            7944, -- Bottle Service (Season 2)
            7947, -- The First Rule of Brawler's Guild (Season 1 or 2)
            7948, -- The First Rule of Brawler's Guild (Season 1 or 2)
        },
    },
    { -- Garrison
        432,
        addon.L["Garrison"],
        { -- Quests
            485,
            addon.GetCategoryInfoTitle(96),
            true,
            {
                9825, -- Master Relic Hunter
                9836, -- Master Relic Hunter
            },
        },
        { -- Buildings
            852,
            addon.L["Buildings"],
            { -- Stables
                854,
                addon.L["Stables"],
                true,
                {
                    9526, -- Master of Mounts
                    9539, -- Advanced Husbandry
                    9705, -- Advanced Husbandry
                    9540, -- The Stable Master
                    9706, -- The Stable Master
                },
            },
            { -- Gladiator's Sanctum
                853,
                addon.L["Gladiator's Sanctum"],
                true,
                {
                    9517, -- Nemesis: Death Stalker
                    9513, -- Nemesis: Scourge of the Kaldorei
                    9516, -- Nemesis: Slayer of Sin'dorei
                    9509, -- Nemesis: Draenei Destroyer
                    9521, -- Nemesis: The Butcher
                    9511, -- Nemesis: Gnomebane
                    9522, -- Nemesis: Troll Hunter
                    9510, -- Nemesis: Dwarfstalker
                    9519, -- Nemesis: Orcslayer
                    9512, -- Nemesis: Manslayer
                    9518, -- Nemesis: Killer of Kezan
                    9515, -- Nemesis: Worgen Hunter
                    9520, -- Nemesis: Huojin's Fall
                    9514, -- Nemesis: Terror of the Tushui
                    9639, -- Fight, Kill, Salute!
                    9508, -- Warlord of Draenor
                    9738, -- Warlord of Draenor
                },
            },
            { -- Shipyard
                856,
                addon.L["Shipyard"],
                true,
                {
                    10177, -- Set Sail!
                    10169, -- Naval Fleet
                    10168, -- Naval Armada
                    10170, -- Seaman
                    10172, -- Petty Officer
                    10255, -- Petty Officer
                    10173, -- Fleet Commander
                    10275, -- Fleet Commander
                    10174, -- Admiral
                    10276, -- Admiral
                    10156, -- Naval Combat Specialist
                    10154, -- Naval Combat Expert
                    10159, -- Naval Treasure Specialist
                    10160, -- Naval Treasure Expert
                    10161, -- Naval Siege Specialist
                    10155, -- Naval Siege Expert
                    10162, -- Naval Training Specialist
                    10163, -- Naval Training Expert
                    10017, -- Naval Bonus Specialist
                    10036, -- Naval Bonus Expert
                    10164, -- Master of the Seas
                    10165, -- Ironsides
                    10166, -- Naval Mechanics
                    10256, -- Charting a Course
                    10258, -- Charting a Course
                    10167, -- Exploring the High Seas
                    10307, -- Exploring the High Seas
                },
            },
            {
                9125, -- Draftsman
                9126, -- Master Draftsman
                9128, -- Grand Master Draftsman
                9095, -- Builder
                9096, -- Master Builder
                9097, -- Keepin' Busy
                9094, -- Garrison Architect
                9487, -- Got My Mind On My Draenor Money
                9076, -- Choppin' Some Logs
                9077, -- Choppin' Some More Logs
                9080, -- Choppin' Even More Logs
                9078, -- Choppin' Even More Logs
                9429, -- Upgrading the Mill
                9099, -- Time for an Upgrade
                9098, -- Movin' On Up
                9405, -- Working Some Orders
                9406, -- Working More Orders
                9407, -- Working Many Orders
                9450, -- The Trap Game
                9565, -- Master Trapper
                9451, -- Trapper's Delight
                9452, -- Trap Superstar
                9468, -- Salvaging Pays Off
                9495, -- The Bone Collector
                9497, -- Finding Your Waystones
                9498, -- Wingman
                9499, -- Wingmen
                9538, -- Intro to Husbandry
                9527, -- Terrific Technology
                9703, -- Stay Awhile and Listen
                9453, -- Draenic Stone Collector
                9454, -- Draenic Seed Collector
            },
        },
        { -- Invasions
            855,
            addon.L["Invasions"],
            true,
            {
                9167, -- Invasion Specialist
                9543, -- Invasion? What Invasion?
                9244, -- Invasions Are Better with Friends
                9205, -- Iron Horde Invasion
                9206, -- Shadowmoon Clan Invasion
                9203, -- Shadow Council Invasion
                9204, -- Ogre Invasion
                9207, -- Goren Invasion
                9208, -- Botani Invasion
                9162, -- Bronze Defender
                9164, -- Silver Defender
                9165, -- Golden Defender
                9826, -- Platinum Defender
                9209, -- Master Defender
                9827, -- Impervious Defender
                9181, -- Save Those Buildings!
                9858, -- Master and Commander
            },
        },
        {
            9100, -- More Plots
            9545, -- More Plots
            9101, -- Even More Plots
            9546, -- Even More Plots
            9210, -- Garrison Buddies
            9132, -- Garrison Buddies
            8933, -- Staying Regular
            9928, -- Don't Call Me Junior
            9901, -- Don't Call Me Junior
            9828, -- Ten Hit Tunes
            9897, -- Ten Hit Tunes
            9912, -- Azeroth's Top Twenty Tunes
            9914, -- Azeroth's Top Twenty Tunes
            10015, -- Full Discography
            10016, -- Full Discography
            9107, -- Follow the Leader
            9108, -- Where You Go, They Will Follow
            9109, -- Fearless Leader
            9494, -- Commander
            9110, -- Following Up
            9111, -- Raising the Bar
            9129, -- Filling the Ranks
            9130, -- A Rare Friend
            9131, -- An Epic Buddy
            9211, -- My Item Level Is Higher than Yours
            9212, -- My Item Level Is Way Higher than Yours
            9213, -- Item Level Army
            9243, -- Item Level Force
            9152, -- It's an Invasion!
            9133, -- On a Mission
            9134, -- On a Few Missions
            9138, -- On a Lot of Missions
            9139, -- On a Massive Number of Missions
            9140, -- On a Metric Ton of Missions
            9141, -- A Rare Mission
            9142, -- Keeping It Rare
            9143, -- The Rarer the Better
            9145, -- Treasure Mission Specialist
            9524, -- Treasure Master
            9146, -- Patrol Mission Specialist
            9523, -- Patrolling Draenor
            9147, -- Mission Specialist
            9150, -- Exploration Mission Specialist
            9900, -- Exploration Mission Master
            9246, -- Master Draenor Crafter
            9248, -- Defender of Draenor
            9630, -- Defender of Draenor
            9255, -- Mythic Draenor Raider
            9631, -- Mythic Draenor Raider
            9264, -- Draenor Pet Brawler
            9265, -- Master of Apexis
        },
    },
    {
        9838, -- What A Strange, Interdimensional Trip It's Been
        9640, -- Chapter I: Call of the Archmage
        9641, -- Chapter II: Gul'dan Strikes Back
        9642, -- Chapter III: The Foundry Falls
        10021, -- Chapter IV: Darkness Incarnate
        10148, -- Chapter IV: Darkness Incarnate
        10018, -- Draenor Pathfinder
    },
});