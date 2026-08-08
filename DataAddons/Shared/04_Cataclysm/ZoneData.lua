local _, addon = ...
addon.Data.ZoneData.Shared.Cataclysm = {}
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("Cataclysm")

zoneData:Zone(337, { -- Zul'Gurub (dungeon)
    560, -- Deadliest Catch
    688, -- Zul'Gurub
    880, -- Swift Zulian Tiger
    881, -- Swift Razzashi Raptor
    957, -- Hero of the Zandalar Tribe
    5743, -- It's Not Easy Being Green
    5762, -- Ohganot So Fast!
    5765, -- Here, Kitty Kitty...
    5759, -- Spirit Twister
    5744, -- Gurubashi Headhunter
    5768, -- Heroic: Zul'Gurub
    912, -- Elders of Eastern Kingdoms
})

zoneData:Zone(206, { -- Twin Peaks (battleground)
    shared.GenericBattleground,
    5208, -- Twin Peaking
    5209, -- Twin Peaks Veteran
    5210, -- Two-Timer
    5211, -- Top Defender
    5213, -- Soaring Spirits
    5214, -- Soaring Spirits
    5215, -- Twin Peaks Perfection
    5216, -- Peak Speed
    5226, -- Cloud Nine
    5227, -- Cloud Nine
    5229, -- Drag a Maw
    5228, -- Wild Hammering
    5219, -- I'm in the White Lodge
    5220, -- I'm in the Black Lodge
    5221, -- Fire, Walk With Me
    5222, -- Fire, Walk With Me
    5230, -- Twin Peaks Mountaineer
    5231, -- Double Jeopardy
    5552, -- Double Jeopardy
    5223, -- Master of Twin Peaks
})

zoneData:Zone(244, { -- Tol Barad (battleground)
    shared.GenericBattleground,
    5548, -- To All the Squirrels Who Cared for Me
    5489, -- Master of Tol Barad
    5490, -- Master of Tol Barad
    4874, -- Breaking Out of Tol Barad
    5718, -- Just Another Day in Tol Barad
    5719, -- Just Another Day in Tol Barad
    5412, -- Tol Barad Victory
    5418, -- Tol Barad Veteran
    5417, -- Tol Barad Veteran
    5415, -- Tower Plower
    5488, -- Towers of Power
    5487, -- Tol Barad Saboteur
    5486, -- Tol Barad All-Star
    5375, -- Baradin's Wardens
    5376, -- Hellscream's Reach
})

zoneData:Zone(245, { -- Tol Barad Peninsula (zone)
    2556, -- Pest Control
    5548, -- To All the Squirrels Who Cared for Me
    5489, -- Master of Tol Barad
    5490, -- Master of Tol Barad
    4874, -- Breaking Out of Tol Barad
    5718, -- Just Another Day in Tol Barad
    5719, -- Just Another Day in Tol Barad
    5412, -- Tol Barad Victory
    5418, -- Tol Barad Veteran
    5417, -- Tol Barad Veteran
    5415, -- Tower Plower
    5488, -- Towers of Power
    5487, -- Tol Barad Saboteur
    5486, -- Tol Barad All-Star
    5375, -- Baradin's Wardens
    5376, -- Hellscream's Reach
})

zoneData:Zone(275, { -- The Battle for Gilneas (battleground)
    shared.GenericBattleground,
    5245, -- Battle for Gilneas Victory
    5246, -- Battle for Gilneas Veteran
    5247, -- Battle for Gilneas Perfection
    5248, -- Bustin' Caps to Make It Haps
    5249, -- One Two Three You Don't Know About Me
    5250, -- Out of the Fog
    5251, -- Not Your Average PUG'er
    5252, -- Don't Get Cocky Kid
    5253, -- Full Coverage
    5254, -- Newbs to Plowshares
    5255, -- Jugger Not
    5256, -- Battle for Gilneas All-Star
    5257, -- Battle for Gilneas Assassin
    5262, -- Double Rainbow
    5258, -- Master of the Battle for Gilneas
})

zoneData:Zone(282, { -- Baradin Hold (raid)
    5416, -- Pit Lord Argaloth
    6045, -- Occu'thar
    6108, -- Alizabal
})

