local addonName, addon = ...
addon.Tests.Options = {}
local options = addon.Tests.Options

-- The options window (docs/work/2026-10-25-options-revamp): whether every option of the AceConfig pages reaches the
-- window, behaves there as it does in AceConfig, and whether the game's Settings > AddOns holds the stub page only.
-- The window's model (addon.Options.Window.Model) answers without drawing anything, so the same scenarios run in game
-- (/kaftest options) and headlessly (.claude/tools/headless/run-tests.lua) against the whole addon loaded by
-- .claude/tools/headless/options-env.lua. Recorded is the behaviour of the current code; a scenario passes when the
-- code still behaves that way. Target is the desired behaviour; a scenario whose Recorded differs from Target is open.
-- These scenarios are stage 2's regression suite: the definition format that replaces AceConfig must keep them green.

local function Model()
    return addon.Options.Window and addon.Options.Window.Model
end

-- AceConfigDialog:AddToBlizOptions keeps every page it adds under BlizOptions[appName]
local function CountKafPages()
    local pages = LibStub("AceConfigDialog-3.0").BlizOptions or {}
    local n = 0
    for _, app in ipairs({ addon.Metadata.Title, "KrowiAF_Layout", "KrowiAF_EventReminders", "KrowiAF_Profiles", "KrowiAF_Plugins", "KrowiAF_Credits" }) do
        if pages[app] then n = n + 1 end
    end
    return n
end

local function Join(list)
    return #list == 0 and "none" or table.concat(list, ",")
end

