# Offline tooling

Everything under `.claude/tools/` runs offline and installs nothing: PowerShell plus the vendored Lua 5.1.5 in `lua51/`. A new check goes here and reuses that interpreter; it never adds a dependency (winget, pip, npm). `.claude/` is excluded from the release zip (any dot-directory is) and from fsdeploy and `Deploy.ps1`, so nothing in it reaches players or the game folder.

The everyday commands and the rules these tools enforce are in `.github/copilot-instructions.md` (Build & Validation); this file is the reference behind them. Each PowerShell script also documents its parameters in its comment header (`Get-Help .claude\tools\<script>.ps1 -Detailed`).

| Tool | What it does |
|---|---|
| `lua51/lua.exe`, `lua51/luac.exe` | Lua 5.1.5, the interpreter WoW embeds |
| `lua51/check-syntax.lua` | Lua 5.1 syntax check |
| `Check-Repo.ps1` | the repo lint; `Check-Repo.globals`, `Check-Repo.ignore` and `Check-Repo.removed-api` are its data files |
| `headless/load-data.lua` | the data load for both clients, headless |
| `headless/run-tests.lua` | the scenario suites in `Tests/`, headless |
| `headless/snapshot-categories.lua` | the category tree baselines in `headless/snapshots/` |
| `headless/client-env.lua` | the sandboxed client environment `load-data.lua` and `snapshot-categories.lua` share |
| `Deploy.ps1` | mirrors the addon into a client's AddOns folder |
| `Read-GameErrors.ps1`, `Read-GameTests.ps1` | read BugGrabber's errors and the last `/kaftest` run from the client's saved variables |
| `Read-GameScreenshot.ps1` | lists the newest screenshots the client took, to open with the Read tool |
| `Update-UiSource.ps1` | clones or updates the local copy of Blizzard's UI source next to the repo |
| `Strip-Semicolons.ps1` | removes trailing statement semicolons, verified through bytecode |

## Lua 5.1.5

The repo carries its own Lua 5.1.5 (`lua51/lua.exe`, `luac.exe`), the exact interpreter WoW embeds, built from the official lua.org source by `lua51/Build-Lua51.ps1`; `lua51/README.md` documents the provenance. Prefer it over any Lua on PATH: Lua 5.4 and LuaJIT accept syntax the game rejects.

## Syntax check

