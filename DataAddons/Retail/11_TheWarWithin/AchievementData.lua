local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["11_00_00"] = {
	{KrowiAF.SetAchievementPatch, 11, 0, 0},
	Ach(19408):HousingDecor(), -- Professional Algari Master
	Ach(19409), -- Working Underground
	Ach(19410), -- Algari Master of All
	Ach(19414), -- Algari Cook
	Ach(19415), -- Algari Fisherman
	Ach(19459), -- Level 80
	Ach(19460):Other(), -- Two Warband Mentors: The War Within
	Ach(19470):Other(), -- One Warband Mentor: The War Within
	Ach(19475):Other(), -- Three Warband Mentors: The War Within
	Ach(19476):Other(), -- Four Warband Mentors: The War Within
	Ach(19477):Other(), -- Five Warband Mentors: The War Within
	Ach(19489), -- Class Connoisseur
	Ach(19515):Transmog(), -- Algari Master of Many
	Ach(19560), -- The Ringing Deeps
	Ach(19704), -- Overflowing Algari Flasks
	Ach(19716), -- Plentiful Algari Potions
	Ach(20118), -- The Isle of Dorn
	Ach(20510), -- What Could it be?
	Ach(20511), -- Gotta Punt em' All
	Ach(19559), -- Azj-Kahet
	Ach(20523):PvE(13), -- The War Within Keystone Explorer: Season One
	Ach(20524):Title():PvE(13), -- The War Within Keystone Conqueror: Season One
	Ach(20525):Mount():PvE(13), -- The War Within Keystone Master: Season One
	Ach(20526):PvE(13), -- The War Within Keystone Hero: Season One
	Ach(20579):Teleport():PvE(14), -- Keystone Hero: The Rookery
	Ach(20580):Teleport():PvE(13), -- Keystone Hero: The Stonevault
	Ach(20581):Teleport():PvE(14):PvE(15), -- Keystone Hero: Priory of the Sacred Flame
	Ach(20582):Teleport():PvE(13), -- Keystone Hero: City of Threads
	Ach(20583):Teleport():PvE(14), -- Keystone Hero: Cinderbrew Meadery
	Ach(20584):Teleport():PvE(14), -- Keystone Hero: Darkflame Cleft
	Ach(20585):Teleport():PvE(13):PvE(15), -- Keystone Hero: The Dawnbreaker
	Ach(20586):Teleport():PvE(13):PvE(15), -- Keystone Hero: Ara-Kara, City of Echoes
	Ach(20587):Teleport():PvE(13), -- Keystone Hero: Siege of Boralus
	Ach(20588):Teleport():PvE(13), -- Keystone Hero: Grim Batol
	Ach(20589):Title():PvE(13), -- Tempered Hero: The War Within Season 1
	Ach(20594), -- Flamegard's Hope
	Ach(20595):HousingDecor(), -- Sojourner of Isle of Dorn
	Ach(20596):Transmog(), -- Loremaster of Khaz Algar
	Ach(20597), -- The War Within
	Ach(20598), -- Hallowfall
	Ach(40082), -- Never Enough
	Ach(40083):IsPvP(), -- Tour of Duty: Isle of Dorn
	Ach(40084):IsPvP(), -- Tour of Duty: The Ringing Deeps
	Ach(40085):IsPvP(), -- Tour of Duty: Hallowfall
	Ach(40086):IsPvP(), -- Tour of Duty: Azj-Kahet
	Ach(40087):IsPvP(), -- Unbound Battle
	Ach(40088):Pet():IsPvP(), -- A Champion's Tour: The War Within
	Ach(40089):IsPvP(), -- Spoiled Goods
	Ach(40090):IsPvP(), -- Spoiled Goods
	Ach(40091):IsPvP(), -- Slightly Spoiled
	Ach(40095):IsPvP(), -- Sparking Battle
	Ach(40096):Toy():IsPvP(), -- Sparking Battle
	Ach(40097):Mount():IsPvP(), -- Ruffious's Bid
	Ach(40098):Title(), -- Immortal Spelunker
	Ach(40100), -- Undying Caver
	Ach(40103):Transmog():PvE(13), -- My First Nemesis
	Ach(40107):Other():PvE(13), -- Harbinger of the Weathered
	Ach(40115):Other():PvE(13), -- Harbinger of the Carved
	Ach(40118):Other():PvE(13), -- Harbinger of the Runed
	Ach(40138):Transmog(), -- Algari Dungeoneer
	Ach(40139), -- Algari Dungeon Damage Dealer
	Ach(40140), -- Algari Dungeon Healer
	Ach(40141), -- Algari Dungeon Tank
	Ach(40146), -- War Within Superior
	Ach(40147), -- War Within Epic
	Ach(40150), -- Children's Entertainer
	Ach(40151), -- Mereldar Menace
	Ach(40153), -- Battle on Khaz Algar
	Ach(40154), -- Aquatic Battler of Khaz Algar
	Ach(40155), -- Beast Battler of Khaz Algar
	Ach(40156), -- Critter Battler of Khaz Algar
	Ach(40157), -- Dragonkin Battler of Khaz Algar
	Ach(40158), -- Elemental Battler of Khaz Algar
	Ach(40161), -- Flying Battler of Khaz Algar
	Ach(40162), -- Humanoid Battler of Khaz Algar
	Ach(40163), -- Magic Battler of Khaz Algar
	Ach(40164), -- Mechanical Battler of Khaz Algar
	Ach(40165), -- Undead Battler of Khaz Algar
	Ach(40166), -- Isle of Dorn Glyph Hunter
	Ach(40194):Pet(), -- Khaz Algar Safari
	Ach(40210):HousingDecor():IsPvP(), -- Deephaul Ravine Victory
	Ach(40211):IsPvP(), -- Deephaul Ravine Veteran
	Ach(40215):IsPvP(), -- Deephaul Ravine Shutout
	Ach(40216):IsPvP(), -- Deephaul Ravine Expedience
	Ach(40217):IsPvP(), -- Battleground Blitzer
	Ach(40219):IsPvP(), -- Battleground Blitzest
	Ach(40220):IsPvP(), -- Setting Records
	Ach(40221):IsPvP(), -- Battleground Blitz Master
	Ach(40222):Title(), -- Echoes of Danger
	Ach(40231):Other(), -- The War Within Pathfinder
	Ach(40232):Mount(), -- Glory of the Nerub-ar Raider
	Ach(40233):Title():Toy():PvP(38), -- Strategist: The War Within Season 1
	Ach(40234):AutoFactionSplit(faction.Horde, 40235):Title():PvP(38), -- Forged Warlord / Marshal: The War Within Season 1
	Ach(40236), -- Mythic: Ulgrax the Devourer
	Ach(40237), -- Mythic: The Bloodbound Horror
	Ach(40238), -- Mythic: Sikran, Captain of the Sureki
	Ach(40239), -- Mythic: Rasha'nan
	Ach(40240), -- Mythic: Broodtwister Ovi'nax
	Ach(40241), -- Mythic: Nexus-Princess Ky'veza
	Ach(40242), -- Mythic: The Silken Court
	Ach(40243):Title(), -- Mythic: Queen Ansurek
	Ach(40244), -- Nerub-ar Palace
	Ach(40245), -- Heroic: Nerub-ar Palace
	Ach(40246), -- Mythic: Nerub-ar Palace
	Ach(40247), -- The Skittering Battlements
	Ach(40248), -- Secrets of Nerub-ar Palace
	Ach(40249), -- A Queen's Fall
	Ach(40250), -- The First Echo
	Ach(40251), -- Many Echoes
	Ach(40252), -- A Series of Echoes
	Ach(40253):PvE(13), -- Ahead of the Curve: Queen Ansurek
	Ach(40254):PvE(13), -- Cutting Edge: Queen Ansurek
	Ach(40255), -- Sik Parry Bro
	Ach(40260), -- You Can't See Me
	Ach(40261), -- Slimy Yet Satisfying
	Ach(40262), -- Cowabunga
	Ach(40263), -- Would You Still /love Me if I Was a Worm...
	Ach(40264), -- Kill Streak
	Ach(40266), -- Missed 'Em by That Much
	Ach(40307):AlliedRace(), -- Allied Races: Earthen
	Ach(40308), -- Beacon of Hope
	Ach(40309):Transmog(), -- Heritage of the Earthen
	Ach(40311), -- Sharing the Light
	Ach(40312), -- Starting the Flames
	Ach(40313), -- Igniting the Keyflames
	Ach(40314):Toy(), -- Fragments of Memories
	Ach(40316), -- Isle of Dorn: Bronze
	Ach(40317), -- Isle of Dorn: Silver
	Ach(40318), -- Isle of Dorn: Gold
	Ach(40319), -- Isle of Dorn Advanced: Bronze
	Ach(40320), -- Isle of Dorn Advanced: Silver
	Ach(40321), -- Isle of Dorn Advanced: Gold
	Ach(40322), -- Isle of Dorn Reverse: Bronze
	Ach(40323), -- Isle of Dorn Reverse: Silver
	Ach(40324), -- Isle of Dorn Reverse: Gold
	Ach(40325), -- The Ringing Deeps: Bronze
	Ach(40326), -- The Ringing Deeps: Silver
	Ach(40327), -- The Ringing Deeps: Gold
	Ach(40328), -- The Ringing Deeps Advanced: Bronze
	Ach(40329), -- The Ringing Deeps Advanced: Silver
	Ach(40330), -- The Ringing Deeps Advanced: Gold
	Ach(40331), -- The Ringing Deeps Reverse: Bronze
	Ach(40332), -- The Ringing Deeps Reverse: Silver
	Ach(40333), -- The Ringing Deeps Reverse: Gold
	Ach(40334), -- Hallowfall: Bronze
	Ach(40335), -- Hallowfall: Silver
	Ach(40336), -- Hallowfall: Gold
	Ach(40337), -- Hallowfall Advanced: Bronze
	Ach(40338), -- Hallowfall Advanced: Silver
	Ach(40339), -- Hallowfall Advanced: Gold
	Ach(40340), -- Hallowfall Reverse: Bronze
	Ach(40341), -- Hallowfall Reverse: Silver
	Ach(40342), -- Hallowfall Reverse: Gold
	Ach(40343), -- Azj-Kahet: Bronze
	Ach(40344), -- Azj-Kahet: Silver
	Ach(40345), -- Azj-Kahet: Gold
	Ach(40346), -- Azj-Kahet Advanced: Bronze
	Ach(40347), -- Azj-Kahet Advanced: Silver
	Ach(40348), -- Azj-Kahet Advanced: Gold
	Ach(40349), -- Azj-Kahet Reverse: Bronze
	Ach(40350), -- Azj-Kahet Reverse: Silver
	Ach(40351), -- Azj-Kahet Reverse: Gold
	Ach(40352), -- Khaz Algar Completionist: Bronze
	Ach(40353), -- Khaz Algar Completionist: Silver
	Ach(40354):Title(), -- Khaz Algar Completionist: Gold
	Ach(40360):Transmog(), -- Life on the Farm
	Ach(40361), -- Cinderbrew Meadery
	Ach(40363), -- Heroic: Cinderbrew Meadery
	Ach(40366), -- Mythic: Cinderbrew Meadery
	Ach(40370), -- Ara-Kara, City of Echoes
	Ach(40374), -- Heroic: Ara-Kara, City of Echoes
	Ach(40375), -- Mythic: Ara-Kara, City of Echoes
	Ach(40376), -- City of Threads
	Ach(40377), -- Heroic: City of Threads
	Ach(40379), -- Mythic: City of Threads
	Ach(40380):Title():PvP(38), -- Forged Gladiator: The War Within Season 1
	Ach(40381):Title():PvP(38), -- Forged Legend: The War Within Season 1
	Ach(40383):AutoFactionSplit(faction.Alliance, 40384):PvP(38), -- Hero of the Alliance / Horde: Forged
	Ach(40385):Title():PvP(38), -- Combatant I: The War Within Season 1
	Ach(40386):PvP(38), -- Combatant II: The War Within Season 1
	Ach(40387):Title():PvP(38), -- Challenger I: The War Within Season 1
	Ach(40388):PvP(38), -- Challenger II: The War Within Season 1
	Ach(40389):Title():PvP(38), -- Rival I: The War Within Season 1
	Ach(40390):PvP(38), -- Rival II: The War Within Season 1
	Ach(40391):Title():PvP(38), -- Duelist: The War Within Season 1
	Ach(40392):Title():PvP(38), -- Elite: The War Within Season 1
	Ach(40393):Title():Mount():Transmog():PvP(38), -- Gladiator: The War Within Season 1
	Ach(40395):Title():Toy():PvP(38), -- Legend: The War Within Season 1
	Ach(40398):PvP(38), -- Forged Gladiator's Fel Bat
	Ach(40427), -- Darkflame Cleft
	Ach(40428), -- Heroic: Darkflame Cleft
	Ach(40429), -- Mythic: Darkflame Cleft
	Ach(40430):Other(), -- Khaz Algar Flight Master
	Ach(40431):Title():PvE(13), -- Hunting the Hunter
	Ach(40433):Mount():PvE(13), -- Let Me Solo Him: Zekvir
	Ach(40434), -- Treasures of the Isle of Dorn
	Ach(40435), -- Adventurer of the Isle of Dorn
	Ach(40436), -- You're Getting a Delve!
	Ach(40437), -- Delver of the Depths
	Ach(40438):Mount(), -- Glory of the Delver
	Ach(40445), -- Sporesweeper
	Ach(40446):Obtainable("Before", "Version", {11, 1, 0}), -- I TAKE Candle!
	Ach(40447), -- Delver of the Depths II
	Ach(40448), -- Delver of the Depths III
	Ach(40449), -- Delver of the Depths IV
	Ach(40450), -- Buddy System II
	Ach(40451), -- Buddy System III
	Ach(40452):Obtainable("Before", "Version", {11, 2, 0}), -- Just Keep Swimming
	Ach(40453), -- Spider Senses
	Ach(40454), -- Daystormer
	Ach(40455), -- Buddy System
	Ach(40456), -- Buddy System IV
	Ach(40457), -- Buddy System V
	Ach(40458), -- Stranger Delves
	Ach(40459):PvE(13), -- I've Got a Flying Machine!
	Ach(40460), -- Delve Deep
	Ach(40461), -- Buddy System VI
	Ach(40462), -- Delve Deeper
	Ach(40463), -- Delve Deepest
	Ach(40464):IsPvP(), -- Bounty Master
	Ach(40465):IsPvP(), -- Unbound Bounty
	Ach(40466):IsPvP(), -- Unbound Glory
	Ach(40467):IsPvP(), -- Unbound Glory
	Ach(40468):IsPvP(), -- Unbound Glory
	Ach(40469), -- I'm Bringing Nerub-ack
	Ach(40472):Title():PvP(38), -- Battle Mender: The War Within Season 1
	Ach(40473), -- Not So Quick Fix
	Ach(40475), -- To All the Slimes I Love
	Ach(40476):Other(), -- 10 Algari Seekerthread
	Ach(40480):Other(), -- 20 Algari Seekerthread
	Ach(40484):Other(), -- 30 Algari Seekerthread
	Ach(40485):Other(), -- 40 Algari Seekerthread
	Ach(40487):Other(), -- 50 Algari Seekerthread
	Ach(40488):Other(), -- 60 Algari Seekerthread
	Ach(40489):Other(), -- 70 Algari Seekerthread
	Ach(40490):Other(), -- 80 Algari Seekerthread
	Ach(40491):Other(), -- 90 Algari Seekerthread
	Ach(40492):Other(), -- 100 Algari Seekerthread
	Ach(40494):Other(), -- 10 Algari Anglerthread
	Ach(40495):Other(), -- 20 Algari Anglerthread
	Ach(40496):Other(), -- 60 Algari Anglerthread
	Ach(40497):Other(), -- 30 Algari Anglerthread
	Ach(40498):Other(), -- 70 Algari Anglerthread
	Ach(40499):Other(), -- 40 Algari Anglerthread
	Ach(40500):Other(), -- 80 Algari Anglerthread
	Ach(40501):Other(), -- 100 Algari Anglerthread
	Ach(40502):Other(), -- 50 Algari Anglerthread
	Ach(40503):Other(), -- 90 Algari Anglerthread
	Ach(40504):HousingDecor(), -- Rocked to Sleep
	Ach(40506):Title(), -- Leave No Treasure Unfound
	Ach(40507), -- Hanging Tight
	Ach(40512):Other(), -- War Within Delves: Tier 2
	Ach(40514):Other(), -- War Within Delves: Tier 3
	Ach(40515):Other():PvE(13), -- War Within Delves: Tier 4 (Season 1)
	Ach(40516):Other():PvE(13), -- War Within Delves: Tier 5 (Season 1)
	Ach(40517):Other():PvE(13), -- War Within Delves: Tier 6 (Season 1)
	Ach(40518):Other():PvE(13), -- War Within Delves: Tier 7 (Season 1)
	Ach(40519):Other():PvE(13), -- War Within Delves: Tier 8 (Season 1)
	Ach(40520):Other():PvE(13), -- War Within Delves: Tier 9 (Season 1)
	Ach(40521):Other():PvE(13), -- War Within Delves: Tier 10 (Season 1)
	Ach(40523), -- On Brand
	Ach(40524), -- Good Deed Delver
	Ach(40525), -- Fungal Folly Stories
	Ach(40526), -- Kriegval's Rest Stories
	Ach(40527), -- Earthcrawl Mines Stories
	Ach(40528), -- The Waterworks Stories
	Ach(40529), -- The Dread Pit Stories
	Ach(40530), -- Nightfall Sanctum Stories
	Ach(40531), -- Mycomancer Cavern Stories
	Ach(40532), -- The Sinkhole Stories
	Ach(40533), -- Skittering Breach Stories
	Ach(40534), -- The Underkeep Stories
	Ach(40535), -- Tak-Rethan Abyss Stories
	Ach(40536), -- The Spiral Weave Stories
	Ach(40537), -- Delve Loremaster: War Within
	Ach(40538), -- Brann Development
	Ach(40539):Mount(), -- The Derby Dash
	Ach(40542):HousingDecor(), -- Smelling History
	Ach(40585), -- Super Size Snuffling
	Ach(40590), -- Priory of the Sacred Flame
	-- {40591}, -- Khaz Algar Diplomat [Removed in 11.0.7, replaced by 41169]
	Ach(40592), -- Heroic: Priory of the Sacred Flame
	Ach(40596), -- Mythic: Priory of the Sacred Flame
	Ach(40599), -- The Dawnbreaker
	Ach(40601), -- Heroic: The Dawnbreaker
	Ach(40604), -- Mythic: The Dawnbreaker
	Ach(40606), -- Flat Earthen
	Ach(40607):IsPvP(), -- Wandering in the Ravine
	Ach(40608):IsPvP(), -- Running in the Ravine
	Ach(40612):HousingDecor():IsPvP(), -- Sprinting in the Ravine
	Ach(40613):IsPvP(), -- Resilient Runner
	Ach(40614), -- Gobblin' with Glublurp
	Ach(40615):IsPvP(), -- Unexpected Arrival
	Ach(40616):IsPvP(), -- Unexpected Arrivals
	Ach(40617):Title():IsPvP(), -- Deepholla
	Ach(40618):Transmog(), -- Lost and Found
	Ach(40620), -- Back to the Wall
	Ach(40621), -- The Rookery
	Ach(40622), -- Biblo Archivist
	Ach(40623), -- I Only Need One Trip
	Ach(40624), -- Itsy Bitsy Spider
	Ach(40625), -- The Missing Lynx
	Ach(40628), -- Notable Machines
	Ach(40629), -- Bookworm
	Ach(40630), -- For the Collective
	Ach(40631):Other(), -- War Within Delves: Tier 1
	Ach(40632), -- No Harm Ever Came From Reading A Book
	Ach(40633), -- The Unseeming
	Ach(40634), -- You Can't Hang With Us
	Ach(40635), -- Branntastic
	Ach(40636), -- Sojourner of Azj-Kahet
	Ach(40637), -- Heroic: The Rookery
	Ach(40642), -- Mythic: The Rookery
	Ach(40643), -- The Stonevault
	Ach(40644), -- Heroic: The Stonevault
	Ach(40648), -- Mythic: The Stonevault
	Ach(40660):Transmog(), -- The War Within Season 1: Spelunker Supreme
	Ach(40662):Title(), -- It's Not Much, But It's Honest Work
	Ach(40702):Mount(), -- Khaz Algar Glyph Hunter
	Ach(40703), -- The Ringing Deeps Glyph Hunter
	Ach(40704), -- Hallowfall Glyph Hunter
	Ach(40705), -- Azj-Kahet Glyph Hunter
	Ach(40723):Transmog(), -- Web-Wrapped in the Finest Silks
	Ach(40724), -- Treasures of The Ringing Deeps
	Ach(40725):Other(), -- War Within Delves: Endgame
	Ach(40726):Title():PvE(13), -- War Within Delves: Tier 11 (Season 1)
	Ach(40727), -- Skittershaw Spin
	Ach(40728):IsPvP(), -- Forged Finery
	Ach(40729), -- Light's Gambit Champion
	Ach(40730), -- Love is in the Lair
	Ach(40731), -- Panhandled
	Ach(40732), -- Heavy-Handed
	Ach(40763), -- I'm not a Thief, I'm a Treasure Hunter
	Ach(40788), -- I Got the Keys
	Ach(40789):PvE(13), -- Flying in Style
	Ach(40790), -- Khaz Algar Explorer
	Ach(40792):Toy():PvP(38), -- Solo Shuffle Medic: The War Within
	Ach(40795):Toy():IsPvP():Obtainable("From", "PvP Season", 38, "Until", "PvP Season", 40), -- Battleground Blitz Medic: The War Within
	Ach(40796):Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26}), -- This Takes Me Back
	Ach(40799), -- Sojourner of The Ringing Deeps
	Ach(40803), -- Fungal Folly Discoveries
	Ach(40806), -- Earthcrawl Mines Discoveries
	Ach(40807), -- Kriegval's Rest Discoveries
	Ach(40808), -- Mycomancer Cavern Discoveries
	Ach(40809), -- Nightfall Sanctum Discoveries
	Ach(40810), -- Skittering Breach Discoveries
	Ach(40811), -- Tak-Rethan Abyss Discoveries
	Ach(40812), -- The Dread Pit Discoveries
	Ach(40813), -- The Sinkhole Discoveries
	Ach(40814), -- The Spiral Weave Discoveries
	Ach(40815), -- The Underkeep Discoveries
	Ach(40816), -- The Waterworks Discoveries
	Ach(40817), -- A Delver's Bounty
	Ach(40819), -- Ready to Turn
	Ach(40820), -- Raisin' Brann
	Ach(40822), -- Explore Azj-Kahet
	Ach(40825), -- Explore The Ringing Deeps
	Ach(40826), -- Explore Hallowfall
	Ach(40828), -- Treasures of Azj-Kahet
	Ach(40831), -- Explore the Isle of Dorn
	Ach(40832), -- Leave it to Weaver
	Ach(40833), -- The General's Salute
	Ach(40835), -- Vizier than Ever
	-- {40836}, -- Assembly of the Deeps [Removed in 11.0.7, replaced by 41165]
	Ach(40837), -- Adventurer of The Ringing Deeps
	-- {40838}, -- The Severed Threads [Removed in 11.0.7, replaced by 41149]
	Ach(40840), -- Adventurer of Azj-Kahet
	Ach(40843), -- Mine Poppin'
	Ach(40844), -- Sojourner of Hallowfall
	-- {40845}, -- Hallowfall Arathi [Removed in 11.0.7, replaced by 41167]
	Ach(40848), -- Treasures of Hallowfall
	Ach(40851), -- Adventurer of Hallowfall
	-- {40856}, -- Council of Dornogal [Removed in 11.0.7, replaced by 41161]
	Ach(40859):HousingDecor(), -- We're Here All Night
	Ach(40860), -- A Star of Dorn
}

