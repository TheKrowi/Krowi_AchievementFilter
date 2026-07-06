local _, addon = ...
local shared = addon.Data.ZoneData.Shared

local zoneData = KrowiAF.NewZoneData("WarlordsOfDaenor")

zoneData:Zone({601, 602}, { -- Skyreach (dungeon)
    9033, -- Ready for Raiding IV
    9035, -- I Saw Solis
    9034, -- Magnify... Enhance
    9036, -- Monomania
    8843, -- Skyreach
    8844, -- Heroic: Skyreach
    10081, -- Mythic: Skyreach
    61272, -- Keystone Hero: Skyreach
    61594, -- Keystone Victor: Skyreach
    8871, -- Skyreach Challenger
    8872, -- Skyreach: Bronze
    8873, -- Skyreach: Silver
    8874, -- Skyreach: Gold
    9623, -- Challenge Master: Skyreach
})

zoneData:Zone({616, 617, 618}, { -- Upper Blackrock Spire (dungeon)
    1307, -- Upper Blackrock Spire (Classic)
    2188, -- Leeeeeeeeeeeeeroy!
    9045, -- Magnets, How Do They Work?
    9058, -- Leeeeeeeeeeeeeroy...?
    9056, -- Bridge Over Troubled Fire
    9057, -- Dragonmaw? More Like Dragonfall!
    9042, -- Upper Blackrock Spire
    9055, -- Heroic: Upper Blackrock Spire
    10085, -- Mythic: Upper Blackrock Spire
    8891, -- Upper Blackrock Spire Challenger
    8892, -- Upper Blackrock Spire: Bronze
    8893, -- Upper Blackrock Spire: Silver
    8894, -- Upper Blackrock Spire: Gold
    9627, -- Challenge Master: Upper Blackrock Spire
})

zoneData:Zone({525, 526, 527, 528, 529, 530, 531, 532, 533}, { -- Frostfire Ridge (zone)
    7520, -- The Loremaster
    10018, -- Draenor Pathfinder
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    8671, -- You'll Get Caught Up In The... Frostfire!
    9606, -- Frostfire Fridge
    9529, -- On the Shadow's Trail
    9533, -- Breaker of Chains
    9530, -- Writing in the Snow
    9531, -- Writing in the Snow
    9534, -- Delectable Ogre Delicacies
    9537, -- By Fire Be... Merged?
    9536, -- Slagnarok
    9535, -- That Was Entirely Unnecessary
    9710, -- Poisoning the Well
    9711, -- Planned to Fail
    8937, -- Explore Frostfire Ridge
    9471, -- Council of Exarchs
    9413, -- Strength and Honor
    9410, -- Unite the Clans
    46, -- Universal Explorer
})

zoneData:Zone(534, { -- Tanaan Jungle (zone)
    2556, -- Pest Control
    9477, -- Savage Friends
    9478, -- Savage Friends
    10071, -- The Legion Will NOT Conquer All
    10067, -- In Pursuit of Gul'dan
    10074, -- In Pursuit of Gul'dan
    10068, -- Draenor's Last Stand
    10075, -- Draenor's Last Stand
    10072, -- Rumble in the Jungle
    10265, -- Rumble in the Jungle
    10261, -- Jungle Treasure Hunter
    10262, -- Jungle Treasure Master
    10260, -- Explore Tanaan Jungle
    10069, -- I Came, I Clawed, I Conquered
    10061, -- Hellbane
    10259, -- Jungle Hunter
    10070, -- Jungle Stalker
    10334, -- Predator
    10349, -- Tanaan Diplomat
    10350, -- Tanaan Diplomat
})

zoneData:Zone({535, 536, 537, 538}, { -- Talador (zone)
    7520, -- The Loremaster
    10018, -- Draenor Pathfinder
    10053, -- I Found Pepe!
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    8920, -- Don't Let the Tala-door Hit You on the Way Out
    8919, -- Don't Let the Tala-door Hit You on the Way Out
    9674, -- I Want More Talador
    9633, -- Cut off the Head
    9638, -- Heralds of the Legion
    9635, -- Bobbing for Orcs
    9634, -- Charged Up
    9636, -- United We Stand
    9632, -- The Power Is Yours
    9637, -- Poor Communication
    9486, -- Goodness Gracious
    8940, -- Explore Talador
    9476, -- Sha'tari Defense
    9414, -- Ogre Observer
    9411, -- Highmaul Historian
    46, -- Universal Explorer
})

