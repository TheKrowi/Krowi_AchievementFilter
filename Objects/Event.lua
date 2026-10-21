local _, addon = ...
addon.Objects.Event = {}
local event = addon.Objects.Event

local function SetLinkedEventIds(instance, linkedEventIds)
    instance.LinkedEventIds = {unpack(linkedEventIds)}
    addon.Util.TableRemoveByValue(instance.LinkedEventIds, instance.Id)
    if #instance.LinkedEventIds == 0 then
        instance.LinkedEventIds = nil
    end
end

event.__index = event
-- source: a KrowiAF.Enum.EventSource where the event's times come from something other than its type's own reads
function event:New(id, linkedEventIds, category, type, icon, name, mapId, source)
    local instance = setmetatable({}, event)
    instance.Id = id or 0
    SetLinkedEventIds(instance, linkedEventIds)
    instance.Category = category
    instance.Type = type
    instance.Icon = icon or 0
    instance.Name = name
    instance.MapId = mapId or nil -- a data row writes false for a map it skips before its source; the game rejects false as a map
    instance.Source = source
    return instance
end