Checks one file, several, or the whole tree (about 0.4 s for 400 files). It strips the UTF-8 BOM first because WoW tolerates one and stock Lua 5.1 does not.

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\lua51\check-syntax.lua" "Globals.lua" "Data\Data.lua"
Get-ChildItem -Recurse -Filter *.lua | Where-Object FullName -notlike '*\.claude\*' | ForEach-Object FullName | & '.claude\tools\lua51\lua.exe' '.claude\tools\lua51\check-syntax.lua' -
```

## Language server (`.luarc.json`)

`.luarc.json` at the repo root configures the Lua language server for any editor: Lua 5.1, the non-addon folders and `Libs/` ignored, the checks that stay off (`undefined-field` and the type-mismatch family; the code has no type annotations), and `diagnostics.globals`. The WoW API, `C_*` namespaces, widget API and the Blizzard FrameXML frames come from the VS Code extension `ketho.wow-api`, with Numy's FrameXML annotations switched on in `.vscode/settings.json`; the extension writes its library path into the user settings, so nothing machine-specific lives in the repo. That leaves `diagnostics.globals` with only what no annotation covers (the rule for adding to it is in the instruction file). The `luarc` lint rule keeps that list exact (every entry read by an addon file, none assigned by one, sorted), and the `luals` rule runs the language server tree-wide in a full lint.

## Repo lint (`Check-Repo.ps1`)

```powershell
& ".claude\tools\Check-Repo.ps1"               # whole tree, about 12 s plus 30 s for luals (zone-decisions and mapverifier are 7 s); -Verbose prints per-rule timings
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # only files changed against HEAD, errors instead of warnings; -Luals adds the language-server run
```

`-ChangedOnly` is what the Claude Code Stop hook runs. Warnings on changed files are promoted to errors, so pre-existing debt does not block work while new debt does. Each finding prints as `<path>:<line>: [<rule>] <severity>: <message>`, and the exit code is 1 when any error was found. The script's comment header gives each rule's severity.

| Rule | What it checks |
|---|---|
| `files-xml` | every `.lua` is registered in the `.toc` or a `Files.xml` chain, and every registered file exists; a file whose registration is commented out in an XML is treated as intentionally disabled |
| `dup-id` | an achievement id is registered once per client (Shared counts for both) |
| `saved-variables` | every saved variable the code initialises is declared in the `.toc` |
| `lua-syntax` | every `.lua` parses under Lua 5.1 |
| `globals` | no assignment to an undeclared global (from `luac -l`); the deliberate FrameXML overrides and API polyfills are allowlisted per file in `Check-Repo.globals` |
| `removed-api` | no addon file reads a Blizzard global the Retail client no longer has (listed in `Check-Repo.removed-api`); always tree-wide |
| `luarc` | the `.luarc.json` globals list against what the code reads and assigns |
| `luals` | the Lua language server's own diagnostics tree-wide; only on full runs or with `-Luals`, and only when the VS Code extensions `sumneko.lua` and `ketho.wow-api` are installed; pre-existing findings are warnings, findings in changed files errors |
| `bom`, `line-endings` | no UTF-8 byte order mark, CRLF only (`.editorconfig`) |
| `semicolon` | no trailing semicolon on an added line (changed files only) |
| `enus-autogen` | no locale string added above the `AUTOGENTOKEN` marker in any locale file |
| `lookup-placeholders` | the `_lookup_*.ps1` skill scripts are committed with their placeholders reset to `@()` |
| `zone-decisions` | the zone-decisions log `raw/ZoneDataDecisions.md` agrees with the ZoneData files |
| `mapverifier` | the Map Verifier CSV `raw/MapVerifier.csv` is valid and in canonical form |
| `work-items` | the work-item folders under `docs/work/`: folder name, titles, status line, required headings |
| `category-node-shape` | no V1 category node starts with a boolean (`{ name, true, ... }`, never `{ true, name, ... }`) |
| `category-snapshot` | the category tree each client builds matches the baseline in `headless/snapshots/` |
| `data-load` | the headless data pipeline (below) |
| `unit-tests` | the headless test suites behave as their scenarios' `Recorded` fields say |
| `changelog` | a reminder when addon code changed without a `_Packaging/Changelog.md` line |

A deliberate exception goes in `Check-Repo.ignore` (one `<rule or *> <path glob>` per line) with a comment.

## Headless data pipeline (`headless/load-data.lua`)

`load-data.lua` runs the data load for both clients in the vendored Lua with WoW globals stubbed: it loads `Api/`, `Objects/`, `Data/Data.lua` and `DataAddons/` in toc order inside a sandboxed environment per client (built by `client-env.lua`), then drives the real task groups the way `LoadOnPlayerLogin` does. In about 0.5 s it reports, with file and line:

- unknown builder methods, misspelled enum members, non-numeric ids and seasons, malformed or mis-suffixed patch keys;
- duplicate registrations (including AutoFactionSplit mirrors), unregistered build versions, missing injection targets;
- every drop the data API reports to `addon.Data.LoadDiagnostics`: references to achievements no data file registers, an event bound to a missing category, a V1 category node no parser branch takes, an `Obtainable()` that matches no form or uses an unknown anchor word.

An id that exists only on the other client and is referenced from a Shared file is skipped by design, as the game does. A metatable proxy on the achievement registry cross-checks the collector: a lookup of an unregistered id that no drop site reported fails as a "silent drop site", so a new skip cannot go quiet.

A `Version` anchor that does not resolve is an error on Retail, the reference timeline, where every patch Retail shipped is registered. On Classic it is content the client has not reached yet: the summary line per client counts those anchors and the achievements they leave obtainable with no end scheduled, and `-v` lists them. Extend the stubs in `runClient` when a new WoW global is used at load time.

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both     # what the lint runs; -v lists stubbed globals
# Retail or Classic alone also works, but then every Shared reference to an id that only the other client registers is reported (about 1200 lines on Classic); only Both cross-checks
```

