# Zone placement proposals for the never-placed metas (sweep tranche 2) — 2026-09-05

**Rated and applied 2026-09-05.** The user accepted sections A to H as proposed and answered section I: (1) Realm First! feats are skipped under a rule of their own, not the real-world-event rule, to be revisited; (2) a meta is placed on every map a child is on, instances included (the "verdict boundary" is gone); (3) 1038 in the Slave Pens, 1683 in Blackrock Depths, 18959 on Scarlet Monastery; (4) D11 explained, still open. Section G was done the same day by migrating the Dragonflight fallback entries of `ExportedUiMaps.lua` into `Retail/10_Dragonflight/ZoneData.lua`. Application record: `raw/ZoneDataDecisions.md`, "Sweep tranche 2". Lessons: wiki `zone-data-format.md`, decision record. The original text follows unchanged.

Proposals only. Nothing below has been applied. Rate each row, I apply the accepted ones through `_apply_zone_plan.ps1`, log them in `raw/ZoneDataDecisions.md`, and write the lessons from your ratings into the rules and the wiki decision record.

## How to rate

Fill the **Rating** cell: `ok` (apply as proposed), `no` (do not place; say why in Note), `adj` (place, but change the map set; say how in Note). Leave blank to defer. The Note cell is free text; a one-word reason is enough. Ratings and notes become the "lessons" section of the wiki page, so a `no` with a reason teaches more than an `ok`.

## What the proposals rest on

- **Children and their maps** come from the game's criteria trees (DBC export of build 12.1.0.69587, type-8 "complete achievement" criteria followed transitively) and the current ZoneData files. Rule 3: a meta goes on every map a child is on.
- **Basis of each child's placement** was checked: `instance` (child sits only on Dungeon/Raid/Scenario/Battleground maps), `criteria` (the child's own criteria name the map it is on), or `convention` (placed by hand, no criteria fact). The Valorous case taught that convention-placed children can drag a meta somewhere absurd, so every `convention` case was read by hand.
- **Verdict boundary**: an open-world meta is not pushed into instances; an instance meta (all placed children in instances) is placed on the instances. Mixed metas get the open-world part only, and the row says so.
- **Registration**: 17 of the 132 candidates are hidden tracking achievements the addon never registers (Allied Races unlock requirements, `<Hidden>` unlock flags, raid-portal trackers, "char specific hidden copy" duplicates). Placing an unregistered id is a data-load error, so they are `skip`.
- **Confidence**: `H` deterministic (instance children, or zone children with criteria backing); `M` a boundary or convention judgment is involved, or the set is large; `L` I would not defend it strongly.
- Sources beyond the DB were not needed for the mechanics; where Warcraft Wiki knowledge decides a set (Brewfest grounds, Winter Veil Scrooge targets) the row says so.

Count: 115 never-placed metas (sections A to G: 94 proposed, 17 skipped as unregistered, 4 deferred) plus 7 second-order cascades from tranche 1 (section H). Map lists longer than eight are given as a count with the rule that produces them; the exact ids are what the lint prints for that meta.

## A. Dungeon, raid and battleground metas (Rule 3 over instance children)

Every child is an instance achievement already on its instance. The meta is added to each of those instances. This is what raid Glory metas and Glory of the Delver already do.

