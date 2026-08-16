local _, addon = ...

-- Visual compatibility for EllesmereUI's Blizzard Achievement skin.
-- Krowi recreates Blizzard achievement tabs, rows, categories, summary bars,
-- and inset frames under Krowi-owned names. EllesmereUI's native window pack
-- cannot discover those copies, so this bridge applies only public skinning
-- primitives to the Krowi-owned equivalents as they are created or refreshed.

local compatibility = {}
KrowiAF.PluginsApi:RegisterPlugin("EllesmereUI", compatibility)

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

local function SkinFont(fontString, r, g, b)
    if not (skin and fontString) then
        return
    end
    skin.Font(fontString)
    if r then
        fontString:SetTextColor(r, g, b)
    else
        skin.White(fontString)
    end
end

local function SkinKrowiTabs()
    if not skin then
        return
    end

    local gui = addon.Gui
    local factory = gui and gui.AchievementFrameTabButtonFactory
    local tabs = factory and factory.GetTabs and factory:GetTabs()
    if not tabs then
        return
    end

    for _, tab in next, tabs do
        if tab then
            skin.Tab(tab)
        end
    end
end

local function SkinAchievementTitle(button)
    local title = button and button.Header
    if not title then
        return
    end

    skin.Font(title)
    local completed = button.DateCompleted and button.DateCompleted.IsShown
        and button.DateCompleted:IsShown()
    if button.accountWide then
        if completed then
            title:SetTextColor(0.35, 0.75, 1)
        else
            title:SetTextColor(0.24, 0.46, 0.6)
        end
    elseif completed then
        title:SetTextColor(1, 0.85, 0.35)
    else
        title:SetTextColor(0.64, 0.56, 0.3)
    end
end

local function SkinAchievementButton(button)
    if not (skin and button) then
        return
    end

    -- S.Button supplies the same flat plate, border, and hover treatment used
    -- elsewhere by EUI. Krowi repaints several stock textures on every Update,
    -- so reassert alpha on only those named art regions after each refresh.
    skin.Button(button)
    for _, key in next, achievementArtKeys do
        FadeTexture(button[key])
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

    SkinAchievementTitle(button)
    SkinFont(button.Description)
    SkinFont(button.HiddenDescription)
    SkinFont(button.DateCompleted)
    SkinFont(button.Shield and button.Shield.Points)
    if button.Reward then
        skin.Font(button.Reward)
    end
end

local function SkinCategoryButton(button)
    if not (skin and button) then
        return
    end

    skin.Button(button)
    SkinFont(button.Label)
end

local progressBarPanels = setmetatable({}, {__mode = "k"})

local function GetProgressBarPanel(progressBar)
    local panel = progressBarPanels[progressBar]
    if not panel then
        panel = CreateFrame("Frame", nil, progressBar)
        panel:SetAllPoints(progressBar)
        panel:SetFrameLevel(progressBar:GetFrameLevel())
        progressBarPanels[progressBar] = panel
    end
    return panel
end

local function SkinObjectiveProgressBar(bar)
    if not (skin and bar) then
        return
    end

    -- Keep the StatusBar fill outside Panel's periodic texture-restrip target.
    skin.Panel(GetProgressBarPanel(bar), {inset = true})
    if bar.SetStatusBarTexture then
        bar:SetStatusBarTexture("Interface\\Buttons\\WHITE8X8")
        local fill = bar:GetStatusBarTexture()
        if fill and fill.SetAlpha then
            fill:SetAlpha(1)
        end
        skin.ApplyBarFill(bar)
    end
    SkinFont(bar.Text or bar.text)
end

local function SkinObjectives(objectives)
    if not (skin and objectives) then
        return
    end

    for _, criteria in next, objectives.criteriaTable or {} do
        local completed = criteria.Check and criteria.Check.IsShown and criteria.Check:IsShown()
        local color = completed and 1 or 0.65
        SkinFont(criteria.Label, color, color, color)
        SkinFont(criteria.Dash, color, color, color)
    end
    for _, meta in next, objectives.metaCriteriaTable or {} do
        local completed = meta.Check and meta.Check.IsShown and meta.Check:IsShown()
        local color = completed and 1 or 0.65
        SkinFont(meta.Label, color, color, color)
    end
    for _, bar in next, objectives.progressBarTable or {} do
        SkinObjectiveProgressBar(bar)
    end
end

local function SkinSummaryStatusBar(statusBar)
    if not (skin and statusBar) then
        return
    end

    -- Krowi's summary bar is a custom Frame rather than a StatusBar. Paint the
    -- EUI panel on a visual-only child so EUI's periodic panel restrip cannot
    -- alpha-out Krowi's fill textures, which remain owned and sized by Krowi.
    skin.Panel(GetProgressBarPanel(statusBar), {inset = true})
    for _, key in next, progressBorderKeys do
        FadeTexture(statusBar[key])
    end
    FadeTexture(statusBar.Background)
    for _, fill in next, statusBar.Fill or {} do
        fill:SetTexture("Interface\\Buttons\\WHITE8X8")
        fill:SetAlpha(1)
    end
    SkinFont(statusBar.TextLeft)
    SkinFont(statusBar.TextRight)
    if statusBar.Button then
        skin.FadeRegions(statusBar.Button)
    end
