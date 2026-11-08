# Intent: Features that switch off, proven on Reward preview (106, step 1)
Author: Krowi (maintainer). Source: idea; the feature-split grill of 2026-10-28/29 and 2026-11-01 (closed), started on 2026-11-08 after 105.0 shipped. Status: accepted

## Problem
KAF has grown too big to change safely (Krowi). A feature is not one place in the code but a trail through it. Reward preview, for example, lives in eleven places:

- its window, made from XML when the file loads, whether the player ever opens it: `Gui/RewardPreview/` (`KrowiAF_RewardPreview`);
- its data: `Api/RewardPreviewDataApi.lua`, `Data/RewardPreviewData.lua`, and the achievement data builder, which registers preview data while it tags a mount, pet or decor reward (`Api/AchievementDataApi.lua:67-93`);
- its row icon inside the shared icon factory (`Gui/WindowFrames/AchievementButton/AchievementButtonExtraIconFactory.lua:221-317`);
- its right-click menu entry (`Gui/RightClickMenu/AchievementMenu/RewardPreview.lua`);
- its six settings in the shared files `Options/Defaults.lua`, `Options/Layout.lua` and `Options/Window/Map.lua`;
- its help page and Show me scene (`Options/Window/Help/Help.lua`, `Help/ShowMe.lua`);
- the side-panel chain it shares with the guide panel, which closes the preview by name (`Gui/SidePanels.lua`, `Gui/Guide/Panel.lua`).

Nothing marks where one feature ends and the next begins, so a change to one can break another, and a player cannot turn a feature they do not use off: its frames, hooks and data are always there.

## Proposed outcome
For 106 as a whole: one addon, a core plus 15 features (Search, Browsing history, Achievement tooltip, Category tooltip, Chat link tooltip, Right-click menu, Pop Out, Reward preview, Achievement guides, Calendar, World map button, Criteria on units, Event reminders, Data Manager, Map Verifier), each in its own folder `Features/<Name>/`, each with a switch on top of its own options section. Turning a feature off asks for a reload; after it, the feature makes no frames, hooks, events, slash commands or data, its settings are kept, and its section stays visible and greyed out except its switch. Everything starts on, except where a player's existing setting already turns the feature off.

For this step, the proof of concept, on Retail and Mists Classic:

- Reward preview moves into `Features/RewardPreview/` and gets its switch.
  - With it on, the player sees exactly what 105.0 shows.
  - With it off and the game reloaded, rows show no preview icon, the right-click menu has no Preview Reward entry, and no preview window exists. The Reward preview section shows its settings greyed out under the switch, and its help page still opens.
- The core gains what every later feature needs: the feature registry (which starts only the features that are on) and the extension slots Reward preview uses (row icon, menu entry, options section, help page, side panel), which the core owns and which never name a feature.
- The proofs every later feature PR repeats:
  - a headless start check: files make nothing while loading, and the registry never starts a feature that is off;
  - a boundary lint: the core names no feature, and a feature names only the core, the slots and `KrowiAF.*` (Tests exempt);
  - an in-game off/on run on Retail and Mists;
  - the memory after login with the feature off and on, recorded without a threshold.
- The automatic run 106's release gate uses (all on, all off, each feature alone, on Retail and Mists, switches put back at the end; the addon reloads itself between steps), with this PoC's off/on run as its first user.
- The review of Reward preview's six options (what each does, its name, description and help text), as agreed for every feature PR (`docs/backlog.md`, "For the feature split (106)", PR #392).

The PoC holds when the four proofs are green on Retail and Mists, the automatic run included; when Krowi finds `Features/RewardPreview/` plus the registry and slots easier to change than today's trail; and when a written walk-through of Event reminders and the Right-click menu against the same slots shows they fit. If it holds, it becomes 106's first PR; if not, the spec changes and the PoC is redone. The order of the other 14 features is decided after it.

## Affected users and systems
- **Players** on Retail and Mists Classic who use Reward preview: the row icon, the right-click entry, hover and pinned preview windows, the choice-of-many chooser.
- **Options:** the Reward preview section gets a switch; its six settings (`Achievements.ShowRewardPreviewIcon`, `RewardPreviewMouseoverShow`, `RewardPreviewInvertVerticalRotation`, `RewardPreviewMaxIndividualIcons`, `RewardPreviewDefaultWidth`, `RewardPreviewDefaultHeight`) keep their saved keys. Every options-profile action ends with the reload prompt.
- **Saved variables:** a new per-profile switch value in `KrowiAF_Options`; no existing key moves. The automatic run keeps its plan in `KrowiAF_DebugTable`.
- **Data:** the reward preview data registered by the achievement data builder and through `KrowiAF.AddRewardPreviewData`; the data snapshots (`.claude/tools/headless/snapshots/`) record it today.
- **Shared code:** the row icon factory, the achievement right-click menu, the side-panel chain and the guide panel, the options window's section map, help and Show me.
- **Tests:** the `escape`, `pictures` and `guide` suites, and the headless runner's stubs, which pin or close the preview by name.
- **Other addons:** plugins that call `KrowiAF.AddRewardPreviewData`; the skins in `Plugins/` (ElvUI, GW2_UI, EllesmereUI); any addon that looks up `KrowiAF_RewardPreview` by name.
- **Tooling:** the repo lint (a new boundary rule), the headless pipeline, `Run-GameTests.ps1`, and the release gate.

## Constraints
- The grill's decisions are settled (closed 2026-11-01); this item applies them and reopens none.
- With the switch on, nothing a player sees or has saved changes.
- Public surface stays: `KrowiAF.*` (including `KrowiAF.AddRewardPreviewData` and `KrowiAF.Enum.RewardPreviewType`) and the `KrowiAF_*` frame names. A plugin's call into the API never errors while the feature is off.
- Taint: the preview window becomes a virtual template made at the feature's start; nothing is added to Blizzard frames, and every hook stays a post-hook.
- Settings move as the AceConfig tables they are; options stage 2 (KAF's own definition format, AceConfig gone) comes after 106, one feature folder at a time (Krowi, 2026-11-08).
- Strings stay in today's CurseForge namespaces; a renamed or added string goes into every locale file.
- Skins stay in `Plugins/`, one file per feature per skin.
- Tests stay in `Tests/`; test suites and Map Verifier are left out of the release zip.
- Delivery: everything in one version, 106, through many small PRs into `main`, with no release until all of it is in. This PR does not merge before the kit's release skill has its hotfix mode (an emergency fix meanwhile ships from a branch off the 105.0 tag).
- The data snapshots stay unchanged, or their reviewed diff is committed with the change.

## Open questions
- Where the switch is saved, and how a player's existing setting becomes the switch for the features that have one (Event reminders, World map button, Criteria on units, Browsing history), so the PoC's mechanism fits them later.
- How the achievement data builder's mount, pet and decor tags reach the reward preview data without the core naming the feature, and what a plugin's `KrowiAF.AddRewardPreviewData` call does while the feature is off.
- How the guide panel and the reward preview share the spot next to a row without naming each other.
- How the escape, pictures and guide suites behave with the feature off.
- How the automatic run survives its own reloads, and how `Run-GameTests.ps1` and the kit's input tool follow it.