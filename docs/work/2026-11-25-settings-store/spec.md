# Spec: One settings store of the addon's own, and one migration runner for every saved variable
Intent: [intent.md](intent.md). Status: done 2026-11-27

Every old path and its new key: [renames.md](renames.md). Today's layout: [inventory.md](inventory.md). The overview page Krowi reviewed: https://claude.ai/artifact/66JkVF9vXn5abLaMoSwobj.

## Requirements

**The store**
1. One module, `addon.Settings` (new folder `Settings/`), holds every option, filter and search toggle. `AceDB-3.0` leaves `Libs/`. KAF stops loading Krowi_Util's `Options/Options.lua`; its `Options/InjectOptions.lua` (the option-table helpers and plugin pages) stays.
2. Every setting is declared once: key, kind (value, map, object), type, default, limits (`Min`, `Max`, `Step`, `Values`), scope (account or profile) and which profile system it belongs to (options or filters).
    - The core declares at file load (`Settings/Declarations.lua`). A feature declares through its `AddOptions` `Defaults`, which the registry turns into declarations at `BuildOptions`, so the core still never names a feature. A plugin declares in its `InjectOptions`, since `Api/` and `Plugins/` load before `Settings/`.
    - A map has entries one or two levels deep (an event id; an addon and a tab; a special category and a tab index), keyed exactly as the old file keys them (numbers stay numbers). Each entry's default is registered by whatever adds the entry (the tab data, event data and special category code), as today's injected defaults are. A map has no map-wide default: an entry with no registered default and nothing saved reads as nil, which `EventScheduler.lua:166` and `AlertSystem.lua:284` rely on.
    - Limits serve the option rows; `Set` does not clamp, as today.
    - `addon.Options.Defaults.profile` stays as an empty outline (`Plugins`, `Tabs`, ...) so a call to `InjectOptions:AddDefaults` cannot error; nothing reads it.
3. Keys are dotted lower camelCase named by their owner, exactly as [renames.md](renames.md) lists them. The `filters` and `search` objects keep today's inner shape (PascalCase fields), so the filter menu, the search menu and `Filters.Validate` keep working on the same tables.
4. Only what differs from the default is saved: a value set to its default is removed, a reset removes it, a map saves only the entries that differ from their registered default, and an object is saved at logout as its difference from the default.
    - What has no default this session is kept as it is: an object's fields its default lacks (a disabled plugin's tab filters), a map entry nobody registered (a tab of an addon not loaded, an event no longer in the data). AceDB kept both too.
    - Nothing is compared or pruned at load: entry defaults and the filters' defaults (`Filters:InjectDefaults`, which needs the data files' build versions and `addon.Tabs`) are registered later in `ADDON_LOADED` than the store loads. An object is built from its default and its saved difference the first time `GetObject` asks for it, so after `InjectDefaults`, as `Filters:Load` does today.
    - A built object stays bound to its profile; the logout save writes every built object into its own profile. LibDBIcon keeps the `minimap.icon` table it was given, so after a profile switch its drags still land in the old profile, as with AceDB.
    - The two five-element sort lists (`tooltips.points.sortPriority`, `sortReverse`) are objects: AceDB saved them element by element, with holes (`{[1]=3, [3]=4, [4]=5, [5]=1}`), and the code changes their elements in place (`Gui/WindowFrames/AchievementFrameHeader.lua:168-180, 203`). Built from the default plus the saved elements, they are whole again.
