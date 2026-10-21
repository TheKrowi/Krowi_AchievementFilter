-- The War Within's events on KAF's fixed schedules (Data/EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules).
-- Anchors by GetCurrentRegion(): 1 US, 2 Korea and Taiwan, 3 EU, 5 China. Name is for the debug-mode findings only.

-- Theater Troupe: a show every hour from :00, 10 minutes. Which show plays is not known yet (random by one guide, a fixed
-- five-hour chain by TomCats' unused table), so the Next POIs and the shows are watched, not run on a schedule. The shows'
-- POIs are not event rows (7654 The Rivals, 7899 The Wanderer, 7900 Forget Me Not, 7901 The Cruelty of Dornic,
-- 7902 The Thraegar's Descent), so their map is given here for the debug-mode look.
KrowiAF.EventSchedules.TheaterTroupe = {
    Name = "Theater Troupe",
    Interval = 3600,
    Window = {0, 600},
    Variants = {7943, 8076, 8077, 8078, 8079, 7654, 7899, 7900, 7901, 7902},
    MapId = 2248,
    ByInfo = true,
    Observe = true,
}