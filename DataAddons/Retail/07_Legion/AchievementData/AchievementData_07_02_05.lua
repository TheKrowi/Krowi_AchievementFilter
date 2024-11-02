local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_02_05"] = {
    { -- WoW's 13th Anniversary
        11848,
    },
    { -- Pet Battle Challenge: Deadmines
        11856,
    },
    { -- I'll Hold These For You Until You Get Out
        11869,
    },
    { -- Ahead of the Curve: Kil'jaeden
        11874,
    },
    { -- Cutting Edge: Kil'jaeden
        11875,
    },
    { -- "Hey, You're a Rockstar!"
        11918,
    },
    { -- Taking this Show on the Road
        11919,
    },
    { -- Perfect Performance
        11920,
    },
    { -- Mosh Pit
        11921,
    },
    { -- Heroic: Return to Karazhan
        11929,
    },
    { -- Chromie Homie
        11941,
    },
    {KrowiAF.SetAchievementPatch, 7, 2, 5}, -- Rework loading so this can go to the top, future me problem
};