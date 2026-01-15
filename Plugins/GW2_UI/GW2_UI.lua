-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from GW2_UI to make it compatible with their skin.

local addonName, addon = ...;
local gw2 = {};
KrowiAF.PluginsApi:RegisterPlugin("GW2_UI", gw2);
KrowiAF.PluginsApi:RegisterEvent("PLAYER_LOGIN");

local function IsLoaded()
    if not GW2_ADDON then
        return false;
    end
    if not C_AddOns.IsAddOnLoaded("GW2_UI") then
        return false;
    end
    if not addon.Util.IsMainline then -- No Wrath Classic support for now
        return false;
    end
    if C_AddOns.GetAddOnMetadata("GW2_UI", "Version") == "@project-version@" then
        return true;
    end

    local versionComponents = strsplittable(".", C_AddOns.GetAddOnMetadata("GW2_UI", "Version"));
    local referenceComponents = strsplittable(".", "6.6.1");

    local i = 1;
    while i <= #versionComponents and i <= #referenceComponents do
        local versionComponent = tonumber(versionComponents[i]);
        local referenceComponent = tonumber(referenceComponents[i]);

        if versionComponent > referenceComponent then
            return true;
        elseif versionComponent < referenceComponent then
            return false;
        end

        i = i + 1;
    end
end

local doSkin;

-- [[ ScrollBars ]]
function HandleScrollBar(self)
    self:SetWidth(20);

    self.Back:SetSize(12, 12);
    local bgBack = self.Back:CreateTexture(nil, "BACKGROUND", nil, 0);
    bgBack:ClearAllPoints();
    bgBack:SetPoint("TOPLEFT", 0, 0);
    bgBack:SetPoint("BOTTOMRIGHT", 0, 0);
    bgBack:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbutton");

    self.Forward:SetSize(12, 12);
    local bgForward = self.Forward:CreateTexture(nil, "BACKGROUND", nil, 0);
    bgForward:ClearAllPoints();
    bgForward:SetPoint("TOPLEFT", 0, 0);
    bgForward:SetPoint("BOTTOMRIGHT", 0, 0);
    bgForward:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbutton");
    bgForward:SetTexCoord(0, 1, 1, 0);

    local track = self.Track;
    track:ClearAllPoints();
    track:SetPoint("TOPLEFT", self.Back, "BOTTOMLEFT", 0, 0);
    track:SetPoint("BOTTOMRIGHT", self.Forward, "TOPRIGHT", 0, 0);
    local backdrop = self.Track.Thumb.backdrop;
    if backdrop then
        backdrop:ClearAllPoints();
        backdrop:SetPoint("TOP", 0, -1);
        backdrop:SetPoint("BOTTOM", 0, 1);
        backdrop:SetWidth(12);
    end

    local bgTrack = track:CreateTexture(nil, "BACKGROUND", nil, 0);
    bgTrack:ClearAllPoints();
    bgTrack:SetPoint("TOP", 0, 0);
    bgTrack:SetPoint("BOTTOM", 0, 0);
    bgTrack:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbg");
end

-- [[ Tabs ]]
local function UpdateTabsLayout(_, tabsOrder)
    local x = 0;
    for _, btn in next, tabsOrder do
        if btn and btn:IsShown() then
            btn:ClearAllPoints();
            btn:SetPoint("TOPRIGHT", AchivementFrameLeftPanel, "TOPLEFT", 1, -32 + (-40 * x));
            btn:SetParent(AchivementFrameLeftPanel);
            x = x + 1;
        end
    end
end

local function SkinTabs()
    for _addonName, addonTabs in next, addon.Gui.Tabs do
        for _, tab in next, addonTabs do
            if _addonName == addonName then
                tab.skinned = true;
                tab:GwStripTextures();
                tab:SetSize(64, 40);
                -- tab.Text:Hide(); -- Keep showing the text till we have custom icons

                tab.icon = tab:CreateTexture("icon", "BACKGROUND", nil, 0);
                tab.icon:SetAllPoints();
                tab.icon:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/tabicon_achievement");
                tab.icon:SetTexCoord(0.5, 1, 0, 0.625);
            end
            tab:SetScript("OnShow", function(self)
            end);

            hooksecurefunc(addon.Gui.AchievementFrameTabButtonFactory, "AchievementFrame_UpdateTabs", function(selfFunc, clickedTabId)
                for id, tab2 in next, selfFunc:GetTabs() do
                    if clickedTabId == id then
                        tab2.icon:SetTexCoord(0, 0.5, 0, 0.625);
                    else
                        tab2.icon:SetTexCoord(0.5, 1, 0, 0.625);
                    end
                end
            end);
        end
    end

    addon.Gui.UpdateTabsLayout = UpdateTabsLayout;

    hooksecurefunc("PanelTemplates_UpdateTabs", function()
        addon.Gui:ShowHideTabs();
    end);
    hooksecurefunc("AchievementFrame_DisplayComparison", function()
        addon.Gui:ShowHideTabs();
    end);
    hooksecurefunc("AchievementFrame_ToggleAchievementFrame", function()
        addon.Gui:ShowHideTabs();
    end);
    AchievementFrame:HookScript("OnShow", function()
        addon.Gui:ShowHideTabs();
    end);
end

-- [[ Categories ]]
local function SkinCategoryButton(button)
    button:GwStripTextures();
    button:SetHeight(36);
    button:SetPoint("LEFT", 2, 0);

    button.BackgroundMid:SetTexture("Interface/AddOns/GW2_UI/textures/character/menu-bg");
    button.BackgroundMid:ClearAllPoints();
    button.BackgroundMid:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.BackgroundMid:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0);

    local arrow = button:CreateTexture("bg", "BACKGROUND", nil, 0);
    button.arrow = arrow;
    button.arrow:ClearAllPoints();
    button.arrow:SetPoint("LEFT", 10, 0);
    button.arrow:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrow_right");
    button.arrow:SetSize(16, 16);

    button.Label:SetTextColor(255 / 255, 241 / 255, 209 / 255);
    button.Label:SetShadowColor(0, 0, 0, 0);
    button.Label:SetShadowOffset(1, -1);
    button.Label:SetFont(DAMAGE_TEXT_FONT, 14);
    button.Label:SetJustifyH("LEFT");
    button.Label:SetJustifyV("MIDDLE");

    button:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/character/menu-hover");
    local hl = button:GetHighlightTexture();
    hl:SetVertexColor(0.8, 0.8, 0.8, 0.8);
    hl:GwSetInside(button.BackgroundMid);
    button:HookScript("OnEnter", function(self)
        GW2_ADDON.TriggerButtonHoverAnimation(self, hl);
    end);
