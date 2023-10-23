local _, addon = ...;
local data = addon.Data;
data.ExportedBuildVersions = {};
local exportedBuildVersions = data.ExportedBuildVersions;
local objects = addon.Objects;
local buildVersion = objects.BuildVersion;

local tasks, buildVersions;
function exportedBuildVersions.RegisterTasks(_buildVersions)
    buildVersions = _buildVersions;
    wipe(buildVersions);

    local name = "Build Versions";
    data.InjectLoadingDebug(tasks, name);

    tinsert(data.TasksGroups, 1, tasks);
end

function exportedBuildVersions.InjectDynamicFilters()
end

local function N(id, ...)
    buildVersions[id] = buildVersion:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-23 19-34-28 ]] --
tasks = {
    {N, 204, "3.4.3", "030403"},
    {N, 203, "3.4.2", "030402"},
    {N, 197, "3.4.1", "030401"},
    {N, 194, "3.4.0", "030400"},
    {N, 106, "3.3.5", "030305"},
    {N, 104, "3.3.3", "030303"},
    {N, 86, "3.0.2", "030002"},
};

function exportedBuildVersions:InjectDynamicFilters(filters, buildVersionIds)
    self:InjectDynamicFilter(filters, buildVersionIds, 86);
    self:InjectDynamicFilter(filters, buildVersionIds, 104);
    self:InjectDynamicFilter(filters, buildVersionIds, 106);
    self:InjectDynamicFilter(filters, buildVersionIds, 194);
    self:InjectDynamicFilter(filters, buildVersionIds, 197);
    self:InjectDynamicFilter(filters, buildVersionIds, 203);
    self:InjectDynamicFilter(filters, buildVersionIds, 204);

    return {
        { -- 3
            Major = 3,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 86
                        },
                    }
                },
                { -- 3
                    Minor = 3,
                    Patches = {
                        { -- 3
                            Patch = 3,
                            BuildVersionId = 104
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 106
                        },
                    }
                },
                { -- 4
                    Minor = 4,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 194
                        },
                        { -- 1
                            Patch = 1,
                            BuildVersionId = 197
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 203
                        },
                        { -- 3
                            Patch = 3,
                            BuildVersionId = 204
                        },
                    },
                },
            },
        },
    };
end