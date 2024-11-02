local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_03_05"] = {
    { -- The Twilight Destroyer (25 player)
        4815,
    },
    { -- Heroic: The Twilight Destroyer (25 player)
        4816,
    },
    { -- The Twilight Destroyer (10 player)
        4817,
    },
    { -- Heroic: The Twilight Destroyer (10 player)
        4818,
    },
    { -- Collector's Edition: Mini Thor
        4824,
    },
    {KrowiAF.SetAchievementPatch, 3, 3, 5}, -- Rework loading so this can go to the top, future me problem
};