end

local function OnCategoriesFrameViewAcquiredFrame(_, frame, _, new)
    if not new then
        return;
    end
    SkinCategoryButton(frame);
end

local function SetCategory(self, category)
    if not category then
        return;
    end

    local children = category.Children;
    self.Label:SetText(category.Name);
    self.Label:SetPoint("LEFT", self, "LEFT", 25, 0);
    self.arrow:Hide();
    if children and #children > 0 and category.ShowCollapseIcon then
        self.arrow:Show();
        self.arrow:SetRotation(category.NotCollapsed and -1.5707 or 0);
    end

    -- Summary and Watch List
    local iconTexture = "Interface/AddOns/GW2_UI/textures/uistuff/arrow_right";
    if category.IsSummary or category.IsWatchList then
        iconTexture = category.IsWatchList and "Interface/AddOns/GW2_UI/textures/uistuff/watchicon" or "Interface/AddOns/GW2_UI/textures/uistuff/hamburger";
        self.arrow:SetTexture(iconTexture);
        self.arrow:SetSize(25, 25);
        self.arrow:Show();
        self.arrow:SetRotation(0);
        self.Label:SetPoint("LEFT", self, "LEFT", 40, 0);
    end
    self.arrow:SetTexture(iconTexture);
end

local function UpdateCategoryState(button, index)
    if not button.Category then
        return;
    end

    local zebra = (index % 2) == 1 or false;
    if zebra then
        button.BackgroundMid:SetVertexColor(1, 1, 1, 1);
    else
        button.BackgroundMid:SetVertexColor(0, 0, 0, 0);
    end
end

local function OnCategoriesFrameViewInitializedFrame(_, frame, elementData)
    SetCategory(frame, elementData);
    UpdateCategoryState(frame, frame:GetOrderIndex());
end

local function SkinCategoriesFrame()
    -- Frame
    KrowiAF_CategoriesFrame:GwStripTextures();

    -- Buttons
    KrowiAF_CategoriesFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnCategoriesFrameViewAcquiredFrame, KrowiAF_CategoriesFrame);
    KrowiAF_CategoriesFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnInitializedFrame, OnCategoriesFrameViewInitializedFrame, KrowiAF_CategoriesFrame);
    KrowiAF_CategoriesFrame.ScrollView:SetElementExtent(36);

    -- Scrollbar
    GW2_ADDON.HandleTrimScrollBar(KrowiAF_CategoriesFrame.ScrollBar);
    HandleScrollBar(KrowiAF_CategoriesFrame.ScrollBar);
end

--[[ GameTooltipProgressBar ]]
local function SkinGameTooltipProgressBar()
    local progressBar = addon.ProgressBarLib.GameTooltipWithProgressBar.ProgressBar;
    progressBar.BorderLeftTop:GwStripTextures();
    progressBar.BorderLeftMiddle:GwStripTextures();
    progressBar.BorderLeftBottom:GwStripTextures();
    progressBar.BorderRightTop:GwStripTextures();
    progressBar.BorderRightMiddle:GwStripTextures();
    progressBar.BorderRightBottom:GwStripTextures();
    progressBar.BorderMiddleTop:GwStripTextures();
    progressBar.BorderMiddleMiddle:GwStripTextures();
    progressBar.BorderMiddleBottom:GwStripTextures();
    progressBar.Background:Hide();
    local fills = progressBar.Fill;
    for _, fill in next, fills do
        fill:SetTexture("Interface/Addons/GW2_UI/textures/uistuff/gwstatusbar");
    end
    progressBar:GwCreateBackdrop(GW2_ADDON.constBackdropFrameColorBorder, true);
    progressBar.backdrop:SetPoint("TOPLEFT", 6, -5);
    progressBar.backdrop:SetPoint("BOTTOMRIGHT", -6, 5);
    progressBar.backdrop:SetBackdropBorderColor(0, 0, 0, 1);
    progressBar:SetColors({R = 33 / 255, G = 116 / 255, B = 66 / 255}, {R = 162 / 255, G = 17 / 255, B = 11 / 255});
end

-- [[ Achievements]]
local buttonOffset = 5;
local function CollapseAchievement(self)
    if not self.Achievement then
        return;
    end

    if self.Completed then
        self.Tracked:Hide();
        self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -5, 7 + buttonOffset);
        self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 7 + buttonOffset);
        self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooternotrack");
    else
        self.Tracked:Show();
        self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -50, 7 + buttonOffset);
        self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 7 + buttonOffset);
        self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooter");
    end
end

local function ExpandAchievement(self)
    if not self.Achievement then
        return;
    end

    local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe, _ = addon.GetAchievementInfo(self.Achievement.Id);
    if not completed or not wasEarnedByMe then
        self.Tracked:Show();
        self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -50, 7 + buttonOffset);
        self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 7 + buttonOffset);
        self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooter");
    else
        self.Tracked:Hide();
        self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -5, 7 + buttonOffset);
        self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 7 + buttonOffset);
        self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooternotrack");
    end
end

