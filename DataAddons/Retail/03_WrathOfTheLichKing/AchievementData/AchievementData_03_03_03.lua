local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_03_03"] = {
    { -- Green Brewfest Stein
        4782,
    },
    { -- Operation: Gnomeregan
        4786,
        faction.Alliance,
    },
    { -- Zalazane's Fall
        4790,
        faction.Horde,
    },
    {KrowiAF.SetAchievementPatch, 3, 3, 3}, -- Rework loading so this can go to the top, future me problem
};