# Spec: KAF reads the options library through its public surface, or `lib.Internal`
Intent: [intent.md](intent.md). Status: draft

## Requirements
1. `Tests/Options.lua` `overview-cards` reads the card column count through `lib.Internal or lib` (`CardColumns`), and `window-tabs` reads the tab registry through the same (`Tabs`); with the library's `lib.Internal` absent (KAF's embedded copy today) they read `lib` as before.
2. `Tests/Pictures.lua` reads the options window frame through `lib.Internal or lib` (`Frame`).
3. `Options/Window/Help/Help.lua` builds the overview's reload block from `optionsLib.GetStrings().NeedsReload`, not `optionsLib.L["Requires a reload"]`. The text is identical (`NeedsReload = L["Requires a reload"]` in `Krowi_Options.lua`).
4. Every scenario's recorded value is unchanged: `overview-cards`, `window-tabs`, `help-reload-line` pass with the same lines, headless and in game, with KAF's embedded library and with the one of Krowi_Options#6.
5. No other KAF file reads a library name that moves under `lib.Internal` (a search of KAF's code outside `Libs/` and `docs/` for `GetLibrary("Krowi_Options_2")` reads: `CreateWindow`, `GetStrings`, `Markup`, `WindowName` are public; the three above were the only others).

## Design
A local `Internal(lib)` helper where a file reads more than one internal, otherwise the expression `(lib.Internal or lib).Name` at the read. `Help.lua` calls `GetStrings()` once where it builds `help.overview` (at load: the library's strings are built from its locale files, loaded before KAF's files; `help-reload-line` proves it headless and in game).

## Options considered
1. **Read through `lib.Internal or lib` and the public `GetStrings()`** (recommended, Krowi's decisions of 2026-11-06 and 2026-11-07).
2. **Make `L` public and keep KAF reading it:** rejected by Krowi; `L` could then never change shape without a new major name.
3. **Delete the `overview-cards` and `window-tabs` reads:** `overview-cards` needs the column count to count rows; `window-tabs` is KAF's check that its tab is registered; both would lose coverage for no gain.

## Areas of concern
- **Taint and secret values:** none; the reload block is a plain string, read at load. **Clients:** Retail and Mists (KAF's TOC); the text comes from the library's locale files. **Blizzard API changes:** none. **Other addons, plugins, skins:** none. **Saved variables, data snapshots:** none. **Localization:** the help line shows the library's translation of "Requires a reload", as it did; no KAF string changes. **Embedded libraries:** none edited; KAF works with the copy it embeds and with the one in Krowi_Options#6. **Player-facing text:** unchanged.
- **Load order:** `GetStrings()` is called while `Help.lua` loads. If the library's strings were not ready then, the line would be empty or error; the headless run (the real library loaded first) and the in-game runs show it is not.

## Verification
KAF headless `options` and `escape`; `Check-Repo.ps1`; in game with the embedded library (KAF deployed from this worktree): `Run-GameTests.ps1 options, escape` on Retail and `options` on Mists; then with Krowi_Options#6's library deployed into KAF's folder (the library's `Deploy-TestAddon.ps1 -Consumers`, then KAF's own tool): the same runs. BugGrabber clean on all. A screenshot of the overview's reload line is not needed (`help-reload-line` compares the text).

## Decision
<Filled in at the gate.>