local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local delves = {
    shared.CrossExpansionDelves,
    61832, -- Midnight Delves: Tier 1 (Unlock: Tier 2 delves in Midnight)
    61835, -- Midnight Delves: Tier 2 (Unlock: Tier 3 delves in Midnight)
    61836, -- Midnight Delves: Tier 3
    61734, -- Midnight Delves: Endgame (Unlock: Tier 4 delves in Midnight)
    61741, -- Delve Loremaster: Midnight
    61901, -- Midnight: Leave No Treasure Unfound (Title: Treasure Seeker)
    61906, -- Glory of the Midnight Delver (Mount: Giganto Manis)
    61707, -- Delver of the Depths: Midnight
    61708, -- Delver of the Depths II: Midnight
    61709, -- Delver of the Depths III: Midnight
    61710, -- Delver of the Depths IV: Midnight
    61722, -- Curio Enthusiast: Midnight
    61723, -- Curio Fanatic: Midnight
    61711, -- Midnight Delver Damage Dealer
    61712, -- Midnight Delver Damage Dealer II
    61713, -- Midnight Delver Damage Dealer III
    61714, -- Midnight Delver Healer
    61715, -- Midnight Delver Healer II
    61716, -- Midnight Delver Healer III
    61717, -- Midnight Delver Tank
    61718, -- Midnight Delver Tank II
    61719, -- Midnight Delver Tank III
    61720, -- Midnight Delver
    61721, -- Midnight Delver II (Reward: Finery Funds)
}

local delvesS1Progress = {
    61800, -- Midnight Delves: Tier 4 (Season 1) (Unlock: Tier 5 delves in Midnight Season 1)
    61801, -- Midnight Delves: Tier 5 (Season 1) (Unlock: Tier 6 delves in Midnight Season 1)
    61802, -- Midnight Delves: Tier 6 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
    61803, -- Midnight Delves: Tier 7 (Season 1) (Unlock: Tier 7 delves in Midnight Season 1)
    61804, -- Midnight Delves: Tier 8 (Season 1) (Unlock: Tier 9 delves in Midnight Season 1)
    61805, -- Midnight Delves: Tier 9 (Season 1) (Unlock: Tier 10 delves in Midnight Season 1)
    61806, -- Midnight Delves: Tier 10 (Season 1) (Unlock: Tier 11 delves in Midnight Season 1)
    61807, -- Midnight Delves: Tier 11 (Season 1) (Title: High Explorer)
    61796, -- Midnight: Journey's End (Season 1)
    -- 40459, -- I've Got a Flying Machine!
    -- 40789, -- Flying in Style
}

local delvesS1 = {
    delves,
    delvesS1Progress,
}

local quelThalas = {
    62110, -- Loremaster of Midnight
    42045, -- Midnight
    61859, -- Midnight Flight Master
    61854, -- The Midnight Explorer
    61584, -- Midnight Glyph Hunter
    61941, -- Abundance: Acolyte of a Glorious Entity
    61943, -- Abundance: Prosperous Plentitude!
    42283, -- Abundance: Azeroth Runs on Dundun
    62268, -- Abundance: Professionals Only
    61681, -- Abundance: You Should See Him in a Crown
    62266, -- Abundance: An Acolyte no Longer
    62057, -- Midnight: The Highest Peaks
    62104, -- Midnight Lore Hunter
    61464, -- Spark in the Night
    61465, -- Spark in the Night
    61234, -- Hunt in the Night
    61238, -- Midnight Hunter
    61225, -- Investigating the Rise
    61226, -- Uprising
    61227, -- Entering the Void
    61228, -- Embracing the Void
    61229, -- Dedication in the Void
    61265, -- Spectral Capture
    61266, -- Spectral Stocker
    61231, -- Midnight Loot
    61232, -- Midnight Treasures
    61230, -- Remains in the Rise
    61447, -- Partake in the Rise
    61448, -- Frequent the Rise
    61449, -- Customary Rise
    61446, -- Slayer's Mastery (Title: Voidslayer)
    62192, -- Midnight Diplomat (Reward: Finery Funds)
}

