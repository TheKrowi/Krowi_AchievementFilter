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

local function N(id, ...)
    buildVersions[id] = buildVersion:New(id, ...);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2023-10-23 22-17-19 ]] --
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

function exportedBuildVersions:InjectDynamicFilters(filters)
    filters[86] = true;
    filters[104] = true;
    filters[106] = true;
    filters[194] = true;
    filters[108] = true;
    filters[110] = true;
    filters[112] = true;
    filters[114] = true;
    filters[116] = true;
    filters[118] = true;
    filters[119] = true;
    filters[121] = true;
    filters[124] = true;
    filters[128] = true;
    filters[130] = true;
    filters[141] = true;
    filters[148] = true;
    filters[151] = true;
    filters[152] = true;
    filters[159] = true;
    filters[163] = true;
    filters[165] = true;
    filters[167] = true;
    filters[171] = true;
    filters[174] = true;
    filters[175] = true;
    filters[176] = true;
    filters[177] = true;
    filters[178] = true;
    filters[179] = true;
    filters[180] = true;
    filters[181] = true;
    filters[182] = true;
    filters[183] = true;
    filters[184] = true;
    filters[186] = true;
    filters[187] = true;
    filters[188] = true;
    filters[189] = true;
    filters[190] = true;
    filters[191] = true;
    filters[192] = true;
    filters[193] = true;
    filters[196] = true;
    filters[195] = true;
    filters[198] = true;
    filters[199] = true;
    filters[200] = true;
    filters[201] = true;
    filters[202] = true;

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
                { -- 3.3
                    Minor = 3,
                    Patches = {
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
        { -- 5
            Major = 5,
            Minors = {
                { -- 5.0
                    Minor = 0,
                    Patches = {
                        { -- 5.0.4
                            Patch = 4,
                            BuildVersionId = 124
                        },
                    }
                },
                { -- 5.1
                    Minor = 1,
                    Patches = {
                        { -- 5.1.0
                            Patch = 0,
                            BuildVersionId = 128
                        },
                    }
                },
                { -- 5.2
                    Minor = 2,
                    Patches = {
                        { -- 5.2.0
                            Patch = 0,
                            BuildVersionId = 130
                        },
                    }
                },
                { -- 5.3
                    Minor = 3,
                    Patches = {
                        { -- 5.3.0
                            Patch = 0,
                            BuildVersionId = 141
                        },
                    }
                },
                { -- 5.4
                    Minor = 4,
                    Patches = {
                        { -- 5.4.0
                            Patch = 0,
                            BuildVersionId = 148
                        },
                        { -- 5.4.1
                            Patch = 1,
                            BuildVersionId = 151
                        },
                        { -- 5.4.2
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
                { -- 6.0
                    Minor = 0,
                    Patches = {
                        { -- 6.0.2
                            Patch = 2,
                            BuildVersionId = 159
                        },
                    }
                },
                { -- 6.1
                    Minor = 1,
                    Patches = {
                        { -- 6.1.0
                            Patch = 0,
                            BuildVersionId = 163
                        },
                    }
                },
                { -- 6.2
                    Minor = 2,
                    Patches = {
                        { -- 6.2.0
                            Patch = 0,
                            BuildVersionId = 165
                        },
                        { -- 6.2.2
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
                { -- 7.0
                    Minor = 0,
                    Patches = {
                        { -- 7.0.3
                            Patch = 3,
                            BuildVersionId = 171
                        },
                    }
                },
                { -- 7.2
                    Minor = 2,
                    Patches = {
                        { -- 7.2.0
                            Patch = 0,
                            BuildVersionId = 174
                        },
                        { -- 7.2.5
                            Patch = 5,
                            BuildVersionId = 175
                        },
                    }
                },
                { -- 7.3
                    Minor = 3,
                    Patches = {
                        { -- 7.3.0
                            Patch = 0,
                            BuildVersionId = 176
                        },
                        { -- 7.3.2
                            Patch = 2,
                            BuildVersionId = 177
                        },
                        { -- 7.3.5
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
                { -- 8.0
                    Minor = 0,
                    Patches = {
                        { -- 8.0.1
                            Patch = 1,
                            BuildVersionId = 179
                        },
                    }
                },
                { -- 8.1
                    Minor = 1,
                    Patches = {
                        { -- 8.1.0
                            Patch = 0,
                            BuildVersionId = 180
                        },
                        { -- 8.1.5
                            Patch = 5,
                            BuildVersionId = 181
                        },
                    }
                },
                { -- 8.2
                    Minor = 2,
                    Patches = {
                        { -- 8.2.0
                            Patch = 0,
                            BuildVersionId = 182
                        },
                        { -- 8.2.5
                            Patch = 5,
                            BuildVersionId = 183
                        },
                    }
                },
                { -- 8.3
                    Minor = 3,
                    Patches = {
                        { -- 8.3.0
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
                { -- 9.0
                    Minor = 0,
                    Patches = {
                        { -- 9.0.1
                            Patch = 1,
                            BuildVersionId = 186
                        },
                        { -- 9.0.2
                            Patch = 2,
                            BuildVersionId = 187
                        },
                        { -- 9.0.5
                            Patch = 5,
                            BuildVersionId = 188
                        },
                    }
                },
                { -- 9.1
                    Minor = 1,
                    Patches = {
                        { -- 9.1.0
                            Patch = 0,
                            BuildVersionId = 189
                        },
                        { -- 9.1.5
                            Patch = 5,
                            BuildVersionId = 190
                        },
                    }
                },
                { -- 9.2
                    Minor = 2,
                    Patches = {
                        { -- 9.2.0
                            Patch = 0,
                            BuildVersionId = 191
                        },
                        { -- 9.2.5
                            Patch = 5,
                            BuildVersionId = 192
                        },
                        { -- 9.2.7
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
                { -- 10.0
                    Minor = 0,
                    Patches = {
                        { -- 10.0.0
                            Patch = 0,
                            BuildVersionId = 196
                        },
                        { -- 10.0.2
                            Patch = 2,
                            BuildVersionId = 195
                        },
                        { -- 10.0.5
                            Patch = 5,
                            BuildVersionId = 198
                        },
                        { -- 10.0.7
                            Patch = 7,
                            BuildVersionId = 199
                        },
                    }
                },
                { -- 10.1
                    Minor = 1,
                    Patches = {
                        { -- 10.1.0
                            Patch = 0,
                            BuildVersionId = 200
                        },
                        { -- 10.1.5
                            Patch = 5,
                            BuildVersionId = 201
                        },
                        { -- 10.1.7
                            Patch = 7,
                            BuildVersionId = 202
                        },
                    },
                },
            },
        },
    };
end