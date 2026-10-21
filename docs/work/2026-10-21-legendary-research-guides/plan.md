# Plan: Guides for the other eleven Legendary Research achievements
Spec: [spec.md](spec.md). Status: done

Non-routine: it adds a step to the data API (`Api/GuideDataBuilder.lua`) and touches shared GUI code (`Gui/Guide/Guide.lua`). Approved by Krowi (maintainer) on 2026-10-21 in plan mode, with the proposed departure in step 1 (no in-game before-run). Worktree `.claude/worktrees/feature-2026-10-21-legendary-research-guides`, branch `feature/2026-10-21-legendary-research-guides`, off `main` at b48f29e1; intent and spec are committed there as accepted (defad1ea), with the lookup script's `-Locale` (ea1d122f).

## Files that change
- `Api/GuideDataBuilder.lua`: `GuideBuilder:Area(areaId, uiMapId, x, y)` stores `{Type = "Area", AreaId, MapId, X, Y}`, with a one-line comment in the file's style ("Go to a place the game names by its area (AreaTable id) ..."). The header's example stays.
- `Gui/Guide/Guide.lua`:
  - a local `GetAreaName(areaId)`: `C_Map.GetAreaInfo` when it exists, nil for a missing or empty name;
  - in `GetLines`, an `Area` branch beside `Poi`: headline `Guide Go To` with `{poi = name}`, or `Guide Go To Spot` without a name; `Details = {GetPlace(step)}`; `Waypoint = {MapId, X, Y, Title = name or GetMapName(step.MapId)}` (no `PoiId`, so the map pin or TomTom places it);
  - the header comment names area names among what comes from the game.
- `DataAddons/Retail/07_Legion/GuideData.lua`: `local faction = KrowiAF.Enum.Faction`, then 60963 to 60973 after 60962, as in the spec's table, each ending `:Criteria("Any")`, with short comments giving each spot's source. 60962 is unchanged.
- `Tests/Guide.lua`:
  - a twelfth kind, `AreaName`, in the header comment and in `retailOnly`;
  - `RunAreaName`: renders `{Guide = {{Type = "Area", AreaId = scenario.AreaId, MapId/X/Y = dalaran}}}` through `GetLines` under `pcall`. It returns "none" without a line, "error" when `GetLines` fails, "no-place" without a place line. It returns "game" when the headline contains `C_Map.GetAreaInfo(id)` and the waypoint title equals it, "spot" when the game has no name and the headline is `Guide Go To Spot`, and "mixed" otherwise;
  - scenarios `area-name-from-game` (8023) and `area-name-unknown` (999999), Recorded "none", Target "game" and "spot";
  - `npc-names-requested` Recorded and Target become "97485,97989,98939,105998,107994,108018,108050,108331,108527,109901,110725,112199".
- `.claude/tools/headless/run-tests.lua`, guide model:
  - `C_Map.GetAreaInfo` answering 8023 "The Fel Hammer", 7846 "The Dreamgrove" and 7877 "Trueshot Lodge", nil otherwise;
  - the achievements built from the real data: load `Api/GuideDataApi.lua`, `Api/GuideDataBuilder.lua` and `DataAddons/Retail/07_Legion/GuideData.lua`, then one achievement per `KrowiAF.GuideData.Legion` entry (`entry[2]` the id, `entry[3]` the steps), plus 11223 as now;
  - the model's header comment says so.
