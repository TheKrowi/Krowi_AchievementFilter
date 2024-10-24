local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.WrathOfTheLichKing = { -- 3
    Major = 3,
    Minors = {
        { -- 3.0
            Minor = 0,
            Patches = {
                { -- 3.0.2
                    Patch = 2,
                    BuildVersionId = "030002",
                    Name = addon.L["Wrath of the Lich King"]
                },
            }
        },
        { -- 3.1
            Minor = 1,
            Patches = {
                { -- 3.1.0
                    Patch = 0,
                    BuildVersionId = "030100",
                    Name = addon.L["Secrets of Ulduar"]
                },
            }
        },
        { -- 3.2
            Minor = 2,
            Patches = {
                { -- 3.2.0
                    Patch = 0,
                    BuildVersionId = "030200",
                    Name = addon.L["Call of the Crusade"]
                },
                { -- 3.2.2
                    Patch = 2,
                    BuildVersionId = "030202",
                    Name = addon.L["Call of the Crusade"]
                },
            }
        },
        { -- 3.3
            Minor = 3,
            Patches = {
                { -- 3.3.0
                    Patch = 0,
                    BuildVersionId = "030300",
                    Name = addon.L["Fall of the Lich King"]
                },
                { -- 3.3.3
                    Patch = 3,
                    BuildVersionId = "030303",
                    Name = addon.L["Fall of the Lich King"]
                },
                { -- 3.3.5
                    Patch = 5,
                    BuildVersionId = "030305",
                    Name = addon.L["Defending the Ruby Sanctum"]
                },
            },
        },
    },
};