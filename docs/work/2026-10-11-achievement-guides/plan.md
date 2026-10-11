# Plan: Achievement guides and waypoints
Spec: [spec.md](spec.md). Status: accepted

Approved by Krowi (maintainer) on 2026-10-11 in plan mode, with the option defaults and the waypoint-provider rule under "Settled in this plan". It touches shared GUI code, the data API and the options, so it waited for that gate.


## Context
Players have to leave the game to learn how to do an achievement. For 60962 "Legendary Research of the Ebon Blade" the description says "research all upgrades", but the criteria are really the two Tier VII class-hall talents, 486 "Frost and Death" and 487 "Roster of Champions". Their criteria names are empty, so the addon shows nothing useful. The NPC (Archivist Zubashi, 97485, Acherus uiMap 647/648) is listed nowhere with coordinates. The maintainer decided:
- structured guide steps, with names from the game and one tip;
- four surfaces, each an option: tooltip, right-click menu, row icon with a side panel, and expanded row;
- Blizzard and TomTom waypoints, with a provider option;
- scope: 60962 only.

## Settled in this plan (confirm at this gate)
- **Option group "Guide"** in the Achievements tab, profile key `Achievements.Guide`:
  - `Tooltip = true`
  - `RightClickMenu = true`
  - `Icon = true` (row icon and side panel)
  - `ExpandedRow = false` (it changes row heights)
  - `WaypointProvider = 1`: 1 Both, 2 Map pin (Blizzard), 3 TomTom
- **"Both" shows every provider that can place the point.** Without TomTom that is just the map pin, so it doubles as the automatic default. When the chosen provider cannot place the point, the action is shown disabled with the reason in its label, for example "Set waypoint (TomTom is not loaded)". The menu library has no tooltips on Classic, so the reason cannot go in a tooltip.
- **Coordinates are percent (0-100)**, as `/way` and Wowhead use them, and are divided by 100 for `UiMapPoint` and TomTom.
- **The data table is keyed `KrowiAF.GuideData.Legion`**, like `TransmogSetData.Legion`.
- **The NPC step carries the NPC id** (for the snapshot) and its name through `addon.L`, as PetBattleLinkData does.
- **The side panel registers with `addon.Gui:RegisterFrameForClosing`**, so Escape closes it (`Gui/FramesForClosing.lua`).

**Decided on 2026-10-11 after step 0 (Krowi)**, from the proposals under the findings:
- **A portal is a waypoint target of its own.** The Blizzard provider super-tracks its area POI. When that cannot be done, the fallbacks are TomTom on the POI's position, then the coordinates as text.
- **Any step takes an optional faction.** A step with a faction shows only to that faction, and a step without one shows to both.
- **The research step has a fifth state.** A talent whose tier is open but whose cost is not met (`UnavailableNotEnoughResources`) reads "needs 10,000 Order Resources". The amount and the currency name come live from the game.

60962 uses only the fifth state. The other two are built now so that the sibling guides stay a data-only change (spec, requirement 9), and their scenarios run on guide tables written in the suite.

## Step 0 — prerequisites (maintainer)
1. **In-game probe.** On a Death Knight in Acherus, next to Archivist Zubashi, on Retail:
   `/dump C_Map.GetBestMapForUnit("player")`, `/dump C_Map.GetPlayerMapPosition(C_Map.GetBestMapForUnit("player"), "player")`, `/dump C_Map.CanSetUserWaypointOnMap(647), C_Map.CanSetUserWaypointOnMap(648)`, `/dump C_Garrison.GetTalentInfo(486)`.
   Then `/dump C_Garrison.GetTalentInfo(486)` once more on another class. The answers give:
   - the NPC's map and coordinates;
   - whether the map pin works in Acherus (if not, it shows its reason there);
   - whether the talent state can be shown on other classes (if not, they get the name only).

   **Results, Death Knight, Retail, 2026-10-11:**
   - Zubashi stands on uiMap 648, the second Acherus floor (parent 647 in `raw/MapVerifier.csv`), at x 0.4774, y 0.5376. In percent rounded to 0.1 that is `:Npc(97485, addon.L["Archivist Zubashi"], 648, 47.7, 53.8)`.
   - `CanSetUserWaypointOnMap` is true on 647 and on 648, so the map pin serves 60962. `waypoint-map-pin-disallowed` stays as a stubbed scenario.
   - `GetTalentInfo(486)` returns everything the renderer needs: name "Frost and Death", tier 6, tree 128, `researched` false, `isBeingResearched` false, `researchDuration` 86400 (1 day), and a cost of 10000 in currency 1220 (Order Resources). `talentAvailability` is 5, `UnavailableTierUnavailable` (`Blizzard_APIDocumentationGenerated/GarrisonConstantsDocumentation.lua:367`), so this character has not unlocked Tier VII yet.
   - A Paladin in their own class hall gets the same table back, `talentAvailability` 5 included. The name and cost resolve on any class, but the state is meaningless there: a Paladin can never research a Death Knight talent, and the game reports it as "tier unavailable", not as "wrong class". So the renderer shows the state only when tree 128 belongs to the player's class (see `Guide.lua` below), and every other class gets the name only.
