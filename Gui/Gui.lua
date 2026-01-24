local addonName, addon = ...;
local UpdateAddOnMemoryUsage = _G.UpdateAddOnMemoryUsage;
local GetAddOnMemoryUsage = _G.GetAddOnMemoryUsage;
addon.Gui = {
    Tabs = {},
    SubFrames = {}
};
local gui = addon.Gui;
local unpackSafe = table.unpack or unpack;
local SAMPLE_MEM = false; -- Enable only when you need memory deltas
local function ProfileSection(label, fn, ...)
    local startMem;
    if SAMPLE_MEM and UpdateAddOnMemoryUsage and GetAddOnMemoryUsage then
        UpdateAddOnMemoryUsage();
        startMem = GetAddOnMemoryUsage(addonName);
    end

    local startTime = debugprofilestop();
    local results = {fn(...)};
    local elapsed = debugprofilestop() - startTime;

    local deltaMem;
    if SAMPLE_MEM and startMem then
        UpdateAddOnMemoryUsage();
        deltaMem = (GetAddOnMemoryUsage(addonName) or startMem) - startMem;
    end

    if addon.Diagnostics and addon.Diagnostics.Trace then
        addon.Diagnostics.Trace(string.format("[Profile] %s: %.1f ms%s", label, elapsed, SAMPLE_MEM and string.format(", %+0.1f KB", deltaMem or 0) or ""));
    end

    return unpackSafe(results);
end

local eventReminderSideButtonSystemIsLoaded;
function gui:LoadWithAddon()
    self:OverwriteAdjustAnchors();
    self.WorldMapButton:Load();
    self.EventReminderAlertSystem:Load();
    eventReminderSideButtonSystemIsLoaded = self.EventReminderSideButtonSystem:Load();
    self.FloatingAchievementTooltip:Load();
end

local function ResetAchievementWindowPosition()
    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    KrowiAF_SavedData.RememberLastPosition["AchievementWindow"] = {
        X = 96,
        Y = -116
    };
	addon.Gui:SetFrameToLastPosition(AchievementFrame, "AchievementWindow");
end

local function AddDataToBlizzardTabs()
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Achievements", AchievementFrameTab1, function()
        AchievementFrameTab_OnClick(1);
    end);
    if not addon.Util.IsWrathClassic then
        KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Guild", AchievementFrameTab2, function()
            AchievementFrameTab_OnClick(2);
        end);
    end
    KrowiAF_RegisterTabButton("Blizzard_AchievementUI", "Statistics", addon.Util.IsWrathClassic and AchievementFrameTab2 or AchievementFrameTab3, function()
        AchievementFrameTab_OnClick(addon.Util.IsWrathClassic and 2 or 3);
    end);
end

local function LoadOldAchievementFrameTabsCompatibility()
    if not addon.Util.IsClassicWithAchievements then
        return;
    end

    for _, t in next, addon.TabsOrder do
        addon.Tabs[t].Button.Text = addon.Tabs[t].Button.text;
    end
end

local function LoadOldGuiCompatibility()
    if not AchievementFrameFilterDropdown then
        AchievementFrameFilterDropdown = AchievementFrameFilterDropDown;
    end
end

local function ShowSubFrame(self, ...)
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

local function LoadHooks(self)
    hooksecurefunc("AchievementFrame_ShowSubFrame", function(...)
        ShowSubFrame(self, ...);
    end);

    AchievementFrameComparison:HookScript("OnHide", function()
        if gui.SelectedTab then
            gui:SetAchievementFrameWidth();
            gui:SetAchievementFrameHeight();
        else
            gui:ResetAchievementFrameWidth();
            gui:ResetAchievementFrameHeight();
        end
    end);
end

