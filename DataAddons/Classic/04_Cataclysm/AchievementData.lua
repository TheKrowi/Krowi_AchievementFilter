local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData["04_00_01"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 1},
	Ach(4832):Obtainable("Never"), -- Friends In Even Higher Places
	Ach(4887):Obtainable("Never"), -- Tripping the Rifts
	Ach(5377):Obtainable("Never"), -- Collector's Edition: Lil' Deathwing
	Ach(5378):Obtainable("Never"), -- Deathy
	Ach(5512):Obtainable("Never"), -- WoW's 6th Anniversary
	Ach(5535):Obtainable("Before", "Version", {6, 0, 2}), -- 1000 Valor Points
	Ach(5536):Obtainable("Before", "Version", {6, 0, 2}), -- 5000 Valor Points
	Ach(5537):Obtainable("Before", "Version", {6, 0, 2}), -- 25,000 Valor Points
	Ach(5538):Obtainable("Before", "Version", {6, 0, 2}), -- 50,000 Valor Points
};

KrowiAF.AchievementData["04_00_03"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 3},
	Ach(4825), -- Explore Vashj'ir
	Ach(4826):Obtainable("Before", "Version", {9, 0, 1}), -- Level 85
	Ach(4827), -- Surveying the Damage
	Ach(4833), -- Blackrock Caverns
	Ach(4839), -- Throne of the Tides
	Ach(4840), -- Grim Batol
	Ach(4841), -- Halls of Origination
	Ach(4842), -- Blackwing Descent
	Ach(4844), -- Cataclysm Dungeon Hero
	Ach(4845):Mount(), -- Glory of the Cataclysm Hero
	Ach(4846), -- The Stonecore
	Ach(4847), -- The Vortex Pinnacle
	Ach(4848), -- Lost City of the Tol'vir
	Ach(4849), -- Keeping it in the Family
	Ach(4850), -- The Bastion of Twilight
	Ach(4851), -- Throne of the Four Winds
	Ach(4852), -- Double Dragon
	Ach(4853):Mount(), -- Glory of the Cataclysm Raider
	Ach(4854):Title(), -- I Had It in My Hand
	Ach(4855):Title(), -- What was Briefly Yours is Now Mine
	Ach(4856):Title(), -- It Belongs in a Museum!
	Ach(4857), -- Journeyman in Archaeology
	Ach(4858), -- Seven Scepters
	Ach(4859), -- Kings Under the Mountain
	Ach(4863), -- Explore Hyjal
	Ach(4864), -- Explore Deepholm
	Ach(4865), -- Explore Uldum
	Ach(4866), -- Explore Twilight Highlands
	Ach(4868), -- Explore Cataclysm
	Ach(4869):AutoFactionSplit(faction.Alliance, 4982), -- Sinking into Vashj'ir
	Ach(4870), -- Coming Down the Mountain
	Ach(4871), -- Deep into Deepholm
	Ach(4872), -- Unearthing Uldum
	Ach(4873):AutoFactionSplit(faction.Alliance, 5501), -- Fading into Twilight
	Ach(4874), -- Breaking Out of Tol Barad
	Ach(4875), -- Loremaster of Cataclysm
	Ach(4881), -- The Earthen Ring
	Ach(4882), -- The Guardians of Hyjal
	Ach(4883), -- Therazane
	Ach(4884), -- Ramkahen
	Ach(4885):AutoFactionSplit(faction.Alliance, 4886), -- Wildhammer Clan / Dragonmaw Clan
	Ach(4888), -- One Hump or Two?
	Ach(4892), -- Eastern Plaguelands Quests
	Ach(4893), -- Western Plaguelands Quests
	Ach(4894):FactionSplit(faction.Horde, 4903), -- Silverpine Forest Quests
	Ach(4895):AutoFactionSplit(faction.Horde, 4902), -- Hillsbrad Foothills Quests
	Ach(4896), -- Arathi Highlands Quests
	Ach(4897), -- Hinterlands Quests
	Ach(4899):FactionSplit(faction.Alliance, 4908), -- Loch Modan Quests
	Ach(4900), -- Badlands Quests
	Ach(4901), -- Burning Steppes Quests
	Ach(4902):FactionSplit(faction.Alliance, 4895), -- Redridge Mountains Quests
	Ach(4903):FactionSplit(faction.Alliance, 4894), -- Redridge Mountains Quests (Classic)
	Ach(4904), -- Swamp of Sorrows Quests
	Ach(4905), -- Cape of Stranglethorn Quests
	Ach(4906), -- Northern Stranglethorn Quests
	Ach(4908):FactionSplit(faction.Horde, 4899), -- Ghostlands Quests
	Ach(4909), -- Blasted Lands Quests
	Ach(4910), -- Searing Gorge Quests
	Ach(4914), -- Working Around the Clock
	Ach(4915):Obtainable("Before", "Version", {8, 0, 1}), -- More Skills to Pay the Bills
	Ach(4916), -- Illustrious Grand Master Cook
	Ach(4917), -- Illustrious Grand Master Fisherman
	Ach(4918):Obtainable("Before", "Version", {8, 0, 1}), -- Illustrious Grand Master in First Aid
	Ach(4919), -- Expert in Archaeology
	Ach(4920), -- Artisan in Archaeology
	Ach(4921), -- Master in Archaeology
	Ach(4922), -- Grand Master in Archaeology
	Ach(4923), -- Illustrious Grand Master in Archaeology
	Ach(4924), -- Professional Illustrious Grand Master
	Ach(4925):AutoFactionSplit(faction.Alliance, 4976), -- Ashenvale Quests
	Ach(4926):AutoFactionSplit(faction.Alliance, 4933), -- Bloodmyst Isle Quests / Northern Barrens Quests
	Ach(4927):AutoFactionSplit(faction.Horde, 4928), -- Azshara Quests / Darkshore Quests
	Ach(4929):AutoFactionSplit(faction.Alliance, 4978), -- Dustwallow Marsh Quests
	Ach(4930), -- Desolace Quests
	Ach(4931), -- Felwood Quests
	Ach(4932):AutoFactionSplit(faction.Alliance, 4979), -- Feralas Quests
	Ach(4934), -- Silithus Quests
	Ach(4935), -- Tanaris Quests
	Ach(4936):AutoFactionSplit(faction.Alliance, 4980), -- Stonetalon Mountains Quests
	Ach(4937):AutoFactionSplit(faction.Alliance, 4981), -- Southern Barrens Quests
	Ach(4938), -- Thousand Needles Quests
	Ach(4939), -- Un'Goro Crater Quests
	Ach(4940), -- Winterspring Quests
	Ach(4956), -- 5 Dungeon Quests Completed
	Ach(4957), -- 20 Dungeon Quests Completed
	Ach(4958), -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
	Ach(4959), -- Beware of the 'Unbeatable?' Pterodactyl
	Ach(4960), -- Round Three. Fight!
	Ach(4961), -- In a Thousand Years Even You Might be Worth Something
	Ach(4975), -- From Hell's Heart I Stab at Thee
	Ach(4995), -- Explore the Cape of Stranglethorn
	Ach(4996), -- Explore Southern Barrens
	Ach(4998):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Shaman
	Ach(4999):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85
	Ach(5000):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Druid
	Ach(5001):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Paladin
	Ach(5002):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Priest
	Ach(5003):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Warlock
	Ach(5004):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Hunter
	Ach(5005):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Death Knight
	Ach(5006):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Mage
	Ach(5007):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Warrior
	Ach(5008):IsRealmFirst():Obtainable("Once"), -- Realm First! Level 85 Rogue
	Ach(5060), -- Heroic: Blackrock Caverns
	Ach(5061), -- Heroic: Throne of the Tides
	Ach(5062), -- Heroic: Grim Batol
	Ach(5063), -- Heroic: The Stonecore
	Ach(5064), -- Heroic: The Vortex Pinnacle
	Ach(5065), -- Heroic: Halls of Origination
	Ach(5066), -- Heroic: Lost City of the Tol'vir
	Ach(5083), -- Heroic: Deadmines
	Ach(5093), -- Heroic: Shadowfang Keep
	Ach(5094), -- Heroic: Magmaw
	Ach(5107), -- Heroic: Omnotron Defense System
	Ach(5108), -- Heroic: Maloriak
	Ach(5109), -- Heroic: Atramedes
	Ach(5115), -- Heroic: Chimaeron
	Ach(5116):Title(), -- Heroic: Nefarian
	Ach(5117), -- Heroic: Valiona and Theralion
	Ach(5118), -- Heroic: Halfus Wyrmbreaker
	Ach(5119), -- Heroic: Ascendant Council
	Ach(5120), -- Heroic: Cho'gall
	Ach(5121):Title(), -- Heroic: Sinestra
	Ach(5122), -- Heroic: Conclave of Wind
	Ach(5123):Title(), -- Heroic: Al'Akir
	Ach(5180), -- Breaking The Sound Barrier
	Ach(5191), -- Tragedy in Three Acts
	Ach(5192), -- The Harder they Fall
	Ach(5193), -- Blue Streak
	Ach(5208):IsPvP(), -- Twin Peaking
	Ach(5209):IsPvP(), -- Twin Peaks Veteran
	Ach(5210):IsPvP(), -- Two-Timer
	Ach(5211):IsPvP(), -- Top Defender
	Ach(5213):AutoFactionSplit(faction.Alliance, 5214):IsPvP(), -- Soaring Spirits
	Ach(5215):IsPvP(), -- Twin Peaks Perfection
	Ach(5216):IsPvP(), -- Peak Speed
	Ach(5219):AutoFactionSplit(faction.Alliance, 5220):IsPvP(), -- I'm in the White Lodge / I'm in the Black Lodge
	Ach(5221):AutoFactionSplit(faction.Alliance, 5222):IsPvP(), -- Fire, Walk With Me
	Ach(5223):IsPvP(), -- Master of Twin Peaks
	Ach(5226):AutoFactionSplit(faction.Alliance, 5227):IsPvP(), -- Cloud Nine
	Ach(5228):AutoFactionSplit(faction.Horde, 5229):IsPvP(), -- Wild Hammering / Drag a Maw
	Ach(5230):IsPvP(), -- Twin Peaks Mountaineer
	Ach(5231):AutoFactionSplit(faction.Alliance, 5552):IsPvP(), -- Double Jeopardy
	Ach(5245):IsPvP(), -- Battle for Gilneas Victory
	Ach(5246):IsPvP(), -- Battle for Gilneas Veteran
	Ach(5247):IsPvP(), -- Battle for Gilneas Perfection
	Ach(5248):IsPvP(), -- Bustin' Caps to Make It Haps
	Ach(5249):IsPvP(), -- One Two Three You Don't Know About Me
	Ach(5250):IsPvP(), -- Out of the Fog
	Ach(5251):IsPvP(), -- Not Your Average PUG'er
	Ach(5252):IsPvP(), -- Don't Get Cocky Kid
	Ach(5253):IsPvP(), -- Full Coverage
	Ach(5254):IsPvP(), -- Newbs to Plowshares
	Ach(5255):IsPvP(), -- Jugger Not
	Ach(5256):IsPvP(), -- Battle for Gilneas All-Star
	Ach(5257):IsPvP(), -- Battle for Gilneas Assassin
	Ach(5258):IsPvP(), -- Master of the Battle for Gilneas
	Ach(5262):IsPvP(), -- Double Rainbow
	Ach(5266):IsPvP(), -- Three's Company: 2400
	Ach(5267):IsPvP(), -- Three's Company: 2700
	Ach(5268):AutoFactionSplit(faction.Alliance, 5269):IsPvP(), -- In Service of the Alliance / In Service of the Horde
	Ach(5281), -- Crushing Bones and Cracking Skulls
	Ach(5282), -- Arrested Development
	Ach(5283), -- Too Hot to Handle
	Ach(5284), -- Ascendant Descending
	Ach(5285), -- Old Faithful
	Ach(5286), -- Prince of Tides
	Ach(5287), -- Rotten to the Core
	Ach(5288), -- No Static at All
	Ach(5289), -- Extra Credit Bonus Stage
	Ach(5290), -- Kill It With Fire!
	Ach(5291), -- Acrocalypse Now
	Ach(5292), -- Headed South
	Ach(5293), -- I Hate That Song
	Ach(5294), -- Straw That Broke the Camel's Back
	Ach(5295), -- Sun of a....
	Ach(5296), -- Faster Than the Speed of Light
	Ach(5297), -- Umbrage for Umbriss
	Ach(5298), -- Don't Need to Break Eggs to Make an Omelet
	Ach(5300), -- The Only Escape
	Ach(5301), -- The Boy Who Would be King
	Ach(5304), -- Stay Chill
	Ach(5305), -- Four Play
	Ach(5306), -- Parasite Evening
	Ach(5307), -- Achieve-a-tron
	Ach(5308), -- Silence is Golden
	Ach(5309), -- Full of Sound and Fury
	Ach(5310), -- Aberrant Behavior
	Ach(5311), -- Elementary
	Ach(5312), -- The Abyss Will Gaze Back Into You
	Ach(5313):Obtainable("Before", "Version", {5, 0, 5}), -- I Can't Hear You Over the Sound of How Awesome I Am
	Ach(5315), -- Digger
	Ach(5317), -- Help the Bombardier! I'm the Bombardier!
	Ach(5318):AutoFactionSplit(faction.Alliance, 5319), -- 20,000 Leagues Under the Sea
	Ach(5320):AutoFactionSplit(faction.Alliance, 5321), -- King of the Mountain
	Ach(5322):AutoFactionSplit(faction.Alliance, 5323):IsPvP(), -- In Service of the Alliance / In Service of the Horde
	Ach(5324):AutoFactionSplit(faction.Horde, 5327):IsPvP(), -- In Service of the Horde / In Service of the Alliance
	Ach(5325):AutoFactionSplit(faction.Horde, 5328):Title():IsPvP(), -- Veteran of the Horde / Veteran of the Alliance
	Ach(5326):AutoFactionSplit(faction.Horde, 5329):Title():IsPvP(), -- Warbringer of the Horde / Warbound Veteran of the Alliance
	Ach(5330):AutoFactionSplit(faction.Alliance, 5345):Title():IsPvP(), -- Private / Scout
	Ach(5331):AutoFactionSplit(faction.Alliance, 5346):Title():IsPvP(), -- Corporal / Grunt
	Ach(5332):AutoFactionSplit(faction.Alliance, 5347):Title():IsPvP(), -- Sergeant
	Ach(5333):AutoFactionSplit(faction.Alliance, 5348):Title():IsPvP(), -- Master Sergeant / Senior Sergeant
	Ach(5334):AutoFactionSplit(faction.Alliance, 5349):Title():IsPvP(), -- Sergeant Major / First Sergeant
	Ach(5335):AutoFactionSplit(faction.Alliance, 5350):Title():IsPvP(), -- Knight / Stone Guard
	Ach(5336):AutoFactionSplit(faction.Alliance, 5351):Title():IsPvP(), -- Knight-Lieutenant / Blood Guard
	Ach(5337):AutoFactionSplit(faction.Alliance, 5352):Title():IsPvP(), -- Knight-Captain / Legionnaire
	Ach(5338):AutoFactionSplit(faction.Horde, 5359):Title():IsPvP(), -- Centurion / Knight-Champion
	Ach(5339):AutoFactionSplit(faction.Alliance, 5353):Title():IsPvP(), -- Lieutenant Commander / Champion
	Ach(5340):AutoFactionSplit(faction.Alliance, 5354):Title():IsPvP(), -- Commander / Lieutenant General
	Ach(5341):AutoFactionSplit(faction.Alliance, 5355):Title():IsPvP(), -- Marshal / General
	Ach(5342):AutoFactionSplit(faction.Horde, 5357):Title():IsPvP(), -- Warlord / Field Marshal
	Ach(5343):AutoFactionSplit(faction.Alliance, 5356):Title():IsPvP(), -- Grand Marshal / High Warlord
	Ach(5344):AutoFactionSplit(faction.Alliance, 5358):Title():PvP(9), -- Hero of the Alliance / Horde: Vicious
	Ach(5363):Title():IsPvP(), -- 250000 Honorable Kills
	Ach(5364):Obtainable("Before", "Version", {6, 0, 2}), -- Don't Want No Zombies on My Lawn
	Ach(5365):Obtainable("Before", "Version", {6, 0, 2}), -- Bloom and Doom
	Ach(5366), -- Ready for Raiding
	Ach(5367), -- Rat Pack
	Ach(5368), -- Prototype Prodigy
	Ach(5369), -- It's Frost Damage
	Ach(5370), -- I'm on a Diet
	Ach(5371), -- Vigorous VanCleef Vindicator
	Ach(5372):Obtainable("Before", "Version", {8, 0, 1}), -- Cataclysmically Epic
	Ach(5373):Obtainable("Before", "Version", {8, 0, 1}), -- Cataclysmically Superior
	Ach(5374), -- 45 Exalted Reputations
	Ach(5375):AutoFactionSplit(faction.Alliance, 5376), -- Baradin's Wardens / Hellscream's Reach
	Ach(5381):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Alchemist
	Ach(5382):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Blacksmith
	Ach(5383):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Cooking
	Ach(5384):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Enchanter
	Ach(5385):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Engineer
	Ach(5386):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious First Aid
	Ach(5387):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Angler
	Ach(5388):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Herbalism
	Ach(5389):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Scribe
	Ach(5390):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Jewelcrafter
	Ach(5391):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Leatherworker
	Ach(5392):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Miner
	Ach(5393):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Skinner
	Ach(5394):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Tailor
	Ach(5395):IsRealmFirst():Obtainable("Once"), -- Realm First! Grand Master Archaeologist
	Ach(5396):IsRealmFirst():Obtainable("Once"), -- Realm First! Illustrious Archaeologist
	Ach(5412):IsPvP(), -- Tol Barad Victory
	Ach(5415):IsPvP(), -- Tower Plower
	Ach(5416), -- Pit Lord Argaloth
	Ach(5417):AutoFactionSplit(faction.Alliance, 5418):IsPvP(), -- Tol Barad Veteran
	Ach(5442), -- Full Caravan
	Ach(5443), -- E'ko Madness
	Ach(5444), -- Ready, Set, Goat!
	Ach(5445), -- Fungalophobia
	Ach(5446), -- The Glop Family Line
	Ach(5447), -- My Very Own Broodmother
	Ach(5448), -- Glutton for Fiery Punishment
	Ach(5449):Pet(), -- Rock Lover
	Ach(5450), -- Fungal Frenzy
	Ach(5451), -- Consumed by Nightmare
	Ach(5452), -- Visions of Vashj'ir Past
	Ach(5453):AutoFactionSplit(faction.Alliance, 5454), -- Ghosts in the Dark / Joy Ride
	Ach(5455), -- Got My Mind On My Money
	Ach(5456), -- Got My Mind On My Money
	Ach(5469), -- Diggerer
	Ach(5470), -- Diggerest
	Ach(5471), -- Iron Chef
	Ach(5472), -- The Cataclysmic Gourmet
	Ach(5473), -- The Cataclysmic Gourmet
	Ach(5474):AutoFactionSplit(faction.Alliance, 5475), -- Let's Do Lunch: Stormwind / Orgrimmar
	Ach(5476):AutoFactionSplit(faction.Alliance, 5477), -- Fish or Cut Bait: Stormwind / Orgrimmar
	Ach(5478), -- The Limnologist
	Ach(5479), -- The Oceanographer
	Ach(5480), -- Preparing for Disaster
	Ach(5481):AutoFactionSplit(faction.Alliance, 5482), -- Wildhammer Tour of Duty / Dragonmaw Tour of Duty
	Ach(5483), -- Bounce
	Ach(5486):IsPvP(), -- Tol Barad All-Star
	Ach(5487):IsPvP(), -- Tol Barad Saboteur
	Ach(5488):IsPvP(), -- Towers of Power
	Ach(5489):AutoFactionSplit(faction.Alliance, 5490):IsPvP(), -- Master of Tol Barad
	Ach(5503), -- Pardon Denied
	Ach(5504), -- To the Ground!
	Ach(5505), -- Bullet Time
	Ach(5506):Title(), -- Defender of a Shattered World
	Ach(5511), -- It's Always in the Last Place You Look
	Ach(5518), -- Stood in the Fire
	Ach(5533):Obtainable("Never"), -- Veteran of the Shifting Sands
	Ach(5539):IsPvP():Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18), -- 50,000 Conquest Points
	Ach(5540):IsPvP():Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18), -- 25,000 Conquest Points
	Ach(5541):IsPvP():Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18), -- 5000 Conquest Points
	Ach(5542):IsPvP():Obtainable("From", "PvP Season", 9, "Until", "PvP Season", 18), -- 1000 Conquest Points
	Ach(5546), -- Glutton for Icy Punishment
	Ach(5547), -- Glutton for Shadowy Punishment
	Ach(5548), -- To All the Squirrels Who Cared for Me
	Ach(5552):FactionSplit(faction.Horde, 5231), -- Double Jeopardy
};

