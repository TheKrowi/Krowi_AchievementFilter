# Plan: The kit is the one home of the addon tooling
Intent: [intent.md](intent.md), spec: [spec.md](spec.md). Status: accepted

## Context
- Krowi_AchievementFilter (AF) and Krowi_ClaudeKit each carry a copy of the same Claude Code tooling, and the shared files have drifted since the split on 2026-10-14.
- Krowi decided on 2026-10-16:
  - the kit is the one home of every reusable piece, and every repo uses it, AF included;
  - what is specific to a repo stays there;
  - AF's better versions win;
  - contributors losing the harness is accepted.
- This plan moves AF's reusable pieces into the kit (merged with the kit's versions), makes AF a consumer of the `krowi` plugin, and repoints what stays.

Facts the plan rests on (read 2026-10-16):
- The kit plugin loads in place from the kit's **main checkout**, so anything committed there is live for every repo at its next session start.
- The kit's git hooks run `Publish-WorkspaceClaudeMd.ps1` on checkout and commit. That script, and every kit tool, take the workspace folder from `$PSScriptRoot` (`AddonContext.ps1:12-13`), which is wrong inside a kit worktree (it would write `<kit>\.claude\worktrees\CLAUDE.md`).
- AF's Lua lint rules skip silently without `lua.exe` (`Check-Repo.ps1:313-337, 629-688`).
- AF's Stop hook turns any exception from the lint into exit 0 (`Check-RepoOnStop.ps1:34-36`).
- 18 AF scripts dot-source `Get-WowBuilds.ps1` by a path relative to themselves.
- The kit's work-item templates carry exactly the headings AF's `work-items` lint checks (`Check-Repo.ps1:728-732`).
- `anthropic-skills:grill-me` (Krowi's synced skills) has the same text as AF's `grill-me`.

## Files that change

### Kit, in a worktree `chore/2026-10-16-achievementfilter-opt-in`
**First commit (makes the worktree safe):**
- `tools/AddonContext.ps1`:
  - `$DevRoot` becomes the parent of the kit's main checkout (`git -C $PSScriptRoot rev-parse --path-format=absolute --git-common-dir`), so it is right from any worktree;
  - it adds `$Luac`.
- `tools/Publish-WorkspaceClaudeMd.ps1` returns without writing unless it runs in the kit's main checkout (`--git-dir` equals `--git-common-dir`), so a worktree commit never republishes the workspace `CLAUDE.md`.

**Shared tools from AF:**
- `tools/Find-Symbol.ps1` and `tools/Strip-Semicolons.ps1` take the repo from `Get-AddonRepo`/`-Repo`, and Lua from `$Lua`/`$Luac`. They keep every AF parameter (`-List`, `-Defs`, `-DryRun`, `-Path`).
- `tools/Get-WowBuilds.ps1` stays a function-only file: no `AddonContext`, no param block, `KAF_RETAIL_PRODUCT` unchanged. It is dot-sourced into 18 AF scripts.
- `tools/lua51/find-symbol.lua` and `strip-semicolons.lua`, unchanged.
- `tools/lua51/README.md:12` stops naming AF's folder.

**New `tools/DeprecatedApi.ps1`:** the shared classifier.
- Functions: `Get-UiSourceBranch`, `Get-TocBranches`, `Get-BranchGames`, `Get-CloneVersion`, `Test-DeprecationFile`, `Test-VariantLoads`, `Read-DeprecatedAliases`, `Read-CloneApi`, `Get-ApiState`.
- **The caller passes the clone list,** so AF's writer reads only its target clones and the kit's scanner keeps reading all of them.
- AF's fixes go in: `loadDeprecationFallbacks` files, deterministic sort, the Interface map with `forever`, `forever` loading every variant.
- `tools/Find-DeprecatedApi.ps1` is rebuilt on it, keeps `-Branch 'live'` as its default, and keeps its luac scan and report. Its help drops "ported both ways" (:20, :72, :139).

**Guard tests:** `tests/Test-GuardToolUse.ps1` cases may carry `Input` (a `tool_input` hashtable) and `Expect` (`deny`, `ask` or `allow`). The new cases use a scratch repo in `$env:TEMP`:
- an Edit under `Libs/` asks;
- an `L[...]` line added above `AUTOGENTOKEN` in `Localization/x.lua` is denied;
- the same line below the marker, and a Write elsewhere, are allowed.

`hooks/Guard-ToolUse.ps1` is unchanged.

**`agents/taint-reviewer.md`:**
- `version.txt`, FrameXML and SharedXML, the per-flavour variant folders (Mists loads `Cata/`), `classic_titan` among the clones;
- the five ketho annotation subpaths.

**Release:**
- `skills/release/Check-ReleaseReady.ps1` runs `. <repo>\.claude\release-gate.ps1` after the TOC section (around :171) when it exists, and prints "Repo gate: none" otherwise.
- `SKILL.md` describes the repo gate and drops "a repo with its own release skill uses that one" (:3, :101).

**`skills/process-issue/SKILL.md`:**
- AF's generic steps: `createdAt`, the webp screenshot download, plan mode for `plan.md`, `Closes #N` not firing on a non-default branch, merge commit never squash, pull after the merge;
- drop "AF's process-issue is the upstream" (:3, :6).

**`templates/spec.md`:**
- the union of both areas-of-concern lists (adds plugins, Retail and Classic named, data snapshots where the repo has them) and the scenario form under Verification;
- headings unchanged.

**Docs (first merge):** `README.md` tools rows and provenance (:90), and the "The kit's tools" block in `WowAddons.md` (:77-87) gains `Find-Symbol`, `Strip-Semicolons` and `Get-WowBuilds`.

**Docs (second merge, after AF's PR merges):**
- `WowAddons.md` :60, :64, :89: AF uses the plugin, and the porting rule goes;
- `README.md` :45: AF opted in;
- kit `CLAUDE.md` :7.

### AF, in this worktree `feature/2026-10-16-single-tooling-home`
**New `.claude/tools/KitPath.ps1`:**
- It sets only `$KitRoot`, `$KitTools`, `$KitLua` and `$KitLuac`; the prefixed names avoid clobbering the callers' `$root`, `$repo` and `$lua`.
- `$KitRoot` is `$env:KROWI_CLAUDEKIT` when set (test override), else `Krowi_ClaudeKit` next to AF's main checkout, through `git -C $PSScriptRoot rev-parse --path-format=absolute --git-common-dir`.
- It throws "Krowi_ClaudeKit not found at <path>: this repo's Claude Code tooling is the maintainer's and lives there" when the kit or `lua.exe` is missing.

**New `.claude/release-gate.ps1`:** AF's escape-suite gate (today `skills/release/Check-ReleaseReady.ps1:100-136`). It reads the Interface line itself, and the saved variables via `Get-ClientFolder Retail|Ptr|Xptr`.

**`.claude/tools/Check-Repo.ps1`:**
- dot-sources `KitPath.ps1` inside `try`; on failure it prints the message as an Error and exits 1, so the Stop hook hands it back (exit 2) instead of swallowing it;
- Lua, luac and `check-syntax.lua` come from the kit (:313-337);
- the messages and comments at :61, :453, :519, :712, :720, :734, :753, :760 name the kit.

**Other staying scripts:**
- `Read-GameTests.ps1` (:4, :49-52) and `Update-DeprecatedApi.ps1` (help :25-37, :87; the header :201 names the kit's `Update-UiSource.ps1`) use `KitPath.ps1`. The writer keeps its target list, the `removed-api` skip, the carry-over and the output; the classification comes from `DeprecatedApi.ps1`.
- The 13 lookup scripts, `_evaluate_coverage.ps1` and the four `raw/*.ps1` change their `Get-WowBuilds.ps1` dot-source to `. <…>\.claude\tools\KitPath.ps1` plus `. "$KitTools\Get-WowBuilds.ps1"`.

**`.claude/settings.json`:**
- the marketplace and `enabledPlugins` as in Krowi_Vendorer;
- PreToolUse and PostToolUse go, Stop stays;
- `additionalDirectories` adds the **absolute** kit path (a relative one resolves wrongly from worktree sessions);
- allow rules for moved tools use the kit's full literal path (`Read-GameErrors`, `Read-GameScreenshot`, `Deploy -WhatIf`, `Check-ReleaseReady`, `Get-WowBuilds`, `Find-Symbol`, `lua.exe` with `load-data`, `run-tests`, both snapshots and `check-syntax`); the Bash `lua51`/`Check-LuaSyntax` rules are rewritten or dropped.

**Documents.** The pattern: a shared tool is written as `& "E:\World of Warcraft Addon Development\Krowi_ClaudeKit\tools\<X>.ps1"`, and shared skills and agents as `krowi:release`, `krowi:process-issue`, `krowi:taint-reviewer`. Files:
- `CLAUDE.md`, all of it:
  - the wiring, Subagents and Skills sections, and ":13 reuse the vendored Lua";
  - plus the release conventions the deleted skill held: release branch `dev`, `--stability stable` (the line the kit preflight reads), the addon manager committing `.vscode/settings.json`.
- `.github/copilot-instructions.md`; its :306 pointer to the README's "Parallel sessions" moves to the kit README.
- `.claude/tools/README.md`, shrunk to AF's tools and lint rules plus a pointer to the kit README.
- `CONTRIBUTING.md` (the harness is the maintainer's), `REVIEW.md`, `Tests/README.md`, the comments in `Tests/Tests.lua` and `headless/read-runs.lua`.
- `docs/sdlc-playbook.md` (only what is specific to AF, plus the kit skill), `docs/harness-roadmap.md`, `docs/how-to/migrate-category-data.md`, `docs/codebase-analysis.md`, `docs/data-design-review.md`.
- The data skills' `SKILL.md` and `API.md`, `agents/data-verifier.md`.

**Removed (the last AF commit):**
- `.claude/hooks/Guard-ToolUse.ps1`, `Test-GuardToolUse.ps1`, `Check-LuaSyntax.ps1`;
- `.claude/tools/Deploy.ps1`, `Read-GameErrors.ps1`, `Read-GameScreenshot.ps1`, `Update-UiSource.ps1`, `New-Worktree.ps1`, `Remove-Worktree.ps1`, `Find-Symbol.ps1`, `Strip-Semicolons.ps1`, `Get-WowBuilds.ps1`;
- `.claude/tools/lua51/`, `headless/read-errors.lua`;
- `.claude/agents/taint-reviewer.md`, `.claude/skills/release/`, `process-issue/`, `grill-me/`;
- `docs/work/_template/`.

**The work folder:**
- `spec.md`: `grill-me` is covered by the synced `anthropic-skills:grill-me`; the `KROWI_CLAUDEKIT` override;
- `plan.md` (this plan, kept current).

## Order of work
0. **Baseline, before any change,** into the scratchpad:
   - in the AF worktree:
     - `Check-Repo.ps1` (finding count per rule), the headless `Both`, all eight suites, both snapshot scripts without `-write`;
     - `Deploy -WhatIf` Retail and Classic;
     - `Read-GameErrors`, `Read-GameTests`, `Read-GameScreenshot`, `Check-ReleaseReady`;
     - `Find-Symbol addon.Gui.Search`, `Strip-Semicolons -DryRun`;
     - `Update-DeprecatedApi` into a scratch copy;
   - the kit's `Find-DeprecatedApi -Branch live` and `-Branch classic` on AF, Krowi_Vendorer and Krowi_ExtendedVendorUI;
   - the kit's `Deploy -WhatIf` and `Check-ReleaseReady` from Krowi_Vendorer;
   - `git worktree list` of AF, and which sessions run where (`ListAgents`).
1. **Kit worktree:**
   - `git -C <kit> -c core.hooksPath=.no-hooks worktree add -b chore/2026-10-16-achievementfilter-opt-in <kit>\.claude\worktrees\chore-2026-10-16-achievementfilter-opt-in main`;
   - the hooks are off for this one command only, because the kit's post-checkout hook would otherwise write the stray `CLAUDE.md`;
   - the kit has no submodules or local settings, so `New-Worktree.ps1` would add nothing;
   - its first commit is the `AddonContext`/`Publish` fix, after which the worktree's own hooks are harmless.
2. **Kit commits,** one per concern, each message naming what was ported from AF: the safety fix; shared tools; `DeprecatedApi.ps1` with `Find-DeprecatedApi.ps1`; guard tests; taint-reviewer; release gate; process-issue and templates; docs (first set).
3. **Prove the kit worktree** (Proof, Kit).
4. **AF commits:**
   - `KitPath.ps1` with the repointed staying scripts and `Check-Repo.ps1`;
   - `release-gate.ps1`;
   - `settings.json`;
   - documents;
   - removals last.
   - While testing, `$env:KROWI_CLAUDEKIT` is the kit worktree.
5. **Prove AF** (Proof, AF), calling every shared tool by the **kit worktree's** path, never the documented main path.
6. **Gate, Krowi.** Evidence, then the go to fast-forward the kit's `main` to the worktree branch and push. From then on every repo's sessions get the merged kit at their next start. Re-run the AF proofs once with `KROWI_CLAUDEKIT` unset, from the worktree and from a scratch clone placed next to the kit.
7. **AF PR:**
   - set the work files to done;
   - push, PR against `dev`;
   - `/code-review` (REVIEW.md; `taint-reviewer` does not apply: no addon code).
   - **Gate:** Krowi merges with a merge commit.
8. **After the AF merge:**
   - pull `dev` in the main checkout;
   - the second kit commit (docs) and push on Krowi's go;
   - remove both worktrees;
   - Krowi restarts the sessions whose hooks came from AF's main checkout (`krowi-achievementfilter-f7`, and any in the worktrees `fix-2026-10-14-guide-row-npc-name` and `fix-337-handynotes-categories`, whose branches are checked for the removed files);
   - update the auto memory.

## Risks
- **A lint that passes because it skipped:**
  - `KitPath.ps1` throws, Check-Repo turns that into exit 1, and the Stop hook into exit 2;
  - the proof compares the finding count per rule with the baseline and plants a bogus `KROWI_CLAUDEKIT`.
- **Testing the wrong copy:**
  - `KROWI_CLAUDEKIT` covers only AF's staying scripts;
  - every shared tool is invoked by the kit worktree's path;
  - the listing proof checks a worktree-only text change.
- **The deprecated-API refactor:**
  - AF's list must regenerate identical except header line 3, which now names the kit;
  - `Find-DeprecatedApi` keeps its default, and on other repos it differs from the baseline only through AF's fixes, each named in the commit.
- **What step 6 sends to every repo:**
  - the `AddonContext`/`Publish` fix;
  - three new tools;
  - the classifier with AF's fixes;
  - a no-op release-gate call;
  - process-issue, template and taint-reviewer text.
  - Krowi_ExtendedVendorUI's PR #89 and its session are not touched.
- **Sessions on AF's main checkout** lose their guard after `dev` is pulled. A missing hook script is a non-blocking error, so they run unguarded until they restart; Krowi is told which.
- **Headless runs in an untrusted folder** may not run plugin hooks. The hooks are proven by piped payloads, and the headless run proves the listing.
- **Permission prompts:** a command with `$kit` does not match a literal allow rule, so documents write the literal path.
- **The first AF release under the kit's skill:** the preflight is proven now, the package path only at release.

## Proof
**Kit:**
- `pwsh -NoProfile -File tests\Test-GuardToolUse.ps1`: old and new cases pass;
- `claude plugin validate .`;
- a commit in the worktree leaves the workspace `CLAUDE.md` byte-identical and writes no `<kit>\.claude\worktrees\CLAUDE.md`;
- `Find-DeprecatedApi -Branch live|classic` on the three repos matches the baseline, or each difference is a named AF fix;
- from Krowi_Vendorer, the worktree's `Deploy -WhatIf` and `Check-ReleaseReady` match the baseline (`Repo gate: none` added).

**AF,** with `KROWI_CLAUDEKIT` set to the kit worktree, and shared tools called by the kit worktree's path:
- `Check-Repo.ps1` whole tree: 0 errors and the same finding count per rule as the baseline;
- the headless `Both` and all eight suites pass, and the snapshots report no change;
- `Update-DeprecatedApi`: the list is identical except header line 3;
- `Deploy -WhatIf` Retail and Classic: the same plan;
- `Read-GameErrors`, `Read-GameTests`, `Read-GameScreenshot`: the same output;
- `Check-ReleaseReady`: the same verdicts plus the escape-gate line. The location and branch failures are expected from a worktree;
- `Find-Symbol` and `Strip-Semicolons -DryRun`: the same output;
- a lookup script runs past `Get-WowBuilds`;
- with `KROWI_CLAUDEKIT` set to a bogus folder: Check-Repo exits 1 with the kit message, and a piped Stop payload exits 2.

**Hooks:** payloads piped into the kit worktree's hooks, with `cwd` and `CLAUDE_PROJECT_DIR` on the AF worktree:
- `sed -i` is denied;
- a `Libs/` Edit asks;
- a planted Lua syntax error is reported.

**Listing:** a headless `claude.exe -p` in the AF worktree with `--plugin-dir <kit worktree>`, and `--settings` on a scratch file that disables `krowi@krowi-claudekit`:
- each of `krowi:release`, `krowi:process-issue`, `krowi:taint-reviewer` appears exactly once;
- the release description has lost its "own release skill" sentence (proving the worktree copy loaded);
- the six data skills and `data-verifier` appear under bare names, and there is no unprefixed `release`, `process-issue`, `taint-reviewer` or `grill-me`.

**Names:**
- `git grep` in AF for the removed paths, and for bare `taint-reviewer`, `process-issue`, `release` skill, `Deploy.ps1`, `Read-GameErrors`, `lua51` not preceded by the kit path or `krowi:`, finds only `docs/work/` history;
- the kit templates' headings still equal `Check-Repo.ps1:728-732`.

**No in-game check:** the addon does not change.

## Departures and results (2026-10-17)
**Departures from the plan:**
- **`docs/sdlc-playbook.md` stays whole.** It is the contributors' description of the lifecycle, not tooling, so only its tool and skill references changed. Folding its generic stages into the kit's skill is left for a later decision.
- **`.claude/settings.json`:**
  - `../wow-ui-source/` also became absolute, for the same reason as the kit path;
  - the Bash forms of the `lua51` allow rules were dropped rather than rewritten.
- **The kit's `Find-DeprecatedApi.ps1`** now reads every clone in full through the shared reader (about 6 s for six clones), because a file can count as deprecated by its text.
- **Tests:** `Tests/Tests.lua` changed one comment (the release gate's path). The `changelog` rule therefore warns on this branch; there is no player-visible change, so there is no changelog line.
- **Kit `main` moved before the branch:** another session's docs commit `063c571`. The branch starts from it, and `main` had not moved again at the gate.

**Results** against the baseline taken before any change:
- **Identical:**
  - the headless `Both`, all eight suites and both snapshots;
  - `Strip-Semicolons -DryRun`;
  - `Find-DeprecatedApi` live and classic on this repo, Krowi_Vendorer and Krowi_ExtendedVendorUI;
  - Vendorer's `Deploy -WhatIf`;
  - `Check-Repo` (the same 24 sections, timings within noise, 0 findings).
- **Expected differences:**
  - `Deploy -WhatIf` now prints the repo path, and the one extra file to copy is the changed `Tests/Tests.lua`;
  - the game readers differ only in relative times;
  - `Find-Symbol` differs only in run time;
  - the preflight adds the kit's checks and `Upload stability: stable (from CLAUDE.md)`, and the escape-gate line is unchanged;
  - Vendorer's preflight adds `Repo gate: none`;
  - `Update-DeprecatedApi` differs in header line 3 only.
- **Hooks:**
  - the guard tests pass 51/51 (8 new Edit/Write cases);
  - piped at this repo, `sed -i` is denied, a `Libs/` edit asks, a string above `AUTOGENTOKEN` in the real `enUS.lua` is denied, and a planted syntax error is reported (exit 2).
- **Without the kit:** Check-Repo exits 1 with the kit message and the Stop hook exits 2.
- **Listing:** the headless run lists `krowi:release`, `krowi:process-issue` and `krowi:taint-reviewer` once each, the data skills and `data-verifier` bare, and none of the removed names. The release description is the worktree's.
- **Not proven:** a lookup script reached `Get-WowBuilds`' HTTP call, but the game-database server was not running.