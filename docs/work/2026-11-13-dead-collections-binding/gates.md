# Gates: 2026-11-13-dead-collections-binding
Class: fix/gui

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-13 | intent | Remove the key binding that opens Blizzard's Collections window on tab 7, while KAF's Collections tab is an experiment that does not load | Remove the binding, keep the experiment | "plan was to write an achievement window from scratch with full control, it never happened without AI, backlog, keybind should be removed for now." | took |
| 2026-11-13 | design | Class fix/gui, predicted: `Bindings.xml` is an `.xml` file, which `Gates.ps1` puts in the gui area; the option's files (`Options/`) are gui too | - | - | auto |
| 2026-11-13 | design | Delete the binding outright or comment it out | Delete it outright | "delete keybind, hide option" | took |
| 2026-11-13 | scope | Leave the dead "Collections Achievement Window" toggle on the Experimental options page or hide it | Leave it, recorded in the backlog | "delete keybind, hide option" | other |
| 2026-11-13 | scope | No locale string to remove for the binding: it has no `BINDING_NAME_` and no text in any locale file | - | - | auto |
| 2026-11-13 | design | What "hide" means: take the Experimental page out of the options table and its heading out of the Advanced section, keep the default and saved values; `hidden = true` alone would leave an empty heading or an unmapped option, which only a weakened check would let through | Take page and heading out, keep the default | - | auto |
| 2026-11-13 | scope | The three strings the page used stay in every locale file, for the parked experiment; no locale change | Keep them | - | auto |
| 2026-11-13 | design | No reset of the `petJournalTab` CVar for players the binding left on tab 7: an addon setting a CVar runs every `CVAR_UPDATE` handler tainted; one click on a tab fixes it | No reset | - | auto |
| 2026-11-13 | plan | Approve plan.md: delete the binding, take the Experimental page and heading out, keep the default and strings, test first through a new `advanced-collections-hidden` scenario in the options suite, then the fingerprint moved by one option | Approve | "why a new options scenario? overkill?", then, offered the plan without the new scenario (the fingerprint scenario records the removal): "approved" | amended |