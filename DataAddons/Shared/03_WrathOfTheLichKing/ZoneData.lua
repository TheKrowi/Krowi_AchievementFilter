local _, addon = ...
addon.Data.ZoneData.Shared.WrathOfTheLichKing = {}
local sharedWotLK = addon.Data.ZoneData.Shared.WrathOfTheLichKing

local zoneData = KrowiAF.NewZoneData("WrathOfTheLichKing")
sharedWotLK.ZoneData = zoneData

sharedWotLK.Ulduar10 = {
    3097, -- Dwarfageddon (10 player)
    2907, -- Three Car Garage (10 player)
    2905, -- Unbroken (10 player)
    2911, -- Shutout (10 player)
    2909, -- Take Out Those Turrets (10 player)
    2913, -- Orbital Bombardment (10 player)
    2914, -- Orbital Devastation (10 player)
    2915, -- Nuked from Orbit (10 player)
    3056, -- Orbit-uary (10 player)
    2925, -- Shattered (10 player)
    2927, -- Hot Pocket (10 player)
    2930, -- Stokin' the Furnace (10 player)
    2919, -- A Quick Shave (10 player)
    2923, -- Iron Dwarf, Medium Rare (10 player)
    2931, -- Nerf Engineering (10 player)
    2933, -- Nerf Scrapbots (10 player)
    2934, -- Nerf Gravity Bombs (10 player)
    2937, -- Must Deconstruct Faster (10 player)
    3058, -- Heartbreaker (10 player)
    2945, -- But I'm On Your Side (10 player)
    2947, -- Can't Do That While Stunned (10 player)
    2939, -- I Choose You, Runemaster Molgeim (10 player)
    2940, -- I Choose You, Stormcaller Brundir (10 player)
    2941, -- I Choose You, Steelbreaker (10 player)
    2955, -- If Looks Could Kill (10 player)
    2959, -- Rubble and Roll (10 player)
    2951, -- With Open Arms (10 player)
    2953, -- Disarmed (10 player)
    3076, -- Nine Lives (10 player)
    3006, -- Crazy Cat Lady (10 player)
    2961, -- Cheese the Freeze (10 player)
    2963, -- I Have the Coolest Friends (10 player)
    2967, -- Getting Cold in Here (10 player)
    2969, -- Staying Buffed All Winter (10 player)
    3182, -- I Could Say That This Cache Was Rare (10 player)
    2971, -- Don't Stand in the Lightning (10 player)
    2973, -- I'll Take You All On (10 player)
    2975, -- Who Needs Bloodlust? (10 player)
    2977, -- Siffed (10 player)
    3176, -- Lose Your Illusion (10 player)
    2979, -- Lumberjacked (10 player)
    2980, -- Con-speed-atory (10 player)
    2985, -- Deforestation (10 player)
    2982, -- Getting Back to Nature (10 player)
    3177, -- Knock on Wood (10 player)
    3178, -- Knock, Knock on Wood (10 player)
    3179, -- Knock, Knock, Knock on Wood (10 player)
    2989, -- Set Up Us the Bomb (10 player)
    3138, -- Not-So-Friendly Fire (10 player)
    3180, -- Firefighter (10 player)
    2996, -- Shadowdodger (10 player)
    3181, -- I Love the Smell of Saronite in the Morning (10 player)
    3009, -- Kiss and Make Up (10 player)
    3008, -- Drive Me Crazy (10 player)
    3012, -- He's Not Getting Any Older (10 player)
    3014, -- They're Coming Out of the Walls (10 player)
    3015, -- In His House He Waits Dreaming (10 player)
    3157, -- Three Lights in the Darkness (10 player)
    3141, -- Two Lights in the Darkness (10 player)
    3158, -- One Light in the Darkness (10 player)
    3159, -- Alone in the Darkness (10 player)
    3003, -- Supermassive (10 player)
    2886, -- The Siege of Ulduar (10 player)
    2888, -- The Antechamber of Ulduar (10 player)
    2890, -- The Keepers of Ulduar (10 player)
    2892, -- The Descent into Madness (10 player)
    2894, -- The Secrets of Ulduar (10 player)
    3036, -- Observed (10 player)
    3004, -- He Feeds On Your Tears (10 player)
    2903, -- Champion of Ulduar
}