KrowiAF.AchievementData["04_00_06"] = {
	{KrowiAF.SetAchievementPatch, 4, 0, 6},
	Ach(5718):AutoFactionSplit(faction.Alliance, 5719), -- Just Another Day in Tol Barad
	Ach(5723), -- 50 Exalted Reputations
};

KrowiAF.AchievementData["04_01_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 1, 0},
	Ach(5743), -- It's Not Easy Being Green
	Ach(5744), -- Gurubashi Headhunter
	Ach(5749), -- Vial of the Sands
	Ach(5750), -- Tunnel Vision
	Ach(5751), -- 2500 Daily Quests Complete
	Ach(5752), -- Justly Rewarded
	Ach(5753), -- Cataclysmically Delicious
	Ach(5754), -- Drown Your Sorrows
	Ach(5755), -- Thirty Tabards
	Ach(5759), -- Spirit Twister
	Ach(5760), -- Ring Out!
	Ach(5761), -- Hex Mix
	Ach(5762), -- Ohganot So Fast!
	Ach(5765), -- Here, Kitty Kitty...
	Ach(5767):Title(), -- Scourer of the Eternal Sands
	Ach(5768), -- Heroic: Zul'Gurub
	Ach(5769), -- Heroic: Zul'Aman
	Ach(5779), -- You'll Feel Right as Rain
	Ach(5788):Obtainable("Never"), -- Agent of the Shen'dralar
};

