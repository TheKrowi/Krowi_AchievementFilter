local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["03_01_00"] = {
    { -- Hard Boiled
        2416,
        {
            {"Event", 181},
        },
    },
    { -- Chocolate Lover
        2417,
        {
            {"Event", 181},
        },
    },
    { -- Chocoholic
        2418,
        {
            {"Event", 181},
        },
    },
    { -- Spring Fling
        2419,
        faction.Alliance,
        2497,
        {
            {"Event", 181},
        },
    },
    { -- Noble Garden
        2420,
        faction.Horde,
        2421,
        {
            {"Event", 181},
        },
    },
    { -- Noble Garden
        2421,
        faction.Alliance,
        2420,
        {
            {"Event", 181},
        },
    },
    { -- Shake Your Bunny-Maker
        2422,
        {
            {"Event", 181},
        },
    },
    { -- Desert Rose
        2436,
        {
            {"Event", 181},
        },
    },
    { -- Blushing Bride
        2576,
        {
            {"Event", 181},
        },
    },
    { -- I Found One!
        2676,
        {
            {"Event", 181},
        },
    },
    { -- Argent Aspiration
        2756,
    },
    { -- Argent Valor
        2758,
    },
    { -- Exalted Champion of Darnassus
        2760,
        faction.Alliance,
        2769,
    },
    { -- Exalted Champion of the Exodar
        2761,
        faction.Alliance,
        2767,
    },
    { -- Exalted Champion of Gnomeregan
        2762,
        faction.Alliance,
        2768,
    },
    { -- Exalted Champion of Ironforge
        2763,
        faction.Alliance,
        2766,
    },
    { -- Exalted Champion of Stormwind
        2764,
        faction.Alliance,
        2765,
    },
    { -- Exalted Champion of Orgrimmar
        2765,
        faction.Horde,
        2764,
    },
    { -- Exalted Champion of Sen'jin
        2766,
        faction.Horde,
        2763,
    },
    { -- Exalted Champion of Silvermoon City
        2767,
        faction.Horde,
        2761,
    },
    { -- Exalted Champion of Thunder Bluff
        2768,
        faction.Horde,
        2762,
    },
    { -- Exalted Champion of the Undercity
        2769,
        faction.Horde,
        2760,
    },
    { -- Exalted Champion of the Alliance
        2770,
        faction.Alliance,
        2771,
    },
    { -- Exalted Champion of the Horde
        2771,
        faction.Horde,
        2770,
    },
    { -- Tilted!
        2772,
    },
    { -- It's Just a Flesh Wound
        2773,
    },
    { -- Champion of Darnassus
        2777,
        faction.Alliance,
        2787,
    },
    { -- Champion of the Exodar
        2778,
        faction.Alliance,
        2785,
    },
    { -- Champion of Gnomeregan
        2779,
        faction.Alliance,
        2786,
    },
    { -- Champion of Ironforge
        2780,
        faction.Alliance,
        2784,
    },
    { -- Champion of Stormwind
        2781,
        faction.Alliance,
        2783,
    },
    { -- Champion of the Alliance
        2782,
        faction.Alliance,
        2788,
    },
    { -- Champion of Orgrimmar
        2783,
        faction.Horde,
        2781,
    },
    { -- Champion of Sen'jin
        2784,
        faction.Horde,
        2780,
    },
    { -- Champion of Silvermoon City
        2785,
        faction.Horde,
        2778,
    },
    { -- Champion of Thunder Bluff
        2786,
        faction.Horde,
        2779,
    },
    { -- Champion of the Undercity
        2787,
        faction.Horde,
        2777,
    },
    { -- Champion of the Horde
        2788,
        faction.Horde,
        2782,
    },
    { -- Noble Gardener
        2798,
        {
            {"Event", 181},
        },
    },
    { -- Exalted Argent Champion of the Horde
        2816,
        faction.Horde,
        2817,
    },
    { -- Exalted Argent Champion of the Alliance
        2817,
        faction.Alliance,
        2816,
    },
    { -- Lance a Lot
        2836,
    },
    { -- The Siege of Ulduar (10 player)
        2886,
    },
    { -- The Siege of Ulduar (25 player)
        2887,
    },
    { -- The Antechamber of Ulduar (10 player)
        2888,
    },
    { -- The Antechamber of Ulduar (25 player)
        2889,
    },
    { -- The Keepers of Ulduar (10 player)
        2890,
    },
    { -- The Keepers of Ulduar (25 player)
        2891,
    },
    { -- The Descent into Madness (10 player)
        2892,
    },
    { -- The Descent into Madness (25 player)
        2893,
    },
    { -- The Secrets of Ulduar (10 player)
        2894,
    },
    { -- The Secrets of Ulduar (25 player)
        2895,
    },
    { -- Champion of Ulduar
        2903,
    },
    { -- Conqueror of Ulduar
        2904,
    },
    { -- Unbroken (10 player)
        2905,
    },
    { -- Unbroken (25 player)
        2906,
    },
    { -- Three Car Garage (10 player)
        2907,
    },
    { -- Three Car Garage (25 player)
        2908,
    },
    { -- Take Out Those Turrets (10 player)
        2909,
    },
    { -- Take Out Those Turrets (25 player)
        2910,
    },
    { -- Shutout (10 player)
        2911,
    },
    { -- Shutout (25 player)
        2912,
    },
    { -- Orbital Bombardment (10 player)
        2913,
    },
    { -- Orbital Devastation (10 player)
        2914,
    },
    { -- Nuked from Orbit (10 player)
        2915,
    },
    { -- Orbital Devastation (25 player)
        2916,
    },
    { -- Nuked from Orbit (25 player)
        2917,
    },
    { -- Orbital Bombardment (25 player)
        2918,
    },
    { -- A Quick Shave (10 player)
        2919,
    },
    { -- A Quick Shave (25 player)
        2921,
    },
    { -- "Iron Dwarf, Medium Rare (10 player)"
        2923,
    },
    { -- "Iron Dwarf, Medium Rare (25 player)"
        2924,
    },
    { -- Shattered (10 player)
        2925,
    },
    { -- Shattered (25 player)
        2926,
    },
    { -- Hot Pocket (10 player)
        2927,
    },
    { -- Hot Pocket (25 player)
        2928,
    },
    { -- Stokin' the Furnace (25 player)
        2929,
    },
    { -- Stokin' the Furnace (10 player)
        2930,
    },
    { -- Nerf Engineering (10 player)
        2931,
    },
    { -- Nerf Engineering (25 player)
        2932,
    },
    { -- Nerf Scrapbots (10 player)
        2933,
    },
    { -- Nerf Gravity Bombs (10 player)
        2934,
    },
    { -- Nerf Scrapbots (25 player)
        2935,
    },
    { -- Nerf Gravity Bombs (25 player)
        2936,
    },
    { -- Must Deconstruct Faster (10 player)
        2937,
    },
    { -- Must Deconstruct Faster (25 player)
        2938,
    },
    { -- "I Choose You, Runemaster Molgeim (10 player)"
        2939,
    },
    { -- "I Choose You, Stormcaller Brundir (10 player)"
        2940,
    },
    { -- "I Choose You, Steelbreaker (10 player)"
        2941,
    },
    { -- "I Choose You, Runemaster Molgeim (25 player)"
        2942,
    },
    { -- "I Choose You, Stormcaller Brundir (25 player)"
        2943,
    },
    { -- "I Choose You, Steelbreaker (25 player)"
        2944,
    },
    { -- But I'm On Your Side (10 player)
        2945,
    },
    { -- But I'm On Your Side (25 player)
        2946,
    },
    { -- Can't Do That While Stunned (10 player)
        2947,
    },
    { -- Can't Do That While Stunned (25 player)
        2948,
    },
    { -- With Open Arms (10 player)
        2951,
    },
    { -- With Open Arms (25 player)
        2952,
    },
    { -- Disarmed (10 player)
        2953,
    },
    { -- Disarmed (25 player)
        2954,
    },
    { -- If Looks Could Kill (10 player)
        2955,
    },
    { -- If Looks Could Kill (25 player)
        2956,
    },
    { -- Glory of the Ulduar Raider (10 player)
        2957,
    },
    { -- Glory of the Ulduar Raider (25 player)
        2958,
    },
    { -- Rubble and Roll (10 player)
        2959,
    },
    { -- Rubble and Roll (25 player)
        2960,
    },
    { -- Cheese the Freeze (10 player)
        2961,
    },
    { -- Cheese the Freeze (25 player)
        2962,
    },
    { -- I Have the Coolest Friends (10 player)
        2963,
    },
    { -- I Have the Coolest Friends (25 player)
        2965,
    },
    { -- Getting Cold in Here (10 player)
        2967,
    },
    { -- Getting Cold in Here (25 player)
        2968,
    },
    { -- Staying Buffed All Winter (10 player)
        2969,
    },
    { -- Staying Buffed All Winter (25 player)
        2970,
    },
    { -- Don't Stand in the Lightning (10 player)
        2971,
    },
    { -- Don't Stand in the Lightning (25 player)
        2972,
    },
    { -- I'll Take You All On (10 player)
        2973,
    },
    { -- I'll Take You All On (25 player)
        2974,
    },
    { -- Who Needs Bloodlust? (10 player)
        2975,
    },
    { -- Who Needs Bloodlust? (25 player)
        2976,
    },
    { -- Siffed (10 player)
        2977,
    },
    { -- Siffed (25 player)
        2978,
    },
    { -- Lumberjacked (10 player)
        2979,
    },
    { -- Con-speed-atory (10 player)
        2980,
    },
    { -- Con-speed-atory (25 player)
        2981,
    },
    { -- Getting Back to Nature (10 player)
        2982,
    },
    { -- Getting Back to Nature (25 player)
        2983,
    },
    { -- Deforestation (25 player)
        2984,
    },
    { -- Deforestation (10 player)
        2985,
    },
    { -- Set Up Us the Bomb (10 player)
        2989,
    },
    { -- Not-So-Friendly Fire (25 player)
        2995,
    },
    { -- Shadowdodger (10 player)
        2996,
    },
    { -- Shadowdodger (25 player)
        2997,
    },
    { -- Supermassive (25 player)
        3002,
    },
    { -- Supermassive (10 player)
        3003,
    },
    { -- He Feeds On Your Tears (10 player)
        3004,
    },
    { -- He Feeds On Your Tears (25 player)
        3005,
    },
    { -- Crazy Cat Lady (10 player)
        3006,
    },
    { -- Crazy Cat Lady (25 player)
        3007,
    },
    { -- Drive Me Crazy (10 player)
        3008,
    },
    { -- Kiss and Make Up (10 player)
        3009,
    },
    { -- Drive Me Crazy (25 player)
        3010,
    },
    { -- Kiss and Make Up (25 player)
        3011,
    },
    { -- He's Not Getting Any Older (10 player)
        3012,
    },
    { -- He's Not Getting Any Older (25 player)
        3013,
    },
    { -- They're Coming Out of the Walls (10 player)
        3014,
    },
    { -- In His House He Waits Dreaming (10 player)
        3015,
    },
    { -- In His House He Waits Dreaming (25 player)
        3016,
    },
    { -- They're Coming Out of the Walls (25 player)
        3017,
    },
    { -- Observed (10 player)
        3036,
    },
    { -- Observed (25 player)
        3037,
    },
    { -- Orbit-uary (10 player)
        3056,
    },
    { -- Orbit-uary (25 player)
        3057,
    },
    { -- Heartbreaker (10 player)
        3058,
    },
    { -- Heartbreaker (25 player)
        3059,
    },
    { -- Nine Lives (10 player)
        3076,
    },
    { -- Nine Lives (25 player)
        3077,
    },
    { -- Deadly Gladiator's Frost Wyrm
        3096,
        {
            IsPvP = true,
        },
    },
    { -- Dwarfageddon (10 player)
        3097,
    },
    { -- Dwarfageddon (25 player)
        3098,
    },
    { -- Realm First! Death's Demise
        3117,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Lumberjacked (25 player)
        3118,
    },
    { -- Emalon the Storm Watcher (10 player)
        3136,
    },
    { -- Emalon the Storm Watcher (25 player)
        3137,
    },
    { -- Not-So-Friendly Fire (10 player)
        3138,
    },
    { -- Two Lights in the Darkness (10 player)
        3141,
    },
    { -- "Val'anyr, Hammer of Ancient Kings"
        3142,
    },
    { -- Three Lights in the Darkness (10 player)
        3157,
    },
    { -- One Light in the Darkness (10 player)
        3158,
    },
    { -- Alone in the Darkness (10 player)
        3159,
    },
    { -- Three Lights in the Darkness (25 player)
        3161,
    },
    { -- Two Lights in the Darkness (25 player)
        3162,
    },
    { -- One Light in the Darkness (25 player)
        3163,
    },
    { -- Alone in the Darkness (25 player)
        3164,
    },
    { -- Lose Your Illusion (10 player)
        3176,
    },
    { -- Knock on Wood (10 player)
        3177,
    },
    { -- "Knock, Knock on Wood (10 player)"
        3178,
    },
    { -- "Knock, Knock, Knock on Wood (10 player)"
        3179,
    },
    { -- Firefighter (10 player)
        3180,
    },
    { -- I Love the Smell of Saronite in the Morning (10 player)
        3181,
    },
    { -- I Could Say That This Cache Was Rare (10 player)
        3182,
    },
    { -- Lose Your Illusion (25 player)
        3183,
    },
    { -- I Could Say That This Cache Was Rare (25 player)
        3184,
    },
    { -- Knock on Wood (25 player)
        3185,
    },
    { -- "Knock, Knock on Wood (25 player)"
        3186,
    },
    { -- "Knock, Knock, Knock on Wood (25 player)"
        3187,
    },
    { -- I Love the Smell of Saronite in the Morning (25 player)
        3188,
    },
    { -- Firefighter (25 player)
        3189,
    },
    { -- Chasing Marcia
        3217,
    },
    { -- Turtles All the Way Down
        3218,
    },
    { -- Set Up Us the Bomb (25 player)
        3237,
    },
    { -- Realm First! Celestial Defender
        3259,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Cooking with Style
        3296,
    },
    { -- Herald of the Titans
        3316,
    },
    { -- Deadly Gladiator
        3336,
        {
            IsPvP = true,
        },
    },
    { -- Winterspring Frostsaber
        3356,
        faction.Alliance,
        3357,
    },
    { -- Venomhide Ravasaur
        3357,
        faction.Horde,
        3356,
    },
    { -- Furious Gladiator
        3436,
        {
            IsPvP = true,
        },
    },
    { -- A Silver Confidant
        3676,
        faction.Alliance,
        3677,
    },
    { -- The Sunreavers
        3677,
        faction.Horde,
        3676,
    },
    { -- Pony Up!
        3736,
    },
    { -- Furious Gladiator's Frost Wyrm
        3756,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 3, 1, 0}, -- Rework loading so this can go to the top, future me problem
};