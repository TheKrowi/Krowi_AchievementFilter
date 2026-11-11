---
paths:
  - "Localization/**"
---
# Localization

- `Localization/enUS.lua` opens with a few lines of code, then the `AUTOGENTOKEN` comment, then the string list with its `-- [[ Exported at ... ]] --` line. Add new strings directly below that `Exported at` line, never above the marker (the `enus-autogen` rule and the kit's guard hook catch one above it). Every locale file has the same layout and the same rule.
- A string that is added or renamed is updated in **every** locale file, not only enUS: carry an existing translation over to a renamed key, and translate a new one.
- **Every feature's texts are in every language** (Krowi, 2026-11-11): each text a feature under `Features/` or the registry shows has a line in all 11 base locale files, its older strings too, never English left for some languages; the `feature-texts` lint rule fails otherwise. A phrase that puts a feature's title in a sentence names it through the language's word for "feature" ("la fonction {feature}", "die Funktion {feature}"), so the grammar agrees with that word and not with the title's gender.
- Plugin strings go in `enUS.Plugins.lua`, Wrath-specific strings in `enUS.WrathClassic.lua`, each with its locale variants.
- The sync with CurseForge runs only through the kit's `krowi:localization` skill. Guide: `docs/how-to/update-localization.md`.