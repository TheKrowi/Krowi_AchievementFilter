# Plan: One settings store of the addon's own, and one migration runner for every saved variable
Spec: [spec.md](spec.md). Status: draft

## Files that change

**New**
- `Settings/Files.xml`, `Settings/Store.lua`, `Settings/Renames.lua`, `Settings/Migrations.lua`, `Settings/Check.lua` (spec, Design). `Settings/Declarations.lua` holds the core's declarations (from today's `Options/Defaults.lua`); features and plugins declare their own in their `Options.lua`.
- `.claude/tools/headless/fixtures/settings-option-paths-Retail.lua` and `-Classic.lua`: the old build's option Id → saved paths, frozen from `main` 72c80618.
- `.claude/tools/headless/settings-dryrun.lua`: migrates a real saved-variables file in memory and runs the check; reads only, writes nothing.
- `.claude/tools/headless/generate-renames.lua`: the generator behind `renames.md` and `Settings/Renames.lua` (explicit rows), and the reader rewrite script.

**Changed**
- `Krowi_AchievementFilter.toc`: `KrowiAF_Settings` on the `SavedVariables` line (the old three stay); `Settings\Files.xml` before `Options\Files.xml`.
- `Krowi_AchievementFilter.lua`: the runner and the store load first in `LoadKrowi_AchievementFilter`; `DataIntegrityManager.Load` goes.
- `Options/Files.xml`, `Options/Options.lua`: KAF's own `addon.Options` shell replaces Krowi_Util's `Options/Options.lua`. `Options/Defaults.lua` is deleted (its content becomes declarations). `Options/Profiles.lua`: no `Filters:Load`.
- `Options/General.lua`, `Options/Layout.lua`, `Options/Credits.lua`, `Options/Plugins.lua`, `Features.lua`, `Features/*/Options.lua`, `Features/EventReminders/EventOptions.lua`, `Plugins/*.lua`: rows name keys through the row helpers; injected defaults become declarations and map entry defaults.
- `Options/Window/Source.lua`: `ProfileOptions` on the store's two profile systems; `Option:ComputeDefault` on `settings.WithDefaults`.
- `Filters.lua`, `SearchOptions.lua`: no AceDB; the `filters` and `search` objects.
- `Api/TabDataApi.lua`, `Api/API.lua`, `Gui/Gui.lua`: tab show and order through the `tabs.show` and `tabs.order` maps.
- Every reader (about 88 files, 715 reads; `Grep "db\.profile"`): `settings.Get` and friends.
- `Gui/DataManager/DataManager.lua`: `ImportCharacter` fills a missing name and realm.
- `Libs/Files.xml`: `AceDB-3.0` out; `Libs/AceDB-3.0/` deleted. `Libs/Krowi_Util` itself unchanged.
- `Data/DataIntegrityManager.lua`, `Data/Files.xml`: the file goes.
- `Localization/*.lua` (11 files): the failure line.
- `.claude/tools/Check-Repo.ps1` and its README: the `settings-keys` and `settings-direct` rules. `.claude/tools/Check-Repo.jobs`: the logout handler.
- `.claude/tools/headless/options-env.lua`, `settings-proof.lua`, `saved-settings.lua`, `write-settings-fixture.lua`, `run-tests.lua`: the harness on the store; the `settings` suite's scenarios (spec, Verification).
- `Tests/*.lua`: the in-game suites set and put back settings through the store; `Tests/Schedules.lua`'s Legion scenarios on migration 1's step.
- `.claude/tools/Compare-SavedSettings.ps1`: reads the new layout too, so a snapshot of the old files compares with the migrated ones.
- Docs: `docs/architecture.md` (load order, `Settings/`), `CLAUDE.md` (Saved variables: the runner instead of the DataIntegrityManager), `.claude/rules/` where they name `db.profile`, `Tests/README.md`, `.claude/tools/README.md`, `docs/backlog.md` ("Leaving Ace" done; Krowi_Util's `Icon:Load` taking its table; the native format), `_Packaging/Changelog.md`.

## Order of work

Each step ends with the headless suites it reaches green and a commit. Nothing reaches the game before step 9.

1. **Freeze the truth.** From the unchanged code: write the option Id → old paths fixtures per client; keep the existing baseline and `-values` fixtures. Commit before any code change.
2. **The store, alone.** `Settings/Store.lua` with declarations, kinds, scopes, the two profile systems, change events, `WithDefaults`, the logout save. Headless scenarios: `sparse-save`, `profile-switch`, a `WithDefaults` case. Not loaded by the addon yet.
3. **The rename table.** `generate-renames.lua` writes `Settings/Renames.lua` with explicit rows only; `renames-cover` and `renames-by-option` (against step 1's fixtures).
4. **Migration and check, clearing off.** `Settings/Migrations.lua` and `Check.lua`, the clearing switch off. Scenarios: `migrate-fixture`, `migrate-twice`, `migrate-fails`, `migrate-errors`, `dead-key`, `legion-assaults`, `first-install`. `settings-dryrun.lua` on Krowi's six real files: check passes, three dead paths, and the time it takes on the 7 MB account.
5. **Declarations.** Every setting declared: the core's from `Options/Defaults.lua`, the features' from their `Defaults`, the maps' entry defaults from the tab, event and adjustable-category injections. `defaults-unchanged` (by key, against the old defaults through the rename table).
6. **Wire the store in.** Load order, KAF's `Options/Options.lua`, `Filters.lua` and `SearchOptions.lua` on objects, the Profiles section, the minimap icon hand-over, `ComputeDefault`. AceDB leaves `Libs/`. From here the addon runs on the store; the options suite and the `old-file-same-values` scenario stay red until steps 7-8.
7. **Rows to keys.** The row helpers; every option file's rows. The options suites (headless) green again; `renames-by-option` and `old-file-same-values` green.
8. **Readers.** The scripted rewrite, file by file; hand edits where code holds a subtable; the lint rules. All headless suites and `Check-Repo.ps1` green.
9. **The DataIntegrityManager's retirement**, the import fix, the dead `KrowiAF_SavedData` keys, the failure line in 11 languages, the jobs list. The real-file dry run again.
10. **In game, clearing still off.**
    - Before the first deploy: copy the six saved files to the scratchpad and take `Compare-SavedSettings.ps1 -Snapshot`.
    - Then `Deploy.ps1 -WhatIf`, deploy, Retail login.
    - The old tables are still in the file. The new store's values match the snapshot (`Compare-SavedSettings.ps1 -Options -Against`). Every suite but the probes and `-Matrix`. BugGrabber clean.
    - Then the same on Mists.
11. **Turn clearing on** (the final build); the headless suites again. In game on Retail, then Mists:
    - the first login migrates and clears: the file holds `KrowiAF_Settings` and not the three old variables; the options still match the snapshot;
    - a second login changes nothing;
    - the full suites.
12. **Reviews:** `krowi:taint-reviewer` on the diff; the code review (`REVIEW.md`); `Find-DeprecatedApi.ps1`. Then the PR, with the class checked by `Get-ChangeClass.ps1`.

## Risks
- **Krowi's real accounts get migrated by the first in-game run.** Guarded by the copies and snapshot before step 10, and clearing off until step 11. Only Krowi's own characters log in.
- **A wrong rename passes the in-game check.** Caught headless before the game: `renames-by-option` and `old-file-same-values`, both against fixtures frozen from `main` in step 1.
- **The migration is slow at login** ("script ran too long", which cut off a run on 2026-11-25). Measured in step 4 on the 7 MB account. If it comes near the limit, the achievement-records step moves to a later frame. That step runs only for a player returning from before 11.0.
- **The reader rewrite.** About 715 reads; a typo or a missed subtable is caught by the lint rules (keys), the headless suites per file, and in game. A swapped key in a reader (not a row) is not caught by the proof. The script generates readers from the same rows as the table, so a swap needs a wrong row, which the proof catches.
- **The options window's defaults, changed marks and Defaults buttons** (`ComputeDefault`): the options suites cover them headless and in game.
- **Profile switches** now refresh through change events: the `profile-switch` scenario and the options suite's profile cases.
- **Plugins and skins** (ElvUI, GW2_UI, EllesmereUI) disable rows through `KrowiAF_GetOptions`: the `plugins` suite.
- **Memory**: the logout save and change events allocate nothing at rest; the `memory` suite.
- **The scope is large** (about 100 files). Steps 2-5 add without changing behaviour; step 6 onward is one branch, kept green per step. The PR is reviewed per step's commit.

## Proof
- `lua.exe .claude\tools\headless\run-tests.lua "$PWD" settings` on Retail and Classic: every scenario of the spec's Verification passes.
- `run-tests.lua` for every suite, and `Check-Repo.ps1`, green.
- `settings-dryrun.lua` on each of the six real files: `check=pass dead=3` (the three of removed options, on the two files that hold them; 0 on the others) and the time taken.
- In game, Retail 12.1.5 and Mists 5.5.4 (`Run-GameTests.ps1` for every suite but the probes, and `-Matrix`):
  - every suite green;
  - after the clearing login, the saved file holds `KrowiAF_Settings` with `Version = 1` and none of the three old variables;
  - `Compare-SavedSettings.ps1 -Options -Against <snapshot>` reports every option equal;
  - `Read-GameErrors.ps1` shows no new error.