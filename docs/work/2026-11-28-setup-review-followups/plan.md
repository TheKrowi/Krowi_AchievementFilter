# Plan: The setup review's deferred items
Spec: [spec.md](spec.md). Status: done 2026-11-28

## Files that change
| File | Change |
|---|---|
| `CLAUDE.md` | the Taint section cut to the stub |
| `.claude/rules/taint.md` | new path rule |
| `.claude/skills/add-achievement-data/SKILL.md` | moved blocks replaced by pointers |
| `.claude/skills/add-achievement-data/REFERENCE.md` | new: the moved blocks |
| `.claude/skills/add-zone-data/SKILL.md` | Step 3's detail replaced by a pointer |
| `.claude/skills/add-zone-data/REFERENCE.md` | new: Step 3's detail |
| `docs/backlog.md` | the skills entry out, the out-of-repo entry in |
| `docs/work/2026-11-28-setup-review-followups/` | this work folder |

## Order of work
1. Taint: write `taint.md`, cut `CLAUDE.md`.
2. `add-achievement-data`: move the blocks verbatim, add the pointers.
3. `add-zone-data`: the same for Step 3.
4. Line check against `main`; fix any missing line.
5. Backlog.
6. `Check-Repo.ps1 -ChangedOnly`, `Get-ChangeClass.ps1`, `/code-review`.
7. PR; the report to Krowi with the merge question.

## Risks
- A moved rule a run then misses: guarded by the pointers at the steps and the line check.
- The path rule not loading in a subagent: the stub keeps the must-nots.
- The `instructions` lint on the new rule's size: checked in step 6.

## Proof
The line check prints nothing missing; the lint is clean; the byte sizes before and after are in the PR.

## Departures during the build
- From `/code-review` (9 findings, all fixed): the general taint rules name this addon's reviewed exceptions (`addon.OverwriteFunctions`, `HideUIPanel(WorldMapFrame)`, the binding options and the Y key move of #197) instead of forbidding them; `Tests/**` joins the rule's paths; `add-zone-data` points to its reference from Steps 1 and 2 too and names `[D8? ]` as a decision; `add-achievement-data` points to Edge Cases & Exceptions for any time-limited, event, anniversary or season achievement, also from step 4; the moved blocks keep their own headings; `docs/architecture.md` and `CLAUDE.md` list `taint` (and `settings`) among the path rules.
- The backlog drops the user-settings escaping finding: `~/.claude/settings.json` has no quadruple backslash any more (checked 2026-11-28), so it was fixed since the review. It gains the worldmap suite's `SetCVar` calls, older than this work, found by its review.
- The line check: every non-blank line of the old texts is in the new files, except step 2 of `add-zone-data`, which now continues with the pointer to its batch tooling.