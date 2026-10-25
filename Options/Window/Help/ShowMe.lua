local addonName, addon = ...
addon.Options.Window = addon.Options.Window or {}
local window = addon.Options.Window
local help = window.Help

-- Show me (docs/work/2026-10-25-options-revamp/plan-help.md): one scene per feature section, opened through the entry
-- points the key bindings, the minimap icon and the menus already use; none calls ShowUIPanel or draws on GameTooltip.
-- The window's pane hides the window, then calls ShowMe. The scenes are shared with /kaftest pictures through
-- HelpScenes: a scene takes an optional ready(scene) callback that gets the frames it opened once they are drawn.
-- The map has no ShowMe: a secure button of its own, laid over the pane's Show me button, clicks the minimap's map button
-- from secure code, so the map is never opened from the addon's code (spec decision 9).

local L = addon.L
window.HelpScenes = {}
local scenes = window.HelpScenes

local tabPreference = {"Expansions", "Achievements", "Events", "PvP", "Specials"}

local function CanShow()
    return addon.Data.IsLoaded and not InCombatLockdown()
end

local function LoadAchievementUI()
    if not C_AddOns.IsAddOnLoaded("Blizzard_AchievementUI") then
        C_AddOns.LoadAddOn("Blizzard_AchievementUI")
    end
end

-- The preferred tab of this addon if the player shows it, else the first one shown
local function ShownTab(preferred)
    local tabs = addon.Options.db.profile.Tabs[addonName]
    if tabs[preferred] and tabs[preferred].Show then
        return preferred
    end
    for _, name in ipairs(tabPreference) do
        if tabs[name] and tabs[name].Show then
            return name
        end
    end
end

local function OpenTab(preferred)
    local tab = ShownTab(preferred)
    if tab then
        KrowiAF_ToggleAchievementFrame(addonName, tab, nil, true)
    end
    return tab
end

local function Ready(ready, scene)
    if ready then
        ready(scene)
    end
end

-- The row of the achievement the window selected, once the list has drawn it; the selection can be another step of the
-- same chain (Collapse Chain), so the selected one is asked for
local function WhenRowShown(func, tries)
    local selected = KrowiAF_AchievementsFrame.SelectionBehavior:GetFirstSelectedElementData()
    local row = selected and KrowiAF_AchievementsFrame.ScrollBox:FindFrame(selected)
    if row then
        func(row, selected)
        return
    end
    tries = tries or 20
    if tries > 0 then
        C_Timer.After(0.05, function()
            WhenRowShown(func, tries - 1)
        end)
    end
end

-- One the window shows as itself: with Collapse Chain on it selects a chain's next step instead when that one is
-- completed (Filters.lua GetHighestAchievementWhenCollapseSeries), and only one with a category can be selected at all
-- (KrowiAF_SelectAchievement errors without one)
local function Selectable(achievement)
    return achievement.Category and not select(2, addon.GetNextAchievement(achievement))
end

-- test(id, achievement): the latest achievements this character earned are tried first, then all the addon knows
local function PickAchievement(test)
    if GetLatestCompletedAchievements then
        for _, id in ipairs({GetLatestCompletedAchievements()}) do
            local achievement = addon.Data.Achievements[id]
            if achievement and Selectable(achievement) and test(id, achievement) then
                return achievement
            end
        end
    end
    for id, achievement in next, addon.Data.Achievements do
        if Selectable(achievement) and test(id, achievement) then
            return achievement
        end
    end
end

local function EarnedByMe(id)
    return (select(13, GetAchievementInfo(id))) and true or false
end

-- Earned by this character, not account-wide (so its tooltip lists who earned it), in a chain of 2 to 5 steps (so the
-- tooltip stays short)
local function InShortChain(id)
    if not EarnedByMe(id) then
        return false
    end
    local flags = select(9, GetAchievementInfo(id))
    if flags and addon.Objects.Flags:New(flags).IsAccountWide then
        return false
    end
    local length, step = 1, id
    while length <= 5 and GetPreviousAchievement(step) do
        step, length = GetPreviousAchievement(step), length + 1
    end
    step = id
    while length <= 5 and GetNextAchievement(step) do
        step, length = GetNextAchievement(step), length + 1
    end
    return length >= 2 and length <= 5
