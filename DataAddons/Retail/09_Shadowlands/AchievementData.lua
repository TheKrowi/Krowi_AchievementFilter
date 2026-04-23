local _, addon = ...
local shared = addon.Data.AchievementData.Shared
local Ach = shared.Ach
local faction = KrowiAF.Enum.Faction

KrowiAF.AchievementData2["09_00_01"] = {
    {KrowiAF.SetAchievementPatch, 9, 0, 1},
    Ach(13878), -- The Master of Revendreth
    Ach(14164), -- Awaken, Ardenweald
    Ach(14197), -- Sanguine Depths
    Ach(14198), -- Heroic: Sanguine Depths
    Ach(14199), -- Mythic: Sanguine Depths
    Ach(14206), -- Blade of the Primus
    Ach(14222), -- Exile's Reach
    Ach(14233), -- Tea Tales
    Ach(14271):Obtainable("From", "Date", {2020, 11, 1}, "Until", "Date", {2020, 11, 22}), -- WoW's 16th Anniversary
    Ach(14272), -- Best Bud With Benefits
    Ach(14273), -- Crypt Kicker
    Ach(14274), -- Absolution for All
    Ach(14276), -- It's Always Sinny in Revendreth
    Ach(14277):Title(), -- The Accuser's Avowed
    Ach(14280), -- Loremaster of Shadowlands
    Ach(14281), -- The Path to Ascension
    Ach(14283), -- Heroic Edition: Ensorcelled Everwyrm
    Ach(14284), -- Breaking Bad
    Ach(14285), -- Ready for Raiding VII
    Ach(14286), -- Residue Evil
    Ach(14289), -- Kaal-ed Shot
    Ach(14290), -- I Only Have Eyes For You
    Ach(14291), -- Someone Could Trip on These!
    Ach(14292), -- Riding with my Slimes
    Ach(14293), -- Blind as a Bat
    Ach(14294), -- Dirtflap's Revenge
    Ach(14295), -- Bountiful Harvest
    Ach(14296), -- Going Viral
    Ach(14297), -- Three Choose One
    Ach(14303), -- Explore Bastion
    Ach(14304), -- Explore Ardenweald
    Ach(14305), -- Explore Maldraxxus
    Ach(14306), -- Explore Revendreth
    Ach(14307), -- Adventurer of Bastion
    Ach(14308), -- Adventurer of Maldraxxus
    Ach(14309), -- Adventurer of Ardenweald
    Ach(14310), -- Adventurer of Revendreth
    Ach(14311), -- Treasures of Bastion
    Ach(14312), -- Treasures of Maldraxxus
    Ach(14313), -- Treasures of Ardenweald
    Ach(14314), -- Treasures of Revendreth
    Ach(14315), -- Shadowlands Diplomat
    Ach(14320), -- Surgeon's Supplies
    Ach(14322):Mount(), -- Glory of the Shadowlands Hero
    Ach(14323), -- ExSPEARiential
    Ach(14324), -- Heroic: Spires of Ascension
    Ach(14325), -- Mythic: Spires of Ascension
    Ach(14326), -- Spires of Ascension
    Ach(14327), -- I Can See My House From Here
    Ach(14328), -- Professional Shadowlands Master
    Ach(14329), -- Working the Afterlife
    Ach(14330), -- Shadowlands Master of All
    Ach(14331), -- Goliath Offline
    Ach(14332), -- Shadowlands Cook
    Ach(14333), -- Shadowlands Fisherman
    Ach(14334), -- Into the Maw
    Ach(14335), -- The Ascended
    Ach(14336), -- Undying Army
    Ach(14337), -- The Wild Hunt
    Ach(14338), -- Court of Harvesters
    Ach(14339), -- Shard Labor
    Ach(14347), -- Full Gores Meal
    Ach(14352), -- Nobody Puts Denathrius in a Corner
    Ach(14353), -- Ardenweald's a Stage
    Ach(14354), -- Highly Communicable
    Ach(14355):Mount(), -- Glory of the Nathria Raider
    Ach(14356), -- Mythic: Shriekwing
    Ach(14357), -- Mythic: Huntsman Altimor
    Ach(14358), -- Mythic: Hungering Destroyer
    Ach(14359), -- Mythic: Artificer Xy'mox
    Ach(14360), -- Mythic: Sun King's Salvation
    Ach(14361), -- Mythic: Lady Inerva Darkvein
    Ach(14362), -- Mythic: The Council of Blood
    Ach(14363), -- Mythic: Sludgefist
    Ach(14364), -- Mythic: Stone Legion Generals
    Ach(14365):Title(), -- Mythic: Sire Denathrius
    Ach(14366), -- The Necrotic Wake
    Ach(14367), -- Heroic: The Necrotic Wake
    Ach(14368), -- Mythic: The Necrotic Wake
    Ach(14369), -- Plaguefall
    Ach(14370), -- Halls of Atonement
    Ach(14371), -- Mists of Tirna Scithe
    Ach(14372), -- Theater of Pain
    Ach(14373), -- De Other Side
    Ach(14374), -- Couple's Therapy
    Ach(14375), -- Hunger for Knowledge
    Ach(14376), -- Feed the Beast
    Ach(14408), -- Heroic: De Other Side
    Ach(14409), -- Mythic: De Other Side
    Ach(14410), -- Heroic: Halls of Atonement
    Ach(14411), -- Mythic: Halls of Atonement
    Ach(14412), -- Heroic: Mists of Tirna Scithe
    Ach(14413), -- Mythic: Mists of Tirna Scithe
    Ach(14414), -- Heroic: Plaguefall
    Ach(14415), -- Mythic: Plaguefall
    Ach(14416), -- Heroic: Theater of Pain
    Ach(14417), -- Mythic: Theater of Pain
    Ach(14418), -- Shadowlands Dungeon Hero
    Ach(14460):PvE(5), -- Ahead of the Curve: Sire Denathrius
    Ach(14461):PvE(5), -- Cutting Edge: Sire Denathrius
    Ach(14463), -- Skoldus Hall
    Ach(14468), -- Twisting Corridors: Layer 1
    Ach(14469):Pet(), -- Twisting Corridors: Layer 2
    Ach(14470), -- Twisting Corridors: Layer 3
    Ach(14471):Toy(), -- Twisting Corridors: Layer 4
    Ach(14472), -- Twisting Corridors: Layer 5
    Ach(14473), -- Fracture Chambers
    Ach(14478), -- The Soulforges
    Ach(14483), -- Coldheart Interstitia
    Ach(14488), -- Mort'regar
    Ach(14493), -- The Upper Reaches
    Ach(14498), -- Gatekeepers of Torghast
    Ach(14499), -- Phanciful
    Ach(14500), -- Phantastic
    Ach(14501), -- Phanatical
    Ach(14502), -- Pursuing Loyalty
    Ach(14503), -- Hooked On Hydroponics
    Ach(14504), -- Niya, As Xavius
    Ach(14505), -- Senthii, As Gul'dan
    Ach(14506), -- Glimmerdust, As Kil'jaeden
    Ach(14507), -- Mi'kai, As Argus
    Ach(14508), -- Glimmerdust, As Jaina
    Ach(14509), -- Astra, As Azshara
    Ach(14510), -- Dreamweaver, As N'Zoth
    Ach(14511):IsPvP(), -- Tour of Duty: Ardenweald
    Ach(14512):IsPvP(), -- Tour of Duty: Revendreth
    Ach(14513):IsPvP(), -- Tour of Duty: Maldraxxus
    Ach(14514):IsPvP(), -- Tour of Duty: Bastion
    Ach(14515):IsPvP(), -- Zo'Sorg's Bidding
    Ach(14516):IsPvP(), -- Impressing Zo'Sorg
    Ach(14519):IsPvP(), -- Covenant Combat
    Ach(14523), -- Taking Care of Business
    Ach(14524), -- I Don't Know What I Expected
    Ach(14525), -- Feed Me, Seymour!
    Ach(14531):Title():PvE(5), -- Shadowlands Keystone Conqueror: Season One
    Ach(14532):Mount():PvE(5), -- Shadowlands Keystone Master: Season One
    Ach(14533), -- Royal Rumble
    Ach(14567), -- Picking Up the Pieces
    Ach(14568):Title(), -- Twisting Corridors: Layer 6
    Ach(14569), -- Twisting Corridors: Layer 7
    Ach(14570):Mount(), -- Twisting Corridors: Layer 8
    Ach(14606), -- Thinking with...
    Ach(14607), -- Fresh Meat!
    Ach(14608), -- Burning Bright
    Ach(14610), -- Clear Conscience
    Ach(14614), -- Castle Vain
    Ach(14617), -- Private Stock
    Ach(14619), -- Pour Decision Making
    Ach(14625):Pet(), -- Battle in the Shadowlands
    Ach(14626), -- Harvester of Sorrow
    Ach(14627), -- Choosing Your Purpose
    Ach(14628), -- The Road to Renown
    Ach(14629), -- Gaining Respect
    Ach(14630), -- Becoming a Hero
    Ach(14631), -- Champion of the Covenant
    Ach(14632), -- Conducting Anima
    Ach(14633), -- Master Navigator
    Ach(14634):Toy(), -- Nine Afterlives
    Ach(14636), -- Adventurer in Chief
    Ach(14637), -- Your Covenant's Flavor
    Ach(14638), -- The Anima Must Flow
    Ach(14639), -- Dedication to the Restoration
    Ach(14656), -- Trading Partners
    Ach(14658), -- Soulkeeper's Burden
    Ach(14659), -- Handling His Henchmen
    Ach(14660), -- It's About Sending a Message
    Ach(14662):IsRealmFirst():Obtainable("Once"), -- Realm First! Shadowlands Keystone Master
    Ach(14663), -- Explore The Maw
    Ach(14670), -- That's the Spirit
    Ach(14671), -- Something's Not Quite Right....
    Ach(14672), -- A Bit of This, A Bit of That
    Ach(14675), -- Spirit Talker
    Ach(14676), -- Divine Spirit Savior
    Ach(14677), -- Spiritual Observations
    Ach(14678), -- Court Favors
    Ach(14679), -- Party Palace
    Ach(14680), -- Something for Everyone
    Ach(14681), -- Dredger Academy
    Ach(14682):Title(), -- The Party Herald
    Ach(14683), -- Dredger Style
    Ach(14684), -- Abominable Lives
    Ach(14685):Title():PvP(30), -- Combatant: Shadowlands Season 1
    Ach(14686):Title():PvP(30), -- Challenger: Shadowlands Season 1
    Ach(14687):Title():PvP(30), -- Rival: Shadowlands Season 1
    Ach(14688):Title():PvP(30), -- Duelist: Shadowlands Season 1
    Ach(14689):Title():Mount():PvP(30), -- Gladiator: Shadowlands Season 1
    Ach(14690):Title():PvP(30), -- Sinful Gladiator: Shadowlands Season 1
    Ach(14691):Title():PvP(30), -- Elite: Shadowlands Season 1
    Ach(14692):AutoFactionSplit(faction.Alliance, 14693):PvP(30), -- Hero of the Alliance: Sinful / Hero of the Horde: Sinful
    Ach(14715), -- Castle Nathria
    Ach(14717), -- Heroic: Castle Nathria
    Ach(14718), -- Mythic: Castle Nathria
    Ach(14721):Toy(), -- It's In The Mix
    Ach(14723), -- Be Our Guest
    Ach(14724), -- People Pleaser
    Ach(14725), -- We Happy Few
    Ach(14726), -- It's Certainly Never Boring
    Ach(14727), -- Master of Ceremonies
    Ach(14728), -- To All the Squirrels Through Time and Space
    Ach(14729), -- To All the Squirrels I Love Despite Their Scars
    Ach(14730), -- To All the Squirrels I Set Sail to See
    Ach(14731), -- To All the Squirrels I've Loved and Lost
    Ach(14733), -- In the Hot Seat
    Ach(14734), -- Rallying Cry of the Ascended
    Ach(14735), -- Flight School Graduate
    Ach(14737), -- What Bastion Remembered
    Ach(14738), -- Hunting Party
    Ach(14741), -- Aerial Ace
    Ach(14742), -- Who Sent You?
    Ach(14743), -- Deadly Serious
    Ach(14744), -- Better to Be Lucky Than Dead
    Ach(14745), -- Grand Theft Shadehound
    Ach(14746), -- Prepare for Trouble!
    Ach(14747), -- Make it Double!
    Ach(14748), -- Wardrobe Makeover
    Ach(14749), -- Rendle's Big Day
    Ach(14750):Obtainable("Before", "Version", {9, 0, 1}), -- Death Rising
    Ach(14751):Mount(), -- The Gang's All Here
    Ach(14752):Title():Mount(), -- Things To Do When You're Dead
    Ach(14753), -- It's a Wrap
    Ach(14754), -- The Forgotten One
    Ach(14755), -- Legendary Accord
    Ach(14758), -- The World Beyond
    Ach(14759), -- It's Coming Back to Me...
    Ach(14760), -- Recollection Collection
    Ach(14761), -- Deciphering Death's Intentions
    Ach(14762), -- Breaking the Stratus Fear
    Ach(14763):Transmog(), -- Crypt Couture
    Ach(14764), -- The Great Luckydo
    Ach(14765), -- Ramparts Racer
    Ach(14766):Toy(), -- Parasoling
    Ach(14767), -- Count Your Blessings
    Ach(14768), -- What is that Melody?
    Ach(14769), -- Bat!
    Ach(14770), -- What We Ride in the Shadows
    Ach(14771), -- The Afterlife Express
    Ach(14772), -- Caught in a Bat Romance
    Ach(14773), -- Explosive Extermination
    Ach(14774), -- Ardenweald Gourmand
    Ach(14775):Title(), -- Mush Appreciated
    Ach(14776), -- For the Hoarder!
    Ach(14777), -- Restoration Expert
    Ach(14778), -- Extremely Ravenous
    Ach(14779), -- Wild Hunting
    Ach(14780), -- Meditation Master
    Ach(14782), -- Level 50
    Ach(14783), -- Level 60
    Ach(14788), -- Fractured Faerie Tales
    Ach(14789), -- All Spirits Great and Small
    Ach(14790), -- Covenant Campaign
    Ach(14791), -- Toss a Seed to Your Hunter...
    Ach(14795), -- Clearing the Fog
    Ach(14796):Obtainable("Before", "Version", {10, 0, 0}), -- Superior (Shadowlands)
    Ach(14797):Obtainable("Before", "Version", {10, 0, 0}), -- Epic (Shadowlands)
    Ach(14798), -- Sojourner of Revendreth
    Ach(14799), -- Sojourner of Maldraxxus
    Ach(14800), -- Sojourner of Ardenweald
    Ach(14801), -- Sojourner of Bastion
    Ach(14802), -- Bloodsport
    Ach(14808), -- Touring Torghast
    Ach(14809), -- Traversing Torghast
    Ach(14810), -- Terror of Torghast
    Ach(14815):AutoFactionSplit(faction.Horde, 14817):IsPvP(), -- Executing the Exarch / Opposing Orgrimmar
}

