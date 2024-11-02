local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_02_05"] = {
    { -- WoW's 15th Anniversary
        13917,
    },
    { -- The Fourth War
        13924,
        faction.Horde,
        13925,
    },
    { -- The Fourth War
        13925,
        faction.Alliance,
        13924,
    },
    { -- Crashin' Splashin'
        13927,
    },
    { -- Alterac Valley of Olde
        13928,
        faction.Alliance,
        13930,
        true,
    },
    { -- Alterac Valley of Olde
        13930,
        faction.Horde,
        13928,
        true,
    },
    { -- "Memories of Fel, Frost and Fire"
        13931,
    },
    {KrowiAF.SetAchievementPatch, 8, 2, 5}, -- Rework loading so this can go to the top, future me problem
};