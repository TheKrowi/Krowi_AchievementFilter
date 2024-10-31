local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.Legion = { -- 7
    Major = 7,
    Minors = {
        { -- 7.0
            Minor = 0,
            Patches = {
                { -- 7.0.3
                    Patch = 3,
                    BuildVersionId = "070003",
                    Name = addon.L["Legion"]
                },
            }
        },
        { -- 7.2
            Minor = 2,
            Patches = {
                { -- 7.2.0
                    Patch = 0,
                    BuildVersionId = "070200",
                    Name = addon.L["The Tomb of Sargeras"]
                },
                { -- 7.2.5
                    Patch = 5,
                    BuildVersionId = "070205",
                    Name = addon.L["The Tomb of Sargeras"]
                },
            }
        },
        { -- 7.3
            Minor = 3,
            Patches = {
                { -- 7.3.0
                    Patch = 0,
                    BuildVersionId = "070300",
                    Name = addon.L["Shadows of Argus"]
                },
                { -- 7.3.2
                    Patch = 2,
                    BuildVersionId = "070302",
                    Name = addon.L["Shadows of Argus"]
                },
                { -- 7.3.5
                    Patch = 5,
                    BuildVersionId = "070305",
                    Name = addon.L["Shadows of Argus"]
                },
            },
        },
    },
};