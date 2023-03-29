-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from ElvUI to make it compatible with their skin.

-- [[ Namespaces ]] --
local addonName, addon = ...;
local plugins = addon.Plugins;
plugins.GW2_UI = {};
local gw2_ui = plugins.GW2_UI;
tinsert(plugins.Plugins, gw2_ui);

do -- [[ Shared ]]
    function gw2_ui.HandleAchivementsScrollControls(self)
        local scrollBar = self.ScrollFrame.ScrollBar;
    
        scrollBar:GwStripTextures();
        GW2_ADDON.HandleNextPrevButton(scrollBar.ScrollUpButton, "up");
        GW2_ADDON.HandleNextPrevButton(scrollBar.ScrollDownButton, "down");
        scrollBar.thumbTexture:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbarmiddle");
        scrollBar.thumbTexture:SetSize(12, 12);
    
        scrollBar:SetWidth(20);
    
        scrollBar.trackBG:ClearAllPoints();
        scrollBar.trackBG:SetPoint("TOP",  0, 0);
        scrollBar.trackBG:SetPoint("BOTTOM", 0, 0);
        scrollBar.trackBG:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbg");
    
        scrollBar.ScrollUpButton:ClearAllPoints();
        scrollBar.ScrollUpButton:SetPoint("BOTTOM", scrollBar, "TOP", 0, 0);
        scrollBar.ScrollUpButton:SetSize(12, 12);
        local bg = scrollBar.ScrollUpButton:CreateTexture("bg", "BACKGROUND", nil, 0);
        bg:ClearAllPoints();
        bg:SetPoint("TOPLEFT", 0, 0);
        bg:SetPoint("BOTTOMRIGHT", 0, 0);
        bg:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbutton");
    
        scrollBar.ScrollDownButton:ClearAllPoints();
        scrollBar.ScrollDownButton:SetPoint("TOP", scrollBar, "BOTTOM", 0, 0);
        scrollBar.ScrollDownButton:SetSize(12, 12);
        bg = scrollBar.ScrollDownButton:CreateTexture("bg", "BACKGROUND", nil, 0)
        bg:ClearAllPoints();
        bg:SetPoint("TOPLEFT", 0, 0);
        bg:SetPoint("BOTTOMRIGHT", 0, 0);
        bg:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbutton");
        bg:SetTexCoord(0, 1, 1, 0);
    end

    function gw2_ui.SetSmallText(self)
        self:SetFont(UNIT_NAME_FONT,11)
        self:SetTextColor(0.7,0.7,0.7)
    end

    function gw2_ui.SetNormalText(self)
        self:SetFont(UNIT_NAME_FONT,12)
        self:SetTextColor(1,1,1)
    end

    function gw2_ui.SetTitleText(self)
        self:SetFont(DAMAGE_TEXT_FONT, 14)
        self:SetTextColor(1,1,1)
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
        local indentation = addon.Options.db.Categories.Indentation;
        indentation = 2 + (category.Level - 1) * indentation;
        self.Label:SetText(category.Name);
        self.Label:SetPoint("LEFT", self, "LEFT", 25 + indentation, 0);
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
        button:HookScript("OnEnter", function()
            GW2_ADDON.TriggerButtonHoverAnimation(button, hl);
        end);

        button.SetIndentation = function(self, indentation)
            button.arrow:SetPoint("LEFT", 10 + (self.Category.Level - 1) * indentation, 0);
        end;

        local originalSetCategory = button.SetCategory;
        button.SetCategory = function(self, category)
            originalSetCategory(self, category);
            SetCategory(self, category);
        end;
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

    local function SkinCategoriesFrame(frame)
        -- Frame
        frame:GwStripTextures();

        -- Buttons
        local buttons = frame.ScrollFrame.buttons;
        for _, button in next, buttons do
            SkinCategoryButton(button);
        end
        hooksecurefunc(frame, "Update", function(self)
            local scrollFrame = self.ScrollFrame;
            local _buttons = scrollFrame.buttons;
            for i = 1, #_buttons do
                UpdateCategoryState(buttons[i], i);
            end
        end);

        -- Scrollbar
        gw2_ui.HandleAchivementsScrollControls(frame);

        -- Re-adjust scrollings after frame size change
        local buttonHeight = buttons[1]:GetHeight();
        frame.ScrollFrame.buttonHeight = math.floor(buttonHeight + 0.5);
        local scrollBar = frame.ScrollFrame.scrollBar;
        scrollBar.buttonHeight = buttonHeight;
        scrollBar:SetValue(0);
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
    progressBar:SetColors({R = 4 / 255, G = 179 / 255, B = 30 / 255}, {R = 179 / 255, G = 4 / 255, B = 30 / 255});
