-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;
addon.GUI = {};
local gui = addon.GUI;
gui.SideButtons = {};
local sideButtons = gui.SideButtons;

function gui:LoadWithAddon()
    gui.WorldMapButton.Load();
    gui.AlertSystem:Load();
    gui.FilterButton:InjectDefaults();
end

local CreateAchievementPointsTooltip;
function gui:LoadWithBlizzard_AchievementUI()
    self.SetAchievementFrameHeight(addon.Options.db.Window.AchievementFrameHeightOffset); -- Do this in order to create the correct amount of buttons based on our settings

    gui.AchievementsFrame:Load();
    gui.CategoriesFrame:Load();
    gui.FilterButton:Load();

    gui.Search.Load();

    gui.AddDataToBlizzardTabs();

    for _, t in next, addon.TabsOrder do
        addon.Tabs[t].Button = gui.AchievementFrameTabButton:New(addonName, addon.Tabs[t].Name, addon.Tabs[t].Text, {gui.FilterButton, gui.Search.SearchBoxFrame}, gui.AchievementsFrame, gui.CategoriesFrame, addon.Tabs[t].Categories, addon.Tabs[t].Filters);
    end

    local activeCalendarEvents = addon.EventData.GetActiveCalendarEvents();

    for _, activeEvent in next, activeCalendarEvents do
        tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    end

    local activeWorldEvents = addon.EventData.GetActiveWorldEvents();

    for _, activeEvent in next, activeWorldEvents do
        tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    end

    local activeWidgetEvents = addon.EventData.GetActiveWidgetEvents();

    for _, activeEvent in next, activeWidgetEvents do
        tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    end

    self.ResetAchievementFrameHeight();

    CreateAchievementPointsTooltip();

    diagnostics.Debug("GUI loaded");
end

-- [[ AchievementFrame Width ]] --
local defaultAchievementFrameWidth;

function gui.SetAchievementFrameWidth(offset)
    diagnostics.Trace("gui.SetAchievementFrameWidth");

    if not defaultAchievementFrameWidth then
        defaultAchievementFrameWidth = AchievementFrame:GetWidth();
    end
    AchievementFrame:SetWidth(defaultAchievementFrameWidth + offset);
end

function gui.ResetAchievementFrameWidth()
    diagnostics.Trace("gui.ResetAchievementFrameWidth");

    if defaultAchievementFrameWidth then
        AchievementFrame:SetWidth(defaultAchievementFrameWidth);
    end
end

local function UpdateAchievementFrameWidth(message , offset)
    if gui.SelectedTab then -- Need to check if it exists since this can be triggered before it's created
        gui.AchievementsFrame:Hide();
        gui.CategoriesFrame:Hide();
        gui.SetAchievementFrameWidth(offset);
        gui.AchievementsFrame:Show();
        gui.CategoriesFrame:Show();
    end
end

addon.Event:RegisterMessage("UpdateAchievementFrameWidth", UpdateAchievementFrameWidth);

-- [[ AchievementFrame Height ]] --
local defaultAchievementFrameHeight;
local defaultAchievementFrameMetalBorderHeight;

function gui.SetAchievementFrameHeight(offset)
    diagnostics.Trace("gui.SetAchievementFrameHeight");

    if not defaultAchievementFrameHeight then
        defaultAchievementFrameHeight = AchievementFrame:GetHeight();
        defaultAchievementFrameMetalBorderHeight = AchievementFrameMetalBorderLeft:GetHeight();
    end
    AchievementFrame:SetHeight(defaultAchievementFrameHeight + offset);
    AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
    AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
end

function gui.ResetAchievementFrameHeight()
    diagnostics.Trace("gui.ResetAchievementFrameHeight");

    if defaultAchievementFrameHeight and defaultAchievementFrameMetalBorderHeight then
        AchievementFrame:SetHeight(defaultAchievementFrameHeight);
        AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight);
        AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight);
    end
end

local function UpdateAchievementFrameHeight(message, offset)
    if gui.SelectedTab then -- Need to check if it exists since this can be triggered before it's created
        gui.AchievementsFrame:Hide();
        gui.CategoriesFrame:Hide();
        gui.SetAchievementFrameHeight(offset);
        gui.AchievementsFrame:Show();
        gui.CategoriesFrame:Show();
    end
end

addon.Event:RegisterMessage("UpdateAchievementFrameHeight", UpdateAchievementFrameHeight);

-- [[ Other ]] --
function gui.GetSafeScrollChildBottom(scrollChild)
	diagnostics.Trace("gui.GetSafeScrollChildBottom");

	return scrollChild:GetBottom() or 0;
end

function gui.ResetView()
	diagnostics.Trace("gui.ResetView");

    if gui.CategoriesFrame and gui.SelectedTab and gui.SelectedTab.Categories then -- Checking ID is to know if the frame is initialised or not
        -- Select the first category
        if gui.SelectedTab.Categories then
            local category = gui.SelectedTab.Categories[1];
            if category.Achievements == nil then
                category = gui.SelectedTab.Categories[2];
            end
            gui.CategoriesFrame:SelectCategory(category, true);
        end
    end

    if gui.Search.SearchBoxFrame and gui.Search.SearchBoxFrame.SearchPreviewFrame then
        gui.Search.SearchBoxFrame:SetText("");
    end

    if gui.Search.FullSearchResultsFrame and gui.Search.FullSearchResultsFrame.Update and gui.Search.FullSearchResultsFrame.Hide then
        gui.Search.FullSearchResultsFrame:Hide();
    end
