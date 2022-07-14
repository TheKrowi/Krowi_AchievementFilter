-- [[ Namespaces ]] --
local addonName, addon = ...;
local diagnostics = addon.Diagnostics;
addon.GUI = {};
local gui = addon.GUI;
gui.SideButtons = {};
local sideButtons = gui.SideButtons;

gui.Tabs = {};

function gui:LoadWithAddon()
    gui.GameTooltipProgressBar:Load();
    gui.WorldMapButton.Load();
    gui.AlertSystem:Load();
    addon.Filters:InjectDefaults();
end

function gui:LoadWithBlizzard_AchievementUI()
    self.SetAchievementFrameHeight(addon.Options.db.Window.AchievementFrameHeightOffset); -- Do this in order to create the correct amount of buttons based on our settings

    gui.AchievementsFrame:Load();
    addon.GUI.SummaryFrame:Load();
    gui.CategoriesFrame:Load();
    gui.FilterButton:Load();

    gui.Search:Load();
    addon.GUI.Calendar:Load();

    gui.AddDataToBlizzardTabs();

    for _, t in next, addon.TabsOrder do
        addon.Tabs[t].Button = gui.AchievementFrameTabButton:New(addon.Tabs[t].Text, {gui.FilterButton, gui.Search.BoxFrame}, gui.AchievementsFrame, gui.CategoriesFrame, addon.Tabs[t].Categories, addon.Tabs[t].Filters);
        KrowiAF_RegisterTabButton(addonName, addon.Tabs[t].Name, addon.Tabs[t].Button);
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

    gui.AchievementFrameHeader.CreateTooltip();

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
            KrowiAF_SelectCategory(category, true);
        end
    end

    local search = addon.GUI.Search;
    if search.BoxFrame and search.BoxFrame.SearchPreviewFrame then
        search.BoxFrame:SetText("");
    end

    if search.ResultsFrame and search.ResultsFrame.Update and search.ResultsFrame.Hide then
        search.ResultsFrame:Hide();
    end
end

function gui.SelectTab(_addonName, tabName)
    local button = addon.GUI.Tabs[_addonName][tabName];
    if button then
        if button.Select then
            button:Select(); -- Addon tabs
        else
            button:Click(); -- Other tabs
        end
    end
end

function gui.ToggleAchievementFrame(_addonName, tabName, resetView, forceOpen) -- Issue #26 Broken, Fix
    if not IsAddOnLoaded("Blizzard_AchievementUI") then
        LoadAddOn("Blizzard_AchievementUI");
    end

    AchievementFrameComparison:Hide();
    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;

    local tabIsSelected;
    if gui.SelectedTab then
        if gui.SelectedTab == addon.GUI.Tabs[_addonName][tabName] then
            tabIsSelected = true;
        end
    end
    
	if AchievementFrame:IsShown() and tabIsSelected and not resetView and not forceOpen then
		HideUIPanel(AchievementFrame);
	else
        AchievementFrame_SetTabs();
		ShowUIPanel(AchievementFrame);
        AchievementFrame_HideSearchPreview();
        gui.SelectTab(_addonName, tabName);
        if addon.Options.db.ResetViewOnOpen or resetView then
            gui.ResetView();
        end
	end
end

function gui.ShowHideTabs(_addonName, tabName)
    if _addonName and tabName then
        if not addon.Options.db.Tabs[_addonName] or not addon.Options.db.Tabs[_addonName][tabName] then
            return;
        end
        addon.Options.db.Tabs[_addonName][tabName].Show = not addon.Options.db.Tabs[_addonName][tabName].Show;
        if not IsAddOnLoaded(_addonName) or not addon.GUI.Tabs[_addonName] or not addon.GUI.Tabs[_addonName][tabName] then
            return;
        end
    end

    addon.GUI.TabsOrderGetActiveKeys(); -- Cleanup unused tabs

    local tabsOrder = {};
    local button;
    for addonName2, tabs in next, addon.Options.db.Tabs do
        for tabName2, tab in next, tabs do
            if addon.GUI.Tabs[addonName2] then
                button = addon.GUI.Tabs[addonName2][tabName2];
                if button then
                    tabsOrder[tab.Order] = button;
                    if tab.Show then
                        button:Show();
                    else
                        button:Hide();
                    end
                end
            end
        end
    end

    local prevTab;
    for _, btn in next, tabsOrder do
        if btn and btn:IsShown() then
            btn:ClearAllPoints();
            if prevTab == nil then
                btn:SetPoint("BOTTOMLEFT", AchievementFrame, 11, -30);
            else
                btn:SetPoint("LEFT", prevTab, "RIGHT", -5, 0);
            end
            prevTab = btn;
        end
    end
