local _, addon = ...
local shared = addon.Data.CategoryData.Shared
local CT = shared.CT

local expansion = KrowiAF.NewExpansion(CT.Cataclysm, {
    4887, -- Tripping the Rifts
    5535, -- 1000 Valor Points
    5536, -- 5000 Valor Points
    5537, -- 25,000 Valor Points
    5538, -- 50,000 Valor Points
    6924, -- 100,000 Valor Points
})

local zones = expansion:Zones{
    4875, -- Loremaster of Cataclysm
    4827, -- Surveying the Damage
    5548, -- To All the Squirrels Who Cared for Me
    5754, -- Drown Your Sorrows
    5753, -- Cataclysmically Delicious
    4868, -- Cataclysm Explorer
    4881, -- The Earthen Ring
    7520, -- The Loremaster
}
local vashjir = zones:Zone(203)
vashjir:Quests{
    4869, -- Sinking into Vashj'ir
    4982, -- Sinking into Vashj'ir
    5452, -- Visions of Vashj'ir Past
    5318, -- 20,000 Leagues Under the Sea
    5319, -- 20,000 Leagues Under the Sea
}
vashjir:Exploration{
    4825, -- Explore Vashj'ir
    4975, -- From Hell's Heart I Stab at Thee
    9924, -- Field Photographer
}
local mountHyjal = zones:Zone(198)
mountHyjal:Quests{
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
}
mountHyjal:Exploration{
    4863, -- Explore Hyjal
    9924, -- Field Photographer
}
mountHyjal:Reputation{
    4882, -- The Guardians of Hyjal
}
local deepholm = zones:Zone(207)
deepholm:Quests{
    4871, -- Deep into Deepholm
    5445, -- Fungalophobia
    5446, -- The Glop Family Line
    5449, -- Rock Lover
    5450, -- Fungal Frenzy
    5447, -- My Very Own Broodmother
}
deepholm:Exploration{
    4864, -- Explore Deepholm
    9924, -- Field Photographer
}
deepholm:Reputation{
    4883, -- Therazane
}
local uldum = zones:Zone(249, {
    5767, -- Scourer of the Eternal Sands
    4888, -- One Hump or Two?
})
uldum:Quests{
    4872, -- Unearthing Uldum
    4961, -- In a Thousand Years Even You Might be Worth Something
    5317, -- Help the Bombardier! I'm the Bombardier!
}
uldum:Exploration{
    4865, -- Explore Uldum
}
uldum:Reputation{
    4884, -- Ramkahen
}
local twilightHighlands = zones:Zone(241, {
    61430, -- Crunching for Cultists
    42300, -- Two Minutes to Midnight
})
twilightHighlands:Quests{
    4873, -- Fading into Twilight
    5501, -- Fading into Twilight
    4960, -- Round Three. Fight!
    5481, -- Wildhammer Tour of Duty
    5482, -- Dragonmaw Tour of Duty
    5320, -- King of the Mountain
    5321, -- King of the Mountain
    5451, -- Consumed by Nightmare
    4958, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
}
twilightHighlands:Exploration{
    4866, -- Explore Twilight Highlands
}
twilightHighlands:Reputation{
    948, -- Ambassador of the Alliance
    762, -- Ambassador of the Horde
    4885, -- Wildhammer Clan
    4886, -- Dragonmaw Clan
}
zones:Zone(338, {
    5859, -- Legacy of Leyara
    5866, -- The Molten Front Offensive
    5867, -- Flawless Victory
    5871, -- Master of the Molten Flow
    5872, -- King of the Spider-Hill
    5874, -- Death From Above
    5873, -- Ready for Raiding II
    5879, -- Veteran of the Molten Front
})
local dungeons = expansion:Dungeons{
    4844, -- Cataclysm Dungeon Hero
    41148, -- Protocol Inferno: Terminated
    5506, -- Defender of a Shattered World
    4845, -- Glory of the Cataclysm Hero
}
dungeons:Dungeon(66, {
    5281, -- Crushing Bones and Cracking Skulls
    5282, -- Arrested Development
    5283, -- Too Hot to Handle
    5284, -- Ascendant Descending
    4833, -- Blackrock Caverns
    5060, -- Heroic: Blackrock Caverns
    41139, -- Protocol Inferno: Blackrock Caverns
})
dungeons:Dungeon(65, {
    5285, -- Old Faithful
    5286, -- Prince of Tides
    4839, -- Throne of the Tides
    5061, -- Heroic: Throne of the Tides
    41140, -- Protocol Inferno: Throne of the Tides
    19082, -- Keystone Hero: Throne of the Tides
})
dungeons:Dungeon(67, {
    5287, -- Rotten to the Core
    4846, -- The Stonecore
    5063, -- Heroic: The Stonecore
    41141, -- Protocol Inferno: The Stonecore
})
dungeons:Dungeon(68, {
    5289, -- Extra Credit Bonus Stage
    5288, -- No Static at All
    4847, -- The Vortex Pinnacle
    5064, -- Heroic: The Vortex Pinnacle
    41142, -- Protocol Inferno: The Vortex Pinnacle
    17847, -- Keystone Hero: The Vortex Pinnacle
})
dungeons:Dungeon(71, {
    5297, -- Umbrage for Umbriss
    5298, -- Don't Need to Break Eggs to Make an Omelet
    4840, -- Grim Batol
    5062, -- Heroic: Grim Batol
    41143, -- Protocol Inferno: Grim Batol
    20588, -- Keystone Hero: Grim Batol
})
dungeons:Dungeon(70, {
    5293, -- I Hate That Song
    5294, -- Straw That Broke the Camel's Back
    5296, -- Faster Than the Speed of Light
    5295, -- Sun of a....
    4841, -- Halls of Origination
    5065, -- Heroic: Halls of Origination
    41144, -- Protocol Inferno: Halls of Origination
    9924, -- Field Photographer
})
dungeons:Dungeon(69, {
    5291, -- Acrocalypse Now
    5290, -- Kill It With Fire!
    5292, -- Headed South
    4848, -- Lost City of the Tol'vir
    5066, -- Heroic: Lost City of the Tol'vir
    41145, -- Protocol Inferno: Lost City of the Tol'vir
})
dungeons:Dungeon(63, {
    5366, -- Ready for Raiding
    5367, -- Rat Pack
    5368, -- Prototype Prodigy
    5369, -- It's Frost Damage
    5370, -- I'm on a Diet
    5371, -- Vigorous VanCleef Vindicator
    628, -- Deadmines
    5083, -- Heroic: Deadmines
    41146, -- Protocol Inferno: Deadmines
    11856, -- Pet Battle Challenge: Deadmines
    9924, -- Field Photographer
})
dungeons:Dungeon(64, {
    5503, -- Pardon Denied
    5504, -- To the Ground!
    5505, -- Bullet Time
    631, -- Shadowfang Keep
    5093, -- Heroic: Shadowfang Keep
    41147, -- Protocol Inferno: Shadowfang Keep
    4627, -- X-45 Heartbreaker
})
dungeons:Dungeon(76, {
    5743, -- It's Not Easy Being Green
    5762, -- Ohganot So Fast!
    5765, -- Here, Kitty Kitty...
    5759, -- Spirit Twister
    5744, -- Gurubashi Headhunter
    5768, -- Heroic: Zul'Gurub
})
dungeons:Dungeon(77, {
    5858, -- Bear-ly Made It
    5750, -- Tunnel Vision
    5761, -- Hex Mix
    5760, -- Ring Out!
    5769, -- Heroic: Zul'Aman
})
dungeons:Dungeon(184, {
    5995, -- Moon Guard
    6130, -- Severed Ties
    6117, -- Heroic: End Time
})
dungeons:Dungeon(185, {
    6127, -- Lazy Eye
    6070, -- That's Not Canon!
    6118, -- Heroic: Well of Eternity
})
dungeons:Dungeon(186, {
    6132, -- Eclipse
    6119, -- Heroic: Hour of Twilight
})
local raids = expansion:Raids{
    5506, -- Defender of a Shattered World
    4853, -- Glory of the Cataclysm Raider
    5828, -- Glory of the Firelands Raider
    6169, -- Glory of the Dragon Soul Raider
}
raids:Raid(75, {
    5416, -- Pit Lord Argaloth
    6045, -- Occu'thar
    6108, -- Alizabal
})
local blackwingDescent = raids:Raid(73, {
    4842, -- Blackwing Descent
    11754, -- Glamour of Twilight
    12079, -- Raiding with Leashes V: Cuteaclysm
})
blackwingDescent:Glory{
    5306, -- Parasite Evening
    5307, -- Achieve-a-tron
    5309, -- Full of Sound and Fury
    5308, -- Silence is Golden
    5310, -- Aberrant Behavior
    4849, -- Keeping it in the Family
}
blackwingDescent:Named(addon.L["Heroic"], {
    5094, -- Heroic: Magmaw
    5107, -- Heroic: Omnotron Defense System
    5115, -- Heroic: Chimaeron
    5109, -- Heroic: Atramedes
    5108, -- Heroic: Maloriak
    5116, -- Heroic: Nefarian
})
local theBastionOfTwilight = raids:Raid(72, {
    4850, -- The Bastion of Twilight
    5313, -- I Can't Hear You Over the Sound of How Awesome I Am
    11754, -- Glamour of Twilight
    12079, -- Raiding with Leashes V: Cuteaclysm
})
theBastionOfTwilight:Glory{
    5300, -- The Only Escape
    4852, -- Double Dragon
    5311, -- Elementary
    5312, -- The Abyss Will Gaze Back Into You
}
theBastionOfTwilight:Named(addon.L["Heroic"], {
    5118, -- Heroic: Halfus Wyrmbreaker
    5117, -- Heroic: Valiona and Theralion
    5119, -- Heroic: Ascendant Council
    5120, -- Heroic: Cho'gall
    5121, -- Heroic: Sinestra
})
raids:Raid(74, {
    5304, -- Stay Chill
    5305, -- Four Play
    5122, -- Heroic: Conclave of Wind
    5123, -- Heroic: Al'Akir
    4851, -- Throne of the Four Winds
    12079, -- Raiding with Leashes V: Cuteaclysm
})
local firelands = raids:Raid(78, {
    5855, -- Ragnar-O's
    5802, -- Firelands
    11755, -- Hot Couture
    5839, -- Dragonwrath, Tarecgosa's Rest
    12079, -- Raiding with Leashes V: Cuteaclysm
})
firelands:Glory{
    5821, -- Death from Above
    5813, -- Do a Barrel Roll!
    5810, -- Not an Ambi-Turner
    5829, -- Bucket List
    5830, -- Share the Pain
    5799, -- Only the Penitent...
}
firelands:Named(addon.L["Heroic"], {
    5807, -- Heroic: Beth'tilac
    5809, -- Heroic: Alysrazor
    5808, -- Heroic: Lord Rhyolith
    5806, -- Heroic: Shannox
    5805, -- Heroic: Baleroc
    5804, -- Heroic: Majordomo Fandral Staghelm
    5803, -- Heroic: Ragnaros
})
firelands:Named(CT.Reputation, {
    5827, -- Avengers of Hyjal
}):Merge()
local dragonSoul = raids:Raid(187, {
    6175, -- Holding Hands
    5518, -- Stood in the Fire
    6106, -- Siege of Wyrmrest Temple
    6107, -- Fall of Deathwing
    6177, -- Destroyer's End
    11756, -- Wardrobe of the Old Gods
    6181, -- Fangs of the Father
    12079, -- Raiding with Leashes V: Cuteaclysm
})
dragonSoul:Glory{
    6174, -- Don't Stand So Close to Me
    6128, -- Ping Pong Champion
    6129, -- Taste the Rainbow!
    6084, -- Minutes to Midnight
    6105, -- Deck Defender
    6133, -- Maybe He'll Get Dizzy...
    6180, -- Chromatic Champion
}
dragonSoul:Named(addon.L["Heroic"], {
    6109, -- Heroic: Morchok
    6110, -- Heroic: Warlord Zon'ozz
    6111, -- Heroic: Yor'sahj the Unsleeping
    6112, -- Heroic: Hagara the Stormbinder
    6113, -- Heroic: Ultraxion
    6114, -- Heroic: Warmaster Blackhorn
    6115, -- Heroic: Spine of Deathwing
    6116, -- Heroic: Madness of Deathwing
})
local professions = expansion:Professions{
    4924, -- Professional Cataclysmic Master
    4914, -- Working In the Heat
    18719, -- Cataclysmic Master of All
    62360, -- Cataclysmic Lumberjack
    4918, -- Illustrious Grand Master Medic
    4915, -- More Skills to Pay the Bills
}
professions:Named(CT.Archaeology, {
    4923, -- Illustrious Grand Master Archaeologist
    5301, -- The Boy Who Would be King
}):Merge()
professions:Cooking{
    4916, -- Cataclysmic Cook
    5472, -- The Cataclysmic Gourmet
    5473, -- The Cataclysmic Gourmet
}
professions:Fishing{
    4917, -- Cataclysmic Fisherman
}
professions:Tailoring{
    5480, -- Preparing for Disaster
    18815, -- Speed Dreamin'
}
expansion:PetBattles{
    7525, -- Taming Cataclysm
    6558, -- Local Pet Mauler
    6559, -- Traveling Pet Mauler
    6560, -- World Pet Mauler
    6607, -- Taming Azeroth
    6601, -- Taming the Wild
    7498, -- Taming the Great Outdoors
    7499, -- Taming the World
    14021, -- The Shadows Revealed
    8348, -- The Longest Day
    62476, -- Aquatic Battler of Cataclysm
    62477, -- Beast Battler of Cataclysm
    62478, -- Critter Battler of Cataclysm
    62479, -- Dragonkin Battler of Cataclysm
    62480, -- Elemental Battler of Cataclysm
    62481, -- Flying Battler of Cataclysm
    62482, -- Humanoid Battler of Cataclysm
    62483, -- Magic Battler of Cataclysm
    62487, -- Mechanical Battler of Cataclysm
    62488, -- Undead Battler of Cataclysm
    62461, -- Family Battler of Cataclysm
}
local tolBarad = expansion:Named(CT.TolBarad, {
    5489, -- Master of Tol Barad
    5490, -- Master of Tol Barad
})
tolBarad:Named(CT.Quests, {
    4874, -- Breaking Out of Tol Barad
    5718, -- Just Another Day in Tol Barad
    5719, -- Just Another Day in Tol Barad
}):Merge()
tolBarad:Named(CT.PvP, {
    5412, -- Tol Barad Victory
    5418, -- Tol Barad Veteran
    5417, -- Tol Barad Veteran
    5415, -- Tower Plower
    5488, -- Towers of Power
    5487, -- Tol Barad Saboteur
    5486, -- Tol Barad All-Star
}):Merge()
tolBarad:Named(CT.Reputation, {
    5375, -- Baradin's Wardens
    5376, -- Hellscream's Reach
}):Merge()