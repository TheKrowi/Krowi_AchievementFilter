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
    -- KrowiAF.AddToGroup(buildVersions[id]);
end

-- [[ Everything after these lines is automatically generated as an export from ]] --
-- [[ an SQLite database and is not meant for manual edit. - AUTOGENTOKEN ]] --

-- [[ Exported at 2024-10-20 09-03-36 ]] --
tasks = {
    {N, "110005", 11, 0, 5, "11.0.5", addon.L["WoW's 20th Anniversary"]},
    {N, "110002", 11, 0, 2, "11.0.2", addon.L["The War Within"]},
    {N, "110000", 11, 0, 0, "11.0.0", addon.L["The War Within (pre-patch)"]},
    {N, "100207", 10, 2, 7, "10.2.7", addon.L["Dark Heart"]},
    {N, "100206", 10, 2, 6, "10.2.6", addon.L["Plunderstorm"]},
    {N, "100205", 10, 2, 5, "10.2.5", addon.L["Seeds of Renewal"]},
    {N, "100200", 10, 2, 0, "10.2.0", addon.L["Guardians of the Dream"]},
    {N, "100107", 10, 1, 7, "10.1.7", addon.L["Fury Incarnate"]},
    {N, "100105", 10, 1, 5, "10.1.5", addon.L["Fractures in Time"]},
    {N, "100100", 10, 1, 0, "10.1.0", addon.L["Embers of Neltharion"]},
    {N, "100007", 10, 0, 7, "10.0.7", addon.L["Return to the Forbidden Reach"]},
    {N, "100005", 10, 0, 5, "10.0.5", addon.L["Trading Post"]},
    {N, "100002", 10, 0, 2, "10.0.2", addon.L["Dragonflight"]},
    {N, "100000", 10, 0, 0, "10.0.0", addon.L["Dragonflight (pre-patch)"]},
    {N, "090207", 9, 2, 7, "9.2.7", addon.L["Eternity's End"]},
    {N, "090205", 9, 2, 5, "9.2.5", addon.L["Eternity's End"]},
    {N, "090200", 9, 2, 0, "9.2.0", addon.L["Eternity's End"]},
    {N, "090105", 9, 1, 5, "9.1.5", addon.L["Chains of Domination"]},
    {N, "090100", 9, 1, 0, "9.1.0", addon.L["Chains of Domination"]},
    {N, "090005", 9, 0, 5, "9.0.5", addon.L["Shadowlands"]},
    {N, "090002", 9, 0, 2, "9.0.2", addon.L["Shadowlands"]},
    {N, "090001", 9, 0, 1, "9.0.1", addon.L["Shadowlands (pre-patch)"]},
    {N, "080300", 8, 3, 0, "8.3.0", addon.L["Visions of N'Zoth"]},
    {N, "080205", 8, 2, 5, "8.2.5", addon.L["Rise of Azshara"]},
    {N, "080200", 8, 2, 0, "8.2.0", addon.L["Rise of Azshara"]},
    {N, "080105", 8, 1, 5, "8.1.5", addon.L["Tides of Vengeance"]},
    {N, "080100", 8, 1, 0, "8.1.0", addon.L["Tides of Vengeance"]},
    {N, "080001", 8, 0, 1, "8.0.1", addon.L["Battle for Azeroth"]},
    {N, "070305", 7, 3, 5, "7.3.5", addon.L["Shadows of Argus"]},
    {N, "070302", 7, 3, 2, "7.3.2", addon.L["Shadows of Argus"]},
    {N, "070300", 7, 3, 0, "7.3.0", addon.L["Shadows of Argus"]},
    {N, "070205", 7, 2, 5, "7.2.5", addon.L["The Tomb of Sargeras"]},
    {N, "070200", 7, 2, 0, "7.2.0", addon.L["The Tomb of Sargeras"]},
    {N, "070003", 7, 0, 3, "7.0.3", addon.L["Legion"]},
    {N, "060202", 6, 2, 2, "6.2.2", addon.L["Fury of Hellfire"]},
    {N, "060200", 6, 2, 0, "6.2.0", addon.L["Fury of Hellfire"]},
    {N, "060100", 6, 1, 0, "6.1.0", addon.L["Garrisons Update"]},
    {N, "060002", 6, 0, 2, "6.0.2", addon.L["Warlords of Draenor"]},
    {N, "050402", 5, 4, 2, "5.4.2", addon.L["Siege of Orgrimmar"]},
    {N, "050401", 5, 4, 1, "5.4.1", addon.L["Siege of Orgrimmar"]},
    {N, "050400", 5, 4, 0, "5.4.0", addon.L["Siege of Orgrimmar"]},
    {N, "050300", 5, 3, 0, "5.3.0", addon.L["Escalation"]},
    {N, "050200", 5, 2, 0, "5.2.0", addon.L["The Thunder King"]},
    {N, "050100", 5, 1, 0, "5.1.0", addon.L["Landfall"]},
    {N, "050004", 5, 0, 4, "5.0.4", addon.L["Mists of Pandaria (pre-patch)"]},
    {N, "040302", 4, 3, 2, "4.3.2", addon.L["Hour of Twilight"]},
    {N, "040300", 4, 3, 0, "4.3.0", addon.L["Hour of Twilight"]},
    {N, "040202", 4, 2, 2, "4.2.2", addon.L["Rage of the Firelands"]},
    {N, "040200", 4, 2, 0, "4.2.0", addon.L["Rage of the Firelands"]},
    {N, "040100", 4, 1, 0, "4.1.0", addon.L["Rise of the Zandalari"]},
    {N, "040006", 4, 0, 6, "4.0.6", addon.L["Cataclysm"]},
    {N, "040003", 4, 0, 3, "4.0.3", addon.L["Cataclysm (pre-patch)"]},
    {N, "040001", 4, 0, 1, "4.0.1", addon.L["Cataclysm (pre-patch)"]},
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
    filters["040001"] = true;
    filters["040003"] = true;
    filters["040006"] = true;
    filters["040100"] = true;
    filters["040200"] = true;
    filters["040202"] = true;
    filters["040300"] = true;
    filters["040302"] = true;
    filters["050004"] = true;
    filters["050100"] = true;
    filters["050200"] = true;
    filters["050300"] = true;
    filters["050400"] = true;
    filters["050401"] = true;
    filters["050402"] = true;
    filters["060002"] = true;
    filters["060100"] = true;
    filters["060200"] = true;
    filters["060202"] = true;
    filters["070003"] = true;
    filters["070200"] = true;
    filters["070205"] = true;
    filters["070300"] = true;
    filters["070302"] = true;
    filters["070305"] = true;
    filters["080001"] = true;
    filters["080100"] = true;
    filters["080105"] = true;
    filters["080200"] = true;
    filters["080205"] = true;
    filters["080300"] = true;
    filters["090001"] = true;
    filters["090002"] = true;
    filters["090005"] = true;
    filters["090100"] = true;
    filters["090105"] = true;
    filters["090200"] = true;
    filters["090205"] = true;
    filters["090207"] = true;
    filters["100000"] = true;
    filters["100002"] = true;
    filters["100005"] = true;
    filters["100007"] = true;
    filters["100100"] = true;
    filters["100105"] = true;
    filters["100107"] = true;
    filters["100200"] = true;
    filters["100205"] = true;
    filters["100206"] = true;
    filters["100207"] = true;
    filters["110000"] = true;
    filters["110002"] = true;
    filters["110005"] = true;

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
                            BuildVersionId = "050004"
                        },
                    }
                },
                { -- 5.1
                    Minor = 1,
                    Patches = {
                        { -- 5.1.0
                            Patch = 0,
                            BuildVersionId = "050100"
                        },
                    }
                },
                { -- 5.2
                    Minor = 2,
                    Patches = {
                        { -- 5.2.0
                            Patch = 0,
                            BuildVersionId = "050200"
                        },
                    }
                },
                { -- 5.3
                    Minor = 3,
                    Patches = {
                        { -- 5.3.0
                            Patch = 0,
                            BuildVersionId = "050300"
                        },
                    }
                },
                { -- 5.4
                    Minor = 4,
                    Patches = {
                        { -- 5.4.0
                            Patch = 0,
                            BuildVersionId = "050400"
                        },
                        { -- 5.4.1
                            Patch = 1,
                            BuildVersionId = "050401"
                        },
                        { -- 5.4.2
                            Patch = 2,
                            BuildVersionId = "050402"
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
                            BuildVersionId = "060002"
                        },
                    }
                },
                { -- 6.1
                    Minor = 1,
                    Patches = {
                        { -- 6.1.0
                            Patch = 0,
                            BuildVersionId = "060100"
                        },
                    }
                },
                { -- 6.2
                    Minor = 2,
                    Patches = {
                        { -- 6.2.0
                            Patch = 0,
                            BuildVersionId = "060200"
                        },
                        { -- 6.2.2
                            Patch = 2,
                            BuildVersionId = "060202"
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
                            BuildVersionId = "070003"
                        },
                    }
                },
                { -- 7.2
                    Minor = 2,
                    Patches = {
                        { -- 7.2.0
                            Patch = 0,
                            BuildVersionId = "070200"
                        },
                        { -- 7.2.5
                            Patch = 5,
                            BuildVersionId = "070205"
                        },
                    }
                },
                { -- 7.3
                    Minor = 3,
                    Patches = {
                        { -- 7.3.0
                            Patch = 0,
                            BuildVersionId = "070300"
                        },
                        { -- 7.3.2
                            Patch = 2,
                            BuildVersionId = "070302"
                        },
                        { -- 7.3.5
                            Patch = 5,
                            BuildVersionId = "070305"
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
                            BuildVersionId = "080001"
                        },
                    }
                },
                { -- 8.1
                    Minor = 1,
                    Patches = {
                        { -- 8.1.0
                            Patch = 0,
                            BuildVersionId = "080100"
                        },
                        { -- 8.1.5
                            Patch = 5,
                            BuildVersionId = "080105"
                        },
                    }
                },
                { -- 8.2
                    Minor = 2,
                    Patches = {
                        { -- 8.2.0
                            Patch = 0,
                            BuildVersionId = "080200"
                        },
                        { -- 8.2.5
                            Patch = 5,
                            BuildVersionId = "080205"
                        },
                    }
                },
                { -- 8.3
                    Minor = 3,
                    Patches = {
                        { -- 8.3.0
                            Patch = 0,
                            BuildVersionId = "080300"
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
                            BuildVersionId = "090001"
                        },
                        { -- 9.0.2
                            Patch = 2,
                            BuildVersionId = "090002"
                        },
                        { -- 9.0.5
                            Patch = 5,
                            BuildVersionId = "090005"
                        },
                    }
                },
                { -- 9.1
                    Minor = 1,
                    Patches = {
                        { -- 9.1.0
                            Patch = 0,
                            BuildVersionId = "090100"
                        },
                        { -- 9.1.5
                            Patch = 5,
                            BuildVersionId = "090105"
                        },
                    }
                },
                { -- 9.2
                    Minor = 2,
                    Patches = {
                        { -- 9.2.0
                            Patch = 0,
                            BuildVersionId = "090200"
                        },
                        { -- 9.2.5
                            Patch = 5,
                            BuildVersionId = "090205"
                        },
                        { -- 9.2.7
                            Patch = 7,
                            BuildVersionId = "090207"
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
                            BuildVersionId = "100000"
                        },
                        { -- 10.0.2
                            Patch = 2,
                            BuildVersionId = "100002"
                        },
                        { -- 10.0.5
                            Patch = 5,
                            BuildVersionId = "100005"
                        },
                        { -- 10.0.7
                            Patch = 7,
                            BuildVersionId = "100007"
                        },
                    }
                },
                { -- 10.1
                    Minor = 1,
                    Patches = {
                        { -- 10.1.0
                            Patch = 0,
                            BuildVersionId = "100100"
                        },
                        { -- 10.1.5
                            Patch = 5,
                            BuildVersionId = "100105"
                        },
                        { -- 10.1.7
                            Patch = 7,
                            BuildVersionId = "100107"
                        },
                    }
                },
                { -- 10.2
                    Minor = 2,
                    Patches = {
                        { -- 10.2.0
                            Patch = 0,
                            BuildVersionId = "100200"
                        },
                        { -- 10.2.5
                            Patch = 5,
                            BuildVersionId = "100205"
                        },
                        { -- 10.2.6
                            Patch = 6,
                            BuildVersionId = "100206"
                        },
                        { -- 10.2.7
                            Patch = 7,
                            BuildVersionId = "100207"
                        },
                    },
                },
            },
        },
        { -- 11
            Major = 11,
            Minors = {
                { -- 11.0
                    Minor = 0,
                    Patches = {
                        { -- 11.0.0
                            Patch = 0,
                            BuildVersionId = "110000"
                        },
                        { -- 11.0.2
                            Patch = 2,
                            BuildVersionId = "110002"
                        },
                        { -- 11.0.5
                            Patch = 5,
                            BuildVersionId = "110005"
                        },
                    },
                },
            },
        },
    };
end