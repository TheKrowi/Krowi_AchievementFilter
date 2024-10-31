local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.Shadowlands = { -- 9
    Major = 9,
    Minors = {
        { -- 9.0
            Minor = 0,
            Patches = {
                { -- 9.0.1
                    Patch = 1,
                    BuildVersionId = "090001",
                    Name = addon.L["Shadowlands (pre-patch)"]
                },
                { -- 9.0.2
                    Patch = 2,
                    BuildVersionId = "090002",
                    Name = addon.L["Shadowlands"]
                },
                { -- 9.0.5
                    Patch = 5,
                    BuildVersionId = "090005",
                    Name = addon.L["Shadowlands"]
                },
            }
        },
        { -- 9.1
            Minor = 1,
            Patches = {
                { -- 9.1.0
                    Patch = 0,
                    BuildVersionId = "090100",
                    Name = addon.L["Chains of Domination"]
                },
                { -- 9.1.5
                    Patch = 5,
                    BuildVersionId = "090105",
                    Name = addon.L["Chains of Domination"]
                },
            }
        },
        { -- 9.2
            Minor = 2,
            Patches = {
                { -- 9.2.0
                    Patch = 0,
                    BuildVersionId = "090200",
                    Name = addon.L["Eternity's End"]
                },
                { -- 9.2.5
                    Patch = 5,
                    BuildVersionId = "090205",
                    Name = addon.L["Eternity's End"]
                },
                { -- 9.2.7
                    Patch = 7,
                    BuildVersionId = "090207",
                    Name = addon.L["Eternity's End"]
                },
            },
        },
    },
};