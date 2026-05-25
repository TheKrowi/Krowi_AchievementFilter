# Verify Achievement Data — Autolearn

How to extend the skill when you discover a new edge case (false positive, false negative, or detection gap).

## Evaluator

The test harness is the evaluator. Run it with:

```powershell
cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\verify-achievement-data"
.\Test-VerifyScript.ps1
```

It must exit 0 before any change is considered done.

## Baseline Calibration

Before trusting any change to the script or fixtures:

1. Run the harness — it exercises both `fixtures/known_good.lua` and `fixtures/known_bad.lua` automatically.
2. `known_good.lua` must produce **no `[FAIL]` lines**.
3. `known_bad.lua` must produce **exactly the expected `[FAIL]` lines** and the correct summary count.

If either check is wrong, the evaluator is miscalibrated — fix the script or fixture before continuing.

## Feedback Loop

When you fix a detection gap, run:

> ```powershell
> cd "e:\World of Warcraft Addon Development\Krowi_AchievementFilter\.github\skills\verify-achievement-data"
> .\Test-VerifyScript.ps1
> ```
>
> If it fails, analyze the output, fix `Verify-AchievementData.ps1` or the affected fixture, and re-run. State what you changed and why before each attempt. **Stop after 5 attempts** and report the remaining failure if still unresolved.

## Steps

1. Fix the detection logic in `Verify-AchievementData.ps1`.
2. **Add a fixture entry** that exercises the new code path:
   - Fixed a false positive (was incorrectly flagging a valid entry) → add a passing entry to `fixtures/known_good.lua`.
   - Fixed a false negative (was missing a real bug) → add a failing entry to `fixtures/known_bad.lua`.
   - The entry must isolate **exactly one** check failure (for bad entries) and must use a real WoW ID verifiable in the DB.
3. **Update `Test-VerifyScript.ps1`** to match the new fixture:
   - Update the entry counts in the synopsis comment.
   - For bad entries: update the summary assertion (`N failure(s) in N entries`), add a specific `[FAIL]` pattern assertion, and add the new ID to the unexpected-FAIL exclusion list.
   - For good entries: the "No [FAIL] lines" assertion covers it automatically; no additional assertion needed.
4. Run the evaluator (see [Feedback Loop](#feedback-loop) — max 5 attempts) until it exits 0.
5. Append a note to [EDGE-CASES.md](EDGE-CASES.md).

> Every edge case fix must be backed by a fixture + assertion. A fix without a fixture is unverified and will silently re-break on the next script edit.
