-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

local timeDisplaysLine1 = {
    addon.L["Start Time"],
    addon.L["End Time"],
    addon.L["Time Left"]
};

local timeDisplaysLine2 = {
    addon.L["None"],
    addon.L["Start Time"],
    addon.L["End Time"],
    addon.L["Time Left"]
};

local startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues = {}, {};

local function AddFormat(formats, values, format)
    tinsert(formats, format);
    tinsert(values, date(format, time()));
end

local function AddStartTimeAndEndTimeFormat(format)
    AddFormat(startTimeAndEndTimeDateTimeFormats, startTimeAndEndTimeDateTimeValues, format);
end

AddStartTimeAndEndTimeFormat(options.Defaults.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime);
AddStartTimeAndEndTimeFormat("%d/%m/%Y %I:%M %p");
AddStartTimeAndEndTimeFormat("%m/%d/%Y %R");
AddStartTimeAndEndTimeFormat("%m/%d/%Y %I:%M %p");
AddStartTimeAndEndTimeFormat("%Y/%m/%d %R");
AddStartTimeAndEndTimeFormat("%Y/%m/%d %I:%M %p");
AddStartTimeAndEndTimeFormat("%c");
tinsert(startTimeAndEndTimeDateTimeValues, "Custom");
tinsert(startTimeAndEndTimeDateTimeFormats, "%m/%d/%y %R");

