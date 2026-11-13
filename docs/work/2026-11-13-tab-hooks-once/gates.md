# Gates: 2026-11-13-tab-hooks-once
Class: fix/gui

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-13 | intent | Did you know the tab factory installs its hooks once per KAF tab (`#ourTabs == 0` guard), and should it be fixed? | fix it | "no, fix it." | took |
| 2026-11-13 | design | How to limit the tab factory's hooks to one install: 1 a file-local flag set once the hooks are in; 2 test the list before adding the tab; 3 install from `Gui.lua` after all tabs exist | 1, the flag | "ok" | took |
| 2026-11-13 | plan | The plan (a `tab-update-runs-once` scenario in the navigation suite, Recorded 4 / Target 1, the model with KAF's five tabs, the flag; in-game navigation on Retail and Mists before and after) | Approve | "approve" | took |
| 2026-11-13 | plan | A changelog line under Fixed ("Switching tabs in the achievement window no longer repeats its work four times.") or none | The line | "no changelog" | other |