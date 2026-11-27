-- [[ Namespaces ]] --
local _, addon = ...
local options = addon.Options
options.General = {}
local general = options.General
tinsert(options.OptionsTables, general)

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus
local AdjustedWidth = addon.InjectOptions.AdjustedWidth

function general.RegisterOptionsTable()
    options.Registry.Register(addon.Metadata.Title, options.OptionsTable.args.General)
end

local openCurrentZoneCategoryName
function general.PostLoad()
    local rebindMicroButton = options.Registry.Get(addon.Metadata.Title).args.KeyBinding.args.General.args.MicroButton.args.Rebind
    rebindMicroButton.desc = rebindMicroButton.desc:KAF_AddDefaultValueText("window.microButtonTab", addon.Gui:TabsOrderGetActiveKeys())

    openCurrentZoneCategoryName = addon.L["Open"] .. " " .. addon.L["Current Zone"] .. " "  .. addon.L["Category"]
    _G["BINDING_NAME_" .. "KrowiAF_OPEN_CAT_Current_Zone"] = openCurrentZoneCategoryName
end

local RefreshOptions -- Assigned at the end of the file
function general.OnProfileChanged(db, newProfile)
    RefreshOptions()
end

function general.OnProfileCopied(db, sourceProfile)
    RefreshOptions()
end

function general.OnProfileReset(db)
    RefreshOptions()
end

local function MinimapShowMinimapIconSet(_, value)
    if addon.Settings.Get("minimap.showIcon") == value then return; end
    addon.Settings.Set("minimap.showIcon", value)
    if addon.Settings.Get("minimap.showIcon") then
        addon.Icon:Show()
    else
        addon.Icon:Hide()
    end
end

local function WorldMapShowWorldMapIconSet(_, value)
    if addon.Settings.Get("worldMap.showIcon") == value then return; end
    addon.Settings.Set("worldMap.showIcon", value)
    addon.Gui.WorldMapButton:Refresh()
    LibStub("Krowi_WorldMapButtons-1.4").SetPoints()
end

local function MicroButtonSetKeybindFunc()
    local tab = KrowiAF_SavedData.Tabs[addon.Settings.Get("window.microButtonTab")]
    if tab.BindingName then
        SetBinding("Y", tab.BindingName)
        SaveBindings(GetCurrentBindingSet())
    end
end

local screenshotModeFrame, screenshotModeCloseButton
local function HandleScreenshotMode()
    if screenshotModeFrame == nil then
        screenshotModeFrame = CreateFrame("Frame", nil, UIParent)
        screenshotModeFrame:SetPoint("CENTER")
        screenshotModeFrame:SetAllPoints()

        screenshotModeFrame.tex = screenshotModeFrame:CreateTexture()
        screenshotModeFrame.tex:SetAllPoints()
        screenshotModeFrame.tex:SetTexture("Interface/AddOns/Krowi_AchievementFilter/Media/Black")
        screenshotModeFrame.tex:SetTexCoord(0, 0.390625, 0, 0.78125)
        screenshotModeCloseButton = CreateFrame("Button", nil, UIParent, "UIPanelButtonTemplate")
        screenshotModeCloseButton:SetPoint("TOPRIGHT")
        screenshotModeCloseButton:SetSize(200, 22)
        screenshotModeCloseButton:SetText("Close Screenshot Mode")
        screenshotModeCloseButton:SetScript("OnClick", function(self)
            screenshotModeFrame:Hide()
            self:Hide()
        end)
        screenshotModeCloseButton:Show()
    else
        screenshotModeFrame:Show()
        screenshotModeCloseButton:Show()
    end
end

local function ExportCriteria()
    local criteriaCache = {}
    for _, id in next, addon.Data.AchievementIds do
        local numCriteria = GetAchievementNumCriteria(id)
        if numCriteria > 0 then
            for i = 1, numCriteria do
                local criteriaString, criteriaType, _, _, _, _, flags, assetId, _, criteriaId, _ = GetAchievementCriteriaInfo(id, i)
                tinsert(criteriaCache, {
                    AchievementId = id,
                    CriteriaIndex = i,
                    CriteriaString = criteriaString,
                    CriteriaType = criteriaType,
                    Flags = flags,
                    AssetId = assetId,
                    CriteriaId = criteriaId
                })
            end
        end
    end
    KrowiAF_ExportedCriteria = criteriaCache -- inspect in game with /dump KrowiAF_ExportedCriteria
end

