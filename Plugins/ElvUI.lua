-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from ElvUI to make it compatible with their skin.

-- [[ Namespaces ]] --
local _, addon = ...;
local plugins = addon.Plugins;
plugins.ElvUI = {};
local elvUI = plugins.ElvUI;
tinsert(plugins.Plugins, elvUI);

local function SkinTabs(skins)
    for _, addonTabs in next, addon.Gui.Tabs do
        for _, tab in next, addonTabs do
            skins:HandleTab(tab)
            tab:SetFrameLevel(tab:GetFrameLevel() + 2);
        end
    end
end

do -- [[ Categories ]]
    local function OnCategoriesFrameViewAcquiredFrame(frame, engine, skins)
        frame:StripTextures(true);
        skins:HandleFrame(frame, true, nil, 0, -1);
        frame:StyleButton();

        frame:SetHighlightTexture(engine.media.normTex);
        local hl = frame:GetHighlightTexture();
        hl:SetVertexColor(0.8, 0.8, 0.8, 0.25);
        hl:SetInside(frame.backdrop);
    end

    local function SkinCategoriesFrame(frame, engine, skins)
        -- Scrollbar
        skins:HandleTrimScrollBar(frame.ScrollBar);

        if not KrowiAF_SavedData.ElvUISkin.NoParchment then
            return;
        end

        -- Frame
        frame:StripTextures();

        -- Buttons
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, function(self, _frame, elementData, new)
            OnCategoriesFrameViewAcquiredFrame(_frame, engine, skins);
        end, frame);
    end
    elvUI.SkinCategoriesFrame = SkinCategoriesFrame;
end

local function SkinGameTooltipProgressBar(progressBar, engine)
    progressBar.BorderLeftTop:StripTextures();
    progressBar.BorderLeftMiddle:StripTextures();
    progressBar.BorderLeftBottom:StripTextures();
    progressBar.BorderRightTop:StripTextures();
    progressBar.BorderRightMiddle:StripTextures();
    progressBar.BorderRightBottom:StripTextures();
    progressBar.BorderMiddleTop:StripTextures();
    progressBar.BorderMiddleMiddle:StripTextures();
    progressBar.BorderMiddleBottom:StripTextures();
    progressBar.Background:Hide();
    local fills = progressBar.Fill;
    for _, fill in next, fills do
        fill:SetTexture(engine.media.normTex);
    end
    progressBar:CreateBackdrop();
    progressBar.backdrop:Point("TOPLEFT", 7, -5);
    progressBar.backdrop:Point("BOTTOMRIGHT", -5, 5);
    progressBar:SetColors({R = 0, G = 0.5, B = 0}, {R = 0.8, G = 0, B = 0});
end