KrowiAF.AchievementData2["11_00_02"] = {
	{KrowiAF.SetAchievementPatch, 11, 0, 2},
	Ach(40862):Obtainable("Event", 324), -- Tricks and Treats of Khaz Algar
	Ach(40863), -- Perplexing Puzzle
	Ach(40864), -- Plentiful Perplexing Puzzles
	Ach(40869):Pet(), -- Worm Theory
	Ach(40874):Title(), -- The Grand Tapestry
	Ach(40875):Title(), -- True Strength
	Ach(40876):Title(), -- Vox Arachni
	Ach(40882):Title(), -- Copious Coffers
	Ach(40885):Other(), -- The Key to Madness
	-- {40904}, -- Cornerstone of Dornogal [Removed in 11.0.7, replaced by 41162]
	-- {40905}, -- From Many, One [Removed in 11.0.7, replaced by 41166]
	-- {40906}, -- The Flame Burns Within [Removed in 11.0.7, replaced by 41168]
	-- {40907}, -- We Rise Anew [Removed in 11.0.7, replaced by 41164]
	Ach(40939):PvE(13), -- Harbinger of the Gilded
}

KrowiAF.AchievementData2["11_00_05"] = {
	{KrowiAF.SetAchievementPatch, 11, 0, 5},
	Ach(15644):Pet(), -- Good Things Come in Small Packages
	Ach(40661):Anniv20(), -- Zoomies!
	Ach(40870):Title(), -- Azeroth's Greatest Detective
	Ach(40871):Transmog(), -- Assistant to the Assistant Guest Relations Manager
	Ach(40872):Transmog(), -- I Saved the Party and All I Got Was This Lousy Hat
	Ach(40873), -- Crate Insurance Agent
	Ach(40967), -- Ratts' Revenge
	Ach(40976):Mount():Anniv20(), -- A Cool Twenty Years
	Ach(40977):Anniv20(), -- Codex Editor: Ahn'Qiraj
	Ach(40979), -- No Crate Left Behind
	Ach(40980):Pet(), -- Family Battler of Khaz Algar
	Ach(40984):Anniv20(), -- Big Fan
	Ach(40985):Anniv20(), -- I Have That One!
	Ach(40986):Anniv20(), -- Mount Master
	Ach(40987):Anniv20(), -- Fashion Critic
	Ach(40988), -- Photo Op!
	Ach(40989):Anniv20(), -- Pet Mischief
	Ach(40990):Anniv20(), -- Balloonist
	Ach(40991):Anniv20(), -- Frequent Flyer
	Ach(40992):Anniv20(), -- Peanut Gallery
	Ach(40993):Anniv20(), -- Avid Listener
	Ach(40994):Anniv20(), -- An Original
	Ach(40995):Anniv20(), -- The Originals
	Ach(40996):Anniv20(), -- A Gatecrasher
	Ach(40997):Anniv20(), -- The Gatecrashers
	Ach(40998), -- A Timewalking Step Back to a Classic Dungeon Time
	Ach(40999):Anniv20(), -- You're in Your Blackrock Depths
	Ach(41000), -- A Timewalking Journey Back to a Classic Dungeon Time
	Ach(41013):Other(), -- Upgraded Apparel
	Ach(41015):Anniv20(), -- A Dark Iron Past
	Ach(41033):Other(), -- Classy Dresser
	Ach(41038):Other():Anniv20(), -- Token Collector
	Ach(41044):Transmog():PvP(38), -- Forged Weapons of Conquest
	Ach(41220):Anniv20(), -- WoW's 20th Anniversary
}

