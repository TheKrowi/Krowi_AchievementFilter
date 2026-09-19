-- [[ Namespaces ]] --
local addonName, addon = ...

-- [[ Ace ]] --
addon.Event = {}
LibStub("AceEvent-3.0"):Embed(addon.Event)

-- [[ Binding names ]] --
BINDING_HEADER_KrowiAF = addon.Metadata.Title
BINDING_NAME_KrowiAF_BROWSER_HISTORY_PREV = addon.L["Go back one achievement"]
BINDING_NAME_KrowiAF_BROWSER_HISTORY_NEXT = addon.L["Go forward one achievement"]

-- [[ Faction data ]] --
addon.Faction = {}
addon.Faction.IsAlliance = UnitFactionGroup("player") == "Alliance"
addon.Faction.IsHorde = UnitFactionGroup("player") == "Horde"
addon.Faction.IsNeutral = UnitFactionGroup("player") == "Neutral"

-- [[ Load addon ]] --
local loadHelper = CreateFrame("Frame", "KrowiAF_SpecialFrame") -- also the Escape proxy on Classic, see Gui/FramesForClosing.lua
loadHelper:RegisterEvent("ADDON_LOADED")
loadHelper:RegisterEvent("PLAYER_LOGIN")
loadHelper:RegisterEvent("PLAYER_ENTERING_WORLD")
loadHelper:RegisterEvent("ACHIEVEMENT_EARNED")

local function LoadKrowi_AchievementFilter()
    addon.Diagnostics.Load()

    KrowiAF.LoadTabs()

    addon.SpecialCategories.InjectDynamicOptions()
    KrowiAF.InjectEventDataDynamicOptions()

    KrowiAF.InjectTabDataDynamicOptions()
    addon.Gui.AchievementFrameHeader:InjectDynamicOptions()
    addon.Filters:InjectDefaults()
    KrowiAF.PluginsApi:InjectPluginOptions()
    addon.Options:Load(true)

    KrowiAF.PluginsApi:LoadPlugins()

    addon.Data.DataIntegrityManager.Load()
    addon.Data.SavedData.Load()

    addon.Gui:LoadWithAddon()

    addon.Icon:Load()
    addon.Tutorials.Load()
    addon.BrowsingHistory:Load()

    -- addon.TooltipData.Load(); -- Temporarily disabled (Issue #300 taint diagnostic build): the 99.4 securecall fix here was confirmed insufficient by a later user report; disabling entirely to confirm/deny this is the taint source before attempting another fix

    addon.Diagnostics.TaintProbe.Load()
end

local function LoadBlizzard_AchievementUI()
    addon.Gui:LoadWithBlizzard_AchievementUI()

    if addon.Options.db.profile.Window.Movable then
        addon.MakeWindowMovable()
    else
        addon.MakeWindowStatic()
    end
    addon.Gui.AchievementFrameHeader:HookSetPointsText()
    addon.OverwriteFunctions()
    addon.LoadBlizzardApiChanges()
    addon.HookFunctions()

    LoadBlizzard_AchievementUI = function() end
end

local function LoadPlayerLogin()
    addon.Data:LoadOnPlayerLogin()

    if addon.Diagnostics.DebugEnabled() or addon.Options.db.profile.PrintMapInfo then
        hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
            local mapID = WorldMapFrame.mapID
            print(mapID, addon.GetMapName(mapID))
        end)
    end

    addon.ChangeAchievementMicroButtonOnClick()
end

local function LoadBlizzard_Calendar()
    addon.EventData.LoadBlizzard_Calendar()
end

function loadHelper:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            LoadKrowi_AchievementFilter()
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            LoadBlizzard_AchievementUI()
        elseif arg1 == "Blizzard_Calendar" then
            LoadBlizzard_Calendar()
        end
    elseif event == "PLAYER_LOGIN" then
        LoadPlayerLogin()

        if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadBlizzard_AchievementUI()
        end
        if C_AddOns.IsAddOnLoaded("Blizzard_Calendar") then
            LoadBlizzard_Calendar()
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
         -- arg1 = isLogin, arg2 = isReload
        addon.EventData.ClearCalendarEventsCacheDeferral()
        local popUpsOptions, chatMessagesOptions, popUpsUpcomingOptions, chatMessagesUpcomingOptions
        if arg1 then
            popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnLogin
            chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnLogin
            popUpsUpcomingOptions = addon.Options.db.profile.EventReminders.PopUps.OnLoginUpcoming
            chatMessagesUpcomingOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnLoginUpcoming
        elseif arg2 then
            popUpsOptions = addon.Options.db.profile.EventReminders.PopUps.OnReload
            chatMessagesOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnReload
            popUpsUpcomingOptions = addon.Options.db.profile.EventReminders.PopUps.OnReloadUpcoming
            chatMessagesUpcomingOptions = addon.Options.db.profile.EventReminders.ChatMessages.OnReloadUpcoming
        end
        if arg1 or arg2 then -- Required cause event also is called when zoning in an instance for example
            C_Timer.After(0, function()
                C_Timer.After(addon.Options.db.profile.EventReminders.OnLoginDelay, function()
                    addon.Gui.EventReminderAlertSystem:ShowActiveEventsOnPlayerEnteringWorld(popUpsOptions, chatMessagesOptions)
                end)
            end)
            C_Timer.After(0, function()
                C_Timer.After(addon.Options.db.profile.EventReminders.OnLoginUpcomingDelay, function()
                    addon.Gui.EventReminderAlertSystem:ShowUpcomingCalendarEventsOnPlayerEnteringWorld(popUpsUpcomingOptions, chatMessagesUpcomingOptions)
                end)
            end)
        end
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.OnAchievementEarned(arg1)
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent)