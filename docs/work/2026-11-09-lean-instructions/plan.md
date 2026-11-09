# Plan: one lean instruction file
Spec: KAF `docs/work/2026-11-09-lean-instructions/spec.md` (accepted 2026-11-09: CLAUDE.md + 6 path rules; scope "Both now"). Worktree: KAF `.claude\worktrees\docs-2026-11-09-lean-instructions`, branch `docs/2026-11-09-lean-instructions`. Kit: worktree `feature/2026-11-09-rules-ride-along`. Status: done

## Context
`.github/copilot-instructions.md` (41 KB) plus `CLAUDE.md` (6 KB) load into every call and every general-purpose subagent: about 12k tokens. The spec's inventory gives every statement a new home. Krowi: "make sure we do not lose nuances".

## Files that change
**KAF, new:**
- `CLAUDE.md`, rewritten: at most 200 lines and 16 KB. It holds:
  - the addon in a few lines;
  - "no build step";
  - the repo's own commands;
  - which suites to run;
  - validation without the client and `Files.xml`;
  - the two namespaces;
  - the three-phase boot;
  - features in two lines;
  - the client flags;
  - taint and global writes;
  - background jobs;
  - saved variables and migrations;
  - `Filters.Validate`;
  - code style: rules with one-line patterns;
  - `Libs/` hands off;
  - work items, `gh` and closing issues, commits;
  - the Stop hook and the worktree lint note;
  - the subagents;
  - the data skills;
  - `Gate log: enrolled` (verbatim);
  - the release facts (`--stability stable`);
  - a pointer map.
- `.claude/rules/` files. Each opens with YAML frontmatter `paths:` as a list and stays at most 8 KB:
  - `data.md`, for `DataAddons/**`, `Api/**`, `Data/**`, `.claude/skills/**`, `raw/**`;
  - `events.md`, for `Data/Event*.lua`, `Data/Custom*EventTimers.lua`, `DataAddons/**/Event*.lua`, `Gui/EventReminder/**`, `Tests/Event*.lua` and `Tests/Schedul*.lua`;
  - `features.md`, for `Features/**`, `Features.lua` and `Slots.lua`;
  - `localization.md`, for `Localization/**`;
  - `tests.md`, for `Tests/**` and `.claude/tools/headless/**`;
  - `release.md`, for `_Packaging/**`, `.claude/release-gate.ps1` and `Options/Window/Changelog.lua`.
- Text moves verbatim where it carries a decision: the event policy, and every rule dated with "Krowi".

**KAF, changed:**
- `docs/architecture.md` gains:
  - the load order, its 13 steps with `AllowLoadGameType`;
  - the root-files table;
  - the key-directories rows its file map lacks;
  - objects and `TemporaryObtainable`;
  - external references.

  Its line 3 then points to `CLAUDE.md`.
- `.github/copilot-instructions.md` is deleted.
- References to the old file are retargeted to `CLAUDE.md` or the named rule file. They are found with grep, excluding `docs/work/`:
  - `.claude/tools/Check-Repo.ps1`: the header and two messages;
  - `.claude/hooks/Check-RepoOnStop.ps1`;
  - `.claude/tools/Check-Repo.jobs`;
  - `.claude/tools/README.md`: lines 7, 183 and 185;
  - `CONTRIBUTING.md`;
  - `REVIEW.md`;
  - `Tests/README.md`: lines 5 and 85;
  - `docs/sdlc-playbook.md`: lines 5, 10 (drop "Copilot"), 20, 42, 51, 59, 84, 88 and 103. Stage 6 becomes: a lesson goes to `CLAUDE.md` only when it applies to every task, otherwise to its path rule, a skill, a lint rule or a scenario;
  - `docs/codebase-analysis.md:658`;
  - `docs/data-design-review.md:223`;
  - `docs/how-to/add-event.md:54`;
  - `docs/how-to/migrate-category-data.md`: lines 34 and 243;
  - `docs/harness-roadmap.md`: line 43 and step 16, marked done with the measured numbers once known.
- `.claude/tools/Check-Repo.ps1`: a new rule `instructions` [Warning, promoted to Error when the file changed], always on.
  - It flags `CLAUDE.md` over 16 KB or 200 lines, and a `.claude/rules/*.md` file over 8 KB.
  - It also flags a rule file that does not open with `---`, a `paths:` key and a closing `---`, because malformed frontmatter makes a rule load on every call.
  - Its header gets a line, and `.claude/tools/README.md`'s rule table gets a row.

