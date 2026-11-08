# Reward preview's settings, reviewed

The review every feature PR of the split makes of its own settings (`docs/backlog.md`, "For the feature split (106)", PR #392): what each does, its name, its description and its help text. Proposals only; Krowi picks at the look gate. The saved keys never change (`Achievements.*`), so a pick costs text and, for a renamed phrase, every locale file and a CurseForge export.

The section now reads, top to bottom: **Enable** (new), then the six below. Inside its own section a setting no longer needs "Reward Preview" in its name: the heading says it, as the game's own Options window does.

| Setting | What it does (code) | Today's name and description | Proposal |
|---|---|---|---|
| `ShowRewardPreviewIcon` | Draws the preview icons on the rows (`RowIcon.lua:47`). The right-click entry and Show me work without it. | **Show Reward Preview Icon**: "Show / hide an extra icon on the achievement that lets you preview its Reward Preview." | **Show icon on achievements**: "An icon on each achievement whose reward can be previewed. The right-click menu has Preview Reward either way." The old text says "preview its Reward Preview". |
| `RewardPreviewMouseoverShow` | Hovering a row icon opens the preview; leaving closes it unless pinned (`RowIcon.lua:8-30`). Needs the icon. | **Show Reward Preview on Mouseover**, three short paragraphs. | **Show on mouseover**; keep the description. Greyed while the icon is off: right. |
| `RewardPreviewInvertVerticalRotation` | Inverts the up and down drag when turning the model (`WindowMixin.lua:267-268`), in every preview, also one opened from the right-click menu. | **Invert Reward Preview Vertical Rotation**: "Invert the vertical drag direction when rotating the Reward Preview model." | **Invert up and down when turning**; keep the description. **Stop greying it while the icon is off**: it applies to every preview. |
| `RewardPreviewMaxIndividualIcons` | Up to this many rewards get an icon each; more become one chooser icon (`Data.lua:112-121`). Needs the icon. | **Reward Preview Max Individual Icons**, a clear description. | **Most icons per achievement**; keep the description. Greyed while the icon is off: right. |
| `RewardPreviewDefaultWidth` | The width the window opens at. **Resizing the window overwrites it** (`WindowMixin.lua:16-20`), so it is the remembered width, not a default. Applies to every preview. | **Reward Preview Default Width**: "The default width of the Reward Preview window." | **Width**: "The width the window opens at. Resizing the window changes it." **Stop greying it while the icon is off.** |
| `RewardPreviewDefaultHeight` | The same for the height. | **Reward Preview Default Height**: "The default height of the Reward Preview window." | **Height**: "The height the window opens at. Resizing the window changes it." **Stop greying it while the icon is off.** |

Help page (`Help Rewards Intro`): "Click the preview icon on an achievement to see its reward. Drag the model to turn it, and drag the corner to resize the window." Proposal: "Click the preview icon on an achievement, or choose Preview Reward in its right-click menu, to see its reward. Drag the model to turn it, and drag the corner to resize the window."

Two kinds of change, which Krowi can take apart:
1. **Behaviour (small):** three settings stop greying out when the icon is off, since they apply to previews opened from the right-click menu too. No text changes, no translations.
2. **Text:** the six names, two descriptions and the help line. Each renamed phrase goes into every locale file (translations carried over where the meaning stays, new ones where it changes) and to CurseForge.