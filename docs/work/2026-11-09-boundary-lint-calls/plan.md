# Plan: The feature-boundary lint reads a call as a definition
Spec: [spec.md](spec.md). Status: done

## Files that change
- `.claude/tools/Check-Repo.ps1`: `$definesPath` and `$definesGlobal` above the rule's loops, with a comment; the two feature-name matches and the core-defined match use them and take `Groups[1] + Groups[2]`.
- `docs/work/2026-11-09-boundary-lint-calls/`: this work folder.
- `.claude/tools/README.md` stays: its `feature-boundary` line already says "the paths it assigns or defines functions on".

## Order of work
1. Reproduce on `main` with a scratch second feature (done 2026-11-09, spec.md, Root cause); the scratch is never committed.
2. The two patterns and the three matches (the change the Right-click menu branch made, with this folder in its comment).
3. The scratch feature again: no `feature-boundary` error with the fix; one for a line naming `KrowiAF_RewardPreviewMixin` (done 2026-11-09); the scratch removed.
4. `Check-Repo.ps1` on the whole tree; `Get-ChangeClass.ps1`; every work file `done`; commit, push, PR against `main` (`fix:`); the merge gate.
5. After the merge: the Right-click menu branch (not pushed yet) rebases onto `main`, taking `main`'s version of the lint where the two differ (the comment's work folder).

## Risks
- A definition written another way (`addon["X"] = `, a definition on a non-`addon` alias) was never found by either pattern; nothing changes there.

## Proof
- The scratch checks of step 3, the whole-tree lint clean, and the Right-click menu branch passing `feature-boundary` after its rebase.