# Intent: An "Until" version cutoff reads as obtainable until 2100
Author: Krowi (maintainer), captured by Claude. Source: error report (in-game screenshot, 2026-10-02). Status: done

## Problem
On Retail, the tooltip of I Can't Hear You Over the Sound of How Awesome I Am (5313, Bastion of Twilight, Cataclysm) reads "This achievement was temporarily obtainable Mists of Pandaria (pre-patch) (5.0.4) until the end of 2100/01/01 00:00." The range is wrong twice over: the achievement was obtainable from Cataclysm until the end of 5.0.4, and it is not obtainable now, but the sentence names 5.0.4 as a start and 2100 as an end. Release 101.0 changed this achievement's cutoff from `Before 5.0.5` to `Until 5.0.4`. Besides the tooltip, the achievement counts as currently obtainable again, so it shows in the Time Limited category and passes the obtainable filters, and the plugin skins colour it that way.

The same `Obtainable("Until", "Version", ...)` shape is on three more achievements: It All Makes Sense Now (11065, Retail Legion), and on Mists of Pandaria Classic Challenge Conqueror: Platinum (Season 3) (61991) and its Realm First! (61963), both added in 101.0.

## Proposed outcome
An achievement whose data says it was obtainable until the end of a patch shows that range in its tooltip: from its own patch until the end of the named patch. It counts as no longer obtainable once that patch is over and as obtainable while it lasts, on Retail and on Classic. A data entry that uses the words in an order the addon does not understand is caught before release instead of producing a wrong sentence.

## Affected users and systems
- Retail: 5313 (tooltip and obtainable state), 11065 (tooltip history only; its last record, Legion Remix, decides its state).
- Classic (Mists of Pandaria Classic): 5313 is a Shared entry, so the same defect shows there; 61963 and 61991 have a wrong tooltip sentence.
- Players who use the Time Limited category, the obtainable filters (Filters.lua) or the ElvUI and GW2_UI skins that colour by obtainable state.
- Plugins that register achievement data with `Obtainable` records through the public API (`KrowiAF.AchievementData`).
- No saved variables, options or localization strings are involved.

## Constraints
- The data decided in 101.0 stands: 5313 ends with 5.0.4 and 5.0.5 stays unregistered; the Mists Classic Season 3 achievements end with 5.5.4, whose next patch is unknown.
- Every existing `Obtainable()` form keeps behaving as it does today, on both clients and for plugin data.
- No taint risk: this is data-load code, nothing touches Blizzard frames.

## Open questions
- Fix the data (rewrite the four entries in a form the addon already understands) or teach the addon the form the data uses?
- Should a misplaced or unknown word in `Obtainable()` be reported by the data load, the way an unknown anchor function already is?