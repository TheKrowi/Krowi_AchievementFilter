local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_04_02"] = {
    { -- Collector's Edition: Treasure Goblin
        8795,
    },
    {KrowiAF.SetAchievementPatch, 5, 4, 2}, -- Rework loading so this can go to the top, future me problem
};