KrowiAF.AchievementData2["11_00_07"] = {
	{KrowiAF.SetAchievementPatch, 11, 0, 7},
	Ach(40762), -- Khaz Algar Lore Hunter
	Ach(40791):Title(), -- Fate of the Kirin Tor
	Ach(40953):Mount():HousingDecor(), -- A Farewell to Arms
	Ach(40955), -- War Stories
	Ach(40956):Mount(), -- I'm On Island Time
	Ach(40957), -- Maximum Effort
	Ach(40958), -- Full Heart, Can't Lose
	Ach(40959), -- Black Empire State of Mind
	Ach(40960), -- Uldir
	Ach(40961), -- Battle of Dazar'alor
	Ach(40962), -- The Eternal Palace
	Ach(40963), -- Ny'alotha, the Waking City
	Ach(41042), -- Siren-ity Now!
	Ach(41043), -- Excavation Projects
	Ach(41045), -- A Song of Secrets
	Ach(41046), -- Clean Up on Isle Siren
	Ach(41050), -- A Choir of Citrines
	Ach(41052):Transmog(), -- Lingering Shadows
	Ach(41056):Mount():Obtainable("Event", 1425, false), -- Master of the Turbulent Timeways II
	Ach(41130):Obtainable("Event", 327), -- Elders of Khaz Algar
	Ach(41131), -- Treasures of the Storm
	Ach(41133):Mount(), -- Isle Remember You
	Ach(41149), -- The Severed Threads
	Ach(41152), -- Lub and Plunder
	Ach(41153), -- Swabbie Swag
	Ach(41154), -- Decked Out
	Ach(41156), -- Buckled Up
	Ach(41157), -- Plunder Siege
	Ach(41160), -- It's a Plunderful Life
	Ach(41161), -- Council of Dornogal
	Ach(41162), -- Cornerstone of Dornogal
	Ach(41163), -- Lord of the Bling
	Ach(41164), -- We Rise Anew
	Ach(41165), -- Assembly of the Deeps
	Ach(41166), -- From Many, One
	Ach(41167), -- Hallowfall Arathi
	Ach(41168), -- The Flame Burns Within
	Ach(41169):Transmog(), -- Khaz Algar Diplomat
	Ach(41170), -- Friends in the Plains
	Ach(41171), -- Friends in the Accord
	Ach(41172), -- Friends in the Field
	Ach(41173), -- Friend of the Family
	Ach(41174), -- A True Explorer
	Ach(41175), -- Friends in Loamm Places
	Ach(41176), -- Friends in the Dream
	Ach(41177), -- Warden of the Dream
	Ach(41179), -- Popular Around the Isles
	Ach(41180), -- Joining the Khansguard
	Ach(41181), -- Joining the Community
	Ach(41182), -- Ally of the Flights
	Ach(41183), -- There's No Place Like Loamm
	Ach(41184), -- Freshscales Fifteen
	Ach(41185), -- Siren's Squall
	Ach(41186):HousingDecor(), -- Slate of the Union
	Ach(41187), -- Rage Aside the Machine
	Ach(41188), -- Crystal Chronicled
	Ach(41189), -- Azj the World Turns
	Ach(41201):Mount(), -- You Xal Not Pass
	Ach(41202), -- Hot Tropic
	Ach(41203), -- Bwon Voyage
	Ach(41204), -- Dune Squad
	Ach(41205), -- Sound Off
	Ach(41206), -- Songs of Storms
	Ach(41207), -- When the Drust Settles
	Ach(41209), -- Dressed to Kill: Battle for Azeroth
}

