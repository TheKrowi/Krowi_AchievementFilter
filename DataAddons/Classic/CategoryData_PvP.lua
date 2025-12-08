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
                711, -- Knight of Arathor
                710, -- The Defiler
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
            15022, -- Challenger: Season 1
            15021, -- Rival: Season 1
            15020, -- Duelist: Season 1
            15019, -- Gladiator: Season 1
            15018, -- Infernal Gladiator: Season 1
            15210, -- Challenger: Season 2
            15209, -- Rival: Season 2
            15208, -- Duelist: Season 2
            15199, -- Gladiator: Season 2
            418, -- Merciless Gladiator: Season 2
            15207, -- Challenger: Season 3
            15206, -- Rival: Season 3
            15205, -- Duelist: Season 3
            15204, -- Gladiator: Season 3
            419, -- Vengeful Gladiator: Season 3
            15203, -- Challenger: Season 4
            15202, -- Rival: Season 4
            15201, -- Duelist: Season 4
            15200, -- Gladiator: Season 4
            420, -- Brutal Gladiator: Season 4
        },
    },
    { -- Wrath of the Lich King
        1200,
        addon.GetCategoryInfoTitle(14866),
        {
            16316, -- Challenger: Season 5
            16313, -- Rival: Season 5
            16315, -- Duelist: Season 5
            16314, -- Gladiator: Season 5
            3336, -- Deadly Gladiator: Season 5
            17418, -- Challenger: Season 6
            17415, -- Rival: Season 6
            17417, -- Duelist: Season 6
            17416, -- Gladiator: Season 6
            3436, -- Furious Gladiator: Season 6
            18547, -- Challenger: Season 7
            18544, -- Rival: Season 7
            18546, -- Duelist: Season 7
            18545, -- Gladiator: Season 7
            3758, -- Relentless Gladiator: Season 7
            18550, -- Challenger: Season 8
            18548, -- Rival: Season 8
            18549, -- Duelist: Season 8
            18551, -- Gladiator: Season 8
            4599, -- Wrathful Gladiator: Season 8
        },
    },
    { -- Cataclysm
        1197,
        addon.GetCategoryInfoTitle(15072),
        {
            40971, -- Challenger: Season 9
            40968, -- Rival: Season 9
            40970, -- Duelist: Season 9
            40969, -- Gladiator: Season 9
            6002, -- Vicious Gladiator: Season 9
            5344, -- Hero of the Alliance: Vicious
            5358, -- Hero of the Horde: Vicious
            41334, -- Challenger: Season 10
            41332, -- Rival: Season 10
            41333, -- Duelist: Season 10
            41336, -- Gladiator: Season 10
            6124, -- Ruthless Gladiator: Season 10
            6316, -- Hero of the Alliance: Ruthless
            6317, -- Hero of the Horde: Ruthless
            42775, -- Challenger: Season 11
            42772, -- Rival: Season 11
            42774, -- Duelist: Season 11
            42777, -- Gladiator: Season 11
            6938, -- Cataclysmic Gladiator: Season 11
            6939, -- Hero of the Alliance: Cataclysmic
            6940, -- Hero of the Horde: Cataclysmic
        },
    },
    { -- Mists of Pandaria
        1198,
        addon.GetCategoryInfoTitle(15164),
        {
            42762, -- Challenger: Season 12
            42764, -- Rival: Season 12
            42763, -- Duelist: Season 12
            61350, -- Gladiator: Season 12 (2v2)
            61354, -- Malevolent Gladiator: Season 12 (2v2)
            42765, -- Gladiator: Season 12 (3v3)
            8214, -- Malevolent Gladiator: Season 12 (3v3)
            61358, -- Gladiator: Season 12 (5v5)
            61362, -- Malevolent Gladiator: Season 12 (5v5)
            61415, -- Undisputed Gladiator: Season 12
            8243, -- Hero of the Alliance: Malevolent
            8244, -- Hero of the Horde: Malevolent
            61460, -- Malevolent Conquest
            61459, -- Malevolent Conquest
            61098, -- Challenger: Season 13
            61099, -- Rival: Season 13
            61097, -- Duelist: Season 13
            61351, -- Gladiator: Season 13 (2v2)
            61355, -- Tyrannical Gladiator: Season 13 (2v2)
            61096, -- Gladiator: Season 13 (3v3)
            8791, -- Tyrannical Gladiator: Season 13 (3v3)
            61359, -- Gladiator: Season 13 (5v5)
            61363, -- Tyrannical Gladiator: Season 13 (5v5)
            61416, -- Undisputed Gladiator: Season 13
            8652, -- Hero of the Alliance: Tyrannical
            8653, -- Hero of the Horde: Tyrannical
            8218, -- Tyrannical Conquest
            8093, -- Tyrannical Conquest
            8649, -- Challenger: Season 14
            8646, -- Rival: Season 14
            8645, -- Duelist: Season 14
            61352, -- Gladiator: Season 14 (2v2)
            61356, -- Grievous Gladiator: Season 14 (2v2)
            8644, -- Gladiator: Season 14 (3v3)
            8643, -- Grievous Gladiator: Season 14 (3v3)
            61360, -- Gladiator: Season 14 (5v5)
            61364, -- Grievous Gladiator: Season 14 (5v5)
            61417, -- Undisputed Gladiator: Season 14
            8654, -- Hero of the Alliance: Grievous
            8657, -- Hero of the Horde: Grievous
            8485, -- Grievous Combatant
            8484, -- Grievous Combatant
            8382, -- Grievous Conquest
            8381, -- Grievous Conquest
            8670, -- Challenger: Season 15
            8669, -- Rival: Season 15
            8668, -- Duelist: Season 15
            61353, -- Gladiator: Season 15 (2v2)
            61357, -- Prideful Gladiator: Season 15 (2v2)
            8667, -- Gladiator: Season 15 (3v3)
            8666, -- Prideful Gladiator: Season 15 (3v3)
            61361, -- Gladiator: Season 15 (5v5)
            61365, -- Prideful Gladiator: Season 15 (5v5)
            61418, -- Undisputed Gladiator: Season 15
            8658, -- Hero of the Alliance: Prideful
            8659, -- Hero of the Horde: Prideful
            8642, -- Prideful Combatant
            8641, -- Prideful Combatant
            8451, -- Prideful Conquest
            8450, -- Prideful Conquest
        },
    },
};