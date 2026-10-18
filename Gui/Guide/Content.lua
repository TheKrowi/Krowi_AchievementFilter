local _, addon = ...
addon.Gui.Guide.Content = {}
local content = addon.Gui.Guide.Content
local guide = addon.Gui.Guide

-- Lays a guide out in a frame as numbered steps: the number in a column of its own, so wrapped text lines up, a white
-- headline, the details in smaller grey lines below it, and the step's waypoint actions. The side panel and the
-- expanded row both use it. Font strings and controls are pooled on the frame and reused on every render.
-- The actions follow Achievements.Guide.ActionStyle: small icons at the right of the headline (the default), or gold text
-- links on a line under the details. Krowi compared both in game on 2026-10-11 and kept both as an option.

content.ActionStyle = {Icons = 1, Links = 2} -- Achievements.Guide.ActionStyle

local numberWidth = 18
local textIndent = numberWidth + 6
local stepGap = 8
local detailGap = 1
local iconSize = 16
local iconGap = 4
local linkHeight = 14
local iconAtlases = {MapPin = "Waypoint-MapPin-Untracked", Poi = "Waypoint-MapPin-Untracked", TomTom = "Navigation-Tracked-Arrow"}
local poolKeys = {"GuideNumbers", "GuideHeadlines", "GuideDetails", "GuideIcons", "GuideLinks", "GuideSeparators"}

local function Acquire(frame, key, create)
    local pool = frame[key]
    if not pool then
        pool = {Used = 0}
        frame[key] = pool
    end
    pool.Used = pool.Used + 1
    local object = pool[pool.Used]
    if not object then
        object = create(frame)
        pool[pool.Used] = object
    end
    object:ClearAllPoints()
    object:Show()
    return object
end

local function NewFontString(frame, font, justify)
    local fontString = frame:CreateFontString(nil, "OVERLAY", font)
    fontString:SetJustifyH(justify)
    fontString:SetWordWrap(true)
    return fontString
end

local function NewNumber(frame)
    local fontString = NewFontString(frame, "GameFontNormal", "RIGHT")
    fontString:SetWidth(numberWidth)
    return fontString
end

local function NewHeadline(frame)
    return NewFontString(frame, "GameFontHighlight", "LEFT")
end

local function NewDetail(frame)
    return NewFontString(frame, "GameFontDisableSmall", "LEFT")
end

local function ActionOnClick(control)
    if control.Action and control.Action.Func then
        control.Action.Func()
    end
end

-- The action's full text, with the reason when it is disabled. Krowi_Tooltip, the library's own tooltip, not GameTooltip:
-- touching GameTooltip runs Blizzard's OnShow/OnHide in this addon's taint (taint review of milestone B).
local function ActionOnEnter(control)
    Krowi_Tooltip:SetOwner(control, "ANCHOR_RIGHT")
    Krowi_Tooltip:AddLine(control.Action.Text, 1, 1, 1, true)
    Krowi_Tooltip:Show()
end

local function ActionOnLeave()
    Krowi_Tooltip:Hide()
end

local function SetActionScripts(control)
    control:SetScript("OnClick", ActionOnClick)
    control:SetScript("OnEnter", ActionOnEnter)
    control:SetScript("OnLeave", ActionOnLeave)
    control:SetMotionScriptsWhileDisabled(true) -- a disabled action still shows why on hover
end

local function NewIcon(frame)
    local button = CreateFrame("Button", nil, frame)
    button:SetSize(iconSize, iconSize)
    button.Icon = button:CreateTexture(nil, "ARTWORK")
    button.Icon:SetAllPoints()
    button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
    SetActionScripts(button)
    return button
end

local function NewLink(frame)
    local button = CreateFrame("Button", nil, frame)
    button:SetNormalFontObject("GameFontNormalSmall")
    button:SetHighlightFontObject("GameFontHighlightSmall")
    button:SetDisabledFontObject("GameFontDisableSmall")
    button:SetHeight(linkHeight)
    SetActionScripts(button)
    return button
end

local function NewSeparator(frame)
    return frame:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
end

local function GetLinkLabel(action)
    if action.Kind == "TomTom" then
        return "TomTom"
    end
    return addon.L["Map pin"]
end

-- Icons at the right of the headline, from the right edge in; returns the width they take
local function PlaceIcons(frame, actions, width, y)
    local x = width
    for i = #actions, 1, -1 do
        local action = actions[i]
        local icon = Acquire(frame, "GuideIcons", NewIcon)
        icon.Action = action
        icon.Icon:SetAtlas(iconAtlases[action.Kind])
        icon.Icon:SetDesaturated(not action.Enabled)
        icon:SetAlpha(action.Enabled and 1 or 0.5)
        icon:SetEnabled(action.Enabled)
        icon:SetPoint("TOPRIGHT", frame, "TOPLEFT", x, -y)
        x = x - iconSize - iconGap
    end
    return width - x
