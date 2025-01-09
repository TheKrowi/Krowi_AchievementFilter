-- [[ Disclaimer ]] --
-- A lot of code in this file is copied from ElvUI to make it compatible with their skin.

local _, addon = ...;
local elv = {};
KrowiAF.PluginsApi:RegisterPlugin("ElvUI", elv);
KrowiAF.PluginsApi:RegisterEvent("PLAYER_LOGIN");

local function IsLoaded()
    return ElvUI ~= nil;
end

local doSkin, engine, skins, tooltip;

-- [[ Tabs ]]
local function SkinTabs()
    for _, addonTabs in next, addon.Gui.Tabs do
        for _, tab in next, addonTabs do
            skins:HandleTab(tab)
            tab:SetFrameLevel(tab:GetFrameLevel() + 2);
        end
    end
end

-- [[ Categories ]]
local function SkinCategoryButton(_, button)
    button:StripTextures(true);
    skins:HandleFrame(button, true, nil, 0, -1);
    button:StyleButton();

    button:SetHighlightTexture(engine.media.normTex);
    local hl = button:GetHighlightTexture();
    hl:SetVertexColor(0.8, 0.8, 0.8, 0.25);
    hl:SetInside(button.backdrop);
end

local function SkinCategoriesFrame()
    -- Scrollbar
    skins:HandleTrimScrollBar(KrowiAF_CategoriesFrame.ScrollBar);

    if not doSkin.NoParchment then
        return;
    end

    -- Frame
    KrowiAF_CategoriesFrame:StripTextures();

    -- Buttons
    KrowiAF_CategoriesFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, SkinCategoryButton, KrowiAF_CategoriesFrame);
end

--[[ GameTooltipProgressBar ]]
local function SkinGameTooltipProgressBar()
    local progressBar = LibStub("Krowi_GameTooltipWithProgressBar-2.0").ProgressBar;
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

-- [[ Achievements ]]
local redAchievement = { r = 0.3, g = 0, b = 0, a = 0.8 };
local function RedBackdrop(self)
    self:SetBackdropColor(redAchievement.r, redAchievement.g, redAchievement.b, redAchievement.a);
end

local greenAchievement = { r = 0, g = 0.3, b = 0, a = 0.8 };
local function GreenBackdrop(self)
    self:SetBackdropColor(greenAchievement.r, greenAchievement.g, greenAchievement.b, greenAchievement.a);
end

local yellowAchievement = { r = 0.3, g = 0.3, b = 0, a = 0.8 };
local function YellowBackdrop(self)
    self:SetBackdropColor(yellowAchievement.r, yellowAchievement.g, yellowAchievement.b, yellowAchievement.a);
end

local blueAchievement = { r = 0.1, g = 0.2, b = 0.3, a = 0.8 };
local function BlueBackdrop(self)
    self:SetBackdropColor(blueAchievement.r, blueAchievement.g, blueAchievement.b, blueAchievement.a);
end

local function SetAchievementButtonColor(button)
    if not button or not button.backdrop or not button.Achievement then
        return;
    end
    local achievement = button.Achievement;
    local state = achievement:GetObtainableState();
    local backdropColorFunc;
    if state and (state == false or state == "Past") then
        backdropColorFunc = RedBackdrop;
    elseif state and state == "Current" then
        backdropColorFunc = GreenBackdrop;
    elseif state and state == "Future" then
        backdropColorFunc = YellowBackdrop;
    else
        if button.accountWide then
            backdropColorFunc = BlueBackdrop;
        else
            backdropColorFunc = nil;
            button.backdrop.callbackBackdropColor = nil;
            button.backdrop:SetBackdropColor(unpack(engine.media.backdropfadecolor));
        end
    end

    if backdropColorFunc then
        button.backdrop.callbackBackdropColor = backdropColorFunc;
        backdropColorFunc(button.backdrop);
    end
end

local function SkinAchievementButton(button)
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

