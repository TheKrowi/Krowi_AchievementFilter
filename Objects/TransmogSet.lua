-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.TransmogSet = {};
local transmogSet = objects.TransmogSet;

transmogSet.__index = transmogSet;
function transmogSet:New(id, classMask)
    local self = {};
    setmetatable(self, transmogSet);

    self.Id = id or 0;
    self.ClassMask = classMask or 0;

    return self;
end