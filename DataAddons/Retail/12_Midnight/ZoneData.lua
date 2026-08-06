local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local delves = {
    shared.CrossExpansionDelves,
    61832, -- Midnight Delves: Tier 1
    61835, -- Midnight Delves: Tier 2
    61836, -- Midnight Delves: Tier 3
    61734, -- Midnight Delves: Endgame
    61741, -- Delve Loremaster: Midnight
    61901, -- Midnight: Leave No Treasure Unfound
    61906, -- Glory of the Midnight Delver
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
    61721, -- Midnight Delver II
    62206, -- Midnight Delver III
    63434, -- Buddy System VII: Valeera
    63435, -- Buddy System VIII: Valeera
}

local delvesS1Progress = {
    61800, -- Midnight Delves: Tier 4 (Season 1)
    61801, -- Midnight Delves: Tier 5 (Season 1)
    61802, -- Midnight Delves: Tier 6 (Season 1)
    61803, -- Midnight Delves: Tier 7 (Season 1)
    61804, -- Midnight Delves: Tier 8 (Season 1)
    61805, -- Midnight Delves: Tier 9 (Season 1)
    61806, -- Midnight Delves: Tier 10 (Season 1)
    61807, -- Midnight Delves: Tier 11 (Season 1)
    61796, -- Midnight: Journey's End (Season 1)
}

local delvesS1 = {
    delves,
    delvesS1Progress,
}

local delvesS2Progress = {
    62889, -- Midnight Delves: Tier 4 (Season 2)
    62890, -- Midnight Delves: Tier 5 (Season 2)
    62891, -- Midnight Delves: Tier 6 (Season 2)
    62892, -- Midnight Delves: Tier 7 (Season 2)
    62893, -- Midnight Delves: Tier 8 (Season 2)
    62894, -- Midnight Delves: Tier 9 (Season 2)
    62895, -- Midnight Delves: Tier 10 (Season 2)
    62897, -- Midnight Delves: Tier 11 (Season 2)
    63433, -- Midnight: Journey's End (Season 2)
}

local delvesS2 = {
    delves,
    delvesS2Progress,
}

local quelThalas = {
    62386, -- Light Up the Night
    62110, -- Loremaster of Midnight
    42045, -- Midnight
    61859, -- Midnight Flight Master
    61854, -- The Midnight Explorer
    61584, -- Midnight Glyph Hunter
    61941, -- Abundance: Acolyte of a Glorious Entity
    61943, -- Abundance: Prosperous Plentitude!
    62268, -- Abundance: Professionals Only
    61681, -- Abundance: You Should See Him in a Crown
    62266, -- Abundance: An Acolyte no Longer
    62324, -- Abundance: Loa of all Trades
    62333, -- Abundance: Harvester
    62336, -- Abundance: Contributor
    62337, -- Abundance: Professional
    62338, -- Abundance: Artisan
    62340, -- Abundance: Investor
    62339, -- Abundance: Gambler
    62325, -- Abundance: Treasures Aplenty
    62326, -- Abundance: Golden Opportunities
    62329, -- Abundance: Squash the Competition
    62330, -- Abundance: One Bite at a Time
    62331, -- Abundance: Drops of Prosperity
    62332, -- Abundance: Dundun's Favored
    42283, -- Abundance: Azeroth Runs on Dundun
    62341, -- Abundance: Ain't Dun Till It's Dun
    62057, -- Midnight: The Highest Peaks
    62104, -- Midnight Lore Hunter
    61464, -- Spark in the Night
    61465, -- Spark in the Night
    61234, -- Hunt in the Night
    61238, -- Midnight Bounty
    61231, -- Midnight Loot
    61232, -- Midnight Treasures
    62192, -- Midnight Diplomat
}

local zoneData = KrowiAF.NewZoneData("Midnight")

zoneData:Zone(2393, { -- Silvermoon City (city)
    63343, -- Goal!
    275, -- Veteran Nanny
})

zoneData:Zone({2395, 2579}, { -- Eversong Woods (zone)
    62261, -- Forever Song
    41802, -- Eversong In Reprise
    61957, -- Sojourner of Eversong Woods
    61855, -- Explore Eversong Woods
    61960, -- Treasures of Eversong Woods
    62288, -- Eversong Woods: The Highest Peaks
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
    quelThalas,
})

zoneData:Zone(2405, { -- Voidstorm (zone)
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
})

zoneData:Zone({2413, 2522, 2523, 2576}, { -- Harandar (zone)
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
})

zoneData:Zone(2427, { -- Sporefall (raid)
    63237, -- Rotmire
    63240, -- Heroic: Rotmire
    63241, -- Mythic: Rotmire
})