KrowiAF.AchievementData2["11_01_00"] = {
	{KrowiAF.SetAchievementPatch, 11, 1, 0},
	Ach(40142), -- Learning to Share
	Ach(40145), -- So Much Sharing
	Ach(40894):HousingDecor(), -- Sojourner of Undermine
	Ach(40900), -- Undermined
	Ach(40911):Transmog(), -- The War Within Season 2: Master Blaster
	Ach(40936), -- Undermine Skyrocketing: Bronze
	Ach(40937), -- Undermine Skyrocketing: Silver
	Ach(40938):Title(), -- Undermine Skyrocketing: Gold
	Ach(40942):Other():PvE(14), -- Weathered of the Undermine
	Ach(40943):Other():PvE(14), -- Carved of the Undermine
	Ach(40944):Other():PvE(14), -- Runed of the Undermine
	Ach(40945):PvE(14), -- Gilded of the Undermined
	Ach(40948):TradersTender(), -- Nine-Tenths of the Law
	Ach(40949):PvE(14), -- The War Within Keystone Explorer: Season Two
	Ach(40950):Title():PvE(14), -- The War Within Keystone Conqueror: Season Two
	Ach(40951):Mount():PvE(14), -- The War Within Keystone Legend: Season Two
	Ach(40952):PvE(14), -- The War Within Keystone Hero: Season Two
	Ach(40954):Title():PvE(14), -- Enterprising Hero: The War Within Season Two
	Ach(40965):Teleport():PvE(14), -- Keystone Hero: The MOTHERLODE!!
	Ach(40966):Teleport():PvE(14), -- Keystone Hero: Operation: Mechagon - Workshop
	Ach(41016):Title():PvP(39), -- Rival I: The War Within Season 2
	Ach(41017):PvP(39), -- Rival II: The War Within Season 2
	Ach(41018):Title():PvP(39), -- Duelist: The War Within Season 2
	Ach(41019):Title():PvP(39), -- Elite: The War Within Season 2
	Ach(41020):Title():PvP(39), -- Combatant I: The War Within Season 2
	Ach(41021):PvP(39), -- Combatant II: The War Within Season 2
	Ach(41022):Title():PvP(39), -- Challenger I: The War Within Season 2
	Ach(41023):PvP(39), -- Challenger II: The War Within Season 2
	Ach(41032):Title():Mount():Transmog():PvP(39), -- Gladiator: The War Within Season 2
	Ach(41047):Transmog():PvP(39), -- Prized Weapons of Conquest
	Ach(41081):Mount(), -- Undermine Breaknecking: Bronze
	Ach(41083), -- Undermine Breaknecking: Silver
	Ach(41084):Mount():Title(), -- Undermine Breaknecking: Gold
	Ach(41086):Title(), -- Ally of Undermine
	Ach(41092):Pet(), -- Undermine Safari
	Ach(41095):Title(), -- Delve Beyond
	Ach(41096):Title(), -- Delve Infinite
	Ach(41097), -- Curiosity Never Killed the Looter
	Ach(41098), -- Excavation Site 9 Stories
	Ach(41099), -- Sidestreet Sluice Stories
	Ach(41100), -- Excavation Site 9 Discoveries
	Ach(41101), -- Sidestreet Sluice Discoveries
	Ach(41105), -- Prodigious Plentiful Perplexing Puzzles
	Ach(41106), -- Algari Delver Damage Dealer
	Ach(41107), -- Algari Delver Healer
	Ach(41108), -- Algari Delver Tank
	Ach(41109), -- Algari Delver Damage Dealer II
	Ach(41110), -- Algari Delver Damage Dealer III
	Ach(41111), -- Algari Delver Healer II
	Ach(41112), -- Algari Delver Healer III
	Ach(41113), -- Algari Delver Tank II
	Ach(41114), -- Algari Delver Tank III
	Ach(41115), -- Algari Delver
	Ach(41116), -- Algari Delver II
	Ach(41119):HousingDecor(), -- One Rank Higher
	Ach(41120), -- Two Ranks Higher
	Ach(41121), -- Three Ranks Higher
	Ach(41122):Title(), -- Best In Class
	Ach(41191):Other():PvE(14), -- War Within Delves: Tier 4 (Season 2)
	Ach(41192):Other():PvE(14), -- War Within Delves: Tier 5 (Season 2)
	Ach(41193):Other():PvE(14), -- War Within Delves: Tier 7 (Season 2)
	Ach(41194):Other():PvE(14), -- War Within Delves: Tier 8 (Season 2)
	Ach(41195):Other():PvE(14), -- War Within Delves: Tier 9 (Season 2)
	Ach(41196):Other():PvE(14), -- War Within Delves: Tier 10 (Season 2)
	Ach(41197):Title():PvE(14), -- War Within Delves: Tier 11 (Season 2)
	Ach(41198):Other():PvE(14), -- War Within Delves: Tier 6 (Season 2)
	Ach(41208), -- Hold My Gear!
	Ach(41210):Mount():PvE(14), -- Let Me Solo Him: The Underpin
	Ach(41211):Toy(), -- A Good Day to Dye Hard
	Ach(41214), -- Under the Echoes
	Ach(41215), -- Echoes of Deeper Dangers
	Ach(41216), -- Adventurer of Undermine
	Ach(41217), -- Treasures of Undermine
	Ach(41222), -- Liberation of Undermine
	Ach(41223), -- Heroic: Liberation of Undermine
	Ach(41224), -- Mythic: Liberation of Undermine
	Ach(41225), -- Shock and Awesome
	Ach(41226), -- Maniacal Machinist
	Ach(41227), -- Beating the Odds
	Ach(41228), -- Fall of the Chrome King
	Ach(41229), -- Mythic: Vexie and the Geargrinders
	Ach(41230), -- Mythic: Cauldron of Carnage
	Ach(41231), -- Mythic: Rik Reverb
	Ach(41232), -- Mythic: Stix Bunkjunker
	Ach(41233), -- Mythic: Sprocketmonger Lockenstock
	Ach(41234), -- Mythic: The One-Armed Bandit
	Ach(41235), -- Mythic: Mug'Zee, Heads of Security
	Ach(41236):Title(), -- Mythic: Chrome King Gallywix
	Ach(41286):Mount(), -- Glory of the Liberation of Undermine Raider
	Ach(41297):PvE(14), -- Cutting Edge: Chrome King Gallywix
	Ach(41298):PvE(14), -- Ahead of the Curve: Chrome King Gallywix
	Ach(41337), -- Sleep with the Fishes
	Ach(41338), -- Just /Dance
	Ach(41339), -- Operation: Floodgate
	Ach(41340), -- Heroic: Operation: Floodgate
	Ach(41341), -- Mythic: Operation: Floodgate
	Ach(41347), -- Scheming on a Thing
	Ach(41348):Teleport():PvE(14):PvE(15), -- Keystone Hero: Operation: Floodgate
	Ach(41349):Pet(), -- In with the Cartels
	Ach(41350):Title(), -- A Long Fuse
	Ach(41351):Transmog(), -- Cartels Bestie
	Ach(41352):Title(), -- Trade-Duke
	Ach(41354):Title():PvP(39), -- Prized Gladiator: The War Within Season 2
	Ach(41355):Title():PvP(39), -- Prized Legend: The War Within Season 2
	Ach(41356):AutoFactionSplit(faction.Horde, 41357):Title():PvP(39), -- Prized Warlord / Marshal: The War Within Season 2
	Ach(41358):Title():Toy():PvP(39), -- Legend: The War Within Season 2
	Ach(41359):Title():PvP(39), -- Battle Mender: The War Within Season 2
	Ach(41360):AutoFactionSplit(faction.Horde, 41361):PvP(39), -- Hero of the Horde / Alliance: Prized
	Ach(41362):PvP(39), -- Prized Gladiator's Fel Bat
	Ach(41363):Title():Toy():PvP(39), -- Strategist: The War Within Season 2
	Ach(41522):IsPvP(), -- Tour of Duty: Undermine
	Ach(41525), -- Can You Please Spell "Gobanna?"
	Ach(41529):Title():PvE(14), -- Breaking the Bank
	Ach(41530):Mount():PvE(14), -- My New Nemesis
	Ach(41531):PvE(14), -- The Hataclysm
	Ach(41532):PvE(14), -- I've Got a Flying Machine?
	Ach(41533):Mount():PvE(14), -- The War Within Keystone Master: Season Two
	Ach(41537), -- Buddy System VII
	Ach(41541), -- Critter Battler of Undermine
	Ach(41542), -- Aquatic Battler of Undermine
	Ach(41543), -- Beast Battler of Undermine
	Ach(41544), -- Dragonkin Battler of Undermine
	Ach(41545), -- Elemental Battler of Undermine
	Ach(41546), -- Flying Battler of Undermine
	Ach(41547), -- Humanoid Battler of Undermine
	Ach(41548), -- Magic Battler of Undermine
	Ach(41549), -- Mechanical Battler of Undermine
	Ach(41550), -- Undead Battler of Undermine
	Ach(41551):Pet(), -- Family Battler of Undermine
	Ach(41554), -- The Splash Zone
	Ach(41555):WarbandCampsite(), -- All That Khaz
	Ach(41586):WarbandCampsite(), -- Going Goblin Mode
	Ach(41587), -- Explore Undermine
	Ach(41588):Toy(), -- Read Between the Lines
	Ach(41589), -- That Can-Do Attitude
	Ach(41590), -- No Littering
	Ach(41591), -- Really No Littering
	Ach(41592), -- Absolutely Zero Littering
	Ach(41593), -- Cleanin' the Streets
	Ach(41594), -- Can You Believe What People Throw Away?
	Ach(41595):IsPvP(), -- Prized Guise
	Ach(41596):Title(), -- Garbage In, Garbage Out
	{41626, }, -- C.H.E.T.T. a Look
	{41627, }, -- C.H.E.T.T.ing it Twice
	Ach(41629):Title(), -- C.H.E.T.T.mate
	{41630, }, -- "Employee" of the Month
	Ach(41665):Transmog(), -- Dressed to the Mines
	Ach(41694), -- Flarendo's Biggest Fan
	Ach(41695), -- Torq's Biggest Fan
	Ach(41708), -- You're My Friend Now
	Ach(41709):PvE(14), -- Journey's End (Season 2)
	Ach(41711), -- Conveyor Slayer
	Ach(41714):PvE(14), -- From Trash to Treasure
	Ach(41723), -- Buddy System VIII
}