| ID | Title | Proposed maps | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 1283 | Classic Dungeonmaster | 19 Vanilla dungeons (213, 219, 220, 221, 225, 226, 230, 235, 242, 250, 279, 280, 291, 300, 301, 310, 317, 435, 476) | H | 19 children, one per dungeon, all on their dungeon | | |
| 1284 | Outland Dungeonmaster | 16 TBC dungeons (246, 256, 258, 260, 261, 262, 263, 265, 266, 267, 269, 272, 273, 274, 347, 348) | H | 16 children | | |
| 1287 | Outland Dungeon Hero | same 16 TBC dungeons | H | Heroic versions of the same children | | |
| 1285 | Classic Raider | 232 Molten Core, 247 Ruins of Ahn'Qiraj, 287 Blackwing Lair, 319 Ahn'Qiraj | H | 4 children | | |
| 1286 | Outland Raider | 329, 330, 331, 332, 334, 335, 339, 350 | H | 8 children | | |
| 1288 | Northrend Dungeonmaster | 12 WotLK dungeons (129, 130, 132, 133, 136, 138, 140, 143, 154, 157, 160, 168) | H | 12 children | | |
| 1289 | Northrend Dungeon Hero | same 12 | H | Heroic children | | |
| 2136 | Glory of the Hero | same 12 | H | 37 boss-feat children across the 12 dungeons; item 11 of the sweep backlog | | |
| 2137 | Glory of the Raider (10 player) | 141 The Eye of Eternity, 155 The Obsidian Sanctum, 162 Naxxramas | H | 16 children | | |
| 2138 | Glory of the Raider (25 player) | same 3 | H | | | |
| 2957 | Glory of the Ulduar Raider (10 player) | 147 Ulduar | H | legacy FoS, still a meta of Ulduar feats | | |
| 2958 | Glory of the Ulduar Raider (25 player) | 147 Ulduar | H | | | |
| 12401 | Glory of the Ulduar Raider | 147 Ulduar | H | the merged post-Cataclysm version | | |
| 4602 | Glory of the Icecrown Raider (10 player) | 186 Icecrown Citadel | H | | | |
| 4603 | Glory of the Icecrown Raider (25 player) | 186 Icecrown Citadel | H | | | |
| 4844 | Cataclysm Dungeon Hero | 9 Cata heroics (277, 283, 291, 293, 297, 310, 322, 324, 325) | H | | | |
| 4845 | Glory of the Cataclysm Hero | 8 of those (no 322 Throne of the Tides: no child feat there) | H | children are the boss feats; 4844 itself is a child (unplaced today, placed by the row above) | | |
| 4853 | Glory of the Cataclysm Raider | 285 Blackwing Descent, 294 The Bastion of Twilight, 328 Throne of the Four Winds | H | | | |
| 5506 | Defender of a Shattered World | the 9 Cata heroics + the 3 Cata raids | H | 12 children | | |
| 5828 | Glory of the Firelands Raider | 367 Firelands | H | | | |
| 6169 | Glory of the Dragon Soul Raider | 409 Dragon Soul | H | | | |
| 6925 | Pandaria Dungeon Hero | 9 MoP dungeons (429, 431, 435, 437, 439, 443, 453, 457, 476) | H | | | |
| 6927 | Glory of the Pandaria Hero | same 9 | H | | | |
| 6932 | Glory of the Pandaria Raider | 456 Terrace of Endless Spring, 471 Mogu'shan Vaults, 474 Heart of Fear | H | | | |
| 8124 | Glory of the Thundering Raider | 508 Throne of Thunder | H | | | |
| 8454 | Glory of the Orgrimmar Raider | 556 Siege of Orgrimmar | H | | | |
| 8985 | Glory of the Draenor Raider | 596 Blackrock Foundry, 610 Highmaul | H | | | |
| 9255 / 9631 | Mythic Draenor Raider (A / H) | 596, 610 | H | faction mirror pair | | |
| 9391 | Draenor Dungeon Hero | 8 WoD dungeons (573, 574, 593, 595, 601, 606, 616, 620) | H | | | |
| 9396 | Glory of the Draenor Hero | 7 of those (no 601 Skyreach feat placed) | H | | | |
| 10149 | Glory of the Hellfire Raider | 661 Hellfire Citadel | H | | | |
| 18804 | Neltharion's Legacy | 2166 Aberrus | H | | | |
| 41597 | Glory of the Omega Raider | 2460 Manaforge Omega | H | | | |
| 42029 | The Emerald Nightmare | 777 | H | Legion raid tier metas (Normal+ clears) | | |
| 42030 | The Nighthold | 764 | H | | | |
| 42031 | Tomb of Sargeras | 850 | H | | | |
| 42032 | Antorus, the Burning Throne | 909 | H | | | |
| 41209 | Dressed to Kill: Battle for Azeroth | 1148 Uldir, 1352 Battle of Dazar'alor, 1512 The Eternal Palace, 1580 Ny'alotha | H | appearance children are on the raids | | |
| 61565 | War Within Dungeon Hero | 10 TWW dungeons (2303, 2308, 2315, 2335, 2341, 2343, 2357, 2359, 2387, 2449) | H | | | |
| 61566 | Glory of the War Within Hero | same 10 | H | | | |
| 61567 | Midnight Dungeon Hero | 8 Midnight dungeons (2433, 2492, 2500, 2501, 2511, 2513, 2556, 2572) | H | | | |
| 61568 | Glory of the Midnight Hero | same 8 | H | | | |
| 1175 / 1176 | Battlemaster (A / H) | 91 Alterac Valley, 92 Warsong Gulch, 93 Arathi Basin, 112 Eye of the Storm | H | Master-of children on their battlegrounds; BG entries hold BG metas | | |
| 8052 / 8055 | Khan (A / H) | 169 Isle of Conquest, 206 Twin Peaks, 275 The Battle for Gilneas, 417 Temple of Kotmogu, 423 Silvershard Mines | H | | | |
| 7385 | Pub Crawl | 447 A Brewing Storm, 448 The Jade Forest (scenario), 450 Unga Ingoo, 452 Brewmoon Festival | H | Brewmaster scenario children; Scenario entries are instance-like | | |
| 20004 | Heroic: Pandaria Scenarios | 447, 481 Crypt of Forgotten Kings, 520, 523, 524 (scenario maps) | H | Remix meta; scenario children | | |
| 20005 | Heroic: Pandaria Dungeons | the 9 MoP dungeons | H | | | |
| 20006 | Pandaria Raids | 456, 471, 474, 508, 556 | H | | | |
| 20007 | Heroic: Pandaria Raids | same 5 | H | | | |
| 19881 | Escalation | 416, 520, 523, 524 (scenario maps) + 556 Siege of Orgrimmar | M | Remix-only meta (Timerunner); children are scenario clears and a Raid Finder clear. Rule places it; the obtainability filter hides it outside Remix | | |
| 18959 | Don't Lose Your Head, Man | 435 Scarlet Monastery | H | Headless Horseman child is on Scarlet Monastery; second child (A Cleansing Fire) is unplaced | | |
| 20481 | Dragonflight Season 4 Master | 2119 Vault of the Incarnates, 2166 Aberrus, 2232 Amirdrassil | M | children are the Heroic: Awakened raid clears; the Keystone Master S4 child is a season-wide keystone (D11): if D11 goes to "season pool", the S4 dungeons join | | |
| 61858 | Light of the Party | 2533 March on Quel'Danas | M | child Mythic: Midnight Falls is there; the Keystone Hero S1 and Elite S1 children are D11 / PvP | | |
| 63473 | Sssensational! | 2606 The Venomous Abyss | M | same shape as 61858 | | |
| 11761 | Azeroth's Next Top Model | 44 raids (every raid a class-set appearance child is on, Molten Core to The Voidspire) | M | Rule 3 is unambiguous; the cost is that every raid lists it. Say `no` if the noise outweighs it | | |

