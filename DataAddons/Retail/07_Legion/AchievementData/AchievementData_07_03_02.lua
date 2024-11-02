local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_03_02"] = {
    { -- Rides of War
        11931,
    },
    { -- Dominant Gladiator: Legion Season 6
        12134,
        {
            IsPvP = true,
        },
    },
    { -- Dominant Elite
        12135,
        {
            IsPvP = true,
        },
    },
    { -- Dominant Combatant
        12136,
        faction.Horde,
        12137,
        true,
    },
    { -- Dominant Combatant
        12137,
        faction.Alliance,
        12136,
        true,
    },
    { -- Dominant Gladiator's Storm Dragon
        12139,
        {
            IsPvP = true,
        },
    },
    { -- Demonic Gladiator's Storm Dragon
        12140,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Legion Season 6
        12167,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Legion Season 7
        12168,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 6
        12169,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 6
        12170,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Legion Season 6
        12171,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Dominant
        12172,
        faction.Horde,
        12173,
        true,
    },
    { -- Hero of the Alliance: Dominant
        12173,
        faction.Alliance,
        12172,
        true,
    },
    { -- Defender of the Horde: Legion Season 6
        12174,
        faction.Horde,
        12175,
        true,
    },
    { -- Defender of the Alliance: Legion Season 6
        12175,
        faction.Alliance,
        12174,
        true,
    },
    { -- Guardian of the Horde: Legion Season 6
        12176,
        faction.Horde,
        12177,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 6
        12177,
        faction.Alliance,
        12176,
        true,
    },
    { -- Soldier of the Horde: Legion Season 6
        12178,
        faction.Horde,
        12179,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 6
        12179,
        faction.Alliance,
        12178,
        true,
    },
    { -- Catching Twenty-Two
        12180,
        {
            IsPvP = true,
        },
    },
    { -- Protocol 2.3
        12181,
        {
            IsPvP = true,
        },
    },
    { -- Demonic Double Dozen
        12182,
        {
            IsPvP = true,
        },
    },
    { -- Prestige Quartermaster
        12183,
        {
            IsPvP = true,
        },
    },
    { -- Stardust Crusaders
        12257,
    },
    {KrowiAF.SetAchievementPatch, 7, 3, 2}, -- Rework loading so this can go to the top, future me problem
};