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
    addon.GUI.AchievementFrameHeader.InjectOptions();
end

local defaultAchievementFrameWidth;
local defaultAchievementFrameHeight;
local defaultAchievementFrameMetalBorderHeight;
function gui:LoadWithBlizzard_AchievementUI()
    addon.GUI.AchievementFrameHeader:Load();

    self.LoadWrathClassicAchievementFrameChanges();
    self.LoadOldAchievementFrameCompatibility();

    defaultAchievementFrameWidth = AchievementFrame:GetWidth();
    defaultAchievementFrameHeight = AchievementFrame:GetHeight();
    defaultAchievementFrameMetalBorderHeight = AchievementFrameMetalBorderLeft:GetHeight();
    self.SetAchievementFrameHeight(); -- Do this in order to create the correct amount of buttons based on our settings

    addon.GUI.AchievementsObjectives:Load();
    gui.AchievementsFrame:Load();
    addon.GUI.SummaryFrame:Load();
    gui.CategoriesFrame:Load();
    gui.FilterButton:Load();

    gui.Search:Load();
    addon.GUI.Calendar:Load();
    addon.GUI.DataManagerFrame:Load();
    AchievementFrame.ResetPosition = addon.GUI.ResetAchievementWindowPosition;
	addon.GUI.SetFrameToLastPosition(AchievementFrame, "AchievementWindow");

    gui.AddDataToBlizzardTabs();

    local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
    local waterMarks = {
        media .. "kaf_achievements",
        media .. "kaf_expansions",
        media .. "kaf_events",
        media .. "kaf_pvp",
        media .. "kaf_special"
    };
    for i, t in next, addon.TabsOrder do
        addon.Tabs[t].Button = gui.AchievementFrameTabButton:New(addon.Tabs[t].Text, {gui.FilterButton, gui.Search.BoxFrame, gui.CategoriesFrame}, addon.Tabs[t].Categories, addon.Tabs[t].Filters, waterMarks[i]);
        KrowiAF_RegisterTabButton(addonName, addon.Tabs[t].Name, addon.Tabs[t].Button);
    end
    self.LoadOldAchievementFrameTabsCompatibility();

    local activeCalendarEvents = addon.EventData.GetActiveCalendarEvents();

    for _, activeEvent in next, activeCalendarEvents do
        tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    end

    local activeWorldEvents = addon.EventData.GetActiveWorldEvents();

    for _, activeEvent in next, activeWorldEvents do
        tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    end

    -- local activeWidgetEvents = addon.EventData.GetActiveWidgetEvents();

    -- for _, activeEvent in next, activeWidgetEvents do
    --     tinsert(sideButtons, gui.SideButton:New(activeEvent, sideButtons));
    -- end

    self.ResetAchievementFrameHeight();

    gui.AchievementFrameHeader.CreateTooltip();

    self.SetCloseButtonOnKeyDown();
    self:HookShowSubFrame();
    self.HookBaseTabOnClick();

    diagnostics.Debug("GUI loaded");
end

function gui:HookShowSubFrame()
    hooksecurefunc("AchievementFrame_ShowSubFrame", function(...)
        self:ShowSubFrame(...);
    end);
end

function gui.HookBaseTabOnClick()
    if addon.IsWrathClassic then
        return;
    end
    hooksecurefunc("AchievementFrameBaseTab_OnClick", function(tabIndex)
        -- print("AchievementFrameBaseTab_OnClick")
        if tabIndex == 3 then
            AchievementFrame_RefreshView();
        end
    end);
end

gui.SubFrames = {};
function gui:ShowSubFrame(...)
    local show;
	for _, subFrame in ipairs(self.SubFrames) do
		show = false;
		for i = 1, select("#", ...) do
			if subFrame == select(i, ...) then
				show = true;
				break;
			end
		end
		subFrame:SetShown(show);
	end
end

