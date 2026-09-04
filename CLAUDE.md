# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Krowi's Achievement Filter (`KrowiAF`) is a World of Warcraft addon written in Lua 5.1 + WoW XML. It replaces the Blizzard Achievements UI and adds Expansions / Events / PvP / Specials tabs backed by ~8800 hand-curated achievement records. It ships for both Retail (mainline) and Classic (Wrath/Cata/Mists) from the same tree.

`.github/copilot-instructions.md` is the canonical, detailed reference for layout, load order, data formats, and code style. Read it before non-trivial work; this file only adds what it does not cover and calls out the parts that matter most.

## No build, no tests, no linter

The WoW client is the only runtime and the only full validator. There is no `luacheck`, `busted`, Makefile, or CI in this repo. Do not invent or run one. The offline checks that exist are the syntax checker and repo lint below; use them, and extend the harness under `.claude/` rather than adding system dependencies. Packaging and publishing are done by the sibling Krowi Addon Manager project; the `release` skill in `.claude/skills/release/` documents how to drive it.

- **Deploy to the game**: the VS Code `fsdeploy` config in `.vscode/settings.json` mirrors `**/*.{lua,blp,tga,xml}` (excluding `.github`, `.vscode`, `_Packaging`, `raw`, `wiki`, `docs`) into `H:\World of Warcraft\_retail_\Interface\AddOns\Krowi_AchievementFilter`. The Classic target is commented out there.
- **Reload in game**: `/reload`. Enable errors with `/luaerror on` or BugSack + BugGrabber.
- **Static checks**: the Lua language server globals list in `.vscode/settings.json`. New WoW API globals may need adding there to silence diagnostics.

### Harness tooling under `.claude/` (self-contained, installs nothing)

The repo carries its own Lua 5.1.5 (`.claude/tools/lua51/lua.exe`, `luac.exe`), the exact interpreter WoW embeds, built from the official lua.org source by `Build-Lua51.ps1` in that folder (see its README for provenance). Prefer it over any Lua on PATH: Lua 5.4 and LuaJIT accept syntax the game rejects.

- `.claude/hooks/Check-LuaSyntax.ps1` runs automatically after every Edit/Write of a `.lua` file (wired in `.claude/settings.json`) and feeds parse errors back. It strips the UTF-8 BOM first because WoW tolerates one and stock Lua 5.1 does not. It fails open if the tooling is missing.
- Check files by hand, or the whole tree (about 0.4 s for 400 files):

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\lua51\check-syntax.lua" "Globals.lua" "Data\Data.lua"
Get-ChildItem -Recurse -Filter *.lua | Where-Object FullName -notlike '*\.claude\*' | ForEach-Object FullName | & '.claude\tools\lua51\lua.exe' '.claude\tools\lua51\check-syntax.lua' -
```

- `.claude/tools/Check-Repo.ps1` is the repo lint: unregistered or missing Files.xml entries, duplicate achievement IDs per client, saved variables missing from the .toc, Lua syntax, BOM and line endings, trailing semicolons and enUS additions below the AUTOGENTOKEN marker on changed lines, the zone-decisions log against the ZoneData files (rule `zone-decisions`, runs when either changed), and a changelog reminder. It runs automatically as a Stop hook in `-ChangedOnly` mode and hands errors back. A deliberate exception goes in `Check-Repo.ignore` with a comment; a file whose registration is commented out in an XML is already treated as intentionally disabled.

```powershell
& ".claude\tools\Check-Repo.ps1"               # whole tree, about 6 s (2 s without the zone-decisions rule)
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # what the Stop hook runs
```

- `.claude/tools/headless/load-data.lua` runs the data pipeline headlessly for both clients in the vendored Lua with WoW globals stubbed: it loads `Api/`, `Objects/`, `Data/Data.lua` and `DataAddons/` in toc order inside a sandboxed environment per client, then drives the real task groups the way `LoadOnPlayerLogin` does. Unknown builder methods, misspelled enum members, non-numeric ids and seasons, malformed or mis-suffixed patch keys, duplicate registrations (including AutoFactionSplit mirrors), unregistered build versions, missing injection targets, and category/zone/tooltip references to achievements no data file registers all surface with file and line, in about 0.5 s. An id that exists only on the other client and is referenced from a Shared file is skipped by design, as the game does. The lint runs it as the `data-load` rule. Extend the stubs in `runClient` when a new WoW global is used at load time.
- **Closing the loop with the game**: `Deploy.ps1` mirrors the addon into the client's AddOns folder (what fsdeploy does, incremental, `-WhatIf` to preview), you `/reload` in game, then `Read-GameErrors.ps1` prints the errors BugGrabber recorded for this addon. Saved variables are written only on `/reload` or logout, so the reader shows when the log was last written.

```powershell
& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Retail   # or Classic; -v lists stubbed globals
& ".claude\tools\Deploy.ps1" -WhatIf                    # -Client Classic|Ptr
& ".claude\tools\Read-GameErrors.ps1"                   # -Hours 0 -All -Client Classic
```

- **Subagents** in `.claude/agents/`: `data-verifier` checks achievement ids against both game builds through the designated lookup scripts and runs the headless pipeline; delegate to it before calling any data line dead. `taint-reviewer` reviews a diff for taint and secret-value hazards using the changelog's dev notes as case law; delegate to it after GUI or Blizzard-API changes.

`.claude/` is excluded from the release zip (any dot-directory is) and from fsdeploy, so nothing in it reaches players or the game folder.

### Data-verification tooling (the only "commands" in the repo)

These PowerShell scripts under `.claude/skills/` query a local game-database server (wow.tools.local at `http://localhost:5000`). Each `SKILL.md` documents the workflow.

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

