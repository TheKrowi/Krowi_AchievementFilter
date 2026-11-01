local addonName, addon = ...

-- The help pane's pictures (docs/work/2026-10-25-options-revamp/plan-help.md), game only: /kaftest pictures builds each
-- picture's scene through the Show me scene of its section (addon.Options.Window.HelpScenes), so the run also proves
-- every Show me in game. Each step checks what the scene opened, records the screen rectangle to cut out and takes a
-- screenshot on black and one on pink once the game's own tooltip is off it, the /kevutest way
-- (Krowi_ExtendedVendorUI): a banner names the step, steps that need the mouse wait for the player, settings are put
-- back, and the addon's Lua errors of the session are reported from BugGrabber at the end.
-- The rectangles go to KrowiAF_DebugTable.Pictures (the last 5 runs); .claude/tools/Make-HelpPictures.ps1 pairs them
-- with the screenshots and writes Media/Help/*.tga and Options/Window/Help/Pictures.lua. The routine never sets a CVar.

local settle = 1.5 -- a scene -> its check and screenshot
local afterShot = 1.5 -- a screenshot -> the next step; files are named by the second, so steps stay 3 s apart
local mouseWait = 30 -- seconds a step that needs the player's mouse waits
local pollEvery = 0.25
local keepRuns = 5

local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner, backdrop, backdropColor, centre, pictureMenu
local steps, SetBanner, RunStep

local function Scenes()
    return addon.Options.Window and addon.Options.Window.HelpScenes
end

local function Add(status, text, step)
    step = step or live.StepName
    tinsert(live.Results, {
        Name = step,
        Status = status,
        GameOnly = true,
        Line = ("pictures/%s: %s %s"):format(step, status, text)
    })
end

local function After(seconds, func)
    local token = runToken
    C_Timer.After(seconds, function()
        if live and token == runToken then
            func()
        end
    end)
end

-- A cut-out is a frame, or a table {Frame = frame, Top = region, Bottom = region, MaxHeight = units}: Top and Bottom
-- keep the frame's sides and cut from one region's top to the other's bottom (the Earned By part of a tooltip);
-- MaxHeight keeps only the top of a tall frame, in UIParent units, so it still reads in the help pane
local function Edges(item)
    local frame, topRegion, bottomRegion, maxHeight = item, nil, nil, nil
    if type(item) == "table" and item.Frame then
        frame, topRegion, bottomRegion, maxHeight = item.Frame, item.Top, item.Bottom, item.MaxHeight
    end
    if not (frame and frame.IsVisible and frame:IsVisible() and frame:GetLeft()) then
        return
    end
    local scale = frame:GetEffectiveScale()
    local left, right, top, bottom = frame:GetLeft() * scale, frame:GetRight() * scale, frame:GetTop() * scale, frame:GetBottom() * scale
    if topRegion and topRegion:GetTop() then
        top = topRegion:GetTop() * topRegion:GetEffectiveScale() + 6
    end
    if bottomRegion and bottomRegion:GetBottom() then
        bottom = bottomRegion:GetBottom() * bottomRegion:GetEffectiveScale() - 6
    end
    if maxHeight then
        bottom = max(bottom, top - maxHeight * UIParent:GetEffectiveScale())
    end
    return left, right, top, bottom
end

local strataOrder = {"BACKGROUND", "LOW", "MEDIUM", "HIGH", "DIALOG", "FULLSCREEN", "FULLSCREEN_DIALOG", "TOOLTIP"}
local strataRank = {}
for rank, strata in ipairs(strataOrder) do
    strataRank[strata] = rank
end

-- The black backdrop goes right under the lowest of the frames a picture shows, so every other part of the interface
-- (bars, chat, the minimap, the tracker, other addons) is black around and behind them, also behind a translucent
-- frame. It never touches another frame: only the backdrop moves. Each picture's second shot has it pink.
local function PlaceBackdrop(frames)
    local lowestRank, lowestLevel
    for _, item in ipairs(frames) do
        local frame = type(item) == "table" and item.Frame or item
        if frame and frame.GetFrameStrata and frame:IsVisible() then
            local rank, level = strataRank[frame:GetFrameStrata()] or 3, frame:GetFrameLevel()
            if not lowestRank or rank < lowestRank or (rank == lowestRank and level < lowestLevel) then
                lowestRank, lowestLevel = rank, level
            end
        end
    end
    if not lowestRank then
        lowestRank, lowestLevel = 1, 1
    end
    if lowestLevel > 1 then
        backdrop:SetFrameStrata(strataOrder[lowestRank])
        backdrop:SetFrameLevel(lowestLevel - 1)
    else -- nothing fits under level 0 or 1 in that strata, so the top of the strata below
        backdrop:SetFrameStrata(strataOrder[max(1, lowestRank - 1)])
        backdrop:SetFrameLevel(9999)
    end
end

-- The union of the items in screen pixels from the top left, and its natural size in UIParent units. more: UIParent
-- units of what lies around them per side ({Top = 30}), so a side cut through the window fades out over the window
-- rather than over the frames the picture is about (Krowi, 2026-10-29). Inner is the union before more: the tool looks
-- along it whether the other sides are the frames' edge, or the window more took in counts as content beside them
local function Rectangle(items, more)
    local left, right, top, bottom
    for _, item in ipairs(items) do
        local l, r, t, b = Edges(item)
        if l then
            left, right = left and min(left, l) or l, right and max(right, r) or r
            top, bottom = top and max(top, t) or t, bottom and min(bottom, b) or b
        end
    end
    if not left then
        return
    end
    local _, screenHeight = GetPhysicalScreenSize()
    local pixels = screenHeight / 768 -- one unit at scale 1 is this many pixels: the UI is 768 units high
    local uiScale = UIParent:GetEffectiveScale()
    local inner = {
        Left = floor(left * pixels + 0.5),
        Right = floor(right * pixels + 0.5),
        Top = floor(screenHeight - top * pixels + 0.5),
        Bottom = floor(screenHeight - bottom * pixels + 0.5)
    }
    if more then
        left = max(0, left - (more.Left or 0) * uiScale)
        right = min(UIParent:GetRight() * uiScale, right + (more.Right or 0) * uiScale)
        top = min(UIParent:GetTop() * uiScale, top + (more.Top or 0) * uiScale)
        bottom = max(0, bottom - (more.Bottom or 0) * uiScale)
    end
    return {
        Left = floor(left * pixels + 0.5),
        Right = floor(right * pixels + 0.5),
        Top = floor(screenHeight - top * pixels + 0.5),
        Bottom = floor(screenHeight - bottom * pixels + 0.5),
        Width = floor((right - left) / uiScale + 0.5),
        Height = floor((top - bottom) / uiScale + 0.5),
        Inner = inner
    }
end

-- The game's own tooltip over a picture's cut (grown by 10 px): one the game shows while the mouse rests on a unit or
-- an action button behind the black (the 2026-10-25 21:28 run's Window). Read only: hiding GameTooltip from addon code
-- would run its OnHide tainted
local function GameTooltipOver(rectangle)
    if not GameTooltip:IsVisible() then
        return false
    end
    -- a unit tooltip with a restricted name can make its position secret (Retail): it counts as covering the picture
    -- until the mouse moves on
    local left, right, top, bottom = GameTooltip:GetLeft(), GameTooltip:GetRight(), GameTooltip:GetTop(), GameTooltip:GetBottom()
    local scale = GameTooltip:GetEffectiveScale()
    if issecretvalue and (issecretvalue(left) or issecretvalue(right) or issecretvalue(top) or issecretvalue(bottom) or issecretvalue(scale)) then
        return true
    end
    if not left then
        return false
    end
    local tip = Rectangle({GameTooltip})
    return tip ~= nil and tip.Left < rectangle.Right + 10 and tip.Right > rectangle.Left - 10 and tip.Top < rectangle.Bottom + 10
        and tip.Bottom > rectangle.Top - 10
end

local function TabButtons()
    local buttons = {}
    for _, tabs in next, addon.Gui.Tabs do
        for _, button in next, tabs do
            if type(button) == "table" and button.IsShown and button:IsShown() then
                tinsert(buttons, button)
            end
        end
    end
    return buttons
end

-- The menu a scene opened: Retail's menu manager's open menu, Mists' first drop-down list
local function OpenMenu()
    if addon.Util.IsModern then
        return Menu.GetManager():GetOpenMenu()
    end
    return DropDownList1 and DropDownList1:IsShown() and DropDownList1 or nil
end

local function CloseMenus()
    if addon.Util.IsModern then
        Menu.GetManager():CloseMenus()
    else
        CloseDropDownMenus()
    end
end

-- The event reminder buttons beside the window, out of a picture that lies over them (the guide panel, the centred
-- reward preview: the 2026-10-29 run). Hidden ones come back within a second, since the alert system's refresh shows
-- every button with an event again while the window is open (Gui/EventReminder/SideButtonSystem.lua), so they go
-- transparent instead; the next step's clean-up gives them their alpha back
local function FadeSideButtons()
    live.FadedSideButtons = live.FadedSideButtons or {}
    local i = 1
    while _G["KrowiAF_AchievementFrameSideButton" .. i] do
        local sideButton = _G["KrowiAF_AchievementFrameSideButton" .. i]
        if not live.FadedSideButtons[sideButton] then
            live.FadedSideButtons[sideButton] = sideButton:GetAlpha()
            sideButton:SetAlpha(0)
        end
        i = i + 1
    end
end

local function UnfadeSideButtons()
    for sideButton, alpha in next, live.FadedSideButtons or {} do
        sideButton:SetAlpha(alpha)
    end
    live.FadedSideButtons = nil
end

-- The first line of the tooltip's Earned By part (Gui/AchievementTooltip/BlizzardDefault.lua): "Earned by: ...", "Not
-- earned by: ...", or the account-wide line that replaces both
local function EarnedByLine()
    local starts = {ACHIEVEMENT_EARNED_BY:match("^(.-)%%s") or ACHIEVEMENT_EARNED_BY, addon.L["Not earned by:"]:match("^(.-)%%s") or addon.L["Not earned by:"],
        ACCOUNT_WIDE_ACHIEVEMENT_COMPLETED, ACCOUNT_WIDE_ACHIEVEMENT}
    for i = 1, Krowi_Tooltip:NumLines() do
        local line = _G["Krowi_TooltipTextLeft" .. i]
        local text = line and line:GetText() and addon.Util.Colors.RemoveColor(line:GetText())
        if text then
            for _, start in ipairs(starts) do
                if start ~= "" and text:find(start, 1, true) == 1 then
                    return line, i
                end
            end
        end
    end
end

-- The last line of the Earned By part: the line before the tooltip's next empty line, or its last line
local function EarnedByEnd()
    local _, first = EarnedByLine()
    if not first then
        return
    end
    local last = first
    for i = first + 1, Krowi_Tooltip:NumLines() do
        local text = _G["Krowi_TooltipTextLeft" .. i]:GetText()
        if not text or text == "" or text == " " then
            break
        end
        last = i
    end
    return _G["Krowi_TooltipTextLeft" .. last]
end

-- The rows of the header colours: an achievement per look, found among the achievements with a category
local function HeaderLook(achievement)
    local _, _, _, _, _, _, _, _, flags = GetAchievementInfo(achievement.Id)
    local state = achievement:GetObtainableState()
    if state == "Past" then
        return "Red"
    elseif state == "Current" then
        return "Green"
    elseif state == "Future" then
        return "Yellow"
    elseif flags and addon.Objects.Flags:New(flags).IsAccountWide then
        return "Blue"
    end
    return "Orange"
end

-- From the category with the most achievements: a list without a scroll bar is wider, so its row would stick out of
-- the picture (the Sunday's Finest row, 2026-10-29)
local function FindLook(look)
    local found, most = nil, 0
    for _, achievement in next, addon.Data.Achievements do
        local count = achievement.Category and achievement.Category.Achievements and #achievement.Category.Achievements or 0
        -- shown as itself: with Collapse Chain on the list shows a chain's next step instead when that one is completed
        if count > most and not achievement.IsTracking and not select(2, addon.GetNextAchievement(achievement))
            and HeaderLook(achievement) == look then
            found, most = achievement, count
        end
    end
    return found
end

-- Selects the achievement, then clears the selection, so its row shows collapsed and in its own colours
local function ShowRow(achievement)
    KrowiAF_SelectAchievement(achievement)
    KrowiAF_AchievementsFrame.SelectionBehavior:ClearSelections()
end

local function RowOf(achievement)
    return KrowiAF_AchievementsFrame.ScrollBox:FindFrame(achievement)
end

local function SceneStep(name, picture, scene, text, cut, check, more)
    return {
        Name = name,
        Picture = picture,
        Text = text,
        Run = function()
            Scenes()[scene](function(opened)
                live.Scene = opened
            end)
        end,
        Cut = cut,
        Check = check or function()
            return live.Scene ~= nil, "the scene did not open"
        end,
        More = more
    }
end

local function ColorStep(look, more)
    return {
        Name = "colors-" .. look:lower(),
        Picture = "Colors",
        Text = ("a row with the %s header"):format(look:lower()),
        More = more, -- the first row's top and the last row's bottom: the rows between them are stacked as they are
        Run = function()
            KrowiAF_SearchBoxFrame:SetText("") -- the list must show the category, not search results
            -- green, yellow and red headers and the blue warband one are options; on for these rows, back at the end.
            -- The player's own values wait in the saved variables, so a /reload mid-run still puts them back at login.
            if not live.HeaderColors then
                local achievements = addon.Options.db.profile.Achievements
                live.HeaderColors = {TemporarilyObtainableHeaderColors = achievements.TemporarilyObtainableHeaderColors,
                    WarbandHeaderColor = achievements.WarbandHeaderColor}
                KrowiAF_DebugTable.PicturesRestore = live.HeaderColors
                achievements.TemporarilyObtainableHeaderColors, achievements.WarbandHeaderColor = true, true
            end
            live.Look = FindLook(look)
            if not live.Look then
                return "no achievement with this look in the data"
            end
            ShowRow(live.Look)
        end,
        Cut = function()
            return {RowOf(live.Look)}
        end,
        Check = function()
            if not RowOf(live.Look) then
                return false, ("the row of %d is not on screen"):format(live.Look.Id)
            end
            return KrowiAF_AchievementsFrame.ScrollBar:IsShown(), ("the list of %d has no scroll bar, so its row is wider"):format(live.Look.Id)
        end
    }
end

steps = {
    SceneStep("tabs", "NewTabs", "tabs", "the tabs under the achievement window", TabButtons, nil, {Top = 40}),
    SceneStep("window", "Window", "window", "the achievement window", function()
        local items = TabButtons()
        tinsert(items, AchievementFrame)
        tinsert(items, AchievementFrame.Header)
        return items
    end),
    SceneStep("categories", "CategoryTree", "categories", "the category list at the current expansion", function()
        return {{Frame = KrowiAF_CategoriesFrame, MaxHeight = 360}}
    end, nil, {Top = 30, Right = 20}),
    SceneStep("summary", "Summary", "summary", "the summary: recent achievements and progress", function()
        return {KrowiAF_SummaryFrame}
    end),
    {
        Name = "compact",
        Picture = "CompactList",
        Text = "compact achievements",
        More = {Top = 30, Left = 30},
        Run = function()
            if not addon.Options.db.profile.Achievements.Compact then
                return "Compact Achievements is off; it needs a /reload, so turn it on and run the pictures again"
            end
            Scenes().achievements(function(opened)
                live.Scene = opened
            end)
        end,
        Cut = function()
            return {KrowiAF_AchievementsFrame}
        end,
        Check = function()
            return live.Scene ~= nil, "the scene did not open"
        end
    },
    ColorStep("Orange", {Top = 30}),
    ColorStep("Blue"),
    ColorStep("Green"),
    ColorStep("Yellow"),
    ColorStep("Red", {Bottom = 30}),
    SceneStep("filters", "FilterMenu", "filters", "the filter menu", function()
        return {{Frame = OpenMenu(), MaxHeight = 360}}
    end, function()
        return OpenMenu() ~= nil, "no menu is open"
    end),
    {
        Name = "search",
        Picture = "SearchBox",
        Text = "a search with its preview",
        More = {Left = 20, Top = 20, Right = 20, Bottom = 20},
        Run = function()
            CloseMenus()
            Scenes().search(function(opened)
                live.Scene = opened
            end)
            -- a word the client's own achievement names hold: the first of "Level 10" (6) in its language
            local name = select(2, GetAchievementInfo(6))
            KrowiAF_SearchBoxFrame:SetText(name and name:match("^(%S+)") or "Level")
        end,
        Cut = function()
            return {KrowiAF_SearchBoxFrame, KrowiAF_SearchPreviewContainer}
        end,
        Check = function()
            return KrowiAF_SearchPreviewContainer:IsShown(), "the search preview is not shown"
        end
    },
    SceneStep("tooltip", "TipAchievement", "tooltips", "an achievement's tooltip", function()
        return {{Frame = Krowi_Tooltip, MaxHeight = 420}}
    end, function()
        return Krowi_Tooltip:IsShown(), "the tooltip is not shown"
    end),
    {
        Name = "tooltip-earned-by",
        Picture = "TipEarnedBy",
        Text = "the Earned By part of the tooltip",
        Keep = true, -- the tooltip of the step before
        Needs = "tooltip",
        Run = function()
            if not Krowi_Tooltip:IsShown() then
                return "the tooltip of the step before is not shown"
            end
        end,
        Cut = function()
            return {{Frame = Krowi_Tooltip, Top = (EarnedByLine()), Bottom = EarnedByEnd()}}
        end,
        Check = function()
            return EarnedByLine() ~= nil, "the tooltip has no Earned By part"
        end
    },
    {
        Name = "category-tooltip",
        Picture = "TipCategory",
        Text = "a category's tooltip",
        Run = function()
            Krowi_Tooltip:Hide()
            Scenes().categories(function(opened)
                live.Scene = opened
            end)
        end,
        After = function()
            local button = live.Scene and KrowiAF_CategoriesFrame.ScrollBox:FindFrame(live.Scene.Category)
            if button then
                button:OnEnter()
            end
        end,
        Cut = function()
            return {Krowi_ProgressBarTooltip}
        end,
        Check = function()
            return Krowi_ProgressBarTooltip:IsShown(), "the category tooltip is not shown"
        end
    },
    {
        Name = "points-tooltip",
        Picture = "TipPoints",
        Text = "achievement points per character",
        Run = function()
            Krowi_ProgressBarTooltip:Hide()
            local button = KrowiAF_AchievementFrameHeaderButton
            button:GetScript("OnEnter")(button)
        end,
        Cut = function()
            return {{Frame = Krowi_Tooltip, MaxHeight = 260}}
        end,
        Check = function()
            return Krowi_Tooltip:IsShown(), "the points tooltip is not shown"
        end
    },
    -- The menu shows Go to with its arrow; its submenu is not taken: Retail's menu manager keeps its open menus where
    -- addon code cannot read them (the 2026-10-25 run found Menu.GetManager().menus nil)
    {
        Name = "menu",
        Picture = "MenuMain",
        Text = "the right-click menu",
        Run = function()
            Scenes().rightclick(function(opened)
                live.Scene = opened
            end)
        end,
        -- The scene's menu opens at the cursor, and at the screen's border the picture loses that side's edge (the
        -- 2026-10-29 runs: top left, right border), so it goes to the screen's centre. Retail moves the open menu, as
        -- Blizzard's menus let addon code (Blizzard_Menu/Menu.lua: a menu's proxy is a frame to pass to SetPoint);
        -- closing and opening it again would have the menu manager redraw the list under the cursor tainted twice more.
        -- Mists opens the same menu again, built by the same code, rather than move Blizzard's drop-down list
        After = function()
            local menu = OpenMenu()
            live.SceneMenu = menu ~= nil
            if not (menu and live.Scene) then
                return
            end
            if addon.Util.IsModern then
                menu:ClearAllPoints()
                menu:SetPoint("TOPLEFT", centre, "BOTTOMLEFT")
                return
            end
            CloseMenus()
            pictureMenu = pictureMenu or addon.MenuBuilder:New({modern = addon.Util.IsModern})
            pictureMenu:ShowPopup(function(builder)
                addon.Gui.RightClickMenu.AchievementMenu:CreateMenu(builder:GetMenu(), live.Scene.Achievement, live.Scene.Row)
            end, centre)
        end,
        Cut = function()
            return {OpenMenu()}
        end,
        Check = function()
            return live.SceneMenu and OpenMenu() ~= nil, "no menu is open"
        end
    },
    {
        Name = "popout",
        Picture = "PopOut",
        Text = "an achievement popped out",
        Run = function()
            CloseMenus()
            live.PopoutsBefore = {}
            for id in next, addon.Gui.AchievementPopout.OpenPopouts do
                live.PopoutsBefore[id] = true
            end
            Scenes().popout(function(opened)
                live.Scene = opened
            end)
        end,
        -- With Fade when not hovered on (the player's profile) the pop-out is see-through while the mouse is off it,
        -- which the pink shot shows: the picture has it as when hovered. The mouse's next enter or leave fades it again
        -- (Gui/AchievementPopout/AchievementPopoutMixin.lua UpdateChrome)
        After = function()
            local popout = live.Scene and live.Scene.Popout
            if popout then
                popout.FadeAnimGroup:Stop()
                popout:SetAlpha(1)
            end
        end,
        Cut = function()
            return {live.Scene and live.Scene.Popout}
        end
    },
    {
        Name = "reward-preview",
        Picture = "RewardPreview",
        Text = "the reward preview of a mount",
        Run = function()
            Scenes().rewards(function(opened)
                live.Scene = opened
            end)
        end,
        -- Next to its row the preview ran off the bottom of the screen (the 2026-10-29 run), and at the screen's centre it
        -- lay over the window on a 2560 px wide screen (2026-10-30): the addon's own frame goes beside the window, left
        -- of it when the window sits too far right for it to fit, and its next open anchors it to its row again
        -- (Gui/SidePanels.lua AnchorSidePanel)
        After = function()
            local preview, window = KrowiAF_RewardPreview, AchievementFrame
            if preview:IsShown() then
                local fitsRight = window:GetRight() * window:GetEffectiveScale() + (40 + preview:GetWidth()) * preview:GetEffectiveScale()
                    <= UIParent:GetRight() * UIParent:GetEffectiveScale()
                preview:ClearAllPoints()
                if fitsRight then
                    preview:SetPoint("LEFT", window, "RIGHT", 40, 0)
                else
                    preview:SetPoint("RIGHT", window, "LEFT", -40, 0)
                end
            end
            FadeSideButtons()
        end,
        Cut = function()
            return {KrowiAF_RewardPreview}
        end,
        Check = function()
            return KrowiAF_RewardPreview:IsShown(), "the reward preview is not shown"
        end
    },
    addon.Util.IsMainline and SceneStep("guide", "GuidePanel", "guides", "the guide of Legendary Research of the Ebon Blade", function()
        FadeSideButtons() -- they show through the panel
        return {KrowiAF_GuidePanel}
    end, function()
        return KrowiAF_GuidePanel ~= nil and KrowiAF_GuidePanel:IsShown(), "the guide panel is not shown"
    end, {Left = 30}) or nil,
    {
        Name = "calendar",
        Picture = "CalendarDays",
        Text = "the achievement calendar",
        Run = function()
            AchievementFrame:Hide() -- the calendar is a window of its own; the achievement window would show at its corners
            Scenes().calendar(function(opened)
                live.Scene = opened
            end)
        end,
        Cut = function()
            return {KrowiAF_AchievementCalendarFrame, KrowiAF_AchievementCalendarFrame.SideFrame}
        end,
        Check = function()
            return KrowiAF_AchievementCalendarFrame:IsShown(), "the calendar is not shown"
        end
    },
    {
        Name = "reminders",
        Picture = "Reminders",
        Text = "placeholder event reminders",
        Run = function()
            KrowiAF_AchievementCalendarFrame:Hide()
            AchievementFrame:Hide()
            Scenes().events(function(opened)
                live.Scene = opened
            end)
        end,
        Cut = function()
            local frames = {}
            for _, frame in addon.Gui.EventReminderAlertSystem:EnumerateAlerts() do
                if frame:GetTop() then
                    tinsert(frames, frame)
                end
            end
            -- three in a row tell what a reminder looks like; the stack of every active and placeholder one is too tall
            sort(frames, function(a, b) return a:GetTop() > b:GetTop() end)
            while #frames > 3 do
                tremove(frames)
            end
            return frames
        end,
        Check = function()
            return live.Scene ~= nil and live.Scene.Shown > 0, "no placeholder reminder was shown"
        end
    },
    {
        Name = "map-button",
        Picture = "MapButton",
        Text = "last step: press M and hover the addon's achievement button on the map (30 s)",
        More = {Top = 30, Left = 30},
        Mouse = function()
            local button = addon.Gui.WorldMapButton
            return WorldMapFrame:IsShown() and type(button) == "table" and button:IsMouseOver()
                and (Krowi_ProgressBarTooltip:IsShown() or Krowi_Tooltip:IsShown())
        end,
        Cut = function()
            return {addon.Gui.WorldMapButton, Krowi_ProgressBarTooltip:IsShown() and Krowi_ProgressBarTooltip or Krowi_Tooltip}
        end,
        Floor = function() -- the map stays visible under its button; only what lies under the map goes black
            return {WorldMapFrame}
        end,
        Check = function()
            return WorldMapFrame:IsShown(), "the map is not open"
        end
    }
}
-- A client's missing step (the guide on Classic) leaves a nil in the list
for i = #steps, 1, -1 do
    if not steps[i] then
        tremove(steps, i)
    end
end
for i, step in ipairs(steps) do
    step.Number = i
end

-- /kaftest pictures <what>: only the steps of one picture (its name, any case: colors) or one step (its number or
-- name), each with the step it builds on; nil for all of them
local function SelectSteps(what)
    if not what then
        return steps
    end
    local wanted, number = what:lower(), tonumber(what)
    local byName, chosen, added = {}, {}, {}
    for _, step in ipairs(steps) do
        byName[step.Name] = step
    end
    local function AddStep(step)
        if step and not added[step] then
            added[step] = true
            tinsert(chosen, step)
        end
    end
    -- a picture made of several steps (the colour rows) is redone whole: the tool builds it from its newest run's parts
    local pictures = {}
    for _, step in ipairs(steps) do
        if step.Number == number or step.Name == wanted or step.Picture:lower() == wanted then
            pictures[step.Picture] = true
        end
    end
    for _, step in ipairs(steps) do
        if pictures[step.Picture] then
            AddStep(byName[step.Needs])
            AddStep(step)
        end
    end
    return #chosen > 0 and chosen or nil
end

function SetBanner(text)
    local step = live.Steps[live.StepIndex]
    banner.Text:SetText(("Krowi's Achievement Filter pictures %d/%d: %s"):format(step and step.Number or live.StepIndex, #steps, text))
end

-- The header colour options the colour rows switched on, back to the player's own values: at the end of the run, or at
-- the next login when a /reload cut the run short
local function RestoreHeaderColors()
    local saved = KrowiAF_DebugTable and KrowiAF_DebugTable.PicturesRestore
    if not saved then
        return
    end
    local achievements = addon.Options.db.profile.Achievements
    for option, value in next, saved do
        achievements[option] = value
    end
    KrowiAF_DebugTable.PicturesRestore = nil
    if KrowiAF_SummaryFrame then
        KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow() -- as the options' own setters do (Options/Layout.lua)
    end
    if KrowiAF_AchievementsFrame and KrowiAF_AchievementsFrame:IsShown() then
        KrowiAF_AchievementsFrame:ForceUpdate()
    end
end

local restoreAtLogin = CreateFrame("Frame")
restoreAtLogin:RegisterEvent("PLAYER_LOGIN")
restoreAtLogin:SetScript("OnEvent", function(self)
    self:UnregisterAllEvents()
    RestoreHeaderColors()
end)

-- The run goes into the saved variables when it starts and each picture is added to it as it is taken, so a /reload
-- in the middle of a run keeps what it took
local function SaveRun()
    KrowiAF_DebugTable = KrowiAF_DebugTable or {}
    KrowiAF_DebugTable.Pictures = KrowiAF_DebugTable.Pictures or {}
    local runs = KrowiAF_DebugTable.Pictures
    tinsert(runs, live.Run)
    while #runs > keepRuns do
        tremove(runs, 1)
    end
end

local function Restore()
    UnfadeSideButtons()
    CloseMenus()
    Krowi_Tooltip:Hide()
    Krowi_ProgressBarTooltip:Hide()
    if KrowiAF_SearchBoxFrame then
        KrowiAF_SearchBoxFrame:SetText("")
        KrowiAF_SearchBoxFrame:ClearFocus()
    end
    addon.Gui.RewardPreview:Close()
    if addon.Util.IsMainline then
        addon.Gui.Guide.Panel:Close()
    end
    if KrowiAF_AchievementCalendarFrame then
        KrowiAF_AchievementCalendarFrame:Hide()
    end
    for id in next, addon.Gui.AchievementPopout.OpenPopouts do
        if live.PopoutsBefore and not live.PopoutsBefore[id] then
            addon.Gui.AchievementPopout:Close(id)
        end
    end
    if not live.WindowWasShown and AchievementFrame then
        AchievementFrame:Hide()
    end
    if live.DebugEnabled then
        addon.Diagnostics.DebugEnabled = live.DebugEnabled
    end
    RestoreHeaderColors()
end

-- What an earlier step left open, so it does not show through this step's picture
local function Cleanup()
    UnfadeSideButtons()
    CloseMenus()
    Krowi_Tooltip:Hide()
    Krowi_ProgressBarTooltip:Hide()
    addon.Gui.RewardPreview:Close()
    if addon.Util.IsMainline then
        addon.Gui.Guide.Panel:Close()
    end
end

-- This addon's Lua errors in this session, also from before the run, as BugGrabber caught them
local function CheckErrors()
    if not (BugGrabber and type(BugGrabber.GetDB) == "function" and type(BugGrabber.GetSessionId) == "function") then
        tinsert(live.Observations, "no BugGrabber, so Lua errors are not checked")
        return
    end
    local session = BugGrabber:GetSessionId()
    local found = 0
    for _, err in ipairs(BugGrabber:GetDB()) do
        if err.session == session and ((type(err.message) == "string" and err.message:find(addonName, 1, true))
            or (type(err.stack) == "string" and err.stack:find(addonName, 1, true))) then
            found = found + 1
            Add("FAIL", ("Lua error x%d: %s"):format(err.counter or 1, tostring(err.message):sub(1, 300)), "lua-errors")
        end
    end
    if found == 0 then
        Add("PASS", "no Lua error from this addon this session (BugGrabber)", "lua-errors")
    end
end

local function Finish()
    runToken = runToken + 1
    banner:UnregisterAllEvents()
    banner:Hide()
    backdrop:Hide()
    local ok, err = pcall(Restore)
    if not ok then
        Add("FAIL", "could not put things back: " .. tostring(err), "restore")
    end
    live.Run.Finished = true
    local checked, checkErr = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(checkErr), "lua-errors")
    end
    tinsert(live.Observations, ("%d pictures recorded; run .claude/tools/Make-HelpPictures.ps1 after the next /reload"):format(#live.Run.Shots))
    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
end

-- The screenshot, once the game's tooltip is off the cut: the banner asks the player to move the mouse, and after
-- mouseWait the step fails without a picture, so the tool keeps an earlier run's
local function Shoot(step, items, rectangle, waited)
    local checked, over = pcall(GameTooltipOver, rectangle)
    if checked and over then
        if waited >= mouseWait then
            SetBanner(step.Text)
            Add("FAIL", ("the game's tooltip stayed over the picture for %d s; move the mouse off units and buttons and redo it with /kaftest pictures %s"):format(
                mouseWait, step.Picture:lower()))
            After(afterShot, function()
                RunStep(live.StepIndex + 1)
            end)
            return
        end
        SetBanner(step.Text .. ": move the mouse, the game's tooltip covers the picture")
        After(pollEvery, function()
            Shoot(step, items, rectangle, waited + pollEvery)
        end)
        return
    end
    if not checked then
        tinsert(live.Observations, ("%s: tooltip check failed: %s"):format(step.Name, tostring(over)))
    end
    if waited > 0 then
        SetBanner(step.Text)
        -- the mouse moved during the wait: the scene's check, the step's mouse (the map button's hover) and its cut
        -- again, as they are now. Not the step's Cut, which can change frames again (the guide step fades the side
        -- buttons)
        local checkOk, passed, reason = pcall(step.Check or function() return true end)
        local mouseOk, onIt = pcall(step.Mouse or function() return true end)
        local cutOk, now = pcall(Rectangle, items, step.More)
        local problem = not checkOk and tostring(passed) or not passed and (reason or "the check failed")
            or not mouseOk and tostring(onIt) or not onIt and "the mouse left what the step needs it on"
            or not cutOk and tostring(now) or not now and "nothing on screen to cut out"
        if problem then
            Add("FAIL", "after the wait for the tooltip: " .. problem)
            After(afterShot, function()
                RunStep(live.StepIndex + 1)
            end)
            return
        end
        rectangle = now
    end
    -- black under the picture's frames first, then the screenshot a few frames later
    local floorOk, floorErr = pcall(PlaceBackdrop, step.Floor and step.Floor() or items)
    if not floorOk then
        tinsert(live.Observations, ("%s: backdrop not placed: %s"):format(step.Name, tostring(floorErr)))
    end
    After(0.2, function()
        -- a tooltip the game showed in the meantime: the backdrop drops back, so the banner shows over it, and the
        -- step waits again
        local stillOk, coveredNow = pcall(GameTooltipOver, rectangle)
        if stillOk and coveredNow then
            backdrop:SetFrameStrata("BACKGROUND")
            backdrop:SetFrameLevel(0)
            Shoot(step, items, rectangle, waited)
            return
        end
        local shotTime = date("%Y-%m-%d %H:%M:%S")
        rectangle.Name, rectangle.Time = step.Picture, shotTime
        tinsert(live.Run.Shots, rectangle)
        Add("PASS", ("%s: %dx%d units, cut at %d,%d-%d,%d px"):format(step.Picture, rectangle.Width, rectangle.Height,
            rectangle.Left, rectangle.Top, rectangle.Right, rectangle.Bottom))
        live.Results[#live.Results].Screenshot = {Time = shotTime}
        live.Shot = live.Results[#live.Results].Screenshot
        Screenshot()
        -- the same on pink, 3 s later so its file has a second of its own: from the two the tool works out how
        -- see-through each pixel is, a tooltip's background and a menu's shadow too
        -- (docs/work/2026-11-01-help-pictures-transparent)
        After(afterShot, function()
            backdropColor:SetColorTexture(1, 0, 1, 1)
        end)
        After(afterShot * 2, function()
            local pinkOk, coveredPink = pcall(GameTooltipOver, rectangle)
            if pinkOk and not coveredPink then
                rectangle.PinkTime = date("%Y-%m-%d %H:%M:%S")
                live.Shot = {Time = rectangle.PinkTime}
                Screenshot()
            else
                tinsert(live.Observations, ("%s: no pink shot, the game's tooltip came over the picture; redo it with /kaftest pictures %s"):format(
                    step.Name, step.Picture:lower()))
            end
            After(afterShot, function()
                backdropColor:SetColorTexture(0, 0, 0, 1)
                RunStep(live.StepIndex + 1)
            end)
        end)
    end)
end

local function Capture()
    local step = live.Steps[live.StepIndex]
    local ok, passed, reason = pcall(step.Check or function() return true end)
    if not ok then
        Add("FAIL", "test error: " .. tostring(passed))
    elseif not passed then
        Add("FAIL", reason or "the check failed")
    else
        local cutOk, items = pcall(step.Cut)
        local rectangle
        if cutOk and items then
            cutOk, rectangle = pcall(Rectangle, items, step.More)
            if not cutOk then
                items, rectangle = rectangle, nil -- the error, for the line below
            end
        end
        if not rectangle then
            Add("FAIL", "nothing on screen to cut out" .. (cutOk and "" or (": " .. tostring(items))))
        else
            Shoot(step, items, rectangle, 0)
            return
        end
    end
    After(afterShot, function()
        RunStep(live.StepIndex + 1)
    end)
end

local function WaitForMouse(step, waited)
    if step.Mouse() then
        After(settle, Capture)
        return
    end
    if waited >= mouseWait then
        Add("SKIP", ("waited %d s for the mouse: %s"):format(mouseWait, step.Text))
        if step.Probe then
            local ok, seen = pcall(step.Probe)
            tinsert(live.Observations, ("%s: %s"):format(step.Name, ok and tostring(seen) or ("probe error: " .. tostring(seen))))
        end
        After(afterShot, function()
            RunStep(live.StepIndex + 1)
        end)
        return
    end
    After(pollEvery, function()
        WaitForMouse(step, waited + pollEvery)
    end)
end

RunStep = function(n)
    local step = live.Steps[n]
    if not step then
        Finish()
        return
    end
    live.StepIndex, live.StepName, live.Scene = n, step.Name, nil
    SetBanner(step.Text)
    -- the backdrop drops back under everything until this step's screenshot, or it would cover what the player opens
    -- (the map of the last step)
    backdrop:SetFrameStrata("BACKGROUND")
    backdrop:SetFrameLevel(0)
    if not step.Keep then
        local cleaned, cleanErr = pcall(Cleanup)
        if not cleaned then
            tinsert(live.Observations, ("%s: clean-up failed: %s"):format(step.Name, tostring(cleanErr)))
        end
    end
    if step.Run then
        local ok, skip = pcall(step.Run)
        if not ok then
            Add("FAIL", "test error: " .. tostring(skip))
            After(afterShot, function()
                RunStep(n + 1)
            end)
            return
        end
        if skip then
            Add("SKIP", skip)
            After(0.1, function()
                RunStep(n + 1)
            end)
            return
        end
    end
    if step.After then
        After(settle / 2, function()
            local ok, err = pcall(step.After)
            if not ok then
                Add("FAIL", "test error: " .. tostring(err))
            end
        end)
    end
    if step.Mouse then
        WaitForMouse(step, 0)
    else
        After(settle, Capture)
    end
end

local function CreateFrames()
    backdrop = CreateFrame("Frame", nil, UIParent)
    backdrop:SetFrameStrata("BACKGROUND")
    backdrop:SetAllPoints()
    backdropColor = backdrop:CreateTexture(nil, "BACKGROUND")
    backdropColor:SetAllPoints()
    backdropColor:SetColorTexture(0, 0, 0, 1)
    backdrop:Hide()

    -- where the menu is taken, away from the screen's borders
    centre = CreateFrame("Frame", nil, UIParent)
    centre:SetSize(1, 1)
    centre:SetPoint("CENTER")

    banner = CreateFrame("Frame", nil, UIParent)
    banner:SetFrameStrata("DIALOG")
    banner:SetSize(720, 26)
    banner:SetPoint("TOP", UIParent, "TOP", 0, -4)
    local background = banner:CreateTexture(nil, "BACKGROUND")
    background:SetAllPoints()
    background:SetColorTexture(0, 0, 0, 0.85)
    banner.Text = banner:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    banner.Text:SetPoint("CENTER")
    banner:SetScript("OnEvent", function(_, event)
        if not live then
            return
        end
        if event == "SCREENSHOT_FAILED" and live.Shot then
            live.Shot.Failed = true
        elseif event == "PLAYER_REGEN_DISABLED" then
            tinsert(live.Observations, "stopped: combat started")
            Finish()
        end
    end)
    banner:Hide()
end

addon.Tests.Ready.pictures = function()
    if live then
        return false, "the previous pictures run is still going"
    end
    if not addon.Data.IsLoaded then
        return false, "the achievement data is not loaded yet"
    end
    if not Scenes() then
        return false, "the help scenes are not loaded"
    end
    -- the run closes only the menus it opens: closing one of Blizzard's from addon code would release its frames tainted
    if addon.Util.IsModern and Menu.GetManager():IsAnyMenuOpen() or not addon.Util.IsModern and DropDownList1 and DropDownList1:IsShown() then
        return false, "close the open menu first"
    end
    return true
end

addon.Tests.Async.pictures = true
addon.Tests.Suites.pictures = function(done, what)
    local chosen = SelectSteps(what)
    if not chosen then
        local names = {}
        for _, step in ipairs(steps) do
            tinsert(names, ("%d %s"):format(step.Number, step.Picture))
        end
        done({{Name = "select", Status = "SKIP", GameOnly = true,
            Line = ("pictures/select: SKIP no picture or step '%s'; one of: %s"):format(what, table.concat(names, ", "))}}, {})
        return
    end
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
    local screenWidth, screenHeight = GetPhysicalScreenSize()
    live = {
        Steps = chosen,
        Results = {},
        Observations = {},
        Finish = done,
        WindowWasShown = AchievementFrame:IsShown(),
        Run = {
            Time = date("%Y-%m-%d %H:%M:%S"),
            Build = (GetBuildInfo()),
            Client = addon.Util.IsMainline and "Retail" or "Classic",
            Screen = {Width = screenWidth, Height = screenHeight},
            UIScale = UIParent:GetEffectiveScale(),
            Shots = {}
        }
    }
    local format, quality = C_CVar.GetCVar("screenshotFormat"), tonumber(C_CVar.GetCVar("screenshotQuality"))
    tinsert(live.Observations, ("screenshots: %s, quality %s"):format(tostring(format), tostring(quality)))
    -- debug mode adds its own lines to the tooltips: off while the pictures are taken, in memory only, so a /reload
    -- mid-run cannot leave the saved option changed
    live.DebugEnabled = addon.Diagnostics.DebugEnabled
    addon.Diagnostics.DebugEnabled = function()
        return false
    end
    if format == "jpg" and quality and quality < 8 then
        tinsert(live.Observations, "jpg quality below 8 blurs small text: type /console screenshotQuality 10 in game and run the pictures again")
    end
    if not banner then
        CreateFrames()
    end
    -- The options window stays out of the scenes, on whichever addon's tab it is open; an open menu was refused by the
    -- Ready check
    local optionsWindow = KROWI_LIBMAN:GetLibrary("Krowi_Options_1").Frame
    if optionsWindow and optionsWindow:IsShown() then
        optionsWindow:Hide()
    end
    backdropColor:SetColorTexture(0, 0, 0, 1) -- a run stopped during a pink shot left it pink
    backdrop:Show()
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    banner:Show()
    SaveRun()
    local waits = live.Steps[#live.Steps].Mouse and (" The last one waits up to %d s for you: press M and hover the addon's button on the map."):format(mouseWait) or ""
    print(("|cFF88CCFFKrowiAF Tests:|r pictures: %d steps, about %d s.%s /reload after the summary line. /kaftest pictures <name or number> redoes one."):format(
        #live.Steps, #live.Steps * 3, waits))
    RunStep(1)
end