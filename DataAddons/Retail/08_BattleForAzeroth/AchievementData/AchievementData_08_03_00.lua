local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_03_00"] = {
    { -- Allied Races: Vulpera
        13206,
        faction.Horde,
    },
    { -- Corrupted Gladiator: Battle for Azeroth Season 4
        13957,
        {
            IsPvP = true,
        },
    },
    { -- Corrupted Gladiator's Proto-Drake
        13958,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Battle for Azeroth Season 4
        13959,
        {
            IsPvP = true,
        },
    },
    { -- Combatant: Battle for Azeroth Season 4
        13962,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Battle for Azeroth Season 4
        13963,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Battle for Azeroth Season 4
        13964,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Corrupted
        13965,
        faction.Horde,
        13966,
        true,
    },
    { -- Hero of the Alliance: Corrupted
        13966,
        faction.Alliance,
        13965,
        true,
    },
    { -- Gladiator: Battle for Azeroth Season 4
        13967,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Battle for Azeroth Season 4
        13989,
        {
            IsPvP = true,
        },
    },
    { -- "You Can Pet the Dog, But..."
        13990,
    },
    { -- Through the Depths of Visions
        13994,
    },
    { -- Pure of Heart
        13998,
    },
    { -- How? Isn't it Obelisk?
        13999,
    },
    { -- Heritage of the Vulpera
        14002,
        faction.Horde,
    },
    { -- Mana Sponge
        14008,
    },
    { -- Allied Races: Mechagnome
        14013,
        faction.Alliance,
    },
    { -- Heritage of the Mechagnome
        14014,
        faction.Alliance,
    },
    { -- Smoke Test
        14019,
    },
    { -- Pet Battle Challenge: Blackrock Depths
        14020,
    },
    { -- The Shadows Revealed
        14021,
    },
    { -- Realizing Your Potential
        14023,
    },
    { -- Buzzer Beater
        14024,
    },
    { -- Temper Tantrum
        14026,
    },
    { -- Battle for Mrrglroth
        14027,
    },
    { -- Phase 3: Prophet
        14037,
    },
    { -- Bloody Mess
        14038,
    },
    { -- "Mythic: Wrathion, the Black Emperor"
        14041,
    },
    { -- Mythic: Maut
        14043,
    },
    { -- Mythic: The Prophet Skitra
        14044,
    },
    { -- Mythic: Dark Inquisitor Xanesh
        14045,
    },
    { -- Mythic: The Hivemind
        14046,
    },
    { -- Mythic: Shad'har the Insatiable
        14048,
    },
    { -- Mythic: Drest'agath
        14049,
    },
    { -- Mythic: Vexiona
        14050,
    },
    { -- Mythic: Ra-den the Despoiled
        14051,
    },
    { -- "Mythic: Il'gynoth, Corruption Reborn"
        14052,
    },
    { -- Mythic: Carapace of N'Zoth
        14054,
    },
    { -- Mythic: N'Zoth the Corruptor
        14055,
    },
    { -- All Eyes On Me
        14058,
    },
    { -- The Eyes Have It
        14059,
    },
    { -- Unwavering Resolve
        14060,
    },
    { -- We Have the Technology
        14061,
    },
    { -- Horrific Vision of Stormwind
        14062,
    },
    { -- Horrific Vision of Orgrimmar
        14063,
    },
    { -- The Even More Horrific Vision of Stormwind
        14064,
    },
    { -- The Even More Horrific Vision of Orgrimmar
        14065,
    },
    { -- The Most Horrific Vision of Stormwind
        14066,
    },
    { -- The Most Horrific Vision of Orgrimmar
        14067,
    },
    { -- Ahead of the Curve: N'Zoth the Corruptor
        14068,
    },
    { -- Cutting Edge: N'Zoth the Corruptor
        14069,
    },
    { -- Total Annihilation
        14139,
    },
    { -- Mad World
        14140,
    },
    { -- Reeking of Visions
        14143,
    },
    { -- Battle for Azeroth Keystone Conqueror: Season Four
        14144,
    },
    { -- Battle for Azeroth Keystone Master: Season Four
        14145,
    },
    { -- Glory of the Ny'alotha Raider
        14146,
    },
    { -- Cleansing Treatment
        14147,
    },
    { -- It's Not A Cult
        14148,
    },
    { -- Heroic: War for the Shore
        14149,
        faction.Horde,
        14150,
    },
    { -- Heroic: War for the Shore
        14150,
        faction.Alliance,
        14149,
    },
    { -- Uldum Under Assault
        14153,
    },
    { -- Defend the Vale
        14154,
    },
    { -- Uldum Accord
        14155,
    },
    { -- The Rajani
        14156,
    },
    { -- The Corruptor's End
        14157,
    },
    { -- It's Not A Tumor!
        14158,
    },
    { -- Combating the Corruption
        14159,
    },
    { -- Rare to Well Done
        14160,
    },
    { -- All Consuming
        14161,
    },
    { -- Horrific Masquerade
        14162,
    },
    { -- Masked Soliloquy
        14165,
    },
    { -- Masked Duet
        14166,
    },
    { -- Masked Trio
        14167,
    },
    { -- Masked Quartet
        14168,
    },
    { -- Symphony of Masks
        14169,
    },
    { -- Thanks For The Mementos
        14170,
    },
    { -- Memento Mori
        14171,
    },
    { -- A Monumental Amount of Mementos
        14172,
    },
    { -- A Mountain of Mementos
        14173,
    },
    { -- Master of Deepwind Gorge
        14175,
        {
            IsPvP = true,
        },
    },
    { -- Conspicuous Consumption
        14183,
    },
    { -- Market Dominance
        14186,
        {
            IsPvP = true,
        },
    },
    { -- Cruisin' for a Brewsin'
        14187,
        {
            IsPvP = true,
        },
    },
    { -- Well Gorged
        14188,
        {
            IsPvP = true,
        },
    },
    { -- Servant of N'Zoth
        14191,
        {
            IsPvP = true,
        },
    },
    { -- Vision of Destiny
        14193,
    },
    { -- Halls of Devotion
        14194,
    },
    { -- Gift of Flesh
        14195,
    },
    { -- The Waking Dream
        14196,
    },
    {KrowiAF.SetAchievementPatch, 8, 3, 0}, -- Rework loading so this can go to the top, future me problem
};