KrowiAF.AchievementData["04_02_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 2, 0},
	Ach(5794), -- Time Flies When You're Having Fun
	Ach(5799), -- Only the Penitent...
	Ach(5802), -- Firelands
	Ach(5803):Title(), -- Heroic: Ragnaros
	Ach(5804), -- Heroic: Majordomo Fandral Staghelm
	Ach(5805), -- Heroic: Baleroc
	Ach(5806), -- Heroic: Shannox
	Ach(5807), -- Heroic: Beth'tilac
	Ach(5808), -- Heroic: Lord Rhyolith
	Ach(5809), -- Heroic: Alysrazor
	Ach(5810), -- Not an Ambi-Turner
	Ach(5813), -- Do a Barrel Roll!
	Ach(5821), -- Death from Above
	Ach(5823):AutoFactionSplit(faction.Alliance, 5824):Mount():IsPvP(), -- Veteran of the Alliance / Horde II
	Ach(5827):Title(), -- Avengers of Hyjal
	Ach(5828):Mount(), -- Glory of the Firelands Raider
	Ach(5829), -- Bucket List
	Ach(5830), -- Share the Pain
	Ach(5835):AutoFactionSplit(faction.Horde, 5836):Obtainable("Event", 324), -- Tricks and Treats of Northrend
	Ach(5837):AutoFactionSplit(faction.Alliance, 5838):Obtainable("Event", 324), -- Tricks and Treats of the Cataclysm
	Ach(5839), -- Dragonwrath, Tarecgosa's Rest
	Ach(5841):AutoFactionSplit(faction.Alliance, 5843), -- Let's Do Lunch: Ironforge / Thunder Bluff
	Ach(5842):AutoFactionSplit(faction.Alliance, 5844), -- Let's Do Lunch: Darnassus / Undercity
	Ach(5845), -- A Bunch of Lunch
	Ach(5847):AutoFactionSplit(faction.Alliance, 5849), -- Fish or Cut Bait: Ironforge / Thunder Bluff
	Ach(5848):AutoFactionSplit(faction.Alliance, 5850), -- Fish or Cut Bait: Darnassus / Undercity
	Ach(5851), -- Gone Fishin'
	Ach(5855), -- Ragnar-O's
	Ach(5858), -- Bear-ly Made It
	Ach(5859):Other(), -- Legacy of Leyara
	Ach(5860):Pet(), -- The 'Unbeatable?' Pterodactyl: BEATEN.
	Ach(5861), -- The Fiery Lords of Sethria's Roost
	Ach(5862), -- Ludicrous Speed
	Ach(5863):Obtainable("Never"), -- WoW's 7th Anniversary
	Ach(5864), -- Gang War
	Ach(5865), -- Have... Have We Met?
	Ach(5866):Mount(), -- The Molten Front Offensive
	Ach(5867), -- Flawless Victory
	Ach(5868), -- And the Meek Shall Inherit Kalimdor
	Ach(5869), -- Infernal Ambassadors
	Ach(5870), -- Fireside Chat
	Ach(5871), -- Master of the Molten Flow
	Ach(5872), -- King of the Spider-Hill
	Ach(5873), -- Ready for Raiding II
	Ach(5874), -- Death From Above
	Ach(5875):Pet(), -- Littlest Pet Shop
	Ach(5876):Pet(), -- Petting Zoo
	Ach(5877):Pet(), -- Menagerie
	Ach(5879):Title(), -- Veteran of the Molten Front
};

