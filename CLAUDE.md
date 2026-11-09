# Krowi's Achievement Filter

**Krowi's Achievement Filter** (prefix `KrowiAF`, acronym `KAF`) replaces Blizzard's Achievements UI and adds Expansions, Events, PvP and Specials tabs backed by about 8400 hand-curated achievement records in 1200+ categories, with filtering, sorting, searching and tracking. It ships for Retail (mainline) and Classic (Wrath, Cata, Mists) from the same tree, in Lua 5.1 and WoW XML; the game client is its only runtime. All Rights Reserved (`LICENSE`).

## Instructions

This file loads into every session and every general-purpose subagent, so it holds only what most tasks need and the code does not show. A rule one area of the code needs is in `.claude/rules/` (data, events, features, localization, tests, release) and loads once a file of that area is read or edited. A lesson goes back where it applies (`docs/sdlc-playbook.md`, stage 6): here only when every task needs it, else its path rule, a skill, a lint rule or a scenario. The `instructions` lint rule keeps this file within 16 KB and 200 lines and each rule within 8 KB.

## Build and checks

There is no build step, no external linter or test framework and no CI: never run or invent `luacheck`, `busted`, a Makefile or GitHub Actions. The game loads the addon from the `.toc` and is the only full validator; the offline checks install nothing. This repo's tools are in `.claude/tools/` (each tool and lint rule: `.claude/tools/README.md`) and reach the kit through `.claude/tools/KitPath.ps1`.

```powershell
& ".claude\tools\Check-Repo.ps1" -ChangedOnly  # lint the changed files, errors instead of warnings; no switch: whole tree; -Luals adds the language server
& ".claude\tools\Show-Achievement.ps1" 5313    # one call per achievement question: data line, snapshot line, state, categories, zones per client; -Db -History
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both     # headless data load
& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" escape   # one scenario suite; -check for the lint form
& ".claude\tools\Run-GameTests.ps1" options, escape   # a whole in-game run, start or /reload to results, nothing typed by hand; -Client Classic; -Matrix
& ".claude\tools\Read-GameTests.ps1"                  # the last /kaftest run, every line that differs from the headless run marked; -Client, -Run <n>
```

- **Stop hook:** `.claude/hooks/Check-RepoOnStop.ps1` runs `Check-Repo.ps1 -ChangedOnly` when a turn ends and hands errors back. Fix them, or add a deliberate exception to `.claude/tools/Check-Repo.ignore` with a comment. After a switch with EnterWorktree it still runs from the checkout the session started in, and lints the checkout the session's cwd is in.
- **Which suites to run** (Krowi, 2026-11-07): in development and in a pull request only the suites the change can affect, never the whole set; before a release the gate wants a green in-game run of all but the probes on the newest Retail and Mists build (`.claude/rules/release.md`). Green means it failed nothing and passed something (Krowi, 2026-11-08). The suites: `Tests/README.md`.
- **Without the client:** follow existing patterns exactly; register every new `.lua` file in the right `Files.xml` (a file not listed silently never loads, and a file can use only what earlier files define; the load order is in `docs/architecture.md`); declare every new saved variable in the `.toc`; keep XML template names and Lua frame references in sync.
- **Language server:** `.luarc.json`'s `diagnostics.globals` lists only what no annotation covers; add a name sorted, never one the server already resolves (`luarc` rule; `.claude/tools/README.md`, Language server).

## Architecture

- **Two namespaces.** Every file starts `local _, addon = ...` (or `local addonName, addon = ...`). `addon.*` is the private namespace (`addon.Data`, `addon.Gui`, `addon.Objects`, `addon.Options`, `addon.Filters`, `addon.Diagnostics`, `addon.Plugins`, ...). `KrowiAF` is the public surface: enums (`KrowiAF.Enum.Faction`, `RewardType`, `EventType`, ...), data-registration tables (`KrowiAF.AchievementData`, `KrowiAF.CategoryData`, ...), the builder `KrowiAF.Ach` and `KrowiAF.PluginsApi`. `KROWI_LIBMAN` is the library manager from `Libs/Krowi_Util/LibMan.lua`. Data files write only to `KrowiAF.*`; runtime code reads `addon.Data.*`.
- **Three-phase boot** (`Krowi_AchievementFilter.lua`):
  1. `ADDON_LOADED` for this addon: options, saved-data migrations (`Data/DataIntegrityManager.lua`), plugins, GUI parts that do not depend on Blizzard's frame; the feature registry starts the features whose switch is on.
  2. `ADDON_LOADED` for `Blizzard_AchievementUI` (load-on-demand): `addon.Gui:LoadWithBlizzard_AchievementUI()` hooks and reshapes `AchievementFrame`. Anything touching Blizzard's achievement frames goes here, not in phase 1.
  3. `PLAYER_LOGIN`: `addon.Data:LoadOnPlayerLogin()` builds all achievement, category and zone objects, then `addon.BuildCacheAsync` (`Data/AchievementCache.lua`) walks every achievement id, both as task groups yielding on a per-frame time budget. **`addon.Data.Achievements` is empty until phase 3 completes**: code that needs the data hooks `PostLoadOnPlayerLogin` / `PostBuildCache` in `Data/Data.lua`.
