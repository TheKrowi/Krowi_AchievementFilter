-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Tab = {};
local tab = objects.Tab;

tab.__index = tab;
function tab:New(addonName, name, bindingName)
    if type(addonName) ~= "string" or type(name) ~= "string" then
        error("Usage: New(addonName, name[, bindingName])", 2);
    end

    local instance = setmetatable({}, tab);
    instance.AddonName = addonName;
    instance.Name = name;
    instance.BindingName = bindingName;
    return instance;
end