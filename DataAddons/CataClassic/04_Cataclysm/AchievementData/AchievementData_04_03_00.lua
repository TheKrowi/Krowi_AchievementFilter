local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_03_00"] = {
    { -- A-Caroling We Will Go
        5853,
        faction.Alliance,
        5854,
    },
    { -- A-Caroling We Will Go
        5854,
        faction.Horde,
        5853,
    },
    { -- Moon Guard
        5995,
    },
    { -- Vicious Gladiator
        6002,
        {
            IsPvP = true,
        },
    },
    { -- Vicious Gladiator's Twilight Drake
        6003,
        {
            IsPvP = true,
        },
    },
    { -- Elders of Cataclysm
        6006,
    },
    { -- Extinguishing Northrend
        6007,
        faction.Alliance,
        6010,
    },
    { -- Flame Warden of Northrend
        6008,
        faction.Alliance,
        6009,
    },
    { -- Flame Keeper of Northrend
        6009,
        faction.Horde,
        6008,
    },
    { -- Extinguishing Northrend
        6010,
        faction.Horde,
        6007,
    },
    { -- Flame Warden of Cataclysm
        6011,
        faction.Alliance,
        6012,
    },
    { -- Flame Keeper of Cataclysm
        6012,
        faction.Horde,
        6011,
    },
    { -- Extinguishing the Cataclysm
        6013,
        faction.Alliance,
        6014,
    },
    { -- Extinguishing the Cataclysm
        6014,
        faction.Horde,
        6013,
    },
    { -- "Come One, Come All!"
        6019,
    },
    { -- Step Right Up
        6020,
    },
    { -- Blastenheimer Bullseye
        6021,
    },
    { -- Quick Shot
        6022,
    },
    { -- Darkmoon Duelist
        6023,
    },
    { -- Darkmoon Dominator
        6024,
    },
    { -- I Was Promised a Pony
        6025,
    },
    { -- Fairegoer's Feast
        6026,
    },
    { -- Darkmoon Dungeoneer
        6027,
    },
    { -- Darkmoon Defender
        6028,
    },
    { -- Darkmoon Despoiler
        6029,
    },
    { -- Taking the Show on the Road
        6030,
        faction.Alliance,
        6031,
    },
    { -- Taking the Show on the Road
        6031,
        faction.Horde,
        6030,
    },
    { -- Faire Favors
        6032,
    },
    { -- Red Rider Air Rifle
        6059,
    },
    { -- MiniZep Controller
        6060,
    },
    { -- Gaudy Winter Veil Sweater
        6061,
    },
    { -- That's Not Canon!
        6070,
    },
    { -- Minutes to Midnight
        6084,
    },
    { -- Deck Defender
        6105,
    },
    { -- Siege of Wyrmrest Temple
        6106,
    },
    { -- Fall of Deathwing
        6107,
    },
    { -- Alizabal
        6108,
    },
    { -- Heroic: Morchok
        6109,
    },
    { -- Heroic: Warlord Zon'ozz
        6110,
    },
    { -- Heroic: Yor'sahj the Unsleeping
        6111,
    },
    { -- Heroic: Hagara the Stormbinder
        6112,
    },
    { -- Heroic: Ultraxion
        6113,
    },
    { -- Heroic: Warmaster Blackhorn
        6114,
    },
    { -- Heroic: Spine of Deathwing
        6115,
    },
    { -- Heroic: Madness of Deathwing
        6116,
    },
    { -- Heroic: End Time
        6117,
    },
    { -- Heroic: Well of Eternity
        6118,
    },
    { -- Heroic: Hour of Twilight
        6119,
    },
    { -- Ruthless Gladiator
        6124,
        {
            IsPvP = true,
        },
    },
    { -- Lazy Eye
        6127,
    },
    { -- Ping Pong Champion
        6128,
    },
    { -- Taste the Rainbow!
        6129,
    },
    { -- Severed Ties
        6130,
    },
    { -- WoW's 8th Anniversary
        6131,
    },
    { -- Eclipse
        6132,
    },
    { -- Maybe He'll Get Dizzy...
        6133,
    },
    { -- Glory of the Dragon Soul Raider
        6169,
    },
    { -- Don't Stand So Close to Me
        6174,
    },
    { -- Holding Hands
        6175,
    },
    { -- Destroyer's End
        6177,
    },
    { -- Chromatic Champion
        6180,
    },
    { -- Fangs of the Father
        6181,
    },
    { -- Murkablo
        6185,
    },
    {KrowiAF.SetAchievementPatch, 4, 3, 0}, -- Rework loading so this can go to the top, future me problem
};