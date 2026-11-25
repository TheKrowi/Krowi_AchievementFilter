# Gates: 2026-11-25-unused-ace
Class: library

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-25 | scope | One work item for the Ace removal (libraries now, definitions later), or split? | One item: all six libraries, option tables kept | "before going ahead i think we can split the work in multiple work items right? like getting rid of not used ace, reworking a bit to get rid of acegui ... let's tackle unused libs and then the gui lib" | own |
| 2026-11-25 | intent | Accept the intent: stop loading the Ace libraries nothing uses, no visible change | Accept | "Accept" | took |
| 2026-11-25 | design | AceDBOptions in this item or with the AceConfig item later? | In this item | "With AceConfig later" | other |
| 2026-11-25 | plan | Approve the plan (one commit, lint and headless suites, in game on Retail then Mists, scan of installed addons, PR) | Approve | "Approve" | took |
| 2026-11-25 | merge | PR #431 | Merge | "do 1 and 2" | took |