do -- [[ Achievements ]]
    local function SkinAchievementButton(button, engine, skins)
        button:SetFrameLevel(button:GetFrameLevel() + 2);
        button:StripTextures(true);
        button:CreateBackdrop("Transparent");
        button.backdrop:Point('TOPLEFT', 1, -1);
        button.backdrop:Point('BOTTOMRIGHT', 0, 2);
        button.Icon:CreateBackdrop(nil, nil, nil, nil, nil, nil, true);
        button.Icon:Size(button.Compact and 36 or 54, button.Compact and 36 or 54);
        button.Icon:ClearAllPoints();
        button.Icon:Point("TOPLEFT", button.Compact and 6 or 8, button.Compact and -6 or -8);
        button.Icon.Border:Kill();
        button.Icon.Texture:SetTexCoord(unpack(engine.TexCoords));
        button.Icon.Texture:SetInside();

        if button.Highlight then
            button.Highlight:StripTextures();
            button:HookScript("OnEnter", function(self) self.backdrop:SetBackdropBorderColor(1, 1, 0) end);
            button:HookScript("OnLeave", function(self) self.backdrop:SetBackdropBorderColor(unpack(engine.media.bordercolor)) end);
        end

        if button.Header then
            button.Header:SetTextColor(1, 1, 1);
        end

        if button.Description then
            button.Description:SetTextColor(.6, .6, .6);
            hooksecurefunc(button.Description, "SetTextColor", function(self, r, g, b)
                if r == 0 and g == 0 and b == 0 then
                    self:SetTextColor(.6, .6, .6);
                end
            end);
        end

        if button.HiddenDescription then
            button.HiddenDescription:SetTextColor(1, 1, 1);
        end

        if button.Tracked then
            for _, region in next, {button.Tracked:GetRegions()} do
                if region.SetTextColor then
                    region:SetTextColor(1, 1, 1);
                end
            end
            skins:HandleCheckBox(button.Tracked);
            button.Tracked:Size(18);
            button.Tracked:ClearAllPoints();
            button.Tracked:Point("TOPLEFT", button.Icon, "BOTTOMLEFT", 0, -2);
        end
    end

    local blueAchievement = { r = 0.1, g = 0.2, b = 0.3, a = 0.8 };
    local function BlueBackdrop(self)
        self:SetBackdropColor(blueAchievement.r, blueAchievement.g, blueAchievement.b, blueAchievement.a);
    end

    local redAchievement = { r = 0.3, g = 0, b = 0, a = 0.8 };
    local function RedBackdrop(self)
        self:SetBackdropColor(redAchievement.r, redAchievement.g, redAchievement.b, redAchievement.a);
    end

    local yellowAchievement = { r = 0.3, g = 0.3, b = 0, a = 0.8 };
    local function YellowBackdrop(self)
        self:SetBackdropColor(yellowAchievement.r, yellowAchievement.g, yellowAchievement.b, yellowAchievement.a);
    end

    local greenAchievement = { r = 0, g = 0.3, b = 0, a = 0.8 };
    local function GreenBackdrop(self)
        self:SetBackdropColor(greenAchievement.r, greenAchievement.g, greenAchievement.b, greenAchievement.a);
    end

    local function SetAchievementButtonColor(frame, engine)
        if not frame or not frame.backdrop or not frame.Achievement then
            return;
        end
        local achievement = frame.Achievement;
        local state;
        if achievement.TemporaryObtainable then
            state = achievement.TemporaryObtainable.Obtainable();
        end
        local backdropColorFunc;
        if state and (state == false or state == "Past") then
            backdropColorFunc = RedBackdrop;
        elseif state and state == "Current" then
            backdropColorFunc = GreenBackdrop;
        elseif state and state == "Future" then
            backdropColorFunc = YellowBackdrop;
        else
            if frame.accountWide then
                backdropColorFunc = BlueBackdrop;
            else
                backdropColorFunc = nil;
                frame.backdrop.callbackBackdropColor = nil;
                frame.backdrop:SetBackdropColor(unpack(engine.media.backdropfadecolor));
            end
        end

        if backdropColorFunc then
            frame.backdrop.callbackBackdropColor = backdropColorFunc;
            backdropColorFunc(frame.backdrop);
        end
    end
    elvUI.SetAchievementButtonColor = SetAchievementButtonColor;

    local function SkinAchievementsFrame(frame, engine, skins)
        -- Buttons
        hooksecurefunc(frame.ScrollBox, "Update", function()
            for _, button in next, {frame.ScrollBox.ScrollTarget:GetChildren()} do
                if button then
                    if button:IsShown() then
                        SetAchievementButtonColor(button, engine);
                    end
                    if not button.IsSkinned then
                        SkinAchievementButton(button, engine, skins);
                        button.IsSkinned = true;
                    end
                end
            end
        end);

        local preHookFunction = KrowiAF_AchievementsObjectives.DisplayCriteria;
        function KrowiAF_AchievementsObjectives:DisplayCriteria(id)
            preHookFunction(self, id);
            local numCriteria = GetAchievementNumCriteria(id);
            local textStrings, metas = 0, 0;
            local criteria, object;
            for i = 1, numCriteria do
                local _, criteriaType, completed, _, _, _, _, assetID = addon.GetAchievementCriteriaInfo(id, i);
                if assetID and criteriaType == _G.CRITERIA_TYPE_ACHIEVEMENT then
                    metas = metas + 1;
                    criteria, object = self:GetMeta(metas), 'Label';
                elseif criteriaType ~= 1 then
                    textStrings = textStrings + 1;
                    criteria, object = self:GetTextCriteria(textStrings), 'Label';
                end

                local text = criteria and criteria[object];
                if text then
                    local r, g, b, x, y;
                    if completed then
                        if self.Completed then
                            r, g, b, x, y = 1, 1, 1, 0, 0;
                        else
                            r, g, b, x, y = 0, 1, 0, 1, -1;
                        end
                    else
                        r, g, b, x, y = .6, .6, .6, 1, -1;
                    end
                    text:SetTextColor(r, g, b);
                    text:SetShadowOffset(x, y);
                end
            end
        end

        -- Scrollbar
        skins:HandleTrimScrollBar(frame.ScrollBar);

        if not KrowiAF_SavedData.ElvUISkin.NoParchment then
            frame.Artwork:Hide();
            return;
        end

        -- Frame
        frame:StripTextures();
    end
    elvUI.SkinAchievementsFrame = SkinAchievementsFrame;

    local function SkinAchievementsFrameLight(frame, engine, skins)
        -- Buttons
        hooksecurefunc(frame.ScrollBox, "Update", function()
            for _, button in next, { frame.ScrollBox.ScrollTarget:GetChildren() } do
                if button then
                    if button:IsShown() then
                        SetAchievementButtonColor(button, engine);
                    end
                    if not button.IsSkinned then
                        SkinAchievementButton(button, engine, skins);
                        button.IsSkinned = true;
                    end
                end
            end
        end);

         -- Scrollbar
        skins:HandleTrimScrollBar(frame.ScrollBar);

        if not KrowiAF_SavedData.ElvUISkin.NoParchment then
            return;
        end

        -- Frame
        frame:StripTextures();
    end
    elvUI.SkinAchievementsFrameLight = SkinAchievementsFrameLight;