-- Observe: a function returning the line's value
options.Scenarios = {
    {Name = "settings-entry",
        Observe = function()
            local stub = addon.Options.Window and addon.Options.Window.StubCategory and "yes" or "no"
            return ("pages=%d stub=%s"):format(CountKafPages(), stub)
        end,
        Recorded = "pages=0 stub=yes",
        Target = "pages=0 stub=yes"},
    {Name = "options-registered",
        Observe = function()
            local registry = LibStub("AceConfigRegistry-3.0")
            local n = 0
            for _, app in ipairs({ addon.Metadata.Title, "KrowiAF_Layout", "KrowiAF_EventReminders", "KrowiAF_Profiles", "KrowiAF_Plugins", "KrowiAF_Credits" }) do
                if registry:GetOptionsTable(app, "cmd", "KROWIAF-0.0") then n = n + 1 end
            end
            return ("apps=%d"):format(n)
        end,
        Recorded = "apps=6",
        Target = "apps=6"},
    {Name = "every-option-mapped-once",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            local c = model.Coverage()
            return ("unmapped=%d double=%d missing-paths=%d"):format(#c.Unmapped, #c.Double, #c.MissingPaths)
        end,
        Recorded = "unmapped=0 double=0 missing-paths=0", -- unmapped=1 (the tutorial button) until the tutorial went
        Target = "unmapped=0 double=0 missing-paths=0"},
    {Name = "set-through-window-equals-aceconfig",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("mismatches=%d"):format(#model.CheckRoundTrip())
        end,
        Recorded = "mismatches=0",
        Target = "mismatches=0"},
    -- every option's id, type and derived default: stage 2's definitions must reproduce it (labels and the disabled
    -- state are left out: headless labels come from stand-in global strings, and the disabled state follows the
    -- player's own settings, so neither would match between the game and the headless run)
    {Name = "options-fingerprint",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("options=%d hash=%s"):format(model.Fingerprint())
        end,
        -- The key binding options' keys carry an auto-numbered order (Binding523Key1): removing the tutorial button
        -- (2026-10-25) took one number out and moved them all, c7f9546a / 3ffe49dd before. Stage 2 gives them fixed ids.
        Recorded = "options=406 hash=8bb98662",
        Target = "options=406 hash=8bb98662",
        RecordedClassic = "options=302 hash=06ba645e",
        TargetClassic = "options=302 hash=06ba645e"},
    {Name = "defaults-restore-acedb",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("differences=%d"):format(#model.CheckDefaults())
        end,
        Recorded = "differences=0",
        Target = "differences=0"},
    {Name = "derived-default-matches-text",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("mismatches=%d"):format(#(model.CheckDerivedDefaults()))
        end,
        Recorded = "mismatches=0",
        Target = "mismatches=0"},
    {Name = "changed-dot",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("wrong=%d"):format(#model.CheckChangedDots())
        end,
        Recorded = "wrong=0",
        Target = "wrong=0"},
    {Name = "plugins-present",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return "groups=" .. Join(model.PluginGroups())
        end,
        Recorded = "groups=Achievements Tab Fixes,Better Wardrobe,EllesmereUI,ElvUI,GW 2 UI,Instance Achievement Tracker,Zygor Guides Viewer",
        Target = "groups=Achievements Tab Fixes,Better Wardrobe,EllesmereUI,ElvUI,GW 2 UI,Instance Achievement Tracker,Zygor Guides Viewer"},
    {Name = "retail-only-hidden-on-classic",
        Observe = function()
            local model = Model()
            if not model then return "no window" end
            return ("visible-retail-only=%d"):format(#model.VisibleRetailOnly())
        end,
        Recorded = "visible-retail-only=0",
        Target = "visible-retail-only=0"},
}

-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function RunScenario(scenario)
    local ok, got = pcall(scenario.Observe)
    local isRetail = addon.Util.IsMainline
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    if not ok then
        return { Name = scenario.Name, Status = "FAIL", TargetMet = false, Line = ("options/%s: FAIL error=[%s]"):format(scenario.Name, tostring(got)) }
    end
    local status = got == recorded and "PASS" or "FAIL"
    local targetMet = got == target
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("options/%s: %s got=[%s] target=[%s] %s"):format(scenario.Name, status, got, target, targetMet and "met" or "open")
    }
end

function options.Run()
    local results = {}
    for _, scenario in ipairs(options.Scenarios) do
        tinsert(results, RunScenario(scenario))
    end
    return results
end

-- Not scenarios: the options without a default (no dot, skipped by Defaults), and the setters whose side effects
-- errored during the round trip (headless: frames and lists the load does not build; in game BugGrabber names them)
function options.Observations()
    local model = Model()
    if not model then return {} end
    local _, withoutDefault = model.CheckDerivedDefaults()
    local _, sideEffects = model.CheckRoundTrip()
    local out = { "options without a default: " .. Join(withoutDefault or {}) }
    -- "file.lua line 90" rather than "file.lua:90:", which the unit-tests lint rule would read as a failing scenario
    for _, line in ipairs(sideEffects or {}) do out[#out + 1] = "setter side effect: " .. line:gsub("(%.lua):(%d+):", "%1 line %2:") end
    return out
end

-- [[ Game only: the window itself ]] --

-- After the scenarios the suite drives the real window, the /kevutest way (Krowi_ExtendedVendorUI): each step sets a state
-- through the window's own functions, names itself in a banner over the window, checks what the window shows and takes a
-- screenshot, which Read-GameTests.ps1 pairs with its file.
--   open: /kaf opens the window where the landing rule says (the first open after a /reload also builds it)
--   section-<id>: Overview and every section draw their rows, and every drawn check box, slider and text box shows its
--     option's value
--   toggle, range, input: one row of each changed through its own control: the value is stored, and the changed dot and
--     the footer's count follow it
--   search: a search lists results; pane: the help pane collapses to its strip; close: the close button hides the window
-- At the end every value the steps changed and the window's saved state (place, pane, last section, the sections seen,
-- which the walk marks) are put back, and the addon's Lua errors of the session are reported from BugGrabber. Combat
-- stops the run; the values go back once it ends.

local settle = 1 -- a state change -> its check and screenshot
local afterShot = 1 -- a screenshot -> the next step
local toggleId = "Layout.args.Header.args.General.args.CenterHeader"
local rangeId = "Layout.args.Categories.args.Indentation.args.Indentation"
local inputId = "Layout.args.Achievements.args.TemporarilyObtainable.args.StartTimeAndEndTime.args.Custom"

local live -- the run in progress
local runToken = 0 -- bumped by every stop, so a stopped run's timers do nothing
local banner
local steps

local function Add(status, text)
    tinsert(live.Results, {
        Name = "live-" .. live.StepName,
        Status = status,
        GameOnly = true,
        Line = ("options/live-%s: %s %s"):format(live.StepName, status, text)
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

local function Window()
    return KrowiAF_OptionsWindow
end

local function DeepCopy(value)
    if type(value) ~= "table" then
        return value
    end
    local copy = {}
    for k, v in next, value do
        copy[k] = DeepCopy(v)
    end
    return copy
end

-- The section that draws an option, and the option
local function FindOption(optionId)
    local window = addon.Options.Window
    for _, section in ipairs(window.Map.Sections) do
        for _, element in ipairs(window.Source.Elements(section)) do
            if element.Option and element.Option.Id == optionId then
                return section.Id, element.Option
            end
        end
    end
end

-- The drawn row of an option on the current page
local function RowOf(option)
    local found
    Window().PageScrollBox:ForEachFrame(function(row)
        if row.Option == option then
            found = row
        end
    end)
    return found
end

-- The first value change of an option keeps the player's value, which Finish puts back
local function Remember(option)
    if not live.Before[option] then
        live.Before[option] = { Value = option:Get() }
    end
end

-- Drawn rows whose control does not show its option's value
local function CheckDrawnRows()
    local drawn, differ = 0, {}
    Window().PageScrollBox:ForEachFrame(function(row)
        drawn = drawn + 1
        local option = row.Option
        if not option or not option.Type then
            return
        end
        local value = option:Get()
        local shows
        if option.Type == "toggle" then
            shows = (row.Toggle:GetChecked() and true or false) == (value and true or false)
        elseif option.Type == "range" then
            -- the slider moves in whole steps: a value saved between them (the reward preview's size after a resize
            -- of the preview) shows on the nearest step
            local min, max, step = option:GetRange()
            local expected = value
            if expected and step and step > 0 then
                expected = math.min(math.max(min + math.floor((expected - min) / step + 0.5) * step, min), max)
            end
            shows = expected == nil or math.abs(row.Range.Slider:GetValue() - expected) < 0.001
        elseif option.Type == "input" then
            shows = row.Input:HasFocus() or row.Input:GetText() == tostring(value or "")
        else
            shows = true
        end
        if not shows then
            tinsert(differ, option.Id)
        end
    end)
    return drawn, differ
end

local function SectionStep(sectionId, name)
    return {
        Name = "section-" .. sectionId,
        Text = name,
        Run = function()
            Window():ShowSection(sectionId)
        end,
        Check = function()
            local rows = #(Window().Elements or {})
            local drawn, differ = CheckDrawnRows()
            local ok = (rows == 0 or drawn > 0) and #differ == 0
            Add(ok and "PASS" or "FAIL", ("%d rows, %d drawn%s"):format(rows, drawn,
                #differ > 0 and (", controls that do not show their value: [" .. table.concat(differ, ",") .. "]") or ""))
        end
    }
end

-- The footer names the section's changed options
local function FooterAgrees(sectionId)
    local window = Window()
    local count = addon.Options.Window.Model.ChangedCount(sectionId)
    local expected = count > 0 and window.Strings.ChangedCount:format(count) or ""
    return (window.ChangedText:GetText() or "") == expected, count
end

-- Shows the option's section scrolled to it, then changes it through its row's control in Change(row, option)
local function ChangeSteps(kind, optionId, Change)
    local sectionId, option
    return {
        Name = kind .. "-shown",
        Text = ("the %s row to change"):format(kind),
        Run = function()
            sectionId, option = FindOption(optionId)
            if not option then
                return optionId .. " is in no section on this client"
            end
            Window():ShowSection(sectionId, optionId)
        end,
        Check = function()
            Add(RowOf(option) and "PASS" or "FAIL", ("%s is drawn in %s"):format(optionId, sectionId))
        end
    }, {
        Name = kind,
        Text = ("a %s changed through its own control"):format(kind),
        Run = function()
            local row = option and RowOf(option)
            if not row then
                return "its row is not drawn"
            end
            Remember(option)
            Change(row, option)
        end,
        Check = function()
            local row = RowOf(option)
            local stored = option:Get() ~= live.Before[option].Value
            local dot = row and row.Dot:IsShown() == option:IsChanged()
            local footer, count = FooterAgrees(sectionId)
            Add(stored and dot and footer and "PASS" or "FAIL", ("%s: %s -> %s, dot %s, footer %s (%d changed)"):format(optionId,
                tostring(live.Before[option].Value), tostring(option:Get()), dot and "follows" or "wrong", footer and "follows" or "wrong", count))
        end
    }
end

local function BuildSteps()
    local window = addon.Options.Window
    local list = {
        {
            Name = "open",
            Required = true,
            Text = "/kaf opens the window",
            Run = function()
                live.FirstOpen = Window() == nil
                live.Landing = window.Landing()
                if Window() then
                    Window():Hide()
                end
                SlashCmdList.KAF("")
            end,
            Check = function()
                local frame = Window()
                local shown = frame and frame:IsShown()
                Add(shown and frame.SectionId == live.Landing and "PASS" or "FAIL", ("the window opens on %s, the landing section %s (first open after a /reload: %s)"):format(
                    tostring(frame and frame.SectionId), live.Landing, live.FirstOpen and "yes" or "no"))
            end
        },
        SectionStep("overview", addon.L["Overview"])
    }
    for _, section in ipairs(window.Map.Sections) do
        tinsert(list, SectionStep(section.Id, section.Name))
    end
    for _, step in ipairs({ ChangeSteps("toggle", toggleId, function(row) row.Toggle:Click() end) }) do tinsert(list, step) end
    for _, step in ipairs({ ChangeSteps("range", rangeId, function(row, option)
        local min, max = option:GetRange()
        row.Range:SetValue(option:Get() ~= min and min or max)
    end) }) do tinsert(list, step) end
    for _, step in ipairs({ ChangeSteps("input", inputId, function(row, option)
        row.Input:SetText((option:Get() or "") .. " x")
        row.Input:GetScript("OnEnterPressed")(row.Input)
    end) }) do tinsert(list, step) end
    local searchText
    tinsert(list, {
        Name = "search",
        Text = "a search lists results",
        Run = function()
            local _, option = FindOption(toggleId)
            searchText = option and option:GetLabel():match("^(%S+)") or "a"
            Window().SearchBox:SetText(searchText)
            Window():OnSearch(searchText)
        end,
        Check = function()
            local links = 0
            for _, element in ipairs(Window().Elements or {}) do
                if element.Kind == "Link" then
                    links = links + 1
                end
            end
            Add(Window().Searching and links > 0 and "PASS" or "FAIL", ("'%s' lists %d results"):format(searchText, links))
        end
    })
    tinsert(list, {
        Name = "pane",
        Text = "the help pane collapsed to its strip",
        Run = function()
            local frame = Window()
            frame:ShowSection("window")
            frame:SetPaneCollapsed(not frame.PaneCollapsed)
        end,
        Check = function()
            local frame = Window()
            local agrees = frame.ExpandButton:IsShown() == frame.PaneCollapsed and frame.HelpScrollBox:IsShown() == not frame.PaneCollapsed
            Add(agrees and "PASS" or "FAIL", ("the pane is %s and shows it"):format(frame.PaneCollapsed and "collapsed" or "open"))
        end
    })
    tinsert(list, {
        Name = "close",
        Text = "the close button hides the window",
        Run = function()
            Window().CloseButton:Click()
        end,
        Check = function()
            Add(not Window():IsShown() and "PASS" or "FAIL", "the window is hidden")
        end
    })
    return list
end

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
            Add("FAIL", ("Lua error x%d: %s"):format(err.counter or 1, tostring(err.message):sub(1, 300)))
        end
    end
    if found == 0 then
        Add("PASS", "no Lua error from this addon this session (BugGrabber)")
    end
end

-- Every value the steps changed goes back, then the window's saved state as it was before the run
local function Restore()
    local frame = Window()
    local notBack = {}
    for option, before in next, live.Before do
        pcall(option.Set, option, before.Value)
        if option:Get() ~= before.Value then
            tinsert(notBack, option.Id)
        end
    end
    if frame then
        if frame.PaneCollapsed ~= (live.SavedWindow.PaneCollapsed and true or false) then
            frame:SetPaneCollapsed(live.SavedWindow.PaneCollapsed and true or false)
        end
        if live.WasShown then
            frame:Open(live.WasShown)
        end
    end
    local saved = KrowiAF_SavedData.OptionsWindow -- the window keeps this table, so its fields go back in place
    wipe(saved)
    for k, v in next, live.SavedWindow do
        saved[k] = v
    end
    return notBack
end

local function Finish()
    banner:UnregisterAllEvents()
    live.StepName = "restore"
    local ok, notBack = pcall(Restore)
    if not ok then
        Add("FAIL", "could not put the values back: " .. tostring(notBack))
    else
        Add(#notBack == 0 and "PASS" or "FAIL", "the changed values and the window's saved state are as before the run"
            .. (#notBack > 0 and (", except [" .. table.concat(notBack, ",") .. "]") or ""))
    end
    live.StepName = "lua-errors"
    local checked, err = pcall(CheckErrors)
    if not checked then
        Add("FAIL", "test error: " .. tostring(err))
    end
    local finish, results, observations = live.Finish, live.Results, live.Observations
    live = nil
    finish(results, observations)
end

local function Stop(reason, combatStarted)
    runToken = runToken + 1
    banner:Hide()
    if reason then
        tinsert(live.Observations, "stopped: " .. reason)
    end
    if combatStarted or InCombatLockdown() then
        banner:UnregisterAllEvents()
        banner:RegisterEvent("PLAYER_REGEN_ENABLED")
        print("|cFF88CCFFKrowiAF Tests:|r options: stopped for combat; the changed values go back when it ends")
        return
    end
    Finish()
end

local RunStep

local function Capture()
    local ok, err = pcall(steps[live.StepIndex].Check)
    if not ok then
        Add("FAIL", "test error: " .. tostring(err))
    end
    live.Shot = { Time = date("%Y-%m-%d %H:%M:%S") }
    live.Results[#live.Results].Screenshot = live.Shot
    Screenshot()
    After(afterShot, function()
        RunStep(live.StepIndex + 1)
    end)
end

RunStep = function(n)
    local step = steps[n]
    if not step then
        Stop()
        return
    end
    live.StepIndex, live.StepName = n, step.Name
    banner.Text:SetText(("Krowi's Achievement Filter test %d/%d: %s"):format(n, #steps, step.Text))
    local ok, skip = pcall(step.Run)
    if not ok or (skip and step.Required) then
        Add("FAIL", ok and skip or ("test error: " .. tostring(skip)))
        Stop("step " .. step.Name .. " failed")
        return
    end
    if skip then -- the steps after it do not build on it
        Add("SKIP", skip)
        RunStep(n + 1)
        return
    end
    if n == 1 then
        banner:ClearAllPoints()
        banner:SetPoint("BOTTOM", Window(), "TOP", 0, 6)
        banner:Show()
    end
    After(settle, Capture)
end

local function CreateBanner()
    banner = CreateFrame("Frame", nil, UIParent)
    banner:SetFrameStrata("DIALOG")
    banner:SetSize(620, 26)
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
            Stop("combat started", true)
        elseif event == "PLAYER_REGEN_ENABLED" then
            Finish()
        end
    end)
    banner:Hide()
end

addon.Tests.Ready.options = function()
    if live then
        return false, "the previous options run is still going"
    end
    if not addon.Data.IsLoaded then -- some setters refresh the achievement window's data
        return false, "the achievement data is not loaded yet"
    end
    return true
end

addon.Tests.Async.options = true
addon.Tests.Suites.options = function(done)
    local frame = Window()
    KrowiAF_SavedData.OptionsWindow = KrowiAF_SavedData.OptionsWindow or {}
    live = {
        Results = options.Run(),
        Observations = options.Observations(),
        Finish = done,
        Before = {},
        SavedWindow = DeepCopy(KrowiAF_SavedData.OptionsWindow),
        WasShown = frame and frame:IsShown() and frame.SectionId or nil
    }
    if not banner then
        CreateBanner()
    end
    banner:RegisterEvent("SCREENSHOT_FAILED")
    banner:RegisterEvent("PLAYER_REGEN_DISABLED")
    steps = BuildSteps()
    print(("|cFF88CCFFKrowiAF Tests:|r options: %d steps, about %d s; it changes three options and puts them back"):format(#steps, #steps * (settle + afterShot)))
    RunStep(1)
end