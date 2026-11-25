# Spec: Leave the Ace libraries the options window no longer needs
Intent: [intent.md](intent.md). Status: draft

## Requirements
Saved settings (proved before any library goes, on the unchanged code, and kept green through every step):
1. **Defaults unchanged.** Two things are deep-equal to 106.0's on Retail and Mists, with the in-repo plugins stubbed loaded and unloaded:
   - the defaults of the three AceDB databases (`addon.Options.db.defaults`, `addon.Filters.db.defaults`, `addon.SearchOptions.db.defaults`);
   - on a first install (empty saved variables, headless), the raw profile AceDB has filled from them once the boot is done.
   The second catches a default registered after `db:New`, which AceDB never applies, though the first would still show it. AceDB doesn't save a value equal to its default, so a default that moves, changes or registers late changes the settings of the players who kept it.
2. **Same saved keys.** Every option that stores a value is set, one at a time, to a value other than its current one. The keys this changes in `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` and `KrowiAF_SavedData` are the same as on 106.0, option by option. Headlessly this covers every option, hidden and disabled ones included. In game it covers only what `CheckRoundTrip` already sets (shown, enabled, not locked), because it runs on the player's real character and restores each value afterwards.
3. **Old file, same values.** A saved file written by 106.0 reads back the same value for every option, including hidden and disabled ones. The file has values off their defaults in every option, in two profiles, and in the filters and search options, which no option writes.
4. **Downgrade.** The file the new build writes at logout is deep-equal to the one 106.0 writes after the same changes, so a player who goes back to 106.0 keeps everything.
5. **Nothing else moves.**
   - No `## SavedVariables` change, no new `DataIntegrityManager` solution, and no saved key added or deleted.
   - `addon.Filters:Load()` runs at the same point of the boot as today.
   - The profile callbacks (`OnProfileChanged`, `OnProfileCopied`, `OnProfileReset`, wired through `options.OptionsTables`) still run. A profile switch on each database leaves every tab's `Filters` on the new filters profile and runs as many options callbacks as today.
6. **Real files.** Krowi's own saved files (Retail: Krowi on Frostmane; Mists: the character Krowi names) give the same value for every option under 106.0 and under the new build. On disk they are deep-equal before and after the first login with the new build. These files stay on the machine and are never committed.

Libraries:
7. `Libs/Files.xml` loads no AceConfig (Registry, Dialog, Cmd), AceDBOptions, AceGUI, AceTimer, AceSerializer or AceEvent, and their folders are gone. AceDB, CallbackHandler, LibDataBroker, LibDBIcon, LibSerialize and LibDeflate stay.
8. No addon code asks LibStub for a removed library, except silently (`LibStub(name, true)`). The existing `library-names` rule (`.claude/tools/Check-Repo.ps1:471-504`) already enforces this against the libraries `Libs/` registers, so it fails as soon as the folders are gone. LibStub is shared, so in game another addon's copy could hide a leftover call. This rule is the proof, not the game.

The options window:
9. `options-fingerprint` stays byte-identical: Retail `options=414 hash=723de62c`, Classic `options=310 hash=83fced41`. Every other `options` scenario keeps its `Recorded` and `Target` lines.
10. `KrowiAF_GetOptions.GetTable(appName, path)` returns the same table as today for the six names it knows (`addon.Metadata.Title`, `KrowiAF_Layout`, `KrowiAF_Profiles`, `KrowiAF_Plugins`, `KrowiAF_Credits`, `KrowiAF_Features`). `KrowiAF.UtilApi.InjectOptions` and `KrowiAF.PluginsApi` are unchanged.

The Data Manager:
11. The Data Manager's character export and import, its log tab and the Map Verifier's export and import work as before on Retail and Mists: the text shows, scrolls and can be selected and copied, an import pastes, and the log can't be edited. An export of every character, set into the box, reads back byte-equal. An export string made by 106.0 imports.
12. The ElvUI and EllesmereUI skins of the text frame apply without errors.