KrowiAF.AchievementData["04_02_02"] = {
	{KrowiAF.SetAchievementPatch, 4, 2, 2},
	Ach(6045), -- Occu'thar
};

KrowiAF.AchievementData["04_03_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 0},
	Ach(5853):AutoFactionSplit(faction.Alliance, 5854):Obtainable("Event", 141), -- A-Caroling We Will Go
	Ach(5995), -- Moon Guard
	Ach(6002):PvP(9), -- Vicious Gladiator: Season 9
	Ach(6003):PvP(9), -- Vicious Gladiator's Twilight Drake
	Ach(6006):Obtainable("Event", 327), -- Elders of Cataclysm
	Ach(6007):AutoFactionSplit(faction.Alliance, 6010):Obtainable("Event", 341), -- Extinguishing Northrend
	Ach(6008):AutoFactionSplit(faction.Alliance, 6009):Obtainable("Event", 341), -- Flame Warden / Keeper of Northrend
	Ach(6011):AutoFactionSplit(faction.Alliance, 6012):Obtainable("Event", 341), -- Flame Warden / Keeper of Cataclysm
	Ach(6013):AutoFactionSplit(faction.Alliance, 6014):Obtainable("Event", 341), -- Extinguishing the Cataclysm
	Ach(6019):Obtainable("Event", 374), -- Come One, Come All!
	Ach(6020):Obtainable("Event", 374), -- Step Right Up
	Ach(6021):Obtainable("Event", 374), -- Blastenheimer Bullseye
	Ach(6022):Obtainable("Event", 374), -- Quick Shot
	Ach(6023):IsPvP():Obtainable("Event", 374), -- Darkmoon Duelist
	Ach(6024):IsPvP():Obtainable("Event", 374), -- Darkmoon Dominator
	Ach(6025):Obtainable("Event", 374), -- I Was Promised a Pony
	Ach(6026):Obtainable("Event", 374), -- Fairegoer's Feast
	Ach(6027):Obtainable("Event", 374), -- Darkmoon Dungeoneer
	Ach(6028):IsPvP():Obtainable("Event", 374), -- Darkmoon Defender
	Ach(6029):Obtainable("Event", 374), -- Darkmoon Despoiler
	Ach(6030):AutoFactionSplit(faction.Alliance, 6031):Obtainable("Event", 374), -- Taking the Show on the Road
	Ach(6032):Obtainable("Event", 374), -- Faire Favors
	Ach(6059), -- Red Rider Air Rifle
	Ach(6060), -- MiniZep Controller
	Ach(6061), -- Gaudy Winter Veil Sweater
	Ach(6070), -- That's Not Canon!
	Ach(6084), -- Minutes to Midnight
	Ach(6105), -- Deck Defender
	Ach(6106), -- Siege of Wyrmrest Temple
	Ach(6107), -- Fall of Deathwing
	Ach(6108), -- Alizabal
	Ach(6109), -- Heroic: Morchok
	Ach(6110), -- Heroic: Warlord Zon'ozz
	Ach(6111), -- Heroic: Yor'sahj the Unsleeping
	Ach(6112), -- Heroic: Hagara the Stormbinder
	Ach(6113), -- Heroic: Ultraxion
	Ach(6114), -- Heroic: Warmaster Blackhorn
	Ach(6115), -- Heroic: Spine of Deathwing
	Ach(6116):Title(), -- Heroic: Madness of Deathwing
	Ach(6117), -- Heroic: End Time
	Ach(6118), -- Heroic: Well of Eternity
	Ach(6119), -- Heroic: Hour of Twilight
	Ach(6124):PvP(10), -- Ruthless Gladiator: Season 10
	Ach(6127), -- Lazy Eye
	Ach(6128), -- Ping Pong Champion
	Ach(6129), -- Taste the Rainbow!
	Ach(6130), -- Severed Ties
	Ach(6131):Obtainable("Never"), -- WoW's 8th Anniversary
	Ach(6132), -- Eclipse
	Ach(6133), -- Maybe He'll Get Dizzy...
	Ach(6169):Mount(), -- Glory of the Dragon Soul Raider
	Ach(6174), -- Don't Stand So Close to Me
	Ach(6175), -- Holding Hands
	Ach(6177):Title(), -- Destroyer's End
	Ach(6180), -- Chromatic Champion
	Ach(6181), -- Fangs of the Father
	Ach(6185):Obtainable("Never"), -- Murkablo
};