KrowiAF.AchievementData2["09_00_02"] = {
    {KrowiAF.SetAchievementPatch, 9, 0, 2},
    Ach(14816):PvP(30), -- Sinful Gladiator's Soul Eater
    Ach(14825), -- Shadowlands Voyager
    Ach(14831):IsPvP(), -- I Live, I Die, I Queue Again
    Ach(14833), -- Fashion Abomination
    Ach(14834), -- Bound with Purpose
    Ach(14835), -- A Resolute Bond
    Ach(14836), -- Unwavering Bond
    Ach(14837), -- Nexus of Bonds
    Ach(14839), -- Adventures: Off To Adventure
    Ach(14840), -- Adventures: Learning the Ropes
    Ach(14841), -- Adventures: Now You're Cooking
    Ach(14842), -- Adventures: Strength and Resilience
    Ach(14843), -- Adventures: Harmony of Purpose
    Ach(14844), -- Adventures: Into the Breach
    Ach(14845), -- Adventures: A Step in the Right Direction
    Ach(14846), -- Adventures: Leaves in the Forest
    Ach(14847), -- Adventures: Protector of the Shadowlands
    Ach(14851), -- Bastion of Protection
    Ach(14852), -- The Hoot of the Issue
    Ach(14853), -- All The Colors of the Painbow
    Ach(14854), -- It's Not What You Wear
    Ach(14856), -- Charmed, I'm Sure
    Ach(14857), -- Itsy Bitsy Fighters
    Ach(14858), -- Curse of Thirst
    Ach(14859), -- Inside the Park Home Run
    Ach(14860), -- Bare Necessities
    Ach(14861), -- Learning from the Masters
    Ach(14862), -- It's How You Wear It
    Ach(14863), -- Death Foursworn
    Ach(14864), -- Personal Nightmare
    Ach(14865), -- Disciple of Humility
    Ach(14866), -- Master of the Path
    Ach(14867), -- Shadowlands Safari
    Ach(14868), -- Aquatic Apparitions
    Ach(14869), -- Beast Busters
    Ach(14870), -- Creepy Critters
    Ach(14871), -- Deathly Dragonkin
    Ach(14872), -- Eerie Elementals
    Ach(14873), -- Flickering Fliers
    Ach(14874), -- Haunted Humanoids
    Ach(14875), -- Mummified Magics
    Ach(14876), -- Macabre Mechanicals
    Ach(14877), -- Unholy Undead
    Ach(14879):Pet(), -- Family Exorcist
    Ach(14881):Pet(), -- Abhorrent Adversaries of the Afterlife
    Ach(14887), -- To the Moon
    Ach(14894), -- To 'Ghast, Two Curios
    Ach(14895), -- 'Ghast Five
    Ach(14904):Obtainable("From", "Date", {2021, 2, 1}, "Until", "Date", {2022, 2, 20}), -- Netherwhelp Online
}

