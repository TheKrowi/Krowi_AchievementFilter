# Gates: 2026-11-13-tab-hooks-once
Class: fix/gui

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-13 | intent | Did you know the tab factory installs its hooks once per KAF tab (`#ourTabs == 0` guard), and should it be fixed? | fix it | "no, fix it." | took |
| 2026-11-13 | design | How to limit the tab factory's hooks to one install: 1 a file-local flag set once the hooks are in; 2 test the list before adding the tab; 3 install from `Gui.lua` after all tabs exist | 1, the flag | "ok" | took |