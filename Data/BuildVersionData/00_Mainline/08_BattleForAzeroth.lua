local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.BattleForAzeroth = { -- 8
    Major = 8,
    Minors = {
        { -- 8.0
            Minor = 0,
            Patches = {
                { -- 8.0.1
                    Patch = 1,
                    BuildVersionId = "080001",
                    Name = addon.L["Battle for Azeroth"]
                },
            }
        },
        { -- 8.1
            Minor = 1,
            Patches = {
                { -- 8.1.0
                    Patch = 0,
                    BuildVersionId = "080100",
                    Name = addon.L["Tides of Vengeance"]
                },
                { -- 8.1.5
                    Patch = 5,
                    BuildVersionId = "080105",
                    Name = addon.L["Tides of Vengeance"]
                },
            }
        },
        { -- 8.2
            Minor = 2,
            Patches = {
                { -- 8.2.0
                    Patch = 0,
                    BuildVersionId = "080200",
                    Name = addon.L["Rise of Azshara"]
                },
                { -- 8.2.5
                    Patch = 5,
                    BuildVersionId = "080205",
                    Name = addon.L["Rise of Azshara"]
                },
            }
        },
        { -- 8.3
            Minor = 3,
            Patches = {
                { -- 8.3.0
                    Patch = 0,
                    BuildVersionId = "080300",
                    Name = addon.L["Visions of N'Zoth"]
                },
            },
        },
    },
};