zoneData:Zone(338, { -- Molten Front (zone)
    5859, -- Legacy of Leyara
    5866, -- The Molten Front Offensive
    5867, -- Flawless Victory
    5871, -- Master of the Molten Flow
    5872, -- King of the Spider-Hill
    5874, -- Death From Above
    5873, -- Ready for Raiding II
    5879, -- Veteran of the Molten Front
})

zoneData:Zone(398, { -- Well of Eternity (dungeon)
    6127, -- Lazy Eye
    6070, -- That's Not Canon!
    6118, -- Heroic: Well of Eternity
})

zoneData:Zone({399, 400}, { -- Hour of Twilight (dungeon)
    6132, -- Eclipse
    6119, -- Heroic: Hour of Twilight
})

zoneData:Zone({401, 402, 403, 404, 405, 406}, { -- End Time (dungeon)
    5995, -- Moon Guard
    6130, -- Severed Ties
    6117, -- Heroic: End Time
})

zoneData:Zone(241, { -- Twilight Highlands (zone)
    4875, -- Loremaster of Cataclysm
    7520, -- The Loremaster
    shared.OldWorldPetAchievements,
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    7525, -- Taming Cataclysm
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    2556, -- Pest Control
    5548, -- To All the Squirrels Who Cared for Me
    4873, -- Fading into Twilight
    5501, -- Fading into Twilight
    4960, -- Round Three. Fight!
    5481, -- Wildhammer Tour of Duty
    5482, -- Dragonmaw Tour of Duty
    5320, -- King of the Mountain
    5321, -- King of the Mountain
    5451, -- Consumed by Nightmare
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    4866, -- Explore Twilight Highlands
    4868, -- Cataclysm Explorer
    46, -- Universal Explorer
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    4885, -- Wildhammer Clan
    4886, -- Dragonmaw Clan
    4881, -- The Earthen Ring
    61430, -- Crunching for Cultists
    42300, -- Two Minutes to Midnight
})

