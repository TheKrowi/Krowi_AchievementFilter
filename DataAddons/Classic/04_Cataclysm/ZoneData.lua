local _, addon = ...
local sharedCata = addon.Data.ZoneData.Shared.Cataclysm

local zoneData = sharedCata.ZoneData

zoneData:Zone({10, 11}, { -- Northern Barrens (zone)
    1206, -- To All The Squirrels I've Loved Before
    43, -- Kalimdor Explorer
    2556, -- Pest Control
    46, -- Universal Explorer
})

zoneData:Zone(50, { -- Northern Stranglethorn (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    4906, -- Northern Stranglethorn Quests
    940, -- Of Blood and Anguish
    941, -- Better Him Than Me
    781, -- Explore Stranglethorn Vale
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
})

zoneData:Zone({217, 218}, { -- Ruins of Gilneas (zone)
    1206, -- To All The Squirrels I've Loved Before
})

zoneData:Zone(224, { -- Stranglethorn Vale (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
})

zoneData:Zone(198, { -- Mount Hyjal (zone)
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
    4882, -- The Guardians of Hyjal
    46, -- Universal Explorer
})

zoneData:Zone(199, { -- Southern Barrens (zone)
    1206, -- To All The Squirrels I've Loved Before
    1678, -- Loremaster of Kalimdor
    43, -- Kalimdor Explorer
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
})

zoneData:Zone({201, 203, 204, 205}, { -- Vashj'ir (zone)
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
    46, -- Universal Explorer
})

zoneData:Zone({207, 208, 209}, { -- Deepholm (zone)
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
    4883, -- Therazane
    46, -- Universal Explorer
})

zoneData:Zone(210, { -- The Cape of Stranglethorn (zone)
    1206, -- To All The Squirrels I've Loved Before
    1676, -- Loremaster of Eastern Kingdoms
    42, -- Eastern Kingdoms Explorer
    4905, -- Cape of Stranglethorn Quests
    4995, -- Explore the Cape of Stranglethorn
    389, -- Gurubashi Arena Master
    396, -- Gurubashi Arena Grand Master
    762, -- Ambassador of the Horde
    871, -- Avast Ye, Admiral!
    2336, -- Insane in the Membrane
    2556, -- Pest Control
    4827, -- Surveying the Damage
    46, -- Universal Explorer
})

zoneData:Zone(241, { -- Twilight Highlands (zone)
    2556, -- Pest Control
    4875, -- Loremaster of Cataclysm
    5548, -- To All the Squirrels Who Cared for Me
    4868, -- Cataclysm Explorer
    4881, -- The Earthen Ring
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
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    4885, -- Wildhammer Clan
    4886, -- Dragonmaw Clan
    46, -- Universal Explorer
})

zoneData:Zone(249, { -- Uldum (zone)
    1206, -- To All The Squirrels I've Loved Before
    4875, -- Loremaster of Cataclysm
    4868, -- Cataclysm Explorer
    5767, -- Scourer of the Eternal Sands
    4888, -- One Hump or Two?
    4872, -- Unearthing Uldum
    4961, -- In a Thousand Years Even You Might be Worth Something
    5317, -- Help the Bombardier! I'm the Bombardier!
    4865, -- Explore Uldum
    4884, -- Ramkahen
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
    41143, -- Protocol Inferno: Grim Batol
})

zoneData:Zone({294, 295, 296}, { -- The Bastion of Twilight (raid)
    4850, -- The Bastion of Twilight
    5313, -- I Can't Hear You Over the Sound of How Awesome I Am
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
    41144, -- Protocol Inferno: Halls of Origination
})

zoneData:Zone({322, 323}, { -- Throne of the Tides (dungeon)
    5285, -- Old Faithful
    5286, -- Prince of Tides
    4839, -- Throne of the Tides
    5061, -- Heroic: Throne of the Tides
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
    41142, -- Protocol Inferno: The Vortex Pinnacle
})

zoneData:Zone(328, { -- Throne of the Four Winds (raid)
    5304, -- Stay Chill
    5305, -- Four Play
    5122, -- Heroic: Conclave of Wind
    5123, -- Heroic: Al'Akir
    4851, -- Throne of the Four Winds
})

zoneData:Zone({367, 368, 369}, { -- Firelands (raid)
    5855, -- Ragnar-O's
    5802, -- Firelands
    5839, -- Dragonwrath, Tarecgosa's Rest
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
    2336, -- Insane in the Membrane
})

zoneData:Zone({409, 410, 411, 412, 413, 414, 415}, { -- Dragon Soul (raid)
    6175, -- Holding Hands
    5518, -- Stood in the Fire
    6106, -- Siege of Wyrmrest Temple
    6107, -- Fall of Deathwing
    6177, -- Destroyer's End
    6181, -- Fangs of the Father
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
