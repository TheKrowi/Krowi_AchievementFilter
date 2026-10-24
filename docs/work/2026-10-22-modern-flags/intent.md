# Intent: Interface code branches on Krowi_Util's IsModern, not IsMainline
Author: Krowi (maintainer). Source: idea, 2026-10-22, after the update to Krowi_Util 2.8 and Krowi_Menu 2.2 (PR #355). Accepted by Krowi on 2026-10-22. Status: done

## Problem
KAF picks between Retail's and Classic's interface with `addon.Util.IsMainline`, the same flag it uses for Retail-only content. WoW Forever (16001, launching 2026-11-04) runs Retail's interface on a 1.x build, so there the two questions get different answers. Krowi_Util 2.8 added `IsModern` (Retail's interface: Retail and Forever) and `IsForever`, and Krowi_Menu 2.2 lets a menu builder use Blizzard's menus on any client with `config.modern`. KAF does not use them yet, so every interface branch would take the Classic path on Forever, and new code has no rule for which flag to use.

## Proposed outcome
- Code that branches on Blizzard's interface (frames, templates, atlases, menus, skins) uses `IsModern`; code that branches on Retail's content (data, saved data, events, categories) keeps `IsMainline`.
- Every Krowi_Menu builder is made with `modern = addon.Util.IsModern`.
- The instruction file says which flag means what.
- Nothing changes for players: on Retail and Classic `IsModern` equals `IsMainline`, and KAF still does not load on Forever.

## Affected users and systems
- No player on any client KAF loads on (Retail 12.1.5, Mists Classic 5.5.4, Wrath 3.8 China).
- Gui code: Blizzard overrides, world map button, filter button, search options button, reward preview, data manager, achievement button icons, the right-click menus, the tutorial menu in the options.
- Plugins: ElvUI, GW2_UI and EllesmereUI (their gates and anchors).
- The headless stubs (`client-env.lua`, `run-tests.lua`) and the `menu` suite, which mirrors the menu builder.

## Constraints
- No behaviour change on Retail or Classic: every changed line must evaluate exactly as before there.
- No TOC change: KAF does not claim 16001; Forever support is a separate work item.
- No taint change: the same hooks run on the same clients.

## Open questions
None: the scope was decided at the design question (spec.md, Decision).