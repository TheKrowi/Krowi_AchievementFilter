-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Plugins = {};
local plugins = options.Plugins;
tinsert(options.OptionsTables, plugins);

function plugins.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.Plugins.name, options.OptionsTable.args.Plugins);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.Plugins.name, options.OptionsTable.args.Plugins.name, addon.MetaData.Title);
end

function plugins.PostLoad()
    
end

options.OptionsTable.args["Plugins"] = {
    type = "group",
    -- childGroups = "tab",
    name = addon.L["Plugins"],
    args = {}
}