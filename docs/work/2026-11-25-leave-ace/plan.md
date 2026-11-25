# Plan: Leave the Ace libraries the options window no longer needs
Spec: [spec.md](spec.md). Status: draft

Drafted with the spec at Krowi's request, for review together. It assumes the recommended option on each of the spec's three questions. If the answer is (b) on scope, this plan is rewritten.

## Files that change
### The safety net (step 1), on the unchanged code
- `.claude/tools/headless/options-env.lua`:
  - `opts.SavedVariables`: the four saved tables (`KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions`, `KrowiAF_SavedData`) set before the boot, as the game loads them. Today's `opts.Profile` (`:437-438`) covers one profile only.
  - `ctx.Logout()`: runs AceDB's own logout handler (`AceDB.frame`'s `OnEvent` with `PLAYER_LOGOUT`, `AceDB-3.0.lua:352-404`), which strips the defaults as the game does before it writes the files.
  - `ctx.Serialize(value)`: a deterministic dump with sorted keys, for hashes and for the fixture.
- `Options/Window/Model.lua`:
  - `model.DefaultsHash()`: the three databases' `db.defaults`, serialized and hashed.
  - `model.FirstInstallProfiles()`: the raw profile of each database (`rawget`, no defaults metatable), serialized and hashed. Headless only, on an empty boot.
  - `model.SavedKeys(all)`: options that store a value (toggle, range, select, input), one at a time. Each is set to `OtherValue`; the raw saved paths it changed in the four saved tables are listed as `id => <table>.<path>`, then the value goes back. The hash covers paths only, so the player's own values don't move it.
    - Without `all`, it takes `CheckRoundTrip`'s options: shown, enabled, not `Locked`. No map entry sets `Locked` today (`Model.lua:142` is its only reader).
    - With `all`, headless only, it takes hidden and disabled options too.
    - Key bindings go to the game's binding set and executes store nothing, so neither is in it.
  - `model.ProfileSwitch()`, headless only:
    - makes a profile in each database and switches to it;
    - counts the options callbacks that ran and checks that every `addon.Tabs[t].Filters` is the new filters profile's table;
    - switches back and deletes the profile.
