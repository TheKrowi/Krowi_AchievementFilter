local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_01_05"] = {
    { -- Rock n' Roll
        15181,
    },
    { -- Combatant II: Shadowlands Season 2
        15232,
        {
            IsPvP = true,
        },
    },
    { -- Challenger II: Shadowlands Season 2
        15233,
        {
            IsPvP = true,
        },
    },
    { -- Rival II: Shadowlands Season 2
        15234,
        {
            IsPvP = true,
        },
    },
    { -- Renowned
        15241,
    },
    { -- Tower Overwhelming
        15308,
    },
    { -- A Towering Success
        15309,
    },
    { -- A Tour of Towers
        15310,
    },
    { -- Rockin' Rollin' Racer
        15313,
    },
    { -- Sarge's Tale
        15323,
    },
    { -- Tormented Hero: Shadowlands Season 2
        15327,
    },
    { -- Shadowlands Explorer
        15388,
    },
    {KrowiAF.SetAchievementPatch, 9, 1, 5}, -- Rework loading so this can go to the top, future me problem
};