end

local function NotEarned(id)
    local knownId, _, _, completed = GetAchievementInfo(id)
    return knownId and not completed
end

local function HasMountPreview(id)
    local entries = addon.RewardPreviewData and addon.RewardPreviewData.GetPreviewableEntries(id)
    if not entries then
        return false
    end
    for _, entry in ipairs(entries) do
        if entry.RewardPreviewType == KrowiAF.Enum.RewardPreviewType.MountId then
            return true
        end
    end
    return false
end

-- Selects the achievement in the window and hands its row on
local function ShowAchievement(achievement, func)
    if not achievement then
        return
    end
    LoadAchievementUI()
    KrowiAF_SelectAchievement(achievement)
    WhenRowShown(func)
end

-- The last category of a tab that is not a summary or a flexible special category: on Expansions the current expansion
local function LastCategory(tab)
    local last
    for _, category in ipairs(addon.Tabs[tab].Categories or {}) do
        if not category.HasFlexibleData and not category.IsSummary then
            last = category
        end
    end
    return last
end

function scenes.tabs(ready)
    local tab = OpenTab("Expansions")
    Ready(ready, tab and {Tab = tab})
end

function scenes.window(ready)
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab]
    KrowiAF_ToggleAchievementFrame(tab.AddonName, tab.Name, nil, true)
    Ready(ready, {Tab = tab.Name})
end

function scenes.categories(ready)
    local tab = ShownTab("Expansions")
    local category = tab and LastCategory(tab)
    if not category then
        return
    end
    KrowiAF_SelectCategory(category)
    Ready(ready, {Tab = tab, Category = category})
end

function scenes.summary(ready)
    local tab = ShownTab("Expansions")
    local category = tab and addon.Tabs[tab].Categories and addon.Tabs[tab].Categories[1]
    if not category then
        return
    end
    KrowiAF_SelectCategory(category)
    Ready(ready, {Tab = tab, Category = category})
end

function scenes.achievements(ready)
    ShowAchievement(PickAchievement(EarnedByMe), function(row, achievement)
        Ready(ready, {Row = row, Achievement = achievement})
    end)
end

function scenes.filters(ready)
    if not OpenTab("Expansions") then
        return
    end
    local button = KrowiAF_AchievementFrameFilterButton
    if addon.Util.IsModern then
        button:OpenMenu()
    else
        button.menuBuilder:Show(button, 96, 15)
    end
    Ready(ready, {Button = button})
end

function scenes.search(ready)
    if not OpenTab("Expansions") then
        return
    end
    -- Only into an empty focus: taking it from another edit box (an open chat line) would run that box's focus-lost
    -- handler in this addon's call, which taints ACTIVE_CHAT_EDIT_BOX until chat is opened again
    if not GetCurrentKeyBoardFocus() then
        KrowiAF_SearchBoxFrame:SetFocus()
    end
    Ready(ready, {SearchBox = KrowiAF_SearchBoxFrame})
end

function scenes.tooltips(ready)
    ShowAchievement(PickAchievement(InShortChain) or PickAchievement(EarnedByMe), function(row, achievement)
        row:ShowTooltip()
        Ready(ready, {Row = row, Achievement = achievement})
    end)
end

function scenes.rightclick(ready)
    ShowAchievement(PickAchievement(EarnedByMe), function(row, achievement)
        addon.Gui.RightClickMenu.AchievementMenu:Open(row, achievement)
        Ready(ready, {Row = row, Achievement = achievement})
    end)
end

-- The achievement the player tracks, else the one selected in the window, else one not earned yet
function scenes.popout(ready)
    LoadAchievementUI()
    local achievement
    for _, id in ipairs(addon.Gui.TrackingSlots.GetTrackedIds()) do
        achievement = achievement or addon.Data.Achievements[id]
    end
    achievement = achievement or KrowiAF_AchievementsFrame.SelectionBehavior:GetFirstSelectedElementData() or PickAchievement(NotEarned)
    if not achievement then
        return
    end
    local popout = addon.Gui.AchievementPopout:Open(achievement)
    Ready(ready, {Popout = popout, Achievement = achievement})
