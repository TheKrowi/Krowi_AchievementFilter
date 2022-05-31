-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

options.OptionsTable.args["Plugins"] = {
    type = "group",
    -- childGroups = "tab",
    name = addon.L["Plugins"],
    args = {}
}