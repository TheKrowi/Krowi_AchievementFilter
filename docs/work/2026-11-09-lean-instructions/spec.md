# Spec: one lean instruction file
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. `.github/copilot-instructions.md` is deleted, and `CLAUDE.md` no longer imports it.
2. `CLAUDE.md` is the only instruction file that always loads. It holds what Claude needs on most tasks and cannot read from the repo, in at most about 200 lines and 16 KB.
3. A rule needed only in one area of the code lives in `.claude/rules/<area>.md`, with `paths:` naming that area's files. No rule file goes over 8 KB.
4. Every statement of the two old files has a destination in the inventory below. "Already in" means the named file says the same; "drop" gives a reason. Krowi's dated decisions keep their dates.
5. Every repo file that points to the old file points to its new home. Work folders are history and keep theirs.
6. A new `instruction-size` lint rule warns when `CLAUDE.md` or a rule file passes its budget.
7. A fresh session's start context falls by about 8k tokens (`Measure-Sessions.ps1`), and the path rules load when their files are read (the `InstructionsLoaded` hook while testing).
8. Every path and command named in the new files exists.

## Design
What Claude Code does, from its documentation (code.claude.com/docs/en/memory, sub-agents, hooks; checked 2026-11-09):
- An `@` import is expanded at launch, so it saves nothing.
- A rule without `paths` loads at launch, like `CLAUDE.md`.
- A rule with `paths` loads when Claude reads or edits a matching file with Read, Write or Edit, or with `cat`/`head`; Grep alone does not load it. It stays loaded until a compaction and comes back on the next touch. Globs are relative to the repo root, and brace lists work.
- Subagents load `CLAUDE.md` and the rules without `paths`; Explore and Plan skip `CLAUDE.md`.
- The guidance: under 200 lines per file, only facts needed in every session; procedures go in skills; rules for one part of the code go in path rules; enforcement belongs in hooks.

So the layers are:

