local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["07_00_03"] = {
	{KrowiAF.SetAchievementPatch, 7, 0, 3},
	Ach(9686), -- Aquatic Acquiescence
	Ach(9687), -- Best of the Beasts
	Ach(9688), -- Mousing Around
	Ach(9689), -- Dragons!
	Ach(9690), -- Ragnaros, Watch and Learn
	Ach(9691), -- Flock Together
	Ach(9692), -- Murlocs, Harpies, and Wolvar, Oh My!
	Ach(9693), -- Master of Magic
	Ach(9694), -- Roboteer
	Ach(9695), -- The Lil' Necromancer
	Ach(9696):Pet(), -- Family Familiar
	Ach(10059), -- Ain't No Mountain High Enough
	Ach(10398):HousingDecor(), -- Drum Circle
	Ach(10411), -- Helheim Hath No Fury
	Ach(10412):Pet(), -- Poor Unfortunate Souls
	Ach(10413), -- Instant Karma
	Ach(10456), -- But You Say He's Just a Friend
	Ach(10457), -- Stay Salty
	Ach(10458), -- Ready for Raiding V
	Ach(10459), -- Improving on History
	Ach(10460), -- Hidden Potential
	Ach(10461), -- Fighting with Style: Classic
	Ach(10542), -- I Got What You Mead
	Ach(10543), -- Surge Protector
	Ach(10544), -- Stag Party
	Ach(10553), -- You're Just Making It WORSE!
	Ach(10554), -- I Made a Food!
	Ach(10555), -- Buggy Fight
	Ach(10561):IsPvP(), -- Honorable Medallion
	Ach(10575), -- Burning Bridges
	Ach(10580):Obtainable("Before", "Version", {8, 0, 1}), -- Heroic Skills to Pay the Bills
	Ach(10581), -- Working the Isles
	Ach(10582), -- Professional Legion Master
	Ach(10583), -- Legion Master of All
	Ach(10585):Obtainable("Before", "Version", {9, 1, 0}), -- Fel-Smelter
	Ach(10586):Obtainable("Before", "Version", {9, 1, 0}), -- Mass Obliteration
	Ach(10587), -- Hot Swapper
	Ach(10588), -- The Shortest Distance
	Ach(10589), -- Legion Cook
	Ach(10591), -- All Grown Up
	Ach(10592), -- Never A Day's Rest
	Ach(10593), -- Everything Tastes Better
	Ach(10594), -- Legion Fisherman
	Ach(10595), -- A Cast Above the Rest
	Ach(10596), -- Bigger Fish to Fry
	Ach(10597), -- Legion Aquaculture
	Ach(10598), -- Fishing 'Round the Isles
	Ach(10599):Obtainable("Before", "Version", {8, 0, 1}), -- Legion Medic
	Ach(10600), -- Legion Archaeologist
	Ach(10601), -- Surveying the Land
	Ach(10602), -- This Side Up
	Ach(10603), -- A Keen Eye
	Ach(10604), -- Legion Curator
	Ach(10605), -- Handle With Care
	Ach(10606), -- The Dwarven Dream
	Ach(10607), -- Getting Your Hands Dirty
	Ach(10608), -- Sifting Through the Sand
	Ach(10609):Title(), -- No Stone Unturned
	Ach(10610), -- Waiting for Gerdo
	Ach(10611), -- Dropping Some Eaves
	Ach(10617):Other(), -- Nightfallen But Not Forgotten
	Ach(10626), -- Zoom!
	Ach(10627), -- Going Up
	Ach(10657):Other(), -- Fledgling Hero of Warcraft
	Ach(10663), -- Imagined Dragons World Tour
	Ach(10665), -- Explore Azsuna
	Ach(10666), -- Explore Val'sharah
	Ach(10667), -- Explore Highmountain
	Ach(10668), -- Explore Stormheim
	Ach(10669), -- Explore Suramar
	Ach(10671):Obtainable("Before", "Version", {9, 0, 1}), -- Level 110 (Legacy)
	Ach(10672), -- Broken Isles Diplomat
	Ach(10678), -- Cage Rematch
	Ach(10679), -- I Ain't Even Cold
	Ach(10680), -- Who's Afraid of the Dark?
	Ach(10681), -- Fashionista: Head
	Ach(10682), -- Fashionista: Chest
	Ach(10684), -- Fashionista: Legs
	Ach(10685), -- Fashionista: Feet
	Ach(10686), -- Fashionista: Waist
	Ach(10687), -- Fashionista: Back
	Ach(10688), -- Fashionista: Wrist
	Ach(10689), -- Fashionista: Weapon & Off-Hand
	Ach(10690), -- Fashionista: Tabard
	Ach(10691), -- Fashionista: Shirt
	Ach(10692), -- Fashionista: Shoulder
	Ach(10693), -- Fashionista: Hand
	Ach(10694):Title(), -- Fabulous
	Ach(10696), -- I've Got My Eyes On You
	Ach(10697), -- Grand Opening
	Ach(10698):HousingDecor(), -- That's Val'sharah Folks!
	Ach(10699), -- Infinitesimal
	Ach(10704), -- Not For You
	Ach(10706), -- Training the Troops
	Ach(10707), -- A Specter, Illuminated
	Ach(10709), -- You Used to Scrawl Me In Your Fel Tome
	Ach(10710), -- Black Rook Moan
	Ach(10711), -- Adds? More Like Bads
	Ach(10722), -- The Wish Remover
	Ach(10741):Obtainable("From", "Date", {2016, 11, 16}, "Until", "Date", {2016, 11, 30}), -- WoW's 12th Anniversary
	Ach(10742), -- Gluten Free
	Ach(10743):AutoFactionSplit(faction.Alliance, 10745):PvP(19), -- The Prestige
	Ach(10746), -- Forged for Battle
	Ach(10747):Obtainable("Before", "Version", {8, 0, 1}), -- Fighting with Style: Upgraded
	Ach(10748), -- Fighting with Style: Valorous
	Ach(10749):AutoFactionSplit(faction.Alliance, 11173):IsPvP(), -- Fighting with Style: War-torn
	Ach(10750), -- Fighting with Style: Hidden
	Ach(10751), -- Brr... It's Cold in Here
	Ach(10753), -- Scare Bear
	Ach(10754), -- Fruit of All Evil
	Ach(10755), -- I Attack the Darkness
	Ach(10756), -- Leyline Bling
	Ach(10761), -- Resourceful
	Ach(10762), -- The Legion Menu
	Ach(10763), -- Azsuna Matata
	Ach(10764):Obtainable("Before", "Version", {8, 0, 1}), -- Brokenly Superior
	Ach(10765):Obtainable("Before", "Version", {8, 0, 1}), -- Brokenly Epic
	Ach(10766), -- Egg-cellent!
	Ach(10769), -- Burning Down the House
	Ach(10770), -- The Tangerine Traveler
	Ach(10771), -- Webbing Crashers
	Ach(10772), -- Use the Force(s)
	Ach(10773), -- Arcanic Cling
	Ach(10774):Toy(), -- Hatchling of the Talon
	Ach(10775), -- Clean House
	Ach(10776), -- No Time to Waste
	Ach(10778), -- The Nightfallen
	Ach(10780), -- Eye of Azshara
	Ach(10781), -- Heroic: Eye of Azshara
	Ach(10782), -- Mythic: Eye of Azshara
	Ach(10783), -- Darkheart Thicket
	Ach(10784), -- Heroic: Darkheart Thicket
	Ach(10785), -- Mythic: Darkheart Thicket
	Ach(10786), -- Halls of Valor
	Ach(10788), -- Heroic: Halls of Valor
	Ach(10789), -- Mythic: Halls of Valor
	Ach(10790), -- Vrykul Story, Bro
	Ach(10793), -- What a Ripoff!
	Ach(10795), -- Neltharion's Lair
	Ach(10796), -- Heroic: Neltharion's Lair
	Ach(10797), -- Mythic: Neltharion's Lair
	Ach(10798), -- Assault on Violet Hold
	Ach(10799), -- Heroic: Assault on Violet Hold
	Ach(10800), -- Mythic: Assault on Violet Hold
	Ach(10801), -- Vault of the Wardens
	Ach(10802), -- Heroic: Vault of the Wardens
	Ach(10803), -- Mythic: Vault of the Wardens
	Ach(10804), -- Black Rook Hold
	Ach(10805), -- Heroic: Black Rook Hold
	Ach(10806), -- Mythic: Black Rook Hold
	Ach(10807), -- Maw of Souls
	Ach(10808), -- Heroic: Maw of Souls
	Ach(10809), -- Mythic: Maw of Souls
	Ach(10813), -- Mythic: The Arcway
	Ach(10816), -- Mythic: Court of Stars
	Ach(10817), -- A Change In Scenery
	Ach(10818), -- Darkbough
	Ach(10819), -- Tormented Guardians
	Ach(10820), -- Rift of Aln
	Ach(10821), -- Mythic: Nythendra
	Ach(10822), -- Mythic: Elerethe Renferal
	Ach(10823), -- Mythic: Il'gynoth
	Ach(10824), -- Mythic: Ursoc
	Ach(10825), -- Mythic: Dragons of Nightmare
	Ach(10826), -- Mythic: Cenarius
	Ach(10827):Title(), -- Mythic: Xavius
	Ach(10829), -- Arcing Aqueducts
	Ach(10830), -- Took the Red Eye Down
	Ach(10837), -- Royal Athenaeum
	Ach(10838), -- Nightspire
	Ach(10839), -- Betrayer's Rise
	Ach(10840), -- Mythic: Skorpyron
	Ach(10842), -- Mythic: Chronomatic Anomaly
	Ach(10843), -- Mythic: Trilliax
	Ach(10844), -- Mythic: Spellblade Aluriel
	Ach(10845), -- Mythic: Star Augur Etraeus
	Ach(10846), -- Mythic: High Botanist Tel'arn
	Ach(10847), -- Mythic: Tichondrius
	Ach(10848), -- Mythic: Krosus
	Ach(10849), -- Mythic: Grand Magistrix Elisande
	Ach(10850):Title(), -- Mythic: Gul'dan
	Ach(10851), -- Elementalry!
	Ach(10852):Obtainable("Before", "Version", {8, 0, 1}), -- Artifact or Artifiction
	Ach(10853):Obtainable("Before", "Version", {8, 0, 1}), -- Part of History
	Ach(10875), -- Can't Eat Just One
	Ach(10876), -- Battle on the Broken Isles
	Ach(10877), -- Pillars of Creation
	Ach(10991):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- First Step into a Larger World
	Ach(10992):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Here We Go Again
	Ach(10993):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Third Time's the Charm
	Ach(10994), -- A Glorious Campaign
	Ach(10995):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- For Prestige
	Ach(10996):HousingDecor(), -- Got to Ketchum All
	Ach(10997):AutoFactionSplit(faction.Horde, 10998):Mount():PvP(19), -- Vindictive Combatant
	Ach(10999):PvP(19), -- Vindictive Gladiator's Storm Dragon
	Ach(11000):PvP(20), -- Fearless Gladiator's Storm Dragon
	Ach(11001):PvP(21), -- Cruel Gladiator's Storm Dragon
	Ach(11002):PvP(22), -- Ferocious Gladiator's Storm Dragon
	Ach(11003):AutoFactionSplit(faction.Horde, 11004):Mount():PvP(20), -- Fearless Combatant
	Ach(11005):AutoFactionSplit(faction.Horde, 11008):Mount():PvP(21), -- Cruel Combatant
	Ach(11009):AutoFactionSplit(faction.Horde, 11010):Mount():PvP(22), -- Ferocious Combatant
	Ach(11011):Title():PvP(19), -- Gladiator: Legion Season 1
	Ach(11012):Title():PvP(19), -- Vindictive Gladiator: Legion Season 1
	Ach(11013):Title():PvP(20), -- Gladiator: Legion Season 2
	Ach(11014):Title():PvP(20), -- Fearless Gladiator: Legion Season 2
	Ach(11015):Title():PvP(19), -- Duelist: Legion Season 1
	Ach(11016):Title():PvP(19), -- Rival: Legion Season 1
	Ach(11017):Title():PvP(19), -- Challenger: Legion Season 1
	Ach(11018):AutoFactionSplit(faction.Alliance, 11019):PvP(19), -- Hero of the Alliance: Vindictive / Hero of the Horde: Vindictive
	Ach(11020):AutoFactionSplit(faction.Alliance, 11021):Title():PvP(19), -- Guardian of the Alliance: Legion Season 1 / Guardian of the Horde: Legion Season 1
	Ach(11022):AutoFactionSplit(faction.Alliance, 11023):Title():PvP(19), -- Defender of the Alliance: Legion Season 1 / Defender of the Horde: Legion Season 1
	Ach(11024):AutoFactionSplit(faction.Alliance, 11025):Title():PvP(19), -- Soldier of the Alliance: Legion Season 1 / Soldier of the Horde: Legion Season 1
	Ach(11026):Title():PvP(20), -- Duelist: Legion Season 2
	Ach(11027):Title():PvP(20), -- Rival: Legion Season 2
	Ach(11028):Title():PvP(20), -- Challenger: Legion Season 2
	Ach(11029):AutoFactionSplit(faction.Horde, 11030):PvP(20), -- Hero of the Horde: Fearless / Hero of the Alliance: Fearless
	Ach(11031):AutoFactionSplit(faction.Horde, 11032):Title():PvP(20), -- Guardian of the Horde: Legion Season 2 / Guardian of the Alliance: Legion Season 2
	Ach(11033):AutoFactionSplit(faction.Horde, 11034):Title():PvP(20), -- Defender of the Horde: Legion Season 2 / Defender of the Alliance: Legion Season 2
	Ach(11035):AutoFactionSplit(faction.Horde, 11036):Title():PvP(20), -- Soldier of the Horde: Legion Season 2 / Soldier of the Alliance: Legion Season 2
	Ach(11037):Title():PvP(21), -- Cruel Gladiator: Legion Season 3
	Ach(11038):Title():PvP(21), -- Gladiator: Legion Season 3
	Ach(11039):Title():PvP(21), -- Challenger: Legion Season 3
	Ach(11040):Title():PvP(21), -- Rival: Legion Season 3
	Ach(11041):Title():PvP(21), -- Duelist: Legion Season 3
	Ach(11042):AutoFactionSplit(faction.Horde, 11043):PvP(21), -- Hero of the Horde: Cruel / Hero of the Alliance: Cruel
	Ach(11044):AutoFactionSplit(faction.Horde, 11045):Title():PvP(21), -- Defender of the Horde: Legion Season 3 / Defender of the Alliance: Legion Season 3
	Ach(11046):AutoFactionSplit(faction.Horde, 11047):Title():PvP(21), -- Guardian of the Horde: Legion Season 3 / Guardian of the Alliance: Legion Season 3
	Ach(11048):AutoFactionSplit(faction.Horde, 11049):Title():PvP(21), -- Soldier of the Horde: Legion Season 3 / Soldier of the Alliance: Legion Season 3
	Ach(11050):AutoFactionSplit(faction.Alliance, 11051):Title():PvP(22), -- Soldier of the Alliance: Legion Season 4 / Soldier of the Horde: Legion Season 4
	Ach(11052):AutoFactionSplit(faction.Alliance, 11053):Title():PvP(22), -- Guardian of the Alliance: Legion Season 4 / Guardian of the Horde: Legion Season 4
	Ach(11054):AutoFactionSplit(faction.Alliance, 11055):Title():PvP(22), -- Defender of the Alliance: Legion Season 4 / Defender of the Horde: Legion Season 4
	Ach(11056):AutoFactionSplit(faction.Alliance, 11057):PvP(22), -- Hero of the Alliance: Ferocious / Hero of the Horde: Ferocious
	Ach(11058):Title():PvP(22), -- Duelist: Legion Season 4
	Ach(11059):Title():PvP(22), -- Rival: Legion Season 4
	Ach(11060):Title():PvP(22), -- Challenger: Legion Season 4
	Ach(11061):Title():PvP(22), -- Gladiator: Legion Season 4
	Ach(11062):Title():PvP(22), -- Ferocious Gladiator: Legion Season 4
	Ach(11064), -- Collector's Edition: Baby Winston
	Ach(11065):Obtainable("Until", "Version", {7, 0, 3}):Obtainable("Event", 1640), -- It All Makes Sense Now
	Ach(11066):Mount(), -- Underbelly Tycoon
	Ach(11124):HousingDecor(), -- Good Suramaritan
	Ach(11125), -- Now You're Thinking With Portals
	Ach(11126), -- 50 World Quests Completed
	Ach(11127), -- 200 World Quests Completed
	Ach(11128), -- 500 World Quests Completed
	Ach(11129), -- 1000 World Quests Completed
	Ach(11130), -- 2500 World Quests Completed
	Ach(11131), -- 5000 World Quests Completed
	Ach(11132), -- 10,000 World Quests Completed
	Ach(11133), -- Why Can't I Hold All This Mana?
	Ach(11135), -- A Heroic Campaign
	Ach(11136), -- An Epic Campaign
	Ach(11137), -- A Legendary Campaign
	Ach(11138):Obtainable("Before", "Version", {8, 0, 1}), -- Is There a Medic in the Zone?
	Ach(11139):Title():Obtainable("Before", "Version", {8, 0, 1}), -- Field Medic
	Ach(11144):Obtainable("Before", "Version", {8, 0, 1}), -- Power Realized
	Ach(11157), -- Loremaster of Legion
	Ach(11159), -- Friends in a Broken Land
	Ach(11160), -- Unleashed Monstrosities
	Ach(11162), -- Keystone Master
	Ach(11163):Mount(), -- Glory of the Legion Hero
	Ach(11164), -- Legion Dungeon Hero
	Ach(11165):AutoFactionSplit(faction.Alliance, 11166):PvP(19), -- Crest of Heroism
	Ach(11167):AutoFactionSplit(faction.Alliance, 11168):PvP(19), -- Crest of Carnage
	Ach(11169):AutoFactionSplit(faction.Alliance, 11170):PvP(19), -- Crest of Devastation
	Ach(11171), -- Arsenal of Power
	Ach(11175):Other(), -- Higher Dimensional Learning
	Ach(11176):Mount(), -- Remember to Share
	Ach(11177), -- 70 Exalted Reputations
	Ach(11178), -- Wake the Dragon
	Ach(11180):Mount(), -- Glory of the Legion Raider
	Ach(11181):Obtainable("Before", "Version", {8, 0, 1}), -- Legion Keymaster
	Ach(11183), -- Keystone Initiate
	Ach(11184), -- Keystone Challenger
	Ach(11185), -- Keystone Conqueror
	Ach(11186), -- Tehd & Marius' Excellent Adventure
	Ach(11188), -- Broken Isles Explorer
	Ach(11189), -- Variety is the Spice of Life
	Ach(11190):Other(), -- Broken Isles Pathfinder, Part One
	Ach(11191):Obtainable("Before", "Version", {7, 1, 5}), -- Cutting Edge: Xavius
	Ach(11192):Obtainable("Before", "Version", {7, 2, 5}), -- Cutting Edge: Gul'dan
	Ach(11194):Obtainable("Before", "Version", {7, 1, 5}), -- Ahead of the Curve: Xavius
	Ach(11195):Obtainable("Before", "Version", {7, 2, 5}), -- Ahead of the Curve: Gul'dan
	Ach(11200):Obtainable("From", "Date", {2016, 8, 9}, "Until", "Date", {2016, 8, 30}), -- Stand Against the Legion
	Ach(11201):Obtainable("From", "Date", {2016, 8, 9}, "Until", "Date", {2016, 8, 30}), -- Defender of Azeroth: Legion Invasions
	Ach(11210):AutoFactionSplit(faction.Alliance, 11211):Transmog():Obtainable("From", "Date", {2016, 5, 25}, "Until", "Date", {2016, 8, 1}), -- Fight for the Alliance / Fight for the Horde
	Ach(11212), -- Raise an Army
	Ach(11213), -- Lead a Legion
	Ach(11214), -- Many Missions
	Ach(11215), -- Quite a Few Missions
	Ach(11216), -- So Many Missions
	Ach(11217), -- Many Many Missions, Handle It!
	Ach(11218):Obtainable("Before", "Version", {8, 0, 1}), -- There's a Boss In There
	Ach(11219), -- Need Backup
	Ach(11220), -- Roster of Champions
	Ach(11221), -- Champions Rise
	Ach(11222), -- Champions of Power
	Ach(11223), -- Legendary Research
	Ach(11224):IsRealmFirst():Obtainable("Once"), -- Realm First! Legion Keystone Master
	Ach(11232):Title(), -- Lock, Stock and Two Smoking Goblins
	Ach(11233):Pet(), -- Broken Isles Safari
	Ach(11240), -- Harbinger
	Ach(11256), -- Treasures of Azsuna
	Ach(11257):HousingDecor(), -- Treasures of Highmountain
	Ach(11258):HousingDecor(), -- Treasures of Val'sharah
	Ach(11259), -- Treasures of Stormheim
	Ach(11260), -- Treasures of Suramar
	Ach(11261), -- Adventurer of Azsuna
	Ach(11262), -- Adventurer of Val'sharah
	Ach(11263), -- Adventurer of Stormheim
	Ach(11264), -- Adventurer of Highmountain
	Ach(11265), -- Adventurer of Suramar
	Ach(11296):Obtainable("Never"), -- The Ancient Keeper
	Ach(11297):Obtainable("Never"), -- The Balance of Light and Shadow
	Ach(11298), -- A Classy Outfit
}


