local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_00_01"] = {
    { -- The Master of Revendreth
        13878,
    },
    { -- "Awaken, Ardenweald"
        14164,
    },
    { -- Sanguine Depths
        14197,
    },
    { -- Heroic: Sanguine Depths
        14198,
    },
    { -- Mythic: Sanguine Depths
        14199,
    },
    { -- Blade of the Primus
        14206,
    },
    { -- Exile's Reach
        14222,
    },
    { -- Tea Tales
        14233,
    },
    { -- WoW's 16th Anniversary
        14271,
    },
    { -- Best Bud With Benefits
        14272,
    },
    { -- Crypt Kicker
        14273,
    },
    { -- Absolution for All
        14274,
    },
    { -- It's Always Sinny in Revendreth
        14276,
    },
    { -- The Accuser's Avowed
        14277,
    },
    { -- Loremaster of Shadowlands
        14280,
    },
    { -- The Path to Ascension
        14281,
    },
    { -- Heroic Edition: Ensorcelled Everwyrm
        14283,
    },
    { -- Breaking Bad
        14284,
    },
    { -- Ready for Raiding VII
        14285,
    },
    { -- Residue Evil
        14286,
    },
    { -- Kaal-ed Shot
        14289,
    },
    { -- I Only Have Eyes For You
        14290,
    },
    { -- Someone Could Trip on These!
        14291,
    },
    { -- Riding with my Slimes
        14292,
    },
    { -- Blind as a Bat
        14293,
    },
    { -- Dirtflap's Revenge
        14294,
    },
    { -- Bountiful Harvest
        14295,
    },
    { -- Going Viral
        14296,
    },
    { -- Three Choose One
        14297,
    },
    { -- Explore Bastion
        14303,
    },
    { -- Explore Ardenweald
        14304,
    },
    { -- Explore Maldraxxus
        14305,
    },
    { -- Explore Revendreth
        14306,
    },
    { -- Adventurer of Bastion
        14307,
    },
    { -- Adventurer of Maldraxxus
        14308,
    },
    { -- Adventurer of Ardenweald
        14309,
    },
    { -- Adventurer of Revendreth
        14310,
    },
    { -- Treasures of Bastion
        14311,
    },
    { -- Treasures of Maldraxxus
        14312,
    },
    { -- Treasures of Ardenweald
        14313,
    },
    { -- Treasures of Revendreth
        14314,
    },
    { -- Shadowlands Diplomat
        14315,
    },
    { -- Surgeon's Supplies
        14320,
    },
    { -- Glory of the Shadowlands Hero
        14322,
    },
    { -- ExSPEARiential
        14323,
    },
    { -- Heroic: Spires of Ascension
        14324,
    },
    { -- Mythic: Spires of Ascension
        14325,
    },
    { -- Spires of Ascension
        14326,
    },
    { -- I Can See My House From Here
        14327,
    },
    { -- Professional Shadowlands Master
        14328,
    },
    { -- Working the Afterlife
        14329,
    },
    { -- Shadowlands Master of All
        14330,
    },
    { -- Goliath Offline
        14331,
    },
    { -- Shadowlands Cook
        14332,
    },
    { -- Shadowlands Fisherman
        14333,
    },
    { -- Into the Maw
        14334,
    },
    { -- The Ascended
        14335,
    },
    { -- Undying Army
        14336,
    },
    { -- The Wild Hunt
        14337,
    },
    { -- Court of Harvesters
        14338,
    },
    { -- Shard Labor
        14339,
    },
    { -- Full Gores Meal
        14347,
    },
    { -- Nobody Puts Denathrius in a Corner
        14352,
    },
    { -- Ardenweald's a Stage
        14353,
    },
    { -- Highly Communicable
        14354,
    },
    { -- Glory of the Nathria Raider
        14355,
    },
    { -- Mythic: Shriekwing
        14356,
    },
    { -- Mythic: Huntsman Altimor
        14357,
    },
    { -- Mythic: Hungering Destroyer
        14358,
    },
    { -- Mythic: Artificer Xy'mox
        14359,
    },
    { -- Mythic: Sun King's Salvation
        14360,
    },
    { -- Mythic: Lady Inerva Darkvein
        14361,
    },
    { -- Mythic: The Council of Blood
        14362,
    },
    { -- Mythic: Sludgefist
        14363,
    },
    { -- Mythic: Stone Legion Generals
        14364,
    },
    { -- Mythic: Sire Denathrius
        14365,
    },
    { -- The Necrotic Wake
        14366,
    },
    { -- Heroic: The Necrotic Wake
        14367,
    },
    { -- Mythic: The Necrotic Wake
        14368,
    },
    { -- Plaguefall
        14369,
    },
    { -- Halls of Atonement
        14370,
    },
    { -- Mists of Tirna Scithe
        14371,
    },
    { -- Theater of Pain
        14372,
    },
    { -- De Other Side
        14373,
    },
    { -- Couple's Therapy
        14374,
    },
    { -- Hunger for Knowledge
        14375,
    },
    { -- Feed the Beast
        14376,
    },
    { -- Heroic: De Other Side
        14408,
    },
    { -- Mythic: De Other Side
        14409,
    },
    { -- Heroic: Halls of Atonement
        14410,
    },
    { -- Mythic: Halls of Atonement
        14411,
    },
    { -- Heroic: Mists of Tirna Scithe
        14412,
    },
    { -- Mythic: Mists of Tirna Scithe
        14413,
    },
    { -- Heroic: Plaguefall
        14414,
    },
    { -- Mythic: Plaguefall
        14415,
    },
    { -- Heroic: Theater of Pain
        14416,
    },
    { -- Mythic: Theater of Pain
        14417,
    },
    { -- Shadowlands Dungeon Hero
        14418,
    },
    { -- Ahead of the Curve: Sire Denathrius
        14460,
    },
    { -- Cutting Edge: Sire Denathrius
        14461,
    },
    { -- Skoldus Hall
        14463,
    },
    { -- Twisting Corridors: Layer 1
        14468,
    },
    { -- Twisting Corridors: Layer 2
        14469,
    },
    { -- Twisting Corridors: Layer 3
        14470,
    },
    { -- Twisting Corridors: Layer 4
        14471,
    },
    { -- Twisting Corridors: Layer 5
        14472,
    },
    { -- Fracture Chambers
        14473,
    },
    { -- The Soulforges
        14478,
    },
    { -- Coldheart Interstitia
        14483,
    },
    { -- Mort'regar
        14488,
    },
    { -- The Upper Reaches
        14493,
    },
    { -- Gatekeepers of Torghast
        14498,
    },
    { -- Phanciful
        14499,
    },
    { -- Phantastic
        14500,
    },
    { -- Phanatical
        14501,
    },
    { -- Pursuing Loyalty
        14502,
    },
    { -- Hooked On Hydroponics
        14503,
    },
    { -- "Niya, As Xavius"
        14504,
    },
    { -- "Senthii, As Gul'dan"
        14505,
    },
    { -- "Glimmerdust, As Kil'jaeden"
        14506,
    },
    { -- "Mi'kai, As Argus"
        14507,
    },
    { -- "Glimmerdust, As Jaina"
        14508,
    },
    { -- "Astra, As Azshara"
        14509,
    },
    { -- "Dreamweaver, As N'Zoth"
        14510,
    },
    { -- Tour of Duty: Ardenweald
        14511,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Revendreth
        14512,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Maldraxxus
        14513,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Bastion
        14514,
        {
            IsPvP = true,
        },
    },
    { -- Zo'Sorg's Bidding
        14515,
        {
            IsPvP = true,
        },
    },
    { -- Impressing Zo'Sorg
        14516,
        {
            IsPvP = true,
        },
    },
    { -- Covenant Combat
        14519,
        {
            IsPvP = true,
        },
    },
    { -- Taking Care of Business
        14523,
    },
    { -- I Don't Know What I Expected
        14524,
    },
    { -- "Feed Me, Seymour!"
        14525,
    },
    { -- Shadowlands Keystone Conqueror: Season One
        14531,
    },
    { -- Shadowlands Keystone Master: Season One
        14532,
    },
    { -- Royal Rumble
        14533,
    },
    { -- Picking Up the Pieces
        14567,
    },
    { -- Twisting Corridors: Layer 6
        14568,
    },
    { -- Twisting Corridors: Layer 7
        14569,
    },
    { -- Twisting Corridors: Layer 8
        14570,
    },
    { -- Thinking with...
        14606,
    },
    { -- Fresh Meat!
        14607,
    },
    { -- Burning Bright
        14608,
    },
    { -- Clear Conscience
        14610,
    },
    { -- Castle Vain
        14614,
    },
    { -- Private Stock
        14617,
    },
    { -- Pour Decision Making
        14619,
    },
    { -- Battle in the Shadowlands
        14625,
    },
    { -- Harvester of Sorrow
        14626,
    },
    { -- Choosing Your Purpose
        14627,
    },
    { -- The Road to Renown
        14628,
    },
    { -- Gaining Respect
        14629,
    },
    { -- Becoming a Hero
        14630,
    },
    { -- Champion of the Covenant
        14631,
    },
    { -- Conducting Anima
        14632,
    },
    { -- Master Navigator
        14633,
    },
    { -- Nine Afterlives
        14634,
    },
    { -- Adventurer in Chief
        14636,
    },
    { -- Your Covenant's Flavor
        14637,
    },
    { -- The Anima Must Flow
        14638,
    },
    { -- Dedication to the Restoration
        14639,
    },
    { -- Trading Partners
        14656,
    },
    { -- Soulkeeper's Burden
        14658,
    },
    { -- Handling His Henchmen
        14659,
    },
    { -- It's About Sending a Message
        14660,
    },
    { -- Realm First! Shadowlands Keystone Master
        14662,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- Explore The Maw
        14663,
    },
    { -- That's the Spirit
        14670,
    },
    { -- Something's Not Quite Right....
        14671,
    },
    { -- "A Bit of This, A Bit of That"
        14672,
    },
    { -- Spirit Talker
        14675,
    },
    { -- Divine Spirit Savior
        14676,
    },
    { -- Spiritual Observations
        14677,
    },
    { -- Court Favors
        14678,
    },
    { -- Party Palace
        14679,
    },
    { -- Something for Everyone
        14680,
    },
    { -- Dredger Academy
        14681,
    },
    { -- The Party Herald
        14682,
    },
    { -- Dredger Style
        14683,
    },
    { -- Abominable Lives
        14684,
    },
    { -- Combatant: Shadowlands Season 1
        14685,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Shadowlands Season 1
        14686,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Shadowlands Season 1
        14687,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Shadowlands Season 1
        14688,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Shadowlands Season 1
        14689,
        {
            IsPvP = true,
        },
    },
    { -- Sinful Gladiator: Shadowlands Season 1
        14690,
        {
            IsPvP = true,
        },
    },
    { -- Elite: Shadowlands Season 1
        14691,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Sinful
        14692,
        faction.Alliance,
        14693,
        true,
    },
    { -- Hero of the Horde: Sinful
        14693,
        faction.Horde,
        14692,
        true,
    },
    { -- Castle Nathria
        14715,
    },
    { -- Heroic: Castle Nathria
        14717,
    },
    { -- Mythic: Castle Nathria
        14718,
    },
    { -- It's In The Mix
        14721,
    },
    { -- Be Our Guest
        14723,
    },
    { -- People Pleaser
        14724,
    },
    { -- We Happy Few
        14725,
    },
    { -- It's Certainly Never Boring
        14726,
    },
    { -- Master of Ceremonies
        14727,
    },
    { -- To All the Squirrels Through Time and Space
        14728,
    },
    { -- To All the Squirrels I Love Despite Their Scars
        14729,
    },
    { -- To All the Squirrels I Set Sail to See
        14730,
    },
    { -- To All the Squirrels I've Loved and Lost
        14731,
    },
    { -- In the Hot Seat
        14733,
    },
    { -- Rallying Cry of the Ascended
        14734,
    },
    { -- Flight School Graduate
        14735,
    },
    { -- What Bastion Remembered
        14737,
    },
    { -- Hunting Party
        14738,
    },
    { -- Aerial Ace
        14741,
    },
    { -- Who Sent You?
        14742,
    },
    { -- Deadly Serious
        14743,
    },
    { -- Better to Be Lucky Than Dead
        14744,
    },
    { -- Grand Theft Shadehound
        14745,
    },
    { -- Prepare for Trouble!
        14746,
    },
    { -- Make it Double!
        14747,
    },
    { -- Wardrobe Makeover
        14748,
    },
    { -- Rendle's Big Day
        14749,
    },
    { -- Death Rising
        14750,
    },
    { -- The Gang's All Here
        14751,
    },
    { -- Things To Do When You're Dead
        14752,
    },
    { -- It's a Wrap
        14753,
    },
    { -- The Forgotten One
        14754,
    },
    { -- Legendary Accord
        14755,
    },
    { -- The World Beyond
        14758,
    },
    { -- It's Coming Back to Me...
        14759,
    },
    { -- Recollection Collection
        14760,
    },
    { -- Deciphering Death's Intentions
        14761,
    },
    { -- Breaking the Stratus Fear
        14762,
    },
    { -- Crypt Couture
        14763,
    },
    { -- The Great Luckydo
        14764,
    },
    { -- Ramparts Racer
        14765,
    },
    { -- Parasoling
        14766,
    },
    { -- Count Your Blessings
        14767,
    },
    { -- What is that Melody?
        14768,
    },
    { -- Bat!
        14769,
    },
    { -- What We Ride in the Shadows
        14770,
    },
    { -- The Afterlife Express
        14771,
    },
    { -- Caught in a Bat Romance
        14772,
    },
    { -- Explosive Extermination
        14773,
    },
    { -- Ardenweald Gourmand
        14774,
    },
    { -- Mush Appreciated
        14775,
    },
    { -- For the Hoarder!
        14776,
    },
    { -- Restoration Expert
        14777,
    },
    { -- Extremely Ravenous
        14778,
    },
    { -- Wild Hunting
        14779,
    },
    { -- Meditation Master
        14780,
    },
    { -- Level 50
        14782,
    },
    { -- Level 60
        14783,
    },
    { -- Fractured Faerie Tales
        14788,
    },
    { -- All Spirits Great and Small
        14789,
    },
    { -- Covenant Campaign
        14790,
    },
    { -- Toss a Seed to Your Hunter...
        14791,
    },
    { -- Clearing the Fog
        14795,
    },
    { -- Superior (Shadowlands)
        14796,
    },
    { -- Epic (Shadowlands)
        14797,
    },
    { -- Sojourner of Revendreth
        14798,
    },
    { -- Sojourner of Maldraxxus
        14799,
    },
    { -- Sojourner of Ardenweald
        14800,
    },
    { -- Sojourner of Bastion
        14801,
    },
    { -- Bloodsport
        14802,
    },
    { -- Touring Torghast
        14808,
    },
    { -- Traversing Torghast
        14809,
    },
    { -- Terror of Torghast
        14810,
    },
    { -- Executing the Exarch
        14815,
        faction.Horde,
        14817,
        true,
    },
    { -- Opposing Orgrimmar
        14817,
        faction.Alliance,
        14815,
        true,
    },
    {KrowiAF.SetAchievementPatch, 9, 0, 1}, -- Rework loading so this can go to the top, future me problem
};