local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["06_00_02"] = {
    {KrowiAF.SetAchievementPatch, 6, 0, 2},
    { -- You'll Get Caught Up In The... Frostfire!
        8671,
        faction.Horde,
        8845,
    },
    { -- You're Really Doing It Wrong (Level 90)
        8812,
        {
            {"Never"},
        },
    },
    { -- WoW's 10th Anniversary
        8820,
        {
            {},
        },
    },
    {8843}, -- Skyreach
    {8844}, -- Heroic: Skyreach
    { -- As I Walk Through the Valley of the Shadow of Moon
        8845,
        faction.Alliance,
        8671,
    },
    { -- Skyreach Challenger
        8871,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Skyreach: Bronze
        8872,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Skyreach: Silver
        8873,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Skyreach: Gold
        8874,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Bloodmaul Slag Mines Challenger
        8875,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Bloodmaul Slag Mines: Bronze
        8876,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Bloodmaul Slag Mines: Silver
        8877,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Bloodmaul Slag Mines: Gold
        8878,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Auchindoun Challenger
        8879,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Auchindoun: Bronze
        8880,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Auchindoun: Silver
        8881,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Auchindoun: Gold
        8882,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Shadowmoon Burial Grounds Challenger
        8883,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Shadowmoon Burial Grounds: Bronze
        8884,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Shadowmoon Burial Grounds: Silver
        8885,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Shadowmoon Burial Grounds: Gold
        8886,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Grimrail Depot Challenger
        8887,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Grimrail Depot: Bronze
        8888,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Grimrail Depot: Silver
        8889,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Grimrail Depot: Gold
        8890,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Upper Blackrock Spire Challenger
        8891,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Upper Blackrock Spire: Bronze
        8892,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Upper Blackrock Spire: Silver
        8893,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Upper Blackrock Spire: Gold
        8894,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Warlord
        8895,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Warlord: Bronze
        8897,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Warlord: Silver
        8898,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Warlord: Gold
        8899,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Mistwalker
        8903,
        {
            {"Never"},
        },
    },
    {8916}, -- Collector's Edition: Dread Raven
    {8917}, -- Collector's Edition: Dread Hatchling
    { -- Don't Let the Tala-door Hit You on the Way Out
        8919,
        faction.Horde,
        8920,
    },
    { -- Don't Let the Tala-door Hit You on the Way Out
        8920,
        faction.Alliance,
        8919,
    },
    { -- Welcome to Draenor
        8921,
        faction.Alliance,
        8922,
    },
    { -- Welcome to Draenor
        8922,
        faction.Horde,
        8921,
    },
    { -- Putting the Gore in Gorgrond
        8923,
        faction.Alliance,
        8924,
    },
    { -- Putting the Gore in Gorgrond
        8924,
        faction.Horde,
        8923,
    },
    { -- Between Arak and a Hard Place
        8925,
        faction.Alliance,
        8926,
    },
    { -- Between Arak and a Hard Place
        8926,
        faction.Horde,
        8925,
    },
    { -- Nagrandeur
        8927,
        faction.Alliance,
        8928,
    },
    { -- Nagrandeur
        8928,
        faction.Horde,
        8927,
    },
    {8929}, -- The Steel Has Been Brought
    {8930}, -- "Ya, We've Got Time..."
    {8932}, -- Mythic: Flamebender Ka'graz
    {8933}, -- Staying Regular
    {8935}, -- Draenor Explorer
    {8937}, -- Explore Frostfire Ridge
    {8938}, -- Explore Shadowmoon Valley
    {8939}, -- Explore Gorgrond
    {8940}, -- Explore Talador
    {8941}, -- Explore Spires of Arak
    {8942}, -- Explore Nagrand
    {8947}, -- "Hurry Up, Maggot!"
    {8948}, -- Flame On!
    {8949}, -- Mythic: Kargath Bladefist
    {8952}, -- "Ashes, Ashes..."
    {8956}, -- Mythic: Beastlord Darmac
    {8958}, -- Brothers in Arms
    {8960}, -- Mythic: The Butcher
    {8961}, -- Mythic: Tectus
    {8962}, -- Mythic: Brackenspore
    {8963}, -- Mythic: Twin Ogron
    {8964}, -- Mythic: Ko'ragh
    {8965}, -- Mythic: Imperator's Fall
    {8966}, -- Mythic: Gruul
    {8967}, -- Mythic: Oregorger
    {8968}, -- Mythic: Hans'gar and Franzok
    {8969}, -- Mythic: Operator Thogar
    {8970}, -- Mythic: Blast Furnace
    {8971}, -- Mythic: Kromog
    {8972}, -- Mythic: Iron Maidens
    {8973}, -- Mythic: Blackhand's Crucible
    {8974}, -- More Like Wrecked-us
    {8975}, -- A Fungus Among Us
    {8976}, -- Pair Annihilation
    {8977}, -- Lineage of Power
    {8978}, -- The Iron Price
    {8979}, -- "He Shoots, He Ores"
    {8980}, -- Stamp Stamp Revolution
    {8981}, -- Fain Would Lie Down
    {8982}, -- There's Always a Bigger Train
    {8983}, -- Would You Give Me a Hand?
    {8984}, -- Be Quick or Be Dead
    {8985}, -- Glory of the Draenor Raider
    {8986}, -- The Walled City
    {8987}, -- Arcane Sanctum
    {8988}, -- Imperator's Fall
    {8989}, -- Slagworks
    {8990}, -- Black Forge
    {8991}, -- Iron Assembly
    {8992}, -- Blackhand's Crucible
    {8993}, -- A Gift of Earth and Fire
    { -- Iron Docks Challenger
        8997,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Iron Docks: Bronze
        8998,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Iron Docks: Silver
        8999,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Iron Docks: Gold
        9000,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Everbloom Challenger
        9001,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Everbloom: Bronze
        9002,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Everbloom: Silver
        9003,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Everbloom: Gold
        9004,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {9005}, -- Come With Me If You Want to Live
    {9007}, -- No Ticket
    {9008}, -- Is Draenor on Fire?
    { -- Breaker of the Black Harvest
        9016,
        {
            {"Never"},
        },
    },
    {9017}, -- Water Management
    {9018}, -- What's Your Sign?
    {9023}, -- ...They All Fall Down
    {9024}, -- This Is Why We Can't Have Nice Things
    {9025}, -- Icky Ichors
    {9026}, -- Souls of the Lost
    {9033}, -- Ready for Raiding IV
    {9034}, -- Magnify... Enhance
    {9035}, -- I Saw Solis
    {9036}, -- Monomania
    {9037}, -- Bloodmaul Slag Mines
    {9038}, -- Iron Docks
    {9039}, -- Auchindoun
    {9041}, -- Shadowmoon Burial Grounds
    {9042}, -- Upper Blackrock Spire
    {9043}, -- Grimrail Depot
    {9044}, -- The Everbloom
    {9045}, -- "Magnets, How Do They Work?"
    {9046}, -- Heroic: Bloodmaul Slag Mines
    {9047}, -- Heroic: Iron Docks
    {9049}, -- Heroic: Auchindoun
    {9052}, -- Heroic: Grimrail Depot
    {9053}, -- Heroic: The Everbloom
    {9054}, -- Heroic: Shadowmoon Burial Grounds
    {9055}, -- Heroic: Upper Blackrock Spire
    {9056}, -- Bridge Over Troubled Fire
    {9057}, -- Dragonmaw? More Like Dragonfall!
    {9058}, -- Leeeeeeeeeeeeeroy...?
    { -- Level 100 (Legacy)
        9060,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {9069}, -- An Awfully Big Adventure
    {9070}, -- Overstuffed
    {9071}, -- Inspector Gadgetzan
    {9072}, -- Mantle of the Talon King
    {9076}, -- Choppin' Some Logs
    {9077}, -- Choppin' Some More Logs
    { -- Choppin' Even More Logs
        9078,
        faction.Alliance,
        9080,
    },
    { -- Choppin' Even More Logs
        9080,
        faction.Horde,
        9078,
    },
    {9081}, -- Expert Timing
    {9082}, -- Take Cover!
    {9083}, -- "Militaristic, Expansionist"
    {9087}, -- Draenor Master of All
    {9094}, -- Garrison Architect
    {9095}, -- Builder
    {9096}, -- Master Builder
    {9097}, -- Keepin' Busy
    {9098}, -- Movin' On Up
    {9099}, -- Time for an Upgrade
    { -- More Plots
        9100,
        faction.Alliance,
        9545,
    },
    { -- Even More Plots
        9101,
        faction.Alliance,
        9546,
    },
    { -- Ashran Victory
        9102,
        {
            IsPvP = true,
        },
    },
    { -- Bounty Hunter
        9103,
        faction.Horde,
        9104,
        true,
    },
    { -- Bounty Hunter
        9104,
        faction.Alliance,
        9103,
        true,
    },
    { -- Tour of Duty
        9105,
        {
            IsPvP = true,
        },
    },
    { -- Just for Me
        9106,
        {
            IsPvP = true,
        },
    },
    {9107}, -- Follow the Leader
    {9108}, -- "Where You Go, They Will Follow"
    {9109}, -- Fearless Leader
    {9110}, -- Following Up
    {9111}, -- Raising the Bar
    {9125}, -- Draftsman
    {9126}, -- Master Draftsman
    {9128}, -- Grand Master Draftsman
    {9129}, -- Filling the Ranks
    {9130}, -- A Rare Friend
    {9131}, -- An Epic Buddy
    { -- Garrison Buddies
        9132,
        faction.Horde,
        9210,
    },
    {9133}, -- On a Mission
    {9134}, -- On a Few Missions
    {9138}, -- On a Lot of Missions
    {9139}, -- On a Massive Number of Missions
    {9140}, -- On a Metric Ton of Missions
    {9141}, -- A Rare Mission
    {9142}, -- Keeping It Rare
    {9143}, -- The Rarer the Better
    {9145}, -- Treasure Mission Specialist
    {9146}, -- Patrol Mission Specialist
    {9147}, -- Mission Specialist
    {9150}, -- Exploration Mission Specialist
    {9152}, -- It's an Invasion!
    {9162}, -- Bronze Defender
    {9164}, -- Silver Defender
    {9165}, -- Golden Defender
    {9167}, -- Invasion Specialist
    { -- You Are Not Your $#*@! Legplates (Season 2)
        9168,
        faction.Alliance,
        9172,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 2)
        9169,
        faction.Alliance,
        9173,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Brawlin' and Shot Callin' (Season 2)
        9170,
        faction.Alliance,
        9174,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Now You're Just Showing Off (Season 2)
        9171,
        faction.Alliance,
        9175,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- You Are Not Your $#*@! Legplates (Season 2)
        9172,
        faction.Horde,
        9168,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- The Second Rule of Brawler's Guild (Season 2)
        9173,
        faction.Horde,
        9169,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Brawlin' and Shot Callin' (Season 2)
        9174,
        faction.Horde,
        9170,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Now You're Just Showing Off (Season 2)
        9175,
        faction.Horde,
        9171,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Deck Your Collection (Season 2)
        9176,
        faction.Alliance,
        9177,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Deck Your Collection (Season 2)
        9177,
        faction.Horde,
        9176,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {9181}, -- Save Those Buildings!
    {9203}, -- Shadow Council Invasion
    {9204}, -- Ogre Invasion
    {9205}, -- Iron Horde Invasion
    {9206}, -- Shadowmoon Clan Invasion
    {9207}, -- Goren Invasion
    {9208}, -- Botani Invasion
    {9209}, -- Master Defender
    { -- Garrison Buddies
        9210,
        faction.Alliance,
        9132,
    },
    {9211}, -- My Item Level Is Higher than Yours
    {9212}, -- My Item Level Is Way Higher than Yours
    {9213}, -- Item Level Army
    { -- Hero of Stormshield
        9214,
        faction.Alliance,
        9215,
        true,
    },
    { -- Hero of Warspear
        9215,
        faction.Horde,
        9214,
        true,
    },
    { -- High-value Targets
        9216,
        {
            IsPvP = true,
        },
    },
    { -- Operation Counterattack
        9217,
        faction.Horde,
        9408,
        true,
    },
    { -- "Grand Theft, 1st Degree"
        9218,
        {
            IsPvP = true,
        },
    },
    { -- "Grand Theft, 2nd Degree"
        9219,
        {
            IsPvP = true,
        },
    },
    { -- "Grand Theft, 3rd Degree"
        9220,
        {
            IsPvP = true,
        },
    },
    { -- Divide and Conquer
        9222,
        {
            IsPvP = true,
        },
    },
    {9223}, -- Weed Whacker
    { -- Take Them Out
        9224,
        faction.Horde,
        9225,
        true,
    },
    { -- Take Them Out
        9225,
        faction.Alliance,
        9224,
        true,
    },
    { -- Down Goes Van Rook
        9228,
        faction.Alliance,
        nil,
        true,
    },
    { -- Primal Gladiator's Felblood Gronnling
        9229,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Hero of the Alliance: Primal
        9230,
        faction.Alliance,
        9231,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Hero of the Horde: Primal
        9231,
        faction.Horde,
        9230,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Primal Gladiator: Warlords Season 1
        9232,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Primal Conquest
        9233,
        faction.Horde,
        9234,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Primal Conquest
        9234,
        faction.Alliance,
        9233,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Primal Combatant
        9236,
        faction.Horde,
        9238,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Primal Combatant
        9238,
        faction.Alliance,
        9236,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Gladiator: Warlords Season 1
        9239,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Duelist: Warlords Season 1
        9240,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Rival: Warlords Season 1
        9241,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Challenger: Warlords Season 1
        9242,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    {9243}, -- Item Level Force
    {9244}, -- Invasions Are Better with Friends
    {9246}, -- Master Draenor Crafter
    { -- Defender of Draenor
        9248,
        faction.Horde,
        9630,
        true,
    },
    { -- Flying High
        9250,
        {
            {"Event", 374},
        },
    },
    { -- Ringmaster
        9251,
        {
            {"Event", 374},
        },
    },
    { -- Brood of Alysrazor
        9252,
        {
            {"Event", 374},
        },
    },
    { -- Mythic Draenor Raider
        9255,
        faction.Horde,
        9631,
    },
    { -- Rescue Operation
        9256,
        faction.Alliance,
        9257,
        true,
    },
    { -- Rescue Operation
        9257,
        faction.Horde,
        9256,
        true,
    },
    {9264}, -- Draenor Pet Brawler
    {9265}, -- Master of Apexis
    { -- It Might Just Save Your Life
        9389,
        {
            {"Event", 423},
        },
    },
    {9391}, -- Draenor Dungeon Hero
    { -- Love Magnet
        9392,
        {
            {"Event", 423},
        },
    },
    { -- Beacon of Love
        9393,
        {
            {"Event", 423},
        },
    },
    { -- They Really Love Me!
        9394,
        {
            {"Event", 423},
        },
    },
    {9396}, -- Glory of the Draenor Hero
    {9400}, -- Gorgrond Monster Hunter
    {9401}, -- Shredder Maniac
    {9402}, -- Prove Your Strength
    {9405}, -- Working Some Orders
    {9406}, -- Working More Orders
    {9407}, -- Working Many Orders
    { -- Operation Counterattack
        9408,
        faction.Alliance,
        9217,
        true,
    },
    {9409}, -- Draenor Archaeologist
    {9410}, -- Unite the Clans
    {9411}, -- Highmaul Historian
    {9412}, -- Arakkoa Archivist
    {9413}, -- Strength and Honor
    {9414}, -- Ogre Observer
    {9415}, -- Secrets of Skettis
    {9419}, -- Draenor Curator
    {9422}, -- "The Search For Fact, Not Truth"
    {9423}, -- Goliaths of Gorgrond
    {9425}, -- So Grossly Incandescent
    { -- To The Afterlife
        9426,
        {
            {"Event", 409},
        },
    },
    { -- Vientos!
        9427,
        {
            {"Event", 409},
        },
    },
    { -- Calavera
        9428,
        {
            {"Event", 409},
        },
    },
    {9429}, -- Upgrading the Mill
    {9432}, -- Would You Like a Pamphlet?
    {9433}, -- A-VOID-ance
    {9434}, -- One of Us! One of Us!
    {9435}, -- Take From Them Everything
    {9436}, -- It's the Stones!
    {9437}, -- A Demidos of Reality
    { -- Ahead of the Curve: Imperator's Fall
        9441,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Cutting Edge: Imperator's Fall
        9442,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Cutting Edge: Blackhand's Crucible
        9443,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    { -- Ahead of the Curve: Blackhand's Crucible
        9444,
        {
            {"Before", "Version", {6, 0, 2}},
        },
    },
    {9450}, -- The Trap Game
    {9451}, -- Trapper's Delight
    {9452}, -- Trap Superstar
    {9453}, -- Draenic Stone Collector
    {9454}, -- Draenic Seed Collector
    {9455}, -- Fire Ammonite Angler
    {9456}, -- Abyssal Gulper Eel Angler
    {9457}, -- Blackwater Whiptail Angler
    {9458}, -- Blind Lake Sturgeon Angler
    {9459}, -- Fat Sleeper Angler
    {9460}, -- Jawless Skulker Angler
    {9461}, -- Sea Scorpion Angler
    {9462}, -- Draenor Angler
    {9463}, -- Draenic Pet Battler
    {9464}, -- Professional Draenor Master
    {9468}, -- Salvaging Pays Off
    {9469}, -- Arakkoa Outcasts
    { -- Council of Exarchs
        9470,
        faction.Alliance,
        9471,
    },
    { -- Frostwolf Orcs
        9471,
        faction.Horde,
        9470,
    },
    {9472}, -- Steamwheedle Preservation Society
    { -- Vol'jin's Spear
        9473,
        faction.Horde,
        9474,
        true,
    },
    { -- Wrynn's Vanguard
        9474,
        faction.Alliance,
        9473,
        true,
    },
    { -- Laughing Skull Orcs
        9475,
        faction.Horde,
        9476,
    },
    { -- Sha'tari Defense
        9476,
        faction.Alliance,
        9475,
    },
    { -- Savage Friends
        9477,
        faction.Horde,
        9478,
    },
    { -- Savage Friends
        9478,
        faction.Alliance,
        9477,
    },
    {9479}, -- You Can't Make a Giant Omelette...
    {9481}, -- You Have Been Rylakinated!
    {9483}, -- I Was Framed!
    {9486}, -- Goodness Gracious
    {9487}, -- Got My Mind On My Draenor Money
    { -- The Garrison Campaign
        9491,
        faction.Alliance,
        9492,
    },
    { -- The Garrison Campaign
        9492,
        faction.Horde,
        9491,
    },
    {9493}, -- "They Burn, Burn, Burn"
    {9494}, -- Commander
    { -- The Bone Collector
        9495,
        {
            IsPvP = true,
        },
    },
    { -- Warlord's Deathwheel
        9496,
        {
            {"Never"},
        },
    },
    {9497}, -- Finding Your Waystones
    {9498}, -- Wingman
    {9499}, -- Wingmen
    {9500}, -- Draenor Cook
    {9501}, -- The Draenor Gourmet
    {9502}, -- Draenor Cuisine
    {9503}, -- Draenor Fisherman
    { -- Draenor Medic
        9505,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Savage Skills to Pay the Bills
        9506,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {9507}, -- Working in Draenor
    { -- Warlord of Draenor
        9508,
        faction.Horde,
        9738,
        true,
    },
    { -- Nemesis: Draenei Destroyer
        9509,
        faction.Horde,
        9516,
        true,
    },
    { -- Nemesis: Dwarfstalker
        9510,
        faction.Horde,
        9522,
        true,
    },
    { -- Nemesis: Gnomebane
        9511,
        faction.Horde,
        9521,
        true,
    },
    { -- Nemesis: Manslayer
        9512,
        faction.Horde,
        9519,
        true,
    },
    { -- Nemesis: Scourge of the Kaldorei
        9513,
        faction.Horde,
        9517,
        true,
    },
    { -- Nemesis: Terror of the Tushui
        9514,
        faction.Horde,
        9520,
        true,
    },
    { -- Nemesis: Worgen Hunter
        9515,
        faction.Horde,
        9518,
        true,
    },
    { -- Nemesis: Slayer of Sin'dorei
        9516,
        faction.Alliance,
        9509,
        true,
    },
    { -- Nemesis: Death Stalker
        9517,
        faction.Alliance,
        9513,
        true,
    },
    { -- Nemesis: Killer of Kezan
        9518,
        faction.Alliance,
        9515,
        true,
    },
    { -- Nemesis: Orcslayer
        9519,
        faction.Alliance,
        9512,
        true,
    },
    { -- Nemesis: Huojin's Fall
        9520,
        faction.Alliance,
        9514,
        true,
    },
    { -- Nemesis: The Butcher
        9521,
        faction.Alliance,
        9511,
        true,
    },
    { -- Nemesis: Troll Hunter
        9522,
        faction.Alliance,
        9510,
        true,
    },
    {9523}, -- Patrolling Draenor
    {9524}, -- Treasure Master
    {9526}, -- Master of Mounts
    {9527}, -- Terrific Technology
    { -- On the Shadow's Trail
        9528,
        faction.Alliance,
        9529,
    },
    { -- On the Shadow's Trail
        9529,
        faction.Horde,
        9528,
    },
    { -- Writing in the Snow
        9530,
        faction.Alliance,
        9531,
    },
    { -- Writing in the Snow
        9531,
        faction.Horde,
        9530,
    },
    {9533}, -- Breaker of Chains
    {9534}, -- Delectable Ogre Delicacies
    {9535}, -- That Was Entirely Unnecessary
    {9536}, -- Slagnarok
    {9537}, -- By Fire Be... Merged?
    {9538}, -- Intro to Husbandry
    { -- Advanced Husbandry
        9539,
        faction.Alliance,
        9705,
    },
    { -- The Stable Master
        9540,
        faction.Alliance,
        9706,
    },
    {9541}, -- The Song of Silence
    {9543}, -- Invasion? What Invasion?
    { -- More Plots
        9545,
        faction.Horde,
        9100,
    },
    { -- Even More Plots
        9546,
        faction.Horde,
        9101,
    },
    {9547}, -- Everything Is Awesome!
    {9548}, -- Buried Treasures
    {9550}, -- "Boldly, You Sought the Power of Ragnaros"
    {9551}, -- Demon's Souls
    {9552}, -- No Tag-backs!
    { -- Securing Draenor
        9562,
        faction.Horde,
        9564,
    },
    { -- Securing Draenor
        9564,
        faction.Alliance,
        9562,
    },
    {9565}, -- Master Trapper
    { -- Victory in Hillsbrad
        9566,
        faction.Horde,
        9729,
        {
            IsPvP = true,
            {"From", "Date", {2014, 11, 21}, "Until", "Date", {2015, 1, 5}},
        },
    },
    {9571}, -- Broke Back Precipice
    {9572}, -- Proving Yourself: Bronze Damage
    {9573}, -- Proving Yourself: Silver Damage
    {9574}, -- Proving Yourself: Gold Damage
    {9575}, -- Proving Yourself: Endless Damage (Wave 10)
    {9576}, -- Proving Yourself: Endless Damage (Wave 20)
    {9577}, -- Proving Yourself: Endless Damage (Wave 30)
    {9578}, -- Proving Yourself: Bronze Tank
    {9579}, -- Proving Yourself: Silver Tank
    {9580}, -- Proving Yourself: Gold Tank
    {9581}, -- Proving Yourself: Endless Tank (Wave 10)
    {9582}, -- Proving Yourself: Endless Tank (Wave 20)
    {9583}, -- Proving Yourself: Endless Tank (Wave 30)
    {9584}, -- Proving Yourself: Bronze Healer
    {9585}, -- Proving Yourself: Silver Healer
    {9586}, -- Proving Yourself: Gold Healer
    {9587}, -- Proving Yourself: Endless Healer (Wave 10)
    {9588}, -- Proving Yourself: Endless Healer (Wave 20)
    {9589}, -- Proving Yourself: Endless Healer (Wave 30)
    {9590}, -- You're Doing it Wrong
    {9597}, -- You're Really Doing It Wrong
    { -- Mountacular
        9598,
        faction.Alliance,
        9599,
    },
    { -- Mountacular
        9599,
        faction.Horde,
        9598,
    },
    {9600}, -- Monster Mash
    {9601}, -- King of the Monsters
    { -- Shoot For the Moon
        9602,
        faction.Alliance,
        9606,
    },
    {9605}, -- Arak Star
    { -- Frostfire Fridge
        9606,
        faction.Horde,
        9602,
    },
    {9607}, -- Make It a Bonus
    {9610}, -- History of Violence
    {9612}, -- Eggs in One Basket
    {9613}, -- "Fish Gotta Swim, Birds Gotta Eat"
    {9615}, -- With a Nagrand Cherry On Top
    {9617}, -- Making the Cut
    { -- The Iron Invasion
        9618,
        {
            {"From", "Date", {2014, 10, 14}, "Until", "Date", {2014, 10, 28}},
        },
    },
    {9619}, -- Savage Hero
    { -- Challenge Master: Bloodmaul Slag Mines
        9620,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Iron Docks
        9621,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Auchindoun
        9622,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Skyreach
        9623,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: The Everbloom
        9624,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Grimrail Depot
        9625,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Shadowmoon Burial Grounds
        9626,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Challenge Master: Upper Blackrock Spire
        9627,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Defender of Draenor
        9630,
        faction.Alliance,
        9248,
        true,
    },
    { -- Mythic Draenor Raider
        9631,
        faction.Alliance,
        9255,
    },
    {9632}, -- The Power Is Yours
    {9633}, -- Cut off the Head
    {9634}, -- Charged Up
    {9635}, -- Bobbing for Orcs
    {9636}, -- United We Stand
    {9637}, -- Poor Communication
    {9638}, -- Heralds of the Legion
    { -- "Fight, Kill, Salute!"
        9639,
        {
            IsPvP = true,
        },
    },
    { -- Chapter I: Call of the Archmage
        9640,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Chapter II: Gul'dan Strikes Back
        9641,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Chapter III: The Foundry Falls
        9642,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {9643}, -- So. Many. Pets.
    {9654}, -- Mean and Green
    {9655}, -- Fight the Power
    {9656}, -- In Plain Sight
    {9658}, -- Pillars of Draenor
    {9659}, -- Iron Wings
    {9663}, -- Picky Palate
    {9667}, -- Burn It to the Ground
    {9670}, -- Toying Around
    {9671}, -- Having a Ball
    {9672}, -- Tons of Toys
    {9673}, -- The Toymaster
    {9674}, -- I Want More Talador
    {9678}, -- Ancient No More
    { -- Time is a Flat Circle
        9680,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {9685}, -- Draenor Safari
    {9703}, -- Stay Awhile and Listen
    { -- Advanced Husbandry
        9705,
        faction.Horde,
        9539,
    },
    { -- The Stable Master
        9706,
        faction.Horde,
        9540,
    },
    { -- Savagely Superior
        9707,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    { -- Savagely Epic
        9708,
        {
            {"Before", "Version", {8, 0, 1}},
        },
    },
    {9710}, -- Poisoning the Well
    {9711}, -- Planned to Fail
    {9712}, -- Shiny Pet Charmer
    {9713}, -- Awake the Drakes
    { -- Thy Kingdom Come
        9714,
        faction.Alliance,
        9715,
        true,
    },
    { -- Thy Kingdom Come
        9715,
        faction.Horde,
        9714,
        true,
    },
    {9724}, -- Taming Draenor
    { -- The Last of Us
        9725,
        {
            IsPvP = true,
        },
    },
    {9726}, -- Treasure Hunter
    {9727}, -- Expert Treasure Hunter
    {9728}, -- Grand Treasure Hunter
    { -- Victory in Hillsbrad
        9729,
        faction.Alliance,
        9566,
        {
            IsPvP = true,
            {"From", "Date", {2014, 11, 21}, "Until", "Date", {2015, 1, 5}},
        },
    },
    { -- Warlord of Draenor
        9738,
        faction.Alliance,
        9508,
        true,
    },
};

KrowiAF.AchievementData["06_01_00"] = {
    {KrowiAF.SetAchievementPatch, 6, 1, 0},
    { -- Darkmoon Race Enthusiast
        9755,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Racer Novice
        9756,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Racer Jockey
        9759,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Racer Leadfoot
        9760,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Racer Roadhog
        9761,
        {
            {"Event", 374},
        },
    },
    {9763}, -- Grommloc
    { -- Rocketeer: Gold
        9764,
        {
            {"Event", 374},
        },
    },
    { -- Rocketeer: Silver
        9766,
        {
            {"Event", 374},
        },
    },
    { -- Rocketeer: Bronze
        9769,
        {
            {"Event", 374},
        },
    },
    { -- Blast Off!
        9770,
        {
            {"Event", 374},
        },
    },
    { -- Go-Getter
        9780,
        {
            {"Event", 374},
        },
    },
    { -- Powermonger: Bronze
        9781,
        {
            {"Event", 374},
        },
    },
    { -- Powermonger: Silver
        9783,
        {
            {"Event", 374},
        },
    },
    { -- Powermonger: Gold
        9785,
        {
            {"Event", 374},
        },
    },
    { -- Wayfarer
        9786,
        {
            {"Event", 374},
        },
    },
    { -- Wanderluster: Bronze
        9787,
        {
            {"Event", 374},
        },
    },
    { -- Wanderluster: Silver
        9790,
        {
            {"Event", 374},
        },
    },
    { -- Wanderluster: Gold
        9792,
        {
            {"Event", 374},
        },
    },
    { -- Big Race Enthusiast
        9793,
        {
            {"Event", 374},
        },
    },
    { -- Big Race Novice
        9794,
        {
            {"Event", 374},
        },
    },
    { -- Big Race Jockey
        9795,
        {
            {"Event", 374},
        },
    },
    { -- Big Race Leadfoot
        9797,
        {
            {"Event", 374},
        },
    },
    { -- Big Race Roadhog
        9799,
        {
            {"Event", 374},
        },
    },
    { -- Rocket Man
        9800,
        {
            {"Event", 374},
        },
    },
    { -- Big Rocketeer: Bronze
        9801,
        {
            {"Event", 374},
        },
    },
    { -- Big Rocketeer: Silver
        9803,
        {
            {"Event", 374},
        },
    },
    { -- Big Rocketeer: Gold
        9805,
        {
            {"Event", 374},
        },
    },
    { -- Vagabond
        9806,
        {
            {"Event", 374},
        },
    },
    { -- Big Wanderluster: Bronze
        9807,
        {
            {"Event", 374},
        },
    },
    { -- Big Wanderluster: Silver
        9809,
        {
            {"Event", 374},
        },
    },
    { -- Big Wanderluster: Gold
        9811,
        {
            {"Event", 374},
        },
    },
    { -- Goal-Oriented
        9812,
        {
            {"Event", 374},
        },
    },
    { -- Big Powermonger: Bronze
        9813,
        {
            {"Event", 374},
        },
    },
    { -- Big Powermonger: Silver
        9815,
        {
            {"Event", 374},
        },
    },
    { -- Big Powermonger: Gold
        9817,
        {
            {"Event", 374},
        },
    },
    { -- Darkmoon Like the Wind
        9819,
        {
            {"Event", 374},
        },
    },
    {9824}, -- Raiding with Leashes III: Drinkin' From the Sunwell
    { -- Master Relic Hunter
        9825,
        faction.Alliance,
        9836,
    },
    {9826}, -- Platinum Defender
    {9827}, -- Impervious Defender
    { -- Ten Hit Tunes
        9828,
        faction.Alliance,
        9897,
    },
    { -- Loremaster of Draenor
        9833,
        faction.Alliance,
        9923,
    },
    { -- Master Relic Hunter
        9836,
        faction.Horde,
        9825,
    },
    {9838}, -- "What A Strange, Interdimensional Trip It's Been"
    {9858}, -- Master and Commander
    { -- Ace Tonk Commander
        9885,
        {
            {"Event", 374},
        },
    },
    { -- Triumphant Turtle Tossing
        9894,
        {
            {"Event", 374},
        },
    },
    { -- Ten Hit Tunes
        9897,
        faction.Horde,
        9828,
    },
    {9900}, -- Exploration Mission Master
    { -- Don't Call Me Junior
        9901,
        faction.Horde,
        9928,
    },
    {9906}, -- Alt-ernative Lifestyle
    {9908}, -- Ready for Powerleveling
    {9909}, -- Heirloom Hoarder
    {9911}, -- Where's the Mailbox?
    { -- Azeroth's Top Twenty Tunes
        9912,
        faction.Alliance,
        9914,
    },
    { -- Azeroth's Top Twenty Tunes
        9914,
        faction.Horde,
        9912,
    },
    {9915}, -- Crashin' Thrashin' Shredder
    { -- Loremaster of Draenor
        9923,
        faction.Horde,
        9833,
    },
    {9924}, -- Field Photographer
    { -- Friends In Places Yet Even Higher Than That
        9925,
        {
            {"Before", "Date", {2019, 6, 11}},
        },
    },
    {9926}, -- Hero of the Storm
    { -- Don't Call Me Junior
        9928,
        faction.Alliance,
        9901,
    },
};

KrowiAF.AchievementData["06_02_00"] = {
    {KrowiAF.SetAchievementPatch, 6, 2, 0},
    {9972}, -- A Race Against Slime
    {9979}, -- Get In My Belly!
    { -- That's Whack!
        9983,
        {
            {"Event", 374},
        },
    },
    {9988}, -- Pro Toss
    {9989}, -- Non-Lethal Enforcer
    { -- Soldier of the Alliance: Warlords Season 1
        9995,
        faction.Alliance,
        9998,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Defender of the Alliance: Warlords Season 1
        9996,
        faction.Alliance,
        10001,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Guardian of the Alliance: Warlords Season 1
        9997,
        faction.Alliance,
        10000,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Soldier of the Horde: Warlords Season 1
        9998,
        faction.Horde,
        9995,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Guardian of the Horde: Warlords Season 1
        10000,
        faction.Horde,
        9997,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    { -- Defender of the Horde: Warlords Season 1
        10001,
        faction.Horde,
        9996,
        {
            IsPvP = true,
            {"PvP Season", 16},
        },
    },
    {10010}, -- Gate of the Setting Sun
    {10011}, -- Siege of Niuzao Temple
    {10012}, -- This Land Was Green and Good Until...
    {10013}, -- Waves Came Crashing Down All Around
    { -- Full Discography
        10015,
        faction.Alliance,
        10016,
    },
    { -- Full Discography
        10016,
        faction.Horde,
        10015,
    },
    {10017}, -- Naval Bonus Specialist
    {10018}, -- Draenor Pathfinder
    {10019}, -- The Black Gate
    {10020}, -- Destructor's Rise
    { -- Chapter IV: Darkness Incarnate
        10021,
        faction.Alliance,
        10148,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {10023}, -- Hellbreach
    {10024}, -- Halls of Blood
    {10025}, -- Bastion of Shadows
    {10026}, -- Nearly Indestructible
    {10027}, -- Mythic: Hellfire Assault
    {10030}, -- Bad Manner(oth)
    {10032}, -- Mythic: Iron Reaver
    {10033}, -- Mythic: Kormrok
    {10034}, -- Mythic: Hellfire High Council
    {10035}, -- Mythic: Kilrogg Deadeye
    {10036}, -- Naval Bonus Expert
    {10037}, -- Mythic: Shadow-Lord Iskar
    {10038}, -- Mythic: Fel Lord Zakuun
    {10039}, -- Mythic: Xhul'horac
    {10040}, -- Mythic: Socrethar the Eternal
    {10041}, -- Mythic: Tyrant Velhari
    {10042}, -- Mythic: Mannoroth
    {10043}, -- Mythic: Archimonde
    { -- Ahead of the Curve: The Black Gate
        10044,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    { -- Cutting Edge: The Black Gate
        10045,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {10052}, -- Tiny Terrors in Tanaan
    {10053}, -- I Found Pepe!
    {10054}, -- Don't Fear the Reaper
    {10057}, -- Turning the Tide
    { -- WoW's 11th Anniversary
        10058,
        {
            {},
        },
    },
    {10061}, -- Hellbane
    { -- In Pursuit of Gul'dan
        10067,
        faction.Alliance,
        10074,
    },
    { -- Draenor's Last Stand
        10068,
        faction.Alliance,
        10075,
    },
    {10069}, -- "I Came, I Clawed, I Conquered"
    {10070}, -- Jungle Stalker
    {10071}, -- The Legion Will NOT Conquer All
    { -- Rumble in the Jungle
        10072,
        faction.Alliance,
        10265,
    },
    {10073}, -- Echoes of Doomfire
    { -- In Pursuit of Gul'dan
        10074,
        faction.Horde,
        10067,
    },
    { -- Draenor's Last Stand
        10075,
        faction.Horde,
        10068,
    },
    {10076}, -- Mythic: Bloodmaul Slag Mines
    {10079}, -- Mythic: Iron Docks
    {10080}, -- Mythic: Auchindoun
    {10081}, -- Mythic: Skyreach
    {10082}, -- Mythic: Grimrail Depot
    {10083}, -- Mythic: The Everbloom
    {10084}, -- Mythic: Shadowmoon Burial Grounds
    {10085}, -- Mythic: Upper Blackrock Spire
    {10086}, -- I'm a Soul Man
    {10087}, -- You Gotta Keep 'em Separated
    { -- Wild Conquest
        10088,
        faction.Horde,
        10089,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Wild Conquest
        10089,
        faction.Alliance,
        10088,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Warmongering Conquest
        10090,
        faction.Horde,
        10091,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Warmongering Conquest
        10091,
        faction.Alliance,
        10090,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Wild Combatant
        10092,
        faction.Horde,
        10093,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Wild Combatant
        10093,
        faction.Alliance,
        10092,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Warmongering Combatant
        10094,
        faction.Horde,
        10095,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Warmongering Combatant
        10095,
        faction.Alliance,
        10094,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Wild Gladiator: Warlords Season 2
        10096,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Warmongering Gladiator: Warlords Season 3
        10097,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Gladiator: Warlords Season 2
        10098,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Duelist: Warlords Season 2
        10099,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Rival: Warlords Season 2
        10100,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Challenger: Warlords Season 2
        10101,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Hero of the Alliance: Wild
        10102,
        faction.Alliance,
        10103,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Hero of the Horde: Wild
        10103,
        faction.Horde,
        10102,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Soldier of the Alliance: Warlords Season 2
        10104,
        faction.Alliance,
        10105,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Soldier of the Horde: Warlords Season 2
        10105,
        faction.Horde,
        10104,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Defender of the Alliance: Warlords Season 2
        10106,
        faction.Alliance,
        10107,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Defender of the Horde: Warlords Season 2
        10107,
        faction.Horde,
        10106,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Guardian of the Alliance: Warlords Season 2
        10108,
        faction.Alliance,
        10109,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Guardian of the Horde: Warlords Season 2
        10109,
        faction.Horde,
        10108,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Gladiator: Warlords Season 3
        10110,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Duelist: Warlords Season 3
        10111,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Rival: Warlords Season 3
        10112,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Challenger: Warlords Season 3
        10113,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Hero of the Alliance: Warmongering
        10114,
        faction.Alliance,
        10115,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Hero of the Horde: Warmongering
        10115,
        faction.Horde,
        10114,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Guardian of the Alliance: Warlords Season 3
        10116,
        faction.Alliance,
        10117,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Guardian of the Horde: Warlords Season 3
        10117,
        faction.Horde,
        10116,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Defender of the Alliance: Warlords Season 3
        10118,
        faction.Alliance,
        10119,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Defender of the Horde: Warlords Season 3
        10119,
        faction.Horde,
        10118,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Soldier of the Alliance: Warlords Season 3
        10120,
        faction.Alliance,
        10121,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Soldier of the Horde: Warlords Season 3
        10121,
        faction.Horde,
        10120,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Wild Gladiator's Felblood Gronnling
        10137,
        {
            IsPvP = true,
            {"PvP Season", 17},
        },
    },
    { -- Warmongering Gladiator's Felblood Gronnling
        10146,
        {
            IsPvP = true,
            {"PvP Season", 18},
        },
    },
    { -- Chapter IV: Darkness Incarnate
        10148,
        faction.Horde,
        10021,
        {
            {"Before", "Version", {7, 0, 3}},
        },
    },
    {10149}, -- Glory of the Hellfire Raider
    {10154}, -- Naval Combat Expert
    {10155}, -- Naval Siege Expert
    {10156}, -- Naval Combat Specialist
    {10159}, -- Naval Treasure Specialist
    {10160}, -- Naval Treasure Expert
    {10161}, -- Naval Siege Specialist
    {10162}, -- Naval Training Specialist
    {10163}, -- Naval Training Expert
    {10164}, -- Master of the Seas
    {10165}, -- Ironsides
    {10166}, -- Naval Mechanics
    { -- Exploring the High Seas
        10167,
        faction.Alliance,
        10307,
    },
    {10168}, -- Naval Armada
    {10169}, -- Naval Fleet
    {10170}, -- Seaman
    { -- Petty Officer
        10172,
        faction.Alliance,
        10255,
    },
    { -- Fleet Commander
        10173,
        faction.Alliance,
        10275,
    },
    { -- Admiral
        10174,
        faction.Alliance,
        10276,
    },
    {10177}, -- Set Sail!
    {10253}, -- Mythic: Gorefiend
    { -- Petty Officer
        10255,
        faction.Horde,
        10172,
    },
    { -- Charting a Course
        10256,
        faction.Alliance,
        10258,
    },
    { -- Charting a Course
        10258,
        faction.Horde,
        10256,
    },
    {10259}, -- Jungle Hunter
    {10260}, -- Explore Tanaan Jungle
    {10261}, -- Jungle Treasure Hunter
    {10262}, -- Jungle Treasure Master
    { -- Rumble in the Jungle
        10265,
        faction.Horde,
        10072,
    },
    { -- Fleet Commander
        10275,
        faction.Horde,
        10173,
    },
    { -- Admiral
        10276,
        faction.Horde,
        10174,
    },
    { -- Exploring the High Seas
        10307,
        faction.Horde,
        10167,
    },
    {10334}, -- Predator
    {10348}, -- Master Treasure Hunter
    { -- Tanaan Diplomat
        10349,
        faction.Horde,
        10350,
    },
    { -- Tanaan Diplomat
        10350,
        faction.Alliance,
        10349,
    },
};

KrowiAF.AchievementData["06_02_02"] = {
    {KrowiAF.SetAchievementPatch, 6, 2, 2},
    {10309}, -- Collector's Edition: Zeradar
    {10320}, -- Collector's Edition: Illidari Felstalker
    {10321}, -- Collector's Edition: Nibbles
    {10322}, -- Murkidan
    {10335}, -- Did Someone Say...?
    {10337}, -- Crashin' Thrashin' Flamer
    { -- Iron Armada
        10353,
        {
            {"Event", 141},
        },
    },
    {10354}, -- Crashin' Thrashin' Commander
    { -- Lord of the Reins
        10355,
        faction.Horde,
        10356,
    },
    { -- Lord of the Reins
        10356,
        faction.Alliance,
        10355,
    },
    { -- A Frightening Friend
        10365,
        {
            {"Event", 324},
        },
    },
};