-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;

objects.Covenant = addon.Util.Enum{
    "None", -- Also nil
    "Kyrian",
    "Venthyr",
    "NightFae",
    "Necrolord"
};