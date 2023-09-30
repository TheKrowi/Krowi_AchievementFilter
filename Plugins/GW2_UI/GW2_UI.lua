-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from ElvUI to make it compatible with their skin.

-- [[ Namespaces ]] --
local addonName, addon = ...;
local plugins = addon.Plugins;
plugins.GW2_UI = {};
local gw2_ui = plugins.GW2_UI;
tinsert(plugins.Plugins, gw2_ui);

do -- [[ Shared ]]
    function gw2_ui.HandleScrollBar(self)
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
end

do -- [[ Tabs ]]
    local function UpdateTabsLayout(tabsOrder)
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
        for _addonName, addonTabs in next, addon.GUI.Tabs do
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

                local originalAchievementFrame_UpdateTabs = tab.AchievementFrame_UpdateTabs
                tab.AchievementFrame_UpdateTabs = function(self, thisTab, thisTabID, clickedTab)
                    originalAchievementFrame_UpdateTabs(self, thisTab, thisTabID, clickedTab);
                    if thisTabID == clickedTab then
                        self.icon:SetTexCoord(0, 0.5, 0, 0.625);
                    else
                        self.icon:SetTexCoord(0.5, 1, 0, 0.625);
                    end
                end
            end
        end

        addon.GUI.UpdateTabsLayout = UpdateTabsLayout;

        hooksecurefunc("PanelTemplates_UpdateTabs", addon.GUI.ShowHideTabs);
        hooksecurefunc("AchievementFrame_DisplayComparison", addon.GUI.ShowHideTabs);
        hooksecurefunc("AchievementFrame_ToggleAchievementFrame", addon.GUI.ShowHideTabs);
        AchievementFrame:HookScript("OnShow", function()
            addon.GUI.ShowHideTabs();
        end);
    end
    gw2_ui.SkinTabs = SkinTabs;
end

do -- [[ Categories ]]
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

    local function OnCategoriesFrameViewAcquiredFrame(self, frame, elementData, new)
        if not new then
            return;
        end
        SkinCategoryButton(frame);
    end

    local function OnCategoriesFrameViewInitializedFrame(self, frame, elementData)
        SetCategory(frame, elementData);
        UpdateCategoryState(frame, frame:GetOrderIndex());
    end

    local function SkinCategoriesFrame(frame)
        -- Frame
        frame:GwStripTextures();

        -- Buttons
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnCategoriesFrameViewAcquiredFrame, frame);
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnInitializedFrame, OnCategoriesFrameViewInitializedFrame, frame);
        frame.ScrollView:SetElementExtent(36);

        -- Scrollbar
        GW2_ADDON.HandleTrimScrollBar(frame.ScrollBar);
        gw2_ui.HandleScrollBar(frame.ScrollBar);
    end
    gw2_ui.SkinCategoriesFrame = SkinCategoriesFrame;
end

local function SkinGameTooltipProgressBar(progressBar)
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

