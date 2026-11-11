# Intent: Pop Out as a feature that switches off (106, step 3)
Author: Krowi (maintainer). Source: idea; 106's feature split (docs/work/2026-11-08-feature-split-poc), the feature after Reward preview and the Right-click menu, chosen 2026-11-09. Status: done

## Problem
Pop Out (an achievement row in a small window of its own, kept across sessions, snapping to other Pop Outs) is a trail through the code like the two features before it:

- its frames and logic in `Gui/AchievementPopout/` (4 files, about 580 lines), loaded for every player, with a `PLAYER_LOGOUT` listener and a write into the saved data made when the file loads (`AchievementPopout.lua:36-40`);
- a call from the data load, `addon.Gui.AchievementPopout:Load()` (`Data/Data.lua:134`), which restores the Pop Outs of the last session;
- a modifier click on a row that opens one, by name (`Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:149-150`), with its modifier setting in the shared General options (`Options/General.lua:419-426`, `Options/Defaults.lua:88`);
- its menu entry, added to the core's menu slot when its file loads (`Gui/AchievementPopout/MenuEntry.lua`);
- Show me opening one by name (`Options/Window/Help/ShowMe.lua:256`);
- the settings in the shared files `Options/Layout.lua:1580-1730` and `Options/Defaults.lua:108-121`, its section in `Options/Window/Map.lua:157-167` and its help page in `Options/Window/Help/Help.lua:208-214`;
- the side panels (Reward preview, Guide) recognise a Pop Out by the shape of its frame (`Gui/SidePanels.lua:18`), and EllesmereUI's skin reaches it by name (`Plugins/EllesmereUI.lua:895-1010`).

A player who never uses Pop Out cannot turn it off.

## Proposed outcome
On Retail and Mists Classic:

- Pop Out moves into `Features/PopOut/` and gets its switch on top of its options section, like the two features before it.
- **With it on**, the player sees what `main` shows today: the Pop Out from a modifier click, the right-click menu entry and Show me; its size, position and snapping remembered as the settings say; the Pop Outs of the last session restored at login; its settings and help page.
- **With it off and the game reloaded**, a modifier click on a row opens no Pop Out, the right-click menu has no Pop Out entry, no Pop Out is restored, nothing of it is made, and no error is raised. Its settings are kept, and so are the Pop Outs saved in the last session, which come back when the switch goes on again.
- The modifier key (today in General) is shown in both places, as Blizzard does for a binding: in General's Modifiers group and in Pop Out's section. Both rows grey out while it is off and say that the Pop Out feature controls them, and each has a link button to the other place (Krowi, 2026-11-09).
- The review of its settings (what each does, name, description, help text; `REVIEW.md`, Texts), as agreed for every feature PR (`docs/backlog.md`, "For the feature split (106)", PR #392), with proposals put to Krowi at the look gate.

## Affected users and systems
- Every player of Retail and Mists Classic (the TOC's `## Interface:`); a Pop Out is a frame of the addon, not of Blizzard.
- Settings: the 13 under `Popout.*` and the modifier `Achievements.Modifiers.PopOut`; their saved keys stay, so no migration. A new key per profile, `Features.PopOut`.
- Saved data: `KrowiAF_SavedData.AchievementPopouts`, `LastPopoutPosition` and the two forensic logs (`PopoutLifecycleLog`, `PopoutHideDebug`) keep their names and shape.
- The core's slots and the registry (`Slots.lua`, `Features.lua`): this feature needs two hooks the first two did not: something that runs after the login data load, and something a modifier click on a row can ask.
- The other features that meet Pop Out: the right-click menu (the entry, and Pop Out rows opening the menu), the side panels of Reward preview and Guide (which close with their Pop Out), Show me.
- Other addons: EllesmereUI's skin of Pop Outs. No other plugin names them.

## Constraints
- Same boundary as the two features before it: the core names no feature, a feature names only the core, the slots and `KrowiAF.*`; loading the feature's files makes nothing.
- With the switch on, nothing a player sees or has saved changes.
- Public surface stays: the frame names `KrowiAF_AchievementPopout<id>` and its template, which EllesmereUI's skin and the tests reach.
- Taint: Pop Out only ever makes frames of its own on `UIParent`; nothing is added to Blizzard frames.
- Strings stay in today's CurseForge namespaces; a renamed or added string goes into every locale file in the same change.
- The data snapshots stay unchanged.
- Delivery: one PR into `main`, no release until 106 is complete.

## Open questions
- What runs the restore after the login data load without the core naming Pop Out: a registry phase, or a slot (the walk-through's "registry phase after the data load").
- How a modifier click on a row reaches Pop Out, and where the modifier setting lives while the feature is off.
- Whether the side panels' duck-typed test for a Pop Out becomes a field the feature sets on its own frames.
- Where EllesmereUI's Pop Out skin lives: the plugin's file, or a file of its own per feature per skin.
- The two forensic logs and the logout listener made at file load: where they start, and whether the first line of the log (written when the file loads, before the data integrity manager) can still be taken at `ADDON_LOADED`.
- How the in-game tests treat Pop Out while it is off (the memory suite reads its open Pop Outs; the pictures suite makes one).