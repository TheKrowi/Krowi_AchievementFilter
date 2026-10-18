# Obtainability

How an `Obtainable()` record is written, how it becomes the state a player sees, and what that state does in the UI. Read it when you add a window or fix a wrong one. The rest of the achievement data format (reward types, faction splits, file layout) is in `.claude/skills/add-achievement-data/SKILL.md`.

The code: `Api/AchievementDataBuilder.lua` builds the records, `Objects/Achievement.lua` (`SetTemporaryObtainable`) parses them at load, and `Data/TemporaryObtainable.lua` (`GetObtainableState`) turns them into a state.

## Records

Each of these adds one record to the achievement, in chain order:

| Builder call | Record |
|---|---|
| `:Obtainable(...)` | the record as written (forms below) |
| `:PvE(n)` | `Obtainable("PvE Season", n)` |
| `:PvP(n)` | `Obtainable("PvP Season", n)`, and sets the PvP flag, so the PvP filter hides it |
| `:IsRealmFirst()` | `Obtainable("Once")`, and sets the realm-first flag; never write the `"Once"` yourself |
| `:Anniv20()` | `Obtainable("From", "Date", {2024, 11, 4}, "Until", "Date", {2025, 1, 7})` |

`:Weeks(first[, last])` narrows the season record right before it to a week range, for example `:PvE(18):Weeks(1)` for a week-one achievement. The weeks count from the season's registered start anchor (see Seasons below); without an anchor the whole season applies. Pass an explicit `nil` as `last` to run to the season's end.

**Only the last record decides the state.** The tooltip lists every record, but `Ach(20581):Teleport():PvE(14):PvE(15)` is Current, Past or Future by season 15 alone.

## Forms

| Form | Example | Window |
|---|---|---|
| `"Never"` | `Obtainable("Never")` | never obtainable |
| `"Once"` | added by `:IsRealmFirst()` | one player ever, so Past |
| During: `<anchor>, value` | `Obtainable("Version", {5, 5, 4})`, `Obtainable("Event", 324)`, `Obtainable("PvP Season", 38)` | from the start to the end of that one anchor |
| During, no longer obtainable: `<anchor>, value, false` | `Obtainable("Event", 1425, false)` | Past |
| Cutoff: `"Before"\|"Until", <anchor>, value` | `Obtainable("Before", "Version", {9, 0, 1})` | from the achievement's own patch to the anchor |
| Open start: `"From"\|"After", <anchor>, value` | `Obtainable("From", "Version", {11, 2, 7})` | from the anchor on; the code sets the end to the date 2100-01-01 |
| Window: `"From"\|"After", <anchor>, value, "Until"\|"Before", <anchor>, value` | `Obtainable("From", "Date", {2024, 7, 30}, "Until", "Date", {2024, 8, 26})` | between the two anchors; the anchors may differ, as in 15468: `"From", "PvE Season", 8, "Before", "Version", {10, 0, 2}` |

The anchors are `"Version"`, `"Date"`, `"PvE Season"`, `"PvP Season"`, `"Event"` and `"Reset"`. A record that matches no form is reported as `MalformedObtainable`, and an unknown anchor word as `UnknownAnchorFunction`. Both fail the headless data load.

Two consequences of the forms:

- **A cutoff always starts at the achievement's own patch**, the patch table it sits in. When the window opens later (a season achievement added one patch ahead of its season), the cutoff names the wrong start: use During or a Window. The Mists Classic Season 3 Challenge Mode achievements were added in 5.5.3 and can only be earned from 5.5.4, so they use `Obtainable("Version", {5, 5, 4})`.
- **An open start never ends.** Its end is 2100-01-01, so once it has started it stays Current and is listed under Time Limited for good. It is meant to follow an earlier window on the same achievement (`Ach(7944)`: a 6.0.3 to 7.0.3 window, then `From 11.2.7`), where it is the last record.

## States

`GetObtainableState` returns Past, Current, Future or nothing:

1. No record: nothing. The achievement is simply obtainable.
2. An empty `Obtainable()`, `"Never"`, `"Once"`, or a During record with `false`: Past.
3. Otherwise the start is checked first: not reached yet, Future.
4. Then the end: passed, Past. An end anchor this client has not reached (a Version anchor with no entry on its timeline, below) gives nothing: obtainable here with no end scheduled.
5. Otherwise: Current.

What each state does:

| State | Effect |
|---|---|
| Current | listed in the Time Limited summary category (`Data/SpecialCategories.lua`); hidden when the Current obtainability filter is off (`Filters.lua`, rule 3) |
| Past | hidden when the Past obtainability filter is off (rule 4) |
| Future | hidden when the Future obtainability filter is off (rule 5) |
| nothing | never hidden by those three rules, not Time Limited |

Each record also prints a line in the achievement tooltip (`Gui/AchievementTooltip/NotObtainable.lua`), newest first, up to the number of lines set in the options; with the date option on, a record with a known occurrence adds its dates.

## Anchors and their boundaries

The start words are `From` (inclusive) and `After` (exclusive), the end words `Until` (inclusive) and `Before` (exclusive).