local function ExportMissingAchievements()
    local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
	frame:Init(addon.L["Export Missing Achievements"])
    local numMissingAchievements = 0
    local exportString = "\r\n"
    for _, achievementId in next, addon.Data.AchievementIds do
        if addon.Data.Achievements[achievementId].Uncategorized then
            local achievementInfo = addon.GetAchievementInfoTable(achievementId)
            numMissingAchievements = numMissingAchievements + 1
            -- exportString = exportString .. "    { -- " .. achievementInfo.Name .. "\r\n";
            -- exportString = exportString .. "        " .. achievementInfo.Id .. "," .. "\r\n";
            local rewardText = tostring(achievementInfo.RewardText or ""):gsub("[\r\n]+", " ")
            local rewardSuffix = rewardText ~= "" and (" (" .. rewardText .. ")") or ""
            local rewardTypes = {}
            if rewardText:find("Title:", 1, true) then
                tinsert(rewardTypes, "rewardType.Title")
            end
            if rewardText:find("Mount:", 1, true) then
                tinsert(rewardTypes, "rewardType.Mount")
            end
            if rewardText:find("Pet:", 1, true) then
                tinsert(rewardTypes, "rewardType.Pet")
            end
            if rewardText:find("Toy:", 1, true) then
                tinsert(rewardTypes, "rewardType.Toy")
            end
            if rewardText:find("Tabard:", 1, true) then
                tinsert(rewardTypes, "rewardType.Tabard")
            end
            if rewardText:find("Teleport:", 1, true) then
                tinsert(rewardTypes, "rewardType.Teleport")
            end
            if rewardText:find("Transmog:", 1, true) then
                tinsert(rewardTypes, "rewardType.Transmog")
            end
            if rewardText:find("Trader's Tender:", 1, true) then
                tinsert(rewardTypes, "rewardType.TradersTender")
            end
            if rewardText:find("Decor Reward:", 1, true) then
                tinsert(rewardTypes, "rewardType.HousingDecor")
            end
            if rewardText:find("Keystones will no longer deplete below level", 1, true) then
                tinsert(rewardTypes, "rewardType.KeystoneResilience")
            end

            if #rewardTypes == 0 then
                if rewardText == "" then
                    exportString = exportString .. "    {" .. achievementInfo.Id .. "}, -- " .. achievementInfo.Name .. "\r\n"
                else
                    exportString = exportString .. "    { -- " .. achievementInfo.Name .. rewardSuffix .. "\r\n"
                    exportString = exportString .. "        " .. achievementInfo.Id .. ",\r\n"
                    exportString = exportString .. "        {\r\n"
                    exportString = exportString .. "            RewardType = rewardType.NotCategorized,\r\n"
                    exportString = exportString .. "        },\r\n"
                    exportString = exportString .. "    },\r\n"
                end
            else
                local rewardTypeValue = #rewardTypes == 1 and rewardTypes[1] or ("{" .. table.concat(rewardTypes, ", ") .. "}")
                exportString = exportString .. "    { -- " .. achievementInfo.Name .. rewardSuffix .. "\r\n"
                exportString = exportString .. "        " .. achievementInfo.Id .. ",\r\n"
                exportString = exportString .. "        {\r\n"
                exportString = exportString .. "            RewardType = " .. rewardTypeValue .. ",\r\n"
                exportString = exportString .. "        },\r\n"
                exportString = exportString .. "    },\r\n"
            end
        end
    end

    print("Missing achievements found:", numMissingAchievements)
    frame.Input:SetText(exportString)
    frame:Show()
end

local function ExportRemovedAchievements()
    local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
	frame:Init(addon.L["Export Removed Achievements"])
    local numRemovedAchievements = 0
    local exportString = "\r\n"
    for _, achievementId in next, addon.Data.AchievementIds do
        local achievementInfo = addon.GetAchievementInfoTable(achievementId)
        if not achievementInfo.Exists then
            numRemovedAchievements = numRemovedAchievements + 1
            exportString = exportString .. "    { -- " .. (addon.Data.Achievements[achievementId].Category and addon.Data.Achievements[achievementId].Category:GetPath() or "") .. "\r\n"
            exportString = exportString .. "        " .. achievementInfo.Id .. "," .. "\r\n"
            exportString = exportString .. "    }," .. "\r\n"
        end
    end

    print("Missing achievements found:", numRemovedAchievements)
    frame.Input:SetText(exportString)
    frame:Show()
end

local function PrintMapInfoWithoutReload()
    if addon.Diagnostics.DebugEnabled() then
        return
    end

    hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
        local mapID = WorldMapFrame.mapID
        print(mapID, addon.GetMapName(mapID))
    end)

    addon.Settings.Set("advanced.printMapInfo", true)