2. **Commit the class-hall zone work on `dev` first.** Done: the zone work is committed on `dev` (37308b5a, 60962 at `07_Legion/ZoneData.lua:144`), and this branch starts at `dev`'s head (e76b27ed), so it needs no rebase.
3. **Class hall round, every class.** It collects the spots for 60962's eleven sibling guides and for the twelve "Raise an Army" achievements, and the talent state the class gate relies on. `/kafwhere` (see `Globals.lua` under Options, strings, docs) stores each call in `KrowiAF_DebugTable.Where`.

   Once, before the first character:
   - Debug mode on (Options > General > Debug), then `/reload`.

   On each character, in its class hall. Stand on the NPC (players walk through NPCs) and target it; for an object, stand right next to it:

   | Command | Where | Feeds |
   |---|---|---|
   | `/kafwhere research` | the NPC selling the Class Hall Upgrades, targeted | Legendary Research |
   | `/kafwhere troops 1` | the first troop recruiter, targeted | Raise an Army |
   | `/kafwhere troops 2` | the second troop recruiter, targeted | Raise an Army |
   | `/kafwhere command table` | the mission table. In Legion it is the Scouting Map; the Priest's is the Command Map, the Warrior's the Eye of Odyn, the Warlock's the Dreadscar Battle Plans ([Warcraft Wiki](https://warcraft.wiki.gg/wiki/Scouting_Map)) | Raise an Army: missions wear troops out and free their slots |
   | `/kafwhere portal` | only when the class enters through a portal (in Dalaran or elsewhere): stand in front of it. Each call also stores the map POIs of Dalaran and of the current map, the portal's among them | the travel step |
   | `/kafwhere travel <how>` | where the step happens, for example `/kafwhere travel Death Gate` or `/kafwhere travel click Secret Door inside Light's Hope Chapel` | the travel step |

   Then log out or switch character: the game writes the saved variables only on logout or `/reload`. Costs, research times, talent states and achievement progress are recorded by the command itself.

   - [x] Death Knight, Acherus: The Ebon Hold
   - [x] Demon Hunter, the Fel Hammer
   - [x] Druid, the Dreamgrove
   - [x] Hunter, Trueshot Lodge
   - [x] Mage, Hall of the Guardian
   - [x] Monk, Temple of Five Dawns
   - [x] Paladin, Sanctum of Light
   - [x] Priest, Netherlight Temple
   - [x] Rogue, Hall of Shadows
   - [x] Shaman, the Maelstrom
   - [x] Warlock, Dreadscar Rift
   - [x] Warrior, Skyhold

   **The other faction.** Some entrances in Dalaran differ between Alliance and Horde: the Paladin and Priest portals stand in the faction areas (Krowi). Krowi takes the Warrior, Shaman, Hunter, Rogue, Demon Hunter and Mage entrances to be the same for both factions, because they stand outside those areas, so they are not measured twice. The class halls and the travel spells (Death Gate, Zen Pilgrimage, Dreamwalk) are the same for both factions as well. What is left is `/kafwhere portal` on a character of the other faction. Since 2026-10-11 16:05 `/kafwhere` stores the faction itself. Every call also lists Dalaran's area POIs wherever the player stands (the Priest's entries inside Netherlight Temple have them). So a character of the right class and faction gets its portal's POI id and exact position from one `/kafwhere poi` anywhere. The POI id matters only for the super-track proposal under the findings below.
   - [x] Paladin, Horde: POI 5058 and the spot (see the Paladin results)
   - [x] Priest, Alliance: POI 5062 at 39.6, 57.3, from the game database; measured in game at 39.5, 57.3
   - [x] Warlock: one POI for both factions, 5061 "Dreadscar Rift", "Portal to Dreadscar Rift, Home of the Black Harvest", at 35.4, 38.7 on 627 and 27.7, 44.3 on 628, the floor it stands on
   - [x] Mage: no class POI in Dalaran; the way in is the class's own teleport spell

   **The class portals from the game database.** `_lookup_name.ps1 -Table areapoi -Name "Home of the"` (`.claude/skills/add-category-data/`) lists every class POI in Dalaran with its world position, its player condition (the class and faction gate, 41395-41401) and its area. A faction-split portal has two rows: Paladin 5057 Alliance and 5058 Horde, Priest 5062 Alliance and 5063 Horde. The others have one: Shaman 5059, Warrior 5060, Warlock 5061 and Rogue 5102. The Hunter, Demon Hunter and Mage have none, and the Death Knight's 5066 "Acherus" is a different POI elsewhere (world -1507, 1051). Converting the world position to percent on 627 (823.25 x 548.84 yards): map x = a - world Y x 100 / 823.25 and map y = b - world X x 100 / 548.84, with a and b fitted on 5057, 5058 and 5063. It reproduces the Shaman, Warrior and Rogue POIs, which were left out of the fit, within 0.03 of what the game reported. So a position taken only from the database can be trusted to 0.1: 5062 came out at 39.57, 57.25, and Krowi then measured 39.5, 57.3 standing at it.

   **Results so far.** Read from `KrowiAF_DebugTable.Where` with the vendored Lua. The entries before 16:05 carry no faction; it is taken from `KrowiAF_SavedData.CharacterList` (1 Alliance, 2 Horde, `Api/AchievementDataApi.lua:4`). Alliance: Paladin, Warrior, Death Knight, Shaman, Rogue, Monk, Demon Hunter. Horde: Hunter, Druid, Priest.
   - **Paladin, 2026-10-11 11:36-11:39.** The hall is uiMap 24 "Light's Hope Chapel" (ClassHall in `raw/MapVerifier.csv`, parent 23), 443 x 295 yards, so 0.1 percent is under half a yard. The map pin is allowed there.
     - research: Sir Alamande Graythorn (109901) at 39.9, 56.5
     - troops 1: Commander Ansela (106447) at 53.3, 56.2
     - troops 2: Commander Born (106448) at 58.9, 39.0
     - command table (the Scouting Map): 53.4, 78.6
     - portal, Alliance: Dalaran (627) at 32.7, 69.9, where the map pin is **not** allowed.
     - portal, Horde: area POI 5058 "Sanctum of Light", "Portal to the Sanctum of Light, Home of the Silver Hand", at 61.9, 13.5 on 627, atlas `groupfinder-icon-class-paladin`, from `/kafwhere poi` on a Horde Paladin at 17:07 (entry 65, the first to store `Faction`). Measured standing there on the Horde Priest at 16:06: 61.9, 13.6 (entry 64). A character sees only its own class's portal POI, so the Priest could not give the id. On Dalaran's map it is a POI, "Sanctum of Light: Portal to the Sanctum of Light, Home of the Silver Hand", and clicking it in game super-tracks it (Krowi, screenshot).
     - travel: the portal leads to Light's Hope Chapel; there, click the Secret Door at 41.2, 90.6 on map 24.
     - `GetTalentTreeIDsByClassID` gives the Paladin tree 119: the class gate works.
   - **Warrior, 2026-10-11 14:02-14:10.** The hall is uiMap 695 "Skyhold" (ClassHall, parent 619), 719 x 479 yards. The map pin is **not** allowed there, so for the Warrior every in-hall step falls back to TomTom or the coordinates as text.
     - research: Einar the Runecaster (107994) at 46.5, 29.0
     - troops 1: Captain Hjalmar Stahlstrom (106459) at 62.4, 15.1. Entry 14 is labelled `research` by mistake (Krowi), and entry 15 stands on the same spot without a target.
     - troops 2: Savyn Valorborn (106460) at 56.0, 15.0
     - command table (the Eye of Odyn): 59.3, 13.4. The stored target is left over from troops 2.
     - travel: in Dalaran, stand in the light and click the extra action button. The spot is area POI 5060 "Skyhold", "Entrance to Skyhold, Home of the Valarjar", at 75.0, 47.5 on 627. It can be super-tracked like the Paladin's portal.
     - The class gate gives tree 122. This Warrior has researched nothing yet: tier 0 reads Available (0), every higher tier "tier unavailable" (5).
   - **Death Knight, 2026-10-11 14:44-14:46.** Acherus has two floors, uiMap 647 and 648, each 467 x 312 yards. The map pin is allowed on both. A step therefore carries the floor's map id, as the `:Npc` data already does.
     - research: Archivist Zubashi (97485) at 47.7, 53.8 on 648, the same spot as the first probe
     - troops 1: Korgaz Deadaxe (106436) at 53.4, 68.6 on **647**
     - troops 2: Dark Summoner Marogh (106435) at 41.0, 74.0 on 648
     - travel: Death Gate (spell 50977). No Dalaran POI.
     - command table (the Scouting Map): 49.8, 50.6 on 648, recorded at 14:48
   - **Shaman, 2026-10-11 14:50-14:52.** The hall is uiMap 726 "The Maelstrom" (parent 619), 1050 x 700 yards. The map pin is **not** allowed there.
     - research: Journeyman Goldmine (112199) at 33.4, 58.2
     - troops 1: Summoner Morn (106457) at 30.5, 58.8
     - troops 2: Felinda Frye (112208) at 29.2, 42.7
     - command table (the Scouting Map): 33.5, 59.5
     - portal: area POI 5059 "Maelstrom", "Portal to the Maelstrom, Home of the Earthen Ring", at 67.1, 48.1 on 627. Measured standing there: 67.0, 48.2.
     - The class gate gives tree 31.
   - **Hunter, 2026-10-11 14:55-15:00.** The hall is uiMap 739 "Trueshot Lodge", under Highmountain (650), 783 x 521 yards. The map pin is allowed there.
     - research: Survivalist Bahn (108050) at 58.7, 51.1
     - troops 1: Lenara (106444) at 42.8, 37.7
     - troops 2: Sampson (106446) at 57.7, 32.6
     - command table (the Scouting Map): 42.5, 46.7. The stored target, Outfitter Reynolds, was left over.
     - travel: in Dalaran, talk to Talua (108868) at 72.9, 41.2 on 627 and choose "I'd like an eagle to Trueshot Lodge" (option 1). Or fly there from anywhere on the Broken Isles (Krowi).
     - Dalaran has no Hunter POI, so this travel step is an NPC step on 627, where the map pin is refused: TomTom or the coordinates as text.
     - The class gate gives tree 113.
   - **Rogue, 2026-10-11 15:06-15:14.** The hall is uiMap 626, also named "Dalaran" (ClassHall in `raw/MapVerifier.csv`, parent 619), 305 x 203 yards. The map pin is **not** allowed there. The name collides with 627, so a guide line naming the map must not read "Dalaran" for both; the hall's POI name, "Hall of Shadows", is the better label.
     - research: Winstone Wolfe (105998) at 46.0, 69.2
     - troops 1: Yancey Grillsen (106083) at 48.2, 41.3
     - troops 2: Lonika Stillblade (105979) at 31.9, 26.8
     - command table (the Scouting Map): 37.5, 44.3. The stored target, Marin Noggenfogger, was left over.
     - travel, three entrances, all on 627 and all needing the insignia:
       1. "Red" Jack Findle (97004) at 53.0, 70.7: lay your insignia on the table (option 1), and the hidden bookcase door on your left opens. Area POI 5102 "Hall of Shadows", "Home of the Uncrowned", marks it at 52.7, 70.3 on 627 (77.2, 84.0 on 626).
       2. Mongar (93188) at 46.3, 26.7: flash your insignia (option 2), and the Knocker on your left activates. Krowi's label calls this one "subtlety".
       3. Lucian Trias (96782) at 54.2, 31.9: lay your insignia on the table (option 1), and the Knocker on your right activates.
     - The class gate gives tree 131.
   - **Monk, 2026-10-11 15:16-15:19.** The hall is on uiMap 709 "The Wandering Isle" (ClassHall, parent 619), 2671 x 1779 yards. That is the largest hall map so far: 0.1 percent is about 2.7 yards, still enough to tell the four spots apart, which sit within 30 to 80 yards of each other. The map pin is **not** allowed there. Two other uiMaps share the name (378 and 2366, both Skip); 709 is the class hall.
     - research: Number Nine Jia (98939) at 53.0, 59.8
     - troops 1: Tianji (105015) at 53.3, 59.8
     - troops 2: Gin Lai (105019) at 54.4, 57.2
     - command table (the Scouting Map): 52.9, 60.2
     - travel: cast Zen Pilgrimage. Its spell id is still to be looked up for the Travel step. No Dalaran POI.
     - The class gate gives tree 4.
   - **Druid, 2026-10-11 15:21-15:27.** The NPCs stand on uiMap 747 "The Dreamgrove", under Val'sharah (641), 881 x 588 yards. `raw/MapVerifier.csv` marks 715 "Emerald Dreamway" as the ClassHall and links 747 to it; the guide uses the map the NPC stands on, 747. The map pin is **not** allowed there.
     - research: Leafbeard the Storied (97989) at 32.7, 29.4
     - troops 1: Sister Lilith (108393) at 36.3, 25.3. Entry 46 is the same spot without a target.
     - troops 2: Yaris Darkclaw (106442) at 38.5, 34.2
     - command table (the Scouting Map): 52.7, 51.1
     - travel: cast Dreamwalk, then go through the Dreamgrove portal in the Emerald Dreamway, at 45.2, 26.4 on uiMap 715 (map pin not allowed). Or fly in from anywhere on the Broken Isles, as the Hunter does. Dreamwalk's spell id is still to be looked up. No Dalaran POI.
     - The class gate gives tree 107.
   - **Demon Hunter, 2026-10-11 15:29-15:36.** The Fel Hammer has two floors, uiMap 720 and 721, both "Mardum, the Shattered Abyss", each 413 x 275 yards. `raw/MapVerifier.csv` marks their parent 719 as the ClassHall and links both to it. The map pin is **not** allowed there.
     - research: Loramus Thalipedes (108527) at 55.3, 62.7 on **721**, the other floor from the rest
     - troops 1: Battlelord Gaardoun (103025) at 56.2, 54.2 on 720
     - troops 2: Lady S'theno (112628) at 62.1, 54.0 on 720
     - command table (the Scouting Map): 58.9, 54.9 on 720. The stored target was left over from troops 2.
     - travel: click the Illidari Gateway in Dalaran, at 98.0, 69.3 on 627, the map's east edge. It is an object, not an area POI (no Demon Hunter POI on 627), so the step uses TomTom or the coordinates as text.
     - The class gate gives tree 125.
   - **Priest (Horde), 2026-10-11 15:50-16:02.** The hall is uiMap 702 "Netherlight Temple" (ClassHall, parent 619), 465 x 310 yards. The map pin is **not** allowed there.
     - research: Archon Torias (110725) at 56.0, 40.7
     - troops 1: Grand Anchorite Gesslar (106450) at 40.9, 27.6
     - troops 2: Vicar Eliza (106451) at 40.8, 53.9
     - command table (the Command Map): 49.8, 48.9. The stored target was left over from troops 2.
     - portal, Horde: area POI 5063 "Netherlight Temple", "Portal to Netherlight Temple, Home of the Conclave", at 62.9, 17.6 on 627, atlas `groupfinder-icon-class-priest`. Measured standing there: 63.0, 17.7.
     - portal, Alliance: area POI 5062, the same name, description and icon, at 39.6, 57.3 on 627, from the game database (see "The other faction" below). Measured standing there on the Alliance Paladin at 17:11: 39.5, 57.3 (entry 66).
     - The class gate gives tree 134. Tier VII (501 Hooded Priests, 502 Roster of Champions) reads `talentAvailability` 3, `UnavailableNotEnoughResources`: unlike the other classes so far, the tier is open and only the Order Resources are missing.
   - **Mage (Alliance), 2026-10-11 17:16-17:24.** The hall is uiMap 734 "Hall of the Guardian" (ClassHall, parent 627 Dalaran; 735 is linked to it in `raw/MapVerifier.csv`), 322 x 215 yards. The map pin is **not** allowed there.
     - research: Chronicler Elrianne (108331) at 74.9, 28.9
     - troops 1: Grand Conjurer Mimic (106433) at 47.8, 32.1 (entry 72; entry 67 is the same spot without a target)
     - troops 2: Archmage Omniara (106377) at 87.9, 47.5
     - command table (the Scouting Map): 81.4, 61.0. The stored target was left over from research.
     - travel: cast Teleport: Hall of the Guardian (spell 193759, from the spell link Krowi put in the label). No Dalaran POI.
     - The class gate gives tree 116. Between 17:17:09 and 17:17:50 the Mage started researching Teleportation Nexus (386, tier 1): from then on it reads `isBeingResearched` true, and the talents it blocks read `talentAvailability` 2 (`UnavailableAnotherIsResearching`). That is the renderer's "researching" state, seen live.
   - **Warlock (Horde), 2026-10-11 17:25-17:30.** The hall is uiMap 717 "Dreadscar Rift" (ClassHall, parent 619; 718 of the same name is Skip), 758 x 506 yards. The map pin is **not** allowed there.
     - research: Archivist Melinda (108018) at 55.3, 41.0
     - troops 1: Imp Mother Dyala (106216) at 66.8, 30.6
     - troops 2: Jared (106217) at 61.5, 51.8
     - command table (the Dreadscar Battle Plans): 66.2, 47.0. The stored target, Mile Raitheborne (111740), is a mistake (Krowi).
     - Entry 76, labelled `troops 1/ta` (Dreadscar Incinerator, 101912, at 42.1, 42.2), is a mistake (Krowi); ignore it.
     - portal: area POI 5061, standing in front of it at 28.5, 44.5 on uiMap **628**, Dalaran's lower floor (linked to 627 in `raw/MapVerifier.csv`), 447 x 298 yards. The POI shows on both maps: at 27.7, 44.3 on 628 and at 35.4, 38.7 on 627, the latter exactly the database conversion. The portal is underground, so a waypoint on 627 points at the street above it. A TomTom or text step for the Warlock uses 628; super-tracking the POI leaves the floor to the game. `/kafwhere poi` on each floor (entries 80 on 627 and 81 on 628, 17:31-17:32) gives the same two positions.
     - travel: go down into the Underbelly at 34.6, 45.5 on 627 (entry 82, 17:34, "underbelly entrance for portal warlock"), then to the portal on 628.
     - Entry 79, labelled `portal` (39.1, 45.0 on 627), is to be ignored (Krowi).
     - The class gate gives tree 110. Between 17:25:50 and 17:26:13 the Warlock started researching Summon Doomguard (359, tier 0), with the same readings as the Mage's.
   - **Findings that change the design:**
     - `GetAchievementNumCriteria` returns 0 for 11223 and 60962-60973 in game: their criteria are hidden. `GetAchievementCriteriaInfo(id, i, true)` (`countHidden`) returns them, confirmed on the Paladin at 11:52 for all twelve, with type 198, the asset, the quantity and the completed flag. One index past the last raises the Lua error "criteria not found" instead of returning nil, so the renderer reads them under `pcall` and stops at the first error. That run also gave every class's Tier VII talent pair and tree id (DK 128, DH 125, Druid 107, Hunter 113, Mage 116, Monk 4, Paladin 119, Priest 134, Rogue 131, Shaman 31, Warlock 110, Warrior 122). The sibling guides need no talent ids in their data.
     - **Either Tier VII talent completes a Legendary Research achievement:** root tree operator 8 (any), amount 1 (`_lookup_criteria.ps1`, which now prints the root operator). The spec's Facts and its tip example are corrected. The API does not expose the operator, so the Criteria step lists both talents with their state, the achievement's completion says when it is done, and the tip says "either".
     - A talent's `researched` flag is its state now, not the criterion. The Paladin completed 60968 but has swapped Tier VII to Roster of Champions (481), so Silver Hand Crusaders (480) reads not researched and `talentAvailability` 0 (Available). The renderer therefore shows a talent as done when the achievement or the criterion is complete, and uses the talent state only before that.
     - Dalaran (627) refuses the map pin. 627 is also the real map for `waypoint-map-pin-disallowed` in game.
     - **Proposal, accepted on 2026-10-11 (Krowi): a fifth research state.** The Priest's Tier VII reads `talentAvailability` 3 (`UnavailableNotEnoughResources`): the tier is unlocked, and only the cost stands between the player and the research. The four states above would show it as "not yet". A fifth state could name the gap from the live cost in `researchCurrencyCosts`, for example "needs 10,000 Order Resources". It needs one more string and no data.
     - **Proposal, accepted on 2026-10-11 (Krowi): a faction on a step.** Some Dalaran entrances differ per faction, so one guide holds both and the renderer drops the other faction's. A step takes an optional `KrowiAF.Enum.Faction`, the enum `FactionSplit` already uses, and is shown only when it matches `UnitFactionGroup("player")`. A step without one shows for both. The headless suite gets a scenario per faction.
     - **Proposal, accepted on 2026-10-11 (Krowi): a third target kind, the map POI.** A portal is an area POI, and `C_SuperTrack.SetSuperTrackedMapPin(Enum.SuperTrackingMapPinType.AreaPOI, areaPoiID)` super-tracks one from code (`SecretArguments = "AllowedWhenUntainted"`, `Blizzard_APIDocumentationGenerated/SuperTrackManagerDocumentation.lua:148`). That is a different system from the user waypoint, so Dalaran's refusal should not apply. Krowi's in-game `/run` on the Paladin (2026-10-11) found the portal by name among `C_AreaPoiInfo.GetAreaPOIForMap(627)` as **area POI 5057**, then called `SetSuperTrackedMapPin(0, 5057)`, and the waypoint landed on the portal (Krowi, confirmed in game). `/kafwhere poi` at 11:52 stored the POI: 5057 "Sanctum of Light", "Portal to the Sanctum of Light, Home of the Silver Hand", at 32.7, 69.8 on 627, atlas `groupfinder-icon-class-paladin`. That is 0.1 from the spot measured standing at it. The POI's position from `C_AreaPoiInfo.GetAreaPOIInfo` is exact, and its name and description come in the player's language. Fallbacks, in order:
       1. super-track the POI;
       2. TomTom on its position;
       3. the coordinates as text. Since 12.1 the default world map shows player and cursor coordinates (CVars `worldMapShowPlayerCoords` and `worldMapShowCursorCoords`, `Blizzard_WorldMap/Blizzard_WorldMapTemplates.lua:551-605`), so a player can follow them without an addon;
       4. the place described by its in-game name.
     - Raise an Army counts only recruitments since 11.2.7: the Paladin shows 1/20 on 60987 despite Legion-era troops. Progress is account-wide: the Paladin sees 7/20 on the Priest's 60988.

