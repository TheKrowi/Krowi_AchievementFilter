# Zone Data Format

> Sources: `Api/ZoneDataBuilder.lua`, `Api/ZoneDataApi.lua`, `DataAddons/*/ZoneData.lua`, `Globals.lua` (`addon.GetAchievementsInZone`), the placement-rule interview of 2026-09-05.
> Operational checklist for adding data: `.claude/skills/add-zone-data/SKILL.md` (the numbered rules there are the binding text; this page carries the rationale, the decision record and the data model).

## Overview

ZoneData tells the addon which achievements belong to which map. Two consumers read it, both through `addon.GetAchievementsInZone(mapId)` in `Globals.lua`:

- the **Current Zone** special category, keyed by `C_Map.GetBestMapForUnit("player")`, so by the zone or sub-zone the player stands in;
- the **World Map button**, keyed by the map the player is looking at.

The lookup is flat: `addon.Data.Maps[mapId].Achievements`, no parent walk, no continent inheritance, no link-group expansion. Every map that should show an achievement has to be listed explicitly. That single fact drives most of the rules below.

## Data model

One `ZoneData.lua` per expansion folder, never per patch:

```
DataAddons/Shared/XX_Expansion/ZoneData.lua   -- zones that exist on Retail and Classic
DataAddons/Retail/XX_Expansion/ZoneData.lua   -- Retail-only expansions
DataAddons/Shared/ZoneData.lua                -- cross-expansion shared.* tables
```

A file registers a group and adds entries through the builder:

```lua
local _, addon = ...
local shared = addon.Data.ZoneData.Shared
local zoneData = KrowiAF.NewZoneData("TheWarWithin")   -- one group per file, keyed by expansion name ("Vanilla", "CrossExpansion", ...)

local delves = {                                    -- file-local table, defined once, spliced by reference
    shared.CrossExpansionDelves,
    40631, -- War Within Delves: Tier 1
}

zoneData:Zone({2248, 2328}, { -- Isle of Dorn (zone)      whole link group as the map argument
    40831, -- Explore the Isle of Dorn
    quelThalas,                                     -- nested tables are flattened recursively
})
zoneData:Zone(147, nil, { 2894 }, { 2895 })        -- WotLK raid: 10-player and 25-player lists
```

`KrowiAF.AddZoneData` (in `Api/ZoneDataApi.lua`) runs at `PLAYER_LOGIN` and appends the ids to `addon.Data.Maps[mapId].Achievements` (`Achievements10` / `Achievements25` for the raid form) for each listed map id. Repeated map ids merge, so "one block per link group" is a readability convention, not a runtime constraint. Ids are written as `N, -- Title` lines with the DB title; no trailing semicolons.

## Placement model: achievements, not criteria (decision D1)

A map lists **achievement ids**. The finer model, listing the *criterion* that belongs to each map so an achievement disappears from zone 1 once its zone-1 criterion is done, was considered on 2026-09-05 and deferred:

- the gain is limited to multi-zone leaves (Pet Maulers, Explorers, Elders); everything else hides on completion already;
- criteria ids are less stable than achievement ids across Retail and Classic, and a per-zone criterion check costs one API call per achievement per zone change;
- nothing written today blocks it: a placement line can later grow a criterion index, and the runtime change is display-only.

The tooling therefore *derives* placement from criteria (`raw/Evaluate-ZoneCriteria.ps1`) while the files store achievements. Data is criteria-correct; the runtime is achievement-granular.

## Placement rules, with the reasoning

The binding wording is in the skill file; the twelve rules are summarised here with the why.

