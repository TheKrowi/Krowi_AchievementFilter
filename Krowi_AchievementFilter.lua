-- [[ Namespaces ]] --
local addonName, addon = ...;

-- [[ Ace ]] --
addon.L = LibStub(addon.Libs.AceLocale):GetLocale(addonName);
addon.Localization.SetColors(addon.L);
addon.Event = {};
LibStub(addon.Libs.AceEvent):Embed(addon.Event);

-- [[ Tabs ]] --
addon.Tabs.Load();

-- [[ Binding names ]] --
BINDING_HEADER_AF_NAME = addon.MetaData.Title;
for t, tab in next, addon.Tabs do
    if type(tab) ~= "function" then
        _G["BINDING_NAME_KrowiAF_OPEN_TAB_" .. tostring(tab.Name)] = addon.L["Toggle"] .. " " .. tab.Text .. " "  .. addon.L["tab"];
    end
end

-- [[ Faction data ]] --
addon.Faction = {};
addon.Faction.IsAlliance = UnitFactionGroup("player") == "Alliance";
addon.Faction.IsHorde = UnitFactionGroup("player") == "Horde";
addon.Faction.IsNeutral = UnitFactionGroup("player") == "Neutral";

-- [[ Load addon ]] --
local loadHelper = CreateFrame("Frame");
loadHelper:RegisterEvent("ADDON_LOADED"); -- 1
loadHelper:RegisterEvent("PLAYER_LOGIN"); -- 4
loadHelper:RegisterEvent("PLAYER_ENTERING_WORLD"); -- 5
loadHelper:RegisterEvent("ACHIEVEMENT_EARNED");

function loadHelper:OnEvent(event, arg1, arg2)
    if event == "ADDON_LOADED" then
        if arg1 == "Krowi_AchievementFilter" then -- This always needs to load
            addon.Diagnostics.Load();
            addon.Data.ExportedCalendarEvents.InjectOptions();
            addon.Data.ExportedWorldEvents.InjectOptions();
            addon.Data.ExportedWidgetEvents.InjectOptions();

            addon.GUI.PrepareTabsOrder();
            addon.Tabs.InjectOptions();
            addon.Plugins:InjectOptions();
            addon.Options.Load();

            addon.Plugins:Load();

            addon.Data.SavedData.Load();

            addon.GUI:LoadWithAddon();

            addon.Icon.Load();
            addon.Tutorials.Load();
        elseif arg1 == "Blizzard_AchievementUI" then -- This needs the Blizzard_AchievementUI addon available to load
            addon.Data.Load();

            addon.GUI:LoadWithBlizzard_AchievementUI();

            addon.Data.LoadFocusedAchievements(addon.Data.Achievements);
            addon.Data.LoadExcludedAchievements(addon.Data.Achievements);

            addon.MakeWindowMovable();
            addon.GUI.AchievementFrameHeader.HookSetPointsText();
            addon.HookAchievementFrameOnShow();
            addon.HookSelectAchievement();
        elseif arg1 == "WoWUnit" then
            addon.UnitTests:Load();
        end
    elseif event == "PLAYER_LOGIN" then
        addon.Data.ExportedCalendarEvents.Load(addon.Data.CalendarEvents);
        addon.Data.ExportedWorldEvents.Load(addon.Data.WorldEvents);
        addon.Data.ExportedWidgetEvents.Load(addon.Data.WidgetEvents);
        addon.EventData.Load();

        if addon.Diagnostics.DebugEnabled() then
            hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
                local mapID = WorldMapFrame.mapID;
                print(mapID);
            end);
        end

        addon.ChangeAchievementMicroButtonOnClick();
    elseif event == "PLAYER_ENTERING_WORLD" then
         -- arg1 = isLogin, arg2 = isReload
        if arg1 then -- On a fresh login we need AREA_POIS_UPDATED to get world events
            loadHelper:RegisterEvent("AREA_POIS_UPDATED");
        end
        if arg2 then -- On reload we can get world events here since AREA_POIS_UPDATED does not always trigger and data is already available
            C_Timer.After(0, function()
                C_Timer.After(5, function()
                    addon.GUI.AlertSystem.ShowActiveCalendarEvents();
                    addon.GUI.AlertSystem.ShowActiveWorldEvents();
                    addon.GUI.AlertSystem.ShowActiveWidgetEvents();
                end);
            end);
        end
    elseif event == "AREA_POIS_UPDATED" then
        if addon.EventData.GetActiveWorldEvents() ~= nil then
            -- It takes a couple of times in order to properly load all POI info
            C_Timer.After(0, function()
                C_Timer.After(5, function()
                    addon.GUI.AlertSystem.ShowActiveCalendarEvents();
                    addon.GUI.AlertSystem.ShowActiveWorldEvents();
                    addon.GUI.AlertSystem.ShowActiveWidgetEvents();
                end);
            end);
            loadHelper:UnregisterEvent("AREA_POIS_UPDATED");
        end
    elseif event == "ACHIEVEMENT_EARNED" then
        addon.ResetCache(); -- Will force to fetch achievement data again, updating the character achievement points
    end
end
loadHelper:SetScript("OnEvent", loadHelper.OnEvent);

Numbers = function() return 1, 2, 3 end


function KrowiAF_RunUnitTests()
    local AreEqual, Exists, Replace = WoWUnit.AreEqual, WoWUnit.Exists, WoWUnit.Replace
    local Tests = WoWUnit(addonName)
        -- tests will be called at startup, PLAYER_UPDATE and MONEY_UPDATE events

    function Tests:PassingTest()
        AreEqual({1,2,3}, {Numbers()})
        Exists(true)
    end

    function Tests:FaillingTest()
        AreEqual('Apple', 'Pie')
        Exists(false)
    end

    function Tests:MockingTest()
        -- Replace('GetRealmName', function() return 'Horseshoe' end)
        -- AreEqual('Horseshoe!', Realm())
    end
end

-- function KrowiAF_LagGame()
--     local gapSize, i = 0, 1;
--     while gapSize < 500 do -- Biggest gap is 209 in 9.0.5 as of 2021-05-03
--         local id, _, points, _, month, day, year, _, flags, _, _, isGuild, wasEarnedByMe, _, isStatistic, exists = addon.GetAchievementInfo(i);

--         local hasProgressBar;
--         local hasMeta;
--         local hasTextCriteria;
--         if id and exists then
--             local numCriteria = GetAchievementNumCriteria(id);
--             for j = 1, numCriteria do
--                 local criteriaString, criteriaType, completed, quantity, reqQuantity, _, flags, assetID, quantityString = GetAchievementCriteriaInfo(id, j);
--                 flags = addon.Objects.Flags:New(flags);
--                 if criteriaType == CRITERIA_TYPE_ACHIEVEMENT and assetID then
--                     hasMeta = true;
--                 elseif flags.IsCriteriaProgressBar then
--                     hasProgressBar = true;
--                 else
--                     hasTextCriteria = true;
--                 end
--             end
--         end
--         if hasProgressBar and hasMeta then
--             print(id);
--         end
--         if id and exists then
--             gapSize = 0;
--         else
--             gapSize = gapSize + 1;
--         end
--         i = i + 1;
--     end
-- end