KrowiAF.AchievementData2["07_02_00"] = {
	{KrowiAF.SetAchievementPatch, 7, 2, 0},
	Ach(10537):Obtainable("From", "Date", {2016, 9, 30}, "Until", "Date", {2016, 10, 9}), -- Patron of War
	Ach(11276):AutoFactionSplit(faction.Alliance, 11277):Obtainable("Event", 341), -- Extinguishing Draenor
	Ach(11278):AutoFactionSplit(faction.Alliance, 11279):Obtainable("Event", 341), -- Extinguishing the Broken Isles
	Ach(11280):AutoFactionSplit(faction.Alliance, 11282):Obtainable("Event", 341), -- Flame Warden of the Broken Isles / Flame Keeper of the Broken Isles
	Ach(11283):AutoFactionSplit(faction.Alliance, 11284):Obtainable("Event", 341), -- Flame Warden of Draenor / Flame Keeper of Draenor
	Ach(11294), -- Murloc Battlemasters
	Ach(11320):Pet(), -- Raiding with Leashes IV: Wrath of the Lick King
	Ach(11335), -- Season Tickets
	Ach(11337), -- You Runed Everything!
	Ach(11338), -- Dine and Bash
	Ach(11340):HousingDecor(), -- Insurrection
	Ach(11377), -- Patient Zero
	Ach(11386), -- Boneafide Tri Tip
	Ach(11387):Title():Obtainable("Before", "Version", {8, 0, 1}), -- The Chosen
	Ach(11394), -- Trial of Valor
	Ach(11395):Obtainable("From", "Date", {2017, 1, 3}, "Until", "Date", {2017, 1, 11}), -- Diablo's 20th Anniversary
	Ach(11396), -- Mythic: Odyn
	Ach(11397), -- Mythic: Guarm
	Ach(11398), -- Mythic: Helya
	Ach(11425):Obtainable("From", "Date", {2017, 2, 14}, "Until", "Date", {2017, 3, 14}), -- Herald of Flames
	Ach(11426), -- Heroic: Trial of Valor
	Ach(11427):Toy(), -- No Shellfish Endeavor
	Ach(11429), -- Mythic: Return to Karazhan
	Ach(11430), -- One Night in Karazhan
	Ach(11431), -- The Rat Pack
	Ach(11432), -- Scared Straight
	Ach(11433), -- Burn After Reading
	Ach(11446):Other(), -- Broken Isles Pathfinder, Part Two
	Ach(11468):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Alive for Five
	Ach(11469):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- The River Six
	Ach(11470):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Slayin' to Seven
	Ach(11471):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Don't Hate, Grind to Eight
	Ach(11472):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Hell, It's About Nine
	Ach(11474):Mount():IsPvP(), -- Free For All, More For Me
	Ach(11475), -- Mission Accomplished
	Ach(11476), -- Saddle Sore
	Ach(11477), -- Off the Top Rook
	Ach(11478), -- The Darkbrul-oh
	Ach(11543), -- Explore Broken Shore
	Ach(11544), -- Defender of the Broken Isles
	Ach(11545), -- Legionfall Commander
	Ach(11546), -- Breaching the Tomb
	Ach(11558):AutoFactionSplit(faction.Alliance, 11559):Obtainable("Before", "Version", {9, 0, 1}), -- The First Rule of Brawler's Guild
	Ach(11560):AutoFactionSplit(faction.Alliance, 11561):Obtainable("Before", "Version", {8, 0, 1}), -- You Are Not Your $#*@! Legplates (Season 3)
	Ach(11563):AutoFactionSplit(faction.Alliance, 11564):Other():Obtainable("Before", "Version", {8, 0, 1}), -- The Second Rule of Brawler's Guild (Season 3)
	Ach(11565):AutoFactionSplit(faction.Alliance, 11566):Title():Obtainable("Before", "Version", {8, 0, 1}), -- King of the Guild (Season 3)
	Ach(11567):Obtainable("Before", "Version", {9, 0, 1}), -- You Are Not The Contents Of Your Wallet
	Ach(11570):Obtainable("Before", "Version", {9, 0, 1}), -- Educated Guesser
	Ach(11572):Obtainable("Before", "Version", {8, 0, 1}), -- I Am Thrall's Complete Lack Of Surprise (Season 3)
	Ach(11573):Obtainable("Before", "Version", {9, 0, 1}), -- Rumble Club
	Ach(11578):PvP(19), -- Vindictive Elite
	Ach(11579):PvP(20), -- Fearless Elite
	Ach(11580):Obtainable("Before", "Version", {7, 2, 5}), -- Cutting Edge: Helya
	Ach(11581):Obtainable("Before", "Version", {7, 2, 5}), -- Ahead of the Curve: Helya
	Ach(11607), -- They See Me Rolling
	Ach(11609), -- Power Unbound
	Ach(11610), -- Power Unleashed
	Ach(11611):Obtainable("Before", "Version", {8, 0, 1}), -- A Challenging Look
	Ach(11612):Obtainable("Before", "Version", {8, 0, 1}), -- Fighting with Style: Challenging
	Ach(11628), -- That's So Last Millennium
	Ach(11629), -- Untamed Beauty
	Ach(11630), -- More Like Win-dictive
	Ach(11631), -- Extreme Makeover: Fel Edition
	Ach(11652), -- The Reputable
	Ach(11653), -- Paragon of the Broken Isles
	Ach(11674), -- Great Soul, Great Purpose
	Ach(11675), -- Sky Walker
	Ach(11676), -- Five Course Seafood Buffet
	Ach(11681), -- Crate Expectations
	Ach(11683), -- Bingo!
	Ach(11685):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Decade of Dominance
	Ach(11686):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- These Go To Eleven
	Ach(11687):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Demonic Dozen
	Ach(11688):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Floor Thirteen
	Ach(11689):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Fourteen for the Team
	Ach(11690):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- When You're Fifteen
	Ach(11691):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- You Are Sixteen
	Ach(11692):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Going On Seventeen
	Ach(11693):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Eighteen and Over
	Ach(11694):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Hell, It's About Nineteen
	Ach(11696), -- Grin and Bear It
	Ach(11697):PvP(21), -- Cruel Elite
	Ach(11698):PvP(22), -- Ferocious Elite
	Ach(11699), -- Grand Fin-ale
	Ach(11700), -- Cathedral of Eternal Night
	Ach(11701), -- Heroic: Cathedral of Eternal Night
	Ach(11702), -- Mythic: Cathedral of Eternal Night
	Ach(11703), -- Master of Shadows
	Ach(11706), -- The Original
	Ach(11707), -- No Mercy
	Ach(11708), -- With a Vengeance
	Ach(11709), -- Tough Threads
	Ach(11710), -- Lethal Looks
	Ach(11711), -- The Fierce and the Furious
	Ach(11712), -- Relentlessly Good Looking
	Ach(11713), -- Wrath of the Stitch King
	Ach(11714), -- Viciously Vintage
	Ach(11715), -- (Ruth)less is More
	Ach(11716), -- Cataclysmic Catwalk
	Ach(11717), -- Why Male(volent) Models?
	Ach(11718), -- Dressed to Oppress
	Ach(11719), -- It's Not Fashion Unless It Hurts
	Ach(11720), -- Wear It With Pride
	Ach(11721), -- Wild Style
	Ach(11722), -- War-Mog-ering
	Ach(11723), -- Cruel Intentions
	Ach(11724), -- Fel Turkey!
	Ach(11731), -- A Magic Contribution
	Ach(11732), -- A Magnificent Contribution
	Ach(11735), -- Take Command
	Ach(11736), -- Assume Command
	Ach(11737), -- Disrupting the Nether
	Ach(11738), -- It'll Nether Happen
	Ach(11740), -- Make it W-orc W-orc
	Ach(11741), -- So Hot Right Now
	Ach(11742), -- Dress in Lairs
	Ach(11743), -- Accessor-Eyes
	Ach(11744), -- Drop Dead, Gorgeous
	Ach(11746), -- Outlandish Style
	Ach(11747), -- Merely a Set
	Ach(11748), -- Black is the New Black
	Ach(11749), -- Suns Out, Thori'dals Out
	Ach(11750), -- Undying Aesthetic
	Ach(11751), -- Mogg-Saron
	Ach(11752), -- Style of the Crusader
	Ach(11753), -- Winter Catalog
	Ach(11754), -- Glamour of Twilight
	Ach(11755), -- Hot Couture
	Ach(11756), -- Wardrobe of the Old Gods
	Ach(11757), -- Sha of Fabulous
	Ach(11758), -- Thunderwear
	Ach(11759), -- Yaass'shaarj
	Ach(11760), -- Retro Trend
	Ach(11761):Title(), -- Azeroth's Next Top Model
	Ach(11762), -- Can I Get A Helya
	Ach(11763):Title(), -- Glory of the Tomb Raider
	Ach(11765):Pet(), -- Pet Battle Challenge: Wailing Caverns
	Ach(11767), -- Mythic: Goroth
	Ach(11768), -- Boom Bloom
	Ach(11769), -- A Steamy Romance Saga
	Ach(11770), -- Dark Souls
	Ach(11772):Obtainable("Before", "Version", {8, 0, 1}), -- Power Ascended
	Ach(11773), -- Wax On, Wax Off
	Ach(11774), -- Mythic: Demonic Inquisition
	Ach(11775), -- Mythic: Harjatan
	Ach(11776), -- Mythic: Mistress Sassz'ine
	Ach(11777), -- Mythic: Sisters of the Moon
	Ach(11778), -- Mythic: The Desolate Host
	Ach(11779), -- Mythic: Maiden of Vigilance
	Ach(11780), -- Mythic: Fallen Avatar
	Ach(11781):Title(), -- Mythic: Kil'jaeden
	Ach(11786), -- Terrors of the Shore
	Ach(11787), -- The Gates of Hell
	Ach(11788), -- Wailing Halls
	Ach(11789), -- Chamber of the Avatar
	Ach(11790), -- Deceiver's Fall
	Ach(11796), -- Armies of Legionfall
	Ach(11802), -- Bringing Home the Beacon
	Ach(11841), -- Naxt Victim
	Ach(11846), -- Champions of Legionfall
}