- `Tests/README.md`: the guide row names the area-name scenarios and that the headless model loads the real guide data.
- `.claude/tools/headless/snapshots/Achievements.Retail.txt`: regenerated (`snapshot-data.lua -write`). The diff is the eleven new guides and the guide count; Classic does not change.
- `_Packaging/Changelog.md`: under `## 104.0`, a new `### Added` above `### Changed`: "Achievement guides for the other eleven Legendary Research achievements, one per class hall".
- `docs/work/2026-10-21-legendary-research-guides/plan.md`: this plan; every work file `Status: done` in the PR's last commit.
- **Not changed:** `docs/backlog.md`. Its Legendary Research item should leave the list, but the main checkout holds an uncommitted edit to that file (the Raise an Army entry, not this session's), and a change to it here would block that checkout's `git pull`. Krowi decides after the merge (see Proof, last step).

## Order of work
1. **Scenarios first.** The `Tests/Guide.lua` and `run-tests.lua` changes above, except the new `npc-names-requested` value. Loading the real data still gives "97485" at this point, since only 60962 has a guide. Run `run-tests.lua "$PWD" guide`: the two area scenarios PASS with "none" and are open against their targets; everything else is unchanged on both clients. Commit `test: area step scenarios in the guide suite`.
   - **Proposed departure, the in-game before-run** (playbook stage 3: GUI work runs the suite in game before the change): skip it. Before the step exists, the new scenarios can only read "none" (`GetLines` ignores a type it does not know), and no existing scenario's recorded value changes. The in-game after-run in step 5 covers the whole suite. This saves Krowi one deploy, `/kaftest` and two `/reload`s.
2. **The step.** Builder and renderer. Run the guide suite: the two scenarios read "game" and "spot"; set Recorded to Target. Lua 5.1 syntax via the hook, `Check-Repo.ps1 -ChangedOnly`. Commit `feat(gui): guide Area step names a place by the game's area name`.
3. **The data.** The eleven guides, the new `npc-names-requested` value, the changelog line. Then:
   - `load-data.lua "$PWD" Both`: no drop or diagnostic;
   - `snapshot-data.lua -write` and read the diff;
   - `run-tests.lua` for every suite.

   Commit `feat(retail): guides for the other eleven Legendary Research achievements`, with the snapshot.
4. **Review.** `krowi:taint-reviewer` on the branch diff (new call `C_Map.GetAreaInfo`), then `/code-review`; fix or list the findings. Run the whole `Check-Repo.ps1`.
5. **In game, Retail.** `ListAgents` first: the memory-growth session also deploys to Retail. Then:
   - `Deploy.ps1 -WhatIf` from the worktree; tell Krowi what it replaces; deploy on Krowi's approval.
   - Ask Krowi not to save anything in the main checkout's VS Code window until the run is done (fsdeploy).
   - Krowi: `/reload`, `/kaftest guide`, `/reload`, then open the guide of 60963, 60965 or 60964 on any character (their area names show to every class), and one on a character of that class. The Priest covers the per-faction portal.
   - Then `Read-GameTests.ps1` and `Read-GameErrors.ps1`.
6. **PR.** Work files to `done`, push, PR against `main` with the template filled in (work folder, scenarios, changelog, lint, review passes, Retail tested; Classic not touched). Merge only on Krowi's word, `gh pr merge <n> -R TheKrowi/Krowi_AchievementFilter --merge`.

## Departures from the plan
- **Review fixes** (step 4): `GetAreaName` checks the name with `canaccessvalue`; the Poi and Area steps share `AddPlaceLine`; `_lookup_name.ps1` always sends a locale, enUS by default; the data header names its sources. Deferred findings are listed in the PR.
- **Travel steps to an area** (after the first in-game run, spec decision 4): `:Travel(spellId, areaId)` reads "Go to <area>" with the spell under it, tested first by `travel-area-from-game` and `travel-area-unknown`; a second changelog line for 60962, whose guide changes with it.

## Risks
- **An area name nobody expects.** `C_Map.GetAreaInfo` reads AreaTable. 8023, 7846 and 7877 are the halls' Legion areas (`areatable`, 12.1.5.70448), and the in-game after-run shows the real text. The scenario compares against the API, so it holds in every client language.
- **The headless model drifting from the game.** Loading the real `GuideData.lua` removes the hand-written copy of 60962. `GuideData.lua` must then load headlessly: it reads `KrowiAF.Guide` and `KrowiAF.Enum.Faction`, both present in the model.
- **The Paladin and Priest POI names** are visible only to their own class. Others read "Go to the marked spot" with coordinates, as designed in 103.0; it stays so.
- **The Warlock POI on 628** (Dalaran's Underbelly floor): `GetAreaPOIInfo(628, 5061)` answered in step 0 of the earlier plan. If it answers nil in game, the step reads "Go to the marked spot" with the 628 coordinates, which is still correct.
- **Deploy collisions:** one AddOns folder per client; handled in step 5.

## Proof
- `run-tests.lua "$PWD" guide`: `area-name-from-game` PASS got=game, `area-name-unknown` PASS got=spot, `npc-names-requested` PASS with the twelve ids, every other scenario as before, on Retail and Classic.
- `run-tests.lua "$PWD"` (all suites) green; `load-data.lua "$PWD" Both` clean; `Check-Repo.ps1` clean.
- Snapshot diff: only `GUIDE 6096x`/`6097x` lines and the guide count.
- In game, Retail: `Read-GameTests.ps1` shows `/kaftest guide` green with no difference from headless; `Read-GameErrors.ps1` shows nothing new. 60963 reads "Go to The Fel Hammer" with "Dalaran · 98.0, 69.3".
- After the merge: update the main checkout's `main` (`git fetch origin main:main` while it is on the merged chore branch, or `git pull --ff-only` once it is on `main`), and remove the worktree. Then ask Krowi whether to commit the uncommitted Raise an Army entry together with removing the Legendary Research item from `docs/backlog.md`.