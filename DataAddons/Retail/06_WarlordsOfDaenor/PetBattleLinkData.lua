local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.WarlordsOfDaenor = {
    { -- An Awfully Big Adventure
        9069,
        sec .. "12",
        {
            {1, enc .. "112"}, -- Aki the Chosen
            {2, enc .. "92"}, -- Ashlei
            {3, enc .. "122"}, -- Beegle Blastfuse
            {4, enc .. "86"}, -- Blingtron 4000
            {5, enc .. "130"}, -- Bloodknight Antari
            {6, enc .. "132"}, -- Bordin Steadyfist
            {7, enc .. "135"}, -- Brok
            {8, enc .. "106"}, -- Burning Pandaren Spirit
            {9, enc .. "82"}, -- Chen Stormstout
            {10, enc .. "117"}, -- Christoph VonFeasel
            {11, enc .. "105"}, -- Courageous Yon
            {12, enc .. "93"}, -- Cymre Brightblade
            {13, enc .. "89"}, -- Dr. Ion Goldbloom
            {14, enc .. "111"}, -- Farmer Nishi
            {15, enc .. "109"}, -- Flowing Pandaren Spirit
            {16, enc .. "94"}, -- Gargra
            {17, enc .. "139"}, -- Goz Banefury
            {18, enc .. "123"}, -- Gutretch
            {19, enc .. "113"}, -- Hyuna of the Shrines
            {20, enc .. "116"}, -- Jeremy Feasel
            {21, enc .. "90"}, -- Lorewalker Cho
            {22, enc .. "138"}, -- Lydia Accoste
            {23, enc .. "124"}, -- Major Payne
            {24, enc .. "110"}, -- Mo'ruk
            {25, enc .. "126"}, -- Morulu the Elder
            {26, enc .. "127"}, -- Narrok
            {27, enc .. "120"}, -- Nearly Headless Jacob
            {28, enc .. "129"}, -- Nicki Tinytech
            {29, enc .. "136"}, -- Obalis
            {30, enc .. "121"}, -- Okrut Dragonwaste
            {31, enc .. "128"}, -- Ras'an
            {32, enc .. "107"}, -- Seeker Zusshi
            {33, enc .. "84"}, -- Shademaster Kiryn
            {34, enc .. "134"}, -- Stone Cold Trixxy
            {35, enc .. "88"}, -- Sully "The Pickle" McLeary
            {36, enc .. "95"}, -- Taralune
            {37, enc .. "80"}, -- Taran Zhu
            {38, enc .. "96"}, -- Tarr the Terrible
            {39, enc .. "104"}, -- Thundering Pandaren Spirit
            {40, enc .. "97"}, -- Vesharr
            {41, enc .. "108"}, -- Wastewalker Shu
            {42, enc .. "114"}, -- Whispering Pandaren Spirit
            {43, enc .. "85"}, -- Wise Mari
            {44, enc .. "81"}, -- Wrathion
        }
    },
    { -- Taming Draenor
        9724,
        sec .. "5",
        {
            {1, enc .. "16"}, -- Ashlei
            {2, enc .. "17"}, -- Cymre Brightblade
            {3, enc .. "18"}, -- Gargra
            {4, enc .. "19"}, -- Taralune
            {5, enc .. "20"}, -- Tarr the Terrible
            {6, enc .. "21"}, -- Vesharr
        }
    },
    { -- Tiny Terrors in Tanaan
        10052,
        sec .. "9",
        {
            {1, enc .. "66"}, -- Felsworn Sentry
            {2, enc .. "65"}, -- Corrupted Thundertail
            {3, enc .. "67"}, -- Chaos Pup
            {4, enc .. "64"}, -- Cursed Spirit
            {5, enc .. "63"}, -- Felfly
            {6, enc .. "62"}, -- Tainted Maulclaw
            {7, enc .. "61"}, -- Direflame
            {8, enc .. "60"}, -- Mirecroak
            {9, enc .. "59"}, -- Dark Gazer
            {10, enc .. "58"}, -- Bleakclaw
            {11, enc .. "57"}, -- Vile Blood of Draenor
            {12, enc .. "56"}, -- Dreadwalker
            {13, enc .. "55"}, -- Netherfist
            {14, enc .. "54"}, -- Skrillix
            {15, enc .. "53"}, -- Defiled Earth
        }
    },
};