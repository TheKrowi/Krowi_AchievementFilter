# Spec: Every feature's texts in every language
Intent: [intent.md](intent.md). Status: done

## Requirements
1. Every literal `L["..."]` key that a file under `Features/` or the registry (`Features.lua`) reads has a line in each of the 11 base locale files (`Localization/<lang>.lua`), or in `Localization/Shared.lua` (Blizzard's own strings, every language).
2. On `main` before this change that is false for 31 keys, all in esES, esMX, itIT, koKR, ptBR and zhTW: Pop Out 6 (`Pop Out`, `Close Popout`, `Remember Size`, `Snap Distance`, `Appearance`, `Faded Opacity`), Reward preview 2 (`Preview Reward`, `Choose one of {count} rewards`), Right-click menu 22, the registry's `Enable`. Each is translated, about 130 lines.
3. `Feature Switch Desc` and `Feature Off Help` read right whatever the gender of {feature}: frFR, esES, esMX, itIT and ptBR both phrases, deDE and ruRU `Feature Off Help`, ruRU also `Feature Switch Desc` (accusative). enUS, koKR, zhCN and zhTW unchanged.
4. A lint rule fails a change that leaves a feature's text out of a locale file; the localization path rule and the features path rule state it; the workspace rules (`Krowi_ClaudeKit\WowAddons.md`) state it for every Krowi addon's and library's features and modules.
5. No translation is lost and no key changes; CurseForge gets every new translation through `krowi:localization`.

## Root cause
Not a bug in code. The localization rule asks only that a new or renamed string reach every locale file. Pop Out's and Reward preview's older strings (from before 106) and Right-click menu's were never translated in the six files with the fewest lines (esES, esMX and itIT 370 of enUS's 1203, koKR 548, ptBR 755, zhTW 1163), and the move into `Features/` kept them as they were. The gendered phrases were translated with a masculine subject in mind (docs/work/2026-11-08-feature-split-poc), before feature titles of other genders existed.

## Design
- **Translations:** written here, using the words the same language already uses for the same thing (`Watch List`, `Wowhead`'s tabs, Blizzard's own terms such as the transmog sets), and the meaning the other six languages give each key. `Wowhead` stays `= true` as in six files already. CurseForge's translators can correct any of them afterwards; the report (2026-11-11) shows CurseForge has none of them to import.
- **Gender:** the phrases name the feature through the language's word for "feature" (la fonction, la función, la funzione, a função, die Funktion, функция «...»), as `Feature Controls Desc` does; adjectives and pronouns then agree with that word.
- **Lint rule `feature-texts` [Error], always tree-wide:** the keys of requirement 1 against every base locale file; a key missing from one is an error on the line that reads it, naming the languages. `= true` in a translated file counts (an English word on purpose: German "Pop Out", "Buttons"). A key built at run time (`L[key]`) is not seen. Tree-wide because a removed locale line breaks a feature nobody touched.
- **Rules:** one bullet in `.claude/rules/localization.md` and one in `.claude/rules/features.md`; one sentence in `WowAddons.md`, Localization, committed in the kit.

## Options considered
1. **Lint error, tree-wide (recommended):** the rule holds from now on, also for the next feature; the change is green only with every translation.
2. Lint warning: reported, never blocks; the rule erodes the way the localization rule did.
3. No lint, the rules only: as today.

## Areas of concern
- Taint and secret values: none (strings only).
- Clients: Retail and Mists Classic load the same locale files.
- Blizzard API changes: none.
- Other addons, plugins and skins: none read these strings.
- Saved variables and migrations: none.
- Localization: the change itself; 6 files gain lines, 7 change two phrases; one export. The two gendered phrases may show as a conflict in the report if CurseForge's copy postdates the last import; then the route of docs/work/2026-11-09-reward-preview-texts (an import PR first) applies.
- Embedded libraries: none.
- Data snapshots: unchanged.
- Player-facing text: this is the change; 106.0 is unreleased and these strings are new in it or were English before, so no changelog line.

## Verification
- The new lint rule fails on `main`'s locale files (the 31 keys) and passes on the branch: its own permanent test, run once against `main` before the translations.
- `Check-Repo.ps1` full run clean; headless `features` and `help` suites.
- `Sync-Localization.ps1`: every translated file lists its new lines to send, nothing in conflict.

## Decision
Krowi, 2026-11-11: all three features ("Yes, all 3 features (Recommended)"); the rule for this addon's features with a lint, and for every Krowi repo in the workspace rules ("Features + every Krowi repo"); the gendered phrases in the same change ("Same change (Recommended)"); a lint error ("Lint error (Recommended)").