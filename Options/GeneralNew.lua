-- -- [[ Namespaces ]] --
-- local _, addon = ...;
-- local options = addon.Options;
-- options.General = {};
-- local general = options.General;

-- local function TutorialName()
--     return (addon.Tutorials.FeaturesTutorial:HasUnviewedPages() and "|T132049:0|t" or "") .. addon.L["Tutorial"];
-- end

-- local function TutorialFunc()
--     local menu = LibStub("Krowi_Menu-1.0");
--     local pages = addon.Tutorials.FeaturesTutorial.Pages;

--     menu:Clear(); -- Reset menu

--     menu:AddFull({Text = addon.L["View Tutorial"], IsTitle = true});
--     for i, _ in next, pages do
--         menu:AddFull({
--             Text = (pages[i].IsViewed and "" or "|T132049:0|t") .. string.format(addon.Colors.White, addon.Colors.RemoveColor(pages[i].SubTitle)),
--             Func = function()
--                 if addon.IsWrathClassic or addon.IsShadowlandsRetail then
--                     InterfaceOptionsFrame:Hide();
--                 else
--                     SettingsPanel:Close();
--                 end
--                 addon.Tutorials.FeaturesTutorial:ShowTutorial(i);
--             end
--         });
--     end

--     menu:Open();
-- end

-- local function DiscordFunc()
--     local popupDialog = LibStub("Krowi_PopopDialog-1.0");
--     popupDialog.ShowExternalLink(addon.MetaData.DiscordInviteLink);
-- end

-- local function CurseForgeFunc()
--     local popupDialog = LibStub("Krowi_PopopDialog-1.0");
--     popupDialog.ShowExternalLink(addon.MetaData.CurseForge);
-- end

-- local function WagoFunc()
--     local popupDialog = LibStub("Krowi_PopopDialog-1.0");
--     popupDialog.ShowExternalLink(addon.MetaData.Wago);
-- end

-- local function WoWInterfaceFunc()
--     local popupDialog = LibStub("Krowi_PopopDialog-1.0");
--     popupDialog.ShowExternalLink(addon.MetaData.WoWInterface);
-- end

-- local function ShowMinimapIconGet()
--     return addon.Options.db.ShowMinimapIcon;
-- end

-- local function ShowMinimapIconSet()
--     addon.Options.db.ShowMinimapIcon = not addon.Options.db.ShowMinimapIcon;
--     if addon.Options.db.ShowMinimapIcon then
--         addon.Icon:Show("Krowi_AchievementFilterLDB");
--     else
--         addon.Icon:Hide("Krowi_AchievementFilterLDB");
--     end
-- end

-- local function ShowWorldMapIconGet()
--     return addon.Options.db.ShowWorldmapIcon;
-- end

-- local function ShowWorldMapIconSet()
--     addon.Options.db.ShowWorldmapIcon = not addon.Options.db.ShowWorldmapIcon;
--     addon.GUI.WorldMapButton:Refresh();
--     addon.WorldMapButtons.SetPoints();
-- end

-- local AddGroup = KrowiAF_InjectOptions.AddGroup;
-- local AddDescription = KrowiAF_InjectOptions.AddDescription;
-- local AddExecute = KrowiAF_InjectOptions.AddExecute;
-- local AddToggle = KrowiAF_InjectOptions.AddToggle;

-- local function BuildOptionsTableInfoTab(destTablePath)
--     local info = AddGroup(destTablePath, addon.L["Info"]);

--     AddGroup{key = addon.L["General"], inline = true};
--     do
--         local versionName = (addon.L["Version"] .. ": "):SetColorYellow() .. addon.MetaData.Version;
--         local buildName = (addon.L["Build"] .. ": "):SetColorYellow() .. addon.MetaData.Build;
--         local authorName = (addon.L["Author"] .. ": "):SetColorYellow() .. addon.MetaData.Author;
--         local discordDesc = addon.L["Discord Desc"]:ReplaceVars {
--             serverName = addon.MetaData.DiscordServerName
--         };

--         AddDescription(versionName);
--         AddDescription(buildName);
--         AddExecute{key = "Tutorial", name = TutorialName, desc = addon.L["Tutorial Desc"], func = TutorialFunc};
--         AddDescription{key = authorName, width = 2};
--         AddExecute{key = addon.L["Discord"], desc = discordDesc, func = DiscordFunc};
--     end

--     AddGroup{info, addon.L["Sources"], inline = true};
--     do
--         local curseForgeDesc = addon.L["CurseForge Desc"]:ReplaceVars {
--             addonName = addon.MetaData.Title,
--             curseForge = addon.L["CurseForge"]
--         };
--         local wagoDesc = addon.L["Wago Desc"]:ReplaceVars {
--             addonName = addon.MetaData.Title,
--             wago = addon.L["Wago"]
--         };
--         local woWInterfaceDesc = addon.L["WoWInterface Desc"]:ReplaceVars {
--             addonName = addon.MetaData.Title,
--             woWInterface = addon.L["WoWInterface"]
--         };

--         AddExecute{key = addon.L["CurseForge"], desc = curseForgeDesc, func = CurseForgeFunc};
--         AddExecute{key = addon.L["Wago"], desc = wagoDesc, func = WagoFunc};
--         AddExecute{key = addon.L["WoWInterface"], desc = woWInterfaceDesc, func = WoWInterfaceFunc};
--     end
-- end

-- local function BuildOptionsTableIconTab(destTablePath)
--     local icon = AddGroup(destTablePath, addon.L["Icon"]);

--     AddGroup{key = addon.L["Minimap"], inline = true};
--     do
--         local minimapDesc = addon.L["Show minimap icon Desc"]:AddDefaultValueText("ShowMinimapIcon");

--         AddToggle{key = addon.L["Show minimap icon"], desc = minimapDesc, get = ShowMinimapIconGet, set = ShowMinimapIconSet};
--     end

--     AddGroup{icon, addon.L["World Map"], inline = true};
--     do
--         local worldMapDesc = addon.L["Show world map icon Desc"]:AddDefaultValueText("ShowWorldmapIcon");

--         AddToggle{key = addon.L["Show world map icon"], desc = worldMapDesc, get = ShowWorldMapIconGet, set = ShowWorldMapIconSet};
--     end
-- end

-- -- local function BuildOptionsTableKeyBindingTab(destTablePath)
-- --     local keyBinding = AddGroup(destTablePath, addon.L["Key Binding"]);

-- --     local resetView = AddGroup(keyBinding, "ResetView", addon.L["Reset view"], 1, true);
-- --     do
-- --         local minimapDesc = addon.L["Show minimap icon Desc"]:AddDefaultValueText("ShowMinimapIcon");

-- --         AddToggle(minimap, "ShowMinimapIcon", addon.L["Show minimap icon"], 1, minimapDesc, nil, ShowMinimapIconGet, ShowMinimapIconSet);
-- --     end
-- -- end

-- function general.BuildOptionsTable()
--     -- KrowiAF_InjectOptions.SetAutoOrder();

--     -- local root = options.OptionsTable.args;

--     -- -- local rootGeneral = injectOptions.AddGroup(root, "General", addon.L["General"], nil, nil, "tab");
--     -- local _general = "General.args";
--     -- BuildOptionsTableInfoTab(_general);
--     -- BuildOptionsTableIconTab(_general);
--     -- -- BuildOptionsTableKeyBindingTab(_general);
-- end