local function UpdateAchievementButton(button)
    if button then
        if button:IsShown() then
            SetAchievementButtonColor(button);
        end
        if not button.IsSkinned then
            SkinAchievementButton(button, engine, skins);
            button.IsSkinned = true;
        end
    end
end

local function UpdateAchievementButtons(buttons)
    for _, button in next, buttons do
        UpdateAchievementButton(button);
    end
end

local function SkinAchievementsFrame()
    -- Buttons
    hooksecurefunc(KrowiAF_AchievementsFrame.ScrollBox, "Update", function()
        UpdateAchievementButtons({KrowiAF_AchievementsFrame.ScrollBox.ScrollTarget:GetChildren()});
    end);

    -- Objectives
    hooksecurefunc(KrowiAF_AchievementsObjectives, "DisplayCriteria", function(self, id)
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
    end);

    -- Scrollbar
    skins:HandleTrimScrollBar(KrowiAF_AchievementsFrame.ScrollBar);

    -- Frame
    if not doSkin.NoParchment then
        KrowiAF_AchievementsFrame.Artwork:Hide();
        return;
    end

    KrowiAF_AchievementsFrame:StripTextures();
end

local function SkinAchievementsFrameLight(frame)
    -- Buttons
    hooksecurefunc(frame.ScrollBox, "Update", function()
        UpdateAchievementButtons({frame.ScrollBox.ScrollTarget:GetChildren()});
    end);

    -- Scrollbar
    skins:HandleTrimScrollBar(frame.ScrollBar);

    -- Frame
    if not doSkin.NoParchment then
        return;
    end

    frame:StripTextures();
end

 -- [[ Summary ]]
local function SkinStatusBar(statusBar)
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

local function SkinAchievementSummary()
    -- Headers
    KrowiAF_SummaryFrame.Achievements.Header.Texture:SetVertexColor(1, 1, 1, 0.25);
    KrowiAF_SummaryFrame.Categories.Header.Texture:SetVertexColor(1, 1, 1, 0.25);

    -- Achievements
    SkinAchievementsFrameLight(KrowiAF_SummaryFrame.AchievementsFrame);

    -- StatusBars
    SkinStatusBar(KrowiAF_SummaryFrame.TotalStatusBar, engine);
    local preHookFunction = KrowiAF_SummaryFrame.GetStatusBar;
    KrowiAF_SummaryFrame.GetStatusBar = function(self, index)
        local statusBar = preHookFunction(self, index);
        if not statusBar.IsSkinned then
            SkinStatusBar(statusBar, engine);
            statusBar.IsSkinned = true;
        end
        return statusBar;
    end

    -- Frame
    if not doSkin.NoParchment then
        return;
    end

    KrowiAF_SummaryFrame:StripTextures();
    KrowiAF_SummaryFrame:GetChildren():Hide();
end

--[[ FilterButton ]]
local function SkinFilterButton()
    skins:HandleButton(KrowiAF_AchievementFrameFilterButton);

    local highlightTex = KrowiAF_AchievementFrameFilterButton.GetHighlightTexture and KrowiAF_AchievementFrameFilterButton:GetHighlightTexture();
    if highlightTex then
        highlightTex:SetTexture();
    else
        KrowiAF_AchievementFrameFilterButton:StripTextures();
    end

	KrowiAF_AchievementFrameFilterButton:ClearAllPoints();
	KrowiAF_AchievementFrameFilterButton:Point("BOTTOMLEFT", KrowiAF_AchievementsFrame, "TOPLEFT", 2, 1);
end

-- [[ Search ]]
local function SkinSearchOptionsButton()
    skins:HandleButton(KrowiAF_SearchBoxFrame.OptionsMenuButton);

    local highlightTex = KrowiAF_SearchBoxFrame.OptionsMenuButton.GetHighlightTexture and KrowiAF_SearchBoxFrame.OptionsMenuButton:GetHighlightTexture();
    if highlightTex then
        highlightTex:SetTexture();
    else
        KrowiAF_SearchBoxFrame.OptionsMenuButton:StripTextures();
    end

    KrowiAF_SearchBoxFrame.OptionsMenuButton:ClearAllPoints();
    KrowiAF_SearchBoxFrame.OptionsMenuButton:Point("LEFT", KrowiAF_SearchBoxFrame, "LEFT", -3, 0);
