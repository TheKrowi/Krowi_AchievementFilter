-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.General = {};
local general = options.General;
tinsert(options.OptionsTables, general);

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = addon.InjectOptions.AdjustedWidth;

function general.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.Metadata.Title, options.OptionsTable.args.General);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.Metadata.Title, addon.Metadata.Title, nil);
end

local openCurrentZoneCategoryName;
function general.PostLoad()
    local rebindMicroButton = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.Metadata.Title, "cmd", "KROWIAF-0.0").args.KeyBinding.args.General.args.MicroButton.args.Rebind;
    rebindMicroButton.desc = rebindMicroButton.desc:KAF_AddDefaultValueText("MicroButtonTab", addon.Gui:TabsOrderGetActiveKeys());

    openCurrentZoneCategoryName = addon.L["Open"] .. " " .. addon.L["Current Zone"] .. " "  .. addon.L["Category"];
    _G["BINDING_NAME_" .. "KrowiAF_OPEN_CAT_Current_Zone"] = openCurrentZoneCategoryName;
end

local RefreshOptions; -- Assigned at the end of the file
function general.OnProfileChanged(db, newProfile)
    RefreshOptions();
end

function general.OnProfileCopied(db, sourceProfile)
    RefreshOptions();
end

function general.OnProfileReset(db)
    RefreshOptions();
end

local function GeneralTutorialFunc()
    local menu = LibStub("Krowi_Menu-1.0");
    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    menu:Clear(); -- Reset menu

    menu:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
    for i, _ in next, pages do
        menu:AddFull({
            Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Util.Colors.White, addon.Util.Colors.RemoveColor(pages[i].SubTitle)),
            Func = function()
                if addon.IsWrathClassic then
                    InterfaceOptionsFrame:Hide();
                else
                    SettingsPanel:Close();
                end
                addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
            end
        });
    end

    menu:Open();
end

local function MinimapShowMinimapIconSet(_, value)
    if addon.Options.db.profile.ShowMinimapIcon == value then return; end
    addon.Options.db.profile.ShowMinimapIcon = value;
    if addon.Options.db.profile.ShowMinimapIcon then
        addon.Icon:Show();
    else
        addon.Icon:Hide();
    end
end

local function WorldMapShowWorldMapIconSet(_, value)
    if addon.Options.db.profile.ShowWorldmapIcon == value then return; end
    addon.Options.db.profile.ShowWorldmapIcon = value;
    addon.Gui.WorldMapButton:Refresh();
    LibStub("Krowi_WorldMapButtons-1.4").SetPoints();
end

local function MicroButtonSetKeybindFunc()
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab];
    if tab.BindingName then
        SetBinding("Y", tab.BindingName);
        SaveBindings(GetCurrentBindingSet());
    end
end

local function SetBindingKeybind(value, command, index)
	local key = select(index, GetBindingKey(command));
	if key then
		SetBinding(key);
	end
	SetBinding(value, command, index);
	SaveBindings(GetCurrentBindingSet());
end

local screenshotModeFrame, screenshotModeCloseButton;
local function HandleScreenshotMode()
    if addon.IsWrathClassic then
        InterfaceOptionsFrame:Hide();
    else
        SettingsPanel:Close(); -- Causes "blocked from an action" message
    end
    if screenshotModeFrame == nil then
        screenshotModeFrame = CreateFrame("Frame", nil, UIParent);
        screenshotModeFrame:SetPoint("CENTER");
        screenshotModeFrame:SetAllPoints();

        screenshotModeFrame.tex = screenshotModeFrame:CreateTexture();
        screenshotModeFrame.tex:SetAllPoints();
        screenshotModeFrame.tex:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/Black");
        screenshotModeFrame.tex:SetTexCoord(0, 0.390625, 0, 0.78125);
        screenshotModeCloseButton = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate");
        screenshotModeCloseButton:SetPoint("TOPRIGHT");
        screenshotModeCloseButton:SetSize(200, 22);
        screenshotModeCloseButton:SetText("Close Screenshot Mode");
        screenshotModeCloseButton:SetScript("OnClick", function(self)
            screenshotModeFrame:Hide();
            self:Hide();
        end);
        screenshotModeCloseButton:Show();
    else
        screenshotModeFrame:Show();
        screenshotModeCloseButton:Show();
    end
end