end

function scenes.rewards(ready)
    local achievement = PickAchievement(function(id) return NotEarned(id) and HasMountPreview(id) end) or PickAchievement(HasMountPreview)
    ShowAchievement(achievement, function(row, selected)
        local frame = KrowiAF_RewardPreview -- the list reuses row frames, so the achievement is checked too
        if not (frame:IsShown() and frame.Pinned and frame.OwnerButton == row and frame.OwnerAchievementId == selected.Id) then
            addon.Gui.RewardPreview:TogglePin(row, selected.Id)
        end
        Ready(ready, {Row = row, Achievement = selected, Preview = frame})
    end)
end

local ebonBladeResearch = 60962 -- Legendary Research of the Ebon Blade, the guide the mockup named
function scenes.guides(ready)
    local achievement = addon.Data.Achievements[ebonBladeResearch]
    if not (achievement and achievement.Guide) then
        return
    end
    ShowAchievement(achievement, function(row, selected)
        local panel = addon.Gui.Guide.Panel
        if not (panel.Frame and panel.Frame:IsShown() and panel.Frame.Pinned and panel.Frame.OwnerButton == row and panel.Frame.Achievement == selected) then
            panel:TogglePin(row, selected)
        end
        Ready(ready, {Row = row, Achievement = selected, Panel = panel.Frame})
    end)
end

function scenes.calendar(ready)
    LoadAchievementUI()
    KrowiAF_AchievementCalendarFrame:Show()
    Ready(ready, {Calendar = KrowiAF_AchievementCalendarFrame})
end

-- Placeholder reminders on copies of the player's events, so the real ones keep their details (the Location button's
-- placeholders, Options/EventReminders.lua, write theirs onto the real events). worldFirst: the event list's Show me
-- starts with the world events, the reminders' with the calendar ones.
local eventTypes = {
    {Type = "Calendar", On = "CalendarEvents"},
    {Type = "Widget", On = "WidgetEvents"},
    {Type = "World", On = "WorldEvents"}
}

local function ShowPlaceholders(ready, worldFirst)
    local system = addon.Gui.EventReminderAlertSystem
    if not system.SubSystem then -- reminders were off at login, so there is no alert system to show them in
        print(addon.Metadata.Title, "-", L["Help Events Off"])
        return
    end
    local options = addon.Options.db.profile.EventReminders
    local order = worldFirst and {eventTypes[3], eventTypes[2], eventTypes[1]} or eventTypes
    -- only the free places: Blizzard's queue also takes alerts it cannot show yet and shows them later, one batch per click
    local pool = system.SubSystem.alertFramePool
    local free = options.PopUps.MaxAlerts - (pool and pool:GetNumActive() or 0)
    local shown, endTime = 0, GetServerTime() + 2 * 60 * 60
    for _, eventType in ipairs(order) do
        for _, event in next, addon.Data.Events[KrowiAF.Enum.EventType[eventType.Type]] or {} do
            if shown < free and options[eventType.On][event.Id] and event.Category then
                local name = event.Name or event.Category.Name or L["Placeholder"]
                local placeholder = setmetatable({EventDetails = {Name = name, EndTime = endTime}}, {__index = event})
                if system:AddAlert(placeholder, options.PopUps.FadeDelay) then
                    shown = shown + 1
                end
            end
        end
    end
    Ready(ready, {Shown = shown})
end

function scenes.events(ready)
    ShowPlaceholders(ready, false)
end

function scenes.eventlist(ready)
    ShowPlaceholders(ready, true)
end

for id, scene in next, scenes do
    if help[id] and (id ~= "guides" or addon.Util.IsMainline) then
        help[id].ShowMe = function()
            if CanShow() then
                scene()
            end
        end
    end
end

