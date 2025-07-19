local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.MistsOfPandaria = { -- 5
    Major = 5,
    Minors = {
        { -- 5.0
            Minor = 0,
            Patches = {
                { -- 5.0.4
                    Patch = 4,
                    BuildVersionId = "050004",
                    Name = addon.L["Mists of Pandaria (pre-patch)"]
                },
            }
        },
        { -- 5.1
            Minor = 1,
            Patches = {
                { -- 5.1.0
                    Patch = 0,
                    BuildVersionId = "050100",
                    Name = addon.L["Landfall"]
                },
            }
        },
        { -- 5.2
            Minor = 2,
            Patches = {
                { -- 5.2.0
                    Patch = 0,
                    BuildVersionId = "050200",
                    Name = addon.L["The Thunder King"]
                },
            }
        },
        { -- 5.3
            Minor = 3,
            Patches = {
                { -- 5.3.0
                    Patch = 0,
                    BuildVersionId = "050300",
                    Name = addon.L["Escalation"]
                },
            }
        },
        { -- 5.4
            Minor = 4,
            Patches = {
                { -- 5.4.0
                    Patch = 0,
                    BuildVersionId = "050400",
                    Name = addon.L["Siege of Orgrimmar"]
                },
                { -- 5.4.1
                    Patch = 1,
                    BuildVersionId = "050401",
                    Name = addon.L["Siege of Orgrimmar"]
                },
                { -- 5.4.2
                    Patch = 2,
                    BuildVersionId = "050402",
                    Name = addon.L["Siege of Orgrimmar"]
                },
            },
        },
        { -- 5.5
            Minor = 5,
            Patches = {
                { -- 5.5.0
                    Patch = 0,
                    BuildVersionId = "050500",
                    Name = addon.L["Mists of Pandaria (pre-patch)"]
                },
            }
        },
    },
};