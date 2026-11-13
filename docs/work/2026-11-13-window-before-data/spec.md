# Spec: Opening the achievement window right after a reload gives no error
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Opening the achievement window (Y, the micro button, a KAF binding, a toast) at any moment of the data load after a login or reload raises no Lua error, on every client.
2. A window opened during the data load shows what is loaded, and the whole window, special categories included, once the load is done, without the player reopening it (Krowi, intent gate: "show what is ready", as before 93.5).
3. The Open Current Zone key binding (`Bindings.xml:21`, `KrowiAF_OpenCurrentZone`) pressed during the data load raises no error and selects nothing; after the load it works as before.
4. Once the special categories exist, Current Zone fills exactly as today: the first window update after the load fills it for the player's zone (the zone cache is not set during the load).

## Root cause
The window was always meant to open before the data is ready:
- the tab's `GetCategories` says so (`Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonMixin.lua:37-39`);
- `KrowiAF_CategoriesFrameMixin:Update` returns while the tab has no categories (`Gui/WindowFrames/CategoriesFrame/CategoriesFrameMixin.lua:126-129`);
- the end of the load redraws an open window (`Data/Data.lua:140-142`, `gui:RefreshViewAfterPlayerLogin`, `Gui/Gui.lua:438`).

Commit fae45838 (2026-01-24, version 93.5, "perf inc for counting achievements", no PR) added `addon.Data.GetCurrentZoneAchievements()` to that `Update` (`CategoriesFrameMixin.lua:131`), after the early return. The function reads `#addon.SpecialCategories.CurrentZone` (`Data/Data.lua:186`), and that list exists only once `addon.SpecialCategories:Load()` (`Data/SpecialCategories.lua:190-202`) runs in `PostLoadOnPlayerLogin` (`Data/Data.lua:132`), at the end of the load.

