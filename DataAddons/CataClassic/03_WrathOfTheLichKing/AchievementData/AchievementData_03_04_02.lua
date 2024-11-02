local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_04_02"] = {
    { -- Ahead of the Curve: Yogg-Saron
        17340,
    },
    { -- Cutting Edge: Ulduar
        17341,
    },
    { -- Defense Protocol Beta: Utgarde Keep
        18590,
    },
    { -- Defense Protocol Beta: The Nexus
        18591,
    },
    { -- Defense Protocol Beta: Azjol-Nerub
        18592,
    },
    { -- Defense Protocol Beta: Ahn'kahet: The Old Kingdom
        18593,
    },
    { -- Defense Protocol Beta: Drak'Tharon Keep
        18594,
    },
    { -- Defense Protocol Beta: The Violet Hold
        18595,
    },
    { -- Defense Protocol Beta: Gundrak
        18596,
    },
    { -- Defense Protocol Beta: Halls of Stone
        18597,
    },
    { -- Defense Protocol Beta: Halls of Lightning
        18598,
    },
    { -- Defense Protocol Beta: The Oculus
        18599,
    },
    { -- Defense Protocol Beta: Utgarde Pinnacle
        18600,
    },
    { -- Defense Protocol Beta: The Culling of Stratholme
        18601,
    },
    { -- Defense Protocol Beta: Terminated
        18614,
        faction.Alliance,
    },
    { -- Defense Protocol Beta: Trial of the Champion
        18677,
        faction.Alliance,
    },
    { -- Defense Protocol Beta: Trial of the Champion
        18678,
        faction.Horde,
    },
    { -- Defense Protocol Beta: Terminated
        18688,
        faction.Horde,
    },
    {KrowiAF.SetAchievementPatch, 3, 4, 2}, -- Rework loading so this can go to the top, future me problem
};