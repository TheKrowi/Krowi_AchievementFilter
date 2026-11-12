local _, addon = ...

KrowiAF.Enum = KrowiAF.Enum or {}
KrowiAF.Enum.EventType = EnumUtil.MakeEnum(
    "Calendar",
    "Widget",
    "World"
)
-- Where an event's times come from when not from its POI or widget: Scheduler is Blizzard's event scheduler
-- (C_EventScheduler), which names the event too, for the current expansion; FixedSchedule is one of KAF's own schedules
-- (KrowiAF.EventSchedules), for the older expansions. Event reminders reads both (Features/EventReminders/Data/); the
-- per-event toggles are its own (Features/EventReminders/EventOptions.lua, docs/work/2026-11-12-event-reminders)
KrowiAF.Enum.EventSource = EnumUtil.MakeEnum(
    "Scheduler",
    "FixedSchedule"
)

KrowiAF.EventData = {}
KrowiAF.EventSchedules = {} -- [key] = a family's schedule, from DataAddons/Retail/*/EventSchedules.lua

function KrowiAF.AddEventData(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId, source)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds}
    end
    if addon.Util.IsTable(eventName) then
        eventName = eventName[1] .. ": " .. eventName[2]
    end

    local category = addon.Data.Categories[categoryId]
    if categoryId and not category then
        addon.Data.LoadDiagnostics:Report(addon.Data.LoadDiagnostics.Kind.UnregisteredCategory, categoryId, "event " .. tostring(eventName) .. " binds to a category no category file declares")
    end

    if addon.Util.IsTable(eventIds) then
        for _, eventId in next, eventIds do
            addon.Data.Events[eventType][eventId] = addon.Objects.Event:New(eventId, eventIds, category, eventType, icon, eventName, mapId, source)
        end
    end
end