## Files that change
**Data**
- New `Api/GuideDataApi.lua`:
  - `KrowiAF.GuideData = {}`.
  - `KrowiAF.AddGuideData(id, steps)` reports `LoadDiagnostics.Kind.UnregisteredAchievement` with the detail "guide", asserts against a second guide, and sets `achievement.Guide`. It is a copy of `Api/TransmogSetDataApi.lua`.
- New `Api/GuideDataBuilder.lua`:
  - `KrowiAF.Guide(id)` returns `setmetatable({KrowiAF.AddGuideData, id, {}}, GuideBuilder)`, the pattern of `Api/AchievementDataBuilder.lua:144-146`, so no loader is needed.
  - Methods `:Travel(spellId)`, `:Npc(npcId, name, uiMapId, x, y)`, `:Poi(areaPoiId, uiMapId, x, y)`, `:Criteria()` and `:Tip(text)` append flat `{Type = ..., ...}` steps.
  - `:Faction(faction)` sets `Faction` (a `KrowiAF.Enum.Faction`) on the step before it, for example `:Poi(5057, 627, 32.7, 69.8):Faction(faction.Alliance)`.
  - A `:Poi` carries its map and coordinates, read from `/kafwhere poi` or the area POI table, for the fallbacks.
- `Api/Files.xml`: register both files.
- `Data/Data.lua`:
  - `RegisterGuideDataTasks`, a copy of `RegisterTransmogSetDataTasks` (`:98-105`).
  - It is called after the achievement tasks (`:152-160`), because groups run in registration order.
