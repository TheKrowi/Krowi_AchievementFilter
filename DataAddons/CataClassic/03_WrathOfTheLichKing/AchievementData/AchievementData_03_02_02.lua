local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_02_02"] = {
    { -- Onyxia's Lair (10 player)
        4396,
    },
    { -- Onyxia's Lair (25 player)
        4397,
    },
    { -- WoW's 5th Anniversary
        4400,
        {
            {}
        }
    },
    { -- More Dots! (10 player)
        4402,
    },
    { -- Many Whelps! Handle It! (10 player)
        4403,
    },
    { -- She Deep Breaths More (10 player)
        4404,
    },
    { -- More Dots! (25 player)
        4405,
    },
    { -- Many Whelps! Handle It! (25 player)
        4406,
    },
    { -- She Deep Breaths More (25 player)
        4407,
    },
    { -- BB King
        4436,
        faction.Alliance,
        4437,
    },
    { -- BB King
        4437,
        faction.Horde,
        4436,
    },
    { -- Looking For More
        4476,
    },
    { -- Looking For Many
        4477,
    },
    { -- Looking For Multitudes
        4478,
    },
    { -- It's Over Nine Thousand!
        4496,
    },
    { -- Toravon the Ice Watcher (10 player)
        4585,
    },
    { -- Toravon the Ice Watcher (25 player)
        4586,
    },
    {KrowiAF.SetAchievementPatch, 3, 2, 2}, -- Rework loading so this can go to the top, future me problem
};