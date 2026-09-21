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

### 0.1 Stable ids — auto-allocation stays; addressability is opt-in, by string key

**Decided 2026-09-20. Numeric category ids stay auto-allocated and unstable. A node that something else needs to address declares a string `Key`; nothing else changes.**

Two measured facts set this up:

- **Churn is safe.** Nothing persists a category id. [`BrowsingHistory.lua:5-13`](../../BrowsingHistory.lua#L5-L13) keeps its records in a session-local table and actively deletes the pre-100.4 saved entry, documenting the invariant. Re-checked across `Data/SavedData/`, every `KrowiAF_SavedData` write and every `Options.db.profile` read: no other code path stores a category id.
- **But a per-client node needs a handle.** A Classic-only or Forever-only category cannot be attached into a tree a Shared file builds — by `tinsert`, `NewInjection` or deferral — because no node inside it has an addressable id.

So the requirement is addressability for *some* nodes, not stable ids for all ~1200. Hand-assigning a number to every node buys nothing that the migration needs and costs a second full rewrite; that is exactly the double-rewrite this phase exists to prevent.

```lua
local zones = expansion:Zones{ ... }:Key("MoP.Zones")

-- elsewhere, in a per-client file
KrowiAF.NewInjection("MoP.Zones"):Named(CT.Scenarios, { ... }):Register()
```

- `:Key(name)` records `node.Key`. `ParseCategoryV2` registers `addon.Data.CategoryKeys[name] = categoryId` and asserts the key is not already taken.
- `KrowiAF.NewInjection(target)` accepts a number — today's behaviour, unchanged for V1 and for plugins — or a string key.
- The numeric id remains auto-allocated, so [`BrowsingHistory.lua`](../../BrowsingHistory.lua)'s invariant is untouched and no saved variable changes. No `DataIntegrityManager` solution is needed.

**Why a string and not a hand-assigned number.** The numeric space is already shared by Blizzard's own category ids, the `nextCategoryId = 9000` auto range and `addon.Data.GetNextFreeCategoryId`. Assigning into it by hand needs a central registry nobody maintains, and a collision only surfaces as an `assert` at load. A string needs no registry, is self-documenting at the injection site, and cannot be mistaken for an achievement id in a positional V1 table.

**Why not path addressing** (`"Expansions > Mists of Pandaria > Zones"`). Category names are localized at runtime — `CT.*`, `addon.L[...]`, `GetMapName(uiMapId)`, `GetInstanceInfoName(journalId)`. A runtime key built from display names resolves differently per locale and breaks for every non-enUS player. Paths are still the right key for the **snapshot** in Phase 1, where the headless stubs are deterministic and locale-free — same word, different problem, different answer.

**Checked against Forever.** Adding `DataAddons/Forever/` then costs one `:Key()` on each Shared node Forever extends, plus Forever-side injections. It touches no Retail or Classic data and no other family's files, which is the O(1)-per-family property [`../data-design-review.md`](../data-design-review.md) §5.1 asks for.

**Migration impact: none.** A key is a one-line addition to an existing chain, added when something needs it. Phase 2 does not have to place keys, so this decision cannot force a rewrite.

### 0.2 Container vocabulary — the typed set is closed; one-offs use `:Named()`

**Decided 2026-09-20.** A typed `ExpansionBuilder` container exists when the container **(a)** recurs across expansions **and (b)** has a distinct child vocabulary the builder can express. Everything else is a generic `:Named()` chain.

Under that rule the current seven stay, unchanged, and nothing is added:

| Typed container | Child vocabulary that earns it |
|---|---|
| `:Zones` | `:Zone(uiMapId)` → `:Quests :Exploration :PvP :Reputation` |
| `:Raids` | `:Raid(journalId)` → `:Glory :Mythic` |
| `:Dungeons` | `:Dungeon(journalId)`, `:MythicPlus` |
| `:Delves` | `:Delve(areaPoiId)`, `:Seasonal` |
| `:Professions` | 13 named professions |
| `:Character`, `:PetBattles` | recur everywhere; plain nodes, but `AssertUniqueContainer` is worth having |

Legion's Class Halls, Artifacts, Invasions and Suramar; Draenor's Garrisons; Pandaria's Scenarios are one-offs with no child vocabulary, so they become `:Named(CT.ClassHalls, { ... })`. For those a typed method would buy only `AssertUniqueContainer` and a canonical name, while the builder grows one method per expansion forever for shapes that never recur.

> **Migration hazard — resolved 2026-09-20 by removing it from the API.** `:Named()` was **not** a uniform translation of a V1 node: `ZoneBuilder` overrode it to set `CanMerge = true`, so `:Named` meant one thing under a zone and another everywhere else. That also left a non-merging child of a zone — the Vanilla Hillsbrad Foothills `CT.PvP` node — impossible to express at all. The override is gone: **`:Named` never merges, on any builder**, and the merging shorthands are the typed helpers (`:Quests`, `:Exploration`, `:PvP`, `:Reputation` on a zone; the 13 profession helpers). Nothing in the tree called it, so the snapshot was unchanged.
>
> Two things this left standing, both found by the snapshot rather than by reading:
>
> - `ProfessionsBuilder` never overrode `:Named`. Only its 13 named helpers merge, so `CT.Archaeology`, which has no helper, needs an explicit `:Merge()` like any other node. The first Cataclysm attempt dropped that flag and the check caught it.
> - A zone can hold zones — Vanilla nests Stormwind City under Eastern Kingdoms — so `ZoneBuilder` now inherits `ZonesBuilder` and a nested zone is `easternKingdoms:Zone(84, { … })`, which neither merges nor flattens.

### 0.3 What happens to V1

V1 stays, per the maintainer's standing constraint. `Api/CategoryDataApi.lua` is the documented plugin entry point and third-party addons depend on it. The end state is *V1 supported, unused by first-party* — which is what the instruction file already wrongly claims today.

Concretely: the V1 branches of `ParseChildData` and `ParseCategory` are not removed or narrowed, `KrowiAF.NewInjection` keeps accepting a numeric target, and the `category-node-shape` lint rule stays — it guards the positional form for plugin authors and for any V1 node still in the tree. V1 already supports a declared numeric id in slot 1, so a plugin category is addressable without needing 0.1's string key.

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

> **Passed 2026-09-20**, on `scratch/verify-the-verifier`, against the BlizzCon node in `DataAddons/Retail/CategoryData_Specials.lua`. Three separate breaks were injected and each was reverted to green afterwards.
>
> | Injected break | `load-data Both` | `snapshot-categories -check` |
> |---|---|---|
> | `{ true, name, … }` — the original slip | **0 problems** (reproduces the blind spot) | fails: `- CAT Specials > Promotions > BlizzCon \| merge`, its 15 `ACH` lines gone, **Orphans 88 → 103** with `ORPHAN 411`, `ORPHAN 412`, … |
> | two achievement ids swapped | 0 problems | fails: *the same 2 lines in a different order*, naming line 11039 `was "… # 411", now "… # 412"` |
> | `canMerge` removed | 0 problems | fails: `- CAT … \| merge` / `+ CAT …` |
>
> The second and third are the migration's own risks rather than the original bug: `:Named()` reorders nothing by itself, but a hand-migrated chain can, and `ZoneBuilder:Named` sets `CanMerge` implicitly (see 0.2). The ordering case originally reported "0 lines gone, 0 new" — true but useless — and the reporting was fixed to name the moved positions before the gate was called passed.

---

## Phase 2 — Migrate

> **Done 2026-09-21.** All 21 first-party category files are V2, one per commit, each with a zero snapshot diff on both clients. 19,164 lines became 13,748. No V1 category data is left in `DataAddons/`; V1 itself is untouched and still supported for plugins.
>
> The files were produced by a text-level transpiler rather than retyped — 19,000 lines of hand transcription would have been the least reliable part of the whole exercise — and the snapshot is what makes that safe: the transpiler proposes, the zero-diff gate disposes. It is text-level because evaluating the tables as data would discard the inline `-- Achievement Name` comments, which are the data files' only documentation. The script is not committed; it is a one-off and the result is the deliverable.
>
> Four things the gate caught that review would not have, each fixed before the file was committed:
>
> | Caught | What was wrong |
> |---|---|
> | `CT.Archaeology` lost its `merge` flag | `ProfessionsBuilder` does not override `:Named`; only its 13 named helpers merge, and Archaeology has no helper |
> | ~700 Vanilla achievements became orphans | `addon.GetInstanceInfoName(559) .. (IsMainline and CT.Legacy or "")` was read as a plain instance call, because its parentheses balance even though the call closes early |
> | Three expansions failed to load | `local <var> = tmp:Named(...)` was missed by a substitution anchored to the start of the line |
> | The whole Midnight subtree vanished | a V2 tab root ignores its array part, so `NewExpansion` had to insert into `Children` — which is why the Expansions root was migrated last |
>
> Two API gaps surfaced and were closed first: a zone could not hold a zone (Vanilla nests Stormwind City under Eastern Kingdoms), and `ZoneBuilder:Named` merged implicitly, which made a non-merging child of a zone inexpressible. See 0.2.

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

> **Steps 1, 2, 4 and 5 done 2026-09-21. Step 3, the in-game pass, is done on Retail and still outstanding on Classic.**
>
> Offline state after the migration, unchanged from before it: snapshot zero diff on both clients, `load-data … Both` 0 problems (8637 Retail / 2752 Classic achievements), `Check-Repo` 0 errors with the same 6 pre-existing warnings, `escape` 23/23, `special` 27/27.
>
> **Retail, 2026-09-21:** deployed and reloaded, the restored Promotions / Realm First! / Darkmoon Faire nodes render and the tree looks right; `Read-GameErrors.ps1` reports 0 addon errors out of the 4 recorded.
>
> **Classic: not yet run.** Worth doing on its own rather than treating it as a repeat of Retail — 10 of the 21 migrated files load there (4 `DataAddons/Classic/*` and 6 `Shared/*`), Shared resolves against a different achievement set, and Vanilla's nested zones and the Cataclysm profession flags — the two cases that forced builder changes — are both Shared. Check `Read-GameErrors.ps1 -Client Classic` reports a log written *after* the reload; an older timestamp means the pass did not happen and a clean result means nothing.

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