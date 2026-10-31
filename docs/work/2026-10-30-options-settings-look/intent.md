# Intent: Options window in the look of Blizzard's Settings, with a tab per Krowi addon
Author: Krowi (maintainer), captured by Claude. Source: idea (2026-10-30), from screenshots of Blizzard's Options window on Retail and Mists and the backlog entry "Explore: give the options window the look of Blizzard's own Settings window" (`docs/backlog.md`, merged as #378). Status: done

## Problem
The options window shipped in 105.0 (`Krowi_Options/`, docs/work/2026-10-25-options-revamp) uses a general Retail frame (`ButtonFrameTemplate`, `Krowi_Options/Window.xml:88`) on every client. It has a portrait, plain colour fills behind the navigation and the help pane (`Window.xml:101-111`), and its own navigation rows (`Window.xml:4-45`). Blizzard's own Options window, which every player knows, looks different on both clients:
- the title strip and Game/AddOns tabs on top, with the search box at the right;
- the category list under dark header bars, with the selected entry underlined in gold;
- a white page title with a red Defaults button and a rule under it, then gold labels with their controls in one column;
- a red Close button at the bottom right.

It is also KAF's window alone. Each Krowi addon has its own options: KEVU still has AceConfig pages in Settings > AddOns (`Krowi_ExtendedVendorUI/Options/`).

## Proposed outcome
- **The look.** The options window looks like Blizzard's Options window on each client: Retail's look on Retail, Mists' look on Mists. KAF's help pane on the right stays, since Blizzard's window has none.
- **Tabs on top, one per Krowi addon.** The tabs sit where Blizzard's Game and AddOns tabs are. Each tab holds that addon's sections, options and help. KAF is the first tab. KEVU is the next one, in a later work item that moves its options into this window.
- Each addon's own ways in (`/kaf`, the minimap icon, the filter menu, its Settings > AddOns page) open the window on that addon's tab.

## Affected users and systems
- Every client the TOC lists: Retail (12.1.5), Mists Classic (5.5.4) and Titan Reforged (3.80.2, China only, no local install).
- `Krowi_Options/` (the window, its rows, the controller `lib.CreateWindow`) and its one consumer today, `Options/Window/` (`Window.lua`, `Stub.lua`).
- The saved table `KrowiAF_SavedData.OptionsWindow` (position, size, help pane state, last section, seen sections).
- The `options` scenario suite (`Tests/`), the help pictures that show the window (`/kaftest pictures`), and the release gate's Retail and Mists runs.
- Later: KEVU and any other Krowi addon that embeds the window.

## Constraints
- **No taint.** The design-stage review in `docs/backlog.md` holds. The window never inherits Blizzard's settings list, category list, setting controls or keybinding templates, nor `UIPanelButtonTemplate`. It only uses the safe pieces and Blizzard's art by atlas name. Opening it must leave Blizzard's own Options window working: its highlight follows clicks, and nothing runs tainted.
- **No textures shipped.** The art comes from the game client by atlas or template name, so each client draws its own.
- **Options, saved settings and help content stay as they are.** This changes how the window looks and adds the tabs; it changes no option.
- Two addons that embed the window must share one window: the newest copy wins, as for every Krowi library.

## Open questions
- **Scope of this work item** (answered by Krowi, 2026-10-30). It covers the look and a window that can hold several addons' tabs, proven with KAF alone. Moving `Krowi_Options` into `Krowi_Libraries` so KEVU can embed it is the next work item.
- **With one Krowi addon installed** (answered by Krowi, 2026-10-30): a single tab shows, so the layout never shifts when a second addon arrives.
- **Where the shared window keeps its place and size.** Each addon has its own saved variables, and a library has none.
- **Search:** only the open tab, or every addon's tab?
- **The portrait:** Blizzard's window has none, so the addon's icon could go, or move onto its tab.
- **The old look:** keep it as an option, or replace it? Krowi judges the look in game, so the build shows both behind a temporary switch first.