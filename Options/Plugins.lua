-- [[ Namespaces ]] --
local _, addon = ...
local options = addon.Options
options.Plugins = {}
local plugins = options.Plugins
tinsert(options.OptionsTables, plugins)

function plugins.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.Metadata.Prefix .. "_Plugins", options.OptionsTable.args.Plugins)
end

options.OptionsTable.args["Plugins"] = {
    type = "group",
    name = addon.L["Plugins"],
    args = {}
}