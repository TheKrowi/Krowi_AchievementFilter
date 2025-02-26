-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Tab = {};
local tab = objects.Tab;

tab.__index = tab;
function tab:NewSavedData(addonName, name, bindingName)
    local instance = setmetatable({}, tab);
    instance.AddonName = addonName;
    instance.Name = name;
    instance.BindingName = bindingName;
    return instance;
end

function tab:New(tabName, tabDisplayName)
    local instance = setmetatable({}, tab);
    instance.Name = tabName;
    instance.Text = tabDisplayName;
    return instance;
end