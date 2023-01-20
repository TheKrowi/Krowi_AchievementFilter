-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Tab = {};
local tab = objects.Tab;

tab.__index = tab;
function tab:New(addonName, name, bindingName)
    local instance = setmetatable({}, tab);
    instance.AddonName = addonName;
    instance.Name = name;
    instance.BindingName = bindingName;
    return instance;
end