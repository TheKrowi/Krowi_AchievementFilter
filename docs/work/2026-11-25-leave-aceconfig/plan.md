# Plan: Stop loading AceConfig and AceDBOptions, with proof that no setting moves
Spec: [spec.md](spec.md). Status: accepted

Drafted with the spec for review together. It assumes (a) on both of the spec's questions. Krowi chose the whole proof, without the downgrade check, since a later item migrates the settings onto a new layout and store and reuses it.

## Departures from the plan
- **`saved-keys-unchanged` covers every option in game too.** The plan covered only shown and enabled options in game. But `ShowIf` and a switch's greying follow the player's settings, so that set, and its hash, would differ by character. `saved-keys-unchanged-all` is merged into it.
  - To keep the real character safe, each option's four saved variables are copied before the set and put back raw, in place, after it.
  - The writer's check confirmed it, headless on both clients: the saved data is byte-identical after a full pass that started from 25 changed settings.
- **The search options' defaults** are read from `SearchOptions.Defaults`, which the file now exposes. Their database is made only when Blizzard's achievement window loads, so it may not exist yet when the suite runs.
- **The fixture keeps each filter path as a list of keys.** Build-version keys are strings such as `"090205"`, which a dotted path turns into numbers.
- **The headless environment** now has a silent `DEFAULT_CHAT_FRAME` (the old file turns trace output on), and its `LibStub` answers a silent lookup of a missing library with nil, as the real one does. Without the fake dialog, `settings-entry` read a stub as five pages.
- **`Compare-SavedSettings.ps1` compares** `KrowiAF_Options`, `KrowiAF_Filters`, `KrowiAF_SearchOptions` and `KrowiAF_SavedData.Tabs`. No option writes any other part of `KrowiAF_SavedData`, per `SavedKeys`' lines.
- **The proof catches a moved key.** With `Window.Movable` moved for one run, `saved-keys-unchanged`, `old-file-same-values` (one value in each profile) and the fingerprint failed, and `defaults-unchanged` rightly passed.

## Results so far
- Headless, both clients: every suite green after each step. The `memory` suite's two open targets on Retail are on `main` as well.
- Installed addons: none relies on KAF's AceConfig or AceDBOptions, except Krowi_Reminders.
  - Krowi_Reminders ran on KAF's AceConfig, AceConfigRegistry and AceConfigDialog, which it doesn't embed.
  - It reaches no player: a private repo last pushed in 2023, version 0.1, never released, with an out-of-date interface. It's in the backlog.
  - The AceGUI work item's plan said otherwise and is corrected.

## Files that change
### The saved-settings proof (step 1), on the baseline code
- `.claude/tools/headless/options-env.lua`:
  - `opts.SavedVariables`: the four saved tables, set before the boot as the game loads them. Today's `opts.Profile` (`:436-438`) covers one profile only.
  - `ctx.Logout()`: runs AceDB's own logout handler (`AceDB.frame`'s `OnEvent` with `PLAYER_LOGOUT`), which strips defaults as the game does before it writes the files; the fixture writer needs it.
  - `ctx.Serialize(value)`: a dump with sorted keys.
- `Options/Window/Model.lua`:
  - `DefaultsHash()`: the three databases' `db.defaults`.
  - `FirstInstallProfiles()`: each database's raw profile, through `rawget` with no defaults metatable, on an empty boot.
  - `SavedKeys(all)`:
    - one option at a time, set to `OtherValue`; it lists the raw saved paths that changed in the four tables as `id => <table>.<path>`, then puts the value back;
    - it hashes the paths only;
    - without `all` it takes `CheckRoundTrip`'s options, with `all` (headless only) hidden and disabled ones too;
    - keys and executes are out, since they store nothing in these tables.
  - `ProfileSwitch()`, headless only:
    - a new profile in each database, switched to;
    - the options callbacks counted, and every `addon.Tabs[t].Filters` checked against the new filters profile;
    - switched back and deleted.
- `Tests/Options.lua`: `defaults-unchanged` and `saved-keys-unchanged`, in game and headless, with `Recorded`, `Target` and their Classic forms.
- `.claude/tools/headless/run-tests.lua`: the headless-only `first-install-profile`, `saved-keys-unchanged-all`, `old-file-same-values` and `profile-switch`, and the models of every new line.
- `.claude/tools/headless/write-settings-fixture.lua` (new, run once on the baseline):
  - boots Retail and Classic;
  - sets every storing option off its value in `Default`, and makes a second profile `Second` with every toggle flipped back;
  - writes non-default values straight into `KrowiAF_Filters` (per tab: a few switches and a faction) and `KrowiAF_SearchOptions` (all five);
  - logs out;
  - writes `.claude/tools/headless/fixtures/settings-baseline-<client>.lua` (the four tables after logout) and `settings-baseline-<client>-values.lua` (option id to value per profile, plus the filter and search values).