- New `DataAddons/Retail/07_Legion/GuideData.lua`, holding the 60962 guide: Travel 50977 (Death Gate), Npc 97485 at the step-0 coordinates, Criteria, and the tip. Register it in `07_Legion/Files.xml` between EventData and PetBattleLinkData.
- Headless:
  - `.claude/tools/headless/load-data.lua:42` and `client-env.lua:313-314`: add `GuideData` and `RegisterGuideDataTasks`.
  - `snapshot-data.lua`: add `Guide` to `achievementFields` (`:334-336`) and a GUIDE section, modelled on TRANSMOG (`:474-487`). It prints ids only (step types, spell, NPC, map, x, y), which keeps the snapshot's "ids only" rule. Then regenerate the snapshots.

**Shared logic** (new folder `Gui/Guide/`, one `Guide.xml` listed in both `Gui/FilesModern.xml` and `Gui/FilesClassic.xml`)
- `Guide.lua` (`addon.Gui.Guide`) renders one achievement's guide for every surface: `GetLines(achievement)` returns `{Text, Waypoint = {MapId, X, Y, Title}}`.
  - Travel: the spell name.
  - Npc: "Talk to <name>, <map name>", the map name through `C_Map.GetMapInfo`.
  - Criteria: for each criterion of type 198, `GetAchievementCriteriaInfo(id, i, true)` gives the asset (the criteria are hidden; read under `pcall` up to the first error, see Step 0), and `C_Garrison.GetTalentInfo(asset)` gives the name and one of four states: researched, researching, locked (`talentAvailability` is `Enum.GarrisonTalentAvailability.UnavailableTierUnavailable`, shown as "locked, finish the previous tier first"), or not yet. Krowi added the locked state on 2026-10-11 after the step-0 probe. It is guarded when the API is missing.
    - The fifth state (decided after step 0): `talentAvailability` `Enum.GarrisonTalentAvailability.UnavailableNotEnoughResources` reads "needs <amount> <currency>". The amount comes from `researchCurrencyCosts[1].currencyQuantity` through `BreakUpLargeNumbers`, and the currency name from `C_CurrencyInfo.GetCurrencyInfo(currencyType).name`.
  - Poi: the POI's name from `C_AreaPoiInfo.GetAreaPOIInfo(uiMapId, areaPoiId)`, and the map name as for Npc. When the game returns no POI info, an `addon.L` fallback name is used (see Risks). The waypoint gets `PoiId`.
  - A step with a `Faction` other than `UnitFactionGroup("player")` is skipped.
    - The state shows only when the talent's `treeID` is among `C_Garrison.GetTalentTreeIDsByClassID(Enum.GarrisonType.Type_7_0_Garrison, classId)`, with `classId` the third return of `UnitClass("player")` (not secret; `Globals.lua:222` already reads it, and Blizzard does the same at `Blizzard_OrderHallUI/Blizzard_OrderHallTalents.lua:670-671`). Any other class gets the name only.
  - Tip.
