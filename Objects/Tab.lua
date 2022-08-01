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

    local self = {};
    setmetatable(self, tab);

    self.AddonName = addonName;
    self.Name = name;
    self.BindingName = bindingName;

    return self;
end