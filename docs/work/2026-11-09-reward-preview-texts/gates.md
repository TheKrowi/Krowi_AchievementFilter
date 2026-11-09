# Gates: 2026-11-09-reward-preview-texts
Class: fix/logic

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-09 | scope | The five texts (Enable, off line, icon description, Max Number of Icons, Width/Height) in a small PR | take all five | "make this a small pr with all of the above" | took |
| 2026-11-09 | scope | Same-kind settings (Pop Out's Default Width against Reward preview's Width) | - | "we pick these up when we split these into features, when not split yet, keep the old texts" | own |
| 2026-11-09 | design | Name case: Title Case like Blizzard's Settings (94 of 127), or sentence case as #405 shipped | Title Case | "Title Case like Blizzard (Recommended)" | took |
| 2026-11-09 | scope | Extras: reword the 106.0 changelog line, and drop the repeated "after a reload" from the Enable text | take both | "Take both (Recommended)" | took |
| 2026-11-09 | plan | The plan (keys in code and 11 locale files, the changelog line, lint, suites, localization report) | proceed | not asked: a `fix/logic` plan is routine | auto |
| 2026-11-09 | plan | The changelog line written without the colon the gate's wording kept ("…settings, which fully turns off the reward preview after a reload") | no colon | not asked: the colon is one of the tells the change removes | auto |
| 2026-11-09 | build | Krowi's side note: a Blizzard global string reused as a text can mean another thing in another language ("Mount" is the verb in French) | - | "one thing to take into account is context … just a sidenote when we would be translating and take global vars blizz has" | own |