local _, addon = ...
local sharedWotLK = addon.Data.ZoneData.Shared.WrathOfTheLichKing

local zoneData = sharedWotLK.ZoneData

local northrendMeta = {
    41, -- Loremaster of Northrend
    2256, -- Northern Exposure
    2257, -- Frostbitten
    2557, -- To All The Squirrels Who Shared My Life
    45, -- Northrend Explorer
    46, -- Universal Explorer
}

zoneData:Zone(113, { -- Northrend (continent)
    northrendMeta,
    sharedWotLK.Northrend,
})

zoneData:Zone(114, { -- Borean Tundra (zone)
    northrendMeta,
    1008, -- The Kirin Tor
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    33, -- Nothing Boring About Borean
    1358, -- Nothing Boring About Borean
    561, -- D.E.H.T.A's Little P.I.T.A.
    1264, -- Explore Borean Tundra
    949, -- Tuskarrmageddon
})

zoneData:Zone(115, { -- Dragonblight (zone)
    northrendMeta,
    1008, -- The Kirin Tor
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    35, -- Might of Dragonblight
    1359, -- Might of Dragonblight
    547, -- Veteran of the Wrathgate
    1277, -- Rapid Defense
    1265, -- Explore Dragonblight
    1007, -- The Wyrmrest Accord
})

zoneData:Zone(116, { -- Grizzly Hills (zone)
    northrendMeta,
    sharedWotLK.GrizzlyHills,
})

zoneData:Zone(117, { -- Howling Fjord (zone)
    northrendMeta,
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    2556, -- Pest Control
    34, -- I've Toured the Fjord
    1356, -- I've Toured the Fjord
    1263, -- Explore Howling Fjord
    1254, -- Friend or Fowl?
})

zoneData:Zone({118, 170}, { -- Icecrown (zone)
    northrendMeta,
    1009, -- Knights of the Ebon Blade
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    40, -- Icecrown: The Final Goal
    1270, -- Explore Icecrown
    947, -- The Argent Crusade
    945, -- The Argent Champion
    sharedWotLK.ArgentTournament,
})

zoneData:Zone(119, { -- Sholazar Basin (zone)
    northrendMeta,
    sharedWotLK.SholazarBasin,
})

zoneData:Zone(120, { -- The Storm Peaks (zone)
    northrendMeta,
    sharedWotLK.StormPeaks,
})

zoneData:Zone(121, { -- Zul'Drak (zone)
    northrendMeta,
    1009, -- Knights of the Ebon Blade
    1010, -- Northrend Vanguard
    2556, -- Pest Control
    36, -- The Empire of Zul'Drak
    1596, -- Guru of Drakuru
    1576, -- Of Blood and Anguish
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    1267, -- Explore Zul'Drak
})

zoneData:Zone(123, { -- Wintergrasp (battleground)
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
})

zoneData:Zone(127, { -- Crystalsong Forest (zone)
    45, -- Northrend Explorer
    2556, -- Pest Control
    1457, -- Explore Crystalsong Forest
    46, -- Universal Explorer
})

zoneData:Zone(129, { -- The Nexus (dungeon)
    sharedWotLK.TheNexus,
    17283, -- Defense Protocol Alpha: The Nexus
    18591, -- Defense Protocol Beta: The Nexus
    19428, -- Defense Protocol Gamma: The Nexus
})

zoneData:Zone({130, 131}, { -- The Culling of Stratholme (dungeon)
    sharedWotLK.CullingOfStratholme,
    17302, -- Defense Protocol Alpha: The Culling of Stratholme
    18601, -- Defense Protocol Beta: The Culling of Stratholme
    19438, -- Defense Protocol Gamma: The Culling of Stratholme
})

zoneData:Zone(132, { -- Ahn'kahet: The Old Kingdom (dungeon)
    sharedWotLK.AhnKahet,
    17291, -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
    18593, -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
    19430, -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
})

zoneData:Zone({133, 134, 135}, { -- Utgarde Keep (dungeon)
    sharedWotLK.UtgardeKeep,
    17213, -- Defense Protocol Alpha: Utgarde Keep
    18590, -- Defense Protocol Beta: Utgarde Keep
    19427, -- Defense Protocol Gamma: Utgarde Keep
})