sharedWotLK.Ulduar25 = {
    3098, -- Dwarfageddon (25 player)
    2908, -- Three Car Garage (25 player)
    2906, -- Unbroken (25 player)
    2912, -- Shutout (25 player)
    2910, -- Take Out Those Turrets (25 player)
    2918, -- Orbital Bombardment (25 player)
    2916, -- Orbital Devastation (25 player)
    2917, -- Nuked from Orbit (25 player)
    3057, -- Orbit-uary (25 player)
    2926, -- Shattered (25 player)
    2928, -- Hot Pocket (25 player)
    2929, -- Stokin' the Furnace (25 player)
    2921, -- A Quick Shave (25 player)
    2924, -- Iron Dwarf, Medium Rare (25 player)
    2932, -- Nerf Engineering (25 player)
    2935, -- Nerf Scrapbots (25 player)
    2936, -- Nerf Gravity Bombs (25 player)
    2938, -- Must Deconstruct Faster (25 player)
    3059, -- Heartbreaker (25 player)
    2946, -- But I'm On Your Side (25 player)
    2948, -- Can't Do That While Stunned (25 player)
    2942, -- I Choose You, Runemaster Molgeim (25 player)
    2943, -- I Choose You, Stormcaller Brundir (25 player)
    2944, -- I Choose You, Steelbreaker (25 player)
    2956, -- If Looks Could Kill (25 player)
    2960, -- Rubble and Roll (25 player)
    2952, -- With Open Arms (25 player)
    2954, -- Disarmed (25 player)
    3077, -- Nine Lives (25 player)
    3007, -- Crazy Cat Lady (25 player)
    2962, -- Cheese the Freeze (25 player)
    2965, -- I Have the Coolest Friends (25 player)
    2968, -- Getting Cold in Here (25 player)
    2970, -- Staying Buffed All Winter (25 player)
    3184, -- I Could Say That This Cache Was Rare (25 player)
    2972, -- Don't Stand in the Lightning (25 player)
    2974, -- I'll Take You All On (25 player)
    2976, -- Who Needs Bloodlust? (25 player)
    2978, -- Siffed (25 player)
    3183, -- Lose Your Illusion (25 player)
    3118, -- Lumberjacked (25 player)
    2981, -- Con-speed-atory (25 player)
    2984, -- Deforestation (25 player)
    2983, -- Getting Back to Nature (25 player)
    3185, -- Knock on Wood (25 player)
    3186, -- Knock, Knock on Wood (25 player)
    3187, -- Knock, Knock, Knock on Wood (25 player)
    3237, -- Set Up Us the Bomb (25 player)
    2995, -- Not-So-Friendly Fire (25 player)
    3189, -- Firefighter (25 player)
    2997, -- Shadowdodger (25 player)
    3188, -- I Love the Smell of Saronite in the Morning (25 player)
    3011, -- Kiss and Make Up (25 player)
    3010, -- Drive Me Crazy (25 player)
    3013, -- He's Not Getting Any Older (25 player)
    3017, -- They're Coming Out of the Walls (25 player)
    3016, -- In His House He Waits Dreaming (25 player)
    3161, -- Three Lights in the Darkness (25 player)
    3162, -- Two Lights in the Darkness (25 player)
    3163, -- One Light in the Darkness (25 player)
    3164, -- Alone in the Darkness (25 player)
    3002, -- Supermassive (25 player)
    2887, -- The Siege of Ulduar (25 player)
    2889, -- The Antechamber of Ulduar (25 player)
    2891, -- The Keepers of Ulduar (25 player)
    2893, -- The Descent into Madness (25 player)
    2895, -- The Secrets of Ulduar (25 player)
    3037, -- Observed (25 player)
    3005, -- He Feeds On Your Tears (25 player)
    2904, -- Conqueror of Ulduar
}

sharedWotLK.Naxxramas10 = {
    1997, -- Momma Said Knock You Out (10 player)
    1858, -- Arachnophobia (10 player)
    1856, -- Make Quick Werk of Him (10 player)
    2178, -- Shocking! (10 player)
    2180, -- Subtraction (10 player)
    1996, -- The Safety Dance (10 player)
    2182, -- Spore Loser (10 player)
    2176, -- And They Would All Go Down Together (10 player)
    2146, -- The Hundred Club (10 player)
    2184, -- Just Can't Get Enough (10 player)
    578, -- The Dedicated Few (10 player)
    562, -- The Arachnid Quarter (10 player)
    564, -- The Construct Quarter (10 player)
    566, -- The Plague Quarter (10 player)
    568, -- The Military Quarter (10 player)
    572, -- Sapphiron's Demise (10 player)
    574, -- Kel'Thuzad's Defeat (10 player)
    576, -- The Fall of Naxxramas (10 player)
    2187, -- The Undying
}

