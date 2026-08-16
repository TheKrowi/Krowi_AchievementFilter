-- [[ Disclaimer ]] --
-- Bridges Krowi's own Blizzard-style achievement UI to EllesmereUI's Blizzard Window Skins.
-- Krowi recreates Blizzard achievement tabs, rows, categories, summary bars, and inset
-- frames under Krowi-owned names, so EllesmereUI's native skin can't discover them; this
-- file feeds those Krowi-owned frames through EllesmereUI's public S.* primitives instead.
-- Reference: https://github.com/EllesmereGaming/EllesmereUI/blob/main/SKINNING_API.md
-- Anchor offsets below mirror Plugins/ElvUI.lua's values as a starting point and may need
-- in-game tuning against EllesmereUI's actual reflow of AchievementFrame.

local _, addon = ...
local compatibility = {}
KrowiAF.PluginsApi:RegisterPlugin("EllesmereUI", compatibility)

local function IsLoaded()
    return addon.Util.IsMainline and EllesmereUI ~= nil and EllesmereUI.RegisterSkin ~= nil
end

local skin
local hooksInstalled

local achievementArtKeys = {
    "Background",
    "BottomLeftTsunami",
    "BottomRightTsunami",
    "TopLeftTsunami",
    "TopRightTsunami",
    "BottomTsunami",
    "TopTsunami",
    "HeaderBackground",
    "Glow",
    "RewardBackground",
    "FactionIcon",
    "Check",
    "PlusMinus"
}

local progressBorderKeys = {
    "BorderLeftTop",
    "BorderLeftMiddle",
    "BorderLeftBottom",
    "BorderRightTop",
    "BorderRightMiddle",
    "BorderRightBottom",
    "BorderMiddleTop",
    "BorderMiddleMiddle",
    "BorderMiddleBottom"
}

local function FadeTexture(texture)
    if texture and texture.SetAlpha then
        texture:SetAlpha(0)
    end
end

-- S.ScrollBar handles the arrows/track art and paints its own thumb strip, but leaves
-- WowTrimScrollBar's groove Background texture(s) alone; fade those ourselves, the thumb is untouched.
local function SkinScrollBar(scrollBar)
    if not (skin and scrollBar) then
        return
    end
    skin.ScrollBar(scrollBar)
    FadeTexture(scrollBar.Background)
    if scrollBar.Track then
        FadeTexture(scrollBar.Track.Background)
    end
end

-- [[ Tabs ]]
local function SkinKrowiTabs()
    if not skin then
        return
    end

    local factory = addon.Gui.AchievementFrameTabButtonFactory
    local tabs = factory and factory.GetTabs and factory:GetTabs()
    if tabs then
        for _, tab in next, tabs do
            skin.Tab(tab)
        end
    end

    -- Tabs registered by other addons through KrowiAF's plugin API
    for _, addonTabs in next, addon.Gui.Tabs or {} do
        for _, tab in next, addonTabs do
            skin.Tab(tab)
        end
    end
end

-- [[ Categories ]]
local function SkinCategoryButton(button)
    if not (skin and button) then
        return
    end
    skin.Button(button)
    skin.Font(button.Label)
end

local progressBarPanels = setmetatable({}, {__mode = "k"})

-- S.Panel fades every texture region on the frame it's given, which would alpha out a
-- progress bar's own fill textures too; skin a same-sized overlay child instead.
local function GetProgressBarPanel(progressBar)
    local panel = progressBarPanels[progressBar]
    if not panel then
        panel = CreateFrame("Frame", nil, progressBar)
        -- panel:SetColors({R = 0, G = 0.5, B = 0}, {R = 0.8, G = 0, B = 0})
        panel:SetAllPoints(progressBar)
        panel:SetFrameLevel(progressBar:GetFrameLevel())
        progressBarPanels[progressBar] = panel
    end
    return panel
end

-- [[ Criteria progress bars (AchievementProgressBarTemplate, a real StatusBar) ]]
local function SkinProgressBar(bar)
    if not (skin and bar) then
        return
    end
    skin.Panel(GetProgressBarPanel(bar), {inset = true})
    if bar.SetStatusBarTexture then
        bar:SetStatusBarTexture("Interface\\Buttons\\WHITE8x8")
        local fill = bar:GetStatusBarTexture()
        if fill and fill.SetAlpha then
            fill:SetAlpha(1)
        end
        skin.ApplyBarFill(bar)
    end
    skin.Font(bar.Text or bar.text)
end

