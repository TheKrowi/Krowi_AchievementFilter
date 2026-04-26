local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["10_00_00"] = {
	{KrowiAF.SetAchievementPatch, 10, 0, 0},
	Ach(15325):AutoFactionSplit(faction.Alliance, 15638), -- Dracthyr, Awaken
	Ach(15394), -- Ohn'a'Roll
	Ach(15641):Pet(), -- Many More Mini Minions
	Ach(15642):Pet(), -- Proven Pet Parent
	Ach(15643):Pet(), -- What Can I Say? They Love Me.
	Ach(15781):Toy(), -- The Joy of Toy
	Ach(15794), -- A New Friend
	Ach(15795), -- Together in the Skies
	Ach(15796), -- Cliffside Companion
	Ach(15797), -- An Azure Ally
	Ach(15805), -- Level 70
	Ach(15833):Mount():FactionSplit(faction.Horde, 15834), -- Thanks for the Carry!
	Ach(15834):Mount():FactionSplit(faction.Alliance, 15833), -- Thanks for the Carry!
	Ach(15889):Toy(), -- River Rapids Wrangler
	Ach(15890), -- Dragonscale Expedition: The Highest Peaks
	Ach(15915), -- Waking Shores: Bronze
	Ach(15916):Mount(), -- Waking Shores: Silver
	Ach(15917), -- Waking Shores: Gold
	Ach(15918), -- Ohn'ahran Plains: Bronze
	Ach(15919):Mount(), -- Ohn'ahran Plains: Silver
	Ach(15920), -- Ohn'ahran Plains: Gold
	Ach(15921), -- Azure Span: Bronze
	Ach(15922):Mount(), -- Azure Span: Silver
	Ach(15923), -- Azure Span: Gold
	Ach(15924), -- Thaldraszus: Bronze
	Ach(15925):Mount(), -- Thaldraszus: Silver
	Ach(15926), -- Thaldraszus: Gold
	Ach(15927), -- Waking Shores Advanced: Bronze
	Ach(15928):Mount(), -- Waking Shores Advanced: Silver
	Ach(15929), -- Waking Shores Advanced: Gold
	Ach(15930), -- Ohn'ahran Plains Advanced: Bronze
	Ach(15931):Mount(), -- Ohn'ahran Plains Advanced: Silver
	Ach(15932), -- Ohn'ahran Plains Advanced: Gold
	Ach(15933), -- Azure Span Advanced: Bronze
	Ach(15934):Mount(), -- Azure Span Advanced: Silver
	Ach(15935), -- Azure Span Advanced: Gold
	Ach(15936), -- Thaldraszus Advanced: Bronze
	Ach(15937):Mount(), -- Thaldraszus Advanced: Silver
	Ach(15938), -- Thaldraszus Advanced: Gold
	Ach(15939):Transmog(), -- Dragon Racing Completionist: Bronze
	Ach(15940):Pet(), -- Dragon Racing Completionist: Silver
	Ach(15941):Title(), -- Dragon Racing Completionist: Gold
	Ach(15951):Title():PvP(34), -- Crimson Gladiator: Dragonflight Season 1
	Ach(15952):Title():PvP(34), -- Rival I: Dragonflight Season 1
	Ach(15953):PvP(34), -- Rival II: Dragonflight Season 1
	Ach(15954):Title():PvP(34), -- Duelist: Dragonflight Season 1
	Ach(15955):Title():PvP(34), -- Challenger I: Dragonflight Season 1
	Ach(15956):PvP(34), -- Challenger II: Dragonflight Season 1
	Ach(15957):Title():Mount():Transmog():PvP(34), -- Gladiator: Dragonflight Season 1
	Ach(15958):AutoFactionSplit(faction.Horde, 15959):PvP(34), -- Hero of the Horde / Alliance: Crimson
	Ach(15960):Title():PvP(34), -- Combatant I: Dragonflight Season 1
	Ach(15961):PvP(34), -- Combatant II: Dragonflight Season 1
	Ach(15984):Title():PvP(34), -- Elite: Dragonflight Season 1
	Ach(15985), -- Dragon Glyphs: Skytop Observatory Tower
	Ach(15986), -- Dragon Glyphs: Wingrest Embassy
	Ach(15987), -- Dragon Glyphs: Obsidian Bulwark
	Ach(15988), -- Dragon Glyphs: Ruby Life Pools Peaks
	Ach(15989), -- Dragon Glyphs: The Overflowing Spring
	Ach(15990), -- Dragon Glyphs: Life-Binder Observatory
	Ach(15991), -- Dragon Glyphs: Crumbling Life Archway
	Ach(16051), -- Dragon Glyphs: Dragonheart Outpost
	Ach(16052), -- Dragon Glyphs: Scalecracker Peak
	Ach(16053), -- Dragon Glyphs: Obsidian Throne
	Ach(16054), -- Dragon Glyphs: Ohn'ahra's Roost
	Ach(16055), -- Dragon Glyphs: Nokhudon Hold
	Ach(16056), -- Dragon Glyphs: Emerald Gardens
	Ach(16057), -- Dragon Glyphs: The Eternal Kurgans
	Ach(16058), -- Dragon Glyphs: Szar Skeleth
	Ach(16059), -- Dragon Glyphs: Mirror of the Sky
	Ach(16060), -- Dragon Glyphs: Ohn'iri Springs
	Ach(16061), -- Dragon Glyphs: Dragonsprings Summit
	Ach(16062), -- Dragon Glyphs: Rusza'thar Reach
	Ach(16063), -- Dragon Glyphs: Windsong Rise
	Ach(16064), -- Dragon Glyphs: Cobalt Assembly
	Ach(16065), -- Dragon Glyphs: Azure Archives
	Ach(16066), -- Dragon Glyphs: Ruins of Karnthar
	Ach(16067), -- Dragon Glyphs: Lost Ruins
	Ach(16068), -- Dragon Glyphs: Brackenhide Hollow
	Ach(16069), -- Dragon Glyphs: Drake Eye's Pond
	Ach(16070), -- Dragon Glyphs: Imbu
	Ach(16071), -- Dragon Glyphs: Zelthrak Outpost
	Ach(16072), -- Dragon Glyphs: Rhonin's Shield
	Ach(16073), -- Dragon Glyphs: Vakthros Range
	Ach(16098), -- Dragon Glyphs: Temporal Conflux
	Ach(16099), -- Dragon Glyphs: Stormshroud Peak
	Ach(16100), -- Dragon Glyphs: South Hold Gate
	Ach(16101), -- Dragon Glyphs: Valdrakken
	Ach(16102), -- Dragon Glyphs: Algeth'era
	Ach(16103), -- Dragon Glyphs: Tyrhold
	Ach(16104), -- Dragon Glyphs: Algeth'ar Academy
	Ach(16105), -- Dragon Glyphs: Veiled Ossuary
	Ach(16106), -- Dragon Glyphs: Vault of the Incarnates
	Ach(16107), -- Dragon Glyphs: Thaldraszus Apex
	Ach(16110), -- Subscribed to Hyena Facts
	Ach(16255), -- Brackenhide Hollow
	Ach(16256), -- Heroic: Brackenhide Hollow
	Ach(16257), -- Mythic: Brackenhide Hollow
	Ach(16260), -- Halls of Infusion
	Ach(16261), -- Heroic: Halls of Infusion
	Ach(16262), -- Mythic: Halls of Infusion
	Ach(16263), -- Neltharus
	Ach(16264), -- Heroic: Neltharus
	Ach(16265), -- Mythic: Neltharus
	Ach(16266), -- Ruby Life Pools
	Ach(16267), -- Heroic: Ruby Life Pools
	Ach(16268), -- Mythic: Ruby Life Pools
	Ach(16269), -- Algeth'ar Academy
	Ach(16270), -- Heroic: Algeth'ar Academy
	Ach(16271), -- Mythic: Algeth'ar Academy
	Ach(16272), -- The Azure Vault
	Ach(16273), -- Heroic: The Azure Vault
	Ach(16274), -- Mythic: The Azure Vault
	Ach(16275), -- The Nokhud Offensive
	Ach(16276), -- Heroic: The Nokhud Offensive
	Ach(16277), -- Mythic: The Nokhud Offensive
	Ach(16278), -- Uldaman: Legacy of Tyr
	Ach(16279), -- Heroic: Uldaman: Legacy of Tyr
	Ach(16280), -- Mythic: Uldaman: Legacy of Tyr
	Ach(16281), -- Like Sands Through the Hourglass
	Ach(16282), -- No, You're Stunning!
	Ach(16291), -- An Ancient Awakening
	Ach(16292), -- Mastering the Waygates
	Ach(16294), -- Dragonflight Dungeon Hero
	Ach(16295):Mount(), -- Glory of the Dragonflight Hero
	Ach(16296), -- Growlbossify
	Ach(16297), -- Treasures of The Waking Shores
	Ach(16298), -- Treasure Hunter of the Dragon Isles
	Ach(16299), -- Treasures of the Ohn'ahran Plains
	Ach(16300), -- Treasures of The Azure Span
	Ach(16301), -- Treasures of Thaldraszus
	Ach(16317), -- Secret Fishing Spots
	Ach(16320), -- Does Steam Do Fire Damage?
	Ach(16321), -- Cutting Tusk Equipment
	Ach(16322), -- Best in Slot
	Ach(16323), -- Fragments of History
	Ach(16329), -- Duck, Duck, Spruce!
	Ach(16330), -- You Must Be Made of Hide
	Ach(16331), -- The Cracked Crystal
	Ach(16334), -- Waking Hope
	Ach(16335), -- What Frozen Things Do
	Ach(16336), -- Azure Spanner
	Ach(16337), -- It's a Trogg Eat Trogg World
	Ach(16338), -- Fang Flap Fire Fighter
	Ach(16339), -- Myths of the Dragonflight Dungeons
	Ach(16343), -- Vault of the Incarnates
	Ach(16345), -- Heroic: Vault of the Incarnates
	Ach(16346), -- Mythic: Eranog
	Ach(16347), -- Mythic: Terros
	Ach(16348), -- Mythic: The Primal Council
	Ach(16349), -- Mythic: Sennarth, The Cold Breath
	Ach(16350), -- Mythic: Dathea, Ascended
	Ach(16351), -- Mythic: Kurog Grimtotem
	Ach(16352), -- Mythic: Broodkeeper Diurna
	Ach(16353):Title(), -- Mythic: Raszageth the Storm-Eater
	Ach(16354), -- Mythic: Vault of the Incarnates
	Ach(16355):Mount(), -- Glory of the Vault Raider
	Ach(16363), -- Just Don't Ask Me to Spell It
	Ach(16364), -- The Lunker Below
	Ach(16365), -- Little Friends
	Ach(16395), -- Vaulternative Fashion
	Ach(16398), -- Sojourner of Thaldraszus
	Ach(16399), -- Lovin' Lubbins
	Ach(16400), -- Explore the Waking Shores
	Ach(16401), -- Sojourner of the Waking Shores
	Ach(16402), -- Dragon Kill Points
	Ach(16404), -- So You Can Kill This in a Way That Matters...
	Ach(16405), -- Sojourner of Ohn'ahran Plains
	Ach(16406), -- All Sides of the Story
	Ach(16409), -- Let's Get Quacking
	Ach(16410), -- Siege on Dragonbane Keep: Snack Attack
	Ach(16411), -- Siege on Dragonbane Keep: Home Sweet Home
	Ach(16412), -- Siege on Dragonbane Keep: Chiseled Record
	Ach(16419), -- I Was Saving That For Later
	Ach(16423):Toy(), -- Honor Our Ancestors
	Ach(16424), -- Who's a Good Bakar?
	Ach(16426), -- Hungry Hungry Hornswog
	Ach(16427), -- Go With the Flow
	Ach(16428), -- Sojourner of Azure Span
	Ach(16429):Title():PvE(9), -- Thundering Hero: Dragonflight Season 1
	Ach(16430), -- All Bark, All Bite
	Ach(16431):Obtainable("From", "Date", {2022, 11, 15}, "Until", "Date", {2022, 11, 28}), -- Against the Elements
	Ach(16432), -- Ready for Raiding VIII
	Ach(16434), -- See Me After Class
	Ach(16438), -- Knowledge is... Preserved?
	Ach(16440), -- Are You My Broodmother?
	Ach(16441), -- Squad Goals
	Ach(16442), -- Incubation Extermination
	Ach(16443):Title(), -- Soupervisor
	Ach(16444):Transmog(), -- Leftovers' Revenge
	Ach(16445), -- Icy What You Did There
	Ach(16446):Title(), -- That's Pretty Neat!
	Ach(16447), -- What Are The Chances...
	Ach(16450), -- The Power is MINE!
	Ach(16451), -- The Ol Raszle Daszle
	Ach(16452), -- Famliar Skies
	Ach(16453), -- Liquid Hot Magma
	Ach(16456), -- Weapons of the Maruukai
	Ach(16457), -- Explore the Ohn'ahran Plains
	Ach(16458), -- Nothing But Air
	Ach(16460), -- Explore the Azure Span
	Ach(16461), -- Stormed Off
	Ach(16462), -- The Ohn'ahran Trail
	Ach(16463), -- Thunderstorms in The Waking Shores
	Ach(16464), -- Battle on the Dragon Isles
	Ach(16465), -- Sandstorms in The Waking Shores
	Ach(16466), -- Firestorms in The Waking Shores
	Ach(16467), -- Snowstorms in The Waking Shores
	Ach(16468), -- Chasing Storms in The Waking Shores
	Ach(16474), -- Do You Wanna Build a Snowman?
	Ach(16475), -- Thunderstorms in the Ohn'ahran Plains
	Ach(16476), -- Chasing Storms in the Ohn'ahran Plains
	Ach(16477), -- Sandstorms in the Ohn'ahran Plains
	Ach(16478), -- Firestorms in the Ohn'ahran Plains
	Ach(16479), -- Snowstorms in the Ohn'ahran Plains
	Ach(16480), -- Thunderstorms in The Azure Span
	Ach(16481), -- Sandstorms in The Azure Span
	Ach(16482), -- Firestorms in The Azure Span
	Ach(16483), -- Snowstorms in The Azure Span
	Ach(16484), -- Chasing Storms in The Azure Span
	Ach(16485), -- Thunderstorms in Thaldraszus
	Ach(16486), -- Sandstorms in Thaldraszus
	Ach(16487), -- Firestorms in Thaldraszus
	Ach(16488), -- Snowstorms in Thaldraszus
	Ach(16489), -- Chasing Storms in Thaldraszus
	Ach(16490), -- Storm Chaser
	Ach(16492):Mount(), -- Into the Storm
	Ach(16493), -- Petty Theft Mammoth
	Ach(16494):Title(), -- Loyalty to the Prince
	Ach(16495), -- Obsidian Keymaster
	Ach(16496), -- Obsidian Champion
	Ach(16497), -- I'm Playing All Sides
	Ach(16498), -- Elemental Overflow
	Ach(16499), -- Elemental Overflowing
	Ach(16500), -- Elemental Overload
	Ach(16501), -- Aquatic Battler of the Dragon Isles
	Ach(16502), -- Storming the Runway
	Ach(16503), -- Beast Battler of the Dragon Isles
	Ach(16504), -- Critter Battler of the Dragon Isles
	Ach(16505), -- Dragonkin Battler of the Dragon Isles
	Ach(16506), -- Elemental Battler of the Dragon Isles
	Ach(16507), -- Flying Battler of the Dragon Isles
	Ach(16508), -- Humanoid Battler of the Dragon Isles
	Ach(16509), -- Magic Battler of the Dragon Isles
	Ach(16510), -- Mechanical Battler of the Dragon Isles
	Ach(16511), -- Undead Battler of the Dragon Isles
	Ach(16512):Pet(), -- Family Battler of the Dragon Isles
	Ach(16517), -- Toxicity Strike Team
	Ach(16518), -- Explore Thaldraszus
	Ach(16519), -- Dragon Isles Safari
	-- {16522}, -- A True Explorer [Removed in 11.0.7, replaced by 41174]
	-- {16528}, -- Joining the Khansguard [Removed in 11.0.7, replaced by 41180]
	-- {16529}, -- Joining the Community [Removed in 11.0.7, replaced by 41181]
	-- {16530}, -- Ally of the Flights [Removed in 11.0.7, replaced by 41182]
	Ach(16531), -- A Whole Heap of Lunkers
	Ach(16532), -- True Friends with Sabellian
	Ach(16533), -- Lots of Lunkers
	Ach(16536), -- True Friends with Wrathion
	Ach(16537), -- Maximum Power!
	Ach(16539), -- In High Esteem
	Ach(16540), -- Hunt Master
	Ach(16541), -- Longhunter
	Ach(16542), -- The Disgruntled Hunter
	Ach(16543), -- Tetrachromancer
	Ach(16544), -- Grand Hunter
	Ach(16545), -- The Best at What I Do
	Ach(16546), -- What's Down There?
	Ach(16547), -- Pulled!
	Ach(16548), -- It Takes a Tuskarr Buddy
	-- {16549}, -- Popular Around the Isles [Removed in 11.0.7, replaced by 41179]
	Ach(16550), -- Giving Back to Nature
	Ach(16551), -- Giving More Back to Nature
	Ach(16552), -- Giving Even More Back to Nature
	Ach(16553), -- Taking From Nature
	Ach(16556), -- Great Gourmand of The Ruby Feast
	Ach(16560), -- Wildlife Photographer
	Ach(16561), -- Lunkers, Lunkers Everywhere
	Ach(16562), -- That's not a Fish...
	Ach(16563), -- We're Going to Need a Bigger Harpoon
	Ach(16564), -- It Takes a Tuskarr Family
	Ach(16565), -- It Takes a Tuskarr Village
	Ach(16566), -- Great Shot!
	Ach(16567), -- A Lot of Great Shots!
	Ach(16568), -- Great Shots Galore!
	Ach(16569), -- Cobalt Enthusiast
	Ach(16570), -- A Legendary Album
	Ach(16571), -- Well Supplied
	Ach(16572), -- Legendary Photograph
	Ach(16573), -- Legendary Photographs
	Ach(16574), -- Sleeping on the Job
	Ach(16575), -- Waking Shores Glyph Hunter
	Ach(16576), -- Ohn'ahran Plains Glyph Hunter
	Ach(16577), -- Azure Span Glyph Hunter
	Ach(16578), -- Thaldraszus Glyph Hunter
	Ach(16580), -- Lend a Helping Span
	Ach(16581), -- Seeing Blue
	Ach(16583), -- Knew You Nokhud Do It!
	Ach(16584), -- Symbols of Hope
	Ach(16585), -- Loremaster of the Dragon Isles
	Ach(16587), -- Lead Climber
	Ach(16588), -- How Did These Get Here?
	Ach(16589):IsPvP(), -- Malicia's Challenge
	Ach(16590):IsPvP(), -- A Champion's Tour: Dragon Isles
	Ach(16591), -- The Gentleman Elemental
	Ach(16592):IsPvP(), -- Tour of Duty: The Waking Shores
	Ach(16593):IsPvP(), -- Tour of Duty: Thaldraszus
	Ach(16594):IsPvP(), -- Tour of Duty: The Azure Span
	Ach(16595):IsPvP(), -- Tour of Duty: Ohn'ahran Plains
	Ach(16599):IsPvP(), -- A Champion's Pursuit
	Ach(16600), -- Isles Ascender
	Ach(16601):Title():IsPvP(), -- Dragonfight Club
	Ach(16602), -- Nokhud Deed Goes Unnoticed
	Ach(16603):IsPvP(), -- Bounty Hunter
	Ach(16611):IsPvP(), -- Resource Scavanger
	Ach(16612):IsPvP(), -- Bounty Vigalante
	Ach(16613):IsPvP(), -- Finder's Keepers
	Ach(16614):IsPvP(), -- Bloodstained Bounty
	Ach(16615):IsPvP(), -- Blood Bank
	Ach(16616):IsPvP(), -- Prosperously Bloody
	Ach(16620), -- Ohuna Incubation
	Ach(16621), -- One of Everything, Please
	Ach(16622), -- Three Minutes or It's Free
	Ach(16623), -- Toe Tension
	Ach(16624), -- Which Knot Was It Again?
	Ach(16625), -- Belay On!
	Ach(16626), -- Working with Wyrms
	Ach(16627), -- Professional Draconic Master
	Ach(16630), -- Draconic Master of All
	Ach(16631), -- Dragon Isles Cook
	Ach(16632), -- Dragon Isles Fisherman
	Ach(16634), -- Framing a New Perspective
	Ach(16638), -- Ley Line in the Span
	Ach(16639):Teleport():PvE(10):PvE(12), -- Keystone Hero: Uldaman: Legacy of Tyr
	Ach(16640):Teleport():PvE(9):PvE(12), -- Keystone Hero: Ruby Life Pools
	Ach(16641):Teleport():PvE(9):PvE(12), -- Keystone Hero: The Nokhud Offensive
	Ach(16642):Teleport():PvE(10):PvE(12), -- Keystone Hero: Brackenhide Hollow
	Ach(16643):Teleport():PvE(9):PvE(12):PvE(17), -- Keystone Hero: Algeth'ar Academy
	Ach(16644):Teleport():PvE(10):PvE(12), -- Keystone Hero: Neltharus
	Ach(16645):Teleport():PvE(9):PvE(12), -- Keystone Hero: The Azure Vault
	Ach(16646):Teleport():PvE(10):PvE(12), -- Keystone Hero: Halls of Infusion
	Ach(16647):PvE(9), -- Dragonflight Keystone Explorer: Season One
	Ach(16648):Title():PvE(9), -- Dragonflight Keystone Conqueror: Season One
	Ach(16649):Mount():PvE(9), -- Dragonflight Keystone Master: Season One
	Ach(16650):PvE(9), -- Dragonflight Keystone Hero: Season One
	Ach(16658):Teleport():PvE(9), -- Keystone Hero: Court of Stars
	Ach(16659):Teleport():PvE(9), -- Keystone Hero: Halls of Valor
	Ach(16660):Teleport():PvE(9), -- Keystone Hero: Shadowmoon Burial Grounds
	Ach(16661):Teleport():PvE(9), -- Keystone Hero: Temple of the Jade Serpent
	Ach(16666), -- Dragon Glyphs: Gelikyr Overlook
	Ach(16667), -- Dragon Glyphs: Passage of Time
	Ach(16668), -- Dragon Glyphs: Skytop Observatory Rostrum
	Ach(16669), -- Dragon Glyphs: Flashfrost Enclave
	Ach(16670), -- Dragon Glyphs: Rubyscale Outpost
	Ach(16671), -- Dragon Glyphs: Mirewood Fen
	Ach(16672), -- Dragon Glyphs: Forkriver Crossing
	Ach(16673), -- Dragon Glyphs: The Fallen Course
	Ach(16676), -- Adventurer of The Waking Shores
	Ach(16677), -- Adventurer of the Ohn'ahran Plains
	Ach(16678), -- Adventurer of The Azure Span
	Ach(16679), -- Adventurer of Thaldraszus
	Ach(16683), -- In Tyr's Footsteps
}

