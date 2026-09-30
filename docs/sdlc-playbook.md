# Work-item lifecycle (AI-native SDLC)

Every GitHub issue, feature and fix in this repository moves through the six stages of Anthropic's [AI-native SDLC Playbook](https://academy.claude.com/courses/ai-native-sdlc-playbook): Plan, Design, Build, Test, Deploy, Maintain. Each stage ends by committing an artifact, and the next stage starts by reading it, so the work folder and the pull request together record who asked for what, what the agent produced and who approved it.

This file adapts the playbook to a repository with one maintainer, two game clients and no CI. `.github/copilot-instructions.md` holds the rules that the artifacts are checked against; this file describes the process only.

## Roles

- **Maintainer** (TheKrowi): holds every human gate. Acts as product owner (accepts the intent, approves the spec), engineer (approves the plan, runs the in-game checks), reviewer (approves the PR and merges it, or tells the agent to) and release manager (the `release` skill runs only on their go-ahead).
- **Agent** (Claude Code, Copilot): drafts every artifact and does the work up to each gate, never past it. It stops at a gate, puts the decision to the maintainer with a recommendation, and records the answer in the artifact.
- **Reporter**: whoever filed the issue. The issue is their record; the agent comments on it only through the closing routine or when the maintainer asks.

## The work folder

`docs/work/<id>-<slug>/`, where `<id>` is the GitHub issue number, or the date (`2026-09-30`) for work with no issue. Copy the templates from `docs/work/_template/`.

| File | Stage | Written from | Ends when |
|------|-------|--------------|-----------|
| `intent.md` | 1 Plan | the issue, idea or error report | the maintainer accepts it (`Status: accepted`) |
| `spec.md` | 2 Design | `intent.md`, the instruction file, the skills | the maintainer approves the design (`Status: accepted`, decision recorded) |
| `plan.md` | 3 Build | `intent.md` and `spec.md`, in plan mode | the maintainer approves it, or it is routine and the agent proceeds |

Each file starts with its `# Intent:`/`# Spec:`/`# Plan:` title and a `Status: draft | accepted | done` line. The agent sets every file to `done` in the last commit of the PR, so the merge records completion. `docs/` is excluded from the release zip, so the folders never reach players. The `work-items` lint rule checks the folder name, the titles, the status line and the required headings.

Scale the documents to the change: a one-line fix can have a five-line spec. A stage or a gate is never skipped. Exceptions:

- Routine data work driven by a data skill (`add-achievement-data`, `add-category-data`, `add-zone-data`, `migrate-to-shared`, `verify-achievement-data`, `sync-mapverifier`) runs under that skill, which acts as its standing spec and plan. It needs a work folder only when it comes from an issue or needs a decision.
- Documentation-only changes need no work folder.
- Releases go through the `release` skill, not a work folder.

## The stages

### 1. Plan: capture the intent

The agent restates the issue in the template, in plain language: the problem and its impact, the proposed outcome, the affected users and systems (which client, which tab or window, which plugins and saved variables), the constraints, and the open questions. It reads the issue's screenshots and error text first. Commit `intent.md` on a work branch off `dev`, named `fix/<id>-<slug>` or `feature/<id>-<slug>`.

Gate: the maintainer accepts the intent, or sends it back.

### 2. Design: requirements and design in one session