local function GetTooltipProgressBar()
    local progressBarLib = addon.ProgressBarLib
    local tooltip = progressBarLib and progressBarLib.GameTooltipWithProgressBar
    return tooltip and tooltip.ProgressBar
end

-- [[ Achievements ]]
local function SkinAchievementTitle(button)
    local title = button and button.Header
    if not title then
        return
    end

    skin.Font(title)
    local completed = button.DateCompleted and button.DateCompleted.IsShown and button.DateCompleted:IsShown()
    if button.accountWide then
        title:SetTextColor(completed and 0.35 or 0.24, completed and 0.75 or 0.46, completed and 1 or 0.6)
    elseif completed then
        title:SetTextColor(1, 0.85, 0.35)
    else
        title:SetTextColor(0.64, 0.56, 0.3)
    end
end

-- ElvUI/GW2_UI both cover TooltipBorderBackdropTemplate's rounded backdrop with their own
-- child frame rather than fighting Blizzard's re-assertion of it; do the same here, since a
-- child frame always draws above its parent's own backdrop regardless of scroll recycling.
local function GetButtonBorderCover(button)
    local cover = button.KAF_EUIBorderCover
    if not cover then
        cover = CreateFrame("Frame", nil, button)
        cover:SetAllPoints(button)
        button.KAF_EUIBorderCover = cover
    end
    return cover
end

local function SkinAchievementButton(button)
    if not (skin and button) then
        return
    end

    -- S.Button supplies the flat plate, border, and hover treatment; Krowi repaints several
    -- stock textures on every Update, so fade only those named art regions each refresh.
    skin.Button(button, {"Icon"})
    for _, key in next, achievementArtKeys do
        FadeTexture(button[key])
    end

    -- The template inherits TooltipBorderBackdropTemplate's rounded backdrop, which Blizzard
    -- re-applies whenever the ScrollBox recycles this pooled button; cover it with our own
    -- panel instead (border only, so the icon/text underneath stays visible).
    skin.Panel(GetButtonBorderCover(button), {noBg = true})

    if button.Highlight then
        skin.FadeRegions(button.Highlight)
    end
    if button.Icon then
        FadeTexture(button.Icon.Border)
        if button.Icon.Texture then
            skin.SquareIcon(button.Icon.Texture, button.Icon)
        end
    end
    if button.Tracked then
        skin.Checkbox(button.Tracked)
    end

    SkinAchievementTitle(button)
    skin.White(button.Description) -- always white, regardless of completion state
    skin.Font(button.HiddenDescription)
    skin.Font(button.DateCompleted)
    if button.Shield and button.Shield.Points then
        skin.Font(button.Shield.Points)
    end
    if button.Reward then
        skin.Font(button.Reward)
    end
end

local function SkinObjectives(objectives)
    if not (skin and objectives) then
        return
    end

    for _, criteria in next, objectives.criteriaTable or {} do
        skin.Font(criteria.Label)
        skin.Font(criteria.Dash)
    end
    for _, meta in next, objectives.metaCriteriaTable or {} do
        skin.Font(meta.Label)
    end
    for _, bar in next, objectives.progressBarTable or {} do
        SkinProgressBar(bar)
    end
end

-- [[ Static frames: Categories / Achievements / Summary ]]
local function SkinAchievementsFrameLight(frame)
    if not (skin and frame) then
        return
    end
    skin.Inset(frame)
    skin.FadeRegions(frame.Border) -- AchivementGoldBorderBackdrop, not covered by S.Inset
    SkinScrollBar(frame.ScrollBar)
end

local function SkinSummaryStatusBar(statusBar)
    if not (skin and statusBar) then
        return
    end

    skin.Panel(GetProgressBarPanel(statusBar), {inset = true})
    for _, key in next, progressBorderKeys do
        FadeTexture(statusBar[key])
    end
    FadeTexture(statusBar.Background)
    for _, fill in next, statusBar.Fill or {} do
        fill:SetTexture("Interface\\Buttons\\WHITE8x8")
        fill:SetAlpha(1)
    end
    skin.Font(statusBar.TextLeft)
    skin.Font(statusBar.TextRight)
    if statusBar.Button then
        skin.FadeRegions(statusBar.Button)
    end
end

local function FadeSummaryOuterBorder(summaryFrame)
    if not (summaryFrame and summaryFrame.GetChildren) then
        return
    end

    -- This Krowi template's outer AchivementGoldBorderBackdrop is its only anonymous
    -- direct child. All content children and status bars are named.
    for index = 1, select("#", summaryFrame:GetChildren()) do
        local child = select(index, summaryFrame:GetChildren())
        if child and child.GetName and child:GetName() == nil then
            skin.FadeRegions(child)
            break
        end
    end