KrowiAF.AchievementData2["10_00_02"] = {
	{KrowiAF.SetAchievementPatch, 10, 0, 2},
	Ach(15640), -- Return to Darkness
	Ach(16729), -- To All the Squirrels Hidden Til Now
	Ach(16730):PvP(34), -- Crimson Gladiator's Drake
	Ach(16731):Title(), -- Court is Now in Session
	Ach(16734):Title():PvP(34), -- Crimson Legend: Dragonflight Season 1
	Ach(16736), -- Grand Theft Mammoth
	Ach(16758), -- Ready, Aim, Catalog!
	Ach(16760):Title(), -- The Obsidian Bloodline
	Ach(16761), -- Dragon Isles Explorer
	Ach(16762):Toy(), -- The Vegetarian Diet
	Ach(16764):IsPvP(), -- Crimson Carpet Fashion
	Ach(16789), -- Lucky Penny
	Ach(16790), -- Curious Coin
	Ach(16791):Title(), -- Merchant Artisan
	Ach(16799):Title(), -- Personal Crafter
	Ach(16801):IsRealmFirst():Obtainable("Once"), -- Realm First! Dragonflight Keystone Hero
	Ach(16808), -- Friend of the Dragon Isles
	-- {16884}, -- Friends in the Field [Removed in 11.0.7, replaced by 41172]
	-- {16944}, -- Friend of the Family [Removed in 11.0.7, replaced by 41173]
	-- {16994}, -- Friends in the Accord [Removed in 11.0.7, replaced by 41171]
	-- {17064}, -- Friends in the Plains [Removed in 11.0.7, replaced by 41170]
	Ach(17107):PvE(9), -- Ahead of the Curve: Raszageth the Storm-Eater
	Ach(17108):PvE(9), -- Cutting Edge: Raszageth the Storm-Eater
	Ach(17110), -- The Primal Bulwark
	Ach(17111), -- Caverns of Infusion
	Ach(17112), -- Fury of the Storm
	Ach(17119):Transmog(), -- Deep Cuts From the Vault
	Ach(17314), -- Heroic Edition: Tangled Dreamweaver
	Ach(17339):Title():PvP(34), -- Legend: Dragonflight Season 1
}

