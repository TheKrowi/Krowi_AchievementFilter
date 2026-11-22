# Gates: 2026-11-22-verify-talebound
Class: harness

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-22 | intent | Verify reports 2 false failures on 12.1.7, trusts the 26 Raven trackers and does not check the 70 Bound Silver entries: the problem to solve? | Yes | "Yes (Recommended)" | took |
| 2026-11-22 | scope | What goes in the harness PR | All four: verify, the skill's reward table, the holiday lookup's -Locale, the backlog line and missing gate rows | "All four (Recommended)" | took |
| 2026-11-22 | design | How verify treats reward text 'Traveling Raven: <item>' | Count it as a reward; text ending in 'Bound Silver' too, with :TaleboundSilver() as its tag | "Count it as a reward (Recommended)" | took |
| 2026-11-22 | plan | Test first through the PTR-fallback fixture (63734, 64464, 64418), then the script | Approve | "Approve (Recommended)" | took |