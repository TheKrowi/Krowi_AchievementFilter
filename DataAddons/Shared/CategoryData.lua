local _, addon = ...;
addon.Data.CategoryData = {};
addon.Data.CategoryData.Shared = {};
local shared = addon.Data.CategoryData.Shared;

KrowiAF.CategoryData.Achievements = { -- TAB - Expansions
    883, -- Id
    addon.L["Expansions"], -- Name
    {
        { -- Cross-Expansion
            1431,
            addon.L["Cross-Expansion"],
            {
                { -- Zones
                    1160,
                    addon.L["Zones"],
                    {
                        { -- Exile's Reach
                            953,
                            (select(2, addon.GetAchievementInfo(14222))),
                            {}, -- No child categories so empty table
                            {14222}
                        },
                    },
                },
                { -- Character
                    1432,
                    addon.GetCategoryInfoTitle(92),
                    {},
                    {
                        6, 7, 8, 9, 14782, 14783, 15805, 19459, 10, 11,
                        12, 13, 4826, 6193, 9060, 10671, 12544, 7382, 7383, 7384,
                        7380, 546, 1176, 1177, 1178, 1180, 1181, 5455, 5456, 6753,
                        558, 559, 891, 889, 890, 5180, 892, 2357, 2358, 2359,
                        545, 557, 556, 5373, 5372, 6348, 6349, 9707, 9708, 10764,
                        10765, 12546, 12547, 14796, 14797, 705, 16, 2716, 17334, 19489,
                    }, -- Achievements table
                }
            },
        },
    },
};


KrowiAF.CategoryData.Achievements = {
    { -- TAB - Expansions
        883, -- Id
        addon.L["Expansions"], -- Name
        {
            IsTab = true,
        },
    },
    { -- Cross-Expansion
        1431,
        addon.L["Cross-Expansion"],
        883, -- Parent
    },
    { -- Zones
        1160,
        addon.L["Zones"],
        1431,
    },
    { -- Exile's Reach
        953,
        (select(2, addon.GetAchievementInfo(14222))),
        1160,
    },
    { -- Character
        1432,
        addon.GetCategoryInfoTitle(92),
        1431,
    },
};