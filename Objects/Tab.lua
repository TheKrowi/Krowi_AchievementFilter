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

function tab:New2(addonName, addonDisplayName, tabName, tabDisplayName, bindingName)
    local instance = setmetatable({}, tab);
    -- instance.AddonName = addonName;
    -- instance.AddonDisplayName = addonDisplayName;
    instance.Name = tabName;
    instance.Text = tabDisplayName;
    -- instance.BindingName = bindingName;
    return instance;
end