- `Waypoint.lua`:
  - Providers:
    - **Map pin**: needs `C_Map.SetUserWaypoint` and `UiMapPoint`; checks `C_Map.CanSetUserWaypointOnMap`; sets the waypoint, then `C_SuperTrack.SetSuperTrackedUserWaypoint(true)`.
      - For a waypoint with a `PoiId` it calls `C_SuperTrack.SetSuperTrackedMapPin(Enum.SuperTrackingMapPinType.AreaPOI, poiId)` instead, which works where the user waypoint is refused.
    - **TomTom**: `C_AddOns.IsAddOnLoaded("TomTom")`, then `TomTom:AddWaypoint(map, x/100, y/100, {title, from = addon.Metadata.Title})`.
  - `GetActions(waypoint)` returns `{Text, Func, Enabled}` for the provider option.
- `GuidePanel.xml`, `GuidePanel.lua` and `GuidePanelMixin.lua`: a singleton `KrowiAF_GuidePanel`, modelled on `Gui/RewardPreview/` (`TooltipBorderBackdropTemplate`, HIGH strata, title, close button). `TogglePin(button, achievement)` anchors it TOPLEFT to the button's TOPRIGHT, as in `RewardPreview.lua:38-91`. It holds one FontString per line and one small button per waypoint action, closes when its owner window hides, and registers for Escape.

