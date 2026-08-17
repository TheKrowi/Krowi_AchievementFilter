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

-- [[ Palette ]] --
-- Muted stand-ins for Krowi's parchment-tuned colors.
local mutedMissing = {R = 0.5, G = 0.13, B = 0.13}
local neutralMissing = {R = 0.34, G = 0.34, B = 0.34}
local completedCriteria = {0.4, 0.85, 0.5}

-- Neutral gray in place of the red when the earned fill's own red channel dominates.
local function GetMissingColor(r, g, b)
    if r > 0.35 and r > g * 1.6 and r > b * 1.6 then
        return neutralMissing
    end
    return mutedMissing
end

-- Rewritten in place; Krowi_ProgressBarMixin keeps the reference and re-reads it on Resize.
local earnedFill = {R = 0.16, G = 0.46, B = 0.3}

-- Adds the SetStatusBarColor that S.ApplyBarFill writes through. Krowi_ProgressBar_Template
-- is a plain Frame with Fill textures and has none.
local function InstallBarFillShim(bar)
    if bar.SetStatusBarColor then
        return
    end
    bar.SetStatusBarColor = function(self, r, g, b, a)
        earnedFill.R, earnedFill.G, earnedFill.B = r, g, b
        self:SetColors(earnedFill, GetMissingColor(r, g, b))
        -- Only once the bar has been populated. Resize, not UpdateTextures: this runs
        -- inside that hook.
        if self.Min and self.Max and self.Values then
            self:Resize()
        end
        for _, fill in next, self.Fill or {} do
            fill:SetAlpha(a or 1)
        end
    end
end

-- Black -> white, pure green -> muted green; every other color left alone.
local function RecolorCriteriaText(fontString)
    if not (fontString and fontString.GetTextColor) then
        return
    end
    local r, g, b = fontString:GetTextColor()
    if r < 0.1 and g < 0.1 and b < 0.1 then
        fontString:SetTextColor(1, 1, 1)
    elseif r < 0.1 and g > 0.9 and b < 0.1 then
        fontString:SetTextColor(unpack(completedCriteria))
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

-- [[ Tab row ]]
-- Seats the achievement tab row, Blizzard's tabs included: Gui.lua's AddDataToBlizzardTabs
-- registers those as Krowi tabs. EllesmereUI's window pack re-chains AchievementFrameTab1..3
-- onto each other from hooks on their SetPoint, OnShow and OnHide, and that re-chain always
-- gets the last write, so the shown Blizzard tabs are seated as one contiguous group and
-- everything else is chained around it. Anchoring a tab to one the pack moves would produce
-- a circular anchor, which drops the whole row's points.
local blizzardTabIndices = {1, 2, 3} -- the tabs the window pack re-chains

