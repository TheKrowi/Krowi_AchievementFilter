---
name: process-issue
description: Take a GitHub issue, bug report, error report or feature idea for Krowi_AchievementFilter through the repository's AI-native SDLC (docs/sdlc-playbook.md) - intent.md, spec.md, plan.md in docs/work/, a test-first build, the feedback loop, a PR against dev and the closing routine, stopping at every maintainer gate. Use when the user says process, fix, handle, triage or work on an issue ("gh 325", "#325", an issue URL), reports a bug, or asks for a new feature or behaviour change.
---

Drive one work item through `docs/sdlc-playbook.md`. That file is the process and this skill is the checklist for running it in Claude Code. Rules live in `.github/copilot-instructions.md`. Stop at every gate and do not act past it.

`gh` is `& "$env:LOCALAPPDATA\Programs\gh\bin\gh.exe"` in PowerShell, because Git Bash does not have it on PATH. Reads and writes need no confirmation, as the instruction file allows.

## 0. Read the item

```powershell
& "$env:LOCALAPPDATA\Programs\gh\bin\gh.exe" issue view <n> --repo TheKrowi/Krowi_AchievementFilter --json number,title,state,author,labels,body,comments,createdAt
```

Download every screenshot into the scratchpad with `curl -sSL -o <file> <url>` (user-attachments URLs are webp) and look at it with Read. The picture often shows what the text does not.

Branch off `dev`: `git switch -c fix/<n>-<slug> dev` (or `feature/<n>-<slug>`). Create `docs/work/<n>-<slug>/` from `docs/work/_template/`.

## 1. Plan: intent.md

Restate the issue in the template, in the reporter's terms: the problem, the proposed outcome, the affected users and systems (client, tab or window, option defaults, plugins, saved variables), the constraints and the open questions. Do not put the root cause or the fix in the intent.

**Gate:** the maintainer accepts the intent. Asking the design question at the next gate can cover this one when the issue is unambiguous. Set `Status: accepted` when they do.

## 2. Design: spec.md

Find the root cause before designing. For GUI bugs, read Blizzard's live source (`https://raw.githubusercontent.com/Gethe/wow-ui-source/live/Interface/AddOns/<addon>/Mainline/<file>`, or `classic` for the Classic branch) into the scratchpad and grep it. The `ketho.wow-api` annotations can lag a patch behind. Cite addon `file:line` and the Blizzard source in `## Root cause`.

Write the requirements, the design and the options with a recommendation first. Fill in every item under `## Areas of concern`, and `## Verification` with the scenarios you will write.

**Gate:** put the choice to the maintainer with AskUserQuestion, recommended option first, one short paragraph per option saying what the player would see. Record the answer and the date under `## Decision`, set both files to `accepted`, and commit them together: `docs(work): intent and spec for #<n>`.

## 3. Build: plan.md, then test first

Write `plan.md` read-only: plan mode (EnterPlanMode) when the session is not already past it, otherwise before any code edit. Cover the files that change, the order of work, the risks and the proof.

**Gate:** routine plans proceed; anything touching shared GUI code, Blizzard hooks, saved variables or the data API waits for the maintainer.

Then, in this order:

1. **Scenario first.** Add it to the matching suite in `Tests/` and to its model in `.claude/tools/headless/run-tests.lua`, or create a new suite: a `Tests/<Suite>.lua` registered in `Tests/Files.xml`, a `suites.<name>` in the runner, and the suite named in the instruction file. `Recorded` is today's behaviour and `Target` the spec's. Run `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" <suite>` and confirm the new scenario PASSes and is open against its target.
2. **In-game before-run (GUI work).** Run `Deploy.ps1 -WhatIf`, then deploy. Ask the maintainer for `/kaftest <suite>` and a second `/reload` (the game writes the log only on reload), then read the result with `Read-GameTests.ps1`. It must be green, with no FAIL and no unexplained difference from headless, before the fix starts. Commit the scenario: `test: reproduce #<n> in the <suite> suite`.
3. **Fix only the code.** Then set `Recorded` to `Target` and rerun the suite. Never loosen a scenario, a lint rule or `Check-Repo.ignore` to get green.
4. Add a changelog line under the next version with a dev note for the root cause, and update `plan.md` wherever the implementation departed from it.

## 4. Test: the feedback loop

- `& ".claude\tools\Check-Repo.ps1" -ChangedOnly` (the Stop hook runs it too) and the suites.
- The `taint-reviewer` subagent on the diff for GUI, hook, event or protected-API changes; the `data-verifier` subagent for data.
- In-game after-run on each client the change touches: deploy, `/reload`, `/kaftest <suite>`, second `/reload`, `Read-GameTests.ps1` and `Read-GameErrors.ps1`.

## 5. Deploy: PR, then the maintainer

Set every work file to `Status: done`, commit (`fix(<scope>): <what> (#<n>)`), push the branch and open the PR against `dev` with `.github/pull_request_template.md` filled in. `Why` links the issue and the work folder. `Closes #<n>` does not fire, because `dev` is not the default branch. Run the passes in `REVIEW.md` (`/code-review`, plus `taint-reviewer` where it applies) and fix or list the findings in the PR.

**Gate:** the maintainer approves and merges. Never merge, never push the work to `dev` directly, and never release.

## 6. Maintain

After the maintainer merges, close the issue with the closing routine in the instruction file: one line naming the merge commit and the version it ships in. Then write back what the work taught, as `docs/sdlc-playbook.md` stage 6 lists it:

- a correction needed twice goes into the instruction file;
- an inconsistently applied policy becomes a skill;
- a mechanical rule becomes a `Check-Repo` rule;
- a deferred finding goes into `docs/codebase-analysis.md`.
