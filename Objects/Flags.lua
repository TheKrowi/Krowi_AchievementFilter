-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;
objects.Flags = {};
local flags = objects.Flags;

local isAccountWideFlag = 0x00020000;
local isCriteriaProgressBar = 0x00000001;

flags.__index = flags;
function flags:New(sourceFlags)
    local instance = setmetatable({}, flags);
    instance.IsAccountWide = bit.band(sourceFlags, isAccountWideFlag) == isAccountWideFlag;
    instance.IsCriteriaProgressBar = bit.band(sourceFlags, isCriteriaProgressBar) == isCriteriaProgressBar;
    return instance;
end