end

do -- [[ Achievements]]
    local buttonOffset = 5;
    local barColors = {
        incomplete = { r = 93 / 255, g = 93 / 255, b = 93 / 255, a = 1 },
        red = { r = 153 / 255, g = 60 / 255, b = 48 / 255, a = 1 },
        blue = { r = 48 / 255, g = 56 / 255, b = 153 / 255 , a = 1 },
    };

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

        local bColor = barColors.incomplete;
        if parentFrame.Completed and parentFrame.accountWide then
            bColor = barColors.blue;
        elseif parentFrame.Completed and not parentFrame.accountWide  then
            bColor = barColors.red;
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
            self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -5, 5 + buttonOffset);
            self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 5 + buttonOffset);
            self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooternotrack");
        else
            self.Tracked:Show();
            self.DateCompleted:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -50, 5 + buttonOffset);
            self.DateCompleted:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 0, 5 + buttonOffset);
            self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooter");
        end
    end

    local function SetAchievement(self, achievement, refresh)
        if not achievement then
            return;
        end

        if self.Completed then
            self.completedBackground:Show();
            self.cBackground:Hide();
            self.gwBackdrop:Show();
            self.completedBackground:SetAlpha(1);
        else
            self.completedBackground:Hide();
            self.cBackground:Show();
            self.gwBackdrop:Hide();
            if self.accountWide then
                self.completedBackground:Show();
                self.completedBackground:SetAlpha(0.1);
            end
        end

        self.completeFlare:Hide();
        if self.accountWide then
            self.completedBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebg");
        else
            self.completedBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementcompletebgred");
        end

        if IsTrackedAchievement(achievement.Id) then
            self.trackBackground:Show();
            self.bottomBar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementfooternotrack");
        else
            self.trackBackground:Hide();
        end

        gw2_ui.SetSmallText(self.Reward);

        self.Background:Hide();
        self.HiddenDescription:SetTextColor(1, 1, 1);
        self.Description:SetTextColor(1, 1, 1);

        CollapseAchievement(self);
    end

    local function SkinAchievementButton(buttons, button, index)
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
        button:SetHeight(125);
        button.CollapsedHeight = 125;

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
        gw2_ui.SetTitleText(button.Header);
        button.Header:SetJustifyH("LEFT");

        -- Reskin description
        button.Description:ClearAllPoints();
        button.Description:SetPoint("TOPLEFT", button.Header, "BOTTOMLEFT", 0, -5);
        button.Description:SetPoint("TOPRIGHT", button.Header, "BOTTOMRIGHT", 0, -5);
        button.Description:SetJustifyH("LEFT");
        button.Description:SetHeight(40);
        hooksecurefunc(button.Description, "SetTextColor", function(_, r, g, b)
            if r == 0 and g == 0 and b == 0 then
                button.Description:SetTextColor(1, 1, 1);
            end
        end);
        gw2_ui.SetNormalText(button.Description);

        -- Add a new reward icon
        button.rewardIcon = button:CreateTexture("rewardIcon", "BORDER", nil, 0);
        button.rewardIcon:ClearAllPoints();
        button.rewardIcon:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 125, 3 + buttonOffset);
        button.rewardIcon:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/rewardchestsmall");
        button.rewardIcon:SetSize(24, 24);
        hooksecurefunc(button.Reward, "Hide", function()
            button.rewardIcon:Hide();
        end);
        hooksecurefunc(button.Reward, "Show", function()
            button.rewardIcon:Show();
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
        gw2_ui.SetSmallText(button.Reward);

        -- Reskin hidden description text
        button.HiddenDescription:SetPoint("TOPLEFT", button.Header, "BOTTOMLEFT", 0, -5);
        button.HiddenDescription:SetPoint("TOPRIGHT", button.Header, "BOTTOMRIGHT", 0, -5);
        button.HiddenDescription:SetJustifyH("LEFT");
        button.HiddenDescription:SetHeight(40);
        gw2_ui.SetNormalText(button.HiddenDescription);

        -- Reskin completion date
        button.DateCompleted:ClearAllPoints();
        button.DateCompleted:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -5, 5 + buttonOffset);
        button.DateCompleted:SetPoint("BOTTOMLEFT", button, "BOTTOMLEFT", 0, 5 + buttonOffset);
        button.DateCompleted:SetHeight(15);
        button.DateCompleted:SetJustifyH("RIGHT");
        gw2_ui.SetSmallText(button.DateCompleted);

        -- Hide the achievement icon
        button.Icon.Border:Hide();
        button.Icon.Texture:Hide();

        -- Move the shield
        button.Shield:ClearAllPoints();
        button.Shield:SetPoint("CENTER", button.cBackground, "CENTER", 0, 0);

        -- Make sure the achievement objectives are skinned
        hooksecurefunc(button, "DisplayObjectives", function(self, id, completed)
            local objectivesFrame = addon.GUI.AchievementsObjectives;
            objectivesFrame:ClearAllPoints();
            objectivesFrame:SetPoint("TOPLEFT", self.HiddenDescription, "BOTTOMLEFT");
            objectivesFrame:SetPoint("TOPRIGHT", self.HiddenDescription, "BOTTOMRIGHT");

            local i = 1;
            while _G["KrowiAF_AchievementsObjectivesMeta" .. i] do
                gw2_ui.SetSmallText(_G["KrowiAF_AchievementsObjectivesMeta" .. i].Label);
                i = i + 1;
            end

            i = 1;
            while _G["KrowiAF_AchievementsObjectivesTextCriteria" .. i] do
                gw2_ui.SetSmallText(_G["KrowiAF_AchievementsObjectivesTextCriteria" .. i].Name);
                i = i + 1;
            end

            i = 1;
            while _G["KrowiAF_AchievementsObjectivesProgressBar" .. i] do
                SkinCriteriaStatusbar(self, _G["KrowiAF_AchievementsObjectivesProgressBar" .. i]);
                i = i + 1;
            end
        end);

        -- Extra flare when achievement is completed
        button.completeFlare = button:CreateTexture("completeFlare", "BACKGROUND", nil, 0);
        button.completeFlare:ClearAllPoints();
        button.completeFlare:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
        button.completeFlare:SetSize(256, 128);
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
        button.completedBackground:SetPoint("BOTTOMLEFT", button, "TOPLEFT", 0, -120);
        button.completedBackground:SetWidth(240);
        button.completedBackground:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementcomplete");
        button.completedBackground:SetVertexColor(1, 1, 1, 0.7);

        -- Reskin the track button
        button.Tracked:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchicon");
        button.Tracked:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchiconactive");
        button.Tracked:SetCheckedTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchiconactive");
        button.Tracked:SetPushedTexture("Interface/AddOns/GW2_UI/textures/uistuff/watchicon");
        _G[button:GetName() .. "TrackedText"]:Hide();
        button.Tracked:ClearAllPoints();
        button.Tracked:SetPoint("BOTTOMRIGHT", button.bottomBar, "BOTTOMRIGHT", -7, buttonOffset);
        button.Tracked:SetSize(30, 30);

        -- Highligh that will cover the entire button
        button.Highlight:GwStripTextures();
        button.Highlight.Bottom = _G[button.Highlight:GetName() .. "Bottom"];
        button.Highlight.Bottom:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/achievementhover");
        button.Highlight.Bottom:SetBlendMode("ADD");
        button.Highlight.Bottom:ClearAllPoints();
        button.Highlight.Bottom:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0);
        button.Highlight.Bottom:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, buttonOffset);
        button.Highlight.Bottom:SetTexCoord(0, 1, 0, 1);
        button.Highlight.Bottom:SetVertexColor(1, 1, 1, 1);
        button.hasSkinnedHighlight = true;
        button:HookScript("OnEnter",function()
            GW2_ADDON.TriggerButtonHoverAnimation(button,button.Highlight.Bottom);
        end);

        hooksecurefunc(button, "SetAchievement", SetAchievement);
        hooksecurefunc(button, "Collapse", CollapseAchievement);
    end

    local function SkinAchievementsFrame(frame)
        -- Frame
        frame:GwStripTextures();

        frame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
        frame.Background:SetTexCoord(0, 1, 0, 1);

        frame.ScrollFrame:SetPoint("TOPLEFT", 8, -8);
        frame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", frame.ScrollFrame, "TOPRIGHT", 1, -4);
        frame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", frame.ScrollFrame, "BOTTOMRIGHT", 1, 6);

        hooksecurefunc(addon.GUI.CategoriesFrame, "Show_Hide", function(self, func, offsetX)
            frame:ClearPoint("TOPLEFT");
            frame:SetPoint("TOP", 0, -10);
            frame:SetPoint("LEFT", self, "RIGHT", offsetX, 0);
            frame:SetPoint("BOTTOM", 0, 20);
            frame:SetPoint("RIGHT", frame.ScrollFrame.ScrollBar:IsShown() and -20 or 0, 0);
        end);

        hooksecurefunc(frame, "Show_Hide", function(self, func, offsetX)
            self:ClearPoint("RIGHT");
            self:SetPoint("RIGHT", self:IsShown() and -20 or 0, 0);
        end);

        -- Buttons
        local buttons = frame.ScrollFrame.buttons;
        for i, button in next, buttons do
            SkinAchievementButton(buttons, button, i);
        end

        -- Scrollbar
        gw2_ui.HandleAchivementsScrollControls(frame);

        -- Re-adjust scrollings after frame size change
        local buttonHeight = buttons[1]:GetHeight();
        frame.ScrollFrame.buttonHeight = math.floor(buttonHeight + 0.5);
        local scrollBar = frame.ScrollFrame.scrollBar;
        scrollBar.buttonHeight = buttonHeight;
        scrollBar:SetValue(0);
    end
    gw2_ui.SkinAchievementsFrame = SkinAchievementsFrame;
    gw2_ui.SkinAchievementButton = SkinAchievementButton;
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
        statusBar:GwCreateBackdrop(GW2_ADDON.constBackdropFrameColorBorder, true);
        statusBar.backdrop:SetPoint("TOPLEFT", 13, -13);
        statusBar.backdrop:SetPoint("BOTTOMRIGHT", -11, 13);
        statusBar.backdrop:SetBackdropBorderColor(0, 0, 0, 1);
        statusBar:SetColors({R = 4 / 255, G = 179 / 255, B = 30 / 255}, {R = 179 / 255, G = 4 / 255, B = 30 / 255});
        if statusBar.Button then
            local button = statusBar.Button;
            button:GwStripTextures();

        --     local htex = button:CreateTexture();
        --     htex:SetColorTexture(1, 1, 1, 0.3);
        --     htex:SetAllPoints(statusBar.backdrop);
        --     button:SetHighlightTexture(htex);

        --     button:SetScript("OnLeave", function(self)
        --     end);
        --     button:SetScript("OnEnter", function(self)
        --     end);
        end

        -- statusBar:GwStripTextures()
        local fname = statusBar:GetName()
        -- local bar = _G[fname.."FillBar"]
        -- local title = _G[fname.."Title"] or statusBar.Label
        -- local text = _G[fname.."Text"]
        local spark = _G[fname.."Spark"]

        if not spark then
            statusBar.spark = statusBar:CreateTexture(fname .. "Spark", "BORDER", nil, 7);
            statusBar.spark:ClearAllPoints();
            statusBar.spark:SetPoint("RIGHT", fills[2], "RIGHT", 0, 0);
            statusBar.spark:SetSize(10, fills[2]:GetHeight());
            statusBar.spark:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/statusbar-spark-white");
        end

        -- bar:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/StatusBar")
        -- bar:SetVertexColor(1, 1, 1, 0.5)
        -- bar:GwSetOutside()
        statusBar.TextLeft:ClearAllPoints();
        statusBar.TextLeft:SetPoint("BOTTOMLEFT", statusBar.backdrop, "TOPLEFT", 0, 5);
        gw2_ui.SetNormalText(statusBar.TextLeft);

        -- statusBar.TextRight:ClearAllPoints();
        -- statusBar.TextRight:SetPoint("RIGHT", statusBar, "RIGHT", -5, 0);
        statusBar.TextRight:SetFont(DAMAGE_TEXT_FONT, 11);
        statusBar.TextRight:SetTextColor(1, 1, 1);
        -- statusBar.TextRight:SetHeight(statusBar.backdrop:GetHeight());
        -- statusBar.TextRight:SetJustifyV("MIDDLE");
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
        gw2_ui.SetTitleText(text);
    end

    local function SkinAchievementSummary(frame)
        -- Frame
        frame:GwStripTextures();
        frame:GetChildren():Hide();

        frame.Background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/listbackground");
        frame.Background:SetTexCoord(0, 1, 0, 1);

        hooksecurefunc(addon.GUI.CategoriesFrame, "Show_Hide", function(self, func, offsetX)
            frame:ClearPoint("TOPLEFT");
            frame:SetPoint("TOP", 0, -10);
            frame:SetPoint("LEFT", self, "RIGHT", offsetX, 0);
        end);

        SkinAchievementSummaryHeaders(frame.Achievements.Header);
        SkinAchievementSummaryHeaders(frame.Categories.Header);

        -- Buttons
        local buttons = frame.ScrollFrameBorder.ScrollFrame.buttons;
        for i, button in next, buttons do
            gw2_ui.SkinAchievementButton(buttons, button, i);
        end

        -- -- Buttons
        -- local buttons = frame.ScrollFrameBorder.ScrollFrame.buttons;
        -- for _, button in next, buttons do
        --     SkinAchievementButton(button, engine, skins);
        -- end

        -- hooksecurefunc(frame.ScrollFrameBorder.ScrollFrame, "update", function(frame)
        --     for _, button in next, buttons do
        --         if button:IsShown() then
        --             SetAchievementButtonColor(button, engine);
        --         else
        --             return;
        --         end
        --     end
        -- end);

        -- hooksecurefunc(frame, "Show", function(frame)
        --     for _, button in next, buttons do
        --         if button:IsShown() then
        --             SetAchievementButtonColor(button, engine);
        --         else
        --             return;
        --         end
        --     end
        -- end);

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

        -- Scrollbar
        gw2_ui.HandleAchivementsScrollControls(frame.ScrollFrameBorder);

        -- Re-adjust scrollings after frame size change
        local buttonHeight = buttons[1]:GetHeight();
        frame.ScrollFrameBorder.ScrollFrame.buttonHeight = math.floor(buttonHeight + 0.5);
        local scrollBar = frame.ScrollFrameBorder.ScrollFrame.scrollBar;
        scrollBar.buttonHeight = buttonHeight;
        scrollBar:SetValue(0);
    end
    gw2_ui.SkinAchievementSummary = SkinAchievementSummary;
