local _, addon = ...;
addon.Objects.Event = {};
local event = addon.Objects.Event;

event.__index = event;
function event:New(id, type, icon, name, linkedEventIds, mapID)
    local instance = setmetatable({}, event);
    instance.Id = id or 0;
    instance.Type = type;
    instance.Icon = icon or 0;
    instance.Name = name;
    instance.LinkedEventIds = linkedEventIds;
    instance.MapId = mapID;
    return instance;
end