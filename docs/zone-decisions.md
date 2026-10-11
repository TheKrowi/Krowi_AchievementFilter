# Zone placement decisions

This file records why the zone placement rules are what they are. The binding rule text is in `.claude/skills/add-zone-data/SKILL.md` (Zone Placement Rules 1 to 12 and the Entry Type Rules); this file holds the reason behind each rule and the decisions D1 to D15 (D1 to D14 taken during the reconciliation sweep of 2026-09). Decisions about single achievements live in `raw/ZoneDataDecisions.md`.

## Placement model

A map lists **achievement ids** (D1). The finer model, listing the *criterion* that belongs to each map so an achievement disappears from zone 1 once its zone-1 criterion is done, was considered on 2026-09-05 and deferred:

- the gain is limited to multi-zone leaves (Pet Maulers, Explorers, Elders); everything else hides on completion already;
- criteria ids are less stable than achievement ids across Retail and Classic, and a per-zone criterion check costs one API call per achievement per zone change;
- nothing written today blocks it: a placement line can later grow a criterion index, and the runtime change is display-only.

The tooling therefore *derives* placement from criteria (`raw/Evaluate-ZoneCriteria.ps1`) while the files store achievements. Data is criteria-correct; the runtime is achievement-granular.

## Why each rule exists

Numbers and short names follow the Zone Placement Rules in SKILL.md, which hold the full text.

| # | Rule | Why |
|---|---|---|
| 1 | No continent entries; a link group is one entry | A player is never "in" a continent: `C_Map.GetBestMapForUnit` returns the zone or sub-zone, so the Current Zone category never looks up a continent map. Continent blocks only duplicated zone data and drifted from it. The World Map button needs no continent data either: on a continent or world map it shows the union of the zones below (D2). Whole link groups because the lookup is flat: a floor or district shows the zone's list only when its map id is in the entry. |
| 2 | Leaf placement follows the criteria | The criteria tree is the only placement fact the game itself provides, and it is machine-checkable. "Anywhere in the world" is not a zone, so a leaf with no place is skipped. |
| 3 | A meta goes on every map a child is on, instances included | Current Zone should say "you can progress this here", and a meta progresses wherever one of its children does, inside an instance as much as outdoors (D3). `shared.*` tables keep cross-expansion metas in one place. |
| 4 | Reputation | Reputation is progressed where it is earned, not where the tabard vendor stands (D4). |
| 5 | Quest chains | A zone counts where a quest of the chain is completed: the player progresses the chain there and stands there when the achievement completes. Picking up a breadcrumb is not progress (D10). |
| 6 | Cities | Inside the walls `GetBestMapForUnit` returns the city map; mirroring city content on the surrounding zone would double every capital's list on its zone (D5). |
| 7 | Zone revamps: no backfill | Old achievements were designed for the old map; the revamp patch's own achievements use the new id (D9 applies it to Dalaran). |
| 8 | The zone's expansion chooses the file | One place to look per map. Retail-only ids in a Shared file are skipped by the game on Classic, so the client does not need to choose the file. The exception is an id whose content sits on a different map per client: a Shared file cannot tell the clients apart, so the ids that differ go in a client-specific file (D15). |
| 9 | Ambiguous test | "The title sounds like it" produced the wrong placements the 2026-09-04 validation found. |
| 10 | Backfill | Grandfathering old data would keep two conventions alive forever (D7). |
| 11 | Verify zone names and file paths | Prose derived from memory was wrong in six Zone ID cells and eight file paths of the log (validation of 2026-09-04). |
| 12 | Removals flow back into the log | The log is the audit trail; a stale "added" row is worse than none (174 stayed "added" after the dangling-reference cleanup removed it). |

## Decisions

### D1 (2026-09-05) Achievement-based or criteria-based placement

Should a map store criteria or achievements? Decision: achievements per map; the tooling derives placement from criteria. Consequence: see Placement model above.

### D2 (2026-09-04, confirmed 2026-09-05) Continent entries

Should Continent-type maps keep their `Zone()` blocks? Decision: no Continent map gets an entry, and the existing blocks were removed. Consequence: sweep tranche 1 removed twelve blocks, each id redistributed by criteria: 12 and 13 (`Shared/01_Vanilla`), 101 (`Shared/02_TheBurningCrusade`), 113 (`Shared/03_WrathOfTheLichKing`), 424 (`Shared/05_MistsOfPandaria`), 947 (`Shared/ZoneData.lua`), 572 (`Retail/06_WarlordsOfDaenor`), 619 (`Retail/07_Legion`), 875 and 876 (`Retail/08_BattleForAzeroth`), 1550 (`Retail/09_Shadowlands`) and 2537 Quel'Thalas (`Retail/12_Midnight`, labelled a zone in the file but a Continent in `raw/MapVerifier.csv`). The Dragon Isles fallback entry was dropped with the Dragonflight migration in tranche 2. `raw/Evaluate-ZoneData.ps1` Check 5 flags a Continent map in any entry. The World Map button lost its continent data with the blocks; since 2026-09-06 (7a7c1d7e) it shows the union of the Zone-type maps below a continent or world map instead (`GetAchievementsForMap` in `Gui/WorldMapButton/WorldMapButtonMixin.lua`).

