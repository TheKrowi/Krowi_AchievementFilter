local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.WarlordsOfDaenor = { -- 6
    Major = 6,
    Minors = {
        { -- 6.0
            Minor = 0,
            Patches = {
                { -- 6.0.2
                    Patch = 2,
                    BuildVersionId = "060002",
                    Name = addon.L["Warlords of Draenor"]
                },
            }
        },
        { -- 6.1
            Minor = 1,
            Patches = {
                { -- 6.1.0
                    Patch = 0,
                    BuildVersionId = "060100",
                    Name = addon.L["Garrisons Update"]
                },
            }
        },
        { -- 6.2
            Minor = 2,
            Patches = {
                { -- 6.2.0
                    Patch = 0,
                    BuildVersionId = "060200",
                    Name = addon.L["Fury of Hellfire"]
                },
                { -- 6.2.2
                    Patch = 2,
                    BuildVersionId = "060202",
                    Name = addon.L["Fury of Hellfire"]
                },
            },
        },
    },
};