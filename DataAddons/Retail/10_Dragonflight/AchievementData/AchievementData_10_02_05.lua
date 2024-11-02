local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["10_02_05"] = {
    { -- Support Your Local Artisans
        19400,
    },
    { -- Love Language Expert
        19508,
    },
    { -- Northrend: Bronze
        19674,
    },
    { -- Northrend: Silver
        19675,
    },
    { -- Northrend: Gold
        19676,
    },
    { -- Northrend Advanced: Bronze
        19677,
    },
    { -- Northrend Advanced: Silver
        19679,
    },
    { -- Northrend Advanced: Gold
        19681,
    },
    { -- Northrend Reverse: Bronze
        19682,
    },
    { -- Northrend Reverse: Silver
        19683,
    },
    { -- Northrend Reverse: Gold
        19684,
    },
    { -- Tenured Archivist
        19685,
    },
    { -- Reclamation of Gilneas
        19719,
    },
    { -- Northrend Racing Completionist
        19721,
    },
    { -- Northrend Racing Completionist: Silver
        19722,
    },
    { -- Northrend Racing Completionist: Gold
        19723,
    },
    { -- Hearthstone Card Collection
        19724,
    },
    { -- When a Rock is Just a Rock
        19786,
    },
    { -- Clued In
        19787,
    },
    { -- Tome Comber
        19788,
    },
    { -- Relic Rescuer
        19789,
    },
    { -- "The Archives Called, You Answered"
        19790,
    },
    { -- Goggle Wobble
        19791,
    },
    { -- Just One More Thing
        19792,
    },
    { -- Finally At Rest
        19793,
    },
    { -- Hearthstoned: Fiery Edition
        19866,
    },
    { -- Hearthstone Beginner
        20033,
    },
    { -- Champion of the Dragonflights
        20206,
    },
    {KrowiAF.SetAchievementPatch, 10, 2, 5}, -- Rework loading so this can go to the top, future me problem
};