KrowiAF.AchievementData2["11_01_05"] = {
	{KrowiAF.SetAchievementPatch, 11, 1, 5},
	Ach(41631):AutoFactionSplit(faction.Alliance, 41632):Obtainable("Event", 341), -- Flame Warden / Keeper of Khaz Algar
	Ach(41706):Obtainable("Event", 1599), -- Dastardly Duos Weekly High Score
	Ach(41707):Obtainable("Event", 1599), -- Dastardly Devices
	Ach(41715):Other():Obtainable("Event", 1599), -- Fiendishly Famous
	Ach(41716):Other():Obtainable("Event", 1599), -- Duo Darling
	Ach(41717):Obtainable("Event", 1599), -- Duos Underdog
	Ach(41722):Other():Obtainable("Event", 1599), -- Inside Connections
	Ach(41725), -- We Have the Memories
	Ach(41810):Obtainable("Event", 1599), -- Winner's Podium
	Ach(41853), -- Horrific Vision of Stormwind
	Ach(41854), -- The Even More Horrific Vision of Stormwind
	Ach(41855), -- The Most Horrific Vision of Stormwind
	Ach(41857):Other(), -- Masked Soliloquy
	Ach(41858), -- Masked Sextet
	Ach(41859), -- Thanks For The Mementos
	Ach(41873):Transmog(), -- Incremental Progress
	Ach(41874):Transmog(), -- Symphony of Masks
	Ach(41875), -- Horrific Vision of Orgrimmar
	Ach(41876), -- The Even More Horrific Vision of Orgrimmar
	Ach(41879), -- The Most Horrific Vision of Orgrimmar
	Ach(41889), -- Horrific Masquerade
	Ach(41890), -- Masked Duet
	Ach(41891), -- Masked Trio
	Ach(41893), -- Masked Quartet
	Ach(41894), -- Masked Septet
	Ach(41895), -- Orchestra of Masks
	Ach(41896), -- Memento Mori
	Ach(41897), -- A Monumental Amount of Mementos
	Ach(41898), -- A Mountain of Mementos
	Ach(41905):Obtainable("Event", 1599), -- Center of Attention
	Ach(41916):Obtainable("Event", 1599), -- My Way, The Highway
	Ach(41922):Obtainable("Event", 1599), -- Undefeatable
	Ach(41928):Pet(), -- Reeking of Visions
	Ach(41929):Mount(), -- Through the Depths of Visions
	Ach(41948):Obtainable("Event", 1599), -- Defeat the Dastardlies
	Ach(41949):Obtainable("Event", 1599), -- Defeat the Dastardlies
	Ach(41950):Obtainable("Event", 1599), -- Defeat the Dastardlies
	Ach(41951):Obtainable("Event", 1599), -- Defeat the Dastardlies
	Ach(41952):Obtainable("Event", 1599), -- Defeat the Dastardlies
	Ach(41953):Title(), -- Mad World
	Ach(41964), -- Beyond the Most Horrific Vision of Stormwind
	Ach(41965), -- Beyond the Most Horrific Vision of Orgrimmar
	Ach(41966):Mount(), -- Mastering the Visions
	Ach(41971):Title(), -- Through the Looking Glass
	Ach(41983), -- Memento Mania
	Ach(41995):Obtainable("Event", 1599), -- Boot Hill
	Ach(41996), -- I'm Doing My Part
	Ach(41997), -- Owner of a Radiant Heart
	Ach(41998), -- Turning the Venom Tide
	Ach(41999), -- Fighter of the Nightman
	Ach(42002):Obtainable("Event", 1599), -- Bullhorn of Plenty
	Ach(42003):Obtainable("Event", 1599), -- Bullhorn of More Plenty
	Ach(42004):Obtainable("Event", 1599), -- Bullhorn of Most Plenty
	Ach(42139):PvE(14), -- The Enterprising Tank
	Ach(42141):PvE(14), -- The Enterprising Healer
	Ach(42144):PvE(14), -- The Enterprising Damage Dealer
	Ach(42148):Title():PvE(14), -- The Enterprising Dungeon Master
}

KrowiAF.AchievementData2["11_01_07"] = {
	{KrowiAF.SetAchievementPatch, 11, 1, 7},
	Ach(41779):Mount():Obtainable("Event", 1425, false), -- Master of the Turbulent Timeways III
	Ach(41818):AutoFactionSplit(faction.Alliance, 41820):Title(), -- Rise of the Red Dawn
	Ach(42029), -- The Emerald Nightmare
	Ach(42030), -- The Nighthold
	Ach(42031), -- Tomb of Sargeras
	Ach(42032), -- Antorus, the Burning Throne
	Ach(42187):HousingDecor(), -- Lorewalking: Ethereal Wisdom
	Ach(42188):HousingDecor(), -- Lorewalking: Blade's Bane
	Ach(42189):HousingDecor(), -- Lorewalking: The Lich King
	Ach(42212):Mount():Obtainable("Before", "Version", {11, 2, 0}), -- Titan Console Overcharged
	Ach(42241):Toy():Obtainable("Before", "Version", {11, 2, 0}), -- Overcharged Delver
}

KrowiAF.AchievementData2["11_02_00"] = {
	{KrowiAF.SetAchievementPatch, 11, 2, 0},
	Ach(41024):Title():PvP(40), -- Rival I: The War Within Season 3
	Ach(41025):PvP(40), -- Rival II: The War Within Season 3
	Ach(41026):Title():PvP(40), -- Duelist: The War Within Season 3
	Ach(41027):Title():PvP(40), -- Elite: The War Within Season 3
	Ach(41028):Title():PvP(40), -- Combatant I: The War Within Season 3
	Ach(41029):PvP(40), -- Combatant II: The War Within Season 3
	Ach(41030):Title():PvP(40), -- Challenger I: The War Within Season 3
	Ach(41031):PvP(40), -- Challenger II: The War Within Season 3
	Ach(41048):Transmog():PvP(40), -- Astral Weapons of Conquest
	Ach(41049):Title():Mount():Transmog():PvP(40), -- Gladiator: The War Within Season 3
	Ach(41212):Obtainable("Event", 372), -- A Round on the House in Khaz Algar
	Ach(41597):Mount(), -- Glory of the Omega Raider
	Ach(41598), -- Manaforge Omega
	Ach(41599), -- Heroic: Manaforge Omega
	Ach(41600), -- Mythic: Manaforge Omega
	Ach(41601), -- Might of the Shadowguard
	Ach(41602), -- Monsters of the Sands
	Ach(41603), -- Heart of Darkness
	Ach(41604), -- Mythic: Plexus Sentinel
	Ach(41605), -- Mythic: Loom'ithar
	Ach(41606), -- Mythic: Soulbinder Naazindhri
	Ach(41607), -- Mythic: Forgeweaver Araz
	Ach(41608), -- Mythic: The Soul Hunters
	Ach(41609), -- Mythic: Fractillus
	Ach(41610), -- Mythic: Nexus-King Salhadaar
	Ach(41611):Title(), -- Mythic: Dimensius, the All-Devouring
	Ach(41613), -- Time to Vote! Cute or Scary?
	Ach(41614), -- Mother of All Tantrums
	Ach(41615), -- Cheat Meal
	Ach(41616), -- I See... Absolutely Nothing
	Ach(41617), -- Breaking the Fourth Wall
	Ach(41618), -- King's Ransom
	Ach(41619), -- Defying Gravity
	Ach(41624), -- Ahead of the Curve: Dimensius, the All-Devouring
	Ach(41625), -- Cutting Edge: Dimensius, the All-Devouring
	Ach(41778), -- Brokers Don't Care How You Win
	Ach(41808), -- Otherworldly Ecologist
	Ach(41809), -- Ecological Variety
	Ach(41811), -- Ecological Stability
	Ach(41812), -- Expertly Done
	Ach(41815), -- Ecological Succession
	Ach(41886):Other():PvE(15), -- Weathered of the Ethereal
	Ach(41887):Other():PvE(15), -- Carved of the Ethereal
	Ach(41888):Other():PvE(15), -- Runed of the Ethereal
	Ach(41892), -- Gilded of the Ethereal
	Ach(41937):Transmog(), -- The War Within Season 3: Voidborne Victor
	Ach(41970):WarbandCampsite(), -- The Knife's Edge
	Ach(41973):Mount():PvE(15), -- The War Within Keystone Master: Season Three
	Ach(41978):Transmog(), -- Moonlighter
	Ach(41979):Pet(), -- Bounty Seeker
	Ach(41980):Mount(), -- Vigilante
	Ach(42022), -- A Trusted Partner
	Ach(42023):Title():Toy():PvP(40), -- Legend: The War Within Season 3
	Ach(42024):Title():Toy():PvP(40), -- Strategist: The War Within Season 3
	Ach(42033):Title():PvP(40), -- Astral Legend: The War Within Season 3
	Ach(42034):AutoFactionSplit(faction.Horde, 42035):Title():PvP(40), -- Astral Warlord / Marshal: The War Within Season 3
	Ach(42036):Title():PvP(40), -- Astral Gladiator: The War Within Season 3
	Ach(42037):AutoFactionSplit(faction.Horde, 42038):PvP(40), -- Hero of the Horde / Alliance: Astral
	Ach(42039):PvP(40), -- Astral Gladiator's Fel Bat
	Ach(42044):Title():PvP(40), -- Battle Mender: The War Within Season 3
	-- {42114}, -- Broken Memories
	Ach(42118), -- Of Mice and Manaforges
	Ach(42131):IsPvP(), -- Tour of Duty: K'aresh
	Ach(42149):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 12 (Keystones will no longer deplete below level 12 during the War Within Season 3.)
	Ach(42150):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 13 (Keystones will no longer deplete below level 13 during the War Within Season 3.)
	Ach(42151):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 14 (Keystones will no longer deplete below level 14 during the War Within Season 3.)
	Ach(42152):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 15 (Keystones will no longer deplete below level 15 during the War Within Season 3.)
	Ach(42153):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 16 (Keystones will no longer deplete below level 16 during the War Within Season 3.)
	Ach(42154):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 17 (Keystones will no longer deplete below level 17 during the War Within Season 3.)
	Ach(42155):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 18 (Keystones will no longer deplete below level 18 during the War Within Season 3.)
	Ach(42156):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 19 (Keystones will no longer deplete below level 19 during the War Within Season 3.)
	Ach(42157):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 20 (Keystones will no longer deplete below level 20 during the War Within Season 3.)
	Ach(42158):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 21 (Keystones will no longer deplete below level 21 during the War Within Season 3.)
	Ach(42159):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 22 (Keystones will no longer deplete below level 22 during the War Within Season 3.)
	Ach(42160):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 23 (Keystones will no longer deplete below level 23 during the War Within Season 3.)
	Ach(42161):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 24 (Keystones will no longer deplete below level 24 during the War Within Season 3.)
	Ach(42162):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 25 (Keystones will no longer deplete below level 25 during the War Within Season 3.)
	Ach(42169):PvE(15), -- The War Within Keystone Explorer: Season Three
	Ach(42170):Title():PvE(15), -- The War Within Keystone Conqueror: Season Three
	Ach(42171):PvE(15), -- The War Within Keystone Hero: Season Three
	Ach(42172):Mount():PvE(15), -- The War Within Keystone Legend: Season Three
	Ach(42173):Teleport():PvE(15), -- Keystone Hero: Eco-Dome Al'dani
	Ach(42174):Title():PvE(15), -- Unbound Hero: The War Within Season Three
	Ach(42190):Mount():PvE(15), -- Let Me Solo Her: Nexus-Princess Ky'veza
	Ach(42191), -- Safer Deposit
	Ach(42193):Transmog():PvE(15), -- My Stab-Happy Nemesis
	Ach(42194):Title():PvE(15), -- Pruning the Princess
	Ach(42196):Other():PvE(15), -- War Within Delves: Tier 4 (Season 3)
	Ach(42197):Other():PvE(15), -- War Within Delves: Tier 5 (Season 3)
	Ach(42198):Other():PvE(15), -- War Within Delves: Tier 6 (Season 3)
	Ach(42199):Other():PvE(15), -- War Within Delves: Tier 7 (Season 3)
	Ach(42200):Other():PvE(15), -- War Within Delves: Tier 8 (Season 3)
	Ach(42201):Other():PvE(15), -- War Within Delves: Tier 9 (Season 3)
	Ach(42202):Other():PvE(15), -- War Within Delves: Tier 10 (Season 3)
	Ach(42203):Title():PvE(15), -- War Within Delves: Tier 11 (Season 3)
	Ach(42316), -- Fractals? For Spring? Groundbreaking.
	Ach(42325):Transmog(), -- Void Wear Prohibited
	Ach(42676), -- Buddy System X
	Ach(42677):PvE(15), -- This Machine Flies?! Don't Care I Got It!
	Ach(42678):PvE(15), -- So That's Where My Manaflux Capacitor Was!
	Ach(42679), -- Archival Assault Discoveries
	Ach(42727), -- K'aresh Glyph Hunter
	Ach(42729), -- Dangerous Prowlers of K'aresh
	Ach(42730), -- Jump, Jump, and Away!
	Ach(42731), -- Become a Hero. Become a Phasediver!
	Ach(42736), -- Ixthar's Legacy
	Ach(42737), -- Capstoned
	Ach(42738), -- We've All Got Swords!
	Ach(42739), -- Sojourner of K'aresh
	Ach(42740), -- Explore K'aresh
	Ach(42741), -- Treasures of K'aresh
	Ach(42742), -- Power of the Reshii
	Ach(42761), -- Remnants of a Shattered World
	Ach(42771), -- Archival Assault Stories
	Ach(42778):PvE(15), -- A Flicker in the Dark
	Ach(42779):Title():PvE(15), -- A Flash in the Void
	Ach(42780), -- Eco-Dome Al'dani
	Ach(42781), -- Heroic: Eco-Dome Al'dani
	Ach(42782), -- Mythic: Eco-Dome Al'dani
	Ach(42799):PvE(15), -- Let Her Solo Me
	Ach(42800), -- Astral Attire
	Ach(42801):PvE(15), -- Journey's End (Season 3)
	Ach(42802):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 26 (Keystones will no longer deplete below level 26 during the War Within Season 3.)
	Ach(42803):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 27 (Keystones will no longer deplete below level 27 during the War Within Season 3.)
	Ach(42804):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 28 (Keystones will no longer deplete below level 28 during the War Within Season 3.)
	Ach(42805):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 29 (Keystones will no longer deplete below level 29 during the War Within Season 3.)
	Ach(42806):KeystoneResilience():PvE(15), -- The War Within Season 3: Resilient Keystone 30 (Keystones will no longer deplete below level 30 during the War Within Season 3.)
	Ach(60889), -- Unraveled and Persevering
	Ach(60890), -- Secrets of the K'areshi
	Ach(60933):AutoFactionSplit(faction.Horde, 60934):Mount():Obtainable("Before", "Version", {11, 2, 5}), -- With Flying Colors
	Ach(60939), -- Bringing Down the House
	Ach(60940), -- Vandals! In! Space!
	Ach(61017):Mount(), -- Phase-Lost-and-Found
	Ach(61092):PvE(15), -- Hard Mode: Tazavesh, the Veiled Market
	Ach(61093):PvE(15), -- Flawless Transaction
	Ach(61342), -- Buddy System IX
	Ach(61401), -- Heroic Edition: Lightwing Dragonhawk
	Ach(61402), -- Epic Edition: Voidlight Surger
}

