# How To: Add a New In-Game World Event

Use this guide when WoW adds a new seasonal or world event that has associated achievements and should appear in KAF's Events tab.

**Commit type:** `data: add <EventName> event` — e.g. `data: add Midsummer Fire Festival event`

---

## Overview of How Events Work

- **Event definitions** (the event object with an ID, name, and type) live in the expansion-specific `EventData.lua` under `DataAddons/Retail/<expansion>/`.
- **Event timing** (when the event starts and ends each year) lives in `Data/CustomWorldEventTimers.lua` or `Data/EventData.lua`.
- **Achievements** for the event are added to `AchievementData.lua` and `CategoryData.lua` like any other achievements, but with `{"Event", <eventId>}` as a temporary-availability marker.
- **Event categories** in the Events tab are registered in `DataAddons/Retail/CategoryData_Events.lua`.

---

## 1. Find the Event's In-Game Calendar ID

The event ID is WoW's internal `C_Calendar` event ID. You can find it by:
- Checking existing `EventData.lua` files for a similar event
- Looking it up on Wowhead's calendar event database

---

## 2. Add the Event Definition to `EventData.lua`

Open the relevant expansion's `DataAddons/Retail/<expansion>/EventData.lua` (e.g. `DataAddons/Retail/12_Midnight/EventData.lua`). Each event is a positional row, read by `KrowiAF.AddEventData` and `KrowiAF.RegisterEventDataOptions` (`Api/EventDataApi.lua`):

```lua
local _, addon = ...
local type = KrowiAF.Enum.EventType

KrowiAF.EventData.Midnight = {
    { -- My Event Name
        1234, type.Calendar,           -- the id (a table of ids links them), then the type: Calendar, Widget or World
        2570,                          -- the category its reminder opens: a :WithId(n) id from a CategoryData file
        6439633,                       -- icon file id
        addon.L["My Event Name"],      -- name; {group, sub} reads "group: sub"
        addon.L["Holidays"],           -- the options group it is listed under
        1,                             -- the group's order
        -- then, all optional: the expansion (its World Events tab), hidden by default, the uiMapID of a World event's
        -- POI, and the source (KrowiAF.Enum.EventSource); write false, never nil, for a field you skip before a later one
    },
}
```

### World events from Blizzard's event scheduler

Current content's timed events are listed by Blizzard's event scheduler (`C_EventScheduler`, the world map's Events tab), with their exact start and end times. Such an event needs no timer and no POI check: give its row the area POI as its id, `type.World`, no map (`false`) and `KrowiAF.Enum.EventSource.Scheduler` as the source. `Data/EventScheduler.lua` keeps its times, and the reminders and the option toggle show the game's own name for the POI. The row's name, the fallback when the game does not know the POI yet, and its options group are still `addon.L` strings: use one every locale file already has, or add it to every locale file (step 6). The Curse Surges in `DataAddons/Retail/12_Midnight/EventData.lua` are the example; `/kaftest scheduler` lists every event the scheduler gives, with its area POI, name, zone and times (`Tests/README.md`).

### Older expansions' events on a fixed schedule

An event of an older expansion that repeats on a fixed clock runs on a schedule KAF carries, with no POI or widget read (`.github/copilot-instructions.md`, Event reminders). Its row gets `KrowiAF.Enum.EventSource.FixedSchedule` as the source, and its family a table in the expansion's `EventSchedules.lua` (`DataAddons/Retail/10_Dragonflight/EventSchedules.lua` is the example):

```lua
KrowiAF.EventSchedules.SiegeOnDragonbaneKeep = {
    Name = "Siege on Dragonbane Keep",                      -- for the watcher's debug-mode findings only
    Interval = 7200,                                        -- or Reset = "Weekly" / "HalfWeekly", from the weekly reset
    Windows = {[7267] = {-3600, 0}, [7104] = {0, 3600}},    -- each event's window, relative to a cycle's start
    Anchors = {[1] = 3600, [2] = 3600, [3] = 0, [5] = 3600}, -- a cycle start per GetCurrentRegion(): US, KR/TW, EU, CN
    Fixed = true,                                           -- the reminders run on it
    Observe = true,                                         -- the watcher learns it from the POIs
}
```

- **A rotating family** (one zone further each cycle) has one `Window`, a `Rotation` of its ids in order, and `Anchors` (or `RotationAnchors` for a reset-tied family) that name a start of `Rotation[1]`.
- **A family whose order is not known yet** gets only `Variants` and `Observe`: its rows keep their POI and widget reads, and the watcher prints the order it sees in debug mode.
- **A POI that reports no time** (the Primal Storms) needs `ByInfo`; the watcher then looks it up on its map, in debug mode only.
- **Regions:** leave out one whose start nobody has confirmed; the watcher learns it for players there.
- **Review:** `/kaftest sources` shows, per family, what the schedule and the POIs each say is going on; the Registries snapshot shows each schedule as a `SCHEDULE` line.

If the `EventData.lua` for this expansion exists but is commented out in `Files.xml`, uncomment it:

```xml
<!-- Before: -->
<!-- <Script file="EventData.lua" /> -->

<!-- After: -->
<Script file="EventData.lua" />
```

---

## 3. Add Event Timing to `Data/CustomWorldEventTimers.lua`

Open `Data/CustomWorldEventTimers.lua` and add the event's annual schedule. Follow the existing entries' pattern exactly (start date, end date, recurrence).

---

## 4. Add Achievements with the Event Marker

In `DataAddons/Retail/<expansion>/AchievementData.lua`, tag achievements as event-gated using `{"Event", <eventId>}`:

```lua
{ -- Complete the event questline
    41500,
    {
        {"Event", 1234},  -- Only obtainable during the event
    },
},
{ -- Collect all event pets (mount reward)
    41501,
    {
        RewardType = rewardType.Pet,
        {"Event", 1234},
    },
},
```

---

## 5. Register the Event Category in `CategoryData_Events.lua`

Open `DataAddons/Retail/CategoryData_Events.lua` and add the event category following the existing structure:

```lua
{ -- My Event Name
    addon.L["My Event Name"],
    {
        EventId = 1234,
    },
    {
        41500, -- Complete the event questline
        41501, -- Collect all event pets
    },
},
```

---

## 6. Add Localization Strings

Add the event name string to `Localization/enUS.lua` (directly below the `Exported at` line under the `AUTOGENTOKEN` marker):

```lua
L["My Event Name"] = true
```

See [`update-localization.md`](update-localization.md) for details.

---

## 7. Test In-Game

1. Reload the addon (`/reload`).
2. Open the Achievements window and navigate to the Events tab.
3. Verify the new event category appears with the correct achievements.
4. If possible, test during the event's active window to confirm the availability filter works correctly.
5. Test that achievements tagged with `{"Event", id}` are correctly marked as temporarily obtainable.
