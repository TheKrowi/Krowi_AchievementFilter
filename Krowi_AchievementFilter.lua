-- [[ Namespaces ]] --
local addonName, addon = ...;

-- LoadAddOn("Blizzard_AchievementUI"); -- For testing

-- [[ Version data ]] --
local version = (GetBuildInfo());
local major = string.match(version, "(%d+)%.(%d+)%.(%d+)(%w?)");
addon.IsWrathClassic = major == "3";
addon.IsShadowlandsRetail = major == "9";
addon.IsDragonflightRetail = major == "10";

-- [[ Ace ]] --
addon.L = LibStub(addon.Libs.AceLocale):GetLocale(addonName);
addon.Localization.SetColors(addon.L);
addon.Event = {};
LibStub(addon.Libs.AceEvent):Embed(addon.Event);

-- [[ Tabs ]] --
addon.Tabs.Load();

-- [[ Binding names ]] --
addon.Bindings = {};
BINDING_HEADER_AF_NAME = addon.MetaData.Title;
for _, t in next, addon.TabsOrder do
    local tab = addon.Tabs[t];
    if type(tab) ~= "function" then
        tinsert(addon.Bindings, {Name = "KrowiAF_OPEN_TAB_" .. tostring(tab.Name), Text = addon.L["Toggle"] .. " " .. tab.Text .. " "  .. addon.L["tab"]});
        _G["BINDING_NAME_" .. addon.Bindings[#addon.Bindings].Name] = addon.Bindings[#addon.Bindings].Text;
    end
end
tinsert(addon.Bindings, {Name = "KrowiAF_OPEN_CAT_Current_Zone", Text = addon.L["Open"] .. " " .. addon.L["Current Zone"] .. " " .. addon.L["Category"]});
_G["BINDING_NAME_" .. addon.Bindings[#addon.Bindings].Name] = addon.Bindings[#addon.Bindings].Text;

-- [[ Faction data ]] --
addon.Faction = {};
addon.Faction.IsAlliance = UnitFactionGroup("player") == "Alliance";
addon.Faction.IsHorde = UnitFactionGroup("player") == "Horde";
addon.Faction.IsNeutral = UnitFactionGroup("player") == "Neutral";

-- [[ Load addon ]] --
local loadHelper = CreateFrame("Frame");
loadHelper:RegisterEvent("ADDON_LOADED");
loadHelper:RegisterEvent("PLAYER_LOGIN");
loadHelper:RegisterEvent("PLAYER_ENTERING_WORLD");
loadHelper:RegisterEvent("ACHIEVEMENT_EARNED");

local function LoadKrowi_AchievementFilter()
    addon.Diagnostics.Load();

    addon.Data.ExportedCategories.InjectOptions();
    addon.Options.Layout.AddMoreWatchListOptions();
    addon.Options.Layout.AddMoreTrackingAchievementsOptions();
    addon.Options.Layout.AddMoreExcludedOptions();
    addon.Options.General.AddKeybindingOptions();

    addon.Data.ExportedCalendarEvents.InjectOptions();
    addon.Data.ExportedWorldEvents.InjectOptions();

    addon.GUI.PrepareTabsOrder();
    addon.Tabs.InjectOptions();
    addon.Plugins:InjectOptions();
    addon.Options.Load();

    addon.Plugins:Load();

    addon.Data.SavedData.Load();

    addon.GUI:LoadWithAddon();

    addon.Icon.Load();
    addon.Tutorials.Load();

    addon.TooltipData.Load(); -- Might be moved to PLAYER_LOGIN event but easier for testing on every /reload
end

local function LoadBlizzard_AchievementUI()
    addon.Data.Load();

    addon.GUI:LoadWithBlizzard_AchievementUI();

    addon.Data.LoadWatchedAchievements();
    addon.Data.LoadTrackingAchievements();
    addon.Data.LoadExcludedAchievements();

    if addon.Options.db.Window.Movable then
        addon.MakeWindowMovable();
    else
        addon.MakeWindowStatic();
    end
    addon.GUI.AchievementFrameHeader.HookSetPointsText();
    addon.OverwriteFunctions();
    addon.HookAchievementFrameOnShow();

    LoadBlizzard_AchievementUI = function() end
end

local function LoadPlayerLogin()
    addon.Data.ExportedCalendarEvents.Load(addon.Data.CalendarEvents);
    addon.Data.ExportedWorldEvents.Load(addon.Data.WorldEvents);

    if addon.Diagnostics.DebugEnabled() then
        hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
            local mapID = WorldMapFrame.mapID;
            print(mapID, addon.GetMapName(mapID));
        end);
    end

    addon.ChangeAchievementMicroButtonOnClick();
end

function loadHelper:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            LoadKrowi_AchievementFilter();
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            LoadBlizzard_AchievementUI();
        end
    elseif event == "PLAYER_LOGIN" then
        LoadPlayerLogin();

        if IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadBlizzard_AchievementUI();
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
         -- arg1 = isLogin, arg2 = isReload
        if arg1 or arg2 then
            C_Timer.After(0, function()
                C_Timer.After(5, function()
                    addon.GUI.AlertSystem.ShowActiveEvents();
                end);
            end);
        end
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.OnAchievementEarned(arg1);
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent);