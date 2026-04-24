local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["12_00_00"] = {
	{KrowiAF.SetAchievementPatch, 12, 0, 0},
	Ach(41287), -- Windrunner Spire
	Ach(41288), -- Heroic: Windrunner Spire
	Ach(41291), -- Mythic: Windrunner Spire
	Ach(41802), -- Eversong In Reprise
	Ach(41803):Other(), -- For Zul'Aman!
	Ach(41804), -- One Does Not Simply Walk Into Harandar
	Ach(41805), -- Arator's Journey
	Ach(41806), -- Breaching the Voidstorm
	Ach(41960), -- Murder Row
	Ach(41961), -- Heroic: Murder Row
	Ach(41962), -- Mythic: Murder Row
	Ach(42045), -- Midnight
	Ach(42117), -- The War of Light and Shadow
	Ach(42278), -- The Empty Cradle
	Ach(42283):Other(), -- Abundance: Azeroth Runs on Dundun
	Ach(42300):Title():Mount():Obtainable("Before", "Version", {12, 0, 1}), -- Two Minutes to Midnight
	Ach(42328):Other(), -- One Warband Mentor: Midnight
	Ach(42329):Other(), -- Two Warband Mentors: Midnight
	Ach(42330):Other(), -- Three Warband Mentors: Midnight
	Ach(42331):Other(), -- Four Warband Mentors: Midnight
	Ach(42332):Other(), -- Five Warband Mentors: Midnight
	Ach(42528):RemixBronze():Obtainable("Event", 1640), -- Explore Highmountain
	Ach(42535):RemixBronze():Obtainable("Event", 1640), -- Explore Eredath
	Ach(42560):RemixBronze():Obtainable("Event", 1640), -- Explore Antoran Wastes
	Ach(42573):RemixBronze():Obtainable("Event", 1640), -- Explore Val'Sharah
	Ach(42575):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Antoran Wastes
	Ach(42577):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Suramar
	Ach(42579):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Highmountain
	Ach(42580):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Val'Sharah
	Ach(42588):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Krokuun
	Ach(42591):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Krokuun
	Ach(42606):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Stormheim
	Ach(42608):RemixBronze():Obtainable("Event", 1640), -- Explore Stormheim
	Ach(42620):RemixBronze():Obtainable("Event", 1640), -- Explore Krokuun
	Ach(42626):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Eredath
	Ach(42631):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Antoran Wastes
	Ach(42634):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Highmountain
	Ach(42640):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Stormheim
	Ach(42646):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Eredath
	Ach(42650):RemixBronze():Obtainable("Event", 1640), -- Elusive Foes: Suramar
	Ach(42665):RemixBronze():Obtainable("Event", 1640), -- Explore Suramar
	Ach(42668):RemixBronze():Obtainable("Event", 1640), -- Hidden Treasures: Val'Sharah
	Ach(42701), -- Prey: Normal Mode III
	Ach(42702), -- Prey: Hard Mode III
	Ach(42703):Mount(), -- Prey: Nightmare Mode III
	Ach(42767):Other():PvE(17), -- Veteran of the Dawn
	Ach(42768):Other():PvE(17), -- Champion of the Dawn
	Ach(42769):Other():PvE(17), -- Hero of the Dawn
	Ach(42770):PvE(17), -- Myth of the Dawn
	Ach(42786):HousingDecor(), -- Leatherworking at Midnight
	Ach(42787):HousingDecor(), -- Enchanting at Midnight
	Ach(42788):HousingDecor(), -- 3
	Ach(42789):HousingDecor(), -- Jewelcrafting at Midnight
	Ach(42790):HousingDecor(), -- Skinning at Midnight
	Ach(42791):HousingDecor(), -- Mining at Midnight
	Ach(42792):HousingDecor(), -- Blacksmithing at Midnight
	Ach(42793):HousingDecor(), -- Herbalism at Midnight
	Ach(42794):HousingDecor(), -- Tailoring at Midnight
	Ach(42795):HousingDecor(), -- Cooking at Midnight
	Ach(42796):HousingDecor(), -- Inscribing at Midnight
	Ach(42797):HousingDecor(), -- Fishing at Midnight
	Ach(42798):HousingDecor(), -- Engineering at Midnight
	Ach(60888), -- Pushing My Buttons
	Ach(60891), -- The Crimson Rogue
	Ach(60942), -- Aquatic Battler of Northrend
	Ach(60943), -- Critter Battler of Northrend
	Ach(60944), -- Dragonkin Battler of Northrend
	Ach(60948), -- Elemental Battler of Northrend
	Ach(60949), -- Flying Battler of Northrend
	Ach(60950), -- Humanoid Battler of Northrend
	Ach(60951), -- Beast Battler of Northrend
	Ach(60952), -- Magic Battler of Northrend
	Ach(60953), -- Mechanical Battler of Northrend
	Ach(60954), -- Undead Battler of Northrend
	Ach(60956):Pet(), -- Family Battler of Northrend
	Ach(61028), -- Undead Battler of Eastern Kingdoms
	Ach(61029), -- Aquatic Battler of Eastern Kingdoms
	Ach(61030), -- Beast Battler of Eastern Kingdoms
	Ach(61031), -- Critter Battler of Eastern Kingdoms
	Ach(61032), -- Dragonkin Battler of Eastern Kingdoms
	Ach(61033), -- Elemental Battler of Eastern Kingdoms
	Ach(61034), -- Flying Battler of Eastern Kingdoms
	Ach(61035), -- Humanoid Battler of Eastern Kingdoms
	Ach(61036), -- Magic Battler of Eastern Kingdoms
	Ach(61037), -- Mechanical Battler of Eastern Kingdoms
	Ach(61040):Pet(), -- Family Battler of Eastern Kingdoms
	Ach(61041), -- Aquatic Battler of Kalimdor
	Ach(61042), -- Beast Battler of Kalimdor
	Ach(61043), -- Critter Battler of Kalimdor
	Ach(61044), -- Dragonkin Battler of Kalimdor
	Ach(61045), -- Elemental Battler of Kalimdor
	Ach(61046), -- Flying Battler of Kalimdor
	Ach(61047), -- Humanoid Battler of Kalimdor
	Ach(61048), -- Magic Battler of Kalimdor
	Ach(61049), -- Mechanical Battler of Kalimdor
	Ach(61050), -- Undead Battler of Kalimdor
	Ach(61051):Pet(), -- Family Battler of Kalimdor
	Ach(61052):Title(), -- Dust 'Em Off
	Ach(61081), -- Share a Drink
	Ach(61082), -- Old Soldiers
	Ach(61083), -- Highly Decorated
	Ach(61091):Pet(), -- Midnight Safari
	Ach(61094):Toy(), -- Old World Family Battler
	Ach(61177):AutoFactionSplit(faction.Alliance, 61178):Title():PvP(41), -- Galactic Marshal / Warlord: Midnight Season 1
	Ach(61179):Title():PvP(41), -- Galactic Legend: Midnight Season 1
	Ach(61180):Title():PvP(41), -- Galactic Gladiator: Midnight Season 1
	Ach(61181):Title():PvP(41), -- Combatant I: Midnight Season 1
	Ach(61182):PvP(41), -- Combatant II: Midnight Season 1
	Ach(61183):Title():PvP(41), -- Challenger I: Midnight Season 1
	Ach(61184):PvP(41), -- Challenger II: Midnight Season 1
	Ach(61185):Title():PvP(41), -- Rival I: Midnight Season 1
	Ach(61186):PvP(41), -- Rival II: Midnight Season 1
	Ach(61187):Title():PvP(41), -- Duelist: Midnight Season 1
	Ach(61188):Title(), -- Gladiator: Midnight Season 1
	Ach(61190):Toy():Title():PvP(41), -- Legend: Midnight Season 1
	Ach(61194):Toy():Title():PvP(41), -- Strategist: Midnight Season 1
	Ach(61195):AutoFactionSplit(faction.Alliance, 61196):PvP(41), -- Hero of the Alliance / Horde: Galactic
	Ach(61197):Title():PvP(41), -- Elite: Midnight Season 1
	Ach(61198):Title():PvP(41), -- Battle Mender: Midnight Season 1
	Ach(61199):Toy():PvP(41), -- Solo Shuffle Medic: Midnight
	Ach(61200):Toy():PvP(41), -- Battleground Blitz Medic: Midnight
	Ach(61212), -- Magisters' Terrace
	Ach(61213), -- Heroic: Magisters' Terrace
	Ach(61214), -- Mythic: Magisters' Terrace
	Ach(61219), -- No Time to Paws
	Ach(61221), -- Tour of Duty: Eversong Woods
	Ach(61222), -- Tour of Duty: Zul'Aman
	Ach(61223), -- Tour of Duty: Harandar
	Ach(61224), -- Tour of Duty: Voidstorm
	Ach(61225):IsPvP(), -- Investigating the Rise
	Ach(61226):IsPvP(), -- Uprising
	Ach(61227):IsPvP(), -- Entering the Void
	Ach(61228):IsPvP(), -- Embracing the Void
	Ach(61229):IsPvP(), -- Dedication in the Void
	Ach(61230):IsPvP(), -- Remains in the Rise
	Ach(61231):IsPvP(), -- Midnight Loot
	Ach(61232):IsPvP(), -- Midnight Treasures
	Ach(61233):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 12
	Ach(61234):IsPvP(), -- Hunt in the Night
	Ach(61235):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 13
	Ach(61236):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 14
	Ach(61237):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 15
	Ach(61238):IsPvP(), -- Midnight Hunter
	Ach(61239):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 16
	Ach(61240):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 17
	Ach(61241):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 18
	Ach(61242):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 19
	Ach(61243):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 20
	Ach(61244):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 21
	Ach(61245):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 22
	Ach(61246):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 23
	Ach(61247):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 24
	Ach(61248):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 25
	Ach(61249):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 26
	Ach(61250):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 27
	Ach(61251):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 28
	Ach(61252):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 29
	Ach(61253):KeystoneResilience():PvE(17), -- Midnight Season 1: Resilient Keystone 30
	Ach(61254):PvE(17), -- Midnight Keystone Explorer: Season One
	Ach(61255):Title():PvE(17), -- Midnight Keystone Conqueror: Season One
	Ach(61256):Mount():PvE(17), -- Midnight Keystone Master: Season One
	Ach(61257):PvE(17), -- Midnight Keystone Hero: Season One
	Ach(61258):Mount():PvE(17), -- Midnight Keystone Legend: Season One
	Ach(61259):Title():PvE(17), -- Umbral Hero: Midnight Season One
	Ach(61262):Teleport():PvE(17), -- Keystone Hero: Windrunner Spire
	Ach(61263):Mount(), -- Treasures of Harandar
	Ach(61264), -- Leaf None Behind
	Ach(61265):IsPvP(), -- Spectral Capture
	Ach(61266):IsPvP(), -- Spectral Stocker
	Ach(61267):Teleport():PvE(17), -- Keystone Hero: Magisters' Terrace
	Ach(61268):Teleport():PvE(17), -- Keystone Hero: Nexus-Point Xenas
	Ach(61269):Teleport():PvE(17), -- Keystone Hero: Maisara Caverns
	Ach(61270):Teleport():PvE(17), -- Keystone Hero: Seat of the Triumvirate
	Ach(61271):Teleport():PvE(17), -- Keystone Hero: Pit of Saron
	Ach(61272):Teleport():PvE(17), -- Keystone Hero: Skyreach
	Ach(61344):Title(), -- Chronicler of the Haranir
	Ach(61346), -- We Will, In Fact, See It Again
	Ach(61366), -- The Voidspire
	Ach(61367), -- March on Quel'Danas
	Ach(61368), -- Heroic: The Voidspire
	Ach(61369), -- Heroic: March on Quel'Danas
	Ach(61370), -- Mythic: The Voidspire
	Ach(61371), -- Mythic: March on Quel'Danas
	Ach(61372), -- Mythic: Imperator Averzian
	Ach(61373), -- Mythic: Vorasius
	Ach(61374), -- Mythic: Fallen-King Salhadaar
	Ach(61375), -- Mythic: Vaelgor & Ezzorak
	Ach(61376), -- Mythic: Lightblinded Vanguard
	Ach(61377):Title(), -- Mythic: Crown of the Cosmos
	Ach(61378), -- Mythic: Belo'ren, Child of Al'ar
	Ach(61379):Title(), -- Mythic: Midnight Falls
	Ach(61380):Mount(), -- Glory of the Midnight Raider
	Ach(61381), -- Eggsistential Crisis
	Ach(61386), -- Prey: Normal Mode II
	Ach(61387), -- Prey: Normal Mode I
	Ach(61388), -- Prey: Hard Mode II
	Ach(61389), -- Prey: Hard Mode I
	Ach(61391), -- Prey: Nightmare Mode II
	Ach(61392), -- Prey: Nightmare Mode I
	Ach(61430):Obtainable("Before", "Version", {12, 0, 1}), -- Crunching for Cultists
	Ach(61438), -- Thalassian Profession Master
	Ach(61439), -- Thalassian Artisan
	Ach(61440):Transmog(), -- Thalassian Polymath
	Ach(61441), -- Working WAY Past Midnight
	Ach(61443):Transmog():PvP(41), -- Galactic Weapons of Conquest
	Ach(61446):Title():IsPvP(), -- Slayer's Mastery
	Ach(61447):IsPvP(), -- Partake in the Rise
	Ach(61448):IsPvP(), -- Frequent the Rise
	Ach(61449):IsPvP(), -- Customary Rise
	Ach(61450):IsPvP(), -- Galactic Gladiator's Goredrake
	Ach(61452), -- Sojourner of Zul'Aman
	Ach(61453), -- Making an Amani Out of You
	Ach(61454), -- Falling Between The Quacks
	Ach(61455), -- Shadowpine Scattered
	Ach(61464):IsPvP(), -- Spark in the Night
	Ach(61465):IsPvP(), -- Spark in the Night
	Ach(61487), -- Chimaerus, the Undreamt God
	Ach(61488), -- Heroic: Chimaerus, the Undreamt God
	Ach(61489):Title(), -- Mythic: Chimaerus, the Undreamt God
	Ach(61490):Transmog(), -- Midnight Season 1: Champion of the Dawn
	Ach(61491), -- Ahead of the Curve: Chimaerus, the Undreamt God
	Ach(61492), -- Cutting Edge: Chimaerus, the Undreamt God
	Ach(61506):AlliedRace(), -- Allied Race: Haranir
	Ach(61507), -- A Bloody Song
	Ach(61508), -- Voidscar Arena
	Ach(61509), -- Heroic: Voidscar Arena
	Ach(61510), -- Mythic: Voidscar Arena
	Ach(61514), -- It's Treason Then
	Ach(61519):Transmog():PvE(17), -- Midnight Season 1: Catalyst Unbound
	Ach(61520), -- Explore Harandar
	Ach(61565):Pet(), -- War Within Dungeon Hero
	Ach(61566), -- Glory of the War Within Hero
	Ach(61567):Pet(), -- Midnight Dungeon Hero
	Ach(61568), -- Glory of the Midnight Hero
	Ach(61574):HousingDecor(), -- Legends Never Die
	Ach(61576), -- Eversong Woods Glyph Hunter
	Ach(61581), -- Zul'Aman Glyph Hunter
	Ach(61582), -- Harandar Glyph Hunter
	Ach(61583), -- Voidstorm Glyph Hunter
	Ach(61584), -- Midnight Glyph Hunter
	Ach(61585), -- You Conduit!
	Ach(61586):IsPvP(), -- Galactic Gala
	Ach(61587):PvE(17), -- Keystone Victor: Magisters' Terrace (Midnight)
	Ach(61588):PvE(17), -- Keystone Victor: Maisara Caverns
	Ach(61589):PvE(17), -- Keystone Victor: Nexus-Point Xenas
	Ach(61590):PvE(17), -- Keystone Victor: Windrunner Spire
	Ach(61591):PvE(17), -- Keystone Victor: Algeth'ar Academy
	Ach(61592):PvE(17), -- Keystone Victor: Pit of Saron
	Ach(61593):PvE(17), -- Keystone Victor: Seat of the Triumvirate
	Ach(61594):PvE(17), -- Keystone Victor: Skyreach
	Ach(61624), -- Ahead of the Curve: Crown of the Cosmos
	Ach(61625), -- Cutting Edge: Crown of the Cosmos
	Ach(61626), -- Ahead of the Curve: Midnight Falls
	Ach(61627), -- Cutting Edge: Midnight Falls
	Ach(61635), -- Voidspire: Weapons of the Void
	Ach(61636), -- Voidspire: Fanatics of the Light
	Ach(61637), -- Voidspire: Crown of the Cosmos
	Ach(61638), -- Den of Nalorakk
	Ach(61639), -- Maisara Caverns
	Ach(61640), -- Nexus-Point Xenas
	Ach(61641), -- The Blinding Vale
	Ach(61642), -- Heroic: Den of Nalorakk
	Ach(61643), -- Mythic: Den of Nalorakk
	Ach(61644), -- Heroic: Maisara Caverns
	Ach(61645), -- Mythic: Maisara Caverns
	Ach(61646), -- Heroic: Nexus-Point Xenas
	Ach(61647), -- Mythic: Nexus-Point Xenas
	Ach(61648), -- Heroic: The Blinding Vale
	Ach(61649), -- Mythic: The Blinding Vale
	Ach(61678), -- Midnight Superior
	Ach(61679), -- Midnight Epic
	Ach(61681):Other(), -- Abundance: You Should See Him in a Crown
	Ach(61706), -- Herald of the Goddess
	Ach(61707), -- Delver of the Depths: Midnight
	Ach(61708), -- Delver of the Depths II: Midnight
	Ach(61709), -- Delver of the Depths III: Midnight
	Ach(61710), -- Delver of the Depths IV: Midnight
	Ach(61711), -- Midnight Delver Damage Dealer
	Ach(61712), -- Midnight Delver Damage Dealer II
	Ach(61713), -- Midnight Delver Damage Dealer III
	Ach(61714), -- Midnight Delver Healer
	Ach(61715), -- Midnight Delver Healer II
	Ach(61716), -- Midnight Delver Healer III
	Ach(61717), -- Midnight Delver Tank
	Ach(61718), -- Midnight Delver Tank II
	Ach(61719), -- Midnight Delver Tank III
	Ach(61720), -- Midnight Delver
	Ach(61721):Transmog(), -- Midnight Delver II
	Ach(61722), -- Curio Enthusiast: Midnight
	Ach(61723), -- Curio Fanatic: Midnight
	Ach(61724), -- The Grudge Pit Stories
	Ach(61725), -- Parhelion Plaza Stories
	Ach(61726), -- Collegiate Calamity Stories
	Ach(61727), -- The Shadow Enclave Stories
	Ach(61728), -- The Darkway Stories
	Ach(61729), -- Atal'Aman Stories
	Ach(61730), -- Twilight Crypts Stories
	Ach(61731), -- The Gulf of Memory Stories
	Ach(61732), -- Sunkiller Sanctum Stories
	Ach(61733), -- Shadowguard Point Stories
	Ach(61734), -- Midnight Delves: Endgame
	Ach(61739), -- Sojourner of Harandar
	Ach(61741), -- Delve Loremaster: Midnight
	Ach(61796):PvE(17), -- Midnight: Journey's End (Season 1)
	Ach(61797):Transmog(), -- My Shady Nemesis
	Ach(61798):Title():PvE(17), -- Lighting the Dark
	Ach(61799):Mount():PvE(17), -- Let Me Solo Him: Nullaeus
	Ach(61800):PvE(17), -- Midnight Delves: Tier 4 (Season 1)
	Ach(61801):PvE(17), -- Midnight Delves: Tier 5 (Season 1)
	Ach(61802):PvE(17), -- Midnight Delves: Tier 6 (Season 1)
	Ach(61803):PvE(17), -- Midnight Delves: Tier 7 (Season 1)
	Ach(61804):PvE(17), -- Midnight Delves: Tier 8 (Season 1)
	Ach(61805):PvE(17), -- Midnight Delves: Tier 9 (Season 1)
	Ach(61806):PvE(17), -- Midnight Delves: Tier 10 (Season 1)
	Ach(61807):Title():PvE(17), -- Midnight Delves: Tier 11 (Season 1)
	Ach(61808):Title():PvE(17), -- Fabled Let Me Solo Him: Nullaeus
	Ach(61809):PvE(17), -- Adventurer of the Dawn
	Ach(61832), -- Midnight Delves: Tier 1
	Ach(61835), -- Midnight Delves: Tier 2
	Ach(61836), -- Midnight Delves: Tier 3
	Ach(61839):Transmog(), -- Midnight Pathfinder
	Ach(61843), -- Quel'Dressed
	Ach(61854), -- The Midnight Explorer
	Ach(61855), -- Explore Eversong Woods
	Ach(61856), -- Explore Zul'Aman
	Ach(61857), -- Explore Voidstorm
	Ach(61858):Transmog(), -- Light of the Party
	Ach(61859), -- Midnight Flight Master
	Ach(61860), -- From The Cradle to the Grave
	Ach(61861), -- Oh, No You Don't!
	Ach(61863), -- Atal'Aman Discoveries
	Ach(61864), -- Sojourner of Voidstorm
	Ach(61892), -- The Shadow Enclave Discoveries
	Ach(61893), -- Parhelion Plaza Discoveries
	Ach(61894), -- Collegiate Calamity Discoveries
	Ach(61895), -- The Darkway Discoveries
	Ach(61896), -- Twilight Crypts Discoveries
	Ach(61897), -- The Grudge Pit Discoveries
	Ach(61898), -- The Gulf of Memory Discoveries
	Ach(61899), -- Sunkiller Sanctum Discoveries
	Ach(61900), -- Shadowguard Point Discoveries
	Ach(61901):Title(), -- Midnight: Leave No Treasure Unfound
	Ach(61906):Mount(), -- Glory of the Midnight Delver
	Ach(61910), -- Mrglgrgl of Grglmrgl
	Ach(61911), -- Ready, Set, Snap!
	Ach(61912), -- Anchoring the Defense
	Ach(61913), -- A Singular Problem
	Ach(61916):Other(), -- Rage of the Ren'dorei
	Ach(61917), -- "Hold aggro, I got this"
	Ach(61922), -- Ninety Percent is Good Enough
	Ach(61936), -- Aura Farming
	Ach(61937), -- Abundance: Artisan of Mausoloa
	Ach(61938), -- Abundance: Artisan of Loaknit
	Ach(61939), -- Abundance: Artisan of Floaret
	Ach(61940), -- Abundance: Artisan of Loanite
	Ach(61941), -- Abundance: Acolyte of a Glorious Entity
	Ach(61942):Transmog(), -- Heritage of the Haranir
	Ach(61943), -- Abundance: Prosperous Plentitude!
	Ach(61953):IsPvP(), -- Putting in the Practice
	Ach(61954):IsPvP(), -- Putting in the Practice
	Ach(61955):IsPvP(), -- Putting in the Practice
	Ach(61956):IsPvP(), -- Putting in the Practice
	Ach(61957), -- Sojourner of Eversong Woods
	Ach(61958):AutoFactionSplit(faction.Alliance, 61959):IsPvP(), -- Focused Target
	Ach(61960), -- Treasures of Eversong Woods
	Ach(61961), -- Runestone Rush
	Ach(62057), -- Midnight: The Highest Peaks
	Ach(62058), -- Hungry Hungry Hatchlings
	Ach(62096):AutoFactionSplit(faction.Horde, 62103):Mount(), -- Insurmountable Collection
	Ach(62104), -- Midnight Lore Hunter
	Ach(62105), -- Lysikas Would Be Proud
	Ach(62106), -- The Only Winning Move Is Not To Play
	Ach(62107):IsPvP(), -- Mandatory Training
	Ach(62108):IsPvP(), -- Training with Patience
	Ach(62109):IsPvP(), -- Training with Patience
	Ach(62110):Transmog(), -- Loremaster of Midnight
	Ach(62111):IsPvP(), -- Boots on the Ground: Arathi Basin
	Ach(62112):IsPvP(), -- Boots on the Ground: Battle for Gilneas
	Ach(62113):IsPvP(), -- Boots on the Ground: Silvershard Mines
	Ach(62114):IsPvP(), -- Learning the Landscape: Arathi Basin
	Ach(62115):IsPvP(), -- Learning the Landscape: Battle for Gilneas
	Ach(62116):IsPvP(), -- Learning the Landscape: Silvershard Mines
	Ach(62117):Other(), -- Abyss Anglers: Boarhide Catch Sack
	Ach(62118):Other(), -- Abyss Anglers: Amazardhide Catch Case
	Ach(62119):Other(), -- Abyss Anglers: Loaknit-Woven Catch Satchel
	Ach(62120), -- Altar of Blessings: The Penitent Troll
	Ach(62121), -- Altar of Blessings: Sacred Buffet Devotee
	Ach(62122), -- Tallest Tree in the Forest
	Ach(62125), -- Treasures of Zul'Aman
	Ach(62126), -- Treasures of Voidstorm
	Ach(62130), -- The Ultimate Predator
	Ach(62133), -- Thrill of the Chase
	Ach(62134):IsPvP(), -- The Deadliest of Prey
	Ach(62135):IsPvP(), -- Now It's A Party
	Ach(62136):IsPvP(), -- I'm Good At What I Do
	Ach(62137), -- I'm Not Trapped In Here With You
	Ach(62138), -- You're Trapped In Here With Me
	Ach(62139), -- Midnight Hunter
	Ach(62140), -- Kitchen Nightmare
	Ach(62141), -- Look, I'm Just Trying To Fish Here
	Ach(62142), -- I Didn't Hear No Bell
	Ach(62143), -- Trapped In The Middle With You
	Ach(62144):HousingDecor(), -- Prey: Mad Magisters (Hard)
	Ach(62153):HousingDecor(), -- Prey: Insane Inventors (Hard)
	Ach(62154):HousingDecor(), -- Prey: A Different Kind of Void (Hard)
	Ach(62155):HousingDecor(), -- Prey: Ethereal Assassins (Hard)
	Ach(62156):HousingDecor(), -- Prey: Anger Management (Hard)
	Ach(62157):HousingDecor(), -- Prey: Sadistic Shamans (Hard)
	Ach(62158):HousingDecor(), -- Prey: The Fallen Farstriders (Hard)
	Ach(62159):HousingDecor(), -- Prey: Bloody Green Thumbs (Hard)
	Ach(62160):HousingDecor(), -- Prey: Blinded By The Light (Hard)
	Ach(62161):HousingDecor(), -- Prey: Outsmarting the Schemers (Hard)
	Ach(62162):HousingDecor(), -- Prey: Dominating the Void (Hard)
	Ach(62163):HousingDecor(), -- Prey: Chasing Death (Hard)
	Ach(62164):HousingDecor(), -- Prey: No Rest for the Wretched (Hard)
	Ach(62165):HousingDecor(), -- Prey: A Thorn in the Side (Hard)
	Ach(62166):HousingDecor(), -- Prey: Breaking the Blade (Hard)
	Ach(62167):HousingDecor(), -- Prey: Mad Magisters (Nightmare)
	Ach(62168):HousingDecor(), -- Prey: Insane Inventors (Nightmare)
	Ach(62169):HousingDecor(), -- Prey: A Different Kind of Void (Nightmare)
	Ach(62173):HousingDecor(), -- Prey: Ethereal Assassins (Nightmare)
	Ach(62174):HousingDecor(), -- Prey: Anger Management (Nightmare)
	Ach(62175):HousingDecor(), -- Prey: Sadistic Shamans (Nightmare)
	Ach(62176):HousingDecor(), -- Prey: The Fallen Farstriders (Nightmare)
	Ach(62177):HousingDecor(), -- Prey: Bloody Green Thumbs (Nightmare)
	Ach(62178):HousingDecor(), -- Prey: Blinded By The Light (Nightmare)
	Ach(62179):HousingDecor(), -- Prey: Outsmarting the Schemers (Nightmare)
	Ach(62180):HousingDecor(), -- Prey: Dominating the Void (Nightmare)
	Ach(62181):HousingDecor(), -- Prey: Chasing Death (Nightmare)
	Ach(62182):HousingDecor(), -- Prey: No Rest for the Wretched (Nightmare)
	Ach(62183):HousingDecor(), -- Prey: A Thorn in the Side (Nightmare)
	Ach(62184):HousingDecor(), -- Prey: Breaking the Blade (Nightmare)
	Ach(62185):HousingDecor(), -- Ever Painting
	Ach(62186), -- The Party Must Go On
	Ach(62187), -- Grand Magister's Sommelier
	Ach(62188), -- More Than Just Their Roots
	Ach(62189), -- Mind-Seeker
	Ach(62190), -- Life of the Party
	Ach(62191), -- Call of the Light
	Ach(62192):Transmog(), -- Midnight Diplomat
	Ach(62193), -- Midnight Dungeon Damage Dealer
	Ach(62194), -- Midnight Dungeon Healer
	Ach(62195), -- Midnight Dungeon Tank
	Ach(62196):Transmog(), -- Midnight Dungeoneer
	Ach(62199), -- Put a Pin in It
	Ach(62200), -- Gnome Alone
	Ach(62201), -- The Frog and the Princesses
	Ach(62202), -- Spiritpaw Marathon
	Ach(62206), -- Midnight Delver III
	Ach(62207):Other(), -- Abyss Anglers: Reinforced Joints
	Ach(62208):Other(), -- Abyss Anglers: Depth Grease
	Ach(62209):Other(), -- Abyss Anglers: Pahk Trench Fins
	Ach(62210):Other(), -- Abyss Anglers: Depthdiver's Used Tank
	Ach(62211):Other(), -- Abyss Anglers: Fathom-Tested Tank
	Ach(62212):Other(), -- Abyss Anglers: Nalorakk's Breath Tank
	Ach(62213):Other(), -- Abyss Anglers: Shallows Net
	Ach(62214):Other(), -- Abyss Anglers: Triple-Thread Net
	Ach(62215):Other(), -- Abyss Anglers: Heavy Harpoon Cannon
	Ach(62216):Other(), -- Abyss Anglers: Hollowcore Harpoon Turret
	Ach(62217):Other(), -- Abyss Anglers: Idol of the Depths
	Ach(62218), -- Abyss Anglers: Even The Best
	Ach(62219), -- Abyss Anglers: No Sea Can Hold Me
	Ach(62220), -- Abyss Anglers: Proper Procedure
	Ach(62221), -- Abyss Anglers: Fresh Depth Tech
	Ach(62222), -- Abyss Anglers: The Amani Way
	Ach(62223), -- Alchemy-on-Demand
	Ach(62232), -- Blacksmithing-on-Demand
	Ach(62233), -- Enchanting-on-Demand
	Ach(62234), -- Engineering-on-Demand
	Ach(62235), -- Inscription-on-Demand
	Ach(62236), -- Jewelcrafting-on-Demand
	Ach(62237), -- Leatherworking-on-Demand
	Ach(62238), -- Tailoring-on-Demand
	Ach(62239):Title(), -- Dedicated to the Craft: Alchemy
	Ach(62240):Title(), -- Dedicated to the Craft: Blacksmithing
	Ach(62241):Title(), -- Dedicated to the Craft: Enchanting
	Ach(62242):Title(), -- Dedicated to the Craft: Engineering
	Ach(62243):Title(), -- Dedicated to the Craft: Inscription
	Ach(62244):Title(), -- Dedicated to the Craft: Jewelcrafting
	Ach(62245):Title(), -- Dedicated to the Craft: Leatherworking
	Ach(62246):Title(), -- Dedicated to the Craft: Tailoring
	Ach(62247), -- Herbalism-on-Demand
	Ach(62248), -- Mining-on-Demand
	Ach(62249), -- Skinning-on-Demand
	Ach(62250):Title(), -- Dedicated to the Craft: Herbalism
	Ach(62251):Title(), -- Dedicated to the Craft: Mining
	Ach(62252):Title(), -- Dedicated to the Craft: Skinning
	Ach(62256), -- Yelling into the Voidstorm
	Ach(62260), -- That's Aln, Folks!
	Ach(62261), -- Forever Song
	Ach(62262), -- Silvermoon Court Champion
	Ach(62263), -- Amani Tribe Champion
	Ach(62264), -- Hara'ti Champion
	Ach(62265), -- The Singularity Champion
	Ach(62266):Other(), -- Abundance: An Acolyte no Longer
	Ach(62267), -- A Most Violent Loa
	Ach(62268):Other(), -- Abundance: Professionals Only
	Ach(62269), -- Altar of Blessings: Amani Curious
	Ach(62270), -- Altar of Blessings: One for Altar
	Ach(62271), -- Abyss Anglers: Trench Berserker
	Ach(62272), -- Abyss Anglers: Certified Depthdiver
	Ach(62273):NotCategorized(), -- Echoes of Midnight
	Ach(62288):HousingDecor(), -- Eversong Woods: The Highest Peaks
	Ach(62289):HousingDecor(), -- Zul'Aman: The Highest Peaks
	Ach(62290):HousingDecor(), -- Harandar: The Highest Peaks
	Ach(62291):HousingDecor(), -- Voidstorm: The Highest Peaks
	Ach(62324), -- Abundance: Loa of all Trades
	Ach(62325), -- Abundance: Treasures Aplenty
	Ach(62326), -- Abundance: Golden Opportunities
	Ach(62329), -- Abundance: Squash the Competition
	Ach(62330), -- Abundance: One Bite at a Time
	Ach(62331), -- Abundance: Drops of Prosperity
	Ach(62332), -- Abundance: Dundun's Favored
	Ach(62333), -- Abundance: Harvester
	Ach(62336), -- Abundance: Contributer
	Ach(62337), -- Abundance: Professional
	Ach(62338), -- Abundance: Artisan
	Ach(62339), -- Abundance: Gambler
	Ach(62340), -- Abundance: Investor
	Ach(62341), -- Abundance: Ain't Dun Till It's Dun
	Ach(62351):Title(), -- Preying For Midnight
	Ach(62352), -- Nothing to See Here
	Ach(62357):NotCategorized(), -- Classically Trained Lumberjack
	Ach(62358):NotCategorized(), -- Outlandish Lumberjack
	Ach(62359):NotCategorized(), -- Wrathful Lumberjack
	Ach(62360):NotCategorized(), -- Cataclysmic Lumberjack
	Ach(62361):NotCategorized(), -- Mist-Shrouded Lumberjack
	Ach(62362):NotCategorized(), -- Lumberjack Warlord
	Ach(62363):NotCategorized(), -- Legion Lumberjack
	Ach(62364):NotCategorized(), -- Azeroth's Lumberjack
	Ach(62365):NotCategorized(), -- Shadowy Lumberjack
	Ach(62366):NotCategorized(), -- Draconic Lumberjack
	Ach(62369):NotCategorized(), -- The Lumberjack Within
	Ach(62370):NotCategorized(), -- Midnight Lumberjack
	Ach(62371), -- Couponing for Beginners
	Ach(62373), -- Coupon Collector
	Ach(62374), -- You Get The Best Deals Anywhere
	Ach(62375), -- Buying in Bulk
	Ach(62376), -- Extreme Couponing
	Ach(62377), -- A Fist Full of Coupons
	Ach(62378), -- A Few Coupons More
	Ach(62383), -- Gotta Hunt Them All
	Ach(62385):Mount(), -- Staring Into The Void
	Ach(62386):Mount(), -- Light Up the Night
	Ach(62387):HousingDecor():Obtainable("Before", "Version", {12, 0, 1}), -- It's Nearly Midnight
	Ach(62388):Toy(), -- Illicit Rain: Five Stars
	Ach(62400), -- Craft Your World
	Ach(62403), -- 'Tis But A Scratch
	Ach(62406), -- All the Things She Said
	Ach(62493):IsPvP(), -- Slayer's Rise Victory
	Ach(62494):IsPvP(), -- Slayer's Rise Veteran
	Ach(62514):IsPvP(), -- Slayer's Rise Dominance
	Ach(62516):IsPvP(), -- The Voided Gazelle
	Ach(62517):IsPvP(), -- Rise of the Ultradon Slayer
}