KrowiAF.AchievementData2["11_02_05"] = {
	{KrowiAF.SetAchievementPatch, 11, 2, 5},
 Ach(42301):Title():Obtainable("Event", 1640), -- Timerunner
	Ach(42312):RemixBronze():Obtainable("Event", 1640), -- Artifact, Remixed
	Ach(42313):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Remixing Time
	Ach(42314):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power
	Ach(42315):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power II
	Ach(42317):Other():Obtainable("Event", 1640), -- Campaign: Azsuna
	Ach(42318):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Court of Farondis
	Ach(42319):Pet():Obtainable("Event", 1640), -- Azsuna
	Ach(42320):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Legion Remix Dungeoneer
	Ach(42321):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Legion Remix Raids
	Ach(42502):RemixBronze():Obtainable("Event", 1640), -- Artifact, Remixed II
	Ach(42503):RemixBronze():Obtainable("Event", 1640), -- Artifact, Remixed III
	Ach(42504):Mount():Obtainable("Event", 1640), -- Timerunner: Paladin
	Ach(42505):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power III
	Ach(42506):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power IV
	Ach(42507):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power V
	Ach(42508):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power VI
	Ach(42509):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power VII
	Ach(42510):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power VIII
	Ach(42511):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power IX
	Ach(42512):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power X
	Ach(42513):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power XI
	Ach(42514):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Unlimited Power XII
	Ach(42515):RemixBronze():Obtainable("Event", 1640), -- Tour Azsuna
	Ach(42516):RemixBronze():Obtainable("Event", 1640), -- Explore Azsuna
	Ach(42517):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Azsuna
	Ach(42518):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Azsuna
	Ach(42519):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Azsuna
	Ach(42526):RemixBronze():Obtainable("Event", 1640), -- Calamir
	Ach(42527):RemixBronze():Obtainable("Event", 1640), -- Levantus
	Ach(42529):RemixBronze():Obtainable("Event", 1640), -- Humongris
	Ach(42530):RemixBronze():Obtainable("Event", 1640), -- Si'vash
	Ach(42531):RemixBronze():Obtainable("Event", 1640), -- Heroic: Emerald Nightmare
	Ach(42533):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Highmountain
	Ach(42534):RemixBronze():Obtainable("Event", 1640), -- Sotanathor
	Ach(42536):RemixBronze():Obtainable("Event", 1640), -- Nithogg
	Ach(42537):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Insurrection
	Ach(42538):RemixBronze():Obtainable("Event", 1640), -- Mistress Alluradel
	Ach(42539):RemixBronze():Obtainable("Event", 1640), -- Broken Isles World Quests II
	Ach(42540):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: The Broken Shore
	Ach(42541):Pet():Obtainable("Event", 1640), -- Highmountain
	Ach(42542):RemixBronze():Obtainable("Event", 1640), -- Drugon the Frostblood
	Ach(42543):RemixBronze():Obtainable("Event", 1640), -- Heroic: The Nighthold
	Ach(42544):RemixBronze():Obtainable("Event", 1640), -- Mythic: The Nighthold
	Ach(42547):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Highmountain Tribe
	Ach(42549):Transmog():Obtainable("Event", 1640), -- Argus
	Ach(42551):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Suramar
	Ach(42552):Other():Obtainable("Event", 1640), -- Campaign: Highmountain
	Ach(42553):RemixBronze():Obtainable("Event", 1640), -- Raid Finder: The Nighthold
	Ach(42554):RemixBronze():Obtainable("Event", 1640), -- Raid Finder: Antorus the Burning Throne
	Ach(42555):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Broken Isles World Quests IV
	Ach(42558):RemixBronze():Obtainable("Event", 1640), -- Raid Finder: Trial of Valor
	Ach(42559):RemixBronze():Obtainable("Event", 1640), -- Ana-Mouz
	Ach(42564):RemixBronze():Obtainable("Event", 1640), -- Tour Suramar
	Ach(42565):RemixBronze():Obtainable("Event", 1640), -- Bringing Order to the Isles
	Ach(42567):RemixBronze():Obtainable("Event", 1640), -- Tour Argus
	Ach(42570):RemixBronze():Obtainable("Event", 1640), -- Broken Isles World Quests III
	Ach(42574):RemixBronze():Obtainable("Event", 1640), -- Matron Folnuna
	Ach(42576):RemixBronze():Obtainable("Event", 1640), -- Mythic: Tomb of Sargeras
	Ach(42578):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Stormheim
	Ach(42581):RemixBronze():Obtainable("Event", 1640), -- Inquisitor Meto
	Ach(42582):Transmog():Obtainable("Event", 1640), -- Stormheim
	Ach(42583):Transmog():Obtainable("Event", 1640), -- Mythic: Antorus the Burning Throne
	Ach(42586):Other():Obtainable("Event", 1640), -- Campaign: Suramar
	Ach(42590):RemixBronze():Obtainable("Event", 1640), -- Tour Stormheim
	Ach(42593):RemixBronze():Obtainable("Event", 1640), -- Pillars of Creation
	Ach(42594):RemixBronze():Obtainable("Event", 1640), -- Tour Val'Sharah
	Ach(42596):Other():Obtainable("Event", 1640), -- Campaign: Stormheim
	Ach(42603):RemixBronze():Obtainable("Event", 1640), -- Raid Finder: Emerald Nightmare
	Ach(42604):RemixBronze():Obtainable("Event", 1640), -- Occularus
	Ach(42605):Transmog():Obtainable("Event", 1640), -- Suramar
	Ach(42610):RemixBronze():Obtainable("Event", 1640), -- The Soultakers
	Ach(42612):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- You Are Now Prepared!
	Ach(42614):RemixBronze():Obtainable("Event", 1640), -- Flotsam
	Ach(42615):RemixBronze():Obtainable("Event", 1640), -- Timeworn Keystone Apprentice
	Ach(42616):RemixBronze():Obtainable("Event", 1640), -- Pit Lord Vilemus
	Ach(42617):Other():Obtainable("Event", 1640), -- Campaign: Val'Sharah
	Ach(42618):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Argus
	Ach(42619):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Dreamweavers
	Ach(42624):RemixBronze():Obtainable("Event", 1640), -- Broken Isles World Quests I
	Ach(42627):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Argussian Reach
	Ach(42628):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- The Nightfallen
	Ach(42629):RemixBronze():Obtainable("Event", 1640), -- Malificus
	Ach(42630):Transmog():Obtainable("Event", 1640), -- Val'Sharah
	Ach(42636):RemixBronze():Obtainable("Event", 1640), -- Mythic: Trial of Valor
	Ach(42637):RemixBronze():Obtainable("Event", 1640), -- Na'zak the Fiend
	Ach(42639):RemixBronze():Obtainable("Event", 1640), -- Heroic: Trial of Valor
	Ach(42642):RemixBronze():Obtainable("Event", 1640), -- Tour Highmountain
	Ach(42643):RemixBronze():Obtainable("Event", 1640), -- Brutallus
	Ach(42647):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Breaching the Tomb
	Ach(42649):RemixBronze():Obtainable("Event", 1640), -- Raid Finder: Tomb of Sargeras
	Ach(42651):RemixBronze():Obtainable("Event", 1640), -- Mythic: Emerald Nightmare
	Ach(42655):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- The Armies of Legionfall
	Ach(42658):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Valarjar
	Ach(42659):RemixBronze():Obtainable("Event", 1640), -- Shar'thos
	Ach(42661):RemixBronze():Obtainable("Event", 1640), -- Heroic: Tomb of Sargeras
	Ach(42662):RemixBronze():Obtainable("Event", 1640), -- Apocron
	Ach(42663):RemixBronze():Obtainable("Event", 1640), -- Looking for Group: Val'Sharah
	Ach(42664):RemixBronze():Obtainable("Event", 1640), -- Heroic: Antorus the Burning Throne
	Ach(42666):Transmog():Obtainable("Event", 1640), -- The Broken Shore
	Ach(42669):RemixBronze():Obtainable("Event", 1640), -- Withered J'im
	Ach(42672):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Defending the Broken Isles II
	Ach(42673):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Defending the Broken Isles I
	Ach(42674):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Broken Isles World Quests V
	Ach(42675):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Defending the Broken Isles III
	Ach(42684):Mount():Obtainable("Event", 1640), -- Timerunner: Warrior
	Ach(42685):Mount():Obtainable("Event", 1640), -- Timerunner: Death Knight
	Ach(42686):Mount():Obtainable("Event", 1640), -- Timerunner: Shaman
	Ach(42687):Mount():Obtainable("Event", 1640), -- Timerunner: Hunter
	Ach(42688):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Timeworn Keystone Adept
	Ach(42689):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Timeworn Keystone Master
	Ach(42690):Transmog():Obtainable("Event", 1640), -- Timeworn Keystone Hero
	Ach(42691):Title():Obtainable("Event", 1640), -- Timeworn Keystone Enthusiast
	Ach(42692):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Broken Isles Dungeoneer
	Ach(42693):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Breaking the Legion I
	Ach(42694):RemixBronze():Obtainable("Event", 1640), -- Breaking the Legion II
	Ach(42695):RemixBronze():Obtainable("Event", 1640), -- Breaking the Legion III
	Ach(42696):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Greater Invasion Points I
	Ach(42697):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Greater Invasion Points II
	Ach(42698):RemixBronze():Obtainable("Event", 1640), -- Greater Invasion Points III
	Ach(42699):RemixBronze():Obtainable("Event", 1640), -- You Were Not Prepared!
	Ach(42807), -- Cloudy With a Chance of Infernals
	Ach(60803):RemixBronze():Obtainable("Event", 1640), -- Explore Highmountain
	Ach(60804):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Highmountain
	Ach(60805):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Highmountain
	Ach(60806):RemixBronze():Obtainable("Event", 1640), -- Explore Stormheim
	Ach(60807):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Stormheim
	Ach(60808):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Stormheim
	Ach(60809):RemixBronze():Obtainable("Event", 1640), -- Explore Val'sharah
	Ach(60810):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Val'sharah
	Ach(60811):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Val'sharah
	Ach(60812):RemixBronze():Obtainable("Event", 1640), -- Explore Suramar
	Ach(60813):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Suramar
	Ach(60814):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Suramar
	Ach(60815):RemixBronze():Obtainable("Event", 1640), -- Explore Broken Shore
	Ach(60816):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Argus
	Ach(60817):Mount():Obtainable("Event", 1640), -- Explore Argus
	Ach(60818):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Argus
	Ach(60819):RemixBronze():Obtainable("Event", 1640), -- Eye of Azshara
	Ach(60820):RemixBronze():Obtainable("Event", 1640), -- Heroic: Eye of Azshara
	Ach(60821):RemixBronze():Obtainable("Event", 1640), -- Mythic: Eye of Azshara
	Ach(60822):RemixBronze():Obtainable("Event", 1640), -- Vault of the Wardens
	Ach(60823):RemixBronze():Obtainable("Event", 1640), -- Heroic: Vault of the Wardens
	Ach(60824):RemixBronze():Obtainable("Event", 1640), -- Mythic: Vault of the Wardens
	Ach(60825):RemixBronze():Obtainable("Event", 1640), -- Neltharion's Lair
	Ach(60826):RemixBronze():Obtainable("Event", 1640), -- Heroic: Neltharion's Lair
	Ach(60827):RemixBronze():Obtainable("Event", 1640), -- Mythic: Neltharion's Lair
	Ach(60828):RemixBronze():Obtainable("Event", 1640), -- Maw of Souls
	Ach(60829):RemixBronze():Obtainable("Event", 1640), -- Heroic: Maw of Souls
	Ach(60830):RemixBronze():Obtainable("Event", 1640), -- Mythic: Maw of Souls
	Ach(60831):RemixBronze():Obtainable("Event", 1640), -- Halls of Valor
	Ach(60832):RemixBronze():Obtainable("Event", 1640), -- Heroic: Halls of Valor
	Ach(60833):RemixBronze():Obtainable("Event", 1640), -- Mythic: Halls of Valor
	Ach(60834):RemixBronze():Obtainable("Event", 1640), -- Black Rook Hold
	Ach(60835):RemixBronze():Obtainable("Event", 1640), -- Heroic: Black Rook Hold
	Ach(60836):RemixBronze():Obtainable("Event", 1640), -- Mythic: Black Rook Hold
	Ach(60837):RemixBronze():Obtainable("Event", 1640), -- Darkheart Thicket
	Ach(60838):RemixBronze():Obtainable("Event", 1640), -- Heroic: Darkheart Thicket
	Ach(60839):RemixBronze():Obtainable("Event", 1640), -- Mythic: Darkheart Thicket
	Ach(60840):RemixBronze():Obtainable("Event", 1640), -- The Arcway
	Ach(60841):RemixBronze():Obtainable("Event", 1640), -- Heroic: The Arcway
	Ach(60842):RemixBronze():Obtainable("Event", 1640), -- Mythic: The Arcway
	Ach(60843):RemixBronze():Obtainable("Event", 1640), -- Court of Stars
	Ach(60844):RemixBronze():Obtainable("Event", 1640), -- Heroic: Court of Stars
	Ach(60845):RemixBronze():Obtainable("Event", 1640), -- Mythic: Court of Stars
	Ach(60846):RemixBronze():Obtainable("Event", 1640), -- Assault on Violet Hold
	Ach(60847):RemixBronze():Obtainable("Event", 1640), -- Heroic: Assault on Violet Hold
	Ach(60848):RemixBronze():Obtainable("Event", 1640), -- Mythic: Assault on Violet Hold
	Ach(60849):RemixBronze():Obtainable("Event", 1640), -- Cathedral of Eternal Night
	Ach(60850):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Heroic: Cathedral of Eternal Night
	Ach(60851):RemixBronze():Obtainable("Event", 1640), -- Mythic: Cathedral of Eternal Night
	Ach(60852):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Heroic: Seat of the Triumvirate
	Ach(60853):RemixBronze():Obtainable("Event", 1640), -- Mythic: Seat of the Triumvirate
	Ach(60854):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Heroic: Return to Karazhan
	Ach(60855):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Mythic: Return to Karazhan
	Ach(60856):RemixBronze():Obtainable("Event", 1640), -- Darkbough
	Ach(60857):RemixBronze():Obtainable("Event", 1640), -- Tormented Guardians
	Ach(60858):RemixBronze():Obtainable("Event", 1640), -- Rift of Aln
	Ach(60859):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- The Emerald Nightmare
	Ach(60860):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Trial of Valor
	Ach(60861):RemixBronze():Obtainable("Event", 1640), -- Arcing Aqueducts
	Ach(60862):RemixBronze():Obtainable("Event", 1640), -- Royal Athenaeum
	Ach(60863):RemixBronze():Obtainable("Event", 1640), -- Nightspire
	Ach(60864):RemixBronze():Obtainable("Event", 1640), -- Betrayer's Rise
	Ach(60865):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- The Nighthold
	Ach(60866):RemixBronze():Obtainable("Event", 1640), -- The Gates of Hell
	Ach(60867):RemixBronze():Obtainable("Event", 1640), -- Wailing Halls
	Ach(60868):RemixBronze():Obtainable("Event", 1640), -- Chamber of the Avatar
	Ach(60869):RemixBronze():Obtainable("Event", 1640), -- Deceiver's Fall
	Ach(60870):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Tomb of Sargeras
	Ach(60871):RemixBronze():Obtainable("Event", 1640), -- Light's Breach
	Ach(60872):RemixBronze():Obtainable("Event", 1640), -- Forbidden Descent
	Ach(60873):RemixBronze():Obtainable("Event", 1640), -- Hope's End
	Ach(60874):RemixBronze():Obtainable("Event", 1640), -- Seat of the Pantheon
	Ach(60875):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Antorus, the Burning Throne
	Ach(60935):Title():Obtainable("Event", 1640), -- Tenured in the Timeways IV
	Ach(60959):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Tenured in the Timeways I
	Ach(60960):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Tenured in the Timeways II
	Ach(60961):RemixBronze():Obtainable("Event", 1640), -- Tenured in the Timeways III
	Ach(61024):Transmog():Obtainable("Event", 1640), -- The Deathless Champion
	Ach(61025):Transmog():Obtainable("Event", 1640), -- The Deathless Marauder
	Ach(61026):Transmog():Obtainable("Event", 1640), -- The Deathless Wanderer
	Ach(61027):Transmog():Obtainable("Event", 1640), -- The Deathless Magus
	Ach(61053):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Legionslayer III
	Ach(61054):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Heroic Broken Isles World Quests III
	Ach(61055):RemixBronze():Obtainable("Event", 1640), -- Power of the Obelisks III
	Ach(61056):RemixBronze():Obtainable("Event", 1640), -- Heroic Broken Isles World Quests II
	Ach(61057):RemixBronze():Obtainable("Event", 1640), -- Heroic Broken Isles World Quests I
	Ach(61058):RemixBronze():Obtainable("Event", 1640), -- Legionslayer II
	Ach(61059):RemixBronze():Obtainable("Event", 1640), -- Legionslayer I
	Ach(61060):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- Power of the Obelisks II
	Ach(61061):RemixBronze():Obtainable("Event", 1640), -- Power of the Obelisks I
	Ach(61070):Transmog():Obtainable("Event", 1640), -- Heroic Broken Isles World Quests IV
	Ach(61071):RemixBronze():Obtainable("Event", 1640), -- Legionslayer IV
	Ach(61072):RemixBronze():Obtainable("Event", 1640), -- Power of the Obelisks IV
	Ach(61073):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Heroic Legion Remix Dungeoneer
	Ach(61074):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Mythic Legion Remix Dungeoneer
	Ach(61075):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Heroic Legion Remix Raider
	Ach(61076):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Broken Isles World Bosses
	Ach(61077):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Argus Invasion Point Bosses
	Ach(61078):Transmog():Obtainable("Event", 1640), -- Mythic Legion Remix Raids
	Ach(61079):Title():Obtainable("Event", 1640), -- Heroic Legion Remix Raids
	Ach(61080):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Broken Shore World Bosses
	Ach(61084):Mount():Obtainable("Event", 1640), -- Timerunner: Rogue
	Ach(61085):Mount():Obtainable("Event", 1640), -- Timerunner: Monk
	Ach(61086):Mount():Obtainable("Event", 1640), -- Timerunner: Druid
	Ach(61087):Mount():Obtainable("Event", 1640), -- Timerunner: Demon Hunter
	Ach(61088):Mount():Obtainable("Event", 1640), -- Timerunner: Priest
	Ach(61089):Mount():Obtainable("Event", 1640), -- Timerunner: Mage
	Ach(61090):Mount():Obtainable("Event", 1640), -- Timerunner: Warlock
	Ach(61103):RemixBronze():Obtainable("Event", 1640), -- Sojourner of Azsuna
	Ach(61104):RemixBronze():Obtainable("Event", 1640), -- Sojourner of Highmountain
	Ach(61105):RemixBronze():Obtainable("Event", 1640), -- Sojourner of Stormheim
	Ach(61106):RemixBronze():Obtainable("Event", 1640), -- Sojourner of Val'Sharah
	Ach(61107):RemixBronze():Obtainable("Event", 1640), -- Sojourner of Suramar
	Ach(61108):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Lorerunner of Azsuna
	Ach(61109):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Lorerunner of Highmountain
	Ach(61110):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Lorerunner of Stormheim
	Ach(61111):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Lorerunner of Val'Sharah
	Ach(61112):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Lorerunner of Suramar
	Ach(61113):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Legion Dungeons: Threats of the Isle
	Ach(61114):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Legion Dungeons: Power of the Ancients
	Ach(61115):RemixInfiniteKnowledge():Obtainable("Event", 1640), -- Legion Dungeons: Might of the Legion
	Ach(61174):RemixBronze():Obtainable("Event", 1640), -- Building a Heroic Army
	Ach(61218):RemixBronze():HousingDecor():Obtainable("Event", 1640), -- The Wardens
	Ach(61323):RemixBronze():Obtainable("Event", 1640), -- Legionslayer V
	Ach(61337):Transmog():Obtainable("Event", 1640), -- To Fel and Back
	Ach(61339):Obtainable("Event", 1640), -- Putting the Finite in Infinite
	Ach(61406):Obtainable("From", "Date", {2025, 11, 16}, "Until", "Date", {2025, 12, 7}), -- WoW's 21st Anniversary
	Ach(61874):PvE(15), -- The Unbound Tank
	Ach(61875):PvE(15), -- The Unbound Healer
	Ach(61876):PvE(15), -- The Unbound Damage Dealer
	Ach(61877):Title():PvE(15), -- The Unbound Dungeon Master
}

