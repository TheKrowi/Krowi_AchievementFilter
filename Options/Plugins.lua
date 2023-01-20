-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Plugins = {};
local plugins = options.Plugins;
tinsert(options.OptionsTables, plugins);

function plugins.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable("Plugins", options.OptionsTable.args.Plugins);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Plugins", "Plugins", addon.MetaData.Title);
end

function plugins.PostLoad()
    
end

options.OptionsTable.args["Plugins"] = {
    type = "group",
    name = addon.L["Plugins"],
    args = {}
}