| Layer | Loads | Holds |
|---|---|---|
| Workspace `CLAUDE.md` (the kit's `WowAddons.md`) | always | what holds in every Krowi repo; unchanged here |
| `CLAUDE.md` | always | the addon in five lines; the commands that check work; rules for any code edit (boot phases, namespaces, `Files.xml`, client flags, taint and globals, background jobs, saved variables, code style); the work-item and `gh` lines; pointers |
| `.claude/rules/data.md` | `DataAddons/**`, `Api/**`, `Data/**`, `.claude/skills/**`, `raw/**` | the data pipeline, one place per id, anchors, drops, V2 only, category ids, snapshots, the lookup-script rule |
| `.claude/rules/events.md` | event files (data, runtime, reminder GUI, their suites) | Krowi's event-source policy (2026-10-21) |
| `.claude/rules/features.md` | `Features/**`, `Features.lua`, `Slots.lua` | the boundary and what every feature PR proves |
| `.claude/rules/localization.md` | `Localization/**` | the file layout, where new strings go, the variant files |
| `.claude/rules/tests.md` | `Tests/**`, `.claude/tools/headless/**` | `Recorded`/`Target`, the headless model, the stubs |
| `.claude/rules/release.md` | `_Packaging/**`, `.claude/release-gate.ps1`, `Options/Window/Changelog.lua` | what the release gate needs |
| `docs/architecture.md` | on demand | the load order, the root files, the key directories, external references |
| skills, `Tests/README.md`, `.claude/tools/README.md` | on demand | unchanged; already hold the formats, the suites and the tools |

The rules a code edit anywhere can break (taint, globals, background jobs, `Files.xml`, boot phases) stay in `CLAUDE.md`, because a path rule loads only after a matching file is read. The krowi:release skill reads the upload stability from `CLAUDE.md`, so that line stays there.

### Inventory
Destination keys: **C** `CLAUDE.md`; **data**, **events**, **features**, **loc**, **tests** and **release** are the rule files; **A** `docs/architecture.md`; **W** the workspace file (already there); **T** `.claude/tools/README.md` (already there); **TR** `Tests/README.md` (already there); **S** the data skills (already there).

`copilot-instructions.md`:

| Section | Statement | To |
|---|---|---|
| intro | canonical file, imports, lifecycle pointer | drop: replaced by this structure |
| Project Summary | what KAF is, prefix, acronym, tabs, record counts, Retail and Classic from one tree, Lua 5.1 + XML, client-only runtime, license | C (5 lines; file counts dropped, they go stale) |
| Build & Validation | no build step, linter, test framework or CI; never invent luacheck, busted, Makefile, Actions | C |
| | packaging by the addon manager through `krowi:release` | W |
| | the kit's tools, `KitPath.ps1`, running without the kit | T; a one-line pointer in C |
| | Deploy with `-WhatIf`; fsdeploy on save | W; fsdeploy dropped (uninstalled 2026-10-21, W) |
| | `/reload`, `/luaerror`, BugSack | W |
| | language server, `.luarc.json`, `diagnostics.globals` only for what no annotation covers, sorted, `luarc` rule | T (Language server section); a one-line pointer in C |
| | validation without the client: follow patterns, `Files.xml`, `.toc` saved variables, XML template names in sync with Lua | C |
| Offline tooling | Lua 5.1.5 from the kit, never one on PATH | W |
| | command block | C keeps the repo's own commands (`Check-Repo`, `Show-Achievement`, headless load, one suite, `Run-GameTests`, `Read-GameTests`); the kit's are in W |
| | repo lint: what it checks; exceptions in `Check-Repo.ignore` with a comment | T; the exception line in C |
| | data snapshots: what they record, `-write`, commit the diff with its cause | data; T |
| | headless pipeline: only `Both` cross-checks Shared; extend the stubs in `runClient` for a new load-time global | tests; T |
| | the scenario suites, `Recorded`/`Target`, the list | TR (Suites, Recorded and Target); tests keeps the meaning |
| | which suites to run (Krowi, 2026-11-07; green, 2026-11-08) | C (applies to all work); TR |
| | closing the loop: deploy, reload, readers, saved variables on reload, screenshots, tga warning | W; KAF's own readers in C; the tga warning is in the tool's output |
| | Blizzard UI source clones, grep before the web, never run anything | W |
| Data-verification scripts | server, start script, skills, `API.md` | data (pointer); S |
| | lookup scripts: parameters or placeholder reset, build never typed, `-Client Classic`, `KAF_RETAIL_PRODUCT=wowxptr`, never inline queries, lint and guard | data, in full |
| Load order | the 13 steps, `AllowLoadGameType` | A |
| | a file uses only what earlier files define; a new `.lua` not in `Files.xml` never loads | C |
| | the client flags; `IsModern` against `IsMainline`; every `MenuBuilder:New` passes `modern`; old `not IsClassicWithAchievements` code; `util-flags` rule; not on Forever yet | C |
| Root files, Key directories | tables | A (merged with its file map) |
| | do not edit `Libs/` unless asked; fixes upstream | C (one line; W says the same for libraries) |
| Two namespaces | `addon` private, `KrowiAF` public, `KROWI_LIBMAN`; data files write only `KrowiAF.*`, runtime reads `addon.Data.*` | C |
| Three-phase boot | the three phases; Blizzard frames only in phase 2; `addon.Data.Achievements` empty until phase 3; `PostLoadOnPlayerLogin`/`PostBuildCache` | C |
| Features | registry, switches after a reload, slots | C (two lines); A |
| | the boundary and the feature PR's proofs | features; A |
| Data pipeline | bare tables, duplicate id asserts, one place per id, Classic-only never to Shared | data |
| | anchors name the Retail patch, `ContentTimeline`, resolve on Retail, never rounded | data; `docs/obtainability.md` |
| | a drop is a defect, `LoadDiagnostics` `Report`, headless fails on an unreported one | data (paths include `Api/**`, `Data/**`, where drop sites live) |
| | per-expansion file kinds; `ZoneData` one per expansion; guide coordinates from `/kafwhere` | data |
| Objects and filters | `Achievement` fields, `TemporaryObtainable`, `AddSeasonData` | A |
| | `Filters.Validate` returns a signed integer | C |
| Event reminders | the whole policy (Krowi, 2026-10-21) and its work folders | events, verbatim |
| Taint | the recurring class; never override Blizzard API; the only global writes; `Check-Repo.globals`; `globals` rule; secret-value APIs; `TaintDiagnostics`, `DebugEnabled` | C, condensed; the general rules are W |
| Background jobs | definition, why, the four rules, measured, listed | C, condensed, all rules kept |
| Saved variables | the list | drop: the `.toc` holds it |
| | a new one is declared in the `.toc`; migrations as numbered `DataIntegrityManager` solutions | C |
| Localization | layout, new strings below `Exported at`, every locale, renamed keys keep translations, Plugins and Wrath variants, guide | loc; the general rule is W |
| Achievement data format | header, key `EE_PP_SS`, `_S`, derived patch, examples | S (`add-achievement-data`) |
| | all first-party data is V2; the V1 parser stays as the plugin entry point | data; S |
| Category data format | builder samples | S (`add-category-data` REFERENCE) |
| | `:Merge()` written out; `:WithId` ids never change; auto ids never relied on or persisted; `:Key` for new attach points; snapshots unchanged or diff committed | data; S |
| Steps for adding achievements | the five steps | S, `docs/how-to/add-patch-achievements.md`; data keeps step 4's `ContentTimeline` and `BuildVersionData` triggers and step 5's snapshot review |
| Code Style | encoding and endings (hook and lint) | drop: the post-edit hook and the `bom`/`line-endings` rules enforce them |
| | editing tools | W |
| | header, no banner, `_`; no semicolons; naming; module, OOP, forward declarations, `or {}`; `..`; API used directly, never overridden; globals | C, as rules with one-line patterns |
| Work-Item Lifecycle | folder, gates, test-first, `REVIEW.md`, write-back | C (three lines); `docs/sdlc-playbook.md`; the kit's skill |
| Git Workflow | worktrees, `main`, release commits | W |
| | Conventional Commits with `data(<scope>):` and the scope tables | C (one line); `CONTRIBUTING.md` |
| | changelog style, no agent dev notes | W |
| | PR checklist | the template itself |
| | `gh` calls without asking; closing an issue with a one-line comment naming the commit and the ship version; merging not among them | C |
| Where non-code material lives | the document map | C, as a compact pointer list |
| External resources | web references | A; the local clone is W |
| Trust these instructions | | drop |

`CLAUDE.md` today:

| Statement | To |
|---|---|
| import line and preamble | drop |
| the guard's and post-edit hook's behaviour | drop: each explains itself when it fires; a hook fix is a kit change (W) |
| Stop hook: fix, or add a commented exception | C |
| kit helpers, `KROWI_CLAUDEKIT` | T |
| `worktree.baseRef`, Claude Code worktrees without `Libs/` | W |
| after a worktree switch the Stop hook lints the cwd's checkout; the guard maps worktree paths | C (one line) |
| extend the harness, no dependencies | W |
| `data-verifier` before calling a data line dead; `krowi:taint-reviewer` after GUI or API changes; Explore cannot reach `localhost:5000` | C |
| the data skills | C (one line); data |
| `krowi:process-issue` before any issue work; gates with the recommendation first; `plan.md` in plan mode | the skill; C keeps the first |
| `Gate log: enrolled` | C, verbatim (the guard reads it) |
| releasing: `main`, `--stability stable`, `.vscode/settings.json` in the release commit | C (the release skill reads the stability there) |
| the release gate's list | release; `.claude/release-gate.ps1` enforces it |
| update the headless model when a run differs, before releasing | tests; release |

### Stale lines found while mapping
- fsdeploy on save: the extension was uninstalled on 2026-10-21; the line goes.
- "Agent (Claude Code, Copilot)" in the playbook: only Claude now.
- Contributor fallbacks ("without the kit, a contributor") are kept where a tool prints them, and dropped from the instructions.

## Options considered
1. **Recommended: `CLAUDE.md` plus six path rules, with layout to `architecture.md`.** This follows the documented loading. The always-loaded part shrinks from about 12k tokens to about 4k, and each rule costs tokens only in sessions that touch its area.
2. **`CLAUDE.md` alone, trimmed to about 6k, without path rules.** Simpler, with one file to keep. But the data, event and test detail would load on every GUI task, and the file would grow back with each lesson.
3. **Keep the file, delete only the duplicates.** About 3k saved; the Copilot name and the stage-6 growth stay.

## Areas of concern
- **Taint and secret values:** no code changes. The taint rules stay in `CLAUDE.md`, since any code edit can break them.
- **Clients, Blizzard API, other addons, saved variables, localization, libraries, data snapshots:** no code or data changes.
- **Player-facing text:** none.
- **Harness:** the repo lint gains a rule, and three lint messages and the Stop hook's message change text. The kit's `Gates.ps1` treats `.claude/rules/` as support files, so a lesson later written back as a changed line in one would count as `harness`, not ride along as `CLAUDE.md` does. The kit's `Gates.ps1` changes in this work item (Decision).
- **Instructions followed worse:** a rule that moves to a path rule loads only after a matching file is read. The inventory keeps every rule needed before such a read in `CLAUDE.md`.

## Verification
- Requirement 4: a fresh subagent, given the old files and the new set, lists every statement of the old ones that the new set, the skills and the named docs do not hold. Each finding is fixed or answered in the PR.
- Requirement 8: a script checks every backticked path in the new files and rules against the tree.
- Requirement 6: `Check-Repo.ps1` is green, with the new rule's case tested by a temporary oversized copy.
- Requirement 7: an `InstructionsLoaded` hook in a scratch session records which rule loads on a Read of `DataAddons/...`, `Localization/...` and `Tests/...`. `Measure-Sessions.ps1` gives the first sessions' start context after the merge.

## Decision
2026-11-09, Krowi: option 1, `CLAUDE.md` plus six path rules. Scope: both now. The kit's `Gates.ps1` gets `.claude/rules/` counted as instruction files in a kit PR within this work item, merged before or with this one.