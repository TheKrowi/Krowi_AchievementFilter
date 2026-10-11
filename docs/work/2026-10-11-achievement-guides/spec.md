# Spec: Achievement guides and waypoints
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. An achievement can carry a guide: a few short steps that say where to go, whom to talk to or what to do, and what it takes. 60962 Legendary Research of the Ebon Blade is the first and only one in this work item.
2. The player reads the guide in game, from the achievements window, without opening a browser.
3. A guide step that names a place offers a waypoint. One click places it on that spot. The player follows it with the game's own navigation on Retail, or with TomTom when it is loaded.
4. Names the game knows (map, spell, garrison talent, item, currency) are shown in the player's language through the game's API, never typed into the data. Hand-written text is kept to an optional one-line tip per guide.
5. Where the game can tell the player's own progress on a step (a garrison talent researched, being researched, or not yet), the guide shows it live.
6. An achievement without a guide looks and behaves exactly as it does today, on both clients.
7. Guide data follows the data rules: one place per achievement; a guide for an unregistered achievement is reported to `LoadDiagnostics`; the headless pipeline loads it; the data snapshot shows it.
8. Coordinates in a guide are measured in game, not copied from a website.
9. Adding the guides of the eleven sibling "Legendary Research of ..." achievements later is a data-only change.

## Facts behind 60962
- **What it really asks.** The description says "Research all Death Knight Class Hall Upgrades.", but the criteria tree (221770, build 12.1.0.69933, `_lookup_criteria.ps1`) has only two criteria, both type 198 (garrison talent researched): asset 486 "Frost and Death" and asset 487 "Roster of Champions". Both are tier index 6 (Tier VII) of the Death Knight class hall tree 128 (`garrtalent` table), and a tier holds only one researched talent at a time. So the player researches Tiers I to VI, then one Tier VII talent, then swaps to the other. The criteria names are empty strings, so the achievement window shows nothing useful for them today. The generic 11223 Legendary Research only asks for the 6th tier (criteria type 197).
- **Where.** Archivist Zubashi (NPC 97485) offers the Class Hall Upgrades in Acherus: The Ebon Hold (Warcraft Wiki). Acherus is uiMap 647 and 648, both micro maps (type 5) under Broken Isles 619. That is why Wowhead lists him under "Broken Shore" without coordinates. NPC spawns are server-side and not in the client database, so his floor and coordinates must be measured in game.
- **Unlock.** Zubashi appears after the class-campaign mission "Troops in the Field" and the quest "Tech It Up A Notch" (Warcraft Wiki, Archivist Zubashi and Order Advancement). Tier costs and research times run from 50 Order Resources and 2 hours (Tier I) to 10,000 and 1 day (Tier VII). The wiki was last edited in March 2024, so the numbers are not quoted in the guide. `C_Garrison.GetTalentInfo` returns the live cost and duration instead.
- **Data placement.** The achievement is registered in `DataAddons/Retail/11_TheWarWithin/AchievementData.lua:1160` (patch block 11_02_07, the housing-decor rewards) and placed on Acherus in `DataAddons/Retail/07_Legion/ZoneData.lua:138` (uncommitted zone work on `dev`). Its category is in `DataAddons/Retail/07_Legion/CategoryData.lua:576`.

## Existing parts the design builds on
- **Tooltip sections.** `Gui/AchievementTooltip/AchievementTooltip.lua:122-141` walks `Sections` in the order of `Gui/AchievementTooltip/Files.xml`. A disabled placeholder for this very idea is already there: `Gui/AchievementTooltip/Comment.lua` ("This could be a lot of extra text that could explain how to get this achievement ... if this should be added here or if there could be another place"), commented out at `Files.xml:15`.
- **Right-click menu sections.** `Gui/RightClickMenu/AchievementMenu/AchievementMenu.lua:58-68` builds the menu from sections with `CheckAdd`/`Add(menu, achievement, menuBuilder)`, in the order of that folder's `Files.xml`. `GoTo.lua` is the submenu pattern. The plugin hook at `:67` is how the IAT plugin adds "IAT Tactics" (`Plugins/InstanceAchievementTracker.lua:46-58`).
- **Per-achievement data.** Each data type has a `KrowiAF.<X>Data` table and an `Add<X>Data` function in `Api/`, a loader in `DataAddons/Loaders/`, and its source tag through `Data/Data.lua:55-105`. `TransmogSetData` (`Api/TransmogSetDataApi.lua:5-10`) hangs a field on the `Achievement` object and reports an unregistered id. `snapshot-data.lua:334,379` serializes a new field without changes, and `load-data.lua:42` lists the registries.
- **Guide addons already integrated.** IAT ("IAT Tactics", right-click) and Zygor (a guide icon on the row, `Plugins/ZygorGuidesViewer.lua`).
- **Waypoints.** No waypoint code exists anywhere in the repo. On Retail, `C_Map.CanSetUserWaypointOnMap`, `C_Map.SetUserWaypoint`, `UiMapPoint.CreateFromCoordinates` (`Blizzard_ObjectAPI/Mainline/UiMapPoint.lua:3`) and `C_SuperTrack.SetSuperTrackedUserWaypoint` exist. All are flagged `SecretArguments = "AllowedWhenUntainted"`, and the addon passes only its own numbers. The Classic UI source (5.5.4) has no `UiMapPoint` and no user-waypoint pin, only Plunderstorm leftovers. TomTom v4.3.12 (installed on Retail here) takes `TomTom:AddWaypoint(uiMapID, x, y, { title = ..., from = ... })` with x and y from 0 to 1 (`TomTom.lua:971`).
- **Live research state.** `C_Garrison.GetTalentInfo(talentID)` returns `name`, `tier`, `researched`, `isBeingResearched`, `researchDuration` and `researchCurrencyCosts`, with no secret returns flagged.

