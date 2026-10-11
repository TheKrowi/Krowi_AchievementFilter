# Intent: Achievement guides and waypoints
Author: Krowi (maintainer), captured by Claude. Source: idea. Status: done

## Problem
The addon tells the player which achievements exist, where they belong and whether they are still obtainable, but not how to do them. For "Legendary Research of the Ebon Blade" (60962, "Research all Death Knight Class Hall Upgrades.", reward the Replica Libram of the Dead decor) the maintainer knew the work happens at an NPC in the Death Knight class hall, but still had to look up on Wowhead which NPC it is and where it stands. A player who is new to Legion class halls also lacks the rest: how to reach Acherus, that the NPC appears only after the first class campaign steps, that there are seven tiers to research one after another, what each tier costs in Order Resources and how long it takes. Every such lookup takes the player out of the game into a browser, and the addon's own data (zone, category, reward) stops short of the step that gets the achievement done.

## Proposed outcome
For an achievement that has one, the player sees a short guide in the addon: what to do, where, and what it takes, in a few lines. Where the guide names a place, such as the NPC to talk to, the player can place a waypoint on that spot in game with one click and follow it with the game's own navigation, or with their waypoint addon. An achievement without a guide looks and behaves exactly as it does today.

This work item explores the feature on one achievement, 60962, and settles how guides and waypoints are stored, shown and maintained before any more are written.

## Affected users and systems
- Retail first: 60962 exists only on Retail (12.1.0.69933). Classic has no user-waypoint API or map pin in its UI source (5.5.4), so Classic support is a design question, not a requirement of this item.
- The achievements window (the achievement row and its expanded view, the right-click menu), the achievement tooltip, and possibly the world map.
- Data: a new kind of per-achievement data next to `TooltipData`, under `DataAddons/` and the data API in `Api/`, with its loader; the data snapshots.
- Localization: guide text is new player-facing text in every locale.
- Options: possibly a toggle to show or hide guides.
- Plugins: waypoint addons such as TomTom, if the design uses them; the plugin API, if other addons may supply guides.
- Saved variables: none expected.

## Constraints
- No new taint. Placing a waypoint calls Blizzard map APIs (`C_Map.SetUserWaypoint`, `C_SuperTrack.SetSuperTrackedUserWaypoint`, flagged `AllowedWhenUntainted` for secret arguments in 12.1.0) from addon code.
- An achievement without a guide is unchanged, and the achievements window keeps its layout for everyone.
- Guide data follows the data rules: one place per achievement, Shared/Retail/Classic, every drop reported to `LoadDiagnostics`, snapshots updated.
- The maintainer can keep it up: guide text must not turn into thousands of hand-written, hand-translated lines nobody can keep current.
- Coordinates are verified in game: NPC spawn positions are server-side, not in the client database, and the sources disagree (Wowhead lists Archivist Zubashi under "Broken Shore" without coordinates).

## Open questions
- Where does the player read the guide: the tooltip, the expanded achievement, the right-click menu, or a panel of its own?
- How is guide text written and translated: free text per locale, or structured steps built from names the game already localizes (NPC, map, item, currency) plus a short free-text tip?
- Which waypoint does a click place: Blizzard's user waypoint, TomTom when it is loaded, or both? What happens on a map where the game does not allow a user waypoint (Acherus is a micro map, `C_Map.CanSetUserWaypointOnMap` is unverified there), and on Classic?
- Who writes guides for the rest of the 8400 achievements, and is this first-party data only or also open to plugins?
- Should 60962's guide be shared by its siblings: the generic "Legendary Research" (11223) and the eleven other per-class "Legendary Research of ..." achievements, which differ only in the hall and the NPC?