end

local function SkinSearchBoxFrame(frame)
    skins:HandleEditBox(frame);
    frame.backdrop:Point('TOPLEFT', frame, 'TOPLEFT', -3, -3);
    frame.backdrop:Point('BOTTOMRIGHT', frame, 'BOTTOMRIGHT', 0, 3);
    frame:ClearAllPoints();
    frame:Point('TOPRIGHT', AchievementFrame, -22, -1);
    frame:Size(114, 27);
end

local function SkinSearchPreviewButton(button)
    button:StripTextures();

    if button.Icon then
        skins:HandleIcon(button.Icon);
    end

    button:CreateBackdrop('Transparent');
    button:SetHighlightTexture(engine.media.normTex);

    local hl = button:GetHighlightTexture();
    hl:SetVertexColor(1, 1, 1, 0.3);
    hl:Point('TOPLEFT', 1, -1);
    hl:Point('BOTTOMRIGHT', -1, 1);
end

local function SkinSearchPreviewFrame()
    KrowiAF_SearchBoxFrame.PreviewContainer:StripTextures();
    KrowiAF_SearchBoxFrame.PreviewContainer:ClearAllPoints();
    KrowiAF_SearchBoxFrame.PreviewContainer:Point('TOPLEFT', KrowiAF_AchievementsFrame, 'TOPRIGHT', 22, 25);

    for _, button in next, KrowiAF_SearchBoxFrame.PreviewContainer.Buttons do
        SkinSearchPreviewButton(button);
    end
    SkinSearchPreviewButton(KrowiAF_SearchBoxFrame.PreviewContainer.ShowFullSearchResultsButton);
end

local function SkinSearchResultsButton(_, button)
    button:SetNormalTexture('');
    button:SetPushedTexture('');
    button:GetRegions():Hide();

    button.ResultType:SetTextColor(1, 1, 1);
    button.Path:SetTextColor(1, 1, 1);
end

local function SkinSearchResultsFrame()
    KrowiAF_SearchBoxFrame.ResultsFrame:StripTextures();
    KrowiAF_SearchBoxFrame.ResultsFrame:CreateBackdrop('Transparent');

    KrowiAF_SearchBoxFrame.ResultsFrame.ScrollView:RegisterCallback(ScrollBoxListViewMixin.Event.OnAcquiredFrame, SkinSearchResultsButton, KrowiAF_SearchBoxFrame.ResultsFrame);

    skins:HandleCloseButton(KrowiAF_SearchBoxFrame.ResultsFrame.closeButton);
    skins:HandleTrimScrollBar(KrowiAF_SearchBoxFrame.ResultsFrame.ScrollBar);
end

-- [[ Header ]]
local function SkinHeader()
    hooksecurefunc(AchievementFrame.Header.Points, "SetText", function()
        AchievementFrame.Header.PointBorder:ClearAllPoints();
        AchievementFrame.Header.PointBorder:Point('TOPLEFT', KrowiAF_AchievementFrameFilterButton, 'TOPRIGHT', 70, 0);
        AchievementFrame.Header.PointBorder:Point('BOTTOMRIGHT', KrowiAF_SearchBoxFrame.backdrop, 'BOTTOMLEFT', -80, 0);
        AchievementFrame.Header.Points:ClearAllPoints();
        AchievementFrame.Header.Points:Point('CENTER', AchievementFrame.Header.PointBorder, 'CENTER', -10, 0);
    end);
    if addon.Util.IsClassicWithAchievements then
        AchievementFrameHeaderLeftDDLInset:SetAlpha(0);
    end

    KrowiAF_AchievementFrameHeaderButton:SetPoint("TOPLEFT", AchievementFrame.Header.PointBorder);
    KrowiAF_AchievementFrameHeaderButton:SetPoint("BOTTOMRIGHT", AchievementFrame.Header.PointBorder);

    skins:HandleNextPrevButton(KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton);
    skins:HandleNextPrevButton(KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton);
    KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:ClearPoint("RIGHT");
    KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:ClearPoint("RIGHT");
    KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton:SetPoint("LEFT", KrowiAF_AchievementFrameFilterButton, "RIGHT");
    KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton:SetPoint("LEFT", KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, "RIGHT");