## Design
Option 1's content model, with the surfaces of options 1 and 3 and the expanded row together, and both waypoint providers, as decided below. Each surface and the waypoint provider is a player option.

**Content: structured steps, names from the game, one optional tip.** A guide is a short list of typed steps. Each type renders itself from ids, so almost nothing needs translating:

| Step | Data | Rendered as (enUS) |
|------|------|--------------------|
| Travel | spell id | "Travel: Death Gate", spell name from `C_Spell.GetSpellName` |
| Npc | NPC name key, uiMapID, x, y | "Talk to Archivist Zubashi, Acherus: The Ebon Hold", with a waypoint; map name from `C_Map.GetMapInfo` |
| Criteria | none: derived | for each criterion of type 198, its talent name from `C_Garrison.GetTalentInfo(assetID)` with researched / researching / not yet |
| Tip | one `addon.L` string | "Research one Tier VII upgrade, then switch to the other." |

The NPC name is the only name the game API cannot return reliably (creature names come from the server cache), so it goes through `addon.L` as the pet-battle data already does for NPC names. The Criteria step is generic: every achievement with type-198 criteria gets it from the criteria themselves, so the guide data holds only what the game does not know (the NPC, its spot, the travel hint, the tip).

A sketch of the data, illustrative only (the builder's final shape is the plan's job):

```lua
KrowiAF.GuideData["07_Legion"] = {
    Guide(60962) -- Legendary Research of the Ebon Blade
        :Travel(50977) -- Death Gate
        :Npc(addon.L["Archivist Zubashi"], 648, 0.00, 0.00) -- coordinates measured in game
        :Criteria() -- Frost and Death, Roster of Champions (type 198)
        :Tip(addon.L["Research one Tier VII upgrade, then switch to the other."]),
}
```

The file sits in the expansion of the content, `DataAddons/Retail/07_Legion/`, like the zone data, not in the expansion of the patch that added the achievement. Its API lives in `Api/GuideDataApi.lua`. It sets `achievement.Guide` and reports an unregistered id, as `TransmogSetData` does, and it has a loader, the registry entry in `load-data.lua` and a line in the data snapshot.

**Surfaces: four views of one guide, each switched on or off in the options.** They are not exclusive. Every surface renders the same step list from one shared renderer, so a step reads the same everywhere. Each surface checks for a guide first, so requirement 6 holds whatever is switched on.
- **Tooltip.** A tooltip section `Guide.lua` replaces the `Comment.lua` placeholder at the same position in `Files.xml` (after Most Progress, before Debug Info). It shows the header "Guide" and one line per step. The tooltip takes no clicks, so it only reads.
- **Right-click menu.** A section `Guide.lua` after `GoTo.lua` adds a "Guide" submenu with the waypoint actions of the steps that have coordinates, as "IAT Tactics" does.
- **Side panel.** A guide icon from the row's extra-icon factory (`AchievementButtonExtraIconFactory.lua:261-271`) appears only on achievements with a guide. Its click opens a pinnable panel built like the reward preview (`Gui/RewardPreview/RewardPreview.lua:38-57`), with the steps and a waypoint button per step.
- **Expanded row.** A guide block below the objectives in `DisplayObjectives` (`AchievementButtonMixin.lua:273-315`), added to the row's height sum, with a clickable waypoint per step. The popout reuses the button, so it shows the block too.
- **Options.** A "Guide" group with one toggle per surface. Proposed defaults, for the plan gate: tooltip, right-click menu and side-panel icon on, because they change no layout; expanded row off, because it changes row heights. A new profile default needs no migration.

