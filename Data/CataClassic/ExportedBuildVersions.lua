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

-- [[ Exported at 2024-04-27 15-04-25 ]] --
tasks = {
    {N, 121, "4.3.2", "040302", addon.L["Hour of Twilight"]},
    {N, 119, "4.3.0", "040300", addon.L["Hour of Twilight"]},
    {N, 118, "4.2.2", "040202", addon.L["Rage of the Firelands"]},
    {N, 116, "4.2.0", "040200", addon.L["Rage of the Firelands"]},
    {N, 114, "4.1.0", "040100", addon.L["Rise of the Zandalari"]},
    {N, 112, "4.0.6", "040006", addon.L["Cataclysm"]},
    {N, 110, "4.0.3", "040003", addon.L["Cataclysm (pre-patch)"]},
    {N, 108, "4.0.1", "040001", addon.L["Cataclysm (pre-patch)"]},
    {N, 204, "3.4.3", "030403", addon.L["Fall of the Lich King"]},
    {N, 203, "3.4.2", "030402", addon.L["Call of the Crusade"]},
    {N, 197, "3.4.1", "030401", addon.L["Secrets of Ulduar"]},
    {N, 194, "3.4.0", "030400", addon.L["Wrath of the Lich King"]},
    {N, 106, "3.3.5", "030305", addon.L["Defending the Ruby Sanctum"]},
    {N, 104, "3.3.3", "030303", addon.L["Fall of the Lich King"]},
    {N, 101, "3.3.0", "030300", addon.L["Fall of the Lich King"]},
    {N, 99, "3.2.2", "030202", addon.L["Call of the Crusade"]},
    {N, 97, "3.2.0", "030200", addon.L["Call of the Crusade"]},
    {N, 92, "3.1.0", "030100", addon.L["Secrets of Ulduar"]},
    {N, 86, "3.0.2", "030002", addon.L["Wrath of the Lich King"]},
};

function exportedBuildVersions:InjectDynamicFilters(filters)
    filters[86] = true;
    filters[92] = true;
    filters[97] = true;
    filters[99] = true;
    filters[101] = true;
    filters[104] = true;
    filters[106] = true;
    filters[194] = true;
    filters[197] = true;
    filters[203] = true;
    filters[204] = true;
    filters[108] = true;
    filters[110] = true;
    filters[112] = true;
    filters[114] = true;
    filters[116] = true;
    filters[118] = true;
    filters[119] = true;
    filters[121] = true;

    return {
        { -- 3
            Major = 3,
            Minors = {
                { -- 3.0
                    Minor = 0,
                    Patches = {
                        { -- 3.0.2
                            Patch = 2,
                            BuildVersionId = 86
                        },
                    }
                },
                { -- 3.1
                    Minor = 1,
                    Patches = {
                        { -- 3.1.0
                            Patch = 0,
                            BuildVersionId = 92
                        },
                    }
                },
                { -- 3.2
                    Minor = 2,
                    Patches = {
                        { -- 3.2.0
                            Patch = 0,
                            BuildVersionId = 97
                        },
                        { -- 3.2.2
                            Patch = 2,
                            BuildVersionId = 99
                        },
                    }
                },
                { -- 3.3
                    Minor = 3,
                    Patches = {
                        { -- 3.3.0
                            Patch = 0,
                            BuildVersionId = 101
                        },
                        { -- 3.3.3
                            Patch = 3,
                            BuildVersionId = 104
                        },
                        { -- 3.3.5
                            Patch = 5,
                            BuildVersionId = 106
                        },
                    }
                },
                { -- 3.4
                    Minor = 4,
                    Patches = {
                        { -- 3.4.0
                            Patch = 0,
                            BuildVersionId = 194
                        },
                        { -- 3.4.1
                            Patch = 1,
                            BuildVersionId = 197
                        },
                        { -- 3.4.2
                            Patch = 2,
                            BuildVersionId = 203
                        },
                        { -- 3.4.3
                            Patch = 3,
                            BuildVersionId = 204
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
                            BuildVersionId = 108
                        },
                        { -- 4.0.3
                            Patch = 3,
                            BuildVersionId = 110
                        },
                        { -- 4.0.6
                            Patch = 6,
                            BuildVersionId = 112
                        },
                    }
                },
                { -- 4.1
                    Minor = 1,
                    Patches = {
                        { -- 4.1.0
                            Patch = 0,
                            BuildVersionId = 114
                        },
                    }
                },
                { -- 4.2
                    Minor = 2,
                    Patches = {
                        { -- 4.2.0
                            Patch = 0,
                            BuildVersionId = 116
                        },
                        { -- 4.2.2
                            Patch = 2,
                            BuildVersionId = 118
                        },
                    }
                },
                { -- 4.3
                    Minor = 3,
                    Patches = {
                        { -- 4.3.0
                            Patch = 0,
                            BuildVersionId = 119
                        },
                        { -- 4.3.2
                            Patch = 2,
                            BuildVersionId = 121
                        },
                    },
                },
            },
        },
    };
end