## B. Open-world zone metas (Rule 3 over zone children)

Children are zone achievements already on their zones. Mixed metas get the open-world part only.

| ID | Title | Proposed maps | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 20596 | Loremaster of Khaz Algar | 2248 Isle of Dorn, 2214 The Ringing Deeps, 2215 Hallowfall, 2213 City of Threads (Azj-Kahet group) | H | zone-quest and Sojourner children | | |
| 40231 | The War Within Pathfinder | same 4 | H | | | |
| 40352 / 40353 / 40354 | Khaz Algar Completionist: Bronze / Silver / Gold | same 4 | H | race children per zone | | |
| 40702 | Khaz Algar Glyph Hunter | same 4 | H | | | |
| 40790 | Khaz Algar Explorer | same 4 | H | | | |
| 40097 | Ruffious's Bid | same 4 | H | Tour of Duty children per zone | | |
| 41201 | You Xal Not Pass | same 4 + 2369 Siren Isle | H | | | |
| 61451 | Worldsoul-Searching | 2248, 2214, 2215, 2213 (via child 40231), 2346 Undermine, 2371 K'aresh, 2369 Siren Isle (via 41201) | M | hidden-flagged but registered; mixed meta: the 21 delve/raid children are excluded by the boundary | | |
| 40955 | War Stories | 862 Zuldazar, 863 Nazmir, 864 Vol'dun, 895 Tiragarde Sound, 896 Drustvar, 942 Stormsong Valley, 1161 Boralus, 1164 Dazar'alor, 1355 Nazjatar, 1462 Mechagon Island, 63 Ashenvale | H | war-campaign children; Ashenvale via 13251 (quest POI, tranche 1) | | |
| 40956 | I'm On Island Time | 862, 863, 864, 895, 896, 942, 1161, 1164 | H | | | |
| 40953 | A Farewell to Arms | the 11 open-world maps above + 1473 Chamber of Heart | M | mixed meta; 15 instance children (dungeons, raids, Horrific Visions) excluded by the boundary | | |
| 40958 | Full Heart, Can't Lose | 1473 Chamber of Heart (verdict Zone) | H | Heart of Azeroth children are there | | |
| 40959 | Black Empire State of Mind | 1527 Uldum, 1530 Vale of Eternal Blossoms | H | assault children (8.3 revamp maps, Rule 7 respected: these children were introduced by 8.3) | | |
| 41202 | Hot Tropic | 862, 863, 864, 1164 | H | | | |
| 41203 | Bwon Voyage | 863 Nazmir | H | | | |
| 41204 | Dune Squad | 864 Vol'dun | H | | | |
| 41205 | Sound Off | 895, 896, 942, 1161 | H | children include Kul Tiras-wide quest chains | | |
| 41206 | Songs of Storms | 942 Stormsong Valley | H | | | |
| 41207 | When the Drust Settles | 896 Drustvar | H | | | |
| 42114 | Broken Memories | 630 Azsuna, 634 Stormheim, 641 Val'sharah, 650 Highmountain, 680 Suramar | H | | | |
| 63635 | Tokka's Terrible Trials | 2512 The Coiled Isle | H | | | |
| 15654 / 20501 | Back from the Beyond (Legacy / current) | 1543 The Maw, 1618 Torghast, 1698 Seat of the Primus, 1699 Sinfall, 1701 Heart of the Forest, 1707 Elysian Hold, 1970 Zereth Mortis | M | mixed expansion meta; the 12 dungeon/raid children are excluded by the boundary. If you would rather see the expansion meta inside its raids too, say `adj: include instances` and I will make that a rule variant | | |
| 5845 | A Bunch of Lunch | 84 Stormwind City, 85 Orgrimmar, 87 Ironforge, 88 Thunder Bluff, 89 Darnassus, 90 Undercity | H | one Let's Do Lunch child per capital (Rule 6 city content) | | |
| 5851 | Gone Fishin' | same 6 capitals | H | Fish or Cut Bait children | | |

