local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["08_00_01"] = {
	{KrowiAF.SetAchievementPatch, 8, 0, 1},
	Ach(11861):AutoFactionSplit(faction.Horde, 12473), -- The Throne of Zuldazar / A Sound Plan
	Ach(11868):AutoFactionSplit(faction.Horde, 12497), -- The Dark Heart of Nazmir / Drust Do It.
	Ach(12087):FactionSplit(faction.Alliance, nil), -- The Reining Champion
	Ach(12229):AutoFactionSplit(faction.Alliance, 12230), -- Collector's Edition: Seabraid Stallion / Collector's Edition: Gilded Ravasaur
	Ach(12232), -- Collector's Edition: Tottle
	Ach(12270), -- Bringing Hexy Back
	Ach(12272), -- Gold Fever
	Ach(12273), -- It's Lit!
	Ach(12454):Obtainable("From", "Date", {2018, 3, 31}, "Until", "Date", {2018, 4, 6}), -- Salute to StarCraft
	Ach(12457), -- Remix to Ignition
	Ach(12462), -- Shot Through the Heart
	Ach(12478):AutoFactionSplit(faction.Horde, 12496), -- Secrets in the Sands / Stormsong and Dance
	Ach(12479):HousingDecor():FactionSplit(faction.Horde, 12891), -- Zandalar Forever!
	Ach(12480):FactionSplit(faction.Horde, nil), -- A Bargain of Blood
	Ach(12481):FactionSplit(faction.Horde, nil), -- The Final Seal
	Ach(12482), -- Get Hek'd
	Ach(12483), -- Waycrest Manor
	Ach(12484), -- Heroic: Waycrest Manor
	Ach(12488), -- Mythic: Waycrest Manor
	Ach(12489), -- Losing My Profession
	Ach(12490), -- Alchemical Romance
	Ach(12495), -- Run Wild Like a Man On Fire
	Ach(12498), -- Taint Nobody Got Time For That
	Ach(12499), -- Sporely Alive
	Ach(12500), -- Underrot
	Ach(12501), -- Heroic: Underrot
	Ach(12502), -- Mythic: Underrot
	Ach(12503), -- Snake Eyes
	Ach(12504), -- The Temple of Sethraliss
	Ach(12505), -- Heroic: The Temple of Sethraliss
	Ach(12506), -- Mythic: The Temple of Sethraliss
	Ach(12507), -- Snake Eater
	Ach(12508), -- Good Night, Sweet Prince
	Ach(12509):HousingDecor():FactionSplit(faction.Horde, 12510), -- Ready for War
	Ach(12510):FactionSplit(faction.Alliance, 12509), -- Ready for War
	Ach(12515):AlliedRace():FactionSplit(faction.Alliance, nil), -- Allied Races: Dark Iron Dwarf
	Ach(12518):AlliedRace():FactionSplit(faction.Horde, nil), -- Allied Races: Mag'har Orc
	Ach(12521), -- Halls of Containment
	Ach(12522), -- Crimson Descent
	Ach(12523), -- Heart of Corruption
	Ach(12524), -- Mythic: Taloc
	Ach(12526), -- Mythic: MOTHER
	Ach(12527), -- Mythic: Zek'voz
	Ach(12529), -- Mythic: Vectis
	Ach(12530), -- Mythic: Fetid Devourer
	Ach(12531), -- Mythic: Zul
	Ach(12532), -- Mythic: Mythrax the Unraveler
	Ach(12533):Title(), -- Mythic: G'huun
	Ach(12535):PvE(1), -- Cutting Edge: G'huun
	Ach(12536):PvE(1), -- Ahead of the Curve: G'huun
	Ach(12544):Obtainable("Before", "Version", {9, 0, 1}), -- Level 120 (Legacy)
	Ach(12546):Obtainable("Before", "Version", {9, 0, 1}), -- Superior (Battle)
	Ach(12547):Obtainable("Before", "Version", {9, 0, 1}), -- Epic (Battle)
	Ach(12548), -- I'm in Charge Now!
	Ach(12549), -- Not a Fun Guy
	Ach(12550), -- Pecking Order
	Ach(12551), -- Double Dribble
	Ach(12555):FactionSplit(faction.Horde, 12582), -- Welcome to Zandalar
	Ach(12556), -- Explore Tiragarde Sound
	Ach(12557), -- Explore Drustvar
	Ach(12558), -- Explore Stormsong Valley
	Ach(12559), -- Explore Zuldazar
	Ach(12560), -- Explore Vol'dun
	Ach(12561), -- Explore Nazmir
	Ach(12567):AutoFactionSplit(faction.Alliance, 12568):IsPvP(), -- The Horde Slayer / The Alliance Slayer
	Ach(12571):IsPvP(), -- Bounty Hunting
	Ach(12572):IsPvP(), -- War Supplied
	Ach(12573):IsPvP(), -- Band of Brothers
	Ach(12574):IsPvP(), -- Tour of Duty: Nazmir
	Ach(12575):IsPvP(), -- Tour of Duty: Zuldazar
	Ach(12576):IsPvP(), -- Tour of Duty: Vol'dun
	Ach(12577):IsPvP(), -- Tour of Duty: Tiragarde Sound
	Ach(12578):IsPvP(), -- Tour of Duty: Stormsong Valley
	Ach(12579):IsPvP(), -- Tour of Duty: Drustvar
	Ach(12582):HousingDecor():FactionSplit(faction.Alliance, 12555), -- Come Sail Away
	Ach(12587), -- Unbound Monstrosities
	Ach(12588), -- Eat Your Greens
	Ach(12589), -- Heroic: Un'gol Ruins
	Ach(12590), -- Un'gol Ruins
	Ach(12591), -- Mythic: Un'gol Ruins
	Ach(12592):IsPvP(), -- Ruined the Ruins
	Ach(12593):FactionSplit(faction.Alliance, 13294), -- Loremaster of Kul Tiras
	Ach(12594), -- Competent Captain
	Ach(12595), -- Expert Expeditioner
	Ach(12596), -- No Tourist
	Ach(12597):IsPvP(), -- Bayside Brawler
	Ach(12600), -- Breath of the Shrine
	Ach(12601), -- The Void Lies Sleeping
	Ach(12602), -- Trust No One
	Ach(12604):Title():IsPvP():AutoFactionSplit(faction.Horde, 12605), -- Conqueror of Azeroth
	Ach(12614):HousingDecor():FactionSplit(faction.Horde, nil), -- Loa Expectations
	Ach(12719):FactionSplit(faction.Horde, nil), -- Spirits Be With You
	Ach(12721), -- Wrap God
	Ach(12722), -- It Belongs in a Mausoleum!
	Ach(12723):Pet(), -- How to Keep a Mummy
	Ach(12726), -- A Fish Out of Water
	Ach(12727), -- Stand by Me
	Ach(12731):FactionSplit(faction.Alliance, 12733), -- Professional Kul Tiran Master
	Ach(12733):HousingDecor():FactionSplit(faction.Horde, 12731), -- Professional Zandalari Master
	Ach(12734):AutoFactionSplit(faction.Alliance, 12735), -- Working in Kul Tiras / Working in Zandalar
	Ach(12736):AutoFactionSplit(faction.Alliance, 12737), -- Kul Tiran Master of All / Zandalari Master of All
	Ach(12738), -- Holy Scrap!
	Ach(12739), -- Scraptastic!
	Ach(12740), -- Full of Scrap!
	Ach(12741):AutoFactionSplit(faction.Alliance, 13056), -- Giving a Scrap
	Ach(12742):AutoFactionSplit(faction.Alliance, 12743), -- Kul Tiran Cook / Zandalari Cook
	Ach(12744):FactionSplit(faction.Alliance, 12746), -- The Kul Tiran Menu
	Ach(12746):HousingDecor():FactionSplit(faction.Horde, 12744), -- The Zandalari Menu
	Ach(12747), -- Catering for Combat
	Ach(12753):AutoFactionSplit(faction.Alliance, 12754), -- Kul Tiran Fisherman / Zandalari Fisherman
	Ach(12755), -- Scent of the Sea
	Ach(12756), -- Fish Me In the Moonlight
	Ach(12757), -- Angling for Battle
	Ach(12758):AutoFactionSplit(faction.Alliance, 12759), -- Baiting the Enemy
	Ach(12760):AutoFactionSplit(faction.Alliance, 12761), -- Kul Tiran Archaeologist / Zandalari Archaeologist
	Ach(12762):AutoFactionSplit(faction.Alliance, 12764), -- Kul Tiran Curator / Zandalari Curator
	Ach(12765), -- Exotic Discoveries
	Ach(12769), -- Light Travel
	Ach(12770), -- Lengthy Legwork
	Ach(12771), -- Treasures of Nazmir
	Ach(12772), -- Now We Got Bad Blood
	Ach(12806):Mount(), -- Glory of the Uldir Raider
	Ach(12807), -- Battle for Azeroth Dungeon Hero
	Ach(12812):Mount(), -- Glory of the Wartorn Hero
	Ach(12823), -- Thrash Mouth - All Stars
	Ach(12824), -- Atal'Dazar
	Ach(12825), -- Heroic: Atal'Dazar
	Ach(12826), -- Mythic: Atal'Dazar
	Ach(12827):Obtainable("From", "Date", {2018, 11, 16}, "Until", "Date", {2018, 11, 30}), -- WoW's 14th Anniversary
	Ach(12828), -- What's in the Box?
	Ach(12830), -- Edgelords
	Ach(12831), -- Freehold
	Ach(12832), -- Heroic: Freehold
	Ach(12833), -- Mythic: Freehold
	Ach(12835), -- Shrine of the Storm
	Ach(12836), -- Existential Crisis
	Ach(12837), -- Heroic: Shrine of the Storm
	Ach(12838), -- Mythic: Shrine of the Storm
	Ach(12840), -- Tol Dagor
	Ach(12841), -- Heroic: Tol Dagor
	Ach(12842), -- Mythic: Tol Dagor
	Ach(12844), -- The MOTHERLODE!!
	Ach(12845), -- Heroic: The MOTHERLODE!!
	Ach(12846), -- Mythic: The MOTHERLODE!!
	Ach(12847), -- Siege of Boralus
	Ach(12848), -- Kings' Rest
	Ach(12849), -- Treasures of Vol'dun
	Ach(12850), -- At Least You're Being Careful
	Ach(12851), -- Treasures of Zuldazar
	Ach(12852), -- Treasures of Tiragarde Sound
	Ach(12853), -- Treasures of Stormsong Valley
	Ach(12854), -- Ready for Raiding VI
	Ach(12855), -- Pitch Invasion
	Ach(12856):IsPvP(), -- The First Rule of Dueler's Guild
	Ach(12857):IsPvP(), -- Trial by Combat
	Ach(12858):IsPvP(), -- Slugfest
	Ach(12859):IsPvP(), -- Prize Fighter
	Ach(12860):IsPvP(), -- Contender
	Ach(12861):Title():IsPvP(), -- Master of Duels
	Ach(12862):IsPvP(), -- Thirty Six and Two
	Ach(12863):Tabard():IsPvP(), -- Dueling Master
	Ach(12864):Title(), -- 80 Exalted Reputations
	Ach(12865), -- 90 Exalted Reputations
	Ach(12866):Title():Mount(), -- 100 Exalted Reputations
	Ach(12867):HousingDecor():FactionSplit(faction.Horde, 12896), -- Azeroth at War: The Barrens
	Ach(12869):HousingDecor():FactionSplit(faction.Horde, 12898), -- Azeroth at War: After Lordaeron
	Ach(12870):HousingDecor():FactionSplit(faction.Horde, 12899), -- Azeroth at War: Kalimdor on Fire
	Ach(12872), -- The Dirty Five
	Ach(12873):AutoFactionSplit(faction.Horde, 12881), -- War is Hell
	Ach(12874), -- An Eventful Battle
	Ach(12876):AutoFactionSplit(faction.Horde, 12889), -- Strike Fast
	Ach(12877):AutoFactionSplit(faction.Horde, 12888), -- Strike Hard
	Ach(12878):AutoFactionSplit(faction.Horde, 12884), -- Leader of Troops
	Ach(12879):AutoFactionSplit(faction.Horde, 12886), -- Tour of War
	Ach(12891):FactionSplit(faction.Alliance, 12479), -- A Nation United
	Ach(12893):Pet():IsPvP(), -- Honor Level 5
	Ach(12894):Toy():IsPvP(), -- Honor Level 10
	Ach(12895):Mount():IsPvP(), -- Honor Level 15
	Ach(12896):FactionSplit(faction.Alliance, 12867), -- Azeroth at War: The Barrens
	Ach(12898):FactionSplit(faction.Alliance, 12869), -- Azeroth at War: After Lordaeron
	Ach(12899):FactionSplit(faction.Alliance, 12870), -- Azeroth at War: Kalimdor on Fire
	Ach(12900):Pet():IsPvP(), -- Honor Level 20
	Ach(12901):Title():IsPvP(), -- Honor Level 25
	Ach(12902):Toy():IsPvP(), -- Honor Level 30
	Ach(12903):Mount():IsPvP(), -- Honor Level 40
	Ach(12904):Title():IsPvP(), -- Honor Level 50
	Ach(12905):Toy():IsPvP(), -- Honor Level 60
	Ach(12906):Mount():IsPvP(), -- Honor Level 70
	Ach(12907):Title():IsPvP(), -- Honor Level 80
	Ach(12908):Toy():IsPvP(), -- Honor Level 90
	Ach(12909):Title():IsPvP(), -- Honor Level 100
	Ach(12910):Mount():IsPvP(), -- Honor Level 125
	Ach(12911):Mount():IsPvP(), -- Honor Level 150
	Ach(12912):Toy():IsPvP(), -- Honor Level 175
	Ach(12913):Title():IsPvP(), -- Honor Level 200
	Ach(12914):Mount():IsPvP(), -- Honor Level 250
	Ach(12915):Title():IsPvP(), -- Honor Level 300
	Ach(12916):Pet():IsPvP(), -- Honor Level 400
	Ach(12917):Mount():IsPvP(), -- Honor Level 500
	Ach(12918), -- Have a Heart
	Ach(12927), -- Polished Pet Charmer
	Ach(12930):Pet(), -- Battle Safari
	Ach(12931):Mount():AutoFactionSplit(faction.Horde, 12932), -- No Stable Big Enough
	Ach(12933):Mount():AutoFactionSplit(faction.Alliance, 12934), -- A Horde of Hoofbeats
	Ach(12936):Toy(), -- Battle on Zandalar and Kul Tiras
	Ach(12937), -- Elevator Music
	Ach(12938), -- Parental Controls
	Ach(12939), -- Adventurer of Tiragarde Sound
	Ach(12940), -- Adventurer of Stormsong Valley
	Ach(12941), -- Adventurer of Drustvar
	Ach(12942), -- Adventurer of Nazmir
	Ach(12943), -- Adventurer of Vol'dun
	Ach(12944), -- Adventurer of Zuldazar
	Ach(12945):Title():PvP(26), -- Dread Gladiator: Battle for Azeroth Season 1
	Ach(12947), -- Azerothian Diplomat
	Ach(12948):AutoFactionSplit(faction.Horde, 12952), -- Talanji's Expedition / Order of Embers
	Ach(12949):AutoFactionSplit(faction.Horde, 12953), -- The Voldunai / Storm's Wake
	Ach(12950):AutoFactionSplit(faction.Horde, 12951), -- Zandalari Empire / Proudmoore Admiralty
	Ach(12954):AutoFactionSplit(faction.Alliance, 12957), -- Champion of the 7th Legion / Champion of the Honorbound
	Ach(12955), -- Champions of Azeroth
	Ach(12956), -- Tortollan Seekers
	Ach(12958):Pet(), -- Master of Minions
	Ach(12959):Title():PvP(26), -- Challenger: Battle for Azeroth Season 1
	Ach(12960):Title():PvP(26), -- Rival: Battle for Azeroth Season 1
	Ach(12961):Title():Mount():PvP(26), -- Gladiator: Battle for Azeroth Season 1
	Ach(12962):Title():PvP(26), -- Duelist: Battle for Azeroth Season 1
	Ach(12963):AutoFactionSplit(faction.Alliance, 12964):PvP(26), -- Hero of the Alliance: Dread / Hero of the Horde: Dread
	Ach(12988), -- Battle for Azeroth Explorer
	Ach(12989):Other(), -- Battle for Azeroth Pathfinder, Part One
	Ach(12990), -- Catchin' Some Rays
	Ach(12991), -- New Mog, G'huun This?
	Ach(12992):Pet(), -- Pet Emporium
	Ach(12993), -- Don't Warfront Me
	Ach(12995), -- Treasures of Drustvar
	Ach(12996):Pet(), -- Toybox Tycoon
	Ach(12997):HousingDecor():FactionSplit(faction.Alliance, nil), -- The Pride of Kul Tiras
	Ach(12998), -- That Sweete Booty
	Ach(13009):FactionSplit(faction.Horde, nil), -- Adept Sandfisher
	Ach(13011), -- Scourge of Zem'lan
	Ach(13014):FactionSplit(faction.Horde, nil), -- Vorrik's Champion
	Ach(13016), -- Scavenger of the Sands
	Ach(13017):FactionSplit(faction.Horde, nil), -- Champion of the Vulpera
	Ach(13018):HousingDecor(), -- Dune Rider
	Ach(13020):FactionSplit(faction.Horde, nil), -- Bow to Your Masters
	Ach(13021):FactionSplit(faction.Horde, nil), -- A Most Efficient Apocalypse
	Ach(13022):FactionSplit(faction.Horde, nil), -- Revenge is Best Served Speedily
	Ach(13023), -- It's Really Getting Out of Hand
	Ach(13024), -- Carved in Stone, Written in Blood
	Ach(13025):FactionSplit(faction.Horde, nil), -- Zandalari Spycatcher
	Ach(13026):FactionSplit(faction.Alliance, nil), -- 7th Legion Spycatcher
	Ach(13027), -- Mushroom Harvest
	Ach(13028), -- Hoppin' Sad
	Ach(13029), -- Eating Out of the Palm of My Tiny Hand
	Ach(13030):FactionSplit(faction.Horde, nil), -- How to Ptrain Your Pterrordax
	Ach(13035), -- By de Power of de Loa!
	Ach(13036), -- A Loa of a Tale
	Ach(13038):HousingDecor():FactionSplit(faction.Horde, nil), -- Raptari Rider
	Ach(13039):HousingDecor():FactionSplit(faction.Horde, nil), -- Paku'ai
	Ach(13041):FactionSplit(faction.Horde, nil), -- Hungry, Hungry Ranishu
	Ach(13042), -- About To Break
	Ach(13045), -- Every Day I'm Truffling
	Ach(13046), -- These Hills Sing
	Ach(13047), -- Clever Use of Mechanical Explosives
	Ach(13048), -- Life Finds a Way... To Die!
	Ach(13049):HousingDecor():FactionSplit(faction.Alliance, nil), -- The Long Con
	Ach(13050), -- Bless the Rains Down in Freehold
	Ach(13051), -- Legends of the Tidesages
	Ach(13053):FactionSplit(faction.Alliance, nil), -- Deadliest Cache
	Ach(13054), -- Sabertron Assemble
	Ach(13057), -- Shanty Raid
	Ach(13058), -- Kul Tiran Up the Dance Floor
	Ach(13059):FactionSplit(faction.Alliance, nil), -- Drag Race
	Ach(13060):FactionSplit(faction.Alliance, nil), -- Kul Runnings
	Ach(13061), -- Three Sheets to the Wind
	Ach(13062):Pet():FactionSplit(faction.Alliance, nil), -- Let's Bee Friends
	Ach(13064), -- Drust the Facts, Ma'am
	Ach(13075), -- Battle for Azeroth Keymaster
	Ach(13076):Transmog():FactionSplit(faction.Alliance, nil), -- Heritage of the Dark Iron
	Ach(13077):Transmog():FactionSplit(faction.Horde, nil), -- Heritage of the Mag'har
	Ach(13078):IsRealmFirst():Obtainable("Once"), -- Realm First! Battle for Azeroth Keystone Master
	Ach(13079):PvE(1), -- Battle for Azeroth Keystone Conqueror: Season One
	Ach(13080):PvE(1), -- Battle for Azeroth Keystone Master: Season One
	Ach(13082):FactionSplit(faction.Alliance, nil), -- Everything Old Is New Again
	Ach(13083), -- Better, Faster, Stronger
	Ach(13087), -- Sausage Sampler
	Ach(13093):PvP(26), -- Dread Gladiator's Proto-Drake
	Ach(13094), -- Cursed Game Hunter
	Ach(13095), -- Dread Chain
	Ach(13096), -- Heroic: Dread Chain
	Ach(13097), -- Mythic: Dread Chain
	Ach(13098):IsPvP(), -- Bane of the Chain
	Ach(13099), -- Molten Cay
	Ach(13100), -- Heroic: Molten Cay
	Ach(13101), -- Mythic: Molten Cay
	Ach(13102):IsPvP(), -- Clash at the Cay
	Ach(13103), -- Rotting Mire
	Ach(13104), -- Heroic: Rotting Mire
	Ach(13105), -- Mythic: Rotting Mire
	Ach(13106):IsPvP(), -- Mire Marauder
	Ach(13107), -- Skittering Hollow
	Ach(13108), -- Heroic: Skittering Hollow
	Ach(13109), -- Mythic: Skittering Hollow
	Ach(13110):IsPvP(), -- Skittering Smashed
	Ach(13111), -- Verdant Wilds
	Ach(13112), -- Heroic: Verdant Wilds
	Ach(13113), -- Mythic: Verdant Wilds
	Ach(13114):IsPvP(), -- War for the Wilds
	Ach(13115):IsPvP(), -- Reef Madness
	Ach(13116), -- Mythic: Whispering Reef
	Ach(13118), -- Heroic: Whispering Reef
	Ach(13119), -- Whispering Reef
	Ach(13120):IsPvP(), -- Blood in the Water
	Ach(13121):IsPvP(), -- Notorious
	Ach(13122), -- Island Conqueror
	Ach(13123), -- My Dubs
	Ach(13124), -- Metal Detector
	Ach(13125), -- Azerite Admiral
	Ach(13126), -- Give Me The Energy
	Ach(13127), -- Tell Me A Tale
	Ach(13128), -- I'm Here for the Pets
	Ach(13129):IsPvP(), -- Sucker Punch
	Ach(13132), -- Helping Hand
	Ach(13133):AutoFactionSplit(faction.Alliance, 13135), -- Team Deathmatch
	Ach(13134):Title():IsPvP(), -- Expedition Leader
	Ach(13141):IsPvP(), -- Island Slayer
	Ach(13142), -- Archipelago Explorer
	Ach(13144), -- Wide World of Quests
}