end

local function SkinStaticFrames()
    if not skin then
        return
    end

    local achievements = KrowiAF_AchievementsFrame
    local categories = KrowiAF_CategoriesFrame
    local summary = KrowiAF_SummaryFrame

    if achievements then
        skin.Inset(achievements)
        skin.FadeRegions(achievements.Border) -- AchivementGoldBorderBackdrop, not covered by S.Inset
        FadeTexture(achievements.Background)
        FadeTexture(achievements.Artwork) -- Leftover parchment dimming behind the scroll bar/list
        SkinScrollBar(achievements.ScrollBar)
    end
    if categories then
        skin.Inset(categories)
        skin.FadeRegions(categories.Border) -- AchivementGoldBorderBackdrop, not covered by S.Inset
        SkinScrollBar(categories.ScrollBar)
    end
    if summary then
        FadeTexture(summary.Background)
        FadeSummaryOuterBorder(summary)
        if summary.AchievementsFrame then
            SkinAchievementsFrameLight(summary.AchievementsFrame)
        end

        for _, section in next, {summary.Achievements, summary.Categories} do
            local header = section and section.Header
            if header then
                if header.Texture then
                    header.Texture:SetVertexColor(1, 1, 1, 0.25)
                end
                skin.Font(header.Title)
            end
        end

        for index = 1, select("#", summary:GetChildren()) do
            local child = select(index, summary:GetChildren())
            if child and child.Fill and child.TextLeft and child.TextRight then
                SkinSummaryStatusBar(child)
            end
        end
    end

    -- The tooltip bar is the same non-StatusBar Krowi_ProgressBar_Template as the summary bars.
    SkinSummaryStatusBar(GetTooltipProgressBar())
end

local function SkinRealizedRows()
    local categories = KrowiAF_CategoriesFrame
    local achievements = KrowiAF_AchievementsFrame
    local summary = KrowiAF_SummaryFrame

    if categories and categories.ScrollBox and categories.ScrollBox.ForEachFrame then
        categories.ScrollBox:ForEachFrame(SkinCategoryButton)
    end
    if achievements and achievements.ScrollBox and achievements.ScrollBox.ForEachFrame then
        achievements.ScrollBox:ForEachFrame(SkinAchievementButton)
    end
    if summary and summary.AchievementsFrame and summary.AchievementsFrame.ScrollBox and summary.AchievementsFrame.ScrollBox.ForEachFrame then
        summary.AchievementsFrame.ScrollBox:ForEachFrame(SkinAchievementButton)
    end
end

-- [[ FilterButton ]]
local function SkinFilterButton()
    if not (skin and KrowiAF_AchievementFrameFilterButton) then
        return
    end
    skin.Button(KrowiAF_AchievementFrameFilterButton)
end

-- [[ Search ]]
local function SkinSearchOptionsButton()
    if not (skin and KrowiAF_SearchBoxFrame) then
        return
    end
    skin.Button(KrowiAF_SearchBoxFrame.OptionsMenuButton)
end

local function SkinSearchBoxFrame(frame)
    if not (skin and frame) then
        return
    end
    skin.EditBox(frame)
end

local function SkinSearchPreviewButton(button)
    if not (skin and button) then
        return
    end
    skin.Button(button, {"Icon"})
    if button.Icon then
        skin.SquareIcon(button.Icon)
    end
end

local function SkinSearchPreviewFrame()
    if not (skin and KrowiAF_SearchBoxFrame) then
        return
    end
    local container = KrowiAF_SearchBoxFrame.PreviewContainer
    skin.Panel(container)
    container:ClearAllPoints()
    container:SetPoint("TOPLEFT", KrowiAF_AchievementsFrame, "TOPRIGHT", 22, 25)

    for _, button in next, container.Buttons or {} do
        SkinSearchPreviewButton(button)
    end
    SkinSearchPreviewButton(container.ShowFullSearchResultsButton)
end

local function SkinSearchResultsButton(button)
    if not (skin and button) then
        return
    end
    skin.Button(button)
    skin.White(button.ResultType)
    skin.White(button.Path)
end

