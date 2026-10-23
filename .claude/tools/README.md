# Offline tooling

The tooling every Krowi repo shares lives in Krowi_ClaudeKit (`E:\World of Warcraft Addon Development\Krowi_ClaudeKit`, private): the vendored Lua 5.1.5, the guard and syntax hooks, `Deploy`, the game readers, the worktree tools, `Update-UiSource`, `Find-Symbol`, `Strip-Semicolons`, `Get-WowBuilds`, the deprecated-API classifier, and the release and work-item skills. Its `README.md` and `WowAddons.md` ("The kit's tools") describe them, and each script documents its parameters in its comment header. This repo enables the kit's `krowi` plugin and keeps here only what is its own, listed below.

Everything runs offline and installs nothing: PowerShell plus the kit's Lua. A new check that only this repo needs goes here and uses that interpreter; anything another repo could use goes into the kit. `.claude/` is excluded from the release zip (any dot-directory is) and from fsdeploy and `Deploy.ps1`, so nothing in it reaches players or the game folder.

The everyday commands and the rules these tools enforce are in `.github/copilot-instructions.md` (Build & Validation); this file is the reference behind them. Below, `$kit` stands for `E:\World of Warcraft Addon Development\Krowi_ClaudeKit`; Claude Code's permission rules match the commands only with that path written out.

| Tool | What it does |
|---|---|
| `KitPath.ps1` | finds the kit for the scripts below (next to the main checkout, or `$env:KROWI_CLAUDEKIT` to test a kit worktree) and throws when it is missing |
| `Check-Repo.ps1` | the repo lint; `Check-Repo.globals`, `Check-Repo.jobs`, `Check-Repo.ignore`, `Check-Repo.removed-api` and `Check-Repo.deprecated-api` are its data files |
| `headless/load-data.lua` | the data load for both clients, headless |
| `headless/run-tests.lua` | the scenario suites in `Tests/`, headless |
| `headless/snapshot-categories.lua` | the category tree baselines in `headless/snapshots/` |
| `headless/snapshot-data.lua` | the achievement, zone and registry baselines in `headless/snapshots/` |
| `headless/client-env.lua` | the sandboxed client environment `load-data.lua` and both snapshots share |
| `headless/read-tests.lua`, `headless/read-runs.lua` | read the `/kaftest` results from the saved variables, for `Read-GameTests.ps1` and the release gate |
| `Read-GameTests.ps1` | the last `/kaftest` run from the client's saved variables, against the headless run; game-only steps marked `g` with their screenshot paths, `-Run <n>` for an older kept run |
| `Request-GameTests.ps1` | only when the maintainer asks, with the client closed: writes a one-shot test request into the saved variables and starts the client with the kit's `Start-Game.ps1` (Retail, Classic and their test realms); the suites run at the next login and a summary panel is screenshotted |
| `Update-DeprecatedApi.ps1` | rebuilds `Check-Repo.deprecated-api` from the wow-ui-source clones, for the clients the `.toc` lists |
| `../release-gate.ps1` | this repo's release check, which the kit's release preflight runs: a green in-game `escape` run on the newest Retail client |

## Lua 5.1.5

The kit carries Lua 5.1.5 (`$kit\tools\lua51\lua.exe`, `luac.exe`), the exact interpreter WoW embeds; its `lua51/README.md` documents the provenance. Prefer it over any Lua on PATH: Lua 5.4 and LuaJIT accept syntax the game rejects. A syntax check of one file, several, or the whole tree (about 0.4 s for 400 files; it strips the UTF-8 BOM first because WoW tolerates one and stock Lua 5.1 does not):

```powershell
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\check-syntax.lua" "Globals.lua" "Data\Data.lua"
```

## Language server (`.luarc.json`)

`.luarc.json` at the repo root configures the Lua language server for any editor: Lua 5.1, the non-addon folders and `Libs/` ignored, the checks that stay off (`undefined-field` and the type-mismatch family; the code has no type annotations), and `diagnostics.globals`. The WoW API, `C_*` namespaces, widget API and the Blizzard FrameXML frames come from the VS Code extension `ketho.wow-api`, with Numy's FrameXML annotations switched on in `.vscode/settings.json`; the extension writes its library path into the user settings, so nothing machine-specific lives in the repo. That leaves `diagnostics.globals` with only what no annotation covers (the rule for adding to it is in the instruction file). The `luarc` lint rule keeps that list exact (every entry read by an addon file, none assigned by one, sorted), and the `luals` rule runs the language server tree-wide in a full lint.