do -- [[ Achievements]]
    local buttonOffset = 5;

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

        local state;
        if achievement.TemporaryObtainable then
            state = achievement.TemporaryObtainable.Obtainable();
        end

        local texture;
        if state and (state == false or state == "Past") then
            texture = "Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebgred";
        elseif state and state == "Current" then
            texture = media .. "GW2_UI-achievementcompletebggreen";
        elseif state and state == "Future" then
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

        -- Move extra icon
        button.ExtraIcon:ClearAllPoints();
        button.ExtraIcon:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 3, 8);

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
    gw2_ui.SkinAchievementButton = SkinAchievementButton;

    local function OnAchievementsFrameViewAcquiredFrame(self, frame, elementData, new)
        if not new then
            return;
        end
        SkinAchievementButton(frame);
    end

    local function OnAchievementsFrameViewInitializedFrame(self, frame, elementData)
        SetAchievement(frame, elementData);
    end

    local function SetAchievementsObjectivesAnchors()
        local objectivesFrame = addon.GUI.AchievementsObjectives;
        local parent = objectivesFrame:GetParent();
        if not parent then
            return;
        end
        objectivesFrame:ClearAllPoints();
        objectivesFrame:SetPoint("TOPLEFT", parent.HiddenDescription, "BOTTOMLEFT");
        objectivesFrame:SetPoint("TOPRIGHT", parent.HiddenDescription, "BOTTOMRIGHT");
    end

    local function SkinAchievementsObjectives()
        local objectivesFrame = addon.GUI.AchievementsObjectives;
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

    local function SkinAchievementsFrame(frame, categoriesFrame)
        -- Frame
        frame:GwStripTextures();

        frame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
        frame.Background:SetTexCoord(0, 1, 0, 1);

        frame:HookScript("OnShow", function(self)
            self:ClearPoint("TOPLEFT");
            self:SetPoint("TOP", 0, -10);
            self:SetPoint("LEFT", categoriesFrame, "RIGHT");
        end);

        -- Buttons
        SkinAchievementButton(frame.DummyFrame);
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, OnAchievementsFrameViewAcquiredFrame, frame);
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnInitializedFrame, OnAchievementsFrameViewInitializedFrame, frame);

        -- Objectives
        hooksecurefunc(addon.GUI.AchievementsObjectives, "GetTextCriteria", function(self, index)
            GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesTextCriteria" .. index].Label);
        end);

        hooksecurefunc(addon.GUI.AchievementsObjectives, "GetProgressBar", function(self, index)
            SkinCriteriaStatusbar(self, _G["KrowiAF_AchievementsObjectivesProgressBar" .. index]);
        end);

        hooksecurefunc(addon.GUI.AchievementsObjectives, "GetMeta", function(self, index)
            GW2_ADDON.AchievementFrameSkinFunction.SetSmallText(_G["KrowiAF_AchievementsObjectivesMeta" .. index].Label);
        end);

        local preHookDisplayCriteria = addon.GUI.AchievementsObjectives.DisplayCriteria;
        function addon.GUI.AchievementsObjectives:DisplayCriteria(id)
            SetAchievementsObjectivesAnchors()
            preHookDisplayCriteria(self, id);
            SkinAchievementsObjectives();
            self:SetHeight(self:GetHeight() + 10);
        end

        local preHookDisplayProgressiveAchievement = addon.GUI.AchievementsObjectives.DisplayProgressiveAchievement;
        function addon.GUI.AchievementsObjectives:DisplayProgressiveAchievement(id)
            SetAchievementsObjectivesAnchors()
            preHookDisplayProgressiveAchievement(self, id);
            SkinAchievementsObjectives();
            self:SetHeight(self:GetHeight() + 10);
        end

        -- Scrollbar
        GW2_ADDON.HandleTrimScrollBar(frame.ScrollBar);
        gw2_ui.HandleScrollBar(frame.ScrollBar);
    end
    gw2_ui.SkinAchievementsFrame = SkinAchievementsFrame;

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
         gw2_ui.HandleScrollBar(frame.ScrollBar);

    end
    gw2_ui.SkinAchievementsFrameLight = SkinAchievementsFrameLight;
end