KrowiAF.AchievementData2["08_01_00"] = {
	{KrowiAF.SetAchievementPatch, 8, 1, 0},
	Ach(13138), -- Flying Colors
	Ach(13196), -- Meat Marauder
	Ach(13199):Title():PvP(26), -- Combatant: Battle for Azeroth Season 1
	Ach(13200):Title():PvP(27), -- Sinister Gladiator: Battle for Azeroth Season 2
	Ach(13202):PvP(27), -- Sinister Gladiator's Proto-Drake
	Ach(13203):Title():PvP(27), -- Challenger: Battle for Azeroth Season 2
	Ach(13204):Title():PvP(27), -- Combatant: Battle for Azeroth Season 2
	Ach(13205):Title():PvP(27), -- Rival: Battle for Azeroth Season 2
	Ach(13209):Title():PvP(27), -- Duelist: Battle for Azeroth Season 2
	Ach(13210):AutoFactionSplit(faction.Alliance, 13211):PvP(27), -- Hero of the Alliance: Sinister / Hero of the Horde: Sinister
	Ach(13212):Title():Mount():PvP(27), -- Gladiator: Battle for Azeroth Season 2
	Ach(13251):Other():FactionSplit(faction.Alliance, 13263), -- In Teldrassil's Shadow
	Ach(13263):FactionSplit(faction.Horde, 13251), -- The Shadow Hunter
	Ach(13269):Pet(), -- Pet Battle Challenge: Gnomeregan
	Ach(13270), -- Beast Mode
	Ach(13271), -- Critters With Huge Teeth
	Ach(13272), -- Dragons Make Everything Better
	Ach(13273), -- Element of Success
	Ach(13274), -- Fun With Flying
	Ach(13275), -- Magician's Secrets
	Ach(13277), -- Machine Learning
	Ach(13278), -- Not Quite Dead Yet
	Ach(13279):Pet(), -- Family Battler
	Ach(13280), -- Hobbyist Aquarist
	Ach(13281), -- Human Resources
	Ach(13283):HousingDecor():FactionSplit(faction.Alliance, 13284), -- Frontline Warrior
	Ach(13284):FactionSplit(faction.Horde, 13283), -- Frontline Warrior
	Ach(13285):Toy():FactionSplit(faction.Alliance, nil), -- Upright Citizens
	Ach(13286):AutoFactionSplit(faction.Alliance, 13289), -- Siege of Dazar'alor / Defense of Dazar'alor
	Ach(13287):AutoFactionSplit(faction.Alliance, 13290), -- Empire's Fall / Death's Bargain
	Ach(13288):AutoFactionSplit(faction.Alliance, 13291), -- Might of the Alliance / Victory or Death
	Ach(13292), -- Mythic: Champion of the Light
	Ach(13293), -- Mythic: Grong
	Ach(13294):FactionSplit(faction.Horde, 12593), -- Loremaster of Zandalar
	Ach(13295):AutoFactionSplit(faction.Horde, 13298), -- Mythic: Jadefire Masters
	Ach(13296):AutoFactionSplit(faction.Horde, 13297), -- War for the Shore
	Ach(13299), -- Mythic: Opulence
	Ach(13300), -- Mythic: Conclave of the Chosen
	Ach(13301):AutoFactionSplit(faction.Horde, 13302), -- Under Cover of Darkness
	Ach(13305):AutoFactionSplit(faction.Alliance, 13306), -- Night Moves
	Ach(13307):AutoFactionSplit(faction.Horde, 13308), -- Recruitment Officer
	Ach(13309):AutoFactionSplit(faction.Horde, 13310), -- Deforester / By Nature's Call
	Ach(13311), -- Mythic: King Rastakhan
	Ach(13312), -- Mythic: Mekkatorque
	Ach(13313), -- Mythic: Stormwall Blockade
	Ach(13314):Title(), -- Mythic: Lady Jaina Proudmoore
	Ach(13315):Mount(), -- Glory of the Dazar'alor Raider
	Ach(13316), -- Can I Get a Hek Hek Hek Yeah?
	Ach(13317):IsPvP(), -- Supplied and Ready
	Ach(13322):PvE(2), -- Ahead of the Curve: Lady Jaina Proudmoore
	Ach(13323):PvE(2), -- Cutting Edge: Lady Jaina Proudmoore
	Ach(13325), -- Walk the Dinosaur
	Ach(13345), -- Praise the Sunflower
	Ach(13383), -- Barrel of Monkeys
	Ach(13384):FactionSplit(faction.Alliance, nil), -- Kul Tirans Don't Look at Explosions
	Ach(13385), -- Daz'aling Attire
	Ach(13387):AutoFactionSplit(faction.Alliance, 13388):IsPvP(), -- Frontline Veteran
	Ach(13389), -- Jorundall
	Ach(13394), -- Heroic: Jorundall
	Ach(13395), -- Mythic: Jorundall
	Ach(13396), -- Havenswood
	Ach(13397), -- Heroic: Havenswood
	Ach(13398), -- Mythic: Havenswood
	Ach(13399):IsPvP(), -- Jorundall Justice
	Ach(13400):IsPvP(), -- Havenswood Hero
	Ach(13401), -- I Got Next!
	Ach(13402):AutoFactionSplit(faction.Alliance, 13403):IsPvP(), -- Frontline Slayer
	Ach(13410), -- Snow Fun Allowed
	Ach(13414), -- Crucible of Storms
	Ach(13416), -- Mythic: The Restless Cabal
	Ach(13417), -- Mythic: Uu'nat, Harbinger of the Void
	Ach(13418):PvE(2), -- Ahead of the Curve: Uu'nat, Harbinger of the Void
	Ach(13419):PvE(2), -- Cutting Edge: Uu'nat, Harbinger of the Void
	Ach(13425), -- We Got Spirit, How About You?
	Ach(13426):FactionSplit(faction.Alliance, nil), -- Come On and Slam
	Ach(13429):IsPvP(), -- Azerfighter
	Ach(13430), -- De Lurker Be'loa
	Ach(13431), -- Hidden Dragon
	Ach(13433), -- Tall, Dark, and Sinister
	Ach(13435):FactionSplit(faction.Horde, nil), -- Doomsoul Surprise
	Ach(13437):FactionSplit(faction.Horde, nil), -- Scavenge like a Vulpera
	Ach(13438):AutoFactionSplit(faction.Horde, 13439):IsPvP(), -- Boxing Match
	Ach(13440):AutoFactionSplit(faction.Alliance, 13441), -- Pushing the Payload
	Ach(13448):PvE(2), -- Battle for Azeroth Keystone Conqueror: Season Two
	Ach(13449):PvE(2), -- Battle for Azeroth Keystone Master: Season Two
	Ach(13450):PvP(23), -- Fierce Gladiator's Storm Dragon
	Ach(13451):Title():PvP(27), -- Elite: Battle for Azeroth Season 2
}