end

-- [[ Some Default Blizzard Stuff ]]
local function ReskinBlizzard()
    AchievementFrameCategories:Point("TOPLEFT", AchievementFrame, 21, -26);
    if addon.Util.IsClassicWithAchievements then
        AchievementFrameCloseButton:ClearAllPoints();
        AchievementFrameCloseButton:Point('TOPRIGHT', AchievementFrame, 'TOPRIGHT', 4, 5);
        AchievementFrame.backdrop:ClearAllPoints();
        AchievementFrame.backdrop:Point('TOPLEFT', AchievementFrame, 'TOPLEFT', 0, 0);
        AchievementFrame.backdrop:Point('BOTTOMRIGHT', AchievementFrame, 'BOTTOMRIGHT', 0, 0);
    else
        SkinSearchBoxFrame(AchievementFrame.SearchBox);
    end
    AchievementFrameFilterDropdown:ClearAllPoints();
	AchievementFrameFilterDropdown:Point('TOPLEFT', AchievementFrameAchievements, 'TOPLEFT', -16, 25);
    AchievementFrameFilterDropdown:Size(AchievementFrameFilterDropdown:GetWidth(), AchievementFrameFilterDropdown:GetHeight() - 1);
end

-- [[ DataManager ]]
local function SkinDataManager()
    KrowiAF_DataManagerFrame:StripTextures();
    KrowiAF_DataManagerFrame.Inset:StripTextures();
    KrowiAF_DataManagerFrame.CloseButton:Point("TOPRIGHT", 0, 2);
    skins:HandleFrame(KrowiAF_DataManagerFrame, true, nil, -5, 0, -1, 0);

    skins:HandleTrimScrollBar(KrowiAF_DataManagerFrame.CharacterList.ScrollBar)

	local columnDisplay = KrowiAF_DataManagerFrame.CharacterList.ColumnDisplay;
	columnDisplay:StripTextures();
    for i = 1, columnDisplay:GetNumChildren() do
        local child = select(i, columnDisplay:GetChildren())
        child:StripTextures();
        child:SetTemplate("Transparent");
    end

    hooksecurefunc(KrowiAF_DataManagerFrame.CharacterList.ScrollBox, "Update", function()
        for _, button in next, {KrowiAF_DataManagerFrame.CharacterList.ScrollBox.ScrollTarget:GetChildren()} do
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

    skins:HandleButton(KrowiAF_DataManagerFrame.Import);
end

local function SkinTextFrame()
    hooksecurefunc(addon.Gui.DataManager, "GetTextFrame", function(...)
        if KrowiAF_TextFrame.IsSkinned then
            return;
        end

        local frame = KrowiAF_TextFrame;
        frame:StripTextures();
        frame.Inset:StripTextures();
        frame.CloseButton:Point("TOPRIGHT", 0, 2);
        skins:HandleFrame(frame, true, nil, -5, 0, -1, 0);
        frame.Input.frame:SetPoint("BOTTOMRIGHT", frame.Inset ,"BOTTOMRIGHT", -3, 0);
        skins:HandleButton(frame.Button1);
    end);
end

-- [[ Calendar ]]
local function SkinCalendarButton()
    skins:HandleButton(KrowiAF_AchievementFrameCalendarButton);
    KrowiAF_AchievementFrameCalendarButton:ClearAllPoints();
    KrowiAF_AchievementFrameCalendarButton:Point("TOPRIGHT", KrowiAF_SearchBoxFrame, "TOPLEFT", -6, -3);
    KrowiAF_AchievementFrameCalendarButton:Size(22, 22);
    local fs = KrowiAF_AchievementFrameCalendarButton:CreateFontString(nil, nil, "GameFontHighlightSmall");
    fs:SetPoint("CENTER", 0, 0);
    KrowiAF_AchievementFrameCalendarButton:SetFontString(fs);
    local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
    KrowiAF_AchievementFrameCalendarButton:SetText(currentCalendarTime.monthDay);
end

local function SkinCalendarDayButton(button)
    button.DarkFrame:SetAlpha(.5);

    if doSkin.NoParchment then
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

local function SkinCalendarFrame()
    KrowiAF_AchievementCalendarFrame:DisableDrawLayer("BORDER");
    KrowiAF_AchievementCalendarFrame:CreateBackdrop("Transparent");

    local closeButton = KrowiAF_AchievementCalendarFrame.CloseButton;
    skins:HandleCloseButton(closeButton);
    closeButton:Point("TOPRIGHT", -4, -4);

    for i = 1, 7 do
        KrowiAF_AchievementCalendarFrame.WeekDayBackgrounds[i]:SetAlpha(0);
    end

    KrowiAF_AchievementCalendarFrame.MonthBackground:SetAlpha(0);
    KrowiAF_AchievementCalendarFrame.YearBackground:SetAlpha(0);

    skins:HandleNextPrevButton(KrowiAF_AchievementCalendarFrame.PrevMonthButton, nil, nil, true);
    skins:HandleNextPrevButton(KrowiAF_AchievementCalendarFrame.NextMonthButton, nil, nil, true);

    for i = 1, 42 do
        SkinCalendarDayButton(KrowiAF_AchievementCalendarFrame.DayButtons[i]);
    end

    local weekdaySelectedTexture = KrowiAF_AchievementCalendarFrame.WeekdaySelectedTexture;
    weekdaySelectedTexture:SetDesaturated(true);
    weekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6);

    local todayFrame = KrowiAF_AchievementCalendarFrame.TodayFrame;
    todayFrame.Texture:Hide()
    todayFrame.Glow:Hide()

    todayFrame:SetTemplate();
    todayFrame:SetBackdropBorderColor(_G.NORMAL_FONT_COLOR:GetRGB());
    todayFrame:SetBackdropColor(0, 0, 0, 0);
    todayFrame:SetScript("OnUpdate", nil);

    hooksecurefunc(KrowiAF_AchievementCalendarFrame, "SetToday", function()
        todayFrame:SetAllPoints();
    end);

    KrowiAF_AchievementCalendarFrame.MonthAchievementsAndPoints:SetPoint("TOPRIGHT", -40, -13);
