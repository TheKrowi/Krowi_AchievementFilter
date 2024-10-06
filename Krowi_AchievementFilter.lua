-- [[ Namespaces ]] --
local addonName, addon = ...;

-- C_AddOns.LoadAddOn("Blizzard_AchievementUI"); -- For testing

-- [[ Ace ]] --
addon.L = LibStub(addon.Libs.AceLocale):GetLocale(addonName);
addon.Localization.SetColors(addon.L);
addon.Event = {};
LibStub(addon.Libs.AceEvent):Embed(addon.Event);

-- [[ Tabs ]] --
addon.Tabs.Load();

-- [[ Binding names ]] --
BINDING_HEADER_KrowiAF = addon.Metadata.Title;
BINDING_NAME_KrowiAF_BROWSER_HISTORY_PREV = addon.L["Go back one achievement"];
BINDING_NAME_KrowiAF_BROWSER_HISTORY_NEXT = addon.L["Go forward one achievement"];

-- [[ Faction data ]] --
addon.Faction = {};
addon.Faction.IsAlliance = UnitFactionGroup("player") == "Alliance";
addon.Faction.IsHorde = UnitFactionGroup("player") == "Horde";
addon.Faction.IsNeutral = UnitFactionGroup("player") == "Neutral";

-- [[ Load addon ]] --
local loadHelper = CreateFrame("Frame", "KrowiAF_SpecialFrame");
tinsert(UISpecialFrames, "KrowiAF_SpecialFrame");
loadHelper:RegisterEvent("ADDON_LOADED");
loadHelper:RegisterEvent("PLAYER_LOGIN");
loadHelper:RegisterEvent("PLAYER_ENTERING_WORLD");
loadHelper:RegisterEvent("ACHIEVEMENT_EARNED");

local function LoadKrowi_AchievementFilter()
    addon.Diagnostics.Load();

    addon.Data.SpecialCategories.InjectDynamicOptions();
    KrowiAF.InjectCalendarEventDataDynamicOptions();
    if addon.Data.ExportedWidgetEvents then
        addon.Data.ExportedWidgetEvents.InjectDynamicOptions();
    end
    if addon.Data.ExportedWorldEvents then
        addon.Data.ExportedWorldEvents.InjectDynamicOptions();
    end

    addon.Gui:PrepareTabsOrder();
    addon.Tabs.InjectDynamicOptions();
    addon.Gui.AchievementFrameHeader:InjectDynamicOptions();
    addon.Filters:InjectDefaults();
    addon.Plugins:InjectOptions();
    addon.Options:Load(true);

    addon.Plugins:Load();

    addon.Data.DataIntegrityManager.Load();
    addon.Data.SavedData.Load();

    addon.Gui:LoadWithAddon();

    addon.Icon:Load();
    addon.Tutorials.Load();
    addon.BrowsingHistory:Load();

    addon.TooltipData.Load(); -- Might be moved to PLAYER_LOGIN event but easier for testing on every /reload
end

local function LoadBlizzard_AchievementUI()
    addon.Gui:LoadWithBlizzard_AchievementUI();

    if addon.Options.db.profile.Window.Movable then
        addon.MakeWindowMovable();
    else
        addon.MakeWindowStatic();
    end
    addon.Gui.AchievementFrameHeader:HookSetPointsText();
    addon.OverwriteFunctions();
    addon.LoadBlizzardApiChanges();
    addon.HookFunctions();

    LoadBlizzard_AchievementUI = function() end
end

