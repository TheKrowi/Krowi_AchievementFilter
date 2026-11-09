# Plan: move what session memory alone holds into the repo's docs
Spec: [spec.md](spec.md). Worktree: `.claude\worktrees\docs-2026-11-09-memory-moves`, branch `docs/2026-11-09-memory-moves`. Status: done

## Files that change
1. `.claude/skills/verify-achievement-data/API.md`: a section "Hotfixed achievements (in no build)".
2. `.claude/skills/add-zone-data/SKILL.md`: a pitfalls list in Step 3.
3. `Tests/README.md`: a section "Remaking one help picture".
4. `docs/backlog.md`: a section "Moved from session memory (2026-11-09)".
5. `docs/harness-roadmap.md`: one paragraph after the step 14 baseline.

## Order of work
Edits, lint, commit; then the memory entries are deleted outside the repo.

## Risks
None for players. A moved fact that was stale: each was checked against the code or GitHub first (the two the code already covers were not moved).

## Proof
`Check-Repo.ps1 -ChangedOnly`: 0 errors, 0 warnings.