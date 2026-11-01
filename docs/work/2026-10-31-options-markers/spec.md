# Spec: The options window's markers say what they mean
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. A changed option is marked by something that cannot be read as a control: a thin gold line along its row's left edge, as VS Code marks a modified setting.
2. A changed option is set back with a left-click on a counter-clockwise arrow (Blizzard's `common-icon-undo`) in the margin before its name, shown only while the mouse is on that row. The right-click on the dot goes.
3. The reload arrow (clockwise, `UI-RefreshButton`) stays right after the name on every option that needs a reload, and stands before the texts that explain it: the reload bar ("Some changes take effect after a reload.") and the hover help ("Requires a reload to take full effect.").
4. The hover help of a changed option (help pane, and the collapsed pane's tooltip) ends with the undo arrow before the game's own "Reset to Default".
5. The Overview's "Using these options" shows the gold line before its explanation and the reload arrow before Krowi_Util's "Requires a reload to take full effect.".
6. The page header's "N changed" stays plain text.
7. Retail and Mists Classic look the same.
8. A changed option on a disabled (greyed-out) row keeps its gold line, and its undo arrow shows on hover and sets it back as on any other row.

## Design
- **Rows** (`Krowi_Options/Rows.xml`, `RowMixins.lua`): the `Dot` button is replaced by a `ChangedBar` texture (2 px, gold, the row's height less 4 px top and bottom, at the row's left edge) and a `Reset` button (12 px, `common-icon-undo` with an additive highlight of itself) anchored 2 px before the label, so it moves with an indented option while the lines stay in one column. `Refresh` shows the line when the option is changed and the arrow when it is changed and the mouse is on the row; `OnEnter` shows the arrow, `OnLeave` hides it only once the mouse has left the row (moving onto the row's own controls fires the row's `OnLeave` too).
- **Markers as text** (`Krowi_Options.lua`): `lib.Markup = { Changed, Reload, Reset }`, inline escapes of the three markers, so the window and an addon's help draw exactly what the rows draw. Both arrows exist on both clients: `UI-RefreshButton` is a file, `common-icon-undo` an atlas of the same file and coordinates on Retail 12.1.5 and Mists 5.5.4 (the kit's `Get-Atlas.ps1`).
- **Window** (`WindowMixin.lua`): the reload bar and the hover lines are prefixed with their marker; the changed line's text is `Strings.ResetToDefault`, by default the game's `RESET_TO_DEFAULT`. `Strings.Changed` goes.
- **This addon** (`Options/Window/Window.lua`, `Help/Help.lua`, `Localization/`): `Changed` leaves the config. The Overview's "Help Overview Dot" becomes "Help Overview Changed" ("A gold line before an option means you changed it. Hover it and click the arrow that appears to put it back."), in every locale; "Changed. Right-click the dot to set it back." is removed from every locale.

The two arrows mirror each other, which at 12 px is a weak difference on its own, so they also differ in place (the undo arrow before the name, the reload arrow after it) and in when they show (the undo arrow only under the mouse on a changed row, the reload arrow always).

## Options considered
1. **The gold line, and the undo arrow on hover (chosen).** The page with changes shows only thin lines; the action is where the mouse already is.
2. **The gold line and the undo arrow always shown on changed rows.** Easier to find, busier.
3. **A round dot (the first prototype, the portrait mask tinted gold) with the markers beside their texts.** Krowi tried it in game: the reload marker beside its texts was right, the dot still was not.
4. **A Reset button on every row** (Cloth Config, Minecraft): too heavy for the window (Krowi).
5. **The name in bold when changed** (Unity): too distracting (Krowi).
6. **An undo arrow as the only marker, always shown** (Unreal Engine's editor): two circling arrows on a row that needs a reload.

## Areas of concern
- **Taint and secret values:** none; the addon's own textures and button on its own rows, no Blizzard frame or API touched. `RESET_TO_DEFAULT` is only read.
- **Clients:** Retail and Mists Classic; `common-icon-undo` and `UI-RefreshButton` exist on both, and `RESET_TO_DEFAULT` is used by both clients' FrameXML (`Blizzard_BindingUI.xml`, `Blizzard_ClickBindingUI.xml`). Checked in game on both.
- **Blizzard API changes:** none; atlas and texture escapes, `IsMouseOver`.
- **Other addons, plugins and skins:** none address the option rows' markers.
- **Saved variables and migrations:** none.
- **Localization:** one string replaced in every locale ("Help Overview Dot" by "Help Overview Changed", translated here), one removed ("Changed. Right-click the dot to set it back."); both go to CurseForge through `krowi:localization`. The hover line uses the game's translated `RESET_TO_DEFAULT`.
- **Embedded libraries:** Krowi_Options lives inside this addon for now; its minor stays (no other copy exists yet).
- **Data snapshots:** none.
- **Player-facing text:** no changelog line: the options window is new in 105.0, not released yet, and its line covers it.

## Verification
- `options` suite: the model scenario `changed-dot` is renamed `changed-line`; the game-only change steps check the changed line instead of the dot; a new game-only step `toggle-reset` runs the toggle row's arrow and checks the option is back at its default, the line is gone, the arrow showed only under the mouse and the footer follows.
- `Check-Repo.ps1 -ChangedOnly -Luals`, the headless `options` and `help` suites, `krowi:taint-reviewer` on the diff.
- In game on Retail and Mists Classic: a changed option shows the line; hovering it shows the arrow, which sets it back; the reload bar, the hover help and the Overview show their markers; `/kaftest options` green.

## Decision
2026-10-31, Krowi, in game and on reference screenshots: the reload arrow beside its texts kept from the first prototype; the round dot rejected; option 1, the gold line on the left edge with a counter-clockwise undo arrow shown on hover.

2026-11-01, Krowi, after the runs on both clients (Retail's Tab Priority, greyed while Enable Tab Priority is off): a disabled row keeps the line, because the setting is changed, and its arrow keeps working. The built code already does both (`Refresh` reads only `IsChanged`).