**Waypoints: Blizzard's and TomTom's, the player picks.** A "Waypoint" option sets which provider a waypoint action uses: **Blizzard** (Retail: check `C_Map.CanSetUserWaypointOnMap(mapID)`, set the user waypoint, super-track it), **TomTom** (`TomTom:AddWaypoint`, both clients, any map, with its arrow), or **show both** (every surface offers one action per available provider). Proposed default, for the plan gate: Blizzard when TomTom is not loaded, show both when it is. When the chosen provider cannot place the waypoint (TomTom not loaded, the map does not allow a user waypoint, Classic without TomTom), the action is shown disabled with the reason in its tooltip. Placing a waypoint is the player's own click, so it runs only on a hardware event.

**Coordinates.** A debug-only slash command (or a line in the existing debug tooltip section) prints `C_Map.GetBestMapForUnit("player")` and `C_Map.GetPlayerMapPosition` rounded to 0.1 percent. The maintainer stands at the NPC, copies the line into the data, and the guide data never carries a coordinate that was not measured in game.

## Options considered
1. **Structured guide in the addon: tooltip to read, right-click menu to set a waypoint, TomTom or Blizzard waypoint (recommended).** The player hovers 60962 and sees "Guide": travel by Death Gate, talk to Archivist Zubashi in Acherus, the two Tier VII talents with their live state, and one tip. Right-clicking gives "Guide → Set waypoint: Archivist Zubashi". It reuses two existing section patterns and the placeholder's slot, changes no layout, and keeps the text to translate at one line per guide. The cost is a new data type with its API, loader, snapshot and headless wiring. Long, nuanced tactics (a raid boss mechanic) do not fit in a tooltip.
2. **Free-text guides per achievement.** The tooltip (or a panel) shows a paragraph in the style of a Wowhead comment. It is the most expressive. But every guide is a paragraph to write, to keep current and to translate into ten locales, and the text goes stale when Blizzard changes the content (as the costs above already have). It scales poorly across 8400 achievements.
3. **A side panel opened from a guide icon on the row.** It is built like the pinnable reward preview (`Gui/RewardPreview/RewardPreview.lua`), with an icon from the row's extra-icon factory, and shows the guide with a waypoint button per step. It has room for longer guides and keeps the tooltip short. It also means new GUI code on the achievement row, a frame to skin for ElvUI and GW2_UI, and more taint surface. It is the natural next step if guides outgrow the tooltip, and the data model of option 1 carries over unchanged.
4. **No guides of our own: link out and lean on guide addons.** The Wowhead link and the IAT and Zygor integrations already exist, and a generic hook for guide providers could be added. There is no content to maintain. But a player without those addons gets nothing in game, and there is no waypoint, which is the ask.
5. **Derived hints only.** The addon gets no guide data at all, and only fills the empty criteria names from game data: talent names and state for type 198. That covers all twelve "Legendary Research of ..." achievements at once with no data, but says nothing about the NPC or the place. Option 1 includes it as its Criteria step.