- `Tests/Options.lua`: scenarios `defaults-unchanged` and `saved-keys-unchanged` (game and headless). `Recorded` and `Target` are today's values, with `RecordedClassic` and `TargetClassic` for Mists.
- `.claude/tools/headless/run-tests.lua`: the headless-only scenarios and the models of every new line. The headless-only ones are `first-install-profile`, `saved-keys-unchanged-all`, `old-file-same-values`, `logout-file-unchanged` and `profile-switch`.
- `.claude/tools/headless/write-settings-fixture.lua` (new, run once on 106.0's code):
  - boots Retail and Classic;
  - sets every storing option off its value in profile `Default`;
  - makes a second profile `Second` with every toggle flipped back;
  - writes non-default values straight into `KrowiAF_Filters` (per tab: a few filter switches and a faction choice) and `KrowiAF_SearchOptions` (all five), which no option writes;
  - logs out;
  - writes `.claude/tools/headless/fixtures/settings-106-<client>.lua` (the four saved tables after logout) and `settings-106-<client>-values.lua` (option id to value per profile, and the filter and search values set).
- `.claude/tools/Compare-SavedSettings.ps1` (new):
  - `-Snapshot <dir>` copies a character's four saved files from a client's `WTF`;
  - `-Compare <dir>` deep-compares them with the current files through the kit's `lua51`. It compares only these four globals, and leaves out `KrowiAF_SavedData`'s per-login fields, which the tool lists.
  - `-Options <dir>` boots the current checkout's headless environment on a snapshot and prints every option's value, so 106.0's checkout and this branch can be diffed on Krowi's real files.
  - Snapshots go to the scratchpad, never into the repo.
- No new lint rule: `library-names` (`.claude/tools/Check-Repo.ps1:471-504`) already fails on a `LibStub` name that `Libs/` doesn't register, and leaves silent lookups alone.

### The libraries (steps 2 to 5)
- `Krowi_AchievementFilter.lua:4-6`: `addon.Event` and the AceEvent embed go.
- `Tests/Tests.lua:527`: a frame of its own for `PLAYER_ENTERING_WORLD`, with the handler unchanged.
- `Options/Options.lua`: `options.Registry` with `Register(appName, table)` and `Get(appName)`.
- The registrations move to the registry, at the same points: `Options/General.lua:11-13`, `Options/Layout.lua:11-13`, `Options/Plugins.lua:8-10`, `Options/Credits.lua:10-12`, `Features.lua:109-113`.
- `Options/Profiles.lua:10-21`: the two `AceDBOptions-3.0` tables go. `addon.Filters:Load()` stays, first in `profiles.RegisterOptionsTable`.
- The reads move to the registry: `Api/API.lua:164`, `Data/Data.lua:134`, `Options/General.lua:17`, `Options/Layout.lua:1522`.
- `Tests/Options.lua`:
  - `CountKafPages` (`:24-31`) asks for AceConfigDialog silently (`LibStub("AceConfigDialog-3.0", true)`). Another addon may still load it, and then the step still proves KAF added no page; without it the count is 0, so the line stays `pages=0`.
  - `options-registered` (`:197`) reads the registry and still gives `apps=6`.
  - Their `Recorded` and `Target` lines stay.
- `.claude/tools/headless/options-env.lua`: the AceConfig fakes (`:298-325`) and their skip-list entries (`:86-87`) go. `ctx.Registry` becomes the addon's registry, and `ctx.BlizOptions` becomes empty. `run-tests.lua`'s comments (`:39`, `:475`, `:1723`) follow.
- `Gui/DataManager/TextFrame/` (mixin and XML) and `Gui/DataManager/Frame/FrameMixin.lua:88-98`:
  - the two `MultiLineEditBox` widgets become `ScrollingEditBoxTemplate` frames, each with a `MinimalScrollBar` linked through `ScrollUtil.RegisterScrollBoxWithScrollBar`;
  - they stay in the same fields (`Input`, `Log`), and the mixin's `SetText` and `GetText` serve the callers;
  - no `maxLetters`, so long exports aren't cut;
  - the log puts its text back on user input through the mixin's `OnTextChanged` callback.
- The callers that reach AceGUI's `.frame`: `Gui/DataManager/Frame/FrameMixin.lua:130-135` and `Plugins/ElvUI.lua:511`.
- A game-only Data Manager check, in a new `datamanager` suite (`Tests/DataManager.lua`, registered in `Tests/Files.xml`, the runner and `Tests/README.md`), since no suite covers the Data Manager today. It checks two things:
  - every character's export, set into the box, reads back equal (length and bytes);
  - the 106.0 export string taken in step 1 imports and gives the same characters.
- `Libs/Files.xml`: the lines of AceTimer, AceEvent, AceDBOptions, AceGUI, AceConfig and AceSerializer go. Their six folders under `Libs/` go.
- `docs/architecture.md` (`:46`, `:110-122`), `Tests/README.md` (the `options` row) and `.claude/tools/README.md`: say what is true afterwards.
- `docs/backlog.md`: the stage 2 item (the native format, its open questions, and ElvUI's "Skin Ace3" row).
- `_Packaging/Changelog.md`, under the next version's `### Changed`: "The addon no longer loads the Ace3 libraries its old options pages needed (AceConfig, AceGUI and four others); your settings stay as they are."

## Order of work
Each step is a commit. The safety net is green after every one.
1. **Safety net, on 106.0's code.**
   - Build the environment additions, the model functions, the scenarios, the fixture writer and the compare tool.
   - Run the fixture writer, then the `options` suite headlessly on both clients, and record its lines.
   - Deploy the unchanged build to Retail and record the in-game lines of `defaults-unchanged` and `saved-keys-unchanged` with `Run-GameTests.ps1 options`, then do the same on Mists.
     - Where an in-game line differs from the headless one, the step lists the keys.
     - The plan is then updated with why (a plugin really loaded, for instance), and the scenario records the game's own value.
   - Take a Data Manager export string from 106.0 on Retail, for the import check.
   - Commit: `test: record the saved settings that leaving Ace must keep`.
2. **AceTimer, AceSerializer, AceEvent.** Remove them as listed. Then run the headless suites, the safety net and `Check-Repo.ps1 -ChangedOnly`. Commit: `refactor: stop loading AceTimer, AceSerializer and AceEvent`.
3. **The registry.** Add it, then switch the six registrations, the four reads and the two test lookups. The headless environment uses it, with its AceConfig fakes still in place. All lines stay unchanged. Commit.
4. **AceConfig and AceDBOptions out.**
   - Drop the `AceDBOptions` tables from `Profiles.lua`, the fakes from the environment, and the libraries from `Libs/`.
   - `library-names` now fails on any call left behind.
   - Run the safety net, the whole `options` suite and the suites that read the option tables (`popups`, `special`, `schedules`, `guide`, `features`, `plugins`), on both clients.
   - Commit.
5. **The Data Manager's text boxes.**
   - Replace the two widgets and the ElvUI anchor, add the `datamanager` suite, and run `krowi:taint-reviewer` on the diff.
   - Deploy to Retail and put it in front of Krowi first (look first, full suites after): an export of a character, an import, the log tab and the Map Verifier's export, with and without ElvUI.
   - On Krowi's approval (the `look` row), AceGUI goes from `Libs/`. Commit.
6. **The real files**, on each client in turn, Retail then Mists:
   - With the client closed, take a `Compare-SavedSettings.ps1 -Snapshot` of Krowi's character. Taking it here, not in step 1, keeps the earlier runs and the look session's imports out of the comparison.
   - Run `-Options` on that snapshot from the main checkout (106.0) and from this branch: the two outputs are equal.
   - Deploy the branch (`Deploy.ps1 -WhatIf` first: the six folders are gone from the client), log the character in, `/reload` without touching anything, and quit.
   - `-Compare` against the snapshot: no difference.
   - Then `Run-GameTests.ps1 options, datamanager`, then `Read-GameErrors.ps1`.
   - Scan the addons installed on both clients for a `LibStub("<removed library>")` in an addon that ships no copy of it, and report any found.
7. **Docs and changelog**, then the PR: `Get-ChangeClass.ps1`, `/code-review`, and the PR with its Decisions section.

## Risks
- **A default that moves.** `addon.Options.Defaults` is filled from many places before `Options:Load(true)`:
  - `Defaults.lua` and `Features.BuildOptions`;
  - the tab, header, event and special-category injections;
  - `Filters:InjectDefaults` and `InjectPluginOptions`.
  A changed default rewrites the settings of everyone who kept it. Guard: `defaults-unchanged` and `first-install-profile` on both clients. The boot order in `Krowi_AchievementFilter.lua:25-40` is not touched.
- **The filters database made at another time.** `addon.Filters:Load()` runs inside `Profiles.lua`'s registration (`:14`). Guard: it stays first there; `defaults-unchanged`, `first-install-profile` and `profile-switch` cover `KrowiAF_Filters`.
- **A setting moved by the test itself.** The in-game `saved-keys-unchanged` sets options on Krowi's real character. Guard: only `CheckRoundTrip`'s options, each value put back. Hidden and disabled options are set headless only.
- **A table looked up under another name.** `KrowiAF_GetOptions` and the four reads use the app names. Guard: `options-registered` (apps=6), the suites around those four reads, and `Coverage`'s missing-paths count.
- **A leftover call hidden by another addon's copy.** Guard: `library-names` once the folders are gone, and the headless load, which has only KAF's `Libs/`.
- **Another addon relying on KAF's copy.** Not ours to fix. Guard: step 6's scan, the changelog line, and a quick fix if a report comes in (re-embedding one library is a one-line change).
- **The text boxes' behaviour.** Selection, copy, a long import pasted, the read-only log, and the skins. Guard: the `datamanager` suite and step 5's look gate on Retail, then Mists in step 6.
- **Lua 5.1 and the stripped tree.** The post-edit hook's syntax check and `Check-Repo.ps1` on every turn.

## Proof
- Headless, on both clients: `& "$kit\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" options` gives these lines, each equal to its `Target`:
  - `options-fingerprint options=414 hash=723de62c` (Classic `options=310 hash=83fced41`);
  - the new safety-net lines, equal to their step-1 recordings;
  - every other `options` line as recorded today.
- The `popups`, `special`, `schedules`, `guide`, `features` and `plugins` suites are unchanged.
- `Check-Repo.ps1` on the whole tree: no error, `library-names` included.
- In game, Retail then Mists:
  - `Run-GameTests.ps1 options, datamanager`, then `Read-GameTests.ps1`: no FAIL, and no difference from the headless lines beyond step 1's recorded ones;
  - `Read-GameErrors.ps1`: no new row and no bumped count;
  - `Compare-SavedSettings.ps1 -Compare`: no difference.
- `Libs/` holds no `Ace*` folder except `AceDB-3.0`. `git grep -n "Ace\(Config\|GUI\|DBOptions\|Timer\|Event\|Serializer\)"` outside `docs/` and `Libs/` finds only comments that say what used to be there.