local function SkinAchievementButton(button)
    local scaling = button.Compact and 0.712 or 1;

    -- Hide unnecessary base objects
    button:GwStripTextures();
    button.Background:Hide();
    button.HeaderBackground:Hide();
    button.BottomLeftTsunami:Hide();
    button.BottomRightTsunami:Hide();
    button.TopLeftTsunami:Hide();
    button.TopRightTsunami:Hide();
    button.BottomTsunami:Hide();
    button.TopTsunami:Hide();

    -- Set new height
    button:SetHeight(125 * scaling);
    button.CollapsedHeight = 125 * scaling;
    button.MinExpandedHeight = 125 - 30; -- 30 is the bottom bar

    -- Skin RightClickMenuButton if it exists
    if button.RightClickMenuButton then
        button.RightClickMenuButton:SetNormalTexture("Interface/AddOns/GW2_UI/Textures/uistuff/arrowdown_up");
        button.RightClickMenuButton:GetNormalTexture():SetTexCoord(0, 1, 0, 1);
        button.RightClickMenuButton:SetPushedTexture("Interface/AddOns/GW2_UI/Textures/uistuff/arrowdown_down");
        button.RightClickMenuButton:GetPushedTexture():SetTexCoord(0, 1, 0, 1);
    end

    -- Add a new background for the shield and points
    button.cBackground = button:CreateTexture("cBackground", "BACKGROUND", nil, 2);
    button.cBackground:ClearAllPoints();
    button.cBackground:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.cBackground:SetSize(button:GetHeight() - buttonOffset, button:GetHeight() - buttonOffset);
    button.cBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/statusbar");
    button.cBackground:SetVertexColor(1, 1, 1, 0.4);

    -- Highlight if the achievement is tracked
    button.trackBackground = button:CreateTexture("trackBackground", "BACKGROUND", nil, 1);
    button.trackBackground:ClearAllPoints();
    button.trackBackground:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);
    button.trackBackground:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.trackBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfootertracked");

    -- Backdrop
    button.gwBackdrop = CreateFrame("Frame", nil, button, "GwDarkInsetBorder");
    button.gwBackdrop:ClearAllPoints();
    button.gwBackdrop:SetPoint("TOPLEFT");
    button.gwBackdrop:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);

    -- Reskin header
    button.Header:ClearAllPoints();
    button.Header:SetPoint("TOPLEFT", button.cBackground, "TOPRIGHT", 20, 0);
    button.Header:SetPoint("TOPRIGHT", button, "TOPRIGHT", -20, 0);
    button.Header:SetHeight(30);
    GW2_ADDON.AchievementFrameSkinFunction.SetTitleText(button.Header);
    button.Header:SetJustifyH("LEFT");

    -- Reskin description
    button.Description:ClearAllPoints();
    button.Description:SetPoint("TOPLEFT", button.Header, "BOTTOMLEFT", 0, -5);
    button.Description:SetPoint("TOPRIGHT", button.Header, "BOTTOMRIGHT", 0, -5);
    button.Description:SetJustifyH("LEFT");
    if not button.Compact then
        button.Description:SetHeight(40);
    end
    hooksecurefunc(button.Description, "SetTextColor", function(self, r, g, b)
        if r == 0 and g == 0 and b == 0 then
            self:SetTextColor(1, 1, 1);
        end
    end);
    GW2_ADDON.AchievementFrameSkinFunction.SetNormalText(button.Description);

    -- Add a new reward icon
    button.rewardIcon = button:CreateTexture("rewardIcon", "BORDER", nil, 0);
    button.rewardIcon:ClearAllPoints();
    button.rewardIcon:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 125, 3 + buttonOffset);
    button.rewardIcon:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/rewardchestsmall");
    button.rewardIcon:SetSize(24, 24);
    hooksecurefunc(button.Reward, "Hide", function(self)
        self:GetParent().rewardIcon:Hide();
    end);
    hooksecurefunc(button.Reward, "Show", function(self)
        self:GetParent().rewardIcon:Show();
    end);
    if not button.Reward:IsShown() then
    button.rewardIcon:Hide();
    end

    -- Reskin reward text
    button.Reward:ClearAllPoints();
    button.Reward:SetPoint("BOTTOMLEFT", button.rewardIcon, "BOTTOMRIGHT", 5, 5);
    button.Reward:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 5);
    button.Reward:SetJustifyH("LEFT");
    button.Reward:SetHeight(15);
    GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(button.Reward);

    -- Reskin hidden description text
    button.HiddenDescription:SetPoint("TOPLEFT", button.Header, "BOTTOMLEFT", 0, -5);
    button.HiddenDescription:SetPoint("TOPRIGHT", button.Header, "BOTTOMRIGHT", 0, -5);
    button.HiddenDescription:SetJustifyH("LEFT");
    button.HiddenDescription:SetHeight(40);
    GW2_ADDON.AchievementFrameSkinFunction.SetNormalText(button.HiddenDescription);

    -- Reskin completion date
    button.DateCompleted:ClearAllPoints();
    button.DateCompleted:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -5, 7 + buttonOffset);
    button.DateCompleted:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 7 + buttonOffset);
    button.DateCompleted:SetHeight(15);
    button.DateCompleted:SetJustifyH("RIGHT");
    GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(button.DateCompleted);

    -- Hide the achievement icon
    button.Icon.Border:Hide();
    button.Icon.Texture:Hide();

    -- Move the shield
    button.Shield:ClearAllPoints();
    button.Shield:SetPoint("CENTER", button.cBackground, "CENTER", 0, 0);

    -- Extra flare when achievement is completed
    button.completeFlare = button:CreateTexture("completeFlare", "BACKGROUND", nil, 0);
    button.completeFlare:ClearAllPoints();
    button.completeFlare:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.completeFlare:SetSize(256 * scaling, 128 * scaling);
    button.completeFlare:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebg");

    -- Not sure what this one is
    button.fBackground = button:CreateTexture("fBackground", "BACKGROUND", nil, 0);
    button.fBackground:ClearAllPoints();
    button.fBackground:SetPoint("TOPLEFT");
    button.fBackground:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);
    button.fBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/statusbar");
    button.fBackground:SetVertexColor(1, 1, 1, 0.2);

    -- New bottom bar
    button.bottomBar = button:CreateTexture("bottomBar", "BACKGROUND", nil, 2);
    button.bottomBar:ClearAllPoints();
    button.bottomBar:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);
    button.bottomBar:SetSize(512, 64);
    button.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooter");

    -- New background for a completed achievement
    button.completedBackground = button:CreateTexture("completedBackground", "BACKGROUND", nil, 3);
    button.completedBackground:ClearAllPoints();
    button.completedBackground:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.completedBackground:SetPoint("BOTTOMLEFT", button, "TOPLEFT", 0, -120  * scaling);
    button.completedBackground:SetWidth(240 * scaling);
    button.completedBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementcomplete");
    button.completedBackground:SetVertexColor(1, 1, 1, 0.7);

    -- Reskin the track button
    button.Tracked:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchicon");
    button.Tracked:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchiconactive");
    button.Tracked:SetCheckedTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchiconactive");
    button.Tracked:SetPushedTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchicon");
    button.Tracked.Text:Hide();
    button.Tracked:ClearAllPoints();
    button.Tracked:SetPoint("BOTTOMRIGHT", button.bottomBar, "BOTTOMRIGHT", -7, 0);
    button.Tracked:SetSize(30, 30);

    -- Highligh that will cover the entire button
    button.Highlight:GwStripTextures();
    button.Highlight.Bottom:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementhover");
    button.Highlight.Bottom:SetBlendMode("ADD");
    button.Highlight.Bottom:ClearAllPoints();
    button.Highlight.Bottom:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
    button.Highlight.Bottom:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);
    button.Highlight.Bottom:SetTexCoord(0, 1, 0, 1);
    button.Highlight.Bottom:SetVertexColor(1, 1, 1, 1);
    button.hasSkinnedHighlight = true;
    button:HookScript("OnEnter", function(self)
        GW2_ADDON.TriggerButtonHoverAnimation(self, self.Highlight.Bottom);
    end);

    hooksecurefunc(button, "Collapse", CollapseAchievement);
    hooksecurefunc(button, "Expand", ExpandAchievement);