end

local constBackdropDropDown = {
    bgFile = "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar",
    edgeFile = "",
    tile = false,
    tileSize = 64,
    edgeSize = 32,
    insets = {left = 0, right = 0, top = 0, bottom = 0}
};

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

    button:GwCreateBackdrop(constBackdropDropDown, true);
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
        button:GwCreateBackdrop(constBackdropDropDown, true);
        button.backdrop:SetBackdropColor(0, 0, 0);

        button:ClearAllPoints();
        button:SetPoint("RIGHT", searchBoxFrame, "RIGHT", -3, 0);
    end
    gw2_ui.SkinSearchOptionsButton = SkinSearchOptionsButton;

    local function SkinSearchBoxFrame(frame)
        frame:ClearAllPoints();
        frame:SetPoint('BOTTOMLEFT', AchievementFrameCategories, 'TOPLEFT', 0, 10);
        frame:SetWidth(237);
        frame:SetFont(UNIT_NAME_FONT, 14, "");
        GW2_ADDON.SkinTextBox(frame.Middle, frame.Left, frame.Right);
        frame:SetHeight(26);
        frame.searchIcon:Hide();
        frame:SetFont(UNIT_NAME_FONT, 14, "");
        frame.Instructions:SetFont(UNIT_NAME_FONT, 14, "");
        frame.Instructions:SetTextColor(178 / 255, 178 / 255, 178 / 255);

        hooksecurefunc(addon.GUI.CategoriesFrame, "Show_Hide", function(self, func, offsetX)
            frame:SetWidth(self:GetWidth() + offsetX);
        end);
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

    local function SkinSearchResultsFrame(frame, skins)
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
end