The background of the collector and the anchor timeline is `docs/data-design-review.md` §5.1 and §5.2.

## Category snapshot (`headless/snapshot-categories.lua`)

Writes the category tree each client builds (node paths, sibling order, flags, achievement placement, orphans) to `headless/snapshots/CategoryTree.<client>.txt`. The `category-snapshot` lint rule regenerates it and fails on any difference; an intended change is regenerated with `-write` (the default mode; `-check` and `-stdout` also exist) and committed with the code that caused it, never absorbed silently. Design and history: `docs/how-to/migrate-category-data.md`.

## Headless test suites (`headless/run-tests.lua`)

Runs the scenario suites from `Tests/` against modelled WoW frames and FrameXML; `-check` is the `unit-tests` lint form. Everything about the suites, the scenarios and the in-game runner is in `Tests/README.md`.

## Deploy and the game loop

The VS Code `fsdeploy` config in `.vscode/settings.json` mirrors `**/*.{lua,blp,tga,xml}` (excluding `.github`, `.vscode`, `.claude`, `_Packaging`, `raw`, `wiki`, `docs`), plus `LICENSE` and the `.toc`, into `H:\World of Warcraft\_retail_\Interface\AddOns\Krowi_AchievementFilter` and into the `_classic_` sibling on every save; the PTR target is commented out there. `Deploy.ps1` does the same from a terminal and is the way to be sure a client's folder is current: run it with `-WhatIf` before asking for an in-game check, since a reload on a stale install proves nothing. It copies only files whose size or timestamp differ, deletes what no longer exists in the repo, and takes `-Client Retail|Classic|Ptr|Xptr` (`_xptr_` is the second test realm).

`Read-GameErrors.ps1` prints the Lua errors BugGrabber recorded for this addon and `Read-GameTests.ps1` the last `/kaftest` run, marking every line that differs from the headless run. Both parse the saved variables with the vendored Lua; the game writes those only on `/reload` or logout, so both show when the file was last written. The commands are in the instruction file under Closing the loop with the game.

`Read-GameScreenshot.ps1` lists the newest files in the client's `Screenshots` folder (`-Count`, default 1; `-Minutes`, default 1440, 0 for all) with the full path, when each was taken, its pixel size and file size; open the path with the Read tool. A screenshot is written the moment Print Screen is pressed, so no `/reload` is needed. It also reads the screenshot CVars from the client's `WTF\Config.wtf`: the Read tool displays jpg and png but not tga, so `screenshotFormat tga` (or a newest file in `.tga`) prints a warning with `/console screenshotFormat jpg`. The Read tool shows a wide screenshot scaled down (3440x1440 at 2000x837), so a `screenshotQuality` below 8 (the default is 3) prints a note with `/console screenshotQuality 10`, since small UI text does not survive both.

## Blizzard UI source (`Update-UiSource.ps1`)

