# Spec: The setup review's deferred items
Intent: [intent.md](intent.md). Status: done 2026-11-28

## Requirements
1. `CLAUDE.md` keeps a short Taint section: the bug class, the two must-nots a subagent needs without reading any GUI file (never override Blizzard API; global writes only through the allowlist), when `krowi:taint-reviewer` runs, and a pointer to the rule.
2. A path rule `.claude/rules/taint.md` holds the rest of today's section, plus the workspace's general taint and secret-value rules that a contributor without the kit lacks. It loads with the code that taint applies to and stays within the `instructions` lint's 8 KB.
3. `add-achievement-data/SKILL.md` keeps the steps every run follows; the blocks only some runs need move to `add-achievement-data/REFERENCE.md`, each with a pointer at the step that needs it.
4. `add-zone-data/SKILL.md` keeps every placement, entry type, skip and log rule; only the validation tooling's detail and pitfalls move to `add-zone-data/REFERENCE.md`, with a pointer from Step 3.
5. Every non-blank line of the old `CLAUDE.md` Taint section and of both old `SKILL.md` files is in the new files (a script check, Verification).
6. The pointers elsewhere still lead to the right file (`docs/obtainability.md`, `docs/zone-decisions.md`, `docs/how-to/*`, `.claude/rules/data.md`).
7. `docs/backlog.md`: the "two large data skills" entry leaves; an entry lists the review's out-of-repo findings with their evidence tags.

## Design
**Taint.** `.claude/rules/taint.md` with `paths:` `Gui/**`, `Features/**`, `Options/**`, `Settings/**`, `Plugins/**`, `Data/**`, `*.lua`, `*.xml` (the root files: `Krowi_AchievementFilter.lua`, `TaintDiagnostics.lua`, `Bindings.xml`, ...). Not `DataAddons/`, `Api/`, `Objects/`, `Localization/`, `Tests/`, `docs/`, `.claude/`: data, builders and texts. The docs (memory.md): a path rule "loads when Claude uses the Read, Write, or Edit tool on a matching file"; custom subagents load project rules (sub-agents.md). That they also fire inside a general-purpose subagent is not documented, so the must-nots stay in the stub (requirement 1). The rule's contents: today's bullets on the leftovers of overriding, the allowlisted globals, the calendar and aura secrets, the diagnostics files; then the workspace's general rules in the repo's words (hook with `hooksecurefunc` only, no fields on Blizzard frames, no writes into `C_*`, `securecall` launders nothing, probe secrets with `canaccessvalue`/`issecretvalue`, no CVar or binding writes from addon code, Blizzard's frames never made to refresh from addon code); the case law (changelog dev notes, `docs/work/*/spec.md` root causes).

**add-achievement-data.** Moves to `REFERENCE.md` (about 13 KB): the Wowhead lookup table (only when the database leaves a reward unclear), steps 3.5 to 3.7 (pet, mount, decor preview ids: only for those rewards), Edge Cases and Obtainable Patterns (only for an entry with one), Clarification Questions and Example Transformation (examples), Loop B (finding a patch's new ids: its own task). Stays: input, steps 0 to 7 with their tables, Patch Version Determination, Output Options, Validation Checklist, Integration Notes, Related Files, Loop A.

**add-zone-data.** Moves (about 3 KB): the `Evaluate-ZoneCriteria.ps1` tag legend, `_apply_zone_plan.ps1` usage, the lookup pitfalls, the evaluator's output format. Stays: everything else, since every run applies it.

**Measurement.** The proven figure is the bytes of each `SKILL.md` before and after. `Measure-Sessions.ps1` (2026-09-01 to 2026-11-28): no session invoked either skill through the Skill tool; they were read as files, by subagents mostly, on 6 days. The context of a real data run after the split is owed until the next patch's data run.

**Backlog.** In `docs/backlog.md`, a section "Outside this repo": the user-level allow rules' `\\\\` escaping (lines 9 to 12 of `~/.claude/settings.json`, inferred not to match; the 2026-11-28 smoke test ran `Show-Achievement.ps1` without a prompt, but under auto mode that may be the classifier, so it settles nothing), the `gh pr merge` rule in three forms, `MultiEdit` in the kit's hook matcher (unverified), `WowAddons.md` at 34 KB.

## Options considered
- **Taint: path rule with a stub (recommended)**: lowers every session's load, keeps the text in the repo for contributors, and gives them the general rules they lack today.
- **Taint: trim to the repo-only lines**: smaller still, but contributors lose the general rules, which is why 2026-11-27 declined it.
- **Taint: `docs/taint.md` with a pointer**: never loads by itself; a session reads it only if it follows the pointer.
- **Skills: split achievement, light zone (recommended)**: moves only what some runs skip. A full zone split would move rules every run reads and add a Read to each run.
- **Skills: both full**, or **achievement only**.

## Areas of concern
- Taint and secret values: the guidance moves, it does not change; the stub keeps the must-nots for subagents.
- Clients, Blizzard API, other addons, saved variables, localization, embedded libraries, player-facing text: none, nothing that ships or deploys changes (`.claude/`, `docs/`, `CLAUDE.md`).
- Data snapshots: none.
- Harness: changed instruction files and skills, class `harness`.

## Verification
- Line check: every non-blank line of the old texts (`git show main:<file>`) appears in one of the new files, headings and pointers aside; the script prints any missing line.
- `Check-Repo.ps1 -ChangedOnly` clean (`instructions` rule: `CLAUDE.md` within 16 KB and 200 lines, each rule within 8 KB).
- `Get-ChangeClass.ps1` says `harness`.
- Owed after the merge, in a fresh session: a Read of a `Gui/` file loads `taint.md` (`/memory` or the `InstructionsLoaded` hook); the next patch's data run's context against today's.

## Decision
Krowi, 2026-11-28: the path rule with a stub; `add-achievement-data` split in full, `add-zone-data` light; plan approved ([gates.md](gates.md)).