From the accepted intent, the agent writes `spec.md`: the requirements, the root cause for a bug (with sources: `file:line` in the addon, and Blizzard's source from the references in the instruction file), the design, and the options considered with a recommendation. It flags areas of concern explicitly:

- taint and secret values;
- Retail and Classic;
- plugins and skins that address the frames involved;
- saved variables and migrations;
- localization in every locale;
- the data snapshots and the headless pipeline.

The skills and the instruction file are the policies the spec must conform to; any departure from them is an area of concern, not a silent choice.

Gate: the maintainer approves the design and picks between the options. The agent records the decision and the date under `## Decision`, then commits `spec.md` together with `intent.md`.

### 3. Build: plan mode, then test first

The agent writes `plan.md` in plan mode (read the code, change nothing). It covers the files that change, the order of work, the risks and the proof, and is complete enough that someone who never saw the conversation could carry it out. Then it builds in the order the plan gives:

1. **Test first, for a bug fix.** Add a scenario to the matching suite in `Tests/` (or a new suite shared by `/kaftest` and `.claude/tools/headless/run-tests.lua`). Set `Recorded` to the current, buggy behaviour and `Target` to the desired behaviour, so the headless run reproduces the bug as one scenario that is open against its target. For GUI behaviour, the in-game run of the suite must be green before the fix starts (maintainer rule): deploy, `/kaftest <suite>`, `Read-GameTests.ps1`. Commit the scenario. A data bug is reproduced by the headless data pipeline or a data-verifier finding instead.
2. **Fix only the code.** Never weaken a scenario, a lint rule or an ignore entry to make a check pass. After the fix, `Recorded` is set to the new behaviour (equal to `Target`), so the diff of the scenario file is the behaviour change under review.
3. Update `plan.md` when the implementation departs from it.

Gate: the maintainer approves `plan.md` for anything that is not routine. The in-game before-run is the second gate for GUI work.

### 4. Test: the feedback loop

The agent checks its own work before the maintainer sees it:

- `Check-Repo.ps1`, which the Stop hook runs on every turn;
- the headless data pipeline and the scenario suites;
- the `data-verifier` subagent for data changes;
- the `taint-reviewer` subagent for any change to GUI code, hooks on Blizzard frames, event handlers or lockdown-protected APIs.

The in-game after-run closes the loop on both clients: `Deploy.ps1 -WhatIf`, deploy, `/reload`, `/kaftest`, `Read-GameTests.ps1`, `Read-GameErrors.ps1`. The scenario suites are this repository's regression evals. Every fixed bug leaves a scenario behind, so the defect cannot come back unnoticed, and the `unit-tests` lint rule runs them on every turn.

### 5. Deploy: review, then the human gate

The agent pushes the work branch and opens a PR against `dev` with the PR template filled in and the work folder linked. Before asking for review, it runs the review passes in `REVIEW.md` (`/code-review`, and the `taint-reviewer` where it applies), fixes what they find, and lists what it deferred. It sets the work files to `Status: done` in the PR's last commit.

Gate: the maintainer reviews and approves the merge. The gate is their decision, not who presses the button: the agent never merges on its own initiative, but when the maintainer tells it to merge, it merges with a merge commit (`gh pr merge <n> --merge`, like the earlier PRs into `dev`), so each stage's commit stays in the history. It never pushes work-item commits straight to `dev`. A release is a separate, later gate: the `release` skill, on the maintainer's go-ahead.

### 6. Maintain: close the loop

After the merge, the agent closes the issue with the closing routine in the instruction file. Whatever the work taught flows back into the harness, so the next work item starts from it:

| What the work taught | Where it goes |
|----------------------|---------------|
| a correction the agent needed twice | the instruction file |
| a policy that was applied inconsistently | a skill |
| a mechanical rule | a `Check-Repo` rule |
| a fixed bug | a permanent scenario |
| a finding accepted but deferred | `docs/codebase-analysis.md` |

After each release, `Read-GameErrors.ps1` on both clients and new issues are the production signal. They start a new work folder at stage 1.

## Where each play lives in this repository

| Playbook play | Here |
|---------------|------|
| Capture as `intent.md` | `docs/work/<id>-<slug>/intent.md`, template in `docs/work/_template/` |
| Requirements and design | `spec.md` in the same folder |
| Plan mode | `plan.md`; Claude Code plan mode or an equivalent read-only pass |
| The CLAUDE.md | `.github/copilot-instructions.md` (canonical) imported by `CLAUDE.md`; a correction needed twice is written there |
| Skills as institutional knowledge | `.claude/skills/*/SKILL.md`; `process-issue` drives this lifecycle |
| Parallel sessions and subagents | `.claude/agents/` (`data-verifier`, `taint-reviewer`); one worktree per session |
| Give Claude a feedback loop | `Check-Repo.ps1`, the post-edit and Stop hooks, the headless pipeline and suites, `Deploy.ps1` with the `Read-Game*` readers |
| Continuous evals in CI | the `Tests/` scenario suites through the `unit-tests` rule on every turn; CI itself is not built yet (harness roadmap step 4) |
| AI in the PR review loop | `REVIEW.md`, `/code-review`, `taint-reviewer`; the maintainer approves |
| Hooks as approval gates | `.claude/hooks/` (syntax and lint); PreToolUse gates are not built yet (harness roadmap step 5) |
| CI/CD integration and deployment | the `release` skill driving the Krowi Addon Manager; production is the maintainer's go-ahead |
| Closing the loop on metrics | `Read-GameErrors.ps1` after a release, the issue tracker; not automated |

The playbook's enterprise controls (managed settings, OpenTelemetry, compliance API) do not apply to a single-maintainer repository and are left out.

## Measuring it

The git history of a work folder and its PR is the measurement. The timestamps of the `intent.md`, `spec.md` and `plan.md` commits and of the merge show where the time goes. Commits that touch `spec.md` after `plan.md` exists are requirements rework, and a scenario or review finding that comes back is a correction for the instruction file.
