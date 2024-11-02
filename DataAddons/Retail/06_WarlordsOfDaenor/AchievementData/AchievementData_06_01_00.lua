local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["06_01_00"] = {
    { -- Darkmoon Race Enthusiast
        9755,
    },
    { -- Darkmoon Racer Novice
        9756,
    },
    { -- Darkmoon Racer Jockey
        9759,
    },
    { -- Darkmoon Racer Leadfoot
        9760,
    },
    { -- Darkmoon Racer Roadhog
        9761,
    },
    { -- Grommloc
        9763,
    },
    { -- Rocketeer: Gold
        9764,
    },
    { -- Rocketeer: Silver
        9766,
    },
    { -- Rocketeer: Bronze
        9769,
    },
    { -- Blast Off!
        9770,
    },
    { -- Go-Getter
        9780,
    },
    { -- Powermonger: Bronze
        9781,
    },
    { -- Powermonger: Silver
        9783,
    },
    { -- Powermonger: Gold
        9785,
    },
    { -- Wayfarer
        9786,
    },
    { -- Wanderluster: Bronze
        9787,
    },
    { -- Wanderluster: Silver
        9790,
    },
    { -- Wanderluster: Gold
        9792,
    },
    { -- Big Race Enthusiast
        9793,
    },
    { -- Big Race Novice
        9794,
    },
    { -- Big Race Jockey
        9795,
    },
    { -- Big Race Leadfoot
        9797,
    },
    { -- Big Race Roadhog
        9799,
    },
    { -- Rocket Man
        9800,
    },
    { -- Big Rocketeer: Bronze
        9801,
    },
    { -- Big Rocketeer: Silver
        9803,
    },
    { -- Big Rocketeer: Gold
        9805,
    },
    { -- Vagabond
        9806,
    },
    { -- Big Wanderluster: Bronze
        9807,
    },
    { -- Big Wanderluster: Silver
        9809,
    },
    { -- Big Wanderluster: Gold
        9811,
    },
    { -- Goal-Oriented
        9812,
    },
    { -- Big Powermonger: Bronze
        9813,
    },
    { -- Big Powermonger: Silver
        9815,
    },
    { -- Big Powermonger: Gold
        9817,
    },
    { -- Darkmoon Like the Wind
        9819,
    },
    { -- Raiding with Leashes III: Drinkin' From the Sunwell
        9824,
    },
    { -- Master Relic Hunter
        9825,
        faction.Alliance,
        9836,
    },
    { -- Platinum Defender
        9826,
    },
    { -- Impervious Defender
        9827,
    },
    { -- Ten Hit Tunes
        9828,
        faction.Alliance,
        9897,
    },
    { -- Loremaster of Draenor
        9833,
        faction.Alliance,
        9923,
    },
    { -- Master Relic Hunter
        9836,
        faction.Horde,
        9825,
    },
    { -- "What A Strange, Interdimensional Trip It's Been"
        9838,
    },
    { -- Master and Commander
        9858,
    },
    { -- Ace Tonk Commander
        9885,
    },
    { -- Triumphant Turtle Tossing
        9894,
    },
    { -- Ten Hit Tunes
        9897,
        faction.Horde,
        9828,
    },
    { -- Exploration Mission Master
        9900,
    },
    { -- Don't Call Me Junior
        9901,
        faction.Horde,
        9928,
    },
    { -- Alt-ernative Lifestyle
        9906,
    },
    { -- Ready for Powerleveling
        9908,
    },
    { -- Heirloom Hoarder
        9909,
    },
    { -- Where's the Mailbox?
        9911,
    },
    { -- Azeroth's Top Twenty Tunes
        9912,
        faction.Alliance,
        9914,
    },
    { -- Azeroth's Top Twenty Tunes
        9914,
        faction.Horde,
        9912,
    },
    { -- Crashin' Thrashin' Shredder
        9915,
    },
    { -- Loremaster of Draenor
        9923,
        faction.Horde,
        9833,
    },
    { -- Field Photographer
        9924,
    },
    { -- Friends In Places Yet Even Higher Than That
        9925,
    },
    { -- Hero of the Storm
        9926,
    },
    { -- Don't Call Me Junior
        9928,
        faction.Alliance,
        9901,
    },
    {KrowiAF.SetAchievementPatch, 6, 1, 0}, -- Rework loading so this can go to the top, future me problem
};