local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["06_00_02"] = {
	{KrowiAF.SetAchievementPatch, 6, 0, 2},
	Ach(8671):Other():AutoFactionSplit(faction.Horde, 8845), -- You'll Get Caught Up In The... Frostfire! / As I Walk Through the Valley of the Shadow of Moon
	Ach(8812):Obtainable("Never"), -- You're Really Doing It Wrong (Level 90)
	Ach(8820):Pet():Obtainable("From", "Date", {2014, 11, 21}, "Until", "Date", {2015, 1, 5}), -- WoW's 10th Anniversary
	Ach(8843), -- Skyreach
	Ach(8844), -- Heroic: Skyreach
	Ach(8871):Obtainable("Before", "Version", {7, 0, 3}), -- Skyreach Challenger
	Ach(8872):Obtainable("Before", "Version", {7, 0, 3}), -- Skyreach: Bronze
	Ach(8873):Obtainable("Before", "Version", {7, 0, 3}), -- Skyreach: Silver
	Ach(8874):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Skyreach: Gold
	Ach(8875):Obtainable("Before", "Version", {7, 0, 3}), -- Bloodmaul Slag Mines Challenger
	Ach(8876):Obtainable("Before", "Version", {7, 0, 3}), -- Bloodmaul Slag Mines: Bronze
	Ach(8877):Obtainable("Before", "Version", {7, 0, 3}), -- Bloodmaul Slag Mines: Silver
	Ach(8878):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Bloodmaul Slag Mines: Gold
	Ach(8879):Obtainable("Before", "Version", {7, 0, 3}), -- Auchindoun Challenger
	Ach(8880):Obtainable("Before", "Version", {7, 0, 3}), -- Auchindoun: Bronze
	Ach(8881):Obtainable("Before", "Version", {7, 0, 3}), -- Auchindoun: Silver
	Ach(8882):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Auchindoun: Gold
	Ach(8883):Obtainable("Before", "Version", {7, 0, 3}), -- Shadowmoon Burial Grounds Challenger
	Ach(8884):Obtainable("Before", "Version", {7, 0, 3}), -- Shadowmoon Burial Grounds: Bronze
	Ach(8885):Obtainable("Before", "Version", {7, 0, 3}), -- Shadowmoon Burial Grounds: Silver
	Ach(8886):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Shadowmoon Burial Grounds: Gold
	Ach(8887):Obtainable("Before", "Version", {7, 0, 3}), -- Grimrail Depot Challenger
	Ach(8888):Obtainable("Before", "Version", {7, 0, 3}), -- Grimrail Depot: Bronze
	Ach(8889):Obtainable("Before", "Version", {7, 0, 3}), -- Grimrail Depot: Silver
	Ach(8890):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Grimrail Depot: Gold
	Ach(8891):Obtainable("Before", "Version", {7, 0, 3}), -- Upper Blackrock Spire Challenger
	Ach(8892):Obtainable("Before", "Version", {7, 0, 3}), -- Upper Blackrock Spire: Bronze
	Ach(8893):Obtainable("Before", "Version", {7, 0, 3}), -- Upper Blackrock Spire: Silver
	Ach(8894):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Upper Blackrock Spire: Gold
	Ach(8895):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Warlord
	Ach(8897):Title():Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Warlord: Bronze
	Ach(8898):Mount():Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Warlord: Silver
	Ach(8899):Transmog():Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Warlord: Gold
	Ach(8903):Title():Obtainable("Never"), -- Mistwalker
	Ach(8916), -- Collector's Edition: Dread Raven
	Ach(8917), -- Collector's Edition: Dread Hatchling
	Ach(8919):Other():AutoFactionSplit(faction.Horde, 8920), -- Don't Let the Tala-door Hit You on the Way Out
	Ach(8921):AutoFactionSplit(faction.Alliance, 8922), -- Welcome to Draenor
	Ach(8923):Other():AutoFactionSplit(faction.Alliance, 8924), -- Putting the Gore in Gorgrond
	Ach(8925):Other():AutoFactionSplit(faction.Alliance, 8926), -- Between Arak and a Hard Place
	Ach(8927):Other():AutoFactionSplit(faction.Alliance, 8928), -- Nagrandeur
	Ach(8929):Garrison(), -- The Steel Has Been Brought
	Ach(8930), -- Ya, We've Got Time...
	Ach(8932), -- Mythic: Flamebender Ka'graz
	Ach(8933), -- Staying Regular
	Ach(8935), -- Draenor Explorer
	Ach(8937), -- Explore Frostfire Ridge
	Ach(8938), -- Explore Shadowmoon Valley
	Ach(8939), -- Explore Gorgrond
	Ach(8940), -- Explore Talador
	Ach(8941), -- Explore Spires of Arak
	Ach(8942), -- Explore Nagrand
	Ach(8947), -- Hurry Up, Maggot!
	Ach(8948), -- Flame On!
	Ach(8949), -- Mythic: Kargath Bladefist
	Ach(8952), -- Ashes, Ashes...
	Ach(8956), -- Mythic: Beastlord Darmac
	Ach(8958), -- Brothers in Arms
	Ach(8960), -- Mythic: The Butcher
	Ach(8961), -- Mythic: Tectus
	Ach(8962), -- Mythic: Brackenspore
	Ach(8963), -- Mythic: Twin Ogron
	Ach(8964), -- Mythic: Ko'ragh
	Ach(8965):Title(), -- Mythic: Imperator's Fall
	Ach(8966), -- Mythic: Gruul
	Ach(8967), -- Mythic: Oregorger
	Ach(8968), -- Mythic: Hans'gar and Franzok
	Ach(8969), -- Mythic: Operator Thogar
	Ach(8970), -- Mythic: Blast Furnace
	Ach(8971), -- Mythic: Kromog
	Ach(8972), -- Mythic: Iron Maidens
	Ach(8973):Title(), -- Mythic: Blackhand's Crucible
	Ach(8974), -- More Like Wrecked-us
	Ach(8975), -- A Fungus Among Us
	Ach(8976), -- Pair Annihilation
	Ach(8977), -- Lineage of Power
	Ach(8978), -- The Iron Price
	Ach(8979), -- He Shoots, He Ores
	Ach(8980), -- Stamp Stamp Revolution
	Ach(8981), -- Fain Would Lie Down
	Ach(8982), -- There's Always a Bigger Train
	Ach(8983), -- Would You Give Me a Hand?
	Ach(8984), -- Be Quick or Be Dead
	Ach(8985):Mount(), -- Glory of the Draenor Raider
	Ach(8986), -- The Walled City
	Ach(8987), -- Arcane Sanctum
	Ach(8988), -- Imperator's Fall
	Ach(8989), -- Slagworks
	Ach(8990), -- Black Forge
	Ach(8991), -- Iron Assembly
	Ach(8992), -- Blackhand's Crucible
	Ach(8993), -- A Gift of Earth and Fire
	Ach(8997):Obtainable("Before", "Version", {7, 0, 3}), -- Iron Docks Challenger
	Ach(8998):Obtainable("Before", "Version", {7, 0, 3}), -- Iron Docks: Bronze
	Ach(8999):Obtainable("Before", "Version", {7, 0, 3}), -- Iron Docks: Silver
	Ach(9000):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- Iron Docks: Gold
	Ach(9001):Obtainable("Before", "Version", {7, 0, 3}), -- The Everbloom Challenger
	Ach(9002):Obtainable("Before", "Version", {7, 0, 3}), -- The Everbloom: Bronze
	Ach(9003):Obtainable("Before", "Version", {7, 0, 3}), -- The Everbloom: Silver
	Ach(9004):Teleport():Obtainable("Before", "Version", {7, 0, 3}), -- The Everbloom: Gold
	Ach(9005), -- Come With Me If You Want to Live
	Ach(9007), -- No Ticket
	Ach(9008), -- Is Draenor on Fire?
	Ach(9016):Title():Obtainable("Never"), -- Breaker of the Black Harvest
	Ach(9017), -- Water Management
	Ach(9018), -- What's Your Sign?
	Ach(9023), -- ...They All Fall Down
	Ach(9024), -- This Is Why We Can't Have Nice Things
	Ach(9025), -- Icky Ichors
	Ach(9026), -- Souls of the Lost
	Ach(9033), -- Ready for Raiding IV
	Ach(9034), -- Magnify... Enhance
	Ach(9035), -- I Saw Solis
	Ach(9036), -- Monomania
	Ach(9037), -- Bloodmaul Slag Mines
	Ach(9038), -- Iron Docks
	Ach(9039), -- Auchindoun
	Ach(9041), -- Shadowmoon Burial Grounds
	Ach(9042), -- Upper Blackrock Spire
	Ach(9043), -- Grimrail Depot
	Ach(9044), -- The Everbloom
	Ach(9045), -- Magnets, How Do They Work?
	Ach(9046), -- Heroic: Bloodmaul Slag Mines
	Ach(9047), -- Heroic: Iron Docks
	Ach(9049), -- Heroic: Auchindoun
	Ach(9052), -- Heroic: Grimrail Depot
	Ach(9053), -- Heroic: The Everbloom
	Ach(9054), -- Heroic: Shadowmoon Burial Grounds
	Ach(9055), -- Heroic: Upper Blackrock Spire
	Ach(9056), -- Bridge Over Troubled Fire
	Ach(9057), -- Dragonmaw? More Like Dragonfall!
	Ach(9058):Title(), -- Leeeeeeeeeeeeeroy...?
	Ach(9060):Obtainable("Before", "Version", {9, 0, 1}), -- Level 100 (Legacy)
	Ach(9069):Pet(), -- An Awfully Big Adventure
	Ach(9070), -- Overstuffed
	Ach(9071), -- Inspector Gadgetzan
	Ach(9072):Title(), -- Mantle of the Talon King
	Ach(9076), -- Choppin' Some Logs
	Ach(9077):Title(), -- Choppin' Some More Logs
	Ach(9078):Title():AutoFactionSplit(faction.Alliance, 9080), -- Choppin' Even More Logs
	Ach(9081), -- Expert Timing
	Ach(9082), -- Take Cover!
	Ach(9083), -- Militaristic, Expansionist
	Ach(9087), -- Draenor Master of All
	Ach(9094):Title(), -- Garrison Architect
	Ach(9095), -- Builder
	Ach(9096), -- Master Builder
	Ach(9097), -- Keepin' Busy
	Ach(9098), -- Movin' On Up
	Ach(9099), -- Time for an Upgrade
	Ach(9100):AutoFactionSplit(faction.Alliance, 9545), -- More Plots
	Ach(9101):AutoFactionSplit(faction.Alliance, 9546), -- Even More Plots
	Ach(9102):IsPvP(), -- Ashran Victory
	Ach(9103):IsPvP():AutoFactionSplit(faction.Horde, 9104), -- Bounty Hunter
	Ach(9105):IsPvP(), -- Tour of Duty
	Ach(9106):IsPvP(), -- Just for Me
	Ach(9107), -- Follow the Leader
	Ach(9108), -- Where You Go, They Will Follow
	Ach(9109), -- Fearless Leader
	Ach(9110), -- Following Up
	Ach(9111), -- Raising the Bar
	Ach(9125), -- Draftsman
	Ach(9126), -- Master Draftsman
	Ach(9128), -- Grand Master Draftsman
	Ach(9129):Garrison(), -- Filling the Ranks
	Ach(9130), -- A Rare Friend
	Ach(9131), -- An Epic Buddy
	Ach(9132):AutoFactionSplit(faction.Horde, 9210), -- Garrison Buddies
	Ach(9133), -- On a Mission
	Ach(9134), -- On a Few Missions
	Ach(9138), -- On a Lot of Missions
	Ach(9139), -- On a Massive Number of Missions
	Ach(9140), -- On a Metric Ton of Missions
	Ach(9141), -- A Rare Mission
	Ach(9142), -- Keeping It Rare
	Ach(9143), -- The Rarer the Better
	Ach(9145), -- Treasure Mission Specialist
	Ach(9146), -- Patrol Mission Specialist
	Ach(9147), -- Mission Specialist
	Ach(9150), -- Exploration Mission Specialist
	Ach(9152), -- It's an Invasion!
	Ach(9162), -- Bronze Defender
	Ach(9164), -- Silver Defender
	Ach(9165), -- Golden Defender
	Ach(9167), -- Invasion Specialist
	Ach(9168):AutoFactionSplit(faction.Alliance, 9172):Obtainable("Before", "Version", {7, 0, 3}), -- You Are Not Your $#*@! Legplates (Season 2)
	Ach(9169):Other():AutoFactionSplit(faction.Alliance, 9173):Obtainable("Before", "Version", {7, 0, 3}), -- The Second Rule of Brawler's Guild (Season 2)
	Ach(9170):Title():AutoFactionSplit(faction.Alliance, 9174):Obtainable("Before", "Version", {7, 0, 3}), -- Brawlin' and Shot Callin' (Season 2)
	Ach(9171):AutoFactionSplit(faction.Alliance, 9175):Obtainable("Before", "Version", {7, 0, 3}), -- Now You're Just Showing Off (Season 2)
	Ach(9176):Other():AutoFactionSplit(faction.Alliance, 9177):Obtainable("Before", "Version", {7, 0, 3}), -- Deck Your Collection (Season 2)
	Ach(9181), -- Save Those Buildings!
	Ach(9203), -- Shadow Council Invasion
	Ach(9204), -- Ogre Invasion
	Ach(9205), -- Iron Horde Invasion
	Ach(9206), -- Shadowmoon Clan Invasion
	Ach(9207), -- Goren Invasion
	Ach(9208), -- Botani Invasion
	Ach(9209), -- Master Defender
	Ach(9211), -- My Item Level Is Higher than Yours
	Ach(9212), -- My Item Level Is Way Higher than Yours
	Ach(9213), -- Item Level Army
	Ach(9214):IsPvP():AutoFactionSplit(faction.Alliance, 9215), -- Hero of Stormshield / Hero of Warspear
	Ach(9216):IsPvP(), -- High-value Targets
	Ach(9217):IsPvP():AutoFactionSplit(faction.Horde, 9408), -- Operation Counterattack
	Ach(9218):IsPvP(), -- Grand Theft, 1st Degree
	Ach(9219):IsPvP(), -- Grand Theft, 2nd Degree
	Ach(9220):IsPvP(), -- Grand Theft, 3rd Degree
	Ach(9222):IsPvP(), -- Divide and Conquer
	Ach(9223), -- Weed Whacker
	Ach(9224):IsPvP():AutoFactionSplit(faction.Horde, 9225), -- Take Them Out
	Ach(9228):FactionSplit(faction.Alliance, nil):IsPvP(), -- Down Goes Van Rook
	Ach(9229):PvP(16), -- Primal Gladiator's Felblood Gronnling
	Ach(9230):PvP(16):AutoFactionSplit(faction.Alliance, 9231), -- Hero of the Alliance: Primal / Hero of the Horde: Primal
	Ach(9232):Title():PvP(16), -- Primal Gladiator: Warlords Season 1
	Ach(9233):PvP(16):AutoFactionSplit(faction.Horde, 9234), -- Primal Conquest
	Ach(9236):Mount():PvP(16):AutoFactionSplit(faction.Horde, 9238), -- Primal Combatant
	Ach(9239):Title():PvP(16), -- Gladiator: Warlords Season 1
	Ach(9240):Title():PvP(16), -- Duelist: Warlords Season 1
	Ach(9241):Title():PvP(16), -- Rival: Warlords Season 1
	Ach(9242):Title():PvP(16), -- Challenger: Warlords Season 1
	Ach(9243), -- Item Level Force
	Ach(9244), -- Invasions Are Better with Friends
	Ach(9246):Garrison(), -- Master Draenor Crafter
	Ach(9248):Garrison():IsPvP():AutoFactionSplit(faction.Horde, 9630), -- Defender of Draenor
	Ach(9250):Obtainable("Event", 374), -- Flying High
	Ach(9251):Obtainable("Event", 374), -- Ringmaster
	Ach(9252):Obtainable("Event", 374), -- Brood of Alysrazor
	Ach(9255):Garrison():AutoFactionSplit(faction.Horde, 9631), -- Mythic Draenor Raider
	Ach(9256):IsPvP():AutoFactionSplit(faction.Alliance, 9257), -- Rescue Operation
	Ach(9264):Garrison(), -- Draenor Pet Brawler
	Ach(9265):Garrison(), -- Master of Apexis
	Ach(9389):Obtainable("Event", 423), -- It Might Just Save Your Life
	Ach(9391), -- Draenor Dungeon Hero
	Ach(9392):Obtainable("Event", 423), -- Love Magnet
	Ach(9393):Obtainable("Event", 423), -- Beacon of Love
	Ach(9394):Toy():Obtainable("Event", 423), -- They Really Love Me!
	Ach(9396):Mount(), -- Glory of the Draenor Hero
	Ach(9400), -- Gorgrond Monster Hunter
	Ach(9401), -- Shredder Maniac
	Ach(9402), -- Prove Your Strength
	Ach(9405), -- Working Some Orders
	Ach(9406):Garrison(), -- Working More Orders
	Ach(9407), -- Working Many Orders
	Ach(9409), -- Draenor Archaeologist
	Ach(9410), -- Unite the Clans
	Ach(9411), -- Highmaul Historian
	Ach(9412), -- Arakkoa Archivist
	Ach(9413), -- Strength and Honor
	Ach(9414), -- Ogre Observer
	Ach(9415), -- Secrets of Skettis
	Ach(9419), -- Draenor Curator
	Ach(9422), -- The Search For Fact, Not Truth
	Ach(9423), -- Goliaths of Gorgrond
	Ach(9425), -- So Grossly Incandescent
	Ach(9426):Obtainable("Event", 409), -- To The Afterlife
	Ach(9427):Obtainable("Event", 409), -- Vientos!
	Ach(9428):Obtainable("Event", 409), -- Calavera
	Ach(9429):Garrison(), -- Upgrading the Mill
	Ach(9432), -- Would You Like a Pamphlet?
	Ach(9433), -- A-VOID-ance
	Ach(9434), -- One of Us! One of Us!
	Ach(9435), -- Take From Them Everything
	Ach(9436), -- It's the Stones!
	Ach(9437), -- A Demidos of Reality
	Ach(9441):Obtainable("Before", "Version", {6, 0, 2}), -- Ahead of the Curve: Imperator's Fall
	Ach(9442):Obtainable("Before", "Version", {6, 0, 2}), -- Cutting Edge: Imperator's Fall
	Ach(9443):Obtainable("Before", "Version", {6, 0, 2}), -- Cutting Edge: Blackhand's Crucible
	Ach(9444):Obtainable("Before", "Version", {6, 0, 2}), -- Ahead of the Curve: Blackhand's Crucible
	Ach(9450), -- The Trap Game
	Ach(9451), -- Trapper's Delight
	Ach(9452), -- Trap Superstar
	Ach(9453):Garrison(), -- Draenic Stone Collector
	Ach(9454):Garrison(), -- Draenic Seed Collector
	Ach(9455), -- Fire Ammonite Angler
	Ach(9456), -- Abyssal Gulper Eel Angler
	Ach(9457), -- Blackwater Whiptail Angler
	Ach(9458), -- Blind Lake Sturgeon Angler
	Ach(9459), -- Fat Sleeper Angler
	Ach(9460), -- Jawless Skulker Angler
	Ach(9461), -- Sea Scorpion Angler
	Ach(9462):Garrison(), -- Draenor Angler
	Ach(9463):Garrison(), -- Draenic Pet Battler
	Ach(9464):Title(), -- Professional Draenor Master
	Ach(9468):Garrison(), -- Salvaging Pays Off
	Ach(9469), -- Arakkoa Outcasts
	Ach(9470):AutoFactionSplit(faction.Alliance, 9471), -- Council of Exarchs / Frostwolf Orcs
	Ach(9472), -- Steamwheedle Preservation Society
	Ach(9473):IsPvP():AutoFactionSplit(faction.Horde, 9474), -- Vol'jin's Spear / Wrynn's Vanguard
	Ach(9475):AutoFactionSplit(faction.Horde, 9476), -- Laughing Skull Orcs / Sha'tari Defense
	Ach(9477):Garrison():AutoFactionSplit(faction.Horde, 9478), -- Savage Friends
	Ach(9479), -- You Can't Make a Giant Omelette...
	Ach(9481), -- You Have Been Rylakinated!
	Ach(9483), -- I Was Framed!
	Ach(9486), -- Goodness Gracious
	Ach(9487):Garrison(), -- Got My Mind On My Draenor Money
	Ach(9491):AutoFactionSplit(faction.Alliance, 9492), -- The Garrison Campaign
	Ach(9493), -- They Burn, Burn, Burn
	Ach(9494), -- Commander
	Ach(9495):Garrison():IsPvP(), -- The Bone Collector
	Ach(9496):Mount():Obtainable("From", "Date", {2014, 8, 1}, "Until", "Date", {2014, 9, 30}), -- Warlord's Deathwheel
	Ach(9497):Garrison(), -- Finding Your Waystones
	Ach(9498), -- Wingman
	Ach(9499), -- Wingmen
	Ach(9500), -- Draenor Cook
	Ach(9501), -- The Draenor Gourmet
	Ach(9502), -- Draenor Cuisine
	Ach(9503), -- Draenor Fisherman
	Ach(9505):Obtainable("Before", "Version", {8, 0, 1}), -- Draenor Medic
	Ach(9506):Obtainable("Before", "Version", {8, 0, 1}), -- Savage Skills to Pay the Bills
	Ach(9507), -- Working in Draenor
	Ach(9508):Title():IsPvP():AutoFactionSplit(faction.Horde, 9738), -- Warlord of Draenor
	Ach(9509):Title():IsPvP():AutoFactionSplit(faction.Horde, 9516), -- Nemesis: Draenei Destroyer / Nemesis: Slayer of Sin'dorei
	Ach(9510):Title():IsPvP():AutoFactionSplit(faction.Horde, 9522), -- Nemesis: Dwarfstalker / Nemesis: Troll Hunter
	Ach(9511):Title():IsPvP():AutoFactionSplit(faction.Horde, 9521), -- Nemesis: Gnomebane / Nemesis: The Butcher
	Ach(9512):Title():IsPvP():AutoFactionSplit(faction.Horde, 9519), -- Nemesis: Manslayer / Nemesis: Orcslayer
	Ach(9513):Title():IsPvP():AutoFactionSplit(faction.Horde, 9517), -- Nemesis: Scourge of the Kaldorei / Nemesis: Death Stalker
	Ach(9514):Title():IsPvP():AutoFactionSplit(faction.Horde, 9520), -- Nemesis: Terror of the Tushui / Nemesis: Huojin's Fall
	Ach(9515):Title():IsPvP():AutoFactionSplit(faction.Horde, 9518), -- Nemesis: Worgen Hunter / Nemesis: Killer of Kezan
	Ach(9523):Garrison(), -- Patrolling Draenor
	Ach(9524), -- Treasure Master
	Ach(9526):Garrison(), -- Master of Mounts
	Ach(9527):Garrison(), -- Terrific Technology
	Ach(9528):AutoFactionSplit(faction.Alliance, 9529), -- On the Shadow's Trail
	Ach(9530):AutoFactionSplit(faction.Alliance, 9531), -- Writing in the Snow
	Ach(9533), -- Breaker of Chains
	Ach(9534), -- Delectable Ogre Delicacies
	Ach(9535), -- That Was Entirely Unnecessary
	Ach(9536), -- Slagnarok
	Ach(9537), -- By Fire Be... Merged?
	Ach(9538), -- Intro to Husbandry
	Ach(9539):AutoFactionSplit(faction.Alliance, 9705), -- Advanced Husbandry
	Ach(9540):Title():AutoFactionSplit(faction.Alliance, 9706), -- The Stable Master
	Ach(9541), -- The Song of Silence
	Ach(9543), -- Invasion? What Invasion?
	Ach(9547), -- Everything Is Awesome!
	Ach(9548), -- Buried Treasures
	Ach(9550):Mount():Obtainable("From", "Date", {2014, 11, 21}, "Until", "Date", {2015, 1, 5}), -- Boldly, You Sought the Power of Ragnaros
	Ach(9551), -- Demon's Souls
	Ach(9552), -- No Tag-backs!
	Ach(9562):AutoFactionSplit(faction.Horde, 9564), -- Securing Draenor
	Ach(9565):Garrison(), -- Master Trapper
	Ach(9566):Title():IsPvP():AutoFactionSplit(faction.Horde, 9729):Obtainable("From", "Date", {2014, 11, 21}, "Until", "Date", {2015, 1, 5}), -- Victory in Hillsbrad
	Ach(9571), -- Broke Back Precipice
	Ach(9572), -- Proving Yourself: Bronze Damage
	Ach(9573), -- Proving Yourself: Silver Damage
	Ach(9574), -- Proving Yourself: Gold Damage
	Ach(9575), -- Proving Yourself: Endless Damage (Wave 10)
	Ach(9576), -- Proving Yourself: Endless Damage (Wave 20)
	Ach(9577):Title(), -- Proving Yourself: Endless Damage (Wave 30)
	Ach(9578), -- Proving Yourself: Bronze Tank
	Ach(9579), -- Proving Yourself: Silver Tank
	Ach(9580), -- Proving Yourself: Gold Tank
	Ach(9581), -- Proving Yourself: Endless Tank (Wave 10)
	Ach(9582), -- Proving Yourself: Endless Tank (Wave 20)
	Ach(9583):Title(), -- Proving Yourself: Endless Tank (Wave 30)
	Ach(9584), -- Proving Yourself: Bronze Healer
	Ach(9585), -- Proving Yourself: Silver Healer
	Ach(9586), -- Proving Yourself: Gold Healer
	Ach(9587), -- Proving Yourself: Endless Healer (Wave 10)
	Ach(9588), -- Proving Yourself: Endless Healer (Wave 20)
	Ach(9589):Title(), -- Proving Yourself: Endless Healer (Wave 30)
	Ach(9590), -- You're Doing it Wrong
	Ach(9597), -- You're Really Doing It Wrong
	Ach(9598):Mount():AutoFactionSplit(faction.Alliance, 9599), -- Mountacular
	Ach(9600), -- Monster Mash
	Ach(9601), -- King of the Monsters
	Ach(9602):AutoFactionSplit(faction.Alliance, 9606), -- Shoot For the Moon / Frostfire Fridge
	Ach(9605), -- Arak Star
	Ach(9607), -- Make It a Bonus
	Ach(9610), -- History of Violence
	Ach(9612), -- Eggs in One Basket
	Ach(9613), -- Fish Gotta Swim, Birds Gotta Eat
	Ach(9615), -- With a Nagrand Cherry On Top
	Ach(9617), -- Making the Cut
	Ach(9618):Title():Obtainable("From", "Date", {2014, 10, 14}, "Until", "Date", {2014, 10, 28}), -- The Iron Invasion
	Ach(9619):Title(), -- Savage Hero
	Ach(9620):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Bloodmaul Slag Mines
	Ach(9621):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Iron Docks
	Ach(9622):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Auchindoun
	Ach(9623):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Skyreach
	Ach(9624):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: The Everbloom
	Ach(9625):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Grimrail Depot
	Ach(9626):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Shadowmoon Burial Grounds
	Ach(9627):Obtainable("Before", "Version", {7, 0, 3}), -- Challenge Master: Upper Blackrock Spire
	Ach(9632), -- The Power Is Yours
	Ach(9633), -- Cut off the Head
	Ach(9634), -- Charged Up
	Ach(9635), -- Bobbing for Orcs
	Ach(9636), -- United We Stand
	Ach(9637), -- Poor Communication
	Ach(9638), -- Heralds of the Legion
	Ach(9639):IsPvP(), -- Fight, Kill, Salute!
	Ach(9640):Obtainable("Before", "Version", {7, 0, 3}), -- Chapter I: Call of the Archmage
	Ach(9641):Obtainable("Before", "Version", {7, 0, 3}), -- Chapter II: Gul'dan Strikes Back
	Ach(9642):Obtainable("Before", "Version", {7, 0, 3}), -- Chapter III: The Foundry Falls
	Ach(9643):Pet(), -- So. Many. Pets.
	Ach(9654), -- Mean and Green
	Ach(9655), -- Fight the Power
	Ach(9656), -- In Plain Sight
	Ach(9658), -- Pillars of Draenor
	Ach(9659), -- Iron Wings
	Ach(9663), -- Picky Palate
	Ach(9667), -- Burn It to the Ground
	Ach(9670), -- Toying Around
	Ach(9671), -- Having a Ball
	Ach(9672), -- Tons of Toys
	Ach(9673):Toy(), -- The Toymaster
	Ach(9674), -- I Want More Talador
	Ach(9678), -- Ancient No More
	Ach(9680):Garrison():Obtainable("Before", "Version", {7, 0, 3}), -- Time is a Flat Circle
	Ach(9685):Pet(), -- Draenor Safari
	Ach(9703):Garrison(), -- Stay Awhile and Listen
	Ach(9707):Obtainable("Before", "Version", {8, 0, 1}), -- Savagely Superior
	Ach(9708):Obtainable("Before", "Version", {8, 0, 1}), -- Savagely Epic
	Ach(9710), -- Poisoning the Well
	Ach(9711), -- Planned to Fail
	Ach(9712), -- Shiny Pet Charmer
	Ach(9713):Mount(), -- Awake the Drakes
	Ach(9714):IsPvP():AutoFactionSplit(faction.Alliance, 9715), -- Thy Kingdom Come
	Ach(9724), -- Taming Draenor
	Ach(9725):Title():IsPvP(), -- The Last of Us
	Ach(9726), -- Treasure Hunter
	Ach(9727), -- Expert Treasure Hunter
	Ach(9728), -- Grand Treasure Hunter
}