do -- [[ Summary ]]
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
            statusBar.spark:SetSize(10, fills[#fills]:GetHeight());
            statusBar.spark:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/statusbar-spark-white");
        end

        statusBar.TextLeft:ClearAllPoints();
        statusBar.TextLeft:SetPoint("BOTTOMLEFT", statusBar.backdrop, "TOPLEFT", 0, 5);
        GW2_ADDON.AchievementFrameSkinFunction.SetNormalText(statusBar.TextLeft);

        statusBar.TextRight:SetFont(DAMAGE_TEXT_FONT, 11);
        statusBar.TextRight:SetTextColor(1, 1, 1);
    end

    local function SkinAchievementSummaryHeaders(self)
        local fname = self:GetName();
        local texture = _G[fname.."Header"] or _G[fname.."Texture"];
        local text = _G[fname.."Title"];
        self:SetHeight(32);
        texture:SetTexture("Interface/AddOns/GW2_UI/textures/talents/talents_header");
        texture:ClearAllPoints();
        texture:SetPoint("TOPLEFT");
        texture:SetPoint("BOTTOMRIGHT");
        text:ClearAllPoints();
        text:SetPoint("LEFT", 10, 0);
        GW2_ADDON.AchievementFrameSkinFunction.SetTitleText(text);
    end

    local function SkinAchievementSummary(frame, categoriesFrame)
        -- Frame
        frame:GwStripTextures();
        frame:GetChildren():Hide();

        frame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
        frame.Background:SetTexCoord(0, 1, 0, 1);

        frame:HookScript("OnShow", function(self)
            self:ClearPoint("TOPLEFT");
            self:SetPoint("TOP", 0, -10);
            self:SetPoint("LEFT", categoriesFrame, "RIGHT");
        end);

        SkinAchievementSummaryHeaders(frame.Achievements.Header);
        frame.Achievements.Header:ClearAllPoints();
        frame.Achievements.Header:SetPoint("TOPLEFT", frame.Achievements, "TOPLEFT", -1, 6);
        frame.Achievements.Header:SetPoint("TOPRIGHT", frame.Achievements, "TOPRIGHT", 14, 6);
        SkinAchievementSummaryHeaders(frame.Categories.Header);
        frame.Categories.Header:ClearPoint("LEFT");
        frame.Categories.Header:ClearPoint("RIGHT");
        frame.Categories.Header:SetPoint("LEFT", frame.Categories, "LEFT", 3, 0);
        frame.Categories.Header:SetPoint("RIGHT", frame.Categories, "RIGHT", 8, 0);

        gw2_ui.SkinAchievementsFrameLight(frame.AchievementsFrame);

        SkinStatusBar(frame.TotalStatusBar);
        frame.TotalStatusBar:SetWidth(574);
        local statusBars = frame.StatusBars;
        for _, statusBar in next, statusBars do
            SkinStatusBar(statusBar);
            statusBar:SetWidth(295);
        end

        -- Re-anchor status bars
        local yOffset = 0;

        frame.TotalStatusBar:SetPoint("TOP", frame.Categories.Header, "BOTTOM", 0, -15);
        statusBars[1]:SetPoint("TOPLEFT", frame.TotalStatusBar, "BOTTOMLEFT", 0, yOffset);
        statusBars[2]:SetPoint("TOPRIGHT", frame.TotalStatusBar, "BOTTOMRIGHT", 0, yOffset);
        statusBars[3]:SetPoint("TOPLEFT", statusBars[1], "BOTTOMLEFT", 0, yOffset);
        statusBars[4]:SetPoint("TOPRIGHT", statusBars[2], "BOTTOMRIGHT", 0, yOffset);
        statusBars[5]:SetPoint("TOPLEFT", statusBars[3], "BOTTOMLEFT", 0, yOffset);
        statusBars[6]:SetPoint("TOPRIGHT", statusBars[4], "BOTTOMRIGHT", 0, yOffset);
        statusBars[7]:SetPoint("TOPLEFT", statusBars[5], "BOTTOMLEFT", 0, yOffset);
        statusBars[8]:SetPoint("TOPRIGHT", statusBars[6], "BOTTOMRIGHT", 0, yOffset);
        statusBars[9]:SetPoint("TOPLEFT", statusBars[7], "BOTTOMLEFT", 0, yOffset);
        statusBars[10]:SetPoint("TOPRIGHT", statusBars[8], "BOTTOMRIGHT", 0, yOffset);
        statusBars[11]:SetPoint("TOPLEFT", statusBars[9], "BOTTOMLEFT", 0, yOffset);
        statusBars[12]:SetPoint("TOPRIGHT", statusBars[10], "BOTTOMRIGHT", 0, yOffset);
        statusBars[13]:SetPoint("TOPLEFT", statusBars[11], "BOTTOMLEFT", 0, yOffset);
        statusBars[14]:SetPoint("TOPRIGHT", statusBars[12], "BOTTOMRIGHT", 0, yOffset);
    end
    gw2_ui.SkinAchievementSummary = SkinAchievementSummary;
end

local function SkinFilterButton(button)
    button:GwStripTextures();
    button.TopLeft:Hide();
	button.TopRight:Hide();
	button.BottomLeft:Hide();
	button.BottomRight:Hide();
	button.TopMiddle:Hide();
	button.MiddleLeft:Hide();
	button.MiddleRight:Hide();
	button.BottomMiddle:Hide();
	button.MiddleMiddle:Hide();

    button:SetSize(155, 32);

    button:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.DopwDown, true);
    button.backdrop:SetBackdropColor(0, 0, 0);

    button:SetFrameLevel(button:GetFrameLevel() + 2);

    button:ClearAllPoints();
    button:SetPoint('BOTTOMLEFT', addon.GUI.Search.BoxFrame, 'TOPLEFT', 0, 10);
    button:SetPoint('BOTTOMRIGHT', addon.GUI.Search.BoxFrame, 'TOPRIGHT', 0, 10);

    button.backdrop:ClearAllPoints()
    button.backdrop:SetPoint('TOPLEFT', button, 'TOPLEFT', 0, 0);
    button.backdrop:SetPoint('BOTTOMRIGHT', button, 'BOTTOMRIGHT', 0, 0);
    button.backdrop:SetAlpha(0.5);

    local text = button.Text;
    text:ClearAllPoints();
    text:SetPoint("LEFT", button, "LEFT", 10, 0);
    text:SetFont(UNIT_NAME_FONT, 12, "");
    text:SetTextColor(178 / 255, 178 / 255, 178 / 255);
    text:SetHeight(button:GetHeight());
    text:SetJustifyV("MIDDLE");

    local icon = button.Icon;
    icon:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowup_down");
    icon:SetRotation(3.14);
    icon:SetPoint("RIGHT", -15, 0);
    icon:SetSize(20, 20);

    button:HookScript("OnMouseDown", function(self)
        self.Icon:SetPoint("RIGHT", -15, 0);
    end);

    button:HookScript("OnShow", function()
        GW2_ADDON.AchievementFrameFilterDropDownDummy:Hide();
    end);

    button:HookScript("OnHide", function()
        if AchievementFrameFilterDropDown:IsShown() then
            GW2_ADDON.AchievementFrameFilterDropDownDummy:Hide();
        else
            GW2_ADDON.AchievementFrameFilterDropDownDummy:Show();
        end
    end);
end

do -- [[ Search ]]
    local function SkinSearchOptionsButton(button, searchBoxFrame, skins)
        button:GwStripTextures();
        button.TopLeft:Hide();
        button.TopRight:Hide();
        button.BottomLeft:Hide();
        button.BottomRight:Hide();
        button.TopMiddle:Hide();
        button.MiddleLeft:Hide();
        button.MiddleRight:Hide();
        button.BottomMiddle:Hide();
        button.MiddleMiddle:Hide();
        local icon = button.Icon;
        icon:SetAtlas("common-search-magnifyingglass");
        button:GwCreateBackdrop(GW2_ADDON.BackdropTemplates.DopwDown, true);
        button.backdrop:SetBackdropColor(0, 0, 0);

        button:ClearAllPoints();
        button:SetPoint("RIGHT", searchBoxFrame, "RIGHT", -3, 0);
    end
    gw2_ui.SkinSearchOptionsButton = SkinSearchOptionsButton;

    local function SkinSearchBoxFrame(frame, categoriesFrame)
        frame:ClearAllPoints();
        frame:SetPoint("BOTTOMLEFT", categoriesFrame, "TOPLEFT", 0, 10);
        frame:SetPoint("BOTTOMRIGHT", categoriesFrame, "TOPRIGHT", 0, 10);
        frame:SetFont(UNIT_NAME_FONT, 14, "");
        GW2_ADDON.SkinTextBox(frame.Middle, frame.Left, frame.Right);
        frame:SetHeight(26);
        frame.searchIcon:Hide();
        frame:SetFont(UNIT_NAME_FONT, 14, "");
        frame.Instructions:SetFont(UNIT_NAME_FONT, 14, "");
        frame.Instructions:SetTextColor(178 / 255, 178 / 255, 178 / 255);
    end
    gw2_ui.SkinSearchBoxFrame = SkinSearchBoxFrame;

    local function SkinSearchPreviewFrame(frame, searchBoxFrame)
        frame:GwStripTextures();
        frame:ClearAllPoints();
        frame:SetPoint("TOPLEFT", searchBoxFrame, "BOTTOMLEFT", 0, 0);
        frame:SetPoint("TOPRIGHT", searchBoxFrame, "BOTTOMRIGHT", 0, 0);

        for _, button in next, frame.Buttons do
            button.Name:SetFont(UNIT_NAME_FONT, 12, "");
            button:SetPoint("RIGHT");
        end
        frame.ShowFullSearchResultsButton.Text:SetFont(UNIT_NAME_FONT, 12, "");
    end
    gw2_ui.SkinSearchPreviewFrame = SkinSearchPreviewFrame;

    local function SkinSearchResultsFrame(frame)
        -- frame:StripTextures();
        -- frame:CreateBackdrop('Transparent');

        -- for _, button in next, frame.Container.buttons do
        --     button:SetNormalTexture('');
        --     button:SetPushedTexture('');
        --     button:GetRegions():Hide();

        --     button.resultType:SetTextColor(1, 1, 1);
        --     button.path:SetTextColor(1, 1, 1);
        -- end

        -- skins:HandleCloseButton(frame.closeButton);
        -- skins:HandleScrollBar(frame.Container.ScrollBar);
    end
    gw2_ui.SkinSearchResultsFrame = SkinSearchResultsFrame;
end

do -- [[ Alerts and Side Buttons ]]
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
    gw2_ui.SkinAlertFrameTemplate = SkinAlertFrameTemplate;

    local function SkinSideButton(button, prevButton)
        if not button.HasGw2UiSkin then
            SkinAlertFrameTemplate(button, false);
        end
        if not prevButton then
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.IsDragonflightRetail and 6 or 13); -- Make the 2nd button anchor like the 1st one
        else
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9); -- Make the 2nd button anchor like the 1st one
        end
        button.HasGw2UiSkin = true;
    end

    local function SkinSideButtons()
        local i = 1;
        local button = _G["AchievementFrameSideButton" .. i];
        local prevButton;
        while button do
            SkinSideButton(button, prevButton);
            prevButton = button;
            i = i + 1;
            button = _G["AchievementFrameSideButton" .. i];
        end
    end
    gw2_ui.SkinSideButtons = SkinSideButtons;
