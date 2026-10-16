# Spec: The kit is the one home of the addon tooling
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Every reusable hook, tool, skill and agent exists once, in Krowi_ClaudeKit, and this repo keeps no copy of one.
   - **Reusable:**
     - the guard hook and its tests, the Lua syntax hook;
     - `Deploy`, `Read-GameErrors`, `Read-GameScreenshot`, `Update-UiSource`, `New-Worktree`, `Remove-Worktree`;
     - `Find-Symbol`, `Strip-Semicolons`, `Get-WowBuilds`, the deprecated-API classifier, the vendored Lua 5.1.5;
     - `taint-reviewer`, the release skill and preflight, `process-issue` and the work-item templates.
   - **Specific to this repo, staying here:**
     - the six data skills with their scripts, `data-verifier`;
     - `Check-Repo` with its lists and the Stop hook that runs it;
     - the headless pipeline with its snapshots, `Read-GameTests`, `Update-DeprecatedApi` (the writer of this repo's lint list), the escape-suite release gate;
     - `raw/`, `Tests/` and the documents.
2. This repo enables the kit's `krowi` plugin, as Krowi_Vendorer does. A session here lists each skill and agent once: the shared ones as `krowi:…`, this repo's under their bare names.
3. Everything that works here today still works, also from a worktree and in a headless run:
   - every skill and agent;
   - the guard, syntax and Stop hooks;
   - the repo lint, the headless pipeline and suites;
   - deploy and the game readers, the worktree tools, the release.
4. Each shared tool works on the repo of the current directory: run from Krowi_Vendorer it acts on Vendorer, run here it acts on this repo.
5. Every improvement either side made after the split on 2026-10-14 survives in the single version.
6. This repo's remaining tools find the kit's shared helpers (Lua, `Get-WowBuilds`, the classifier) at one place in the code, not by a path repeated in every script.
7. No document in this repo points at a tool path that no longer exists. `CONTRIBUTING.md` says the Claude Code harness is the maintainer's.
8. Sessions in the other repos keep working tooling throughout. The kit loads in place from its main checkout, so a kit change lands there only when it is complete and tested.
9. Nothing new reaches the AddOns folder or the release zip.

## Design
**This repo becomes a consumer of the `krowi` plugin, and its reusable pieces merge into the kit.**

What Claude Code allows (docs read 2026-10-16: plugins/loading, marketplace-reference, manifest-reference):
- a plugin from a local `directory` marketplace loads in place, and an edit takes effect at the next session start;
- a project skill `release` and a plugin skill `krowi:release` would both be listed, so this repo's copy has to go, not just be shadowed.

**Settings.** `.claude/settings.json` registers the kit marketplace and enables `krowi@krowi-claudekit`.
- Its PreToolUse and PostToolUse blocks go, because the plugin brings those hooks.
- Its Stop block stays: `Check-RepoOnStop.ps1` is this repo's.
- Allow rules for moved tools point at the kit; `../Krowi_ClaudeKit/` joins `additionalDirectories`.

**This repo's remaining tools reach the kit through one helper.**
- `.claude/tools/KitPath.ps1` (new, a few lines) is dot-sourced by `Check-Repo.ps1`, `Read-GameTests.ps1`, `Update-DeprecatedApi.ps1`, the data skills' scripts and `raw/` tooling.
- It finds the kit as `Krowi_ClaudeKit` next to this repo's main checkout (the parent of `git rev-parse --git-common-dir`), so it works from a worktree too. `$env:KROWI_CLAUDEKIT`, when set, points it at another kit checkout, for testing a kit worktree.
- It stops with one clear message when the kit is missing.
- Commands in the documents use `$kit`, as the workspace rules already do.

**What moves, and what goes:**

| This repo's file | Becomes | Notes |
|---|---|---|
| `hooks/Guard-ToolUse.ps1`, `Test-GuardToolUse.ps1`, `Check-LuaSyntax.ps1` | the kit's `hooks/` and `tests/` | merged |
| `tools/Deploy`, `Read-GameErrors`, `Read-GameScreenshot`, `Update-UiSource`, `New-Worktree`, `Remove-Worktree` | the kit's `tools/` | merged |
| `tools/lua51/` | the kit's `tools/lua51/` | same build; the kit gains `find-symbol.lua` and `strip-semicolons.lua` |
| `tools/Find-Symbol.ps1`, `Strip-Semicolons.ps1`, `Get-WowBuilds.ps1` | the kit's `tools/` (new there) | adopt `AddonContext.ps1`; this repo's name stays only in examples |
| the classification half of `tools/Update-DeprecatedApi.ps1` | the kit's `tools/DeprecatedApi.ps1`, used by `Find-DeprecatedApi.ps1` too | the writer of `Check-Repo.deprecated-api` stays here |
| `agents/taint-reviewer.md`, `skills/release/`, `skills/process-issue/` | the kit's | merged |
| the escape-suite gate in `skills/release/Check-ReleaseReady.ps1` | `.claude/release-gate.ps1` here | the kit's preflight runs `<repo>/.claude/release-gate.ps1` when a repo has one |
| `docs/work/_template/` | the kit's `skills/process-issue/templates/` | the union of both areas-of-concern lists |
| `skills/grill-me/` | removed | `anthropic-skills:grill-me`, synced from Krowi's claude.ai skills, has the same text |
| `tools/headless/read-errors.lua` | removed | identical to the kit's `lua51/read-errors.lua` |

**Process documents.**
- This repo uses the kit's `process-issue`, which defers to `docs/sdlc-playbook.md`.
- The playbook keeps what is specific here: scenarios test first, the `/kaftest` before-run, the data-skill exemption, `REVIEW.md`, `data-verifier`.
- Generic steps this repo's skill has and the kit's lacks are ported to the kit (see "Per-file merge").

**Documents.**
- These move to kit paths for the shared tools and the `$kit` Lua: `CLAUDE.md`, the instruction file, `.claude/tools/README.md`, `REVIEW.md`, `CONTRIBUTING.md`, `Tests/README.md`, `docs/how-to/` and the data skills' `SKILL.md` files.
- The shared tools' documentation goes to the kit README. `.claude/tools/README.md` keeps this repo's tools and lint rules.
- The kit's `WowAddons.md` drops "Krowi_AchievementFilter does not opt in" and the rule to port changes by hand.

**Order, so that no session is left without tooling:**
1. Merge the shared files in a kit worktree. This repo still uses its own copies meanwhile.
2. Prove the kit from this repo's worktree with a scratch settings file, and from Krowi_Vendorer.
3. Merge the kit to its `main`. The other repos get the merged fixes at their next session start.
4. Merge this repo's PR, which enables the plugin and removes its copies in one commit.

## Per-file merge
From a full read of both sides on 2026-10-16. "Kit" means the kit's version stays; this repo's goes.

| Piece | Single version | Ported onto it |
|---|---|---|
| Guard hook and its tests | Kit: repo root from `$CLAUDE_PROJECT_DIR` or the payload's `cwd`, repo-neutral messages; the 43 cases are the same on both sides | New Edit/Write cases (the `Libs/` ask, the `AUTOGENTOKEN` deny), which neither side tests. This repo's `Localization/Shared.lua` skip is a no-op and goes |
| Lua syntax hook | Kit (its matcher has `MultiEdit`) | none |
| `Deploy`, `Read-GameErrors`, `Read-GameScreenshot`, `Update-UiSource`, `New-Worktree`, `Remove-Worktree` | Kit: `-Repo`, the `.toc` name, 10 clients, the integration branch | This repo gains the kit's fixes: fonts and sounds deployed, empty-source refusal, the gitignore check, `-Into`. This repo's `Deploy.ps1` hardcodes its own name (`.claude/tools/Deploy.ps1:31,37`) and would mirror any other repo into `AddOns\Krowi_AchievementFilter` |
| `taint-reviewer` | Kit: repo-neutral, reads the repo's `CLAUDE.md` first, more case law (`C_*` namespaces, fields on Blizzard frames, widget-set tooltips) | This repo's ketho annotation subpaths and the Mists-loads-`Cata/` note. Its AchievementUI boot rule and `KrowiAF_` prefix come from this repo's instruction file, which the reviewer reads |
| Release skill and preflight | Kit: worktree refusal, libraries and LibStub minor, submodules, every `.toc` Interface line, host ids, mandatory dry-run zip, main session only | The repo-gate hook for this repo's escape gate. This repo's `CLAUDE.md` gains the `--stability stable` line the preflight reads |
| `process-issue` and templates | Kit: worktree per session, local wow-ui-source, `Find-DeprecatedApi`, Blizzard API and libraries as areas of concern | This repo's generic steps: screenshots as webp, `createdAt`, plan mode for `plan.md`, `Closes #N` not firing on `dev`, merge commit never squash, pull after the merge. The template's areas of concern add Retail and Classic, plugins and skins, data snapshots |
| Deprecated-API classification | One classifier in the kit | From this repo: files guarded by `loadDeprecationFallbacks`, other-game variants, deterministic sort, the Interface map with `forever`, names whose file Blizzard deleted. From the kit: ptr and beta branches, aliases from every clone. This repo's `Check-Repo.deprecated-api` must regenerate byte-identical, or its diff is reviewed |
| `lua51/` | Same build on both sides | union of the helper scripts |

Each file keeps the line-ending convention of the repo it ends up in.

## Options considered
- **A. Reusable pieces to the kit, this repo's specific pieces stay, this repo enables `krowi` (chosen).** One copy of everything reusable. A data or scenario change stays one commit in one repo.
- **B. This repo hosts the plugin and the kit is retired** (first draft). Rejected by Krowi on 2026-10-16: every repo uses the kit.
- **C. Everything to the kit, in a second plugin only this repo enables** (second draft). Rejected by Krowi on 2026-10-16: specific pieces stay in their repo. It would also have split every new scenario, load stub or snapshot change across two repos.
- **D. Keep both copies with a drift check** (first suggestion). Rejected by Krowi on 2026-10-16: no duplication and no sync.

## Areas of concern
- **Taint and secret values, addon code, plugins and skins, saved variables, localization, data snapshots:** none; tooling only, and the snapshots do not change.
- **Contributors (public repo):**
  - after the move, the committed settings point at a folder only Krowi's machine has;
  - a contributor's Claude Code shows a plugin load error in `/plugin` and has no shared hooks or skills;
  - `Check-Repo` and the headless pipeline stop at `KitPath.ps1`'s message, because the Lua lives in the kit;
  - Krowi accepted this on 2026-10-16.
- **The other repos:**
  - they get the merged fixes to the shared files at their next session start;
  - the kit's tests and runs from Krowi_Vendorer prove them before the kit merges;
  - Krowi_ExtendedVendorUI's setup PR #89 is open, and another session works on it; it already targets the kit and is not touched from here.
- **Worktrees:**
  - today this repo's hooks run from `$CLAUDE_PROJECT_DIR`, the main checkout;
  - the plugin's hooks run from the kit, the Stop hook still from `$CLAUDE_PROJECT_DIR`;
  - `KitPath.ps1` resolves the kit from the main checkout, so worktrees work.
- **Release safety:** the merged preflight keeps every guard either version has, and this repo's escape gate through `.claude/release-gate.ps1`.
- **Another session in this repo** (`krowi-achievementfilter-f7`, idle): it keeps its loaded hooks until it restarts. After the merge, a restart picks up the plugin.

## Verification
- **Kit:**
  - `pwsh -NoProfile -File tests\Test-GuardToolUse.ps1` passes with the old and the new cases;
  - `claude plugin validate .` passes.
- **Headless `claude.exe -p` from this repo's worktree,** with a scratch settings file that enables `krowi` from the kit worktree:
  - each skill and agent is listed once;
  - a denied `sed -i` proves the guard hook;
  - a Lua edit proves the syntax hook;
  - the Stop hook still runs.
- **From this repo's worktree, compared with the current versions:**
  - `Check-Repo.ps1` on the whole tree gives 0 errors;
  - the headless pipeline `Both` and every suite pass;
  - the snapshot scripts without `-write` report no change;
  - `Update-DeprecatedApi.ps1` regenerates its list byte-identical;
  - `Deploy.ps1 -WhatIf` gives the same plan for Retail and Classic;
  - `Read-GameErrors`, `Read-GameTests`, `Read-GameScreenshot`, `Check-ReleaseReady` give the same verdicts;
  - `Find-Symbol` and `Strip-Semicolons -DryRun` give the same output;
  - a data skill's lookup by parameter works.
- **From Krowi_Vendorer:** `Deploy.ps1 -WhatIf` and `Check-ReleaseReady` from the kit worktree give the same verdicts as the kit's `main`.
- **Paths:** `git grep` in this repo for the moved paths finds only history and `docs/work/`.
- **No in-game check:** the addon does not change.

## Decision
Krowi, 2026-10-16:
- the kit is the one home of every reusable piece, and every repo uses it, this one included;
- what is specific to a repo stays in that repo (option A);
- this repo's better versions win in the merge;
- contributors losing the harness is accepted.