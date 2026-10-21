# Spec: Guides for the other eleven Legendary Research achievements
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. 60963 to 60973 each have a guide on Retail, registered in `DataAddons/Retail/07_Legion/GuideData.lua`, ending in `:Criteria("Any")`: every one of them has root criteria operator 8 with amount 1 (`_lookup_criteria.ps1`, build 12.1.5.70448, 2026-10-21), so either Tier VII talent completes it.
2. Each guide sends the player to the hall's research NPC with that NPC's id, English name, map and spot as measured in game (step 0 of `docs/work/2026-10-11-achievement-guides/plan.md`).
3. Each guide starts with the way into the hall, without telling how each class gets in: "Go to <hall>" with a waypoint on the spot where the player walks in. Halls reached only by a class spell (Death Knight, Mage, Monk, and the Druid's way into the Emerald Dreamway) read "Go to <hall>" too, with the spell under it (decision 4).
4. A new guide step, `:Area(areaId, uiMapId, x, y)`, reads "Go to <area>" with the area's name from the game (`C_Map.GetAreaInfo`) in the player's language, the place line and a waypoint; "Go to the marked spot" when the game has no name for the area.
5. No new strings in any locale file, inside or outside the CurseForge part.
6. The headless data load, the snapshots and every scenario suite stay green; the snapshot diff shows only the eleven new guides.

## Design
One `Guide(...)` per achievement, in id order after 60962, each with a comment naming where its numbers come from:

| Id | Class | Way in | Research NPC (id, map, spot) |
|---|---|---|---|
| 60963 | Demon Hunter | `:Area(8023, 627, 98.0, 69.3)` The Fel Hammer, at the Illidari Gateway | Loramus Thalipedes (108527), 721, 55.3, 62.7 |
| 60964 | Druid | `:Travel(193753, 7979)` Dreamwalk to the Emerald Dreamway, then `:Area(7846, 715, 45.2, 26.4)` The Dreamgrove, at its portal there | Leafbeard the Storied (97989), 747, 32.7, 29.4 |
| 60965 | Hunter | `:Area(7877, 627, 72.9, 41.2)` Trueshot Lodge, at Talua's eagle | Survivalist Bahn (108050), 739, 58.7, 51.1 |
| 60966 | Mage | `:Travel(193759, 7879)` Teleport: Hall of the Guardian | Chronicler Elrianne (108331), 734, 74.9, 28.9 |
| 60967 | Monk | `:Travel(126892, 7903)` Zen Pilgrimage, to the Temple of Five Dawns | Number Nine Jia (98939), 709, 53.0, 59.8 |
| 60968 | Paladin | `:Poi(5057, 627, 32.7, 69.8)` Alliance, `:Poi(5058, 627, 61.9, 13.5)` Horde | Sir Alamande Graythorn (109901), 24, 39.9, 56.5 |
| 60969 | Priest | `:Poi(5062, 627, 39.6, 57.3)` Alliance, `:Poi(5063, 627, 62.9, 17.6)` Horde | Archon Torias (110725), 702, 56.0, 40.7 |
| 60970 | Rogue | `:Poi(5102, 627, 52.7, 70.3)` Hall of Shadows | Winstone Wolfe (105998), 626, 46.0, 69.2 |
| 60971 | Shaman | `:Poi(5059, 627, 67.1, 48.1)` | Journeyman Goldmine (112199), 726, 33.4, 58.2 |
| 60972 | Warlock | `:Poi(5061, 628, 27.7, 44.3)`, on the Underbelly floor where the portal stands | Archivist Melinda (108018), 717, 55.3, 41.0 |
| 60973 | Warrior | `:Poi(5060, 627, 75.0, 47.5)` Skyhold entrance | Einar the Runecaster (107994), 695, 46.5, 29.0 |

- The spell ids are the class abilities: 126892 sits in the Monk skill line (829) and 193753 in the Druid one (798) in `skilllineability`, as 50977 (Death Knight, 796) and 193759 (Mage, 904) do; the other spells of those names are not abilities (2026-10-21).
- POI coordinates are the area POI positions the game reported (`/kafwhere poi`) or the game database gave; they serve TomTom and the text only, since the map pin super-tracks the POI itself. The POIs' names are the halls' names ("Skyhold", "Maelstrom", "Netherlight Temple"), so those steps already read "Go to <hall>".
- Area ids are the halls' Legion areas in `areatable` (2026-10-21): 8023 The Fel Hammer (DemonHunterOrderHall), 7846 The Dreamgrove, 7877 Trueshot Lodge. The spots are the Illidari Gateway, the Dreamgrove portal and Talua, measured with `/kafwhere` in step 0. Dalaran and the Emerald Dreamway refuse the map pin, so these waypoints go through TomTom or the coordinates as text.
- **The `Area` step.** `Api/GuideDataBuilder.lua` gains `GuideBuilder:Area(areaId, uiMapId, x, y)`, storing `{Type = "Area", AreaId, MapId, X, Y}`. `Gui/Guide/Guide.lua`'s `GetLines` renders it like a POI the player cannot see: "Go to {poi}" (`Guide Go To`) with the area's name, or `Guide Go To Spot` without one, the place line, and a waypoint titled with the name (no `PoiId`, so the map pin or TomTom places it). The name comes from `C_Map.GetAreaInfo(areaId)`; an empty or missing name counts as none. Every surface lays out lines generically, so nothing else changes.
- The guide suite's headless model loads the real `GuideData.lua` (with `Api/GuideDataApi.lua` and `Api/GuideDataBuilder.lua`) instead of its hand-written copy of 60962, so the login warm-up scenario reads the same guides headlessly as in game.

## Options considered
### First gate (2026-10-21)
Ship all eleven without the object entrances; ship eight and the three object halls later; or add an object step with its names as CurseForge strings. Krowi chose the object step, but without asking the CurseForge translators for it: "keep this out of CurseForge but make it translate in each language we support. Analyze this."

### Analysis: translated text that stays out of CurseForge
CurseForge owns only what lies below `AUTOGENTOKEN` in `Localization/*.lua`. Text can reach every locale by three other routes, tried in this order:

1. **The game names it at runtime.** No data, always the official term, in the player's language: spell names (`C_Spell.GetSpellName`), area names (`C_Map.GetAreaInfo`, Retail and Classic), map names, area POI names, NPC names from the creature cache, currencies, talents. The guide already works this way for everything but its verbs.
2. **The game's data files name it, but no call returns it.** wow.tools.local reads any table in any game locale (`_lookup_name.ps1 -Locale`, new in this item; spell 193752 came back as "Pforte: Die Teufelshammer", "Porte : le Marteau gangrené", "Врата: \"Молот Скверны\"", "传送门：邪能之槌号"). A generator script could write such names for all eleven locales into a data file outside `Localization/`. Trap found on the way: after a query in another locale, a table read for the first time without one can come back in that language until the server restarts.
3. **Nobody names it** (a tip, a sentence): the game cannot help. That is the open question of the Raise an Army guides, not of this item.

The three entrances are server-side objects: none is in the client's `gameobjects` table (searched for Illidari Gateway, Secret Door, Dreamgrove, Fel Hammer, Dreamway), and no call returns an object's name by id. So their own names ("Illidari Gateway", "Secret Door") exist in no game file in any language; only the client that has seen one caches it, in its own language. What the game does name, in every locale, is what clicking them does and where they lead:

| Hall | Object (spot) | Spell it casts, by name | Area it leads to |
|---|---|---|---|
| Demon Hunter | Illidari Gateway (627, 98.0, 69.3) | 193752 "Gateway: The Fel Hammer", "Teleports the caster to the Fel Hammer" | 8023 "The Fel Hammer" |
| Druid | Dreamgrove portal (715, 45.2, 26.4) | 199549 or 204983 "Teleport: The Dreamgrove" | 7846 "The Dreamgrove" |
| Paladin | Secret Door (24, 41.2, 90.6) | 201324 or 209893 "Activate Secret Door" | 7638 "Sanctum of Light" |

Both spells of a pair carry the same name in all eleven locales (checked 2026-10-21), so the guide reads the same whichever one the object casts. 193752 sits in the id range of the class hall travel spells (193753 Dreamwalk, 193759 Teleport: Hall of the Guardian).

### Options for the object step
- **A. The travel step takes an optional spot: `:Travel(spellId, uiMapId, x, y)` (recommended).** Reads "Travel with Gateway: The Fel Hammer", "Travel with Teleport: The Dreamgrove", "Travel with Activate Secret Door", each with its place line and waypoint, in the player's language through the existing `Guide Travel` string. No new string. The builder and the renderer change a little (a place line and a waypoint when the step has a map).
- **B. A new spot step named by its area: `:Spot(areaId, uiMapId, x, y)`.** Reads "Go to The Fel Hammer", "Go to The Dreamgrove", "Go to Sanctum of Light" through the existing `Guide Go To` string. No new string. The Paladin guide would then show "Go to Sanctum of Light" twice (the Dalaran portal's POI carries the same name).
- **C. The objects' own names in a translation table outside CurseForge**, drafted by an agent or copied from a website's localized pages. Shows "Illidari Gateway" itself, but in ten languages nobody has checked it against the game, and the table is one more thing to keep up.

The first gate's other two choices remain: ship the eight complete guides and the three others with the step, or all eleven without it.

## Areas of concern
- **Taint and secret values:** `C_Map.GetAreaInfo` is new to the addon. Its documentation flags only its arguments (`SecretArguments = "AllowedWhenUntainted"`, `Blizzard_APIDocumentationGenerated/MapDocumentation.lua:34-36`), and the area id comes from the addon's own data, never a secret value; the name it returns is not flagged. NPC, spell and POI names go through the existing calls. `krowi:taint-reviewer` reviews the renderer change.
- **Data API:** a new builder method; existing guides and the plugin API are unchanged.
- **Clients:** Retail only (`DataAddons/Retail/`). Classic loads no guide data; its snapshots must not change.
- **Blizzard API changes, plugins and skins, saved variables, embedded libraries:** none.
- **Map pin:** the user waypoint is refused in Dalaran (627), the Emerald Dreamway (715) and most halls (695, 702, 709, 717, 721, 726, 734, 747, 626); those steps fall back to TomTom, then to the coordinates as text, as designed in 103.0. The POI steps super-track the portal instead.
- **Localization:** no new strings. Area, spell and POI names come from the game in the player's language; NPC names from the client's cache, with the English name as the fallback. Blizzard leaves some names untranslated (ptBR spell 193752 reads "Gateway: The Fel Hammer"); the guide shows what the game shows.
- **Player-facing text:** the Rogue's hall is uiMap 626, which the game also calls "Dalaran", so the research step's place line reads "Dalaran · 46.0, 69.2", while the step before it names the Hall of Shadows. Changing it needs a code change; it is left as it is.
- **Data snapshots:** `Achievements.Retail.txt` gains the eleven guides; nothing else changes.

## Verification
- **Guide suite, new kind `AreaName`** (Retail only): a guide written in the suite with one `Area` step. `area-name-from-game` uses 8023 and gives "game" when the headline and the waypoint title carry what `C_Map.GetAreaInfo(8023)` returns on that client (so it holds in any language), `area-name-unknown` uses an id no area has and gives "spot" when the headline is `Guide Go To Spot`; both also require the place line. Written before the step exists: Recorded "none" (`GetLines` skips an unknown step type), Target "game" and "spot"; after the build Recorded equals Target.
- **Guide suite, `npc-names-requested`:** goes from "97485" to the twelve research NPCs of the twelve guides, Recorded and Target alike, headless (real data loaded) and in game.
- **Headless:** `load-data.lua Both` reports no drop; `snapshot-data.lua -write` shows only the new GUIDE lines on Retail and nothing on Classic; `run-tests.lua` for every suite is green.
- **`Check-Repo.ps1`** clean; `krowi:taint-reviewer` and `/code-review` on the branch.
- **In game, Retail:** deploy the worktree, `/reload`, `/kaftest guide`, `/reload`: `Read-GameTests.ps1` green with no difference from headless, `Read-GameErrors.ps1` clean. Krowi opens one guide on a character of that class (the Priest covers the per-faction portal) and one of another class.

## Decision
Krowi, 2026-10-21, in three answers:
1. An entrance step over shipping without one, but kept out of CurseForge while still translated in every supported language; analyse how (see Analysis).
2. Consistent with the other steps: "Go to <location>" with a coordinate, not how each class gets into its hall.
3. Halls reached only by a class spell (Death Knight, Mage, Monk) keep "Travel with <spell>"; 60962 stays as shipped.

4. In game on the first build, 2026-10-21: "Travel with" felt off next to the other guides' "Go to". A travel step now takes the area it leads to, `:Travel(spellId, areaId)`, and reads "Go to <area>" with the spell's icon and name on the line under it (areas 7679 Acherus: The Ebon Hold, 7879 Hall of the Guardian, 7903 Temple of Five Dawns, 7979 Emerald Dreamway); without an area, or a name for it, it still reads "Travel with <spell>". 60962 changes with it. Scenarios `travel-area-from-game` and `travel-area-unknown`.

The agent's reading for the two cases the answers did not name: the Druid keeps Dreamwalk (the only way into the Emerald Dreamway) before "Go to The Dreamgrove"; the Hunter's "Go to Trueshot Lodge" at Talua's spot replaces "Talk to Talua".