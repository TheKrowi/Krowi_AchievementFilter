local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_04_01"] = {
    { -- Protocol Inferno: Blackrock Caverns
        41139,
    },
    { -- Protocol Inferno: Throne of the Tides
        41140,
    },
    { -- Protocol Inferno: The Stonecore
        41141,
    },
    { -- Protocol Inferno: The Vortex Pinnacle
        41142,
    },
    { -- Protocol Inferno: Grim Batol
        41143,
    },
    { -- Protocol Inferno: Halls of Origination
        41144,
    },
    { -- Protocol Inferno: Lost City of the Tol'vir
        41145,
    },
    { -- Protocol Inferno: Deadmines
        41146,
    },
    { -- Protocol Inferno: Shadowfang Keep
        41147,
    },
    { -- Protocol Inferno: Terminated
        41148,
    },
    {KrowiAF.SetAchievementPatch, 4, 4, 1}, -- Rework loading so this can go to the top, future me problem
};