end

do -- [[ Header ]]
    local function UpdatePointsDisplay()
        if not addon.InGuildView() and addon.Options.db.profile.AchievementPoints.Format == 2 then
            AchievementFrame.Header.Points:SetHeight(AchievementFrame.Header.Shield:GetHeight());
            AchievementFrame.Header.Points:SetPoint("TOP", AchievementFrame.Header.Shield);
            AchievementFrame.Header.Points:SetPoint("BOTTOM", AchievementFrame.Header.Shield);
            AchievementFrame.Header.Points:SetPoint("RIGHT", addon.GUI.Search.BoxFrame);
        end
    end

    local function SkinHeader()
        hooksecurefunc(AchievementFrame.Header.Points, "SetText", UpdatePointsDisplay);
        hooksecurefunc("AchievementFrame_RefreshView", UpdatePointsDisplay);
        hooksecurefunc("AchievementFrame_UpdateTabs", UpdatePointsDisplay);
    end
    gw2_ui.SkinHeader = SkinHeader;
end

local function ReskinBlizzard()
    addon.GUI.AchievementFrameHeader.Button:ClearAllPoints();
    addon.GUI.AchievementFrameHeader.Button:SetPoint("TOPLEFT", AchievementFrame.Header.Shield);
    addon.GUI.AchievementFrameHeader.Button:SetPoint("BOTTOMRIGHT", AchievementFrame.Header.Points);
