local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["10_00_02"] = {
    { -- Return to Darkness
        15640,
    },
    { -- To All the Squirrels Hidden Til Now
        16729,
    },
    { -- Crimson Gladiator's Drake
        16730,
        {
            IsPvP = true,
        },
    },
    { -- Crimson Legend: Dragonflight Season 1
        16734,
        {
            IsPvP = true,
        },
    },
    { -- Grand Theft Mammoth
        16736,
    },
    { -- "Ready, Aim, Catalog!"
        16758,
    },
    { -- The Obsidian Bloodline
        16760,
    },
    { -- Dragon Isles Explorer
        16761,
    },
    { -- The Vegetarian Diet
        16762,
    },
    { -- Crimson Carpet Fashion
        16764,
        {
            IsPvP = true,
        },
    },
    { -- Lucky Penny
        16789,
    },
    { -- Curious Coin
        16790,
    },
    { -- Merchant Artisan
        16791,
    },
    { -- Personal Crafter
        16799,
    },
    { -- Realm First! Dragonflight Keystone Hero
        16801,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Friend of the Dragon Isles
        16808,
    },
    { -- Friends in the Field
        16884,
    },
    { -- Friend of the Family
        16944,
    },
    { -- Friends in the Accord
        16994,
    },
    { -- Friends in the Plains
        17064,
    },
    { -- Ahead of the Curve: Raszageth the Storm-Eater
        17107,
    },
    { -- Cutting Edge: Raszageth the Storm-Eater
        17108,
    },
    { -- The Primal Bulwark
        17110,
    },
    { -- Caverns of Infusion
        17111,
    },
    { -- Fury of the Storm
        17112,
    },
    { -- Deep Cuts From the Vault
        17119,
    },
    { -- Heroic Edition: Tangled Dreamweaver
        17314,
    },
    { -- Legend: Dragonflight Season 1
        17339,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 10, 0, 2}, -- Rework loading so this can go to the top, future me problem
};