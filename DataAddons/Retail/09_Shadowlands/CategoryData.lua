local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Shadowlands
    6,
    addon.GetCategoryInfoTitle(15439),
    { -- Zones
        344,
        addon.L["Zones"],
        { -- Bastion
            345,
            addon.GetMapName(1533),
            { -- Quests
                346,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14281, -- The Path to Ascension
                    14801, -- Sojourner of Bastion
                    14737, -- What Bastion Remembered
                    14735, -- Flight School Graduate
                    14741, -- Aerial Ace
                    14762, -- Breaking the Stratus Fear
                },
            },
            { -- Exploration
                347,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14303, -- Explore Bastion
                    14307, -- Adventurer of Bastion
                    14311, -- Treasures of Bastion
                    14339, -- Shard Labor
                    14734, -- Rallying Cry of the Ascended
                    14767, -- Count Your Blessings
                    14768, -- What is that Melody?
                    14733, -- In the Hot Seat
                },
            },
            { -- PvP
                348,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14514, -- Tour of Duty: Bastion
                },
            },
            { -- Reputation
                349,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14335, -- The Ascended
                },
            },
        },
        { -- Maldraxxus
            350,
            addon.GetMapName(1536),
            { -- Quests
                351,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14206, -- Blade of the Primus
                    14799, -- Sojourner of Maldraxxus
                },
            },
            { -- Exploration
                352,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14305, -- Explore Maldraxxus
                    14308, -- Adventurer of Maldraxxus
                    14312, -- Treasures of Maldraxxus
                    14626, -- Harvester of Sorrow
                    14802, -- Bloodsport
                    14721, -- It's In The Mix
                    14634, -- Nine Afterlives
                },
            },
            { -- PvP
                353,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14513, -- Tour of Duty: Maldraxxus
                },
            },
            { -- Reputation
                354,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14336, -- Undying Army
                },
            },
        },
        { -- Ardenweald
            355,
            addon.GetMapName(1565),
            { -- Quests
                356,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14164, -- Awaken, Ardenweald
                    14800, -- Sojourner of Ardenweald
                    14671, -- Something's Not Quite Right....
                    14672, -- A Bit of This, A Bit of That
                },
            },
            { -- Exploration
                357,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14304, -- Explore Ardenweald
                    14309, -- Adventurer of Ardenweald
                    14313, -- Treasures of Ardenweald
                    14353, -- Ardenweald's a Stage
                    14791, -- Toss a Seed to Your Hunter...
                    14774, -- Ardenweald Gourmand
                    14788, -- Fractured Faerie Tales
                    14779, -- Wild Hunting
                    14504, -- Niya, As Xavius
                    14505, -- Senthii, As Gul'dan
                    14506, -- Glimmerdust, As Kil'jaeden
                    14507, -- Mi'kai, As Argus
                    14508, -- Glimmerdust, As Jaina
                    14509, -- Astra, As Azshara
                    14510, -- Dreamweaver, As N'Zoth
                },
            },
            { -- PvP
                358,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14511, -- Tour of Duty: Ardenweald
                },
            },
            { -- Reputation
                359,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14337, -- The Wild Hunt
                },
            },
        },
        { -- Revendreth
            360,
            addon.GetMapName(1525),
            { -- Quests
                361,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13878, -- The Master of Revendreth
                    14798, -- Sojourner of Revendreth
                    14233, -- Tea Tales
                    14765, -- Ramparts Racer
                    14766, -- Parasoling
                    14772, -- Caught in a Bat Romance
                },
            },
            { -- Exploration
                362,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14306, -- Explore Revendreth
                    14310, -- Adventurer of Revendreth
                    14314, -- Treasures of Revendreth
                    14277, -- The Accuser's Avowed
                    14274, -- Absolution for All
                    14272, -- Best Bud With Benefits
                    14276, -- It's Always Sinny in Revendreth
                    14769, -- Bat!
                    14771, -- The Afterlife Express
                    14770, -- What We Ride in the Shadows
                    14273, -- Crypt Kicker
                },
            },
            { -- PvP
                363,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    14512, -- Tour of Duty: Revendreth
                },
            },
            { -- Reputation
                364,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14338, -- Court of Harvesters
                },
            },
        },
        { -- The Maw
            365,
            addon.GetMapName(1543),
            { -- Quests
                366,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14334, -- Into the Maw
                    14961, -- Chains of Domination
                    15000, -- United Front
                    15001, -- Jailer's Personal Stash
                    15037, -- This Army
                    15039, -- Up For Grabs
                    15041, -- The Zovaal Shuffle
                    15043, -- Hoarder of Torghast
                    15042, -- Tea for the Troubled
                    15044, -- Krrprripripkraak's Heroes
                    15035, -- On the Offensive
                    15036, -- Rooting Out the Evil
                    15034, -- Wings Against the Flames
                    15033, -- Taking the Tremaculum
                    15032, -- Breaking Their Hold
                },
            },
            { -- Exploration
                367,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14663, -- Explore The Maw
                    14658, -- Soulkeeper's Burden
                    14659, -- Handling His Henchmen
                    14660, -- It's About Sending a Message
                    14738, -- Hunting Party
                    14742, -- Who Sent You?
                    14743, -- Deadly Serious
                    14744, -- Better to Be Lucky Than Dead
                    14745, -- Grand Theft Shadehound
                    14746, -- Prepare for Trouble!
                    14747, -- Make it Double!
                    14761, -- Deciphering Death's Intentions
                    14894, -- To 'Ghast, Two Curios
                    14895, -- 'Ghast Five
                    15054, -- Minions of the Cold Dark
                    15107, -- Conquering Korthia
                    14943, -- Guarmageddon
                },
            },
            { -- Reputation
                368,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14656, -- Trading Partners
                },
            },
            {
                15648, -- Walking in Maw-mphis
            },
        },
        { -- Korthia
            812,
            addon.GetMapName(1961),
            { -- Quests
                817,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15066, -- Reliquary Restoration
                    15055, -- Friend of Ooz
                    15056, -- Friend of Bloop
                    15057, -- Friend of Plaguey
                },
            },
            { -- Exploration
                818,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    15053, -- Explore Korthia
                    15107, -- Conquering Korthia
                    15099, -- Treasures of Korthia
                },
            },
            { -- Reputation
                813,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    15059, -- Death's Advance
                    15069, -- The Archivists' Codex
                },
            },
        },
        { -- Zereth Mortis
            1035,
            addon.GetMapName(1970),
            { -- Quests
                1036,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    15229, -- Traversing the Spheres
                    15336, -- From A to Zereth
                    15259, -- Secrets of the First Ones
                    15515, -- Path to Enlightenment
                    15518, -- A Means to an End
                },
            },
            { -- Exploration
                1037,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    15224, -- Explore Zereth Mortis
                    15391, -- Adventurer of Zereth Mortis
                    15392, -- Dune Dominance
                    15331, -- Treasures of Zereth Mortis
                    15211, -- Completing the Code
                    15402, -- Cyphers of the First Ones
                    15502, -- Sand, Sand Everywhere!
                    15406, -- Synthesized!
                    15407, -- Synthe-fived!
                    15410, -- Synthe-superfived!
                    15411, -- Synthe-supersized!
                    15508, -- Fashion of the First Ones
                    15404, -- Cosmic Empowerment
                    15509, -- Tales of the Exile
                    15512, -- Adventures in Zereth Mortis
                    15513, -- Curious Collections
                    15514, -- Unlocking the Secrets
                    15542, -- Apocopocolypse Now
                },
            },
            { -- Reputation
                1038,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    15220, -- The Enlightened
                },
            },
        },
        {
            14280, -- Loremaster of Shadowlands
            14758, -- The World Beyond
            15388, -- Shadowlands Explorer
            14825, -- Shadowlands Voyager
            14731, -- To All the Squirrels I've Loved and Lost
            14515, -- Zo'Sorg's Bidding
            14516, -- Impressing Zo'Sorg
            14519, -- Covenant Combat
            14315, -- Shadowlands Diplomat
            15064, -- Breaking the Chains
            7520, -- The Loremaster
        },
    },
    { -- Dungeons
        369,
        addon.GetCategoryInfoTitle(15272),
        { -- The Necrotic Wake
            371,
            addon.GetInstanceInfoName(1182),
            {
                14295, -- Bountiful Harvest
                14320, -- Surgeon's Supplies
                14285, -- Ready for Raiding VII
                14366, -- The Necrotic Wake
                14367, -- Heroic: The Necrotic Wake
                14368, -- Mythic: The Necrotic Wake
                15045, -- Keystone Hero: The Necrotic Wake
            },
        },
        { -- Plaguefall
            372,
            addon.GetInstanceInfoName(1183),
            {
                14292, -- Riding with my Slimes
                14347, -- Full Gores Meal
                14296, -- Going Viral
                14369, -- Plaguefall
                14414, -- Heroic: Plaguefall
                14415, -- Mythic: Plaguefall
                15046, -- Keystone Hero: Plaguefall
            },
        },
        { -- Mists of Tirna Scithe
            373,
            addon.GetInstanceInfoName(1184),
            {
                14503, -- Hooked On Hydroponics
                14291, -- Someone Could Trip on These!
                14375, -- Hunger for Knowledge
                14371, -- Mists of Tirna Scithe
                14412, -- Heroic: Mists of Tirna Scithe
                14413, -- Mythic: Mists of Tirna Scithe
                15047, -- Keystone Hero: Mists of Tirna Scithe
            },
        },
        { -- Halls of Atonement
            374,
            addon.GetInstanceInfoName(1185),
            {
                14567, -- Picking Up the Pieces
                14284, -- Breaking Bad
                14352, -- Nobody Puts Denathrius in a Corner
                14370, -- Halls of Atonement
                14410, -- Heroic: Halls of Atonement
                14411, -- Mythic: Halls of Atonement
                15048, -- Keystone Hero: Halls of Atonement
            },
        },
        { -- Spires of Ascension
            375,
            addon.GetInstanceInfoName(1186),
            {
                14331, -- Goliath Offline
                14323, -- ExSPEARiential
                14327, -- I Can See My House From Here
                14326, -- Spires of Ascension
                14324, -- Heroic: Spires of Ascension
                14325, -- Mythic: Spires of Ascension
                15049, -- Keystone Hero: Spires of Ascension
            },
        },
        { -- Theater of Pain
            376,
            addon.GetInstanceInfoName(1187),
            {
                14297, -- Three Choose One
                14607, -- Fresh Meat!
                14533, -- Royal Rumble
                14372, -- Theater of Pain
                14416, -- Heroic: Theater of Pain
                14417, -- Mythic: Theater of Pain
                15050, -- Keystone Hero: Theater of Pain
            },
        },
        { -- De Other Side
            377,
            addon.GetInstanceInfoName(1188),
            {
                14354, -- Highly Communicable
                14374, -- Couple's Therapy
                14606, -- Thinking with...
                14373, -- De Other Side
                14408, -- Heroic: De Other Side
                14409, -- Mythic: De Other Side
                15051, -- Keystone Hero: De Other Side
            },
        },
        { -- Sanguine Depths
            378,
            addon.GetInstanceInfoName(1189),
            {
                14286, -- Residue Evil
                14290, -- I Only Have Eyes For You
                14289, -- Kaal-ed Shot
                14197, -- Sanguine Depths
                14198, -- Heroic: Sanguine Depths
                14199, -- Mythic: Sanguine Depths
                15052, -- Keystone Hero: Sanguine Depths
            },
        },
        { -- Tazavesh, the Veiled Market
            823,
            addon.GetInstanceInfoName(1194),
            {
                15109, -- Will it Blend?
                15106, -- Quality Control
                15179, -- This is Fine
                15190, -- Mischief!
                15178, -- Fake It 'Til You Make It
                15177, -- Tazavesh, the Veiled Market
                15650, -- Mythic: Streets of Wonder
                15652, -- Mythic: So'leah's Gambit
                61092, -- Hard Mode: Tazavesh, the Veiled Market
                61093, -- Flawless Transaction
                15500, -- Keystone Hero: Tazavesh, the Veiled Market
            },
        },
        {
            14418, -- Shadowlands Dungeon Hero
            15651, -- Myths of the Shadowlands Dungeons
            14322, -- Glory of the Shadowlands Hero
            11183, -- Keystone Initiate
            11184, -- Keystone Challenger
            11185, -- Keystone Conqueror
            11162, -- Keystone Master
            14938, -- Shadowlands Keystone Explorer: Season One
            14531, -- Shadowlands Keystone Conqueror: Season One
            14532, -- Shadowlands Keystone Master: Season One
            15073, -- Shadowlands Keystone Explorer: Season Two
            15077, -- Shadowlands Keystone Conqueror: Season Two
            15078, -- Shadowlands Keystone Master: Season Two
            15327, -- Tormented Hero: Shadowlands Season 2
            15496, -- Shadowlands Keystone Explorer: Season Three
            15498, -- Shadowlands Keystone Conqueror: Season Three
            15499, -- Shadowlands Keystone Master: Season Three
            15506, -- Shadowlands Keystone Hero: Season Three
            15691, -- Cryptic Hero: Shadowlands Season 3
            15688, -- Shadowlands Keystone Explorer: Season Four
            15689, -- Shadowlands Keystone Conqueror: Season Four
            15690, -- Shadowlands Keystone Master: Season Four
            15756, -- Shrouded Hero: Shadowlands Season 4
        },
    },
    { -- Raids
        370,
        addon.GetCategoryInfoTitle(15271),
        { -- Castle Nathria
            379,
            addon.GetInstanceInfoName(1190),
            { -- Glory
                860,
                addon.L["Glory"],
                {
                    14293, -- Blind as a Bat
                    14523, -- Taking Care of Business
                    14376, -- Feed the Beast
                    14524, -- I Don't Know What I Expected
                    14617, -- Private Stock
                    14608, -- Burning Bright
                    14619, -- Pour Decision Making
                    14294, -- Dirtflap's Revenge
                    14525, -- Feed Me, Seymour!
                    14610, -- Clear Conscience
                },
            },
            { -- Mythic
                861,
                addon.L["Mythic"],
                {
                    14356, -- Mythic: Shriekwing
                    14357, -- Mythic: Huntsman Altimor
                    14358, -- Mythic: Hungering Destroyer
                    14361, -- Mythic: Lady Inerva Darkvein
                    14359, -- Mythic: Artificer Xy'mox
                    14360, -- Mythic: Sun King's Salvation
                    14362, -- Mythic: The Council of Blood
                    14363, -- Mythic: Sludgefist
                    14364, -- Mythic: Stone Legion Generals
                    14365, -- Mythic: Sire Denathrius
                },
            },
            {
                14715, -- Castle Nathria
                14717, -- Heroic: Castle Nathria
                14718, -- Mythic: Castle Nathria
                14460, -- Ahead of the Curve: Sire Denathrius
                14461, -- Cutting Edge: Sire Denathrius
                14614, -- Castle Vain
                15663, -- Fate of Nathria
                15664, -- Heroic: Fate of Nathria
                15665, -- Mythic: Fate of Nathria
            },
        },
        { -- Sanctum of Domination
            821,
            addon.GetInstanceInfoName(1193),
            { -- Glory
                858,
                addon.L["Glory"],
                {
                    14998, -- Name A Better Duo, I'll Wait
                    15065, -- Eye Wish You Were Here
                    15003, -- To the Nines
                    15058, -- I Used to Bullseye Deeprun Rats Back Home
                    15105, -- Tormentor's Tango
                    15131, -- Whack-A-Soul
                    15132, -- Knowledge is Power
                    15040, -- Flawless Fate
                    15108, -- Together Forever
                    15133, -- This World is a Prism
                },
            },
            { -- Mythic
                859,
                addon.L["Mythic"],
                {
                    15112, -- Mythic: The Tarragrue
                    15113, -- Mythic: The Eye of the Jailer
                    15114, -- Mythic: The Nine
                    15115, -- Mythic: Remnant of Ner'zhul
                    15116, -- Mythic: Soulrender Dormazain
                    15117, -- Mythic: Painsmith Raznal
                    15118, -- Mythic: Guardian of the First Ones
                    15119, -- Mythic: Fatescribe Roh-Kalo
                    15120, -- Mythic: Kel'Thuzad
                    15121, -- Mythic: Sylvanas Windrunner
                },
            },
            {
                15122, -- The Jailer's Vanguard
                15123, -- The Dark Bastille
                15124, -- Shackles of Fate
                15125, -- The Reckoning
                15126, -- Sanctum of Domination
                15127, -- Heroic: Sanctum of Domination
                15128, -- Mythic: Sanctum of Domination
                15134, -- Ahead of the Curve: Sylvanas Windrunner
                15135, -- Cutting Edge: Sylvanas Windrunner
                15110, -- Dominating the Catwalk
                15191, -- Rae'shalare, Death's Whisper
                15667, -- Fate of Domination
                15668, -- Heroic: Fate of Domination
                15669, -- Mythic: Fate of Domination
            },
        },
        { -- Sepulcher of the First Ones
            1040,
            addon.GetInstanceInfoName(1195),
            { -- Glory
                1041,
                addon.L["Glory"],
                {
                    15381, -- Power ON
                    15401, -- Wisdom Comes From the Desert
                    15398, -- Xy Never, Ever Marks the Spot.
                    15397, -- Four Ring Circus
                    15400, -- Where the Wild Corgis Are
                    15419, -- The Protoform Matrix
                    15386, -- Shimmering Secrets
                    15399, -- Coming to Terms
                    15315, -- Amidst Ourselves
                    15396, -- We Are All Made of Stars
                    15494, -- Damnation Aviation
                },
            },
            { -- Mythic
                1042,
                addon.L["Mythic"],
                {
                    15479, -- Mythic: Vigilant Guardian
                    15480, -- Mythic: Skolex
                    15481, -- Mythic: Artificer Xy'mox
                    15482, -- Mythic: Dausegne
                    15483, -- Mythic: Prototype Pantheon
                    15484, -- Mythic: Lihuvim
                    15485, -- Mythic: Halondrus
                    15486, -- Mythic: Anduin Wrynn
                    15487, -- Mythic: Lords of Dread
                    15488, -- Mythic: Rygelon
                    15489, -- Mythic: The Jailer
                },
            },
            {
                15492, -- Cornerstone of Creation
                15493, -- Ephemeral Plains
                15416, -- Domination's Grasp
                15418, -- The Grand Design
                15417, -- Sepulcher of the First Ones
                15478, -- Heroic: Sepulcher of the First Ones
                15490, -- Mythic: Sepulcher of the First Ones
                15396, -- We Are All Made of Stars
                15468, -- We Are All Made of Stars (Heroic)
                15469, -- We Are All Made of Stars (Mythic)
                15470, -- Ahead of the Curve: The Jailer
                15471, -- Cutting Edge: The Jailer
                15409, -- First Wonders
                15681, -- Fate of the Sepulcher
                15682, -- Heroic: Fate of the Sepulcher
                15683, -- Mythic: Fate of the Sepulcher
            },
        },
        {
            14355, -- Glory of the Nathria Raider
            15130, -- Glory of the Dominant Raider
            15491, -- Glory of the Sepulcher Raider
            15684, -- Fates of the Shadowlands Raids
            15685, -- Heroic: Fates of the Shadowlands Raids
            15687, -- Mythic: Fates of the Shadowlands Raids
        },
    },
    { -- Professions
        1158,
        addon.GetCategoryInfoTitle(169),
        { -- Cooking
            1484,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                14332, -- Shadowlands Cook
            },
        },
        { -- Fishing
            1493,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                14333, -- Shadowlands Fisherman
            },
        },
        {
            14328, -- Professional Shadowlands Master
            14329, -- Working the Afterlife
            14330, -- Shadowlands Master of All
        },
    },
    { -- Pet Battles
        380,
        addon.GetCategoryInfoTitle(15117),
        {
            14867, -- Shadowlands Safari
            14625, -- Battle in the Shadowlands
            14868, -- Aquatic Apparitions
            14869, -- Beast Busters
            14870, -- Creepy Critters
            14871, -- Deathly Dragonkin
            14872, -- Eerie Elementals
            14873, -- Flickering Fliers
            14874, -- Haunted Humanoids
            14875, -- Mummified Magics
            14876, -- Macabre Mechanicals
            14877, -- Unholy Undead
            14879, -- Family Exorcist
            14881, -- Abhorrent Adversaries of the Afterlife
            15004, -- A Sly Fox
        },
    },
    { -- Torghast
        424,
        addon.GetCategoryInfoTitle(15440),
        { -- Skoldus Hall
            843,
            addon.GetAchievmentName(14463),
            true,
            {
                14463, -- Skoldus Hall
                15081, -- Flawless: Skoldus Hall (Layer 12)
                15314, -- Flawless: Skoldus Hall (Layer 16)
            },
        },
        { -- Fracture Chambers
            844,
            addon.GetAchievmentName(14473),
            true,
            {
                14473, -- Fracture Chambers
                15082, -- Flawless: Fracture Chambers (Layer 12)
                15316, -- Flawless: Fracture Chambers (Layer 16)
            },
        },
        { -- The Soulforges
            845,
            addon.GetAchievmentName(14478),
            true,
            {
                14478, -- The Soulforges
                15084, -- Flawless: The Soulforges (Layer 12)
                15317, -- Flawless: The Soulforges (Layer 16)
            },
        },
        { -- Coldheart Interstitia
            846,
            addon.GetAchievmentName(14483),
            true,
            {
                14483, -- Coldheart Interstitia
                15083, -- Flawless: Coldheart Interstitia (Layer 12)
                15318, -- Flawless: Coldheart Interstitia (Layer 16)
            },
        },
        { -- Mort'regar
            847,
            addon.GetAchievmentName(14488),
            true,
            {
                14488, -- Mort'regar
                15087, -- Flawless: Mort'regar (Layer 12)
                15319, -- Flawless: Mort'regar (Layer 16)
            },
        },
        { -- The Upper Reaches
            848,
            addon.GetAchievmentName(14493),
            true,
            {
                14493, -- The Upper Reaches
                15088, -- Flawless: The Upper Reaches (Layer 12)
                15320, -- Flawless: The Upper Reaches (Layer 16)
            },
        },
        { -- Other wings
            1039,
            addon.L["Other wings"],
            {
                14468, -- Twisting Corridors: Layer 1
                14469, -- Twisting Corridors: Layer 2
                14470, -- Twisting Corridors: Layer 3
                14471, -- Twisting Corridors: Layer 4
                14472, -- Twisting Corridors: Layer 5
                14568, -- Twisting Corridors: Layer 6
                14569, -- Twisting Corridors: Layer 7
                14570, -- Twisting Corridors: Layer 8
                15251, -- The Jailer's Gauntlet: Layer 1
                15252, -- The Jailer's Gauntlet: Layer 2
                15253, -- The Jailer's Gauntlet: Layer 3
                15254, -- The Jailer's Gauntlet: Layer 4
                15255, -- The Jailer's Gauntlet: Layer 5
                15256, -- The Jailer's Gauntlet: Layer 6
                15257, -- The Jailer's Gauntlet: Layer 7
                15258, -- The Jailer's Gauntlet: Layer 8
            },
        },
        {
            14808, -- Touring Torghast
            14809, -- Traversing Torghast
            14810, -- Terror of Torghast
            15091, -- A Taste of Perfection
            15089, -- Flawless Master (Layer 12)
            15322, -- Flawless Master (Layer 16)
            14499, -- Phanciful
            14500, -- Phantastic
            14501, -- Phanatical
            14498, -- Gatekeepers of Torghast
            14773, -- Explosive Extermination
            14776, -- For the Hoarder!
            14778, -- Extremely Ravenous
            14754, -- The Forgotten One
            14755, -- Legendary Accord
            14759, -- It's Coming Back to Me...
            14760, -- Recollection Collection
            14795, -- Clearing the Fog
            15067, -- Adamant Vaults
            15075, -- Infiltrators
            15076, -- The Box of Many Things
            15080, -- So Blessed
            15079, -- Many, Many Things
            15093, -- Avenge Me!
            15095, -- No Doubt
            15094, -- Rampage
            15096, -- Crowd Pleaser
            15092, -- Master of Torment
            15324, -- Tower Ranger
        },
    },
    { -- Covenant Sanctums
        419,
        addon.GetCategoryInfoTitle(15441),
        { -- Kyrian
            423,
            addon.GetCovenantName(1),
            {
                14851, -- Bastion of Protection
                14852, -- The Hoot of the Issue
                14853, -- All The Colors of the Painbow
                14854, -- It's Not What You Wear
                14502, -- Pursuing Loyalty
                14856, -- Charmed, I'm Sure
                14857, -- Itsy Bitsy Fighters
                14858, -- Curse of Thirst
                14859, -- Inside the Park Home Run
                14860, -- Bare Necessities
                14861, -- Learning from the Masters
                14862, -- It's How You Wear It
                14863, -- Death Foursworn
                14864, -- Personal Nightmare
                14865, -- Disciple of Humility
                14866, -- Master of the Path
                14887, -- To the Moon
            },
        },
        { -- Venthyr
            421,
            addon.GetCovenantName(2),
            {
                14678, -- Court Favors
                14679, -- Party Palace
                14680, -- Something for Everyone
                14681, -- Dredger Academy
                14682, -- The Party Herald
                14683, -- Dredger Style
                14723, -- Be Our Guest
                14724, -- People Pleaser
                14725, -- We Happy Few
                14726, -- It's Certainly Never Boring
                14727, -- Master of Ceremonies
                14749, -- Rendle's Big Day
            },
        },
        { -- Night Fae
            422,
            addon.GetCovenantName(3),
            {
                14670, -- That's the Spirit
                14675, -- Spirit Talker
                14676, -- Divine Spirit Savior
                14677, -- Spiritual Observations
                14775, -- Mush Appreciated
                14780, -- Meditation Master
                14789, -- All Spirits Great and Small
            },
        },
        { -- Necrolord
            420,
            addon.GetCovenantName(4),
            {
                14684, -- Abominable Lives
                14748, -- Wardrobe Makeover
                14751, -- The Gang's All Here
                14752, -- Things To Do When You're Dead
                14753, -- It's a Wrap
                14764, -- The Great Luckydo
                14833, -- Fashion Abomination
                14763, -- Crypt Couture
            },
        },
        {
            14627, -- Choosing Your Purpose
            14790, -- Covenant Campaign
            15647, -- Dead Men Tell Some Tales
            14834, -- Bound with Purpose
            14835, -- A Resolute Bond
            14836, -- Unwavering Bond
            14837, -- Nexus of Bonds
            14628, -- The Road to Renown
            14629, -- Gaining Respect
            14630, -- Becoming a Hero
            14631, -- Champion of the Covenant
            15241, -- Renowned
            15646, -- Re-Re-Re-Renowned
            14632, -- Conducting Anima
            14633, -- Master Navigator
            14636, -- Adventurer in Chief
            14839, -- Adventures: Off To Adventure
            14840, -- Adventures: Learning the Ropes
            14841, -- Adventures: Now You're Cooking
            14842, -- Adventures: Strength and Resilience
            14843, -- Adventures: Harmony of Purpose
            14844, -- Adventures: Into the Breach
            14845, -- Adventures: A Step in the Right Direction
            14846, -- Adventures: Leaves in the Forest
            14847, -- Adventures: Protector of the Shadowlands
            14637, -- Your Covenant's Flavor
            14638, -- The Anima Must Flow
            14639, -- Dedication to the Restoration
            14777, -- Restoration Expert
            15023, -- We Can Rebuild
            15024, -- Denying the Drought
            15025, -- Sanctum Superior
            15649, -- Shadowlands Dilettante
        },
    },
    {
        15654, -- Back from the Beyond (Legacy)
        20501, -- Back from the Beyond
    },
});