KrowiAF.AchievementData2["10_00_05"] = {
	{KrowiAF.SetAchievementPatch, 10, 0, 5},
	Ach(16696), -- Renewed Proto-Drake Armor
	Ach(16697), -- Renewed Proto-Drake Head Features
	Ach(16698), -- Renewed Proto-Drake Tail Features
	Ach(16699), -- Renewed Proto-Drake Scales and Patterns
	Ach(16700), -- Renewed Proto-Drake Horns and Hair
	Ach(16701), -- Windborne Velocidrake Scales and Patterns
	Ach(16702), -- Windborne Velocidrake Armor
	Ach(16704), -- Windborne Velocidrake Horns and Fur
	Ach(16705), -- Windborne Velocidrake Head Features
	Ach(16706), -- Windborne Velocidrake Back and Tail
	Ach(16707), -- Highland Drake Scales and Patterns
	Ach(16708), -- Highland Drake Armor
	Ach(16710), -- Highland Drake Horns and Hair
	Ach(16711), -- Highland Drake Back and Tail
	Ach(16712), -- Highland Drake Head Features
	Ach(16723), -- Cliffside Wylderdrake Scales and Patterns
	Ach(16724), -- Cliffside Wylderdrake Armor
	Ach(16725), -- Cliffside Wylderdrake Horns and Manes
	Ach(16726), -- Cliffside Wylderdrake Back and Tail
	Ach(16727), -- Cliffside Wylderdrake Head Features
	Ach(17195), -- Waking Shores Reverse: Bronze
	Ach(17196), -- Waking Shores Reverse: Silver
	Ach(17197), -- Waking Shores Reverse: Gold
	Ach(17198), -- Ohn'ahran Plains Reverse: Bronze
	Ach(17199), -- Ohn'ahran Plains Reverse: Silver
	Ach(17200), -- Ohn'ahran Plains Reverse: Gold
	Ach(17201), -- Azure Span Reverse: Bronze
	Ach(17202), -- Azure Span Reverse: Silver
	Ach(17203), -- Azure Span Reverse: Gold
	Ach(17204), -- Thaldraszus Reverse: Bronze
	Ach(17205), -- Thaldraszus Reverse: Silver
	Ach(17206), -- Thaldraszus Reverse: Gold
	Ach(17207):Toy(), -- Discombobberlated
	Ach(17305):TradersTender(), -- Trading Post: Dragonflight
	Ach(17321):Obtainable("Event", 327), -- Elders of the Dragon Isles
	Ach(17330), -- Reverse Racer: Bronze
	Ach(17331), -- Reverse Racer: Silver
	Ach(17332):Title(), -- Reverse Racer: Gold
	Ach(17334):Transmog():TradersTender(), -- Trading Post Enthusiast
	Ach(17335):IsPvP(), -- Airborne Tumbler
	Ach(17336):IsPvP(), -- Airborne Tumbler
	Ach(17342), -- The Future We Make
	Ach(17343), -- Drop It Like It's Hot
	Ach(17345):Title():IsPvP(), -- Airborne Tumbler
}

KrowiAF.AchievementData2["10_00_07"] = {
	{KrowiAF.SetAchievementPatch, 10, 0, 7},
	Ach(17279), -- Forbidden Reach: Bronze
	Ach(17280), -- Forbidden Reach: Silver
	Ach(17281), -- Forbidden Reach: Gold
	Ach(17284), -- Forbidden Reach Advanced: Bronze
	Ach(17286), -- Forbidden Reach Advanced: Silver
	Ach(17287), -- Forbidden Reach Advanced: Gold
	Ach(17288), -- Forbidden Reach Reverse: Bronze
	Ach(17289), -- Forbidden Reach Reverse: Silver
	Ach(17290), -- Forbidden Reach Reverse: Gold
	Ach(17294), -- Forbidden Reach Racing Completionist
	Ach(17296), -- Forbidden Reach Racing Completionist: Silver
	Ach(17298):Title(), -- Forbidden Reach Racing Completionist: Gold
	Ach(17315), -- While We Were Sleeping
	Ach(17366):Other(), -- Relics of a Fallen Empire
	Ach(17367), -- Deadliest Cache
	Ach(17397), -- Door To Door
	Ach(17398), -- Dragon Glyphs: Winglord's Perch
	Ach(17399), -- Dragon Glyphs: Talon's Watch
	Ach(17400), -- Dragon Glyphs: Froststone Peak
	Ach(17401), -- Dragon Glyphs: Dragonskull Island
	Ach(17402), -- Dragon Glyphs: Stormsunder Mountain
	Ach(17403), -- Dragon Glyphs: The Frosted Spine
	Ach(17404), -- Dragon Glyphs: Talonlords' Perch
	Ach(17405), -- Dragon Glyphs: Caldera of the Menders
	Ach(17406), -- Battle on the Dragon Isles II
	Ach(17410):Obtainable("Never"), -- Craftsman of the Zandalar Tribe
	Ach(17411), -- Forbidden Reach Glyph Hunter
	Ach(17412):Obtainable("Never"), -- Craftsman of the Argent Dawn
	Ach(17413):Title(), -- Door Buster
	Ach(17426), -- Toolbox Trouble
	Ach(17427), -- Winterpelt Conversationalist
	Ach(17496):Obtainable("Never"), -- Renowned Weaponsmith
	Ach(17497):Obtainable("Never"), -- Renowned Armorsmith
	Ach(17498):Obtainable("Never"), -- Renowned Leatherworking Specialist
	Ach(17499):Obtainable("Never"), -- Renowned Tailoring Specialist
	Ach(17509), -- Every Door, Everywhere, All At Once
	Ach(17524), -- Adventurer of the Forbidden Reach
	Ach(17525), -- Champion of the Forbidden Reach
	Ach(17526), -- Treasures of the Forbidden Reach
	Ach(17527), -- Scavenger of the Forbidden Reach
	Ach(17528), -- Hoarder of the Forbidden Reach
	Ach(17529):HousingDecor(), -- Forbidden Spoils
	Ach(17530), -- Librarian of the Reach
	Ach(17531), -- X Marks the Spot
	Ach(17532), -- Scroll Hunter
	Ach(17534), -- Explore the Forbidden Reach
	Ach(17540), -- Under the Weather
	Ach(17541), -- Global Swarming
	Ach(17543):Title(), -- You Know How to Reach Me
	Ach(17546), -- A New Beginning
}

