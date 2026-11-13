# Intent: remove the dead Collections key binding and option
Author: Krowi (maintainer). Source: idea; the from-scratch analysis (2026-11-13), then Krowi: "plan was to write an achievement window from scratch with full control, it never happened without AI, backlog, keybind should be removed for now." (2026-11-13); at the design gate: "delete keybind, hide option" (2026-11-13). Status: done

## Problem
Since 100.1 two leftovers of an experiment that never shipped reach players:
- The Key Bindings window lists, under Krowi's Achievement Filter, a row with the raw name `KrowiAF_OPEN_TAB_Collections_Achievements`: it has no translated name. A key bound to it opens Blizzard's Collections window on a seventh tab, which does not exist (Blizzard's window has six), so the window opens with no page and no title.
- The options window's Advanced section has an Experimental heading with one setting, "Collections Achievement Window", whose hover text in English is its raw key ("Collections Achievement Window Desc"). Switching it on does nothing: the code it switches on never loads.

Both were meant for an Achievements tab in the Collections window, an experiment that was never switched on.

## Proposed outcome
The binding row is gone from the Key Bindings window on every client, and nothing in the addon refers to the binding any more. The options window no longer shows the Experimental heading or its setting. The Collections experiment itself stays in the code, parked in the backlog.

## Affected users and systems
- Every client the addon loads on (Retail, Classic: Wrath, Cata, Mists): `Bindings.xml` and the options load everywhere.
- Players who bound a key to the row: that key stops doing anything.
- Players who switched the setting on: it was already doing nothing; its saved value stays in their profile and nothing reads it.
- Not affected: the other KAF bindings, the other Advanced settings (Debug), the dormant `Gui/Collections/` code.

## Constraints
- The other nine bindings and their names stay as they are.
- `Gui/Collections/` stays (Krowi: backlog), and so does what it reads: the `Experimental.CollectionsAchievementWindow` saved setting and its default.
- A profile that has the setting switched on keeps loading without an error.

## Open questions
None.