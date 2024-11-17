local _, addon = ...;

KrowiAF.CategoryData.PvP = { -- TAB - PvP
    955,
    addon.GetCategoryInfoTitle(95),
    {
        TabName = "PvP",
    },
    { -- Player vs. Player
        1162,
        addon.GetCategoryInfoTitle(95),
        {
            10561, -- Honorable Medallion
            238, -- An Honorable Kill
            513, -- 100 Honorable Kills
            515, -- 500 Honorable Kills
            516, -- 1000 Honorable Kills
            512, -- 5000 Honorable Kills
            509, -- 10000 Honorable Kills
            239, -- 25000 Honorable Kills
            869, -- 50000 Honorable Kills
            870, -- 100000 Honorable Kills
            5363, -- 250000 Honorable Kills
            1157, -- Duel-icious
            245, -- That Takes Class
            246, -- Know Thy Enemy
            1005, -- Know Thy Enemy
            247, -- "Make Love, Not Warcraft"
            727, -- Call in the Cavalry
            12567, -- The Horde Slayer
            12568, -- The Alliance Slayer
            3618, -- Murkimus the Gladiator
            8391, -- Tournament Participation 2013
            8392, -- Tournament Glory 2013
            5542, -- 1000 Conquest Points
            5541, -- 5000 Conquest Points
            5540, -- "25,000 Conquest Points"
            5539, -- "50,000 Conquest Points"
            701, -- Freedom of the Alliance
            700, -- Freedom of the Horde
            12571, -- Bounty Hunting
            40464, -- Bounty Master
            40795, -- Battleground Blitz Medic: The War Within
        },
    },
    { -- Honor
        1167,
        addon.GetCategoryInfoTitle(15266),
        {
            12893, -- Honor Level 5
            12894, -- Honor Level 10
            12895, -- Honor Level 15
            12900, -- Honor Level 20
            12901, -- Honor Level 25
            12902, -- Honor Level 30
            12903, -- Honor Level 40
            12904, -- Honor Level 50
            12905, -- Honor Level 60
            12906, -- Honor Level 70
            12907, -- Honor Level 80
            12908, -- Honor Level 90
            12909, -- Honor Level 100
            12910, -- Honor Level 125
            12911, -- Honor Level 150
            12912, -- Honor Level 175
            12913, -- Honor Level 200
            12914, -- Honor Level 250
            12915, -- Honor Level 300
            12916, -- Honor Level 400
            12917, -- Honor Level 500
            13701, -- Battlefield Brawler
            13702, -- Battlefield Tactician
            13703, -- Battlefield Master
        },
    },
    { -- Battlegrounds
        1165,
        addon.GetCategoryInfoTitle(153),
        { -- Alterac Valley
            960,
            addon.GetCategoryInfoTitle(14801),
            {
                218, -- Alterac Valley Victory
                219, -- Alterac Valley Veteran
                221, -- Alterac Grave Robber
                222, -- Tower Defense
                1151, -- Loyal Defender
                224, -- Loyal Defender
                225, -- Everything Counts
                1164, -- Everything Counts
                223, -- The Sickly Gazelle
                220, -- Stormpike Perfection
                873, -- Frostwolf Perfection
                582, -- Alterac Valley All-Star
                707, -- Stormpike Battle Charger
                706, -- Frostwolf Howler
                1166, -- To the Looter Go the Spoils
                1167, -- Master of Alterac Valley
                1168, -- Master of Alterac Valley
                226, -- The Alterac Blitz
                709, -- Hero of the Stormpike Guard
                708, -- Hero of the Frostwolf Clan
            },
        },
        { -- Arathi Basin
            956,
            addon.GetCategoryInfoTitle(14802),
            {
                154, -- Arathi Basin Victory
                155, -- Arathi Basin Veteran
                165, -- Arathi Basin Perfection
                158, -- Me and the Cappin' Makin' it Happen
                73, -- Disgracin' The Basin
                1153, -- Overly Defensive
                157, -- To The Rescue!
                161, -- Resilient Victory
                156, -- Territorial Dominance
                159, -- Let's Get This Done
                162, -- We Had It All Along *cough*
                583, -- Arathi Basin All-Star
                584, -- Arathi Basin Assassin
                1169, -- Master of Arathi Basin
                1170, -- Master of Arathi Basin
                711, -- Knight of Arathor
                710, -- The Defiler
            },
        },
        { -- Ashran
            961,
            addon.GetCategoryInfoTitle(15414),
            {
                9102, -- Ashran Victory
                9218, -- "Grand Theft, 1st Degree"
                9219, -- "Grand Theft, 2nd Degree"
                9220, -- "Grand Theft, 3rd Degree"
                9256, -- Rescue Operation
                9257, -- Rescue Operation
                9106, -- Just for Me
                9216, -- High-value Targets
                9104, -- Bounty Hunter
                9103, -- Bounty Hunter
                9222, -- Divide and Conquer
                9228, -- Down Goes Van Rook
                9225, -- Take Them Out
                9224, -- Take Them Out
                9408, -- Operation Counterattack
                9217, -- Operation Counterattack
                9105, -- Tour of Duty
                9714, -- Thy Kingdom Come
                9715, -- Thy Kingdom Come
                9474, -- Wrynn's Vanguard
                9473, -- Vol'jin's Spear
                9214, -- Hero of Stormshield
                9215, -- Hero of Warspear
            },
        },
        { -- Battle for Gilneas
            964,
            addon.GetCategoryInfoTitle(15073),
            {
                5245, -- Battle for Gilneas Victory
                5246, -- Battle for Gilneas Veteran
                5247, -- Battle for Gilneas Perfection
                5248, -- Bustin' Caps to Make It Haps
                5249, -- One Two Three You Don't Know About Me
                5250, -- Out of the Fog
                5251, -- Not Your Average PUG'er
                5252, -- Don't Get Cocky Kid
                5253, -- Full Coverage
                5254, -- Newbs to Plowshares
                5255, -- Jugger Not
                5256, -- Battle for Gilneas All-Star
                5257, -- Battle for Gilneas Assassin
                5262, -- Double Rainbow
                5258, -- Master of the Battle for Gilneas
            },
        },
        { -- Deepwind Gorge
            957,
            addon.GetCategoryInfoTitle(15218),
            {
                8331, -- Deepwind Gorge Victory
                8332, -- Deepwind Gorge Veteran
                8333, -- Deepwind Gorge Perfection
                14187, -- Cruisin' for a Brewsin'
                14186, -- Market Dominance
                14188, -- Well Gorged
                14175, -- Master of Deepwind Gorge
                8350, -- Mine! Mine! Mine!
                8351, -- Other People's Property
                8354, -- Puddle Jumper
                8355, -- Weighed Down
                8359, -- Capping Spree
                8358, -- Deepwind Gorge All-Star
                8360, -- Master of Deepwind Gorge
            },
        },
        { -- Eye of the Storm
            959,
            addon.GetCategoryInfoTitle(14803),
            {
                208, -- Eye of the Storm Victory
                209, -- Eye of the Storm Veteran
                783, -- The Perfect Storm
                784, -- Eye of the Storm Domination
                214, -- Flurry
                213, -- Stormtrooper
                212, -- Storm Capper
                216, -- Bound for Glory
                233, -- Bloodthirsty Berserker
                1171, -- Master of Eye of the Storm
                587, -- Stormy Assassin
                1258, -- Take a Chill Pill
                211, -- Storm Glory
            },
        },
        { -- Isle of Conquest
            962,
            addon.GetCategoryInfoTitle(15003),
            {
                3776, -- Isle of Conquest Victory
                3777, -- Isle of Conquest Veteran
                3851, -- Mine
                4177, -- Mine
                3847, -- Four Car Garage
                3848, -- A-bomb-inable
                3849, -- A-bomb-ination
                3850, -- Mowed Down
                3852, -- Cut the Blue Wire... No the Red Wire!
                3853, -- All Over the Isle
                3854, -- Back Door Job
                3856, -- Demolition Derby
                4256, -- Demolition Derby
                3855, -- Glaive Grave
                3857, -- Master of Isle of Conquest
                3957, -- Master of Isle of Conquest
                3845, -- Isle of Conquest All-Star
                3846, -- Resource Glut
                4176, -- Resource Glut
            },
        },
        { -- Seething Shore
            968,
            addon.GetCategoryInfoTitle(15292),
            {
                12409, -- Seething Shore Victory
                12410, -- Seething Shore Veteran
                12404, -- Claim Jumper
                12405, -- Death from Above
                12406, -- A Good Start
                12407, -- Seething Shore Perfection
                12408, -- Seething Shore Domination
                12411, -- Blood and Sand
                12412, -- Master of Seething Shore
            },
        },
        { -- Silvershard Mines
            966,
            addon.GetCategoryInfoTitle(15162),
            {
                6739, -- Silvershard Mines Victory
                6883, -- Silvershard Mines Veteran
                7039, -- The Long Riders
                7049, -- Mine Cart Courier
                7057, -- End of the Line
                7062, -- Mine Mine Mine!
                7099, -- Five for Five
                7100, -- My Diamonds and Your Rust
                7102, -- Escort Service
                7103, -- Greed is Good
                7106, -- Master of Silvershard Mines
            },
        },
        { -- Strand of the Ancients
            973,
            addon.L["Strand of the Ancients"],
            {
                1308, -- Strand of the Ancients Victory
                1309, -- Strand of the Ancients Veteran
                1310, -- Storm the Beach
                1765, -- Steady Hands
                1761, -- The Dapper Sapper
                2193, -- Explosives Expert
                1762, -- Not Even a Scratch
                2192, -- Not Even a Scratch
                1763, -- Artillery Veteran
                2189, -- Artillery Expert
                1764, -- Drop It!
                2190, -- Drop It Now!
                1766, -- Ancient Protector
                2191, -- Ancient Courtyard Protector
                1757, -- Defense of the Ancients
                2200, -- Defense of the Ancients
                2194, -- Master of Strand of the Ancients
                2195, -- Master of Strand of the Ancients
            },
        },
        { -- Temple of Kotmogu
            967,
            addon.GetCategoryInfoTitle(15163),
            {
                6740, -- Temple of Kotmogu Victory
                6882, -- Temple of Kotmogu Veteran
                6947, -- Four Square
                6950, -- Powerball
                6970, -- Blackout
                6973, -- Can't Stop Won't Stop
                6971, -- I've Got the Power
                6972, -- What is Best in Life?
                6980, -- Temple of Kotmogu All-Star
                6981, -- Master of Temple of Kotmogu
            },
        },
        { -- Twin Peaks
            965,
            addon.GetCategoryInfoTitle(15074),
            {
                5208, -- Twin Peaking
                5209, -- Twin Peaks Veteran
                5210, -- Two-Timer
                5211, -- Top Defender
                5213, -- Soaring Spirits
                5214, -- Soaring Spirits
                5215, -- Twin Peaks Perfection
                5216, -- Peak Speed
                5226, -- Cloud Nine
                5227, -- Cloud Nine
                5229, -- Drag a Maw
                5228, -- Wild Hammering
                5219, -- I'm in the White Lodge
                5220, -- I'm in the Black Lodge
                5221, -- "Fire, Walk With Me"
                5222, -- "Fire, Walk With Me"
                5230, -- Twin Peaks Mountaineer
                5231, -- Double Jeopardy
                5552, -- Double Jeopardy
                5223, -- Master of Twin Peaks
                5259, -- Master of Twin Peaks
            },
        },
        { -- Warsong Gulch
            958,
            addon.GetCategoryInfoTitle(14804),
            {
                166, -- Warsong Gulch Victory
                167, -- Warsong Gulch Veteran
                199, -- Capture the Flag
                200, -- Persistent Defender
                872, -- Frenzied Defender
                168, -- Warsong Gulch Perfection
                201, -- Warsong Expedience
                204, -- Ironman
                203, -- Not In My House
                1251, -- Not In My House
                202, -- Quick Cap
                1502, -- Quick Cap
                206, -- Supreme Defender
                1252, -- Supreme Defender
                207, -- Save the Day
                1172, -- Master of Warsong Gulch
                1173, -- Master of Warsong Gulch
                1259, -- Not So Fast
                713, -- Silverwing Sentinel
                712, -- Warsong Outrider
            },
        },
        { -- Wintergrasp
            963,
            addon.GetCategoryInfoTitle(14901),
            {
                1717, -- Wintergrasp Victory
                1718, -- Wintergrasp Veteran
                1755, -- Within Our Grasp
                2199, -- Wintergrasp Ranger
                2080, -- Black War Mammoth
                1737, -- Destruction Derby
                2476, -- Destruction Derby
                1723, -- Vehicular Gnomeslaughter
                1727, -- Leaning Tower
                1751, -- Didn't Stand a Chance
                1752, -- Master of Wintergrasp
                2776, -- Master of Wintergrasp
            },
        },
        { -- Southshore vs. Tarren Mill
            1032,
            addon.L["Southshore vs. Tarren Mill"],
            {
                9729, -- Victory in Hillsbrad
                9566, -- Victory in Hillsbrad
            },
        },
        { -- Deephaul Ravine
            1647,
            addon.GetCategoryInfoTitle(15525),
            {
                40210, -- Deephaul Ravine Victory
                40211, -- Deephaul Ravine Veteran
                40215, -- Deephaul Ravine Shutout
                40216, -- Deephaul Ravine Expedience
                40613, -- Resilient Runner
                40615, -- Unexpected Arrival
                40616, -- Unexpected Arrivals
                40607, -- Wandering in the Ravine
                40608, -- Running in the Ravine
                40612, -- Sprinting in the Ravine
                40617, -- Deepholla
            },
        },
        {
            229, -- The Grim Reaper
            907, -- The Justicar
            714, -- The Conqueror
            908, -- Call to Arms!
            909, -- Call to Arms!
            227, -- Damage Control
            231, -- Wrecking Ball
            230, -- Battlemaster
            1175, -- Battlemaster
            8052, -- Khan
            8055, -- Khan
            5268, -- In Service of the Alliance
            5269, -- In Service of the Horde
            5322, -- In Service of the Alliance
            5323, -- In Service of the Horde
            5327, -- In Service of the Alliance
            5324, -- In Service of the Horde
            5328, -- Veteran of the Alliance
            5325, -- Veteran of the Horde
            5823, -- Veteran of the Alliance II
            5824, -- Veteran of the Horde II
            5329, -- Warbound Veteran of the Alliance
            5326, -- Warbringer of the Horde
            5330, -- Private
            5345, -- Scout
            5331, -- Corporal
            5346, -- Grunt
            5332, -- Sergeant
            5347, -- Sergeant
            5333, -- Master Sergeant
            5348, -- Senior Sergeant
            5334, -- Sergeant Major
            5349, -- First Sergeant
            5335, -- Knight
            5350, -- Stone Guard
            5336, -- Knight-Lieutenant
            5351, -- Blood Guard
            5337, -- Knight-Captain
            5352, -- Legionnaire
            5359, -- Knight-Champion
            5338, -- Centurion
            5339, -- Lieutenant Commander
            5353, -- Champion
            5340, -- Commander
            5354, -- Lieutenant General
            5341, -- Marshal
            5355, -- General
            5357, -- Field Marshal
            5342, -- Warlord
            5343, -- Grand Marshal
            5356, -- High Warlord
            6942, -- Hero of the Alliance
            6941, -- Hero of the Horde
            19411, -- Battleground Blitz Novice
            19412, -- Battleground Blitz Apprentice
            19413, -- Battleground Blitz Veteran
            40221, -- Battleground Blitz Master
            19416, -- Learning the Ropes
            19417, -- Brawlroom Blitzer
            19418, -- Battle-scarred Battler
            40220, -- Setting Records
            40217, -- Battleground Blitzer
            40219, -- Battleground Blitzest
        },
    },
    { -- Arena
        1166,
        addon.GetCategoryInfoTitle(165),
        {
            397, -- Step Into The Arena
            398, -- Mercilessly Dedicated
            875, -- Vengefully Dedicated
            876, -- Brutally Dedicated
            699, -- World Wide Winner
            399, -- Just the Two of Us: 1550
            400, -- Just the Two of Us: 1750
            401, -- Just the Two of Us: 2000
            1159, -- Just the Two of Us: 2200
            402, -- Three's Company: 1550
            403, -- Three's Company: 1750
            405, -- Three's Company: 2000
            1160, -- Three's Company: 2200
            5266, -- Three's Company: 2400
            5267, -- Three's Company: 2700
            406, -- High Five: 1550
            407, -- High Five: 1750
            404, -- High Five: 2000
            1161, -- High Five: 2200
            408, -- Hot Streak
            1162, -- Hotter Streak
            2090, -- Challenger
            2093, -- Rival
            2092, -- Duelist
            2091, -- Gladiator
            15539, -- Solo Aspirations
            15511, -- Solely Motivated
            15540, -- Steadfast Soloist
            15541, -- Sole Survivor
            15543, -- Successful Solos
            15544, -- Supreme Soloist
            409, -- Last Man Standing
            1174, -- The Arena Master
        },
    },
    { -- Classic
        1131,
        addon.GetCategoryInfoTitle(14864),
        {
            442, -- Private
            454, -- Scout
            470, -- Corporal
            468, -- Grunt
            471, -- Sergeant
            453, -- Sergeant
            441, -- Master Sergeant
            450, -- Senior Sergeant
            440, -- Sergeant Major
            452, -- First Sergeant
            439, -- Knight
            451, -- Stone Guard
            472, -- Knight-Lieutenant
            449, -- Blood Guard
            438, -- Knight-Captain
            469, -- Legionnaire
            437, -- Knight-Champion
            448, -- Centurion
            436, -- Lieutenant Commander
            447, -- Champion
            435, -- Commander
            444, -- Lieutenant General
            473, -- Marshal
            446, -- General
            434, -- Field Marshal
            445, -- Warlord
            433, -- Grand Marshal
            443, -- High Warlord
        },
    },
    { -- The Burning Crusade
        1199,
        addon.GetCategoryInfoTitle(14865),
        {
            418, -- Merciless Gladiator
            419, -- Vengeful Gladiator
            420, -- Brutal Gladiator
        },
    },
    { -- Wrath of the Lich King
        1200,
        addon.GetCategoryInfoTitle(14866),
        {
            3336, -- Deadly Gladiator
            3436, -- Furious Gladiator
            3758, -- Relentless Gladiator
            4599, -- Wrathful Gladiator
        },
    },
    { -- Cataclysm
        1197,
        addon.GetCategoryInfoTitle(15072),
        {
            6002, -- Vicious Gladiator
            5344, -- Hero of the Alliance: Vicious
            5358, -- Hero of the Horde: Vicious
            6124, -- Ruthless Gladiator
            6316, -- Hero of the Alliance: Ruthless
            6317, -- Hero of the Horde: Ruthless
            6938, -- Cataclysmic Gladiator
            6939, -- Hero of the Alliance: Cataclysmic
            6940, -- Hero of the Horde: Cataclysmic
        },
    },
    { -- Mists of Pandaria
        1198,
        addon.GetCategoryInfoTitle(15164),
        {
            8214, -- Malevolent Gladiator
            8243, -- Hero of the Alliance: Malevolent
            8244, -- Hero of the Horde: Malevolent
            8791, -- Tyrannical Gladiator
            8652, -- Hero of the Alliance: Tyrannical
            8653, -- Hero of the Horde: Tyrannical
            8218, -- Tyrannical Conquest
            8093, -- Tyrannical Conquest
            8649, -- Challenger: Season 14
            8646, -- Rival: Season 14
            8645, -- Duelist: Season 14
            8644, -- Gladiator: Season 14
            8643, -- Grievous Gladiator: Season 14
            8654, -- Hero of the Alliance: Grievous
            8657, -- Hero of the Horde: Grievous
            8485, -- Grievous Combatant
            8484, -- Grievous Combatant
            8382, -- Grievous Conquest
            8381, -- Grievous Conquest
            8670, -- Challenger: Season 15
            8669, -- Rival: Season 15
            8668, -- Duelist: Season 15
            8667, -- Gladiator: Season 15
            8666, -- Prideful Gladiator: Season 15
            8658, -- Hero of the Alliance: Prideful
            8659, -- Hero of the Horde: Prideful
            8642, -- Prideful Combatant
            8641, -- Prideful Combatant
            8451, -- Prideful Conquest
            8450, -- Prideful Conquest
        },
    },
    { -- Warlords of Dreanor
        1175,
        addon.GetCategoryInfoTitle(15233),
        { -- Season 1
            1177,
            addon.L["Season"] .. " " .. 1,
            {
                9242, -- Challenger: Warlords Season 1
                9241, -- Rival: Warlords Season 1
                9240, -- Duelist: Warlords Season 1
                9239, -- Gladiator: Warlords Season 1
                9232, -- Primal Gladiator: Warlords Season 1
                9995, -- Soldier of the Alliance: Warlords Season 1
                9998, -- Soldier of the Horde: Warlords Season 1
                9996, -- Defender of the Alliance: Warlords Season 1
                10001, -- Defender of the Horde: Warlords Season 1
                9997, -- Guardian of the Alliance: Warlords Season 1
                10000, -- Guardian of the Horde: Warlords Season 1
                9230, -- Hero of the Alliance: Primal
                9231, -- Hero of the Horde: Primal
                9238, -- Primal Combatant
                9236, -- Primal Combatant
                9234, -- Primal Conquest
                9233, -- Primal Conquest
            },
        },
        { -- Season 2
            1178,
            addon.L["Season"] .. " " .. 2,
            {
                10101, -- Challenger: Warlords Season 2
                10100, -- Rival: Warlords Season 2
                10099, -- Duelist: Warlords Season 2
                10098, -- Gladiator: Warlords Season 2
                10096, -- Wild Gladiator: Warlords Season 2
                10104, -- Soldier of the Alliance: Warlords Season 2
                10105, -- Soldier of the Horde: Warlords Season 2
                10106, -- Defender of the Alliance: Warlords Season 2
                10107, -- Defender of the Horde: Warlords Season 2
                10108, -- Guardian of the Alliance: Warlords Season 2
                10109, -- Guardian of the Horde: Warlords Season 2
                10102, -- Hero of the Alliance: Wild
                10103, -- Hero of the Horde: Wild
                10093, -- Wild Combatant
                10092, -- Wild Combatant
                10089, -- Wild Conquest
                10088, -- Wild Conquest
            },
        },
        { -- Season 3
            1179,
            addon.L["Season"] .. " " .. 3,
            {
                10113, -- Challenger: Warlords Season 3
                10112, -- Rival: Warlords Season 3
                10111, -- Duelist: Warlords Season 3
                10110, -- Gladiator: Warlords Season 3
                10097, -- Warmongering Gladiator: Warlords Season 3
                10120, -- Soldier of the Alliance: Warlords Season 3
                10121, -- Soldier of the Horde: Warlords Season 3
                10118, -- Defender of the Alliance: Warlords Season 3
                10119, -- Defender of the Horde: Warlords Season 3
                10116, -- Guardian of the Alliance: Warlords Season 3
                10117, -- Guardian of the Horde: Warlords Season 3
                10114, -- Hero of the Alliance: Warmongering
                10115, -- Hero of the Horde: Warmongering
                10095, -- Warmongering Combatant
                10094, -- Warmongering Combatant
                10091, -- Warmongering Conquest
                10090, -- Warmongering Conquest
            },
        },
    },
    { -- Legion
        1180,
        addon.GetCategoryInfoTitle(15258),
        { -- Season 1
            1176,
            addon.L["Season"] .. " " .. 1,
            {
                11017, -- Challenger: Legion Season 1
                11016, -- Rival: Legion Season 1
                11015, -- Duelist: Legion Season 1
                11011, -- Gladiator: Legion Season 1
                11012, -- Vindictive Gladiator: Legion Season 1
                11024, -- Soldier of the Alliance: Legion Season 1
                11025, -- Soldier of the Horde: Legion Season 1
                11022, -- Defender of the Alliance: Legion Season 1
                11023, -- Defender of the Horde: Legion Season 1
                11020, -- Guardian of the Alliance: Legion Season 1
                11021, -- Guardian of the Horde: Legion Season 1
                11018, -- Hero of the Alliance: Vindictive
                11019, -- Hero of the Horde: Vindictive
                10998, -- Vindictive Combatant
                10997, -- Vindictive Combatant
                11578, -- Vindictive Elite
            },
        },
        { -- Season 2
            1181,
            addon.L["Season"] .. " " .. 2,
            {
                11028, -- Challenger: Legion Season 2
                11027, -- Rival: Legion Season 2
                11026, -- Duelist: Legion Season 2
                11013, -- Gladiator: Legion Season 2
                11014, -- Fearless Gladiator: Legion Season 2
                11036, -- Soldier of the Alliance: Legion Season 2
                11035, -- Soldier of the Horde: Legion Season 2
                11034, -- Defender of the Alliance: Legion Season 2
                11033, -- Defender of the Horde: Legion Season 2
                11032, -- Guardian of the Alliance: Legion Season 2
                11031, -- Guardian of the Horde: Legion Season 2
                11030, -- Hero of the Alliance: Fearless
                11029, -- Hero of the Horde: Fearless
                11004, -- Fearless Combatant
                11003, -- Fearless Combatant
                11579, -- Fearless Elite
            },
        },
        { -- Season 3
            1182,
            addon.L["Season"] .. " " .. 3,
            {
                11039, -- Challenger: Legion Season 3
                11040, -- Rival: Legion Season 3
                11041, -- Duelist: Legion Season 3
                11038, -- Gladiator: Legion Season 3
                11037, -- Cruel Gladiator: Legion Season 3
                11049, -- Soldier of the Alliance: Legion Season 3
                11048, -- Soldier of the Horde: Legion Season 3
                11045, -- Defender of the Alliance: Legion Season 3
                11044, -- Defender of the Horde: Legion Season 3
                11047, -- Guardian of the Alliance: Legion Season 3
                11046, -- Guardian of the Horde: Legion Season 3
                11043, -- Hero of the Alliance: Cruel
                11042, -- Hero of the Horde: Cruel
                11008, -- Cruel Combatant
                11005, -- Cruel Combatant
                11697, -- Cruel Elite
            },
        },
        { -- Season 4
            1183,
            addon.L["Season"] .. " " .. 4,
            {
                11060, -- Challenger: Legion Season 4
                11059, -- Rival: Legion Season 4
                11058, -- Duelist: Legion Season 4
                11061, -- Gladiator: Legion Season 4
                11062, -- Ferocious Gladiator: Legion Season 4
                11050, -- Soldier of the Alliance: Legion Season 4
                11051, -- Soldier of the Horde: Legion Season 4
                11054, -- Defender of the Alliance: Legion Season 4
                11055, -- Defender of the Horde: Legion Season 4
                11052, -- Guardian of the Alliance: Legion Season 4
                11053, -- Guardian of the Horde: Legion Season 4
                11056, -- Hero of the Alliance: Ferocious
                11057, -- Hero of the Horde: Ferocious
                11010, -- Ferocious Combatant
                11009, -- Ferocious Combatant
                11698, -- Ferocious Elite
            },
        },
        { -- Season 5
            1184,
            addon.L["Season"] .. " " .. 5,
            {
                12036, -- Challenger: Legion Season 5
                12035, -- Rival: Legion Season 5
                12034, -- Duelist: Legion Season 5
                12045, -- Gladiator: Legion Season 5
                12010, -- Fierce Gladiator: Legion Season 5
                12040, -- Soldier of the Alliance: Legion Season 5
                12044, -- Soldier of the Horde: Legion Season 5
                12039, -- Defender of the Alliance: Legion Season 5
                12043, -- Defender of the Horde: Legion Season 5
                12038, -- Guardian of the Alliance: Legion Season 5
                12042, -- Guardian of the Horde: Legion Season 5
                12037, -- Hero of the Alliance: Fierce
                12041, -- Hero of the Horde: Fierce
                12032, -- Fierce Combatant
                12031, -- Fierce Combatant
                12090, -- Fierce Elite
            },
        },
        { -- Season 6
            1185,
            addon.L["Season"] .. " " .. 6,
            {
                12169, -- Challenger: Legion Season 6
                12170, -- Rival: Legion Season 6
                12171, -- Duelist: Legion Season 6
                12167, -- Gladiator: Legion Season 6
                12134, -- Dominant Gladiator: Legion Season 6
                12179, -- Soldier of the Alliance: Legion Season 6
                12178, -- Soldier of the Horde: Legion Season 6
                12175, -- Defender of the Alliance: Legion Season 6
                12174, -- Defender of the Horde: Legion Season 6
                12177, -- Guardian of the Alliance: Legion Season 6
                12176, -- Guardian of the Horde: Legion Season 6
                12173, -- Hero of the Alliance: Dominant
                12172, -- Hero of the Horde: Dominant
                12137, -- Dominant Combatant
                12136, -- Dominant Combatant
                12135, -- Dominant Elite
            },
        },
        { -- Season 7
            1186,
            addon.L["Season"] .. " " .. 7,
            {
                12187, -- Challenger: Legion Season 7
                12188, -- Rival: Legion Season 7
                12186, -- Duelist: Legion Season 7
                12168, -- Gladiator: Legion Season 7
                12185, -- Demonic Gladiator: Legion Season 7
                12189, -- Soldier of the Alliance: Legion Season 7
                12190, -- Soldier of the Horde: Legion Season 7
                12195, -- Defender of the Alliance: Legion Season 7
                12194, -- Defender of the Horde: Legion Season 7
                12191, -- Guardian of the Alliance: Legion Season 7
                12192, -- Guardian of the Horde: Legion Season 7
                12197, -- Hero of the Alliance: Demonic
                12196, -- Hero of the Horde: Demonic
                12200, -- Demonic Combatant
                12199, -- Demonic Combatant
                12198, -- Demonic Elite
            },
        },
        {
            10991, -- First Step into a Larger World
            10992, -- Here We Go Again
            10993, -- Third Time's the Charm
            10995, -- For Prestige
            11468, -- Alive for Five
            11469, -- The River Six
            11470, -- Slayin' to Seven
            11471, -- "Don't Hate, Grind to Eight"
            11472, -- "Hell, It's About Nine"
            11685, -- Decade of Dominance
            11686, -- These Go To Eleven
            11687, -- Demonic Dozen
            11688, -- Floor Thirteen
            11689, -- Fourteen for the Team
            11690, -- When You're Fifteen
            11691, -- You Are Sixteen
            11692, -- Going On Seventeen
            11693, -- Eighteen and Over
            11694, -- "Hell, It's About Nineteen"
            12108, -- Double Decade of Dominance
            12109, -- Twenty-One Arms Salute
            12180, -- Catching Twenty-Two
            12181, -- Protocol 2.3
            12182, -- Demonic Double Dozen
            12183, -- Prestige Quartermaster
            10743, -- The Prestige
            10745, -- The Prestige
            11165, -- Crest of Heroism
            11166, -- Crest of Heroism
            11167, -- Crest of Carnage
            11168, -- Crest of Carnage
            11169, -- Crest of Devastation
            11170, -- Crest of Devastation
        },
    },
    { -- Battle for Azeroth
        1192,
        addon.GetCategoryInfoTitle(15305),
        { -- Season 1
            1193,
            addon.L["Season"] .. " " .. 1,
            {
                13199, -- Combatant: Battle for Azeroth Season 1
                12959, -- Challenger: Battle for Azeroth Season 1
                12960, -- Rival: Battle for Azeroth Season 1
                12962, -- Duelist: Battle for Azeroth Season 1
                13465, -- Elite: Battle for Azeroth Season 1
                12945, -- Dread Gladiator: Battle for Azeroth Season 1
                12963, -- Hero of the Alliance: Dread
                12964, -- Hero of the Horde: Dread
            },
        },
        { -- Season 2
            1194,
            addon.L["Season"] .. " " .. 2,
            {
                13204, -- Combatant: Battle for Azeroth Season 2
                13203, -- Challenger: Battle for Azeroth Season 2
                13205, -- Rival: Battle for Azeroth Season 2
                13209, -- Duelist: Battle for Azeroth Season 2
                13451, -- Elite: Battle for Azeroth Season 2
                13200, -- Sinister Gladiator: Battle for Azeroth Season 2
                13210, -- Hero of the Alliance: Sinister
                13211, -- Hero of the Horde: Sinister
            },
        },
        { -- Season 3
            1195,
            addon.L["Season"] .. " " .. 3,
            {
                13639, -- Combatant: Battle for Azeroth Season 3
                13634, -- Challenger: Battle for Azeroth Season 3
                13641, -- Rival: Battle for Azeroth Season 3
                13642, -- Duelist: Battle for Azeroth Season 3
                13676, -- Elite: Battle for Azeroth Season 3
                13630, -- Notorious Gladiator: Battle for Azeroth Season 3
                13643, -- Hero of the Alliance: Notorious
                13644, -- Hero of the Horde: Notorious
            },
        },
        { -- Season 4
            1196,
            addon.L["Season"] .. " " .. 4,
            {
                13962, -- Combatant: Battle for Azeroth Season 4
                13959, -- Challenger: Battle for Azeroth Season 4
                13963, -- Rival: Battle for Azeroth Season 4
                13964, -- Duelist: Battle for Azeroth Season 4
                13989, -- Elite: Battle for Azeroth Season 4
                13957, -- Corrupted Gladiator: Battle for Azeroth Season 4
                13966, -- Hero of the Alliance: Corrupted
                13965, -- Hero of the Horde: Corrupted
            },
        },
    },
    { -- Shadowlands
        1187,
        addon.GetCategoryInfoTitle(15439),
        { -- Season 1
            1188,
            addon.L["Season"] .. " " .. 1,
            {
                14685, -- Combatant: Shadowlands Season 1
                14686, -- Challenger: Shadowlands Season 1
                14687, -- Rival: Shadowlands Season 1
                14688, -- Duelist: Shadowlands Season 1
                14691, -- Elite: Shadowlands Season 1
                14690, -- Sinful Gladiator: Shadowlands Season 1
                14692, -- Hero of the Alliance: Sinful
                14693, -- Hero of the Horde: Sinful
            },
        },
        { -- Season 2
            1189,
            addon.L["Season"] .. " " .. 2,
            {
                14968, -- Combatant I: Shadowlands Season 2
                15232, -- Combatant II: Shadowlands Season 2
                14969, -- Challenger I: Shadowlands Season 2
                15233, -- Challenger II: Shadowlands Season 2
                14970, -- Rival I: Shadowlands Season 2
                15234, -- Rival II: Shadowlands Season 2
                14971, -- Duelist: Shadowlands Season 2
                14974, -- Elite: Shadowlands Season 2
                14973, -- Unchained Gladiator: Shadowlands Season 2
                14976, -- Hero of the Horde: Unchained
                14975, -- Hero of the Alliance: Unchained
            },
        },
        { -- Season 3
            1190,
            addon.L["Season"] .. " " .. 3,
            {
                15348, -- Combatant I: Shadowlands Season 3
                15380, -- Combatant II: Shadowlands Season 3
                15349, -- Challenger I: Shadowlands Season 3
                15379, -- Challenger II: Shadowlands Season 3
                15350, -- Rival I: Shadowlands Season 3
                15378, -- Rival II: Shadowlands Season 3
                15351, -- Duelist: Shadowlands Season 3
                15354, -- Elite: Shadowlands Season 3
                15353, -- Cosmic Gladiator: Shadowlands Season 3
                15355, -- Hero of the Alliance: Cosmic
                15356, -- Hero of the Horde: Cosmic
            },
        },
        { -- Season 4
            1191,
            addon.L["Season"] .. " " .. 4,
            {
                15609, -- Combatant I: Shadowlands Season 4
                15610, -- Combatant II: Shadowlands Season 4
                15600, -- Challenger I: Shadowlands Season 4
                15601, -- Challenger II: Shadowlands Season 4
                15602, -- Rival I: Shadowlands Season 4
                15603, -- Rival II: Shadowlands Season 4
                15604, -- Duelist: Shadowlands Season 4
                15639, -- Elite: Shadowlands Season 4
                15606, -- Eternal Gladiator: Shadowlands Season 4
                15608, -- Hero of the Alliance: Eternal
                15607, -- Hero of the Horde: Eternal
            },
        },
    },
    { -- Dragonflight
        1344,
        addon.GetCategoryInfoTitle(15466),
        { -- Season 1
            1345,
            addon.L["Season"] .. " " .. 1,
            {
                15960, -- Combatant I: Dragonflight Season 1
                15961, -- Combatant II: Dragonflight Season 1
                15955, -- Challenger I: Dragonflight Season 1
                15956, -- Challenger II: Dragonflight Season 1
                15952, -- Rival I: Dragonflight Season 1
                15953, -- Rival II: Dragonflight Season 1
                15954, -- Duelist: Dragonflight Season 1
                15984, -- Elite: Dragonflight Season 1
                15951, -- Crimson Gladiator: Dragonflight Season 1
                15959, -- Hero of the Alliance: Crimson
                15958, -- Hero of the Horde: Crimson
                17339, -- Legend: Dragonflight Season 1
                16734, -- Crimson Legend: Dragonflight Season 1
                17119, -- Deep Cuts From the Vault
            },
        },
        { -- Season 2
            1413,
            addon.L["Season"] .. " " .. 2,
            {
                17799, -- Combatant I: Dragonflight Season 2
                17800, -- Combatant II: Dragonflight Season 2
                17797, -- Challenger I: Dragonflight Season 2
                17798, -- Challenger II: Dragonflight Season 2
                17795, -- Rival I: Dragonflight Season 2
                17796, -- Rival II: Dragonflight Season 2
                17794, -- Duelist: Dragonflight Season 2
                17831, -- Elite: Dragonflight Season 2
                17764, -- Obsidian Gladiator: Dragonflight Season 2
                17768, -- Hero of the Alliance: Obsidian
                17772, -- Hero of the Horde: Obsidian
                17801, -- Legend: Dragonflight Season 2
                17767, -- Obsidian Legend: Dragonflight Season 2
                18027, -- Dragonflight Season 2 Master
                18380, -- Dragonflight Season 2 Hero
            },
        },
        { -- Season 3
            1540,
            addon.L["Season"] .. " " .. 3,
            {
                19157, -- Combatant I: Dragonflight Season 3
                19158, -- Combatant II: Dragonflight Season 3
                19159, -- Challenger I: Dragonflight Season 3
                19160, -- Challenger II: Dragonflight Season 3
                19133, -- Rival I: Dragonflight Season 3
                19155, -- Rival II: Dragonflight Season 3
                19156, -- Duelist: Dragonflight Season 3
                19090, -- Elite: Dragonflight Season 3
                19132, -- Verdant Gladiator: Dragonflight Season 3
                19162, -- Hero of the Alliance: Verdant
                19161, -- Hero of the Horde: Verdant
                19304, -- Legend: Dragonflight Season 3
                19131, -- Verdant Legend: Dragonflight Season 3
                19443, -- Battle Mender: Dragonflight Season 3
                19396, -- Dragonflight Season 3 Master
                19420, -- Dragonflight Season 3 Hero
            },
        },
        { -- Season 4
            1571,
            addon.L["Season"] .. " " .. 4,
            {
                19494, -- Combatant I: Dragonflight Season 4
                19495, -- Combatant II: Dragonflight Season 4
                19497, -- Challenger I: Dragonflight Season 4
                19499, -- Challenger II: Dragonflight Season 4
                19493, -- Rival I: Dragonflight Season 4
                19498, -- Rival II: Dragonflight Season 4
                19492, -- Duelist: Dragonflight Season 4
                19509, -- Elite: Dragonflight Season 4
                19454, -- Draconic Gladiator: Dragonflight Season 4
                19455, -- Hero of the Alliance: Draconic
                19456, -- Hero of the Horde: Draconic
                19500, -- Legend: Dragonflight Season 4
                19453, -- Draconic Legend: Dragonflight Season 4
                19513, -- Battle Mender: Dragonflight Season 4
                20481, -- Dragonflight Season 4 Master
            },
        },
    },
    { -- The War Within
        1651,
        addon.GetCategoryInfoTitle(15520),
        { -- Season 1
            1652,
            addon.L["Season"] .. " " .. 1,
            {
                40385, -- Combatant I: The War Within Season 1
                40386, -- Combatant II: The War Within Season 1
                40387, -- Challenger I: The War Within Season 1
                40388, -- Challenger II: The War Within Season 1
                40389, -- Rival I: The War Within Season 1
                40390, -- Rival II: The War Within Season 1
                40391, -- Duelist: The War Within Season 1
                40392, -- Elite: The War Within Season 1
                40380, -- Forged Gladiator: The War Within Season 1
                40383, -- Hero of the Alliance: Forged
                40384, -- Hero of the Horde: Forged
                40395, -- Legend: The War Within Season 1
                40381, -- Forged Legend: The War Within Season 1
                40472, -- Battle Mender: The War Within Season 1
                40792, -- Solo Shuffle Medic: The War Within
                40233, -- Strategist: The War Within Season 1
                40235, -- Forged Marshal: The War Within Season 1
                40234, -- Forged Warlord: The War Within Season 1
                41044, -- Forged Weapons of Conquest
                40660, -- The War Within Season 1: Spelunker Supreme
                40723, -- Web-Wrapped in the Finest Silks
            },
        },
    },
};