end

do -- [[ Calendar ]]
    local function SkinCalendarButton(button)
        button:SetText("");
        button:ClearAllPoints();
        button:SetPoint("RIGHT", AchievementFrameCloseButton, "LEFT", -5, 0);
        button:SetHitRectInsets(0, 0, 0, 0);
        button:SetSize(32, 32);
        button:GwStripTextures();
        button:SetNormalTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
        button:SetPushedTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
        button:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/icons/calendar");
        button:GetNormalTexture():SetTexCoord(0, 1, 0, 1);
        button:GetPushedTexture():SetTexCoord(0, 1, 0, 1);
        button:GetHighlightTexture():SetTexCoord(0, 1, 0, 1);
    end
    gw2_ui.SkinCalendarButton = SkinCalendarButton;

    local function SkinCalendarDayButton(button, engine, skins)
        -- button.DarkFrame:SetAlpha(.5);

        -- if KrowiAF_SavedData.ElvUISkin.NoParchment then
        --     button:DisableDrawLayer('BACKGROUND');
        -- end

        -- button:SetTemplate(nil, nil, nil, true);
        -- button:SetBackdropColor(0,0,0,0);
        -- button:SetHighlightTexture(engine.media.glossTex);
        -- button:SetFrameLevel(button:GetFrameLevel() + 1);

        -- local hl = button:GetHighlightTexture();
        -- hl:SetVertexColor(1, 1, 1, 0.3);
        -- hl:Point('TOPLEFT', -1, 1);
        -- hl:Point('BOTTOMRIGHT');
        -- hl.SetAlpha = engine.noop;
    end

    local function SkinCalendarFrame(frame, engine, skins)
        -- frame:DisableDrawLayer("BORDER");
        -- frame:CreateBackdrop("Transparent");

        -- local closeButton = frame.CloseButton;
        -- skins:HandleCloseButton(closeButton);
        -- closeButton:Point("TOPRIGHT", -4, -4);

        -- for i = 1, 7 do
        -- 	frame.WeekDayBackgrounds[i]:SetAlpha(0);
        -- end

        -- frame.MonthBackground:SetAlpha(0);
        -- frame.YearBackground:SetAlpha(0);

        -- skins:HandleNextPrevButton(frame.PrevMonthButton, nil, nil, true)
        -- skins:HandleNextPrevButton(frame.NextMonthButton, nil, nil, true)

        -- for i = 1, 42 do
        --     SkinCalendarDayButton(frame.DayButtons[i], engine, skins);
        -- end

        -- local weekdaySelectedTexture = frame.WeekdaySelectedTexture;
        -- weekdaySelectedTexture:SetDesaturated(true);
        -- weekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6);

        -- local todayFrame = frame.TodayFrame;
        -- todayFrame.Texture:Hide()
        -- todayFrame.Glow:Hide()

        -- todayFrame:SetTemplate();
        -- todayFrame:SetBackdropBorderColor(_G.NORMAL_FONT_COLOR:GetRGB());
        -- todayFrame:SetBackdropColor(0, 0, 0, 0);
        -- todayFrame:SetScript("OnUpdate", nil);

        -- hooksecurefunc(frame, "SetToday", function()
        -- 	todayFrame:SetAllPoints();
        -- end);

        -- frame.MonthAchievementsAndPoints:SetPoint("TOPRIGHT", -40, -13);
    end
    gw2_ui.SkinCalendarFrame = SkinCalendarFrame;

    local function SkinCalendarSideFrame(frame, engine, skins)
        -- frame:StripTextures(true);
        -- frame:SetTemplate('Transparent');
        -- frame:Point('TOPLEFT', frame:GetParent(), 'TOPRIGHT', 3, -24);
        -- frame.Header:StripTextures();
        -- skins:HandleCloseButton(frame.CloseButton);

        -- frame.ScrollFrameBorder.ScrollFrame.ScrollBar.trackBG:SetAlpha(0);
        -- frame.ScrollFrameBorder.ScrollFrame:CreateBackdrop("Transparent");
        -- frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("TOPLEFT", 1, 2);
        -- frame.ScrollFrameBorder.ScrollFrame.backdrop:Point("BOTTOMRIGHT", -2, -3);

        -- -- Buttons
        -- for _, button in next, frame.ScrollFrameBorder.ScrollFrame.buttons do
        --     SkinAchievementButton(button, engine, skins);
        -- end

        -- hooksecurefunc(frame.ScrollFrameBorder.ScrollFrame, "update", function(frame)
        --     for _, button in next, frame.buttons do
        --         if button:IsShown() then
        --             SetAchievementButtonColor(button, engine);
        --         else
        --             return;
        --         end
        --     end
        -- end);

        -- hooksecurefunc(frame, "Show", function(frame)
        --     for _, button in next, frame.ScrollFrameBorder.ScrollFrame.buttons do
        --         if button:IsShown() then
        --             SetAchievementButtonColor(button, engine);
        --         else
        --             return;
        --         end
        --     end
        -- end);

        -- -- Scrollbar
        -- if frame.ScrollFrameBorder.ScrollFrame.ScrollBar then
        --     skins:HandleScrollBar(frame.ScrollFrameBorder.ScrollFrame.ScrollBar, 5);
        -- end
    end
    gw2_ui.SkinCalendarSideFrame = SkinCalendarSideFrame;
