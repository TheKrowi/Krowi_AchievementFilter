-- [[ Exported at 2023-08-24 13-33-38 ]] --
-- [[ This code is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. ]] --

-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
local f = objects.Faction;
local a = objects.Achievement;
local data = addon.Data;
local custObj = data.CustomObjectives;
data.ExportedAchievements = {};
local exportedAchievements = data.ExportedAchievements;

local function T(v, ...)
    v:AddTransmogSet(...)
end

local function O(v, ...)
    v:SetTemporaryObtainable(...)
end

local t, u;
local workload = {
    function() t[19107] = a:New(19107); end, -- Outland Racing Completionist: Gold
    function() t[19106] = a:New(19106); end, -- Outland Racing Completionist: Silver
    function() t[19105] = a:New(19105); end, -- Outland Racing Completionist
    function() t[19104] = a:New(19104); end, -- Outland Reverse: Gold
    function() t[19103] = a:New(19103); end, -- Outland Reverse: Silver
    function() t[19102] = a:New(19102); end, -- Outland Reverse: Bronze
    function() t[19101] = a:New(19101); end, -- Outland Advanced: Gold
    function() t[19100] = a:New(19100); end, -- Outland Advanced: Silver
    function() t[19099] = a:New(19099); end, -- Outland Advanced: Bronze
    function() t[19098] = a:New(19098); end, -- Outland: Gold
    function() t[19097] = a:New(19097); end, -- Outland: Silver
    function() t[19092] = a:New(19092); end, -- Outland: Bronze
    function() t[19079] = a:New(19079); end, -- Master of the Turbulent Timeways
    function() t[19028] = a:New(19028); end, -- Lil' Frostwing
    function() t[19008] = a:New(19008); end, -- Dream Shaper
    function() t[18977] = a:New(18977); end, -- Draconically Epic
    function() t[18976] = a:New(18976); end, -- Draconically Superior
    function() t[18963] = a:New(18963); end, -- Burst Damage
    function() t[18962] = a:New(18962); end, -- A Cleansing Fire
    function() t[18960] = a:New(18960); end, -- Kickin' With the Wick
    function() t[18959] = a:New(18959); end, -- "Don't Lose Your Head, Man"
    function() t[18942] = a:New(18942); end, -- Eastern Kingdoms Racing Completionist: Gold
    function() t[18941] = a:New(18941); end, -- Dazzling Dragons
    function() t[18940] = a:New(18940); end, -- Eastern Kingdoms Racing Completionist: Silver
    function() t[18939] = a:New(18939); end, -- Eastern Kingdoms Racing Completionist
    function() t[18934] = a:New(18934); end, -- Excessive Experimentation
    function() t[18909] = a:New(18909); end, -- Fantastic Figurines
    function() t[18908] = a:New(18908); end, -- Chromatic Calibration: Bio-Optic Killshades
    function() t[18907] = a:New(18907); end, -- Chromatic Calibration: Ectoplasmic Specs
    function() t[18906] = a:New(18906); end, -- Chromatic Calibration: Cranial Cannons
    function() t[18905] = a:New(18905); end, -- Chromatic Calibration: Retinal Armor
    function() t[18904] = a:New(18904); end, -- Iron to Vendor Gold
    function() t[18903] = a:New(18903); end, -- Ton of Tops
    function() t[18902] = a:New(18902); end, -- Uncertified Nurse
    function() t[18901] = a:New(18901); end, -- Chromatic Calibration: Holo-Gogs
    function() t[18900] = a:New(18900); end, -- Budget Bard
    function() t[18899] = a:New(18899); end, -- You Saw Nothing
    function() t[18898] = a:New(18898); end, -- That's Just Cruel
    function() t[18897] = a:New(18897); end, -- Can't Crush These
    function() t[18896] = a:New(18896); end, -- United as Three
    function() t[18895] = a:New(18895); end, -- You Had it Coming
    function() t[18894] = a:New(18894); end, -- Free Stylin'
    function() t[18893] = a:New(18893); end, -- Plentiful Prospects
    function() t[18892] = a:New(18892); end, -- Massive Mills
    function() t[18891] = a:New(18891); end, -- Generations of Gemstones IV
    function() t[18890] = a:New(18890); end, -- Generations of Gemstones III
    function() t[18889] = a:New(18889); end, -- Generations of Gemstones II
    function() t[18888] = a:New(18888); end, -- Quite the Quilt IV
    function() t[18887] = a:New(18887); end, -- Quite the Quilt III
    function() t[18886] = a:New(18886); end, -- Quite the Quilt II
    function() t[18885] = a:New(18885); end, -- Quite the Quilt I
    function() t[18884] = a:New(18884); end, -- A Test of Scale IV
    function() t[18883] = a:New(18883); end, -- A Test of Scale III
    function() t[18882] = a:New(18882); end, -- A Test of Scale II
    function() t[18881] = a:New(18881); end, -- A Test of Scale I
    function() t[18880] = a:New(18880); end, -- Generations of Gemstones I
    function() t[18879] = a:New(18879); end, -- Ink and Quill IV
    function() t[18878] = a:New(18878); end, -- Ink and Quill III
    function() t[18877] = a:New(18877); end, -- Ink and Quill II
    function() t[18876] = a:New(18876); end, -- Ink and Quill I
    function() t[18875] = a:New(18875); end, -- Dangerous Devices IV
    function() t[18874] = a:New(18874); end, -- Dangerous Devices III
    function() t[18873] = a:New(18873); end, -- Dangerous Devices II
    function() t[18872] = a:New(18872); end, -- Dangerous Devices I
    function() t[18871] = a:New(18871); end, -- Enchantment IV
    function() t[18870] = a:New(18870); end, -- Enchantment III
    function() t[18869] = a:New(18869); end, -- Enchantment II
    function() t[18868] = a:New(18868); end, -- Enchantment I
    function() t[18867] = a:New(18867); end, -- Through the Ashes and Flames
    function() t[18866] = a:New(18866); end, -- Anvil Mastery IV
    function() t[18865] = a:New(18865); end, -- Anvil Mastery III
    function() t[18864] = a:New(18864); end, -- Anvil Mastery II
    function() t[18862] = a:New(18862); end, -- Anvil Mastery I
    function() t[18859] = a:New(18859); end, -- Forge and Befuddle
    function() t[18858] = a:New(18858); end, -- Forge and Befuddle
    function() t[18857] = a:New(18857); end, -- That's No Ordinary Gas Cloud!
    function() t[18856] = a:New(18856); end, -- Just an Ordinary Gas Cloud
    function() t[18855] = a:New(18855); end, -- Portal to Everywhere
    function() t[18853] = a:New(18853); end, -- Seething Flames of Hatred
    function() t[18852] = a:New(18852); end, -- "Weaponsmithing, Reborn"
    function() t[18851] = a:New(18851); end, -- Skeletons in the Lockbox
    function() t[18841] = a:New(18841); end, -- Doing Your Share
    function() t[18840] = a:New(18840); end, -- Fourth War Mining Techniques
    function() t[18839] = a:New(18839); end, -- Broken Isles Mining Techniques
    function() t[18838] = a:New(18838); end, -- Fourth War Herbalism Techniques
    function() t[18837] = a:New(18837); end, -- Broken Isles Herbalism Techniques
    function() t[18835] = a:New(18835); end, -- Fourth War Skinning Techniques
    function() t[18834] = a:New(18834); end, -- Broken Isles Skinning Techniques
    function() t[18833] = a:New(18833); end, -- Elusive Legends of the Dragon Isles
    function() t[18832] = a:New(18832); end, -- Elusive Legend of the Dragon Isles
    function() t[18831] = a:New(18831); end, -- Elusive Beasts of the Dragon Isles
    function() t[18829] = a:New(18829); end, -- Botanist's Log - Overloaded Elements
    function() t[18828] = a:New(18828); end, -- Botanist's Log: Dragon Isles
    function() t[18825] = a:New(18825); end, -- Botanist's Log - Writhebark
    function() t[18824] = a:New(18824); end, -- Botanist's Log - Bubble Poppy
    function() t[18823] = a:New(18823); end, -- Botanist's Log - Saxifrage
    function() t[18822] = a:New(18822); end, -- Botanist's Log - Hochenblume
    function() t[18821] = a:New(18821); end, -- Geologist's Ledger - Overloaded Elements
    function() t[18820] = a:New(18820); end, -- Geologist's Ledger: Dragon Isles
    function() t[18819] = a:New(18819); end, -- Geologist's Ledger - Draconium
    function() t[18818] = a:New(18818); end, -- Geologist's Ledger - Serevite
    function() t[18817] = a:New(18817); end, -- Showoff Chef
    function() t[18816] = a:New(18816); end, -- Serious Chef
    function() t[18815] = a:New(18815); end, -- Speed Dreamin'
    function() t[18805] = a:New(18805); end, -- Draconic Phial Cabinet
    function() t[18804] = a:New(18804); end, -- Neltharion's Legacy
    function() t[18793] = a:New(18793); end, -- Always Be Camping
    function() t[18792] = a:New(18792); end, -- Dragonriding Challenge: Dragon Isles: Gold
    function() t[18791] = a:New(18791); end, -- Dragonriding Challenge: Dragon Isles: Silver
    function() t[18790] = a:New(18790); end, -- Dragonriding Challenge: Dragon Isles: Bronze
    function() t[18789] = a:New(18789); end, -- Simply Enchanting
    function() t[18788] = a:New(18788); end, -- Zaralek Cavern Challenge: Gold
    function() t[18787] = a:New(18787); end, -- Zaralek Cavern Challenge: Silver
    function() t[18786] = a:New(18786); end, -- Zaralek Cavern Challenge: Bronze
    function() t[18785] = a:New(18785); end, -- Shattered Expectations
    function() t[18781] = a:New(18781); end, -- Forbidden Reach Challenge: Gold
    function() t[18780] = a:New(18780); end, -- Forbidden Reach Challenge: Silver
    function() t[18779] = a:New(18779); end, -- Forbidden Reach Challenge: Bronze
    function() t[18778] = a:New(18778); end, -- Massive Toolshed
    function() t[18777] = a:New(18777); end, -- Mallet of Thunderous Skins
    function() t[18776] = a:New(18776); end, -- The Ub3r-Spanner
    function() t[18775] = a:New(18775); end, -- Iwen's Enchanting Rod
    function() t[18774] = a:New(18774); end, -- Synchronous Thread
    function() t[18773] = a:New(18773); end, -- Jewelhammer's Focus
    function() t[18772] = a:New(18772); end, -- Sanguine Feather Quill of Lana'thel
    function() t[18771] = a:New(18771); end, -- Khaz'gorian Smithing Hammer
    function() t[18770] = a:New(18770); end, -- Silas' Sphere of Transmutation
    function() t[18769] = a:New(18769); end, -- Disenchantment IV
    function() t[18768] = a:New(18768); end, -- Disenchantment III
    function() t[18767] = a:New(18767); end, -- Disenchantment II
    function() t[18766] = a:New(18766); end, -- Disenchantment I
    function() t[18765] = a:New(18765); end, -- Destined to be Legendary
    function() t[18764] = a:New(18764); end, -- Break Upon Your Body
    function() t[18763] = a:New(18763); end, -- Spectre of Spectacles
    function() t[18762] = a:New(18762); end, -- Thaldraszus Challenge: Gold
    function() t[18761] = a:New(18761); end, -- Thaldraszus Challenge: Silver
    function() t[18760] = a:New(18760); end, -- Thaldraszus Challenge: Bronze
    function() t[18759] = a:New(18759); end, -- Azure Span Challenge: Gold
    function() t[18758] = a:New(18758); end, -- Azure Span Challenge: Silver
    function() t[18757] = a:New(18757); end, -- Azure Span Challenge: Bronze
    function() t[18756] = a:New(18756); end, -- Ohn'ahran Plains Challenge: Gold
    function() t[18755] = a:New(18755); end, -- Ohn'ahran Plains Challenge: Silver
    function() t[18754] = a:New(18754); end, -- Ohn'ahran Plains Challenge: Bronze
    function() t[18750] = a:New(18750); end, -- Waking Shores Challenge: Gold
    function() t[18749] = a:New(18749); end, -- Waking Shores Challenge: Silver
    function() t[18748] = a:New(18748); end, -- Waking Shores Challenge: Bronze
    function() t[18738] = a:New(18738); end, -- Population In-Crease
    function() t[18737] = a:New(18737); end, -- Powerful Concoctions IV
    function() t[18736] = a:New(18736); end, -- Powerful Concoctions III
    function() t[18735] = a:New(18735); end, -- Powerful Concoctions II
    function() t[18734] = a:New(18734); end, -- Powerful Concoctions I
    function() t[18733] = a:New(18733); end, -- A Cure for All Ails IV
    function() t[18732] = a:New(18732); end, -- A Cure for All Ails III
    function() t[18731] = a:New(18731); end, -- A Cure for All Ails II
    function() t[18730] = a:New(18730); end, -- Goblins vs Gnomes
    function() t[18729] = a:New(18729); end, -- Working in Hellfire
    function() t[18728] = a:New(18728); end, -- Working from the Start
    function() t[18727] = a:New(18727); end, -- Rave Leader
    function() t[18726] = a:New(18726); end, -- A Cure for All Ails I
    function() t[18725] = a:New(18725); end, -- Best Stellar
    function() t[18724] = a:New(18724); end, -- Gaining an Advantus
    function() t[18723] = a:New(18723); end, -- "Look, You're Specialized!"
    function() t[18722] = a:New(18722); end, -- Northrend Master of All
    function() t[18721] = a:New(18721); end, -- Outland Master of All
    function() t[18720] = a:New(18720); end, -- Classic Master of All
    function() t[18719] = a:New(18719); end, -- Cataclysmic Master of All
    function() t[18706] = a:New(18706); end, -- Put That Thing Back Where It Came From
    function() t[18705] = a:New(18705); end, -- Defender of the Timeways
    function() t[18704] = a:New(18704); end, -- Dawn of the Infinite: Murozond's Rise
    function() t[18703] = a:New(18703); end, -- Dawn of the Infinite: Galakrond's Fall
    function() t[18702] = a:New(18702); end, -- WoW's 19th Anniversary
    function() t[18646] = a:New(18646); end, -- Whodunnit?
    function() t[18645] = a:New(18645); end, -- Tools of the Trade
    function() t[18644] = a:New(18644); end, -- Community Rumor Mill
    function() t[18643] = a:New(18643); end, -- Community Rumors
    function() t[18642] = a:New(18642); end, -- The Inquisitive
    function() t[18641] = a:New(18641); end, -- To All The Squirrels I've BEEN Before
    function() t[18640] = a:New(18640); end, -- Lock and Load
    function() t[18639] = a:New(18639); end, -- Collapsed Reality
    function() t[18638] = a:New(18638); end, -- Minute Menagerie
    function() t[18637] = a:New(18637); end, -- Chronograde Connoisseur
    function() t[18636] = a:New(18636); end, -- Just Following Chronological Orders
    function() t[18635] = a:New(18635); end, -- Verified Rifter
    function() t[18616] = a:New(18616); end, -- Putting Wilhelm Out of Business
    function() t[18615] = a:New(18615); end, -- Legend of the Multiverse
    function() t[18612] = a:New(18612); end, -- A Slime in Need
    function() t[18589] = a:New(18589); end, -- Crunch Time
    function() t[18579] = a:New(18579); end, -- A Round on the House
    function() t[18574] = a:New(18574); end, -- Eastern Kingdoms Reverse: Gold
    function() t[18573] = a:New(18573); end, -- Eastern Kingdoms Reverse: Silver
    function() t[18572] = a:New(18572); end, -- Eastern Kingdoms Reverse: Bronze
    function() t[18571] = a:New(18571); end, -- Eastern Kingdoms Advanced: Gold
    function() t[18570] = a:New(18570); end, -- Eastern Kingdoms Advanced: Silver
    function() t[18569] = a:New(18569); end, -- Eastern Kingdoms Advanced: Bronze
    function() t[18568] = a:New(18568); end, -- Eastern Kingdoms: Gold
    function() t[18567] = a:New(18567); end, -- Eastern Kingdoms: Silver
    function() t[18566] = a:New(18566); end, -- Eastern Kingdoms: Bronze
    function() t[18559] = a:New(18559); end, -- "Many Boxes, Many Rockses"
    function() t[18558] = a:New(18558); end, -- Leaders of Scholomance
    function() t[18557] = a:New(18557); end, -- "Never Bothered, Anyway"
    function() t[18556] = a:New(18556); end, -- Chaotic Time
    function() t[18554] = a:New(18554); end, -- Temporal Acquisitions Specialist
    function() O(t[18542], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[18542] = a:New(18542); end, -- Dragonflight Keystone Master: Season Two
    function() t[18539] = a:New(18539); end, -- Back En-masse
    function() t[18471] = a:New(18471); end, -- 110 Exalted Reputations
    function() t[18384] = a:New(18384); end, -- "Whelp, There It Is"
    function() t[18383] = a:New(18383); end, -- Hey Nanny Nanny
    function() t[18380] = a:New(18380); end, -- Dragonflight Season 2 Hero
    function() t[18372] = a:New(18372); end, -- Wards of the Dread Citadel
    function() t[18368] = a:New(18368); end, -- Memory of Scholomance
    function() t[18361] = a:New(18361); end, -- To All the Squirrels Burrowed Beneath
    function() t[18360] = a:New(18360); end, -- Tricks and Treats of the Dragon Isles
    function() t[18284] = a:New(18284); end, -- A Niffen's Best Buddy
    function() t[18271] = a:New(18271); end, -- He'sSss All Mine
    function() t[18258] = a:New(18258); end, -- Little Lord of Lies
    function() t[18257] = a:New(18257); end, -- Can You Dig It?
    function() t[18256] = a:New(18256); end, -- "Nasz'uro, the Unbound Legacy"
    function() t[18255] = a:New(18255); end, -- Proof of Myrrit
    function() O(t[18254], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[18254] = a:New(18254); end, -- Cutting Edge: Scalecommander Sarkareth
    function() O(t[18253], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[18253] = a:New(18253); end, -- Ahead of the Curve: Scalecommander Sarkareth
    function() t[18251] = a:New(18251); end, -- Glory of the Aberrus Raider
    function() t[18249] = a:New(18249, nil, nil, true); end, -- Obsidian Tie Event
    function() t[18230] = a:New(18230); end, -- Whac-A-Swog
    function() t[18229] = a:New(18229); end, -- Cosplate
    function() t[18228] = a:New(18228); end, -- Are You Even Trying?
    function() t[18209] = a:New(18209); end, -- Nothing Stops the Research
    function() t[18208] = a:New(18208); end, -- The Small Disruptions
    function() t[18207] = a:New(18207); end, -- Hot Research Zone
    function() t[18206] = a:New(18206); end, -- A Djaradin Puzzle
    function() t[18205] = a:New(18205); end, -- A Pillar of the Research Community
    function() t[18204] = a:New(18204); end, -- Research Mishap
    function() t[18203] = a:New(18203); end, -- A Research Sampler
    function() t[18202] = a:New(18202); end, -- Rockin Research
    function() t[18201] = a:New(18201); end, -- Lockdown Mystery
    function() t[18200] = a:New(18200); end, -- Cooling the Research Field
    function() t[18199] = a:New(18199); end, -- Zaqali Ritual Buster
    function() t[18193] = a:New(18193); end, -- Eggscellent Eggsecution
    function() t[18174] = a:New(18174); end, -- Contaminant Cleaner
    function() t[18173] = a:New(18173); end, -- Tabula Rasa
    function() t[18172] = a:New(18172); end, -- Escar-Go-Go-Go
    function() t[18168] = a:New(18168); end, -- I'll Make My Own Shadowflame
    function() t[18167] = a:New(18167); end, -- Edge of the Void
    function() t[18165] = a:New(18165); end, -- Neltharion's Shadow
    function() t[18164] = a:New(18164); end, -- Fury of Giants
    function() t[18163] = a:New(18163); end, -- Discarded Works
    function() t[18162] = a:New(18162); end, -- "Mythic: Aberrus, the Shadowed Crucible"
    function() t[18161] = a:New(18161); end, -- "Heroic: Aberrus, the Shadowed Crucible"
    function() t[18160] = a:New(18160); end, -- "Aberrus, the Shadowed Crucible"
    function() t[18159] = a:New(18159); end, -- Mythic: Scalecommander Sarkareth
    function() t[18158] = a:New(18158); end, -- Mythic: Echo of Neltharion
    function() t[18157] = a:New(18157); end, -- Mythic: Magmorax
    function() t[18156] = a:New(18156); end, -- "Mythic: The Vigilant Steward, Zskarn"
    function() t[18155] = a:New(18155); end, -- "Mythic: Rashok, the Elder"
    function() t[18154] = a:New(18154); end, -- Mythic: Assault of the Zaqali
    function() t[18153] = a:New(18153); end, -- Mythic: The Forgotten Experiments
    function() t[18152] = a:New(18152); end, -- Mythic: The Amalgamation Chamber
    function() t[18151] = a:New(18151); end, -- "Mythic: Kazzara, the Hellforged"
    function() t[18150] = a:New(18150); end, -- Zaralek Cavern Glyph Hunter
    function() t[18149] = a:New(18149); end, -- Objects in Transit May Shatter
    function() t[18100] = a:New(18100); end, -- Cavern Clawbbering
    function() t[18027] = a:New(18027); end, -- Dragonflight Season 2 Master
    function() t[17978] = a:New(17978); end, -- Stones Can Fly!
    function() t[17977] = a:New(17977); end, -- Stones Can Try To Fly!
    function() t[17934] = a:New(17934); end, -- Family Battler of Zaralek Cavern
    function() t[17918] = a:New(17918); end, -- Undead Battler of Zaralek Caverm
    function() t[17917] = a:New(17917); end, -- Mechanical Battler of Zaralek Cavern
    function() t[17916] = a:New(17916); end, -- Magic Battler of Zaralek Cavern
    function() t[17915] = a:New(17915); end, -- Humanoid Battler of Zaralek Cavern
    function() t[17905] = a:New(17905); end, -- Flying Battler of Zaralek Cavern
    function() t[17904] = a:New(17904); end, -- Elemental Battler of Zaralek Cavern
    function() t[17890] = a:New(17890); end, -- Dragonkin Battler of Zaralek Cavern
    function() t[17883] = a:New(17883); end, -- Critter Battler of Zaralek Cavern
    function() t[17882] = a:New(17882); end, -- Beast Battler of Zaralek Cavern
    function() t[17881] = a:New(17881); end, -- Aquatic Battler of Zaralek Cavern
    function() t[17880] = a:New(17880); end, -- Battle in Zaralek Cavern
    function() t[17879] = a:New(17879); end, -- Zaralek Cavern Safari
    function() t[17878] = a:New(17878); end, -- Me Want Bite
    function() t[17877] = a:New(17877); end, -- "We'll Never See That Again, Surely"
    function() t[17852] = a:New(17852, nil, nil, true); end, -- Elemental Conjuror
    function() t[17851] = a:New(17851, nil, nil, true); end, -- Tour of Duty: Zaralek Cavern
    function() O(t[17850], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17850] = a:New(17850); end, -- Keystone Hero: Neltharion's Lair
    function() O(t[17849], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17849] = a:New(17849); end, -- Keystone Hero: The Underrot
    function() O(t[17848], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17848] = a:New(17848); end, -- Keystone Hero: Freehold
    function() O(t[17847], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17847] = a:New(17847); end, -- Keystone Hero: The Vortex Pinnacle
    function() O(t[17846], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17846] = a:New(17846); end, -- Smoldering Hero: Dragonflight Season 2
    function() O(t[17845], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17845] = a:New(17845); end, -- Dragonflight Keystone Hero: Season Two
    function() O(t[17844], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17844] = a:New(17844); end, -- Dragonflight Keystone Master: Season Two
    function() O(t[17843], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17843] = a:New(17843); end, -- Dragonflight Keystone Conqueror: Season Two
    function() O(t[17842], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[17842] = a:New(17842); end, -- Dragonflight Keystone Explorer: Season Two
    function() t[17841] = a:New(17841); end, -- Pyramid Scheme
    function() t[17833] = a:New(17833); end, -- Sniffen Sage
    function() t[17832] = a:New(17832); end, -- Sniffen Around
    function() O(t[17831], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17831] = a:New(17831, nil, nil, true); end, -- Elite: Dragonflight Season 2
    function() t[17830] = a:New(17830); end, -- Stones Can't Fly!
    function() O(t[17801], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17801] = a:New(17801, nil, nil, true); end, -- Legend: Dragonflight Season 2
    function() O(t[17800], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17800] = a:New(17800, nil, nil, true); end, -- Combatant II: Dragonflight Season 2
    function() O(t[17799], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17799] = a:New(17799, nil, nil, true); end, -- Combatant I: Dragonflight Season 2
    function() O(t[17798], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17798] = a:New(17798, nil, nil, true); end, -- Challenger II: Dragonflight Season 2
    function() O(t[17797], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17797] = a:New(17797, nil, nil, true); end, -- Challenger I: Dragonflight Season 2
    function() O(t[17796], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17796] = a:New(17796, nil, nil, true); end, -- Rival II: Dragonflight Season 2
    function() O(t[17795], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17795] = a:New(17795, nil, nil, true); end, -- Rival I: Dragonflight Season 2
    function() O(t[17794], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17794] = a:New(17794, nil, nil, true); end, -- Duelist: Dragonflight Season 2
    function() t[17786] = a:New(17786); end, -- Treasures of Zaralek Cavern
    function() t[17785] = a:New(17785); end, -- "Que Zara(lek), Zara(lek)"
    function() t[17783] = a:New(17783); end, -- Adventurer of Zaralek Cavern
    function() t[17782] = a:New(17782); end, -- Daycare Derby
    function() t[17781] = a:New(17781); end, -- The Smell of Money
    function() t[17779] = a:New(17779); end, -- A Serpentine Discovery
    function() O(t[17778], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17778] = a:New(17778, nil, nil, true); end, -- Obsidian Gladiator's Slitherdrake
    function() O(t[17772], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17772] = a:New(17772, f.Horde, nil, true); end, -- Hero of the Horde: Obsidian
    function() O(t[17768], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17768] = a:New(17768, f.Alliance, nil, true); end, -- Hero of the Alliance: Obsidian
    function() O(t[17767], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17767] = a:New(17767, nil, nil, true); end, -- Obsidian Legend: Dragonflight Season 2
    function() t[17766] = a:New(17766); end, -- Explore Zaralek Cavern
    function() T(t[17765], u[2900]); end, -- Irons of the Onyx Crucible (Raid Finder)
    function() T(t[17765], u[2858]); end, -- Irons of the Onyx Crucible (Normal)
    function() T(t[17765], u[2898]); end, -- Irons of the Onyx Crucible (Heroic)
    function() T(t[17765], u[2899]); end, -- Irons of the Onyx Crucible (Mythic)
    function() T(t[17765], u[2873]); end, -- Heartfire Sentinel's Authority (Raid Finder)
    function() T(t[17765], u[2859]); end, -- Heartfire Sentinel's Authority (Normal)
    function() T(t[17765], u[2871]); end, -- Heartfire Sentinel's Authority (Heroic)
    function() T(t[17765], u[2872]); end, -- Heartfire Sentinel's Authority (Mythic)
    function() T(t[17765], u[2891]); end, -- Ashen Predator's Scaleform (Raid Finder)
    function() T(t[17765], u[2866]); end, -- Ashen Predator's Scaleform (Normal)
    function() T(t[17765], u[2889]); end, -- Ashen Predator's Scaleform (Heroic)
    function() T(t[17765], u[2890]); end, -- Ashen Predator's Scaleform (Mythic)
    function() T(t[17765], u[2882]); end, -- Lurking Specter's Shadeweave (Raid Finder)
    function() T(t[17765], u[2862]); end, -- Lurking Specter's Shadeweave (Normal)
    function() T(t[17765], u[2880]); end, -- Lurking Specter's Shadeweave (Heroic)
    function() T(t[17765], u[2881]); end, -- Lurking Specter's Shadeweave (Mythic)
    function() T(t[17765], u[2885]); end, -- The Furnace Seraph's Verdict (Raid Finder)
    function() T(t[17765], u[2863]); end, -- The Furnace Seraph's Verdict (Normal)
    function() T(t[17765], u[2883]); end, -- The Furnace Seraph's Verdict (Heroic)
    function() T(t[17765], u[2884]); end, -- The Furnace Seraph's Verdict (Mythic)
    function() T(t[17765], u[2897]); end, -- Lingering Phantom's Encasement (Raid Finder)
    function() T(t[17765], u[2870]); end, -- Lingering Phantom's Encasement (Normal)
    function() T(t[17765], u[2895]); end, -- Lingering Phantom's Encasement (Heroic)
    function() T(t[17765], u[2896]); end, -- Lingering Phantom's Encasement (Mythic)
    function() T(t[17765], u[2879]); end, -- Runes of the Cinderwolf (Raid Finder)
    function() T(t[17765], u[2861]); end, -- Runes of the Cinderwolf (Normal)
    function() T(t[17765], u[2877]); end, -- Runes of the Cinderwolf (Heroic)
    function() T(t[17765], u[2878]); end, -- Runes of the Cinderwolf (Mythic)
    function() T(t[17765], u[2909]); end, -- Underlight Conjurer's Brilliance (Raid Finder)
    function() T(t[17765], u[2865]); end, -- Underlight Conjurer's Brilliance (Normal)
    function() T(t[17765], u[2907]); end, -- Underlight Conjurer's Brilliance (Heroic)
    function() T(t[17765], u[2908]); end, -- Underlight Conjurer's Brilliance (Mythic)
    function() T(t[17765], u[2876]); end, -- Sinister Savant's Cursethreads (Raid Finder)
    function() T(t[17765], u[2860]); end, -- Sinister Savant's Cursethreads (Normal)
    function() T(t[17765], u[2874]); end, -- Sinister Savant's Cursethreads (Heroic)
    function() T(t[17765], u[2875]); end, -- Sinister Savant's Cursethreads (Mythic)
    function() T(t[17765], u[2888]); end, -- Fangs of the Vermillion Forge (Raid Finder)
    function() T(t[17765], u[2864]); end, -- Fangs of the Vermillion Forge (Normal)
    function() T(t[17765], u[2886]); end, -- Fangs of the Vermillion Forge (Heroic)
    function() T(t[17765], u[2887]); end, -- Fangs of the Vermillion Forge (Mythic)
    function() T(t[17765], u[2894]); end, -- Strands of the Autumn Blaze (Raid Finder)
    function() T(t[17765], u[2868]); end, -- Strands of the Autumn Blaze (Normal)
    function() T(t[17765], u[2892]); end, -- Strands of the Autumn Blaze (Heroic)
    function() T(t[17765], u[2893]); end, -- Strands of the Autumn Blaze (Mythic)
    function() T(t[17765], u[2903]); end, -- Kinslayer's Burdens (Raid Finder)
    function() T(t[17765], u[2869]); end, -- Kinslayer's Burdens (Normal)
    function() T(t[17765], u[2901]); end, -- Kinslayer's Burdens (Heroic)
    function() T(t[17765], u[2902]); end, -- Kinslayer's Burdens (Mythic)
    function() T(t[17765], u[2906]); end, -- Legacy of Obsidian Secrets (Raid Finder)
    function() T(t[17765], u[2867]); end, -- Legacy of Obsidian Secrets (Normal)
    function() T(t[17765], u[2904]); end, -- Legacy of Obsidian Secrets (Heroic)
    function() T(t[17765], u[2905]); end, -- Legacy of Obsidian Secrets (Mythic)
    function() t[17765] = a:New(17765); end, -- What We Wear In The Shadowflame
    function() O(t[17764], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17764] = a:New(17764, nil, nil, true); end, -- Obsidian Gladiator: Dragonflight Season 2
    function() t[17763] = a:New(17763); end, -- There's No Place Like Loamm
    function() t[17741] = a:New(17741); end, -- Slow and Steady Wins the Race
    function() O(t[17740], "From", "PvP Season", 35, "Until", "PvP Season", 35); end,
    function() t[17740] = a:New(17740, nil, nil, true); end, -- Gladiator: Dragonflight Season 2
    function() t[17739] = a:New(17739); end, -- Embers of Neltharion
    function() t[17738] = a:New(17738, f.Horde); end, -- Flame Keeper of the Dragon Isles
    function() t[17737] = a:New(17737, f.Alliance); end, -- Flame Warden of the Dragon Isles
    function() t[17736] = a:New(17736); end, -- The Gift of Cheese
    function() t[17735] = a:New(17735); end, -- We Didn't Start the Fire
    function() t[17734] = a:New(17734); end, -- Active Listening Skills
    function() t[17723] = a:New(17723); end, -- Kalimdor Racing Completionist: Gold
    function() t[17722] = a:New(17722); end, -- Kalimdor Racing Completionist: Silver
    function() t[17721] = a:New(17721); end, -- Kalimdor Racing Completionist
    function() t[17720] = a:New(17720); end, -- Kalimdor Reverse: Gold
    function() t[17719] = a:New(17719); end, -- Kalimdor Reverse: Silver
    function() t[17718] = a:New(17718); end, -- Kalimdor Reverse: Bronze
    function() t[17717] = a:New(17717); end, -- Kalimdor Advanced: Gold
    function() t[17716] = a:New(17716); end, -- Kalimdor Advanced: Silver
    function() t[17715] = a:New(17715); end, -- Kalimdor Advanced: Bronze
    function() t[17714] = a:New(17714); end, -- Kalimdor: Gold
    function() t[17713] = a:New(17713); end, -- Kalimdor: Silver
    function() t[17712] = a:New(17712); end, -- Kalimdor: Bronze
    function() t[17567] = a:New(17567); end, -- Ancient Stones of Zaralek
    function() t[17564] = a:New(17564); end, -- Ancient Stones of Thaldraszus
    function() t[17563] = a:New(17563); end, -- Ancient Stones of the Azure Span
    function() t[17562] = a:New(17562); end, -- Ancient Stones of the Ohn'ahran Plains
    function() t[17561] = a:New(17561); end, -- Ancient Stones of the Waking Shores
    function() t[17560] = a:New(17560); end, -- Ancient Stones of the Dragon Isles
    function() t[17546] = a:New(17546); end, -- A New Beginning
    function() t[17543] = a:New(17543); end, -- You Know How to Reach Me
    function() t[17541] = a:New(17541); end, -- Global Swarming
    function() t[17540] = a:New(17540); end, -- Under the Weather
    function() t[17534] = a:New(17534); end, -- Explore the Forbidden Reach
    function() t[17532] = a:New(17532); end, -- Scroll Hunter
    function() t[17531] = a:New(17531); end, -- X Marks the Spot
    function() t[17530] = a:New(17530); end, -- Librarian of the Reach
    function() t[17529] = a:New(17529); end, -- Forbidden Spoils
    function() t[17528] = a:New(17528); end, -- Hoarder of the Forbidden Reach
    function() t[17527] = a:New(17527); end, -- Scavenger of the Forbidden Reach
    function() t[17526] = a:New(17526); end, -- Treasures of the Forbidden Reach
    function() t[17525] = a:New(17525); end, -- Champion of the Forbidden Reach
    function() t[17524] = a:New(17524); end, -- Adventurer of the Forbidden Reach
    function() t[17517] = a:New(17517); end, -- Dragon Glyphs: Aberrus Approach
    function() t[17516] = a:New(17516); end, -- Dragon Glyphs: Acidbite Ravine
    function() t[17515] = a:New(17515); end, -- Dragon Glyphs: The Throughway
    function() t[17514] = a:New(17514); end, -- Dragon Glyphs: Slitherdrake Roost
    function() t[17513] = a:New(17513); end, -- Dragon Glyphs: Zaqali Caldera
    function() t[17512] = a:New(17512); end, -- Dragon Glyphs: Loamm
    function() t[17511] = a:New(17511); end, -- Dragon Glyphs: Nal ks'kol
    function() t[17510] = a:New(17510); end, -- Dragon Glyphs: Glimmerogg
    function() t[17509] = a:New(17509); end, -- "Every Door, Everywhere, All At Once"
    function() t[17506] = a:New(17506); end, -- Still Standing in the Fire
    function() O(t[17499]); end,
    function() t[17499] = a:New(17499); end, -- Renowned Tailoring Specialist
    function() O(t[17498]); end,
    function() t[17498] = a:New(17498); end, -- Renowned Leatherworking Specialist
    function() O(t[17497]); end,
    function() t[17497] = a:New(17497); end, -- Renowned Armorsmith
    function() O(t[17496]); end,
    function() t[17496] = a:New(17496); end, -- Renowned Weaponsmith
    function() t[17494] = a:New(17494); end, -- Zaralek Cavern Racing Completionist: Gold
    function() t[17493] = a:New(17493); end, -- Zaralek Cavern Racing Completionist: Silver
    function() t[17492] = a:New(17492); end, -- Zaralek Cavern Racing Completionist
    function() t[17491] = a:New(17491); end, -- Zaralek Cavern Reverse: Gold
    function() t[17490] = a:New(17490); end, -- Zaralek Cavern Reverse: Silver
    function() t[17489] = a:New(17489); end, -- Zaralek Cavern Reverse: Bronze
    function() t[17488] = a:New(17488); end, -- Zaralek Cavern Advanced: Gold
    function() t[17487] = a:New(17487); end, -- Zaralek Cavern Advanced: Silver
    function() t[17486] = a:New(17486); end, -- Zaralek Cavern Advanced: Bronze
    function() t[17485] = a:New(17485); end, -- Zaralek Cavern: Gold
    function() t[17484] = a:New(17484); end, -- Zaralek Cavern: Silver
    function() t[17483] = a:New(17483); end, -- Zaralek Cavern: Bronze
    function() t[17427] = a:New(17427); end, -- Winterpelt Conversationalist
    function() t[17426] = a:New(17426); end, -- Toolbox Trouble
    function() t[17413] = a:New(17413); end, -- Door Buster
    function() O(t[17412]); end,
    function() t[17412] = a:New(17412); end, -- Craftsman of the Argent Dawn
    function() t[17411] = a:New(17411); end, -- Forbidden Reach Glyph Hunter
    function() O(t[17410]); end,
    function() t[17410] = a:New(17410); end, -- Craftsman of the Zandalar Tribe
    function() t[17406] = a:New(17406); end, -- Battle on the Dragon Isles II
    function() t[17405] = a:New(17405); end, -- Dragon Glyphs: Caldera of the Menders
    function() t[17404] = a:New(17404); end, -- Dragon Glyphs: Talonlords' Perch
    function() t[17403] = a:New(17403); end, -- Dragon Glyphs: The Frosted Spine
    function() t[17402] = a:New(17402); end, -- Dragon Glyphs: Stormsunder Mountain
    function() t[17401] = a:New(17401); end, -- Dragon Glyphs: Dragonskull Island
    function() t[17400] = a:New(17400); end, -- Dragon Glyphs: Froststone Peak
    function() t[17399] = a:New(17399); end, -- Dragon Glyphs: Talon's Watch
    function() t[17398] = a:New(17398); end, -- Dragon Glyphs: Winglord's Perch
    function() t[17397] = a:New(17397); end, -- Door To Door
    function() t[17367] = a:New(17367); end, -- Deadliest Cache
    function() t[17366] = a:New(17366); end, -- Relics of a Fallen Empire
    function() t[17345] = a:New(17345, nil, nil, true); end, -- Airborne Tumbler
    function() t[17343] = a:New(17343); end, -- Drop It Like It's Hot
    function() t[17342] = a:New(17342); end, -- The Future We Make
    function() O(t[17339], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[17339] = a:New(17339, nil, nil, true); end, -- Legend: Dragonflight Season 1
    function() t[17336] = a:New(17336, nil, nil, true); end, -- Airborne Tumbler
    function() t[17335] = a:New(17335, nil, nil, true); end, -- Airborne Tumbler
    function() t[17334] = a:New(17334); end, -- Trading Post Enthusiast
    function() t[17332] = a:New(17332); end, -- Reverse Racer: Gold
    function() t[17331] = a:New(17331); end, -- Reverse Racer: Silver
    function() t[17330] = a:New(17330); end, -- Reverse Racer: Bronze
    function() t[17321] = a:New(17321); end, -- Elders of the Dragon Isles
    function() t[17315] = a:New(17315); end, -- While We Were Sleeping
    function() t[17314] = a:New(17314); end, -- Heroic Edition: Tangled Dreamweaver
    function() t[17305] = a:New(17305); end, -- Trading Post: Dragonflight
    function() t[17298] = a:New(17298); end, -- Forbidden Reach Racing Completionist: Gold
    function() t[17296] = a:New(17296); end, -- Forbidden Reach Racing Completionist: Silver
    function() t[17294] = a:New(17294); end, -- Forbidden Reach Racing Completionist
    function() t[17290] = a:New(17290); end, -- Forbidden Reach Reverse: Gold
    function() t[17289] = a:New(17289); end, -- Forbidden Reach Reverse: Silver
    function() t[17288] = a:New(17288); end, -- Forbidden Reach Reverse: Bronze
    function() t[17287] = a:New(17287); end, -- Forbidden Reach Advanced: Gold
    function() t[17286] = a:New(17286); end, -- Forbidden Reach Advanced: Silver
    function() t[17284] = a:New(17284); end, -- Forbidden Reach Advanced: Bronze
    function() t[17281] = a:New(17281); end, -- Forbidden Reach: Gold
    function() t[17280] = a:New(17280); end, -- Forbidden Reach: Silver
    function() t[17279] = a:New(17279); end, -- Forbidden Reach: Bronze
    function() t[17207] = a:New(17207); end, -- Discombobberlated
    function() t[17206] = a:New(17206); end, -- Thaldraszus Reverse: Gold
    function() t[17205] = a:New(17205); end, -- Thaldraszus Reverse: Silver
    function() t[17204] = a:New(17204); end, -- Thaldraszus Reverse: Bronze
    function() t[17203] = a:New(17203); end, -- Azure Span Reverse: Gold
    function() t[17202] = a:New(17202); end, -- Azure Span Reverse: Silver
    function() t[17201] = a:New(17201); end, -- Azure Span Reverse: Bronze
    function() t[17200] = a:New(17200); end, -- Ohn'ahran Plains Reverse: Gold
    function() t[17199] = a:New(17199); end, -- Ohn'ahran Plains Reverse: Silver
    function() t[17198] = a:New(17198); end, -- Ohn'ahran Plains Reverse: Bronze
    function() t[17197] = a:New(17197); end, -- Waking Shores Reverse: Gold
    function() t[17196] = a:New(17196); end, -- Waking Shores Reverse: Silver
    function() t[17195] = a:New(17195); end, -- Waking Shores Reverse: Bronze
    function() t[17119] = a:New(17119); end, -- Deep Cuts From the Vault
    function() t[17112] = a:New(17112); end, -- Fury of the Storm
    function() t[17111] = a:New(17111); end, -- Caverns of Infusion
    function() t[17110] = a:New(17110); end, -- The Primal Bulwark
    function() O(t[17108], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[17108] = a:New(17108); end, -- Cutting Edge: Raszageth the Storm-Eater
    function() O(t[17107], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[17107] = a:New(17107); end, -- Ahead of the Curve: Raszageth the Storm-Eater
    function() t[16808] = a:New(16808); end, -- Friend of the Dragon Isles
    function() O(t[16801], "Once"); end,
    function() t[16801] = a:New(16801, nil, nil, nil, true); end, -- Realm First! Dragonflight Keystone Hero
    function() t[16799] = a:New(16799); end, -- Personal Crafter
    function() t[16791] = a:New(16791); end, -- Merchant Artisan
    function() t[16790] = a:New(16790); end, -- Curious Coin
    function() t[16789] = a:New(16789); end, -- Lucky Penny
    function() t[16764] = a:New(16764, nil, nil, true); end, -- Crimson Carpet Fashion
    function() t[16762] = a:New(16762); end, -- The Vegetarian Diet
    function() t[16761] = a:New(16761); end, -- Dragon Isles Explorer
    function() t[16760] = a:New(16760); end, -- The Obsidian Bloodline
    function() t[16758] = a:New(16758); end, -- "Ready, Aim, Catalog!"
    function() t[16736] = a:New(16736); end, -- Grand Theft Mammoth
    function() O(t[16734], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[16734] = a:New(16734, nil, nil, true); end, -- Crimson Legend: Dragonflight Season 1
    function() O(t[16730], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[16730] = a:New(16730, nil, nil, true); end, -- Crimson Gladiator's Drake
    function() t[16729] = a:New(16729); end, -- To All the Squirrels Hidden Til Now
    function() t[16727] = a:New(16727); end, -- Cliffside Wylderdrake Head Features
    function() t[16726] = a:New(16726); end, -- Cliffside Wylderdrake Back and Tail
    function() t[16725] = a:New(16725); end, -- Cliffside Wylderdrake Horns and Manes
    function() t[16724] = a:New(16724); end, -- Cliffside Wylderdrake Armor
    function() t[16723] = a:New(16723); end, -- Cliffside Wylderdrake Scales and Patterns
    function() t[16712] = a:New(16712); end, -- Highland Drake Head Features
    function() t[16711] = a:New(16711); end, -- Highland Drake Back and Tail
    function() t[16710] = a:New(16710); end, -- Highland Drake Horns and Hair
    function() t[16708] = a:New(16708); end, -- Highland Drake Armor
    function() t[16707] = a:New(16707); end, -- Highland Drake Scales and Patterns
    function() t[16706] = a:New(16706); end, -- Windborne Velocidrake Back and Tail
    function() t[16705] = a:New(16705); end, -- Windborne Velocidrake Head Features
    function() t[16704] = a:New(16704); end, -- Windborne Velocidrake Horns and Fur
    function() t[16702] = a:New(16702); end, -- Windborne Velocidrake Armor
    function() t[16701] = a:New(16701); end, -- Windborne Velocidrake Scales and Patterns
    function() t[16700] = a:New(16700); end, -- Renewed Proto-Drake Horns and Hair
    function() t[16699] = a:New(16699); end, -- Renewed Proto-Drake Scales and Patterns
    function() t[16698] = a:New(16698); end, -- Renewed Proto-Drake Tail Features
    function() t[16697] = a:New(16697); end, -- Renewed Proto-Drake Head Features
    function() t[16696] = a:New(16696); end, -- Renewed Proto-Drake Armor
    function() t[16683] = a:New(16683); end, -- In Tyr's Footsteps
    function() t[16679] = a:New(16679); end, -- Adventurer of Thaldraszus
    function() t[16678] = a:New(16678); end, -- Adventurer of The Azure Span
    function() t[16677] = a:New(16677); end, -- Adventurer of the Ohn'ahran Plains
    function() t[16676] = a:New(16676); end, -- Adventurer of The Waking Shores
    function() t[16673] = a:New(16673); end, -- Dragon Glyphs: The Fallen Course
    function() t[16672] = a:New(16672); end, -- Dragon Glyphs: Forkriver Crossing
    function() t[16671] = a:New(16671); end, -- Dragon Glyphs: Mirewood Fen
    function() t[16670] = a:New(16670); end, -- Dragon Glyphs: Rubyscale Outpost
    function() t[16669] = a:New(16669); end, -- Dragon Glyphs: Flashfrost Enclave
    function() t[16668] = a:New(16668); end, -- Dragon Glyphs: Skytop Observatory Rostrum
    function() t[16667] = a:New(16667); end, -- Dragon Glyphs: Passage of Time
    function() t[16666] = a:New(16666); end, -- Dragon Glyphs: Gelikyr Overlook
    function() O(t[16661], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16661] = a:New(16661); end, -- Keystone Hero: Temple of the Jade Serpent
    function() O(t[16660], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16660] = a:New(16660); end, -- Keystone Hero: Shadowmoon Burial Grounds
    function() O(t[16659], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16659] = a:New(16659); end, -- Keystone Hero: Halls of Valor
    function() O(t[16658], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16658] = a:New(16658); end, -- Keystone Hero: Court of Stars
    function() O(t[16650], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16650] = a:New(16650); end, -- Dragonflight Keystone Hero: Season One
    function() O(t[16649], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16649] = a:New(16649); end, -- Dragonflight Keystone Master: Season One
    function() O(t[16648], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16648] = a:New(16648); end, -- Dragonflight Keystone Conqueror: Season One
    function() O(t[16647], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16647] = a:New(16647); end, -- Dragonflight Keystone Explorer: Season One
    function() O(t[16646], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[16646] = a:New(16646); end, -- Keystone Hero: Halls of Infusion
    function() O(t[16645], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16645] = a:New(16645); end, -- Keystone Hero: The Azure Vault
    function() O(t[16644], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[16644] = a:New(16644); end, -- Keystone Hero: Neltharus
    function() O(t[16643], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16643] = a:New(16643); end, -- Keystone Hero: Algeth'ar Academy
    function() O(t[16642], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[16642] = a:New(16642); end, -- Keystone Hero: Brackenhide Hollow
    function() O(t[16641], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16641] = a:New(16641); end, -- Keystone Hero: The Nokhud Offensive
    function() O(t[16640], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16640] = a:New(16640); end, -- Keystone Hero: Ruby Life Pools
    function() O(t[16639], "From", "Mythic+ Season", 10, "Until", "Mythic+ Season", 10); end,
    function() t[16639] = a:New(16639); end, -- Keystone Hero: Uldaman: Legacy of Tyr
    function() t[16638] = a:New(16638); end, -- Ley Line in the Span
    function() t[16634] = a:New(16634); end, -- Framing a New Perspective
    function() t[16632] = a:New(16632); end, -- Dragon Isles Fisherman
    function() t[16631] = a:New(16631); end, -- Dragon Isles Cook
    function() t[16630] = a:New(16630); end, -- Draconic Master of All
    function() t[16627] = a:New(16627); end, -- Professional Draconic Master
    function() t[16626] = a:New(16626); end, -- Working with Wyrms
    function() t[16625] = a:New(16625); end, -- Belay On!
    function() t[16624] = a:New(16624); end, -- Which Knot Was It Again?
    function() t[16623] = a:New(16623); end, -- Toe Tension
    function() t[16622] = a:New(16622); end, -- Three Minutes or It's Free
    function() t[16621] = a:New(16621); end, -- "One of Everything, Please"
    function() t[16620] = a:New(16620); end, -- Ohuna Incubation
    function() t[16616] = a:New(16616, nil, nil, true); end, -- Prosperously Bloody
    function() t[16615] = a:New(16615, nil, nil, true); end, -- Blood Bank
    function() t[16614] = a:New(16614, nil, nil, true); end, -- Bloodstained Bounty
    function() t[16613] = a:New(16613, nil, nil, true); end, -- Finder's Keepers
    function() t[16612] = a:New(16612, nil, nil, true); end, -- Bounty Vigalante
    function() t[16611] = a:New(16611, nil, nil, true); end, -- Resource Scavanger
    function() t[16603] = a:New(16603, nil, nil, true); end, -- Bounty Hunter
    function() t[16602] = a:New(16602); end, -- Nokhud Deed Goes Unnoticed
    function() t[16601] = a:New(16601, nil, nil, true); end, -- Dragonfight Club
    function() t[16600] = a:New(16600); end, -- Isles Ascender
    function() t[16599] = a:New(16599, nil, nil, true); end, -- A Champion's Pursuit
    function() t[16595] = a:New(16595, nil, nil, true); end, -- Tour of Duty: Ohn'ahran Plains
    function() t[16594] = a:New(16594, nil, nil, true); end, -- Tour of Duty: The Azure Span
    function() t[16593] = a:New(16593, nil, nil, true); end, -- Tour of Duty: Thaldraszus
    function() t[16592] = a:New(16592, nil, nil, true); end, -- Tour of Duty: The Waking Shores
    function() t[16591] = a:New(16591); end, -- The Gentleman Elemental
    function() t[16590] = a:New(16590, nil, nil, true); end, -- A Champion's Tour: Dragon Isles
    function() t[16589] = a:New(16589, nil, nil, true); end, -- Malicia's Challenge
    function() t[16588] = a:New(16588); end, -- How Did These Get Here?
    function() t[16587] = a:New(16587); end, -- Lead Climber
    function() t[16585] = a:New(16585); end, -- Loremaster of the Dragon Isles
    function() t[16584] = a:New(16584); end, -- Symbols of Hope
    function() t[16583] = a:New(16583); end, -- Knew You Nokhud Do It!
    function() t[16581] = a:New(16581); end, -- Seeing Blue
    function() t[16580] = a:New(16580); end, -- Lend a Helping Span
    function() t[16578] = a:New(16578); end, -- Thaldraszus Glyph Hunter
    function() t[16577] = a:New(16577); end, -- Azure Span Glyph Hunter
    function() t[16576] = a:New(16576); end, -- Ohn'ahran Plains Glyph Hunter
    function() t[16575] = a:New(16575); end, -- Waking Shores Glyph Hunter
    function() t[16574] = a:New(16574); end, -- Sleeping on the Job
    function() t[16573] = a:New(16573); end, -- Legendary Photographs
    function() t[16572] = a:New(16572); end, -- Legendary Photograph
    function() t[16571] = a:New(16571); end, -- Well Supplied
    function() t[16570] = a:New(16570); end, -- A Legendary Album
    function() t[16569] = a:New(16569); end, -- Cobalt Enthusiast
    function() t[16568] = a:New(16568); end, -- Great Shots Galore!
    function() t[16567] = a:New(16567); end, -- A Lot of Great Shots!
    function() t[16566] = a:New(16566); end, -- Great Shot!
    function() t[16565] = a:New(16565); end, -- It Takes a Tuskarr Village
    function() t[16564] = a:New(16564); end, -- It Takes a Tuskarr Family
    function() t[16563] = a:New(16563); end, -- We're Going to Need a Bigger Harpoon
    function() t[16562] = a:New(16562); end, -- That's not a Fish...
    function() t[16561] = a:New(16561); end, -- "Lunkers, Lunkers Everywhere"
    function() t[16560] = a:New(16560); end, -- Wildlife Photographer
    function() t[16556] = a:New(16556); end, -- Great Gourmand of The Ruby Feast
    function() t[16553] = a:New(16553); end, -- Taking From Nature
    function() t[16552] = a:New(16552); end, -- Giving Even More Back to Nature
    function() t[16551] = a:New(16551); end, -- Giving More Back to Nature
    function() t[16550] = a:New(16550); end, -- Giving Back to Nature
    function() t[16549] = a:New(16549); end, -- Popular Around the Isles
    function() t[16548] = a:New(16548); end, -- It Takes a Tuskarr Buddy
    function() t[16547] = a:New(16547); end, -- Pulled!
    function() t[16546] = a:New(16546); end, -- What's Down There?
    function() t[16545] = a:New(16545); end, -- The Best at What I Do
    function() t[16544] = a:New(16544); end, -- Grand Hunter
    function() t[16543] = a:New(16543); end, -- Tetrachromancer
    function() t[16542] = a:New(16542); end, -- The Disgruntled Hunter
    function() t[16541] = a:New(16541); end, -- Longhunter
    function() t[16540] = a:New(16540); end, -- Hunt Master
    function() t[16539] = a:New(16539); end, -- In High Esteem
    function() t[16537] = a:New(16537); end, -- Maximum Power!
    function() t[16536] = a:New(16536); end, -- True Friends with Wrathion
    function() t[16533] = a:New(16533); end, -- Lots of Lunkers
    function() t[16532] = a:New(16532); end, -- True Friends with Sabellian
    function() t[16531] = a:New(16531); end, -- A Whole Heap of Lunkers
    function() t[16530] = a:New(16530); end, -- Ally of the Flights
    function() t[16529] = a:New(16529); end, -- Joining the Community
    function() t[16528] = a:New(16528); end, -- Joining the Khansguard
    function() t[16522] = a:New(16522); end, -- A True Explorer
    function() t[16519] = a:New(16519); end, -- Dragon Isles Safari
    function() t[16518] = a:New(16518); end, -- Explore Thaldraszus
    function() t[16517] = a:New(16517); end, -- Toxicity Strike Team
    function() t[16512] = a:New(16512); end, -- Family Battler of the Dragon Isles
    function() t[16511] = a:New(16511); end, -- Undead Battler of the Dragon Isles
    function() t[16510] = a:New(16510); end, -- Mechanical Battler of the Dragon Isles
    function() t[16509] = a:New(16509); end, -- Magic Battler of the Dragon Isles
    function() t[16508] = a:New(16508); end, -- Humanoid Battler of the Dragon Isles
    function() t[16507] = a:New(16507); end, -- Flying Battler of the Dragon Isles
    function() t[16506] = a:New(16506); end, -- Elemental Battler of the Dragon Isles
    function() t[16505] = a:New(16505); end, -- Dragonkin Battler of the Dragon Isles
    function() t[16504] = a:New(16504); end, -- Critter Battler of the Dragon Isles
    function() t[16503] = a:New(16503); end, -- Beast Battler of the Dragon Isles
    function() t[16502] = a:New(16502); end, -- Storming the Runway
    function() t[16501] = a:New(16501); end, -- Aquatic Battler of the Dragon Isles
    function() t[16500] = a:New(16500); end, -- Elemental Overload
    function() t[16499] = a:New(16499); end, -- Elemental Overflowing
    function() t[16498] = a:New(16498); end, -- Elemental Overflow
    function() t[16497] = a:New(16497); end, -- I'm Playing All Sides
    function() t[16496] = a:New(16496); end, -- Obsidian Champion
    function() t[16495] = a:New(16495); end, -- Obsidian Keymaster
    function() t[16494] = a:New(16494); end, -- Loyalty to the Prince
    function() t[16493] = a:New(16493); end, -- Petty Theft Mammoth
    function() t[16492] = a:New(16492); end, -- Into the Storm
    function() t[16490] = a:New(16490); end, -- Storm Chaser
    function() t[16489] = a:New(16489); end, -- Chasing Storms in Thaldraszus
    function() t[16488] = a:New(16488); end, -- Snowstorms in Thaldraszus
    function() t[16487] = a:New(16487); end, -- Firestorms in Thaldraszus
    function() t[16486] = a:New(16486); end, -- Sandstorms in Thaldraszus
    function() t[16485] = a:New(16485); end, -- Thunderstorms in Thaldraszus
    function() t[16484] = a:New(16484); end, -- Chasing Storms in The Azure Span
    function() t[16483] = a:New(16483); end, -- Snowstorms in The Azure Span
    function() t[16482] = a:New(16482); end, -- Firestorms in The Azure Span
    function() t[16481] = a:New(16481); end, -- Sandstorms in The Azure Span
    function() t[16480] = a:New(16480); end, -- Thunderstorms in The Azure Span
    function() t[16479] = a:New(16479); end, -- Snowstorms in the Ohn'ahran Plains
    function() t[16478] = a:New(16478); end, -- Firestorms in the Ohn'ahran Plains
    function() t[16477] = a:New(16477); end, -- Sandstorms in the Ohn'ahran Plains
    function() t[16476] = a:New(16476); end, -- Chasing Storms in the Ohn'ahran Plains
    function() t[16475] = a:New(16475); end, -- Thunderstorms in the Ohn'ahran Plains
    function() t[16474] = a:New(16474); end, -- Do You Wanna Build a Snowman?
    function() t[16468] = a:New(16468); end, -- Chasing Storms in The Waking Shores
    function() t[16467] = a:New(16467); end, -- Snowstorms in The Waking Shores
    function() t[16466] = a:New(16466); end, -- Firestorms in The Waking Shores
    function() t[16465] = a:New(16465); end, -- Sandstorms in The Waking Shores
    function() t[16464] = a:New(16464); end, -- Battle on the Dragon Isles
    function() t[16463] = a:New(16463); end, -- Thunderstorms in The Waking Shores
    function() t[16462] = a:New(16462); end, -- The Ohn'ahran Trail
    function() t[16461] = a:New(16461); end, -- Stormed Off
    function() t[16460] = a:New(16460); end, -- Explore the Azure Span
    function() t[16458] = a:New(16458); end, -- Nothing But Air
    function() t[16457] = a:New(16457); end, -- Explore the Ohn'ahran Plains
    function() t[16456] = a:New(16456); end, -- Weapons of the Maruukai
    function() t[16453] = a:New(16453); end, -- Liquid Hot Magma
    function() t[16452] = a:New(16452); end, -- Famliar Skies
    function() t[16451] = a:New(16451); end, -- The Ol Raszle Daszle
    function() t[16450] = a:New(16450); end, -- The Power is MINE!
    function() t[16447] = a:New(16447); end, -- What Are The Chances...
    function() t[16446] = a:New(16446); end, -- That's Pretty Neat!
    function() t[16445] = a:New(16445); end, -- Icy What You Did There
    function() t[16444] = a:New(16444); end, -- Leftovers' Revenge
    function() t[16443] = a:New(16443); end, -- Soupervisor
    function() t[16442] = a:New(16442); end, -- Incubation Extermination
    function() t[16441] = a:New(16441); end, -- Squad Goals
    function() t[16440] = a:New(16440); end, -- Are You My Broodmother?
    function() t[16438] = a:New(16438); end, -- Knowledge is... Preserved?
    function() t[16434] = a:New(16434); end, -- See Me After Class
    function() t[16432] = a:New(16432); end, -- Ready for Raiding VIII
    function() O(t[16431], "From", "Version", "100002", "Until", "Version", "100002"); end,
    function() t[16431] = a:New(16431); end, -- Against the Elements
    function() t[16430] = a:New(16430); end, -- "All Bark, All Bite"
    function() O(t[16429], "From", "Mythic+ Season", 9, "Until", "Mythic+ Season", 9); end,
    function() t[16429] = a:New(16429); end, -- Thundering Hero: Dragonflight Season 1
    function() t[16428] = a:New(16428); end, -- Sojourner of Azure Span
    function() t[16427] = a:New(16427); end, -- Go With the Flow
    function() t[16426] = a:New(16426); end, -- Hungry Hungry Hornswog
    function() t[16424] = a:New(16424); end, -- Who's a Good Bakar?
    function() t[16423] = a:New(16423); end, -- Honor Our Ancestors
    function() t[16419] = a:New(16419); end, -- I Was Saving That For Later
    function() t[16412] = a:New(16412); end, -- Siege on Dragonbane Keep: Chiseled Record
    function() t[16411] = a:New(16411); end, -- Siege on Dragonbane Keep: Home Sweet Home
    function() t[16410] = a:New(16410); end, -- Siege on Dragonbane Keep: Snack Attack
    function() t[16409] = a:New(16409); end, -- Let's Get Quacking
    function() t[16406] = a:New(16406); end, -- All Sides of the Story
    function() t[16405] = a:New(16405); end, -- Sojourner of Ohn'ahran Plains
    function() t[16404] = a:New(16404); end, -- So You Can Kill This in a Way That Matters...
    function() t[16402] = a:New(16402); end, -- Dragon Kill Points
    function() t[16401] = a:New(16401); end, -- Sojourner of the Waking Shores
    function() t[16400] = a:New(16400); end, -- Explore the Waking Shores
    function() t[16399] = a:New(16399); end, -- Lovin' Lubbins
    function() t[16398] = a:New(16398); end, -- Sojourner of Thaldraszus
    function() T(t[16395], u[2652]); end, -- Stones of the Walking Mountain (Raid Finder)
    function() T(t[16395], u[2613]); end, -- Stones of the Walking Mountain (Normal)
    function() T(t[16395], u[2650]); end, -- Stones of the Walking Mountain (Heroic)
    function() T(t[16395], u[2651]); end, -- Stones of the Walking Mountain (Mythic)
    function() T(t[16395], u[2637]); end, -- Virtuous Silver Cataphract (Raid Finder)
    function() T(t[16395], u[2608]); end, -- Virtuous Silver Cataphract (Normal)
    function() T(t[16395], u[2635]); end, -- Virtuous Silver Cataphract (Heroic)
    function() T(t[16395], u[2636]); end, -- Virtuous Silver Cataphract (Mythic)
    function() T(t[16395], u[2628]); end, -- Stormwing Harrier's Camouflage (Raid Finder)
    function() T(t[16395], u[2605]); end, -- Stormwing Harrier's Camouflage (Normal)
    function() T(t[16395], u[2626]); end, -- Stormwing Harrier's Camouflage (Heroic)
    function() T(t[16395], u[2627]); end, -- Stormwing Harrier's Camouflage (Mythic)
    function() T(t[16395], u[2643]); end, -- Vault Delver's Toolkit (Raid Finder)
    function() T(t[16395], u[2610]); end, -- Vault Delver's Toolkit (Normal)
    function() T(t[16395], u[2641]); end, -- Vault Delver's Toolkit (Heroic)
    function() T(t[16395], u[2642]); end, -- Vault Delver's Toolkit (Mythic)
    function() T(t[16395], u[2640]); end, -- Draconic Hierophant's Finery (Raid Finder)
    function() T(t[16395], u[2609]); end, -- Draconic Hierophant's Finery (Normal)
    function() T(t[16395], u[2638]); end, -- Draconic Hierophant's Finery (Heroic)
    function() T(t[16395], u[2639]); end, -- Draconic Hierophant's Finery (Mythic)
    function() T(t[16395], u[2616]); end, -- Haunted Frostbrood Remains (Raid Finder)
    function() T(t[16395], u[2601]); end, -- Haunted Frostbrood Remains (Normal)
    function() T(t[16395], u[2614]); end, -- Haunted Frostbrood Remains (Heroic)
    function() T(t[16395], u[2615]); end, -- Haunted Frostbrood Remains (Mythic)
    function() T(t[16395], u[2646]); end, -- Elements of Infused Earth (Raid Finder)
    function() T(t[16395], u[2611]); end, -- Elements of Infused Earth (Normal)
    function() T(t[16395], u[2644]); end, -- Elements of Infused Earth (Heroic)
    function() T(t[16395], u[2645]); end, -- Elements of Infused Earth (Mythic)
    function() T(t[16395], u[2631]); end, -- Bindings of the Crystal Scholar (Raid Finder)
    function() T(t[16395], u[2606]); end, -- Bindings of the Crystal Scholar (Normal)
    function() T(t[16395], u[2629]); end, -- Bindings of the Crystal Scholar (Heroic)
    function() T(t[16395], u[2630]); end, -- Bindings of the Crystal Scholar (Mythic)
    function() T(t[16395], u[2649]); end, -- Scalesworn Cultist's Habit (Raid Finder)
    function() T(t[16395], u[2612]); end, -- Scalesworn Cultist's Habit (Normal)
    function() T(t[16395], u[2647]); end, -- Scalesworn Cultist's Habit (Heroic)
    function() T(t[16395], u[2648]); end, -- Scalesworn Cultist's Habit (Mythic)
    function() T(t[16395], u[2634]); end, -- Wrappings of the Waking Fist (Raid Finder)
    function() T(t[16395], u[2607]); end, -- Wrappings of the Waking Fist (Normal)
    function() T(t[16395], u[2632]); end, -- Wrappings of the Waking Fist (Heroic)
    function() T(t[16395], u[2633]); end, -- Wrappings of the Waking Fist (Mythic)
    function() T(t[16395], u[2622]); end, -- Lost Landcaller's Vesture (Raid Finder)
    function() T(t[16395], u[2603]); end, -- Lost Landcaller's Vesture (Normal)
    function() T(t[16395], u[2620]); end, -- Lost Landcaller's Vesture (Heroic)
    function() T(t[16395], u[2621]); end, -- Lost Landcaller's Vesture (Mythic)
    function() T(t[16395], u[2619]); end, -- Skybound Avenger's Flightwear (Raid Finder)
    function() T(t[16395], u[2602]); end, -- Skybound Avenger's Flightwear (Normal)
    function() T(t[16395], u[2617]); end, -- Skybound Avenger's Flightwear (Heroic)
    function() T(t[16395], u[2618]); end, -- Skybound Avenger's Flightwear (Mythic)
    function() T(t[16395], u[2625]); end, -- Scales of the Awakened (Raid Finder)
    function() T(t[16395], u[2604]); end, -- Scales of the Awakened (Normal)
    function() T(t[16395], u[2623]); end, -- Scales of the Awakened (Heroic)
    function() T(t[16395], u[2624]); end, -- Scales of the Awakened (Mythic)
    function() t[16395] = a:New(16395); end, -- Vaulternative Fashion
    function() t[16365] = a:New(16365); end, -- Little Friends
    function() t[16364] = a:New(16364); end, -- The Lunker Below
    function() t[16363] = a:New(16363); end, -- Just Don't Ask Me to Spell It
    function() t[16355] = a:New(16355); end, -- Glory of the Vault Raider
    function() t[16354] = a:New(16354); end, -- Mythic: Vault of the Incarnates
    function() t[16353] = a:New(16353); end, -- Mythic: Raszageth the Storm-Eater
    function() t[16352] = a:New(16352); end, -- Mythic: Broodkeeper Diurna
    function() t[16351] = a:New(16351); end, -- Mythic: Kurog Grimtotem
    function() t[16350] = a:New(16350); end, -- "Mythic: Dathea, Ascended"
    function() t[16349] = a:New(16349); end, -- "Mythic: Sennarth, The Cold Breath"
    function() t[16348] = a:New(16348); end, -- Mythic: The Primal Council
    function() t[16347] = a:New(16347); end, -- Mythic: Terros
    function() t[16346] = a:New(16346); end, -- Mythic: Eranog
    function() t[16345] = a:New(16345); end, -- Heroic: Vault of the Incarnates
    function() t[16343] = a:New(16343); end, -- Vault of the Incarnates
    function() t[16339] = a:New(16339); end, -- Myths of the Dragonflight Dungeons
    function() t[16338] = a:New(16338); end, -- Fang Flap Fire Fighter
    function() t[16337] = a:New(16337); end, -- It's a Trogg Eat Trogg World
    function() t[16336] = a:New(16336); end, -- Azure Spanner
    function() t[16335] = a:New(16335); end, -- What Frozen Things Do
    function() t[16334] = a:New(16334); end, -- Waking Hope
    function() t[16331] = a:New(16331); end, -- The Cracked Crystal
    function() t[16330] = a:New(16330); end, -- You Must Be Made of Hide
    function() t[16329] = a:New(16329); end, -- "Duck, Duck, Spruce!"
    function() t[16323] = a:New(16323); end, -- Fragments of History
    function() t[16322] = a:New(16322); end, -- Best in Slot
    function() t[16321] = a:New(16321); end, -- Cutting Tusk Equipment
    function() t[16320] = a:New(16320); end, -- Does Steam Do Fire Damage?
    function() t[16317] = a:New(16317); end, -- Secret Fishing Spots
    function() t[16301] = a:New(16301); end, -- Treasures of Thaldraszus
    function() t[16300] = a:New(16300); end, -- Treasures of The Azure Span
    function() t[16299] = a:New(16299); end, -- Treasures of the Ohn'ahran Plains
    function() t[16298] = a:New(16298); end, -- Treasure Hunter of the Dragon Isles
    function() t[16297] = a:New(16297); end, -- Treasures of The Waking Shores
    function() t[16296] = a:New(16296); end, -- Growlbossify
    function() t[16295] = a:New(16295); end, -- Glory of the Dragonflight Hero
    function() t[16294] = a:New(16294); end, -- Dragonflight Dungeon Hero
    function() t[16292] = a:New(16292); end, -- Mastering the Waygates
    function() t[16291] = a:New(16291); end, -- An Ancient Awakening
    function() t[16282] = a:New(16282); end, -- "No, You're Stunning!"
    function() t[16281] = a:New(16281); end, -- Like Sands Through the Hourglass
    function() t[16280] = a:New(16280); end, -- Mythic: Uldaman: Legacy of Tyr
    function() t[16279] = a:New(16279); end, -- Heroic: Uldaman: Legacy of Tyr
    function() t[16278] = a:New(16278); end, -- Uldaman: Legacy of Tyr
    function() t[16277] = a:New(16277); end, -- Mythic: The Nokhud Offensive
    function() t[16276] = a:New(16276); end, -- Heroic: The Nokhud Offensive
    function() t[16275] = a:New(16275); end, -- The Nokhud Offensive
    function() t[16274] = a:New(16274); end, -- Mythic: The Azure Vault
    function() t[16273] = a:New(16273); end, -- Heroic: The Azure Vault
    function() t[16272] = a:New(16272); end, -- The Azure Vault
    function() t[16271] = a:New(16271); end, -- Mythic: Algeth'ar Academy
    function() t[16270] = a:New(16270); end, -- Heroic: Algeth'ar Academy
    function() t[16269] = a:New(16269); end, -- Algeth'ar Academy
    function() t[16268] = a:New(16268); end, -- Mythic: Ruby Life Pools
    function() t[16267] = a:New(16267); end, -- Heroic: Ruby Life Pools
    function() t[16266] = a:New(16266); end, -- Ruby Life Pools
    function() t[16265] = a:New(16265); end, -- Mythic: Neltharus
    function() t[16264] = a:New(16264); end, -- Heroic: Neltharus
    function() t[16263] = a:New(16263); end, -- Neltharus
    function() t[16262] = a:New(16262); end, -- Mythic: Halls of Infusion
    function() t[16261] = a:New(16261); end, -- Heroic: Halls of Infusion
    function() t[16260] = a:New(16260); end, -- Halls of Infusion
    function() t[16257] = a:New(16257); end, -- Mythic: Brackenhide Hollow
    function() t[16256] = a:New(16256); end, -- Heroic: Brackenhide Hollow
    function() t[16255] = a:New(16255); end, -- Brackenhide Hollow
    function() t[16110] = a:New(16110); end, -- Subscribed to Hyena Facts
    function() t[16107] = a:New(16107); end, -- Dragon Glyphs: Thaldraszus Apex
    function() t[16106] = a:New(16106); end, -- Dragon Glyphs: Vault of the Incarnates
    function() t[16105] = a:New(16105); end, -- Dragon Glyphs: Veiled Ossuary
    function() t[16104] = a:New(16104); end, -- Dragon Glyphs: Algeth'ar Academy
    function() t[16103] = a:New(16103); end, -- Dragon Glyphs: Tyrhold
    function() t[16102] = a:New(16102); end, -- Dragon Glyphs: Algeth'era
    function() t[16101] = a:New(16101); end, -- Dragon Glyphs: Valdrakken
    function() t[16100] = a:New(16100); end, -- Dragon Glyphs: South Hold Gate
    function() t[16099] = a:New(16099); end, -- Dragon Glyphs: Stormshroud Peak
    function() t[16098] = a:New(16098); end, -- Dragon Glyphs: Temporal Conflux
    function() t[16073] = a:New(16073); end, -- Dragon Glyphs: Vakthros Range
    function() t[16072] = a:New(16072); end, -- Dragon Glyphs: Rhonin's Shield
    function() t[16071] = a:New(16071); end, -- Dragon Glyphs: Zelthrak Outpost
    function() t[16070] = a:New(16070); end, -- Dragon Glyphs: Imbu
    function() t[16069] = a:New(16069); end, -- Dragon Glyphs: Drake Eye's Pond
    function() t[16068] = a:New(16068); end, -- Dragon Glyphs: Brackenhide Hollow
    function() t[16067] = a:New(16067); end, -- Dragon Glyphs: Lost Ruins
    function() t[16066] = a:New(16066); end, -- Dragon Glyphs: Ruins of Karnthar
    function() t[16065] = a:New(16065); end, -- Dragon Glyphs: Azure Archives
    function() t[16064] = a:New(16064); end, -- Dragon Glyphs: Cobalt Assembly
    function() t[16063] = a:New(16063); end, -- Dragon Glyphs: Windsong Rise
    function() t[16062] = a:New(16062); end, -- Dragon Glyphs: Rusza'thar Reach
    function() t[16061] = a:New(16061); end, -- Dragon Glyphs: Dragonsprings Summit
    function() t[16060] = a:New(16060); end, -- Dragon Glyphs: Ohn'iri Springs
    function() t[16059] = a:New(16059); end, -- Dragon Glyphs: Mirror of the Sky
    function() t[16058] = a:New(16058); end, -- Dragon Glyphs: Szar Skeleth
    function() t[16057] = a:New(16057); end, -- Dragon Glyphs: The Eternal Kurgans
    function() t[16056] = a:New(16056); end, -- Dragon Glyphs: Emerald Gardens
    function() t[16055] = a:New(16055); end, -- Dragon Glyphs: Nokhudon Hold
    function() t[16054] = a:New(16054); end, -- Dragon Glyphs: Ohn'ahra's Roost
    function() t[16053] = a:New(16053); end, -- Dragon Glyphs: Obsidian Throne
    function() t[16052] = a:New(16052); end, -- Dragon Glyphs: Scalecracker Peak
    function() t[16051] = a:New(16051); end, -- Dragon Glyphs: Dragonheart Outpost
    function() t[15991] = a:New(15991); end, -- Dragon Glyphs: Crumbling Life Archway
    function() t[15990] = a:New(15990); end, -- Dragon Glyphs: Life-Binder Observatory
    function() t[15989] = a:New(15989); end, -- Dragon Glyphs: The Overflowing Spring
    function() t[15988] = a:New(15988); end, -- Dragon Glyphs: Ruby Life Pools Peaks
    function() t[15987] = a:New(15987); end, -- Dragon Glyphs: Obsidian Bulwark
    function() t[15986] = a:New(15986); end, -- Dragon Glyphs: Wingrest Embassy
    function() t[15985] = a:New(15985); end, -- Dragon Glyphs: Skytop Observatory Tower
    function() O(t[15984], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15984] = a:New(15984, nil, nil, true); end, -- Elite: Dragonflight Season 1
    function() O(t[15961], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15961] = a:New(15961, nil, nil, true); end, -- Combatant II: Dragonflight Season 1
    function() O(t[15960], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15960] = a:New(15960, nil, nil, true); end, -- Combatant I: Dragonflight Season 1
    function() O(t[15959], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15959] = a:New(15959, f.Alliance, nil, true); end, -- Hero of the Alliance: Crimson
    function() O(t[15958], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15958] = a:New(15958, f.Horde, nil, true); end, -- Hero of the Horde: Crimson
    function() O(t[15957], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15957] = a:New(15957, nil, nil, true); end, -- Gladiator: Dragonflight Season 1
    function() O(t[15956], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15956] = a:New(15956, nil, nil, true); end, -- Challenger II: Dragonflight Season 1
    function() O(t[15955], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15955] = a:New(15955, nil, nil, true); end, -- Challenger I: Dragonflight Season 1
    function() O(t[15954], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15954] = a:New(15954, nil, nil, true); end, -- Duelist: Dragonflight Season 1
    function() O(t[15953], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15953] = a:New(15953, nil, nil, true); end, -- Rival II: Dragonflight Season 1
    function() O(t[15952], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15952] = a:New(15952, nil, nil, true); end, -- Rival I: Dragonflight Season 1
    function() O(t[15951], "From", "PvP Season", 34, "Until", "PvP Season", 34); end,
    function() t[15951] = a:New(15951, nil, nil, true); end, -- Crimson Gladiator: Dragonflight Season 1
    function() t[15941] = a:New(15941); end, -- Dragon Racing Completionist: Gold
    function() t[15940] = a:New(15940); end, -- Dragon Racing Completionist: Silver
    function() t[15939] = a:New(15939); end, -- Dragon Racing Completionist
    function() t[15938] = a:New(15938); end, -- Thaldraszus Advanced: Gold
    function() t[15937] = a:New(15937); end, -- Thaldraszus Advanced: Silver
    function() t[15936] = a:New(15936); end, -- Thaldraszus Advanced: Bronze
    function() t[15935] = a:New(15935); end, -- Azure Span Advanced: Gold
    function() t[15934] = a:New(15934); end, -- Azure Span Advanced: Silver
    function() t[15933] = a:New(15933); end, -- Azure Span Advanced: Bronze
    function() t[15932] = a:New(15932); end, -- Ohn'ahran Plains Advanced: Gold
    function() t[15931] = a:New(15931); end, -- Ohn'ahran Plains Advanced: Silver
    function() t[15930] = a:New(15930); end, -- Ohn'ahran Plains Advanced: Bronze
    function() t[15929] = a:New(15929); end, -- Waking Shores Advanced: Gold
    function() t[15928] = a:New(15928); end, -- Waking Shores Advanced: Silver
    function() t[15927] = a:New(15927); end, -- Waking Shores Advanced: Bronze
    function() t[15926] = a:New(15926); end, -- Thaldraszus: Gold
    function() t[15925] = a:New(15925); end, -- Thaldraszus: Silver
    function() t[15924] = a:New(15924); end, -- Thaldraszus: Bronze
    function() t[15923] = a:New(15923); end, -- Azure Span: Gold
    function() t[15922] = a:New(15922); end, -- Azure Span: Silver
    function() t[15921] = a:New(15921); end, -- Azure Span: Bronze
    function() t[15920] = a:New(15920); end, -- Ohn'ahran Plains: Gold
    function() t[15919] = a:New(15919); end, -- Ohn'ahran Plains: Silver
    function() t[15918] = a:New(15918); end, -- Ohn'ahran Plains: Bronze
    function() t[15917] = a:New(15917); end, -- Waking Shores: Gold
    function() t[15916] = a:New(15916); end, -- Waking Shores: Silver
    function() t[15915] = a:New(15915); end, -- Waking Shores: Bronze
    function() t[15890] = a:New(15890); end, -- Dragonscale Expedition: The Highest Peaks
    function() t[15889] = a:New(15889); end, -- River Rapids Wrangler
    function() t[15834] = a:New(15834, f.Alliance); end, -- Thanks for the Carry!
    function() t[15833] = a:New(15833, f.Horde); end, -- Thanks for the Carry!
    function() t[15805] = a:New(15805); end, -- Level 70
    function() t[15797] = a:New(15797); end, -- An Azure Ally
    function() t[15796] = a:New(15796); end, -- Cliffside Companion
    function() t[15795] = a:New(15795); end, -- Together in the Skies
    function() t[15794] = a:New(15794); end, -- A New Friend
    function() t[15781] = a:New(15781); end, -- The Joy of Toy
    function() O(t[15756], "From", "Mythic+ Season", 8, "Until", "Mythic+ Season", 8); end,
    function() t[15756] = a:New(15756); end, -- Shrouded Hero: Shadowlands Season 4
    function() O(t[15695], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15695] = a:New(15695); end, -- Keystone Hero: Grimrail Depot
    function() O(t[15694], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15694] = a:New(15694); end, -- Keystone Hero: Iron Docks
    function() O(t[15693], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15693] = a:New(15693); end, -- Keystone Hero: Operation: Mechagon
    function() O(t[15692], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15692] = a:New(15692); end, -- Keystone Hero: Return to Karazhan
    function() O(t[15691], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15691] = a:New(15691); end, -- Cryptic Hero: Shadowlands Season 3
    function() O(t[15690], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15690] = a:New(15690); end, -- Shadowlands Keystone Master: Season Four
    function() O(t[15689], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15689] = a:New(15689); end, -- Shadowlands Keystone Conqueror: Season Four
    function() O(t[15688], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15688] = a:New(15688); end, -- Shadowlands Keystone Explorer: Season Four
    function() O(t[15687], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15687] = a:New(15687); end, -- Mythic: Fates of the Shadowlands Raids
    function() O(t[15685], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15685] = a:New(15685); end, -- Heroic: Fates of the Shadowlands Raids
    function() O(t[15684], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15684] = a:New(15684); end, -- Fates of the Shadowlands Raids
    function() O(t[15683], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15683] = a:New(15683); end, -- Mythic: Fate of the Sepulcher
    function() O(t[15682], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15682] = a:New(15682); end, -- Heroic: Fate of the Sepulcher
    function() O(t[15681], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15681] = a:New(15681); end, -- Fate of the Sepulcher
    function() O(t[15669], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15669] = a:New(15669); end, -- Mythic: Fate of Domination
    function() O(t[15668], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15668] = a:New(15668); end, -- Heroic: Fate of Domination
    function() O(t[15667], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15667] = a:New(15667); end, -- Fate of Domination
    function() O(t[15665], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15665] = a:New(15665); end, -- Mythic: Fate of Nathria
    function() O(t[15664], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15664] = a:New(15664); end, -- Heroic: Fate of Nathria
    function() O(t[15663], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15663] = a:New(15663); end, -- Fate of Nathria
    function() O(t[15654], "From", "Version", "090205", "Before", "Version", "100002"); end,
    function() t[15654] = a:New(15654); end, -- Back from the Beyond
    function() t[15653] = a:New(15653); end, -- The More You Know*
    function() t[15652] = a:New(15652); end, -- Mythic: So'leah's Gambit
    function() t[15651] = a:New(15651); end, -- Myths of the Shadowlands Dungeons
    function() t[15650] = a:New(15650); end, -- Mythic: Streets of Wonder
    function() t[15649] = a:New(15649); end, -- Shadowlands Dilettante
    function() t[15648] = a:New(15648); end, -- Walking in Maw-mphis
    function() t[15647] = a:New(15647); end, -- Dead Men Tell Some Tales
    function() t[15646] = a:New(15646); end, -- Re-Re-Re-Renowned
    function() t[15645] = a:New(15645); end, -- To Catch Falling Stars
    function() t[15643] = a:New(15643); end, -- What Can I Say? They Love Me.
    function() t[15642] = a:New(15642); end, -- Proven Pet Parent
    function() t[15641] = a:New(15641); end, -- Many More Mini Minions
    function() t[15640] = a:New(15640); end, -- Return to Darkness
    function() O(t[15639], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15639] = a:New(15639, nil, nil, true); end, -- Elite: Shadowlands Season 4
    function() t[15638] = a:New(15638, f.Horde); end, -- "Dracthyr, Awaken"
    function() O(t[15612], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15612] = a:New(15612, nil, nil, true); end, -- Eternal Gladiator's Soul Eater
    function() O(t[15610], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15610] = a:New(15610, nil, nil, true); end, -- Combatant II: Shadowlands Season 4
    function() O(t[15609], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15609] = a:New(15609, nil, nil, true); end, -- Combatant I: Shadowlands Season 4
    function() O(t[15608], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15608] = a:New(15608, f.Alliance, 15607, true); end, -- Hero of the Alliance: Eternal
    function() O(t[15607], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15607] = a:New(15607, f.Horde, 15608, true); end, -- Hero of the Horde: Eternal
    function() O(t[15606], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15606] = a:New(15606, nil, nil, true); end, -- Eternal Gladiator: Shadowlands Season 4
    function() O(t[15605], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15605] = a:New(15605, nil, nil, true); end, -- Gladiator: Shadowlands Season 4
    function() O(t[15604], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15604] = a:New(15604, nil, nil, true); end, -- Duelist: Shadowlands Season 4
    function() O(t[15603], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15603] = a:New(15603, nil, nil, true); end, -- Rival II: Shadowlands Season 4
    function() O(t[15602], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15602] = a:New(15602, nil, nil, true); end, -- Rival I: Shadowlands Season 4
    function() O(t[15601], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15601] = a:New(15601, nil, nil, true); end, -- Challenger II: Shadowlands Season 4
    function() O(t[15600], "From", "PvP Season", 33, "Until", "PvP Season", 33); end,
    function() t[15600] = a:New(15600, nil, nil, true); end, -- Challenger I: Shadowlands Season 4
    function() O(t[15594]); end,
    function() t[15594] = a:New(15594); end, -- Fearless Spectator
    function() t[15579] = a:New(15579); end, -- Return to Lordaeron
    function() t[15544] = a:New(15544, nil, nil, true); end, -- Supreme Soloist
    function() t[15543] = a:New(15543, nil, nil, true); end, -- Successful Solos
    function() t[15542] = a:New(15542); end, -- Apocopocolypse Now
    function() t[15541] = a:New(15541, nil, nil, true); end, -- Sole Survivor
    function() t[15540] = a:New(15540, nil, nil, true); end, -- Steadfast Soloist
    function() t[15539] = a:New(15539, nil, nil, true); end, -- Solo Aspirations
    function() t[15518] = a:New(15518); end, -- A Means to an End
    function() t[15515] = a:New(15515); end, -- Path to Enlightenment
    function() t[15514] = a:New(15514); end, -- Unlocking the Secrets
    function() t[15513] = a:New(15513); end, -- Curious Collections
    function() t[15512] = a:New(15512); end, -- Adventures in Zereth Mortis
    function() t[15511] = a:New(15511, nil, nil, true); end, -- Solely Motivated
    function() t[15509] = a:New(15509); end, -- Tales of the Exile
    function() t[15508] = a:New(15508); end, -- Fashion of the First Ones
    function() O(t[15506], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15506] = a:New(15506); end, -- Shadowlands Keystone Hero: Season Three
    function() t[15502] = a:New(15502); end, -- "Sand, Sand Everywhere!"
    function() O(t[15500], "From", "Mythic+ Season", 7, "Until", "Version", "100000"); end,
    function() t[15500] = a:New(15500); end, -- "Keystone Hero: Tazavesh, the Veiled Market"
    function() O(t[15499], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15499] = a:New(15499); end, -- Shadowlands Keystone Master: Season Three
    function() O(t[15498], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15498] = a:New(15498); end, -- Shadowlands Keystone Conqueror: Season Three
    function() O(t[15496], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15496] = a:New(15496); end, -- Shadowlands Keystone Explorer: Season Three
    function() t[15494] = a:New(15494); end, -- Damnation Aviation
    function() t[15493] = a:New(15493); end, -- Ephemeral Plains
    function() t[15492] = a:New(15492); end, -- Cornerstone of Creation
    function() t[15491] = a:New(15491); end, -- Glory of the Sepulcher Raider
    function() t[15490] = a:New(15490); end, -- Mythic: Sepulcher of the First Ones
    function() t[15489] = a:New(15489); end, -- Mythic: The Jailer
    function() t[15488] = a:New(15488); end, -- Mythic: Rygelon
    function() t[15487] = a:New(15487); end, -- Mythic: Lords of Dread
    function() t[15486] = a:New(15486); end, -- Mythic: Anduin Wrynn
    function() t[15485] = a:New(15485); end, -- Mythic: Halondrus
    function() t[15484] = a:New(15484); end, -- Mythic: Lihuvim
    function() t[15483] = a:New(15483); end, -- Mythic: Prototype Pantheon
    function() t[15482] = a:New(15482); end, -- Mythic: Dausegne
    function() t[15481] = a:New(15481); end, -- Mythic: Artificer Xy'mox
    function() t[15480] = a:New(15480); end, -- Mythic: Skolex
    function() t[15479] = a:New(15479); end, -- Mythic: Vigilant Guardian
    function() t[15478] = a:New(15478); end, -- Heroic: Sepulcher of the First Ones
    function() O(t[15471], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15471] = a:New(15471); end, -- Cutting Edge: The Jailer
    function() O(t[15470], "From", "Mythic+ Season", 7, "Until", "Mythic+ Season", 7); end,
    function() t[15470] = a:New(15470); end, -- Ahead of the Curve: The Jailer
    function() O(t[15469], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15469] = a:New(15469); end, -- We Are All Made of Stars (Mythic)
    function() O(t[15468], "From", "Mythic+ Season", 8, "Until", "Version", "100000"); end,
    function() t[15468] = a:New(15468); end, -- We Are All Made of Stars (Heroic)
    function() t[15419] = a:New(15419); end, -- The Protoform Matrix
    function() t[15418] = a:New(15418); end, -- The Grand Design
    function() t[15417] = a:New(15417); end, -- Sepulcher of the First Ones
    function() t[15416] = a:New(15416); end, -- Domination's Grasp
    function() t[15411] = a:New(15411); end, -- Synthe-supersized!
    function() t[15410] = a:New(15410); end, -- Synthe-superfived!
    function() T(t[15409], u[2415]); end, -- Armaments of the Infinite Infantry (Raid Finder)
    function() T(t[15409], u[2414]); end, -- Armaments of the Infinite Infantry (Normal)
    function() T(t[15409], u[2416]); end, -- Armaments of the Infinite Infantry (Heroic)
    function() T(t[15409], u[2417]); end, -- Armaments of the Infinite Infantry (Mythic)
    function() T(t[15409], u[2385]); end, -- Luminous Chevalier's Gallantry (Raid Finder)
    function() T(t[15409], u[2384]); end, -- Luminous Chevalier's Gallantry (Normal)
    function() T(t[15409], u[2386]); end, -- Luminous Chevalier's Gallantry (Heroic)
    function() T(t[15409], u[2387]); end, -- Luminous Chevalier's Gallantry (Mythic)
    function() T(t[15409], u[2367]); end, -- Godstalker's Battlegear (Raid Finder)
    function() T(t[15409], u[2366]); end, -- Godstalker's Battlegear (Normal)
    function() T(t[15409], u[2368]); end, -- Godstalker's Battlegear (Heroic)
    function() T(t[15409], u[2369]); end, -- Godstalker's Battlegear (Mythic)
    function() T(t[15409], u[2397]); end, -- Soulblade Shadowhide (Raid Finder)
    function() T(t[15409], u[2396]); end, -- Soulblade Shadowhide (Normal)
    function() T(t[15409], u[2398]); end, -- Soulblade Shadowhide (Heroic)
    function() T(t[15409], u[2399]); end, -- Soulblade Shadowhide (Mythic)
    function() T(t[15409], u[2391]); end, -- Habiliments of the Empyrean (Raid Finder)
    function() T(t[15409], u[2390]); end, -- Habiliments of the Empyrean (Normal)
    function() T(t[15409], u[2392]); end, -- Habiliments of the Empyrean (Heroic)
    function() T(t[15409], u[2393]); end, -- Habiliments of the Empyrean (Mythic)
    function() T(t[15409], u[2349]); end, -- The First Eidolon's Soulsteel (Raid Finder)
    function() T(t[15409], u[2348]); end, -- The First Eidolon's Soulsteel (Normal)
    function() T(t[15409], u[2350]); end, -- The First Eidolon's Soulsteel (Heroic)
    function() T(t[15409], u[2351]); end, -- The First Eidolon's Soulsteel (Mythic)
    function() T(t[15409], u[2403]); end, -- Theurgic Starspeaker's Regalia (Raid Finder)
    function() T(t[15409], u[2402]); end, -- Theurgic Starspeaker's Regalia (Normal)
    function() T(t[15409], u[2404]); end, -- Theurgic Starspeaker's Regalia (Heroic)
    function() T(t[15409], u[2405]); end, -- Theurgic Starspeaker's Regalia (Mythic)
    function() T(t[15409], u[2373]); end, -- Erudite Occultist's Vestments (Raid Finder)
    function() T(t[15409], u[2372]); end, -- Erudite Occultist's Vestments (Normal)
    function() T(t[15409], u[2374]); end, -- Erudite Occultist's Vestments (Heroic)
    function() T(t[15409], u[2375]); end, -- Erudite Occultist's Vestments (Mythic)
    function() T(t[15409], u[2409]); end, -- Shroud of the Demon Star (Raid Finder)
    function() T(t[15409], u[2408]); end, -- Shroud of the Demon Star (Normal)
    function() T(t[15409], u[2410]); end, -- Shroud of the Demon Star (Heroic)
    function() T(t[15409], u[2411]); end, -- Shroud of the Demon Star (Mythic)
    function() T(t[15409], u[2379]); end, -- Garb of the Grand Upwelling (Raid Finder)
    function() T(t[15409], u[2378]); end, -- Garb of the Grand Upwelling (Normal)
    function() T(t[15409], u[2380]); end, -- Garb of the Grand Upwelling (Heroic)
    function() T(t[15409], u[2381]); end, -- Garb of the Grand Upwelling (Mythic)
    function() T(t[15409], u[2361]); end, -- Tapestry of the Fixed Stars (Raid Finder)
    function() T(t[15409], u[2360]); end, -- Tapestry of the Fixed Stars (Normal)
    function() T(t[15409], u[2362]); end, -- Tapestry of the Fixed Stars (Heroic)
    function() T(t[15409], u[2363]); end, -- Tapestry of the Fixed Stars (Mythic)
    function() T(t[15409], u[2355]); end, -- Mercurial Punisher's Painweave (Raid Finder)
    function() T(t[15409], u[2354]); end, -- Mercurial Punisher's Painweave (Normal)
    function() T(t[15409], u[2356]); end, -- Mercurial Punisher's Painweave (Heroic)
    function() T(t[15409], u[2357]); end, -- Mercurial Punisher's Painweave (Mythic)
    function() t[15409] = a:New(15409); end, -- First Wonders
    function() T(t[15408], u[2319]); end, -- Cosmic Aspirant's Plate (Aspirant)
    function() T(t[15408], u[2318]); end, -- Cosmic Aspirant's Chain (Aspirant)
    function() T(t[15408], u[2316]); end, -- Cosmic Aspirant's Vestment (Aspirant)
    function() T(t[15408], u[2317]); end, -- Cosmic Aspirant's Leathers (Aspirant)
    function() T(t[15408], u[2418]); end, -- Cosmic Gladiator's Plate Armor (Gladiator)
    function() T(t[15408], u[2419]); end, -- Cosmic Gladiator's Plate Armor (Elite)
    function() T(t[15408], u[2388]); end, -- Cosmic Gladiator's Scaled Armor (Gladiator)
    function() T(t[15408], u[2389]); end, -- Cosmic Gladiator's Scaled Armor (Elite)
    function() T(t[15408], u[2370]); end, -- Cosmic Gladiator's Chain Armor (Gladiator)
    function() T(t[15408], u[2371]); end, -- Cosmic Gladiator's Chain Armor (Elite)
    function() T(t[15408], u[2400]); end, -- Cosmic Gladiator's Leather Armor (Gladiator)
    function() T(t[15408], u[2401]); end, -- Cosmic Gladiator's Leather Armor (Elite)
    function() T(t[15408], u[2394]); end, -- Cosmic Gladiator's Satin Armor (Gladiator)
    function() T(t[15408], u[2395]); end, -- Cosmic Gladiator's Satin Armor (Elite)
    function() T(t[15408], u[2352]); end, -- Cosmic Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[15408], u[2353]); end, -- Cosmic Gladiator's Dreadplate Armor (Elite)
    function() T(t[15408], u[2406]); end, -- Cosmic Gladiator's Ringmail Armor (Gladiator)
    function() T(t[15408], u[2407]); end, -- Cosmic Gladiator's Ringmail Armor (Elite)
    function() T(t[15408], u[2376]); end, -- Cosmic Gladiator's Silk Armor (Gladiator)
    function() T(t[15408], u[2377]); end, -- Cosmic Gladiator's Silk Armor (Elite)
    function() T(t[15408], u[2412]); end, -- Cosmic Gladiator's Felweave Armor (Gladiator)
    function() T(t[15408], u[2413]); end, -- Cosmic Gladiator's Felweave Armor (Elite)
    function() T(t[15408], u[2382]); end, -- Cosmic Gladiator's Ironskin Armor (Gladiator)
    function() T(t[15408], u[2383]); end, -- Cosmic Gladiator's Ironskin Armor (Elite)
    function() T(t[15408], u[2364]); end, -- Cosmic Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[15408], u[2365]); end, -- Cosmic Gladiator's Dragonhide Armor (Elite)
    function() T(t[15408], u[2358]); end, -- Cosmic Gladiator's Felskin Armor (Gladiator)
    function() T(t[15408], u[2359]); end, -- Cosmic Gladiator's Felskin Armor (Elite)
    function() t[15408] = a:New(15408, nil, nil, true); end, -- Cosmic Chic
    function() t[15407] = a:New(15407); end, -- Synthe-fived!
    function() t[15406] = a:New(15406); end, -- Synthesized!
    function() t[15404] = a:New(15404); end, -- Cosmic Empowerment
    function() t[15402] = a:New(15402); end, -- Cyphers of the First Ones
    function() t[15401] = a:New(15401); end, -- Wisdom Comes From the Desert
    function() t[15400] = a:New(15400); end, -- Where the Wild Corgis Are
    function() t[15399] = a:New(15399); end, -- Coming to Terms
    function() t[15398] = a:New(15398); end, -- "Xy Never, Ever Marks the Spot."
    function() t[15397] = a:New(15397); end, -- Four Ring Circus
    function() t[15396] = a:New(15396); end, -- We Are All Made of Stars
    function() t[15394] = a:New(15394); end, -- Ohn'a'Roll
    function() t[15392] = a:New(15392); end, -- Dune Dominance
    function() t[15391] = a:New(15391); end, -- Adventurer of Zereth Mortis
    function() t[15388] = a:New(15388); end, -- Shadowlands Explorer
    function() t[15386] = a:New(15386); end, -- Shimmering Secrets
    function() O(t[15384], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15384] = a:New(15384, nil, nil, true); end, -- Cosmic Gladiator's Soul Eater
    function() t[15381] = a:New(15381); end, -- Power ON
    function() O(t[15380], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15380] = a:New(15380, nil, nil, true); end, -- Combatant II: Shadowlands Season 3
    function() O(t[15379], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15379] = a:New(15379, nil, nil, true); end, -- Challenger II: Shadowlands Season 3
    function() O(t[15378], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15378] = a:New(15378, nil, nil, true); end, -- Rival II: Shadowlands Season 3
    function() O(t[15356], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15356] = a:New(15356, f.Horde, 15355, true); end, -- Hero of the Horde: Cosmic
    function() O(t[15355], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15355] = a:New(15355, f.Alliance, 15356, true); end, -- Hero of the Alliance: Cosmic
    function() O(t[15354], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15354] = a:New(15354, nil, nil, true); end, -- Elite: Shadowlands Season 3
    function() O(t[15353], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15353] = a:New(15353, nil, nil, true); end, -- Cosmic Gladiator: Shadowlands Season 3
    function() O(t[15352], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15352] = a:New(15352, nil, nil, true); end, -- Gladiator: Shadowlands Season 3
    function() O(t[15351], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15351] = a:New(15351, nil, nil, true); end, -- Duelist: Shadowlands Season 3
    function() O(t[15350], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15350] = a:New(15350, nil, nil, true); end, -- Rival I: Shadowlands Season 3
    function() O(t[15349], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15349] = a:New(15349, nil, nil, true); end, -- Challenger I: Shadowlands Season 3
    function() O(t[15348], "From", "PvP Season", 32, "Until", "PvP Season", 32); end,
    function() t[15348] = a:New(15348, nil, nil, true); end, -- Combatant I: Shadowlands Season 3
    function() t[15336] = a:New(15336); end, -- From A to Zereth
    function() t[15331] = a:New(15331); end, -- Treasures of Zereth Mortis
    function() O(t[15327], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15327] = a:New(15327); end, -- Tormented Hero: Shadowlands Season 2
    function() t[15325] = a:New(15325, f.Alliance); end, -- "Dracthyr, Awaken"
    function() t[15324] = a:New(15324); end, -- Tower Ranger
    function() t[15323] = a:New(15323); end, -- Sarge's Tale
    function() t[15322] = a:New(15322); end, -- Flawless Master (Layer 16)
    function() t[15320] = a:New(15320); end, -- Flawless: The Upper Reaches (Layer 16)
    function() t[15319] = a:New(15319); end, -- Flawless: Mort'regar (Layer 16)
    function() t[15318] = a:New(15318); end, -- Flawless: Coldheart Interstitia (Layer 16)
    function() t[15317] = a:New(15317); end, -- Flawless: The Soulforges (Layer 16)
    function() t[15316] = a:New(15316); end, -- Flawless: Fracture Chambers (Layer 16)
    function() t[15315] = a:New(15315); end, -- Amidst Ourselves
    function() t[15314] = a:New(15314); end, -- Flawless: Skoldus Hall (Layer 16)
    function() t[15313] = a:New(15313); end, -- Rockin' Rollin' Racer
    function() t[15310] = a:New(15310); end, -- A Tour of Towers
    function() t[15309] = a:New(15309); end, -- A Towering Success
    function() t[15308] = a:New(15308); end, -- Tower Overwhelming
    function() t[15259] = a:New(15259); end, -- Secrets of the First Ones
    function() t[15258] = a:New(15258); end, -- The Jailer's Gauntlet: Layer 8
    function() t[15257] = a:New(15257); end, -- The Jailer's Gauntlet: Layer 7
    function() t[15256] = a:New(15256); end, -- The Jailer's Gauntlet: Layer 6
    function() t[15255] = a:New(15255); end, -- The Jailer's Gauntlet: Layer 5
    function() t[15254] = a:New(15254); end, -- The Jailer's Gauntlet: Layer 4
    function() t[15253] = a:New(15253); end, -- The Jailer's Gauntlet: Layer 3
    function() t[15252] = a:New(15252); end, -- The Jailer's Gauntlet: Layer 2
    function() t[15251] = a:New(15251); end, -- The Jailer's Gauntlet: Layer 1
    function() t[15241] = a:New(15241); end, -- Renowned
    function() O(t[15234], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[15234] = a:New(15234, nil, nil, true); end, -- Rival II: Shadowlands Season 2
    function() O(t[15233], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[15233] = a:New(15233, nil, nil, true); end, -- Challenger II: Shadowlands Season 2
    function() O(t[15232], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[15232] = a:New(15232, nil, nil, true); end, -- Combatant II: Shadowlands Season 2
    function() t[15229] = a:New(15229); end, -- Traversing the Spheres
    function() t[15224] = a:New(15224); end, -- Explore Zereth Mortis
    function() t[15223] = a:New(15223); end, -- Feeling It
    function() t[15222] = a:New(15222); end, -- You Got the Beat
    function() t[15221] = a:New(15221); end, -- Dancing Machine
    function() t[15220] = a:New(15220); end, -- The Enlightened
    function() O(t[15218]); end,
    function() t[15218] = a:New(15218); end, -- WoW's 18th Anniversary
    function() t[15217] = a:New(15217); end, -- Maniac on the Dance Floor
    function() t[15216] = a:New(15216); end, -- Make You Sweat
    function() t[15215] = a:New(15215); end, -- Can't Stop the Feeling
    function() t[15214] = a:New(15214); end, -- What a Feeling
    function() t[15213] = a:New(15213); end, -- Don't Stop Dancing
    function() t[15212] = a:New(15212); end, -- First Dance
    function() t[15211] = a:New(15211); end, -- Completing the Code
    function() t[15191] = a:New(15191); end, -- "Rae'shalare, Death's Whisper"
    function() t[15190] = a:New(15190); end, -- Mischief!
    function() t[15181] = a:New(15181); end, -- Rock n' Roll
    function() t[15179] = a:New(15179); end, -- This is Fine
    function() t[15178] = a:New(15178); end, -- Fake It 'Til You Make It
    function() t[15177] = a:New(15177); end, -- "Tazavesh, the Veiled Market"
    function() O(t[15135], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15135] = a:New(15135); end, -- Cutting Edge: Sylvanas Windrunner
    function() O(t[15134], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15134] = a:New(15134); end, -- Ahead of the Curve: Sylvanas Windrunner
    function() t[15133] = a:New(15133); end, -- This World is a Prism
    function() t[15132] = a:New(15132); end, -- Knowledge is Power
    function() t[15131] = a:New(15131); end, -- Whack-A-Soul
    function() t[15130] = a:New(15130); end, -- Glory of the Dominant Raider
    function() t[15128] = a:New(15128); end, -- Mythic: Sanctum of Domination
    function() t[15127] = a:New(15127); end, -- Heroic: Sanctum of Domination
    function() t[15126] = a:New(15126); end, -- Sanctum of Domination
    function() t[15125] = a:New(15125); end, -- The Reckoning
    function() t[15124] = a:New(15124); end, -- Shackles of Fate
    function() t[15123] = a:New(15123); end, -- The Dark Bastille
    function() t[15122] = a:New(15122); end, -- The Jailer's Vanguard
    function() t[15121] = a:New(15121); end, -- Mythic: Sylvanas Windrunner
    function() t[15120] = a:New(15120); end, -- Mythic: Kel'Thuzad
    function() t[15119] = a:New(15119); end, -- Mythic: Fatescribe Roh-Kalo
    function() t[15118] = a:New(15118); end, -- Mythic: Guardian of the First Ones
    function() t[15117] = a:New(15117); end, -- Mythic: Painsmith Raznal
    function() t[15116] = a:New(15116); end, -- Mythic: Soulrender Dormazain
    function() t[15115] = a:New(15115); end, -- Mythic: Remnant of Ner'zhul
    function() t[15114] = a:New(15114); end, -- Mythic: The Nine
    function() t[15113] = a:New(15113); end, -- Mythic: The Eye of the Jailer
    function() t[15112] = a:New(15112); end, -- Mythic: The Tarragrue
    function() T(t[15110], u[2251]); end, -- Soulforged Dreadplate (Raid Finder)
    function() T(t[15110], u[2250]); end, -- Soulforged Dreadplate (Normal)
    function() T(t[15110], u[2252]); end, -- Soulforged Dreadplate (Heroic)
    function() T(t[15110], u[2253]); end, -- Soulforged Dreadplate (Mythic)
    function() T(t[15110], u[2255]); end, -- Tower Ascendant's Battlegear (Raid Finder)
    function() T(t[15110], u[2254]); end, -- Tower Ascendant's Battlegear (Normal)
    function() T(t[15110], u[2256]); end, -- Tower Ascendant's Battlegear (Heroic)
    function() T(t[15110], u[2257]); end, -- Tower Ascendant's Battlegear (Mythic)
    function() T(t[15110], u[2263]); end, -- Dark Supplicant's Garb (Raid Finder)
    function() T(t[15110], u[2262]); end, -- Dark Supplicant's Garb (Normal)
    function() T(t[15110], u[2264]); end, -- Dark Supplicant's Garb (Heroic)
    function() T(t[15110], u[2265]); end, -- Dark Supplicant's Garb (Mythic)
    function() T(t[15110], u[2259]); end, -- Sanctum Assailant's Trappings (Raid Finder)
    function() T(t[15110], u[2258]); end, -- Sanctum Assailant's Trappings (Normal)
    function() T(t[15110], u[2260]); end, -- Sanctum Assailant's Trappings (Heroic)
    function() T(t[15110], u[2261]); end, -- Sanctum Assailant's Trappings (Mythic)
    function() t[15110] = a:New(15110); end, -- Dominating the Catwalk
    function() t[15109] = a:New(15109); end, -- Will it Blend?
    function() t[15108] = a:New(15108); end, -- Together Forever
    function() t[15107] = a:New(15107); end, -- Conquering Korthia
    function() t[15106] = a:New(15106); end, -- Quality Control
    function() t[15105] = a:New(15105); end, -- Tormentor's Tango
    function() T(t[15102], u[2249]); end, -- Unchained Aspirant's Plate (Aspirant)
    function() T(t[15102], u[2227]); end, -- Unchained Gladiator's Plate (Gladiator)
    function() T(t[15102], u[2231]); end, -- Unchained Gladiator's Plate (Elite)
    function() T(t[15102], u[2248]); end, -- Unchained Aspirant's Chain (Aspirant)
    function() T(t[15102], u[2226]); end, -- Unchained Gladiator's Chain (Gladiator)
    function() T(t[15102], u[2230]); end, -- Unchained Gladiator's Chain (Elite)
    function() T(t[15102], u[2246]); end, -- Unchained Aspirant's Vestment (Aspirant)
    function() T(t[15102], u[2224]); end, -- Unchained Gladiator's Vestment (Gladiator)
    function() T(t[15102], u[2228]); end, -- Unchained Gladiator's Vestment (Elite)
    function() T(t[15102], u[2247]); end, -- Unchained Aspirant's Leathers (Aspirant)
    function() T(t[15102], u[2225]); end, -- Unchained Gladiator's Leathers (Gladiator)
    function() T(t[15102], u[2229]); end, -- Unchained Gladiator's Leathers (Elite)
    function() t[15102] = a:New(15102, nil, nil, true); end, -- It's Off the Chain!
    function() t[15099] = a:New(15099); end, -- Treasures of Korthia
    function() t[15096] = a:New(15096); end, -- Crowd Pleaser
    function() t[15095] = a:New(15095); end, -- No Doubt
    function() t[15094] = a:New(15094); end, -- Rampage
    function() t[15093] = a:New(15093); end, -- Avenge Me!
    function() t[15092] = a:New(15092); end, -- Master of Torment
    function() t[15091] = a:New(15091); end, -- A Taste of Perfection
    function() t[15089] = a:New(15089); end, -- Flawless Master (Layer 12)
    function() t[15088] = a:New(15088); end, -- Flawless: The Upper Reaches (Layer 12)
    function() t[15087] = a:New(15087); end, -- Flawless: Mort'regar (Layer 12)
    function() t[15084] = a:New(15084); end, -- Flawless: The Soulforges (Layer 12)
    function() t[15083] = a:New(15083); end, -- Flawless: Coldheart Interstitia (Layer 12)
    function() t[15082] = a:New(15082); end, -- Flawless: Fracture Chambers (Layer 12)
    function() t[15081] = a:New(15081); end, -- Flawless: Skoldus Hall (Layer 12)
    function() t[15080] = a:New(15080); end, -- So Blessed
    function() t[15079] = a:New(15079); end, -- "Many, Many Things"
    function() O(t[15078], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15078] = a:New(15078); end, -- Shadowlands Keystone Master: Season Two
    function() O(t[15077], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15077] = a:New(15077); end, -- Shadowlands Keystone Conqueror: Season Two
    function() t[15076] = a:New(15076); end, -- The Box of Many Things
    function() t[15075] = a:New(15075); end, -- Infiltrators
    function() O(t[15073], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 6); end,
    function() t[15073] = a:New(15073); end, -- Shadowlands Keystone Explorer: Season Two
    function() t[15069] = a:New(15069); end, -- The Archivists' Codex
    function() t[15067] = a:New(15067); end, -- Adamant Vaults
    function() t[15066] = a:New(15066); end, -- Reliquary Restoration
    function() t[15065] = a:New(15065); end, -- Eye Wish You Were Here
    function() t[15064] = a:New(15064); end, -- Breaking the Chains
    function() t[15059] = a:New(15059); end, -- Death's Advance
    function() t[15058] = a:New(15058); end, -- I Used to Bullseye Deeprun Rats Back Home
    function() t[15057] = a:New(15057); end, -- Friend of Plaguey
    function() t[15056] = a:New(15056); end, -- Friend of Bloop
    function() t[15055] = a:New(15055); end, -- Friend of Ooz
    function() t[15054] = a:New(15054); end, -- Minions of the Cold Dark
    function() t[15053] = a:New(15053); end, -- Explore Korthia
    function() O(t[15052], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15052] = a:New(15052); end, -- Keystone Hero: Sanguine Depths
    function() O(t[15051], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15051] = a:New(15051); end, -- Keystone Hero: De Other Side
    function() O(t[15050], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15050] = a:New(15050); end, -- Keystone Hero: Theater of Pain
    function() O(t[15049], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15049] = a:New(15049); end, -- Keystone Hero: Spires of Ascension
    function() O(t[15048], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15048] = a:New(15048); end, -- Keystone Hero: Halls of Atonement
    function() O(t[15047], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15047] = a:New(15047); end, -- Keystone Hero: Mists of Tirna Scithe
    function() O(t[15046], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15046] = a:New(15046); end, -- Keystone Hero: Plaguefall
    function() O(t[15045], "From", "Mythic+ Season", 6, "Until", "Mythic+ Season", 7); end,
    function() t[15045] = a:New(15045); end, -- Keystone Hero: The Necrotic Wake
    function() t[15044] = a:New(15044); end, -- Krrprripripkraak's Heroes
    function() t[15043] = a:New(15043); end, -- Hoarder of Torghast
    function() t[15042] = a:New(15042); end, -- Tea for the Troubled
    function() t[15041] = a:New(15041); end, -- The Zovaal Shuffle
    function() t[15040] = a:New(15040); end, -- Flawless Fate
    function() t[15039] = a:New(15039); end, -- Up For Grabs
    function() t[15037] = a:New(15037); end, -- This Army
    function() t[15036] = a:New(15036); end, -- Rooting Out the Evil
    function() t[15035] = a:New(15035); end, -- On the Offensive
    function() t[15034] = a:New(15034); end, -- Wings Against the Flames
    function() t[15033] = a:New(15033); end, -- Taking the Tremaculum
    function() t[15032] = a:New(15032); end, -- Breaking Their Hold
    function() t[15025] = a:New(15025); end, -- Sanctum Superior
    function() t[15024] = a:New(15024); end, -- Denying the Drought
    function() t[15023] = a:New(15023); end, -- We Can Rebuild
    function() t[15004] = a:New(15004); end, -- A Sly Fox
    function() t[15003] = a:New(15003); end, -- To the Nines
    function() t[15001] = a:New(15001); end, -- Jailer's Personal Stash
    function() t[15000] = a:New(15000); end, -- United Front
    function() O(t[14999], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14999] = a:New(14999, nil, nil, true); end, -- Unchained Gladiator's Soul Eater
    function() t[14998] = a:New(14998); end, -- "Name A Better Duo, I'll Wait"
    function() O(t[14976], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14976] = a:New(14976, f.Horde, 14975, true); end, -- Hero of the Horde: Unchained
    function() O(t[14975], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14975] = a:New(14975, f.Alliance, 14976, true); end, -- Hero of the Alliance: Unchained
    function() O(t[14974], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14974] = a:New(14974, nil, nil, true); end, -- Elite: Shadowlands Season 2
    function() O(t[14973], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14973] = a:New(14973, nil, nil, true); end, -- Unchained Gladiator: Shadowlands Season 2
    function() O(t[14972], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14972] = a:New(14972, nil, nil, true); end, -- Gladiator: Shadowlands Season 2
    function() O(t[14971], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14971] = a:New(14971, nil, nil, true); end, -- Duelist: Shadowlands Season 2
    function() O(t[14970], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14970] = a:New(14970, nil, nil, true); end, -- Rival I: Shadowlands Season 2
    function() O(t[14969], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14969] = a:New(14969, nil, nil, true); end, -- Challenger I: Shadowlands Season 2
    function() O(t[14968], "From", "PvP Season", 31, "Until", "PvP Season", 31); end,
    function() t[14968] = a:New(14968, nil, nil, true); end, -- Combatant I: Shadowlands Season 2
    function() t[14961] = a:New(14961); end, -- Chains of Domination
    function() t[14943] = a:New(14943); end, -- Guarmageddon
    function() O(t[14942]); end,
    function() t[14942] = a:New(14942); end, -- WoW's 17th Anniversary
    function() O(t[14938], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5); end,
    function() t[14938] = a:New(14938); end, -- Shadowlands Keystone Explorer: Season One
    function() t[14931] = a:New(14931); end, -- Flying Festivities
    function() O(t[14904]); end,
    function() t[14904] = a:New(14904); end, -- Netherwhelp Online
    function() t[14895] = a:New(14895); end, -- 'Ghast Five
    function() t[14894] = a:New(14894); end, -- "To 'Ghast, Two Curios"
    function() t[14887] = a:New(14887); end, -- To the Moon
    function() t[14881] = a:New(14881); end, -- Abhorrent Adversaries of the Afterlife
    function() t[14879] = a:New(14879); end, -- Family Exorcist
    function() t[14877] = a:New(14877); end, -- Unholy Undead
    function() t[14876] = a:New(14876); end, -- Macabre Mechanicals
    function() t[14875] = a:New(14875); end, -- Mummified Magics
    function() t[14874] = a:New(14874); end, -- Haunted Humanoids
    function() t[14873] = a:New(14873); end, -- Flickering Fliers
    function() t[14872] = a:New(14872); end, -- Eerie Elementals
    function() t[14871] = a:New(14871); end, -- Deathly Dragonkin
    function() t[14870] = a:New(14870); end, -- Creepy Critters
    function() t[14869] = a:New(14869); end, -- Beast Busters
    function() t[14868] = a:New(14868); end, -- Aquatic Apparitions
    function() t[14867] = a:New(14867); end, -- Shadowlands Safari
    function() t[14866] = a:New(14866); end, -- Master of the Path
    function() t[14865] = a:New(14865); end, -- Disciple of Humility
    function() t[14864] = a:New(14864); end, -- Personal Nightmare
    function() t[14863] = a:New(14863); end, -- Death Foursworn
    function() t[14862] = a:New(14862); end, -- It's How You Wear It
    function() t[14861] = a:New(14861); end, -- Learning from the Masters
    function() t[14860] = a:New(14860); end, -- Bare Necessities
    function() t[14859] = a:New(14859); end, -- Inside the Park Home Run
    function() t[14858] = a:New(14858); end, -- Curse of Thirst
    function() t[14857] = a:New(14857); end, -- Itsy Bitsy Fighters
    function() t[14856] = a:New(14856); end, -- "Charmed, I'm Sure"
    function() t[14854] = a:New(14854); end, -- It's Not What You Wear
    function() t[14853] = a:New(14853); end, -- All The Colors of the Painbow
    function() t[14852] = a:New(14852); end, -- The Hoot of the Issue
    function() t[14851] = a:New(14851); end, -- Bastion of Protection
    function() t[14847] = a:New(14847); end, -- Adventures: Protector of the Shadowlands
    function() t[14846] = a:New(14846); end, -- Adventures: Leaves in the Forest
    function() t[14845] = a:New(14845); end, -- Adventures: A Step in the Right Direction
    function() t[14844] = a:New(14844); end, -- Adventures: Into the Breach
    function() t[14843] = a:New(14843); end, -- Adventures: Harmony of Purpose
    function() t[14842] = a:New(14842); end, -- Adventures: Strength and Resilience
    function() t[14841] = a:New(14841); end, -- Adventures: Now You're Cooking
    function() t[14840] = a:New(14840); end, -- Adventures: Learning the Ropes
    function() t[14839] = a:New(14839); end, -- Adventures: Off To Adventure
    function() t[14837] = a:New(14837); end, -- Nexus of Bonds
    function() t[14836] = a:New(14836); end, -- Unwavering Bond
    function() t[14835] = a:New(14835); end, -- A Resolute Bond
    function() t[14834] = a:New(14834); end, -- Bound with Purpose
    function() t[14833] = a:New(14833); end, -- Fashion Abomination
    function() T(t[14831], u[2177]); end, -- Sinful Aspirant's Plate (Aspirant)
    function() T(t[14831], u[2173]); end, -- Sinful Gladiator's Plate (Gladiator)
    function() T(t[14831], u[2169]); end, -- Sinful Gladiator's Plate (Elite)
    function() T(t[14831], u[2176]); end, -- Sinful Aspirant's Chain (Aspirant)
    function() T(t[14831], u[2172]); end, -- Sinful Gladiator's Chain (Gladiator)
    function() T(t[14831], u[2168]); end, -- Sinful Gladiator's Chain (Elite)
    function() T(t[14831], u[2174]); end, -- Sinful Aspirant's Vestment (Aspirant)
    function() T(t[14831], u[2170]); end, -- Sinful Gladiator's Vestment (Gladiator)
    function() T(t[14831], u[2166]); end, -- Sinful Gladiator's Vestment (Elite)
    function() T(t[14831], u[2175]); end, -- Sinful Aspirant's Leathers (Aspirant)
    function() T(t[14831], u[2171]); end, -- Sinful Gladiator's Leathers (Gladiator)
    function() T(t[14831], u[2167]); end, -- Sinful Gladiator's Leathers (Elite)
    function() t[14831] = a:New(14831, nil, nil, true); end, -- "I Live, I Die, I Queue Again"
    function() t[14825] = a:New(14825); end, -- Shadowlands Voyager
    function() t[14817] = a:New(14817, f.Alliance, 14815, true); end, -- Opposing Orgrimmar
    function() O(t[14816], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14816] = a:New(14816, nil, nil, true); end, -- Sinful Gladiator's Soul Eater
    function() t[14815] = a:New(14815, f.Horde, 14817, true); end, -- Executing the Exarch
    function() t[14810] = a:New(14810); end, -- Terror of Torghast
    function() t[14809] = a:New(14809); end, -- Traversing Torghast
    function() t[14808] = a:New(14808); end, -- Touring Torghast
    function() t[14802] = a:New(14802); end, -- Bloodsport
    function() t[14801] = a:New(14801); end, -- Sojourner of Bastion
    function() t[14800] = a:New(14800); end, -- Sojourner of Ardenweald
    function() t[14799] = a:New(14799); end, -- Sojourner of Maldraxxus
    function() t[14798] = a:New(14798); end, -- Sojourner of Revendreth
    function() t[14797] = a:New(14797); end, -- Epic (Shadowlands)
    function() t[14796] = a:New(14796); end, -- Superior (Shadowlands)
    function() t[14795] = a:New(14795); end, -- Clearing the Fog
    function() t[14791] = a:New(14791); end, -- Toss a Seed to Your Hunter...
    function() t[14790] = a:New(14790); end, -- Covenant Campaign
    function() t[14789] = a:New(14789); end, -- All Spirits Great and Small
    function() t[14788] = a:New(14788); end, -- Fractured Faerie Tales
    function() t[14783] = a:New(14783); end, -- Level 60
    function() t[14782] = a:New(14782); end, -- Level 50
    function() t[14780] = a:New(14780); end, -- Meditation Master
    function() t[14779] = a:New(14779); end, -- Wild Hunting
    function() t[14778] = a:New(14778); end, -- Extremely Ravenous
    function() t[14777] = a:New(14777); end, -- Restoration Expert
    function() t[14776] = a:New(14776); end, -- For the Hoarder!
    function() t[14775] = a:New(14775); end, -- Mush Appreciated
    function() t[14774] = a:New(14774); end, -- Ardenweald Gourmand
    function() t[14773] = a:New(14773); end, -- Explosive Extermination
    function() t[14772] = a:New(14772); end, -- Caught in a Bat Romance
    function() t[14771] = a:New(14771); end, -- The Afterlife Express
    function() t[14770] = a:New(14770); end, -- What We Ride in the Shadows
    function() t[14769] = a:New(14769); end, -- Bat!
    function() t[14768] = a:New(14768); end, -- What is that Melody?
    function() t[14767] = a:New(14767); end, -- Count Your Blessings
    function() t[14766] = a:New(14766); end, -- Parasoling
    function() t[14765] = a:New(14765); end, -- Ramparts Racer
    function() t[14764] = a:New(14764); end, -- The Great Luckydo
    function() t[14763] = a:New(14763); end, -- Crypt Couture
    function() t[14762] = a:New(14762); end, -- Breaking the Stratus Fear
    function() t[14761] = a:New(14761); end, -- Deciphering Death's Intentions
    function() t[14760] = a:New(14760); end, -- Recollection Collection
    function() t[14759] = a:New(14759); end, -- It's Coming Back to Me...
    function() t[14758] = a:New(14758); end, -- The World Beyond
    function() t[14755] = a:New(14755); end, -- Legendary Accord
    function() t[14754] = a:New(14754); end, -- The Forgotten One
    function() t[14753] = a:New(14753); end, -- It's a Wrap
    function() t[14752] = a:New(14752); end, -- Things To Do When You're Dead
    function() t[14751] = a:New(14751); end, -- The Gang's All Here
    function() O(t[14750], "From", "Version", "090001", "Until", "Version", "090001"); end,
    function() t[14750] = a:New(14750); end, -- Death Rising
    function() t[14749] = a:New(14749); end, -- Rendle's Big Day
    function() t[14748] = a:New(14748); end, -- Wardrobe Makeover
    function() t[14747] = a:New(14747); end, -- Make it Double!
    function() t[14746] = a:New(14746); end, -- Prepare for Trouble!
    function() t[14745] = a:New(14745); end, -- Grand Theft Shadehound
    function() t[14744] = a:New(14744); end, -- Better to Be Lucky Than Dead
    function() t[14743] = a:New(14743); end, -- Deadly Serious
    function() t[14742] = a:New(14742); end, -- Who Sent You?
    function() t[14741] = a:New(14741); end, -- Aerial Ace
    function() t[14738] = a:New(14738); end, -- Hunting Party
    function() t[14737] = a:New(14737); end, -- What Bastion Remembered
    function() t[14735] = a:New(14735); end, -- Flight School Graduate
    function() t[14734] = a:New(14734); end, -- Rallying Cry of the Ascended
    function() t[14733] = a:New(14733); end, -- In the Hot Seat
    function() t[14731] = a:New(14731); end, -- To All the Squirrels I've Loved and Lost
    function() t[14730] = a:New(14730); end, -- To All the Squirrels I Set Sail to See
    function() t[14729] = a:New(14729); end, -- To All the Squirrels I Love Despite Their Scars
    function() t[14728] = a:New(14728); end, -- To All the Squirrels Through Time and Space
    function() t[14727] = a:New(14727); end, -- Master of Ceremonies
    function() t[14726] = a:New(14726); end, -- It's Certainly Never Boring
    function() t[14725] = a:New(14725); end, -- We Happy Few
    function() t[14724] = a:New(14724); end, -- People Pleaser
    function() t[14723] = a:New(14723); end, -- Be Our Guest
    function() t[14721] = a:New(14721); end, -- It's In The Mix
    function() t[14718] = a:New(14718); end, -- Mythic: Castle Nathria
    function() t[14717] = a:New(14717); end, -- Heroic: Castle Nathria
    function() t[14715] = a:New(14715); end, -- Castle Nathria
    function() O(t[14693], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14693] = a:New(14693, f.Horde, 14692, true); end, -- Hero of the Horde: Sinful
    function() O(t[14692], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14692] = a:New(14692, f.Alliance, 14693, true); end, -- Hero of the Alliance: Sinful
    function() O(t[14691], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14691] = a:New(14691, nil, nil, true); end, -- Elite: Shadowlands Season 1
    function() O(t[14690], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14690] = a:New(14690, nil, nil, true); end, -- Sinful Gladiator: Shadowlands Season 1
    function() O(t[14689], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14689] = a:New(14689, nil, nil, true); end, -- Gladiator: Shadowlands Season 1
    function() O(t[14688], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14688] = a:New(14688, nil, nil, true); end, -- Duelist: Shadowlands Season 1
    function() O(t[14687], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14687] = a:New(14687, nil, nil, true); end, -- Rival: Shadowlands Season 1
    function() O(t[14686], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14686] = a:New(14686, nil, nil, true); end, -- Challenger: Shadowlands Season 1
    function() O(t[14685], "From", "PvP Season", 30, "Until", "PvP Season", 30); end,
    function() t[14685] = a:New(14685, nil, nil, true); end, -- Combatant: Shadowlands Season 1
    function() t[14684] = a:New(14684); end, -- Abominable Lives
    function() t[14683] = a:New(14683); end, -- Dredger Style
    function() t[14682] = a:New(14682); end, -- The Party Herald
    function() t[14681] = a:New(14681); end, -- Dredger Academy
    function() t[14680] = a:New(14680); end, -- Something for Everyone
    function() t[14679] = a:New(14679); end, -- Party Palace
    function() t[14678] = a:New(14678); end, -- Court Favors
    function() t[14677] = a:New(14677); end, -- Spiritual Observations
    function() t[14676] = a:New(14676); end, -- Divine Spirit Savior
    function() t[14675] = a:New(14675); end, -- Spirit Talker
    function() t[14672] = a:New(14672); end, -- "A Bit of This, A Bit of That"
    function() t[14671] = a:New(14671); end, -- Something's Not Quite Right....
    function() t[14670] = a:New(14670); end, -- That's the Spirit
    function() t[14663] = a:New(14663); end, -- Explore The Maw
    function() O(t[14662], "Once"); end,
    function() t[14662] = a:New(14662, nil, nil, nil, true); end, -- Realm First! Shadowlands Keystone Master
    function() t[14660] = a:New(14660); end, -- It's About Sending a Message
    function() t[14659] = a:New(14659); end, -- Handling His Henchmen
    function() t[14658] = a:New(14658); end, -- Soulkeeper's Burden
    function() t[14656] = a:New(14656); end, -- Trading Partners
    function() t[14639] = a:New(14639); end, -- Dedication to the Restoration
    function() t[14638] = a:New(14638); end, -- The Anima Must Flow
    function() t[14637] = a:New(14637); end, -- Your Covenant's Flavor
    function() t[14636] = a:New(14636); end, -- Adventurer in Chief
    function() t[14634] = a:New(14634); end, -- Nine Afterlives
    function() t[14633] = a:New(14633); end, -- Master Navigator
    function() t[14632] = a:New(14632); end, -- Conducting Anima
    function() t[14631] = a:New(14631); end, -- Champion of the Covenant
    function() t[14630] = a:New(14630); end, -- Becoming a Hero
    function() t[14629] = a:New(14629); end, -- Gaining Respect
    function() t[14628] = a:New(14628); end, -- The Road to Renown
    function() t[14627] = a:New(14627); end, -- Choosing Your Purpose
    function() t[14626] = a:New(14626); end, -- Harvester of Sorrow
    function() t[14625] = a:New(14625); end, -- Battle in the Shadowlands
    function() t[14619] = a:New(14619); end, -- Pour Decision Making
    function() t[14617] = a:New(14617); end, -- Private Stock
    function() T(t[14614], u[2151]); end, -- Grand Sentinel's Greatplate (Raid Finder)
    function() T(t[14614], u[2150]); end, -- Grand Sentinel's Greatplate (Normal)
    function() T(t[14614], u[2152]); end, -- Grand Sentinel's Greatplate (Heroic)
    function() T(t[14614], u[2153]); end, -- Grand Sentinel's Greatplate (Mythic)
    function() T(t[14614], u[2155]); end, -- Inexorable Castigator's Guise (Raid Finder)
    function() T(t[14614], u[2154]); end, -- Inexorable Castigator's Guise (Normal)
    function() T(t[14614], u[2156]); end, -- Inexorable Castigator's Guise (Heroic)
    function() T(t[14614], u[2157]); end, -- Inexorable Castigator's Guise (Mythic)
    function() T(t[14614], u[2159]); end, -- Depraved Beguiler's Visage (Raid Finder)
    function() T(t[14614], u[2158]); end, -- Depraved Beguiler's Visage (Normal)
    function() T(t[14614], u[2160]); end, -- Depraved Beguiler's Visage (Heroic)
    function() T(t[14614], u[2161]); end, -- Depraved Beguiler's Visage (Mythic)
    function() T(t[14614], u[2163]); end, -- Sin Slayer's Leathers (Raid Finder)
    function() T(t[14614], u[2162]); end, -- Sin Slayer's Leathers (Normal)
    function() T(t[14614], u[2164]); end, -- Sin Slayer's Leathers (Heroic)
    function() T(t[14614], u[2165]); end, -- Sin Slayer's Leathers (Mythic)
    function() t[14614] = a:New(14614); end, -- Castle Vain
    function() t[14610] = a:New(14610); end, -- Clear Conscience
    function() t[14608] = a:New(14608); end, -- Burning Bright
    function() t[14607] = a:New(14607); end, -- Fresh Meat!
    function() t[14606] = a:New(14606); end, -- Thinking with...
    function() t[14570] = a:New(14570); end, -- Twisting Corridors: Layer 8
    function() t[14569] = a:New(14569); end, -- Twisting Corridors: Layer 7
    function() t[14568] = a:New(14568); end, -- Twisting Corridors: Layer 6
    function() t[14567] = a:New(14567); end, -- Picking Up the Pieces
    function() t[14533] = a:New(14533); end, -- Royal Rumble
    function() O(t[14532], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5); end,
    function() t[14532] = a:New(14532); end, -- Shadowlands Keystone Master: Season One
    function() O(t[14531], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5); end,
    function() t[14531] = a:New(14531); end, -- Shadowlands Keystone Conqueror: Season One
    function() t[14525] = a:New(14525); end, -- "Feed Me, Seymour!"
    function() t[14524] = a:New(14524); end, -- I Don't Know What I Expected
    function() t[14523] = a:New(14523); end, -- Taking Care of Business
    function() t[14519] = a:New(14519, nil, nil, true); end, -- Covenant Combat
    function() t[14516] = a:New(14516, nil, nil, true); end, -- Impressing Zo'Sorg
    function() t[14515] = a:New(14515, nil, nil, true); end, -- Zo'Sorg's Bidding
    function() t[14514] = a:New(14514, nil, nil, true); end, -- Tour of Duty: Bastion
    function() t[14513] = a:New(14513, nil, nil, true); end, -- Tour of Duty: Maldraxxus
    function() t[14512] = a:New(14512, nil, nil, true); end, -- Tour of Duty: Revendreth
    function() t[14511] = a:New(14511, nil, nil, true); end, -- Tour of Duty: Ardenweald
    function() t[14510] = a:New(14510); end, -- "Dreamweaver, As N'Zoth"
    function() t[14509] = a:New(14509); end, -- "Astra, As Azshara"
    function() t[14508] = a:New(14508); end, -- "Glimmerdust, As Jaina"
    function() t[14507] = a:New(14507); end, -- "Mi'kai, As Argus"
    function() t[14506] = a:New(14506); end, -- "Glimmerdust, As Kil'jaeden"
    function() t[14505] = a:New(14505); end, -- "Senthii, As Gul'dan"
    function() t[14504] = a:New(14504); end, -- "Niya, As Xavius"
    function() t[14503] = a:New(14503); end, -- Hooked On Hydroponics
    function() t[14502] = a:New(14502); end, -- Pursuing Loyalty
    function() t[14501] = a:New(14501); end, -- Phanatical
    function() t[14500] = a:New(14500); end, -- Phantastic
    function() t[14499] = a:New(14499); end, -- Phanciful
    function() t[14498] = a:New(14498); end, -- Gatekeepers of Torghast
    function() t[14493] = a:New(14493); end, -- The Upper Reaches
    function() t[14488] = a:New(14488); end, -- Mort'regar
    function() t[14483] = a:New(14483); end, -- Coldheart Interstitia
    function() t[14478] = a:New(14478); end, -- The Soulforges
    function() t[14473] = a:New(14473); end, -- Fracture Chambers
    function() t[14472] = a:New(14472); end, -- Twisting Corridors: Layer 5
    function() t[14471] = a:New(14471); end, -- Twisting Corridors: Layer 4
    function() t[14470] = a:New(14470); end, -- Twisting Corridors: Layer 3
    function() t[14469] = a:New(14469); end, -- Twisting Corridors: Layer 2
    function() t[14468] = a:New(14468); end, -- Twisting Corridors: Layer 1
    function() t[14463] = a:New(14463); end, -- Skoldus Hall
    function() O(t[14461], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5); end,
    function() t[14461] = a:New(14461); end, -- Cutting Edge: Sire Denathrius
    function() O(t[14460], "From", "Mythic+ Season", 5, "Until", "Mythic+ Season", 5); end,
    function() t[14460] = a:New(14460); end, -- Ahead of the Curve: Sire Denathrius
    function() t[14418] = a:New(14418); end, -- Shadowlands Dungeon Hero
    function() t[14417] = a:New(14417); end, -- Mythic: Theater of Pain
    function() t[14416] = a:New(14416); end, -- Heroic: Theater of Pain
    function() t[14415] = a:New(14415); end, -- Mythic: Plaguefall
    function() t[14414] = a:New(14414); end, -- Heroic: Plaguefall
    function() t[14413] = a:New(14413); end, -- Mythic: Mists of Tirna Scithe
    function() t[14412] = a:New(14412); end, -- Heroic: Mists of Tirna Scithe
    function() t[14411] = a:New(14411); end, -- Mythic: Halls of Atonement
    function() t[14410] = a:New(14410); end, -- Heroic: Halls of Atonement
    function() t[14409] = a:New(14409); end, -- Mythic: De Other Side
    function() t[14408] = a:New(14408); end, -- Heroic: De Other Side
    function() t[14376] = a:New(14376); end, -- Feed the Beast
    function() t[14375] = a:New(14375); end, -- Hunger for Knowledge
    function() t[14374] = a:New(14374); end, -- Couple's Therapy
    function() t[14373] = a:New(14373); end, -- De Other Side
    function() t[14372] = a:New(14372); end, -- Theater of Pain
    function() t[14371] = a:New(14371); end, -- Mists of Tirna Scithe
    function() t[14370] = a:New(14370); end, -- Halls of Atonement
    function() t[14369] = a:New(14369); end, -- Plaguefall
    function() t[14368] = a:New(14368); end, -- Mythic: The Necrotic Wake
    function() t[14367] = a:New(14367); end, -- Heroic: The Necrotic Wake
    function() t[14366] = a:New(14366); end, -- The Necrotic Wake
    function() t[14365] = a:New(14365); end, -- Mythic: Sire Denathrius
    function() t[14364] = a:New(14364); end, -- Mythic: Stone Legion Generals
    function() t[14363] = a:New(14363); end, -- Mythic: Sludgefist
    function() t[14362] = a:New(14362); end, -- Mythic: The Council of Blood
    function() t[14361] = a:New(14361); end, -- Mythic: Lady Inerva Darkvein
    function() t[14360] = a:New(14360); end, -- Mythic: Sun King's Salvation
    function() t[14359] = a:New(14359); end, -- Mythic: Artificer Xy'mox
    function() t[14358] = a:New(14358); end, -- Mythic: Hungering Destroyer
    function() t[14357] = a:New(14357); end, -- Mythic: Huntsman Altimor
    function() t[14356] = a:New(14356); end, -- Mythic: Shriekwing
    function() t[14355] = a:New(14355); end, -- Glory of the Nathria Raider
    function() t[14354] = a:New(14354); end, -- Highly Communicable
    function() t[14353] = a:New(14353); end, -- Ardenweald's a Stage
    function() t[14352] = a:New(14352); end, -- Nobody Puts Denathrius in a Corner
    function() t[14347] = a:New(14347); end, -- Full Gores Meal
    function() t[14339] = a:New(14339); end, -- Shard Labor
    function() t[14338] = a:New(14338); end, -- Court of Harvesters
    function() t[14337] = a:New(14337); end, -- The Wild Hunt
    function() t[14336] = a:New(14336); end, -- Undying Army
    function() t[14335] = a:New(14335); end, -- The Ascended
    function() t[14334] = a:New(14334); end, -- Into the Maw
    function() t[14333] = a:New(14333); end, -- Shadowlands Fisherman
    function() t[14332] = a:New(14332); end, -- Shadowlands Cook
    function() t[14331] = a:New(14331); end, -- Goliath Offline
    function() t[14330] = a:New(14330); end, -- Shadowlands Master of All
    function() t[14329] = a:New(14329); end, -- Working the Afterlife
    function() t[14328] = a:New(14328); end, -- Professional Shadowlands Master
    function() t[14327] = a:New(14327); end, -- I Can See My House From Here
    function() t[14326] = a:New(14326); end, -- Spires of Ascension
    function() t[14325] = a:New(14325); end, -- Mythic: Spires of Ascension
    function() t[14324] = a:New(14324); end, -- Heroic: Spires of Ascension
    function() t[14323] = a:New(14323); end, -- ExSPEARiential
    function() t[14322] = a:New(14322); end, -- Glory of the Shadowlands Hero
    function() t[14320] = a:New(14320); end, -- Surgeon's Supplies
    function() t[14315] = a:New(14315); end, -- Shadowlands Diplomat
    function() t[14314] = a:New(14314); end, -- Treasures of Revendreth
    function() t[14313] = a:New(14313); end, -- Treasures of Ardenweald
    function() t[14312] = a:New(14312); end, -- Treasures of Maldraxxus
    function() t[14311] = a:New(14311); end, -- Treasures of Bastion
    function() t[14310] = a:New(14310); end, -- Adventurer of Revendreth
    function() t[14309] = a:New(14309); end, -- Adventurer of Ardenweald
    function() t[14308] = a:New(14308); end, -- Adventurer of Maldraxxus
    function() t[14307] = a:New(14307); end, -- Adventurer of Bastion
    function() t[14306] = a:New(14306); end, -- Explore Revendreth
    function() t[14305] = a:New(14305); end, -- Explore Maldraxxus
    function() t[14304] = a:New(14304); end, -- Explore Ardenweald
    function() t[14303] = a:New(14303); end, -- Explore Bastion
    function() t[14297] = a:New(14297); end, -- Three Choose One
    function() t[14296] = a:New(14296); end, -- Going Viral
    function() t[14295] = a:New(14295); end, -- Bountiful Harvest
    function() t[14294] = a:New(14294); end, -- Dirtflap's Revenge
    function() t[14293] = a:New(14293); end, -- Blind as a Bat
    function() t[14292] = a:New(14292); end, -- Riding with my Slimes
    function() t[14291] = a:New(14291); end, -- Someone Could Trip on These!
    function() t[14290] = a:New(14290); end, -- I Only Have Eyes For You
    function() t[14289] = a:New(14289); end, -- Kaal-ed Shot
    function() t[14286] = a:New(14286); end, -- Residue Evil
    function() t[14285] = a:New(14285); end, -- Ready for Raiding VII
    function() t[14284] = a:New(14284); end, -- Breaking Bad
    function() t[14283] = a:New(14283); end, -- Heroic Edition: Ensorcelled Everwyrm
    function() t[14281] = a:New(14281); end, -- The Path to Ascension
    function() t[14280] = a:New(14280); end, -- Loremaster of Shadowlands
    function() t[14277] = a:New(14277); end, -- The Accuser's Avowed
    function() t[14276] = a:New(14276); end, -- It's Always Sinny in Revendreth
    function() t[14274] = a:New(14274); end, -- Absolution for All
    function() t[14273] = a:New(14273); end, -- Crypt Kicker
    function() t[14272] = a:New(14272); end, -- Best Bud With Benefits
    function() O(t[14271]); end,
    function() t[14271] = a:New(14271); end, -- WoW's 16th Anniversary
    function() t[14233] = a:New(14233); end, -- Tea Tales
    function() t[14222] = a:New(14222); end, -- Exile's Reach
    function() t[14206] = a:New(14206); end, -- Blade of the Primus
    function() t[14199] = a:New(14199); end, -- Mythic: Sanguine Depths
    function() t[14198] = a:New(14198); end, -- Heroic: Sanguine Depths
    function() t[14197] = a:New(14197); end, -- Sanguine Depths
    function() t[14196] = a:New(14196); end, -- The Waking Dream
    function() t[14195] = a:New(14195); end, -- Gift of Flesh
    function() t[14194] = a:New(14194); end, -- Halls of Devotion
    function() t[14193] = a:New(14193); end, -- Vision of Destiny
    function() t[14191] = a:New(14191, nil, nil, true); end, -- Servant of N'Zoth
    function() t[14188] = a:New(14188, nil, nil, true); end, -- Well Gorged
    function() t[14187] = a:New(14187, nil, nil, true); end, -- Cruisin' for a Brewsin'
    function() t[14186] = a:New(14186, nil, nil, true); end, -- Market Dominance
    function() O(t[14183], "From", "Version", "080300", "Before", "Version", "090001"); end,
    function() t[14183] = a:New(14183); end, -- Conspicuous Consumption
    function() t[14175] = a:New(14175, nil, nil, true); end, -- Master of Deepwind Gorge
    function() t[14173] = a:New(14173); end, -- A Mountain of Mementos
    function() t[14172] = a:New(14172); end, -- A Monumental Amount of Mementos
    function() t[14171] = a:New(14171); end, -- Memento Mori
    function() t[14170] = a:New(14170); end, -- Thanks For The Mementos
    function() t[14169] = a:New(14169); end, -- Symphony of Masks
    function() t[14168] = a:New(14168); end, -- Masked Quartet
    function() t[14167] = a:New(14167); end, -- Masked Trio
    function() t[14166] = a:New(14166); end, -- Masked Duet
    function() t[14165] = a:New(14165); end, -- Masked Soliloquy
    function() t[14164] = a:New(14164); end, -- "Awaken, Ardenweald"
    function() t[14162] = a:New(14162); end, -- Horrific Masquerade
    function() t[14161] = a:New(14161); end, -- All Consuming
    function() t[14160] = a:New(14160); end, -- Rare to Well Done
    function() t[14159] = a:New(14159); end, -- Combating the Corruption
    function() t[14158] = a:New(14158); end, -- It's Not A Tumor!
    function() t[14157] = a:New(14157); end, -- The Corruptor's End
    function() t[14156] = a:New(14156); end, -- The Rajani
    function() t[14155] = a:New(14155); end, -- Uldum Accord
    function() t[14154] = a:New(14154); end, -- Defend the Vale
    function() t[14153] = a:New(14153); end, -- Uldum Under Assault
    function() t[14150] = a:New(14150, f.Alliance, 14149); end, -- Heroic: War for the Shore
    function() t[14149] = a:New(14149, f.Horde, 14150); end, -- Heroic: War for the Shore
    function() t[14148] = a:New(14148); end, -- It's Not A Cult
    function() t[14147] = a:New(14147); end, -- Cleansing Treatment
    function() t[14146] = a:New(14146); end, -- Glory of the Ny'alotha Raider
    function() O(t[14145], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4); end,
    function() t[14145] = a:New(14145); end, -- Battle for Azeroth Keystone Master: Season Four
    function() O(t[14144], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4); end,
    function() t[14144] = a:New(14144); end, -- Battle for Azeroth Keystone Conqueror: Season Four
    function() t[14143] = a:New(14143); end, -- Reeking of Visions
    function() O(t[14140], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4); end,
    function() t[14140] = a:New(14140); end, -- Mad World
    function() t[14139] = a:New(14139); end, -- Total Annihilation
    function() O(t[14069], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4); end,
    function() t[14069] = a:New(14069); end, -- Cutting Edge: N'Zoth the Corruptor
    function() O(t[14068], "From", "Mythic+ Season", 4, "Until", "Mythic+ Season", 4); end,
    function() t[14068] = a:New(14068); end, -- Ahead of the Curve: N'Zoth the Corruptor
    function() t[14067] = a:New(14067); end, -- The Most Horrific Vision of Orgrimmar
    function() t[14066] = a:New(14066); end, -- The Most Horrific Vision of Stormwind
    function() t[14065] = a:New(14065); end, -- The Even More Horrific Vision of Orgrimmar
    function() t[14064] = a:New(14064); end, -- The Even More Horrific Vision of Stormwind
    function() t[14063] = a:New(14063); end, -- Horrific Vision of Orgrimmar
    function() t[14062] = a:New(14062); end, -- Horrific Vision of Stormwind
    function() t[14061] = a:New(14061); end, -- We Have the Technology
    function() t[14060] = a:New(14060); end, -- Unwavering Resolve
    function() T(t[14059], u[1951]); end, -- Corrupted Gladiator's Plate (Gladiator)
    function() T(t[14059], u[1950]); end, -- Corrupted Gladiator's Plate (Elite)
    function() T(t[14059], u[1972]); end, -- Corrupted Gladiator's Plate (Elite)
    function() T(t[14059], u[1957]); end, -- Corrupted Gladiator's Chain (Gladiator)
    function() T(t[14059], u[1956]); end, -- Corrupted Gladiator's Chain (Elite)
    function() T(t[14059], u[1973]); end, -- Corrupted Gladiator's Chain (Elite)
    function() T(t[14059], u[1963]); end, -- Corrupted Gladiator's Leathers (Gladiator)
    function() T(t[14059], u[1962]); end, -- Corrupted Gladiator's Leathers (Elite)
    function() T(t[14059], u[1974]); end, -- Corrupted Gladiator's Leathers (Elite)
    function() T(t[14059], u[1969]); end, -- Corrupted Gladiator's Vestment (Gladiator)
    function() T(t[14059], u[1968]); end, -- Corrupted Gladiator's Vestment (Elite)
    function() T(t[14059], u[1975]); end, -- Corrupted Gladiator's Vestment (Elite)
    function() t[14059] = a:New(14059); end, -- The Eyes Have It
    function() T(t[14058], u[1983]); end, -- Cosmic Aberration's Plate (Raid Finder)
    function() T(t[14058], u[1982]); end, -- Cosmic Aberration's Plate (Normal)
    function() T(t[14058], u[1984]); end, -- Cosmic Aberration's Plate (Heroic)
    function() T(t[14058], u[1985]); end, -- Cosmic Aberration's Plate (Mythic)
    function() T(t[14058], u[1987]); end, -- Lurking Defiler's Scalemail (Raid Finder)
    function() T(t[14058], u[1986]); end, -- Lurking Defiler's Scalemail (Normal)
    function() T(t[14058], u[1988]); end, -- Lurking Defiler's Scalemail (Heroic)
    function() T(t[14058], u[1989]); end, -- Lurking Defiler's Scalemail (Mythic)
    function() T(t[14058], u[1995]); end, -- Oblivion Cultist's Robes (Raid Finder)
    function() T(t[14058], u[1994]); end, -- Oblivion Cultist's Robes (Normal)
    function() T(t[14058], u[1996]); end, -- Oblivion Cultist's Robes (Heroic)
    function() T(t[14058], u[1997]); end, -- Oblivion Cultist's Robes (Mythic)
    function() T(t[14058], u[1991]); end, -- Treacherous Schemer's Leathers (Raid Finder)
    function() T(t[14058], u[1990]); end, -- Treacherous Schemer's Leathers (Normal)
    function() T(t[14058], u[1992]); end, -- Treacherous Schemer's Leathers (Heroic)
    function() T(t[14058], u[1993]); end, -- Treacherous Schemer's Leathers (Mythic)
    function() t[14058] = a:New(14058); end, -- All Eyes On Me
    function() t[14055] = a:New(14055); end, -- Mythic: N'Zoth the Corruptor
    function() t[14054] = a:New(14054); end, -- Mythic: Carapace of N'Zoth
    function() t[14052] = a:New(14052); end, -- "Mythic: Il'gynoth, Corruption Reborn"
    function() t[14051] = a:New(14051); end, -- Mythic: Ra-den the Despoiled
    function() t[14050] = a:New(14050); end, -- Mythic: Vexiona
    function() t[14049] = a:New(14049); end, -- Mythic: Drest'agath
    function() t[14048] = a:New(14048); end, -- Mythic: Shad'har the Insatiable
    function() t[14046] = a:New(14046); end, -- Mythic: The Hivemind
    function() t[14045] = a:New(14045); end, -- Mythic: Dark Inquisitor Xanesh
    function() t[14044] = a:New(14044); end, -- Mythic: The Prophet Skitra
    function() t[14043] = a:New(14043); end, -- Mythic: Maut
    function() t[14041] = a:New(14041); end, -- "Mythic: Wrathion, the Black Emperor"
    function() t[14038] = a:New(14038); end, -- Bloody Mess
    function() t[14037] = a:New(14037); end, -- Phase 3: Prophet
    function() t[14027] = a:New(14027); end, -- Battle for Mrrglroth
    function() t[14026] = a:New(14026); end, -- Temper Tantrum
    function() t[14024] = a:New(14024); end, -- Buzzer Beater
    function() t[14023] = a:New(14023); end, -- Realizing Your Potential
    function() t[14021] = a:New(14021); end, -- The Shadows Revealed
    function() t[14020] = a:New(14020); end, -- Pet Battle Challenge: Blackrock Depths
    function() t[14019] = a:New(14019); end, -- Smoke Test
    function() t[14014] = a:New(14014, f.Alliance); end, -- Heritage of the Mechagnome
    function() t[14013] = a:New(14013, f.Alliance); end, -- Allied Races: Mechagnome
    function() t[14008] = a:New(14008); end, -- Mana Sponge
    function() t[14002] = a:New(14002, f.Horde); end, -- Heritage of the Vulpera
    function() t[13999] = a:New(13999); end, -- How? Isn't it Obelisk?
    function() t[13998] = a:New(13998); end, -- Pure of Heart
    function() t[13994] = a:New(13994); end, -- Through the Depths of Visions
    function() t[13990] = a:New(13990); end, -- "You Can Pet the Dog, But..."
    function() O(t[13989], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13989] = a:New(13989, nil, nil, true); end, -- Elite: Battle for Azeroth Season 4
    function() O(t[13967], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13967] = a:New(13967, nil, nil, true); end, -- Gladiator: Battle for Azeroth Season 4
    function() O(t[13966], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13966] = a:New(13966, f.Alliance, 13965, true); end, -- Hero of the Alliance: Corrupted
    function() O(t[13965], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13965] = a:New(13965, f.Horde, 13966, true); end, -- Hero of the Horde: Corrupted
    function() O(t[13964], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13964] = a:New(13964, nil, nil, true); end, -- Duelist: Battle for Azeroth Season 4
    function() O(t[13963], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13963] = a:New(13963, nil, nil, true); end, -- Rival: Battle for Azeroth Season 4
    function() O(t[13962], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13962] = a:New(13962, nil, nil, true); end, -- Combatant: Battle for Azeroth Season 4
    function() O(t[13959], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13959] = a:New(13959, nil, nil, true); end, -- Challenger: Battle for Azeroth Season 4
    function() O(t[13958], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13958] = a:New(13958, nil, nil, true); end, -- Corrupted Gladiator's Proto-Drake
    function() O(t[13957], "From", "PvP Season", 29, "Until", "PvP Season", 29); end,
    function() t[13957] = a:New(13957, nil, nil, true); end, -- Corrupted Gladiator: Battle for Azeroth Season 4
    function() O(t[13931]); end,
    function() t[13931] = a:New(13931); end, -- "Memories of Fel, Frost and Fire"
    function() t[13930] = a:New(13930, f.Horde, 13928, true); end, -- Alterac Valley of Olde
    function() t[13928] = a:New(13928, f.Alliance, 13930, true); end, -- Alterac Valley of Olde
    function() t[13927] = a:New(13927); end, -- Crashin' Splashin'
    function() t[13925] = a:New(13925, f.Alliance, 13924); end, -- The Fourth War
    function() t[13924] = a:New(13924, f.Horde, 13925); end, -- The Fourth War
    function() O(t[13917]); end,
    function() t[13917] = a:New(13917); end, -- WoW's 15th Anniversary
    function() t[13878] = a:New(13878); end, -- The Master of Revendreth
    function() t[13836] = a:New(13836); end, -- Feline Figurines Found
    function() t[13791] = a:New(13791); end, -- Making the Mount
    function() t[13790] = a:New(13790); end, -- Armed for Action
    function() O(t[13789], "From", "Version", "080200", "Before", "Version", "090001"); end,
    function() t[13789] = a:New(13789); end, -- Hertz Locker
    function() O(t[13785], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3); end,
    function() t[13785] = a:New(13785); end, -- Cutting Edge: Queen Azshara
    function() O(t[13784], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3); end,
    function() t[13784] = a:New(13784); end, -- Ahead of the Curve: Queen Azshara
    function() O(t[13781], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3); end,
    function() t[13781] = a:New(13781); end, -- Battle for Azeroth Keystone Master: Season Three
    function() O(t[13780], "From", "Mythic+ Season", 3, "Until", "Mythic+ Season", 3); end,
    function() t[13780] = a:New(13780); end, -- Battle for Azeroth Keystone Conqueror: Season Three
    function() O(t[13779], "From", "Version", "080200", "Before", "Version", "090001"); end,
    function() t[13779] = a:New(13779); end, -- Phenomenal Cosmic Power
    function() t[13777] = a:New(13777); end, -- My Heart Container is Full
    function() t[13776] = a:New(13776); end, -- Explore Mechagon
    function() t[13775] = a:New(13775, nil, nil, true); end, -- Essence Overload
    function() t[13773] = a:New(13773, nil, nil, true); end, -- Essence Gains
    function() t[13772] = a:New(13772, nil, nil, true); end, -- Essence Essentials
    function() t[13771] = a:New(13771); end, -- Power Is Beautiful
    function() t[13770] = a:New(13770); end, -- Power Creep
    function() t[13769] = a:New(13769); end, -- Power Up
    function() t[13768] = a:New(13768); end, -- The Best of Us
    function() t[13767] = a:New(13767); end, -- Fun Run
    function() t[13766] = a:New(13766); end, -- Malowned
    function() t[13765] = a:New(13765); end, -- Subaquatic Support
    function() t[13764] = a:New(13764); end, -- Puzzle Performer
    function() t[13763] = a:New(13763); end, -- Back to the Depths!
    function() t[13762] = a:New(13762, f.Alliance, 13761); end, -- Aqua Team Murder Force
    function() t[13761] = a:New(13761, f.Horde, 13762); end, -- Aqua Team Murder Force
    function() t[13760] = a:New(13760, f.Alliance, 13757); end, -- Battle-Scarred: Farseer Ori
    function() t[13759] = a:New(13759, f.Alliance, 13756); end, -- Battle-Scarred: Bladesman Inowari
    function() t[13758] = a:New(13758, f.Alliance, 13750); end, -- Battle-Scarred: Hunter Akana
    function() t[13757] = a:New(13757, f.Horde, 13760); end, -- Battle-Scarred: Vim Brineheart
    function() t[13756] = a:New(13756, f.Horde, 13759); end, -- Battle-Scarred: Poen Gillbrack
    function() t[13755] = a:New(13755, f.Alliance, 13752); end, -- Veteran: Farseer Ori
    function() t[13754] = a:New(13754, f.Alliance, 13751); end, -- Veteran: Bladesman Inowari
    function() t[13753] = a:New(13753, f.Alliance, 13749); end, -- Veteran: Hunter Akana
    function() t[13752] = a:New(13752, f.Horde, 13755); end, -- Veteran: Vim Brineheart
    function() t[13751] = a:New(13751, f.Horde, 13754); end, -- Veteran: Poen Gillbrack
    function() t[13750] = a:New(13750, f.Horde, 13758); end, -- Battle-Scarred: Neri Sharpfin
    function() t[13749] = a:New(13749, f.Horde, 13753); end, -- Veteran: Neri Sharpfin
    function() t[13748] = a:New(13748, f.Horde, 13745); end, -- Seasoned: Vim Brineheart
    function() t[13747] = a:New(13747, f.Horde, 13744); end, -- Seasoned: Poen Gillbrack
    function() t[13746] = a:New(13746, f.Horde, 13743); end, -- Seasoned: Neri Sharpfin
    function() t[13745] = a:New(13745, f.Alliance, 13748); end, -- Seasoned: Farseer Ori
    function() t[13744] = a:New(13744, f.Alliance, 13747); end, -- Seasoned: Bladesman Inowari
    function() t[13743] = a:New(13743, f.Alliance, 13746); end, -- Seasoned: Hunter Akana
    function() t[13739] = a:New(13739, f.Alliance, 13738); end, -- Heroic: Tour of War
    function() t[13738] = a:New(13738, f.Horde, 13739); end, -- Heroic: Tour of War
    function() t[13737] = a:New(13737, f.Alliance, 13735); end, -- Heroic: War is Hell
    function() t[13735] = a:New(13735, f.Horde, 13737); end, -- Heroic: War is Hell
    function() t[13733] = a:New(13733); end, -- Mythic: Queen Azshara
    function() t[13732] = a:New(13732); end, -- Mythic: Za'qul
    function() t[13731] = a:New(13731); end, -- Mythic: The Queen's Court
    function() t[13730] = a:New(13730); end, -- Mythic: Orgozoa
    function() t[13729] = a:New(13729); end, -- Mythic: Lady Ashvane
    function() t[13728] = a:New(13728); end, -- Mythic: Blackwater Behemoth
    function() t[13727] = a:New(13727); end, -- Mythic: Radiance of Azshara
    function() t[13726] = a:New(13726); end, -- Mythic: Abyssal Commander Sivara
    function() t[13725] = a:New(13725); end, -- The Circle of Stars
    function() t[13724] = a:New(13724); end, -- A Smack of Jellyfish
    function() t[13723] = a:New(13723); end, -- "M.C., Hammered"
    function() t[13722] = a:New(13722); end, -- Terror of the Tadpoles
    function() t[13720] = a:New(13720, nil, nil, true); end, -- Supplying the Assassins
    function() t[13719] = a:New(13719); end, -- Depths of the Devoted
    function() t[13718] = a:New(13718); end, -- The Grand Reception
    function() t[13716] = a:New(13716); end, -- Lactose Intolerant
    function() t[13715] = a:New(13715); end, -- From The Belly Of The Jelly
    function() t[13713] = a:New(13713); end, -- Nothing To Scry About
    function() t[13712] = a:New(13712); end, -- Explore Nazjatar
    function() t[13711] = a:New(13711); end, -- A Fistful of Manapearls
    function() t[13710] = a:New(13710, f.Alliance, 13709); end, -- Sunken Ambitions
    function() t[13709] = a:New(13709, f.Horde, 13710); end, -- Unfathomable
    function() t[13708] = a:New(13708); end, -- Most Minis Wins
    function() t[13707] = a:New(13707); end, -- Mrrl's Secret Stash
    function() t[13706] = a:New(13706); end, -- Stay Positive
    function() t[13704] = a:New(13704, f.Alliance, 13645); end, -- Nautical Battlefield Training
    function() t[13703] = a:New(13703, nil, nil, true); end, -- Battlefield Master
    function() t[13702] = a:New(13702, nil, nil, true); end, -- Battlefield Tactician
    function() t[13701] = a:New(13701, nil, nil, true); end, -- Battlefield Brawler
    function() t[13700] = a:New(13700, f.Horde); end, -- The Mechagonian Threat
    function() t[13699] = a:New(13699); end, -- Periodic Destruction
    function() t[13698] = a:New(13698); end, -- Clean Up On Aisle Mechagon
    function() t[13696] = a:New(13696); end, -- Scrappy's Best Friend
    function() t[13695] = a:New(13695); end, -- Team Aquashock
    function() t[13694] = a:New(13694); end, -- Nazjatari Safari
    function() t[13693] = a:New(13693); end, -- Mecha-Safari
    function() t[13692] = a:New(13692); end, -- Give Me the Biggest Bag You've Got
    function() t[13691] = a:New(13691); end, -- I Thought You Said They'd Be Rare?
    function() t[13690] = a:New(13690); end, -- Nazjatarget Eliminated
    function() t[13687] = a:New(13687); end, -- Glory of the Eternal Raider
    function() t[13686] = a:New(13686); end, -- Junkyard Melomaniac
    function() t[13684] = a:New(13684); end, -- You and What Army?
    function() O(t[13676], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13676] = a:New(13676, nil, nil, true); end, -- Elite: Battle for Azeroth Season 3
    function() O(t[13647], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13647] = a:New(13647, nil, nil, true); end, -- Gladiator: Battle for Azeroth Season 3
    function() t[13645] = a:New(13645, f.Horde, 13704); end, -- Nautical Battlefield Training
    function() O(t[13644], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13644] = a:New(13644, f.Horde, 13643, true); end, -- Hero of the Horde: Notorious
    function() O(t[13643], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13643] = a:New(13643, f.Alliance, 13644, true); end, -- Hero of the Alliance: Notorious
    function() O(t[13642], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13642] = a:New(13642, nil, nil, true); end, -- Duelist: Battle for Azeroth Season 3
    function() O(t[13641], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13641] = a:New(13641, nil, nil, true); end, -- Rival: Battle for Azeroth Season 3
    function() O(t[13639], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13639] = a:New(13639, nil, nil, true); end, -- Combatant: Battle for Azeroth Season 3
    function() t[13638] = a:New(13638); end, -- Undersea Usurper
    function() t[13635] = a:New(13635); end, -- Tour of the Depths
    function() O(t[13634], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13634] = a:New(13634, nil, nil, true); end, -- Challenger: Battle for Azeroth Season 3
    function() t[13633] = a:New(13633); end, -- If It Pleases the Court
    function() O(t[13632], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13632] = a:New(13632, nil, nil, true); end, -- Notorious Gladiator's Proto-Drake
    function() O(t[13630], "From", "PvP Season", 28, "Until", "PvP Season", 28); end,
    function() t[13630] = a:New(13630, nil, nil, true); end, -- Notorious Gladiator: Battle for Azeroth Season 3
    function() t[13629] = a:New(13629); end, -- Simple Geometry
    function() t[13628] = a:New(13628); end, -- Intro to Marine Biology
    function() t[13627] = a:New(13627); end, -- Pet Battle Challenge: Stratholme
    function() t[13626] = a:New(13626); end, -- Nautical Nuisances of Nazjatar
    function() t[13625] = a:New(13625); end, -- Mighty Minions of Mechagon
    function() t[13624] = a:New(13624); end, -- Keep DPS-ing and Nobody Explodes
    function() t[13623] = a:New(13623, nil, nil, true); end, -- Fighting on Two Fronts
    function() T(t[13585], u[1869]); end, -- Notorious Aspirant's Plate (Aspirant)
    function() T(t[13585], u[1864]); end, -- Notorious Gladiator's Plate (Gladiator)
    function() T(t[13585], u[1865]); end, -- Notorious Gladiator's Plate (Elite)
    function() T(t[13585], u[1863]); end, -- Notorious Aspirant's Chain (Aspirant)
    function() T(t[13585], u[1858]); end, -- Notorious Gladiator's Chain (Gladiator)
    function() T(t[13585], u[1859]); end, -- Notorious Gladiator's Chain (Elite)
    function() T(t[13585], u[1851]); end, -- Notorious Aspirant's Vestment (Aspirant)
    function() T(t[13585], u[1846]); end, -- Notorious Gladiator's Vestment (Gladiator)
    function() T(t[13585], u[1847]); end, -- Notorious Gladiator's Vestment (Elite)
    function() T(t[13585], u[1857]); end, -- Notorious Aspirant's Leathers (Aspirant)
    function() T(t[13585], u[1852]); end, -- Notorious Gladiator's Leathers (Gladiator)
    function() T(t[13585], u[1853]); end, -- Notorious Gladiator's Leathers (Elite)
    function() T(t[13585], u[1874]); end, -- Notorious Aspirant's Plate (Aspirant)
    function() T(t[13585], u[1879]); end, -- Notorious Gladiator's Plate (Gladiator)
    function() T(t[13585], u[1878]); end, -- Notorious Gladiator's Plate (Elite)
    function() T(t[13585], u[1880]); end, -- Notorious Aspirant's Chain (Aspirant)
    function() T(t[13585], u[1885]); end, -- Notorious Gladiator's Chain (Gladiator)
    function() T(t[13585], u[1884]); end, -- Notorious Gladiator's Chain (Elite)
    function() T(t[13585], u[1892]); end, -- Notorious Aspirant's Vestment (Aspirant)
    function() T(t[13585], u[1897]); end, -- Notorious Gladiator's Vestment (Gladiator)
    function() T(t[13585], u[1896]); end, -- Notorious Gladiator's Vestment (Elite)
    function() T(t[13585], u[1886]); end, -- Notorious Aspirant's Leathers (Aspirant)
    function() T(t[13585], u[1891]); end, -- Notorious Gladiator's Leathers (Gladiator)
    function() T(t[13585], u[1890]); end, -- Notorious Gladiator's Leathers (Elite)
    function() t[13585] = a:New(13585); end, -- "Never Lose, Never Choose To"
    function() t[13584] = a:New(13584, nil, nil, true); end, -- Snowblossom Scrapper
    function() t[13583] = a:New(13583); end, -- Mythic: Snowblossom Village
    function() t[13582] = a:New(13582); end, -- Heroic: Snowblossom Village
    function() t[13581] = a:New(13581); end, -- Snowblossom Village
    function() t[13580] = a:New(13580, nil, nil, true); end, -- Crestfallen
    function() t[13579] = a:New(13579); end, -- Mythic: Crestfall
    function() t[13578] = a:New(13578); end, -- Heroic: Crestfall
    function() t[13577] = a:New(13577); end, -- Crestfall
    function() t[13573] = a:New(13573, f.Horde); end, -- How to Ptrain Your Pterrordax
    function() t[13572] = a:New(13572); end, -- The Heart Forge
    function() T(t[13571], u[1842]); end, -- Naga Lord's Warplate (Raid Finder)
    function() T(t[13571], u[1830]); end, -- Naga Lord's Warplate (Normal)
    function() T(t[13571], u[1834]); end, -- Naga Lord's Warplate (Heroic)
    function() T(t[13571], u[1838]); end, -- Naga Lord's Warplate (Mythic)
    function() T(t[13571], u[1843]); end, -- Queen's Guard Scalemail (Raid Finder)
    function() T(t[13571], u[1831]); end, -- Queen's Guard Scalemail (Normal)
    function() T(t[13571], u[1835]); end, -- Queen's Guard Scalemail (Heroic)
    function() T(t[13571], u[1839]); end, -- Queen's Guard Scalemail (Mythic)
    function() T(t[13571], u[1845]); end, -- Frilled Harbinger's Vestments (Raid Finder)
    function() T(t[13571], u[1833]); end, -- Frilled Harbinger's Vestments (Normal)
    function() T(t[13571], u[1837]); end, -- Frilled Harbinger's Vestments (Heroic)
    function() T(t[13571], u[1841]); end, -- Frilled Harbinger's Vestments (Mythic)
    function() T(t[13571], u[1844]); end, -- Razorfin Regalia (Raid Finder)
    function() T(t[13571], u[1832]); end, -- Razorfin Regalia (Normal)
    function() T(t[13571], u[1836]); end, -- Razorfin Regalia (Heroic)
    function() T(t[13571], u[1840]); end, -- Razorfin Regalia (Mythic)
    function() t[13571] = a:New(13571); end, -- Under the Seams
    function() t[13570] = a:New(13570, nil, nil, true); end, -- Tour of Duty: Mechagon
    function() t[13569] = a:New(13569, nil, nil, true); end, -- Tour of Duty: Nazjatar
    function() t[13568] = a:New(13568, nil, nil, true); end, -- For Nazjatar!
    function() t[13559] = a:New(13559, f.Horde); end, -- The Unshackled
    function() t[13558] = a:New(13558, f.Alliance); end, -- Waveblade Ankoan
    function() t[13557] = a:New(13557); end, -- Rustbolt Rebellion
    function() t[13556] = a:New(13556); end, -- Outside Influences
    function() t[13555] = a:New(13555); end, -- Junkyard Tinkmaster
    function() t[13553] = a:New(13553, f.Alliance); end, -- The Mechagonian Threat
    function() t[13549] = a:New(13549); end, -- Trove Tracker
    function() t[13545] = a:New(13545); end, -- "Go Ahead, Make My Daisy"
    function() t[13542] = a:New(13542, f.Horde); end, -- How to Train Your Direhorn
    function() t[13541] = a:New(13541); end, -- Mecha-Done
    function() t[13517] = a:New(13517); end, -- Two Sides to Every Tale
    function() t[13516] = a:New(13516); end, -- Massive Tool
    function() t[13513] = a:New(13513); end, -- Available in Eight Colors
    function() t[13512] = a:New(13512); end, -- Master Calligrapher
    function() t[13506] = a:New(13506); end, -- A Good Eye-dea
    function() t[13504] = a:New(13504, f.Alliance); end, -- Heritage of the Kul Tirans
    function() t[13503] = a:New(13503, f.Horde); end, -- Heritage of the Zandalari
    function() t[13502] = a:New(13502); end, -- Secret Fish and Where to Find Them
    function() t[13501] = a:New(13501); end, -- Gotta Bounce
    function() t[13489] = a:New(13489); end, -- Secret Fish of Mechagon
    function() t[13482] = a:New(13482); end, -- Head Financier of Mechagon
    function() t[13479] = a:New(13479); end, -- Junkyard Architect
    function() t[13478] = a:New(13478); end, -- Junkyard Collector
    function() t[13477] = a:New(13477); end, -- Junkyard Apprentice
    function() t[13476] = a:New(13476); end, -- Junkyard Tinkerer
    function() t[13475] = a:New(13475); end, -- Junkyard Scavenger
    function() t[13474] = a:New(13474); end, -- Junkyard Machinist
    function() t[13473] = a:New(13473); end, -- Diversified Investments
    function() t[13472] = a:New(13472); end, -- Deep Pockets
    function() t[13470] = a:New(13470); end, -- Rest In Pistons
    function() t[13469] = a:New(13469); end, -- Raiding with Leashes VI: Pets of Pandaria
    function() t[13467] = a:New(13467, f.Alliance, 13466); end, -- Tides of Vengeance
    function() t[13466] = a:New(13466, f.Horde, 13467); end, -- Tides of Vengeance
    function() O(t[13465], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[13465] = a:New(13465, nil, nil, true); end, -- Elite: Battle for Azeroth Season 1
    function() O(t[13451], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13451] = a:New(13451, nil, nil, true); end, -- Elite: Battle for Azeroth Season 2
    function() O(t[13450], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[13450] = a:New(13450, nil, nil, true); end, -- Fierce Gladiator's Storm Dragon
    function() O(t[13449], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13449] = a:New(13449); end, -- Battle for Azeroth Keystone Master: Season Two
    function() O(t[13448], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13448] = a:New(13448); end, -- Battle for Azeroth Keystone Conqueror: Season Two
    function() t[13441] = a:New(13441, f.Horde, 13440); end, -- Pushing the Payload
    function() t[13440] = a:New(13440, f.Alliance, 13441); end, -- Pushing the Payload
    function() t[13439] = a:New(13439, f.Alliance, 13438, true); end, -- Boxing Match
    function() t[13438] = a:New(13438, f.Horde, 13439, true); end, -- Boxing Match
    function() t[13437] = a:New(13437, f.Horde); end, -- Scavenge like a Vulpera
    function() t[13435] = a:New(13435, f.Horde); end, -- Doomsoul Surprise
    function() T(t[13433], u[1776]); end, -- Sinister Aspirant's Plate (Aspirant)
    function() T(t[13433], u[1775]); end, -- Wardenguard's Battleplate (Warfront)
    function() T(t[13433], u[1781]); end, -- Sinister Gladiator's Plate (Gladiator)
    function() T(t[13433], u[1780]); end, -- Sinister Gladiator's Plate (Elite)
    function() T(t[13433], u[1783]); end, -- Sinister Aspirant's Chain (Aspirant)
    function() T(t[13433], u[1782]); end, -- Kaldorei Archer's Chainmail (Warfront)
    function() T(t[13433], u[1788]); end, -- Sinister Gladiator's Chain (Gladiator)
    function() T(t[13433], u[1787]); end, -- Sinister Gladiator's Chain (Elite)
    function() T(t[13433], u[1797]); end, -- Sinister Aspirant's Vestment (Aspirant)
    function() T(t[13433], u[1796]); end, -- Moonpriest's Vestments (Warfront)
    function() T(t[13433], u[1802]); end, -- Sinister Gladiator's Vestment (Gladiator)
    function() T(t[13433], u[1801]); end, -- Sinister Gladiator's Vestment (Elite)
    function() T(t[13433], u[1790]); end, -- Sinister Aspirant's Leathers (Aspirant)
    function() T(t[13433], u[1789]); end, -- Darkwood Sentinel's Guise (Warfront)
    function() T(t[13433], u[1795]); end, -- Sinister Gladiator's Leathers (Gladiator)
    function() T(t[13433], u[1794]); end, -- Sinister Gladiator's Leathers (Elite)
    function() T(t[13433], u[1746]); end, -- Sinister Aspirant's Plate (Aspirant)
    function() T(t[13433], u[1745]); end, -- Deathguard's Battleplate (Warfront)
    function() T(t[13433], u[1751]); end, -- Sinister Gladiator's Plate (Gladiator)
    function() T(t[13433], u[1750]); end, -- Sinister Gladiator's Plate (Elite)
    function() T(t[13433], u[1753]); end, -- Sinister Aspirant's Chain (Aspirant)
    function() T(t[13433], u[1752]); end, -- Blightguard's Chains (Warfront)
    function() T(t[13433], u[1758]); end, -- Sinister Gladiator's Chain (Gladiator)
    function() T(t[13433], u[1757]); end, -- Sinister Gladiator's Chain (Elite)
    function() T(t[13433], u[1767]); end, -- Sinister Aspirant's Vestment (Aspirant)
    function() T(t[13433], u[1766]); end, -- Plaguebringer's Raiment (Warfront)
    function() T(t[13433], u[1772]); end, -- Sinister Gladiator's Vestment (Gladiator)
    function() T(t[13433], u[1771]); end, -- Sinister Gladiator's Vestment (Elite)
    function() T(t[13433], u[1760]); end, -- Sinister Aspirant's Leathers (Aspirant)
    function() T(t[13433], u[1759]); end, -- Deathstalker's Guise (Warfront)
    function() T(t[13433], u[1765]); end, -- Sinister Gladiator's Leathers (Gladiator)
    function() T(t[13433], u[1764]); end, -- Sinister Gladiator's Leathers (Elite)
    function() t[13433] = a:New(13433); end, -- "Tall, Dark, and Sinister"
    function() t[13431] = a:New(13431); end, -- Hidden Dragon
    function() t[13430] = a:New(13430); end, -- De Lurker Be'loa
    function() t[13429] = a:New(13429, nil, nil, true); end, -- Azerfighter
    function() t[13426] = a:New(13426, f.Alliance); end, -- Come On and Slam
    function() t[13425] = a:New(13425); end, -- "We Got Spirit, How About You?"
    function() O(t[13419], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13419] = a:New(13419); end, -- "Cutting Edge: Uu'nat, Harbinger of the Void"
    function() O(t[13418], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13418] = a:New(13418); end, -- "Ahead of the Curve: Uu'nat, Harbinger of the Void"
    function() t[13417] = a:New(13417); end, -- "Mythic: Uu'nat, Harbinger of the Void"
    function() t[13416] = a:New(13416); end, -- Mythic: The Restless Cabal
    function() t[13414] = a:New(13414); end, -- Crucible of Storms
    function() t[13410] = a:New(13410); end, -- Snow Fun Allowed
    function() t[13403] = a:New(13403, f.Horde, 13402, true); end, -- Frontline Slayer
    function() t[13402] = a:New(13402, f.Alliance, 13403, true); end, -- Frontline Slayer
    function() t[13401] = a:New(13401); end, -- I Got Next!
    function() t[13400] = a:New(13400, nil, nil, true); end, -- Havenswood Hero
    function() t[13399] = a:New(13399, nil, nil, true); end, -- Jorundall Justice
    function() t[13398] = a:New(13398); end, -- Mythic: Havenswood
    function() t[13397] = a:New(13397); end, -- Heroic: Havenswood
    function() t[13396] = a:New(13396); end, -- Havenswood
    function() t[13395] = a:New(13395); end, -- Mythic: Jorundall
    function() t[13394] = a:New(13394); end, -- Heroic: Jorundall
    function() t[13389] = a:New(13389); end, -- Jorundall
    function() t[13388] = a:New(13388, f.Horde, 13387, true); end, -- Frontline Veteran
    function() t[13387] = a:New(13387, f.Alliance, 13388, true); end, -- Frontline Veteran
    function() T(t[13385], u[1819]); end, -- Gravelord's Direplate (Raid Finder)
    function() T(t[13385], u[1818]); end, -- Gravelord's Direplate (Normal)
    function() T(t[13385], u[1820]); end, -- Gravelord's Direplate (Heroic)
    function() T(t[13385], u[1821]); end, -- Gravelord's Direplate (Mythic)
    function() T(t[13385], u[1815]); end, -- Death-Devourer Vestments (Raid Finder)
    function() T(t[13385], u[1814]); end, -- Death-Devourer Vestments (Normal)
    function() T(t[13385], u[1816]); end, -- Death-Devourer Vestments (Heroic)
    function() T(t[13385], u[1817]); end, -- Death-Devourer Vestments (Mythic)
    function() T(t[13385], u[1807]); end, -- Soul Reaper's Raiment (Raid Finder)
    function() T(t[13385], u[1806]); end, -- Soul Reaper's Raiment (Normal)
    function() T(t[13385], u[1808]); end, -- Soul Reaper's Raiment (Heroic)
    function() T(t[13385], u[1809]); end, -- Soul Reaper's Raiment (Mythic)
    function() T(t[13385], u[1811]); end, -- Boneblade Battlegear (Raid Finder)
    function() T(t[13385], u[1810]); end, -- Boneblade Battlegear (Normal)
    function() T(t[13385], u[1812]); end, -- Boneblade Battlegear (Heroic)
    function() T(t[13385], u[1813]); end, -- Boneblade Battlegear (Mythic)
    function() t[13385] = a:New(13385); end, -- Daz'aling Attire
    function() t[13384] = a:New(13384, f.Alliance); end, -- Kul Tirans Don't Look at Explosions
    function() t[13383] = a:New(13383); end, -- Barrel of Monkeys
    function() t[13345] = a:New(13345); end, -- Praise the Sunflower
    function() t[13343] = a:New(13343, f.Alliance, 13342); end, -- Extinguishing Zandalar
    function() t[13342] = a:New(13342, f.Horde, 13343); end, -- Extinguishing Kul Tiras
    function() t[13341] = a:New(13341, f.Alliance, 13340); end, -- Flame Warden of Kul Tiras
    function() t[13340] = a:New(13340, f.Horde, 13341); end, -- Flame Keeper of Zandalar
    function() t[13325] = a:New(13325); end, -- Walk the Dinosaur
    function() O(t[13323], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13323] = a:New(13323); end, -- Cutting Edge: Lady Jaina Proudmoore
    function() O(t[13322], "From", "Mythic+ Season", 2, "Until", "Mythic+ Season", 2); end,
    function() t[13322] = a:New(13322); end, -- Ahead of the Curve: Lady Jaina Proudmoore
    function() t[13317] = a:New(13317, nil, nil, true); end, -- Supplied and Ready
    function() t[13316] = a:New(13316); end, -- Can I Get a Hek Hek Hek Yeah?
    function() t[13315] = a:New(13315); end, -- Glory of the Dazar'alor Raider
    function() t[13314] = a:New(13314); end, -- Mythic: Lady Jaina Proudmoore
    function() t[13313] = a:New(13313); end, -- Mythic: Stormwall Blockade
    function() t[13312] = a:New(13312); end, -- Mythic: Mekkatorque
    function() t[13311] = a:New(13311); end, -- Mythic: King Rastakhan
    function() t[13310] = a:New(13310, f.Alliance, 13309); end, -- By Nature's Call
    function() t[13309] = a:New(13309, f.Horde, 13310); end, -- Deforester
    function() t[13308] = a:New(13308, f.Alliance, 13307); end, -- Recruitment Officer
    function() t[13307] = a:New(13307, f.Horde, 13308); end, -- Recruitment Officer
    function() t[13306] = a:New(13306, f.Horde, 13305); end, -- Night Moves
    function() t[13305] = a:New(13305, f.Alliance, 13306); end, -- Night Moves
    function() t[13302] = a:New(13302, f.Alliance, 13301); end, -- Under Cover of Darkness
    function() t[13301] = a:New(13301, f.Horde, 13302); end, -- Under Cover of Darkness
    function() t[13300] = a:New(13300); end, -- Mythic: Conclave of the Chosen
    function() t[13299] = a:New(13299); end, -- Mythic: Opulence
    function() t[13298] = a:New(13298, f.Alliance, 13295); end, -- Mythic: Jadefire Masters
    function() t[13297] = a:New(13297, f.Alliance, 13296); end, -- War for the Shore
    function() t[13296] = a:New(13296, f.Horde, 13297); end, -- War for the Shore
    function() t[13295] = a:New(13295, f.Horde, 13298); end, -- Mythic: Jadefire Masters
    function() t[13294] = a:New(13294, f.Horde, 12593); end, -- Loremaster of Zandalar
    function() t[13293] = a:New(13293); end, -- Mythic: Grong
    function() t[13292] = a:New(13292); end, -- Mythic: Champion of the Light
    function() t[13291] = a:New(13291, f.Horde, 13288); end, -- Victory or Death
    function() t[13290] = a:New(13290, f.Horde, 13287); end, -- Death's Bargain
    function() t[13289] = a:New(13289, f.Horde, 13286); end, -- Defense of Dazar'alor
    function() t[13288] = a:New(13288, f.Alliance, 13291); end, -- Might of the Alliance
    function() t[13287] = a:New(13287, f.Alliance, 13290); end, -- Empire's Fall
    function() t[13286] = a:New(13286, f.Alliance, 13289); end, -- Siege of Dazar'alor
    function() t[13285] = a:New(13285, f.Alliance); end, -- Upright Citizens
    function() t[13284] = a:New(13284, f.Horde, 13283); end, -- Frontline Warrior
    function() t[13283] = a:New(13283, f.Alliance, 13284); end, -- Frontline Warrior
    function() t[13281] = a:New(13281); end, -- Human Resources
    function() t[13280] = a:New(13280); end, -- Hobbyist Aquarist
    function() t[13279] = a:New(13279); end, -- Family Battler
    function() t[13278] = a:New(13278); end, -- Not Quite Dead Yet
    function() t[13277] = a:New(13277); end, -- Machine Learning
    function() t[13275] = a:New(13275); end, -- Magician's Secrets
    function() t[13274] = a:New(13274); end, -- Fun With Flying
    function() t[13273] = a:New(13273); end, -- Element of Success
    function() t[13272] = a:New(13272); end, -- Dragons Make Everything Better
    function() t[13271] = a:New(13271); end, -- Critters With Huge Teeth
    function() t[13270] = a:New(13270); end, -- Beast Mode
    function() t[13269] = a:New(13269); end, -- Pet Battle Challenge: Gnomeregan
    function() t[13263] = a:New(13263, f.Horde, 13251); end, -- The Shadow Hunter
    function() t[13251] = a:New(13251, f.Alliance, 13263); end, -- In Teldrassil's Shadow
    function() t[13250] = a:New(13250); end, -- "Battle for Azeroth Pathfinder, Part Two"
    function() O(t[13212], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13212] = a:New(13212, nil, nil, true); end, -- Gladiator: Battle for Azeroth Season 2
    function() O(t[13211], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13211] = a:New(13211, f.Horde, 13210, true); end, -- Hero of the Horde: Sinister
    function() O(t[13210], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13210] = a:New(13210, f.Alliance, 13211, true); end, -- Hero of the Alliance: Sinister
    function() O(t[13209], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13209] = a:New(13209, nil, nil, true); end, -- Duelist: Battle for Azeroth Season 2
    function() t[13206] = a:New(13206, f.Horde); end, -- Allied Races: Vulpera
    function() O(t[13205], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13205] = a:New(13205, nil, nil, true); end, -- Rival: Battle for Azeroth Season 2
    function() O(t[13204], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13204] = a:New(13204, nil, nil, true); end, -- Combatant: Battle for Azeroth Season 2
    function() O(t[13203], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13203] = a:New(13203, nil, nil, true); end, -- Challenger: Battle for Azeroth Season 2
    function() O(t[13202], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13202] = a:New(13202, nil, nil, true); end, -- Sinister Gladiator's Proto-Drake
    function() O(t[13200], "From", "PvP Season", 27, "Until", "PvP Season", 27); end,
    function() t[13200] = a:New(13200, nil, nil, true); end, -- Sinister Gladiator: Battle for Azeroth Season 2
    function() O(t[13199], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[13199] = a:New(13199, nil, nil, true); end, -- Combatant: Battle for Azeroth Season 1
    function() t[13196] = a:New(13196); end, -- Meat Marauder
    function() O(t[13194], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13194] = a:New(13194); end, -- I Am Thrall's Complete Lack Of Surprise
    function() O(t[13192], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13192] = a:New(13192, f.Horde, 13191); end, -- Brawler for Azeroth
    function() O(t[13191], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13191] = a:New(13191, f.Alliance, 13192); end, -- Brawler for Azeroth
    function() O(t[13190], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13190] = a:New(13190, f.Horde, 13189); end, -- The Second Rule of Brawler's Guild
    function() O(t[13189], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13189] = a:New(13189, f.Alliance, 13190); end, -- The Second Rule of Brawler's Guild
    function() O(t[13188], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13188] = a:New(13188, f.Horde, 13186); end, -- You Are Not Your $#*@! Legplates
    function() O(t[13186], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[13186] = a:New(13186, f.Alliance, 13188); end, -- You Are Not Your $#*@! Legplates
    function() t[13163] = a:New(13163, f.Alliance); end, -- Allied Races: Kul Tiran
    function() t[13161] = a:New(13161, f.Horde); end, -- Allied Races: Zandalari Troll
    function() t[13144] = a:New(13144); end, -- Wide World of Quests
    function() t[13142] = a:New(13142); end, -- Archipelago Explorer
    function() t[13141] = a:New(13141, nil, nil, true); end, -- Island Slayer
    function() t[13138] = a:New(13138); end, -- Flying Colors
    function() t[13135] = a:New(13135, f.Horde, 13133); end, -- Team Deathmatch
    function() t[13134] = a:New(13134, nil, nil, true); end, -- Expedition Leader
    function() t[13133] = a:New(13133, f.Alliance, 13135); end, -- Team Deathmatch
    function() t[13132] = a:New(13132); end, -- Helping Hand
    function() t[13129] = a:New(13129, nil, nil, true); end, -- Sucker Punch
    function() t[13128] = a:New(13128); end, -- I'm Here for the Pets
    function() t[13127] = a:New(13127); end, -- Tell Me A Tale
    function() t[13126] = a:New(13126); end, -- Give Me The Energy
    function() t[13125] = a:New(13125); end, -- Azerite Admiral
    function() t[13124] = a:New(13124); end, -- Metal Detector
    function() t[13123] = a:New(13123); end, -- My Dubs
    function() t[13122] = a:New(13122); end, -- Island Conqueror
    function() t[13121] = a:New(13121, nil, nil, true); end, -- Notorious
    function() t[13120] = a:New(13120, nil, nil, true); end, -- Blood in the Water
    function() t[13119] = a:New(13119); end, -- Whispering Reef
    function() t[13118] = a:New(13118); end, -- Heroic: Whispering Reef
    function() t[13116] = a:New(13116); end, -- Mythic: Whispering Reef
    function() t[13115] = a:New(13115, nil, nil, true); end, -- Reef Madness
    function() t[13114] = a:New(13114, nil, nil, true); end, -- War for the Wilds
    function() t[13113] = a:New(13113); end, -- Mythic: Verdant Wilds
    function() t[13112] = a:New(13112); end, -- Heroic: Verdant Wilds
    function() t[13111] = a:New(13111); end, -- Verdant Wilds
    function() t[13110] = a:New(13110, nil, nil, true); end, -- Skittering Smashed
    function() t[13109] = a:New(13109); end, -- Mythic: Skittering Hollow
    function() t[13108] = a:New(13108); end, -- Heroic: Skittering Hollow
    function() t[13107] = a:New(13107); end, -- Skittering Hollow
    function() t[13106] = a:New(13106, nil, nil, true); end, -- Mire Marauder
    function() t[13105] = a:New(13105); end, -- Mythic: Rotting Mire
    function() t[13104] = a:New(13104); end, -- Heroic: Rotting Mire
    function() t[13103] = a:New(13103); end, -- Rotting Mire
    function() t[13102] = a:New(13102, nil, nil, true); end, -- Clash at the Cay
    function() t[13101] = a:New(13101); end, -- Mythic: Molten Cay
    function() t[13100] = a:New(13100); end, -- Heroic: Molten Cay
    function() t[13099] = a:New(13099); end, -- Molten Cay
    function() t[13098] = a:New(13098, nil, nil, true); end, -- Bane of the Chain
    function() t[13097] = a:New(13097); end, -- Mythic: Dread Chain
    function() t[13096] = a:New(13096); end, -- Heroic: Dread Chain
    function() t[13095] = a:New(13095); end, -- Dread Chain
    function() t[13094] = a:New(13094); end, -- Cursed Game Hunter
    function() O(t[13093], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[13093] = a:New(13093, nil, nil, true); end, -- Dread Gladiator's Proto-Drake
    function() t[13087] = a:New(13087); end, -- Sausage Sampler
    function() t[13083] = a:New(13083); end, -- "Better, Faster, Stronger"
    function() t[13082] = a:New(13082, f.Alliance); end, -- Everything Old Is New Again
    function() O(t[13080], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1); end,
    function() t[13080] = a:New(13080); end, -- Battle for Azeroth Keystone Master: Season One
    function() O(t[13079], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1); end,
    function() t[13079] = a:New(13079); end, -- Battle for Azeroth Keystone Conqueror: Season One
    function() O(t[13078], "Once"); end,
    function() t[13078] = a:New(13078, nil, nil, nil, true); end, -- Realm First! Battle for Azeroth Keystone Master
    function() t[13077] = a:New(13077, f.Horde); end, -- Heritage of the Mag'har
    function() t[13076] = a:New(13076, f.Alliance); end, -- Heritage of the Dark Iron
    function() t[13075] = a:New(13075); end, -- Battle for Azeroth Keymaster
    function() t[13064] = a:New(13064); end, -- "Drust the Facts, Ma'am"
    function() t[13062] = a:New(13062, f.Alliance); end, -- Let's Bee Friends
    function() t[13061] = a:New(13061); end, -- Three Sheets to the Wind
    function() t[13060] = a:New(13060, f.Alliance); end, -- Kul Runnings
    function() t[13059] = a:New(13059, f.Alliance); end, -- Drag Race
    function() t[13058] = a:New(13058); end, -- Kul Tiran Up the Dance Floor
    function() t[13057] = a:New(13057); end, -- Shanty Raid
    function() t[13056] = a:New(13056, f.Horde, 12741); end, -- Giving a Scrap
    function() t[13054] = a:New(13054); end, -- Sabertron Assemble
    function() t[13053] = a:New(13053, f.Alliance); end, -- Deadliest Cache
    function() t[13051] = a:New(13051); end, -- Legends of the Tidesages
    function() t[13050] = a:New(13050); end, -- Bless the Rains Down in Freehold
    function() t[13049] = a:New(13049, f.Alliance); end, -- The Long Con
    function() t[13048] = a:New(13048); end, -- Life Finds a Way... To Die!
    function() t[13047] = a:New(13047); end, -- Clever Use of Mechanical Explosives
    function() t[13046] = a:New(13046); end, -- These Hills Sing
    function() t[13045] = a:New(13045); end, -- Every Day I'm Truffling
    function() t[13042] = a:New(13042); end, -- About To Break
    function() t[13041] = a:New(13041, f.Horde); end, -- "Hungry, Hungry Ranishu"
    function() t[13039] = a:New(13039, f.Horde); end, -- Paku'ai
    function() t[13038] = a:New(13038, f.Horde); end, -- Raptari Rider
    function() t[13036] = a:New(13036); end, -- A Loa of a Tale
    function() t[13035] = a:New(13035); end, -- By de Power of de Loa!
    function() t[13030] = a:New(13030, f.Horde); end, -- How to Ptrain Your Pterrordax
    function() t[13029] = a:New(13029); end, -- Eating Out of the Palm of My Tiny Hand
    function() t[13028] = a:New(13028); end, -- Hoppin' Sad
    function() t[13027] = a:New(13027); end, -- Mushroom Harvest
    function() t[13026] = a:New(13026, f.Alliance); end, -- 7th Legion Spycatcher
    function() t[13025] = a:New(13025, f.Horde); end, -- Zandalari Spycatcher
    function() t[13024] = a:New(13024); end, -- "Carved in Stone, Written in Blood"
    function() t[13023] = a:New(13023); end, -- It's Really Getting Out of Hand
    function() t[13022] = a:New(13022, f.Horde); end, -- Revenge is Best Served Speedily
    function() t[13021] = a:New(13021, f.Horde); end, -- A Most Efficient Apocalypse
    function() t[13020] = a:New(13020, f.Horde); end, -- Bow to Your Masters
    function() t[13018] = a:New(13018); end, -- Dune Rider
    function() t[13017] = a:New(13017, f.Horde); end, -- Champion of the Vulpera
    function() t[13016] = a:New(13016); end, -- Scavenger of the Sands
    function() t[13014] = a:New(13014, f.Horde); end, -- Vorrik's Champion
    function() t[13011] = a:New(13011); end, -- Scourge of Zem'lan
    function() t[13009] = a:New(13009, f.Horde); end, -- Adept Sandfisher
    function() t[12998] = a:New(12998); end, -- That Sweete Booty
    function() t[12997] = a:New(12997, f.Alliance); end, -- The Pride of Kul Tiras
    function() t[12996] = a:New(12996); end, -- Toybox Tycoon
    function() t[12995] = a:New(12995); end, -- Treasures of Drustvar
    function() T(t[12993], u[1664]); end, -- Dread Aspirant's Plate (Aspirant)
    function() T(t[12993], u[1665]); end, -- 7th Legionnaire's Plate (Warfront)
    function() T(t[12993], u[1663]); end, -- Dread Gladiator's Plate (Gladiator)
    function() T(t[12993], u[1735]); end, -- Dread Gladiator's Plate (Elite)
    function() T(t[12993], u[1661]); end, -- Dread Aspirant's Chain (Aspirant)
    function() T(t[12993], u[1662]); end, -- 7th Legionnaire's Chain (Warfront)
    function() T(t[12993], u[1660]); end, -- Dread Gladiator's Chain (Gladiator)
    function() T(t[12993], u[1736]); end, -- Dread Gladiator's Chain (Elite)
    function() T(t[12993], u[1655]); end, -- Dread Aspirant's Vestment (Aspirant)
    function() T(t[12993], u[1656]); end, -- 7th Legionnaire's Vestment (Warfront)
    function() T(t[12993], u[1654]); end, -- Dread Gladiator's Vestment (Gladiator)
    function() T(t[12993], u[1738]); end, -- Dread Gladiator's Vestment (Elite)
    function() T(t[12993], u[1658]); end, -- Dread Aspirant's Leathers (Aspirant)
    function() T(t[12993], u[1659]); end, -- 7th Legionnaire's Leathers (Warfront)
    function() T(t[12993], u[1657]); end, -- Dread Gladiator's Leathers (Gladiator)
    function() T(t[12993], u[1737]); end, -- Dread Gladiator's Leathers (Elite)
    function() T(t[12993], u[1676]); end, -- Dread Aspirant's Plate (Aspirant)
    function() T(t[12993], u[1677]); end, -- Honorbound Centurion's Plate (Warfront)
    function() T(t[12993], u[1675]); end, -- Dread Gladiator's Plate (Gladiator)
    function() T(t[12993], u[1731]); end, -- Dread Gladiator's Plate (Elite)
    function() T(t[12993], u[1673]); end, -- Dread Aspirant's Chain (Aspirant)
    function() T(t[12993], u[1674]); end, -- Honorbound Vanguard's Chain (Warfront)
    function() T(t[12993], u[1672]); end, -- Dread Gladiator's Chain (Gladiator)
    function() T(t[12993], u[1732]); end, -- Dread Gladiator's Chain (Elite)
    function() T(t[12993], u[1667]); end, -- Dread Aspirant's Vestment (Aspirant)
    function() T(t[12993], u[1668]); end, -- Honorbound Artificer's Vestment (Warfront)
    function() T(t[12993], u[1666]); end, -- Dread Gladiator's Vestment (Gladiator)
    function() T(t[12993], u[1734]); end, -- Dread Gladiator's Vestment (Elite)
    function() T(t[12993], u[1670]); end, -- Dread Aspirant's Leathers (Aspirant)
    function() T(t[12993], u[1671]); end, -- Honorbound Outrider's Leathers (Warfront)
    function() T(t[12993], u[1669]); end, -- Dread Gladiator's Leathers (Gladiator)
    function() T(t[12993], u[1733]); end, -- Dread Gladiator's Leathers (Elite)
    function() t[12993] = a:New(12993); end, -- Don't Warfront Me
    function() t[12992] = a:New(12992); end, -- Pet Emporium
    function() T(t[12991], u[1653]); end, -- Eternal Curator's Protectorate (Raid Finder)
    function() T(t[12991], u[1650]); end, -- Eternal Curator's Protectorate (Normal)
    function() T(t[12991], u[1651]); end, -- Eternal Curator's Protectorate (Heroic)
    function() T(t[12991], u[1652]); end, -- Eternal Curator's Protectorate (Mythic)
    function() T(t[12991], u[1649]); end, -- Eternal Curator's Chains (Raid Finder)
    function() T(t[12991], u[1646]); end, -- Eternal Curator's Chains (Normal)
    function() T(t[12991], u[1647]); end, -- Eternal Curator's Chains (Heroic)
    function() T(t[12991], u[1648]); end, -- Eternal Curator's Chains (Mythic)
    function() T(t[12991], u[1641]); end, -- Eternal Curator's Vestment (Raid Finder)
    function() T(t[12991], u[1638]); end, -- Eternal Curator's Vestment (Normal)
    function() T(t[12991], u[1639]); end, -- Eternal Curator's Vestment (Heroic)
    function() T(t[12991], u[1640]); end, -- Eternal Curator's Vestment (Mythic)
    function() T(t[12991], u[1645]); end, -- Eternal Curator's Garb (Raid Finder)
    function() T(t[12991], u[1642]); end, -- Eternal Curator's Garb (Normal)
    function() T(t[12991], u[1643]); end, -- Eternal Curator's Garb (Heroic)
    function() T(t[12991], u[1644]); end, -- Eternal Curator's Garb (Mythic)
    function() t[12991] = a:New(12991); end, -- "New Mog, G'huun This?"
    function() t[12990] = a:New(12990); end, -- Catchin' Some Rays
    function() t[12989] = a:New(12989); end, -- "Battle for Azeroth Pathfinder, Part One"
    function() t[12988] = a:New(12988); end, -- Battle for Azeroth Explorer
    function() O(t[12964], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12964] = a:New(12964, f.Horde, 12963, true); end, -- Hero of the Horde: Dread
    function() O(t[12963], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12963] = a:New(12963, f.Alliance, 12964, true); end, -- Hero of the Alliance: Dread
    function() O(t[12962], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12962] = a:New(12962, nil, nil, true); end, -- Duelist: Battle for Azeroth Season 1
    function() O(t[12961], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12961] = a:New(12961, nil, nil, true); end, -- Gladiator: Battle for Azeroth Season 1
    function() O(t[12960], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12960] = a:New(12960, nil, nil, true); end, -- Rival: Battle for Azeroth Season 1
    function() O(t[12959], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12959] = a:New(12959, nil, nil, true); end, -- Challenger: Battle for Azeroth Season 1
    function() t[12958] = a:New(12958); end, -- Master of Minions
    function() t[12957] = a:New(12957, f.Horde, 12954); end, -- Champion of the Honorbound
    function() t[12956] = a:New(12956); end, -- Tortollan Seekers
    function() t[12955] = a:New(12955); end, -- Champions of Azeroth
    function() t[12954] = a:New(12954, f.Alliance, 12957); end, -- Champion of the 7th Legion
    function() t[12953] = a:New(12953, f.Alliance, 12949); end, -- Storm's Wake
    function() t[12952] = a:New(12952, f.Alliance, 12948); end, -- Order of Embers
    function() t[12951] = a:New(12951, f.Alliance, 12950); end, -- Proudmoore Admiralty
    function() t[12950] = a:New(12950, f.Horde, 12951); end, -- Zandalari Empire
    function() t[12949] = a:New(12949, f.Horde, 12953); end, -- The Voldunai
    function() t[12948] = a:New(12948, f.Horde, 12952); end, -- Talanji's Expedition
    function() t[12947] = a:New(12947); end, -- Azerothian Diplomat
    function() O(t[12945], "From", "PvP Season", 26, "Until", "PvP Season", 26); end,
    function() t[12945] = a:New(12945, nil, nil, true); end, -- Dread Gladiator: Battle for Azeroth Season 1
    function() t[12944] = a:New(12944); end, -- Adventurer of Zuldazar
    function() t[12943] = a:New(12943); end, -- Adventurer of Vol'dun
    function() t[12942] = a:New(12942); end, -- Adventurer of Nazmir
    function() t[12941] = a:New(12941); end, -- Adventurer of Drustvar
    function() t[12940] = a:New(12940); end, -- Adventurer of Stormsong Valley
    function() t[12939] = a:New(12939); end, -- Adventurer of Tiragarde Sound
    function() t[12938] = a:New(12938); end, -- Parental Controls
    function() t[12937] = a:New(12937); end, -- Elevator Music
    function() t[12936] = a:New(12936); end, -- Battle on Zandalar and Kul Tiras
    function() t[12934] = a:New(12934, f.Horde, 12933); end, -- A Horde of Hoofbeats
    function() t[12933] = a:New(12933, f.Alliance, 12934); end, -- A Horde of Hoofbeats
    function() t[12932] = a:New(12932, f.Alliance, 12931); end, -- No Stable Big Enough
    function() t[12931] = a:New(12931, f.Horde, 12932); end, -- No Stable Big Enough
    function() t[12930] = a:New(12930); end, -- Battle Safari
    function() t[12927] = a:New(12927); end, -- Polished Pet Charmer
    function() t[12918] = a:New(12918); end, -- Have a Heart
    function() t[12917] = a:New(12917, nil, nil, true); end, -- Honor Level 500
    function() t[12916] = a:New(12916, nil, nil, true); end, -- Honor Level 400
    function() t[12915] = a:New(12915, nil, nil, true); end, -- Honor Level 300
    function() t[12914] = a:New(12914, nil, nil, true); end, -- Honor Level 250
    function() t[12913] = a:New(12913, nil, nil, true); end, -- Honor Level 200
    function() t[12912] = a:New(12912, nil, nil, true); end, -- Honor Level 175
    function() t[12911] = a:New(12911, nil, nil, true); end, -- Honor Level 150
    function() t[12910] = a:New(12910, nil, nil, true); end, -- Honor Level 125
    function() t[12909] = a:New(12909, nil, nil, true); end, -- Honor Level 100
    function() t[12908] = a:New(12908, nil, nil, true); end, -- Honor Level 90
    function() t[12907] = a:New(12907, nil, nil, true); end, -- Honor Level 80
    function() t[12906] = a:New(12906, nil, nil, true); end, -- Honor Level 70
    function() t[12905] = a:New(12905, nil, nil, true); end, -- Honor Level 60
    function() t[12904] = a:New(12904, nil, nil, true); end, -- Honor Level 50
    function() t[12903] = a:New(12903, nil, nil, true); end, -- Honor Level 40
    function() t[12902] = a:New(12902, nil, nil, true); end, -- Honor Level 30
    function() t[12901] = a:New(12901, nil, nil, true); end, -- Honor Level 25
    function() t[12900] = a:New(12900, nil, nil, true); end, -- Honor Level 20
    function() t[12899] = a:New(12899, f.Alliance, 12870); end, -- Azeroth at War: Kalimdor on Fire
    function() t[12898] = a:New(12898, f.Alliance, 12869); end, -- Azeroth at War: After Lordaeron
    function() t[12896] = a:New(12896, f.Alliance, 12867); end, -- Azeroth at War: The Barrens
    function() t[12895] = a:New(12895, nil, nil, true); end, -- Honor Level 15
    function() t[12894] = a:New(12894, nil, nil, true); end, -- Honor Level 10
    function() t[12893] = a:New(12893, nil, nil, true); end, -- Honor Level 5
    function() t[12891] = a:New(12891, f.Alliance, 12479); end, -- A Nation United
    function() t[12889] = a:New(12889, f.Alliance, 12876); end, -- Strike Fast
    function() t[12888] = a:New(12888, f.Alliance, 12877); end, -- Strike Hard
    function() t[12886] = a:New(12886, f.Alliance, 12879); end, -- Tour of War
    function() t[12884] = a:New(12884, f.Alliance, 12878); end, -- Leader of Troops
    function() t[12881] = a:New(12881, f.Alliance, 12873); end, -- War is Hell
    function() t[12879] = a:New(12879, f.Horde, 12886); end, -- Tour of War
    function() t[12878] = a:New(12878, f.Horde, 12884); end, -- Leader of Troops
    function() t[12877] = a:New(12877, f.Horde, 12888); end, -- Strike Hard
    function() t[12876] = a:New(12876, f.Horde, 12889); end, -- Strike Fast
    function() t[12874] = a:New(12874); end, -- An Eventful Battle
    function() t[12873] = a:New(12873, f.Horde, 12881); end, -- War is Hell
    function() t[12872] = a:New(12872); end, -- The Dirty Five
    function() t[12870] = a:New(12870, f.Horde, 12899); end, -- Azeroth at War: Kalimdor on Fire
    function() t[12869] = a:New(12869, f.Horde, 12898); end, -- Azeroth at War: After Lordaeron
    function() t[12867] = a:New(12867, f.Horde, 12896); end, -- Azeroth at War: The Barrens
    function() t[12866] = a:New(12866); end, -- 100 Exalted Reputations
    function() t[12865] = a:New(12865); end, -- 90 Exalted Reputations
    function() t[12864] = a:New(12864); end, -- 80 Exalted Reputations
    function() t[12863] = a:New(12863, nil, nil, true); end, -- Dueling Master
    function() t[12862] = a:New(12862, nil, nil, true); end, -- Thirty Six and Two
    function() t[12861] = a:New(12861, nil, nil, true); end, -- Master of Duels
    function() t[12860] = a:New(12860, nil, nil, true); end, -- Contender
    function() t[12859] = a:New(12859, nil, nil, true); end, -- Prize Fighter
    function() t[12858] = a:New(12858, nil, nil, true); end, -- Slugfest
    function() t[12857] = a:New(12857, nil, nil, true); end, -- Trial by Combat
    function() t[12856] = a:New(12856, nil, nil, true); end, -- The First Rule of Dueler's Guild
    function() t[12855] = a:New(12855); end, -- Pitch Invasion
    function() t[12854] = a:New(12854); end, -- Ready for Raiding VI
    function() t[12853] = a:New(12853); end, -- Treasures of Stormsong Valley
    function() t[12852] = a:New(12852); end, -- Treasures of Tiragarde Sound
    function() t[12851] = a:New(12851); end, -- Treasures of Zuldazar
    function() t[12850] = a:New(12850); end, -- At Least You're Being Careful
    function() t[12849] = a:New(12849); end, -- Treasures of Vol'dun
    function() t[12848] = a:New(12848); end, -- Kings' Rest
    function() t[12847] = a:New(12847); end, -- Siege of Boralus
    function() t[12846] = a:New(12846); end, -- Mythic: The MOTHERLODE!!
    function() t[12845] = a:New(12845); end, -- Heroic: The MOTHERLODE!!
    function() t[12844] = a:New(12844); end, -- The MOTHERLODE!!
    function() t[12842] = a:New(12842); end, -- Mythic: Tol Dagor
    function() t[12841] = a:New(12841); end, -- Heroic: Tol Dagor
    function() t[12840] = a:New(12840); end, -- Tol Dagor
    function() t[12838] = a:New(12838); end, -- Mythic: Shrine of the Storm
    function() t[12837] = a:New(12837); end, -- Heroic: Shrine of the Storm
    function() t[12836] = a:New(12836); end, -- Existential Crisis
    function() t[12835] = a:New(12835); end, -- Shrine of the Storm
    function() t[12833] = a:New(12833); end, -- Mythic: Freehold
    function() t[12832] = a:New(12832); end, -- Heroic: Freehold
    function() t[12831] = a:New(12831); end, -- Freehold
    function() t[12830] = a:New(12830); end, -- Edgelords
    function() t[12828] = a:New(12828); end, -- What's in the Box?
    function() O(t[12827]); end,
    function() t[12827] = a:New(12827); end, -- WoW's 14th Anniversary
    function() t[12826] = a:New(12826); end, -- Mythic: Atal'Dazar
    function() t[12825] = a:New(12825); end, -- Heroic: Atal'Dazar
    function() t[12824] = a:New(12824); end, -- Atal'Dazar
    function() t[12823] = a:New(12823); end, -- Thrash Mouth - All Stars
    function() t[12812] = a:New(12812); end, -- Glory of the Wartorn Hero
    function() t[12807] = a:New(12807); end, -- Battle for Azeroth Dungeon Hero
    function() t[12806] = a:New(12806); end, -- Glory of the Uldir Raider
    function() t[12772] = a:New(12772); end, -- Now We Got Bad Blood
    function() t[12771] = a:New(12771); end, -- Treasures of Nazmir
    function() t[12770] = a:New(12770); end, -- Lengthy Legwork
    function() t[12769] = a:New(12769); end, -- Light Travel
    function() t[12765] = a:New(12765); end, -- Exotic Discoveries
    function() t[12764] = a:New(12764, f.Horde, 12762); end, -- Zandalari Curator
    function() t[12762] = a:New(12762, f.Alliance, 12764); end, -- Kul Tiran Curator
    function() t[12761] = a:New(12761, f.Horde, 12760); end, -- Zandalari Archaeologist
    function() t[12760] = a:New(12760, f.Alliance, 12761); end, -- Kul Tiran Archaeologist
    function() t[12759] = a:New(12759, f.Horde, 12758); end, -- Baiting the Enemy
    function() t[12758] = a:New(12758, f.Alliance, 12759); end, -- Baiting the Enemy
    function() t[12757] = a:New(12757); end, -- Angling for Battle
    function() t[12756] = a:New(12756); end, -- Fish Me In the Moonlight
    function() t[12755] = a:New(12755); end, -- Scent of the Sea
    function() t[12754] = a:New(12754, f.Horde, 12753); end, -- Zandalari Fisherman
    function() t[12753] = a:New(12753, f.Alliance, 12754); end, -- Kul Tiran Fisherman
    function() t[12747] = a:New(12747); end, -- Catering for Combat
    function() t[12746] = a:New(12746, f.Horde, 12744); end, -- The Zandalari Menu
    function() t[12744] = a:New(12744, f.Alliance, 12746); end, -- The Kul Tiran Menu
    function() t[12743] = a:New(12743, f.Horde, 12742); end, -- Zandalari Cook
    function() t[12742] = a:New(12742, f.Alliance, 12743); end, -- Kul Tiran Cook
    function() t[12741] = a:New(12741, f.Alliance, 13056); end, -- Giving a Scrap
    function() t[12740] = a:New(12740); end, -- Full of Scrap!
    function() t[12739] = a:New(12739); end, -- Scraptastic!
    function() t[12738] = a:New(12738); end, -- Holy Scrap!
    function() t[12737] = a:New(12737, f.Horde, 12736); end, -- Zandalari Master of All
    function() t[12736] = a:New(12736, f.Alliance, 12737); end, -- Kul Tiran Master of All
    function() t[12735] = a:New(12735, f.Horde, 12734); end, -- Working in Zandalar
    function() t[12734] = a:New(12734, f.Alliance, 12735); end, -- Working in Kul Tiras
    function() t[12733] = a:New(12733, f.Horde, 12731); end, -- Professional Zandalari Master
    function() t[12731] = a:New(12731, f.Alliance, 12733); end, -- Professional Kul Tiran Master
    function() t[12727] = a:New(12727); end, -- Stand by Me
    function() t[12726] = a:New(12726); end, -- A Fish Out of Water
    function() t[12723] = a:New(12723); end, -- How to Keep a Mummy
    function() t[12722] = a:New(12722); end, -- It Belongs in a Mausoleum!
    function() t[12721] = a:New(12721); end, -- Wrap God
    function() t[12719] = a:New(12719, f.Horde); end, -- Spirits Be With You
    function() t[12614] = a:New(12614, f.Horde); end, -- Loa Expectations
    function() t[12605] = a:New(12605, f.Alliance, 12604, true); end, -- Conqueror of Azeroth
    function() t[12604] = a:New(12604, f.Horde, 12605, true); end, -- Conqueror of Azeroth
    function() t[12602] = a:New(12602); end, -- Trust No One
    function() t[12601] = a:New(12601); end, -- The Void Lies Sleeping
    function() t[12600] = a:New(12600); end, -- Breath of the Shrine
    function() t[12597] = a:New(12597, nil, nil, true); end, -- Bayside Brawler
    function() t[12596] = a:New(12596); end, -- No Tourist
    function() t[12595] = a:New(12595); end, -- Expert Expeditioner
    function() t[12594] = a:New(12594); end, -- Competent Captain
    function() t[12593] = a:New(12593, f.Alliance, 13294); end, -- Loremaster of Kul Tiras
    function() t[12592] = a:New(12592, nil, nil, true); end, -- Ruined the Ruins
    function() t[12591] = a:New(12591); end, -- Mythic: Un'gol Ruins
    function() t[12590] = a:New(12590); end, -- Un'gol Ruins
    function() t[12589] = a:New(12589); end, -- Heroic: Un'gol Ruins
    function() t[12588] = a:New(12588); end, -- Eat Your Greens
    function() t[12587] = a:New(12587); end, -- Unbound Monstrosities
    function() t[12582] = a:New(12582, f.Alliance, 12555); end, -- Come Sail Away
    function() t[12579] = a:New(12579, nil, nil, true); end, -- Tour of Duty: Drustvar
    function() t[12578] = a:New(12578, nil, nil, true); end, -- Tour of Duty: Stormsong Valley
    function() t[12577] = a:New(12577, nil, nil, true); end, -- Tour of Duty: Tiragarde Sound
    function() t[12576] = a:New(12576, nil, nil, true); end, -- Tour of Duty: Vol'dun
    function() t[12575] = a:New(12575, nil, nil, true); end, -- Tour of Duty: Zuldazar
    function() t[12574] = a:New(12574, nil, nil, true); end, -- Tour of Duty: Nazmir
    function() t[12573] = a:New(12573, nil, nil, true); end, -- Band of Brothers
    function() t[12572] = a:New(12572, nil, nil, true); end, -- War Supplied
    function() t[12571] = a:New(12571, nil, nil, true); end, -- Bounty Hunting
    function() t[12568] = a:New(12568, f.Horde, 12567, true); end, -- The Alliance Slayer
    function() t[12567] = a:New(12567, f.Alliance, 12568, true); end, -- The Horde Slayer
    function() t[12561] = a:New(12561); end, -- Explore Nazmir
    function() t[12560] = a:New(12560); end, -- Explore Vol'dun
    function() t[12559] = a:New(12559); end, -- Explore Zuldazar
    function() t[12558] = a:New(12558); end, -- Explore Stormsong Valley
    function() t[12557] = a:New(12557); end, -- Explore Drustvar
    function() t[12556] = a:New(12556); end, -- Explore Tiragarde Sound
    function() t[12555] = a:New(12555, f.Horde, 12582); end, -- Welcome to Zandalar
    function() t[12551] = a:New(12551); end, -- Double Dribble
    function() t[12550] = a:New(12550); end, -- Pecking Order
    function() t[12549] = a:New(12549); end, -- Not a Fun Guy
    function() t[12548] = a:New(12548); end, -- I'm in Charge Now!
    function() O(t[12547], "From", "Version", "080001", "Before", "Version", "090001"); end,
    function() t[12547] = a:New(12547); end, -- Epic (Battle)
    function() O(t[12546], "From", "Version", "080001", "Before", "Version", "090001"); end,
    function() t[12546] = a:New(12546); end, -- Superior (Battle)
    function() O(t[12544], "From", "Version", "080001", "Before", "Version", "090001"); end,
    function() t[12544] = a:New(12544); end, -- Level 120 (Legacy)
    function() O(t[12536], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1); end,
    function() t[12536] = a:New(12536); end, -- Ahead of the Curve: G'huun
    function() O(t[12535], "From", "Mythic+ Season", 1, "Until", "Mythic+ Season", 1); end,
    function() t[12535] = a:New(12535); end, -- Cutting Edge: G'huun
    function() t[12533] = a:New(12533); end, -- Mythic: G'huun
    function() t[12532] = a:New(12532); end, -- Mythic: Mythrax the Unraveler
    function() t[12531] = a:New(12531); end, -- Mythic: Zul
    function() t[12530] = a:New(12530); end, -- Mythic: Fetid Devourer
    function() t[12529] = a:New(12529); end, -- Mythic: Vectis
    function() t[12527] = a:New(12527); end, -- Mythic: Zek'voz
    function() t[12526] = a:New(12526); end, -- Mythic: MOTHER
    function() t[12524] = a:New(12524); end, -- Mythic: Taloc
    function() t[12523] = a:New(12523); end, -- Heart of Corruption
    function() t[12522] = a:New(12522); end, -- Crimson Descent
    function() t[12521] = a:New(12521); end, -- Halls of Containment
    function() t[12518] = a:New(12518, f.Horde); end, -- Allied Races: Mag'har Orc
    function() t[12515] = a:New(12515, f.Alliance); end, -- Allied Races: Dark Iron Dwarf
    function() t[12510] = a:New(12510, f.Alliance, 12509); end, -- Ready for War
    function() t[12509] = a:New(12509, f.Horde, 12510); end, -- Ready for War
    function() t[12508] = a:New(12508); end, -- "Good Night, Sweet Prince"
    function() t[12507] = a:New(12507); end, -- Snake Eater
    function() t[12506] = a:New(12506); end, -- Mythic: The Temple of Sethraliss
    function() t[12505] = a:New(12505); end, -- Heroic: The Temple of Sethraliss
    function() t[12504] = a:New(12504); end, -- The Temple of Sethraliss
    function() t[12503] = a:New(12503); end, -- Snake Eyes
    function() t[12502] = a:New(12502); end, -- Mythic: Underrot
    function() t[12501] = a:New(12501); end, -- Heroic: Underrot
    function() t[12500] = a:New(12500); end, -- Underrot
    function() t[12499] = a:New(12499); end, -- Sporely Alive
    function() t[12498] = a:New(12498); end, -- Taint Nobody Got Time For That
    function() t[12497] = a:New(12497, f.Alliance, 11868); end, -- Drust Do It.
    function() t[12496] = a:New(12496, f.Alliance, 12478); end, -- Stormsong and Dance
    function() t[12495] = a:New(12495); end, -- Run Wild Like a Man On Fire
    function() t[12490] = a:New(12490); end, -- Alchemical Romance
    function() t[12489] = a:New(12489); end, -- Losing My Profession
    function() t[12488] = a:New(12488); end, -- Mythic: Waycrest Manor
    function() t[12484] = a:New(12484); end, -- Heroic: Waycrest Manor
    function() t[12483] = a:New(12483); end, -- Waycrest Manor
    function() t[12482] = a:New(12482); end, -- Get Hek'd
    function() t[12481] = a:New(12481, f.Horde); end, -- The Final Seal
    function() t[12480] = a:New(12480, f.Horde); end, -- A Bargain of Blood
    function() t[12479] = a:New(12479, f.Horde, 12891); end, -- Zandalar Forever!
    function() t[12478] = a:New(12478, f.Horde, 12496); end, -- Secrets in the Sands
    function() t[12473] = a:New(12473, f.Alliance, 11861); end, -- A Sound Plan
    function() t[12462] = a:New(12462); end, -- Shot Through the Heart
    function() t[12457] = a:New(12457); end, -- Remix to Ignition
    function() t[12456] = a:New(12456, f.Alliance, 4908); end, -- Loch Modan & Wetlands Quests
    function() t[12455] = a:New(12455, f.Alliance, 4894); end, -- Westfall & Duskwood Quests
    function() O(t[12454]); end,
    function() t[12454] = a:New(12454); end, -- Salute to StarCraft
    function() t[12439] = a:New(12439); end, -- Priority Mail
    function() t[12431] = a:New(12431); end, -- Post Haste
    function() t[12430] = a:New(12430, f.Alliance); end, -- Duskwood Quests
    function() t[12429] = a:New(12429, f.Alliance); end, -- Wetlands Quests
    function() t[12416] = a:New(12416); end, -- The Total Package
    function() t[12415] = a:New(12415, f.Horde); end, -- Heritage of Highmountain
    function() t[12414] = a:New(12414, f.Alliance); end, -- Heritage of the Lightforged
    function() t[12413] = a:New(12413, f.Horde); end, -- Heritage of the Nightborne
    function() t[12412] = a:New(12412, nil, nil, true); end, -- Master of Seething Shore
    function() t[12411] = a:New(12411, nil, nil, true); end, -- Blood and Sand
    function() t[12410] = a:New(12410, nil, nil, true); end, -- Seething Shore Veteran
    function() t[12409] = a:New(12409, nil, nil, true); end, -- Seething Shore Victory
    function() t[12408] = a:New(12408, nil, nil, true); end, -- Seething Shore Domination
    function() t[12407] = a:New(12407, nil, nil, true); end, -- Seething Shore Perfection
    function() t[12406] = a:New(12406, nil, nil, true); end, -- A Good Start
    function() t[12405] = a:New(12405, nil, nil, true); end, -- Death from Above
    function() t[12404] = a:New(12404, nil, nil, true); end, -- Claim Jumper
    function() t[12401] = a:New(12401); end, -- Glory of the Ulduar Raider
    function() t[12400] = a:New(12400); end, -- Supermassive
    function() t[12399] = a:New(12399); end, -- Observed
    function() t[12398] = a:New(12398); end, -- In His House He Waits Dreaming
    function() t[12397] = a:New(12397); end, -- They're Coming Out of the Walls
    function() t[12396] = a:New(12396); end, -- He's Not Getting Any Older
    function() t[12395] = a:New(12395); end, -- Drive Me Crazy
    function() t[12388] = a:New(12388); end, -- Alone in the Darkness
    function() t[12387] = a:New(12387); end, -- One Light in the Darkness
    function() t[12386] = a:New(12386); end, -- Two Lights in the Darkness
    function() t[12385] = a:New(12385); end, -- Three Lights in the Darkness
    function() t[12384] = a:New(12384); end, -- Kiss and Make Up
    function() t[12373] = a:New(12373); end, -- I Love the Smell of Saronite in the Morning
    function() t[12372] = a:New(12372); end, -- Shadowdodger
    function() t[12369] = a:New(12369); end, -- Firefighter
    function() t[12368] = a:New(12368); end, -- Not-So-Friendly Fire
    function() t[12367] = a:New(12367); end, -- Set Up Us the Bomb
    function() t[12366] = a:New(12366); end, -- "Knock, Knock, Knock on Wood"
    function() t[12365] = a:New(12365); end, -- "Knock, Knock on Wood"
    function() t[12364] = a:New(12364); end, -- Knock on Wood
    function() t[12363] = a:New(12363); end, -- Getting Back to Nature
    function() t[12362] = a:New(12362); end, -- Deforestation
    function() t[12361] = a:New(12361); end, -- Con-speed-atory
    function() t[12360] = a:New(12360); end, -- Lumberjacked
    function() t[12352] = a:New(12352); end, -- Lose Your Illusion
    function() t[12351] = a:New(12351); end, -- Siffed
    function() t[12350] = a:New(12350); end, -- Who Needs Bloodlust?
    function() t[12349] = a:New(12349); end, -- I'll Take You All On
    function() t[12348] = a:New(12348); end, -- Don't Stand in the Lightning
    function() t[12347] = a:New(12347); end, -- I Could Say That This Cache Was Rare
    function() t[12346] = a:New(12346); end, -- Staying Buffed All Winter
    function() t[12345] = a:New(12345); end, -- Getting Cold in Here
    function() t[12344] = a:New(12344); end, -- I Have the Coolest Friends
    function() t[12343] = a:New(12343); end, -- Cheese the Freeze
    function() t[12342] = a:New(12342); end, -- Nine Lives
    function() t[12341] = a:New(12341); end, -- Crazy Cat Lady
    function() t[12340] = a:New(12340); end, -- Rubble and Roll
    function() t[12339] = a:New(12339); end, -- If Looks Could Kill
    function() t[12338] = a:New(12338); end, -- Disarmed
    function() t[12337] = a:New(12337); end, -- With Open Arms
    function() t[12336] = a:New(12336); end, -- Can't Do That While Stunned
    function() t[12335] = a:New(12335); end, -- But I'm On Your Side
    function() t[12334] = a:New(12334); end, -- "I Choose You, Steelbreaker"
    function() t[12333] = a:New(12333); end, -- "I Choose You, Stormcaller Brundir"
    function() t[12332] = a:New(12332); end, -- "I Choose You, Runemaster Molgeim"
    function() t[12330] = a:New(12330); end, -- Heartbreaker
    function() t[12329] = a:New(12329); end, -- Must Deconstruct Faster
    function() t[12328] = a:New(12328); end, -- Nerf Gravity Bombs
    function() t[12327] = a:New(12327); end, -- Nerf Scrapbots
    function() t[12326] = a:New(12326); end, -- Nerf Engineering
    function() t[12325] = a:New(12325); end, -- Stokin' the Furnace
    function() t[12324] = a:New(12324); end, -- Hot Pocket
    function() t[12323] = a:New(12323); end, -- Shattered
    function() t[12322] = a:New(12322); end, -- "Iron Dwarf, Medium Rare"
    function() t[12321] = a:New(12321); end, -- A Quick Shave
    function() t[12320] = a:New(12320); end, -- Orbit-uary
    function() t[12319] = a:New(12319); end, -- Nuked from Orbit
    function() t[12318] = a:New(12318); end, -- Orbital Devastation
    function() t[12317] = a:New(12317); end, -- Orbital Bombardment
    function() t[12316] = a:New(12316); end, -- Shutout
    function() t[12315] = a:New(12315); end, -- Take Out Those Turrets
    function() t[12314] = a:New(12314); end, -- Three Car Garage
    function() t[12313] = a:New(12313); end, -- Unbroken
    function() t[12312] = a:New(12312); end, -- Dwarfageddon
    function() t[12311] = a:New(12311); end, -- The Secrets of Ulduar
    function() t[12310] = a:New(12310); end, -- The Descent into Madness
    function() t[12309] = a:New(12309); end, -- The Keepers of Ulduar
    function() t[12302] = a:New(12302); end, -- The Antechamber of Ulduar
    function() t[12297] = a:New(12297); end, -- The Siege of Ulduar
    function() t[12292] = a:New(12292); end, -- Highmountain Tribe
    function() t[12291] = a:New(12291, f.Alliance); end, -- Heritage of the Void
    function() t[12290] = a:New(12290, nil, nil, true); end, -- Family Brawler
    function() t[12289] = a:New(12289, nil, nil, true); end, -- Humanoid Brawler
    function() t[12287] = a:New(12287, nil, nil, true); end, -- Dragonkin Brawler
    function() t[12286] = a:New(12286, nil, nil, true); end, -- Flying Brawler
    function() t[12285] = a:New(12285, nil, nil, true); end, -- Undead Brawler
    function() t[12284] = a:New(12284, nil, nil, true); end, -- Critter Brawler
    function() t[12283] = a:New(12283, nil, nil, true); end, -- Magic Brawler
    function() t[12282] = a:New(12282, nil, nil, true); end, -- Elemental Brawler
    function() t[12281] = a:New(12281, nil, nil, true); end, -- Beast Brawler
    function() t[12280] = a:New(12280, nil, nil, true); end, -- Aquatic Brawler
    function() t[12279] = a:New(12279, nil, nil, true); end, -- Mechanical Brawler
    function() t[12273] = a:New(12273); end, -- It's Lit!
    function() t[12272] = a:New(12272); end, -- Gold Fever
    function() t[12270] = a:New(12270); end, -- Bringing Hexy Back
    function() t[12257] = a:New(12257); end, -- Stardust Crusaders
    function() t[12245] = a:New(12245, f.Horde); end, -- Allied Races: Highmountain Tauren
    function() t[12244] = a:New(12244, f.Horde); end, -- Allied Races: Nightborne
    function() t[12243] = a:New(12243, f.Alliance); end, -- Allied Races: Lightforged Draenei
    function() t[12242] = a:New(12242, f.Alliance); end, -- Allied Races: Void Elf
    function() t[12232] = a:New(12232); end, -- Collector's Edition: Tottle
    function() t[12230] = a:New(12230, f.Horde, 12229); end, -- Collector's Edition: Gilded Ravasaur
    function() t[12229] = a:New(12229, f.Alliance, 12230); end, -- Collector's Edition: Seabraid Stallion
    function() O(t[12200], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12200] = a:New(12200, f.Alliance, 12199, true); end, -- Demonic Combatant
    function() O(t[12199], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12199] = a:New(12199, f.Horde, 12200, true); end, -- Demonic Combatant
    function() O(t[12198], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12198] = a:New(12198, nil, nil, true); end, -- Demonic Elite
    function() O(t[12197], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12197] = a:New(12197, f.Alliance, 12196, true); end, -- Hero of the Alliance: Demonic
    function() O(t[12196], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12196] = a:New(12196, f.Horde, 12197, true); end, -- Hero of the Horde: Demonic
    function() O(t[12195], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12195] = a:New(12195, f.Alliance, 12194, true); end, -- Defender of the Alliance: Legion Season 7
    function() O(t[12194], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12194] = a:New(12194, f.Horde, 12195, true); end, -- Defender of the Horde: Legion Season 7
    function() O(t[12192], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12192] = a:New(12192, f.Horde, 12191, true); end, -- Guardian of the Horde: Legion Season 7
    function() O(t[12191], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12191] = a:New(12191, f.Alliance, 12192, true); end, -- Guardian of the Alliance: Legion Season 7
    function() O(t[12190], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12190] = a:New(12190, f.Horde, 12189, true); end, -- Soldier of the Horde: Legion Season 7
    function() O(t[12189], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12189] = a:New(12189, f.Alliance, 12190, true); end, -- Soldier of the Alliance: Legion Season 7
    function() O(t[12188], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12188] = a:New(12188, nil, nil, true); end, -- Rival: Legion Season 7
    function() O(t[12187], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12187] = a:New(12187, nil, nil, true); end, -- Challenger: Legion Season 7
    function() O(t[12186], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12186] = a:New(12186, nil, nil, true); end, -- Duelist: Legion Season 7
    function() O(t[12185], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12185] = a:New(12185, nil, nil, true); end, -- Demonic Gladiator: Legion Season 7
    function() O(t[12183], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12183] = a:New(12183, nil, nil, true); end, -- Prestige Quartermaster
    function() O(t[12182], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12182] = a:New(12182, nil, nil, true); end, -- Demonic Double Dozen
    function() O(t[12181], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12181] = a:New(12181, nil, nil, true); end, -- Protocol 2.3
    function() O(t[12180], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12180] = a:New(12180, nil, nil, true); end, -- Catching Twenty-Two
    function() O(t[12179], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12179] = a:New(12179, f.Alliance, 12178, true); end, -- Soldier of the Alliance: Legion Season 6
    function() O(t[12178], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12178] = a:New(12178, f.Horde, 12179, true); end, -- Soldier of the Horde: Legion Season 6
    function() O(t[12177], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12177] = a:New(12177, f.Alliance, 12176, true); end, -- Guardian of the Alliance: Legion Season 6
    function() O(t[12176], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12176] = a:New(12176, f.Horde, 12177, true); end, -- Guardian of the Horde: Legion Season 6
    function() O(t[12175], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12175] = a:New(12175, f.Alliance, 12174, true); end, -- Defender of the Alliance: Legion Season 6
    function() O(t[12174], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12174] = a:New(12174, f.Horde, 12175, true); end, -- Defender of the Horde: Legion Season 6
    function() O(t[12173], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12173] = a:New(12173, f.Alliance, 12172, true); end, -- Hero of the Alliance: Dominant
    function() O(t[12172], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12172] = a:New(12172, f.Horde, 12173, true); end, -- Hero of the Horde: Dominant
    function() O(t[12171], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12171] = a:New(12171, nil, nil, true); end, -- Duelist: Legion Season 6
    function() O(t[12170], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12170] = a:New(12170, nil, nil, true); end, -- Rival: Legion Season 6
    function() O(t[12169], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12169] = a:New(12169, nil, nil, true); end, -- Challenger: Legion Season 6
    function() O(t[12168], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12168] = a:New(12168, nil, nil, true); end, -- Gladiator: Legion Season 7
    function() O(t[12167], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12167] = a:New(12167, nil, nil, true); end, -- Gladiator: Legion Season 6
    function() O(t[12140], "From", "PvP Season", 25, "Until", "PvP Season", 25); end,
    function() t[12140] = a:New(12140, nil, nil, true); end, -- Demonic Gladiator's Storm Dragon
    function() O(t[12139], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12139] = a:New(12139, nil, nil, true); end, -- Dominant Gladiator's Storm Dragon
    function() O(t[12137], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12137] = a:New(12137, f.Alliance, 12136, true); end, -- Dominant Combatant
    function() O(t[12136], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12136] = a:New(12136, f.Horde, 12137, true); end, -- Dominant Combatant
    function() O(t[12135], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12135] = a:New(12135, nil, nil, true); end, -- Dominant Elite
    function() O(t[12134], "From", "PvP Season", 24, "Until", "PvP Season", 24); end,
    function() t[12134] = a:New(12134, nil, nil, true); end, -- Dominant Gladiator: Legion Season 6
    function() t[12129] = a:New(12129); end, -- This is the War Room!
    function() O(t[12111], "From", "Version", "070300", "Before", "Version", "080001"); end,
    function() t[12111] = a:New(12111); end, -- Cutting Edge: Argus the Unmaker
    function() O(t[12110], "From", "Version", "070300", "Before", "Version", "080001"); end,
    function() t[12110] = a:New(12110); end, -- Ahead of the Curve: Argus the Unmaker
    function() O(t[12109], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12109] = a:New(12109, nil, nil, true); end, -- Twenty-One Arms Salute
    function() O(t[12108], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[12108] = a:New(12108, nil, nil, true); end, -- Double Decade of Dominance
    function() t[12104] = a:New(12104); end, -- And We're All Out of Mana Buns
    function() t[12103] = a:New(12103); end, -- ...And Chew Mana Buns
    function() t[12102] = a:New(12102); end, -- To Kill Demons...
    function() t[12101] = a:New(12101); end, -- We Came Here For Two Reasons
    function() t[12100] = a:New(12100); end, -- Family Fighter
    function() t[12099] = a:New(12099); end, -- Unstoppable Undead
    function() t[12098] = a:New(12098); end, -- Mechanical Melee
    function() t[12097] = a:New(12097); end, -- Magical Mayhem
    function() t[12096] = a:New(12096); end, -- Humanoid Havoc
    function() t[12095] = a:New(12095); end, -- Fierce Fliers
    function() t[12094] = a:New(12094); end, -- Elemental Escalation
    function() t[12093] = a:New(12093); end, -- Draconic Destruction
    function() t[12092] = a:New(12092); end, -- Critical Critters
    function() t[12091] = a:New(12091); end, -- Beast Blitz
    function() O(t[12090], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12090] = a:New(12090, nil, nil, true); end, -- Fierce Elite
    function() t[12089] = a:New(12089); end, -- Aquatic Assault
    function() t[12088] = a:New(12088); end, -- Anomalous Animals of Argus
    function() t[12087] = a:New(12087, f.Alliance); end, -- The Reining Champion
    function() t[12084] = a:New(12084); end, -- Infused and Abused
    function() t[12083] = a:New(12083); end, -- Paragon of Argus
    function() t[12081] = a:New(12081); end, -- Officer of the Light
    function() t[12079] = a:New(12079); end, -- Raiding with Leashes V: Cuteaclysm
    function() t[12078] = a:New(12078); end, -- Commander of Argus
    function() t[12077] = a:New(12077); end, -- Adventurer of Argus
    function() t[12076] = a:New(12076); end, -- Protector of the Argussian Reach
    function() t[12074] = a:New(12074); end, -- "Shoot First, Loot Later"
    function() t[12073] = a:New(12073); end, -- Locked and Loaded
    function() O(t[12072], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[12072] = a:New(12072); end, -- Now You're Cooking with Netherlight
    function() O(t[12071], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[12071] = a:New(12071); end, -- Crucible's Promise
    function() t[12069] = a:New(12069); end, -- Explore Argus
    function() t[12067] = a:New(12067); end, -- Spheres of Influence
    function() t[12066] = a:New(12066); end, -- You Are Now Prepared!
    function() t[12065] = a:New(12065); end, -- Hounds Good To Me
    function() t[12046] = a:New(12046); end, -- Remember the Titans
    function() O(t[12045], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12045] = a:New(12045, nil, nil, true); end, -- Gladiator: Legion Season 5
    function() O(t[12044], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12044] = a:New(12044, f.Horde, 12040, true); end, -- Soldier of the Horde: Legion Season 5
    function() O(t[12043], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12043] = a:New(12043, f.Horde, 12039, true); end, -- Defender of the Horde: Legion Season 5
    function() O(t[12042], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12042] = a:New(12042, f.Horde, 12038, true); end, -- Guardian of the Horde: Legion Season 5
    function() O(t[12041], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12041] = a:New(12041, f.Horde, 12037, true); end, -- Hero of the Horde: Fierce
    function() O(t[12040], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12040] = a:New(12040, f.Alliance, 12044, true); end, -- Soldier of the Alliance: Legion Season 5
    function() O(t[12039], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12039] = a:New(12039, f.Alliance, 12043, true); end, -- Defender of the Alliance: Legion Season 5
    function() O(t[12038], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12038] = a:New(12038, f.Alliance, 12042, true); end, -- Guardian of the Alliance: Legion Season 5
    function() O(t[12037], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12037] = a:New(12037, f.Alliance, 12041, true); end, -- Hero of the Alliance: Fierce
    function() O(t[12036], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12036] = a:New(12036, nil, nil, true); end, -- Challenger: Legion Season 5
    function() O(t[12035], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12035] = a:New(12035, nil, nil, true); end, -- Rival: Legion Season 5
    function() O(t[12034], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12034] = a:New(12034, nil, nil, true); end, -- Duelist: Legion Season 5
    function() O(t[12032], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12032] = a:New(12032, f.Alliance, 12031, true); end, -- Fierce Combatant
    function() O(t[12031], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12031] = a:New(12031, f.Horde, 12032, true); end, -- Fierce Combatant
    function() t[12030] = a:New(12030); end, -- The World Revolves Around Me
    function() t[12028] = a:New(12028); end, -- Envision Invasion Eradication
    function() t[12026] = a:New(12026); end, -- Invasion Obliteration
    function() T(t[12021], u[1378]); end, -- Fierce Combatant's Plate Armor (Combatant I)
    function() T(t[12021], u[1422]); end, -- Fierce Gladiator's Plate Armor (Gladiator)
    function() T(t[12021], u[1399]); end, -- Fierce Gladiator's Plate Armor (Elite)
    function() T(t[12021], u[1368]); end, -- Fierce Combatant's Scaled Armor (Combatant I)
    function() T(t[12021], u[1412]); end, -- Fierce Gladiator's Scaled Armor (Gladiator)
    function() T(t[12021], u[1388]); end, -- Fierce Gladiator's Scaled Armor (Elite)
    function() T(t[12021], u[1362]); end, -- Fierce Combatant's Chain Armor (Combatant I)
    function() T(t[12021], u[1406]); end, -- Fierce Gladiator's Chain Armor (Gladiator)
    function() T(t[12021], u[1382]); end, -- Fierce Gladiator's Chain Armor (Elite)
    function() T(t[12021], u[1372]); end, -- Fierce Combatant's Leather Armor (Combatant I)
    function() T(t[12021], u[1416]); end, -- Fierce Gladiator's Leather Armor (Gladiator)
    function() T(t[12021], u[1392]); end, -- Fierce Gladiator's Leather Armor (Elite)
    function() T(t[12021], u[1370]); end, -- Fierce Combatant's Satin Armor (Combatant I)
    function() T(t[12021], u[1414]); end, -- Fierce Gladiator's Satin Armor (Gladiator)
    function() T(t[12021], u[1390]); end, -- Fierce Gladiator's Satin Armor (Elite)
    function() T(t[12021], u[1348]); end, -- Fierce Combatant's Dreadplate Armor (Combatant I)
    function() T(t[12021], u[1400]); end, -- Fierce Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[12021], u[1352]); end, -- Fierce Gladiator's Dreadplate Armor (Elite)
    function() T(t[12021], u[1374]); end, -- Fierce Combatant's Ringmail Armor (Combatant I)
    function() T(t[12021], u[1418]); end, -- Fierce Gladiator's Ringmail Armor (Gladiator)
    function() T(t[12021], u[1394]); end, -- Fierce Gladiator's Ringmail Armor (Elite)
    function() T(t[12021], u[1364]); end, -- Fierce Combatant's Silk Armor (Combatant I)
    function() T(t[12021], u[1408]); end, -- Fierce Gladiator's Silk Armor (Gladiator)
    function() T(t[12021], u[1384]); end, -- Fierce Gladiator's Silk Armor (Elite)
    function() T(t[12021], u[1376]); end, -- Fierce Combatant's Felweave Armor (Combatant I)
    function() T(t[12021], u[1420]); end, -- Fierce Gladiator's Felweave Armor (Gladiator)
    function() T(t[12021], u[1396]); end, -- Fierce Gladiator's Felweave Armor (Elite)
    function() T(t[12021], u[1366]); end, -- Fierce Combatant's Ironskin Armor (Combatant I)
    function() T(t[12021], u[1410]); end, -- Fierce Gladiator's Ironskin Armor (Gladiator)
    function() T(t[12021], u[1386]); end, -- Fierce Gladiator's Ironskin Armor (Elite)
    function() T(t[12021], u[1360]); end, -- Fierce Combatant's Dragonhide Armor (Combatant I)
    function() T(t[12021], u[1404]); end, -- Fierce Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[12021], u[1380]); end, -- Fierce Gladiator's Dragonhide Armor (Elite)
    function() T(t[12021], u[1354]); end, -- Fierce Combatant's Felskin Armor (Combatant I)
    function() T(t[12021], u[1402]); end, -- Fierce Gladiator's Felskin Armor (Gladiator)
    function() T(t[12021], u[1358]); end, -- Fierce Gladiator's Felskin Armor (Elite)
    function() T(t[12021], u[1379]); end, -- Fierce Combatant's Plate Armor (Combatant I)
    function() T(t[12021], u[1423]); end, -- Fierce Gladiator's Plate Armor (Gladiator)
    function() T(t[12021], u[1398]); end, -- Fierce Gladiator's Plate Armor (Elite)
    function() T(t[12021], u[1369]); end, -- Fierce Combatant's Scaled Armor (Combatant I)
    function() T(t[12021], u[1413]); end, -- Fierce Gladiator's Scaled Armor (Gladiator)
    function() T(t[12021], u[1389]); end, -- Fierce Gladiator's Scaled Armor (Elite)
    function() T(t[12021], u[1363]); end, -- Fierce Combatant's Chain Armor (Combatant I)
    function() T(t[12021], u[1407]); end, -- Fierce Gladiator's Chain Armor (Gladiator)
    function() T(t[12021], u[1383]); end, -- Fierce Gladiator's Chain Armor (Elite)
    function() T(t[12021], u[1373]); end, -- Fierce Combatant's Leather Armor (Combatant I)
    function() T(t[12021], u[1417]); end, -- Fierce Gladiator's Leather Armor (Gladiator)
    function() T(t[12021], u[1393]); end, -- Fierce Gladiator's Leather Armor (Elite)
    function() T(t[12021], u[1371]); end, -- Fierce Combatant's Satin Armor (Combatant I)
    function() T(t[12021], u[1415]); end, -- Fierce Gladiator's Satin Armor (Gladiator)
    function() T(t[12021], u[1391]); end, -- Fierce Gladiator's Satin Armor (Elite)
    function() T(t[12021], u[1349]); end, -- Fierce Combatant's Dreadplate Armor (Combatant I)
    function() T(t[12021], u[1401]); end, -- Fierce Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[12021], u[1353]); end, -- Fierce Gladiator's Dreadplate Armor (Elite)
    function() T(t[12021], u[1375]); end, -- Fierce Combatant's Ringmail Armor (Combatant I)
    function() T(t[12021], u[1419]); end, -- Fierce Gladiator's Ringmail Armor (Gladiator)
    function() T(t[12021], u[1395]); end, -- Fierce Gladiator's Ringmail Armor (Elite)
    function() T(t[12021], u[1365]); end, -- Fierce Combatant's Silk Armor (Combatant I)
    function() T(t[12021], u[1409]); end, -- Fierce Gladiator's Silk Armor (Gladiator)
    function() T(t[12021], u[1385]); end, -- Fierce Gladiator's Silk Armor (Elite)
    function() T(t[12021], u[1377]); end, -- Fierce Combatant's Felweave Armor (Combatant I)
    function() T(t[12021], u[1421]); end, -- Fierce Gladiator's Felweave Armor (Gladiator)
    function() T(t[12021], u[1397]); end, -- Fierce Gladiator's Felweave Armor (Elite)
    function() T(t[12021], u[1367]); end, -- Fierce Combatant's Ironskin Armor (Combatant I)
    function() T(t[12021], u[1411]); end, -- Fierce Gladiator's Ironskin Armor (Gladiator)
    function() T(t[12021], u[1387]); end, -- Fierce Gladiator's Ironskin Armor (Elite)
    function() T(t[12021], u[1361]); end, -- Fierce Combatant's Dragonhide Armor (Combatant I)
    function() T(t[12021], u[1405]); end, -- Fierce Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[12021], u[1381]); end, -- Fierce Gladiator's Dragonhide Armor (Elite)
    function() T(t[12021], u[1355]); end, -- Fierce Combatant's Felskin Armor (Combatant I)
    function() T(t[12021], u[1403]); end, -- Fierce Gladiator's Felskin Armor (Gladiator)
    function() T(t[12021], u[1359]); end, -- Fierce Gladiator's Felskin Armor (Elite)
    function() t[12021] = a:New(12021); end, -- Claws Out
    function() T(t[12020], u[1519]); end, -- Juggernaut Battlegear (Raid Finder)
    function() T(t[12020], u[1516]); end, -- Juggernaut Battlegear (Normal)
    function() T(t[12020], u[1517]); end, -- Juggernaut Battlegear (Heroic)
    function() T(t[12020], u[1518]); end, -- Juggernaut Battlegear (Mythic)
    function() T(t[12020], u[1499]); end, -- Light's Vanguard Battleplate (Raid Finder)
    function() T(t[12020], u[1496]); end, -- Light's Vanguard Battleplate (Normal)
    function() T(t[12020], u[1497]); end, -- Light's Vanguard Battleplate (Heroic)
    function() T(t[12020], u[1498]); end, -- Light's Vanguard Battleplate (Mythic)
    function() T(t[12020], u[1487]); end, -- Serpentstalker Guise (Raid Finder)
    function() T(t[12020], u[1484]); end, -- Serpentstalker Guise (Normal)
    function() T(t[12020], u[1485]); end, -- Serpentstalker Guise (Heroic)
    function() T(t[12020], u[1486]); end, -- Serpentstalker Guise (Mythic)
    function() T(t[12020], u[1507]); end, -- Regalia of the Dashing Scoundrel (Raid Finder)
    function() T(t[12020], u[1504]); end, -- Regalia of the Dashing Scoundrel (Normal)
    function() T(t[12020], u[1505]); end, -- Regalia of the Dashing Scoundrel (Heroic)
    function() T(t[12020], u[1506]); end, -- Regalia of the Dashing Scoundrel (Mythic)
    function() T(t[12020], u[1503]); end, -- Gilded Seraph's Raiment (Raid Finder)
    function() T(t[12020], u[1500]); end, -- Gilded Seraph's Raiment (Normal)
    function() T(t[12020], u[1501]); end, -- Gilded Seraph's Raiment (Heroic)
    function() T(t[12020], u[1502]); end, -- Gilded Seraph's Raiment (Mythic)
    function() T(t[12020], u[1475]); end, -- Dreadwake Armor (Raid Finder)
    function() T(t[12020], u[1472]); end, -- Dreadwake Armor (Normal)
    function() T(t[12020], u[1473]); end, -- Dreadwake Armor (Heroic)
    function() T(t[12020], u[1474]); end, -- Dreadwake Armor (Mythic)
    function() T(t[12020], u[1511]); end, -- Garb of Venerated Spirits (Raid Finder)
    function() T(t[12020], u[1508]); end, -- Garb of Venerated Spirits (Normal)
    function() T(t[12020], u[1509]); end, -- Garb of Venerated Spirits (Heroic)
    function() T(t[12020], u[1510]); end, -- Garb of Venerated Spirits (Mythic)
    function() T(t[12020], u[1491]); end, -- Runebound Regalia (Raid Finder)
    function() T(t[12020], u[1488]); end, -- Runebound Regalia (Normal)
    function() T(t[12020], u[1489]); end, -- Runebound Regalia (Heroic)
    function() T(t[12020], u[1490]); end, -- Runebound Regalia (Mythic)
    function() T(t[12020], u[1515]); end, -- Grim Inquisitor's Regalia (Raid Finder)
    function() T(t[12020], u[1512]); end, -- Grim Inquisitor's Regalia (Normal)
    function() T(t[12020], u[1513]); end, -- Grim Inquisitor's Regalia (Heroic)
    function() T(t[12020], u[1514]); end, -- Grim Inquisitor's Regalia (Mythic)
    function() T(t[12020], u[1495]); end, -- Chi-Ji's Battlegear (Raid Finder)
    function() T(t[12020], u[1492]); end, -- Chi-Ji's Battlegear (Normal)
    function() T(t[12020], u[1493]); end, -- Chi-Ji's Battlegear (Heroic)
    function() T(t[12020], u[1494]); end, -- Chi-Ji's Battlegear (Mythic)
    function() T(t[12020], u[1483]); end, -- Bearmantle Battlegear (Raid Finder)
    function() T(t[12020], u[1480]); end, -- Bearmantle Battlegear (Normal)
    function() T(t[12020], u[1481]); end, -- Bearmantle Battlegear (Heroic)
    function() T(t[12020], u[1482]); end, -- Bearmantle Battlegear (Mythic)
    function() T(t[12020], u[1479]); end, -- Felreaper Vestments (Raid Finder)
    function() T(t[12020], u[1476]); end, -- Felreaper Vestments (Normal)
    function() T(t[12020], u[1477]); end, -- Felreaper Vestments (Heroic)
    function() T(t[12020], u[1478]); end, -- Felreaper Vestments (Mythic)
    function() t[12020] = a:New(12020); end, -- Argussy Up
    function() O(t[12010], "From", "PvP Season", 23, "Until", "PvP Season", 23); end,
    function() t[12010] = a:New(12010, nil, nil, true); end, -- Fierce Gladiator: Legion Season 5
    function() t[12009] = a:New(12009); end, -- Darker Side
    function() t[12008] = a:New(12008); end, -- Mythic: Seat of the Triumvirate
    function() t[12007] = a:New(12007); end, -- Heroic: Seat of the Triumvirate
    function() t[12005] = a:New(12005); end, -- Let it All Out
    function() t[12004] = a:New(12004); end, -- Welcome the Void
    function() t[12002] = a:New(12002); end, -- Mythic: Argus the Unmaker
    function() t[12001] = a:New(12001); end, -- Mythic: Aggramar
    function() t[12000] = a:New(12000); end, -- Mythic: The Coven of Shivarra
    function() t[11999] = a:New(11999); end, -- Mythic: Varimathras
    function() t[11998] = a:New(11998); end, -- Mythic: Kin'garoth
    function() t[11997] = a:New(11997); end, -- Mythic: Imonar the Soulhunter
    function() t[11996] = a:New(11996); end, -- Mythic: Eonar
    function() t[11995] = a:New(11995); end, -- Mythic: Portal Keeper Hasabel
    function() t[11994] = a:New(11994); end, -- Mythic: Antoran High Command
    function() t[11993] = a:New(11993); end, -- Mythic: Hounds of Sargeras
    function() t[11992] = a:New(11992); end, -- Mythic: Garothi Worldbreaker
    function() t[11991] = a:New(11991); end, -- Seat of the Pantheon
    function() t[11990] = a:New(11990); end, -- Hope's End
    function() t[11989] = a:New(11989); end, -- Forbidden Descent
    function() t[11988] = a:New(11988); end, -- Light's Breach
    function() t[11987] = a:New(11987); end, -- Glory of the Argus Raider
    function() t[11949] = a:New(11949); end, -- Hard to Kill
    function() t[11948] = a:New(11948); end, -- Together We Stand
    function() t[11941] = a:New(11941); end, -- Chromie Homie
    function() t[11931] = a:New(11931); end, -- Rides of War
    function() t[11930] = a:New(11930); end, -- Worm-monger
    function() t[11929] = a:New(11929); end, -- Heroic: Return to Karazhan
    function() t[11928] = a:New(11928); end, -- Portal Combat
    function() t[11921] = a:New(11921); end, -- Mosh Pit
    function() t[11920] = a:New(11920); end, -- Perfect Performance
    function() t[11919] = a:New(11919); end, -- Taking this Show on the Road
    function() t[11918] = a:New(11918); end, -- "Hey, You're a Rockstar!"
    function() t[11915] = a:New(11915); end, -- Don't Sweat the Technique
    function() t[11913] = a:New(11913); end, -- Don't Play With That In The House
    function() O(t[11875], "From", "Version", "070205", "Before", "Version", "070300"); end,
    function() t[11875] = a:New(11875); end, -- Cutting Edge: Kil'jaeden
    function() O(t[11874], "From", "Version", "070205", "Before", "Version", "070300"); end,
    function() t[11874] = a:New(11874); end, -- Ahead of the Curve: Kil'jaeden
    function() t[11869] = a:New(11869); end, -- I'll Hold These For You Until You Get Out
    function() t[11868] = a:New(11868, f.Horde, 12497); end, -- The Dark Heart of Nazmir
    function() t[11861] = a:New(11861, f.Horde, 12473); end, -- The Throne of Zuldazar
    function() t[11856] = a:New(11856); end, -- Pet Battle Challenge: Deadmines
    function() O(t[11848]); end,
    function() t[11848] = a:New(11848); end, -- WoW's 13th Anniversary
    function() t[11846] = a:New(11846); end, -- Champions of Legionfall
    function() t[11841] = a:New(11841); end, -- Naxt Victim
    function() t[11802] = a:New(11802); end, -- Bringing Home the Beacon
    function() t[11796] = a:New(11796); end, -- Armies of Legionfall
    function() t[11790] = a:New(11790); end, -- Deceiver's Fall
    function() t[11789] = a:New(11789); end, -- Chamber of the Avatar
    function() t[11788] = a:New(11788); end, -- Wailing Halls
    function() t[11787] = a:New(11787); end, -- The Gates of Hell
    function() t[11786] = a:New(11786); end, -- Terrors of the Shore
    function() t[11781] = a:New(11781); end, -- Mythic: Kil'jaeden
    function() t[11780] = a:New(11780); end, -- Mythic: Fallen Avatar
    function() t[11779] = a:New(11779); end, -- Mythic: Maiden of Vigilance
    function() t[11778] = a:New(11778); end, -- Mythic: The Desolate Host
    function() t[11777] = a:New(11777); end, -- Mythic: Sisters of the Moon
    function() t[11776] = a:New(11776); end, -- Mythic: Mistress Sassz'ine
    function() t[11775] = a:New(11775); end, -- Mythic: Harjatan
    function() t[11774] = a:New(11774); end, -- Mythic: Demonic Inquisition
    function() t[11773] = a:New(11773); end, -- "Wax On, Wax Off"
    function() O(t[11772], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11772] = a:New(11772); end, -- Power Ascended
    function() t[11770] = a:New(11770); end, -- Dark Souls
    function() t[11769] = a:New(11769); end, -- A Steamy Romance Saga
    function() t[11768] = a:New(11768); end, -- Boom Bloom
    function() t[11767] = a:New(11767); end, -- Mythic: Goroth
    function() t[11765] = a:New(11765); end, -- Pet Battle Challenge: Wailing Caverns
    function() t[11763] = a:New(11763); end, -- Glory of the Tomb Raider
    function() T(t[11762], u[186]); end, -- Funerary Plate of the Chosen Dead (Raid Finder)
    function() T(t[11762], u[183]); end, -- Funerary Plate of the Chosen Dead (Normal)
    function() T(t[11762], u[184]); end, -- Funerary Plate of the Chosen Dead (Heroic)
    function() T(t[11762], u[185]); end, -- Funerary Plate of the Chosen Dead (Mythic)
    function() T(t[11762], u[182]); end, -- Chains of the Chosen Dead (Raid Finder)
    function() T(t[11762], u[179]); end, -- Chains of the Chosen Dead (Normal)
    function() T(t[11762], u[180]); end, -- Chains of the Chosen Dead (Heroic)
    function() T(t[11762], u[181]); end, -- Chains of the Chosen Dead (Mythic)
    function() T(t[11762], u[174]); end, -- Regalia of the Chosen Dead (Raid Finder)
    function() T(t[11762], u[171]); end, -- Regalia of the Chosen Dead (Normal)
    function() T(t[11762], u[172]); end, -- Regalia of the Chosen Dead (Heroic)
    function() T(t[11762], u[173]); end, -- Regalia of the Chosen Dead (Mythic)
    function() T(t[11762], u[178]); end, -- Garb of the Chosen Dead (Raid Finder)
    function() T(t[11762], u[175]); end, -- Garb of the Chosen Dead (Normal)
    function() T(t[11762], u[176]); end, -- Garb of the Chosen Dead (Heroic)
    function() T(t[11762], u[177]); end, -- Garb of the Chosen Dead (Mythic)
    function() t[11762] = a:New(11762); end, -- Can I Get A Helya
    function() t[11761] = a:New(11761); end, -- Azeroth's Next Top Model
    function() T(t[11760], u[1296]); end, -- Titanic Onslaught Armor (Raid Finder)
    function() T(t[11760], u[1293]); end, -- Titanic Onslaught Armor (Normal)
    function() T(t[11760], u[1294]); end, -- Titanic Onslaught Armor (Heroic)
    function() T(t[11760], u[1295]); end, -- Titanic Onslaught Armor (Mythic)
    function() T(t[11760], u[2305]); end, -- Titanic Onslaught Armor (Timewarped)
    function() T(t[11760], u[1315]); end, -- Radiant Lightbringer Armor (Raid Finder)
    function() T(t[11760], u[1313]); end, -- Radiant Lightbringer Armor (Normal)
    function() T(t[11760], u[1316]); end, -- Radiant Lightbringer Armor (Heroic)
    function() T(t[11760], u[1314]); end, -- Radiant Lightbringer Armor (Mythic)
    function() T(t[11760], u[2300]); end, -- Radiant Lightbringer Armor (Timewarped)
    function() T(t[11760], u[1327]); end, -- Wildstalker Armor (Raid Finder)
    function() T(t[11760], u[1325]); end, -- Wildstalker Armor (Normal)
    function() T(t[11760], u[1328]); end, -- Wildstalker Armor (Heroic)
    function() T(t[11760], u[1326]); end, -- Wildstalker Armor (Mythic)
    function() T(t[11760], u[2297]); end, -- Wildstalker Armor (Timewarped)
    function() T(t[11760], u[1306]); end, -- Fanged Slayer's Armor (Raid Finder)
    function() T(t[11760], u[1305]); end, -- Fanged Slayer's Armor (Normal)
    function() T(t[11760], u[1307]); end, -- Fanged Slayer's Armor (Heroic)
    function() T(t[11760], u[1308]); end, -- Fanged Slayer's Armor (Mythic)
    function() T(t[11760], u[2302]); end, -- Fanged Slayer's Armor (Timewarped)
    function() T(t[11760], u[1342]); end, -- Vestments of Blind Absolution (Raid Finder)
    function() T(t[11760], u[1309]); end, -- Vestments of Blind Absolution (Normal)
    function() T(t[11760], u[1312]); end, -- Vestments of Blind Absolution (Heroic)
    function() T(t[11760], u[1310]); end, -- Vestments of Blind Absolution (Mythic)
    function() T(t[11760], u[2301]); end, -- Vestments of Blind Absolution (Timewarped)
    function() T(t[11760], u[1339]); end, -- Gravewarden Armaments (Raid Finder)
    function() T(t[11760], u[1337]); end, -- Gravewarden Armaments (Normal)
    function() T(t[11760], u[1340]); end, -- Gravewarden Armaments (Heroic)
    function() T(t[11760], u[1338]); end, -- Gravewarden Armaments (Mythic)
    function() T(t[11760], u[2294]); end, -- Gravewarden Armaments (Timewarped)
    function() T(t[11760], u[1302]); end, -- Regalia of the Skybreaker (Raid Finder)
    function() T(t[11760], u[1301]); end, -- Regalia of the Skybreaker (Normal)
    function() T(t[11760], u[1303]); end, -- Regalia of the Skybreaker (Heroic)
    function() T(t[11760], u[1304]); end, -- Regalia of the Skybreaker (Mythic)
    function() T(t[11760], u[2303]); end, -- Regalia of the Skybreaker (Timewarped)
    function() T(t[11760], u[1323]); end, -- Regalia of the Arcane Tempest (Raid Finder)
    function() T(t[11760], u[1321]); end, -- Regalia of the Arcane Tempest (Normal)
    function() T(t[11760], u[1324]); end, -- Regalia of the Arcane Tempest (Heroic)
    function() T(t[11760], u[1322]); end, -- Regalia of the Arcane Tempest (Mythic)
    function() T(t[11760], u[2298]); end, -- Regalia of the Arcane Tempest (Timewarped)
    function() T(t[11760], u[1300]); end, -- Diabolic Raiment (Raid Finder)
    function() T(t[11760], u[1297]); end, -- Diabolic Raiment (Normal)
    function() T(t[11760], u[1298]); end, -- Diabolic Raiment (Heroic)
    function() T(t[11760], u[1299]); end, -- Diabolic Raiment (Mythic)
    function() T(t[11760], u[2304]); end, -- Diabolic Raiment (Timewarped)
    function() T(t[11760], u[1319]); end, -- Xuen's Battlegear (Raid Finder)
    function() T(t[11760], u[1317]); end, -- Xuen's Battlegear (Normal)
    function() T(t[11760], u[1320]); end, -- Xuen's Battlegear (Heroic)
    function() T(t[11760], u[1318]); end, -- Xuen's Battlegear (Mythic)
    function() T(t[11760], u[2299]); end, -- Xuen's Battlegear (Timewarped)
    function() T(t[11760], u[1331]); end, -- Stormheart Raiment (Raid Finder)
    function() T(t[11760], u[1329]); end, -- Stormheart Raiment (Normal)
    function() T(t[11760], u[1332]); end, -- Stormheart Raiment (Heroic)
    function() T(t[11760], u[1330]); end, -- Stormheart Raiment (Mythic)
    function() T(t[11760], u[2296]); end, -- Stormheart Raiment (Timewarped)
    function() T(t[11760], u[1335]); end, -- Demonbane Armor (Raid Finder)
    function() T(t[11760], u[1333]); end, -- Demonbane Armor (Normal)
    function() T(t[11760], u[1336]); end, -- Demonbane Armor (Heroic)
    function() T(t[11760], u[1334]); end, -- Demonbane Armor (Mythic)
    function() T(t[11760], u[2295]); end, -- Demonbane Armor (Timewarped)
    function() t[11760] = a:New(11760); end, -- Retro Trend
    function() T(t[11759], u[440]); end, -- Battleplate of the Prehistoric Marauder (Raid Finder)
    function() T(t[11759], u[438]); end, -- Battleplate of the Prehistoric Marauder (Normal)
    function() T(t[11759], u[439]); end, -- Battleplate of the Prehistoric Marauder (Mythic)
    function() T(t[11759], u[489]); end, -- Vestments of Winged Triumph (Raid Finder)
    function() T(t[11759], u[487]); end, -- Vestments of Winged Triumph (Normal)
    function() T(t[11759], u[488]); end, -- Vestments of Winged Triumph (Mythic)
    function() T(t[11759], u[541]); end, -- Battlegear of the Unblinking Vigil (Raid Finder)
    function() T(t[11759], u[539]); end, -- Battlegear of the Unblinking Vigil (Normal)
    function() T(t[11759], u[540]); end, -- Battlegear of the Unblinking Vigil (Mythic)
    function() T(t[11759], u[473]); end, -- Barbed Assassin Battlegear (Raid Finder)
    function() T(t[11759], u[471]); end, -- Barbed Assassin Battlegear (Normal)
    function() T(t[11759], u[472]); end, -- Barbed Assassin Battlegear (Mythic)
    function() T(t[11759], u[333]); end, -- Regalia of Ternion Glory (Raid Finder)
    function() T(t[11759], u[331]); end, -- Regalia of Ternion Glory (Normal)
    function() T(t[11759], u[332]); end, -- Regalia of Ternion Glory (Mythic)
    function() T(t[11759], u[574]); end, -- Battleplate of Cyclopean Dread (Raid Finder)
    function() T(t[11759], u[572]); end, -- Battleplate of Cyclopean Dread (Normal)
    function() T(t[11759], u[573]); end, -- Battleplate of Cyclopean Dread (Mythic)
    function() T(t[11759], u[423]); end, -- Regalia of Celestial Harmony (Raid Finder)
    function() T(t[11759], u[421]); end, -- Regalia of Celestial Harmony (Normal)
    function() T(t[11759], u[422]); end, -- Regalia of Celestial Harmony (Mythic)
    function() T(t[11759], u[525]); end, -- Chronomancer Regalia (Raid Finder)
    function() T(t[11759], u[523]); end, -- Chronomancer Regalia (Normal)
    function() T(t[11759], u[524]); end, -- Chronomancer Regalia (Mythic)
    function() T(t[11759], u[457]); end, -- Regalia of the Horned Nightmare (Raid Finder)
    function() T(t[11759], u[455]); end, -- Regalia of the Horned Nightmare (Normal)
    function() T(t[11759], u[456]); end, -- Regalia of the Horned Nightmare (Mythic)
    function() T(t[11759], u[508]); end, -- Vestments of the Seven Sacred Seals (Raid Finder)
    function() T(t[11759], u[506]); end, -- Vestments of the Seven Sacred Seals (Normal)
    function() T(t[11759], u[507]); end, -- Vestments of the Seven Sacred Seals (Mythic)
    function() T(t[11759], u[559]); end, -- Vestments of the Shattered Vale (Raid Finder)
    function() T(t[11759], u[557]); end, -- Vestments of the Shattered Vale (Normal)
    function() T(t[11759], u[558]); end, -- Vestments of the Shattered Vale (Mythic)
    function() t[11759] = a:New(11759); end, -- Yaass'shaarj
    function() T(t[11758], u[442]); end, -- Battleplate of the Last Mogu (Raid Finder)
    function() T(t[11758], u[441]); end, -- Battleplate of the Last Mogu (Normal)
    function() T(t[11758], u[443]); end, -- Battleplate of the Last Mogu (Heroic)
    function() T(t[11758], u[492]); end, -- Battlegear of the Lightning Emperor (Raid Finder)
    function() T(t[11758], u[490]); end, -- Battlegear of the Lightning Emperor (Normal)
    function() T(t[11758], u[491]); end, -- Battlegear of the Lightning Emperor (Heroic)
    function() T(t[11758], u[543]); end, -- Battlegear of the Saurok Stalker (Raid Finder)
    function() T(t[11758], u[542]); end, -- Battlegear of the Saurok Stalker (Normal)
    function() T(t[11758], u[544]); end, -- Battlegear of the Saurok Stalker (Heroic)
    function() T(t[11758], u[476]); end, -- Nine-Tail Battlegear (Raid Finder)
    function() T(t[11758], u[474]); end, -- Nine-Tail Battlegear (Normal)
    function() T(t[11758], u[475]); end, -- Nine-Tail Battlegear (Heroic)
    function() T(t[11758], u[335]); end, -- Regalia of the Exorcist (Raid Finder)
    function() T(t[11758], u[310]); end, -- Regalia of the Exorcist (Normal)
    function() T(t[11758], u[334]); end, -- Regalia of the Exorcist (Heroic)
    function() T(t[11758], u[576]); end, -- Battleplate of the All-Consuming Maw (Raid Finder)
    function() T(t[11758], u[575]); end, -- Battleplate of the All-Consuming Maw (Normal)
    function() T(t[11758], u[577]); end, -- Battleplate of the All-Consuming Maw (Heroic)
    function() T(t[11758], u[426]); end, -- Regalia of the Witch Doctor (Raid Finder)
    function() T(t[11758], u[424]); end, -- Regalia of the Witch Doctor (Normal)
    function() T(t[11758], u[425]); end, -- Regalia of the Witch Doctor (Heroic)
    function() T(t[11758], u[528]); end, -- Regalia of the Chromatic Hydra (Raid Finder)
    function() T(t[11758], u[526]); end, -- Regalia of the Chromatic Hydra (Normal)
    function() T(t[11758], u[527]); end, -- Regalia of the Chromatic Hydra (Heroic)
    function() T(t[11758], u[459]); end, -- Regalia of the Thousandfold Hells (Raid Finder)
    function() T(t[11758], u[458]); end, -- Regalia of the Thousandfold Hells (Normal)
    function() T(t[11758], u[460]); end, -- Regalia of the Thousandfold Hells (Heroic)
    function() T(t[11758], u[512]); end, -- Fire-Charm Vestments (Raid Finder)
    function() T(t[11758], u[510]); end, -- Fire-Charm Vestments (Normal)
    function() T(t[11758], u[511]); end, -- Fire-Charm Vestments (Heroic)
    function() T(t[11758], u[562]); end, -- Vestments of the Haunted Forest (Raid Finder)
    function() T(t[11758], u[560]); end, -- Vestments of the Haunted Forest (Normal)
    function() T(t[11758], u[561]); end, -- Vestments of the Haunted Forest (Heroic)
    function() t[11758] = a:New(11758); end, -- Thunderwear
    function() T(t[11757], u[446]); end, -- Battleplate of Resounding Rings (Raid Finder)
    function() T(t[11757], u[444]); end, -- Battleplate of Resounding Rings (Normal)
    function() T(t[11757], u[445]); end, -- Battleplate of Resounding Rings (Heroic)
    function() T(t[11757], u[495]); end, -- White Tiger Battlegear (Raid Finder)
    function() T(t[11757], u[493]); end, -- White Tiger Battlegear (Normal)
    function() T(t[11757], u[494]); end, -- White Tiger Battlegear (Heroic)
    function() T(t[11757], u[546]); end, -- Yaungol Slayer Battlegear (Raid Finder)
    function() T(t[11757], u[545]); end, -- Yaungol Slayer Battlegear (Normal)
    function() T(t[11757], u[547]); end, -- Yaungol Slayer Battlegear (Heroic)
    function() T(t[11757], u[479]); end, -- Battlegear of the Thousandfold Blades (Raid Finder)
    function() T(t[11757], u[478]); end, -- Battlegear of the Thousandfold Blades (Normal)
    function() T(t[11757], u[477]); end, -- Battlegear of the Thousandfold Blades (Heroic)
    function() T(t[11757], u[337]); end, -- Guardian Serpent Regalia (Raid Finder)
    function() T(t[11757], u[336]); end, -- Guardian Serpent Regalia (Normal)
    function() T(t[11757], u[429]); end, -- Guardian Serpent Regalia (Heroic)
    function() T(t[11757], u[579]); end, -- Plate of the Lost Catacomb (Raid Finder)
    function() T(t[11757], u[578]); end, -- Plate of the Lost Catacomb (Normal)
    function() T(t[11757], u[580]); end, -- Plate of the Lost Catacomb (Heroic)
    function() T(t[11757], u[428]); end, -- Regalia of the Firebird (Raid Finder)
    function() T(t[11757], u[427]); end, -- Regalia of the Firebird (Normal)
    function() T(t[11757], u[338]); end, -- Regalia of the Firebird (Heroic)
    function() T(t[11757], u[531]); end, -- Regalia of the Burning Scroll (Raid Finder)
    function() T(t[11757], u[529]); end, -- Regalia of the Burning Scroll (Normal)
    function() T(t[11757], u[530]); end, -- Regalia of the Burning Scroll (Heroic)
    function() T(t[11757], u[462]); end, -- Sha Skin Regalia (Raid Finder)
    function() T(t[11757], u[461]); end, -- Sha Skin Regalia (Normal)
    function() T(t[11757], u[463]); end, -- Sha Skin Regalia (Heroic)
    function() T(t[11757], u[515]); end, -- Vestments of the Red Crane (Raid Finder)
    function() T(t[11757], u[513]); end, -- Vestments of the Red Crane (Normal)
    function() T(t[11757], u[514]); end, -- Vestments of the Red Crane (Heroic)
    function() T(t[11757], u[565]); end, -- Vestments of the Eternal Blossom (Raid Finder)
    function() T(t[11757], u[563]); end, -- Vestments of the Eternal Blossom (Normal)
    function() T(t[11757], u[564]); end, -- Vestments of the Eternal Blossom (Heroic)
    function() t[11757] = a:New(11757); end, -- Sha of Fabulous
    function() T(t[11756], u[650]); end, -- Colossal Dragonplate Battlegear (Raid Finder)
    function() T(t[11756], u[649]); end, -- Colossal Dragonplate Battlegear (Normal)
    function() T(t[11756], u[631]); end, -- Colossal Dragonplate Battlegear (Heroic)
    function() T(t[11756], u[697]); end, -- Battleplate of Radiant Glory (Raid Finder)
    function() T(t[11756], u[696]); end, -- Battleplate of Radiant Glory (Normal)
    function() T(t[11756], u[698]); end, -- Battleplate of Radiant Glory (Heroic)
    function() T(t[11756], u[729]); end, -- Wyrmstalker Battlegear (Raid Finder)
    function() T(t[11756], u[728]); end, -- Wyrmstalker Battlegear (Normal)
    function() T(t[11756], u[730]); end, -- Wyrmstalker Battlegear (Heroic)
    function() T(t[11756], u[681]); end, -- Blackfang Battleweave (Raid Finder)
    function() T(t[11756], u[680]); end, -- Blackfang Battleweave (Normal)
    function() T(t[11756], u[682]); end, -- Blackfang Battleweave (Heroic)
    function() T(t[11756], u[340]); end, -- Regalia of Dying Light (Raid Finder)
    function() T(t[11756], u[339]); end, -- Regalia of Dying Light (Normal)
    function() T(t[11756], u[341]); end, -- Regalia of Dying Light (Heroic)
    function() T(t[11756], u[832]); end, -- Necrotic Boneplate Armor (Raid Finder)
    function() T(t[11756], u[831]); end, -- Necrotic Boneplate Armor (Normal)
    function() T(t[11756], u[833]); end, -- Necrotic Boneplate Armor (Heroic)
    function() T(t[11756], u[632]); end, -- Spiritwalker's Regalia (Raid Finder)
    function() T(t[11756], u[630]); end, -- Spiritwalker's Regalia (Normal)
    function() T(t[11756], u[663]); end, -- Spiritwalker's Regalia (Heroic)
    function() T(t[11756], u[713]); end, -- Time Lord's Regalia (Raid Finder)
    function() T(t[11756], u[712]); end, -- Time Lord's Regalia (Normal)
    function() T(t[11756], u[714]); end, -- Time Lord's Regalia (Heroic)
    function() T(t[11756], u[665]); end, -- Vestments of the Faceless Shroud (Raid Finder)
    function() T(t[11756], u[664]); end, -- Vestments of the Faceless Shroud (Normal)
    function() T(t[11756], u[666]); end, -- Vestments of the Faceless Shroud (Heroic)
    function() T(t[11756], u[816]); end, -- Deep Earth Vestments (Raid Finder)
    function() T(t[11756], u[815]); end, -- Deep Earth Vestments (Normal)
    function() T(t[11756], u[817]); end, -- Deep Earth Vestments (Heroic)
    function() t[11756] = a:New(11756); end, -- Wardrobe of the Old Gods
    function() T(t[11755], u[651]); end, -- Molten Giant Battleplate (Normal)
    function() T(t[11755], u[652]); end, -- Molten Giant Battleplate (Heroic)
    function() T(t[11755], u[699]); end, -- Battleplate of Immolation (Normal)
    function() T(t[11755], u[700]); end, -- Battleplate of Immolation (Heroic)
    function() T(t[11755], u[731]); end, -- Flamewaker's Battlegear (Normal)
    function() T(t[11755], u[732]); end, -- Flamewaker's Battlegear (Heroic)
    function() T(t[11755], u[683]); end, -- Vestments of the Dark Phoenix (Normal)
    function() T(t[11755], u[684]); end, -- Vestments of the Dark Phoenix (Heroic)
    function() T(t[11755], u[342]); end, -- Regalia of the Cleansing Flame (Normal)
    function() T(t[11755], u[343]); end, -- Regalia of the Cleansing Flame (Heroic)
    function() T(t[11755], u[834]); end, -- Elementium Deathplate Battlearmor (Normal)
    function() T(t[11755], u[835]); end, -- Elementium Deathplate Battlearmor (Heroic)
    function() T(t[11755], u[633]); end, -- Volcanic Regalia (Normal)
    function() T(t[11755], u[634]); end, -- Volcanic Regalia (Heroic)
    function() T(t[11755], u[715]); end, -- Firehawk Robes of Conflagration (Normal)
    function() T(t[11755], u[716]); end, -- Firehawk Robes of Conflagration (Heroic)
    function() T(t[11755], u[667]); end, -- Balespider's Burning Vestments (Normal)
    function() T(t[11755], u[668]); end, -- Balespider's Burning Vestments (Heroic)
    function() T(t[11755], u[818]); end, -- Obsidian Arborweave Vestments (Normal)
    function() T(t[11755], u[819]); end, -- Obsidian Arborweave Vestments (Heroic)
    function() t[11755] = a:New(11755); end, -- Hot Couture
    function() T(t[11754], u[653]); end, -- Earthen Battleplate (Normal)
    function() T(t[11754], u[654]); end, -- Earthen Battleplate (Heroic)
    function() T(t[11754], u[701]); end, -- Reinforced Sapphirium Battleplate (Normal)
    function() T(t[11754], u[702]); end, -- Reinforced Sapphirium Battleplate (Heroic)
    function() T(t[11754], u[733]); end, -- Lightning-Charged Battlegear (Normal)
    function() T(t[11754], u[734]); end, -- Lightning-Charged Battlegear (Heroic)
    function() T(t[11754], u[685]); end, -- Wind Dancer's Regalia (Normal)
    function() T(t[11754], u[686]); end, -- Wind Dancer's Regalia (Heroic)
    function() T(t[11754], u[344]); end, -- Mercurial Regalia (Normal)
    function() T(t[11754], u[345]); end, -- Mercurial Regalia (Heroic)
    function() T(t[11754], u[836]); end, -- Magma Plated Battlearmor (Normal)
    function() T(t[11754], u[837]); end, -- Magma Plated Battlearmor (Heroic)
    function() T(t[11754], u[635]); end, -- Regalia of the Raging Elements (Normal)
    function() T(t[11754], u[636]); end, -- Regalia of the Raging Elements (Heroic)
    function() T(t[11754], u[717]); end, -- Firelord's Vestments (Normal)
    function() T(t[11754], u[718]); end, -- Firelord's Vestments (Heroic)
    function() T(t[11754], u[669]); end, -- Shadowflame Regalia (Normal)
    function() T(t[11754], u[670]); end, -- Shadowflame Regalia (Heroic)
    function() T(t[11754], u[820]); end, -- Stormrider's Vestments (Normal)
    function() T(t[11754], u[821]); end, -- Stormrider's Vestments (Heroic)
    function() t[11754] = a:New(11754); end, -- Glamour of Twilight
    function() T(t[11753], u[655]); end, -- Ymirjar Lord's Battlegear (10 Player (Normal))
    function() T(t[11753], u[656]); end, -- Sanctified Ymirjar Lord's Battlegear (25 Player (Normal))
    function() T(t[11753], u[298]); end, -- Sanctified Ymirjar Lord's Battlegear (25 Player (Heroic))
    function() T(t[11753], u[703]); end, -- Lightsworn Plate (10 Player (Normal))
    function() T(t[11753], u[704]); end, -- Sanctified Lightsworn Plate (25 Player (Normal))
    function() T(t[11753], u[705]); end, -- Sanctified Lightsworn Plate (25 Player (Heroic))
    function() T(t[11753], u[735]); end, -- Ahn'Kahar Blood Hunter's Battlegear (10 Player (Normal))
    function() T(t[11753], u[736]); end, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear (25 Player (Normal))
    function() T(t[11753], u[737]); end, -- Sanctified Ahn'Kahar Blood Hunter's Battlegear (25 Player (Heroic))
    function() T(t[11753], u[687]); end, -- Shadowblade's Battlegear (10 Player (Normal))
    function() T(t[11753], u[688]); end, -- Sanctified Shadowblade's Battlegear (25 Player (Normal))
    function() T(t[11753], u[689]); end, -- Sanctified Shadowblade's Battlegear (25 Player (Heroic))
    function() T(t[11753], u[346]); end, -- Crimson Acolyte Regalia (10 Player (Normal))
    function() T(t[11753], u[347]); end, -- Sanctified Crimson Acolyte Regalia (25 Player (Normal))
    function() T(t[11753], u[348]); end, -- Sanctified Crimson Acolyte Regalia (25 Player (Heroic))
    function() T(t[11753], u[838]); end, -- Scourgelord's Plate (10 Player (Normal))
    function() T(t[11753], u[839]); end, -- Sanctified Scourgelord's Plate (25 Player (Normal))
    function() T(t[11753], u[840]); end, -- Sanctified Scourgelord's Plate (25 Player (Heroic))
    function() T(t[11753], u[637]); end, -- Frost Witch's Regalia (10 Player (Normal))
    function() T(t[11753], u[638]); end, -- Frost Witch's Regalia (25 Player (Normal))
    function() T(t[11753], u[639]); end, -- Frost Witch's Regalia (25 Player (Heroic))
    function() T(t[11753], u[719]); end, -- Bloodmage's Regalia (10 Player (Normal))
    function() T(t[11753], u[720]); end, -- Sanctified Bloodmage's Regalia (25 Player (Normal))
    function() T(t[11753], u[721]); end, -- Sanctified Bloodmage's Regalia (25 Player (Heroic))
    function() T(t[11753], u[671]); end, -- Dark Coven's Regalia (10 Player (Normal))
    function() T(t[11753], u[672]); end, -- Sanctified Dark Coven's Regalia (25 Player (Normal))
    function() T(t[11753], u[673]); end, -- Sanctified Dark Coven's Regalia (25 Player (Heroic))
    function() T(t[11753], u[822]); end, -- Lasherweave Battlegear (10 Player (Normal))
    function() T(t[11753], u[823]); end, -- Sanctified Lasherweave Battlegear (25 Player (Normal))
    function() T(t[11753], u[824]); end, -- Sanctified Lasherweave Battlegear (25 Player (Heroic))
    function() t[11753] = a:New(11753); end, -- Winter Catalog
    function() T(t[11752], u[658]); end, -- Wrynn's Battlegear (10 Player (Normal))
    function() T(t[11752], u[706]); end, -- Turalyon's Plate (10 Player (Normal))
    function() T(t[11752], u[739]); end, -- Windrunner's Battlegear (10 Player (Normal))
    function() T(t[11752], u[690]); end, -- VanCleef's Battlegear (10 Player (Normal))
    function() T(t[11752], u[349]); end, -- Velen's Regalia (10 Player (Normal))
    function() T(t[11752], u[842]); end, -- Thassarian's Battlegear (10 Player (Normal))
    function() T(t[11752], u[640]); end, -- Nobundo's Garb (10 Player (Normal))
    function() T(t[11752], u[722]); end, -- Khadgar's Regalia (10 Player (Normal))
    function() T(t[11752], u[674]); end, -- Kel'Thuzad's Regalia (10 Player (Normal))
    function() T(t[11752], u[825]); end, -- Malfurion's Battlegear (10 Player (Normal))
    function() T(t[11752], u[657]); end, -- Hellscream's Battlegear (10 Player (Normal))
    function() T(t[11752], u[707]); end, -- Liadrin's Plate (10 Player (Normal))
    function() T(t[11752], u[738]); end, -- Windrunner's Pursuit (10 Player (Normal))
    function() T(t[11752], u[691]); end, -- Garona's Battlegear (10 Player (Normal))
    function() T(t[11752], u[350]); end, -- Zabra's Regalia (10 Player (Normal))
    function() T(t[11752], u[841]); end, -- Koltira's Battlegear (10 Player (Normal))
    function() T(t[11752], u[641]); end, -- Thrall's Garb (10 Player (Normal))
    function() T(t[11752], u[723]); end, -- Sunstrider's Regalia (10 Player (Normal))
    function() T(t[11752], u[675]); end, -- Gul'dan's Regalia (10 Player (Normal))
    function() T(t[11752], u[826]); end, -- Runetotem's Battlegear (10 Player (Normal))
    function() t[11752] = a:New(11752); end, -- Style of the Crusader
    function() T(t[11751], u[659]); end, -- Valorous Siegebreaker Battlegear (10 Player (Normal))
    function() T(t[11751], u[660]); end, -- Conqueror's Siegebreaker Battlegear (25 Player (Normal))
    function() T(t[11751], u[708]); end, -- Valorous Aegis Plate (10 Player (Normal))
    function() T(t[11751], u[709]); end, -- Conqueror's Aegis Plate (25 Player (Normal))
    function() T(t[11751], u[740]); end, -- Valorous Scourgestalker Battlegear (10 Player (Normal))
    function() T(t[11751], u[741]); end, -- Conqueror's Scourgestalker Battlegear (25 Player (Normal))
    function() T(t[11751], u[692]); end, -- Valorous Terrorblade Battlegear (10 Player (Normal))
    function() T(t[11751], u[693]); end, -- Conqueror's Terrorblade Battlegear (25 Player (Normal))
    function() T(t[11751], u[363]); end, -- Valorous Sanctification Regalia (10 Player (Normal))
    function() T(t[11751], u[364]); end, -- Conqueror's Sanctification Regalia (25 Player (Normal))
    function() T(t[11751], u[843]); end, -- Valorous Darkruned Plate (10 Player (Normal))
    function() T(t[11751], u[844]); end, -- Conqueror's Darkruned Plate (25 Player (Normal))
    function() T(t[11751], u[642]); end, -- Valorous Worldbreaker Regalia (10 Player (Normal))
    function() T(t[11751], u[643]); end, -- Conqueror's Worldbreaker Regalia (25 Player (Normal))
    function() T(t[11751], u[724]); end, -- Valorous Kirin Tor Garb (10 Player (Normal))
    function() T(t[11751], u[725]); end, -- Conqueror's Kirin Tor Garb (25 Player (Normal))
    function() T(t[11751], u[676]); end, -- Valorous Deathbringer Garb (10 Player (Normal))
    function() T(t[11751], u[677]); end, -- Conqueror's Deathbringer Garb (25 Player (Normal))
    function() T(t[11751], u[827]); end, -- Valorous Nightsong Battlegear (10 Player (Normal))
    function() T(t[11751], u[828]); end, -- Conqueror's Nightsong Battlegear (25 Player (Normal))
    function() t[11751] = a:New(11751); end, -- Mogg-Saron
    function() T(t[11750], u[661]); end, -- Heroes' Dreadnaught Battlegear (10 Player (Normal))
    function() T(t[11750], u[662]); end, -- Valorous Dreadnaught Battlegear (25 Player (Normal))
    function() T(t[11750], u[710]); end, -- Heroes' Redemption Plate (10 Player (Normal))
    function() T(t[11750], u[711]); end, -- Valorous Redemption Plate (25 Player (Normal))
    function() T(t[11750], u[742]); end, -- Heroes' Cryptstalker Battlegear (10 Player (Normal))
    function() T(t[11750], u[743]); end, -- Valorous Cryptstalker Battlegear (25 Player (Normal))
    function() T(t[11750], u[694]); end, -- Heroes' Bonescythe Battlegear (10 Player (Normal))
    function() T(t[11750], u[695]); end, -- Valorous Bonescythe Battlegear (25 Player (Normal))
    function() T(t[11750], u[361]); end, -- Heroes' Regalia of Faith (10 Player (Normal))
    function() T(t[11750], u[362]); end, -- Valorous Regalia of Faith (25 Player (Normal))
    function() T(t[11750], u[845]); end, -- Heroes' Scourgeborne Plate (10 Player (Normal))
    function() T(t[11750], u[846]); end, -- Valorous Scourgeborne Plate (25 Player (Normal))
    function() T(t[11750], u[644]); end, -- Heroes' Earthshatter Regalia (10 Player (Normal))
    function() T(t[11750], u[645]); end, -- Valorous Earthshatter Regalia (25 Player (Normal))
    function() T(t[11750], u[726]); end, -- Heroes' Frostfire Garb (10 Player (Normal))
    function() T(t[11750], u[727]); end, -- Valorous Frostfire Garb (25 Player (Normal))
    function() T(t[11750], u[678]); end, -- Heroes' Plagueheart Garb (10 Player (Normal))
    function() T(t[11750], u[679]); end, -- Valorous Plagueheart Garb (25 Player (Normal))
    function() T(t[11750], u[829]); end, -- Heroes' Dreamwalker Battlegear (10 Player (Normal))
    function() T(t[11750], u[830]); end, -- Valorous Dreamwalker Battlegear (25 Player (Normal))
    function() t[11750] = a:New(11750); end, -- Undying Aesthetic
    function() T(t[11749], u[931]); end, -- Onslaught Battlegear (Sunwell)
    function() T(t[11749], u[895]); end, -- Lightbringer Battlegear (Sunwell)
    function() T(t[11749], u[911]); end, -- Gronnstalker's Battlegear (Sunwell)
    function() T(t[11749], u[887]); end, -- Slayer's Battlegear (Sunwell)
    function() T(t[11749], u[352]); end, -- Vestments of Absolution (Sunwell)
    function() T(t[11749], u[869]); end, -- Skyshatter Raiment (Sunwell)
    function() T(t[11749], u[903]); end, -- Tempest Garb (Sunwell)
    function() T(t[11749], u[932]); end, -- Malefic Regalia (Sunwell)
    function() T(t[11749], u[919]); end, -- Thunderheart Regalia (Sunwell)
    function() t[11749] = a:New(11749); end, -- "Suns Out, Thori'dals Out"
    function() T(t[11748], u[847]); end, -- Onslaught Armor (Normal)
    function() T(t[11748], u[896]); end, -- Lightbringer Armor (Normal)
    function() T(t[11748], u[912]); end, -- Gronnstalker's Armor (Normal)
    function() T(t[11748], u[888]); end, -- Slayer's Armor (Normal)
    function() T(t[11748], u[351]); end, -- Absolution Regalia (Normal)
    function() T(t[11748], u[870]); end, -- Skyshatter Regalia (Normal)
    function() T(t[11748], u[904]); end, -- Tempest Regalia (Normal)
    function() T(t[11748], u[862]); end, -- Malefic Raiment (Normal)
    function() T(t[11748], u[920]); end, -- Thunderheart Raiment (Normal)
    function() t[11748] = a:New(11748); end, -- Black is the New Black
    function() T(t[11747], u[848]); end, -- Destroyer Armor (Normal)
    function() T(t[11747], u[897]); end, -- Crystalforge Armor (Normal)
    function() T(t[11747], u[918]); end, -- Rift Stalker Armor (Normal)
    function() T(t[11747], u[889]); end, -- Deathmantle (Normal)
    function() T(t[11747], u[353]); end, -- Avatar Regalia (Normal)
    function() T(t[11747], u[871]); end, -- Cataclysm Regalia (Normal)
    function() T(t[11747], u[905]); end, -- Tirisfal Regalia (Normal)
    function() T(t[11747], u[863]); end, -- Corruptor Raiment (Normal)
    function() T(t[11747], u[921]); end, -- Nordrassil Raiment (Normal)
    function() t[11747] = a:New(11747); end, -- Merely a Set
    function() T(t[11746], u[849]); end, -- Warbringer Armor (Normal)
    function() T(t[11746], u[906]); end, -- Justicar Armor (Normal)
    function() T(t[11746], u[913]); end, -- Demon Stalker Armor (Normal)
    function() T(t[11746], u[890]); end, -- Netherblade (Normal)
    function() T(t[11746], u[354]); end, -- Incarnate Regalia (Normal)
    function() T(t[11746], u[872]); end, -- Cyclone Regalia (Normal)
    function() T(t[11746], u[898]); end, -- Aldor Regalia (Normal)
    function() T(t[11746], u[864]); end, -- Voidheart Raiment (Normal)
    function() T(t[11746], u[922]); end, -- Malorne Raiment (Normal)
    function() t[11746] = a:New(11746); end, -- Outlandish Style
    function() T(t[11744], u[850]); end, -- Dreadnaught's Battlegear (Normal)
    function() T(t[11744], u[899]); end, -- Redemption Armor (Normal)
    function() T(t[11744], u[914]); end, -- Cryptstalker Armor (Normal)
    function() T(t[11744], u[891]); end, -- Bonescythe Armor (Normal)
    function() T(t[11744], u[355]); end, -- Vestments of Faith (Normal)
    function() T(t[11744], u[873]); end, -- The Earthshatterer (Normal)
    function() T(t[11744], u[907]); end, -- Frostfire Regalia (Normal)
    function() T(t[11744], u[865]); end, -- Plagueheart Raiment (Normal)
    function() T(t[11744], u[924]); end, -- Dreamwalker Raiment (Normal)
    function() t[11744] = a:New(11744); end, -- "Drop Dead, Gorgeous"
    function() T(t[11743], u[851]); end, -- Conqueror's Battlegear (Normal)
    function() T(t[11743], u[900]); end, -- Avenger's Battlegear (Normal)
    function() T(t[11743], u[915]); end, -- Striker's Garb (Normal)
    function() T(t[11743], u[892]); end, -- Deathdealer's Embrace (Normal)
    function() T(t[11743], u[358]); end, -- Garments of the Oracle (Normal)
    function() T(t[11743], u[874]); end, -- Stormcaller's Garb (Normal)
    function() T(t[11743], u[908]); end, -- Enigma Vestments (Normal)
    function() T(t[11743], u[866]); end, -- Doomcaller's Attire (Normal)
    function() T(t[11743], u[926]); end, -- Genesis Raiment (Normal)
    function() t[11743] = a:New(11743); end, -- Accessor-Eyes
    function() T(t[11742], u[852]); end, -- Battlegear of Wrath (Normal)
    function() T(t[11742], u[901]); end, -- Judgment Armor (Normal)
    function() T(t[11742], u[916]); end, -- Dragonstalker Armor (Normal)
    function() T(t[11742], u[893]); end, -- Bloodfang Armor (Normal)
    function() T(t[11742], u[356]); end, -- Vestments of Transcendence (Normal)
    function() T(t[11742], u[875]); end, -- The Ten Storms (Normal)
    function() T(t[11742], u[909]); end, -- Netherwind Regalia (Normal)
    function() T(t[11742], u[867]); end, -- Nemesis Raiment (Normal)
    function() T(t[11742], u[927]); end, -- Stormrage Raiment (Normal)
    function() t[11742] = a:New(11742); end, -- Dress in Lairs
    function() T(t[11741], u[853]); end, -- Battlegear of Might (Normal)
    function() T(t[11741], u[902]); end, -- Lawbringer Armor (Normal)
    function() T(t[11741], u[917]); end, -- Giantstalker Armor (Normal)
    function() T(t[11741], u[894]); end, -- Nightslayer Armor (Normal)
    function() T(t[11741], u[357]); end, -- Vestments of Prophecy (Normal)
    function() T(t[11741], u[876]); end, -- The Earthfury (Normal)
    function() T(t[11741], u[910]); end, -- Arcanist Regalia (Normal)
    function() T(t[11741], u[868]); end, -- Felheart Raiment (Normal)
    function() T(t[11741], u[928]); end, -- Cenarion Raiment (Normal)
    function() t[11741] = a:New(11741); end, -- So Hot Right Now
    function() T(t[11740], u[435]); end, -- Blackhand's Battlegear (Normal)
    function() T(t[11740], u[436]); end, -- Blackhand's Battlegear (Heroic)
    function() T(t[11740], u[437]); end, -- Blackhand's Battlegear (Mythic)
    function() T(t[11740], u[483]); end, -- Battlegear of Guiding Light (Normal)
    function() T(t[11740], u[484]); end, -- Battlegear of Guiding Light (Heroic)
    function() T(t[11740], u[485]); end, -- Battlegear of Guiding Light (Mythic)
    function() T(t[11740], u[536]); end, -- Rylakstalker's Battlegear (Normal)
    function() T(t[11740], u[537]); end, -- Rylakstalker's Battlegear (Heroic)
    function() T(t[11740], u[538]); end, -- Rylakstalker's Battlegear (Mythic)
    function() T(t[11740], u[468]); end, -- Poisoner's Battlegear (Normal)
    function() T(t[11740], u[469]); end, -- Poisoner's Battlegear (Heroic)
    function() T(t[11740], u[470]); end, -- Poisoner's Battlegear (Mythic)
    function() T(t[11740], u[327]); end, -- Soul Priest's Raiment (Normal)
    function() T(t[11740], u[329]); end, -- Soul Priest's Raiment (Mythic)
    function() T(t[11740], u[419]); end, -- Soul Priest's Raiment (Heroic)
    function() T(t[11740], u[569]); end, -- Ogreskull Boneplate Battlegear (Normal)
    function() T(t[11740], u[570]); end, -- Ogreskull Boneplate Battlegear (Heroic)
    function() T(t[11740], u[571]); end, -- Ogreskull Boneplate Battlegear (Mythic)
    function() T(t[11740], u[418]); end, -- Windspeaker's Regalia (Normal)
    function() T(t[11740], u[328]); end, -- Windspeaker's Regalia (Heroic)
    function() T(t[11740], u[420]); end, -- Windspeaker's Regalia (Mythic)
    function() T(t[11740], u[520]); end, -- Arcanoshatter Regalia (Normal)
    function() T(t[11740], u[521]); end, -- Arcanoshatter Regalia (Heroic)
    function() T(t[11740], u[522]); end, -- Arcanoshatter Regalia (Mythic)
    function() T(t[11740], u[452]); end, -- Shadow Council's Garb (Normal)
    function() T(t[11740], u[454]); end, -- Shadow Council's Garb (Heroic)
    function() T(t[11740], u[453]); end, -- Shadow Council's Garb (Mythic)
    function() T(t[11740], u[498]); end, -- Battlegear of the Somber Gaze (Normal)
    function() T(t[11740], u[500]); end, -- Battlegear of the Somber Gaze (Heroic)
    function() T(t[11740], u[501]); end, -- Battlegear of the Somber Gaze (Mythic)
    function() T(t[11740], u[554]); end, -- Living Wood Battlegear (Normal)
    function() T(t[11740], u[555]); end, -- Living Wood Battlegear (Heroic)
    function() T(t[11740], u[556]); end, -- Living Wood Battlegear (Mythic)
    function() t[11740] = a:New(11740); end, -- Make it W-orc W-orc
    function() t[11738] = a:New(11738); end, -- It'll Nether Happen
    function() t[11737] = a:New(11737); end, -- Disrupting the Nether
    function() t[11736] = a:New(11736); end, -- Assume Command
    function() t[11735] = a:New(11735); end, -- Take Command
    function() t[11732] = a:New(11732); end, -- A Magnificent Contribution
    function() t[11731] = a:New(11731); end, -- A Magic Contribution
    function() t[11725] = a:New(11725); end, -- Fisherfriend of the Isles
    function() t[11724] = a:New(11724); end, -- Fel Turkey!
    function() T(t[11723], u[1270]); end, -- Cruel Combatant's Plate Armor (Combatant I)
    function() T(t[11723], u[1225]); end, -- Cruel Gladiator's Plate Armor (Gladiator)
    function() T(t[11723], u[1227]); end, -- Cruel Gladiator's Plate Armor (Elite)
    function() T(t[11723], u[1280]); end, -- Cruel Combatant's Scaled Armor (Combatant I)
    function() T(t[11723], u[1241]); end, -- Cruel Gladiator's Scaled Armor (Gladiator)
    function() T(t[11723], u[1243]); end, -- Cruel Gladiator's Scaled Armor (Elite)
    function() T(t[11723], u[1286]); end, -- Cruel Combatant's Chain Armor (Combatant I)
    function() T(t[11723], u[1254]); end, -- Cruel Gladiator's Chain Armor (Gladiator)
    function() T(t[11723], u[1255]); end, -- Cruel Gladiator's Chain Armor (Elite)
    function() T(t[11723], u[1276]); end, -- Cruel Combatant's Leather Armor (Combatant I)
    function() T(t[11723], u[1237]); end, -- Cruel Gladiator's Leather Armor (Gladiator)
    function() T(t[11723], u[1239]); end, -- Cruel Gladiator's Leather Armor (Elite)
    function() T(t[11723], u[1278]); end, -- Cruel Combatant's Satin Armor (Combatant I)
    function() T(t[11723], u[389]); end, -- Cruel Gladiator's Satin Armor (Gladiator)
    function() T(t[11723], u[395]); end, -- Cruel Gladiator's Satin Armor (Elite)
    function() T(t[11723], u[1292]); end, -- Cruel Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11723], u[1265]); end, -- Cruel Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11723], u[1267]); end, -- Cruel Gladiator's Dreadplate Armor (Elite)
    function() T(t[11723], u[1274]); end, -- Cruel Combatant's Ringmail Armor (Combatant I)
    function() T(t[11723], u[1233]); end, -- Cruel Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11723], u[1235]); end, -- Cruel Gladiator's Ringmail Armor (Elite)
    function() T(t[11723], u[1284]); end, -- Cruel Combatant's Silk Armor (Combatant I)
    function() T(t[11723], u[1249]); end, -- Cruel Gladiator's Silk Armor (Gladiator)
    function() T(t[11723], u[1251]); end, -- Cruel Gladiator's Silk Armor (Elite)
    function() T(t[11723], u[1272]); end, -- Cruel Combatant's Felweave Armor (Combatant I)
    function() T(t[11723], u[1229]); end, -- Cruel Gladiator's Felweave Armor (Gladiator)
    function() T(t[11723], u[1231]); end, -- Cruel Gladiator's Felweave Armor (Elite)
    function() T(t[11723], u[1282]); end, -- Cruel Combatant's Ironskin Armor (Combatant I)
    function() T(t[11723], u[1245]); end, -- Cruel Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11723], u[1247]); end, -- Cruel Gladiator's Ironskin Armor (Elite)
    function() T(t[11723], u[1288]); end, -- Cruel Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11723], u[1257]); end, -- Cruel Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11723], u[1259]); end, -- Cruel Gladiator's Dragonhide Armor (Elite)
    function() T(t[11723], u[1290]); end, -- Cruel Combatant's Felskin Armor (Combatant I)
    function() T(t[11723], u[1262]); end, -- Cruel Gladiator's Felskin Armor (Gladiator)
    function() T(t[11723], u[1263]); end, -- Cruel Gladiator's Felskin Armor (Elite)
    function() T(t[11723], u[1269]); end, -- Cruel Combatant's Plate Armor (Combatant I)
    function() T(t[11723], u[1226]); end, -- Cruel Gladiator's Plate Armor (Gladiator)
    function() T(t[11723], u[1228]); end, -- Cruel Gladiator's Plate Armor (Elite)
    function() T(t[11723], u[1279]); end, -- Cruel Combatant's Scaled Armor (Combatant I)
    function() T(t[11723], u[1242]); end, -- Cruel Gladiator's Scaled Armor (Gladiator)
    function() T(t[11723], u[1244]); end, -- Cruel Gladiator's Scaled Armor (Elite)
    function() T(t[11723], u[1285]); end, -- Cruel Combatant's Chain Armor (Combatant I)
    function() T(t[11723], u[1253]); end, -- Cruel Gladiator's Chain Armor (Gladiator)
    function() T(t[11723], u[1256]); end, -- Cruel Gladiator's Chain Armor (Elite)
    function() T(t[11723], u[1275]); end, -- Cruel Combatant's Leather Armor (Combatant I)
    function() T(t[11723], u[1238]); end, -- Cruel Gladiator's Leather Armor (Gladiator)
    function() T(t[11723], u[1240]); end, -- Cruel Gladiator's Leather Armor (Elite)
    function() T(t[11723], u[1277]); end, -- Cruel Combatant's Satin Armor (Combatant I)
    function() T(t[11723], u[391]); end, -- Cruel Gladiator's Satin Armor (Gladiator)
    function() T(t[11723], u[394]); end, -- Cruel Gladiator's Satin Armor (Elite)
    function() T(t[11723], u[1291]); end, -- Cruel Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11723], u[1266]); end, -- Cruel Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11723], u[1268]); end, -- Cruel Gladiator's Dreadplate Armor (Elite)
    function() T(t[11723], u[1273]); end, -- Cruel Combatant's Ringmail Armor (Combatant I)
    function() T(t[11723], u[1234]); end, -- Cruel Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11723], u[1236]); end, -- Cruel Gladiator's Ringmail Armor (Elite)
    function() T(t[11723], u[1283]); end, -- Cruel Combatant's Silk Armor (Combatant I)
    function() T(t[11723], u[1250]); end, -- Cruel Gladiator's Silk Armor (Gladiator)
    function() T(t[11723], u[1252]); end, -- Cruel Gladiator's Silk Armor (Elite)
    function() T(t[11723], u[1271]); end, -- Cruel Combatant's Felweave Armor (Combatant I)
    function() T(t[11723], u[1230]); end, -- Cruel Gladiator's Felweave Armor (Gladiator)
    function() T(t[11723], u[1232]); end, -- Cruel Gladiator's Felweave Armor (Elite)
    function() T(t[11723], u[1281]); end, -- Cruel Combatant's Ironskin Armor (Combatant I)
    function() T(t[11723], u[1246]); end, -- Cruel Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11723], u[1248]); end, -- Cruel Gladiator's Ironskin Armor (Elite)
    function() T(t[11723], u[1287]); end, -- Cruel Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11723], u[1258]); end, -- Cruel Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11723], u[1260]); end, -- Cruel Gladiator's Dragonhide Armor (Elite)
    function() T(t[11723], u[1289]); end, -- Cruel Combatant's Felskin Armor (Combatant I)
    function() T(t[11723], u[1261]); end, -- Cruel Gladiator's Felskin Armor (Gladiator)
    function() T(t[11723], u[1264]); end, -- Cruel Gladiator's Felskin Armor (Elite)
    function() t[11723] = a:New(11723); end, -- Cruel Intentions
    function() T(t[11722], u[50]); end, -- Warmongering Combatant's Plate Armor (Combatant I)
    function() T(t[11722], u[116]); end, -- Warmongering Gladiator's Plate Armor (Gladiator)
    function() T(t[11722], u[1222]); end, -- Warmongering Gladiator's Plate Armor (Elite)
    function() T(t[11722], u[48]); end, -- Warmongering Combatant's Scaled Armor (Combatant I)
    function() T(t[11722], u[120]); end, -- Warmongering Gladiator's Scaled Armor (Gladiator)
    function() T(t[11722], u[1214]); end, -- Warmongering Gladiator's Scaled Armor (Elite)
    function() T(t[11722], u[35]); end, -- Warmongering Combatant's Chain Armor (Combatant I)
    function() T(t[11722], u[102]); end, -- Warmongering Gladiator's Chain Armor (Gladiator)
    function() T(t[11722], u[1208]); end, -- Warmongering Gladiator's Chain Armor (Elite)
    function() T(t[11722], u[41]); end, -- Warmongering Combatant's Leather Armor (Combatant I)
    function() T(t[11722], u[114]); end, -- Warmongering Gladiator's Leather Armor (Gladiator)
    function() T(t[11722], u[1216]); end, -- Warmongering Gladiator's Leather Armor (Elite)
    function() T(t[11722], u[52]); end, -- Warmongering Combatant's Satin Armor (Combatant I)
    function() T(t[11722], u[118]); end, -- Warmongering Gladiator's Satin Armor (Gladiator)
    function() T(t[11722], u[407]); end, -- Warmongering Gladiator's Satin Armor (Elite)
    function() T(t[11722], u[45]); end, -- Warmongering Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11722], u[108]); end, -- Warmongering Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11722], u[1204]); end, -- Warmongering Gladiator's Dreadplate Armor (Elite)
    function() T(t[11722], u[37]); end, -- Warmongering Combatant's Ringmail Armor (Combatant I)
    function() T(t[11722], u[104]); end, -- Warmongering Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11722], u[1218]); end, -- Warmongering Gladiator's Ringmail Armor (Elite)
    function() T(t[11722], u[53]); end, -- Warmongering Combatant's Silk Armor (Combatant I)
    function() T(t[11722], u[122]); end, -- Warmongering Gladiator's Silk Armor (Gladiator)
    function() T(t[11722], u[1210]); end, -- Warmongering Gladiator's Silk Armor (Elite)
    function() T(t[11722], u[56]); end, -- Warmongering Combatant's Felweave Armor (Combatant I)
    function() T(t[11722], u[110]); end, -- Warmongering Gladiator's Felweave Armor (Gladiator)
    function() T(t[11722], u[1220]); end, -- Warmongering Gladiator's Felweave Armor (Elite)
    function() T(t[11722], u[44]); end, -- Warmongering Combatant's Ironskin Armor (Combatant I)
    function() T(t[11722], u[112]); end, -- Warmongering Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11722], u[1212]); end, -- Warmongering Gladiator's Ironskin Armor (Elite)
    function() T(t[11722], u[39]); end, -- Warmongering Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11722], u[106]); end, -- Warmongering Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11722], u[1206]); end, -- Warmongering Gladiator's Dragonhide Armor (Elite)
    function() T(t[11722], u[49]); end, -- Warmongering Combatant's Plate Armor (Combatant I)
    function() T(t[11722], u[115]); end, -- Warmongering Gladiator's Plate Armor (Gladiator)
    function() T(t[11722], u[1223]); end, -- Warmongering Gladiator's Plate Armor (Elite)
    function() T(t[11722], u[47]); end, -- Warmongering Combatant's Scaled Armor (Combatant I)
    function() T(t[11722], u[119]); end, -- Warmongering Gladiator's Scaled Armor (Gladiator)
    function() T(t[11722], u[1215]); end, -- Warmongering Gladiator's Scaled Armor (Elite)
    function() T(t[11722], u[36]); end, -- Warmongering Combatant's Chain Armor (Combatant I)
    function() T(t[11722], u[101]); end, -- Warmongering Gladiator's Chain Armor (Gladiator)
    function() T(t[11722], u[1209]); end, -- Warmongering Gladiator's Chain Armor (Elite)
    function() T(t[11722], u[42]); end, -- Warmongering Combatant's Leather Armor (Combatant I)
    function() T(t[11722], u[113]); end, -- Warmongering Gladiator's Leather Armor (Gladiator)
    function() T(t[11722], u[1217]); end, -- Warmongering Gladiator's Leather Armor (Elite)
    function() T(t[11722], u[51]); end, -- Warmongering Combatant's Satin Armor (Combatant I)
    function() T(t[11722], u[117]); end, -- Warmongering Gladiator's Satin Armor (Gladiator)
    function() T(t[11722], u[408]); end, -- Warmongering Gladiator's Satin Armor (Elite)
    function() T(t[11722], u[46]); end, -- Warmongering Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11722], u[107]); end, -- Warmongering Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11722], u[1205]); end, -- Warmongering Gladiator's Dreadplate Armor (Elite)
    function() T(t[11722], u[38]); end, -- Warmongering Combatant's Ringmail Armor (Combatant I)
    function() T(t[11722], u[103]); end, -- Warmongering Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11722], u[1219]); end, -- Warmongering Gladiator's Ringmail Armor (Elite)
    function() T(t[11722], u[54]); end, -- Warmongering Combatant's Silk Armor (Combatant I)
    function() T(t[11722], u[121]); end, -- Warmongering Gladiator's Silk Armor (Gladiator)
    function() T(t[11722], u[1211]); end, -- Warmongering Gladiator's Silk Armor (Elite)
    function() T(t[11722], u[55]); end, -- Warmongering Combatant's Felweave Armor (Combatant I)
    function() T(t[11722], u[109]); end, -- Warmongering Gladiator's Felweave Armor (Gladiator)
    function() T(t[11722], u[1221]); end, -- Warmongering Gladiator's Felweave Armor (Elite)
    function() T(t[11722], u[43]); end, -- Warmongering Combatant's Ironskin Armor (Combatant I)
    function() T(t[11722], u[111]); end, -- Warmongering Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11722], u[1213]); end, -- Warmongering Gladiator's Ironskin Armor (Elite)
    function() T(t[11722], u[40]); end, -- Warmongering Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11722], u[105]); end, -- Warmongering Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11722], u[1207]); end, -- Warmongering Gladiator's Dragonhide Armor (Elite)
    function() t[11722] = a:New(11722); end, -- War-Mog-ering
    function() T(t[11721], u[22]); end, -- Wild Combatant's Plate Armor (Combatant I)
    function() T(t[11721], u[92]); end, -- Wild Gladiator's Plate Armor (Gladiator)
    function() T(t[11721], u[1191]); end, -- Wild Gladiator's Plate Armor (Elite)
    function() T(t[11721], u[19]); end, -- Wild Combatant's Scaled Armor (Combatant I)
    function() T(t[11721], u[94]); end, -- Wild Gladiator's Scaled Paladin (Gladiator)
    function() T(t[11721], u[1183]); end, -- Wild Gladiator's Scaled Paladin (Elite)
    function() T(t[11721], u[13]); end, -- Wild Combatant's Chain Armor (Combatant I)
    function() T(t[11721], u[80]); end, -- Wild Gladiator's Chain Armor (Gladiator)
    function() T(t[11721], u[1177]); end, -- Wild Gladiator's Chain Armor (Elite)
    function() T(t[11721], u[23]); end, -- Wild Combatant's Leather Armor (Combatant I)
    function() T(t[11721], u[85]); end, -- Wild Gladiator's Leather Armor (Gladiator)
    function() T(t[11721], u[1185]); end, -- Wild Gladiator's Leather Armor (Elite)
    function() T(t[11721], u[31]); end, -- Wild Combatant's Satin Armor (Combatant I)
    function() T(t[11721], u[98]); end, -- Wild Gladiator's Satin Armor (Gladiator)
    function() T(t[11721], u[405]); end, -- Wild Gladiator's Satin Armor (Elite)
    function() T(t[11721], u[17]); end, -- Wild Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11721], u[90]); end, -- Wild Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11721], u[1173]); end, -- Wild Gladiator's Dreadplate Armor (Elite)
    function() T(t[11721], u[15]); end, -- Wild Combatant's Ringmail Armor (Combatant I)
    function() T(t[11721], u[81]); end, -- Wild Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11721], u[1187]); end, -- Wild Gladiator's Ringmail Armor (Elite)
    function() T(t[11721], u[29]); end, -- Wild Combatant's Silk Armor (Combatant I)
    function() T(t[11721], u[100]); end, -- Wild Gladiator's Silk Armor (Gladiator)
    function() T(t[11721], u[1179]); end, -- Wild Gladiator's Silk Armor (Elite)
    function() T(t[11721], u[34]); end, -- Wild Combatant's Felweave Armor (Combatant I)
    function() T(t[11721], u[96]); end, -- Wild Gladiator's Felweave Armor (Gladiator)
    function() T(t[11721], u[1189]); end, -- Wild Gladiator's Felweave Armor (Elite)
    function() T(t[11721], u[28]); end, -- Wild Combatant's Ironskin Armor (Combatant I)
    function() T(t[11721], u[88]); end, -- Wild Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11721], u[1181]); end, -- Wild Gladiator's Ironskin Armor (Elite)
    function() T(t[11721], u[26]); end, -- Wild Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11721], u[84]); end, -- Wild Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11721], u[1175]); end, -- Wild Gladiator's Dragonhide Armor (Elite)
    function() T(t[11721], u[21]); end, -- Wild Combatant's Plate Armor (Combatant I)
    function() T(t[11721], u[91]); end, -- Wild Gladiator's Plate Armor (Gladiator)
    function() T(t[11721], u[1192]); end, -- Wild Gladiator's Plate Armor (Elite)
    function() T(t[11721], u[20]); end, -- Wild Combatant's Scaled Armor (Combatant I)
    function() T(t[11721], u[93]); end, -- Wild Gladiator's Scaled Armor (Gladiator)
    function() T(t[11721], u[1184]); end, -- Wild Gladiator's Scaled Paladin (Elite)
    function() T(t[11721], u[14]); end, -- Wild Combatant's Chain Armor (Combatant I)
    function() T(t[11721], u[79]); end, -- Wild Gladiator's Chain Armor (Gladiator)
    function() T(t[11721], u[1178]); end, -- Wild Gladiator's Chain Armor (Elite)
    function() T(t[11721], u[24]); end, -- Wild Combatant's Leather Armor (Combatant I)
    function() T(t[11721], u[86]); end, -- Wild Gladiator's Leather Armor (Gladiator)
    function() T(t[11721], u[1186]); end, -- Wild Gladiator's Leather Armor (Elite)
    function() T(t[11721], u[32]); end, -- Wild Combatant's Satin Armor (Combatant I)
    function() T(t[11721], u[97]); end, -- Wild Gladiator's Satin Armor (Gladiator)
    function() T(t[11721], u[406]); end, -- Wild Gladiator's Satin Armor (Elite)
    function() T(t[11721], u[18]); end, -- Wild Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11721], u[89]); end, -- Wild Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11721], u[1174]); end, -- Wild Gladiator's Dreadplate Armor (Elite)
    function() T(t[11721], u[16]); end, -- Wild Combatant's Ringmail Armor (Combatant I)
    function() T(t[11721], u[82]); end, -- Wild Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11721], u[1188]); end, -- Wild Gladiator's Ringmail Armor (Elite)
    function() T(t[11721], u[30]); end, -- Wild Combatant's Silk Armor (Combatant I)
    function() T(t[11721], u[99]); end, -- Wild Gladiator's Silk Armor (Gladiator)
    function() T(t[11721], u[1180]); end, -- Wild Gladiator's Silk Armor (Elite)
    function() T(t[11721], u[33]); end, -- Wild Combatant's Felweave Armor (Combatant I)
    function() T(t[11721], u[95]); end, -- Wild Gladiator's Felweave Armor (Gladiator)
    function() T(t[11721], u[1190]); end, -- Wild Gladiator's Felweave Armor (Elite)
    function() T(t[11721], u[27]); end, -- Wild Combatant's Ironskin Armor (Combatant I)
    function() T(t[11721], u[87]); end, -- Wild Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11721], u[1182]); end, -- Wild Gladiator's Ironskin Armor (Elite)
    function() T(t[11721], u[25]); end, -- Wild Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11721], u[83]); end, -- Wild Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11721], u[1176]); end, -- Wild Gladiator's Dragonhide Armor (Elite)
    function() t[11721] = a:New(11721); end, -- Wild Style
    function() T(t[11720], u[238]); end, -- Prideful Gladiator's Plate Armor (Gladiator)
    function() T(t[11720], u[1091]); end, -- Prideful Gladiator's Plate Armor (Elite)
    function() T(t[11720], u[241]); end, -- Prideful Gladiator's Scaled Armor (Gladiator)
    function() T(t[11720], u[1083]); end, -- Prideful Gladiator's Scaled Armor (Elite)
    function() T(t[11720], u[232]); end, -- Prideful Gladiator's Chain Armor (Gladiator)
    function() T(t[11720], u[1077]); end, -- Prideful Gladiator's Chain Armor (Elite)
    function() T(t[11720], u[237]); end, -- Prideful Gladiator's Leather Armor (Gladiator)
    function() T(t[11720], u[1085]); end, -- Prideful Gladiator's Leather Armor (Elite)
    function() T(t[11720], u[240]); end, -- Prideful Gladiator's Satin Armor (Gladiator)
    function() T(t[11720], u[399]); end, -- Prideful Gladiator's Satin Armor (Elite)
    function() T(t[11720], u[234]); end, -- Prideful Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11720], u[1073]); end, -- Prideful Gladiator's Dreadplate Armor (Elite)
    function() T(t[11720], u[239]); end, -- Prideful Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11720], u[1087]); end, -- Prideful Gladiator's Ringmail Armor (Elite)
    function() T(t[11720], u[242]); end, -- Prideful Gladiator's Silk Armor (Gladiator)
    function() T(t[11720], u[1079]); end, -- Prideful Gladiator's Silk Armor (Elite)
    function() T(t[11720], u[235]); end, -- Prideful Gladiator's Felweave Armor (Gladiator)
    function() T(t[11720], u[1089]); end, -- Prideful Gladiator's Felweave Armor (Elite)
    function() T(t[11720], u[236]); end, -- Prideful Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11720], u[1081]); end, -- Prideful Gladiator's Ironskin Armor (Elite)
    function() T(t[11720], u[233]); end, -- Prideful Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11720], u[1075]); end, -- Prideful Gladiator's Dragonhide Armor (Elite)
    function() T(t[11720], u[249]); end, -- Prideful Gladiator's Plate Armor (Gladiator)
    function() T(t[11720], u[1092]); end, -- Prideful Gladiator's Plate Armor (Elite)
    function() T(t[11720], u[252]); end, -- Prideful Gladiator's Scaled Armor (Gladiator)
    function() T(t[11720], u[1084]); end, -- Prideful Gladiator's Scaled Armor (Elite)
    function() T(t[11720], u[243]); end, -- Prideful Gladiator's Chain Armor (Gladiator)
    function() T(t[11720], u[1078]); end, -- Prideful Gladiator's Chain Armor (Elite)
    function() T(t[11720], u[248]); end, -- Prideful Gladiator's Leather Armor (Gladiator)
    function() T(t[11720], u[1086]); end, -- Prideful Gladiator's Leather Armor (Elite)
    function() T(t[11720], u[251]); end, -- Prideful Gladiator's Satin Armor (Gladiator)
    function() T(t[11720], u[400]); end, -- Prideful Gladiator's Satin Armor (Elite)
    function() T(t[11720], u[245]); end, -- Prideful Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11720], u[1074]); end, -- Prideful Gladiator's Dreadplate Armor (Elite)
    function() T(t[11720], u[250]); end, -- Prideful Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11720], u[1088]); end, -- Prideful Gladiator's Ringmail Armor (Elite)
    function() T(t[11720], u[253]); end, -- Prideful Gladiator's Silk Armor (Gladiator)
    function() T(t[11720], u[1080]); end, -- Prideful Gladiator's Silk Armor (Elite)
    function() T(t[11720], u[246]); end, -- Prideful Gladiator's Felweave Armor (Gladiator)
    function() T(t[11720], u[1090]); end, -- Prideful Gladiator's Felweave Armor (Elite)
    function() T(t[11720], u[247]); end, -- Prideful Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11720], u[1082]); end, -- Prideful Gladiator's Ironskin Armor (Elite)
    function() T(t[11720], u[244]); end, -- Prideful Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11720], u[1076]); end, -- Prideful Gladiator's Dragonhide Armor (Elite)
    function() t[11720] = a:New(11720); end, -- Wear It With Pride
    function() T(t[11719], u[215]); end, -- Grievous Gladiator's Plate Armor (Gladiator)
    function() T(t[11719], u[1048]); end, -- Grievous Gladiator's Plate Armor (Elite)
    function() T(t[11719], u[218]); end, -- Grievous Gladiator's Scaled Armor (Gladiator)
    function() T(t[11719], u[1040]); end, -- Grievous Gladiator's Scaled Armor (Elite)
    function() T(t[11719], u[199]); end, -- Grievous Gladiator's Chain Armor (Gladiator)
    function() T(t[11719], u[1034]); end, -- Grievous Gladiator's Chain Armor (Elite)
    function() T(t[11719], u[214]); end, -- Grievous Gladiator's Leather Armor (Gladiator)
    function() T(t[11719], u[1042]); end, -- Grievous Gladiator's Leather Armor (Elite)
    function() T(t[11719], u[217]); end, -- Grievous Gladiator's Satin Armor (Gladiator)
    function() T(t[11719], u[401]); end, -- Grievous Gladiator's Satin Armor (Elite)
    function() T(t[11719], u[211]); end, -- Grievous Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11719], u[1030]); end, -- Grievous Gladiator's Dreadplate Armor (Elite)
    function() T(t[11719], u[216]); end, -- Grievous Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11719], u[1044]); end, -- Grievous Gladiator's Ringmail Armor (Elite)
    function() T(t[11719], u[219]); end, -- Grievous Gladiator's Silk Armor (Gladiator)
    function() T(t[11719], u[1036]); end, -- Grievous Gladiator's Silk Armor (Elite)
    function() T(t[11719], u[212]); end, -- Grievous Gladiator's Felweave Armor (Gladiator)
    function() T(t[11719], u[1046]); end, -- Grievous Gladiator's Felweave Armor (Elite)
    function() T(t[11719], u[213]); end, -- Grievous Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11719], u[1038]); end, -- Grievous Gladiator's Ironskin Armor (Elite)
    function() T(t[11719], u[210]); end, -- Grievous Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11719], u[1032]); end, -- Grievous Gladiator's Dragonhide Armor (Elite)
    function() T(t[11719], u[205]); end, -- Grievous Gladiator's Plate Armor (Gladiator)
    function() T(t[11719], u[1049]); end, -- Grievous Gladiator's Plate Armor (Elite)
    function() T(t[11719], u[208]); end, -- Grievous Gladiator's Scaled Armor (Gladiator)
    function() T(t[11719], u[1041]); end, -- Grievous Gladiator's Scaled Armor (Elite)
    function() T(t[11719], u[198]); end, -- Grievous Gladiator's Chain Armor (Gladiator)
    function() T(t[11719], u[1035]); end, -- Grievous Gladiator's Chain Armor (Elite)
    function() T(t[11719], u[204]); end, -- Grievous Gladiator's Leather Armor (Gladiator)
    function() T(t[11719], u[1043]); end, -- Grievous Gladiator's Leather Armor (Elite)
    function() T(t[11719], u[207]); end, -- Grievous Gladiator's Satin Armor (Gladiator)
    function() T(t[11719], u[402]); end, -- Grievous Gladiator's Satin Armor (Elite)
    function() T(t[11719], u[201]); end, -- Grievous Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11719], u[1031]); end, -- Grievous Gladiator's Dreadplate Armor (Elite)
    function() T(t[11719], u[206]); end, -- Grievous Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11719], u[1045]); end, -- Grievous Gladiator's Ringmail Armor (Elite)
    function() T(t[11719], u[209]); end, -- Grievous Gladiator's Silk Armor (Gladiator)
    function() T(t[11719], u[1037]); end, -- Grievous Gladiator's Silk Armor (Elite)
    function() T(t[11719], u[202]); end, -- Grievous Gladiator's Felweave Armor (Gladiator)
    function() T(t[11719], u[1047]); end, -- Grievous Gladiator's Felweave Armor (Elite)
    function() T(t[11719], u[203]); end, -- Grievous Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11719], u[1039]); end, -- Grievous Gladiator's Ironskin Armor (Elite)
    function() T(t[11719], u[200]); end, -- Grievous Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11719], u[1033]); end, -- Grievous Gladiator's Dragonhide Armor (Elite)
    function() t[11719] = a:New(11719); end, -- It's Not Fashion Unless It Hurts
    function() T(t[11718], u[271]); end, -- Tyrannical Gladiator's Plate Armor (Gladiator)
    function() T(t[11718], u[1028]); end, -- Tyrannical Gladiator's Plate Armor (Elite)
    function() T(t[11718], u[274]); end, -- Tyrannical Gladiator's Scaled Armor (Gladiator)
    function() T(t[11718], u[1020]); end, -- Tyrannical Gladiator's Scaled Armor (Elite)
    function() T(t[11718], u[265]); end, -- Tyrannical Gladiator's Chain Armor (Gladiator)
    function() T(t[11718], u[1014]); end, -- Tyrannical Gladiator's Chain Armor (Elite)
    function() T(t[11718], u[270]); end, -- Tyrannical Gladiator's Leather Armor (Gladiator)
    function() T(t[11718], u[1022]); end, -- Tyrannical Gladiator's Leather Armor (Elite)
    function() T(t[11718], u[273]); end, -- Tyrannical Gladiator's Satin Armor (Gladiator)
    function() T(t[11718], u[397]); end, -- Tyrannical Gladiator's Satin Armor (Elite)
    function() T(t[11718], u[267]); end, -- Tyrannical Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11718], u[1010]); end, -- Tyrannical Gladiator's Dreadplate Armor (Elite)
    function() T(t[11718], u[272]); end, -- Tyrannical Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11718], u[1024]); end, -- Tyrannical Gladiator's Ringmail Armor (Elite)
    function() T(t[11718], u[275]); end, -- Tyrannical Gladiator's Silk Armor (Gladiator)
    function() T(t[11718], u[1016]); end, -- Tyrannical Gladiator's Silk Armor (Elite)
    function() T(t[11718], u[268]); end, -- Tyrannical Gladiator's Felweave Armor (Gladiator)
    function() T(t[11718], u[1026]); end, -- Tyrannical Gladiator's Felweave Armor (Elite)
    function() T(t[11718], u[269]); end, -- Tyrannical Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11718], u[1018]); end, -- Tyrannical Gladiator's Ironskin Armor (Elite)
    function() T(t[11718], u[266]); end, -- Tyrannical Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11718], u[1012]); end, -- Tyrannical Gladiator's Dragonhide Armor (Elite)
    function() T(t[11718], u[261]); end, -- Tyrannical Gladiator's Plate Armor (Gladiator)
    function() T(t[11718], u[1029]); end, -- Tyrannical Gladiator's Plate Armor (Elite)
    function() T(t[11718], u[263]); end, -- Tyrannical Gladiator's Scaled Armor (Gladiator)
    function() T(t[11718], u[1021]); end, -- Tyrannical Gladiator's Scaled Armor (Elite)
    function() T(t[11718], u[254]); end, -- Tyrannical Gladiator's Chain Armor (Gladiator)
    function() T(t[11718], u[1015]); end, -- Tyrannical Gladiator's Chain Armor (Elite)
    function() T(t[11718], u[260]); end, -- Tyrannical Gladiator's Leather Armor (Gladiator)
    function() T(t[11718], u[1023]); end, -- Tyrannical Gladiator's Leather Armor (Elite)
    function() T(t[11718], u[258]); end, -- Tyrannical Gladiator's Satin Armor (Gladiator)
    function() T(t[11718], u[398]); end, -- Tyrannical Gladiator's Satin Armor (Elite)
    function() T(t[11718], u[256]); end, -- Tyrannical Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11718], u[1011]); end, -- Tyrannical Gladiator's Dreadplate Armor (Elite)
    function() T(t[11718], u[262]); end, -- Tyrannical Gladiator's Ringmail Shaman (Gladiator)
    function() T(t[11718], u[1025]); end, -- Tyrannical Gladiator's Ringmail Armor (Elite)
    function() T(t[11718], u[264]); end, -- Tyrannical Gladiator's Silk Armor (Gladiator)
    function() T(t[11718], u[1017]); end, -- Tyrannical Gladiator's Silk Armor (Elite)
    function() T(t[11718], u[257]); end, -- Tyrannical Gladiator's Felweave Armor (Gladiator)
    function() T(t[11718], u[1027]); end, -- Tyrannical Gladiator's Felweave Armor (Elite)
    function() T(t[11718], u[259]); end, -- Tyrannical Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11718], u[1019]); end, -- Tyrannical Gladiator's Ironskin Armor (Elite)
    function() T(t[11718], u[255]); end, -- Tyrannical Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11718], u[1013]); end, -- Tyrannical Gladiator's Dragonhide Armor (Elite)
    function() t[11718] = a:New(11718); end, -- Dressed to Oppress
    function() T(t[11717], u[193]); end, -- Dreadful Gladiator's Plate (Honor)
    function() T(t[11717], u[278]); end, -- Malevolent Gladiator's Plate Armor (Gladiator)
    function() T(t[11717], u[1064]); end, -- Malevolent Gladiator's Plate Armor (Elite)
    function() T(t[11717], u[196]); end, -- Dreadful Gladiator's Scaled Armor (Honor)
    function() T(t[11717], u[277]); end, -- Malevolent Gladiator's Scaled Armor (Gladiator)
    function() T(t[11717], u[1060]); end, -- Malevolent Gladiator's Scaled Armor (Elite)
    function() T(t[11717], u[187]); end, -- Dreadful Gladiator's Chain Armor (Honor)
    function() T(t[11717], u[286]); end, -- Malevolent Gladiator's Chain Armor (Gladiator)
    function() T(t[11717], u[1056]); end, -- Malevolent Gladiator's Chain Armor (Elite)
    function() T(t[11717], u[192]); end, -- Dreadful Gladiator's Leather Armor (Honor)
    function() T(t[11717], u[280]); end, -- Malevolent Gladiator's Leather Armor (Gladiator)
    function() T(t[11717], u[1061]); end, -- Malevolent Gladiator's Leather Armor (Elite)
    function() T(t[11717], u[195]); end, -- Dreadful Gladiator's Satin Armor (Honor)
    function() T(t[11717], u[282]); end, -- Malevolent Gladiator's Satin Armor (Gladiator)
    function() T(t[11717], u[396]); end, -- Malevolent Gladiator's Satin Armor (Elite)
    function() T(t[11717], u[189]); end, -- Dreadful Gladiator's Dreadplate Armor (Honor)
    function() T(t[11717], u[285]); end, -- Malevolent Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11717], u[1054]); end, -- Malevolent Gladiator's Dreadplate Armor (Elite)
    function() T(t[11717], u[194]); end, -- Dreadful Gladiator's Ringmail Armor (Honor)
    function() T(t[11717], u[284]); end, -- Malevolent Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11717], u[1062]); end, -- Malevolent Gladiator's Ringmail Armor (Elite)
    function() T(t[11717], u[197]); end, -- Dreadful Gladiator's Silk Armor (Honor)
    function() T(t[11717], u[276]); end, -- Malevolent Gladiator's Silk Armor (Gladiator)
    function() T(t[11717], u[1057]); end, -- Malevolent Gladiator's Silk Armor (Elite)
    function() T(t[11717], u[190]); end, -- Dreadful Gladiator's Felweave Armor (Honor)
    function() T(t[11717], u[283]); end, -- Malevolent Gladiator's Felweave Armor (Gladiator)
    function() T(t[11717], u[1063]); end, -- Malevolent Gladiator's Felweave Armor (Elite)
    function() T(t[11717], u[191]); end, -- Dreadful Gladiator's Ironskin Armor (Honor)
    function() T(t[11717], u[1059]); end, -- Malevolent Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11717], u[279]); end, -- Malevolent Gladiator's Ironskin Armor (Elite)
    function() T(t[11717], u[188]); end, -- Dreadful Gladiator's Dragonhide Armor (Honor)
    function() T(t[11717], u[281]); end, -- Malevolent Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11717], u[1055]); end, -- Malevolent Gladiator's Dragonhide Armor (Elite)
    function() t[11717] = a:New(11717); end, -- Why Male(volent) Models?
    function() T(t[11716], u[588]); end, -- Cataclysmic Gladiator's Plate Armor (Gladiator)
    function() T(t[11716], u[589]); end, -- Cataclysmic Gladiator's Plate Armor (Elite)
    function() T(t[11716], u[596]); end, -- Cataclysmic Gladiator's Scaled Armor (Gladiator)
    function() T(t[11716], u[597]); end, -- Cataclysmic Gladiator's Scaled Armor (Elite)
    function() T(t[11716], u[600]); end, -- Cataclysmic Gladiator's Chain Armor (Gladiator)
    function() T(t[11716], u[601]); end, -- Cataclysmic Gladiator's Chain Armor (Elite)
    function() T(t[11716], u[594]); end, -- Cataclysmic Gladiator's Leather Armor (Gladiator)
    function() T(t[11716], u[595]); end, -- Cataclysmic Gladiator's Leather Armor (Elite)
    function() T(t[11716], u[365]); end, -- Cataclysmic Gladiator's Satin Armor (Gladiator)
    function() T(t[11716], u[366]); end, -- Cataclysmic Gladiator's Satin Armor (Elite)
    function() T(t[11716], u[604]); end, -- Cataclysmic Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11716], u[605]); end, -- Cataclysmic Gladiator's Dreadplate Armor (Elite)
    function() T(t[11716], u[592]); end, -- Cataclysmic Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11716], u[593]); end, -- Cataclysmic Gladiator's Ringmail Armor (Elite)
    function() T(t[11716], u[598]); end, -- Cataclysmic Gladiator's Silk Armor (Gladiator)
    function() T(t[11716], u[599]); end, -- Cataclysmic Gladiator's Silk Armor (Elite)
    function() T(t[11716], u[590]); end, -- Cataclysmic Gladiator's Felweave Armor (Gladiator)
    function() T(t[11716], u[591]); end, -- Cataclysmic Gladiator's Felweave Armor (Elite)
    function() T(t[11716], u[602]); end, -- Cataclysmic Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11716], u[603]); end, -- Cataclysmic Gladiator's Dragonhide Armor (Elite)
    function() t[11716] = a:New(11716); end, -- Cataclysmic Catwalk
    function() T(t[11715], u[606]); end, -- Ruthless Gladiator's Plate Armor (Gladiator)
    function() T(t[11715], u[607]); end, -- Ruthless Gladiator's Plate Armor (Elite)
    function() T(t[11715], u[616]); end, -- Ruthless Gladiator's Scaled Armor (Gladiator)
    function() T(t[11715], u[617]); end, -- Ruthless Gladiator's Scaled Armor (Elite)
    function() T(t[11715], u[620]); end, -- Ruthless Gladiator's Chain Armor (Gladiator)
    function() T(t[11715], u[621]); end, -- Ruthless Gladiator's Chain Armor (Elite)
    function() T(t[11715], u[615]); end, -- Ruthless Gladiator's Leather Armor (Gladiator)
    function() T(t[11715], u[613]); end, -- Ruthless Gladiator's Leather Armor (Elite)
    function() T(t[11715], u[612]); end, -- Ruthless Gladiator's Satin Armor (Gladiator)
    function() T(t[11715], u[614]); end, -- Ruthless Gladiator's Satin Armor (Elite)
    function() T(t[11715], u[624]); end, -- Ruthless Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11715], u[625]); end, -- Ruthless Gladiator's Dreadplate Armor (Elite)
    function() T(t[11715], u[610]); end, -- Ruthless Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11715], u[611]); end, -- Ruthless Gladiator's Ringmail Armor (Elite)
    function() T(t[11715], u[618]); end, -- Ruthless Gladiator's Silk Armor (Gladiator)
    function() T(t[11715], u[619]); end, -- Ruthless Gladiator's Silk Armor (Elite)
    function() T(t[11715], u[608]); end, -- Ruthless Gladiator's Felweave Armor (Gladiator)
    function() T(t[11715], u[609]); end, -- Ruthless Gladiator's Felweave Armor (Elite)
    function() T(t[11715], u[622]); end, -- Ruthless Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11715], u[623]); end, -- Ruthless Gladiator's Dragonhide Armor (Elite)
    function() t[11715] = a:New(11715); end, -- (Ruth)less is More
    function() T(t[11714], u[1193]); end, -- Bloodthirsty Gladiator's Plate Armor (Honor)
    function() T(t[11714], u[626]); end, -- Vicious Gladiator's Plate Armor (Gladiator)
    function() T(t[11714], u[627]); end, -- Vicious Gladiator's Plate Armor (Elite)
    function() T(t[11714], u[1197]); end, -- Bloodthirsty Gladiator's Scaled Armor (Honor)
    function() T(t[11714], u[751]); end, -- Vicious Gladiator's Scaled Armor (Gladiator)
    function() T(t[11714], u[752]); end, -- Vicious Gladiator's Scaled Armor (Elite)
    function() T(t[11714], u[1199]); end, -- Bloodthirsty Gladiator's Chain Armor (Honor)
    function() T(t[11714], u[755]); end, -- Vicious Gladiator's Chain Armor (Gladiator)
    function() T(t[11714], u[756]); end, -- Vicious Gladiator's Chain Armor (Elite)
    function() T(t[11714], u[1196]); end, -- Bloodthirsty Gladiator's Leather Armor (Honor)
    function() T(t[11714], u[749]); end, -- Vicious Gladiator's Leather Armor (Gladiator)
    function() T(t[11714], u[750]); end, -- Vicious Gladiator's Leather Armor (Elite)
    function() T(t[11714], u[371]); end, -- Bloodthirsty Gladiator's Satin Armor (Honor)
    function() T(t[11714], u[369]); end, -- Vicious Gladiator's Satin Armor (Gladiator)
    function() T(t[11714], u[370]); end, -- Vicious Gladiator's Satin Armor (Elite)
    function() T(t[11714], u[1201]); end, -- Bloodthirsty Gladiator's Dreadplate Armor (Honor)
    function() T(t[11714], u[759]); end, -- Vicious Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11714], u[760]); end, -- Vicious Gladiator's Dreadplate Armor (Elite)
    function() T(t[11714], u[1195]); end, -- Bloodthirsty Gladiator's Ringmail Armor (Honor)
    function() T(t[11714], u[747]); end, -- Vicious Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11714], u[748]); end, -- Vicious Gladiator's Ringmail Armor (Elite)
    function() T(t[11714], u[1198]); end, -- Bloodthirsty Gladiator's Silk Armor (Honor)
    function() T(t[11714], u[753]); end, -- Vicious Gladiator's Silk Armor (Gladiator)
    function() T(t[11714], u[754]); end, -- Vicious Gladiator's Silk Armor (Elite)
    function() T(t[11714], u[1194]); end, -- Bloodthirsty Gladiator's Felweave Armor (Honor)
    function() T(t[11714], u[628]); end, -- Vicious Gladiator's Felweave Armor (Gladiator)
    function() T(t[11714], u[629]); end, -- Vicious Gladiator's Felweave Armor (Elite)
    function() T(t[11714], u[1200]); end, -- Bloodthirsty Gladiator's Dragonhide Armor (Honor)
    function() T(t[11714], u[757]); end, -- Vicious Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11714], u[758]); end, -- Vicious Gladiator's Dragonhide Armor (Elite)
    function() t[11714] = a:New(11714); end, -- Viciously Vintage
    function() T(t[11713], u[761]); end, -- Wrathful Gladiator's Plate Armor (Gladiator)
    function() T(t[11713], u[765]); end, -- Wrathful Gladiator's Scaled Armor (Gladiator)
    function() T(t[11713], u[767]); end, -- Wrathful Gladiator's Chain Armor (Gladiator)
    function() T(t[11713], u[764]); end, -- Wrathful Gladiator's Leather Armor (Gladiator)
    function() T(t[11713], u[372]); end, -- Wrathful Gladiator's Satin Armor (Gladiator)
    function() T(t[11713], u[769]); end, -- Wrathful Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11713], u[763]); end, -- Wrathful Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11713], u[766]); end, -- Wrathful Gladiator's Silk Armor (Gladiator)
    function() T(t[11713], u[762]); end, -- Wrathful Gladiator's Felweave Armor (Gladiator)
    function() T(t[11713], u[768]); end, -- Wrathful Gladiator's Dragonhide Armor (Gladiator)
    function() t[11713] = a:New(11713); end, -- Wrath of the Stitch King
    function() T(t[11712], u[770]); end, -- Relentless Gladiator's Plate Armor (Gladiator)
    function() T(t[11712], u[774]); end, -- Relentless Gladiator's Scaled Armor (Gladiator)
    function() T(t[11712], u[776]); end, -- Relentless Gladiator's Chain Armor (Gladiator)
    function() T(t[11712], u[773]); end, -- Relentless Gladiator's Leather Armor (Gladiator)
    function() T(t[11712], u[373]); end, -- Relentless Gladiator's Satin Armor (Gladiator)
    function() T(t[11712], u[778]); end, -- Relentless Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11712], u[772]); end, -- Relentless Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11712], u[775]); end, -- Relentless Gladiator's Silk Armor (Gladiator)
    function() T(t[11712], u[771]); end, -- Relentless Gladiator's Felweave Armor (Gladiator)
    function() T(t[11712], u[777]); end, -- Relentless Gladiator's Dragonhide Armor (Gladiator)
    function() t[11712] = a:New(11712); end, -- Relentlessly Good Looking
    function() T(t[11711], u[779]); end, -- Furious Gladiator's Plate Armor (Gladiator)
    function() T(t[11711], u[783]); end, -- Furious Gladiator's Scaled Armor (Gladiator)
    function() T(t[11711], u[785]); end, -- Furious Gladiator's Chain Armor (Gladiator)
    function() T(t[11711], u[782]); end, -- Furious Gladiator's Leather Armor (Gladiator)
    function() T(t[11711], u[374]); end, -- Furious Gladiator's Satin Armor (Gladiator)
    function() T(t[11711], u[787]); end, -- Furious Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11711], u[781]); end, -- Furious Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11711], u[784]); end, -- Furious Gladiator's Silk Armor (Gladiator)
    function() T(t[11711], u[780]); end, -- Furious Gladiator's Felweave Armor (Gladiator)
    function() T(t[11711], u[786]); end, -- Furious Gladiator's Dragonhide Armor (Gladiator)
    function() t[11711] = a:New(11711); end, -- The Fierce and the Furious
    function() T(t[11710], u[797]); end, -- Hateful Gladiator's Plate Armor (Honor)
    function() T(t[11710], u[806]); end, -- Savage Gladiator's Plate Armor (PVP Rare)
    function() T(t[11710], u[788]); end, -- Deadly Gladiator's Plate Armor (Gladiator)
    function() T(t[11710], u[801]); end, -- Hateful Gladiator's Scaled Armor (Honor)
    function() T(t[11710], u[810]); end, -- Savage Gladiator's Scaled Armor (PVP Rare)
    function() T(t[11710], u[792]); end, -- Deadly Gladiator's Scaled Armor (Gladiator)
    function() T(t[11710], u[803]); end, -- Hateful Gladiator's Chain Armor (Honor)
    function() T(t[11710], u[812]); end, -- Savage Gladiator's Chain Armor (PVP Rare)
    function() T(t[11710], u[794]); end, -- Deadly Gladiator's Chain Armor (Gladiator)
    function() T(t[11710], u[800]); end, -- Hateful Gladiator's Leather Armor (Honor)
    function() T(t[11710], u[809]); end, -- Savage Gladiator's Leather Armor (PVP Rare)
    function() T(t[11710], u[791]); end, -- Deadly Gladiator's Leather Armor (Gladiator)
    function() T(t[11710], u[376]); end, -- Hateful Gladiator's Satin Armor (Honor)
    function() T(t[11710], u[377]); end, -- Savage Gladiator's Satin Armor (PVP Rare)
    function() T(t[11710], u[375]); end, -- Deadly Gladiator's Satin Armor (Gladiator)
    function() T(t[11710], u[805]); end, -- Hateful Gladiator's Dreadplate Armor (Honor)
    function() T(t[11710], u[814]); end, -- Savage Gladiator's Dreadplate Armor (PVP Rare)
    function() T(t[11710], u[796]); end, -- Deadly Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11710], u[799]); end, -- Hateful Gladiator's Ringmail Armor (Honor)
    function() T(t[11710], u[808]); end, -- Savage Gladiator's Ringmail Armor (PVP Rare)
    function() T(t[11710], u[790]); end, -- Deadly Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11710], u[802]); end, -- Hateful Gladiator's Silk Armor (Honor)
    function() T(t[11710], u[811]); end, -- Savage Gladiator's Silk Armor (PVP Rare)
    function() T(t[11710], u[793]); end, -- Deadly Gladiator's Silk Armor (Gladiator)
    function() T(t[11710], u[798]); end, -- Hateful Gladiator's Felweave Armor (Honor)
    function() T(t[11710], u[807]); end, -- Savage Gladiator's Felweave Armor (PVP Rare)
    function() T(t[11710], u[789]); end, -- Deadly Gladiator's Felweave Armor (Gladiator)
    function() T(t[11710], u[804]); end, -- Hateful Gladiator's Dragonhide Armor (Honor)
    function() T(t[11710], u[813]); end, -- Savage Gladiator's Dragonhide Armor (PVP Rare)
    function() T(t[11710], u[795]); end, -- Deadly Gladiator's Dragonhide Armor (Gladiator)
    function() t[11710] = a:New(11710); end, -- Lethal Looks
    function() T(t[11709], u[946]); end, -- Brutal Gladiator's Plate Armor (Gladiator)
    function() T(t[11709], u[950]); end, -- Brutal Gladiator's Scaled Armor (Gladiator)
    function() T(t[11709], u[952]); end, -- Brutal Gladiator's Chain Armor (Gladiator)
    function() T(t[11709], u[949]); end, -- Brutal Gladiator's Leather Armor (Gladiator)
    function() T(t[11709], u[378]); end, -- Brutal Gladiator's Satin Armor (Gladiator)
    function() T(t[11709], u[1202]); end, -- Brutal Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11709], u[948]); end, -- Brutal Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11709], u[951]); end, -- Brutal Gladiator's Silk Armor (Gladiator)
    function() T(t[11709], u[947]); end, -- Brutal Gladiator's Felweave Armor (Gladiator)
    function() T(t[11709], u[953]); end, -- Brutal Gladiator's Dragonhide Armor (Gladiator)
    function() t[11709] = a:New(11709); end, -- Tough Threads
    function() T(t[11708], u[954]); end, -- Vengeful Gladiator's Plate Armor (Gladiator)
    function() T(t[11708], u[958]); end, -- Vengeful Gladiator's Scaled Armor (Gladiator)
    function() T(t[11708], u[960]); end, -- Vengeful Gladiator's Chain Armor (Gladiator)
    function() T(t[11708], u[957]); end, -- Vengeful Gladiator's Leather Armor (Gladiator)
    function() T(t[11708], u[379]); end, -- Vengeful Gladiator's Satin Armor (Gladiator)
    function() T(t[11708], u[956]); end, -- Vengeful Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11708], u[959]); end, -- Vengeful Gladiator's Silk Armor (Gladiator)
    function() T(t[11708], u[955]); end, -- Vengeful Gladiator's Felweave Armor (Gladiator)
    function() T(t[11708], u[961]); end, -- Vengeful Gladiator's Dragonhide Armor (Gladiator)
    function() t[11708] = a:New(11708); end, -- With a Vengeance
    function() T(t[11707], u[962]); end, -- Merciless Gladiator's Plate Armor (Gladiator)
    function() T(t[11707], u[966]); end, -- Merciless Gladiator's Scaled Armor (Gladiator)
    function() T(t[11707], u[968]); end, -- Merciless Gladiator's Chain Armor (Gladiator)
    function() T(t[11707], u[965]); end, -- Merciless Gladiator's Leather Armor (Gladiator)
    function() T(t[11707], u[380]); end, -- Merciless Gladiator's Satin Armor (Gladiator)
    function() T(t[11707], u[964]); end, -- Merciless Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11707], u[967]); end, -- Merciless Gladiator's Silk Armor (Gladiator)
    function() T(t[11707], u[963]); end, -- Merciless Gladiator's Felweave Armor (Gladiator)
    function() T(t[11707], u[969]); end, -- Merciless Gladiator's Dragonhide Armor (Gladiator)
    function() t[11707] = a:New(11707); end, -- No Mercy
    function() T(t[11706], u[381]); end, -- Gladiator's Plate Armor (Gladiator)
    function() T(t[11706], u[974]); end, -- Gladiator's Scaled Armor (Gladiator)
    function() T(t[11706], u[976]); end, -- Gladiator's Chain Armor (Gladiator)
    function() T(t[11706], u[972]); end, -- Gladiator's Leather Armor (Gladiator)
    function() T(t[11706], u[382]); end, -- Satin Battlegear (PVP Rare)
    function() T(t[11706], u[973]); end, -- Gladiator's Satin Armor (Gladiator)
    function() T(t[11706], u[971]); end, -- Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11706], u[975]); end, -- Gladiator's Silk Armor (Gladiator)
    function() T(t[11706], u[970]); end, -- Gladiator's Felweave Armor (Gladiator)
    function() T(t[11706], u[977]); end, -- Gladiator's Dragonhide Armor (Gladiator)
    function() t[11706] = a:New(11706); end, -- The Original
    function() t[11703] = a:New(11703); end, -- Master of Shadows
    function() t[11702] = a:New(11702); end, -- Mythic: Cathedral of Eternal Night
    function() t[11701] = a:New(11701); end, -- Heroic: Cathedral of Eternal Night
    function() t[11700] = a:New(11700); end, -- Cathedral of Eternal Night
    function() t[11699] = a:New(11699); end, -- Grand Fin-ale
    function() O(t[11698], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11698] = a:New(11698, nil, nil, true); end, -- Ferocious Elite
    function() O(t[11697], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11697] = a:New(11697, nil, nil, true); end, -- Cruel Elite
    function() t[11696] = a:New(11696); end, -- Grin and Bear It
    function() O(t[11694], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11694] = a:New(11694, nil, nil, true); end, -- "Hell, It's About Nineteen"
    function() O(t[11693], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11693] = a:New(11693, nil, nil, true); end, -- Eighteen and Over
    function() O(t[11692], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11692] = a:New(11692, nil, nil, true); end, -- Going On Seventeen
    function() O(t[11691], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11691] = a:New(11691, nil, nil, true); end, -- You Are Sixteen
    function() O(t[11690], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11690] = a:New(11690, nil, nil, true); end, -- When You're Fifteen
    function() O(t[11689], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11689] = a:New(11689, nil, nil, true); end, -- Fourteen for the Team
    function() O(t[11688], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11688] = a:New(11688, nil, nil, true); end, -- Floor Thirteen
    function() O(t[11687], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11687] = a:New(11687, nil, nil, true); end, -- Demonic Dozen
    function() O(t[11686], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11686] = a:New(11686, nil, nil, true); end, -- These Go To Eleven
    function() O(t[11685], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11685] = a:New(11685, nil, nil, true); end, -- Decade of Dominance
    function() t[11683] = a:New(11683); end, -- Bingo!
    function() t[11681] = a:New(11681); end, -- Crate Expectations
    function() t[11676] = a:New(11676); end, -- Five Course Seafood Buffet
    function() t[11675] = a:New(11675); end, -- Sky Walker
    function() t[11674] = a:New(11674); end, -- "Great Soul, Great Purpose"
    function() t[11653] = a:New(11653); end, -- Paragon of the Broken Isles
    function() t[11652] = a:New(11652); end, -- The Reputable
    function() T(t[11631], u[584]); end, -- Demonbreaker Battleplate (Raid Finder)
    function() T(t[11631], u[583]); end, -- Rancorbite Armor (Raid Finder)
    function() T(t[11631], u[581]); end, -- Felfume Raiment (Raid Finder)
    function() T(t[11631], u[582]); end, -- Ironpelt Garb (Raid Finder)
    function() T(t[11631], u[432]); end, -- Battlegear of Iron Wrath (Normal)
    function() T(t[11631], u[433]); end, -- Battlegear of Iron Wrath (Heroic)
    function() T(t[11631], u[434]); end, -- Battlegear of Iron Wrath (Mythic)
    function() T(t[11631], u[480]); end, -- Watch of the Ceaseless Vigil (Normal)
    function() T(t[11631], u[481]); end, -- Watch of the Ceaseless Vigil (Heroic)
    function() T(t[11631], u[482]); end, -- Watch of the Ceaseless Vigil (Mythic)
    function() T(t[11631], u[533]); end, -- Battlegear of the Savage Hunt (Normal)
    function() T(t[11631], u[534]); end, -- Battlegear of the Savage Hunt (Heroic)
    function() T(t[11631], u[535]); end, -- Battlegear of the Savage Hunt (Mythic)
    function() T(t[11631], u[465]); end, -- Felblade Armor (Normal)
    function() T(t[11631], u[466]); end, -- Felblade Armor (Heroic)
    function() T(t[11631], u[467]); end, -- Felblade Armor (Mythic)
    function() T(t[11631], u[323]); end, -- Attire of Piety (Normal)
    function() T(t[11631], u[324]); end, -- Attire of Piety (Heroic)
    function() T(t[11631], u[325]); end, -- Attire of Piety (Mythic)
    function() T(t[11631], u[566]); end, -- Demongaze Armor (Normal)
    function() T(t[11631], u[567]); end, -- Demongaze Armor (Heroic)
    function() T(t[11631], u[568]); end, -- Demongaze Armor (Mythic)
    function() T(t[11631], u[415]); end, -- Embrace of the Living Mountain (Normal)
    function() T(t[11631], u[416]); end, -- Embrace of the Living Mountain (Heroic)
    function() T(t[11631], u[417]); end, -- Embrace of the Living Mountain (Mythic)
    function() T(t[11631], u[517]); end, -- Raiment of the Arcanic Conclave (Normal)
    function() T(t[11631], u[519]); end, -- Raiment of the Arcanic Conclave (Heroic)
    function() T(t[11631], u[518]); end, -- Raiment of the Arcanic Conclave (Mythic)
    function() T(t[11631], u[449]); end, -- Deathrattle Regalia (Normal)
    function() T(t[11631], u[451]); end, -- Deathrattle Regalia (Heroic)
    function() T(t[11631], u[450]); end, -- Deathrattle Regalia (Mythic)
    function() T(t[11631], u[502]); end, -- Battlewrap of the Hurricane's Eye (Normal)
    function() T(t[11631], u[503]); end, -- Battlewrap of the Hurricane's Eye (Heroic)
    function() T(t[11631], u[505]); end, -- Battlewrap of the Hurricane's Eye (Mythic)
    function() T(t[11631], u[551]); end, -- Oathclaw Wargarb (Normal)
    function() T(t[11631], u[552]); end, -- Oathclaw Wargarb (Heroic)
    function() T(t[11631], u[553]); end, -- Oathclaw Wargarb (Mythic)
    function() t[11631] = a:New(11631); end, -- Extreme Makeover: Fel Edition
    function() T(t[11630], u[1070]); end, -- Vindictive Combatant's Plate Armor (Combatant I)
    function() T(t[11630], u[1133]); end, -- Vindictive Gladiator's Plate Armor (Gladiator)
    function() T(t[11630], u[1135]); end, -- Vindictive Gladiator's Plate Armor (Elite)
    function() T(t[11630], u[1164]); end, -- Vindictive Combatant's Scaled Armor (Combatant I)
    function() T(t[11630], u[1121]); end, -- Vindictive Gladiator's Scaled Armor (Gladiator)
    function() T(t[11630], u[1123]); end, -- Vindictive Gladiator's Scaled Armor (Elite)
    function() T(t[11630], u[409]); end, -- Vindictive Combatant's Chain Armor (Combatant I)
    function() T(t[11630], u[1113]); end, -- Vindictive Gladiator's Chain Armor (Gladiator)
    function() T(t[11630], u[1115]); end, -- Vindictive Gladiator's Chain Armor (Elite)
    function() T(t[11630], u[1068]); end, -- Vindictive Combatant's Leather Armor (Combatant I)
    function() T(t[11630], u[1125]); end, -- Vindictive Gladiator's Leather Armor (Gladiator)
    function() T(t[11630], u[1127]); end, -- Vindictive Gladiator's Leather Armor (Elite)
    function() T(t[11630], u[1071]); end, -- Vindictive Combatant's Satin Armor (Combatant I)
    function() T(t[11630], u[388]); end, -- Vindictive Gladiator's Satin Armor (Gladiator)
    function() T(t[11630], u[392]); end, -- Vindictive Gladiator's Satin Armor (Elite)
    function() T(t[11630], u[1163]); end, -- Vindictive Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11630], u[1106]); end, -- Vindictive Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11630], u[1108]); end, -- Vindictive Gladiator's Dreadplate Armor (Elite)
    function() T(t[11630], u[1161]); end, -- Vindictive Combatant's Ringmail Armor (Combatant I)
    function() T(t[11630], u[1129]); end, -- Vindictive Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11630], u[1131]); end, -- Vindictive Gladiator's Ringmail Armor (Elite)
    function() T(t[11630], u[1137]); end, -- Vindictive Combatant's Silk Armor (Combatant I)
    function() T(t[11630], u[1094]); end, -- Vindictive Gladiator's Silk Armor (Gladiator)
    function() T(t[11630], u[1096]); end, -- Vindictive Gladiator's Silk Armor (Elite)
    function() T(t[11630], u[1158]); end, -- Vindictive Combatant's Felweave Armor (Combatant I)
    function() T(t[11630], u[1101]); end, -- Vindictive Gladiator's Felweave Armor (Gladiator)
    function() T(t[11630], u[1103]); end, -- Vindictive Gladiator's Felweave Armor (Elite)
    function() T(t[11630], u[1169]); end, -- Vindictive Combatant's Ironskin Armor (Combatant I)
    function() T(t[11630], u[1117]); end, -- Vindictive Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11630], u[1119]); end, -- Vindictive Gladiator's Ironskin Armor (Elite)
    function() T(t[11630], u[1168]); end, -- Vindictive Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11630], u[1098]); end, -- Vindictive Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11630], u[1100]); end, -- Vindictive Gladiator's Dragonhide Armor (Elite)
    function() T(t[11630], u[1167]); end, -- Vindictive Combatant's Felskin Armor (Combatant I)
    function() T(t[11630], u[1110]); end, -- Vindictive Gladiator's Felskin Armor (Gladiator)
    function() T(t[11630], u[1112]); end, -- Vindictive Gladiator's Felskin Armor (Elite)
    function() T(t[11630], u[1069]); end, -- Vindictive Combatant's Plate Armor (Combatant I)
    function() T(t[11630], u[1134]); end, -- Vindictive Gladiator's Plate Armor (Gladiator)
    function() T(t[11630], u[1136]); end, -- Vindictive Gladiator's Plate Armor (Elite)
    function() T(t[11630], u[1166]); end, -- Vindictive Combatant's Scaled Armor (Combatant I)
    function() T(t[11630], u[1122]); end, -- Vindictive Gladiator's Scaled Armor (Gladiator)
    function() T(t[11630], u[1124]); end, -- Vindictive Gladiator's Scaled Armor (Elite)
    function() T(t[11630], u[410]); end, -- Vindictive Combatant's Chain Armor (Combatant I)
    function() T(t[11630], u[1114]); end, -- Vindictive Gladiator's Chain Armor (Gladiator)
    function() T(t[11630], u[1116]); end, -- Vindictive Gladiator's Chain Armor (Elite)
    function() T(t[11630], u[1067]); end, -- Vindictive Combatant's Leather Armor (Combatant I)
    function() T(t[11630], u[1126]); end, -- Vindictive Gladiator's Leather Armor (Gladiator)
    function() T(t[11630], u[1128]); end, -- Vindictive Gladiator's Leather Armor (Elite)
    function() T(t[11630], u[1072]); end, -- Vindictive Combatant's Satin Armor (Combatant I)
    function() T(t[11630], u[390]); end, -- Vindictive Gladiator's Satin Armor (Gladiator)
    function() T(t[11630], u[393]); end, -- Vindictive Gladiator's Satin Armor (Elite)
    function() T(t[11630], u[1165]); end, -- Vindictive Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11630], u[1105]); end, -- Vindictive Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11630], u[1107]); end, -- Vindictive Gladiator's Dreadplate Armor (Elite)
    function() T(t[11630], u[1162]); end, -- Vindictive Combatant's Ringmail Armor (Combatant I)
    function() T(t[11630], u[1130]); end, -- Vindictive Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11630], u[1132]); end, -- Vindictive Gladiator's Ringmail Armor (Elite)
    function() T(t[11630], u[1159]); end, -- Vindictive Combatant's Silk Armor (Combatant I)
    function() T(t[11630], u[1093]); end, -- Vindictive Gladiator's Silk Armor (Gladiator)
    function() T(t[11630], u[1095]); end, -- Vindictive Gladiator's Silk Armor (Elite)
    function() T(t[11630], u[1160]); end, -- Vindictive Combatant's Felweave Armor (Combatant I)
    function() T(t[11630], u[1102]); end, -- Vindictive Gladiator's Felweave Armor (Gladiator)
    function() T(t[11630], u[1104]); end, -- Vindictive Gladiator's Felweave Armor (Elite)
    function() T(t[11630], u[1172]); end, -- Vindictive Combatant's Ironskin Armor (Combatant I)
    function() T(t[11630], u[1118]); end, -- Vindictive Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11630], u[1120]); end, -- Vindictive Gladiator's Ironskin Armor (Elite)
    function() T(t[11630], u[1171]); end, -- Vindictive Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11630], u[1097]); end, -- Vindictive Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11630], u[1099]); end, -- Vindictive Gladiator's Dragonhide Armor (Elite)
    function() T(t[11630], u[1170]); end, -- Vindictive Combatant's Felskin Armor (Combatant I)
    function() T(t[11630], u[1109]); end, -- Vindictive Gladiator's Felskin Armor (Gladiator)
    function() T(t[11630], u[1111]); end, -- Vindictive Gladiator's Felskin Armor (Elite)
    function() t[11630] = a:New(11630); end, -- More Like Win-dictive
    function() T(t[11629], u[72]); end, -- Primal Combatant's Plate Armor (Combatant I)
    function() T(t[11629], u[136]); end, -- Primal Gladiator's Plate Armor (Gladiator)
    function() T(t[11629], u[1156]); end, -- Primal Gladiator's Plate Armor (Elite)
    function() T(t[11629], u[70]); end, -- Primal Combatant's Scaled Armor (Combatant I)
    function() T(t[11629], u[142]); end, -- Primal Gladiator's Scaled Armor (Gladiator)
    function() T(t[11629], u[1148]); end, -- Primal Gladiator's Scaled Armor (Elite)
    function() T(t[11629], u[58]); end, -- Primal Combatant's Chain Armor (Combatant I)
    function() T(t[11629], u[124]); end, -- Primal Gladiator's Chain Armor (Gladiator)
    function() T(t[11629], u[1142]); end, -- Primal Gladiator's Chain Armor (Elite)
    function() T(t[11629], u[64]); end, -- Primal Combatant's Leather Armor (Combatant I)
    function() T(t[11629], u[134]); end, -- Primal Gladiator's Leather Armor (Gladiator)
    function() T(t[11629], u[1150]); end, -- Primal Gladiator's Leather Armor (Elite)
    function() T(t[11629], u[76]); end, -- Primal Combatant's Satin Armor (Combatant I)
    function() T(t[11629], u[140]); end, -- Primal Gladiator's Satin Armor (Gladiator)
    function() T(t[11629], u[403]); end, -- Primal Gladiator's Satin Armor (Elite)
    function() T(t[11629], u[68]); end, -- Primal Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11629], u[128]); end, -- Primal Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11629], u[1138]); end, -- Primal Gladiator's Dreadplate Armor (Elite)
    function() T(t[11629], u[60]); end, -- Primal Combatant's Ringmail Armor (Combatant I)
    function() T(t[11629], u[138]); end, -- Primal Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11629], u[1152]); end, -- Primal Gladiator's Ringmail Armor (Elite)
    function() T(t[11629], u[78]); end, -- Primal Combatant's Silk Armor (Combatant I)
    function() T(t[11629], u[144]); end, -- Primal Gladiator's Silk Armor (Gladiator)
    function() T(t[11629], u[1144]); end, -- Primal Gladiator's Silk Armor (Elite)
    function() T(t[11629], u[74]); end, -- Primal Combatant's Felweave Armor (Combatant I)
    function() T(t[11629], u[130]); end, -- Primal Gladiator's Felweave Armor (Gladiator)
    function() T(t[11629], u[1154]); end, -- Primal Gladiator's Felweave Armor (Elite)
    function() T(t[11629], u[66]); end, -- Primal Combatant's Ironskin Armor (Combatant I)
    function() T(t[11629], u[132]); end, -- Primal Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11629], u[1146]); end, -- Primal Gladiator's Ironskin Armor (Elite)
    function() T(t[11629], u[62]); end, -- Primal Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11629], u[126]); end, -- Primal Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11629], u[1140]); end, -- Primal Gladiator's Dragonhide Armor (Elite)
    function() T(t[11629], u[71]); end, -- Primal Combatant's Plate Armor (Combatant I)
    function() T(t[11629], u[135]); end, -- Primal Gladiator's Plate Armor (Gladiator)
    function() T(t[11629], u[1157]); end, -- Primal Gladiator's Plate Armor (Elite)
    function() T(t[11629], u[69]); end, -- Primal Combatant's Scaled Armor (Combatant I)
    function() T(t[11629], u[141]); end, -- Primal Gladiator's Scaled Armor (Gladiator)
    function() T(t[11629], u[1149]); end, -- Primal Gladiator's Scaled Armor (Elite)
    function() T(t[11629], u[57]); end, -- Primal Combatant's Chain Armor (Combatant I)
    function() T(t[11629], u[123]); end, -- Primal Gladiator's Chain Armor (Gladiator)
    function() T(t[11629], u[1143]); end, -- Primal Gladiator's Chain Armor (Elite)
    function() T(t[11629], u[63]); end, -- Primal Combatant's Leather Armor (Combatant I)
    function() T(t[11629], u[133]); end, -- Primal Gladiator's Leather Armor (Gladiator)
    function() T(t[11629], u[1151]); end, -- Primal Gladiator's Leather Armor (Elite)
    function() T(t[11629], u[75]); end, -- Primal Combatant's Satin Armor (Combatant I)
    function() T(t[11629], u[139]); end, -- Primal Gladiator's Satin Armor (Gladiator)
    function() T(t[11629], u[404]); end, -- Primal Gladiator's Satin Armor (Elite)
    function() T(t[11629], u[67]); end, -- Primal Combatant's Dreadplate Armor (Combatant I)
    function() T(t[11629], u[127]); end, -- Primal Gladiator's Dreadplate Armor (Gladiator)
    function() T(t[11629], u[1139]); end, -- Primal Gladiator's Dreadplate Armor (Elite)
    function() T(t[11629], u[59]); end, -- Primal Combatant's Ringmail Armor (Combatant I)
    function() T(t[11629], u[137]); end, -- Primal Gladiator's Ringmail Armor (Gladiator)
    function() T(t[11629], u[1153]); end, -- Primal Gladiator's Ringmail Armor (Elite)
    function() T(t[11629], u[77]); end, -- Primal Combatant's Silk Armor (Combatant I)
    function() T(t[11629], u[143]); end, -- Primal Gladiator's Silk Armor (Gladiator)
    function() T(t[11629], u[1145]); end, -- Primal Gladiator's Silk Armor (Elite)
    function() T(t[11629], u[73]); end, -- Primal Combatant's Felweave Armor (Combatant I)
    function() T(t[11629], u[129]); end, -- Primal Gladiator's Felweave Armor (Gladiator)
    function() T(t[11629], u[1155]); end, -- Primal Gladiator's Felweave Armor (Elite)
    function() T(t[11629], u[65]); end, -- Primal Combatant's Ironskin Armor (Combatant I)
    function() T(t[11629], u[131]); end, -- Primal Gladiator's Ironskin Armor (Gladiator)
    function() T(t[11629], u[1147]); end, -- Primal Gladiator's Ironskin Armor (Elite)
    function() T(t[11629], u[61]); end, -- Primal Combatant's Dragonhide Armor (Combatant I)
    function() T(t[11629], u[125]); end, -- Primal Gladiator's Dragonhide Armor (Gladiator)
    function() T(t[11629], u[1141]); end, -- Primal Gladiator's Dragonhide Armor (Elite)
    function() t[11629] = a:New(11629); end, -- Untamed Beauty
    function() T(t[11628], u[940]); end, -- Warplate of the Obsidian Aspect (Raid Finder)
    function() T(t[11628], u[937]); end, -- Warplate of the Obsidian Aspect (Normal)
    function() T(t[11628], u[938]); end, -- Warplate of the Obsidian Aspect (Heroic)
    function() T(t[11628], u[939]); end, -- Warplate of the Obsidian Aspect (Mythic)
    function() T(t[11628], u[981]); end, -- Battleplate of the Highlord (Raid Finder)
    function() T(t[11628], u[978]); end, -- Battleplate of the Highlord (Normal)
    function() T(t[11628], u[979]); end, -- Battleplate of the Highlord (Heroic)
    function() T(t[11628], u[980]); end, -- Battleplate of the Highlord (Mythic)
    function() T(t[11628], u[993]); end, -- Eagletalon Battlegear (Raid Finder)
    function() T(t[11628], u[990]); end, -- Eagletalon Battlegear (Normal)
    function() T(t[11628], u[991]); end, -- Eagletalon Battlegear (Heroic)
    function() T(t[11628], u[992]); end, -- Eagletalon Battlegear (Mythic)
    function() T(t[11628], u[945]); end, -- Doomblade Battlegear (Raid Finder)
    function() T(t[11628], u[942]); end, -- Doomblade Battlegear (Normal)
    function() T(t[11628], u[943]); end, -- Doomblade Battlegear (Heroic)
    function() T(t[11628], u[944]); end, -- Doomblade Battlegear (Mythic)
    function() T(t[11628], u[322]); end, -- Vestments of the Purifier (Raid Finder)
    function() T(t[11628], u[308]); end, -- Vestments of the Purifier (Normal)
    function() T(t[11628], u[309]); end, -- Vestments of the Purifier (Heroic)
    function() T(t[11628], u[311]); end, -- Vestments of the Purifier (Mythic)
    function() T(t[11628], u[1005]); end, -- Dreadwyrm Battleplate (Raid Finder)
    function() T(t[11628], u[1002]); end, -- Dreadwyrm Battleplate (Normal)
    function() T(t[11628], u[1003]); end, -- Dreadwyrm Battleplate (Heroic)
    function() T(t[11628], u[1004]); end, -- Dreadwyrm Battleplate (Mythic)
    function() T(t[11628], u[936]); end, -- Regalia of Shackled Elements (Raid Finder)
    function() T(t[11628], u[933]); end, -- Regalia of Shackled Elements (Normal)
    function() T(t[11628], u[934]); end, -- Regalia of Shackled Elements (Heroic)
    function() T(t[11628], u[935]); end, -- Regalia of Shackled Elements (Mythic)
    function() T(t[11628], u[989]); end, -- Regalia of Everburning Knowledge (Raid Finder)
    function() T(t[11628], u[986]); end, -- Regalia of Everburning Knowledge (Normal)
    function() T(t[11628], u[987]); end, -- Regalia of Everburning Knowledge (Heroic)
    function() T(t[11628], u[988]); end, -- Regalia of Everburning Knowledge (Mythic)
    function() T(t[11628], u[941]); end, -- Legacy of Azj'aqir (Raid Finder)
    function() T(t[11628], u[315]); end, -- Legacy of Azj'Aqir (Normal)
    function() T(t[11628], u[316]); end, -- Legacy of Azj'Aqir (Heroic)
    function() T(t[11628], u[321]); end, -- Legacy of Azj'Aqir (Mythic)
    function() T(t[11628], u[985]); end, -- Vestments of Enveloped Dissonance (Raid Finder)
    function() T(t[11628], u[982]); end, -- Vestments of Enveloped Dissonance (Normal)
    function() T(t[11628], u[983]); end, -- Vestments of Enveloped Dissonance (Heroic)
    function() T(t[11628], u[984]); end, -- Vestments of Enveloped Dissonance (Mythic)
    function() T(t[11628], u[997]); end, -- Garb of the Astral Warden (Raid Finder)
    function() T(t[11628], u[994]); end, -- Garb of the Astral Warden (Normal)
    function() T(t[11628], u[995]); end, -- Garb of the Astral Warden (Heroic)
    function() T(t[11628], u[996]); end, -- Garb of the Astral Warden (Mythic)
    function() T(t[11628], u[1001]); end, -- Vestment of Second Sight (Raid Finder)
    function() T(t[11628], u[998]); end, -- Vestment of Second Sight (Normal)
    function() T(t[11628], u[999]); end, -- Vestment of Second Sight (Heroic)
    function() T(t[11628], u[1000]); end, -- Vestment of Second Sight (Mythic)
    function() t[11628] = a:New(11628); end, -- That's So Last Millennium
    function() O(t[11612], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11612] = a:New(11612); end, -- Fighting with Style: Challenging
    function() O(t[11611], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11611] = a:New(11611); end, -- A Challenging Look
    function() t[11610] = a:New(11610); end, -- Power Unleashed
    function() t[11609] = a:New(11609); end, -- Power Unbound
    function() t[11607] = a:New(11607); end, -- They See Me Rolling
    function() O(t[11581], "From", "Version", "070100", "Before", "Version", "070205"); end,
    function() t[11581] = a:New(11581); end, -- Ahead of the Curve: Helya
    function() O(t[11580], "From", "Version", "070100", "Before", "Version", "070205"); end,
    function() t[11580] = a:New(11580); end, -- Cutting Edge: Helya
    function() O(t[11579], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11579] = a:New(11579, nil, nil, true); end, -- Fearless Elite
    function() O(t[11578], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11578] = a:New(11578, nil, nil, true); end, -- Vindictive Elite
    function() O(t[11573], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[11573] = a:New(11573); end, -- Rumble Club
    function() O(t[11572], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11572] = a:New(11572); end, -- I Am Thrall's Complete Lack Of Surprise (Season 3)
    function() O(t[11570], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[11570] = a:New(11570); end, -- Educated Guesser
    function() O(t[11567], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[11567] = a:New(11567); end, -- You Are Not The Contents Of Your Wallet
    function() O(t[11566], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11566] = a:New(11566, f.Horde, 11565); end, -- King of the Guild (Season 3)
    function() O(t[11565], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11565] = a:New(11565, f.Alliance, 11566); end, -- King of the Guild (Season 3)
    function() O(t[11564], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11564] = a:New(11564, f.Horde, 11563); end, -- The Second Rule of Brawler's Guild (Season 3)
    function() O(t[11563], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11563] = a:New(11563, f.Alliance, 11564); end, -- The Second Rule of Brawler's Guild (Season 3)
    function() O(t[11561], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11561] = a:New(11561, f.Horde, 11560); end, -- You Are Not Your $#*@! Legplates (Season 3)
    function() O(t[11560], "From", "Version", "070105", "Before", "Version", "080001"); end,
    function() t[11560] = a:New(11560, f.Alliance, 11561); end, -- You Are Not Your $#*@! Legplates (Season 3)
    function() O(t[11559], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[11559] = a:New(11559, f.Horde, 11558); end, -- The First Rule of Brawler's Guild
    function() O(t[11558], "From", "Version", "080105", "Before", "Version", "090001"); end,
    function() t[11558] = a:New(11558, f.Alliance, 11559); end, -- The First Rule of Brawler's Guild
    function() t[11546] = a:New(11546); end, -- Breaching the Tomb
    function() t[11545] = a:New(11545); end, -- Legionfall Commander
    function() t[11544] = a:New(11544); end, -- Defender of the Broken Isles
    function() t[11543] = a:New(11543); end, -- Explore Broken Shore
    function() t[11478] = a:New(11478); end, -- The Darkbrul-oh
    function() t[11477] = a:New(11477); end, -- Off the Top Rook
    function() t[11476] = a:New(11476); end, -- Saddle Sore
    function() t[11475] = a:New(11475); end, -- Mission Accomplished
    function() t[11474] = a:New(11474, nil, nil, true); end, -- "Free For All, More For Me"
    function() O(t[11472], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11472] = a:New(11472, nil, nil, true); end, -- "Hell, It's About Nine"
    function() O(t[11471], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11471] = a:New(11471, nil, nil, true); end, -- "Don't Hate, Grind to Eight"
    function() O(t[11470], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11470] = a:New(11470, nil, nil, true); end, -- Slayin' to Seven
    function() O(t[11469], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11469] = a:New(11469, nil, nil, true); end, -- The River Six
    function() O(t[11468], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11468] = a:New(11468, nil, nil, true); end, -- Alive for Five
    function() t[11446] = a:New(11446); end, -- "Broken Isles Pathfinder, Part Two"
    function() t[11433] = a:New(11433); end, -- Burn After Reading
    function() t[11432] = a:New(11432); end, -- Scared Straight
    function() t[11431] = a:New(11431); end, -- The Rat Pack
    function() t[11430] = a:New(11430); end, -- One Night in Karazhan
    function() t[11429] = a:New(11429); end, -- Mythic: Return to Karazhan
    function() t[11427] = a:New(11427); end, -- No Shellfish Endeavor
    function() t[11426] = a:New(11426); end, -- Heroic: Trial of Valor
    function() O(t[11425]); end,
    function() t[11425] = a:New(11425); end, -- Herald of Flames
    function() t[11398] = a:New(11398); end, -- Mythic: Helya
    function() t[11397] = a:New(11397); end, -- Mythic: Guarm
    function() t[11396] = a:New(11396); end, -- Mythic: Odyn
    function() O(t[11395]); end,
    function() t[11395] = a:New(11395); end, -- Diablo's 20th Anniversary
    function() t[11394] = a:New(11394); end, -- Trial of Valor
    function() O(t[11387], "From", "Version", "070100", "Before", "Version", "080001"); end,
    function() t[11387] = a:New(11387); end, -- The Chosen
    function() t[11386] = a:New(11386); end, -- Boneafide Tri Tip
    function() t[11377] = a:New(11377); end, -- Patient Zero
    function() t[11340] = a:New(11340); end, -- Insurrection
    function() t[11338] = a:New(11338); end, -- Dine and Bash
    function() t[11337] = a:New(11337); end, -- You Runed Everything!
    function() t[11335] = a:New(11335); end, -- Season Tickets
    function() t[11320] = a:New(11320); end, -- Raiding with Leashes IV: Wrath of the Lick King
    function() t[11298] = a:New(11298); end, -- A Classy Outfit
    function() O(t[11297], "From", "Version", "030002", "Before", "Version", "040003a"); end,
    function() t[11297] = a:New(11297); end, -- The Balance of Light and Shadow
    function() O(t[11296], "From", "Version", "030002", "Before", "Version", "040003a"); end,
    function() t[11296] = a:New(11296); end, -- The Ancient Keeper
    function() t[11294] = a:New(11294); end, -- Murloc Battlemasters
    function() t[11284] = a:New(11284, f.Horde, 11283); end, -- Flame Keeper of Draenor
    function() t[11283] = a:New(11283, f.Alliance, 11284); end, -- Flame Warden of Draenor
    function() t[11282] = a:New(11282, f.Horde, 11280); end, -- Flame Keeper of the Broken Isles
    function() t[11280] = a:New(11280, f.Alliance, 11282); end, -- Flame Warden of the Broken Isles
    function() t[11279] = a:New(11279, f.Horde, 11278); end, -- Extinguishing the Broken Isles
    function() t[11278] = a:New(11278, f.Alliance, 11279); end, -- Extinguishing the Broken Isles
    function() t[11277] = a:New(11277, f.Horde, 11276); end, -- Extinguishing Draenor
    function() t[11276] = a:New(11276, f.Alliance, 11277); end, -- Extinguishing Draenor
    function() t[11265] = a:New(11265); end, -- Adventurer of Suramar
    function() t[11264] = a:New(11264); end, -- Adventurer of Highmountain
    function() t[11263] = a:New(11263); end, -- Adventurer of Stormheim
    function() t[11262] = a:New(11262); end, -- Adventurer of Val'sharah
    function() t[11261] = a:New(11261); end, -- Adventurer of Azsuna
    function() t[11260] = a:New(11260); end, -- Treasures of Suramar
    function() t[11259] = a:New(11259); end, -- Treasures of Stormheim
    function() t[11258] = a:New(11258); end, -- Treasures of Val'sharah
    function() t[11257] = a:New(11257); end, -- Treasures of Highmountain
    function() t[11256] = a:New(11256); end, -- Treasures of Azsuna
    function() t[11240] = a:New(11240); end, -- Harbinger
    function() t[11233] = a:New(11233); end, -- Broken Isles Safari
    function() t[11232] = a:New(11232); end, -- "Lock, Stock and Two Smoking Goblins"
    function() O(t[11224], "Once"); end,
    function() t[11224] = a:New(11224, nil, nil, nil, true); end, -- Realm First! Legion Keystone Master
    function() t[11223] = a:New(11223); end, -- Legendary Research
    function() t[11222] = a:New(11222); end, -- Champions of Power
    function() t[11221] = a:New(11221); end, -- Champions Rise
    function() t[11220] = a:New(11220); end, -- Roster of Champions
    function() t[11219] = a:New(11219); end, -- Need Backup
    function() O(t[11218], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11218] = a:New(11218); end, -- There's a Boss In There
    function() t[11217] = a:New(11217); end, -- "Many Many Missions, Handle It!"
    function() t[11216] = a:New(11216); end, -- So Many Missions
    function() t[11215] = a:New(11215); end, -- Quite a Few Missions
    function() t[11214] = a:New(11214); end, -- Many Missions
    function() t[11213] = a:New(11213); end, -- Lead a Legion
    function() t[11212] = a:New(11212); end, -- Raise an Army
    function() O(t[11211]); end,
    function() t[11211] = a:New(11211); end, -- Fight for the Horde
    function() O(t[11210]); end,
    function() t[11210] = a:New(11210); end, -- Fight for the Alliance
    function() O(t[11201], "From", "Version", "070003", "Until", "Version", "070003"); end,
    function() t[11201] = a:New(11201); end, -- Defender of Azeroth: Legion Invasions
    function() O(t[11200], "From", "Version", "070003", "Until", "Version", "070003"); end,
    function() t[11200] = a:New(11200); end, -- Stand Against the Legion
    function() O(t[11195], "From", "Version", "070105", "Before", "Version", "070205"); end,
    function() t[11195] = a:New(11195); end, -- Ahead of the Curve: Gul'dan
    function() O(t[11194], "From", "Version", "070003", "Before", "Version", "070105"); end,
    function() t[11194] = a:New(11194); end, -- Ahead of the Curve: Xavius
    function() O(t[11192], "From", "Version", "070105", "Before", "Version", "070205"); end,
    function() t[11192] = a:New(11192); end, -- Cutting Edge: Gul'dan
    function() O(t[11191], "From", "Version", "070003", "Before", "Version", "070105"); end,
    function() t[11191] = a:New(11191); end, -- Cutting Edge: Xavius
    function() t[11190] = a:New(11190); end, -- "Broken Isles Pathfinder, Part One"
    function() t[11189] = a:New(11189); end, -- Variety is the Spice of Life
    function() t[11188] = a:New(11188); end, -- Broken Isles Explorer
    function() t[11186] = a:New(11186); end, -- Tehd & Marius' Excellent Adventure
    function() t[11185] = a:New(11185); end, -- Keystone Conqueror
    function() t[11184] = a:New(11184); end, -- Keystone Challenger
    function() t[11183] = a:New(11183); end, -- Keystone Initiate
    function() O(t[11181], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11181] = a:New(11181); end, -- Legion Keymaster
    function() t[11180] = a:New(11180); end, -- Glory of the Legion Raider
    function() t[11178] = a:New(11178); end, -- Wake the Dragon
    function() t[11177] = a:New(11177); end, -- 70 Exalted Reputations
    function() t[11176] = a:New(11176); end, -- Remember to Share
    function() t[11175] = a:New(11175); end, -- Higher Dimensional Learning
    function() t[11173] = a:New(11173, f.Horde, 10749); end, -- Fighting with Style: War-torn
    function() t[11171] = a:New(11171); end, -- Arsenal of Power
    function() O(t[11170], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11170] = a:New(11170, f.Horde, 11169, true); end, -- Crest of Devastation
    function() O(t[11169], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11169] = a:New(11169, f.Alliance, 11170, true); end, -- Crest of Devastation
    function() O(t[11168], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11168] = a:New(11168, f.Horde, 11167, true); end, -- Crest of Carnage
    function() O(t[11167], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11167] = a:New(11167, f.Alliance, 11168, true); end, -- Crest of Carnage
    function() O(t[11166], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11166] = a:New(11166, f.Horde, 11165, true); end, -- Crest of Heroism
    function() O(t[11165], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[11165] = a:New(11165, f.Alliance, 11166, true); end, -- Crest of Heroism
    function() t[11164] = a:New(11164); end, -- Legion Dungeon Hero
    function() t[11163] = a:New(11163); end, -- Glory of the Legion Hero
    function() t[11162] = a:New(11162); end, -- Keystone Master
    function() t[11160] = a:New(11160); end, -- Unleashed Monstrosities
    function() t[11159] = a:New(11159); end, -- Friends in a Broken Land
    function() t[11157] = a:New(11157); end, -- Loremaster of Legion
    function() O(t[11144], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11144] = a:New(11144); end, -- Power Realized
    function() O(t[11139], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11139] = a:New(11139); end, -- Field Medic
    function() O(t[11138], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[11138] = a:New(11138); end, -- Is There a Medic in the Zone?
    function() t[11137] = a:New(11137); end, -- A Legendary Campaign
    function() t[11136] = a:New(11136); end, -- An Epic Campaign
    function() t[11135] = a:New(11135); end, -- A Heroic Campaign
    function() t[11133] = a:New(11133); end, -- Why Can't I Hold All This Mana?
    function() t[11132] = a:New(11132); end, -- "10,000 World Quests Completed"
    function() t[11131] = a:New(11131); end, -- 5000 World Quests Completed
    function() t[11130] = a:New(11130); end, -- 2500 World Quests Completed
    function() t[11129] = a:New(11129); end, -- 1000 World Quests Completed
    function() t[11128] = a:New(11128); end, -- 500 World Quests Completed
    function() t[11127] = a:New(11127); end, -- 200 World Quests Completed
    function() t[11126] = a:New(11126); end, -- 50 World Quests Completed
    function() t[11125] = a:New(11125); end, -- Now You're Thinking With Portals
    function() t[11124] = a:New(11124); end, -- Good Suramaritan
    function() t[11066] = a:New(11066); end, -- Underbelly Tycoon
    function() O(t[11065], "From", "Version", "070003", "Until", "Version", "070003"); end,
    function() t[11065] = a:New(11065); end, -- It All Makes Sense Now
    function() t[11064] = a:New(11064); end, -- Collector's Edition: Baby Winston
    function() O(t[11062], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11062] = a:New(11062, nil, nil, true); end, -- Ferocious Gladiator: Legion Season 4
    function() O(t[11061], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11061] = a:New(11061, nil, nil, true); end, -- Gladiator: Legion Season 4
    function() O(t[11060], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11060] = a:New(11060, nil, nil, true); end, -- Challenger: Legion Season 4
    function() O(t[11059], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11059] = a:New(11059, nil, nil, true); end, -- Rival: Legion Season 4
    function() O(t[11058], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11058] = a:New(11058, nil, nil, true); end, -- Duelist: Legion Season 4
    function() O(t[11057], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11057] = a:New(11057, f.Horde, 11056, true); end, -- Hero of the Horde: Ferocious
    function() O(t[11056], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11056] = a:New(11056, f.Alliance, 11057, true); end, -- Hero of the Alliance: Ferocious
    function() O(t[11055], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11055] = a:New(11055, f.Horde, 11054, true); end, -- Defender of the Horde: Legion Season 4
    function() O(t[11054], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11054] = a:New(11054, f.Alliance, 11055, true); end, -- Defender of the Alliance: Legion Season 4
    function() O(t[11053], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11053] = a:New(11053, f.Horde, 11052, true); end, -- Guardian of the Horde: Legion Season 4
    function() O(t[11052], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11052] = a:New(11052, f.Alliance, 11053, true); end, -- Guardian of the Alliance: Legion Season 4
    function() O(t[11051], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11051] = a:New(11051, f.Horde, 11050, true); end, -- Soldier of the Horde: Legion Season 4
    function() O(t[11050], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11050] = a:New(11050, f.Alliance, 11051, true); end, -- Soldier of the Alliance: Legion Season 4
    function() O(t[11049], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11049] = a:New(11049, f.Alliance, 11048, true); end, -- Soldier of the Alliance: Legion Season 3
    function() O(t[11048], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11048] = a:New(11048, f.Horde, 11049, true); end, -- Soldier of the Horde: Legion Season 3
    function() O(t[11047], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11047] = a:New(11047, f.Alliance, 11046, true); end, -- Guardian of the Alliance: Legion Season 3
    function() O(t[11046], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11046] = a:New(11046, f.Horde, 11047, true); end, -- Guardian of the Horde: Legion Season 3
    function() O(t[11045], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11045] = a:New(11045, f.Alliance, 11044, true); end, -- Defender of the Alliance: Legion Season 3
    function() O(t[11044], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11044] = a:New(11044, f.Horde, 11045, true); end, -- Defender of the Horde: Legion Season 3
    function() O(t[11043], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11043] = a:New(11043, f.Alliance, 11042, true); end, -- Hero of the Alliance: Cruel
    function() O(t[11042], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11042] = a:New(11042, f.Horde, 11043, true); end, -- Hero of the Horde: Cruel
    function() O(t[11041], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11041] = a:New(11041, nil, nil, true); end, -- Duelist: Legion Season 3
    function() O(t[11040], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11040] = a:New(11040, nil, nil, true); end, -- Rival: Legion Season 3
    function() O(t[11039], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11039] = a:New(11039, nil, nil, true); end, -- Challenger: Legion Season 3
    function() O(t[11038], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11038] = a:New(11038, nil, nil, true); end, -- Gladiator: Legion Season 3
    function() O(t[11037], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11037] = a:New(11037, nil, nil, true); end, -- Cruel Gladiator: Legion Season 3
    function() O(t[11036], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11036] = a:New(11036, f.Alliance, 11035, true); end, -- Soldier of the Alliance: Legion Season 2
    function() O(t[11035], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11035] = a:New(11035, f.Horde, 11036, true); end, -- Soldier of the Horde: Legion Season 2
    function() O(t[11034], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11034] = a:New(11034, f.Alliance, 11033, true); end, -- Defender of the Alliance: Legion Season 2
    function() O(t[11033], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11033] = a:New(11033, f.Horde, 11034, true); end, -- Defender of the Horde: Legion Season 2
    function() O(t[11032], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11032] = a:New(11032, f.Alliance, 11031, true); end, -- Guardian of the Alliance: Legion Season 2
    function() O(t[11031], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11031] = a:New(11031, f.Horde, 11032, true); end, -- Guardian of the Horde: Legion Season 2
    function() O(t[11030], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11030] = a:New(11030, f.Alliance, 11029, true); end, -- Hero of the Alliance: Fearless
    function() O(t[11029], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11029] = a:New(11029, f.Horde, 11030, true); end, -- Hero of the Horde: Fearless
    function() O(t[11028], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11028] = a:New(11028, nil, nil, true); end, -- Challenger: Legion Season 2
    function() O(t[11027], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11027] = a:New(11027, nil, nil, true); end, -- Rival: Legion Season 2
    function() O(t[11026], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11026] = a:New(11026, nil, nil, true); end, -- Duelist: Legion Season 2
    function() O(t[11025], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11025] = a:New(11025, f.Horde, 11024, true); end, -- Soldier of the Horde: Legion Season 1
    function() O(t[11024], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11024] = a:New(11024, f.Alliance, 11025, true); end, -- Soldier of the Alliance: Legion Season 1
    function() O(t[11023], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11023] = a:New(11023, f.Horde, 11022, true); end, -- Defender of the Horde: Legion Season 1
    function() O(t[11022], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11022] = a:New(11022, f.Alliance, 11023, true); end, -- Defender of the Alliance: Legion Season 1
    function() O(t[11021], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11021] = a:New(11021, f.Horde, 11020, true); end, -- Guardian of the Horde: Legion Season 1
    function() O(t[11020], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11020] = a:New(11020, f.Alliance, 11021, true); end, -- Guardian of the Alliance: Legion Season 1
    function() O(t[11019], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11019] = a:New(11019, f.Horde, 11018, true); end, -- Hero of the Horde: Vindictive
    function() O(t[11018], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11018] = a:New(11018, f.Alliance, 11019, true); end, -- Hero of the Alliance: Vindictive
    function() O(t[11017], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11017] = a:New(11017, nil, nil, true); end, -- Challenger: Legion Season 1
    function() O(t[11016], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11016] = a:New(11016, nil, nil, true); end, -- Rival: Legion Season 1
    function() O(t[11015], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11015] = a:New(11015, nil, nil, true); end, -- Duelist: Legion Season 1
    function() O(t[11014], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11014] = a:New(11014, nil, nil, true); end, -- Fearless Gladiator: Legion Season 2
    function() O(t[11013], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11013] = a:New(11013, nil, nil, true); end, -- Gladiator: Legion Season 2
    function() O(t[11012], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11012] = a:New(11012, nil, nil, true); end, -- Vindictive Gladiator: Legion Season 1
    function() O(t[11011], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[11011] = a:New(11011, nil, nil, true); end, -- Gladiator: Legion Season 1
    function() O(t[11010], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11010] = a:New(11010, f.Alliance, 11009, true); end, -- Ferocious Combatant
    function() O(t[11009], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11009] = a:New(11009, f.Horde, 11010, true); end, -- Ferocious Combatant
    function() O(t[11008], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11008] = a:New(11008, f.Alliance, 11005, true); end, -- Cruel Combatant
    function() O(t[11005], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11005] = a:New(11005, f.Horde, 11008, true); end, -- Cruel Combatant
    function() O(t[11004], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11004] = a:New(11004, f.Alliance, 11003, true); end, -- Fearless Combatant
    function() O(t[11003], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11003] = a:New(11003, f.Horde, 11004, true); end, -- Fearless Combatant
    function() O(t[11002], "From", "PvP Season", 22, "Until", "PvP Season", 22); end,
    function() t[11002] = a:New(11002, nil, nil, true); end, -- Ferocious Gladiator's Storm Dragon
    function() O(t[11001], "From", "PvP Season", 21, "Until", "PvP Season", 21); end,
    function() t[11001] = a:New(11001, nil, nil, true); end, -- Cruel Gladiator's Storm Dragon
    function() O(t[11000], "From", "PvP Season", 20, "Until", "PvP Season", 20); end,
    function() t[11000] = a:New(11000, nil, nil, true); end, -- Fearless Gladiator's Storm Dragon
    function() O(t[10999], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[10999] = a:New(10999, nil, nil, true); end, -- Vindictive Gladiator's Storm Dragon
    function() O(t[10998], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[10998] = a:New(10998, f.Alliance, 10997, true); end, -- Vindictive Combatant
    function() O(t[10997], "From", "PvP Season", 19, "Until", "PvP Season", 19); end,
    function() t[10997] = a:New(10997, f.Horde, 10998, true); end, -- Vindictive Combatant
    function() t[10996] = a:New(10996); end, -- Got to Ketchum All
    function() O(t[10995], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10995] = a:New(10995, nil, nil, true); end, -- For Prestige
    function() t[10994] = a:New(10994); end, -- A Glorious Campaign
    function() O(t[10993], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10993] = a:New(10993, nil, nil, true); end, -- Third Time's the Charm
    function() O(t[10992], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10992] = a:New(10992, nil, nil, true); end, -- Here We Go Again
    function() O(t[10991], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10991] = a:New(10991, nil, nil, true); end, -- First Step into a Larger World
    function() t[10877] = a:New(10877); end, -- Pillars of Creation
    function() t[10876] = a:New(10876); end, -- Battle on the Broken Isles
    function() t[10875] = a:New(10875); end, -- Can't Eat Just One
    function() O(t[10853], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10853] = a:New(10853); end, -- Part of History
    function() O(t[10852], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10852] = a:New(10852); end, -- Artifact or Artifiction
    function() t[10851] = a:New(10851); end, -- Elementalry!
    function() t[10850] = a:New(10850); end, -- Mythic: Gul'dan
    function() t[10849] = a:New(10849); end, -- Mythic: Grand Magistrix Elisande
    function() t[10848] = a:New(10848); end, -- Mythic: Krosus
    function() t[10847] = a:New(10847); end, -- Mythic: Tichondrius
    function() t[10846] = a:New(10846); end, -- Mythic: High Botanist Tel'arn
    function() t[10845] = a:New(10845); end, -- Mythic: Star Augur Etraeus
    function() t[10844] = a:New(10844); end, -- Mythic: Spellblade Aluriel
    function() t[10843] = a:New(10843); end, -- Mythic: Trilliax
    function() t[10842] = a:New(10842); end, -- Mythic: Chronomatic Anomaly
    function() t[10840] = a:New(10840); end, -- Mythic: Skorpyron
    function() t[10839] = a:New(10839); end, -- Betrayer's Rise
    function() t[10838] = a:New(10838); end, -- Nightspire
    function() t[10837] = a:New(10837); end, -- Royal Athenaeum
    function() t[10830] = a:New(10830); end, -- Took the Red Eye Down
    function() t[10829] = a:New(10829); end, -- Arcing Aqueducts
    function() t[10827] = a:New(10827); end, -- Mythic: Xavius
    function() t[10826] = a:New(10826); end, -- Mythic: Cenarius
    function() t[10825] = a:New(10825); end, -- Mythic: Dragons of Nightmare
    function() t[10824] = a:New(10824); end, -- Mythic: Ursoc
    function() t[10823] = a:New(10823); end, -- Mythic: Il'gynoth
    function() t[10822] = a:New(10822); end, -- Mythic: Elerethe Renferal
    function() t[10821] = a:New(10821); end, -- Mythic: Nythendra
    function() t[10820] = a:New(10820); end, -- Rift of Aln
    function() t[10819] = a:New(10819); end, -- Tormented Guardians
    function() t[10818] = a:New(10818); end, -- Darkbough
    function() t[10817] = a:New(10817); end, -- A Change In Scenery
    function() t[10816] = a:New(10816); end, -- Mythic: Court of Stars
    function() t[10813] = a:New(10813); end, -- Mythic: The Arcway
    function() t[10809] = a:New(10809); end, -- Mythic: Maw of Souls
    function() t[10808] = a:New(10808); end, -- Heroic: Maw of Souls
    function() t[10807] = a:New(10807); end, -- Maw of Souls
    function() t[10806] = a:New(10806); end, -- Mythic: Black Rook Hold
    function() t[10805] = a:New(10805); end, -- Heroic: Black Rook Hold
    function() t[10804] = a:New(10804); end, -- Black Rook Hold
    function() t[10803] = a:New(10803); end, -- Mythic: Vault of the Wardens
    function() t[10802] = a:New(10802); end, -- Heroic: Vault of the Wardens
    function() t[10801] = a:New(10801); end, -- Vault of the Wardens
    function() t[10800] = a:New(10800); end, -- Mythic: Assault on Violet Hold
    function() t[10799] = a:New(10799); end, -- Heroic: Assault on Violet Hold
    function() t[10798] = a:New(10798); end, -- Assault on Violet Hold
    function() t[10797] = a:New(10797); end, -- Mythic: Neltharion's Lair
    function() t[10796] = a:New(10796); end, -- Heroic: Neltharion's Lair
    function() t[10795] = a:New(10795); end, -- Neltharion's Lair
    function() t[10793] = a:New(10793); end, -- What a Ripoff!
    function() t[10790] = a:New(10790); end, -- "Vrykul Story, Bro"
    function() t[10789] = a:New(10789); end, -- Mythic: Halls of Valor
    function() t[10788] = a:New(10788); end, -- Heroic: Halls of Valor
    function() t[10786] = a:New(10786); end, -- Halls of Valor
    function() t[10785] = a:New(10785); end, -- Mythic: Darkheart Thicket
    function() t[10784] = a:New(10784); end, -- Heroic: Darkheart Thicket
    function() t[10783] = a:New(10783); end, -- Darkheart Thicket
    function() t[10782] = a:New(10782); end, -- Mythic: Eye of Azshara
    function() t[10781] = a:New(10781); end, -- Heroic: Eye of Azshara
    function() t[10780] = a:New(10780); end, -- Eye of Azshara
    function() t[10778] = a:New(10778); end, -- The Nightfallen
    function() t[10776] = a:New(10776); end, -- No Time to Waste
    function() t[10775] = a:New(10775); end, -- Clean House
    function() t[10774] = a:New(10774); end, -- Hatchling of the Talon
    function() t[10773] = a:New(10773); end, -- Arcanic Cling
    function() t[10772] = a:New(10772); end, -- Use the Force(s)
    function() t[10771] = a:New(10771); end, -- Webbing Crashers
    function() t[10770] = a:New(10770); end, -- The Tangerine Traveler
    function() t[10769] = a:New(10769); end, -- Burning Down the House
    function() t[10766] = a:New(10766); end, -- Egg-cellent!
    function() O(t[10765], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10765] = a:New(10765); end, -- Brokenly Epic
    function() O(t[10764], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10764] = a:New(10764); end, -- Brokenly Superior
    function() t[10763] = a:New(10763); end, -- Azsuna Matata
    function() t[10762] = a:New(10762); end, -- The Legion Menu
    function() t[10761] = a:New(10761); end, -- Resourceful
    function() t[10756] = a:New(10756); end, -- Leyline Bling
    function() t[10755] = a:New(10755); end, -- I Attack the Darkness
    function() t[10754] = a:New(10754); end, -- Fruit of All Evil
    function() t[10753] = a:New(10753); end, -- Scare Bear
    function() t[10751] = a:New(10751); end, -- Brr... It's Cold in Here
    function() t[10750] = a:New(10750); end, -- Fighting with Style: Hidden
    function() t[10749] = a:New(10749, f.Alliance, 11173, true); end, -- Fighting with Style: War-torn
    function() t[10748] = a:New(10748); end, -- Fighting with Style: Valorous
    function() O(t[10747], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10747] = a:New(10747); end, -- Fighting with Style: Upgraded
    function() t[10746] = a:New(10746); end, -- Forged for Battle
    function() O(t[10745], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10745] = a:New(10745, f.Horde, 10743, true); end, -- The Prestige
    function() O(t[10743], "From", "PvP Season", 19, "Until", "PvP Season", 25); end,
    function() t[10743] = a:New(10743, f.Alliance, 10745, true); end, -- The Prestige
    function() t[10742] = a:New(10742); end, -- Gluten Free
    function() O(t[10741]); end,
    function() t[10741] = a:New(10741); end, -- WoW's 12th Anniversary
    function() t[10722] = a:New(10722); end, -- The Wish Remover
    function() t[10711] = a:New(10711); end, -- Adds? More Like Bads
    function() t[10710] = a:New(10710); end, -- Black Rook Moan
    function() t[10709] = a:New(10709); end, -- You Used to Scrawl Me In Your Fel Tome
    function() t[10707] = a:New(10707); end, -- "A Specter, Illuminated"
    function() t[10706] = a:New(10706); end, -- Training the Troops
    function() t[10704] = a:New(10704); end, -- Not For You
    function() t[10699] = a:New(10699); end, -- Infinitesimal
    function() t[10698] = a:New(10698); end, -- That's Val'sharah Folks!
    function() t[10697] = a:New(10697); end, -- Grand Opening
    function() t[10696] = a:New(10696); end, -- I've Got My Eyes On You
    function() t[10694] = a:New(10694); end, -- Fabulous
    function() t[10693] = a:New(10693); end, -- Fashionista: Hand
    function() t[10692] = a:New(10692); end, -- Fashionista: Shoulder
    function() t[10691] = a:New(10691); end, -- Fashionista: Shirt
    function() t[10690] = a:New(10690); end, -- Fashionista: Tabard
    function() t[10689] = a:New(10689); end, -- Fashionista: Weapon & Off-Hand
    function() t[10688] = a:New(10688); end, -- Fashionista: Wrist
    function() t[10687] = a:New(10687); end, -- Fashionista: Back
    function() t[10686] = a:New(10686); end, -- Fashionista: Waist
    function() t[10685] = a:New(10685); end, -- Fashionista: Feet
    function() t[10684] = a:New(10684); end, -- Fashionista: Legs
    function() t[10682] = a:New(10682); end, -- Fashionista: Chest
    function() t[10681] = a:New(10681); end, -- Fashionista: Head
    function() t[10680] = a:New(10680); end, -- Who's Afraid of the Dark?
    function() t[10679] = a:New(10679); end, -- I Ain't Even Cold
    function() t[10678] = a:New(10678); end, -- Cage Rematch
    function() t[10672] = a:New(10672); end, -- Broken Isles Diplomat
    function() O(t[10671], "From", "Version", "070003", "Before", "Version", "090001"); end,
    function() t[10671] = a:New(10671); end, -- Level 110 (Legacy)
    function() t[10669] = a:New(10669); end, -- Explore Suramar
    function() t[10668] = a:New(10668); end, -- Explore Stormheim
    function() t[10667] = a:New(10667); end, -- Explore Highmountain
    function() t[10666] = a:New(10666); end, -- Explore Val'sharah
    function() t[10665] = a:New(10665); end, -- Explore Azsuna
    function() t[10663] = a:New(10663); end, -- Imagined Dragons World Tour
    function() t[10657] = a:New(10657); end, -- Fledgling Hero of Warcraft
    function() t[10627] = a:New(10627); end, -- Going Up
    function() t[10626] = a:New(10626); end, -- Zoom!
    function() t[10617] = a:New(10617); end, -- Nightfallen But Not Forgotten
    function() t[10611] = a:New(10611); end, -- Dropping Some Eaves
    function() t[10610] = a:New(10610); end, -- Waiting for Gerdo
    function() t[10609] = a:New(10609); end, -- No Stone Unturned
    function() t[10608] = a:New(10608); end, -- Sifting Through the Sand
    function() t[10607] = a:New(10607); end, -- Getting Your Hands Dirty
    function() t[10606] = a:New(10606); end, -- The Dwarven Dream
    function() t[10605] = a:New(10605); end, -- Handle With Care
    function() t[10604] = a:New(10604); end, -- Legion Curator
    function() t[10603] = a:New(10603); end, -- A Keen Eye
    function() t[10602] = a:New(10602); end, -- This Side Up
    function() t[10601] = a:New(10601); end, -- Surveying the Land
    function() t[10600] = a:New(10600); end, -- Legion Archaeologist
    function() O(t[10599], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10599] = a:New(10599); end, -- Legion Medic
    function() t[10598] = a:New(10598); end, -- Fishing 'Round the Isles
    function() t[10597] = a:New(10597); end, -- Legion Aquaculture
    function() t[10596] = a:New(10596); end, -- Bigger Fish to Fry
    function() t[10595] = a:New(10595); end, -- A Cast Above the Rest
    function() t[10594] = a:New(10594); end, -- Legion Fisherman
    function() t[10593] = a:New(10593); end, -- Everything Tastes Better
    function() t[10592] = a:New(10592); end, -- Never A Day's Rest
    function() t[10591] = a:New(10591); end, -- All Grown Up
    function() t[10589] = a:New(10589); end, -- Legion Cook
    function() t[10588] = a:New(10588); end, -- The Shortest Distance
    function() t[10587] = a:New(10587); end, -- Hot Swapper
    function() O(t[10586], "From", "Version", "070003", "Before", "Version", "090100"); end,
    function() t[10586] = a:New(10586); end, -- Mass Obliteration
    function() O(t[10585], "From", "Version", "070003", "Before", "Version", "090100"); end,
    function() t[10585] = a:New(10585); end, -- Fel-Smelter
    function() t[10583] = a:New(10583); end, -- Legion Master of All
    function() t[10582] = a:New(10582); end, -- Professional Legion Master
    function() t[10581] = a:New(10581); end, -- Working the Isles
    function() O(t[10580], "From", "Version", "070003", "Before", "Version", "080001"); end,
    function() t[10580] = a:New(10580); end, -- Heroic Skills to Pay the Bills
    function() t[10575] = a:New(10575); end, -- Burning Bridges
    function() t[10561] = a:New(10561, nil, nil, true); end, -- Honorable Medallion
    function() t[10555] = a:New(10555); end, -- Buggy Fight
    function() t[10554] = a:New(10554); end, -- I Made a Food!
    function() t[10553] = a:New(10553); end, -- You're Just Making It WORSE!
    function() t[10544] = a:New(10544); end, -- Stag Party
    function() t[10543] = a:New(10543); end, -- Surge Protector
    function() t[10542] = a:New(10542); end, -- I Got What You Mead
    function() O(t[10537]); end,
    function() t[10537] = a:New(10537); end, -- Patron of War
    function() t[10461] = a:New(10461); end, -- Fighting with Style: Classic
    function() t[10460] = a:New(10460); end, -- Hidden Potential
    function() t[10459] = a:New(10459); end, -- Improving on History
    function() t[10458] = a:New(10458); end, -- Ready for Raiding V
    function() t[10457] = a:New(10457); end, -- Stay Salty
    function() t[10456] = a:New(10456); end, -- But You Say He's Just a Friend
    function() t[10413] = a:New(10413); end, -- Instant Karma
    function() t[10412] = a:New(10412); end, -- Poor Unfortunate Souls
    function() t[10411] = a:New(10411); end, -- Helheim Hath No Fury
    function() t[10398] = a:New(10398); end, -- Drum Circle
    function() t[10365] = a:New(10365); end, -- A Frightening Friend
    function() t[10356] = a:New(10356, f.Alliance, 10355); end, -- Lord of the Reins
    function() t[10355] = a:New(10355, f.Horde, 10356); end, -- Lord of the Reins
    function() t[10354] = a:New(10354); end, -- Crashin' Thrashin' Commander
    function() t[10353] = a:New(10353); end, -- Iron Armada
    function() t[10350] = a:New(10350, f.Alliance, 10349); end, -- Tanaan Diplomat
    function() t[10349] = a:New(10349, f.Horde, 10350); end, -- Tanaan Diplomat
    function() t[10348] = a:New(10348); end, -- Master Treasure Hunter
    function() t[10337] = a:New(10337); end, -- Crashin' Thrashin' Flamer
    function() t[10335] = a:New(10335); end, -- Did Someone Say...?
    function() t[10334] = a:New(10334); end, -- Predator
    function() t[10322] = a:New(10322); end, -- Murkidan
    function() t[10321] = a:New(10321); end, -- Collector's Edition: Nibbles
    function() t[10320] = a:New(10320); end, -- Collector's Edition: Illidari Felstalker
    function() t[10309] = a:New(10309); end, -- Collector's Edition: Zeradar
    function() t[10307] = a:New(10307, f.Horde, 10167); end, -- Exploring the High Seas
    function() t[10276] = a:New(10276, f.Horde, 10174); end, -- Admiral
    function() t[10275] = a:New(10275, f.Horde, 10173); end, -- Fleet Commander
    function() t[10265] = a:New(10265, f.Horde, 10072); end, -- Rumble in the Jungle
    function() t[10262] = a:New(10262); end, -- Jungle Treasure Master
    function() t[10261] = a:New(10261); end, -- Jungle Treasure Hunter
    function() t[10260] = a:New(10260); end, -- Explore Tanaan Jungle
    function() t[10259] = a:New(10259); end, -- Jungle Hunter
    function() t[10258] = a:New(10258, f.Horde, 10256); end, -- Charting a Course
    function() t[10256] = a:New(10256, f.Alliance, 10258); end, -- Charting a Course
    function() t[10255] = a:New(10255, f.Horde, 10172); end, -- Petty Officer
    function() t[10253] = a:New(10253); end, -- Mythic: Gorefiend
    function() t[10177] = a:New(10177); end, -- Set Sail!
    function() t[10174] = a:New(10174, f.Alliance, 10276); end, -- Admiral
    function() t[10173] = a:New(10173, f.Alliance, 10275); end, -- Fleet Commander
    function() t[10172] = a:New(10172, f.Alliance, 10255); end, -- Petty Officer
    function() t[10170] = a:New(10170); end, -- Seaman
    function() t[10169] = a:New(10169); end, -- Naval Fleet
    function() t[10168] = a:New(10168); end, -- Naval Armada
    function() t[10167] = a:New(10167, f.Alliance, 10307); end, -- Exploring the High Seas
    function() t[10166] = a:New(10166); end, -- Naval Mechanics
    function() t[10165] = a:New(10165); end, -- Ironsides
    function() t[10164] = a:New(10164); end, -- Master of the Seas
    function() t[10163] = a:New(10163); end, -- Naval Training Expert
    function() t[10162] = a:New(10162); end, -- Naval Training Specialist
    function() t[10161] = a:New(10161); end, -- Naval Siege Specialist
    function() t[10160] = a:New(10160); end, -- Naval Treasure Expert
    function() t[10159] = a:New(10159); end, -- Naval Treasure Specialist
    function() t[10156] = a:New(10156); end, -- Naval Combat Specialist
    function() t[10155] = a:New(10155); end, -- Naval Siege Expert
    function() t[10154] = a:New(10154); end, -- Naval Combat Expert
    function() t[10149] = a:New(10149); end, -- Glory of the Hellfire Raider
    function() O(t[10148], "From", "Version", "060200", "Before", "Version", "070003"); end,
    function() t[10148] = a:New(10148, f.Horde, 10021); end, -- Chapter IV: Darkness Incarnate
    function() O(t[10146], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10146] = a:New(10146, nil, nil, true); end, -- Warmongering Gladiator's Felblood Gronnling
    function() O(t[10137], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10137] = a:New(10137, nil, nil, true); end, -- Wild Gladiator's Felblood Gronnling
    function() O(t[10121], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10121] = a:New(10121, f.Horde, 10120, true); end, -- Soldier of the Horde: Warlords Season 3
    function() O(t[10120], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10120] = a:New(10120, f.Alliance, 10121, true); end, -- Soldier of the Alliance: Warlords Season 3
    function() O(t[10119], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10119] = a:New(10119, f.Horde, 10118, true); end, -- Defender of the Horde: Warlords Season 3
    function() O(t[10118], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10118] = a:New(10118, f.Alliance, 10119, true); end, -- Defender of the Alliance: Warlords Season 3
    function() O(t[10117], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10117] = a:New(10117, f.Horde, 10116, true); end, -- Guardian of the Horde: Warlords Season 3
    function() O(t[10116], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10116] = a:New(10116, f.Alliance, 10117, true); end, -- Guardian of the Alliance: Warlords Season 3
    function() O(t[10115], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10115] = a:New(10115, f.Horde, 10114, true); end, -- Hero of the Horde: Warmongering
    function() O(t[10114], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10114] = a:New(10114, f.Alliance, 10115, true); end, -- Hero of the Alliance: Warmongering
    function() O(t[10113], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10113] = a:New(10113, nil, nil, true); end, -- Challenger: Warlords Season 3
    function() O(t[10112], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10112] = a:New(10112, nil, nil, true); end, -- Rival: Warlords Season 3
    function() O(t[10111], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10111] = a:New(10111, nil, nil, true); end, -- Duelist: Warlords Season 3
    function() O(t[10110], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10110] = a:New(10110, nil, nil, true); end, -- Gladiator: Warlords Season 3
    function() O(t[10109], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10109] = a:New(10109, f.Horde, 10108, true); end, -- Guardian of the Horde: Warlords Season 2
    function() O(t[10108], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10108] = a:New(10108, f.Alliance, 10109, true); end, -- Guardian of the Alliance: Warlords Season 2
    function() O(t[10107], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10107] = a:New(10107, f.Horde, 10106, true); end, -- Defender of the Horde: Warlords Season 2
    function() O(t[10106], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10106] = a:New(10106, f.Alliance, 10107, true); end, -- Defender of the Alliance: Warlords Season 2
    function() O(t[10105], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10105] = a:New(10105, f.Horde, 10104, true); end, -- Soldier of the Horde: Warlords Season 2
    function() O(t[10104], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10104] = a:New(10104, f.Alliance, 10105, true); end, -- Soldier of the Alliance: Warlords Season 2
    function() O(t[10103], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10103] = a:New(10103, f.Horde, 10102, true); end, -- Hero of the Horde: Wild
    function() O(t[10102], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10102] = a:New(10102, f.Alliance, 10103, true); end, -- Hero of the Alliance: Wild
    function() O(t[10101], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10101] = a:New(10101, nil, nil, true); end, -- Challenger: Warlords Season 2
    function() O(t[10100], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10100] = a:New(10100, nil, nil, true); end, -- Rival: Warlords Season 2
    function() O(t[10099], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10099] = a:New(10099, nil, nil, true); end, -- Duelist: Warlords Season 2
    function() O(t[10098], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10098] = a:New(10098, nil, nil, true); end, -- Gladiator: Warlords Season 2
    function() O(t[10097], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10097] = a:New(10097, nil, nil, true); end, -- Warmongering Gladiator: Warlords Season 3
    function() O(t[10096], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10096] = a:New(10096, nil, nil, true); end, -- Wild Gladiator: Warlords Season 2
    function() O(t[10095], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10095] = a:New(10095, f.Alliance, 10094, true); end, -- Warmongering Combatant
    function() O(t[10094], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10094] = a:New(10094, f.Horde, 10095, true); end, -- Warmongering Combatant
    function() O(t[10093], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10093] = a:New(10093, f.Alliance, 10092, true); end, -- Wild Combatant
    function() O(t[10092], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10092] = a:New(10092, f.Horde, 10093, true); end, -- Wild Combatant
    function() O(t[10091], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10091] = a:New(10091, f.Alliance, 10090, true); end, -- Warmongering Conquest
    function() O(t[10090], "From", "PvP Season", 18, "Until", "PvP Season", 18); end,
    function() t[10090] = a:New(10090, f.Horde, 10091, true); end, -- Warmongering Conquest
    function() O(t[10089], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10089] = a:New(10089, f.Alliance, 10088, true); end, -- Wild Conquest
    function() O(t[10088], "From", "PvP Season", 17, "Until", "PvP Season", 17); end,
    function() t[10088] = a:New(10088, f.Horde, 10089, true); end, -- Wild Conquest
    function() t[10087] = a:New(10087); end, -- You Gotta Keep 'em Separated
    function() t[10086] = a:New(10086); end, -- I'm a Soul Man
    function() t[10085] = a:New(10085); end, -- Mythic: Upper Blackrock Spire
    function() t[10084] = a:New(10084); end, -- Mythic: Shadowmoon Burial Grounds
    function() t[10083] = a:New(10083); end, -- Mythic: The Everbloom
    function() t[10082] = a:New(10082); end, -- Mythic: Grimrail Depot
    function() t[10081] = a:New(10081); end, -- Mythic: Skyreach
    function() t[10080] = a:New(10080); end, -- Mythic: Auchindoun
    function() t[10079] = a:New(10079); end, -- Mythic: Iron Docks
    function() t[10076] = a:New(10076); end, -- Mythic: Bloodmaul Slag Mines
    function() t[10075] = a:New(10075, f.Horde, 10068); end, -- Draenor's Last Stand
    function() t[10074] = a:New(10074, f.Horde, 10067); end, -- In Pursuit of Gul'dan
    function() t[10073] = a:New(10073); end, -- Echoes of Doomfire
    function() t[10072] = a:New(10072, f.Alliance, 10265); end, -- Rumble in the Jungle
    function() t[10071] = a:New(10071); end, -- The Legion Will NOT Conquer All
    function() t[10070] = a:New(10070); end, -- Jungle Stalker
    function() t[10069] = a:New(10069); end, -- "I Came, I Clawed, I Conquered"
    function() t[10068] = a:New(10068, f.Alliance, 10075); end, -- Draenor's Last Stand
    function() t[10067] = a:New(10067, f.Alliance, 10074); end, -- In Pursuit of Gul'dan
    function() t[10061] = a:New(10061); end, -- Hellbane
    function() t[10059] = a:New(10059); end, -- Ain't No Mountain High Enough
    function() O(t[10058]); end,
    function() t[10058] = a:New(10058); end, -- WoW's 11th Anniversary
    function() t[10057] = a:New(10057); end, -- Turning the Tide
    function() t[10054] = a:New(10054); end, -- Don't Fear the Reaper
    function() t[10053] = a:New(10053); end, -- I Found Pepe!
    function() t[10052] = a:New(10052); end, -- Tiny Terrors in Tanaan
    function() O(t[10045], "From", "Version", "060200", "Before", "Version", "070003"); end,
    function() t[10045] = a:New(10045); end, -- Cutting Edge: The Black Gate
    function() O(t[10044], "From", "Version", "060200", "Before", "Version", "070003"); end,
    function() t[10044] = a:New(10044); end, -- Ahead of the Curve: The Black Gate
    function() t[10043] = a:New(10043); end, -- Mythic: Archimonde
    function() t[10042] = a:New(10042); end, -- Mythic: Mannoroth
    function() t[10041] = a:New(10041); end, -- Mythic: Tyrant Velhari
    function() t[10040] = a:New(10040); end, -- Mythic: Socrethar the Eternal
    function() t[10039] = a:New(10039); end, -- Mythic: Xhul'horac
    function() t[10038] = a:New(10038); end, -- Mythic: Fel Lord Zakuun
    function() t[10037] = a:New(10037); end, -- Mythic: Shadow-Lord Iskar
    function() t[10036] = a:New(10036); end, -- Naval Bonus Expert
    function() t[10035] = a:New(10035); end, -- Mythic: Kilrogg Deadeye
    function() t[10034] = a:New(10034); end, -- Mythic: Hellfire High Council
    function() t[10033] = a:New(10033); end, -- Mythic: Kormrok
    function() t[10032] = a:New(10032); end, -- Mythic: Iron Reaver
    function() t[10030] = a:New(10030); end, -- Bad Manner(oth)
    function() t[10027] = a:New(10027); end, -- Mythic: Hellfire Assault
    function() t[10026] = a:New(10026); end, -- Nearly Indestructible
    function() t[10025] = a:New(10025); end, -- Bastion of Shadows
    function() t[10024] = a:New(10024); end, -- Halls of Blood
    function() t[10023] = a:New(10023); end, -- Hellbreach
    function() O(t[10021], "From", "Version", "060200", "Before", "Version", "070003"); end,
    function() t[10021] = a:New(10021, f.Alliance, 10148); end, -- Chapter IV: Darkness Incarnate
    function() t[10020] = a:New(10020); end, -- Destructor's Rise
    function() t[10019] = a:New(10019); end, -- The Black Gate
    function() t[10018] = a:New(10018); end, -- Draenor Pathfinder
    function() t[10017] = a:New(10017); end, -- Naval Bonus Specialist
    function() t[10016] = a:New(10016, f.Horde, 10015); end, -- Full Discography
    function() t[10015] = a:New(10015, f.Alliance, 10016); end, -- Full Discography
    function() t[10013] = a:New(10013); end, -- Waves Came Crashing Down All Around
    function() t[10012] = a:New(10012); end, -- This Land Was Green and Good Until...
    function() t[10011] = a:New(10011); end, -- Siege of Niuzao Temple
    function() t[10010] = a:New(10010); end, -- Gate of the Setting Sun
    function() O(t[10001], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[10001] = a:New(10001, f.Horde, 9996, true); end, -- Defender of the Horde: Warlords Season 1
    function() O(t[10000], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[10000] = a:New(10000, f.Horde, 9997, true); end, -- Guardian of the Horde: Warlords Season 1
    function() O(t[9998], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9998] = a:New(9998, f.Horde, 9995, true); end, -- Soldier of the Horde: Warlords Season 1
    function() O(t[9997], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9997] = a:New(9997, f.Alliance, 10000, true); end, -- Guardian of the Alliance: Warlords Season 1
    function() O(t[9996], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9996] = a:New(9996, f.Alliance, 10001, true); end, -- Defender of the Alliance: Warlords Season 1
    function() O(t[9995], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9995] = a:New(9995, f.Alliance, 9998, true); end, -- Soldier of the Alliance: Warlords Season 1
    function() t[9989] = a:New(9989); end, -- Non-Lethal Enforcer
    function() t[9988] = a:New(9988); end, -- Pro Toss
    function() t[9983] = a:New(9983); end, -- That's Whack!
    function() t[9979] = a:New(9979); end, -- Get In My Belly!
    function() t[9972] = a:New(9972); end, -- A Race Against Slime
    function() t[9928] = a:New(9928, f.Alliance, 9901); end, -- Don't Call Me Junior
    function() t[9926] = a:New(9926); end, -- Hero of the Storm
    function() O(t[9925]); end,
    function() t[9925] = a:New(9925); end, -- Friends In Places Yet Even Higher Than That
    function() t[9924] = a:New(9924); end, -- Field Photographer
    function() t[9923] = a:New(9923, f.Horde, 9833); end, -- Loremaster of Draenor
    function() t[9915] = a:New(9915); end, -- Crashin' Thrashin' Shredder
    function() t[9914] = a:New(9914, f.Horde, 9912); end, -- Azeroth's Top Twenty Tunes
    function() t[9912] = a:New(9912, f.Alliance, 9914); end, -- Azeroth's Top Twenty Tunes
    function() t[9911] = a:New(9911); end, -- Where's the Mailbox?
    function() t[9909] = a:New(9909); end, -- Heirloom Hoarder
    function() t[9908] = a:New(9908); end, -- Ready for Powerleveling
    function() t[9906] = a:New(9906); end, -- Alt-ernative Lifestyle
    function() t[9901] = a:New(9901, f.Horde, 9928); end, -- Don't Call Me Junior
    function() t[9900] = a:New(9900); end, -- Exploration Mission Master
    function() t[9897] = a:New(9897, f.Horde, 9828); end, -- Ten Hit Tunes
    function() t[9894] = a:New(9894); end, -- Triumphant Turtle Tossing
    function() t[9885] = a:New(9885); end, -- Ace Tonk Commander
    function() t[9858] = a:New(9858); end, -- Master and Commander
    function() t[9838] = a:New(9838); end, -- "What A Strange, Interdimensional Trip It's Been"
    function() t[9836] = a:New(9836, f.Horde, 9825); end, -- Master Relic Hunter
    function() t[9833] = a:New(9833, f.Alliance, 9923); end, -- Loremaster of Draenor
    function() t[9828] = a:New(9828, f.Alliance, 9897); end, -- Ten Hit Tunes
    function() t[9827] = a:New(9827); end, -- Impervious Defender
    function() t[9826] = a:New(9826); end, -- Platinum Defender
    function() t[9825] = a:New(9825, f.Alliance, 9836); end, -- Master Relic Hunter
    function() t[9824] = a:New(9824); end, -- Raiding with Leashes III: Drinkin' From the Sunwell
    function() t[9819] = a:New(9819); end, -- Darkmoon Like the Wind
    function() t[9817] = a:New(9817); end, -- Big Powermonger: Gold
    function() t[9815] = a:New(9815); end, -- Big Powermonger: Silver
    function() t[9813] = a:New(9813); end, -- Big Powermonger: Bronze
    function() t[9812] = a:New(9812); end, -- Goal-Oriented
    function() t[9811] = a:New(9811); end, -- Big Wanderluster: Gold
    function() t[9809] = a:New(9809); end, -- Big Wanderluster: Silver
    function() t[9807] = a:New(9807); end, -- Big Wanderluster: Bronze
    function() t[9806] = a:New(9806); end, -- Vagabond
    function() t[9805] = a:New(9805); end, -- Big Rocketeer: Gold
    function() t[9803] = a:New(9803); end, -- Big Rocketeer: Silver
    function() t[9801] = a:New(9801); end, -- Big Rocketeer: Bronze
    function() t[9800] = a:New(9800); end, -- Rocket Man
    function() t[9799] = a:New(9799); end, -- Big Race Roadhog
    function() t[9797] = a:New(9797); end, -- Big Race Leadfoot
    function() t[9795] = a:New(9795); end, -- Big Race Jockey
    function() t[9794] = a:New(9794); end, -- Big Race Novice
    function() t[9793] = a:New(9793); end, -- Big Race Enthusiast
    function() t[9792] = a:New(9792); end, -- Wanderluster: Gold
    function() t[9790] = a:New(9790); end, -- Wanderluster: Silver
    function() t[9787] = a:New(9787); end, -- Wanderluster: Bronze
    function() t[9786] = a:New(9786); end, -- Wayfarer
    function() t[9785] = a:New(9785); end, -- Powermonger: Gold
    function() t[9783] = a:New(9783); end, -- Powermonger: Silver
    function() t[9781] = a:New(9781); end, -- Powermonger: Bronze
    function() t[9780] = a:New(9780); end, -- Go-Getter
    function() t[9770] = a:New(9770); end, -- Blast Off!
    function() t[9769] = a:New(9769); end, -- Rocketeer: Bronze
    function() t[9766] = a:New(9766); end, -- Rocketeer: Silver
    function() t[9764] = a:New(9764); end, -- Rocketeer: Gold
    function() t[9763] = a:New(9763); end, -- Grommloc
    function() t[9761] = a:New(9761); end, -- Darkmoon Racer Roadhog
    function() t[9760] = a:New(9760); end, -- Darkmoon Racer Leadfoot
    function() t[9759] = a:New(9759); end, -- Darkmoon Racer Jockey
    function() t[9756] = a:New(9756); end, -- Darkmoon Racer Novice
    function() t[9755] = a:New(9755); end, -- Darkmoon Race Enthusiast
    function() t[9738] = a:New(9738, f.Alliance, 9508, true); end, -- Warlord of Draenor
    function() O(t[9729]); end,
    function() t[9729] = a:New(9729, f.Alliance, 9566, true); end, -- Victory in Hillsbrad
    function() t[9728] = a:New(9728); end, -- Grand Treasure Hunter
    function() t[9727] = a:New(9727); end, -- Expert Treasure Hunter
    function() t[9726] = a:New(9726); end, -- Treasure Hunter
    function() t[9725] = a:New(9725, nil, nil, true); end, -- The Last of Us
    function() t[9724] = a:New(9724); end, -- Taming Draenor
    function() t[9715] = a:New(9715, f.Horde, 9714, true); end, -- Thy Kingdom Come
    function() t[9714] = a:New(9714, f.Alliance, 9715, true); end, -- Thy Kingdom Come
    function() t[9713] = a:New(9713); end, -- Awake the Drakes
    function() t[9712] = a:New(9712); end, -- Shiny Pet Charmer
    function() t[9711] = a:New(9711); end, -- Planned to Fail
    function() t[9710] = a:New(9710); end, -- Poisoning the Well
    function() O(t[9708], "From", "Version", "060003a", "Before", "Version", "080001"); end,
    function() t[9708] = a:New(9708); end, -- Savagely Epic
    function() O(t[9707], "From", "Version", "060003a", "Before", "Version", "080001"); end,
    function() t[9707] = a:New(9707); end, -- Savagely Superior
    function() t[9706] = a:New(9706, f.Horde, 9540); end, -- The Stable Master
    function() t[9705] = a:New(9705, f.Horde, 9539); end, -- Advanced Husbandry
    function() t[9703] = a:New(9703); end, -- Stay Awhile and Listen
    function() t[9696] = a:New(9696); end, -- Family Familiar
    function() t[9695] = a:New(9695); end, -- The Lil' Necromancer
    function() t[9694] = a:New(9694); end, -- Roboteer
    function() t[9693] = a:New(9693); end, -- Master of Magic
    function() t[9692] = a:New(9692); end, -- "Murlocs, Harpies, and Wolvar, Oh My!"
    function() t[9691] = a:New(9691); end, -- Flock Together
    function() t[9690] = a:New(9690); end, -- "Ragnaros, Watch and Learn"
    function() t[9689] = a:New(9689); end, -- Dragons!
    function() t[9688] = a:New(9688); end, -- Mousing Around
    function() t[9687] = a:New(9687); end, -- Best of the Beasts
    function() t[9686] = a:New(9686); end, -- Aquatic Acquiescence
    function() t[9685] = a:New(9685); end, -- Draenor Safari
    function() O(t[9680], "From", "Version", "060200", "Before", "Version", "070003"); end,
    function() t[9680] = a:New(9680); end, -- Time is a Flat Circle
    function() t[9678] = a:New(9678); end, -- Ancient No More
    function() t[9674] = a:New(9674); end, -- I Want More Talador
    function() t[9673] = a:New(9673); end, -- The Toymaster
    function() t[9672] = a:New(9672); end, -- Tons of Toys
    function() t[9671] = a:New(9671); end, -- Having a Ball
    function() t[9670] = a:New(9670); end, -- Toying Around
    function() t[9667] = a:New(9667); end, -- Burn It to the Ground
    function() t[9663] = a:New(9663); end, -- Picky Palate
    function() t[9659] = a:New(9659); end, -- Iron Wings
    function() t[9658] = a:New(9658); end, -- Pillars of Draenor
    function() t[9656] = a:New(9656); end, -- In Plain Sight
    function() t[9655] = a:New(9655); end, -- Fight the Power
    function() t[9654] = a:New(9654); end, -- Mean and Green
    function() t[9643] = a:New(9643); end, -- So. Many. Pets.
    function() O(t[9642], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9642] = a:New(9642); end, -- Chapter III: The Foundry Falls
    function() O(t[9641], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9641] = a:New(9641); end, -- Chapter II: Gul'dan Strikes Back
    function() O(t[9640], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9640] = a:New(9640); end, -- Chapter I: Call of the Archmage
    function() t[9639] = a:New(9639, nil, nil, true); end, -- "Fight, Kill, Salute!"
    function() t[9638] = a:New(9638); end, -- Heralds of the Legion
    function() t[9637] = a:New(9637); end, -- Poor Communication
    function() t[9636] = a:New(9636); end, -- United We Stand
    function() t[9635] = a:New(9635); end, -- Bobbing for Orcs
    function() t[9634] = a:New(9634); end, -- Charged Up
    function() t[9633] = a:New(9633); end, -- Cut off the Head
    function() t[9632] = a:New(9632); end, -- The Power Is Yours
    function() t[9631] = a:New(9631, f.Alliance, 9255); end, -- Mythic Draenor Raider
    function() t[9630] = a:New(9630, f.Alliance, 9248, true); end, -- Defender of Draenor
    function() O(t[9627], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9627] = a:New(9627); end, -- Challenge Master: Upper Blackrock Spire
    function() O(t[9626], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9626] = a:New(9626); end, -- Challenge Master: Shadowmoon Burial Grounds
    function() O(t[9625], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9625] = a:New(9625); end, -- Challenge Master: Grimrail Depot
    function() O(t[9624], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9624] = a:New(9624); end, -- Challenge Master: The Everbloom
    function() O(t[9623], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9623] = a:New(9623); end, -- Challenge Master: Skyreach
    function() O(t[9622], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9622] = a:New(9622); end, -- Challenge Master: Auchindoun
    function() O(t[9621], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9621] = a:New(9621); end, -- Challenge Master: Iron Docks
    function() O(t[9620], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9620] = a:New(9620); end, -- Challenge Master: Bloodmaul Slag Mines
    function() t[9619] = a:New(9619); end, -- Savage Hero
    function() O(t[9618], "From", "Version", "060002", "Until", "Version", "060002"); end,
    function() t[9618] = a:New(9618); end, -- The Iron Invasion
    function() t[9617] = a:New(9617); end, -- Making the Cut
    function() t[9615] = a:New(9615); end, -- With a Nagrand Cherry On Top
    function() t[9613] = a:New(9613); end, -- "Fish Gotta Swim, Birds Gotta Eat"
    function() t[9612] = a:New(9612); end, -- Eggs in One Basket
    function() t[9610] = a:New(9610); end, -- History of Violence
    function() t[9607] = a:New(9607); end, -- Make It a Bonus
    function() t[9606] = a:New(9606, f.Horde, 9602); end, -- Frostfire Fridge
    function() t[9605] = a:New(9605); end, -- Arak Star
    function() t[9602] = a:New(9602, f.Alliance, 9606); end, -- Shoot For the Moon
    function() t[9601] = a:New(9601); end, -- King of the Monsters
    function() t[9600] = a:New(9600); end, -- Monster Mash
    function() t[9599] = a:New(9599, f.Horde, 9598); end, -- Mountacular
    function() t[9598] = a:New(9598, f.Alliance, 9599); end, -- Mountacular
    function() t[9597] = a:New(9597); end, -- You're Really Doing It Wrong
    function() t[9590] = a:New(9590); end, -- You're Doing it Wrong
    function() t[9589] = a:New(9589); end, -- Proving Yourself: Endless Healer (Wave 30)
    function() t[9588] = a:New(9588); end, -- Proving Yourself: Endless Healer (Wave 20)
    function() t[9587] = a:New(9587); end, -- Proving Yourself: Endless Healer (Wave 10)
    function() t[9586] = a:New(9586); end, -- Proving Yourself: Gold Healer
    function() t[9585] = a:New(9585); end, -- Proving Yourself: Silver Healer
    function() t[9584] = a:New(9584); end, -- Proving Yourself: Bronze Healer
    function() t[9583] = a:New(9583); end, -- Proving Yourself: Endless Tank (Wave 30)
    function() t[9582] = a:New(9582); end, -- Proving Yourself: Endless Tank (Wave 20)
    function() t[9581] = a:New(9581); end, -- Proving Yourself: Endless Tank (Wave 10)
    function() t[9580] = a:New(9580); end, -- Proving Yourself: Gold Tank
    function() t[9579] = a:New(9579); end, -- Proving Yourself: Silver Tank
    function() t[9578] = a:New(9578); end, -- Proving Yourself: Bronze Tank
    function() t[9577] = a:New(9577); end, -- Proving Yourself: Endless Damage (Wave 30)
    function() t[9576] = a:New(9576); end, -- Proving Yourself: Endless Damage (Wave 20)
    function() t[9575] = a:New(9575); end, -- Proving Yourself: Endless Damage (Wave 10)
    function() t[9574] = a:New(9574); end, -- Proving Yourself: Gold Damage
    function() t[9573] = a:New(9573); end, -- Proving Yourself: Silver Damage
    function() t[9572] = a:New(9572); end, -- Proving Yourself: Bronze Damage
    function() t[9571] = a:New(9571); end, -- Broke Back Precipice
    function() O(t[9566]); end,
    function() t[9566] = a:New(9566, f.Horde, 9729, true); end, -- Victory in Hillsbrad
    function() t[9565] = a:New(9565); end, -- Master Trapper
    function() t[9564] = a:New(9564, f.Alliance, 9562); end, -- Securing Draenor
    function() t[9562] = a:New(9562, f.Horde, 9564); end, -- Securing Draenor
    function() t[9552] = a:New(9552); end, -- No Tag-backs!
    function() t[9551] = a:New(9551); end, -- Demon's Souls
    function() t[9550] = a:New(9550); end, -- "Boldly, You Sought the Power of Ragnaros"
    function() t[9548] = a:New(9548); end, -- Buried Treasures
    function() t[9547] = a:New(9547); end, -- Everything Is Awesome!
    function() t[9546] = a:New(9546, f.Horde, 9101); end, -- Even More Plots
    function() t[9545] = a:New(9545, f.Horde, 9100); end, -- More Plots
    function() t[9543] = a:New(9543); end, -- Invasion? What Invasion?
    function() t[9541] = a:New(9541); end, -- The Song of Silence
    function() t[9540] = a:New(9540, f.Alliance, 9706); end, -- The Stable Master
    function() t[9539] = a:New(9539, f.Alliance, 9705); end, -- Advanced Husbandry
    function() t[9538] = a:New(9538); end, -- Intro to Husbandry
    function() t[9537] = a:New(9537); end, -- By Fire Be... Merged?
    function() t[9536] = a:New(9536); end, -- Slagnarok
    function() t[9535] = a:New(9535); end, -- That Was Entirely Unnecessary
    function() t[9534] = a:New(9534); end, -- Delectable Ogre Delicacies
    function() t[9533] = a:New(9533); end, -- Breaker of Chains
    function() t[9531] = a:New(9531, f.Horde, 9530); end, -- Writing in the Snow
    function() t[9530] = a:New(9530, f.Alliance, 9531); end, -- Writing in the Snow
    function() t[9529] = a:New(9529, f.Horde, 9528); end, -- On the Shadow's Trail
    function() t[9528] = a:New(9528, f.Alliance, 9529); end, -- On the Shadow's Trail
    function() t[9527] = a:New(9527); end, -- Terrific Technology
    function() t[9526] = a:New(9526); end, -- Master of Mounts
    function() t[9524] = a:New(9524); end, -- Treasure Master
    function() t[9523] = a:New(9523); end, -- Patrolling Draenor
    function() t[9522] = a:New(9522, f.Alliance, 9510, true); end, -- Nemesis: Troll Hunter
    function() t[9521] = a:New(9521, f.Alliance, 9511, true); end, -- Nemesis: The Butcher
    function() t[9520] = a:New(9520, f.Alliance, 9514, true); end, -- Nemesis: Huojin's Fall
    function() t[9519] = a:New(9519, f.Alliance, 9512, true); end, -- Nemesis: Orcslayer
    function() t[9518] = a:New(9518, f.Alliance, 9515, true); end, -- Nemesis: Killer of Kezan
    function() t[9517] = a:New(9517, f.Alliance, 9513, true); end, -- Nemesis: Death Stalker
    function() t[9516] = a:New(9516, f.Alliance, 9509, true); end, -- Nemesis: Slayer of Sin'dorei
    function() t[9515] = a:New(9515, f.Horde, 9518, true); end, -- Nemesis: Worgen Hunter
    function() t[9514] = a:New(9514, f.Horde, 9520, true); end, -- Nemesis: Terror of the Tushui
    function() t[9513] = a:New(9513, f.Horde, 9517, true); end, -- Nemesis: Scourge of the Kaldorei
    function() t[9512] = a:New(9512, f.Horde, 9519, true); end, -- Nemesis: Manslayer
    function() t[9511] = a:New(9511, f.Horde, 9521, true); end, -- Nemesis: Gnomebane
    function() t[9510] = a:New(9510, f.Horde, 9522, true); end, -- Nemesis: Dwarfstalker
    function() t[9509] = a:New(9509, f.Horde, 9516, true); end, -- Nemesis: Draenei Destroyer
    function() t[9508] = a:New(9508, f.Horde, 9738, true); end, -- Warlord of Draenor
    function() t[9507] = a:New(9507); end, -- Working in Draenor
    function() O(t[9506], "From", "Version", "060003", "Before", "Version", "080001"); end,
    function() t[9506] = a:New(9506); end, -- Savage Skills to Pay the Bills
    function() O(t[9505], "From", "Version", "060003", "Before", "Version", "080001"); end,
    function() t[9505] = a:New(9505); end, -- Draenor Medic
    function() t[9503] = a:New(9503); end, -- Draenor Fisherman
    function() t[9502] = a:New(9502); end, -- Draenor Cuisine
    function() t[9501] = a:New(9501); end, -- The Draenor Gourmet
    function() t[9500] = a:New(9500); end, -- Draenor Cook
    function() t[9499] = a:New(9499); end, -- Wingmen
    function() t[9498] = a:New(9498); end, -- Wingman
    function() t[9497] = a:New(9497); end, -- Finding Your Waystones
    function() O(t[9496]); end,
    function() t[9496] = a:New(9496); end, -- Warlord's Deathwheel
    function() t[9495] = a:New(9495, nil, nil, true); end, -- The Bone Collector
    function() t[9494] = a:New(9494); end, -- Commander
    function() t[9493] = a:New(9493); end, -- "They Burn, Burn, Burn"
    function() t[9492] = a:New(9492, f.Horde, 9491); end, -- The Garrison Campaign
    function() t[9491] = a:New(9491, f.Alliance, 9492); end, -- The Garrison Campaign
    function() t[9487] = a:New(9487); end, -- Got My Mind On My Draenor Money
    function() t[9486] = a:New(9486); end, -- Goodness Gracious
    function() t[9483] = a:New(9483); end, -- I Was Framed!
    function() t[9481] = a:New(9481); end, -- You Have Been Rylakinated!
    function() t[9479] = a:New(9479); end, -- You Can't Make a Giant Omelette...
    function() t[9478] = a:New(9478, f.Alliance, 9477); end, -- Savage Friends
    function() t[9477] = a:New(9477, f.Horde, 9478); end, -- Savage Friends
    function() t[9476] = a:New(9476, f.Alliance, 9475); end, -- Sha'tari Defense
    function() t[9475] = a:New(9475, f.Horde, 9476); end, -- Laughing Skull Orcs
    function() t[9474] = a:New(9474, f.Alliance, 9473, true); end, -- Wrynn's Vanguard
    function() t[9473] = a:New(9473, f.Horde, 9474, true); end, -- Vol'jin's Spear
    function() t[9472] = a:New(9472); end, -- Steamwheedle Preservation Society
    function() t[9471] = a:New(9471, f.Horde, 9470); end, -- Frostwolf Orcs
    function() t[9470] = a:New(9470, f.Alliance, 9471); end, -- Council of Exarchs
    function() t[9469] = a:New(9469); end, -- Arakkoa Outcasts
    function() t[9468] = a:New(9468); end, -- Salvaging Pays Off
    function() t[9464] = a:New(9464); end, -- Professional Draenor Master
    function() t[9463] = a:New(9463); end, -- Draenic Pet Battler
    function() t[9462] = a:New(9462); end, -- Draenor Angler
    function() t[9461] = a:New(9461); end, -- Sea Scorpion Angler
    function() t[9460] = a:New(9460); end, -- Jawless Skulker Angler
    function() t[9459] = a:New(9459); end, -- Fat Sleeper Angler
    function() t[9458] = a:New(9458); end, -- Blind Lake Sturgeon Angler
    function() t[9457] = a:New(9457); end, -- Blackwater Whiptail Angler
    function() t[9456] = a:New(9456); end, -- Abyssal Gulper Eel Angler
    function() t[9455] = a:New(9455); end, -- Fire Ammonite Angler
    function() t[9454] = a:New(9454); end, -- Draenic Seed Collector
    function() t[9453] = a:New(9453); end, -- Draenic Stone Collector
    function() t[9452] = a:New(9452); end, -- Trap Superstar
    function() t[9451] = a:New(9451); end, -- Trapper's Delight
    function() t[9450] = a:New(9450); end, -- The Trap Game
    function() O(t[9444], "From", "Version", "060003", "Before", "Version", "060200"); end,
    function() t[9444] = a:New(9444); end, -- Ahead of the Curve: Blackhand's Crucible
    function() O(t[9443], "From", "Version", "060003", "Before", "Version", "060200"); end,
    function() t[9443] = a:New(9443); end, -- Cutting Edge: Blackhand's Crucible
    function() O(t[9442], "From", "Version", "060003", "Before", "Version", "060200"); end,
    function() t[9442] = a:New(9442); end, -- Cutting Edge: Imperator's Fall
    function() O(t[9441], "From", "Version", "060003", "Before", "Version", "060200"); end,
    function() t[9441] = a:New(9441); end, -- Ahead of the Curve: Imperator's Fall
    function() t[9437] = a:New(9437); end, -- A Demidos of Reality
    function() t[9436] = a:New(9436); end, -- It's the Stones!
    function() t[9435] = a:New(9435); end, -- Take From Them Everything
    function() t[9434] = a:New(9434); end, -- One of Us! One of Us!
    function() t[9433] = a:New(9433); end, -- A-VOID-ance
    function() t[9432] = a:New(9432); end, -- Would You Like a Pamphlet?
    function() t[9429] = a:New(9429); end, -- Upgrading the Mill
    function() t[9428] = a:New(9428); end, -- Calavera
    function() t[9427] = a:New(9427); end, -- Vientos!
    function() t[9426] = a:New(9426); end, -- To The Afterlife
    function() t[9425] = a:New(9425); end, -- So Grossly Incandescent
    function() t[9423] = a:New(9423); end, -- Goliaths of Gorgrond
    function() t[9422] = a:New(9422); end, -- "The Search For Fact, Not Truth"
    function() t[9419] = a:New(9419); end, -- Draenor Curator
    function() t[9415] = a:New(9415); end, -- Secrets of Skettis
    function() t[9414] = a:New(9414); end, -- Ogre Observer
    function() t[9413] = a:New(9413); end, -- Strength and Honor
    function() t[9412] = a:New(9412); end, -- Arakkoa Archivist
    function() t[9411] = a:New(9411); end, -- Highmaul Historian
    function() t[9410] = a:New(9410); end, -- Unite the Clans
    function() t[9409] = a:New(9409); end, -- Draenor Archaeologist
    function() t[9408] = a:New(9408, f.Alliance, 9217, true); end, -- Operation Counterattack
    function() t[9407] = a:New(9407); end, -- Working Many Orders
    function() t[9406] = a:New(9406); end, -- Working More Orders
    function() t[9405] = a:New(9405); end, -- Working Some Orders
    function() t[9402] = a:New(9402); end, -- Prove Your Strength
    function() t[9401] = a:New(9401); end, -- Shredder Maniac
    function() t[9400] = a:New(9400); end, -- Gorgrond Monster Hunter
    function() t[9396] = a:New(9396); end, -- Glory of the Draenor Hero
    function() t[9394] = a:New(9394); end, -- They Really Love Me!
    function() t[9393] = a:New(9393); end, -- Beacon of Love
    function() t[9392] = a:New(9392); end, -- Love Magnet
    function() t[9391] = a:New(9391); end, -- Draenor Dungeon Hero
    function() t[9389] = a:New(9389); end, -- It Might Just Save Your Life
    function() t[9265] = a:New(9265); end, -- Master of Apexis
    function() t[9264] = a:New(9264); end, -- Draenor Pet Brawler
    function() t[9257] = a:New(9257, f.Horde, 9256, true); end, -- Rescue Operation
    function() t[9256] = a:New(9256, f.Alliance, 9257, true); end, -- Rescue Operation
    function() t[9255] = a:New(9255, f.Horde, 9631); end, -- Mythic Draenor Raider
    function() t[9252] = a:New(9252); end, -- Brood of Alysrazor
    function() t[9251] = a:New(9251); end, -- Ringmaster
    function() t[9250] = a:New(9250); end, -- Flying High
    function() t[9248] = a:New(9248, f.Horde, 9630, true); end, -- Defender of Draenor
    function() t[9246] = a:New(9246); end, -- Master Draenor Crafter
    function() t[9244] = a:New(9244); end, -- Invasions Are Better with Friends
    function() t[9243] = a:New(9243); end, -- Item Level Force
    function() O(t[9242], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9242] = a:New(9242, nil, nil, true); end, -- Challenger: Warlords Season 1
    function() O(t[9241], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9241] = a:New(9241, nil, nil, true); end, -- Rival: Warlords Season 1
    function() O(t[9240], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9240] = a:New(9240, nil, nil, true); end, -- Duelist: Warlords Season 1
    function() O(t[9239], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9239] = a:New(9239, nil, nil, true); end, -- Gladiator: Warlords Season 1
    function() O(t[9238], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9238] = a:New(9238, f.Alliance, 9236, true); end, -- Primal Combatant
    function() O(t[9236], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9236] = a:New(9236, f.Horde, 9238, true); end, -- Primal Combatant
    function() O(t[9234], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9234] = a:New(9234, f.Alliance, 9233, true); end, -- Primal Conquest
    function() O(t[9233], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9233] = a:New(9233, f.Horde, 9234, true); end, -- Primal Conquest
    function() O(t[9232], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9232] = a:New(9232, nil, nil, true); end, -- Primal Gladiator: Warlords Season 1
    function() O(t[9231], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9231] = a:New(9231, f.Horde, 9230, true); end, -- Hero of the Horde: Primal
    function() O(t[9230], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9230] = a:New(9230, f.Alliance, 9231, true); end, -- Hero of the Alliance: Primal
    function() O(t[9229], "From", "PvP Season", 16, "Until", "PvP Season", 16); end,
    function() t[9229] = a:New(9229, nil, nil, true); end, -- Primal Gladiator's Felblood Gronnling
    function() t[9228] = a:New(9228, f.Alliance, nil, true); end, -- Down Goes Van Rook
    function() t[9225] = a:New(9225, f.Alliance, 9224, true); end, -- Take Them Out
    function() t[9224] = a:New(9224, f.Horde, 9225, true); end, -- Take Them Out
    function() t[9223] = a:New(9223); end, -- Weed Whacker
    function() t[9222] = a:New(9222, nil, nil, true); end, -- Divide and Conquer
    function() t[9220] = a:New(9220, nil, nil, true); end, -- "Grand Theft, 3rd Degree"
    function() t[9219] = a:New(9219, nil, nil, true); end, -- "Grand Theft, 2nd Degree"
    function() t[9218] = a:New(9218, nil, nil, true); end, -- "Grand Theft, 1st Degree"
    function() t[9217] = a:New(9217, f.Horde, 9408, true); end, -- Operation Counterattack
    function() t[9216] = a:New(9216, nil, nil, true); end, -- High-value Targets
    function() t[9215] = a:New(9215, f.Horde, 9214, true); end, -- Hero of Warspear
    function() t[9214] = a:New(9214, f.Alliance, 9215, true); end, -- Hero of Stormshield
    function() t[9213] = a:New(9213); end, -- Item Level Army
    function() t[9212] = a:New(9212); end, -- My Item Level Is Way Higher than Yours
    function() t[9211] = a:New(9211); end, -- My Item Level Is Higher than Yours
    function() t[9210] = a:New(9210, f.Alliance, 9132); end, -- Garrison Buddies
    function() t[9209] = a:New(9209); end, -- Master Defender
    function() t[9208] = a:New(9208); end, -- Botani Invasion
    function() t[9207] = a:New(9207); end, -- Goren Invasion
    function() t[9206] = a:New(9206); end, -- Shadowmoon Clan Invasion
    function() t[9205] = a:New(9205); end, -- Iron Horde Invasion
    function() t[9204] = a:New(9204); end, -- Ogre Invasion
    function() t[9203] = a:New(9203); end, -- Shadow Council Invasion
    function() t[9181] = a:New(9181); end, -- Save Those Buildings!
    function() O(t[9177], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9177] = a:New(9177, f.Horde, 9176); end, -- Deck Your Collection (Season 2)
    function() O(t[9176], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9176] = a:New(9176, f.Alliance, 9177); end, -- Deck Your Collection (Season 2)
    function() O(t[9175], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9175] = a:New(9175, f.Horde, 9171); end, -- Now You're Just Showing Off (Season 2)
    function() O(t[9174], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9174] = a:New(9174, f.Horde, 9170); end, -- Brawlin' and Shot Callin' (Season 2)
    function() O(t[9173], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9173] = a:New(9173, f.Horde, 9169); end, -- The Second Rule of Brawler's Guild (Season 2)
    function() O(t[9172], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9172] = a:New(9172, f.Horde, 9168); end, -- You Are Not Your $#*@! Legplates (Season 2)
    function() O(t[9171], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9171] = a:New(9171, f.Alliance, 9175); end, -- Now You're Just Showing Off (Season 2)
    function() O(t[9170], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9170] = a:New(9170, f.Alliance, 9174); end, -- Brawlin' and Shot Callin' (Season 2)
    function() O(t[9169], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9169] = a:New(9169, f.Alliance, 9173); end, -- The Second Rule of Brawler's Guild (Season 2)
    function() O(t[9168], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9168] = a:New(9168, f.Alliance, 9172); end, -- You Are Not Your $#*@! Legplates (Season 2)
    function() t[9167] = a:New(9167); end, -- Invasion Specialist
    function() t[9165] = a:New(9165); end, -- Golden Defender
    function() t[9164] = a:New(9164); end, -- Silver Defender
    function() t[9162] = a:New(9162); end, -- Bronze Defender
    function() t[9152] = a:New(9152); end, -- It's an Invasion!
    function() t[9150] = a:New(9150); end, -- Exploration Mission Specialist
    function() t[9147] = a:New(9147); end, -- Mission Specialist
    function() t[9146] = a:New(9146); end, -- Patrol Mission Specialist
    function() t[9145] = a:New(9145); end, -- Treasure Mission Specialist
    function() t[9143] = a:New(9143); end, -- The Rarer the Better
    function() t[9142] = a:New(9142); end, -- Keeping It Rare
    function() t[9141] = a:New(9141); end, -- A Rare Mission
    function() t[9140] = a:New(9140); end, -- On a Metric Ton of Missions
    function() t[9139] = a:New(9139); end, -- On a Massive Number of Missions
    function() t[9138] = a:New(9138); end, -- On a Lot of Missions
    function() t[9134] = a:New(9134); end, -- On a Few Missions
    function() t[9133] = a:New(9133); end, -- On a Mission
    function() t[9132] = a:New(9132, f.Horde, 9210); end, -- Garrison Buddies
    function() t[9131] = a:New(9131); end, -- An Epic Buddy
    function() t[9130] = a:New(9130); end, -- A Rare Friend
    function() t[9129] = a:New(9129); end, -- Filling the Ranks
    function() t[9128] = a:New(9128); end, -- Grand Master Draftsman
    function() t[9126] = a:New(9126); end, -- Master Draftsman
    function() t[9125] = a:New(9125); end, -- Draftsman
    function() t[9111] = a:New(9111); end, -- Raising the Bar
    function() t[9110] = a:New(9110); end, -- Following Up
    function() t[9109] = a:New(9109); end, -- Fearless Leader
    function() t[9108] = a:New(9108); end, -- "Where You Go, They Will Follow"
    function() t[9107] = a:New(9107); end, -- Follow the Leader
    function() t[9106] = a:New(9106, nil, nil, true); end, -- Just for Me
    function() t[9105] = a:New(9105, nil, nil, true); end, -- Tour of Duty
    function() t[9104] = a:New(9104, f.Alliance, 9103, true); end, -- Bounty Hunter
    function() t[9103] = a:New(9103, f.Horde, 9104, true); end, -- Bounty Hunter
    function() t[9102] = a:New(9102, nil, nil, true); end, -- Ashran Victory
    function() t[9101] = a:New(9101, f.Alliance, 9546); end, -- Even More Plots
    function() t[9100] = a:New(9100, f.Alliance, 9545); end, -- More Plots
    function() t[9099] = a:New(9099); end, -- Time for an Upgrade
    function() t[9098] = a:New(9098); end, -- Movin' On Up
    function() t[9097] = a:New(9097); end, -- Keepin' Busy
    function() t[9096] = a:New(9096); end, -- Master Builder
    function() t[9095] = a:New(9095); end, -- Builder
    function() t[9094] = a:New(9094); end, -- Garrison Architect
    function() t[9087] = a:New(9087); end, -- Draenor Master of All
    function() t[9083] = a:New(9083); end, -- "Militaristic, Expansionist"
    function() t[9082] = a:New(9082); end, -- Take Cover!
    function() t[9081] = a:New(9081); end, -- Expert Timing
    function() t[9080] = a:New(9080, f.Horde, 9078); end, -- Choppin' Even More Logs
    function() t[9078] = a:New(9078, f.Alliance, 9080); end, -- Choppin' Even More Logs
    function() t[9077] = a:New(9077); end, -- Choppin' Some More Logs
    function() t[9076] = a:New(9076); end, -- Choppin' Some Logs
    function() t[9072] = a:New(9072); end, -- Mantle of the Talon King
    function() t[9071] = a:New(9071); end, -- Inspector Gadgetzan
    function() t[9070] = a:New(9070); end, -- Overstuffed
    function() t[9069] = a:New(9069); end, -- An Awfully Big Adventure
    function() O(t[9060], "From", "Version", "060003", "Before", "Version", "090001"); end,
    function() t[9060] = a:New(9060); end, -- Level 100 (Legacy)
    function() t[9058] = a:New(9058); end, -- Leeeeeeeeeeeeeroy...?
    function() t[9057] = a:New(9057); end, -- Dragonmaw? More Like Dragonfall!
    function() t[9056] = a:New(9056); end, -- Bridge Over Troubled Fire
    function() t[9055] = a:New(9055); end, -- Heroic: Upper Blackrock Spire
    function() t[9054] = a:New(9054); end, -- Heroic: Shadowmoon Burial Grounds
    function() t[9053] = a:New(9053); end, -- Heroic: The Everbloom
    function() t[9052] = a:New(9052); end, -- Heroic: Grimrail Depot
    function() t[9049] = a:New(9049); end, -- Heroic: Auchindoun
    function() t[9047] = a:New(9047); end, -- Heroic: Iron Docks
    function() t[9046] = a:New(9046); end, -- Heroic: Bloodmaul Slag Mines
    function() t[9045] = a:New(9045); end, -- "Magnets, How Do They Work?"
    function() t[9044] = a:New(9044); end, -- The Everbloom
    function() t[9043] = a:New(9043); end, -- Grimrail Depot
    function() t[9042] = a:New(9042); end, -- Upper Blackrock Spire
    function() t[9041] = a:New(9041); end, -- Shadowmoon Burial Grounds
    function() t[9039] = a:New(9039); end, -- Auchindoun
    function() t[9038] = a:New(9038); end, -- Iron Docks
    function() t[9037] = a:New(9037); end, -- Bloodmaul Slag Mines
    function() t[9036] = a:New(9036); end, -- Monomania
    function() t[9035] = a:New(9035); end, -- I Saw Solis
    function() t[9034] = a:New(9034); end, -- Magnify... Enhance
    function() t[9033] = a:New(9033); end, -- Ready for Raiding IV
    function() t[9026] = a:New(9026); end, -- Souls of the Lost
    function() t[9025] = a:New(9025); end, -- Icky Ichors
    function() t[9024] = a:New(9024); end, -- This Is Why We Can't Have Nice Things
    function() t[9023] = a:New(9023); end, -- ...They All Fall Down
    function() t[9018] = a:New(9018); end, -- What's Your Sign?
    function() t[9017] = a:New(9017); end, -- Water Management
    function() O(t[9016], "From", "Version", "050200", "Before", "Version", "060002"); end,
    function() t[9016] = a:New(9016); end, -- Breaker of the Black Harvest
    function() t[9008] = a:New(9008); end, -- Is Draenor on Fire?
    function() t[9007] = a:New(9007); end, -- No Ticket
    function() t[9005] = a:New(9005); end, -- Come With Me If You Want to Live
    function() O(t[9004], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9004] = a:New(9004); end, -- The Everbloom: Gold
    function() O(t[9003], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9003] = a:New(9003); end, -- The Everbloom: Silver
    function() O(t[9002], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9002] = a:New(9002); end, -- The Everbloom: Bronze
    function() O(t[9001], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9001] = a:New(9001); end, -- The Everbloom Challenger
    function() O(t[9000], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[9000] = a:New(9000); end, -- Iron Docks: Gold
    function() O(t[8999], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8999] = a:New(8999); end, -- Iron Docks: Silver
    function() O(t[8998], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8998] = a:New(8998); end, -- Iron Docks: Bronze
    function() O(t[8997], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8997] = a:New(8997); end, -- Iron Docks Challenger
    function() t[8993] = a:New(8993); end, -- A Gift of Earth and Fire
    function() t[8992] = a:New(8992); end, -- Blackhand's Crucible
    function() t[8991] = a:New(8991); end, -- Iron Assembly
    function() t[8990] = a:New(8990); end, -- Black Forge
    function() t[8989] = a:New(8989); end, -- Slagworks
    function() t[8988] = a:New(8988); end, -- Imperator's Fall
    function() t[8987] = a:New(8987); end, -- Arcane Sanctum
    function() t[8986] = a:New(8986); end, -- The Walled City
    function() t[8985] = a:New(8985); end, -- Glory of the Draenor Raider
    function() t[8984] = a:New(8984); end, -- Be Quick or Be Dead
    function() t[8983] = a:New(8983); end, -- Would You Give Me a Hand?
    function() t[8982] = a:New(8982); end, -- There's Always a Bigger Train
    function() t[8981] = a:New(8981); end, -- Fain Would Lie Down
    function() t[8980] = a:New(8980); end, -- Stamp Stamp Revolution
    function() t[8979] = a:New(8979); end, -- "He Shoots, He Ores"
    function() t[8978] = a:New(8978); end, -- The Iron Price
    function() t[8977] = a:New(8977); end, -- Lineage of Power
    function() t[8976] = a:New(8976); end, -- Pair Annihilation
    function() t[8975] = a:New(8975); end, -- A Fungus Among Us
    function() t[8974] = a:New(8974); end, -- More Like Wrecked-us
    function() t[8973] = a:New(8973); end, -- Mythic: Blackhand's Crucible
    function() t[8972] = a:New(8972); end, -- Mythic: Iron Maidens
    function() t[8971] = a:New(8971); end, -- Mythic: Kromog
    function() t[8970] = a:New(8970); end, -- Mythic: Blast Furnace
    function() t[8969] = a:New(8969); end, -- Mythic: Operator Thogar
    function() t[8968] = a:New(8968); end, -- Mythic: Hans'gar and Franzok
    function() t[8967] = a:New(8967); end, -- Mythic: Oregorger
    function() t[8966] = a:New(8966); end, -- Mythic: Gruul
    function() t[8965] = a:New(8965); end, -- Mythic: Imperator's Fall
    function() t[8964] = a:New(8964); end, -- Mythic: Ko'ragh
    function() t[8963] = a:New(8963); end, -- Mythic: Twin Ogron
    function() t[8962] = a:New(8962); end, -- Mythic: Brackenspore
    function() t[8961] = a:New(8961); end, -- Mythic: Tectus
    function() t[8960] = a:New(8960); end, -- Mythic: The Butcher
    function() t[8958] = a:New(8958); end, -- Brothers in Arms
    function() t[8956] = a:New(8956); end, -- Mythic: Beastlord Darmac
    function() t[8952] = a:New(8952); end, -- "Ashes, Ashes..."
    function() t[8949] = a:New(8949); end, -- Mythic: Kargath Bladefist
    function() t[8948] = a:New(8948); end, -- Flame On!
    function() t[8947] = a:New(8947); end, -- "Hurry Up, Maggot!"
    function() t[8942] = a:New(8942); end, -- Explore Nagrand
    function() t[8941] = a:New(8941); end, -- Explore Spires of Arak
    function() t[8940] = a:New(8940); end, -- Explore Talador
    function() t[8939] = a:New(8939); end, -- Explore Gorgrond
    function() t[8938] = a:New(8938); end, -- Explore Shadowmoon Valley
    function() t[8937] = a:New(8937); end, -- Explore Frostfire Ridge
    function() t[8935] = a:New(8935); end, -- Draenor Explorer
    function() t[8933] = a:New(8933); end, -- Staying Regular
    function() t[8932] = a:New(8932); end, -- Mythic: Flamebender Ka'graz
    function() t[8930] = a:New(8930); end, -- "Ya, We've Got Time..."
    function() t[8929] = a:New(8929); end, -- The Steel Has Been Brought
    function() t[8928] = a:New(8928, f.Horde, 8927); end, -- Nagrandeur
    function() t[8927] = a:New(8927, f.Alliance, 8928); end, -- Nagrandeur
    function() t[8926] = a:New(8926, f.Horde, 8925); end, -- Between Arak and a Hard Place
    function() t[8925] = a:New(8925, f.Alliance, 8926); end, -- Between Arak and a Hard Place
    function() t[8924] = a:New(8924, f.Horde, 8923); end, -- Putting the Gore in Gorgrond
    function() t[8923] = a:New(8923, f.Alliance, 8924); end, -- Putting the Gore in Gorgrond
    function() t[8922] = a:New(8922, f.Horde, 8921); end, -- Welcome to Draenor
    function() t[8921] = a:New(8921, f.Alliance, 8922); end, -- Welcome to Draenor
    function() t[8920] = a:New(8920, f.Alliance, 8919); end, -- Don't Let the Tala-door Hit You on the Way Out
    function() t[8919] = a:New(8919, f.Horde, 8920); end, -- Don't Let the Tala-door Hit You on the Way Out
    function() t[8917] = a:New(8917); end, -- Collector's Edition: Dread Hatchling
    function() t[8916] = a:New(8916); end, -- Collector's Edition: Dread Raven
    function() O(t[8903], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8903] = a:New(8903); end, -- Mistwalker
    function() O(t[8899], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8899] = a:New(8899); end, -- Challenge Warlord: Gold
    function() O(t[8898], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8898] = a:New(8898); end, -- Challenge Warlord: Silver
    function() O(t[8897], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8897] = a:New(8897); end, -- Challenge Warlord: Bronze
    function() O(t[8895], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8895] = a:New(8895); end, -- Challenge Warlord
    function() O(t[8894], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8894] = a:New(8894); end, -- Upper Blackrock Spire: Gold
    function() O(t[8893], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8893] = a:New(8893); end, -- Upper Blackrock Spire: Silver
    function() O(t[8892], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8892] = a:New(8892); end, -- Upper Blackrock Spire: Bronze
    function() O(t[8891], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8891] = a:New(8891); end, -- Upper Blackrock Spire Challenger
    function() O(t[8890], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8890] = a:New(8890); end, -- Grimrail Depot: Gold
    function() O(t[8889], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8889] = a:New(8889); end, -- Grimrail Depot: Silver
    function() O(t[8888], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8888] = a:New(8888); end, -- Grimrail Depot: Bronze
    function() O(t[8887], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8887] = a:New(8887); end, -- Grimrail Depot Challenger
    function() O(t[8886], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8886] = a:New(8886); end, -- Shadowmoon Burial Grounds: Gold
    function() O(t[8885], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8885] = a:New(8885); end, -- Shadowmoon Burial Grounds: Silver
    function() O(t[8884], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8884] = a:New(8884); end, -- Shadowmoon Burial Grounds: Bronze
    function() O(t[8883], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8883] = a:New(8883); end, -- Shadowmoon Burial Grounds Challenger
    function() O(t[8882], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8882] = a:New(8882); end, -- Auchindoun: Gold
    function() O(t[8881], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8881] = a:New(8881); end, -- Auchindoun: Silver
    function() O(t[8880], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8880] = a:New(8880); end, -- Auchindoun: Bronze
    function() O(t[8879], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8879] = a:New(8879); end, -- Auchindoun Challenger
    function() O(t[8878], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8878] = a:New(8878); end, -- Bloodmaul Slag Mines: Gold
    function() O(t[8877], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8877] = a:New(8877); end, -- Bloodmaul Slag Mines: Silver
    function() O(t[8876], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8876] = a:New(8876); end, -- Bloodmaul Slag Mines: Bronze
    function() O(t[8875], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8875] = a:New(8875); end, -- Bloodmaul Slag Mines Challenger
    function() O(t[8874], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8874] = a:New(8874); end, -- Skyreach: Gold
    function() O(t[8873], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8873] = a:New(8873); end, -- Skyreach: Silver
    function() O(t[8872], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8872] = a:New(8872); end, -- Skyreach: Bronze
    function() O(t[8871], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8871] = a:New(8871); end, -- Skyreach Challenger
    function() t[8845] = a:New(8845, f.Alliance, 8671); end, -- As I Walk Through the Valley of the Shadow of Moon
    function() t[8844] = a:New(8844); end, -- Heroic: Skyreach
    function() t[8843] = a:New(8843); end, -- Skyreach
    function() O(t[8820]); end,
    function() t[8820] = a:New(8820); end, -- WoW's 10th Anniversary
    function() O(t[8812], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8812] = a:New(8812); end, -- You're Really Doing It Wrong (Level 90)
    function() t[8795] = a:New(8795); end, -- Collector's Edition: Treasure Goblin
    function() O(t[8794]); end,
    function() t[8794] = a:New(8794); end, -- Friends In Places Even Higher Than That
    function() t[8793] = a:New(8793); end, -- Murkalot
    function() O(t[8791], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8791] = a:New(8791, nil, nil, true); end, -- Tyrannical Gladiator
    function() t[8784] = a:New(8784); end, -- Timeless Legends
    function() t[8743] = a:New(8743); end, -- Zarhym Altogether
    function() t[8730] = a:New(8730); end, -- Rolo's Riddle
    function() t[8729] = a:New(8729); end, -- "Treasure, Treasure Everywhere"
    function() t[8728] = a:New(8728); end, -- Going To Need A Bigger Bag
    function() t[8727] = a:New(8727); end, -- "Where There's Pirates, There's Booty"
    function() t[8726] = a:New(8726); end, -- Extreme Treasure Hunter
    function() t[8725] = a:New(8725); end, -- Eyes On The Ground
    function() t[8724] = a:New(8724); end, -- Pilgrimage
    function() t[8723] = a:New(8723); end, -- Legend of the Past
    function() t[8722] = a:New(8722); end, -- Timeless Nutriment
    function() t[8721] = a:New(8721, nil, nil, true); end, -- Fire-Watcher
    function() t[8720] = a:New(8720, nil, nil, true); end, -- Kilnmaster
    function() t[8719] = a:New(8719, nil, nil, true); end, -- Blazebinder
    function() t[8718] = a:New(8718, nil, nil, true); end, -- Oathguard
    function() t[8717] = a:New(8717, nil, nil, true); end, -- Candlekeeper
    function() t[8716] = a:New(8716); end, -- Emissary of Ordos
    function() t[8715] = a:New(8715); end, -- Emperor Shaohao
    function() t[8714] = a:New(8714); end, -- Timeless Champion
    function() t[8712] = a:New(8712); end, -- Killing Time
    function() O(t[8707], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8707] = a:New(8707, nil, nil, true); end, -- Prideful Gladiator's Cloud Serpent
    function() O(t[8705], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8705] = a:New(8705, nil, nil, true); end, -- Grievous Gladiator's Cloud Serpent
    function() t[8699] = a:New(8699); end, -- The Danger Zone
    function() t[8698] = a:New(8698); end, -- Crashin' Thrashin' Flyer
    function() O(t[8697], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8697] = a:New(8697); end, -- You're Doing it Wrong (Level 90)
    function() t[8680] = a:New(8680, f.Horde, 8679); end, -- Liberator of Orgrimmar
    function() t[8679] = a:New(8679, f.Alliance, 8680); end, -- Conqueror of Orgrimmar
    function() O(t[8678], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8678] = a:New(8678, nil, nil, true); end, -- Tyrannical Gladiator's Cloud Serpent
    function() t[8671] = a:New(8671, f.Horde, 8845); end, -- You'll Get Caught Up In The... Frostfire!
    function() O(t[8670], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8670] = a:New(8670, nil, nil, true); end, -- Challenger: Season 15
    function() O(t[8669], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8669] = a:New(8669, nil, nil, true); end, -- Rival: Season 15
    function() O(t[8668], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8668] = a:New(8668, nil, nil, true); end, -- Duelist: Season 15
    function() O(t[8667], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8667] = a:New(8667, nil, nil, true); end, -- Gladiator: Season 15
    function() O(t[8666], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8666] = a:New(8666, nil, nil, true); end, -- Prideful Gladiator: Season 15
    function() O(t[8659], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8659] = a:New(8659, f.Horde, 8658, true); end, -- Hero of the Horde: Prideful
    function() O(t[8658], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8658] = a:New(8658, f.Alliance, 8659, true); end, -- Hero of the Alliance: Prideful
    function() O(t[8657], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8657] = a:New(8657, f.Horde, 8654, true); end, -- Hero of the Horde: Grievous
    function() O(t[8654], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8654] = a:New(8654, f.Alliance, 8657, true); end, -- Hero of the Alliance: Grievous
    function() O(t[8653], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8653] = a:New(8653, f.Horde, 8652, true); end, -- Hero of the Horde: Tyrannical
    function() O(t[8652], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8652] = a:New(8652, f.Alliance, 8653, true); end, -- Hero of the Alliance: Tyrannical
    function() O(t[8649], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8649] = a:New(8649, nil, nil, true); end, -- Challenger: Season 14
    function() O(t[8646], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8646] = a:New(8646, nil, nil, true); end, -- Rival: Season 14
    function() O(t[8645], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8645] = a:New(8645, nil, nil, true); end, -- Duelist: Season 14
    function() O(t[8644], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8644] = a:New(8644, nil, nil, true); end, -- Gladiator: Season 14
    function() O(t[8643], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8643] = a:New(8643, nil, nil, true); end, -- Grievous Gladiator: Season 14
    function() O(t[8642], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8642] = a:New(8642, f.Alliance, 8641, true); end, -- Prideful Combatant
    function() O(t[8641], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8641] = a:New(8641, f.Horde, 8642, true); end, -- Prideful Combatant
    function() t[8543] = a:New(8543); end, -- Lasers and Magnets and Drills! Oh My!
    function() t[8538] = a:New(8538); end, -- Unlimited Potential
    function() t[8537] = a:New(8537); end, -- Strike!
    function() t[8536] = a:New(8536); end, -- No More Tears
    function() t[8535] = a:New(8535); end, -- Celestial Challenge
    function() O(t[8533]); end,
    function() t[8533] = a:New(8533); end, -- Ordos
    function() t[8532] = a:New(8532); end, -- None Shall Pass
    function() t[8531] = a:New(8531); end, -- Now We are the Paragon
    function() t[8530] = a:New(8530); end, -- The Immortal Vanguard
    function() t[8529] = a:New(8529); end, -- Criss Cross
    function() t[8528] = a:New(8528); end, -- Go Long
    function() t[8527] = a:New(8527); end, -- Giant Dinosaur vs. Mega Snail
    function() t[8521] = a:New(8521); end, -- Swallow Your Pride
    function() t[8520] = a:New(8520); end, -- Fire in the Hole!
    function() t[8519] = a:New(8519); end, -- Celestial Family
    function() t[8518] = a:New(8518); end, -- Master of the Masters
    function() O(t[8509], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8509] = a:New(8509); end, -- Proving Yourself: Endless Healer (Wave 30) (Level 90)
    function() O(t[8508], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8508] = a:New(8508); end, -- Proving Yourself: Endless Tank (Wave 30) (Level 90)
    function() O(t[8507], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8507] = a:New(8507); end, -- Proving Yourself: Endless Damage (Wave 30) (Level 90)
    function() O(t[8506], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8506] = a:New(8506); end, -- Proving Yourself: Endless Healer (Wave 20) (Level 90)
    function() O(t[8505], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8505] = a:New(8505); end, -- Proving Yourself: Endless Tank (Wave 20) (Level 90)
    function() O(t[8504], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8504] = a:New(8504); end, -- Proving Yourself: Endless Damage (Wave 20) (Level 90)
    function() O(t[8503], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8503] = a:New(8503); end, -- Proving Yourself: Endless Healer (Wave 10) (Level 90)
    function() O(t[8502], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8502] = a:New(8502); end, -- Proving Yourself: Endless Tank (Wave 10) (Level 90)
    function() O(t[8501], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8501] = a:New(8501); end, -- Proving Yourself: Endless Damage (Wave 10) (Level 90)
    function() O(t[8498], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8498] = a:New(8498); end, -- Proving Yourself: Gold Healer (Level 90)
    function() O(t[8497], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8497] = a:New(8497); end, -- Proving Yourself: Gold Tank (Level 90)
    function() O(t[8496], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8496] = a:New(8496); end, -- Proving Yourself: Gold Damage (Level 90)
    function() O(t[8493], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8493] = a:New(8493); end, -- Proving Yourself: Silver Healer (Level 90)
    function() O(t[8492], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8492] = a:New(8492); end, -- Proving Yourself: Silver Tank (Level 90)
    function() O(t[8491], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8491] = a:New(8491); end, -- Proving Yourself: Silver Damage (Level 90)
    function() O(t[8488], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8488] = a:New(8488); end, -- Proving Yourself: Bronze Healer (Level 90)
    function() O(t[8487], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8487] = a:New(8487); end, -- Proving Yourself: Bronze Tank (Level 90)
    function() O(t[8486], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8486] = a:New(8486); end, -- Proving Yourself: Bronze Damage (Level 90)
    function() O(t[8485], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8485] = a:New(8485, f.Alliance, 8484, true); end, -- Grievous Combatant
    function() O(t[8484], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8484] = a:New(8484, f.Horde, 8485, true); end, -- Grievous Combatant
    function() t[8482] = a:New(8482); end, -- Mythic: Garrosh Hellscream
    function() t[8481] = a:New(8481); end, -- Mythic: Paragons of the Klaxxi
    function() t[8480] = a:New(8480); end, -- Mythic: Siegecrafter Blackfuse
    function() t[8479] = a:New(8479); end, -- Mythic: Thok the Bloodthirsty
    function() t[8478] = a:New(8478); end, -- Mythic: Spoils of Pandaria
    function() t[8472] = a:New(8472); end, -- Mythic: Malkorok
    function() t[8471] = a:New(8471); end, -- Mythic: General Nazgrim
    function() t[8470] = a:New(8470); end, -- Mythic: Kor'kron Dark Shaman
    function() t[8469] = a:New(8469); end, -- Mythic: Iron Juggernaut
    function() t[8468] = a:New(8468); end, -- Mythic: Galakras
    function() t[8467] = a:New(8467); end, -- Mythic: Sha of Pride
    function() t[8466] = a:New(8466); end, -- Mythic: Norushen
    function() t[8465] = a:New(8465); end, -- Mythic: Fallen Protectors
    function() t[8463] = a:New(8463); end, -- Mythic: Immerseus
    function() t[8462] = a:New(8462); end, -- Downfall
    function() t[8461] = a:New(8461); end, -- The Underhold
    function() t[8459] = a:New(8459); end, -- Gates of Retribution
    function() t[8458] = a:New(8458); end, -- Vale of Eternal Sorrows
    function() t[8454] = a:New(8454); end, -- Glory of the Orgrimmar Raider
    function() t[8453] = a:New(8453); end, -- Rescue Raiders
    function() O(t[8451], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8451] = a:New(8451, f.Alliance, 8450, true); end, -- Prideful Conquest
    function() O(t[8450], "From", "PvP Season", 15, "Until", "PvP Season", 15); end,
    function() t[8450] = a:New(8450, f.Horde, 8451, true); end, -- Prideful Conquest
    function() t[8448] = a:New(8448); end, -- Gamon Will Save Us!
    function() O(t[8439], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8439] = a:New(8439); end, -- Challenge Master: Siege of Niuzao Temple
    function() O(t[8438], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8438] = a:New(8438); end, -- Challenge Master: Scholomance
    function() O(t[8437], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8437] = a:New(8437); end, -- Challenge Master: Scarlet Monastery
    function() O(t[8436], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8436] = a:New(8436); end, -- Challenge Master: Scarlet Halls
    function() O(t[8434], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8434] = a:New(8434); end, -- Challenge Master: Gate of the Setting Sun
    function() O(t[8433], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8433] = a:New(8433); end, -- Challenge Master: Mogu'shan Palace
    function() O(t[8432], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8432] = a:New(8432); end, -- Challenge Master: Shado-Pan Monastery
    function() O(t[8431], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8431] = a:New(8431); end, -- Challenge Master: Stormstout Brewery
    function() O(t[8430], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[8430] = a:New(8430); end, -- Challenge Master: Temple of the Jade Serpent
    function() t[8410] = a:New(8410); end, -- The Celestial Tournament
    function() O(t[8401], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8401] = a:New(8401); end, -- Cutting Edge: Garrosh Hellscream (25 player)
    function() O(t[8400], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8400] = a:New(8400); end, -- Cutting Edge: Garrosh Hellscream (10 player)
    function() O(t[8399], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8399] = a:New(8399); end, -- Ahead of the Curve: Garrosh Hellscream (25 player)
    function() O(t[8398], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8398] = a:New(8398); end, -- Ahead of the Curve: Garrosh Hellscream (10 player)
    function() t[8397] = a:New(8397); end, -- Crazy for Cats
    function() O(t[8392], "Never"); end,
    function() t[8392] = a:New(8392, nil, nil, true); end, -- Tournament Glory 2013
    function() O(t[8391], "Never"); end,
    function() t[8391] = a:New(8391, nil, nil, true); end, -- Tournament Participation 2013
    function() O(t[8382], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8382] = a:New(8382, f.Alliance, 8381, true); end, -- Grievous Conquest
    function() O(t[8381], "From", "PvP Season", 14, "Until", "PvP Season", 14); end,
    function() t[8381] = a:New(8381, f.Horde, 8382, true); end, -- Grievous Conquest
    function() t[8368] = a:New(8368); end, -- Fight Anger with Anger
    function() t[8366] = a:New(8366, f.Horde, 8364); end, -- Heroic: Battle on the High Seas
    function() t[8364] = a:New(8364, f.Alliance, 8366); end, -- Heroic: Battle on the High Seas
    function() O(t[8360], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8360] = a:New(8360, nil, nil, true); end, -- Master of Deepwind Gorge
    function() O(t[8359], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8359] = a:New(8359, nil, nil, true); end, -- Capping Spree
    function() O(t[8358], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8358] = a:New(8358, nil, nil, true); end, -- Deepwind Gorge All-Star
    function() O(t[8355], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8355] = a:New(8355, nil, nil, true); end, -- Weighed Down
    function() O(t[8354], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8354] = a:New(8354, nil, nil, true); end, -- Puddle Jumper
    function() O(t[8351], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8351] = a:New(8351, nil, nil, true); end, -- Other People's Property
    function() O(t[8350], "From", "Version", "050300", "Before", "Version", "080300"); end,
    function() t[8350] = a:New(8350, nil, nil, true); end, -- Mine! Mine! Mine!
    function() t[8348] = a:New(8348); end, -- The Longest Day
    function() t[8347] = a:New(8347); end, -- Keep those Bombs Away! (From Me)
    function() t[8345] = a:New(8345); end, -- Hearthstoned
    function() O(t[8343], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8343] = a:New(8343, f.Horde, 8340); end, -- Deck Your Collection (Season 1)
    function() O(t[8342], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8342] = a:New(8342, f.Horde, 8339); end, -- Collect Your Deck (Season 2)
    function() O(t[8340], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8340] = a:New(8340, f.Alliance, 8343); end, -- Deck Your Collection (Season 1)
    function() O(t[8339], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[8339] = a:New(8339, f.Alliance, 8342); end, -- Collect Your Deck (Season 2)
    function() O(t[8338], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8338] = a:New(8338, f.Horde, 8336); end, -- I've Got the Biggest Brawls of Them All (Season 1)
    function() O(t[8337], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8337] = a:New(8337, f.Horde, 8335); end, -- Having a Brawl (Season 1)
    function() O(t[8336], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8336] = a:New(8336, f.Alliance, 8338); end, -- I've Got the Biggest Brawls of Them All (Season 1)
    function() O(t[8335], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8335] = a:New(8335, f.Alliance, 8337); end, -- Having a Brawl (Season 1)
    function() t[8333] = a:New(8333, nil, nil, true); end, -- Deepwind Gorge Perfection
    function() t[8332] = a:New(8332, nil, nil, true); end, -- Deepwind Gorge Veteran
    function() t[8331] = a:New(8331, nil, nil, true); end, -- Deepwind Gorge Victory
    function() t[8330] = a:New(8330); end, -- Hekima's Heal-Halter
    function() t[8329] = a:New(8329); end, -- Heed the Weed
    function() t[8327] = a:New(8327); end, -- Heroic: The Secrets of Ragefire
    function() O(t[8325], "From", "Version", "050400", "Before", "Version", "060002"); end,
    function() t[8325] = a:New(8325); end, -- Chapter V: Judgment of the Black Prince
    function() t[8319] = a:New(8319); end, -- Accelerated Archaeology
    function() t[8318] = a:New(8318); end, -- Heroic: Dark Heart of Pandaria
    function() t[8317] = a:New(8317); end, -- Dark Heart of Pandaria
    function() t[8316] = a:New(8316); end, -- Blood in the Snow
    function() t[8315] = a:New(8315, f.Horde, 8314); end, -- Battle on the High Seas
    function() t[8314] = a:New(8314, f.Alliance, 8315); end, -- Battle on the High Seas
    function() t[8312] = a:New(8312); end, -- Heroic: Blood in the Snow
    function() t[8311] = a:New(8311); end, -- Heroic: Crypt of Forgotten Kings
    function() t[8310] = a:New(8310); end, -- Heroic: A Brewing Storm
    function() O(t[8307], "From", "Version", "050300", "Before", "Version", "050400"); end,
    function() t[8307] = a:New(8307, f.Horde, 8306); end, -- Darkspear Revolutionary
    function() O(t[8306], "From", "Version", "050300", "Before", "Version", "050400"); end,
    function() t[8306] = a:New(8306, f.Alliance, 8307); end, -- Hordebreaker
    function() t[8304] = a:New(8304, f.Alliance, 8302); end, -- Mount Parade
    function() t[8302] = a:New(8302, f.Horde, 8304); end, -- Mount Parade
    function() t[8301] = a:New(8301, nil, nil, true); end, -- Deadly Pet Brawler
    function() t[8300] = a:New(8300, nil, nil, true); end, -- Brutal Pet Brawler
    function() t[8298] = a:New(8298, nil, nil, true); end, -- Vengeful Pet Brawler
    function() t[8297] = a:New(8297, nil, nil, true); end, -- Merciless Pet Brawler
    function() t[8295] = a:New(8295); end, -- "The Few, the Proud, the Gob Squad"
    function() t[8294] = a:New(8294); end, -- The Secrets of Ragefire
    function() t[8293] = a:New(8293); end, -- Raiding with Leashes II: Attunement Edition
    function() O(t[8260], "From", "Version", "050200", "Before", "Version", "050400"); end,
    function() t[8260] = a:New(8260); end, -- Cutting Edge: Ra-den
    function() O(t[8249], "From", "Version", "050200", "Before", "Version", "050400"); end,
    function() t[8249] = a:New(8249); end, -- Ahead of the Curve: Lei Shen
    function() O(t[8248], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[8248] = a:New(8248); end, -- Ahead of the Curve: Sha of Fear
    function() O(t[8246], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[8246] = a:New(8246); end, -- Ahead of the Curve: Grand Empress Shek'zeer
    function() O(t[8244], "From", "PvP Season", 12, "Until", "PvP Season", 12); end,
    function() t[8244] = a:New(8244, f.Horde, 8243, true); end, -- Hero of the Horde: Malevolent
    function() O(t[8243], "From", "PvP Season", 12, "Until", "PvP Season", 12); end,
    function() t[8243] = a:New(8243, f.Alliance, 8244, true); end, -- Hero of the Alliance: Malevolent
    function() O(t[8238], "From", "Version", "050200", "Before", "Version", "050400"); end,
    function() t[8238] = a:New(8238); end, -- Cutting Edge: Lei Shen
    function() t[8235] = a:New(8235); end, -- Collector: Kypari Sap Containers
    function() t[8234] = a:New(8234); end, -- Collector: Kypari Sap Containers
    function() t[8233] = a:New(8233); end, -- Collector: Pollen Collectors
    function() t[8232] = a:New(8232); end, -- Collector: Pollen Collectors
    function() t[8231] = a:New(8231); end, -- Collector: Mantid Lamps
    function() t[8230] = a:New(8230); end, -- Collector: Mantid Lamps
    function() t[8229] = a:New(8229); end, -- Collector: Remains of Paragons
    function() t[8228] = a:New(8228); end, -- Collector: Remains of Paragons
    function() t[8227] = a:New(8227); end, -- Collector: Inert Sound Beacons
    function() t[8226] = a:New(8226); end, -- Collector: Inert Sound Beacons
    function() t[8225] = a:New(8225); end, -- Collector: Praying Mantids
    function() t[8224] = a:New(8224); end, -- Collector: Praying Mantids
    function() t[8223] = a:New(8223); end, -- Collector: Ancient Sap Feeders
    function() t[8222] = a:New(8222); end, -- Collector: Ancient Sap Feeders
    function() t[8221] = a:New(8221); end, -- Collector: Banners of the Mantid Empire
    function() t[8220] = a:New(8220); end, -- Collector: Banners of the Mantid Empire
    function() t[8219] = a:New(8219); end, -- History of the Mantid
    function() O(t[8218], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8218] = a:New(8218, f.Alliance, 8093, true); end, -- Tyrannical Conquest
    function() O(t[8216], "From", "PvP Season", 12, "Until", "PvP Season", 12); end,
    function() t[8216] = a:New(8216, nil, nil, true); end, -- Malevolent Gladiator's Cloud Serpent
    function() O(t[8214], "From", "PvP Season", 12, "Until", "PvP Season", 12); end,
    function() t[8214] = a:New(8214, nil, nil, true); end, -- Malevolent Gladiator
    function() O(t[8213]); end,
    function() t[8213] = a:New(8213); end, -- Friends In Places Higher Yet
    function() t[8212] = a:New(8212); end, -- Zandalari Library Card
    function() t[8210] = a:New(8210); end, -- Shado-Pan Assault
    function() t[8209] = a:New(8209, f.Horde, 8208); end, -- Sunreaver Onslaught
    function() t[8208] = a:New(8208, f.Alliance, 8209); end, -- Kirin Tor Offensive
    function() t[8206] = a:New(8206, f.Horde, 8205); end, -- Dominance Offensive
    function() t[8205] = a:New(8205, f.Alliance, 8206); end, -- Operation: Shieldwall
    function() t[8124] = a:New(8124); end, -- Glory of the Thundering Raider
    function() t[8123] = a:New(8123); end, -- Millions of Years of Evolution vs. My Fist
    function() t[8121] = a:New(8121); end, -- Stormbreaker
    function() t[8120] = a:New(8120); end, -- Direhorn in a China Shop
    function() t[8119] = a:New(8119); end, -- Our Powers Combined
    function() t[8118] = a:New(8118); end, -- Boop
    function() t[8117] = a:New(8117); end, -- For the Ward!
    function() t[8116] = a:New(8116); end, -- You Made Me Bleed My Own Blood
    function() t[8115] = a:New(8115); end, -- Speed Metal
    function() t[8114] = a:New(8114); end, -- Platform Hero
    function() t[8112] = a:New(8112); end, -- Blue Response
    function() t[8111] = a:New(8111); end, -- This Isn't Even My Final Form
    function() t[8110] = a:New(8110); end, -- These Mogu Have Gotta Go-gu
    function() t[8109] = a:New(8109); end, -- The Mogu Below-gu
    function() t[8108] = a:New(8108); end, -- "When in Ihgaluk, Do as the Skumblade Do"
    function() t[8107] = a:New(8107); end, -- Ready for RAAAAIIIIDDD?!?ing
    function() O(t[8106]); end,
    function() t[8106] = a:New(8106); end, -- In the Hall of the Thunder King
    function() t[8105] = a:New(8105); end, -- The Crumble Bundle
    function() t[8104] = a:New(8104); end, -- Thunder Plunder
    function() t[8103] = a:New(8103); end, -- Champions of Lei Shen
    function() t[8101] = a:New(8101); end, -- It Was Worth Every Ritual Stone
    function() t[8100] = a:New(8100); end, -- Pay to Slay
    function() t[8099] = a:New(8099); end, -- Isle of Thunder
    function() t[8098] = a:New(8098); end, -- You Said Crossing the Streams Was Bad
    function() t[8097] = a:New(8097); end, -- Soft Hands
    function() t[8094] = a:New(8094); end, -- Lightning Overload
    function() O(t[8093], "From", "PvP Season", 13, "Until", "PvP Season", 13); end,
    function() t[8093] = a:New(8093, f.Horde, 8218, true); end, -- Tyrannical Conquest
    function() t[8092] = a:New(8092); end, -- I've Got 9999 Problems but a Bone-White Primal Raptor Ain't One
    function() t[8090] = a:New(8090); end, -- A Complete Circuit
    function() O(t[8089], "From", "Version", "050200", "Before", "Version", "060002"); end,
    function() t[8089] = a:New(8089); end, -- I Thought He Was Supposed to Be Hard?
    function() t[8087] = a:New(8087); end, -- Can't Touch This
    function() t[8086] = a:New(8086); end, -- From Dusk 'til Dawn
    function() t[8082] = a:New(8082); end, -- Head Case
    function() t[8081] = a:New(8081); end, -- Ritualist Who?
    function() t[8080] = a:New(8080); end, -- Fabled Pandaren Tamer
    function() t[8078] = a:New(8078); end, -- Zul'Again
    function() t[8077] = a:New(8077); end, -- One-Up
    function() t[8073] = a:New(8073); end, -- Cage Match
    function() t[8072] = a:New(8072); end, -- Pinnacle of Storms
    function() t[8071] = a:New(8071); end, -- Halls of Flesh-Shaping
    function() t[8070] = a:New(8070); end, -- Forgotten Depths
    function() t[8069] = a:New(8069); end, -- Last Stand of the Zandalari
    function() t[8068] = a:New(8068); end, -- Heroic: Ra-den
    function() t[8067] = a:New(8067); end, -- Heroic: Lei Shen
    function() t[8066] = a:New(8066); end, -- Heroic: Twin Empyreans
    function() t[8065] = a:New(8065); end, -- Heroic: Iron Qon
    function() t[8064] = a:New(8064); end, -- Heroic: Dark Animus
    function() t[8063] = a:New(8063); end, -- Heroic: Primordius
    function() t[8062] = a:New(8062); end, -- Heroic: Durumu the Forgotten
    function() t[8061] = a:New(8061); end, -- Heroic: Ji-Kun
    function() t[8060] = a:New(8060); end, -- Heroic: Megaera
    function() t[8059] = a:New(8059); end, -- Heroic: Tortos
    function() t[8058] = a:New(8058); end, -- Heroic: Council of Elders
    function() t[8057] = a:New(8057); end, -- Heroic: Horridon
    function() t[8056] = a:New(8056); end, -- Heroic: Jin'rokh the Breaker
    function() t[8055] = a:New(8055, f.Horde, 8052, true); end, -- Khan
    function() t[8052] = a:New(8052, f.Alliance, 8055, true); end, -- Khan
    function() t[8051] = a:New(8051); end, -- Gods and Monsters
    function() t[8050] = a:New(8050); end, -- Rumbles of Thunder
    function() t[8049] = a:New(8049); end, -- The Zandalari Prophecy
    function() t[8045] = a:New(8045, f.Alliance, 8044); end, -- Flame Warden of Pandaria
    function() t[8044] = a:New(8044, f.Horde, 8045); end, -- Flame Keeper of Pandaria
    function() t[8043] = a:New(8043, f.Horde, 8042); end, -- Extinguishing Pandaria
    function() t[8042] = a:New(8042, f.Alliance, 8043); end, -- Extinguishing Pandaria
    function() t[8038] = a:New(8038); end, -- Cretaceous Collector
    function() t[8037] = a:New(8037); end, -- Genetically Unmodified Organism
    function() O(t[8031], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8031] = a:New(8031, f.Horde, 8030); end, -- A Test of Valor
    function() O(t[8030], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8030] = a:New(8030, f.Alliance, 8031); end, -- A Test of Valor
    function() t[8028] = a:New(8028); end, -- Praise the Sun!
    function() t[8023] = a:New(8023); end, -- Wakener
    function() O(t[8022], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8022] = a:New(8022, f.Horde, 7946); end, -- Now You're Just Showing Off (Season 1)
    function() O(t[8020], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8020] = a:New(8020, f.Horde, 7937); end, -- You Are Not Your $#*@! Legplates (Season 1)
    function() t[8017] = a:New(8017); end, -- For the Swarm
    function() t[8016] = a:New(8016); end, -- Assault on Zan'vess
    function() t[8015] = a:New(8015, f.Horde, 8012); end, -- "Waste Not, Want Not"
    function() t[8014] = a:New(8014, f.Horde, 8011); end, -- Number Five Is Alive
    function() t[8013] = a:New(8013, f.Horde, 8010); end, -- Domination Point
    function() t[8012] = a:New(8012, f.Alliance, 8015); end, -- "Waste Not, Want Not"
    function() t[8011] = a:New(8011, f.Alliance, 8014); end, -- Number Five Is Alive
    function() t[8010] = a:New(8010, f.Alliance, 8013); end, -- Lion's Landing
    function() t[8009] = a:New(8009); end, -- Dagger in the Dark
    function() O(t[8008], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[8008] = a:New(8008, f.Horde, 7534); end, -- Chapter II: Wrathion's War
    function() t[7997] = a:New(7997); end, -- Riches of Pandaria
    function() t[7996] = a:New(7996); end, -- Bounty of Pandaria
    function() t[7995] = a:New(7995); end, -- Fortune of Pandaria
    function() t[7994] = a:New(7994); end, -- Treasure of Pandaria
    function() t[7993] = a:New(7993); end, -- We've Been Dancin'
    function() t[7992] = a:New(7992); end, -- I Used To Love Them
    function() t[7991] = a:New(7991); end, -- Which Came First?
    function() t[7990] = a:New(7990); end, -- Cannonballer
    function() t[7989] = a:New(7989); end, -- Bubbletrapped!
    function() t[7988] = a:New(7988); end, -- A Little Patience
    function() t[7987] = a:New(7987); end, -- No Egg Left Behind
    function() t[7986] = a:New(7986); end, -- You Mean That Wasn't a Void Zone?
    function() t[7984] = a:New(7984); end, -- Watery Grave
    function() O(t[7950], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[7950] = a:New(7950, f.Horde, 7949); end, -- Rabble Rabble Rabble (Season 2)
    function() O(t[7949], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[7949] = a:New(7949, f.Alliance, 7950); end, -- Rabble Rabble Rabble (Season 2)
    function() O(t[7948], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7948] = a:New(7948, f.Horde, 7947); end, -- The First Rule of Brawler's Guild (Season 1 or 2)
    function() O(t[7947], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7947] = a:New(7947, f.Alliance, 7948); end, -- The First Rule of Brawler's Guild (Season 1 or 2)
    function() O(t[7946], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7946] = a:New(7946, f.Alliance, 8022); end, -- Now You're Just Showing Off (Season 1)
    function() O(t[7945], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[7945] = a:New(7945); end, -- Haters Gonna Hate (Season 2)
    function() O(t[7944], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[7944] = a:New(7944); end, -- Bottle Service (Season 2)
    function() O(t[7943], "From", "Version", "060003", "Before", "Version", "070003"); end,
    function() t[7943] = a:New(7943); end, -- I'm Your Number One Fan (Season 2)
    function() O(t[7942], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7942] = a:New(7942, f.Horde, 7941); end, -- Brawlin' and Shot Callin' (Season 1)
    function() O(t[7941], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7941] = a:New(7941, f.Alliance, 7942); end, -- Brawlin' and Shot Callin' (Season 1)
    function() O(t[7940], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7940] = a:New(7940, f.Alliance, 7939); end, -- The Second Rule of Brawler's Guild (Season 1)
    function() O(t[7939], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7939] = a:New(7939, f.Horde, 7940); end, -- The Second Rule of Brawler's Guild (Season 1)
    function() O(t[7937], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7937] = a:New(7937, f.Alliance, 8020); end, -- You Are Not Your $#*@! Legplates (Season 1)
    function() t[7936] = a:New(7936); end, -- Pandaren Spirit Tamer
    function() t[7934] = a:New(7934); end, -- Raiding with Leashes
    function() t[7933] = a:New(7933); end, -- And... It's Good!
    function() t[7932] = a:New(7932); end, -- "I'm In Your Base, Killing Your Dudes"
    function() t[7929] = a:New(7929, f.Horde, 7928); end, -- Dominance Offensive Campaign
    function() t[7928] = a:New(7928, f.Alliance, 7929); end, -- Operation: Shieldwall Campaign
    function() t[7908] = a:New(7908); end, -- I Choose You
    function() t[7862] = a:New(7862, f.Horde, 7860); end, -- We're Going to Need More Saddles
    function() t[7860] = a:New(7860, f.Alliance, 7862); end, -- We're Going to Need More Saddles
    function() O(t[7853]); end,
    function() t[7853] = a:New(7853); end, -- WoW's 9th Anniversary
    function() t[7852] = a:New(7852); end, -- They're Both Footballs?
    function() t[7842] = a:New(7842); end, -- Collector's Edition: Baneling
    function() t[7614] = a:New(7614); end, -- Locking Down the Docks
    function() t[7612] = a:New(7612); end, -- The Seat of Knowledge
    function() t[7611] = a:New(7611); end, -- Pandarian Angler
    function() t[7602] = a:New(7602, f.Horde, 7601); end, -- Tricks and Treats of Pandaria
    function() t[7601] = a:New(7601, f.Alliance, 7602); end, -- Tricks and Treats of Pandaria
    function() O(t[7536], "From", "Version", "050300", "Before", "Version", "060002"); end,
    function() t[7536] = a:New(7536); end, -- Chapter IV: Celestial Blessings
    function() O(t[7535], "From", "Version", "050200", "Before", "Version", "060002"); end,
    function() t[7535] = a:New(7535); end, -- Chapter III: Two Princes
    function() O(t[7534], "From", "Version", "050100", "Before", "Version", "060002"); end,
    function() t[7534] = a:New(7534, f.Alliance, 8008); end, -- Chapter II: Wrathion's War
    function() O(t[7533], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[7533] = a:New(7533); end, -- Chapter I: Trial of the Black Prince
    function() t[7530] = a:New(7530, f.Horde, 7527); end, -- No Tank You
    function() t[7529] = a:New(7529, f.Horde, 7526); end, -- Kite Fight
    function() t[7527] = a:New(7527, f.Alliance, 7530); end, -- No Tank You
    function() t[7526] = a:New(7526, f.Alliance, 7529); end, -- Kite Fight
    function() t[7525] = a:New(7525); end, -- Taming Cataclysm
    function() t[7524] = a:New(7524, f.Horde, 7523); end, -- Theramore's Fall
    function() t[7523] = a:New(7523, f.Alliance, 7524); end, -- Theramore's Fall
    function() t[7522] = a:New(7522); end, -- Crypt of Forgotten Kings
    function() t[7521] = a:New(7521); end, -- Time to Open a Pet Store
    function() t[7520] = a:New(7520); end, -- The Loremaster
    function() t[7518] = a:New(7518); end, -- "Wanderers, Dreamers, and You"
    function() t[7509] = a:New(7509, f.Horde, 6874); end, -- Scenaturday
    function() t[7502] = a:New(7502); end, -- Savior of Stoneplow
    function() t[7501] = a:New(7501); end, -- That's a Lot of Pet Food
    function() t[7500] = a:New(7500); end, -- Going to Need More Leashes
    function() t[7499] = a:New(7499); end, -- Taming the World
    function() t[7498] = a:New(7498); end, -- Taming the Great Outdoors
    function() O(t[7487], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[7487] = a:New(7487); end, -- Cutting Edge: Sha of Fear
    function() O(t[7486], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[7486] = a:New(7486); end, -- Cutting Edge: Grand Empress Shek'zeer
    function() O(t[7485], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[7485] = a:New(7485); end, -- Cutting Edge: Will of the Emperor
    function() t[7483] = a:New(7483); end, -- Battle Master
    function() t[7482] = a:New(7482); end, -- Trainer Extraordinaire
    function() t[7479] = a:New(7479); end, -- The Shado-Master
    function() O(t[7468]); end,
    function() t[7468] = a:New(7468, f.Horde, 7467); end, -- Theramore's Fall
    function() O(t[7467]); end,
    function() t[7467] = a:New(7467, f.Alliance, 7468); end, -- Theramore's Fall
    function() t[7465] = a:New(7465); end, -- An Uncommon Find
    function() t[7464] = a:New(7464); end, -- Quality & Quantity
    function() t[7463] = a:New(7463); end, -- Lots of Rarity
    function() t[7462] = a:New(7462); end, -- A Rare Catch
    function() t[7439] = a:New(7439); end, -- Glorious!
    function() t[7438] = a:New(7438); end, -- Could We Find More Like That?
    function() t[7437] = a:New(7437); end, -- A Worthy Opponent
    function() t[7436] = a:New(7436); end, -- Zen Pet Hunter
    function() t[7433] = a:New(7433); end, -- Newbie
    function() t[7413] = a:New(7413); end, -- Scarlet Halls
    function() t[7412] = a:New(7412); end, -- Collector's Edition: Fetish Shaman
    function() t[7411] = a:New(7411); end, -- 10000 Daily Quests Completed
    function() t[7410] = a:New(7410); end, -- 5000 Daily Quests Completed
    function() t[7386] = a:New(7386); end, -- Grand Expedition Yak
    function() t[7385] = a:New(7385); end, -- Pub Crawl
    function() t[7384] = a:New(7384); end, -- Quintessential Quintet
    function() t[7383] = a:New(7383); end, -- Terrific Trio
    function() t[7382] = a:New(7382); end, -- Dynamic Duo
    function() t[7381] = a:New(7381); end, -- Restore Balance
    function() t[7380] = a:New(7380); end, -- Double Agent
    function() t[7379] = a:New(7379); end, -- Pandaren Master of All
    function() t[7378] = a:New(7378); end, -- Jack of All Trades
    function() t[7377] = a:New(7377); end, -- Collector: Worn Monument Ledgers
    function() t[7376] = a:New(7376); end, -- Collector: Mogu Coins
    function() t[7375] = a:New(7375); end, -- Collector: Warlord's Branding Irons
    function() t[7374] = a:New(7374); end, -- Collector: Iron Amulets
    function() t[7373] = a:New(7373); end, -- Collector: Edicts of the Thunder King
    function() t[7372] = a:New(7372); end, -- Collector: Thunder King Insignias
    function() t[7371] = a:New(7371); end, -- Collector: Petrified Bone Whips
    function() t[7370] = a:New(7370); end, -- Collector: Terracotta Arms
    function() t[7369] = a:New(7369); end, -- Collector: Cracked Mogu Runestones
    function() t[7368] = a:New(7368); end, -- Collector: Manacles of Rebellion
    function() t[7367] = a:New(7367); end, -- Collector: Standards of Niuzao
    function() t[7366] = a:New(7366); end, -- Collector: Pearls of Yu'lon
    function() t[7365] = a:New(7365); end, -- Collector: Apothecary Tins
    function() t[7364] = a:New(7364); end, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    function() t[7363] = a:New(7363); end, -- Collector: Carved Bronze Mirrors
    function() t[7362] = a:New(7362); end, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    function() t[7361] = a:New(7361); end, -- Collector: Walking Canes of Brewfather Ren Yun
    function() t[7360] = a:New(7360); end, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    function() t[7359] = a:New(7359); end, -- Collector: Pandaren Game Boards
    function() t[7358] = a:New(7358); end, -- Collector: Pandaren Tea Sets
    function() t[7357] = a:New(7357); end, -- Collector: Worn Monument Ledgers
    function() t[7356] = a:New(7356); end, -- Collector: Mogu Coins
    function() t[7355] = a:New(7355); end, -- Collector: Warlord's Branding Irons
    function() t[7354] = a:New(7354); end, -- Collector: Iron Amulets
    function() t[7353] = a:New(7353); end, -- Collector: Edicts of the Thunder King
    function() t[7352] = a:New(7352); end, -- Collector: Thunder King Insignias
    function() t[7351] = a:New(7351); end, -- Collector: Petrified Bone Whips
    function() t[7350] = a:New(7350); end, -- Collector: Terracotta Arms
    function() t[7349] = a:New(7349); end, -- Collector: Cracked Mogu Runestones
    function() t[7348] = a:New(7348); end, -- Collector: Manacles of Rebellion
    function() t[7347] = a:New(7347); end, -- Collector: Standards of Niuzao
    function() t[7346] = a:New(7346); end, -- Collector: Pearls of Yu'lon
    function() t[7345] = a:New(7345); end, -- Collector: Apothecary Tins
    function() t[7344] = a:New(7344); end, -- Collector: Gold-Inlaid Porcelain Funerary Figurines
    function() t[7343] = a:New(7343); end, -- Collector: Carved Bronze Mirrors
    function() t[7342] = a:New(7342); end, -- Collector: Empty Kegs of Brewfather Xin Wo Yin
    function() t[7341] = a:New(7341); end, -- Collector: Walking Canes of Brewfather Ren Yun
    function() t[7340] = a:New(7340); end, -- Collector: Twin Stein Sets of Brewfather Quan Tou Kuo
    function() t[7339] = a:New(7339); end, -- Collector: Pandaren Game Boards
    function() t[7338] = a:New(7338); end, -- Collector: Pandaren Tea Sets
    function() t[7337] = a:New(7337); end, -- Documents of a Dark History
    function() t[7336] = a:New(7336); end, -- Stone Servants
    function() t[7335] = a:New(7335); end, -- Symbols of Strength
    function() t[7334] = a:New(7334); end, -- Instruments of Cruelty
    function() t[7333] = a:New(7333); end, -- The Four Celestials
    function() t[7332] = a:New(7332); end, -- The Broken Hearted
    function() t[7331] = a:New(7331); end, -- The Three Brew Fathers
    function() t[7330] = a:New(7330); end, -- Pandaren Delicacies
    function() t[7329] = a:New(7329); end, -- Pandaren Cuisine
    function() t[7328] = a:New(7328); end, -- Ironpaw Chef
    function() t[7327] = a:New(7327); end, -- The Pandaren Gourmet
    function() t[7326] = a:New(7326); end, -- The Pandaren Gourmet
    function() t[7325] = a:New(7325); end, -- Now I Am the Master
    function() t[7324] = a:New(7324); end, -- One Step at a Time
    function() t[7323] = a:New(7323); end, -- Collateral Damage
    function() t[7322] = a:New(7322); end, -- Roll Club
    function() t[7321] = a:New(7321); end, -- Spreading the Warmth
    function() t[7320] = a:New(7320); end, -- Dog Pile
    function() t[7319] = a:New(7319); end, -- Ready for Raiding III
    function() t[7318] = a:New(7318); end, -- A Taste of History
    function() t[7317] = a:New(7317); end, -- One Many Army
    function() t[7316] = a:New(7316); end, -- Over Their Heads
    function() O(t[7315]); end,
    function() t[7315] = a:New(7315); end, -- Eternally in the Vale
    function() t[7314] = a:New(7314); end, -- Test Drive
    function() t[7313] = a:New(7313); end, -- Stay Klaxxi
    function() t[7312] = a:New(7312); end, -- Amber is the Color of My Energy
    function() t[7310] = a:New(7310); end, -- Defender of Gods
    function() t[7309] = a:New(7309); end, -- Fire in the Yaung-hole!
    function() t[7308] = a:New(7308); end, -- Know Your Role
    function() t[7307] = a:New(7307); end, -- Silent Assassin
    function() t[7306] = a:New(7306); end, -- Master of Pandaren Cooking
    function() t[7305] = a:New(7305); end, -- Master of the Brew
    function() t[7304] = a:New(7304); end, -- Master of the Oven
    function() t[7303] = a:New(7303); end, -- Master of the Steamer
    function() t[7302] = a:New(7302); end, -- Master of the Pot
    function() t[7301] = a:New(7301); end, -- Master of the Wok
    function() t[7300] = a:New(7300); end, -- Master of the Grill
    function() t[7299] = a:New(7299); end, -- Loner and a Rebel
    function() t[7298] = a:New(7298); end, -- Getting Around with the Shado-Pan
    function() t[7297] = a:New(7297); end, -- Proven Strength
    function() t[7296] = a:New(7296); end, -- Ain't Lost No More
    function() t[7295] = a:New(7295); end, -- Listen to the Drunk Fish
    function() t[7294] = a:New(7294); end, -- A Taste of Things to Come
    function() t[7293] = a:New(7293); end, -- Till the Break of Dawn
    function() t[7292] = a:New(7292); end, -- Green Acres
    function() t[7291] = a:New(7291); end, -- In a Trail of Smoke
    function() t[7290] = a:New(7290); end, -- How To Strain Your Dragon
    function() t[7289] = a:New(7289); end, -- Shadow Hopper
    function() t[7288] = a:New(7288); end, -- Yak Attack
    function() t[7287] = a:New(7287); end, -- Champion of Chi-Ji
    function() t[7286] = a:New(7286); end, -- Finish Them!
    function() t[7285] = a:New(7285); end, -- Every Day I'm Pand-a-ren
    function() t[7284] = a:New(7284); end, -- Is Another Man's Treasure
    function() t[7283] = a:New(7283); end, -- One Man's Trash...
    function() t[7282] = a:New(7282); end, -- Finders Keepers
    function() t[7281] = a:New(7281); end, -- Lost and Found
    function() t[7276] = a:New(7276); end, -- Fancy Footwork
    function() t[7275] = a:New(7275); end, -- It's a Trap!
    function() t[7274] = a:New(7274); end, -- Learning from the Best
    function() t[7273] = a:New(7273); end, -- Beat the Heat
    function() t[7272] = a:New(7272); end, -- In the Eye of the Tiger
    function() t[7271] = a:New(7271); end, -- Arena of Annihilation
    function() O(t[7270], "Never"); end,
    function() t[7270] = a:New(7270, nil, nil, nil, nil, false); end, -- For Display Only
    function() O(t[7269], "Never"); end,
    function() t[7269] = a:New(7269, nil, nil, nil, nil, false); end, -- Stay Off the Grass
    function() O(t[7268], "Never"); end,
    function() t[7268] = a:New(7268, nil, nil, nil, nil, false); end, -- The Temple of Kotmogu
    function() t[7267] = a:New(7267); end, -- Perfect Delivery
    function() t[7266] = a:New(7266); end, -- Save it for Later
    function() t[7265] = a:New(7265); end, -- Greenstone Village
    function() t[7261] = a:New(7261); end, -- The Perfect Pour
    function() t[7258] = a:New(7258); end, -- Party of Six
    function() t[7257] = a:New(7257); end, -- Don't Shake the Keg
    function() t[7252] = a:New(7252); end, -- A Brewing Storm
    function() t[7249] = a:New(7249); end, -- Unga Ingoo
    function() t[7248] = a:New(7248); end, -- "Monkey See, Monkey Kill"
    function() t[7239] = a:New(7239); end, -- Monkey in the Middle
    function() t[7232] = a:New(7232); end, -- The Keg Runner
    function() t[7231] = a:New(7231); end, -- Spill No Evil
    function() t[7230] = a:New(7230); end, -- Legend of the Brewfathers
    function() t[7106] = a:New(7106, nil, nil, true); end, -- Master of Silvershard Mines
    function() t[7103] = a:New(7103, nil, nil, true); end, -- Greed is Good
    function() t[7102] = a:New(7102, nil, nil, true); end, -- Escort Service
    function() t[7100] = a:New(7100, nil, nil, true); end, -- My Diamonds and Your Rust
    function() t[7099] = a:New(7099, nil, nil, true); end, -- Five for Five
    function() t[7062] = a:New(7062, nil, nil, true); end, -- Mine Mine Mine!
    function() t[7057] = a:New(7057, nil, nil, true); end, -- End of the Line
    function() t[7056] = a:New(7056); end, -- "Sorry, Were You Looking for This?"
    function() t[7049] = a:New(7049, nil, nil, true); end, -- Mine Cart Courier
    function() t[7039] = a:New(7039, nil, nil, true); end, -- The Long Riders
    function() t[6981] = a:New(6981, nil, nil, true); end, -- Master of Temple of Kotmogu
    function() t[6980] = a:New(6980, nil, nil, true); end, -- Temple of Kotmogu All-Star
    function() t[6979] = a:New(6979); end, -- Explore Vale of Eternal Blossoms
    function() t[6978] = a:New(6978); end, -- Explore Dread Wastes
    function() t[6977] = a:New(6977); end, -- Explore Townlong Steppes
    function() t[6976] = a:New(6976); end, -- Explore Kun-Lai Summit
    function() t[6975] = a:New(6975); end, -- Explore Krasarang Wilds
    function() t[6974] = a:New(6974); end, -- Pandaria Explorer
    function() t[6973] = a:New(6973, nil, nil, true); end, -- Can't Stop Won't Stop
    function() t[6972] = a:New(6972, nil, nil, true); end, -- What is Best in Life?
    function() t[6971] = a:New(6971, nil, nil, true); end, -- I've Got the Power
    function() t[6970] = a:New(6970, nil, nil, true); end, -- Blackout
    function() t[6969] = a:New(6969); end, -- Explore Valley of the Four Winds
    function() O(t[6954], "From", "Version", "050004", "Before", "Version", "050200"); end,
    function() t[6954] = a:New(6954); end, -- Ahead of the Curve: Will of the Emperor
    function() t[6950] = a:New(6950, nil, nil, true); end, -- Powerball
    function() t[6947] = a:New(6947, nil, nil, true); end, -- Four Square
    function() t[6946] = a:New(6946); end, -- Empowered Spiritualist
    function() t[6945] = a:New(6945); end, -- Mantid Swarm
    function() t[6943] = a:New(6943); end, -- Queuing Spree
    function() t[6942] = a:New(6942, f.Alliance, 6941, true); end, -- Hero of the Alliance
    function() t[6941] = a:New(6941, f.Horde, 6942, true); end, -- Hero of the Horde
    function() O(t[6940], "From", "PvP Season", 11, "Until", "PvP Season", 11); end,
    function() t[6940] = a:New(6940, f.Horde, 6939, true); end, -- Hero of the Horde: Cataclysmic
    function() O(t[6939], "From", "PvP Season", 11, "Until", "PvP Season", 11); end,
    function() t[6939] = a:New(6939, f.Alliance, 6940, true); end, -- Hero of the Alliance: Cataclysmic
    function() O(t[6938], "From", "PvP Season", 11, "Until", "PvP Season", 11); end,
    function() t[6938] = a:New(6938, nil, nil, true); end, -- Cataclysmic Gladiator
    function() t[6937] = a:New(6937); end, -- Overzealous
    function() t[6936] = a:New(6936); end, -- Candle in the Wind
    function() t[6933] = a:New(6933); end, -- Who's Got Two Green Thumbs?
    function() t[6932] = a:New(6932); end, -- Glory of the Pandaria Raider
    function() t[6931] = a:New(6931); end, -- Binan Village All-Star
    function() t[6930] = a:New(6930); end, -- Yaungolian Barbecue
    function() t[6929] = a:New(6929); end, -- And Stay Dead!
    function() t[6928] = a:New(6928); end, -- Burning Man
    function() t[6927] = a:New(6927); end, -- Glory of the Pandaria Hero
    function() t[6926] = a:New(6926); end, -- Tranquil Master
    function() t[6925] = a:New(6925); end, -- Pandaria Dungeon Hero
    function() O(t[6924], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6924] = a:New(6924); end, -- "100,000 Valor Points"
    function() t[6923] = a:New(6923); end, -- Brewmoon Festival
    function() t[6922] = a:New(6922); end, -- Timing is Everything
    function() O(t[6920], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6920] = a:New(6920); end, -- Challenge Conqueror
    function() O(t[6919], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6919] = a:New(6919); end, -- Siege of Niuzao Temple: Gold
    function() O(t[6918], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6918] = a:New(6918); end, -- Siege of Niuzao Temple: Silver
    function() O(t[6917], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6917] = a:New(6917); end, -- Siege of Niuzao Temple: Bronze
    function() O(t[6916], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6916] = a:New(6916); end, -- Scholomance: Gold
    function() O(t[6915], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6915] = a:New(6915); end, -- Scholomance: Silver
    function() O(t[6914], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6914] = a:New(6914); end, -- Scholomance: Bronze
    function() O(t[6913], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6913] = a:New(6913); end, -- Scarlet Monastery: Gold
    function() O(t[6912], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6912] = a:New(6912); end, -- Scarlet Monastery: Silver
    function() O(t[6911], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6911] = a:New(6911); end, -- Scarlet Monastery: Bronze
    function() O(t[6910], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6910] = a:New(6910); end, -- Scarlet Halls: Gold
    function() O(t[6909], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6909] = a:New(6909); end, -- Scarlet Halls: Silver
    function() O(t[6908], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6908] = a:New(6908); end, -- Scarlet Halls: Bronze
    function() O(t[6907], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6907] = a:New(6907); end, -- Gate of the Setting Sun: Gold
    function() O(t[6906], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6906] = a:New(6906); end, -- Gate of the Setting Sun: Silver
    function() O(t[6905], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6905] = a:New(6905); end, -- Gate of the Setting Sun: Bronze
    function() O(t[6904], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6904] = a:New(6904); end, -- Shado-Pan Monastery: Gold
    function() O(t[6903], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6903] = a:New(6903); end, -- Shado-Pan Monastery: Silver
    function() O(t[6902], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6902] = a:New(6902); end, -- Shado-Pan Monastery: Bronze
    function() O(t[6901], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6901] = a:New(6901); end, -- Mogu'shan Palace: Gold
    function() O(t[6900], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6900] = a:New(6900); end, -- Mogu'shan Palace: Silver
    function() O(t[6899], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6899] = a:New(6899); end, -- Mogu'shan Palace: Bronze
    function() O(t[6898], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6898] = a:New(6898); end, -- Siege of Niuzao Temple Challenger
    function() O(t[6897], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6897] = a:New(6897); end, -- Scholomance Challenger
    function() O(t[6896], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6896] = a:New(6896); end, -- Scarlet Monastery Challenger
    function() O(t[6895], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6895] = a:New(6895); end, -- Scarlet Halls Challenger
    function() O(t[6894], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6894] = a:New(6894); end, -- Gate of the Setting Sun Challenger
    function() O(t[6893], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6893] = a:New(6893); end, -- Shado-Pan Monastery Challenger
    function() O(t[6892], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6892] = a:New(6892); end, -- Mogu'shan Palace Challenger
    function() O(t[6891], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6891] = a:New(6891); end, -- Stormstout Brewery: Gold
    function() O(t[6890], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6890] = a:New(6890); end, -- Stormstout Brewery: Silver
    function() O(t[6889], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6889] = a:New(6889); end, -- Stormstout Brewery: Bronze
    function() O(t[6888], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6888] = a:New(6888); end, -- Stormstout Brewery Challenger
    function() O(t[6887], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6887] = a:New(6887); end, -- Temple of the Jade Serpent: Gold
    function() O(t[6886], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6886] = a:New(6886); end, -- Temple of the Jade Serpent: Silver
    function() O(t[6885], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6885] = a:New(6885); end, -- Temple of the Jade Serpent: Bronze
    function() O(t[6884], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6884] = a:New(6884); end, -- Temple of the Jade Serpent Challenger
    function() t[6883] = a:New(6883, nil, nil, true); end, -- Silvershard Mines Veteran
    function() t[6882] = a:New(6882, nil, nil, true); end, -- Temple of Kotmogu Veteran
    function() t[6874] = a:New(6874, f.Alliance, 7509); end, -- Scenaturday
    function() O(t[6873], "Once"); end,
    function() t[6873] = a:New(6873, nil, nil, nil, true); end, -- Realm First! Zen Master Archaeologist
    function() O(t[6872], "Once"); end,
    function() t[6872] = a:New(6872, nil, nil, nil, true); end, -- Realm First! Zen Master Tailor
    function() O(t[6871], "Once"); end,
    function() t[6871] = a:New(6871, nil, nil, nil, true); end, -- Realm First! Zen Master Skinner
    function() O(t[6870], "Once"); end,
    function() t[6870] = a:New(6870, nil, nil, nil, true); end, -- Realm First! Zen Master Miner
    function() O(t[6869], "Once"); end,
    function() t[6869] = a:New(6869, nil, nil, nil, true); end, -- Realm First! Zen Master Leatherworker
    function() O(t[6868], "Once"); end,
    function() t[6868] = a:New(6868, nil, nil, nil, true); end, -- Realm First! Zen Master Jewelcrafter
    function() O(t[6867], "Once"); end,
    function() t[6867] = a:New(6867, nil, nil, nil, true); end, -- Realm First! Zen Master Scribe
    function() O(t[6866], "Once"); end,
    function() t[6866] = a:New(6866, nil, nil, nil, true); end, -- Realm First! Zen Master Herbalist
    function() O(t[6865], "Once"); end,
    function() t[6865] = a:New(6865, nil, nil, nil, true); end, -- Realm First! Zen Master Angler
    function() O(t[6864], "Once"); end,
    function() t[6864] = a:New(6864, nil, nil, nil, true); end, -- Realm First! Zen Master Medic
    function() O(t[6863], "Once"); end,
    function() t[6863] = a:New(6863, nil, nil, nil, true); end, -- Realm First! Zen Master Engineer
    function() O(t[6862], "Once"); end,
    function() t[6862] = a:New(6862, nil, nil, nil, true); end, -- Realm First! Zen Master Enchanter
    function() O(t[6861], "Once"); end,
    function() t[6861] = a:New(6861, nil, nil, nil, true); end, -- Realm First! Zen Master Cook
    function() O(t[6860], "Once"); end,
    function() t[6860] = a:New(6860, nil, nil, nil, true); end, -- Realm First! Zen Master Blacksmith
    function() O(t[6859], "Once"); end,
    function() t[6859] = a:New(6859, nil, nil, nil, true); end, -- Realm First! Zen Master Alchemist
    function() t[6858] = a:New(6858); end, -- What Is Worth Fighting For
    function() t[6857] = a:New(6857); end, -- Heart of the Mantid Swarm
    function() t[6856] = a:New(6856); end, -- Ballad of Liu Lang
    function() t[6855] = a:New(6855); end, -- The Seven Burdens of Shaohao
    function() t[6851] = a:New(6851); end, -- Take 'Em All On!
    function() t[6850] = a:New(6850); end, -- Hozen in the Mist
    function() t[6849] = a:New(6849); end, -- Collector's Edition: Imperial Quilen
    function() t[6848] = a:New(6848); end, -- Collector's Edition: Lucky Quilen Cub
    function() t[6847] = a:New(6847); end, -- The Song of the Yaungol
    function() t[6846] = a:New(6846); end, -- Fish Tales
    function() t[6845] = a:New(6845); end, -- Nightmare of Shek'zeer
    function() t[6844] = a:New(6844); end, -- The Vault of Mysteries
    function() t[6839] = a:New(6839); end, -- Zen Master Fisherman
    function() O(t[6838], "From", "Version", "050005", "Before", "Version", "080001"); end,
    function() t[6838] = a:New(6838); end, -- Zen Master Medic
    function() t[6837] = a:New(6837); end, -- Zen Master Archaeologist
    function() O(t[6836], "From", "Version", "050005", "Before", "Version", "080001"); end,
    function() t[6836] = a:New(6836); end, -- Serious Skills to Pay the Bills
    function() t[6835] = a:New(6835); end, -- Working For a Living
    function() t[6830] = a:New(6830); end, -- Professional Zen Master
    function() O(t[6829], "Once"); end,
    function() t[6829] = a:New(6829, nil, nil, nil, true); end, -- Realm First! Pandaren Ambassador
    function() t[6828] = a:New(6828, f.Alliance, 6827); end, -- Pandaren Ambassador
    function() t[6827] = a:New(6827, f.Horde, 6828); end, -- Pandaren Ambassador
    function() t[6826] = a:New(6826); end, -- 55 Exalted Reputations
    function() t[6825] = a:New(6825); end, -- The Mind-Killer
    function() t[6824] = a:New(6824); end, -- Face Clutchers
    function() t[6823] = a:New(6823); end, -- Must Love Dogs
    function() t[6822] = a:New(6822); end, -- Run with the Wind
    function() t[6821] = a:New(6821); end, -- School's Out Forever
    function() t[6763] = a:New(6763); end, -- Heroic: Siege of Niuzao Temple
    function() t[6762] = a:New(6762); end, -- Heroic: Scholomance
    function() t[6761] = a:New(6761); end, -- Heroic: Scarlet Monastery
    function() t[6760] = a:New(6760); end, -- Heroic: Scarlet Halls
    function() t[6759] = a:New(6759); end, -- Heroic: Gate of the Setting Sun
    function() t[6758] = a:New(6758); end, -- Heroic: Temple of the Jade Serpent
    function() t[6757] = a:New(6757); end, -- Temple of the Jade Serpent
    function() t[6756] = a:New(6756); end, -- Heroic: Mogu'shan Palace
    function() t[6755] = a:New(6755); end, -- Mogu'shan Palace
    function() t[6754] = a:New(6754); end, -- The Dark Heart of the Mogu
    function() t[6753] = a:New(6753); end, -- Got My Mind On My Money
    function() O(t[6752], "Once"); end,
    function() t[6752] = a:New(6752, nil, nil, nil, true); end, -- Realm First! Level 90 Monk
    function() O(t[6751], "Once"); end,
    function() t[6751] = a:New(6751, nil, nil, nil, true); end, -- Realm First! Level 90 Rogue
    function() O(t[6750], "Once"); end,
    function() t[6750] = a:New(6750, nil, nil, nil, true); end, -- Realm First! Level 90 Warrior
    function() O(t[6749], "Once"); end,
    function() t[6749] = a:New(6749, nil, nil, nil, true); end, -- Realm First! Level 90 Mage
    function() O(t[6748], "Once"); end,
    function() t[6748] = a:New(6748, nil, nil, nil, true); end, -- Realm First! Level 90 Death Knight
    function() O(t[6747], "Once"); end,
    function() t[6747] = a:New(6747, nil, nil, nil, true); end, -- Realm First! Level 90 Hunter
    function() O(t[6746], "Once"); end,
    function() t[6746] = a:New(6746, nil, nil, nil, true); end, -- Realm First! Level 90 Warlock
    function() O(t[6745], "Once"); end,
    function() t[6745] = a:New(6745, nil, nil, nil, true); end, -- Realm First! Level 90 Priest
    function() O(t[6744], "Once"); end,
    function() t[6744] = a:New(6744, nil, nil, nil, true); end, -- Realm First! Level 90 Paladin
    function() O(t[6743], "Once"); end,
    function() t[6743] = a:New(6743, nil, nil, nil, true); end, -- Realm First! Level 90 Druid
    function() t[6742] = a:New(6742); end, -- 60 Exalted Reputations
    function() O(t[6741], "From", "PvP Season", 11, "Until", "PvP Season", 11); end,
    function() t[6741] = a:New(6741, nil, nil, true); end, -- Cataclysmic Gladiator's Twilight Drake
    function() t[6740] = a:New(6740, nil, nil, true); end, -- Temple of Kotmogu Victory
    function() t[6739] = a:New(6739, nil, nil, true); end, -- Silvershard Mines Victory
    function() t[6736] = a:New(6736); end, -- What Does This Button Do?
    function() t[6734] = a:New(6734); end, -- Heroic: Sha of Fear
    function() t[6733] = a:New(6733); end, -- Heroic: Lei Shi
    function() t[6732] = a:New(6732); end, -- Heroic: Tsulong
    function() t[6731] = a:New(6731); end, -- Heroic: Protectors of the Endless
    function() t[6730] = a:New(6730); end, -- Heroic: Grand Empress Shek'zeer
    function() t[6729] = a:New(6729); end, -- Heroic: Amber-Shaper Un'sok
    function() t[6728] = a:New(6728); end, -- Heroic: Wind Lord Mel'jarak
    function() t[6727] = a:New(6727); end, -- Heroic: Garalon
    function() t[6726] = a:New(6726); end, -- Heroic: Blade Lord Ta'yak
    function() t[6725] = a:New(6725); end, -- Heroic: Imperial Vizier Zor'lok
    function() t[6724] = a:New(6724); end, -- Heroic: Will of the Emperor
    function() t[6723] = a:New(6723); end, -- Heroic: Elegon
    function() t[6722] = a:New(6722); end, -- Heroic: Four Kings
    function() t[6721] = a:New(6721); end, -- Heroic: Gara'jal the Spiritbinder
    function() t[6720] = a:New(6720); end, -- Heroic: Feng the Accursed
    function() t[6719] = a:New(6719); end, -- Heroic: Stone Guard
    function() t[6718] = a:New(6718); end, -- The Dread Approach
    function() t[6717] = a:New(6717); end, -- Power Overwhelming
    function() t[6716] = a:New(6716); end, -- Between a Saurok and a Hard Place
    function() t[6715] = a:New(6715); end, -- Polyformic Acid Science
    function() t[6713] = a:New(6713); end, -- Quarrelsome Quilen Quintet
    function() t[6689] = a:New(6689); end, -- Terrace of Endless Spring
    function() t[6688] = a:New(6688); end, -- Where's My Air Support?
    function() t[6687] = a:New(6687); end, -- Getting Hot In Here
    function() t[6686] = a:New(6686); end, -- Straight Six
    function() t[6684] = a:New(6684); end, -- Humane Society
    function() t[6683] = a:New(6683); end, -- Less Than Three
    function() t[6674] = a:New(6674); end, -- "Anything You Can Do, I Can Do Better..."
    function() t[6671] = a:New(6671); end, -- Seeds of Doubt
    function() t[6622] = a:New(6622); end, -- Big City Pet Brawler
    function() t[6621] = a:New(6621); end, -- Big City Pet Brawlin' - Horde
    function() t[6620] = a:New(6620, nil, nil, true); end, -- No Time To Heal
    function() t[6619] = a:New(6619); end, -- Win Streak
    function() t[6618] = a:New(6618); end, -- On A Roll
    function() t[6616] = a:New(6616); end, -- Pandaria Tamer
    function() t[6615] = a:New(6615); end, -- Northrend Tamer
    function() t[6614] = a:New(6614); end, -- Outland Tamer
    function() t[6613] = a:New(6613); end, -- Eastern Kingdoms Tamer
    function() t[6612] = a:New(6612); end, -- Kalimdor Tamer
    function() t[6611] = a:New(6611); end, -- Continental Tamer
    function() t[6610] = a:New(6610); end, -- All Pets Allowed
    function() t[6609] = a:New(6609); end, -- No Favorites
    function() t[6608] = a:New(6608); end, -- Family Reunion
    function() t[6607] = a:New(6607); end, -- Taming Azeroth
    function() t[6606] = a:New(6606); end, -- Taming Pandaria
    function() t[6605] = a:New(6605); end, -- Taming Northrend
    function() t[6604] = a:New(6604); end, -- Taming Outland
    function() t[6603] = a:New(6603, f.Alliance, 6602); end, -- Taming Eastern Kingdoms
    function() t[6602] = a:New(6602, f.Horde, 6603); end, -- Taming Kalimdor
    function() t[6601] = a:New(6601); end, -- Taming the Wild
    function() t[6600] = a:New(6600); end, -- Ultimate Trainer
    function() t[6599] = a:New(6599, nil, nil, true); end, -- Legendary Pet Brawler
    function() t[6598] = a:New(6598, nil, nil, true); end, -- Grand Master Pet Brawler
    function() t[6597] = a:New(6597, nil, nil, true); end, -- Master Pet Brawler
    function() t[6596] = a:New(6596, nil, nil, true); end, -- Experienced Pet Brawler
    function() t[6595] = a:New(6595, nil, nil, true); end, -- Pet Brawler
    function() t[6594] = a:New(6594); end, -- Cat Fight!
    function() t[6593] = a:New(6593); end, -- Experienced Pet Battler
    function() t[6592] = a:New(6592); end, -- Legendary Pet Battler
    function() t[6591] = a:New(6591); end, -- Grand Master Pet Battler
    function() t[6590] = a:New(6590); end, -- World Safari
    function() t[6589] = a:New(6589); end, -- Pandaria Safari
    function() t[6588] = a:New(6588); end, -- Northrend Safari
    function() t[6587] = a:New(6587); end, -- Outland Safari
    function() t[6586] = a:New(6586); end, -- Eastern Kingdoms Safari
    function() t[6585] = a:New(6585); end, -- Kalimdor Safari
    function() t[6584] = a:New(6584); end, -- Big City Pet Brawlin' - Alliance
    function() t[6583] = a:New(6583); end, -- Rookie Pet Mob
    function() t[6582] = a:New(6582); end, -- Pro Pet Mob
    function() t[6581] = a:New(6581); end, -- Pro Pet Crew
    function() t[6580] = a:New(6580); end, -- Rookie Pet Crew
    function() t[6579] = a:New(6579); end, -- Rookie Pet Group
    function() t[6578] = a:New(6578); end, -- Pro Pet Group
    function() t[6571] = a:New(6571); end, -- That Was Close!
    function() t[6570] = a:New(6570); end, -- All Growns Up!
    function() t[6569] = a:New(6569); end, -- Old Timer
    function() t[6568] = a:New(6568); end, -- Time for a Leash
    function() t[6567] = a:New(6567); end, -- Growing Up
    function() t[6566] = a:New(6566); end, -- Just a Pup
    function() t[6560] = a:New(6560); end, -- World Pet Mauler
    function() t[6559] = a:New(6559); end, -- Traveling Pet Mauler
    function() t[6558] = a:New(6558); end, -- Local Pet Mauler
    function() t[6557] = a:New(6557); end, -- Master Pet Hunter
    function() t[6556] = a:New(6556); end, -- Going to Need More Traps
    function() t[6555] = a:New(6555); end, -- Building a Team
    function() t[6554] = a:New(6554); end, -- He's Mine!
    function() t[6553] = a:New(6553); end, -- Like an Arrow to the Face
    function() t[6552] = a:New(6552); end, -- Friends on the Farm
    function() t[6551] = a:New(6551); end, -- Friend on the Farm
    function() t[6550] = a:New(6550); end, -- Order of the Cloud Serpent
    function() t[6548] = a:New(6548); end, -- The Lorewalkers
    function() t[6547] = a:New(6547); end, -- The Anglers
    function() t[6546] = a:New(6546); end, -- The Golden Lotus
    function() t[6545] = a:New(6545); end, -- Klaxxi
    function() t[6544] = a:New(6544); end, -- The Tillers
    function() t[6543] = a:New(6543); end, -- The August Celestials
    function() t[6541] = a:New(6541); end, -- Loremaster of Pandaria
    function() t[6540] = a:New(6540); end, -- Dread Haste Makes Dread Waste
    function() t[6539] = a:New(6539); end, -- "One Steppe Forward, Two Steppes Back"
    function() t[6538] = a:New(6538, f.Horde, 6537); end, -- Slum It in the Summit
    function() t[6537] = a:New(6537, f.Alliance, 6538); end, -- Slum It in the Summit
    function() t[6536] = a:New(6536, f.Horde, 6535); end, -- Mighty Roamin' Krasaranger
    function() t[6535] = a:New(6535, f.Alliance, 6536); end, -- Mighty Roamin' Krasaranger
    function() t[6534] = a:New(6534, f.Horde, 6300); end, -- Upjade Complete
    function() t[6531] = a:New(6531); end, -- Attention to Detail
    function() O(t[6524], "Once"); end,
    function() t[6524] = a:New(6524, nil, nil, nil, true); end, -- Realm First! Level 90
    function() O(t[6523], "Once"); end,
    function() t[6523] = a:New(6523, nil, nil, nil, true); end, -- Realm First! Level 90 Shaman
    function() t[6518] = a:New(6518); end, -- I Heard You Like Amber...
    function() t[6517] = a:New(6517); end, -- Extinction Event
    function() t[6485] = a:New(6485); end, -- Return to Sender
    function() t[6480] = a:New(6480); end, -- "Settle Down, Bro"
    function() t[6479] = a:New(6479); end, -- Bomberman
    function() t[6478] = a:New(6478); end, -- Glintrok N' Roll
    function() t[6477] = a:New(6477); end, -- Respect
    function() t[6476] = a:New(6476); end, -- Conscriptinator
    function() t[6475] = a:New(6475); end, -- Cleaning Up
    function() t[6472] = a:New(6472); end, -- The Obvious Solution
    function() t[6471] = a:New(6471); end, -- Hate Leads to Suffering
    function() t[6470] = a:New(6470); end, -- Heroic: Shado-Pan Monastery
    function() t[6469] = a:New(6469); end, -- Shado-Pan Monastery
    function() t[6462] = a:New(6462); end, -- Master Pet Battler
    function() t[6460] = a:New(6460); end, -- Hydrophobia
    function() t[6458] = a:New(6458); end, -- Guardians of Mogu'shan
    function() t[6457] = a:New(6457); end, -- Stormstout Brewery
    function() t[6456] = a:New(6456); end, -- Heroic: Stormstout Brewery
    function() t[6455] = a:New(6455); end, -- Show Me Your Moves!
    function() O(t[6433], "Once"); end,
    function() t[6433] = a:New(6433, nil, nil, nil, true); end, -- Realm First! Challenge Conqueror: Gold
    function() t[6427] = a:New(6427); end, -- Mosh Pit
    function() t[6420] = a:New(6420); end, -- Hopocalypse Now!
    function() t[6402] = a:New(6402); end, -- Ling-Ting's Herbal Journey
    function() t[6400] = a:New(6400); end, -- How Did He Get Up There?
    function() t[6396] = a:New(6396); end, -- Sanguinarian
    function() t[6394] = a:New(6394); end, -- Rattle No More
    function() O(t[6378], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6378] = a:New(6378); end, -- Challenge Conqueror: Gold
    function() O(t[6375], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6375] = a:New(6375); end, -- Challenge Conqueror: Silver
    function() O(t[6374], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[6374] = a:New(6374); end, -- Challenge Conqueror: Bronze
    function() t[6366] = a:New(6366); end, -- Shado-Pan
    function() t[6365] = a:New(6365); end, -- Zen Master Cook
    function() t[6351] = a:New(6351); end, -- Explore Jade Forest
    function() t[6350] = a:New(6350); end, -- To All the Squirrels I Once Caressed?
    function() O(t[6349], "From", "Version", "050005", "Before", "Version", "080001"); end,
    function() t[6349] = a:New(6349); end, -- Mystically Epic
    function() O(t[6348], "From", "Version", "050005", "Before", "Version", "080001"); end,
    function() t[6348] = a:New(6348); end, -- Mystically Superior
    function() t[6332] = a:New(6332); end, -- That Rabbit's Dynamite!
    function() O(t[6322], "From", "PvP Season", 10, "Until", "PvP Season", 10); end,
    function() t[6322] = a:New(6322, nil, nil, true); end, -- Ruthless Gladiator's Twilight Drake
    function() O(t[6317], "From", "PvP Season", 10, "Until", "PvP Season", 10); end,
    function() t[6317] = a:New(6317, f.Horde, 6316, true); end, -- Hero of the Horde: Ruthless
    function() O(t[6316], "From", "PvP Season", 10, "Until", "PvP Season", 10); end,
    function() t[6316] = a:New(6316, f.Alliance, 6317, true); end, -- Hero of the Alliance: Ruthless
    function() t[6301] = a:New(6301); end, -- Rally the Valley
    function() t[6300] = a:New(6300, f.Alliance, 6534); end, -- Upjade Complete
    function() O(t[6193], "From", "Version", "050005", "Before", "Version", "090001"); end,
    function() t[6193] = a:New(6193); end, -- Level 90 (Legacy)
    function() t[6185] = a:New(6185); end, -- Murkablo
    function() t[6181] = a:New(6181); end, -- Fangs of the Father
    function() t[6180] = a:New(6180); end, -- Chromatic Champion
    function() t[6177] = a:New(6177); end, -- Destroyer's End
    function() t[6175] = a:New(6175); end, -- Holding Hands
    function() t[6174] = a:New(6174); end, -- Don't Stand So Close to Me
    function() t[6169] = a:New(6169); end, -- Glory of the Dragon Soul Raider
    function() t[6133] = a:New(6133); end, -- Maybe He'll Get Dizzy...
    function() t[6132] = a:New(6132); end, -- Eclipse
    function() O(t[6131]); end,
    function() t[6131] = a:New(6131); end, -- WoW's 8th Anniversary
    function() t[6130] = a:New(6130); end, -- Severed Ties
    function() t[6129] = a:New(6129); end, -- Taste the Rainbow!
    function() t[6128] = a:New(6128); end, -- Ping Pong Champion
    function() t[6127] = a:New(6127); end, -- Lazy Eye
    function() O(t[6124], "From", "PvP Season", 10, "Until", "PvP Season", 10); end,
    function() t[6124] = a:New(6124, nil, nil, true); end, -- Ruthless Gladiator
    function() t[6119] = a:New(6119); end, -- Heroic: Hour of Twilight
    function() t[6118] = a:New(6118); end, -- Heroic: Well of Eternity
    function() t[6117] = a:New(6117); end, -- Heroic: End Time
    function() t[6116] = a:New(6116); end, -- Heroic: Madness of Deathwing
    function() t[6115] = a:New(6115); end, -- Heroic: Spine of Deathwing
    function() t[6114] = a:New(6114); end, -- Heroic: Warmaster Blackhorn
    function() t[6113] = a:New(6113); end, -- Heroic: Ultraxion
    function() t[6112] = a:New(6112); end, -- Heroic: Hagara the Stormbinder
    function() t[6111] = a:New(6111); end, -- Heroic: Yor'sahj the Unsleeping
    function() t[6110] = a:New(6110); end, -- Heroic: Warlord Zon'ozz
    function() t[6109] = a:New(6109); end, -- Heroic: Morchok
    function() t[6108] = a:New(6108); end, -- Alizabal
    function() t[6107] = a:New(6107); end, -- Fall of Deathwing
    function() t[6106] = a:New(6106); end, -- Siege of Wyrmrest Temple
    function() t[6105] = a:New(6105); end, -- Deck Defender
    function() t[6089] = a:New(6089); end, -- Keep Rollin' Rollin' Rollin'
    function() t[6084] = a:New(6084); end, -- Minutes to Midnight
    function() t[6070] = a:New(6070); end, -- That's Not Canon!
    function() t[6061] = a:New(6061); end, -- Gaudy Winter Veil Sweater
    function() t[6060] = a:New(6060); end, -- MiniZep Controller
    function() t[6059] = a:New(6059); end, -- Red Rider Air Rifle
    function() t[6045] = a:New(6045); end, -- Occu'thar
    function() t[6032] = a:New(6032); end, -- Faire Favors
    function() t[6031] = a:New(6031, f.Horde, 6030); end, -- Taking the Show on the Road
    function() t[6030] = a:New(6030, f.Alliance, 6031); end, -- Taking the Show on the Road
    function() t[6029] = a:New(6029); end, -- Darkmoon Despoiler
    function() t[6028] = a:New(6028); end, -- Darkmoon Defender
    function() t[6027] = a:New(6027); end, -- Darkmoon Dungeoneer
    function() t[6026] = a:New(6026); end, -- Fairegoer's Feast
    function() t[6025] = a:New(6025); end, -- I Was Promised a Pony
    function() t[6024] = a:New(6024); end, -- Darkmoon Dominator
    function() t[6023] = a:New(6023); end, -- Darkmoon Duelist
    function() t[6022] = a:New(6022); end, -- Quick Shot
    function() t[6021] = a:New(6021); end, -- Blastenheimer Bullseye
    function() t[6020] = a:New(6020); end, -- Step Right Up
    function() t[6019] = a:New(6019); end, -- "Come One, Come All!"
    function() t[6014] = a:New(6014, f.Horde, 6013); end, -- Extinguishing the Cataclysm
    function() t[6013] = a:New(6013, f.Alliance, 6014); end, -- Extinguishing the Cataclysm
    function() t[6012] = a:New(6012, f.Horde, 6011); end, -- Flame Keeper of Cataclysm
    function() t[6011] = a:New(6011, f.Alliance, 6012); end, -- Flame Warden of Cataclysm
    function() t[6010] = a:New(6010, f.Horde, 6007); end, -- Extinguishing Northrend
    function() t[6009] = a:New(6009, f.Horde, 6008); end, -- Flame Keeper of Northrend
    function() t[6008] = a:New(6008, f.Alliance, 6009); end, -- Flame Warden of Northrend
    function() t[6007] = a:New(6007, f.Alliance, 6010); end, -- Extinguishing Northrend
    function() t[6006] = a:New(6006); end, -- Elders of Cataclysm
    function() O(t[6003], "From", "PvP Season", 9, "Until", "PvP Season", 9); end,
    function() t[6003] = a:New(6003, nil, nil, true); end, -- Vicious Gladiator's Twilight Drake
    function() O(t[6002], "From", "PvP Season", 9, "Until", "PvP Season", 9); end,
    function() t[6002] = a:New(6002, nil, nil, true); end, -- Vicious Gladiator
    function() t[5995] = a:New(5995); end, -- Moon Guard
    function() t[5879] = a:New(5879); end, -- Veteran of the Molten Front
    function() t[5877] = a:New(5877); end, -- Menagerie
    function() t[5876] = a:New(5876); end, -- Petting Zoo
    function() t[5875] = a:New(5875); end, -- Littlest Pet Shop
    function() t[5874] = a:New(5874); end, -- Death From Above
    function() t[5873] = a:New(5873); end, -- Ready for Raiding II
    function() t[5872] = a:New(5872); end, -- King of the Spider-Hill
    function() t[5871] = a:New(5871); end, -- Master of the Molten Flow
    function() t[5870] = a:New(5870); end, -- Fireside Chat
    function() t[5869] = a:New(5869); end, -- Infernal Ambassadors
    function() t[5868] = a:New(5868); end, -- And the Meek Shall Inherit Kalimdor
    function() t[5867] = a:New(5867); end, -- Flawless Victory
    function() t[5866] = a:New(5866); end, -- The Molten Front Offensive
    function() t[5865] = a:New(5865); end, -- Have... Have We Met?
    function() t[5864] = a:New(5864); end, -- Gang War
    function() O(t[5863]); end,
    function() t[5863] = a:New(5863); end, -- WoW's 7th Anniversary
    function() t[5862] = a:New(5862); end, -- Ludicrous Speed
    function() t[5861] = a:New(5861); end, -- The Fiery Lords of Sethria's Roost
    function() t[5860] = a:New(5860); end, -- The 'Unbeatable?' Pterodactyl: BEATEN.
    function() t[5859] = a:New(5859); end, -- Legacy of Leyara
    function() t[5858] = a:New(5858); end, -- Bear-ly Made It
    function() t[5855] = a:New(5855); end, -- Ragnar-O's
    function() t[5854] = a:New(5854, f.Horde, 5853); end, -- A-Caroling We Will Go
    function() t[5853] = a:New(5853, f.Alliance, 5854); end, -- A-Caroling We Will Go
    function() t[5851] = a:New(5851); end, -- Gone Fishin'
    function() t[5850] = a:New(5850, f.Horde, 5848); end, -- Fish or Cut Bait: Undercity
    function() t[5849] = a:New(5849, f.Horde, 5847); end, -- Fish or Cut Bait: Thunder Bluff
    function() t[5848] = a:New(5848, f.Alliance, 5850); end, -- Fish or Cut Bait: Darnassus
    function() t[5847] = a:New(5847, f.Alliance, 5849); end, -- Fish or Cut Bait: Ironforge
    function() t[5845] = a:New(5845); end, -- A Bunch of Lunch
    function() t[5844] = a:New(5844, f.Horde, 5842); end, -- Let's Do Lunch: Undercity
    function() t[5843] = a:New(5843, f.Horde, 5841); end, -- Let's Do Lunch: Thunder Bluff
    function() t[5842] = a:New(5842, f.Alliance, 5844); end, -- Let's Do Lunch: Darnassus
    function() t[5841] = a:New(5841, f.Alliance, 5843); end, -- Let's Do Lunch: Ironforge
    function() t[5839] = a:New(5839); end, -- "Dragonwrath, Tarecgosa's Rest"
    function() t[5838] = a:New(5838, f.Horde, 5837); end, -- Tricks and Treats of the Cataclysm
    function() t[5837] = a:New(5837, f.Alliance, 5838); end, -- Tricks and Treats of the Cataclysm
    function() t[5836] = a:New(5836, f.Alliance, 5835); end, -- Tricks and Treats of Northrend
    function() t[5835] = a:New(5835, f.Horde, 5836); end, -- Tricks and Treats of Northrend
    function() t[5830] = a:New(5830); end, -- Share the Pain
    function() t[5829] = a:New(5829); end, -- Bucket List
    function() t[5828] = a:New(5828); end, -- Glory of the Firelands Raider
    function() t[5827] = a:New(5827); end, -- Avengers of Hyjal
    function() t[5824] = a:New(5824, f.Horde, 5823, true); end, -- Veteran of the Horde II
    function() t[5823] = a:New(5823, f.Alliance, 5824, true); end, -- Veteran of the Alliance II
    function() t[5821] = a:New(5821); end, -- Death from Above
    function() t[5813] = a:New(5813); end, -- Do a Barrel Roll!
    function() t[5810] = a:New(5810); end, -- Not an Ambi-Turner
    function() t[5809] = a:New(5809); end, -- Heroic: Alysrazor
    function() t[5808] = a:New(5808); end, -- Heroic: Lord Rhyolith
    function() t[5807] = a:New(5807); end, -- Heroic: Beth'tilac
    function() t[5806] = a:New(5806); end, -- Heroic: Shannox
    function() t[5805] = a:New(5805); end, -- Heroic: Baleroc
    function() t[5804] = a:New(5804); end, -- Heroic: Majordomo Fandral Staghelm
    function() t[5803] = a:New(5803); end, -- Heroic: Ragnaros
    function() t[5802] = a:New(5802); end, -- Firelands
    function() t[5799] = a:New(5799); end, -- Only the Penitent...
    function() t[5794] = a:New(5794); end, -- Time Flies When You're Having Fun
    function() O(t[5788], "Never"); end,
    function() t[5788] = a:New(5788); end, -- Agent of the Shen'dralar
    function() t[5779] = a:New(5779); end, -- You'll Feel Right as Rain
    function() t[5769] = a:New(5769); end, -- Heroic: Zul'Aman
    function() t[5768] = a:New(5768); end, -- Heroic: Zul'Gurub
    function() t[5767] = a:New(5767); end, -- Scourer of the Eternal Sands
    function() t[5765] = a:New(5765); end, -- "Here, Kitty Kitty..."
    function() t[5762] = a:New(5762); end, -- Ohganot So Fast!
    function() t[5761] = a:New(5761); end, -- Hex Mix
    function() t[5760] = a:New(5760); end, -- Ring Out!
    function() t[5759] = a:New(5759); end, -- Spirit Twister
    function() t[5755] = a:New(5755); end, -- Thirty Tabards
    function() t[5754] = a:New(5754); end, -- Drown Your Sorrows
    function() t[5753] = a:New(5753); end, -- Cataclysmically Delicious
    function() t[5752] = a:New(5752); end, -- Justly Rewarded
    function() t[5751] = a:New(5751); end, -- 2500 Daily Quests Completed
    function() t[5750] = a:New(5750); end, -- Tunnel Vision
    function() t[5749] = a:New(5749); end, -- Vial of the Sands
    function() t[5744] = a:New(5744); end, -- Gurubashi Headhunter
    function() t[5743] = a:New(5743); end, -- It's Not Easy Being Green
    function() t[5723] = a:New(5723); end, -- 50 Exalted Reputations
    function() t[5719] = a:New(5719, f.Horde, 5718); end, -- Just Another Day in Tol Barad
    function() t[5718] = a:New(5718, f.Alliance, 5719); end, -- Just Another Day in Tol Barad
    function() t[5552] = a:New(5552, f.Horde, 5231, true); end, -- Double Jeopardy
    function() t[5548] = a:New(5548); end, -- To All the Squirrels Who Cared for Me
    function() t[5547] = a:New(5547); end, -- Glutton for Shadowy Punishment
    function() t[5546] = a:New(5546); end, -- Glutton for Icy Punishment
    function() O(t[5542], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[5542] = a:New(5542, nil, nil, true); end, -- 1000 Conquest Points
    function() O(t[5541], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[5541] = a:New(5541, nil, nil, true); end, -- 5000 Conquest Points
    function() O(t[5540], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[5540] = a:New(5540, nil, nil, true); end, -- "25,000 Conquest Points"
    function() O(t[5539], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[5539] = a:New(5539, nil, nil, true); end, -- "50,000 Conquest Points"
    function() O(t[5538], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[5538] = a:New(5538); end, -- "50,000 Valor Points"
    function() O(t[5537], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[5537] = a:New(5537); end, -- "25,000 Valor Points"
    function() O(t[5536], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[5536] = a:New(5536); end, -- 5000 Valor Points
    function() O(t[5535], "From", "Version", "050005", "Before", "Version", "060002"); end,
    function() t[5535] = a:New(5535); end, -- 1000 Valor Points
    function() O(t[5533], "Never"); end,
    function() t[5533] = a:New(5533); end, -- Veteran of the Shifting Sands
    function() t[5518] = a:New(5518); end, -- Stood in the Fire
    function() O(t[5512]); end,
    function() t[5512] = a:New(5512); end, -- WoW's 6th Anniversary
    function() t[5511] = a:New(5511); end, -- It's Always in the Last Place You Look
    function() t[5506] = a:New(5506); end, -- Defender of a Shattered World
    function() t[5505] = a:New(5505); end, -- Bullet Time
    function() t[5504] = a:New(5504); end, -- To the Ground!
    function() t[5503] = a:New(5503); end, -- Pardon Denied
    function() t[5501] = a:New(5501, f.Horde, 4873); end, -- Fading into Twilight
    function() t[5490] = a:New(5490, f.Horde, 5489, true); end, -- Master of Tol Barad
    function() t[5489] = a:New(5489, f.Alliance, 5490, true); end, -- Master of Tol Barad
    function() t[5488] = a:New(5488, nil, nil, true); end, -- Towers of Power
    function() t[5487] = a:New(5487, nil, nil, true); end, -- Tol Barad Saboteur
    function() t[5486] = a:New(5486, nil, nil, true); end, -- Tol Barad All-Star
    function() t[5483] = a:New(5483); end, -- Bounce
    function() t[5482] = a:New(5482, f.Horde, 5481); end, -- Dragonmaw Tour of Duty
    function() t[5481] = a:New(5481, f.Alliance, 5482); end, -- Wildhammer Tour of Duty
    function() t[5480] = a:New(5480); end, -- Preparing for Disaster
    function() t[5479] = a:New(5479); end, -- The Oceanographer
    function() t[5478] = a:New(5478); end, -- The Limnologist
    function() t[5477] = a:New(5477, f.Horde, 5476); end, -- Fish or Cut Bait: Orgrimmar
    function() t[5476] = a:New(5476, f.Alliance, 5477); end, -- Fish or Cut Bait: Stormwind
    function() t[5475] = a:New(5475, f.Horde, 5474); end, -- Let's Do Lunch: Orgrimmar
    function() t[5474] = a:New(5474, f.Alliance, 5475); end, -- Let's Do Lunch: Stormwind
    function() t[5473] = a:New(5473); end, -- The Cataclysmic Gourmet
    function() t[5472] = a:New(5472); end, -- The Cataclysmic Gourmet
    function() t[5471] = a:New(5471); end, -- Iron Chef
    function() t[5470] = a:New(5470); end, -- Diggerest
    function() t[5469] = a:New(5469); end, -- Diggerer
    function() t[5456] = a:New(5456); end, -- Got My Mind On My Money
    function() t[5455] = a:New(5455); end, -- Got My Mind On My Money
    function() t[5454] = a:New(5454, f.Horde); end, -- Joy Ride
    function() t[5453] = a:New(5453, f.Alliance); end, -- Ghosts in the Dark
    function() t[5452] = a:New(5452); end, -- Visions of Vashj'ir Past
    function() t[5451] = a:New(5451); end, -- Consumed by Nightmare
    function() t[5450] = a:New(5450); end, -- Fungal Frenzy
    function() t[5449] = a:New(5449); end, -- Rock Lover
    function() t[5448] = a:New(5448); end, -- Glutton for Fiery Punishment
    function() t[5447] = a:New(5447); end, -- My Very Own Broodmother
    function() t[5446] = a:New(5446); end, -- The Glop Family Line
    function() t[5445] = a:New(5445); end, -- Fungalophobia
    function() t[5444] = a:New(5444); end, -- "Ready, Set, Goat!"
    function() t[5443] = a:New(5443); end, -- E'ko Madness
    function() t[5442] = a:New(5442); end, -- Full Caravan
    function() t[5418] = a:New(5418, f.Horde, 5417, true); end, -- Tol Barad Veteran
    function() t[5417] = a:New(5417, f.Alliance, 5418, true); end, -- Tol Barad Veteran
    function() t[5416] = a:New(5416); end, -- Pit Lord Argaloth
    function() t[5415] = a:New(5415, nil, nil, true); end, -- Tower Plower
    function() t[5412] = a:New(5412, nil, nil, true); end, -- Tol Barad Victory
    function() O(t[5396], "Once"); end,
    function() t[5396] = a:New(5396, nil, nil, nil, true); end, -- Realm First! Illustrious Archaeologist
    function() O(t[5395], "Once"); end,
    function() t[5395] = a:New(5395, nil, nil, nil, true); end, -- Realm First! Grand Master Archaeologist
    function() O(t[5394], "Once"); end,
    function() t[5394] = a:New(5394, nil, nil, nil, true); end, -- Realm First! Illustrious Tailor
    function() O(t[5393], "Once"); end,
    function() t[5393] = a:New(5393, nil, nil, nil, true); end, -- Realm First! Illustrious Skinner
    function() O(t[5392], "Once"); end,
    function() t[5392] = a:New(5392, nil, nil, nil, true); end, -- Realm First! Illustrious Miner
    function() O(t[5391], "Once"); end,
    function() t[5391] = a:New(5391, nil, nil, nil, true); end, -- Realm First! Illustrious Leatherworker
    function() O(t[5390], "Once"); end,
    function() t[5390] = a:New(5390, nil, nil, nil, true); end, -- Realm First! Illustrious Jewelcrafter
    function() O(t[5389], "Once"); end,
    function() t[5389] = a:New(5389, nil, nil, nil, true); end, -- Realm First! Illustrious Scribe
    function() O(t[5388], "Once"); end,
    function() t[5388] = a:New(5388, nil, nil, nil, true); end, -- Realm First! Illustrious Herbalist
    function() O(t[5387], "Once"); end,
    function() t[5387] = a:New(5387, nil, nil, nil, true); end, -- Realm First! Illustrious Angler
    function() O(t[5386], "Once"); end,
    function() t[5386] = a:New(5386, nil, nil, nil, true); end, -- Realm First! Illustrious Medic
    function() O(t[5385], "Once"); end,
    function() t[5385] = a:New(5385, nil, nil, nil, true); end, -- Realm First! Illustrious Engineer
    function() O(t[5384], "Once"); end,
    function() t[5384] = a:New(5384, nil, nil, nil, true); end, -- Realm First! Illustrious Enchanter
    function() O(t[5383], "Once"); end,
    function() t[5383] = a:New(5383, nil, nil, nil, true); end, -- Realm First! Illustrious Cook
    function() O(t[5382], "Once"); end,
    function() t[5382] = a:New(5382, nil, nil, nil, true); end, -- Realm First! Illustrious Blacksmith
    function() O(t[5381], "Once"); end,
    function() t[5381] = a:New(5381, nil, nil, nil, true); end, -- Realm First! Illustrious Alchemist
    function() t[5378] = a:New(5378); end, -- Deathy
    function() t[5377] = a:New(5377); end, -- Collector's Edition: Lil' Deathwing
    function() t[5376] = a:New(5376, f.Horde, 5375); end, -- Hellscream's Reach
    function() t[5375] = a:New(5375, f.Alliance, 5376); end, -- Baradin's Wardens
    function() t[5374] = a:New(5374); end, -- 45 Exalted Reputations
    function() O(t[5373], "From", "Version", "040003a", "Before", "Version", "080001"); end,
    function() t[5373] = a:New(5373); end, -- Cataclysmically Superior
    function() O(t[5372], "From", "Version", "040003a", "Before", "Version", "080001"); end,
    function() t[5372] = a:New(5372); end, -- Cataclysmically Epic
    function() t[5371] = a:New(5371); end, -- Vigorous VanCleef Vindicator
    function() t[5370] = a:New(5370); end, -- I'm on a Diet
    function() t[5369] = a:New(5369); end, -- It's Frost Damage
    function() t[5368] = a:New(5368); end, -- Prototype Prodigy
    function() t[5367] = a:New(5367); end, -- Rat Pack
    function() t[5366] = a:New(5366); end, -- Ready for Raiding
    function() t[5363] = a:New(5363, nil, nil, true); end, -- 250000 Honorable Kills
    function() t[5359] = a:New(5359, f.Alliance, 5338, true); end, -- Knight-Champion
    function() O(t[5358], "From", "PvP Season", 9, "Until", "PvP Season", 9); end,
    function() t[5358] = a:New(5358, f.Horde, 5344, true); end, -- Hero of the Horde: Vicious
    function() t[5357] = a:New(5357, f.Alliance, 5342, true); end, -- Field Marshal
    function() t[5356] = a:New(5356, f.Horde, 5343, true); end, -- High Warlord
    function() t[5355] = a:New(5355, f.Horde, 5341, true); end, -- General
    function() t[5354] = a:New(5354, f.Horde, 5340, true); end, -- Lieutenant General
    function() t[5353] = a:New(5353, f.Horde, 5339, true); end, -- Champion
    function() t[5352] = a:New(5352, f.Horde, 5337, true); end, -- Legionnaire
    function() t[5351] = a:New(5351, f.Horde, 5336, true); end, -- Blood Guard
    function() t[5350] = a:New(5350, f.Horde, 5335, true); end, -- Stone Guard
    function() t[5349] = a:New(5349, f.Horde, 5334, true); end, -- First Sergeant
    function() t[5348] = a:New(5348, f.Horde, 5333, true); end, -- Senior Sergeant
    function() t[5347] = a:New(5347, f.Horde, 5332, true); end, -- Sergeant
    function() t[5346] = a:New(5346, f.Horde, 5331, true); end, -- Grunt
    function() t[5345] = a:New(5345, f.Horde, 5330, true); end, -- Scout
    function() O(t[5344], "From", "PvP Season", 9, "Until", "PvP Season", 9); end,
    function() t[5344] = a:New(5344, f.Alliance, 5358, true); end, -- Hero of the Alliance: Vicious
    function() t[5343] = a:New(5343, f.Alliance, 5356, true); end, -- Grand Marshal
    function() t[5342] = a:New(5342, f.Horde, 5357, true); end, -- Warlord
    function() t[5341] = a:New(5341, f.Alliance, 5355, true); end, -- Marshal
    function() t[5340] = a:New(5340, f.Alliance, 5354, true); end, -- Commander
    function() t[5339] = a:New(5339, f.Alliance, 5353, true); end, -- Lieutenant Commander
    function() t[5338] = a:New(5338, f.Horde, 5359, true); end, -- Centurion
    function() t[5337] = a:New(5337, f.Alliance, 5352, true); end, -- Knight-Captain
    function() t[5336] = a:New(5336, f.Alliance, 5351, true); end, -- Knight-Lieutenant
    function() t[5335] = a:New(5335, f.Alliance, 5350, true); end, -- Knight
    function() t[5334] = a:New(5334, f.Alliance, 5349, true); end, -- Sergeant Major
    function() t[5333] = a:New(5333, f.Alliance, 5348, true); end, -- Master Sergeant
    function() t[5332] = a:New(5332, f.Alliance, 5347, true); end, -- Sergeant
    function() t[5331] = a:New(5331, f.Alliance, 5346, true); end, -- Corporal
    function() t[5330] = a:New(5330, f.Alliance, 5345, true); end, -- Private
    function() t[5329] = a:New(5329, f.Alliance, 5326, true); end, -- Warbound Veteran of the Alliance
    function() t[5328] = a:New(5328, f.Alliance, 5325, true); end, -- Veteran of the Alliance
    function() t[5327] = a:New(5327, f.Alliance, 5324, true); end, -- In Service of the Alliance
    function() t[5326] = a:New(5326, f.Horde, 5329, true); end, -- Warbringer of the Horde
    function() t[5325] = a:New(5325, f.Horde, 5328, true); end, -- Veteran of the Horde
    function() t[5324] = a:New(5324, f.Horde, 5327, true); end, -- In Service of the Horde
    function() t[5323] = a:New(5323, f.Horde, 5322, true); end, -- In Service of the Horde
    function() t[5322] = a:New(5322, f.Alliance, 5323, true); end, -- In Service of the Alliance
    function() t[5321] = a:New(5321, f.Horde, 5320); end, -- King of the Mountain
    function() t[5320] = a:New(5320, f.Alliance, 5321); end, -- King of the Mountain
    function() t[5319] = a:New(5319, f.Horde, 5318); end, -- "20,000 Leagues Under the Sea"
    function() t[5318] = a:New(5318, f.Alliance, 5319); end, -- "20,000 Leagues Under the Sea"
    function() t[5317] = a:New(5317); end, -- Help the Bombardier! I'm the Bombardier!
    function() t[5315] = a:New(5315); end, -- Digger
    function() O(t[5313]); end,
    function() t[5313] = a:New(5313); end, -- I Can't Hear You Over the Sound of How Awesome I Am
    function() t[5312] = a:New(5312); end, -- The Abyss Will Gaze Back Into You
    function() t[5311] = a:New(5311); end, -- Elementary
    function() t[5310] = a:New(5310); end, -- Aberrant Behavior
    function() t[5309] = a:New(5309); end, -- Full of Sound and Fury
    function() t[5308] = a:New(5308); end, -- Silence is Golden
    function() t[5307] = a:New(5307); end, -- Achieve-a-tron
    function() t[5306] = a:New(5306); end, -- Parasite Evening
    function() t[5305] = a:New(5305); end, -- Four Play
    function() t[5304] = a:New(5304); end, -- Stay Chill
    function() t[5301] = a:New(5301); end, -- The Boy Who Would be King
    function() t[5300] = a:New(5300); end, -- The Only Escape
    function() t[5298] = a:New(5298); end, -- Don't Need to Break Eggs to Make an Omelet
    function() t[5297] = a:New(5297); end, -- Umbrage for Umbriss
    function() t[5296] = a:New(5296); end, -- Faster Than the Speed of Light
    function() t[5295] = a:New(5295); end, -- Sun of a....
    function() t[5294] = a:New(5294); end, -- Straw That Broke the Camel's Back
    function() t[5293] = a:New(5293); end, -- I Hate That Song
    function() t[5292] = a:New(5292); end, -- Headed South
    function() t[5291] = a:New(5291); end, -- Acrocalypse Now
    function() t[5290] = a:New(5290); end, -- Kill It With Fire!
    function() t[5289] = a:New(5289); end, -- Extra Credit Bonus Stage
    function() t[5288] = a:New(5288); end, -- No Static at All
    function() t[5287] = a:New(5287); end, -- Rotten to the Core
    function() t[5286] = a:New(5286); end, -- Prince of Tides
    function() t[5285] = a:New(5285); end, -- Old Faithful
    function() t[5284] = a:New(5284); end, -- Ascendant Descending
    function() t[5283] = a:New(5283); end, -- Too Hot to Handle
    function() t[5282] = a:New(5282); end, -- Arrested Development
    function() t[5281] = a:New(5281); end, -- Crushing Bones and Cracking Skulls
    function() t[5269] = a:New(5269, f.Horde, 5268, true); end, -- In Service of the Horde
    function() t[5268] = a:New(5268, f.Alliance, 5269, true); end, -- In Service of the Alliance
    function() t[5267] = a:New(5267, nil, nil, true); end, -- Three's Company: 2700
    function() t[5266] = a:New(5266, nil, nil, true); end, -- Three's Company: 2400
    function() t[5262] = a:New(5262, nil, nil, true); end, -- Double Rainbow
    function() t[5258] = a:New(5258, nil, nil, true); end, -- Master of the Battle for Gilneas
    function() t[5257] = a:New(5257, nil, nil, true); end, -- Battle for Gilneas Assassin
    function() t[5256] = a:New(5256, nil, nil, true); end, -- Battle for Gilneas All-Star
    function() t[5255] = a:New(5255, nil, nil, true); end, -- Jugger Not
    function() t[5254] = a:New(5254, nil, nil, true); end, -- Newbs to Plowshares
    function() t[5253] = a:New(5253, nil, nil, true); end, -- Full Coverage
    function() t[5252] = a:New(5252, nil, nil, true); end, -- Don't Get Cocky Kid
    function() t[5251] = a:New(5251, nil, nil, true); end, -- Not Your Average PUG'er
    function() t[5250] = a:New(5250, nil, nil, true); end, -- Out of the Fog
    function() t[5249] = a:New(5249, nil, nil, true); end, -- One Two Three You Don't Know About Me
    function() t[5248] = a:New(5248, nil, nil, true); end, -- Bustin' Caps to Make It Haps
    function() t[5247] = a:New(5247, nil, nil, true); end, -- Battle for Gilneas Perfection
    function() t[5246] = a:New(5246, nil, nil, true); end, -- Battle for Gilneas Veteran
    function() t[5245] = a:New(5245, nil, nil, true); end, -- Battle for Gilneas Victory
    function() t[5231] = a:New(5231, f.Alliance, 5552, true); end, -- Double Jeopardy
    function() t[5230] = a:New(5230, nil, nil, true); end, -- Twin Peaks Mountaineer
    function() t[5229] = a:New(5229, f.Alliance, 5228, true); end, -- Drag a Maw
    function() t[5228] = a:New(5228, f.Horde, 5229, true); end, -- Wild Hammering
    function() t[5227] = a:New(5227, f.Horde, 5226, true); end, -- Cloud Nine
    function() t[5226] = a:New(5226, f.Alliance, 5227, true); end, -- Cloud Nine
    function() t[5223] = a:New(5223, nil, nil, true); end, -- Master of Twin Peaks
    function() t[5222] = a:New(5222, f.Horde, 5221, true); end, -- "Fire, Walk With Me"
    function() t[5221] = a:New(5221, f.Alliance, 5222, true); end, -- "Fire, Walk With Me"
    function() t[5220] = a:New(5220, f.Horde, 5219, true); end, -- I'm in the Black Lodge
    function() t[5219] = a:New(5219, f.Alliance, 5220, true); end, -- I'm in the White Lodge
    function() t[5216] = a:New(5216, nil, nil, true); end, -- Peak Speed
    function() t[5215] = a:New(5215, nil, nil, true); end, -- Twin Peaks Perfection
    function() t[5214] = a:New(5214, f.Horde, 5213, true); end, -- Soaring Spirits
    function() t[5213] = a:New(5213, f.Alliance, 5214, true); end, -- Soaring Spirits
    function() t[5211] = a:New(5211, nil, nil, true); end, -- Top Defender
    function() t[5210] = a:New(5210, nil, nil, true); end, -- Two-Timer
    function() t[5209] = a:New(5209, nil, nil, true); end, -- Twin Peaks Veteran
    function() t[5208] = a:New(5208, nil, nil, true); end, -- Twin Peaking
    function() t[5193] = a:New(5193); end, -- Blue Streak
    function() t[5192] = a:New(5192); end, -- The Harder they Fall
    function() t[5191] = a:New(5191); end, -- Tragedy in Three Acts
    function() t[5180] = a:New(5180); end, -- Breaking the Sound Barrier
    function() t[5123] = a:New(5123); end, -- Heroic: Al'Akir
    function() t[5122] = a:New(5122); end, -- Heroic: Conclave of Wind
    function() t[5121] = a:New(5121); end, -- Heroic: Sinestra
    function() t[5120] = a:New(5120); end, -- Heroic: Cho'gall
    function() t[5119] = a:New(5119); end, -- Heroic: Ascendant Council
    function() t[5118] = a:New(5118); end, -- Heroic: Halfus Wyrmbreaker
    function() t[5117] = a:New(5117); end, -- Heroic: Valiona and Theralion
    function() t[5116] = a:New(5116); end, -- Heroic: Nefarian
    function() t[5115] = a:New(5115); end, -- Heroic: Chimaeron
    function() t[5109] = a:New(5109); end, -- Heroic: Atramedes
    function() t[5108] = a:New(5108); end, -- Heroic: Maloriak
    function() t[5107] = a:New(5107); end, -- Heroic: Omnotron Defense System
    function() t[5094] = a:New(5094); end, -- Heroic: Magmaw
    function() t[5093] = a:New(5093); end, -- Heroic: Shadowfang Keep
    function() t[5083] = a:New(5083); end, -- Heroic: Deadmines
    function() t[5066] = a:New(5066); end, -- Heroic: Lost City of the Tol'vir
    function() t[5065] = a:New(5065); end, -- Heroic: Halls of Origination
    function() t[5064] = a:New(5064); end, -- Heroic: The Vortex Pinnacle
    function() t[5063] = a:New(5063); end, -- Heroic: The Stonecore
    function() t[5062] = a:New(5062); end, -- Heroic: Grim Batol
    function() t[5061] = a:New(5061); end, -- Heroic: Throne of the Tides
    function() t[5060] = a:New(5060); end, -- Heroic: Blackrock Caverns
    function() O(t[5008], "Once"); end,
    function() t[5008] = a:New(5008, nil, nil, nil, true); end, -- Realm First! Level 85 Rogue
    function() O(t[5007], "Once"); end,
    function() t[5007] = a:New(5007, nil, nil, nil, true); end, -- Realm First! Level 85 Warrior
    function() O(t[5006], "Once"); end,
    function() t[5006] = a:New(5006, nil, nil, nil, true); end, -- Realm First! Level 85 Mage
    function() O(t[5005], "Once"); end,
    function() t[5005] = a:New(5005, nil, nil, nil, true); end, -- Realm First! Level 85 Death Knight
    function() O(t[5004], "Once"); end,
    function() t[5004] = a:New(5004, nil, nil, nil, true); end, -- Realm First! Level 85 Hunter
    function() O(t[5003], "Once"); end,
    function() t[5003] = a:New(5003, nil, nil, nil, true); end, -- Realm First! Level 85 Warlock
    function() O(t[5002], "Once"); end,
    function() t[5002] = a:New(5002, nil, nil, nil, true); end, -- Realm First! Level 85 Priest
    function() O(t[5001], "Once"); end,
    function() t[5001] = a:New(5001, nil, nil, nil, true); end, -- Realm First! Level 85 Paladin
    function() O(t[5000], "Once"); end,
    function() t[5000] = a:New(5000, nil, nil, nil, true); end, -- Realm First! Level 85 Druid
    function() O(t[4999], "Once"); end,
    function() t[4999] = a:New(4999, nil, nil, nil, true); end, -- Realm First! Level 85
    function() O(t[4998], "Once"); end,
    function() t[4998] = a:New(4998, nil, nil, nil, true); end, -- Realm First! Level 85 Shaman
    function() t[4996] = a:New(4996); end, -- Explore Southern Barrens
    function() t[4995] = a:New(4995); end, -- Explore the Cape of Stranglethorn
    function() t[4982] = a:New(4982, f.Horde, 4869); end, -- Sinking into Vashj'ir
    function() t[4981] = a:New(4981, f.Horde, 4937); end, -- Southern Barrens Quests
    function() t[4980] = a:New(4980, f.Horde, 4936); end, -- Stonetalon Mountains Quests
    function() t[4979] = a:New(4979, f.Horde, 4932); end, -- Feralas Quests
    function() t[4978] = a:New(4978, f.Horde, 4929); end, -- Dustwallow Marsh Quests
    function() t[4976] = a:New(4976, f.Horde, 4925); end, -- Ashenvale Quests
    function() t[4975] = a:New(4975); end, -- From Hell's Heart I Stab at Thee
    function() t[4961] = a:New(4961); end, -- In a Thousand Years Even You Might be Worth Something
    function() t[4960] = a:New(4960); end, -- Round Three. Fight!
    function() t[4959] = a:New(4959); end, -- Beware of the 'Unbeatable?' Pterodactyl
    function() t[4958] = a:New(4958); end, -- The First Rule of Ring of Blood is You Don't Talk About Ring of Blood
    function() t[4957] = a:New(4957); end, -- 20 Dungeon Quests Completed
    function() t[4956] = a:New(4956); end, -- 5 Dungeon Quests Completed
    function() t[4940] = a:New(4940); end, -- Winterspring Quests
    function() t[4939] = a:New(4939); end, -- Un'Goro Crater Quests
    function() t[4938] = a:New(4938); end, -- Thousand Needles Quests
    function() t[4937] = a:New(4937, f.Alliance, 4981); end, -- Southern Barrens Quests
    function() t[4936] = a:New(4936, f.Alliance, 4980); end, -- Stonetalon Mountains Quests
    function() t[4935] = a:New(4935); end, -- Tanaris Quests
    function() t[4934] = a:New(4934); end, -- Silithus Quests
    function() t[4933] = a:New(4933, f.Horde, 4926); end, -- Northern Barrens Quests
    function() t[4932] = a:New(4932, f.Alliance, 4979); end, -- Feralas Quests
    function() t[4931] = a:New(4931); end, -- Felwood Quests
    function() t[4930] = a:New(4930); end, -- Desolace Quests
    function() t[4929] = a:New(4929, f.Alliance, 4978); end, -- Dustwallow Marsh Quests
    function() t[4928] = a:New(4928, f.Alliance, 4927); end, -- Darkshore Quests
    function() t[4927] = a:New(4927, f.Horde, 4928); end, -- Azshara Quests
    function() t[4926] = a:New(4926, f.Alliance, 4933); end, -- Bloodmyst Isle Quests
    function() t[4925] = a:New(4925, f.Alliance, 4976); end, -- Ashenvale Quests
    function() t[4924] = a:New(4924); end, -- Professional Cataclysmic Master
    function() t[4923] = a:New(4923); end, -- Illustrious Grand Master Archaeologist
    function() t[4922] = a:New(4922); end, -- Grand Master Archaeologist
    function() t[4921] = a:New(4921); end, -- Master Archaeologist
    function() t[4920] = a:New(4920); end, -- Artisan Archaeologist
    function() t[4919] = a:New(4919); end, -- Expert Archaeologist
    function() O(t[4918], "From", "Version", "040003a", "Before", "Version", "080001"); end,
    function() t[4918] = a:New(4918); end, -- Illustrious Grand Master Medic
    function() t[4917] = a:New(4917); end, -- Cataclysmic Fisherman
    function() t[4916] = a:New(4916); end, -- Cataclysmic Cook
    function() O(t[4915], "From", "Version", "040003a", "Before", "Version", "080001"); end,
    function() t[4915] = a:New(4915); end, -- More Skills to Pay the Bills
    function() t[4914] = a:New(4914); end, -- Working In the Heat
    function() t[4910] = a:New(4910); end, -- Searing Gorge Quests
    function() t[4909] = a:New(4909); end, -- Blasted Lands Quests
    function() t[4908] = a:New(4908, f.Horde, 12456); end, -- Ghostlands Quests
    function() t[4906] = a:New(4906); end, -- Northern Stranglethorn Quests
    function() t[4905] = a:New(4905); end, -- Cape of Stranglethorn Quests
    function() t[4904] = a:New(4904); end, -- Swamp of Sorrows Quests
    function() t[4903] = a:New(4903, f.Alliance); end, -- Westfall Quests
    function() t[4902] = a:New(4902, f.Alliance, 4895); end, -- Redridge Mountains Quests
    function() t[4901] = a:New(4901); end, -- Burning Steppes Quests
    function() t[4900] = a:New(4900); end, -- Badlands Quests
    function() t[4899] = a:New(4899, f.Alliance); end, -- Loch Modan Quests
    function() t[4897] = a:New(4897); end, -- Hinterlands Quests
    function() t[4896] = a:New(4896); end, -- Arathi Highlands Quests
    function() t[4895] = a:New(4895, f.Horde, 4902); end, -- Hillsbrad Foothills Quests
    function() t[4894] = a:New(4894, f.Horde, 12455); end, -- Silverpine Forest Quests
    function() t[4893] = a:New(4893); end, -- Western Plaguelands Quests
    function() t[4892] = a:New(4892); end, -- Eastern Plaguelands Quests
    function() t[4888] = a:New(4888); end, -- One Hump or Two?
    function() O(t[4887]); end,
    function() t[4887] = a:New(4887); end, -- Tripping the Rifts
    function() t[4886] = a:New(4886, f.Horde, 4885); end, -- Dragonmaw Clan
    function() t[4885] = a:New(4885, f.Alliance, 4886); end, -- Wildhammer Clan
    function() t[4884] = a:New(4884); end, -- Ramkahen
    function() t[4883] = a:New(4883); end, -- Therazane
    function() t[4882] = a:New(4882); end, -- The Guardians of Hyjal
    function() t[4881] = a:New(4881); end, -- The Earthen Ring
    function() t[4875] = a:New(4875); end, -- Loremaster of Cataclysm
    function() t[4874] = a:New(4874); end, -- Breaking Out of Tol Barad
    function() t[4873] = a:New(4873, f.Alliance, 5501); end, -- Fading into Twilight
    function() t[4872] = a:New(4872); end, -- Unearthing Uldum
    function() t[4871] = a:New(4871); end, -- Deep into Deepholm
    function() t[4870] = a:New(4870); end, -- Coming Down the Mountain
    function() t[4869] = a:New(4869, f.Alliance, 4982); end, -- Sinking into Vashj'ir
    function() t[4868] = a:New(4868); end, -- Cataclysm Explorer
    function() t[4866] = a:New(4866); end, -- Explore Twilight Highlands
    function() t[4865] = a:New(4865); end, -- Explore Uldum
    function() t[4864] = a:New(4864); end, -- Explore Deepholm
    function() t[4863] = a:New(4863); end, -- Explore Hyjal
    function() t[4859] = a:New(4859); end, -- Kings Under the Mountain
    function() t[4858] = a:New(4858); end, -- Seven Scepters
    function() t[4857] = a:New(4857); end, -- Journeyman Archaeologist
    function() t[4856] = a:New(4856); end, -- It Belongs in a Museum!
    function() t[4855] = a:New(4855); end, -- What was Briefly Yours is Now Mine
    function() t[4854] = a:New(4854); end, -- I Had It in My Hand
    function() t[4853] = a:New(4853); end, -- Glory of the Cataclysm Raider
    function() t[4852] = a:New(4852); end, -- Double Dragon
    function() t[4851] = a:New(4851); end, -- Throne of the Four Winds
    function() t[4850] = a:New(4850); end, -- The Bastion of Twilight
    function() t[4849] = a:New(4849); end, -- Keeping it in the Family
    function() t[4848] = a:New(4848); end, -- Lost City of the Tol'vir
    function() t[4847] = a:New(4847); end, -- The Vortex Pinnacle
    function() t[4846] = a:New(4846); end, -- The Stonecore
    function() t[4845] = a:New(4845); end, -- Glory of the Cataclysm Hero
    function() t[4844] = a:New(4844); end, -- Cataclysm Dungeon Hero
    function() t[4842] = a:New(4842); end, -- Blackwing Descent
    function() t[4841] = a:New(4841); end, -- Halls of Origination
    function() t[4840] = a:New(4840); end, -- Grim Batol
    function() t[4839] = a:New(4839); end, -- Throne of the Tides
    function() t[4833] = a:New(4833); end, -- Blackrock Caverns
    function() O(t[4832]); end,
    function() t[4832] = a:New(4832); end, -- Friends In Even Higher Places
    function() t[4827] = a:New(4827); end, -- Surveying the Damage
    function() O(t[4826], "From", "Version", "040003a", "Before", "Version", "090001"); end,
    function() t[4826] = a:New(4826); end, -- Level 85 (Legacy)
    function() t[4825] = a:New(4825); end, -- Explore Vashj'ir
    function() t[4824] = a:New(4824); end, -- Collector's Edition: Mini Thor
    function() t[4818] = a:New(4818); end, -- Heroic: The Twilight Destroyer (10 player)
    function() t[4817] = a:New(4817); end, -- The Twilight Destroyer (10 player)
    function() t[4816] = a:New(4816); end, -- Heroic: The Twilight Destroyer (25 player)
    function() t[4815] = a:New(4815); end, -- The Twilight Destroyer (25 player)
    function() O(t[4790], "From", "Version", "030305a", "Before", "Version", "040001"); end,
    function() t[4790] = a:New(4790, f.Horde); end, -- Zalazane's Fall
    function() O(t[4786], "From", "Version", "030305a", "Before", "Version", "040001"); end,
    function() t[4786] = a:New(4786, f.Alliance); end, -- Operation: Gnomeregan
    function() O(t[4782]); end,
    function() t[4782] = a:New(4782); end, -- Green Brewfest Stein
    function() t[4637] = a:New(4637); end, -- Heroic: Fall of the Lich King (25 player)
    function() t[4636] = a:New(4636); end, -- Heroic: Fall of the Lich King (10 player)
    function() t[4635] = a:New(4635); end, -- Heroic: The Frostwing Halls (25 player)
    function() t[4634] = a:New(4634); end, -- Heroic: The Crimson Hall (25 player)
    function() t[4633] = a:New(4633); end, -- Heroic: The Plagueworks (25 player)
    function() t[4632] = a:New(4632); end, -- Heroic: Storming the Citadel (25 player)
    function() t[4631] = a:New(4631); end, -- Heroic: The Frostwing Halls (10 player)
    function() t[4630] = a:New(4630); end, -- Heroic: The Crimson Hall (10 player)
    function() t[4629] = a:New(4629); end, -- Heroic: The Plagueworks (10 player)
    function() t[4628] = a:New(4628); end, -- Heroic: Storming the Citadel (10 player)
    function() t[4627] = a:New(4627); end, -- X-45 Heartbreaker
    function() t[4626] = a:New(4626); end, -- And I'll Form the Head!
    function() t[4625] = a:New(4625); end, -- Invincible's Reins
    function() t[4624] = a:New(4624); end, -- Tough Love
    function() t[4623] = a:New(4623); end, -- Shadowmourne
    function() t[4622] = a:New(4622); end, -- Neck-Deep in Vile (25 player)
    function() t[4621] = a:New(4621); end, -- Been Waiting a Long Time for This (25 player)
    function() t[4620] = a:New(4620); end, -- All You Can Eat (25 player)
    function() t[4619] = a:New(4619); end, -- Portal Jockey (25 player)
    function() t[4618] = a:New(4618); end, -- "Once Bitten, Twice Shy (25 player)"
    function() t[4617] = a:New(4617); end, -- The Orb Whisperer (25 player)
    function() t[4616] = a:New(4616); end, -- "Nausea, Heartburn, Indigestion... (25 player)"
    function() t[4615] = a:New(4615); end, -- Flu Shot Shortage (25 player)
    function() t[4614] = a:New(4614); end, -- Dances with Oozes (25 player)
    function() t[4613] = a:New(4613); end, -- I've Gone and Made a Mess (25 player)
    function() t[4612] = a:New(4612); end, -- I'm on a Boat (25 player)
    function() t[4611] = a:New(4611); end, -- Full House (25 player)
    function() t[4610] = a:New(4610); end, -- Boned (25 player)
    function() t[4608] = a:New(4608); end, -- Fall of the Lich King (25 player)
    function() t[4607] = a:New(4607); end, -- The Frostwing Halls (25 player)
    function() t[4606] = a:New(4606); end, -- The Crimson Hall (25 player)
    function() t[4605] = a:New(4605); end, -- The Plagueworks (25 player)
    function() t[4604] = a:New(4604); end, -- Storming the Citadel (25 player)
    function() t[4603] = a:New(4603); end, -- Glory of the Icecrown Raider (25 player)
    function() t[4602] = a:New(4602); end, -- Glory of the Icecrown Raider (10 player)
    function() t[4601] = a:New(4601); end, -- Been Waiting a Long Time for This (10 player)
    function() O(t[4600], "From", "PvP Season", 8, "Until", "PvP Season", 8); end,
    function() t[4600] = a:New(4600, nil, nil, true); end, -- Wrathful Gladiator's Frost Wyrm
    function() O(t[4599], "From", "PvP Season", 8, "Until", "PvP Season", 8); end,
    function() t[4599] = a:New(4599, nil, nil, true); end, -- Wrathful Gladiator
    function() t[4598] = a:New(4598); end, -- The Ashen Verdict
    function() t[4597] = a:New(4597); end, -- The Frozen Throne (25 player)
    function() t[4596] = a:New(4596); end, -- The Sword in the Skull
    function() t[4586] = a:New(4586); end, -- Toravon the Ice Watcher (25 player)
    function() t[4585] = a:New(4585); end, -- Toravon the Ice Watcher (10 player)
    function() t[4584] = a:New(4584); end, -- The Light of Dawn
    function() t[4583] = a:New(4583); end, -- Bane of the Fallen King
    function() t[4582] = a:New(4582); end, -- The Orb Whisperer (10 player)
    function() t[4581] = a:New(4581); end, -- Neck-Deep in Vile (10 player)
    function() t[4580] = a:New(4580); end, -- All You Can Eat (10 player)
    function() t[4579] = a:New(4579); end, -- Portal Jockey (10 player)
    function() t[4578] = a:New(4578); end, -- "Nausea, Heartburn, Indigestion... (10 player)"
    function() t[4577] = a:New(4577); end, -- Flu Shot Shortage (10 player)
    function() O(t[4576], "Once"); end,
    function() t[4576] = a:New(4576, nil, nil, nil, true); end, -- Realm First! Fall of the Lich King
    function() t[4539] = a:New(4539); end, -- "Once Bitten, Twice Shy (10 player)"
    function() t[4538] = a:New(4538); end, -- Dances with Oozes (10 player)
    function() t[4537] = a:New(4537); end, -- I've Gone and Made a Mess (10 player)
    function() t[4536] = a:New(4536); end, -- I'm on a Boat (10 player)
    function() t[4535] = a:New(4535); end, -- Full House (10 player)
    function() t[4534] = a:New(4534); end, -- Boned (10 player)
    function() t[4532] = a:New(4532); end, -- Fall of the Lich King (10 player)
    function() t[4531] = a:New(4531); end, -- Storming the Citadel (10 player)
    function() t[4530] = a:New(4530); end, -- The Frozen Throne (10 player)
    function() t[4529] = a:New(4529); end, -- The Crimson Hall (10 player)
    function() t[4528] = a:New(4528); end, -- The Plagueworks (10 player)
    function() t[4527] = a:New(4527); end, -- The Frostwing Halls (10 player)
    function() t[4526] = a:New(4526); end, -- We're Not Retreating; We're Advancing in a Different Direction.
    function() t[4525] = a:New(4525); end, -- Don't Look Up
    function() t[4524] = a:New(4524); end, -- Doesn't Go to Eleven
    function() t[4523] = a:New(4523); end, -- Three Faced
    function() t[4522] = a:New(4522); end, -- Soul Power
    function() t[4521] = a:New(4521); end, -- Heroic: The Halls of Reflection
    function() t[4520] = a:New(4520); end, -- Heroic: The Pit of Saron
    function() t[4519] = a:New(4519); end, -- Heroic: The Forge of Souls
    function() t[4518] = a:New(4518); end, -- The Halls of Reflection
    function() t[4517] = a:New(4517); end, -- The Pit of Saron
    function() t[4516] = a:New(4516); end, -- The Forge of Souls
    function() t[4496] = a:New(4496); end, -- It's Over Nine Thousand!
    function() t[4478] = a:New(4478); end, -- Looking For Multitudes
    function() t[4477] = a:New(4477); end, -- Looking For Many
    function() t[4476] = a:New(4476); end, -- Looking For More
    function() t[4437] = a:New(4437, f.Horde, 4436); end, -- BB King
    function() t[4436] = a:New(4436, f.Alliance, 4437); end, -- BB King
    function() t[4407] = a:New(4407); end, -- She Deep Breaths More (25 player)
    function() t[4406] = a:New(4406); end, -- Many Whelps! Handle It! (25 player)
    function() t[4405] = a:New(4405); end, -- More Dots! (25 player)
    function() t[4404] = a:New(4404); end, -- She Deep Breaths More (10 player)
    function() t[4403] = a:New(4403); end, -- Many Whelps! Handle It! (10 player)
    function() t[4402] = a:New(4402); end, -- More Dots! (10 player)
    function() O(t[4400]); end,
    function() t[4400] = a:New(4400); end, -- WoW's 5th Anniversary
    function() t[4397] = a:New(4397); end, -- Onyxia's Lair (25 player)
    function() t[4396] = a:New(4396); end, -- Onyxia's Lair (10 player)
    function() O(t[4316], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[4316] = a:New(4316); end, -- 2500 Dungeon & Raid Emblems
    function() t[4298] = a:New(4298, f.Alliance, 4297); end, -- Heroic: Trial of the Champion
    function() t[4297] = a:New(4297, f.Horde, 4298); end, -- Heroic: Trial of the Champion
    function() t[4296] = a:New(4296, f.Alliance, 3778); end, -- Trial of the Champion
    function() t[4256] = a:New(4256, f.Horde, 3856, true); end, -- Demolition Derby
    function() t[4177] = a:New(4177, f.Horde, 3851, true); end, -- Mine
    function() t[4176] = a:New(4176, f.Horde, 3846, true); end, -- Resource Glut
    function() O(t[4156], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[4156] = a:New(4156, f.Alliance, 4079); end, -- A Tribute to Immortality
    function() O(t[4080], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[4080] = a:New(4080); end, -- A Tribute to Dedicated Insanity
    function() O(t[4079], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[4079] = a:New(4079, f.Horde, 4156); end, -- A Tribute to Immortality
    function() O(t[4078], "Once"); end,
    function() t[4078] = a:New(4078, nil, nil, nil, true); end, -- Realm First! Grand Crusader
    function() t[4017] = a:New(4017); end, -- "Earth, Wind & Fire (25 player)"
    function() t[4016] = a:New(4016); end, -- "Earth, Wind & Fire (10 player)"
    function() t[3997] = a:New(3997); end, -- Three Sixty Pain Spike (25 player)
    function() t[3996] = a:New(3996); end, -- Three Sixty Pain Spike (10 player)
    function() t[3957] = a:New(3957, f.Horde, 3857, true); end, -- Master of Isle of Conquest
    function() t[3937] = a:New(3937); end, -- "Not One, But Two Jormungars (25 player)"
    function() t[3936] = a:New(3936); end, -- "Not One, But Two Jormungars (10 player)"
    function() t[3918] = a:New(3918); end, -- Call of the Grand Crusade (10 player)
    function() t[3917] = a:New(3917); end, -- Call of the Crusade (10 player)
    function() t[3916] = a:New(3916); end, -- Call of the Crusade (25 player)
    function() O(t[3896], "Never"); end,
    function() t[3896] = a:New(3896); end, -- Onyx Panther
    function() t[3857] = a:New(3857, f.Alliance, 3957, true); end, -- Master of Isle of Conquest
    function() t[3856] = a:New(3856, f.Alliance, 4256, true); end, -- Demolition Derby
    function() t[3855] = a:New(3855, nil, nil, true); end, -- Glaive Grave
    function() t[3854] = a:New(3854, nil, nil, true); end, -- Back Door Job
    function() t[3853] = a:New(3853, nil, nil, true); end, -- All Over the Isle
    function() t[3852] = a:New(3852, nil, nil, true); end, -- Cut the Blue Wire... No the Red Wire!
    function() t[3851] = a:New(3851, f.Alliance, 4177, true); end, -- Mine
    function() t[3850] = a:New(3850, nil, nil, true); end, -- Mowed Down
    function() t[3849] = a:New(3849, nil, nil, true); end, -- A-bomb-ination
    function() t[3848] = a:New(3848, nil, nil, true); end, -- A-bomb-inable
    function() t[3847] = a:New(3847, nil, nil, true); end, -- Four Car Garage
    function() t[3846] = a:New(3846, f.Alliance, 4176, true); end, -- Resource Glut
    function() t[3845] = a:New(3845, nil, nil, true); end, -- Isle of Conquest All-Star
    function() O(t[3844], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3844] = a:New(3844); end, -- 1000 Dungeon & Raid Emblems
    function() t[3837] = a:New(3837); end, -- Koralon the Flame Watcher (25 player)
    function() t[3836] = a:New(3836); end, -- Koralon the Flame Watcher (10 player)
    function() O(t[3819], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3819] = a:New(3819); end, -- A Tribute to Insanity (25 player)
    function() O(t[3818], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3818] = a:New(3818); end, -- A Tribute to Mad Skill (25 player)
    function() O(t[3817], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3817] = a:New(3817); end, -- A Tribute to Skill (25 player)
    function() t[3816] = a:New(3816); end, -- The Traitor King (25 player)
    function() t[3815] = a:New(3815); end, -- Salt and Pepper (25 player)
    function() t[3813] = a:New(3813); end, -- Upper Back Pain (25 player)
    function() t[3812] = a:New(3812); end, -- Call of the Grand Crusade (25 player)
    function() O(t[3810], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3810] = a:New(3810); end, -- A Tribute to Insanity (10 player)
    function() O(t[3809], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3809] = a:New(3809); end, -- A Tribute to Mad Skill (10 player)
    function() O(t[3808], "From", "Version", "030200", "Before", "Version", "040003a"); end,
    function() t[3808] = a:New(3808); end, -- A Tribute to Skill (10 player)
    function() t[3804] = a:New(3804); end, -- I've Had Worse
    function() t[3803] = a:New(3803); end, -- The Faceroller
    function() t[3802] = a:New(3802); end, -- Argent Confessor
    function() t[3800] = a:New(3800); end, -- The Traitor King (10 player)
    function() t[3799] = a:New(3799); end, -- Salt and Pepper (10 player)
    function() t[3798] = a:New(3798); end, -- Resilience Will Fix It (10 player)
    function() t[3797] = a:New(3797); end, -- Upper Back Pain (10 player)
    function() t[3778] = a:New(3778, f.Horde, 4296); end, -- Trial of the Champion
    function() t[3777] = a:New(3777, nil, nil, true); end, -- Isle of Conquest Veteran
    function() t[3776] = a:New(3776, nil, nil, true); end, -- Isle of Conquest Victory
    function() O(t[3758], "From", "PvP Season", 7, "Until", "PvP Season", 7); end,
    function() t[3758] = a:New(3758, nil, nil, true); end, -- Relentless Gladiator
    function() O(t[3757], "From", "PvP Season", 7, "Until", "PvP Season", 7); end,
    function() t[3757] = a:New(3757, nil, nil, true); end, -- Relentless Gladiator's Frost Wyrm
    function() O(t[3756], "From", "PvP Season", 6, "Until", "PvP Season", 6); end,
    function() t[3756] = a:New(3756, nil, nil, true); end, -- Furious Gladiator's Frost Wyrm
    function() t[3736] = a:New(3736); end, -- Pony Up!
    function() t[3677] = a:New(3677, f.Horde, 3676); end, -- The Sunreavers
    function() t[3676] = a:New(3676, f.Alliance, 3677); end, -- A Silver Confidant
    function() O(t[3636], "Never"); end,
    function() t[3636] = a:New(3636); end, -- Jade Tiger
    function() O(t[3618], "Never"); end,
    function() t[3618] = a:New(3618, nil, nil, true); end, -- Murkimus the Gladiator
    function() t[3597] = a:New(3597, f.Horde, 3596); end, -- Pilgrim's Progress
    function() t[3596] = a:New(3596, f.Alliance, 3597); end, -- Pilgrim's Progress
    function() t[3582] = a:New(3582); end, -- Terokkar Turkey Time
    function() t[3581] = a:New(3581, f.Horde, 3580); end, -- Pilgrim's Peril
    function() t[3580] = a:New(3580, f.Alliance, 3581); end, -- Pilgrim's Peril
    function() t[3579] = a:New(3579); end, -- """FOOD FIGHT!"""
    function() t[3578] = a:New(3578); end, -- The Turkinator
    function() t[3577] = a:New(3577, f.Horde, 3576); end, -- Now We're Cookin'
    function() t[3576] = a:New(3576, f.Alliance, 3577); end, -- Now We're Cookin'
    function() t[3559] = a:New(3559); end, -- Turkey Lurkey
    function() t[3558] = a:New(3558); end, -- Sharing is Caring
    function() t[3557] = a:New(3557, f.Horde, 3556); end, -- Pilgrim's Paunch
    function() t[3556] = a:New(3556, f.Alliance, 3557); end, -- Pilgrim's Paunch
    function() t[3536] = a:New(3536); end, -- The Marine Marine
    function() t[3496] = a:New(3496); end, -- A Brew-FAST Mount
    function() t[3478] = a:New(3478); end, -- Pilgrim
    function() t[3457] = a:New(3457); end, -- The Captain's Booty
    function() t[3456] = a:New(3456); end, -- Dead Man's Party
    function() O(t[3436], "From", "PvP Season", 6, "Until", "PvP Season", 6); end,
    function() t[3436] = a:New(3436, nil, nil, true); end, -- Furious Gladiator
    function() t[3357] = a:New(3357, f.Horde, 3356); end, -- Venomhide Ravasaur
    function() t[3356] = a:New(3356, f.Alliance, 3357); end, -- Winterspring Frostsaber
    function() O(t[3336], "From", "PvP Season", 5, "Until", "PvP Season", 5); end,
    function() t[3336] = a:New(3336, nil, nil, true); end, -- Deadly Gladiator
    function() t[3316] = a:New(3316); end, -- Herald of the Titans
    function() t[3296] = a:New(3296); end, -- Cooking with Style
    function() O(t[3259], "Once"); end,
    function() t[3259] = a:New(3259, nil, nil, nil, true); end, -- Realm First! Celestial Defender
    function() O(t[3237], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3237] = a:New(3237); end, -- Set Up Us the Bomb (25 player)
    function() t[3218] = a:New(3218); end, -- Turtles All the Way Down
    function() t[3217] = a:New(3217); end, -- Chasing Marcia
    function() O(t[3189], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3189] = a:New(3189); end, -- Firefighter (25 player)
    function() O(t[3188], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3188] = a:New(3188); end, -- I Love the Smell of Saronite in the Morning (25 player)
    function() O(t[3187], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3187] = a:New(3187); end, -- "Knock, Knock, Knock on Wood (25 player)"
    function() O(t[3186], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3186] = a:New(3186); end, -- "Knock, Knock on Wood (25 player)"
    function() O(t[3185], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3185] = a:New(3185); end, -- Knock on Wood (25 player)
    function() O(t[3184], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3184] = a:New(3184); end, -- I Could Say That This Cache Was Rare (25 player)
    function() O(t[3183], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3183] = a:New(3183); end, -- Lose Your Illusion (25 player)
    function() O(t[3182], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3182] = a:New(3182); end, -- I Could Say That This Cache Was Rare (10 player)
    function() O(t[3181], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3181] = a:New(3181); end, -- I Love the Smell of Saronite in the Morning (10 player)
    function() O(t[3180], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3180] = a:New(3180); end, -- Firefighter (10 player)
    function() O(t[3179], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3179] = a:New(3179); end, -- "Knock, Knock, Knock on Wood (10 player)"
    function() O(t[3178], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3178] = a:New(3178); end, -- "Knock, Knock on Wood (10 player)"
    function() O(t[3177], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3177] = a:New(3177); end, -- Knock on Wood (10 player)
    function() O(t[3176], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3176] = a:New(3176); end, -- Lose Your Illusion (10 player)
    function() O(t[3164], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3164] = a:New(3164); end, -- Alone in the Darkness (25 player)
    function() O(t[3163], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3163] = a:New(3163); end, -- One Light in the Darkness (25 player)
    function() O(t[3162], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3162] = a:New(3162); end, -- Two Lights in the Darkness (25 player)
    function() O(t[3161], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3161] = a:New(3161); end, -- Three Lights in the Darkness (25 player)
    function() O(t[3159], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3159] = a:New(3159); end, -- Alone in the Darkness (10 player)
    function() O(t[3158], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3158] = a:New(3158); end, -- One Light in the Darkness (10 player)
    function() O(t[3157], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3157] = a:New(3157); end, -- Three Lights in the Darkness (10 player)
    function() t[3142] = a:New(3142); end, -- "Val'anyr, Hammer of Ancient Kings"
    function() O(t[3141], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3141] = a:New(3141); end, -- Two Lights in the Darkness (10 player)
    function() O(t[3138], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3138] = a:New(3138); end, -- Not-So-Friendly Fire (10 player)
    function() t[3137] = a:New(3137); end, -- Emalon the Storm Watcher (25 player)
    function() t[3136] = a:New(3136); end, -- Emalon the Storm Watcher (10 player)
    function() O(t[3118], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3118] = a:New(3118); end, -- Lumberjacked (25 player)
    function() O(t[3117], "Once"); end,
    function() t[3117] = a:New(3117, nil, nil, nil, true); end, -- Realm First! Death's Demise
    function() O(t[3098], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3098] = a:New(3098); end, -- Dwarfageddon (25 player)
    function() O(t[3097], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3097] = a:New(3097); end, -- Dwarfageddon (10 player)
    function() O(t[3096], "From", "PvP Season", 5, "Until", "PvP Season", 5); end,
    function() t[3096] = a:New(3096, nil, nil, true); end, -- Deadly Gladiator's Frost Wyrm
    function() O(t[3077], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3077] = a:New(3077); end, -- Nine Lives (25 player)
    function() O(t[3076], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3076] = a:New(3076); end, -- Nine Lives (10 player)
    function() O(t[3059], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3059] = a:New(3059); end, -- Heartbreaker (25 player)
    function() O(t[3058], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3058] = a:New(3058); end, -- Heartbreaker (10 player)
    function() O(t[3057], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3057] = a:New(3057); end, -- Orbit-uary (25 player)
    function() O(t[3056], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3056] = a:New(3056); end, -- Orbit-uary (10 player)
    function() O(t[3037], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3037] = a:New(3037); end, -- Observed (25 player)
    function() O(t[3036], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3036] = a:New(3036); end, -- Observed (10 player)
    function() O(t[3017], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3017] = a:New(3017); end, -- They're Coming Out of the Walls (25 player)
    function() O(t[3016], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3016] = a:New(3016); end, -- In His House He Waits Dreaming (25 player)
    function() O(t[3015], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3015] = a:New(3015); end, -- In His House He Waits Dreaming (10 player)
    function() O(t[3014], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3014] = a:New(3014); end, -- They're Coming Out of the Walls (10 player)
    function() O(t[3013], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3013] = a:New(3013); end, -- He's Not Getting Any Older (25 player)
    function() O(t[3012], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3012] = a:New(3012); end, -- He's Not Getting Any Older (10 player)
    function() O(t[3011], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3011] = a:New(3011); end, -- Kiss and Make Up (25 player)
    function() O(t[3010], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3010] = a:New(3010); end, -- Drive Me Crazy (25 player)
    function() O(t[3009], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3009] = a:New(3009); end, -- Kiss and Make Up (10 player)
    function() O(t[3008], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3008] = a:New(3008); end, -- Drive Me Crazy (10 player)
    function() O(t[3007], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3007] = a:New(3007); end, -- Crazy Cat Lady (25 player)
    function() O(t[3006], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3006] = a:New(3006); end, -- Crazy Cat Lady (10 player)
    function() O(t[3005], "From", "Version", "030100", "Before", "Version", "040003a"); end,
    function() t[3005] = a:New(3005); end, -- He Feeds On Your Tears (25 player)
    function() O(t[3004], "From", "Version", "030100", "Before", "Version", "040003a"); end,
    function() t[3004] = a:New(3004); end, -- He Feeds On Your Tears (10 player)
    function() O(t[3003], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3003] = a:New(3003); end, -- Supermassive (10 player)
    function() O(t[3002], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[3002] = a:New(3002); end, -- Supermassive (25 player)
    function() O(t[2997], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2997] = a:New(2997); end, -- Shadowdodger (25 player)
    function() O(t[2996], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2996] = a:New(2996); end, -- Shadowdodger (10 player)
    function() O(t[2995], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2995] = a:New(2995); end, -- Not-So-Friendly Fire (25 player)
    function() O(t[2989], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2989] = a:New(2989); end, -- Set Up Us the Bomb (10 player)
    function() O(t[2985], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2985] = a:New(2985); end, -- Deforestation (10 player)
    function() O(t[2984], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2984] = a:New(2984); end, -- Deforestation (25 player)
    function() O(t[2983], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2983] = a:New(2983); end, -- Getting Back to Nature (25 player)
    function() O(t[2982], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2982] = a:New(2982); end, -- Getting Back to Nature (10 player)
    function() O(t[2981], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2981] = a:New(2981); end, -- Con-speed-atory (25 player)
    function() O(t[2980], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2980] = a:New(2980); end, -- Con-speed-atory (10 player)
    function() O(t[2979], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2979] = a:New(2979); end, -- Lumberjacked (10 player)
    function() O(t[2978], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2978] = a:New(2978); end, -- Siffed (25 player)
    function() O(t[2977], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2977] = a:New(2977); end, -- Siffed (10 player)
    function() O(t[2976], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2976] = a:New(2976); end, -- Who Needs Bloodlust? (25 player)
    function() O(t[2975], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2975] = a:New(2975); end, -- Who Needs Bloodlust? (10 player)
    function() O(t[2974], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2974] = a:New(2974); end, -- I'll Take You All On (25 player)
    function() O(t[2973], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2973] = a:New(2973); end, -- I'll Take You All On (10 player)
    function() O(t[2972], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2972] = a:New(2972); end, -- Don't Stand in the Lightning (25 player)
    function() O(t[2971], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2971] = a:New(2971); end, -- Don't Stand in the Lightning (10 player)
    function() O(t[2970], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2970] = a:New(2970); end, -- Staying Buffed All Winter (25 player)
    function() O(t[2969], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2969] = a:New(2969); end, -- Staying Buffed All Winter (10 player)
    function() O(t[2968], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2968] = a:New(2968); end, -- Getting Cold in Here (25 player)
    function() O(t[2967], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2967] = a:New(2967); end, -- Getting Cold in Here (10 player)
    function() O(t[2965], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2965] = a:New(2965); end, -- I Have the Coolest Friends (25 player)
    function() O(t[2963], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2963] = a:New(2963); end, -- I Have the Coolest Friends (10 player)
    function() O(t[2962], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2962] = a:New(2962); end, -- Cheese the Freeze (25 player)
    function() O(t[2961], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2961] = a:New(2961); end, -- Cheese the Freeze (10 player)
    function() O(t[2960], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2960] = a:New(2960); end, -- Rubble and Roll (25 player)
    function() O(t[2959], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2959] = a:New(2959); end, -- Rubble and Roll (10 player)
    function() O(t[2958], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2958] = a:New(2958); end, -- Glory of the Ulduar Raider (25 player)
    function() O(t[2957], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2957] = a:New(2957); end, -- Glory of the Ulduar Raider (10 player)
    function() O(t[2956], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2956] = a:New(2956); end, -- If Looks Could Kill (25 player)
    function() O(t[2955], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2955] = a:New(2955); end, -- If Looks Could Kill (10 player)
    function() O(t[2954], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2954] = a:New(2954); end, -- Disarmed (25 player)
    function() O(t[2953], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2953] = a:New(2953); end, -- Disarmed (10 player)
    function() O(t[2952], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2952] = a:New(2952); end, -- With Open Arms (25 player)
    function() O(t[2951], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2951] = a:New(2951); end, -- With Open Arms (10 player)
    function() O(t[2948], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2948] = a:New(2948); end, -- Can't Do That While Stunned (25 player)
    function() O(t[2947], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2947] = a:New(2947); end, -- Can't Do That While Stunned (10 player)
    function() O(t[2946], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2946] = a:New(2946); end, -- But I'm On Your Side (25 player)
    function() O(t[2945], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2945] = a:New(2945); end, -- But I'm On Your Side (10 player)
    function() O(t[2944], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2944] = a:New(2944); end, -- "I Choose You, Steelbreaker (25 player)"
    function() O(t[2943], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2943] = a:New(2943); end, -- "I Choose You, Stormcaller Brundir (25 player)"
    function() O(t[2942], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2942] = a:New(2942); end, -- "I Choose You, Runemaster Molgeim (25 player)"
    function() O(t[2941], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2941] = a:New(2941); end, -- "I Choose You, Steelbreaker (10 player)"
    function() O(t[2940], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2940] = a:New(2940); end, -- "I Choose You, Stormcaller Brundir (10 player)"
    function() O(t[2939], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2939] = a:New(2939); end, -- "I Choose You, Runemaster Molgeim (10 player)"
    function() O(t[2938], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2938] = a:New(2938); end, -- Must Deconstruct Faster (25 player)
    function() O(t[2937], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2937] = a:New(2937); end, -- Must Deconstruct Faster (10 player)
    function() O(t[2936], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2936] = a:New(2936); end, -- Nerf Gravity Bombs (25 player)
    function() O(t[2935], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2935] = a:New(2935); end, -- Nerf Scrapbots (25 player)
    function() O(t[2934], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2934] = a:New(2934); end, -- Nerf Gravity Bombs (10 player)
    function() O(t[2933], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2933] = a:New(2933); end, -- Nerf Scrapbots (10 player)
    function() O(t[2932], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2932] = a:New(2932); end, -- Nerf Engineering (25 player)
    function() O(t[2931], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2931] = a:New(2931); end, -- Nerf Engineering (10 player)
    function() O(t[2930], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2930] = a:New(2930); end, -- Stokin' the Furnace (10 player)
    function() O(t[2929], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2929] = a:New(2929); end, -- Stokin' the Furnace (25 player)
    function() O(t[2928], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2928] = a:New(2928); end, -- Hot Pocket (25 player)
    function() O(t[2927], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2927] = a:New(2927); end, -- Hot Pocket (10 player)
    function() O(t[2926], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2926] = a:New(2926); end, -- Shattered (25 player)
    function() O(t[2925], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2925] = a:New(2925); end, -- Shattered (10 player)
    function() O(t[2924], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2924] = a:New(2924); end, -- "Iron Dwarf, Medium Rare (25 player)"
    function() O(t[2923], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2923] = a:New(2923); end, -- "Iron Dwarf, Medium Rare (10 player)"
    function() O(t[2921], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2921] = a:New(2921); end, -- A Quick Shave (25 player)
    function() O(t[2919], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2919] = a:New(2919); end, -- A Quick Shave (10 player)
    function() O(t[2918], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2918] = a:New(2918); end, -- Orbital Bombardment (25 player)
    function() O(t[2917], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2917] = a:New(2917); end, -- Nuked from Orbit (25 player)
    function() O(t[2916], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2916] = a:New(2916); end, -- Orbital Devastation (25 player)
    function() O(t[2915], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2915] = a:New(2915); end, -- Nuked from Orbit (10 player)
    function() O(t[2914], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2914] = a:New(2914); end, -- Orbital Devastation (10 player)
    function() O(t[2913], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2913] = a:New(2913); end, -- Orbital Bombardment (10 player)
    function() O(t[2912], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2912] = a:New(2912); end, -- Shutout (25 player)
    function() O(t[2911], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2911] = a:New(2911); end, -- Shutout (10 player)
    function() O(t[2910], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2910] = a:New(2910); end, -- Take Out Those Turrets (25 player)
    function() O(t[2909], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2909] = a:New(2909); end, -- Take Out Those Turrets (10 player)
    function() O(t[2908], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2908] = a:New(2908); end, -- Three Car Garage (25 player)
    function() O(t[2907], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2907] = a:New(2907); end, -- Three Car Garage (10 player)
    function() O(t[2906], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2906] = a:New(2906); end, -- Unbroken (25 player)
    function() O(t[2905], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2905] = a:New(2905); end, -- Unbroken (10 player)
    function() O(t[2904], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2904] = a:New(2904); end, -- Conqueror of Ulduar
    function() O(t[2903], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2903] = a:New(2903); end, -- Champion of Ulduar
    function() O(t[2895], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2895] = a:New(2895); end, -- The Secrets of Ulduar (25 player)
    function() O(t[2894], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2894] = a:New(2894); end, -- The Secrets of Ulduar (10 player)
    function() O(t[2893], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2893] = a:New(2893); end, -- The Descent into Madness (25 player)
    function() O(t[2892], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2892] = a:New(2892); end, -- The Descent into Madness (10 player)
    function() O(t[2891], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2891] = a:New(2891); end, -- The Keepers of Ulduar (25 player)
    function() O(t[2890], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2890] = a:New(2890); end, -- The Keepers of Ulduar (10 player)
    function() O(t[2889], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2889] = a:New(2889); end, -- The Antechamber of Ulduar (25 player)
    function() O(t[2888], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2888] = a:New(2888); end, -- The Antechamber of Ulduar (10 player)
    function() O(t[2887], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2887] = a:New(2887); end, -- The Siege of Ulduar (25 player)
    function() O(t[2886], "From", "Version", "030100", "Before", "Version", "070305"); end,
    function() t[2886] = a:New(2886); end, -- The Siege of Ulduar (10 player)
    function() t[2836] = a:New(2836); end, -- Lance a Lot
    function() t[2817] = a:New(2817, f.Alliance, 2816); end, -- Exalted Argent Champion of the Alliance
    function() t[2816] = a:New(2816, f.Horde, 2817); end, -- Exalted Argent Champion of the Horde
    function() t[2798] = a:New(2798); end, -- Noble Gardener
    function() t[2796] = a:New(2796); end, -- Brew of the Month
    function() t[2788] = a:New(2788, f.Horde, 2782); end, -- Champion of the Horde
    function() t[2787] = a:New(2787, f.Horde, 2777); end, -- Champion of the Undercity
    function() t[2786] = a:New(2786, f.Horde, 2779); end, -- Champion of Thunder Bluff
    function() t[2785] = a:New(2785, f.Horde, 2778); end, -- Champion of Silvermoon City
    function() t[2784] = a:New(2784, f.Horde, 2780); end, -- Champion of Sen'jin
    function() t[2783] = a:New(2783, f.Horde, 2781); end, -- Champion of Orgrimmar
    function() t[2782] = a:New(2782, f.Alliance, 2788); end, -- Champion of the Alliance
    function() t[2781] = a:New(2781, f.Alliance, 2783); end, -- Champion of Stormwind
    function() t[2780] = a:New(2780, f.Alliance, 2784); end, -- Champion of Ironforge
    function() t[2779] = a:New(2779, f.Alliance, 2786); end, -- Champion of Gnomeregan
    function() t[2778] = a:New(2778, f.Alliance, 2785); end, -- Champion of the Exodar
    function() t[2777] = a:New(2777, f.Alliance, 2787); end, -- Champion of Darnassus
    function() t[2773] = a:New(2773); end, -- It's Just a Flesh Wound
    function() t[2772] = a:New(2772); end, -- Tilted!
    function() t[2771] = a:New(2771, f.Horde, 2770); end, -- Exalted Champion of the Horde
    function() t[2770] = a:New(2770, f.Alliance, 2771); end, -- Exalted Champion of the Alliance
    function() t[2769] = a:New(2769, f.Horde, 2760); end, -- Exalted Champion of the Undercity
    function() t[2768] = a:New(2768, f.Horde, 2762); end, -- Exalted Champion of Thunder Bluff
    function() t[2767] = a:New(2767, f.Horde, 2761); end, -- Exalted Champion of Silvermoon City
    function() t[2766] = a:New(2766, f.Horde, 2763); end, -- Exalted Champion of Sen'jin
    function() t[2765] = a:New(2765, f.Horde, 2764); end, -- Exalted Champion of Orgrimmar
    function() t[2764] = a:New(2764, f.Alliance, 2765); end, -- Exalted Champion of Stormwind
    function() t[2763] = a:New(2763, f.Alliance, 2766); end, -- Exalted Champion of Ironforge
    function() t[2762] = a:New(2762, f.Alliance, 2768); end, -- Exalted Champion of Gnomeregan
    function() t[2761] = a:New(2761, f.Alliance, 2767); end, -- Exalted Champion of the Exodar
    function() t[2760] = a:New(2760, f.Alliance, 2769); end, -- Exalted Champion of Darnassus
    function() t[2758] = a:New(2758); end, -- Argent Valor
    function() t[2756] = a:New(2756); end, -- Argent Aspiration
    function() O(t[2716], "From", "Version", "030100", "Before", "Version", "070003"); end,
    function() t[2716] = a:New(2716); end, -- Dual Talent Specialization
    function() t[2676] = a:New(2676); end, -- I Found One!
    function() t[2576] = a:New(2576); end, -- Blushing Bride
    function() t[2557] = a:New(2557); end, -- To All The Squirrels Who Shared My Life
    function() t[2556] = a:New(2556); end, -- Pest Control
    function() t[2537] = a:New(2537, f.Horde, 2536); end, -- Mountain o' Mounts
    function() t[2536] = a:New(2536, f.Alliance, 2537); end, -- Mountain o' Mounts
    function() t[2516] = a:New(2516); end, -- Lil' Game Hunter
    function() t[2497] = a:New(2497, f.Horde, 2419); end, -- Spring Fling
    function() O(t[2496], "From", "Version", "030002", "Before", "Version", "030008"); end,
    function() t[2496] = a:New(2496); end, -- The Fifth Element
    function() t[2476] = a:New(2476, f.Horde, 1737, true); end, -- Destruction Derby
    function() O(t[2456], "From", "Version", "030002", "Until", "Version", "030002"); end,
    function() t[2456] = a:New(2456); end, -- Vampire Hunter
    function() t[2436] = a:New(2436); end, -- Desert Rose
    function() t[2422] = a:New(2422); end, -- Shake Your Bunny-Maker
    function() t[2421] = a:New(2421, f.Alliance, 2420); end, -- Noble Garden
    function() t[2420] = a:New(2420, f.Horde, 2421); end, -- Noble Garden
    function() t[2419] = a:New(2419, f.Alliance, 2497); end, -- Spring Fling
    function() t[2418] = a:New(2418); end, -- Chocoholic
    function() t[2417] = a:New(2417); end, -- Chocolate Lover
    function() t[2416] = a:New(2416); end, -- Hard Boiled
    function() O(t[2398]); end,
    function() t[2398] = a:New(2398); end, -- WoW's 4th Anniversary
    function() O(t[2359], "From", "Version", "020100", "Before", "Version", "040003a"); end,
    function() t[2359] = a:New(2359); end, -- Swift Flight Form
    function() O(t[2358], "From", "Version", "010400", "Before", "Version", "040003a"); end,
    function() t[2358] = a:New(2358); end, -- Charger
    function() O(t[2357], "From", "Version", "010400", "Before", "Version", "040003a"); end,
    function() t[2357] = a:New(2357); end, -- Dreadsteed of Xoroth
    function() t[2336] = a:New(2336); end, -- Insane in the Membrane
    function() O(t[2316], "From", "PvP Season", 4, "Until", "PvP Season", 4); end,
    function() t[2316] = a:New(2316, nil, nil, true); end, -- Brutal Nether Drake
    function() t[2257] = a:New(2257); end, -- Frostbitten
    function() t[2256] = a:New(2256); end, -- Northern Exposure
    function() O(t[2200], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2200] = a:New(2200, f.Horde, 1757, true); end, -- Defense of the Ancients
    function() t[2199] = a:New(2199, nil, nil, true); end, -- Wintergrasp Ranger
    function() O(t[2194], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2194] = a:New(2194, nil, nil, true); end, -- Master of Strand of the Ancients
    function() O(t[2193], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2193] = a:New(2193, nil, nil, true); end, -- Explosives Expert
    function() O(t[2192], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2192] = a:New(2192, f.Horde, 1762, true); end, -- Not Even a Scratch
    function() O(t[2191], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2191] = a:New(2191, nil, nil, true); end, -- Ancient Courtyard Protector
    function() O(t[2190], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2190] = a:New(2190, nil, nil, true); end, -- Drop It Now!
    function() O(t[2189], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[2189] = a:New(2189, nil, nil, true); end, -- Artillery Expert
    function() O(t[2188], "From", "Version", "030002", "Before", "Version", "060002"); end,
    function() t[2188] = a:New(2188); end, -- Leeeeeeeeeeeeeroy!
    function() O(t[2187], "From", "Version", "030003", "Before", "Version", "040003a"); end,
    function() t[2187] = a:New(2187); end, -- The Undying
    function() O(t[2186], "From", "Version", "030003", "Before", "Version", "040003a"); end,
    function() t[2186] = a:New(2186); end, -- The Immortal
    function() t[2185] = a:New(2185); end, -- Just Can't Get Enough (25 player)
    function() t[2184] = a:New(2184); end, -- Just Can't Get Enough (10 player)
    function() t[2183] = a:New(2183); end, -- Spore Loser (25 player)
    function() t[2182] = a:New(2182); end, -- Spore Loser (10 player)
    function() t[2181] = a:New(2181); end, -- Subtraction (25 player)
    function() t[2180] = a:New(2180); end, -- Subtraction (10 player)
    function() t[2179] = a:New(2179); end, -- Shocking! (25 player)
    function() t[2178] = a:New(2178); end, -- Shocking! (10 player)
    function() t[2177] = a:New(2177); end, -- And They Would All Go Down Together (25 player)
    function() t[2176] = a:New(2176); end, -- And They Would All Go Down Together (10 player)
    function() t[2157] = a:New(2157); end, -- King's Bane
    function() t[2156] = a:New(2156); end, -- My Girl Loves to Skadi All the Time
    function() t[2155] = a:New(2155); end, -- Abuse the Ooze
    function() t[2154] = a:New(2154); end, -- Brann Spankin' New
    function() t[2153] = a:New(2153); end, -- A Void Dance
    function() t[2152] = a:New(2152); end, -- Share The Love
    function() t[2151] = a:New(2151); end, -- Consumption Junction
    function() t[2150] = a:New(2150); end, -- Split Personality
    function() t[2149] = a:New(2149); end, -- Denyin' the Scion (25 player)
    function() t[2148] = a:New(2148); end, -- Denyin' the Scion (10 player)
    function() t[2147] = a:New(2147); end, -- The Hundred Club (25 player)
    function() t[2146] = a:New(2146); end, -- The Hundred Club (10 player)
    function() t[2144] = a:New(2144); end, -- "What a Long, Strange Trip It's Been"
    function() t[2143] = a:New(2143); end, -- Leading the Cavalry
    function() t[2142] = a:New(2142); end, -- Filling Up The Barn
    function() t[2141] = a:New(2141); end, -- Stable Keeper
    function() t[2140] = a:New(2140); end, -- Momma Said Knock You Out (25 player)
    function() t[2139] = a:New(2139); end, -- The Safety Dance (25 player)
    function() t[2138] = a:New(2138); end, -- Glory of the Raider (25 player)
    function() t[2137] = a:New(2137); end, -- Glory of the Raider (10 player)
    function() t[2136] = a:New(2136); end, -- Glory of the Hero
    function() O(t[2116]); end,
    function() t[2116] = a:New(2116); end, -- Tabard of the Argent Dawn
    function() t[2097] = a:New(2097); end, -- Get to the Choppa!
    function() t[2096] = a:New(2096); end, -- The Coin Master
    function() t[2095] = a:New(2095); end, -- Silver in the City
    function() t[2094] = a:New(2094); end, -- A Penny For Your Thoughts
    function() t[2093] = a:New(2093, nil, nil, true); end, -- Rival
    function() t[2092] = a:New(2092, nil, nil, true); end, -- Duelist
    function() t[2091] = a:New(2091, nil, nil, true); end, -- Gladiator
    function() t[2090] = a:New(2090, nil, nil, true); end, -- Challenger
    function() O(t[2089], "From", "Version", "030003", "Before", "Version", "040001"); end,
    function() t[2089] = a:New(2089, nil, nil, true); end, -- 1000 Stone Keeper's Shards
    function() O(t[2088], "From", "Version", "030003", "Before", "Version", "040001"); end,
    function() t[2088] = a:New(2088, nil, nil, true); end, -- 500 Stone Keeper's Shards
    function() O(t[2087], "From", "Version", "030003", "Before", "Version", "040001"); end,
    function() t[2087] = a:New(2087, nil, nil, true); end, -- 250 Stone Keeper's Shards
    function() O(t[2086], "From", "Version", "030003", "Before", "Version", "040001"); end,
    function() t[2086] = a:New(2086, nil, nil, true); end, -- 100 Stone Keeper's Shards
    function() O(t[2085], "From", "Version", "030003", "Before", "Version", "040001"); end,
    function() t[2085] = a:New(2085, nil, nil, true); end, -- 50 Stone Keeper's Shards
    function() t[2084] = a:New(2084); end, -- Ring of the Kirin Tor
    function() t[2083] = a:New(2083); end, -- Grand Ice Mammoth
    function() t[2082] = a:New(2082); end, -- Ice Mammoth
    function() t[2081] = a:New(2081); end, -- Grand Black War Mammoth
    function() t[2080] = a:New(2080, nil, nil, true); end, -- Black War Mammoth
    function() O(t[2079]); end,
    function() t[2079] = a:New(2079); end, -- Tabard of the Protector
    function() t[2078] = a:New(2078); end, -- Traveler's Tundra Mammoth
    function() t[2077] = a:New(2077); end, -- Wooly Mammoth
    function() t[2076] = a:New(2076); end, -- Armored Brown Bear
    function() t[2058] = a:New(2058); end, -- Snakes. Why'd It Have To Be Snakes?
    function() t[2057] = a:New(2057); end, -- Oh Novos!
    function() t[2056] = a:New(2056); end, -- Volunteer Work
    function() t[2054] = a:New(2054); end, -- The Twilight Zone (25 player)
    function() t[2053] = a:New(2053); end, -- Twilight Duo (25 player)
    function() t[2052] = a:New(2052); end, -- Twilight Assist (25 player)
    function() t[2051] = a:New(2051); end, -- The Twilight Zone (10 player)
    function() t[2050] = a:New(2050); end, -- Twilight Duo (10 player)
    function() t[2049] = a:New(2049); end, -- Twilight Assist (10 player)
    function() t[2048] = a:New(2048); end, -- Gonna Go When the Volcano Blows (25 player)
    function() t[2047] = a:New(2047); end, -- Gonna Go When the Volcano Blows (10 player)
    function() t[2046] = a:New(2046); end, -- Amber Void
    function() t[2045] = a:New(2045); end, -- Emerald Void
    function() t[2044] = a:New(2044); end, -- Ruby Void
    function() t[2043] = a:New(2043); end, -- The Incredible Hulk
    function() t[2042] = a:New(2042); end, -- Shatter Resistant
    function() t[2041] = a:New(2041); end, -- Dehydration
    function() t[2040] = a:New(2040); end, -- Less-rabi
    function() t[2039] = a:New(2039); end, -- Better Off Dred
    function() t[2038] = a:New(2038); end, -- Respect Your Elders
    function() t[2037] = a:New(2037); end, -- Chaos Theory
    function() t[2036] = a:New(2036); end, -- Intense Cold
    function() O(t[2019], "From", "Version", "030003", "Before", "Version", "030300"); end,
    function() t[2019] = a:New(2019); end, -- Proof of Demise
    function() O(t[2018], "From", "Version", "030003", "Before", "Version", "030300"); end,
    function() t[2018] = a:New(2018); end, -- Timear Foresees
    function() t[2017] = a:New(2017, f.Horde, 2016, true); end, -- Grizzled Veteran
    function() t[2016] = a:New(2016, f.Alliance, 2017, true); end, -- Grizzled Veteran
    function() t[2002] = a:New(2002); end, -- 100 Cooking Awards
    function() t[2001] = a:New(2001); end, -- 50 Cooking Awards
    function() t[2000] = a:New(2000); end, -- 25 Cooking Awards
    function() t[1999] = a:New(1999); end, -- 10 Cooking Awards
    function() t[1998] = a:New(1998); end, -- Cooking Award
    function() t[1997] = a:New(1997); end, -- Momma Said Knock You Out (10 player)
    function() t[1996] = a:New(1996); end, -- The Safety Dance (10 player)
    function() t[1958] = a:New(1958); end, -- I Smell A Giant Rat
    function() t[1957] = a:New(1957); end, -- There's Gold In That There Fountain
    function() t[1956] = a:New(1956); end, -- Higher Learning
    function() t[1936] = a:New(1936); end, -- Does Your Wolpertinger Linger?
    function() t[1919] = a:New(1919); end, -- On The Rocks
    function() t[1877] = a:New(1877); end, -- Less Is More (25 player)
    function() t[1876] = a:New(1876); end, -- Besting the Black Dragonflight (10 player)
    function() t[1875] = a:New(1875); end, -- You Don't Have an Eternity (25 player)
    function() t[1874] = a:New(1874); end, -- You Don't Have an Eternity (10 player)
    function() t[1873] = a:New(1873); end, -- Lodi Dodi We Loves the Skadi
    function() t[1872] = a:New(1872); end, -- Zombiefest!
    function() t[1871] = a:New(1871); end, -- Experienced Drake Rider
    function() t[1870] = a:New(1870); end, -- A Poke in the Eye (25 player)
    function() t[1869] = a:New(1869); end, -- A Poke in the Eye (10 player)
    function() t[1868] = a:New(1868); end, -- Make It Count
    function() t[1867] = a:New(1867); end, -- Timely Death
    function() t[1866] = a:New(1866); end, -- Good Grief
    function() t[1865] = a:New(1865); end, -- Lockdown!
    function() t[1864] = a:New(1864); end, -- What the Eck?
    function() t[1862] = a:New(1862); end, -- Volazj's Quick Demise
    function() t[1860] = a:New(1860); end, -- Gotta Go!
    function() t[1859] = a:New(1859); end, -- Arachnophobia (25 player)
    function() t[1858] = a:New(1858); end, -- Arachnophobia (10 player)
    function() t[1857] = a:New(1857); end, -- Make Quick Werk of Him (25 player)
    function() t[1856] = a:New(1856); end, -- Make Quick Werk of Him (10 player)
    function() t[1837] = a:New(1837); end, -- Old Ironjaw
    function() t[1836] = a:New(1836); end, -- Old Crafty
    function() t[1834] = a:New(1834); end, -- Lightning Struck
    function() t[1833] = a:New(1833); end, -- It's Happy Hour Somewhere
    function() t[1832] = a:New(1832); end, -- Tastes Like Chicken
    function() t[1817] = a:New(1817); end, -- The Culling of Time
    function() t[1816] = a:New(1816); end, -- Defenseless
    function() t[1801] = a:New(1801); end, -- Captain Rumsey's Lager
    function() t[1800] = a:New(1800); end, -- The Outland Gourmet
    function() t[1799] = a:New(1799); end, -- Chef de Cuisine
    function() t[1798] = a:New(1798); end, -- Sous Chef
    function() t[1797] = a:New(1797); end, -- Chef de Partie
    function() t[1796] = a:New(1796); end, -- Short Order Cook
    function() t[1795] = a:New(1795); end, -- Lunch Lady
    function() t[1793] = a:New(1793); end, -- For the Children
    function() t[1792] = a:New(1792); end, -- "Aw, Isn't It Cute?"
    function() t[1791] = a:New(1791); end, -- Home Alone
    function() t[1790] = a:New(1790); end, -- "Hail To The King, Baby"
    function() t[1789] = a:New(1789); end, -- Daily Chores
    function() t[1788] = a:New(1788); end, -- Bad Example
    function() t[1786] = a:New(1786); end, -- School of Hard Knocks
    function() t[1785] = a:New(1785); end, -- Dinner Impossible
    function() t[1783] = a:New(1783, f.Horde, 1782); end, -- Our Daily Bread
    function() t[1782] = a:New(1782, f.Alliance, 1783); end, -- Our Daily Bread
    function() t[1781] = a:New(1781); end, -- Critter Gitter
    function() t[1780] = a:New(1780); end, -- Second That Emotion
    function() t[1779] = a:New(1779); end, -- The Northrend Gourmet
    function() t[1778] = a:New(1778); end, -- The Northrend Gourmet
    function() t[1777] = a:New(1777); end, -- The Northrend Gourmet
    function() O(t[1766], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1766] = a:New(1766, nil, nil, true); end, -- Ancient Protector
    function() O(t[1765], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1765] = a:New(1765, nil, nil, true); end, -- Steady Hands
    function() O(t[1764], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1764] = a:New(1764, nil, nil, true); end, -- Drop It!
    function() O(t[1763], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1763] = a:New(1763, nil, nil, true); end, -- Artillery Veteran
    function() O(t[1762], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1762] = a:New(1762, f.Alliance, 2192, true); end, -- Not Even a Scratch
    function() O(t[1761], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1761] = a:New(1761, nil, nil, true); end, -- The Dapper Sapper
    function() O(t[1757], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1757] = a:New(1757, f.Alliance, 2200, true); end, -- Defense of the Ancients
    function() t[1755] = a:New(1755, nil, nil, true); end, -- Within Our Grasp
    function() t[1752] = a:New(1752, nil, nil, true); end, -- Master of Wintergrasp
    function() t[1751] = a:New(1751, nil, nil, true); end, -- Didn't Stand a Chance
    function() t[1737] = a:New(1737, f.Alliance, 2476, true); end, -- Destruction Derby
    function() t[1727] = a:New(1727, nil, nil, true); end, -- Leaning Tower
    function() t[1723] = a:New(1723, nil, nil, true); end, -- Vehicular Gnomeslaughter
    function() t[1722] = a:New(1722); end, -- Archavon the Stone Watcher (10 player)
    function() t[1721] = a:New(1721); end, -- Archavon the Stone Watcher (25 player)
    function() t[1718] = a:New(1718, nil, nil, true); end, -- Wintergrasp Veteran
    function() t[1717] = a:New(1717, nil, nil, true); end, -- Wintergrasp Victory
    function() t[1706] = a:New(1706); end, -- Crashin' Thrashin' Racer
    function() t[1705] = a:New(1705); end, -- Clockwork Rocket Bot
    function() t[1704] = a:New(1704); end, -- I Pitied The Fool
    function() t[1703] = a:New(1703); end, -- "My Love is Like a Red, Red Rose"
    function() t[1702] = a:New(1702); end, -- Sweet Tooth
    function() t[1701] = a:New(1701); end, -- Be Mine!
    function() t[1700] = a:New(1700); end, -- Perma-Peddle
    function() t[1699] = a:New(1699); end, -- Fistful of Love
    function() t[1698] = a:New(1698, f.Horde, 1697); end, -- Nation of Adoration
    function() t[1697] = a:New(1697, f.Alliance, 1698); end, -- Nation of Adoration
    function() t[1696] = a:New(1696); end, -- The Rocket's Pink Glare
    function() t[1695] = a:New(1695); end, -- Dangerous Love
    function() t[1694] = a:New(1694); end, -- Lovely Luck Is On Your Side
    function() t[1693] = a:New(1693); end, -- Fool For Love
    function() t[1691] = a:New(1691); end, -- Merrymaker
    function() t[1690] = a:New(1690); end, -- A Frosty Shake
    function() t[1689] = a:New(1689); end, -- He Knows If You've Been Naughty
    function() t[1688] = a:New(1688); end, -- The Winter Veil Gourmet
    function() t[1687] = a:New(1687); end, -- Let It Snow
    function() t[1686] = a:New(1686, f.Alliance, 1685); end, -- Holiday Bromance
    function() t[1685] = a:New(1685, f.Horde, 1686); end, -- Holiday Bromance
    function() t[1683] = a:New(1683); end, -- Brewmaster
    function() t[1678] = a:New(1678); end, -- Loremaster of Kalimdor
    function() t[1676] = a:New(1676); end, -- Loremaster of Eastern Kingdoms
    function() t[1658] = a:New(1658); end, -- Champion of the Frozen Wastes
    function() t[1656] = a:New(1656); end, -- Hallowed Be Thy Name
    function() t[1638] = a:New(1638); end, -- Skyshattered
    function() O(t[1637]); end,
    function() t[1637] = a:New(1637); end, -- Spirit of Competition
    function() O(t[1636]); end,
    function() t[1636] = a:New(1636); end, -- Competitor's Tabard
    function() t[1596] = a:New(1596); end, -- Guru of Drakuru
    function() t[1576] = a:New(1576); end, -- Of Blood and Anguish
    function() t[1563] = a:New(1563); end, -- Hail to the Chef
    function() t[1561] = a:New(1561); end, -- 1000 Fish
    function() t[1560] = a:New(1560); end, -- 500 Fish
    function() t[1559] = a:New(1559); end, -- 250 Fish
    function() t[1558] = a:New(1558); end, -- 100 Fish
    function() t[1557] = a:New(1557); end, -- 50 Fish
    function() t[1556] = a:New(1556); end, -- 25 Fish
    function() t[1552] = a:New(1552); end, -- Frenzied Firecracker
    function() t[1517] = a:New(1517); end, -- Northrend Angler
    function() t[1516] = a:New(1516); end, -- Accomplished Angler
    function() t[1502] = a:New(1502, f.Horde, 202, true); end, -- Quick Cap
    function() O(t[1463], "Once"); end,
    function() t[1463] = a:New(1463, nil, nil, nil, true); end, -- Realm First! Northrend Vanguard
    function() t[1457] = a:New(1457); end, -- Explore Crystalsong Forest
    function() O(t[1436]); end,
    function() t[1436] = a:New(1436); end, -- Friends In High Places
    function() t[1428] = a:New(1428); end, -- Mine Sweeper
    function() O(t[1427], "Once"); end,
    function() t[1427] = a:New(1427, nil, nil, nil, true); end, -- Realm First! Grand Master Tailor
    function() O(t[1426], "Once"); end,
    function() t[1426] = a:New(1426, nil, nil, nil, true); end, -- Realm First! Grand Master Skinner
    function() O(t[1425], "Once"); end,
    function() t[1425] = a:New(1425, nil, nil, nil, true); end, -- Realm First! Grand Master Miner
    function() O(t[1424], "Once"); end,
    function() t[1424] = a:New(1424, nil, nil, nil, true); end, -- Realm First! Grand Master Leatherworker
    function() O(t[1423], "Once"); end,
    function() t[1423] = a:New(1423, nil, nil, nil, true); end, -- Realm First! Grand Master Jewelcrafter
    function() O(t[1422], "Once"); end,
    function() t[1422] = a:New(1422, nil, nil, nil, true); end, -- Realm First! Grand Master Scribe
    function() O(t[1421], "Once"); end,
    function() t[1421] = a:New(1421, nil, nil, nil, true); end, -- Realm First! Grand Master Herbalist
    function() O(t[1420], "Once"); end,
    function() t[1420] = a:New(1420, nil, nil, nil, true); end, -- Realm First! Grand Master Angler
    function() O(t[1419], "Once"); end,
    function() t[1419] = a:New(1419, nil, nil, nil, true); end, -- Realm First! Grand Master Medic
    function() O(t[1418], "Once"); end,
    function() t[1418] = a:New(1418, nil, nil, nil, true); end, -- Realm First! Grand Master Engineer
    function() O(t[1417], "Once"); end,
    function() t[1417] = a:New(1417, nil, nil, nil, true); end, -- Realm First! Grand Master Enchanter
    function() O(t[1416], "Once"); end,
    function() t[1416] = a:New(1416, nil, nil, nil, true); end, -- Realm First! Grand Master Cook
    function() O(t[1415], "Once"); end,
    function() t[1415] = a:New(1415, nil, nil, nil, true); end, -- Realm First! Grand Master Alchemist
    function() O(t[1414], "Once"); end,
    function() t[1414] = a:New(1414, nil, nil, nil, true); end, -- Realm First! Grand Master Blacksmith
    function() O(t[1413], "Once"); end,
    function() t[1413] = a:New(1413, nil, nil, nil, true); end, -- Realm First! Level 80 Forsaken
    function() O(t[1412], "Once"); end,
    function() t[1412] = a:New(1412, nil, nil, nil, true); end, -- Realm First! Level 80 Troll
    function() O(t[1411], "Once"); end,
    function() t[1411] = a:New(1411, nil, nil, nil, true); end, -- Realm First! Level 80 Tauren
    function() O(t[1410], "Once"); end,
    function() t[1410] = a:New(1410, nil, nil, nil, true); end, -- Realm First! Level 80 Orc
    function() O(t[1409], "Once"); end,
    function() t[1409] = a:New(1409, nil, nil, nil, true); end, -- Realm First! Level 80 Night Elf
    function() O(t[1408], "Once"); end,
    function() t[1408] = a:New(1408, nil, nil, nil, true); end, -- Realm First! Level 80 Human
    function() O(t[1407], "Once"); end,
    function() t[1407] = a:New(1407, nil, nil, nil, true); end, -- Realm First! Level 80 Dwarf
    function() O(t[1406], "Once"); end,
    function() t[1406] = a:New(1406, nil, nil, nil, true); end, -- Realm First! Level 80 Draenei
    function() O(t[1405], "Once"); end,
    function() t[1405] = a:New(1405, nil, nil, nil, true); end, -- Realm First! Level 80 Blood Elf
    function() O(t[1404], "Once"); end,
    function() t[1404] = a:New(1404, nil, nil, nil, true); end, -- Realm First! Level 80 Gnome
    function() O(t[1402], "Once"); end,
    function() t[1402] = a:New(1402, nil, nil, nil, true); end, -- Realm First! Conqueror of Naxxramas
    function() O(t[1400], "Once"); end,
    function() t[1400] = a:New(1400, nil, nil, nil, true); end, -- Realm First! Magic Seeker
    function() t[1396] = a:New(1396); end, -- Elders of Northrend
    function() t[1359] = a:New(1359, f.Horde, 35); end, -- Might of Dragonblight
    function() t[1358] = a:New(1358, f.Horde, 33); end, -- Nothing Boring About Borean
    function() t[1357] = a:New(1357, f.Horde, 37); end, -- Fo' Grizzle My Shizzle
    function() t[1356] = a:New(1356, f.Horde, 34); end, -- I've Toured the Fjord
    function() t[1312] = a:New(1312); end, -- Bloody Rare
    function() t[1311] = a:New(1311); end, -- Medium Rare
    function() O(t[1310], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1310] = a:New(1310, nil, nil, true); end, -- Storm the Beach
    function() O(t[1309], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1309] = a:New(1309, nil, nil, true); end, -- Strand of the Ancients Veteran
    function() O(t[1308], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[1308] = a:New(1308, nil, nil, true); end, -- Strand of the Ancients Victory
    function() O(t[1307], "From", "Version", "030002", "Before", "Version", "060002"); end,
    function() t[1307] = a:New(1307); end, -- Upper Blackrock Spire (Classic)
    function() t[1297] = a:New(1297); end, -- Hadronox Denied
    function() t[1296] = a:New(1296); end, -- Watch Him Die
    function() t[1295] = a:New(1295); end, -- Crashin' & Thrashin'
    function() O(t[1293]); end,
    function() t[1293] = a:New(1293); end, -- Blue Brewfest Stein
    function() O(t[1292]); end,
    function() t[1292] = a:New(1292); end, -- Yellow Brewfest Stein
    function() t[1291] = a:New(1291); end, -- Lonely?
    function() t[1289] = a:New(1289); end, -- Northrend Dungeon Hero
    function() t[1288] = a:New(1288); end, -- Northrend Dungeonmaster
    function() t[1287] = a:New(1287); end, -- Outland Dungeon Hero
    function() t[1286] = a:New(1286); end, -- Outland Raider
    function() t[1285] = a:New(1285); end, -- Classic Raider
    function() t[1284] = a:New(1284); end, -- Outland Dungeonmaster
    function() t[1283] = a:New(1283); end, -- Classic Dungeonmaster
    function() t[1282] = a:New(1282); end, -- Fa-la-la-la-Ogri'la
    function() t[1281] = a:New(1281); end, -- The Rocket's Red Glare
    function() t[1280] = a:New(1280, f.Horde, 1279); end, -- Flirt With Disaster
    function() t[1279] = a:New(1279, f.Alliance, 1280); end, -- Flirt With Disaster
    function() t[1277] = a:New(1277); end, -- Rapid Defense
    function() t[1276] = a:New(1276); end, -- Blade's Edge Bomberman
    function() t[1275] = a:New(1275); end, -- Bombs Away
    function() t[1273] = a:New(1273, f.Horde, 1192); end, -- Nagrand Slam
    function() t[1272] = a:New(1272, f.Horde, 1191); end, -- Terror of Terokkar
    function() t[1271] = a:New(1271, f.Horde, 1189); end, -- To Hellfire and Back
    function() t[1270] = a:New(1270); end, -- Explore Icecrown
    function() t[1269] = a:New(1269); end, -- Explore Storm Peaks
    function() t[1268] = a:New(1268); end, -- Explore Sholazar Basin
    function() t[1267] = a:New(1267); end, -- Explore Zul'Drak
    function() t[1266] = a:New(1266); end, -- Explore Grizzly Hills
    function() t[1265] = a:New(1265); end, -- Explore Dragonblight
    function() t[1264] = a:New(1264); end, -- Explore Borean Tundra
    function() t[1263] = a:New(1263); end, -- Explore Howling Fjord
    function() t[1262] = a:New(1262); end, -- Loremaster of Outland
    function() t[1261] = a:New(1261); end, -- G.N.E.R.D. Rage
    function() t[1260] = a:New(1260); end, -- Almost Blind Luck
    function() t[1259] = a:New(1259, nil, nil, true); end, -- Not So Fast
    function() t[1258] = a:New(1258, nil, nil, true); end, -- Take a Chill Pill
    function() t[1257] = a:New(1257); end, -- The Scavenger
    function() t[1255] = a:New(1255, f.Alliance, 259); end, -- Scrooge
    function() t[1254] = a:New(1254); end, -- Friend or Fowl?
    function() t[1252] = a:New(1252, f.Horde, 206, true); end, -- Supreme Defender
    function() t[1251] = a:New(1251, f.Horde, 203, true); end, -- Not In My House
    function() t[1250] = a:New(1250); end, -- "Shop Smart, Shop Pet...Smart"
    function() t[1248] = a:New(1248); end, -- Plethora of Pets
    function() t[1244] = a:New(1244); end, -- Well Read
    function() t[1243] = a:New(1243); end, -- Fish Don't Leave Footprints
    function() t[1225] = a:New(1225); end, -- Outland Angler
    function() t[1206] = a:New(1206); end, -- To All The Squirrels I've Loved Before
    function() t[1205] = a:New(1205); end, -- Hero of Shattrath
    function() t[1203] = a:New(1203, f.Horde, 1184); end, -- Strange Brew
    function() t[1195] = a:New(1195); end, -- Shadow of the Betrayer
    function() t[1194] = a:New(1194); end, -- Into the Nether
    function() t[1193] = a:New(1193); end, -- On the Blade's Edge
    function() t[1192] = a:New(1192, f.Alliance, 1273); end, -- Nagrand Slam
    function() t[1191] = a:New(1191, f.Alliance, 1272); end, -- Terror of Terokkar
    function() t[1190] = a:New(1190); end, -- Mysteries of the Marsh
    function() t[1189] = a:New(1189, f.Alliance, 1271); end, -- To Hellfire and Back
    function() t[1188] = a:New(1188); end, -- Shafted!
    function() O(t[1186], "From", "Version", "030002", "Before", "Version", "080200"); end,
    function() t[1186] = a:New(1186); end, -- Down With The Dark Iron
    function() t[1185] = a:New(1185); end, -- The Brewfest Diet
    function() t[1184] = a:New(1184, f.Alliance, 1203); end, -- Strange Brew
    function() t[1183] = a:New(1183); end, -- Brew of the Year
    function() t[1182] = a:New(1182); end, -- The Bread Winner
    function() t[1181] = a:New(1181); end, -- Got My Mind On My Money
    function() t[1180] = a:New(1180); end, -- Got My Mind On My Money
    function() t[1178] = a:New(1178); end, -- Got My Mind On My Money
    function() t[1177] = a:New(1177); end, -- Got My Mind On My Money
    function() t[1176] = a:New(1176); end, -- Got My Mind On My Money
    function() t[1175] = a:New(1175, f.Horde, 230, true); end, -- Battlemaster
    function() O(t[1174], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[1174] = a:New(1174, nil, nil, true); end, -- The Arena Master
    function() t[1172] = a:New(1172, nil, nil, true); end, -- Master of Warsong Gulch
    function() t[1171] = a:New(1171, nil, nil, true); end, -- Master of Eye of the Storm
    function() t[1169] = a:New(1169, nil, nil, true); end, -- Master of Arathi Basin
    function() t[1167] = a:New(1167, nil, nil, true); end, -- Master of Alterac Valley
    function() t[1166] = a:New(1166, nil, nil, true); end, -- To the Looter Go the Spoils
    function() t[1165] = a:New(1165); end, -- "My Storage is ""Gigantique"""
    function() t[1164] = a:New(1164, f.Horde, 225, true); end, -- Everything Counts
    function() t[1162] = a:New(1162, nil, nil, true); end, -- Hotter Streak
    function() O(t[1161], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[1161] = a:New(1161, nil, nil, true); end, -- High Five: 2200
    function() t[1160] = a:New(1160, nil, nil, true); end, -- Three's Company: 2200
    function() t[1159] = a:New(1159, nil, nil, true); end, -- Just the Two of Us: 2200
    function() t[1157] = a:New(1157, nil, nil, true); end, -- Duel-icious
    function() t[1153] = a:New(1153, nil, nil, true); end, -- Overly Defensive
    function() t[1151] = a:New(1151, f.Alliance, 224, true); end, -- Loyal Defender
    function() t[1145] = a:New(1145); end, -- King of the Fire Festival
    function() t[1041] = a:New(1041, f.Horde, 1040); end, -- Rotten Hallow
    function() t[1040] = a:New(1040, f.Alliance, 1041); end, -- Rotten Hallow
    function() t[1039] = a:New(1039, f.Horde, 1038); end, -- The Flame Keeper
    function() t[1038] = a:New(1038, f.Alliance, 1039); end, -- The Flame Warden
    function() t[1037] = a:New(1037, f.Horde, 1035); end, -- Desecration of the Alliance
    function() t[1036] = a:New(1036, f.Horde, 1034); end, -- The Fires of Azeroth
    function() t[1035] = a:New(1035, f.Alliance, 1037); end, -- Desecration of the Horde
    function() t[1034] = a:New(1034, f.Alliance, 1036); end, -- The Fires of Azeroth
    function() t[1033] = a:New(1033, f.Horde, 1030); end, -- Extinguishing Outland
    function() t[1032] = a:New(1032, f.Horde, 1029); end, -- Extinguishing Kalimdor
    function() t[1031] = a:New(1031, f.Horde, 1028); end, -- Extinguishing Eastern Kingdoms
    function() t[1030] = a:New(1030, f.Alliance, 1033); end, -- Extinguishing Outland
    function() t[1029] = a:New(1029, f.Alliance, 1032); end, -- Extinguishing Kalimdor
    function() t[1028] = a:New(1028, f.Alliance, 1031); end, -- Extinguishing Eastern Kingdoms
    function() t[1027] = a:New(1027, f.Horde, 1024); end, -- Flame Keeper of Outland
    function() t[1026] = a:New(1026, f.Horde, 1023); end, -- Flame Keeper of Kalimdor
    function() t[1025] = a:New(1025, f.Horde, 1022); end, -- Flame Keeper of Eastern Kingdoms
    function() t[1024] = a:New(1024, f.Alliance, 1027); end, -- Flame Warden of Outland
    function() t[1023] = a:New(1023, f.Alliance, 1026); end, -- Flame Warden of Kalimdor
    function() t[1022] = a:New(1022, f.Alliance, 1025); end, -- Flame Warden of Eastern Kingdoms
    function() t[1021] = a:New(1021); end, -- Twenty-Five Tabards
    function() t[1020] = a:New(1020); end, -- Ten Tabards
    function() t[1017] = a:New(1017); end, -- Can I Keep Him?
    function() t[1015] = a:New(1015); end, -- 40 Exalted Reputations
    function() t[1014] = a:New(1014); end, -- 35 Exalted Reputations
    function() t[1012] = a:New(1012, f.Alliance, 1011); end, -- The Winds of the North
    function() t[1011] = a:New(1011, f.Horde, 1012); end, -- The Winds of the North
    function() t[1010] = a:New(1010); end, -- Northrend Vanguard
    function() t[1009] = a:New(1009); end, -- Knights of the Ebon Blade
    function() t[1008] = a:New(1008); end, -- The Kirin Tor
    function() t[1007] = a:New(1007); end, -- The Wyrmrest Accord
    function() t[1006] = a:New(1006, f.Horde, 388, true); end, -- City Defender
    function() t[1005] = a:New(1005, f.Horde, 246, true); end, -- Know Thy Enemy
    function() t[981] = a:New(981); end, -- That Sparkling Smile
    function() t[980] = a:New(980); end, -- The Horseman's Reins
    function() t[979] = a:New(979); end, -- The Mask Task
    function() t[978] = a:New(978); end, -- 3000 Quests Completed
    function() t[977] = a:New(977); end, -- 1000 Daily Quests Completed
    function() t[976] = a:New(976); end, -- 500 Daily Quests Completed
    function() t[975] = a:New(975); end, -- 200 Daily Quests Completed
    function() t[974] = a:New(974); end, -- 50 Daily Quests Completed
    function() t[973] = a:New(973); end, -- 5 Daily Quests Completed
    function() t[972] = a:New(972); end, -- Trick or Treat!
    function() t[971] = a:New(971); end, -- Tricks and Treats of Azeroth
    function() t[969] = a:New(969, f.Alliance, 968); end, -- Tricks and Treats of Outland
    function() t[968] = a:New(968, f.Horde, 969); end, -- Tricks and Treats of Outland
    function() t[967] = a:New(967, f.Horde, 966); end, -- Tricks and Treats of Eastern Kingdoms
    function() t[966] = a:New(966, f.Alliance, 967); end, -- Tricks and Treats of Eastern Kingdoms
    function() t[965] = a:New(965, f.Horde, 963); end, -- Tricks and Treats of Kalimdor
    function() t[964] = a:New(964); end, -- Going Down?
    function() t[963] = a:New(963, f.Alliance, 965); end, -- Tricks and Treats of Kalimdor
    function() t[962] = a:New(962); end, -- Savior of the Oracles
    function() t[961] = a:New(961); end, -- Honorary Frenzyheart
    function() t[960] = a:New(960); end, -- The Violet Eye
    function() t[959] = a:New(959); end, -- The Scale of the Sands
    function() t[958] = a:New(958); end, -- Sworn to the Deathsworn
    function() O(t[957], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[957] = a:New(957); end, -- Hero of the Zandalar Tribe
    function() t[956] = a:New(956); end, -- Brood of Nozdormu
    function() t[955] = a:New(955); end, -- Hydraxian Waterlords
    function() t[953] = a:New(953); end, -- Guardian of Cenarius
    function() t[952] = a:New(952); end, -- Mercenary of Sholazar
    function() t[951] = a:New(951); end, -- The Oracles
    function() t[950] = a:New(950); end, -- Frenzyheart Tribe
    function() t[949] = a:New(949); end, -- Tuskarrmageddon
    function() t[948] = a:New(948, f.Alliance, 762); end, -- Ambassador of the Alliance
    function() t[947] = a:New(947); end, -- The Argent Crusade
    function() t[946] = a:New(946); end, -- The Argent Dawn
    function() t[945] = a:New(945); end, -- The Argent Champion
    function() t[944] = a:New(944); end, -- They Love Me In That Tunnel
    function() t[943] = a:New(943, f.Horde, 942); end, -- The Diplomat
    function() t[942] = a:New(942, f.Alliance, 943); end, -- The Diplomat
    function() t[941] = a:New(941); end, -- Hemet Nesingwary: The Collected Quests
    function() t[940] = a:New(940); end, -- The Green Hills of Stranglethorn
    function() t[939] = a:New(939); end, -- Hills Like White Elekk
    function() t[938] = a:New(938); end, -- The Snows of Northrend
    function() t[937] = a:New(937); end, -- Elune's Blessing
    function() t[915] = a:New(915); end, -- Elders of the Alliance
    function() t[914] = a:New(914); end, -- Elders of the Horde
    function() t[913] = a:New(913); end, -- To Honor One's Elders
    function() t[912] = a:New(912); end, -- Elders of Eastern Kingdoms
    function() t[911] = a:New(911); end, -- Elders of Kalimdor
    function() t[910] = a:New(910); end, -- Elders of the Dungeons
    function() t[909] = a:New(909, f.Horde, 908, true); end, -- Call to Arms!
    function() t[908] = a:New(908, f.Alliance, 909, true); end, -- Call to Arms!
    function() t[907] = a:New(907, f.Alliance, 714, true); end, -- The Justicar
    function() t[906] = a:New(906); end, -- Kickin' It Up a Notch
    function() t[905] = a:New(905); end, -- Old Man Barlowned
    function() t[903] = a:New(903); end, -- Shattrath Divided
    function() t[902] = a:New(902); end, -- Chief Exalted Officer
    function() t[901] = a:New(901, f.Horde, 899); end, -- Mag'har of Draenor
    function() t[900] = a:New(900); end, -- The Czar of Sporeggar
    function() t[899] = a:New(899, f.Alliance, 901); end, -- "Oh My, Kurenai"
    function() t[898] = a:New(898); end, -- On Wings of Nether
    function() t[897] = a:New(897); end, -- You're So Offensive
    function() t[896] = a:New(896); end, -- A Quest a Day Keeps the Ogres at Bay
    function() t[894] = a:New(894); end, -- Flying High Over Skettis
    function() t[893] = a:New(893); end, -- Cenarion War Hippogryph
    function() O(t[892], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[892] = a:New(892); end, -- The Right Stuff
    function() t[891] = a:New(891); end, -- Giddy Up!
    function() t[890] = a:New(890); end, -- Into the Wild Blue Yonder
    function() t[889] = a:New(889); end, -- Fast and Furious
    function() O(t[888], "From", "PvP Season", 3, "Until", "PvP Season", 3); end,
    function() t[888] = a:New(888, nil, nil, true); end, -- Vengeful Nether Drake
    function() O(t[887], "From", "PvP Season", 2, "Until", "PvP Season", 2); end,
    function() t[887] = a:New(887, nil, nil, true); end, -- Merciless Nether Drake
    function() O(t[886], "From", "PvP Season", 1, "Until", "PvP Season", 1); end,
    function() t[886] = a:New(886, nil, nil, true); end, -- Swift Nether Drake
    function() t[885] = a:New(885); end, -- Ashes of Al'ar
    function() t[884] = a:New(884); end, -- Swift White Hawkstrider
    function() t[883] = a:New(883); end, -- Reins of the Raven Lord
    function() t[882] = a:New(882); end, -- Fiery Warhorse's Reins
    function() O(t[881], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[881] = a:New(881); end, -- Swift Razzashi Raptor
    function() O(t[880], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[880] = a:New(880); end, -- Swift Zulian Tiger
    function() O(t[879]); end,
    function() t[879] = a:New(879); end, -- Old School Ride
    function() t[878] = a:New(878); end, -- One That Didn't Get Away
    function() t[877] = a:New(877); end, -- The Cake Is Not A Lie
    function() t[876] = a:New(876, nil, nil, true); end, -- Brutally Dedicated
    function() t[875] = a:New(875, nil, nil, true); end, -- Vengefully Dedicated
    function() t[873] = a:New(873, f.Horde, 220, true); end, -- Frostwolf Perfection
    function() t[872] = a:New(872, nil, nil, true); end, -- Frenzied Defender
    function() t[871] = a:New(871); end, -- "Avast Ye, Admiral!"
    function() t[870] = a:New(870, nil, nil, true); end, -- 100000 Honorable Kills
    function() t[869] = a:New(869, nil, nil, true); end, -- 50000 Honorable Kills
    function() t[868] = a:New(868); end, -- Explore Isle of Quel'Danas
    function() t[867] = a:New(867); end, -- Explore Terokkar Forest
    function() t[866] = a:New(866); end, -- Explore Nagrand
    function() t[865] = a:New(865); end, -- Explore Blade's Edge Mountains
    function() t[864] = a:New(864); end, -- Explore Shadowmoon Valley
    function() t[863] = a:New(863); end, -- Explore Zangarmarsh
    function() t[862] = a:New(862); end, -- Explore Hellfire Peninsula
    function() t[861] = a:New(861); end, -- Explore Bloodmyst Isle
    function() t[860] = a:New(860); end, -- Explore Azuremyst Isle
    function() t[859] = a:New(859); end, -- Explore Eversong Woods
    function() t[858] = a:New(858); end, -- Explore Ghostlands
    function() t[857] = a:New(857); end, -- Explore Winterspring
    function() t[856] = a:New(856); end, -- Explore Silithus
    function() t[855] = a:New(855); end, -- Explore Moonglade
    function() t[854] = a:New(854); end, -- Explore Un'Goro Crater
    function() t[853] = a:New(853); end, -- Explore Felwood
    function() t[852] = a:New(852); end, -- Explore Azshara
    function() t[851] = a:New(851); end, -- Explore Tanaris
    function() t[850] = a:New(850); end, -- Explore Dustwallow Marsh
    function() t[849] = a:New(849); end, -- Explore Feralas
    function() t[848] = a:New(848); end, -- Explore Desolace
    function() t[847] = a:New(847); end, -- Explore Stonetalon Mountains
    function() t[846] = a:New(846); end, -- Explore Thousand Needles
    function() t[845] = a:New(845); end, -- Explore Ashenvale
    function() t[844] = a:New(844); end, -- Explore Darkshore
    function() t[843] = a:New(843); end, -- Explore Netherstorm
    function() t[842] = a:New(842); end, -- Explore Teldrassil
    function() t[841] = a:New(841); end, -- Explore Wetlands
    function() t[802] = a:New(802); end, -- Explore Westfall
    function() t[784] = a:New(784, nil, nil, true); end, -- Eye of the Storm Domination
    function() t[783] = a:New(783, nil, nil, true); end, -- The Perfect Storm
    function() t[782] = a:New(782); end, -- Explore Swamp of Sorrows
    function() t[781] = a:New(781); end, -- Explore Northern Stranglethorn
    function() t[780] = a:New(780); end, -- Explore Redridge Mountains
    function() t[779] = a:New(779); end, -- Explore Loch Modan
    function() t[778] = a:New(778); end, -- Explore Duskwood
    function() t[777] = a:New(777); end, -- Explore Deadwind Pass
    function() t[776] = a:New(776); end, -- Explore Elwynn Forest
    function() t[775] = a:New(775); end, -- Explore Burning Steppes
    function() t[774] = a:New(774); end, -- Explore Searing Gorge
    function() t[773] = a:New(773); end, -- Explore The Hinterlands
    function() t[772] = a:New(772); end, -- Explore Hillsbrad Foothills
    function() t[771] = a:New(771); end, -- Explore Eastern Plaguelands
    function() t[770] = a:New(770); end, -- Explore Western Plaguelands
    function() t[769] = a:New(769); end, -- Explore Silverpine Forest
    function() t[768] = a:New(768); end, -- Explore Tirisfal Glades
    function() t[766] = a:New(766); end, -- Explore Blasted Lands
    function() t[765] = a:New(765); end, -- Explore Badlands
    function() t[764] = a:New(764, f.Alliance, 763); end, -- The Burning Crusader
    function() t[763] = a:New(763, f.Horde, 764); end, -- The Burning Crusader
    function() t[762] = a:New(762, f.Horde, 948); end, -- Ambassador of the Horde
    function() t[761] = a:New(761); end, -- Explore Arathi Highlands
    function() t[750] = a:New(750); end, -- Explore Northern Barrens
    function() t[736] = a:New(736); end, -- Explore Mulgore
    function() t[735] = a:New(735); end, -- Working In the Cold
    function() t[734] = a:New(734); end, -- Professional Northrend Master
    function() t[733] = a:New(733); end, -- Professional Outland Master
    function() t[732] = a:New(732); end, -- Professional Classic Master
    function() t[731] = a:New(731); end, -- Professional Expert
    function() O(t[730], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[730] = a:New(730); end, -- Skills to Pay the Bills
    function() t[729] = a:New(729); end, -- Deathcharger's Reins
    function() t[728] = a:New(728); end, -- Explore Durotar
    function() t[727] = a:New(727, nil, nil, true); end, -- Call in the Cavalry
    function() t[726] = a:New(726); end, -- Mr. Pinchy's Magical Crawdad Box
    function() t[725] = a:New(725); end, -- "Thori'dal, the Stars' Fury"
    function() t[714] = a:New(714, f.Horde, 907, true); end, -- The Conqueror
    function() t[713] = a:New(713, f.Alliance, 712, true); end, -- Silverwing Sentinel
    function() t[712] = a:New(712, f.Horde, 713, true); end, -- Warsong Outrider
    function() t[711] = a:New(711, f.Alliance, 710, true); end, -- Knight of Arathor
    function() t[710] = a:New(710, f.Horde, 711, true); end, -- The Defiler
    function() t[709] = a:New(709, f.Alliance, 708, true); end, -- Hero of the Stormpike Guard
    function() t[708] = a:New(708, f.Horde, 709, true); end, -- Hero of the Frostwolf Clan
    function() t[707] = a:New(707, f.Alliance, 706, true); end, -- Stormpike Battle Charger
    function() t[706] = a:New(706, f.Horde, 707, true); end, -- Frostwolf Howler
    function() O(t[705], "From", "Version", "000304", "Before", "Version", "040001"); end,
    function() t[705] = a:New(705); end, -- Master of Arms
    function() O(t[701], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[701] = a:New(701, f.Alliance, 700, true); end, -- Freedom of the Alliance
    function() O(t[700], "From", "PvP Season", 5, "Until", "PvP Season", 18); end,
    function() t[700] = a:New(700, f.Horde, 701, true); end, -- Freedom of the Horde
    function() t[699] = a:New(699, nil, nil, true); end, -- World Wide Winner
    function() t[698] = a:New(698); end, -- Sunwell Plateau
    function() t[697] = a:New(697); end, -- The Black Temple
    function() t[696] = a:New(696); end, -- Tempest Keep
    function() t[695] = a:New(695); end, -- The Battle for Mount Hyjal
    function() t[694] = a:New(694); end, -- Serpentshrine Cavern
    function() t[693] = a:New(693); end, -- Magtheridon's Lair
    function() t[692] = a:New(692); end, -- Gruul's Lair
    function() O(t[691], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[691] = a:New(691); end, -- Zul'Aman
    function() t[690] = a:New(690); end, -- Karazhan
    function() t[689] = a:New(689); end, -- Ruins of Ahn'Qiraj
    function() O(t[688], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[688] = a:New(688); end, -- Zul'Gurub
    function() t[687] = a:New(687); end, -- Temple of Ahn'Qiraj
    function() t[686] = a:New(686); end, -- Molten Core
    function() t[685] = a:New(685); end, -- Blackwing Lair
    function() O(t[684], "Never"); end,
    function() t[684] = a:New(684); end, -- Onyxia's Lair (Level 60)
    function() t[683] = a:New(683); end, -- Collector's Edition: Frost Wyrm Whelp
    function() t[682] = a:New(682); end, -- Heroic: Magister's Terrace
    function() t[681] = a:New(681); end, -- Heroic: The Arcatraz
    function() t[680] = a:New(680); end, -- Heroic: The Botanica
    function() t[679] = a:New(679); end, -- Heroic: The Mechanar
    function() t[678] = a:New(678); end, -- Heroic: The Shattered Halls
    function() t[677] = a:New(677); end, -- Heroic: The Steamvault
    function() t[676] = a:New(676); end, -- Heroic: Opening of the Dark Portal
    function() t[675] = a:New(675); end, -- Heroic: Shadow Labyrinth
    function() t[674] = a:New(674); end, -- Heroic: Sethekk Halls
    function() t[673] = a:New(673); end, -- Heroic: The Escape From Durnholde
    function() t[672] = a:New(672); end, -- Heroic: Auchenai Crypts
    function() t[671] = a:New(671); end, -- Heroic: Mana-Tombs
    function() t[670] = a:New(670); end, -- Heroic: Underbog
    function() t[669] = a:New(669); end, -- Heroic: The Slave Pens
    function() t[668] = a:New(668); end, -- Heroic: The Blood Furnace
    function() t[667] = a:New(667); end, -- Heroic: Hellfire Ramparts
    function() t[666] = a:New(666); end, -- Auchenai Crypts
    function() t[665] = a:New(665); end, -- Collector's Edition: Netherwhelp
    function() t[664] = a:New(664); end, -- Collector's Edition: Zergling
    function() t[663] = a:New(663); end, -- Collector's Edition: Panda
    function() t[662] = a:New(662); end, -- Collector's Edition: Mini-Diablo
    function() t[661] = a:New(661); end, -- Magister's Terrace
    function() t[660] = a:New(660); end, -- The Arcatraz
    function() t[659] = a:New(659); end, -- The Botanica
    function() t[658] = a:New(658); end, -- The Mechanar
    function() t[657] = a:New(657); end, -- The Shattered Halls
    function() t[656] = a:New(656); end, -- The Steamvault
    function() t[655] = a:New(655); end, -- Opening of the Dark Portal
    function() t[654] = a:New(654); end, -- Shadow Labyrinth
    function() t[653] = a:New(653); end, -- Sethekk Halls
    function() t[652] = a:New(652); end, -- The Escape From Durnholde
    function() t[651] = a:New(651); end, -- Mana-Tombs
    function() t[650] = a:New(650); end, -- Underbog
    function() t[649] = a:New(649); end, -- The Slave Pens
    function() t[648] = a:New(648); end, -- The Blood Furnace
    function() t[647] = a:New(647); end, -- Hellfire Ramparts
    function() t[646] = a:New(646); end, -- Stratholme
    function() t[645] = a:New(645); end, -- Scholomance
    function() t[644] = a:New(644); end, -- King of Dire Maul
    function() t[643] = a:New(643); end, -- Lower Blackrock Spire
    function() t[642] = a:New(642); end, -- Blackrock Depths
    function() t[641] = a:New(641); end, -- Sunken Temple
    function() t[640] = a:New(640); end, -- Maraudon
    function() t[639] = a:New(639); end, -- Zul'Farrak
    function() t[638] = a:New(638); end, -- Uldaman
    function() t[637] = a:New(637); end, -- Scarlet Monastery
    function() t[636] = a:New(636); end, -- Razorfen Downs
    function() t[635] = a:New(635); end, -- Razorfen Kraul
    function() t[634] = a:New(634); end, -- Gnomeregan
    function() t[633] = a:New(633); end, -- Stormwind Stockade
    function() t[632] = a:New(632); end, -- Blackfathom Deeps
    function() t[631] = a:New(631); end, -- Shadowfang Keep
    function() t[630] = a:New(630); end, -- Wailing Caverns
    function() t[629] = a:New(629); end, -- Ragefire Chasm
    function() t[628] = a:New(628); end, -- Deadmines
    function() t[627] = a:New(627); end, -- Explore Dun Morogh
    function() t[626] = a:New(626); end, -- Lunar Festival Finery
    function() t[625] = a:New(625); end, -- Besting the Black Dragonflight (25 player)
    function() t[624] = a:New(624); end, -- Less Is More (10 player)
    function() t[623] = a:New(623); end, -- The Spellweaver's Downfall (25 player)
    function() t[622] = a:New(622); end, -- The Spellweaver's Downfall (10 player)
    function() t[621] = a:New(621); end, -- Represent
    function() t[619] = a:New(619, f.Horde, 614, true); end, -- For the Horde!
    function() t[618] = a:New(618, f.Horde, 613, true); end, -- Putting Out the Light
    function() O(t[617], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[617] = a:New(617, f.Horde, 612, true); end, -- Immortal No More
    function() t[616] = a:New(616, f.Horde, 611, true); end, -- Overthrow the Council
    function() O(t[615], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[615] = a:New(615, f.Horde, 610, true); end, -- Storming Stormwind
    function() t[614] = a:New(614, f.Alliance, 619, true); end, -- For the Alliance!
    function() t[613] = a:New(613, f.Alliance, 618, true); end, -- Killed in Quel'Thalas
    function() O(t[612], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[612] = a:New(612, f.Alliance, 617, true); end, -- Downing the Dark Lady
    function() O(t[611], "From", "Version", "030002", "Before", "Version", "090001"); end,
    function() t[611] = a:New(611, f.Alliance, 616, true); end, -- Bleeding Bloodhoof
    function() O(t[610], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[610] = a:New(610, f.Alliance, 615, true); end, -- Orgrimmar Offensive
    function() t[609] = a:New(609); end, -- 50 Coins of Ancestry
    function() t[608] = a:New(608); end, -- 25 Coins of Ancestry
    function() t[607] = a:New(607); end, -- 10 Coins of Ancestry
    function() t[606] = a:New(606); end, -- 5 Coins of Ancestry
    function() t[605] = a:New(605); end, -- A Coin of Ancestry
    function() t[604] = a:New(604, f.Alliance, 603, true); end, -- Wrath of the Alliance
    function() t[603] = a:New(603, f.Horde, 604, true); end, -- Wrath of the Horde
    function() t[587] = a:New(587, nil, nil, true); end, -- Stormy Assassin
    function() t[584] = a:New(584, nil, nil, true); end, -- Arathi Basin Assassin
    function() t[583] = a:New(583, nil, nil, true); end, -- Arathi Basin All-Star
    function() t[582] = a:New(582, nil, nil, true); end, -- Alterac Valley All-Star
    function() t[579] = a:New(579); end, -- The Dedicated Few (25 player)
    function() t[578] = a:New(578); end, -- The Dedicated Few (10 player)
    function() t[577] = a:New(577); end, -- The Fall of Naxxramas (25 player)
    function() t[576] = a:New(576); end, -- The Fall of Naxxramas (10 player)
    function() t[575] = a:New(575); end, -- Kel'Thuzad's Defeat (25 player)
    function() t[574] = a:New(574); end, -- Kel'Thuzad's Defeat (10 player)
    function() t[573] = a:New(573); end, -- Sapphiron's Demise (25 player)
    function() t[572] = a:New(572); end, -- Sapphiron's Demise (10 player)
    function() t[569] = a:New(569); end, -- The Military Quarter (25 player)
    function() t[568] = a:New(568); end, -- The Military Quarter (10 player)
    function() t[567] = a:New(567); end, -- The Plague Quarter (25 player)
    function() t[566] = a:New(566); end, -- The Plague Quarter (10 player)
    function() t[565] = a:New(565); end, -- The Construct Quarter (25 player)
    function() t[564] = a:New(564); end, -- The Construct Quarter (10 player)
    function() t[563] = a:New(563); end, -- The Arachnid Quarter (25 player)
    function() t[562] = a:New(562); end, -- The Arachnid Quarter (10 player)
    function() t[561] = a:New(561); end, -- D.E.H.T.A's Little P.I.T.A.
    function() O(t[560], "From", "Version", "030002", "Before", "Version", "040001"); end,
    function() t[560] = a:New(560); end, -- Deadliest Catch
    function() O(t[559], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[559] = a:New(559); end, -- Needy
    function() O(t[558], "From", "Version", "030002", "Before", "Version", "080001"); end,
    function() t[558] = a:New(558); end, -- Greedy
    function() O(t[557], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[557] = a:New(557); end, -- Superior
    function() O(t[556], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[556] = a:New(556); end, -- Epic
    function() t[547] = a:New(547); end, -- Veteran of the Wrathgate
    function() t[546] = a:New(546); end, -- Safe Deposit
    function() t[545] = a:New(545); end, -- Shave and a Haircut
    function() t[524] = a:New(524); end, -- 10 Exalted Reputations
    function() t[523] = a:New(523); end, -- 5 Exalted Reputations
    function() t[522] = a:New(522); end, -- Somebody Likes Me
    function() t[521] = a:New(521); end, -- 15 Exalted Reputations
    function() t[520] = a:New(520); end, -- 20 Exalted Reputations
    function() t[519] = a:New(519); end, -- 25 Exalted Reputations
    function() t[518] = a:New(518); end, -- 30 Exalted Reputations
    function() t[516] = a:New(516, nil, nil, true); end, -- 1000 Honorable Kills
    function() t[515] = a:New(515, nil, nil, true); end, -- 500 Honorable Kills
    function() t[513] = a:New(513, nil, nil, true); end, -- 100 Honorable Kills
    function() t[512] = a:New(512, nil, nil, true); end, -- 5000 Honorable Kills
    function() t[509] = a:New(509, nil, nil, true); end, -- 10000 Honorable Kills
    function() t[508] = a:New(508); end, -- 1500 Quests Completed
    function() t[507] = a:New(507); end, -- 1000 Quests Completed
    function() t[506] = a:New(506); end, -- 500 Quests Completed
    function() t[505] = a:New(505); end, -- 250 Quests Completed
    function() t[504] = a:New(504); end, -- 100 Quests Completed
    function() t[503] = a:New(503); end, -- 50 Quests Completed
    function() t[500] = a:New(500); end, -- Heroic: The Culling of Stratholme
    function() t[499] = a:New(499); end, -- Heroic: Utgarde Pinnacle
    function() t[498] = a:New(498); end, -- Heroic: The Oculus
    function() t[497] = a:New(497); end, -- Heroic: Halls of Lightning
    function() t[496] = a:New(496); end, -- Heroic: Halls of Stone
    function() t[495] = a:New(495); end, -- Heroic: Gundrak
    function() t[494] = a:New(494); end, -- Heroic: The Violet Hold
    function() t[493] = a:New(493); end, -- Heroic: Drak'Tharon Keep
    function() t[492] = a:New(492); end, -- Heroic: Ahn'kahet: The Old Kingdom
    function() t[491] = a:New(491); end, -- Heroic: Azjol-Nerub
    function() t[490] = a:New(490); end, -- Heroic: The Nexus
    function() t[489] = a:New(489); end, -- Heroic: Utgarde Keep
    function() t[488] = a:New(488); end, -- Utgarde Pinnacle
    function() t[487] = a:New(487); end, -- The Oculus
    function() t[486] = a:New(486); end, -- Halls of Lightning
    function() t[485] = a:New(485); end, -- Halls of Stone
    function() t[484] = a:New(484); end, -- Gundrak
    function() t[483] = a:New(483); end, -- The Violet Hold
    function() t[482] = a:New(482); end, -- Drak'Tharon Keep
    function() t[481] = a:New(481); end, -- Ahn'kahet: The Old Kingdom
    function() t[480] = a:New(480); end, -- Azjol-Nerub
    function() t[479] = a:New(479); end, -- The Culling of Stratholme
    function() t[478] = a:New(478); end, -- The Nexus
    function() t[477] = a:New(477); end, -- Utgarde Keep
    function() O(t[473], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[473] = a:New(473, f.Alliance, 446, true); end, -- Marshal
    function() O(t[472], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[472] = a:New(472, f.Alliance, 449, true); end, -- Knight-Lieutenant
    function() O(t[471], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[471] = a:New(471, f.Alliance, 453, true); end, -- Sergeant
    function() O(t[470], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[470] = a:New(470, f.Alliance, 468, true); end, -- Corporal
    function() O(t[469], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[469] = a:New(469, f.Horde, 438, true); end, -- Legionnaire
    function() O(t[468], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[468] = a:New(468, f.Horde, 470, true); end, -- Grunt
    function() O(t[467], "Once"); end,
    function() t[467] = a:New(467, nil, nil, nil, true); end, -- Realm First! Level 80 Shaman
    function() O(t[466], "Once"); end,
    function() t[466] = a:New(466, nil, nil, nil, true); end, -- Realm First! Level 80 Druid
    function() O(t[465], "Once"); end,
    function() t[465] = a:New(465, nil, nil, nil, true); end, -- Realm First! Level 80 Paladin
    function() O(t[464], "Once"); end,
    function() t[464] = a:New(464, nil, nil, nil, true); end, -- Realm First! Level 80 Priest
    function() O(t[463], "Once"); end,
    function() t[463] = a:New(463, nil, nil, nil, true); end, -- Realm First! Level 80 Warlock
    function() O(t[462], "Once"); end,
    function() t[462] = a:New(462, nil, nil, nil, true); end, -- Realm First! Level 80 Hunter
    function() O(t[461], "Once"); end,
    function() t[461] = a:New(461, nil, nil, nil, true); end, -- Realm First! Level 80 Death Knight
    function() O(t[460], "Once"); end,
    function() t[460] = a:New(460, nil, nil, nil, true); end, -- Realm First! Level 80 Mage
    function() O(t[459], "Once"); end,
    function() t[459] = a:New(459, nil, nil, nil, true); end, -- Realm First! Level 80 Warrior
    function() O(t[458], "Once"); end,
    function() t[458] = a:New(458, nil, nil, nil, true); end, -- Realm First! Level 80 Rogue
    function() O(t[457], "Once"); end,
    function() t[457] = a:New(457, nil, nil, nil, true); end, -- Realm First! Level 80
    function() O(t[456], "Once"); end,
    function() t[456] = a:New(456, nil, nil, nil, true); end, -- Realm First! Obsidian Slayer
    function() O(t[454], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[454] = a:New(454, f.Horde, 442, true); end, -- Scout
    function() O(t[453], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[453] = a:New(453, f.Horde, 471, true); end, -- Sergeant
    function() O(t[452], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[452] = a:New(452, f.Horde, 440, true); end, -- First Sergeant
    function() O(t[451], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[451] = a:New(451, f.Horde, 439, true); end, -- Stone Guard
    function() O(t[450], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[450] = a:New(450, f.Horde, 441, true); end, -- Senior Sergeant
    function() O(t[449], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[449] = a:New(449, f.Horde, 472, true); end, -- Blood Guard
    function() O(t[448], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[448] = a:New(448, f.Horde, 437, true); end, -- Centurion
    function() O(t[447], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[447] = a:New(447, f.Horde, 436, true); end, -- Champion
    function() O(t[446], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[446] = a:New(446, f.Horde, 473, true); end, -- General
    function() O(t[445], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[445] = a:New(445, f.Horde, 434, true); end, -- Warlord
    function() O(t[444], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[444] = a:New(444, f.Horde, 435, true); end, -- Lieutenant General
    function() O(t[443], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[443] = a:New(443, f.Horde, 433, true); end, -- High Warlord
    function() O(t[442], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[442] = a:New(442, f.Alliance, 454, true); end, -- Private
    function() O(t[441], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[441] = a:New(441, f.Alliance, 450, true); end, -- Master Sergeant
    function() O(t[440], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[440] = a:New(440, f.Alliance, 452, true); end, -- Sergeant Major
    function() O(t[439], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[439] = a:New(439, f.Alliance, 451, true); end, -- Knight
    function() O(t[438], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[438] = a:New(438, f.Alliance, 469, true); end, -- Knight-Captain
    function() O(t[437], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[437] = a:New(437, f.Alliance, 448, true); end, -- Knight-Champion
    function() O(t[436], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[436] = a:New(436, f.Alliance, 447, true); end, -- Lieutenant Commander
    function() O(t[435], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[435] = a:New(435, f.Alliance, 444, true); end, -- Commander
    function() O(t[434], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[434] = a:New(434, f.Alliance, 445, true); end, -- Field Marshal
    function() O(t[433], "From", "Version", "010400", "Before", "Version", "020001"); end,
    function() t[433] = a:New(433, f.Alliance, 443, true); end, -- Grand Marshal
    function() O(t[432]); end,
    function() t[432] = a:New(432); end, -- Champion of the Naaru
    function() O(t[431]); end,
    function() t[431] = a:New(431); end, -- Hand of A'dal
    function() O(t[430], "Never"); end,
    function() t[430] = a:New(430); end, -- Amani War Bear
    function() t[429] = a:New(429); end, -- "Sulfuras, Hand of Ragnaros"
    function() t[428] = a:New(428); end, -- "Thunderfury, Blessed Blade of the Windseeker"
    function() t[426] = a:New(426); end, -- Warglaives of Azzinoth
    function() O(t[425], "Never"); end,
    function() t[425] = a:New(425); end, -- "Atiesh, Greatstaff of the Guardian"
    function() t[424] = a:New(424); end, -- Why? Because It's Red
    function() O(t[420], "From", "PvP Season", 4, "Until", "PvP Season", 4); end,
    function() t[420] = a:New(420, nil, nil, true); end, -- Brutal Gladiator
    function() O(t[419], "From", "PvP Season", 3, "Until", "PvP Season", 3); end,
    function() t[419] = a:New(419, nil, nil, true); end, -- Vengeful Gladiator
    function() O(t[418], "From", "PvP Season", 2, "Until", "PvP Season", 2); end,
    function() t[418] = a:New(418, nil, nil, true); end, -- Merciless Gladiator
    function() O(t[416], "Never"); end,
    function() t[416] = a:New(416); end, -- Scarab Lord
    function() t[415] = a:New(415); end, -- Big Blizzard Bear
    function() t[414] = a:New(414); end, -- Tyrael's Hilt
    function() t[412] = a:New(412); end, -- Murloc Costume
    function() t[411] = a:New(411); end, -- Murky
    function() O(t[409], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[409] = a:New(409, nil, nil, true); end, -- Last Man Standing
    function() t[408] = a:New(408, nil, nil, true); end, -- Hot Streak
    function() O(t[407], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[407] = a:New(407, nil, nil, true); end, -- High Five: 1750
    function() O(t[406], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[406] = a:New(406, nil, nil, true); end, -- High Five: 1550
    function() t[405] = a:New(405, nil, nil, true); end, -- Three's Company: 2000
    function() O(t[404], "From", "Version", "030003", "Before", "Version", "070003"); end,
    function() t[404] = a:New(404, nil, nil, true); end, -- High Five: 2000
    function() t[403] = a:New(403, nil, nil, true); end, -- Three's Company: 1750
    function() t[402] = a:New(402, nil, nil, true); end, -- Three's Company: 1550
    function() t[401] = a:New(401, nil, nil, true); end, -- Just the Two of Us: 2000
    function() t[400] = a:New(400, nil, nil, true); end, -- Just the Two of Us: 1750
    function() t[399] = a:New(399, nil, nil, true); end, -- Just the Two of Us: 1550
    function() t[398] = a:New(398, nil, nil, true); end, -- Mercilessly Dedicated
    function() t[397] = a:New(397, nil, nil, true); end, -- Step Into The Arena
    function() t[396] = a:New(396, nil, nil, true); end, -- Gurubashi Arena Grand Master
    function() t[389] = a:New(389, nil, nil, true); end, -- Gurubashi Arena Master
    function() t[388] = a:New(388, f.Alliance, 1006, true); end, -- City Defender
    function() t[306] = a:New(306); end, -- Master Angler of Azeroth
    function() t[303] = a:New(303); end, -- "Have Keg, Will Travel"
    function() t[295] = a:New(295); end, -- Direbrewfest
    function() t[293] = a:New(293); end, -- Disturbing the Peace
    function() t[292] = a:New(292); end, -- Sinister Calling
    function() t[291] = a:New(291); end, -- Check Your Head
    function() t[289] = a:New(289); end, -- The Savior of Hallow's End
    function() t[288] = a:New(288); end, -- Out With It
    function() t[284] = a:New(284); end, -- A Mask for All Occasions
    function() t[283] = a:New(283); end, -- The Masquerade
    function() t[279] = a:New(279); end, -- Simply Abominable
    function() t[277] = a:New(277); end, -- 'Tis the Season
    function() t[275] = a:New(275); end, -- Veteran Nanny
    function() t[273] = a:New(273); end, -- On Metzen!
    function() t[272] = a:New(272); end, -- Torch Juggler
    function() t[271] = a:New(271); end, -- Burning Hot Pole Dance
    function() t[263] = a:New(263); end, -- Ice the Frost Lord
    function() t[260] = a:New(260); end, -- Charming
    function() t[259] = a:New(259, f.Horde, 1255); end, -- Scrooge
    function() t[255] = a:New(255); end, -- Bring Me The Head of... Oh Wait
    function() t[252] = a:New(252, nil, nil, true); end, -- With a Little Helper from My Friends
    function() t[249] = a:New(249); end, -- Dressed for the Occasion
    function() t[248] = a:New(248); end, -- Sunday's Finest
    function() t[247] = a:New(247, nil, nil, true); end, -- "Make Love, Not Warcraft"
    function() t[246] = a:New(246, f.Alliance, 1005, true); end, -- Know Thy Enemy
    function() t[245] = a:New(245, nil, nil, true); end, -- That Takes Class
    function() t[239] = a:New(239, nil, nil, true); end, -- 25000 Honorable Kills
    function() t[238] = a:New(238, nil, nil, true); end, -- An Honorable Kill
    function() t[233] = a:New(233, nil, nil, true); end, -- Bloodthirsty Berserker
    function() t[231] = a:New(231, nil, nil, true); end, -- Wrecking Ball
    function() t[230] = a:New(230, f.Alliance, 1175, true); end, -- Battlemaster
    function() t[229] = a:New(229, nil, nil, true); end, -- The Grim Reaper
    function() t[227] = a:New(227, nil, nil, true); end, -- Damage Control
    function() t[226] = a:New(226, nil, nil, true); end, -- The Alterac Blitz
    function() t[225] = a:New(225, f.Alliance, 1164, true); end, -- Everything Counts
    function() t[224] = a:New(224, f.Horde, 1151, true); end, -- Loyal Defender
    function() t[223] = a:New(223, nil, nil, true); end, -- The Sickly Gazelle
    function() t[222] = a:New(222, nil, nil, true); end, -- Tower Defense
    function() t[221] = a:New(221, nil, nil, true); end, -- Alterac Grave Robber
    function() t[220] = a:New(220, f.Alliance, 873, true); end, -- Stormpike Perfection
    function() t[219] = a:New(219, nil, nil, true); end, -- Alterac Valley Veteran
    function() t[218] = a:New(218, nil, nil, true); end, -- Alterac Valley Victory
    function() t[216] = a:New(216, nil, nil, true); end, -- Bound for Glory
    function() t[214] = a:New(214, nil, nil, true); end, -- Flurry
    function() t[213] = a:New(213, nil, nil, true); end, -- Stormtrooper
    function() t[212] = a:New(212, nil, nil, true); end, -- Storm Capper
    function() t[211] = a:New(211, nil, nil, true); end, -- Storm Glory
    function() t[209] = a:New(209, nil, nil, true); end, -- Eye of the Storm Veteran
    function() t[208] = a:New(208, nil, nil, true); end, -- Eye of the Storm Victory
    function() t[207] = a:New(207, nil, nil, true); end, -- Save the Day
    function() t[206] = a:New(206, f.Alliance, 1252, true); end, -- Supreme Defender
    function() t[204] = a:New(204, nil, nil, true); end, -- Ironman
    function() t[203] = a:New(203, f.Alliance, 1251, true); end, -- Not In My House
    function() t[202] = a:New(202, f.Alliance, 1502, true); end, -- Quick Cap
    function() t[201] = a:New(201, nil, nil, true); end, -- Warsong Expedience
    function() t[200] = a:New(200, nil, nil, true); end, -- Persistent Defender
    function() t[199] = a:New(199, nil, nil, true); end, -- Capture the Flag
    function() t[168] = a:New(168, nil, nil, true); end, -- Warsong Gulch Perfection
    function() t[167] = a:New(167, nil, nil, true); end, -- Warsong Gulch Veteran
    function() t[166] = a:New(166, nil, nil, true); end, -- Warsong Gulch Victory
    function() t[165] = a:New(165, nil, nil, true); end, -- Arathi Basin Perfection
    function() t[162] = a:New(162, nil, nil, true); end, -- We Had It All Along *cough*
    function() t[161] = a:New(161, nil, nil, true); end, -- Resilient Victory
    function() t[159] = a:New(159, nil, nil, true); end, -- Let's Get This Done
    function() t[158] = a:New(158, nil, nil, true); end, -- Me and the Cappin' Makin' it Happen
    function() t[157] = a:New(157, nil, nil, true); end, -- To The Rescue!
    function() t[156] = a:New(156, nil, nil, true); end, -- Territorial Dominance
    function() t[155] = a:New(155, nil, nil, true); end, -- Arathi Basin Veteran
    function() t[154] = a:New(154, nil, nil, true); end, -- Arathi Basin Victory
    function() t[153] = a:New(153); end, -- The Old Gnome and the Sea
    function() t[150] = a:New(150); end, -- The Fishing Diplomat
    function() t[144] = a:New(144); end, -- The Lurker Above
    function() t[141] = a:New(141); end, -- Ultimate Triage
    function() t[137] = a:New(137); end, -- Stocking Up
    function() O(t[135], "From", "Version", "030003", "Before", "Version", "080001"); end,
    function() t[135] = a:New(135); end, -- Grand Master Medic
    function() O(t[134], "From", "Version", "020003", "Before", "Version", "080001"); end,
    function() t[134] = a:New(134); end, -- Master Medic
    function() O(t[133], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[133] = a:New(133); end, -- Artisan Medic
    function() O(t[132], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[132] = a:New(132); end, -- Expert Medic
    function() O(t[131], "From", "Version", "000304", "Before", "Version", "080001"); end,
    function() t[131] = a:New(131); end, -- Journeyman Medic
    function() t[130] = a:New(130); end, -- Northrend Fisherman
    function() t[129] = a:New(129); end, -- Outland Fisherman
    function() t[128] = a:New(128); end, -- Artisan Fisherman
    function() t[127] = a:New(127); end, -- Expert Fisherman
    function() t[126] = a:New(126); end, -- Journeyman Fisherman
    function() t[125] = a:New(125); end, -- Northrend Cook
    function() t[124] = a:New(124); end, -- Outland Cook
    function() t[123] = a:New(123); end, -- Classic Cook
    function() t[122] = a:New(122); end, -- Expert Cook
    function() t[121] = a:New(121); end, -- Journeyman Cook
    function() t[116] = a:New(116); end, -- Professional Journeyman
    function() t[73] = a:New(73, nil, nil, true); end, -- Disgracin' The Basin
    function() t[46] = a:New(46); end, -- Universal Explorer
    function() t[45] = a:New(45); end, -- Northrend Explorer
    function() t[44] = a:New(44); end, -- Outland Explorer
    function() t[43] = a:New(43); end, -- Kalimdor Explorer
    function() t[42] = a:New(42); end, -- Eastern Kingdoms Explorer
    function() t[41] = a:New(41); end, -- Loremaster of Northrend
    function() t[40] = a:New(40); end, -- Icecrown: The Final Goal
    function() t[39] = a:New(39); end, -- Into the Basin
    function() t[38] = a:New(38); end, -- The Summit of Storm Peaks
    function() t[37] = a:New(37, f.Alliance, 1357); end, -- Fo' Grizzle My Shizzle
    function() t[36] = a:New(36); end, -- The Empire of Zul'Drak
    function() t[35] = a:New(35, f.Alliance, 1359); end, -- Might of Dragonblight
    function() t[34] = a:New(34, f.Alliance, 1356); end, -- I've Toured the Fjord
    function() t[33] = a:New(33, f.Alliance, 1358); end, -- Nothing Boring About Borean
    function() t[32] = a:New(32); end, -- 2000 Quests Completed
    function() t[31] = a:New(31); end, -- A Simple Re-Quest
    function() O(t[16], "From", "Version", "000304", "Before", "Version", "040001"); end,
    function() t[16] = a:New(16); end, -- Did Somebody Order a Knuckle Sandwich?
    function() t[15] = a:New(15); end, -- Plenty of Pets
    function() O(t[13], "From", "Version", "030003", "Before", "Version", "090001"); end,
    function() t[13] = a:New(13); end, -- Level 80 (Legacy)
    function() O(t[12], "From", "Version", "020003", "Before", "Version", "090001"); end,
    function() t[12] = a:New(12); end, -- Level 70 (Legacy)
    function() O(t[11], "From", "Version", "000304", "Before", "Version", "090001"); end,
    function() t[11] = a:New(11); end, -- Level 60 (Legacy)
    function() O(t[10], "From", "Version", "000304", "Before", "Version", "090001"); end,
    function() t[10] = a:New(10); end, -- Level 50 (Legacy)
    function() t[9] = a:New(9); end, -- Level 40
    function() t[8] = a:New(8); end, -- Level 30
    function() t[7] = a:New(7); end, -- Level 20
    function() t[6] = a:New(6); end, -- Level 10
};

function exportedAchievements.Load(tbl, tmog, ids)
    t, u = tbl, tmog;
    wipe(t);
    local name = "Achievements";
    addon.Diagnostics.Debug(name .. ": Start loading data");
    addon.StartWork(name, workload, name .. ": Finished loading data", true);

    ids = {};
    for i = 1, 19107 do
        if t[i] ~= nil then
            tinsert(ids, i);
        end
    end
end