KrowiAF.AchievementData2["10_01_00"] = {
	{KrowiAF.SetAchievementPatch, 10, 1, 0},
	Ach(17483), -- Zaralek Cavern: Bronze
	Ach(17484):Mount(), -- Zaralek Cavern: Silver
	Ach(17485), -- Zaralek Cavern: Gold
	Ach(17486), -- Zaralek Cavern Advanced: Bronze
	Ach(17487):Mount(), -- Zaralek Cavern Advanced: Silver
	Ach(17488), -- Zaralek Cavern Advanced: Gold
	Ach(17489), -- Zaralek Cavern Reverse: Bronze
	Ach(17490), -- Zaralek Cavern Reverse: Silver
	Ach(17491), -- Zaralek Cavern Reverse: Gold
	Ach(17492), -- Zaralek Cavern Racing Completionist
	Ach(17493), -- Zaralek Cavern Racing Completionist: Silver
	Ach(17494):Title(), -- Zaralek Cavern Racing Completionist: Gold
	Ach(17506), -- Still Standing in the Fire
	Ach(17510), -- Dragon Glyphs: Glimmerogg
	Ach(17511), -- Dragon Glyphs: Nal ks'kol
	Ach(17512), -- Dragon Glyphs: Loamm
	Ach(17513), -- Dragon Glyphs: Zaqali Caldera
	Ach(17514), -- Dragon Glyphs: Slitherdrake Roost
	Ach(17515), -- Dragon Glyphs: The Throughway
	Ach(17516), -- Dragon Glyphs: Acidbite Ravine
	Ach(17517), -- Dragon Glyphs: Aberrus Approach
	Ach(17560), -- Ancient Stones of the Dragon Isles
	Ach(17561), -- Ancient Stones of the Waking Shores
	Ach(17562), -- Ancient Stones of the Ohn'ahran Plains
	Ach(17563), -- Ancient Stones of the Azure Span
	Ach(17564), -- Ancient Stones of Thaldraszus
	Ach(17567), -- Ancient Stones of Zaralek
	Ach(17734):Title(), -- Active Listening Skills
	Ach(17735), -- We Didn't Start the Fire
	Ach(17736):Pet(), -- The Gift of Cheese
	Ach(17737):FactionSplit(faction.Alliance, nil):Obtainable("Event", 341), -- Flame Warden of the Dragon Isles
	Ach(17738):FactionSplit(faction.Horde, nil):Obtainable("Event", 341), -- Flame Keeper of the Dragon Isles
	Ach(17739), -- Embers of Neltharion
	Ach(17740):Title():Mount():Transmog():PvP(35), -- Gladiator: Dragonflight Season 2
	Ach(17741):Pet(), -- Slow and Steady Wins the Race
	-- {17756}, -- Friends in Loamm Places [Removed in 11.0.7, replaced by 41175]
	-- {17763}, -- There's No Place Like Loamm [Removed in 11.0.7, replaced by 41183]
	Ach(17764):Title():PvP(35), -- Obsidian Gladiator: Dragonflight Season 2
	Ach(17765), -- What We Wear In The Shadowflame
	Ach(17766), -- Explore Zaralek Cavern
	Ach(17767):Title():PvP(35), -- Obsidian Legend: Dragonflight Season 2
	Ach(17768):AutoFactionSplit(faction.Alliance, 17772):PvP(35), -- Hero of the Alliance / Horde: Obsidian
	Ach(17778):PvP(35), -- Obsidian Gladiator's Slitherdrake
	Ach(17779), -- A Serpentine Discovery
	Ach(17781), -- The Smell of Money
	Ach(17783), -- Adventurer of Zaralek Cavern
	Ach(17785):Mount(), -- Que Zara(lek), Zara(lek)
	Ach(17786), -- Treasures of Zaralek Cavern
	Ach(17794):Title():PvP(35), -- Duelist: Dragonflight Season 2
	Ach(17795):Title():PvP(35), -- Rival I: Dragonflight Season 2
	Ach(17796):PvP(35), -- Rival II: Dragonflight Season 2
	Ach(17797):Title():PvP(35), -- Challenger I: Dragonflight Season 2
	Ach(17798):PvP(35), -- Challenger II: Dragonflight Season 2
	Ach(17799):Title():PvP(35), -- Combatant I: Dragonflight Season 2
	Ach(17800):PvP(35), -- Combatant II: Dragonflight Season 2
	Ach(17801):Title():PvP(35), -- Legend: Dragonflight Season 2
	Ach(17830), -- Stones Can't Fly!
	Ach(17831):Title():PvP(35), -- Elite: Dragonflight Season 2
	Ach(17832), -- Sniffen Around
	Ach(17833), -- Sniffen Sage
	Ach(17841):Title(), -- Pyramid Scheme
	Ach(17842):PvE(10), -- Dragonflight Keystone Explorer: Season Two
	Ach(17843):Title():PvE(10), -- Dragonflight Keystone Conqueror: Season Two
	Ach(17844):Mount():PvE(10), -- Dragonflight Keystone Master: Season Two
	Ach(17845):PvE(10), -- Dragonflight Keystone Hero: Season Two
	Ach(17846):Title():PvE(10), -- Smoldering Hero: Dragonflight Season 2
	Ach(17847):Teleport():PvE(10), -- Keystone Hero: The Vortex Pinnacle
	Ach(17848):Teleport():PvE(10), -- Keystone Hero: Freehold
	Ach(17849):Teleport():PvE(10), -- Keystone Hero: The Underrot
	Ach(17850):Teleport():PvE(10), -- Keystone Hero: Neltharion's Lair
	Ach(17851):IsPvP(), -- Tour of Duty: Zaralek Cavern
	Ach(17852):IsPvP(), -- Elemental Conjuror
	Ach(17877), -- We'll Never See That Again, Surely
	Ach(17878), -- Me Want Bite
	Ach(17879), -- Zaralek Cavern Safari
	Ach(17880), -- Battle in Zaralek Cavern
	Ach(17881), -- Aquatic Battler of Zaralek Cavern
	Ach(17882), -- Beast Battler of Zaralek Cavern
	Ach(17883), -- Critter Battler of Zaralek Cavern
	Ach(17890), -- Dragonkin Battler of Zaralek Cavern
	Ach(17904), -- Elemental Battler of Zaralek Cavern
	Ach(17905), -- Flying Battler of Zaralek Cavern
	Ach(17915), -- Humanoid Battler of Zaralek Cavern
	Ach(17916), -- Magic Battler of Zaralek Cavern
	Ach(17917), -- Mechanical Battler of Zaralek Cavern
	Ach(17918), -- Undead Battler of Zaralek Cavern
	Ach(17934):Pet(), -- Family Battler of Zaralek Cavern
	Ach(17977), -- Stones Can Try To Fly!
	Ach(17978), -- Stones Can Fly!
	Ach(18027):Other():Obtainable("PvP Season", 35):Obtainable("PvE Season", 10), -- Dragonflight Season 2 Master
	Ach(18100):Toy(), -- Cavern Clawbbering
	Ach(18149), -- Objects in Transit May Shatter
	Ach(18150), -- Zaralek Cavern Glyph Hunter
	Ach(18151), -- Mythic: Kazzara, the Hellforged
	Ach(18152), -- Mythic: The Amalgamation Chamber
	Ach(18153), -- Mythic: The Forgotten Experiments
	Ach(18154), -- Mythic: Assault of the Zaqali
	Ach(18155), -- Mythic: Rashok, the Elder
	Ach(18156), -- Mythic: The Vigilant Steward, Zskarn
	Ach(18157), -- Mythic: Magmorax
	Ach(18158), -- Mythic: Echo of Neltharion
	Ach(18159):Title(), -- Mythic: Scalecommander Sarkareth
	Ach(18160), -- Aberrus, the Shadowed Crucible
	Ach(18161), -- Heroic: Aberrus, the Shadowed Crucible
	Ach(18162), -- Mythic: Aberrus, the Shadowed Crucible
	Ach(18163), -- Discarded Works
	Ach(18164), -- Fury of Giants
	Ach(18165), -- Neltharion's Shadow
	Ach(18167), -- Edge of the Void
	Ach(18168), -- I'll Make My Own Shadowflame
	Ach(18172), -- Escar-Go-Go-Go
	Ach(18173), -- Tabula Rasa
	Ach(18174), -- Contaminant Cleaner
	Ach(18193), -- Eggscellent Eggsecution
	Ach(18199), -- Zaqali Ritual Buster
	Ach(18200):Title(), -- Cooling the Research Field
	Ach(18201), -- Lockdown Mystery
	Ach(18202), -- Rockin Research
	Ach(18203), -- A Research Sampler
	Ach(18204), -- Research Mishap
	Ach(18205), -- A Pillar of the Research Community
	Ach(18206), -- A Djaradin Puzzle
	Ach(18207), -- Hot Research Zone
	Ach(18208), -- The Small Disruptions
	Ach(18209), -- Nothing Stops the Research
	Ach(18228), -- Are You Even Trying?
	Ach(18229), -- Cosplate
	Ach(18230), -- Whac-A-Swog
	Ach(18249):IsPvP(), -- Obsidian Tie Event
	Ach(18251):Mount(), -- Glory of the Aberrus Raider
	Ach(18253):PvE(10), -- Ahead of the Curve: Scalecommander Sarkareth
	Ach(18254):PvE(10), -- Cutting Edge: Scalecommander Sarkareth
	Ach(18255), -- Proof of Myrrit
	Ach(18256), -- Nasz'uro, the Unbound Legacy
	Ach(18257), -- Can You Dig It?
	Ach(18258), -- Little Lord of Lies
	Ach(18271), -- He'sSss All Mine
	Ach(18284):Title(), -- A Niffen's Best Buddy
	Ach(18361), -- To All the Squirrels Burrowed Beneath
	Ach(18380):Transmog(), -- Dragonflight Season 2 Hero
	Ach(18542):PvE(10), -- Dragonflight Keystone Master: Season Two
}

KrowiAF.AchievementData2["10_01_05"] = {
	{KrowiAF.SetAchievementPatch, 10, 1, 5},
	Ach(17712):Obtainable("Event", 1395), -- Kalimdor: Bronze
	Ach(17713):Obtainable("Event", 1395), -- Kalimdor: Silver
	Ach(17714):Obtainable("Event", 1395), -- Kalimdor: Gold
	Ach(17715):Obtainable("Event", 1395), -- Kalimdor Advanced: Bronze
	Ach(17716):Obtainable("Event", 1395), -- Kalimdor Advanced: Silver
	Ach(17717):Obtainable("Event", 1395), -- Kalimdor Advanced: Gold
	Ach(17718):Obtainable("Event", 1395), -- Kalimdor Reverse: Bronze
	Ach(17719):Obtainable("Event", 1395), -- Kalimdor Reverse: Silver
	Ach(17720):Obtainable("Event", 1395), -- Kalimdor Reverse: Gold
	Ach(17721):Obtainable("Event", 1395), -- Kalimdor Racing Completionist
	Ach(17722):Obtainable("Event", 1395), -- Kalimdor Racing Completionist: Silver
	Ach(17723):Title():Obtainable("Event", 1395), -- Kalimdor Racing Completionist: Gold
	Ach(17782):Toy(), -- Daycare Derby
	Ach(18360):Obtainable("Event", 324), -- Tricks and Treats of the Dragon Isles
	Ach(18368):Other(), -- Memory of Scholomance
	Ach(18372):Other(), -- Wards of the Dread Citadel
	Ach(18383):Title(), -- Hey Nanny Nanny
	Ach(18384):Pet(), -- Whelp, There It Is
	Ach(18471), -- 110 Exalted Reputations
	Ach(18539), -- Back En-masse
	Ach(18554):Toy(), -- Temporal Acquisitions Specialist
	Ach(18556), -- Chaotic Time
	Ach(18557), -- Never Bothered, Anyway
	Ach(18558), -- Leaders of Scholomance
	Ach(18559):Toy(), -- Many Boxes, Many Rockses
	Ach(18566):Obtainable("Event", 1400), -- Eastern Kingdoms: Bronze
	Ach(18567):Obtainable("Event", 1400), -- Eastern Kingdoms: Silver
	Ach(18568):Obtainable("Event", 1400), -- Eastern Kingdoms: Gold
	Ach(18569):Obtainable("Event", 1400), -- Eastern Kingdoms Advanced: Bronze
	Ach(18570):Obtainable("Event", 1400), -- Eastern Kingdoms Advanced: Silver
	Ach(18571):Obtainable("Event", 1400), -- Eastern Kingdoms Advanced: Gold
	Ach(18572):Obtainable("Event", 1400), -- Eastern Kingdoms Reverse: Bronze
	Ach(18573):Obtainable("Event", 1400), -- Eastern Kingdoms Reverse: Silver
	Ach(18574):Obtainable("Event", 1400), -- Eastern Kingdoms Reverse: Gold
	Ach(18589), -- Crunch Time
	Ach(18612), -- A Slime in Need
	Ach(18615), -- Legend of the Multiverse
	Ach(18616), -- Putting Wilhelm Out of Business
	Ach(18635), -- Verified Rifter
	Ach(18636), -- Just Following Chronological Orders
	Ach(18637), -- Chronograde Connoisseur
	Ach(18638), -- Minute Menagerie
	Ach(18639), -- Collapsed Reality
	Ach(18640), -- Lock and Load
	Ach(18641), -- To All The Squirrels I've BEEN Before
	Ach(18642):Title(), -- The Inquisitive
	Ach(18643):Transmog(), -- Community Rumors
	Ach(18644):Pet(), -- Community Rumor Mill
	Ach(18645):Transmog(), -- Tools of the Trade
	Ach(18646):Title():Mount(), -- Whodunnit?
	Ach(18703), -- Dawn of the Infinite: Galakrond's Fall
	Ach(18704), -- Dawn of the Infinite: Murozond's Rise
	Ach(18705):Title():Obtainable("Before", "Version", {10, 2, 0}), -- Defender of the Timeways
	Ach(18706):Transmog(), -- Put That Thing Back Where It Came From
	Ach(18976):Obtainable("Before", "Version", {11, 0, 0}), -- Draconically Superior
	Ach(18977):Obtainable("Before", "Version", {11, 0, 0}), -- Draconically Epic
}

