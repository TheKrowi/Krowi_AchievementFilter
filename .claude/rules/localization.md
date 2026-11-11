---
paths:
  - "Localization/**"
---
# Localization

- `Localization/enUS.lua` opens with a few lines of code, then the `AUTOGENTOKEN` comment, then the string list with its `-- [[ Exported at ... ]] --` line. Add new strings directly below that `Exported at` line, never above the marker (the `enus-autogen` rule and the kit's guard hook catch one above it). Every locale file has the same layout and the same rule.
- A string that is added or renamed is updated in **every** locale file, not only enUS: carry an existing translation over to a renamed key, and translate a new one.
- Plugin strings go in `enUS.Plugins.lua`, Wrath-specific strings in `enUS.WrathClassic.lua`, each with its locale variants.
- The sync with CurseForge runs only through the kit's `krowi:localization` skill. Guide: `docs/how-to/update-localization.md`.