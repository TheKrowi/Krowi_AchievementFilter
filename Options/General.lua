-- [[ Namespaces ]] --
local _, addon = ...;
local options = addon.Options;

local popupDialog = LibStub("Krowi_PopopDialog-1.0");

local function OpenTutorialsMenu()
    local menu = LibStub("Krowi_Menu-1.0");
    local pages = addon.Tutorials.FeaturesTutorial.Pages;

    menu:Clear(); -- Reset menu

    menu:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
    for i, _ in next, pages do
        menu:AddFull({
            Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Colors.White, addon.Colors.RemoveColor(pages[i].SubTitle)),
            Func = function()
                InterfaceOptionsFrame:Hide();
                addon.Diagnostics.Debug("Showing tutorial for " .. tostring(i));
                addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
            end
        });
    end

    menu:Open();
end

local function SetShowHideIcon()
    addon.Options.db.ShowMinimapIcon = not addon.Options.db.ShowMinimapIcon;
    if addon.Options.db.ShowMinimapIcon then
        addon.Icon:Show("Krowi_AchievementFilterLDB");
    else
        addon.Icon:Hide("Krowi_AchievementFilterLDB");
    end
    options.Debug(addon.L["Show minimap icon"], addon.Options.db.ShowMinimapIcon);
end

local screenshotModeFrame;
local function HandleScreenshotMode()
    InterfaceOptionsFrame:Hide();
    if screenshotModeFrame == nil then
        screenshotModeFrame = CreateFrame("Frame", nil, UIParent);
        if screenshotModeFrame == nil then
            error("Screenshot frame failed to be created.");
            return;
        end
        screenshotModeFrame:SetAllPoints();
        screenshotModeFrame:SetPoint("CENTER");
        screenshotModeFrame:SetSize(64, 64);

        screenshotModeFrame.tex = screenshotModeFrame:CreateTexture();
        screenshotModeFrame.tex:SetAllPoints();
        screenshotModeFrame.tex:SetTexture("Interface\\AddOns\\Krowi_AchievementFilter\\Media\\Black");
        screenshotModeFrame.tex:SetTexCoord(0, 0.390625, 0, 0.78125);
    elseif screenshotModeFrame:IsShown() then
        screenshotModeFrame:Hide();
    else
        screenshotModeFrame:Show();
    end
end

