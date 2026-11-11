# Spec: Reward preview's names and descriptions for their section
Intent: [intent.md](intent.md). Status: draft

## Requirements
1. Each setting name in the section makes sense under the section's title and next to Enable; the proposals and their reasons are in [review-options.md](review-options.md), rows 0 to 6.
2. Each description starts with a verb or "The ... of" and says what changes, with none of the tells REVIEW.md's Texts pass lists, no "e.g.", no "When checked/unchecked", no web words ("hovering").
3. A setting of the same kind as one in a split feature takes its name: Width and Height follow Pop Out's Starting Width.
4. The help page's intro matches the player's Show Icon on Achievements setting each time the pane draws.
5. Every new or changed text is in all 11 locale files, translated, in the same change; no old key stays in a locale file or in the code.

## Root cause
Not a bug. The texts came from #405 and the first rewording (docs/work/2026-11-09-reward-preview-texts), before Krowi set the bar for the split's sections on Pop Out (2026-11-11: "do a non AI text sweep", "descriptions and names should make sense for the section they're in").

## Design
Names are keys (`= true`), so a new name is a new key; descriptions are `... Desc` keys whose values change in place, as Pop Out did (11702bff). The help intro becomes a function passed to `HelpBlocks.Text`; `main`'s `Text` takes only a string, so the branch adds Pop Out's change to `Options/Window/Help/Help.lua` byte for byte (identical hunks merge cleanly). "Starting Width" uses Pop Out's translations word for word.

## Options considered
Per row, on the review page: the proposal, keep, or Krowi's own text. For the help intro: (a) built from the icon setting (recommended), (b) one fixed text that names both ways.

## Areas of concern
- Taint and secret values: none (labels, descriptions, a help string).
- Clients: Retail and Mists Classic show the same section.
- Blizzard API changes: none.
- Other addons, plugins and skins: none read these strings.
- Saved variables and migrations: none; the saved keys stay.
- Localization: all 11 files; new name keys and changed values, translated; CurseForge export from the branch, the old keys deleted there after the merge on Krowi's approval. Pop Out's branch adds lines under the same "Exported at" line: keep both blocks, one "Starting Width".
- Embedded libraries: none.
- Data snapshots: unchanged.
- Player-facing text: this is the change; a 106 changelog line.

## Verification
- Headless `options`, `help` and `features` suites; `Check-Repo.ps1 -ChangedOnly`.
- `git grep` finds no old key in code or locale files; each new key is in all 11 files.
- In game on Retail: `/kaf rewards`, the names on the rows, hover text, the help intro with the icon on and off; Krowi checks the look before the full suites run.

## Decision
<Krowi's answers per row, with the date.>