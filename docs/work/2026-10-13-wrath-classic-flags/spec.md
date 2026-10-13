# Spec: The Wrath Classic client gets its Classic behaviour back
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. On a client whose build starts with 3, `addon.Util.IsWrathClassic` and `addon.Util.IsClassicWithAchievements` are true. On 4, `IsCataClassic` and `IsClassicWithAchievements` are. On 5, `IsMistsClassic` and `IsClassicWithAchievements` are, as now. On Retail all four are false.
2. A copy of the fixed Krowi_Util replaces an older embedded copy of the same library, whichever addon loads first.
3. Every `addon.Util.Is*` the addon reads exists in Krowi_Util, checked on every turn.

## Root cause
- Krowi_Util `6ee1198` ("updated mainline to midnight", 2025-11-22) removed `lib.IsWrathClassic = major == "3"` and `lib.IsCataClassic = major == "4"`. It also set `IsClassicWithAchievements = lib.IsMistsClassic` (now `Libs/Krowi_Util/Krowi_Util.lua:18-24`).
- The addon kept its reads. A read of a missing field is nil, which raises no error, so nothing flagged it.
- The library kept its version (`Krowi_Util_2`, minor 3).

## Design
- **Krowi_Util `7ae5bc4`**, pushed to `main` on 2026-10-13 at Krowi's word:
  - restores both flags and the old `IsClassicWithAchievements = IsWrathClassic or IsCataClassic or IsMistsClassic`;
  - raises the minor version to 4, so this copy wins over an embedded minor 3;
  - adds a 2.7 changelog entry. Krowi releases it separately.
- **This addon:**
  - `Libs/Krowi_Util` moves to `7ae5bc4`;
  - a new always-on `Check-Repo` rule, `util-flags`, collects `lib.IsX =` and `function lib.IsX(` from `Libs/Krowi_Util` and fails on any `addon.Util.Is*` the addon reads that is not among them.

## Options considered
- **Restore the flags upstream (chosen).** One source of truth for every Krowi addon, as before November 2025.
- **Define the flags in this addon.** That writes into a shared library's table from one of its users, and the other Krowi addons stay broken. Rejected.
- **Drop 38002.** Krowi wants the client supported.

## Areas of concern
- **Taint:** none. These are plain booleans set at load.
- **Retail and Mists Classic:** unchanged. Their major versions are 12 and 5, so every flag keeps its value.
- **38002:**
  - Every branch on these flags runs again as it did before November 2025, including code that has changed since without being run on that client.
  - The Tutorial's old Wrath branch calls `InterfaceOptionsFrame:Hide()`, which the Classic UI no longer has. 2026-10-11-latent-bugs (#339) removes that branch, so #339 merges first.
  - Released blind, at Krowi's word.
- **Plugins and skins:** the ElvUI plugin's Wrath branches (`Plugins/ElvUI.lua:806,823`) run again on 38002.
- **Saved variables, localization, data snapshots:** none. The Wrath strings files load on the flag, as before.

## Verification
- `util-flags`, test first: before the bump it flagged the 24 reads, 22 of `IsWrathClassic` and 2 of `IsCataClassic`. After the bump it is quiet.
- Headless: every suite, both clients. The headless clients are Retail 12.x and Classic 5.x, so they show the flags unchanged there.
- In game: Retail and Mists Classic `/reload` with no new errors. 38002 has no client to test on.

## Decision
Krowi, 2026-10-13: "38002 should be supported, i have no way to test so we release blind = ok". The Krowi_Util change is committed and pushed by Claude and released by Krowi.