KrowiAF.AchievementData["04_03_02"] = {
	{KrowiAF.SetAchievementPatch, 4, 3, 2},
	Ach(6316):AutoFactionSplit(faction.Alliance, 6317):Title():PvP(10), -- Hero of the Alliance / Horde: Ruthless
	Ach(6322):PvP(10), -- Ruthless Gladiator's Twilight Drake
};

KrowiAF.AchievementData["04_04_00"] = {
	{KrowiAF.SetAchievementPatch, 4, 4, 0},
	Ach(40968):Title():PvP(9), -- Rival: Season 9
	Ach(40969):Title():PvP(9), -- Gladiator: Season 9
	Ach(40970):Title():PvP(9), -- Duelist: Season 9
	Ach(40971):Title():PvP(9), -- Challenger: Season 9
};

KrowiAF.AchievementData["04_04_01"] = {
	{KrowiAF.SetAchievementPatch, 4, 4, 1},
	Ach(41139), -- Protocol Inferno: Blackrock Caverns
	Ach(41140), -- Protocol Inferno: Throne of the Tides
	Ach(41141), -- Protocol Inferno: The Stonecore
	Ach(41142), -- Protocol Inferno: The Vortex Pinnacle
	Ach(41143), -- Protocol Inferno: Grim Batol
	Ach(41144), -- Protocol Inferno: Halls of Origination
	Ach(41145), -- Protocol Inferno: Lost City of the Tol'vir
	Ach(41146), -- Protocol Inferno: Deadmines
	Ach(41147), -- Protocol Inferno: Shadowfang Keep
	Ach(41148), -- Protocol Inferno: Terminated
	Ach(41332):Title():PvP(10), -- Rival: Season 10
	Ach(41333):Title():PvP(10), -- Duelist: Season 10
	Ach(41334):Title():PvP(10), -- Challenger: Season 10
	Ach(41336):Title():PvP(10), -- Gladiator: Season 10
};
