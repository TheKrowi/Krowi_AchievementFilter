# Intent: Act on the Claude Code setup review of 2026-11-27
Author: Krowi (maintainer). Source: idea; a read-only review of the repo's Claude Code setup against the docs of 2.1.332, in the session of 2026-11-27, which Krowi handed over with "You maintain the repo, you process these findings". Status: done 2026-11-27

## Problem
The review found the setup sound, with a few defects that cost time or could mislead a session:
1. The `data-verifier` agent has `Edit` though its text says it never edits, and its shell is Bash while the repo's allow rules for the lookup scripts it runs are `PowerShell(...)` forms, so each of its lookups goes to a prompt or the auto-mode classifier.
2. The Stop hook runs `Check-Repo.ps1 -ChangedOnly` at the end of every turn, about 22 s (unit-tests 8.3 s, feature-boundary 4.9 s), also on turns that changed nothing since the last clean run.
3. `.github/pull_request_template.md` says `Closes #NNN` does not close the issue because `dev` is not the default branch; `dev` is gone and `main` is the default branch.
4. `.claude/settings.local.json` is ignored only through `.git/info/exclude`, not `.gitignore`, so a fresh clone does not ignore it.
5. `wow-ui-source` is read-only by convention, but `additionalDirectories` makes it writable and no rule protects it.
6. The `add-achievement-data` skill's description has no "Use when" clause; `verify-achievement-data` carries a `version:` field Claude Code ignores.
7. `.claude/tools/README.md` gives the whole-tree lint as about 12 s; it is no longer.

## Proposed outcome
Each defect is fixed in the repo, the Stop hook skips the lint when nothing changed since its last clean run, and nothing a session relies on gets weaker.

## Affected users and systems
Claude Code sessions in this repo and its worktrees; the `data-verifier` agent; contributors who read the PR template. Players: none (nothing under the addon's shipped files changes).

## Constraints
- No check weakens: the lint runs exactly as now whenever anything changed; a failed run is never cached.
- Claude cannot add its own allow rules (refused as self-modification), so the fix for item 1 must not depend on new allow rules.
- Out of scope, reported instead: the user-level settings (`~/.claude/settings.json`), the kit's 34 KB `WowAddons.md` and its hook matchers.

## Open questions
Which findings Krowi takes; whether the Stop-hook cache's fingerprint is enough; whether the `wow-ui-source` deny belongs here or in the kit's guard.