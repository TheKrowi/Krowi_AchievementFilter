local _, addon = ...
local shared = addon.Data.EventData.Shared
local type = KrowiAF.Enum.EventType
local source = KrowiAF.Enum.EventSource

KrowiAF.EventData.Legion = {
    { -- Legion Assaults: one reminder on their fixed schedule in EventSchedules.lua, without the zone, which looks random
      -- (docs/work/2026-10-21-fixed-event-schedules). The id is Azsuna's, which the toggle keeps; the zones' other three
      -- ids (5177 Highmountain, 5178 Stormheim, 5210 Val'sharah) are only watched.
        5175, type.World,
        948,
        1408998,
        addon.L["Legion Assaults"],
        addon.L["Legion Assaults"],
        1,
        6,
        false,
        619,
        source.FixedSchedule,
    },
}