end

do -- [[ Summary ]]
    local function SkinStatusBar(statusBar, engine)
        statusBar:SetFrameLevel(statusBar:GetFrameLevel() + 1);
        statusBar.BorderLeftTop:StripTextures();
        statusBar.BorderLeftMiddle:StripTextures();
        statusBar.BorderLeftBottom:StripTextures();
        statusBar.BorderRightTop:StripTextures();
        statusBar.BorderRightMiddle:StripTextures();
        statusBar.BorderRightBottom:StripTextures();
        statusBar.BorderMiddleTop:StripTextures();
        statusBar.BorderMiddleMiddle:StripTextures();
        statusBar.BorderMiddleBottom:StripTextures();
        statusBar.Background:Hide();
        local fills = statusBar.Fill;
        for _, fill in next, fills do
            fill:SetTexture(engine.media.normTex);
        end
        statusBar:AdjustOffsets(8, 8);
        statusBar:CreateBackdrop("Transparent");
        statusBar.backdrop:Point("TOPLEFT", 14, -14);
        statusBar.backdrop:Point("BOTTOMRIGHT", -12, 14);
        statusBar:SetColors({R = 0, G = 0.5, B = 0}, {R = 0.8, G = 0, B = 0});
        if statusBar.Button then
            local button = statusBar.Button;
            button:StripTextures();

            local htex = button:CreateTexture();
            htex:SetColorTexture(1, 1, 1, 0.3);
            htex:SetAllPoints(statusBar.backdrop);
            button:SetHighlightTexture(htex);

            button:SetScript("OnLeave", function(self)
            end);
            button:SetScript("OnEnter", function(self)
            end);
        end
    end

    local function SkinAchievementSummary(frame, engine, skins)
        frame.Achievements.Header.Texture:SetVertexColor(1, 1, 1, 0.25);
        frame.Categories.Header.Texture:SetVertexColor(1, 1, 1, 0.25);

        elvUI.SkinAchievementsFrameLight(frame.AchievementsFrame, engine, skins);

        SkinStatusBar(frame.TotalStatusBar, engine);
        local preHookFunction = KrowiAF_SummaryFrame.GetStatusBar;
        KrowiAF_SummaryFrame.GetStatusBar = function(self, index)
            local statusBar = preHookFunction(self, index);
            if not statusBar.IsSkinned then
                SkinStatusBar(statusBar, engine);
                statusBar.IsSkinned = true;
            end
            return statusBar;
        end
        -- local statusBars = frame.StatusBars;
        -- for _, statusBar in next, statusBars do
        --     SkinStatusBar(statusBar, engine);
        -- end

        if not KrowiAF_SavedData.ElvUISkin.NoParchment then
            return;
        end

        -- Frame
        frame:StripTextures();
        frame:GetChildren():Hide();
    end
    elvUI.SkinAchievementSummary = SkinAchievementSummary;
end

local function SkinFilterButton(button, achievementsFrame, skins)
    skins:HandleButton(button);

    local highlightTex = button.GetHighlightTexture and button:GetHighlightTexture();
    if highlightTex then
        highlightTex:SetTexture();
    else
        button:StripTextures();
    end

	button:ClearAllPoints();
	button:Point("BOTTOMLEFT", achievementsFrame, "TOPLEFT", 2, 1);
end

