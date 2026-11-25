# Plan: Leave the Ace libraries the options window no longer needs
Spec: [spec.md](spec.md). Status: draft

Drafted with the spec at Krowi's request, for review together. It assumes the recommended option on each of the spec's three questions. If the answer is (b) on scope, this plan is rewritten.

## Files that change
The safety net (step 1), on the unchanged code:
- `.claude/tools/headless/options-env.lua`:
  - `opts.SavedVariables`: the four saved tables (`KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions`, `KrowiAF_SavedData`) set before the boot, as the game loads them. Today's `opts.Profile` (`:437-438`) covers one profile only.
  - `ctx.Logout()`: runs AceDB's own logout handler (`AceDB.frame`'s `OnEvent` with `PLAYER_LOGOUT`, `AceDB-3.0.lua:352-404`), which strips the defaults as the game does before writing the files.
  - `ctx.Serialize(value)`: a deterministic dump with sorted keys, for hashes and for the fixture.
- `Options/Window/Model.lua`:
  - `model.DefaultsHash()`: the three databases' `db.defaults` serialized and hashed.
  - `model.SavedKeys()`: every option of `model.Options()` with a type that stores a value (toggle, range, select, input), hidden and disabled included, unlike `CheckRoundTrip`. Each is set to `OtherValue`; the raw keys it changed in the four saved tables are listed as `id => <table>.<path>`, then the value goes back. Returns the count and a hash. Key bindings go to the game's binding set and executes store nothing, so neither is in it.