end

local function SkinCalendarSideFrame()
    KrowiAF_AchievementCalendarFrame.SideFrame:StripTextures(true);
    KrowiAF_AchievementCalendarFrame.SideFrame:SetTemplate('Transparent');
    KrowiAF_AchievementCalendarFrame.SideFrame:Point('TOPLEFT', KrowiAF_AchievementCalendarFrame.SideFrame:GetParent(), 'TOPRIGHT', 3, -24);
    KrowiAF_AchievementCalendarFrame.SideFrame.Header:StripTextures();
    skins:HandleCloseButton(KrowiAF_AchievementCalendarFrame.SideFrame.CloseButton);

    SkinAchievementsFrameLight(KrowiAF_AchievementCalendarFrame.SideFrame.AchievementsFrame);
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
        SkinSearchBoxFrame(KrowiAF_SearchBoxFrame);
        SkinSearchPreviewFrame();
        SkinSearchResultsFrame();
        SkinHeader();
        ReskinBlizzard();
        SkinDataManager();
        SkinTextFrame();
        SkinCalendarButton();
    end
    if doSkin.Calendar then
        SkinCalendarFrame();
        SkinCalendarSideFrame();
    end
end

-- [[ Alert and Side Buttons ]]
local function ForceAlpha(self, alpha, forced)
    if alpha ~= 1 and forced ~= true then
        self:SetAlpha(1, true)
    end
end

local function SkinAlertFrameTemplate(frame)
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

