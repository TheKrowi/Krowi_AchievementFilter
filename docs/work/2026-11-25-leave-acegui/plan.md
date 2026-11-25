# Plan: Stop loading AceGUI and AceConfigDialog
Spec: [spec.md](spec.md). Status: accepted

Drafted with the spec for review together; it assumes (a) on both of the spec's questions.

## Departures from the plan
- **The box is made in Lua, not declared in `TextFrame.xml`:** `addon.Gui.DataManager.NewTextBox` (`Gui/DataManager/DataManager.lua`) builds both boxes, the text window's and the log's, so they can't drift apart.
  - It is a `BackdropTemplate` frame with AceGUI's black backdrop and grey border, holding the scrolling box and its minimal scroll bar. That is Krowi's choice at the look gate.
  - It answers `SetText`, `GetText` and `GetEditBox`.
- **The `datamanager` suite loads Blizzard's achievement window itself** when the Data Manager isn't made yet, as the `escape` suite does. Its first in-game run refused with "the Data Manager has not been made yet".
- **The look gate ran the three looks behind a temporary switch** and a screenshot helper, both removed before the pull request.

## Files that change
- `Libs/Files.xml`: `AceGUI-3.0.xml` goes, and `AceConfig-3.0\AceConfig-3.0.xml` becomes three lines:
  - `AceConfig-3.0\AceConfigRegistry-3.0\AceConfigRegistry-3.0.xml`;
  - `AceConfig-3.0\AceConfigCmd-3.0\AceConfigCmd-3.0.xml`;
  - the script `AceConfig-3.0\AceConfig-3.0.lua`.
- Deleted: `Libs/AceGUI-3.0/`, `Libs/AceConfig-3.0/AceConfigDialog-3.0/` and `Libs/AceConfig-3.0/AceConfig-3.0.xml`.
- `Gui/DataManager/TextFrame/TextFrame.xml`: `Input` (`ScrollingEditBoxTemplate`) and `InputScrollBar` (`MinimalScrollBar`) inside the inset.
- `Gui/DataManager/TextFrame/TextFrameMixin.lua:24-31`: the AceGUI lines become the scroll bar's registration.
- `Gui/DataManager/Frame/FrameMixin.lua`:
  - `:88-98`: the log as the same pair, made in Lua, with an `OnTextChanged` callback that undoes user input;
  - `:130,135`: the log is shown and hidden directly.
- `Gui/DataManager/DataManager.lua`: `EncodeCharacter(data)`, `GatherCharacter(guid)` and `ImportCharacter(text)`, moved out of `CharacterListEntryMixin.lua` (the export) and `Frame/FrameMixin.lua:7-47` (the import), which call them. The button, the import and the suite share them.
- `Plugins/ElvUI.lua:511`: `frame.Input.frame` becomes `frame.Input`. If the look gate asks for it, ElvUI's and EllesmereUI's skins also skin `InputScrollBar`.
- `Tests/Options.lua:25`: AceConfigDialog asked silently.
- New `Tests/DataManager.lua`, game only (`export-roundtrip`, `import-roundtrip`, `log-read-only`). It is registered in `Tests/Files.xml`, with a row in `Tests/README.md` and in the runner's list in `.claude/tools/headless/run-tests.lua` as game only. `import-roundtrip` uses a made-up character under `Player-0-KAFTEST` and removes every entry it wrote, also when a check fails.
- `.claude/rules/release.md`: 19 suites.
- `docs/architecture.md:122`, the library list; `docs/backlog.md`, the AceGUI entry leaves "Leaving Ace".
- `_Packaging/Changelog.md`, 106.1, `### Changed`: "The Data Manager's export and import boxes are the game's own text boxes, and the addon no longer loads AceGUI".

## Order of work
1. The `datamanager` suite and the moved encode and import functions, on today's AceGUI boxes. It must pass in game on Retail before the boxes change, so it proves the new boxes and not itself. Commit.
2. The AceConfig split and the silent lookup. Lint, headless `options` on both clients. Commit.
3. The two boxes, the ElvUI anchor and the export function; `krowi:taint-reviewer`. Commit.
4. **Look gate:** deploy to Retail (`Deploy.ps1 -WhatIf` first). Open the export, the import, the log tab and the Map Verifier export in front of Krowi, with screenshots on an Artifact page for when Krowi follows from another device. Then the same on Mists, after Krowi approves Retail.
5. AceGUI and the dialog's files deleted. Lint, headless suites. Commit.
6. `Run-GameTests.ps1 options, escape, datamanager` on Retail, then on Mists; `Read-GameErrors.ps1` on both. Then the scan of installed addons for a non-silent `LibStub("AceGUI-3.0")` or `LibStub("AceConfigDialog-3.0")` without a copy of their own or in a dependency.
7. Docs and changelog, then the PR: `Get-ChangeClass.ps1`, `/code-review`, Decisions section.

## Risks
- **Import text changed on the way in.** That would write wrong saved data. Guard: `export-roundtrip` and `import-roundtrip`, green on the AceGUI boxes first (step 1). The box is a plain multi-line EditBox, as AceGUI's was, so no conversion is expected.
- **The test writing into a real character.** Guard: `import-roundtrip` uses only `Player-0-KAFTEST` and cleans up in every path.
- **A long export pasted slowly or cut.** Guard: no `maxLetters`; the round trip with a real export on Krowi's character, whose export is the largest at hand.
- **The log edited.** Guard: `log-read-only`.
- **A leftover AceGUI call.** Guard: `library-names` once the folder is gone, and the headless load.
- **Clients busy.** Another session (Krowi_ExtendedVendorUI) runs its suites on all five clients first. Steps 4 and 6 wait for `Start-Game.ps1 -WaitForOthers` or that session's word.

## Proof
- `Check-Repo.ps1`: 0 errors.
- Headless `options`, `escape`, `features` and `plugins` on both clients: every line as before.
- In game, Retail and Mists:
  - `Read-GameTests.ps1` with no FAIL;
  - `datamanager` with `export-roundtrip`, `import-roundtrip` and, on Retail, `log-read-only` passing;
  - `Read-GameErrors.ps1` with no new row.
- Krowi's `look` row for both clients.