The load runs its task groups in the order they were registered (`Data/TaskRunner.lua:47`, `tremove` from the end of the list that `Register*Tasks` fills from the front): achievement data, custom criteria, category data (which sets each tab's categories, `Api/CategoryDataApi.lua:7`), then event, tooltip, pet battle, transmog, guide and zone data, then `PostLoadOnPlayerLogin`. A window opened before the category data gives no error (the early return); one opened between the category data and `PostLoadOnPlayerLogin` raises the error. That gap is the "about two seconds" after a reload.

The error is raised inside the categories frame's `OnShow`, inside the loop of KAF's `AchievementFrame_ShowSubFrame` hook (`Gui/Gui.lua:58-70`), so the subframes after the categories frame are never shown or hidden: the empty window.

The same read, unguarded, is in `KrowiAF_OpenCurrentZone` (`Api/API.lua:141`), the Open Current Zone binding. The third caller, `KrowiAF_AchievementsFrameMixin:ForceUpdate` (`Gui/WindowFrames/AchievementsFrame/AchievementsFrameMixin.lua:264-266`), calls the function only while a Current Zone category is selected, which cannot happen before the list exists; a guard inside the function covers it anyway.

**Reproduction:**
- In game: BugGrabber on Retail 12.1.5, session 643, 2026-11-13 20:17:06, x2: `Data/Data.lua:186: attempt to get length of field 'CurrentZone' (a nil value)`, stack tab `Select` > `ShowSubFrames` > `AchievementFrame_ShowSubFrame` > `Gui/Gui.lua:68` > categories frame `OnShow` > `Update` (`CategoriesFrameMixin.lua:131`) > `Data/Data.lua:186`. Not in the Mists log.
- Headless, both clients: two scenarios in the `earned` suite (Verification) update the categories list, and press the binding, with no Current Zone list, as in the gap. Both raise: `line 186: attempt to get length of field 'CurrentZone'` and `line 141: ...`.
- In game, Retail 12.1.5, 2026-11-13 22:07 (`/kaftest earned`, this branch before the fix): the binding scenario raised `Api/Api.lua line 141` as headless. The first draft of the other scenario opened the window through KAF's toggle; the error went to BugGrabber (`Data/Data.lua:186`, same stack through `Gui/Gui.lua:214` `ToggleAchievementFrame`, the count went to x3) and not to the scenario's `pcall`, since the game hands an error in a script that `Show` runs to the error handler. The scenario now calls the categories frame's `Update` itself.
- Y right after `/reload` with the kit's input did not hit the gap: the kit reports the UI back only after the load, and the window opened whole with no new error. The two screenshots (22:08:36 and 22:08:46) show the login's event reminder pop-ups over the window, gone ten seconds later; that is most likely what looked like stray event buttons, and not part of this bug.

## Design
Two guards, nothing else:
- `data.GetCurrentZoneAchievements` (`Data/Data.lua:183`) returns at once while `addon.SpecialCategories.CurrentZone` does not exist, before it reads or sets the zone cache. This covers its three callers and any later one.
- `KrowiAF_OpenCurrentZone` (`Api/API.lua:136`) returns after loading Blizzard_AchievementUI while the list does not exist, so the key does nothing in those seconds.

For requirement 2, the categories frame then finishes its update with the categories already loaded, the subframes are shown, and the end of the load redraws the open window as it did before 93.5. Requirement 4 holds because the zone cache stays unset until the list exists.

Added after the code review (2026-11-13, requirement 2): once the update in the gap no longer raises, it counts the tabs' top-level categories before the load is done (the excluded achievements and the cache come at its end), and the categories frame keeps a count until the tab's filters ask for a recount (`GetDisplayCategories`, `CategoriesFrameMixin.lua`), which the end of the load's redraw (`gui:RefreshViewAfterPlayerLogin`) does not. So the end of the load (`PostBuildCache`, `Data/Data.lua`) now calls `data.RecountAfterLoad`, which sets every tab's `Filters.Refresh`, as `gui:RefreshView` does: each tab recounts at its next draw. A tab not drawn yet counts at its first draw anyway, so the normal login costs nothing more.

## Options considered
1. **(Recommended) Guard inside the function and in the binding.** Two small guards where the list is read; every caller is covered, the window's code is untouched. Player sees, on every client: no error; the window shows the regular categories at once and the special ones (Summary, Watch List, Current Zone, ...) a few seconds later; the Open Current Zone key does nothing during those seconds.
2. **Guard at the callers** (`CategoriesFrameMixin.lua:131`, `AchievementsFrameMixin.lua:265`, `API.lua:141`). Same result for the player, but three places to keep right and the next caller of the function is unguarded again.
3. **Create every special category's list as an empty table when `Data/SpecialCategories.lua` loads.** Every read of any special category list (Current Zone, Selected Zone, Search Results, Watch List, Excluded, Tracking) then finds an empty list during the load. But `Options/Layout.lua:67` and `:178` and `Data/SavedData/AchievementData.lua:290` read a missing Watch List or Excluded list as "the window is not loaded yet" and load Blizzard_AchievementUI then; those would need another test. Wider than the reported bug.

**Scope.** The same kind of read exists for other special categories, each reachable only by a player action in those seconds, and none seen in a log:
- **A (recommended): Current Zone only**, the reported error and the binding that does the same read.
- **B: also the others:**
  - the world map button's click (Selected Zone, `Gui/WorldMapButton/WorldMapButtonMixin.lua:25-33`);
  - the search's "show all results" (Search Results, `Gui/WindowFrames/Search/PreviewContainer/PreviewContainerMixin.lua:6-14`);
  - watch, exclude and track from the right-click menu (`Data/SpecialCategoryAchievements.lua:152-237`).

  Each gets the same guard. Not reproduced.

## Areas of concern
- **Taint and secret values:** none. No hook, no Blizzard frame or global touched; two early returns in addon code. No secret values read.
- **Clients:** Retail 120105, Mists 50504, Wrath Titan 38002 (`Krowi_AchievementFilter.toc:1`) run the same files; the headless scenarios fail the same way on Retail and Classic. Whether Mists hits the gap in game is not known (its log has no such error; its load may be faster); the guards are the same there. Wrath Titan has no local client. Forever does not load KAF.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** plugins calling `KrowiAF_OpenCurrentZone` get a no-op instead of an error during the load. Nothing else changes.
- **Saved variables, localization, embedded libraries, data snapshots:** none.
- **Player-facing text:** a changelog line under `### Fixed`: "Opening the achievement window right after logging in or reloading no longer gives an error."
- **Class:** `fix/logic` (`Data/Data.lua`, `Api/API.lua`; the scenarios ride along), so the plan is routine and does not wait.

## Verification
- **Permanent test (test first):** two scenarios in the `earned` suite (`Tests/Earned.lua`, run headless by `suites.earned` on the real data load and in game by `/kaftest earned`): `open-during-data-load` (the categories frame's `Update`, which its `OnShow` runs when the window opens; Recorded `error`, Target `updated`) and `current-zone-key-during-data-load` (Recorded `error`, Target `nothing selected`). Each removes the Current Zone list for the one call, as in the gap, and puts it back. Recorded is set to Target after the fix. A third, from the code review: `counts-after-data-load` (the window drawn in the gap, then `addon.Data.RecountAfterLoad`: do Expansions' counts match a full recount?), "differ in 1" headless on both clients with the recount empty, "match" with it.
- `Check-Repo.ps1 -ChangedOnly`; headless `earned`, `special`, `navigation` on Retail and Classic.
- In game, Retail: deploy, `/kaftest earned` (both scenarios at their Target), `Read-GameErrors.ps1` with no new row and no bumped count. Pressing Y inside the gap cannot be timed with the kit's input (above), so requirement 2's "fills itself" rests on the code reading (`Data/Data.lua:140-142`) and a manual Y by Krowi if wanted. Mists: `/kaftest earned`, if the client is free.

## Decision
2026-11-13, Krowi:
- Intent: option 1, show what is ready with no error: "reload-then-Y work recommended 1".
- Scope A (Current Zone only) and design 1 (the guard inside the function and in the key): "Reload-then-Y A with 1, B noted on the backlog". Scope B is an entry in `docs/backlog.md`.