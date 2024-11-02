local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_03_02"] = {
    { -- Hero of the Alliance: Ruthless
        6316,
        faction.Alliance,
        6317,
        true,
    },
    { -- Hero of the Horde: Ruthless
        6317,
        faction.Horde,
        6316,
        true,
    },
    { -- Ruthless Gladiator's Twilight Drake
        6322,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 4, 3, 2}, -- Rework loading so this can go to the top, future me problem
};