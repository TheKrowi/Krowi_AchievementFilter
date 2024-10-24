local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.Cataclysm = { -- 4
    Major = 4,
    Minors = {
        { -- 4.0
            Minor = 0,
            Patches = {
                { -- 4.0.1
                    Patch = 1,
                    BuildVersionId = "040001",
                    Name = addon.L["Cataclysm (pre-patch)"]
                },
                { -- 4.0.3
                    Patch = 3,
                    BuildVersionId = "040003",
                    Name = addon.L["Cataclysm (pre-patch)"]
                },
                { -- 4.0.6
                    Patch = 6,
                    BuildVersionId = "040006",
                    Name = addon.L["Cataclysm"]
                },
            }
        },
        { -- 4.1
            Minor = 1,
            Patches = {
                { -- 4.1.0
                    Patch = 0,
                    BuildVersionId = "040100",
                    Name = addon.L["Rise of the Zandalari"]
                },
            }
        },
        { -- 4.2
            Minor = 2,
            Patches = {
                { -- 4.2.0
                    Patch = 0,
                    BuildVersionId = "040200",
                    Name = addon.L["Rage of the Firelands"]
                },
                { -- 4.2.2
                    Patch = 2,
                    BuildVersionId = "040202",
                    Name = addon.L["Rage of the Firelands"]
                },
            }
        },
        { -- 4.3
            Minor = 3,
            Patches = {
                { -- 4.3.0
                    Patch = 0,
                    BuildVersionId = "040300",
                    Name = addon.L["Hour of Twilight"]
                },
                { -- 4.3.2
                    Patch = 2,
                    BuildVersionId = "040302",
                    Name = addon.L["Hour of Twilight"]
                },
            },
        },
    },
};