local function GetShownBlizzardTabs()
    local shown = {}
    for _, index in next, blizzardTabIndices do
        local tab = _G["AchievementFrameTab" .. index]
        if tab and tab:IsShown() then
            shown[#shown + 1] = tab
        end
    end
    return shown
end

-- One physical pixel in the frame's own coordinate space: the seam the window pack puts
-- between the tabs it owns, and the seam the whole row holds. SkinKrowiTabs runs every tab in
-- the row through S.Tab, Blizzard's own three included, so the tab art whose padding Gui.lua's
-- -5 compensates for is flattened away throughout. Krowi's Spacing is not added on top: the
-- pack pins the seams between the tabs it re-chains and re-asserts them from its own hooks, so
-- Spacing could only ever reach part of the row. DisableOptions greys the slider out.
-- Shared with the event side strip.
local function GetPixelSeam(frame)
    local pp = EllesmereUI and EllesmereUI.PP
    local scale = frame:GetEffectiveScale()
    if pp and pp.perfect and scale and scale > 0 then
        return pp.perfect / scale
    end
    return (pp and pp.mult) or 1
end

-- Sets a tab to the height of one the window pack owns, which it trims by a couple of
-- pixels. Reads the reference rather than assuming the trim. Re-asserts on every pass.
local function MatchTabHeight(tab, reference)
    if not reference then
        return
    end
    local height = reference:GetHeight()
    if height and height > 0 then
        tab:SetHeight(height)
    end
end

-- Anchors one tab, mirroring Gui.lua's UpdateTabsLayout, at the seam GetPixelSeam gives.
local function SeatTab(tab, previous, seam)
    tab:ClearAllPoints()
    if previous then
        tab:SetPoint("LEFT", previous, "RIGHT", seam, 0)
    else
        tab:SetPoint("BOTTOMLEFT", AchievementFrame, 11, -30)
    end
end

-- Reports whether EllesmereUI's window pack has taken over AchievementFrame: it skins the
-- window's chrome, and re-chains and height-trims Blizzard's three tabs. The pack is switchable
-- per window and runs for every style except "off". Also gates the skin as a whole; see Load.
local achievementWindowKey = "achievements" -- the pack's own key for AchievementFrame
local function AchievementWindowIsSkinned()
    local getStyle = EllesmereUI and EllesmereUI.GetBlizzWindowStyle
    if not getStyle then
        return false -- older EllesmereUI without the per-window style API
    end
    local ok, style = pcall(getStyle, achievementWindowKey)
    return ok and style ~= "off"
end

local lastTabsOrder
local relayoutingTabRow
local function RelayoutTabRow(_, tabsOrder)
    tabsOrder = tabsOrder or lastTabsOrder
    if relayoutingTabRow or not (skin and AchievementFrame and tabsOrder) then
        return
    end
    relayoutingTabRow = true
    lastTabsOrder = tabsOrder

    -- tabsOrder is keyed by each tab's Order and goes sparse when one is missing (no guild
    -- tab, an unloaded tab addon), so walk it by sorted key rather than with next.
    local ordered = {}
    for order, button in next, tabsOrder do
        ordered[#ordered + 1] = {Order = order, Button = button}
    end
    table.sort(ordered, function(a, b) return a.Order < b.Order end)

    local packOwned = AchievementWindowIsSkinned()
    local group = GetShownBlizzardTabs()
    local inGroup = {}
    -- The pack only re-chains from the second shown tab on, so a lone shown Blizzard tab is
    -- left on its own anchor and is seated here like any other tab.
    local rechained = packOwned and #group > 1
    if rechained then
        for _, tab in next, group do
            inGroup[tab] = true
        end
    end
    -- Height reference for the tabs the window pack does not own. It trims every Blizzard tab
    -- it takes over, re-chained or not; with the pack off nothing is trimmed and the row keeps
    -- the template height throughout.
    local metricsReference = packOwned and group[1] or nil

    local previous, groupSeated
    for _, entry in ipairs(ordered) do -- ordered walk, not next
        local button = entry.Button
        if button and button:IsShown() then
            if inGroup[button] then
                if not groupSeated then
                    groupSeated = true
                    SeatTab(group[1], previous, GetPixelSeam(group[1]))
                    previous = group[#group] -- the pack chains the rest onto group[1]
                end
            else
                MatchTabHeight(button, metricsReference)
                SeatTab(button, previous, GetPixelSeam(button))
                previous = button
            end
        end
    end

    relayoutingTabRow = nil
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
-- anchorRegion sizes the panel to the fill band rather than the whole frame.
local function GetProgressBarPanel(progressBar, anchorRegion)
    local panel = progressBarPanels[progressBar]
    if not panel then
        panel = CreateFrame("Frame", nil, progressBar)
        panel:SetFrameLevel(progressBar:GetFrameLevel())
        progressBarPanels[progressBar] = panel
    end
    panel:SetAllPoints(anchorRegion or progressBar)
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
        -- Fade the template's own rounded border; the panel supplies one.
        skin.FadeRegions(bar, fill and {[fill] = true} or nil)
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
    -- Lifted from Krowi's parchment values.
    local completed = button.DateCompleted and button.DateCompleted.IsShown and button.DateCompleted:IsShown()
    if button.accountWide then
        title:SetTextColor(completed and 0.45 or 0.42, completed and 0.8 or 0.66, completed and 1 or 0.85)
    elseif completed then
        title:SetTextColor(1, 0.85, 0.35)
    else
        title:SetTextColor(0.82, 0.74, 0.45)
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

    -- Saturate/Desaturate recolor the backdrop border on every Update; clear it.
    if button.SetBackdropBorderColor then
        button:SetBackdropColor(0, 0, 0, 0)
        button:SetBackdropBorderColor(0, 0, 0, 0)
    end

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

-- Sets the criteria fonts at fetch time, before Krowi measures each criterion's width and
-- row height. The DisplayCriteria post-hook runs too late for that.
local function InstallObjectivesFontHooks()
    local objectivesMixin = KrowiAF_AchievementsObjectivesMixin

    hooksecurefunc(objectivesMixin, "GetTextCriteria", function(self, index)
        local criteria = self.criteriaTable[index]
        if criteria then
            skin.Font(criteria.Label)
            skin.Font(criteria.Dash)
        end
    end)
    hooksecurefunc(objectivesMixin, "GetMeta", function(self, index)
        local meta = self.metaCriteriaTable[index]
        if meta then
            skin.Font(meta.Label)
        end
    end)
    hooksecurefunc(objectivesMixin, "GetProgressBar", function(self, index)
        local bar = self.progressBarTable[index]
        if bar then
            skin.Font(bar.Text or bar.text)
        end
    end)
end

local function SkinObjectives(objectives)
    if not (skin and objectives) then
        return
    end

    for _, criteria in next, objectives.criteriaTable or {} do
        skin.Font(criteria.Label)
        skin.Font(criteria.Dash)
        RecolorCriteriaText(criteria.Label)
        RecolorCriteriaText(criteria.Dash)
    end
    for _, meta in next, objectives.metaCriteriaTable or {} do
        skin.Font(meta.Label)
        RecolorCriteriaText(meta.Label)
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

    -- Anchored to Background, which Resize keeps on the fill band.
    skin.Panel(GetProgressBarPanel(statusBar, statusBar.Background), {inset = true})
    for _, key in next, progressBorderKeys do
        FadeTexture(statusBar[key])
    end
    FadeTexture(statusBar.Background)
    for _, fill in next, statusBar.Fill or {} do
        fill:SetTexture("Interface\\Buttons\\WHITE8x8")
        fill:SetAlpha(1)
    end

    -- Replaces Krowi's pure (0,1,0)/(1,0,0) with the house fill and a muted red, through our
    -- own tables; the caller's are shared constants (addon.Util.Colors).
    if statusBar.SetColors then
        InstallBarFillShim(statusBar)
        skin.ApplyBarFill(statusBar)
    end

    skin.Font(statusBar.TextLeft)
    skin.Font(statusBar.TextRight)
    skin.White(statusBar.TextLeft) -- GameFontNormal is gold
    skin.White(statusBar.TextRight)
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
    -- Keep Icon: S.Button fades unnamed regions.
    local button = KrowiAF_SearchBoxFrame.OptionsMenuButton
    if not button then
        return
    end
    skin.Button(button, {"Icon"})
    if button.Icon then
        button.Icon:SetAlpha(1)
    end
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
-- EllesmereUI's own window pack skins AchievementFrame.Header: art, fonts and plate.
local function SkinHeader()
    if not skin then
        return
    end

    skin.PageButton(KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton, "<")
    skin.PageButton(KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton, ">")
end

-- [[ Some Blizzard-owned layout fixes (EllesmereUI already skins AchievementFrame itself) ]]
local function ReskinBlizzard()
    if not AchievementFrameCategories then
        return
    end
    AchievementFrameCategories:SetPoint("TOPLEFT", AchievementFrame, 21, -26)

    -- Moves the dropdown onto the list on pre-HeaderDetails layouts only, matching the
    -- condition in AchievementFrameHeader.lua's AnchorHeader.
    if AchievementFrame.HeaderDetails or not AchievementFrameFilterDropdown then
        return
    end
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
    skin.White(button:GetFontString()) -- GameFontBlack
    button:SetSize(22, 22) -- 40x40 art tile once flattened
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
-- Clears a texture outright rather than alphaing it out: a toast fades in through an
-- animation that drives alpha every frame and overwrites a SetAlpha.
local function KillTexture(texture)
    if not texture then
        return
    end
    if texture.SetAtlas then
        texture:SetAtlas("")
    end
    if texture.SetTexture then
        texture:SetTexture("")
    end
    if texture.SetAlpha then
        texture:SetAlpha(0)
    end
end

local function SkinAlertFrameTemplate(frame)
    if not (skin and frame) then
        return
    end

    -- Backdrop before art, so a throw leaves the plate rather than floating text. S.Shell is
    -- the toast-shaped primitive (no top bar, the frame has no title row); S.Panel is the
    -- fallback and is known to throw inside its region walk on this AlertFrameTemplate-derived
    -- frame. Both pcall-isolated: this runs inside Blizzard's ShowAlert flow, once per toast.
    local ok = pcall(skin.Shell, frame, {noTopBar = true})
    if not ok then
        ok = pcall(skin.Panel, frame)
    end
    if not ok then
        return false -- no backdrop, so leave Blizzard's plate in place
    end

    KillTexture(frame.Background)
    KillTexture(frame.glow)
    KillTexture(frame.shine)
    if frame.Icon then
        KillTexture(frame.Icon.Overlay) -- AchievementToast ring; SquareIcon supplies the border
        if frame.Icon.Texture then
            skin.SquareIcon(frame.Icon.Texture, frame.Icon)
        end
    end

    skin.Font(frame.Name)
    skin.White(frame.Name)
    skin.Font(frame.Unlocked)
    skin.White(frame.Unlocked) -- GameFontBlack, unreadable on the shell
    return true -- reports that the frame rect is now the panel
end

-- [[ EventReminder side strip ]]
-- The side buttons inherit the alert toast templates (SideButton.xml), so they take the same
-- skin. A skinned button's frame rect is the panel and seats flush on a one-pixel seam; the
-- offsets below are for the unskinned art, which insets the plate inside the frame rect.
local function SkinSideButton(button, previous, anchor)
    local x, y, stack = 5, 6, 9 -- offsets for the unskinned toast art
    if SkinAlertFrameTemplate(button) then
        local seam = GetPixelSeam(button)
        x, y, stack = seam, 0, -seam
    end

    button:ClearAllPoints()
    if previous then
        button:SetPoint("TOPLEFT", previous, "BOTTOMLEFT", 0, stack)
    else
        button:SetPoint("TOPLEFT", anchor, "TOPRIGHT", x, y)
    end
end

local function SkinSideButtons()
    -- The strip can be anchored to the world map instead; SideButtonSystem owns that choice.
    local system = addon.Gui.EventReminderSideButtonSystem
    local anchor = system.GetAnchor and system:GetAnchor()
    if not anchor then
        return
    end

    local index = 1
    local button = _G["KrowiAF_AchievementFrameSideButton" .. index]
    local previous
    while button do
        -- Buttons are pooled by index and never destroyed, so hidden ones linger in _G.
        -- SideButtonSystem's SetPoints chains the shown ones only.
        if button:IsShown() then
            SkinSideButton(button, previous, anchor)
            previous = button
        end
        index = index + 1
        button = _G["KrowiAF_AchievementFrameSideButton" .. index]
    end
end

-- [[ AchievementPopout ]]
-- The button clone and its objectives ride the mixin hooks; corner chrome only.
local function SkinAchievementPopout(popout)
    if not (skin and popout) then
        return
    end
    skin.CloseButton(popout.CloseButton)
    if popout.ResizeButton then
        skin.Button(popout.ResizeButton)
    end
end

local function SkinAchievementPopouts()
    local popouts = addon.Gui.AchievementPopout and addon.Gui.AchievementPopout.OpenPopouts
    for _, popout in next, popouts or {} do
        SkinAchievementPopout(popout)
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
    RelayoutTabRow() -- re-seats the row in case the window pack has re-chained it
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
    SkinAchievementPopouts()
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

    -- Krowi retains control of visibility, ordering, spacing, sizing, selection, clicks,
    -- data, and saved variables. Every hook below runs after Krowi's own update and changes
    -- visual regions only; every primitive is idempotent. The tab row is the exception:
    -- RelayoutTabRow replaces Krowi's layout pass (see Tab row above).
    hooksecurefunc(addon.Gui.AchievementFrameTabButtonFactory, "GetNew", SkinKrowiTabs)
    hooksecurefunc(addon.Gui, "LoadWithBlizzard_AchievementUI", ApplyVisuals)
    -- Replaced rather than post-hooked, so Krowi's own pass never forms the circular anchor.
    -- SeatTab mirrors Gui.lua's UpdateTabsLayout; keep the two in step if it changes.
    addon.Gui.UpdateTabsLayout = RelayoutTabRow
    hooksecurefunc(KrowiAF_AchievementButtonMixin, "Update", SkinAchievementButton)
    -- The ScrollBox recycles pooled achievement buttons: a reused button is Shown again with
    -- new data, which is exactly when Blizzard's backdrop template creeps back in.
    hooksecurefunc(KrowiAF_AchievementButtonMixin, "OnShow", SkinAchievementButton)
    hooksecurefunc(KrowiAF_CategoryButtonMixin, "SetCategory", SkinCategoryButton)
    -- Before the DisplayCriteria hook: these set the font Krowi measures with.
    InstallObjectivesFontHooks()
    hooksecurefunc(KrowiAF_AchievementsObjectivesMixin, "DisplayCriteria", SkinObjectives)
    hooksecurefunc(Krowi_ProgressBarMixin, "UpdateTextures", function(statusBar)
        if KrowiAF_SummaryFrame and statusBar:GetParent() == KrowiAF_SummaryFrame then
            SkinSummaryStatusBar(statusBar)
        end
    end)
    -- Hooks the category-tooltip bar itself instead of the mixin table.
    local tooltipBar = GetTooltipProgressBar()
    if tooltipBar then
        hooksecurefunc(tooltipBar, "UpdateTextures", SkinSummaryStatusBar)
    end

    -- Blizzard's managed scroll bar visibility behavior re-asserts its own arrow/track
    -- textures whenever a list's data provider changes, undoing the fade; S.ScrollBar is
    -- documented idempotent, so simply re-run it on every refresh.
    hooksecurefunc(KrowiAF_AchievementsFrameMixin, "ForceUpdate", RefreshScrollBar)
    hooksecurefunc(KrowiAF_CategoriesFrameMixin, "Update", RefreshScrollBar)
    hooksecurefunc(KrowiAF_AchievementsFrameLightMixin, "Update", RefreshScrollBar)

    hooksecurefunc(addon.Gui.DataManager, "GetTextFrame", SkinTextFrame)

    -- Popouts are pooled and reused.
    if addon.Gui.AchievementPopout then
        hooksecurefunc(addon.Gui.AchievementPopout, "Open", function(self, achievement)
            SkinAchievementPopout(self.OpenPopouts[achievement and achievement.Id])
        end)
    end

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

    -- The tab row holds a one pixel seam throughout while the skin is on (see GetPixelSeam),
    -- so grey the slider out and give the reason above it. The note takes the order just below
    -- Spacing's own; AutoOrderPlusPlus is one counter shared by every options file and is long
    -- past Layout's numbers by the time a plugin injects.
    local spacing = KrowiAF_GetOptions.GetTable(appName, "args.Tabs.args.General.args.General.args.Spacing")
    spacing.disabled = true
    addon.InjectOptions:AddTable(KrowiAF_GetOptions.GetTable(appName, "args.Tabs.args.General.args.General.args"), "EllesmereUIComment", {
        order = spacing.order - 1, type = "description", width = "full",
        name = addon.L["Tab Spacing Overwrite Desc"]:K_ReplaceVars(addon.L["EllesmereUI"])
    })
end

function compatibility:Load()
    if not IsLoaded() then
        return
    end

    EllesmereUI.RegisterSkin("Krowi_AchievementFilter", function(S)
        -- EllesmereUI keeps third-party skinning independent of its per-window enables. Krowi
        -- builds on AchievementFrame itself -- the same border, header and Blizzard tabs the
        -- "achievements" window pack skins -- so this follows that window instead and leaves
        -- everything stock while it is off. Checked inside the callback rather than before
        -- RegisterSkin: it is dispatched at PLAYER_LOGIN, with EllesmereUI's saved variables in.
        if not AchievementWindowIsSkinned() then
            return
        end
        skin = S
        InstallHooks()
        ApplyVisuals()
        skin.OnLooksChanged(ApplyVisuals)
        DisableOptions()
    end)
end