KrowiAF.AchievementData2["09_00_05"] = {
    {KrowiAF.SetAchievementPatch, 9, 0, 5},
    Ach(14931), -- Flying Festivities
    Ach(14938):PvE(5), -- Shadowlands Keystone Explorer: Season One
    Ach(15023):Other(), -- We Can Rebuild
    Ach(15024):Other(), -- Denying the Drought
    Ach(15025):Other(), -- Sanctum Superior
}

KrowiAF.AchievementData2["09_01_00"] = {
    {KrowiAF.SetAchievementPatch, 9, 1, 0},
    Ach(14942):Obtainable("From", "Date", {2021, 11, 15}, "Until", "Date", {2021, 12, 6}), -- WoW's 17th Anniversary
    Ach(14943), -- Guarmageddon
    Ach(14961), -- Chains of Domination
    Ach(14968):Title():PvP(31), -- Combatant I: Shadowlands Season 2
    Ach(14969):Title():PvP(31), -- Challenger I: Shadowlands Season 2
    Ach(14970):Title():PvP(31), -- Rival I: Shadowlands Season 2
    Ach(14971):Title():PvP(31), -- Duelist: Shadowlands Season 2
    Ach(14972):Title():Mount():PvP(31), -- Gladiator: Shadowlands Season 2
    Ach(14973):Title():PvP(31), -- Unchained Gladiator: Shadowlands Season 2
    Ach(14974):Title():PvP(31), -- Elite: Shadowlands Season 2
    Ach(14975):AutoFactionSplit(faction.Alliance, 14976):PvP(31), -- Hero of the Alliance: Unchained / Hero of the Horde: Unchained
    Ach(14998), -- Name A Better Duo, I'll Wait
    Ach(14999):PvP(31), -- Unchained Gladiator's Soul Eater
    Ach(15000), -- United Front
    Ach(15001), -- Jailer's Personal Stash
    Ach(15003), -- To the Nines
    Ach(15004):Pet(), -- A Sly Fox
    Ach(15032), -- Breaking Their Hold
    Ach(15033), -- Taking the Tremaculum
    Ach(15034), -- Wings Against the Flames
    Ach(15035), -- On the Offensive
    Ach(15036), -- Rooting Out the Evil
    Ach(15037), -- This Army
    Ach(15039), -- Up For Grabs
    Ach(15040), -- Flawless Fate
    Ach(15041), -- The Zovaal Shuffle
    Ach(15042), -- Tea for the Troubled
    Ach(15043), -- Hoarder of Torghast
    Ach(15044), -- Krrprripripkraak's Heroes
    Ach(15045):Teleport():PvE(6):PvE(7):PvE(13), -- Keystone Hero: The Necrotic Wake
    Ach(15046):Teleport():PvE(6):PvE(7), -- Keystone Hero: Plaguefall
    Ach(15047):Teleport():PvE(6):PvE(7):PvE(13), -- Keystone Hero: Mists of Tirna Scithe
    Ach(15048):Teleport():PvE(6):PvE(7):PvE(15), -- Keystone Hero: Halls of Atonement
    Ach(15049):Teleport():PvE(6):PvE(7), -- Keystone Hero: Spires of Ascension
    Ach(15050):Teleport():PvE(6):PvE(7):PvE(14), -- Keystone Hero: Theater of Pain
    Ach(15051):Teleport():PvE(6):PvE(7), -- Keystone Hero: De Other Side
    Ach(15052):Teleport():PvE(6):PvE(7), -- Keystone Hero: Sanguine Depths
    Ach(15053), -- Explore Korthia
    Ach(15054), -- Minions of the Cold Dark
    Ach(15055), -- Friend of Ooz
    Ach(15056), -- Friend of Bloop
    Ach(15057), -- Friend of Plaguey
    Ach(15058), -- I Used to Bullseye Deeprun Rats Back Home
    Ach(15059), -- Death's Advance
    Ach(15064):Mount(), -- Breaking the Chains
    Ach(15065), -- Eye Wish You Were Here
    Ach(15066), -- Reliquary Restoration
    Ach(15067), -- Adamant Vaults
    Ach(15069), -- The Archivists' Codex
    Ach(15073):PvE(6), -- Shadowlands Keystone Explorer: Season Two
    Ach(15075), -- Infiltrators
    Ach(15076), -- The Box of Many Things
    Ach(15077):Title():PvE(6), -- Shadowlands Keystone Conqueror: Season Two
    Ach(15078):Mount():PvE(6), -- Shadowlands Keystone Master: Season Two
    Ach(15079):Pet(), -- Many, Many Things
    Ach(15080), -- So Blessed
    Ach(15081), -- Flawless: Skoldus Hall (Layer 12)
    Ach(15082), -- Flawless: Fracture Chambers (Layer 12)
    Ach(15083), -- Flawless: Coldheart Interstitia (Layer 12)
    Ach(15084), -- Flawless: The Soulforges (Layer 12)
    Ach(15087), -- Flawless: Mort'regar (Layer 12)
    Ach(15088), -- Flawless: The Upper Reaches (Layer 12)
    Ach(15089):Mount(), -- Flawless Master (Layer 12)
    Ach(15091), -- A Taste of Perfection
    Ach(15092), -- Master of Torment
    Ach(15093), -- Avenge Me!
    Ach(15094), -- Rampage
    Ach(15095), -- No Doubt
    Ach(15096), -- Crowd Pleaser
    Ach(15099), -- Treasures of Korthia
    Ach(15102):IsPvP(), -- It's Off the Chain!
    Ach(15105), -- Tormentor's Tango
    Ach(15106), -- Quality Control
    Ach(15107), -- Conquering Korthia
    Ach(15108), -- Together Forever
    Ach(15109), -- Will it Blend?
    Ach(15110), -- Dominating the Catwalk
    Ach(15112), -- Mythic: The Tarragrue
    Ach(15113), -- Mythic: The Eye of the Jailer
    Ach(15114), -- Mythic: The Nine
    Ach(15115), -- Mythic: Remnant of Ner'zhul
    Ach(15116), -- Mythic: Soulrender Dormazain
    Ach(15117), -- Mythic: Painsmith Raznal
    Ach(15118), -- Mythic: Guardian of the First Ones
    Ach(15119), -- Mythic: Fatescribe Roh-Kalo
    Ach(15120), -- Mythic: Kel'Thuzad
    Ach(15121):Title(), -- Mythic: Sylvanas Windrunner
    Ach(15122), -- The Jailer's Vanguard
    Ach(15123), -- The Dark Bastille
    Ach(15124), -- Shackles of Fate
    Ach(15125), -- The Reckoning
    Ach(15126), -- Sanctum of Domination
    Ach(15127), -- Heroic: Sanctum of Domination
    Ach(15128), -- Mythic: Sanctum of Domination
    Ach(15130):Mount(), -- Glory of the Dominant Raider
    Ach(15131), -- Whack-A-Soul
    Ach(15132), -- Knowledge is Power
    Ach(15133), -- This World is a Prism
    Ach(15134):PvE(6), -- Ahead of the Curve: Sylvanas Windrunner
    Ach(15135):PvE(6), -- Cutting Edge: Sylvanas Windrunner
    Ach(15177), -- Tazavesh, the Veiled Market
    Ach(15178):Mount(), -- Fake It 'Til You Make It
    Ach(15179), -- This is Fine
    Ach(15190), -- Mischief!
    Ach(15191), -- Rae'shalare, Death's Whisper
}

