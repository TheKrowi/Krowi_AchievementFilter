local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Dragonflight
    1207,
    addon.GetCategoryInfoTitle(15466),
    { -- Character
        1610,
        addon.GetCategoryInfoTitle(92),
        {
            18976, -- Draconically Superior
            18977, -- Draconically Epic
            19326, -- Dreaming of Drakes
            19397, -- Dreaming of Wyrms
            19398, -- Dreaming of the Aspects
        },
    },
    { -- Zones
        1228,
        addon.L["Zones"],
        { -- Dragon Isles
            1341,
            addon.GetCategoryInfoTitle(15465),
            { -- Quests
                1342,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16585, -- Loremaster of the Dragon Isles
                    16291, -- An Ancient Awakening
                    16292, -- Mastering the Waygates
                    16808, -- Friend of the Dragon Isles
                    17739, -- Embers of Neltharion
                    16683, -- In Tyr's Footsteps
                    18958, -- Of the Tyr's Guard
                    20206, -- Champion of the Dragonflights
                    19463, -- Dragon Quests
                },
            },
            { -- Exploration
                1343,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16761, -- Dragon Isles Explorer
                    16446, -- That's Pretty Neat!
                    16298, -- Treasure Hunter of the Dragon Isles
                    15890, -- Dragonscale Expedition: The Highest Peaks
                    16323, -- Fragments of History
                    16338, -- Fang Flap Fire Fighter
                    16729, -- To All the Squirrels Hidden Til Now
                    17830, -- Stones Can't Fly!
                    17977, -- Stones Can Try To Fly!
                    17978, -- Stones Can Fly!
                    17560, -- Ancient Stones of the Dragon Isles
                },
            },
            { -- Player vs. Player
                1390,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16589, -- Malicia's Challenge
                    16590, -- A Champion's Tour: Dragon Isles
                    16599, -- A Champion's Pursuit
                    16601, -- Dragonfight Club
                    16603, -- Bounty Hunter
                    16612, -- Bounty Vigalante
                    16611, -- Resource Scavanger
                    16613, -- Finder's Keepers
                    16614, -- Bloodstained Bounty
                    16616, -- Prosperously Bloody
                    16615, -- Blood Bank
                    17335, -- Airborne Tumbler
                    17336, -- Airborne Tumbler
                    17345, -- Airborne Tumbler
                },
            },
            { -- Reputation
                1361,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41172, -- Friends in the Field
                    41174, -- A True Explorer
                    41171, -- Friends in the Accord
                    41182, -- Ally of the Flights
                    41179, -- Popular Around the Isles
                    16571, -- Well Supplied
                    16560, -- Wildlife Photographer
                    16566, -- Great Shot!
                    16567, -- A Lot of Great Shots!
                    16568, -- Great Shots Galore!
                    16572, -- Legendary Photograph
                    16573, -- Legendary Photographs
                    16570, -- A Legendary Album
                    16587, -- Lead Climber
                    16588, -- How Did These Get Here?
                    16591, -- The Gentleman Elemental
                    16600, -- Isles Ascender
                    16623, -- Toe Tension
                    16624, -- Which Knot Was It Again?
                    16625, -- Belay On!
                    16758, -- Ready, Aim, Catalog!
                    41184, -- Freshscales Fifteen
                    19466, -- Oh My God, They Were Clutchmates
                    19483, -- Flight Club
                    19486, -- Across the Isles
                },
            },
            { -- Dragonriding Races
                1577,
                addon.L["Dragonriding Races"],
                true,
                {
                    19478, -- Now THIS is Dragon Racing!
                },
            },
        },
        { -- Valdrakken
            1362,
            addon.GetMapName(2112),
            {
                16556, -- Great Gourmand of The Ruby Feast
                17734, -- Active Listening Skills
                18383, -- Hey Nanny Nanny
                18384, -- Whelp, There It Is
                17782, -- Daycare Derby
            },
        },
        { -- The Waking Shores
            1232,
            addon.GetMapName(2022),
            { -- Quests
                1237,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16334, -- Waking Hope
                    16401, -- Sojourner of the Waking Shores
                },
            },
            { -- Exploration
                1242,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16400, -- Explore the Waking Shores
                    16676, -- Adventurer of The Waking Shores
                    16297, -- Treasures of The Waking Shores
                    16411, -- Siege on Dragonbane Keep: Home Sweet Home
                    16412, -- Siege on Dragonbane Keep: Chiseled Record
                    16410, -- Siege on Dragonbane Keep: Snack Attack
                    16406, -- All Sides of the Story
                    16409, -- Let's Get Quacking
                    16494, -- Loyalty to the Prince
                    16495, -- Obsidian Keymaster
                    16496, -- Obsidian Champion
                    16497, -- I'm Playing All Sides
                    16584, -- Symbols of Hope
                    17561, -- Ancient Stones of the Waking Shores
                    16493, -- Petty Theft Mammoth
                    16736, -- Grand Theft Mammoth
                    18559, -- Many Boxes, Many Rockses
                },
            },
            { -- PvP
                1247,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16592, -- Tour of Duty: The Waking Shores
                },
            },
            { -- Reputation
                1248,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    16539, -- In High Esteem
                    16532, -- True Friends with Sabellian
                    16536, -- True Friends with Wrathion
                    16760, -- The Obsidian Bloodline
                    19479, -- Wake Me Up
                },
            },
            { -- Dragon Glyphs
                1306,
                addon.L["Dragon Glyphs"],
                true,
                {
                    15991, -- Dragon Glyphs: Crumbling Life Archway
                    16051, -- Dragon Glyphs: Dragonheart Outpost
                    16669, -- Dragon Glyphs: Flashfrost Enclave
                    15990, -- Dragon Glyphs: Life-Binder Observatory
                    15987, -- Dragon Glyphs: Obsidian Bulwark
                    16053, -- Dragon Glyphs: Obsidian Throne
                    15988, -- Dragon Glyphs: Ruby Life Pools Peaks
                    16052, -- Dragon Glyphs: Scalecracker Peak
                    16668, -- Dragon Glyphs: Skytop Observatory Rostrum
                    15985, -- Dragon Glyphs: Skytop Observatory Tower
                    15989, -- Dragon Glyphs: The Overflowing Spring
                    15986, -- Dragon Glyphs: Wingrest Embassy
                    16575, -- Waking Shores Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1310,
                addon.L["Dragonriding Races"],
                true,
                {
                    15915, -- Waking Shores: Bronze
                    15916, -- Waking Shores: Silver
                    15917, -- Waking Shores: Gold
                    15927, -- Waking Shores Advanced: Bronze
                    15928, -- Waking Shores Advanced: Silver
                    15929, -- Waking Shores Advanced: Gold
                    17195, -- Waking Shores Reverse: Bronze
                    17196, -- Waking Shores Reverse: Silver
                    17197, -- Waking Shores Reverse: Gold
                    18748, -- Waking Shores Challenge: Bronze
                    18749, -- Waking Shores Challenge: Silver
                    18750, -- Waking Shores Challenge: Gold
                },
            },
            { -- Primal Storms
                1363,
                addon.L["Primal Storms"],
                true,
                {
                    16463, -- Thunderstorms in The Waking Shores
                    16465, -- Sandstorms in The Waking Shores
                    16466, -- Firestorms in The Waking Shores
                    16467, -- Snowstorms in The Waking Shores
                    16468, -- Chasing Storms in The Waking Shores
                },
            },
        },
        { -- Ohn'ahran Plains
            1233,
            addon.GetMapName(2023),
            { -- Quests
                1238,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15394, -- Ohn'a'Roll
                    16405, -- Sojourner of Ohn'ahran Plains
                    16574, -- Sleeping on the Job
                    17546, -- A New Beginning
                    17735, -- We Didn't Start the Fire
                    18867, -- Through the Ashes and Flames
                },
            },
            { -- Exploration
                1243,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16457, -- Explore the Ohn'ahran Plains
                    16677, -- Adventurer of the Ohn'ahran Plains
                    16299, -- Treasures of the Ohn'ahran Plains
                    16423, -- Honor Our Ancestors
                    16424, -- Who's a Good Bakar?
                    16462, -- The Ohn'ahran Trail
                    16583, -- Knew You Nokhud Do It!
                    17506, -- Still Standing in the Fire
                    17562, -- Ancient Stones of the Ohn'ahran Plains
                },
            },
            { -- PvP
                1249,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16595, -- Tour of Duty: Ohn'ahran Plains
                },
            },
            { -- Reputation
                1253,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41170, -- Friends in the Plains
                    41180, -- Joining the Khansguard
                    16544, -- Grand Hunter
                    16540, -- Hunt Master
                    16545, -- The Best at What I Do
                    16541, -- Longhunter
                    16542, -- The Disgruntled Hunter
                    16543, -- Tetrachromancer
                    19481, -- Centaur of Attention
                },
            },
            { -- Dragon Glyphs
                1307,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16061, -- Dragon Glyphs: Dragonsprings Summit
                    16056, -- Dragon Glyphs: Emerald Gardens
                    16671, -- Dragon Glyphs: Mirewood Fen
                    16059, -- Dragon Glyphs: Mirror of the Sky
                    16055, -- Dragon Glyphs: Nokhudon Hold
                    16054, -- Dragon Glyphs: Ohn'ahra's Roost
                    16060, -- Dragon Glyphs: Ohn'iri Springs
                    16670, -- Dragon Glyphs: Rubyscale Outpost
                    16062, -- Dragon Glyphs: Rusza'thar Reach
                    16058, -- Dragon Glyphs: Szar Skeleth
                    16057, -- Dragon Glyphs: The Eternal Kurgans
                    16063, -- Dragon Glyphs: Windsong Rise
                    16576, -- Ohn'ahran Plains Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1311,
                addon.L["Dragonriding Races"],
                true,
                {
                    15918, -- Ohn'ahran Plains: Bronze
                    15919, -- Ohn'ahran Plains: Silver
                    15920, -- Ohn'ahran Plains: Gold
                    15930, -- Ohn'ahran Plains Advanced: Bronze
                    15931, -- Ohn'ahran Plains Advanced: Silver
                    15932, -- Ohn'ahran Plains Advanced: Gold
                    17198, -- Ohn'ahran Plains Reverse: Bronze
                    17199, -- Ohn'ahran Plains Reverse: Silver
                    17200, -- Ohn'ahran Plains Reverse: Gold
                    18754, -- Ohn'ahran Plains Challenge: Bronze
                    18755, -- Ohn'ahran Plains Challenge: Silver
                    18756, -- Ohn'ahran Plains Challenge: Gold
                },
            },
            { -- Primal Storms
                1364,
                addon.L["Primal Storms"],
                true,
                {
                    16475, -- Thunderstorms in the Ohn'ahran Plains
                    16477, -- Sandstorms in the Ohn'ahran Plains
                    16478, -- Firestorms in the Ohn'ahran Plains
                    16479, -- Snowstorms in the Ohn'ahran Plains
                    16476, -- Chasing Storms in the Ohn'ahran Plains
                },
            },
        },
        { -- The Azure Span
            1234,
            addon.GetMapName(2024),
            { -- Quests
                1239,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16336, -- Azure Spanner
                    16428, -- Sojourner of Azure Span
                    15889, -- River Rapids Wrangler
                    16580, -- Lend a Helping Span
                    17735, -- We Didn't Start the Fire
                    18867, -- Through the Ashes and Flames
                    17773, -- A Blue Dawn
                },
            },
            { -- Exploration
                1245,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16460, -- Explore the Azure Span
                    16678, -- Adventurer of The Azure Span
                    16300, -- Treasures of The Azure Span
                    16474, -- Do You Wanna Build a Snowman?
                    16569, -- Cobalt Enthusiast
                    16638, -- Ley Line in the Span
                    16622, -- Three Minutes or It's Free
                    16581, -- Seeing Blue
                    17506, -- Still Standing in the Fire
                    17563, -- Ancient Stones of the Azure Span
                },
            },
            { -- PvP
                1250,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16594, -- Tour of Duty: The Azure Span
                },
            },
            { -- Reputation
                1256,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41173, -- Friend of the Family
                    41181, -- Joining the Community
                    16533, -- Lots of Lunkers
                    16531, -- A Whole Heap of Lunkers
                    16546, -- What's Down There?
                    16547, -- Pulled!
                    16548, -- It Takes a Tuskarr Buddy
                    16550, -- Giving Back to Nature
                    16551, -- Giving More Back to Nature
                    16552, -- Giving Even More Back to Nature
                    16553, -- Taking From Nature
                    16561, -- Lunkers, Lunkers Everywhere
                    16562, -- That's not a Fish...
                    16563, -- We're Going to Need a Bigger Harpoon
                    16564, -- It Takes a Tuskarr Family
                    16565, -- It Takes a Tuskarr Village
                    16537, -- Maximum Power!
                    16317, -- Secret Fishing Spots
                    16321, -- Cutting Tusk Equipment
                    16322, -- Best in Slot
                    16444, -- Leftovers' Revenge
                    16443, -- Soupervisor
                    17427, -- Winterpelt Conversationalist
                    19482, -- Army of the Fed
                },
            },
            { -- Dragon Glyphs
                1308,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16065, -- Dragon Glyphs: Azure Archives
                    16068, -- Dragon Glyphs: Brackenhide Hollow
                    16064, -- Dragon Glyphs: Cobalt Assembly
                    16069, -- Dragon Glyphs: Drake Eye's Pond
                    16672, -- Dragon Glyphs: Forkriver Crossing
                    16070, -- Dragon Glyphs: Imbu
                    16072, -- Dragon Glyphs: Rhonin's Shield
                    16067, -- Dragon Glyphs: Lost Ruins
                    16066, -- Dragon Glyphs: Ruins of Karnthar
                    16673, -- Dragon Glyphs: The Fallen Course
                    16073, -- Dragon Glyphs: Vakthros Range
                    16071, -- Dragon Glyphs: Zelthrak Outpost
                    16577, -- Azure Span Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1312,
                addon.L["Dragonriding Races"],
                true,
                {
                    15921, -- Azure Span: Bronze
                    15922, -- Azure Span: Silver
                    15923, -- Azure Span: Gold
                    15933, -- Azure Span Advanced: Bronze
                    15934, -- Azure Span Advanced: Silver
                    15935, -- Azure Span Advanced: Gold
                    17201, -- Azure Span Reverse: Bronze
                    17202, -- Azure Span Reverse: Silver
                    17203, -- Azure Span Reverse: Gold
                    18757, -- Azure Span Challenge: Bronze
                    18758, -- Azure Span Challenge: Silver
                    18759, -- Azure Span Challenge: Gold
                },
            },
            { -- Primal Storms
                1365,
                addon.L["Primal Storms"],
                true,
                {
                    16480, -- Thunderstorms in The Azure Span
                    16481, -- Sandstorms in The Azure Span
                    16482, -- Firestorms in The Azure Span
                    16483, -- Snowstorms in The Azure Span
                    16484, -- Chasing Storms in The Azure Span
                },
            },
        },
        { -- Thaldraszus
            1235,
            addon.GetMapName(2025),
            { -- Quests
                1240,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    16363, -- Just Don't Ask Me to Spell It
                    16398, -- Sojourner of Thaldraszus
                    17342, -- The Future We Make
                    17343, -- Drop It Like It's Hot
                    19507, -- Fringe Benefits
                },
            },
            { -- Exploration
                1246,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16518, -- Explore Thaldraszus
                    16679, -- Adventurer of Thaldraszus
                    16301, -- Treasures of Thaldraszus
                    16634, -- Framing a New Perspective
                    16621, -- One of Everything, Please
                    17564, -- Ancient Stones of Thaldraszus
                },
            },
            { -- PvP
                1251,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    16593, -- Tour of Duty: Thaldraszus
                },
            },
            { -- Dragon Glyphs
                1309,
                addon.L["Dragon Glyphs"],
                true,
                {
                    16104, -- Dragon Glyphs: Algeth'ar Academy
                    16102, -- Dragon Glyphs: Algeth'era
                    16666, -- Dragon Glyphs: Gelikyr Overlook
                    16667, -- Dragon Glyphs: Passage of Time
                    16100, -- Dragon Glyphs: South Hold Gate
                    16099, -- Dragon Glyphs: Stormshroud Peak
                    16098, -- Dragon Glyphs: Temporal Conflux
                    16107, -- Dragon Glyphs: Thaldraszus Apex
                    16103, -- Dragon Glyphs: Tyrhold
                    16101, -- Dragon Glyphs: Valdrakken
                    16106, -- Dragon Glyphs: Vault of the Incarnates
                    16105, -- Dragon Glyphs: Veiled Ossuary
                    16578, -- Thaldraszus Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1313,
                addon.L["Dragonriding Races"],
                true,
                {
                    15924, -- Thaldraszus: Bronze
                    15925, -- Thaldraszus: Silver
                    15926, -- Thaldraszus: Gold
                    15936, -- Thaldraszus Advanced: Bronze
                    15937, -- Thaldraszus Advanced: Silver
                    15938, -- Thaldraszus Advanced: Gold
                    17204, -- Thaldraszus Reverse: Bronze
                    17205, -- Thaldraszus Reverse: Silver
                    17206, -- Thaldraszus Reverse: Gold
                    18760, -- Thaldraszus Challenge: Bronze
                    18761, -- Thaldraszus Challenge: Silver
                    18762, -- Thaldraszus Challenge: Gold
                },
            },
            { -- Primal Storms
                1366,
                addon.L["Primal Storms"],
                true,
                {
                    16485, -- Thunderstorms in Thaldraszus
                    16486, -- Sandstorms in Thaldraszus
                    16487, -- Firestorms in Thaldraszus
                    16488, -- Snowstorms in Thaldraszus
                    16489, -- Chasing Storms in Thaldraszus
                },
            },
        },
        { -- The Forbidden Reach
            1236,
            addon.GetMapName(2107),
            { -- Quests
                1241,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15325, -- Dracthyr, Awaken
                    15638, -- Dracthyr, Awaken
                },
            },
            { -- Exploration
                1244,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    16452, -- Famliar Skies
                    17534, -- Explore the Forbidden Reach
                    17315, -- While We Were Sleeping
                    17524, -- Adventurer of the Forbidden Reach
                    17525, -- Champion of the Forbidden Reach
                    17526, -- Treasures of the Forbidden Reach
                    17527, -- Scavenger of the Forbidden Reach
                    17528, -- Hoarder of the Forbidden Reach
                    17529, -- Forbidden Spoils
                    17530, -- Librarian of the Reach
                    17531, -- X Marks the Spot
                    17532, -- Scroll Hunter
                    17397, -- Door To Door
                    17413, -- Door Buster
                    17509, -- Every Door, Everywhere, All At Once
                    17543, -- You Know How to Reach Me
                },
            },
            { -- Dragon Glyphs
                1408,
                addon.L["Dragon Glyphs"],
                true,
                {
                    17398, -- Dragon Glyphs: Winglord's Perch
                    17399, -- Dragon Glyphs: Talon's Watch
                    17400, -- Dragon Glyphs: Froststone Peak
                    17401, -- Dragon Glyphs: Dragonskull Island
                    17402, -- Dragon Glyphs: Stormsunder Mountain
                    17403, -- Dragon Glyphs: The Frosted Spine
                    17404, -- Dragon Glyphs: Talonlords' Perch
                    17405, -- Dragon Glyphs: Caldera of the Menders
                    17411, -- Forbidden Reach Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1407,
                addon.L["Dragonriding Races"],
                true,
                {
                    17279, -- Forbidden Reach: Bronze
                    17280, -- Forbidden Reach: Silver
                    17281, -- Forbidden Reach: Gold
                    17284, -- Forbidden Reach Advanced: Bronze
                    17286, -- Forbidden Reach Advanced: Silver
                    17287, -- Forbidden Reach Advanced: Gold
                    17288, -- Forbidden Reach Reverse: Bronze
                    17289, -- Forbidden Reach Reverse: Silver
                    17290, -- Forbidden Reach Reverse: Gold
                    17294, -- Forbidden Reach Racing Completionist
                    17296, -- Forbidden Reach Racing Completionist: Silver
                    17298, -- Forbidden Reach Racing Completionist: Gold
                    18779, -- Forbidden Reach Challenge: Bronze
                    18780, -- Forbidden Reach Challenge: Silver
                    18781, -- Forbidden Reach Challenge: Gold
                },
            },
            { -- Primal Storms
                1410,
                addon.L["Primal Storms"],
                true,
                {
                    17540, -- Under the Weather
                },
            },
        },
        { -- Zaralek Cavern
            1414,
            addon.GetMapName(2133),
            { -- Exploration
                1416,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    17766, -- Explore Zaralek Cavern
                    17783, -- Adventurer of Zaralek Cavern
                    17786, -- Treasures of Zaralek Cavern
                    17741, -- Slow and Steady Wins the Race
                    17781, -- The Smell of Money
                    17567, -- Ancient Stones of Zaralek
                    17832, -- Sniffen Around
                    17833, -- Sniffen Sage
                    17878, -- Me Want Bite
                    18100, -- Cavern Clawbbering
                    18255, -- Proof of Myrrit
                    18257, -- Can You Dig It?
                    18284, -- A Niffen's Best Buddy
                    18361, -- To All the Squirrels Burrowed Beneath
                },
            },
            { -- Player vs. Player
                1417,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    17851, -- Tour of Duty: Zaralek Cavern
                    17852, -- Elemental Conjuror
                },
            },
            { -- Reputation
                1418,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41175, -- Friends in Loamm Places
                    41183, -- There's No Place Like Loamm
                },
            },
            { -- Dragon Glyphs
                1427,
                addon.L["Dragon Glyphs"],
                true,
                {
                    17510, -- Dragon Glyphs: Glimmerogg
                    17511, -- Dragon Glyphs: Nal ks'kol
                    17512, -- Dragon Glyphs: Loamm
                    17513, -- Dragon Glyphs: Zaqali Caldera
                    17514, -- Dragon Glyphs: Slitherdrake Roost
                    17515, -- Dragon Glyphs: The Throughway
                    17516, -- Dragon Glyphs: Acidbite Ravine
                    17517, -- Dragon Glyphs: Aberrus Approach
                    18150, -- Zaralek Cavern Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1424,
                addon.L["Dragonriding Races"],
                true,
                {
                    17483, -- Zaralek Cavern: Bronze
                    17484, -- Zaralek Cavern: Silver
                    17485, -- Zaralek Cavern: Gold
                    17486, -- Zaralek Cavern Advanced: Bronze
                    17487, -- Zaralek Cavern Advanced: Silver
                    17488, -- Zaralek Cavern Advanced: Gold
                    17489, -- Zaralek Cavern Reverse: Bronze
                    17490, -- Zaralek Cavern Reverse: Silver
                    17491, -- Zaralek Cavern Reverse: Gold
                    17492, -- Zaralek Cavern Racing Completionist
                    17493, -- Zaralek Cavern Racing Completionist: Silver
                    17494, -- Zaralek Cavern Racing Completionist: Gold
                    18786, -- Zaralek Cavern Challenge: Bronze
                    18787, -- Zaralek Cavern Challenge: Silver
                    18788, -- Zaralek Cavern Challenge: Gold
                },
            },
            {
                17785, -- Que Zara(lek), Zara(lek)
                17841, -- Pyramid Scheme
                18271, -- He'sSss All Mine
            },
        },
        { -- Emerald Dream
            1541,
            addon.GetMapName(2200),
            { -- Quests
                1548,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    19026, -- Defenders of the Dream
                    19293, -- Friends In Feathers
                },
            },
            { -- Exploration
                1549,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    19309, -- Explore the Emerald Dream
                    19316, -- Adventurer of the Emerald Dream
                    19317, -- Treasures of the Emerald Dream
                    19013, -- I Dream of Seeds
                    19194, -- The Emerald Bounty
                    19196, -- Sowing the Seeds
                    19198, -- The Seeds I Sow
                    19461, -- Kissed by the Wind
                },
            },
            { -- Player vs. Player
                1546,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    19294, -- Tour of Duty: Emerald Dream
                },
            },
            { -- Reputation
                1547,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    41176, -- Friends in the Dream
                    41177, -- Warden of the Dream
                },
            },
            { -- Dragon Glyphs
                1551,
                addon.L["Dragon Glyphs"],
                true,
                {
                    19296, -- Dragon Glyphs: Eye of Ysera
                    19297, -- Dragon Glyphs: Furnace Coil
                    19298, -- Dragon Glyphs: Smoldering Copse
                    19299, -- Dragon Glyphs: Cinder Summit
                    19300, -- Dragon Glyphs: Dreamsurge Basin
                    19301, -- Dragon Glyphs: Amirdrassil
                    19302, -- Dragon Glyphs: Whorlwing Basin
                    19303, -- Dragon Glyphs: Wakeful Vista
                    19306, -- Emerald Dream Glyph Hunter
                },
            },
            { -- Dragonriding Races
                1542,
                addon.L["Dragonriding Races"],
                true,
                {
                    19109, -- Emerald Dream: Bronze
                    19110, -- Emerald Dream: Silver
                    19111, -- Emerald Dream: Gold
                    19112, -- Emerald Dream Advanced: Bronze
                    19113, -- Emerald Dream Advanced: Silver
                    19114, -- Emerald Dream Advanced: Gold
                    19115, -- Emerald Dream Reverse: Bronze
                    19116, -- Emerald Dream Reverse: Silver
                    19117, -- Emerald Dream Reverse: Gold
                    19118, -- Emerald Dream Racing Completionist
                    19119, -- Emerald Dream Racing Completionist: Silver
                    19120, -- Emerald Dream Racing Completionist: Gold
                    19121, -- Emerald Dream Challenge: Bronze
                    19122, -- Emerald Dream Challenge: Silver
                    19123, -- Emerald Dream Challenge: Gold
                    19124, -- Emerald Dream Reverse Challenge: Bronze
                    19125, -- Emerald Dream Reverse Challenge: Silver
                    19126, -- Emerald Dream Reverse Challenge: Gold
                    19127, -- Emerald Dream Challenge Racing Completionist
                    19128, -- Emerald Dream Challenge Racing Completionist: Silver
                    19129, -- Emerald Dream Challenge Racing Completionist: Gold
                },
            },
            {
                19318, -- Dream On
            },
        },
    },
    { -- Dungeons
        1229,
        addon.GetCategoryInfoTitle(15272),
        { -- Algeth'ar Academy
            1257,
            addon.GetInstanceInfoName(1201),
            {
                16434, -- See Me After Class
                16329, -- Duck, Duck, Spruce!
                16441, -- Squad Goals
                16269, -- Algeth'ar Academy
                16270, -- Heroic: Algeth'ar Academy
                16271, -- Mythic: Algeth'ar Academy
                16643, -- Keystone Hero: Algeth'ar Academy
                61591, -- Keystone Victor: Algeth'ar Academy
            },
        },
        { -- Brackenhide Hollow
            1258,
            addon.GetInstanceInfoName(1196),
            {
                16110, -- Subscribed to Hyena Facts
                16296, -- Growlbossify
                16430, -- All Bark, All Bite
                16404, -- So You Can Kill This in a Way That Matters...
                16762, -- The Vegetarian Diet
                16255, -- Brackenhide Hollow
                16256, -- Heroic: Brackenhide Hollow
                16257, -- Mythic: Brackenhide Hollow
                16642, -- Keystone Hero: Brackenhide Hollow
            },
        },
        { -- Halls of Infusion
            1259,
            addon.GetInstanceInfoName(1204),
            {
                16426, -- Hungry Hungry Hornswog
                16427, -- Go With the Flow
                16517, -- Toxicity Strike Team
                16260, -- Halls of Infusion
                16261, -- Heroic: Halls of Infusion
                16262, -- Mythic: Halls of Infusion
                16646, -- Keystone Hero: Halls of Infusion
            },
        },
        { -- Neltharus
            1260,
            addon.GetInstanceInfoName(1199),
            {
                16438, -- Knowledge is... Preserved?
                16432, -- Ready for Raiding VIII
                16453, -- Liquid Hot Magma
                16263, -- Neltharus
                16264, -- Heroic: Neltharus
                16265, -- Mythic: Neltharus
                16644, -- Keystone Hero: Neltharus
            },
        },
        { -- Ruby Life Pools
            1261,
            addon.GetInstanceInfoName(1202),
            {
                16402, -- Dragon Kill Points
                16320, -- Does Steam Do Fire Damage?
                16440, -- Are You My Broodmother?
                16266, -- Ruby Life Pools
                16267, -- Heroic: Ruby Life Pools
                16268, -- Mythic: Ruby Life Pools
                16640, -- Keystone Hero: Ruby Life Pools
            },
        },
        { -- The Azure Vault
            1262,
            addon.GetInstanceInfoName(1203),
            {
                16445, -- Icy What You Did There
                16331, -- The Cracked Crystal
                16330, -- You Must Be Made of Hide
                16272, -- The Azure Vault
                16273, -- Heroic: The Azure Vault
                16274, -- Mythic: The Azure Vault
                16645, -- Keystone Hero: The Azure Vault
            },
        },
        { -- The Nokhud Offensive
            1263,
            addon.GetInstanceInfoName(1198),
            {
                16447, -- What Are The Chances...
                16456, -- Weapons of the Maruukai
                16602, -- Nokhud Deed Goes Unnoticed
                16620, -- Ohuna Incubation
                16275, -- The Nokhud Offensive
                16276, -- Heroic: The Nokhud Offensive
                16277, -- Mythic: The Nokhud Offensive
                16641, -- Keystone Hero: The Nokhud Offensive
            },
        },
        { -- Uldaman: Legacy of Tyr
            1264,
            addon.GetInstanceInfoName(1197),
            {
                16337, -- It's a Trogg Eat Trogg World
                16282, -- No, You're Stunning!
                16281, -- Like Sands Through the Hourglass
                16278, -- Uldaman: Legacy of Tyr
                16279, -- Heroic: Uldaman: Legacy of Tyr
                16280, -- Mythic: Uldaman: Legacy of Tyr
                16639, -- Keystone Hero: Uldaman: Legacy of Tyr
            },
        },
        { -- Dawn of the Infinite
            1450,
            addon.GetInstanceInfoName(1209),
            {
                18589, -- Crunch Time
                18556, -- Chaotic Time
                18612, -- A Slime in Need
                18539, -- Back En-masse
                18703, -- Dawn of the Infinite: Galakrond's Fall
                18704, -- Dawn of the Infinite: Murozond's Rise
                18705, -- Defender of the Timeways
                18706, -- Put That Thing Back Where It Came From
                19088, -- Keystone Hero: Dawn of the Infinite
            },
        },
        {
            16294, -- Dragonflight Dungeon Hero
            16339, -- Myths of the Dragonflight Dungeons
            16295, -- Glory of the Dragonflight Hero
            16647, -- Dragonflight Keystone Explorer: Season One
            16648, -- Dragonflight Keystone Conqueror: Season One
            16649, -- Dragonflight Keystone Master: Season One
            16650, -- Dragonflight Keystone Hero: Season One
            16429, -- Thundering Hero: Dragonflight Season 1
            17119, -- Deep Cuts From the Vault
            17842, -- Dragonflight Keystone Explorer: Season Two
            17843, -- Dragonflight Keystone Conqueror: Season Two
            17844, -- Dragonflight Keystone Master: Season Two
            17845, -- Dragonflight Keystone Hero: Season Two
            18542, -- Dragonflight Keystone Master: Season Two
            17846, -- Smoldering Hero: Dragonflight Season 2
            18027, -- Dragonflight Season 2 Master
            18380, -- Dragonflight Season 2 Hero
            17830, -- Stones Can't Fly!
            17977, -- Stones Can Try To Fly!
            17978, -- Stones Can Fly!
            19009, -- Dragonflight Keystone Explorer: Season Three
            19010, -- Dragonflight Keystone Conqueror: Season Three
            19011, -- Dragonflight Keystone Master: Season Three
            19012, -- Dragonflight Keystone Hero: Season Three
            19449, -- Dreaming Hero: Dragonflight Season 3
            19396, -- Dragonflight Season 3 Master
            19420, -- Dragonflight Season 3 Hero
            19780, -- Dragonflight Keystone Explorer: Season Four
            19781, -- Dragonflight Keystone Conqueror: Season Four
            19782, -- Dragonflight Keystone Master: Season Four
            19783, -- Dragonflight Keystone Hero: Season Four
            19785, -- Draconic Hero: Dragonflight Season 4
            20481, -- Dragonflight Season 4 Master
        },
    },
    { -- Raids
        1230,
        addon.GetCategoryInfoTitle(15271),
        { -- Vault of the Incarnates
            1265,
            addon.GetInstanceInfoName(1200),
            { -- Glory
                1266,
                addon.L["Glory"],
                {
                    16335, -- What Frozen Things Do
                    16365, -- Little Friends
                    16364, -- The Lunker Below
                    16419, -- I Was Saving That For Later
                    16458, -- Nothing But Air
                    16450, -- The Power is MINE!
                    16442, -- Incubation Extermination
                    16451, -- The Ol Raszle Daszle
                },
            },
            { -- Mythic
                1267,
                addon.L["Mythic"],
                {
                    16346, -- Mythic: Eranog
                    16347, -- Mythic: Terros
                    16348, -- Mythic: The Primal Council
                    16349, -- Mythic: Sennarth, The Cold Breath
                    16350, -- Mythic: Dathea, Ascended
                    16351, -- Mythic: Kurog Grimtotem
                    16352, -- Mythic: Broodkeeper Diurna
                    16353, -- Mythic: Raszageth the Storm-Eater
                },
            },
            {
                17110, -- The Primal Bulwark
                17111, -- Caverns of Infusion
                17112, -- Fury of the Storm
                16343, -- Vault of the Incarnates
                16345, -- Heroic: Vault of the Incarnates
                16354, -- Mythic: Vault of the Incarnates
                17107, -- Ahead of the Curve: Raszageth the Storm-Eater
                17108, -- Cutting Edge: Raszageth the Storm-Eater
                16395, -- Vaulternative Fashion
                17119, -- Deep Cuts From the Vault
                19564, -- Awakened Storms
                19565, -- Heroic: Awakened Storms
                19566, -- Mythic: Awakened Storms
            },
        },
        { -- Aberrus, the Shadowed Crucible
            1420,
            addon.GetInstanceInfoName(1208),
            { -- Glory
                1421,
                addon.L["Glory"],
                {
                    18229, -- Cosplate
                    18168, -- I'll Make My Own Shadowflame
                    18173, -- Tabula Rasa
                    18228, -- Are You Even Trying?
                    18230, -- Whac-A-Swog
                    18193, -- Eggscellent Eggsecution
                    18172, -- Escar-Go-Go-Go
                    18149, -- Objects in Transit May Shatter
                    17877, -- We'll Never See That Again, Surely
                },
            },
            { -- Mythic
                1422,
                addon.L["Mythic"],
                {
                    18151, -- Mythic: Kazzara, the Hellforged
                    18152, -- Mythic: The Amalgamation Chamber
                    18153, -- Mythic: The Forgotten Experiments
                    18154, -- Mythic: Assault of the Zaqali
                    18155, -- Mythic: Rashok, the Elder
                    18156, -- Mythic: The Vigilant Steward, Zskarn
                    18157, -- Mythic: Magmorax
                    18158, -- Mythic: Echo of Neltharion
                    18159, -- Mythic: Scalecommander Sarkareth
                },
            },
            {
                18163, -- Discarded Works
                18164, -- Fury of Giants
                18165, -- Neltharion's Shadow
                18167, -- Edge of the Void
                18160, -- Aberrus, the Shadowed Crucible
                18161, -- Heroic: Aberrus, the Shadowed Crucible
                18162, -- Mythic: Aberrus, the Shadowed Crucible
                18253, -- Ahead of the Curve: Scalecommander Sarkareth
                18254, -- Cutting Edge: Scalecommander Sarkareth
                17765, -- What We Wear In The Shadowflame
                18256, -- Nasz'uro, the Unbound Legacy
                18027, -- Dragonflight Season 2 Master
                18380, -- Dragonflight Season 2 Hero
                19567, -- Awakened Shadows
                19568, -- Heroic: Awakened Shadows
                19569, -- Mythic: Awakened Shadows
            },
        },
        { -- Amirdrassil, the Dream's Hope
            1543,
            addon.GetInstanceInfoName(1207),
            { -- Glory
                1544,
                addon.L["Glory"],
                {
                    19322, -- Meaner Pastures
                    19320, -- Cruelty Free
                    19321, -- Swog Champion
                    19193, -- Ducks In A Row
                    19089, -- Don't Let the Doe Hit You On The Way Out
                    19394, -- A Dream Within a Dream
                    19319, -- Haven't We Done This Before?
                    19393, -- Whelp, I'm Lost
                    19390, -- Memories of Teldrassil
                },
            },
            { -- Mythic
                1545,
                addon.L["Mythic"],
                {
                    19335, -- Mythic: Gnarlroot
                    19336, -- Mythic: Igira the Cruel
                    19337, -- Mythic: Volcoross
                    19338, -- Mythic: Council of Dreams
                    19339, -- Mythic: Larodar, Keeper of the Flame
                    19340, -- Mythic: Nymue, Weaver of the Cycle
                    19341, -- Mythic: Smolderon
                    19342, -- Mythic: Tindral Sageswift, Seer of the Flame
                    19343, -- Mythic: Fyrakk the Blazing
                },
            },
            {
                19344, -- Incarnate's Wake
                19345, -- Molten Incursion
                19346, -- The Viridian Weave
                19347, -- Fate of Amirdrassil
                19331, -- Amirdrassil, the Dream's Hope
                19333, -- Heroic: Amirdrassil, the Dream's Hope
                19334, -- Mythic: Amirdrassil, the Dream's Hope
                19350, -- Ahead of the Curve: Fyrakk the Blazing
                19351, -- Cutting Edge: Fyrakk the Blazing
                19442, -- Fire Catwalk With Me
                19450, -- Fyr'alath the Dreamrender
                19396, -- Dragonflight Season 3 Master
                19420, -- Dragonflight Season 3 Hero
                19570, -- Awakened Flames
                19571, -- Heroic: Awakened Flames
                19572, -- Mythic: Awakened Flames
            },
        },
        {
            16355, -- Glory of the Vault Raider
            18251, -- Glory of the Aberrus Raider
            17830, -- Stones Can't Fly!
            17977, -- Stones Can Try To Fly!
            17978, -- Stones Can Fly!
            19349, -- Glory of the Dream Raider
            19574, -- Awakening the Dragonflight Raids
            19575, -- Heroic: Awakening the Dragonflight Raids
            19576, -- Mythic: Awakening the Dragonflight Raids
        },
    },
    { -- Professions
        1391,
        addon.GetCategoryInfoTitle(169),
        { -- Alchemy
            1466,
            addon.GetCategoryInfoTitle(15489),
            true,
            {
                18805, -- Draconic Phial Cabinet
            },
        },
        { -- Cooking
            1485,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                16631, -- Dragon Isles Cook
            },
        },
        { -- Enchanting
            1487,
            addon.GetCategoryInfoTitle(15491),
            true,
            {
                18763, -- Spectre of Spectacles
                18764, -- Break Upon Your Body
            },
        },
        { -- Engineering
            1491,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                18857, -- That's No Ordinary Gas Cloud!
            },
        },
        { -- Fishing
            1492,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                16632, -- Dragon Isles Fisherman
            },
        },
        { -- Herbalism
            1504,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18822, -- Botanist's Log - Hochenblume
                18823, -- Botanist's Log - Saxifrage
                18824, -- Botanist's Log - Bubble Poppy
                18825, -- Botanist's Log - Writhebark
                18829, -- Botanist's Log - Overloaded Elements
                18828, -- Botanist's Log: Dragon Isles
            },
        },
        { -- Jewelcrafting
            1509,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                18727, -- Rave Leader
                18941, -- Dazzling Dragons
            },
        },
        { -- Mining
            1519,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18818, -- Geologist's Ledger - Serevite
                18819, -- Geologist's Ledger - Draconium
                18821, -- Geologist's Ledger - Overloaded Elements
                18820, -- Geologist's Ledger: Dragon Isles
            },
        },
        { -- Skinning
            1523,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18832, -- Elusive Legend of the Dragon Isles
                18833, -- Elusive Legends of the Dragon Isles
                18831, -- Elusive Beasts of the Dragon Isles
            },
        },
        { -- Tailoring
            1528,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                18902, -- Uncertified Nurse
            },
        },
        {
            16627, -- Professional Draconic Master
            16626, -- Working with Wyrms
            16630, -- Draconic Master of All
        },
    },
    { -- Pet Battles
        1231,
        addon.GetCategoryInfoTitle(15117),
        {
            16519, -- Dragon Isles Safari
            16464, -- Battle on the Dragon Isles
            17406, -- Battle on the Dragon Isles II
            16501, -- Aquatic Battler of the Dragon Isles
            16503, -- Beast Battler of the Dragon Isles
            16504, -- Critter Battler of the Dragon Isles
            16505, -- Dragonkin Battler of the Dragon Isles
            16506, -- Elemental Battler of the Dragon Isles
            16507, -- Flying Battler of the Dragon Isles
            16508, -- Humanoid Battler of the Dragon Isles
            16509, -- Magic Battler of the Dragon Isles
            16510, -- Mechanical Battler of the Dragon Isles
            16511, -- Undead Battler of the Dragon Isles
            16512, -- Family Battler of the Dragon Isles
            16399, -- Lovin' Lubbins
            17541, -- Global Swarming
            17879, -- Zaralek Cavern Safari
            17880, -- Battle in Zaralek Cavern
            17881, -- Aquatic Battler of Zaralek Cavern
            17882, -- Beast Battler of Zaralek Cavern
            17883, -- Critter Battler of Zaralek Cavern
            17890, -- Dragonkin Battler of Zaralek Cavern
            17904, -- Elemental Battler of Zaralek Cavern
            17905, -- Flying Battler of Zaralek Cavern
            17915, -- Humanoid Battler of Zaralek Cavern
            17916, -- Magic Battler of Zaralek Cavern
            17917, -- Mechanical Battler of Zaralek Cavern
            17918, -- Undead Battler of Zaralek Cavern
            17934, -- Family Battler of Zaralek Cavern
            19401, -- Emerald Dream Safari
        },
    },
    { -- Dragonriding
        1268,
        addon.L["Dragonriding"],
        { -- The Waking Shores
            1302,
            addon.GetMapName(2022),
            true,
            {
                15991, -- Dragon Glyphs: Crumbling Life Archway
                16051, -- Dragon Glyphs: Dragonheart Outpost
                16669, -- Dragon Glyphs: Flashfrost Enclave
                15990, -- Dragon Glyphs: Life-Binder Observatory
                15987, -- Dragon Glyphs: Obsidian Bulwark
                16053, -- Dragon Glyphs: Obsidian Throne
                15988, -- Dragon Glyphs: Ruby Life Pools Peaks
                16052, -- Dragon Glyphs: Scalecracker Peak
                16668, -- Dragon Glyphs: Skytop Observatory Rostrum
                15985, -- Dragon Glyphs: Skytop Observatory Tower
                15989, -- Dragon Glyphs: The Overflowing Spring
                15986, -- Dragon Glyphs: Wingrest Embassy
                16575, -- Waking Shores Glyph Hunter
            },
        },
        { -- Ohn'ahran Plains
            1303,
            addon.GetMapName(2023),
            true,
            {
                16061, -- Dragon Glyphs: Dragonsprings Summit
                16056, -- Dragon Glyphs: Emerald Gardens
                16671, -- Dragon Glyphs: Mirewood Fen
                16059, -- Dragon Glyphs: Mirror of the Sky
                16055, -- Dragon Glyphs: Nokhudon Hold
                16054, -- Dragon Glyphs: Ohn'ahra's Roost
                16060, -- Dragon Glyphs: Ohn'iri Springs
                16670, -- Dragon Glyphs: Rubyscale Outpost
                16062, -- Dragon Glyphs: Rusza'thar Reach
                16058, -- Dragon Glyphs: Szar Skeleth
                16057, -- Dragon Glyphs: The Eternal Kurgans
                16063, -- Dragon Glyphs: Windsong Rise
                16576, -- Ohn'ahran Plains Glyph Hunter
            },
        },
        { -- The Azure Span
            1304,
            addon.GetMapName(2024),
            true,
            {
                16065, -- Dragon Glyphs: Azure Archives
                16068, -- Dragon Glyphs: Brackenhide Hollow
                16064, -- Dragon Glyphs: Cobalt Assembly
                16069, -- Dragon Glyphs: Drake Eye's Pond
                16672, -- Dragon Glyphs: Forkriver Crossing
                16070, -- Dragon Glyphs: Imbu
                16072, -- Dragon Glyphs: Rhonin's Shield
                16067, -- Dragon Glyphs: Lost Ruins
                16066, -- Dragon Glyphs: Ruins of Karnthar
                16073, -- Dragon Glyphs: Vakthros Range
                16673, -- Dragon Glyphs: The Fallen Course
                16071, -- Dragon Glyphs: Zelthrak Outpost
                16577, -- Azure Span Glyph Hunter
            },
        },
        { -- Thaldraszus
            1305,
            addon.GetMapName(2025),
            true,
            {
                16104, -- Dragon Glyphs: Algeth'ar Academy
                16102, -- Dragon Glyphs: Algeth'era
                16666, -- Dragon Glyphs: Gelikyr Overlook
                16667, -- Dragon Glyphs: Passage of Time
                16100, -- Dragon Glyphs: South Hold Gate
                16099, -- Dragon Glyphs: Stormshroud Peak
                16098, -- Dragon Glyphs: Temporal Conflux
                16107, -- Dragon Glyphs: Thaldraszus Apex
                16103, -- Dragon Glyphs: Tyrhold
                16101, -- Dragon Glyphs: Valdrakken
                16106, -- Dragon Glyphs: Vault of the Incarnates
                16105, -- Dragon Glyphs: Veiled Ossuary
                16578, -- Thaldraszus Glyph Hunter
            },
        },
        { -- Zaralek Cavern
            1426,
            addon.GetMapName(2133),
            true,
            {
                17510, -- Dragon Glyphs: Glimmerogg
                17511, -- Dragon Glyphs: Nal ks'kol
                17512, -- Dragon Glyphs: Loamm
                17513, -- Dragon Glyphs: Zaqali Caldera
                17514, -- Dragon Glyphs: Slitherdrake Roost
                17515, -- Dragon Glyphs: The Throughway
                17516, -- Dragon Glyphs: Acidbite Ravine
                17517, -- Dragon Glyphs: Aberrus Approach
                18150, -- Zaralek Cavern Glyph Hunter
            },
        },
        { -- Emerald Dream
            1550,
            addon.GetMapName(2200),
            true,
            {
                19296, -- Dragon Glyphs: Eye of Ysera
                19297, -- Dragon Glyphs: Furnace Coil
                19298, -- Dragon Glyphs: Smoldering Copse
                19299, -- Dragon Glyphs: Cinder Summit
                19300, -- Dragon Glyphs: Dreamsurge Basin
                19301, -- Dragon Glyphs: Amirdrassil
                19302, -- Dragon Glyphs: Whorlwing Basin
                19303, -- Dragon Glyphs: Wakeful Vista
                19306, -- Emerald Dream Glyph Hunter
            },
        },
        {
            15794, -- A New Friend
            15795, -- Together in the Skies
            15797, -- An Azure Ally
            15796, -- Cliffside Companion
            17779, -- A Serpentine Discovery
        },
    },
    { -- Dragonriding Races
        1269,
        addon.L["Dragonriding Races"],
        { -- The Waking Shores
            1293,
            addon.GetMapName(2022),
            {
                15915, -- Waking Shores: Bronze
                15916, -- Waking Shores: Silver
                15917, -- Waking Shores: Gold
                15927, -- Waking Shores Advanced: Bronze
                15928, -- Waking Shores Advanced: Silver
                15929, -- Waking Shores Advanced: Gold
                17195, -- Waking Shores Reverse: Bronze
                17196, -- Waking Shores Reverse: Silver
                17197, -- Waking Shores Reverse: Gold
                18748, -- Waking Shores Challenge: Bronze
                18749, -- Waking Shores Challenge: Silver
                18750, -- Waking Shores Challenge: Gold
            },
        },
        { -- Ohn'ahran Plains
            1285,
            addon.GetMapName(2023),
            {
                15918, -- Ohn'ahran Plains: Bronze
                15919, -- Ohn'ahran Plains: Silver
                15920, -- Ohn'ahran Plains: Gold
                15930, -- Ohn'ahran Plains Advanced: Bronze
                15931, -- Ohn'ahran Plains Advanced: Silver
                15932, -- Ohn'ahran Plains Advanced: Gold
                17198, -- Ohn'ahran Plains Reverse: Bronze
                17199, -- Ohn'ahran Plains Reverse: Silver
                17200, -- Ohn'ahran Plains Reverse: Gold
                18754, -- Ohn'ahran Plains Challenge: Bronze
                18755, -- Ohn'ahran Plains Challenge: Silver
                18756, -- Ohn'ahran Plains Challenge: Gold
            },
        },
        { -- The Azure Span
            1278,
            addon.GetMapName(2024),
            {
                15921, -- Azure Span: Bronze
                15922, -- Azure Span: Silver
                15923, -- Azure Span: Gold
                15933, -- Azure Span Advanced: Bronze
                15934, -- Azure Span Advanced: Silver
                15935, -- Azure Span Advanced: Gold
                17201, -- Azure Span Reverse: Bronze
                17202, -- Azure Span Reverse: Silver
                17203, -- Azure Span Reverse: Gold
                18757, -- Azure Span Challenge: Bronze
                18758, -- Azure Span Challenge: Silver
                18759, -- Azure Span Challenge: Gold
            },
        },
        { -- Thaldraszus
            1276,
            addon.GetMapName(2025),
            {
                15924, -- Thaldraszus: Bronze
                15925, -- Thaldraszus: Silver
                15926, -- Thaldraszus: Gold
                15936, -- Thaldraszus Advanced: Bronze
                15937, -- Thaldraszus Advanced: Silver
                15938, -- Thaldraszus Advanced: Gold
                17204, -- Thaldraszus Reverse: Bronze
                17205, -- Thaldraszus Reverse: Silver
                17206, -- Thaldraszus Reverse: Gold
                18760, -- Thaldraszus Challenge: Bronze
                18761, -- Thaldraszus Challenge: Silver
                18762, -- Thaldraszus Challenge: Gold
            },
        },
        { -- The Forbidden Reach
            1411,
            addon.GetMapName(2107),
            {
                17279, -- Forbidden Reach: Bronze
                17280, -- Forbidden Reach: Silver
                17281, -- Forbidden Reach: Gold
                17284, -- Forbidden Reach Advanced: Bronze
                17286, -- Forbidden Reach Advanced: Silver
                17287, -- Forbidden Reach Advanced: Gold
                17288, -- Forbidden Reach Reverse: Bronze
                17289, -- Forbidden Reach Reverse: Silver
                17290, -- Forbidden Reach Reverse: Gold
                17294, -- Forbidden Reach Racing Completionist
                17296, -- Forbidden Reach Racing Completionist: Silver
                17298, -- Forbidden Reach Racing Completionist: Gold
                18779, -- Forbidden Reach Challenge: Bronze
                18780, -- Forbidden Reach Challenge: Silver
                18781, -- Forbidden Reach Challenge: Gold
            },
        },
        { -- Zaralek Cavern
            1423,
            addon.GetMapName(2133),
            {
                17483, -- Zaralek Cavern: Bronze
                17484, -- Zaralek Cavern: Silver
                17485, -- Zaralek Cavern: Gold
                17486, -- Zaralek Cavern Advanced: Bronze
                17487, -- Zaralek Cavern Advanced: Silver
                17488, -- Zaralek Cavern Advanced: Gold
                17489, -- Zaralek Cavern Reverse: Bronze
                17490, -- Zaralek Cavern Reverse: Silver
                17491, -- Zaralek Cavern Reverse: Gold
                17492, -- Zaralek Cavern Racing Completionist
                17493, -- Zaralek Cavern Racing Completionist: Silver
                17494, -- Zaralek Cavern Racing Completionist: Gold
                18786, -- Zaralek Cavern Challenge: Bronze
                18787, -- Zaralek Cavern Challenge: Silver
                18788, -- Zaralek Cavern Challenge: Gold
            },
        },
        {
            15939, -- Dragon Racing Completionist: Bronze
            15940, -- Dragon Racing Completionist: Silver
            15941, -- Dragon Racing Completionist: Gold
            17330, -- Reverse Racer: Bronze
            17331, -- Reverse Racer: Silver
            17332, -- Reverse Racer: Gold
            18790, -- Dragonriding Challenge: Dragon Isles: Bronze
            18791, -- Dragonriding Challenge: Dragon Isles: Silver
            18792, -- Dragonriding Challenge: Dragon Isles: Gold
            19478, -- Now THIS is Dragon Racing!
        },
    },
    { -- Primal Storms
        1360,
        addon.L["Primal Storms"],
        {
            16492, -- Into the Storm
            16498, -- Elemental Overflow
            16499, -- Elemental Overflowing
            16500, -- Elemental Overload
            16461, -- Stormed Off
            16490, -- Storm Chaser
            16468, -- Chasing Storms in The Waking Shores
            16463, -- Thunderstorms in The Waking Shores
            16465, -- Sandstorms in The Waking Shores
            16466, -- Firestorms in The Waking Shores
            16467, -- Snowstorms in The Waking Shores
            16476, -- Chasing Storms in the Ohn'ahran Plains
            16475, -- Thunderstorms in the Ohn'ahran Plains
            16477, -- Sandstorms in the Ohn'ahran Plains
            16478, -- Firestorms in the Ohn'ahran Plains
            16479, -- Snowstorms in the Ohn'ahran Plains
            16484, -- Chasing Storms in The Azure Span
            16480, -- Thunderstorms in The Azure Span
            16481, -- Sandstorms in The Azure Span
            16482, -- Firestorms in The Azure Span
            16483, -- Snowstorms in The Azure Span
            16489, -- Chasing Storms in Thaldraszus
            16485, -- Thunderstorms in Thaldraszus
            16486, -- Sandstorms in Thaldraszus
            16487, -- Firestorms in Thaldraszus
            16488, -- Snowstorms in Thaldraszus
            16502, -- Storming the Runway
        },
    },
    { -- Dragon Isle Drake Cosmetics
        1401,
        addon.GetCategoryInfoTitle(15478),
        {
            16696, -- Renewed Proto-Drake Armor
            16697, -- Renewed Proto-Drake Head Features
            16698, -- Renewed Proto-Drake Tail Features
            16699, -- Renewed Proto-Drake Scales and Patterns
            16700, -- Renewed Proto-Drake Horns and Hair
            16701, -- Windborne Velocidrake Scales and Patterns
            16702, -- Windborne Velocidrake Armor
            16704, -- Windborne Velocidrake Horns and Fur
            16705, -- Windborne Velocidrake Head Features
            16706, -- Windborne Velocidrake Back and Tail
            16707, -- Highland Drake Scales and Patterns
            16708, -- Highland Drake Armor
            16710, -- Highland Drake Horns and Hair
            16711, -- Highland Drake Back and Tail
            16712, -- Highland Drake Head Features
            16723, -- Cliffside Wylderdrake Scales and Patterns
            16724, -- Cliffside Wylderdrake Armor
            16725, -- Cliffside Wylderdrake Horns and Manes
            16726, -- Cliffside Wylderdrake Back and Tail
            16727, -- Cliffside Wylderdrake Head Features
        },
    },
    {
        18804, -- Neltharion's Legacy
        19307, -- Dragon Isles Pathfinder
        19458, -- A World Awoken
        40382, -- Hunt the Harbinger
    },
});