local defaultAchievementFrameWidth;
local defaultAchievementFrameHeight;
local defaultAchievementFrameMetalBorderHeight;
function gui:LoadWithBlizzard_AchievementUI()
    LoadOldGuiCompatibility();

    defaultAchievementFrameWidth = AchievementFrame:GetWidth();
    defaultAchievementFrameHeight = AchievementFrame:GetHeight();
    defaultAchievementFrameMetalBorderHeight = AchievementFrameMetalBorderLeft:GetHeight();
    self:SetAchievementFrameHeight(); -- Do this in order to create the correct amount of buttons based on our settings

    self.AchievementFrameHeader:Load();
    self.AchievementsObjectives:Load();
    self.CategoriesFrame:Load();
    self.AchievementsFrame:Load();
    self.SummaryFrame:Load();
    self.FilterButton:Load();
    if not eventReminderSideButtonSystemIsLoaded then
        self.EventReminderSideButtonSystem:Load();
    end

    self.Search:Load();
    self.Calendar:Load();
    self.DataManager:Load();
    self.BrowsingHistory:Load();

    AchievementFrame.ResetPosition = ResetAchievementWindowPosition;
	self:SetFrameToLastPosition(AchievementFrame, "AchievementWindow");

    AddDataToBlizzardTabs();

    local media = "Interface/AddOns/Krowi_AchievementFilter/Media/";
    local waterMarks = {
        media .. "kaf_achievements",
        media .. "kaf_expansions",
        media .. "kaf_events",
        media .. "kaf_pvp",
        media .. "kaf_special"
    };
    for i, t in next, addon.TabsOrder do
        addon.Tabs[t].Button = self.AchievementFrameTabButtonFactory:GetNew(t, addon.Tabs[t].Text, {KrowiAF_AchievementFrameFilterButton, KrowiAF_SearchBoxFrame, KrowiAF_CategoriesFrame}, addon.Tabs[t].Categories, addon.Tabs[t].Filters, waterMarks[i]);
        KrowiAF_RegisterTabButton(addonName, addon.Tabs[t].Name, addon.Tabs[t].Button);
    end
    LoadOldAchievementFrameTabsCompatibility();

    self:ResetAchievementFrameHeight();

    self:RegisterFrameForClosing(AchievementFrame);
    LoadHooks(self);
end

function gui:SetAchievementFrameWidth()
    AchievementFrame:SetWidth(defaultAchievementFrameWidth + addon.Options.db.profile.Window.CategoriesFrameWidthOffset + addon.Options.db.profile.Window.AchievementsFrameWidthOffset);
    KrowiAF_CategoriesFrame:SetRightPoint();
end

function gui:ResetAchievementFrameWidth()
    AchievementFrame:SetWidth(defaultAchievementFrameWidth);
end

function gui:SetAchievementFrameHeight()
    local offset = addon.Options.db.profile.Window.AchievementFrameHeightOffset;
    AchievementFrame:SetHeight(defaultAchievementFrameHeight + offset);
    AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
    AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight + offset);
end

function gui:ResetAchievementFrameHeight()
    AchievementFrame:SetHeight(defaultAchievementFrameHeight);
    AchievementFrameMetalBorderLeft:SetHeight(defaultAchievementFrameMetalBorderHeight);
    AchievementFrameMetalBorderRight:SetHeight(defaultAchievementFrameMetalBorderHeight);
end

local function SelectTab(self, _addonName, tabName)
    local button = self.Tabs[_addonName][tabName];
    if button then
        if button.Select then
            button:Select(); -- Addon tabs
        else
            button:Click(); -- Other tabs
        end
    end
end

local resetViewLock;
local function ResetView()
    if resetViewLock then
        return;
    end
    resetViewLock = true;

    if gui.SelectedTab and gui.SelectedTab:GetCategories() then
        local category = gui.SelectedTab.Categories[1];
        KrowiAF_SelectCategory(category, true);
    end

    if KrowiAF_SearchBoxFrame then
        KrowiAF_SearchBoxFrame:SetText("");
    end

    resetViewLock = nil;
end

local firstTimeLatch = true;
local function WrapAchievementFrameOnShowForProfiling()
    local onShow = AchievementFrame:GetScript("OnShow");
    if onShow and not AchievementFrame.KAF_OnShowProfileWrapped then
        AchievementFrame:SetScript("OnShow", function(frame, ...)
            ProfileSection("AchievementFrame:OnShow", onShow, frame, ...);
        end);
        AchievementFrame.KAF_OnShowProfileWrapped = true;
    end
end

local function WrapAchievementFrameShowSubFrame()
    if AchievementFrame_ShowSubFrame and not AchievementFrame.KAF_ShowSubFrameProfileWrapped then
        local orig = AchievementFrame_ShowSubFrame;
        AchievementFrame_ShowSubFrame = function(...)
            return ProfileSection("AchievementFrame:ShowSubFrame", orig, ...);
        end
        AchievementFrame.KAF_ShowSubFrameProfileWrapped = true;
    end
end

function gui:ToggleAchievementFrame(_addonName, tabName, resetView, forceOpen) -- Issue #26 Broken, Fix
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI");
    end

    WrapAchievementFrameOnShowForProfiling();
    WrapAchievementFrameShowSubFrame();

    AchievementFrameComparison:Hide();
    AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick;

    local tabIsSelected;
    if self.SelectedTab then
        if self.SelectedTab == self.Tabs[_addonName][tabName] then
            tabIsSelected = true;
        end
    end

    if (AchievementFrame:IsShown() and ((not addon.Options.db.profile.ResetViewOnOpen and addon.Options.db.profile.ToggleWindow) or tabIsSelected)) and not resetView and not forceOpen then
        AchievementFrame:Hide();
        return;
    end

    AchievementFrame_SetTabs();
    ProfileSection("Toggle:FrameShow", function()
        AchievementFrame:Show();
    end);
    if not addon.Util.IsClassicWithAchievements then
        AchievementFrame_HideSearchPreview();
    end
    if firstTimeLatch or not (not addon.Options.db.profile.ResetViewOnOpen and addon.Options.db.profile.ToggleWindow) or resetView or forceOpen then
        SelectTab(self, _addonName, tabName);
    end
    if addon.Options.db.profile.ResetViewOnOpen or resetView then
        ResetView();
    end
    firstTimeLatch = nil;
