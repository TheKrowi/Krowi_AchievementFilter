local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_02_00"] = {
    { -- Dead Man's Party
        3456,
    },
    { -- The Captain's Booty
        3457,
    },
    { -- Pilgrim
        3478,
        faction.Alliance,
    },
    { -- The Marine Marine
        3536,
    },
    { -- Pilgrim's Paunch
        3556,
        faction.Alliance,
        3557,
    },
    { -- Pilgrim's Paunch
        3557,
        faction.Horde,
        3556,
    },
    { -- Sharing is Caring
        3558,
    },
    { -- Turkey Lurkey
        3559,
    },
    { -- Now We're Cookin'
        3576,
        faction.Alliance,
        3577,
    },
    { -- Now We're Cookin'
        3577,
        faction.Horde,
        3576,
    },
    { -- The Turkinator
        3578,
    },
    { -- """FOOD FIGHT!"""
        3579,
    },
    { -- Pilgrim's Peril
        3580,
        faction.Alliance,
        3581,
    },
    { -- Pilgrim's Peril
        3581,
        faction.Horde,
        3580,
    },
    { -- Terokkar Turkey Time
        3582,
    },
    { -- Pilgrim's Progress
        3596,
        faction.Alliance,
        3597,
    },
    { -- Pilgrim's Progress
        3597,
        faction.Horde,
        3596,
    },
    { -- Murkimus the Gladiator
        3618,
        {
            IsPvP = true,
        },
    },
    { -- Jade Tiger
        3636,
    },
    { -- Pilgrim
        3656,
        faction.Horde,
    },
    { -- Relentless Gladiator's Frost Wyrm
        3757,
        {
            IsPvP = true,
        },
    },
    { -- Relentless Gladiator
        3758,
        {
            IsPvP = true,
        },
    },
    { -- Isle of Conquest Victory
        3776,
        {
            IsPvP = true,
        },
    },
    { -- Isle of Conquest Veteran
        3777,
        {
            IsPvP = true,
        },
    },
    { -- Trial of the Champion
        3778,
        faction.Horde,
        4296,
    },
    { -- Upper Back Pain (10 player)
        3797,
    },
    { -- Resilience Will Fix It (10 player)
        3798,
    },
    { -- Salt and Pepper (10 player)
        3799,
    },
    { -- The Traitor King (10 player)
        3800,
    },
    { -- Argent Confessor
        3802,
    },
    { -- The Faceroller
        3803,
    },
    { -- I've Had Worse
        3804,
    },
    { -- A Tribute to Skill (10 player)
        3808,
    },
    { -- A Tribute to Mad Skill (10 player)
        3809,
    },
    { -- A Tribute to Insanity (10 player)
        3810,
    },
    { -- Call of the Grand Crusade (25 player)
        3812,
    },
    { -- Upper Back Pain (25 player)
        3813,
    },
    { -- Salt and Pepper (25 player)
        3815,
    },
    { -- The Traitor King (25 player)
        3816,
    },
    { -- A Tribute to Skill (25 player)
        3817,
    },
    { -- A Tribute to Mad Skill (25 player)
        3818,
    },
    { -- A Tribute to Insanity (25 player)
        3819,
    },
    { -- Koralon the Flame Watcher (10 player)
        3836,
    },
    { -- Koralon the Flame Watcher (25 player)
        3837,
    },
    { -- 1000 Dungeon & Raid Emblems
        3844,
    },
    { -- Isle of Conquest All-Star
        3845,
        {
            IsPvP = true,
        },
    },
    { -- Resource Glut
        3846,
        faction.Alliance,
        4176,
        true,
    },
    { -- Four Car Garage
        3847,
        {
            IsPvP = true,
        },
    },
    { -- A-bomb-inable
        3848,
        {
            IsPvP = true,
        },
    },
    { -- A-bomb-ination
        3849,
        {
            IsPvP = true,
        },
    },
    { -- Mowed Down
        3850,
        {
            IsPvP = true,
        },
    },
    { -- Mine
        3851,
        faction.Alliance,
        4177,
        true,
    },
    { -- Cut the Blue Wire... No the Red Wire!
        3852,
        {
            IsPvP = true,
        },
    },
    { -- All Over the Isle
        3853,
        {
            IsPvP = true,
        },
    },
    { -- Back Door Job
        3854,
        {
            IsPvP = true,
        },
    },
    { -- Glaive Grave
        3855,
        {
            IsPvP = true,
        },
    },
    { -- Demolition Derby
        3856,
        faction.Alliance,
        4256,
        true,
    },
    { -- Master of Isle of Conquest
        3857,
        faction.Alliance,
        3957,
        true,
    },
    { -- Onyx Panther
        3896,
    },
    { -- Call of the Crusade (25 player)
        3916,
    },
    { -- Call of the Crusade (10 player)
        3917,
    },
    { -- Call of the Grand Crusade (10 player)
        3918,
    },
    { -- "Not One, But Two Jormungars (10 player)"
        3936,
    },
    { -- "Not One, But Two Jormungars (25 player)"
        3937,
    },
    { -- Master of Isle of Conquest
        3957,
        faction.Horde,
        3857,
        true,
    },
    { -- Three Sixty Pain Spike (10 player)
        3996,
    },
    { -- Three Sixty Pain Spike (25 player)
        3997,
    },
    { -- "Earth, Wind & Fire (10 player)"
        4016,
    },
    { -- "Earth, Wind & Fire (25 player)"
        4017,
    },
    { -- Realm First! Grand Crusader
        4078,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- A Tribute to Immortality
        4079,
        faction.Horde,
        4156,
    },
    { -- A Tribute to Dedicated Insanity
        4080,
    },
    { -- A Tribute to Immortality
        4156,
        faction.Alliance,
        4079,
    },
    { -- Resource Glut
        4176,
        faction.Horde,
        3846,
        true,
    },
    { -- Mine
        4177,
        faction.Horde,
        3851,
        true,
    },
    { -- Demolition Derby
        4256,
        faction.Horde,
        3856,
        true,
    },
    { -- Trial of the Champion
        4296,
        faction.Alliance,
        3778,
    },
    { -- Heroic: Trial of the Champion
        4297,
        faction.Horde,
        4298,
    },
    { -- Heroic: Trial of the Champion
        4298,
        faction.Alliance,
        4297,
    },
    { -- 2500 Dungeon & Raid Emblems
        4316,
    },
    {KrowiAF.SetAchievementPatch, 3, 2, 0}, -- Rework loading so this can go to the top, future me problem
};