end

local function ExportTaintDiagnostics()
    local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
	frame:Init(addon.L["Export Taint Diagnostics"])
    local sessions = KrowiAF_DebugTable and KrowiAF_DebugTable.TaintDiagnostics and KrowiAF_DebugTable.TaintDiagnostics.Sessions
    frame.Input:SetText(sessions and TableToString(sessions, 100) or "")
    frame:Show()
end

local function ExportToCsv()
    local frame = KrowiAF_TextFrame or CreateFrame("Frame", "KrowiAF_TextFrame", UIParent, "KrowiAF_TextFrame_Template")
	frame:Init(addon.L["Export to CSV"])
    local exportString = "Id;Name;Description;Obtainable;Completed;Points;Rewards\r\n"
    local data = addon.Data
    local temp = addon.Data.TemporaryObtainable
    for _, achievementId in next, data.AchievementIds do
        local achievementInfo = addon.GetAchievementInfoTable(achievementId)
        if achievementInfo.Exists and not achievementInfo.IsGuild and not achievementInfo.IsStatistic then
            exportString = exportString .. achievementInfo.Id .. ";" .. achievementInfo.Name .. ";" .. achievementInfo.Description .. ";" .. (temp:GetObtainableState(data.Achievements[achievementId]) or "") .. ";" .. tostring(achievementInfo.IsCompleted) .. ";" .. achievementInfo.Points .. ";" .. achievementInfo.RewardText .. "\r\n"
        end
    end

    frame.Input:SetText(exportString)
    frame:Show()
end

local infoOptions = {
    order = OrderPP(), type = "group",
    name = addon.Util.L["Info"],
    args = {
        General = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.Util.L["General"],
            args = {
                Version = {
                    order = OrderPP(), type = "description", width = AdjustedWidth(), fontSize = "medium",
                    name = (addon.Util.L["Version"] .. ": "):SetColorYellow() .. addon.Metadata.Version,
                },
                Build = {
                    order = OrderPP(), type = "description", width = AdjustedWidth(), fontSize = "medium",
                    name = (addon.Util.L["Build"] .. ": "):SetColorYellow() .. addon.Metadata.Build,
                },
                Author = {
                    order = OrderPP(), type = "description", width = AdjustedWidth(2), fontSize = "medium",
                    name = (addon.Util.L["Author"] .. ": "):SetColorYellow() .. addon.Metadata.Author,
                },
                Discord = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.Util.L["Discord"],
                    desc = addon.Util.L["Discord Desc"]:K_ReplaceVars(addon.Util.Constants.DiscordServerName),
                    func = function() LibStub("Krowi_PopupDialog_2").ShowExternalLink(addon.Util.Constants.DiscordInviteLink); end
                }
            }
        },
        Sources = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.Util.L["Sources"],
            args = {
                CurseForge = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.Util.L["CurseForge"],
                    desc = addon.Util.L["CurseForge Desc"]:KAF_InjectAddonName():K_ReplaceVars(addon.Util.L["CurseForge"]),
                    func = function() LibStub("Krowi_PopupDialog_2").ShowExternalLink(addon.Metadata.CurseForge); end
                },
                Wago = {
                    order = OrderPP(), type = "execute", width = AdjustedWidth(),
                    name = addon.Util.L["Wago"],
                    desc = addon.Util.L["Wago Desc"]:KAF_InjectAddonName():K_ReplaceVars(addon.Util.L["Wago"]),
                    func = function() LibStub("Krowi_PopupDialog_2").ShowExternalLink(addon.Metadata.Wago); end
                },
            }
        }
    }
}

local iconOptions = {
    order = OrderPP(), type = "group",
    name = addon.Util.L['Icon'],
    args = {
        Minimap = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.Util.L["Minimap"],
            args = {
                ShowMinimapIcon = addon.Settings.Row("minimap.showIcon", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.Util.L["Show minimap icon"],
                    desc = addon.Util.L["Show minimap icon Desc"]:KAF_AddDefaultValueText("minimap.showIcon"),
                    set = MinimapShowMinimapIconSet
                })
            }
        },
        WorldMap = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["World Map"],
            args = {
                ShowWorldMapIcon = addon.Settings.Row("worldMap.showIcon", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Show world map icon"],
                    desc = addon.L["Show world map icon Desc"]:KAF_AddDefaultValueText("worldMap.showIcon"),
                    set = WorldMapShowWorldMapIconSet
                }),
                -- Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(1.5), name = ""},
                AddAddonNameToWorldMapIcon = addon.Settings.Row("worldMap.addAddonName", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(1.5),
                    name = addon.L["Add addon name to world map icon"],
                    desc = addon.L["Add addon name to world map icon Desc"]:KAF_InjectAddonName():KAF_AddDefaultValueText("worldMap.addAddonName"),
                })
            }
        }
    }
}