end

-- Gold text links on one line, separated by a grey dot
local function PlaceLinks(frame, actions, y)
    local x = textIndent
    for i, action in ipairs(actions) do
        if i > 1 then
            local separator = Acquire(frame, "GuideSeparators", NewSeparator)
            separator:SetText(guide.DetailSeparator)
            separator:SetPoint("TOPLEFT", frame, "TOPLEFT", x, -y)
            x = x + separator:GetStringWidth()
        end
        local link = Acquire(frame, "GuideLinks", NewLink)
        link.Action = action
        link:SetText(GetLinkLabel(action))
        link:SetEnabled(action.Enabled)
        link:SetWidth(link:GetTextWidth())
        link:SetPoint("TOPLEFT", frame, "TOPLEFT", x, -y)
        x = x + link:GetWidth()
    end
end

-- Renders the achievement's guide into frame at the given width; returns the height it takes
function content.Render(frame, achievement, width)
    for _, key in ipairs(poolKeys) do
        if frame[key] then
            frame[key].Used = 0
        end
    end
    local useLinks = addon.Options.db.profile.Achievements.Guide.ActionStyle == content.ActionStyle.Links
    local y, numControls = 0, 0
    local lines = guide.GetLines(achievement)
    for index, line in ipairs(lines) do
        if index > 1 then
            y = y + stepGap
        end
        local actions = line.Waypoint and guide.Waypoint.GetCurrentActions(line.Waypoint) or {}
        numControls = numControls + #actions

        local number = Acquire(frame, "GuideNumbers", NewNumber)
        number:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -y)
        number:SetText(line.Number .. ".")

        local iconsWidth = not useLinks and #actions > 0 and PlaceIcons(frame, actions, width, y) or 0
        local headline = Acquire(frame, "GuideHeadlines", NewHeadline)
        headline:SetPoint("TOPLEFT", frame, "TOPLEFT", textIndent, -y)
        headline:SetWidth(width - textIndent - iconsWidth)
        headline:SetText(line.Text)
        y = y + max(headline:GetStringHeight(), iconsWidth > 0 and iconSize or 0)

        for _, text in ipairs(line.Details or {}) do
            local detail = Acquire(frame, "GuideDetails", NewDetail)
            detail:SetPoint("TOPLEFT", frame, "TOPLEFT", textIndent, -(y + detailGap))
            detail:SetWidth(width - textIndent)
            detail:SetText(text)
            y = y + detailGap + detail:GetStringHeight()
        end

        if useLinks and #actions > 0 then
            y = y + detailGap + 1
            PlaceLinks(frame, actions, y)
            y = y + linkHeight
        end
    end
    for _, key in ipairs(poolKeys) do
        local pool = frame[key]
        for i = (pool and pool.Used or 0) + 1, pool and #pool or 0 do
            pool[i]:Hide()
        end
    end
    frame.NumGuideLines, frame.NumGuideButtons = #lines, numControls
    return y
end

-- The guide block under an expanded row's objectives (Achievements.Guide.ExpandedRow). It is a child of the objectives
-- frame, so it follows the objectives when they move to another row or the popout and hides with them. Returns the
-- height the row grows by. The selected row redisplays its objectives on every list update, so the block renders again
-- only when what it shows can have changed: another achievement or width, a guide option, combat, TomTom, an NPC's name
-- the client has learned since, or forced.
function content.DisplayUnderObjectives(objectives, achievement, forced)
    local options = addon.Options.db.profile.Achievements.Guide
    local block = objectives.GuideBlock
    if achievement.Guide == nil or not options.ExpandedRow then
        if block then
            block:Hide()
        end
        return 0
    end
    if not block then
        block = CreateFrame("Frame", nil, objectives)
        objectives.GuideBlock = block
    end
    block:ClearAllPoints()
    block:SetPoint("TOPLEFT", objectives, "BOTTOMLEFT", 0, -stepGap)
    block:SetPoint("TOPRIGHT", objectives, "BOTTOMRIGHT", 0, -stepGap)
    local width = objectives:GetWidth()
    local key = table.concat({achievement.Id, tostring(width), tostring(options.ActionStyle), tostring(options.WaypointProvider),
        tostring(InCombatLockdown()), tostring(TomTom ~= nil), guide.GetNpcNames(achievement)}, ":")
    if forced or block.CacheKey ~= key then
        block.CachedHeight = content.Render(block, achievement, width)
        block.CacheKey = key
    end
    block:SetHeight(max(block.CachedHeight, 1))
    block:Show()
    return block.CachedHeight + stepGap
end