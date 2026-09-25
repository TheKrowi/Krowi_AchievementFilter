# Data design review — multi-client durability

Reviewed 2026-09-20 against `dev` at 8adbce4. Scope: the data layer only (`Api/`, `Objects/`, `Data/`, `DataAddons/`, and the offline tooling that validates it). The GUI is out of scope and is noted separately at the end.

Goal it is measured against: keep the data layer correct as Retail advances through Midnight, as Classic keeps re-releasing expansions with its own patch numbering, and as a third client family (Forever Realms) is added.

Every number here was measured against the tree or the local game DB; the commands are in the appendix.

## Summary

The data model is in better shape than its reputation. Duplication is largely solved: 2313 entries are Shared, and of the 63 achievement ids registered in both client trees only **2** are true duplicates — the other 61 diverge deliberately. The load pipeline runs clean (`load-data ... Both` → 0 problems, 8637 Retail / 2752 Classic achievements).

The problem is not duplication. It is that **one number — the patch version — is asked to be three different identities at once**, and that the data layer has only two error settings: silent skip, or fatal.

Three defects ship today, none of which any check catches:

| # | Defect | Scale | Status |
|---|---|---|---|
| 1 | Achievements mislabelled **Time Limited** on MoP Classic | **306** | fixed 2026-09-23 (Stage 3) |
| 2 | Category subtrees that **never load** | **19** (12 Retail, 7 Classic) | fixed 2026-09-20 |
| 3 | Shared version cutoffs resolving wrong on MoP Classic | **5** of 12 | fixed 2026-09-20 |

And one dated, certain breakage: `IsClassicWithAchievements` is `majorVersion == '5'`. **The day the Classic line ships major 6, every Classic gate in the addon flips to the Retail path.**

## 1. Root cause: one number, three jobs