zoneData:Zone({10, 11}, { -- Northern Barrens (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    11200, -- Stand Against the Legion
    11201, -- Defender of Azeroth: Legion Invasions
    16431, -- Against the Elements
    4933, -- The Barrens Quests
    750, -- The Barrens Quests
    762, -- Ambassador of the Horde
    2336, -- Insane in the Membrane
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    46, -- Universal Explorer
    911, -- Elders of Kalimdor
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
})

zoneData:Zone(50, { -- Northern Stranglethorn (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4906, -- Northern Stranglethorn Quests
    940, -- Of Blood and Anguish
    941, -- Better Him Than Me
    781, -- Explore Stranglethorn Vale
    17366, -- Northern Stranglethorn Quests
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone({217, 1030, 1031}, { -- Ruins of Gilneas (zone)
    1206, -- To All The Squirrels I've Loved Before
    948, -- Ambassador of the Alliance
})

zoneData:Zone(224, { -- Stranglethorn Vale (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
})

zoneData:Zone(198, { -- Mount Hyjal (zone)
    7520, -- The Loremaster
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4875, -- Loremaster of Cataclysm
    5548, -- To All the Squirrels Who Cared for Me
    4868, -- Cataclysm Explorer
    4870, -- Coming Down the Mountain
    4959, -- Beware of the 'Unbeatable?' Pterodactyl
    5860, -- The 'Unbeatable?' Pterodactyl: BEATEN.
    5483, -- Bounce
    5859, -- Legacy of Leyara
    5866, -- The Molten Front Offensive
    5861, -- The Fiery Lords of Sethria's Roost
    5870, -- Fireside Chat
    5862, -- Ludicrous Speed
    5868, -- And the Meek Shall Inherit Kalimdor
    5864, -- Gang War
    5865, -- Have... Have We Met?
    5869, -- Infernal Ambassadors
    5879, -- Veteran of the Molten Front
    4863, -- Explore Hyjal
    9924, -- Field Photographer
    4882, -- The Guardians of Hyjal
    7525, -- Taming Cataclysm
    46, -- Universal Explorer
})

zoneData:Zone(199, { -- Southern Barrens (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    4937, -- Southern Barrens Quests
    4981, -- Southern Barrens Quests
    4996, -- Explore Southern Barrens
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6602, -- Taming Kalimdor
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    963, -- Tricks and Treats of Kalimdor
    965, -- Tricks and Treats of Kalimdor
    1023, -- Flame Warden of Kalimdor
    1026, -- Flame Keeper of Kalimdor
    1029, -- Extinguishing Kalimdor
    1032, -- Extinguishing Kalimdor
})

zoneData:Zone({201, 203, 204, 205}, { -- Vashj'ir (zone)
    7520, -- The Loremaster
    4875, -- Loremaster of Cataclysm
    5548, -- To All the Squirrels Who Cared for Me
    4868, -- Cataclysm Explorer
    4881, -- The Earthen Ring
    4869, -- Sinking into Vashj'ir
    4982, -- Sinking into Vashj'ir
    5452, -- Visions of Vashj'ir Past
    5318, -- 20,000 Leagues Under the Sea
    5319, -- 20,000 Leagues Under the Sea
    4825, -- Explore Vashj'ir
    4975, -- From Hell's Heart I Stab at Thee
    9924, -- Field Photographer
    46, -- Universal Explorer
})

zoneData:Zone({207, 208, 209}, { -- Deepholm (zone)
    7520, -- The Loremaster
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    8348, -- The Longest Day
    4875, -- Loremaster of Cataclysm
    4868, -- Cataclysm Explorer
    4881, -- The Earthen Ring
    4871, -- Deep into Deepholm
    5445, -- Fungalophobia
    5446, -- The Glop Family Line
    5449, -- Rock Lover
    5450, -- Fungal Frenzy
    5447, -- My Very Own Broodmother
    4864, -- Explore Deepholm
    9924, -- Field Photographer
    4883, -- Therazane
    7525, -- Taming Cataclysm
    46, -- Universal Explorer
})

zoneData:Zone(210, { -- The Cape of Stranglethorn (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    7520, -- The Loremaster
    4905, -- Cape of Stranglethorn Quests
    4995, -- Explore the Cape of Stranglethorn
    9924, -- Field Photographer
    389, -- Gurubashi Arena Master
    396, -- Gurubashi Arena Grand Master
    762, -- Ambassador of the Horde
    871, -- Avast Ye, Admiral!
    306, -- Master Angler of Azeroth
    2336, -- Insane in the Membrane
    6586, -- Eastern Kingdoms Safari
    6613, -- Eastern Kingdoms Tamer
    6603, -- Taming Eastern Kingdoms
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
    912, -- Elders of Eastern Kingdoms
    966, -- Tricks and Treats of Eastern Kingdoms
    967, -- Tricks and Treats of Eastern Kingdoms
    1022, -- Flame Warden of Eastern Kingdoms
    1025, -- Flame Keeper of Eastern Kingdoms
    1028, -- Extinguishing Eastern Kingdoms
    1031, -- Extinguishing Eastern Kingdoms
})

zoneData:Zone(249, { -- Uldum (zone)
    1206, -- To All The Squirrels I've Loved Before
    7520, -- The Loremaster
    6585, -- Kalimdor Safari
    6612, -- Kalimdor Tamer
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    6611, -- Continental Tamer
    6590, -- World Safari
    8348, -- The Longest Day
    4875, -- Loremaster of Cataclysm
    4868, -- Cataclysm Explorer
    5767, -- Scourer of the Eternal Sands
    4888, -- One Hump or Two?
    4872, -- Unearthing Uldum
    4961, -- In a Thousand Years Even You Might be Worth Something
    5317, -- Help the Bombardier! I'm the Bombardier!
    4865, -- Explore Uldum
    4884, -- Ramkahen
    7525, -- Taming Cataclysm
    46, -- Universal Explorer
})

zoneData:Zone(277, { -- Lost City of the Tol'vir (dungeon)
    5291, -- Acrocalypse Now
    5290, -- Kill It With Fire!
    5292, -- Headed South
    4848, -- Lost City of the Tol'vir
    5066, -- Heroic: Lost City of the Tol'vir
    41145, -- Protocol Inferno: Lost City of the Tol'vir
})

zoneData:Zone({283, 284}, { -- Blackrock Caverns (dungeon)
    5281, -- Crushing Bones and Cracking Skulls
    5282, -- Arrested Development
    5283, -- Too Hot to Handle
    5284, -- Ascendant Descending
    4833, -- Blackrock Caverns
    5060, -- Heroic: Blackrock Caverns
    41139, -- Protocol Inferno: Blackrock Caverns
})

zoneData:Zone({285, 286}, { -- Blackwing Descent (raid)
    4842, -- Blackwing Descent
    11754, -- Glamour of Twilight
    12079, -- Raiding with Leashes V: Cuteaclysm
    5306, -- Parasite Evening
    5307, -- Achieve-a-tron
    5309, -- Full of Sound and Fury
    5308, -- Silence is Golden
    5310, -- Aberrant Behavior
    4849, -- Keeping it in the Family
    5094, -- Heroic: Magmaw
    5107, -- Heroic: Omnotron Defense System
    5115, -- Heroic: Chimaeron
    5109, -- Heroic: Atramedes
    5108, -- Heroic: Maloriak
    5116, -- Heroic: Nefarian
})

zoneData:Zone(293, { -- Grim Batol (dungeon)
    5297, -- Umbrage for Umbriss
    5298, -- Don't Need to Break Eggs to Make an Omelet
    4840, -- Grim Batol
    5062, -- Heroic: Grim Batol
    20588, -- Keystone Hero: Grim Batol
    41143, -- Protocol Inferno: Grim Batol
})

zoneData:Zone({294, 295, 296}, { -- The Bastion of Twilight (raid)
    4850, -- The Bastion of Twilight
    5313, -- I Can't Hear You Over the Sound of How Awesome I Am
    11754, -- Glamour of Twilight
    12079, -- Raiding with Leashes V: Cuteaclysm
    5300, -- The Only Escape
    4852, -- Double Dragon
    5311, -- Elementary
    5312, -- The Abyss Will Gaze Back Into You
    5118, -- Heroic: Halfus Wyrmbreaker
    5117, -- Heroic: Valiona and Theralion
    5119, -- Heroic: Ascendant Council
    5120, -- Heroic: Cho'gall
    5121, -- Heroic: Sinestra
})

zoneData:Zone({297, 298, 299}, { -- Halls of Origination (dungeon)
    5293, -- I Hate That Song
    5294, -- Straw That Broke the Camel's Back
    5296, -- Faster Than the Speed of Light
    5295, -- Sun of a....
    4841, -- Halls of Origination
    5065, -- Heroic: Halls of Origination
    9924, -- Field Photographer
    41144, -- Protocol Inferno: Halls of Origination
})

zoneData:Zone({322, 323}, { -- Throne of the Tides (dungeon)
    5285, -- Old Faithful
    5286, -- Prince of Tides
    4839, -- Throne of the Tides
    5061, -- Heroic: Throne of the Tides
    19082, -- Keystone Hero: Throne of the Tides
    41140, -- Protocol Inferno: Throne of the Tides
})

zoneData:Zone(324, { -- The Stonecore (dungeon)
    5287, -- Rotten to the Core
    4846, -- The Stonecore
    5063, -- Heroic: The Stonecore
    41141, -- Protocol Inferno: The Stonecore
})

zoneData:Zone(325, { -- The Vortex Pinnacle (dungeon)
    5289, -- Extra Credit Bonus Stage
    5288, -- No Static at All
    4847, -- The Vortex Pinnacle
    5064, -- Heroic: The Vortex Pinnacle
    17847, -- Keystone Hero: The Vortex Pinnacle
    41142, -- Protocol Inferno: The Vortex Pinnacle
})

zoneData:Zone(328, { -- Throne of the Four Winds (raid)
    5304, -- Stay Chill
    5305, -- Four Play
    5122, -- Heroic: Conclave of Wind
    5123, -- Heroic: Al'Akir
    4851, -- Throne of the Four Winds
    12079, -- Raiding with Leashes V: Cuteaclysm
})

zoneData:Zone({367, 368, 369}, { -- Firelands (raid)
    5855, -- Ragnar-O's
    5802, -- Firelands
    11755, -- Hot Couture
    5839, -- Dragonwrath, Tarecgosa's Rest
    12079, -- Raiding with Leashes V: Cuteaclysm
    5821, -- Death from Above
    5813, -- Do a Barrel Roll!
    5810, -- Not an Ambi-Turner
    5829, -- Bucket List
    5830, -- Share the Pain
    5799, -- Only the Penitent...
    5807, -- Heroic: Beth'tilac
    5809, -- Heroic: Alysrazor
    5808, -- Heroic: Lord Rhyolith
    5806, -- Heroic: Shannox
    5805, -- Heroic: Baleroc
    5804, -- Heroic: Majordomo Fandral Staghelm
    5803, -- Heroic: Ragnaros
    5827, -- Avengers of Hyjal
})

zoneData:Zone({407, 408}, { -- Darkmoon Island (zone)
    6019, -- Come One, Come All!
    6021, -- Blastenheimer Bullseye
    6023, -- Darkmoon Duelist
    6024, -- Darkmoon Dominator
    6027, -- Darkmoon Dungeoneer
    6028, -- Darkmoon Defender
    6029, -- Darkmoon Despoiler
    6032, -- Faire Favors
    6026, -- Fairegoer's Feast
    6025, -- I Was Promised a Pony
    6022, -- Quick Shot
    6020, -- Step Right Up
    6030, -- Taking the Show on the Road
    6031, -- Taking the Show on the Road
    6332, -- That Rabbit's Dynamite!
    9250, -- Flying High
    9251, -- Ringmaster
    9252, -- Brood of Alysrazor
    9885, -- Ace Tonk Commander
    9894, -- Triumphant Turtle Tossing
    9983, -- That's Whack!
    9755, -- Darkmoon Race Enthusiast
    9756, -- Darkmoon Racer Novice
    9759, -- Darkmoon Racer Jockey
    9760, -- Darkmoon Racer Leadfoot
    9761, -- Darkmoon Racer Roadhog
    9770, -- Blast Off!
    9769, -- Rocketeer: Bronze
    9766, -- Rocketeer: Silver
    9764, -- Rocketeer: Gold
    9786, -- Wayfarer
    9787, -- Wanderluster: Bronze
    9790, -- Wanderluster: Silver
    9792, -- Wanderluster: Gold
    9780, -- Go-Getter
    9781, -- Powermonger: Bronze
    9783, -- Powermonger: Silver
    9785, -- Powermonger: Gold
    9793, -- Big Race Enthusiast
    9794, -- Big Race Novice
    9795, -- Big Race Jockey
    9797, -- Big Race Leadfoot
    9799, -- Big Race Roadhog
    9800, -- Rocket Man
    9801, -- Big Rocketeer: Bronze
    9803, -- Big Rocketeer: Silver
    9805, -- Big Rocketeer: Gold
    9806, -- Vagabond
    9807, -- Big Wanderluster: Bronze
    9809, -- Big Wanderluster: Silver
    9811, -- Big Wanderluster: Gold
    9812, -- Goal-Oriented
    9813, -- Big Powermonger: Bronze
    9815, -- Big Powermonger: Silver
    9817, -- Big Powermonger: Gold
    9819, -- Darkmoon Like the Wind
    11918, -- Hey, You're a Rockstar!
    11919, -- Taking this Show on the Road
    11920, -- Perfect Performance
    11921, -- Mosh Pit
    15212, -- First Dance
    15213, -- Don't Stop Dancing
    15222, -- You Got the Beat
    15223, -- Feeling It
    15214, -- What a Feeling
    15215, -- Can't Stop the Feeling
    15216, -- Make You Sweat
    15217, -- Maniac on the Dance Floor
    15221, -- Dancing Machine
    2336, -- Insane in the Membrane
})

zoneData:Zone({409, 410, 411, 412, 413, 414, 415}, { -- Dragon Soul (raid)
    6175, -- Holding Hands
    5518, -- Stood in the Fire
    6106, -- Siege of Wyrmrest Temple
    6107, -- Fall of Deathwing
    6177, -- Destroyer's End
    11756, -- Wardrobe of the Old Gods
    6181, -- Fangs of the Father
    12079, -- Raiding with Leashes V: Cuteaclysm
    6174, -- Don't Stand So Close to Me
    6128, -- Ping Pong Champion
    6129, -- Taste the Rainbow!
    6084, -- Minutes to Midnight
    6105, -- Deck Defender
    6133, -- Maybe He'll Get Dizzy...
    6180, -- Chromatic Champion
    6109, -- Heroic: Morchok
    6110, -- Heroic: Warlord Zon'ozz
    6111, -- Heroic: Yor'sahj the Unsleeping
    6112, -- Heroic: Hagara the Stormbinder
    6113, -- Heroic: Ultraxion
    6114, -- Heroic: Warmaster Blackhorn
    6115, -- Heroic: Spine of Deathwing
    6116, -- Heroic: Madness of Deathwing
})