end

function gui.AddDataToBlizzardTabs()
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Achievements", AchievementFrameTab1, function()
        AchievementFrameTab_OnClick(1);
    end);
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Guild", AchievementFrameTab2, function()
        AchievementFrameTab_OnClick(2);
    end);
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Statistics", AchievementFrameTab3, function()
        AchievementFrameTab_OnClick(3);
    end);
end

function gui.PrepareTabsOrder()
    KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Achievements", addon.L["Blizzard"], addon.L["Achievements"], "TOGGLEACHIEVEMENT");
    KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Guild", addon.L["Blizzard"], addon.L["Guild"]);
    KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Statistics", addon.L["Blizzard"], addon.L["Statistics"], "TOGGLESTATISTICS");
end

function gui.ShowStatusBarTooltip(self, anchor)
	GameTooltip:SetOwner(self, anchor or "ANCHOR_NONE");
    if anchor == nil then
	    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", -3, -3);
    end
	GameTooltip:SetMinimumWidth(128, true);
	GameTooltip:SetText(self.name, 1, 1, 1, nil, true);
	local numOfNotObtAch = 0;
	if addon.Options.db.Tooltip.Categories.ShowNotObtainable then
		numOfNotObtAch = self.numOfNotObtAch;
	end

	gui.GameTooltipProgressBar:Show(GameTooltip, 0, self.numAchievements, self.numCompleted, numOfNotObtAch, 0, 0, addon.Colors.GreenRGB, addon.Colors.RedRGB, nil, nil, self.numCompletedText);

	GameTooltip:SetMinimumWidth(140);
    GameTooltip:Show();
end

local needsCleanup = {};
function gui.TabsOrderGetActiveKeys()
    if not needsCleanup then
        return SavedData.TabKeys;
    end

    -- local numTabs = #addon.Options.db.Tabs;
    local tabsOrder = {};
    for tabsAddonName, tabs in next, addon.Options.db.Tabs do
        if tabsAddonName == "Blizzard_AchievementUI" or IsAddOnLoaded(tabsAddonName) then
            for tabName, tab in next, tabs do
                tinsert(tabsOrder, {
                    tabsAddonName,
                    tabName,
                    tab.Order
                });
            end
        else
            addon.Options.db.Tabs[tabsAddonName] = nil;
            for i = #SavedData.Tabs, 1, -1 do
                if SavedData.Tabs[i].AddonName == tabsAddonName then
                    tremove(SavedData.Tabs, i);
                    tremove(SavedData.TabKeys, i);
                end
            end
        end
    end

    -- addon.Diagnostics.DebugTable(tabsOrder);
    sort(tabsOrder, function(a, b)
        return a[3] < b[3];
    end);
    -- addon.Diagnostics.DebugTable(tabsOrder);


    local properIndex = 1;
    for _, order in next, tabsOrder do
        -- print(properIndex, order[1], order[2], addon.Options.db.Tabs[order[2]].Order)
        addon.Options.db.Tabs[order[1]][order[2]].Order = properIndex;
        properIndex = properIndex + 1;
    end

    SavedData.FirstTimeSetUp = SavedData.FirstTimeSetUp or {};

    if not SavedData.FirstTimeSetUp.SwitchAchievementTabs then
        local blizzAchId, addonAchId = 1, 1;
        for i, _ in next, SavedData.Tabs do
            if SavedData.Tabs[i].AddonName == "Blizzard_AchievementUI" and SavedData.Tabs[i].Name == "Achievements" then
                blizzAchId = i;
            end
            if SavedData.Tabs[i].AddonName == addonName and SavedData.Tabs[i].Name == "Achievements" then
                addonAchId = i;
            end
        end
        addon.Options.db.Tabs["Blizzard_AchievementUI"]["Achievements"].Order = addonAchId;
        addon.Options.db.Tabs[addonName]["Achievements"].Order = blizzAchId;
        addon.Options.db.MicroButtonTab = addonAchId;
        local binding = GetBindingByKey("Y");
        if binding == SavedData.Tabs[blizzAchId].BindingName then
            SetBinding("Y", SavedData.Tabs[addonAchId].BindingName);
            SaveBindings(GetCurrentBindingSet());
        end
        SavedData.FirstTimeSetUp.SwitchAchievementTabs = true;
    end

    needsCleanup = nil;
    return SavedData.TabKeys;
end