### D3 (2026-09-05) How far metas follow their criteria

Does a meta follow its children transitively, one level, or not at all for global metas? Decision: transitively, and literally: a meta goes on every map one of its children is on, instances included. Consequence: The Loremaster, World Safari and Universal Explorer are on every zone their leaves cover; dungeon Glory metas are on every dungeon of their expansion; The Flame Warden is in the Slave Pens, Brewmaster in Blackrock Depths, Don't Lose Your Head, Man in Scarlet Monastery, Back from the Beyond and A Farewell to Arms on their raids and dungeons as well as their zones, Master of Wintergrasp in Vault of Archavon. The only exclusions are children placed by convention rather than by criteria (none left since D11) and achievements that are never placed: unregistered hidden achievements and Realm First! feats (D12).

### D4 (2026-09-05) Reputation placement

Every zone that grants the reputation, the quartermaster's zone only, or the criteria-named zones? Decision: every open-world zone that grants it, per the faction's Warcraft Wiki reputation table, quartermaster's zone included. Consequence: 897 You're So Offensive moved from Eastern Kingdoms to Isle of Quel'Danas (122) and left Magisters' Terrace; the Reason cell of the log records the Wiki page.

### D5 (2026-09-05) Cities

City only, city plus surrounding zone, or treat a city as a zone? Decision: city only, with content progressed inside the city. Consequence: no capital is mirrored on its zone. Explore criteria that name a city inside a zone are D8.

### D6 (2026-09-05) Pet Mauler trio

Do 6558 to 6560 have a geographic association? Decision: yes; their criteria name 67 zones from Durotar to Vale of Eternal Blossoms (`_lookup_criteria.ps1`), and they go on every one. Consequence: `shared.OldWorldPetAchievements` is spliced into every zone the criteria name, Cataclysm and Pandaria zones included, and removed from zones they do not name. Never claim "no geographic association" without running the criteria lookup.

### D7 (2026-09-05) Existing violations

One planned sweep, going-forward only with an ignore list, or fix on touch? Decision: one reconciliation sweep, after which the rules bind old data too (Rule 10). Consequence: the backlog is section "4." of the Validation 2026-09-04 part of `raw/ZoneDataDecisions.md` (items 9 to 12 and the tranche notes), with `raw/Evaluate-ZoneCriteria.ps1` as the evidence; the old Rule 5 "flag and ask" was replaced by Rule 10. The sweep ran in three tranches on 2026-09-05 and 2026-09-06.

### D8 (2026-09-05) Explore criteria that name an inner map

"Explore Dun Morogh" has the criterion "Ironforge", "Explore Tanaris" has "Caverns of Time". Does the zone's achievement also go on the inner map? Decision: per map, no general rule. A **City** never gets it (Explore Durotar / Orgrimmar, Explore Teldrassil / Darnassus, Explore the Isle of Dorn / Dornogal). **Outdoor sub-maps**: yes for Caverns of Time 74, Slayer's Rise 2444, the covenant sanctums Seat of the Primus 1698, Heart of the Forest 1701 and Elysian Hold 1707, and Deeprun Tram 499 (a new entry for Field Photographer); no for Blackrock Mountain 33, Bizmo's Brawlpub 500 (whose map is also called "Deeprun Tram") and Amirdrassil 2239 (the criterion is the Amirdrassil sub-area of the Emerald Dream map 2200, not the separate map). Consequence: the yes/no table is `$d8SubMaps` in `raw/Evaluate-ZoneCriteria.ps1`, which reports a sub-map not in it as `[D8? ]` until decided. Taking the Show on the Road (6030/6031) and Field Photographer (9924) are not D8 cases: their criteria are performed inside the capitals, so Rule 6 places them there (Dalaran is D9).

### D9 (2026-09-05) Two Dalarans

Criteria that say "Dalaran" (6030/6031 Taking the Show on the Road, 9924 Field Photographer) match both 125 (Northrend) and 627 (Broken Isles). Decision: Dalaran 125 only, by Rule 7: the achievements predate the Legion move, so the moved city gets no backfill. Silvermoon City follows the same reasoning (110, not the Midnight 2393). Consequence: 6030, 6031 and 9924 are on 125.

### D10 (2026-09-05) Capitals that only host a breadcrumb

Does a capital count for Rule 5 when it only hosts the intro breadcrumb of a quest chain? Decision: no. A zone counts only where a quest of the chain is completed; accepting a quest is not completing one. Quest POI rows on a capital of another expansion (Stormwind, Orgrimmar and Dornogal for the Midnight chains 62191 and 42117) are ignored. Consequence: no data change.