end

local function SkinDataManager(frame)
    -- frame:StripTextures();
    -- frame.Inset:StripTextures();
    -- frame.CloseButton:Point("TOPRIGHT", 0, 2);
    -- skins:HandleFrame(frame, true, nil, -5, 0, -1, 0);
    
    -- frame.CharacterList.InsetFrame:StripTextures();
    -- skins:HandleInsetFrame(frame.CharacterList.InsetFrame);
    -- skins:HandleScrollBar(frame.CharacterList.ScrollFrame.ScrollBar)
    
	-- local columnDisplay = frame.CharacterList.ColumnDisplay;
	-- columnDisplay:StripTextures();
	-- columnDisplay.InsetBorderLeft:Hide();
	-- columnDisplay.InsetBorderBottomLeft:Hide();
	-- columnDisplay.InsetBorderTopLeft:Hide();
	-- columnDisplay.InsetBorderTop:Hide();
    -- for i = 1, columnDisplay:GetNumChildren() do
    --     local child = select(i, columnDisplay:GetChildren())
    --     child:StripTextures();
    --     child:SetTemplate("Transparent");
    -- end

    -- -- frame.CharacterList.ScrollFrame:ClearAllPoints();
    -- -- frame.CharacterList.ScrollFrame:Point("TOPLEFT", frame.CharacterList, "TOPLEFT", 3, 5);
    -- -- frame.CharacterList.ScrollFrame:Point("BOTTOMRIGHT", frame.CharacterList, "BOTTOMRIGHT", 0, 0);
    -- for _, button in ipairs(frame.CharacterList.ScrollFrame.buttons or {}) do
    --     skins:HandleCheckBox(button.HeaderTooltip);
    --     button.HeaderTooltip:Size(25, 25);
    --     button.HeaderTooltip:ClearAllPoints();
    --     button.HeaderTooltip:Point("LEFT", button.Points, "RIGHT", 19, 0);
    --     skins:HandleCheckBox(button.EarnedByAchievementTooltip);
    --     button.EarnedByAchievementTooltip:Size(25, 25);
    --     button.EarnedByAchievementTooltip:ClearAllPoints();
    --     button.EarnedByAchievementTooltip:Point("LEFT", button.HeaderTooltip, "RIGHT", 74, 0);

    --     skins:HandleCheckBox(button.MostProgressAchievementTooltip);
    --     button.MostProgressAchievementTooltip:Size(25, 25);
    --     button.MostProgressAchievementTooltip:ClearAllPoints();
    --     button.MostProgressAchievementTooltip:Point("LEFT", button.EarnedByAchievementTooltip, "RIGHT", 74, 0);

    --     skins:HandleCheckBox(button.IgnoreCharacter);
    --     button.IgnoreCharacter:Size(25, 25);
    --     button.IgnoreCharacter:ClearAllPoints();
    --     button.IgnoreCharacter:Point("LEFT", button.MostProgressAchievementTooltip, "RIGHT", 73, 0);
    -- end
end

