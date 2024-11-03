local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_03_00"] = {
    {4516}, -- The Forge of Souls
    {4517}, -- The Pit of Saron
    {4518}, -- The Halls of Reflection
    {4519}, -- Heroic: The Forge of Souls
    {4520}, -- Heroic: The Pit of Saron
    {4521}, -- Heroic: The Halls of Reflection
    {4522}, -- Soul Power
    {4523}, -- Three Faced
    {4524}, -- Doesn't Go to Eleven
    {4525}, -- Don't Look Up
    {4526}, -- We're Not Retreating; We're Advancing in a Different Direction.
    {4527}, -- The Frostwing Halls (10 player)
    {4528}, -- The Plagueworks (10 player)
    {4529}, -- The Crimson Hall (10 player)
    {4530}, -- The Frozen Throne (10 player)
    {4531}, -- Storming the Citadel (10 player)
    {4532}, -- Fall of the Lich King (10 player)
    {4534}, -- Boned (10 player)
    {4535}, -- Full House (10 player)
    {4536}, -- I'm on a Boat (10 player)
    {4537}, -- I've Gone and Made a Mess (10 player)
    {4538}, -- Dances with Oozes (10 player)
    {4539}, -- "Once Bitten, Twice Shy (10 player)"
    { -- Realm First! Fall of the Lich King
        4576,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {4577}, -- Flu Shot Shortage (10 player)
    {4578}, -- "Nausea, Heartburn, Indigestion... (10 player)"
    {4579}, -- Portal Jockey (10 player)
    {4580}, -- All You Can Eat (10 player)
    {4581}, -- Neck-Deep in Vile (10 player)
    {4582}, -- The Orb Whisperer (10 player)
    {4583}, -- Bane of the Fallen King
    {4584}, -- The Light of Dawn
    {4596}, -- The Sword in the Skull
    {4597}, -- The Frozen Throne (25 player)
    {4598}, -- The Ashen Verdict
    { -- Wrathful Gladiator
        4599,
        {
            IsPvP = true,
            {"PvP Season", 8},
        },
    },
    { -- Wrathful Gladiator's Frost Wyrm
        4600,
        {
            IsPvP = true,
            {"PvP Season", 8},
        },
    },
    {4601}, -- Been Waiting a Long Time for This (10 player)
    {4602}, -- Glory of the Icecrown Raider (10 player)
    {4603}, -- Glory of the Icecrown Raider (25 player)
    {4604}, -- Storming the Citadel (25 player)
    {4605}, -- The Plagueworks (25 player)
    {4606}, -- The Crimson Hall (25 player)
    {4607}, -- The Frostwing Halls (25 player)
    {4608}, -- Fall of the Lich King (25 player)
    {4610}, -- Boned (25 player)
    {4611}, -- Full House (25 player)
    {4612}, -- I'm on a Boat (25 player)
    {4613}, -- I've Gone and Made a Mess (25 player)
    {4614}, -- Dances with Oozes (25 player)
    {4615}, -- Flu Shot Shortage (25 player)
    {4616}, -- "Nausea, Heartburn, Indigestion... (25 player)"
    {4617}, -- The Orb Whisperer (25 player)
    {4618}, -- "Once Bitten, Twice Shy (25 player)"
    {4619}, -- Portal Jockey (25 player)
    {4620}, -- All You Can Eat (25 player)
    {4621}, -- Been Waiting a Long Time for This (25 player)
    {4622}, -- Neck-Deep in Vile (25 player)
    {4623}, -- Shadowmourne
    { -- Tough Love
        4624,
        {
            {"Event", 423},
        },
    },
    {4625}, -- Invincible's Reins
    {4626}, -- And I'll Form the Head!
    {4627}, -- X-45 Heartbreaker
    {4628}, -- Heroic: Storming the Citadel (10 player)
    {4629}, -- Heroic: The Plagueworks (10 player)
    {4630}, -- Heroic: The Crimson Hall (10 player)
    {4631}, -- Heroic: The Frostwing Halls (10 player)
    {4632}, -- Heroic: Storming the Citadel (25 player)
    {4633}, -- Heroic: The Plagueworks (25 player)
    {4634}, -- Heroic: The Crimson Hall (25 player)
    {4635}, -- Heroic: The Frostwing Halls (25 player)
    {4636}, -- Heroic: Fall of the Lich King (10 player)
    {4637}, -- Heroic: Fall of the Lich King (25 player)
    {KrowiAF.SetAchievementPatch, 3, 3, 0}, -- Rework loading so this can go to the top, future me problem
};