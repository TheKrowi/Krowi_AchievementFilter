# Spec: The expanded row's guide shows the NPC's name once the game has it
Intent: [intent.md](intent.md). Status: done

## Requirements
1. A guide block under an expanded row that was drawn with the data's English NPC name shows the client's name at the first list update after the client has it, with no other change on screen.
2. Once the client has given a usable name for an NPC, the guide keeps using it for the rest of the session on every surface, even if a later read returns nothing or a secret value.
3. When nothing it shows has changed, the block still does not re-render on a list update.

## Root cause
- The selected row redisplays its objectives on every list update and calls `content.DisplayUnderObjectives` (`Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:310`).
- `DisplayUnderObjectives` renders only when its cache key changes (`Gui/Guide/Content.lua:228-233`). The key is the achievement id, the width, the action style, the waypoint provider, combat and TomTom.
- The NPC's name is read only inside the render, through `guide.GetLines` and the local `GetNpcName` (`Gui/Guide/Guide.lua`), so a name that arrives later changes nothing the key sees.

## Design
- **`Gui/Guide/Guide.lua`:**
  - A session table of resolved names, keyed by NPC id. `GetNpcName(step)` returns the stored name, or else asks the client (`GetCreatureName`); a usable answer is stored. `RequestNpcNames` stores what it gets too.
  - A new `guide.GetNpcNames(achievement)` returns the names the achievement's Npc steps show, joined, through the same `GetNpcName`.
- **`Gui/Guide/Content.lua`:** the cache key also includes `guide.GetNpcNames(achievement)`. Once a name is stored, adding it to the key costs a table lookup; until then, one `C_TooltipInfo` read per Npc step per list update of the selected row, and only for a guide that names an NPC.

## Options considered
- **A. The names in the cache key, with a session table of resolved names (recommended).** The block picks the name up at the next list update. The table keeps that update cheap and also keeps a name once seen, so a secret value during an encounter does not switch the step back to English.
- **B. Re-render on `TOOLTIP_DATA_UPDATE`.** The client fires it when a pending query answers, with the tooltip data's instance id. The addon would have to keep that id per NPC from each `GetHyperlink` call, register the event and force a redisplay of the selected row. More code, and an event handler in the GUI, for the same result.
- **C. Leave it** (row 31 as it stands): rare, and selecting another achievement fixes it.

## Areas of concern
- **Taint and secret values:** the same `C_TooltipInfo` read and guards as before; the table holds only names that passed `canaccessvalue` and the type check, and lives in the addon's own file scope.
- **Retail and Classic:** Classic has no guide data, so no key changes there. A guide without Npc steps adds an empty string to the key.
- **Plugins and skins, saved variables, localization, data snapshots:** none.
- **Cost:** see Design; the side panel, tooltip and menu now read a stored name instead of building tooltip data on every show.

## Verification
- **Guide suite, two new scenarios (headless only):** in game they are SKIPs, because the game cannot add a name to its creature cache, or make one secret, on demand.
  - Kind `RowName`, `row-npc-name-arrives`:
    - The model has no name for NPC 424245, and the step's data name is the marker. The block is displayed under the stand-in objectives.
    - The model then learns the name and the block is displayed again, not forced.
    - The result is "game" or "fallback" from the block's Npc headline. Recorded "fallback", Target "game".
  - Kind `NpcName`, `npc-name-kept`:
    - The model knows NPC 424246, and `GetLines` reads it.
    - The model then answers with a secret value, and `GetLines` reads it again.
    - Recorded "fallback", Target "game".
- **The existing guide scenarios** stay as they are on both clients, and so does every other suite. `Check-Repo.ps1` stays clean.
- **In game on Retail:** `/kaftest guide` is green (the two new scenarios SKIP), and the expanded row of 60962 with the option on reads "Talk to Archivist Zubashi". `Read-GameErrors.ps1` is clean.

## Decision
Krowi, 2026-10-14: option A, the NPC names in the cache key with a session table of resolved names.