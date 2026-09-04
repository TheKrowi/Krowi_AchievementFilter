# Verify Achievement Data — Reference

## Verifications

| Option | What it checks | Fail condition |
|--------|---------------|----------------|
| `id-exists` | Achievement ID is present in the game DB | `recordsFiltered == 0` for a queried ID |
| `faction` | `:FactionSplit()` usage matches DB `Faction` field | DB `Faction` is `0` or `1` but Lua has no `:FactionSplit()`, or `:FactionSplit()` present but DB `Faction` is `-1` |
| `title-reward` | `:Title()` aligns with DB `Reward_lang` | DB `Reward_lang` signals a title reward but no `:Title()`, or vice versa |
| `reward-item` | Reward-type method aligns with DB `Reward_lang` | DB `Reward_lang` signals a tangible reward but no reward method, or reward method present but `Reward_lang` is not a tangible reward |
| `description-lang` | Inline `-- comment` matches DB `Title_lang` | Trimmed comment differs from expected name (case-sensitive) |
| `autofactionsplit-unique` | `:AutoFactionSplit()` partner ID does not appear as its own entry; no two `:FactionSplit()` entries mutually reference each other | (1) Secondary ID `Y` in `Ach(X):AutoFactionSplit(f, Y)` also appears as `Ach(Y)` — the secondary is auto-created and must be removed. (2) `Ach(X):FactionSplit(f1, Y)` and `Ach(Y):FactionSplit(f2, X)` both exist — only one should remain (as `:AutoFactionSplit()`). |

> **Note on `reward-item`**: `RewardItemID` is **not** a reliable signal in Classic builds. The script uses `Reward_lang` as the reliable indicator. See [EDGE-CASES.md](EDGE-CASES.md) for all recognised prefixes.

> **Note on `title-reward`**: Multiple `Reward_lang` formats signal a title reward. See [EDGE-CASES.md](EDGE-CASES.md) for the full list.

> **Note on `faction`**: Some achievements have DB `Faction=-1` despite being faction-gated (allied race unlocks, heritage armor). These are known false positives. See [EDGE-CASES.md](EDGE-CASES.md).

> **Note on `autofactionsplit-unique`**: `:AutoFactionSplit()` generates the secondary achievement automatically — the partner ID must **not** appear as its own `Ach()` entry. Similarly, two `:FactionSplit()` entries that point at each other are a pairing error: collapse them into a single `:AutoFactionSplit()` on the primary entry and remove the secondary.

### `description-lang` — Faction Split Entries

For plain `:FactionSplit()`, the comment uses **only the primary achievement's name**.

For `:AutoFactionSplit()`, the comment merges both faction names using a prefix/suffix algorithm. See [EDGE-CASES.md](EDGE-CASES.md) for the full algorithm and examples.

For Classic files, always use the correct Classic build — names can differ between clients. See [API.md](API.md).

---

## Large File Strategy

Running all 5 verifications on a file with many entries will exceed the response length limit. The response length limit is about **output size**, not computation — so the solution is to minimize output per turn, not to do less work.

### Preferred: Parallel subagents (one per patch block)

Spawn one subagent per `KrowiAF.AchievementData["XX_YY_ZZ"]` block. Each subagent:
1. Receives the block's entries and the correct build string.
2. Runs all queries and all verification checks.
3. Returns **only `[FAIL]` lines** — passes are silent.

The main agent collects all subagent results and outputs the combined failure report. This is fast (parallel queries) and keeps the final response short — unless the file has many failures, in which case fall back to block-by-block interactive mode.

### Fallback: Block-by-block interactive mode

If subagents are unavailable or the failure count is high:
1. **Announce the plan**: "This file has N entries across X patch blocks. Processing one block at a time."
2. Process one block per response turn, reporting only failures.
3. Ask "Continue to next block?" before proceeding.

Rule of thumb: **never queue more than ~30 IDs worth of DB queries + output in a single response turn.**

---

## Reporting

Print failures in this format, then a summary line:
```
[FAIL] id-exists       : Ach(99999) — not found in DB
[FAIL] faction         : Ach(12345) — DB Faction=1 (Alliance) but no :FactionSplit()
[FAIL] title-reward    : Ach(11111) — DB Reward_lang="the Flamebreaker" but no :Title()
[FAIL] reward-item     : Ach(22222) — DB RewardItemID=54321 but no :Mount()/:Pet()/:Item()
[FAIL] description-lang: Ach(33333) — comment "Old Name" ≠ DB Title_lang "New Name"
[FAIL] description-lang: Ach(4894)+Ach(4903) — comment "Silverpine Forest / Redridge Mountains (Classic) Quests" ≠ expected "Silverpine Forest / Westfall and Duskwood Quests"

3 failures in 47 entries checked.
```
If no failures: `All X entries passed.`
