# Spec: The feature-boundary lint reads a call as a definition
Intent: [intent.md](intent.md). Status: done

## Requirements
1. A line that calls a name (`addon.X.Y(`, `KrowiAF_X(`) is not a definition of that name, for a feature's names and for the core-defined list alike.
2. A definition is still `function <name>(` or `<name> =` (not `==`) at the start of a line, for `addon.*`, `KrowiAF.*` and `KrowiAF_*` names, so every name the rule finds through a definition today it still finds.
3. Two features that call the same core function pass; a feature that names a `KrowiAF_*` global, an `addon.*` path or a frame another feature defines is still an error.

## Root cause
`Check-Repo.ps1:569-570` (feature names) and `:587` (core-defined list) on `main` (16e23cb7) match `^\s*(?:function\s+)?(<name>)\s*(?:=(?!=)|\()`: the optional `function` plus a `(` alternative makes a bare call at the start of a line match. Reward preview calls `addon.Features.Register(`, `AddDataFields(`, `AddHelp(` and `AddOptions(` at line start, so it "defines" them. The core defines them through a local alias (`function features.Register`), which the pattern does not see, so they are not in the core-defined list that would excuse them.

Reproduction on `main` (2026-11-09): a scratch `Features/Scratch/Scratch.lua` with only `addon.Features.Register({...})` gives two `feature-boundary` errors, "feature RewardPreview names 'addon.Features.Register', which feature Scratch defines" and the reverse (`RewardPreview.lua:18`, `Scratch.lua:4`).

## Design
Two patterns, used by all three matches:
- `$definesPath = '(?m)^\s*(?:function\s+((?:addon|KrowiAF)(?:\.[A-Za-z_]\w*)+)\s*\(|((?:addon|KrowiAF)(?:\.[A-Za-z_]\w*)+)\s*=(?!=))'`
- `$definesGlobal = '(?m)^\s*(?:function\s+(KrowiAF_\w+)\s*\(|(KrowiAF_\w+)\s*=(?!=))'`

`function` is required before a `(`; an assignment needs no keyword. The name is in group 1 or 2, so each match takes `Groups[1] + Groups[2]`. A comment above them says why.

## Options considered
1. **Require `function` before a `(` (recommended).** Exact for both forms the code uses; nothing found today through a definition is lost.
2. **Keep the pattern and exempt the registry's names** (`addon.Features.*`) in `Check-Repo.ignore`. Hides the symptom for those four names only; `KrowiAF_SelectAchievementFromID(id)` and any future call at line start would break the lint again.
3. **Add the core's alias definitions to the core-defined list** (resolve `local features = addon.Features`). Fixes the registry names, not a feature that calls another core global at line start.

## Areas of concern
- **Taint, clients, Blizzard API, saved variables, localization, libraries, data snapshots, player-facing text:** none; the change is in the repo lint, which never ships.
- **Other rules:** only `feature-boundary` uses these patterns.
- **Weaker check:** a definition the old pattern found is a `function` line or an assignment, both still found; only calls drop out (requirement 2).
- **Gate class:** `harness` (an existing line of the lint changes).

## Verification
- The scratch second feature (not committed): with the fix no `feature-boundary` error; with a line naming `KrowiAF_RewardPreviewMixin` added, one error for it (verified 2026-11-09: "feature Scratch names 'KrowiAF_RewardPreviewMixin', which feature RewardPreview defines").
- `Check-Repo.ps1` on the whole tree: clean.
- The Right-click menu branch, rebased onto this, passes `feature-boundary` with its two features.

## Decision
Krowi, 2026-11-09: option 1, count only what is created; the scope (a PR of its own, before the Right-click menu's) at that work item's design gate.