KrowiAF.AchievementData2["09_01_05"] = {
    {KrowiAF.SetAchievementPatch, 9, 1, 5},
    Ach(15181):Obtainable("Event", 141), -- Rock n' Roll
    Ach(15232):PvP(31), -- Combatant II: Shadowlands Season 2
    Ach(15233):PvP(31), -- Challenger II: Shadowlands Season 2
    Ach(15234):PvP(31), -- Rival II: Shadowlands Season 2
    Ach(15241), -- Renowned
    Ach(15308), -- Tower Overwhelming
    Ach(15309), -- A Towering Success
    Ach(15310):Mount(), -- A Tour of Towers
    Ach(15313), -- Rockin' Rollin' Racer
    Ach(15323), -- Sarge's Tale
    Ach(15327):Title():PvE(6), -- Tormented Hero: Shadowlands Season 2
    Ach(15388), -- Shadowlands Explorer
}

KrowiAF.AchievementData2["09_02_00"] = {
    {KrowiAF.SetAchievementPatch, 9, 2, 0},
    Ach(15211):Toy(), -- Completing the Code
    Ach(15212):Obtainable("Event", 374), -- First Dance
    Ach(15213):Obtainable("Event", 374), -- Don't Stop Dancing
    Ach(15214):Obtainable("Event", 374), -- What a Feeling
    Ach(15215):Obtainable("Event", 374), -- Can't Stop the Feeling
    Ach(15216):Obtainable("Event", 374), -- Make You Sweat
    Ach(15217):Obtainable("Event", 374), -- Maniac on the Dance Floor
    Ach(15218):Obtainable("From", "Date", {2022, 11, 6}, "Until", "Date", {2022, 11, 27}), -- WoW's 18th Anniversary
    Ach(15220), -- The Enlightened
    Ach(15221):Toy():Obtainable("Event", 374), -- Dancing Machine
    Ach(15222):Obtainable("Event", 374), -- You Got the Beat
    Ach(15223):Obtainable("Event", 374), -- Feeling It
    Ach(15224), -- Explore Zereth Mortis
    Ach(15229):Toy(), -- Traversing the Spheres
    Ach(15251):Pet(), -- The Jailer's Gauntlet: Layer 1
    Ach(15252):Toy(), -- The Jailer's Gauntlet: Layer 2
    Ach(15253):Title(), -- The Jailer's Gauntlet: Layer 3
    Ach(15254):Mount(), -- The Jailer's Gauntlet: Layer 4
    Ach(15255), -- The Jailer's Gauntlet: Layer 5
    Ach(15256), -- The Jailer's Gauntlet: Layer 6
    Ach(15257), -- The Jailer's Gauntlet: Layer 7
    Ach(15258), -- The Jailer's Gauntlet: Layer 8
    Ach(15259), -- Secrets of the First Ones
    Ach(15314), -- Flawless: Skoldus Hall (Layer 16)
    Ach(15315), -- Amidst Ourselves
    Ach(15316), -- Flawless: Fracture Chambers (Layer 16)
    Ach(15317), -- Flawless: The Soulforges (Layer 16)
    Ach(15318), -- Flawless: Coldheart Interstitia (Layer 16)
    Ach(15319), -- Flawless: Mort'regar (Layer 16)
    Ach(15320), -- Flawless: The Upper Reaches (Layer 16)
    Ach(15322):Mount(), -- Flawless Master (Layer 16)
    Ach(15324):Title(), -- Tower Ranger
    Ach(15331), -- Treasures of Zereth Mortis
    Ach(15336):Mount(), -- From A to Zereth
    Ach(15348):Title():PvP(32), -- Combatant I: Shadowlands Season 3
    Ach(15349):Title():PvP(32), -- Challenger I: Shadowlands Season 3
    Ach(15350):Title():PvP(32), -- Rival I: Shadowlands Season 3
    Ach(15351):Title():PvP(32), -- Duelist: Shadowlands Season 3
    Ach(15352):Title():Mount():PvP(32), -- Gladiator: Shadowlands Season 3
    Ach(15353):Title():PvP(32), -- Cosmic Gladiator: Shadowlands Season 3
    Ach(15354):Title():PvP(32), -- Elite: Shadowlands Season 3
    Ach(15355):AutoFactionSplit(faction.Alliance, 15356):PvP(32), -- Hero of the Alliance: Cosmic / Hero of the Horde: Cosmic
    Ach(15378):PvP(32), -- Rival II: Shadowlands Season 3
    Ach(15379):PvP(32), -- Challenger II: Shadowlands Season 3
    Ach(15380):PvP(32), -- Combatant II: Shadowlands Season 3
    Ach(15381), -- Power ON
    Ach(15384):PvP(32), -- Cosmic Gladiator's Soul Eater
    Ach(15386), -- Shimmering Secrets
    Ach(15391), -- Adventurer of Zereth Mortis
    Ach(15392):Transmog(), -- Dune Dominance
    Ach(15396), -- We Are All Made of Stars
    Ach(15397), -- Four Ring Circus
    Ach(15398), -- Xy Never, Ever Marks the Spot.
    Ach(15399), -- Coming to Terms
    Ach(15400), -- Where the Wild Corgis Are
    Ach(15401), -- Wisdom Comes From the Desert
    Ach(15402):Mount(), -- Cyphers of the First Ones
    Ach(15404), -- Cosmic Empowerment
    Ach(15406), -- Synthesized!
    Ach(15407), -- Synthe-fived!
    Ach(15408):IsPvP(), -- Cosmic Chic
    Ach(15409), -- First Wonders
    Ach(15410), -- Synthe-superfived!
    Ach(15411), -- Synthe-supersized!
    Ach(15416), -- Domination's Grasp
    Ach(15417), -- Sepulcher of the First Ones
    Ach(15418), -- The Grand Design
    Ach(15419), -- The Protoform Matrix
    Ach(15470):PvE(7), -- Ahead of the Curve: The Jailer
    Ach(15471):PvE(7), -- Cutting Edge: The Jailer
    Ach(15478), -- Heroic: Sepulcher of the First Ones
    Ach(15479), -- Mythic: Vigilant Guardian
    Ach(15480), -- Mythic: Skolex
    Ach(15481), -- Mythic: Artificer Xy'mox
    Ach(15482), -- Mythic: Dausegne
    Ach(15483), -- Mythic: Prototype Pantheon
    Ach(15484), -- Mythic: Lihuvim
    Ach(15485), -- Mythic: Halondrus
    Ach(15486), -- Mythic: Anduin Wrynn
    Ach(15487), -- Mythic: Lords of Dread
    Ach(15488), -- Mythic: Rygelon
    Ach(15489):Title(), -- Mythic: The Jailer
    Ach(15490), -- Mythic: Sepulcher of the First Ones
    Ach(15491):Mount(), -- Glory of the Sepulcher Raider
    Ach(15492), -- Cornerstone of Creation
    Ach(15493), -- Ephemeral Plains
    Ach(15494), -- Damnation Aviation
    Ach(15496):PvE(7), -- Shadowlands Keystone Explorer: Season Three
    Ach(15498):Title():PvE(7), -- Shadowlands Keystone Conqueror: Season Three
    Ach(15499):Mount():PvE(7), -- Shadowlands Keystone Master: Season Three
    Ach(15500):Teleport():PvE(7):PvE(8):PvE(15), -- Keystone Hero: Tazavesh, the Veiled Market
    Ach(15502), -- Sand, Sand Everywhere!
    Ach(15506):PvE(7), -- Shadowlands Keystone Hero: Season Three
    Ach(15508):Pet(), -- Fashion of the First Ones
    Ach(15509), -- Tales of the Exile
    Ach(15511):IsPvP(), -- Solely Motivated
    Ach(15512), -- Adventures in Zereth Mortis
    Ach(15513), -- Curious Collections
    Ach(15514):Other(), -- Unlocking the Secrets
    Ach(15515), -- Path to Enlightenment
    Ach(15518), -- A Means to an End
    Ach(15539):IsPvP(), -- Solo Aspirations
    Ach(15540):IsPvP(), -- Steadfast Soloist
    Ach(15541):IsPvP(), -- Sole Survivor
    Ach(15542), -- Apocopocolypse Now
    Ach(15543):IsPvP(), -- Successful Solos
    Ach(15544):Title():IsPvP(), -- Supreme Soloist
}

