local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Legion
    237,
    addon.GetCategoryInfoTitle(15258),
    { -- Zones
        381,
        addon.L["Zones"],
        { -- Broken Isles
            396,
            addon.GetMapName(619),
            { -- Quests
                397,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11157, -- Loremaster of Legion
                    10877, -- Pillars of Creation
                    11189, -- Variety is the Spice of Life
                    11186, -- Tehd & Marius' Excellent Adventure
                    11240, -- Harbinger
                    11544, -- Defender of the Broken Isles
                    11846, -- Champions of Legionfall
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                398,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14729, -- To All the Squirrels I Love Despite Their Scars
                    11188, -- Broken Isles Explorer
                },
            },
            { -- PvP
                413,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11474, -- Free For All, More For Me
                },
            },
            { -- Reputation
                414,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10672, -- Broken Isles Diplomat
                    11159, -- Friends in a Broken Land
                    11652, -- The Reputable
                    11653, -- Paragon of the Broken Isles
                    11941, -- Chromie Homie
                },
            },
            {
                11160, -- Unleashed Monstrosities
            },
        },
        { -- Dalaran
            382,
            addon.GetMapName(626),
            { -- Quests
                383,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12416, -- The Total Package
                    12431, -- Post Haste
                    12439, -- Priority Mail
                },
            },
            { -- Exploration
                405,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    11066, -- Underbelly Tycoon
                },
            },
            { -- Professions
                1448,
                addon.GetCategoryInfoTitle(169),
                true,
                {
                    10585, -- Fel-Smelter
                    10586, -- Mass Obliteration
                },
            },
            {
                10770, -- The Tangerine Traveler
            },
        },
        { -- Azsuna
            384,
            addon.GetMapName(630),
            { -- Quests
                385,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10763, -- Azsuna Matata
                    -- 51753, -- Azsuna Matata
                },
            },
            { -- Exploration
                399,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10665, -- Explore Azsuna
                    11175, -- Higher Dimensional Learning
                    11256, -- Treasures of Azsuna
                    11261, -- Adventurer of Azsuna
                },
            },
            { -- PvP
                412,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11475, -- Mission Accomplished
                },
            },
        },
        { -- Val'sharah
            387,
            addon.GetMapName(641),
            { -- Quests
                391,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10698, -- That's Val'sharah Folks!
                },
            },
            { -- Exploration
                400,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10666, -- Explore Val'sharah
                    11258, -- Treasures of Val'sharah
                    11262, -- Adventurer of Val'sharah
                },
            },
            { -- PvP
                411,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11477, -- Off the Top Rook
                },
            },
        },
        { -- Highmountain
            388,
            addon.GetMapName(650),
            { -- Quests
                392,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10059, -- Ain't No Mountain High Enough
                    10774, -- Hatchling of the Talon
                    10626, -- Zoom!
                    10398, -- Drum Circle
                    11427, -- No Shellfish Endeavor
                    61910, -- Mrglgrgl of Grglmrgl
                },
            },
            { -- Exploration
                401,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10667, -- Explore Highmountain
                    11257, -- Treasures of Highmountain
                    11264, -- Adventurer of Highmountain
                },
            },
            { -- PvP
                410,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11478, -- The Darkbrul-oh
                },
            },
            { -- Reputation
                416,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12292, -- Highmountain Tribe
                },
            },
        },
        { -- Stormheim
            386,
            addon.GetMapName(634),
            { -- Quests
                390,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10790, -- Vrykul Story, Bro
                    10793, -- What a Ripoff!
                    11232, -- Lock, Stock and Two Smoking Goblins
                    11427, -- No Shellfish Endeavor
                },
            },
            { -- Exploration
                402,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10668, -- Explore Stormheim
                    10627, -- Going Up
                    11259, -- Treasures of Stormheim
                    11263, -- Adventurer of Stormheim
                    11178, -- Wake the Dragon
                },
            },
            { -- PvP
                409,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    11476, -- Saddle Sore
                },
            },
        },
        { -- Suramar
            389,
            addon.GetMapName(680),
            { -- Quests
                393,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    10617, -- Nightfallen But Not Forgotten
                    11124, -- Good Suramaritan
                    10756, -- Leyline Bling
                    11125, -- Now You're Thinking With Portals
                    11133, -- Why Can't I Hold All This Mana?
                    11340, -- Insurrection
                    11427, -- No Shellfish Endeavor
                },
            },
            { -- Exploration
                403,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    10669, -- Explore Suramar
                    11260, -- Treasures of Suramar
                    11265, -- Adventurer of Suramar
                },
            },
            { -- Reputation
                415,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    10778, -- The Nightfallen
                },
            },
        },
        { -- Broken Shore
            394,
            addon.GetMapName(646),
            { -- Quests
                395,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11607, -- They See Me Rolling
                    11546, -- Breaching the Tomb
                    11681, -- Crate Expectations
                    11731, -- A Magic Contribution
                    11732, -- A Magnificent Contribution
                    11735, -- Take Command
                    11736, -- Assume Command
                    11737, -- Disrupting the Nether
                    11738, -- It'll Nether Happen
                },
            },
            { -- Exploration
                404,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    11543, -- Explore Broken Shore
                    11802, -- Bringing Home the Beacon
                    11841, -- Naxt Victim
                },
            },
            { -- Reputation
                417,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    11545, -- Legionfall Commander
                    11796, -- Armies of Legionfall
                },
            },
            {
                11786, -- Terrors of the Shore
            },
        },
        { -- Argus
            406,
            addon.GetMapName(905),
            { -- Quests
                407,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12066, -- You Are Now Prepared!
                    12073, -- Locked and Loaded
                    18854, -- Seeing Red
                },
            },
            { -- Exploration
                408,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12074, -- Shoot First, Loot Later
                    12084, -- Infused and Abused
                    12028, -- Envision Invasion Eradication
                    12026, -- Invasion Obliteration
                    12069, -- Explore Argus
                    12077, -- Adventurer of Argus
                    12078, -- Commander of Argus
                    12083, -- Paragon of Argus
                    12101, -- We Came Here For Two Reasons
                    12102, -- To Kill Demons...
                    12103, -- ...And Chew Mana Buns
                    12104, -- And We're All Out of Mana Buns
                },
            },
            { -- Reputation
                418,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12076, -- Protector of the Argussian Reach
                    12081, -- Officer of the Light
                },
            },
        },
    },
    { -- Dungeons
        238,
        addon.GetCategoryInfoTitle(15272),
        { -- Eye of Azshara
            240,
            addon.GetInstanceInfoName(716),
            {
                10456, -- But You Say He's Just a Friend
                10457, -- Stay Salty
                10458, -- Ready for Raiding V
                10780, -- Eye of Azshara
                10781, -- Heroic: Eye of Azshara
                10782, -- Mythic: Eye of Azshara
            },
        },
        { -- Darkheart Thicket
            241,
            addon.GetInstanceInfoName(762),
            {
                10766, -- Egg-cellent!
                10769, -- Burning Down the House
                10783, -- Darkheart Thicket
                10784, -- Heroic: Darkheart Thicket
                10785, -- Mythic: Darkheart Thicket
                19085, -- Keystone Hero: Darkheart Thicket
            },
        },
        { -- Halls of Valor
            242,
            addon.GetInstanceInfoName(721),
            {
                10544, -- Stag Party
                10542, -- I Got What You Mead
                10543, -- Surge Protector
                10786, -- Halls of Valor
                10788, -- Heroic: Halls of Valor
                10789, -- Mythic: Halls of Valor
                16659, -- Keystone Hero: Halls of Valor
            },
        },
        { -- Neltharions Lair
            243,
            addon.GetInstanceInfoName(767),
            {
                10996, -- Got to Ketchum All
                10875, -- Can't Eat Just One
                10795, -- Neltharion's Lair
                10796, -- Heroic: Neltharion's Lair
                10797, -- Mythic: Neltharion's Lair
                17850, -- Keystone Hero: Neltharion's Lair
            },
        },
        { -- Assault on Violet Hold
            244,
            addon.GetInstanceInfoName(777),
            {
                10554, -- I Made a Food!
                10553, -- You're Just Making It WORSE!
                10798, -- Assault on Violet Hold
                10799, -- Heroic: Assault on Violet Hold
                10800, -- Mythic: Assault on Violet Hold
            },
        },
        { -- Vault of the Wardens
            245,
            addon.GetInstanceInfoName(707),
            {
                10679, -- I Ain't Even Cold
                10680, -- Who's Afraid of the Dark?
                10707, -- A Specter, Illuminated
                10801, -- Vault of the Wardens
                10802, -- Heroic: Vault of the Wardens
                10803, -- Mythic: Vault of the Wardens
            },
        },
        { -- Black Rook Hold
            246,
            addon.GetInstanceInfoName(740),
            {
                10710, -- Black Rook Moan
                10709, -- You Used to Scrawl Me In Your Fel Tome
                10711, -- Adds? More Like Bads
                10804, -- Black Rook Hold
                10805, -- Heroic: Black Rook Hold
                10806, -- Mythic: Black Rook Hold
                19084, -- Keystone Hero: Black Rook Hold
            },
        },
        { -- Maw of Souls
            247,
            addon.GetInstanceInfoName(727),
            {
                10413, -- Instant Karma
                10411, -- Helheim Hath No Fury
                10412, -- Poor Unfortunate Souls
                10807, -- Maw of Souls
                10808, -- Heroic: Maw of Souls
                10809, -- Mythic: Maw of Souls
            },
        },
        { -- The Arcway
            248,
            addon.GetInstanceInfoName(726),
            {
                10773, -- Arcanic Cling
                10775, -- Clean House
                10776, -- No Time to Waste
                10813, -- Mythic: The Arcway
            },
        },
        { -- Court of Stars
            249,
            addon.GetInstanceInfoName(800),
            {
                10610, -- Waiting for Gerdo
                10611, -- Dropping Some Eaves
                10816, -- Mythic: Court of Stars
                16658, -- Keystone Hero: Court of Stars
            },
        },
        { -- Return to Karazhan
            250,
            addon.GetInstanceInfoName(860),
            {
                11430, -- One Night in Karazhan
                11335, -- Season Tickets
                11338, -- Dine and Bash
                11432, -- Scared Straight
                11431, -- The Rat Pack
                11433, -- Burn After Reading
                11929, -- Heroic: Return to Karazhan
                11429, -- Mythic: Return to Karazhan
                15692, -- Keystone Hero: Return to Karazhan
            },
        },
        { -- Cathedral of Eternal Night
            251,
            addon.GetInstanceInfoName(900),
            {
                11768, -- Boom Bloom
                11769, -- A Steamy Romance Saga
                11703, -- Master of Shadows
                11700, -- Cathedral of Eternal Night
                11701, -- Heroic: Cathedral of Eternal Night
                11702, -- Mythic: Cathedral of Eternal Night
            },
        },
        { -- Seat of the Triumvirate
            252,
            addon.GetInstanceInfoName(945),
            {
                12004, -- Welcome the Void
                12005, -- Let it All Out
                12009, -- Darker Side
                12007, -- Heroic: Seat of the Triumvirate
                12008, -- Mythic: Seat of the Triumvirate
                61270, -- Keystone Hero: Seat of the Triumvirate
                61593, -- Keystone Victor: Seat of the Triumvirate
            },
        },
        {
            11164, -- Legion Dungeon Hero
            11163, -- Glory of the Legion Hero
            11181, -- Legion Keymaster
        },
    },
    { -- Raids
        239,
        addon.GetCategoryInfoTitle(15271),
        { -- The Emerald Nightmare
            253,
            addon.GetInstanceInfoName(768),
            { -- Glory
                873,
                addon.L["Glory"],
                {
                    10555, -- Buggy Fight
                    10830, -- Took the Red Eye Down
                    10771, -- Webbing Crashers
                    10753, -- Scare Bear
                    10663, -- Imagined Dragons World Tour
                    10772, -- Use the Force(s)
                    10755, -- I Attack the Darkness
                },
            },
            { -- Mythic
                874,
                addon.L["Mythic"],
                {
                    10821, -- Mythic: Nythendra
                    10823, -- Mythic: Il'gynoth
                    10822, -- Mythic: Elerethe Renferal
                    10824, -- Mythic: Ursoc
                    10825, -- Mythic: Dragons of Nightmare
                    10826, -- Mythic: Cenarius
                    10827, -- Mythic: Xavius
                },
            },
            {
                10818, -- Darkbough
                10819, -- Tormented Guardians
                10820, -- Rift of Aln
                42029, -- The Emerald Nightmare
                11194, -- Ahead of the Curve: Xavius
                11191, -- Cutting Edge: Xavius
            },
        },
        { -- The Nighthold
            254,
            addon.GetInstanceInfoName(786),
            { -- Glory
                875,
                addon.L["Glory"],
                {
                    10678, -- Cage Rematch
                    10697, -- Grand Opening
                    10742, -- Gluten Free
                    10817, -- A Change In Scenery
                    10851, -- Elementalry!
                    10754, -- Fruit of All Evil
                    10575, -- Burning Bridges
                    10704, -- Not For You
                    10699, -- Infinitesimal
                    10696, -- I've Got My Eyes On You
                },
            },
            { -- Mythic
                876,
                addon.L["Mythic"],
                {
                    10840, -- Mythic: Skorpyron
                    10842, -- Mythic: Chronomatic Anomaly
                    10843, -- Mythic: Trilliax
                    10844, -- Mythic: Spellblade Aluriel
                    10845, -- Mythic: Star Augur Etraeus
                    10846, -- Mythic: High Botanist Tel'arn
                    10848, -- Mythic: Krosus
                    10847, -- Mythic: Tichondrius
                    10849, -- Mythic: Grand Magistrix Elisande
                    10850, -- Mythic: Gul'dan
                },
            },
            {
                10829, -- Arcing Aqueducts
                10837, -- Royal Athenaeum
                10838, -- Nightspire
                10839, -- Betrayer's Rise
                42030, -- The Nighthold
                11195, -- Ahead of the Curve: Gul'dan
                11192, -- Cutting Edge: Gul'dan
                11628, -- That's So Last Millennium
            },
        },
        { -- Trial of Valor
            255,
            addon.GetInstanceInfoName(861),
            {
                11337, -- You Runed Everything!
                11386, -- Boneafide Tri Tip
                11377, -- Patient Zero
                11394, -- Trial of Valor
                11426, -- Heroic: Trial of Valor
                11396, -- Mythic: Odyn
                11397, -- Mythic: Guarm
                11398, -- Mythic: Helya
                11387, -- The Chosen
                11581, -- Ahead of the Curve: Helya
                11580, -- Cutting Edge: Helya
                11762, -- Can I Get A Helya
            },
        },
        { -- Tomb of Sargeras
            256,
            addon.GetInstanceInfoName(875),
            { -- Glory
                879,
                addon.L["Glory"],
                {
                    11724, -- Fel Turkey!
                    11699, -- Grand Fin-ale
                    11676, -- Five Course Seafood Buffet
                    11696, -- Grin and Bear It
                    11773, -- Wax On, Wax Off
                    11674, -- Great Soul, Great Purpose
                    11675, -- Sky Walker
                    11683, -- Bingo!
                    11770, -- Dark Souls
                },
            },
            { -- Mythic
                880,
                addon.L["Mythic"],
                {
                    11767, -- Mythic: Goroth
                    11775, -- Mythic: Harjatan
                    11776, -- Mythic: Mistress Sassz'ine
                    11774, -- Mythic: Demonic Inquisition
                    11777, -- Mythic: Sisters of the Moon
                    11778, -- Mythic: The Desolate Host
                    11779, -- Mythic: Maiden of Vigilance
                    11780, -- Mythic: Fallen Avatar
                    11781, -- Mythic: Kil'jaeden
                },
            },
            {
                11787, -- The Gates of Hell
                11788, -- Wailing Halls
                11789, -- Chamber of the Avatar
                11790, -- Deceiver's Fall
                42031, -- Tomb of Sargeras
                11874, -- Ahead of the Curve: Kil'jaeden
                11875, -- Cutting Edge: Kil'jaeden
                11760, -- Retro Trend
            },
        },
        { -- Antorus, the Burning Throne
            257,
            addon.GetInstanceInfoName(946),
            { -- Glory
                881,
                addon.L["Glory"],
                {
                    11930, -- Worm-monger
                    12065, -- Hounds Good To Me
                    12129, -- This is the War Room!
                    11928, -- Portal Combat
                    12067, -- Spheres of Influence
                    11949, -- Hard to Kill
                    12030, -- The World Revolves Around Me
                    11948, -- Together We Stand
                    12046, -- Remember the Titans
                    11915, -- Don't Sweat the Technique
                    12257, -- Stardust Crusaders
                },
            },
            { -- Mythic
                882,
                addon.L["Mythic"],
                {
                    11992, -- Mythic: Garothi Worldbreaker
                    11993, -- Mythic: Hounds of Sargeras
                    11994, -- Mythic: Antoran High Command
                    11995, -- Mythic: Portal Keeper Hasabel
                    11996, -- Mythic: Eonar
                    11997, -- Mythic: Imonar the Soulhunter
                    11998, -- Mythic: Kin'garoth
                    11999, -- Mythic: Varimathras
                    12000, -- Mythic: The Coven of Shivarra
                    12001, -- Mythic: Aggramar
                    12002, -- Mythic: Argus the Unmaker
                },
            },
            {
                11988, -- Light's Breach
                11990, -- Hope's End
                11989, -- Forbidden Descent
                11991, -- Seat of the Pantheon
                42032, -- Antorus, the Burning Throne
                12110, -- Ahead of the Curve: Argus the Unmaker
                12111, -- Cutting Edge: Argus the Unmaker
                12020, -- Argussy Up
            },
        },
        {
            11180, -- Glory of the Legion Raider
            11763, -- Glory of the Tomb Raider
            11987, -- Glory of the Argus Raider
        },
    },
    { -- Professions
        1156,
        addon.GetCategoryInfoTitle(169),
        { -- Archaeology
            1473,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                10600, -- Legion Archaeologist
                10601, -- Surveying the Land
                10602, -- This Side Up
                10603, -- A Keen Eye
                10604, -- Legion Curator
                10605, -- Handle With Care
                10606, -- The Dwarven Dream
                10607, -- Getting Your Hands Dirty
                10608, -- Sifting Through the Sand
                10609, -- No Stone Unturned
            },
        },
        { -- Cooking
            1482,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                10589, -- Legion Cook
                10591, -- All Grown Up
                10592, -- Never A Day's Rest
                10762, -- The Legion Menu
                10593, -- Everything Tastes Better
            },
        },
        { -- Engineering
            1489,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                10588, -- The Shortest Distance
            },
        },
        { -- Fishing
            1495,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                10594, -- Legion Fisherman
                10597, -- Legion Aquaculture
                10595, -- A Cast Above the Rest
                10596, -- Bigger Fish to Fry
                10598, -- Fishing 'Round the Isles
                10722, -- The Wish Remover
                11725, -- Fisherfriend of the Isles
            },
        },
        { -- Herbalism
            1502,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18837, -- Broken Isles Herbalism Techniques
            },
        },
        { -- Jewelcrafting
            1508,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                10587, -- Hot Swapper
            },
        },
        { -- Mining
            1517,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18839, -- Broken Isles Mining Techniques
            },
        },
        { -- Skinning
            1521,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18834, -- Broken Isles Skinning Techniques
            },
        },
        {
            10582, -- Professional Legion Master
            10581, -- Working the Isles
            10583, -- Legion Master of All
            10761, -- Resourceful
            10599, -- Legion Medic
            10580, -- Heroic Skills to Pay the Bills
            11138, -- Is There a Medic in the Zone?
            11139, -- Field Medic
        },
    },
    { -- Pet Battles
        430,
        addon.GetCategoryInfoTitle(15117),
        {
            11233, -- Broken Isles Safari
            10876, -- Battle on the Broken Isles
            9686, -- Aquatic Acquiescence
            9687, -- Best of the Beasts
            9688, -- Mousing Around
            9689, -- Dragons!
            9690, -- Ragnaros, Watch and Learn
            9691, -- Flock Together
            9692, -- Murlocs, Harpies, and Wolvar, Oh My!
            9693, -- Master of Magic
            9694, -- Roboteer
            9695, -- The Lil' Necromancer
            9696, -- Family Familiar
            12088, -- Anomalous Animals of Argus
            12089, -- Aquatic Assault
            12091, -- Beast Blitz
            12092, -- Critical Critters
            12093, -- Draconic Destruction
            12094, -- Elemental Escalation
            12095, -- Fierce Fliers
            12096, -- Humanoid Havoc
            12097, -- Magical Mayhem
            12098, -- Mechanical Melee
            12099, -- Unstoppable Undead
            12100, -- Family Fighter
        },
    },
    { -- Brawler's Guild
        792,
        addon.L["Brawler's Guild"],
        {
            11560, -- You Are Not Your $#*@! Legplates (Season 3)
            11561, -- You Are Not Your $#*@! Legplates (Season 3)
            11563, -- The Second Rule of Brawler's Guild (Season 3)
            11564, -- The Second Rule of Brawler's Guild (Season 3)
            11565, -- King of the Guild (Season 3)
            11566, -- King of the Guild (Season 3)
            11572, -- I Am Thrall's Complete Lack Of Surprise (Season 3)
        },
    },
    { -- Class Hall
        429,
        addon.L["Class Halls"],
        {
            addon.GetAchievmentName(11137),
            {
                10994, -- A Glorious Campaign
                11135, -- A Heroic Campaign
                11136, -- An Epic Campaign
                42270, -- The Deathlord's Campaign
                42271, -- The Slayer's Campaign
                42272, -- The Archdruid's Campaign
                42273, -- The Huntmaster's Campaign
                42274, -- The Archmage's Campaign
                42275, -- The Grandmaster's Campaign
                42276, -- The Highlord's Campaign
                42277, -- The High Priest's Campaign
                42279, -- The Shadowblade's Campaign
                42280, -- The Farseer's Campaign
                42281, -- The Netherlord's Campaign
                42282, -- The Battlelord's Campaign
                11137, -- A Legendary Campaign
            },
        },
        {
            addon.GetAchievmentName(11212),
            {
                10706, -- Training the Troops
                11212, -- Raise an Army
                11213, -- Lead a Legion
                60981, -- Raise an Army for Acherus
                60982, -- Raise an Army for the Fel Hammer
                60983, -- Raise an Army for the Dreamgrove
                60984, -- Raise an Army for the Trueshot Lodge
                60985, -- Raise an Army for the Hall of the Guardian
                60986, -- Raise an Army for the Temple of Five Dawns
                60987, -- Raise an Army for the Sanctum of Light
                60988, -- Raise an Army for the Netherlight Temple
                60989, -- Raise an Army for the Hall of Shadows
                60990, -- Raise an Army for the Maelstrom
                60991, -- Raise an Army for the Dreadscar Rift
                60992, -- Raise an Army for Skyhold
                11214, -- Many Missions
                11215, -- Quite a Few Missions
                11216, -- So Many Missions
                11217, -- Many Many Missions, Handle It!
                11218, -- There's a Boss In There
                11219, -- Need Backup
                11220, -- Roster of Champions
                11221, -- Champions Rise
                11222, -- Champions of Power
            },
        },
        {
            addon.GetAchievmentName(11223),
            {
                11223, -- Legendary Research
                60962, -- Legendary Research of the Ebon Blade
                60963, -- Legendary Research of the Illidari
                60964, -- Legendary Research of the Dreamgrove
                60965, -- Legendary Research of the Unseen Path
                60966, -- Legendary Research of the Tirisgarde
                60967, -- Legendary Research of Five Dawns
                60968, -- Legendary Research of the Silver Hand
                60969, -- Legendary Research of the Netherlight Conclave
                60970, -- Legendary Research of the Uncrowned
                60971, -- Legendary Research of the Maelstrom
                60972, -- Legendary Research of the Black Harvest
                60973, -- Legendary Research of the Valarjar
                10852, -- Artifact or Artifiction
                10853, -- Part of History
            },
        },
        {
            addon.GetAchievmentName(10460),
            {
                10746, -- Forged for Battle
                10459, -- Improving on History
                10743, -- The Prestige
                10745, -- The Prestige
                10460, -- Hidden Potential
                42287, -- Hidden Potential of the Deathlord
                42288, -- Hidden Potential of the Slayer
                42289, -- Hidden Potential of the Archdruid
                42290, -- Hidden Potential of the Huntmaster
                42291, -- Hidden Potential of the Archmage
                42292, -- Hidden Potential of the Grandmaster
                42293, -- Hidden Potential of the Highlord
                42294, -- Hidden Potential of the High Priest
                42295, -- Hidden Potential of the Shadowblade
                42296, -- Hidden Potential of the Farseer
                42297, -- Hidden Potential of the Netherlord
                42298, -- Hidden Potential of the Battlelord
                10461, -- Fighting with Style: Classic
                10747, -- Fighting with Style: Upgraded
                10748, -- Fighting with Style: Valorous
                11173, -- Fighting with Style: War-torn
                10749, -- Fighting with Style: War-torn
                10750, -- Fighting with Style: Hidden
                11611, -- A Challenging Look
                11612, -- Fighting with Style: Challenging
            },
        },
        {
            11298, -- A Classy Outfit
            11171, -- Arsenal of Power
            11144, -- Power Realized
            11772, -- Power Ascended
            11609, -- Power Unbound
            11610, -- Power Unleashed
            12071, -- Crucible's Promise
            12072, -- Now You're Cooking with Netherlight
        },
    },
    {
        11190, -- Broken Isles Pathfinder, Part One
        11446, -- Broken Isles Pathfinder, Part Two
    },
});