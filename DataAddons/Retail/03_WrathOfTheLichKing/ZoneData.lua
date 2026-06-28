local _, addon = ...
local shared = addon.Data.ZoneData.Shared
local sharedWotLK = addon.Data.ZoneData.Shared.WrathOfTheLichKing

local zoneData = sharedWotLK.ZoneData

local northrendMeta = {
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    41, -- Loremaster of Northrend
    2256, -- Northern Exposure
    2257, -- Frostbitten
    2557, -- To All The Squirrels Who Shared My Life
    45, -- Northrend Explorer
    6588, -- Northrend Safari
    6615, -- Northrend Tamer
    46, -- Universal Explorer
}

zoneData:Zone(113, { -- Northrend (continent)
    northrendMeta,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    sharedWotLK.Northrend,
    6605, -- Taming Northrend
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
    61910, -- Mrglgrgl of Grglmrgl
    1264, -- Explore Borean Tundra
    949, -- Tuskarrmageddon
})

zoneData:Zone(115, { -- Dragonblight (zone)
    northrendMeta,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1008, -- The Kirin Tor
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    40796, -- This Takes Me Back
    35, -- Might of Dragonblight
    1359, -- Might of Dragonblight
    547, -- Veteran of the Wrathgate
    1277, -- Rapid Defense
    1265, -- Explore Dragonblight
    9924, -- Field Photographer
    1007, -- The Wyrmrest Accord
    6605, -- Taming Northrend
    11941, -- Chromie Homie
})

zoneData:Zone(116, { -- Grizzly Hills (zone)
    northrendMeta,
    sharedWotLK.GrizzlyHills,
})

zoneData:Zone(117, { -- Howling Fjord (zone)
    northrendMeta,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    2556, -- Pest Control
    34, -- I've Toured the Fjord
    1356, -- I've Toured the Fjord
    1263, -- Explore Howling Fjord
    1254, -- Friend or Fowl?
    9924, -- Field Photographer
    6605, -- Taming Northrend
})

zoneData:Zone({118, 170}, { -- Icecrown (zone)
    northrendMeta,
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1009, -- Knights of the Ebon Blade
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    14750, -- Death Rising
    40, -- Icecrown: The Final Goal
    1270, -- Explore Icecrown
    947, -- The Argent Crusade
    945, -- The Argent Champion
    6605, -- Taming Northrend
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
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    1009, -- Knights of the Ebon Blade
    1010, -- Northrend Vanguard
    2556, -- Pest Control
    36, -- The Empire of Zul'Drak
    1596, -- Guru of Drakuru
    1576, -- Of Blood and Anguish
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    1267, -- Explore Zul'Drak
    6605, -- Taming Northrend
})

zoneData:Zone(123, { -- Wintergrasp (battleground)
    9924, -- Field Photographer
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
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    45, -- Northrend Explorer
    2556, -- Pest Control
    1457, -- Explore Crystalsong Forest
    9924, -- Field Photographer
    6588, -- Northrend Safari
    6615, -- Northrend Tamer
    6605, -- Taming Northrend
    46, -- Universal Explorer
})

zoneData:Zone(129, sharedWotLK.TheNexus) -- The Nexus (dungeon)

zoneData:Zone({130, 131}, sharedWotLK.CullingOfStratholme) -- The Culling of Stratholme (dungeon)

zoneData:Zone(132, sharedWotLK.AhnKahet) -- Ahn'kahet: The Old Kingdom (dungeon)

zoneData:Zone({133, 134, 135}, sharedWotLK.UtgardeKeep) -- Utgarde Keep (dungeon)

zoneData:Zone({136, 137}, sharedWotLK.UtgardePinnacle) -- Utgarde Pinnacle (dungeon)

zoneData:Zone({138, 139}, sharedWotLK.HallsOfLightning) -- Halls of Lightning (dungeon)

zoneData:Zone(140, sharedWotLK.HallsOfStone) -- Halls of Stone (dungeon)

zoneData:Zone({143, 144, 145, 146}, sharedWotLK.TheOculus) -- The Oculus (dungeon)

zoneData:Zone(154, sharedWotLK.Gundrak) -- Gundrak (dungeon)

zoneData:Zone({157, 158, 159}, sharedWotLK.AzjolNerub) -- Azjol-Nerub (dungeon)

zoneData:Zone({160, 161}, sharedWotLK.DrakTharonKeep) -- Drak'Tharon Keep (dungeon)

zoneData:Zone(168, sharedWotLK.TheVioletHold) -- The Violet Hold (dungeon)

zoneData:Zone(171, sharedWotLK.TrialOfTheChampion) -- Trial of the Champion (dungeon)

