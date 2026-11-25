# Spec: Stop loading AceGUI and AceConfigDialog
Intent: [intent.md](intent.md). Status: draft

## Requirements
1. `Libs/Files.xml` loads no AceGUI and no AceConfigDialog, and `Libs/AceGUI-3.0/` and `Libs/AceConfig-3.0/AceConfigDialog-3.0/` are gone. AceConfigRegistry, AceConfigCmd and `AceConfig-3.0.lua` still load, so `KrowiAF_GetOptions` and every option table work as today.
2. No addon code asks LibStub for AceGUI or AceConfigDialog except silently; the `library-names` lint rule (`.claude/tools/Check-Repo.ps1:471-504`) fails otherwise.
3. The text window's box (`KrowiAF_TextFrame.Input`):
   - is the game's `ScrollingEditBoxTemplate` with a `MinimalScrollBar`;
   - keeps the `SetText` and `GetText` every caller uses, so no caller changes;
   - cuts no text: an export of the current character, set into the box, reads back byte-equal;
   - an export of a made-up test character, pasted through the box, imports whole: the import writes exactly that character, and the test removes it after;
   - takes the Map Verifier's CSV whole.
4. The log tab (`KrowiAF_DataManagerFrame.Log`, Retail, debug mode) shows the tab's text, scrolls, can be selected and copied, and undoes any typing, as today.
5. ElvUI's and EllesmereUI's skins of the text window apply without errors.
6. Escape closes the text window as today (the `escape` suite's `Text` steps).
7. The `options` suite keeps every line, including `settings-entry pages=0 stub=yes` and the fingerprint (414/723de62c, 310/83fced41).
8. No new Lua error on Retail or Mists.

## Design
### AceConfig without its dialog
`Libs/AceConfig-3.0/AceConfig-3.0.xml` includes the registry, the cmd part and the dialog, then `AceConfig-3.0.lua`, which needs only the registry and cmd parts (`AceConfig-3.0.lua:15-16`; the dialog is a commented-out TODO at `:23`).
- `Libs/Files.xml` replaces its one include of that XML with three lines: the registry's XML, the cmd part's XML and `AceConfig-3.0.lua`.
- `AceConfig-3.0.xml` and the `AceConfigDialog-3.0` folder are deleted, so the vendored files left are exactly the ones loaded.
- AceConfigCmd asks for AceConsole only when an addon gives AceConfig a slash command (`AceConfigCmd-3.0.lua:771`), and KAF gives none.
- `Tests/Options.lua:25` (`CountKafPages`) asks for AceConfigDialog silently (`LibStub("AceConfigDialog-3.0", true)`), so `settings-entry` still reads `pages=0` when nothing loads it, and proves KAF added no page when another addon does.
- Krowi_Util's `Options/Options.lua:95` and `Profiles.lua:25` name AceConfigDialog only on paths KAF never takes: `options.Open` is replaced by `Options/Window/Window.lua:142`, and KAF doesn't load `Profiles.lua`.
- The headless environment's AceConfigDialog fake (`options-env.lua:314-323`) stays until the AceConfig item, since nothing reads it there.

### The text boxes
`ScrollingEditBoxTemplate` is defined the same on Retail (`live`), Mists (`classic`) and Titan (`classic_titan`), in `Blizzard_SharedXML/Shared/Scroll/ScrollTemplates.xml:21`, with its mixin in `ScrollTemplates.lua`. Blizzard pairs it with a scroll bar the same way on Mists' mail window: `MailFrame.lua:1248`, `ScrollUtil.RegisterScrollBoxWithScrollBar(MailEditBox.ScrollBox, MailEditBoxScrollBar)`.
- **Text window.** `TextFrame.xml` declares the box (`parentKey="Input"`, inheriting `ScrollingEditBoxTemplate`) and a `MinimalScrollBar` (`parentKey="InputScrollBar"`) inside the inset. `OnLoad` links the two and drops the AceGUI lines (`TextFrameMixin.lua:24-31`).
  - The box's `SetText` (through the edit box's `ApplyText`) and `GetText` serve every caller unchanged: `CharacterListEntryMixin.lua:82`, `FrameMixin.lua:8,51`, `MapVerifierMixin.lua:1241,1252` and `Options/General.lua:179,199,220,237`.
  - No `maxLetters`, so the edit box sets no limit (`ScrollTemplates.lua:27-28`), as AceGUI's widget set none.