**Kit (`Krowi_ClaudeKit`, its own PR):**
- `tools/Gates.ps1:233`: lines in `.claude/rules/*.md` ride along, as `CLAUDE.md`'s do. The comment above says why.
- `tests/Test-Gates.ps1`: the path-area entry `.claude/rules/data.md` = support, and the case "a lesson edited in a path rule rides along" (Gui + a `-`/`+` line pair in `.claude/rules/data.md`: `fix/gui`).
- `skills/process-issue/SKILL.md` stage 6: the "a correction needed twice" row also names the repo's path rule (`.claude/rules/`).
- `WowAddons.md`, Keeping this file alive: a repo's rules for one area of code go into a `.claude/rules/` file with `paths:`, not its `CLAUDE.md`.

## Order of work
1. Commit `plan.md` and the `plan` gate row.
2. Kit worktree, tests first: the new Test-Gates case fails, `Gates.ps1` makes it pass. Then the skill and `WowAddons.md`. Push and open the PR.
3. KAF: the `instructions` lint rule first. It measures `CLAUDE.md` itself, not its import, so it is proven on a temporary oversized copy and a rule file without frontmatter, both removed afterwards.
4. Write the rule files and the new `architecture.md` sections. Text moves before it is condensed, so a diff against the old file shows each line's new home.
5. Write the new `CLAUDE.md` and delete the old file.
6. Retarget the references, then grep that no `copilot-instructions` remains outside `docs/work/`.
7. Verification (below), fixes, `Get-ChangeClass`, `/code-review`, push, PR.

## Risks
- **A rule that moved to a path rule is missed** on a task that never reads a file in that area. Mitigated by the inventory: rules any code edit can break stay in `CLAUDE.md`.
- **Path rules may not load after the worktree switch** (`$CLAUDE_PROJECT_DIR` stays on the main checkout). They are tested in this session by reading a `DataAddons` file and watching for the rule's text. If they don't load from a worktree, the PR says so, and the real check is the first session after the merge.
- **Nuance lost while condensing.** A fresh subagent compares the old with the new, unanchored on my mapping.
- **Malformed YAML** makes a rule load always. The lint checks the frontmatter shape.

## Proof
- **No nuance lost:** a general-purpose subagent gets the old `copilot-instructions.md` and `CLAUDE.md` from `main` (git show) and the new files plus the named docs and skills. It lists every statement found in none of them. Each finding is fixed or answered in the PR.
- **Paths:** a script extracts every backticked path in `CLAUDE.md` and `.claude/rules/*.md` and checks it with Test-Path. Globs are checked to match at least one file.
- **Rules load:** this session Reads `DataAddons/Shared/...`, `Localization/enUS.lua` and `Tests/README.md` after the rules exist, and shows whether each rule's text arrived.
- **Lint:** `Check-Repo.ps1` is green on the whole tree. The `instructions` rule fires on a temporary 17 KB `CLAUDE.md` copy and on a rule file without frontmatter, and both temporary files are removed.
- **Kit:** `pwsh -NoProfile -File tests\Test-Gates.ps1` all pass.
- **Size:** `CLAUDE.md` bytes before and after, in the PR. The start-context drop is measured by `Measure-Sessions.ps1` after the merge and written into the roadmap.

## Build notes
- **Source drift.** The session worked from a copy of the instructions taken before PR #412 and kit PR #25 merged. The nuance audit caught both: the slot list (row parts, `Slots.AchievementMenu.Open`) and the client-start sentence, which now points to the workspace rule. Both were taken from `main`.
- **The nuance audit.** A fresh general-purpose subagent compared `main`'s two files with the new set and the named docs, and found 13 items. All were fixed except finding 8: the kit's `README.md` already holds the guard's `Libs/` ask and its test file, and `CLAUDE.md` now names the ask. Fixed:
  - the language-server list;
  - the indent no longer claimed as enforced;
  - the worktree facts;
  - the UI-source notes, including the lag;
  - the `event-clock` files;
  - the stale fsdeploy text and release-gate row in `.claude/tools/README.md`;
  - a `Gui/RewardPreview/` row that no longer exists.
- **Rule loading, proven.** A headless `claude -p` session (Sonnet) in the worktree read `Slots.lua`, which loaded `features.md`, then `Localization/enUS.lua`, which loaded `localization.md`. No rule was in context before the reads, and the old file's text was gone. That session started at 63k tokens against KAF's usual 79-82k; part of the drop is `-p` mode's smaller tool set, so the real figure comes from the first sessions after the merge.
- **Not in the plan.**
  - `docs/work/2026-11-09-memory-moves/plan.md` got its two template headings, which the lint warned about.
  - The kit PR (#28) has no work folder of its own; its gates are logged here.