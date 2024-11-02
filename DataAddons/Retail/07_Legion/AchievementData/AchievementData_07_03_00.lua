local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_03_00"] = {
    { -- Fisherfriend of the Isles
        11725,
    },
    { -- Don't Play With That In The House
        11913,
    },
    { -- Don't Sweat the Technique
        11915,
    },
    { -- Portal Combat
        11928,
    },
    { -- Worm-monger
        11930,
    },
    { -- Together We Stand
        11948,
    },
    { -- Hard to Kill
        11949,
    },
    { -- Glory of the Argus Raider
        11987,
    },
    { -- Light's Breach
        11988,
    },
    { -- Forbidden Descent
        11989,
    },
    { -- Hope's End
        11990,
    },
    { -- Seat of the Pantheon
        11991,
    },
    { -- Mythic: Garothi Worldbreaker
        11992,
    },
    { -- Mythic: Hounds of Sargeras
        11993,
    },
    { -- Mythic: Antoran High Command
        11994,
    },
    { -- Mythic: Portal Keeper Hasabel
        11995,
    },
    { -- Mythic: Eonar
        11996,
    },
    { -- Mythic: Imonar the Soulhunter
        11997,
    },
    { -- Mythic: Kin'garoth
        11998,
    },
    { -- Mythic: Varimathras
        11999,
    },
    { -- Mythic: The Coven of Shivarra
        12000,
    },
    { -- Mythic: Aggramar
        12001,
    },
    { -- Mythic: Argus the Unmaker
        12002,
    },
    { -- Welcome the Void
        12004,
    },
    { -- Let it All Out
        12005,
    },
    { -- Heroic: Seat of the Triumvirate
        12007,
    },
    { -- Mythic: Seat of the Triumvirate
        12008,
    },
    { -- Darker Side
        12009,
    },
    { -- Fierce Gladiator: Legion Season 5
        12010,
        {
            IsPvP = true,
        },
    },
    { -- Argussy Up
        12020,
    },
    { -- Claws Out
        12021,
    },
    { -- Invasion Obliteration
        12026,
    },
    { -- Envision Invasion Eradication
        12028,
    },
    { -- The World Revolves Around Me
        12030,
    },
    { -- Fierce Combatant
        12031,
        faction.Horde,
        12032,
        true,
    },
    { -- Fierce Combatant
        12032,
        faction.Alliance,
        12031,
        true,
    },
    { -- Duelist: Legion Season 5
        12034,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 5
        12035,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 5
        12036,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Fierce
        12037,
        faction.Alliance,
        12041,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 5
        12038,
        faction.Alliance,
        12042,
        true,
    },
    { -- Defender of the Alliance: Legion Season 5
        12039,
        faction.Alliance,
        12043,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 5
        12040,
        faction.Alliance,
        12044,
        true,
    },
    { -- Hero of the Horde: Fierce
        12041,
        faction.Horde,
        12037,
        true,
    },
    { -- Guardian of the Horde: Legion Season 5
        12042,
        faction.Horde,
        12038,
        true,
    },
    { -- Defender of the Horde: Legion Season 5
        12043,
        faction.Horde,
        12039,
        true,
    },
    { -- Soldier of the Horde: Legion Season 5
        12044,
        faction.Horde,
        12040,
        true,
    },
    { -- Gladiator: Legion Season 5
        12045,
        {
            IsPvP = true,
        },
    },
    { -- Remember the Titans
        12046,
    },
    { -- Hounds Good To Me
        12065,
    },
    { -- You Are Now Prepared!
        12066,
    },
    { -- Spheres of Influence
        12067,
    },
    { -- Explore Argus
        12069,
    },
    { -- Crucible's Promise
        12071,
    },
    { -- Now You're Cooking with Netherlight
        12072,
    },
    { -- Locked and Loaded
        12073,
    },
    { -- "Shoot First, Loot Later"
        12074,
    },
    { -- Protector of the Argussian Reach
        12076,
    },
    { -- Adventurer of Argus
        12077,
    },
    { -- Commander of Argus
        12078,
    },
    { -- Raiding with Leashes V: Cuteaclysm
        12079,
    },
    { -- Officer of the Light
        12081,
    },
    { -- Paragon of Argus
        12083,
    },
    { -- Infused and Abused
        12084,
    },
    { -- Anomalous Animals of Argus
        12088,
    },
    { -- Aquatic Assault
        12089,
    },
    { -- Fierce Elite
        12090,
        {
            IsPvP = true,
        },
    },
    { -- Beast Blitz
        12091,
    },
    { -- Critical Critters
        12092,
    },
    { -- Draconic Destruction
        12093,
    },
    { -- Elemental Escalation
        12094,
    },
    { -- Fierce Fliers
        12095,
    },
    { -- Humanoid Havoc
        12096,
    },
    { -- Magical Mayhem
        12097,
    },
    { -- Mechanical Melee
        12098,
    },
    { -- Unstoppable Undead
        12099,
    },
    { -- Family Fighter
        12100,
    },
    { -- We Came Here For Two Reasons
        12101,
    },
    { -- To Kill Demons...
        12102,
    },
    { -- ...And Chew Mana Buns
        12103,
    },
    { -- And We're All Out of Mana Buns
        12104,
    },
    { -- Double Decade of Dominance
        12108,
        {
            IsPvP = true,
        },
    },
    { -- Twenty-One Arms Salute
        12109,
        {
            IsPvP = true,
        },
    },
    { -- Ahead of the Curve: Argus the Unmaker
        12110,
    },
    { -- Cutting Edge: Argus the Unmaker
        12111,
    },
    { -- This is the War Room!
        12129,
    },
    {KrowiAF.SetAchievementPatch, 7, 3, 0}, -- Rework loading so this can go to the top, future me problem
};