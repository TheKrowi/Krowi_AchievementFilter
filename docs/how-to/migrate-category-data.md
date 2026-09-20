# How To: Verify and Migrate CategoryData from V1 to V2

Use this guide to move the first-party category files from the V1 positional format to the V2 builder format **without losing part of the category tree**. The order is deliberate: build a verifier, prove it catches a real regression, then migrate one file at a time behind it, then verify again.

Background and the wider multi-client plan are in [`../data-design-review.md`](../data-design-review.md). This guide is the execution detail for the category part of it.

**Commit types:** `chore(tools):` for the verifier, `refactor(data):` for each migrated file, `docs:` for the instruction-file correction at the end.

---

## Why this exists

Nineteen category subtrees were silently absent from the Specials and Events tabs on both clients until 2026-09-20. They were authored `{ true, <name>, { ids } }` — `canMerge` before the name. `ParseChildData` in `Api/CategoryDataApi.lua` matches no branch for a leading boolean and has no `else`, so the node and every achievement under it was dropped while `load-data` still reported **0 problems**.

That is the risk this guide manages. A V1 node is positional, so an argument-order slip is silent; a V2 `:Named(label, ids)` call cannot be got wrong the same way. But migrating ~30 files with nothing able to prove the tree survived would repeat the original failure at a much larger scale.

The `category-node-shape` lint rule added on 2026-09-20 catches that one specific slip. It does not prove a migration preserved the tree. That is what Phase 1 is for.

---

## Current state (verified 2026-09-20)

| Fact | Value |
|---|---|
| `KrowiAF.NewExpansion` call sites in the whole tree | **1** — `DataAddons/Retail/12_Midnight/CategoryData.lua:5` |
| Everything else (11 Retail expansions, all Classic, all Shared) | V1 positional tables |
| V2 builder size | `Api/CategoryDataBuilder.lua` 269 lines, `Api/CategoryDataApi.lua` 197 lines |
| V2 builder methods actually used | `:Named` 14, `:Delve` 14, `:Dungeon` 9, `:Raid` 6, `:ZoneNamed` 4, `:MythicPlus` 1 |
| Category ids that are auto-allocated parse positions | ~96% (from the 2026-09-20 audit; re-measure before relying on it) |
| Classic per-expansion CategoryData files | **none** — Classic gets its expansion tree from `DataAddons/Shared/` |

> `.github/copilot-instructions.md` currently states that all first-party data is V2 and that V1 remains only for plugins. That is true for **achievement** data and false for **category** data. Correct it in Phase 3, not before — it should describe the end state, not the intent.

---

## Phase 0 — Decide the target format

**Blocking.** If ids or container shapes change after the migration starts, every file gets rewritten twice.

### 0.1 Stable ids, or keep auto-allocation?

Today most nodes have no declared `Id`; they draw from `nextCategoryId = 9000` in parse order. Two facts matter:

- **Churn is safe.** Nothing persists a category id. [`BrowsingHistory.lua:5-13`](../../BrowsingHistory.lua#L5-L13) documents this and actively deletes the pre-100.4 saved table. That comment is the clearest statement of the invariant in the tree.
- **But a per-client node needs a handle.** A Classic-only or Forever-only category cannot be attached into the Expansions tree by `tinsert`, `NewInjection` or deferral, because no node inside it has an addressable id. The 2026-09-20 audit called this the binding obstacle for per-client category content.

Decide whether V2 nodes take a declared, stable key. If Forever or Classic-specific categories are wanted, the answer is yes.

### 0.2 Container vocabulary for legacy expansions

`ExpansionBuilder` provides `:Character :Zones :Delves :Dungeons :Raids :Professions :PetBattles`, each callable once (`AssertUniqueContainer`). Legacy expansions need shapes it does not model — Legion's Class Halls, Artifacts, Invasions and Suramar; Draenor's Garrisons; Pandaria's Scenarios.

Either extend the typed containers, or accept generic `:Named()` chains for those. Pick one and apply it uniformly, so the files stay comparable.

### 0.3 What happens to V1

V1 stays. `Api/CategoryDataApi.lua` is the documented plugin entry point and third-party addons depend on it. The end state is *V1 supported, unused by first-party* — which is what the instruction file already wrongly claims today.

---

## Phase 1 — Build the verifier

Nothing in `DataAddons/` is edited in this phase.

### 1.1 Snapshot generator

Add `.claude/tools/headless/snapshot-categories.lua`, reusing the environment from `load-data.lua`. The headless runner already builds the category tree — it drives `RegisterCategoryDataTasks` and runs the task groups — so no new machinery is needed.

The name stubs are deterministic and encode the id, which is exactly what a snapshot wants:

```
GetMapName(123)          -> "MapName 123"
GetInstanceInfoName(456) -> "InstanceInfoName 456"
GetAreaPoiNameName(789)  -> "AreaPoiNameName 789"
GetDifficultyInfo(3)     -> "Difficulty 3"
```

So the snapshot records map and instance **ids**, not locale-dependent strings, and will not churn when Blizzard renames a zone.

**Key design rule: key nodes by path, not by id.** Ids are parse positions and *will* legitimately shift during migration. Id-keyed output would produce thousands of meaningless diffs and the snapshot would be ignored within a day. A path (`Specials > Promotions > BlizzCon`) is stable under id reallocation and sensitive to every real structural change.

Emit three sections per client. The tree alone would not have caught the 19-subtree bug, because a dropped node simply is not there to differ against a baseline that never had it:

| Section | Content | What it catches |
|---|---|---|
| **Tree** | ordered `Parent > Child > Leaf` paths, each with `CanMerge`, `TabName`, `IgnoreFilters`, `Tooltip`, and its ordered achievement ids | structure, sibling ordering, flags |
| **Orphans** | achievement ids belonging to no category, per client | the 19-subtree bug directly (it left ~79 Retail / ~29 Classic achievements uncategorized) |
| **Placements** | per-achievement category count | lost placements and accidental double-placement |

Sibling order is user-visible in the category list, so record children in order, never sorted.

### 1.2 Determinism gate

Run the generator five times and require byte-identical output **before** trusting any baseline.

This is a real risk, not ceremony. `KrowiAF.CreateCategories` parses the five known roots in a fixed order, but then iterates plugin category data with a bare `next`, which is unordered in Lua. Injections append children to a target, so sibling order could vary between runs.

If the output is not stable, fix that first. A flaky snapshot is worse than no snapshot, because it trains everyone to ignore the diff.

### 1.3 Commit the baseline

```
.claude/tools/headless/snapshots/CategoryTree.Retail.txt
.claude/tools/headless/snapshots/CategoryTree.Classic.txt
```

`.claude/` is already excluded from fsdeploy and from the release zip, so nothing here reaches players.

### 1.4 Lint rule

Add a `category-snapshot` rule to `.claude/tools/Check-Repo.ps1`: regenerate, diff against the committed baseline, and report a mismatch as an **error** with the diff printed. Model it on the existing `mapverifier` and `zone-decisions` rules, which shell out to a checker and translate its output through `Add-Finding`.

Follow the `Tests/` convention already used in this repo: the baseline is **Recorded** behaviour. An intended change is a reviewed diff committed alongside the code that caused it — never a silent regenerate-and-overwrite.

### 1.5 Prove the net works

On a scratch branch, re-introduce one of the nineteen broken nodes (swap a `{ name, true, ... }` back to `{ true, name, ... }`) and confirm:

- the snapshot diff **fails**, and
- the **Orphans** section grows by that node's achievements.

A verifier that has never failed is not a verifier. **This is the gate for leaving Phase 1.** Discard the scratch branch afterwards.

---

## Phase 2 — Migrate

One file per commit, smallest first, so the harness is proven on low-risk files.

1. `DataAddons/Classic/CategoryData_Events.lua` — smallest
2. The remaining `DataAddons/Classic/CategoryData_*.lua`
3. `DataAddons/Shared/**/CategoryData.lua` — **highest risk**, loads on every client
4. `DataAddons/Retail/01_Vanilla` … `11_TheWarWithin`, oldest first
5. `DataAddons/Retail/12_Midnight` is already V2 — leave it alone

For each file:

```powershell
# 1. migrate the file
# 2. regenerate both snapshots
# 3. require a ZERO diff
& ".claude\tools\Check-Repo.ps1" -ChangedOnly
& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\load-data.lua" "$PWD" Both
# 4. commit
```

A non-zero diff means either a migration error or an intended fix. **Both stop for review.** Never absorb a diff to make the run green.

Shared files must be snapshotted for **both** clients: they resolve differently on each, and a Shared category node can reference achievements that only one client registers.

---

## Phase 3 — Verify again

1. **Snapshot diff is zero** across both clients.
2. **`load-data ... Both` reports 0 problems.**
   Caveat: the headless runner `pcall`s every task, so it is strictly more forgiving than the game. A task that would halt the real load is merely reported here. Snapshot equality proves the parsed data is identical; it does not prove the game renders it.
3. **In-game pass** on one Retail and one Classic character. Deploy, `/reload`, and spot-check the Specials and Events tabs plus two migrated expansions. Then `Read-GameErrors.ps1`.

```powershell
& ".claude\tools\Deploy.ps1"
& ".claude\tools\Read-GameErrors.ps1"
```

4. **Correct `.github/copilot-instructions.md`** to describe the real state of the category format.
5. **Changelog.** The migration should be user-invisible; if the snapshot revealed and fixed a real tree defect, that part gets its own entry with a dev note.

---

## Risks

| Risk | Mitigation |
|---|---|
| Snapshot is nondeterministic, so diffs get ignored | Phase 1.2 gate, before any baseline is trusted |
| Snapshot passes but the game differs | Phase 3 in-game pass; the snapshot only covers what the parser produced |
| Target format changes mid-migration, forcing a second rewrite | Phase 0 is blocking |
| A real regression is absorbed as "intended" | Zero-diff rule; every non-zero diff reviewed, none auto-accepted |
| Shared file breaks the other client | Shared files snapshotted for both clients |

---

## Sequencing note

Phase 1 is worth building **whether or not the migration happens**. It is the same safety net the diagnostic channel in [`../data-design-review.md`](../data-design-review.md) §5.2 needs, and it is the only thing standing between this codebase and the next silent subtree loss.

This whole guide, however, fixes no currently-shipping user-visible bug. The 306 achievements mislabelled *Time Limited* on Mists of Pandaria Classic are fixed by milestone anchors (§5.1 of the review), independently of any of this. For the highest user-visible return first, run **Phase 1 → milestone anchors → Phase 2 and 3**.