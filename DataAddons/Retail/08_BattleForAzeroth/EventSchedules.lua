-- Battle for Azeroth's events on KAF's fixed schedules (Data/EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules).
-- Anchors by GetCurrentRegion(): 1 US, 2 Korea and Taiwan, 3 EU, 5 China. Name is for the debug-mode findings only.

-- The zone assaults: 7 hours on, 12 off, one zone further each time. The anchors are Drustvar starts, the same in
-- Funkydude's BFAInvasionTimer, InvasionTimer, NDui and MasterCollector, and unchanged from 2019 to 2024; Korea and
-- Taiwan are learned (Data/EventObserver.lua).
KrowiAF.EventSchedules.FactionAssaults = {
    Name = "Faction Assaults",
    Interval = 68400,
    Window = {0, 25200},
    Rotation = {5964, 5973, 5896, 5969, 5966, 5970}, -- Drustvar, Zuldazar, Tiragarde Sound, Nazmir, Stormsong Valley, Vol'dun
    Anchors = {[1] = 1548032400, [3] = 1548000000, [5] = 1546743600},
    Fixed = true,
    Observe = true,
}

-- The N'Zoth assaults of 8.3: N'Zoth itself a week at a time, in Uldum or the Vale, and a minor assault half a week at
-- a time in the other zone. Which comes when is not known yet, so they are watched, not run on a schedule.
KrowiAF.EventSchedules.NzothMajorAssaults = {
    Name = "N'Zoth assaults",
    Reset = "Weekly",
    Window = {0, 604800},
    Variants = {6486, 6489}, -- N'Zoth in Uldum, N'Zoth in the Vale of Eternal Blossoms
    Observe = true,
}
KrowiAF.EventSchedules.NzothMinorAssaults = {
    Name = "N'Zoth minor assaults",
    Reset = "HalfWeekly",
    Window = {0, 302400},
    Variants = {6487, 6488, 6490, 6491}, -- Amathet, Aqir, Mogu, Mantid
    Observe = true,
}