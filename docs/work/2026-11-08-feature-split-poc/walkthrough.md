# Walk-through: Event reminders and the Right-click menu against the PoC's registry and slots

One of the PoC's three holds (intent.md): do the registry (`Features.lua`) and the slots (`Slots.lua`) that Reward preview uses fit the two features most tangled with the rest, before the order of the other 14 is decided? Read from the code on 2026-11-08 (file:line on this branch).

**In short:** the shape holds (a feature registers, starts only while on, reaches the core through slots, the core names it nowhere), and both features' switches and settings fit as they are. Five additions are needed, none of which changes what Reward preview did: two registry phases, a deferred options build, several sections and help pages per feature, and a menu opener slot. Event reminders also leaves its event data in the core, because the core's obtainability reads it.

## Event reminders

**What fits as it is**
- **The switch:** `Register{Switch = "EventReminders.Enabled"}`. The registry reads any saved path (`Features.lua` IsOn) and defaults it on, as today, so every player keeps their setting with no migration.
- **Starting at ADDON_LOADED:** the pop-up holder must exist before the login events Blizzard's alert container waits for (`Gui/EventReminder/AlertSystem.lua:193`), which `StartAll` comes before. Its own PLAYER_ENTERING_WORLD and Blizzard_Calendar listeners can be registered by its `Start`, so no registry phase is needed for those.
- **What moves into `Features/EventReminders/`:** `Gui/EventReminder/`, its own menu `Gui/RightClickMenu/EventReminderMenu/`, the scheduler, fixed schedules, observer and custom timers (`Data/EventScheduler.lua`, `EventSchedules.lua`, `EventObserver.lua`, `Custom*EventTimers.lua`), `Options/EventReminders.lua` and its defaults (`Options/Defaults.lua:187-270`), the events and eventlist help pages and Show me scenes, the active and upcoming part of `Data/EventData.lua` (`:123-337`).
- **No calendar slot, tooltip-line slot or event-data slot:** the addon's Calendar uses only `C_Calendar` (`Gui/Calendar/MonthCursor.lua:33-37`); the world map button and the minimap icon use no events.

**What stays in the core:** the event data pipeline and the calendar cache (`Api/EventDataApi.lua` AddEventData, `Objects/Event.lua`, the event tasks in `Data/Data.lua`, `DataAddons/*/EventData.lua`, `Data/EventData.lua:30-121`). The core's obtainability reads them (`Data/TemporaryObtainable.lua:170-189, 404, 460, 541-548`), and through it the obtainable state, a row icon, the Not obtainable tooltip and the special categories. Event reminders reads this core data; it does not own it.

**What a later PR adds**
1. **A registry phase after Blizzard_AchievementUI** (with the "already loaded at PLAYER_LOGIN" case and the run-once latch of `Krowi_AchievementFilter.lua:69, 103-105`): the side buttons anchor on the achievement window (`Gui.lua:107-109`).
2. **A late ADDON_LOADED phase, after the plugins load:** ElvUI and GW2_UI hook `SideButtonSystem.Load` and install their refresh inside it (`Plugins/ElvUI.lua:795-803`); started before `LoadPlugins` (`Krowi_AchievementFilter.lua:41`), the skins would miss it. Or the skins move into `Plugins/<Plugin>/EventReminders.lua`, which the boundary rule already gives to the feature (ElvUI and EllesmereUI are one file each today).
3. **A deferred options build:** its event toggles are injected from the event data (`KrowiAF.InjectEventDataDynamicOptions`, `Krowi_AchievementFilter.lua:32`), whose files load after `Features/`, and their defaults must reach the AceDB before `Options:Load`. `AddOptions` builds Rows and merges Defaults at once today; it needs to run its builds after every file loaded, before `Options:Load`.
4. **Several sections with the window's own entry kinds, and several help pages:** the feature has two sections, events and eventlist, with Grid, Families, All/None, Retail-only and button entries (`Options/Window/Map.lua:204-269`); `AddOptions` makes one section with one plain group, and a second `AddHelp` call overwrites the first.
5. **Two core touches:** the core's obtainability reads the feature's date format setting `EventReminders.DateTimeFormat` (`TemporaryObtainable.lua:399, 455`), which should read the tooltip's own (`Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat`, `:416`) or a core one; Data Manager reads the observer's log (`Gui/DataManager/Frame/FrameMixin.lua:57, 124`), which needs a Data Manager tab or log slot.
6. **Loading makes nothing:** the scheduler makes its frame at file load (`Data/EventScheduler.lua:43, 212`); it moves into `Start`. The PLAYER_ENTERING_WORLD timers that run today with reminders off (`Krowi_AchievementFilter.lua:129-140`) stop running at all.

## The Right-click menu

**What fits as it is**
- **The entry slot:** `Slots.AchievementMenu` already holds Reward preview's entry (Order 50) merged with the menu's own sections by Order; Guide (30) and Pop Out (40) fit it the same way when they move.
- **Settings and help:** its options (`Options/Layout.lua:1744-1785`, `Defaults.lua:108-114`, the rightclick section `Map.lua:157-164`, help `Help.lua:208-219`) fit `AddOptions` and `AddHelp` as they are; only the paths move.
- **The plugin hook** `KrowiAF.PluginsApi:AddAchievementRightClickMenuItems` stays core API (`Api/PluginsApi.lua:56-62`), called by the menu.
- **No category menu** exists (`CategoryButtonMixin.lua:23` handles no right button), so no second menu slot is needed.

**What a later PR adds**
1. **A menu opener slot**, for instance `Slots.AchievementMenu.Open(caller, achievement)`, set by the menu feature and doing nothing while it is off. Every opener calls `AchievementMenu:Open` by name today: the row's right-click (`AchievementButtonMixin.lua:167-169`), the row's menu button (`AchievementButton.lua:3-11, 64-78`), the objectives' mini rows (`AchievementsObjectivesMixin.lua:23-28`), Pop Out (`AchievementPopoutMixin.lua:87-90`), the chat-link tooltip (`FloatingAchievementTooltipMixin.lua:35-46`) and Show me.
2. **The row's menu button:** made at the row's OnLoad (reload setting `RightClickMenu.ShowButtonOnAchievement`); `RowIcons` is per achievement and pooled, so it does not fit. Simplest: the button stays in the core and calls the opener slot.
3. **Closing the menu from an entry:** Reward preview's, Guide's and Pop Out's entries call `AchievementMenu:CloseMenu()` by name (`Features/RewardPreview/MenuEntry.lua:22, 35`), a cross-feature name once the menu is a feature; `CloseMenu` only calls `menuBuilder:Close()`, and the builder is passed to every entry's `Add`, so each entry changes to `menuBuilder:Close()` in the menu's PR. Until the menu moves, naming it is a feature reaching the core, which the boundary allows.
4. **A slot hosted by a feature:** the menu feature would read `Slots.AchievementMenu`; `Slots.lua` says the core reads the slots. A line there that a slot's reader may be a host feature.

## What this means for the order of the other 14

The two registry phases, the deferred options build, the multi-section options and help, and the menu opener slot are each small, but each belongs in the core before the first feature that needs it: a core PR right after this one, or the first feature PR that needs it. Which of the other features need none of them is not checked here; each feature PR's own walk through its footprint says so.