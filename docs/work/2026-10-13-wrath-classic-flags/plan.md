# Plan: The Wrath Classic client gets its Classic behaviour back
Spec: [spec.md](spec.md). Status: done

Krowi's decisions on 2026-10-13 cover the approach and the upstream push.

Results and departures:
- **Krowi_Util `7ae5bc4`** was pushed to `main` on 2026-10-13: the flags, minor version 4 and the 2.7 changelog entry. Its release is Krowi's.
- **Rebased onto `dev` after #339 merged (158e2216).**
  - In `Check-Repo.ps1`, both branches had added rules; the resolution keeps `library-names`, `settings-close` and `util-flags`.
  - #339 had removed the two `IsWrathClassic` reads in `Options/General.lua`, so the guard now counts 22 reads in seven files.
  - #339's instruction-file line and backlog entry about the missing flag are replaced: the line names the flag again, and the entry is gone.
- **Krowi_Util `3d1abef`: `Options:Open`.** With the flag back, it would have taken the old Interface Options path on 38002 again, though that client has used the settings panel since November 2025. It now uses the old path only where `Settings.OpenToCategory` is missing.
- **Krowi_Util 2.7 release.**
  - A background agent asked to prepare it ran the real package early, with the TOC still at 2.6: a stray "2.6" upload, which Krowi removed from Wago and CurseForge, and tag `2.6` force-moved to `7ae5bc4`.
  - The rest was done in the main session: the TOC (2.7; interfaces `120105, 120100, 50504, 38002, 20506, 11509`), the dated changelog, and a dry-run zip of 26.9 KB with 28 entries.
  - The auto-mode classifier blocked Claude's pushes to Krowi_Util, so Krowi restored tag `2.6` himself and ran the package. It committed "Release 2.7" (`6204c20`) and pushed `main` with `3d1abef`, but GitHub refused the tag push ("fatal error in commit_refs"), and the run stopped before the zip.
  - Krowi then allowed pushes from `Krowi_Libraries\` and runs of the addon manager in `.claude/settings.local.json`. Claude pushed tag `2.7` and ran `--operation all`: Wago, CurseForge and GitHub all succeeded, with the 26.9 KB zip.
- **`Libs/Krowi_Util` moved to "Release 2.7" (`6204c20`)**, in place of `7ae5bc4`.

## Files that change
**Commit 1, the guard (`test: guard the Krowi_Util flags the addon reads (2026-10-13-wrath-classic-flags)`)**
- `.claude/tools/Check-Repo.ps1`: rule `util-flags`, always on, with its header entry. `.claude/tools/README.md`: its row.
- `.claude/tools/Check-Repo.ignore`: the seven files that read a missing flag, held until the bump.

**Commit 2, the fix (`fix(classic): Wrath Classic flags back through Krowi_Util 2.7 (2026-10-13-wrath-classic-flags)`)**
- `Libs/Krowi_Util` → `7ae5bc4`.
- `.claude/tools/Check-Repo.ignore`: the eight entries go.
- `_Packaging/Changelog.md`: a Fixed line under 103.0.

## Order of work
1. Commit 1. Without the ignore entries, the rule reports exactly 22 errors.
2. Commit 2. The full `Check-Repo.ps1` and every suite pass.
3. After #339 merges: rebase. #339's instruction-file line ("`IsWrathClassic` no longer exists") and its backlog entry are then wrong. This branch restores the line and removes the entry.
4. Push, PR, review. The in-game check covers Retail and Mists Classic only.

## Risks
- **Untested on 38002.** Branches dormant since November 2025 run again, including against code that has changed since. Accepted by Krowi.
- **Merge order.** #339 must merge first, or the Tutorial on 38002 hits the missing `InterfaceOptionsFrame`.

## Proof
- The rule's before and after, and the headless suites on both clients.
- `/reload` on Retail and Mists Classic: no new errors.