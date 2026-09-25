# How To: Update Localization Strings

Use this guide when adding new UI strings, option labels, category names, or any other user-visible text.

**Commit type:** `locale(enUS): <description>` — e.g. `locale(enUS): add strings for new event filter option`

---

## The Golden Rule

**Update every locale, not only enUS.** A string that is added or renamed goes into `Localization/enUS.lua` and into every other locale file (`deDE.lua`, `frFR.lua`, `ruRU.lua`, etc.), in the same place. A renamed key keeps its existing translations; a new key gets a translation per locale.

---

## Adding a New String

### 1. Open `Localization/enUS.lua`

The file opens with a few lines of code, then the marker and the string list:

```lua
KrowiAF.PluginsApi:LoadPluginLocalization(L)

-- [[ Everything after this line is automatically generated from CurseForge ... AUTOGENTOKEN ]] --

-- [[ Exported at 2026-08-14 12-07-42 ]] --
L["My New Category"] = true   -- new strings go here
L["%c"] = true
```

**Add all new strings directly below the `Exported at` line.** Never add strings above the `AUTOGENTOKEN` marker; the `enus-autogen` lint rule fails on one.

### 2. Add the String Entry

For a string that has been translated (or is ready for translation), use `true` as the value:

```lua
L["My New Category"] = true
L["Filter by event"] = true
```

`true` signals to the locale system "use the key itself as the English value".

If you need the English string to differ from the key (rare), set the value explicitly:

```lua
L["SomeKey"] = "English display text"
```

### 3. Use the String in Code

Reference the string via `addon.L["My New Category"]` in Lua files:

```lua
local categoryName = addon.L["My New Category"]
```

---

## Variant Locale Files

Some strings live in dedicated variant files rather than the main locale file:

| File | When to use |
|------|------------|
| `Localization/enUS.lua` | All general strings (default) |
| `Localization/enUS.Plugins.lua` | Strings used only in plugin integrations (ElvUI, GW2 UI, etc.) |
| `Localization/enUS.WrathClassic.lua` | Strings used only on Wrath of the Lich King Classic |

Add new strings to the appropriate file. The same `true`/explicit-value pattern applies. All have the same `AUTOGENTOKEN` marker and `Exported at` line — always add directly below the `Exported at` line.

---

## What NOT to Do

- **Do not** add or rename a string in enUS only; update every locale file with it.
- **Do not** add strings above the `AUTOGENTOKEN` marker in any enUS file.
- **Do not** rename or reorganize existing string keys — this breaks existing translations.

---

## After Adding Strings

A locale file that lacks a key falls back to the English text.