KrowiAF.AchievementData2["11_02_07"] = {
	{KrowiAF.SetAchievementPatch, 11, 2, 7},
	Ach(42192), -- Snowball Fight!
	Ach(42270):HousingDecor(), -- The Deathlord's Campaign
	Ach(42271):HousingDecor(), -- The Slayer's Campaign
	Ach(42272):HousingDecor(), -- The Archdruid's Campaign
	Ach(42273):HousingDecor(), -- The Huntmaster's Campaign
	Ach(42274):HousingDecor(), -- The Archmage's Campaign
	Ach(42275):HousingDecor(), -- The Grandmaster's Campaign
	Ach(42276):HousingDecor(), -- The Highlord's Campaign
	Ach(42277):HousingDecor(), -- The High Priest's Campaign
	Ach(42279):HousingDecor(), -- The Shadowblade's Campaign
	Ach(42280):HousingDecor(), -- The Farseer's Campaign
	Ach(42281):HousingDecor(), -- The Netherlord's Campaign
	Ach(42282):HousingDecor(), -- The Battlelord's Campaign
	Ach(42287):HousingDecor(), -- Hidden Potential of the Deathlord
	Ach(42288):HousingDecor(), -- Hidden Potential of the Slayer
	Ach(42289):HousingDecor(), -- Hidden Potential of the Archdruid
	Ach(42290):HousingDecor(), -- Hidden Potential of the Huntmaster
	Ach(42291):HousingDecor(), -- Hidden Potential of the Archmage
	Ach(42292):HousingDecor(), -- Hidden Potential of the Grandmaster
	Ach(42293):HousingDecor(), -- Hidden Potential of the Highlord
	Ach(42294):HousingDecor(), -- Hidden Potential of the High Priest
	Ach(42295):HousingDecor(), -- Hidden Potential of the Shadowblade
	Ach(42296):HousingDecor(), -- Hidden Potential of the Farseer
	Ach(42297):HousingDecor(), -- Hidden Potential of the Netherlord
	Ach(42298):HousingDecor(), -- Hidden Potential of the Battlelord
	Ach(42299), -- Visions of a Shadowed Sun
	-- {51753}, -- Azsuna Matata
	Ach(60962):HousingDecor(), -- Legendary Research of the Ebon Blade
	Ach(60963):HousingDecor(), -- Legendary Research of the Illidari
	Ach(60964):HousingDecor(), -- Legendary Research of the Dreamgrove
	Ach(60965):HousingDecor(), -- Legendary Research of the Unseen Path
	Ach(60966):HousingDecor(), -- Legendary Research of the Tirisgarde
	Ach(60967):HousingDecor(), -- Legendary Research of Five Dawns
	Ach(60968):HousingDecor(), -- Legendary Research of the Silver Hand
	Ach(60969):HousingDecor(), -- Legendary Research of the Netherlight Conclave
	Ach(60970):HousingDecor(), -- Legendary Research of the Uncrowned
	Ach(60971):HousingDecor(), -- Legendary Research of the Maelstrom
	Ach(60972):HousingDecor(), -- Legendary Research of the Black Harvest
	Ach(60973):HousingDecor(), -- Legendary Research of the Valarjar
	Ach(60981):HousingDecor(), -- Raise an Army for Acherus
	Ach(60982):HousingDecor(), -- Raise an Army for the Fel Hammer
	Ach(60983):HousingDecor(), -- Raise an Army for the Dreamgrove
	Ach(60984):HousingDecor(), -- Raise an Army for the Trueshot Lodge
	Ach(60985):HousingDecor(), -- Raise an Army for the Hall of the Guardian
	Ach(60986):HousingDecor(), -- Raise an Army for the Temple of Five Dawns
	Ach(60987):HousingDecor(), -- Raise an Army for the Sanctum of Light
	Ach(60988):HousingDecor(), -- Raise an Army for the Netherlight Temple
	Ach(60989):HousingDecor(), -- Raise an Army for the Hall of Shadows
	Ach(60990):HousingDecor(), -- Raise an Army for the Maelstrom
	Ach(60991):HousingDecor(), -- Raise an Army for the Dreadscar Rift
	Ach(60992):HousingDecor(), -- Raise an Army for Skyhold
	Ach(61211), -- Welcome Home
	Ach(61308), -- Score a Decor
	Ach(61309), -- Amateur Antiquarian
	Ach(61310), -- Casual Collector
	Ach(61311), -- Ready to Remodel
	Ach(61312), -- Center Stager
	Ach(61313), -- Well-Travelled Collection
	Ach(61314), -- Furniture Historian
	Ach(61315), -- Array of Antiquities
	Ach(61316), -- Custom Cabinets
	Ach(61317), -- Domicile Designer
	Ach(61318):Title(), -- Fully Furnished
	Ach(61394):Mount():Obtainable("Event", 1425), -- Master of the Turbulent Timeways IV
	Ach(61413):AutoFactionSplit(faction.Alliance, 61414), -- The First Rule of Brawler's Guild
	Ach(61419), -- Brawler's Chilled
	Ach(61420), -- Let Me Solo It
	Ach(61421), -- A Prime Ordeal
	Ach(61422), -- Audience Participation
	Ach(61423), -- Featherweight Brawler
	Ach(61424), -- Brawlzilla
	Ach(61425), -- Hot Footed
	Ach(61426), -- Bare Knuckle Brawl
	Ach(61429):Title(), -- Brawl Star
	Ach(61451):Mount():HousingDecor(), -- Worldsoul-Searching
	Ach(61466), -- The Best There Is
	Ach(61467):HousingDecor(), -- Lorewalking: The Elves of Quel'thalas
	Ach(61498):Title(), -- Ready for Midnight
	Ach(61516), -- Radiant Singer
	Ach(61683):HousingDecor():IsPvP(), -- Entering Battle
	Ach(61684):HousingDecor():IsPvP(), -- Progressing in Battle
	Ach(61685):HousingDecor():IsPvP(), -- Proficient in Battle
	Ach(61686):HousingDecor():IsPvP(), -- Expert in Battle
	Ach(61687):HousingDecor():IsPvP(), -- Champion in Battle
	Ach(61688):HousingDecor():IsPvP(), -- Master in Battle
}