---
paths:
  - "Settings/**"
  - "Options/**"
  - "Features/*/Options.lua"
  - "Plugins/**/Options.lua"
---
# A dropdown's choices

A dropdown saves a number, and players' saved files keep it, so the link between a number and its choice never moves. Krowi's standard since 2026-11-27, Blizzard's own (`Blizzard_SettingsDefinitions_Frame`: `container:Add(value, label)`, `SELF_CAST_SETTING_VALUES`):

1. **Every number is written once, by name.** The core's dropdowns in `addon.Enum` (`Settings/Enum.lua`), a feature's in its own `Enum` on its table, made in its registration file, which loads first (`addon.EventReminders.Enum`, `addon.Gui.RightClickMenu.Enum`). The default, the row's choices (`values = { [enum.X.A] = L["A"], ... }`) and the code that reads the setting (`Get("<key>") == enum.X.A`) all use the name; never a list numbered by position, never a bare number.
2. **A new choice takes the next unused number,** wherever it shows in the list; a number is never changed, reused or renumbered. The options window shows the choices in number order, or in the row's own `sorting` list (`Options/Window/Source.lua`, `GetValues`) when a later choice belongs between earlier ones.
3. **The texts are translated, the numbers are not:** the row's text comes from `addon.L` when the options load.

A removed choice keeps its number unused: a player who had it saved sees the dropdown empty until they pick again, so removing one needs a migration that moves it (`Settings/Migrations.lua`).

The `settings-choices` lint rule finds a setting compared with a bare number and a bare number default that is no slider's; the settings whose number is no choice of a fixed list (a weekday, an index into the tab list) are listed in it (`$settingsIndexes`, `.claude/tools/Check-Repo.ps1`). A slider's limits (Min, Max, Step) are in its declaration, never on the row.