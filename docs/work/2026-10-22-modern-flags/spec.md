# Spec: Interface code branches on Krowi_Util's IsModern, not IsMainline
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. Every `addon.Util.IsMainline` that chooses between Retail's and Classic's interface reads `addon.Util.IsModern` (list under Design).
2. Every `addon.Util.IsMainline` that chooses Retail content keeps `IsMainline` (list under Design).
3. Every `addon.MenuBuilder:New` call passes `modern = addon.Util.IsModern`.
4. The headless stubs define `IsModern` and `IsForever` next to `IsMainline`, so code that reads them headless never sees nil.
5. The instruction file's flag list names `IsModern` for Blizzard's interface and `IsMainline` for Retail content.
6. On Retail and Classic every changed line evaluates as before: the headless data snapshots are unchanged, every suite passes headless, and Retail and Classic show no new Lua error after a `/reload`.

## Design
The test per site is the question it asks: "does this client run Retail's interface?" (frames, templates, atlases, Blizzard's menus, a skin's look) or "is this Retail's game content?" (achievement ids, categories, maps, saved data, world events).

**To `IsModern`** (interface):
- `Gui/BlizzardOverrides.lua:32, 38, 49` comparison tabs and sub frame; `:78` chat-link wrapper around Retail's achievement buttons; `:159` hooks on `AchievementFrame_SetComparisonTabs` and `AchievementFrame_SetRestrictedMode`. Forever loads the `Mainline` Blizzard_AchievementUI (`wow-ui-source/forever/.../Blizzard_AchievementUI.toc`).
- `Gui/WorldMapButton/WorldMapButton.lua:24` Retail's world map frame.
- `Gui/WindowFrames/FilterButton/FilterButton.lua:23`, `FilterButtonMixin.lua:3` the modern dropdown mixins and Blizzard's menus.
- `Gui/WindowFrames/Search/OptionsMenuButton/OptionsMenuButtonMixin.lua:34` the click sound the modern button plays itself.
- `Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua:74, 208, 278, 291` atlases.
- `Gui/RewardPreview/RewardPreviewMixin.lua:162` an atlas.
- `Gui/DataManager/Frame/FrameMixin.lua:109` tabs on Retail's button frame template.
- `Plugins/ElvUI.lua:677`, `Plugins/GW2_UI/GW2_UI.lua:1018` an anchor offset against Retail's achievement frame; `GW2_UI.lua:16, 1110` and `Plugins/EllesmereUI.lua:15, 1047` the skin's Retail build. Each plugin also checks that its addon is loaded, so `IsModern` only says which build of the skin applies.
- `Tests/Menu.lua:87, 97` build the root menu the way the builder does, so they follow requirement 3.

**Stays `IsMainline`** (content):
- `DataAddons/Shared/CategoryData.lua:518-568`, `01_Vanilla/CategoryData.lua:37, 589`, `03_WrathOfTheLichKing/CategoryData.lua:494, 566`: Retail's "Legacy" suffixes and map ids.
- `Api/CustomCriteriaApi.lua:39`, `Data/SavedData/AchievementData.lua:12`, `Data/DataIntegrityManager.lua:144`: Retail achievement data and its saved copy.
- `Data/EventObserver.lua:239`: Retail world events.
- `Plugins/AchievementsTabFixes.lua:50, 55`: renames the Dragon Isles exploration category.
- The suites' `gameEnv.IsRetail()` and their Retail-only guards (`Tests/Escape, Events, EventSources, Guide, Memory, Navigation, Obtainable, Schedules, Tooltip, WorldMap`): they pick which client's recorded results apply. Forever will need its own recorded results, decided with Forever support.

**Menus:** the six builders (`Options/General.lua:69`, `Gui/RewardPreview/RewardPreview.lua:5`, `Gui/RightClickMenu/EventReminderMenu/EventReminderMenu.lua:6`, `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:6`, `Gui/WindowFrames/Search/OptionsMenuButton/OptionsMenuButtonMixin.lua:8`, `Gui/WindowFrames/FilterButton/FilterButtonMixin.lua:17`) get `modern = addon.Util.IsModern`. On Retail Krowi_Menu ignores it (the builder is the modern one), on Classic it is false, which is the default.

**Not in scope:** the TOC (`## Interface:` and the `AllowLoadGameType mainline` lines), a Forever data tree, and Forever's Legacy Challenges window. On Forever, `AchievementFrame_ToggleAchievementFrame` opens `LegacySystemFrame` instead of the achievement frame (`wow-ui-source/forever/Interface/AddOns/Blizzard_AchievementUI/Camelot/Blizzard_AchievementUI.lua:13`), so KAF's tabs need a design of their own there.

## Options considered
1. **Swap now, no Forever support (chosen).** The classification is made once while the reasons are fresh, new code gets the rule, and Forever support later starts from code that already asks the right question. It cannot be checked on Forever until KAF loads there.
2. **Wait for Forever support.** Each site would be checked on the Forever client as it changes. Until then new code keeps using `IsMainline` for both questions.
3. **Start KAF on Forever now.** Data stages 4-5, the TOC line and the Legacy Challenges question, aimed at the 2026-11-04 launch. A large work item; the swap would be part of it.

A lint rule that forbids `IsMainline` under `Gui/` was considered and left out: `Gui/` has no content sites today, but `Plugins/` mixes both kinds, and the instruction-file rule covers new code until Forever support shows whether a rule pays.

## Areas of concern
- **Taint and secret values:** none. The same hooks and overrides run on the same clients; only the flag's name changes.
- **Clients:** Retail and Classic evaluate every changed line as before (`IsModern = IsMainline or IsForever`, and `IsForever` is false there because `WOW_PROJECT_CAMELOT` is nil). Forever: KAF does not load.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** ElvUI, GW2_UI and EllesmereUI gates take the same values on Retail and Classic.
- **Saved variables and migrations:** none.
- **Localization:** none.
- **Embedded libraries:** needs Krowi_Util 2.8 and Krowi_Menu 2.2 (PR #355); this branch is stacked on it.
- **Data snapshots:** unchanged; no data file changes.
- **Player-facing text:** no changelog line, since players see nothing.

## Verification
- No scenario: there is no behaviour to record. The proof is that nothing moved: `snapshot-data.lua` and `snapshot-categories.lua` without `-write` report no difference, every suite passes headless on both clients, and `Check-Repo.ps1` is clean (its `util-flags` rule confirms `IsModern` exists in Krowi_Util).
- In game: deploy to Retail and Classic, `/reload`, `Read-GameErrors.ps1` shows no new KAF error; open the achievement window, the filter dropdown, the search options and a right-click menu on each.
- `krowi:taint-reviewer` on the diff, since it touches Blizzard overrides and hooks.

## Decision
Option 1, swap now without Forever support. Chosen by Krowi on 2026-10-22, at the scope question after the library update.