zoneData:Zone({2433, 2434, 2435}, { -- Murder Row (dungeon)
    41960, -- Murder Row
    41961, -- Heroic: Murder Row
    41962, -- Mythic: Murder Row
    62440, -- Keystone Hero: Murder Row
    63623, -- Keystone Victor: Murder Row
})

zoneData:Zone({2437, 2536, 2580, 2583, 2584}, { -- Zul'Aman (zone)
    41803, -- For Zul'Aman! (Customization Reward: Amani Appearances for Darkspear Troll)
    62297, -- The Curse of Ula'tek
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
})

zoneData:Zone(2444, { -- Slayer's Rise (zone)
    61225, -- Investigating the Rise
    61226, -- Uprising
    61227, -- Entering the Void
    61228, -- Embracing the Void
    61229, -- Dedication in the Void
    61265, -- Spectral Capture
    61266, -- Spectral Stocker
    61230, -- Remains in the Rise
    61447, -- Partake in the Rise
    61448, -- Frequent the Rise
    61449, -- Customary Rise
    61446, -- Slayer's Mastery
})

zoneData:Zone(2397, { -- Slayer's Rise (battleground)
    shared.GenericBattleground,
})

zoneData:Zone({2492, 2493, 2494, 2496, 2497, 2498, 2499}, { -- Windrunner Spire (dungeon)
    41287, -- Windrunner Spire
    41288, -- Heroic: Windrunner Spire
    41291, -- Mythic: Windrunner Spire
    61262, -- Keystone Hero: Windrunner Spire
    61590, -- Keystone Victor: Windrunner Spire
})

zoneData:Zone(2500, { -- The Blinding Vale (dungeon)
    61641, -- The Blinding Vale
    61648, -- Heroic: The Blinding Vale
    61649, -- Mythic: The Blinding Vale
    62437, -- Keystone Hero: The Blinding Vale
    63624, -- Keystone Victor: The Blinding Vale
})

zoneData:Zone(2501, { -- Maisara Caverns (dungeon)
    61639, -- Maisara Caverns
    61644, -- Heroic: Maisara Caverns
    61645, -- Mythic: Maisara Caverns
    61269, -- Keystone Hero: Maisara Caverns
    61588, -- Keystone Victor: Maisara Caverns
})