| Anchor | Value | Start | End |
|---|---|---|---|
| `"Date"` | `{year, month, day}` | `From`: 00:00:00 of that day; `After`: 23:59:59 of that day | `Until`: through 23:59:59 of that day; `Before`: up to 00:00:00 of that day |
| `"Version"` | `{major, minor, patch}` | `From`: once the client is on that patch; `After`: once it is past it | `Until`: Past once the client is past that patch; `Before`: Past once it is on it |
| `"PvE Season"`, `"PvP Season"` | season number | see Seasons | see Seasons |
| `"Event"` | calendar event id | the start of the next cached occurrence | the end of that occurrence |
| `"Reset"` | `{year, month, day}` | the weekly reset nearest that date; the inclusion word changes nothing | same |

Dates are days on the realm's clock: the code shifts midnight by the difference between the realm's and the player's time zone (`KrowiAF_GetUtcOffsetSeconds` in `Data/EventData.lua`). `"After"` and `"Reset"` are supported but no data line uses them today.

### Versions per client

A `"Version"` value names the patch **as Retail shipped it**, on every client. `BuildVersionData.lua` only registers patches (provenance and the build-version filter). When each client reached a patch's content is a separate table. Retail has none: an anchor is its own patch. Classic looks it up in `DataAddons/Classic/ContentTimeline.lua`, which maps each Retail patch to the patch where Classic reached the same content (`["5.4.0"] = "5.5.4", -- Siege of Orgrimmar`), and every patch it maps to also stands for itself. `KrowiAF.ResolveVersionAnchor` does the lookup.

A Retail patch missing from the table means that content has not happened on this client. An end anchor then leaves the achievement obtainable with no end scheduled (so not Time Limited), and a start anchor reads as Future. The implicit start of a cutoff is the exception: it always counts as reached. Every anchor must resolve on Retail, the reference timeline: the headless data load fails otherwise, and counts the unresolved ones on Classic as information.

Never write a Classic version number in a Shared file; write the Retail patch and let Classic's `ContentTimeline` map it. A window that differs per client cannot stay in Shared: give the achievement an entry in both the Retail and the Classic file (5313 is `Until 5.0.4` on Retail and `Before 5.0.4` on Classic). Never round an anchor to a nearby patch either: register the patch the data refers to. The build-version filter lists only patches some achievement was added in, so an anchor-only patch adds no empty entry. The design and its rationale are in `docs/data-design-review.md` §5.1.

### Seasons

The game's season functions (`C_MythicPlus.GetCurrentSeason`, `GetCurrentArenaSeason`) report a season up to two weeks before it opens and keep reporting it up to two weeks after it closed. So a season side resolves in two ways:

- **With an anchor.** `KrowiAF.AddSeasonData(seasonFunction, number, startAnchor, endAnchor)` in a client's data registers the dates Blizzard announced for NA, per side (`Api/SeasonDataApi.lua`). Each client snaps an anchor to its own region's weekly reset nearest that date, and `:Weeks` counts from the start anchor. Retail and Classic reuse season numbers for different dates, so each client registers its own.
- **Without one.** The season function decides: `From n` has started once the current season is n or later, `After n` once it is past n; `Until n` has ended once the current season is past n, `Before n` once it is n or later. Between seasons (current season 0) the previous season counts instead.

On a client without `C_MythicPlus` the code makes the current and previous PvE season read as 99, so a PvE Season record without an anchor is Past there. Blizzard's Classic API documentation lists `C_MythicPlus.GetCurrentSeason`, so Mists Classic takes the normal path.

### Events

An event side uses the next occurrence the addon has cached from the in-game calendar, of the event itself or of one of its linked events (`LinkedEventIds` in the event data). **An event with no cached occurrence reads as Past**, on either side, so an event achievement shows as Past until the calendar has delivered its next occurrence. `"After"` and `"Before"` with an event always read as Past; use `"Event", id` (During) instead.

## PvP flag versus PvP season

`Obtainable("PvP Season", n)` and `:PvP(n)` are not interchangeable. `:PvP(n)` also sets the PvP flag, and the PvP filter hides every achievement with that flag (`Filters.lua`: `not _filters.Special.PvP and achievement.IsPvP`). A "Season N Master" achievement that needs both PvP and Mythic+ uses the `Obtainable()` form for both seasons, so it is not classified as PvP: `Ach(18027):Other():Obtainable("PvP Season", 35):Obtainable("PvE Season", 10)`. Its state follows the last record, PvE season 10. `:PvE(n)` and `Obtainable("PvE Season", n)` are the same record; keep both sides of such a line in the `Obtainable()` form.

## Checking a window

- **Headless data load** (`.claude/tools/headless/load-data.lua`): reports `MalformedObtainable`, `UnknownAnchorFunction` and a Version anchor that does not resolve, with file and line.
- **Data snapshot** (`.claude/tools/headless/snapshots/Achievements.<client>.txt`): each achievement's records as declared, as `obtainable=[...]`; `A=>B` shows where a Version anchor lands on that client. A data change shows there as a diff.
- **The `obtainable` scenario suite** (`Tests/Obtainable.lua`): the record each form stores, the state it gives and what the data load reports, headlessly and in game through `/kaftest obtainable`.
- **In game**: the tooltip lines and the Time Limited category show the state on the live client.