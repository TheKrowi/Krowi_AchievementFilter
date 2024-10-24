-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.BuildVersion = {};
local buildVersion = objects.BuildVersion;

buildVersion.__index = buildVersion;
function buildVersion:New(id, major, minor, patch, name, description)
    local instance = setmetatable({}, buildVersion);
    instance.Id = id or 0;
    instance.Major = major or 0;
    instance.Minor = minor or 0;
    instance.Patch = patch or 0;
    instance.Name = name;
    instance.Description = description;
    return instance;
end

function buildVersion:SetInUse()
    self.InUse = true;
end