function gui.ResetAchievementWindowPosition()
    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    SavedData.RememberLastPosition["AchievementWindow"] = {
        X = 96,
        Y = -116
    };
	addon.GUI.SetFrameToLastPosition(AchievementFrame, "AchievementWindow");
end

function gui.SetCloseButtonOnKeyDown()
    AchievementFrameCloseButton:SetScript("OnKeyDown", function(selfFunc, key)
        if key == GetBindingKey("TOGGLEGAMEMENU") then
            if selfFunc:GetParent():IsShown() then
                selfFunc:GetParent():Hide();
                selfFunc:SetPropagateKeyboardInput(false);
                return;
            end
        end
        selfFunc:SetPropagateKeyboardInput(true);
    end);
end

-- [[ AchievementFrame Width ]] --

function gui.SetAchievementFrameWidth()
    AchievementFrame:SetWidth(defaultAchievementFrameWidth + addon.Options.db.Window.CategoriesFrameWidthOffset);
end

function gui.ResetAchievementFrameWidth()
    AchievementFrame:SetWidth(defaultAchievementFrameWidth);
end

-- [[ AchievementFrame Height ]] --

function gui.SetAchievementFrameHeight()
    local offset = addon.Options.db.Window.AchievementFrameHeightOffset;
    AchievementFrame:SetHeight(defaultAchievementFrameHeight + offset);
    AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
    AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
end

function gui.ResetAchievementFrameHeight()
    AchievementFrame:SetHeight(defaultAchievementFrameHeight);
    AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight);
    AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight);
end

-- [[ Other ]] --
function gui.GetSafeScrollChildBottom(scrollChild)
	return scrollChild:GetBottom() or 0;
end

local resetViewLock;
local function ResetView()
    if resetViewLock then
        return;
    end
    resetViewLock = true;

    if gui.SelectedTab and gui.SelectedTab.Categories then
        local category = gui.SelectedTab.Categories[1];
        KrowiAF_SelectCategory(category, true);
    end

    local search = addon.GUI.Search;
    if search.BoxFrame and search.BoxFrame.SearchPreviewFrame then
        search.BoxFrame:SetText("");
    end

    if search.ResultsFrame and search.ResultsFrame.Update and search.ResultsFrame.Hide then
        search.ResultsFrame:Hide();
    end

    resetViewLock = nil;
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

    -- if addon.IsDragonflightRetail then
    --     ClearSelectedCategories();
    -- end

    AchievementFrameComparison:Hide();
    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;

    local tabIsSelected;
    if gui.SelectedTab then
        if gui.SelectedTab == addon.GUI.Tabs[_addonName][tabName] then
            tabIsSelected = true;
        end
    end

	if AchievementFrame:IsShown() and tabIsSelected and not resetView and not forceOpen then
        AchievementFrame:Hide();
	else
        -- if not addon.IsWrathClassic then
            AchievementFrame_SetTabs();
        -- else
        --     addon.GUI.ShowHideTabs();
        -- end
        AchievementFrame:Show();
        if not addon.IsWrathClassic then
            AchievementFrame_HideSearchPreview();
        end
        gui.SelectTab(_addonName, tabName);
        if addon.Options.db.ResetViewOnOpen or resetView then
            ResetView();
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
                btn:SetPoint("LEFT", prevTab, "RIGHT", -5 + addon.Options.db.TabsGeneral.Spacing, 0);
            end
            prevTab = btn;
        end
    end
end

function gui.AddDataToBlizzardTabs()
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Achievements", AchievementFrameTab1, function()
        AchievementFrameTab_OnClick(1);
    end);
    if not addon.IsWrathClassic then
        KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Guild", AchievementFrameTab2, function()
            AchievementFrameTab_OnClick(2);
        end);
    end
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Statistics", addon.IsWrathClassic and AchievementFrameTab2 or AchievementFrameTab3, function()
        AchievementFrameTab_OnClick(addon.IsWrathClassic and 2 or 3);
    end);