**Surfaces**
- **Tooltip.** New `Gui/AchievementTooltip/Guide.lua` replaces the `Comment.lua` placeholder: delete that file and its commented line in `Files.xml:15`, and add `Guide.lua` in the same place.
  - `CheckAdd` checks the option and `achievement.Guide`, as in `AddedInVersion.lua:1-10`.
  - `Add` writes the header, then white wrapped lines (`AddLine(text, 1, 1, 1, true)`).
- **Right-click menu.** New `Gui/RightClickMenu/AchievementMenu/Guide.lua`, after `GoTo.lua` in that `Files.xml`. It is a "Guide" submenu (the `GoTo.lua:16-31` pattern) holding "Open guide" (the panel, when the icon option is on) and the waypoint actions (`CreateButtonAndAdd(menu, text, func, isEnabled)`).
- **Row icon.** In `AchievementButtonExtraIconFactory.lua`, `SetExtraIconGuide`:
  - It is gated by the option and `achievement.Guide`, and goes before reward preview, which stays last (`:261-271`).
  - Its `OnClickCallback` calls `TogglePin`, and its tooltip `Lines` says "Guide: click to open".
  - Any new icon field is added to `ResetExtraIcons` (`:42-61`).
  - The atlas is checked in both UI sources.
- **Expanded row.** In `AchievementButtonMixin.lua:DisplayObjectives`:
  - The block is inserted between `:309` and `:311`: a guide block anchored under the objectives, its height added to the row's.
  - It hides on collapse (like `:566-570`) and has its own cache next to `:289`.
  - The block is shared and reparented, like `KrowiAF_AchievementsObjectives`, with its own instance for the popout (`AchievementPopoutMixin.lua:81-85` picks up the height).
  - Waypoint actions are small buttons, since no hyperlink pattern exists in `Gui/`.

