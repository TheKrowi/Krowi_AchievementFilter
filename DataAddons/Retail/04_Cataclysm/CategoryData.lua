local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Cataclysm
    129,
    addon.GetCategoryInfoTitle(15072),
    { -- Zones
        550,
        addon.L["Zones"],
        { -- Vashj'ir
            551,
            addon.GetMapName(203),
            { -- Quests
                557,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4869, -- Sinking into Vashj'ir
                    4982, -- Sinking into Vashj'ir
                    5452, -- Visions of Vashj'ir Past
                    5318, -- 20,000 Leagues Under the Sea
                    5319, -- 20,000 Leagues Under the Sea
                },
            },
            { -- Exploration
                564,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    4825, -- Explore Vashj'ir
                    4975, -- From Hell's Heart I Stab at Thee
                    9924, -- Field Photographer
                },
            },
        },
        { -- Mount Hyjal
            552,
            addon.GetMapName(198),
            { -- Quests
                558,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4870, -- Coming Down the Mountain
                    4959, -- Beware of the 'Unbeatable?' Pterodactyl
                    5860, -- The 'Unbeatable?' Pterodactyl: BEATEN.
                    5483, -- Bounce
                    5859, -- Legacy of Leyara
                    5866, -- The Molten Front Offensive
                    5861, -- The Fiery Lords of Sethria's Roost
                    5870, -- Fireside Chat
                    5862, -- Ludicrous Speed
                    5868, -- And the Meek Shall Inherit Kalimdor
                    5864, -- Gang War
                    5865, -- Have... Have We Met?
                    5869, -- Infernal Ambassadors
                    5879, -- Veteran of the Molten Front
                },
            },
            { -- Exploration
                565,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    4863, -- Explore Hyjal
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                571,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    4882, -- The Guardians of Hyjal
                },
            },
        },
        { -- Deepholm
            553,
            addon.GetMapName(207),
            { -- Quests
                559,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4871, -- Deep into Deepholm
                    5445, -- Fungalophobia
                    5446, -- The Glop Family Line
                    5449, -- Rock Lover
                    5450, -- Fungal Frenzy
                    5447, -- My Very Own Broodmother
                },
            },
            { -- Exploration
                566,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    4864, -- Explore Deepholm
                    9924, -- Field Photographer
                },
            },
            { -- Reputation
                572,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    4883, -- Therazane
                },
            },
        },
        { -- Uldum
            554,
            addon.GetMapName(249),
            { -- Quests
                560,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4872, -- Unearthing Uldum
                    4961, -- In a Thousand Years Even You Might be Worth Something
                    5317, -- Help the Bombardier! I'm the Bombardier!
                },
            },
            { -- Exploration
                567,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    4865, -- Explore Uldum
                },
            },
            { -- Reputation
                574,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    4884, -- Ramkahen
                },
            },
            {
                5767, -- Scourer of the Eternal Sands
                4888, -- One Hump or Two?
            },
        },
        { -- Twilight Highlands
            555,
            addon.GetMapName(241),
            { -- Quests
                561,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    4873, -- Fading into Twilight
                    5501, -- Fading into Twilight
                    4960, -- Round Three. Fight!
                    5481, -- Wildhammer Tour of Duty
                    5482, -- Dragonmaw Tour of Duty
                    5320, -- King of the Mountain
                    5321, -- King of the Mountain
                    5451, -- Consumed by Nightmare
                    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
                },
            },
            { -- Exploration
                568,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    4866, -- Explore Twilight Highlands
                },
            },
            { -- Reputation
                573,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    948, -- Ambassador of the Alliance
                    762, -- Ambassador of the Horde
                    4885, -- Wildhammer Clan
                    4886, -- Dragonmaw Clan
                },
            },
            {
                61430, -- Crunching for Cultists
                42300, -- Two Minutes to Midnight
            }
        },
        { -- Molten Front
            556,
            addon.GetMapName(338),
            {
                5859, -- Legacy of Leyara
                5866, -- The Molten Front Offensive
                5867, -- Flawless Victory
                5871, -- Master of the Molten Flow
                5872, -- King of the Spider-Hill
                5874, -- Death From Above
                5873, -- Ready for Raiding II
                5879, -- Veteran of the Molten Front
            },
        },
        {
            4875, -- Loremaster of Cataclysm
            4827, -- Surveying the Damage
            5548, -- To All the Squirrels Who Cared for Me
            5754, -- Drown Your Sorrows
            5753, -- Cataclysmically Delicious
            4868, -- Cataclysm Explorer
            4881, -- The Earthen Ring
            7520, -- The Loremaster
        },
    },
    { -- Dungeons
        130,
        addon.GetCategoryInfoTitle(15272),
        { -- Blackrock Caverns
            132,
            addon.GetInstanceInfoName(66),
            {
                5281, -- Crushing Bones and Cracking Skulls
                5282, -- Arrested Development
                5283, -- Too Hot to Handle
                5284, -- Ascendant Descending
                4833, -- Blackrock Caverns
                5060, -- Heroic: Blackrock Caverns
                41139, -- Protocol Inferno: Blackrock Caverns
            },
        },
        { -- Throne of the Tides
            133,
            addon.GetInstanceInfoName(65),
            {
                5285, -- Old Faithful
                5286, -- Prince of Tides
                4839, -- Throne of the Tides
                5061, -- Heroic: Throne of the Tides
                41140, -- Protocol Inferno: Throne of the Tides
                19082, -- Keystone Hero: Throne of the Tides
            },
        },
        { -- The Stonecore
            134,
            addon.GetInstanceInfoName(67),
            {
                5287, -- Rotten to the Core
                4846, -- The Stonecore
                5063, -- Heroic: The Stonecore
                41141, -- Protocol Inferno: The Stonecore
            },
        },
        { -- The Vortex Pinnacle
            135,
            addon.GetInstanceInfoName(68),
            {
                5289, -- Extra Credit Bonus Stage
                5288, -- No Static at All
                4847, -- The Vortex Pinnacle
                5064, -- Heroic: The Vortex Pinnacle
                41142, -- Protocol Inferno: The Vortex Pinnacle
                17847, -- Keystone Hero: The Vortex Pinnacle
            },
        },
        { -- Grim Batol
            136,
            addon.GetInstanceInfoName(71),
            {
                5297, -- Umbrage for Umbriss
                5298, -- Don't Need to Break Eggs to Make an Omelet
                4840, -- Grim Batol
                5062, -- Heroic: Grim Batol
                41143, -- Protocol Inferno: Grim Batol
                20588, -- Keystone Hero: Grim Batol
            },
        },
        { -- Halls of Origination
            137,
            addon.GetInstanceInfoName(70),
            {
                5293, -- I Hate That Song
                5294, -- Straw That Broke the Camel's Back
                5296, -- Faster Than the Speed of Light
                5295, -- Sun of a....
                4841, -- Halls of Origination
                5065, -- Heroic: Halls of Origination
                41144, -- Protocol Inferno: Halls of Origination
                9924, -- Field Photographer
            },
        },
        { -- Lost City of the Tol'vir
            138,
            addon.GetInstanceInfoName(69),
            {
                5291, -- Acrocalypse Now
                5290, -- Kill It With Fire!
                5292, -- Headed South
                4848, -- Lost City of the Tol'vir
                5066, -- Heroic: Lost City of the Tol'vir
                41145, -- Protocol Inferno: Lost City of the Tol'vir
            },
        },
        { -- Deadmines
            139,
            addon.GetInstanceInfoName(63),
            {
                5366, -- Ready for Raiding
                5367, -- Rat Pack
                5368, -- Prototype Prodigy
                5369, -- It's Frost Damage
                5370, -- I'm on a Diet
                5371, -- Vigorous VanCleef Vindicator
                628, -- Deadmines
                5083, -- Heroic: Deadmines
                41146, -- Protocol Inferno: Deadmines
                11856, -- Pet Battle Challenge: Deadmines
                9924, -- Field Photographer
            },
        },
        { -- Shadowfang Keep
            140,
            addon.GetInstanceInfoName(64),
            {
                5503, -- Pardon Denied
                5504, -- To the Ground!
                5505, -- Bullet Time
                631, -- Shadowfang Keep
                5093, -- Heroic: Shadowfang Keep
                41147, -- Protocol Inferno: Shadowfang Keep
                4627, -- X-45 Heartbreaker
            },
        },
        { -- Zul'Gurub
            141,
            addon.GetInstanceInfoName(76),
            {
                5743, -- It's Not Easy Being Green
                5762, -- Ohganot So Fast!
                5765, -- Here, Kitty Kitty...
                5759, -- Spirit Twister
                5744, -- Gurubashi Headhunter
                5768, -- Heroic: Zul'Gurub
            },
        },
        { -- Zul'Aman
            142,
            addon.GetInstanceInfoName(77),
            {
                5858, -- Bear-ly Made It
                5750, -- Tunnel Vision
                5761, -- Hex Mix
                5760, -- Ring Out!
                5769, -- Heroic: Zul'Aman
            },
        },
        { -- End Time
            143,
            addon.GetInstanceInfoName(184),
            {
                5995, -- Moon Guard
                6130, -- Severed Ties
                6117, -- Heroic: End Time
            },
        },
        { -- Well of Eternity
            144,
            addon.GetInstanceInfoName(185),
            {
                6127, -- Lazy Eye
                6070, -- That's Not Canon!
                6118, -- Heroic: Well of Eternity
            },
        },
        { -- Hour of Twilight
            145,
            addon.GetInstanceInfoName(186),
            {
                6132, -- Eclipse
                6119, -- Heroic: Hour of Twilight
            },
        },
        {
            4844, -- Cataclysm Dungeon Hero
            41148, -- Protocol Inferno: Terminated
            5506, -- Defender of a Shattered World
            4845, -- Glory of the Cataclysm Hero
        },
    },
    { -- Raids
        131,
        addon.GetCategoryInfoTitle(15271),
        { -- Baradin Hold
            146,
            addon.GetInstanceInfoName(75),
            {
                5416, -- Pit Lord Argaloth
                6045, -- Occu'thar
                6108, -- Alizabal
            },
        },
        { -- Blackwing Descent
            147,
            addon.GetInstanceInfoName(73),
            { -- Glory
                902,
                addon.L["Glory"],
                {
                    5306, -- Parasite Evening
                    5307, -- Achieve-a-tron
                    5309, -- Full of Sound and Fury
                    5308, -- Silence is Golden
                    5310, -- Aberrant Behavior
                    4849, -- Keeping it in the Family
                },
            },
            { -- Heroic
                903,
                addon.L["Heroic"],
                {
                    5094, -- Heroic: Magmaw
                    5107, -- Heroic: Omnotron Defense System
                    5115, -- Heroic: Chimaeron
                    5109, -- Heroic: Atramedes
                    5108, -- Heroic: Maloriak
                    5116, -- Heroic: Nefarian
                },
            },
            {
                4842, -- Blackwing Descent
                11754, -- Glamour of Twilight
                12079, -- Raiding with Leashes V: Cuteaclysm
            },
        },
        { -- The Bastion of Twilight
            148,
            addon.GetInstanceInfoName(72),
            { -- Glory
                904,
                addon.L["Glory"],
                {
                    5300, -- The Only Escape
                    4852, -- Double Dragon
                    5311, -- Elementary
                    5312, -- The Abyss Will Gaze Back Into You
                },
            },
            { -- Heroic
                905,
                addon.L["Heroic"],
                {
                    5118, -- Heroic: Halfus Wyrmbreaker
                    5117, -- Heroic: Valiona and Theralion
                    5119, -- Heroic: Ascendant Council
                    5120, -- Heroic: Cho'gall
                    5121, -- Heroic: Sinestra
                },
            },
            {
                4850, -- The Bastion of Twilight
                5313, -- I Can't Hear You Over the Sound of How Awesome I Am
                11754, -- Glamour of Twilight
                12079, -- Raiding with Leashes V: Cuteaclysm
            },
        },
        { -- Throne of the Four Winds
            149,
            addon.GetInstanceInfoName(74),
            {
                5304, -- Stay Chill
                5305, -- Four Play
                5122, -- Heroic: Conclave of Wind
                5123, -- Heroic: Al'Akir
                4851, -- Throne of the Four Winds
                12079, -- Raiding with Leashes V: Cuteaclysm
            },
        },
        { -- Firelands
            150,
            addon.GetInstanceInfoName(78),
            { -- Glory
                906,
                addon.L["Glory"],
                {
                    5821, -- Death from Above
                    5813, -- Do a Barrel Roll!
                    5810, -- Not an Ambi-Turner
                    5829, -- Bucket List
                    5830, -- Share the Pain
                    5799, -- Only the Penitent...
                },
            },
            { -- Heroic
                907,
                addon.L["Heroic"],
                {
                    5807, -- Heroic: Beth'tilac
                    5809, -- Heroic: Alysrazor
                    5808, -- Heroic: Lord Rhyolith
                    5806, -- Heroic: Shannox
                    5805, -- Heroic: Baleroc
                    5804, -- Heroic: Majordomo Fandral Staghelm
                    5803, -- Heroic: Ragnaros
                },
            },
            { -- Reputation
                576,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    5827, -- Avengers of Hyjal
                },
            },
            {
                5855, -- Ragnar-O's
                5802, -- Firelands
                11755, -- Hot Couture
                5839, -- Dragonwrath, Tarecgosa's Rest
                12079, -- Raiding with Leashes V: Cuteaclysm
            },
        },
        { -- Dragon Soul
            151,
            addon.GetInstanceInfoName(187),
            { -- Glory
                908,
                addon.L["Glory"],
                {
                    6174, -- Don't Stand So Close to Me
                    6128, -- Ping Pong Champion
                    6129, -- Taste the Rainbow!
                    6084, -- Minutes to Midnight
                    6105, -- Deck Defender
                    6133, -- Maybe He'll Get Dizzy...
                    6180, -- Chromatic Champion
                },
            },
            { -- Heroic
                909,
                addon.L["Heroic"],
                {
                    6109, -- Heroic: Morchok
                    6110, -- Heroic: Warlord Zon'ozz
                    6111, -- Heroic: Yor'sahj the Unsleeping
                    6112, -- Heroic: Hagara the Stormbinder
                    6113, -- Heroic: Ultraxion
                    6114, -- Heroic: Warmaster Blackhorn
                    6115, -- Heroic: Spine of Deathwing
                    6116, -- Heroic: Madness of Deathwing
                },
            },
            {
                6175, -- Holding Hands
                5518, -- Stood in the Fire
                6106, -- Siege of Wyrmrest Temple
                6107, -- Fall of Deathwing
                6177, -- Destroyer's End
                11756, -- Wardrobe of the Old Gods
                6181, -- Fangs of the Father
                12079, -- Raiding with Leashes V: Cuteaclysm
            },
        },
        {
            5506, -- Defender of a Shattered World
            4853, -- Glory of the Cataclysm Raider
            5828, -- Glory of the Firelands Raider
            6169, -- Glory of the Dragon Soul Raider
        },
    },
    { -- Professions
        1153,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1471,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                4923, -- Illustrious Grand Master Archaeologist
                5301, -- The Boy Who Would be King
            },
        },
        { -- Cooking
            1480,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                4916, -- Cataclysmic Cook
                5472, -- The Cataclysmic Gourmet
                5473, -- The Cataclysmic Gourmet
            },
        },
        { -- Fishing
            1497,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                4917, -- Cataclysmic Fisherman
            },
        },
        { -- Tailoring
            1527,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                5480, -- Preparing for Disaster
                18815, -- Speed Dreamin'
            },
        },
        {
            4924, -- Professional Cataclysmic Master
            4914, -- Working In the Heat
            18719, -- Cataclysmic Master of All
            62360, -- Cataclysmic Lumberjack
            4918, -- Illustrious Grand Master Medic
            4915, -- More Skills to Pay the Bills
        },
    },
    { -- Pet Battles
        788,
        addon.GetCategoryInfoTitle(15117),
        {
            7525, -- Taming Cataclysm
            6558, -- Local Pet Mauler
            6559, -- Traveling Pet Mauler
            6560, -- World Pet Mauler
            6607, -- Taming Azeroth
            6601, -- Taming the Wild
            7498, -- Taming the Great Outdoors
            7499, -- Taming the World
            14021, -- The Shadows Revealed
            8348, -- The Longest Day
        },
    },
    { -- Tol Barad
        547,
        addon.GetCategoryInfoTitle(15075),
        { -- Quests
            563,
            addon.GetCategoryInfoTitle(96),
            true,
            {
                4874, -- Breaking Out of Tol Barad
                5718, -- Just Another Day in Tol Barad
                5719, -- Just Another Day in Tol Barad
            },
        },
        { -- PvP
            569,
            addon.GetCategoryInfoTitle(95),
            true,
            {
                5412, -- Tol Barad Victory
                5418, -- Tol Barad Veteran
                5417, -- Tol Barad Veteran
                5415, -- Tower Plower
                5488, -- Towers of Power
                5487, -- Tol Barad Saboteur
                5486, -- Tol Barad All-Star
            },
        },
        { -- Reputation
            575,
            addon.GetCategoryInfoTitle(201),
            true,
            {
                5375, -- Baradin's Wardens
                5376, -- Hellscream's Reach
            },
        },
        {
            5489, -- Master of Tol Barad
            5490, -- Master of Tol Barad
        },
    },
    {
        4887, -- Tripping the Rifts
        5535, -- 1000 Valor Points
        5536, -- 5000 Valor Points
        5537, -- 25,000 Valor Points
        5538, -- 50,000 Valor Points
        6924, -- 100,000 Valor Points
    },
});