KrowiAF.AchievementData2["10_01_07"] = {
	{KrowiAF.SetAchievementPatch, 10, 1, 7},
	Ach(15344), -- "S.A.F.E"" Pilot"
	Ach(17344), -- Warcraft Rumble Minis, Get 'Em All!
	Ach(17346), -- Warcraft Rumble Minis, Maiev's New Look
	Ach(17347), -- Warcraft Rumble Minis, Sneed's New Look
	Ach(17348), -- Warcraft Rumble Minis, Huntress' New Look
	Ach(17349), -- Warcraft Rumble Minis, Tauren's New Look
	Ach(17350), -- Warcraft Rumble Minis, Ghoul's New Look
	Ach(17351), -- Warcraft Rumble Minis, Murloc's New Look
	Ach(17352), -- Warcraft Rumble Minis, Whelp Egg's New Look
	Ach(17353), -- Warcraft Rumble Minis, Maiev's Newer Look
	Ach(17354), -- Warcraft Rumble Minis, Sneed's Newer Look
	Ach(17355), -- Warcraft Rumble Minis, Huntress' Newer Look
	Ach(17356), -- Warcraft Rumble Minis, Tauren's Newer Look
	Ach(17357), -- Warcraft Rumble Minis, Ghoul's Newer Look
	Ach(17358), -- Warcraft Rumble Minis, Murloc's Newer Look
	Ach(17359), -- Warcraft Rumble Minis, Whelp Egg's Newer Look
	Ach(17360), -- Warcraft Rumble Minis, New Looks!
	Ach(17361), -- Rumble Minis, All the Looks!
	Ach(17547):Obtainable("Event", 324), -- The Lick King
	Ach(17773):HousingDecor(), -- A Blue Dawn
	Ach(18250), -- Ysergle The Dreamurk
	Ach(18579):Obtainable("Event", 372), -- A Round on the House
	Ach(18702):Obtainable("From", "Date", {2023, 11, 11}, "Until", "Date", {2023, 12, 7}), -- WoW's 19th Anniversary
	Ach(18719), -- Cataclysmic Master of All
	Ach(18720), -- Classic Master of All
	Ach(18721), -- Outland Master of All
	Ach(18722), -- Northrend Master of All
	Ach(18723), -- Look, You're Specialized!
	Ach(18724), -- Gaining an Advantus
	Ach(18725):Toy(), -- Best Stellar
	Ach(18726), -- A Cure for All Ails I
	Ach(18727), -- Rave Leader
	Ach(18728), -- Working from the Start
	Ach(18729), -- Working in Hellfire
	Ach(18730), -- Goblins vs Gnomes
	Ach(18731), -- A Cure for All Ails II
	Ach(18732), -- A Cure for All Ails III
	Ach(18733), -- A Cure for All Ails IV
	Ach(18734), -- Powerful Concoctions I
	Ach(18735), -- Powerful Concoctions II
	Ach(18736), -- Powerful Concoctions III
	Ach(18737), -- Powerful Concoctions IV
	Ach(18738), -- Population In-Crease
	Ach(18748), -- Waking Shores Challenge: Bronze
	Ach(18749), -- Waking Shores Challenge: Silver
	Ach(18750), -- Waking Shores Challenge: Gold
	Ach(18754), -- Ohn'ahran Plains Challenge: Bronze
	Ach(18755), -- Ohn'ahran Plains Challenge: Silver
	Ach(18756), -- Ohn'ahran Plains Challenge: Gold
	Ach(18757), -- Azure Span Challenge: Bronze
	Ach(18758), -- Azure Span Challenge: Silver
	Ach(18759), -- Azure Span Challenge: Gold
	Ach(18760), -- Thaldraszus Challenge: Bronze
	Ach(18761), -- Thaldraszus Challenge: Silver
	Ach(18762), -- Thaldraszus Challenge: Gold
	Ach(18763), -- Spectre of Spectacles
	Ach(18764), -- Break Upon Your Body
	Ach(18765), -- Destined to be Legendary
	Ach(18766), -- Disenchantment I
	Ach(18767), -- Disenchantment II
	Ach(18768), -- Disenchantment III
	Ach(18769), -- Disenchantment IV
	Ach(18770), -- Silas' Sphere of Transmutation
	Ach(18771), -- Khaz'gorian Smithing Hammer
	Ach(18772), -- Sanguine Feather Quill of Lana'thel
	Ach(18773), -- Jewelhammer's Focus
	Ach(18774), -- Synchronous Thread
	Ach(18775), -- Iwen's Enchanting Rod
	Ach(18776), -- The Ub3r-Spanner
	Ach(18777), -- Mallet of Thunderous Skins
	Ach(18778), -- Massive Toolshed
	Ach(18779), -- Forbidden Reach Challenge: Bronze
	Ach(18780), -- Forbidden Reach Challenge: Silver
	Ach(18781), -- Forbidden Reach Challenge: Gold
	Ach(18785), -- Shattered Expectations
	Ach(18786), -- Zaralek Cavern Challenge: Bronze
	Ach(18787), -- Zaralek Cavern Challenge: Silver
	Ach(18788), -- Zaralek Cavern Challenge: Gold
	Ach(18789), -- Simply Enchanting
	Ach(18790):Toy(), -- Dragonriding Challenge: Dragon Isles: Bronze
	Ach(18791), -- Dragonriding Challenge: Dragon Isles: Silver
	Ach(18792):Title(), -- Dragonriding Challenge: Dragon Isles: Gold
	Ach(18793), -- Always Be Camping
	Ach(18804):Transmog(), -- Neltharion's Legacy
	Ach(18805), -- Draconic Phial Cabinet
	Ach(18815), -- Speed Dreamin'
	Ach(18816), -- Serious Chef
	Ach(18817), -- Showoff Chef
	Ach(18818), -- Geologist's Ledger - Serevite
	Ach(18819), -- Geologist's Ledger - Draconium
	Ach(18820), -- Geologist's Ledger: Dragon Isles
	Ach(18821), -- Geologist's Ledger - Overloaded Elements
	Ach(18822), -- Botanist's Log - Hochenblume
	Ach(18823), -- Botanist's Log - Saxifrage
	Ach(18824), -- Botanist's Log - Bubble Poppy
	Ach(18825), -- Botanist's Log - Writhebark
	Ach(18828), -- Botanist's Log: Dragon Isles
	Ach(18829), -- Botanist's Log - Overloaded Elements
	Ach(18831), -- Elusive Beasts of the Dragon Isles
	Ach(18832), -- Elusive Legend of the Dragon Isles
	Ach(18833), -- Elusive Legends of the Dragon Isles
	Ach(18834), -- Broken Isles Skinning Techniques
	Ach(18835), -- Fourth War Skinning Techniques
	Ach(18837), -- Broken Isles Herbalism Techniques
	Ach(18838), -- Fourth War Herbalism Techniques
	Ach(18839), -- Broken Isles Mining Techniques
	Ach(18840), -- Fourth War Mining Techniques
	Ach(18841), -- Doing Your Share
	Ach(18851), -- Skeletons in the Lockbox
	Ach(18852), -- Weaponsmithing, Reborn
	Ach(18853), -- Seething Flames of Hatred
	Ach(18854):Other(), -- Seeing Red
	Ach(18855), -- Portal to Everywhere
	Ach(18856), -- Just an Ordinary Gas Cloud
	Ach(18857), -- That's No Ordinary Gas Cloud!
	Ach(18858):AutoFactionSplit(faction.Horde, 18859), -- Forge and Befuddle
	Ach(18862), -- Anvil Mastery I
	Ach(18864), -- Anvil Mastery II
	Ach(18865), -- Anvil Mastery III
	Ach(18866), -- Anvil Mastery IV
	Ach(18867), -- Through the Ashes and Flames
	Ach(18868), -- Enchantment I
	Ach(18869), -- Enchantment II
	Ach(18870), -- Enchantment III
	Ach(18871), -- Enchantment IV
	Ach(18872), -- Dangerous Devices I
	Ach(18873), -- Dangerous Devices II
	Ach(18874), -- Dangerous Devices III
	Ach(18875), -- Dangerous Devices IV
	Ach(18876), -- Ink and Quill I
	Ach(18877), -- Ink and Quill II
	Ach(18878), -- Ink and Quill III
	Ach(18879), -- Ink and Quill IV
	Ach(18880), -- Generations of Gemstones I
	Ach(18881), -- A Test of Scale I
	Ach(18882), -- A Test of Scale II
	Ach(18883), -- A Test of Scale III
	Ach(18884), -- A Test of Scale IV
	Ach(18885), -- Quite the Quilt I
	Ach(18886), -- Quite the Quilt II
	Ach(18887), -- Quite the Quilt III
	Ach(18888), -- Quite the Quilt IV
	Ach(18889), -- Generations of Gemstones II
	Ach(18890), -- Generations of Gemstones III
	Ach(18891), -- Generations of Gemstones IV
	Ach(18892), -- Massive Mills
	Ach(18893), -- Plentiful Prospects
	Ach(18894), -- Free Stylin'
	Ach(18895), -- You Had it Coming
	Ach(18896), -- United as Three
	Ach(18897), -- Can't Crush These
	Ach(18898), -- That's Just Cruel
	Ach(18899), -- You Saw Nothing
	Ach(18900), -- Budget Bard
	Ach(18901):Transmog(), -- Chromatic Calibration: Holo-Gogs
	Ach(18902), -- Uncertified Nurse
	Ach(18903), -- Ton of Tops
	Ach(18904), -- Iron to Vendor Gold
	Ach(18905):Transmog(), -- Chromatic Calibration: Retinal Armor
	Ach(18906):Transmog(), -- Chromatic Calibration: Cranial Cannons
	Ach(18907):Transmog(), -- Chromatic Calibration: Ectoplasmic Specs
	Ach(18908):Transmog(), -- Chromatic Calibration: Bio-Optic Killshades
	Ach(18909), -- Fantastic Figurines
	Ach(18928), -- Storm Rider: Bronze
	Ach(18929), -- Storm Rider: Silver
	Ach(18931):Title(), -- Storm Rider: Gold
	Ach(18934), -- Excessive Experimentation
	Ach(18939):Obtainable("Event", 1400), -- Eastern Kingdoms Racing Completionist
	Ach(18940):Obtainable("Event", 1400), -- Eastern Kingdoms Racing Completionist: Silver
	Ach(18941), -- Dazzling Dragons
	Ach(18942):Title():Obtainable("Event", 1400), -- Eastern Kingdoms Racing Completionist: Gold
	Ach(18959):Obtainable("Event", 324), -- Don't Lose Your Head, Man
	Ach(18960):Obtainable("Event", 324), -- Kickin' With the Wick
	Ach(18962):Obtainable("Event", 324), -- A Cleansing Fire
	Ach(18963), -- Burst Damage
	Ach(19008), -- Dream Shaper
	Ach(19027), -- Heroic Edition: Algarian Stormrider
	Ach(19029), -- Lil' Maggz
	Ach(19030), -- Squally
	Ach(19079):Mount():Obtainable("Event", 1425, false), -- Master of the Turbulent Timeways
	Ach(19080):Obtainable("From", "Date", {2023, 9, 10}, "Until", "Date", {2023, 9, 14}), -- Arcane Influence
	Ach(19092):Obtainable("Event", 1407), -- Outland: Bronze
	Ach(19097):Obtainable("Event", 1407), -- Outland: Silver
	Ach(19098):Obtainable("Event", 1407), -- Outland: Gold
	Ach(19099):Obtainable("Event", 1407), -- Outland Advanced: Bronze
	Ach(19100):Obtainable("Event", 1407), -- Outland Advanced: Silver
	Ach(19101):Obtainable("Event", 1407), -- Outland Advanced: Gold
	Ach(19102):Obtainable("Event", 1407), -- Outland Reverse: Bronze
	Ach(19103):Obtainable("Event", 1407), -- Outland Reverse: Silver
	Ach(19104):Obtainable("Event", 1407), -- Outland Reverse: Gold
	Ach(19105):Obtainable("Event", 1407), -- Outland Racing Completionist
	Ach(19106):Obtainable("Event", 1407), -- Outland Racing Completionist: Silver
	Ach(19107):Title():Tabard():Obtainable("Event", 1407), -- Outland Racing Completionist: Gold
	Ach(19192), -- Lil' Frostwing
}