local function ReskinGw2Ui()
    hooksecurefunc(addon.GUI, "ToggleAchievementFrame", function()
        if addon.GUI.SelectedTab then
            addon.GUI.SetAchievementFrameWidth();
            addon.GUI.SetAchievementFrameHeight();
        end
    end);

    GW2_ADDON.AchievementFrameSkinFunction.AchievementBackgroundTextures.red = "Interface/AddOns/Krowi_AchievementFilter/Plugins/GW2_UI/GW2_UI-achievementcompletebgorange";
end

local function SkinAll()
    if KrowiAF_SavedData.GW2_UISkin.Achievements then
        gw2_ui.SkinTabs();
        gw2_ui.SkinCategoriesFrame(addon.GUI.CategoriesFrame);
        SkinGameTooltipProgressBar(addon.GUI.GameTooltipProgressBar);
        gw2_ui.SkinAchievementsFrame(addon.GUI.AchievementsFrame, addon.GUI.CategoriesFrame);
        gw2_ui.SkinAchievementSummary(addon.GUI.SummaryFrame, addon.GUI.CategoriesFrame);
        SkinFilterButton(addon.GUI.FilterButton);
        gw2_ui.SkinSearchOptionsButton(addon.GUI.Search.OptionsMenuButton, addon.GUI.Search.BoxFrame);
        gw2_ui.SkinSearchBoxFrame(addon.GUI.Search.BoxFrame, addon.GUI.CategoriesFrame);
        gw2_ui.SkinSearchPreviewFrame(addon.GUI.Search.PreviewFrame, addon.GUI.Search.BoxFrame);
    --     gw2_ui.SkinSearchResultsFrame(addon.GUI.Search.ResultsFrame);
        gw2_ui.SkinHeader();
        ReskinBlizzard();
        gw2_ui.SkinCalendarButton(addon.GUI.Calendar.Button);
    --     SkinDataManager(addon.GUI.DataManagerFrame);
        ReskinGw2Ui();
    end
    -- if KrowiAF_SavedData.ElvUISkin.Calendar then
    --     gw2_ui.SkinCalendarFrame(addon.GUI.Calendar.Frame);
    --     gw2_ui.SkinCalendarSideFrame(addon.GUI.Calendar.SideFrame);
    -- end
end

local function SkinAlertFrames()
    if not KrowiAF_SavedData.GW2_UISkin.AlertFrames then
        return;
    end

    hooksecurefunc(addon.GUI.AlertSystem, "setUpFunction", function(frame)
        gw2_ui.SkinAlertFrameTemplate(frame);
    end);
end

local function SkinFloatingAchievementTooltip()
    if not KrowiAF_SavedData.GW2_UISkin.Tooltip then
        return;
    end

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

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
plugins.LoadHelper:RegisterEvent("PLAYER_LOGIN");
function gw2_ui:OnEvent(event, arg1, arg2)
    if event == "PLAYER_LOGIN" then
        if GW2_ADDON and gw2_ui.IsLoaded() then
            SkinAlertFrames();
            SkinFloatingAchievementTooltip();
        end
    end
end

