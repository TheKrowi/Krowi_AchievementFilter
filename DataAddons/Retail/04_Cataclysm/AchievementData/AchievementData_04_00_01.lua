local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_00_01"] = {
    { -- Friends In Even Higher Places
        4832,
    },
    { -- Tripping the Rifts
        4887,
    },
    { -- Collector's Edition: Lil' Deathwing
        5377,
    },
    { -- Deathy
        5378,
    },
    { -- WoW's 6th Anniversary
        5512,
    },
    { -- 1000 Valor Points
        5535,
    },
    { -- 5000 Valor Points
        5536,
    },
    { -- "25,000 Valor Points"
        5537,
    },
    { -- "50,000 Valor Points"
        5538,
    },
    {KrowiAF.SetAchievementPatch, 4, 0, 1}, -- Rework loading so this can go to the top, future me problem
};