**Rule for lookup scripts**: edit the placeholder variable (`$ids = @()`, `$terms = @()`) inside the designated script, run it with the same unchanged command, then reset the placeholder. Never write ad-hoc inline `Invoke-RestMethod`/`curl` commands with IDs embedded; the user rejects them. `Explore` subagents cannot reach `localhost:5000`, so do lookups from the main agent.

## Architecture: what you need to hold in your head

### Load order is the module system

`Krowi_AchievementFilter.toc` lists files and nested `Files.xml` manifests in strict order. A file can only use what earlier files defined. Every new `.lua` file must be added to the right `Files.xml` or it silently never loads. Retail-vs-Classic splits are `[AllowLoadGameType mainline]` / `[AllowLoadGameType wrath, cata, mists]` directives on `Gui/FilesModern.xml` vs `Gui/FilesClassic.xml`, `Data/Retail`, `DataAddons/Retail` vs `DataAddons/Classic`. In code, use `addon.Util.IsMainline`, `addon.Util.IsClassicWithAchievements`, `addon.Util.IsWrathClassic` (from `Libs/Krowi_Util`).

### Two namespaces

Every file starts `local _, addon = ...` (or `local addonName, addon = ...`). `addon.*` is the private namespace (`addon.Data`, `addon.Gui`, `addon.Objects`, `addon.Options`, `addon.Filters`, `addon.Diagnostics`). `KrowiAF` (created in `Api/Api.lua`) is the public surface: enums, data-registration tables (`KrowiAF.AchievementData`, `KrowiAF.CategoryData`, ...), the builder `KrowiAF.Ach`, and `KrowiAF.PluginsApi`. Data files write only to `KrowiAF.*`; runtime code reads `addon.Data.*`.

### Three-phase boot (`Krowi_AchievementFilter.lua`)

1. `ADDON_LOADED` for this addon: options, saved-data migrations (`Data/DataIntegrityManager.lua`), plugins, GUI parts that do not depend on Blizzard's frame.
2. `ADDON_LOADED` for `Blizzard_AchievementUI` (load-on-demand): `addon.Gui:LoadWithBlizzard_AchievementUI()` hooks and reshapes `AchievementFrame`. Anything touching Blizzard achievement frames goes here, not in phase 1.
3. `PLAYER_LOGIN`: `addon.Data:LoadOnPlayerLogin()` builds all achievement/category/zone objects, then `addon.BuildCacheAsync` (in `Globals.lua`) walks every achievement ID. Both run as coroutine-style task groups yielding on a per-frame time budget. **`addon.Data.Achievements` is empty until phase 3 completes**; code that needs populated data must hook into `PostLoadOnPlayerLogin` / `PostBuildCache` in `Data/Data.lua`.

### Data pipeline (the "invisible magic")

Data files declare bare tables and never call processing functions:

```lua
KrowiAF.AchievementData["11_01_00"] = {   -- key = EE_PP_SS (expansion, major, minor); "_S" suffix = Shared
    Ach(41234):Mount(),                    -- V2 fluent builder, Api/AchievementDataBuilder.lua
}
```

`DataAddons/Loaders/*.lua` (loaded last) prepend the processor function at index 1 of each chunk (e.g. `KrowiAF.AddEventData`). `Data/Data.lua`'s `Register*DataTasks` push each chunk into `TasksGroups`; the runner (`addon.StartTasksGroups`, `Globals.lua`) calls `chunk[1](unpack(rest))`. For achievements, `Data.lua` also inserts `{KrowiAF.SetAchievementPatch, major, minor, patch}` derived from the table key, and `Ach()` entries resolve to `KrowiAF.AddAchievementData`, which constructs `addon.Objects.Achievement`. Registering the same ID twice hits an `assert`, so each achievement lives in exactly one place: Shared (`DataAddons/Shared/EE_.../`, identical on both clients) or the Retail/Classic file (client-specific entries only). Classic-only patches are never migrated to Shared.