**Options, strings, docs**
- `Options/Defaults.lua`: add `Achievements.Guide`.
- `Options/Layout.lua`: a "Guide" group with four toggles and a select, modelled on `:1782-1789`, using `KAF_AddDefaultValueText`. The row-option setters call `KrowiAF_AchievementsFrame:ForceUpdate()`, as at `:510-517`.
- `OPTIONS.md`: document the new group.
- `Localization/*.lua`, 11 locales: new keys below `Exported at` (Guide, the option names with their Desc, Set waypoint, Open guide, Talk to, Travel, Take the portal, the five research states, the disabled reasons, Map pin, "Archivist Zubashi" and the tip).
  - A Blizzard global string is used wherever an exact one exists.
  - Translations are drafted by the agent and flagged to the maintainer.
- `Globals.lua`: a debug-only `/kafwhere`, next to `/kafait` (`:172`). It prints the player's map id and percent coordinates as a ready `:Npc(...)` argument list. It reads no unit identity, so no secret values.
  - Pulled forward on 2026-10-11 so Krowi could probe every class during their dailies. For now it also stores each call in `KrowiAF_DebugTable.Where`: the target's name and NPC id (guarded with `issecretvalue`, since `UnitGUID` and `UnitName` can be secret), the class's Legion class hall talents with their state, and the criteria of 11223 and 60962-60973 with the talent state of every type-198 asset. These extras serve the sibling guides and get trimmed back in milestone A. Each call takes a label (`/kafwhere research`, `troops 1`, `troops 2`, `scouting map`, `command table`, `portal`), because objects cannot be targeted. Krowi's per-class round starts with the Paladin. Entries before 2026-10-11 11:32 are test runs; ignore them. Since 16:05 each call also stores the player's faction.
- `.luarc.json`: add the `TomTom` global between `TableToString` and `UNTRACK_ACHIEVEMENT_TOOLTIP`.
- `_Packaging/Changelog.md`: one line under 102.1 `### Added`.
- `docs/architecture.md`: add `Gui/Guide/` to the file map.

**Tests**
- New `Tests/Guide.lua`, registered in `Tests/Files.xml`. Add `suites.guide` in `run-tests.lua`, with stubs modelled on the tooltip suite (`:719-797`): `C_Spell`, `C_Map`, `GetAchievementCriteriaInfo` (type 198, assets 486 and 487), `C_Garrison` (with `GetTalentTreeIDsByClassID` returning tree 128 or not), `UnitClass`, `TomTom` present or absent, and the options. Add the suite to `Tests/README.md` and to the instruction file's suite list (line 40).