| # | Rule | Why |
|---|---|---|
| 1 | No Continent-type map ever gets an entry. | A player is never "in" a continent; the Current Zone category can never hit one. Continent blocks only duplicated zone data and drifted from it. Cost accepted: the World Map button is disabled on continent maps until the runtime aggregates child zones (a later code change). |
| 2 | A leaf achievement goes on every map its criteria name, in every expansion. Areas resolve to the zone that contains them, NPCs to their spawn zones, quests to where they complete. A leaf with no place at all is skipped. | The criteria tree is the only fact the game itself provides; it is machine-checkable. "Anywhere in the world" is not a zone. |
| 3 | A meta goes on the transitive union of its leaves' maps, stopping at the verdict boundary. | Current Zone should say "you can progress this here". Shared tables keep cross-expansion metas maintainable. Dungeon Glory metas therefore sit on every dungeon, like raid Glory already did. |
| 4 | Reputation: every open-world zone that grants it, quartermaster zone included; instances only when the reputation is instance-only. | Rep is progressed where it is earned, not where the tabard vendor stands. |
| 5 | Quest chains: every zone hosting at least one quest of the chain, city turn-ins included. | The player stands there when the achievement completes. |
| 6 | Cities hold only city-progressed content and are never mirrored on the surrounding zone. | Inside the walls `GetBestMapForUnit` returns the city map; mirroring would double every capital's list on its zone. |
| 7 | Zone revamps: no backfill onto the new map id. | Old achievements were designed for the old map; the revamp patch's own achievements use the new id. |
| 8 | The zone's expansion chooses the file, never the achievement's patch or client. | One place to look per map; Retail-only ids in a Shared file are skipped by the game on Classic. |
| 9 | Every placement is backed by a checkable fact (criteria, Wiki location, instance). Two equal candidates or none means ask. | "The title sounds like it" produced the wrong placements the 2026-09-04 validation found. |
| 10 | One reconciliation sweep, then the rules bind old data too; a missing zone found during research is fixed in the same change. | Grandfathering would keep the two conventions alive forever. |
| 11 | Zone names and file paths in the log are verified against the real file. | Prose derived from memory was wrong in six cells and eight paths. |
| 12 | Removals re-classify the log row in the same commit. | The log is the audit trail; a stale "added" row is worse than none. |

Entry types filter what rules 2 to 6 produce, by the `verdict` column of `raw/MapVerifier.csv`: Zone, City, Dungeon, Raid, Delve, Battleground, Scenario and ClassHall each admit their own kind of content; Continent, StartingZone, TaxiAndAdventure and Skip never get an entry. The skill file lists what each admits.

## Decision record

One paragraph per decision: date, question, options, decision, consequence. Newest last.

**D1 (2026-09-05) Achievement-based or criteria-based placement?** Options: store criteria per map; store achievements per map and derive from criteria. Decision: achievements per map, tooling derives from criteria. Consequence: see "Placement model" above; revisit once the sweep is done and the Current Zone panel has been looked at in game.

**D2 (2026-09-04, confirmed 2026-09-05) Continent entries.** Options: remove blocks and accept a disabled World Map button on continents; remove after a runtime aggregation change; keep as legacy. Decision: remove now, accept the button cost, aggregation later. Consequence: nine blocks (12, 13, 101, 113, 572, 619, 875, 876, 1550) and the Quel'Thalas 2537 block go in the sweep; `Evaluate-ZoneData.ps1` Check 5 flags any return.

**D3 (2026-09-05) How far do metas follow their criteria?** Options: transitive union of leaves; one level; skip global metas. Decision: transitive. Consequence: The Loremaster, World Safari, Universal Explorer land on every zone their leaves cover; dungeon Glory metas go on every dungeon of their expansion. I first added a "verdict boundary" (an open-world meta is not pushed into instances) when the lint pulled Master of Wintergrasp into Vault of Archavon. **Amended the same day after the tranche 2 review:** the user chose the literal rule, a meta is placed on every map a child is on, instances included. The Flame Warden is in the Slave Pens, Brewmaster in Blackrock Depths, Don't Lose Your Head, Man in Scarlet Monastery, Back from the Beyond and A Farewell to Arms on their raids and dungeons as well as their zones, Master of Wintergrasp in Vault of Archavon. The boundary is gone from the lint; the only exclusions are convention-placed children (D11) and unregistered hidden achievements.

**D12 (2026-09-05) Realm First! feats.** Options: place by their children like any meta; skip. Decision: skip (1463 Realm First! Northrend Vanguard, 6829 Realm First! Pandaren Ambassador). The user was explicit that this is a rule of its own, not the real-world-event feat rule, and one that may be revisited; the children (reputation achievements) stay placed.

