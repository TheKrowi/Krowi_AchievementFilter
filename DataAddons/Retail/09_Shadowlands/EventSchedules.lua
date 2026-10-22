-- Shadowlands' events on KAF's fixed schedules (Data/EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules).
-- Anchors by GetCurrentRegion(): 1 US, 2 Korea and Taiwan, 3 EU, 5 China. Name is for the debug-mode findings only.

-- The Maw's covenant assaults: half a week each from the weekly reset, always in this order (trueendgame, wow.gg). EU's
-- phase is from /kaftest sources on 2026-10-21: Kyrian from that day's reset, 04:00 UTC. The other regions are learned
-- (Data/EventObserver.lua). A character who has not finished Chains of Domination chapter 2 gets none (Krowi, 2026-10-22).
KrowiAF.EventSchedules.CovenantAssaults = {
    Name = "Covenant assaults",
    Reset = "HalfWeekly",
    Window = {0, 302400},
    Rotation = {6991, 6990, 6992, 6989}, -- Kyrian, Venthyr, Night Fae, Necrolord
    RotationAnchors = {[3] = 1792555200},
    Requires = 64556, -- In Need of Assistance, the end of Chains of Domination chapter 2 (Maw Walkers); the POIs only show after it
    Fixed = true,
    Observe = true,
}