sharedWotLK.Naxxramas25 = {
    2140, -- Momma Said Knock You Out (25 player)
    1859, -- Arachnophobia (25 player)
    1857, -- Make Quick Werk of Him (25 player)
    2179, -- Shocking! (25 player)
    2181, -- Subtraction (25 player)
    2139, -- The Safety Dance (25 player)
    2183, -- Spore Loser (25 player)
    2177, -- And They Would All Go Down Together (25 player)
    2147, -- The Hundred Club (25 player)
    2185, -- Just Can't Get Enough (25 player)
    579, -- The Dedicated Few (25 player)
    563, -- The Arachnid Quarter (25 player)
    565, -- The Construct Quarter (25 player)
    567, -- The Plague Quarter (25 player)
    569, -- The Military Quarter (25 player)
    573, -- Sapphiron's Demise (25 player)
    575, -- Kel'Thuzad's Defeat (25 player)
    577, -- The Fall of Naxxramas (25 player)
    2186, -- The Immortal
}

sharedWotLK.Northrend = {
    1008, -- The Kirin Tor
    1009, -- Knights of the Ebon Blade
    1010, -- Northrend Vanguard
    1011, -- The Winds of the North
    1012, -- The Winds of the North
    2556, -- Pest Control
}

sharedWotLK.GrizzlyHills = {
    37, -- Fo' Grizzle My Shizzle
    1357, -- Fo' Grizzle My Shizzle
    1266, -- Explore Grizzly Hills
    2016, -- Grizzled Veteran
    2017, -- Grizzled Veteran
}

sharedWotLK.SholazarBasin = {
    2556, -- Pest Control
    39, -- Into the Basin
    961, -- Honorary Frenzyheart
    962, -- Savior of the Oracles
    938, -- The Snows of Northrend
    941, -- Hemet Nesingwary: The Collected Quests
    1268, -- Explore Sholazar Basin
    950, -- Frenzyheart Tribe
    951, -- The Oracles
    952, -- Mercenary of Sholazar
}

sharedWotLK.StormPeaks = {
    1012, -- The Winds of the North
    2556, -- Pest Control
    38, -- The Summit of Storm Peaks
    1428, -- Mine Sweeper
    1269, -- Explore Storm Peaks
    2082, -- Ice Mammoth
    2083, -- Grand Ice Mammoth
}

sharedWotLK.ArgentTournament = {
    2756, -- Argent Aspiration
    2758, -- Argent Valor
    2772, -- Tilted!
    2836, -- Lance a Lot
    2773, -- It's Just a Flesh Wound
    3736, -- Pony Up!
    2777, -- Champion of Darnassus
    2787, -- Champion of the Undercity
    2760, -- Exalted Champion of Darnassus
    2769, -- Exalted Champion of the Undercity
    2778, -- Champion of the Exodar
    2785, -- Champion of Silvermoon City
    2761, -- Exalted Champion of the Exodar
    2767, -- Exalted Champion of Silvermoon City
    2779, -- Champion of Gnomeregan
    2786, -- Champion of Thunder Bluff
    2762, -- Exalted Champion of Gnomeregan
    2768, -- Exalted Champion of Thunder Bluff
    2780, -- Champion of Ironforge
    2784, -- Champion of Sen'jin
    2763, -- Exalted Champion of Ironforge
    2766, -- Exalted Champion of Sen'jin
    2781, -- Champion of Stormwind
    2783, -- Champion of Orgrimmar
    2764, -- Exalted Champion of Stormwind
    2765, -- Exalted Champion of Orgrimmar
    2782, -- Champion of the Alliance
    2788, -- Champion of the Horde
    2770, -- Exalted Champion of the Alliance
    2771, -- Exalted Champion of the Horde
    2817, -- Exalted Argent Champion of the Alliance
    2816, -- Exalted Argent Champion of the Horde
    3676, -- A Silver Confidant
    3677, -- The Sunreavers
    4596, -- The Sword in the Skull
}

sharedWotLK.TheNexus = {
    2150, -- Split Personality
    2037, -- Chaos Theory
    2036, -- Intense Cold
    478, -- The Nexus
    490, -- Heroic: The Nexus
}