**D13 (2026-09-05) Intro maps.** Welcome to Draenor (8921/8922) has its only quest on the intro Tanaan Jungle map 577, Exile's Reach (14222) lives on 1409; both maps were verdict Skip, and Skip maps never get entries. Options: skip the achievements; put them on the live zone that replaced the intro map; give the intro maps an entry. Decision: give them an entry and flag the maps as StartingZone. Consequence: StartingZone left the inactive-like list in `_mapverifier_io.ps1` (it stays Skip-like for the world map); entries for 577 (Warlords file) and 1409 (Shadowlands file, the 9.0 intro) were created; the last fallback entry left `ExportedUiMaps.lua`, whose task table is now empty. The verdict change itself (577 and 1409 from Skip to StartingZone) is an in-game Map Verifier edit plus export, per the `sync-mapverifier` rule against hand-editing verdicts. The Dracthyr pair 15325/15638 (map 2107) is not in the current game data at all and stays unplaced; 2107 keeps its Skip verdict. Darkmaul Citadel (1609/1610) is its own Skip group, not linked to 1409, so the citadel floors do not show Exile's Reach unless linked in game.

**D14 (2026-09-05) The Corruptor's End (14157).** Decision: Uldum 1527, Vale of Eternal Blossoms 1530 and Chamber of Heart 1473; War Stories (40955) followed as its parent. **Correction 2026-09-06:** I had told the user the achievement has no criteria. It has one, the quest "Ny'alotha, the Waking City: The Corruptor's End" (58632), whose quest POI rows are exactly those three maps, so the decision stands on game data, not on the Wiki. The false "no criteria" came from an ad-hoc `awk -F','` lookup that split the export on every comma; rows whose description contains a comma shift columns. The same flaw produced "15325/15638 are not in the game data" (D13) and a list of season achievements as "gone". Every ad-hoc check has been redone with a real CSV parser; the lint and the report scripts always used one and were right.

**D13 correction (2026-09-06).** Dracthyr, Awaken (15325 Alliance, 15638 Horde) exists and has seven quest criteria each. Quest POI rows: The War Creche 2109 (group 2100, The Forbidden Reach), the Dracthyr intro map 2118 (verdict Skip, another StartingZone flip for the in-game Map Verifier; 2107 was a red herring from the old fallback table), and the capital where the final quest is turned in (Stormwind 84 / Orgrimmar 85). Placed on 2100 and the capitals; 2118 follows once it is StartingZone. The user did the 577 and 1409 flips in game the same day and linked Darkmaul Citadel 1609/1610 to Exile's Reach; the entry now lists the whole group.

**D11 applied, sweep tranche 3 (2026-09-06).** The pool of a season is derived from two game-data sources, no table needed: the dungeons of the "Keystone Hero: <Dungeon>" achievements listed in that season's block of `<expansion>.MythicPlus` in `DataAddons/Shared/CategoryData.lua`, and the dungeon names in the season achievements' own criteria (Battle for Azeroth seasons and Shadowlands Season 1 list their pool there). The derived pools reproduced the hand-placed Battle for Azeroth and Shadowlands seasons exactly, which validated the method; Battle for Azeroth Season 4 is additionally on Mechagon by hand (its criteria name the two Mechagon wings under other names), left as is. Applied: 900 lines for Shadowlands Season 3 and 4, Dragonflight 1 to 4, The War Within 1 to 3 and Midnight 1 and 2 (Keystone Explorer/Conqueror/Master/Hero/Legend/Myth, season titles, Resilient Keystone 12 to 30, the Enterprising/Unbound role achievements), plus 93 cascade lines (Rule 3: Season Master/Hero metas onto their season's dungeons). A dungeon name shared by two expansions (Magisters' Terrace 348/2511) resolves to the map the season's own Keystone Hero sits on. Season blocks also contain raid-tier metas (Deep Cuts From the Vault, Dragonflight Season N Master/Hero): anything already on a non-dungeon map is left to Rule 3, never pushed onto the pool by the season script.

