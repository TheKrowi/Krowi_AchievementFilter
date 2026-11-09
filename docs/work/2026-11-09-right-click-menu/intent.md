# Intent: The Right-click menu as a feature that switches off (106, step 2)
Author: Krowi (maintainer). Source: idea; 106's feature split (docs/work/2026-11-08-feature-split-poc), the feature after the Reward preview proof of concept, chosen 2026-11-09. Status: done

## Problem
The achievement right-click menu is the second trail through the code after Reward preview's, and the one other features plug into:

- the menu itself and its entries in `Gui/RightClickMenu/AchievementMenu/` (14 files): Wowhead, Go to (with its five parts: part of a chain, required for, other faction, other locations, first category), Guide, Pop Out, Transmog Sets, Xu-Fu's Pet Guides and More. Three of those belong to other features (Guide to Achievement guides, Pop Out to Pop Out, Xu-Fu's Pet Guides to Pet battle links); Preview Reward already comes in through the core's menu slot (`Slots.lua:56-63`);
- six places that open it by name: a row's right-click (`Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:169`), the row's menu button (`AchievementButton.lua:3-11, 64-78`, template `AchievementButton.xml:334`), the other-achievement rows under an achievement's objectives (`AchievementsObjectivesMixin.lua:27`), Pop Out's rows (`AchievementPopoutMixin.lua:89`), the chat-link tooltip (`FloatingAchievementTooltipMixin.lua:46`) and Show me (`Options/Window/Help/ShowMe.lua:244-249`);
- entries that close the menu by name, `AchievementMenu:CloseMenu()`: Guide, Pop Out, More and Reward preview's entry (`Features/RewardPreview/MenuEntry.lua:22, 35`), which reaches into the core today and would reach into another feature once the menu moves;
- its three settings in the shared files `Options/Layout.lua:1742-1782`, `Options/Defaults.lua:108-114` and `Options/Window/Map.lua:157-164`, and its help page (`Options/Window/Help/Help.lua:208-219`);
- the event reminder side button's menu, a different menu that shares the folder and the `addon.Gui.RightClickMenu` table (`Gui/RightClickMenu/EventReminderMenu/`).

A player who never uses the menu cannot turn it off, and every feature that adds an entry has to know the menu by name.

## Proposed outcome
On Retail and Mists Classic:

- The Right-click menu moves into `Features/RightClickMenu/` and gets its switch on top of its options section, like Reward preview.
- **With it on**, the player sees what `main` shows today: the same entries in the same order, the same plugin entries (Instance Achievement Tracker), the same ways to open it, and the row's menu button while its setting is on.
- **With it off and the game reloaded**, right-clicking an achievement row, an objectives row, a Pop Out row or the chat-link tooltip opens no menu, and rows show no menu button. Everything that has another way in keeps it: modifier clicks for tracking, chat links, the watch list, exclude and Pop Out; the guide and reward preview row icons. Wowhead, Go to, Transmog Sets and Xu-Fu's Pet Guides are only in the menu, so they are gone while it is off. The Right-click menu section shows its settings greyed out under the switch, and its help page opens with the "this feature is off" line and no Show me.
- The entries other features own (Guide, Pop Out, Preview Reward, Xu-Fu's Pet Guides) reach the menu through the core's slot. Neither the menu nor those features name each other, so each can move or be switched off on its own later.
- The core opens the menu without naming it.
- The event reminder menu leaves the menu's folder. It stays in the core until Event reminders is split, then moves into that feature (the grill: each menu belongs to the feature it serves).
- The four proofs of every feature PR, now covering two features: the headless start check, the boundary lint, the `/kaftest matrix` run on Retail and Mists (all on, all off, each feature alone), and the memory after login with the menu off and on.
- The review of the menu's three settings and its help text (what each does, its name, description and help text), as agreed for every feature PR, through REVIEW.md's Texts pass.

## Affected users and systems
- **Players** on Retail and Mists Classic who right-click achievements anywhere the addon shows them, or use the row's menu button.
- **Options:** the Right-click menu section gets a switch, saved per profile at `Features.RightClickMenu`. Its three settings (`RightClickMenu.ShowButtonOnAchievement`, `RightClickMenu.WowheadLink.AddLocale`, `RightClickMenu.WowheadLink.AddRelatedTab`) keep their saved keys. Achievement guides' "Show Guide in Right Click Menu" (`Achievements.Guide.RightClickMenu`) and Instance Achievement Tracker's "Add To Right Click Menu" stay with their owners.
- **Saved variables:** one new per-profile value in `KrowiAF_Options`; no existing key moves.
- **Data:** transmog set data (`KrowiAF.TransmogSetData`, `Api/TransmogSetDataApi.lua`) is read only by the menu's Transmog Sets entry (`GetUsableSets`, `Globals.lua:313`); the data snapshots record it. `addon.Data.RightClickMenuExtras` (`Data/Data.lua:25`) is read by nothing.
- **Shared code:** the achievement row (its OnLoad and click handler), the objectives' other-achievement rows, Pop Out's rows, the chat-link tooltip, the guide panel and Pop Out (whose entries close the menu), Reward preview's menu entry, the options window's section map, help and Show me.
- **Tests:** the `menu`, `guide`, `pictures`, `help` and `options` suites, and the headless runner's menu and guide models (`.claude/tools/headless/run-tests.lua:1177-1274`), which load the menu's files by path.
- **Other addons:** plugins that add entries through `KrowiAF.PluginsApi:AddAchievementRightClickMenuItems` (Instance Achievement Tracker, `Plugins/InstanceAchievementTracker.lua:35`); GW2_UI, which skins the row's `RightClickMenuButton` (`Plugins/GW2_UI/GW2_UI.lua:321-327`).

## Constraints
- The grill's decisions are settled (closed 2026-11-01), and the PoC's registry, slots and proofs are the pattern; this item extends them where the walk-through said the menu needs it (`docs/work/2026-11-08-feature-split-poc/walkthrough.md`, The Right-click menu) and reopens nothing.
- With the switch on, nothing a player sees or has saved changes.
- Public surface stays: `KrowiAF.PluginsApi:AddAchievementRightClickMenuItems` and its plugins, the frame names (`<row>RightClickMenuButton`, which GW2_UI skins). A plugin never errors while the menu is off.
- Taint: the menu is Krowi_Menu's (`addon.MenuBuilder`) as today; nothing is added to Blizzard frames.
- Strings stay in today's CurseForge namespaces; a renamed or added string goes into every locale file in the same change.
- The data snapshots stay unchanged, or their reviewed diff is committed with the change.
- Delivery: one PR into `main`, no release until 106 is complete.

## Open questions
- How the core opens the menu without naming it (the walk-through's opener slot), and what each of the six openers does while the menu is off.
- Where the entries of the features not split yet (Guide, Pop Out, Xu-Fu's Pet Guides) live until their own PRs, and which entries are the menu's own (Wowhead, Go to, Transmog Sets, More).
- Whether the row's menu button is the menu's (made only while it is on), and how a row the core builds gets it.
- Whether transmog set data becomes the menu's own data, loaded only while it is on, or stays in the core.
- Where the event reminder menu sits until Event reminders is split.
- The help page names Guide and Xu-Fu's Pet Guides: whether each entry brings its own help line, or the page stays as it is.
- Whether the known error of a menu opened on an achievement the addon does not register (`docs/backlog.md`, "From the right-click menu fix") is fixed here, where every opener goes through one place, or stays a work item of its own.