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

function exportedBuildVersions:InjectDynamicFilter(filters, buildVersionIds, id)
    filters[id] = true;
    tinsert(buildVersionIds, id);
end

local function N(id, ...)
    buildVersions[id] = buildVersion:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-23 19-34-22 ]] --
tasks = {
    {N, 202, "10.1.7", "100107"},
    {N, 201, "10.1.5", "100105"},
    {N, 200, "10.1.0", "100100"},
    {N, 199, "10.0.7", "100007"},
    {N, 198, "10.0.5", "100005"},
    {N, 195, "10.0.2", "100002"},
    {N, 196, "10.0.0", "100000"},
    {N, 193, "9.2.7", "090207"},
    {N, 192, "9.2.5", "090205"},
    {N, 191, "9.2.0", "090200"},
    {N, 190, "9.1.5", "090105"},
    {N, 189, "9.1.0", "090100"},
    {N, 188, "9.0.5", "090005"},
    {N, 187, "9.0.2", "090002"},
    {N, 186, "9.0.1", "090001"},
    {N, 184, "8.3.0", "080300"},
    {N, 183, "8.2.5", "080205"},
    {N, 182, "8.2.0", "080200"},
    {N, 181, "8.1.5", "080105"},
    {N, 180, "8.1.0", "080100"},
    {N, 179, "8.0.1", "080001"},
    {N, 178, "7.3.5", "070305"},
    {N, 177, "7.3.2", "070302"},
    {N, 176, "7.3.0", "070300"},
    {N, 175, "7.2.5", "070205"},
    {N, 174, "7.2.0", "070200"},
    {N, 171, "7.0.3", "070003"},
    {N, 167, "6.2.2", "060202"},
    {N, 165, "6.2.0", "060200"},
    {N, 163, "6.1.0", "060100"},
    {N, 159, "6.0.2", "060002"},
    {N, 152, "5.4.2", "050402"},
    {N, 151, "5.4.1", "050401"},
    {N, 148, "5.4.0", "050400"},
    {N, 141, "5.3.0", "050300"},
    {N, 130, "5.2.0", "050200"},
    {N, 128, "5.1.0", "050100"},
    {N, 124, "5.0.4", "050004"},
    {N, 121, "4.3.2", "040302"},
    {N, 119, "4.3.0", "040300"},
    {N, 118, "4.2.2", "040202"},
    {N, 116, "4.2.0", "040200"},
    {N, 114, "4.1.0", "040100"},
    {N, 112, "4.0.6", "040006"},
    {N, 110, "4.0.3", "040003"},
    {N, 108, "4.0.1", "040001"},
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
    self:InjectDynamicFilter(filters, buildVersionIds, 108);
    self:InjectDynamicFilter(filters, buildVersionIds, 110);
    self:InjectDynamicFilter(filters, buildVersionIds, 112);
    self:InjectDynamicFilter(filters, buildVersionIds, 114);
    self:InjectDynamicFilter(filters, buildVersionIds, 116);
    self:InjectDynamicFilter(filters, buildVersionIds, 118);
    self:InjectDynamicFilter(filters, buildVersionIds, 119);
    self:InjectDynamicFilter(filters, buildVersionIds, 121);
    self:InjectDynamicFilter(filters, buildVersionIds, 124);
    self:InjectDynamicFilter(filters, buildVersionIds, 128);
    self:InjectDynamicFilter(filters, buildVersionIds, 130);
    self:InjectDynamicFilter(filters, buildVersionIds, 141);
    self:InjectDynamicFilter(filters, buildVersionIds, 148);
    self:InjectDynamicFilter(filters, buildVersionIds, 151);
    self:InjectDynamicFilter(filters, buildVersionIds, 152);
    self:InjectDynamicFilter(filters, buildVersionIds, 159);
    self:InjectDynamicFilter(filters, buildVersionIds, 163);
    self:InjectDynamicFilter(filters, buildVersionIds, 165);
    self:InjectDynamicFilter(filters, buildVersionIds, 167);
    self:InjectDynamicFilter(filters, buildVersionIds, 171);
    self:InjectDynamicFilter(filters, buildVersionIds, 174);
    self:InjectDynamicFilter(filters, buildVersionIds, 175);
    self:InjectDynamicFilter(filters, buildVersionIds, 176);
    self:InjectDynamicFilter(filters, buildVersionIds, 177);
    self:InjectDynamicFilter(filters, buildVersionIds, 178);
    self:InjectDynamicFilter(filters, buildVersionIds, 179);
    self:InjectDynamicFilter(filters, buildVersionIds, 180);
    self:InjectDynamicFilter(filters, buildVersionIds, 181);
    self:InjectDynamicFilter(filters, buildVersionIds, 182);
    self:InjectDynamicFilter(filters, buildVersionIds, 183);
    self:InjectDynamicFilter(filters, buildVersionIds, 184);
    self:InjectDynamicFilter(filters, buildVersionIds, 186);
    self:InjectDynamicFilter(filters, buildVersionIds, 187);
    self:InjectDynamicFilter(filters, buildVersionIds, 188);
    self:InjectDynamicFilter(filters, buildVersionIds, 189);
    self:InjectDynamicFilter(filters, buildVersionIds, 190);
    self:InjectDynamicFilter(filters, buildVersionIds, 191);
    self:InjectDynamicFilter(filters, buildVersionIds, 192);
    self:InjectDynamicFilter(filters, buildVersionIds, 193);
    self:InjectDynamicFilter(filters, buildVersionIds, 196);
    self:InjectDynamicFilter(filters, buildVersionIds, 195);
    self:InjectDynamicFilter(filters, buildVersionIds, 198);
    self:InjectDynamicFilter(filters, buildVersionIds, 199);
    self:InjectDynamicFilter(filters, buildVersionIds, 200);
    self:InjectDynamicFilter(filters, buildVersionIds, 201);
    self:InjectDynamicFilter(filters, buildVersionIds, 202);

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
                    },
                },
            },
        },
        { -- 4
            Major = 4,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 1
                            Patch = 1,
                            BuildVersionId = 108
                        },
                        { -- 3
                            Patch = 3,
                            BuildVersionId = 110
                        },
                        { -- 6
                            Patch = 6,
                            BuildVersionId = 112
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 114
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 116
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 118
                        },
                    }
                },
                { -- 3
                    Minor = 3,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 119
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 121
                        },
                    },
                },
            },
        },
        { -- 5
            Major = 5,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 4
                            Patch = 4,
                            BuildVersionId = 124
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 128
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 130
                        },
                    }
                },
                { -- 3
                    Minor = 3,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 141
                        },
                    }
                },
                { -- 4
                    Minor = 4,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 148
                        },
                        { -- 1
                            Patch = 1,
                            BuildVersionId = 151
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 152
                        },
                    },
                },
            },
        },
        { -- 6
            Major = 6,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 159
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 163
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 165
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 167
                        },
                    },
                },
            },
        },
        { -- 7
            Major = 7,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 3
                            Patch = 3,
                            BuildVersionId = 171
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 174
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 175
                        },
                    }
                },
                { -- 3
                    Minor = 3,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 176
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 177
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 178
                        },
                    },
                },
            },
        },
        { -- 8
            Major = 8,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 1
                            Patch = 1,
                            BuildVersionId = 179
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 180
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 181
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 182
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 183
                        },
                    }
                },
                { -- 3
                    Minor = 3,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 184
                        },
                    },
                },
            },
        },
        { -- 9
            Major = 9,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 1
                            Patch = 1,
                            BuildVersionId = 186
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 187
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 188
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 189
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 190
                        },
                    }
                },
                { -- 2
                    Minor = 2,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 191
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 192
                        },
                        { -- 7
                            Patch = 7,
                            BuildVersionId = 193
                        },
                    },
                },
            },
        },
        { -- 10
            Major = 10,
            Minors = {
                { -- 0
                    Minor = 0,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 196
                        },
                        { -- 2
                            Patch = 2,
                            BuildVersionId = 195
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 198
                        },
                        { -- 7
                            Patch = 7,
                            BuildVersionId = 199
                        },
                    }
                },
                { -- 1
                    Minor = 1,
                    Patches = {
                        { -- 0
                            Patch = 0,
                            BuildVersionId = 200
                        },
                        { -- 5
                            Patch = 5,
                            BuildVersionId = 201
                        },
                        { -- 7
                            Patch = 7,
                            BuildVersionId = 202
                        },
                    },
                },
            },
        },
    };
end