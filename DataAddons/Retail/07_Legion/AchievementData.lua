local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_00_03"] = {
    {KrowiAF.SetAchievementPatch, 7, 0, 3},
    { -- Aquatic Acquiescence
        9686,
    },
    { -- Best of the Beasts
        9687,
    },
    { -- Mousing Around
        9688,
    },
    { -- Dragons!
        9689,
    },
    { -- "Ragnaros, Watch and Learn"
        9690,
    },
    { -- Flock Together
        9691,
    },
    { -- "Murlocs, Harpies, and Wolvar, Oh My!"
        9692,
    },
    { -- Master of Magic
        9693,
    },
    { -- Roboteer
        9694,
    },
    { -- The Lil' Necromancer
        9695,
    },
    { -- Family Familiar
        9696,
    },
    { -- Ain't No Mountain High Enough
        10059,
    },
    { -- Drum Circle
        10398,
    },
    { -- Helheim Hath No Fury
        10411,
    },
    { -- Poor Unfortunate Souls
        10412,
    },
    { -- Instant Karma
        10413,
    },
    { -- But You Say He's Just a Friend
        10456,
    },
    { -- Stay Salty
        10457,
    },
    { -- Ready for Raiding V
        10458,
    },
    { -- Improving on History
        10459,
    },
    { -- Hidden Potential
        10460,
    },
    { -- Fighting with Style: Classic
        10461,
    },
    { -- I Got What You Mead
        10542,
    },
    { -- Surge Protector
        10543,
    },
    { -- Stag Party
        10544,
    },
    { -- You're Just Making It WORSE!
        10553,
    },
    { -- I Made a Food!
        10554,
    },
    { -- Buggy Fight
        10555,
    },
    { -- Honorable Medallion
        10561,
        {
            IsPvP = true,
        },
    },
    { -- Burning Bridges
        10575,
    },
    { -- Heroic Skills to Pay the Bills
        10580,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Working the Isles
        10581,
    },
    { -- Professional Legion Master
        10582,
    },
    { -- Legion Master of All
        10583,
    },
    { -- Fel-Smelter
        10585,
        {
            {"Before", "Version", {9, 1, 0}},
        },
    },
    { -- Mass Obliteration
        10586,
        {
            {"Before", "Version", {9, 1, 0}},
        },
    },
    { -- Hot Swapper
        10587,
    },
    { -- The Shortest Distance
        10588,
    },
    { -- Legion Cook
        10589,
    },
    { -- All Grown Up
        10591,
    },
    { -- Never A Day's Rest
        10592,
    },
    { -- Everything Tastes Better
        10593,
    },
    { -- Legion Fisherman
        10594,
    },
    { -- A Cast Above the Rest
        10595,
    },
    { -- Bigger Fish to Fry
        10596,
    },
    { -- Legion Aquaculture
        10597,
    },
    { -- Fishing 'Round the Isles
        10598,
    },
    { -- Legion Medic
        10599,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Legion Archaeologist
        10600,
    },
    { -- Surveying the Land
        10601,
    },
    { -- This Side Up
        10602,
    },
    { -- A Keen Eye
        10603,
    },
    { -- Legion Curator
        10604,
    },
    { -- Handle With Care
        10605,
    },
    { -- The Dwarven Dream
        10606,
    },
    { -- Getting Your Hands Dirty
        10607,
    },
    { -- Sifting Through the Sand
        10608,
    },
    { -- No Stone Unturned
        10609,
    },
    { -- Waiting for Gerdo
        10610,
    },
    { -- Dropping Some Eaves
        10611,
    },
    { -- Nightfallen But Not Forgotten
        10617,
    },
    { -- Zoom!
        10626,
    },
    { -- Going Up
        10627,
    },
    { -- Fledgling Hero of Warcraft
        10657,
    },
    { -- Imagined Dragons World Tour
        10663,
    },
    { -- Explore Azsuna
        10665,
    },
    { -- Explore Val'sharah
        10666,
    },
    { -- Explore Highmountain
        10667,
    },
    { -- Explore Stormheim
        10668,
    },
    { -- Explore Suramar
        10669,
    },
    { -- Level 110 (Legacy)
        10671,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Broken Isles Diplomat
        10672,
    },
    { -- Cage Rematch
        10678,
    },
    { -- I Ain't Even Cold
        10679,
    },
    { -- Who's Afraid of the Dark?
        10680,
    },
    { -- Fashionista: Head
        10681,
    },
    { -- Fashionista: Chest
        10682,
    },
    { -- Fashionista: Legs
        10684,
    },
    { -- Fashionista: Feet
        10685,
    },
    { -- Fashionista: Waist
        10686,
    },
    { -- Fashionista: Back
        10687,
    },
    { -- Fashionista: Wrist
        10688,
    },
    { -- Fashionista: Weapon & Off-Hand
        10689,
    },
    { -- Fashionista: Tabard
        10690,
    },
    { -- Fashionista: Shirt
        10691,
    },
    { -- Fashionista: Shoulder
        10692,
    },
    { -- Fashionista: Hand
        10693,
    },
    { -- Fabulous
        10694,
    },
    { -- I've Got My Eyes On You
        10696,
    },
    { -- Grand Opening
        10697,
    },
    { -- That's Val'sharah Folks!
        10698,
    },
    { -- Infinitesimal
        10699,
    },
    { -- Not For You
        10704,
    },
    { -- Training the Troops
        10706,
    },
    { -- "A Specter, Illuminated"
        10707,
    },
    { -- You Used to Scrawl Me In Your Fel Tome
        10709,
    },
    { -- Black Rook Moan
        10710,
    },
    { -- Adds? More Like Bads
        10711,
    },
    { -- The Wish Remover
        10722,
    },
    { -- WoW's 12th Anniversary
        10741,
        {
            {},
        },
    },
    { -- Gluten Free
        10742,
    },
    { -- The Prestige
        10743,
        faction.Alliance,
        10745,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- The Prestige
        10745,
        faction.Horde,
        10743,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Forged for Battle
        10746,
    },
    { -- Fighting with Style: Upgraded
        10747,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Fighting with Style: Valorous
        10748,
    },
    { -- Fighting with Style: War-torn
        10749,
        faction.Alliance,
        11173,
        true,
    },
    { -- Fighting with Style: Hidden
        10750,
    },
    { -- Brr... It's Cold in Here
        10751,
    },
    { -- Scare Bear
        10753,
    },
    { -- Fruit of All Evil
        10754,
    },
    { -- I Attack the Darkness
        10755,
    },
    { -- Leyline Bling
        10756,
    },
    { -- Resourceful
        10761,
    },
    { -- The Legion Menu
        10762,
    },
    { -- Azsuna Matata
        10763,
    },
    { -- Brokenly Superior
        10764,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Brokenly Epic
        10765,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Egg-cellent!
        10766,
    },
    { -- Burning Down the House
        10769,
    },
    { -- The Tangerine Traveler
        10770,
    },
    { -- Webbing Crashers
        10771,
    },
    { -- Use the Force(s)
        10772,
    },
    { -- Arcanic Cling
        10773,
    },
    { -- Hatchling of the Talon
        10774,
    },
    { -- Clean House
        10775,
    },
    { -- No Time to Waste
        10776,
    },
    { -- The Nightfallen
        10778,
    },
    { -- Eye of Azshara
        10780,
    },
    { -- Heroic: Eye of Azshara
        10781,
    },
    { -- Mythic: Eye of Azshara
        10782,
    },
    { -- Darkheart Thicket
        10783,
    },
    { -- Heroic: Darkheart Thicket
        10784,
    },
    { -- Mythic: Darkheart Thicket
        10785,
    },
    { -- Halls of Valor
        10786,
    },
    { -- Heroic: Halls of Valor
        10788,
    },
    { -- Mythic: Halls of Valor
        10789,
    },
    { -- "Vrykul Story, Bro"
        10790,
    },
    { -- What a Ripoff!
        10793,
    },
    { -- Neltharion's Lair
        10795,
    },
    { -- Heroic: Neltharion's Lair
        10796,
    },
    { -- Mythic: Neltharion's Lair
        10797,
    },
    { -- Assault on Violet Hold
        10798,
    },
    { -- Heroic: Assault on Violet Hold
        10799,
    },
    { -- Mythic: Assault on Violet Hold
        10800,
    },
    { -- Vault of the Wardens
        10801,
    },
    { -- Heroic: Vault of the Wardens
        10802,
    },
    { -- Mythic: Vault of the Wardens
        10803,
    },
    { -- Black Rook Hold
        10804,
    },
    { -- Heroic: Black Rook Hold
        10805,
    },
    { -- Mythic: Black Rook Hold
        10806,
    },
    { -- Maw of Souls
        10807,
    },
    { -- Heroic: Maw of Souls
        10808,
    },
    { -- Mythic: Maw of Souls
        10809,
    },
    { -- Mythic: The Arcway
        10813,
    },
    { -- Mythic: Court of Stars
        10816,
    },
    { -- A Change In Scenery
        10817,
    },
    { -- Darkbough
        10818,
    },
    { -- Tormented Guardians
        10819,
    },
    { -- Rift of Aln
        10820,
    },
    { -- Mythic: Nythendra
        10821,
    },
    { -- Mythic: Elerethe Renferal
        10822,
    },
    { -- Mythic: Il'gynoth
        10823,
    },
    { -- Mythic: Ursoc
        10824,
    },
    { -- Mythic: Dragons of Nightmare
        10825,
    },
    { -- Mythic: Cenarius
        10826,
    },
    { -- Mythic: Xavius
        10827,
    },
    { -- Arcing Aqueducts
        10829,
    },
    { -- Took the Red Eye Down
        10830,
    },
    { -- Royal Athenaeum
        10837,
    },
    { -- Nightspire
        10838,
    },
    { -- Betrayer's Rise
        10839,
    },
    { -- Mythic: Skorpyron
        10840,
    },
    { -- Mythic: Chronomatic Anomaly
        10842,
    },
    { -- Mythic: Trilliax
        10843,
    },
    { -- Mythic: Spellblade Aluriel
        10844,
    },
    { -- Mythic: Star Augur Etraeus
        10845,
    },
    { -- Mythic: High Botanist Tel'arn
        10846,
    },
    { -- Mythic: Tichondrius
        10847,
    },
    { -- Mythic: Krosus
        10848,
    },
    { -- Mythic: Grand Magistrix Elisande
        10849,
    },
    { -- Mythic: Gul'dan
        10850,
    },
    { -- Elementalry!
        10851,
    },
    { -- Artifact or Artifiction
        10852,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Part of History
        10853,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Can't Eat Just One
        10875,
    },
    { -- Battle on the Broken Isles
        10876,
    },
    { -- Pillars of Creation
        10877,
    },
    { -- First Step into a Larger World
        10991,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Here We Go Again
        10992,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Third Time's the Charm
        10993,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- A Glorious Campaign
        10994,
    },
    { -- For Prestige
        10995,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Got to Ketchum All
        10996,
    },
    { -- Vindictive Combatant
        10997,
        faction.Horde,
        10998,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Vindictive Combatant
        10998,
        faction.Alliance,
        10997,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Vindictive Gladiator's Storm Dragon
        10999,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Fearless Gladiator's Storm Dragon
        11000,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Cruel Gladiator's Storm Dragon
        11001,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Ferocious Gladiator's Storm Dragon
        11002,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Fearless Combatant
        11003,
        faction.Horde,
        11004,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Fearless Combatant
        11004,
        faction.Alliance,
        11003,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Cruel Combatant
        11005,
        faction.Horde,
        11008,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Cruel Combatant
        11008,
        faction.Alliance,
        11005,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Ferocious Combatant
        11009,
        faction.Horde,
        11010,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Ferocious Combatant
        11010,
        faction.Alliance,
        11009,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Gladiator: Legion Season 1
        11011,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Vindictive Gladiator: Legion Season 1
        11012,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Gladiator: Legion Season 2
        11013,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Fearless Gladiator: Legion Season 2
        11014,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Duelist: Legion Season 1
        11015,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Rival: Legion Season 1
        11016,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Challenger: Legion Season 1
        11017,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Hero of the Alliance: Vindictive
        11018,
        faction.Alliance,
        11019,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Hero of the Horde: Vindictive
        11019,
        faction.Horde,
        11018,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Guardian of the Alliance: Legion Season 1
        11020,
        faction.Alliance,
        11021,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Guardian of the Horde: Legion Season 1
        11021,
        faction.Horde,
        11020,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Defender of the Alliance: Legion Season 1
        11022,
        faction.Alliance,
        11023,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Defender of the Horde: Legion Season 1
        11023,
        faction.Horde,
        11022,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Soldier of the Alliance: Legion Season 1
        11024,
        faction.Alliance,
        11025,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Soldier of the Horde: Legion Season 1
        11025,
        faction.Horde,
        11024,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Duelist: Legion Season 2
        11026,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Rival: Legion Season 2
        11027,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Challenger: Legion Season 2
        11028,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Hero of the Horde: Fearless
        11029,
        faction.Horde,
        11030,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Hero of the Alliance: Fearless
        11030,
        faction.Alliance,
        11029,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Guardian of the Horde: Legion Season 2
        11031,
        faction.Horde,
        11032,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Guardian of the Alliance: Legion Season 2
        11032,
        faction.Alliance,
        11031,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Defender of the Horde: Legion Season 2
        11033,
        faction.Horde,
        11034,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Defender of the Alliance: Legion Season 2
        11034,
        faction.Alliance,
        11033,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Soldier of the Horde: Legion Season 2
        11035,
        faction.Horde,
        11036,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Soldier of the Alliance: Legion Season 2
        11036,
        faction.Alliance,
        11035,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Cruel Gladiator: Legion Season 3
        11037,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Gladiator: Legion Season 3
        11038,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Challenger: Legion Season 3
        11039,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Rival: Legion Season 3
        11040,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Duelist: Legion Season 3
        11041,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Hero of the Horde: Cruel
        11042,
        faction.Horde,
        11043,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Hero of the Alliance: Cruel
        11043,
        faction.Alliance,
        11042,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Defender of the Horde: Legion Season 3
        11044,
        faction.Horde,
        11045,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Defender of the Alliance: Legion Season 3
        11045,
        faction.Alliance,
        11044,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Guardian of the Horde: Legion Season 3
        11046,
        faction.Horde,
        11047,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Guardian of the Alliance: Legion Season 3
        11047,
        faction.Alliance,
        11046,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Soldier of the Horde: Legion Season 3
        11048,
        faction.Horde,
        11049,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Soldier of the Alliance: Legion Season 3
        11049,
        faction.Alliance,
        11048,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Soldier of the Alliance: Legion Season 4
        11050,
        faction.Alliance,
        11051,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Soldier of the Horde: Legion Season 4
        11051,
        faction.Horde,
        11050,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Guardian of the Alliance: Legion Season 4
        11052,
        faction.Alliance,
        11053,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Guardian of the Horde: Legion Season 4
        11053,
        faction.Horde,
        11052,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Defender of the Alliance: Legion Season 4
        11054,
        faction.Alliance,
        11055,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Defender of the Horde: Legion Season 4
        11055,
        faction.Horde,
        11054,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Hero of the Alliance: Ferocious
        11056,
        faction.Alliance,
        11057,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Hero of the Horde: Ferocious
        11057,
        faction.Horde,
        11056,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Duelist: Legion Season 4
        11058,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Rival: Legion Season 4
        11059,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Challenger: Legion Season 4
        11060,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Gladiator: Legion Season 4
        11061,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Ferocious Gladiator: Legion Season 4
        11062,
        {
            IsPvP = true,
            {"PvP Season", 22},
        },
    },
    { -- Collector's Edition: Baby Winston
        11064,
    },
    { -- It All Makes Sense Now
        11065,
        {
            {"Until", "Version", {7, 0, 3}},
        },
    },
    { -- Underbelly Tycoon
        11066,
    },
    { -- Good Suramaritan
        11124,
    },
    { -- Now You're Thinking With Portals
        11125,
    },
    { -- 50 World Quests Completed
        11126,
    },
    { -- 200 World Quests Completed
        11127,
    },
    { -- 500 World Quests Completed
        11128,
    },
    { -- 1000 World Quests Completed
        11129,
    },
    { -- 2500 World Quests Completed
        11130,
    },
    { -- 5000 World Quests Completed
        11131,
    },
    { -- "10,000 World Quests Completed"
        11132,
    },
    { -- Why Can't I Hold All This Mana?
        11133,
    },
    { -- A Heroic Campaign
        11135,
    },
    { -- An Epic Campaign
        11136,
    },
    { -- A Legendary Campaign
        11137,
    },
    { -- Is There a Medic in the Zone?
        11138,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Field Medic
        11139,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Power Realized
        11144,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Loremaster of Legion
        11157,
    },
    { -- Friends in a Broken Land
        11159,
    },
    { -- Unleashed Monstrosities
        11160,
    },
    { -- Keystone Master
        11162,
    },
    { -- Glory of the Legion Hero
        11163,
    },
    { -- Legion Dungeon Hero
        11164,
    },
    { -- Crest of Heroism
        11165,
        faction.Alliance,
        11166,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Crest of Heroism
        11166,
        faction.Horde,
        11165,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Crest of Carnage
        11167,
        faction.Alliance,
        11168,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Crest of Carnage
        11168,
        faction.Horde,
        11167,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Crest of Devastation
        11169,
        faction.Alliance,
        11170,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Crest of Devastation
        11170,
        faction.Horde,
        11169,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Arsenal of Power
        11171,
    },
    { -- Fighting with Style: War-torn
        11173,
        faction.Horde,
        10749,
    },
    { -- Higher Dimensional Learning
        11175,
    },
    { -- Remember to Share
        11176,
    },
    { -- 70 Exalted Reputations
        11177,
    },
    { -- Wake the Dragon
        11178,
    },
    { -- Glory of the Legion Raider
        11180,
    },
    { -- Legion Keymaster
        11181,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Keystone Initiate
        11183,
    },
    { -- Keystone Challenger
        11184,
    },
    { -- Keystone Conqueror
        11185,
    },
    { -- Tehd & Marius' Excellent Adventure
        11186,
    },
    { -- Broken Isles Explorer
        11188,
    },
    { -- Variety is the Spice of Life
        11189,
    },
    { -- "Broken Isles Pathfinder, Part One"
        11190,
    },
    { -- Cutting Edge: Xavius
        11191,
        {
            {"Before", "Version", {7, 1, 5}},
        },
    },
    { -- Cutting Edge: Gul'dan
        11192,
        {
            {"Before", "Version", {7, 2, 5}},
        },
    },
    { -- Ahead of the Curve: Xavius
        11194,
        {
            {"Before", "Version", {7, 1, 5}},
        },
    },
    { -- Ahead of the Curve: Gul'dan
        11195,
        {
            {"Before", "Version", {7, 2, 5}},
        },
    },
    { -- Stand Against the Legion
        11200,
        {
            {"From", "Date", {2016, 8, 9}, "Until", "Date", {2016, 8, 30}},
        },
    },
    { -- Defender of Azeroth: Legion Invasions
        11201,
        {
            {"From", "Date", {2016, 8, 9}, "Until", "Date", {2016, 8, 30}},
        },
    },
    { -- Fight for the Alliance
        11210,
        {
            {"From", "Date", {2016, 5, 25}, "Until", "Date", {2016, 8, 1}},
        },
    },
    { -- Fight for the Horde
        11211,
        {
            {"From", "Date", {2016, 5, 25}, "Until", "Date", {2016, 8, 1}},
        },
    },
    { -- Raise an Army
        11212,
    },
    { -- Lead a Legion
        11213,
    },
    { -- Many Missions
        11214,
    },
    { -- Quite a Few Missions
        11215,
    },
    { -- So Many Missions
        11216,
    },
    { -- "Many Many Missions, Handle It!"
        11217,
    },
    { -- There's a Boss In There
        11218,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Need Backup
        11219,
    },
    { -- Roster of Champions
        11220,
    },
    { -- Champions Rise
        11221,
    },
    { -- Champions of Power
        11222,
    },
    { -- Legendary Research
        11223,
    },
    { -- Realm First! Legion Keystone Master
        11224,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    { -- "Lock, Stock and Two Smoking Goblins"
        11232,
    },
    { -- Broken Isles Safari
        11233,
    },
    { -- Harbinger
        11240,
    },
    { -- Treasures of Azsuna
        11256,
    },
    { -- Treasures of Highmountain
        11257,
    },
    { -- Treasures of Val'sharah
        11258,
    },
    { -- Treasures of Stormheim
        11259,
    },
    { -- Treasures of Suramar
        11260,
    },
    { -- Adventurer of Azsuna
        11261,
    },
    { -- Adventurer of Val'sharah
        11262,
    },
    { -- Adventurer of Stormheim
        11263,
    },
    { -- Adventurer of Highmountain
        11264,
    },
    { -- Adventurer of Suramar
        11265,
    },
    { -- The Ancient Keeper
        11296,
        {
            {"Never"},
        },
    },
    { -- The Balance of Light and Shadow
        11297,
        {
            {"Never"},
        },
    },
    { -- A Classy Outfit
        11298,
    },
};