Per-expansion folder contents: `AchievementData`, `CategoryData`, `ZoneData` (one per expansion, never per patch), `TooltipData`, `TransmogSetData`, `PetBattleLinkData`, `CustomCriteriaData`, `EventData`, `BuildVersionData`. `Data/Retail/ExportedUiMaps.lua` is a legacy zone fallback being migrated into `ZoneData` (see `.claude/skills/migrate-zone-fallbacks`).

Format references with worked examples: `wiki/achievement-data/*.md`, `docs/how-to/*.md`, `Api/ApiDocumentation.lua`, and `DataAddons/Retail/11_TheWarWithin/` as the canonical V2 expansion.

### Objects and filters

`Objects/*.lua` are metatable classes (`x.__index = x; function x:New()`). `Achievement` carries patch, faction, reward type, PvP/season flags, and a list of temporary-obtainable records; `Data/TemporaryObtainable.lua` resolves those to Past/Current/Future using season anchors registered via `KrowiAF.AddSeasonData`. `Filters.Validate` returns a signed integer (negative = rejected by rule `i`, `1` = show, `2` = always visible), not a boolean.

### Taint is the recurring bug class

Most recent fixes (see the dev notes in `_Packaging/Changelog.md`) are taint or secret-value errors. Never override Blizzard globals; that approach was removed years ago and its leftovers still cause bugs. Do not compare or do arithmetic on values from `C_Calendar`, aura, or objective-tracker APIs without considering `SecretInChatMessagingLockdown`. `TaintDiagnostics.lua` and `Diagnostics.lua` exist for probing this; `addon.Diagnostics.DebugEnabled()` gates debug paths.

### Saved variables and migrations

Declared in the `.toc` `## SavedVariables` line; a new one that is not listed there is lost on logout. Schema changes go through numbered solutions in `Data/DataIntegrityManager.lua`, which run in order on version upgrade.

### Vendored libraries

`Libs/` is vendored; `Krowi_Menu`, `Krowi_ProgressBar`, `Krowi_WorldMapButtons`, `Krowi_Tutorials`, `Krowi_Util`, `Krowi_PopupDialog` are git submodules pointing at `TheKrowi/*` repos. Do not edit them in this repo unless asked; fixes belong upstream.

### Localization

`Localization/enUS.lua` has a hand-maintained block above the `AUTOGENTOKEN` comment and a CurseForge-generated block below it. Add strings above the marker only. Other locale files are managed by CurseForge; do not add strings to them. Plugin strings go in `enUS.Plugins.lua`, Wrath-specific in `enUS.WrathClassic.lua`.

## Conventions that differ from the existing code

New and edited code uses **no trailing semicolons**; most existing files still have them, and the rule is to drop them on lines you touch. The header is `local _, addon = ...` with no `-- [[ Namespaces ]] --` banner. Full naming/OOP/forward-declaration rules are in `.github/copilot-instructions.md`. Files are CRLF, 4-space indent, no final newline (`.editorconfig`).

## Git workflow

- Branch from `dev`; PRs target `dev`. Releases are cut on `dev`: the addon manager makes a `Release X.Y` commit and tag there and uploads to Wago, CurseForge and GitHub. `main` is not updated as part of the release flow. Use the `release` skill.
- Conventional Commits with a custom `data:` type: `data(midnight): add 12.1.0 achievements (23)`, `fix(retail): ...`, `feat(classic): ...`, `locale(enUS): ...`, `chore:`, `refactor(gui):`, `docs:`.
- Every user-visible change gets a line in `_Packaging/Changelog.md` under the next version's `### Added` / `### Fixed`. Non-obvious fixes carry a `(dev note: ...)` explaining the root cause, following the existing entries. `ReleaseNotes.md` is generated from it at release time; do not edit it by hand. The version header needs a date (`## 100.2 - 2026-09-04`) before release or the generator skips it.
- PR checklist (`.github/pull_request_template.md`): Files.xml registration, SavedVariables, enUS above `AUTOGENTOKEN`, changelog, tested Retail/Classic.

## Where non-code material lives

- `docs/how-to/` step-by-step guides; `docs/codebase-analysis.md` is a quality review listing known debt (`Globals.lua` grab-bag, O(n^2) `GetMergedCategory`, version-string compare in DataIntegrityManager).
- `wiki/` knowledge base on data formats with `index.md` and a `log.md` of changes.
- `raw/` scratch reports and zone-data PowerShell tooling; `raw/MapVerifier.csv` is the canonical Map Verifier state (map verdicts, link groups, expansions; round-tripped with the in-game tool through the `sync-mapverifier` skill, validated by the `mapverifier` lint rule); `raw/ZoneDataDecisions.md` tracks the highest achievement ID analyzed for zone coverage.
- `_Packaging/` changelog, release notes, CurseForge description. Not loaded by the game.

## External references

Warcraft Wiki (API), the townlong-yak FrameXML browser (live and classic), Gethe/wow-ui-source, and Stanzilla/WoWUIBugs. URLs are listed in `.github/copilot-instructions.md`.