local keyBindingOptions = {
    order = OrderPP(), type = "group", childGroups = "tab",
    name = addon.L["Key Binding"],
    args = {
        General = {
            order = OrderPP(), type = "group",
            name = addon.Util.L["General"],
            args = {
                ResetView = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Reset view"],
                    args = {
                        ResetViewOnOpen = addon.Settings.Row("window.resetViewOnOpen", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                            name = addon.L["Reset view on open"],
                            desc = addon.L["Reset view on open Desc"]:KAF_AddDefaultValueText("window.resetViewOnOpen"),
                        }),
                        ToggleWindow = addon.Settings.Row("window.toggleWindow", {
                            order = OrderPP(), type = "toggle", width = AdjustedWidth(1.4),
                            name = addon.L["Toggle window once opened"],
                            desc = addon.L["Toggle window once opened Desc"]:KAF_AddDefaultValueText("window.toggleWindow"),
                            disabled = function() return addon.Settings.Get("window.resetViewOnOpen"); end
                        })
                    }
                },
                MicroButton = {
                    order = OrderPP(), type = "group", inline = true,
                    name = addon.L["Micro Button"],
                    args = {
                        Rebind = addon.Settings.Row("window.microButtonTab", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(1.9),
                            name = addon.L["Rebind Micro Button"],
                            desc = addon.L["Rebind Micro Button Desc"], -- KAF_AddDefaultValueTextFromValues via PostLoad
                            values = function() return addon.Gui:TabsOrderGetActiveKeys(); end,
                            set = function(_, value)
                                addon.Settings.Set("window.microButtonTab", value)
                                addon.ChangeAchievementMicroButtonOnClick()
                            end
                        }),
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
                        PasteToChat = addon.Settings.Row("keys.modifiers.pasteToChat", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                            name = addon.L["Paste to Chat"],
                            desc = addon.L["Paste to Chat"]:KAF_AddDefaultValueText("keys.modifiers.pasteToChat", addon.Modifiers),
                            values = addon.Modifiers,
                        }),
                        ToggleTracking = addon.Settings.Row("keys.modifiers.toggleTracking", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                            name = addon.L["Toggle Tracking"],
                            desc = addon.L["Toggle Tracking"]:KAF_AddDefaultValueText("keys.modifiers.toggleTracking", addon.Modifiers),
                            values = addon.Modifiers,
                        }),
                        ToggleWatchList = addon.Settings.Row("keys.modifiers.toggleWatchList", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                            name = addon.L["Add to / Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]),
                            desc = addon.L["Add to / Remove from Watch List"]:K_ReplaceVars(addon.L["Watch List"]):KAF_AddDefaultValueText("keys.modifiers.toggleWatchList", addon.Modifiers),
                            values = addon.Modifiers,
                        }),
                        ToggleExcluded = addon.Settings.Row("keys.modifiers.toggleExcluded", {
                            order = OrderPP(), type = "select", width = AdjustedWidth(0.93),
                            name = addon.L["Include"] .. " / " .. addon.L["Exclude"],
                            desc = addon.L["Include"] .. " / " .. addon.L["Exclude"]:KAF_AddDefaultValueText("keys.modifiers.toggleExcluded", addon.Modifiers),
                            values = addon.Modifiers,
                        })
                        -- The features add their modifiers' rows here (Features.lua, AddOptions' Into)
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
                            set = function(_, value) options.SetKeyBinding(value, "KrowiAF_OPEN_CAT_Current_Zone", 1) end
                        },
                        OpenCurrentZoneCategoryKey2 = {
                            order = OrderPP(), type = "keybinding", width = AdjustedWidth(0.93),
                            name = "", desc = "",
                            get = function() return select(2, GetBindingKey("KrowiAF_OPEN_CAT_Current_Zone")); end,
                            set = function(_, value) options.SetKeyBinding(value, "KrowiAF_OPEN_CAT_Current_Zone", 2) end
                        }
                    }
                }
            }
        }
    }
}

