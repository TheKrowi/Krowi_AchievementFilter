# Spec: The tab factory installs its hooks once, not once per tab
Intent: [intent.md](intent.md). Status: done

## Requirements
1. However many tabs `AchievementFrameTabButtonFactory:GetNew` creates (KAF's five, plus any a plugin adds), each of its hooks (`AchievementFrame_DisplayComparison`; `AchievementFrame_UpdateTabs` and `AchievementFrameBaseTab_OnClick`, or `PanelTemplates_SetTab` on Wrath) is installed exactly once.
2. One tab change runs the factory's `AchievementFrame_UpdateTabs` exactly once.
3. The hooks are installed at the same moment as today (the first `GetNew`, during `gui:LoadWithBlizzard_AchievementUI`), with `hooksecurefunc`; `onClick` starts as `Base_OnClick` as today.
4. Nothing else changes: tab look, window size, `GetTabs`, `Call_OnClick`, the comparison path.

## Root cause
`Gui/WindowFrames/AchievementFrameTabButtonFactory/AchievementFrameTabButtonFactory.lua`: `GetNew` stores the tab at `ourTabs[tabId] = button` (:60), with `tabId = AchievementFrame.numTabs + 1` (:47), so the first key is 4 (Retail, Mists: Blizzard's three tabs) or 3 (Wrath: two). It then guards the hooks with `if #ourTabs == 0 then` (:64). A table with no index 1 has length 0 in Lua 5.1, so the guard holds for each new tab until a rehash moves the integer keys into the table's array part, where `#` finds a border above 0.

Measured with the kit's Lua 5.1 and the real factory file under a minimal model (scratch harness, Blizzard's hook semantics):

| Blizzard tabs | KAF tabs | installs per hooked function | factory update runs on one tab change |
|---|---|---|---|
| 3 | 1 | 1 | 1 |
| 3 | 2, 3, 4 | 2, 3, 4 | 2, 3, 4 |
| 3 | 5 (KAF's own) | 4 | 4 |
| 3 | 8, 12 | 4 | 4 |
| 2 (Wrath) | 5 | 4 | 4 |

So with KAF's five tabs every hook is installed four times (the fifth `GetNew` sees `#ourTabs ~= 0` after the rehash), and each tab change runs the update body four times. The game runs a modified Lua 5.1; its table code is the stock one as far as known, but the exact count in game is to be confirmed by the in-game run of the scenario.

Blizzard's functions: `wow-ui-source\live\Interface\AddOns\Blizzard_AchievementUI\Mainline\Blizzard_AchievementUI.lua:364` (`AchievementFrame_UpdateTabs`), `:441` (`AchievementFrameBaseTab_OnClick`, which calls it first), `:245` (`AchievementFrame_DisplayComparison`); for Mists `wow-ui-source\classic\Interface\AddOns\Blizzard_AchievementUI\Cata\Blizzard_AchievementUI.lua:113`, `:166`, `:50`.

Effects today, none visible: the update body only sets sizes, anchors and `gui.SelectedTab`, so four runs end in the same state as one; the Statistics tab's `RefreshAchievementView` runs four times (on Mists, which has no `AchievementFrame_RefreshView`, it falls back to `AchievementFrame_ToggleView`, which flips the guild and personal look, Cata `:126`: four flips cancel out, one would not; found by the code review, see Design); the GW2_UI plugin's hook on the factory's method (`Plugins/GW2_UI/GW2_UI.lua:111`) runs four times; on Wrath the `PanelTemplates_SetTab` hook runs four times on every tab click in the whole interface.

## Design
A file-local flag beside `ourTabs`: `local hooksInstalled`, the guard becomes `if not hooksInstalled then hooksInstalled = true ...`. The block's content and position stay as they are. One line changed, one added.

Added after the code review (2026-11-13, requirement 4): `RefreshAchievementView` drops its `AchievementFrame_ToggleView` fallback. Run once, it would flip Mists into the guild look on every Statistics click; dropping it keeps the end state the four flips gave, so Mists' Statistics tab keeps the look it has, as before. Retail still calls `AchievementFrame_RefreshView`.

## Options considered
1. **(Recommended) A file-local `hooksInstalled` flag.** Says what it means, does not depend on table length or on the order of lines in `GetNew`, and stays right if `GetNew` ever runs again later (a plugin tab after load). Player sees: nothing different, the tab update runs once per click.
2. **Test `next(ourTabs) == nil` before the assignment at :60.** Same result, but correct only while the check stays above the assignment; easy to break in a later edit.
3. **Move the hooks into a function of their own, called once from `gui:LoadWithBlizzard_AchievementUI` after the tab loop (`Gui/Gui.lua:124-131`).** Cleaner split, but touches two files and moves the install from the first tab to after the last, a timing change this fix does not need.

## Areas of concern
- **Taint and secret values:** the hooks stay `hooksecurefunc` on the same functions at the same moment, three wrappers fewer each; no Blizzard global or frame field is written. `krowi:taint-reviewer` owed on the diff.
- **Comparison (out of scope, unchanged):** the hook on `AchievementFrame_DisplayComparison` is installed at `Krowi_AchievementFilter.lua:57` (phase 2), then `addon.OverwriteFunctions()` (`:68`, `Gui/BlizzardOverrides.lua:60`) replaces that global, dropping every wrapper. Today four dead wrappers, after the fix one; it still never fires, and `onClick` still never becomes `Comparison_OnClick`. Left for the separate comparison investigation.
- **Clients:** Retail 120105, Mists 50504 (the `AchievementFrame_UpdateTabs` branch), Wrath Titan 38002 (the `PanelTemplates_SetTab` branch); the flag covers both branches. Forever does not load KAF. Wrath has no local client and the headless model runs the Mists branch, so the Wrath branch is covered by the code reading only.
- **Blizzard API changes:** none; the hooked functions exist on every branch above.
- **Other addons, plugins and skins:** the GW2_UI plugin's hook on the factory's `AchievementFrame_UpdateTabs` runs once per click instead of four times (idempotent); EllesmereUI's hook on `GetNew` and its `GetTabs` read are unaffected; external skins see the same methods.
- **Saved variables, localization, embedded libraries, data snapshots:** none.
- **Player-facing text:** no setting or label changes. A changelog line under `### Fixed` is optional for an invisible fix; asked at the plan.
- **Class:** `fix/gui` (a hook on Blizzard functions in GUI code), so the plan gate asks.

## Verification
- **Permanent test (test first):** a scenario in the `navigation` suite (`Tests/Navigation.lua`, its model in `.claude/tools/headless/run-tests.lua` `suites.navigation`), which already loads the real `gui:LoadWithBlizzard_AchievementUI` and the real factory against a model of Blizzard's tab switching. The model gets KAF's real five tabs (today it builds only Achievements); the scenario opens the window on KAF's Achievements tab, then counts how often the factory's `AchievementFrame_UpdateTabs` runs while one Blizzard tab (Statistics) is clicked: `Recorded` 4, `Target` 1, then `Recorded` 1 after the fix. The same scenario runs in game. Details: `plan.md`.
- `Check-Repo.ps1 -ChangedOnly`; headless `navigation`, `earned`, `escape`, `plugins` on Retail and Classic.
- In game: the `navigation` suite on Retail and Mists before (GUI rule: green before the fix) and after the fix; `Read-GameErrors.ps1`. Wrath Titan has no local client.

## Decision
2026-11-13, Krowi:
- Intent: asked whether he knew and whether to fix it: "no, fix it."
- Design: option 1, the file-local flag set once the hooks are in: "ok".