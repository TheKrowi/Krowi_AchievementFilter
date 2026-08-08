local _, addon = ...;
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT


KrowiAF.CategoryData.Specials = { -- TAB - Specials
    971,
    addon.L["Specials"],
    {
        TabName = "Specials",
    },
    { -- The Entitled Player
        addon.L["The Entitled"] .. " " .. (UnitName("player")),
        { -- Classic
            CT.Classic,
            { -- Reputation
                CT.Reputation,
                true,
                {
                    948, -- Ambassador of the Alliance
                    762, -- Ambassador of the Horde
                    871, -- "Avast Ye, Admiral!"
                    2336, -- Insane in the Membrane
                },
            },
            {
                15579, -- Return to Lordaeron
            },
        },
        { -- Wrath of the Lich King
            CT.WrathOfTheLichKing,
            { -- Reputation
                CT.Reputation,
                true,
                {
                    942, -- The Diplomat
                    943, -- The Diplomat
                    4598, -- The Ashen Verdict
                    953, -- Guardian of Cenarius
                    945, -- The Argent Champion
                    2764, -- Exalted Champion of Stormwind
                    2765, -- Exalted Champion of Orgrimmar
                    2763, -- Exalted Champion of Ironforge
                    2769, -- Exalted Champion of the Undercity
                    2760, -- Exalted Champion of Darnassus
                    2768, -- Exalted Champion of Thunder Bluff
                    2761, -- Exalted Champion of the Exodar
                    2767, -- Exalted Champion of Silvermoon City
                    2762, -- Exalted Champion of Gnomeregan
                    2766, -- Exalted Champion of Sen'jin
                    2817, -- Exalted Argent Champion of the Alliance
                    2816, -- Exalted Argent Champion of the Horde
                },
            },
            { -- Raids
                CT.Raids,
                true,
                {
                    2051, -- The Twilight Zone (10 player)
                    2054, -- The Twilight Zone (25 player)
                    1658, -- Champion of the Frozen Wastes
                    3316, -- Herald of the Titans
                    3036, -- Observed (10 player)
                    3037, -- Observed (25 player)
                    4583, -- Bane of the Fallen King
                    4597, -- The Frozen Throne (25 player)
                    4584, -- The Light of Dawn
                },
            },
        },
        { -- Cataclysm
            CT.Cataclysm,
            { -- Exploration
                CT.Exploration,
                true,
                {
                    5879, -- Veteran of the Molten Front
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    5827, -- Avengers of Hyjal
                },
            },
            { -- Raids
                CT.Raids,
                true,
                {
                    5116, -- Heroic: Nefarian
                    5121, -- Heroic: Sinestra
                    5123, -- Heroic: Al'Akir
                    5506, -- Defender of a Shattered World
                    5803, -- Heroic: Ragnaros
                    6177, -- Destroyer's End
                    6116, -- Heroic: Madness of Deathwing
                },
            },
            {
                5767, -- Scourer of the Eternal Sands
            },
        },
        { -- Other
            addon.L["Other"],
            { -- Quests
                CT.Quests,
                true,
                {
                    978, -- 3000 Quests Completed
                    7520, -- The Loremaster
                },
            },
            { -- Exploration
                CT.Exploration,
                true,
                {
                    46, -- Universal Explorer
                    9924, -- Field Photographer
                    12439, -- Priority Mail
                },
            },
            { -- Reputation
                CT.Reputation,
                true,
                {
                    1015, -- 40 Exalted Reputations
                    6742, -- 60 Exalted Reputations
                    12864, -- 80 Exalted Reputations
                    12866, -- 100 Exalted Reputations
                },
            },
            { -- Dungeons
                CT.Dungeons,
                true,
                {
                    4477, -- Looking For Many
                },
            },
            { -- Professions
                CT.Professions,
                true,
                {
                    1516, -- Accomplished Angler
                    7306, -- Master of Pandaren Cooking
                    9464, -- Professional Draenor Master
                    4855, -- What was Briefly Yours is Now Mine
                    4856, -- It Belongs in a Museum!
                    1563, -- Hail to the Chef
                },
            },
            { -- Events
                addon.L["Events"],
                true,
                {
                    913, -- To Honor One's Elders
                    1693, -- Fool For Love
                    2798, -- Noble Gardener
                    1793, -- For the Children
                    1038, -- The Flame Warden
                    1039, -- The Flame Keeper
                    1683, -- Brewmaster
                    1656, -- Hallowed Be Thy Name
                    3478, -- Pilgrim
                    1691, -- Merrymaker
                },
            },
            { -- PvP
                CT.PvP,
                { -- Honor
                true,
                        CT.Honor,
                true,
                    {
                        12901, -- Honor Level 25
                        12904, -- Honor Level 50
                        12907, -- Honor Level 80
                        12909, -- Honor Level 100
                        12913, -- Honor Level 200
                        12915, -- Honor Level 300
                        870, -- 100000 Honorable Kills
                        5363, -- 250000 Honorable Kills
                    },
                },
                { -- Battlegrounds
                        CT.Battlegrounds,
                true,
                    {
                        907, -- The Justicar
                        714, -- The Conqueror
                        8360, -- Master of Deepwind Gorge
                        12412, -- Master of Seething Shore
                        230, -- Battlemaster
                        1175, -- Battlemaster
                        8052, -- Khan
                        8055, -- Khan
                    },
                },
                { -- Rated
                        addon.L["Rated"],
                true,
                    {
                        5328, -- Veteran of the Alliance
                        5325, -- Veteran of the Horde
                        5329, -- Warbound Veteran of the Alliance
                        5326, -- Warbringer of the Horde
                        5330, -- Private
                        5345, -- Scout
                        5331, -- Corporal
                        5346, -- Grunt
                        5332, -- Sergeant
                        5347, -- Sergeant
                        5333, -- Master Sergeant
                        5348, -- Senior Sergeant
                        5334, -- Sergeant Major
                        5349, -- First Sergeant
                        5335, -- Knight
                        5350, -- Stone Guard
                        5336, -- Knight-Lieutenant
                        5351, -- Blood Guard
                        5337, -- Knight-Captain
                        5352, -- Legionnaire
                        5359, -- Knight-Champion
                        5338, -- Centurion
                        5339, -- Lieutenant Commander
                        5353, -- Champion
                        5340, -- Commander
                        5354, -- Lieutenant General
                        5341, -- Marshal
                        5355, -- General
                        5357, -- Field Marshal
                        5342, -- Warlord
                        5343, -- Grand Marshal
                        5356, -- High Warlord
                    },
                },
            },
        },
    },
    { -- Realm First!
        addon.L["Realm First!"],
        { -- Leveling
            addon.L["Leveling"],
            { -- Level 80
                addon.L["Level 80"],
                true,
                {
                    457, -- Realm First! Level 80 (Legacy)
                    459, -- Realm First! Level 80 Warrior (Legacy)
                    465, -- Realm First! Level 80 Paladin (Legacy)
                    462, -- Realm First! Level 80 Hunter (Legacy)
                    458, -- Realm First! Level 80 Rogue (Legacy)
                    464, -- Realm First! Level 80 Priest (Legacy)
                    461, -- Realm First! Level 80 Death Knight (Legacy)
                    467, -- Realm First! Level 80 Shaman (Legacy)
                    460, -- Realm First! Level 80 Mage (Legacy)
                    463, -- Realm First! Level 80 Warlock (Legacy)
                    466, -- Realm First! Level 80 Druid (Legacy)
                    1408, -- Realm First! Level 80 Human (Legacy)
                    1410, -- Realm First! Level 80 Orc (Legacy)
                    1407, -- Realm First! Level 80 Dwarf (Legacy)
                    1409, -- Realm First! Level 80 Night Elf (Legacy)
                    1413, -- Realm First! Level 80 Forsaken (Legacy)
                    1411, -- Realm First! Level 80 Tauren (Legacy)
                    1404, -- Realm First! Level 80 Gnome (Legacy)
                    1412, -- Realm First! Level 80 Troll (Legacy)
                    1405, -- Realm First! Level 80 Blood Elf (Legacy)
                    1406, -- Realm First! Level 80 Draenei (Legacy)
                },
            },
            { -- Level 85
                addon.L["Level 85"],
                true,
                {
                    4999, -- Realm First! Level 85 (Legacy)
                    5007, -- Realm First! Level 85 Warrior (Legacy)
                    5001, -- Realm First! Level 85 Paladin (Legacy)
                    5004, -- Realm First! Level 85 Hunter (Legacy)
                    5008, -- Realm First! Level 85 Rogue (Legacy)
                    5002, -- Realm First! Level 85 Priest (Legacy)
                    5005, -- Realm First! Level 85 Death Knight (Legacy)
                    4998, -- Realm First! Level 85 Shaman (Legacy)
                    5006, -- Realm First! Level 85 Mage (Legacy)
                    5003, -- Realm First! Level 85 Warlock (Legacy)
                    5000, -- Realm First! Level 85 Druid (Legacy)
                },
            },
        },
        { -- Professions
            CT.Professions,
            { -- 450 skill
                addon.L["450 skill"],
                true,
                {
                    1415, -- Realm First! Grand Master Alchemist
                    1420, -- Realm First! Grand Master Angler
                    5395, -- Realm First! Grand Master Archaeologist
                    1414, -- Realm First! Grand Master Blacksmith
                    1416, -- Realm First! Grand Master Cook
                    1417, -- Realm First! Grand Master Enchanter
                    1418, -- Realm First! Grand Master Engineer
                    1421, -- Realm First! Grand Master Herbalist
                    1423, -- Realm First! Grand Master Jewelcrafter
                    1424, -- Realm First! Grand Master Leatherworker
                    1419, -- Realm First! Grand Master Medic
                    1425, -- Realm First! Grand Master Miner
                    1422, -- Realm First! Grand Master Scribe
                    1426, -- Realm First! Grand Master Skinner
                    1427, -- Realm First! Grand Master Tailor
                },
            },
            { -- 525 skill
                addon.L["525 skill"],
                true,
                {
                    5381, -- Realm First! Illustrious Alchemist
                    5387, -- Realm First! Illustrious Angler
                    5396, -- Realm First! Illustrious Archaeologist
                    5382, -- Realm First! Illustrious Blacksmith
                    5383, -- Realm First! Illustrious Cook
                    5384, -- Realm First! Illustrious Enchanter
                    5385, -- Realm First! Illustrious Engineer
                    5388, -- Realm First! Illustrious Herbalist
                    5390, -- Realm First! Illustrious Jewelcrafter
                    5391, -- Realm First! Illustrious Leatherworker
                    5386, -- Realm First! Illustrious Medic
                    5392, -- Realm First! Illustrious Miner
                    5389, -- Realm First! Illustrious Scribe
                    5393, -- Realm First! Illustrious Skinner
                    5394, -- Realm First! Illustrious Tailor
                },
            },
        },
        { -- Reputation
            true,
            CT.Reputation,
            {
                1463, -- Realm First! Northrend Vanguard
                6829, -- Realm First! Pandaren Ambassador
            },
        },
        { -- Raids
            true,
            CT.Raids,
            {
                1402, -- Realm First! Conqueror of Naxxramas
                456, -- Realm First! Obsidian Slayer
                1400, -- Realm First! Magic Seeker
                3117, -- Realm First! Death's Demise
                3259, -- Realm First! Celestial Defender
                4078, -- Realm First! Grand Crusader
                4576, -- Realm First! Fall of the Lich King
            },
        },
    },
    { -- Promotions
        CT.Promotions,
        { -- BlizzCon
            true,
            addon.L["BlizzCon"],
            {
                411, -- Murky
                412, -- Murloc Costume
                415, -- Big Blizzard Bear
                3536, -- The Marine Marine
                5378, -- Deathy
                6185, -- Murkablo
                8793, -- Murkalot
                9763, -- Grommloc
                10322, -- Murkidan
                11294, -- Murloc Battlemasters
                11931, -- Rides of War
                13138, -- Flying Colors
                14027, -- Battle for Mrrglroth
                14904, -- Netherwhelp Online
                18250, -- Ysergle The Dreamurk
            },
        },
        { -- Collector's Edition
            true,
            addon.L["Collector's Edition"],
            {
                662, -- Collector's Edition: Mini-Diablo
                663, -- Collector's Edition: Panda
                664, -- Collector's Edition: Zergling
                665, -- Collector's Edition: Netherwhelp
                683, -- Collector's Edition: Frost Wyrm Whelp
                5377, -- Collector's Edition: Lil' Deathwing
                6849, -- Collector's Edition: Imperial Quilen
                6848, -- Collector's Edition: Lucky Quilen Cub
                8913, -- Collector's Edition: Dread Raven
                8915, -- Collector's Edition: Dread Hatchling
                10320, -- Collector's Edition: Illidari Felstalker
                10321, -- Collector's Edition: Nibbles
                12229, -- Collector's Edition: Seabraid Stallion
                12230, -- Collector's Edition: Gilded Ravasaur
                12232, -- Collector's Edition: Tottle
                14283, -- Heroic Edition: Ensorcelled Everwyrm
                16332, -- The Perfect Pebble
                17314, -- Heroic Edition: Tangled Dreamweaver
                19027, -- Heroic Edition: Algarian Stormrider
                18928, -- Storm Rider: Bronze
                18929, -- Storm Rider: Silver
                18931, -- Storm Rider: Gold
                19030, -- Squally
            },
        },
        { -- StarCraft II
            true,
            addon.L["StarCraft II"],
            {
                4824, -- Collector's Edition: Mini Thor
                7842, -- Collector's Edition: Baneling
                10309, -- Collector's Edition: Zeradar
                12454, -- Salute to StarCraft
            },
        },
        {
            414, -- Tyrael's Hilt
            10537, -- Patron of War
            10657, -- Fledgling Hero of Warcraft
            11210, -- Fight for the Alliance
            11211, -- Fight for the Horde
            15594, -- Fearless Spectator
            17305, -- Trading Post: Dragonflight
            19029, -- Lil' Maggz
            19031, -- Fyrn
        },
    },
    { -- Ta's Pet Collection
        addon.L["Ta's Pet Collection"],
        { -- Pet Battles
            CT.PetBattles,
            {
                1250, -- "Shop Smart, Shop Pet...Smart"
                2516, -- Lil' Game Hunter
                5876, -- Petting Zoo
                5877, -- Menagerie
                5875, -- Littlest Pet Shop
                7521, -- Time to Open a Pet Store
                6582, -- Pro Pet Mob
                9069, -- An Awfully Big Adventure
                8297, -- Merciless Pet Brawler
                8298, -- Vengeful Pet Brawler
                8300, -- Brutal Pet Brawler
            },
        },
        { -- Wrath of the Lich King
            CT.WrathOfTheLichKing,
            {
                1956, -- Higher Learning
            },
        },
        { -- Cataclysm
            CT.Cataclysm,
            {
                5449, -- Rock Lover
            },
        },
        {
            8820, -- WoW's 10th Anniversary
            3478, -- Pilgrim
        },
    },
};
