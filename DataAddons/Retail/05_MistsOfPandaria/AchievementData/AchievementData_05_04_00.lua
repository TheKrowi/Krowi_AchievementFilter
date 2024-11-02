local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_04_00"] = {
    { -- Grievous Conquest
        8381,
        faction.Horde,
        8382,
        true,
    },
    { -- Grievous Conquest
        8382,
        faction.Alliance,
        8381,
        true,
    },
    { -- Crazy for Cats
        8397,
    },
    { -- Ahead of the Curve: Garrosh Hellscream (10 player)
        8398,
    },
    { -- Ahead of the Curve: Garrosh Hellscream (25 player)
        8399,
    },
    { -- Cutting Edge: Garrosh Hellscream (10 player)
        8400,
    },
    { -- Cutting Edge: Garrosh Hellscream (25 player)
        8401,
    },
    { -- The Celestial Tournament
        8410,
    },
    { -- Challenge Master: Temple of the Jade Serpent
        8430,
    },
    { -- Challenge Master: Stormstout Brewery
        8431,
    },
    { -- Challenge Master: Shado-Pan Monastery
        8432,
    },
    { -- Challenge Master: Mogu'shan Palace
        8433,
    },
    { -- Challenge Master: Gate of the Setting Sun
        8434,
    },
    { -- Challenge Master: Scarlet Halls
        8436,
    },
    { -- Challenge Master: Scarlet Monastery
        8437,
    },
    { -- Challenge Master: Scholomance
        8438,
    },
    { -- Challenge Master: Siege of Niuzao Temple
        8439,
    },
    { -- Gamon Will Save Us!
        8448,
    },
    { -- Prideful Conquest
        8450,
        faction.Horde,
        8451,
        true,
    },
    { -- Prideful Conquest
        8451,
        faction.Alliance,
        8450,
        true,
    },
    { -- Rescue Raiders
        8453,
    },
    { -- Glory of the Orgrimmar Raider
        8454,
    },
    { -- Vale of Eternal Sorrows
        8458,
    },
    { -- Gates of Retribution
        8459,
    },
    { -- The Underhold
        8461,
    },
    { -- Downfall
        8462,
    },
    { -- Mythic: Immerseus
        8463,
    },
    { -- Mythic: Fallen Protectors
        8465,
    },
    { -- Mythic: Norushen
        8466,
    },
    { -- Mythic: Sha of Pride
        8467,
    },
    { -- Mythic: Galakras
        8468,
    },
    { -- Mythic: Iron Juggernaut
        8469,
    },
    { -- Mythic: Kor'kron Dark Shaman
        8470,
    },
    { -- Mythic: General Nazgrim
        8471,
    },
    { -- Mythic: Malkorok
        8472,
    },
    { -- Mythic: Spoils of Pandaria
        8478,
    },
    { -- Mythic: Thok the Bloodthirsty
        8479,
    },
    { -- Mythic: Siegecrafter Blackfuse
        8480,
    },
    { -- Mythic: Paragons of the Klaxxi
        8481,
    },
    { -- Mythic: Garrosh Hellscream
        8482,
    },
    { -- Grievous Combatant
        8484,
        faction.Horde,
        8485,
        true,
    },
    { -- Grievous Combatant
        8485,
        faction.Alliance,
        8484,
        true,
    },
    { -- Proving Yourself: Bronze Damage (Level 90)
        8486,
    },
    { -- Proving Yourself: Bronze Tank (Level 90)
        8487,
    },
    { -- Proving Yourself: Bronze Healer (Level 90)
        8488,
    },
    { -- Proving Yourself: Silver Damage (Level 90)
        8491,
    },
    { -- Proving Yourself: Silver Tank (Level 90)
        8492,
    },
    { -- Proving Yourself: Silver Healer (Level 90)
        8493,
    },
    { -- Proving Yourself: Gold Damage (Level 90)
        8496,
    },
    { -- Proving Yourself: Gold Tank (Level 90)
        8497,
    },
    { -- Proving Yourself: Gold Healer (Level 90)
        8498,
    },
    { -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
        8501,
    },
    { -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
        8502,
    },
    { -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
        8503,
    },
    { -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
        8504,
    },
    { -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
        8505,
    },
    { -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
        8506,
    },
    { -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
        8507,
    },
    { -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
        8508,
    },
    { -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
        8509,
    },
    { -- Master of the Masters
        8518,
    },
    { -- Celestial Family
        8519,
    },
    { -- Fire in the Hole!
        8520,
    },
    { -- Swallow Your Pride
        8521,
    },
    { -- Giant Dinosaur vs. Mega Snail
        8527,
    },
    { -- Go Long
        8528,
    },
    { -- Criss Cross
        8529,
    },
    { -- The Immortal Vanguard
        8530,
    },
    { -- Now We are the Paragon
        8531,
    },
    { -- None Shall Pass
        8532,
    },
    { -- Ordos
        8533,
    },
    { -- Celestial Challenge
        8535,
    },
    { -- No More Tears
        8536,
    },
    { -- Strike!
        8537,
    },
    { -- Unlimited Potential
        8538,
    },
    { -- Lasers and Magnets and Drills! Oh My!
        8543,
    },
    { -- Prideful Combatant
        8641,
        faction.Horde,
        8642,
        true,
    },
    { -- Prideful Combatant
        8642,
        faction.Alliance,
        8641,
        true,
    },
    { -- Grievous Gladiator: Season 14
        8643,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Season 14
        8644,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Season 14
        8645,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Season 14
        8646,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Season 14
        8649,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Tyrannical
        8652,
        faction.Alliance,
        8653,
        true,
    },
    { -- Hero of the Horde: Tyrannical
        8653,
        faction.Horde,
        8652,
        true,
    },
    { -- Hero of the Alliance: Grievous
        8654,
        faction.Alliance,
        8657,
        true,
    },
    { -- Hero of the Horde: Grievous
        8657,
        faction.Horde,
        8654,
        true,
    },
    { -- Hero of the Alliance: Prideful
        8658,
        faction.Alliance,
        8659,
        true,
    },
    { -- Hero of the Horde: Prideful
        8659,
        faction.Horde,
        8658,
        true,
    },
    { -- Prideful Gladiator: Season 15
        8666,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Season 15
        8667,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Season 15
        8668,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Season 15
        8669,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Season 15
        8670,
        {
            IsPvP = true,
        },
    },
    { -- Tyrannical Gladiator's Cloud Serpent
        8678,
        {
            IsPvP = true,
        },
    },
    { -- Conqueror of Orgrimmar
        8679,
        faction.Alliance,
        8680,
    },
    { -- Liberator of Orgrimmar
        8680,
        faction.Horde,
        8679,
    },
    { -- You're Doing it Wrong (Level 90)
        8697,
    },
    { -- Crashin' Thrashin' Flyer
        8698,
    },
    { -- The Danger Zone
        8699,
    },
    { -- Grievous Gladiator's Cloud Serpent
        8705,
        {
            IsPvP = true,
        },
    },
    { -- Prideful Gladiator's Cloud Serpent
        8707,
        {
            IsPvP = true,
        },
    },
    { -- Killing Time
        8712,
    },
    { -- Timeless Champion
        8714,
    },
    { -- Emperor Shaohao
        8715,
    },
    { -- Emissary of Ordos
        8716,
    },
    { -- Candlekeeper
        8717,
        {
            IsPvP = true,
        },
    },
    { -- Oathguard
        8718,
        {
            IsPvP = true,
        },
    },
    { -- Blazebinder
        8719,
        {
            IsPvP = true,
        },
    },
    { -- Kilnmaster
        8720,
        {
            IsPvP = true,
        },
    },
    { -- Fire-Watcher
        8721,
        {
            IsPvP = true,
        },
    },
    { -- Timeless Nutriment
        8722,
    },
    { -- Legend of the Past
        8723,
    },
    { -- Pilgrimage
        8724,
    },
    { -- Eyes On The Ground
        8725,
    },
    { -- Extreme Treasure Hunter
        8726,
    },
    { -- "Where There's Pirates, There's Booty"
        8727,
    },
    { -- Going To Need A Bigger Bag
        8728,
    },
    { -- "Treasure, Treasure Everywhere"
        8729,
    },
    { -- Rolo's Riddle
        8730,
    },
    { -- Zarhym Altogether
        8743,
    },
    { -- Timeless Legends
        8784,
    },
    { -- Tyrannical Gladiator
        8791,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 5, 4, 0}, -- Rework loading so this can go to the top, future me problem
};