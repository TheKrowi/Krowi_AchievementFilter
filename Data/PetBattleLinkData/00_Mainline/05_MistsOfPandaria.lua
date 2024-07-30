local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.MistsOfPandaria = {
    { -- Master of the Masters
        8518,
        sec .. "8",
        {
            {1, enc .. "42"}, -- Blingtron 4000
            {2, enc .. "38"}, -- Wrathion
            {3, enc .. "47"}, -- Loremaster Cho
            {4, enc .. "39"}, -- Chen Stormstout
            {5, enc .. "41"}, -- Wise Mari
            {6, enc .. "43"}, -- Shademaster Kiryn
            {7, enc .. "45"}, -- Sully "The Pickle" McLeary
            {8, enc .. "37"}, -- Taran Zhy
            {9, enc .. "46"}, -- Dr. Ion Goldbloom
            {10, enc .. "49"}, -- Xu-Fu, Cub of Xuen
            {11, enc .. "51"}, -- Chi-Chi, Hatchling of Chi-Ji
            {12, enc .. "52"}, -- Zao, Calfling of Niuzao
            {13, enc .. "50"}, -- Yu'la, Broodling of Yu'lon
        }
    },
    { -- The Celestial Tournament
        8410,
        sec .. "8"
    },
    { -- Fabled Pandaren Tamer
        8080,
        sec .. "10",
        {
            {enc .. "69", addon.L["Dos-Ryga"]}, -- Dos-Ryga
            {enc .. "70", addon.L["Kafi"]}, -- Kafi
            {enc .. "71", addon.L["Ti'un the Wanderer"]}, -- Ti'un the Wanderer
            {enc .. "72", addon.L["No-No"]}, -- No-No
            {enc .. "73", addon.L["Gorespine"]}, -- Gorespine
            {enc .. "74", addon.L["Skitterer Xi'a"]}, -- Skitterer Xi'a
            {enc .. "75", addon.L["Greyhoof"]}, -- Greyhoof
            {enc .. "76", addon.L["Lucky Yi"]}, -- Lucky Yi
            {enc .. "77", addon .L["Ka'wi the Gorger"]}, -- Ka'wi the Gorger
            {enc .. "78", addon.L["Nitun"]}, -- Nitun
        }
    },
    { -- Pandaren Spirit Tamer
        7936,
        sec .. "6",
        {
            {enc .. "26", addon.L["Burning Pandaren Spirit"]}, -- Burning Pandaren Spirit
            {enc .. "27", addon.L["Flowing Pandaren Spirit"]}, -- Flowing Pandaren Spirit
            {enc .. "24", addon.L["Thundering Pandaren Spirit"]}, -- Thundering Pandaren Spirit
            {enc .. "25", addon.L["Whispering Pandaren Spirit"]}, -- Whispering Pandaren Spirit
        }
    },
    { -- I Choose You
        7908,
        enc .. "33"
    },
    { -- Taming Pandaria
        6606,
        sec .. "3",
        {
            {1, enc .. "36"}, -- Hyuna of the Shrines
            {2, enc .. "31"}, -- Farmer Nishi
            {3, enc .. "68"}, -- Mo'ruk
            {4, enc .. "32"}, -- Courages Yon
            {5, enc .. "35"}, -- Seeker Zusshi
            {6, enc .. "34"}, -- Wastewalker Shu
            {7, enc .. "33"}, -- Aki the Chosen
        }
    },
};