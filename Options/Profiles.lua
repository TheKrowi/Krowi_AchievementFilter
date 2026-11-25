local _, addon = ...
local options = addon.Options
options.Profiles = {}
local profiles = options.Profiles
tinsert(options.OptionsTables, profiles)

-- The Profiles page holds no options of its own: the options window draws both databases' profiles on AceDB's own API
-- (Options/Window/Source.lua, ProfileOptions), so the AceDBOptions tables it held went (docs/work/2026-11-25-leave-aceconfig).
-- The filters database is made here, during the options' load (Libs/Krowi_Util/Options/Options.lua, Load), where it has
-- always been made.
function profiles.RegisterOptionsTable()
    addon.Filters:Load()
    options.Registry.Register(addon.Metadata.Prefix .. "_Profiles", options.OptionsTable.args.Profiles)
end

options.OptionsTable.args["Profiles"] = {
    type = "group", childGroups = "tab",
    name = addon.Util.L["Profiles"],
    args = {}
}