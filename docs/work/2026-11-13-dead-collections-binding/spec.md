# Spec: remove the dead Collections key binding and option
Intent: [intent.md](intent.md). Status: done

## Requirements
1. `Bindings.xml` has no `KrowiAF_OPEN_TAB_Collections_Achievements` binding; the other nine bindings are unchanged.
2. No file outside `docs/` names `KrowiAF_OPEN_TAB_Collections_Achievements` or calls `ToggleCollectionsJournal`.
3. The options window's Advanced section shows no Experimental heading and no Collections Achievement Window setting, on every client; its Debug heading and rows are unchanged.
4. The options table has no `General.args.Experimental` page any more, so no other surface that reads the table (AceConfig, `KrowiAF_GetOptions`) offers the setting either.
5. The saved setting `Experimental.CollectionsAchievementWindow` and its default `false` (`Options/Defaults.lua:178-180`) stay, so `Gui/Collections/Collections.lua:51` still reads a value when the experiment comes back, and a profile that saved `true` loads as before.
6. No locale string is added, changed or removed (see Areas of concern, Localization).
7. `Gui/Collections/` stays as it is.
8. The `options` suite stays green on both headless clients, with `options-fingerprint` moved by exactly the one option removed (Retail 415 to 414, Classic 311 to 310) and `every-option-mapped-once`, `no-empty-headings` and `defaults-restore-acedb` unchanged.
9. `docs/backlog.md` has a line for the parked Collections experiment, saying where it is and how to bring the binding and the setting back.
10. `_Packaging/Changelog.md` has player lines under 106.0, Fixed.

## Root cause
Commit `9de10d44` ("collections test", 2025-05-03, first shipped in 100.1) added the binding together with `Gui/Collections/` and the Experimental option, and added the include of `Collections\Files.xml` to `Gui/FilesModern.xml` already commented out (`Gui/FilesModern.xml:12`). The binding and the option went live while the tab they serve never did.

The binding:
- `Bindings.xml:29-31` runs `ToggleCollectionsJournal(7)`. Tab 7 was to be the tab `Gui/Collections/Collections.lua:29-44` adds, which never loads.
- Blizzard's Collections window has six tabs (`wow-ui-source\live\...\Blizzard_Collections_Bootstrap.lua:7-12`, the same on `forever`; Classic's `Blizzard_Collections.lua:19-23` lists five titles).
- `ToggleCollectionsJournal(7)` shows the window and calls `CollectionsJournal_SetTab(CollectionsJournal, 7)` (`Bootstrap.lua:14-33`), which sets the CVar `petJournalTab` to 7 from the addon's binding script and shows no page and no title for tab 7 (`Mainline\Blizzard_Collections.lua:3-7, 35-53`). The window's `OnLoad` reads that CVar back (`Mainline\Blizzard_Collections.xml:58`; Classic `Blizzard_Collections.xml:51`), so after the next reload the Collections window opens empty from Blizzard's own button too, until the player picks a tab. Classic's `ToggleCollectionsJournal` (`Blizzard_UIParent\Mists\UIParent.lua:468`, Cata `:457`, Wrath `:430`) behaves the same.
- No `BINDING_NAME_KrowiAF_OPEN_TAB_Collections_Achievements` is set anywhere (grep over the tree; the tab names come from `Api/TabDataApi.lua:192` for registered tabs only, and the Collections tab is not one), so the Key Bindings window shows the raw command name.

The option:
- `Options/General.lua:484-502` defines the page `experimentalOptions` with one toggle, `CollectionsAchievementWindow`, put into the General table as `Experimental` (`Options/General.lua:622`). The options window maps it under the Advanced section's Experimental heading (`Options/Window/Map.lua:207-209`).
- The only reader is `Gui/Collections/Collections.lua:51`, which never loads, so the toggle does nothing.
- Its strings are `true` in `Localization/enUS.lua:290-291`, so the description shows its key, "Collections Achievement Window Desc".

Reproduction: read from source, not seen in game (the client was not available to the design session). The `options` suite's `options-fingerprint` scenario reproduces the option headlessly (its Target moved to the count without it, open on the unfixed code); the in-game check below confirms the binding row before and its absence after.

## Design
1. Delete lines 29-31 of `Bindings.xml`.
2. **"Hide" the option = take it out of what the player can reach, keep what the dormant code reads.** Delete the `experimentalOptions` page (`Options/General.lua:484-502`) and its line `Experimental = experimentalOptions,` in the General table, and the Experimental heading of the Advanced section in `Options/Window/Map.lua:207-209`. Keep the default in `Options/Defaults.lua` and the saved values: AceDB keeps a profile's `true` as before, nothing reads it while `Gui/Collections/` stays unloaded, and the code reads a value again the day it comes back.
3. Locale files unchanged: the three strings the page used (`Experimental`, `Collections Achievement Window`, `Collections Achievement Window Desc`) stay with the parked experiment.
4. The backlog line and the changelog lines.

