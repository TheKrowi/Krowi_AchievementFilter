local _, addon = ...;
local shared = addon.Data.CategoryData.Shared;

tinsert(KrowiAF.CategoryData.Expansions, { -- Battle for Azeroth
    258,
    addon.GetCategoryInfoTitle(15305),
    { -- Zones
        259,
        addon.L["Zones"],
        { -- Kul Tiras & Zandalar
            271,
            addon.GetMapName(876) .. " & " .. addon.GetMapName(875),
            { -- Quests
                272,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12582, -- Come Sail Away
                    12555, -- Welcome to Zandalar
                    12997, -- The Pride of Kul Tiras
                    12593, -- Loremaster of Kul Tiras
                    13294, -- Loremaster of Zandalar
                    12891, -- A Nation United
                    12479, -- Zandalar Forever!
                    13512, -- Master Calligrapher
                    13384, -- Kul Tirans Don't Look at Explosions
                    12510, -- Ready for War
                    12509, -- Ready for War
                    13467, -- Tides of Vengeance
                    13466, -- Tides of Vengeance
                    13925, -- The Fourth War
                    13924, -- The Fourth War
                    13517, -- Two Sides to Every Tale
                    13251, -- In Teldrassil's Shadow
                    13144, -- Wide World of Quests
                    13263, -- The Shadow Hunter
                    14157, -- The Corruptor's End
                    7520, -- The Loremaster
                    40955, -- War Stories
                },
            },
            { -- Exploration
                273,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13061, -- Three Sheets to the Wind
                    12482, -- Get Hek'd
                    13036, -- A Loa of a Tale
                    13029, -- Eating Out of the Palm of My Tiny Hand
                    13027, -- Mushroom Harvest
                    14730, -- To All the Squirrels I Set Sail to See
                    12988, -- Battle for Azeroth Explorer
                    40956, -- I'm On Island Time
                },
            },
            { -- PvP
                274,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13429, -- Azerfighter
                    12572, -- War Supplied
                    12573, -- Band of Brothers
                    12605, -- Conqueror of Azeroth
                    12604, -- Conqueror of Azeroth
                },
            },
            { -- Reputation
                275,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12947, -- Azerothian Diplomat
                    12955, -- Champions of Azeroth
                    12956, -- Tortollan Seekers
                },
            },
            {
                14183, -- Conspicuous Consumption
                12587, -- Unbound Monstrosities
            },
        },
        { -- Boralus & Dazar'alor
            1447,
            addon.GetMapName(1161) .. " & " .. addon.GetMapName(1165),
            {
                12741, -- Giving a Scrap
                13056, -- Giving a Scrap
                12738, -- Holy Scrap!
                12739, -- Scraptastic!
                12740, -- Full of Scrap!
            },
        },
        { -- Tiragarde Sound
            276,
            addon.GetMapName(895),
            { -- Quests
                281,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12473, -- A Sound Plan
                    13060, -- Kul Runnings
                    13059, -- Drag Race
                    13050, -- Bless the Rains Down in Freehold
                    13049, -- The Long Con
                    12087, -- The Reining Champion
                    13285, -- Upright Citizens
                },
            },
            { -- Exploration
                278,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12556, -- Explore Tiragarde Sound
                    12939, -- Adventurer of Tiragarde Sound
                    12852, -- Treasures of Tiragarde Sound
                    13057, -- Shanty Raid
                    13058, -- Kul Tiran Up the Dance Floor
                },
            },
            { -- PvP
                279,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12577, -- Tour of Duty: Tiragarde Sound
                },
            },
            { -- Reputation
                280,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12951, -- Proudmoore Admiralty
                    12954, -- Champion of the 7th Legion
                },
            },
            {
                41205, -- Sound Off
            },
        },
        { -- Drustvar
            282,
            addon.GetMapName(896),
            { -- Quests
                283,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12497, -- Drust Do It.
                },
            },
            { -- Exploration
                284,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12557, -- Explore Drustvar
                    12941, -- Adventurer of Drustvar
                    12995, -- Treasures of Drustvar
                    13087, -- Sausage Sampler
                    13083, -- Better, Faster, Stronger
                    13082, -- Everything Old Is New Again
                    13064, -- Drust the Facts, Ma'am
                    13094, -- Cursed Game Hunter
                },
            },
            { -- PvP
                285,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12579, -- Tour of Duty: Drustvar
                },
            },
            { -- Reputation
                286,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12952, -- Order of Embers
                },
            },
            {
                41207, -- When the Drust Settles
            },
        },
        { -- Stormsong Valley
            287,
            addon.GetMapName(942),
            { -- Quests
                288,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12496, -- Stormsong and Dance
                    13054, -- Sabertron Assemble
                    13053, -- Deadliest Cache
                    13047, -- Clever Use of Mechanical Explosives
                    13046, -- These Hills Sing
                    13045, -- Every Day I'm Truffling
                    13042, -- About To Break
                    13062, -- Let's Bee Friends
                },
            },
            { -- Exploration
                289,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12558, -- Explore Stormsong Valley
                    12940, -- Adventurer of Stormsong Valley
                    12853, -- Treasures of Stormsong Valley
                    13051, -- Legends of the Tidesages
                },
            },
            { -- PvP
                290,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12578, -- Tour of Duty: Stormsong Valley
                },
            },
            { -- Reputation
                291,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12953, -- Storm's Wake
                },
            },
            {
                41206, -- Songs of Storms
            },
        },
        { -- Zuldazar
            292,
            addon.GetMapName(862),
            { -- Quests
                293,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    11861, -- The Throne of Zuldazar
                    12480, -- A Bargain of Blood
                    12481, -- The Final Seal
                    13441, -- Pushing the Payload
                    13039, -- Paku'ai
                    13048, -- Life Finds a Way... To Die!
                    13038, -- Raptari Rider
                    12719, -- Spirits Be With You
                    13020, -- Bow to Your Masters
                    12614, -- Loa Expectations
                    13030, -- How to Ptrain Your Pterrordax
                    13573, -- How to Ptrain Your Pterrordax
                    13542, -- How to Train Your Direhorn
                    13035, -- By de Power of de Loa!
                    13440, -- Pushing the Payload
                },
            },
            { -- Exploration
                294,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12559, -- Explore Zuldazar
                    12944, -- Adventurer of Zuldazar
                    12851, -- Treasures of Zuldazar
                },
            },
            { -- PvP
                295,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12575, -- Tour of Duty: Zuldazar
                    13439, -- Boxing Match
                    13438, -- Boxing Match
                },
            },
            { -- Reputation
                296,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12950, -- Zandalari Empire
                    12957, -- Champion of the Honorbound
                },
            },
            {
                41202, -- Hot Tropic
            },
        },
        { -- Nazmir
            297,
            addon.GetMapName(863),
            { -- Quests
                298,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13026, -- 7th Legion Spycatcher
                    13025, -- Zandalari Spycatcher
                    11868, -- The Dark Heart of Nazmir
                    13048, -- Life Finds a Way... To Die!
                    13023, -- It's Really Getting Out of Hand
                    13022, -- Revenge is Best Served Speedily
                    13021, -- A Most Efficient Apocalypse
                    13426, -- Come On and Slam
                },
            },
            { -- Exploration
                299,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12561, -- Explore Nazmir
                    12942, -- Adventurer of Nazmir
                    12771, -- Treasures of Nazmir
                    12588, -- Eat Your Greens
                    13024, -- Carved in Stone, Written in Blood
                    13028, -- Hoppin' Sad
                },
            },
            { -- PvP
                300,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12574, -- Tour of Duty: Nazmir
                },
            },
            { -- Reputation
                301,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12948, -- Talanji's Expedition
                },
            },
            {
                41203, -- Bwon Voyage
            },
        },
        { -- Vol'dun
            302,
            addon.GetMapName(864),
            { -- Quests
                303,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    12478, -- Secrets in the Sands
                    13009, -- Adept Sandfisher
                    13011, -- Scourge of Zem'lan
                    13014, -- Vorrik's Champion
                    13041, -- Hungry, Hungry Ranishu
                    13017, -- Champion of the Vulpera
                    13437, -- Scavenge like a Vulpera
                },
            },
            { -- Exploration
                304,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    12560, -- Explore Vol'dun
                    12943, -- Adventurer of Vol'dun
                    12849, -- Treasures of Vol'dun
                    13016, -- Scavenger of the Sands
                    13018, -- Dune Rider
                },
            },
            { -- PvP
                305,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    12576, -- Tour of Duty: Vol'dun
                },
            },
            { -- Reputation
                306,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    12949, -- The Voldunai
                },
            },
            {
                41204, -- Dune Squad
            },
        },
        { -- Mechagon Island
            307,
            addon.GetMapName(1462),
            { -- Quests
                308,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13553, -- The Mechagonian Threat
                    13700, -- The Mechagonian Threat
                    13790, -- Armed for Action
                    13791, -- Making the Mount
                },
            },
            { -- Exploration
                309,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13776, -- Explore Mechagon
                    13470, -- Rest In Pistons
                    13472, -- Deep Pockets
                    13482, -- Head Financier of Mechagon
                    13473, -- Diversified Investments
                    13474, -- Junkyard Machinist
                    13696, -- Scrappy's Best Friend
                    13686, -- Junkyard Melomaniac
                    13475, -- Junkyard Scavenger
                    13477, -- Junkyard Apprentice
                    13476, -- Junkyard Tinkerer
                    13555, -- Junkyard Tinkmaster
                    13478, -- Junkyard Collector
                    13479, -- Junkyard Architect
                    13556, -- Outside Influences
                    13513, -- Available in Eight Colors
                    13541, -- Mecha-Done
                },
            },
            { -- PvP
                310,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13570, -- Tour of Duty: Mechagon
                },
            },
            { -- Reputation
                311,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    13557, -- Rustbolt Rebellion
                },
            },
            {
                13708, -- Most Minis Wins
            },
        },
        { -- Nazjatar
            312,
            addon.GetMapName(1355),
            { -- Quests
                313,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    13710, -- Sunken Ambitions
                    13709, -- Unfathomable
                },
            },
            { -- Exploration
                314,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    13712, -- Explore Nazjatar
                    13635, -- Tour of the Depths
                    13690, -- Nazjatarget Eliminated
                    13691, -- I Thought You Said They'd Be Rare?
                    13692, -- Give Me the Biggest Bag You've Got
                    13743, -- Seasoned: Hunter Akana
                    13746, -- Seasoned: Neri Sharpfin
                    13753, -- Veteran: Hunter Akana
                    13749, -- Veteran: Neri Sharpfin
                    13758, -- Battle-Scarred: Hunter Akana
                    13750, -- Battle-Scarred: Neri Sharpfin
                    13744, -- Seasoned: Bladesman Inowari
                    13747, -- Seasoned: Poen Gillbrack
                    13754, -- Veteran: Bladesman Inowari
                    13751, -- Veteran: Poen Gillbrack
                    13759, -- Battle-Scarred: Bladesman Inowari
                    13756, -- Battle-Scarred: Poen Gillbrack
                    13745, -- Seasoned: Farseer Ori
                    13748, -- Seasoned: Vim Brineheart
                    13755, -- Veteran: Farseer Ori
                    13752, -- Veteran: Vim Brineheart
                    13760, -- Battle-Scarred: Farseer Ori
                    13757, -- Battle-Scarred: Vim Brineheart
                    13704, -- Nautical Battlefield Training
                    13645, -- Nautical Battlefield Training
                    13762, -- Aqua Team Murder Force
                    13761, -- Aqua Team Murder Force
                    13711, -- A Fistful of Manapearls
                    13765, -- Subaquatic Support
                    13549, -- Trove Tracker
                    13722, -- Terror of the Tadpoles
                    13699, -- Periodic Destruction
                    13713, -- Nothing To Scry About
                    13707, -- Mrrl's Secret Stash
                    13763, -- Back to the Depths!
                    13764, -- Puzzle Performer
                    13836, -- Feline Figurines Found
                    13638, -- Undersea Usurper
                },
            },
            { -- PvP
                315,
                addon.GetCategoryInfoTitle(95),
                true,
                {
                    13569, -- Tour of Duty: Nazjatar
                    13568, -- For Nazjatar!
                    13720, -- Supplying the Assassins
                },
            },
            { -- Reputation
                316,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    13558, -- Waveblade Ankoan
                    13559, -- The Unshackled
                },
            },
        },
        { -- Vale of Eternal Blossoms
            317,
            addon.GetMapName(1530),
            { -- Quests
                318,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14154, -- Defend the Vale
                    14161, -- All Consuming
                },
            },
            { -- Exploration
                447,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14160, -- Rare to Well Done
                    14159, -- Combating the Corruption
                    14158, -- It's Not A Tumor!
                },
            },
            { -- Reputation
                321,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14156, -- The Rajani
                },
            },
            {
                40959, -- Black Empire State of Mind
            }
        },
        { -- Uldum
            322,
            addon.GetMapName(1527),
            { -- Quests
                323,
                addon.GetCategoryInfoTitle(96),
                true,
                {
                    14153, -- Uldum Under Assault
                    14161, -- All Consuming
                },
            },
            { -- Exploration
                448,
                addon.GetCategoryInfoTitle(97),
                true,
                {
                    14160, -- Rare to Well Done
                    14159, -- Combating the Corruption
                    14158, -- It's Not A Tumor!
                },
            },
            { -- Reputation
                324,
                addon.GetCategoryInfoTitle(201),
                true,
                {
                    14155, -- Uldum Accord
                },
            },
            {
                40959, -- Black Empire State of Mind
            }
        },
        {
            46, -- Universal Explorer
        },
    },
    { -- Dungeons
        325,
        addon.GetCategoryInfoTitle(15272),
        { -- Freelhold
            327,
            addon.GetInstanceInfoName(1001),
            {
                12550, -- Pecking Order
                12548, -- I'm in Charge Now!
                12998, -- That Sweete Booty
                12831, -- Freehold
                12832, -- Heroic: Freehold
                12833, -- Mythic: Freehold
                17848, -- Keystone Hero: Freehold
            },
        },
        { -- Waycrest Manor
            328,
            addon.GetInstanceInfoName(1021),
            {
                12495, -- Run Wild Like a Man On Fire
                12490, -- Alchemical Romance
                12489, -- Losing My Profession
                12483, -- Waycrest Manor
                12484, -- Heroic: Waycrest Manor
                12488, -- Mythic: Waycrest Manor
                19086, -- Keystone Hero: Waycrest Manor
            },
        },
        { -- Shrine of the Storm
            329,
            addon.GetInstanceInfoName(1036),
            {
                12600, -- Breath of the Shrine
                12601, -- The Void Lies Sleeping
                12602, -- Trust No One
                12835, -- Shrine of the Storm
                12837, -- Heroic: Shrine of the Storm
                12838, -- Mythic: Shrine of the Storm
            },
        },
        { -- Atal'Dazar
            330,
            addon.GetInstanceInfoName(968),
            {
                12270, -- Bringing Hexy Back
                12272, -- Gold Fever
                12273, -- It's Lit!
                12824, -- Atal'Dazar
                12825, -- Heroic: Atal'Dazar
                12826, -- Mythic: Atal'Dazar
                19087, -- Keystone Hero: Atal'Dazar
            },
        },
        { -- The Underrot
            331,
            addon.GetInstanceInfoName(1022),
            {
                12498, -- Taint Nobody Got Time For That
                12549, -- Not a Fun Guy
                12499, -- Sporely Alive
                12500, -- Underrot
                12501, -- Heroic: Underrot
                12502, -- Mythic: Underrot
                17849, -- Keystone Hero: The Underrot
            },
        },
        { -- Temple of Sethraliss
            332,
            addon.GetInstanceInfoName(1030),
            {
                12507, -- Snake Eater
                12503, -- Snake Eyes
                12508, -- Good Night, Sweet Prince
                12504, -- The Temple of Sethraliss
                12505, -- Heroic: The Temple of Sethraliss
                12506, -- Mythic: The Temple of Sethraliss
            },
        },
        { -- Tol Dagor
            333,
            addon.GetInstanceInfoName(1002),
            {
                12457, -- Remix to Ignition
                12462, -- Shot Through the Heart
                12840, -- Tol Dagor
                12841, -- Heroic: Tol Dagor
                12842, -- Mythic: Tol Dagor
            },
        },
        { -- The MOTHERLODE!!
            334,
            addon.GetInstanceInfoName(1012),
            {
                12855, -- Pitch Invasion
                12854, -- Ready for Raiding VI
                12844, -- The MOTHERLODE!!
                12845, -- Heroic: The MOTHERLODE!!
                12846, -- Mythic: The MOTHERLODE!!
                40965, -- Keystone Hero: The MOTHERLODE!!
            },
        },
        { -- Siege of Boralus
            335,
            addon.GetInstanceInfoName(1023),
            {
                12727, -- Stand by Me
                12726, -- A Fish Out of Water
                12489, -- Losing My Profession
                12847, -- Siege of Boralus
                20587, -- Keystone Hero: Siege of Boralus
            },
        },
        { -- Kings' Rest
            336,
            addon.GetInstanceInfoName(1041),
            {
                12722, -- It Belongs in a Mausoleum!
                12721, -- Wrap God
                12723, -- How to Keep a Mummy
                12848, -- Kings' Rest
            },
        },
        { -- Operation: Mechagon
            337,
            addon.GetInstanceInfoName(1178),
            {
                13706, -- Stay Positive
                13698, -- Clean Up On Aisle Mechagon
                13723, -- M.C., Hammered
                13545, -- Go Ahead, Make My Daisy
                13624, -- Keep DPS-ing and Nobody Explodes
                13789, -- Hertz Locker
                15693, -- Keystone Hero: Operation: Mechagon
                40966, -- Keystone Hero: Operation: Mechagon - Workshop
            },
        },
        {
            12807, -- Battle for Azeroth Dungeon Hero
            12812, -- Glory of the Wartorn Hero
            13075, -- Battle for Azeroth Keymaster
            13079, -- Battle for Azeroth Keystone Conqueror: Season One
            13080, -- Battle for Azeroth Keystone Master: Season One
            13448, -- Battle for Azeroth Keystone Conqueror: Season Two
            13449, -- Battle for Azeroth Keystone Master: Season Two
            13780, -- Battle for Azeroth Keystone Conqueror: Season Three
            13781, -- Battle for Azeroth Keystone Master: Season Three
            14144, -- Battle for Azeroth Keystone Conqueror: Season Four
            14145, -- Battle for Azeroth Keystone Master: Season Four
        },
    },
    { -- Raids
        326,
        addon.GetCategoryInfoTitle(15271),
        { -- Uldir
            338,
            addon.GetInstanceInfoName(1031),
            { -- Glory
                862,
                addon.L["Glory"],
                {
                    12937, -- Elevator Music
                    12938, -- Parental Controls
                    12828, -- What's in the Box?
                    12823, -- Thrash Mouth - All Stars
                    12772, -- Now We Got Bad Blood
                    12830, -- Edgelords
                    12836, -- Existential Crisis
                    12551, -- Double Dribble
                },
            },
            { -- Mythic
                864,
                addon.L["Mythic"],
                {
                    12524, -- Mythic: Taloc
                    12526, -- Mythic: MOTHER
                    12527, -- Mythic: Zek'voz
                    12530, -- Mythic: Fetid Devourer
                    12529, -- Mythic: Vectis
                    12531, -- Mythic: Zul
                    12532, -- Mythic: Mythrax the Unraveler
                    12533, -- Mythic: G'huun
                },
            },
            {
                12521, -- Halls of Containment
                12522, -- Crimson Descent
                12523, -- Heart of Corruption
                40960, -- Uldir
                12536, -- Ahead of the Curve: G'huun
                12535, -- Cutting Edge: G'huun
                12991, -- New Mog, G'huun This?
            },
        },
        { -- Battle of Dazar'alor
            339,
            addon.GetInstanceInfoName(1176),
            { -- Glory
                865,
                addon.L["Glory"],
                {
                    13316, -- Can I Get a Hek Hek Hek Yeah?
                    13431, -- Hidden Dragon
                    13383, -- Barrel of Monkeys
                    13345, -- Praise the Sunflower
                    13325, -- Walk the Dinosaur
                    13425, -- We Got Spirit, How About You?
                    13401, -- I Got Next!
                    13430, -- De Lurker Be'loa
                    13410, -- Snow Fun Allowed
                },
            },
            { -- Mythic
                866,
                addon.L["Mythic"],
                {
                    13292, -- Mythic: Champion of the Light
                    13298, -- Mythic: Jadefire Masters
                    13293, -- Mythic: Grong
                    13295, -- Mythic: Jadefire Masters
                    13299, -- Mythic: Opulence
                    13300, -- Mythic: Conclave of the Chosen
                    13311, -- Mythic: King Rastakhan
                    13312, -- Mythic: Mekkatorque
                    13313, -- Mythic: Stormwall Blockade
                    13314, -- Mythic: Lady Jaina Proudmoore
                },
            },
            {
                13286, -- Siege of Dazar'alor
                13289, -- Defense of Dazar'alor
                13287, -- Empire's Fall
                13290, -- Death's Bargain
                13288, -- Might of the Alliance
                13291, -- Victory or Death
                40961, -- Battle of Dazar'alor
                13322, -- Ahead of the Curve: Lady Jaina Proudmoore
                13323, -- Cutting Edge: Lady Jaina Proudmoore
                13385, -- Daz'aling Attire
            },
        },
        { -- Crucible of Storms
            340,
            addon.GetInstanceInfoName(1177),
            {
                13501, -- Gotta Bounce
                13506, -- A Good Eye-dea
                13414, -- Crucible of Storms
                13416, -- Mythic: The Restless Cabal
                13417, -- Mythic: Uu'nat, Harbinger of the Void
                13418, -- Ahead of the Curve: Uu'nat, Harbinger of the Void
                13419, -- Cutting Edge: Uu'nat, Harbinger of the Void
            },
        },
        { -- The Eternal Palace
            341,
            addon.GetInstanceInfoName(1179),
            { -- Glory
                869,
                addon.L["Glory"],
                {
                    13684, -- You and What Army?
                    13628, -- Intro to Marine Biology
                    13767, -- Fun Run
                    13629, -- Simple Geometry
                    13724, -- A Smack of Jellyfish
                    13633, -- If It Pleases the Court
                    13716, -- Lactose Intolerant
                    13768, -- The Best of Us
                },
            },
            { -- Mythic
                870,
                addon.L["Mythic"],
                {
                    13726, -- Mythic: Abyssal Commander Sivara
                    13728, -- Mythic: Blackwater Behemoth
                    13727, -- Mythic: Radiance of Azshara
                    13729, -- Mythic: Lady Ashvane
                    13730, -- Mythic: Orgozoa
                    13731, -- Mythic: The Queen's Court
                    13732, -- Mythic: Za'qul
                    13733, -- Mythic: Queen Azshara
                },
            },
            {
                13718, -- The Grand Reception
                13719, -- Depths of the Devoted
                13725, -- The Circle of Stars
                40962, -- The Eternal Palace
                13784, -- Ahead of the Curve: Queen Azshara
                13785, -- Cutting Edge: Queen Azshara
                13571, -- Under the Seams
            },
        },
        { -- Ny'alotha, the Waking City
            342,
            addon.GetInstanceInfoName(1180),
            { -- Glory
                871,
                addon.L["Glory"],
                {
                    14019, -- Smoke Test
                    14008, -- Mana Sponge
                    14037, -- Phase 3: Prophet
                    14024, -- Buzzer Beater
                    14139, -- Total Annihilation
                    14023, -- Realizing Your Potential
                    13999, -- How? Isn't it Obelisk?
                    13990, -- You Can Pet the Dog, But...
                    14026, -- Temper Tantrum
                    14038, -- Bloody Mess
                    14147, -- Cleansing Treatment
                    14148, -- It's Not A Cult
                },
            },
            { -- Mythic
                872,
                addon.L["Mythic"],
                {
                    14041, -- Mythic: Wrathion, the Black Emperor
                    14043, -- Mythic: Maut
                    14044, -- Mythic: The Prophet Skitra
                    14045, -- Mythic: Dark Inquisitor Xanesh
                    14050, -- Mythic: Vexiona
                    14046, -- Mythic: The Hivemind
                    14051, -- Mythic: Ra-den the Despoiled
                    14048, -- Mythic: Shad'har the Insatiable
                    14049, -- Mythic: Drest'agath
                    14052, -- Mythic: Il'gynoth, Corruption Reborn
                    14054, -- Mythic: Carapace of N'Zoth
                    14055, -- Mythic: N'Zoth the Corruptor
                },
            },
            {
                14193, -- Vision of Destiny
                14194, -- Halls of Devotion
                14195, -- Gift of Flesh
                14196, -- The Waking Dream
                40963, -- Ny'alotha, the Waking City
                14068, -- Ahead of the Curve: N'Zoth the Corruptor
                14069, -- Cutting Edge: N'Zoth the Corruptor
                14058, -- All Eyes On Me
            },
        },
        {
            12806, -- Glory of the Uldir Raider
            13315, -- Glory of the Dazar'alor Raider
            13687, -- Glory of the Eternal Raider
            14146, -- Glory of the Ny'alotha Raider
        },
    },
    { -- Professions
        1157,
        addon.GetCategoryInfoTitle(169),
        { -- Alchemy
            1467,
            addon.GetCategoryInfoTitle(15489),
            true,
            {
                18770, -- Silas' Sphere of Transmutation
            },
        },
        { -- Archaeology
            1474,
            addon.GetCategoryInfoTitle(15071),
            true,
            {
                12760, -- Kul Tiran Archaeologist
                12761, -- Zandalari Archaeologist
                12762, -- Kul Tiran Curator
                12764, -- Zandalari Curator
                12765, -- Exotic Discoveries
                12769, -- Light Travel
                12770, -- Lengthy Legwork
            },
        },
        { -- Blacksmithing
            1475,
            addon.GetCategoryInfoTitle(15490),
            true,
            {
                18771, -- Khaz'gorian Smithing Hammer
            },
        },
        { -- Cooking
            1483,
            addon.GetCategoryInfoTitle(170),
            true,
            {
                12742, -- Kul Tiran Cook
                12743, -- Zandalari Cook
                12744, -- The Kul Tiran Menu
                12746, -- The Zandalari Menu
                12747, -- Catering for Combat
            },
        },
        { -- Enchanting
            1486,
            addon.GetCategoryInfoTitle(15491),
            true,
            {
                18775, -- Iwen's Enchanting Rod
            },
        },
        { -- Engineering
            1488,
            addon.GetCategoryInfoTitle(15492),
            true,
            {
                18776, -- The Ub3r-Spanner
            },
        },
        { -- Fishing
            1494,
            addon.GetCategoryInfoTitle(171),
            true,
            {
                12753, -- Kul Tiran Fisherman
                12754, -- Zandalari Fisherman
                12757, -- Angling for Battle
                12755, -- Scent of the Sea
                12756, -- Fish Me In the Moonlight
                12758, -- Baiting the Enemy
                12759, -- Baiting the Enemy
                12990, -- Catchin' Some Rays
                13489, -- Secret Fish of Mechagon
            },
        },
        { -- Herbalism
            1503,
            addon.GetCategoryInfoTitle(15499),
            true,
            {
                18838, -- Fourth War Herbalism Techniques
            },
        },
        { -- Inscription
            1505,
            addon.GetCategoryInfoTitle(15493),
            true,
            {
                18772, -- Sanguine Feather Quill of Lana'thel
            },
        },
        { -- Jewelcrafting
            1507,
            addon.GetCategoryInfoTitle(15494),
            true,
            {
                18773, -- Jewelhammer's Focus
            },
        },
        { -- Leatherworking
            1511,
            addon.GetCategoryInfoTitle(15495),
            true,
            {
                18777, -- Mallet of Thunderous Skins
            },
        },
        { -- Mining
            1518,
            addon.GetCategoryInfoTitle(15497),
            true,
            {
                18840, -- Fourth War Mining Techniques
            },
        },
        { -- Skinning
            1522,
            addon.GetCategoryInfoTitle(15498),
            true,
            {
                18835, -- Fourth War Skinning Techniques
            },
        },
        { -- Tailoring
            1525,
            addon.GetCategoryInfoTitle(15496),
            true,
            {
                18774, -- Synchronous Thread
                18896, -- United as Three
            },
        },
        {
            12731, -- Professional Kul Tiran Master
            12733, -- Professional Zandalari Master
            12734, -- Working in Kul Tiras
            12735, -- Working in Zandalar
            12736, -- Kul Tiran Master of All
            12737, -- Zandalari Master of All
            13516, -- Massive Tool
            18778, -- Massive Toolshed
        },
    },
    { -- Pet Battles
        343,
        addon.GetCategoryInfoTitle(15117),
        {
            12930, -- Battle Safari
            13693, -- Mecha-Safari
            13694, -- Nazjatari Safari
            13715, -- From The Belly Of The Jelly
            12936, -- Battle on Zandalar and Kul Tiras
            13280, -- Hobbyist Aquarist
            13270, -- Beast Mode
            13271, -- Critters With Huge Teeth
            13272, -- Dragons Make Everything Better
            13273, -- Element of Success
            13274, -- Fun With Flying
            13281, -- Human Resources
            13275, -- Magician's Secrets
            13277, -- Machine Learning
            13278, -- Not Quite Dead Yet
            13279, -- Family Battler
            13625, -- Mighty Minions of Mechagon
            13626, -- Nautical Nuisances of Nazjatar
            13695, -- Team Aquashock
        },
    },
    { -- Brawler's Guild
        793,
        addon.L["Brawler's Guild"],
        {
            11558, -- The First Rule of Brawler's Guild
            11559, -- The First Rule of Brawler's Guild
            13186, -- You Are Not Your $#*@! Legplates
            13188, -- You Are Not Your $#*@! Legplates
            13189, -- The Second Rule of Brawler's Guild
            13190, -- The Second Rule of Brawler's Guild
            13191, -- Brawler for Azeroth
            13192, -- Brawler for Azeroth
            11567, -- You Are Not The Contents Of Your Wallet
            11570, -- Educated Guesser
            13194, -- I Am Thrall's Complete Lack Of Surprise
            11573, -- Rumble Club
        },
    },
    { -- Dueler's Guild
        851,
        addon.L["Dueler's Guild"],
        {
            12856, -- The First Rule of Dueler's Guild
            12857, -- Trial by Combat
            12858, -- Slugfest
            12860, -- Contender
            12863, -- Dueling Master
            12859, -- Prize Fighter
            12861, -- Master of Duels
            12862, -- Thirty Six and Two
            13623, -- Fighting on Two Fronts
        },
    },
    { -- Island Expeditions
        425,
        addon.GetCategoryInfoTitle(15307),
        { -- Un'gol Ruins
            436,
            (addon.GetLFGDungeonInfo(1687)),
            {
                12590, -- Un'gol Ruins
                12589, -- Heroic: Un'gol Ruins
                12591, -- Mythic: Un'gol Ruins
                12592, -- Ruined the Ruins
            },
        },
        { -- The Dread Chain
            437,
            (addon.GetLFGDungeonInfo(1734)),
            {
                13095, -- Dread Chain
                13096, -- Heroic: Dread Chain
                13097, -- Mythic: Dread Chain
                13098, -- Bane of the Chain
            },
        },
        { -- The Rotting Mire
            438,
            (addon.GetLFGDungeonInfo(1723)),
            {
                13103, -- Rotting Mire
                13104, -- Heroic: Rotting Mire
                13105, -- Mythic: Rotting Mire
                13106, -- Mire Marauder
            },
        },
        { -- The Molten Cay
            439,
            (addon.GetLFGDungeonInfo(1750)),
            {
                13099, -- Molten Cay
                13100, -- Heroic: Molten Cay
                13101, -- Mythic: Molten Cay
                13102, -- Clash at the Cay
            },
        },
        { -- Verdant Wilds
            440,
            (addon.GetLFGDungeonInfo(1724)),
            {
                13111, -- Verdant Wilds
                13112, -- Heroic: Verdant Wilds
                13113, -- Mythic: Verdant Wilds
                13114, -- War for the Wilds
            },
        },
        { -- Skittering Hollow
            441,
            (addon.GetLFGDungeonInfo(1725)),
            {
                13107, -- Skittering Hollow
                13108, -- Heroic: Skittering Hollow
                13109, -- Mythic: Skittering Hollow
                13110, -- Skittering Smashed
            },
        },
        { -- The Whispering Reef
            442,
            (addon.GetLFGDungeonInfo(1735)),
            {
                13119, -- Whispering Reef
                13118, -- Heroic: Whispering Reef
                13116, -- Mythic: Whispering Reef
                13115, -- Reef Madness
            },
        },
        { -- Jorundall
            443,
            (addon.GetLFGDungeonInfo(1932)),
            {
                13389, -- Jorundall
                13394, -- Heroic: Jorundall
                13395, -- Mythic: Jorundall
                13399, -- Jorundall Justice
            },
        },
        { -- Havenswood
            444,
            (addon.GetLFGDungeonInfo(1928)),
            {
                13396, -- Havenswood
                13397, -- Heroic: Havenswood
                13398, -- Mythic: Havenswood
                13400, -- Havenswood Hero
            },
        },
        { -- Crestfall
            445,
            (addon.GetLFGDungeonInfo(1984)),
            {
                13577, -- Crestfall
                13578, -- Heroic: Crestfall
                13579, -- Mythic: Crestfall
                13580, -- Crestfallen
            },
        },
        { -- Snowblossom Village
            446,
            (addon.GetLFGDungeonInfo(1983)),
            {
                13581, -- Snowblossom Village
                13582, -- Heroic: Snowblossom Village
                13583, -- Mythic: Snowblossom Village
                13584, -- Snowblossom Scrapper
            },
        },
        {
            13142, -- Archipelago Explorer
            13122, -- Island Conqueror
            13141, -- Island Slayer
            12596, -- No Tourist
            12594, -- Competent Captain
            12595, -- Expert Expeditioner
            12597, -- Bayside Brawler
            13120, -- Blood in the Water
            13121, -- Notorious
            13129, -- Sucker Punch
            13123, -- My Dubs
            13124, -- Metal Detector
            13125, -- Azerite Admiral
            13126, -- Give Me The Energy
            13127, -- Tell Me A Tale
            13128, -- I'm Here for the Pets
            13132, -- Helping Hand
            13133, -- Team Deathmatch
            13135, -- Team Deathmatch
            13134, -- Expedition Leader
            13701, -- Battlefield Brawler
            13702, -- Battlefield Tactician
            13703, -- Battlefield Master
        },
    },
    { -- War Effort
        426,
        addon.GetCategoryInfoTitle(15308),
        { -- Battle for Stromgarde
            434,
            (addon.GetLFGDungeonInfo(1615)),
            {
                12881, -- War is Hell
                12873, -- War is Hell
                13737, -- Heroic: War is Hell
                13735, -- Heroic: War is Hell
                12888, -- Strike Hard
                12877, -- Strike Hard
                12889, -- Strike Fast
                12876, -- Strike Fast
                12884, -- Leader of Troops
                12878, -- Leader of Troops
                12886, -- Tour of War
                12879, -- Tour of War
                13739, -- Heroic: Tour of War
                13738, -- Heroic: Tour of War
                12874, -- An Eventful Battle
            },
        },
        { -- The Battle for Darkshore
            435,
            (addon.GetLFGDungeonInfo(1901)),
            {
                13297, -- War for the Shore
                13296, -- War for the Shore
                14150, -- Heroic: War for the Shore
                14149, -- Heroic: War for the Shore
                13302, -- Under Cover of Darkness
                13301, -- Under Cover of Darkness
                13305, -- Night Moves
                13306, -- Night Moves
                13308, -- Recruitment Officer
                13307, -- Recruitment Officer
                13310, -- By Nature's Call
                13309, -- Deforester
            },
        },
        {
            12867, -- Azeroth at War: The Barrens
            12896, -- Azeroth at War: The Barrens
            12869, -- Azeroth at War: After Lordaeron
            12898, -- Azeroth at War: After Lordaeron
            12870, -- Azeroth at War: Kalimdor on Fire
            12899, -- Azeroth at War: Kalimdor on Fire
            12872, -- The Dirty Five
            40957, -- Maximum Effort
        },
    },
    { -- Heart of Azeroth
        427,
        addon.GetCategoryInfoTitle(15417),
        {
            12918, -- Have a Heart
            13998, -- Pure of Heart
            13572, -- The Heart Forge
            13769, -- Power Up
            13770, -- Power Creep
            13771, -- Power Is Beautiful
            13772, -- Essence Essentials
            13773, -- Essence Gains
            13775, -- Essence Overload
            13777, -- My Heart Container is Full
            13779, -- Phenomenal Cosmic Power
            40958, -- Full Heart, Can't Lose
        },
    },
    { -- Visions of N'Zoth
        428,
        addon.GetCategoryInfoTitle(15426),
        {
            14143, -- Reeking of Visions
            13994, -- Through the Depths of Visions
            14060, -- Unwavering Resolve
            14061, -- We Have the Technology
            14062, -- Horrific Vision of Stormwind
            14064, -- The Even More Horrific Vision of Stormwind
            14066, -- The Most Horrific Vision of Stormwind
            14063, -- Horrific Vision of Orgrimmar
            14065, -- The Even More Horrific Vision of Orgrimmar
            14067, -- The Most Horrific Vision of Orgrimmar
            14162, -- Horrific Masquerade
            14165, -- Masked Soliloquy
            14166, -- Masked Duet
            14167, -- Masked Trio
            14168, -- Masked Quartet
            14169, -- Symphony of Masks
            14170, -- Thanks For The Mementos
            14171, -- Memento Mori
            14172, -- A Monumental Amount of Mementos
            14173, -- A Mountain of Mementos
            14140, -- Mad World
        },
    },
    {
        12989, -- Battle for Azeroth Pathfinder, Part One
        13250, -- Battle for Azeroth Pathfinder, Part Two
        40953, -- A Farewell to Arms
        41209, -- Dressed to Kill: Battle for Azeroth
    },
});