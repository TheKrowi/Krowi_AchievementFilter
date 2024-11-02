local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["10_00_05"] = {
    { -- Renewed Proto-Drake Armor
        16696,
    },
    { -- Renewed Proto-Drake Head Features
        16697,
    },
    { -- Renewed Proto-Drake Tail Features
        16698,
    },
    { -- Renewed Proto-Drake Scales and Patterns
        16699,
    },
    { -- Renewed Proto-Drake Horns and Hair
        16700,
    },
    { -- Windborne Velocidrake Scales and Patterns
        16701,
    },
    { -- Windborne Velocidrake Armor
        16702,
    },
    { -- Windborne Velocidrake Horns and Fur
        16704,
    },
    { -- Windborne Velocidrake Head Features
        16705,
    },
    { -- Windborne Velocidrake Back and Tail
        16706,
    },
    { -- Highland Drake Scales and Patterns
        16707,
    },
    { -- Highland Drake Armor
        16708,
    },
    { -- Highland Drake Horns and Hair
        16710,
    },
    { -- Highland Drake Back and Tail
        16711,
    },
    { -- Highland Drake Head Features
        16712,
    },
    { -- Cliffside Wylderdrake Scales and Patterns
        16723,
    },
    { -- Cliffside Wylderdrake Armor
        16724,
    },
    { -- Cliffside Wylderdrake Horns and Manes
        16725,
    },
    { -- Cliffside Wylderdrake Back and Tail
        16726,
    },
    { -- Cliffside Wylderdrake Head Features
        16727,
    },
    { -- Waking Shores Reverse: Bronze
        17195,
    },
    { -- Waking Shores Reverse: Silver
        17196,
    },
    { -- Waking Shores Reverse: Gold
        17197,
    },
    { -- Ohn'ahran Plains Reverse: Bronze
        17198,
    },
    { -- Ohn'ahran Plains Reverse: Silver
        17199,
    },
    { -- Ohn'ahran Plains Reverse: Gold
        17200,
    },
    { -- Azure Span Reverse: Bronze
        17201,
    },
    { -- Azure Span Reverse: Silver
        17202,
    },
    { -- Azure Span Reverse: Gold
        17203,
    },
    { -- Thaldraszus Reverse: Bronze
        17204,
    },
    { -- Thaldraszus Reverse: Silver
        17205,
    },
    { -- Thaldraszus Reverse: Gold
        17206,
    },
    { -- Discombobberlated
        17207,
    },
    { -- Trading Post: Dragonflight
        17305,
    },
    { -- Elders of the Dragon Isles
        17321,
    },
    { -- Reverse Racer: Bronze
        17330,
    },
    { -- Reverse Racer: Silver
        17331,
    },
    { -- Reverse Racer: Gold
        17332,
    },
    { -- Trading Post Enthusiast
        17334,
    },
    { -- Airborne Tumbler
        17335,
        {
            IsPvP = true,
        },
    },
    { -- Airborne Tumbler
        17336,
        {
            IsPvP = true,
        },
    },
    { -- The Future We Make
        17342,
    },
    { -- Drop It Like It's Hot
        17343,
    },
    { -- Airborne Tumbler
        17345,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 10, 0, 5}, -- Rework loading so this can go to the top, future me problem
};