KrowiAF.ZoneData.Midnight = {
    { -- Eversong Woods (zone)
        2395,
        {
            41802, -- Eversong In Reprise
            61957, -- Sojourner of Eversong Woods
            61855, -- Explore Eversong Woods
            61960, -- Treasures of Eversong Woods
            61507, -- A Bloody Song
            61576, -- Eversong Woods Glyph Hunter
            61937, -- Abundance: Artisan of Mausoloa
            61961, -- Runestone Rush
            62186, -- The Party Must Go On
            62187, -- Grand Magister's Sommelier
            62185, -- Ever Painting
            61221, -- Tour of Duty: Eversong Woods
            62190, -- Life of the Party
            62262, -- Silvermoon Court Champion
            62261, -- Forever Song
            quelThalas,
        }
    },
    { -- Voidstorm (zone)
        2405,
        {
            41806, -- Breaching the Voidstorm
            61864, -- Sojourner of Voidstorm
            62105, -- Lysikas Would Be Proud
            61857, -- Explore Voidstorm
            62126, -- Treasures of Voidstorm
            62130, -- The Ultimate Predator
            61583, -- Voidstorm Glyph Hunter
            61940, -- Abundance: Artisan of Loanite
            61861, -- Oh, No You Don't!
            61912, -- Anchoring the Defense
            61913, -- A Singular Problem
            61922, -- Ninety Percent is Good Enough
            62133, -- Thrill of the Chase
            61224, -- Tour of Duty: Voidstorm
            62265, -- The Singularity Champion
            62256, -- Yelling into the Voidstorm
            quelThalas,
        }
    },
    { -- Harandar (zone)
        2413,
        {
            41804, -- One Does Not Simply Walk Into Harandar
            61739, -- Sojourner of Harandar
            42278, -- The Empty Cradle
            61219, -- No Time to Paws
            61520, -- Explore Harandar
            61263, -- Treasures of Harandar
            61264, -- Leaf None Behind
            61582, -- Harandar Glyph Hunter
            61939, -- Abundance: Artisan of Floaret
            61860, -- From The Cradle to the Grave
            62188, -- More Than Just Their Roots
            61052, -- Dust 'Em Off (Reward: Title: "Dustlord")
            61344, -- Chronicler of the Haranir
            61574, -- Legends Never Die
            61917, -- "Hold aggro, I got this"
            61223, -- Tour of Duty: Harandar
            62264, -- Hara'ti Champion
            62260, -- That's Aln, Folks!
            quelThalas,
        }
    },
    { -- Murder Row (dungeon)
        {2433, 2434, 2435},
        {
            41960, -- Murder Row
            41961, -- Heroic: Murder Row
            41962, -- Mythic: Murder Row
        }
    },
    { -- Zul'Aman (zone)
        2437,
        {
            41803, -- For Zul'Aman! (Customization Reward: Amani Appearances for Darkspear Troll)
            61452, -- Sojourner of Zul'Aman
            61910, -- Mrglgrgl of Grglmrgl
            61856, -- Explore Zul'Aman
            62125, -- Treasures of Zul'Aman
            62122, -- Tallest Tree in the Forest
            61581, -- Zul'Aman Glyph Hunter
            61938, -- Abundance: Artisan of Loaknit
            61455, -- Shadowpine Scattered
            62120, -- Altar of Blessings: The Penitent Troll
            62121, -- Altar of Blessings: Sacred Buffet Devotee
            62269, -- Altar of Blessings: Amani Curious
            62270, -- Altar of Blessings: One for Altar
            62199, -- Put a Pin in It
            62200, -- Gnome Alone
            62201, -- The Frog and the Princesses
            62202, -- Spiritpaw Marathon
            62267, -- A Most Violent Loa
            61222, -- Tour of Duty: Zul'Aman
            62263, -- Amani Tribe Champion
            61453, -- Making an Amani Out of You
            quelThalas,
        }
    },
    { -- Windrunner Spire (dungeon)
        {2492, 2493, 2494, 2496, 2497, 2498, 2499},
        {
            41287, -- Windrunner Spire
            41288, -- Heroic: Windrunner Spire
            41291, -- Mythic: Windrunner Spire
            61262, -- Keystone Hero: Windrunner Spire
            61590, -- Keystone Victor: Windrunner Spire
        }
    },
    { -- The Blinding Vale (dungeon)
        2500,
        {
            61641, -- The Blinding Vale
            61648, -- Heroic: The Blinding Vale
            61649, -- Mythic: The Blinding Vale
        }
    },
    { -- Maisara Caverns (dungeon)
        2501,
        {
            61639, -- Maisara Caverns
            61644, -- Heroic: Maisara Caverns
            61645, -- Mythic: Maisara Caverns
            61269, -- Keystone Hero: Maisara Caverns
            61588, -- Keystone Victor: Maisara Caverns
        }
    },
    { -- The Shadow Enclave (delve)
        2502,
        {
            61727, -- The Shadow Enclave Stories
            61892, -- The Shadow Enclave Discoveries
            delvesS1,
        }
    },
    { -- Twilight Crypts (delve)
        {2503, 2504},
        {
            61730, -- Twilight Crypts Stories
            61896, -- Twilight Crypts Discoveries
            delvesS1,
        }
    },
    { -- The Gulf of Memory (delve)
        {2505, 2575},
        {
            61731, -- The Gulf of Memory Stories
            61898, -- The Gulf of Memory Discoveries
            delvesS1,
        }
    },
    { -- Shadowguard Point (delve)
        2506,
        {
            61733, -- Shadowguard Point Stories
            61900, -- Shadowguard Point Discoveries
            delvesS1,
        }
    },
    { -- Torment's Rise (delve)
        2507,
        {
            40732, -- Heavy-Handed
            61797, -- My Shady Nemesis (Reward: Nullaeus Domaneye)
            61798, -- Lighting the Dark (Title: the Ominous)
            61799, -- Let Me Solo Him: Nullaeus (Reward: Arcanovoid Construct)
            61808, -- Fabled Let Me Solo Him: Nullaeus (Title: Fabled Vanquisher of Nullaeus)
            delves,
        }
    },
    { -- The Grudge Pit (delve)
        2510,
        {
            61724, -- The Grudge Pit Stories
            61897, -- The Grudge Pit Discoveries
            delvesS1,
        }
    },
    { -- Magisters' Terrace (dungeon)
        {2511, 2515, 2516, 2517, 2518, 2519, 2520},
        {
            61212, -- Magisters' Terrace
            61213, -- Heroic: Magisters' Terrace
            61214, -- Mythic: Magisters' Terrace
            61267, -- Keystone Hero: Magisters' Terrace
            61587, -- Keystone Victor: Magisters' Terrace (Midnight)
        }
    },
    { -- Den of Nalorakk (dungeon)
        {2513, 2514, 2564},
        {
            61638, -- Den of Nalorakk
            61642, -- Heroic: Den of Nalorakk
            61643, -- Mythic: Den of Nalorakk
        }
    },
    { -- The Darkway (delve)
        2525,
        {
            61728, -- The Darkway Stories
            61895, -- The Darkway Discoveries
            delvesS1,
        }
    },
    { -- The Grudge Pit (delve)
        {2528, 2571},
        {
            61732, -- Sunkiller Sanctum Stories
            61899, -- Sunkiller Sanctum Discoveries
            delvesS1,
        }
    },
    { -- The Voidspire (raid)
        {2529, 2530},
        {
            61635, -- Voidspire: Weapons of the Void
            61636, -- Voidspire: Fanatics of the Light
            61637, -- Voidspire: Crown of the Cosmos
            61366, -- The Voidspire
            61368, -- Heroic: The Voidspire
            61370, -- Mythic: The Voidspire
            61624, -- Ahead of the Curve: Crown of the Cosmos
            61625, -- Cutting Edge: Crown of the Cosmos
            62106, -- The Only Winning Move Is Not To Play
            62058, -- Hungry Hungry Hatchlings
            61514, -- It's Treason Then
            61911, -- Ready, Set, Snap!
            61936, -- Aura Farming
            61346, -- We Will, In Fact, See It Again
            61380, -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
            61372, -- Mythic: Imperator Averzian
            61373, -- Mythic: Vorasius
            61374, -- Mythic: Fallen-King Salhadaar
            61375, -- Mythic: Vaelgor & Ezzorak
            61376, -- Mythic: Lightblinded Vanguard
            61377, -- Mythic: Crown of the Cosmos (Title: Spirebane)
        }
    },
    { -- The Dreamrift (raid)
        {2531, 2532},
        {
            61487, -- Chimaerus, the Undreamt God
            61488, -- Heroic: Chimaerus, the Undreamt God
            61489, -- Mythic: Chimaerus, the Undreamt God (Title: Dream-Eater)
            61491, -- Ahead of the Curve: Chimaerus, the Undreamt God
            61492, -- Cutting Edge: Chimaerus, the Undreamt God
            61454, -- Falling Between The Quacks
            61380, -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
        }
    },
    { -- March on Quel'Danas (raid)
        {2533, 2534},
        {
            61367, -- March on Quel'Danas
            61369, -- Heroic: March on Quel'Danas
            61371, -- Mythic: March on Quel'Danas
            61626, -- Ahead of the Curve: Midnight Falls
            61627, -- Cutting Edge: Midnight Falls
            61381, -- Eggsistential Crisis
            61380, -- Glory of the Midnight Raider (Mount: Tenebrous Harrower)
            61378, -- Mythic: Belo'ren, Child of Al'ar
            61379, -- Mythic: Midnight Falls (Title: Dawnbringer)
        }
    },
    { -- Atal'Aman (delve)
        2535,
        {
            61729, -- Atal'Aman Stories
            61863, -- Atal'Aman Discoveries
            delvesS1,
        }
    },
    { -- Quel'Thalas (zone)
        2537,
        {
            41805, -- Arator's Journey
            42117, -- The War of Light and Shadow
            60891, -- The Crimson Rogue
            62191, -- Call of the Light
            61839, -- Midnight Pathfinder (Reward: Steady Flight unlocked within Midnight, Finery Funds)
        }
    },
    { -- Parhelion Plaza (delve)
        2545,
        {
            61725, -- Parhelion Plaza Stories
            61893, -- Parhelion Plaza Discoveries
            delvesS1,
        }
    },
    { -- Collegiate Calamity (delve)
        {2547, 2577, 2578},
        {
            61726, -- Collegiate Calamity Stories
            61894, -- Collegiate Calamity Discoveries
            delvesS1,
        }
    },
    { -- Nexus-Point Xenas (dungeon) [CHECK MAP IDS - MAY BE INACCURATE]
        2556,
        {
            61640, -- Nexus-Point Xenas
            61646, -- Heroic: Nexus-Point Xenas
            61647, -- Mythic: Nexus-Point Xenas
            61268, -- Keystone Hero: Nexus-Point Xenas
            61589, -- Keystone Victor: Nexus-Point Xenas
        }
    },
    { -- Voidscar Arena (dungeon) [CHECK MAP IDS - MAY BE INACCURATE]
        {2572, 2573, 2574},
        {
            61508, -- Voidscar Arena
            61509, -- Heroic: Voidscar Arena
            61510, -- Mythic: Voidscar Arena
        }
    },
}