options.OptionsTable.args["General"] = {
    name = addon.L["General"],
    type = "group",
    args = {
        Info = {
            order = 1, type = "group",
            name = addon.L["Info"],
            inline = true,
            args = {
                Version = {
                    order = 1.1, type = "description", width = "normal",
                    name = string.format(addon.Colors.Yellow, addon.L["Version"] .. ": ") .. addon.MetaData.Version,
                    fontSize = "medium",
                },
                Build = {
                    order = 1.2, type = "description", width = "normal",
                    name = string.format(addon.Colors.Yellow, addon.L["Build"] .. ": ") .. addon.MetaData.Build,
                    fontSize = "medium",
                },
                Tutorial = {
                    order = 1.3, type = "execute",
                    name = function() return (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Tutorial"]; end,
                    desc = addon.L["Tutorial Desc"],
                    func = OpenTutorialsMenu
                },
                Author = {
                    order = 2.1, type = "description", width = "double",
                    name = string.format(addon.Colors.Yellow, addon.L["Author"] .. ": ") .. addon.MetaData.Author,
                    fontSize = "medium",
                },
                Discord = {
                    order = 2.3, type = "execute",
                    name = addon.L["Discord"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["Discord Desc"],
                        serverName = addon.MetaData.DiscordServerName
                    },
                    func = function()
                        popupDialog.ShowExternalLink(addon.MetaData.DiscordInviteLink);
                    end
                },
                CurseForge = {
                    order = 3.1, type = "execute",
                    name = addon.L["CurseForge"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["CurseForge Desc"],
                        addonName = addon.MetaData.Title,
                        curseForge = addon.L["CurseForge"]
                    },
                    func = function()
                        popupDialog.ShowExternalLink(addon.MetaData.CurseForge);
                    end
                },
                Wago = {
                    order = 3.2, type = "execute",
                    name = addon.L["Wago"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["Wago Desc"],
                        addonName = addon.MetaData.Title,
                        wago = addon.L["Wago"]
                    },
                    func = function()
                        popupDialog.ShowExternalLink(addon.MetaData.Wago);
                    end
                },
                WoWInterface = {
                    order = 3.3, type = "execute",
                    name = addon.L["WoWInterface"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["WoWInterface Desc"],
                        addonName = addon.MetaData.Title,
                        woWInterface = addon.L["WoWInterface"]
                    },
                    func = function()
                        popupDialog.ShowExternalLink(addon.MetaData.WoWInterface);
                    end
                }
            }
        },
        Icon = {
            order = 2, type = "group",
            name = addon.L["Icon"],
            inline = true,
            args = {
                ShowMinimapIcon = {
                    order = 1, type = "toggle",
                    name = addon.L["Show minimap icon"],
                    desc = addon.L["Show minimap icon Desc"],
                    get = function() return addon.Options.db.ShowMinimapIcon; end,
                    set = SetShowHideIcon
                }
            }
        },
        KeyBinding = {
            order = 3, type = "group",
            name = addon.L["Key Binding"],
            inline = true,
            args = {
                ResetViewOnOpen = {
                    order = 1.1, type = "toggle",
                    name = addon.L["Reset view on open"],
                    desc = addon.L["Reset view on open Desc"],
                    get = function() return addon.Options.db.ResetViewOnOpen; end,
                    set = function()
                        addon.Options.db.ResetViewOnOpen = not addon.Options.db.ResetViewOnOpen;
                        options.Debug(addon.L["Reset view on open"], addon.Options.db.ResetViewOnOpen);
                    end
                },
                Blank12 = {order = 1.2, type = "description", width = 1.5, name = ""},
                RebindMicroButton = {
                    order = 2.1, type = "select", width = 2,
                    name = addon.L["Rebind Micro Button"],
                    desc = addon.L["Rebind Micro Button Desc"],
                    values = function() return addon.Data.SavedData.TabsOrderGetActiveKeys(); end,
                    get = function()
                        return addon.Options.db.MicroButtonTab;
                    end,
                    set = function (_, value)
                        addon.Options.db.MicroButtonTab = value;
                        addon.ChangeAchievementMicroButtonOnClick();
                        options.Debug(addon.L["Rebind Micro Button"], addon.Options.db.MicroButtonTab);
                    end
                },
                Discord = {
                    order = 2.2, type = "execute",
                    name = addon.L["Set Keybind"],
                    desc = addon.Util.ReplaceVars {
                        addon.L["Set Keybind Desc"],
                        keyBindings = addon.L["Key Bindings"]
                    },
                    func = function()
                        local tab = addon.Options.db.Tabs[addon.Options.db.MicroButtonTab];
                        if tab.BindingName then
                            SavedData.BindingName = tab.BindingName;
                            SetBinding("Y", tab.BindingName);
                            SaveBindings(GetCurrentBindingSet());
                        end
                    end
                },
            }
        },
        Search = {
            order = 5, type = "group",
            name = addon.L["Search"],
            inline = true,
            args = {
                ClearOnRightClick = {
                    order = 1.1, type = "toggle", width = 1.5,
                    name = addon.L["Clear search field on Right Click"],
                    desc = addon.L["Clear search field on Right Click Desc"],
                    get = function() return addon.Options.db.SearchBox.ClearOnRightClick; end,
                    set = function()
                        addon.Options.db.SearchBox.ClearOnRightClick = not addon.Options.db.SearchBox.ClearOnRightClick;
                        options.Debug(addon.L["Clear search field on Right Click"], addon.Options.db.SearchBox.ClearOnRightClick);
                    end
                },
                ExcludeExcluded = {
                    order = 1.2, type = "toggle", width = 1.5,
                    name = addon.L["Exclude Excluded achievements"],
                    desc = addon.L["Exclude Excluded achievements Desc"],
                    get = function() return addon.Options.db.SearchBox.ExcludeExcluded; end,
                    set = function()
                        addon.Options.db.SearchBox.ExcludeExcluded = not addon.Options.db.SearchBox.ExcludeExcluded;
                        options.Debug(addon.L["Exclude Excluded achievements"], addon.Options.db.SearchBox.ExcludeExcluded);
                    end
                },
                OnlySearchFiltered = {
                    order = 2.1, type = "toggle", width = 1.5,
                    name = addon.L["Only search filtered achievements"],
                    desc = addon.L["Only search filtered achievements Desc"],
                    get = function() return addon.Options.db.SearchBox.OnlySearchFiltered; end,
                    set = function()
                        addon.Options.db.SearchBox.OnlySearchFiltered = not addon.Options.db.SearchBox.OnlySearchFiltered;
                        options.Debug(addon.L["Only search filtered achievements"], addon.Options.db.SearchBox.OnlySearchFiltered);
                    end
                },
                Blank22 = {order = 2.2, type = "description", width = 1.5, name = ""},
                MinimumCharactersToSearch = {
                    order = 3.1, type = "range", width = 1.5,
                    name = addon.L["Minimum characters to search"],
                    desc = addon.L["Minimum characters to search Desc"],
                    min = 1, max = 10, step = 1,
                    get = function() return addon.Options.db.SearchBox.MinimumCharactersToSearch; end,
                    set = function(_, value)
                        if addon.Options.db.SearchBox.MinimumCharactersToSearch == value then return; end
                        addon.Options.db.SearchBox.MinimumCharactersToSearch = value;
                        options.Debug(addon.L["Minimum characters to search"], addon.Options.db.SearchBox.MinimumCharactersToSearch);
                    end
                },
                NumberOfSearchPreviews = {
                    order = 3.2, type = "range", width = 1.5,
                    name = addon.L["Number of search previews"],
                    desc = addon.ReplaceVarsWithReloadReq(addon.L["Number of search previews Desc"]),
                    min = 1, max = 1000, step = 1, -- max is set by options.MaxNumberOfSearchPreviews after loading has finished
                    get = function() return addon.Options.db.SearchBox.NumberOfSearchPreviews; end,
                    set = function(_, value)
                        if addon.Options.db.SearchBox.NumberOfSearchPreviews == value then return; end
                        addon.Options.db.SearchBox.NumberOfSearchPreviews = value;
                        options.Debug(addon.L["Number of search previews"], addon.Options.db.SearchBox.NumberOfSearchPreviews);
                    end
                }
            }
        },
        Filters = {
            order = 6, type = "group",
            name = addon.L["Filters"],
            inline = true,
            args = {
                ResetFactionFilter = {
                    order = 1.1, type = "toggle", width = "normal",
                    name = addon.L["Reset Faction Filters"],
                    desc = addon.Util.ReplaceVars
                    {
                        addon.L["Reset Faction Filters Desc"],
                        neutral = addon.L["Neutral"],
                        alliance = addon.L["Alliance"],
                        horde = addon.L["Horde"]
                    },
                    get = function() return addon.Options.db.Filters.ResetFactionFilters; end,
                    set = function()
                        addon.Options.db.Filters.ResetFactionFilters = not addon.Options.db.Filters.ResetFactionFilters;
                        options.Debug(addon.L["Reset Faction Filters"], addon.Options.db.Filters.ResetFactionFilters);
                    end
                },
            }
        },
        Debug = {
            order = 7, type = "group",
            name = addon.L["Debug"],
            inline = true,
            args = {
                Description = {
                    order = 1, type = "description", width = "full",
                    name = addon.L["Debug Desc"],
                    fontSize = "medium"
                },
                EnableDebugInfo = {
                    order = 2.1, type = "toggle", width = "normal",
                    name = addon.L["Enable debug info"],
                    desc = addon.L["Enable debug info Desc"],
                    get = function() return addon.Options.db.EnableDebugInfo; end,
                    set = function()
                        addon.Options.db.EnableDebugInfo = not addon.Options.db.EnableDebugInfo;
                        options.Debug(addon.L["Enable debug info"], addon.Options.db.EnableDebugInfo);
                    end
                },
                Blank12 = {order = 2.2, type = "description", width = "normal", name = ""},
                ScreenshotMode = {
                    order = 2.3, type = "execute",
                    name = addon.L["Screenshot Mode"],
                    desc = addon.L["Screenshot Mode Desc"],
                    func = HandleScreenshotMode
                },
                EnableTraceInfo = {
                    order = 3.1, type = "toggle", width = "full",
                    name = addon.L["Enable trace info"],
                    desc = addon.L["Enable trace info Desc"],
                    get = function() return addon.Options.db.EnableTraceInfo; end,
                    set = function()
                        addon.Options.db.EnableTraceInfo = not addon.Options.db.EnableTraceInfo;
                        options.Debug(addon.L["Enable trace info"], addon.Options.db.EnableTraceInfo);
                    end
                },
                ShowPlaceholdersFilter = {
                    order = 4.1, type = "toggle", width = "full",
                    name = addon.L["Show placeholders filter"],
                    desc = addon.L["Show placeholders filter Desc"],
                    get = function() return addon.Options.db.ShowPlaceholdersFilter; end,
                    set = function()
                        addon.Options.db.ShowPlaceholdersFilter = not addon.Options.db.ShowPlaceholdersFilter;
                        options.Debug(addon.L["Show placeholders filter"], addon.Options.db.ShowPlaceholdersFilter);
                    end
                }
            }
        }
    }
};