do -- [[ Search ]]
    local function SkinSearchOptionsButton(button, searchBoxFrame, skins)
        skins:HandleButton(button);

        local highlightTex = button.GetHighlightTexture and button:GetHighlightTexture();
        if highlightTex then
            highlightTex:SetTexture();
        else
            button:StripTextures();
        end

        button:ClearAllPoints();
        button:Point("LEFT", searchBoxFrame, "LEFT", -3, 0);
    end
    elvUI.SkinSearchOptionsButton = SkinSearchOptionsButton;

    local function SkinSearchBoxFrame(frame, skins)
        skins:HandleEditBox(frame);
        frame.backdrop:Point('TOPLEFT', frame, 'TOPLEFT', -3, -3);
        frame.backdrop:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', 0, 3);
        frame:ClearAllPoints();
        frame:Point('TOPRIGHT', AchievementFrame, -22, -1);
        frame:Size(114, 27);
    end
    elvUI.SkinSearchBoxFrame = SkinSearchBoxFrame;

    local function SkinSearchButton(self, engine, skins)
        self:StripTextures();

        if self.Icon then
            skins:HandleIcon(self.Icon);
        end

        self:CreateBackdrop('Transparent');
        self:SetHighlightTexture(engine.media.normTex);

        local hl = self:GetHighlightTexture();
        hl:SetVertexColor(1, 1, 1, 0.3);
        hl:Point('TOPLEFT', 1, -1);
        hl:Point('BOTTOMRIGHT', -1, 1);
    end

    local function SkinSearchPreviewFrame(frame, achievementsFrame, engine, skins)
        frame:StripTextures();
        frame:ClearAllPoints();
        frame:Point('TOPLEFT', achievementsFrame, 'TOPRIGHT', 22, 25);

        for _, button in next, frame.Buttons do
            SkinSearchButton(button, engine, skins);
        end
        SkinSearchButton(frame.ShowFullSearchResultsButton, engine, skins);
    end
    elvUI.SkinSearchPreviewFrame = SkinSearchPreviewFrame;

    local function OnSearchResultsFrameViewAcquiredFrame(frame)
        frame:SetNormalTexture('');
        frame:SetPushedTexture('');
        frame:GetRegions():Hide();

        frame.ResultType:SetTextColor(1, 1, 1);
        frame.Path:SetTextColor(1, 1, 1);
    end

    local function SkinSearchResultsFrame(frame, skins)
        frame:StripTextures();
        frame:CreateBackdrop('Transparent');

        -- Buttons
        frame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, function(self, _frame, elementData, new)
            OnSearchResultsFrameViewAcquiredFrame(_frame);
        end, frame);

        skins:HandleCloseButton(frame.closeButton);
        skins:HandleTrimScrollBar(frame.ScrollBar);
    end
    elvUI.SkinSearchResultsFrame = SkinSearchResultsFrame;
end

do -- [[ Alerts and Side Buttons ]]
    local function ForceAlpha(self, alpha, forced)
        if alpha ~= 1 and forced ~= true then
            self:SetAlpha(1, true)
        end
    end

    local function SkinAlertFrameTemplate(frame, engine)
        frame:SetAlpha(1);

        if not frame.hooked then
            hooksecurefunc(frame, 'SetAlpha', ForceAlpha);
            frame.hooked = true;
        end

        if not frame.backdrop then
            frame:CreateBackdrop('Transparent');
            frame.backdrop:Point('TOPLEFT', frame.Background, 'TOPLEFT', -2, -6);
            frame.backdrop:Point('BOTTOMRIGHT', frame.Background, 'BOTTOMRIGHT', -2, 6);
        end

        -- Background
        frame.Background:SetTexture();
        frame.glow:Kill();
        frame.shine:Kill();

        -- Text
        frame.Unlocked:FontTemplate(nil, 12);
        frame.Unlocked:SetTextColor(1, 1, 1);
        frame.Name:FontTemplate(nil, 12);

        -- Icon
        frame.Icon.Texture:SetTexCoord(unpack(engine.TexCoords));
        frame.Icon.Overlay:Kill();

        frame.Icon.Texture:ClearAllPoints();
        frame.Icon.Texture:Point('LEFT', frame, 7, 0);

        if not frame.Icon.Texture.b then
            frame.Icon.Texture.b = CreateFrame('Frame', nil, frame);
            frame.Icon.Texture.b:SetTemplate();
            frame.Icon.Texture.b:SetOutside(frame.Icon.Texture);
            frame.Icon.Texture:SetParent(frame.Icon.Texture.b);
        end
    end
    elvUI.SkinAlertFrameTemplate = SkinAlertFrameTemplate;

    local function SkinSideButton(button, prevButton, engine)
        if not button.HasElvUiSkin then
            SkinAlertFrameTemplate(button, engine);
        end
        if not prevButton then
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.IsDragonflightRetail and 6 or 13); -- Make the 2nd button anchor like the 1st one
        else
            button:ClearAllPoints();
            button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9); -- Make the 2nd button anchor like the 1st one
        end
        button.HasElvUiSkin = true;
    end

    local function SkinSideButtons(engine)
        local i = 1;
        local button = _G["KrowiAF_AchievementFrameSideButton" .. i];
        local prevButton;
        while button do
            SkinSideButton(button, prevButton, engine);
            prevButton = button;
            i = i + 1;
            button = _G["KrowiAF_AchievementFrameSideButton" .. i];
        end
    end
    elvUI.SkinSideButtons = SkinSideButtons;