KrowiAF.AchievementData2["06_01_00"] = {
	{KrowiAF.SetAchievementPatch, 6, 1, 0},
	Ach(9755):Obtainable("Event", 374), -- Darkmoon Race Enthusiast
	Ach(9756):Obtainable("Event", 374), -- Darkmoon Racer Novice
	Ach(9759):Obtainable("Event", 374), -- Darkmoon Racer Jockey
	Ach(9760):Obtainable("Event", 374), -- Darkmoon Racer Leadfoot
	Ach(9761):Toy():Obtainable("Event", 374), -- Darkmoon Racer Roadhog
	Ach(9763), -- Grommloc
	Ach(9764):Toy():Obtainable("Event", 374), -- Rocketeer: Gold
	Ach(9766):Obtainable("Event", 374), -- Rocketeer: Silver
	Ach(9769):Obtainable("Event", 374), -- Rocketeer: Bronze
	Ach(9770):Obtainable("Event", 374), -- Blast Off!
	Ach(9780):Obtainable("Event", 374), -- Go-Getter
	Ach(9781):Obtainable("Event", 374), -- Powermonger: Bronze
	Ach(9783):Obtainable("Event", 374), -- Powermonger: Silver
	Ach(9785):Toy():Obtainable("Event", 374), -- Powermonger: Gold
	Ach(9786):Obtainable("Event", 374), -- Wayfarer
	Ach(9787):Obtainable("Event", 374), -- Wanderluster: Bronze
	Ach(9790):Obtainable("Event", 374), -- Wanderluster: Silver
	Ach(9792):Toy():Obtainable("Event", 374), -- Wanderluster: Gold
	Ach(9793):Obtainable("Event", 374), -- Big Race Enthusiast
	Ach(9794):Obtainable("Event", 374), -- Big Race Novice
	Ach(9795):Obtainable("Event", 374), -- Big Race Jockey
	Ach(9797):Obtainable("Event", 374), -- Big Race Leadfoot
	Ach(9799):Toy():Obtainable("Event", 374), -- Big Race Roadhog
	Ach(9800):Obtainable("Event", 374), -- Rocket Man
	Ach(9801):Obtainable("Event", 374), -- Big Rocketeer: Bronze
	Ach(9803):Obtainable("Event", 374), -- Big Rocketeer: Silver
	Ach(9805):Toy():Obtainable("Event", 374), -- Big Rocketeer: Gold
	Ach(9806):Obtainable("Event", 374), -- Vagabond
	Ach(9807):Obtainable("Event", 374), -- Big Wanderluster: Bronze
	Ach(9809):Obtainable("Event", 374), -- Big Wanderluster: Silver
	Ach(9811):Toy():Obtainable("Event", 374), -- Big Wanderluster: Gold
	Ach(9812):Obtainable("Event", 374), -- Goal-Oriented
	Ach(9813):Obtainable("Event", 374), -- Big Powermonger: Bronze
	Ach(9815):Obtainable("Event", 374), -- Big Powermonger: Silver
	Ach(9817):Toy():Obtainable("Event", 374), -- Big Powermonger: Gold
	Ach(9819):Obtainable("Event", 374), -- Darkmoon Like the Wind
	Ach(9824):Pet(), -- Raiding with Leashes III: Drinkin' From the Sunwell
	Ach(9825):AutoFactionSplit(faction.Alliance, 9836), -- Master Relic Hunter
	Ach(9826), -- Platinum Defender
	Ach(9827), -- Impervious Defender
	Ach(9828):AutoFactionSplit(faction.Alliance, 9897), -- Ten Hit Tunes
	Ach(9833):AutoFactionSplit(faction.Alliance, 9923), -- Loremaster of Draenor
	Ach(9838):Toy(), -- What A Strange, Interdimensional Trip It's Been
	Ach(9858), -- Master and Commander
	Ach(9885):Toy():Obtainable("Event", 374), -- Ace Tonk Commander
	Ach(9894):Toy():Obtainable("Event", 374), -- Triumphant Turtle Tossing
	Ach(9900), -- Exploration Mission Master
	Ach(9901):Garrison():AutoFactionSplit(faction.Horde, 9928), -- Don't Call Me Junior
	Ach(9906), -- Alt-ernative Lifestyle
	Ach(9908), -- Ready for Powerleveling
	Ach(9909):Mount(), -- Heirloom Hoarder
	Ach(9911), -- Where's the Mailbox?
	Ach(9912):Toy():AutoFactionSplit(faction.Alliance, 9914), -- Azeroth's Top Twenty Tunes
	Ach(9915), -- Crashin' Thrashin' Shredder
	Ach(9924):Title(), -- Field Photographer
	Ach(9925):Obtainable("Before", "Date", {2019, 6, 11}), -- Friends In Places Yet Even Higher Than That
	Ach(9926), -- Hero of the Storm
}

