-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;

objects.TooltipDataType = addon.Util.Enum{
    "Unknown", -- Also nil
    "Item",
    "Unit"
};