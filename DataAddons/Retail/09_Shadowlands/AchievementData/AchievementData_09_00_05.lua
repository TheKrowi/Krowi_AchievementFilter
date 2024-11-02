local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_00_05"] = {
    { -- Flying Festivities
        14931,
    },
    { -- Shadowlands Keystone Explorer: Season One
        14938,
    },
    { -- We Can Rebuild
        15023,
    },
    { -- Denying the Drought
        15024,
    },
    { -- Sanctum Superior
        15025,
    },
    {KrowiAF.SetAchievementPatch, 9, 0, 5}, -- Rework loading so this can go to the top, future me problem
};