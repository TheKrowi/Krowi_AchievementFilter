# Plan: Act on the Claude Code setup review of 2026-11-27
Spec: [spec.md](spec.md). Status: done 2026-11-27

## Files that change
- `.claude/hooks/Check-RepoOnStop.ps1`: the fingerprint, the skip, the write after a clean run and the delete after a failed one (requirement 2).
- `.claude/settings.json`: Stop hook `timeout` 60 to 180; `permissions.deny` with the two `wow-ui-source` rules (3, 6).
- `.claude/agents/data-verifier.md`: `tools: PowerShell, Read, Grep, Glob`; the shell paragraph and procedure in `& "..."` forms (1).
- `.github/pull_request_template.md`: line 5 (4).
- `.gitignore`: `.claude/settings.local.json` (5).
- `.claude/skills/add-achievement-data/SKILL.md`: description; `.claude/skills/verify-achievement-data/SKILL.md`: drop `version:` (7).
- `.claude/tools/README.md` line 52, `CLAUDE.md` build line (8).
- `docs/work/2026-11-27-setup-review/`: these documents and `gates.md`.

## Order of work
1. Commit intent, spec, plan and gates with the gate answers.
2. Measure the hook as it is (the baseline: 22 s every turn, also with nothing changed).
3. Change the hook; run the verification sequence of the spec; record the timings here.
4. The one-line changes (items 1, 3 to 8).
5. `Check-Repo.ps1 -ChangedOnly`, `Get-ChangeClass.ps1`, `/code-review` on the diff.
6. Set the files to `done`, commit by path, push, open the PR with "Decisions taken without asking".
7. After the merge: the post-merge checks of the spec, from the main checkout's settings.

## Risks
- A stale skip hides a lint error: guarded by fingerprinting the whole tracked diff, the untracked files and both `HEAD`s, by never caching a failure, and by the full lint the release gate runs regardless.
- The settings edit is refused by the auto-mode classifier as self-modification: then Krowi adds the deny block and the timeout through `/permissions` or the PR's GitHub editor, from the JSON in the PR.
- The deny pattern does not match on Windows: the post-merge Edit test shows it; the fix is a follow-up commit, not a silent pass.
- `PowerShell` not available to a subagent on another machine: this repo is Krowi's machine only, where the tool is on.

## Proof
Stop hook, fed `{"cwd": "<worktree>"}` on stdin (2026-11-27):
- before the change, a tree with nothing changed: lints, exit 0, 24.4 s;
- after: first run lints, exit 0, 25.4 s, stamp written; second run with nothing changed: exit 0, 0.7 s;
- a trailing semicolon added to `Slots.lua`: lints, exit 2 with the `semicolon` finding, no stamp; the same again: lints again (27.4 s), exit 2; with `stop_hook_active` true: exit 0 at once;
- the semicolon reverted: lints, exit 0, 24.5 s, stamp written; unchanged: 0.6 s; a new untracked file: lints, 24.4 s.
- `Check-Repo.ps1 -ChangedOnly` with every change in place: 0 errors, 0 warnings.

Departure after `/code-review` (medium, 7 findings): the fingerprint now also covers the submodules' own changes (`--submodule=diff`) and untracked files, the kit's diff and untracked files (not only its `HEAD`), and names outside ASCII (`core.quotePath=false`, UTF-8); the stamp is written only when the fingerprint after the clean run equals the one before. `data-verifier` names the two scripts without a rule and gives the PTR variable in the same call. Not changed: gitignored files and the game database's builds stay outside the fingerprint (the comment and the spec say so). Rerun: first run 27.6 s, unchanged 2.0 s; an untracked file in `Libs/CallbackHandler-1.0` lints, unchanged 1.9 s, the same file with new content lints; an untracked `prüfung.txt` lints, unchanged 1.9 s.

After the merge, from the main checkout's settings: `/permissions` lists the two deny rules; an Edit of a file under `wow-ui-source` with an `old_string` that does not exist is refused by permission; `data-verifier` runs `& ".claude\tools\Show-Achievement.ps1" 6 -Db`.