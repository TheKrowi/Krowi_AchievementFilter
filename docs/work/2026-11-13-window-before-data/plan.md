# Plan: Opening the achievement window right after a reload gives no error
Spec: [spec.md](spec.md). Status: done

Routine plan of a `fix/logic` (the kit's gate table): it does not wait for Krowi.

## Files that change
- `Tests/Earned.lua`: two scenarios, `open-during-data-load` and `current-zone-key-during-data-load`, and the helper `DuringDataLoad`, which removes `addon.SpecialCategories.CurrentZone` for one call and puts it back. The headless runner (`suites.earned`) needs no change: it already loads `Data/Data.lua`, `Api/API.lua` and the categories frame on the real data load.
- `Data/Data.lua`: `data.GetCurrentZoneAchievements` returns while `addon.SpecialCategories.CurrentZone` does not exist, before the zone cache is read or set.
- `Api/API.lua`: `KrowiAF_OpenCurrentZone` returns after loading Blizzard_AchievementUI while the list does not exist.
- `_Packaging/Changelog.md`: a line under the next version's `### Fixed`.
- Departure, after the code review: `Data/Data.lua` also gets `data.RecountAfterLoad`, called at the end of the load, and `Tests/Earned.lua` the scenario `counts-after-data-load` for it (spec, Design); `Tests/README.md`'s `earned` row names the three scenarios.

## Order of work
1. Commit the scenarios with Recorded `error` (the current behaviour, headless on Retail and Classic and in game on Retail for the key): `test: reproduce 2026-11-13-window-before-data in the earned suite`.
2. The two guards.
3. Recorded set to Target in both scenarios; headless `earned`, `special`, `navigation` on both clients; `Check-Repo.ps1 -ChangedOnly`.
4. The changelog line.
5. In game: Retail `/kaftest earned` through `Run-GameTests.ps1`, then Mists if the kit allows; `Read-GameErrors.ps1` on each.
6. `/code-review` on the diff; `krowi:taint-reviewer` only if the diff reaches GUI code, hooks or event handlers (it does not as planned).

## Risks
- **Current Zone never fills after the load:** guarded by returning before `cachedZone` is set, so the first update after `SpecialCategories:Load` fills it as today (requirement 4).
- **The scenarios leave the list removed after an error:** `DuringDataLoad` puts it back after the `pcall`, before reporting.
- **A plugin relying on the key's error:** none can; the key now does nothing in the gap, as the spec says.

## Proof
- Headless `earned` on Retail and Classic: 9 passed, 0 failed, 0 open against the target.
- In game, Retail and Mists: `earned` with both new scenarios at Target, and `Read-GameErrors.ps1` with no new row and no bumped count for `Data/Data.lua:186` or `Api/API.lua:141`.
- The window filling itself after a Y inside the gap cannot be timed with the kit's input; a manual Y by Krowi shows it.