end

local function SkinHeader()
    hooksecurefunc(AchievementFrame.Header.Points, "SetText", function()
        AchievementFrame.Header.PointBorder:ClearAllPoints();
        AchievementFrame.Header.PointBorder:Point('TOPLEFT', KrowiAF_AchievementFrameFilterButton, 'TOPRIGHT', 70, 0);
        AchievementFrame.Header.PointBorder:Point('BOTTOMRIGHT', KrowiAF_SearchBoxFrame.backdrop, 'BOTTOMLEFT', -80, 0);
        AchievementFrame.Header.Points:ClearAllPoints();
        AchievementFrame.Header.Points:Point('CENTER', AchievementFrame.Header.PointBorder, 'CENTER', -10, 0);
    end);
    if addon.IsWrathClassic then
        AchievementFrameHeaderLeftDDLInset:SetAlpha(0);
    end
end

local function ReskinBlizzard(skins)
    AchievementFrameCategories:Point("TOPLEFT", AchievementFrame, 21, -26);
    if addon.IsWrathClassic then
        AchievementFrameCloseButton:ClearAllPoints();
        AchievementFrameCloseButton:Point('TOPRIGHT', AchievementFrame, 'TOPRIGHT', 4, 5);
        AchievementFrame.backdrop:ClearAllPoints();
        AchievementFrame.backdrop:Point('TOPLEFT', AchievementFrame, 'TOPLEFT', 0, 0);
        AchievementFrame.backdrop:Point('BOTTOMRIGHT', AchievementFrame, 'BOTTOMRIGHT', 0, 0);
    else
        elvUI.SkinSearchBoxFrame(AchievementFrame.SearchBox, skins);
    end
    AchievementFrameFilterDropDown:ClearAllPoints();
	AchievementFrameFilterDropDown:Point('TOPLEFT', AchievementFrameAchievements, 'TOPLEFT', -16, 25);
    AchievementFrameFilterDropDown:Size(AchievementFrameFilterDropDown:GetWidth(), AchievementFrameFilterDropDown:GetHeight() - 1);
end

