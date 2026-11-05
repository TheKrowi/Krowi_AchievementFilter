# Intent: Krowi_Options becomes a normal library, with its own translations, before 105.0
Author: Krowi (maintainer). Source: idea, after creating the Krowi_Options projects and releasing 1.0 alpha (2026-11-04). Status: done

## Problem
The options window (`Krowi_Options/`) is a library in name only:
- It lives inside Krowi_AchievementFilter and is edited there. Krowi_Libraries\Krowi_Options (released as 1.0 alpha, CurseForge 1783244, Wago aN0a7A6j) holds a copy.
- It has no strings of its own. KAF passes it 22 texts in its config (`Options/Window/Window.lua:134`): 21 from KAF's locale files, translated on KAF's CurseForge project (413582), and "Requires a reload" from Krowi_Util. A second addon using the window would have to carry and translate them again.
- It cannot be embedded by two addons. The two-addon spike (2026-11-04, `docs/spikes/2026-11-04-krowi-options.md` on the local spike branch) found:
  - its 20 XML templates give an "already exists" warning from the second copy;
  - only one of its files is version-guarded, so two versions mix their code.

## Proposed outcome
- Krowi_Options is handled as the other libraries are: edited, translated, released and versioned in `Krowi_Libraries\Krowi_Options`, and embedded in KAF as a `Libs/` submodule. Krowi, 2026-11-04: "handle as the other libraries. i would strongly push to already moving the library outside of kaf and handle it as a normal library, might as well do it before a 105 release, there is no hurry and test everything trough."
- The window's texts are the library's, translated once on its own CurseForge project, with every translation made on KAF's project carried over.
- Two addons can embed different versions of it without warnings, and the newer one wins.
- Players of KAF see the same options window as today, in every language, on Retail, Mists Classic and Titan Reforged.

## Affected users and systems
- Every KAF player from 105.0: the whole options window (`/kaf`, the minimap icon, the filter menu, Settings > AddOns), in all 11 locales.
- KAF's TOC and `Libs/`, its options code under `Options/Window/`, its locale files, the `options`, `escape` and `pictures` suites and the headless runner, the repo lint (`Check-Repo.ps1`, `Check-Repo.globals`, `.luarc.json`), and the instruction files that describe `Krowi_Options/`.
- The `Krowi_Options` repo and its CurseForge and Wago projects; KAF's CurseForge project 413582.
- Later consumers (Krowi_ExtendedVendorUI).

## Constraints
- The window looks and behaves the same; Krowi judges that in game.
- No taint: the window draws inside Blizzard's Settings frame art and templates (`SettingsFrameTemplate`, dropdowns, sliders).
- No translation is lost on either CurseForge project; phrases leave KAF's project only through the sync's `-Delete`, from `main`.
- KAF 105.0 waits for this work; there is no hurry.
- A peer session plans two fixes in `Krowi_Options/` before 105.0 (the undo arrow that stays, the hover help that does not update).

## Open questions
- How the 20 templates become Lua and the 16 global mixins move onto the library (spec).
- The library's version after this change (spec).