end

function gui.SelectTab(tabName)
    if addon.Tabs[tabName] ~= nil and addon.Tabs[tabName].Button ~= nil then
        addon.Tabs[tabName].Button:Select();
    end
end

function gui.ToggleAchievementFrame(tabName, resetView, forceOpen) -- Issue #26 Broken, Fix
    diagnostics.Trace("gui.ToggleAchievementFrame");

    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    AchievementFrameComparison:Hide();
    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;

    local tabIsSelected;
    if gui.SelectedTab then
       if gui.SelectedTab.Name == tabName then
        tabIsSelected = true;
       end
    end

	if AchievementFrame:IsShown() and tabIsSelected and not resetView and not forceOpen then
		HideUIPanel(AchievementFrame);
	else
        AchievementFrame_SetTabs();
		ShowUIPanel(AchievementFrame);
        AchievementFrame_HideSearchPreview();
        gui.SelectTab(tabName);
        if addon.Options.db.ResetViewOnOpen or resetView then
            gui.ResetView();
        end
	end
end

function KrowiAF_ToggleAchievementFrame(tabName)
    gui.ToggleAchievementFrame(tabName);
end

function gui.UpdateEventRuntime(self)
    local line1, line2, timeLeft;

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 3 or addon.Options.db.EventReminders.TimeDisplay.Line2 == 4 then -- Time Left
        local secondsLeft = self.Event.EventDetails.EndTime - time();
        local days = floor(secondsLeft / 86400);
        local hours = floor(mod(secondsLeft, 86400) / 3600);
        local minutes = floor(mod(secondsLeft, 3600) / 60);
        local seconds = floor(mod(secondsLeft, 60));
        timeLeft = days > 0 and days .. " Days" or "";
        timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and hours .. " Hr" or "");
        timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and minutes .. " Min" or "");
        timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and seconds .. " Sec" or "");
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 1 then -- Start Time
        line1 = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.StartTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 then -- End Time
        line1 = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 3 then -- Time Left
        line1 = timeLeft;
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.EventReminders.Compact then -- None
        line2 = "";
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 2 then -- Start Time
        line2 = "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.StartTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 then -- End Time
        line2 = "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 4 then -- Time Left
        line2 = "\n" .. timeLeft;
    end

    self.Unlocked:SetText(line1 .. line2);
end

function CreateAchievementPointsTooltip()
    local frame = CreateFrame("Frame", nil, AchievementFrameHeader);
    frame:SetSize(175, 20);
    frame:SetPoint("CENTER", "AchievementFrameHeader", "CENTER", 20, -16);

    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT");
        GameTooltip:SetText(addon.L["Achievement points earned by"]);
        for _, character in next, SavedData.Characters do
            local r, g, b = GetClassColor(character.Class);
            local name = character.Name;
            if addon.Options.db.AchievementPoints.Tooltip.AlwaysShowRealm or character.Realm ~= (select(2, UnitFullName("player"))) then
                name = name .. " - " .. character.Realm;
            end
            GameTooltip:AddDoubleLine(name, tostring(BreakUpLargeNumbers(character.Points)), r, g, b, 1, 1, 1);
        end
        GameTooltip:Show();
    end);

    frame:SetScript("OnLeave", function()
        GameTooltip:Hide();
    end);
end

function gui.ShowHideTabs(_addonName, _tabName)
    if _addonName and _tabName then
        addon.Options.db.Tabs[_addonName][_tabName] = not addon.Options.db.Tabs[_addonName][_tabName];
        if not IsAddOnLoaded(_addonName) then
            return;
        end
    end

    for _addonName, _ in next, addon.Options.db.Tabs do
        for _tabName, _ in next, addon.Options.db.Tabs[_addonName] do
            local id = 1;
            while _G["AchievementFrameTab" .. id] do
                if _G["AchievementFrameTab" .. id].AddonName == _addonName and _G["AchievementFrameTab" .. id].Name == _tabName then
                    if addon.Options.db.Tabs[_addonName][_tabName] then
                        _G["AchievementFrameTab" .. id]:Show();
                    else
                        _G["AchievementFrameTab" .. id]:Hide();
                    end
                end
                id = id + 1;
            end
        end
    end

    local id = 1;
    local prevTab;
    while _G["AchievementFrameTab" .. tostring(id)] do
        if _G["AchievementFrameTab" .. tostring(id)]:IsShown() then
            _G["AchievementFrameTab" .. tostring(id)]:ClearAllPoints();
            if prevTab == nil then
                _G["AchievementFrameTab" .. tostring(id)]:SetPoint("BOTTOMLEFT", AchievementFrame, 11, -30);
            else
                _G["AchievementFrameTab" .. tostring(id)]:SetPoint("LEFT", prevTab, "RIGHT", -5, 0);                
            end
            prevTab = _G["AchievementFrameTab" .. tostring(id)];
        end
        id = id + 1;
    end
end

function gui.AddDataToBlizzardTabs()
    AchievementFrameTab1.AddonName = "Blizzard_AchievementUI";
    AchievementFrameTab1.Name = "Achievements";
    AchievementFrameTab2.AddonName = "Blizzard_AchievementUI";
    AchievementFrameTab2.Name = "Guild";
    AchievementFrameTab3.AddonName = "Blizzard_AchievementUI";
    AchievementFrameTab3.Name = "Statistics";
end