# Spec: Reward preview texts in Krowi's words
Intent: [intent.md](intent.md). Status: done

## Requirements
1. `Feature Switch Desc` reads "Enable / disable {feature}. When disabled, {feature} is fully turned off. Its settings are kept." The reload is already said by the orange "Requires a reload to take full effect." that `K_AddReloadRequired` appends (`Features.lua:135`, `Libs/Krowi_Util/Strings.lua:33-37`).
2. `Feature Off Help` reads "{feature} is disabled. Enable it at the top of this section and reload."
3. The setting names are Title Case with short words lower case: "Show Icon on Achievements", "Show on Mouseover", "Invert Up and Down When Turning", "Max Number of Icons". Enable, Width and Height stay.
4. The icon's description reads "Show / hide an icon on achievements with a reward that can be previewed. {previewReward} in the right-click menu always works."
5. Width and Height read "The width (height) of the {rewardPreview} window when it opens. This will update when you resize the window."
6. Each changed text is translated in all ten translated files in the same change; a name whose English only changed case keeps its translation.
7. The 106.0 changelog line about the Enable check box no longer says "no longer starts".
8. CurseForge gets the new phrases with their translations; the five replaced keys are deleted there after the merge, on Krowi's approval.

## Design
Every key is the English text (`= true`), so a name in another case is a new key: the five old keys (`Show icon on achievements` with its `Desc`, `Show on mouseover`, `Invert up and down when turning`, `Most icons per achievement`) are replaced by Title Case keys in all 11 files and in `Features/RewardPreview/Options.lua`; the four texts whose key stays get new values. The width and height descriptions get `:K_ReplaceVars(L["Reward Preview"])`. A translation may leave a placeholder out: where a language has no word of its own for "Reward Preview" (esES, esMX, itIT, koKR, ptBR, zhTW, and ruRU, whose CurseForge text reads oddly), it names the window in its own words instead of showing the English; `{previewReward}` stays everywhere, since it names the right-click entry as that language's menu shows it.

Blizzard's case, from `Blizzard_SettingsDefinitions_Frame` and the enUS global strings: 94 of 127 setting names capitalise every word of four letters or more, short words stay lower case ("Show Pings in Chat", "Enable Raid and Battleground Settings"); 2 are sentence case; the rest are one word.

## Options considered
1. **Title Case, as Blizzard (chosen).**
2. Sentence case as #405 shipped: the section would differ from the game's Settings window and from Krowi's older names.

## Areas of concern
- Taint and secret values: none (option labels and descriptions only).
- Clients: Retail and Mists Classic show the same section; text only.
- Blizzard API changes: none.
- Other addons, plugins and skins: none read these strings.
- Saved variables and migrations: none; the saved keys stay.
- Localization: all 11 files change; five keys renamed, four retranslated; CurseForge export, then a delete of the five old keys from `main`.
- Embedded libraries: none.
- Data snapshots: unchanged.
- Player-facing text: this is the change; the changelog line follows it.

## Verification
- `Check-Repo.ps1` clean, the `features`, `options` and `help` suites headless.
- Every renamed key is gone from every locale file and from the code (grep), every new key is in all 11 files.
- The localization report: 9 to add or change in enUS, each translated file sends all of them.
- In game: not needed for text alone; the `features` suite reads the Enable row and the help page.

## Decision
Krowi, 2026-11-09: the five texts as proposed ("make this a small pr with all of the above"), Title Case like Blizzard (Recommended), both extras (Recommended).