local addonName, addon = ...

-- The help pane's pictures (docs/work/2026-10-25-options-revamp/plan-help.md), game only: /kaftest pictures builds each
-- picture's scene through the Show me scene of its section (addon.Options.Window.HelpScenes), so the run also proves
-- every Show me in game. Each step checks what the scene opened, records the screen rectangle to cut out and takes a
-- screenshot, the /kevutest way (Krowi_ExtendedVendorUI): a banner names the step, steps that need the mouse wait for
-- the player, settings are put back, and the addon's Lua errors of the session are reported from BugGrabber at the end.
-- The rectangles go to KrowiAF_DebugTable.Pictures (the last 5 runs); .claude/tools/Make-HelpPictures.ps1 pairs them
-- with the screenshots and writes Media/Help/*.tga and Options/Window/Help/Pictures.lua. The routine never sets a CVar.

local settle = 1.5 -- a scene -> its check and screenshot
local afterShot = 1.5 -- a screenshot -> the next step; files are named by the second, so steps stay 3 s apart
local mouseWait = 30 -- seconds a step that needs the player's mouse waits
local pollEvery = 0.25
local keepRuns = 5

local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner, backdrop
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

-- A cut-out is a frame, or a table {Frame = frame, Top = region} that keeps the frame's sides and bottom and starts at
-- region's top: the Earned By part of a tooltip
local function Edges(item)
    local frame, topRegion = item, nil
    if type(item) == "table" and item.Frame then
        frame, topRegion = item.Frame, item.Top
    end
    if not (frame and frame.IsVisible and frame:IsVisible() and frame:GetLeft()) then
        return
    end
    local scale = frame:GetEffectiveScale()
    local left, right, top, bottom = frame:GetLeft() * scale, frame:GetRight() * scale, frame:GetTop() * scale, frame:GetBottom() * scale
    if topRegion and topRegion:GetTop() then
        top = topRegion:GetTop() * topRegion:GetEffectiveScale() + 4
    end
    return left, right, top, bottom
end

-- The union of the items in screen pixels from the top left, and its natural size in UIParent units
local function Rectangle(items)
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
    return {
        Left = floor(left * pixels + 0.5),
        Right = floor(right * pixels + 0.5),
        Top = floor(screenHeight - top * pixels + 0.5),
        Bottom = floor(screenHeight - bottom * pixels + 0.5),
        Width = floor((right - left) / uiScale + 0.5),
        Height = floor((top - bottom) / uiScale + 0.5)
    }
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

local function OpenMenu(level)
    if addon.Util.IsModern then
        local manager = Menu.GetManager()
        if level == 1 then
            return manager:GetOpenMenu()
        end
        -- the manager's stack of open menus (Blizzard_Menu/Menu.lua MenuManagerMixin); level 2 is the submenu the mouse opened
        local ok, menu = pcall(function() return manager.menus:GetValue(level) end)
        return ok and menu or nil
    end
    local list = _G["DropDownList" .. level]
    return list and list:IsShown() and list or nil
end

local function CloseMenus()
    if addon.Util.IsModern then
        Menu.GetManager():CloseMenus()
    else
        CloseDropDownMenus()
    end
end

-- The Earned By header of the achievement tooltip, to cut its part out
local function EarnedByLine()
    local header = addon.L["Earned By"]
    for i = 1, Krowi_Tooltip:NumLines() do
        local line = _G["Krowi_TooltipTextLeft" .. i]
        local text = line and line:GetText()
        if text and addon.Util.Colors.RemoveColor(text):find(header, 1, true) == 1 then
            return line
        end
    end
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

local function FindLook(look)
    for _, achievement in next, addon.Data.Achievements do
        if achievement.Category and not achievement.IsTracking and HeaderLook(achievement) == look then
            return achievement
        end
    end
end

-- Selects the achievement, then clears the selection, so its row shows collapsed and in its own colours
local function ShowRow(achievement)
    KrowiAF_SelectAchievement(achievement)
    KrowiAF_AchievementsFrame.SelectionBehavior:ClearSelections()
end

local function RowOf(achievement)
    return KrowiAF_AchievementsFrame.ScrollBox:FindFrame(achievement)
end

local function SceneStep(name, picture, scene, text, cut, check)
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
        end
    }
end

local function ColorStep(look)
    return {
        Name = "colors-" .. look:lower(),
        Picture = "Colors",
        Text = ("a row with the %s header"):format(look:lower()),
        Run = function()
            KrowiAF_SearchBoxFrame:SetText("") -- the list must show the category, not search results
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
            return RowOf(live.Look) ~= nil, ("the row of %d is not on screen"):format(live.Look.Id)
        end
    }
end

steps = {
    SceneStep("tabs", "NewTabs", "tabs", "the tabs under the achievement window", TabButtons),
    SceneStep("window", "Window", "window", "the achievement window", function()
        local items = TabButtons()
        tinsert(items, AchievementFrame)
        tinsert(items, AchievementFrame.Header)
        return items
    end),
    SceneStep("categories", "CategoryTree", "categories", "the category list at the current expansion", function()
        return {KrowiAF_CategoriesFrame}
    end),
    SceneStep("summary", "SummaryBars", "summary", "the summary's progress bars", function()
        return {KrowiAF_SummaryFrame.Categories}
    end),
    {
        Name = "compact",
        Picture = "CompactList",
        Text = "compact achievements",
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
    ColorStep("Orange"),
    ColorStep("Blue"),
    ColorStep("Green"),
    ColorStep("Yellow"),
    ColorStep("Red"),
    SceneStep("filters", "FilterMenu", "filters", "the filter menu", function()
        return {OpenMenu(1)}
    end, function()
        return OpenMenu(1) ~= nil, "no menu is open"
    end),
    {
        Name = "search",
        Picture = "SearchBox",
        Text = "a search with its preview",
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
        return {Krowi_Tooltip}
    end, function()
        return Krowi_Tooltip:IsShown(), "the tooltip is not shown"
    end),
    {
        Name = "tooltip-earned-by",
        Picture = "TipEarnedBy",
        Text = "the Earned By part of the tooltip",
        Run = function()
            if not Krowi_Tooltip:IsShown() then
                return "the tooltip of the step before is not shown"
            end
        end,
        Cut = function()
            return {{Frame = Krowi_Tooltip, Top = EarnedByLine()}}
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
            return {Krowi_Tooltip}
        end,
        Check = function()
            return Krowi_Tooltip:IsShown(), "the points tooltip is not shown"
        end
    },
    SceneStep("menu", "MenuMain", "rightclick", "the right-click menu", function()
        Krowi_Tooltip:Hide()
        return {OpenMenu(1)}
    end, function()
        return OpenMenu(1) ~= nil, "no menu is open"
    end),
    {
        Name = "menu-go-to",
        Picture = "MenuGoTo",
        Text = "hover Go to in the right-click menu",
        Mouse = function()
            return OpenMenu(2) ~= nil
        end,
        Cut = function()
            return {OpenMenu(2)}
        end,
        Check = function()
            return OpenMenu(2) ~= nil, "no submenu is open"
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
        Cut = function()
            return {live.Scene and live.Scene.Popout}
        end
    },
    SceneStep("reward-preview", "RewardPreview", "rewards", "the reward preview of a mount", function()
        return {KrowiAF_RewardPreview}
    end, function()
        return KrowiAF_RewardPreview:IsShown(), "the reward preview is not shown"
    end),
    addon.Util.IsMainline and SceneStep("guide", "GuidePanel", "guides", "the guide of Legendary Research of the Ebon Blade", function()
        addon.Gui.RewardPreview:Close()
        return {KrowiAF_GuidePanel}
    end, function()
        return KrowiAF_GuidePanel ~= nil and KrowiAF_GuidePanel:IsShown(), "the guide panel is not shown"
    end) or nil,
    SceneStep("calendar", "CalendarDays", "calendar", "the achievement calendar", function()
        return {KrowiAF_AchievementCalendarFrame, KrowiAF_AchievementCalendarFrame.SideFrame}
    end, function()
        return KrowiAF_AchievementCalendarFrame:IsShown(), "the calendar is not shown"
    end),
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
            local subSystem = addon.Gui.EventReminderAlertSystem.SubSystem
            if subSystem and subSystem.alertFramePool then
                for frame in subSystem.alertFramePool:EnumerateActive() do
                    tinsert(frames, frame)
                end
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
        Text = "open your world map (M) and hover the achievement button on it",
        Mouse = function()
            local button = addon.Gui.WorldMapButton
            return WorldMapFrame:IsShown() and type(button) == "table" and button:IsMouseOver()
                and (Krowi_ProgressBarTooltip:IsShown() or Krowi_Tooltip:IsShown())
        end,
        Cut = function()
            return {addon.Gui.WorldMapButton, Krowi_ProgressBarTooltip:IsShown() and Krowi_ProgressBarTooltip or Krowi_Tooltip}
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

function SetBanner(text)
    banner.Text:SetText(("Krowi's Achievement Filter pictures %d/%d: %s"):format(live.StepIndex, #steps, text))
end

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
    SaveRun()
    local checked, checkErr = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(checkErr), "lua-errors")
    end
    tinsert(live.Observations, ("%d pictures recorded; run .claude/tools/Make-HelpPictures.ps1 after the next /reload"):format(#live.Run.Shots))
    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
end

local function Capture()
    local step = steps[live.StepIndex]
    local ok, passed, reason = pcall(step.Check or function() return true end)
    if not ok then
        Add("FAIL", "test error: " .. tostring(passed))
    elseif not passed then
        Add("FAIL", reason or "the check failed")
    else
        local cutOk, items = pcall(step.Cut)
        local rectangle = cutOk and items and Rectangle(items)
        if not rectangle then
            Add("FAIL", "nothing on screen to cut out" .. (cutOk and "" or (": " .. tostring(items))))
        else
            local shotTime = date("%Y-%m-%d %H:%M:%S")
            rectangle.Name, rectangle.Time = step.Picture, shotTime
            tinsert(live.Run.Shots, rectangle)
            Add("PASS", ("%s: %dx%d units, cut at %d,%d-%d,%d px"):format(step.Picture, rectangle.Width, rectangle.Height,
                rectangle.Left, rectangle.Top, rectangle.Right, rectangle.Bottom))
            live.Results[#live.Results].Screenshot = {Time = shotTime}
            live.Shot = live.Results[#live.Results].Screenshot
            Screenshot()
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
    local step = steps[n]
    if not step then
        Finish()
        return
    end
    live.StepIndex, live.StepName, live.Scene = n, step.Name, nil
    SetBanner(step.Text)
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
    local black = backdrop:CreateTexture(nil, "BACKGROUND")
    black:SetAllPoints()
    black:SetColorTexture(0, 0, 0, 1)
    backdrop:Hide()

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
    return true
end

addon.Tests.Async.pictures = true
addon.Tests.Suites.pictures = function(done)
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
    local screenWidth, screenHeight = GetPhysicalScreenSize()
    live = {
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
    if format == "jpg" and quality and quality < 8 then
        tinsert(live.Observations, "jpg quality below 8 blurs small text: type /console screenshotQuality 10 in game and run the pictures again")
    end
    if not banner then
        CreateFrames()
    end
    backdrop:Show()
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    banner:Show()
    print(("|cFF88CCFFKrowiAF Tests:|r pictures: %d steps, about %d s; two of them wait for your mouse"):format(#steps, #steps * 3))
    RunStep(1)
end