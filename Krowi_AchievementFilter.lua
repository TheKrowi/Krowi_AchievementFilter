-- [[ Namespaces ]] --
local addonName, addon = ...;

-- LoadAddOn("Blizzard_AchievementUI"); -- For testing

-- [[ Version data ]] --
local version = (GetBuildInfo());
local major = string.match(version, "(%d+)%.(%d+)%.(%d+)(%w?)");
addon.IsWrathClassic = major == "3";
addon.IsDragonflightRetail = major == "10";

-- [[ Ace ]] --
addon.L = LibStub(addon.Libs.AceLocale):GetLocale(addonName);
addon.Localization.SetColors(addon.L);
addon.Event = {};
LibStub(addon.Libs.AceEvent):Embed(addon.Event);

-- [[ Tabs ]] --
addon.Tabs.Load();

-- [[ Binding names ]] --
BINDING_HEADER_KrowiAF = addon.MetaData.Title;

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

    addon.Data.ExportedCategories.InjectDynamicOptions();
    addon.Data.ExportedCalendarEvents.InjectDynamicOptions();
    addon.Data.ExportedWorldEvents.InjectDynamicOptions();

    addon.GUI.PrepareTabsOrder();
    addon.Tabs.InjectDynamicOptions();
    addon.GUI.AchievementFrameHeader.InjectDynamicOptions();
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

local function LoadBlizzard_Calendar()
    addon.EventData.LoadBlizzard_Calendar();
end

function loadHelper:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        addon.Data.SavedData.FixSavedVariables();
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            LoadKrowi_AchievementFilter();
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            LoadBlizzard_AchievementUI();
        elseif arg1 == "Blizzard_Calendar" then
            LoadBlizzard_Calendar();
        end
    elseif event == "PLAYER_LOGIN" then
        LoadPlayerLogin();

        if IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadBlizzard_AchievementUI();
        end
        if IsAddOnLoaded("Blizzard_Calendar") then
            LoadBlizzard_Calendar();
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
         -- arg1 = isLogin, arg2 = isReload
        local popUpsOptions, chatMessagesOptions;
        if arg1 then
            popUpsOptions = addon.Options.db.EventReminders.PopUps.OnLogin;
            chatMessagesOptions = addon.Options.db.EventReminders.ChatMessages.OnLogin;
        elseif arg2 then
            popUpsOptions = addon.Options.db.EventReminders.PopUps.OnReload;
            chatMessagesOptions = addon.Options.db.EventReminders.ChatMessages.OnReload;
        end
        if arg1 or arg2 then -- Required cause event also is called when zoning in an instance for example
            C_Timer.After(0, function()
                C_Timer.After(addon.Options.db.EventReminders.OnLoginDelay, function()
                    addon.GUI.AlertSystem.ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions);
                end);
            end);
        end
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.OnAchievementEarned(arg1);
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent);