# Options review: Event reminders

The review of every setting and help text of Event reminders' two sections, as agreed for every feature PR (`docs/backlog.md`, "For the feature split (106)"; `REVIEW.md`, Texts), with Pop Out's lessons (2026-11-11): a name and description that make sense in the section they are in, setting names in Title Case as Blizzard's Settings window writes them, a description that starts with a verb and says what changes, help text that reads the player's settings where it names one, plain words. Proposals only: Krowi decides at the look gate; nothing here is built until then.

## Event reminders section

| # | Row (where) | What it does | Name today | Description today | Proposal |
|---|---|---|---|---|---|
| 1 | Reminders | the registry's switch | Enable | Feature Switch Desc (shared) | keep |
| 2 | Reminders | upcoming holidays as reminders too (reload) | Enable Upcoming Calendar Events | "When disabled, the {upcomingCalendarEvents} Module if turned off." (broken) | **Upcoming Holidays**: "Also reminds you of holidays coming up in the next days." |
| 3 | Reminders | one time line instead of two, smaller pop-ups and side buttons (reload) | Compact | "Use a more compact version with only a single line of time display." | **Compact Reminders**: "Shows smaller reminders with one line of time." |
| 4 | Time display | first time line: end time or time left | Line 1 | (none, default only) | **First Line**: "Picks what the first line under an event's name shows." |
| 5 | Time display | second time line, greyed while Compact | Line 2 | (none, default only) | **Second Line**: "Picks what the second line shows. Compact reminders have no second line." |
| 6 | Pop ups for active events (grid) | on login, on reload, when an event starts × Show, In instances, Only with a time | (grid labels) | "Show / hide event {alertSystem} when joining the game." and 8 alike | labels keep; descriptions per cell, e.g. "Shows a pop-up for each event going on when you log in." / "Also shows them while you are in an instance." / "Shows them only for events whose end time is known." |
| 7 | Pop ups for upcoming calendar events (grid) | the same for upcoming holidays, two columns | (grid labels) | as row 6 | as row 6, "holiday coming up" for "event going on" |
| 8 | Pop up position | Every alert or Only event reminders | Position applies to | (clear) | **Position Applies To** (Title Case only) |
| 9 | Pop up position | new pop-ups stack up or down | Grow direction | "The direction in which new reminders will be added." | **Grow Direction**: "Picks whether new pop-ups stack upward or downward." |
| 10 | Pop up position | gap between pop-ups | Spacing | "...the default distance between tabs." (wrong: copied from the tab strip) | keep name; "Sets the gap between two pop-ups." |
| 11 | Pop up position | left/right, up/down from the bottom middle of the screen | X offset / Y offset | "The horizontal offset from the start position." | **Horizontal Position** / **Vertical Position**: "Moves the pop-ups left or right from the middle of the screen." / "...up from the bottom of the screen." |
| 12 | Pop up position | sample pop-ups to check the place | Show placeholders / Hide placeholders | long, "visual feedback of what the above settings do" | **Show Samples** / **Hide Samples**: "Shows sample pop-ups where real ones appear. Hover over one or right-click it to close it." / "Hides every pop-up showing or waiting, samples and real ones." |
| 13 | Pop up behaviour | at most this many at once | Max number of alerts | "The maximum number of alerts shown at once." | **Pop-Ups at Once**: "Sets how many pop-ups show at once; the others wait their turn." |
| 14 | Pop up behaviour | seconds before an ignored pop-up fades | Fade delay | "...Right clicking will close it immidiatly." (typo) | **Fade After**: "Sets how many seconds a pop-up stays before it fades. Right-click one to close it at once." |
| 15 | Chat messages (two grids) | as rows 6 and 7, as chat lines | (grid labels) | as row 6 | as row 6, "a chat line" for "a pop-up" |
| 16 | Timing | delay after login or reload before active-event reminders | Active Event Login Delay | "Delay the initial event pop ups when loging in." (typo, says pop-ups only) | **Delay for Active Events**: "Waits this many seconds after you log in or reload before reminding you of events going on." |
| 17 | Timing | the same for upcoming holidays | Upcoming Calendar Event Login Delay | same text as row 16 | **Delay for Upcoming Holidays**: "...before reminding you of holidays coming up." |
| 18 | Timing | seconds between refreshes | Refresh interval | long | **Refresh Every**: "Sets how often, in seconds, the reminders check which events are on. Longer means new pop-ups can come later." |
| 19 | Timing | side buttons beside the achievement window or the world map | Side Button Anchor | "The window the Side Buttons will attach to on the right side." | **Side Buttons Beside**: "Picks the window the side buttons sit beside." Also: it is no timing setting; proposal: move it under Reminders, after Compact. |
| 20 | Timing | how many days ahead holidays count as upcoming (reload) | Upcoming Calendar Event Days | "The number of days in advance to show upcoming calendar events." | **Days Ahead**: "Sets how many days ahead a holiday counts as coming up." |
| 21 | Date and time format | preset or own format, used by the reminders | Presets / Custom | (none) | keep; the formatting guide row keeps its text |

## Reminder events section

| # | Row | What it does | Today | Proposal |
|---|---|---|---|---|
| 22 | Event reminders (new, while the feature is off the only live row) | a line and a button to the switch (Krowi, 2026-11-12) | heading "Event reminders", line "Works only while Event reminders is on. Turn it on or off at the top of its own section.", row "Enable" with the button "Go to Event reminders" | as built; shown in game for the look |
| 23 | Holidays, Other calendar events, World events per expansion | one toggle per event, All/None per group | event names from the data | keep |

## Help pages

| # | Page | Today | Proposal |
|---|---|---|---|
| 24 | Event reminders, intro | "Holidays and world events get a reminder that pops up while they are on, and a button on the side of the achievement window." | names the window the player's Side Buttons Beside picks, read each time the page draws (Pop Out's lesson): "...and a button beside the {window}." |
| 25 | Event reminders, Time | "One or two lines with the end time or the time left; Compact shows one." | keep, with the new name: "...Compact reminders show one." |
| 26 | Reminder events | title "Which events", intro fine | keep |

## Decision