# Spec: Act on the Claude Code setup review of 2026-11-27
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. `data-verifier` cannot edit files, and its documented lookups match the repo's existing `PowerShell(...)` allow rules, with no new allow rule.
2. The Stop hook skips the lint when the checkout is byte for byte what it was at the last clean run of the lint: same `HEAD`, same tracked diff, same untracked files, same kit commit. Any difference runs the lint exactly as today. A failing run is never remembered.
3. The Stop hook's lint is not cut off by its timeout on a large diff.
4. The PR template no longer claims `Closes #NNN` does not close the issue.
5. `.gitignore` ignores `.claude/settings.local.json`.
6. Claude Code refuses an Edit or Write under `wow-ui-source`.
7. `add-achievement-data`'s description says when to use it; `verify-achievement-data` has no `version:` field.
8. The lint's timings and the `-Luals` switch are described as they are, in `.claude/tools/README.md` and `CLAUDE.md`.

## Root cause
1. [data-verifier.md:4](../../../.claude/agents/data-verifier.md) lists `Edit`; line 29 makes its shell Bash, while [settings.json](../../../.claude/settings.json) allows the lookup scripts only as `PowerShell(& ".claude\skills\...")`.
2. [Check-RepoOnStop.ps1:26](../../../.claude/hooks/Check-RepoOnStop.ps1) runs the lint unconditionally. Measured 2026-11-27: `-ChangedOnly` 22 s (unit-tests 8.3 s, feature-boundary 4.9 s); the whole tree 90 s (luals 32 s, unit-tests 9.5 s, feature-boundary 6.3 s, zone-decisions 4.4 s). Computing a git fingerprint of the checkout took 0.4 s.
3. The hook's `timeout` is 60 ([settings.json:20](../../../.claude/settings.json)). The docs (hooks.md): a command hook that reaches its timeout is cancelled and its output discarded, so the turn ends as if the lint passed. A `-ChangedOnly` run on a wide diff can pass 60 s.
4. [pull_request_template.md:5](../../../.github/pull_request_template.md) predates the removal of `dev` (2026-10-18); `gh repo view` gives `main` as the default branch.
5. The only ignore is `.git/info/exclude:7` in the main checkout. The docs: Claude Code adds the file to the global excludes only when it creates the file itself.
6. `additionalDirectories` makes `wow-ui-source` writable; no deny rule and no guard rule cover it.
7. [add-achievement-data/SKILL.md:3](../../../.claude/skills/add-achievement-data/SKILL.md) states what, not when; `version` is not a documented skill field (skills.md: unknown fields are ignored).
8. [README.md:52](../../../.claude/tools/README.md) says "about 12 s plus 30 s for luals"; CLAUDE.md says "-Luals adds the language server", but [Check-Repo.ps1:1019](../../../.claude/tools/Check-Repo.ps1) runs luals on every full run and `-Luals` adds it to `-ChangedOnly` only.

## Design
1. `data-verifier`: `tools: PowerShell, Read, Grep, Glob`, its procedure written in the `& "..."` forms the allow rules already match (Show-Achievement's rule is in Krowi's user settings). `Verify-AchievementData.ps1` and `_start_server.ps1` have no allow rule in either form and keep prompting, as today.
2. Stop hook: after resolving `$root`, build a fingerprint from `git rev-parse HEAD`, `git diff HEAD --binary`, `git hash-object` of every untracked, non-ignored file, and the kit's `HEAD` (the lint runs the kit's Lua and API lists); SHA-256 it. When `.claude\cache\stop-lint.fingerprint` (gitignored, per checkout) holds the same hash, exit 0. After a clean run (exit 0), write the hash. A failed run deletes the file. Any error in the fingerprint step falls through to running the lint.
3. Raise the Stop hook's `timeout` from 60 to 180.
4. Template line 5: "Link the issue (Closes #NNN) and the work folder ...".
5. Add `.claude/settings.local.json` to `.gitignore`.
6. In `.claude/settings.json`: `"deny": ["Edit(//e/World of Warcraft Addon Development/wow-ui-source/**)", "Write(//e/World of Warcraft Addon Development/wow-ui-source/**)"]`, in the docs' Windows form (permissions.md: "`C:\Users\alice` becomes `/c/Users/alice`, so use `//c/**/.env`"). Reads stay allowed.
7. Append "Use when the user pastes achievement ids for a new patch, or a patch's achievements need entering in AchievementData.lua" to the description; delete the `version:` line.
8. README line 52: "whole tree, about 90 s, 30 s of it luals ..."; CLAUDE.md: "no switch: whole tree, language server included; -Luals adds it to -ChangedOnly".

## Options considered
- **Item 1, PowerShell tool (recommended)** against **Bash allow rules for the agent**: the second needs new allow rules, which Claude cannot add, and duplicates every rule in two forms.
- **Item 2, fingerprint cache (recommended)** against **narrowing `-ChangedOnly`** (skip unit-tests when no suite's files changed): the second edits lint rules, which can weaken a check, and saves less (feature-boundary and the tree-wide rules still run). Against **no change**: 22 s on every turn, Q&A turns included.
- **Item 6, project deny rules (recommended)** against **a rule in the kit's guard** for every repo: native rules are deterministic and two lines; the kit rule would cover the other repos too and can follow as a kit change.
- Not taken from the review: trimming CLAUDE.md's Taint section (the public repo's contributors have no kit, so it is their only copy); splitting the 28-30 KB skills (larger; `docs/backlog.md`).

## Areas of concern
- Taint and secret values; clients; Blizzard API changes; other addons; saved variables; localization; embedded libraries; player-facing text: none, nothing that ships or deploys changes (`.claude/`, `.github/`, `docs/`, `.gitignore`, `CLAUDE.md`).
- Data snapshots: none; the lint, including the snapshot rules, still runs on any change.
- Harness: the Stop hook's change and an existing line of `settings.json` make this class `harness`. A stale cache is the risk: the fingerprint covers what git sees of the checkout, its submodules and the kit (commits, diffs, untracked files); not gitignored files, nor the game database's builds, which only the zone rules read (when a zone file changed, which changes the fingerprint).
- Project settings load from the main checkout, so items 3 and 6 take effect after the merge.

## Verification
- Stop hook, with a fake payload (`{"cwd": "<worktree>"}` on stdin), timed: first run lints (about 22 s, exit 0, file written); second run under 1 s, exit 0; after touching a tracked file, lints again; with a deliberate lint error in a scratch commit, exit 2 and no file; after reverting it, lints again.
- `Check-Repo.ps1 -ChangedOnly` clean; `Get-ChangeClass.ps1` says `harness`.
- After the merge: `/permissions` lists the deny rules, and an Edit of a file under `wow-ui-source` whose `old_string` does not exist is refused by permission, not by "string not found"; `data-verifier` runs one `Show-Achievement.ps1 6 -Db` lookup.

## Decision
Krowi, 2026-11-27: all seven items in one PR; the Stop hook gets the fingerprint cache and a 180 s timeout; the deny rules go in this repo's settings ([gates.md](gates.md)).