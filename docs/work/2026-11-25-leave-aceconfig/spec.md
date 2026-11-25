# Spec: Stop loading AceConfig and AceDBOptions, with proof that no setting moves
Intent: [intent.md](intent.md). Status: accepted

## Requirements
**Saved settings.** Each check is recorded on the code before this item (`main` at 54fe7203, whose options code is 106.0's), committed before anything changes, and kept green through every step.
1. **Defaults unchanged.** Two things are deep-equal to the baseline, on Retail and Mists, with the in-repo plugins stubbed loaded:
   - the defaults of the three AceDB databases (`addon.Options.db.defaults`, `addon.Filters.db.defaults`, `addon.SearchOptions.db.defaults`);
   - on a first install (empty saved variables, headless), the raw profile AceDB has filled from those defaults once the boot is done.

   The second catches a default registered after `db:New`, which AceDB never applies, though the first would still show it. AceDB doesn't save a value equal to its default, so a default that moves, changes or registers late changes the settings of the players who kept it.
2. **Same saved keys.** Every option that stores a value is set, one at a time, to a value other than its current one. The raw keys this changes in `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` and `KrowiAF_SavedData` are the same as at the baseline, option by option.
   - Headless, this covers every option, hidden and disabled ones included.
   - In game it covers only what `CheckRoundTrip` already sets (shown, enabled, not locked), since it runs on the player's real character and puts each value back.
3. **Old file, same values.** A saved file written by the baseline code reads back the same value for every option, hidden and disabled ones included. The file has values off their defaults in every option, in two profiles, and in the filters and search options, which no option writes.
4. *(Dropped: a downgrade check. Krowi, 2026-11-25: "no need to foresee downgrades".)*
5. **Nothing else moves.**
   - No `## SavedVariables` change, no new `DataIntegrityManager` solution, and no saved key added or deleted.
   - `addon.Filters:Load()` runs at the same point of the boot as today.
   - The profile callbacks (`OnProfileChanged`, `OnProfileCopied` and `OnProfileReset`, wired through `options.OptionsTables`) still run. A profile switch on each database leaves every tab's `Filters` on the new filters profile, and runs as many options callbacks as today.
6. **Real files.** Krowi's own saved files (Retail: Krowi on Frostmane; Mists: the character the kit logs in with) give the same value for every option under the baseline and under the new build. On disk they are deep-equal before and after the first login with the new build. These files stay on the machine and are never committed.

**Libraries**
7. `Libs/Files.xml` loads no AceConfig (registry, cmd, `AceConfig-3.0.lua`) and no AceDBOptions, and their folders are gone. AceDB, CallbackHandler, LibDataBroker, LibDBIcon, LibSerialize and LibDeflate stay.
8. No addon code asks LibStub for AceConfig, AceConfigRegistry, AceConfigCmd or AceDBOptions except silently; the `library-names` rule (`.claude/tools/Check-Repo.ps1:471-504`) fails otherwise.

**The options window and the API**
9. `options-fingerprint` stays byte-identical: Retail `options=414 hash=723de62c`, Classic `options=310 hash=83fced41`. Every other `options` scenario keeps its `Recorded` and `Target` lines, `options-registered apps=6` included.
10. `KrowiAF_GetOptions.GetTable(appName, path)` returns the same table as today for the six names it knows (`addon.Metadata.Title`, `KrowiAF_Layout`, `KrowiAF_Profiles`, `KrowiAF_Plugins`, `KrowiAF_Credits`, `KrowiAF_Features`), and errors the same way for an unknown one. `KrowiAF.UtilApi.InjectOptions` and `KrowiAF.PluginsApi` are unchanged.

## Design
### The registry
`AceConfigRegistry:GetOptionsTable` returns the very table it was given, after a one-time validation (`AceConfigRegistry-3.0.lua:317-330`). No option handler reads AceConfig's `info` argument; only `Source.lua` builds one, for itself.
- **The new registry:** `options.Registry` in `Options/Options.lua`, with `Register(appName, table)` and `Get(appName)` over a plain table.
- **What changes:** the six registrations and the four reads go through it, at the same points of the boot. `options-registered` reads it.
- **`KrowiAF_GetOptions.GetTable`** keeps its signature and its `assert` message.
- **AceConfig's validation goes.** `every-option-mapped-once` and the headless load already fail on a table the window can't place.

### Profiles
`Options/Profiles.lua:11-13` and `:16-18` go: the two AceDBOptions tables, their `order` and `name`.
- **What stays:** `addon.Filters:Load()` (`:15`) and the page's registration (now in the registry), in the same order. The window draws the profiles from AceDB's API, and `Model.lua`'s `Coverage` claims nothing when the subtree is missing (`:85-88`).
- **The two order numbers:** the two `OrderPP()` calls drawn from Krowi_Util's shared counter (`Libs/Krowi_Util/Options/InjectOptions.lua:26`) go with them. Every order handed out after the Profiles registration shifts down by two: the Credits rows that `credits.PostLoad` adds. Those rows sort only among themselves, after the group's static rows, so the drawn order doesn't change. The fingerprint holds ids, types and defaults, not orders, and requirement 9 checks it. The key-binding rows that carry an order in their key (`Binding523Key1`) are injected before the options load (`Krowi_AchievementFilter.lua:29`, `InjectTabDataDynamicOptions`, before `Options:Load` at `:33`), so they keep their numbers.

### The headless environment
The AceConfig fakes go (`options-env.lua:297-324`), along with AceConfig's entry in the skip list (`:86`). `ctx.Registry` becomes the addon's own registry, and `ctx.BlizOptions` becomes an empty list. The comments in `run-tests.lua` (`:39`, `:475`, `:1723`) follow.

### The saved-settings proof
The design of the first draft (commit b588b39d, `docs/work/2026-11-25-leave-ace/`), built here:
- **The environment:** `opts.SavedVariables` (the four saved tables before the boot), `ctx.Logout()` (AceDB's own `PLAYER_LOGOUT` handler, `AceDB-3.0.lua:352-404`) and `ctx.Serialize` (a sorted dump for hashes and fixtures).
- **The model** (`Options/Window/Model.lua`): `DefaultsHash`, `FirstInstallProfiles`, `SavedKeys(all)` and `ProfileSwitch`.
- **Fixtures:** `.claude/tools/headless/write-settings-fixture.lua` writes them once from the baseline code, to `.claude/tools/headless/fixtures/`.
- **The real-file tool:** `.claude/tools/Compare-SavedSettings.ps1`, with `-Snapshot`, `-Compare` and `-Options`.
- **The scenarios:**
  - in game and headless: `defaults-unchanged` and `saved-keys-unchanged`;
  - headless only: `first-install-profile`, `saved-keys-unchanged-all`, `old-file-same-values` and `profile-switch`.

## Options considered
1. **How much of the proof this item builds** (players see nothing either way; the difference is what guards their settings now and later):
   - **(a) Recommended: all of it.** Every requirement from 1 to 6, as the draft has it. This item's real risk is small: it touches the boot around the filters database. But Krowi asked for a guarantee, and the same tests guard any later change to the option definitions (the native format, or any new option), so they pay off beyond this item.
   - (b) Only what this change needs: defaults, saved keys (headless) and the profile switch. Half the work. The old-file fixture, the downgrade check and the real-file comparison would wait for the native-format item, if it ever comes.
2. **AceDB:**
   - **(a) Recommended: it stays for good.** It writes `KrowiAF_Options`, `KrowiAF_Filters` and `KrowiAF_SearchOptions` in the layout every player has. Its profiles are what the Profiles section draws. `Data/DataIntegrityManager.lua:73-88` and the feature switches rely on its rule of not saving a value equal to its default. Replacing it shows players nothing and puts every saved setting through new code. "Leaving Ace" ends with this item.
   - (b) Replace it later with KAF's own store, as its own item behind this proof.

## Areas of concern
- **Taint and secret values:** none. No frame, hook or Blizzard API changes. KAF stopped adding Settings pages in 105.0.
- **Clients:** Retail (120105, 120107), Mists (50504) and Titan (38002). Tested in game on Retail and Mists.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:**
  - `KrowiAF_GetOptions` keeps working (the EllesmereUI and ElvUI plugins, `Plugins/EllesmereUI.lua:943-956`, `Plugins/ElvUI.lua:699-701`).
  - An addon that called `LibStub("AceConfig-3.0")` or `LibStub("AceDBOptions-3.0")` and relied on KAF's copy would break. The plan scans the installed addons for that, as in the two items before.
- **Saved variables and migrations:** none by design; requirements 1 to 6 prove it.
- **Localization:** none. AceDBOptions' own strings are not used: the window passes KAF's.
- **Embedded libraries:** only vendored Ace folders go, none of them a submodule. Krowi_Util is not edited: it names AceDBOptions only in `options:Load` without `true` (`Options/Options.lua:58-60`), and KAF passes `true`.
- **Data snapshots:** untouched.
- **Player-facing text:** one changelog line.
- **Change class:** `harness`. The test tooling's existing lines change (the fakes, `options-registered`).

## Verification
- `Check-Repo.ps1` on the whole tree, `library-names` included.
- Headless, both clients:
  - the `options` suite with every line unchanged, plus the new proof lines;
  - the suites that read the option tables: `popups`, `special`, `schedules`, `guide`, `features` and `plugins`.
- In game, Retail then Mists:
  - Krowi's files snapshotted right before the first login with the new build, and compared right after it;
  - `Run-GameTests.ps1 options, special, popups`;
  - `Read-GameErrors.ps1`;
  - a scan of the installed addons.

## Decision
2026-11-25, Krowi:
- Intent accepted without the downgrade requirement: "no need to foresee downgrades". Requirement 4 and its scenario are dropped.
- The proof: "i also want to explore a data migration at the same time to re-organize setting and move user settings". Asked how to sequence it, Krowi chose one migration, together with replacing AceDB, as a later item: "One migration, with the AceDB swap". So this item stays mechanical and builds the whole proof (requirements 1 to 3, 5 and 6), which that migration reuses: its old-file check becomes every old value found at its new place.
- AceDB: replaced later, in that migration item (option 2b).
- Plan approved.