KrowiAF.AchievementData2["10_02_00"] = {
	{KrowiAF.SetAchievementPatch, 10, 2, 0},
	Ach(18958):Title(), -- Of the Tyr's Guard
	Ach(19009):PvE(11), -- Dragonflight Keystone Explorer: Season Three
	Ach(19010):Title():PvE(11), -- Dragonflight Keystone Conqueror: Season Three
	Ach(19011):Mount():PvE(11), -- Dragonflight Keystone Master: Season Three
	Ach(19012):PvE(11), -- Dragonflight Keystone Hero: Season Three
	Ach(19013), -- I Dream of Seeds
	Ach(19026), -- Defenders of the Dream
	Ach(19031), -- Fyrn
	Ach(19077), -- Catch Me If You Can!
	Ach(19082):Teleport():PvE(11), -- Keystone Hero: Throne of the Tides
	Ach(19083):Teleport():PvE(11), -- Keystone Hero: The Everbloom
	Ach(19084):Teleport():PvE(11), -- Keystone Hero: Black Rook Hold
	Ach(19085):Teleport():PvE(11), -- Keystone Hero: Darkheart Thicket
	Ach(19086):Teleport():PvE(11), -- Keystone Hero: Waycrest Manor
	Ach(19087):Teleport():PvE(11), -- Keystone Hero: Atal'Dazar
	Ach(19088):Teleport():PvE(11), -- Keystone Hero: Dawn of the Infinite
	Ach(19089):Pet(), -- Don't Let the Doe Hit You On The Way Out
	Ach(19090):Title():PvP(36), -- Elite: Dragonflight Season 3
	Ach(19091):Title():Mount():Transmog():PvP(36), -- Gladiator: Dragonflight Season 3
	Ach(19109), -- Emerald Dream: Bronze
	Ach(19110), -- Emerald Dream: Silver
	Ach(19111), -- Emerald Dream: Gold
	Ach(19112), -- Emerald Dream Advanced: Bronze
	Ach(19113), -- Emerald Dream Advanced: Silver
	Ach(19114), -- Emerald Dream Advanced: Gold
	Ach(19115), -- Emerald Dream Reverse: Bronze
	Ach(19116), -- Emerald Dream Reverse: Silver
	Ach(19117), -- Emerald Dream Reverse: Gold
	Ach(19118), -- Emerald Dream Racing Completionist
	Ach(19119), -- Emerald Dream Racing Completionist: Silver
	Ach(19120):Title(), -- Emerald Dream Racing Completionist: Gold
	Ach(19121), -- Emerald Dream Challenge: Bronze
	Ach(19122), -- Emerald Dream Challenge: Silver
	Ach(19123), -- Emerald Dream Challenge: Gold
	Ach(19124), -- Emerald Dream Reverse Challenge: Bronze
	Ach(19125), -- Emerald Dream Reverse Challenge: Silver
	Ach(19126), -- Emerald Dream Reverse Challenge: Gold
	Ach(19127), -- Emerald Dream Challenge Racing Completionist
	Ach(19128), -- Emerald Dream Challenge Racing Completionist: Silver
	Ach(19129):Title(), -- Emerald Dream Challenge Racing Completionist: Gold
	Ach(19130), -- Junior Racing Champion
	Ach(19131):Title():PvP(36), -- Verdant Legend: Dragonflight Season 3
	Ach(19132):Title():PvP(36), -- Verdant Gladiator: Dragonflight Season 3
	Ach(19133):Title():PvP(36), -- Rival I: Dragonflight Season 3
	Ach(19155):PvP(36), -- Rival II: Dragonflight Season 3
	Ach(19156):Title():PvP(36), -- Duelist: Dragonflight Season 3
	Ach(19157):Title():PvP(36), -- Combatant I: Dragonflight Season 3
	Ach(19158):PvP(36), -- Combatant II: Dragonflight Season 3
	Ach(19159):Title():PvP(36), -- Challenger I: Dragonflight Season 3
	Ach(19160):PvP(36), -- Challenger II: Dragonflight Season 3
	Ach(19161):AutoFactionSplit(faction.Horde, 19162):PvP(36), -- Hero of the Horde / Alliance: Verdant
	Ach(19193), -- Ducks In A Row
	Ach(19194), -- The Emerald Bounty
	Ach(19196), -- Sowing the Seeds
	Ach(19198):Title(), -- The Seeds I Sow
	-- {19230}, -- Friends in the Dream [Removed in 11.0.7, replaced by 41176]
	-- {19235}, -- Warden of the Dream [Removed in 11.0.7, replaced by 41177]
	Ach(19276):IsPvP(), -- Verdant Vogue
	Ach(19293):Pet(), -- Friends In Feathers
	Ach(19294), -- Tour of Duty: Emerald Dream
	Ach(19295):PvP(36), -- Verdant Gladiator's Slitherdrake
	Ach(19296), -- Dragon Glyphs: Eye of Ysera
	Ach(19297), -- Dragon Glyphs: Furnace Coil
	Ach(19298), -- Dragon Glyphs: Smoldering Copse
	Ach(19299), -- Dragon Glyphs: Cinder Summit
	Ach(19300), -- Dragon Glyphs: Dreamsurge Basin
	Ach(19301), -- Dragon Glyphs: Amirdrassil
	Ach(19302), -- Dragon Glyphs: Whorlwing Basin
	Ach(19303), -- Dragon Glyphs: Wakeful Vista
	Ach(19304):Title():Toy():PvP(36), -- Legend: Dragonflight Season 3
	Ach(19306), -- Emerald Dream Glyph Hunter
	Ach(19307), -- Dragon Isles Pathfinder
	-- {19308}, -- Freshscales Fifteen [Removed in 11.0.7, replaced by 41184]
	Ach(19309), -- Explore the Emerald Dream
	Ach(19310), -- Fruit of the Bloom
	Ach(19312), -- Super Duper Bloom
	Ach(19313), -- Bloom Man Group
	Ach(19315), -- Dream Chaser
	Ach(19316), -- Adventurer of the Emerald Dream
	Ach(19317):Transmog(), -- Treasures of the Emerald Dream
	Ach(19318):Title(), -- Dream On
	Ach(19319), -- Haven't We Done This Before?
	Ach(19320), -- Cruelty Free
	Ach(19321), -- Swog Champion
	Ach(19322), -- Meaner Pastures
	Ach(19326):Other():PvE(11), -- Dreaming of Drakes
	Ach(19331), -- Amirdrassil, the Dream's Hope
	Ach(19333), -- Heroic: Amirdrassil, the Dream's Hope
	Ach(19334), -- Mythic: Amirdrassil, the Dream's Hope
	Ach(19335), -- Mythic: Gnarlroot
	Ach(19336), -- Mythic: Igira the Cruel
	Ach(19337), -- Mythic: Volcoross
	Ach(19338), -- Mythic: Council of Dreams
	Ach(19339), -- Mythic: Larodar, Keeper of the Flame
	Ach(19340), -- Mythic: Nymue, Weaver of the Cycle
	Ach(19341), -- Mythic: Smolderon
	Ach(19342), -- Mythic: Tindral Sageswift, Seer of the Flame
	Ach(19343):Title(), -- Mythic: Fyrakk the Blazing
	Ach(19344), -- Incarnate's Wake
	Ach(19345), -- Molten Incursion
	Ach(19346), -- The Viridian Weave
	Ach(19347), -- Fate of Amirdrassil
	Ach(19349):Mount(), -- Glory of the Dream Raider
	Ach(19350):PvE(11), -- Ahead of the Curve: Fyrakk the Blazing
	Ach(19351):PvE(11), -- Cutting Edge: Fyrakk the Blazing
	Ach(19390), -- Memories of Teldrassil
	Ach(19393), -- Whelp, I'm Lost
	Ach(19394), -- A Dream Within a Dream
	Ach(19396):Transmog():Obtainable("PvP Season", 36):Obtainable("PvE Season", 11), -- Dragonflight Season 3 Master
	Ach(19397):Other():PvE(11), -- Dreaming of Wyrms
	Ach(19398):Other():PvE(11), -- Dreaming of the Aspects
	Ach(19401), -- Emerald Dream Safari
	Ach(19411):IsPvP(), -- Battleground Blitz Novice
	Ach(19412):IsPvP(), -- Battleground Blitz Apprentice
	Ach(19413):IsPvP(), -- Battleground Blitz Veteran
	Ach(19416):IsPvP(), -- Learning the Ropes
	Ach(19417):IsPvP(), -- Brawlroom Blitzer
	Ach(19418):IsPvP(), -- Battle-scarred Battler
	Ach(19420):Transmog(), -- Dragonflight Season 3 Hero
	Ach(19442), -- Fire Catwalk With Me
	Ach(19443):PvP(36), -- Battle Mender: Dragonflight Season 3
	Ach(19449):Title():PvE(11), -- Dreaming Hero: Dragonflight Season 3
	Ach(19450), -- Fyr'alath the Dreamrender
	Ach(19461), -- Kissed by the Wind
}