KrowiAF.AchievementData2["08_01_05"] = {
	{KrowiAF.SetAchievementPatch, 8, 1, 5},
	Ach(13161):AlliedRace():FactionSplit(faction.Horde, nil), -- Allied Races: Zandalari Troll
	Ach(13163):AlliedRace():FactionSplit(faction.Alliance, nil), -- Allied Races: Kul Tiran
	Ach(13186):AutoFactionSplit(faction.Alliance, 13188):Obtainable("Before", "Version", {9, 0, 1}), -- You Are Not Your $#*@! Legplates
	Ach(13189):Other():AutoFactionSplit(faction.Alliance, 13190):Obtainable("Before", "Version", {9, 0, 1}), -- The Second Rule of Brawler's Guild
	Ach(13191):Title():AutoFactionSplit(faction.Alliance, 13192):Obtainable("Before", "Version", {9, 0, 1}), -- Brawler for Azeroth
	Ach(13194):Obtainable("Before", "Version", {9, 0, 1}), -- I Am Thrall's Complete Lack Of Surprise
	Ach(13340):AutoFactionSplit(faction.Horde, 13341):Obtainable("Event", 341), -- Flame Keeper of Zandalar / Flame Warden of Kul Tiras
	Ach(13342):AutoFactionSplit(faction.Horde, 13343):Obtainable("Event", 341), -- Extinguishing Kul Tiras / Extinguishing Zandalar
	Ach(13465):Title():PvP(26), -- Elite: Battle for Azeroth Season 1
	Ach(13466):AutoFactionSplit(faction.Horde, 13467), -- Tides of Vengeance
	Ach(13469):Pet(), -- Raiding with Leashes VI: Pets of Pandaria
	Ach(13501), -- Gotta Bounce
	Ach(13503):Transmog():FactionSplit(faction.Horde, nil), -- Heritage of the Zandalari
	Ach(13504):Transmog():FactionSplit(faction.Alliance, nil), -- Heritage of the Kul Tirans
	Ach(13506), -- A Good Eye-dea
	Ach(13512), -- Master Calligrapher
	Ach(13516), -- Massive Tool
	Ach(13517):Mount(), -- Two Sides to Every Tale
}