KrowiAF.AchievementData2["06_02_00"] = {
	{KrowiAF.SetAchievementPatch, 6, 2, 0},
	Ach(9972):Garrison(), -- A Race Against Slime
	Ach(9979), -- Get In My Belly!
	Ach(9983):Pet():Obtainable("Event", 374), -- That's Whack!
	Ach(9988), -- Pro Toss
	Ach(9989), -- Non-Lethal Enforcer
	Ach(9995):Title():PvP(16):AutoFactionSplit(faction.Alliance, 9998), -- Soldier of the Alliance: Warlords Season 1 / Soldier of the Horde: Warlords Season 1
	Ach(9996):Title():PvP(16):AutoFactionSplit(faction.Alliance, 10001), -- Defender of the Alliance: Warlords Season 1 / Defender of the Horde: Warlords Season 1
	Ach(9997):Title():PvP(16):AutoFactionSplit(faction.Alliance, 10000), -- Guardian of the Alliance: Warlords Season 1 / Guardian of the Horde: Warlords Season 1
	Ach(10010), -- Gate of the Setting Sun
	Ach(10011), -- Siege of Niuzao Temple
	Ach(10012), -- This Land Was Green and Good Until...
	Ach(10013), -- Waves Came Crashing Down All Around
	Ach(10015):AutoFactionSplit(faction.Alliance, 10016), -- Full Discography
	Ach(10017), -- Naval Bonus Specialist
	Ach(10018):Mount(), -- Draenor Pathfinder
	Ach(10019), -- The Black Gate
	Ach(10020), -- Destructor's Rise
	Ach(10021):Garrison():AutoFactionSplit(faction.Alliance, 10148):Obtainable("Before", "Version", {7, 0, 3}), -- Chapter IV: Darkness Incarnate
	Ach(10023), -- Hellbreach
	Ach(10024), -- Halls of Blood
	Ach(10025), -- Bastion of Shadows
	Ach(10026), -- Nearly Indestructible
	Ach(10027), -- Mythic: Hellfire Assault
	Ach(10030), -- Bad Manner(oth)
	Ach(10032), -- Mythic: Iron Reaver
	Ach(10033), -- Mythic: Kormrok
	Ach(10034), -- Mythic: Hellfire High Council
	Ach(10035), -- Mythic: Kilrogg Deadeye
	Ach(10036), -- Naval Bonus Expert
	Ach(10037), -- Mythic: Shadow-Lord Iskar
	Ach(10038), -- Mythic: Fel Lord Zakuun
	Ach(10039), -- Mythic: Xhul'horac
	Ach(10040), -- Mythic: Socrethar the Eternal
	Ach(10041), -- Mythic: Tyrant Velhari
	Ach(10042), -- Mythic: Mannoroth
	Ach(10043):Title(), -- Mythic: Archimonde
	Ach(10044):Obtainable("Before", "Version", {7, 0, 3}), -- Ahead of the Curve: The Black Gate
	Ach(10045):Obtainable("Before", "Version", {7, 0, 3}), -- Cutting Edge: The Black Gate
	Ach(10052), -- Tiny Terrors in Tanaan
	Ach(10053), -- I Found Pepe!
	Ach(10054), -- Don't Fear the Reaper
	Ach(10057), -- Turning the Tide
	Ach(10058):Obtainable("From", "Date", {2015, 11, 16}, "Until", "Date", {2015, 11, 30}), -- WoW's 11th Anniversary
	Ach(10061), -- Hellbane
	Ach(10067):AutoFactionSplit(faction.Alliance, 10074), -- In Pursuit of Gul'dan
	Ach(10068):AutoFactionSplit(faction.Alliance, 10075), -- Draenor's Last Stand
	Ach(10069), -- I Came, I Clawed, I Conquered
	Ach(10070), -- Jungle Stalker
	Ach(10071), -- The Legion Will NOT Conquer All
	Ach(10072):Title():AutoFactionSplit(faction.Alliance, 10265), -- Rumble in the Jungle
	Ach(10073), -- Echoes of Doomfire
	Ach(10076), -- Mythic: Bloodmaul Slag Mines
	Ach(10079), -- Mythic: Iron Docks
	Ach(10080), -- Mythic: Auchindoun
	Ach(10081), -- Mythic: Skyreach
	Ach(10082), -- Mythic: Grimrail Depot
	Ach(10083), -- Mythic: The Everbloom
	Ach(10084), -- Mythic: Shadowmoon Burial Grounds
	Ach(10085), -- Mythic: Upper Blackrock Spire
	Ach(10086), -- I'm a Soul Man
	Ach(10087), -- You Gotta Keep 'em Separated
	Ach(10088):PvP(17):AutoFactionSplit(faction.Horde, 10089), -- Wild Conquest
	Ach(10090):PvP(18):AutoFactionSplit(faction.Horde, 10091), -- Warmongering Conquest
	Ach(10092):Mount():PvP(17):AutoFactionSplit(faction.Horde, 10093), -- Wild Combatant
	Ach(10094):Mount():PvP(18):AutoFactionSplit(faction.Horde, 10095), -- Warmongering Combatant
	Ach(10096):Title():PvP(17), -- Wild Gladiator: Warlords Season 2
	Ach(10097):Title():PvP(18), -- Warmongering Gladiator: Warlords Season 3
	Ach(10098):Title():PvP(17), -- Gladiator: Warlords Season 2
	Ach(10099):Title():PvP(17), -- Duelist: Warlords Season 2
	Ach(10100):Title():PvP(17), -- Rival: Warlords Season 2
	Ach(10101):Title():PvP(17), -- Challenger: Warlords Season 2
	Ach(10102):PvP(17):AutoFactionSplit(faction.Alliance, 10103), -- Hero of the Alliance: Wild / Hero of the Horde: Wild
	Ach(10104):Title():PvP(17):AutoFactionSplit(faction.Alliance, 10105), -- Soldier of the Alliance: Warlords Season 2 / Soldier of the Horde: Warlords Season 2
	Ach(10106):Title():PvP(17):AutoFactionSplit(faction.Alliance, 10107), -- Defender of the Alliance: Warlords Season 2 / Defender of the Horde: Warlords Season 2
	Ach(10108):Title():PvP(17):AutoFactionSplit(faction.Alliance, 10109), -- Guardian of the Alliance: Warlords Season 2 / Guardian of the Horde: Warlords Season 2
	Ach(10110):Title():PvP(18), -- Gladiator: Warlords Season 3
	Ach(10111):Title():PvP(18), -- Duelist: Warlords Season 3
	Ach(10112):Title():PvP(18), -- Rival: Warlords Season 3
	Ach(10113):Title():PvP(18), -- Challenger: Warlords Season 3
	Ach(10114):PvP(18):AutoFactionSplit(faction.Alliance, 10115), -- Hero of the Alliance: Warmongering / Hero of the Horde: Warmongering
	Ach(10116):Title():PvP(18):AutoFactionSplit(faction.Alliance, 10117), -- Guardian of the Alliance: Warlords Season 3 / Guardian of the Horde: Warlords Season 3
	Ach(10118):Title():PvP(18):AutoFactionSplit(faction.Alliance, 10119), -- Defender of the Alliance: Warlords Season 3 / Defender of the Horde: Warlords Season 3
	Ach(10120):Title():PvP(18):AutoFactionSplit(faction.Alliance, 10121), -- Soldier of the Alliance: Warlords Season 3 / Soldier of the Horde: Warlords Season 3
	Ach(10137):PvP(17), -- Wild Gladiator's Felblood Gronnling
	Ach(10146):PvP(18), -- Warmongering Gladiator's Felblood Gronnling
	Ach(10149):Mount(), -- Glory of the Hellfire Raider
	Ach(10154), -- Naval Combat Expert
	Ach(10155), -- Naval Siege Expert
	Ach(10156), -- Naval Combat Specialist
	Ach(10159), -- Naval Treasure Specialist
	Ach(10160), -- Naval Treasure Expert
	Ach(10161), -- Naval Siege Specialist
	Ach(10162), -- Naval Training Specialist
	Ach(10163), -- Naval Training Expert
	Ach(10164):Title(), -- Master of the Seas
	Ach(10165), -- Ironsides
	Ach(10166), -- Naval Mechanics
	Ach(10167):AutoFactionSplit(faction.Alliance, 10307), -- Exploring the High Seas
	Ach(10168), -- Naval Armada
	Ach(10169), -- Naval Fleet
	Ach(10170):Garrison(), -- Seaman
	Ach(10172):Transmog():AutoFactionSplit(faction.Alliance, 10255), -- Petty Officer
	Ach(10173):AutoFactionSplit(faction.Alliance, 10275), -- Fleet Commander
	Ach(10174):AutoFactionSplit(faction.Alliance, 10276), -- Admiral
	Ach(10177), -- Set Sail!
	Ach(10253), -- Mythic: Gorefiend
	Ach(10256):Transmog():AutoFactionSplit(faction.Alliance, 10258), -- Charting a Course
	Ach(10259), -- Jungle Hunter
	Ach(10260), -- Explore Tanaan Jungle
	Ach(10261), -- Jungle Treasure Hunter
	Ach(10262), -- Jungle Treasure Master
	Ach(10334):Title(), -- Predator
	Ach(10348), -- Master Treasure Hunter
	Ach(10349):AutoFactionSplit(faction.Horde, 10350), -- Tanaan Diplomat
}

KrowiAF.AchievementData2["06_02_02"] = {
	{KrowiAF.SetAchievementPatch, 6, 2, 2},
	Ach(10309), -- Collector's Edition: Zeradar
	Ach(10320), -- Collector's Edition: Illidari Felstalker
	Ach(10321), -- Collector's Edition: Nibbles
	Ach(10322), -- Murkidan
	Ach(10335), -- Did Someone Say...?
	Ach(10337), -- Crashin' Thrashin' Flamer
	Ach(10353):Obtainable("Event", 141), -- Iron Armada
	Ach(10354):Title(), -- Crashin' Thrashin' Commander
	Ach(10355):Mount():AutoFactionSplit(faction.Horde, 10356), -- Lord of the Reins
	Ach(10365):Obtainable("Event", 324), -- A Frightening Friend
}