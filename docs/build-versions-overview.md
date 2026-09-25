# Build versions overview

Every patch that the achievement data refers to, on both clients: when it shipped and what it was, the label the addon gives it, how many achievements were added in it and how many `Obtainable()` anchors name it. This is the input for deciding how to handle build versions; it describes the current state and proposes nothing.

Generated 2026-09-25. The counts come from the data files, and the totals match the headless loader exactly (Retail 8637, Classic 2752 achievements registered). Patch facts come from warcraft.wiki.gg patch pages, Blizzard news, Wowhead and Blizzard Watch.

## How to read the tables

- **Added**: achievements whose patch key is this patch (`AchievementData["EE_PP_SS"]`, Shared blocks counted on both clients), including the mirror id an `AutoFactionSplit` registers. This is the number the build-version filter and the "Added in" tooltip work from.
- **Anchors**: `Obtainable()` arguments that name this patch as a `Version`, as seen by that client (Shared plus the client's own files). A plain number means only `Before`; otherwise the breakdown is `B` Before, `F` From, `U` Until.
- **Status**:
  - `added`: registered, and achievements were added in it.
  - `anchor-only`: registered only so an anchor can name it; the filter hides it (`BuildVersion.InUse` is false).
  - `timeline target`: registered on Classic only as a right-hand value in `DataAddons/Classic/ContentTimeline.lua`.
  - `not reached`: a Retail patch Classic has not reached; the anchor resolves to "no end scheduled" by design.
- **Classic reached at**: the `ContentTimeline` mapping. *(missing)* means research shows the content shipped on Classic but the table has no entry.
- **Type**: `PP` pre-patch, `L` launch, `PP+L` pre-patch the expansion also launched on, `C` named content patch, `m` minor or unnamed, `CL` Classic re-release phase.
- **Addon label**: the `addon.L[...]` name in `BuildVersionData.lua`. Where Retail and Classic differ, both are shown.

## Per expansion
| Expansion | Retail: achievements | Retail: patches with achievements | Retail: in minor patches | Retail: anchors | Classic: achievements | Classic: patches with achievements | Classic: anchors |
|---|--:|--:|--:|--:|--:|--:|--:|
| 3 Wrath of the Lich King | 1288 | 7 | 20 | 2 | 1375 | 11 | 4 |
| 4 Cataclysm | 489 | 8 | 7 | 34 | 509 | 10 | 33 |
| 5 Mists of Pandaria | 804 | 7 | 3 | 12 | 868 | 10 | 12 |
| 6 Warlords of Draenor | 684 | 4 | 11 | 103 |  |  | 101 |
| 7 Legion | 751 | 6 | 156 | 217 |  |  | 152 |
| 8 Battle for Azeroth | 726 | 6 | 31 | 71 |  |  | 43 |
| 9 Shadowlands | 593 | 8 | 65 | 29 |  |  | 10 |
| 10 Dragonflight | 1224 | 11 | 44 | 12 |  |  | 4 |
| 11 The War Within | 1186 | 10 | 0 | 12 |  |  | 2 |
| 12 Midnight | 892 | 4 | 0 | 16 |  |  |  |
| **Total** | **8637** | | | **508** | **2752** | | **361** |

"In minor patches" counts achievements added in patches of type `m`.

## Every patch
| Patch | Date (NA) | Official name | Type | Addon label | Retail: added | Retail: anchors | Retail status | Classic: added | Classic: anchors | Classic status | Classic reached at | Notes |
|---|---|---|---|---|--:|--:|---|--:|--:|---|---|---|
| **3.x** | | **Wrath of the Lich King** | | | | | | | | | | |
| 3.0.2 | 2008-10-14 | Echoes of Doom | PP | Wrath of the Lich King | 908 |  | added | 908 |  | added | 3.4.0 | Achievement system introduced; WotLK launched 2008-11-13 on 3.0.3 |
| 3.1.0 | 2009-04-14 | Secrets of Ulduar | C | Secrets of Ulduar | 203 |  | added | 203 |  | added | 3.4.1 | Ulduar, dual spec, Argent Tournament |
| 3.2.0 | 2009-08-04 | Call of the Crusade | C | Call of the Crusade | 79 |  | added | 79 |  | added | 3.4.2 | Trial of the Crusader, Isle of Conquest |
| 3.2.2 | 2009-09-22 | - (5th Anniversary Celebration) | m | 5th Anniversary Celebration | 17 |  | added | 17 |  | added | 3.4.2 | Level-80 Onyxia's Lair (5th anniversary) |
| 3.3.0 | 2009-12-08 | Fall of the Lich King | C | Fall of the Lich King | 73 | 2 | added | 73 | 2 | added | 3.4.3 | Icecrown Citadel, Frozen Halls, Dungeon Finder |
| 3.3.3 | 2010-03-23 | - | m | Fall of the Lich King | 3 |  | added | 3 |  | added | 3.4.3 | Random Battleground queue, Call to Arms, holiday bosses in the Dungeon Finder. Its Operation: Gnomeregan and Zalazane's Fall ids first appear in this build; the events were added in 3.3.5 |
| 3.3.5 | 2010-06-22 | Defense of the Ruby Sanctum | C | Defense of the Ruby Sanctum | 5 |  | added | 5 |  | added | 3.4.3 | Ruby Sanctum |
| 3.4.0 | 2022-08-30 / 09-26 | Wrath Classic Phase 1 | CL | Wrath of the Lich King |  |  |  | 28 |  | added |  | Pre-patch and launch: Naxxramas, EoE, OS (original 3.0.x) |
| 3.4.1 | 2023-01-17 | Phase 2: Secrets of Ulduar | CL | Secrets of Ulduar |  |  |  | 17 |  | added |  | Ulduar (original 3.1.0); Titan Rune dungeons are Classic-only |
| 3.4.2 | 2023-06-20 | Phase 3: Call of the Crusade | CL | Call of the Crusade |  |  |  | 26 |  | added |  | ToC and Onyxia 80 (original 3.2.0 + 3.2.2); Argent Tournament (original 3.1.0) held back to here |
| 3.4.3 | 2023-10-10 | Phase 4: Fall of the Lich King | CL | Fall of the Lich King |  |  |  | 16 | 2 | added |  | ICC and Dungeon Finder (original 3.3.0); Ruby Sanctum (3.3.5) unlocked 2024-01-11 with no patch change |
| **4.x** | | **Cataclysm** | | | | | | | | | | |
| 4.0.1 | 2010-10-12 | Cataclysm Systems | PP | Cataclysm (pre-patch) | 9 | 14 | added | 9 | 15 | added | 4.4.0 | Talent revamp, guild system |
| 4.0.3 | 2010-11-23 | The Shattering | PP+L | Cataclysm (pre-patch) | 335 | 20 | added | 337 | 18 | added | 4.4.0 | **Label:** labelled pre-patch; it is the Shattering and the launch line. Old-world revamp; Cataclysm launched 2010-12-07 on 4.0.3a |
| 4.0.6 | 2011-02-08 | - | m | Cataclysm | 3 |  | added | 3 |  | added | 4.4.0 | Class changes |
| 4.1.0 | 2011-04-26 | Rise of the Zandalari | C | Rise of the Zandalari | 19 |  | added | 19 |  | added | *(missing)* | Zul'Aman and Zul'Gurub heroics |
| 4.2.0 | 2011-06-28 | Rage of the Firelands | C | Rage of the Firelands | 56 |  | added | 56 |  | added | 4.4.1 | Firelands, Molten Front |
| 4.2.2 | 2011-08-30 | - | m | Rage of the Firelands | 1 |  | added | 1 |  | added | 4.4.1 | Minor |
| 4.3.0 | 2011-11-29 | Hour of Twilight | C | Hour of Twilight | 63 |  | added | 63 |  | added | *(missing)* | Dragon Soul, End Time dungeons, transmog, LFR, Darkmoon Island |
| 4.3.2 | 2012-01-31 | - | m | Hour of Twilight | 3 |  | added | 3 |  | added | *(missing)* | Minor |
| 4.4.0 | 2024-04-30 / 05-20 | Cata Classic Phase 1 | CL | Cataclysm |  |  |  | 4 |  | added |  | Pre-patch and launch (original 4.0.x); ZA/ZG (original 4.1.0) unlocked 2024-07-30 with no patch change; no guild leveling |
| 4.4.1 | 2024-10-29 | Phase 3: Rage of the Firelands | CL | Rage of the Firelands |  |  |  | 14 |  | added |  | Firelands (original 4.2.0); Elemental Rune dungeons are Classic-only |
| 4.4.2 | 2025-02-18 | Phase 4: Hour of Twilight | CL | *(not registered)* |  |  |  | 0 |  |  |  | Dragon Soul (original 4.3.0), no Raid Finder. Not registered: no achievements added |
| **5.x** | | **Mists of Pandaria** | | | | | | | | | | |
| 5.0.4 | 2012-08-28 | MoP pre-patch | PP | Mists of Pandaria (pre-patch) | 475 |  | added | 475 |  | added | 5.5.0 | Talents, Monks, pet battles |
| 5.0.5 | 2012-09-11 | - | m/L | Mists of Pandaria | 0 | 1 | anchor-only | 0 | 1 | anchor-only | 5.5.0 | MoP launched 2012-09-25 on the 5.0.5 line |
| 5.1.0 | 2012-11-27 | Landfall | C | Landfall | 51 |  | added | 51 |  | added | 5.5.1 | Pandaria campaign, Brawler's Guild |
| 5.2.0 | 2013-03-05 | The Thunder King | C | The Thunder King | 102 | 6 | added | 102 | 6 | added | 5.5.3 | Isle of Thunder, Throne of Thunder |
| 5.3.0 | 2013-05-21 | Escalation | C | Escalation | 50 |  | added | 50 |  | added | *(missing)* | Battlefield: Barrens, heroic scenarios |
| 5.4.0 | 2013-09-10 | Siege of Orgrimmar | C | Siege of Orgrimmar | 123 | 5 | added | 123 | 5 | added | 5.5.4 | Siege of Orgrimmar, Timeless Isle, Flex raids |
| 5.4.1 | 2013-10-29 | - | m | Siege of Orgrimmar | 2 |  | added | 2 |  | added | *(missing)* | Bug fixes, built-in Recruit-A-Friend |
| 5.4.2 | 2013-12-10 | - | m | Siege of Orgrimmar | 1 |  | added | 1 |  | added | *(missing)* | Minor (Celestial Tournament) |
| 5.5.0 | 2025-07-01 / 07-21 | MoP Classic Phase 1 | CL | Mists of Pandaria |  |  |  | 20 |  | added |  | Pre-patch and launch (original 5.0.x); MSV, HoF, ToES unlocked in stages with no patch change; no Raid Finder |
| 5.5.1 | 2025-09-23 | Phase 2: Landfall | CL | Landfall |  |  |  | 26 |  | added |  | Original 5.1.0 |
| 5.5.3 | 2025-12-09 | Phase 3: Rise of the Thunder King | CL | The Thunder King |  |  |  | 18 |  | added |  | Original 5.2.0. 5.5.2 (2025-10-28) was maintenance only; 5.5.3a (2026-03-31) delivered original 5.3.0 Escalation |
| 5.5.4 | 2026-06-02 | Phase 5: Siege of Orgrimmar | CL | Siege of Orgrimmar |  |  |  | 0 |  | timeline target |  | Original 5.4.0 (+ Celestial Tournament, 5.4.2, unconfirmed); final phase, current live Classic |
| **6.x** | | **Warlords of Draenor** | | | | | | | | | | |
| 6.0.2 | 2014-10-14 | The Iron Tide | PP | Warlords of Draenor | 471 | 102 (98 B, 4 F) | added |  | 101 (96 B, 5 F) | - | not reached | **Label:** pre-patch labelled as the launch. Stat squish, Iron Horde invasion |
| 6.0.3 | 2014-10-28 | - | m/L | Warlords of Draenor | 0 | 1 (1 F) | anchor-only |  |  |  |  | WoD launched 2014-11-13 on it |
| 6.1.0 | 2015-02-24 | Garrison Update | C | Garrisons Update | 62 |  | added |  |  |  |  | Garrison additions, heirloom collection |
| 6.2.0 | 2015-06-23 | Fury of Hellfire | C | Fury of Hellfire | 140 |  | added |  |  |  |  | Hellfire Citadel, Tanaan Jungle |
| 6.2.2 | 2015-09-01 | - | m | Fury of Hellfire | 11 |  | added |  |  |  |  | Draenor flying |
| **7.x** | | **Legion** | | | | | | | | | | |
| 7.0.3 | 2016-07-19 | Legion pre-patch | PP+L | Legion | 341 | 69 (68 B, 1 U) | added |  | 12 | - | not reached | Demon Hunters; Legion launched 2016-08-30 on it |
| 7.1.0 | 2016-10-25 | Return to Karazhan | C | *(not registered)* | 0 |  |  |  |  |  |  | Not registered: no achievement data or anchor names it |
| 7.1.5 | 2017-01-10 | - | m | Return to Karazhan | 0 | 2 | anchor-only |  |  |  |  | **Label:** inherits 7.1.0's name; 7.1.0 is not registered. Brawler's Guild return, micro-holidays, MoP Timewalking |
| 7.2.0 | 2017-03-28 | The Tomb of Sargeras | C | The Tomb of Sargeras | 168 |  | added |  |  |  |  | Broken Shore, class mounts |
| 7.2.5 | 2017-06-13 | - | m | The Tomb of Sargeras | 11 | 4 | added |  |  |  |  | Black Temple Timewalking |
| 7.3.0 | 2017-08-29 | Shadows of Argus | C | Shadows of Argus | 86 | 2 | added |  |  |  |  | Argus, Antorus |
| 7.3.2 | 2017-10-24 | - | m | Shadows of Argus | 25 |  | added |  |  |  |  | Minor |
| 7.3.5 | 2018-01-16 | - | m | Shadows of Argus | 120 | 140 | added |  | 140 | - | not reached | Level scaling, first allied races, Ulduar Timewalking |
| **8.x** | | **Battle for Azeroth** | | | | | | | | | | |
| 8.0.1 | 2018-07-17 | BfA pre-patch | PP+L | Battle for Azeroth | 355 | 63 | added |  | 35 | - | not reached | Stat squish; BfA launched 2018-08-14 on it |
| 8.1.0 | 2018-12-11 | Tides of Vengeance | C | Tides of Vengeance | 100 |  | added |  |  |  |  | Battle of Dazar'alor, Darkshore warfront |
| 8.1.5 | 2019-03-12 | - | m | Tides of Vengeance | 24 |  | added |  |  |  |  | Kul Tiran / Zandalari allied races, Crucible of Storms |
| 8.2.0 | 2019-06-25 | Rise of Azshara | C | Rise of Azshara | 149 | 1 | added |  | 1 | - | not reached | Nazjatar, Mechagon, Eternal Palace |
| 8.2.5 | 2019-09-24 | - | m | Rise of Azshara | 7 |  | added |  |  |  |  | 15th anniversary, Party Sync |
| 8.3.0 | 2020-01-14 | Visions of N'Zoth | C | Visions of N'Zoth | 91 | 7 | added |  | 7 | - | not reached | Horrific Visions, Ny'alotha |
| **9.x** | | **Shadowlands** | | | | | | | | | | |
| 9.0.1 | 2020-10-13 | Shadowlands pre-patch | PP | Shadowlands (pre-patch) | 265 | 27 | added |  | 10 | - | not reached | Level squish |
| 9.0.2 | 2020-11-17 | - | L | Shadowlands | 49 |  | added |  |  |  |  | Shadowlands launched 2020-11-23 |
| 9.0.5 | 2021-03-09 | - | m | Shadowlands | 5 |  | added |  |  |  |  | Valor, covenant tuning |
| 9.1.0 | 2021-06-29 | Chains of Domination | C | Chains of Domination | 106 | 2 | added |  |  |  |  | Korthia, Sanctum of Domination |
| 9.1.5 | 2021-11-02 | - | m | Chains of Domination | 12 |  | added |  |  |  |  | Legion Timewalking |
| 9.2.0 | 2022-02-22 | Eternity's End | C | Eternity's End | 108 |  | added |  |  |  |  | Zereth Mortis, Sepulcher |
| 9.2.5 | 2022-05-31 | - | m | Eternity's End | 46 |  | added |  |  |  |  | Cross-faction instances |
| 9.2.7 | 2022-08-16 | - | m | Eternity's End | 2 |  | added |  |  |  |  | Region-wide commodity AH |
| **10.x** | | **Dragonflight** | | | | | | | | | | |
| 10.0.0 | 2022-10-25 | Dragonflight pre-patch | PP | Dragonflight (pre-patch) | 357 | 2 | added |  |  |  |  | Talents, UI overhaul |
| 10.0.2 | 2022-11-15 | - | L | Dragonflight | 25 | 3 | added |  |  |  |  | Dragonflight launched 2022-11-28 |
| 10.0.5 | 2023-01-24 | - | m | Trading Post | 44 |  | added |  |  |  |  | Trading Post |
| 10.0.7 | 2023-03-21 | Return to the Forbidden Reach | C | Return to the Forbidden Reach | 50 |  | added |  |  |  |  | Forbidden Reach |
| 10.1.0 | 2023-05-02 | Embers of Neltharion | C | Embers of Neltharion | 140 |  | added |  |  |  |  | Zaralek Cavern, Aberrus |
| 10.1.5 | 2023-07-11 | Fractures in Time | C | Fractures in Time | 56 |  | added |  |  |  |  | Dawn of the Infinite |
| 10.1.7 | 2023-09-05 | Fury Incarnate | C | Fury Incarnate | 195 | 1 | added |  | 1 | - | not reached | Dreamsurges |
| 10.2.0 | 2023-11-07 | Guardians of the Dream | C | Guardians of the Dream | 122 | 2 | added |  |  |  |  | Emerald Dream, Amirdrassil |
| 10.2.5 | 2024-01-16 | Seeds of Renewal | C | Seeds of Renewal | 28 | 4 | added |  | 3 | - | not reached | Bel'ameth, follower dungeons |
| 10.2.6 | 2024-03-19 | Plunderstorm | C | Plunderstorm | 49 |  | added |  |  |  |  | Plunderstorm event |
| 10.2.7 | 2024-05-07 | Dark Heart | C | Dark Heart | 158 |  | added |  |  |  |  | Dark Heart campaign, MoP Remix |
| **11.x** | | **The War Within** | | | | | | | | | | |
| 11.0.0 | 2024-07-23 | TWW pre-patch | PP | The War Within (pre-patch) | 372 | 2 | added |  |  |  |  | Warbands |
| 11.0.2 | 2024-08-13 | The War Within | L | The War Within | 10 |  | added |  |  |  |  | TWW launched 2024-08-26 |
| 11.0.5 | 2024-10-22 | 20th Anniversary Celebration | C | WoW's 20th Anniversary | 34 |  | added |  |  |  |  | BRD Timewalking raid |
| 11.0.7 | 2024-12-17 | Siren Isle | C | Siren Isle | 65 |  | added |  |  |  |  | Siren Isle |
| 11.1.0 | 2025-02-25 | Undermine(d) | C | Undermine(d) | 156 | 1 | added |  |  |  |  | Undermine, Liberation of Undermine |
| 11.1.5 | 2025-04-22 | - (headline: Nightfall) | C | Nightfall | 58 |  | added |  |  |  |  | **Label:** descriptive, not official. Nightfall scenario, Horrific Visions Revisited |
| 11.1.7 | 2025-06-17 | Legacy of Arathor | C | Legacy of Arathor | 12 |  | added |  |  |  |  | Red Dawn campaign, Lorewalking |
| 11.2.0 | 2025-08-05 | Ghosts of K'aresh | C | Ghosts of K'aresh | 141 | 3 | added |  | 1 | - | not reached | K'aresh, Manaforge Omega |
| 11.2.5 | 2025-10-07 | Legion Remix | C | Legion Remix | 253 | 1 | added |  |  |  |  | Legion Remix event, 21st anniversary |
| 11.2.7 | 2025-12-02 | The Warning | C | The Warning | 85 | 5 (5 F) | added |  | 1 (1 F) | - | not reached | Housing early access |
| **12.x** | | **Midnight** | | | | | | | | | | |
| 12.0.0 | 2026-01-20 | Midnight Pre-Expansion | PP | Midnight | 556 |  | added |  |  |  |  | **Label:** pre-patch labelled as the launch. Devourer DH spec, stat squish |
| 12.0.1 | 2026-02-10 | Midnight Pre-Expansion & Launch | L | Midnight | 0 | 3 | anchor-only |  |  |  |  | Midnight launched 2026-03-02 |
| 12.0.5 | 2026-04-21 | Lingering Shadows | C | Lingering Shadows | 94 |  | added |  |  |  |  | Void Assaults |
| 12.0.7 | 2026-06-16 | Revelations | C | Revelations | 36 |  | added |  |  |  |  | Sporefall raid |
| 12.1.0 | 2026-08-11 | Curse of Ula'tek | C | The Curse of Ula'tek | 206 | 13 | added |  |  |  |  | **Label:** official name has no "The". Coiled Isle, Venomous Abyss |

## What stands out

### Where achievements land

- **The pre-patch carries the expansion.** 3.0.2 (908), 4.0.3 (335), 5.0.4 (475), 6.0.2 (471), 7.0.3 (341), 8.0.1 (355), 9.0.1 (265), 10.0.0 (357), 11.0.0 (372) and 12.0.0 (556) hold 4435 of Retail's 8637 achievements (51 %). The expansion's achievement ids first appear in the pre-patch client, even though most of them only become earnable at launch. The launch patches themselves hold little: 6.0.3 (0), 9.0.2 (49), 10.0.2 (25), 11.0.2 (10), 12.0.1 (0).
- This changes the reading of the "label" findings. Labelling 12.0.0 "Midnight" is not wrong for a player: 556 Midnight launch achievements carry that label. Labelling 10.0.0 "Dragonflight (pre-patch)" is literally correct but puts the pre-patch tag on 357 launch achievements. The labels are inconsistent (6.0.2, 7.0.3, 8.0.1 and 12.0.0 are named after the expansion; 4.0.1, 4.0.3, 5.0.4, 9.0.1, 10.0.0 and 11.0.0 carry "(pre-patch)"), but the fix could go either way. Naming by content ("what players got") suits the filter better than naming by build.
- **Minor patches are small but numerous.** 18 unnamed minor patches add achievements. Most add under 50; the exception is 7.3.5 (120, allied races and level scaling). Before Dragonflight they carry the name of the content patch before them (7.2.5 "The Tomb of Sargeras", 8.1.5 "Tides of Vengeance"). 10.0.5 is labelled after its headline feature ("Trading Post"). From 10.0.7 on, every patch except 11.1.5 has an official name.
- **Shared data stops at 5.4.2**, as expected. Everything from 3.0.2 to 5.4.2 is registered on both clients with identical labels, and the only differences in achievement counts are per-client entries (Retail housing-decor rewards, Classic title flags).

### Where anchors land

- Five patches take 401 of Retail's 508 anchors: 7.3.5 (140), 6.0.2 (102), 7.0.3 (69), 8.0.1 (63) and 9.0.1 (27). All five are system overhauls (level scaling, stat and level squishes, a new expansion's systems) that ended old content. Anchors cluster on patches that *removed* things, while achievements cluster on patches that *added* things. The two sets overlap, but they are not the same set.
- Four Retail patches exist only for anchors: 5.0.5, 6.0.3, 7.1.5 and 12.0.1. All four are launch or follow-up patches with no achievements of their own.
- On Classic, 312 anchors name Retail patches from 6.0.2 on, which Classic has not reached; the loader's 330 also counts the copies on faction-split mirrors. Classic's own data anchors on 3.4.3 twice, and on Retail patches 4.0.1, 6.0.2, 7.0.3 and 11.2.0.