zoneData:Zone({539, 540, 541}, { -- Shadowmoon Valley (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    10018, -- Draenor Pathfinder
    9491, -- The Garrison Campaign
    9492, -- The Garrison Campaign
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    8845, -- As I Walk Through the Valley of the Shadow of Moon
    9602, -- Shoot For the Moon
    9528, -- On the Shadow's Trail
    9433, -- A-VOID-ance
    9434, -- One of Us! One of Us!
    9432, -- Would You Like a Pamphlet?
    9436, -- It's the Stones!
    9435, -- Take From Them Everything
    9437, -- A Demidos of Reality
    9483, -- I Was Framed!
    9479, -- You Can't Make a Giant Omelette...
    9481, -- You Have Been Rylakinated!
    8938, -- Explore Shadowmoon Valley
    9924, -- Field Photographer
    9470, -- Frostwolf Orcs
    9413, -- Strength and Honor
    9410, -- Unite the Clans
    11240, -- Harbinger
    46, -- Universal Explorer
})

zoneData:Zone(542, { -- Spires of Arak (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    10018, -- Draenor Pathfinder
    10053, -- I Found Pepe!
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    9425, -- So Grossly Incandescent
    8925, -- Between Arak and a Hard Place
    8926, -- Between Arak and a Hard Place
    9605, -- Arak Star
    9612, -- Eggs in One Basket
    9613, -- Fish Gotta Swim, Birds Gotta Eat
    9601, -- King of the Monsters
    9600, -- Monster Mash
    8941, -- Explore Spires of Arak
    9469, -- Arakkoa Outcasts
    9072, -- Mantle of the Talon King
    9415, -- Secrets of Skettis
    9412, -- Arakkoa Archivist
    46, -- Universal Explorer
})

zoneData:Zone({543, 544, 545, 546, 547, 548, 549}, { -- Gorgrond (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    10018, -- Draenor Pathfinder
    10053, -- I Found Pepe!
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    9423, -- Goliaths of Gorgrond
    8923, -- Putting the Gore in Gorgrond
    8924, -- Putting the Gore in Gorgrond
    9607, -- Make It a Bonus
    9655, -- Fight the Power
    9656, -- In Plain Sight
    9659, -- Iron Wings
    9678, -- Ancient No More
    9667, -- Burn It to the Ground
    9654, -- Mean and Green
    9658, -- Pillars of Draenor
    9663, -- Picky Palate
    8939, -- Explore Gorgrond
    9400, -- Gorgrond Monster Hunter
    9401, -- Shredder Maniac
    9402, -- Prove Your Strength
    9475, -- Laughing Skull Orcs
    9414, -- Ogre Observer
    9411, -- Highmaul Historian
    46, -- Universal Explorer
})

zoneData:Zone({550, 551, 552, 553}, { -- Nagrand (zone)
    7520, -- The Loremaster
    2556, -- Pest Control
    10018, -- Draenor Pathfinder
    10053, -- I Found Pepe!
    9491, -- The Garrison Campaign
    9492, -- The Garrison Campaign
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    8927, -- Nagrandeur
    8928, -- Nagrandeur
    9615, -- With a Nagrand Cherry On Top
    9610, -- History of Violence
    9571, -- Broke Back Precipice
    9548, -- Buried Treasures
    9541, -- The Song of Silence
    9617, -- Making the Cut
    8942, -- Explore Nagrand
    9924, -- Field Photographer
    9472, -- Steamwheedle Preservation Society
    9413, -- Strength and Honor
    9414, -- Ogre Observer
    9410, -- Unite the Clans
    9411, -- Highmaul Historian
    46, -- Universal Explorer
})

zoneData:Zone(572, { -- Draenor (continent)
    7520, -- The Loremaster
    10018, -- Draenor Pathfinder
    10053, -- I Found Pepe!
    8921, -- Welcome to Draenor
    8922, -- Welcome to Draenor
    9491, -- The Garrison Campaign
    9492, -- The Garrison Campaign
    9564, -- Securing Draenor
    9562, -- Securing Draenor
    9833, -- Loremaster of Draenor
    9923, -- Loremaster of Draenor
    9726, -- Treasure Hunter
    9727, -- Expert Treasure Hunter
    10348, -- Master Treasure Hunter
    9728, -- Grand Treasure Hunter
    14728, -- To All the Squirrels Through Time and Space
    8935, -- Draenor Explorer
    9477, -- Savage Friends
    9478, -- Savage Friends
    46, -- Universal Explorer
})

zoneData:Zone(573, { -- Bloodmaul Slag Mines (dungeon)
    9005, -- Come With Me If You Want to Live
    8993, -- A Gift of Earth and Fire
    9008, -- Is Draenor on Fire?
    9037, -- Bloodmaul Slag Mines
    9046, -- Heroic: Bloodmaul Slag Mines
    10076, -- Mythic: Bloodmaul Slag Mines
    8875, -- Bloodmaul Slag Mines Challenger
    8876, -- Bloodmaul Slag Mines: Bronze
    8877, -- Bloodmaul Slag Mines: Silver
    8878, -- Bloodmaul Slag Mines: Gold
    9620, -- Challenge Master: Bloodmaul Slag Mines
})

zoneData:Zone({574, 575, 576}, { -- Shadowmoon Burial Grounds (dungeon)
    9018, -- What's Your Sign?
    9025, -- Icky Ichors
    9026, -- Souls of the Lost
    9041, -- Shadowmoon Burial Grounds
    9054, -- Heroic: Shadowmoon Burial Grounds
    10084, -- Mythic: Shadowmoon Burial Grounds
    8883, -- Shadowmoon Burial Grounds Challenger
    8884, -- Shadowmoon Burial Grounds: Bronze
    8885, -- Shadowmoon Burial Grounds: Silver
    8886, -- Shadowmoon Burial Grounds: Gold
    9626, -- Challenge Master: Shadowmoon Burial Grounds
    16660, -- Keystone Hero: Shadowmoon Burial Grounds
})

zoneData:Zone({588, 589}, { -- Ashran (battleground)
    shared.GenericBattleground,
    9102, -- Ashran Victory
    9218, -- Grand Theft, 1st Degree
    9219, -- Grand Theft, 2nd Degree
    9220, -- Grand Theft, 3rd Degree
    9256, -- Rescue Operation
    9257, -- Rescue Operation
    9106, -- Just for Me
    9216, -- High-value Targets
    9104, -- Bounty Hunter
    9103, -- Bounty Hunter
    9222, -- Divide and Conquer
    9228, -- Down Goes Van Rook
    9225, -- Take Them Out
    9224, -- Take Them Out
    9408, -- Operation Counterattack
    9217, -- Operation Counterattack
    9105, -- Tour of Duty
    9714, -- Thy Kingdom Come
    9715, -- Thy Kingdom Come
    9474, -- Vol'jin's Spear
    9473, -- Wrynn's Vanguard
    9214, -- Hero of Warspear
    9215, -- Hero of Stormshield
})

zoneData:Zone(623, { -- Southshore vs. Tarren Mill (battleground)
    shared.GenericBattleground,
})

zoneData:Zone(593, { -- Auchindoun (dungeon)
    9023, -- ...They All Fall Down
    9551, -- Demon's Souls
    9552, -- No Tag-backs!
    9039, -- Auchindoun
    9049, -- Heroic: Auchindoun
    10080, -- Mythic: Auchindoun
    8879, -- Auchindoun Challenger
    8880, -- Auchindoun: Bronze
    8881, -- Auchindoun: Silver
    8882, -- Auchindoun: Gold
    9622, -- Challenge Master: Auchindoun
    9924, -- Field Photographer
})

zoneData:Zone(595, { -- Iron Docks (dungeon)
    9081, -- Expert Timing
    9083, -- Militaristic, Expansionist
    9082, -- Take Cover!
    9038, -- Iron Docks
    9047, -- Heroic: Iron Docks
    10079, -- Mythic: Iron Docks
    8997, -- Iron Docks Challenger
    8998, -- Iron Docks: Bronze
    8999, -- Iron Docks: Silver
    9000, -- Iron Docks: Gold
    9621, -- Challenge Master: Iron Docks
    15694, -- Keystone Hero: Iron Docks
    15688, -- Shadowlands Keystone Explorer: Season Four
    15689, -- Shadowlands Keystone Conqueror: Season Four
    15690, -- Shadowlands Keystone Master: Season Four
})

zoneData:Zone({596, 597, 598, 599, 600}, { -- Blackrock Foundry (raid)
    8989, -- Slagworks
    8990, -- Black Forge
    8991, -- Iron Assembly
    8992, -- Blackhand's Crucible
    9444, -- Ahead of the Curve: Blackhand's Crucible
    9443, -- Cutting Edge: Blackhand's Crucible
    11740, -- Make it W-orc W-orc
    8979, -- He Shoots, He Ores
    8978, -- The Iron Price
    8930, -- Ya, We've Got Time...
    8980, -- Stamp Stamp Revolution
    8929, -- The Steel Has Been Brought
    8983, -- Would You Give Me a Hand?
    8981, -- Fain Would Lie Down
    8982, -- There's Always a Bigger Train
    8984, -- Be Quick or Be Dead
    8952, -- Ashes, Ashes...
    8967, -- Mythic: Oregorger
    8966, -- Mythic: Gruul
    8970, -- Mythic: Blast Furnace
    8968, -- Mythic: Hans'gar and Franzok
    8932, -- Mythic: Flamebender Ka'graz
    8971, -- Mythic: Kromog
    8956, -- Mythic: Beastlord Darmac
    8969, -- Mythic: Operator Thogar
    8972, -- Mythic: Iron Maidens
    8973, -- Mythic: Blackhand's Crucible
})

zoneData:Zone({606, 607, 608, 609}, { -- Grimrail Depot (dungeon)
    9024, -- This Is Why We Can't Have Nice Things
    9007, -- No Ticket
    9043, -- Grimrail Depot
    9052, -- Heroic: Grimrail Depot
    10082, -- Mythic: Grimrail Depot
    8887, -- Grimrail Depot Challenger
    8888, -- Grimrail Depot: Bronze
    8889, -- Grimrail Depot: Silver
    8890, -- Grimrail Depot: Gold
    9625, -- Challenge Master: Grimrail Depot
    15695, -- Keystone Hero: Grimrail Depot
    15688, -- Shadowlands Keystone Explorer: Season Four
    15689, -- Shadowlands Keystone Conqueror: Season Four
    15690, -- Shadowlands Keystone Master: Season Four
})

zoneData:Zone({610, 611, 612, 613, 614, 615}, { -- Highmaul (raid)
    8986, -- The Walled City
    8987, -- Arcane Sanctum
    8988, -- Imperator's Fall
    9441, -- Ahead of the Curve: Imperator's Fall
    9442, -- Cutting Edge: Imperator's Fall
    8948, -- Flame On!
    8947, -- Hurry Up, Maggot!
    8974, -- More Like Wrecked-us
    8975, -- A Fungus Among Us
    8958, -- Brothers in Arms
    8976, -- Pair Annihilation
    8977, -- Lineage of Power
    8949, -- Mythic: Kargath Bladefist
    8960, -- Mythic: The Butcher
    8961, -- Mythic: Tectus
    8962, -- Mythic: Brackenspore
    8963, -- Mythic: Twin Ogron
    8964, -- Mythic: Ko'ragh
    8965, -- Mythic: Imperator's Fall
})

zoneData:Zone({620, 621}, { -- The Everbloom (dungeon)
    9017, -- Water Management
    9493, -- They Burn, Burn, Burn
    9223, -- Weed Whacker
    9044, -- The Everbloom
    9053, -- Heroic: The Everbloom
    10083, -- Mythic: The Everbloom
    9001, -- The Everbloom Challenger
    9002, -- The Everbloom: Bronze
    9003, -- The Everbloom: Silver
    9004, -- The Everbloom: Gold
    9624, -- Challenge Master: The Everbloom
    19083, -- Keystone Hero: The Everbloom
})

zoneData:Zone({661, 662, 663, 664, 665, 666, 667, 668, 669, 670}, { -- Hellfire Citadel (raid)
    10023, -- Hellbreach
    10024, -- Halls of Blood
    10025, -- Bastion of Shadows
    10020, -- Destructor's Rise
    10019, -- The Black Gate
    9680, -- Time is a Flat Circle
    10044, -- Ahead of the Curve: The Black Gate
    10045, -- Cutting Edge: The Black Gate
    11631, -- Extreme Makeover: Fel Edition
    10026, -- Nearly Indestructible
    10057, -- Turning the Tide
    10013, -- Waves Came Crashing Down All Around
    10054, -- Don't Fear the Reaper
    9972, -- A Race Against Slime
    9979, -- Get In My Belly!
    9988, -- Pro Toss
    10086, -- I'm a Soul Man
    9989, -- Non-Lethal Enforcer
    10012, -- This Land Was Green and Good Until...
    10087, -- You Gotta Keep 'em Separated
    10030, -- Bad Manner(oth)
    10073, -- Echoes of Doomfire
    10027, -- Mythic: Hellfire Assault
    10032, -- Mythic: Iron Reaver
    10033, -- Mythic: Kormrok
    10034, -- Mythic: Hellfire High Council
    10035, -- Mythic: Kilrogg Deadeye
    10253, -- Mythic: Gorefiend
    10037, -- Mythic: Shadow-Lord Iskar
    10040, -- Mythic: Socrethar the Eternal
    10041, -- Mythic: Tyrant Velhari
    10038, -- Mythic: Fel Lord Zakuun
    10039, -- Mythic: Xhul'horac
    10042, -- Mythic: Mannoroth
    10043, -- Mythic: Archimonde
})