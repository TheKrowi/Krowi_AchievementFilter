local _, addon = ...;
addon.Objects.Event = {};
local event = addon.Objects.Event;

event.__index = event;
function event:New(id, category, type, icon, name, linkedEventIds, mapId)
    local instance = setmetatable({}, event);
    instance.Id = id or 0;
    instance.Category = category;
    instance.Type = type;
    instance.Icon = icon or 0;
    instance.Name = name;
    instance.LinkedEventIds = linkedEventIds;
    instance.MapId = mapId;
    return instance;
end