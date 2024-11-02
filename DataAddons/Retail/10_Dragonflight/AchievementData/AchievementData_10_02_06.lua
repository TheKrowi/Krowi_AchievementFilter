local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["10_02_06"] = {
    { -- Draconic Legend: Dragonflight Season 4
        19453,
        {
            IsPvP = true,
        },
    },
    { -- Draconic Gladiator: Dragonflight Season 4
        19454,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Draconic
        19455,
        faction.Alliance,
        nil,
        true,
    },
    { -- Hero of the Horde: Draconic
        19456,
        faction.Horde,
        nil,
        true,
    },
    { -- A World Awoken
        19458,
    },
    { -- Dragon Quests
        19463,
    },
    { -- "Oh My God, They Were Clutchmates"
        19466,
    },
    { -- Now THIS is Dragon Racing!
        19478,
    },
    { -- Wake Me Up
        19479,
    },
    { -- Centaur of Attention
        19481,
    },
    { -- Army of the Fed
        19482,
    },
    { -- Flight Club
        19483,
    },
    { -- Closing Time
        19485,
    },
    { -- Across the Isles
        19486,
    },
    { -- Gladiator: Dragonflight Season 4
        19490,
    },
    { -- Duelist: Dragonflight Season 4
        19492,
        {
            IsPvP = true,
        },
    },
    { -- Rival I: Dragonflight Season 4
        19493,
        {
            IsPvP = true,
        },
    },
    { -- Combatant I: Dragonflight Season 4
        19494,
        {
            IsPvP = true,
        },
    },
    { -- Combatant II: Dragonflight Season 4
        19495,
        {
            IsPvP = true,
        },
    },
    { -- Challenger I: Dragonflight Season 4
        19497,
        {
            IsPvP = true,
        },
    },
    { -- Rival II: Dragonflight Season 4
        19498,
        {
            IsPvP = true,
        },
    },
    { -- Challenger II: Dragonflight Season 4
        19499,
        {
            IsPvP = true,
        },
    },
    { -- Legend: Dragonflight Season 4
        19500,
        {
            IsPvP = true,
        },
    },
    { -- Draconic Gladiator's Drake
        19503,
    },
    { -- Fringe Benefits
        19507,
    },
    { -- Elite: Dragonflight Season 4
        19509,
        {
            IsPvP = true,
        },
    },
    { -- Battle Mender: Dragonflight Season 4
        19513,
        {
            IsPvP = true,
        },
    },
    { -- Awakened Storms
        19564,
    },
    { -- Heroic: Awakened Storms
        19565,
    },
    { -- Mythic: Awakened Storms
        19566,
    },
    { -- Awakened Shadows
        19567,
    },
    { -- Heroic: Awakened Shadows
        19568,
    },
    { -- Mythic: Awakened Shadows
        19569,
    },
    { -- Awakened Flames
        19570,
    },
    { -- Heroic: Awakened Flames
        19571,
    },
    { -- Mythic: Awakened Flames
        19572,
    },
    { -- Awakening the Dragonflight Raids
        19574,
    },
    { -- Heroic: Awakening the Dragonflight Raids
        19575,
    },
    { -- Mythic: Awakening the Dragonflight Raids
        19576,
    },
    { -- Dragonflight Keystone Explorer: Season Four
        19780,
    },
    { -- Dragonflight Keystone Conqueror: Season Four
        19781,
    },
    { -- Dragonflight Keystone Master: Season Four
        19782,
    },
    { -- Dragonflight Keystone Hero: Season Four
        19783,
    },
    { -- Draconic Hero: Dragonflight Season 4
        19785,
    },
    { -- Quacked Killer
        20209,
    },
    { -- Dragonflight Season 4 Master
        20481,
    },
    { -- Back from the Beyond
        20501,
    },
    { -- Plunder Wonder
        20508,
    },
    { -- Plunderkind
        20509,
    },
    {KrowiAF.SetAchievementPatch, 10, 2, 6}, -- Rework loading so this can go to the top, future me problem
};