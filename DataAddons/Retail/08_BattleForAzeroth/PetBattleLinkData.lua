local _, addon = ...;
local shared = addon.Data.PetBattleLinkData.Shared;
local sec, enc = shared.Section, shared.Encounter;

KrowiAF.PetBattleLinkData.BattleForAzeroth = {
    { -- Battle on Zandalar and Kul Tiras
        12936,
        sec .. "51",
        {
            {1, enc .. "712"}, -- Crab People
            {2, enc .. "707"}, -- This Little Piggy Has Sharp Tusks
            {3, enc .. "706"}, -- Automated Chaos
            {4, enc .. "711"}, -- Night Horrors
            {5, enc .. "710"}, -- Rogue Azerite
            {6, enc .. "709"}, -- What's the Buzz?
            {7, enc .. "705"}, -- Sea Creatures Are Weird
            {8, enc .. "704"}, -- Captured Evil
            {9, enc .. "701"}, -- Not So Bad Down Here
            {10, enc .. "702"}, -- Unbreakable
            {11, enc .. "699"}, -- That's a Big Carcass
            {12, enc .. "700"}, -- Strange Looking Dogs
            {13, enc .. "720"}, -- Marshdwellers
            {14, enc .. "719"}, -- Crawg in the Bog
            {15, enc .. "722"}, -- Pack Leader
            {16, enc .. "721"}, -- Accidental Dread
            {17, enc .. "724"}, -- Keeyo's Champions of Vol'dun
            {18, enc .. "727"}, -- Snakes on a Terrace
            {19, enc .. "726"}, -- What Do You Mean, Mind Controlling Plants?
            {20, enc .. "725"}, -- Desert Survivors
            {21, enc .. "717"}, -- Critters are Friends, Not Food
            {22, enc .. "714"}, -- Add More to the Collection
            {23, enc .. "716"}, -- You've Never Seen Jammer Upset
            {24, enc .. "715"}, -- Small Beginnings
        }
    },
    { -- Beast Mode
        13270,
        enc .. "939",
        {
            {1, enc .. "952"}, -- Captain Hermes
            {2, enc .. "946"}, -- Eddie Fixit
            {3, enc .. "951"}, -- Dilbert McClint
            {4, enc .. "950"}, -- Fizzie Sparkwhistle
            {5, enc .. "949"}, -- Michael Skarn
            {6, enc .. "945"}, -- Ellie Vern
            {7, enc .. "944"}, -- Leana Darkwind
            {8, enc .. "941"}, -- Kwint
            {9, enc .. "939"}, -- Delia Hanako
            {10, enc .. "940"}, -- Burly
            {11, enc .. "960"}, -- Lozu
            {12, enc .. "962"}, -- Grady Prett
            {13, enc .. "961"}, -- Korval Darkbeard
            {14, enc .. "964"}, -- Keeyo
            {15, enc .. "967"}, -- Sizzik
            {16, enc .. "965"}, -- Kusa
            {17, enc .. "957"}, -- Karaga
            {18, enc .. "954"}, -- Talia Sparkbrow
            {19, enc .. "955"}, -- Zujai
        }
    },
    { -- Critters With Huge Teeth
        13271,
        enc .. "849",
        {
            {1, enc .. "862"}, -- Captain Hermes
            {2, enc .. "856"}, -- Eddie Fixit
            {3, enc .. "861"}, -- Dilbert McClint
            {4, enc .. "860"}, -- Fizzie Sparkwhistle
            {5, enc .. "859"}, -- Michael Skarn
            {6, enc .. "855"}, -- Ellie Vern
            {7, enc .. "854"}, -- Leana Darkwind
            {8, enc .. "851"}, -- Kwint
            {9, enc .. "849"}, -- Delia Hanako
            {10, enc .. "850"}, -- Burly
            {11, enc .. "870"}, -- Lozu
            {12, enc .. "872"}, -- Grady Prett
            {13, enc .. "871"}, -- Korval Darkbeard
            {14, enc .. "874"}, -- Keeyo
            {15, enc .. "877"}, -- Sizzik
            {16, enc .. "875"}, -- Kusa
            {17, enc .. "867"}, -- Karaga
            {18, enc .. "864"}, -- Talia Sparkbrow
            {19, enc .. "865"}, -- Zujai
        }
    },
    { -- Dragons Make Everything Better
        13272,
        enc .. "759",
        {
            {1, enc .. "772"}, -- Captain Hermes
            {2, enc .. "766"}, -- Eddie Fixit
            {3, enc .. "771"}, -- Dilbert McClint
            {4, enc .. "770"}, -- Fizzie Sparkwhistle
            {5, enc .. "769"}, -- Michael Skarn
            {6, enc .. "765"}, -- Ellie Vern
            {7, enc .. "764"}, -- Leana Darkwind
            {8, enc .. "761"}, -- Kwint
            {9, enc .. "759"}, -- Delia Hanako
            {10, enc .. "760"}, -- Burly
            {11, enc .. "780"}, -- Lozu
            {12, enc .. "782"}, -- Grady Prett
            {13, enc .. "781"}, -- Korval Darkbeard
            {14, enc .. "784"}, -- Keeyo
            {15, enc .. "787"}, -- Sizzik
            {16, enc .. "785"}, -- Kusa
            {17, enc .. "777"}, -- Karaga
            {18, enc .. "774"}, -- Talia Sparkbrow
            {19, enc .. "775"}, -- Zujai
        }
    },
    { -- Element of Success
        13273,
        enc .. "909",
        {
            {1, enc .. "922"}, -- Captain Hermes
            {2, enc .. "916"}, -- Eddie Fixit
            {3, enc .. "921"}, -- Dilbert McClint
            {4, enc .. "920"}, -- Fizzie Sparkwhistle
            {5, enc .. "919"}, -- Michael Skarn
            {6, enc .. "915"}, -- Ellie Vern
            {7, enc .. "914"}, -- Leana Darkwind
            {8, enc .. "911"}, -- Kwint
            {9, enc .. "909"}, -- Delia Hanako
            {10, enc .. "910"}, -- Burly
            {11, enc .. "930"}, -- Lozu
            {12, enc .. "932"}, -- Grady Prett
            {13, enc .. "931"}, -- Korval Darkbeard
            {14, enc .. "934"}, -- Keeyo
            {15, enc .. "937"}, -- Sizzik
            {16, enc .. "935"}, -- Kusa
            {17, enc .. "927"}, -- Karaga
            {18, enc .. "924"}, -- Talia Sparkbrow
            {19, enc .. "925"}, -- Zujai
        }
    },
    { -- Fun With Flying
        13274,
        enc .. "789",
        {
            {1, enc .. "802"}, -- Captain Hermes
            {2, enc .. "796"}, -- Eddie Fixit
            {3, enc .. "801"}, -- Dilbert McClint
            {4, enc .. "800"}, -- Fizzie Sparkwhistle
            {5, enc .. "799"}, -- Michael Skarn
            {6, enc .. "795"}, -- Ellie Vern
            {7, enc .. "794"}, -- Leana Darkwind
            {8, enc .. "791"}, -- Kwint
            {9, enc .. "789"}, -- Delia Hanako
            {10, enc .. "790"}, -- Burly
            {11, enc .. "810"}, -- Lozu
            {12, enc .. "812"}, -- Grady Prett
            {13, enc .. "811"}, -- Korval Darkbeard
            {14, enc .. "814"}, -- Keeyo
            {15, enc .. "817"}, -- Sizzik
            {16, enc .. "815"}, -- Kusa
            {17, enc .. "807"}, -- Karaga
            {18, enc .. "804"}, -- Talia Sparkbrow
            {19, enc .. "805"}, -- Zujai
        }
    },
    { -- Magician's Secrets
        13275,
        enc .. "879",
        {
            {1, enc .. "892"}, -- Captain Hermes
            {2, enc .. "886"}, -- Eddie Fixit
            {3, enc .. "891"}, -- Dilbert McClint
            {4, enc .. "890"}, -- Fizzie Sparkwhistle
            {5, enc .. "889"}, -- Michael Skarn
            {6, enc .. "885"}, -- Ellie Vern
            {7, enc .. "884"}, -- Leana Darkwind
            {8, enc .. "881"}, -- Kwint
            {9, enc .. "879"}, -- Delia Hanako
            {10, enc .. "880"}, -- Burly
            {11, enc .. "900"}, -- Lozu
            {12, enc .. "902"}, -- Grady Prett
            {13, enc .. "901"}, -- Korval Darkbeard
            {14, enc .. "904"}, -- Keeyo
            {15, enc .. "907"}, -- Sizzik
            {16, enc .. "905"}, -- Kusa
            {17, enc .. "897"}, -- Karaga
            {18, enc .. "894"}, -- Talia Sparkbrow
            {19, enc .. "895"}, -- Zujai
        }
    },
    { -- Machine Learning
        13277,
        enc .. "999",
        {
            {1, enc .. "1012"}, -- Captain Hermes
            {2, enc .. "1006"}, -- Eddie Fixit
            {3, enc .. "1011"}, -- Dilbert McClint
            {4, enc .. "1010"}, -- Fizzie Sparkwhistle
            {5, enc .. "1009"}, -- Michael Skarn
            {6, enc .. "1005"}, -- Ellie Vern
            {7, enc .. "1004"}, -- Leana Darkwind
            {8, enc .. "1001"}, -- Kwint
            {9, enc .. "999"}, -- Delia Hanako
            {10, enc .. "1000"}, -- Burly
            {11, enc .. "1020"}, -- Lozu
            {12, enc .. "1022"}, -- Grady Prett
            {13, enc .. "1021"}, -- Korval Darkbeard
            {14, enc .. "1024"}, -- Keeyo
            {15, enc .. "1027"}, -- Sizzik
            {16, enc .. "1025"}, -- Kusa
            {17, enc .. "1017"}, -- Karaga
            {18, enc .. "1014"}, -- Talia Sparkbrow
            {19, enc .. "1015"}, -- Zujai
        }
    },
    { -- Not Quite Dead Yet
        13278,
        enc .. "819",
        {
            {1, enc .. "832"}, -- Captain Hermes
            {2, enc .. "826"}, -- Eddie Fixit
            {3, enc .. "831"}, -- Dilbert McClint
            {4, enc .. "830"}, -- Fizzie Sparkwhistle
            {5, enc .. "829"}, -- Michael Skarn
            {6, enc .. "825"}, -- Ellie Vern
            {7, enc .. "824"}, -- Leana Darkwind
            {8, enc .. "821"}, -- Kwint
            {9, enc .. "819"}, -- Delia Hanako
            {10, enc .. "820"}, -- Burly
            {11, enc .. "840"}, -- Lozu
            {12, enc .. "842"}, -- Grady Prett
            {13, enc .. "841"}, -- Korval Darkbeard
            {14, enc .. "844"}, -- Keeyo
            {15, enc .. "847"}, -- Sizzik
            {16, enc .. "845"}, -- Kusa
            {17, enc .. "837"}, -- Karaga
            {18, enc .. "834"}, -- Talia Sparkbrow
            {19, enc .. "835"}, -- Zujai
        }
    },
    { -- Family Battler
        13279,
        sec .. "54",
        {
            {1, 13280}, -- Hobbyist Aquarist
            {2, 13270}, -- Beast Mode
            {3, 13271}, -- Critters With Huge Teeth
            {4, 13272}, -- Dragons Make Everything Better
            {5, 13273}, -- Element of Success
            {6, 13274}, -- Fun With Flying
            {7, 13281}, -- Human Resources
            {8, 13275}, -- Magician's Secrets
            {9, 13277}, -- Machine Learning
            {10, 13278}, -- Not Quite Dead Yet
        }
    },
    { -- Hobbyist Aquarist
        13280,
        enc .. "969",
        {
            {1, enc .. "982"}, -- Captain Hermes
            {2, enc .. "976"}, -- Eddie Fixit
            {3, enc .. "981"}, -- Dilbert McClint
            {4, enc .. "980"}, -- Fizzie Sparkwhistle
            {5, enc .. "979"}, -- Michael Skarn
            {6, enc .. "975"}, -- Ellie Vern
            {7, enc .. "974"}, -- Leana Darkwind
            {8, enc .. "971"}, -- Kwint
            {9, enc .. "969"}, -- Delia Hanako
            {10, enc .. "970"}, -- Burly
            {11, enc .. "990"}, -- Lozu
            {12, enc .. "992"}, -- Grady Prett
            {13, enc .. "991"}, -- Korval Darkbeard
            {14, enc .. "994"}, -- Keeyo
            {15, enc .. "997"}, -- Sizzik
            {16, enc .. "995"}, -- Kusa
            {17, enc .. "987"}, -- Karaga
            {18, enc .. "984"}, -- Talia Sparkbrow
            {19, enc .. "985"}, -- Zujai
        }
    },
    { -- Human Resources
        13281,
        enc .. "729",
        {
            {1, enc .. "742"}, -- Captain Hermes
            {2, enc .. "736"}, -- Eddie Fixit
            {3, enc .. "741"}, -- Dilbert McClint
            {4, enc .. "740"}, -- Fizzie Sparkwhistle
            {5, enc .. "739"}, -- Michael Skarn
            {6, enc .. "735"}, -- Ellie Vern
            {7, enc .. "734"}, -- Leana Darkwind
            {8, enc .. "731"}, -- Kwint
            {9, enc .. "729"}, -- Delia Hanako
            {10, enc .. "730"}, -- Burly
            {11, enc .. "750"}, -- Lozu
            {12, enc .. "752"}, -- Grady Prett
            {13, enc .. "751"}, -- Korval Darkbeard
            {14, enc .. "754"}, -- Keeyo
            {15, enc .. "757"}, -- Sizzik
            {16, enc .. "755"}, -- Kusa
            {17, enc .. "747"}, -- Karaga
            {18, enc .. "744"}, -- Talia Sparkbrow
            {19, enc .. "745"}, -- Zujai
        }
    },
    { -- Mighty Minions of Mechagon
        13625,
        sec .. "61",
        {
            {1, enc .. "1095"}, -- Gnomefeaster
            {2, enc .. "1099"}, -- Sputtertube
            {3, enc .. "1096"}, -- Goldenbot XD
            {4, enc .. "1100"}, -- Unit 6
            {5, enc .. "1097"}, -- CK-9 Micro-Oppression Unit
            {6, enc .. "1101"}, -- Creakclank
            {7, enc .. "1098"}, -- Unit 35
            {8, enc .. "1114"}, -- Unit 17
        }
    },
    { -- Nautical Nuisances of Nazjatar
        13626,
        sec .. "62",
        {
            {1, enc .. "1102"}, -- Prince Wiggletail
            {2, enc .. "1108"}, -- Chomp
            {3, enc .. "1103"}, -- Silence
            {4, enc .. "1109"}, -- Shadowspike Lurker
            {5, enc .. "1104"}, -- Pearlhusk Crawler
            {6, enc .. "1110"}, -- Elderspawn of Nalaada
            {7, enc .. "1105"}, -- Ravenous Scalespawn
            {8, enc .. "1111"}, -- Mindshackle
            {9, enc .. "1106"}, -- Kelpstone
            {10, enc .. "1112"}, -- Voltgorger
            {11, enc .. "1107"}, -- Frenzied Knifefang
            {12, enc .. "1113"}, -- Giant Opaline Conch
        }
    },
    { -- Team Aquashock
        13695,
        sec .. "61",
        {
            {3, 13626}, -- Nautical Nuisances of Nazjatar
            {4, 13625}, -- Mighty Minions of Mechagon
        }
    },
};