- **Features** (since 106) live in `Features/<Name>/`, switch off per profile, and reach the core only through `Slots.lua` and the registry's parts; the core never names a feature (`feature-boundary` rule; `.claude/rules/features.md`).
- **Client flags** from `Libs/Krowi_Util`: `addon.Util.IsModern`, `IsMainline`, `IsClassicWithAchievements`, `IsWrathClassic`, `IsMistsClassic`; the `util-flags` rule fails on one Krowi_Util does not define. `IsModern` (Retail and WoW Forever) answers "does this client run Retail's interface?": frames, templates, atlases, skins; every `addon.MenuBuilder:New` passes `modern = addon.Util.IsModern`. Older interface code that branches on `not IsClassicWithAchievements` agrees with `IsModern` on every client with achievements, Forever included; new code uses `IsModern`. `IsMainline` (Retail only) answers "is this Retail's content?": achievement data, categories, maps, saved data, world events. KAF does not load on Forever yet (no 16001 in the `.toc`).
- **Filters:** `Filters.Validate` returns a signed integer (negative = rejected by rule `i`, `1` = show, `2` = always visible), not a boolean.
- **Event times** follow Krowi's event-source policy: `.claude/rules/events.md`.
- **`Libs/`** holds vendored libraries, several of them submodules of `TheKrowi/*`: do not edit them unless asked; fixes belong upstream, in `Krowi_Libraries`.

## Taint

