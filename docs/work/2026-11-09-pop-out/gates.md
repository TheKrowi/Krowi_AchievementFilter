# Gates: 2026-11-09-pop-out
Class: feature

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-09 | scope | Which feature splits after the Right-click menu | Pop Out (small, its menu entry already fits the slot, it sets the side-panel rule before Achievement guides) | "pop out it is, go" | took |
| 2026-11-09 | intent | Accept the intent for Pop Out | Accept as written | "Accept as written (Recommended)" | took |
| 2026-11-09 | design | Where the Pop Out modifier row lives | The row in General's Modifiers group, greyed while off, with a pointer line in Pop Out's section | "blizzard just has them at both locations, we do the same. disable the row when pop out is disabled ... a link button ... add the button in the red box. on the pop out page we add the same line modifier with the same link button to the keys and clicks section" | amended |
| 2026-11-09 | design | Approve the amended spec as the design | Approve the amended spec | "Approve the amended spec (Recommended)" | took |
| 2026-11-09 | design | Where the link button sits, after Opus's review found the options window draws a second control only after a check box (mock page https://claude.ai/artifact/KwWbpdEMvN6giwEfsjW6Lq) | A: a row of its own under the dropdown, no library change | "B1" (an icon button in the red box beside the dropdown, its text in the tooltip; needs a Krowi_Options change) | other |
| 2026-11-09 | design | The moved files' names | Keep `AchievementPopout*.lua` (spec's `Popout.lua` beside `PopOut.lua` collides on Windows; Opus review) | - | auto |
| 2026-11-09 | design | Spec corrections from Opus's review | `FileLoad` never reached saved data; `Into` entry shape; the trail's missed lines; new phrases translated in every locale | - | auto |
| 2026-11-09 | plan | The plan, after Opus's review: Krowi_Options first, the move in one commit, before-run, matrix, look gate, PR after the library release | Approve the plan | "Approve the plan (Recommended)" | took |
| 2026-11-09 | design | /code-review: a semicolon in the moved log code; EllesmereUI's part hooking Pop Out while it is off; a fixed Order 1000 for the row in Keys and clicks | fix all three: the semicolon goes, the part installs only for a started Pop Out, an Into row without Order goes after the group's last row | - | auto |
| 2026-11-09 | design | /code-review: the submodule pointer at 2.1 not committed; the row in Keys and clicks greys by the saved switch, not by whether Pop Out started; the slot entries as fields on addon.Gui.AchievementPopout | leave all three: the pointer is committed after the library's release (plan step 6); greying by the saved switch is what the feature's own section does, and the reload bar says a reload is due; the fields keep each entry in its own file, as the plan's file list has them | - | auto |
| 2026-11-09 | design | Taint review of the Pop Out diff | none found; no change | - | auto |