### D11 (2026-09-05, applied 2026-09-06) Season-wide Mythic+ achievements

Fighting with Style: Valorous (10748) cascaded onto the Shadowlands dungeons because its child Keystone Challenger (11184) sat there. Where do season-wide and season-independent keystone achievements go? Decision: a season-wide achievement (a season's Keystone Explorer/Conqueror/Master/Hero, season titles) goes on every dungeon of that season's pool, the instance analogue of "anywhere on continent X"; the four season-independent Legion ones (11162, 11183, 11184, 11185: a keystone of any dungeon in any season) are "anywhere" leaves and were removed from the eight Shadowlands dungeons. Consequence, sweep tranche 3: each season's pool is derived from game data, the "Keystone Hero: <Dungeon>" achievements in that season's Mythic+ category block of `DataAddons/Shared/CategoryData.lua` plus the dungeon names in the season achievements' own criteria (Battle for Azeroth seasons and Shadowlands Season 1 list their pool there). The derived pools reproduced the hand-placed Battle for Azeroth and Shadowlands seasons exactly; Battle for Azeroth Season 4 is additionally on Mechagon by hand. 900 lines were added for Shadowlands Season 3 and 4, Dragonflight 1 to 4, The War Within 1 to 3 and Midnight 1 and 2, plus 93 Rule 3 cascades (Season Master/Hero metas onto their dungeons). A dungeon name shared by two expansions (Magisters' Terrace 348/2511) resolves to the map the season's own Keystone Hero is on. Raid-tier metas in a season block (Deep Cuts From the Vault, Dragonflight Season N Master/Hero) are left to Rule 3 and never pushed onto the pool.

### D12 (2026-09-05) Realm First! feats

Place them by their children like any meta, or skip them? Decision: skip (1463 Realm First! Northrend Vanguard, 6829 Realm First! Pandaren Ambassador). This is a rule of its own, not the real-world-event rule, and may be revisited. Consequence: the children (reputation achievements) stay placed; the feats are in `$skipMetas` of `raw/Evaluate-ZoneCriteria.ps1`.

### D13 (2026-09-05, corrected 2026-09-06) Intro maps

Welcome to Draenor (8921/8922) has its only quest on the intro Tanaan Jungle map 577, Exile's Reach (14222) lives on 1409, and Dracthyr, Awaken (15325/15638) starts on the intro Forbidden Reach map 2118; all three maps had verdict Skip. Decision: intro maps get an entry and the verdict StartingZone. Consequence: entries for Tanaan Jungle `{577, 578}` (Warlords file), Exile's Reach `{1409, 1609, 1610}` (Shadowlands file, with Darkmaul Citadel linked in game) and 2118 (Dragonflight file). Dracthyr, Awaken is also on The Forbidden Reach group 2100 (through The War Creche 2109) and on the capital of its final turn-in (Stormwind 84 / Orgrimmar 85). StartingZone may hold entries but stays Skip-like for the world map (`_mapverifier_io.ps1`); the verdict flips were made in the in-game Map Verifier and exported, never in the CSV. The old Forbidden Reach map 2107 from the fallback table keeps verdict Skip. The fallback `ExportedUiMaps.lua` lost its last entry and was retired (4aade947).

### D14 (2026-09-05, corrected 2026-09-06) The Corruptor's End

Where does 14157 The Corruptor's End go? Decision: Uldum 1527, Vale of Eternal Blossoms 1530 and Chamber of Heart 1473; War Stories (40955) follows as its parent (Rule 3). Its one criterion, the quest "Ny'alotha, the Waking City: The Corruptor's End" (58632), has quest POI rows on exactly those three maps, so the decision rests on game data.

### D15 (2026-10-11) One achievement, a different map per client

1307 Upper Blackrock Spire (Classic) and 2188 Leeeeeeeeeeeeeroy! sat on Upper Blackrock Spire 616 to 618 twice on Retail, from a Shared Vanilla block and from the Retail Warlords of Draenor block. The Classic build has no map 616 (its uimap table stops at 536 maps): Classic keeps Upper Blackrock Spire inside Blackrock Spire 250 to 255, so on Classic the two showed nowhere. On Retail, 250 is Lower Blackrock Spire only; Drakkisath and the Rookery moved to 616 in 6.0.2, so the Rule 7 answer (old map only) would point Retail players at a dungeon that no longer holds either. Decision: each client gets the map where the content is. The Shared 616 block was removed, Retail keeps 616 in its Warlords of Draenor file, and a new `DataAddons/Classic/01_Vanilla/ZoneData.lua` adds the two ids to Blackrock Spire 250 next to the Shared block, which the runtime merges on Classic. Consequence: Rule 8 gains the exception that a client-specific `ZoneData.lua` holds only the ids whose map differs per client; the snapshot line `lists fed by >1 key` counts these merges per map (six on Classic for this case, one per Blackrock Spire map).