local function LoadPlayerLogin()
    addon.Data:LoadOnPlayerLogin()

    if addon.Diagnostics.DebugEnabled() or addon.Options.db.profile.PrintMapInfo then
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
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            LoadKrowi_AchievementFilter();
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            LoadBlizzard_AchievementUI();
        elseif arg1 == "Blizzard_Calendar" then
            LoadBlizzard_Calendar();
        end
    elseif event == "PLAYER_LOGIN" then
        LoadPlayerLogin();

        if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadBlizzard_AchievementUI();
        end
        if C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then
            LoadBlizzard_Calendar();
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
         -- arg1 = isLogin, arg2 = isReload
        local popUpsOptions, chatMessagesOptions;
        if arg1 then
            popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnLogin;
            chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnLogin;
        elseif arg2 then
            popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnReload;
            chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnReload;
        end
        if arg1 or arg2 then -- Required cause event also is called when zoning in an instance for example
            C_Timer.After(0, function()
                C_Timer.After(addon.Options.db.profile.EventReminders.OnLoginDelay, function()
                    addon.Gui.EventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions);
                end);
            end);
        end

        -- C_AddOns.LoadAddOn("Blizzard_Calendar");
        -- C_AddOns.LoadAddOn("Blizzard_AchievementUI");
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.OnAchievementEarned(arg1);
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent);

-- function KrowiAF_AttCheck()
--     if not AllTheThings then
--         return;
--     end
    
--     DebugTable = {};
--     -- for key1, value1 in pairs(KrowiAF_ATT.Achievements) do
--         for key2, value2 in pairs(AllTheThings.Achievements) do
--             if type(value2) == "table" and type(value2.g) == "table" then
--                 for key3, value3 in pairs(value2.g) do
--                     if type(value3) == "table" and value3["achID"] then
--                         tinsert(DebugTable, {id = value3["achID"], awp = value3["awp"], rwp = value3["rwp"],})
--                         -- for key4, value4 in pairs(value3) do
--                         --     DebugTable[key4] = 1;
--                         --     -- if key4 == "nmr"then
--                         --     --     DebugTable[value3["achID"]]
--                         --     -- end
--                         -- end
--                     end
--                 end
--             end
--         end
--     -- end
-- end

-- local frame = CreateFrame("Frame", "TESTFRAME", UIParent, "PortraitFrameTemplate");
-- frame:SetPoint("CENTER");
-- frame:SetSize(100,100);
-- frame:Show();
-- frame:EnableMouse(true);

hooksecurefunc("ToggleGameMenu", function()
    if KrowiAF_FloatingAchievementTooltip and KrowiAF_FloatingAchievementTooltip:IsShown() then
        KrowiAF_FloatingAchievementTooltip:Hide();
    elseif KrowiAF_TextFrame and KrowiAF_TextFrame:IsShown() then
        KrowiAF_TextFrame:Hide();
    elseif KrowiAF_DataManagerFrame and KrowiAF_DataManagerFrame:IsShown() then
        KrowiAF_DataManagerFrame:Hide();
    elseif KrowiAF_AchievementCalendarFrame and KrowiAF_AchievementCalendarFrame.SideFrame and KrowiAF_AchievementCalendarFrame.SideFrame:IsShown() then
        KrowiAF_AchievementCalendarFrame.SideFrame:Hide();
    elseif KrowiAF_AchievementCalendarFrame and KrowiAF_AchievementCalendarFrame:IsShown() then
        KrowiAF_AchievementCalendarFrame:Hide();
    elseif AchievementFrame and AchievementFrame:IsShown() then
        AchievementFrame:Hide();
    end

    if KrowiAF_FloatingAchievementTooltip and KrowiAF_FloatingAchievementTooltip:IsShown()
    or KrowiAF_TextFrame and KrowiAF_TextFrame:IsShown()
    or KrowiAF_DataManagerFrame and KrowiAF_DataManagerFrame:IsShown()
    or KrowiAF_AchievementCalendarFrame and KrowiAF_AchievementCalendarFrame.SideFrame and KrowiAF_AchievementCalendarFrame.SideFrame:IsShown()
    or KrowiAF_AchievementCalendarFrame and KrowiAF_AchievementCalendarFrame:IsShown()
    or AchievementFrame and AchievementFrame:IsShown() then
        KrowiAF_SpecialFrame:Show();
    end
end);