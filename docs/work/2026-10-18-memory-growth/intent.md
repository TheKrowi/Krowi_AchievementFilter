# Intent: The addon's memory no longer climbs while the player does nothing with it
Author: Krowi (maintainer). Source: observation in game, 2026-10-18 ("KAF seems to have a memory leak; the System broker shows ever increasing memory usage"). Status: done

## Problem
The Krowi System broker (Krowi_Brokers_System, its addon list sorted by memory or memory increase) shows Krowi's Achievement Filter's memory going up and up during a play session, also with the achievement window closed. A player who watches an addon memory display sees the addon as leaking. Whether it is a real leak (memory the addon keeps) or garbage the addon keeps making (memory the game frees again later, at the cost of extra garbage collection work and frame time) is not known yet.

## Proposed outcome
- With the achievement window and the addon's other windows closed, the addon's memory stays flat: whatever the addon does on its own in the background allocates nothing, or a small, known amount.
- An in-game test (`/kaftest`) measures what each of the addon's background jobs allocates and keeps, so the source is found by measurement rather than by guessing, the fix is proven by the same test, and a background job that starts allocating again shows up as a failing or open scenario. A headless version of the test runs on every turn, like the other suites.

## Affected users and systems
- Every player, on every client the TOCs list (Retail, Mists Classic and the other Classic clients): the background jobs run without any window open.
- Options > General > Enable taint diagnostics (on by default) and its saved data in `KrowiAF_DebugTable.TaintDiagnostics`; the event reminders (Options > Event Reminders, on by default) and their refresh.
- Memory displays that read `GetAddOnMemoryUsage`: the Krowi System broker, Blizzard's own AddOn list, and others.

## Constraints
- The taint diagnostics must keep recording the same data for issue #300 (the maintainer asks affected players for its export), and keep their design rule: no hooks, scripts or writes on Blizzard frames.
- No taint, no secret-value errors, no change to what the event reminders show.
- No saved-variable shape change unless a migration comes with it.

## Open questions
- Does a full garbage collection (left-click on the System broker) bring the addon's number back down? If it does, the climb is garbage, not a leak; the test answers this too. Answered in the spec: it does (122 MB of 187 MB was garbage).
- Should the taint diagnostics stay on by default, now that issue #300 has been open since 99.3? Answered in the spec: yes, #300 is still collecting exports; the probe is made free instead.