local function SkinSideButton(button, prevButton)
    if not button.HasElvUiSkin then
        SkinAlertFrameTemplate(button);
    end
    if not prevButton then
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, addon.Util.IsMainline and 6 or 13); -- Make the 2nd button anchor like the 1st one
    else
        button:ClearAllPoints();
        button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9); -- Make the 2nd button anchor like the 1st one
    end
    button.HasElvUiSkin = true;
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
    tooltip:SetStyle(KrowiAF_FloatingAchievementTooltip);
    skins:HandleCloseButton(KrowiAF_FloatingAchievementTooltip.CloseButton);
end

function elv:OnEvent(event, arg1, arg2)
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
        name = addon.L["ElvUI " .. localizationName],
        desc = addon.L["ElvUI " .. localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true,
        hidden = hidden
    };
end

function elv:InjectOptions()
    local pluginTable = KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "ElvUI",
        addon.L["ElvUI"],
        addon.L["ElvUI Desc"],
        function()
            return IsLoaded();
        end
    );
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return doSkin.Achievements; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinMiscFrames", AddInfo("Skin Misc Frames", function() return doSkin.MiscFrames; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinTooltip", AddInfo("Skin Tooltip", function() return doSkin.Tooltip; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinTutorials", AddInfo("Skin Tutorials", function() return doSkin.Tutorials; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAlertFrames", AddInfo("Skin Alert Frames", function() return doSkin.AlertFrames; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinCalendar", AddInfo("Skin Calendar", function() return doSkin.Calendar; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "RemoveParchment", AddInfo("Remove Parchment", function() return doSkin.NoParchment; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinDataManager", AddInfo("Skin Data Manager", function() return doSkin.Achievements; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAce3", AddInfo("Skin Ace3", function() return doSkin.Options; end));
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "FixWorldMapButton", AddInfo("Fix World Map Button", function() return doSkin.SmallerWorldMap; end));
end

local function DisableOptions()
    local appName = addon.Metadata.Prefix .. "_EventReminders";
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.GrowDirection").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.Spacing").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetX").disabled = true;
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetY").disabled = true;
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "ElvUIComment", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["Alert System Overwrite Desc"]:K_ReplaceVars(addon.L["ElvUI"])
    });

    if doSkin.Achievements then
        appName = addon.Metadata.Prefix .. "_Layout";
        KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetX").disabled = true;
        KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetY").disabled = true;
        addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args"), "ElvUIComment", {
            order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
            name = addon.L["Calendar Button Position Overwrite Desc"]:K_ReplaceVars(addon.L["ElvUI"])
        });
    end
end

function elv:Load()
    if not IsLoaded() then
        return;
    end

    doSkin = {};

    engine = unpack(ElvUI);
    skins = engine:GetModule("Skins");
    tooltip = engine:GetModule("Tooltip");
    local privateSkins = engine.private.skins;
    local blizzardSkins = privateSkins.blizzard;

    doSkin.Achievements = blizzardSkins.enable and blizzardSkins.achievement;
    doSkin.MiscFrames = blizzardSkins.enable and blizzardSkins.misc;
    doSkin.Tooltip = blizzardSkins.enable and blizzardSkins.tooltip;
    doSkin.Tutorials = blizzardSkins.enable and blizzardSkins.tutorials;
    doSkin.AlertFrames = blizzardSkins.enable and blizzardSkins.alertframes;
    doSkin.Calendar = blizzardSkins.enable and blizzardSkins.calendar;
    doSkin.NoParchment = blizzardSkins.enable and blizzardSkins.calendar and privateSkins.parchmentRemoverEnable;
    doSkin.Options = privateSkins.ace3Enable;
    doSkin.SmallerWorldMap = addon.Util.IsWrathClassic and engine.global.general.smallerWorldMap;

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

    if addon.Util.IsWrathClassic then
        local worldMapModule = engine:GetModule("WorldMap");
        hooksecurefunc(worldMapModule, "SetSmallWorldMap", function()
            addon.Gui.WorldMapButton:SetFrameStrata("TOOLTIP");
        end);
    end

    DisableOptions();
end