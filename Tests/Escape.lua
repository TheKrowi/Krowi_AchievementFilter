local _, addon = ...
addon.Tests.Escape = {}
local escape = addon.Tests.Escape

-- Escape-key behaviour of the addon's frames. A scenario shows some frames, optionally arms a
-- Blizzard branch that handles Escape before the addon does (a static popup, a Menu context menu, an
-- old-style dropdown), presses Escape and records which frames are still shown. Recorded is the
-- behaviour of the current code, verified in game; a scenario passes when the code still behaves that
-- way, so a behaviour change is a diff of this file. Target is the desired behaviour; scenarios whose
-- Recorded differs from Target are the open defects, counted separately.
-- The same scenarios run in game (/kaftest escape) against the real frames and headlessly
-- (.claude/tools/headless/run-tests.lua) against a model of the Blizzard functions below.
--
-- How Escape works on Retail 12.1 (Blizzard_GameMenuEsc): ToggleGameMenu runs registered handlers by
-- priority until one returns true, else shows the game menu. Dialog: StaticPopup_EscapePressed.
-- Menu: the Menu manager (context menus; a legacy dropdown is not tracked by it, verified in game),
-- CloseMenus (hides legacy dropdowns without consuming), spell flyout, chat dock lists. Casting:
-- SpellStopCasting and SpellStopTargeting (protected). FrameworkPre and Framework: gamepad, help,
-- settings, edit mode, the game menu itself. AddOn: Blizzard's own load-on-demand frames and the
-- calendar menus. AddOnPost: CloseAllWindows, which hides the UI panels the panel manager knows and
-- every shown UISpecialFrames entry (the addon's KrowiAF_SpecialFrame proxy, whose OnHide closes the
-- topmost addon frame, Gui/FramesForClosing.lua) and consumes when it hid anything. World: ClearTarget
-- (protected). An addon must not register in that registry: it writes and re-sorts Blizzard's handler
-- table in tainted execution, after which every Escape press runs the chain tainted and the casting
-- handler's protected call is forbidden (verified 2026-09-19).
-- Classic keeps the legacy single-function chain: menu manager, popup, game menu, CloseMenus (not
-- consuming), casting, CloseAllWindows (with the proxy inside), target, else the game menu.
-- The achievement window is opened by the addon's own toggle with a plain Show, so the panel manager
-- never holds it and CloseWindows never hides it; it is one of the addon's frames for Escape purposes on
-- both clients. A panel that another path registered through ShowUIPanel is closed through HideUIPanel
-- by the handler (a plain Hide would leave it registered and CloseWindows would then consume every
-- following Escape, because HideUIPanel returns early for a hidden frame); that case is not covered
-- here because ShowUIPanel from addon code taints the panel manager's slot.
--
-- An addon cannot call ToggleGameMenu itself without ADDON_ACTION_FORBIDDEN from the protected
-- handlers, so PressEscape below runs the chain as far as an addon may: every handler that touches a
-- frame this suite uses, in Blizzard's order, minus the protected ones, and instead of showing the game
-- menu (its OnShow builds Blizzard's menu buttons, which must not happen in addon execution) it records
-- that the press would have shown it. The first in-game run (2026-09-19, before the 100.5 fix) went
-- through the real ToggleGameMenu (with those errors) and matched the model line for line, which is
-- what justifies the emulation.

-- Order of the keys is the order frames are listed in the results
escape.FrameKeys = {"Tooltip", "Text", "MapVerifier", "DataManager", "CalendarSide", "Calendar", "Achievements", "GameMenu"}

-- Frames whose OnLoad calls addon.Gui:RegisterFrameForClosing (Gui/FramesForClosing.lua; Achievements
-- is registered in Gui.lua, LoadWithBlizzard_AchievementUI). The headless runner does not load the
-- mixins, so it registers these itself; keep this in step with the code.
escape.RegisteredKeys = {"Tooltip", "Text", "MapVerifier", "DataManager", "CalendarSide", "Calendar", "Achievements"}

-- Shown: frames to show, in that order. Branch: popup | menu | dropdown. Presses: Escape presses.
-- CloseFirst: frames hidden through their own Hide (the close button) before Escape is pressed.
-- RetailOnly: the scenario is left out on Classic (none at the moment).
-- Recorded: frames still shown afterwards with the current code. Target: what should be shown, one
-- frame per press, topmost first, the achievement window included (decided 2026-09-19).
-- RecordedClassic / TargetClassic: Classic values where they differ (none at the moment).
escape.Scenarios = {
    {Name = "achievements", Shown = {"Achievements"}, Recorded = {}, Target = {}},
    {Name = "calendar-over-achievements", Shown = {"Achievements", "Calendar"}, Recorded = {"Achievements"}, Target = {"Achievements"}},
    {Name = "calendar-over-achievements-twice", Shown = {"Achievements", "Calendar"}, Presses = 2, Recorded = {}, Target = {}},
    {Name = "calendar-over-achievements-thrice", Shown = {"Achievements", "Calendar"}, Presses = 3, Recorded = {"GameMenu"}, Target = {"GameMenu"}},
    {Name = "calendar-side", Shown = {"Achievements", "Calendar", "CalendarSide"}, Recorded = {"Calendar", "Achievements"}, Target = {"Calendar", "Achievements"}},
    {Name = "tooltip-over-achievements", Shown = {"Achievements", "Tooltip"}, Recorded = {"Achievements"}, Target = {"Achievements"}},
    {Name = "tooltip-alone", Shown = {"Tooltip"}, Recorded = {}, Target = {}},
    {Name = "data-manager-over-achievements", Shown = {"Achievements", "DataManager"}, Recorded = {"Achievements"}, Target = {"Achievements"}},
    {Name = "text-over-data-manager", Shown = {"DataManager", "Text"}, Recorded = {"DataManager"}, Target = {"DataManager"}},
    {Name = "text-over-data-manager-twice", Shown = {"DataManager", "Text"}, Presses = 2, Recorded = {}, Target = {}},
    {Name = "text-over-data-manager-thrice", Shown = {"DataManager", "Text"}, Presses = 3, Recorded = {"GameMenu"}, Target = {"GameMenu"}},
    {Name = "map-verifier-over-achievements", Shown = {"Achievements", "MapVerifier"}, Recorded = {"Achievements"}, Target = {"Achievements"}}, -- before 100.5 the Map Verifier never closed: the old hook's frame list did not know it
    {Name = "map-verifier-alone", Shown = {"MapVerifier"}, Recorded = {}, Target = {}},
    {Name = "popup-over-achievements", Shown = {"Achievements"}, Branch = "popup", Recorded = {"Achievements"}, Target = {"Achievements"}}, -- before 100.5 the old hook hid a frame although the popup had consumed the press
    {Name = "popup-over-achievements-thrice", Shown = {"Achievements"}, Branch = "popup", Presses = 3, Recorded = {"GameMenu"}, Target = {"GameMenu"}},
    {Name = "popup-over-calendar", Shown = {"Achievements", "Calendar"}, Branch = "popup", Recorded = {"Achievements", "Calendar"}, Target = {"Achievements", "Calendar"}},
    {Name = "menu-over-achievements", Shown = {"Achievements"}, Branch = "menu", Recorded = {"Achievements"}, Target = {"Achievements"}},
    {Name = "menu-over-achievements-thrice", Shown = {"Achievements"}, Branch = "menu", Presses = 3, Recorded = {"GameMenu"}, Target = {"GameMenu"}},
    {Name = "menu-over-data-manager", Shown = {"DataManager"}, Branch = "menu", Recorded = {"DataManager"}, Target = {"DataManager"}},
    {Name = "dropdown-over-data-manager", Shown = {"DataManager"}, Branch = "dropdown", Recorded = {}, Target = {}}, -- Blizzard closes a legacy dropdown without consuming Escape (CloseMenus returns nothing), so the frame under it closes in the same press on both clients
    {Name = "nothing", Shown = {}, Recorded = {"GameMenu"}, Target = {"GameMenu"}},
    {Name = "closed-with-button", Shown = {"DataManager"}, CloseFirst = {"DataManager"}, Recorded = {"GameMenu"}, Target = {"GameMenu"}}, -- before 100.5 the proxy stayed shown after the close button, so the next Escape was eaten
    {Name = "closed-with-button-over-achievements", Shown = {"Achievements", "DataManager"}, CloseFirst = {"DataManager"}, Recorded = {}, Target = {}}
}

-- The game menu is never shown by the suite; the emulated chain records that a press would have shown
-- it, and a later press closes it again the way GameMenuFrame_EscapePressed would
local gameMenuShown = false

function escape.IsGameMenuShown()
    return gameMenuShown
end

function escape.ResetGameMenu()
    gameMenuShown = false
end

-- Blizzard's Escape handling as far as an addon may call it (see the header). The addon's own part
-- runs from the proxy's OnHide inside CloseAllWindows on both clients.
function escape.PressEscape()
    if RegisterGameMenuEscHandler then -- Retail 12.1 handler registry
        if StaticPopup_EscapePressed() then return end -- Dialog
        if Menu.GetManager():HandleESC() then return end -- Menu
        CloseMenus() -- Menu, never consumes
        if gameMenuShown then -- Framework: GameMenuFrame_EscapePressed
            gameMenuShown = false
            return
        end
        if CloseAllWindows() then return end -- AddOnPost
        gameMenuShown = true -- GameMenuFrame_Show
        return
    end
    if Menu and Menu.GetManager and Menu.GetManager():HandleESC() then -- Classic legacy chain
        return
    end
    if StaticPopup_EscapePressed() then
    elseif gameMenuShown then
        gameMenuShown = false
    elseif CloseMenus() then
    elseif CloseAllWindows() then
    else
        gameMenuShown = true
    end
end

local function Keys(list)
    local set = {}
    for _, key in ipairs(list) do
        set[key] = true
    end
    local ordered = {}
    for _, key in ipairs(escape.FrameKeys) do
        if set[key] then
            tinsert(ordered, key)
        end
    end
    return table.concat(ordered, ",")
end

local function Describe(scenario)
    local text = ("shown=[%s] branch=%s presses=%d"):format(table.concat(scenario.Shown, ","), scenario.Branch or "none", scenario.Presses or 1)
    if scenario.CloseFirst then
        text = text .. (" closefirst=[%s]"):format(table.concat(scenario.CloseFirst, ","))
    end
    return text
end

-- env: IsRetail(), Show(key) -> shown[, reason], Close(key), Arm(branch) -> armed, Press() -> nil or a note
-- about state outside the scenario that could consume the press (the press is then not made and the
-- scenario is skipped), IsShown(key), Reset()
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet,
-- Line (one line, identical in game and headless), Notes
local function RunScenario(env, scenario, isRetail)
    local recorded = (not isRetail and scenario.RecordedClassic) or scenario.Recorded
    local target = (not isRetail and scenario.TargetClassic) or scenario.Target
    env.Reset()
    local notes = {}
    local blocked
    for _, key in ipairs(scenario.Shown) do
        if not blocked then
            local shown, reason = env.Show(key)
            if not shown then
                blocked = "cannot show " .. key .. (reason and (": " .. reason) or "")
            end
        end
    end
    if not blocked and scenario.CloseFirst then
        for _, key in ipairs(scenario.CloseFirst) do
            env.Close(key)
        end
    end
    if not blocked and scenario.Branch and not env.Arm(scenario.Branch) then
        blocked = "cannot arm " .. scenario.Branch
    end

    local got
    if not blocked then
        for press = 1, scenario.Presses or 1 do
            local note = env.Press()
            if note then
                tinsert(notes, ("press %d: %s"):format(press, note))
                break
            end
        end
        if #notes > 0 then
            blocked = "outside state could consume Escape"
        else
            local shown = {}
            for _, key in ipairs(escape.FrameKeys) do
                if env.IsShown(key) then
                    tinsert(shown, key)
                end
            end
            got = table.concat(shown, ",")
        end
    end
    env.Reset()

    local status, targetMet, tail
    if blocked then
        status, tail = "SKIP", blocked
    else
        status = got == Keys(recorded) and "PASS" or "FAIL"
        targetMet = got == Keys(target)
        tail = ("got=[%s] target=[%s] %s"):format(got, Keys(target), targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("escape/%s: %s %s recorded=[%s] %s"):format(scenario.Name, status, Describe(scenario), Keys(recorded), tail),
        Notes = #notes > 0 and table.concat(notes, "; ") or nil
    }
end

function escape.Run(env)
    local results = {}
    local isRetail = env.IsRetail()
    for _, scenario in ipairs(escape.Scenarios) do
        if isRetail or not scenario.RetailOnly then -- Retail-only scenarios are left out on Classic, so the lines match the headless Classic run
            tinsert(results, RunScenario(env, scenario, isRetail))
        end
    end
    return results
end

-- [[ In-game environment: the real frames and the real Blizzard functions ]] --

local popupWhich = "KrowiAF_TestEscape"
local dropdown
local armed
local shownByScenario = {}
local observations = {}
escape.Observations = observations -- facts about the client noted while arming, stored with the run

local getters = {
    Tooltip = function() return KrowiAF_FloatingAchievementTooltip end,
    Text = function() return KrowiAF_TextFrame end,
    MapVerifier = function() return KrowiAF_MapVerifierFrame end,
    DataManager = function() return KrowiAF_DataManagerFrame end,
    CalendarSide = function() return KrowiAF_AchievementCalendarFrame and KrowiAF_AchievementCalendarFrame.SideFrame end,
    Calendar = function() return KrowiAF_AchievementCalendarFrame end,
    Achievements = function() return AchievementFrame end
}

local gameEnv = {}
escape.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

function gameEnv.IsShown(key)
    if key == "GameMenu" then
        return gameMenuShown
    end
    local frame = getters[key]()
    return frame ~= nil and frame:IsShown()
end

local function ClickDayWithAchievements()
    local calendar = KrowiAF_AchievementCalendarFrame
    for _, dayButton in ipairs(calendar.DayButtons) do
        if dayButton.Achievements then
            dayButton:Click() -- the day's OnClick selects it, the calendar's hook shows the side frame
            return true
        end
    end
    return false, "no day with achievements in the viewed month on this character"
end

function gameEnv.Show(key)
    shownByScenario[key] = true
    if key == "Achievements" then
        if not AchievementFrame then
            AchievementFrame_LoadUI()
        end
        KrowiAF_ToggleAchievementFrame("Krowi_AchievementFilter", "Achievements", nil, true) -- the addon's own path: a plain Show, not ShowUIPanel
    elseif key == "Text" then
        addon.Gui.DataManager:GetTextFrame("Escape test"):Show()
    elseif key == "MapVerifier" then
        addon.Gui.MapVerifier.Open()
    elseif key == "Tooltip" then
        local tooltip = KrowiAF_FloatingAchievementTooltip
        tooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
        tooltip:SetText("Escape test")
        tooltip:Show()
    elseif key == "CalendarSide" then
        local clicked, reason = ClickDayWithAchievements()
        if not clicked then
            return false, reason
        end
    else
        local frame = getters[key]()
        if frame then
            frame:Show()
        end
    end
    return gameEnv.IsShown(key)
end

function gameEnv.Close(key)
    local frame = getters[key]()
    if frame then
        frame:Hide()
    end
end

local function Observe(text)
    for _, known in ipairs(observations) do
        if known == text then
            return
        end
    end
    tinsert(observations, text)
end

function gameEnv.Arm(branch)
    armed = branch
    if branch == "popup" then
        StaticPopupDialogs[popupWhich] = StaticPopupDialogs[popupWhich] or {
            text = addon.Metadata.Title .. " escape test",
            button1 = "Close",
            hideOnEscape = true,
            whileDead = true,
            timeout = 0
        }
        StaticPopup_Show(popupWhich)
        return StaticPopup_Visible(popupWhich) ~= nil
    elseif branch == "menu" then
        if not (MenuUtil and MenuUtil.CreateContextMenu and Menu and Menu.GetManager) then
            return false
        end
        MenuUtil.CreateContextMenu(UIParent, function(_, rootDescription)
            rootDescription:CreateButton("Escape test", function() end)
        end)
        return Menu.GetManager():GetOpenMenu() ~= nil
    elseif branch == "dropdown" then
        if not (ToggleDropDownMenu and UIDropDownMenu_Initialize) then
            return false
        end
        dropdown = dropdown or CreateFrame("Frame", "KrowiAF_TestDropdown", UIParent, "UIDropDownMenuTemplate")
        UIDropDownMenu_Initialize(dropdown, function(_, level)
            local info = UIDropDownMenu_CreateInfo()
            info.text = "Escape test"
            info.notCheckable = true
            UIDropDownMenu_AddButton(info, level)
        end, "MENU")
        ToggleDropDownMenu(1, nil, dropdown, "cursor", 0, 0)
        if Menu and Menu.GetManager then
            Observe("legacy dropdown tracked by the Menu manager: " .. tostring(Menu.GetManager():GetOpenMenu() ~= nil))
        end
        return DropDownList1:IsShown()
    end
    return false
end

-- Everything in Blizzard's chain that is not part of the scenario yet could consume the press, in
-- chain order. When something is found the press is not made, so the emulated chain only ever acts on
-- the scenario's own frames. A target only matters when the press gets past CloseAllWindows, so it is
-- reported only when nothing before it would consume the press.
local function OutsideState()
    local found = {}
    local consumedEarlier = false
    if Menu and Menu.GetManager and Menu.GetManager():GetOpenMenu() then
        consumedEarlier = true
        if armed ~= "menu" then
            tinsert(found, "menu open")
        end
    end
    local index = 1
    while _G["StaticPopup" .. index] do -- StaticPopup1..N; the count constant is gone on 12.x
        local dialog = _G["StaticPopup" .. index]
        if dialog:IsShown() then
            consumedEarlier = true
            if dialog.which ~= popupWhich then
                tinsert(found, "popup " .. tostring(dialog.which))
            end
        end
        index = index + 1
    end
    if GameMenuFrame:IsShown() then
        consumedEarlier = true
        tinsert(found, "game menu shown")
    end
    if DropDownList1 and DropDownList1:IsShown() and armed ~= "dropdown" then
        tinsert(found, "dropdown shown")
    end
    if UnitCastingInfo("player") or UnitChannelInfo("player") then
        consumedEarlier = true
        tinsert(found, "casting")
    end
    if IsBagOpen then
        for bag = 0, 4 do
            if IsBagOpen(bag) then
                consumedEarlier = true
                tinsert(found, "bag " .. bag .. " open")
            end
        end
    end
    for _, key in ipairs({"left", "center", "right", "doublewide", "fullscreen"}) do
        local panel = GetUIPanel(key)
        if panel then
            consumedEarlier = true
            if not panel:IsShown() then
                tinsert(found, key .. " panel " .. tostring(panel:GetName()) .. " hidden but still registered")
            else
                tinsert(found, key .. " panel " .. tostring(panel:GetName()))
            end
        end
    end
    for _, name in next, UISpecialFrames do
        local frame = _G[name]
        if frame and frame:IsShown() then
            consumedEarlier = true
            if name ~= "KrowiAF_SpecialFrame" then
                tinsert(found, "special frame " .. name .. " shown")
            end
        end
    end
    if not consumedEarlier and UnitExists("target") then
        tinsert(found, "has target, Escape clears it instead of opening the game menu")
    end
    if #found > 0 then
        return table.concat(found, ", ")
    end
end

function gameEnv.Press()
    local note = OutsideState()
    if note then
        return note
    end
    escape.PressEscape()
end

function gameEnv.Reset()
    armed = nil
    wipe(shownByScenario)
    escape.ResetGameMenu()
    if StaticPopup_Visible(popupWhich) then
        StaticPopup_Hide(popupWhich)
    end
    if Menu and Menu.GetManager then
        Menu.GetManager():CloseMenus()
    end
    if CloseDropDownMenus then
        CloseDropDownMenus()
    end
    for _, key in ipairs(escape.FrameKeys) do
        local frame = getters[key] and getters[key]()
        if frame and frame:IsShown() then
            frame:Hide() -- the addon's own close path for every frame, the achievement window included
        end
    end
    if KrowiAF_SpecialFrame:IsShown() then
        KrowiAF_SpecialFrame:Hide()
    end
end

addon.Tests.Suites.escape = function()
    wipe(observations)
    return escape.Run(gameEnv), observations
end