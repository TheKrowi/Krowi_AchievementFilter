local _, addon = ...;
local shared = addon.Data.AchievementData.Shared;
local faction = addon.Objects.Faction;

KrowiAF.AchievementData["09_00_01"] = {
    {13878}, -- The Master of Revendreth
    {14164}, -- "Awaken, Ardenweald"
    {14197}, -- Sanguine Depths
    {14198}, -- Heroic: Sanguine Depths
    {14199}, -- Mythic: Sanguine Depths
    {14206}, -- Blade of the Primus
    {14222}, -- Exile's Reach
    {14233}, -- Tea Tales
    { -- WoW's 16th Anniversary
        14271,
        {
            {},
        },
    },
    {14272}, -- Best Bud With Benefits
    {14273}, -- Crypt Kicker
    {14274}, -- Absolution for All
    {14276}, -- It's Always Sinny in Revendreth
    {14277}, -- The Accuser's Avowed
    {14280}, -- Loremaster of Shadowlands
    {14281}, -- The Path to Ascension
    {14283}, -- Heroic Edition: Ensorcelled Everwyrm
    {14284}, -- Breaking Bad
    {14285}, -- Ready for Raiding VII
    {14286}, -- Residue Evil
    {14289}, -- Kaal-ed Shot
    {14290}, -- I Only Have Eyes For You
    {14291}, -- Someone Could Trip on These!
    {14292}, -- Riding with my Slimes
    {14293}, -- Blind as a Bat
    {14294}, -- Dirtflap's Revenge
    {14295}, -- Bountiful Harvest
    {14296}, -- Going Viral
    {14297}, -- Three Choose One
    {14303}, -- Explore Bastion
    {14304}, -- Explore Ardenweald
    {14305}, -- Explore Maldraxxus
    {14306}, -- Explore Revendreth
    {14307}, -- Adventurer of Bastion
    {14308}, -- Adventurer of Maldraxxus
    {14309}, -- Adventurer of Ardenweald
    {14310}, -- Adventurer of Revendreth
    {14311}, -- Treasures of Bastion
    {14312}, -- Treasures of Maldraxxus
    {14313}, -- Treasures of Ardenweald
    {14314}, -- Treasures of Revendreth
    {14315}, -- Shadowlands Diplomat
    {14320}, -- Surgeon's Supplies
    {14322}, -- Glory of the Shadowlands Hero
    {14323}, -- ExSPEARiential
    {14324}, -- Heroic: Spires of Ascension
    {14325}, -- Mythic: Spires of Ascension
    {14326}, -- Spires of Ascension
    {14327}, -- I Can See My House From Here
    {14328}, -- Professional Shadowlands Master
    {14329}, -- Working the Afterlife
    {14330}, -- Shadowlands Master of All
    {14331}, -- Goliath Offline
    {14332}, -- Shadowlands Cook
    {14333}, -- Shadowlands Fisherman
    {14334}, -- Into the Maw
    {14335}, -- The Ascended
    {14336}, -- Undying Army
    {14337}, -- The Wild Hunt
    {14338}, -- Court of Harvesters
    {14339}, -- Shard Labor
    {14347}, -- Full Gores Meal
    {14352}, -- Nobody Puts Denathrius in a Corner
    {14353}, -- Ardenweald's a Stage
    {14354}, -- Highly Communicable
    {14355}, -- Glory of the Nathria Raider
    {14356}, -- Mythic: Shriekwing
    {14357}, -- Mythic: Huntsman Altimor
    {14358}, -- Mythic: Hungering Destroyer
    {14359}, -- Mythic: Artificer Xy'mox
    {14360}, -- Mythic: Sun King's Salvation
    {14361}, -- Mythic: Lady Inerva Darkvein
    {14362}, -- Mythic: The Council of Blood
    {14363}, -- Mythic: Sludgefist
    {14364}, -- Mythic: Stone Legion Generals
    {14365}, -- Mythic: Sire Denathrius
    {14366}, -- The Necrotic Wake
    {14367}, -- Heroic: The Necrotic Wake
    {14368}, -- Mythic: The Necrotic Wake
    {14369}, -- Plaguefall
    {14370}, -- Halls of Atonement
    {14371}, -- Mists of Tirna Scithe
    {14372}, -- Theater of Pain
    {14373}, -- De Other Side
    {14374}, -- Couple's Therapy
    {14375}, -- Hunger for Knowledge
    {14376}, -- Feed the Beast
    {14408}, -- Heroic: De Other Side
    {14409}, -- Mythic: De Other Side
    {14410}, -- Heroic: Halls of Atonement
    {14411}, -- Mythic: Halls of Atonement
    {14412}, -- Heroic: Mists of Tirna Scithe
    {14413}, -- Mythic: Mists of Tirna Scithe
    {14414}, -- Heroic: Plaguefall
    {14415}, -- Mythic: Plaguefall
    {14416}, -- Heroic: Theater of Pain
    {14417}, -- Mythic: Theater of Pain
    {14418}, -- Shadowlands Dungeon Hero
    { -- Ahead of the Curve: Sire Denathrius
        14460,
        {
            {"Mythic+ Season", 5},
        },
    },
    { -- Cutting Edge: Sire Denathrius
        14461,
        {
            {"Mythic+ Season", 5},
        },
    },
    {14463}, -- Skoldus Hall
    {14468}, -- Twisting Corridors: Layer 1
    {14469}, -- Twisting Corridors: Layer 2
    {14470}, -- Twisting Corridors: Layer 3
    {14471}, -- Twisting Corridors: Layer 4
    {14472}, -- Twisting Corridors: Layer 5
    {14473}, -- Fracture Chambers
    {14478}, -- The Soulforges
    {14483}, -- Coldheart Interstitia
    {14488}, -- Mort'regar
    {14493}, -- The Upper Reaches
    {14498}, -- Gatekeepers of Torghast
    {14499}, -- Phanciful
    {14500}, -- Phantastic
    {14501}, -- Phanatical
    {14502}, -- Pursuing Loyalty
    {14503}, -- Hooked On Hydroponics
    {14504}, -- "Niya, As Xavius"
    {14505}, -- "Senthii, As Gul'dan"
    {14506}, -- "Glimmerdust, As Kil'jaeden"
    {14507}, -- "Mi'kai, As Argus"
    {14508}, -- "Glimmerdust, As Jaina"
    {14509}, -- "Astra, As Azshara"
    {14510}, -- "Dreamweaver, As N'Zoth"
    { -- Tour of Duty: Ardenweald
        14511,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Revendreth
        14512,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Maldraxxus
        14513,
        {
            IsPvP = true,
        },
    },
    { -- Tour of Duty: Bastion
        14514,
        {
            IsPvP = true,
        },
    },
    { -- Zo'Sorg's Bidding
        14515,
        {
            IsPvP = true,
        },
    },
    { -- Impressing Zo'Sorg
        14516,
        {
            IsPvP = true,
        },
    },
    { -- Covenant Combat
        14519,
        {
            IsPvP = true,
        },
    },
    {14523}, -- Taking Care of Business
    {14524}, -- I Don't Know What I Expected
    {14525}, -- "Feed Me, Seymour!"
    { -- Shadowlands Keystone Conqueror: Season One
        14531,
        {
            {"Mythic+ Season", 5},
        },
    },
    { -- Shadowlands Keystone Master: Season One
        14532,
        {
            {"Mythic+ Season", 5},
        },
    },
    {14533}, -- Royal Rumble
    {14567}, -- Picking Up the Pieces
    {14568}, -- Twisting Corridors: Layer 6
    {14569}, -- Twisting Corridors: Layer 7
    {14570}, -- Twisting Corridors: Layer 8
    {14606}, -- Thinking with...
    {14607}, -- Fresh Meat!
    {14608}, -- Burning Bright
    {14610}, -- Clear Conscience
    {14614}, -- Castle Vain
    {14617}, -- Private Stock
    {14619}, -- Pour Decision Making
    {14625}, -- Battle in the Shadowlands
    {14626}, -- Harvester of Sorrow
    {14627}, -- Choosing Your Purpose
    {14628}, -- The Road to Renown
    {14629}, -- Gaining Respect
    {14630}, -- Becoming a Hero
    {14631}, -- Champion of the Covenant
    {14632}, -- Conducting Anima
    {14633}, -- Master Navigator
    {14634}, -- Nine Afterlives
    {14636}, -- Adventurer in Chief
    {14637}, -- Your Covenant's Flavor
    {14638}, -- The Anima Must Flow
    {14639}, -- Dedication to the Restoration
    {14656}, -- Trading Partners
    {14658}, -- Soulkeeper's Burden
    {14659}, -- Handling His Henchmen
    {14660}, -- It's About Sending a Message
    { -- Realm First! Shadowlands Keystone Master
        14662,
        {
            IsRealmFirst = true,
            {"Once"},
        },
    },
    {14663}, -- Explore The Maw
    {14670}, -- That's the Spirit
    {14671}, -- Something's Not Quite Right....
    {14672}, -- "A Bit of This, A Bit of That"
    {14675}, -- Spirit Talker
    {14676}, -- Divine Spirit Savior
    {14677}, -- Spiritual Observations
    {14678}, -- Court Favors
    {14679}, -- Party Palace
    {14680}, -- Something for Everyone
    {14681}, -- Dredger Academy
    {14682}, -- The Party Herald
    {14683}, -- Dredger Style
    {14684}, -- Abominable Lives
    { -- Combatant: Shadowlands Season 1
        14685,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Challenger: Shadowlands Season 1
        14686,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Rival: Shadowlands Season 1
        14687,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Duelist: Shadowlands Season 1
        14688,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Gladiator: Shadowlands Season 1
        14689,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Sinful Gladiator: Shadowlands Season 1
        14690,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Elite: Shadowlands Season 1
        14691,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Hero of the Alliance: Sinful
        14692,
        faction.Alliance,
        14693,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    { -- Hero of the Horde: Sinful
        14693,
        faction.Horde,
        14692,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    {14715}, -- Castle Nathria
    {14717}, -- Heroic: Castle Nathria
    {14718}, -- Mythic: Castle Nathria
    {14721}, -- It's In The Mix
    {14723}, -- Be Our Guest
    {14724}, -- People Pleaser
    {14725}, -- We Happy Few
    {14726}, -- It's Certainly Never Boring
    {14727}, -- Master of Ceremonies
    {14728}, -- To All the Squirrels Through Time and Space
    {14729}, -- To All the Squirrels I Love Despite Their Scars
    {14730}, -- To All the Squirrels I Set Sail to See
    {14731}, -- To All the Squirrels I've Loved and Lost
    {14733}, -- In the Hot Seat
    {14734}, -- Rallying Cry of the Ascended
    {14735}, -- Flight School Graduate
    {14737}, -- What Bastion Remembered
    {14738}, -- Hunting Party
    {14741}, -- Aerial Ace
    {14742}, -- Who Sent You?
    {14743}, -- Deadly Serious
    {14744}, -- Better to Be Lucky Than Dead
    {14745}, -- Grand Theft Shadehound
    {14746}, -- Prepare for Trouble!
    {14747}, -- Make it Double!
    {14748}, -- Wardrobe Makeover
    {14749}, -- Rendle's Big Day
    { -- Death Rising
        14750,
        {
            {"Before", "Version", {9, 0, 1}},
        },
    },
    {14751}, -- The Gang's All Here
    {14752}, -- Things To Do When You're Dead
    {14753}, -- It's a Wrap
    {14754}, -- The Forgotten One
    {14755}, -- Legendary Accord
    {14758}, -- The World Beyond
    {14759}, -- It's Coming Back to Me...
    {14760}, -- Recollection Collection
    {14761}, -- Deciphering Death's Intentions
    {14762}, -- Breaking the Stratus Fear
    {14763}, -- Crypt Couture
    {14764}, -- The Great Luckydo
    {14765}, -- Ramparts Racer
    {14766}, -- Parasoling
    {14767}, -- Count Your Blessings
    {14768}, -- What is that Melody?
    {14769}, -- Bat!
    {14770}, -- What We Ride in the Shadows
    {14771}, -- The Afterlife Express
    {14772}, -- Caught in a Bat Romance
    {14773}, -- Explosive Extermination
    {14774}, -- Ardenweald Gourmand
    {14775}, -- Mush Appreciated
    {14776}, -- For the Hoarder!
    {14777}, -- Restoration Expert
    {14778}, -- Extremely Ravenous
    {14779}, -- Wild Hunting
    {14780}, -- Meditation Master
    {14782}, -- Level 50
    {14783}, -- Level 60
    {14788}, -- Fractured Faerie Tales
    {14789}, -- All Spirits Great and Small
    {14790}, -- Covenant Campaign
    {14791}, -- Toss a Seed to Your Hunter...
    {14795}, -- Clearing the Fog
    { -- Superior (Shadowlands)
        14796,
        {
            {"Before", "Version", {10, 0, 0}},
        },
    },
    { -- Epic (Shadowlands)
        14797,
        {
            {"Before", "Version", {10, 0, 0}},
        },
    },
    {14798}, -- Sojourner of Revendreth
    {14799}, -- Sojourner of Maldraxxus
    {14800}, -- Sojourner of Ardenweald
    {14801}, -- Sojourner of Bastion
    {14802}, -- Bloodsport
    {14808}, -- Touring Torghast
    {14809}, -- Traversing Torghast
    {14810}, -- Terror of Torghast
    { -- Executing the Exarch
        14815,
        faction.Horde,
        14817,
        true,
    },
    { -- Opposing Orgrimmar
        14817,
        faction.Alliance,
        14815,
        true,
    },
    {KrowiAF.SetAchievementPatch, 9, 0, 1}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_00_02"] = {
    { -- Sinful Gladiator's Soul Eater
        14816,
        {
            IsPvP = true,
            {"PvP Season", 30},
        },
    },
    {14825}, -- Shadowlands Voyager
    { -- "I Live, I Die, I Queue Again"
        14831,
        {
            IsPvP = true,
        },
    },
    {14833}, -- Fashion Abomination
    {14834}, -- Bound with Purpose
    {14835}, -- A Resolute Bond
    {14836}, -- Unwavering Bond
    {14837}, -- Nexus of Bonds
    {14839}, -- Adventures: Off To Adventure
    {14840}, -- Adventures: Learning the Ropes
    {14841}, -- Adventures: Now You're Cooking
    {14842}, -- Adventures: Strength and Resilience
    {14843}, -- Adventures: Harmony of Purpose
    {14844}, -- Adventures: Into the Breach
    {14845}, -- Adventures: A Step in the Right Direction
    {14846}, -- Adventures: Leaves in the Forest
    {14847}, -- Adventures: Protector of the Shadowlands
    {14851}, -- Bastion of Protection
    {14852}, -- The Hoot of the Issue
    {14853}, -- All The Colors of the Painbow
    {14854}, -- It's Not What You Wear
    {14856}, -- "Charmed, I'm Sure"
    {14857}, -- Itsy Bitsy Fighters
    {14858}, -- Curse of Thirst
    {14859}, -- Inside the Park Home Run
    {14860}, -- Bare Necessities
    {14861}, -- Learning from the Masters
    {14862}, -- It's How You Wear It
    {14863}, -- Death Foursworn
    {14864}, -- Personal Nightmare
    {14865}, -- Disciple of Humility
    {14866}, -- Master of the Path
    {14867}, -- Shadowlands Safari
    {14868}, -- Aquatic Apparitions
    {14869}, -- Beast Busters
    {14870}, -- Creepy Critters
    {14871}, -- Deathly Dragonkin
    {14872}, -- Eerie Elementals
    {14873}, -- Flickering Fliers
    {14874}, -- Haunted Humanoids
    {14875}, -- Mummified Magics
    {14876}, -- Macabre Mechanicals
    {14877}, -- Unholy Undead
    {14879}, -- Family Exorcist
    {14881}, -- Abhorrent Adversaries of the Afterlife
    {14887}, -- To the Moon
    {14894}, -- "To 'Ghast, Two Curios"
    {14895}, -- 'Ghast Five
    { -- Netherwhelp Online
        14904,
        {
            {"From", "Date", {2021, 2, 1}, "Until", "Date", {2022, 2, 20}},
        },
    },
    {KrowiAF.SetAchievementPatch, 9, 0, 2}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_00_05"] = {
    {14931}, -- Flying Festivities
    { -- Shadowlands Keystone Explorer: Season One
        14938,
        {
            {"Mythic+ Season", 5},
        },
    },
    {15023}, -- We Can Rebuild
    {15024}, -- Denying the Drought
    {15025}, -- Sanctum Superior
    {KrowiAF.SetAchievementPatch, 9, 0, 5}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_01_00"] = {
    { -- WoW's 17th Anniversary
        14942,
        {
            {},
        },
    },
    {14943}, -- Guarmageddon
    {14961}, -- Chains of Domination
    { -- Combatant I: Shadowlands Season 2
        14968,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Challenger I: Shadowlands Season 2
        14969,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Rival I: Shadowlands Season 2
        14970,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Duelist: Shadowlands Season 2
        14971,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Gladiator: Shadowlands Season 2
        14972,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Unchained Gladiator: Shadowlands Season 2
        14973,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Elite: Shadowlands Season 2
        14974,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Hero of the Alliance: Unchained
        14975,
        faction.Alliance,
        14976,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Hero of the Horde: Unchained
        14976,
        faction.Horde,
        14975,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    {14998}, -- "Name A Better Duo, I'll Wait"
    { -- Unchained Gladiator's Soul Eater
        14999,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    {15000}, -- United Front
    {15001}, -- Jailer's Personal Stash
    {15003}, -- To the Nines
    {15004}, -- A Sly Fox
    {15032}, -- Breaking Their Hold
    {15033}, -- Taking the Tremaculum
    {15034}, -- Wings Against the Flames
    {15035}, -- On the Offensive
    {15036}, -- Rooting Out the Evil
    {15037}, -- This Army
    {15039}, -- Up For Grabs
    {15040}, -- Flawless Fate
    {15041}, -- The Zovaal Shuffle
    {15042}, -- Tea for the Troubled
    {15043}, -- Hoarder of Torghast
    {15044}, -- Krrprripripkraak's Heroes
    { -- Keystone Hero: The Necrotic Wake
        15045,
        {
            {"Mythic+ Season", 13},
        },
    },
    { -- Keystone Hero: Plaguefall
        15046,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: Mists of Tirna Scithe
        15047,
        {
            {"Mythic+ Season", 13},
        },
    },
    { -- Keystone Hero: Halls of Atonement
        15048,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: Spires of Ascension
        15049,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: Theater of Pain
        15050,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: De Other Side
        15051,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: Sanguine Depths
        15052,
        {
            {"From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7},
        },
    },
    {15053}, -- Explore Korthia
    {15054}, -- Minions of the Cold Dark
    {15055}, -- Friend of Ooz
    {15056}, -- Friend of Bloop
    {15057}, -- Friend of Plaguey
    {15058}, -- I Used to Bullseye Deeprun Rats Back Home
    {15059}, -- Death's Advance
    {15064}, -- Breaking the Chains
    {15065}, -- Eye Wish You Were Here
    {15066}, -- Reliquary Restoration
    {15067}, -- Adamant Vaults
    {15069}, -- The Archivists' Codex
    { -- Shadowlands Keystone Explorer: Season Two
        15073,
        {
            {"Mythic+ Season", 6},
        },
    },
    {15075}, -- Infiltrators
    {15076}, -- The Box of Many Things
    { -- Shadowlands Keystone Conqueror: Season Two
        15077,
        {
            {"Mythic+ Season", 6},
        },
    },
    { -- Shadowlands Keystone Master: Season Two
        15078,
        {
            {"Mythic+ Season", 6},
        },
    },
    {15079}, -- "Many, Many Things"
    {15080}, -- So Blessed
    {15081}, -- Flawless: Skoldus Hall (Layer 12)
    {15082}, -- Flawless: Fracture Chambers (Layer 12)
    {15083}, -- Flawless: Coldheart Interstitia (Layer 12)
    {15084}, -- Flawless: The Soulforges (Layer 12)
    {15087}, -- Flawless: Mort'regar (Layer 12)
    {15088}, -- Flawless: The Upper Reaches (Layer 12)
    {15089}, -- Flawless Master (Layer 12)
    {15091}, -- A Taste of Perfection
    {15092}, -- Master of Torment
    {15093}, -- Avenge Me!
    {15094}, -- Rampage
    {15095}, -- No Doubt
    {15096}, -- Crowd Pleaser
    {15099}, -- Treasures of Korthia
    { -- It's Off the Chain!
        15102,
        {
            IsPvP = true,
        },
    },
    {15105}, -- Tormentor's Tango
    {15106}, -- Quality Control
    {15107}, -- Conquering Korthia
    {15108}, -- Together Forever
    {15109}, -- Will it Blend?
    {15110}, -- Dominating the Catwalk
    {15112}, -- Mythic: The Tarragrue
    {15113}, -- Mythic: The Eye of the Jailer
    {15114}, -- Mythic: The Nine
    {15115}, -- Mythic: Remnant of Ner'zhul
    {15116}, -- Mythic: Soulrender Dormazain
    {15117}, -- Mythic: Painsmith Raznal
    {15118}, -- Mythic: Guardian of the First Ones
    {15119}, -- Mythic: Fatescribe Roh-Kalo
    {15120}, -- Mythic: Kel'Thuzad
    {15121}, -- Mythic: Sylvanas Windrunner
    {15122}, -- The Jailer's Vanguard
    {15123}, -- The Dark Bastille
    {15124}, -- Shackles of Fate
    {15125}, -- The Reckoning
    {15126}, -- Sanctum of Domination
    {15127}, -- Heroic: Sanctum of Domination
    {15128}, -- Mythic: Sanctum of Domination
    {15130}, -- Glory of the Dominant Raider
    {15131}, -- Whack-A-Soul
    {15132}, -- Knowledge is Power
    {15133}, -- This World is a Prism
    { -- Ahead of the Curve: Sylvanas Windrunner
        15134,
        {
            {"Mythic+ Season", 6},
        },
    },
    { -- Cutting Edge: Sylvanas Windrunner
        15135,
        {
            {"Mythic+ Season", 6},
        },
    },
    {15177}, -- "Tazavesh, the Veiled Market"
    {15178}, -- Fake It 'Til You Make It
    {15179}, -- This is Fine
    {15190}, -- Mischief!
    {15191}, -- "Rae'shalare, Death's Whisper"
    {KrowiAF.SetAchievementPatch, 9, 1, 0}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_01_05"] = {
    { -- Rock n' Roll
        15181,
        {
            {"Event", 141},
        },
    },
    { -- Combatant II: Shadowlands Season 2
        15232,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Challenger II: Shadowlands Season 2
        15233,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    { -- Rival II: Shadowlands Season 2
        15234,
        {
            IsPvP = true,
            {"PvP Season", 31},
        },
    },
    {15241}, -- Renowned
    {15308}, -- Tower Overwhelming
    {15309}, -- A Towering Success
    {15310}, -- A Tour of Towers
    {15313}, -- Rockin' Rollin' Racer
    {15323}, -- Sarge's Tale
    { -- Tormented Hero: Shadowlands Season 2
        15327,
        {
            {"Mythic+ Season", 6},
        },
    },
    {15388}, -- Shadowlands Explorer
    {KrowiAF.SetAchievementPatch, 9, 1, 5}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_02_00"] = {
    {15211}, -- Completing the Code
    { -- First Dance
        15212,
        {
            {"Event", 374},
        },
    },
    { -- Don't Stop Dancing
        15213,
        {
            {"Event", 374},
        },
    },
    { -- What a Feeling
        15214,
        {
            {"Event", 374},
        },
    },
    { -- Can't Stop the Feeling
        15215,
        {
            {"Event", 374},
        },
    },
    { -- Make You Sweat
        15216,
        {
            {"Event", 374},
        },
    },
    { -- Maniac on the Dance Floor
        15217,
        {
            {"Event", 374},
        },
    },
    { -- WoW's 18th Anniversary
        15218,
        {
            {"Event", 1262},
        },
    },
    {15220}, -- The Enlightened
    { -- Dancing Machine
        15221,
        {
            {"Event", 374},
        },
    },
    { -- You Got the Beat
        15222,
        {
            {"Event", 374},
        },
    },
    { -- Feeling It
        15223,
        {
            {"Event", 374},
        },
    },
    {15224}, -- Explore Zereth Mortis
    {15229}, -- Traversing the Spheres
    {15251}, -- The Jailer's Gauntlet: Layer 1
    {15252}, -- The Jailer's Gauntlet: Layer 2
    {15253}, -- The Jailer's Gauntlet: Layer 3
    {15254}, -- The Jailer's Gauntlet: Layer 4
    {15255}, -- The Jailer's Gauntlet: Layer 5
    {15256}, -- The Jailer's Gauntlet: Layer 6
    {15257}, -- The Jailer's Gauntlet: Layer 7
    {15258}, -- The Jailer's Gauntlet: Layer 8
    {15259}, -- Secrets of the First Ones
    {15314}, -- Flawless: Skoldus Hall (Layer 16)
    {15315}, -- Amidst Ourselves
    {15316}, -- Flawless: Fracture Chambers (Layer 16)
    {15317}, -- Flawless: The Soulforges (Layer 16)
    {15318}, -- Flawless: Coldheart Interstitia (Layer 16)
    {15319}, -- Flawless: Mort'regar (Layer 16)
    {15320}, -- Flawless: The Upper Reaches (Layer 16)
    {15322}, -- Flawless Master (Layer 16)
    {15324}, -- Tower Ranger
    {15331}, -- Treasures of Zereth Mortis
    {15336}, -- From A to Zereth
    { -- Combatant I: Shadowlands Season 3
        15348,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Challenger I: Shadowlands Season 3
        15349,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Rival I: Shadowlands Season 3
        15350,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Duelist: Shadowlands Season 3
        15351,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Gladiator: Shadowlands Season 3
        15352,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Cosmic Gladiator: Shadowlands Season 3
        15353,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Elite: Shadowlands Season 3
        15354,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Hero of the Alliance: Cosmic
        15355,
        faction.Alliance,
        15356,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Hero of the Horde: Cosmic
        15356,
        faction.Horde,
        15355,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Rival II: Shadowlands Season 3
        15378,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Challenger II: Shadowlands Season 3
        15379,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    { -- Combatant II: Shadowlands Season 3
        15380,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    {15381}, -- Power ON
    { -- Cosmic Gladiator's Soul Eater
        15384,
        {
            IsPvP = true,
            {"PvP Season", 32},
        },
    },
    {15386}, -- Shimmering Secrets
    {15391}, -- Adventurer of Zereth Mortis
    {15392}, -- Dune Dominance
    {15396}, -- We Are All Made of Stars
    {15397}, -- Four Ring Circus
    {15398}, -- "Xy Never, Ever Marks the Spot."
    {15399}, -- Coming to Terms
    {15400}, -- Where the Wild Corgis Are
    {15401}, -- Wisdom Comes From the Desert
    {15402}, -- Cyphers of the First Ones
    {15404}, -- Cosmic Empowerment
    {15406}, -- Synthesized!
    {15407}, -- Synthe-fived!
    { -- Cosmic Chic
        15408,
        {
            IsPvP = true,
        },
    },
    {15409}, -- First Wonders
    {15410}, -- Synthe-superfived!
    {15411}, -- Synthe-supersized!
    {15416}, -- Domination's Grasp
    {15417}, -- Sepulcher of the First Ones
    {15418}, -- The Grand Design
    {15419}, -- The Protoform Matrix
    { -- Ahead of the Curve: The Jailer
        15470,
        {
            {"Mythic+ Season", 7},
        },
    },
    { -- Cutting Edge: The Jailer
        15471,
        {
            {"Mythic+ Season", 7},
        },
    },
    {15478}, -- Heroic: Sepulcher of the First Ones
    {15479}, -- Mythic: Vigilant Guardian
    {15480}, -- Mythic: Skolex
    {15481}, -- Mythic: Artificer Xy'mox
    {15482}, -- Mythic: Dausegne
    {15483}, -- Mythic: Prototype Pantheon
    {15484}, -- Mythic: Lihuvim
    {15485}, -- Mythic: Halondrus
    {15486}, -- Mythic: Anduin Wrynn
    {15487}, -- Mythic: Lords of Dread
    {15488}, -- Mythic: Rygelon
    {15489}, -- Mythic: The Jailer
    {15490}, -- Mythic: Sepulcher of the First Ones
    {15491}, -- Glory of the Sepulcher Raider
    {15492}, -- Cornerstone of Creation
    {15493}, -- Ephemeral Plains
    {15494}, -- Damnation Aviation
    { -- Shadowlands Keystone Explorer: Season Three
        15496,
        {
            {"Mythic+ Season", 7},
        },
    },
    { -- Shadowlands Keystone Conqueror: Season Three
        15498,
        {
            {"Mythic+ Season", 7},
        },
    },
    { -- Shadowlands Keystone Master: Season Three
        15499,
        {
            {"Mythic+ Season", 7},
        },
    },
    { -- "Keystone Hero: Tazavesh, the Veiled Market"
        15500,
        {
            {"From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 8},
        },
    },
    {15502}, -- "Sand, Sand Everywhere!"
    { -- Shadowlands Keystone Hero: Season Three
        15506,
        {
            {"Mythic+ Season", 7},
        },
    },
    {15508}, -- Fashion of the First Ones
    {15509}, -- Tales of the Exile
    { -- Solely Motivated
        15511,
        {
            IsPvP = true,
        },
    },
    {15512}, -- Adventures in Zereth Mortis
    {15513}, -- Curious Collections
    {15514}, -- Unlocking the Secrets
    {15515}, -- Path to Enlightenment
    {15518}, -- A Means to an End
    { -- Solo Aspirations
        15539,
        {
            IsPvP = true,
        },
    },
    { -- Steadfast Soloist
        15540,
        {
            IsPvP = true,
        },
    },
    { -- Sole Survivor
        15541,
        {
            IsPvP = true,
        },
    },
    {15542}, -- Apocopocolypse Now
    { -- Successful Solos
        15543,
        {
            IsPvP = true,
        },
    },
    { -- Supreme Soloist
        15544,
        {
            IsPvP = true,
        },
    },
    {KrowiAF.SetAchievementPatch, 9, 2, 0}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_02_05"] = {
    {15579}, -- Return to Lordaeron
    { -- Fearless Spectator
        15594,
        {
            {"From", "Date", {2022, 7, 8}, "Until", "Date", {2022, 7, 24}},
        },
    },
    { -- Challenger I: Shadowlands Season 4
        15600,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Challenger II: Shadowlands Season 4
        15601,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Rival I: Shadowlands Season 4
        15602,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Rival II: Shadowlands Season 4
        15603,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Duelist: Shadowlands Season 4
        15604,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Gladiator: Shadowlands Season 4
        15605,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Eternal Gladiator: Shadowlands Season 4
        15606,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Hero of the Horde: Eternal
        15607,
        faction.Horde,
        15608,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Hero of the Alliance: Eternal
        15608,
        faction.Alliance,
        15607,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Combatant I: Shadowlands Season 4
        15609,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Combatant II: Shadowlands Season 4
        15610,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Eternal Gladiator's Soul Eater
        15612,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    { -- Elite: Shadowlands Season 4
        15639,
        {
            IsPvP = true,
            {"PvP Season", 33},
        },
    },
    {15645}, -- To Catch Falling Stars
    {15646}, -- Re-Re-Re-Renowned
    {15647}, -- Dead Men Tell Some Tales
    {15648}, -- Walking in Maw-mphis
    {15649}, -- Shadowlands Dilettante
    {15650}, -- Mythic: Streets of Wonder
    {15651}, -- Myths of the Shadowlands Dungeons
    {15652}, -- Mythic: So'leah's Gambit
    {15653}, -- The More You Know*
    { -- Back from the Beyond (Legacy)
        15654,
        {
            {"Before", "Version", {10, 0, 2}},
        },
    },
    { -- Fate of Nathria
        15663,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Heroic: Fate of Nathria
        15664,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Mythic: Fate of Nathria
        15665,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Fate of Domination
        15667,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Heroic: Fate of Domination
        15668,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Mythic: Fate of Domination
        15669,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Fate of the Sepulcher
        15681,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Heroic: Fate of the Sepulcher
        15682,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Mythic: Fate of the Sepulcher
        15683,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Fates of the Shadowlands Raids
        15684,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Heroic: Fates of the Shadowlands Raids
        15685,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Mythic: Fates of the Shadowlands Raids
        15687,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Shadowlands Keystone Explorer: Season Four
        15688,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Shadowlands Keystone Conqueror: Season Four
        15689,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Shadowlands Keystone Master: Season Four
        15690,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Cryptic Hero: Shadowlands Season 3
        15691,
        {
            {"Mythic+ Season", 7},
        },
    },
    { -- Keystone Hero: Return to Karazhan
        15692,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Keystone Hero: Operation: Mechagon
        15693,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Keystone Hero: Iron Docks
        15694,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Keystone Hero: Grimrail Depot
        15695,
        {
            {"Mythic+ Season", 8},
        },
    },
    { -- Shrouded Hero: Shadowlands Season 4
        15756,
        {
            {"Mythic+ Season", 8},
        },
    },
    {KrowiAF.SetAchievementPatch, 9, 2, 5}, -- Rework loading so this can go to the top, future me problem
};

KrowiAF.AchievementData["09_02_07"] = {
    { -- We Are All Made of Stars (Heroic)
        15468,
        {
            {"From", "Mythic+ Season", 8, "Before", "Version", {10, 0, 2}},
        },
    },
    { -- We Are All Made of Stars (Mythic)
        15469,
        {
            {"From", "Mythic+ Season", 8, "Before", "Version", {10, 0, 2}},
        },
    },
    {KrowiAF.SetAchievementPatch, 9, 2, 7}, -- Rework loading so this can go to the top, future me problem
};