**Lessons from the tranche 2 review (2026-09-05).** Sections A to H of `raw/ZoneMetaProposals-2026-09-05.md` were accepted as proposed. Where I had hedged, the user chose the literal reading every time (instances included, holiday bosses inside their dungeons). Deferring the 122 metas as "tranche 2" read as an inability rather than a scope choice; the classification itself took one report and one read-through. Two hidden "(copy)" achievements slipped into the Dragonflight migration through the lint-derived plan because the plan tool does not check registration; the lint's skip list now carries them and a registration check belongs in the plan tool.

**D4 (2026-09-05) Reputation placement.** Options: every open-world zone that grants it; quartermaster zone only; criteria-named zones else HQ. Decision: every open-world zone, per the faction's Warcraft Wiki reputation table. Consequence: 897 You're So Offensive moves from Eastern Kingdoms to Isle of Quel'Danas (122); the Reason cell records the Wiki page.

**D5 (2026-09-05) Cities.** Options: city only; city plus surrounding zone; treat as zone. Decision: city only, city-progressed content. Consequence: no capital is mirrored on its zone; explore criteria naming a city inside a zone are decision D8.

**D6 (2026-09-05) Pet Mauler trio.** I proposed skipping 6558 to 6560 as "no geographic association"; the user pointed out their criteria list zones, and `_lookup_criteria.ps1` confirmed 67 named zones from Durotar to Vale of Eternal Blossoms. Decision: they go on every named zone. Consequence: `shared.OldWorldPetAchievements` is spliced into the Cataclysm and Pandaria zones its criteria name and removed from zones they do not name; never claim "no geographic association" without running the criteria lookup.

**D7 (2026-09-05) Existing violations.** Options: one planned sweep then binding; going-forward only with an ignore list; fix on touch. Decision: one sweep. Consequence: backlog in `raw/ZoneDataDecisions.md` (section "Reconciliation sweep backlog"), evidence from `raw/Evaluate-ZoneCriteria.ps1`; the old Rule 5 "flag and ask" is replaced by Rule 10.