zoneData:Zone(184, { -- Pit of Saron (dungeon)
    sharedWotLK.PitOfSaron,
    61271, -- Keystone Hero: Pit of Saron
    61592, -- Keystone Victor: Pit of Saron
})

zoneData:Zone({147, 148, 149, 150, 151, 152}, { -- Ulduar (raid)
    12312, -- Dwarfageddon
    12314, -- Three Car Garage
    12313, -- Unbroken
    12316, -- Shutout
    12315, -- Take Out Those Turrets
    12317, -- Orbital Bombardment
    12318, -- Orbital Devastation
    12319, -- Nuked from Orbit
    12320, -- Orbit-uary
    12323, -- Shattered
    12324, -- Hot Pocket
    12325, -- Stokin' the Furnace
    12321, -- A Quick Shave
    12322, -- Iron Dwarf, Medium Rare
    12326, -- Nerf Engineering
    12327, -- Nerf Scrapbots
    12328, -- Nerf Gravity Bombs
    12329, -- Must Deconstruct Faster
    12330, -- Heartbreaker
    12335, -- But I'm On Your Side
    12336, -- Can't Do That While Stunned
    12332, -- I Choose You, Runemaster Molgeim
    12333, -- I Choose You, Stormcaller Brundir
    12334, -- I Choose You, Steelbreaker
    12339, -- If Looks Could Kill
    12340, -- Rubble and Roll
    12337, -- With Open Arms
    12338, -- Disarmed
    12342, -- Nine Lives
    12341, -- Crazy Cat Lady
    12343, -- Cheese the Freeze
    12344, -- I Have the Coolest Friends
    12345, -- Getting Cold in Here
    12346, -- Staying Buffed All Winter
    12347, -- I Could Say That This Cache Was Rare
    12348, -- Don't Stand in the Lightning
    12349, -- I'll Take You All On
    12350, -- Who Needs Bloodlust?
    12351, -- Siffed
    12352, -- Lose Your Illusion
    12360, -- Lumberjacked
    12361, -- Con-speed-atory
    12362, -- Deforestation
    12363, -- Getting Back to Nature
    12364, -- Knock on Wood
    12365, -- Knock, Knock on Wood
    12366, -- Knock, Knock, Knock on Wood
    12367, -- Set Up Us the Bomb
    12368, -- Not-So-Friendly Fire
    12369, -- Firefighter
    12372, -- Shadowdodger
    12373, -- I Love the Smell of Saronite in the Morning
    12384, -- Kiss and Make Up
    12395, -- Drive Me Crazy
    12396, -- He's Not Getting Any Older
    12397, -- They're Coming Out of the Walls
    12398, -- In His House He Waits Dreaming
    12385, -- Three Lights in the Darkness
    12386, -- Two Lights in the Darkness
    12387, -- One Light in the Darkness
    12388, -- Alone in the Darkness
    12400, -- Supermassive
    12297, -- The Siege of Ulduar
    12302, -- The Antechamber of Ulduar
    12309, -- The Keepers of Ulduar
    12310, -- The Descent into Madness
    12311, -- The Secrets of Ulduar
    12399, -- Observed
    11751, -- Mogg-Saron
    4626, -- And I'll Form the Head!
    3142, -- Val'anyr, Hammer of Ancient Kings
    3316, -- Herald of the Titans
    11320, -- Raiding with Leashes IV: Wrath of the Lick King
}, sharedWotLK.Ulduar10, sharedWotLK.Ulduar25)

zoneData:Zone({162, 163, 164, 165, 166, 167}, { -- Naxxramas (raid)
    11750, -- Undying Aesthetic
    7934, -- Raiding with Leashes
    9924, -- Field Photographer
}, sharedWotLK.Naxxramas10, sharedWotLK.Naxxramas25)

zoneData:Zone({172, 173}, { -- Trial of the Crusader (raid)
    11752, -- Style of the Crusader
    11320, -- Raiding with Leashes IV: Wrath of the Lick King
}, sharedWotLK.TrialOfTheCrusader10, sharedWotLK.TrialOfTheCrusader25)

zoneData:Zone({186, 187, 188, 189, 190, 191, 192, 193}, { -- Icecrown Citadel (raid)
    11753, -- Winter Catalog
    4625, -- Invincible's Reins
    4623, -- Shadowmourne
    11320, -- Raiding with Leashes IV: Wrath of the Lick King
    9924, -- Field Photographer
    4598, -- The Ashen Verdict
}, sharedWotLK.IcecrownCitadel10, sharedWotLK.IcecrownCitadel25)

zoneData:Zone(248, { -- Onyxia's Lair (raid)
    684, -- Onyxia's Lair (Level 60)
    11296, -- Didn't Stand a Chance
    9924, -- Field Photographer
}, sharedWotLK.OnyxiasLair10, sharedWotLK.OnyxiasLair25)