end

local function OnAchievementsFrameViewAcquiredFrame(self, frame, elementData, new)
    if not new then
        return;
    end
    SkinAchievementButton(frame);
end

local media = "Interface/AddOns/Krowi_AchievementFilter/Plugins/GW2_UI/";
local function SetAchievement(self, achievement, refresh)
    if not achievement then
        return;
    end

    if self.Completed then
        self.completedBackground:Show();
        self.cBackground:Hide();
        self.completedBackground:SetAlpha(1);
    else
        -- self.completedBackground:Hide();
        self.cBackground:Show();
        -- if self.accountWide then
            self.completedBackground:Show();
            self.completedBackground:SetAlpha(0.1);
        -- end
    end

    local state = achievement:GetObtainableState();

    local texture;
    if state == "Past" then
        texture = "Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebgred";
    elseif state == "Current" then
        texture = media .. "GW2_UI-achievementcompletebggreen";
    elseif state == "Future" then
        texture = media .. "GW2_UI-achievementcompletebgyellow";
    else
        if self.accountWide then
            texture = "Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebg";
        else
            texture = GW2_ADDON.AchievementFrameSkinFunction.AchievementBackgroundTextures.red;
        end
    end

    self.completeFlare:Hide();
    self.completedBackground:SetTexture(texture);

    if IsTrackedAchievement(achievement.Id) then
        self.trackBackground:Show();
        self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooternotrack");
    else
        self.trackBackground:Hide();
    end

    GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(self.Reward);

    self.Background:Hide();
    self.HiddenDescription:SetTextColor(1, 1, 1);
    self.Description:SetTextColor(1, 1, 1);

    CollapseAchievement(self);
end

local function OnAchievementsFrameViewInitializedFrame(self, frame, elementData)
    SetAchievement(frame, elementData);
end

local function SkinCriteriaStatusbar(parentFrame, self)
    if self.skinned then
        return;
    end
    self.skinned = true;

    self:GwStripTextures();
    local text = self.Text;

    local bar = select(1, self:GetRegions());
    local fill = select(6, self:GetRegions());

    fill:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar");
    bar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/StatusBar");
    bar:SetVertexColor(1, 1, 1, 0.5);

    local bColor = GW2_ADDON.AchievementFrameSkinFunction.BarColors.incomplete;
    if parentFrame.Completed and parentFrame.accountWide then
        bColor = GW2_ADDON.AchievementFrameSkinFunction.BarColors.blue;
    elseif parentFrame.Completed and not parentFrame.accountWide  then
        bColor = GW2_ADDON.AchievementFrameSkinFunction.BarColors.red;
    end

    self:SetStatusBarColor(bColor.r, bColor.g, bColor.b);

    text:SetFont(DAMAGE_TEXT_FONT, 11);
    text:SetTextColor(1, 1, 1);
    text:SetHeight(bar:GetHeight());
    text:SetJustifyV("MIDDLE");
end

local function SetAchievementsObjectivesAnchors()
    local objectivesFrame = KrowiAF_AchievementsObjectives;
    local parent = objectivesFrame:GetParent();
    if not parent then
        return;
    end
    objectivesFrame:ClearAllPoints();
    objectivesFrame:SetPoint("TOPLEFT", parent.HiddenDescription, "BOTTOMLEFT");
    objectivesFrame:SetPoint("TOPRIGHT", parent.HiddenDescription, "BOTTOMRIGHT");
end

local function SkinAchievementsObjectives()
    local objectivesFrame = KrowiAF_AchievementsObjectives;
    local parent = objectivesFrame:GetParent();
    if not parent then
        return;
    end

    local i = 1;
    while _G["KrowiAF_AchievementsObjectivesMeta" .. i] do
        GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesMeta" .. i].Label);
        i = i + 1;
    end

    i = 1;
    while _G["KrowiAF_AchievementsObjectivesTextCriteria" .. i] do
        GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesTextCriteria" .. i].Label);
        i = i + 1;
    end

    i = 1;
    while _G["KrowiAF_AchievementsObjectivesProgressBar" .. i] do
        SkinCriteriaStatusbar(parent, _G["KrowiAF_AchievementsObjectivesProgressBar" .. i]);
        i = i + 1;
    end
end

local function SkinAchievementsFrame()
    -- Frame
    KrowiAF_AchievementsFrame:GwStripTextures();

    KrowiAF_AchievementsFrame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
    KrowiAF_AchievementsFrame.Background:SetTexCoord(0, 1, 0, 1);

    KrowiAF_AchievementsFrame:HookScript("OnShow", function(self)
        self:ClearPoint("TOPLEFT");
        self:SetPoint("TOP", 0, -10);
        self:SetPoint("LEFT", KrowiAF_CategoriesFrame, "RIGHT");
    end);

    -- Buttons
    SkinAchievementButton(KrowiAF_AchievementsFrame.DummyFrame);
    KrowiAF_AchievementsFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnAchievementsFrameViewAcquiredFrame, KrowiAF_AchievementsFrame);
    KrowiAF_AchievementsFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnInitializedFrame, OnAchievementsFrameViewInitializedFrame, KrowiAF_AchievementsFrame);

    -- Objectives
    hooksecurefunc(KrowiAF_AchievementsObjectives, "GetTextCriteria", function(self, index)
        GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesTextCriteria" .. index].Label);
    end);

    hooksecurefunc(KrowiAF_AchievementsObjectives, "GetProgressBar", function(self, index)
        SkinCriteriaStatusbar(self, _G["KrowiAF_AchievementsObjectivesProgressBar" .. index]);
    end);

    hooksecurefunc(KrowiAF_AchievementsObjectives, "GetMeta", function(self, index)
        GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesMeta" .. index].Label);
    end);

    local preHookDisplayCriteria = KrowiAF_AchievementsObjectives.DisplayCriteria;
    function KrowiAF_AchievementsObjectives:DisplayCriteria(id)
        SetAchievementsObjectivesAnchors()
        preHookDisplayCriteria(self, id);
        SkinAchievementsObjectives();
        self:SetHeight(self:GetHeight() + 10);
    end

    local preHookDisplayProgressiveAchievement = KrowiAF_AchievementsObjectives.DisplayProgressiveAchievement;
    function KrowiAF_AchievementsObjectives:DisplayProgressiveAchievement(id)
        SetAchievementsObjectivesAnchors()
        preHookDisplayProgressiveAchievement(self, id);
        SkinAchievementsObjectives();
        self:SetHeight(self:GetHeight() + 10);
    end

    -- Scrollbar
    GW2_ADDON.HandleTrimScrollBar(KrowiAF_AchievementsFrame.ScrollBar);
    HandleScrollBar(KrowiAF_AchievementsFrame.ScrollBar);