end

function gui:UpdateTabsLayout(tabsOrder)
    local prevTab;
    for _, btn in next, tabsOrder do
        if btn and btn:IsShown() then
            btn:ClearAllPoints();
            if prevTab == nil then
                btn:SetPoint("BOTTOMLEFT", AchievementFrame, 11, -30);
            else
                btn:SetPoint("LEFT", prevTab, "RIGHT", -5 + addon.Options.db.profile.TabsGeneral.Spacing, 0);
            end
            prevTab = btn;
        end
    end
end

function gui:ShowHideTabs(_addonName, tabName)
    if _addonName and tabName then
        if not addon.Options.db.profile.Tabs[_addonName] or not addon.Options.db.profile.Tabs[_addonName][tabName] then
            return;
        end
        addon.Options.db.profile.Tabs[_addonName][tabName].Show = not addon.Options.db.profile.Tabs[_addonName][tabName].Show;
        if not C_AddOns.IsAddOnLoaded(_addonName) or not addon.Gui.Tabs[_addonName] or not addon.Gui.Tabs[_addonName][tabName] then
            return;
        end
    end

    self:TabsOrderGetActiveKeys(); -- Cleanup unused tabs

    local tabsOrder = {};
    local button;
    for addonName2, tabs in next, addon.Options.db.profile.Tabs do
        for tabName2, tab in next, tabs do
            if addon.Gui.Tabs[addonName2] then
                button = addon.Gui.Tabs[addonName2][tabName2];
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

    self:UpdateTabsLayout(tabsOrder);
end

function gui.ShowStatusBarTooltip(frame, anchor, extraText, color) -- . instead of : because it needs to work for the frame
	GameTooltip:SetOwner(frame, anchor or "ANCHOR_NONE");
    if anchor == nil then
	    GameTooltip:SetPoint("TOPLEFT", frame, "TOPRIGHT", -3, -3);
    end
	GameTooltip:SetMinimumWidth(128, true);
    GameTooltip_SetTitle(GameTooltip, frame.Text);

    local text = "";
    local numOfNotObtAch = frame.NumOfNotObtAch;
	if numOfNotObtAch > 0 and addon.Options.db.profile.Tooltip.Categories.ShowNotObtainable then
		text = " (+" .. numOfNotObtAch .. ")";
    else
        numOfNotObtAch = 0;
	end
	text = frame.NumOfCompAch .. text .. " / " .. frame.NumOfAch;

    addon.ProgressBarLib.GameTooltipWithProgressBar:Show(GameTooltip, 0, frame.NumOfAch, frame.NumOfCompAch, numOfNotObtAch, 0, 0, addon.Util.Colors.GreenRGB, addon.Util.Colors.RedRGB, nil, nil, text);

    if extraText then
        GameTooltip_AddBlankLineToTooltip(GameTooltip);
        GameTooltip_AddColoredLine(GameTooltip, extraText, color or NORMAL_FONT_COLOR);
    end

	GameTooltip:SetMinimumWidth(140);
    GameTooltip:Show();
end

local function AssignProperTabsOrder()
    local tabsOrder = {};
    for tabsAddonName, tabs in next, addon.Options.db.profile.Tabs do
        if tabsAddonName == "Blizzard_AchievementUI" or C_AddOns.IsAddOnLoaded(tabsAddonName) then
            for tabName, tab in next, tabs do
                tinsert(tabsOrder, {
                    AddonName = tabsAddonName,
                    TabName = tabName,
                    Order = tab.Order
                });
            end
        else
            addon.Options.db.profile.Tabs[tabsAddonName] = nil;
            for i = #KrowiAF_SavedData.Tabs, 1, -1 do
                if KrowiAF_SavedData.Tabs[i].AddonName == tabsAddonName then
                    tremove(KrowiAF_SavedData.Tabs, i);
                    tremove(KrowiAF_SavedData.TabKeys, i);
                end
            end
        end
    end

    sort(tabsOrder, function(a, b)
        return a.Order < b.Order;
    end);

    local properIndex = 1;
    for _, order in next, tabsOrder do
        addon.Options.db.profile.Tabs[order.AddonName][order.TabName].Order = properIndex;
        properIndex = properIndex + 1;
    end

    return tabsOrder;
