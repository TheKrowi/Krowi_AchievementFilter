local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_04_00"] = {
    { -- Ruthless Gladiator's Twilight Drake
        6321,
    },
    {KrowiAF.SetAchievementPatch, 4, 4, 0}, -- Rework loading so this can go to the top, future me problem
};