-- [[ Namespaces ]] --
local _, addon = ...
local options = addon.Options
options.Plugins = {}
local plugins = options.Plugins
tinsert(options.OptionsTables, plugins)

function plugins.RegisterOptionsTable()
    options.Registry.Register(addon.Metadata.Prefix .. "_Plugins", options.OptionsTable.args.Plugins)
end

options.OptionsTable.args["Plugins"] = {
    type = "group",
    name = addon.L["Plugins"],
    args = {}
}