local filtersOptions = {
    order = OrderPP(), type = "group",
    name = addon.L["Filters"],
    args = {
        ResetFilters = {
            order = OrderPP(), type = "group", inline = true,
            name = addon.L["Reset filters"],
            args = {
                ResetFactionFilter = addon.Settings.Row("filtering.resetFactionFilters", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Reset Faction Filters"],
                    desc = addon.L["Reset Faction Filters Desc"]:K_ReplaceVars{
                        neutral = addon.L["Neutral"],
                        alliance = addon.L["Alliance"],
                        horde = addon.L["Horde"]
                    }:KAF_AddDefaultValueText("filtering.resetFactionFilters"),
                })
            }
        }
    }
}

local debugOptions = {
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
                EnableDebugInfo = addon.Settings.Row("advanced.debugInfo", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Enable debug info"],
                    desc = addon.L["Enable debug info Desc"]:KAF_AddDefaultValueText("advanced.debugInfo"),
                }),
                Blank1 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                ScreenshotMode = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Screenshot Mode"],
                    desc = addon.L["Screenshot Mode Desc"],
                    func = HandleScreenshotMode
                },
                EnableTraceInfo = addon.Settings.Row("advanced.traceInfo", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Enable trace info"],
                    desc = addon.L["Enable trace info Desc"]:KAF_AddDefaultValueText("advanced.traceInfo"),
                }),
                Blank2 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                ExportCriteria = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Export Criteria"],
                    desc = addon.L["Export Criteria Desc"],
                    func = ExportCriteria
                },
                ShowPlaceholdersFilter = addon.Settings.Row("advanced.placeholdersFilter", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Show placeholders filter"],
                    desc = addon.L["Show placeholders filter Desc"]:KAF_AddDefaultValueText("advanced.placeholdersFilter"),
                }),
                Blank3 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                ExportMissingAchievements = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Export Missing Achievements"],
                    desc = addon.L["Export Missing Achievements Desc"],
                    func = ExportMissingAchievements
                },
                PrintMapInfo = addon.Settings.Row("advanced.printMapInfo", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Print map info"],
                    desc = addon.L["Print map info Desc"]:KAF_AddDefaultValueText("advanced.printMapInfo"),
                }),
                Blank4 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                ExportRemovedAchievements = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Export Removed Achievements"],
                    desc = addon.L["Export Removed Achievements Desc"],
                    func = ExportRemovedAchievements
                },
                Blank5 = {order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""},
                PrintMapInfoWithoutReload = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Print map info w/o reload"],
                    desc = addon.L["Print map info w/o reload Desc"],
                    func = PrintMapInfoWithoutReload
                },
                Blank6 = {order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""},
                Experimental = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Export to CSV"],
                    desc = addon.L["Export to CSV Desc"],
                    func = ExportToCsv
                },
                Blank7 = {order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""},
                EnableTaintDiagnostics = addon.Settings.Row("advanced.taintDiagnostics", {
                    order = OrderPP(), type = "toggle", width = AdjustedWidth(),
                    name = addon.L["Enable taint diagnostics"],
                    desc = addon.L["Enable taint diagnostics Desc"]:KAF_AddDefaultValueText("advanced.taintDiagnostics"):K_AddReloadRequired(),
                }),
                Blank8 = {order = OrderPP(), type = "description", width = AdjustedWidth(), name = ""},
                ExportTaintDiagnostics = {
                    order = OrderPP(), type = "execute",
                    name = addon.L["Export Taint Diagnostics"],
                    desc = addon.L["Export Taint Diagnostics Desc"],
                    disabled = function() return not addon.Diagnostics.TaintProbe.HasData(); end,
                    func = ExportTaintDiagnostics
                },
                Blank9 = {order = OrderPP(), type = "description", width = AdjustedWidth(2), name = ""},
                MapVerifier = {
                    order = OrderPP(), type = "execute",
                    name = "Map Verifier",
                    desc = "Open the Map Verifier tool to inspect and tag all UiMap IDs.",
                    func = function() addon.Gui.MapVerifier.Open() end
                }
            }
        }
    }
}

options.OptionsTable.args["General"] = {
    type = "group", childGroups = "tab",
    name = addon.Util.L["General"],
    args = {
        Info = infoOptions,
        Icon = iconOptions,
        KeyBinding = keyBindingOptions,
        Filters = filtersOptions,
        Debug = debugOptions
    }
}

function RefreshOptions()
    local profile = addon.Options.db.profile
    MinimapShowMinimapIconSet(nil, profile.ShowMinimapIcon)
    WorldMapShowWorldMapIconSet(nil, profile.ShowWorldmapIcon)
    addon.ChangeAchievementMicroButtonOnClick()
end