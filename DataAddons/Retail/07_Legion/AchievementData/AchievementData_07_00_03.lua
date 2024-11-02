local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["07_00_03"] = {
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
    },
    { -- Mass Obliteration
        10586,
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
    },
    { -- Gluten Free
        10742,
    },
    { -- The Prestige
        10743,
        faction.Alliance,
        10745,
        true,
    },
    { -- The Prestige
        10745,
        faction.Horde,
        10743,
        true,
    },
    { -- Forged for Battle
        10746,
    },
    { -- Fighting with Style: Upgraded
        10747,
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
    },
    { -- Brokenly Epic
        10765,
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
    },
    { -- Part of History
        10853,
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
        },
    },
    { -- Here We Go Again
        10992,
        {
            IsPvP = true,
        },
    },
    { -- Third Time's the Charm
        10993,
        {
            IsPvP = true,
        },
    },
    { -- A Glorious Campaign
        10994,
    },
    { -- For Prestige
        10995,
        {
            IsPvP = true,
        },
    },
    { -- Got to Ketchum All
        10996,
    },
    { -- Vindictive Combatant
        10997,
        faction.Horde,
        10998,
        true,
    },
    { -- Vindictive Combatant
        10998,
        faction.Alliance,
        10997,
        true,
    },
    { -- Vindictive Gladiator's Storm Dragon
        10999,
        {
            IsPvP = true,
        },
    },
    { -- Fearless Gladiator's Storm Dragon
        11000,
        {
            IsPvP = true,
        },
    },
    { -- Cruel Gladiator's Storm Dragon
        11001,
        {
            IsPvP = true,
        },
    },
    { -- Ferocious Gladiator's Storm Dragon
        11002,
        {
            IsPvP = true,
        },
    },
    { -- Fearless Combatant
        11003,
        faction.Horde,
        11004,
        true,
    },
    { -- Fearless Combatant
        11004,
        faction.Alliance,
        11003,
        true,
    },
    { -- Cruel Combatant
        11005,
        faction.Horde,
        11008,
        true,
    },
    { -- Cruel Combatant
        11008,
        faction.Alliance,
        11005,
        true,
    },
    { -- Ferocious Combatant
        11009,
        faction.Horde,
        11010,
        true,
    },
    { -- Ferocious Combatant
        11010,
        faction.Alliance,
        11009,
        true,
    },
    { -- Gladiator: Legion Season 1
        11011,
        {
            IsPvP = true,
        },
    },
    { -- Vindictive Gladiator: Legion Season 1
        11012,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Legion Season 2
        11013,
        {
            IsPvP = true,
        },
    },
    { -- Fearless Gladiator: Legion Season 2
        11014,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Legion Season 1
        11015,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 1
        11016,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 1
        11017,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Alliance: Vindictive
        11018,
        faction.Alliance,
        11019,
        true,
    },
    { -- Hero of the Horde: Vindictive
        11019,
        faction.Horde,
        11018,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 1
        11020,
        faction.Alliance,
        11021,
        true,
    },
    { -- Guardian of the Horde: Legion Season 1
        11021,
        faction.Horde,
        11020,
        true,
    },
    { -- Defender of the Alliance: Legion Season 1
        11022,
        faction.Alliance,
        11023,
        true,
    },
    { -- Defender of the Horde: Legion Season 1
        11023,
        faction.Horde,
        11022,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 1
        11024,
        faction.Alliance,
        11025,
        true,
    },
    { -- Soldier of the Horde: Legion Season 1
        11025,
        faction.Horde,
        11024,
        true,
    },
    { -- Duelist: Legion Season 2
        11026,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 2
        11027,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 2
        11028,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Fearless
        11029,
        faction.Horde,
        11030,
        true,
    },
    { -- Hero of the Alliance: Fearless
        11030,
        faction.Alliance,
        11029,
        true,
    },
    { -- Guardian of the Horde: Legion Season 2
        11031,
        faction.Horde,
        11032,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 2
        11032,
        faction.Alliance,
        11031,
        true,
    },
    { -- Defender of the Horde: Legion Season 2
        11033,
        faction.Horde,
        11034,
        true,
    },
    { -- Defender of the Alliance: Legion Season 2
        11034,
        faction.Alliance,
        11033,
        true,
    },
    { -- Soldier of the Horde: Legion Season 2
        11035,
        faction.Horde,
        11036,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 2
        11036,
        faction.Alliance,
        11035,
        true,
    },
    { -- Cruel Gladiator: Legion Season 3
        11037,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Legion Season 3
        11038,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 3
        11039,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 3
        11040,
        {
            IsPvP = true,
        },
    },
    { -- Duelist: Legion Season 3
        11041,
        {
            IsPvP = true,
        },
    },
    { -- Hero of the Horde: Cruel
        11042,
        faction.Horde,
        11043,
        true,
    },
    { -- Hero of the Alliance: Cruel
        11043,
        faction.Alliance,
        11042,
        true,
    },
    { -- Defender of the Horde: Legion Season 3
        11044,
        faction.Horde,
        11045,
        true,
    },
    { -- Defender of the Alliance: Legion Season 3
        11045,
        faction.Alliance,
        11044,
        true,
    },
    { -- Guardian of the Horde: Legion Season 3
        11046,
        faction.Horde,
        11047,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 3
        11047,
        faction.Alliance,
        11046,
        true,
    },
    { -- Soldier of the Horde: Legion Season 3
        11048,
        faction.Horde,
        11049,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 3
        11049,
        faction.Alliance,
        11048,
        true,
    },
    { -- Soldier of the Alliance: Legion Season 4
        11050,
        faction.Alliance,
        11051,
        true,
    },
    { -- Soldier of the Horde: Legion Season 4
        11051,
        faction.Horde,
        11050,
        true,
    },
    { -- Guardian of the Alliance: Legion Season 4
        11052,
        faction.Alliance,
        11053,
        true,
    },
    { -- Guardian of the Horde: Legion Season 4
        11053,
        faction.Horde,
        11052,
        true,
    },
    { -- Defender of the Alliance: Legion Season 4
        11054,
        faction.Alliance,
        11055,
        true,
    },
    { -- Defender of the Horde: Legion Season 4
        11055,
        faction.Horde,
        11054,
        true,
    },
    { -- Hero of the Alliance: Ferocious
        11056,
        faction.Alliance,
        11057,
        true,
    },
    { -- Hero of the Horde: Ferocious
        11057,
        faction.Horde,
        11056,
        true,
    },
    { -- Duelist: Legion Season 4
        11058,
        {
            IsPvP = true,
        },
    },
    { -- Rival: Legion Season 4
        11059,
        {
            IsPvP = true,
        },
    },
    { -- Challenger: Legion Season 4
        11060,
        {
            IsPvP = true,
        },
    },
    { -- Gladiator: Legion Season 4
        11061,
        {
            IsPvP = true,
        },
    },
    { -- Ferocious Gladiator: Legion Season 4
        11062,
        {
            IsPvP = true,
        },
    },
    { -- Collector's Edition: Baby Winston
        11064,
    },
    { -- It All Makes Sense Now
        11065,
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
    },
    { -- Field Medic
        11139,
    },
    { -- Power Realized
        11144,
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
        true,
    },
    { -- Crest of Heroism
        11166,
        faction.Horde,
        11165,
        true,
    },
    { -- Crest of Carnage
        11167,
        faction.Alliance,
        11168,
        true,
    },
    { -- Crest of Carnage
        11168,
        faction.Horde,
        11167,
        true,
    },
    { -- Crest of Devastation
        11169,
        faction.Alliance,
        11170,
        true,
    },
    { -- Crest of Devastation
        11170,
        faction.Horde,
        11169,
        true,
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
    },
    { -- Cutting Edge: Gul'dan
        11192,
    },
    { -- Ahead of the Curve: Xavius
        11194,
    },
    { -- Ahead of the Curve: Gul'dan
        11195,
    },
    { -- Stand Against the Legion
        11200,
    },
    { -- Defender of Azeroth: Legion Invasions
        11201,
    },
    { -- Fight for the Alliance
        11210,
    },
    { -- Fight for the Horde
        11211,
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
    },
    { -- The Balance of Light and Shadow
        11297,
    },
    { -- A Classy Outfit
        11298,
    },
    {KrowiAF.SetAchievementPatch, 7, 0, 3}, -- Rework loading so this can go to the top, future me problem
};