local function ForceAlpha(self, alpha, forced)
	-- if alpha ~= 1 and forced ~= true then
	-- 	self:SetAlpha(1, true)
	-- end
end

local constBackdropAlertFrame = {
    bgFile = "Interface/AddOns/GW2_UI/textures/hud/toast-bg",
    edgeFile = "",
    tile = false,
    tileSize = 64,
    edgeSize = 32,
    insets = {left = 2, right = 2, top = 2, bottom = 2}
}

local function AddFlare(frame, flarFrame)
    if not flarFrame then return end

    if not frame.flareIcon then
        frame.flareIcon = flarFrame
    end

    if not flarFrame.flare then
        flarFrame.flare = flarFrame:CreateTexture(nil, "BACKGROUND")
        flarFrame.flare:SetTexture("Interface/AddOns/GW2_UI/textures/hud/level-up-flare")
        flarFrame.flare:SetPoint("CENTER")
        flarFrame.flare:SetSize(120, 120)
        flarFrame.flare:Show()
    end
    if not flarFrame.flare2 then
        flarFrame.flare2 = flarFrame:CreateTexture(nil, "BACKGROUND")
        flarFrame.flare2:SetTexture("Interface/AddOns/GW2_UI/textures/hud/level-up-flare")
        flarFrame.flare2:SetPoint("CENTER")
        flarFrame.flare2:SetSize(120, 120)
        flarFrame.flare2:Show()
    end

    if not flarFrame.animationGroup1 then
        flarFrame.animationGroup1 = flarFrame.flare:CreateAnimationGroup()
        local a1 = flarFrame.animationGroup1:CreateAnimation("Rotation")
        a1:SetDegrees(2000)
        a1:SetDuration(60)
        a1:SetSmoothing("OUT")
    end

    if not flarFrame.animationGroup2 then
        flarFrame.animationGroup2 = flarFrame.flare2:CreateAnimationGroup()
        local a2 = flarFrame.animationGroup2:CreateAnimation("Rotation")
        a2:SetDegrees(-2000)
        a2:SetDuration(60)
        a2:SetSmoothing("OUT")
    end