## Design
### Two stages: the libraries now, the definitions later
The Ace libraries and the AceConfig *shape* of the option tables are separate things. The window reads the tables itself (`Options/Window/Source.lua:12-29`, `Root()` returns `addon.Options.OptionsTable.args`). AceConfig is only used to look a table up by name:
- six `RegisterOptionsTable` calls: `Options/General.lua:12`, `Options/Layout.lua:12`, `Options/Profiles.lua:20`, `Options/Plugins.lua:9`, `Options/Credits.lua:11`, `Features.lua:111`;
- four `GetOptionsTable` reads: `Api/API.lua:164` (`KrowiAF_GetOptions`), `Data/Data.lua:134`, `Options/General.lua:17`, `Options/Layout.lua:1522`;
- in the tests, `Tests/Options.lua:25` (AceConfigDialog's `BlizOptions`) and `:197` (the registry).

`AceConfigRegistry:GetOptionsTable` returns the very table it was given, after a one-time validation (`AceConfigRegistry-3.0.lua:317-330`). No option's `get` or `set` reads AceConfig's `info` argument; the only reader is `Source.lua`. The headless options environment already runs the addon with the whole AceConfig family faked (`.claude/tools/headless/options-env.lua:298-325`), so it has never needed the real thing.

**Stage 1 (this work item):** a registry of KAF's own replaces AceConfig's, and every option table stays as it is, key for key. With no definition touched, the saved keys can't move. Requirements 1 to 6 are the proof, recorded on the unchanged code before anything changes.

**Stage 2 (a later work item, its own intent and gates):** the native definition format the revamp spec outlined, plus whatever it settles (where the format lives, Krowi_Options or KAF; the feature registry's `AddOptions`; fixed key-binding ids; the fate of `KrowiAF_GetOptions`). It rewrites every saved path, so it is where settings can actually be lost. It runs behind the same tests 1 to 6 this stage builds.

### The registry
`addon.Options.Registry` in `Options/Options.lua`: `Register(appName, table)` and `Get(appName)`, backed by a plain table. The six `RegisterOptionsTable` calls and the four reads go through it, at the same points of the boot. `KrowiAF_GetOptions.GetTable` keeps its signature and errors the same way for an unknown name. AceConfig's validation goes; `every-option-mapped-once` and the headless load already fail on a malformed table the window can't place.

### Profiles
`Options/Profiles.lua` keeps its group and its `RegisterOptionsTable` (now the registry). It drops the two `AceDBOptions:GetOptionsTable` calls, which build tables the window never draws: the Profiles section is drawn on AceDB's own API (`Source.lua`, `ProfileOptions`). `addon.Filters:Load()`, which creates the filters database inside `profiles.RegisterOptionsTable` today (`Options/Profiles.lua:14`), stays where it is in that order. Moving it would create `KrowiAF_Filters` at another point of the boot. The profile rows are not in the fingerprint (`Model.lua`, `Fingerprint` skips options without a node), and `Coverage` claims nothing under a missing profiles subtree.

### The unused libraries
- AceEvent: `addon.Event` and its embed go (`Krowi_AchievementFilter.lua:5-6`). The runner's `PLAYER_ENTERING_WORLD` handler (`Tests/Tests.lua:527`) gets a frame of its own.
- AceTimer and AceSerializer: nothing calls them. The only other mention is LibSerialize's optional AceAddon line.

### The Data Manager's text boxes
`Gui/DataManager/Frame/FrameMixin.lua:88-98` (the log tab) and `Gui/DataManager/TextFrame/TextFrameMixin.lua:24-31` (the export and import box) use AceGUI's `MultiLineEditBox`. Both become the game's `ScrollingEditBoxTemplate`, which Retail (`live`), Mists (`classic`) and Titan (`classic_titan`) all define in `Blizzard_SharedXML/Shared/Scroll/ScrollTemplates.xml:21`. `ScrollingEditBoxMixin` (`ScrollTemplates.lua`, the same on `live` and `classic`) has `SetText` (through the edit box's `ApplyText`) and `GetText`, the two methods the callers use. So `CharacterListEntryMixin.lua:82`, `FrameMixin.lua:51,130-135`, `MapVerifierMixin.lua:1241,1252` and `TextFrameMixin.lua:8` change only where they reach AceGUI's `.frame`. The edit box limits letters only when the frame sets `maxLetters` (`:27-28`), so a long export isn't cut. The template holds a `ScrollBox` but no scroll bar: the frame adds a `MinimalScrollBar` and links the two with `ScrollUtil.RegisterScrollBoxWithScrollBar`, as Blizzard's own uses do. The log stays read-only: its `OnTextChanged` callback, registered through the mixin's callback registry (`:54`), puts the text back on user input, as today's AceGUI callback does. `Plugins/ElvUI.lua:511` anchors `frame.Input.frame` and changes with it. EllesmereUI's `SkinTextFrame` (`Plugins/EllesmereUI.lua:701-713`) doesn't touch the box.

## Options considered
1. **Scope** (what a player sees is the same in (a) and (b); the difference is risk per release):
   - **(a) Recommended: the libraries now, the definitions as a later work item.** Players see no change in the options window, and the Data Manager's text boxes take the game's look. No saved key can move, because no definition changes. The native format gets its own gate, behind the safety net built here.
   - (b) Both in one work item, as the revamp spec's stage 2 outline had it. Same end state. Every one of the ~200 definitions (414 options on Retail) is rewritten in the same release that removes the libraries, so a lost setting is far more likely and harder to pin down.
   - (c) The libraries only, never the definitions. The AceConfig shape stays for good: `Map.lua`'s placement by path, `AutoOrderPlusPlus`, the description text that `Source.lua` strips, and the auto-numbered key-binding ids.
2. **AceDB:**
   - **(a) Recommended: keep it.** It writes `KrowiAF_Options`, `KrowiAF_Filters` and `KrowiAF_SearchOptions` in the layout players have, its profiles are what the Profiles section draws, and `Data/DataIntegrityManager.lua:73-88` and the feature switches rely on its rule of not saving a value equal to its default. Replacing it shows players nothing and touches every saved setting.
   - (b) Replace it with KAF's own store. Every saved setting is then read and written by new code.
3. **The Data Manager's text boxes:**
   - **(a) Recommended: the game's `ScrollingEditBoxTemplate`** on every client. The boxes look like the game's own text boxes (the Mists art on Mists) instead of AceGUI's. AceGUI can leave.
   - (b) Keep AceGUI only for them. Nothing changes for players, but AceGUI (23 Lua files) stays loaded for two boxes.

## Areas of concern
- **Taint and secret values:** none expected. No Blizzard frame or function is touched. The new text boxes are addon frames on a template addons use routinely. Removing AceConfigDialog removes nothing from Blizzard's Settings, since KAF stopped adding pages there in 105.0 (the stub is `Options/Window/Stub.lua`). `krowi:taint-reviewer` runs on the Data Manager change.
- **Clients:** the TOC lists 120105 and 120107 (Retail), 50504 (Mists) and 38002 (Titan). Retail and Mists are tested in game. Titan has no local client; it runs Mists' code and templates (`classic_titan` clone checked for the template). KAF doesn't load on Era, Anniversary or Forever.
- **Blizzard API changes:** none. `ScrollingEditBoxTemplate` and its mixin exist on all three branches.
- **Other addons, plugins and skins:**
  - ElvUI's skin anchors the box (`Plugins/ElvUI.lua:511`); EllesmereUI's skins the frame around it.
  - An addon that calls `LibStub("AceGUI-3.0")` (or another of these libraries) without embedding its own copy, and so relied on KAF's, would break. That would be its own bug, but players could still blame KAF, so the changelog names the change. The build step checks the addons installed on the Retail and Mists clients for such a call.
  - ElvUI's plugin group shows a "Skin Ace3" row (`Plugins/ElvUI.lua:680`) about ElvUI's own setting. It stays in this stage, so the fingerprint stays fixed. Whether it still means anything goes to the backlog for stage 2.
- **Saved variables and migrations:** none by design. Requirements 1 to 6 prove it.
- **Localization:** no new strings expected. If the text boxes need a label, it is added in every locale file.
- **Embedded libraries:** only vendored Ace folders are removed, none of them a submodule. Krowi_Util isn't edited: KAF never calls its `options:Open` (replaced by `Options/Window/Window.lua:142`), and calls `options:Load(true)`, which skips AceDBOptions.
- **Data snapshots:** untouched.
- **Player-facing text:** one changelog line.
- **Change class:** `harness`. The existing `options` scenario code (`CountKafPages`, `options-registered`) and the headless environment's fakes change, though their `Recorded` lines don't.

## Verification
Recorded on the unchanged code (`main` at 8c6becf2, 106.0) and committed before any library goes:
- New `options` scenarios, run in game and headlessly:
  - `defaults-unchanged`: a hash of the three databases' defaults per client;
  - `saved-keys-unchanged`: a hash of option id to the saved paths it changed, paths only, so a player's own values don't move it, over `CheckRoundTrip`'s options.
- New headless-only scenarios:
  - `first-install-profile`: requirement 1's raw profiles;
  - `saved-keys-unchanged-all`: requirement 2 over every option;
  - `old-file-same-values`: requirement 3, on a fixture written by 106.0's code;
  - `logout-file-unchanged`: requirement 4, through AceDB's own `PLAYER_LOGOUT` handler, `AceDB-3.0.lua:352-404`;
  - `profile-switch`: requirement 5's callbacks.
- A game-only Data Manager check (requirement 11): every character's export set into the box and read back equal, and 106.0's export string imported.
- Every `options` scenario as it stands, `options-fingerprint` above all.

After each step: `Check-Repo.ps1 -ChangedOnly`, the headless `options` suite on both clients, and the suites that read the option tables (`popups`, `special`, `schedules`, `guide`, `features`, `plugins`).

In game, on Retail and Mists, with Krowi's own character:
- the saved files snapshotted right before the first login with the new build and compared right after it (requirement 6), since every earlier run changes them;
- `Run-GameTests.ps1 options`;
- the Data Manager's export, import, log and Map Verifier export as the look gate;
- `Read-GameErrors.ps1` after a `/reload`.

## Decision
Pending: scope, AceDB and the Data Manager's text boxes (Options considered 1 to 3).