local function SkinSearchResultsFrame()
    if not (skin and KrowiAF_SearchBoxFrame) then
        return
    end
    local resultsFrame = KrowiAF_SearchBoxFrame.ResultsFrame
    skin.Panel(resultsFrame)
    skin.CloseButton(resultsFrame.closeButton)
    SkinScrollBar(resultsFrame.ScrollBar)

    if resultsFrame.ScrollBox and resultsFrame.ScrollBox.ForEachFrame then
        resultsFrame.ScrollBox:ForEachFrame(SkinSearchResultsButton)
    end
end

-- [[ Header ]]
local function SkinHeader()
    if not skin then
        return
    end

    skin.PageButton(KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, "<")
    skin.PageButton(KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton, ">")
end

-- [[ Some Blizzard-owned layout fixes (EllesmereUI already skins AchievementFrame itself) ]]
local function ReskinBlizzard()
    AchievementFrameCategories:SetPoint("TOPLEFT", AchievementFrame, 21, -26)
    AchievementFrameFilterDropdown:ClearAllPoints()
    AchievementFrameFilterDropdown:SetPoint("TOPLEFT", AchievementFrameAchievements, "TOPLEFT", -16, 25)
    AchievementFrameFilterDropdown:SetSize(AchievementFrameFilterDropdown:GetWidth(), AchievementFrameFilterDropdown:GetHeight() - 1)
end

-- [[ DataManager ]]
local function SkinDataManager()
    if not (skin and KrowiAF_DataManagerFrame) then
        return
    end

    local frame = KrowiAF_DataManagerFrame
    skin.Shell(frame)
    skin.Inset(frame.Inset)
    skin.CloseButton(frame.CloseButton)
    frame.CloseButton:SetPoint("TOPRIGHT", 0, 2)

    SkinScrollBar(frame.CharacterList.ScrollBar)
    skin.SortHeaderBar(frame.CharacterList.ColumnDisplay)

    if frame.CharacterList.ScrollBox and frame.CharacterList.ScrollBox.ForEachFrame then
        frame.CharacterList.ScrollBox:ForEachFrame(function(button)
            skin.Checkbox(button.HeaderTooltip)
            skin.Checkbox(button.EarnedByAchievementTooltip)
            skin.Checkbox(button.MostProgressAchievementTooltip)
            skin.Checkbox(button.IgnoreCharacter)
        end)
    end

    skin.Button(frame.Import)
end

-- [[ TextFrame (lazily created on first use) ]]
local function SkinTextFrame()
    if not (skin and KrowiAF_TextFrame) or KrowiAF_TextFrame.KAF_EUISkinned then
        return
    end
    KrowiAF_TextFrame.KAF_EUISkinned = true

    local frame = KrowiAF_TextFrame
    skin.Shell(frame)
    skin.Inset(frame.Inset)
    skin.CloseButton(frame.CloseButton)
    frame.CloseButton:SetPoint("TOPRIGHT", 0, 2)
    skin.Button(frame.Button1)
end

-- [[ Calendar ]]
local function SkinCalendarButton()
    if not (skin and KrowiAF_AchievementFrameCalendarButton) then
        return
    end
    local button = KrowiAF_AchievementFrameCalendarButton
    skin.Button(button)
    skin.Font(button:GetFontString())
end

local function SkinCalendarDayButton(button)
    if not (skin and button) then
        return
    end
    skin.Button(button)
    if button.DarkFrame then
        button.DarkFrame:SetAlpha(0.5)
    end
end

local function SkinCalendarTodayFrame(todayFrame)
    if not (skin and todayFrame) then
        return
    end

    -- No primitive covers a custom "today" highlight; repurpose the existing Glow
    -- art with the live accent color instead, per Guidelines for self-colored elements.
    if todayFrame.Texture then
        todayFrame.Texture:Hide()
    end
    if todayFrame.Glow then
        local r, g, b = skin.GetAccentColor()
        todayFrame.Glow:Show()
        todayFrame.Glow:SetVertexColor(r, g, b)
    end
end

local function SkinCalendarFrame()
    if not (skin and KrowiAF_AchievementCalendarFrame) then
        return
    end

    local frame = KrowiAF_AchievementCalendarFrame
    skin.Shell(frame)
    skin.CloseButton(frame.CloseButton)
    frame.CloseButton:SetPoint("TOPRIGHT", -4, -4)

    for i = 1, 7 do
        FadeTexture(frame.WeekDayBackgrounds[i])
    end
    FadeTexture(frame.MonthBackground)
    FadeTexture(frame.YearBackground)

    skin.PageButton(frame.PrevMonthButton, "<")
    skin.PageButton(frame.NextMonthButton, ">")

    for i = 1, 42 do
        SkinCalendarDayButton(frame.DayButtons[i])
    end

    if frame.WeekdaySelectedTexture then
        frame.WeekdaySelectedTexture:SetDesaturated(true)
        frame.WeekdaySelectedTexture:SetVertexColor(1, 1, 1, 0.6)
    end

    SkinCalendarTodayFrame(frame.TodayFrame)
    frame.MonthAchievementsAndPoints:SetPoint("TOPRIGHT", -40, -13)