KrowiAF.AchievementData2["07_02_05"] = {
	{KrowiAF.SetAchievementPatch, 7, 2, 5},
	Ach(11848):Obtainable("From", "Date", {2017, 11, 16}, "Until", "Date", {2017, 11, 30}), -- WoW's 13th Anniversary
	Ach(11856):Pet(), -- Pet Battle Challenge: Deadmines
	Ach(11869):Transmog(), -- I'll Hold These For You Until You Get Out
	Ach(11874):Obtainable("Before", "Version", {7, 3, 0}), -- Ahead of the Curve: Kil'jaeden
	Ach(11875):Obtainable("Before", "Version", {7, 3, 0}), -- Cutting Edge: Kil'jaeden
	Ach(11918):Obtainable("Event", 374), -- Hey, You're a Rockstar!
	Ach(11919):Obtainable("Event", 374), -- Taking this Show on the Road
	Ach(11920):Obtainable("Event", 374), -- Perfect Performance
	Ach(11921):Obtainable("Event", 374), -- Mosh Pit
	Ach(11929), -- Heroic: Return to Karazhan
	Ach(11941):Title(), -- Chromie Homie
}


KrowiAF.AchievementData2["07_03_00"] = {
	{KrowiAF.SetAchievementPatch, 7, 3, 0},
	Ach(11725):Transmog(), -- Fisherfriend of the Isles
	Ach(11913), -- Don't Play With That In The House
	Ach(11915), -- Don't Sweat the Technique
	Ach(11928), -- Portal Combat
	Ach(11930), -- Worm-monger
	Ach(11948), -- Together We Stand
	Ach(11949), -- Hard to Kill
	Ach(11987):Mount(), -- Glory of the Argus Raider
	Ach(11988), -- Light's Breach
	Ach(11989), -- Forbidden Descent
	Ach(11990), -- Hope's End
	Ach(11991), -- Seat of the Pantheon
	Ach(11992), -- Mythic: Garothi Worldbreaker
	Ach(11993), -- Mythic: Hounds of Sargeras
	Ach(11994), -- Mythic: Antoran High Command
	Ach(11995), -- Mythic: Portal Keeper Hasabel
	Ach(11996), -- Mythic: Eonar
	Ach(11997), -- Mythic: Imonar the Soulhunter
	Ach(11998), -- Mythic: Kin'garoth
	Ach(11999), -- Mythic: Varimathras
	Ach(12000), -- Mythic: The Coven of Shivarra
	Ach(12001), -- Mythic: Aggramar
	Ach(12002):Title(), -- Mythic: Argus the Unmaker
	Ach(12004), -- Welcome the Void
	Ach(12005), -- Let it All Out
	Ach(12007), -- Heroic: Seat of the Triumvirate
	Ach(12008), -- Mythic: Seat of the Triumvirate
	Ach(12009), -- Darker Side
	Ach(12010):Title():PvP(23), -- Fierce Gladiator: Legion Season 5
	Ach(12020), -- Argussy Up
	Ach(12021), -- Claws Out
	Ach(12026), -- Invasion Obliteration
	Ach(12028), -- Envision Invasion Eradication
	Ach(12030), -- The World Revolves Around Me
	Ach(12031):AutoFactionSplit(faction.Horde, 12032):Mount():PvP(23), -- Fierce Combatant
	Ach(12034):Title():PvP(23), -- Duelist: Legion Season 5
	Ach(12035):Title():PvP(23), -- Rival: Legion Season 5
	Ach(12036):Title():PvP(23), -- Challenger: Legion Season 5
	Ach(12037):AutoFactionSplit(faction.Alliance, 12041):PvP(23), -- Hero of the Alliance: Fierce / Hero of the Horde: Fierce
	Ach(12038):AutoFactionSplit(faction.Alliance, 12042):Title():PvP(23), -- Guardian of the Alliance: Legion Season 5 / Guardian of the Horde: Legion Season 5
	Ach(12039):AutoFactionSplit(faction.Alliance, 12043):Title():PvP(23), -- Defender of the Alliance: Legion Season 5 / Defender of the Horde: Legion Season 5
	Ach(12040):AutoFactionSplit(faction.Alliance, 12044):Title():PvP(23), -- Soldier of the Alliance: Legion Season 5 / Soldier of the Horde: Legion Season 5
	Ach(12045):Title():PvP(23), -- Gladiator: Legion Season 5
	Ach(12046), -- Remember the Titans
	Ach(12065), -- Hounds Good To Me
	Ach(12066), -- You Are Now Prepared!
	Ach(12067), -- Spheres of Influence
	Ach(12069):Other(), -- Explore Argus
	Ach(12071):Obtainable("Before", "Version", {8, 0, 1}), -- Crucible's Promise
	Ach(12072):Obtainable("Before", "Version", {8, 0, 1}), -- Now You're Cooking with Netherlight
	Ach(12073), -- Locked and Loaded
	Ach(12074), -- Shoot First, Loot Later
	Ach(12076), -- Protector of the Argussian Reach
	Ach(12077), -- Adventurer of Argus
	Ach(12078):Transmog(), -- Commander of Argus
	Ach(12079):Pet(), -- Raiding with Leashes V: Cuteaclysm
	Ach(12081), -- Officer of the Light
	Ach(12083):Title(), -- Paragon of Argus
	Ach(12084), -- Infused and Abused
	Ach(12088), -- Anomalous Animals of Argus
	Ach(12089), -- Aquatic Assault
	Ach(12090):PvP(23), -- Fierce Elite
	Ach(12091), -- Beast Blitz
	Ach(12092), -- Critical Critters
	Ach(12093), -- Draconic Destruction
	Ach(12094), -- Elemental Escalation
	Ach(12095), -- Fierce Fliers
	Ach(12096), -- Humanoid Havoc
	Ach(12097), -- Magical Mayhem
	Ach(12098), -- Mechanical Melee
	Ach(12099), -- Unstoppable Undead
	Ach(12100):Pet(), -- Family Fighter
	Ach(12101), -- We Came Here For Two Reasons
	Ach(12102), -- To Kill Demons...
	Ach(12103):Mount(), -- ...And Chew Mana Buns
	Ach(12104):Title(), -- And We're All Out of Mana Buns
	Ach(12108):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Double Decade of Dominance
	Ach(12109):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Twenty-One Arms Salute
	Ach(12110):Obtainable("Before", "Version", {8, 0, 1}), -- Ahead of the Curve: Argus the Unmaker
	Ach(12111):Obtainable("Before", "Version", {8, 0, 1}), -- Cutting Edge: Argus the Unmaker
	Ach(12129), -- This is the War Room!
}