## Areas of concern
- **Taint and secret values.** `C_Map.SetUserWaypoint` and `C_SuperTrack.SetSuperTrackedUserWaypoint` are not protected. They are called from a click with the addon's own numbers, so no secret value is passed. Super-tracking changes what Blizzard's objective tracker and map show. Their handlers run on `SUPER_TRACKING_CHANGED` in Blizzard's own secure context, but the `taint-reviewer` must confirm that no addon frame or value ends up in that path. `C_Garrison.GetTalentInfo` is a read with no secret returns. All four surfaces draw on the addon's own frames: the tooltip and menu libraries, the addon's achievement row and popout, and a new panel. None of them touches a Blizzard frame.
- **Retail and Classic.** 60962 and its siblings exist only on Retail. The code loads on both clients: on Classic, the Blizzard waypoint path is skipped by an existence check, and TomTom is the only provider (TomTom is not installed on Classic here). No Classic guide is written in this item.
- **Plugins and skins.** TomTom becomes a new optional integration: a runtime check, `TomTom` added to `.luarc.json` globals, and possibly an OptionalDeps entry. ElvUI and GW2_UI skin the tooltip and menu through the existing libraries. The new side panel is a frame the skin plugins do not know. The reward preview it copies is not skinned in `Plugins/ElvUI.lua` or `Plugins/GW2_UI.lua` either, so the plan decides whether the panel follows the reward preview or gets skinned. The Zygor plugin puts its guide icon at the row's top right (`Plugins/ZygorGuidesViewer.lua:26`), so the guide icon must not land on the same spot. A later step could fold "IAT Tactics" and the Zygor guide into the same "Guide" submenu.
- **Row layout.** The expanded-row block changes the height of every row with a guide, and the popout reuses the same button. It is off by default, and the plan checks the height sum with and without objectives.
- **Saved variables and migrations.** One new option default in `Options/Defaults.lua`. No new saved variable and no migration.
- **Localization.** New strings: "Guide", "Set waypoint", "Talk to", "Travel", the option name and description, "Archivist Zubashi", and the tip. All go below `Exported at` in every locale. The NPC name per locale comes from Wowhead's localized sites. The tip sentence needs a translation per locale.
- **Data snapshots and headless pipeline.** `snapshot-data` gains a `Guide` field on 60962. `load-data.lua` gets the new registry and stubs for any WoW global the builder touches at load time (none should; spell and map names resolve only when the guide is shown).
- **Data quality.** Coordinates are measured in game (requirement 8). A guide can go stale when Blizzard moves an NPC or changes a system, so each guide states only what the data ids prove or the maintainer measured.
- **Unknowns to settle before the plan, by an in-game probe on a Death Knight in Acherus:**
  - `/dump C_Map.CanSetUserWaypointOnMap(647), C_Map.CanSetUserWaypointOnMap(648)`: can Blizzard's waypoint be placed in Acherus at all? If not, the Blizzard path cannot serve 60962 and only TomTom can.
  - `/dump C_Map.GetBestMapForUnit("player"), C_Map.GetPlayerMapPosition(C_Map.GetBestMapForUnit("player"), "player")` next to Zubashi: his floor and coordinates.
  - `/dump C_Garrison.GetTalentInfo(486)`, on the Death Knight and on another class: does the talent return its name and state for a character outside the hall or of another class, given that the achievement can show on any character?

Found on the way, out of scope: `Gui/RightClickMenu/AchievementMenu/PetBattleLinks.lua:25,36,70` calls `LibStub("Krowi_PopupDialog-1.0")` and `Options/General.lua:62` calls `LibStub("Krowi_MenuBuilder-1.0")`. Neither name is registered: the bundled libraries register through `KROWI_LIBMAN:NewLibrary` as `Krowi_PopupDialog_2` and `Krowi_Menu_2` (`Libs/Krowi_PopupDialog/Krowi_PopupDialog.lua:8`, `Libs/Krowi_Menu/Krowi_Menu.lua:8`, `Libs/Krowi_Util/LibMan.lua:22`). Unless another installed addon still ships the old libraries, a Xu-Fu pet-battle link click and the general tutorial in the options raise "Cannot find a library instance". Not verified in game; worth its own work item.

## Verification
- New scenario suite `guide`, in `Tests/Guide.lua` and the headless runner:
  - 60962 tooltip: Recorded no guide section, Target the section with the travel, NPC, criteria and tip lines (talent names stubbed headlessly, live in game).
  - 60962 right-click menu: Recorded no "Guide" submenu, Target a submenu with "Set waypoint: Archivist Zubashi".
  - 60962 row: Recorded no guide icon and no guide block, Target the icon (panel lists the steps) and, with the expanded-row option on, the block with the row height grown by its height.
  - Each surface toggled off: Recorded and Target both absent.
  - The waypoint action per provider setting (Blizzard, TomTom, show both; TomTom loaded or not): Recorded nothing, Target one call per offered provider with the measured map and coordinates, or a disabled action with its reason. In game it checks `C_Map.GetUserWaypoint()` and then restores the player's previous waypoint.
  - An achievement without a guide (11223): Recorded and Target both no section, no submenu, no icon and no block (requirement 6).
- The headless data pipeline (`load-data.lua Both`) reports no drop, and `snapshot-data.lua -write` shows the new field on 60962 only.
- `Check-Repo.ps1 -ChangedOnly`, and the `taint-reviewer` on the diff.
- In game on Retail: with TomTom and without it, the waypoint lands on Zubashi and the arrow or the super-track leads there. `Read-GameErrors.ps1` stays clean. On Classic: `/reload` and an achievement tooltip, with no errors and no guide.

## Decision
Krowi, 2026-10-11, at the design gate, which also accepted the intent:
- **Content:** option 1, structured steps with names from the game and one optional tip.
- **Surfaces:** all of them: "All 3, make it an option which one the user wants. They are not exclusive." That is the tooltip and right-click menu (option 1), the side panel (option 3) and the expanded row, each with its own toggle.
- **Waypoint:** both providers: "Both, give the user the option to default to one in the options, or have both shown." That is a Blizzard / TomTom / show both option.
- **Scope:** 60962 only. The eleven sibling guides follow later as data-only work.

The option defaults proposed under Design are confirmed at the plan gate.