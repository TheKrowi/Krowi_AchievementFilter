-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.BuildVersion = {};
local buildVersion = objects.BuildVersion;

buildVersion.__index = buildVersion;
function buildVersion:New(id, name, value, description)
    local instance = setmetatable({}, buildVersion);
    instance.Id = id or 0;
    instance.Name = name;
    instance.Value = value;
    instance.Description = description;
    return instance;
end