KrowiAF.AchievementData2["07_03_02"] = {
	{KrowiAF.SetAchievementPatch, 7, 3, 2},
	Ach(11931), -- Rides of War
	Ach(12134):Title():PvP(24), -- Dominant Gladiator: Legion Season 6
	Ach(12135):PvP(24), -- Dominant Elite
	Ach(12136):AutoFactionSplit(faction.Horde, 12137):Mount():PvP(24), -- Dominant Combatant
	Ach(12139):PvP(24), -- Dominant Gladiator's Storm Dragon
	Ach(12140):PvP(25), -- Demonic Gladiator's Storm Dragon
	Ach(12167):Title():PvP(24), -- Gladiator: Legion Season 6
	Ach(12168):Title():PvP(25), -- Gladiator: Legion Season 7
	Ach(12169):Title():PvP(24), -- Challenger: Legion Season 6
	Ach(12170):Title():PvP(24), -- Rival: Legion Season 6
	Ach(12171):Title():PvP(24), -- Duelist: Legion Season 6
	Ach(12172):AutoFactionSplit(faction.Horde, 12173):PvP(24), -- Hero of the Horde: Dominant / Hero of the Alliance: Dominant
	Ach(12174):AutoFactionSplit(faction.Horde, 12175):Title():PvP(24), -- Defender of the Horde: Legion Season 6 / Defender of the Alliance: Legion Season 6
	Ach(12176):AutoFactionSplit(faction.Horde, 12177):Title():PvP(24), -- Guardian of the Horde: Legion Season 6 / Guardian of the Alliance: Legion Season 6
	Ach(12178):AutoFactionSplit(faction.Horde, 12179):Title():PvP(24), -- Soldier of the Horde: Legion Season 6 / Soldier of the Alliance: Legion Season 6
	Ach(12180):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Catching Twenty-Two
	Ach(12181):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Protocol 2.3
	Ach(12182):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Demonic Double Dozen
	Ach(12183):IsPvP():Obtainable("From", "PvP Season", 19, "Until", "PvP Season", 25), -- Prestige Quartermaster
	Ach(12257), -- Stardust Crusaders
}