end

local function SkinAlertFrameTemplate(frame, addFlare)
    frame:SetAlpha(1);

    if not frame.hooked then
        hooksecurefunc(frame, 'SetAlpha', ForceAlpha);
        frame.hooked = true;
    end

    if not frame.backdrop then
        frame:GwCreateBackdrop(constBackdropAlertFrame)
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
        AddFlare(frame, frame.Icon.Texture.b);
    end
end

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

do -- [[ Header ]]
    local function UpdatePointsDisplay()
        if not addon.InGuildView() and addon.Options.db.AchievementPoints.Format == 2 then
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

local function ReskinBlizzard(skins)
    -- AchievementFrameCategories:Point("TOPLEFT", AchievementFrame, 21, -26);
    -- if addon.IsWrathClassic then
    --     AchievementFrameCloseButton:ClearAllPoints();
    --     AchievementFrameCloseButton:Point('TOPRIGHT', AchievementFrame, 'TOPRIGHT', 4, 5);
    --     AchievementFrame.backdrop:ClearAllPoints();
    --     AchievementFrame.backdrop:Point('TOPLEFT', AchievementFrame, 'TOPLEFT', 0, 0);
    --     AchievementFrame.backdrop:Point('BOTTOMRIGHT', AchievementFrame, 'BOTTOMRIGHT', 0, 0);
    -- else
    --     SkinSearchBoxFrame(AchievementFrame.SearchBox, skins);
    -- end
    -- AchievementFrameFilterDropDown:ClearAllPoints();
	-- AchievementFrameFilterDropDown:Point('TOPLEFT', AchievementFrameAchievements, 'TOPLEFT', -16, 25);
    -- AchievementFrameFilterDropDown:Size(AchievementFrameFilterDropDown:GetWidth(), AchievementFrameFilterDropDown:GetHeight() - 1);
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
end