sharedWotLK.CullingOfStratholme = {
    1872, -- Zombiefest!
    1817, -- The Culling of Time
    479, -- The Culling of Stratholme
    500, -- Heroic: The Culling of Stratholme
}

sharedWotLK.AhnKahet = {
    2038, -- Respect Your Elders
    2056, -- Volunteer Work
    1862, -- Volazj's Quick Demise
    481, -- Ahn'kahet: The Old Kingdom
    492, -- Heroic: Ahn'kahet: The Old Kingdom
}

sharedWotLK.UtgardeKeep = {
    1919, -- On The Rocks
    477, -- Utgarde Keep
    489, -- Heroic: Utgarde Keep
}

sharedWotLK.UtgardePinnacle = {
    2043, -- The Incredible Hulk
    1873, -- Lodi Dodi We Loves the Skadi
    2156, -- My Girl Loves to Skadi All the Time
    2157, -- King's Bane
    488, -- Utgarde Pinnacle
    499, -- Heroic: Utgarde Pinnacle
}

sharedWotLK.HallsOfLightning = {
    1834, -- Lightning Struck
    2042, -- Shatter Resistant
    1867, -- Timely Death
    486, -- Halls of Lightning
    497, -- Heroic: Halls of Lightning
}

sharedWotLK.HallsOfStone = {
    1866, -- Good Grief
    2154, -- Brann Spankin' New
    2155, -- Abuse the Ooze
    485, -- Halls of Stone
    496, -- Heroic: Halls of Stone
}

sharedWotLK.TheOculus = {
    1868, -- Make It Count
    2046, -- Amber Void
    2045, -- Emerald Void
    2044, -- Ruby Void
    1871, -- Experienced Drake Rider
    487, -- The Oculus
    498, -- Heroic: The Oculus
}

sharedWotLK.Gundrak = {
    2058, -- Snakes. Why'd It Have To Be Snakes?
    2040, -- Less-rabi
    1864, -- What the Eck?
    2152, -- Share The Love
    484, -- Gundrak
    495, -- Heroic: Gundrak
}

sharedWotLK.AzjolNerub = {
    1296, -- Watch Him Die
    1297, -- Hadronox Denied
    1860, -- Gotta Go!
    480, -- Azjol-Nerub
    491, -- Heroic: Azjol-Nerub
}

sharedWotLK.DrakTharonKeep = {
    2151, -- Consumption Junction
    2057, -- Oh Novos!
    2039, -- Better Off Dred
    482, -- Drak'Tharon Keep
    493, -- Heroic: Drak'Tharon Keep
}

sharedWotLK.TheVioletHold = {
    1865, -- Lockdown!
    2041, -- Dehydration
    2153, -- A Void Dance
    1816, -- Defenseless
    483, -- The Violet Hold
    494, -- Heroic: The Violet Hold
}

sharedWotLK.TrialOfTheChampion = {
    3803, -- The Faceroller
    3802, -- Argent Confessor
    3804, -- I've Had Worse
    3778, -- Trial of the Champion
    4296, -- Trial of the Champion
    4297, -- Heroic: Trial of the Champion
    4298, -- Heroic: Trial of the Champion
}

sharedWotLK.PitOfSaron = {
    4524, -- Doesn't Go to Eleven
    4525, -- Don't Look Up
    4517, -- The Pit of Saron
    4520, -- Heroic: The Pit of Saron
}

sharedWotLK.TrialOfTheCrusader10 = {
    3797, -- Upper Back Pain (10 player)
    3936, -- Not One, But Two Jormungars (10 player)
    3996, -- Three Sixty Pain Spike (10 player)
    3798, -- Resilience Will Fix It (10 player)
    3799, -- Salt and Pepper (10 player)
    3800, -- The Traitor King (10 player)
    3917, -- Call of the Crusade (10 player)
    3918, -- Call of the Grand Crusade (10 player)
    3808, -- A Tribute to Skill (10 player)
    3809, -- A Tribute to Mad Skill (10 player)
    3810, -- A Tribute to Insanity (10 player)
    4080, -- A Tribute to Dedicated Insanity
}

