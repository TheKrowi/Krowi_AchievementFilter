# Plan: A review pass for texts and translations
Spec: [spec.md](spec.md). Status: accepted

## Files that change
- `REVIEW.md`, `## Passes`: a seventh pass, Texts, after Proof, with the five checks of the spec and the reference to Krowi's own words (`git show 86777e68^:Localization/enUS.lua`, enUS before the tutorial was removed). `## Important versus minor`: a text or translation that fails the Texts pass is Important, since minor findings show only in a thorough review.
- Kit `WowAddons.md`, Working with Krowi: the player-facing text bullet gains the Title Case names, the verb-first descriptions and the Blizzard global string check; a one-commit lesson in the kit's main checkout, as the kit's `CLAUDE.md` allows.

No changelog line (players see nothing), no addon code.

## Order of work
1. This plan and its row; commit.
2. `REVIEW.md`; commit `docs: a review pass for texts and translations`.
3. `Check-Repo.ps1 -ChangedOnly`, `Get-ChangeClass.ps1` (harness).
4. Work files to `Status: done`; push; the PR against `main`.
5. `/code-review` (low) on the branch.
6. The kit line, committed and pushed in `Krowi_ClaudeKit`.
7. Merge only on Krowi's word, with the merge row first.

## Risks
- A reviewer rewording texts a change does not touch: the pass names only text the change adds or rewords.
- The reference commit going out of reach: `86777e68` is on `main`'s first-parent history, which is never rewritten.

## Proof
- `Check-Repo.ps1`: 0 errors, 0 warnings; `Get-ChangeClass.ps1`: harness.
- The pass by hand on #405's texts finds what #407 fixes (the colon and "no longer starts", the verbless icon description with "either way", the sentence-case names, "Most icons per achievement"); on #407's texts it finds nothing.
- The kit commit regenerates the workspace `CLAUDE.md`.