local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.Dragonflight = { -- 10
    Major = 10,
    Minors = {
        { -- 10.0
            Minor = 0,
            Patches = {
                { -- 10.0.0
                    Patch = 0,
                    BuildVersionId = "100000",
                    Name = addon.L["Dragonflight (pre-patch)"]
                },
                { -- 10.0.2
                    Patch = 2,
                    BuildVersionId = "100002",
                    Name = addon.L["Dragonflight"]
                },
                { -- 10.0.5
                    Patch = 5,
                    BuildVersionId = "100005",
                    Name = addon.L["Trading Post"]
                },
                { -- 10.0.7
                    Patch = 7,
                    BuildVersionId = "100007",
                    Name = addon.L["Return to the Forbidden Reach"]
                },
            }
        },
        { -- 10.1
            Minor = 1,
            Patches = {
                { -- 10.1.0
                    Patch = 0,
                    BuildVersionId = "100100",
                    Name = addon.L["Embers of Neltharion"]
                },
                { -- 10.1.5
                    Patch = 5,
                    BuildVersionId = "100105",
                    Name = addon.L["Fractures in Time"]
                },
                { -- 10.1.7
                    Patch = 7,
                    BuildVersionId = "100107",
                    Name = addon.L["Fury Incarnate"]
                },
            }
        },
        { -- 10.2
            Minor = 2,
            Patches = {
                { -- 10.2.0
                    Patch = 0,
                    BuildVersionId = "100200",
                    Name = addon.L["Guardians of the Dream"]
                },
                { -- 10.2.5
                    Patch = 5,
                    BuildVersionId = "100205",
                    Name = addon.L["Seeds of Renewal"]
                },
                { -- 10.2.6
                    Patch = 6,
                    BuildVersionId = "100206",
                    Name = addon.L["Plunderstorm"]
                },
                { -- 10.2.7
                    Patch = 7,
                    BuildVersionId = "100207",
                    Name = addon.L["Dark Heart"]
                },
            },
        },
    },
};