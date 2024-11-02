local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_04_01"] = {
    { -- Murkalot
        8793,
    },
    { -- Friends In Places Even Higher Than That
        8794,
    },
    {KrowiAF.SetAchievementPatch, 5, 4, 1}, -- Rework loading so this can go to the top, future me problem
};