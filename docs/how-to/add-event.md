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

Open the relevant expansion's `DataAddons/Retail/<expansion>/EventData.lua` (e.g. `DataAddons/Retail/12_Midnight/EventData.lua`).

```lua
local _, addon = ...;
local shared = addon.Data.EventData.Shared;
local type = KrowiAF.Enum.EventType;

KrowiAF.EventData.Midnight = {
    {
        Id = 1234,                        -- WoW calendar event ID
        Type = type.WorldEvent,           -- See KrowiAF.Enum.EventType for all types
        Name = addon.L["My Event Name"],  -- Localization key (add to enUS.lua)
    },
    -- ... other events
};
```

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

Add the event name string to `Localization/enUS.lua` (above the `AUTOGENTOKEN` marker):

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
