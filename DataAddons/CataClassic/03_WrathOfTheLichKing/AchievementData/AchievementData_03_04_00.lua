local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_04_00"] = {
    { -- Survivor of the Firelord (Season of Mastery)
        15330,
    },
    { -- Survivor of the Shadow Flame (Season of Mastery)
        15333,
    },
    { -- Survivor of the Old God (Season of Mastery)
        15334,
    },
    { -- Survivor of the Damned (Season of Mastery)
        15335,
    },
    { -- The Immortal (Season of Mastery)
        15637,
    },
    { -- The Perfect Pebble
        16332,
    },
    { -- Soul of Iron (Season of Mastery)
        16433,
    },
    {KrowiAF.SetAchievementPatch, 3, 4, 0}, -- Rework loading so this can go to the top, future me problem
};