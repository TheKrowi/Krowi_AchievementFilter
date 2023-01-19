-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.Credits = {};
local credits = options.Credits;
tinsert(options.OptionsTables, credits);

function credits.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable("Credits", options.OptionsTable.args.Credits);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Credits", "Credits", addon.MetaData.Title);
end

function credits.PostLoad()

end

options.OptionsTable.args["Credits"] = {
    type = "group",
    name = addon.L["Credits"],
    args = {
        SpecialThanks = {
            order = 1, type = "group", inline = true,
            name = addon.L["Special thanks"],
            args = {
                Names = {
                    order = 1, type = "description", width = "full",
                    name = addon.Credits.GetSpecialThanksAsString(),
                    fontSize = "medium"
                }
            }
        },
        Donations = {
            order = 2, type = "group", inline = true,
            name = addon.L["Donations"],
            args = {
                Names = {
                    order = 1, type = "description", width = "full",
                    name = addon.Credits.GetDonationsAsString(),
                    fontSize = "medium"
                }
            }
        },
        Localizations = {
            order = 3, type = "group", inline = true,
            name = addon.L["Localizations"],
            args = {
                Names = {
                    order = 1, type = "description", width = "full",
                    name = addon.Credits.GetLocalizationsAsString(),
                    fontSize = "medium"
                }
            }
        }
    }
};