# Intent: Event reminders as a feature that switches off (106, step 4)
Author: Krowi (maintainer). Source: idea; 106's feature split (docs/work/2026-11-08-feature-split-poc), the feature after Pop Out, chosen 2026-11-12 ("start on Event reminders next, learn from what we did with the other 3 features to cover everything"). Status: accepted

## Problem
Event reminders (pop-ups and chat lines for active world, widget and calendar events and for upcoming holidays, the side buttons beside the achievement window or the world map, and the list of events to be reminded of) is the widest trail of the 15 features, about 3700 lines over some 60 files:

- its frames in `Gui/EventReminder/` (pop-ups, side buttons and their own right-click menu, 9 files), loaded by the core from `Gui/Gui.lua:10-11` and again `:107-109` once Blizzard's achievement window exists;
- its event sources in `Data/`: Blizzard's event scheduler (`EventScheduler.lua`, which makes its frame when the file loads, `:43, 212`), KAF's fixed schedules (`EventSchedules.lua`), the watcher that learns the older events' starts every 300 s (`EventObserver.lua`), the two custom timer files, and the active and upcoming part of `EventData.lua` (`:123-337`);
- the login and reload reminders run from the core's `PLAYER_ENTERING_WORLD` handler (`Krowi_AchievementFilter.lua:113-141`), and the Blizzard_Calendar hook from its `ADDON_LOADED` (`:87-89, 97-98`);
- its settings: `Options/EventReminders.lua` (800 lines), its defaults (`Options/Defaults.lua:164-270`), the per-event toggles the public API injects from the event data at load (`Api/EventDataApi.lua:20-164`, `Krowi_AchievementFilter.lua:32`), and two sections of the options window, Event reminders and Reminder events, with grids, families and All/None buttons the feature registry cannot draw yet (`Options/Window/Map.lua:185-250`);
- its two help pages and their Show me scenes (`Options/Window/Help/Help.lua:254-269`, `ShowMe.lua:266-284`);
- the core reaching into it: the Not obtainable tooltip formats its Date lines with the reminders' date format (`Data/TemporaryObtainable.lua:399, 455`) while its other lines use the tooltip's own; the Data Manager's debug tab shows the watcher's log (`Gui/DataManager/Frame/FrameMixin.lua:57-127`);
- the skins of ElvUI, GW2_UI and EllesmereUI hook its pop-ups and side buttons by name, inside the plugins' own files (`Plugins/ElvUI.lua:698, 755-803`, `Plugins/GW2_UI/GW2_UI.lua:1039-1165`, `Plugins/EllesmereUI.lua:801-958, 1036`).

It already has an on/off setting (`EventReminders.Enabled`, needs a reload), but with it off the addon still makes the scheduler's frame and runs the login and reload timers.

## Proposed outcome
On Retail and Mists Classic:

- Event reminders moves into `Features/EventReminders/` and its existing Enable setting becomes the feature's switch, on top of its options, as for the three features before it. A player's current setting is kept: whoever turned reminders off finds the feature off.
- **With it on**, the player sees what `main` shows today: the pop-ups and chat lines on login, on reload and when an event starts, the upcoming holidays, the side buttons and their menu, both options sections, both help pages and their Show me.
- **With it off and the game reloaded**, nothing of it runs: no pop-up, chat line or side button, no scheduler frame, no login timer, no watcher, no calendar hook; no error. Its settings and the per-event choices are kept, shown greyed in both sections, and come back when the switch goes on again.
- The Not obtainable tooltip and the Data Manager keep working whether reminders are on or off.
- The review of its settings and help texts (what each does, name, description, help text; `REVIEW.md`, Texts), with proposals put to Krowi at the look gate, names and descriptions that make sense in the section they are in, help texts that read the player's settings where they name one, and a plain-text sweep (the lessons of Pop Out's look gate, 2026-11-11).

## Affected users and systems
- Every player of Retail and Mists Classic (the TOC's `## Interface:`; Wrath and Cata through `AllowLoadGameType`). On Mists the reminders cover the calendar's holidays only; world and widget events, the scheduler and the watcher are Retail's.
- Settings: everything under `EventReminders.*`, including the per-event toggles `CalendarEvents`, `WidgetEvents`, `WorldEvents`. The switch is the existing `EventReminders.Enabled`, so no migration and no new key.
- Saved data: the watcher's learned starts and its log in `KrowiAF_SavedData` keep their names and shape.
- The core's event data stays the core's: the event objects, the calendar cache and `KrowiAF.AddEventData` feed the obtainable state, the Not obtainable tooltip and the special categories whether reminders are on or off.
- The registry (`Features.lua`) and the slots: this feature needs parts the first three did not (the walk-through of 2026-11-08 listed them): a start after Blizzard's achievement window loads, a skin hook that works when the feature starts before the plugins, an options build that runs after the event data loaded, two options sections with the window's grid, families and button entries, two help pages, and a place for the watcher's log in the Data Manager.
- Other addons: the ElvUI, GW2_UI and EllesmereUI skins of the pop-ups and side buttons; the pop-ups' "follow another addon's alerts" mode for ElvUI, GW2_UI, EllesmereUI's mover and Dominos Roll.
- Tests: the popups, scheduler, schedules, events, sources, memory and pictures suites reach the reminders by name; the options and help suites change with the paths.

## Constraints
- Same boundary as the three features before it: the core names no feature, a feature names only the core, the slots and `KrowiAF.*`; loading the feature's files makes nothing.
- With the switch on, nothing a player sees or has saved changes, apart from what the options review changes with Krowi's approval.
- Public surface stays: `KrowiAF.AddEventData`, `KrowiAF.RegisterEventDataOptions`, `KrowiAF.EventSchedules`, `KrowiAF.Enum.EventType` and `EventSource`, and the `KrowiAF_*` frame names of the pop-ups and side buttons. A plugin's call into the API never errors while the feature is off.
- Taint: the pop-ups keep their own alert container (workspace rules, toasts); nothing new is added to Blizzard frames; hooks stay post-hooks.
- Event times keep Krowi's event-source policy (`.claude/rules/events.md`); the realm's clock stays the only clock.
- Strings stay in today's CurseForge namespaces; a renamed or added string goes into every locale file in the same change.
- The data snapshots stay unchanged.
- Delivery: no release until 106 is complete.

## Open questions
- ~~One PR or two~~: one PR, the registry's new parts and the move together, as Pop Out did (Krowi, 2026-11-12).
- Where the scheduler, the fixed schedules and the watcher hang once they move: `Features/` loads before `Data/`, which makes `addon.Data`, so they cannot keep the names `addon.Data.EventScheduler`, `EventSchedules`, `EventObserver`.
- Which date format the Not obtainable tooltip's Date lines use once the reminders' setting is the feature's: the tooltip's own (as its other lines), or a core one.
- Whether the Data Manager's event log tab is a slot the feature fills, and what it shows while reminders are off (no tab, as on Mists today).
- Where the skins live: a part file per plugin per feature (`Plugins/<Plugin>/EventReminders.lua`, the shape Pop Out gave EllesmereUI), which needs a part mechanism in ElvUI's and GW2_UI's plugin files too.
- What the public `KrowiAF.RegisterEventDataOptions` does while the feature is off (its toggles still show greyed, as the settings of a feature that is off do).
- The pop-ups' follow mode adds a subsystem to Blizzard's `AlertFrame` (`Gui/EventReminder/AlertSystem.lua:224`), which the workspace rules now forbid (`AlertFrame:AddQueuedAlertFrameSubSystem`, #188): left as it is in this move, or a work item of its own.
- How the in-game suites that drive the reminders treat the feature while it is off.