Backlog line (a new section in `docs/backlog.md`):
> ## From the dead Collections binding (2026-11-13, docs/work/2026-11-13-dead-collections-binding)
> - **The Collections Achievements tab is a parked experiment** (Krowi, 2026-11-13: an achievement window written from scratch with full control, backlog). `Gui/Collections/` (an Achievements tab in Blizzard's Collections window, from `9de10d44`, 2025-05-03) never loads: its include in `Gui/FilesModern.xml:12` is commented out. Its key binding and its Experimental setting were taken out in this work item and are in `9de10d44` if wanted back; the setting's default (`Experimental.CollectionsAchievementWindow`) and its three locale strings stay, and players who switched it on still have `true` saved. Taking it up again starts with its own work item.

Changelog lines (106.0, Fixed):
> - The Key Bindings window no longer lists an unnamed Collections binding, which opened an empty Collections window
> - The Advanced settings no longer show the Collections Achievement Window setting, which did nothing

## Options considered
Binding (Krowi: "delete keybind"):
1. **Delete the binding (taken).** The row disappears; git history (`9de10d44`) keeps it for the day the experiment comes back.
2. Comment it out, as the include is. Same for players, but leaves dead text in the file; git already keeps it.
3. Point it at something valid (Blizzard's Collections window without a tab). A binding Blizzard already offers (Toggle Collections), so no use.

Option (Krowi: "hide option"; the recommendation had been to leave it):
1. **Take the page and its heading out, keep the default and saved values (chosen for "hide").** Nothing shows, every `options` check keeps its meaning, a saved `true` is harmless.
2. `hidden = true` on the toggle, everything else kept. The window then draws the Experimental heading with nothing under it (`no-empty-headings` fails). Taking the heading out of the map as well leaves the toggle in the table but unmapped (`every-option-mapped-once` fails). Either needs a check weakened, which the playbook forbids.
3. Also delete the default and the strings. Breaks requirement 5: `Collections.lua:51` would index a missing table when the experiment comes back, and the translations would leave CurseForge on the next sync.

## Areas of concern
- **Taint and secret values:** the change removes a path that set a CVar (`petJournalTab`) from addon code; it adds none. Players whose `petJournalTab` is already 7 keep an empty Collections window until they pick a tab once; the addon does not reset it, since code that sets a CVar runs every `CVAR_UPDATE` handler tainted. Deleting an AceConfig page and a map heading touches no Blizzard frame. No secret values.
- **Clients:** `Bindings.xml`, `Options/General.lua` and the map load on every client in the TOCs; the toggle has no Retail mark, so it leaves the window on Retail and Classic alike (fingerprint 414 and 310).
- **Blizzard API changes:** none; `ToggleCollectionsJournal` is no longer called.
- **Other addons, plugins, skins:** none name the binding or `General.args.Experimental` (grep over the tree, `Plugins/` included).
- **Saved variables:** no shape change, no migration. `Experimental.CollectionsAchievementWindow` keeps its default; a saved `true` stays and is read by nothing. A section's Defaults button no longer resets it, which matters to nobody while it is unread. A player's own key bound to the removed command is the game's binding data: the game no longer shows the command, and the key does nothing (to confirm in game, Verification).
- **Localization:** no string added, changed or removed. The binding has no `BINDING_NAME_` and no text in any locale file. The page's three strings stay unused in the locale files (translated in part: deDE, frFR, koKR, ruRU, zhCN and zhTW have some of them) for the parked experiment; no lint rule flags unused strings.
- **Embedded libraries, data snapshots:** none.
- **Player-facing text:** the two changelog lines only.

## Verification
- Test first: the existing `options-fingerprint` scenario's Target moved to the option count and hash without the setting (Retail 414, Classic 310), open against it before the fix and met after (plan, step 1). No new scenario (Krowi at the plan gate: "why a new options scenario? overkill?").
- Offline: `Check-Repo.ps1 -ChangedOnly` green; grep for the command name and `ToggleCollectionsJournal` outside `docs/` empty; `options` suite headless green on Retail and Classic, the fingerprint moved by one option per client and the comment there naming this work item.
- No headless suite reads `Bindings.xml`; the `options` suite's binding scenarios use `KrowiAF_OPEN_TAB_Achievements` only.
- In game, Retail and Mists:
  1. Before the deploy, Key Bindings > Krowi's Achievement Filter shows the raw-named row.
  2. After deploy and `/reload`, the row is gone and the other nine rows remain with their names.
  3. A key bound to the old row before the deploy does nothing after it and raises no error.
  4. `/kaf` > Advanced shows only the Debug heading.
  5. `Read-GameErrors.ps1` shows no new row.
  6. `/kaftest options` green.

## Decision
2026-11-13, Krowi, asked "delete the binding outright or comment it out" and "leave the dead 'Collections Achievement Window' toggle on the Experimental options page or hide it": "delete keybind, hide option". The binding is deleted outright; the option is hidden in this item (design option 1 for the option, decided without asking as what "hide" means: `gates.md`). `Gui/Collections/` stays and `docs/backlog.md` gets a line for the experiment.