KrowiAF.AchievementData2["10_02_05"] = {
	{KrowiAF.SetAchievementPatch, 10, 2, 5},
	Ach(19400):Obtainable("Event", 423), -- Support Your Local Artisans
	Ach(19508):Obtainable("Event", 423), -- Love Language Expert
	Ach(19674):Obtainable("Event", 1429), -- Northrend: Bronze
	Ach(19675):Obtainable("Event", 1429), -- Northrend: Silver
	Ach(19676):Obtainable("Event", 1429), -- Northrend: Gold
	Ach(19677):Obtainable("Event", 1429), -- Northrend Advanced: Bronze
	Ach(19679):Obtainable("Event", 1429), -- Northrend Advanced: Silver
	Ach(19681):Obtainable("Event", 1429), -- Northrend Advanced: Gold
	Ach(19682):Obtainable("Event", 1429), -- Northrend Reverse: Bronze
	Ach(19683):Obtainable("Event", 1429), -- Northrend Reverse: Silver
	Ach(19684):Obtainable("Event", 1429), -- Northrend Reverse: Gold
	Ach(19685), -- Tenured Archivist
	Ach(19719):HousingDecor(), -- Reclamation of Gilneas
	Ach(19721):Obtainable("Event", 1429), -- Northrend Racing Completionist
	Ach(19722):Obtainable("Event", 1429), -- Northrend Racing Completionist: Silver
	Ach(19723):Title():Tabard():Obtainable("Event", 1429), -- Northrend Racing Completionist: Gold
	Ach(19724), -- Hearthstone Card Collection
	Ach(19786), -- When a Rock is Just a Rock
	Ach(19787), -- Clued In
	Ach(19788), -- Tome Comber
	Ach(19789), -- Relic Rescuer
	Ach(19790):Title(), -- The Archives Called, You Answered
	Ach(19791), -- Goggle Wobble
	Ach(19792):Pet(), -- Just One More Thing
	Ach(19793):Pet(), -- Finally At Rest
	Ach(19866), -- Hearthstoned: Fiery Edition
	Ach(20033):Toy(), -- Hearthstone Beginner
	Ach(20206):Title(), -- Champion of the Dragonflights
}

KrowiAF.AchievementData2["10_02_06"] = {
	{KrowiAF.SetAchievementPatch, 10, 2, 6},
	Ach(19453):Title():PvP(37), -- Draconic Legend: Dragonflight Season 4
	Ach(19454):Title():PvP(37), -- Draconic Gladiator: Dragonflight Season 4
	Ach(19455):AutoFactionSplit(faction.Alliance, 19456):PvP(37), -- Hero of the Alliance / Horde: Draconic
	Ach(19458):Mount():HousingDecor(), -- A World Awoken
	Ach(19463), -- Dragon Quests
	Ach(19466), -- Oh My God, They Were Clutchmates
	Ach(19478):Mount(), -- Now THIS is Dragon Racing!
	Ach(19479):Mount(), -- Wake Me Up
	Ach(19481):Mount(), -- Centaur of Attention
	Ach(19482):Mount(), -- Army of the Fed
	Ach(19483):Mount(), -- Flight Club
	Ach(19485):Mount(), -- Closing Time
	Ach(19486):Mount(), -- Across the Isles
	Ach(19490):Title():Mount():Transmog():PvP(37), -- Gladiator: Dragonflight Season 4
	Ach(19492):Title():PvP(37), -- Duelist: Dragonflight Season 4
	Ach(19493):Title():PvP(37), -- Rival I: Dragonflight Season 4
	Ach(19494):Title():PvP(37), -- Combatant I: Dragonflight Season 4
	Ach(19495):PvP(37), -- Combatant II: Dragonflight Season 4
	Ach(19497):Title():PvP(37), -- Challenger I: Dragonflight Season 4
	Ach(19498):PvP(37), -- Rival II: Dragonflight Season 4
	Ach(19499):PvP(37), -- Challenger II: Dragonflight Season 4
	Ach(19500):Title():Toy():PvP(37), -- Legend: Dragonflight Season 4
	Ach(19503):PvP(37), -- Draconic Gladiator's Drake
	Ach(19507):HousingDecor(), -- Fringe Benefits
	Ach(19509):Title():PvP(37), -- Elite: Dragonflight Season 4
	Ach(19513):PvP(37), -- Battle Mender: Dragonflight Season 4
	Ach(19564):PvE(12), -- Awakened Storms
	Ach(19565):PvE(12), -- Heroic: Awakened Storms
	Ach(19566):PvE(12), -- Mythic: Awakened Storms
	Ach(19567):PvE(12), -- Awakened Shadows
	Ach(19568):PvE(12), -- Heroic: Awakened Shadows
	Ach(19569):PvE(12), -- Mythic: Awakened Shadows
	Ach(19570):PvE(12), -- Awakened Flames
	Ach(19571):PvE(12), -- Heroic: Awakened Flames
	Ach(19572):PvE(12), -- Mythic: Awakened Flames
	Ach(19574):Mount():PvE(12), -- Awakening the Dragonflight Raids
	Ach(19575):Title():PvE(12), -- Heroic: Awakening the Dragonflight Raids
	Ach(19576):Teleport():PvE(12), -- Mythic: Awakening the Dragonflight Raids
	Ach(19780):PvE(12), -- Dragonflight Keystone Explorer: Season Four
	Ach(19781):Title():PvE(12), -- Dragonflight Keystone Conqueror: Season Four
	Ach(19782):Mount():PvE(12), -- Dragonflight Keystone Master: Season Four
	Ach(19783):PvE(12), -- Dragonflight Keystone Hero: Season Four
	Ach(19785):Title():PvE(12), -- Draconic Hero: Dragonflight Season 4
	Ach(20209):Obtainable("Event", 181), -- Quacked Killer
	Ach(20481):Transmog():Obtainable("PvP Season", 37):Obtainable("PvE Season", 12), -- Dragonflight Season 4 Master
	Ach(20501):Mount():HousingDecor(), -- Back from the Beyond
	Ach(20508), -- Plunder Wonder
	Ach(20509), -- Plunderkind
}

