-- [[ Namespaces ]] --
local _, addon = ...;
local objects = addon.Objects;

objects.Faction = addon.Util.Enum{
    "NoFaction", -- Also nil
    "Alliance",
    "Horde"
};