## C. Holiday metas (Rule 3; children partly convention-placed, read by hand)

| ID | Title | Proposed maps | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 1656 | Hallowed Be Thy Name | the 55 maps 971 Tricks and Treats of Azeroth is on (old-world zones and capitals) | H | 971 is a child; the other placed child (289 Savior of Hallow's End, 6 starting zones) is a subset. The "anywhere" children (Check Your Head, G.N.E.R.D. Rage, ...) add nothing, correctly | | |
| 1038 / 1039 | The Flame Warden / The Flame Keeper | 46 old-world zones + 125 Dalaran (the union of 1034 to 1037 plus Torch Juggler in Dalaran); **not** 265 The Slave Pens | M | 47 of 48 candidate maps are zones; Ice the Frost Lord (Ahune, Slave Pens) is excluded by the boundary. Say `adj` if the holiday meta should also show inside the Slave Pens | | |
| 1683 | Brewmaster | 242 Blackrock Depths | M | the only placed child is Direbrewfest (Coren Direbrew in BRD), so the boundary rule makes this an instance meta. Honest alternative: the Brewfest grounds (27 Dun Morogh, 1 Durotar) are where The Brewfest Diet and the Wolpertinger quest happen (Wiki); if you prefer that, say `adj: 27, 1 instead of / as well as 242` and I place those two children first | | |
| 1691 | Merrymaker | 25 Hillsbrad Foothills (On Metzen!), 85 Orgrimmar and 87 Ironforge (Simply Abominable), 88 Thunder Bluff (Scrooge, Alliance) | M | the Horde Scrooge (1255, snowball Muradin in Ironforge) is unplaced but would add nothing new. Other children are "anywhere" (Let It Snow, With a Little Helper) or the Greench/Metzen quests already counted | | |
| 2144 | What a Long, Strange Trip It's Been | the union of every map the holiday metas above land on (today: the 37 maps of 913 To Honor One's Elders; after this tranche also the sets of 1038/1039, 1656, 1691, 1683) | M | the biggest old-world meta; it will show in every old-world zone and capital. Say `no` if that is too much for the Current Zone view | | |

## D. Profession metas

