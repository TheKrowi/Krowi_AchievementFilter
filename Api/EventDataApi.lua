local _, addon = ...;

KrowiAF.EventData = {
    WidgetEvents = {},
    WorldEvents = {}
};

function KrowiAF.InjectCalendarEventDataDynamicOptions()
    for _, v1 in next, KrowiAF.EventData do
        for _, v2 in next, v1 do
            KrowiAF.RegisterEventDataOptions(select(2, unpack(v2)));
        end
    end
end

function KrowiAF.RegisterEventDataOptions(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds};
    end

    if eventType == addon.Objects.EventType.Calendar then
        eventType = "Calendar";
    end
    KrowiAF_RegisterEventOptions(eventType, eventIds, eventName, eventGroup, groupOrder, expansionId, hideByDefault);
    KrowiAF_RegisterDynamicDeSelectAllEventOptions(eventType, eventGroup, expansionId);
end

function KrowiAF.AddEventData(eventIds, eventType, categoryId, icon, eventName, eventGroup, groupOrder, expansionId, hideByDefault, mapId)
    if not addon.Util.IsTable(eventIds) then
        eventIds = {eventIds};
    end

    if addon.Util.IsTable(eventIds) then
        for _, eventId in next, eventIds do
            addon.Data.Events[eventType][eventId] = addon.Objects.Event:New(eventId, eventIds, addon.Data.Categories[categoryId], eventType, icon, eventName, mapId);
        end
    end
end