- `Tests/Options.lua`: scenarios `defaults-unchanged` and `saved-keys-unchanged` (game and headless), with `Recorded` = `Target` = today's values, `RecordedClassic`/`TargetClassic` for Mists.
- `.claude/tools/headless/run-tests.lua`: the two headless-only scenarios `old-file-same-values` and `logout-file-unchanged`, and the models for the four new lines.
- `.claude/tools/headless/write-settings-fixture.lua` (new, run once on 106.0's code):
  - boots Retail and Classic;
  - sets every storing option off its value in profile `Default`, makes a second profile `Second` with every toggle flipped back, logs out;
  - writes `.claude/tools/headless/fixtures/settings-106-<client>.lua` (the four saved tables after logout) and `settings-106-<client>-values.lua` (option id to value, per profile).
- `.claude/tools/Compare-SavedSettings.ps1` (new):
  - `-Snapshot <dir>` copies a character's four saved files from a client's `WTF`;
  - `-Compare <dir>` deep-compares them with the current files through the kit's `lua51` (only these four globals; `KrowiAF_SavedData` without its per-login fields, listed in the tool);
  - `-Options <dir>` boots the headless environment of the current checkout on a snapshot and prints every option's value, so 106.0's checkout and this branch can be diffed on Krowi's real files. Snapshots go to the scratchpad, never into the repo.
- `.claude/tools/Check-Repo.ps1` (and its README row): rule `libstub-loaded`. Every `LibStub("<name>")` or `LibStub('<name>')` outside `Libs/` names a library that `Libs/Files.xml` loads, directly or through an included XML. A silent lookup (`LibStub(name, true)`) is allowed, because it can't error. It has a test case, as the other rules do.

The libraries (steps 3 to 6):
- `Krowi_AchievementFilter.lua:4-6`: `addon.Event` and the AceEvent embed go.
- `Tests/Tests.lua:527`: a frame of its own for `PLAYER_ENTERING_WORLD`, with the handler unchanged.
- `Options/Options.lua`: `options.Registry` with `Register(appName, table)` and `Get(appName)`.
- The registrations move to the registry, at the same points: `Options/General.lua:11-13`, `Options/Layout.lua:11-13`, `Options/Plugins.lua:8-10`, `Options/Credits.lua:10-12`, `Features.lua:109-113`.
- `Options/Profiles.lua:10-21`: the two `AceDBOptions-3.0` tables go. `addon.Filters:Load()` stays, first in `profiles.RegisterOptionsTable`.
- The reads move to the registry: `Api/API.lua:164`, `Data/Data.lua:134`, `Options/General.lua:17`, `Options/Layout.lua:1522`.
- `Tests/Options.lua`: `CountKafPages` (`:24-31`) asks for AceConfigDialog silently (`LibStub("AceConfigDialog-3.0", true)`). Another addon may still load it, and then the step still proves KAF added no page; without it the count is 0, so the line stays `pages=0`. `options-registered` (`:197`) reads the registry and still gives `apps=6`. Their `Recorded` and `Target` lines stay.
- `.claude/tools/headless/options-env.lua`: the AceConfig fakes (`:298-325`) and their skip-list entries (`:86-87`) go. `ctx.Registry` becomes the addon's registry, and `ctx.BlizOptions` becomes empty. `run-tests.lua`'s comments (`:39`, `:475`, `:1723`) follow.
- `Gui/DataManager/TextFrame/` (mixin and XML) and `Gui/DataManager/Frame/FrameMixin.lua:88-98`:
  - the two `MultiLineEditBox` widgets become `ScrollingEditBoxTemplate` frames, kept in the same fields (`Input`, `Log`) with `SetText` and `GetText`;
  - the log stays read-only through its `OnTextChanged`.
- The callers that reach AceGUI's `.frame`: `Gui/DataManager/Frame/FrameMixin.lua:130-135` and `Plugins/ElvUI.lua:511`.
- `Libs/Files.xml`: the lines of AceTimer, AceEvent, AceDBOptions, AceGUI, AceConfig and AceSerializer go. Their six folders under `Libs/` go.
- `docs/architecture.md` (`:46`, `:110-122`), `Tests/README.md` (the `options` row) and `.claude/tools/README.md`: say what is true afterwards.
- `docs/backlog.md`: the stage 2 item (the native format, its open questions, and ElvUI's "Skin Ace3" row).
- `_Packaging/Changelog.md`, under the next version's `### Changed`: "The addon no longer loads the Ace3 libraries its old options pages needed (AceConfig, AceGUI and four others); your settings stay as they are."

## Order of work
Each step is a commit. The safety net is green after every one.
1. **Safety net, on 106.0's code.**
   - Build the environment additions, the model functions, the four scenarios, the fixture writer and the compare tool.
   - Run the fixture writer, then the `options` suite headlessly on both clients, and record its lines.
   - Deploy the unchanged build to Retail and record the in-game lines of `defaults-unchanged` and `saved-keys-unchanged` with `Run-GameTests.ps1 options`, then the same on Mists. Where an in-game line differs from the headless one, the step lists the keys. The plan is updated with why (a plugin really loaded, for instance), and the scenario records the game's own value.
   - Take a `Compare-SavedSettings.ps1 -Snapshot` of Krowi's character on both clients, and its `-Options` output from 106.0's checkout.
   - Commit: `test: record the saved settings that leaving Ace must keep`.
2. **The lint rule.** `libstub-loaded`, green on the unchanged tree. Commit: `chore(harness): lint LibStub calls against the loaded libraries`.
3. **AceTimer, AceSerializer, AceEvent.** Remove them as listed. Then: the headless suites, the safety net, `Check-Repo.ps1 -ChangedOnly`. Commit: `refactor: stop loading AceTimer, AceSerializer and AceEvent`.
4. **The registry.** Add it, switch the six registrations, the four reads and the two test lookups, and make the headless environment use it with its AceConfig fakes still in place. All lines stay unchanged. Commit.
5. **AceConfig and AceDBOptions out.** Drop the `AceDBOptions` tables from `Profiles.lua`, the fakes from the environment, and the libraries from `Libs/`. Run the safety net, the whole `options` suite and the suites that read the option tables (`popups`, `special`, `schedules`, `guide`, `features`, `plugins`), on both clients. Commit.
6. **The Data Manager's text boxes.**
   - Replace the two widgets and the ElvUI anchor; run `krowi:taint-reviewer` on the diff.
   - Deploy to Retail and put it in front of Krowi first (look first, full suites after): an export of a character, an import, the log tab, the Map Verifier's export, with and without ElvUI.
   - On Krowi's approval (the `look` row), AceGUI goes from `Libs/`. Commit.
7. **The real files.**
   - Deploy the branch to Retail and log Krowi's character in, then `/reload`. `Compare-SavedSettings.ps1 -Compare` against step 1's snapshot: no difference.
   - `-Options` on the snapshot from this branch: the same values as 106.0's checkout gave.
   - The same on Mists.
   - Scan the addons installed on both clients for a `LibStub("<removed library>")` in an addon that ships no copy of it, and report it.
8. **Docs and changelog**, then the PR: `Get-ChangeClass.ps1`, `/code-review`, the PR with the Decisions section.

## Risks
- **A default that moves.** `addon.Options.Defaults` is filled from many places before `Options:Load(true)`: `Defaults.lua`, `Features.BuildOptions`, the tab, header, event and special-category injections, `Filters:InjectDefaults`, and `InjectPluginOptions`. A changed default rewrites the settings of everyone who kept it. Guard: `defaults-unchanged`, taken at `db:New` on both clients. The boot order in `Krowi_AchievementFilter.lua:25-40` is not touched.
- **The filters database made at another time.** `addon.Filters:Load()` runs inside `Profiles.lua`'s registration (`:14`). Guard: it stays first there. `defaults-unchanged` covers `KrowiAF_Filters`. The `special` and `popups` suites read filters.
- **A table looked up under another name.** `KrowiAF_GetOptions` and the four reads use the app names. Guard: `options-registered` (apps=6), the four sites' own suites, and `Coverage`'s missing-paths count.
- **The headless run proving nothing.** Once the fakes go, the environment loads KAF's own `Libs/` only, so a leftover AceConfig call errors headlessly. In game another addon's copy can hide it. Guard: `libstub-loaded`.
- **Another addon relying on KAF's copy.** Not ours to fix. Guard: step 7's scan, the changelog line, and a quick fix if a report comes in (re-embedding one library is a one-line change).
- **The text boxes' behaviour.** Selection, copy, paste of a long import string, the read-only log, and the skins. Guard: step 6's look gate on Retail, then Mists in step 7, and the Data Manager import in the Retail run.
- **Lua 5.1 and the stripped tree.** The post-edit hook's syntax check and `Check-Repo.ps1` on every turn.

## Proof
- Headless, both clients: `& "$kit\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" options` gives these lines, each equal to its `Target`:
  - `options-fingerprint options=414 hash=723de62c` (Classic `options=310 hash=83fced41`);
  - `defaults-unchanged`, `saved-keys-unchanged`, `old-file-same-values` and `logout-file-unchanged` equal to their step-1 recordings;
  - every other `options` line as recorded today.
  The `popups`, `special`, `schedules`, `guide`, `features` and `plugins` suites are unchanged.
- `Check-Repo.ps1` on the whole tree: no error, `libstub-loaded` included.
- In game, Retail then Mists:
  - `Run-GameTests.ps1 options`, then `Read-GameTests.ps1`: no FAIL, no difference from the headless lines beyond step 1's recorded ones;
  - `Read-GameErrors.ps1`: no new row and no bumped count;
  - `Compare-SavedSettings.ps1 -Compare`: no difference.
- `Libs/` holds no `Ace*` folder but `AceDB-3.0`, and `git grep -n "Ace\(Config\|GUI\|DBOptions\|Timer\|Event\|Serializer\)"` outside `docs/` and `Libs/` finds only comments that say what used to be there.