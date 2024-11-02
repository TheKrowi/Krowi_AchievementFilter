local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_01_00"] = {
    { -- It's Not Easy Being Green
        5743,
    },
    { -- Gurubashi Headhunter
        5744,
    },
    { -- Vial of the Sands
        5749,
    },
    { -- Tunnel Vision
        5750,
    },
    { -- 2500 Daily Quests Completed
        5751,
    },
    { -- Justly Rewarded
        5752,
    },
    { -- Cataclysmically Delicious
        5753,
    },
    { -- Drown Your Sorrows
        5754,
    },
    { -- Thirty Tabards
        5755,
    },
    { -- Spirit Twister
        5759,
    },
    { -- Ring Out!
        5760,
    },
    { -- Hex Mix
        5761,
    },
    { -- Ohganot So Fast!
        5762,
    },
    { -- "Here, Kitty Kitty..."
        5765,
    },
    { -- Scourer of the Eternal Sands
        5767,
    },
    { -- Heroic: Zul'Gurub
        5768,
    },
    { -- Heroic: Zul'Aman
        5769,
    },
    { -- You'll Feel Right as Rain
        5779,
    },
    { -- Agent of the Shen'dralar
        5788,
    },
    {KrowiAF.SetAchievementPatch, 4, 1, 0}, -- Rework loading so this can go to the top, future me problem
};