-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.EventReminders = {};
local eventReminders = options.EventReminders;
tinsert(options.OptionsTables, eventReminders);

local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = KrowiAF_InjectOptions.AdjustedWidth;

function eventReminders.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(options.OptionsTable.args.EventReminders.name, options.OptionsTable.args.EventReminders.name, addon.MetaData.Title);
end

function eventReminders.PostLoad()

end

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

local function TimeDisplayLine1Set(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line1 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line1 = value;
    addon.GUI.SideButtonSystem.Refresh();
end

local function TimeDisplayLine2Set(_, value)
    if addon.Options.db.EventReminders.TimeDisplay.Line2 == value then return; end;
    addon.Options.db.EventReminders.TimeDisplay.Line2 = value;
    addon.GUI.SideButtonSystem.Refresh();
end

local function StartTimeAndEndTimePresetsGet()
    for i, format in next, startTimeAndEndTimeDateTimeFormats do
        if format == addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime then
            return i;
        end
    end
    return #startTimeAndEndTimeDateTimeFormats;
end

local function StartTimeAndEndTimeCustomSet(_, value)
    if addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime == value then return; end;
    addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime = value;
    addon.GUI.SideButtonSystem.Refresh();
end

options.OptionsTable.args["EventReminders"] = {
    type = "group", childGroups = "tab",
    name = addon.L["Event Reminders"],
    args = {
        General = {
            order = OrderPP(), type = "group",
            name = addon.L["General"],
            args = {
                PopUps = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Pop ups"],
                    args = {
                        OnLoginReload = {
                            order = OrderPP(), type = "header",
                            name = addon.L["On Login / Reload"]
                        },
                        ShowPopUpsOnLogin = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show pop ups on login Desc"]:AddDefaultValueText("EventReminders.ShowPopUps.OnLogin"),
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnLogin; end,
                            set = function(_, value) addon.Options.db.EventReminders.ShowPopUps.OnLogin = value; end
                        },
                        ShowPopUpsOnLoginInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show pop ups on login in instances Desc"]:AddDefaultValueText("EventReminders.ShowPopUps.OnLoginInInstances"),
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnLoginInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.ShowPopUps.OnLoginInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.ShowPopUps.OnLogin end
                        },
                        ShowPopUpsOnLoginDelay = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Delay"],
                            desc = addon.L["Show pop ups on login delay Desc"]:AddDefaultValueText("EventReminders.ShowPopUps.OnLoginDelay"),
                            min = 1, max = 600, step = 1,
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnLoginDelay; end,
                            set = function(_, value) addon.Options.db.EventReminders.ShowPopUps.OnLoginDelay = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        OnEventStart = {
                            order = OrderPP(), type = "header",
                            name = addon.L["On Event Start"]
                        },
                        ShowPopUpsOnEventStart = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.7),
                            name = addon.L["Show"],
                            desc = addon.L["Show pop ups on event start Desc"]:AddDefaultValueText("EventReminders.ShowPopUps.OnEventStart"),
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnEventStart; end,
                            set = function(_, value) addon.Options.db.EventReminders.ShowPopUps.OnEventStart = value; end
                        },
                        ShowPopUpsOnEventStartInInstances = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(0.75),
                            name = addon.L["In instances"],
                            desc = addon.L["Show pop ups on event start in instances Desc"]:AddDefaultValueText("EventReminders.ShowPopUps.OnEventStartInInstances"),
                            get = function() return addon.Options.db.EventReminders.ShowPopUps.OnEventStartInInstances; end,
                            set = function(_, value) addon.Options.db.EventReminders.ShowPopUps.OnEventStartInInstances = value; end,
                            disabled = function() return not addon.Options.db.EventReminders.ShowPopUps.OnEventStart end
                        },
                        Blank2 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        Other = {
                            order = OrderPP(), type = "header",
                            name = addon.L["Other"]
                        },
                        MaxAlerts = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Max number of alerts"],
                            desc = addon.L["Max number of alerts Desc"]:AddDefaultValueText("EventReminders.MaxAlerts"),
                            min = 1, max = 100, step = 1,
                            get = function() return addon.Options.db.EventReminders.MaxAlerts; end,
                            set = function(_, value) addon.Options.db.EventReminders.MaxAlerts = value; end
                        },
                        FadeDelay = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Fade delay"],
                            desc = addon.L["Fade delay Desc"]:AddDefaultValueText("EventReminders.FadeDelay"),
                            min = 1, max = 120, step = 1,
                            get = function() return addon.Options.db.EventReminders.FadeDelay; end,
                            set = function(_, value) addon.Options.db.EventReminders.FadeDelay = value; end
                        },
                        RefreshInterval = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.45),
                            name = addon.L["Refresh interval"],
                            desc = addon.L["Refresh interval Desc"]:AddDefaultValueText("EventReminders.RefreshInterval"),
                            min = 1, max = 3600, step = 1,
                            get = function() return addon.Options.db.EventReminders.RefreshInterval; end,
                            set = function(_, value) addon.Options.db.EventReminders.RefreshInterval = value; end
                        }
                    }
                },
                Style = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Style"],
                    args = {
                        Compact = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Compact"],
                            desc = addon.L["Compact Desc"]:AddDefaultValueText("EventReminders.Compact"):AddReloadRequired(),
                            get = function() return addon.Options.db.EventReminders.Compact; end,
                            set = function(_, value) addon.Options.db.EventReminders.Compact = value; end
                        }
                    }
                },
                TimeDisplay = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Time display"],
                    inline = true,
                    args = {
                        Line1 = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Line"] .. " 1",
                            desc = (""):AddDefaultValueText("EventReminders.TimeDisplay.Line1", timeDisplaysLine1),
                            values = timeDisplaysLine1,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line1; end,
                            set = TimeDisplayLine1Set
                        },
                        Line2 = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Line"] .. " 2",
                            desc = (""):AddDefaultValueText("EventReminders.TimeDisplay.Line2", timeDisplaysLine2),
                            values = timeDisplaysLine2,
                            get = function() return addon.Options.db.EventReminders.TimeDisplay.Line2; end,
                            set = TimeDisplayLine2Set,
                            disabled = function() return addon.Options.db.EventReminders.Compact; end
                        }
                    }
                }
            }
        },
        CalendarEvents = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["Calendar Events"],
            args = { --[[ Automatically generated ]] }
        },
        WorldEvents = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["World Events"],
            args = { --[[ Automatically generated ]] }
        },
        DateTimeFormat = {
            order = OrderPP(), type = "group",
            name = addon.L["Date and Time format"],
            args = {
                StartTimeAndEndTime = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Start Time"] .. " & " .. addon.L["End Time"],
                    args = {
                        Presets = {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.5),
                            name = addon.L["Presets"],
                            values = startTimeAndEndTimeDateTimeValues,
                            get = StartTimeAndEndTimePresetsGet,
                            set = function(_, value)
                                local custom = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.L["Event Reminders"], "cmd", "KROWIAF-0.0").args.DateTimeFormat.args.StartTimeAndEndTime.args.Custom;
                                custom.set(nil, startTimeAndEndTimeDateTimeFormats[value]);
                            end
                        },
                        Custom = {
                            order = OrderPP(), type = "input", width = AdjustedWidth(1.5),
                            name = addon.L["Custom"],
                            get = function() return addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime; end,
                            set = StartTimeAndEndTimeCustomSet
                        }
                    }
                },
                DateTimeFormattingGuideLine = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Date and Time formatting guide"],
                    args = {
                        DateTimeFormattingGuide = {
                            order = OrderPP(), type = "description",
                            name = addon.L["Date and Time formatting guide Desc"]:ReplaceVars {
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