end

function gui.PrepareTabsOrder()
    KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Achievements", addon.L["Blizzard"], addon.L["Achievements"], "TOGGLEACHIEVEMENT");
    if not addon.IsWrathClassic then
        KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Guild", addon.L["Blizzard"], addon.L["Guild"]);
    else
        addon.Options.Defaults.profile.Tabs.Blizzard_AchievementUI.Guild = nil;
    end
    KrowiAF_RegisterTabOptions("Blizzard_AchievementUI", "Statistics", addon.L["Blizzard"], addon.L["Statistics"], "TOGGLESTATISTICS");
end

function gui.ShowStatusBarTooltip(self, anchor)
	GameTooltip:SetOwner(self, anchor or "ANCHOR_NONE");
    if anchor == nil then
	    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT", -3, -3);
    end
	GameTooltip:SetMinimumWidth(128, true);
	GameTooltip:SetText(self.Text, 1, 1, 1, nil, true);


    local text = "";
    local numOfNotObtAch = self.NumOfNotObtAch;
	if numOfNotObtAch > 0 and addon.Options.db.Tooltip.Categories.ShowNotObtainable then
		text = " (+" .. numOfNotObtAch .. ")";
    else
        numOfNotObtAch = 0;
	end
	text = self.NumOfCompAch .. text .. " / " .. self.NumOfAch;

	gui.GameTooltipProgressBar:Show(GameTooltip, 0, self.NumOfAch, self.NumOfCompAch, numOfNotObtAch, 0, 0, addon.Colors.GreenRGB, addon.Colors.RedRGB, nil, nil, text);

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

function gui.LoadWrathClassicAchievementFrameChanges()
    if not addon.IsWrathClassic then
        return;
    end
    -- if AchievementFrame_SetTabs == nil then
    --     AchievementFrame_SetTabs = function() end;
    -- end
    if AchievementMeta_OnLeave == nil then
        AchievementMeta_OnLeave = function(self)
            GameTooltip:Hide();
            -- guildMemberRequestFrame = nil;
        end
    end
end

function gui.LoadOldAchievementFrameCompatibility()
    if not addon.IsWrathClassic and not addon.IsShadowlandsRetail then
        return;
    end

    AchievementFrame.Header = AchievementFrameHeader;
    AchievementFrame.Header.RightDDLInset = AchievementFrameHeaderRightDDLInset;
    AchievementFrame.Header.PointBorder = AchievementFrameHeaderPointBorder;
    AchievementFrame.Header.Points = AchievementFrameHeaderPoints;
    AchievementFrame.Header.Title = AchievementFrameHeaderTitle;
	AchievementFrame.Header.LeftDDLInset = AchievementFrameHeaderLeftDDLInset;

    if addon.IsShadowlandsRetail then
        AchievementFrame.SearchBox = AchievementFrame.searchBox;
    end
end

function gui.LoadOldAchievementFrameTabsCompatibility()
    if not addon.IsWrathClassic and not addon.IsShadowlandsRetail then
        return;
    end

    for i, t in next, addon.TabsOrder do
        addon.Tabs[t].Button.Text = addon.Tabs[t].Button.text;
    end
end

function gui.SetFrameToLastPosition(frame, rememberLastPositionOption)
    if not frame or not frame.ClearAllPoints then -- frame does not exist yet
        return;
    end

    SavedData.RememberLastPosition = SavedData.RememberLastPosition or {};
    if not SavedData.RememberLastPosition[rememberLastPositionOption] then
        frame:ResetPosition();
        return;
    end

    local pos = SavedData.RememberLastPosition[rememberLastPositionOption];
	frame:ClearAllPoints();
	frame:SetPoint("TOPLEFT", pos.X, pos.Y);
end

function gui.RefreshView()
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters.Refresh = true;
    end
    addon.GUI.CategoriesFrame:Update();
    addon.GUI.AchievementsFrame:ForceUpdate();
end