-- The map: a secure button clicks the minimap's own map button, which calls ToggleWorldMap (Retail's
-- MinimapCluster.ZoneTextButton, Mists' MiniMapWorldMapButton). It lies over the pane's Show me button while the maps
-- section is drawn, on UIParent and placed there by coordinates: a protected frame cannot anchor to the window's
-- regions ("Cannot anchor protected frames to regions"), and the window calls ShowMeSecure again after it moves or
-- resizes. On PLAYER_REGEN_DISABLED, which comes before the lockdown, it hides, since in combat it could not follow the
-- window or hide with it.
local mapButton
local hookedOwners = setmetatable({}, {__mode = "k"})

-- In debug mode the map route says in chat what it did, once per change, for an in-game check of a click that does nothing
local lastMapState
local function DebugMapState(state)
    if state ~= lastMapState then
        lastMapState = state
        addon.Diagnostics.Debug("Show me, map: " .. state)
    end
end

-- The delegate, or nil and why not
local function MapDelegate()
    local delegate
    if addon.Util.IsModern then
        delegate = MinimapCluster and MinimapCluster.ZoneTextButton
    else
        delegate = MiniMapWorldMapButton
    end
    if type(delegate) ~= "table" or not delegate.IsForbidden or delegate:IsForbidden() then
        return nil, "no minimap map button"
    end
    -- What SECURE_ACTIONS.click refuses on Retail (Blizzard_FrameXML/SecureTemplates.lua), checked before the script is
    -- read; a refused click would still close the window through PostClick and open no map
    if delegate.HasAccessConstraints and delegate:HasAccessConstraints() then
        return nil, "the minimap map button has access constraints"
    end
    if delegate.HasAnyForbiddenAspects and Enum.ForbiddenAspect and delegate:HasAnyForbiddenAspects(Enum.ForbiddenAspect.ScriptedInput) then
        return nil, "the minimap map button forbids scripted input"
    end
    -- Mists hides its map button when the group finder is off, and minimap addons hide or move it; a hidden button
    -- may not click, so the note takes over
    if not delegate:IsVisible() then
        return nil, "the minimap map button is hidden"
    end
    if not delegate:GetScript("OnClick") then
        return nil, "the minimap map button has no OnClick"
    end
    return delegate
end

-- Also true inside PLAYER_REGEN_DISABLED, where the window refreshes the pane before the lockdown starts
local function InCombat()
    return InCombatLockdown() or UnitAffectingCombat("player")
end

local function ReleaseMapButton()
    if not mapButton then
        return
    end
    if InCombatLockdown() then -- a protected button cannot hide now; once combat ends, unless laid over again by then
        mapButton.ReleasePending = true
        mapButton:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end
    if mapButton.Owner then
        mapButton.Owner:UnlockHighlight()
    end
    mapButton:UnregisterAllEvents()
    mapButton:Hide()
    mapButton:ClearAllPoints()
    mapButton.Owner, mapButton.Close, mapButton.ReleasePending = nil, nil, nil
end

-- Over the owner, in UIParent's coordinates, one strata above the window: the window is a toplevel frame, so every
-- click in it raises it and its buttons within their strata, which would lift the pane's button over a secure button
-- laid in the same strata
local function PlaceOver(owner)
    local left, bottom = owner:GetLeft(), owner:GetBottom()
    if not left then
        return false
    end
    local scale = owner:GetEffectiveScale() / UIParent:GetEffectiveScale()
    mapButton:SetFrameStrata("DIALOG")
    mapButton:SetFrameLevel(2)
    mapButton:ClearAllPoints()
    mapButton:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", left * scale, bottom * scale)
    mapButton:SetSize(owner:GetWidth() * scale, owner:GetHeight() * scale)
    return true
end

-- Lays the button over its owner and shows it; false while the owner has no position yet (its first draw)
local function LayOver(owner)
    if not PlaceOver(owner) then
        return false
    end
    mapButton.ReleasePending = nil
    mapButton:RegisterEvent("PLAYER_REGEN_DISABLED")
    mapButton.DebugTint:SetShown(addon.Diagnostics.DebugEnabled() and true or false)
    mapButton:Show()
    return true
end