KrowiAF.AchievementData["07_02_00"] = {
    {KrowiAF.SetAchievementPatch, 7, 2, 0},
    { -- Patron of War
        10537,
        {
            {"From", "Date", {2016, 9, 30}, "Until", "Date", {2016, 10, 9}},
        },
    },
    { -- Extinguishing Draenor
        11276,
        faction.Alliance,
        11277,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing Draenor
        11277,
        faction.Horde,
        11276,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing the Broken Isles
        11278,
        faction.Alliance,
        11279,
        {
            {"Event", 341},
        },
    },
    { -- Extinguishing the Broken Isles
        11279,
        faction.Horde,
        11278,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of the Broken Isles
        11280,
        faction.Alliance,
        11282,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of the Broken Isles
        11282,
        faction.Horde,
        11280,
        {
            {"Event", 341},
        },
    },
    { -- Flame Warden of Draenor
        11283,
        faction.Alliance,
        11284,
        {
            {"Event", 341},
        },
    },
    { -- Flame Keeper of Draenor
        11284,
        faction.Horde,
        11283,
        {
            {"Event", 341},
        },
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
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Trial of Valor
        11394,
    },
    { -- Diablo's 20th Anniversary
        11395,
        {
            {"From", "Date", {2017, 1, 3}, "Until", "Date", {2017, 1, 11}},
        },
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
        {
            {"From", "Date", {2017, 2, 14}, "Until", "Date", {2017, 3, 14}},
        },
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
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- The River Six
        11469,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Slayin' to Seven
        11470,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- "Don't Hate, Grind to Eight"
        11471,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- "Hell, It's About Nine"
        11472,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
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
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- The First Rule of Brawler's Guild
        11559,
        faction.Horde,
        11558,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- You Are Not Your $#*@! Legplates (Season 3)
        11560,
        faction.Alliance,
        11561,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- You Are Not Your $#*@! Legplates (Season 3)
        11561,
        faction.Horde,
        11560,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 3)
        11563,
        faction.Alliance,
        11564,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 3)
        11564,
        faction.Horde,
        11563,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- King of the Guild (Season 3)
        11565,
        faction.Alliance,
        11566,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- King of the Guild (Season 3)
        11566,
        faction.Horde,
        11565,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- You Are Not The Contents Of Your Wallet
        11567,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Educated Guesser
        11570,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- I Am Thrall's Complete Lack Of Surprise (Season 3)
        11572,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Rumble Club
        11573,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    { -- Vindictive Elite
        11578,
        {
            IsPvP = true,
            {"PvP Season", 19},
        },
    },
    { -- Fearless Elite
        11579,
        {
            IsPvP = true,
            {"PvP Season", 20},
        },
    },
    { -- Cutting Edge: Helya
        11580,
        {
            {"Before", "Version", {7, 2, 5}},
        },
    },
    { -- Ahead of the Curve: Helya
        11581,
        {
            {"Before", "Version", {7, 2, 5}},
        },
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
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Fighting with Style: Challenging
        11612,
        {
            {"Before", "Version", {8, 0, 1}},
        },
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
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- These Go To Eleven
        11686,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Demonic Dozen
        11687,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Floor Thirteen
        11688,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Fourteen for the Team
        11689,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- When You're Fifteen
        11690,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- You Are Sixteen
        11691,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Going On Seventeen
        11692,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Eighteen and Over
        11693,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- "Hell, It's About Nineteen"
        11694,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Grin and Bear It
        11696,
    },
    { -- Cruel Elite
        11697,
        {
            IsPvP = true,
            {"PvP Season", 21},
        },
    },
    { -- Ferocious Elite
        11698,
        {
            IsPvP = true,
            {"PvP Season", 22},
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
        {
            {"Before", "Version", {8, 0, 1}},
        },
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
};

KrowiAF.AchievementData["07_02_05"] = {
    {KrowiAF.SetAchievementPatch, 7, 2, 5},
    { -- WoW's 13th Anniversary
        11848,
        {
            {},
        },
    },
    { -- Pet Battle Challenge: Deadmines
        11856,
    },
    { -- I'll Hold These For You Until You Get Out
        11869,
    },
    { -- Ahead of the Curve: Kil'jaeden
        11874,
        {
            {"Before", "Version", {7, 3, 0}},
        },
    },
    { -- Cutting Edge: Kil'jaeden
        11875,
        {
            {"Before", "Version", {7, 3, 0}},
        },
    },
    { -- "Hey, You're a Rockstar!"
        11918,
        {
            {"Event", 374},
        },
    },
    { -- Taking this Show on the Road
        11919,
        {
            {"Event", 374},
        },
    },
    { -- Perfect Performance
        11920,
        {
            {"Event", 374},
        },
    },
    { -- Mosh Pit
        11921,
        {
            {"Event", 374},
        },
    },
    { -- Heroic: Return to Karazhan
        11929,
    },
    { -- Chromie Homie
        11941,
    },
};

KrowiAF.AchievementData["07_03_00"] = {
    {KrowiAF.SetAchievementPatch, 7, 3, 0},
    { -- Fisherfriend of the Isles
        11725,
    },
    { -- Don't Play With That In The House
        11913,
    },
    { -- Don't Sweat the Technique
        11915,
    },
    { -- Portal Combat
        11928,
    },
    { -- Worm-monger
        11930,
    },
    { -- Together We Stand
        11948,
    },
    { -- Hard to Kill
        11949,
    },
    { -- Glory of the Argus Raider
        11987,
    },
    { -- Light's Breach
        11988,
    },
    { -- Forbidden Descent
        11989,
    },
    { -- Hope's End
        11990,
    },
    { -- Seat of the Pantheon
        11991,
    },
    { -- Mythic: Garothi Worldbreaker
        11992,
    },
    { -- Mythic: Hounds of Sargeras
        11993,
    },
    { -- Mythic: Antoran High Command
        11994,
    },
    { -- Mythic: Portal Keeper Hasabel
        11995,
    },
    { -- Mythic: Eonar
        11996,
    },
    { -- Mythic: Imonar the Soulhunter
        11997,
    },
    { -- Mythic: Kin'garoth
        11998,
    },
    { -- Mythic: Varimathras
        11999,
    },
    { -- Mythic: The Coven of Shivarra
        12000,
    },
    { -- Mythic: Aggramar
        12001,
    },
    { -- Mythic: Argus the Unmaker
        12002,
    },
    { -- Welcome the Void
        12004,
    },
    { -- Let it All Out
        12005,
    },
    { -- Heroic: Seat of the Triumvirate
        12007,
    },
    { -- Mythic: Seat of the Triumvirate
        12008,
    },
    { -- Darker Side
        12009,
    },
    { -- Fierce Gladiator: Legion Season 5
        12010,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Argussy Up
        12020,
    },
    { -- Claws Out
        12021,
    },
    { -- Invasion Obliteration
        12026,
    },
    { -- Envision Invasion Eradication
        12028,
    },
    { -- The World Revolves Around Me
        12030,
    },
    { -- Fierce Combatant
        12031,
        faction.Horde,
        12032,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Fierce Combatant
        12032,
        faction.Alliance,
        12031,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Duelist: Legion Season 5
        12034,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Rival: Legion Season 5
        12035,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Challenger: Legion Season 5
        12036,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Hero of the Alliance: Fierce
        12037,
        faction.Alliance,
        12041,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Guardian of the Alliance: Legion Season 5
        12038,
        faction.Alliance,
        12042,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Defender of the Alliance: Legion Season 5
        12039,
        faction.Alliance,
        12043,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Soldier of the Alliance: Legion Season 5
        12040,
        faction.Alliance,
        12044,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Hero of the Horde: Fierce
        12041,
        faction.Horde,
        12037,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Guardian of the Horde: Legion Season 5
        12042,
        faction.Horde,
        12038,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Defender of the Horde: Legion Season 5
        12043,
        faction.Horde,
        12039,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Soldier of the Horde: Legion Season 5
        12044,
        faction.Horde,
        12040,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Gladiator: Legion Season 5
        12045,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Remember the Titans
        12046,
    },
    { -- Hounds Good To Me
        12065,
    },
    { -- You Are Now Prepared!
        12066,
    },
    { -- Spheres of Influence
        12067,
    },
    { -- Explore Argus
        12069,
    },
    { -- Crucible's Promise
        12071,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Now You're Cooking with Netherlight
        12072,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Locked and Loaded
        12073,
    },
    { -- "Shoot First, Loot Later"
        12074,
    },
    { -- Protector of the Argussian Reach
        12076,
    },
    { -- Adventurer of Argus
        12077,
    },
    { -- Commander of Argus
        12078,
    },
    { -- Raiding with Leashes V: Cuteaclysm
        12079,
    },
    { -- Officer of the Light
        12081,
    },
    { -- Paragon of Argus
        12083,
    },
    { -- Infused and Abused
        12084,
    },
    { -- Anomalous Animals of Argus
        12088,
    },
    { -- Aquatic Assault
        12089,
    },
    { -- Fierce Elite
        12090,
        {
            IsPvP = true,
            {"PvP Season", 23},
        },
    },
    { -- Beast Blitz
        12091,
    },
    { -- Critical Critters
        12092,
    },
    { -- Draconic Destruction
        12093,
    },
    { -- Elemental Escalation
        12094,
    },
    { -- Fierce Fliers
        12095,
    },
    { -- Humanoid Havoc
        12096,
    },
    { -- Magical Mayhem
        12097,
    },
    { -- Mechanical Melee
        12098,
    },
    { -- Unstoppable Undead
        12099,
    },
    { -- Family Fighter
        12100,
    },
    { -- We Came Here For Two Reasons
        12101,
    },
    { -- To Kill Demons...
        12102,
    },
    { -- ...And Chew Mana Buns
        12103,
    },
    { -- And We're All Out of Mana Buns
        12104,
    },
    { -- Double Decade of Dominance
        12108,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Twenty-One Arms Salute
        12109,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Ahead of the Curve: Argus the Unmaker
        12110,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Cutting Edge: Argus the Unmaker
        12111,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- This is the War Room!
        12129,
    },
};

KrowiAF.AchievementData["07_03_02"] = {
    {KrowiAF.SetAchievementPatch, 7, 3, 2},
    { -- Rides of War
        11931,
    },
    { -- Dominant Gladiator: Legion Season 6
        12134,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Dominant Elite
        12135,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Dominant Combatant
        12136,
        faction.Horde,
        12137,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Dominant Combatant
        12137,
        faction.Alliance,
        12136,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Dominant Gladiator's Storm Dragon
        12139,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Demonic Gladiator's Storm Dragon
        12140,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Gladiator: Legion Season 6
        12167,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Gladiator: Legion Season 7
        12168,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Challenger: Legion Season 6
        12169,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Rival: Legion Season 6
        12170,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Duelist: Legion Season 6
        12171,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Hero of the Horde: Dominant
        12172,
        faction.Horde,
        12173,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Hero of the Alliance: Dominant
        12173,
        faction.Alliance,
        12172,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Defender of the Horde: Legion Season 6
        12174,
        faction.Horde,
        12175,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Defender of the Alliance: Legion Season 6
        12175,
        faction.Alliance,
        12174,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Guardian of the Horde: Legion Season 6
        12176,
        faction.Horde,
        12177,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Guardian of the Alliance: Legion Season 6
        12177,
        faction.Alliance,
        12176,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Soldier of the Horde: Legion Season 6
        12178,
        faction.Horde,
        12179,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Soldier of the Alliance: Legion Season 6
        12179,
        faction.Alliance,
        12178,
        {
            IsPvP = true,
            {"PvP Season", 24},
        },
    },
    { -- Catching Twenty-Two
        12180,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Protocol 2.3
        12181,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Demonic Double Dozen
        12182,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Prestige Quartermaster
        12183,
        {
            IsPvP = true,
            {"From", "PvP Season", 19, "Until", "PvP Season", 25},
        },
    },
    { -- Stardust Crusaders
        12257,
    },
};

KrowiAF.AchievementData["07_03_05"] = {
    {KrowiAF.SetAchievementPatch, 7, 3, 5},
    { -- Demonic Gladiator: Legion Season 7
        12185,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Duelist: Legion Season 7
        12186,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Challenger: Legion Season 7
        12187,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Rival: Legion Season 7
        12188,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Soldier of the Alliance: Legion Season 7
        12189,
        faction.Alliance,
        12190,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Soldier of the Horde: Legion Season 7
        12190,
        faction.Horde,
        12189,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Guardian of the Alliance: Legion Season 7
        12191,
        faction.Alliance,
        12192,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Guardian of the Horde: Legion Season 7
        12192,
        faction.Horde,
        12191,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Defender of the Horde: Legion Season 7
        12194,
        faction.Horde,
        12195,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Defender of the Alliance: Legion Season 7
        12195,
        faction.Alliance,
        12194,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Hero of the Horde: Demonic
        12196,
        faction.Horde,
        12197,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Hero of the Alliance: Demonic
        12197,
        faction.Alliance,
        12196,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Demonic Elite
        12198,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Demonic Combatant
        12199,
        faction.Horde,
        12200,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Demonic Combatant
        12200,
        faction.Alliance,
        12199,
        {
            IsPvP = true,
            {"PvP Season", 25},
        },
    },
    { -- Allied Races: Void Elf
        12242,
        faction.Alliance,
    },
    { -- Allied Races: Lightforged Draenei
        12243,
        faction.Alliance,
    },
    { -- Allied Races: Nightborne
        12244,
        faction.Horde,
    },
    { -- Allied Races: Highmountain Tauren
        12245,
        faction.Horde,
    },
    { -- Mechanical Brawler
        12279,
        {
            IsPvP = true,
        },
    },
    { -- Aquatic Brawler
        12280,
        {
            IsPvP = true,
        },
    },
    { -- Beast Brawler
        12281,
        {
            IsPvP = true,
        },
    },
    { -- Elemental Brawler
        12282,
        {
            IsPvP = true,
        },
    },
    { -- Magic Brawler
        12283,
        {
            IsPvP = true,
        },
    },
    { -- Critter Brawler
        12284,
        {
            IsPvP = true,
        },
    },
    { -- Undead Brawler
        12285,
        {
            IsPvP = true,
        },
    },
    { -- Flying Brawler
        12286,
        {
            IsPvP = true,
        },
    },
    { -- Dragonkin Brawler
        12287,
        {
            IsPvP = true,
        },
    },
    { -- Humanoid Brawler
        12289,
        {
            IsPvP = true,
        },
    },
    { -- Family Brawler
        12290,
        {
            IsPvP = true,
        },
    },
    { -- Heritage of the Void
        12291,
        faction.Alliance,
    },
    { -- Highmountain Tribe
        12292,
    },
    { -- The Siege of Ulduar
        12297,
    },
    { -- The Antechamber of Ulduar
        12302,
    },
    { -- The Keepers of Ulduar
        12309,
    },
    { -- The Descent into Madness
        12310,
    },
    { -- The Secrets of Ulduar
        12311,
    },
    { -- Dwarfageddon
        12312,
    },
    { -- Unbroken
        12313,
    },
    { -- Three Car Garage
        12314,
    },
    { -- Take Out Those Turrets
        12315,
    },
    { -- Shutout
        12316,
    },
    { -- Orbital Bombardment
        12317,
    },
    { -- Orbital Devastation
        12318,
    },
    { -- Nuked from Orbit
        12319,
    },
    { -- Orbit-uary
        12320,
    },
    { -- A Quick Shave
        12321,
    },
    { -- "Iron Dwarf, Medium Rare"
        12322,
    },
    { -- Shattered
        12323,
    },
    { -- Hot Pocket
        12324,
    },
    { -- Stokin' the Furnace
        12325,
    },
    { -- Nerf Engineering
        12326,
    },
    { -- Nerf Scrapbots
        12327,
    },
    { -- Nerf Gravity Bombs
        12328,
    },
    { -- Must Deconstruct Faster
        12329,
    },
    { -- Heartbreaker
        12330,
    },
    { -- "I Choose You, Runemaster Molgeim"
        12332,
    },
    { -- "I Choose You, Stormcaller Brundir"
        12333,
    },
    { -- "I Choose You, Steelbreaker"
        12334,
    },
    { -- But I'm On Your Side
        12335,
    },
    { -- Can't Do That While Stunned
        12336,
    },
    { -- With Open Arms
        12337,
    },
    { -- Disarmed
        12338,
    },
    { -- If Looks Could Kill
        12339,
    },
    { -- Rubble and Roll
        12340,
    },
    { -- Crazy Cat Lady
        12341,
    },
    { -- Nine Lives
        12342,
    },
    { -- Cheese the Freeze
        12343,
    },
    { -- I Have the Coolest Friends
        12344,
    },
    { -- Getting Cold in Here
        12345,
    },
    { -- Staying Buffed All Winter
        12346,
    },
    { -- I Could Say That This Cache Was Rare
        12347,
    },
    { -- Don't Stand in the Lightning
        12348,
    },
    { -- I'll Take You All On
        12349,
    },
    { -- Who Needs Bloodlust?
        12350,
    },
    { -- Siffed
        12351,
    },
    { -- Lose Your Illusion
        12352,
    },
    { -- Lumberjacked
        12360,
    },
    { -- Con-speed-atory
        12361,
    },
    { -- Deforestation
        12362,
    },
    { -- Getting Back to Nature
        12363,
    },
    { -- Knock on Wood
        12364,
    },
    { -- "Knock, Knock on Wood"
        12365,
    },
    { -- "Knock, Knock, Knock on Wood"
        12366,
    },
    { -- Set Up Us the Bomb
        12367,
    },
    { -- Not-So-Friendly Fire
        12368,
    },
    { -- Firefighter
        12369,
    },
    { -- Shadowdodger
        12372,
    },
    { -- I Love the Smell of Saronite in the Morning
        12373,
    },
    { -- Kiss and Make Up
        12384,
    },
    { -- Three Lights in the Darkness
        12385,
    },
    { -- Two Lights in the Darkness
        12386,
    },
    { -- One Light in the Darkness
        12387,
    },
    { -- Alone in the Darkness
        12388,
    },
    { -- Drive Me Crazy
        12395,
    },
    { -- He's Not Getting Any Older
        12396,
    },
    { -- They're Coming Out of the Walls
        12397,
    },
    { -- In His House He Waits Dreaming
        12398,
    },
    { -- Observed
        12399,
    },
    { -- Supermassive
        12400,
    },
    { -- Glory of the Ulduar Raider
        12401,
    },
    { -- Claim Jumper
        12404,
        {
            IsPvP = true,
        },
    },
    { -- Death from Above
        12405,
        {
            IsPvP = true,
        },
    },
    { -- A Good Start
        12406,
        {
            IsPvP = true,
        },
    },
    { -- Seething Shore Perfection
        12407,
        {
            IsPvP = true,
        },
    },
    { -- Seething Shore Domination
        12408,
        {
            IsPvP = true,
        },
    },
    { -- Seething Shore Victory
        12409,
        {
            IsPvP = true,
        },
    },
    { -- Seething Shore Veteran
        12410,
        {
            IsPvP = true,
        },
    },
    { -- Blood and Sand
        12411,
        {
            IsPvP = true,
        },
    },
    { -- Master of Seething Shore
        12412,
        {
            IsPvP = true,
        },
    },
    { -- Heritage of the Nightborne
        12413,
        faction.Horde,
    },
    { -- Heritage of the Lightforged
        12414,
        faction.Alliance,
    },
    { -- Heritage of Highmountain
        12415,
        faction.Horde,
    },
    { -- The Total Package
        12416,
    },
    { -- Wetlands Quests
        12429,
        faction.Alliance,
    },
    { -- Duskwood Quests
        12430,
        faction.Alliance,
    },
    { -- Post Haste
        12431,
    },
    { -- Priority Mail
        12439,
    },
    { -- Westfall & Duskwood Quests
        12455,
        faction.Alliance,
        4894,
    },
    { -- Loch Modan & Wetlands Quests
        12456,
        faction.Alliance,
        4908,
    },
};