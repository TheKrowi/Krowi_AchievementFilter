local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_00_06"] = {
    { -- Just Another Day in Tol Barad
        5718,
        faction.Alliance,
        5719,
    },
    { -- Just Another Day in Tol Barad
        5719,
        faction.Horde,
        5718,
    },
    { -- 50 Exalted Reputations
        5723,
    },
    {KrowiAF.SetAchievementPatch, 4, 0, 6}, -- Rework loading so this can go to the top, future me problem
};