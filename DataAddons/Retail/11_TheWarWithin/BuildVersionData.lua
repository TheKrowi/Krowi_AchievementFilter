local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.TheWarWithin = { -- 11
	Major = 11,
	Minors = {
		{ -- 11.0
			Minor = 0,
			Patches = {
				{ -- 11.0.0
					Patch = 0,
					BuildVersionId = "110000",
                    Name = addon.L["The War Within (pre-patch)"]
				},
				{ -- 11.0.2
					Patch = 2,
					BuildVersionId = "110002",
                    Name = addon.L["The War Within"]
				},
				{ -- 11.0.5
					Patch = 5,
					BuildVersionId = "110005",
                    Name = addon.L["WoW's 20th Anniversary"]
				},
				{ -- 11.0.7
					Patch = 7,
					BuildVersionId = "110007",
                    Name = addon.L["Siren Isle"]
				},
			},
		},
        { -- 11.1
            Minor = 1,
            Patches = {
                { -- 11.1.0
                    Patch = 0,
                    BuildVersionId = "110100",
                    Name = addon.L["Undermine(d)"]
                },
                { -- 11.1.5
                    Patch = 5,
                    BuildVersionId = "110105",
                    Name = addon.L["Nightfall"]
                },
            }
        },
	},
};