### Classic timeline

- Classic re-releases replay one original content patch per phase: 3.4.0-3.4.3, 4.4.0-4.4.2 and 5.5.0-5.5.4. Blizzard regularly opens content **without a patch change**: Ruby Sanctum came inside 3.4.3, Zul'Aman and Zul'Gurub inside 4.4.0, and the first three MoP raids were staggered inside 5.5.0. MoP Classic 5.5.2 was maintenance only, and original 5.3.0 shipped as **5.5.3a**, which the build-version id cannot express. The Classic side therefore needs a lookup table; it cannot be derived from the patch number.
- `ContentTimeline.lua` has no entry for 4.1.0, 4.3.0, 4.3.2, 5.3.0, 5.4.1 and 5.4.2, although the content shipped (4.4.0, 4.4.2, 5.5.3a, 5.5.4). Nothing anchors on them today, so there is no visible effect; the table only matters for anchors.
- Classic phases that added no achievements are not registered (4.4.2, 5.5.2, 5.5.3a), while 5.5.4 is registered only as a timeline target.
- The current Classic client is MoP Classic 5.5.4, the final phase (`.toc` interface 50504). Wrath and Cata Classic are gone in the West. China still runs Wrath 3.4.5 and "Titan Reforged" on client 3.80.x, which would sort after 3.4.x and 4.4.x on the single version axis. WoW: Forever launches 2026-11-04 on its own 1.x numbering.

### Label fixes independent of any design choice

- 7.1.5 "Return to Karazhan": the name belongs to 7.1.0, which is not registered at all. Low impact, since 7.1.5 is anchor-only and appears only in the Time Limited tooltip.
- 12.1.0 "The Curse of Ula'tek": the official name is "Curse of Ula'tek".
- 11.1.5 "Nightfall": descriptive, not official (the patch has no name).

## Reproducing the numbers

Achievements per patch: count the `Ach(` lines per `AchievementData["EE_PP_SS"]` block, skipping comments, plus one for each `AutoFactionSplit`. Anchors: count `"From"|"Before"|"Until", "Version", {M, m, p}`. Shared files count toward both clients. Check the totals against `.claude/tools/headless/load-data.lua`, which reports the registered count per client.