KrowiAF.AchievementData2["07_03_05"] = {
	{KrowiAF.SetAchievementPatch, 7, 3, 5},
	Ach(12185):Title():PvP(25), -- Demonic Gladiator: Legion Season 7
	Ach(12186):Title():PvP(25), -- Duelist: Legion Season 7
	Ach(12187):Title():PvP(25), -- Challenger: Legion Season 7
	Ach(12188):Title():PvP(25), -- Rival: Legion Season 7
	Ach(12189):AutoFactionSplit(faction.Alliance, 12190):Title():PvP(25), -- Soldier of the Alliance: Legion Season 7 / Soldier of the Horde: Legion Season 7
	Ach(12191):AutoFactionSplit(faction.Alliance, 12192):Title():PvP(25), -- Guardian of the Alliance: Legion Season 7 / Guardian of the Horde: Legion Season 7
	Ach(12194):AutoFactionSplit(faction.Horde, 12195):Title():PvP(25), -- Defender of the Horde: Legion Season 7 / Defender of the Alliance: Legion Season 7
	Ach(12196):AutoFactionSplit(faction.Horde, 12197):PvP(25), -- Hero of the Horde: Demonic / Hero of the Alliance: Demonic
	Ach(12198):PvP(25), -- Demonic Elite
	Ach(12199):AutoFactionSplit(faction.Horde, 12200):Mount():PvP(25), -- Demonic Combatant
	Ach(12242):FactionSplit(faction.Alliance):AlliedRace(), -- Allied Races: Void Elf
	Ach(12243):FactionSplit(faction.Alliance):AlliedRace(), -- Allied Races: Lightforged Draenei
	Ach(12244):FactionSplit(faction.Horde):AlliedRace(), -- Allied Races: Nightborne
	Ach(12245):FactionSplit(faction.Horde):AlliedRace(), -- Allied Races: Highmountain Tauren
	Ach(12279):IsPvP(), -- Mechanical Brawler
	Ach(12280):IsPvP(), -- Aquatic Brawler
	Ach(12281):IsPvP(), -- Beast Brawler
	Ach(12282):IsPvP(), -- Elemental Brawler
	Ach(12283):IsPvP(), -- Magic Brawler
	Ach(12284):IsPvP(), -- Critter Brawler
	Ach(12285):IsPvP(), -- Undead Brawler
	Ach(12286):IsPvP(), -- Flying Brawler
	Ach(12287):IsPvP(), -- Dragonkin Brawler
	Ach(12289):IsPvP(), -- Humanoid Brawler
	Ach(12290):Tabard():IsPvP(), -- Family Brawler
	Ach(12291):FactionSplit(faction.Alliance):Transmog(), -- Heritage of the Void
	Ach(12292), -- Highmountain Tribe
	Ach(12297), -- The Siege of Ulduar
	Ach(12302), -- The Antechamber of Ulduar
	Ach(12309), -- The Keepers of Ulduar
	Ach(12310), -- The Descent into Madness
	Ach(12311), -- The Secrets of Ulduar
	Ach(12312), -- Dwarfageddon
	Ach(12313), -- Unbroken
	Ach(12314), -- Three Car Garage
	Ach(12315), -- Take Out Those Turrets
	Ach(12316), -- Shutout
	Ach(12317), -- Orbital Bombardment
	Ach(12318), -- Orbital Devastation
	Ach(12319), -- Nuked from Orbit
	Ach(12320), -- Orbit-uary
	Ach(12321), -- A Quick Shave
	Ach(12322), -- Iron Dwarf, Medium Rare
	Ach(12323), -- Shattered
	Ach(12324), -- Hot Pocket
	Ach(12325), -- Stokin' the Furnace
	Ach(12326), -- Nerf Engineering
	Ach(12327), -- Nerf Scrapbots
	Ach(12328), -- Nerf Gravity Bombs
	Ach(12329), -- Must Deconstruct Faster
	Ach(12330), -- Heartbreaker
	Ach(12332), -- I Choose You, Runemaster Molgeim
	Ach(12333), -- I Choose You, Stormcaller Brundir
	Ach(12334), -- I Choose You, Steelbreaker
	Ach(12335), -- But I'm On Your Side
	Ach(12336), -- Can't Do That While Stunned
	Ach(12337), -- With Open Arms
	Ach(12338), -- Disarmed
	Ach(12339), -- If Looks Could Kill
	Ach(12340), -- Rubble and Roll
	Ach(12341), -- Crazy Cat Lady
	Ach(12342), -- Nine Lives
	Ach(12343), -- Cheese the Freeze
	Ach(12344), -- I Have the Coolest Friends
	Ach(12345), -- Getting Cold in Here
	Ach(12346), -- Staying Buffed All Winter
	Ach(12347), -- I Could Say That This Cache Was Rare
	Ach(12348), -- Don't Stand in the Lightning
	Ach(12349), -- I'll Take You All On
	Ach(12350), -- Who Needs Bloodlust?
	Ach(12351), -- Siffed
	Ach(12352), -- Lose Your Illusion
	Ach(12360), -- Lumberjacked
	Ach(12361), -- Con-speed-atory
	Ach(12362), -- Deforestation
	Ach(12363), -- Getting Back to Nature
	Ach(12364), -- Knock on Wood
	Ach(12365), -- Knock, Knock on Wood
	Ach(12366), -- Knock, Knock, Knock on Wood
	Ach(12367), -- Set Up Us the Bomb
	Ach(12368), -- Not-So-Friendly Fire
	Ach(12369), -- Firefighter
	Ach(12372), -- Shadowdodger
	Ach(12373), -- I Love the Smell of Saronite in the Morning
	Ach(12384), -- Kiss and Make Up
	Ach(12385), -- Three Lights in the Darkness
	Ach(12386), -- Two Lights in the Darkness
	Ach(12387), -- One Light in the Darkness
	Ach(12388), -- Alone in the Darkness
	Ach(12395), -- Drive Me Crazy
	Ach(12396), -- He's Not Getting Any Older
	Ach(12397), -- They're Coming Out of the Walls
	Ach(12398), -- In His House He Waits Dreaming
	Ach(12399):Title(), -- Observed
	Ach(12400), -- Supermassive
	Ach(12401):Mount(), -- Glory of the Ulduar Raider
	Ach(12404):IsPvP(), -- Claim Jumper
	Ach(12405):IsPvP(), -- Death from Above
	Ach(12406):IsPvP(), -- A Good Start
	Ach(12407):IsPvP(), -- Seething Shore Perfection
	Ach(12408):IsPvP(), -- Seething Shore Domination
	Ach(12409):IsPvP(), -- Seething Shore Victory
	Ach(12410):IsPvP(), -- Seething Shore Veteran
	Ach(12411):IsPvP(), -- Blood and Sand
	Ach(12412):Title():IsPvP(), -- Master of Seething Shore
	Ach(12413):FactionSplit(faction.Horde):Transmog(), -- Heritage of the Nightborne
	Ach(12414):FactionSplit(faction.Alliance):Transmog(), -- Heritage of the Lightforged
	Ach(12415):FactionSplit(faction.Horde):Transmog(), -- Heritage of Highmountain
	Ach(12416), -- The Total Package
	Ach(12429):FactionSplit(faction.Alliance), -- Wetlands Quests
	Ach(12430):FactionSplit(faction.Alliance), -- Duskwood Quests
	Ach(12431):Pet(), -- Post Haste
	Ach(12439):Title(), -- Priority Mail
	Ach(12455):FactionSplit(faction.Alliance, 4894), -- Westfall & Duskwood Quests
	Ach(12456):FactionSplit(faction.Alliance, 4908), -- Loch Modan & Wetlands Quests
}