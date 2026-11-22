# Spec: verify knows the 12.1.7 rewards, and the parked harness leftovers
Intent: [intent.md](intent.md). Status: done

## Requirements
1. `Verify-AchievementData.ps1` recognises `:TaleboundSilver()` as a reward method.
2. It counts DB reward text ending in "Bound Silver" ("Small Pile of Bound Silver", "Medium ...", "Large ...") and text starting "Traveling Raven:" as a tangible reward.
3. The Midnight run (`$env:KAF_RETAIL_PRODUCT='wowt'`) lists no failure for 64464 or 64465 and no "trusted" false positive for the 26 Raven `:Other()` entries; its ten older failures stay.
4. `Test-VerifyScript.ps1` test 5 covers a Bound Silver entry, a Raven toy and a Raven container, and passes.
5. The `add-achievement-data` skill's reward table names `:TaleboundSilver()` (Bound Silver) and says a "Traveling Raven:" reward is tagged by its item: `:Toy()` for a toy, `:Other()` otherwise; the method list has 18 types.
6. `_lookup_holidays.ps1` gains `-Locale` as in commit b38da09e; its backlog line goes.
7. The anniversary folder's `gates.md` gets the two CurseForge rows of 2026-11-21, the 12.1.7 folder's the export row of 2026-11-22.

## Design
Add `HasTaleboundSilver` to the parsed entry beside `HasRemixBronze`, and to `$hasMethod` and the lists of "other methods" in the reward-item branches, as `RemixBronze` is. Add `'\bBound Silver$'` and `'^Traveling Raven:'` to `$isReward`, each with the tag it belongs to as comment, and an `EDGE-CASES.md` entry for each. Test first: extend `fixtures/known_good_ptr_fallback.lua` with Ach(63734):TaleboundSilver(), Ach(64464):Toy() and Ach(64418):Other(), run test 5 and see it fail on 64464, then change the script. The fixture lives in the fallback test because these ids exist only on the PTR until 12.1.7 is live; the fallback pass finds them there, and the live build afterwards.

## Options considered
1. **Count "Traveling Raven:" as reward text (recommended).** The toys pass, the 26 containers pass as real matches instead of being trusted, and a Raven entry without a tag fails.
2. **Special-case only `:Toy()` with "Traveling Raven:".** Smaller, but leaves the 26 as trusted false positives and an untagged Raven entry unnoticed.

## Areas of concern
- Taint and secret values, clients, Blizzard API, other addons, saved variables, embedded libraries, player-facing text: none, tooling only.
- Localization: none; `-Locale` only reads the game's names.
- Data snapshots: unchanged, no data file changes.
- Checks: only additions to what the verify script accepts as reward text or tag; no existing pattern changes.

## Verification
- `Test-VerifyScript.ps1`: test 5 fails before the script change and passes after; all tests pass.
- `Verify-AchievementData.ps1` on Midnight with `wowt`: exactly the ten older failures (61254 to 61259, 63097, 62883, 62903, 63264).
- `_lookup_holidays.ps1 -Locale esES` prints the Spanish holiday names.
- `Check-Repo.ps1 -ChangedOnly` clean.

## Decision
Option 1, count "Traveling Raven:" as a reward, with the scope "All four": Krowi, 2026-11-22.