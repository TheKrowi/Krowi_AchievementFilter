local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_04_03"] = {
    { -- Defense Protocol Gamma: Trial of the Champion
        19425,
        faction.Horde,
    },
    { -- Defense Protocol Gamma: Trial of the Champion
        19426,
        faction.Alliance,
    },
    { -- Defense Protocol Gamma: Utgarde Keep
        19427,
    },
    { -- Defense Protocol Gamma: The Nexus
        19428,
    },
    { -- Defense Protocol Gamma: Azjol-Nerub
        19429,
    },
    { -- Defense Protocol Gamma: Ahn'kahet: The Old Kingdom
        19430,
    },
    { -- Defense Protocol Gamma: Drak'Tharon Keep
        19431,
    },
    { -- Defense Protocol Gamma: The Violet Hold
        19432,
    },
    { -- Defense Protocol Gamma: Gundrak
        19433,
    },
    { -- Defense Protocol Gamma: Halls of Stone
        19434,
    },
    { -- Defense Protocol Gamma: Halls of Lightning
        19435,
    },
    { -- Defense Protocol Gamma: The Oculus
        19436,
    },
    { -- Defense Protocol Gamma: Utgarde Pinnacle
        19437,
    },
    { -- Defense Protocol Gamma: The Culling of Stratholme
        19438,
    },
    { -- Defense Protocol Gamma: Terminated
        19439,
        faction.Alliance,
    },
    { -- Defense Protocol Gamma: Terminated
        19440,
        faction.Horde,
    },
    {KrowiAF.SetAchievementPatch, 3, 4, 3}, -- Rework loading so this can go to the top, future me problem
};