KrowiAF.AchievementData2["10_02_07"] = {
	{KrowiAF.SetAchievementPatch, 10, 2, 7},
	Ach(19871):Obtainable("Event", 1514), -- Infinite Power
	Ach(19872):Toy():Obtainable("Event", 1514), -- The Jade Forest
	Ach(19873):Transmog():Obtainable("Event", 1514), -- Valley of the Four Winds
	Ach(19874):Transmog():Obtainable("Event", 1514), -- Krasarang Wilds
	Ach(19875):Transmog():Obtainable("Event", 1514), -- Kun-Lai Summit
	Ach(19876):Mount():Obtainable("Event", 1514), -- Vale of Eternal Blossoms
	Ach(19877):Pet():Obtainable("Event", 1514), -- Townlong Steppes
	Ach(19878):Transmog():Obtainable("Event", 1514), -- Dread Wastes
	Ach(19879):Transmog():Obtainable("Event", 1514), -- Landfall
	Ach(19880):Transmog():Obtainable("Event", 1514), -- Isle of Thunder
	Ach(19881):Other():Obtainable("Event", 1514), -- Escalation
	Ach(19882):RemixBronze():AutoFactionSplit(faction.Alliance, 19883):Obtainable("Event", 1514), -- Campaign: The Jade Forest
	Ach(19884):RemixBronze():Obtainable("Event", 1514), -- Campaign: Valley of the Four Winds
	Ach(19885):RemixBronze():AutoFactionSplit(faction.Alliance, 19886):Obtainable("Event", 1514), -- Campaign: Krasarang Wilds
	Ach(19887):RemixBronze():AutoFactionSplit(faction.Alliance, 19888):Obtainable("Event", 1514), -- Campaign: Kun-Lai Summit
	Ach(19889):RemixBronze():Obtainable("Event", 1514), -- Campaign: Townlong Steppes
	Ach(19890):RemixBronze():Obtainable("Event", 1514), -- Campaign: Dread Wastes
	Ach(19891):RemixBronze():Obtainable("Event", 1514), -- Campaign: Landfall
	Ach(19892):RemixBronze():Obtainable("Event", 1514), -- Campaign: Isle of Thunder
	Ach(19893):RemixBronze():Obtainable("Event", 1514), -- A Brewing Storm
	Ach(19894):RemixBronze():Obtainable("Event", 1514), -- Temple of the Jade Serpent
	Ach(19895):RemixBronze():Obtainable("Event", 1514), -- Heroic: Temple of the Jade Serpent
	Ach(19896):RemixBronze():Obtainable("Event", 1514), -- Stormstout Brewery
	Ach(19897):RemixBronze():Obtainable("Event", 1514), -- Heroic: Stormstout Brewery
	Ach(19898):RemixBronze():Obtainable("Event", 1514), -- Shado-Pan Monastery
	Ach(19899):RemixBronze():Obtainable("Event", 1514), -- Heroic: Shado-Pan Monastery
	Ach(19900):RemixBronze():Obtainable("Event", 1514), -- Siege of Niuzao Temple
	Ach(19901):RemixBronze():Obtainable("Event", 1514), -- Heroic: Siege of Niuzao Temple
	Ach(19902):RemixBronze():Obtainable("Event", 1514), -- Gate of the Setting Sun
	Ach(19903):RemixBronze():Obtainable("Event", 1514), -- Heroic: Gate of the Setting Sun
	Ach(19904):RemixBronze():Obtainable("Event", 1514), -- Mogu'shan Palace
	Ach(19905):RemixBronze():Obtainable("Event", 1514), -- Heroic: Mogu'shan Palace
	Ach(19906):RemixBronze():Obtainable("Event", 1514), -- Scarlet Halls
	Ach(19907):RemixBronze():Obtainable("Event", 1514), -- Heroic: Scarlet Halls
	Ach(19908):RemixBronze():Obtainable("Event", 1514), -- Scarlet Monastery
	Ach(19909):RemixBronze():Obtainable("Event", 1514), -- Heroic: Scarlet Monastery
	Ach(19910):RemixBronze():Obtainable("Event", 1514), -- Scholomance
	Ach(19911):RemixBronze():Obtainable("Event", 1514), -- Heroic: Scholomance
	Ach(19912):RemixBronze():Obtainable("Event", 1514), -- Order of the Cloud Serpent
	Ach(19913):RemixBronze():Obtainable("Event", 1514), -- The August Celestials
	Ach(19914):RemixBronze():Obtainable("Event", 1514), -- Shado-Pan
	Ach(19915):RemixBronze():Obtainable("Event", 1514), -- The Klaxxi
	Ach(19916):RemixBronze():Obtainable("Event", 1514), -- Golden Lotus
	Ach(19917):RemixBronze():FactionSplit(faction.Alliance, 19918):Obtainable("Event", 1514), -- Operation: Shieldwall
	Ach(19918):RemixBronze():FactionSplit(faction.Horde, 19917):Obtainable("Event", 1514), -- Dominance Offensive
	Ach(19919):RemixBronze():FactionSplit(faction.Alliance, 19920):Obtainable("Event", 1514), -- Kirin Tor Offensive
	Ach(19920):RemixBronze():FactionSplit(faction.Horde, 19919):Obtainable("Event", 1514), -- Sunreaver Onslaught
	Ach(19921):RemixBronze():Obtainable("Event", 1514), -- Shado-Pan Assault
	Ach(19922):RemixBronze():Obtainable("Event", 1514), -- Emperor Shaohao
	Ach(19923):RemixBronze():Obtainable("Event", 1514), -- Greenstone Village
	Ach(19924):RemixBronze():Obtainable("Event", 1514), -- Heroic: A Brewing Storm
	Ach(19925):RemixBronze():Obtainable("Event", 1514), -- Unga Ingoo
	Ach(19926):RemixBronze():Obtainable("Event", 1514), -- Brewmoon Festival
	Ach(19927):RemixBronze():Obtainable("Event", 1514), -- Arena of Annihilation
	Ach(19928):RemixBronze():Obtainable("Event", 1514), -- Crypt of Forgotten Kings
	Ach(19929):RemixBronze():Obtainable("Event", 1514), -- Heroic: Crypt of Forgotten Kings
	Ach(19930):RemixBronze():Obtainable("Event", 1514), -- Assault on Zan'vess
	Ach(19931):RemixBronze():Obtainable("Event", 1514), -- A Little Patience
	Ach(19932):RemixBronze():FactionSplit(faction.Horde, 20500):Obtainable("Event", 1514), -- Domination Point
	Ach(19933):RemixBronze():Obtainable("Event", 1514), -- Dagger in the Dark
	Ach(19934):RemixBronze():AutoFactionSplit(faction.Alliance, 19936):Obtainable("Event", 1514), -- Battle on the High Seas
	Ach(19935):RemixBronze():AutoFactionSplit(faction.Alliance, 19937):Obtainable("Event", 1514), -- Heroic: Battle on the High Seas
	Ach(19938):RemixBronze():AutoFactionSplit(faction.Alliance, 19939):Obtainable("Event", 1514), -- Theramore's Fall
	Ach(19940):RemixBronze():Obtainable("Event", 1514), -- Blood in the Snow
	Ach(19941):RemixBronze():Obtainable("Event", 1514), -- Heroic: Blood in the Snow
	Ach(19942):RemixBronze():Obtainable("Event", 1514), -- Dark Heart of Pandaria
	Ach(19943):RemixBronze():Obtainable("Event", 1514), -- Heroic: Dark Heart of Pandaria
	Ach(19944):RemixBronze():Obtainable("Event", 1514), -- Secrets of Ragefire
	Ach(19945):RemixBronze():Obtainable("Event", 1514), -- Heroic: Secrets of Ragefire
	Ach(19946):RemixBronze():Obtainable("Event", 1514), -- Raid Finder: Mogu'shan Vaults
	Ach(19947):RemixBronze():Obtainable("Event", 1514), -- Mogu'shan Vaults
	Ach(19948):RemixBronze():Obtainable("Event", 1514), -- Heroic: Mogu'shan Vaults
	Ach(19949):RemixBronze():Obtainable("Event", 1514), -- Raid Finder: Heart of Fear
	Ach(19950):RemixBronze():Obtainable("Event", 1514), -- Heart of Fear
	Ach(19951):RemixBronze():Obtainable("Event", 1514), -- Heroic: Heart of Fear
	Ach(19952):RemixBronze():Obtainable("Event", 1514), -- Raid Finder: Terrace of Endless Spring
	Ach(19953):RemixBronze():Obtainable("Event", 1514), -- Terrace of Endless Spring
	Ach(19954):RemixBronze():Obtainable("Event", 1514), -- Heroic: Terrace of Endless Spring
	Ach(19955):RemixBronze():Obtainable("Event", 1514), -- Raid Finder: Throne of Thunder
	Ach(19956):RemixBronze():Obtainable("Event", 1514), -- Throne of Thunder
	Ach(19957):RemixBronze():Obtainable("Event", 1514), -- Heroic: Throne of Thunder
	Ach(19958):RemixBronze():Obtainable("Event", 1514), -- Raid Finder: Siege of Orgrimmar
	Ach(19959):RemixBronze():Obtainable("Event", 1514), -- Siege of Orgrimmar
	Ach(19960):RemixBronze():Obtainable("Event", 1514), -- Heroic: Siege of Orgrimmar
	Ach(19961):Title():Obtainable("Event", 1514), -- Mythic Remix: Siege of Orgrimmar
	Ach(19962):RemixBronze():Obtainable("Event", 1514), -- Tour The Jade Forest
	Ach(19963):RemixBronze():Obtainable("Event", 1514), -- Tour Valley of the Four Winds
	Ach(19964):RemixBronze():Obtainable("Event", 1514), -- Tour Krasarang Wilds
	Ach(19965):RemixBronze():Obtainable("Event", 1514), -- Tour Kun-Lai Summit
	Ach(19966):RemixBronze():Obtainable("Event", 1514), -- Tour Townlong Steppes
	Ach(19967):RemixBronze():Obtainable("Event", 1514), -- Tour Dread Wastes
	Ach(19970):RemixBronze():Obtainable("Event", 1514), -- Tour Timeless Isle
	Ach(19977):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: The Jade Forest
	Ach(19978):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: Valley of the Four Winds
	Ach(19979):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: Krasarang Wilds
	Ach(19980):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: Kun-Lai Summit
	Ach(19981):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: Townlong Steppes
	Ach(19982):RemixBronze():Obtainable("Event", 1514), -- Hidden Treasures: Timeless Isle
	Ach(19993):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: The Jade Forest
	Ach(19994):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Valley of the Four Winds
	Ach(19995):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Krasarang Wilds
	Ach(19996):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Kun-Lai Summit
	Ach(19997):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Townlong Steppes
	Ach(19998):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Dread Wastes
	Ach(19999):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Landfall
	Ach(20000):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Isle of Thunder
	Ach(20001):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Timeless Isle
	Ach(20002):RemixBronze():Obtainable("Event", 1514), -- Powerful Enemies: Timeless Isle
	Ach(20003):Pet():Obtainable("Event", 1514), -- Timeless Isle
	Ach(20004):Other():Obtainable("Event", 1514), -- Heroic: Pandaria Scenarios
	Ach(20005):Other():Obtainable("Event", 1514), -- Heroic: Pandaria Dungeons
	Ach(20006):Other():Obtainable("Event", 1514), -- Pandaria Raids
	Ach(20007):Title():Obtainable("Event", 1514), -- Heroic: Pandaria Raids
	Ach(20008):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: The Jade Forest
	Ach(20009):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Valley of the Four Winds
	Ach(20011):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Kun-Lai Summit
	Ach(20012):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Townlong Steppes
	Ach(20014):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Vale of Eternal Blossoms
	Ach(20015):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Isle of Thunder
	Ach(20016):RemixBronze():Obtainable("Event", 1514), -- Looking For Group: Timeless Isle
	Ach(20017):RemixBronze():Obtainable("Event", 1514), -- Salyis's Warband
	Ach(20018):RemixBronze():Obtainable("Event", 1514), -- Sha of Anger
	Ach(20019):RemixBronze():Obtainable("Event", 1514), -- Nalak, the Storm Lord
	Ach(20020):RemixBronze():Obtainable("Event", 1514), -- Oondasta
	Ach(20021):RemixBronze():Obtainable("Event", 1514), -- Chi-ji, the Red Crane
	Ach(20022):RemixBronze():Obtainable("Event", 1514), -- Yu'lon, the Jade Serpent
	Ach(20023):RemixBronze():Obtainable("Event", 1514), -- Niuzao, the Black Ox
	Ach(20024):RemixBronze():Obtainable("Event", 1514), -- Xuen, the White Tiger
	Ach(20025):RemixBronze():Obtainable("Event", 1514), -- Ordos
	Ach(20026):RemixBronze():Obtainable("Event", 1514), -- Explore Jade Forest
	Ach(20027):RemixBronze():Obtainable("Event", 1514), -- Explore Valley of the Four Winds
	Ach(20028):RemixBronze():Obtainable("Event", 1514), -- Explore Krasarang Wilds
	Ach(20029):RemixBronze():Obtainable("Event", 1514), -- Explore Kun-Lai Summit
	Ach(20030):RemixBronze():Obtainable("Event", 1514), -- Explore Townlong Steppes
	Ach(20031):RemixBronze():Obtainable("Event", 1514), -- Explore Dread Wastes
	Ach(20069):RemixBronze():Obtainable("Event", 1514), -- Elusive Foes: Vale of Eternal Blossoms
	Ach(20500):RemixBronze():FactionSplit(faction.Alliance, 19932):Obtainable("Event", 1514), -- Lion's Landing
	Ach(20527):Other():Obtainable("Event", 1514), -- Infinite Power I
	Ach(20528):Other():Obtainable("Event", 1514), -- Infinite Power II
	Ach(20529):Other():Obtainable("Event", 1514), -- Infinite Power III
	Ach(20530):Other():Obtainable("Event", 1514), -- Infinite Power IV
	Ach(20531):Other():Obtainable("Event", 1514), -- Infinite Power V
	Ach(20532):Other():Obtainable("Event", 1514), -- Infinite Power VI
	Ach(20533):Other():Obtainable("Event", 1514), -- Infinite Power VII
	Ach(20534):Other():Obtainable("Event", 1514), -- Infinite Power VIII
	Ach(20535):Other():Obtainable("Event", 1514), -- Infinite Power IX
	Ach(20536):Other():Obtainable("Event", 1514), -- Infinite Power X
	Ach(20537):Other():Obtainable("Event", 1514), -- Infinite Power XI
	Ach(20538):Toy():Obtainable("Event", 1514), -- Infinite Power XII
	Ach(20593):Mount():Obtainable("Event", 1514), -- Time Trial
	Ach(40223):Title():Other():Obtainable("Event", 1514), -- Timerunner
	Ach(40382), -- Hunt the Harbinger
}