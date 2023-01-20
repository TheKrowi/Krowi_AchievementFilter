-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.TransmogSet = {};
local transmogSet = objects.TransmogSet;

transmogSet.__index = transmogSet;
function transmogSet:New(id, classMask)
    local instance = setmetatable({}, transmogSet);
    instance.Id = id or 0;
    instance.ClassMask = classMask or 0;
    return instance;
end