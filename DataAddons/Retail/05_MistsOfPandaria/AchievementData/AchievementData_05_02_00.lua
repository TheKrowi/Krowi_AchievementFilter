local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["05_02_00"] = {
    { -- Ahead of the Curve: Will of the Emperor
        6954,
    },
    { -- Praise the Sun!
        8028,
    },
    { -- Genetically Unmodified Organism
        8037,
    },
    { -- Cretaceous Collector
        8038,
    },
    { -- Extinguishing Pandaria
        8042,
        faction.Alliance,
        8043,
    },
    { -- Extinguishing Pandaria
        8043,
        faction.Horde,
        8042,
    },
    { -- Flame Keeper of Pandaria
        8044,
        faction.Horde,
        8045,
    },
    { -- Flame Warden of Pandaria
        8045,
        faction.Alliance,
        8044,
    },
    { -- The Zandalari Prophecy
        8049,
    },
    { -- Rumbles of Thunder
        8050,
    },
    { -- Gods and Monsters
        8051,
    },
    { -- Khan
        8052,
        faction.Alliance,
        8055,
        true,
    },
    { -- Khan
        8055,
        faction.Horde,
        8052,
        true,
    },
    { -- Heroic: Jin'rokh the Breaker
        8056,
    },
    { -- Heroic: Horridon
        8057,
    },
    { -- Heroic: Council of Elders
        8058,
    },
    { -- Heroic: Tortos
        8059,
    },
    { -- Heroic: Megaera
        8060,
    },
    { -- Heroic: Ji-Kun
        8061,
    },
    { -- Heroic: Durumu the Forgotten
        8062,
    },
    { -- Heroic: Primordius
        8063,
    },
    { -- Heroic: Dark Animus
        8064,
    },
    { -- Heroic: Iron Qon
        8065,
    },
    { -- Heroic: Twin Empyreans
        8066,
    },
    { -- Heroic: Lei Shen
        8067,
    },
    { -- Heroic: Ra-den
        8068,
    },
    { -- Last Stand of the Zandalari
        8069,
    },
    { -- Forgotten Depths
        8070,
    },
    { -- Halls of Flesh-Shaping
        8071,
    },
    { -- Pinnacle of Storms
        8072,
    },
    { -- Cage Match
        8073,
    },
    { -- One-Up
        8077,
    },
    { -- Zul'Again
        8078,
    },
    { -- Fabled Pandaren Tamer
        8080,
    },
    { -- Ritualist Who?
        8081,
    },
    { -- Head Case
        8082,
    },
    { -- From Dusk 'til Dawn
        8086,
    },
    { -- Can't Touch This
        8087,
    },
    { -- I Thought He Was Supposed to Be Hard?
        8089,
    },
    { -- A Complete Circuit
        8090,
    },
    { -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
        8092,
    },
    { -- Tyrannical Conquest
        8093,
        faction.Horde,
        8218,
        true,
    },
    { -- Lightning Overload
        8094,
    },
    { -- Soft Hands
        8097,
    },
    { -- You Said Crossing the Streams Was Bad
        8098,
    },
    { -- Isle of Thunder
        8099,
    },
    { -- Pay to Slay
        8100,
    },
    { -- It Was Worth Every Ritual Stone
        8101,
    },
    { -- Champions of Lei Shen
        8103,
    },
    { -- Thunder Plunder
        8104,
    },
    { -- The Crumble Bundle
        8105,
    },
    { -- In the Hall of the Thunder King
        8106,
    },
    { -- Ready for RAAAAIIIIDDD?!?ing
        8107,
    },
    { -- "When in Ihgaluk, Do as the Skumblade Do"
        8108,
    },
    { -- The Mogu Below-gu
        8109,
    },
    { -- These Mogu Have Gotta Go-gu
        8110,
    },
    { -- This Isn't Even My Final Form
        8111,
    },
    { -- Blue Response
        8112,
    },
    { -- Platform Hero
        8114,
    },
    { -- Speed Metal
        8115,
    },
    { -- You Made Me Bleed My Own Blood
        8116,
    },
    { -- For the Ward!
        8117,
    },
    { -- Boop
        8118,
    },
    { -- Our Powers Combined
        8119,
    },
    { -- Direhorn in a China Shop
        8120,
    },
    { -- Stormbreaker
        8121,
    },
    { -- Millions of Years of Evolution vs. My Fist
        8123,
    },
    { -- Glory of the Thundering Raider
        8124,
    },
    { -- Operation: Shieldwall
        8205,
        faction.Alliance,
        8206,
    },
    { -- Dominance Offensive
        8206,
        faction.Horde,
        8205,
    },
    { -- Kirin Tor Offensive
        8208,
        faction.Alliance,
        8209,
    },
    { -- Sunreaver Onslaught
        8209,
        faction.Horde,
        8208,
    },
    { -- Shado-Pan Assault
        8210,
    },
    { -- Zandalari Library Card
        8212,
    },
    { -- Friends In Places Higher Yet
        8213,
    },
    { -- Malevolent Gladiator
        8214,
        {
            IsPvP = true,
        },
    },
    { -- Malevolent Gladiator's Cloud Serpent
        8216,
        {
            IsPvP = true,
        },
    },
    { -- Tyrannical Conquest
        8218,
        faction.Alliance,
        8093,
        true,
    },
    { -- History of the Mantid
        8219,
    },
    { -- Collector: Banners of the Mantid Empire
        8220,
    },
    { -- Collector: Banners of the Mantid Empire
        8221,
    },
    { -- Collector: Ancient Sap Feeders
        8222,
    },
    { -- Collector: Ancient Sap Feeders
        8223,
    },
    { -- Collector: Praying Mantids
        8224,
    },
    { -- Collector: Praying Mantids
        8225,
    },
    { -- Collector: Inert Sound Beacons
        8226,
    },
    { -- Collector: Inert Sound Beacons
        8227,
    },
    { -- Collector: Remains of Paragons
        8228,
    },
    { -- Collector: Remains of Paragons
        8229,
    },
    { -- Collector: Mantid Lamps
        8230,
    },
    { -- Collector: Mantid Lamps
        8231,
    },
    { -- Collector: Pollen Collectors
        8232,
    },
    { -- Collector: Pollen Collectors
        8233,
    },
    { -- Collector: Kypari Sap Containers
        8234,
    },
    { -- Collector: Kypari Sap Containers
        8235,
    },
    { -- Cutting Edge: Lei Shen
        8238,
    },
    { -- Hero of the Alliance: Malevolent
        8243,
        faction.Alliance,
        8244,
        true,
    },
    { -- Hero of the Horde: Malevolent
        8244,
        faction.Horde,
        8243,
        true,
    },
    { -- Ahead of the Curve: Grand Empress Shek'zeer
        8246,
    },
    { -- Ahead of the Curve: Sha of Fear
        8248,
    },
    { -- Ahead of the Curve: Lei Shen
        8249,
    },
    { -- Cutting Edge: Ra-den
        8260,
    },
    {KrowiAF.SetAchievementPatch, 5, 2, 0}, -- Rework loading so this can go to the top, future me problem
};