do -- [[ Calendar ]]
    local function SkinCalendarButton(button, skins)
        skins:HandleButton(button);
        button:ClearAllPoints();
        button:Point("TOPRIGHT", KrowiAF_SearchBoxFrame, "TOPLEFT", -6, -3);
        button:Size(22, 22);
        local fs = button:CreateFontString(nil, nil, "GameFontHighlightSmall");
        fs:SetPoint("CENTER", 0, 0);
        button:SetFontString(fs);
        local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
        button:SetText(currentCalendarTime.monthDay);
    end
    elvUI.SkinCalendarButton = SkinCalendarButton;

    local function SkinCalendarDayButton(button, engine, skins)
        button.DarkFrame:SetAlpha(.5);

        if KrowiAF_SavedData.ElvUISkin.NoParchment then
            button:DisableDrawLayer('BACKGROUND');
        end

        button:SetTemplate(nil, nil, nil, true);
        button:SetBackdropColor(0,0,0,0);
        button:SetHighlightTexture(engine.media.glossTex);
        button:SetFrameLevel(button:GetFrameLevel() + 1);

        local hl = button:GetHighlightTexture();
        hl:SetVertexColor(1, 1, 1, 0.3);
        hl:Point('TOPLEFT', -1, 1);
        hl:Point('BOTTOMRIGHT');
        hl.SetAlpha = engine.noop;
    end

    local function SkinCalendarFrame(frame, engine, skins)
        frame:DisableDrawLayer("BORDER");
        frame:CreateBackdrop("Transparent");

        local closeButton = frame.CloseButton;
        skins:HandleCloseButton(closeButton);
        closeButton:Point("TOPRIGHT", -4, -4);

        for i = 1, 7 do
            frame.WeekDayBackgrounds[i]:SetAlpha(0);
        end

        frame.MonthBackground:SetAlpha(0);
        frame.YearBackground:SetAlpha(0);

        skins:HandleNextPrevButton(frame.PrevMonthButton, nil, nil, true)
        skins:HandleNextPrevButton(frame.NextMonthButton, nil, nil, true)

        for i = 1, 42 do
            SkinCalendarDayButton(frame.DayButtons[i], engine, skins);
        end

        local weekdaySelectedTexture = frame.WeekdaySelectedTexture;
        weekdaySelectedTexture:SetDesaturated(true);
        weekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6);

        local todayFrame = frame.TodayFrame;
        todayFrame.Texture:Hide()
        todayFrame.Glow:Hide()

        todayFrame:SetTemplate();
        todayFrame:SetBackdropBorderColor(_G.NORMAL_FONT_COLOR:GetRGB());
        todayFrame:SetBackdropColor(0, 0, 0, 0);
        todayFrame:SetScript("OnUpdate", nil);

        hooksecurefunc(frame, "SetToday", function()
            todayFrame:SetAllPoints();
        end);

        frame.MonthAchievementsAndPoints:SetPoint("TOPRIGHT", -40, -13);
    end
    elvUI.SkinCalendarFrame = SkinCalendarFrame;

    local function SkinCalendarSideFrame(frame, engine, skins)
        frame:StripTextures(true);
        frame:SetTemplate('Transparent');
        frame:Point('TOPLEFT', frame:GetParent(), 'TOPRIGHT', 3, -24);
        frame.Header:StripTextures();
        skins:HandleCloseButton(frame.CloseButton);

        elvUI.SkinAchievementsFrameLight(frame.AchievementsFrame, engine, skins);

        hooksecurefunc(frame, "Show", function()
            for _, button in next, { frame.AchievementsFrame.ScrollBox.ScrollTarget:GetChildren() } do
                if button then
                    if button:IsShown() then
                        elvUI.SetAchievementButtonColor(button, engine);
                    end
                end
            end
        end);
    end
    elvUI.SkinCalendarSideFrame = SkinCalendarSideFrame;
end

local function SkinDataManager(frame, skins)
    frame:StripTextures();
    frame.Inset:StripTextures();
    frame.CloseButton:Point("TOPRIGHT", 0, 2);
    skins:HandleFrame(frame, true, nil, -5, 0, -1, 0);
    
    frame.CharacterList.InsetFrame:StripTextures();
    skins:HandleInsetFrame(frame.CharacterList.InsetFrame);
    skins:HandleTrimScrollBar(frame.CharacterList.ScrollBar)
    
	local columnDisplay = frame.CharacterList.ColumnDisplay;
	columnDisplay:StripTextures();
	columnDisplay.InsetBorderLeft:Hide();
	columnDisplay.InsetBorderBottomLeft:Hide();
	columnDisplay.InsetBorderTopLeft:Hide();
	columnDisplay.InsetBorderTop:Hide();
    for i = 1, columnDisplay:GetNumChildren() do
        local child = select(i, columnDisplay:GetChildren())
        child:StripTextures();
        child:SetTemplate("Transparent");
    end

    -- frame.CharacterList.ScrollFrame:ClearAllPoints();
    -- frame.CharacterList.ScrollFrame:Point("TOPLEFT", frame.CharacterList, "TOPLEFT", 3, 5);
    -- frame.CharacterList.ScrollFrame:Point("BOTTOMRIGHT", frame.CharacterList, "BOTTOMRIGHT", 0, 0);
    -- for _, button in ipairs(frame.CharacterList.ScrollFrame.buttons or {}) do
    hooksecurefunc(frame.CharacterList.ScrollBox, "Update", function()
        for _, button in next, {frame.CharacterList.ScrollBox.ScrollTarget:GetChildren()} do
            if button and not button.IsSkinned then
                skins:HandleCheckBox(button.HeaderTooltip);
                button.HeaderTooltip:Size(25, 25);
                button.HeaderTooltip:ClearAllPoints();
                button.HeaderTooltip:Point("LEFT", button.Points, "RIGHT", 19, 0);
                skins:HandleCheckBox(button.EarnedByAchievementTooltip);
                button.EarnedByAchievementTooltip:Size(25, 25);
                button.EarnedByAchievementTooltip:ClearAllPoints();
                button.EarnedByAchievementTooltip:Point("LEFT", button.HeaderTooltip, "RIGHT", 74, 0);

                skins:HandleCheckBox(button.MostProgressAchievementTooltip);
                button.MostProgressAchievementTooltip:Size(25, 25);
                button.MostProgressAchievementTooltip:ClearAllPoints();
                button.MostProgressAchievementTooltip:Point("LEFT", button.EarnedByAchievementTooltip, "RIGHT", 74, 0);

                skins:HandleCheckBox(button.IgnoreCharacter);
                button.IgnoreCharacter:Size(25, 25);
                button.IgnoreCharacter:ClearAllPoints();
                button.IgnoreCharacter:Point("LEFT", button.MostProgressAchievementTooltip, "RIGHT", 73, 0);
                button.IsSkinned = true;
            end
        end
    end);
