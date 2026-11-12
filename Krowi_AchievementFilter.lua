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
    addon.Features.BuildOptions() -- every feature's settings, now that every file loaded (Features.lua)

    KrowiAF.InjectTabDataDynamicOptions()
    addon.Gui.AchievementFrameHeader:InjectDynamicOptions()
    addon.Filters:InjectDefaults()
    KrowiAF.PluginsApi:InjectPluginOptions()
    addon.Options:Load(true)
    addon.Features.StartAll() -- the features that are on in this profile (Features.lua), before the rows or the data load

    KrowiAF.PluginsApi:LoadPlugins()

    addon.Data.DataIntegrityManager.Load()
    addon.Data.SavedData.Load()

    addon.Gui:LoadWithAddon()

    addon.Icon:Load()
    addon.BrowsingHistory:Load()

    -- addon.TooltipData.Load(); -- Temporarily disabled (Issue #300 taint diagnostic build): the 99.4 securecall fix here was confirmed insufficient by a later user report; disabling entirely to confirm/deny this is the taint source before attempting another fix

    addon.Diagnostics.TaintProbe.Load()
end

local function LoadBlizzard_AchievementUI()
    addon.Gui:LoadWithBlizzard_AchievementUI()
    -- The started features' step once the window exists, where the side buttons always attached, so an error in a later
    -- step cannot keep them off; it has its own run-once latch and runs each feature under xpcall (Features.lua)
    addon.Features.AchievementUILoaded()

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

    KrowiAF.PluginsApi:LoadPluginsWithBlizzard_AchievementUI() -- after the line above, so a plugin's error cannot make this run twice
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

function loadHelper:OnEvent(event, arg1)
    if event == "ADDON_LOADED" then
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            LoadKrowi_AchievementFilter()
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            LoadBlizzard_AchievementUI()
        end
    elseif event == "PLAYER_LOGIN" then
        LoadPlayerLogin()

        if C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
            LoadBlizzard_AchievementUI()
        end

        -- Last, so an error in it cannot stop the loads above; the key bindings are loaded by now and the micro button's
        -- tab is resolved (LoadPlayerLogin)
        addon.Gui:MoveYToMicroButtonTab()
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- The calendar may be readable again on the new map (Data/EventData.lua); the reminders listen for this event
        -- themselves while their feature is on (docs/work/2026-11-12-event-reminders)
        addon.EventData.ClearCalendarEventsCacheDeferral()
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.OnAchievementEarned(arg1)
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent)