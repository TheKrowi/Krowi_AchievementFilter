local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_01_00"] = {
    { -- WoW's 17th Anniversary
        14942,
    },
    { -- Guarmageddon
        14943,
    },
    { -- Chains of Domination
        14961,
    },
    { -- Combatant I: Shadowlands Season 2
        14968,
        {
            IsPvP = true,
        },
    },
    { -- Challenger I: Shadowlands Season 2
        14969,
        {
            IsPvP = true,
        },
    },
    { -- Rival I: Shadowlands Season 2
        14970,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Shadowlands Season 2
        14971,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Shadowlands Season 2
        14972,
        {
            IsPvP = true,
        },
    },
    { -- Unchained Gladiator: Shadowlands Season 2
        14973,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Shadowlands Season 2
        14974,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Unchained
        14975,
        faction.Alliance,
        14976,
        true,
    },
    { -- Hero of the Horde: Unchained
        14976,
        faction.Horde,
        14975,
        true,
    },
    { -- "Name A Better Duo, I'll Wait"
        14998,
    },
    { -- Unchained Gladiator's Soul Eater
        14999,
        {
            IsPvP = true,
        },
    },
    { -- United Front
        15000,
    },
    { -- Jailer's Personal Stash
        15001,
    },
    { -- To the Nines
        15003,
    },
    { -- A Sly Fox
        15004,
    },
    { -- Breaking Their Hold
        15032,
    },
    { -- Taking the Tremaculum
        15033,
    },
    { -- Wings Against the Flames
        15034,
    },
    { -- On the Offensive
        15035,
    },
    { -- Rooting Out the Evil
        15036,
    },
    { -- This Army
        15037,
    },
    { -- Up For Grabs
        15039,
    },
    { -- Flawless Fate
        15040,
    },
    { -- The Zovaal Shuffle
        15041,
    },
    { -- Tea for the Troubled
        15042,
    },
    { -- Hoarder of Torghast
        15043,
    },
    { -- Krrprripripkraak's Heroes
        15044,
    },
    { -- Keystone Hero: The Necrotic Wake
        15045,
    },
    { -- Keystone Hero: Plaguefall
        15046,
    },
    { -- Keystone Hero: Mists of Tirna Scithe
        15047,
    },
    { -- Keystone Hero: Halls of Atonement
        15048,
    },
    { -- Keystone Hero: Spires of Ascension
        15049,
    },
    { -- Keystone Hero: Theater of Pain
        15050,
    },
    { -- Keystone Hero: De Other Side
        15051,
    },
    { -- Keystone Hero: Sanguine Depths
        15052,
    },
    { -- Explore Korthia
        15053,
    },
    { -- Minions of the Cold Dark
        15054,
    },
    { -- Friend of Ooz
        15055,
    },
    { -- Friend of Bloop
        15056,
    },
    { -- Friend of Plaguey
        15057,
    },
    { -- I Used to Bullseye Deeprun Rats Back Home
        15058,
    },
    { -- Death's Advance
        15059,
    },
    { -- Breaking the Chains
        15064,
    },
    { -- Eye Wish You Were Here
        15065,
    },
    { -- Reliquary Restoration
        15066,
    },
    { -- Adamant Vaults
        15067,
    },
    { -- The Archivists' Codex
        15069,
    },
    { -- Shadowlands Keystone Explorer: Season Two
        15073,
    },
    { -- Infiltrators
        15075,
    },
    { -- The Box of Many Things
        15076,
    },
    { -- Shadowlands Keystone Conqueror: Season Two
        15077,
    },
    { -- Shadowlands Keystone Master: Season Two
        15078,
    },
    { -- "Many, Many Things"
        15079,
    },
    { -- So Blessed
        15080,
    },
    { -- Flawless: Skoldus Hall (Layer 12)
        15081,
    },
    { -- Flawless: Fracture Chambers (Layer 12)
        15082,
    },
    { -- Flawless: Coldheart Interstitia (Layer 12)
        15083,
    },
    { -- Flawless: The Soulforges (Layer 12)
        15084,
    },
    { -- Flawless: Mort'regar (Layer 12)
        15087,
    },
    { -- Flawless: The Upper Reaches (Layer 12)
        15088,
    },
    { -- Flawless Master (Layer 12)
        15089,
    },
    { -- A Taste of Perfection
        15091,
    },
    { -- Master of Torment
        15092,
    },
    { -- Avenge Me!
        15093,
    },
    { -- Rampage
        15094,
    },
    { -- No Doubt
        15095,
    },
    { -- Crowd Pleaser
        15096,
    },
    { -- Treasures of Korthia
        15099,
    },
    { -- It's Off the Chain!
        15102,
        {
            IsPvP = true,
        },
    },
    { -- Tormentor's Tango
        15105,
    },
    { -- Quality Control
        15106,
    },
    { -- Conquering Korthia
        15107,
    },
    { -- Together Forever
        15108,
    },
    { -- Will it Blend?
        15109,
    },
    { -- Dominating the Catwalk
        15110,
    },
    { -- Mythic: The Tarragrue
        15112,
    },
    { -- Mythic: The Eye of the Jailer
        15113,
    },
    { -- Mythic: The Nine
        15114,
    },
    { -- Mythic: Remnant of Ner'zhul
        15115,
    },
    { -- Mythic: Soulrender Dormazain
        15116,
    },
    { -- Mythic: Painsmith Raznal
        15117,
    },
    { -- Mythic: Guardian of the First Ones
        15118,
    },
    { -- Mythic: Fatescribe Roh-Kalo
        15119,
    },
    { -- Mythic: Kel'Thuzad
        15120,
    },
    { -- Mythic: Sylvanas Windrunner
        15121,
    },
    { -- The Jailer's Vanguard
        15122,
    },
    { -- The Dark Bastille
        15123,
    },
    { -- Shackles of Fate
        15124,
    },
    { -- The Reckoning
        15125,
    },
    { -- Sanctum of Domination
        15126,
    },
    { -- Heroic: Sanctum of Domination
        15127,
    },
    { -- Mythic: Sanctum of Domination
        15128,
    },
    { -- Glory of the Dominant Raider
        15130,
    },
    { -- Whack-A-Soul
        15131,
    },
    { -- Knowledge is Power
        15132,
    },
    { -- This World is a Prism
        15133,
    },
    { -- Ahead of the Curve: Sylvanas Windrunner
        15134,
    },
    { -- Cutting Edge: Sylvanas Windrunner
        15135,
    },
    { -- "Tazavesh, the Veiled Market"
        15177,
    },
    { -- Fake It 'Til You Make It
        15178,
    },
    { -- This is Fine
        15179,
    },
    { -- Mischief!
        15190,
    },
    { -- "Rae'shalare, Death's Whisper"
        15191,
    },
    {KrowiAF.SetAchievementPatch, 9, 1, 0}, -- Rework loading so this can go to the top, future me problem
};