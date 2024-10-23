local _, addon = ...;
addon.Data.ExportedBuildVersions = {};
local exportedBuildVersions = addon.Data.ExportedBuildVersions;

local tasks, buildVersions;
function exportedBuildVersions.RegisterTasks(_buildVersions)
    buildVersions = _buildVersions;
    wipe(buildVersions);

    local name = "Build Versions";
    addon.Data.InjectLoadingDebug(tasks, name);

    tinsert(addon.Data.TasksGroups, 1, tasks);
end

local buildVersion = addon.Objects.BuildVersion;
local function N(id, ...)
    buildVersions[id] = buildVersion:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-10-20 09-03-35 ]] --
tasks = {
    {N, "040401", 4, 4, 1, "4.4.1", addon.L["Rage of the Firelands"]},
    {N, "040400", 4, 4, 0, "4.4.0", addon.L["Cataclysm"]},
    {N, "040302", 4, 3, 2, "4.3.2", addon.L["Hour of Twilight"]},
    {N, "040300", 4, 3, 0, "4.3.0", addon.L["Hour of Twilight"]},
    {N, "040202", 4, 2, 2, "4.2.2", addon.L["Rage of the Firelands"]},
    {N, "040200", 4, 2, 0, "4.2.0", addon.L["Rage of the Firelands"]},
    {N, "040100", 4, 1, 0, "4.1.0", addon.L["Rise of the Zandalari"]},
    {N, "040006", 4, 0, 6, "4.0.6", addon.L["Cataclysm"]},
    {N, "040003", 4, 0, 3, "4.0.3", addon.L["Cataclysm (pre-patch)"]},
    {N, "040001", 4, 0, 1, "4.0.1", addon.L["Cataclysm (pre-patch)"]},
    {N, "030403", 3, 4, 3, "3.4.3", addon.L["Fall of the Lich King"]},
    {N, "030402", 3, 4, 2, "3.4.2", addon.L["Call of the Crusade"]},
    {N, "030401", 3, 4, 1, "3.4.1", addon.L["Secrets of Ulduar"]},
    {N, "030400", 3, 4, 0, "3.4.0", addon.L["Wrath of the Lich King"]},
    {N, "030305", 3, 3, 5, "3.3.5", addon.L["Defending the Ruby Sanctum"]},
    {N, "030303", 3, 3, 3, "3.3.3", addon.L["Fall of the Lich King"]},
    {N, "030300", 3, 3, 0, "3.3.0", addon.L["Fall of the Lich King"]},
    {N, "030202", 3, 2, 2, "3.2.2", addon.L["Call of the Crusade"]},
    {N, "030200", 3, 2, 0, "3.2.0", addon.L["Call of the Crusade"]},
    {N, "030100", 3, 1, 0, "3.1.0", addon.L["Secrets of Ulduar"]},
    {N, "030002", 3, 0, 2, "3.0.2", addon.L["Wrath of the Lich King"]},
};

function exportedBuildVersions:InjectDynamicFilters(filters)
    filters["030002"] = true;
    filters["030100"] = true;
    filters["030200"] = true;
    filters["030202"] = true;
    filters["030300"] = true;
    filters["030303"] = true;
    filters["030305"] = true;
    filters["030400"] = true;
    filters["030401"] = true;
    filters["030402"] = true;
    filters["030403"] = true;
    filters["040001"] = true;
    filters["040003"] = true;
    filters["040006"] = true;
    filters["040100"] = true;
    filters["040200"] = true;
    filters["040202"] = true;
    filters["040300"] = true;
    filters["040302"] = true;
    filters["040400"] = true;
    filters["040401"] = true;

    return {
        { -- 3
            Major = 3,
            Minors = {
                { -- 3.0
                    Minor = 0,
                    Patches = {
                        { -- 3.0.2
                            Patch = 2,
                            BuildVersionId = "030002"
                        },
                    }
                },
                { -- 3.1
                    Minor = 1,
                    Patches = {
                        { -- 3.1.0
                            Patch = 0,
                            BuildVersionId = "030100"
                        },
                    }
                },
                { -- 3.2
                    Minor = 2,
                    Patches = {
                        { -- 3.2.0
                            Patch = 0,
                            BuildVersionId = "030200"
                        },
                        { -- 3.2.2
                            Patch = 2,
                            BuildVersionId = "030202"
                        },
                    }
                },
                { -- 3.3
                    Minor = 3,
                    Patches = {
                        { -- 3.3.0
                            Patch = 0,
                            BuildVersionId = "030300"
                        },
                        { -- 3.3.3
                            Patch = 3,
                            BuildVersionId = "030303"
                        },
                        { -- 3.3.5
                            Patch = 5,
                            BuildVersionId = "030305"
                        },
                    }
                },
                { -- 3.4
                    Minor = 4,
                    Patches = {
                        { -- 3.4.0
                            Patch = 0,
                            BuildVersionId = "030400"
                        },
                        { -- 3.4.1
                            Patch = 1,
                            BuildVersionId = "030401"
                        },
                        { -- 3.4.2
                            Patch = 2,
                            BuildVersionId = "030402"
                        },
                        { -- 3.4.3
                            Patch = 3,
                            BuildVersionId = "030403"
                        },
                    },
                },
            },
        },
        { -- 4
            Major = 4,
            Minors = {
                { -- 4.0
                    Minor = 0,
                    Patches = {
                        { -- 4.0.1
                            Patch = 1,
                            BuildVersionId = "040001"
                        },
                        { -- 4.0.3
                            Patch = 3,
                            BuildVersionId = "040003"
                        },
                        { -- 4.0.6
                            Patch = 6,
                            BuildVersionId = "040006"
                        },
                    }
                },
                { -- 4.1
                    Minor = 1,
                    Patches = {
                        { -- 4.1.0
                            Patch = 0,
                            BuildVersionId = "040100"
                        },
                    }
                },
                { -- 4.2
                    Minor = 2,
                    Patches = {
                        { -- 4.2.0
                            Patch = 0,
                            BuildVersionId = "040200"
                        },
                        { -- 4.2.2
                            Patch = 2,
                            BuildVersionId = "040202"
                        },
                    }
                },
                { -- 4.3
                    Minor = 3,
                    Patches = {
                        { -- 4.3.0
                            Patch = 0,
                            BuildVersionId = "040300"
                        },
                        { -- 4.3.2
                            Patch = 2,
                            BuildVersionId = "040302"
                        },
                    }
                },
                { -- 4.4
                    Minor = 4,
                    Patches = {
                        { -- 4.4.0
                            Patch = 0,
                            BuildVersionId = "040400"
                        },
                        { -- 4.4.1
                            Patch = 1,
                            BuildVersionId = "040401"
                        },
                    },
                },
            },
        },
    };
end