KrowiAF.AchievementData2["09_02_05"] = {
    {KrowiAF.SetAchievementPatch, 9, 2, 5},
    Ach(15579):Title():Other(), -- Return to Lordaeron
    Ach(15594):Title():Obtainable("From", "Date", {2022, 7, 8}, "Until", "Date", {2022, 7, 24}), -- Fearless Spectator
    Ach(15600):Title():PvP(33), -- Challenger I: Shadowlands Season 4
    Ach(15601):PvP(33), -- Challenger II: Shadowlands Season 4
    Ach(15602):Title():PvP(33), -- Rival I: Shadowlands Season 4
    Ach(15603):PvP(33), -- Rival II: Shadowlands Season 4
    Ach(15604):Title():PvP(33), -- Duelist: Shadowlands Season 4
    Ach(15605):Title():Mount():PvP(33), -- Gladiator: Shadowlands Season 4
    Ach(15606):Title():PvP(33), -- Eternal Gladiator: Shadowlands Season 4
    Ach(15607):AutoFactionSplit(faction.Horde, 15608):PvP(33), -- Hero of the Horde: Eternal / Hero of the Alliance: Eternal
    Ach(15609):Title():PvP(33), -- Combatant I: Shadowlands Season 4
    Ach(15610):PvP(33), -- Combatant II: Shadowlands Season 4
    Ach(15612):PvP(33), -- Eternal Gladiator's Soul Eater
    Ach(15639):Title():PvP(33), -- Elite: Shadowlands Season 4
    Ach(15645), -- To Catch Falling Stars
    Ach(15646), -- Re-Re-Re-Renowned
    Ach(15647), -- Dead Men Tell Some Tales
    Ach(15648):Title(), -- Walking in Maw-mphis
    Ach(15649), -- Shadowlands Dilettante
    Ach(15650), -- Mythic: Streets of Wonder
    Ach(15651), -- Myths of the Shadowlands Dungeons
    Ach(15652), -- Mythic: So'leah's Gambit
    Ach(15653), -- The More You Know*
    Ach(15654):Title():Obtainable("Before", "Version", {10, 0, 2}), -- Back from the Beyond (Legacy)
    Ach(15663):PvE(8), -- Fate of Nathria
    Ach(15664):PvE(8), -- Heroic: Fate of Nathria
    Ach(15665):PvE(8), -- Mythic: Fate of Nathria
    Ach(15667):PvE(8), -- Fate of Domination
    Ach(15668):PvE(8), -- Heroic: Fate of Domination
    Ach(15669):PvE(8), -- Mythic: Fate of Domination
    Ach(15681):PvE(8), -- Fate of the Sepulcher
    Ach(15682):PvE(8), -- Heroic: Fate of the Sepulcher
    Ach(15683):PvE(8), -- Mythic: Fate of the Sepulcher
    Ach(15684):Mount():PvE(8), -- Fates of the Shadowlands Raids
    Ach(15685):Title():PvE(8), -- Heroic: Fates of the Shadowlands Raids
    Ach(15687):Teleport():PvE(8), -- Mythic: Fates of the Shadowlands Raids
    Ach(15688):PvE(8), -- Shadowlands Keystone Explorer: Season Four
    Ach(15689):Title():PvE(8), -- Shadowlands Keystone Conqueror: Season Four
    Ach(15690):Mount():PvE(8), -- Shadowlands Keystone Master: Season Four
    Ach(15691):Title():PvE(7), -- Cryptic Hero: Shadowlands Season 3
    Ach(15692):Teleport():PvE(8), -- Keystone Hero: Return to Karazhan
    Ach(15693):Teleport():PvE(8), -- Keystone Hero: Operation: Mechagon
    Ach(15694):Teleport():PvE(8), -- Keystone Hero: Iron Docks
    Ach(15695):Teleport():PvE(8), -- Keystone Hero: Grimrail Depot
    Ach(15756):Title():PvE(8), -- Shrouded Hero: Shadowlands Season 4
}

KrowiAF.AchievementData2["09_02_07"] = {
    {KrowiAF.SetAchievementPatch, 9, 2, 7},
    Ach(15468):Obtainable("From", "PvE Season", 8, "Before", "Version", {10, 0, 2}), -- We Are All Made of Stars (Heroic)
    Ach(15469):Obtainable("From", "PvE Season", 8, "Before", "Version", {10, 0, 2}), -- We Are All Made of Stars (Mythic)
}