## Order of work
1. **Scenarios first.** Write `Tests/Guide.lua` and `suites.guide`, with Recorded set to today's behaviour ("none"). *As built on 2026-10-11:* 23 scenarios in five kinds; the list planned at the gate is split finer.
   - **Surface**, the real tooltip and right-click menu: `tooltip-60962` (Target "shown"), `tooltip-options-off`, `tooltip-no-guide-11223`, `menu-60962` (Target "Guide:2/2": Open guide and the map pin), `menu-options-off`, `menu-no-guide-11223`. The menu runs only the guide section, into a recording menu builder, so no real menu opens in game.
   - **Talent**, one per research state: `talent-not-yet`, `talent-researching`, `talent-locked`, `talent-cost`, `talent-researched`, `talent-swapped` (the Paladin case: the criterion stays done), `talent-other-class` (name only). These replace the planned `tooltip-60962-other-class`, `-locked` and `-cost`. They run on talent tables written in the suite, because in game the state of the character running the test would decide the outcome.
   - **Faction**: `faction-alliance`, `faction-horde`, on a Paladin guide written in the suite.
   - **Waypoint**, the actions per provider and what can place the point: `waypoint-both-without-tomtom`, `waypoint-both-with-tomtom`, `waypoint-tomtom-missing`, `waypoint-map-pin-disallowed`, `waypoint-both-nothing-places` (the map pin, disabled with its reason), `waypoint-poi`, `waypoint-poi-hidden` (another class: TomTom only).
   - **Availability**, live: `waypoint-availability`, Acherus 648 allows the map pin and Dalaran 627 refuses it.
   - Surface, Talent and Availability are Retail only; Classic runs 9.

   The interfaces the code must provide are listed in the header of `Tests/Guide.lua`. These are added to what this plan already names:
   - `GetLines` items carry `Kind` and `State`.
   - `GetSteps(achievement, faction)`.
   - `GetTalentState(info, isOwnClass, isCriterionCompleted)`.
   - `Waypoint.GetActions(waypoint, provider, available)`, with `Waypoint.GetAvailability(waypoint)` reading `available` from the game.
   - The menu section is reachable as `AchievementMenu.GuideSection`.

   Run the headless suite and confirm everything passes and is open. Deploy, then you run `/kaftest guide`, and `Read-GameTests.ps1` must be green. Commit `test: guide suite for achievement guides`.
2. **Data.** The API, builder, registration, headless registries and the 60962 guide with the step-0 coordinates, plus its strings in every locale. Run `load-data.lua Both` (no drops), then `snapshot-data.lua -write`; the diff must show 60962's guide and nothing else. Commit `feat(data): guide data and the 60962 guide`.
3. **Milestone A: renderer, waypoints, options, tooltip and right-click menu.** Add `/kafwhere`. Set Recorded to Target for these scenarios, then run the suite and `Check-Repo -ChangedOnly -Luals`. In game on Retail, with and without TomTom: hover, right-click, set the waypoint. Commit.
4. **Milestone B: row icon and side panel, then the expanded row.** Check the row heights with and without objectives, and under GW2_UI if available. In game again. Commit.
5. **Wrap up.** Changelog, `OPTIONS.md`, architecture, `.luarc.json`. Run the `taint-reviewer` on the diff, `/code-review`, the in-game after-run on Retail and a `/reload` on Classic with `Read-GameErrors.ps1` on both. Set the work files to `done`, open the PR against `dev`, and wait for the merge gate.

## Risks
- **Taint from super-tracking.** A user waypoint changes what the objective tracker and the map show. Mitigation: a click-only call path, the `taint-reviewer`, and an in-game check that sets a waypoint and then enters combat with no errors.
- **Expanded-row height.** It is off by default, the block is anchored to the objectives frame (so GW2_UI's re-anchoring still holds), and its height is added after the description and reward adjustments, so the `CollapsedHeight` test at `:303` is unchanged.
- **Icon pool.** An icon field not cleared in `ResetExtraIcons` leaks to a recycled row. It is added there, and a no-guide scenario covers it.
- **Classic.** `C_Garrison`, `C_Spell`, `UiMapPoint` and the map pin may be missing. Every call is guarded by an existence check, and no Classic guide data is written; the Classic `/reload` checks this.
- **Stale data.** Coordinates come only from the step-0 probe or `/kafwhere`. Costs and times come live from `C_Garrison`, never typed.
- **A POI another class cannot see.** Each class portal POI is gated by a player condition for that class and faction (41395-41401). A player viewing another class's guide may therefore get nothing from `C_AreaPoiInfo.GetAreaPOIInfo`, and a super-track request that silently fails. Mitigation:
  - the name falls back to an `addon.L` string;
  - the Blizzard action is offered only when `GetAreaPOIInfo` returns the POI, and otherwise TomTom or the coordinates;
  - the in-game check opens a Paladin guide on another class.
- **Scope.** Four surfaces is a lot of GUI for one guide. Milestone A works on its own, and B can be deferred if the in-game check of A changes the maintainer's mind.

## Proof
- `& ".claude\tools\lua51\lua.exe" ".claude\tools\headless\run-tests.lua" "$PWD" guide`: every scenario PASS, none open.
- `load-data.lua "$PWD" Both`: no errors or drops. The snapshot diff is limited to 60962.
- `Check-Repo.ps1 -ChangedOnly -Luals`: 0 errors.
- In game on Retail: `/kaftest guide` is green in `Read-GameTests.ps1`. Hovering 60962 on a Death Knight shows the Guide section with the live talent state, and on another class the talent names without a state. Right-click → Guide → Set waypoint puts the pin or TomTom arrow on Zubashi. The icon opens the panel and Escape closes it. The expanded-row option adds the block. `Read-GameErrors.ps1` is clean.
- On Classic: `/reload`, open the window and hover an achievement. Nothing new appears, and `Read-GameErrors.ps1 -Client Classic` is clean.

## Found on the way (separate work items, not in this one)
- `PetBattleLinks.lua:25,36,70` and `Options/General.lua:62` call `LibStub` with names nothing registers (`Krowi_PopupDialog-1.0`, `Krowi_MenuBuilder-1.0`). Unless another installed addon still ships those libraries, the Xu-Fu links and the general tutorial raise an error.
- `AchievementMenu.lua:27` passes `disabled` (true) as the builder's `isEnabled`, so the "(Missing)" entries stay clickable.
- `achievement:AddTransmogSet` has no callers, so `achievement.TransmogSets` is always nil and the `MostProgress.lua:7` condition on it never fires.