KrowiAF.AchievementData2["12_00_05"] = {
	{KrowiAF.SetAchievementPatch, 12, 0, 5},
	Ach(61792), -- T-A-G that spells "Gotcha!"
	Ach(61793), -- Deployed to the Void
	Ach(61878), -- Tagged and Bagged
	Ach(61879), -- You're It
	Ach(61880), -- It's Cold Here in This Shadow
	Ach(61881), -- Hide and Peekless
	Ach(61882), -- Null and Avoided
	Ach(61883), -- Now You Don't See Me...
	Ach(61886), -- The Whole Kit and Caboodle
	Ach(61887), -- Disguised to the Nines
	Ach(62342), -- Abyss Anglers: The Finest of Fish
	Ach(62343), -- Abyss Anglers: Myths from Beneath
	Ach(62450), -- Ritual Sites 101: An Introduction to Basic Magical Rituals
	Ach(62451), -- Ritual Sites 200: Intermediate Ritual Practices
	Ach(62452), -- Ritual Sites 320: Ritual Items and Their Uses in Quel'Thalas
	Ach(62453), -- Ritual Sites 415: Applied Ritual Strategies
	Ach(62454), -- Ritual Sites 505: A Seminar in Void Ritual Nuance
	Ach(62498), -- Void Assault: Eversong
	Ach(62499), -- Void Assault: Zul'Aman
	Ach(62506):Other(), -- Abyss Anglers: Pressurized Eyeglass
	Ach(62507), -- Void Smasher: Eversong
	Ach(62508), -- Void Eradicator: Eversong
	Ach(62509), -- Void Bane: Eversong
	Ach(62510), -- Void Smasher: Zul'Aman
	Ach(62511), -- Void Eradicator: Zul'Aman
	Ach(62512), -- Void Bane: Zul'Aman
	Ach(62513), -- Outstanding in the Field
	Ach(62518):Pet(), -- Cosmic Exterminator
	Ach(62521), -- Ritual Site: Broken Throne
	Ach(62522), -- Ritual Site: Daggerspine Point
	Ach(62523), -- Ritual Site Mastery: Broken Throne
	Ach(62524), -- Ritual Site Challenge: Broken Throne
	Ach(62525), -- Ritual Site Extreme: Broken Throne
	Ach(62526), -- Ritual Site Mastery: Daggerspine Point
	Ach(62527), -- Ritual Site Challenge: Daggerspine Point
	Ach(62528), -- Ritual Site Extreme: Daggerspine Point
	Ach(62529), -- Ritual Site Starter
	Ach(62530), -- Ritual Site Achiever
	Ach(62531), -- Ritual Site Adept
	Ach(62532), -- Ritual Site Handler
	Ach(62533), -- Ritual Site Master
	Ach(62534), -- Ritual Site Rogue: Broken Throne
	Ach(62535), -- Ritual Site Rogue: Daggerspine Point
	Ach(62536), -- Neighborhood Ritual Watch: Broken Throne
	Ach(62537), -- Neighborhood Ritual Team: Broken Throne
	Ach(62538), -- Neighborhood Ritual Watch: Daggerspine Point
	Ach(62539), -- Neighborhood Ritual Team: Daggerspine Point
	Ach(62540), -- Challenge: Tendrils
	Ach(62541), -- Challenge: Tainted Corpses
	Ach(62542), -- Challenge: Manifestations
	Ach(62543), -- Challenge: Patrols!
	Ach(62544), -- Challenge: Magical Alarm Bells
	Ach(62545), -- Challenge: Malevolent Boons
	Ach(62546), -- Challenge: Reinforced
	Ach(62547), -- Challenge: Embers
	Ach(62548), -- Expert Challenge: Tendrils
	Ach(62549), -- Expert Challenge: Tainted Corpses
	Ach(62550), -- Expert Challenge: Manifestations
	Ach(62551), -- Expert Challenge: Patrols!
	Ach(62552), -- Expert Challenge: Magical Alarm Bells
	Ach(62553), -- Expert Challenge: Malevolent Boons
	Ach(62554), -- Expert Challenge: Reinforced
	Ach(62555), -- Expert Challenge: Embers
	Ach(62556), -- Quick Reflexes
	Ach(62558), -- Patrol Ambusher
	Ach(62559), -- Malevolence Shrugged
	Ach(62560), -- Ember Still Burning
	Ach(62561), -- Reinforcement Obliteration
	Ach(62562), -- Ritual Site Disruptor
	Ach(62563):Mount(), -- Void Response Team
	Ach(62568), -- Void Shmoid
	Ach(62569), -- Traces in the Dark
	Ach(62570), -- Cosmic Slayer
	Ach(62571), -- Everybody Gets One
	Ach(62572), -- Battery Bombardment
	Ach(62573), -- Air Traffic Controller
	Ach(62574), -- Accolade to Rest
	Ach(62621), -- Challenging Sites
	Ach(62622), -- Ritual Renown
	Ach(62759), -- Abyss Anglers: History Below
	Ach(62760), -- Abyss Anglers: Angler Physics
	Ach(62761), -- Abyss Anglers: One with the Depths
	Ach(62762), -- Abyss Anglers: Top of the Class
	Ach(62763), -- Abyss Anglers: Vintage Collector
	Ach(62772), -- Abyss Anglers: Now That's Anglin'
	Ach(62773), -- Abyss Anglers: Jeju's New Rival
	Ach(62774), -- Abyss Anglers: Not Done Yet
	Ach(62775), -- Abyss Anglers: Delicate Diver
	Ach(62776):Pet(), -- Abyss Anglers: All Blue Angler
	Ach(62777), -- Abyss Anglers: Pearls to the Abyss
	Ach(62778), -- Abyss Anglers: Luck of the Loa
	Ach(62829), -- Abyss Anglers: Don't Know What You Expected
	Ach(62832), -- Abyss Anglers: Reservation for One
}