local function SetLine1(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line1 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line1 = value;
    for _, sideButton in next, addon.GUI.SideButtons do
        sideButton:UpdateEventRuntime();
    end
    options.Debug(addon.L["Line"] .. " 1", addon.Options.db.EventReminders.TimeDisplay.Line1);
end

local function SetLine2(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line2 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line2 = value;
    for _, sideButton in next, addon.GUI.SideButtons do
        sideButton:UpdateEventRuntime();
    end
    options.Debug(addon.L["Line"] .. " 2", addon.Options.db.EventReminders.TimeDisplay.Line2);
end

local function GetStartTimeAndEndTimePresets()
    for i, format in next, startTimeAndEndTimeDateTimeFormats do
        if format == addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime then
            return i;
        end
    end
    return #startTimeAndEndTimeDateTimeFormats;
end

local function SetStartTimeAndEndTimePresets(_, value)
    local custom = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Event Reminders"], "cmd", "KROWIAF-0.0").args.DateTimeFormat.args.StartTimeAndEndTime.args.StartTimeAndEndTimeCustom; -- cmd and KROWIAF-0.0 are just to make the function work
    custom.set(nil, startTimeAndEndTimeDateTimeFormats[value]);
    options.Debug(addon.L["Presets"], addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime);
end

local function SetStartTimeAndEndTimeCustom(_, value)
    if addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime == value then return; end;
    addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime = value;
    for _, sideButton in next, addon.GUI.SideButtons do
        sideButton:UpdateEventRuntime();
    end
    options.Debug(addon.L["Custom"], addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime);
end

options.OptionsTable.args["EventReminders"] = {
    type = "group",
    childGroups = "tab",
    name = addon.L["Event Reminders"],
    args = {
        General = {
            order = 1, type = "group",
            name = addon.L["General"],
            args = {
                PopUps = {
                    order = 1, type = "group",
                    name = addon.L["Pop ups"],
                    inline = true,
                    args = {
                        ShowPopUps = {
                            order = 1.1, type = "toggle", width = 1.5,
                            name = addon.L["Show pop ups"],
                            desc = addon.L["Show pop ups Desc"],
                            get = function() return addon.Options.db.EventReminders.ShowPopUps; end,
                            set = function(_, value)
                                addon.Options.db.EventReminders.ShowPopUps = value;
                                options.Debug(addon.L["Show pop ups"], addon.Options.db.EventReminders.ShowPopUps);
                            end
                        },
                        Blank12 = {order = 1.2, type = "description", width = 1.5, name = ""},
                        MaxAlerts = {
                            order = 2.1, type = "range", width = 1.5,
                            name = addon.L["Max number of alerts"],
                            desc = addon.L["Max number of alerts Desc"],
                            min = 1, max = 100, step = 1,
                            get = function() return addon.Options.db.EventReminders.MaxAlerts; end,
                            set = function(_, value)
                                if addon.Options.db.EventReminders.MaxAlerts == value then return; end
                                addon.Options.db.EventReminders.MaxAlerts = value;
                                options.Debug(addon.L["Max number of alerts"], addon.Options.db.EventReminders.MaxAlerts);
                            end
                        },
                        FadeDelay = {
                            order = 2.2, type = "range", width = 1.5,
                            name = addon.L["Fade delay"],
                            desc = addon.L["Fade delay Desc"],
                            min = 1, max = 120, step = 1,
                            get = function() return addon.Options.db.EventReminders.FadeDelay; end,
                            set = function(_, value)
                                if addon.Options.db.EventReminders.FadeDelay == value then return; end
                                addon.Options.db.EventReminders.FadeDelay = value;
                                options.Debug(addon.L["Fade delay"], addon.Options.db.EventReminders.FadeDelay);
                            end
                        }
                    }
                },
                Style = {
                    order = 2, type = "group",
                    name = addon.L["Style"],
                    inline = true,
                    args = {
                        Compact = {
                            order = 1.1, type = "toggle", width = 1.5,
                            name = addon.L["Compact"],
                            desc = addon.ReplaceVarsWithReloadReq(addon.L["Compact Desc"]),
                            get = function() return addon.Options.db.EventReminders.Compact; end,
                            set = function(_, value)
                                addon.Options.db.EventReminders.Compact = value;
                                options.Debug(addon.L["Compact"], addon.Options.db.EventReminders.Compact);
                            end
                        },
                        Blank12 = {order = 1.2, type = "description", width = 1.5, name = ""},
                    }
                },
                TimeDisplay = {
                    order = 3, type = "group",
                    name = addon.L["Time display"],
                    inline = true,
                    args = {
                        Line1 = {
                            order = 1.1, type = "select", width = 1.5,
                            name = addon.L["Line"] .. " 1",
                            values = timeDisplaysLine1,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line1; end,
                            set = SetLine1
                        },
                        Line2 = {
                            order = 1.2, type = "select", width = 1.5,
                            name = addon.L["Line"] .. " 2",
                            values = timeDisplaysLine2,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line2; end,
                            set = SetLine2,
                            disabled = function() return addon.Options.db.EventReminders.Compact; end
                        }
                    }
                }
            }
        },
        -- Events = {
        --     order = 2, type = "group",
        --     name = addon.L["Events"],
        --     args = {
        --         -- Automatically generated
        --     }
        -- },
        DateTimeFormat = {
            order = 5, type = "group",
            name = addon.L["Date and Time format"],
            args = {
                StartTimeAndEndTime = {
                    order = 1, type = "group",
                    name = addon.L["Start Time"] .. " & " .. addon.L["End Time"],
                    inline = true,
                    args = {
                        StartTimeAndEndTimePresets = {
                            order = 1.1, type = "select", width = 1.5,
                            name = addon.L["Presets"],
                            values = startTimeAndEndTimeDateTimeValues,
                            get = GetStartTimeAndEndTimePresets,
                            set = SetStartTimeAndEndTimePresets
                        },
                        StartTimeAndEndTimeCustom = {
                            order = 1.2, type = "input", width = 1.5,
                            name = addon.L["Custom"],
                            get = function() return addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime; end,
                            set = SetStartTimeAndEndTimeCustom
                        }
                    }
                },
                DateTimeFormattingGuideLine = {
                    order = 2, type = "group",
                    name = addon.L["Date and Time formatting guide"],
                    inline = true,
                    args = {
                        DateTimeFormattingGuide = {
                            order = 1, type = "description",
                            name = addon.Util.ReplaceVars
                            {
                                addon.L["Date and Time formatting guide Desc"],
                                a = string.format(addon.Colors.Yellow, "%a"),
                                A = string.format(addon.Colors.Yellow, "%A"),
                                b = string.format(addon.Colors.Yellow, "%b"),
                                B = string.format(addon.Colors.Yellow, "%B"),
                                c = string.format(addon.Colors.Yellow, "%c"),
                                C = string.format(addon.Colors.Yellow, "%C"),
                                d = string.format(addon.Colors.Yellow, "%d"),
                                D = string.format(addon.Colors.Yellow, "%D"),
                                e = string.format(addon.Colors.Yellow, "%e"),
                                H = string.format(addon.Colors.Yellow, "%H"),
                                I = string.format(addon.Colors.Yellow, "%I"),
                                j = string.format(addon.Colors.Yellow, "%j"),
                                k = string.format(addon.Colors.Yellow, "%k"),
                                l = string.format(addon.Colors.Yellow, "%l"),
                                m = string.format(addon.Colors.Yellow, "%m"),
                                M = string.format(addon.Colors.Yellow, "%M"),
                                p = string.format(addon.Colors.Yellow, "%p"),
                                P = string.format(addon.Colors.Yellow, "%P"),
                                R = string.format(addon.Colors.Yellow, "%R"),
                                s = string.format(addon.Colors.Yellow, "%s"),
                                S = string.format(addon.Colors.Yellow, "%S"),
                                u = string.format(addon.Colors.Yellow, "%u"),
                                U = string.format(addon.Colors.Yellow, "%U"),
                                w = string.format(addon.Colors.Yellow, "%w"),
                                W = string.format(addon.Colors.Yellow, "%W"),
                                x = string.format(addon.Colors.Yellow, "%x"),
                                X = string.format(addon.Colors.Yellow, "%X"),
                                y = string.format(addon.Colors.Yellow, "%y"),
                                Y = string.format(addon.Colors.Yellow, "%Y"),
                                z = string.format(addon.Colors.Yellow, "%z"),
                                Z = string.format(addon.Colors.Yellow, "%Z")
                            }
                        }
                    }
                }
            }
        }
    }
};