local function SkinDataManager(frame, skins)
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
    AchievementFrame.tex:ClearAllPoints()
    AchievementFrame.tex:SetPoint("TOPLEFT", AchievementFrame, "TOPLEFT", 0, 0);
    AchievementFrame.tex:SetPoint("BOTTOMRIGHT", AchievementFrame, "BOTTOMRIGHT", 0, 0);

    hooksecurefunc(addon.GUI, "ToggleAchievementFrame", function()
        if addon.GUI.SelectedTab then
            addon.GUI.SetAchievementFrameWidth();
            addon.GUI.SetAchievementFrameHeight();
        end
    end);
end

local function SkinAll()
    if KrowiAF_SavedData.GW2_UISkin.Achievements then
        gw2_ui.SkinTabs();
        gw2_ui.SkinCategoriesFrame(addon.GUI.CategoriesFrame);
        SkinGameTooltipProgressBar(addon.GUI.GameTooltipProgressBar);
        gw2_ui.SkinAchievementsFrame(addon.GUI.AchievementsFrame);
        gw2_ui.SkinAchievementSummary(addon.GUI.SummaryFrame);
        SkinFilterButton(addon.GUI.FilterButton);
        gw2_ui.SkinSearchOptionsButton(addon.GUI.Search.OptionsMenuButton, addon.GUI.Search.BoxFrame);
        gw2_ui.SkinSearchBoxFrame(addon.GUI.Search.BoxFrame);
        gw2_ui.SkinSearchPreviewFrame(addon.GUI.Search.PreviewFrame, addon.GUI.Search.BoxFrame);
    --     SkinSearchResultsFrame(addon.GUI.Search.ResultsFrame, skins);
        gw2_ui.SkinHeader();
        ReskinBlizzard();
        gw2_ui.SkinCalendarButton(addon.GUI.Calendar.Button);
    --     SkinDataManager(addon.GUI.DataManagerFrame, skins);
        ReskinGw2Ui();
    end
    -- if KrowiAF_SavedData.ElvUISkin.Calendar then
    --     SkinCalendarFrame(addon.GUI.Calendar.Frame, engine, skins);
    --     SkinCalendarSideFrame(addon.GUI.Calendar.SideFrame, engine, skins);
    -- end
