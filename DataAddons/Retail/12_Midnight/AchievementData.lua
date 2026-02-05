local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = KrowiAF.Enum.Faction;
local rewardType = KrowiAF.Enum.RewardType;

KrowiAF.AchievementData["12_00_00"] = {
    {KrowiAF.SetAchievementPatch, 12, 0, 0},
    {41287}, -- Windrunner Spire
    {41288}, -- Heroic: Windrunner Spire
    {41291}, -- Mythic: Windrunner Spire
    {41802}, -- Eversong In Reprise
    { -- For Zul'Aman! (Customization Reward: Amani Appearances for Darkspear Troll)
        41803,
        {
            RewardType = rewardType.Other,
        },
    },
    {41804}, -- One Does Not Simply Walk Into Harandar
    {41805}, -- Arator's Journey
    {41806}, -- Breaching the Voidstorm
    {41960}, -- Murder Row
    {41961}, -- Heroic: Murder Row
    {41962}, -- Mythic: Murder Row
    {42045}, -- Midnight
    {42117}, -- The War of Light and Shadow
    {42278}, -- The Empty Cradle
    { -- Abundance: Azeroth Runs on Dundun (Reward: Unlock Dundun's Abundant Travel Method for purchase.)
        42283,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Two Minutes to Midnight (Title: Thorn of Twilight and Mount: Light-Forged Mechsuit)
        42300,
        {
            RewardType = {rewardType.Title, rewardType.Mount},
            {"Before", "Version", {12, 0, 1}},
        },
    },
    { -- One Warband Mentor: Midnight (Reward: 5% additional experience up to level 90)
        42328,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Two Warband Mentors: Midnight (Reward: 10% additional experience up to level 90)
        42329,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Three Warband Mentors: Midnight (Reward: 15% additional experience up to level 90)
        42330,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Four Warband Mentors: Midnight (Reward: 20% additional experience up to level 90)
        42331,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Five Warband Mentors: Midnight (Reward: 25% additional experience up to level 90)
        42332,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Explore Highmountain (Bronze Cache)
        42528,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Eredath (Bronze Cache)
        42535,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Antoran Wastes (Bronze Cache)
        42560,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Val'Sharah (Bronze Cache)
        42573,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Antoran Wastes (Bronze Cache)
        42575,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Suramar (Bronze Cache)
        42577,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Highmountain (Bronze Cache)
        42579,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Val'Sharah (Bronze Cache)
        42580,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Krokuun (Bronze Cache)
        42588,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Krokuun (Bronze Cache)
        42591,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Stormheim (Bronze Cache)
        42606,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Stormheim (Bronze Cache)
        42608,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Krokuun (Bronze Cache)
        42620,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Eredath (Bronze Cache)
        42626,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Antoran Wastes (Bronze Cache)
        42631,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Highmountain (Bronze Cache)
        42634,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Stormheim (Bronze Cache)
        42640,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Eredath (Bronze Cache)
        42646,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Elusive Foes: Suramar (Bronze Cache)
        42650,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Explore Suramar (Bronze Cache)
        42665,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    { -- Hidden Treasures: Val'Sharah (Bronze Cache)
        42668,
        {
            RewardType = rewardType.RemixBronze,
            {"Event", 1640},
        },
    },
    {42701}, -- Prey: Normal Mode III
    {42702}, -- Prey: Hard Mode III
    { -- Prey: Nightmare Mode III (Mount: Preyseeker's Nightmare)
        42703,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Veteran of the Dawn (Character Unlock: Trade Veteran for Champion Dawncrests)
        42767,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 16},
        },
    },
    { -- Champion of the Dawn (Character Unlock: Trade Champion for Hero Dawncrests)
        42768,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 16},
        },
    },
    { -- Hero of the Dawn (Character Unlock: Trade Hero for Myth Dawncrests)
        42769,
        {
            RewardType = rewardType.Other,
            {"PvE Season", 16},
        },
    },
    { -- Myth of the Dawn
        42770,
        {
            {"PvE Season", 16},
        },
    },
    { -- Leatherworking at Midnight (Decor Reward: Midnight Leatherworker's Shop Sign)
        42786,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Enchanting at Midnight (Decor Reward: Midnight Enchanter's Shop Sign)
        42787,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- 3
        42788,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Jewelcrafting at Midnight (Decor Reward: Midnight Jewelcrafter's Shop Sign)
        42789,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Skinning at Midnight (Decor Reward: Midnight Skinner's Shop Sign)
        42790,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Mining at Midnight (Decor Reward: Midnight Miner's Shop Sign)
        42791,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Blacksmithing at Midnight (Decor Reward: Midnight Blacksmith's Shop Sign)
        42792,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Herbalism at Midnight (Decor Reward: Midnight Herbalist's Shop Sign)
        42793,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Tailoring at Midnight (Decor Reward: Midnight Tailor's Shop Sign)
        42794,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Cooking at Midnight (Decor Reward: Midnight Cook's Shop Sign)
        42795,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Inscribing at Midnight (Decor Reward: Midnight Scribe's Shop Sign)
        42796,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Fishing at Midnight (Decor Reward: Midnight Fisher's Shop Sign)
        42797,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Engineering at Midnight (Decor Reward: Midnight Engineer's Shop Sign)
        42798,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    {60888}, -- Pushing My Buttons
    {60891}, -- The Crimson Rogue
    {60942}, -- Aquatic Battler of Northrend
    {60943}, -- Critter Battler of Northrend
    {60944}, -- Dragonkin Battler of Northrend
    {60948}, -- Elemental Battler of Northrend
    {60949}, -- Flying Battler of Northrend
    {60950}, -- Humanoid Battler of Northrend
    {60951}, -- Beast Battler of Northrend
    {60952}, -- Magic Battler of Northrend
    {60953}, -- Mechanical Battler of Northrend
    {60954}, -- Undead Battler of Northrend
    { -- Family Battler of Northrend (Pet: Webbers)
        60956,
        {
            RewardType = rewardType.Pet,
        },
    },
    {61028}, -- Undead Battler of Eastern Kingdoms
    {61029}, -- Aquatic Battler of Eastern Kingdoms
    {61030}, -- Beast Battler of Eastern Kingdoms
    {61031}, -- Critter Battler of Eastern Kingdoms
    {61032}, -- Dragonkin Battler of Eastern Kingdoms
    {61033}, -- Elemental Battler of Eastern Kingdoms
    {61034}, -- Flying Battler of Eastern Kingdoms
    {61035}, -- Humanoid Battler of Eastern Kingdoms
    {61036}, -- Magic Battler of Eastern Kingdoms
    {61037}, -- Mechanical Battler of Eastern Kingdoms
    { -- Family Battler of Eastern Kingdoms (Pet: Byrn)
        61040,
        {
            RewardType = rewardType.Pet,
        },
    },
    {61041}, -- Aquatic Battler of Kalimdor
    {61042}, -- Beast Battler of Kalimdor
    {61043}, -- Critter Battler of Kalimdor
    {61044}, -- Dragonkin Battler of Kalimdor
    {61045}, -- Elemental Battler of Kalimdor
    {61046}, -- Flying Battler of Kalimdor
    {61047}, -- Humanoid Battler of Kalimdor
    {61048}, -- Magic Battler of Kalimdor
    {61049}, -- Mechanical Battler of Kalimdor
    {61050}, -- Undead Battler of Kalimdor
    { -- Family Battler of Kalimdor (Pet: Moon Darter)
        61051,
        {
            RewardType = rewardType.Pet,
        },
    },
    { -- Dust 'Em Off (Reward: Title: "Dustlord")
        61052,
        {
            RewardType = rewardType.Title,
        },
    },
    {61081}, -- Share a Drink
    {61082}, -- Old Soldiers
    {61083}, -- Highly Decorated
    { -- Midnight Safari (Pet: Do, child of Filo)
        61091,
        {
            RewardType = rewardType.Pet,
        },
    },
    { -- Old World Family Battler (Reward: Magical Pet Clicker)
        61094,
        {
            RewardType = rewardType.Toy,
        },
    },
    { -- Galactic Marshal: Midnight Season 1 (Character Title: Galactic Marshal)
        61177,
        faction.Alliance,
        61178,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Galactic Warlord: Midnight Season 1 (Character Title: Galactic Marshal)
        61178,
        faction.Horde,
        61177,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Galactic Legend: Midnight Season 1 (Character Title: Galactic Legend)
        61179,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Galactic Gladiator: Midnight Season 1 (Character Title: Galactic Gladiator)
        61180,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Combatant I: Midnight Season 1 (Seasonal Character Title: Combatant)
        61181,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Combatant II: Midnight Season 1
        61182,
        {
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Challenger I: Midnight Season 1 (Seasonal Character Title: Challenger)
        61183,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Challenger II: Midnight Season 1
        61184,
        {
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Rival I: Midnight Season 1 (Seasonal Character Title: Combatant)
        61185,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Rival II: Midnight Season 1
        61186,
        {
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Duelist: Midnight Season 1 (Seasonal Character Title: Duelist)
        61187,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Gladiator: Midnight Season 1 (Seasonal Character Title: Gladiator)
        61188,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Legend: Midnight Season 1 (Reward: Pennant & Seasonal Character Title)
        61190,
        {
            RewardType = {rewardType.Toy, rewardType.Title},
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Strategist: Midnight Season 1 (Reward: Pennant & Seasonal Character Title)
        61194,
        {
            RewardType = {rewardType.Toy, rewardType.Title},
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Hero of the Alliance: Galactic
        61195,
        faction.Alliance,
        61196,
        {
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Hero of the Horde: Galactic
        61196,
        faction.Horde,
        61195,
        {
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Elite: Midnight Season 1 (Seasonal Character Title: the Elite)
        61197,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Battle Mender: Midnight Season 1 (Reward: Seasonal Character Title)
        61198,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Solo Shuffle Medic: Midnight (Reward: Nightfall Legend's Pennant)
        61199,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Battleground Blitz Medic: Midnight (Reward: Nightfall Strategist's Pennant)
        61200,
        {
            RewardType = rewardType.Toy,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    {61212}, -- Magisters' Terrace
    {61213}, -- Heroic: Magisters' Terrace
    {61214}, -- Mythic: Magisters' Terrace
    {61219}, -- No Time to Paws
    {61221}, -- Tour of Duty: Eversong Woods
    {61222}, -- Tour of Duty: Zul'Aman
    {61223}, -- Tour of Duty: Harandar
    {61224}, -- Tour of Duty: Voidstorm
    { -- Investigating the Rise
        61225,
        {
            IsPvP = true,
        },
    },
    { -- Uprising
        61226,
        {
            IsPvP = true,
        },
    },
    { -- Entering the Void
        61227,
        {
            IsPvP = true,
        },
    },
    { -- Embracing the Void
        61228,
        {
            IsPvP = true,
        },
    },
    { -- Dedication in the Void
        61229,
        {
            IsPvP = true,
        },
    },
    { -- Remains in the Rise
        61230,
        {
            IsPvP = true,
        },
    },
    { -- Midnight Loot
        61231,
        {
            IsPvP = true,
        },
    },
    { -- Midnight Treasures
        61232,
        {
            IsPvP = true,
        },
    },
    { -- Midnight Season 1: Resilient Keystone 12 (Keystones will no longer deplete below level 12 during Midnight Season 1.)
        61233,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Hunt in the Night
        61234,
        {
            IsPvP = true,
        },
    },
    { -- Midnight Season 1: Resilient Keystone 13 (Keystones will no longer deplete below level 13 during Midnight Season 1.)
        61235,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 14 (Keystones will no longer deplete below level 14 during Midnight Season 1.)
        61236,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 15 (Keystones will no longer deplete below level 15 during Midnight Season 1.)
        61237,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Hunter
        61238,
        {
            IsPvP = true,
        },
    },
    { -- Midnight Season 1: Resilient Keystone 16 (Keystones will no longer deplete below level 16 during Midnight Season 1.)
        61239,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 17 (Keystones will no longer deplete below level 17 during Midnight Season 1.)
        61240,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 18 (Keystones will no longer deplete below level 18 during Midnight Season 1.)
        61241,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 19 (Keystones will no longer deplete below level 19 during Midnight Season 1.)
        61242,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 20 (Keystones will no longer deplete below level 20 during Midnight Season 1.)
        61243,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 21 (Keystones will no longer deplete below level 21 during Midnight Season 1.)
        61244,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 22 (Keystones will no longer deplete below level 22 during Midnight Season 1.)
        61245,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 23 (Keystones will no longer deplete below level 23 during Midnight Season 1.)
        61246,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 24 (Keystones will no longer deplete below level 24 during Midnight Season 1.)
        61247,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 25 (Keystones will no longer deplete below level 25 during Midnight Season 1.)
        61248,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 26 (Keystones will no longer deplete below level 26 during Midnight Season 1.)
        61249,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 27 (Keystones will no longer deplete below level 27 during Midnight Season 1.)
        61250,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 28 (Keystones will no longer deplete below level 28 during Midnight Season 1.)
        61251,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 29 (Keystones will no longer deplete below level 29 during Midnight Season 1.)
        61252,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Season 1: Resilient Keystone 30 (Keystones will no longer deplete below level 30 during Midnight Season 1.)
        61253,
        {
            RewardType = rewardType.KeystoneResilience,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Keystone Explorer: Season One
        61254,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Keystone Conqueror: Season One (Title: The Umbral)
        61255,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Keystone Master: Season One (Mount: Calamitous Carrion)
        61256,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Keystone Hero: Season One
        61257,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Keystone Legend: Season One (Mount: Convalescent Carrion)
        61258,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 16},
        },
    },
    { -- Umbral Hero: Midnight Season One (Title: The Umbral Hero)
        61259,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Windrunner Spire (Max Level Unlock: Teleport to Windrunner Spire)
        61262,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Treasures of Harandar (Reward: Brilliant Petalwing)
        61263,
        {
            RewardType = rewardType.Mount,
        },
    },
    {61264}, -- Leaf None Behind
    { -- Spectral Capture
        61265,
        {
            IsPvP = true,
        },
    },
    { -- Spectral Stocker
        61266,
        {
            IsPvP = true,
        },
    },
    { -- Keystone Hero: Magisters' Terrace (Max Level Unlock: Teleport to Magisters' Terrace)
        61267,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Nexus-Point Xenas (Max Level Unlock: Teleport to Nexus-Point Xenas)
        61268,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Maisara Caverns (Max Level Unlock: Teleport to Maisara Caverns)
        61269,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Seat of the Triumvirate (Max Level Unlock: Teleport to Seat of the Triumvirate)
        61270,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Pit of Saron (Max Level Unlock: Teleport to Pit of Saron)
        61271,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Keystone Hero: Skyreach (Max Level Unlock: Teleport to Skyreach)
        61272,
        {
            RewardType = rewardType.Teleport,
            {"PvE Season", 16},
        },
    },
    { -- Chronicler of the Haranir (Reward: Title: "Chronicler of the Haranir")
        61344,
        {
            RewardType = rewardType.Title,
        },
    },
    {61346}, -- We Will, In Fact, See It Again
    {61366}, -- The Voidspire
    {61367}, -- March on Quel'Danas
    {61368}, -- Heroic: The Voidspire
    {61369}, -- Heroic: March on Quel'Danas
    {61370}, -- Mythic: The Voidspire
    {61371}, -- Mythic: March on Quel'Danas
    {61372}, -- Mythic: Imperator Averzian
    {61373}, -- Mythic: Vorasius
    {61374}, -- Mythic: Fallen-King Salhadaar
    {61375}, -- Mythic: Vaelgor & Ezzorak
    {61376}, -- Mythic: Lightblinded Vanguard
    { -- Mythic: Crown of the Cosmos (Title: Spirebane)
        61377,
        {
            RewardType = rewardType.Title,
        },
    },
    {61378}, -- Mythic: Belo'ren, Child of Al'ar
    { -- Mythic: Midnight Falls (Title: Dawnbringer)
        61379,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
        61380,
        {
            RewardType = rewardType.Mount,
        },
    },
    {61381}, -- Eggsistential Crisis
    {61386}, -- Prey: Normal Mode II
    {61387}, -- Prey: Normal Mode I
    {61388}, -- Prey: Hard Mode II
    {61389}, -- Prey: Hard Mode I
    {61391}, -- Prey: Nightmare Mode II
    {61392}, -- Prey: Nightmare Mode I
    { -- Crunching for Cultists
        61430,
        {
            {"Before", "Version", {12, 0, 1}},
        },
    },
    {61438}, -- Thalassian Profession Master
    {61439}, -- Thalassian Artisan
    { -- Thalassian Polymath (Reward: Finery Funds)
        61440,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61441}, -- Working WAY Past Midnight
    { -- Galactic Weapons of Conquest (Item Reward: Galactic Gladiator's Weapon Token (x2))
        61443,
        {
            RewardType = rewardType.Transmog,
            IsPvP = true,
            {"PvP Season", 41},
        },
    },
    { -- Slayer's Mastery (Title: Voidslayer)
        61446,
        {
            RewardType = rewardType.Title,
            IsPvP = true,
        },
    },
    { -- Partake in the Rise
        61447,
        {
            IsPvP = true,
        },
    },
    { -- Frequent the Rise
        61448,
        {
            IsPvP = true,
        },
    },
    { -- Customary Rise
        61449,
        {
            IsPvP = true,
        },
    },
    { -- Galactic Gladiator's Goredrake
        61450,
        {
            IsPvP = true,
        },
    },
    {61452}, -- Sojourner of Zul'Aman
    {61453}, -- Making an Amani Out of You
    {61454}, -- Falling Between The Quacks
    {61455}, -- Shadowpine Scattered
    { -- Spark in the Night
        61464,
        {
            IsPvP = true,
        },
    },
    { -- Spark in the Night
        61465,
        {
            IsPvP = true,
        },
    },
    {61487}, -- Chimaerus, the Undreamt God
    {61488}, -- Heroic: Chimaerus, the Undreamt God
    { -- Mythic: Chimaerus, the Undreamt God (Title: Dream-Eater)
        61489,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Midnight Season 1: Champion of the Dawn (Item Reward: Crystallized Dawnlight Manaflux)
        61490,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61491}, -- Ahead of the Curve: Chimaerus, the Undreamt God
    {61492}, -- Cutting Edge: Chimaerus, the Undreamt God
    { -- Allied Race: Haranir (Reward: Haranir Race Unlocked)
        61506,
        {
            RewardType = rewardType.AlliedRace,
        },
    },
    {61507}, -- A Bloody Song
    {61508}, -- Voidscar Arena
    {61509}, -- Heroic: Voidscar Arena
    {61510}, -- Mythic: Voidscar Arena
    {61514}, -- It's Treason Then
    { -- Midnight Season 1: Catalyst Unbound (Reward: Dawnlight Manaflux can drop from additional sources.)
        61519,
        {
            RewardType = rewardType.Transmog,
            {"PvE Season", 16},
        },
    },
    {61520}, -- Explore Harandar
    { -- War Within Dungeon Hero (Pet: Moss Skipper)
        61565,
        {
            RewardType = rewardType.Pet,
        },
    },
    {61566}, -- Glory of the War Within Hero
    { -- Midnight Dungeon Hero (Pet: Niblet)
        61567,
        {
            RewardType = rewardType.Pet,
        },
    },
    {61568}, -- Glory of the Midnight Hero
    { -- Legends Never Die (Decor Reward: "On'ohia's Call")
        61574,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    {61576}, -- Eversong Woods Glyph Hunter
    {61581}, -- Zul'Aman Glyph Hunter
    {61582}, -- Harandar Glyph Hunter
    {61583}, -- Voidstorm Glyph Hunter
    {61584}, -- Midnight Glyph Hunter
    {61585}, -- You Conduit!
    { -- Galactic Gala
        61586,
        {
            IsPvP = true,
        },
    },
    { -- Keystone Victor: Magisters' Terrace (Midnight)
        61587,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Maisara Caverns
        61588,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Nexus-Point Xenas
        61589,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Windrunner Spire
        61590,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Algeth'ar Academy
        61591,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Pit of Saron
        61592,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Seat of the Triumvirate
        61593,
        {
            {"PvE Season", 16},
        },
    },
    { -- Keystone Victor: Skyreach
        61594,
        {
            {"PvE Season", 16},
        },
    },
    {61624}, -- Ahead of the Curve: Crown of the Cosmos
    {61625}, -- Cutting Edge: Crown of the Cosmos
    {61626}, -- Ahead of the Curve: Midnight Falls
    {61627}, -- Cutting Edge: Midnight Falls
    {61635}, -- Voidspire: Weapons of the Void
    {61636}, -- Voidspire: Fanatics of the Light
    {61637}, -- Voidspire: Crown of the Cosmos
    {61638}, -- Den of Nalorakk
    {61639}, -- Maisara Caverns
    {61640}, -- Nexus-Point Xenas
    {61641}, -- The Blinding Vale
    {61642}, -- Heroic: Den of Nalorakk
    {61643}, -- Mythic: Den of Nalorakk
    {61644}, -- Heroic: Maisara Caverns
    {61645}, -- Mythic: Maisara Caverns
    {61646}, -- Heroic: Nexus-Point Xenas
    {61647}, -- Mythic: Nexus-Point Xenas
    {61648}, -- Heroic: The Blinding Vale
    {61649}, -- Mythic: The Blinding Vale
    {61678}, -- Midnight Superior
    {61679}, -- Midnight Epic
    { -- Abundance: You Should See Him in a Crown (Reward: The Loa of Abundance gains a crown.)
        61681,
        {
            RewardType = rewardType.Other,
        },
    },
    {61706}, -- Herald of the Goddess
    {61707}, -- Delver of the Depths: Midnight
    {61708}, -- Delver of the Depths II: Midnight
    {61709}, -- Delver of the Depths III: Midnight
    {61710}, -- Delver of the Depths IV: Midnight
    {61711}, -- Midnight Delver Damage Dealer
    {61712}, -- Midnight Delver Damage Dealer II
    {61713}, -- Midnight Delver Damage Dealer III
    {61714}, -- Midnight Delver Healer
    {61715}, -- Midnight Delver Healer II
    {61716}, -- Midnight Delver Healer III
    {61717}, -- Midnight Delver Tank
    {61718}, -- Midnight Delver Tank II
    {61719}, -- Midnight Delver Tank III
    {61720}, -- Midnight Delver
    { -- Midnight Delver II (Reward: Finery Funds)
        61721,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61722}, -- Curio Enthusiast: Midnight
    {61723}, -- Curio Fanatic: Midnight
    {61724}, -- The Grudge Pit Stories
    {61725}, -- Parhelion Plaza Stories
    {61726}, -- Collegiate Calamity Stories
    {61727}, -- The Shadow Enclave Stories
    {61728}, -- The Darkway Stories
    {61729}, -- Atal'Aman Stories
    {61730}, -- Twilight Crypts Stories
    {61731}, -- The Gulf of Memory Stories
    {61732}, -- Sunkiller Sanctum Stories
    {61733}, -- Shadowguard Point Stories
    {61734}, -- Midnight Delves: Endgame (Unlock: Tier 4 delves in Midnight)
    {61739}, -- Sojourner of Harandar
    {61741}, -- Delve Loremaster: Midnight
    { -- Midnight: Journey's End (Season 1)
        61796,
        {
            {"PvE Season", 16},
        },
    },
    { -- My Shady Nemesis (Reward: Nullaeus Domaneye)
        61797,
        {
            RewardType = rewardType.Transmog,
        },
    },
    { -- Lighting the Dark (Title: the Ominous)
        61798,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 16},
        },
    },
    { -- Let Me Solo Him: Nullaeus (Reward: Arcanovoid Construct)
        61799,
        {
            RewardType = rewardType.Mount,
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 4 (Season 1) (Unlock: Tier 5 delves in Midnight Season 1)
        61800,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 5 (Season 1) (Unlock: Tier 6 delves in Midnight Season 1)
        61801,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 6 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
        61802,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 7 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
        61803,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 8 (Season 1) (Unlock: Tier 9 delves in Midnight Season 1)
        61804,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 9 (Season 1) (Unlock: Tier 10 delves in Midnight Season 1)
        61805,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 10 (Season 1) (Unlock: Tier 11 delves in Midnight Season 1)
        61806,
        {
            {"PvE Season", 16},
        },
    },
    { -- Midnight Delves: Tier 11 (Season 1) (Title: High Explorer)
        61807,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 16},
        },
    },
    { -- Fabled Let Me Solo Him: Nullaeus (Title: Fabled Vanquisher of Nullaeus)
        61808,
        {
            RewardType = rewardType.Title,
            {"PvE Season", 16},
        },
    },
    { -- Adventurer of the Dawn (Character Unlock: Trade Adventurer for Veteran Dawncrests)
        61809,
        {
            {"PvE Season", 16},
        },
    },
    {61832}, -- Midnight Delves: Tier 1 (Unlock: Tier 2 delves in Midnight)
    {61835}, -- Midnight Delves: Tier 2 (Unlock: Tier 3 delves in Midnight)
    {61836}, -- Midnight Delves: Tier 3
    { -- Midnight Pathfinder (Reward: Steady Flight unlocked within Midnight, Finery Funds)
        61839,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61843}, -- Quel'Dressed
    {61854}, -- The Midnight Explorer
    {61855}, -- Explore Eversong Woods
    {61856}, -- Explore Zul'Aman
    {61857}, -- Explore Voidstorm
    { -- Light of the Party (Reward: Gleaming Sunmote)
        61858,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61859}, -- Midnight Flight Master
    {61860}, -- From The Cradle to the Grave
    {61861}, -- Oh, No You Don't!
    {61863}, -- Atal'Aman Discoveries
    {61864}, -- Sojourner of Voidstorm
    {61892}, -- The Shadow Enclave Discoveries
    {61893}, -- Parhelion Plaza Discoveries
    {61894}, -- Collegiate Calamity Discoveries
    {61895}, -- The Darkway Discoveries
    {61896}, -- Twilight Crypts Discoveries
    {61897}, -- The Grudge Pit Discoveries
    {61898}, -- The Gulf of Memory Discoveries
    {61899}, -- Sunkiller Sanctum Discoveries
    {61900}, -- Shadowguard Point Discoveries
    { -- Midnight: Leave No Treasure Unfound (Title: Treasure Seeker)
        61901,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Glory of the Midnight Delver (Mount: Giganto Manis)
        61906,
        {
            RewardType = rewardType.Mount,
        },
    },
    {61910}, -- Mrglgrgl of Grglmrgl
    {61911}, -- Ready, Set, Snap!
    {61912}, -- Anchoring the Defense
    {61913}, -- A Singular Problem
    { -- Rage of the Ren'dorei (Reward: Void Elf Demon Hunter Unlocked)
        61916,
        {
            RewardType = rewardType.Other,
        },
    },
    {61917}, -- "Hold aggro, I got this"
    {61922}, -- Ninety Percent is Good Enough
    {61936}, -- Aura Farming
    {61937}, -- Abundance: Artisan of Mausoloa
    {61938}, -- Abundance: Artisan of Loaknit
    {61939}, -- Abundance: Artisan of Floaret
    {61940}, -- Abundance: Artisan of Loanite
    {61941}, -- Abundance: Acolyte of a Glorious Entity
    { -- Heritage of the Haranir (Reward: Haranir Heritage Armor)
        61942,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {61943}, -- Abundance: Prosperous Plentitude!
    { -- Putting in the Practice
        61953,
        {
            IsPvP = true,
        },
    },
    { -- Putting in the Practice
        61954,
        {
            IsPvP = true,
        },
    },
    { -- Putting in the Practice
        61955,
        {
            IsPvP = true,
        },
    },
    { -- Putting in the Practice
        61956,
        {
            IsPvP = true,
        },
    },
    {61957}, -- Sojourner of Eversong Woods
    { -- Focused Target
        61958,
        faction.Alliance,
        61959,
        {
            IsPvP = true,
        },
    },
    { -- Focused Target
        61959,
        faction.Horde,
        61958,
        {
            IsPvP = true,
        },
    },
    {61960}, -- Treasures of Eversong Woods
    {61961}, -- Runestone Rush
    {62057}, -- Midnight: The Highest Peaks
    {62058}, -- Hungry Hungry Hatchlings
    { -- Insurmountable Collection (Mount: Anu'shalla, Shadow's Guidance)
        62096,
        faction.Horde,
        62103,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Insurmountable Collection (Mount: Anu'shalla, Shadow's Guidance)
        62103,
        faction.Alliance,
        62096,
        {
            RewardType = rewardType.Mount,
        },
    },
    {62104}, -- Midnight Lore Hunter
    {62105}, -- Lysikas Would Be Proud
    {62106}, -- The Only Winning Move Is Not To Play
    { -- Mandatory Training
        62107,
        {
            IsPvP = true,
        },
    },
    { -- Training with Patience
        62108,
        {
            IsPvP = true,
        },
    },
    { -- Training with Patience
        62109,
        {
            IsPvP = true,
        },
    },
    { -- Loremaster of Midnight (Reward: Finery Funds)
        62110,
        {
            RewardType = rewardType.Transmog,
        },
    },
    { -- Boots on the Ground: Arathi Basin
        62111,
        {
            IsPvP = true,
        },
    },
    { -- Boots on the Ground: Battle for Gilneas
        62112,
        {
            IsPvP = true,
        },
    },
    { -- Boots on the Ground: Silvershard Mines
        62113,
        {
            IsPvP = true,
        },
    },
    { -- Learning the Landscape: Arathi Basin
        62114,
        {
            IsPvP = true,
        },
    },
    { -- Learning the Landscape: Battle for Gilneas
        62115,
        {
            IsPvP = true,
        },
    },
    { -- Learning the Landscape: Silvershard Mines
        62116,
        {
            IsPvP = true,
        },
    },
    { -- Abyss Anglers: Boarhide Catch Sack (Reward: Unlock Boarhide Catch Sack for purchase)
        62117,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Amazardhide Catch Case (Reward: Unlock Amazardhide Catch Case for purchase)
        62118,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Loaknit-Woven Catch Satchel (Reward: Unlock Loaknit-Woven Catch Satchel for purchase)
        62119,
        {
            RewardType = rewardType.Other,
        },
    },
    {62120}, -- Altar of Blessings: The Penitent Troll
    {62121}, -- Altar of Blessings: Sacred Buffet Devotee
    {62122}, -- Tallest Tree in the Forest
    {62125}, -- Treasures of Zul'Aman
    {62126}, -- Treasures of Voidstorm
    {62130}, -- The Ultimate Predator
    {62133}, -- Thrill of the Chase
    { -- The Deadliest of Prey
        62134,
        {
            IsPvP = true,
        },
    },
    { -- Now It's A Party
        62135,
        {
            IsPvP = true,
        },
    },
    { -- I'm Good At What I Do
        62136,
        {
            IsPvP = true,
        },
    },
    {62137}, -- I'm Not Trapped In Here With You
    {62138}, -- You're Trapped In Here With Me
    {62139}, -- Midnight Hunter
    {62140}, -- Kitchen Nightmare
    {62141}, -- Look, I'm Just Trying To Fish Here
    {62142}, -- I Didn't Hear No Bell
    {62143}, -- Trapped In The Middle With You
    { -- Prey: Mad Magisters (Hard) (Decor Reward: Preyseeker's Magister Bust)
        62144,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Insane Inventors (Hard) (Decor Reward: Preyseeker's Tinker Bust)
        62153,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: A Different Kind of Void (Hard) (Decor Reward: Preyseeker's Ren'dorei Bust)
        62154,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Ethereal Assassins (Hard) (Decor Reward: Preyseeker's Ethereal Bust)
        62155,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Anger Management (Hard) (Decor Reward: Preyseeker's Breaker Bust)
        62156,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Sadistic Shamans (Hard) (Decor Reward: Preyseeker's Amani Bust)
        62157,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: The Fallen Farstriders (Hard) (Decor Reward: Preyseeker's Farstrider Bust)
        62158,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Bloody Green Thumbs (Hard) (Decor Reward: Preyseeker's Rutaani Bust)
        62159,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Blinded By The Light (Hard) (Decor Reward: Preyseeker's Vindicator Bust)
        62160,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Outsmarting the Schemers (Hard) (Decor Reward: Preyseeker's Consul Bust)
        62161,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Dominating the Void (Hard) (Decor Reward: Preyseeker's Executor Bust)
        62162,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Chasing Death (Hard) (Decor Reward: Preyseeker's Knight-Errant Bust)
        62163,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: No Rest for the Wretched (Hard) (Decor Reward: Preyseeker's Wretched Bust)
        62164,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: A Thorn in the Side (Hard) (Decor Reward: Preyseeker's Thornspeaker Bust)
        62165,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Breaking the Blade (Hard) (Decor Reward: Preyseeker's Twilight Bust)
        62166,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Mad Magisters (Nightmare) (Decor Reward: Preyseeker's Magister Effigy)
        62167,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Insane Inventors (Nightmare) (Decor Reward: Preyseeker's Tinker Effigy)
        62168,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: A Different Kind of Void (Nightmare) (Decor Reward: Preyseeker's Ren'dorei Effigy)
        62169,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Ethereal Assassins (Nightmare) (Decor Reward: Preyseeker's Ethereal Effigy)
        62173,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Anger Management (Nightmare) (Decor Reward: Preyseeker's Breaker Effigy)
        62174,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Sadistic Shamans (Nightmare) (Decor Reward: Preyseeker's Amani Effigy)
        62175,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: The Fallen Farstriders (Nightmare) (Decor Reward: Preyseeker's Farstrider Effigy)
        62176,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Bloody Green Thumbs (Nightmare) (Decor Reward: Preyseeker's Rutaani Effigy)
        62177,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Blinded By The Light (Nightmare) (Decor Reward: Preyseeker's Vindicator Effigy)
        62178,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Outsmarting the Schemers (Nightmare) (Decor Reward: Preyseeker's Consul Effigy)
        62179,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Dominating the Void (Nightmare) (Decor Reward: Preyseeker's Executor Effigy)
        62180,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Chasing Death (Nightmare) (Decor Reward: Preyseeker's Knight-Errant Effigy)
        62181,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: No Rest for the Wretched (Nightmare) (Decor Reward: Preyseeker's Wretched Effigy)
        62182,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: A Thorn in the Side (Nightmare) (Decor Reward: Preyseeker's Thornspeaker Effigy)
        62183,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Prey: Breaking the Blade Nightmare) (Decor Reward: Preyseeker's Twilight Effigy)
        62184,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Ever Painting (Decor Reward: Silvermoon Painter's Cushion)
        62185,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    {62186}, -- The Party Must Go On
    {62187}, -- Grand Magister's Sommelier
    {62188}, -- More Than Just Their Roots
    {62189}, -- Mind-Seeker
    {62190}, -- Life of the Party
    {62191}, -- Call of the Light
    { -- Midnight Diplomat (Reward: Finery Funds)
        62192,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {62193}, -- Midnight Dungeon Damage Dealer
    {62194}, -- Midnight Dungeon Healer
    {62195}, -- Midnight Dungeon Tank
    { -- Midnight Dungeoneer (Reward: Finery Funds)
        62196,
        {
            RewardType = rewardType.Transmog,
        },
    },
    {62199}, -- Put a Pin in It
    {62200}, -- Gnome Alone
    {62201}, -- The Frog and the Princesses
    {62202}, -- Spiritpaw Marathon
    {62206}, -- Midnight Delver III
    { -- Abyss Anglers: Reinforced Joints (Reward: Unlock Reinforced Joints for purchase)
        62207,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Depth Grease (Reward: Unlock Depth Grease for purchase)
        62208,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Pahk Trench Fins (Reward: Unlock Pahk Trench Fins for purchase)
        62209,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Depthdiver's Used Tank (Reward: Unlock Depthdiver's Used Tank for purchase)
        62210,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Fathom-Tested Tank (Reward: Unlock Fathom-Tested Tank for purchase)
        62211,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Nalorakk's Breath Tank (Reward: Unlock Nalorakk's Breath Tank for purchase)
        62212,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Shallows Net (Reward: Unlock Shallows Net for purchase)
        62213,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Triple-Thread Net (Reward: Unlock Triple-Thread Net for purchase)
        62214,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Heavy Harpoon Cannon (Reward: Unlock Heavy Harpoon Cannon for purchase)
        62215,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Hollowcore Harpoon Turret (Reward: Unlock Hollowcore Harpoon Turret for purchase)
        62216,
        {
            RewardType = rewardType.Other,
        },
    },
    { -- Abyss Anglers: Idol of the Depths (Reward: Unlock Idol of the Depths for purchase)
        62217,
        {
            RewardType = rewardType.Other,
        },
    },
    {62218}, -- Abyss Anglers: Even The Best
    {62219}, -- Abyss Anglers: No Sea Can Hold Me
    {62220}, -- Abyss Anglers: Proper Procedure
    {62221}, -- Abyss Anglers: Fresh Depth Tech
    {62222}, -- Abyss Anglers: The Amani Way
    {62223}, -- Alchemy-on-Demand
    {62232}, -- Blacksmithing-on-Demand
    {62233}, -- Enchanting-on-Demand
    {62234}, -- Engineering-on-Demand
    {62235}, -- Inscription-on-Demand
    {62236}, -- Jewelcrafting-on-Demand
    {62237}, -- Leatherworking-on-Demand
    {62238}, -- Tailoring-on-Demand
    { -- Dedicated to the Craft: Alchemy (Title: Thalassian Alchemist)
        62239,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Blacksmithing (Title: Thalassian Blacksmith)
        62240,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Enchanting (Title: Thalassian Enchanter)
        62241,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Engineering (Title: Thalassian Engineer)
        62242,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Inscription (Title: Thalassian Scribe)
        62243,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Jewelcrafting (Title: Thalassian Jewelcrafter)
        62244,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Leatherworking (Title: Thalassian Leatherworker)
        62245,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Tailoring (Title: Thalassian Tailor)
        62246,
        {
            RewardType = rewardType.Title,
        },
    },
    {62247}, -- Herbalism-on-Demand
    {62248}, -- Mining-on-Demand
    {62249}, -- Skinning-on-Demand
    { -- Dedicated to the Craft: Herbalism (Title: Thalassian Herbalist)
        62250,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Mining (Title: Thalassian Miner)
        62251,
        {
            RewardType = rewardType.Title,
        },
    },
    { -- Dedicated to the Craft: Skinning (Title: Thalassian Skinner)
        62252,
        {
            RewardType = rewardType.Title,
        },
    },
    {62256}, -- Yelling into the Voidstorm
    {62260}, -- That's Aln, Folks!
    {62261}, -- Forever Song
    {62262}, -- Silvermoon Court Champion
    {62263}, -- Amani Tribe Champion
    {62264}, -- Hara'ti Champion
    {62265}, -- The Singularity Champion
    { -- Abundance: An Acolyte no Longer (Reward: The Loa of Abundance gains a crown.)
        62266,
        {
            RewardType = rewardType.Other,
        },
    },
    {62267}, -- A Most Violent Loa
    { -- Abundance: Professionals Only (Reward: The Loa of Abundance gains a crown.)
        62268,
        {
            RewardType = rewardType.Other,
        },
    },
    {62269}, -- Altar of Blessings: Amani Curious
    {62270}, -- Altar of Blessings: One for Altar
    {62271}, -- Abyss Anglers: Trench Berserker
    {62272}, -- Abyss Anglers: Certified Depthdiver
    { -- It's Nearly Midnight (Decor Reward: Miniature Replica Dark Portal)
        62387,
        {
            RewardType = rewardType.HousingDecor,
            {"Before", "Version", {12, 0, 1}},
        },
    },
    { -- Echoes of Midnight (Midnight themed cross-promotional game rewards)
        62273,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Eversong Woods: The Highest Peaks (Decor Reward: "Eversong Lantern" Painting)
        62288,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Zul'Aman: The Highest Peaks (Decor Reward: Amani Spearhunter's Spit)
        62289,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Harandar: The Highest Peaks (Decor Reward: Fungarian Vine Fence)
        62290,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    { -- Voidstorm: The Highest Peaks (Decor Reward: Void Elf Weapon Rack)
        62291,
        {
            RewardType = rewardType.HousingDecor,
        },
    },
    {62324}, -- Abundance: Loa of all Trades
    {62325}, -- Abundance: Treasures Aplenty
    {62326}, -- Abundance: Golden Opportunities
    {62329}, -- Abundance: Squash the Competition
    {62330}, -- Abundance: One Bite at a Time
    {62331}, -- Abundance: Drops of Prosperity
    {62332}, -- Abundance: Dundun's Favored
    {62333}, -- Abundance: Harvester
    {62336}, -- Abundance: Contributer
    {62337}, -- Abundance: Professional
    {62338}, -- Abundance: Artisan
    {62339}, -- Abundance: Gambler
    {62340}, -- Abundance: Investor
    {62341}, -- Abundance: Ain't Dun Till It's Dun
    { -- Preying For Midnight (Title: Preyseeker)
        62351,
        {
            RewardType = rewardType.Title,
        },
    },
    {62352}, -- Nothing to See Here
    { -- Classically Trained Lumberjack (Reward: Mounted Lumber Harvesting in Classic Zones)
        62357,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Outlandish Lumberjack (Reward: Mounted Lumber Harvesting in Burning Crusade Zones)
        62358,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Wrathful Lumberjack (Reward: Mounted Lumber Harvesting in Wrath of the Lich King Zones)
        62359,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Cataclysmic Lumberjack (Reward: Mounted Lumber Harvesting in Cataclysm Zones)
        62360,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Mist-Shrouded Lumberjack (Reward: Mounted Lumber Harvesting in Mists of Pandaria Zones)
        62361,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Lumberjack Warlord (Reward: Mounted Lumber Harvesting in Warlords of Draenor Zones)
        62362,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Legion Lumberjack (Reward: Mounted Lumber Harvesting in Legion Zones)
        62363,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Azeroth's Lumberjack (Reward: Mounted Lumber Harvesting in Battle for Azeroth Zones)
        62364,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Shadowy Lumberjack (Reward: Mounted Lumber Harvesting in Shadowlands Zones)
        62365,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Draconic Lumberjack (Reward: Mounted Lumber Harvesting in Dragonflight Zones)
        62366,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- The Lumberjack Within (Reward: Mounted Lumber Harvesting in War Within Zones)
        62369,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    { -- Midnight Lumberjack (Reward: Mounted Lumber Harvesting in Midnight Zones)
        62370,
        {
            RewardType = rewardType.NotCategorized,
        },
    },
    {62371}, -- Couponing for Beginners
    {62373}, -- Coupon Collector
    {62374}, -- You Get The Best Deals Anywhere
    {62375}, -- Buying in Bulk
    {62376}, -- Extreme Couponing
    {62377}, -- A Fist Full of Coupons
    {62378}, -- A Few Coupons More
    {62383}, -- Gotta Hunt Them All
    { -- Staring Into The Void (Mount: Lab-grown Stormray)
        62385,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Light Up the Night (Mount: Brilliant Petalwing)
        62386,
        {
            RewardType = rewardType.Mount,
        },
    },
    { -- Illicit Rain: Five Stars (Toy: Feeling Fielder Mk. 7)
        62388,
        {
            RewardType = rewardType.Toy,
        },
    },
    {62400}, -- Craft Your World
    {62403}, -- 'Tis But A Scratch
    {62406}, -- All the Things She Said
};