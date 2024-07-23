local _, addon = ...;
addon.Objects.Event = {};
local event = addon.Objects.Event;

local function SetLinkedEventIds(instance, linkedEventIds)
    instance.LinkedEventIds = {unpack(linkedEventIds)};
    addon.Util.TableRemoveByValue(instance.LinkedEventIds, instance.Id);
    if #instance.LinkedEventIds == 0 then
        instance.LinkedEventIds = nil;
    end
end

event.__index = event;
function event:New(id, linkedEventIds, category, type, icon, name, mapId)
    local instance = setmetatable({}, event);
    instance.Id = id or 0;
    SetLinkedEventIds(instance, linkedEventIds);
    instance.Category = category;
    instance.Type = type;
    instance.Icon = icon or 0;
    instance.Name = name;
    instance.MapId = mapId;
    return instance;
end