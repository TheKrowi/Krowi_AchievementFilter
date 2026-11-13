# Intent: Opening the achievement window right after a reload gives no error
Author: Krowi (maintainer), found by accident during an in-game run on 2026-11-13. Source: in-game error. Status: accepted
Caused by fae45838 (2026-01-24, 93.5; committed to `main` without a PR)

## Problem
On Retail (12.1.5, `main`), pressing Y (Blizzard's Toggle Achievements binding) within about two seconds of a `/reload` opens the achievement window empty, with the event reminder buttons beside it, and BugGrabber records `Data/Data.lua:186: attempt to get length of field 'CurrentZone' (a nil value)` (x2 in session 643, 20:17:06). Pressing Y a few seconds later works normally. The same happens after a login, since the data loads after every login and reload. The player sees a Lua error and a broken window; whether the window fills itself in once the data is ready is not known yet. Mists (5.5.4) runs the same files; its BugGrabber log has no such error, so whether it happens there is not known yet.

## Proposed outcome
Opening the achievement window at any moment after a login or reload gives no Lua error. A window opened while the addon still loads its data shows what is ready and the full window once the data is ready, without the player closing and reopening it.

## Affected users and systems
Every player on every client with achievements (Retail, Mists, Wrath Titan) who opens the window, by Y, the micro button, a binding, a toast or a plugin, in the first seconds after a login or reload; more so on slower machines, where the data load takes longer. The achievement window's categories list, achievement list and summary, and the special categories (Summary, Watch List, Current Zone, Selected Zone, Search Results, Tracking, Excluded, Uncategorized). No options, saved variables or data files.

## Constraints
No taint change (no new hooks on Blizzard frames, no window opened from addon code); the data load at login stays as it is (task groups on a per-frame budget); the other clients keep working; plugins that select categories (`KrowiAF_SelectCategory`) keep working.

## Open questions
- Does the window recover on its own once the data is ready, or does it stay broken until it is closed and opened again?
- Does it happen on Mists?
- What the window should show while the data loads: what is ready (as before 93.5), or a loading notice.