zoneData:Zone(2502, { -- The Shadow Enclave (delve)
    61727, -- The Shadow Enclave Stories
    61892, -- The Shadow Enclave Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2503, 2504}, { -- Twilight Crypts (delve)
    61730, -- Twilight Crypts Stories
    61896, -- Twilight Crypts Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2505, 2575}, { -- The Gulf of Memory (delve)
    61731, -- The Gulf of Memory Stories
    61898, -- The Gulf of Memory Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone(2506, { -- Shadowguard Point (delve)
    61733, -- Shadowguard Point Stories
    61900, -- Shadowguard Point Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone(2507, { -- Torment's Rise (delve)
    40732, -- Heavy-Handed
    61797, -- My Shady Nemesis
    61798, -- Lighting the Dark
    61799, -- Let Me Solo Him: Nullaeus
    61808, -- Fabled Let Me Solo Him: Nullaeus
})

zoneData:Zone(2510, { -- The Grudge Pit (delve)
    61724, -- The Grudge Pit Stories
    61897, -- The Grudge Pit Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2511, 2515, 2516, 2517, 2518, 2519, 2520}, { -- Magisters' Terrace (dungeon)
    61212, -- Magisters' Terrace
    61213, -- Heroic: Magisters' Terrace
    61214, -- Mythic: Magisters' Terrace
    61267, -- Keystone Hero: Magisters' Terrace
    61587, -- Keystone Victor: Magisters' Terrace (Midnight)
})

zoneData:Zone({2513, 2514, 2564}, { -- Den of Nalorakk (dungeon)
    61638, -- Den of Nalorakk
    61642, -- Heroic: Den of Nalorakk
    61643, -- Mythic: Den of Nalorakk
    62439, -- Keystone Hero: Den of Nalorakk
    63622, -- Keystone Victor: Den of Nalorakk
})

zoneData:Zone(2525, { -- The Darkway (delve)
    61728, -- The Darkway Stories
    61895, -- The Darkway Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2528, 2571}, { -- Sunkiller Sanctum (delve)
    61732, -- Sunkiller Sanctum Stories
    61899, -- Sunkiller Sanctum Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2529, 2530}, { -- The Voidspire (raid)
    61635, -- Voidspire: Weapons of the Void
    61636, -- Voidspire: Fanatics of the Light
    61637, -- Voidspire: Crown of the Cosmos
    61366, -- The Voidspire
    61368, -- Heroic: The Voidspire
    61370, -- Mythic: The Voidspire
    61624, -- Ahead of the Curve: Crown of the Cosmos
    61625, -- Cutting Edge: Crown of the Cosmos
    62352, -- Nothing to See Here
    62106, -- The Only Winning Move Is Not To Play
    62058, -- Hungry Hungry Hatchlings
    61514, -- It's Treason Then
    61911, -- Ready, Set, Snap!
    61936, -- Aura Farming
    61346, -- We Will, In Fact, See It Again
    61380, -- Glory of the Midnight Raider
    61372, -- Mythic: Imperator Averzian
    61373, -- Mythic: Vorasius
    61374, -- Mythic: Fallen-King Salhadaar
    61375, -- Mythic: Vaelgor & Ezzorak
    61376, -- Mythic: Lightblinded Vanguard
    61377, -- Mythic: Crown of the Cosmos
    61843, -- Quel'Dressed
})

zoneData:Zone({2531, 2532}, { -- The Dreamrift (raid)
    61487, -- Chimaerus, the Undreamt God
    61488, -- Heroic: Chimaerus, the Undreamt God
    61489, -- Mythic: Chimaerus, the Undreamt God
    61491, -- Ahead of the Curve: Chimaerus, the Undreamt God
    61492, -- Cutting Edge: Chimaerus, the Undreamt God
    61454, -- Falling Between The Quacks
    61380, -- Glory of the Midnight Raider
    61843, -- Quel'Dressed
})

zoneData:Zone({2533, 2534}, { -- March on Quel'Danas (raid)
    61367, -- March on Quel'Danas
    61369, -- Heroic: March on Quel'Danas
    61371, -- Mythic: March on Quel'Danas
    61626, -- Ahead of the Curve: Midnight Falls
    61627, -- Cutting Edge: Midnight Falls
    62352, -- Nothing to See Here
    61381, -- Eggsistential Crisis
    62406, -- All the Things She Said
    61380, -- Glory of the Midnight Raider
    61378, -- Mythic: Belo'ren, Child of Al'ar
    61379, -- Mythic: Midnight Falls
    61843, -- Quel'Dressed
})

zoneData:Zone(2535, { -- Atal'Aman (delve)
    61729, -- Atal'Aman Stories
    61863, -- Atal'Aman Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone(2537, { -- Quel'Thalas (zone)
    41805, -- Arator's Journey
    42117, -- The War of Light and Shadow
    60891, -- The Crimson Rogue
    62191, -- Call of the Light
    61839, -- Midnight Pathfinder (Reward: Steady Flight unlocked within Midnight, Finery Funds)
})

zoneData:Zone(2541, { -- Arcantina
    61081, -- Share a Drink
    61082, -- Old Soldiers
    61083, -- Highly Decorated
    63619, -- New Friends
    63620, -- Well Decorated
})

zoneData:Zone(2545, { -- Parhelion Plaza (delve)
    61725, -- Parhelion Plaza Stories
    61893, -- Parhelion Plaza Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone({2547, 2577, 2578}, { -- Collegiate Calamity (delve)
    61726, -- Collegiate Calamity Stories
    61894, -- Collegiate Calamity Discoveries
    delvesS1,
    delvesS2Progress,
})

zoneData:Zone(2556, { -- Nexus-Point Xenas (dungeon)
    61585, -- You Conduit!
    61640, -- Nexus-Point Xenas
    61646, -- Heroic: Nexus-Point Xenas
    61647, -- Mythic: Nexus-Point Xenas
    61268, -- Keystone Hero: Nexus-Point Xenas
    61589, -- Keystone Victor: Nexus-Point Xenas
})

zoneData:Zone({2572, 2573, 2574}, { -- Voidscar Arena (dungeon)
    61508, -- Voidscar Arena
    61509, -- Heroic: Voidscar Arena
    61510, -- Mythic: Voidscar Arena
    62438, -- Keystone Hero: Voidscar Arena
    63625, -- Keystone Victor: Voidscar Arena
})

zoneData:Zone({2588, 2589, 2590}, { -- Altar of Fangs (dungeon)
    63679, -- In Case Of Emergency
    62282, -- Altar of Fangs
    62283, -- Heroic: Altar of Fangs
    62284, -- Mythic: Altar of Fangs
    62441, -- Keystone Hero: Altar of Fangs
    63621, -- Keystone Victor: Altar of Fangs
})

local valAndNaigtal = {
    63383, -- Into the Stars
    63384, -- Prepared for a Showdown
    62905, -- Pain of Command
    62909, -- Heroic: Pain of Command
    62887, -- Heroic: Worlds Ahead
    62901, -- Heroic: Power Creep
    63264, -- Heroic Showdowns
    63348, -- Heroic Slugger
}

zoneData:Zone({2599, 2617, 2618, 2619, 2620, 2621}, { -- Val (zone)
    valAndNaigtal,
    63386, -- Frosty Domanaar Politics
    62903, -- Climate Strange: Val
    62917, -- Heroic Climate Strange: Val
    62881, -- Showdown Slugger: Val
    62880, -- Showdown Success: Val
    62873, -- A Trip Around the Stars
    62842, -- A Celestial Pain
    63349, -- Ultradon Carnage
})

zoneData:Zone({2600, 2646}, { -- Naigtal (zone)
    valAndNaigtal,
    63385, -- A Hal'hadar Walks into a Swamp
    62904, -- Climate Strange: Naigtal
    62919, -- Heroic Climate Strange: Naigtal
    62883, -- Showdown Slugger: Naigtal
    62882, -- Showdown Success: Naigtal
    62874, -- A Trip Through the Stars
})

zoneData:Zone({2512, 2639, 2640, 2641, 2642, 2643, 2644, 2645}, { -- The Coiled Isle (zone)
    63639, -- Ula'tek Uncoiled
    62297, -- The Curse of Ula'tek
    63641, -- Snake Charmed, I'm Sure
    63633, -- A Stack of Snacks
    63359, -- Treasures of the Coiled Isle
    63395, -- The Coiled Isles Glyph Hunter
    63640, -- Explore the Coiled Isle
    63662, -- Student of Hissstory
    63358, -- Coiled to Strike
    63382, -- It's Definitely Something
    63432, -- Mysterious Mix Master
    63167, -- Tour of Duty: The Coiled Isle
    63631, -- Captain Tokka's Crew
})

zoneData:Zone({2509, 2613, 2636, 2637, 2638}, { -- Vaults of Atal'Utek (zone)
    62600, -- Ritual Behavior
    62601, -- Soft Underbelly
    62604, -- Dance While Everyone Watches
    62649, -- A Lone Wanderer
    63596, -- Snake Stompin'
    63598, -- Roll the Patrol
    63599, -- Submerge the Incursion
    63600, -- Spike the Strike
    63601, -- Oppose the Foes
    63610, -- The Honored Dead
    63630, -- Assault the Vault
    63636, -- Fully Corroded
    63653, -- Pro Poison Patroller
})

zoneData:Zone(2635, { -- Gnarldor Isle (delve)
    63437, -- Gnarldor Isle Stories
    63170, -- Gnarldor Isle Discoveries
    delvesS2,
})

zoneData:Zone(2633, { -- The Ring of Glory (delve)
    63436, -- The Ring of Glory Stories
    63171, -- The Ring of Glory Discoveries
    delvesS2,
})

zoneData:Zone(2634, { -- Venomfall Deeps (delve)
    40732, -- Heavy-Handed
    63326, -- My Venomous Nemesis
    63332, -- Purging the Poison
    63333, -- Let Me Solo Him: Azta'rec
    63334, -- Fabled Let Me Solo Him: Azta'rec
})

zoneData:Zone({2606, 2607, 2608, 2609, 2610}, { -- The Venomous Abyss (raid)
    63530, -- The Venomous Abyss: Essence of Ula'tek
    63531, -- The Venomous Abyss: Beasts of Ula'tek
    63532, -- The Venomous Abyss: Ula'tek
    63521, -- The Venomous Abyss
    63520, -- Heroic: The Venomous Abyss
    63522, -- Mythic: The Venomous Abyss
    63650, -- Ahead of the Curve: Ula'tek
    63651, -- Cutting Edge: Ula'tek
    62352, -- Nothing to See Here
    63670, -- Comforting Da Spirits
    63472, -- Fang Fatale
    63418, -- Well, Well, Little Sky
    63250, -- Is Venom Stasis A Joke To You?
    63645, -- Accidental Inclusion
    63397, -- Kept You Waiting Huh?
    63391, -- Jumping Through Hoops
    63656, -- Taking a Bite out of Slime
    63669, -- Watch Out Behind You
    63609, -- No Egg Scramble
    61380, -- Glory of the Midnight Raider
    63254, -- Glory of the Venomous Raider
    63523, -- Mythic: Nek'zali the Soulcoiler
    63524, -- Mythic: Entombed Sentinels
    63525, -- Mythic: The Lost Explorers
    63526, -- Mythic: Vashnik the Malignant
    63527, -- Mythic: Sszorak
    63528, -- Mythic: The Twin Fangs
    63529, -- Mythic: The Coiled Altar
    63476, -- Mythic: Ula'tek
    61843, -- Quel'Dressed
})

zoneData:Zone(2632, { -- The Tidebound Grotto (raid)
    63683, -- Nymrissa Wavecaller
    63681, -- Heroic: Nymrissa Wavecaller
    63682, -- Mythic: Nymrissa Wavecaller
})