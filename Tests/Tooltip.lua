local _, addon = ...
addon.Tests.Tooltip = {}
local tooltip = addon.Tests.Tooltip

-- Whether the achievement tooltip's transmog set progress section finishes (docs/work/2026-10-08-getiteminfo-removed),
-- and whether the Most progress section shows on an achievement with transmog set data (docs/work/2026-10-11-latent-bugs).
-- A scenario builds the tooltip of an achievement with transmog set data the way hovering it does
-- (addon.Gui.AchievementTooltip:ShowTooltip) and records "done" when the section replaced its "Collecting data" line
-- with the set progress lines, or "stuck" when "Collecting data" is still there. Recorded is the behaviour of the
-- current code; Target the desired behaviour. The same scenarios run in game (/kaftest tooltip) against the real tooltip
-- and data, and headlessly (.claude/tools/headless/run-tests.lua) against a model of the transmog and item APIs.
--
-- What 12.1.5 changes: Blizzard deleted Blizzard_DeprecatedItemScript, the file that defined the global GetItemInfo as
-- C_Item.GetItemInfo (and on 12.1.0 only when the loadDeprecationFallbacks CVar is on). The section read the item's equip
-- slot through that global inside a coroutine, so the call failed with "attempt to call a nil value", coroutine.resume
-- swallowed the error and the tooltip kept "Collecting data". The headless environment has no global GetItemInfo, like
-- 12.1.5. The in-game run simulates 12.1.5 by clearing the global for the scenario and restoring it afterwards: an addon
-- write to a global taints that key until the next /reload, which is harmless here because nothing secure reads the old
-- alias (Blizzard's code calls C_Item.GetItemInfo), but reload before relying on another addon that still calls it.
--
-- The section only finishes at once when the set items are in the item cache; otherwise it waits for
-- GET_ITEM_INFO_RECEIVED. The suite's Ready check requests the items and waits until the cache has them, so the line can
-- be read right after the tooltip is built. Retail only: no Classic achievement has transmog set data.

-- Kind: nil for the transmog set progress section above; "most-progress" for whether the Most progress section shows;
-- "category" and "category-leave" for Blizzard's category tooltip (below)
-- Id: the achievement whose tooltip is built (one with TransmogSetIds; the headless model uses a fake with this id)
-- Recorded / Target: "done" or "stuck"; for "most-progress", "shown" or "hidden"; for "category", the tooltip the button
-- owns, "GameTooltip", "progress bar" (the addon's own) or "none"; for "category-leave", "shown" or "hidden"
-- Before the fix the section never finished on 12.1.5 ("stuck", verified in game on the 12.1.5 PTR on 2026-10-08); it now
-- reads the item through C_Item.GetItemInfo
--
-- most-progress-transmog-set (docs/work/2026-10-11-latent-bugs, C): MostProgress.lua hid its section on achievements with
-- transmog set data through achievement.TransmogSets, a field nothing has filled since transmog sets moved to
-- TransmogSetIds in 2024; that dead check is gone. The section stays hidden all the same (verified in game on Retail
-- 12.1.0 on 2026-10-13), with the achievement seen as neither completed nor account-wide. The criteria count, which the
-- run records as an observation, is the only gate left that hides it. The maintainer chose to keep today's behaviour
-- (2026-10-11); the scenario records it.
--
-- blizzard-category-tooltip (issue #300, docs/work/300-category-tooltip-taint): the tooltip of a category button on
-- Blizzard's Achievements and Guild tabs. Blizzard's list gives each such button AchievementFrameCategory_StatusBarTooltip
-- as its showTooltipFunc, which the button's OnEnter calls (Blizzard_AchievementUI.lua:594, 612-616). With this addon
-- loaded that runs tainted, and on GameTooltip it leaves GameTooltip.statusBarPool tainted. GameTooltip_OnHide reads that
-- pool before it clears a widget set, so every later map POI or vignette tooltip clears tainted and can error on a secret
-- value. The scenario gives a stand-in button the fields Blizzard's list sets, calls the global the way OnEnter does and
-- records which tooltip the button owns. The -leave scenario then runs Blizzard's OnLeave, when GameTooltip is the one
-- shown, and one tick of the addon's watcher, and records whether a tooltip the button owns is still shown. In game the
-- stand-in sits away from the cursor. Before the fix the in-game run shows Blizzard's tooltip from addon code, which
-- leaves GameTooltip.statusBarPool tainted until the next /reload: reload before combat.
tooltip.Scenarios = {
    {Name = "transmog-set-progress", Id = 40469, -- I'm Bringing Nerub-ack, DataAddons/Retail/11_TheWarWithin/TransmogSetData.lua
        Recorded = "done", Target = "done"},
    {Name = "most-progress-transmog-set", Kind = "most-progress", Id = 40469,
        Recorded = "hidden", Target = "hidden"},
    {Name = "blizzard-category-tooltip", Kind = "category",
        Recorded = "GameTooltip", Target = "progress bar"},
    {Name = "blizzard-category-tooltip-leave", Kind = "category-leave",
        Recorded = "hidden", Target = "hidden"}
}

local function IsCategoryKind(scenario)
    return scenario.Kind == "category" or scenario.Kind == "category-leave"
end

-- The shown tooltip the category button owns
local function CategoryOwner(button)
    if GameTooltip:IsShown() and GameTooltip:IsOwned(button) then
        return "GameTooltip"
    end
    local progressTooltip = addon.ProgressBarLib.GameTooltipWithProgressBar.Tooltip
    if progressTooltip:IsShown() and progressTooltip:IsOwned(button) then
        return "progress bar"
    end
    return "none"
end

local function InspectCategory(button, scenario)
    AchievementFrameCategory_StatusBarTooltip(button) -- what the button's OnEnter does through its showTooltipFunc
    if scenario.Kind == "category" then
        return CategoryOwner(button)
    end
    if GameTooltip:IsOwned(button) then
        AchievementCategoryTemplateButtonMixin.OnLeave(button) -- Blizzard's leave handler, which hides GameTooltip
    end
    if addon.Gui.BlizzardCategoryTooltip then
        addon.Gui.BlizzardCategoryTooltip.CheckLeave() -- one tick of the addon's watcher, as its OnUpdate runs it
    end
    return CategoryOwner(button) == "none" and "hidden" or "shown"
end

local function HideCategoryTooltips(button)
    local progressTooltip = addon.ProgressBarLib.GameTooltipWithProgressBar.Tooltip
    if progressTooltip:IsOwned(button) then
        progressTooltip:Hide()
    end
    if GameTooltip:IsOwned(button) then
        GameTooltip:Hide()
    end
end

-- env: IsRetail(), Setup(scenario, observations) -> ok[, reason], Show(scenario) -> ok[, reason], Lines() -> list of the
-- tooltip's left texts, CollectingText(), ProgressText(), MostProgressText(), CategoryButton() -> the stand-in category
-- button, Teardown(); optionally ObserveCategoryTooltip(observations)
-- Result: Name, Status (PASS = behaves as Recorded, FAIL = differs, SKIP = could not run), TargetMet, Line
local function Inspect(env, scenario)
    local lines = env.Lines()
    if scenario.Kind == "most-progress" then
        for _, text in ipairs(lines) do
            if text == env.MostProgressText() then
                return "shown"
            end
        end
        return "hidden"
    end
    local progressAt
    for i, text in ipairs(lines) do
        if text == env.CollectingText() then
            return "stuck"
        end
        if text == env.ProgressText() then
            progressAt = i
        end
    end
    if progressAt and #lines > progressAt then
        return "done"
    end
    return "empty" -- no section output at all: the section did not run
end

local function RunScenario(env, scenario, observations)
    local ready, reason = env.Setup(scenario, observations)
    local got
    if ready then
        local ok, err = pcall(function()
            if IsCategoryKind(scenario) then
                got = InspectCategory(env.CategoryButton(), scenario)
                return
            end
            local shown, why = env.Show(scenario)
            if shown then
                got = Inspect(env, scenario)
            else
                reason = why or "cannot show the tooltip"
            end
        end)
        if IsCategoryKind(scenario) then
            HideCategoryTooltips(env.CategoryButton())
        end
        env.Teardown() -- after an error too: it puts the global and the tooltip back
        if not ok then
            error(err, 0)
        end
    end

    local status, targetMet, tail
    if not got then
        status, tail = "SKIP", reason or "setup failed"
    else
        status = got == scenario.Recorded and "PASS" or "FAIL"
        targetMet = got == scenario.Target
        tail = ("got=%s target=%s %s"):format(got, scenario.Target, targetMet and "met" or "open")
    end
    return {
        Name = scenario.Name,
        Status = status,
        TargetMet = targetMet,
        Line = ("tooltip/%s: %s%s recorded=%s %s"):format(scenario.Name, status, scenario.Id and (" id=" .. scenario.Id) or "", scenario.Recorded, tail)
    }
end

function tooltip.Run(env, observations)
    local results = {}
    if env.ObserveCategoryTooltip then
        env.ObserveCategoryTooltip(observations)
    end
    if not env.IsRetail() then
        tinsert(observations, "no scenarios on Classic: no achievement there has transmog set data, and Blizzard's category tooltip stays Blizzard's")
        return results
    end
    for _, scenario in ipairs(tooltip.Scenarios) do
        tinsert(results, RunScenario(env, scenario, observations))
    end
    return results
end

-- [[ Environment: the real tooltip, data and item cache; the headless runner provides a model of the same calls ]] --

local gameEnv = {}
tooltip.GameEnv = gameEnv

function gameEnv.IsRetail()
    return addon.Util.IsMainline
end

function gameEnv.CollectingText()
    return addon.L["Collecting data"]
end

function gameEnv.ProgressText()
    return addon.L["Objectives progress"]
end

function gameEnv.MostProgressText()
    return addon.L["Most progress"]
end

-- The item ids of the achievement's usable transmog sets; nil and a reason when the scenario cannot run here
local function GetSetItems(achievementId)
    local achievement = addon.Data.Achievements[achievementId]
    if not achievement or not achievement.TransmogSetIds then
        return nil, "achievement " .. achievementId .. " has no transmog set data"
    end
    local setIds = addon.GetUsableSets(achievement.TransmogSetIds)
    if #setIds == 0 then
        return nil, "this character's class has no usable set for achievement " .. achievementId
    end
    local items = {}
    for _, setId in ipairs(setIds) do
        for _, appearance in ipairs(C_TransmogSets.GetSetPrimaryAppearances(setId) or {}) do -- MayReturnNothing
            local sourceInfo = C_TransmogCollection.GetSourceInfo(appearance.appearanceID)
            if sourceInfo and sourceInfo.itemID then
                tinsert(items, sourceInfo.itemID)
            end
        end
    end
    return items
end

addon.Tests.Ready.tooltip = function()
    if not addon.Util.IsMainline then
        return true
    end
    if not addon.Data.Achievements[tooltip.Scenarios[1].Id] then
        return false, "the achievement data is not loaded yet"
    end
    for _, scenario in ipairs(tooltip.Scenarios) do
        local items = not scenario.Kind and GetSetItems(scenario.Id) -- only the transmog set progress reads the set items
        for _, itemId in ipairs(items or {}) do
            if not select(9, C_Item.GetItemInfo(itemId)) then
                C_Item.RequestLoadItemDataByID(itemId)
                return false, "loading the set items of achievement " .. scenario.Id .. " into the item cache"
            end
        end
    end
    return true
end

local anchor, savedGetItemInfo, cleared, touchedGlobal
local function PlaceAnchor()
    anchor = anchor or CreateFrame("Frame", nil, UIParent)
    anchor:SetSize(100, 20)
    anchor:SetPoint("CENTER")
end

local function LoadAchievementUI()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
end

-- A stand-in for a category button of Blizzard's list, with the fields the list sets (Blizzard_AchievementUI.lua:581,
-- 591-593), in the screen corner furthest from the cursor so the mouse is not over it
local categoryButton
local function PlaceCategoryButton()
    categoryButton = categoryButton or CreateFrame("Button", nil, UIParent)
    categoryButton:SetSize(20, 20)
    categoryButton:ClearAllPoints()
    local x, y = GetCursorPosition()
    local scale = UIParent:GetEffectiveScale()
    local vertical = y / scale > UIParent:GetHeight() / 2 and "BOTTOM" or "TOP"
    local horizontal = x / scale > UIParent:GetWidth() / 2 and "LEFT" or "RIGHT"
    categoryButton:SetPoint(vertical .. horizontal)
    categoryButton:Show()
    categoryButton.name = "Kaftest category"
    categoryButton.numAchievements, categoryButton.numCompleted, categoryButton.numCompletedText = 10, 4, "4/10"
end

function gameEnv.CategoryButton()
    return categoryButton
end

function gameEnv.ObserveCategoryTooltip(observations)
    LoadAchievementUI()
    local isSecure, taintedBy = issecurevariable("AchievementFrameCategory_StatusBarTooltip")
    local state = AchievementFrameCategory_StatusBarTooltip == nil and "absent"
        or isSecure and "Blizzard's"
        or "replaced by " .. tostring(taintedBy)
    tinsert(observations, "global AchievementFrameCategory_StatusBarTooltip: " .. state)
end

function gameEnv.Setup(scenario, observations)
    if IsCategoryKind(scenario) then
        LoadAchievementUI()
        if not AchievementFrameCategory_StatusBarTooltip then
            return false, "Blizzard's category tooltip function does not exist on this client"
        end
        PlaceCategoryButton()
        return true
    end
    if not addon.Options.db.profile.Tooltip.Achievements.ObjectivesProgress.Show then
        return false, "Objectives progress is off in the tooltip options"
    end
    if scenario.Kind == "most-progress" then -- leaves the global GetItemInfo alone: only the transmog scenario needs it gone
        if addon.Options.db.profile.Tooltip.Achievements.MostProgress.Characters <= 0 then
            return false, "Most progress is set to 0 characters in the tooltip options"
        end
        if not addon.Data.Achievements[scenario.Id] then
            return false, "achievement " .. scenario.Id .. " is not registered"
        end
        tinsert(observations, ("achievement %d has %d criteria (GetAchievementNumCriteria)"):format(scenario.Id, GetAchievementNumCriteria(scenario.Id)))
        PlaceAnchor()
        return true
    end
    local items, reason = GetSetItems(scenario.Id)
    if not items then
        return false, reason
    end
    PlaceAnchor()
    -- Last, so nothing that can error runs between clearing the global and RunScenario's pcall around Show and Teardown.
    -- Only a client that still has the global gets a write (12.1.0 with loadDeprecationFallbacks on); 12.1.5 gets none.
    savedGetItemInfo = _G["GetItemInfo"] -- by string: the removed-api lint rule bans reading the name, which is the point
    tinsert(observations, ("global GetItemInfo %s before the run (12.1.5 removes it; 12.1.0 has it with loadDeprecationFallbacks on)"):format(savedGetItemInfo and "present" or "absent"))
    if savedGetItemInfo ~= nil then
        _G["GetItemInfo"] = nil
        cleared, touchedGlobal = true, true
    end
    return true
end

function gameEnv.Show(scenario)
    local achievement = addon.Data.Achievements[scenario.Id]
    if scenario.Kind == "most-progress" then
        -- Seen as neither completed nor account-wide, whatever this character has done, so only a transmog check could
        -- hide the section; fields and methods fall through to the real achievement
        achievement = setmetatable({IsCompleted = false, IsAccountWide = false}, {__index = achievement})
    end
    anchor.Achievement = achievement -- the section checks the tooltip owner's achievement before it writes
    addon.Gui.AchievementTooltip:ShowTooltip(anchor, achievement)
    return true
end

function gameEnv.Lines()
    local lines = {}
    for i = 1, Krowi_Tooltip:NumLines() do
        tinsert(lines, _G["Krowi_TooltipTextLeft" .. i]:GetText() or "")
    end
    return lines
end

function gameEnv.Teardown()
    if cleared then
        _G["GetItemInfo"] = savedGetItemInfo
        cleared = nil
    end
    savedGetItemInfo = nil
    Krowi_Tooltip:Hide()
    if anchor then
        anchor.Achievement = nil
    end
    if categoryButton then
        categoryButton:Hide()
    end
end

addon.Tests.Suites.tooltip = function()
    local observations = {}
    touchedGlobal = nil
    local results = tooltip.Run(gameEnv, observations)
    if touchedGlobal then
        tinsert(observations, "the run cleared and restored the global GetItemInfo, which stays tainted until the next /reload")
    end
    return results, observations
end