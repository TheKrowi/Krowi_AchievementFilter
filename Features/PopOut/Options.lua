local _, addon = ...
local L = addon.L

-- Pop Out's settings and its section of the options window, whether the feature is on or off; the registry puts the
-- switch on top (Features.lua). The saved keys stay where they were before the feature moved: Popout.* and the modifier
-- Achievements.Modifiers.PopOut (docs/work/2026-11-09-pop-out). The window draws only a group's leaves, so the old
-- groups are headers here, drawn as sub-headings (Options/Window/Source.lua, Leaves).
-- The modifier shows in two places, as the game's Settings show a binding in more than one (Krowi, 2026-11-09): here,
-- and with the other modifiers in Keys and clicks (Into), each with a button to the other place (Krowi_Options 2.1, a
-- dropdown's button). Both rows grey out while Pop Out is off; the button in Keys and clicks stays usable, so the way to
-- the switch is never greyed.

local AdjustedWidth = addon.InjectOptions.AdjustedWidth

local function RefreshChrome()
    addon.Gui.AchievementPopout:RefreshAllChrome()
end

-- A Popout.* setting: its getter and setter; refresh redraws the open Pop Outs' chrome
local function Popout(key, refresh)
    return function() return addon.Options.db.profile.Popout[key] end, function(_, value)
        addon.Options.db.profile.Popout[key] = value
        if refresh then RefreshChrome() end
    end
end

local function Toggle(order, key, name, desc, refresh)
    local get, set = Popout(key, refresh)
    return {
        order = order, type = "toggle", width = AdjustedWidth(1.5),
        name = name, desc = desc:KAF_AddDefaultValueText("Popout." .. key),
        get = get, set = set
    }
end

local function Range(order, key, name, desc, min, max, step, disabledBy, refresh)
    local get, set = Popout(key, refresh)
    return {
        order = order, type = "range", width = AdjustedWidth(1.5),
        name = name, desc = desc:KAF_AddDefaultValueText("Popout." .. key),
        min = min, max = max, step = step,
        get = get, set = set,
        disabled = function() return not addon.Options.db.profile.Popout[disabledBy] end
    }
end

-- The modifier's dropdown in both places, named and described for the section it is in (Krowi, 2026-11-11): Keys and
-- clicks names the action, as its other modifier rows, says what it does for a reader who may not know a Pop Out, and
-- that Pop Out's switch controls it; Pop Out's own section names the key and says what holding it does, under the
-- switch it follows
local function ModifierRow(order, name, desc)
    return {
        order = order, type = "select", width = AdjustedWidth(0.93),
        name = name,
        desc = desc:KAF_AddDefaultValueText("Achievements.Modifiers.PopOut", addon.Modifiers),
        values = addon.Modifiers,
        get = function() return addon.Options.db.profile.Achievements.Modifiers.PopOut end,
        set = function(_, value) addon.Options.db.profile.Achievements.Modifiers.PopOut = value end
    }
end

-- A button that opens another section of the options window
local function GoTo(order, sectionId, sectionName)
    return {
        order = order, type = "execute",
        name = L["Go to {section}"]:K_ReplaceVars({section = sectionName}),
        desc = L["Go to {section} Desc"]:K_ReplaceVars({section = sectionName}),
        func = function() addon.Options.Open(nil, sectionId) end
    }
end

local function Rows()
    return {
        Modifier = ModifierRow(1, L["Click Modifier"], L["Click Modifier Desc"]),
        GoToKeys = GoTo(2, "keys", L["Keys and clicks"]),
        PersistAcrossSessions = Toggle(3, "PersistAcrossSessions", L["Persist Across Sessions"], L["Persist Across Sessions Desc"]),
        RememberSize = Toggle(4, "RememberSize", L["Remember Size"], L["Remember Size Desc"]),
        RememberLastPosition = Toggle(5, "RememberLastPosition", L["Remember Last Position"], L["Remember Last Position Desc"]),
        DefaultWidth = (function()
            local get, set = Popout("DefaultWidth")
            return {
                order = 6, type = "range", width = AdjustedWidth(1.5),
                name = L["Default Width"],
                desc = L["Default Width Desc"]:KAF_AddDefaultValueText("Popout.DefaultWidth"),
                min = 360, max = 800, step = 1,
                get = get, set = set
            }
        end)(),
        CloseOnEarn = Toggle(7, "CloseOnEarn", L["Close On Earn"], L["Close On Earn Desc"]),
        CloseOnEarnDelay = Range(8, "CloseOnEarnDelay", L["Close On Earn Delay"], L["Close On Earn Delay Desc"], 0, 10, 0.5, "CloseOnEarn"),
        EnableSnapping = Toggle(9, "EnableSnapping", L["Enable Snapping"], L["Enable Snapping Desc"]),
        SnapDistance = Range(10, "SnapDistance", L["Snap Distance"], L["Snap Distance Desc"], 5, 50, 1, "EnableSnapping"),
        Buttons = {order = 11, type = "header", name = L["Buttons"]},
        AutoHideCloseButton = Toggle(12, "AutoHideCloseButton", L["Auto-Hide Close Button"], L["Auto-Hide Close Button Desc"], true),
        AutoHideResizeButton = Toggle(13, "AutoHideResizeButton", L["Auto-Hide Resize Button"], L["Auto-Hide Resize Button Desc"], true),
        Appearance = {order = 14, type = "header", name = L["Appearance"]},
        FadeWhenNotHovered = Toggle(15, "FadeWhenNotHovered", L["Fade When Not Hovered"], L["Fade When Not Hovered Desc"], true),
        FadedOpacity = Range(16, "FadedOpacity", L["Faded Opacity"], L["Faded Opacity Desc"], 0, 1, 0.01, "FadeWhenNotHovered", true),
        FadeSpeed = Range(17, "FadeSpeed", L["Fade Speed"], L["Fade Speed Desc"], 0, 1, 0.05, "FadeWhenNotHovered", true)
    }
end

-- The modifier with the core's other modifiers in Keys and clicks, after them; its button opens this section
local function Into()
    local name = L["Pop Out"]
    return {
        {Path = "General.args.KeyBinding.args.General.args.Modifiers", Key = "PopOut",
            Row = ModifierRow(nil, name, L["Pop Out Modifier Desc"] .. "\n\n" .. L["Feature Controls Desc"]:K_ReplaceVars({feature = name})), FollowsSwitch = true,
            With = {Key = "GoToPopOut", Row = GoTo(nil, "popout", L["Pop Out"])}}
    }
end

addon.Features.AddOptions("PopOut", {
    Defaults = {
        Achievements = {
            Modifiers = {
                PopOut = 3
            }
        },
        Popout = {
            PersistAcrossSessions = true,
            RememberSize = true,
            RememberLastPosition = true,
            DefaultWidth = 434,
            CloseOnEarn = true,
            CloseOnEarnDelay = 2,
            EnableSnapping = true,
            SnapDistance = 20,
            AutoHideCloseButton = false,
            AutoHideResizeButton = false,
            FadeWhenNotHovered = false,
            FadedOpacity = 0.5,
            FadeSpeed = 0.2
        }
    },
    Rows = Rows,
    Into = Into,
    -- After the Right-click menu in the Achievement window group, before Achievement guides (Options/Window/Map.lua)
    Section = {Id = "popout", Name = L["Pop Out"], Card = L["Card Popout"], NavGroup = "window", Order = 100, Header = L["Pop Outs"],
        Pairs = {Modifier = "GoToKeys", CloseOnEarn = "CloseOnEarnDelay", EnableSnapping = "SnapDistance"}}
})