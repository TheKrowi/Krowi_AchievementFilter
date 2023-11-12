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

-- [[ Exported at 2023-11-11 22-37-20 ]] --
tasks = {
    {N, 204, "3.4.3", "030403"},
    {N, 203, "3.4.2", "030402"},
    {N, 197, "3.4.1", "030401"},
    {N, 194, "3.4.0", "030400"},
    {N, 106, "3.3.5", "030305"},
    {N, 104, "3.3.3", "030303"},
    {N, 101, "3.3.0", "030300"},
    {N, 99, "3.2.2", "030202"},
    {N, 97, "3.2.0", "030200"},
    {N, 92, "3.1.0", "030100"},
    {N, 86, "3.0.2", "030002"},
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
    };
end