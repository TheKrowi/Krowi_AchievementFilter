local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_02_07"] = {
    { -- We Are All Made of Stars (Heroic)
        15468,
    },
    { -- We Are All Made of Stars (Mythic)
        15469,
    },
    {KrowiAF.SetAchievementPatch, 9, 2, 7}, -- Rework loading so this can go to the top, future me problem
};