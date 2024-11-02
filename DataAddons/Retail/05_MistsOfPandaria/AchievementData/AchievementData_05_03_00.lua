local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_03_00"] = {
    { -- Raiding with Leashes II: Attunement Edition
        8293,
    },
    { -- The Secrets of Ragefire
        8294,
    },
    { -- "The Few, the Proud, the Gob Squad"
        8295,
    },
    { -- Merciless Pet Brawler
        8297,
        {
            IsPvP = true,
        },
    },
    { -- Vengeful Pet Brawler
        8298,
        {
            IsPvP = true,
        },
    },
    { -- Brutal Pet Brawler
        8300,
        {
            IsPvP = true,
        },
    },
    { -- Deadly Pet Brawler
        8301,
        {
            IsPvP = true,
        },
    },
    { -- Mount Parade
        8302,
        faction.Horde,
        8304,
    },
    { -- Mount Parade
        8304,
        faction.Alliance,
        8302,
    },
    { -- Hordebreaker
        8306,
        faction.Alliance,
        8307,
    },
    { -- Darkspear Revolutionary
        8307,
        faction.Horde,
        8306,
    },
    { -- Heroic: A Brewing Storm
        8310,
    },
    { -- Heroic: Crypt of Forgotten Kings
        8311,
    },
    { -- Heroic: Blood in the Snow
        8312,
    },
    { -- Battle on the High Seas
        8314,
        faction.Alliance,
        8315,
    },
    { -- Battle on the High Seas
        8315,
        faction.Horde,
        8314,
    },
    { -- Blood in the Snow
        8316,
    },
    { -- Dark Heart of Pandaria
        8317,
    },
    { -- Heroic: Dark Heart of Pandaria
        8318,
    },
    { -- Accelerated Archaeology
        8319,
    },
    { -- Chapter V: Judgment of the Black Prince
        8325,
    },
    { -- Heroic: The Secrets of Ragefire
        8327,
    },
    { -- Heed the Weed
        8329,
    },
    { -- Hekima's Heal-Halter
        8330,
    },
    { -- Deepwind Gorge Victory
        8331,
        {
            IsPvP = true,
        },
    },
    { -- Deepwind Gorge Veteran
        8332,
        {
            IsPvP = true,
        },
    },
    { -- Deepwind Gorge Perfection
        8333,
        {
            IsPvP = true,
        },
    },
    { -- Having a Brawl (Season 1)
        8335,
        faction.Alliance,
        8337,
    },
    { -- I've Got the Biggest Brawls of Them All (Season 1)
        8336,
        faction.Alliance,
        8338,
    },
    { -- Having a Brawl (Season 1)
        8337,
        faction.Horde,
        8335,
    },
    { -- I've Got the Biggest Brawls of Them All (Season 1)
        8338,
        faction.Horde,
        8336,
    },
    { -- Collect Your Deck (Season 2)
        8339,
        faction.Alliance,
        8342,
    },
    { -- Deck Your Collection (Season 1)
        8340,
        faction.Alliance,
        8343,
    },
    { -- Collect Your Deck (Season 2)
        8342,
        faction.Horde,
        8339,
    },
    { -- Deck Your Collection (Season 1)
        8343,
        faction.Horde,
        8340,
    },
    { -- Hearthstoned
        8345,
    },
    { -- Keep those Bombs Away! (From Me)
        8347,
    },
    { -- The Longest Day
        8348,
    },
    { -- Mine! Mine! Mine!
        8350,
        {
            IsPvP = true,
        },
    },
    { -- Other People's Property
        8351,
        {
            IsPvP = true,
        },
    },
    { -- Puddle Jumper
        8354,
        {
            IsPvP = true,
        },
    },
    { -- Weighed Down
        8355,
        {
            IsPvP = true,
        },
    },
    { -- Deepwind Gorge All-Star
        8358,
        {
            IsPvP = true,
        },
    },
    { -- Capping Spree
        8359,
        {
            IsPvP = true,
        },
    },
    { -- Master of Deepwind Gorge
        8360,
        {
            IsPvP = true,
        },
    },
    { -- Heroic: Battle on the High Seas
        8364,
        faction.Alliance,
        8366,
    },
    { -- Heroic: Battle on the High Seas
        8366,
        faction.Horde,
        8364,
    },
    { -- Fight Anger with Anger
        8368,
    },
    { -- Tournament Participation 2013
        8391,
        {
            IsPvP = true,
        },
    },
    { -- Tournament Glory 2013
        8392,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 5, 3, 0}, -- Rework loading so this can go to the top, future me problem
};