local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_02_00"] = {
    { -- Patron of War
        10537,
    },
    { -- Extinguishing Draenor
        11276,
        faction.Alliance,
        11277,
    },
    { -- Extinguishing Draenor
        11277,
        faction.Horde,
        11276,
    },
    { -- Extinguishing the Broken Isles
        11278,
        faction.Alliance,
        11279,
    },
    { -- Extinguishing the Broken Isles
        11279,
        faction.Horde,
        11278,
    },
    { -- Flame Warden of the Broken Isles
        11280,
        faction.Alliance,
        11282,
    },
    { -- Flame Keeper of the Broken Isles
        11282,
        faction.Horde,
        11280,
    },
    { -- Flame Warden of Draenor
        11283,
        faction.Alliance,
        11284,
    },
    { -- Flame Keeper of Draenor
        11284,
        faction.Horde,
        11283,
    },
    { -- Murloc Battlemasters
        11294,
    },
    { -- Raiding with Leashes IV: Wrath of the Lick King
        11320,
    },
    { -- Season Tickets
        11335,
    },
    { -- You Runed Everything!
        11337,
    },
    { -- Dine and Bash
        11338,
    },
    { -- Insurrection
        11340,
    },
    { -- Patient Zero
        11377,
    },
    { -- Boneafide Tri Tip
        11386,
    },
    { -- The Chosen
        11387,
    },
    { -- Trial of Valor
        11394,
    },
    { -- Diablo's 20th Anniversary
        11395,
    },
    { -- Mythic: Odyn
        11396,
    },
    { -- Mythic: Guarm
        11397,
    },
    { -- Mythic: Helya
        11398,
    },
    { -- Herald of Flames
        11425,
    },
    { -- Heroic: Trial of Valor
        11426,
    },
    { -- No Shellfish Endeavor
        11427,
    },
    { -- Mythic: Return to Karazhan
        11429,
    },
    { -- One Night in Karazhan
        11430,
    },
    { -- The Rat Pack
        11431,
    },
    { -- Scared Straight
        11432,
    },
    { -- Burn After Reading
        11433,
    },
    { -- "Broken Isles Pathfinder, Part Two"
        11446,
    },
    { -- Alive for Five
        11468,
        {
            IsPvP = true,
        },
    },
    { -- The River Six
        11469,
        {
            IsPvP = true,
        },
    },
    { -- Slayin' to Seven
        11470,
        {
            IsPvP = true,
        },
    },
    { -- "Don't Hate, Grind to Eight"
        11471,
        {
            IsPvP = true,
        },
    },
    { -- "Hell, It's About Nine"
        11472,
        {
            IsPvP = true,
        },
    },
    { -- "Free For All, More For Me"
        11474,
        {
            IsPvP = true,
        },
    },
    { -- Mission Accomplished
        11475,
    },
    { -- Saddle Sore
        11476,
    },
    { -- Off the Top Rook
        11477,
    },
    { -- The Darkbrul-oh
        11478,
    },
    { -- Explore Broken Shore
        11543,
    },
    { -- Defender of the Broken Isles
        11544,
    },
    { -- Legionfall Commander
        11545,
    },
    { -- Breaching the Tomb
        11546,
    },
    { -- The First Rule of Brawler's Guild
        11558,
        faction.Alliance,
        11559,
    },
    { -- The First Rule of Brawler's Guild
        11559,
        faction.Horde,
        11558,
    },
    { -- You Are Not Your $#*@! Legplates (Season 3)
        11560,
        faction.Alliance,
        11561,
    },
    { -- You Are Not Your $#*@! Legplates (Season 3)
        11561,
        faction.Horde,
        11560,
    },
    { -- The Second Rule of Brawler's Guild (Season 3)
        11563,
        faction.Alliance,
        11564,
    },
    { -- The Second Rule of Brawler's Guild (Season 3)
        11564,
        faction.Horde,
        11563,
    },
    { -- King of the Guild (Season 3)
        11565,
        faction.Alliance,
        11566,
    },
    { -- King of the Guild (Season 3)
        11566,
        faction.Horde,
        11565,
    },
    { -- You Are Not The Contents Of Your Wallet
        11567,
    },
    { -- Educated Guesser
        11570,
    },
    { -- I Am Thrall's Complete Lack Of Surprise (Season 3)
        11572,
    },
    { -- Rumble Club
        11573,
    },
    { -- Vindictive Elite
        11578,
        {
            IsPvP = true,
        },
    },
    { -- Fearless Elite
        11579,
        {
            IsPvP = true,
        },
    },
    { -- Cutting Edge: Helya
        11580,
    },
    { -- Ahead of the Curve: Helya
        11581,
    },
    { -- They See Me Rolling
        11607,
    },
    { -- Power Unbound
        11609,
    },
    { -- Power Unleashed
        11610,
    },
    { -- A Challenging Look
        11611,
    },
    { -- Fighting with Style: Challenging
        11612,
    },
    { -- That's So Last Millennium
        11628,
    },
    { -- Untamed Beauty
        11629,
    },
    { -- More Like Win-dictive
        11630,
    },
    { -- Extreme Makeover: Fel Edition
        11631,
    },
    { -- The Reputable
        11652,
    },
    { -- Paragon of the Broken Isles
        11653,
    },
    { -- "Great Soul, Great Purpose"
        11674,
    },
    { -- Sky Walker
        11675,
    },
    { -- Five Course Seafood Buffet
        11676,
    },
    { -- Crate Expectations
        11681,
    },
    { -- Bingo!
        11683,
    },
    { -- Decade of Dominance
        11685,
        {
            IsPvP = true,
        },
    },
    { -- These Go To Eleven
        11686,
        {
            IsPvP = true,
        },
    },
    { -- Demonic Dozen
        11687,
        {
            IsPvP = true,
        },
    },
    { -- Floor Thirteen
        11688,
        {
            IsPvP = true,
        },
    },
    { -- Fourteen for the Team
        11689,
        {
            IsPvP = true,
        },
    },
    { -- When You're Fifteen
        11690,
        {
            IsPvP = true,
        },
    },
    { -- You Are Sixteen
        11691,
        {
            IsPvP = true,
        },
    },
    { -- Going On Seventeen
        11692,
        {
            IsPvP = true,
        },
    },
    { -- Eighteen and Over
        11693,
        {
            IsPvP = true,
        },
    },
    { -- "Hell, It's About Nineteen"
        11694,
        {
            IsPvP = true,
        },
    },
    { -- Grin and Bear It
        11696,
    },
    { -- Cruel Elite
        11697,
        {
            IsPvP = true,
        },
    },
    { -- Ferocious Elite
        11698,
        {
            IsPvP = true,
        },
    },
    { -- Grand Fin-ale
        11699,
    },
    { -- Cathedral of Eternal Night
        11700,
    },
    { -- Heroic: Cathedral of Eternal Night
        11701,
    },
    { -- Mythic: Cathedral of Eternal Night
        11702,
    },
    { -- Master of Shadows
        11703,
    },
    { -- The Original
        11706,
    },
    { -- No Mercy
        11707,
    },
    { -- With a Vengeance
        11708,
    },
    { -- Tough Threads
        11709,
    },
    { -- Lethal Looks
        11710,
    },
    { -- The Fierce and the Furious
        11711,
    },
    { -- Relentlessly Good Looking
        11712,
    },
    { -- Wrath of the Stitch King
        11713,
    },
    { -- Viciously Vintage
        11714,
    },
    { -- (Ruth)less is More
        11715,
    },
    { -- Cataclysmic Catwalk
        11716,
    },
    { -- Why Male(volent) Models?
        11717,
    },
    { -- Dressed to Oppress
        11718,
    },
    { -- It's Not Fashion Unless It Hurts
        11719,
    },
    { -- Wear It With Pride
        11720,
    },
    { -- Wild Style
        11721,
    },
    { -- War-Mog-ering
        11722,
    },
    { -- Cruel Intentions
        11723,
    },
    { -- Fel Turkey!
        11724,
    },
    { -- A Magic Contribution
        11731,
    },
    { -- A Magnificent Contribution
        11732,
    },
    { -- Take Command
        11735,
    },
    { -- Assume Command
        11736,
    },
    { -- Disrupting the Nether
        11737,
    },
    { -- It'll Nether Happen
        11738,
    },
    { -- Make it W-orc W-orc
        11740,
    },
    { -- So Hot Right Now
        11741,
    },
    { -- Dress in Lairs
        11742,
    },
    { -- Accessor-Eyes
        11743,
    },
    { -- "Drop Dead, Gorgeous"
        11744,
    },
    { -- Outlandish Style
        11746,
    },
    { -- Merely a Set
        11747,
    },
    { -- Black is the New Black
        11748,
    },
    { -- "Suns Out, Thori'dals Out"
        11749,
    },
    { -- Undying Aesthetic
        11750,
    },
    { -- Mogg-Saron
        11751,
    },
    { -- Style of the Crusader
        11752,
    },
    { -- Winter Catalog
        11753,
    },
    { -- Glamour of Twilight
        11754,
    },
    { -- Hot Couture
        11755,
    },
    { -- Wardrobe of the Old Gods
        11756,
    },
    { -- Sha of Fabulous
        11757,
    },
    { -- Thunderwear
        11758,
    },
    { -- Yaass'shaarj
        11759,
    },
    { -- Retro Trend
        11760,
    },
    { -- Azeroth's Next Top Model
        11761,
    },
    { -- Can I Get A Helya
        11762,
    },
    { -- Glory of the Tomb Raider
        11763,
    },
    { -- Pet Battle Challenge: Wailing Caverns
        11765,
    },
    { -- Mythic: Goroth
        11767,
    },
    { -- Boom Bloom
        11768,
    },
    { -- A Steamy Romance Saga
        11769,
    },
    { -- Dark Souls
        11770,
    },
    { -- Power Ascended
        11772,
    },
    { -- "Wax On, Wax Off"
        11773,
    },
    { -- Mythic: Demonic Inquisition
        11774,
    },
    { -- Mythic: Harjatan
        11775,
    },
    { -- Mythic: Mistress Sassz'ine
        11776,
    },
    { -- Mythic: Sisters of the Moon
        11777,
    },
    { -- Mythic: The Desolate Host
        11778,
    },
    { -- Mythic: Maiden of Vigilance
        11779,
    },
    { -- Mythic: Fallen Avatar
        11780,
    },
    { -- Mythic: Kil'jaeden
        11781,
    },
    { -- Terrors of the Shore
        11786,
    },
    { -- The Gates of Hell
        11787,
    },
    { -- Wailing Halls
        11788,
    },
    { -- Chamber of the Avatar
        11789,
    },
    { -- Deceiver's Fall
        11790,
    },
    { -- Armies of Legionfall
        11796,
    },
    { -- Bringing Home the Beacon
        11802,
    },
    { -- Naxt Victim
        11841,
    },
    { -- Champions of Legionfall
        11846,
    },
    {KrowiAF.SetAchievementPatch, 7, 2, 0}, -- Rework loading so this can go to the top, future me problem
};