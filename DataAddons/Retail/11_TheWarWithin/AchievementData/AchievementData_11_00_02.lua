local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["11_00_02"] = {
    { -- Tricks and Treats of Khaz Algar
        40862,
    },
    { -- Perplexing Puzzle
        40863,
    },
    { -- Plentiful Perplexing Puzzles
        40864,
    },
    { -- Worm Theory
        40869,
    },
    { -- The Grand Tapestry
        40874,
    },
    { -- True Strength
        40875,
    },
    { -- Vox Arachni
        40876,
    },
    { -- Copious Coffers
        40882,
    },
    { -- The Key to Madness
        40885,
    },
    { -- Cornerstone of Dornogal
        40904,
    },
    { -- "From Many, One"
        40905,
    },
    { -- The Flame Burns Within
        40906,
    },
    { -- We Rise Anew
        40907,
    },
    { -- Harbinger of the Gilded
        40939,
    },
    {KrowiAF.SetAchievementPatch, 11, 0, 2}, -- Rework loading so this can go to the top, future me problem
};