sharedWotLK.TrialOfTheCrusader25 = {
    3813, -- Upper Back Pain (25 player)
    3937, -- Not One, But Two Jormungars (25 player)
    3997, -- Three Sixty Pain Spike (25 player)
    3815, -- Salt and Pepper (25 player)
    3816, -- The Traitor King (25 player)
    3916, -- Call of the Crusade (25 player)
    3812, -- Call of the Grand Crusade (25 player)
    3817, -- A Tribute to Skill (25 player)
    3818, -- A Tribute to Mad Skill (25 player)
    3819, -- A Tribute to Insanity (25 player)
    4156, -- A Tribute to Immortality
    4079, -- A Tribute to Immortality
}

sharedWotLK.IcecrownCitadel10 = {
    4534, -- Boned (10 player)
    4535, -- Full House (10 player)
    4536, -- I'm on a Boat (10 player)
    4537, -- I've Gone and Made a Mess (10 player)
    4577, -- Flu Shot Shortage (10 player)
    4538, -- Dances with Oozes (10 player)
    4578, -- Nausea, Heartburn, Indigestion... (10 player)
    4582, -- The Orb Whisperer (10 player)
    4539, -- Once Bitten, Twice Shy (10 player)
    4579, -- Portal Jockey (10 player)
    4580, -- All You Can Eat (10 player)
    4601, -- Been Waiting a Long Time for This (10 player)
    4581, -- Neck-Deep in Vile (10 player)
    4531, -- Storming the Citadel (10 player)
    4528, -- The Plagueworks (10 player)
    4529, -- The Crimson Hall (10 player)
    4527, -- The Frostwing Halls (10 player)
    4530, -- The Frozen Throne (10 player)
    4532, -- Fall of the Lich King (10 player)
    4628, -- Heroic: Storming the Citadel (10 player)
    4629, -- Heroic: The Plagueworks (10 player)
    4630, -- Heroic: The Crimson Hall (10 player)
    4631, -- Heroic: The Frostwing Halls (10 player)
    4583, -- Bane of the Fallen King
    4636, -- Heroic: Fall of the Lich King (10 player)
}

sharedWotLK.IcecrownCitadel25 = {
    4610, -- Boned (25 player)
    4611, -- Full House (25 player)
    4612, -- I'm on a Boat (25 player)
    4613, -- I've Gone and Made a Mess (25 player)
    4615, -- Flu Shot Shortage (25 player)
    4614, -- Dances with Oozes (25 player)
    4616, -- Nausea, Heartburn, Indigestion... (25 player)
    4617, -- The Orb Whisperer (25 player)
    4618, -- Once Bitten, Twice Shy (25 player)
    4619, -- Portal Jockey (25 player)
    4620, -- All You Can Eat (25 player)
    4621, -- Been Waiting a Long Time for This (25 player)
    4622, -- Neck-Deep in Vile (25 player)
    4604, -- Storming the Citadel (25 player)
    4605, -- The Plagueworks (25 player)
    4606, -- The Crimson Hall (25 player)
    4607, -- The Frostwing Halls (25 player)
    4597, -- The Frozen Throne (25 player)
    4608, -- Fall of the Lich King (25 player)
    4632, -- Heroic: Storming the Citadel (25 player)
    4633, -- Heroic: The Plagueworks (25 player)
    4634, -- Heroic: The Crimson Hall (25 player)
    4635, -- Heroic: The Frostwing Halls (25 player)
    4584, -- The Light of Dawn
    4637, -- Heroic: Fall of the Lich King (25 player)
}

sharedWotLK.OnyxiasLair10 = {
    4402, -- More Dots! (10 player)
    4403, -- Many Whelps! Handle It! (10 player)
    4404, -- She Deep Breaths More (10 player)
    4396, -- Onyxia's Lair (10 player)
}

sharedWotLK.OnyxiasLair25 = {
    4405, -- More Dots! (25 player)
    4406, -- Many Whelps! Handle It! (25 player)
    4407, -- She Deep Breaths More (25 player)
    4397, -- Onyxia's Lair (25 player)
}

zoneData:Zone(125, { -- Dalaran (city)
    1008, -- The Kirin Tor
    1010, -- Northrend Vanguard
    1956, -- Higher Learning
    2084, -- Ring of the Kirin Tor
    2076, -- Armored Brown Bear
    2077, -- Wooly Mammoth
    2078, -- Traveler's Tundra Mammoth
    2094, -- A Penny For Your Thoughts
    2095, -- Silver in the City
    1957, -- There's Gold In That There Fountain
    1958, -- I Smell A Giant Rat
    2096, -- The Coin Master
})

