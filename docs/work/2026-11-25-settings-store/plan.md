# Plan: One settings store of the addon's own, and one migration runner for every saved variable
Spec: [spec.md](spec.md). Status: accepted 2026-11-27

## Files that change

**New**
- `Settings/Files.xml`, `Settings/Store.lua`, `Settings/Renames.lua`, `Settings/Migrations.lua`, `Settings/Check.lua` (spec, Design). `Settings/Declarations.lua` holds the core's declarations (from today's `Options/Defaults.lua`); features and plugins declare their own in their `Options.lua`.
- `.claude/tools/headless/fixtures/settings-option-paths-Retail.lua` and `-Classic.lua`: the old build's option Id → saved paths, frozen from `main` 72c80618 by `.claude/tools/headless/write-option-paths.lua`.
- `.claude/tools/headless/settings-dryrun.lua`: migrates a real saved-variables file in memory and runs the check; reads only, writes nothing.
- `.claude/tools/headless/generate-renames.lua`: the generator behind `renames.md` and `Settings/Renames.lua` (explicit rows), and the reader rewrite script.

**Changed**
- `Krowi_AchievementFilter.toc`: `KrowiAF_Settings` on the `SavedVariables` line (the old three stay); `Settings\Files.xml` right after `Libs\Files.xml` (step 2).
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

Each step ends with the headless suites it reaches green and a commit. Nothing reaches the game before step 11.

1. **Freeze the truth.** From the unchanged code: write the option Id → old paths fixtures per client; keep the existing baseline and `-values` fixtures. Commit before any code change.
2. **The store, alone.** `Settings/Store.lua` with declarations, kinds, scopes, the two profile systems, change events, `WithDefaults`, the logout save. Headless scenarios: `sparse-save`, `profile-switch`, a `WithDefaults` case. Not loaded by the addon yet.
   - Done 2026-11-27, with two changes. The store's own scenarios are a headless suite of their own, `store` (`store-sparse-save`, `store-profiles`, `store-with-defaults`, `store-maps`, ...), on the store loaded alone by `settings-store.lua` (the shared helper the other suites will use). The `settings` suite keeps its AceDB scenarios until the switch (step 9), and then gets the spec's whole-addon ones.
   - `Settings\Files.xml` is on the `.toc` from this step, right after `Libs\Files.xml`, so `Api/` and `Plugins/` can reach `addon.Settings` at file scope. It is inert until the switch (step 9): the file only defines functions, and nothing calls `Load`.
   - `Set` and `SetEntry` record the keys a player sets while `KrowiAF_Settings.MigrationFailed.Touched` exists, for requirement 15's "not set since". A key set back to its default leaves the file, so without this record it would look never set.
