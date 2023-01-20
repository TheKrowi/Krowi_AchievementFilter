-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Event = {};
local event = objects.Event;

event.__index = event;
function event:New(id, icon, name, mapID)
    local instance = setmetatable({}, event);
    instance.Id = id or 0;
    instance.Icon = icon or 0;
    instance.Name = name;
    instance.MapId = mapID;
    return instance;
end