local function AddInfo(localizationName, getFunction, hidden)
    return {
        order = addon.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["GW2_UI " .. localizationName],
        desc = addon.L["GW2_UI " .. localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true,
        hidden = hidden
    };
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
function gw2_ui.InjectOptions()
    local pluginTable = addon.InjectOptions:AddPluginTable("GW2_UI", addon.L["GW2_UI"], "", function()
        return GW2_ADDON ~= nil and gw2_ui.IsLoaded();
    end);

    addon.InjectOptions:AddTable(pluginTable, "Unsupported", {
        order = OrderPP(), type = "description", width = "full",
        name = (addon.L["Unsupported GW2_UI Desc"]:K_ReplaceVars(IsAddOnLoaded("GW2_UI") and GetAddOnMetadata("GW2_UI", "Version") or "") ..
        (addon.IsDragonflightRetail and (" " .. addon.L["At least version is required"]:K_ReplaceVars("6.6.1")) or "\n")):SetColorRed(),
        fontSize = "medium",
        hidden = not (GW2_ADDON ~= nil and not gw2_ui.IsLoaded())
    });

    addon.InjectOptions:AddTable(pluginTable, "SkinsDescription", {
        order = OrderPP(), type = "description", width = "full",
        name = addon.L["GW2_UI Skins Desc"],
        fontSize = "medium"
    });
    addon.InjectOptions:AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return KrowiAF_SavedData.GW2_UISkin.Achievements; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinDropDown", AddInfo("Skin DropDown", function() return KrowiAF_SavedData.GW2_UISkin.DropDown; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinPopupNotifications", AddInfo("Skin Popup Notifications", function() return KrowiAF_SavedData.GW2_UISkin.PopUpNotifications; end));
    -- addon.InjectOptions:AddTable(pluginTable, "SkinTutorials", AddInfo("Skin Tutorials", function() return KrowiAF_SavedData.ElvUISkin.Tutorials; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinAlertFrames", AddInfo("Skin Alert Frames", function() return KrowiAF_SavedData.GW2_UISkin.AlertFrames; end));
    -- addon.InjectOptions:AddTable(pluginTable, "SkinCalendar", AddInfo("Skin Calendar", function() return KrowiAF_SavedData.ElvUISkin.Calendar; end));
    -- addon.InjectOptions:AddTable(pluginTable, "RemoveParchment", AddInfo("Remove Parchment", function() return KrowiAF_SavedData.ElvUISkin.NoParchment; end));
    -- addon.InjectOptions:AddTable(pluginTable, "SkinDataManager", AddInfo("Skin Data Manager", function() return KrowiAF_SavedData.ElvUISkin.Achievements; end));
    -- addon.InjectOptions:AddTable(pluginTable, "SkinAce3", AddInfo("Skin Ace3", function() return KrowiAF_SavedData.ElvUISkin.Options; end));
    -- addon.InjectOptions:AddTable(pluginTable, "FixWorldMapButton", AddInfo("Fix World Map Button", function() return KrowiAF_SavedData.ElvUISkin.SmallerWorldMap; end));

    addon.InjectOptions:AddTable(pluginTable, "ModulesDescription", {
        order = OrderPP(), type = "description", width = "full",
        name = addon.L["GW2_UI Modules Desc"],
        fontSize = "medium"
    });
    addon.InjectOptions:AddTable(pluginTable, "SkinTooltip", AddInfo("Skin Tooltip", function() return KrowiAF_SavedData.GW2_UISkin.Tooltip; end));
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
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "ElvUIComment", {
        order = OrderPP(), type = "description", width = "full",
        name = addon.L["Alert System Overwrite Desc"]:K_ReplaceVars(addon.L["GW2_UI"])
    });
end

function gw2_ui.Load()
    KrowiAF_SavedData.GW2_UISkin = {};
    if GW2_ADDON == nil or not gw2_ui.IsLoaded() then
        return;
    end

    KrowiAF_SavedData.GW2_UISkin.Achievements = GW2_ADDON.GetSetting("ACHIEVEMENT_SKIN_ENABLED");
    KrowiAF_SavedData.GW2_UISkin.DropDown = GW2_ADDON.GetSetting("DROPDOWN_SKIN_ENABLED");
    KrowiAF_SavedData.GW2_UISkin.PopUpNotifications = GW2_ADDON.GetSetting("STATICPOPUP_SKIN_ENABLED");
    KrowiAF_SavedData.GW2_UISkin.Tooltip = GW2_ADDON.GetSetting("TOOLTIPS_ENABLED");
    -- KrowiAF_SavedData.ElvUISkin.Tutorials = blizzardSkins.enable and blizzardSkins.tutorials;
    KrowiAF_SavedData.GW2_UISkin.AlertFrames = GW2_ADDON.GetSetting("ALERTFRAME_SKIN_ENABLED");
    -- KrowiAF_SavedData.ElvUISkin.Calendar = blizzardSkins.enable and blizzardSkins.calendar;
    -- KrowiAF_SavedData.ElvUISkin.NoParchment = blizzardSkins.enable and blizzardSkins.calendar and privateSkins.parchmentRemoverEnable;
    -- KrowiAF_SavedData.ElvUISkin.Options = privateSkins.ace3Enable;
    -- KrowiAF_SavedData.ElvUISkin.SmallerWorldMap = addon.IsWrathClassic and engine.global.general.smallerWorldMap;

    hooksecurefunc(addon.GUI, "LoadWithBlizzard_AchievementUI", function()
        SkinAll();
    end);

    hooksecurefunc(addon.GUI.SideButtonSystem, "Load", function()
        if KrowiAF_SavedData.GW2_UISkin.Achievements then
            gw2_ui.SkinSideButtons();
        end
        hooksecurefunc(addon.GUI.SideButtonSystem, "Refresh", function()
            if KrowiAF_SavedData.GW2_UISkin.Achievements then
                gw2_ui.SkinSideButtons();
            end
        end);
    end);

    -- if addon.IsWrathClassic then
    --     local worldMapModule = engine:GetModule("WorldMap");
    --     hooksecurefunc(worldMapModule, "SetSmallWorldMap", function()
    --         addon.GUI.WorldMapButton:SetFrameStrata("TOOLTIP");
    --     end);
    -- end

    DisableOptions();
end

function gw2_ui.IsLoaded()
    if not IsAddOnLoaded("GW2_UI") then
        return false;
    end
    if not addon.IsDragonflightRetail then -- No Wrath Classic support for now
        return false;
    end
    if GetAddOnMetadata("GW2_UI", "Version") == "@project-version@" then
        return true;
    end

    local versionComponents = strsplittable(".", GetAddOnMetadata("GW2_UI", "Version"));
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