end

local function SkinAlertFrames()
    if not KrowiAF_SavedData.GW2_UISkin.AlertFrames then
        return;
    end

    hooksecurefunc(addon.GUI.AlertSystem, "setUpFunction", function(frame)
        SkinAlertFrameTemplate(frame);
    end);
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
plugins.LoadHelper:RegisterEvent("PLAYER_LOGIN");
function gw2_ui:OnEvent(event, arg1, arg2)
    if event == "PLAYER_LOGIN" then
        SkinAlertFrames();
    end
end

local function AddInfo(localizationName, getFunction, hidden)
    -- return {
    --     order = KrowiAF_InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
    --     name = addon.L[localizationName],
    --     desc = addon.L[localizationName .. " Desc"],
    --     descStyle = "inline",
    --     get = getFunction,
    --     disabled = true,
    --     hidden = hidden
    -- };
end

function gw2_ui.InjectOptions()
    local pluginTable = KrowiAF_InjectOptions.AddPluginTable("GW2_UI", addon.L["GW2_UI"], addon.L["GW2_UI Desc"], function()
        return GW2_ADDON ~= nil;
    end);
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return KrowiAF_SavedData.ElvUISkin.Achievements; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinMiscFrames", AddInfo("Skin Misc Frames", function() return KrowiAF_SavedData.ElvUISkin.MiscFrames; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinTooltip", AddInfo("Skin Tooltip", function() return KrowiAF_SavedData.ElvUISkin.Tooltip; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinTutorials", AddInfo("Skin Tutorials", function() return KrowiAF_SavedData.ElvUISkin.Tutorials; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinAlertFrames", AddInfo("Skin Alert Frames", function() return KrowiAF_SavedData.ElvUISkin.AlertFrames; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinCalendar", AddInfo("Skin Calendar", function() return KrowiAF_SavedData.ElvUISkin.Calendar; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "RemoveParchment", AddInfo("Remove Parchment", function() return KrowiAF_SavedData.ElvUISkin.NoParchment; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinDataManager", AddInfo("Skin Data Manager", function() return KrowiAF_SavedData.ElvUISkin.Achievements; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "SkinAce3", AddInfo("Skin Ace3", function() return KrowiAF_SavedData.ElvUISkin.Options; end));
    -- KrowiAF_InjectOptions.AddTable(pluginTable, "FixWorldMapButton", AddInfo("Fix World Map Button", function() return KrowiAF_SavedData.ElvUISkin.SmallerWorldMap; end));
end

local OrderPP = KrowiAF_InjectOptions.AutoOrderPlusPlus;
local function DisableOptions()
    -- local appName = "Event Reminders";
    -- KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.GrowDirection").disabled = true;
    -- KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.Spacing").disabled = true;
    -- KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetX").disabled = true;
    -- KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetY").disabled = true;
    -- KrowiAF_InjectOptions.AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "ElvUIComment", {
    --     order = OrderPP(), type = "description", width = "full",
    --     name = addon.L["Alert System Overwrite Desc"]
    -- });
end

function gw2_ui.Load()
	-- addon.Diagnostics.Trace("elvUISkin.Load");

    KrowiAF_SavedData.GW2_UISkin = {};
    if GW2_ADDON == nil then
        return;
    end

    -- engine = unpack(ElvUI);
    -- skins = engine:GetModule("Skins");
    -- local privateSkins = engine.private.skins;
    -- local blizzardSkins = privateSkins.blizzard;

    KrowiAF_SavedData.GW2_UISkin.Achievements = GW2_ADDON.GetSetting("ACHIEVEMENT_SKIN_ENABLED");
    -- KrowiAF_SavedData.ElvUISkin.MiscFrames = blizzardSkins.enable and blizzardSkins.misc;
    -- KrowiAF_SavedData.ElvUISkin.Tooltip = blizzardSkins.enable and blizzardSkins.tooltip;
    -- KrowiAF_SavedData.ElvUISkin.Tutorials = blizzardSkins.enable and blizzardSkins.tutorials;
    KrowiAF_SavedData.GW2_UISkin.AlertFrames = GW2_ADDON.GetSetting("ALERTFRAME_SKIN_ENABLED");
    -- KrowiAF_SavedData.ElvUISkin.Calendar = blizzardSkins.enable and blizzardSkins.calendar;
    -- KrowiAF_SavedData.ElvUISkin.NoParchment = blizzardSkins.enable and blizzardSkins.calendar and privateSkins.parchmentRemoverEnable;
    -- KrowiAF_SavedData.ElvUISkin.Options = privateSkins.ace3Enable;
    -- KrowiAF_SavedData.ElvUISkin.SmallerWorldMap = addon.IsWrathClassic and engine.global.general.smallerWorldMap;

    -- local originalLoadWithBlizzard_AchievementUI = addon.GUI.LoadWithBlizzard_AchievementUI;
    -- addon.GUI.LoadWithBlizzard_AchievementUI = function(self)
    --     -- Rearange frame here first
    --     -- AchievementFrameCategories:SetSize(221, 426);
    --     -- AchievementFrameCategories:ClearAllPoints();
    --     -- AchievementFrameCategories:SetPoint("TOPLEFT", 10, -172);
    --     -- originalLoadWithBlizzard_AchievementUI(self);
    --     -- local numButtons = #addon.GUI.CategoriesFrame.ScrollFrame.buttons;
    --     -- local buttonHeight = 36;
    --     -- addon.GUI.CategoriesFrame.ScrollFrame.scrollChild:SetHeight(numButtons * buttonHeight);

    --     -- local scrollBar = addon.GUI.CategoriesFrame.ScrollFrame.ScrollBar;
    --     -- scrollBar:SetMinMaxValues(0, numButtons * buttonHeight)
    --     -- scrollBar.buttonHeight = buttonHeight;
    --     -- scrollBar:SetValueStep(buttonHeight);
    --     -- scrollBar:SetStepsPerPage(numButtons - 2); -- one additional button was added above. Need to remove that, and one more to make the current bottom the new top (and vice versa)
    --     -- scrollBar:SetValue(0);
    -- end

    hooksecurefunc(addon.GUI, "LoadWithBlizzard_AchievementUI", function()
        SkinAll();
    end);

    hooksecurefunc(addon.GUI.SideButtonSystem, "Load", function()
        if KrowiAF_SavedData.GW2_UISkin.Achievements then
            SkinSideButtons();
        end
        hooksecurefunc(addon.GUI.SideButtonSystem, "Refresh", function()
            if KrowiAF_SavedData.GW2_UISkin.Achievements then
                SkinSideButtons();
            end
        end);
    end);

    -- if addon.IsWrathClassic then
    --     local worldMapModule = engine:GetModule("WorldMap");
    --     hooksecurefunc(worldMapModule, "SetSmallWorldMap", function()
    --         addon.GUI.WorldMapButton:SetFrameStrata("TOOLTIP");
    --     end);
    -- end

    -- DisableOptions();

    -- -- return KrowiAF_SavedData.ElvUISkin.Achievements, engine, skins;
    -- addon.Diagnostics.Debug("ElvUISkin loaded");
    -- -- addon.Diagnostics.DebugTable(KrowiAF_SavedData.ElvUISkin, 1);
end