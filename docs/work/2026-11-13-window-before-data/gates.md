# Gates: 2026-11-13-window-before-data
Class: fix/logic

| Date | Gate | Question | Recommended | Answer | Outcome |
|---|---|---|---|---|---|
| 2026-11-13 | intent | Y pressed in the first seconds after a /reload or login, while KAF loads its data: 1 show what is ready, with no error (as before 93.5); 2 a loading notice; 3 leave it | 1, show what is ready | "reload-then-Y work recommended 1" | took |
| 2026-11-13 | scope | What the fix covers: A Current Zone only (the window's error and the Open Current Zone key); B also the world map button, the search's show all results and the right-click watch, exclude and track in the load gap | A, Current Zone only | "Reload-then-Y A with 1, B noted on the backlog" | took |
| 2026-11-13 | design | Where the guard goes: 1 inside `GetCurrentZoneAchievements` plus `KrowiAF_OpenCurrentZone`; 2 at each caller; 3 every special category list created empty at load | 1, inside the function and the key | "Reload-then-Y A with 1, B noted on the backlog" | took |
| 2026-11-13 | design | /code-review (medium), nine findings | Fix the stale counts the fix exposed (the gap's update now counts, and the end of the load's redraw kept those counts: `data.RecountAfterLoad` and a `counts-after-data-load` scenario) and use the new local in the loop; not scope B (Krowi's backlog), not the key's lost press (requirement 3), not a test of the zone cache (the headless model has no map, and in game the cache is already set) | - | auto |