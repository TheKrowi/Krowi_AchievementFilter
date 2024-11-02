local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_02_02"] = {
    { -- Occu'thar
        6045,
    },
    {KrowiAF.SetAchievementPatch, 4, 2, 2}, -- Rework loading so this can go to the top, future me problem
};