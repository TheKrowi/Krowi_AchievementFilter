local _, addon = ...;
local shared = addon.Data.BuildVersionData.Shared;

KrowiAF.BuildVersionData.Midnight = { -- 12
	Major = 12,
	Minors = {
		{ -- 12.0
			Minor = 0,
			Patches = {
				{ -- 12.0.0
					Patch = 0,
					BuildVersionId = "120000",
					Name = addon.L["Midnight"]
				},
				{ -- 12.0.5
					Patch = 5,
					BuildVersionId = "120005",
					Name = addon.L["Lingering Shadows"]
				},
			},
		},
	},
};