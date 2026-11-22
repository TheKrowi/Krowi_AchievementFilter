# Plan: verify knows the 12.1.7 rewards, and the parked harness leftovers
Spec: [spec.md](spec.md). Status: done

## Files that change
- `.claude/skills/verify-achievement-data/fixtures/known_good_ptr_fallback.lua`: three 12.1.7 entries.
- `.claude/skills/verify-achievement-data/Test-VerifyScript.ps1`: test 5's description names them.
- `.claude/skills/verify-achievement-data/Verify-AchievementData.ps1`: `HasTaleboundSilver`, two reward texts.
- `.claude/skills/verify-achievement-data/EDGE-CASES.md`: an entry each for Bound Silver and Traveling Raven.
- `.claude/skills/add-achievement-data/SKILL.md`: two table rows, `:TaleboundSilver()` in the method list (18).
- `.claude/skills/add-achievement-data/_lookup_holidays.ps1`: `-Locale` from commit b38da09e.
- `docs/backlog.md`: the `-Locale` line goes.
- `docs/work/2026-11-21-wows-anniversary-event/gates.md`, `docs/work/2026-11-21-patch-12-1-7/gates.md`: the missing rows. Built: moved to a docs pull request of their own, because the kit's guard holds every work folder a branch touches to the branch's class, and these two would read as harness.

## Order of work
1. Fixture, then `Test-VerifyScript.ps1`: test 5 fails on Ach(64464).
2. Script change; `Test-VerifyScript.ps1` passes; the Midnight run shows only the ten older failures.
3. Edge cases and the skill's table.
4. `-Locale` applied from b38da09e; run it once with esES.
5. Backlog and gate rows; `Check-Repo.ps1 -ChangedOnly`; `Get-ChangeClass.ps1` says harness; PR.

## Risks
- A too-wide pattern would hide a real failure: both are anchored (`^Traveling Raven:`, `\bBound Silver$`) and only extend `$isReward`.
- The fixture's ids are PTR-only until 12.1.7 is live: the fallback pass already handles that, and the test still passes afterwards.

## Proof
`Test-VerifyScript.ps1` all green; Midnight verify with ten failures, none of them 12.1.7; `-Locale esES` output; clean lint.