end

local function SkinAchievementsFrameLight(frame)
    -- Frame
    frame:GwStripTextures();

    -- Buttons
    SkinAchievementButton(frame.DummyFrame);
    frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnAchievementsFrameViewAcquiredFrame, frame);
    frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnInitializedFrame, OnAchievementsFrameViewInitializedFrame, frame);
    frame.ScrollView:SetElementExtent(frame.DummyFrame.CollapsedHeight);

    -- Scrollbar
    GW2_ADDON.HandleTrimScrollBar(frame.ScrollBar);
    HandleScrollBar(frame.ScrollBar);
end


-- [[ Summary ]]
local function SkinStatusBar(statusBar)
    statusBar.BorderLeftTop:GwStripTextures();
    statusBar.BorderLeftMiddle:GwStripTextures();
    statusBar.BorderLeftBottom:GwStripTextures();
    statusBar.BorderRightTop:GwStripTextures();
    statusBar.BorderRightMiddle:GwStripTextures();
    statusBar.BorderRightBottom:GwStripTextures();
    statusBar.BorderMiddleTop:GwStripTextures();
    statusBar.BorderMiddleMiddle:GwStripTextures();
    statusBar.BorderMiddleBottom:GwStripTextures();
    statusBar.Background:Hide();
    local fills = statusBar.Fill;
    for _, fill in next, fills do
        fill:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar");
    end
    statusBar:AdjustOffsets(8, 8);
    statusBar:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.DefaultWithColorableBorder, true);
    statusBar.backdrop:SetPoint("TOPLEFT", 13, -13);
    statusBar.backdrop:SetPoint("BOTTOMRIGHT", -11, 13);
    statusBar.backdrop:SetBackdropBorderColor(0, 0, 0, 1);
    statusBar:SetColors({R = 33 / 255, G = 116 / 255, B = 66 / 255}, {R = 162 / 255, G = 17 / 255, B = 11 / 255});
    if statusBar.Button then
        local button = statusBar.Button;
        button:GwStripTextures();
    end

    local fname = statusBar:GetName();
    local spark = _G[fname .. "Spark"];

    if not spark then
        statusBar.spark = statusBar:CreateTexture(fname .. "Spark", "OVERLAY", nil, 7);
        statusBar.spark:ClearAllPoints();
        statusBar.spark:SetPoint("RIGHT", fills[#fills], "RIGHT", 0, 0);
        statusBar.spark:SetPoint("TOP", fills[#fills], "TOP", 0, 0);
        statusBar.spark:SetPoint("BOTTOM", fills[#fills], "BOTTOM", 0, 0);
        statusBar.spark:SetWidth(10);
        statusBar.spark:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/statusbar-spark-white");
    end

    statusBar.TextLeft:ClearAllPoints();
    statusBar.TextLeft:SetPoint("BOTTOMLEFT", statusBar.backdrop, "TOPLEFT", 0, 5);
    GW2_ADDON.AchievementFrameSkinFunction.SetNormalText(statusBar.TextLeft);

    statusBar.TextRight:SetFont(DAMAGE_TEXT_FONT, 11);
    statusBar.TextRight:SetTextColor(1, 1, 1);
end

local function SkinAchievementSummaryHeaders(header)
    local fname = header:GetName();
    local texture = _G[fname.."Header"] or _G[fname.."Texture"];
    local text = _G[fname.."Title"];
    header:SetHeight(32);
    texture:SetTexture("Interface/AddOns/GW2_UI/textures/talents/talents_header");
    texture:ClearAllPoints();
    texture:SetPoint("TOPLEFT");
    texture:SetPoint("BOTTOMRIGHT");
    text:ClearAllPoints();
    text:SetPoint("LEFT", 10, 0);
    GW2_ADDON.AchievementFrameSkinFunction.SetTitleText(text);
end

local function SkinAchievementSummary()
    -- Frame
    KrowiAF_SummaryFrame:GwStripTextures();
    KrowiAF_SummaryFrame:GetChildren():Hide();

    KrowiAF_SummaryFrame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
    KrowiAF_SummaryFrame.Background:SetTexCoord(0, 1, 0, 1);

    KrowiAF_SummaryFrame:HookScript("OnShow", function(self)
        self:ClearPoint("TOPLEFT");
        self:SetPoint("TOP", 0, -10);
        self:SetPoint("LEFT", KrowiAF_CategoriesFrame, "RIGHT");
    end);

    SkinAchievementSummaryHeaders(KrowiAF_SummaryFrame.Achievements.Header);
    KrowiAF_SummaryFrame.Achievements.Header:ClearAllPoints();
    KrowiAF_SummaryFrame.Achievements.Header:SetPoint("TOPLEFT", KrowiAF_SummaryFrame.Achievements, "TOPLEFT", -1, 6);
    KrowiAF_SummaryFrame.Achievements.Header:SetPoint("TOPRIGHT", KrowiAF_SummaryFrame.Achievements, "TOPRIGHT", 14, 6);
    SkinAchievementSummaryHeaders(KrowiAF_SummaryFrame.Categories.Header);
    KrowiAF_SummaryFrame.Categories.Header:ClearPoint("LEFT");
    KrowiAF_SummaryFrame.Categories.Header:ClearPoint("RIGHT");
    KrowiAF_SummaryFrame.Categories.Header:SetPoint("LEFT", KrowiAF_SummaryFrame.Categories, "LEFT", 3, 0);
    KrowiAF_SummaryFrame.Categories.Header:SetPoint("RIGHT", KrowiAF_SummaryFrame.Categories, "RIGHT", 8, 0);

    SkinAchievementsFrameLight(KrowiAF_SummaryFrame.AchievementsFrame);

    SkinStatusBar(KrowiAF_SummaryFrame.TotalStatusBar);
    KrowiAF_SummaryFrame.TotalStatusBar:SetWidth(574);
    KrowiAF_SummaryFrame.TotalStatusBar:SetPoint("TOP", KrowiAF_SummaryFrame.Categories.Header, "BOTTOM", 0, -15);
    local preHookFunction = KrowiAF_SummaryFrame.GetStatusBar;
    KrowiAF_SummaryFrame.GetStatusBar = function(self, index)
        local statusBar = preHookFunction(self, index);
        if not statusBar.IsSkinned then
            SkinStatusBar(statusBar);
            statusBar.IsSkinned = true;
        end
        return statusBar;
    end
    KrowiAF_SummaryFrame.GetAndAlignStatusBar = function(self, index)
        local numColumns = floor((self:GetWidth() - 28) / 254);
        local width = (self:GetWidth() - 44) / numColumns; -- 44 = 2*14 + 16, 14 is offsets on the side, 16 in between 2 columns
        local numRows = 1;
        local position = index;
        while position > numColumns do
            position = position - numColumns;
            numRows = numRows + 1;
        end

        local statusBar = self:GetStatusBar(index);
        statusBar:SetWidth(width + 16);
        statusBar:ClearAllPoints();
        statusBar:SetPoint("TOPLEFT", self.TotalStatusBar, "TOPLEFT", (position - 1) * width, -numRows * 49);
        return statusBar;
    end
end

--[[ FilterButton ]]
local function SkinFilterButton()
    KrowiAF_AchievementFrameFilterButton:GwHandleDropDownBox(GW2_ADDON.BackdropTemplates.DopwDown, true, "MENU_ACHIEVEMENT_FILTER")
    KrowiAF_AchievementFrameFilterButton:ClearAllPoints();
    KrowiAF_AchievementFrameFilterButton:SetPoint("BOTTOMLEFT", KrowiAF_SearchBoxFrame, "TOPLEFT", 0, 10);
    KrowiAF_AchievementFrameFilterButton:SetPoint("BOTTOMRIGHT", KrowiAF_SearchBoxFrame, "TOPRIGHT", 0, 10);
    KrowiAF_AchievementFrameFilterButton:SetHeight(26);

    KrowiAF_AchievementFrameFilterButton.backdrop:ClearAllPoints();
    KrowiAF_AchievementFrameFilterButton.backdrop:SetPoint("TOPLEFT", KrowiAF_AchievementFrameFilterButton, "TOPLEFT", 0, 0);
    KrowiAF_AchievementFrameFilterButton.backdrop:SetPoint("BOTTOMRIGHT", KrowiAF_AchievementFrameFilterButton, "BOTTOMRIGHT", 0, 0);
    KrowiAF_AchievementFrameFilterButton.backdrop:SetAlpha(0.5);

    KrowiAF_AchievementFrameFilterButton:HookScript("OnShow", function()
        GW2_ADDON.AchievementFrameFilterDropDownDummy:Hide();
    end);

    KrowiAF_AchievementFrameFilterButton:HookScript("OnHide", function()
        if AchievementFrameFilterDropdown:IsShown() then
            GW2_ADDON.AchievementFrameFilterDropDownDummy:Hide();
        else
            GW2_ADDON.AchievementFrameFilterDropDownDummy:Show();
        end
    end);
end

-- [[ Search ]]
local function SkinSearchOptionsButton()
    KrowiAF_SearchBoxFrame.OptionsMenuButton:GwStripTextures();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.TopLeft:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.TopRight:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.BottomLeft:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.BottomRight:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.TopMiddle:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.MiddleLeft:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.MiddleRight:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.BottomMiddle:Hide();
    KrowiAF_SearchBoxFrame.OptionsMenuButton.MiddleMiddle:Hide();
    local icon = KrowiAF_SearchBoxFrame.OptionsMenuButton.Icon;
    icon:SetAtlas("common-search-magnifyingglass");
    KrowiAF_SearchBoxFrame.OptionsMenuButton:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.DopwDown, true);
    KrowiAF_SearchBoxFrame.OptionsMenuButton.backdrop:SetBackdropColor(0, 0, 0);

    KrowiAF_SearchBoxFrame.OptionsMenuButton:ClearAllPoints();
    KrowiAF_SearchBoxFrame.OptionsMenuButton:SetPoint("RIGHT", KrowiAF_SearchBoxFrame, "RIGHT", -3, 0);
end

local function SkinSearchBoxFrame()
    KrowiAF_SearchBoxFrame:ClearAllPoints();
    KrowiAF_SearchBoxFrame:SetPoint("BOTTOMLEFT", KrowiAF_CategoriesFrame, "TOPLEFT", 0, 10);
    KrowiAF_SearchBoxFrame:SetPoint("BOTTOMRIGHT", KrowiAF_CategoriesFrame, "TOPRIGHT", 0, 10);
    KrowiAF_SearchBoxFrame:SetFont(UNIT_NAME_FONT, 14, "");
    GW2_ADDON.SkinTextBox(KrowiAF_SearchBoxFrame.Middle, KrowiAF_SearchBoxFrame.Left, KrowiAF_SearchBoxFrame.Right);
    KrowiAF_SearchBoxFrame:SetHeight(26);
    KrowiAF_SearchBoxFrame.searchIcon:Hide();
    KrowiAF_SearchBoxFrame:SetFont(UNIT_NAME_FONT, 14, "");
    KrowiAF_SearchBoxFrame.Instructions:SetFont(UNIT_NAME_FONT, 14, "");
    KrowiAF_SearchBoxFrame.Instructions:SetTextColor(178 / 255, 178 / 255, 178 / 255);
end

local function SkinSearchPreviewFrame()
    KrowiAF_SearchBoxFrame.PreviewContainer:GwStripTextures();
    KrowiAF_SearchBoxFrame.PreviewContainer:ClearAllPoints();
    KrowiAF_SearchBoxFrame.PreviewContainer:SetPoint("TOPLEFT", KrowiAF_SearchBoxFrame, "BOTTOMLEFT", 0, 0);
    KrowiAF_SearchBoxFrame.PreviewContainer:SetPoint("TOPRIGHT", KrowiAF_SearchBoxFrame, "BOTTOMRIGHT", 0, 0);

    for _, button in next, KrowiAF_SearchBoxFrame.PreviewContainer.Buttons do
        button.Name:SetFont(UNIT_NAME_FONT, 12, "");
        button:SetPoint("RIGHT");
    end
    KrowiAF_SearchBoxFrame.PreviewContainer.ShowFullSearchResultsButton.Text:SetFont(UNIT_NAME_FONT, 12, "");
end

-- [[ Header ]]
local function UpdatePointsDisplay()
    if not addon.InGuildView() and addon.Options.db.profile.AchievementPoints.Format == 2 then
        AchievementFrame.Header.Points:SetHeight(AchievementFrame.Header.Shield:GetHeight());
        AchievementFrame.Header.Points:SetPoint("TOP", AchievementFrame.Header.Shield);
        AchievementFrame.Header.Points:SetPoint("BOTTOM", AchievementFrame.Header.Shield);
        AchievementFrame.Header.Points:SetPoint("RIGHT", KrowiAF_SearchBoxFrame);
    end
end

local function SkinHeader()
    hooksecurefunc(AchievementFrame.Header.Points, "SetText", UpdatePointsDisplay);
    hooksecurefunc("AchievementFrame_RefreshView", UpdatePointsDisplay);
    hooksecurefunc("AchievementFrame_UpdateTabs", UpdatePointsDisplay);

    AchievementFrameFilterDropdown:ClearAllPoints()
    AchievementFrameFilterDropdown:SetPoint("BOTTOMLEFT", AchievementFrame.SearchBox, "TOPLEFT", 0, 10)
    AchievementFrameFilterDropdown:SetPoint("BOTTOMRIGHT", AchievementFrame.SearchBox, "TOPRIGHT", 0, 10)

    AchievementFrameFilterDropdown.backdrop:ClearAllPoints()
    AchievementFrameFilterDropdown.backdrop:SetPoint("TOPLEFT", AchievementFrameFilterDropdown, "TOPLEFT", 0, 0)
    AchievementFrameFilterDropdown.backdrop:SetPoint("BOTTOMRIGHT", AchievementFrameFilterDropdown, "BOTTOMRIGHT", 0, 0)
    AchievementFrameFilterDropdown.backdrop:SetAlpha(0.5)

    GW2_ADDON.HandleNextPrevButton(KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton);
    GW2_ADDON.HandleNextPrevButton(KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton);
    KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:ClearPoint("RIGHT");
    KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:ClearPoint("RIGHT");
    KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:SetPoint("LEFT", AchievementFrameHeader.breadCrumb, "RIGHT", 10, -2);
    KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:SetPoint("LEFT", KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, "RIGHT");
end

-- [[ Some Default Blizzard Stuff ]]
local function ReskinBlizzard()
    KrowiAF_AchievementFrameHeaderButton:ClearAllPoints();
    KrowiAF_AchievementFrameHeaderButton:SetPoint("TOPLEFT", AchievementFrame.Header.Shield);
    KrowiAF_AchievementFrameHeaderButton:SetPoint("BOTTOMRIGHT", AchievementFrame.Header.Points);
end

-- [[ Calendar ]]
local function SkinCalendarButton()
    KrowiAF_AchievementFrameCalendarButton:SetText("");
    KrowiAF_AchievementFrameCalendarButton:ClearAllPoints();
    KrowiAF_AchievementFrameCalendarButton:SetPoint("RIGHT", AchievementFrameCloseButton, "LEFT", -5, 0);
    KrowiAF_AchievementFrameCalendarButton:SetHitRectInsets(0, 0, 0, 0);
    KrowiAF_AchievementFrameCalendarButton:SetSize(32, 32);
    KrowiAF_AchievementFrameCalendarButton:GwStripTextures();
    KrowiAF_AchievementFrameCalendarButton:SetNormalTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
    KrowiAF_AchievementFrameCalendarButton:SetPushedTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
    KrowiAF_AchievementFrameCalendarButton:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
    KrowiAF_AchievementFrameCalendarButton:GetNormalTexture():SetTexCoord(0, 1, 0, 1);
    KrowiAF_AchievementFrameCalendarButton:GetPushedTexture():SetTexCoord(0, 1, 0, 1);
    KrowiAF_AchievementFrameCalendarButton:GetHighlightTexture():SetTexCoord(0, 1, 0, 1);
end

-- [[ Gw2Ui ]]
local function ReskinGw2Ui()
    hooksecurefunc(addon.Gui, "ToggleAchievementFrame", function()
        if addon.Gui.SelectedTab then
            addon.Gui:SetAchievementFrameWidth();
            addon.Gui:SetAchievementFrameHeight();
        end
    end);

    GW2_ADDON.AchievementFrameSkinFunction.AchievementBackgroundTextures.red = "Interface/AddOns/Krowi_AchievementFilter/Plugins/GW2_UI/GW2_UI-achievementcompletebgorange";
end

-- [[ Skin everything above ]]
local function SkinAll()
    if doSkin.Achievements then
        SkinTabs();
        SkinCategoriesFrame();
        SkinGameTooltipProgressBar();
        SkinAchievementsFrame();
        SkinAchievementSummary();
        SkinFilterButton();
        SkinSearchOptionsButton();
        SkinSearchBoxFrame();
        SkinSearchPreviewFrame();
        SkinHeader();
        ReskinBlizzard();
        SkinCalendarButton();
        ReskinGw2Ui();
    end
end

-- [[ Alert and Side Buttons ]]
local function SkinAlertFrameTemplate(frame, addFlare)
    frame:SetAlpha(1);

    if not frame.hooked then
        hooksecurefunc(frame, 'SetAlpha', GW2_ADDON.ForceAlpha);
        frame.hooked = true;
    end

    if not frame.backdrop then
        frame:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.AlertFrame)
        frame.backdrop:SetPoint("TOPLEFT", frame.Background, "TOPLEFT", -10, 0);
        frame.backdrop:SetPoint("BOTTOMRIGHT", frame.Background, "BOTTOMRIGHT", 5, 0);
    end

    -- Background
    frame.Background:SetTexture();
    frame.glow:GwKill();
    frame.shine:GwKill();

    -- Text
    frame.Unlocked:SetTextColor(1, 1, 1);
    frame.Name:SetPoint("LEFT", frame, "LEFT", 60, 0);
    frame.Name:SetPoint("RIGHT", frame, "RIGHT", -10, 0);

    -- Icon
    frame.Icon.Texture:SetSize(45, 45);
    frame.Icon.Texture:SetTexCoord(0.1, 0.9, 0.1, 0.9);
    frame.Icon.Overlay:GwKill();

    frame.Icon.Texture:ClearAllPoints();
    frame.Icon.Texture:SetPoint("LEFT", frame, 7, 0);

    if not frame.Icon.Texture.b then
        frame.Icon.Texture.b = CreateFrame("Frame", nil, frame);
        frame.Icon.Texture.b:SetAllPoints(frame.Icon.Texture);
        frame.Icon.Texture:SetParent(frame.Icon.Texture.b);
        frame.Icon.iconBorder = frame.Icon.Texture.b:CreateTexture(nil, "ARTWORK");
        frame.Icon.iconBorder:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitemborder");
        frame.Icon.iconBorder:SetAllPoints(frame.Icon.Texture.b);
    end

    -- Flare
    if addFlare then
        GW2_ADDON.AddFlareAnimationToObject(frame, frame.Icon.Texture.b);
    end
end

local function SkinSideButton(button, prevButton)
    if not button.HasGw2UiSkin then
        SkinAlertFrameTemplate(button, false);
    end
    if not prevButton then
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.Util.IsMainline and 6 or 13); -- Make the 2nd button anchor like the 1st one
    else
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9); -- Make the 2nd button anchor like the 1st one
    end
    button.HasGw2UiSkin = true;
end

local function SkinSideButtons()
    local i = 1;
    local button = _G["KrowiAF_AchievementFrameSideButton" .. i];
    local prevButton;
    while button do
        SkinSideButton(button, prevButton);
        prevButton = button;
        i = i + 1;
        button = _G["KrowiAF_AchievementFrameSideButton" .. i];
    end
end

local function SkinAlertFrames()
    if not addon.Gui.EventReminderAlertSystem.SubSystem then
        hooksecurefunc(addon.Gui.EventReminderAlertSystem, "Load", function(system)
            hooksecurefunc(addon.Gui.EventReminderAlertSystem.SubSystem, "setUpFunction", function(frame)
                SkinAlertFrameTemplate(frame);
            end);
        end);
        return;
    end
    hooksecurefunc(addon.Gui.EventReminderAlertSystem.SubSystem, "setUpFunction", function(frame)
        SkinAlertFrameTemplate(frame);
    end);
end

-- [[ FloatingAchievementTooltip ]]
local function SkinFloatingAchievementTooltip()
    local tooltip = KrowiAF_FloatingAchievementTooltip;
    tooltip.CloseButton:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-normal");
    tooltip.CloseButton:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover");
    tooltip.CloseButton:SetPushedTexture("Interface/AddOns/GW2_UI/textures/uistuff/window-close-button-hover");
    tooltip.CloseButton:SetSize(20, 20);
    tooltip.CloseButton:ClearAllPoints();
    tooltip.CloseButton:SetPoint("TOPRIGHT", -3, -3);
    tooltip.NineSlice:Hide();
    tooltip:GwCreateBackdrop({
        bgFile = "Interface/AddOns/GW2_UI/textures/uistuff/UI-Tooltip-Background",
        edgeFile = "Interface/AddOns/GW2_UI/textures/uistuff/UI-Tooltip-Border",
        tile = false,
        tileSize = 64,
        edgeSize = 32,
        insets = {left = 2, right = 2, top = 2, bottom = 2}
    });
end

function gw2:OnEvent(event, arg1, arg2)
    if event ~= "PLAYER_LOGIN" or not IsLoaded() then
        return;
    end

    if doSkin.AlertFrames then
        SkinAlertFrames();
    end
    if doSkin.Tooltip then
        SkinFloatingAchievementTooltip();
    end
end

local function AddInfo(localizationName, getFunction, hidden)
    return {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["GW2_UI " .. localizationName],
        desc = addon.L["GW2_UI " .. localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true,
        hidden = hidden
    };
end

function gw2.InjectOptions()
    local pluginTable = KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "GW2_UI",
        addon.L["GW2_UI"],
        "",
        function()
            return IsLoaded();
        end
    );

    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "Unsupported", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = (addon.L["Unsupported GW2_UI Desc"]:K_ReplaceVars(C_AddOns.IsAddOnLoaded("GW2_UI") and C_AddOns.GetAddOnMetadata("GW2_UI", "Version") or "") ..
        (addon.Util.IsMainline and (" " .. addon.L["At least version is required"]:K_ReplaceVars("6.6.1")) or "\n")):SetColorRed(),
        fontSize = "medium",
        hidden = GW2_ADDON == nil or IsLoaded()
    });

    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinsDescription", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["GW2_UI Skins Desc"],
        fontSize = "medium"
    });
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return doSkin.Achievements; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinDropDown", AddInfo("Skin DropDown", function() return doSkin.DropDown; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinPopupNotifications", AddInfo("Skin Popup Notifications", function() return doSkin.PopUpNotifications; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAlertFrames", AddInfo("Skin Alert Frames", function() return doSkin.AlertFrames; end));

    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "ModulesDescription", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["GW2_UI Modules Desc"],
        fontSize = "medium"
    });
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinTooltip", AddInfo("Skin Tooltip", function() return doSkin.Tooltip; end));
end