Most fixes (the changelog's dev notes, the root causes in `docs/work/*/spec.md`) are taint or secret-value errors; the workspace rules hold the general ones.
- Never override Blizzard API functions (`GetAchievementCriteriaInfo`, `GetAchievementNumCriteria` and the like); that approach was removed years ago and its leftovers still cause bugs.
- The only globals the addon writes on purpose are the FrameXML UI functions it replaces in `addon.OverwriteFunctions` and the polyfills for removed API in `addon.LoadBlizzardApiChanges` (both in `Gui/BlizzardOverrides.lua`). They are listed in `.claude/tools/Check-Repo.globals`, and the `globals` rule fails on any other write to the global environment. A new global is allowlisted there with a reason, and needing one is a design smell.
- Do not compare or do arithmetic on values from `C_Calendar`, aura or objective-tracker APIs without considering `SecretInChatMessagingLockdown`.
- `TaintDiagnostics.lua` and `Diagnostics.lua` exist for probing this; `addon.Diagnostics.DebugEnabled()` gates debug paths.
- `krowi:taint-reviewer` reviews every change to GUI code, hooks, event handlers or lockdown-protected APIs.

## Background jobs allocate nothing when nothing changed

A background job is code that can run with every addon window closed: an OnUpdate script, a `C_Timer.NewTicker`, an event handler. Memory displays (`GetAddOnMemoryUsage`) count garbage until the game collects it, which can take an hour, so a job that allocates on every run makes the addon's memory climb for as long as the game runs (`docs/work/2026-10-18-memory-growth`).
- No allocation on a run where nothing it reports changed: walk tables in place instead of building key lists; pass functions and arguments to `pcall` instead of closures; do not call an API that returns a new table when its answer cannot have changed; check the cheap condition before the call that allocates.
- Each job has a scenario in the `memory` suite (`Tests/Memory.lua`) and a line in `.claude/tools/Check-Repo.jobs` (`background-jobs` rule). A job that runs only once, rarely or while something the player opened is shown is listed with that reason instead of a scenario.

## Saved variables

Declared on the `.toc`'s `## SavedVariables` line; one not listed there is lost on logout. Schema changes go through numbered solutions in `Data/DataIntegrityManager.lua`, which run in order on version upgrade.

## Code style

For all new and edited code, without being asked. The post-edit hook and the `bom`/`line-endings` rules keep the files UTF-8 without BOM, CRLF, 4-space indent, no final newline.
- **Header:** every file starts with the vararg unpack, `_` for an unused position (`local _, addon = ...`); no `-- [[ Namespaces ]] --` or similar banner above it.
- **No semicolons** at the end of statements. The tree is stripped, so any is new (`semicolon` rule); the kit's `Strip-Semicolons.ps1` re-runs the verified strip if a batch comes back (a CurseForge locale export, an upstream merge).
- **Naming:** local variables `camelCase`; module tables `camelCase` as a local, `PascalCase` on `addon.*` (`local gui = addon.Gui`); constructors and methods `PascalCase` (`function category:New()`); module-level private helpers `PascalCase` for named functions (`local function VersionLessThan(a, b)`), `camelCase` for locals.
- **Module:** `addon.MyModule = {}`, then `local myModule = addon.MyModule` and `function myModule.DoThing()`.
- **Object:** `local myObject = {}`, `myObject.__index = myObject`, `function myObject:New(...)` returning `setmetatable({}, myObject)` after setting it up, methods as `function myObject:DoThing()`.
- **Forward declarations** (`local Foo, Bar`) at the top of the relevant scope, not of the file unless necessary.
- Lazy tables with `or {}` (`self.Children = self.Children or {}`); strings joined with `..`; WoW API called directly, no wrappers unless needed, never overridden.

## Work items and GitHub

- Every issue, feature and fix goes through `krowi:process-issue` before any work on it, with this repo's steps from `docs/sdlc-playbook.md`; review policy: `REVIEW.md`. The maintainer holds every gate. A bug fix is built test first (`.claude/rules/tests.md`). Merge only when the maintainer says so, with a merge commit (`gh pr merge <n> --merge`); never push work-item commits straight to `main`, never release on your own.
- Gate log: enrolled. Every work folder keeps a `gates.md` with a row per gate answer; which gates ask is the kit's `skills/process-issue/gates.md`.
- Conventional Commits with a custom `data:` type: `data(midnight): add 12.1.0 achievements (23)`, `fix(retail): ...`, `locale(enUS): ...`; the type and scope tables are in `CONTRIBUTING.md`.
- `gh` calls run without asking first, reads and writes alike (view, comment, close, label, create a PR against `TheKrowi/Krowi_AchievementFilter`); merging is not among them. When the fix for a reported issue is on `main` (the maintainer merged its PR, or committed it there), close the issue as completed with a one-line comment naming the commit and when it ships, the way the maintainer's own closing comments read; when a PR's `Closes #N` already closed it, add only the comment.

## Subagents and skills

- `data-verifier` (`.claude/agents/`) checks achievement ids against both game builds and runs the headless pipeline: delegate to it before calling any data line dead.
- `krowi:taint-reviewer` uses the changelog's dev notes and the work folders' root causes as case law.
- `Explore` subagents cannot reach `localhost:5000`: do game-database lookups from the main agent.
- Data work runs under `add-achievement-data`, `add-category-data`, `add-zone-data`, `verify-achievement-data`, `migrate-to-shared` and `sync-mapverifier` (`.claude/skills/`), never improvised; their rules: `.claude/rules/data.md`.

## Releasing

Only through `krowi:release`. This repo's facts for it: the release branch is `main`; uploads are `--stability stable`; the addon manager's release commit includes `.vscode/settings.json`, which is accepted here. What the release gate needs: `.claude/rules/release.md`.

## Where things are

- `.claude/tools/README.md`: every tool and lint rule, the headless pipeline, deploy targets, the data-verification scripts. `Tests/README.md`: each suite, the in-game runner, the matrix.
- `docs/architecture.md`: load order, root files, directories, file map, data chunk execution, external references. `docs/obtainability.md`, `docs/zone-decisions.md`, `docs/how-to/`.
- `docs/work/<id>-<slug>/`: one folder per work item. `docs/backlog.md`: follow-ups not yet a work item. `docs/codebase-analysis.md`: known debt, whose priority table carries each item's status (check it before trusting the prose). `docs/harness-roadmap.md`: the tooling's steps.
- `raw/MapVerifier.csv` is the canonical Map Verifier state (`sync-mapverifier`, `mapverifier` rule); `raw/ZoneDataDecisions.md` tracks the highest achievement id analysed for zone coverage.
- None of `docs/`, `raw/`, `.claude/` or any `.md` file ships: the release zip skips them.