end

local engine, skins, tooltip;
local function SkinAll()
    if KrowiAF_SavedData.ElvUISkin.Achievements then
        SkinTabs(skins);
        elvUI.SkinCategoriesFrame(KrowiAF_CategoriesFrame, engine, skins);
        SkinGameTooltipProgressBar(LibStub("Krowi_GameTooltipWithProgressBar-2.0").ProgressBar, engine);
        elvUI.SkinAchievementsFrame(KrowiAF_AchievementsFrame, engine, skins);
        elvUI.SkinAchievementSummary(KrowiAF_SummaryFrame, engine, skins);
        SkinFilterButton(KrowiAF_AchievementFrameFilterButton, KrowiAF_AchievementsFrame, skins);
        elvUI.SkinSearchOptionsButton(KrowiAF_SearchBoxFrame.OptionsMenuButton, KrowiAF_SearchBoxFrame, skins);
        elvUI.SkinSearchBoxFrame(KrowiAF_SearchBoxFrame, skins);
        elvUI.SkinSearchPreviewFrame(KrowiAF_SearchBoxFrame.PreviewContainer, KrowiAF_AchievementsFrame, engine, skins);
        elvUI.SkinSearchResultsFrame(KrowiAF_SearchBoxFrame.ResultsFrame, skins);
        SkinHeader();
        ReskinBlizzard(skins);
        elvUI.SkinCalendarButton(KrowiAF_AchievementCalendarButton, skins);
        SkinDataManager(KrowiAF_DataManagerFrame, skins);
    end
    if KrowiAF_SavedData.ElvUISkin.Calendar then
        elvUI.SkinCalendarFrame(KrowiAF_AchievementCalendarFrame, engine, skins);
        elvUI.SkinCalendarSideFrame(KrowiAF_AchievementCalendarFrame.SideFrame, engine, skins);
    end
end

local function SkinAlertFrames()
    if not KrowiAF_SavedData.ElvUISkin.AlertFrames then
        return;
    end

    hooksecurefunc(addon.Gui.EventReminderAlertSystem.SubSystem, "setUpFunction", function(frame)
        elvUI.SkinAlertFrameTemplate(frame, engine);
    end);
end

local function SkinFloatingAchievementTooltip()
    if not KrowiAF_SavedData.ElvUISkin.Tooltip then
        return;
    end

    tooltip:SetStyle(KrowiAF_FloatingAchievementTooltip);
    skins:HandleCloseButton(KrowiAF_FloatingAchievementTooltip.CloseButton);
end

plugins.LoadHelper:RegisterEvent("ADDON_LOADED");
plugins.LoadHelper:RegisterEvent("PLAYER_LOGIN");
function elvUI:OnEvent(event, arg1, arg2)
    if event == "PLAYER_LOGIN" then
        SkinAlertFrames();
        SkinFloatingAchievementTooltip();
    end
end