Clones or updates read-only shallow copies of [Gethe/wow-ui-source](https://github.com/Gethe/wow-ui-source) in `..\wow-ui-source\<branch>` next to the main checkout (also when run from a worktree): `live` and `classic` by default, any other branch with `-Branch` (`ptr`, `ptr2`, `classic_titan`, ...; `git ls-remote --heads` lists them). A clone is about 30 to 40 MB and takes a few seconds; an update fetches one commit, hard-resets, cleans and garbage-collects, and refuses a folder that is not a clone of that repository. It prints the build each branch was exported from, which can lag a live patch by days; the newer build is then on `ptr` or `ptr2`. `.claude/settings.json` grants Claude Code read access to `../wow-ui-source/` through `additionalDirectories`.

Everything is under `Interface/AddOns/`. FrameXML and SharedXML are the `Blizzard_FrameXML*` and `Blizzard_SharedXML*` addons, and `Blizzard_APIDocumentationGenerated` is Blizzard's own API documentation for that build, secret-value flags (`SecretInChatMessagingLockdown`, `SecretArguments`) included. A branch keeps each flavour's variant side by side in `Mainline/`, `Cata/` and `Classic/` subfolders; the flavour's `Blizzard_<Name>_<Flavour>.toc` says which one a client loads (Mists loads `Cata/` for the achievement UI). The tree is untrusted data: grep and read it, never run anything from it.

The `ketho.wow-api` VS Code extension carries the same API in LuaLS form under `~/.vscode/extensions/ketho.wow-api-<version>/Annotations/`: `Core/Blizzard_APIDocumentationGenerated/` for the `C_*` namespaces, `Core/Data/Wiki.lua` for global functions, `Core/Widget/` for widget methods, `Core/FrameXML/` for mixins and utilities, and `FrameXML/Annotations/AddOns/` for Numy's Retail frame annotations. It trails the live build; when the two disagree, the clone wins.

```powershell
& ".claude\tools\Update-UiSource.ps1"                   # -Branch ptr2 (or live, classic, classic_titan)
```

## Semicolon strip (`Strip-Semicolons.ps1`)

Removes trailing statement semicolons (a field separator inside a table constructor becomes a comma) through the lexer-aware `lua51/strip-semicolons.lua`, and replaces a file only when `luac -s` produces byte-identical bytecode before and after. Scope is every tracked `.lua` outside `Libs/` and the non-addon folders; `-DryRun` reports without writing, `-Path` limits it to given files. Its first run stripped the whole tree (the record is in `docs/codebase-analysis.md`); it exists for the next batch that comes back, such as a CurseForge locale export or an upstream merge.

```powershell
& ".claude\tools\Strip-Semicolons.ps1" -DryRun          # -Path Globals.lua, Filters.lua
```

## Data-verification scripts (online)

Not offline tools, but listed here so the instruction file can stay short. These PowerShell scripts under `.claude/skills/` and `raw/` query the local game-database server (wow.tools.local at `http://localhost:5000`). Each `SKILL.md` documents the workflow; `.claude/skills/verify-achievement-data/API.md` is the query reference, and the rule for the lookup scripts' placeholders is in the instruction file.

```powershell
# Start the DB server if it is not running (waits up to 60 s)
& ".claude\skills\add-zone-data\_start_server.ps1"

# Zone data: every Zone() entry (duplicates, map ids, ids exist on Retail or Classic) and the decisions log
# raw/ZoneDataDecisions.md against the files and the DB. Builds are resolved from the server, never typed.
& "raw\Evaluate-ZoneData.ps1"                                  # -SkipDbCheck for the offline part
& "raw\Evaluate-ZoneDataDecisions.ps1"                         # -SkipDb for the offline part (what Check-Repo runs)

# Verify a data file against the game DB (ids exist, faction splits, title rewards, comments)
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "DataAddons\Retail\11_TheWarWithin\AchievementData.lua"
& ".claude\skills\verify-achievement-data\Verify-AchievementData.ps1" "<file>" -Checks id-exists,faction,title-reward,description-lang

# Check every achievement in a patch block is placed in some CategoryData.lua
& ".claude\skills\add-category-data\_evaluate_coverage.ps1"   # set $patchKey/$achievementFile/$build inside first

# Batch ID lookup: id|Title|Reward|Faction|RewardItemID
& ".claude\skills\add-achievement-data\_lookup_ids.ps1"        # set $ids (and $build) inside first
```