**D8 resolved (2026-09-05).** Decided per map, no general rule (the user's choice): an explore criterion naming a **City** inside the zone never puts the zone's achievement on the city (Explore Durotar / Orgrimmar, Explore Teldrassil / Darnassus, Explore the Isle of Dorn / Dornogal, ...). For **outdoor sub-maps** the lint carries a yes/no table and reports any new one as `[D8? ]` until decided: yes for Caverns of Time (74), Slayer's Rise (2444), the covenant sanctums Seat of the Primus (1698), Heart of the Forest (1701), Elysian Hold (1707), and Deeprun Tram (499, a new entry for Field Photographer); no for Blackrock Mountain (33), for Bizmo's Brawlpub (500, whose map is also called "Deeprun Tram") and for Amirdrassil 2239 (the criterion is the Amirdrassil sub-area of the Emerald Dream map 2200, not the separate map). A separate finding from the same list: Taking the Show on the Road (6030/6031) and Field Photographer (9924) are not D8 cases at all, their criteria are performed inside the capitals, so Rule 6 places them there; done for every capital except the two D9 cases. Original text kept below for the record.

**D8 (2026-09-05, open) Explore criteria that name an inner map.** "Explore Dun Morogh" has the criterion "Ironforge"; "Explore Tanaris" has "Caverns of Time"; "Explore Searing Gorge" has "Blackrock Mountain". Literal Rule 2 puts the zone's explore achievement on the inner City or micro-zone map too. The lint reports these as informational `[R2? ]` lines (42 at the time of writing) and the sweep does not add them. Options: add them (literal, consistent with the criteria model); never add a zone achievement to an inner map (keep zone explores on their zone only). Recommendation: do not add; the inner map's own content is what the player expects there, and a criteria-granular runtime would hide the line the moment the sub-area is discovered anyway.

**D10 resolved (2026-09-05).** Capitals that only host the intro breadcrumb of a quest chain do not count: Rule 5 is "every zone where a quest of the chain is completed", and accepting a quest is not completing one. Quest POI rows on a capital of another expansion (Stormwind, Orgrimmar, Dornogal for the Midnight chains) are ignored when resolving Rule 5. No data change.

**D11 resolved (2026-09-05).** Season-wide Mythic+ achievements (a season's Keystone Explorer/Conqueror/Master/Hero and season titles) go on every dungeon of that season's pool: "any keystone dungeon of season X" is the instance analogue of "anywhere on continent X", and the pool is a game fact (season table). The four season-independent Legion ones (11162, 11183, 11184, 11185: any keystone dungeon of any season) are "anywhere" leaves and were removed from the eight Shadowlands dungeons. Follow-up, sweep tranche 3: export the season / challenge-mode tables, derive each season's pool, and place every season-wide achievement of every expansion on it (Battle for Azeroth and Shadowlands already follow the convention by hand; Dragonflight Season 4 Master, Light of the Party and Sssensational! join their season's dungeons then). Original text kept below.

**D11 (2026-09-05, open) Season-wide and season-independent Mythic+ achievements.** The user spotted Fighting with Style: Valorous (a Legion artifact-appearance meta) on the Shadowlands dungeons. Cause: its child Keystone Challenger (11184) and the other three season-independent Legion keystone achievements (11162, 11183, 11185; "complete a level N keystone", any dungeon of any season counts) sit on all eight Shadowlands dungeons and nowhere else, and Rule 3 propagated the parent. The same blocks also hold every Shadowlands season's Keystone Explorer/Conqueror/Master/Hero and title achievements (Tormented Hero, Cryptic Hero), and Battle for Azeroth does the same; that is an existing convention: "any keystone dungeon of season X" is treated like "anywhere on continent X" and placed on every dungeon of that season's pool. The Entry Type text written on 2026-09-05 says season-wide rating achievements are skipped, which contradicts the data. The cascade was undone the same day and the lint no longer propagates through those four ids. Options: (a) adopt the convention as a rule, season-wide Mythic+ achievements go on every dungeon of that season's pool (checkable through the MapChallengeMode season table), and the four season-independent Legion ones are removed as "anywhere" leaves; (b) skip all of them as the text says and remove them from the Shadowlands and Battle for Azeroth blocks. Recommendation: (a); the season pool is a real place the player can be, and the data already follows it.

**D9 resolved (2026-09-05).** Dalaran 125 (Northrend) only, by Rule 7: the three achievements predate the Legion move, so the moved city gets no backfill. Same reasoning already applied to Silvermoon City (110, not the Midnight 2393). Applied: 6030, 6031 and 9924 on 125. Original text kept below.

**D9 (2026-09-05, open) Two Dalarans.** Criteria that say "Dalaran" (6030/6031 Taking the Show on the Road, 9924 Field Photographer) match both 125 (WotLK) and 627 (Legion). The city is one AreaTable entry moved between continents; Rule 9 calls this ambiguous. Options: both maps; the map of the achievement's own expansion; neither until the user decides. The sweep leaves them; the lint keeps reporting them.

## Validation tooling

| Script | Checks | Needs DB |
|---|---|---|
| `raw/Evaluate-ZoneData.ps1` | duplicates in an entry, unknown or inactive maps, ids exist on Retail or Classic, whole link groups, no Continent maps, parser warnings | yes (`-SkipDbCheck` for the offline part) |
| `raw/Evaluate-ZoneCriteria.ps1` | R2 criteria-named zones covered, R3 metas cover their children's maps (with the verdict boundary), informational R2?/R3+ lines | first run exports three DBC tables to `.claude/cache/dbc/<build>/` (git-ignored), then offline |
| `raw/Evaluate-ZoneDataDecisions.ps1` | the decisions log against the files and the DB | partly (`-SkipDb`); the offline subset runs from `Check-Repo.ps1` as rule `zone-decisions` |

## See Also

- [Achievement Data Format](achievement-data-format.md)
- [Category Data Format](category-data-format.md)
- `.claude/skills/add-zone-data/SKILL.md`, `.claude/skills/sync-mapverifier/SKILL.md`