zoneData:Zone({136, 137}, { -- Utgarde Pinnacle (dungeon)
    sharedWotLK.UtgardePinnacle,
    17301, -- Defense Protocol Alpha: Utgarde Pinnacle
    18600, -- Defense Protocol Beta: Utgarde Pinnacle
    19437, -- Defense Protocol Gamma: Utgarde Pinnacle
})

zoneData:Zone({138, 139}, { -- Halls of Lightning (dungeon)
    sharedWotLK.HallsOfLightning,
    17299, -- Defense Protocol Alpha: Halls of Lightning
    18598, -- Defense Protocol Beta: Halls of Lightning
    19435, -- Defense Protocol Gamma: Halls of Lightning
})

zoneData:Zone(140, { -- Halls of Stone (dungeon)
    sharedWotLK.HallsOfStone,
    17297, -- Defense Protocol Alpha: Halls of Stone
    18597, -- Defense Protocol Beta: Halls of Stone
    19434, -- Defense Protocol Gamma: Halls of Stone
})

zoneData:Zone({143, 144, 145, 146}, { -- The Oculus (dungeon)
    sharedWotLK.TheOculus,
    17300, -- Defense Protocol Alpha: The Oculus
    18599, -- Defense Protocol Beta: The Oculus
    19436, -- Defense Protocol Gamma: The Oculus
})

zoneData:Zone(154, { -- Gundrak (dungeon)
    sharedWotLK.Gundrak,
    17295, -- Defense Protocol Alpha: Gundrak
    18596, -- Defense Protocol Beta: Gundrak
    19433, -- Defense Protocol Gamma: Gundrak
})

zoneData:Zone({157, 158, 159}, { -- Azjol-Nerub (dungeon)
    sharedWotLK.AzjolNerub,
    17285, -- Defense Protocol Alpha: Azjol-Nerub
    18592, -- Defense Protocol Beta: Azjol-Nerub
    19429, -- Defense Protocol Gamma: Azjol-Nerub
})

zoneData:Zone({160, 161}, { -- Drak'Tharon Keep (dungeon)
    sharedWotLK.DrakTharonKeep,
    17292, -- Defense Protocol Alpha: Drak'Tharon Keep
    18594, -- Defense Protocol Beta: Drak'Tharon Keep
    19431, -- Defense Protocol Gamma: Drak'Tharon Keep
})

zoneData:Zone(168, { -- The Violet Hold (dungeon)
    sharedWotLK.TheVioletHold,
    17293, -- Defense Protocol Alpha: The Violet Hold
    18595, -- Defense Protocol Beta: The Violet Hold
    19432, -- Defense Protocol Gamma: The Violet Hold
})

zoneData:Zone(171, { -- Trial of the Champion (dungeon)
    sharedWotLK.TrialOfTheChampion,
    18677, -- Defense Protocol Beta: Trial of the Champion
    18678, -- Defense Protocol Beta: Trial of the Champion
    19426, -- Defense Protocol Gamma: Trial of the Champion
    19425, -- Defense Protocol Gamma: Trial of the Champion
})

zoneData:Zone(184, sharedWotLK.PitOfSaron) -- Pit of Saron (dungeon)

zoneData:Zone({147, 148, 149, 150, 151, 152}, { -- Ulduar (raid)
    4626, -- And I'll Form the Head!
    3142, -- Val'anyr, Hammer of Ancient Kings
    3316, -- Herald of the Titans
    17340, -- Ahead of the Curve: Yogg-Saron
    17341, -- Cutting Edge: Ulduar
}, sharedWotLK.Ulduar10, sharedWotLK.Ulduar25)

zoneData:Zone({162, 163, 164, 165, 166, 167}, nil, -- Naxxramas (raid)
sharedWotLK.Naxxramas10, sharedWotLK.Naxxramas25)

zoneData:Zone({172, 173}, nil, -- Trial of the Crusader (raid)
sharedWotLK.TrialOfTheCrusader10, sharedWotLK.TrialOfTheCrusader25)

zoneData:Zone({186, 187, 188, 189, 190, 191, 192, 193}, { -- Icecrown Citadel (raid)
    4625, -- Invincible's Reins
    4623, -- Shadowmourne
    4598, -- The Ashen Verdict
}, sharedWotLK.IcecrownCitadel10, sharedWotLK.IcecrownCitadel25)

zoneData:Zone(248, { -- Onyxia's Lair (raid)
    684, -- Onyxia's Lair (Level 60)
}, sharedWotLK.OnyxiasLair10, sharedWotLK.OnyxiasLair25)