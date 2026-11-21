# Spec: One WoW's Anniversary event with every anniversary's calendar id
Intent: [intent.md](intent.md). Status: done

## Requirements
1. Retail's event data has one Calendar row, WoW's Anniversary, whose ids are every WoW anniversary holiday the game database lists: 467, 484, 509, 514, 566, 589 (7th to 12th), 590 and its regional copies 1587 to 1590 (WoW's Anniversary), 693, 807, 808, 1181, 1225, 1262, 1397 (13th to 19th), 1500, 1509 and 1592 to 1595 (20th), 1501 (21st) and 1808 (22nd), each with a comment naming the anniversary and its year.
2. The row opens Events > WoW's Anniversary (category 1173) and is listed in Event reminders > Reminder events under the group the decision names; the 10th Anniversary row (`DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua`) is gone.
3. While the 22nd is on the calendar (until 2026-12-08), Retail shows exactly one reminder and one side button for it, named WoW's Anniversary, and the side button opens Events > WoW's Anniversary.
4. `L["WoW's Anniversary"]` has a translation in every locale file (esES, esMX, itIT and koKR lack one today); `L["WoW's 10th Anniversary"]`, which only the removed row uses, goes from every locale file.
5. A yearly check, in the form the decision names, says from 1 October to 31 December of year Y, while WoW's (Y - 2004)th Anniversary is not in the data, what is missing (the event row's id commented with year Y, the achievement) and how to find it (the PTR's holiday and achievement lookups). It needs neither the game nor wow.tools.local to say so.
6. The Registries snapshot's EVENT lines show the change: the 514 row replaced by the merged row; nothing else in the snapshots moves.

## Design
- **Calendar evidence** (Krowi's `/run` on Retail 12.1.5, 2026-11-21): today's calendar lists `1808 HOLIDAY WoW's 22nd Anniversary` and no WoW's Anniversary copy, though 590 and 1587 to 1590 carry the same 2026 window in the database. The calendar shows one anniversary id at a time, so one row with every id gives one reminder (the reminders keep one event object per id, `Features/EventReminders/Data/EventData.lua:54-73`, and only a listed id is active). The regional copies stay in the row because Krowi asked for every id and they cost nothing while hidden. They are hidden by the holiday, not by region: region 4 is EU (Winds of Mysterious Fortune's 1670 and Legion Remix's 1643, both region 4, start on EU's Wednesday reset), so 1587 is EU's copy, it carries the 2026 window, and Krowi's EU calendar still did not list it; one reminder holds in the other regions too.
- **The row** replaces the 10th's in `DataAddons/Retail/06_WarlordsOfDaenor/EventData.lua`, the file the anniversary row already lives in, with the ids ascending. Icon 133783 (the 10th's) stays. The name is `L["WoW's Anniversary"]`, the category's own name.
- **Saved settings:** the toggles are per id (`Features/EventReminders/EventOptions.lua:11-21, 55-63`): the toggle reads the row's first id and writes them all. No shape change and no migration; a player's stored value for 514 at most flips back to the new default, for an event that ended in 2015.
- **Yearly check:** an offline script, `.claude/tools/Check-Anniversary.ps1`, that reads the row's id comments and the achievement data's comments. From 1 October it prints what is missing for year Y, else nothing (or OK with `-Verbose`). It speaks where the decision says.

## Options considered
The yearly check:
1. **Recommended: the script, shown in two places that do not block.** `Get-RepoState.ps1` (through `.claude/repo-state.ps1`) shows one line from 1 October while the year's anniversary is missing, and the release preflight shows a `WARN` (`.claude/release-gate.ps1`). Both are already read at the start of work and before every release, and October always has a release.
2. The release gate fails from 1 October until it is in: a sure reminder, but it blocks an urgent fix while Blizzard has not put the anniversary on the PTR yet.
3. A Check-Repo rule: the Stop hook would show it in every session, harness work included, every turn of October.
4. A scheduled cloud routine that opens a GitHub issue every 1 October: visible on GitHub, but it cannot check the data, and it is a service outside the repo.

The group in Reminder events: **Holidays** (recommended: a yearly calendar holiday, next to Hallow's End and Winter Veil), or Other (where the 10th sat). On by default (recommended, as every holiday), or off by default (as the 10th was).

## Areas of concern
- Taint and secret values: none; data rows only. The calendar read is the existing cache (`Data/EventData.lua`), whose secret-value guard stays.
- Clients: Retail only; Classic's event data has no anniversary row. Mists' TOC line is untouched.
- Blizzard API changes: none.
- Other addons, plugins and skins: none; plugins add events through `KrowiAF.AddEventData`, unchanged.
- Saved variables and migrations: none (see Design).
- Localization: `L["WoW's Anniversary"]` into esES, esMX, itIT and koKR below `AUTOGENTOKEN`, then exported with `krowi:localization`; `L["WoW's 10th Anniversary"]` removed from every locale and from CurseForge.
- Embedded libraries: none.
- Data snapshots: the Registries snapshot's EVENT lines (requirement 6), regenerated and reviewed.
- Player-facing text: a changelog line under 106.0 Added.

## Verification
- Headless: `load-data.lua Both` loads with no new diagnostics; `snapshot-data.lua Both -write` and the reviewed diff; the `events` suite headless; `Check-Repo.ps1`.
- The check: run with today's date (prints nothing: the 22nd is in), and with a date in October 2027 (prints what is missing for the 23rd).
- In game, Retail: deploy, `/reload`, one WoW's Anniversary reminder and side button, the side button opens Events > WoW's Anniversary, the toggle sits under the decided group; the `events` suite in game; `Read-GameErrors.ps1` shows nothing new.

## Decision
Krowi, 2026-11-21:
- The yearly check: option 2, **the release gate blocks**. From 1 October to 31 December of year Y, `.claude/release-gate.ps1` fails while WoW's (Y - 2004)th Anniversary is not in the data, naming what is missing and the PTR lookups that find it; the rest of the year it passes. No Get-RepoState line.
- The toggle: **Holidays, on by default**.