local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_04_01"] = {
    { -- Defense Protocol Alpha: Utgarde Keep
        17213,
    },
    { -- Defense Protocol Alpha: The Nexus
        17283,
    },
    { -- Defense Protocol Alpha: Azjol-Nerub
        17285,
    },
    { -- Defense Protocol Alpha: Ahn'kahet: The Old Kingdom
        17291,
    },
    { -- Defense Protocol Alpha: Drak'Tharon Keep
        17292,
    },
    { -- Defense Protocol Alpha: The Violet Hold
        17293,
    },
    { -- Defense Protocol Alpha: Gundrak
        17295,
    },
    { -- Defense Protocol Alpha: Halls of Stone
        17297,
    },
    { -- Defense Protocol Alpha: Halls of Lightning
        17299,
    },
    { -- Defense Protocol Alpha: The Oculus
        17300,
    },
    { -- Defense Protocol Alpha: Utgarde Pinnacle
        17301,
    },
    { -- Defense Protocol Alpha: The Culling of Stratholme
        17302,
    },
    { -- Defense Protocol Alpha: Terminated
        17304,
    },
    {KrowiAF.SetAchievementPatch, 3, 4, 1}, -- Rework loading so this can go to the top, future me problem
};