## Repo lint (`Check-Repo.ps1`)

```powershell
& ".claude\tools\Check-Repo.ps1"               # whole tree, about 12 s plus 30 s for luals (zone-decisions and mapverifier are 7 s); -Verbose prints per-rule timings
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # only files changed against HEAD, errors instead of warnings; -Luals adds the language-server run
```

`-ChangedOnly` is what the Claude Code Stop hook runs. Warnings on changed files are promoted to errors, so pre-existing debt does not block work while new debt does. Each finding prints as `<path>:<line>: [<rule>] <severity>: <message>`, and the exit code is 1 when any error was found. Without the kit (a contributor's clone) the rules that need no Lua still run, and the `kit` rule names the ones that did not. The script's comment header gives each rule's severity.

| Rule | What it checks |
|---|---|
| `files-xml` | every `.lua` is registered in the `.toc` or a `Files.xml` chain, and every registered file exists; a file whose registration is commented out in an XML is treated as intentionally disabled |
| `section-order` | a right-click menu sub-section registers with `GetLastSection().Sections`, so in its `Files.xml` it loads directly after its parent section (one with a `Sections` table) or after its sibling sub-sections; anything in between becomes the "last section" and the sub-section fails to load (always on) |
| `dup-id` | an achievement id is registered once per client (Shared counts for both) |
| `saved-variables` | every saved variable the code initialises is declared in the `.toc` |
| `lua-syntax` | every `.lua` parses under Lua 5.1 |
| `globals` | no assignment to an undeclared global (from `luac -l`); the deliberate FrameXML overrides and API polyfills are allowlisted per file in `Check-Repo.globals` |
| `removed-api` | no addon file reads a Blizzard global the Retail client no longer has (listed in `Check-Repo.removed-api`); always tree-wide |
| `deprecated-api` | no addon file reads a Blizzard global that a client the `.toc` lists has only as a `Blizzard_Deprecated*` alias, or not at all (generated list `Check-Repo.deprecated-api`); names the replacement; always tree-wide; a name `removed-api` lists is reported there only |
| `library-names` | every library name addon code and `Libs/Libs.lua` pass to `LibStub(` or `KROWI_LIBMAN:GetLibrary(` is registered by a `NewLibrary(` call in `Libs/` (a literal, or a local set to one in the same file); a silent lookup (`, true`) and a call in a comment are left alone; always tree-wide, because a library rename breaks call sites nobody touched; a warning and no check when a submodule has no Lua files (a checkout made without them) |
| `settings-close` | addon code closes the settings panel with `SettingsPanel:Close(true)`; without the argument it goes back to the game menu through `ToggleGameMenu`, whose `SpellStopCasting` call is forbidden from addon code (`ADDON_ACTION_FORBIDDEN` on Mists Classic) |
| `background-jobs` | every job addon code starts that can run with every window closed (an `OnUpdate` script set or hooked in Lua or XML, a `C_Timer.NewTicker`, a `TooltipDataProcessor.AddTooltipPostCall` or `OnTooltipSet*` hook, an event registration; `RegisterEvent:*` when the event is not a literal) is listed in `Check-Repo.jobs` with the `Tests/Memory.lua` scenario that measures what it allocates, or `-` and a comment saying why it does not run on its own (once, rarely, only while shown); the rule also reports a line naming an unknown scenario, a `-` without a reason and a line that matches no job any more; `Tests/` and `Libs/` are left out, comments are not code; always tree-wide. It does not see other `hooksecurefunc`/`HookScript` hooks (`WorldMapFrame`'s `OnMapChanged` runs on every map change) or a `C_Timer.After` callback that schedules itself again: a review checks those (docs/work/2026-10-18-memory-growth) |
| `luarc` | the `.luarc.json` globals list against what the code reads and assigns |
| `util-flags` | every `addon.Util.Is*` flag or check the addon reads is defined in `Libs/Krowi_Util` (`lib.IsX =` or `function lib.IsX(`); a missing one reads as nil and silently takes the other branch; always tree-wide; a warning and no check when the submodule is empty |
| `luals` | the Lua language server's own diagnostics tree-wide; only on full runs or with `-Luals`, and only when the VS Code extensions `sumneko.lua` and `ketho.wow-api` are installed; pre-existing findings are warnings, findings in changed files errors |
| `bom`, `line-endings` | no UTF-8 byte order mark, CRLF only (`.editorconfig`) |
| `semicolon` | no trailing semicolon on an added line (changed files only) |
| `enus-autogen` | no locale string added above the `AUTOGENTOKEN` marker in any locale file |
| `lookup-placeholders` | the `_*.ps1` skill scripts are committed with their placeholders empty (`$Ids`/`$Terms`/`$Names` = `@()`, `$Table`/`$Name` = `""`), `param()` defaults included |
| `pinned-build` | no skill or `raw/` script types a game build; builds come from the kit's `Get-WowBuilds.ps1` |
| `zone-decisions` | the zone-decisions log `raw/ZoneDataDecisions.md` agrees with the ZoneData files |
| `mapverifier` | the Map Verifier CSV `raw/MapVerifier.csv` is valid and in canonical form |
| `work-items` | the work-item folders under `docs/work/`: folder name, titles, status line, required headings (the kit's `skills/process-issue/templates/`) |
| `category-node-shape` | no V1 category node starts with a boolean (`{ name, true, ... }`, never `{ true, name, ... }`) |
| `category-snapshot` | the category tree each client builds matches the baseline in `headless/snapshots/` |
| `data-snapshot` | the achievements, zone placements and registries each client builds match their baselines in `headless/snapshots/` |
| `data-load` | the headless data pipeline (below) |
| `unit-tests` | the headless test suites behave as their scenarios' `Recorded` fields say |
| `changelog` | a reminder when addon code changed without a `_Packaging/Changelog.md` line |
| `kit` | a warning when Krowi_ClaudeKit is missing, naming the rules that need its Lua and did not run |

A deliberate exception goes in `Check-Repo.ignore` (one `<rule or *> <path glob>` per line) with a comment.

## Headless data pipeline (`headless/load-data.lua`)

`load-data.lua` runs the data load for both clients in the kit's Lua with WoW globals stubbed: it loads `Api/`, `Objects/`, `Data/Data.lua` and `DataAddons/` in toc order inside a sandboxed environment per client (built by `client-env.lua`), then drives the real task groups the way `LoadOnPlayerLogin` does. In about 0.5 s it reports, with file and line:

- unknown builder methods, misspelled enum members, non-numeric ids and seasons, malformed or mis-suffixed patch keys;
- duplicate registrations (including AutoFactionSplit mirrors), unregistered build versions, missing injection targets;
- every drop the data API reports to `addon.Data.LoadDiagnostics`: references to achievements no data file registers, an event bound to a missing category, a V1 category node no parser branch takes, an `Obtainable()` that matches no form or uses an unknown anchor word.

An id that exists only on the other client and is referenced from a Shared file is skipped by design, as the game does. A metatable proxy on the achievement registry cross-checks the collector: a lookup of an unregistered id that no drop site reported fails as a "silent drop site", so a new skip cannot go quiet.

A `Version` anchor that does not resolve is an error on Retail, the reference timeline, where every patch Retail shipped is registered. On Classic it is content the client has not reached yet: the summary line per client counts those anchors and the achievements they leave obtainable with no end scheduled, and `-v` lists them. Extend the stubs in `runClient` when a new WoW global is used at load time.

```powershell
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both     # what the lint runs; -v lists stubbed globals
# Retail or Classic alone also works, but then every Shared reference to an id that only the other client registers is reported (about 1200 lines on Classic); only Both cross-checks
```

The background of the collector and the anchor timeline is `docs/data-design-review.md` §5.1 and §5.2.

## Category snapshot (`headless/snapshot-categories.lua`)

Writes the category tree each client builds (node paths, sibling order, flags, achievement placement, orphans) to `headless/snapshots/CategoryTree.<client>.txt`. The `category-snapshot` lint rule regenerates it and fails on any difference; an intended change is regenerated with `-write` (the default mode; `-check` and `-stdout` also exist) and committed with the code that caused it, never absorbed silently. Design and history: `docs/how-to/migrate-category-data.md`.

## Data snapshot (`headless/snapshot-data.lua`)

The sibling of the category snapshot, for everything else the pipeline builds, as three files per client under `headless/snapshots/`:

- **`Achievements.<client>.txt`**: one line per achievement with its patch, faction and the other faction's id, reward types, PvP and realm-first flags, its `Obtainable()` records as declared, its reward previews, custom criteria and events. `=>` shows where a Version anchor lands on that client. The achievement's tooltip, transmog set and pet battle link entries follow it.
- **`Zones.<client>.txt`**: one line per zone placement.
- **`Registries.<client>.txt`**: build versions, the content timeline, season anchors and events.

A baseline changes only when the data does. Anchors are never resolved against today's date, and names from `addon.L` are left out. A refactor that builds the same objects, such as moving a block to Shared or rewriting an AutoFactionSplit as two FactionSplits, gives a zero diff.

The `data-snapshot` lint rule runs it with `-check` (about 0.3 s). It reports each difference as `<file>:<line>: achievement 33: faction Alliance -> Horde` or `zone 616: gone 9045`. An intended change is regenerated with `-write` and committed with the data that caused it.

```powershell
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\snapshot-data.lua" "$PWD" Both -check   # -write regenerates, -stdout prints
```

## Headless test suites (`headless/run-tests.lua`)

Runs the scenario suites from `Tests/` against modelled WoW frames and FrameXML; `-check` is the `unit-tests` lint form. Everything about the suites, the scenarios and the in-game runner is in `Tests/README.md`.

## Deploy and the game loop

The VS Code `fsdeploy` config in `.vscode/settings.json` mirrors `**/*.{lua,blp,tga,xml}` (excluding `.github`, `.vscode`, `.claude`, `_Packaging`, `raw`, `wiki`, `docs`), plus `LICENSE` and the `.toc`, from the folder the window has open into `H:\World of Warcraft\_retail_\Interface\AddOns\Krowi_AchievementFilter` and into the `_classic_` sibling on every save; the PTR target is commented out there. The kit's `Deploy.ps1` does the same from a terminal and is the way to be sure a client's folder is current: run it with `-WhatIf` before asking for an in-game check, since a reload on a stale install proves nothing.

The kit's `Read-GameErrors.ps1` prints the Lua errors BugGrabber recorded for this addon and this repo's `Read-GameTests.ps1` the last `/kaftest` run, marking every line that differs from the headless run. The game writes saved variables only on `/reload` or logout, so both show when the file was last written. The kit's `Read-GameScreenshot.ps1` lists the newest screenshots to open with the Read tool. The commands are in the instruction file under Closing the loop with the game.

## Parallel sessions

A parallel session works in its own worktree under `.claude/worktrees/<name>/`, made by the kit's `New-Worktree.ps1` and removed by its `Remove-Worktree.ps1` (the workspace rules in the kit's `WowAddons.md` say why and how). In this repo: each branch is merged through its own PR against `main`; once one is merged, `git pull` in the main checkout, where `main` is checked out, then `git rebase main` in each remaining worktree before its PR. Regenerate a conflicting snapshot with `-write` instead of merging it by hand, and keep both sides of a `Changelog.md` conflict.

## Blizzard UI source and deprecated globals (`Update-DeprecatedApi.ps1`)

The kit's `Update-UiSource.ps1` keeps read-only shallow clones of Gethe/wow-ui-source in `..\wow-ui-source\<branch>` next to the main checkout; the kit's `agents/taint-reviewer.md` describes their layout and the `ketho.wow-api` annotations. In this repo's code: Mists loads the `Cata/` variant of the achievement UI. `.claude/settings.json` grants Claude Code read access to the clones and the kit through `additionalDirectories`.

Blizzard keeps old global names alive as aliases in its `Blizzard_Deprecated*` addons, which load only while the `loadDeprecationFallbacks` CVar is on and which a later patch deletes. The `deprecated-api` rule reports any read of such a name, from the committed list `Check-Repo.deprecated-api`, so it runs offline.
- `Update-DeprecatedApi.ps1` rebuilds the list from the clones of the clients the `.toc`'s Interface line lists (12 `live`, 5 `classic`, 3 `classic_titan`, 2 `classic_anniversary`, 1 `classic_era`).
- The classification is the kit's `tools\DeprecatedApi.ps1`, which the kit's `Find-DeprecatedApi.ps1` uses too: a deprecation file is one under a `Blizzard_Deprecated*` or `Deprecated_*` addon or one whose code checks the CVar, a per-game variant counts only for its own game, and every other file shows what the client has for real. A name is "deprecated" on a client that has it only as an alias, "removed" on a client that has it nowhere, and skipped where it is real.
- A name a deleted file took with it stays listed, as removed, while no listed client has it. Names `Check-Repo.removed-api` lists are left to that rule.
- After `Update-UiSource.ps1 -Branch live, classic, classic_titan` on a patch day, run it and commit the diff. A run on unchanged clones writes the same bytes, and a missing clone stops it with the command to run.
- A deliberate exception goes in `Check-Repo.ignore` with a comment, narrowed to the one global with the optional third field (`deprecated-api <path glob> <name>`), so it does not hide a later read in the same file. Typical cases are a guarded fallback for a client without the new API, or a file only a client that has the name loads.

Known limits:
- The rule does not know which client loads a file, so a Classic-only file reading a name only Retail deprecated is an Error; give it a named ignore entry.
- A clone's `Mainline/` and `Classic/` subfolders are all read as that client's own code.
- A replacement Blizzard wrote as an expression, or only in a comment, shows as `-`.

```powershell
& ".claude\tools\Update-DeprecatedApi.ps1"              # -UiSource <folder> to read clones elsewhere
```

## Data-verification scripts (online)

Not offline tools, but listed here so the instruction file can stay short. These PowerShell scripts under `.claude/skills/` and `raw/` query the local game-database server (wow.tools.local at `http://localhost:5000`). Each `SKILL.md` documents the workflow; `.claude/skills/verify-achievement-data/API.md` is the query reference, and the rule for the lookup scripts is in the instruction file.

No script types a build. The kit's `Get-WowBuilds.ps1` picks the newest `wow` and `wow_classic` build from the server's local list, falling back to the remote list, and every lookup script dot-sources it after `.claude\tools\KitPath.ps1`; `-Client Classic` selects the Classic build where a script serves both, and `$env:KAF_RETAIL_PRODUCT = "wowxptr"` (or `"wowt"`) points Retail at a patch still on the PTR. Each lookup script takes its values as parameters (`-Ids`, `-Terms`, `-Names`, `-Table`/`-Name`); the parameter's default in the `param()` block is the placeholder, which can still be edited instead and must be reset afterwards (the `lookup-placeholders` rule).

```powershell
# Start the DB server if it is not running (waits up to 60 s)
& ".claude\skills\add-zone-data\_start_server.ps1"

# The builds every lookup resolves to
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\Get-WowBuilds.ps1"

# Zone data: every Zone() entry (duplicates, map ids, ids exist on Retail or Classic) and the decisions log
# raw/ZoneDataDecisions.md against the files and the DB. Builds are resolved from the server, never typed.
& "raw\Evaluate-ZoneData.ps1"                                  # -SkipDbCheck for the offline part
& "raw\Evaluate-ZoneDataDecisions.ps1"                         # -SkipDb for the offline part (what Check-Repo runs)

# Verify a data file against the game DB (ids exist, faction splits, title rewards, comments)
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "DataAddons\Retail\11_TheWarWithin\AchievementData.lua"
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "<file>" -Checks id-exists,faction,title-reward,description-lang

# Check every achievement in a patch block is placed in some CategoryData.lua
& ".claude\skills\add-category-data\_evaluate_coverage.ps1" -PatchKey 12_01_00 -AchievementFile "DataAddons\Retail\12_Midnight\AchievementData.lua"

# Batch ID lookup: id|Title|Reward|Faction|RewardItemID on one build, or id|Title|Description|builds= on both
& ".claude\skills\add-achievement-data\_lookup_ids.ps1" -Ids 6,62387                  # -Client Classic
& ".claude\skills\add-zone-data\_lookup_ids.ps1" -Ids 6,62387

# Reward ids for :Mount(), :Pet(), :HousingDecor(); holiday dates for Obtainable() windows; any table by name
& ".claude\skills\add-achievement-data\_lookup_mount_id.ps1" -Names "Kor'kron War Wolf"
& ".claude\skills\add-achievement-data\_lookup_pet_speciesid.ps1" -Names "Zesty"
& ".claude\skills\add-achievement-data\_lookup_housingdecor_id.ps1" -Names "Amani Forge"
& ".claude\skills\add-achievement-data\_lookup_holidays.ps1" -Terms "Brewfest"
& ".claude\skills\add-category-data\_lookup_name.ps1" -Table uimap -Name "Stormwind City"
```