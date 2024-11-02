local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_03_00"] = {
    { -- The Forge of Souls
        4516,
    },
    { -- The Pit of Saron
        4517,
    },
    { -- The Halls of Reflection
        4518,
    },
    { -- Heroic: The Forge of Souls
        4519,
    },
    { -- Heroic: The Pit of Saron
        4520,
    },
    { -- Heroic: The Halls of Reflection
        4521,
    },
    { -- Soul Power
        4522,
    },
    { -- Three Faced
        4523,
    },
    { -- Doesn't Go to Eleven
        4524,
    },
    { -- Don't Look Up
        4525,
    },
    { -- We're Not Retreating; We're Advancing in a Different Direction.
        4526,
    },
    { -- The Frostwing Halls (10 player)
        4527,
    },
    { -- The Plagueworks (10 player)
        4528,
    },
    { -- The Crimson Hall (10 player)
        4529,
    },
    { -- The Frozen Throne (10 player)
        4530,
    },
    { -- Storming the Citadel (10 player)
        4531,
    },
    { -- Fall of the Lich King (10 player)
        4532,
    },
    { -- Boned (10 player)
        4534,
    },
    { -- Full House (10 player)
        4535,
    },
    { -- I'm on a Boat (10 player)
        4536,
    },
    { -- I've Gone and Made a Mess (10 player)
        4537,
    },
    { -- Dances with Oozes (10 player)
        4538,
    },
    { -- "Once Bitten, Twice Shy (10 player)"
        4539,
    },
    { -- Realm First! Fall of the Lich King
        4576,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Flu Shot Shortage (10 player)
        4577,
    },
    { -- "Nausea, Heartburn, Indigestion... (10 player)"
        4578,
    },
    { -- Portal Jockey (10 player)
        4579,
    },
    { -- All You Can Eat (10 player)
        4580,
    },
    { -- Neck-Deep in Vile (10 player)
        4581,
    },
    { -- The Orb Whisperer (10 player)
        4582,
    },
    { -- Bane of the Fallen King
        4583,
    },
    { -- The Light of Dawn
        4584,
    },
    { -- The Sword in the Skull
        4596,
    },
    { -- The Frozen Throne (25 player)
        4597,
    },
    { -- The Ashen Verdict
        4598,
    },
    { -- Wrathful Gladiator
        4599,
        {
            IsPvP = true,
        },
    },
    { -- Wrathful Gladiator's Frost Wyrm
        4600,
        {
            IsPvP = true,
        },
    },
    { -- Been Waiting a Long Time for This (10 player)
        4601,
    },
    { -- Glory of the Icecrown Raider (10 player)
        4602,
    },
    { -- Glory of the Icecrown Raider (25 player)
        4603,
    },
    { -- Storming the Citadel (25 player)
        4604,
    },
    { -- The Plagueworks (25 player)
        4605,
    },
    { -- The Crimson Hall (25 player)
        4606,
    },
    { -- The Frostwing Halls (25 player)
        4607,
    },
    { -- Fall of the Lich King (25 player)
        4608,
    },
    { -- Boned (25 player)
        4610,
    },
    { -- Full House (25 player)
        4611,
    },
    { -- I'm on a Boat (25 player)
        4612,
    },
    { -- I've Gone and Made a Mess (25 player)
        4613,
    },
    { -- Dances with Oozes (25 player)
        4614,
    },
    { -- Flu Shot Shortage (25 player)
        4615,
    },
    { -- "Nausea, Heartburn, Indigestion... (25 player)"
        4616,
    },
    { -- The Orb Whisperer (25 player)
        4617,
    },
    { -- "Once Bitten, Twice Shy (25 player)"
        4618,
    },
    { -- Portal Jockey (25 player)
        4619,
    },
    { -- All You Can Eat (25 player)
        4620,
    },
    { -- Been Waiting a Long Time for This (25 player)
        4621,
    },
    { -- Neck-Deep in Vile (25 player)
        4622,
    },
    { -- Shadowmourne
        4623,
    },
    { -- Tough Love
        4624,
    },
    { -- Invincible's Reins
        4625,
    },
    { -- And I'll Form the Head!
        4626,
    },
    { -- X-45 Heartbreaker
        4627,
    },
    { -- Heroic: Storming the Citadel (10 player)
        4628,
    },
    { -- Heroic: The Plagueworks (10 player)
        4629,
    },
    { -- Heroic: The Crimson Hall (10 player)
        4630,
    },
    { -- Heroic: The Frostwing Halls (10 player)
        4631,
    },
    { -- Heroic: Storming the Citadel (25 player)
        4632,
    },
    { -- Heroic: The Plagueworks (25 player)
        4633,
    },
    { -- Heroic: The Crimson Hall (25 player)
        4634,
    },
    { -- Heroic: The Frostwing Halls (25 player)
        4635,
    },
    { -- Heroic: Fall of the Lich King (10 player)
        4636,
    },
    { -- Heroic: Fall of the Lich King (25 player)
        4637,
    },
    {KrowiAF.SetAchievementPatch, 3, 3, 0}, -- Rework loading so this can go to the top, future me problem
};