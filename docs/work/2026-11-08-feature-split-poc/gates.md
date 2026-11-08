# Gates: 2026-11-08-feature-split-poc
Class: harness (Get-ChangeClass.ps1, 2026-11-08: an existing line of `.claude/release-gate.ps1`'s suite list changed; predicted `feature`, its look gate is kept)

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-08 | intent | The PoC's intent: Reward preview into Features/RewardPreview/ with its switch, the registry and the slots it uses, the four proofs, the automatic run, the review of its six options | accept as written | "Accept as written (Recommended)" | took |
| 2026-11-08 | scope | Reward preview's settings move as AceConfig tables, or options stage 2 (own format) starts with the PoC (reversing my proposal of 2026-11-03) | keep AceConfig in 106 | "Keep AceConfig in 106 (Recommended)" | took |
| 2026-11-08 | design | The design: registry, slots (data fields, row icons, menu entries, side panels, options section, help), window as a template made at start, boundary lint, headless start check, features suite with memory, /kaftest matrix | approve as written | "Approve as written (Recommended)" | took |
| 2026-11-08 | design | What the six settings do when Enable is unticked before the reload | grey out at once | "Grey out at once (Recommended)" | took |
| 2026-11-08 | design | What an off feature's help page shows where Show me is | no button, one line | "No button, one line (Recommended)" | took |
| 2026-11-08 | design | The partial live refresh after a profile action | keep until its owner moves | "Keep until its owner moves (Recommended)" | took |
| 2026-11-08 | plan | The plan (before-run and reload probe, test first, core registry and slots, the move, the other suites, the matrix run, text and docs, options review and walk-through) | approve | plan approved at ExitPlanMode with no changes | took |
| 2026-11-08 | before-run | escape, menu, guide, options, help, tooltip on main before any code change, Retail 12.1.5 and Mists 5.5.4 (kit-driven) | green on both | not asked: Retail and Mists green, no difference from headless except a headless-only escape scenario | auto |
| 2026-11-08 | test | Correction: the session started WoW three times (two reload probes, then the Retail matrix run) while Krowi was playing another game | - | "do not open wow when the pc is in use!!!!", "I'm playing another game and it's the 3rd time you start" | correction |
| 2026-11-08 | test | Whether the PC is free for the in-game matrix runs on Retail and Mists (about 15 minutes each) | - | "all ours" | took |
| 2026-11-08 | plan | The matrix on the spec's fallback (the kit types /reload per step): C_UI.Reload from a timer is blocked on both clients | the spec's fallback | not asked: the spec named this fallback | auto |
| 2026-11-08 | plan | Code review: deleting an options profile still lights the reload bar (the grill said every options-profile action); only the filters' profile rows stop asking | keep delete | not asked: the grill's wording | auto |
| 2026-11-08 | plan | Walk-through: the menu entries' close through `menuBuilder:Close()` left to the Right-click menu's PR (naming the menu is a feature reaching the core until then), so the green matrix runs did not go stale for one line | defer | not asked | auto |
| 2026-11-08 | plan | Code review: a third dotted-path helper in Features.lua left as it is (no switch path has a numeric segment) | leave | not asked | auto |
| 2026-11-08 | test | Whether the PC is free for the matrix reruns and the look screenshots (about 30 minutes) | - | "Not now" | - |
| 2026-11-08 | test | The same, asked again later | - | "run the tests now, pc is free" | took |
| 2026-11-08 | look | The switch on top, the six rows greyed at once with the reload bar, the off line and no Show me on the help page (screenshots of Retail 12.1.5 and Mists 5.5.4, published page) | looks right | "Looks right (Recommended)" | took |
| 2026-11-08 | look | Invert, Width and Height stop greying out while the row icon is off (they apply to previews from the right-click menu too) | stop greying them | "Stop greying them (Recommended)" | took |
| 2026-11-08 | look | The six shorter names, the two new descriptions and the help line naming the right-click menu, in all 11 locale files and to CurseForge | take all of it | "Take all of it (Recommended)" | took |
| 2026-11-08 | test | Correction: after the look-gate changes the session started a new Mists matrix run unasked, about 30 minutes after the "PC is free" runs had ended (stopped before the client came up) | - | "you did it again, start a run with the pc being idle" | correction |