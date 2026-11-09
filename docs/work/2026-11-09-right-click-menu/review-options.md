# The Right-click menu's settings, reviewed

The review every feature PR of the split makes of its own settings (`docs/backlog.md`, "For the feature split (106)", PR #392), through REVIEW.md's Texts pass: what each does, its name, its description and its help text. Proposals only; Krowi picks at the look gate. The saved keys never change (`RightClickMenu.*`), so a pick costs text: a renamed phrase goes into every locale file, translated, and to CurseForge.

The section now reads, top to bottom: **Enable** (new), the sub-heading **Button** with one setting, the sub-heading **Wowhead link** with two. Inside its own section a setting no longer needs "Right Click Menu" in its name: the heading says it.

| Setting | What it does (code) | Today's name and description | Proposal |
|---|---|---|---|
| `ShowButtonOnAchievement` | Makes a small arrow button in each achievement row's top right corner that opens the row's menu (`Features/RightClickMenu/RowButton.lua`). Made when the row is made, so it needs a reload. Off by default. | **Show Right Click Menu button** ("Show {rightClickMenu} button": the name mixes Title Case and lower case): "Show / hide Right Click Menu button on each achievement. This serves as an alternative for right clicking the achievement." | **Show Menu Button**: "Show / hide a button on each achievement that opens its right-click menu." |
| `WowheadLink.AddLocale` | Puts the game's language in front of the Wowhead address (`de.wowhead.com` on a German client; both Chinese clients get `cn`) (`WowheadLink.lua:20-29`). On by default. | **Add Locale**: "Add the current game's locale to the Wowhead Link." "Locale" is a programmer's word. | **Use Game Language**: "Open the Wowhead page in the game's language instead of English." |
| `WowheadLink.AddRelatedTab` | Adds an anchor to the address, so the page opens on one of its lower tabs: None, Criteria of, Guides, News, Comments, Screenshots (`WowheadLink.lua:5-12, 30-31`). None by default. | **Related Tab**: "Adds an extra bit to the Wowhead Link so another tab different than the default one will be selected." | **Open on Tab**: "Choose the tab the Wowhead page opens on, such as Comments or Screenshots." |

Help page (`Help Right Click *`): its six terms say what each entry is for in a few words, and they still match the menu. Proposal: no change. The entries other features add (Pop Out, Preview Reward) are explained on their own pages, and the page has no line for the menu button, which its setting describes.

Translations: the three names and three descriptions become six new keys in all 11 locale files, translated in all ten languages. The old keys (`Show Right Click Menu` with its `Desc`, `Add Locale` with its `Desc`, `Related Tab` with its `Desc`) leave every locale file and are deleted on CurseForge after the merge, on Krowi's approval. `Wowhead link`, `Button` and the help terms stay.

## Decision
Pending (look gate).