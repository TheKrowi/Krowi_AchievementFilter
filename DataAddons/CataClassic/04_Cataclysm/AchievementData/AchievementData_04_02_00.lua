local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["04_02_00"] = {
    { -- Time Flies When You're Having Fun
        5794,
    },
    { -- Only the Penitent...
        5799,
    },
    { -- Firelands
        5802,
    },
    { -- Heroic: Ragnaros
        5803,
    },
    { -- Heroic: Majordomo Fandral Staghelm
        5804,
    },
    { -- Heroic: Baleroc
        5805,
    },
    { -- Heroic: Shannox
        5806,
    },
    { -- Heroic: Beth'tilac
        5807,
    },
    { -- Heroic: Lord Rhyolith
        5808,
    },
    { -- Heroic: Alysrazor
        5809,
    },
    { -- Not an Ambi-Turner
        5810,
    },
    { -- Do a Barrel Roll!
        5813,
    },
    { -- Death from Above
        5821,
    },
    { -- Veteran of the Alliance II
        5823,
        faction.Alliance,
        5824,
        true,
    },
    { -- Veteran of the Horde II
        5824,
        faction.Horde,
        5823,
        true,
    },
    { -- Avengers of Hyjal
        5827,
    },
    { -- Glory of the Firelands Raider
        5828,
    },
    { -- Bucket List
        5829,
    },
    { -- Share the Pain
        5830,
    },
    { -- Tricks and Treats of Northrend
        5835,
        faction.Horde,
        5836,
    },
    { -- Tricks and Treats of Northrend
        5836,
        faction.Alliance,
        5835,
    },
    { -- Tricks and Treats of the Cataclysm
        5837,
        faction.Alliance,
        5838,
    },
    { -- Tricks and Treats of the Cataclysm
        5838,
        faction.Horde,
        5837,
    },
    { -- "Dragonwrath, Tarecgosa's Rest"
        5839,
    },
    { -- Let's Do Lunch: Ironforge
        5841,
        faction.Alliance,
        5843,
    },
    { -- Let's Do Lunch: Darnassus
        5842,
        faction.Alliance,
        5844,
    },
    { -- Let's Do Lunch: Thunder Bluff
        5843,
        faction.Horde,
        5841,
    },
    { -- Let's Do Lunch: Undercity
        5844,
        faction.Horde,
        5842,
    },
    { -- A Bunch of Lunch
        5845,
        faction.Alliance,
    },
    { -- A Bunch of Lunch
        5846,
        faction.Horde,
    },
    { -- Fish or Cut Bait: Ironforge
        5847,
        faction.Alliance,
        5849,
    },
    { -- Fish or Cut Bait: Darnassus
        5848,
        faction.Alliance,
        5850,
    },
    { -- Fish or Cut Bait: Thunder Bluff
        5849,
        faction.Horde,
        5847,
    },
    { -- Fish or Cut Bait: Undercity
        5850,
        faction.Horde,
        5848,
    },
    { -- Gone Fishin'
        5851,
        faction.Alliance,
    },
    { -- Gone Fishin'
        5852,
        faction.Horde,
    },
    { -- Ragnar-O's
        5855,
    },
    { -- Bear-ly Made It
        5858,
    },
    { -- Legacy of Leyara
        5859,
    },
    { -- The 'Unbeatable?' Pterodactyl: BEATEN.
        5860,
    },
    { -- The Fiery Lords of Sethria's Roost
        5861,
    },
    { -- Ludicrous Speed
        5862,
    },
    { -- WoW's 7th Anniversary
        5863,
    },
    { -- Gang War
        5864,
    },
    { -- Have... Have We Met?
        5865,
    },
    { -- The Molten Front Offensive
        5866,
    },
    { -- Flawless Victory
        5867,
    },
    { -- And the Meek Shall Inherit Kalimdor
        5868,
    },
    { -- Infernal Ambassadors
        5869,
    },
    { -- Fireside Chat
        5870,
    },
    { -- Master of the Molten Flow
        5871,
    },
    { -- King of the Spider-Hill
        5872,
    },
    { -- Ready for Raiding II
        5873,
    },
    { -- Death From Above
        5874,
    },
    { -- Littlest Pet Shop
        5875,
    },
    { -- Petting Zoo
        5876,
    },
    { -- Menagerie
        5877,
    },
    { -- Veteran of the Molten Front
        5879,
    },
    {KrowiAF.SetAchievementPatch, 4, 2, 0}, -- Rework loading so this can go to the top, future me problem
};