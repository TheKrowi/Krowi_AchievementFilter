---
paths:
  - "Data/Event*.lua"
  - "Data/Custom*EventTimers.lua"
  - "DataAddons/**/Event*.lua"
  - "Gui/EventReminder/**"
  - "Tests/Event*.lua"
  - "Tests/Schedul*.lua"
---
# Event reminders: where an event's times come from

Krowi's policy (2026-10-21):
- **The current expansion's events** come from Blizzard's event scheduler, `C_EventScheduler` (rows with `KrowiAF.Enum.EventSource.Scheduler`, `Data/EventScheduler.lua`), because Blizzard updates their times without an addon change.
- **Older expansions' events** run on KAF's fixed schedules: `KrowiAF.EventSchedules` in `DataAddons/Retail/<expansion>/EventSchedules.lua`, read by `Data/EventSchedules.lua`, for rows with `EventSource.FixedSchedule`. A reminder on a fixed schedule makes no POI or widget read.
- **Families whose zone, show or storm order is not known yet** keep their POI and widget reads and are only watched.
- **When an expansion ends,** its scheduler events move to fixed schedules, from the times recorded while the scheduler still listed them (`/kaftest scheduler`).
- **The watcher** (`Data/EventObserver.lua`) learns each region's starts and rotations from the POIs it sees, every 300 s, for every player. Debug mode prints its findings: new starts, disagreements with the shipped schedules, and the order of the watched families, which is how a family's rotation gets confirmed before it is made fixed.
- The work items: `docs/work/2026-10-21-event-scheduler` and `docs/work/2026-10-21-fixed-event-schedules`.

These files judge times by the realm's clock, `GetServerTime()`, never `time()` (the `event-clock` rule). Adding an event: `docs/how-to/add-event.md`.