end

local function GetTooltipProgressBar()
    local progressBarLib = addon.ProgressBarLib
    local tooltip = progressBarLib and progressBarLib.GameTooltipWithProgressBar
    return tooltip and tooltip.ProgressBar
end

local function ForEachRealizedRow(owner, callback)
    local scrollBox = owner and owner.ScrollBox
    if not scrollBox then
        return
    end

    if scrollBox.ForEachFrame then
        scrollBox:ForEachFrame(callback)
        return
    end

    local target = scrollBox.ScrollTarget
    if not (target and target.GetChildren) then
        return
    end
    for index = 1, select("#", target:GetChildren()) do
        callback(select(index, target:GetChildren()))
    end
end

local function FadeSummaryOuterBorder(summaryFrame)
    if not (skin and summaryFrame and summaryFrame.GetChildren) then
        return
    end

    -- This Krowi template's outer AchivementGoldBorderBackdrop is its only
    -- anonymous direct child. All content children and status bars are named.
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

    FadeTexture(achievements and achievements.Background)
    FadeTexture(summary and summary.Background)

    if achievements then
        skin.FadeRegions(achievements.Border)
        skin.ScrollBar(achievements.ScrollBar)
    end
    if categories then
        skin.FadeRegions(categories.Border)
        skin.ScrollBar(categories.ScrollBar)
    end
    if summary then
        FadeSummaryOuterBorder(summary)
        if summary.AchievementsFrame then
            skin.FadeRegions(summary.AchievementsFrame.Border)
            skin.ScrollBar(summary.AchievementsFrame.ScrollBar)
        end

        for _, section in next, {summary.Achievements, summary.Categories} do
            local header = section and section.Header
            if header then
                if header.Texture then
                    header.Texture:SetVertexColor(1, 1, 1, 0.25)
                end
                SkinFont(header.Title)
            end
        end

        for index = 1, select("#", summary:GetChildren()) do
            local child = select(index, summary:GetChildren())
            if child and child.Fill and child.TextLeft and child.TextRight then
                SkinSummaryStatusBar(child)
            end
        end
    end


    SkinSummaryStatusBar(GetTooltipProgressBar())
end

local function SkinRealizedRows()
    ForEachRealizedRow(KrowiAF_CategoriesFrame, SkinCategoryButton)
    ForEachRealizedRow(KrowiAF_AchievementsFrame, SkinAchievementButton)
    local summary = KrowiAF_SummaryFrame
    ForEachRealizedRow(summary and summary.AchievementsFrame, SkinAchievementButton)
end

local function ApplyVisuals()
    SkinKrowiTabs()
    SkinStaticFrames()
    SkinRealizedRows()
    SkinObjectives(KrowiAF_AchievementsObjectives)
end

local function InstallHooks()
    if hooksInstalled then
        return
    end
    hooksInstalled = true

    -- Krowi retains complete control of visibility, ordering, spacing,
    -- anchors, sizing, selection, clicks, data, and saved variables. Every
    -- hook below runs after Krowi's own update and changes visual regions only.
    hooksecurefunc(addon.Gui.AchievementFrameTabButtonFactory, "GetNew", SkinKrowiTabs)
    hooksecurefunc(addon.Gui, "LoadWithBlizzard_AchievementUI", ApplyVisuals)
    hooksecurefunc(KrowiAF_AchievementButtonMixin, "Update", SkinAchievementButton)
    hooksecurefunc(KrowiAF_CategoryButtonMixin, "SetCategory", SkinCategoryButton)
    hooksecurefunc(KrowiAF_AchievementsObjectivesMixin, "DisplayCriteria", SkinObjectives)
    hooksecurefunc(Krowi_ProgressBarMixin, "UpdateTextures", function(statusBar)
        local isSummaryBar = KrowiAF_SummaryFrame and statusBar:GetParent() == KrowiAF_SummaryFrame
        if isSummaryBar or statusBar == GetTooltipProgressBar() then
            SkinSummaryStatusBar(statusBar)
        end
    end)
end

function compatibility:Load()
    if not addon.Util.IsMainline or not (EllesmereUI and EllesmereUI.RegisterSkin) then
        return
    end

    EllesmereUI.RegisterSkin("Krowi_AchievementFilter", function(S)
        skin = S
        InstallHooks()
        ApplyVisuals()
        skin.OnLooksChanged(ApplyVisuals)
    end)
end