KrowiAF.AchievementData2["08_02_00"] = {
	{KrowiAF.SetAchievementPatch, 8, 2, 0},
	Ach(13250):Mount(), -- Battle for Azeroth Pathfinder, Part Two
	Ach(13470), -- Rest In Pistons
	Ach(13472), -- Deep Pockets
	Ach(13473):HousingDecor(), -- Diversified Investments
	Ach(13474), -- Junkyard Machinist
	Ach(13475):HousingDecor(), -- Junkyard Scavenger
	Ach(13476), -- Junkyard Tinkerer
	Ach(13477):HousingDecor(), -- Junkyard Apprentice
	Ach(13478), -- Junkyard Collector
	Ach(13479), -- Junkyard Architect
	Ach(13482), -- Head Financier of Mechagon
	Ach(13489):Toy(), -- Secret Fish of Mechagon
	Ach(13502):Toy(), -- Secret Fish and Where to Find Them
	Ach(13513):Mount(), -- Available in Eight Colors
	Ach(13541):Mount(), -- Mecha-Done
	Ach(13542):FactionSplit(faction.Horde, nil), -- How to Train Your Direhorn
	Ach(13545), -- Go Ahead, Make My Daisy
	Ach(13549), -- Trove Tracker
	Ach(13553):FactionSplit(faction.Alliance, nil), -- The Mechagonian Threat
	Ach(13555):Title(), -- Junkyard Tinkmaster
	Ach(13556), -- Outside Influences
	Ach(13557), -- Rustbolt Rebellion
	Ach(13558):FactionSplit(faction.Alliance, nil), -- Waveblade Ankoan
	Ach(13559):FactionSplit(faction.Horde, nil), -- The Unshackled
	Ach(13568):IsPvP(), -- For Nazjatar!
	Ach(13569):IsPvP(), -- Tour of Duty: Nazjatar
	Ach(13570):IsPvP(), -- Tour of Duty: Mechagon
	Ach(13571), -- Under the Seams
	Ach(13572), -- The Heart Forge
	Ach(13573):FactionSplit(faction.Horde, nil), -- How to Ptrain Your Pterrordax
	Ach(13577), -- Crestfall
	Ach(13578), -- Heroic: Crestfall
	Ach(13579), -- Mythic: Crestfall
	Ach(13580):IsPvP(), -- Crestfallen
	Ach(13581), -- Snowblossom Village
	Ach(13582), -- Heroic: Snowblossom Village
	Ach(13583), -- Mythic: Snowblossom Village
	Ach(13584):IsPvP(), -- Snowblossom Scrapper
	Ach(13585), -- Never Lose, Never Choose To
	Ach(13623):IsPvP(), -- Fighting on Two Fronts
	Ach(13624), -- Keep DPS-ing and Nobody Explodes
	Ach(13625), -- Mighty Minions of Mechagon
	Ach(13626), -- Nautical Nuisances of Nazjatar
	Ach(13627):Pet(), -- Pet Battle Challenge: Stratholme
	Ach(13628), -- Intro to Marine Biology
	Ach(13629), -- Simple Geometry
	Ach(13630):Title():PvP(28), -- Notorious Gladiator: Battle for Azeroth Season 3
	Ach(13632):PvP(28), -- Notorious Gladiator's Proto-Drake
	Ach(13633), -- If It Pleases the Court
	Ach(13634):Title():PvP(28), -- Challenger: Battle for Azeroth Season 3
	Ach(13635), -- Tour of the Depths
	Ach(13638):Title():Mount(), -- Undersea Usurper
	Ach(13639):Title():PvP(28), -- Combatant: Battle for Azeroth Season 3
	Ach(13641):Title():PvP(28), -- Rival: Battle for Azeroth Season 3
	Ach(13642):Title():PvP(28), -- Duelist: Battle for Azeroth Season 3
	Ach(13643):AutoFactionSplit(faction.Alliance, 13644):PvP(28), -- Hero of the Alliance: Notorious / Hero of the Horde: Notorious
	Ach(13645):AutoFactionSplit(faction.Horde, 13704), -- Nautical Battlefield Training
	Ach(13647):Title():Mount():PvP(28), -- Gladiator: Battle for Azeroth Season 3
	Ach(13676):Title():PvP(28), -- Elite: Battle for Azeroth Season 3
	Ach(13684), -- You and What Army?
	Ach(13686), -- Junkyard Melomaniac
	Ach(13687):Mount(), -- Glory of the Eternal Raider
	Ach(13690), -- Nazjatarget Eliminated
	Ach(13691), -- I Thought You Said They'd Be Rare?
	Ach(13692), -- Give Me the Biggest Bag You've Got
	Ach(13693), -- Mecha-Safari
	Ach(13694), -- Nazjatari Safari
	Ach(13695):Pet(), -- Team Aquashock
	Ach(13696), -- Scrappy's Best Friend
	Ach(13698), -- Clean Up On Aisle Mechagon
	Ach(13699), -- Periodic Destruction
	Ach(13700):FactionSplit(faction.Horde, nil), -- The Mechagonian Threat
	Ach(13701):IsPvP(), -- Battlefield Brawler
	Ach(13702):IsPvP(), -- Battlefield Tactician
	Ach(13703):IsPvP(), -- Battlefield Master
	Ach(13706), -- Stay Positive
	Ach(13707), -- Mrrl's Secret Stash
	Ach(13708), -- Most Minis Wins
	Ach(13709):AutoFactionSplit(faction.Horde, 13710), -- Unfathomable / Sunken Ambitions
	Ach(13711), -- A Fistful of Manapearls
	Ach(13712), -- Explore Nazjatar
	Ach(13713), -- Nothing To Scry About
	Ach(13715), -- From The Belly Of The Jelly
	Ach(13716), -- Lactose Intolerant
	Ach(13718), -- The Grand Reception
	Ach(13719), -- Depths of the Devoted
	Ach(13720):IsPvP(), -- Supplying the Assassins
	Ach(13722), -- Terror of the Tadpoles
	Ach(13723):HousingDecor(), -- M.C., Hammered
	Ach(13724), -- A Smack of Jellyfish
	Ach(13725), -- The Circle of Stars
	Ach(13726), -- Mythic: Abyssal Commander Sivara
	Ach(13727), -- Mythic: Radiance of Azshara
	Ach(13728), -- Mythic: Blackwater Behemoth
	Ach(13729), -- Mythic: Lady Ashvane
	Ach(13730), -- Mythic: Orgozoa
	Ach(13731), -- Mythic: The Queen's Court
	Ach(13732), -- Mythic: Za'qul
	Ach(13733):Title(), -- Mythic: Queen Azshara
	Ach(13735):AutoFactionSplit(faction.Horde, 13737), -- Heroic: War is Hell
	Ach(13738):AutoFactionSplit(faction.Horde, 13739), -- Heroic: Tour of War
	Ach(13743):AutoFactionSplit(faction.Alliance, 13746), -- Seasoned: Hunter Akana / Seasoned: Neri Sharpfin
	Ach(13744):AutoFactionSplit(faction.Alliance, 13747), -- Seasoned: Bladesman Inowari / Seasoned: Poen Gillbrack
	Ach(13745):AutoFactionSplit(faction.Alliance, 13748), -- Seasoned: Farseer Ori / Seasoned: Vim Brineheart
	Ach(13749):AutoFactionSplit(faction.Horde, 13753), -- Veteran: Neri Sharpfin / Veteran: Hunter Akana
	Ach(13750):AutoFactionSplit(faction.Horde, 13758), -- Battle-Scarred: Neri Sharpfin / Battle-Scarred: Hunter Akana
	Ach(13751):AutoFactionSplit(faction.Horde, 13754), -- Veteran: Poen Gillbrack / Veteran: Bladesman Inowari
	Ach(13752):AutoFactionSplit(faction.Horde, 13755), -- Veteran: Vim Brineheart / Veteran: Farseer Ori
	Ach(13756):AutoFactionSplit(faction.Horde, 13759), -- Battle-Scarred: Poen Gillbrack / Battle-Scarred: Bladesman Inowari
	Ach(13757):AutoFactionSplit(faction.Horde, 13760), -- Battle-Scarred: Vim Brineheart / Battle-Scarred: Farseer Ori
	Ach(13761):AutoFactionSplit(faction.Horde, 13762), -- Aqua Team Murder Force
	Ach(13763), -- Back to the Depths!
	Ach(13764), -- Puzzle Performer
	Ach(13765), -- Subaquatic Support
	Ach(13766):Pet(), -- Malowned
	Ach(13767), -- Fun Run
	Ach(13768), -- The Best of Us
	Ach(13769), -- Power Up
	Ach(13770), -- Power Creep
	Ach(13771), -- Power Is Beautiful
	Ach(13772):IsPvP(), -- Essence Essentials
	Ach(13773):IsPvP(), -- Essence Gains
	Ach(13775):IsPvP(), -- Essence Overload
	Ach(13776), -- Explore Mechagon
	Ach(13777), -- My Heart Container is Full
	Ach(13779):Title():Obtainable("Before", "Version", {9, 0, 1}), -- Phenomenal Cosmic Power
	Ach(13780):PvE(3), -- Battle for Azeroth Keystone Conqueror: Season Three
	Ach(13781):PvE(3), -- Battle for Azeroth Keystone Master: Season Three
	Ach(13784):PvE(3), -- Ahead of the Curve: Queen Azshara
	Ach(13785):PvE(3), -- Cutting Edge: Queen Azshara
	Ach(13789):Obtainable("Before", "Version", {9, 0, 1}), -- Hertz Locker
	Ach(13790), -- Armed for Action
	Ach(13791), -- Making the Mount
	Ach(13836), -- Feline Figurines Found
}