end

local function SkinCalendarSideFrame()
    if not (skin and KrowiAF_AchievementCalendarFrame) then
        return
    end

    local sideFrame = KrowiAF_AchievementCalendarFrame.SideFrame
    skin.Panel(sideFrame)
    sideFrame:ClearAllPoints()
    sideFrame:SetPoint("TOPLEFT", sideFrame:GetParent(), "TOPRIGHT", 3, -24)
    skin.FadeRegions(sideFrame.Header)
    skin.CloseButton(sideFrame.CloseButton)

    SkinAchievementsFrameLight(sideFrame.AchievementsFrame)
end

-- [[ EventReminder alert toasts ]]
local function SkinAlertFrameTemplate(frame)
    if not (skin and frame) then
        return
    end

    FadeTexture(frame.Background)
    FadeTexture(frame.glow)
    FadeTexture(frame.shine)
    -- pcall-isolated: some client/EllesmereUI combos throw inside S.Panel's region walk for this
    -- Blizzard AlertFrameTemplate-derived frame (WindowEngine.lua's FadeRegions, "attempt to call
    -- a nil value" iterating frame:GetRegions()); must never interrupt Blizzard's ShowAlert flow
    -- or spam an error on every toast.
    pcall(skin.Panel, frame)
    skin.White(frame.Unlocked)
    skin.Font(frame.Name)
    if frame.Icon and frame.Icon.Texture then
        skin.SquareIcon(frame.Icon.Texture, frame.Icon)
    end
end

local function SkinSideButton(button, prevButton)
    if not button then
        return
    end
    button:ClearAllPoints()
    if not prevButton then
        button:SetPoint("TOPLEFT", AchievementFrame, "TOPRIGHT", 5, 6)
    else
        button:SetPoint("TOPLEFT", prevButton, "BOTTOMLEFT", 0, 9)
    end
end

local function SkinSideButtons()
    local i = 1
    local button = _G["KrowiAF_AchievementFrameSideButton" .. i]
    local prevButton
    while button do
        SkinSideButton(button, prevButton)
        prevButton = button
        i = i + 1
        button = _G["KrowiAF_AchievementFrameSideButton" .. i]
    end
end

-- [[ FloatingAchievementTooltip ]]
local function SkinFloatingAchievementTooltip()
    if not (skin and KrowiAF_FloatingAchievementTooltip) then
        return
    end
    skin.Panel(KrowiAF_FloatingAchievementTooltip)
    skin.CloseButton(KrowiAF_FloatingAchievementTooltip.CloseButton)
end

-- [[ Skin everything above ]]
local function ApplyVisuals()
    if not AchievementFrame then -- Blizzard_AchievementUI not loaded yet; LoadWithBlizzard_AchievementUI will re-run this
        return
    end

    SkinKrowiTabs()
    SkinStaticFrames()
    SkinRealizedRows()
    SkinObjectives(KrowiAF_AchievementsObjectives)
    SkinFilterButton()
    SkinSearchOptionsButton()
    if KrowiAF_SearchBoxFrame then
        SkinSearchBoxFrame(KrowiAF_SearchBoxFrame)
        SkinSearchPreviewFrame()
        SkinSearchResultsFrame()
    end
    SkinHeader()
    ReskinBlizzard()
    SkinDataManager()
    SkinCalendarButton()
    SkinCalendarFrame()
    SkinCalendarSideFrame()
    SkinFloatingAchievementTooltip()
end

local function RefreshScrollBar(self)
    if self then
        SkinScrollBar(self.ScrollBar)
    end
end

local function InstallAlertFrameHooks()
    local alertSystem = addon.Gui.EventReminderAlertSystem
    if alertSystem.SubSystem then
        hooksecurefunc(alertSystem.SubSystem, "setUpFunction", SkinAlertFrameTemplate)
    else
        hooksecurefunc(alertSystem, "Load", function()
            if alertSystem.SubSystem then
                hooksecurefunc(alertSystem.SubSystem, "setUpFunction", SkinAlertFrameTemplate)
            end
        end)
    end

    hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Load", SkinSideButtons)
    hooksecurefunc(addon.Gui.EventReminderSideButtonSystem, "Refresh", SkinSideButtons)
end

local function InstallHooks()
    if hooksInstalled then
        return
    end
    hooksInstalled = true

    -- Krowi retains complete control of visibility, ordering, spacing, anchors, sizing,
    -- selection, clicks, data, and saved variables. Every hook below runs after Krowi's
    -- own update and changes visual regions only; every primitive is idempotent.
    hooksecurefunc(addon.Gui.AchievementFrameTabButtonFactory, "GetNew", SkinKrowiTabs)
    hooksecurefunc(addon.Gui, "LoadWithBlizzard_AchievementUI", ApplyVisuals)
    hooksecurefunc(KrowiAF_AchievementButtonMixin, "Update", SkinAchievementButton)
    -- The ScrollBox recycles pooled achievement buttons: a reused button is Shown again with
    -- new data, which is exactly when Blizzard's backdrop template creeps back in.
    hooksecurefunc(KrowiAF_AchievementButtonMixin, "OnShow", SkinAchievementButton)
    hooksecurefunc(KrowiAF_CategoryButtonMixin, "SetCategory", SkinCategoryButton)
    hooksecurefunc(KrowiAF_AchievementsObjectivesMixin, "DisplayCriteria", SkinObjectives)
    hooksecurefunc(Krowi_ProgressBarMixin, "UpdateTextures", function(statusBar)
        local isSummaryBar = KrowiAF_SummaryFrame and statusBar:GetParent() == KrowiAF_SummaryFrame
        if isSummaryBar or statusBar == GetTooltipProgressBar() then
            SkinSummaryStatusBar(statusBar)
        end
    end)

    -- Blizzard's managed scroll bar visibility behavior re-asserts its own arrow/track
    -- textures whenever a list's data provider changes, undoing the fade; S.ScrollBar is
    -- documented idempotent, so simply re-run it on every refresh.
    hooksecurefunc(KrowiAF_AchievementsFrameMixin, "ForceUpdate", RefreshScrollBar)
    hooksecurefunc(KrowiAF_CategoriesFrameMixin, "Update", RefreshScrollBar)
    hooksecurefunc(KrowiAF_AchievementsFrameLightMixin, "Update", RefreshScrollBar)

    hooksecurefunc(addon.Gui.DataManager, "GetTextFrame", SkinTextFrame)

    InstallAlertFrameHooks()
end

local function AddInfo(localizationName, getFunction, hidden)
    return {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "toggle", width = "full",
        name = addon.L["EllesmereUI " .. localizationName],
        desc = addon.L["EllesmereUI " .. localizationName .. " Desc"],
        descStyle = "inline",
        get = getFunction,
        disabled = true,
        hidden = hidden
    }
end

function compatibility:InjectOptions()
    local pluginTable = KrowiAF.UtilApi.InjectOptions:AddPluginTable(
        "EllesmereUI",
        addon.L["EllesmereUI"],
        addon.L["EllesmereUI Desc"],
        function()
            return IsLoaded()
        end
    )
    KrowiAF.UtilApi.InjectOptions:AddTable(pluginTable, "SkinAchievement", AddInfo("Skin Achievements", function() return skin ~= nil and skin.IsEnabled() end, not addon.Util.IsMainline))
end

local function DisableOptions()
    local appName = addon.Metadata.Prefix .. "_EventReminders"
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.GrowDirection").disabled = true
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.Spacing").disabled = true
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetX").disabled = true
    KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args.OffsetY").disabled = true
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.PopUps.args.Location.args"), "EllesmereUIComment", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["Alert System Overwrite Desc"]:K_ReplaceVars(addon.L["EllesmereUI"])
    })

    appName = addon.Metadata.Prefix .. "_Layout"
    KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetX").disabled = true
    KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args.OffsetY").disabled = true
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.Header.args.CalendarButton.args"), "EllesmereUIComment", {
        order = KrowiAF.UtilApi.InjectOptions.AutoOrderPlusPlus(), type = "description", width = "full",
        name = addon.L["Calendar Button Position Overwrite Desc"]:K_ReplaceVars(addon.L["EllesmereUI"])
    })
end

function compatibility:Load()
    if not IsLoaded() then
        return
    end

    EllesmereUI.RegisterSkin("Krowi_AchievementFilter", function(S)
        skin = S
        InstallHooks()
        ApplyVisuals()
        skin.OnLooksChanged(ApplyVisuals)
        DisableOptions()
    end)
end
