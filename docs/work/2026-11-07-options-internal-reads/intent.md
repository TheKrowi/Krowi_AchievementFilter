# Intent: KAF reads the options library through its public surface, or through `lib.Internal`
Author: Krowi, maintainer. Source: idea, from Krowi_Options' work item `Krowi_Libraries\Krowi_Options\docs\work\2026-11-06-finish-2-0` (phase 2, pull request TheKrowi/Krowi_Options#6), where Krowi decided on 2026-11-06 that the library's internals move under `lib.Internal` in 2.0 and KAF's tests follow, and on 2026-11-07 that KAF reads the reload text through the public `GetStrings()`. Status: accepted

## Problem
Krowi_Options#6 moves everything that is not its public surface under `lib.Internal`. KAF reads four names that move or are not public:
- `Tests/Options.lua`: `lib.CardColumns` (the `overview-cards` scenario's row count) and `lib.Tabs` (the `window-tabs` scenario);
- `Tests/Pictures.lua`: `lib.Frame` (it closes the options window before a scene);
- `Options/Window/Help/Help.lua`, player-facing code: `optionsLib.L["Requires a reload"]`. `L` is not in the library's public surface; `GetStrings().NeedsReload` is the same text.
Once KAF embeds the library with #6, `window-tabs` would report "no tab registry", `overview-cards` would error and the pictures suite would index a missing window.

## Proposed outcome
The three test reads go through `lib.Internal or lib`, which works with the library KAF embeds today and with the one in #6, so the two pull requests can land in either order and KAF's pointer can move at the library's release without a test change. The help's reload line reads `GetStrings().NeedsReload`: the same words in game on every client, with no dependence on a name the library never promised.

## Affected users and systems
- Krowi_AchievementFilter: `Tests/Options.lua`, `Tests/Pictures.lua`, `Options/Window/Help/Help.lua` (one line). Players see the same help text.
- Krowi_Options: its pull request #6 is the other half; this one does not need it merged.
- The library's submodule pointer in `Libs/` is not moved here.

## Constraints
- Same behaviour with the embedded library of today and with #6's: both are tested in game.
- The reload line reads the same text on every client and locale (the library's own translation, as before).
- KAF's headless `options` and `escape` runs and lint stay green; the in-game `options` (Retail and Mists) and `escape` (Retail) runs pass with both libraries.
- No `Libs/` edit, nothing released.

## Open questions
None.