local function ExportCriteria()
    local criteriaCache = {};
    for _, id in next, addon.Data.AchievementIds do
        local numCriteria = GetAchievementNumCriteria(id);
        if numCriteria > 0 then
            for i = 1, numCriteria do
                local criteriaString, criteriaType, _, _, _, _, flags, assetId, _, criteriaId, _ = addon.GetAchievementCriteriaInfo(id, i);
                tinsert(criteriaCache, {
                    AchievementId = id,
                    CriteriaIndex = i,
                    CriteriaString = criteriaString,
                    CriteriaType = criteriaType,
                    Flags = flags,
                    AssetId = assetId,
                    CriteriaId = criteriaId
                });
            end
        end
    end
    DebugTable = criteriaCache;
end

local function PrintMapInfoWithoutReload()
    if addon.Diagnostics.DebugEnabled() then
        return;
    end

    hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
        local mapID = WorldMapFrame.mapID;
        print(mapID, addon.GetMapName(mapID));
    end);

    addon.Options.db.profile.PrintMapInfo = true;
end

options.OptionsTable.args["General"] = {
    type = "group", childGroups = "tab",
    name = addon.L["General"],
    args = {
        Info = {
            order = OrderPP(), type = "group",
            name = addon.L["Info"],
            args = {
                General = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["General"],
                    args = {
                        Version = {
                            order = OrderPP(), type = "description", width = AdjustedWidth(), fontSize = "medium",
                            name = (addon.L["Version"] .. ": "):SetColorYellow() .. addon.Metadata.Version,
                        },
                        Build = {
                            order = OrderPP(), type = "description", width = AdjustedWidth(), fontSize = "medium",
                            name = (addon.L["Build"] .. ": "):SetColorYellow() .. addon.Metadata.Build,
                        },
                        Tutorial = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = function() return (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Tutorial"]; end,
                            desc = addon.L["Tutorial Desc"],
                            func = GeneralTutorialFunc
                        },
                        Author = {
                            order = OrderPP(), type = "description", width = AdjustedWidth(2), fontSize = "medium",
                            name = (addon.L["Author"] .. ": "):SetColorYellow() .. addon.Metadata.Author,
                        },
                        Discord = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Discord"],
                            desc = addon.L["Discord Desc"]:K_ReplaceVars(addon.Metadata.DiscordServerName),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.Metadata.DiscordInviteLink); end
                        }
                    }
                },
                Sources = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Sources"],
                    args = {
                        CurseForge = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["CurseForge"],
                            desc = addon.L["CurseForge Desc"]:KAF_InjectAddonName():K_ReplaceVars(addon.L["CurseForge"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.Metadata.CurseForge); end
                        },
                        Wago = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Wago"],
                            desc = addon.L["Wago Desc"]:KAF_InjectAddonName():K_ReplaceVars(addon.L["Wago"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.Metadata.Wago); end
                        },
                        WoWInterface = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["WoWInterface"],
                            desc = addon.L["WoWInterface Desc"]:KAF_InjectAddonName():K_ReplaceVars(addon.L["WoWInterface"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.Metadata.WoWInterface); end
                        }
                    }
                }
            }
        },
        Icon = {
            order = OrderPP(), type = "group",
            name = addon.L["Icon"],
            args = {
                Minimap = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Minimap"],
                    args = {
                        ShowMinimapIcon = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Show minimap icon"],
                            desc = addon.L["Show minimap icon Desc"]:KAF_AddDefaultValueText("ShowMinimapIcon"),
                            get = function() return addon.Options.db.profile.ShowMinimapIcon; end,
                            set = MinimapShowMinimapIconSet
                        }
                    }
                },
                WorldMap = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["World Map"],
                    args = {
                        ShowWorldMapIcon = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Show world map icon"],
                            desc = addon.L["Show world map icon Desc"]:KAF_AddDefaultValueText("ShowWorldmapIcon"),
                            get = function() return addon.Options.db.profile.ShowWorldmapIcon; end,
                            set = WorldMapShowWorldMapIconSet
                        },
                        -- Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        AddAddonNameToWorldMapIcon = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Add addon name to world map icon"],
                            desc = addon.L["Add addon name to world map icon Desc"]:KAF_InjectAddonName():KAF_AddDefaultValueText("AddAddonNameToWorldMapIcon"),
                            get = function() return addon.Options.db.profile.AddAddonNameToWorldMapIcon; end,
                            set = function(_, value) addon.Options.db.profile.AddAddonNameToWorldMapIcon = value; end
                        }
                    }
                }
            }
        },
        KeyBinding = {
            order = OrderPP(), type = "group", childGroups = "tab",
            name = addon.L["Key Binding"],
            args = {
                General = {
                    order = OrderPP(), type = "group",
                    name = addon.L["General"],
                    args = {
                        ResetView = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Reset view"],
                            args = {
                                ResetViewOnOpen = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Reset view on open"],
                                    desc = addon.L["Reset view on open Desc"]:KAF_AddDefaultValueText("ResetViewOnOpen"),
                                    get = function() return addon.Options.db.profile.ResetViewOnOpen; end,
                                    set = function(_, value) addon.Options.db.profile.ResetViewOnOpen = value; end
                                },
                                ToggleWindow = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                                    name = addon.L["Toggle window once opened"],
                                    desc = addon.L["Toggle window once opened Desc"]:KAF_AddDefaultValueText("ToggleWindow"),
                                    get = function() return addon.Options.db.profile.ToggleWindow; end,
                                    set = function(_, value) addon.Options.db.profile.ToggleWindow = value; end,
                                    disabled = function() return addon.Options.db.profile.ResetViewOnOpen; end
                                }
                            }
                        },
                        MicroButton = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Micro Button"],
                            args = {
                                Rebind = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(1.9),
                                    name = addon.L["Rebind Micro Button"],
                                    desc = addon.L["Rebind Micro Button Desc"], -- KAF_AddDefaultValueTextFromValues via PostLoad
                                    values = function() return addon.Gui:TabsOrderGetActiveKeys(); end,
                                    get = function() return addon.Options.db.profile.MicroButtonTab; end,
                                    set = function(_, value)
                                        addon.Options.db.profile.MicroButtonTab = value;
                                        addon.ChangeAchievementMicroButtonOnClick();
                                    end
                                },
                                SetKeybind = {
                                    order = OrderPP(), type = "execute", width = AdjustedWidth(0.9),
                                    name = addon.L["Set Keybind"],
                                    desc = addon.L["Set Keybind Desc"]:K_ReplaceVars(addon.L["Key Bindings"]),
                                    func = MicroButtonSetKeybindFunc
                                }
                            }
                        },
                        Modifiers = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Modifiers"],
                            args = {
                                PasteToChat = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                                    name = addon.L["Paste to Chat"],
                                    desc = addon.L["Paste to Chat"]:KAF_AddDefaultValueText("Achievements.Modifiers.PasteToChat", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.profile.Achievements.Modifiers.PasteToChat; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Modifiers.PasteToChat = value; end
                                },
                                ToggleTracking = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                                    name = addon.L["Toggle Tracking"],
                                    desc = addon.L["Toggle Tracking"]:KAF_AddDefaultValueText("Achievements.Modifiers.ToggleTracking", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.profile.Achievements.Modifiers.ToggleTracking; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Modifiers.ToggleTracking = value; end
                                },
                                ToggleWatchList = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                                    name = addon.L["Add to / Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
                                    desc = addon.L["Add to / Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("Achievements.Modifiers.ToggleWatchList", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.profile.Achievements.Modifiers.ToggleWatchList; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Modifiers.ToggleWatchList = value; end
                                },
                                ToggleExcluded = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                                    name = addon.L["Include"] .. " / " .. addon.L["Exclude"],
                                    desc = addon.L["Include"] .. " / " .. addon.L["Exclude"]:KAF_AddDefaultValueText("Achievements.Modifiers.ToggleExcluded", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.profile.Achievements.Modifiers.ToggleExcluded; end,
                                    set = function(_, value) addon.Options.db.profile.Achievements.Modifiers.ToggleExcluded = value; end
                                }
                            }
                        }
                    }
                },
                Keybindings = {
                    order = OrderPP(), type = "group",
                    name = addon.L["Keybindings"],
                    args = {
                        Tabs = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Tabs"],
                            args = { --[[ Dynamically build via KrowiAF_RegisterTabOptions ]] }
                        },
                        Custom = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Custom"],
                            args = {
                                OpenCurrentZoneCategoryName = {
                                    order = OrderPP(), type = "description", width = AdjustedWidth(0.93),
                                    name = function() return openCurrentZoneCategoryName; end
                                },
                                OpenCurrentZoneCategoryKey1 = {
                                    order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
                                    name = "", desc = "",
                                    get = function() return GetBindingKey("KrowiAF_OPEN_CAT_Current_Zone"); end,
                                    set = function(_, value) SetBindingKeybind(value, "KrowiAF_OPEN_CAT_Current_Zone", 1); end
                                },
                                OpenCurrentZoneCategoryKey2 = {
                                    order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
                                    name = "", desc = "",
                                    get = function() return select(2, GetBindingKey("KrowiAF_OPEN_CAT_Current_Zone")); end,
                                    set = function(_, value) SetBindingKeybind(value, "KrowiAF_OPEN_CAT_Current_Zone", 2); end
                                }
                            }
                        }
                    }
                }
            }
        },
        Filters = {
            order = OrderPP(), type = "group",
            name = addon.L["Filters"],
            args = {
                ResetFilters = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Reset filters"],
                    args = {
                        ResetFactionFilter = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Reset Faction Filters"],
                            desc = addon.L["Reset Faction Filters Desc"]:K_ReplaceVars{
                                neutral = addon.L["Neutral"],
                                alliance = addon.L["Alliance"],
                                horde = addon.L["Horde"]
                            }:KAF_AddDefaultValueText("Filters.ResetFactionFilters"),
                            get = function() return addon.Options.db.profile.Filters.ResetFactionFilters; end,
                            set = function(_, value) addon.Options.db.profile.Filters.ResetFactionFilters = value; end
                        }
                    }
                }
            }
        },
        Debug = {
            order = OrderPP(), type = "group",
            name = addon.L["Debug"],
            args = {
                Debug = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Debug"],
                    args = {
                        Description = {
                            order = OrderPP(), type = "description", width = "full", fontSize = "medium",
                            name = addon.L["Debug Desc"],
                        },
                        EnableDebugInfo = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Enable debug info"],
                            desc = addon.L["Enable debug info Desc"]:KAF_AddDefaultValueText("EnableDebugInfo"),
                            get = function() return addon.Options.db.profile.EnableDebugInfo; end,
                            set = function(_, value) addon.Options.db.profile.EnableDebugInfo = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        ScreenshotMode = {
                            order = OrderPP(), type = "execute",
                            name = addon.L["Screenshot Mode"],
                            desc = addon.L["Screenshot Mode Desc"],
                            func = HandleScreenshotMode
                        },
                        EnableTraceInfo = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Enable trace info"],
                            desc = addon.L["Enable trace info Desc"]:KAF_AddDefaultValueText("EnableTraceInfo"),
                            get = function() return addon.Options.db.profile.EnableTraceInfo; end,
                            set = function(_, value) addon.Options.db.profile.EnableTraceInfo = value; end
                        },
                        Blank2 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        ExportCriteria = {
                            order = OrderPP(), type = "execute",
                            name = addon.L["Export Criteria"],
                            desc = addon.L["Export Criteria Desc"],
                            func = ExportCriteria
                        },
                        ShowPlaceholdersFilter = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Show placeholders filter"],
                            desc = addon.L["Show placeholders filter Desc"]:KAF_AddDefaultValueText("ShowPlaceholdersFilter"),
                            get = function() return addon.Options.db.profile.ShowPlaceholdersFilter; end,
                            set = function(_, value) addon.Options.db.profile.ShowPlaceholdersFilter = value; end
                        },
                        Blank3 = {order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""},
                        PrintMapInfo = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                            name = addon.L["Print map info"],
                            desc = addon.L["Print map info Desc"]:KAF_AddDefaultValueText("PrintMapInfo"),
                            get = function() return addon.Options.db.profile.PrintMapInfo; end,
                            set = function(_, value) addon.Options.db.profile.PrintMapInfo = value; end
                        },
                        Blank4 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                        PrintMapInfoWithoutReload = {
                            order = OrderPP(), type = "execute",
                            name = addon.L["Print map info w/o reload"],
                            desc = addon.L["Print map info w/o reload Desc"],
                            func = PrintMapInfoWithoutReload
                        }
                    }
                }
            }
        }
    }
};

function RefreshOptions()
    local profile = addon.Options.db.profile;
    MinimapShowMinimapIconSet(nil, profile.ShowMinimapIcon);
    WorldMapShowWorldMapIconSet(nil, profile.ShowWorldmapIcon);
    addon.ChangeAchievementMicroButtonOnClick();
end