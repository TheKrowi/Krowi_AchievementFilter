local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_01_05"] = {
    { -- Allied Races: Zandalari Troll
        13161,
        faction.Horde,
    },
    { -- Allied Races: Kul Tiran
        13163,
        faction.Alliance,
    },
    { -- You Are Not Your $#*@! Legplates
        13186,
        faction.Alliance,
        13188,
    },
    { -- You Are Not Your $#*@! Legplates
        13188,
        faction.Horde,
        13186,
    },
    { -- The Second Rule of Brawler's Guild
        13189,
        faction.Alliance,
        13190,
    },
    { -- The Second Rule of Brawler's Guild
        13190,
        faction.Horde,
        13189,
    },
    { -- Brawler for Azeroth
        13191,
        faction.Alliance,
        13192,
    },
    { -- Brawler for Azeroth
        13192,
        faction.Horde,
        13191,
    },
    { -- I Am Thrall's Complete Lack Of Surprise
        13194,
    },
    { -- Flame Keeper of Zandalar
        13340,
        faction.Horde,
        13341,
    },
    { -- Flame Warden of Kul Tiras
        13341,
        faction.Alliance,
        13340,
    },
    { -- Extinguishing Kul Tiras
        13342,
        faction.Horde,
        13343,
    },
    { -- Extinguishing Zandalar
        13343,
        faction.Alliance,
        13342,
    },
    { -- Elite: Battle for Azeroth Season 1
        13465,
        {
            IsPvP = true,
        },
    },
    { -- Tides of Vengeance
        13466,
        faction.Horde,
        13467,
    },
    { -- Tides of Vengeance
        13467,
        faction.Alliance,
        13466,
    },
    { -- Raiding with Leashes VI: Pets of Pandaria
        13469,
    },
    { -- Gotta Bounce
        13501,
    },
    { -- Heritage of the Zandalari
        13503,
        faction.Horde,
    },
    { -- Heritage of the Kul Tirans
        13504,
        faction.Alliance,
    },
    { -- A Good Eye-dea
        13506,
    },
    { -- Master Calligrapher
        13512,
    },
    { -- Massive Tool
        13516,
    },
    { -- Two Sides to Every Tale
        13517,
    },
    {KrowiAF.SetAchievementPatch, 8, 1, 5}, -- Rework loading so this can go to the top, future me problem
};