zoneData:Zone(126, { -- Dalaran - The Underbelly
    1008, -- The Kirin Tor
    1010, -- Northrend Vanguard
    2556, -- Pest Control
    1956, -- Higher Learning
    2084, -- Ring of the Kirin Tor
    2076, -- Armored Brown Bear
    2077, -- Wooly Mammoth
    2078, -- Traveler's Tundra Mammoth
    2094, -- A Penny For Your Thoughts
    2095, -- Silver in the City
    1957, -- There's Gold In That There Fountain
    1958, -- I Smell A Giant Rat
    2096, -- The Coin Master
})

zoneData:Zone(128, nil) -- Strand of the Ancients (battleground)

zoneData:Zone(141, nil, { -- The Eye of Eternity (raid)
    2148, -- Denyin' the Scion (10 player)
    1874, -- You Don't Have an Eternity (10 player)
    1869, -- A Poke in the Eye (10 player)
    622, -- The Spellweaver's Downfall (10 player)
}, {
    2149, -- Denyin' the Scion (25 player)
    1875, -- You Don't Have an Eternity (25 player)
    1870, -- A Poke in the Eye (25 player)
    623, -- The Spellweaver's Downfall (25 player)
})

zoneData:Zone(155, nil, { -- The Obsidian Sanctum (raid)
    2047, -- Gonna Go When the Volcano Blows (10 player)
    2049, -- Twilight Assist (10 player)
    2050, -- Twilight Duo (10 player)
    2051, -- The Twilight Zone (10 player)
    624, -- Less Is More (10 player)
    1876, -- Besting the Black Dragonflight (10 player)
}, {
    2048, -- Gonna Go When the Volcano Blows (25 player)
    2052, -- Twilight Assist (25 player)
    2053, -- Twilight Duo (25 player)
    2054, -- The Twilight Zone (25 player)
    1877, -- Less Is More (25 player)
    625, -- Besting the Black Dragonflight (25 player)
})

zoneData:Zone(156, { -- Vault of Archavon (raid)
    2081, -- Grand Black War Mammoth
}, {
    4016, -- Earth, Wind & Fire (10 player)
    1722, -- Archavon the Stone Watcher (10 player)
    3136, -- Emalon the Storm Watcher (10 player)
    3836, -- Koralon the Flame Watcher (10 player)
    4585, -- Toravon the Ice Watcher (10 player)
}, {
    4017, -- Earth, Wind & Fire (25 player)
    1721, -- Archavon the Stone Watcher (25 player)
    3137, -- Emalon the Storm Watcher (25 player)
    3837, -- Koralon the Flame Watcher (25 player)
    4586, -- Toravon the Ice Watcher (25 player)
})

zoneData:Zone(169, { -- Isle of Conquest (battleground)
    3776, -- Isle of Conquest Victory
    3777, -- Isle of Conquest Veteran
    3851, -- Mine
    4177, -- Mine
    3847, -- Four Car Garage
    3848, -- A-bomb-inable
    3849, -- A-bomb-ination
    3850, -- Mowed Down
    3852, -- Cut the Blue Wire... No the Red Wire!
    3853, -- All Over the Isle
    3854, -- Back Door Job
    3856, -- Demolition Derby
    4256, -- Demolition Derby
    3855, -- Glaive Grave
    3857, -- Master of Isle of Conquest
    3957, -- Master of Isle of Conquest
    3845, -- Isle of Conquest All-Star
    3846, -- Resource Glut
    4176, -- Resource Glut
})

zoneData:Zone(183, { -- The Forge of Souls (dungeon)
    4522, -- Soul Power
    4523, -- Three Faced
    4516, -- The Forge of Souls
    4519, -- Heroic: The Forge of Souls
})

zoneData:Zone(185, { -- Halls of Reflection (dungeon)
    4526, -- We're Not Retreating; We're Advancing in a Different Direction.
    4518, -- The Halls of Reflection
    4521, -- Heroic: The Halls of Reflection
})

zoneData:Zone(200, nil, { -- The Ruby Sanctum (raid)
    4817, -- The Twilight Destroyer (10 player)
    4818, -- Heroic: The Twilight Destroyer (10 player)
}, {
    4815, -- The Twilight Destroyer (25 player)
    4816, -- Heroic: The Twilight Destroyer (25 player)
})