- `.claude/tools/Compare-SavedSettings.ps1` (new), with a help block and a row in `.claude/tools/README.md`:
  - `-Snapshot <dir>` copies a character's four saved files from a client's `WTF`;
  - `-Compare <dir>` deep-compares them with the current files through the kit's `lua51`, for these four globals only, leaving out `KrowiAF_SavedData`'s per-login fields (listed in the tool);
  - `-Options <dir>` boots the current checkout's headless environment on a snapshot and prints every option's value;
  - snapshots go to the scratchpad, never into the repo.

### AceConfig and AceDBOptions out (steps 2 and 3)
- `Options/Options.lua`: `options.Registry` (`Register`, `Get`).
- The registrations: `Options/General.lua:11-13`, `Options/Layout.lua:11-13`, `Options/Profiles.lua:20`, `Options/Plugins.lua:8-10`, `Options/Credits.lua:10-12`, `Features.lua:109-113`.
- The reads: `Api/API.lua:164`, `Data/Data.lua:134`, `Options/General.lua:17`, `Options/Layout.lua:1522`; `Tests/Options.lua:200` (`options-registered`).
- `Options/Profiles.lua:11-13`, `:16-18`: the AceDBOptions tables go; `addon.Filters:Load()` stays where it is.
- `.claude/tools/headless/options-env.lua`:
  - the fakes (`:297-324`) and the skip entry (`:86`) go;
  - `ctx.Registry` becomes the addon's registry and `ctx.BlizOptions` an empty list;
  - the comments in `run-tests.lua` follow.
- `Libs/Files.xml`: the AceDBOptions and the three AceConfig lines go; `Libs/AceDBOptions-3.0/` and `Libs/AceConfig-3.0/` are deleted.
- Comments that name AceConfig as the drawer or the registry: `Options/Window/Source.lua:7-9`, `Options/Window/Model.lua:139,178`, `Tests/Options.lua:5-11`, `docs/architecture.md:46,110,122`.
- `docs/backlog.md`: "Leaving Ace" keeps only the optional native format, and records the AceDB decision.
- `_Packaging/Changelog.md`, 106.1, `### Changed`: "The addon no longer loads AceConfig and AceDBOptions; AceDB is the only Ace3 library left".

## Order of work
Each step is a commit; the proof is green after each.
1. **The proof, on the baseline.**
   - Build it, run the fixture writer, and record the headless lines on both clients.
   - Deploy the unchanged build to Retail (`Deploy.ps1 -WhatIf` first) and record the in-game lines of `defaults-unchanged` and `saved-keys-unchanged` with `Run-GameTests.ps1 options`, then on Mists.
   - Where a game line differs from its headless one, the step lists the keys and records the game's own value, with the reason in this plan.
   - Commit: `test: record the saved settings that leaving AceConfig must keep`.
2. **The registry**, with the fakes still in place: every line unchanged. Commit.
3. **AceConfig and AceDBOptions out:**
   - the Profiles tables, the fakes and the libraries go;
   - `library-names` fails on anything left;
   - then the proof, the whole `options` suite and `popups`, `special`, `schedules`, `guide`, `features` and `plugins`, on both clients.
   Commit.
4. **Krowi's real files**, Retail then Mists, each with its client closed:
   - `Compare-SavedSettings.ps1 -Snapshot`;
   - `-Options` from the main checkout and from this branch: the outputs are equal;
   - deploy, log in, `/reload` without touching anything, quit;
   - `-Compare`: no difference;
   - then `Run-GameTests.ps1 options, special, popups` and `Read-GameErrors.ps1`.
5. **Installed addons:** scan for a non-silent `LibStub` of AceConfig, AceConfigRegistry, AceConfigCmd or AceDBOptions in an addon with no copy in itself or its dependencies, and look into each hit.
6. **Docs, changelog, then the PR:** `Get-ChangeClass.ps1`, `/code-review`, and the PR with its Decisions section.

## Risks
- **A default that moves or registers late.** Guard: `defaults-unchanged` and `first-install-profile`. The boot order (`Krowi_AchievementFilter.lua:24-35`) isn't touched.
- **The filters database made at another time.** Guard: `addon.Filters:Load()` keeps its place, and `profile-switch`, `special` and `popups` read it.
- **A table looked up under another name.** Guard: `options-registered apps=6`, the suites around the four reads, and the `missing-paths` count in `Coverage`.
- **The shifted order counter.** Guard: the fingerprint (ids), and a look at Credits in the window during step 4.
- **The proof itself writing into a real profile in game.** Guard: in game, `saved-keys-unchanged` sets only `CheckRoundTrip`'s options and puts each value back, as `CheckRoundTrip` does today. Everything else is headless.
- **Another addon relying on KAF's copy.** Guard: step 5 and the changelog line.

## Proof
- `Check-Repo.ps1`: 0 errors.
- Headless `options` on both clients: every line equal to its `Recorded`, fingerprint 414/723de62c and 310/83fced41, and the new proof lines equal to their step-1 recordings.
- In game, Retail and Mists:
  - `Read-GameTests.ps1` with no FAIL;
  - `Read-GameErrors.ps1` with no new row;
  - `Compare-SavedSettings.ps1 -Compare` with no difference.
- `Libs/` holds no `Ace*` folder except `AceDB-3.0`.