| ID | Title | Proposed maps | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 1516 | Accomplished Angler | 84 Stormwind City, 85 Orgrimmar (Fishing Diplomat), 125 Dalaran (The Coin Master), 108 Terokkar Forest (Mr. Pinchy, Old Man Barlowned), 210 The Cape of Stranglethorn (Master Angler of Azeroth); **not** 332 Serpentshrine Cavern | M | The Lurker Above is a raid child, excluded by the boundary. Eight children are "anywhere" fishing counts | | |
| 1563 | Hail to the Chef | 111 Shattrath City (Kickin' It Up a Notch) | M | the only placed child. Note: the Dalaran cooking dailies (Our Daily Bread, Second That Emotion, Critter Gitter, Dinner Impossible) would put 125 Dalaran here once those children are placed by Rule 5; I recommend doing that together: `adj: + 125` | | |

## E. Realm First! feats

| ID | Title | Proposed maps | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 1463 | Realm First! Northrend Vanguard | 114 Borean Tundra, 115 Dragonblight, 118 Icecrown, 121 Zul'Drak, 125 Dalaran | L | children are the four reputation achievements (convention-placed). Rule 3 says place; the achievement is a realm-first feat nobody can earn any more, so the value is nil. My recommendation: `no`, and a rule line "Realm First! feats are skipped" | | |
| 6829 | Realm First! Pandaren Ambassador | the 9 Pandaria zones its two children are on | L | same reasoning: recommend `no` | | |

## F. Skip: hidden tracking achievements the addon does not register

Not in any AchievementData file, so they cannot be placed (the data-load lint would fail) and the addon never shows them. Logged as `⏭ skipped` with reason "hidden tracking achievement, not registered".

| IDs | What they are | Rating | Note |
|---|---|---|---|
| 12445, 12446, 12447, 12448, 13089, 13092, 13159, 13160, 13991, 13993 | Allied Races: … Unlock Requirements | | |
| 13258, 13259 | `<Hidden>` Kings' Rest / Siege of Boralus unlocked | | |
| 16414, 20480 | `[HIDDEN]` raid-portal trackers (Shadowlands, Dragonflight) | | |
| 40024, 40028 | "char specific hidden copy" duplicates of The Descent into Madness and Zandalar Forever! | | |
| 41085 | Worm Theory (copy), hidden flag set | | |

## G. Deferred: needs entries that do not exist yet

Dragonflight's ZoneData has five entries in total (Ruby Life Pools, Algeth'ar Academy, the three raids): no zones, six dungeons missing. These metas resolve to almost nothing today for that reason alone.

| ID | Title | Would be | Conf | Rating | Note |
|---|---|---|---|---|---|
| 16294 | Dragonflight Dungeon Hero | all 8 DF dungeons once their entries exist (2071, 2073, 2080, 2082, 2093, 2094, 2097 + Brackenhide Hollow) | H after entries | | |
| 16295 | Glory of the Dragonflight Hero | same | H after entries | | |
| 16339 | Myths of the Dragonflight Dungeons | same | H after entries | | |
| 19458 | A World Awoken | the DF zones 2022, 2023, 2024, 2025, 2133 Zaralek Cavern, 2200 Emerald Dream (via Loremaster, Pathfinder, Que Zara(lek), Dream On children) once zone entries exist; the 3 raids are excluded by the boundary | M | | |

Proposal: a Dragonflight zone-data pass (zones, dungeons, delves-equivalents) is its own sweep item before these four.

## H. Second-order cascades from tranche 1 (apply with the accepted rows above)

| ID | Title | Add to | Conf | Evidence | Rating | Note |
|---|---|---|---|---|---|---|
| 1034 | The Fires of Azeroth | 106 Bloodmyst Isle | H | child 1023 was placed there in tranche 1c (criterion names the zone) | | |
| 1035 | Desecration of the Horde | 26 The Hinterlands | H | child 1028 | | |
| 1037 | Desecration of the Alliance | 26 The Hinterlands | H | child 1031 | | |
| 7520 | The Loremaster | 10 Northern Barrens, 21 Silverpine Forest, 25 Hillsbrad Foothills, 76 Azshara, 95 Ghostlands | H | Loremaster of Kalimdor / Eastern Kingdoms were completed in tranche 1 | | |
| 10748 | Fighting with Style: Valorous | 749 The Arcway, 761 Court of Stars | H | Glory of the Legion Hero was completed there; these are Legion dungeons, unlike the Shadowlands case | | |
| 13250 | Battle for Azeroth Pathfinder, Part Two | 1161 Boralus, 1164 Dazar'alor | H | child 12989 Part One was placed there | | |
| 19880 | Isle of Thunder | 507 Isle of Giants | H | child Looking For Group: Isle of Thunder is there | | |

## I. What I would change in the rules if you agree

1. **Realm First! feats are skipped** (section E), like real-world-event feats.
2. **Expansion metas and instances** (Back from the Beyond, A Farewell to Arms, A World Awoken): the boundary rule keeps them out of raids and dungeons. If you rate those `adj: include instances`, the rule becomes "an expansion meta is placed on every map a child is on, instances included", and the lint's boundary gets an exception for metas whose children span both worlds.
3. **Holiday bosses in dungeons** (Ahune in the Slave Pens, Coren Direbrew in BRD, the Headless Horseman in Scarlet Monastery): today the boundary decides case by case (Brewmaster lands in BRD because it has no placed open-world child; The Flame Warden stays out of the Slave Pens because it has). Your ratings on 1038, 1683 and 18959 will fix the rule either way.
4. **D11** (season-wide Mythic+ achievements on the season's dungeon pool) decides three rows here (20481, 61858, 63473).

## Your lessons for me

Free text, anything you noticed while rating: what I should have caught, which evidence was missing, which groups you would not want proposed again.

-
