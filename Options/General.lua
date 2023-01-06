-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;
options.General = {};
local general = options.General;
tinsert(options.OptionsTables, general);

local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
local AdjustedWidth = KrowiAF_InjectOptions.AdjustedWidth;

function general.RegisterOptionsTable()
    LibStub("AceConfig-3.0"):RegisterOptionsTable(addon.MetaData.Title, options.OptionsTable.args.General);
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(addon.MetaData.Title, addon.MetaData.Title, nil);
end

function general.PostLoad()
    local rebindMicroButton = LibStub("AceConfigRegistry-3.0"):GetOptionsTable(addon.MetaData.Title, "cmd", "KROWIAF-0.0").args.KeyBinding.args.General.args.MicroButton.args.Rebind;
    rebindMicroButton.desc = rebindMicroButton.desc:AddDefaultValueText("MicroButtonTab", addon.GUI.TabsOrderGetActiveKeys());

    options.SetMaxNumberOfSearchPreviews();
end

local function GeneralTutorialFunc()
    local menu = LibStub("Krowi_Menu-1.0");
    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    menu:Clear(); -- Reset menu

    menu:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
    for i, _ in next, pages do
        menu:AddFull({
            Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Colors.White, addon.Colors.RemoveColor(pages[i].SubTitle)),
            Func = function()
                if addon.IsWrathClassic or addon.IsShadowlandsRetail then
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

local function MinimapShowMinimapIconSet()
    addon.Options.db.ShowMinimapIcon = not addon.Options.db.ShowMinimapIcon;
    if addon.Options.db.ShowMinimapIcon then
        addon.Icon:Show("Krowi_AchievementFilterLDB");
    else
        addon.Icon:Hide("Krowi_AchievementFilterLDB");
    end
end

local function WorldMapShowWorldMapIconSet()
    addon.Options.db.ShowWorldmapIcon = not addon.Options.db.ShowWorldmapIcon;
    addon.GUI.WorldMapButton:Refresh();
    addon.WorldMapButtons.SetPoints();
end

local function MicroButtonSetKeybindFunc()
    local tab = SavedData.Tabs[addon.Options.db.MicroButtonTab];
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
    if addon.IsWrathClassic or addon.IsShadowlandsRetail then
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
                local criteriaString, criteriaType, _, _, _, _, flags, assetId, _, criteriaId, _ = GetAchievementCriteriaInfo(id, i);
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
                            name = (addon.L["Version"] .. ": "):SetColorYellow() .. addon.MetaData.Version,
                        },
                        Build = {
                            order = OrderPP(), type = "description", width = AdjustedWidth(), fontSize = "medium",
                            name = (addon.L["Build"] .. ": "):SetColorYellow() .. addon.MetaData.Build,
                        },
                        Tutorial = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = function() return (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Tutorial"]; end,
                            desc = addon.L["Tutorial Desc"],
                            func = GeneralTutorialFunc
                        },
                        Author = {
                            order = OrderPP(), type = "description", width = AdjustedWidth(2), fontSize = "medium",
                            name = (addon.L["Author"] .. ": "):SetColorYellow() .. addon.MetaData.Author,
                        },
                        Discord = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Discord"],
                            desc = addon.L["Discord Desc"]:ReplaceVars(addon.MetaData.DiscordServerName),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.MetaData.DiscordInviteLink); end
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
                            desc = addon.L["CurseForge Desc"]:InjectAddonName():ReplaceVars(addon.L["CurseForge"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.MetaData.CurseForge); end
                        },
                        Wago = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["Wago"],
                            desc = addon.L["Wago Desc"]:InjectAddonName():ReplaceVars(addon.L["Wago"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.MetaData.Wago); end
                        },
                        WoWInterface = {
                            order = OrderPP(), type = "execute", width = AdjustedWidth(),
                            name = addon.L["WoWInterface"],
                            desc = addon.L["WoWInterface Desc"]:InjectAddonName():ReplaceVars(addon.L["WoWInterface"]),
                            func = function() LibStub("Krowi_PopopDialog-1.0").ShowExternalLink(addon.MetaData.WoWInterface); end
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
                            desc = addon.L["Show minimap icon Desc"]:AddDefaultValueText("ShowMinimapIcon"),
                            get = function() return addon.Options.db.ShowMinimapIcon; end,
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
                            desc = addon.L["Show world map icon Desc"]:AddDefaultValueText("ShowWorldmapIcon"),
                            get = function() return addon.Options.db.ShowWorldmapIcon; end,
                            set = WorldMapShowWorldMapIconSet
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
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                                    name = addon.L["Reset view on open"],
                                    desc = addon.L["Reset view on open Desc"]:AddDefaultValueText("ResetViewOnOpen"),
                                    get = function() return addon.Options.db.ResetViewOnOpen; end,
                                    set = function() addon.Options.db.ResetViewOnOpen = not addon.Options.db.ResetViewOnOpen; end
                                },
                                ToggleWindow = {
                                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.45),
                                    name = addon.L["Toggle window once opened"],
                                    desc = addon.L["Toggle window once opened Desc"]:AddDefaultValueText("ToggleWindow"),
                                    get = function() return addon.Options.db.ToggleWindow; end,
                                    set = function() addon.Options.db.ToggleWindow = not addon.Options.db.ToggleWindow; end,
                                    disabled = function() return addon.Options.db.ResetViewOnOpen; end
                                }
                            }
                        },
                        MicroButton = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Micro Button"],
                            args = {
                                Rebind = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(1.95),
                                    name = addon.L["Rebind Micro Button"],
                                    desc = addon.L["Rebind Micro Button Desc"], -- AddDefaultValueTextFromValues via PostLoad
                                    values = function() return addon.GUI.TabsOrderGetActiveKeys(); end,
                                    get = function() return addon.Options.db.MicroButtonTab; end,
                                    set = function(_, value)
                                        addon.Options.db.MicroButtonTab = value;
                                        addon.ChangeAchievementMicroButtonOnClick();
                                    end
                                },
                                SetKeybind = {
                                    order = OrderPP(), type = "execute", width = AdjustedWidth(0.95),
                                    name = addon.L["Set Keybind"],
                                    desc = addon.L["Set Keybind Desc"]:ReplaceVars(addon.L["Key Bindings"]),
                                    func = MicroButtonSetKeybindFunc
                                }
                            }
                        },
                        Modifiers = {
                            order = OrderPP(), type = "group", inline = true,
                            name = addon.L["Modifiers"],
                            args = {
                                PasteToChat = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
                                    name = addon.L["Paste to Chat"],
                                    desc = addon.L["Paste to Chat"]:AddDefaultValueText("Achievements.Modifiers.PasteToChat", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.Achievements.Modifiers.PasteToChat; end,
                                    set = function(_, value) addon.Options.db.Achievements.Modifiers.PasteToChat = value; end
                                },
                                ToggleTracking = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
                                    name = addon.L["Toggle Tracking"],
                                    desc = addon.L["Toggle Tracking"]:AddDefaultValueText("Achievements.Modifiers.ToggleTracking", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.Achievements.Modifiers.ToggleTracking; end,
                                    set = function(_, value) addon.Options.db.Achievements.Modifiers.ToggleTracking = value; end
                                },
                                ToggleWatchList = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
                                    name = addon.L["Add to / Remove from Watch List"]:ReplaceVars(addon.L["Watch List"]),
                                    desc = addon.L["Add to / Remove from Watch List"]:ReplaceVars(addon.L["Watch List"]):AddDefaultValueText("Achievements.Modifiers.ToggleWatchList", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.Achievements.Modifiers.ToggleWatchList; end,
                                    set = function(_, value) addon.Options.db.Achievements.Modifiers.ToggleWatchList = value; end
                                },
                                ToggleExcluded = {
                                    order = OrderPP(), type = "select", width = AdjustedWidth(0.95),
                                    name = addon.L["Include"] .. " / " .. addon.L["Exclude"],
                                    desc = addon.L["Include"] .. " / " .. addon.L["Exclude"]:AddDefaultValueText("Achievements.Modifiers.ToggleExcluded", addon.Modifiers),
                                    values = addon.Modifiers,
                                    get = function() return addon.Options.db.Achievements.Modifiers.ToggleExcluded; end,
                                    set = function(_, value) addon.Options.db.Achievements.Modifiers.ToggleExcluded = value; end
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
                                    name = addon.L["Open"] .. " " .. addon.L["Current Zone"] .. " "  .. addon.L["Category"]
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
        Search = {
            order = OrderPP(), type = "group",
            name = addon.L["Search"],
            args = {
                SearchField = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Search field"],
                    args = {
                        ClearOnRightClick = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Clear search field on Right Click"],
                            desc = addon.L["Clear search field on Right Click Desc"]:AddDefaultValueText("SearchBox.ClearOnRightClick"),
                            get = function() return addon.Options.db.SearchBox.ClearOnRightClick; end,
                            set = function() addon.Options.db.SearchBox.ClearOnRightClick = not addon.Options.db.SearchBox.ClearOnRightClick; end
                        },
                        ExcludeExcluded = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Exclude Excluded achievements"],
                            desc = addon.L["Exclude Excluded achievements Desc"]:AddDefaultValueText("SearchBox.ExcludeExcluded"),
                            get = function() return addon.Options.db.SearchBox.ExcludeExcluded; end,
                            set = function() addon.Options.db.SearchBox.ExcludeExcluded = not addon.Options.db.SearchBox.ExcludeExcluded; end
                        },
                        OnlySearchFiltered = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Only search filtered achievements"],
                            desc = addon.L["Only search filtered achievements Desc"]:AddDefaultValueText("SearchBox.OnlySearchFiltered"),
                            get = function() return addon.Options.db.SearchBox.OnlySearchFiltered; end,
                            set = function()
                                addon.Options.db.SearchBox.OnlySearchFiltered = not addon.Options.db.SearchBox.OnlySearchFiltered;
                            end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        MinimumCharactersToSearch = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Minimum characters to search"],
                            desc = addon.L["Minimum characters to search Desc"]:AddDefaultValueText("SearchBox.MinimumCharactersToSearch"),
                            min = 1, max = 10, step = 1,
                            get = function() return addon.Options.db.SearchBox.MinimumCharactersToSearch; end,
                            set = function(_, value) addon.Options.db.SearchBox.MinimumCharactersToSearch = value; end
                        }
                    }
                },
                SearchPreview = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Search preview"],
                    args = {
                        NumberOfSearchPreviews = {
                            order = OrderPP(), type = "range", width = AdjustedWidth(1.5),
                            name = addon.L["Number of search previews"],
                            desc = addon.L["Number of search previews Desc"]:AddDefaultValueText("SearchBox.NumberOfSearchPreviews"):AddReloadRequired(),
                            min = 1, max = 1000, step = 1, -- max set via PostLoad
                            get = function() return addon.Options.db.SearchBox.NumberOfSearchPreviews; end,
                            set = function(_, value) addon.Options.db.SearchBox.NumberOfSearchPreviews = value; end
                        },
                        Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                        ShowAllResultsInCategory = {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                            name = addon.L["Show All Results in Category"],
                            desc = addon.L["Show All Results in Category Desc"]:AddDefaultValueText("SearchBox.ShowAllResultsInCategory"),
                            get = function() return addon.Options.db.SearchBox.ShowAllResultsInCategory; end,
                            set = function() addon.Options.db.SearchBox.ShowAllResultsInCategory = not addon.Options.db.SearchBox.ShowAllResultsInCategory; end
                        },
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
                            desc = addon.L["Reset Faction Filters Desc"]:ReplaceVars{
                                neutral = addon.L["Neutral"],
                                alliance = addon.L["Alliance"],
                                horde = addon.L["Horde"]
                            }:AddDefaultValueText("Filters.ResetFactionFilters"),
                            get = function() return addon.Options.db.Filters.ResetFactionFilters; end,
                            set = function() addon.Options.db.Filters.ResetFactionFilters = not addon.Options.db.Filters.ResetFactionFilters; end
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
                            desc = addon.L["Enable debug info Desc"]:AddDefaultValueText("EnableDebugInfo"),
                            get = function() return addon.Options.db.EnableDebugInfo; end,
                            set = function() addon.Options.db.EnableDebugInfo = not addon.Options.db.EnableDebugInfo; end
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
                            desc = addon.L["Enable trace info Desc"]:AddDefaultValueText("EnableTraceInfo"),
                            get = function() return addon.Options.db.EnableTraceInfo; end,
                            set = function() addon.Options.db.EnableTraceInfo = not addon.Options.db.EnableTraceInfo; end
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
                            desc = addon.L["Show placeholders filter Desc"]:AddDefaultValueText("ShowPlaceholdersFilter"),
                            get = function() return addon.Options.db.ShowPlaceholdersFilter; end,
                            set = function() addon.Options.db.ShowPlaceholdersFilter = not addon.Options.db.ShowPlaceholdersFilter; end
                        }
                    }
                }
            }
        }
    }
};