`KrowiAF.GetBuildVersionId(major, minor, patch)` ([Api/BuildVersionDataApi.lua:5-7](../Api/BuildVersionDataApi.lua#L5-L7)) mints a bare 6-character decimal string — `"050400"`, `"120100"`. It carries no client and no timeline. That single string is then used as:

1. **Provenance** — "which patch introduced this achievement". Historical, identical on every client, and correctly a shared number. This is what the build-version *filter* wants.
2. **Timeline position** — "obtainable until patch Y". Client-relative, because each client sits at a different point on its own timeline. This is what `Obtainable` wants.
3. **Client identity** — `lib.IsMistsClassic = majorVersion == '5'` ([Libs/Krowi_Util/Krowi_Util.lua:20-21](../Libs/Krowi_Util/Krowi_Util.lua#L20-L21)) derives *which client am I* from the same number.

Jobs 1 and 2 are genuinely different concepts, and conflating them is what produces defects 1 and 3. Job 3 is what produces the dated breakage.

The model survives today only because Blizzard has so far chosen **disjoint minors** for the Classic re-releases — 3.4.x against historical 3.0–3.3, 4.4.x against 4.0–4.3, 5.5.x against 5.0–5.4. That is a Blizzard product decision, not an invariant this codebase enforces.

### Why the comparison is wrong, concretely

Obtainability resolves by **string-comparing `GetBuildInfo()` against the anchor** ([Data/TemporaryObtainable.lua:510-517, 586-592](../Data/TemporaryObtainable.lua#L510-L517)):

```lua
return self:GetCurrentVersionString() >= record.End.Value and "Past" or "Future"
```

MoP Classic reports **5.5.4** → `"050504"`, which sorts *above every Retail MoP anchor*. So a cutoff meaning "until Siege of Orgrimmar" (Retail 5.4.0) reads as already-past on MoP Classic from the first day of MoP Classic — while Classic is still in the Thunder King tier.

This generalises to every re-release, because a Classic re-release always numbers **above** the original expansion it replays.

Forever Realms makes it worse in the other direction: build **1.60.1** → `"016001"`, which sorts *between* vanilla and TBC. On Forever every Shared anchor at 2.0.0 or above will read "still obtainable", and every vanilla-era anchor will read "past".

## 2. Verified defects

### 2.1 — 306 achievements mislabelled "Time Limited" on MoP Classic

`GetObtainableState` returns `"Current"` for any end state that is not `"Past"` ([Data/TemporaryObtainable.lua:154-161](../Data/TemporaryObtainable.lua#L154-L161)), and the Time Limited special category enrols **every** achievement whose state is `"Current"` ([Data/SpecialCategories.lua:142-156](../Data/SpecialCategories.lua#L142-L156)).

Every Shared entry with a Retail cutoff above 5.5.4 therefore resolves `"Future"` → `"Current"` → Time Limited, with a tooltip reading *"up until the start of Version 9.0.1"*. Breakdown of the 306:

| File | Count |
|---|---|
| `Shared/03_WrathOfTheLichKing/AchievementData.lua` | 189 |
| `Shared/05_MistsOfPandaria/AchievementData.lua` | 104 |
| `Shared/04_Cataclysm/AchievementData.lua` | 9 |
| `Classic/*` | 4 |

This is the largest user-visible data defect in the addon. It is a direct consequence of §1.

### 2.2 — 19 category subtrees never load

Nineteen nodes are authored `{ true, <name>, { ids } }` — `canMerge` **before** the name. `ParseChildData` ([Api/CategoryDataApi.lua:36-80](../Api/CategoryDataApi.lua#L36-L80)) tests `IsNumber(childData[1])` (false for a boolean), then `IsString(childData[index])` with `index` still 1 (false for a boolean), then `#childData == 1 or IsNumber(childData[2])` (false). No branch matches, there is no `else`, and the node is dropped in silence along with every achievement under it.

Correct authoring is `{ <name>, true, { ids } }` — `ParseCategory` reads name first, then the boolean.

Affected: BlizzCon, Collector's Edition, Overwatch, StarCraft II, Heroes of the Storm, Warcraft III: Reforged, Warcraft Rumble, and Honor / Reputation / Raids / Dungeons nodes across `CategoryData_Specials.lua` and `CategoryData_Events.lua` on both clients.

### 2.3 — 5 Shared cutoffs wrong on MoP Classic

Twelve Shared entries carry Retail-MoP version cutoffs. Seven resolve correctly *by coincidence* (Classic has passed those tiers). Five are wrong today — all `Before 5.4.0`, i.e. Siege of Orgrimmar, which MoP Classic has not reached:

`7315` Eternally in the Vale · `8238` Cutting Edge: Lei Shen · `8249` Ahead of the Curve: Lei Shen · `8260` Cutting Edge: Ra-den · `8306` Hordebreaker / Darkspear Revolutionary

### 2.4 — The client predicates do not exist

`addon.Util.IsWrathClassic` and `addon.Util.IsCataClassic` are read in ~20 places across `Gui/`, `Options/` and `Plugins/`, and in `Libs/Krowi_Util/Options/Options.lua`. **Neither is defined anywhere.** `Krowi_Util` defines only `IsClassicEra`, `IsBCCClassic`, `IsMistsClassic`, `IsClassicWithAchievements`, `IsTheWarWithin`, `IsMidnight`, `IsMainline`. They have silently evaluated to `nil` since Wrath and Cata were dropped from the TOC, and nothing caught it.

## 3. Dated breakage

**`lib.IsClassicWithAchievements = lib.IsMistsClassic = (majorVersion == '5')`.** When the Classic line ships major 6, this goes false on a Classic client and every gate that depends on it takes the Retail path. This is not a risk; it is a date.

**Anchors waiting to invert.** 101 anchors at 6.0.2 and 140 at 7.3.5 sit in Classic-loaded files. They read "still obtainable" today only because Classic is below those numbers. Each flips the day the matching Classic re-release ships.

**`%02d` overflow.** `GetBuildVersionId` formats each component with `%02d`. Any component above 99 produces a 7-character id and silently corrupts every string comparison in the model.

## 4. Forever Realms — measured, not assumed

Build `1.60.1.69913` (`wow_classic_beta`) in the local game DB carries **233 achievements**:

| | Count | Consequence |
|---|---|---|
| Forever-exclusive | **192** (82%) | needs a `DataAddons/Forever/` tree |
| Already in the Shared tree | **40** | Shared is reusable |
| …of those, **divergent** | **3** | need a per-client override |
| Carrying a Legacy Point reward | **130** | needs a new `RewardType` member |

The three divergent ids are systematic, not random — Forever uses **pre-Cataclysm** world names:

| Id | Forever | Retail / Classic |
|---|---|---|
| 684 | Conqueror of the Lair *(Earn 1 Legacy Point)* | Onyxia's Lair (Level 60) |
| 750 | Explore The Barrens | Explore Northern Barrens |
| 781 | Explore Stranglethorn Vale | Explore Northern Stranglethorn |

**The existing placeholder safety net does not cover this.** `addon.GetAchievementInfo` returns a placeholder and sets `DoesNotExist` only when the id is *absent* ([Globals.lua:103-105](../Globals.lua#L103-L105), [Filters.lua:238-241](../Filters.lua#L238-L241)). Id 684 exists on all three families with different meanings, so the placeholder never fires and a Shared entry renders silently wrong.

37 of 40 is a good ratio. The design needs a way to express the 3.

## 5. The design

Four changes, in dependency order. The first two fix live defects; the third and fourth are what make a third family cheap.

### 5.1 Split provenance from timeline — milestone anchors

Keep the patch number as **provenance**. The `EE_PP_SS` table key, `achievement.BuildVersion`, and the build-version filter all keep their current meaning and their current persisted keys. No saved-variable migration is needed for this part.

Add a **milestone** as the vocabulary for **timeline position**. A milestone is a named content beat that every client reaches at its own patch:

```lua
-- data (Shared, one entry, correct on every client)
Ach(8306):Title():AutoFactionSplit(faction.Alliance, 8307):Obtainable("Before", "Milestone", "SiegeOfOrgrimmar")

-- Retail/05_MistsOfPandaria/BuildVersionData.lua
minor:Patch(0, addon.L["Siege of Orgrimmar"], "SiegeOfOrgrimmar")   -- 5.4.0

-- Classic/05_MistsOfPandaria/BuildVersionData.lua
minor:Patch(?, addon.L["Siege of Orgrimmar"], "SiegeOfOrgrimmar")   -- Classic's own SoO patch
```

Resolution: look the milestone up in **this client's** registered build versions, then compare as today. A milestone the client has not registered means the beat has not happened here — which is the correct answer, and is precisely the case the current model gets wrong.

**Why this and not client-tagged version anchors.** Tagging by client (`Obtainable(..., {5,4,0}, client.Retail)`) makes every new family touch every divergent entry — O(families × entries). A milestone is resolved by the client, so adding Forever costs one mapping table, not 320 edits. It also fixes defect 2.1 and the 241 pending inversions in one pass, because an unregistered milestone stops producing a spurious `"Future"`.

**Why a new key rather than reusing the patch name.** Classic's `BuildVersionData` registers *both* the historical Retail MoP patches and its own 5.5.x re-release, so the display name "Landfall" occurs twice within one client. The milestone key must be explicit and unique per client.

**Decision 2026-09-23, before implementing: the beat key is the Retail patch number, not a new name.** Every first-party anchor was written with a Retail patch in mind, so a `Version` anchor *already is* a beat name: "the content state Retail shipped as 6.0.2". What was missing is the other half, a declaration per client of which of its own patches reach that state.

**Revised 2026-09-25, before commit: the declaration is a flat table, not a flag on the patch registration.** The first implementation put it on `BuildVersionData` as `:Live()` (bare on every Retail expansion, `:Live({5, 4, 0})` on each Classic re-release patch). It worked but read backwards: you look up an anchor and ask "which patch here?", while the declaration sat on the answer and listed the questions; one word meant both "shipped on this client" and "stands for these Retail patches"; and the patch registry, which also drives provenance and the build-version filter, carried two kinds of patch told apart only by the flag. The same information now lives in one table per client, read in the direction you look it up, and `BuildVersionData` is back to registering patches only:

```lua
-- DataAddons/Classic/ContentTimeline.lua: Retail patch -> the patch where this client reached that content
KrowiAF.ContentTimeline = {
    ["5.2.0"] = "5.5.3", -- The Thunder King
    ["5.4.0"] = "5.5.4", -- Siege of Orgrimmar
}
-- Retail has no table: an anchor is its own patch
```

Resolution: `KrowiAF.ResolveVersionAnchor` returns the anchor's own registered patch when the client has no `ContentTimeline`, and otherwise the patch the table maps it to; every patch on the right-hand side also maps to itself, for Classic-only data that anchors on a Classic patch directly (`{3, 4, 3}`). `CreateBuildVersions` builds `addon.Data.ContentTimeline` from the table and asserts that every right-hand patch is registered. A hit compares the client's version against the resolved patch, as before. A miss means that content has not happened on this client: a start anchor reads "Future", an end anchor reads **"Unscheduled"**, and an achievement whose end is unscheduled is simply obtainable here with no end known, so it is not temporarily obtainable, not Time Limited, and its tooltip says so. The start an achievement gets implicitly from its own patch is "Past" on a miss, because the file placement already says the achievement exists on this client. The headless pipeline gave byte-identical output before and after the revision (Retail 0, Classic 330 anchors / 321 achievements with no end here). A Forever Realms client adds its own table and touches no other file.
Why this instead of the milestone names sketched above: the same O(patches per family) mapping table, no new vocabulary to invent for 31 distinct anchors, **no migration of the 330 data lines**, `"Version"` keeps its documented meaning for plugins, and the correspondence Classic's data already implied by reusing patch names ("Secrets of Ulduar" on 3.1.0 and again on 3.4.1) becomes an explicit, checkable declaration. The metric changed with it: an anchor that resolves on Retail but not on Classic is not debt, it is a beat Classic has not reached, so the loader reports it as information; an anchor that fails to resolve on Retail is an error, since Retail is the reference timeline the keys are drawn from. The `shared-version-anchor` lint rule from Stage 1 is retired, because the hazard it guarded against no longer exists: a Shared anchor on a major both families register now resolves per client through the declarations.

**Precedent in this repo.** [DataAddons/Classic/SeasonData.lua](../DataAddons/Classic/SeasonData.lua) already states the rule for seasons — *"Classic reuses Retail's season numbers for completely different real dates, so its anchors must be registered here and never in Retail's, even for achievements that live in a Shared data file."* The pattern is documented and structurally present, though it currently carries only one registration. This extends a proven shape rather than inventing one.

### 5.2 Fail loudly — a diagnostic channel

The data layer today has only silent skip or fatal `assert`. Every resolution site drops rather than reports: `if addon.Data.Achievements[id] then` ([Api/CategoryDataApi.lua:13](../Api/CategoryDataApi.lua#L13)), `tinsert(t, nil)` ([Api/ZoneDataApi.lua:14](../Api/ZoneDataApi.lua#L14)), and no `else` in either `ParseChildData` or `SetTemporaryObtainable`. That is how 19 category subtrees vanished with the lint reporting 0 problems.

Add a single collector — `addon.Data.LoadDiagnostics` — that every drop site writes to with file/line context, surfaced in debug mode and asserted on by the offline lint. The rule: **a drop is a data defect until proven intentional**, and an intentional drop is declared, not implied.

This is the highest-value change per line of code in the whole review. It is what would have caught defects 2.1, 2.2 and 2.3 on the day they were introduced.

**Done 2026-09-23.** `Data/LoadDiagnostics.lua` is the collector; every task group starts with a `SetSource` task so a report names its data file. Wired drop sites: category achievement lists and the V1 `ParseChildData` fall-through, zone lists, transmog set, custom criteria, tooltip and pet battle link data, event category binding, and `Achievement:SetTemporaryObtainable` (unknown anchor word, arguments matching no form, `Version` anchor on a build version this client never registers). The headless loader reads the table, keeps its registry proxy as a cross-check that fails on any unreported lookup (removing one `Report` call produces 537 findings), and counts the unregistered `Version` anchors per client as a warning: at first **7 on Retail, 331 on Classic**. The 7 Retail ones were anchors on patches no achievement was added in (5.0.5, 6.0.3, 7.1.5, 12.0.1), which had therefore never been registered; they are registered now, and the build-version filter lists only patches some achievement was added in (`BuildVersion.InUse`) so registering for an anchor alone adds no empty checkbox. **Retail is at 0, Classic at 330.** With Stage 3 the Classic number stopped being debt: those 330 anchors name Warlords-and-later beats Classic has not reached, and the loader now reports them as information, together with the count that matters, the achievements obtainable there with no end scheduled (321), which were the Time Limited mislabels. Debug mode prints the summary after login, splitting unregistered achievement references by whether the client knows the id.

### 5.3 Client family as a first-class value

Replace the boolean predicate soup with an explicit family, derived once and registered per data tree:

```lua
KrowiAF.Enum.ClientFamily = EnumUtil.MakeEnum("Retail", "Classic", "Forever")
```

Detection must **not** be a version-number test. `majorVersion == '5'` is the dated breakage in §3. Use `WOW_PROJECT_ID` where it distinguishes, and the TOC-declared family otherwise.

This also fixes §2.4 honestly: the ~20 dead `IsWrathClassic` / `IsCataClassic` reads become either a real family check or are deleted. They belong in `Libs/Krowi_Util`, which is a submodule — fix upstream, do not patch in-tree.

### 5.4 Per-entry client scoping, for fields only

Keep **existence** expressed by file placement — it is explicit, it matches how the client DB actually works, and it has the placeholder fallback. Add per-entry scoping only for **fields that differ** on an otherwise-shared entry:

```lua
Ach(684):Only(client.Retail, client.Classic)          -- not valid on Forever
Ach(158):HousingDecor(3894):On(client.Retail):IsPvP() -- reward differs, entry shared
```

Sized from the measurement: ~15 entries of the 61 divergent pairs differ in one field, plus the 3 Forever divergences. This collapses those into single entries with a visible link, instead of two independent copies that drift with nothing comparing them.

**What this deliberately does not do:** it does not introduce a shared-subset lattice. With three families a full subset model is 2^n−1 folders. Per-entry scoping avoids that by making the subset a property of the entry.

## 6. What I am not changing, and why

- **The flat `addon.Data.Achievements[id]` registry.** Only one client's files load per session, so cross-family id divergence is an *authoring* hazard, not a runtime one. The registry is fine. The hazard is handled by §5.4.
- **The `_S` suffix and the Shared/Retail/Classic folder split.** Measured: 2313 Shared entries, 2 true duplicates left. It is working. Forever gets a fourth sibling tree.
- **The task runner and loader prepend convention.** Ugly, but the load is clean and the ordering holds. Changing it buys nothing and risks the one part that demonstrably works.
- **The V1 category parser.** See §8 — it is not dead and must not be removed.

## 7. Plan

**Stage 1 — stop the bleeding (no API change, no migration). Done 2026-09-20.**
1. Fix the 19 `{ true, <name>, … }` nodes to `{ <name>, true, … }`.
2. Move the 5 wrong Shared cutoffs into per-client files; the Classic copy carries no SoO anchor until Classic's SoO patch is known.
3. Add lint rules: (a) a category node whose first element is a boolean; (b) a `Version` anchor in a Shared file whose major is registered by more than one family.

**Stage 2 — the diagnostic channel (§5.2). Done 2026-09-23.** Add the collector, wire the five known drop sites, make the lint fail on an undeclared drop. Re-run and triage whatever it surfaces. Surfaced: 7 Retail anchors on patches Retail never registered because no achievement was added in them (5.0.5, 6.0.3, 7.1.5 twice, 12.0.1 three times), fixed the same day by registering the patches, and the 330 Classic anchors that are the timeline problem itself.

**Stage 3 — milestone anchors (§5.1). Done 2026-09-23, in the amended form; declaration revised 2026-09-25.** `DataAddons/Classic/ContentTimeline.lua` maps the Retail patches Classic's 3.4.x, 4.4.x and 5.5.x reached (first done as `:Live()` flags on the patch registrations), 5.5.4 registered as Classic's Siege of Orgrimmar (the build adds only 18 hidden Challenge Mode rating trackers), the five Siege entries back in Shared, `KrowiAF.ResolveVersionAnchor` behind the state, tooltip and diagnostic code, no data line migrated.

**Stage 4 — client family (§5.3) and per-entry scoping (§5.4).** Prerequisite for the Forever tree.

**Stage 5 — Forever.** `DataAddons/Forever/`, 192 exclusive achievements, the Legacy Point reward type, the fourth `Files.xml`, and a `-Client Forever` mode in the tooling.

Stages 1 and 2 are worth doing whether or not Forever ever ships.

## 8. Corrections owed to the instruction files

- ~~**`.github/copilot-instructions.md` is wrong about the category format.**~~ **Resolved 2026-09-21: the migration was finished rather than the claim weakened.** At review time `KrowiAF.NewExpansion` appeared **once** in the entire tree ([DataAddons/Retail/12_Midnight/CategoryData.lua:5](../DataAddons/Retail/12_Midnight/CategoryData.lua#L5)) while all 11 other Retail expansions, all Classic and all Shared category files were V1 positional tables, so the 269-line V2 builder hierarchy served one file. All 21 first-party category files are now V2, each migrated behind a zero-diff category-tree snapshot, and the instruction file documents the V2 category format. V1 is untouched and still supported for plugins. See [`how-to/migrate-category-data.md`](how-to/migrate-category-data.md).
- **The stated support matrix is wrong.** `CLAUDE.md` and the instructions say Classic means "Wrath, Cata, Mists". The TOC ships `## Interface: 120100, 50504` — Retail 12.1 and MoP Classic only. The `[AllowLoadGameType wrath, cata, mists]` directives are vestigial.
- **`docs/category-data-reference.md:87`** contradicts the invariant that [BrowsingHistory.lua:5-13](../BrowsingHistory.lua#L5-L13) documents — that runtime-minted category ids must never reach a saved variable. BrowsingHistory is right; that comment is the clearest statement of the rule in the tree and should be promoted, not contradicted.

## 9. Out of scope — GUI skin vs client

Noted at the maintainer's request, not analysed. `Gui/FilesModern.xml` is bound to `[AllowLoadGameType mainline]` and `Gui/FilesClassic.xml` to `[wrath, cata, mists]`, so **skin is currently a TOC load condition, not an option**. Running a Forever skin on Retail, or offering a new design on any client, requires the GUI file split to become a runtime selection. That is a separate piece of work with its own risk profile and should not be bundled with the data-layer stages above.

## Appendix — how the numbers were produced

| Number | Method |
|---|---|
| 8637 / 2752 achievements, 0 problems | `.claude/tools/lua51/lua.exe .claude/tools/headless/load-data.lua . Both` |
| 2313 Shared / 5887 Retail / 230 Classic entries; 63 dual, 2 identical | chain extraction over every `AchievementData.lua`, compared per id |
| 320 anchors at unregistered versions; 306 Time Limited; 49 Past / 312 Future | `Version` anchor scan against each client's registered `BuildVersionData` ids |
| 19 dropped category subtrees | scan for `^\s*true,\s*$` followed by a name line in `CategoryData*.lua` |
| Forever 233 / 192 / 40 / 3 / 130 | `wow.tools.local` builds `1.60.1.69913`, `12.1.0.69875`, `5.5.4.69585` |

Supporting detail, including the nine dimension reports this review was distilled from, is in the audit run `wf_c3616276-cfd`.