local function DisableOptions()
    if not GW2_ADDON.GetSetting("ALERTFRAME_ENABLED") then
        return;
    end

    local appName = addon.Metadata.Prefix .. "_EventReminders";
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.GrowDirection").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.Spacing").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetX").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetY").disabled = true;
    KrowiAF.UtilApi.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "ElvUIComment", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["Alert System Overwrite Desc"]:K_ReplaceVars(addon.L["GW2_UI"])
    });

    if doSkin.Achievements then
        appName = addon.Metadata.Prefix .. "_Layout";
        KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetX").disabled = true;
        KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetY").disabled = true;
        KrowiAF.UtilApi.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args"), "ElvUIComment", {
            order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
            name = addon.L["Calendar Button Position Overwrite Desc"]:K_ReplaceVars(addon.L["GW2_UI"])
        });
    end
end

function gw2.Load()
    doSkin = {};

    if not IsLoaded() then
        return;
    end

    doSkin.Achievements = GW2_ADDON.GetSetting("ACHIEVEMENT_SKIN_ENABLED");
    doSkin.DropDown = GW2_ADDON.GetSetting("DROPDOWN_SKIN_ENABLED");
    doSkin.PopUpNotifications = GW2_ADDON.GetSetting("STATICPOPUP_SKIN_ENABLED");
    doSkin.Tooltip = GW2_ADDON.GetSetting("TOOLTIPS_ENABLED");
    doSkin.AlertFrames = GW2_ADDON.GetSetting("ALERTFRAME_SKIN_ENABLED");

    hooksecurefunc(addon.Gui, "LoadWithBlizzard_AchievementUI", function()
        SkinAll();
    end);

    hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Load", function()
        if doSkin.Achievements then
            SkinSideButtons();
        end
        hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", function()
            if doSkin.Achievements then
                SkinSideButtons();
            end
        end);
    end);

    hooksecurefunc(addon.Gui.AchievementButtonExtraIconFactory, "GetNew", function(button)
        local extraIconId = #button.ExtraIcons;
        local extraIcon = button.ExtraIcons[extraIconId];
        if extraIconId == 1 then
            extraIcon:SetPoint("TOPLEFT", button, "TOPLEFT", 5, -5);
        else
            extraIcon:SetPoint("LEFT", button.ExtraIcons[extraIconId - 1], "RIGHT", 0, 0);
        end
    end);

    DisableOptions();
end