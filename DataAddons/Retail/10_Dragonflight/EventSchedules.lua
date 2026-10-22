-- Dragonflight's events on KAF's fixed schedules (Data/EventSchedules.lua; docs/work/2026-10-21-fixed-event-schedules).
-- Anchors by GetCurrentRegion(): 1 US, 2 Korea and Taiwan, 3 EU, 5 China. Name is for the debug-mode findings only.
-- The soup (Community Feast) stays in Data/CustomWidgetEventTimers.lua for now.

-- Siege on Dragonbane Keep: every two hours, an hour of gathering then the siege. EU starts on even UTC hours, the other
-- regions on odd ones (WindTools, GW2_UI, BtWTodo, MasterCollector); EU checked against the POI on 2026-10-21.
-- Time Rift, Superbloom and the Big Dig start at the same minute in every region, so they have one Anchor.
KrowiAF.EventSchedules.SiegeOnDragonbaneKeep = {
    Name = "Siege on Dragonbane Keep",
    Interval = 7200,
    Windows = {[7267] = {-3600, 0}, [7104] = {0, 3600}}, -- Gathering, Active
    Anchors = {[3] = 0},
    Anchor = 3600, -- every other region, Taiwan (4) and test realms included
    Fixed = true,
    Observe = true,
}

-- Time Rift, every hour on the hour in every region (Blizzard). Next is the map's own 5-minute countdown; Active ends on
-- the boss kill, so 15 minutes is its upper bound.
KrowiAF.EventSchedules.TimeRift = {
    Name = "Time Rift",
    Interval = 3600,
    Windows = {[4992] = {-300, 0}, [4987] = {0, 900}}, -- Next, Active
    Anchor = 0,
    Fixed = true,
}

-- Superbloom, every hour on the hour in every region (Blizzard). Next in the 15 minutes before, as the soup's (Krowi,
-- 2026-10-21); Active ends with the event's progress, 17 to 22 minutes, so 22 is its upper bound.
KrowiAF.EventSchedules.Superbloom = {
    Name = "Superbloom",
    Interval = 3600,
    Windows = {[5157] = {-900, 0}, [5323] = {0, 1320}}, -- Next, Active
    Anchor = 0,
    Fixed = true,
}

-- The Big Dig of the Azerothian Archives, every hour at :30 in every region (warcraft.wiki.gg, WindTools). Next, then
-- Soon in the last 5 minutes; Active ends on the boss kill, so 15 minutes is its upper bound.
KrowiAF.EventSchedules.BigDig = {
    Name = "Azerothian Archives",
    Interval = 3600,
    Windows = {[5584] = {-900, -300}, [5585] = {-300, 0}, [5592] = {0, 900}}, -- Next, Soon, Active
    Anchor = 1800,
    Fixed = true,
}

-- Watched, not run on a schedule yet: their clocks are known, but not which zone, variant or storm comes when.
KrowiAF.EventSchedules.GrandHunts = {
    Name = "Grand Hunts",
    Interval = 7200,
    Window = {0, 7200},
    Variants = {7342, 7343, 7344, 7345},
    Observe = true,
}
KrowiAF.EventSchedules.ResearchersUnderFire = {
    Name = "Researchers Under Fire",
    Interval = 3600,
    Window = {0, 1500},
    Variants = {7461, 7462}, -- Titan Lockdown, Zaqali Ruin Investigation: Active
    Observe = true,
}
KrowiAF.EventSchedules.Dreamsurges = {
    Name = "Dreamsurges",
    Reset = "Weekly",
    Window = {0, 604800},
    Variants = {7553, 7554, 7555, 7556, 7602, 7603, 7604, 7605},
    Observe = true,
}
KrowiAF.EventSchedules.FyrakkAssaults = {
    Name = "Fyrakk Assaults",
    Reset = "Weekly",
    Window = {0, 604800},
    Variants = {7433, 7471},
    Observe = true,
}
-- A storm's POI reports no time, so the storms are only watched in debug mode, on their maps (ByInfo)
KrowiAF.EventSchedules.PrimalStorms = {
    Name = "Primal Storms",
    Interval = 10800,
    Window = {0, 7200},
    Variants = {7221, 7222, 7223, 7224, 7225, 7226, 7227, 7228, 7229, 7230, 7231, 7232, 7233, 7234, 7235, 7236, 7237, 7238, 7239, 7240,
        7245, 7246, 7247, 7248, 7249, 7250, 7251, 7252, 7253, 7254, 7255, 7256, 7257, 7258, 7259, 7260, 7298, 7299, 7300, 7301},
    ByInfo = true,
    Observe = true,
}