local function CreateMapButton()
    local button = CreateFrame("Button", nil, UIParent, "SecureActionButtonTemplate")
    button:RegisterForClicks("LeftButtonUp")
    button:SetAttribute("type", "click")
    button:SetAttribute("useOnKeyDown", false)
    button:SetScript("OnEnter", function(self)
        DebugMapState("the mouse is over the secure button")
        if self.Owner then
            self.Owner:LockHighlight()
        end
    end)
    button:SetScript("OnLeave", function(self)
        if self.Owner then
            self.Owner:UnlockHighlight()
        end
    end)
    button:SetScript("PostClick", function(self, mouseButton, down)
        DebugMapState(("clicked (%s, %s): the map is %s"):format(tostring(mouseButton), down and "down" or "up",
            WorldMapFrame and WorldMapFrame:IsShown() and "open" or "closed"))
        if self.Close then
            self.Close()
        end
    end)
    button:SetScript("OnMouseDown", function()
        DebugMapState("a mouse button went down on the secure button")
    end)
    button:SetScript("OnEvent", function(self, event)
        if event == "PLAYER_REGEN_ENABLED" then
            self:UnregisterEvent(event)
            if not self.ReleasePending then -- the window laid it over again when combat ended
                return
            end
        end
        ReleaseMapButton()
    end)
    -- In debug mode the secure button shows as a red box, to see where it lies and what covers it
    button.DebugTint = button:CreateTexture(nil, "OVERLAY")
    button.DebugTint:SetAllPoints()
    button.DebugTint:SetColorTexture(1, 0, 0, 0.35)
    button:Hide()
    return button
end

if help.maps then
    -- owner: the pane's Show me button, or nil to let go; close: hides the options window (decision 1)
    help.maps.ShowMeSecure = function(owner, close)
        if not owner then
            ReleaseMapButton()
            return true
        end
        local delegate, why = MapDelegate()
        if not delegate then
            DebugMapState(why .. ": the note shows")
            ReleaseMapButton()
            return false
        end
        if InCombat() then
            DebugMapState("in combat: let go")
            ReleaseMapButton()
            return true
        end
        mapButton = mapButton or CreateMapButton()
        if not hookedOwners[owner] then
            hookedOwners[owner] = true
            owner:HookScript("OnHide", function(self)
                if mapButton.Owner == self then
                    ReleaseMapButton()
                end
            end)
            -- The mouse reaches the pane's button only when the secure one is not over it (the window moved, or the
            -- button had no position yet when the section was drawn): lay it over again
            owner:HookScript("OnEnter", function(self)
                if mapButton.Owner == self and not InCombat() then
                    LayOver(self)
                end
            end)
        end
        mapButton:SetAttribute("clickbutton", delegate)
        mapButton.Owner, mapButton.Close = owner, close
        if not LayOver(owner) then
            DebugMapState("the pane's button has no position yet: tried again next frame")
            C_Timer.After(0, function()
                if mapButton.Owner == owner and owner:IsVisible() and not InCombat() then
                    LayOver(owner)
                end
            end)
            return true
        end
        if addon.Diagnostics.DebugEnabled() then
            local function ScreenRect(frame)
                local scale = frame:GetEffectiveScale()
                return ("%d,%d %dx%d"):format(floor(frame:GetLeft() * scale + 0.5), floor(frame:GetBottom() * scale + 0.5),
                    floor(frame:GetWidth() * scale + 0.5), floor(frame:GetHeight() * scale + 0.5))
            end
            DebugMapState(("laid over the pane's button (%s %d at %s, shown %s), own %s %d at %s, clicking %s"):format(
                owner:GetFrameStrata(), owner:GetFrameLevel(), ScreenRect(owner), tostring(owner:IsShown()), mapButton:GetFrameStrata(),
                mapButton:GetFrameLevel(), ScreenRect(mapButton), delegate:GetDebugName()))
        end
        return true
    end

    help.maps.ShowMeNote = function()
        local key = GetBindingKey("TOGGLEWORLDMAP")
        return key and L["Help Maps Press Key"]:format(GetBindingText(key)) or L["Help Maps No Key"]
    end
end