local function AddInfo(localizationName, getFunction, hidden)
    return {
        order = addon.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["ElvUI " .. localizationName],
        desc = addon.L["ElvUI " .. localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true,
        hidden = hidden
    };
end

function elvUI.InjectOptions()
    local pluginTable = addon.InjectOptions:AddPluginTable("ElvUI", addon.L["ElvUI"], addon.L["ElvUI Desc"], function()
        return ElvUI ~= nil;
    end);
    addon.InjectOptions:AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return KrowiAF_SavedData.ElvUISkin.Achievements; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinMiscFrames", AddInfo("Skin Misc Frames", function() return KrowiAF_SavedData.ElvUISkin.MiscFrames; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinTooltip", AddInfo("Skin Tooltip", function() return KrowiAF_SavedData.ElvUISkin.Tooltip; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinTutorials", AddInfo("Skin Tutorials", function() return KrowiAF_SavedData.ElvUISkin.Tutorials; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinAlertFrames", AddInfo("Skin Alert Frames", function() return KrowiAF_SavedData.ElvUISkin.AlertFrames; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinCalendar", AddInfo("Skin Calendar", function() return KrowiAF_SavedData.ElvUISkin.Calendar; end));
    addon.InjectOptions:AddTable(pluginTable, "RemoveParchment", AddInfo("Remove Parchment", function() return KrowiAF_SavedData.ElvUISkin.NoParchment; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinDataManager", AddInfo("Skin Data Manager", function() return KrowiAF_SavedData.ElvUISkin.Achievements; end));
    addon.InjectOptions:AddTable(pluginTable, "SkinAce3", AddInfo("Skin Ace3", function() return KrowiAF_SavedData.ElvUISkin.Options; end));
    addon.InjectOptions:AddTable(pluginTable, "FixWorldMapButton", AddInfo("Fix World Map Button", function() return KrowiAF_SavedData.ElvUISkin.SmallerWorldMap; end));
end

local OrderPP = addon.InjectOptions.AutoOrderPlusPlus;
local function DisableOptions()
    local appName = addon.Metadata.Prefix .. "_EventReminders";
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.GrowDirection").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.Spacing").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetX").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetY").disabled = true;
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "ElvUIComment", {
        order = OrderPP(), type = "description", width = "full",
        name = addon.L["Alert System Overwrite Desc"]:K_ReplaceVars(addon.L["ElvUI"])
    });
end

function elvUI.Load()
	addon.Diagnostics.Trace("elvUISkin.Load");

    KrowiAF_SavedData.ElvUISkin = {};
    if ElvUI == nil then
        return;
    end

    engine = unpack(ElvUI);
    skins = engine:GetModule("Skins");
    tooltip = engine:GetModule("Tooltip");
    local privateSkins = engine.private.skins;
    local blizzardSkins = privateSkins.blizzard;

    KrowiAF_SavedData.ElvUISkin.Achievements = blizzardSkins.enable and blizzardSkins.achievement;
    KrowiAF_SavedData.ElvUISkin.MiscFrames = blizzardSkins.enable and blizzardSkins.misc;
    KrowiAF_SavedData.ElvUISkin.Tooltip = blizzardSkins.enable and blizzardSkins.tooltip;
    KrowiAF_SavedData.ElvUISkin.Tutorials = blizzardSkins.enable and blizzardSkins.tutorials;
    KrowiAF_SavedData.ElvUISkin.AlertFrames = blizzardSkins.enable and blizzardSkins.alertframes;
    KrowiAF_SavedData.ElvUISkin.Calendar = blizzardSkins.enable and blizzardSkins.calendar;
    KrowiAF_SavedData.ElvUISkin.NoParchment = blizzardSkins.enable and blizzardSkins.calendar and privateSkins.parchmentRemoverEnable;
    KrowiAF_SavedData.ElvUISkin.Options = privateSkins.ace3Enable;
    KrowiAF_SavedData.ElvUISkin.SmallerWorldMap = addon.IsWrathClassic and engine.global.general.smallerWorldMap;

    hooksecurefunc(addon.Gui, "LoadWithBlizzard_AchievementUI", function()
        SkinAll();
    end);

    hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Load", function()
        if KrowiAF_SavedData.ElvUISkin.Achievements then
            elvUI.SkinSideButtons(engine);
        end
        hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", function()
            if KrowiAF_SavedData.ElvUISkin.Achievements then
                elvUI.SkinSideButtons(engine);
            end
        end);
    end);

    if addon.IsWrathClassic then
        local worldMapModule = engine:GetModule("WorldMap");
        hooksecurefunc(worldMapModule, "SetSmallWorldMap", function()
            addon.Gui.WorldMapButton:SetFrameStrata("TOOLTIP");
        end);
    end

    DisableOptions();

    -- return KrowiAF_SavedData.ElvUISkin.Achievements, engine, skins;
    addon.Diagnostics.Debug("ElvUISkin loaded");
    -- addon.Diagnostics.DebugTable(KrowiAF_SavedData.ElvUISkin, 1);
end