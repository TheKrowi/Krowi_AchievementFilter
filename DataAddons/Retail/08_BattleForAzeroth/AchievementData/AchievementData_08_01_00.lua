local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["08_01_00"] = {
    { -- Flying Colors
        13138,
    },
    { -- Meat Marauder
        13196,
    },
    { -- Combatant: Battle for Azeroth Season 1
        13199,
        {
            IsPvP = true,
        },
    },
    { -- Sinister Gladiator: Battle for Azeroth Season 2
        13200,
        {
            IsPvP = true,
        },
    },
    { -- Sinister Gladiator's Proto-Drake
        13202,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Battle for Azeroth Season 2
        13203,
        {
            IsPvP = true,
        },
    },
    { -- Combatant: Battle for Azeroth Season 2
        13204,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Battle for Azeroth Season 2
        13205,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Battle for Azeroth Season 2
        13209,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Sinister
        13210,
        faction.Alliance,
        13211,
        true,
    },
    { -- Hero of the Horde: Sinister
        13211,
        faction.Horde,
        13210,
        true,
    },
    { -- Gladiator: Battle for Azeroth Season 2
        13212,
        {
            IsPvP = true,
        },
    },
    { -- In Teldrassil's Shadow
        13251,
        faction.Alliance,
        13263,
    },
    { -- The Shadow Hunter
        13263,
        faction.Horde,
        13251,
    },
    { -- Pet Battle Challenge: Gnomeregan
        13269,
    },
    { -- Beast Mode
        13270,
    },
    { -- Critters With Huge Teeth
        13271,
    },
    { -- Dragons Make Everything Better
        13272,
    },
    { -- Element of Success
        13273,
    },
    { -- Fun With Flying
        13274,
    },
    { -- Magician's Secrets
        13275,
    },
    { -- Machine Learning
        13277,
    },
    { -- Not Quite Dead Yet
        13278,
    },
    { -- Family Battler
        13279,
    },
    { -- Hobbyist Aquarist
        13280,
    },
    { -- Human Resources
        13281,
    },
    { -- Frontline Warrior
        13283,
        faction.Alliance,
        13284,
    },
    { -- Frontline Warrior
        13284,
        faction.Horde,
        13283,
    },
    { -- Upright Citizens
        13285,
        faction.Alliance,
    },
    { -- Siege of Dazar'alor
        13286,
        faction.Alliance,
        13289,
    },
    { -- Empire's Fall
        13287,
        faction.Alliance,
        13290,
    },
    { -- Might of the Alliance
        13288,
        faction.Alliance,
        13291,
    },
    { -- Defense of Dazar'alor
        13289,
        faction.Horde,
        13286,
    },
    { -- Death's Bargain
        13290,
        faction.Horde,
        13287,
    },
    { -- Victory or Death
        13291,
        faction.Horde,
        13288,
    },
    { -- Mythic: Champion of the Light
        13292,
    },
    { -- Mythic: Grong
        13293,
    },
    { -- Loremaster of Zandalar
        13294,
        faction.Horde,
        12593,
    },
    { -- Mythic: Jadefire Masters
        13295,
        faction.Horde,
        13298,
    },
    { -- War for the Shore
        13296,
        faction.Horde,
        13297,
    },
    { -- War for the Shore
        13297,
        faction.Alliance,
        13296,
    },
    { -- Mythic: Jadefire Masters
        13298,
        faction.Alliance,
        13295,
    },
    { -- Mythic: Opulence
        13299,
    },
    { -- Mythic: Conclave of the Chosen
        13300,
    },
    { -- Under Cover of Darkness
        13301,
        faction.Horde,
        13302,
    },
    { -- Under Cover of Darkness
        13302,
        faction.Alliance,
        13301,
    },
    { -- Night Moves
        13305,
        faction.Alliance,
        13306,
    },
    { -- Night Moves
        13306,
        faction.Horde,
        13305,
    },
    { -- Recruitment Officer
        13307,
        faction.Horde,
        13308,
    },
    { -- Recruitment Officer
        13308,
        faction.Alliance,
        13307,
    },
    { -- Deforester
        13309,
        faction.Horde,
        13310,
    },
    { -- By Nature's Call
        13310,
        faction.Alliance,
        13309,
    },
    { -- Mythic: King Rastakhan
        13311,
    },
    { -- Mythic: Mekkatorque
        13312,
    },
    { -- Mythic: Stormwall Blockade
        13313,
    },
    { -- Mythic: Lady Jaina Proudmoore
        13314,
    },
    { -- Glory of the Dazar'alor Raider
        13315,
    },
    { -- Can I Get a Hek Hek Hek Yeah?
        13316,
    },
    { -- Supplied and Ready
        13317,
        {
            IsPvP = true,
        },
    },
    { -- Ahead of the Curve: Lady Jaina Proudmoore
        13322,
    },
    { -- Cutting Edge: Lady Jaina Proudmoore
        13323,
    },
    { -- Walk the Dinosaur
        13325,
    },
    { -- Praise the Sunflower
        13345,
    },
    { -- Barrel of Monkeys
        13383,
    },
    { -- Kul Tirans Don't Look at Explosions
        13384,
        faction.Alliance,
    },
    { -- Daz'aling Attire
        13385,
    },
    { -- Frontline Veteran
        13387,
        faction.Alliance,
        13388,
        true,
    },
    { -- Frontline Veteran
        13388,
        faction.Horde,
        13387,
        true,
    },
    { -- Jorundall
        13389,
    },
    { -- Heroic: Jorundall
        13394,
    },
    { -- Mythic: Jorundall
        13395,
    },
    { -- Havenswood
        13396,
    },
    { -- Heroic: Havenswood
        13397,
    },
    { -- Mythic: Havenswood
        13398,
    },
    { -- Jorundall Justice
        13399,
        {
            IsPvP = true,
        },
    },
    { -- Havenswood Hero
        13400,
        {
            IsPvP = true,
        },
    },
    { -- I Got Next!
        13401,
    },
    { -- Frontline Slayer
        13402,
        faction.Alliance,
        13403,
        true,
    },
    { -- Frontline Slayer
        13403,
        faction.Horde,
        13402,
        true,
    },
    { -- Snow Fun Allowed
        13410,
    },
    { -- Crucible of Storms
        13414,
    },
    { -- Mythic: The Restless Cabal
        13416,
    },
    { -- "Mythic: Uu'nat, Harbinger of the Void"
        13417,
    },
    { -- "Ahead of the Curve: Uu'nat, Harbinger of the Void"
        13418,
    },
    { -- "Cutting Edge: Uu'nat, Harbinger of the Void"
        13419,
    },
    { -- "We Got Spirit, How About You?"
        13425,
    },
    { -- Come On and Slam
        13426,
        faction.Alliance,
    },
    { -- Azerfighter
        13429,
        {
            IsPvP = true,
        },
    },
    { -- De Lurker Be'loa
        13430,
    },
    { -- Hidden Dragon
        13431,
    },
    { -- "Tall, Dark, and Sinister"
        13433,
    },
    { -- Doomsoul Surprise
        13435,
        faction.Horde,
    },
    { -- Scavenge like a Vulpera
        13437,
        faction.Horde,
    },
    { -- Boxing Match
        13438,
        faction.Horde,
        13439,
        true,
    },
    { -- Boxing Match
        13439,
        faction.Alliance,
        13438,
        true,
    },
    { -- Pushing the Payload
        13440,
        faction.Alliance,
        13441,
    },
    { -- Pushing the Payload
        13441,
        faction.Horde,
        13440,
    },
    { -- Battle for Azeroth Keystone Conqueror: Season Two
        13448,
    },
    { -- Battle for Azeroth Keystone Master: Season Two
        13449,
    },
    { -- Fierce Gladiator's Storm Dragon
        13450,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Battle for Azeroth Season 2
        13451,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 8, 1, 0}, -- Rework loading so this can go to the top, future me problem
};