local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["06_02_02"] = {
    { -- Collector's Edition: Zeradar
        10309,
    },
    { -- Collector's Edition: Illidari Felstalker
        10320,
    },
    { -- Collector's Edition: Nibbles
        10321,
    },
    { -- Murkidan
        10322,
    },
    { -- Did Someone Say...?
        10335,
    },
    { -- Crashin' Thrashin' Flamer
        10337,
    },
    { -- Iron Armada
        10353,
    },
    { -- Crashin' Thrashin' Commander
        10354,
    },
    { -- Lord of the Reins
        10355,
        faction.Horde,
        10356,
    },
    { -- Lord of the Reins
        10356,
        faction.Alliance,
        10355,
    },
    { -- A Frightening Friend
        10365,
    },
    {KrowiAF.SetAchievementPatch, 6, 2, 2}, -- Rework loading so this can go to the top, future me problem
};