3. **The rename table.** `generate-renames.lua` writes `Settings/Renames.lua` with explicit rows only; `renames-cover` and `renames-by-option` (against step 1's fixtures).
   - Done 2026-11-27: 183 value rows (6 of account scope), 6 map specs and 3 object specs, the same as `renames.md`, which the generator checks. `renames-cover`: no old path without a row, no shared key, on both clients. `renames-by-option` is in place with its target open (no option writes `KrowiAF_Settings` until the switch, step 9).
   - The old defaults are frozen too (`settings-old-defaults-<client>.lua`, by `write-option-paths.lua`, checked against `defaults-unchanged`'s recorded hash): `renames-cover` and step 5's `defaults-unchanged` need them once `Options/Defaults.lua` is gone.
4. **Migration and check, clearing off.** `Settings/Migrations.lua` and `Check.lua`, the clearing switch off. Scenarios: `migrate-fixture`, `migrate-twice`, `migrate-fails`, `migrate-errors`, `dead-key`, `legion-assaults`, `first-install`. `settings-dryrun.lua` on Krowi's six real files: check passes, three dead paths, and the time it takes on the 7 MB account.
   - Done 2026-11-27. The scenarios above and `saved-data-steps` (the DataIntegrityManager's other steps) pass on both clients. On the old fixture, the five values not carried are the second profile's Advanced switches, as decided ("First character's profile").
   - The marks of the DataIntegrityManager (`Build`, `Version`, `Fixes`, `Verifications`) go with the clear, not in the in-place steps. They are the in-place steps' run-once guards: with clearing off, a removed `Verifications` would walk the achievement records at every login, and a retry would merge the Legion toggles again.
   - After the advisor's review of this step:
     - **Unread values fail the check.** Any leaf of the three old variables outside what the migration reads (an AceDB `global` or `char` section, a search profile other than `Default`, a profile that is not a table) is a failing record, so the old tables are never cleared with something nobody looked at (`unread-blocks-clear`).
     - **The retry's touched marks are scoped.** They are per account key, per profile and key, per whole profile (copied, reset, deleted) and per profile choice, not per key. A value set in one profile no longer stops the retry of the same key in another (`migrate-fails` checks the second profile).
     - `RemoveEntries` inside `WithDefaults` leaves the registered defaults alone.
     - The suite proves the shipped `Check.Home`, not a copy of its own.
     - There are no AceDB wildcard defaults (`*`, `**`) in the old defaults, so the `filters` object needs none expanded.
   - **Open for step 12** (Krowi decides before clearing goes on): after a failed check, the retry moves failed filter values and profile choices again even when the player changed them since. The store does not see writes into its live filter tables: it marks a filter profile only when the profile is copied, reset or deleted. Either accept this as a limit (it applies only to a value that failed to move in the first place), or track the filter menu's writes.
   - The dry run on the six real files: the check passes on all six; not carried are only the three removed options (3 on the 2026-11-25 Retail file, 2 on the 2024-05-02 one), and no Advanced switch of another profile. Each migration takes 0-2 ms headless. The achievement-records step runs on three of the five Retail files: headless it walks the records only; in game each id costs a `GetAchievementInfoTable` call, as under the DataIntegrityManager.
5. **Declarations.** Every setting declared: the core's from `Options/Defaults.lua`, the features' from their `Defaults`, the maps' entry defaults from the tab, event and adjustable-category injections. `defaults-unchanged` (by key, against the old defaults through the rename table).
   - Done 2026-11-27. The core's 107 values, 3 maps and 3 objects are in `Settings/Declarations.lua`, converted once from `Options/Defaults.lua`. The features' `Defaults` are in the final form already (flat keys; a table declares a map), and the registry declares them and each feature's switch. `filters` and `search` are declared in `Filters.lua` and `SearchOptions.lua` with the tables they already hold. The tab, adjustable-category and event injections register their entry defaults, and the two plugins declare their settings.
   - The scenario is `defaults-by-key` (the AceDB hash scenario `defaults-unchanged` stays until step 9). Every leaf of the old defaults matches its declaration (183 values, the map entries, the object fields), with none undeclared and no new value; the `filters` and `search` objects are equal too. Both clients.
   - Bridges until AceDB leaves (step 9): the registry also writes a feature's values into AceDB's defaults at their old paths, through the rename table. A switch is declared through the rename table until the switches name their keys (step 8).
   **Reordered after step 5** (2026-11-27, gates.md): the rows and the readers move to the interface first, against an AceDB-backed mode of the store, and the switch to the real store comes after them. Wiring the store in first would have left about 715 reads of `db.profile` broken, and most suites red, for two steps. AceDB stays the truth while the code changes, so the existing proofs keep proving it: `saved-keys-unchanged`'s exact hash shows every row's key leads back to the old path it wrote.
   **Freeze rule for steps 6-8:** no `Recorded` line of the `settings`, `options` or `memory` suites changes. A line that moves is a bug, never a re-record.
6. **The AceDB mode.** `Settings/AceDBMode.lua`, its own file, loaded after the store: the store's interface (values, maps, objects, profiles, `WithDefaults`) over AceDB's three databases, through one reverse of the shipped rename table. A write of the default writes the value, never nil (AceDB's active profile holds copied defaults, which unconverted readers read). No allocation per read. Scenario `acedb-mode`: every key reads and writes its old path, raw.
   - Done 2026-11-27. `acedb-mode` passes on a new install and on the old file, both clients: all 183 value keys read, write and write their default at the old path, every map entry reads raw, `Entries` lists the old tables, and the five objects are AceDB's own tables. `defaults-by-key` now reads the declarations and the registered entry defaults (`settings.EntryDefault`, new), not `Get`, which in this mode returns the live profile. Its line is unchanged.
   - Profile events stay AceDB's here (`OnProfileChanged` errors until the switch), and `WithDefaults` swaps in a copy of AceDB's defaults, as the options window's default per option does.
7. **Rows to keys.** The row helpers; every option file's rows, on the AceDB mode. The options suite and `saved-keys-unchanged` stay exactly as recorded.
   - Done 2026-11-27.
     - **The rows.** One helper, `addon.Settings.Row(key, row)`, fills a row's get and set from the store; a row with side effects keeps its own set.
     - **The conversion.** A script wrapped the 165 rows whose getter read one literal old path, and removed that getter and its one-line setter; it refused any path the rename table does not know. By hand: the Pop Out rows, the adjustable categories, the tab show toggles, the event toggles and the two sort lists.
     - **The default-value text.** It takes a key (an entry for a map, a place for an object) and reads the declaration; the 163 literal calls were rewritten.
     - **The proof.** `saved-keys-unchanged` kept its exact hash and the options suite every line, both clients.
   - **A hole found and closed.** A deliberate swap of one row's key passed both of those proofs. That row keeps its own set, so the writes stayed right, and the two swapped settings held equal values in the old file. The new `rows-round-trip` scenario sets every option to another value and reads it back through the row's own get. All 359 (Retail) and 255 (Classic) come back, and the same swap fails it.
   - **Open for Krowi (requirement 10):** the rows' limits (`min`, `max`, `step`, `values`) stay on the rows, not in the declarations. `values` holds translated names, which `Settings/` cannot reach (it loads before the translations), and `Set` does not clamp, so moving them changes nothing a player sees. Either accept the limits on the rows, or move the numeric limits into the declarations as a follow-up.
8. **Readers.** The scripted rewrite, file by file; hand edits where code holds a subtable; the lint rules. A suite that fakes `addon.Options.db` moves to the real store (`settings-store.lua`'s `New`) when its reader changes. All headless suites and `Check-Repo.ps1` green, nothing re-recorded.
   - Done 2026-11-27, every headless suite as recorded.
     - **Scripted.** 294 literal reads and 65 writes of an old path became `Get` and `Set`, and 15 adjustable-category and event-toggle reads their map entries. Each write the script made was read over; an expression it could not split safely was left for a hand edit.
     - **By hand.** Tab order and show on the `tabs.order` and `tabs.show` maps. The event reminders pass a trigger's key set instead of a subtable, built once at file load, so the refresh ticker allocates nothing (the `memory` suite as recorded). The guide, Pop Out, Reward Preview, sort-list and remembered-position readers; the feature switches on their keys; the filter and search tables through `GetObject`; the "settings loaded" checks through `IsLoaded`.
     - **The suites that fake `addon.Options.db`** get the AceDB mode over their fake, through the suites' addon tables (`run-tests.lua`, `client-env.lua`), not the real store: the scenario code in `Tests/`, shared with the game, still writes the old paths, and moves to the interface at the switch, with these suites onto the real store.
     - **The lint rules.** `settings-direct` and `settings-keys` are added. A deliberate typo in one key fails `settings-keys` at once. Exceptions until the switch, in `Check-Repo.ignore`: `Filters.lua`, `SearchOptions.lua`, the in-game `Tests/`, and `minimap.icon`, which has no reader until the minimap hand-over.
     - Left for the switch: `Filters.lua`'s and `SearchOptions.lua`'s own databases, the Profiles section in `Options/Window/Source.lua`, and the DataIntegrityManager (step 10).
9. **The switch.** The runner and the store load first at `ADDON_LOADED`; `KrowiAF_Settings` on the `.toc`; KAF's `Options/Options.lua`; `Filters.lua` and `SearchOptions.lua` on their objects; the Profiles section on the store's two profile systems; the minimap icon hand-over; `ComputeDefault` on `WithDefaults`; `Settings/AceDBMode.lua` and AceDB leave. The settings suite's AceDB scenarios give way to the spec's whole-addon ones: `renames-by-option` at its target, `old-file-same-values` through the migration, `profile-switch`, `filter-switch` (the search toggles follow), account scope, objects bound to their profile, `sort-lists`, `map-entries`, `runner-quiet`, `sparse-save`, `first-install`.
   - Done 2026-11-27; every headless suite green, the settings suite with no target open.
     - **Load.** `Migrations.Load` runs the migrations and loads the store first at `ADDON_LOADED`; `Diagnostics.Load` prints the runner's log when debug info is on; `KrowiAF_Settings` is on the `.toc`.
     - **Options.** KAF's own options shell (`Options/Options.lua`) replaces Krowi_Util's: the pages' `OnProfileChanged` handlers run on the store's options profile events. `Options/Defaults.lua` is gone; `addon.Options.Defaults` is an empty outline.
     - **Filters and search.** `Filters.lua` and `SearchOptions.lua` run on their objects. A filter profile switch re-points every tab and marks the search stale.
     - **Window and icon.** The Profiles section and `ComputeDefault` are on the store. The minimap icon gets its two settings for the one `Icon:Load` call.
     - **What left.** AceDB leaves `Libs/`, `Settings/AceDBMode.lua` goes, and so do KAF's own `AddDefaults` calls. The feature switches name their keys (`Switch = "popOut.enabled"`).
     - **Harness.** `options-env.lua` boots through the runner and the store, and logs out through the store's save. The suites that fake an old profile get a real store migrated from it (`settings-store.lua`, `FromFakeProfile`). The in-game suites in `Tests/` use the interface; the Pictures suite still restores a value a run before kept under its old name.
     - **The settings suite on the switched build.**
       - Proofs: `old-file-same-values` (the old file migrated at boot reads back the same by option, its line unchanged), `renames-by-option` at its target (359 and 255 options), `rows-round-trip` and `defaults-unchanged` (by key, formerly `defaults-by-key`).
       - New: `profile-switch` (both systems, events, account scope, search stale), `sort-lists`, `runner-quiet`, `sparse-save`, `first-install-boot`.
       - Retired with AceDB: the hash `defaults-unchanged`, `saved-keys-unchanged`, `first-install-profile` and `acedb-mode`.
     - **Two findings.**
       - `SavedKeys` reported a map new as a whole as one path; it now walks its leaves.
       - The old fixture lacks the Legion mark every file since 104 holds (its writer never ran the DataIntegrityManager). Without it the migration merges the Legion toggles, so `old-file-same-values` gives the file that mark.
     - **After the advisor's review of the switch:**
       - The new `second-login` scenario boots again on what the logout save wrote, with `Version` 1, and every option, filter, search toggle and sort list still reads as the old build read it.
       - The Map Verifier's and the text frame's drag no longer raise: they have no remembered-position setting and read as off, as before.
       - The profile list holds the profiles that exist and the current one, as AceDB's did (`store-profile-list`).
       - A suite's fake profile is copied once and then removed, so a later write into it fails loudly. That found the navigation suite's write, now through the store.
       - In `Libs/`, only `Icon.lua` reads `addon.Options.db`, served by the hand-over.
     - **Open for Krowi before step 11:** with clearing off, the build migrates from the old tables at every login, so a setting changed in game does not survive a `/reload` (`migrate-twice` records it). Every in-game run that sets something and reloads (`-Matrix` sets the feature switches and reloads per step) cannot pass at step 11. Either those runs move to step 12, with clearing on; or clearing off marks the migration done and only skips the clear, a change to the spec's requirement on clearing.
     - **Owed before step 11:** `Compare-SavedSettings.ps1` and `saved-settings.lua` learn the new layout. `write-settings-fixture.lua` and `write-option-paths.lua` no longer run (no AceDB); their fixtures are frozen, as intended.
10. **The DataIntegrityManager's retirement**, the import fix, the dead `KrowiAF_SavedData` keys, the failure line in 11 languages, the jobs list. The real-file dry run again.
11. **In game, clearing still off.**
    - Before the first deploy: copy the six saved files to the scratchpad and take `Compare-SavedSettings.ps1 -Snapshot`.
    - Then `Deploy.ps1 -WhatIf`, deploy, Retail login.
    - The old tables are still in the file. The new store's values match the snapshot (`Compare-SavedSettings.ps1 -Options -Against`). Every suite but the probes and `-Matrix`. BugGrabber clean.
    - Then the same on Mists.
12. **Turn clearing on** (the final build); the headless suites again. In game on Retail, then Mists:
    - the first login migrates and clears: the file holds `KrowiAF_Settings` and not the three old variables; the options still match the snapshot;
    - a second login changes nothing;
    - the full suites.
13. **Reviews:** `krowi:taint-reviewer` on the diff; the code review (`REVIEW.md`); `Find-DeprecatedApi.ps1`. Then the PR, with the class checked by `Get-ChangeClass.ps1`.

## Risks
- **Krowi's real accounts get migrated by the first in-game run.** Guarded by the copies and snapshot before step 11, and clearing off until step 12. Only Krowi's own characters log in.
- **A wrong rename passes the in-game check.** Caught headless before the game: `renames-by-option` and `old-file-same-values`, both against fixtures frozen from `main` in step 1.
- **The migration is slow at login** ("script ran too long", which cut off a run on 2026-11-25). Measured in step 4 on the 7 MB account. If it comes near the limit, the achievement-records step moves to a later frame. That step runs only for a player returning from before 11.0.
- **The reader rewrite.** About 715 reads; a typo or a missed subtable is caught by the lint rules (keys), the headless suites per file, and in game. A swapped key in a reader (not a row) is not caught by the proof. The script generates readers from the same rows as the table, so a swap needs a wrong row, which the proof catches.
- **The options window's defaults, changed marks and Defaults buttons** (`ComputeDefault`): the options suites cover them headless and in game.
- **Profile switches** now refresh through change events: the `profile-switch` scenario and the options suite's profile cases.
- **Plugins and skins** (ElvUI, GW2_UI, EllesmereUI) disable rows through `KrowiAF_GetOptions`: the `plugins` suite.
- **Memory**: the logout save and change events allocate nothing at rest; the `memory` suite.
- **Load order.** The migration now runs before the Pop Out start-up log, which assumes it runs before saved-data changes (`Features/PopOut/AchievementPopout.lua:38-41`); step 9 checks it. Filters are built only after `Filters:InjectDefaults`, and map entries are never compared at load (spec, requirement 4).
- **The harness** (spec, Design): eleven headless suites, `options-env.lua`, fourteen in-game suites and `Compare-SavedSettings.ps1` read the old layout. The shared fake-store helper comes in step 2, and each suite moves in the step that breaks it. The `unit-tests` lint stays green at every commit.
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