KrowiAF.AchievementData2["08_02_05"] = {
	{KrowiAF.SetAchievementPatch, 8, 2, 5},
	Ach(13917):Obtainable("From", "Date", {2019, 11, 5}, "Until", "Date", {2020, 1, 7}), -- WoW's 15th Anniversary
	Ach(13924):Title():AutoFactionSplit(faction.Horde, 13925), -- The Fourth War
	Ach(13927), -- Crashin' Splashin'
	Ach(13928):AutoFactionSplit(faction.Alliance, 13930):IsPvP(), -- Alterac Valley of Olde
	Ach(13931):Mount():Obtainable("From", "Date", {2019, 11, 5}, "Until", "Date", {2020, 1, 7}), -- Memories of Fel, Frost and Fire
}

KrowiAF.AchievementData2["08_03_00"] = {
	{KrowiAF.SetAchievementPatch, 8, 3, 0},
	Ach(13206):AlliedRace():FactionSplit(faction.Horde, nil), -- Allied Races: Vulpera
	Ach(13957):Title():PvP(29), -- Corrupted Gladiator: Battle for Azeroth Season 4
	Ach(13958):PvP(29), -- Corrupted Gladiator's Proto-Drake
	Ach(13959):Title():PvP(29), -- Challenger: Battle for Azeroth Season 4
	Ach(13962):Title():PvP(29), -- Combatant: Battle for Azeroth Season 4
	Ach(13963):Title():PvP(29), -- Rival: Battle for Azeroth Season 4
	Ach(13964):Title():PvP(29), -- Duelist: Battle for Azeroth Season 4
	Ach(13965):AutoFactionSplit(faction.Horde, 13966):PvP(29), -- Hero of the Horde: Corrupted / Hero of the Alliance: Corrupted
	Ach(13967):Title():Mount():PvP(29), -- Gladiator: Battle for Azeroth Season 4
	Ach(13989):Title():PvP(29), -- Elite: Battle for Azeroth Season 4
	Ach(13990), -- You Can Pet the Dog, But...
	Ach(13994):Mount(), -- Through the Depths of Visions
	Ach(13998), -- Pure of Heart
	Ach(13999), -- How? Isn't it Obelisk?
	Ach(14002):Transmog():FactionSplit(faction.Horde, nil), -- Heritage of the Vulpera
	Ach(14008), -- Mana Sponge
	Ach(14013):AlliedRace():FactionSplit(faction.Alliance, nil), -- Allied Races: Mechagnome
	Ach(14014):Transmog():FactionSplit(faction.Alliance, nil), -- Heritage of the Mechagnome
	Ach(14019), -- Smoke Test
	Ach(14020):Toy(), -- Pet Battle Challenge: Blackrock Depths
	Ach(14021):Toy(), -- The Shadows Revealed
	Ach(14023), -- Realizing Your Potential
	Ach(14024), -- Buzzer Beater
	Ach(14026), -- Temper Tantrum
	Ach(14027), -- Battle for Mrrglroth
	Ach(14037), -- Phase 3: Prophet
	Ach(14038), -- Bloody Mess
	Ach(14041), -- Mythic: Wrathion, the Black Emperor
	Ach(14043), -- Mythic: Maut
	Ach(14044), -- Mythic: The Prophet Skitra
	Ach(14045), -- Mythic: Dark Inquisitor Xanesh
	Ach(14046), -- Mythic: The Hivemind
	Ach(14048), -- Mythic: Shad'har the Insatiable
	Ach(14049), -- Mythic: Drest'agath
	Ach(14050), -- Mythic: Vexiona
	Ach(14051), -- Mythic: Ra-den the Despoiled
	Ach(14052), -- Mythic: Il'gynoth, Corruption Reborn
	Ach(14054), -- Mythic: Carapace of N'Zoth
	Ach(14055):Title(), -- Mythic: N'Zoth the Corruptor
	Ach(14058), -- All Eyes On Me
	Ach(14059), -- The Eyes Have It
	Ach(14060), -- Unwavering Resolve
	Ach(14061), -- We Have the Technology
	Ach(14062), -- Horrific Vision of Stormwind
	Ach(14063), -- Horrific Vision of Orgrimmar
	Ach(14064), -- The Even More Horrific Vision of Stormwind
	Ach(14065), -- The Even More Horrific Vision of Orgrimmar
	Ach(14066), -- The Most Horrific Vision of Stormwind
	Ach(14067), -- The Most Horrific Vision of Orgrimmar
	Ach(14068):PvE(4), -- Ahead of the Curve: N'Zoth the Corruptor
	Ach(14069):PvE(4), -- Cutting Edge: N'Zoth the Corruptor
	Ach(14139), -- Total Annihilation
	Ach(14140):Title():PvE(4), -- Mad World
	Ach(14143):Pet(), -- Reeking of Visions
	Ach(14144):Title():PvE(4), -- Battle for Azeroth Keystone Conqueror: Season Four
	Ach(14145):Mount():PvE(4), -- Battle for Azeroth Keystone Master: Season Four
	Ach(14146):Mount(), -- Glory of the Ny'alotha Raider
	Ach(14147), -- Cleansing Treatment
	Ach(14148), -- It's Not A Cult
	Ach(14149):AutoFactionSplit(faction.Horde, 14150), -- Heroic: War for the Shore
	Ach(14153), -- Uldum Under Assault
	Ach(14154), -- Defend the Vale
	Ach(14155), -- Uldum Accord
	Ach(14156), -- The Rajani
	Ach(14157), -- The Corruptor's End
	Ach(14158), -- It's Not A Tumor!
	Ach(14159), -- Combating the Corruption
	Ach(14160), -- Rare to Well Done
	Ach(14161), -- All Consuming
	Ach(14162), -- Horrific Masquerade
	Ach(14165), -- Masked Soliloquy
	Ach(14166), -- Masked Duet
	Ach(14167), -- Masked Trio
	Ach(14168), -- Masked Quartet
	Ach(14169), -- Symphony of Masks
	Ach(14170), -- Thanks For The Mementos
	Ach(14171), -- Memento Mori
	Ach(14172), -- A Monumental Amount of Mementos
	Ach(14173), -- A Mountain of Mementos
	Ach(14175):Title():IsPvP(), -- Master of Deepwind Gorge
	Ach(14183):Obtainable("Before", "Version", {9, 0, 1}), -- Conspicuous Consumption
	Ach(14186):IsPvP(), -- Market Dominance
	Ach(14187):IsPvP(), -- Cruisin' for a Brewsin'
	Ach(14188):IsPvP(), -- Well Gorged
	Ach(14191):Title():IsPvP(), -- Servant of N'Zoth
	Ach(14193), -- Vision of Destiny
	Ach(14194), -- Halls of Devotion
	Ach(14195), -- Gift of Flesh
	Ach(14196), -- The Waking Dream
}