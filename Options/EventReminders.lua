-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
local widthMultiplier = addon.Options.WidthMultiplier;

local timeDisplaysLine1 = {
    addon.L["End Time"],
    addon.L["Time Left"]
};

local timeDisplaysLine2 = {
    addon.L["None"],
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
AddStartTimeAndEndTimeFormat(addon.L["%d/%m/%Y %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %R"]);
AddStartTimeAndEndTimeFormat(addon.L["%m/%d/%Y %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %R"]);
AddStartTimeAndEndTimeFormat(addon.L["%Y/%m/%d %I:%M %p"]);
AddStartTimeAndEndTimeFormat(addon.L["%c"]);
tinsert(startTimeAndEndTimeDateTimeValues, "Custom");
tinsert(startTimeAndEndTimeDateTimeFormats, addon.L["%m/%d/%Y %R"]);

local function SetLine1(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line1 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line1 = value;
    addon.GUI.SideButtonSystem.Refresh();
    options.Debug(addon.L["Line"] .. " 1", addon.Options.db.EventReminders.TimeDisplay.Line1);
end

local function SetLine2(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line2 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line2 = value;
    addon.GUI.SideButtonSystem.Refresh();
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
    addon.GUI.SideButtonSystem.Refresh();
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
                        ShowPopUpsOnLogin = {
                            order = 1.1, type = "toggle", width = 1 * widthMultiplier,
                            name = addon.L["Show pop ups on login"],
                            desc = addon.L["Show pop ups on login Desc"],
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnLogin; end,
                            set = function(_, value)
                                addon.Options.db.EventReminders.ShowPopUps.OnLogin = value;
                                options.Debug(addon.L["Show pop ups on login"], addon.Options.db.EventReminders.ShowPopUps.OnLogin);
                            end
                        },
                        ShowPopUpsOnEventStart = {
                            order = 1.2, type = "toggle", width = 1 * widthMultiplier,
                            name = addon.L["Show pop ups on event start"],
                            desc = addon.L["Show pop ups on event start Desc"],
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnEventStart; end,
                            set = function(_, value)
                                addon.Options.db.EventReminders.ShowPopUps.OnEventStart = value;
                                options.Debug(addon.L["Show pop ups on event start"], addon.Options.db.EventReminders.ShowPopUps.OnEventStart);
                            end
                        },
                        Blank13 = {order = 1.3, type = "description", width = 1 * widthMultiplier, name = ""},
                        MaxAlerts = {
                            order = 2.1, type = "range", width = 1.5 * widthMultiplier,
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
                            order = 2.2, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Fade delay"],
                            desc = addon.L["Fade delay Desc"],
                            min = 1, max = 120, step = 1,
                            get = function() return addon.Options.db.EventReminders.FadeDelay; end,
                            set = function(_, value)
                                if addon.Options.db.EventReminders.FadeDelay == value then return; end
                                addon.Options.db.EventReminders.FadeDelay = value;
                                options.Debug(addon.L["Fade delay"], addon.Options.db.EventReminders.FadeDelay);
                            end
                        },
                        RefreshInterval = {
                            order = 3.1, type = "range", width = 1.5 * widthMultiplier,
                            name = addon.L["Refresh interval"],
                            desc = addon.L["Refresh interval Desc"],
                            min = 1, max = 3600, step = 1,
                            get = function() return addon.Options.db.EventReminders.RefreshInterval; end,
                            set = function(_, value)
                                if addon.Options.db.EventReminders.RefreshInterval == value then return; end
                                addon.Options.db.EventReminders.RefreshInterval = value;
                                options.Debug(addon.L["Refresh interval"], addon.Options.db.EventReminders.RefreshInterval);
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
                            order = 1.1, type = "toggle", width = 1 * widthMultiplier,
                            name = addon.L["Compact"],
                            desc = addon.ReplaceVarsWithReloadReq(addon.L["Compact Desc"]),
                            get = function() return addon.Options.db.EventReminders.Compact; end,
                            set = function(_, value)
                                addon.Options.db.EventReminders.Compact = value;
                                options.Debug(addon.L["Compact"], addon.Options.db.EventReminders.Compact);
                            end
                        }
                    }
                },
                TimeDisplay = {
                    order = 3, type = "group",
                    name = addon.L["Time display"],
                    inline = true,
                    args = {
                        Line1 = {
                            order = 1.1, type = "select", width = 1.5 * widthMultiplier,
                            name = addon.L["Line"] .. " 1",
                            values = timeDisplaysLine1,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line1; end,
                            set = SetLine1
                        },
                        Line2 = {
                            order = 1.2, type = "select", width = 1.5 * widthMultiplier,
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
                            order = 1.1, type = "select", width = 1.5 * widthMultiplier,
                            name = addon.L["Presets"],
                            values = startTimeAndEndTimeDateTimeValues,
                            get = GetStartTimeAndEndTimePresets,
                            set = SetStartTimeAndEndTimePresets
                        },
                        StartTimeAndEndTimeCustom = {
                            order = 1.2, type = "input", width = 1.5 * widthMultiplier,
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