end

local function SwitchAchievementTabs()
    local blizzAchId, addonAchId = 1, 1;
    for i, _ in next, KrowiAF_SavedData.Tabs do
        if KrowiAF_SavedData.Tabs[i].AddonName == "Blizzard_AchievementUI" and KrowiAF_SavedData.Tabs[i].Name == "Achievements" then
            blizzAchId = i;
        end
        if KrowiAF_SavedData.Tabs[i].AddonName == addonName and KrowiAF_SavedData.Tabs[i].Name == "Achievements" then
            addonAchId = i;
        end
    end
    addon.Options.db.profile.Tabs["Blizzard_AchievementUI"]["Achievements"].Order = addonAchId;
    addon.Options.db.profile.Tabs[addonName]["Achievements"].Order = blizzAchId;
    addon.Options.db.profile.MicroButtonTab = addonAchId;
    local binding = GetBindingByKey("Y");
    if binding == KrowiAF_SavedData.Tabs[blizzAchId].BindingName then
        SetBinding("Y", KrowiAF_SavedData.Tabs[addonAchId].BindingName);
        SaveBindings(GetCurrentBindingSet());
    end
end

local function SafeSwitchAchievementTabs()
    local success, err = pcall(SwitchAchievementTabs);
    if not success then
        print("Error switching achievement tabs: " .. err);
    end
end

local needsCleanup = true;
function gui:TabsOrderGetActiveKeys()
    if not needsCleanup then
        return KrowiAF_SavedData.TabKeys;
    end

    AssignProperTabsOrder();

    KrowiAF_SavedData.FirstTimeSetUp = KrowiAF_SavedData.FirstTimeSetUp or {};

    if not KrowiAF_SavedData.FirstTimeSetUp.AchievementTabsSwitched then
        SafeSwitchAchievementTabs();
        KrowiAF_SavedData.FirstTimeSetUp.AchievementTabsSwitched = true;
    end

    needsCleanup = nil;
    return KrowiAF_SavedData.TabKeys;
end

function gui:SetFrameToLastPosition(frame, rememberLastPositionOption)
    if not frame or not frame.ClearAllPoints then -- frame does not exist yet
        return;
    end

    KrowiAF_SavedData.RememberLastPosition = KrowiAF_SavedData.RememberLastPosition or {};
    if not KrowiAF_SavedData.RememberLastPosition[rememberLastPositionOption] then
        frame:ResetPosition();
        return;
    end

    local pos = KrowiAF_SavedData.RememberLastPosition[rememberLastPositionOption];
	frame:ClearAllPoints();
	frame:SetPoint(pos.Point or "TOPLEFT", pos.X, pos.Y);
end

function gui:RefreshView()
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters.Refresh = true;
    end
    KrowiAF_CategoriesFrame:Update();
    KrowiAF_AchievementsFrame:ForceUpdate();
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow();
end

function gui:RefreshViewAfterPlayerLogin()
    AchievementFrame.Header.Points:SetText();
    local selectedTab = addon.Gui.SelectedTab;
    selectedTab.SelectedCategory = nil;
    selectedTab:ShowSubFrames();
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow();
end

function gui:RegisterFrameForClosing(frame)
    frame:HookScript("OnShow", function()
        KrowiAF_SpecialFrame:Show();
    end);
end

local function AdjustQueuedAnchors(self, relativeAlert)
	for alertFrame in self.alertFramePool:EnumerateActive() do
		alertFrame:ClearAllPoints()
		alertFrame:SetPoint(KrowiAF_SavedData.AlertSystem.GrowDirection.Point, relativeAlert, KrowiAF_SavedData.AlertSystem.GrowDirection.RelativePoint, 0, KrowiAF_SavedData.AlertSystem.GrowDirection.Offset)
		relativeAlert = alertFrame
	end
	return relativeAlert
end

-- Credits to ElvUI
local function OverwriteAdjustAnchors(alertFrameSubSystem)
	if alertFrameSubSystem.alertFramePool then -- Queued alert system
		alertFrameSubSystem.AdjustAnchors = AdjustQueuedAnchors;
	end
end

function gui:OverwriteAdjustAnchors()
     -- Credits to ElvUI for this for loop
    -- Overwrites AdjustAnchors functions to allow alerts to grow down if needed.
	for _, alertFrameSubSystem in ipairs(AlertFrame.alertFrameSubSystems) do
		OverwriteAdjustAnchors(alertFrameSubSystem)
	end

    -- Credits to ElvUI for this hook
	-- This should catch any alert systems that are created by other addons.
	hooksecurefunc(AlertFrame, 'AddAlertFrameSubSystem', function(_, alertFrameSubSystem)
		OverwriteAdjustAnchors(alertFrameSubSystem);
	end);
end