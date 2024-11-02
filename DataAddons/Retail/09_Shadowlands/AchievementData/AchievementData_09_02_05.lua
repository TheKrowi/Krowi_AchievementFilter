local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_02_05"] = {
    { -- Return to Lordaeron
        15579,
    },
    { -- Fearless Spectator
        15594,
    },
    { -- Challenger I: Shadowlands Season 4
        15600,
        {
            IsPvP = true,
        },
    },
    { -- Challenger II: Shadowlands Season 4
        15601,
        {
            IsPvP = true,
        },
    },
    { -- Rival I: Shadowlands Season 4
        15602,
        {
            IsPvP = true,
        },
    },
    { -- Rival II: Shadowlands Season 4
        15603,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Shadowlands Season 4
        15604,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Shadowlands Season 4
        15605,
        {
            IsPvP = true,
        },
    },
    { -- Eternal Gladiator: Shadowlands Season 4
        15606,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Eternal
        15607,
        faction.Horde,
        15608,
        true,
    },
    { -- Hero of the Alliance: Eternal
        15608,
        faction.Alliance,
        15607,
        true,
    },
    { -- Combatant I: Shadowlands Season 4
        15609,
        {
            IsPvP = true,
        },
    },
    { -- Combatant II: Shadowlands Season 4
        15610,
        {
            IsPvP = true,
        },
    },
    { -- Eternal Gladiator's Soul Eater
        15612,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Shadowlands Season 4
        15639,
        {
            IsPvP = true,
        },
    },
    { -- To Catch Falling Stars
        15645,
    },
    { -- Re-Re-Re-Renowned
        15646,
    },
    { -- Dead Men Tell Some Tales
        15647,
    },
    { -- Walking in Maw-mphis
        15648,
    },
    { -- Shadowlands Dilettante
        15649,
    },
    { -- Mythic: Streets of Wonder
        15650,
    },
    { -- Myths of the Shadowlands Dungeons
        15651,
    },
    { -- Mythic: So'leah's Gambit
        15652,
    },
    { -- The More You Know*
        15653,
    },
    { -- Back from the Beyond (Legacy)
        15654,
    },
    { -- Fate of Nathria
        15663,
    },
    { -- Heroic: Fate of Nathria
        15664,
    },
    { -- Mythic: Fate of Nathria
        15665,
    },
    { -- Fate of Domination
        15667,
    },
    { -- Heroic: Fate of Domination
        15668,
    },
    { -- Mythic: Fate of Domination
        15669,
    },
    { -- Fate of the Sepulcher
        15681,
    },
    { -- Heroic: Fate of the Sepulcher
        15682,
    },
    { -- Mythic: Fate of the Sepulcher
        15683,
    },
    { -- Fates of the Shadowlands Raids
        15684,
    },
    { -- Heroic: Fates of the Shadowlands Raids
        15685,
    },
    { -- Mythic: Fates of the Shadowlands Raids
        15687,
    },
    { -- Shadowlands Keystone Explorer: Season Four
        15688,
    },
    { -- Shadowlands Keystone Conqueror: Season Four
        15689,
    },
    { -- Shadowlands Keystone Master: Season Four
        15690,
    },
    { -- Cryptic Hero: Shadowlands Season 3
        15691,
    },
    { -- Keystone Hero: Return to Karazhan
        15692,
    },
    { -- Keystone Hero: Operation: Mechagon
        15693,
    },
    { -- Keystone Hero: Iron Docks
        15694,
    },
    { -- Keystone Hero: Grimrail Depot
        15695,
    },
    { -- Shrouded Hero: Shadowlands Season 4
        15756,
    },
    {KrowiAF.SetAchievementPatch, 9, 2, 5}, -- Rework loading so this can go to the top, future me problem
};