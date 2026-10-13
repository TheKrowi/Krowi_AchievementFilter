# Plan: The Wrath Classic client gets its Classic behaviour back
Spec: [spec.md](spec.md). Status: accepted

Krowi's decisions on 2026-10-13 cover the approach and the upstream push.

Results and departures:
- **Krowi_Util `7ae5bc4`** was pushed to `main` on 2026-10-13: the flags, minor version 4 and the 2.7 changelog entry. Its release is Krowi's.

## Files that change
**Commit 1, the guard (`test: guard the Krowi_Util flags the addon reads (2026-10-13-wrath-classic-flags)`)**
- `.claude/tools/Check-Repo.ps1`: rule `util-flags`, always on, with its header entry. `.claude/tools/README.md`: its row.
- `.claude/tools/Check-Repo.ignore`: the eight files that read a missing flag, held until the bump.

**Commit 2, the fix (`fix(classic): Wrath Classic flags back through Krowi_Util 2.7 (2026-10-13-wrath-classic-flags)`)**
- `Libs/Krowi_Util` → `7ae5bc4`.
- `.claude/tools/Check-Repo.ignore`: the eight entries go.
- `_Packaging/Changelog.md`: a Fixed line under 103.0.

## Order of work
1. Commit 1. Without the ignore entries, the rule reports exactly 24 errors.
2. Commit 2. The full `Check-Repo.ps1` and every suite pass.
3. After #339 merges: rebase. #339's instruction-file line ("`IsWrathClassic` no longer exists") and its backlog entry are then wrong. This branch restores the line and removes the entry.
4. Push, PR, review. The in-game check covers Retail and Mists Classic only.

## Risks
- **Untested on 38002.** Branches dormant since November 2025 run again, including against code that has changed since. Accepted by Krowi.
- **Merge order.** #339 must merge first, or the Tutorial on 38002 hits the missing `InterfaceOptionsFrame`.

## Proof
- The rule's before and after, and the headless suites on both clients.
- `/reload` on Retail and Mists Classic: no new errors.