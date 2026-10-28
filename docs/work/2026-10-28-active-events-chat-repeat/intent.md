# Intent: The "Active events:" chat line repeats with no event under it
Author: Krowi (maintainer), captured by Claude. Source: Krowi's own Retail client on 2026-10-28, in a raid, a screenshot and the chat log pasted into the session (not a GitHub issue). Status: accepted

## Problem
In a raid on Retail, chat filled with "Krowi's Achievement Filter - Active events:" 33 times within the minute 20:01, each time with no event listed under it, after which it stopped on its own. The lines buried the raid chat.

Krowi's settings that make the chat reminders run there: Event Reminders > Chat messages "On event start" shown, also in instances, and the refresh interval set to 1 second (the default is 60).

## Proposed outcome
- The "Active events:" line only ever shows with at least one event listed under it.
- A reminder never prints the same header again and again for the same event.

## Affected users and systems
- Players with chat reminders on ("On event start", "On login", "On reload"); chat reminders are off by default. Pop-ups print nothing to chat and are not affected visibly.
- Retail mostly: world and widget events, whose times come from the game's realm clock. Classic (Mists, Titan) has calendar events only.
- `Gui/EventReminder/AlertSystem.lua`; the saved records `KrowiAF_SavedData.ActiveEventChatMessagesShown`. No option or data file changes.

## Constraints
- Chat reminders that work today keep their text: the header, then one line per event with its time left.
- Built test first: a scenario in the `events` suite records the repeat before the fix.

## Open questions
- Which event it was, and whether the realm clock or a stale map POI made it look active past its end: answered as far as it matters in the spec; the fix does not depend on it.