- **Log tab.** `CreateTabs` (`FrameMixin.lua:88-98`) makes the same pair in Lua, since the tabs exist on Retail only.
  - The read-only rule becomes a callback on the box's own `OnTextChanged` event (`ScrollTemplates.lua:220`, `TriggerEvent("OnTextChanged", editBox, userChanged)`). On user input it puts `self.LogText` back.
  - `SelectTab` shows and hides the box itself, not AceGUI's `.frame` (`:130,135`).
- **Skins.** `Plugins/ElvUI.lua:511` anchors `frame.Input.frame` and becomes `frame.Input`. Whether ElvUI and EllesmereUI also skin the new scroll bar is part of the look gate. EllesmereUI's `SkinTextFrame` (`Plugins/EllesmereUI.lua:701-713`) doesn't touch the box today.

### The in-game check
A game-only `datamanager` suite (`Tests/DataManager.lua`), since no suite covers the Data Manager. It has three steps:
- `export-roundtrip`: the current character's export, built with the export's own code, set into the box and read back byte-equal;
- `import-roundtrip`: a made-up character under a test GUID (`Player-0-KAFTEST`) with one earned and one unearned achievement is encoded, set into the box, read back and imported.
  - The character list and `KrowiAF_Achievements` then hold exactly that character's entries.
  - The test removes them afterwards: `CharacterList[guid]`, `Completed[id].EarnedBy[guid]` and `NotCompleted[id][guid]`.
  - No real character's data is written; importing over one could replace its progress with older values (`Data/SavedData/AchievementData.lua:71-84`).
- `log-read-only` (Retail): text typed into the log through the edit box's insert is undone.

Two functions move out of the frames so the button, the import and the suite share them, and the suite tests the same text a player gets:
- the export's encoding, from `CharacterListEntryMixin.lua` (the inline `LibSerialize`/`LibDeflate` lines), becomes `addon.Gui.DataManager.EncodeCharacter(data)`, with the gathering of a real character's data beside it;
- the import's decoding and writing, from `FrameMixin.lua:7-47`, becomes `addon.Gui.DataManager.ImportCharacter(text)`.

The encoding itself doesn't change, so an export made with 106.0 decodes the same.

## Options considered
1. **The boxes' look** (judged by Krowi in game, Retail first):
   - **(a) Recommended: the game's scrolling text box as Blizzard uses it**, with its minimal scroll bar, on the text window's existing inset. It looks like the game's own edit fields, with Mists' art on Mists.
   - (b) The same box with a dark backdrop and a border around it, close to AceGUI's look today.
2. **Where the in-game check lives:**
   - **(a) Recommended: a new `datamanager` suite**, game only: the export round trip, a test character's import (removed after) and the read-only log. Nothing covers the Data Manager today, and the import writes saved data. It joins the release gate's list (`.claude/rules/release.md` counts 18 suites, then 19).
   - (b) No suite: the three checks are done once by hand in this item's in-game step. They don't run again before a release.

## Areas of concern
- **Taint and secret values:** none expected. The boxes are addon frames on a Blizzard template that Blizzard itself uses in addon-loadable code (calendar, mail). No Blizzard frame is touched. `krowi:taint-reviewer` runs on the diff.
- **Clients:** Retail (120105, 120107), Mists (50504), Titan (38002); the template and `ScrollUtil` exist on all three. Tested in game on Retail and Mists.
- **Blizzard API changes:** none.
- **Other addons, plugins and skins:** ElvUI's anchor changes. An addon that used KAF's copy of AceGUI or AceConfigDialog without its own would break; the plan scans the installed addons as in the first item.
- **Saved variables and migrations:** none changed. The character import writes saved data from the box's text, which requirement 3 checks.
- **Localization:** no new player-facing text. The suite's lines are test output, in English like the other suites.
- **Embedded libraries:** only vendored Ace files go. Krowi_Util is not edited.
- **Data snapshots:** untouched.
- **Player-facing text:** one changelog line.
- **Change class:** `fix/gui` or `library` by the diff (`Get-ChangeClass.ps1` decides); the look gate asks either way.

## Verification
- `Check-Repo.ps1` on the whole tree, with `library-names`.
- Headless, both clients: `options`, `escape`, `features`, `plugins`.
- `krowi:taint-reviewer` on the diff.
- In game, Retail first for the look gate (export, import, the log tab and the Map Verifier export, with Krowi in the client), then:
  - `Run-GameTests.ps1 options, escape, datamanager` on Retail and Mists;
  - `Read-GameErrors.ps1` on both.

## Decision
Pending: the boxes' look and where the check lives (Options considered 1 and 2).