-- Legion's events on KAF's fixed schedules (Data/EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules).
-- Anchors by GetCurrentRegion(): 1 US, 2 Korea and Taiwan, 3 EU, 5 China. Name is for the debug-mode findings only.

-- Legion Assaults: 6 hours on every 14.5 hours since Legion Remix moved the cycle in November 2025 (Funkydude's
-- LegionInvasionTimer, InvasionTimer). Checked in game on EU on 2026-10-21: the Stormheim assault ended at 00:00:33 UTC,
-- the schedule's 00:00:00. The zone looks random, so the reminder is one, on 5175, without the zone (Krowi,
-- 2026-10-21); the four zones' POIs are watched.
KrowiAF.EventSchedules.LegionAssaults = {
    Name = "Legion Assaults",
    Interval = 52200,
    Windows = {[5175] = {0, 21600}},
    Window = {0, 21600},
    Variants = {5175, 5177, 5178, 5210}, -- Azsuna, Highmountain, Stormheim, Val'sharah
    Anchors = {[1] = 1762421400, [3] = 1762434000, [5] = 1762450200},
    Fixed = true,
    Observe = true,
}