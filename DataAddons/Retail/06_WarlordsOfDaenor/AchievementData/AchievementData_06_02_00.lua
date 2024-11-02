local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["06_02_00"] = {
    { -- A Race Against Slime
        9972,
    },
    { -- Get In My Belly!
        9979,
    },
    { -- That's Whack!
        9983,
    },
    { -- Pro Toss
        9988,
    },
    { -- Non-Lethal Enforcer
        9989,
    },
    { -- Soldier of the Alliance: Warlords Season 1
        9995,
        faction.Alliance,
        9998,
        true,
    },
    { -- Defender of the Alliance: Warlords Season 1
        9996,
        faction.Alliance,
        10001,
        true,
    },
    { -- Guardian of the Alliance: Warlords Season 1
        9997,
        faction.Alliance,
        10000,
        true,
    },
    { -- Soldier of the Horde: Warlords Season 1
        9998,
        faction.Horde,
        9995,
        true,
    },
    { -- Guardian of the Horde: Warlords Season 1
        10000,
        faction.Horde,
        9997,
        true,
    },
    { -- Defender of the Horde: Warlords Season 1
        10001,
        faction.Horde,
        9996,
        true,
    },
    { -- Gate of the Setting Sun
        10010,
    },
    { -- Siege of Niuzao Temple
        10011,
    },
    { -- This Land Was Green and Good Until...
        10012,
    },
    { -- Waves Came Crashing Down All Around
        10013,
    },
    { -- Full Discography
        10015,
        faction.Alliance,
        10016,
    },
    { -- Full Discography
        10016,
        faction.Horde,
        10015,
    },
    { -- Naval Bonus Specialist
        10017,
    },
    { -- Draenor Pathfinder
        10018,
    },
    { -- The Black Gate
        10019,
    },
    { -- Destructor's Rise
        10020,
    },
    { -- Chapter IV: Darkness Incarnate
        10021,
        faction.Alliance,
        10148,
    },
    { -- Hellbreach
        10023,
    },
    { -- Halls of Blood
        10024,
    },
    { -- Bastion of Shadows
        10025,
    },
    { -- Nearly Indestructible
        10026,
    },
    { -- Mythic: Hellfire Assault
        10027,
    },
    { -- Bad Manner(oth)
        10030,
    },
    { -- Mythic: Iron Reaver
        10032,
    },
    { -- Mythic: Kormrok
        10033,
    },
    { -- Mythic: Hellfire High Council
        10034,
    },
    { -- Mythic: Kilrogg Deadeye
        10035,
    },
    { -- Naval Bonus Expert
        10036,
    },
    { -- Mythic: Shadow-Lord Iskar
        10037,
    },
    { -- Mythic: Fel Lord Zakuun
        10038,
    },
    { -- Mythic: Xhul'horac
        10039,
    },
    { -- Mythic: Socrethar the Eternal
        10040,
    },
    { -- Mythic: Tyrant Velhari
        10041,
    },
    { -- Mythic: Mannoroth
        10042,
    },
    { -- Mythic: Archimonde
        10043,
    },
    { -- Ahead of the Curve: The Black Gate
        10044,
    },
    { -- Cutting Edge: The Black Gate
        10045,
    },
    { -- Tiny Terrors in Tanaan
        10052,
    },
    { -- I Found Pepe!
        10053,
    },
    { -- Don't Fear the Reaper
        10054,
    },
    { -- Turning the Tide
        10057,
    },
    { -- WoW's 11th Anniversary
        10058,
    },
    { -- Hellbane
        10061,
    },
    { -- In Pursuit of Gul'dan
        10067,
        faction.Alliance,
        10074,
    },
    { -- Draenor's Last Stand
        10068,
        faction.Alliance,
        10075,
    },
    { -- "I Came, I Clawed, I Conquered"
        10069,
    },
    { -- Jungle Stalker
        10070,
    },
    { -- The Legion Will NOT Conquer All
        10071,
    },
    { -- Rumble in the Jungle
        10072,
        faction.Alliance,
        10265,
    },
    { -- Echoes of Doomfire
        10073,
    },
    { -- In Pursuit of Gul'dan
        10074,
        faction.Horde,
        10067,
    },
    { -- Draenor's Last Stand
        10075,
        faction.Horde,
        10068,
    },
    { -- Mythic: Bloodmaul Slag Mines
        10076,
    },
    { -- Mythic: Iron Docks
        10079,
    },
    { -- Mythic: Auchindoun
        10080,
    },
    { -- Mythic: Skyreach
        10081,
    },
    { -- Mythic: Grimrail Depot
        10082,
    },
    { -- Mythic: The Everbloom
        10083,
    },
    { -- Mythic: Shadowmoon Burial Grounds
        10084,
    },
    { -- Mythic: Upper Blackrock Spire
        10085,
    },
    { -- I'm a Soul Man
        10086,
    },
    { -- You Gotta Keep 'em Separated
        10087,
    },
    { -- Wild Conquest
        10088,
        faction.Horde,
        10089,
        true,
    },
    { -- Wild Conquest
        10089,
        faction.Alliance,
        10088,
        true,
    },
    { -- Warmongering Conquest
        10090,
        faction.Horde,
        10091,
        true,
    },
    { -- Warmongering Conquest
        10091,
        faction.Alliance,
        10090,
        true,
    },
    { -- Wild Combatant
        10092,
        faction.Horde,
        10093,
        true,
    },
    { -- Wild Combatant
        10093,
        faction.Alliance,
        10092,
        true,
    },
    { -- Warmongering Combatant
        10094,
        faction.Horde,
        10095,
        true,
    },
    { -- Warmongering Combatant
        10095,
        faction.Alliance,
        10094,
        true,
    },
    { -- Wild Gladiator: Warlords Season 2
        10096,
        {
            IsPvP = true,
        },
    },
    { -- Warmongering Gladiator: Warlords Season 3
        10097,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Warlords Season 2
        10098,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Warlords Season 2
        10099,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Warlords Season 2
        10100,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Warlords Season 2
        10101,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Wild
        10102,
        faction.Alliance,
        10103,
        true,
    },
    { -- Hero of the Horde: Wild
        10103,
        faction.Horde,
        10102,
        true,
    },
    { -- Soldier of the Alliance: Warlords Season 2
        10104,
        faction.Alliance,
        10105,
        true,
    },
    { -- Soldier of the Horde: Warlords Season 2
        10105,
        faction.Horde,
        10104,
        true,
    },
    { -- Defender of the Alliance: Warlords Season 2
        10106,
        faction.Alliance,
        10107,
        true,
    },
    { -- Defender of the Horde: Warlords Season 2
        10107,
        faction.Horde,
        10106,
        true,
    },
    { -- Guardian of the Alliance: Warlords Season 2
        10108,
        faction.Alliance,
        10109,
        true,
    },
    { -- Guardian of the Horde: Warlords Season 2
        10109,
        faction.Horde,
        10108,
        true,
    },
    { -- Gladiator: Warlords Season 3
        10110,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Warlords Season 3
        10111,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Warlords Season 3
        10112,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Warlords Season 3
        10113,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Warmongering
        10114,
        faction.Alliance,
        10115,
        true,
    },
    { -- Hero of the Horde: Warmongering
        10115,
        faction.Horde,
        10114,
        true,
    },
    { -- Guardian of the Alliance: Warlords Season 3
        10116,
        faction.Alliance,
        10117,
        true,
    },
    { -- Guardian of the Horde: Warlords Season 3
        10117,
        faction.Horde,
        10116,
        true,
    },
    { -- Defender of the Alliance: Warlords Season 3
        10118,
        faction.Alliance,
        10119,
        true,
    },
    { -- Defender of the Horde: Warlords Season 3
        10119,
        faction.Horde,
        10118,
        true,
    },
    { -- Soldier of the Alliance: Warlords Season 3
        10120,
        faction.Alliance,
        10121,
        true,
    },
    { -- Soldier of the Horde: Warlords Season 3
        10121,
        faction.Horde,
        10120,
        true,
    },
    { -- Wild Gladiator's Felblood Gronnling
        10137,
        {
            IsPvP = true,
        },
    },
    { -- Warmongering Gladiator's Felblood Gronnling
        10146,
        {
            IsPvP = true,
        },
    },
    { -- Chapter IV: Darkness Incarnate
        10148,
        faction.Horde,
        10021,
    },
    { -- Glory of the Hellfire Raider
        10149,
    },
    { -- Naval Combat Expert
        10154,
    },
    { -- Naval Siege Expert
        10155,
    },
    { -- Naval Combat Specialist
        10156,
    },
    { -- Naval Treasure Specialist
        10159,
    },
    { -- Naval Treasure Expert
        10160,
    },
    { -- Naval Siege Specialist
        10161,
    },
    { -- Naval Training Specialist
        10162,
    },
    { -- Naval Training Expert
        10163,
    },
    { -- Master of the Seas
        10164,
    },
    { -- Ironsides
        10165,
    },
    { -- Naval Mechanics
        10166,
    },
    { -- Exploring the High Seas
        10167,
        faction.Alliance,
        10307,
    },
    { -- Naval Armada
        10168,
    },
    { -- Naval Fleet
        10169,
    },
    { -- Seaman
        10170,
    },
    { -- Petty Officer
        10172,
        faction.Alliance,
        10255,
    },
    { -- Fleet Commander
        10173,
        faction.Alliance,
        10275,
    },
    { -- Admiral
        10174,
        faction.Alliance,
        10276,
    },
    { -- Set Sail!
        10177,
    },
    { -- Mythic: Gorefiend
        10253,
    },
    { -- Petty Officer
        10255,
        faction.Horde,
        10172,
    },
    { -- Charting a Course
        10256,
        faction.Alliance,
        10258,
    },
    { -- Charting a Course
        10258,
        faction.Horde,
        10256,
    },
    { -- Jungle Hunter
        10259,
    },
    { -- Explore Tanaan Jungle
        10260,
    },
    { -- Jungle Treasure Hunter
        10261,
    },
    { -- Jungle Treasure Master
        10262,
    },
    { -- Rumble in the Jungle
        10265,
        faction.Horde,
        10072,
    },
    { -- Fleet Commander
        10275,
        faction.Horde,
        10173,
    },
    { -- Admiral
        10276,
        faction.Horde,
        10174,
    },
    { -- Exploring the High Seas
        10307,
        faction.Horde,
        10167,
    },
    { -- Predator
        10334,
    },
    { -- Master Treasure Hunter
        10348,
    },
    { -- Tanaan Diplomat
        10349,
        faction.Horde,
        10350,
    },
    { -- Tanaan Diplomat
        10350,
        faction.Alliance,
        10349,
    },
    {KrowiAF.SetAchievementPatch, 6, 2, 0}, -- Rework loading so this can go to the top, future me problem
};