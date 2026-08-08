local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("Legion")

zoneData:Zone({650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660}, { -- Highmountain (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10059, -- Ain't No Mountain High Enough
    10774, -- Hatchling of the Talon
    10626, -- Zoom!
    10398, -- Drum Circle
    11427, -- No Shellfish Endeavor
    61910, -- Mrglgrgl of Grglmrgl
    10667, -- Explore Highmountain
    11257, -- Treasures of Highmountain
    11264, -- Adventurer of Highmountain
    11478, -- The Darkbrul-oh
    12292, -- Highmountain Tribe
    46, -- Universal Explorer
})

zoneData:Zone(903, { -- Seat of the Triumvirate (dungeon)
    12004, -- Welcome the Void
    12005, -- Let it All Out
    12009, -- Darker Side
    12007, -- Heroic: Seat of the Triumvirate
    12008, -- Mythic: Seat of the Triumvirate
    61270, -- Keystone Hero: Seat of the Triumvirate
    61593, -- Keystone Victor: Seat of the Triumvirate
})

local classHalls = {
    10994, -- A Glorious Campaign
    11135, -- A Heroic Campaign
    11136, -- An Epic Campaign
    10706, -- Training the Troops
    11212, -- Raise an Army
    11213, -- Lead a Legion
    11214, -- Many Missions
    11215, -- Quite a Few Missions
    11216, -- So Many Missions
    11217, -- Many Many Missions, Handle It!
    11219, -- Need Backup
    11220, -- Roster of Champions
    11221, -- Champions Rise
    11222, -- Champions of Power
    11223, -- Legendary Research
    11298, -- A Classy Outfit
    10746, -- Forged for Battle
    10459, -- Improving on History
    10743, -- The Prestige
    10745, -- The Prestige
    10460, -- Hidden Potential
    10461, -- Fighting with Style: Classic
    10747, -- Fighting with Style: Upgraded
    10748, -- Fighting with Style: Valorous
    11173, -- Fighting with Style: War-torn
    10749, -- Fighting with Style: War-torn
    10750, -- Fighting with Style: Hidden
    11171, -- Arsenal of Power
    11137, -- A Legendary Campaign
    11611, -- A Challenging Look
    11612, -- Fighting with Style: Challenging
    11144, -- Power Realized
    11772, -- Power Ascended
    11609, -- Power Unbound
    11610, -- Power Unleashed
    10852, -- Artifact or Artifiction
    10853, -- Part of History
    12071, -- Crucible's Promise
    12072, -- Now You're Cooking with Netherlight
    11218, -- There's a Boss In There
}

zoneData:Zone(24, classHalls) -- Light's Hope Chapel (Paladin)
zoneData:Zone(626, classHalls) -- Dalaran (Rogue — Hall of Shadows)
zoneData:Zone({647, 648}, classHalls) -- Acherus: The Ebon Hold (Death Knight)
zoneData:Zone(695, classHalls) -- Skyhold (Warrior)
zoneData:Zone(702, classHalls) -- Netherlight Temple (Priest)
zoneData:Zone(709, classHalls) -- The Wandering Isle (Monk)
zoneData:Zone(717, classHalls) -- Dreadscar Rift (Warlock)
zoneData:Zone({719, 720, 721}, classHalls) -- Mardum, the Shattered Abyss (Demon Hunter)
zoneData:Zone(726, classHalls) -- The Maelstrom (Shaman)
zoneData:Zone({734, 735}, classHalls) -- Hall of the Guardian (Mage)
zoneData:Zone(739, classHalls) -- Trueshot Lodge (Hunter)
zoneData:Zone(747, classHalls) -- The Dreamgrove (Druid)

zoneData:Zone(619, { -- Broken Isles (continent)
    7520, -- The Loremaster
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    11846, -- Champions of Legionfall
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    46, -- Universal Explorer
})

zoneData:Zone({627, 628, 629}, { -- Dalaran (city)
    10770, -- The Tangerine Traveler
    12416, -- The Total Package
    12431, -- Post Haste
    12439, -- Priority Mail
    11066, -- Underbelly Tycoon
    10585, -- Fel-Smelter
    10586, -- Mass Obliteration
})

zoneData:Zone({630, 631, 632, 633}, { -- Azsuna (zone)
    7520, -- The Loremaster
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10763, -- Azsuna Matata
    10665, -- Explore Azsuna
    11175, -- Higher Dimensional Learning
    11256, -- Treasures of Azsuna
    11261, -- Adventurer of Azsuna
    11475, -- Mission Accomplished
    46, -- Universal Explorer
})

zoneData:Zone({634, 635, 636, 637, 638, 639, 640, 649}, { -- Stormheim (zone)
    7520, -- The Loremaster
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10790, -- Vrykul Story, Bro
    10793, -- What a Ripoff!
    11232, -- Lock, Stock and Two Smoking Goblins
    11427, -- No Shellfish Endeavor
    10668, -- Explore Stormheim
    10627, -- Going Up
    11259, -- Treasures of Stormheim
    11263, -- Adventurer of Stormheim
    11178, -- Wake the Dragon
    11476, -- Saddle Sore
    46, -- Universal Explorer
})

zoneData:Zone({641, 642, 643, 644}, { -- Val'sharah (zone)
    7520, -- The Loremaster
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    11186, -- Tehd & Marius' Excellent Adventure
    11544, -- Defender of the Broken Isles
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    11474, -- Free For All, More For Me
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10698, -- That's Val'sharah Folks!
    10666, -- Explore Val'sharah
    11258, -- Treasures of Val'sharah
    11262, -- Adventurer of Val'sharah
    11477, -- Off the Top Rook
    46, -- Universal Explorer
})

zoneData:Zone(646, { -- Broken Shore (zone)
    11446, -- Broken Isles Pathfinder, Part Two
    11846, -- Champions of Legionfall
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    11786, -- Terrors of the Shore
    11607, -- They See Me Rolling
    11546, -- Breaching the Tomb
    11681, -- Crate Expectations
    11731, -- A Magic Contribution
    11732, -- A Magnificent Contribution
    11735, -- Take Command
    11736, -- Assume Command
    11737, -- Disrupting the Nether
    11738, -- It'll Nether Happen
    11543, -- Explore Broken Shore
    11802, -- Bringing Home the Beacon
    11841, -- Naxt Victim
    11545, -- Legionfall Commander
    11796, -- Armies of Legionfall
})

zoneData:Zone({680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693}, { -- Suramar (zone)
    7520, -- The Loremaster
    11190, -- Broken Isles Pathfinder, Part One
    11446, -- Broken Isles Pathfinder, Part Two
    11160, -- Unleashed Monstrosities
    11157, -- Loremaster of Legion
    10877, -- Pillars of Creation
    11189, -- Variety is the Spice of Life
    14729, -- To All the Squirrels I Love Despite Their Scars
    11188, -- Broken Isles Explorer
    10672, -- Broken Isles Diplomat
    11159, -- Friends in a Broken Land
    11652, -- The Reputable
    11653, -- Paragon of the Broken Isles
    10617, -- Nightfallen But Not Forgotten
    11124, -- Good Suramaritan
    10756, -- Leyline Bling
    11125, -- Now You're Thinking With Portals
    11133, -- Why Can't I Hold All This Mana?
    11340, -- Insurrection
    11427, -- No Shellfish Endeavor
    10669, -- Explore Suramar
    11260, -- Treasures of Suramar
    11265, -- Adventurer of Suramar
    10778, -- The Nightfallen
    46, -- Universal Explorer
})

zoneData:Zone({703, 704, 705}, { -- Halls of Valor (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10544, -- Stag Party
    10542, -- I Got What You Mead
    10543, -- Surge Protector
    10786, -- Halls of Valor
    10788, -- Heroic: Halls of Valor
    10789, -- Mythic: Halls of Valor
    16659, -- Keystone Hero: Halls of Valor
})

zoneData:Zone({706, 707, 708}, { -- Maw of Souls (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10413, -- Instant Karma
    10411, -- Helheim Hath No Fury
    10412, -- Poor Unfortunate Souls
    10807, -- Maw of Souls
    10808, -- Heroic: Maw of Souls
    10809, -- Mythic: Maw of Souls
})

zoneData:Zone({710, 711, 712}, { -- Vault of the Wardens (dungeon)
    11240, -- Harbinger
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10679, -- I Ain't Even Cold
    10680, -- Who's Afraid of the Dark?
    10707, -- A Specter, Illuminated
    10801, -- Vault of the Wardens
    10802, -- Heroic: Vault of the Wardens
    10803, -- Mythic: Vault of the Wardens
})

zoneData:Zone(713, { -- Eye of Azshara (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10456, -- But You Say He's Just a Friend
    10457, -- Stay Salty
    10458, -- Ready for Raiding V
    10780, -- Eye of Azshara
    10781, -- Heroic: Eye of Azshara
    10782, -- Mythic: Eye of Azshara
})

zoneData:Zone(731, { -- Neltharion's Lair (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10996, -- Got to Ketchum All
    10875, -- Can't Eat Just One
    10795, -- Neltharion's Lair
    10796, -- Heroic: Neltharion's Lair
    10797, -- Mythic: Neltharion's Lair
    17850, -- Keystone Hero: Neltharion's Lair
})

zoneData:Zone(732, { -- Violet Hold (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    10554, -- I Made a Food!
    10553, -- You're Just Making It WORSE!
    10798, -- Assault on Violet Hold
    10799, -- Heroic: Assault on Violet Hold
    10800, -- Mythic: Assault on Violet Hold
})

zoneData:Zone(733, { -- Darkheart Thicket (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10766, -- Egg-cellent!
    10769, -- Burning Down the House
    10783, -- Darkheart Thicket
    10784, -- Heroic: Darkheart Thicket
    10785, -- Mythic: Darkheart Thicket
    19085, -- Keystone Hero: Darkheart Thicket
})

zoneData:Zone(749, { -- The Arcway (dungeon)
    11181, -- Legion Keymaster
    10773, -- Arcanic Cling
    10775, -- Clean House
    10776, -- No Time to Waste
    10813, -- Mythic: The Arcway
})

zoneData:Zone({751, 752, 753, 754, 755, 756}, { -- Black Rook Hold (dungeon)
    11164, -- Legion Dungeon Hero
    11163, -- Glory of the Legion Hero
    11181, -- Legion Keymaster
    10710, -- Black Rook Moan
    10709, -- You Used to Scrawl Me In Your Fel Tome
    10711, -- Adds? More Like Bads
    10804, -- Black Rook Hold
    10805, -- Heroic: Black Rook Hold
    10806, -- Mythic: Black Rook Hold
    19084, -- Keystone Hero: Black Rook Hold
})

zoneData:Zone({761, 762, 763}, { -- Court of Stars (dungeon)
    11181, -- Legion Keymaster
    10610, -- Waiting for Gerdo
    10611, -- Dropping Some Eaves
    10816, -- Mythic: Court of Stars
    16658, -- Keystone Hero: Court of Stars
})

zoneData:Zone({764, 765, 766, 767, 768, 769, 770, 771, 772}, { -- The Nighthold (raid)
    11180, -- Glory of the Legion Raider
    10829, -- Arcing Aqueducts
    10837, -- Royal Athenaeum
    10838, -- Nightspire
    10839, -- Betrayer's Rise
    11195, -- Ahead of the Curve: Gul'dan
    11192, -- Cutting Edge: Gul'dan
    11628, -- That's So Last Millennium
    10678, -- Cage Rematch
    10697, -- Grand Opening
    10742, -- Gluten Free
    10817, -- A Change In Scenery
    10851, -- Elementalry!
    10754, -- Fruit of All Evil
    10575, -- Burning Bridges
    10704, -- Not For You
    10699, -- Infinitesimal
    10696, -- I've Got My Eyes On You
    10840, -- Mythic: Skorpyron
    10842, -- Mythic: Chronomatic Anomaly
    10843, -- Mythic: Trilliax
    10844, -- Mythic: Spellblade Aluriel
    10845, -- Mythic: Star Augur Etraeus
    10846, -- Mythic: High Botanist Tel'arn
    10848, -- Mythic: Krosus
    10847, -- Mythic: Tichondrius
    10849, -- Mythic: Grand Magistrix Elisande
    10850, -- Mythic: Gul'dan
})

zoneData:Zone({777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789}, { -- The Emerald Nightmare (raid)
    11180, -- Glory of the Legion Raider
    10818, -- Darkbough
    10819, -- Tormented Guardians
    10820, -- Rift of Aln
    11194, -- Ahead of the Curve: Xavius
    11191, -- Cutting Edge: Xavius
    10555, -- Buggy Fight
    10830, -- Took the Red Eye Down
    10771, -- Webbing Crashers
    10753, -- Scare Bear
    10663, -- Imagined Dragons World Tour
    10772, -- Use the Force(s)
    10755, -- I Attack the Darkness
    10821, -- Mythic: Nythendra
    10823, -- Mythic: Il'gynoth
    10822, -- Mythic: Elerethe Renferal
    10824, -- Mythic: Ursoc
    10825, -- Mythic: Dragons of Nightmare
    10826, -- Mythic: Cenarius
    10827, -- Mythic: Xavius
})

zoneData:Zone({806, 807, 808}, { -- Trial of Valor (raid)
    11337, -- You Runed Everything!
    11386, -- Boneafide Tri Tip
    11377, -- Patient Zero
    11394, -- Trial of Valor
    11426, -- Heroic: Trial of Valor
    11396, -- Mythic: Odyn
    11397, -- Mythic: Guarm
    11398, -- Mythic: Helya
    11387, -- The Chosen
    11581, -- Ahead of the Curve: Helya
    11580, -- Cutting Edge: Helya
    11762, -- Can I Get A Helya
})

zoneData:Zone({809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822}, { -- Return to Karazhan (dungeon)
    11430, -- One Night in Karazhan
    11335, -- Season Tickets
    11338, -- Dine and Bash
    11432, -- Scared Straight
    11431, -- The Rat Pack
    11433, -- Burn After Reading
    11929, -- Heroic: Return to Karazhan
    11429, -- Mythic: Return to Karazhan
    15692, -- Keystone Hero: Return to Karazhan
    15688, -- Shadowlands Keystone Explorer: Season Four
    15689, -- Shadowlands Keystone Conqueror: Season Four
    15690, -- Shadowlands Keystone Master: Season Four
})

zoneData:Zone({845, 846, 847, 848, 849}, { -- Cathedral of Eternal Night (dungeon)
    11768, -- Boom Bloom
    11769, -- A Steamy Romance Saga
    11703, -- Master of Shadows
    11700, -- Cathedral of Eternal Night
    11701, -- Heroic: Cathedral of Eternal Night
    11702, -- Mythic: Cathedral of Eternal Night
})

zoneData:Zone({850, 851, 852, 853, 854, 855, 856}, { -- Tomb of Sargeras (raid)
    11763, -- Glory of the Tomb Raider
    11787, -- The Gates of Hell
    11788, -- Wailing Halls
    11789, -- Chamber of the Avatar
    11790, -- Deceiver's Fall
    11874, -- Ahead of the Curve: Kil'jaeden
    11875, -- Cutting Edge: Kil'jaeden
    11760, -- Retro Trend
    11724, -- Fel Turkey!
    11699, -- Grand Fin-ale
    11676, -- Five Course Seafood Buffet
    11696, -- Grin and Bear It
    11773, -- Wax On, Wax Off
    11674, -- Great Soul, Great Purpose
    11675, -- Sky Walker
    11683, -- Bingo!
    11770, -- Dark Souls
    11767, -- Mythic: Goroth
    11775, -- Mythic: Harjatan
    11776, -- Mythic: Mistress Sassz'ine
    11774, -- Mythic: Demonic Inquisition
    11777, -- Mythic: Sisters of the Moon
    11778, -- Mythic: The Desolate Host
    11779, -- Mythic: Maiden of Vigilance
    11780, -- Mythic: Fallen Avatar
    11781, -- Mythic: Kil'jaeden
})

zoneData:Zone(907, { -- Seething Shore (battleground)
    shared.GenericBattleground,
    12409, -- Seething Shore Victory
    12410, -- Seething Shore Veteran
    12404, -- Claim Jumper
    12405, -- Death from Above
    12406, -- A Good Start
    12407, -- Seething Shore Perfection
    12408, -- Seething Shore Domination
    12411, -- Blood and Sand
    12412, -- Master of Seething Shore
})

zoneData:Zone({909, 910, 911, 912, 913, 914, 915, 916, 917, 918, 919, 920}, { -- Antorus, the Burning Throne (raid)
    11987, -- Glory of the Argus Raider
    11988, -- Light's Breach
    11990, -- Hope's End
    11989, -- Forbidden Descent
    11991, -- Seat of the Pantheon
    12110, -- Ahead of the Curve: Argus the Unmaker
    12111, -- Cutting Edge: Argus the Unmaker
    12020, -- Argussy Up
    11930, -- Worm-monger
    12065, -- Hounds Good To Me
    12129, -- This is the War Room!
    11928, -- Portal Combat
    12067, -- Spheres of Influence
    11949, -- Hard to Kill
    12030, -- The World Revolves Around Me
    11948, -- Together We Stand
    12046, -- Remember the Titans
    11915, -- Don't Sweat the Technique
    12257, -- Stardust Crusaders
    11992, -- Mythic: Garothi Worldbreaker
    11993, -- Mythic: Hounds of Sargeras
    11994, -- Mythic: Antoran High Command
    11995, -- Mythic: Portal Keeper Hasabel
    11996, -- Mythic: Eonar
    11997, -- Mythic: Imonar the Soulhunter
    11998, -- Mythic: Kin'garoth
    11999, -- Mythic: Varimathras
    12000, -- Mythic: The Coven of Shivarra
    12001, -- Mythic: Aggramar
    12002, -- Mythic: Argus the Unmaker
})

local argus = {
    12066, -- You Are Now Prepared!
    12073, -- Locked and Loaded
    18854, -- Seeing Red
    12074, -- Shoot First, Loot Later
    12084, -- Infused and Abused
    12028, -- Envision Invasion Eradication
    12026, -- Invasion Obliteration
    12069, -- Explore Argus
    12077, -- Adventurer of Argus
    12078, -- Commander of Argus
    12083, -- Paragon of Argus
    12101, -- We Came Here For Two Reasons
    12102, -- To Kill Demons...
    12103, -- ...And Chew Mana Buns
    12104, -- And We're All Out of Mana Buns
    12076, -- Protector of the Argussian Reach
    12081, -- Officer of the Light
}

zoneData:Zone({830, 831, 832, 833, 882, 883, 884, 885, 886, 887, 905}, argus) -- Argus (Krokuun / Mac'Aree / Antoran Wastes)
zoneData:Zone({921, 922, 923, 924, 925, 926, 927, 928, 929, 930, 931, 932}, argus) -- Argus (Invasion Points)