5. Every setting's default equals its old default.
6. Two profile systems, as today: options profiles and filter profiles (the filter profiles also hold the search toggles). Each character keeps its choice of each, keyed `<name> - <realm>` as AceDB keys it; a new character starts on `Default`. Choose, create, copy, delete and reset work as today; an options profile action still lights the reload bar.
7. Account-scope settings (the Advanced section's switches and `advanced.experimental.*`) are the same on every character and do not change with a profile switch. No setting is per character yet; that layer is added with the first setting that needs it.
8. Code reads and writes settings only through the interface:
    - values: `Get(key)`, `Set(key, value)`, `Reset(key)`;
    - maps: `GetEntry(key, a[, b])`, `SetEntry(key, a[, b], value)`, `HasEntry(key, a[, b])`, `RemoveEntries(key, a)` (`Gui/Gui.lua:309` drops an unloaded addon's tabs), `Entries(key[, a])` (every registered or saved entry; `Gui/Gui.lua:257, 299` and `Api/TabDataApi.lua:99, 124` loop over the tabs), `RegisterEntryDefault(key, a[, b], value)`;
    - objects: `GetObject(key)`, the live table;
    - profiles, per system (`"options"` or `"filters"`): `Profiles`, `CurrentProfile`, `SetProfile` (also creates), `CopyProfile`, `DeleteProfile(name[, silent])`, `ResetProfile`;
    - `OnChange(key, fn)` and `OnProfileChanged(system, fn)`: a profile switch, copy or reset fires the change events of every value whose value differs, then `OnProfileChanged`. A filter profile switch re-points `addon.Tabs[t].Filters` and marks the search results stale (`addon.SearchOptions.Changed`, `BoxFrameMixin.lua:286`), as today's handlers do;
    - `IsLoaded()`: replaces the checks that use `addon.Options.db` to mean "settings loaded" (`Gui/Collections/Collections.lua:51`, `Features.lua:89`, `Features/PopOut/Help.lua:28`, `Features/RewardPreview/Help.lua:37`). Before the store loads, `Get` returns the declared default.

    Getting or setting an undeclared key is a Lua error.
9. Only `Settings/` touches the saved variable `KrowiAF_Settings`.
10. A row that reads and writes one setting names its key, and its getter, setter, limits and default text come from the declaration. A row that does more keeps its own get and set, written against the interface: a maximum that depends on another setting (`Options/Options.lua:47-51`), values built at run time (micro button tab, tab priority, the tab order slots), one row writing several event ids (`EventOptions.lua:59-62`), the tab show row that toggles (`TabDataApi.lua:163`), the sort priority rows that swap two elements, key binding and plugin info rows. `KAF_AddDefaultValueText` takes a key and, for a map, its entry. The rows keep the table shape the options window reads (`Options/Window/Source.lua`), so the window, its search, its help and its suites see no difference.
    - The window's default per option (its "changed" mark, the reset to default, a section's Defaults button) works as today. Today `Option:ComputeDefault` (`Options/Window/Source.lua:252-267`) swaps `addon.Options.db.profile` for a defaults-only copy and calls the row's get. The store gives the same with `settings.WithDefaults(fn)`. While `fn` runs, `Get` and `GetEntry` return defaults, `GetObject` a throwaway copy of the default, and every write goes to a throwaway layer, as writes into today's copy did (the first `TabsOrderGetActiveKeys` call writes, `Gui/Gui.lua:296-372`). It reports whether any setting was read. Derived rows keep working.

**The migration runner**
11. `KrowiAF_Settings.Version` (absent is 0) counts the migrations run. At `ADDON_LOADED`, before anything reads a setting, each migration above that number runs once, in order, under `xpcall`: a migration that errors counts as a failed check (requirement 15).
    - It builds its result in a new table, `Version` included, and changes nothing else.
    - Only after its check passes does it put that table in place, in one assignment, and then clear what it replaces. An error between the two leaves both the new store and the old tables, never neither.
    - Steps that work on `KrowiAF_SavedData` and `KrowiAF_Achievements` (12.5 and 12.6) are not copied (the achievement records are 7 MB on Krowi's main account). Each is safe to run twice. They run in place first, before the settings part and independent of its check, so a player whose check fails still gets the character list filled. An error in them counts as a failed check, and they run again at the next update.
    - The migration and the check read and write raw tables by key, never through `Get` or `Set`, so a known path whose key is not declared this session is carried as it is and never errors.
    - The runner calls nothing that reads a setting: `addon.Diagnostics` is not loaded yet, and its debug switch is one of the values being moved (`Diagnostics.lua:6, 32-38`). Its messages (the steps it ran, the paths without a row) go into a list. Once the store has loaded, `Diagnostics.Load` prints that list if debug info is on.
12. Migration 1, from AceDB's three databases and the DataIntegrityManager:
    1. on the copy of the old options, the Legion Assaults merge (today's solution 1), unless `KrowiAF_SavedData.Fixes.MergeLegionAssaultToggles` says it ran;
    2. every value of every options profile to its new key, by the rename table; account-scope values from the profile the logging-in character uses;
    3. every filter profile to its `filters` object; the search toggles (`KrowiAF_SearchOptions`, in practice always its `Default` profile, as it has no profile UI) copied into every filter profile's `search` object;
    4. each character's options and filter profile choices;
    5. the DataIntegrityManager's other steps: clear `KrowiAF_SavedData.AlertSystem`; fill a character's missing name and realm from its GUID; on Retail, drop account-wide achievements from the per-character records unless `Verifications.AchievementsData` says it ran; then remove `Build`, `Version`, `Fixes` and `Verifications`;
    6. remove the `KrowiAF_SavedData` keys no code reads (the list in [renames.md](renames.md), Not carried over), if Krowi agrees at this gate.
13. The check, before anything is cleared, compares against the old options as step 12.1 left them (the Legion Assaults merge applied, so its three dropped ids and a 5175 turned on are expected): every value in every old options and filter profile whose path the rename table knows is found, equal, at its new key in that profile; the search `Default` profile's values are found in every filter profile's `search` object; every character's two profile choices are equal; each account-scope value equals the one in the logging-in character's old profile. The rename table holds explicit rows only (one per old path, plus the map, list and object patterns of [renames.md](renames.md)), no catch-all. An old value whose path has no row (an option removed in the past; three such in Krowi's real files) is not moved and does not fail the check; the debug log lists it.
14. A passing check puts the results in place, sets `Version` to 1 and clears `KrowiAF_Options`, `KrowiAF_Filters` and `KrowiAF_SearchOptions` (the saved file no longer holds them). It runs once: the next login finds `Version` 1.
15. A failing check (recommended handling, see Options considered): the addon uses the new store as built, so it runs; the old tables stay untouched; `Version` stays 0; `KrowiAF_Settings.MigrationFailed` records the addon version and every failing path; the player gets one chat line per session. Once the addon's version changes (a fix release), the migration moves the failed paths again from the old tables, but only where the player has not set that key since, checks again, and clears on a pass.
16. The DataIntegrityManager retires: `Data/DataIntegrityManager.lua` goes, and its test (`Tests/Schedules.lua`, the Legion Assaults scenarios) moves to migration 1's step.
17. The Data Manager's import fills a character's missing name and realm from its GUID, which the verification did on every load until now. (It fills them as today, with the GUID's server id as realm and its hex id as name: a quirk kept as it is, outside this item.)
18. The three old variables stay on the `.toc`'s `SavedVariables` line, so the game still loads them for a returning player's migration, until Krowi removes them (probably 13.0).

**Players, plugins and the rest**
19. Players see no difference except: the Advanced switches no longer change with the options profile; the search toggles follow the filter profile. The options window, filter menu, search menu, Profiles section, minimap icon and world map icon behave as today.
20. `KrowiAF_GetOptions` still returns the option tables; the plugins (ElvUI, GW2_UI, EllesmereUI, Achievements Tab Fixes, Instance Achievement Tracker) keep working. Their settings move to `plugins.*` keys; both plugins with settings declare them unconditionally, as they inject their defaults today. The tab data and event data APIs (`KrowiAF.RegisterTabDataOptions`, `KrowiAF.RegisterEventDataOptions`) register their map entries' defaults through the store. `KrowiAF.UtilApi.InjectOptions` stays for its table helpers; its `AddDefaults` writes a table nothing reads any more. Only KAF's own plugins call it; an outside addon could, but would then read its value from `KrowiAF_Options` directly, which is not a documented API.
21. The logout save and the change events allocate nothing while nothing changed; the logout handler is listed in `.claude/tools/Check-Repo.jobs` as running once.

## Design

**Files** (loaded before `Options/`, after the namespace files; `docs/architecture.md` gets the order):
- `Settings/Store.lua`: declarations, the interface, scopes, the two profile systems, kinds, the logout save (an own frame's `PLAYER_LOGOUT`, as AceDB's strip).
- `Settings/Migrations.lua`: the runner and migration 1, with the old DataIntegrityManager steps as local functions.
- `Settings/Renames.lua`: the rename table, old path to new key and kind, generated from the same rules as [renames.md](renames.md) and committed.
- `Settings/Check.lua`: the check in requirement 13, run by the runner and by the headless suite.
- `Options/Options.lua` takes over what KAF used from Krowi_Util's `Options/Options.lua`: `OptionsTable`, `OptionsTables`, `WidthMultiplier`, `Load`, `Open` and the two `KAF_` string helpers, `KAF_AddDefaultValueText` reading the declaration's default.

**Saved layout** (one saved variable, `KrowiAF_Settings`, added to the `.toc`):
```lua
KrowiAF_Settings = {
    Version = 1,
    Account = { ["advanced.debugInfo"] = true },
    Options = {
        Profiles = { Default = { ["popOut.closeOnEarnDelay"] = 0, ["eventReminders.calendarEvents"] = { [374] = false } } },
        ProfileOf = { ["Name - Realm"] = "Default" },
    },
    Filters = {
        Profiles = { Default = { filters = { Tabs = { … } }, search = { SearchIds = true } } },
        ProfileOf = { ["Name - Realm"] = "Default" },
    },
}
```

**Reading.** `Get(key)` looks in the account table or the current profile, then the declaration's default: two table lookups and no allocation. Objects (`filters`, `search`, `minimap.icon`) are live tables built at load and on a profile switch (default merged with the saved difference), so the code that holds them (`addon.Tabs[t].Filters`, LibDBIcon) works as today. `addon.Filters.db.profile` becomes `settings.GetObject("filters")`.

**Rows.** Small helpers build rows from a key (`settings.Toggle(key, row)`, `Range`, `Select`, `Input`, `Color`): they fill `get`, `set`, `min`, `max`, `step`, `values` and the default text from the declaration and keep the row's own extras (`disabled`, `hidden`, side effects after a set). The hand-built getters and setters across `Options/*.lua`, `Features/*/Options.lua` and `Plugins/` go.

**The minimap icon.** Krowi_Util's `Icon.lua` reads `addon.Options.db.profile.Minimap` and `.ShowMinimapIcon` once, in `Icon:Load`. KAF hands it exactly that for the duration of that call: the live `minimap.icon` object (LibDBIcon keeps and writes into it, and `Icon:Load` sets its `hide`) and `minimap.showIcon`. The stand-in `addon.Options.db` is removed right after the call, so no "settings loaded" check can see it. Letting `Icon:Load` take its table as an argument goes to the backlog for Krowi_Util, together with the store moving there.

**The rename table's safety net.** The in-game check reads with the same table the migration wrote with, so it finds a value that went missing, not one put under the wrong key: swapping the two `CenterHeader` rows would pass it, and the old tables would then be cleared. So the table is proven headless, before any build reaches the game, against sources that do not come from it:
- **Coverage:** every path an option writes when set, every leaf of the old defaults tree, and every value in the fixtures and in Krowi's real saved files (read headless). This found the tab order (`Tabs.<addon>.<tab>.Order`, written by no option the proof sets, `Api/TabDataApi.lua:59`) and the three values of removed options.
- **Correctness, by option:** before any code changes, the old build's full list of option Id → saved paths is frozen from `main` (72c80618) as a fixture per client. For every option Id, the old path's row in the table must give the key the new build's row for that Id writes when set. The option Ids survive the change, since the rows keep their table shape (requirement 10).
- **End to end, by option:** the old fixture file is migrated, and for every option Id in every profile, the value the new build's row shows equals the value the old build's row showed (the `-values` fixtures of docs/work/2026-11-25-leave-aceconfig). This is the check a swapped key fails.

**Rewriting the readers.** About 715 reads of `db.profile` in 88 files change to the interface. The rewrite is generated from the same rows (a script replaces each `addon.Options.db.profile.<old path>` with `settings.Get("<new key>")`). It is done by hand where the path is not literal or code holds a subtable:
- dynamic paths: `EventReminders[eventType .. "Events"]`, `options[eventType.On]`, `AdjustableCategories[category][tabIndex]`, `Tabs[addon][tab]`;
- the feature switches as saved paths (`Features.lua:89-90, 102, 165, 407`);
- subtables passed as arguments (`AlertSystem.lua:21, 642-643`, `EventReminders.lua:21-24`). The refresh ticker at `AlertSystem.lua:642` is a background job: it must keep reading in place and build no table per tick. Each file's suites run headless after it. Lint rules make a typo fail, though not a swapped key (the proof above catches that): `settings-keys` (every literal key in a `Get`, `Set`, `GetEntry`, `SetEntry`, `GetObject`, `OnChange` or row helper is declared, and every declaration is used) and `settings-direct` (no `db.profile`, no `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` or `KrowiAF_Settings` outside `Settings/`, matched as whole words, since frame names such as `KrowiAF_SearchOptionsMenuButton` contain one).

**The test harness moves with the code.** Besides the `settings` suite:
- `.claude/tools/headless/options-env.lua` repeats `ADDON_LOADED`'s steps by hand (402-424) and imitates AceDB's logout (468-488): it gets the runner and the store.
- Eleven headless suites build a fake `addon.Options = { db = { profile = … } }` in the old layout: special, navigation, worldmap, tooltip, guide, memory, events, schedules, earned, features and the runner (`run-tests.lua`; `earned` also fakes `LibStub("AceDB-3.0")`). They get one shared helper that builds a real store with given values.
- Fourteen in-game suites (`Tests/*.lua`) set and put back settings by old path or through AceDB's profile calls (`Tests.lua`, `PopUps.lua`'s profile switch, `Pictures.lua`'s saved restore values in `KrowiAF_DebugTable`, `Features.lua`'s switches, ...). They move to the interface. A restore value saved under an old name by a run before the change is read once more under that name.
- `.claude/tools/Compare-SavedSettings.ps1` and `saved-settings.lua` read through AceDB's API and dump the three old variables. They learn the new layout, so a snapshot taken before the migration compares, by option, with the migrated file.

**Clearing stays off until proven.** Until the headless proof and the dry run on Krowi's real files are green, the build migrates and checks at every login and runs on the result, but neither sets `Version` nor clears anything (a switch in `Settings/Migrations.lua`, turned off only for the final build; settings changed in game during development are rebuilt from the old tables at the next login). Otherwise the first in-game run of a half-built branch would migrate and clear Krowi's real accounts, and every later build would find `Version` 1 and never migrate again.

## Options considered

**The filters and search toggles.**
- **A (recommended): two object settings per filter profile, inner shape unchanged.** The filter menu writes by key path into nested tables, writes to the all-tabs set fan out to every tab (`FilterButtonMixin.lua:70-86`), and `Filters.Validate` reads the tables for every achievement. Keeping the shape keeps all of that, and the move is a copy.
- B: flatten the filters into keys like the options. Rewrites the filter menu, the fan-out and the validation hot path for no player benefit, with a real risk of filter bugs.

**A failing check.**
- **A (recommended): run on the new store, keep the old tables, move only the failed values again after the next update, tell the player once per session.** The player keeps a working addon; nothing is lost; a fix release moves what failed and keeps what the player changed meanwhile.
- A2: as A, but the update reruns the whole migration. Simpler, but throws away every change the player made between the failure and the fix.
- B: try again at every login. Each login would throw away the changes the player made since, and repeat the same failure until a fix ships.
- C: refuse to run until fixed. A broken addon for that player, for a problem the old tables already guard against.

**How far the option rows go.**
- **A (recommended, Krowi: "everything in"): rows name keys; their table shape stays the one the window reads.** The native format (rows in Krowi_Options' own format instead of AceConfig's shape) stays in `docs/backlog.md`: it changes no saved data and reworks what the window reads.
- B: the native format in the same release. Doubles the change to every option file without moving a single setting.

**The Advanced switches, per profile today, account-wide after.** Which old profile's value wins when a player has several:
- **A (recommended): the profile of the character that logs in first after the update.** What that player sees at that moment stays the same; switches set only in another profile are lost. These are debug and diagnostics switches (debug info, trace info, taint diagnostics, map info, placeholders filter, the Collections window experiment).
- B: on if on in any profile (off for taint diagnostics, whose default is on: off if off in any). Keeps every switch someone turned away from its default, but can turn on debug output a player only meant for one character.

**One saved variable or three.** One (`KrowiAF_Settings` with `Account`, `Options` and `Filters`) keeps the version number, the two profile systems and the account scope in one place; three would need a version each.

**The old `KrowiAF_SavedData` keys no code reads.** Removing them (recommended) matches "no polluted files"; leaving them costs nothing but file size.

## Areas of concern

- **Taint and secret values:** no Blizzard frame, function or global is touched. The logout save runs on an own frame's `PLAYER_LOGOUT`. LibDBIcon gets a plain table as today. No secret values are read. Run `krowi:taint-reviewer` on the diff anyway (event frame, `Icon:Load` hand-over).
- **Clients:** one `.toc`, `## Interface: 120105, 120107, 50504, 38002` (Retail 12.1.5 and its PTR 12.1.7, Mists 5.5.4, Titan 3.80.2). The world and widget event maps are Retail only and stay empty elsewhere. Titan has no local install: headless only, as for every change.
- **Blizzard API:** `UnitName`, `GetRealmName` and `PLAYER_LOGOUT`, unchanged on every client; nothing removed or deprecated (`Find-DeprecatedApi.ps1` on the diff).
- **Other addons, plugins and skins:** `KrowiAF_GetOptions` callers unchanged. An outside addon that reads `KrowiAF_Options` or `addon.Options.db` directly stops finding it; neither is a documented API. Krowi_Reminders is out of scope.
- **Saved variables and migrations:** the whole item. `KrowiAF_Settings` is new; the three old variables are cleared after a passing check and stay declared. `KrowiAF_SavedData` and `KrowiAF_Achievements` come under the runner. `KrowiAF_DebugTable` and `KrowiAF_MapVerifier` are debug and developer tools with nothing to migrate and stay as they are.
- **Localization:** one new player text, the failure line in requirement 15, in all 11 locale files. The Profiles section's texts are unchanged.
- **Embedded libraries:** `AceDB-3.0` leaves `Libs/` and `Libs/Files.xml`. Krowi_Util is not changed: KAF stops loading its `Options/Options.lua`, keeps `Options/InjectOptions.lua` and `Icon.lua`. No library release.
- **Data snapshots:** none touched.
- **Player-facing text:** the changelog (heading 106.1 until Krowi picks 107.0 at release): the settings move to a new store and carry over on their own; the Advanced switches no longer follow the profile; the search options follow the filter profile. The failure chat line.

## Verification

**Headless, the `settings` suite reworked** (`.claude/tools/headless/run-tests.lua`; the fixtures from docs/work/2026-11-25-leave-aceconfig are the old files):
- `defaults-unchanged`: every declaration's default equals the old default at its old path, by the rename table (Retail and Classic).
- `renames-cover`: every path an option writes, every leaf of the old defaults tree and every value in the fixtures has an explicit row; no two old paths share a key.
- `renames-by-option`: for every option Id in the frozen list, the old path's row gives the key the new row writes (Retail and Classic).
- `old-file-same-values`: after migrating the old fixture file, every option Id in every profile shows the value the old build showed (the `-values` fixtures), by Id.
- `dead-key`: an old value with no row, under a known prefix (`Achievements.ShowDateCompletedTime`), is skipped and logged and does not fail the check.
- `migrate-errors`: a migration that errors midway changes nothing: no new store in place, nothing cleared, the failure recorded.
- `migrate-fixture`: the old fixture file migrates, the check passes, every value reads back equal, the profile choices are kept, the three old variables are cleared, `Version` is 1.
- `migrate-twice`: a second load changes nothing.
- `migrate-fails`: a planted dropped value fails the check: nothing cleared, `Version` 0, every failing path recorded, the new store in use; the next load with the same addon version does not run it again; one with a new version moves only the failed paths, keeps a value the player changed since, and clears on a pass.
- `legion-assaults`: the Tests/Schedules scenarios against migration 1's step (the merge for a pre-104 file, nothing for a file that ran it), and the check passing on a pre-104 file.
- `sort-lists`: the fixture's holed sort lists (`{[1]=3, [3]=4, [4]=5, [5]=1}`) come back whole, and the points tooltip's sort reads five elements.
- `map-entries`: an entry with no registered default and nothing saved reads nil; a saved entry nobody registered survives a logout save; `Entries` lists registered and saved entries; `RemoveEntries` drops an addon's tabs.
- `runner-quiet`: the migration runs with diagnostics not loaded and debug info on in the old file, without an error; its messages print after `Diagnostics.Load`.
- `with-defaults`: inside `WithDefaults`, a write leaves the real profile untouched and `GetObject` gives a copy.
- `filter-switch`: a filter profile switch re-points every tab's filters and marks the search stale; the options profile stays.
- `profile-switch`: options and filter profiles switch independently; change events fire for the keys that differ; account values do not change.
- `sparse-save`: a value set to its default leaves the saved table; an object's logout save holds only its difference; a disabled plugin tab's filters survive.
- `first-install`: no old variables, no `KrowiAF_Settings`: defaults everywhere, `Version` 1, nothing else written.

**Krowi's real files, headless and read-only:** the six files (five Retail accounts written between 2024-05 and 2026-11, one Mists) migrate in memory and pass the check; the only paths without a row are the three of removed options. They are read from the game folder, never written, never committed.

**Lint:** `settings-keys` and `settings-direct` pass on the whole tree; `Check-Repo.ps1` clean.

**In game, Retail and Mists:**
- **Before the first deploy:** copy the six saved files into the scratchpad and take `Compare-SavedSettings.ps1 -Snapshot`. The first login with the new build migrates Krowi's real accounts, so a bad migration can be put back. Only Krowi's own characters.
- After login: the saved file holds `KrowiAF_Settings` and no longer the three old variables. The options window shows the same values as the snapshot's (`Compare-SavedSettings.ps1 -Options` against the snapshot).
- Every suite but the probes, as the release gate runs them (the readers' rewrite reaches nearly every file, so every suite is one the change can affect), and `/kaftest matrix` for the features' switches (`Run-GameTests.ps1 -Matrix`). BugGrabber clean.

## Decision
Approved by Krowi, 2026-11-27 ("either way, go ahead"), with the recommended option on every question:
- Filters and search toggles: two objects per filter profile, inner shape unchanged; the key names as in [renames.md](renames.md).
- A failing check: run on the new store, keep the old tables, move only the failed values again after the next update, one chat line per session.
- The Advanced switches: from the profile of the character that logs in first after the update.
- The `KrowiAF_SavedData` keys no code reads: removed in migration 1.

Krowi asked how sure the spec is that it forgets nothing. It was checked once by the advisor (four gaps, all fixed above) and against Krowi's real saved files. A second pass found the window's default per option (requirement 10). An independent review of the spec against the code (a fresh agent, 2026-11-27) found five real gaps, and the spec now covers each:
- the debug log during the migration (requirement 11);
- the holed sort lists (4);
- the Legion Assaults merge against the check (13);
- the test harness on the old layout (Design);
- map listing and removal (8).

It also found thirteen points that were too vague, folded into requirements 2, 4, 8, 10, 11, 15 and the Design; and one default no code uses (`Categories.Excluded.CharacterSpecific`, [renames.md](renames.md)). The behaviour Krowi approved is unchanged.