local _, addon = ...
local L = addon.L

-- Reward preview's settings and its section of the options window, whether the feature is on or off; the registry puts
-- the switch on top (Features.lua). The saved keys stay under Achievements, where they were before the feature moved
-- (docs/work/2026-11-08-feature-split-poc).

local AdjustedWidth = addon.InjectOptions.AdjustedWidth

local function Redraw()
    if not KrowiAF_AchievementsFrame then
        return
    end
    KrowiAF_SummaryFrame:UpdateAchievementsOnNextShow()
    KrowiAF_AchievementsFrame:ForceUpdate()
end

local function ShowRewardPreviewIconSet(_, value)
    addon.Options.db.profile.Achievements.ShowRewardPreviewIcon = value
    Redraw()
end

local function RewardPreviewMouseoverShowSet(_, value)
    addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow = value
end

local function RewardPreviewInvertVerticalRotationSet(_, value)
    addon.Options.db.profile.Achievements.RewardPreviewInvertVerticalRotation = value
end

local function RewardPreviewMaxIndividualIconsSet(_, value)
    addon.Options.db.profile.Achievements.RewardPreviewMaxIndividualIcons = value
    Redraw()
end

local function RewardPreviewDefaultWidthSet(_, value)
    addon.Options.db.profile.Achievements.RewardPreviewDefaultWidth = value
    if KrowiAF_RewardPreview and not KrowiAF_RewardPreview:IsShown() then
        KrowiAF_RewardPreview:SetWidth(value)
    end
end

local function RewardPreviewDefaultHeightSet(_, value)
    addon.Options.db.profile.Achievements.RewardPreviewDefaultHeight = value
    if KrowiAF_RewardPreview and not KrowiAF_RewardPreview:IsShown() then
        KrowiAF_RewardPreview:SetHeight(value)
    end
end

local function IconOff()
    return not addon.Options.db.profile.Achievements.ShowRewardPreviewIcon
end

-- Only the settings of the row icon follow it; rotation and size apply to every preview, also one opened from the
-- right-click menu, which works without the icon (Krowi's pick at the look gate, review-options.md)
local function Rows()
    return {
        ShowRewardPreviewIcon = {
            order = 1, type = "toggle", width = AdjustedWidth(1.35),
            name = L["Show icon on achievements"],
            desc = L["Show icon on achievements Desc"]:K_ReplaceVars({previewReward = L["Preview Reward"]}):KAF_AddDefaultValueText("Achievements.ShowRewardPreviewIcon"),
            get = function() return addon.Options.db.profile.Achievements.ShowRewardPreviewIcon end,
            set = ShowRewardPreviewIconSet,
        },
        RewardPreviewMouseoverShow = {
            order = 2, type = "toggle", width = AdjustedWidth(1.35),
            name = L["Show on mouseover"],
            desc = L["Show Reward Preview on Mouseover Desc"]:K_ReplaceVars(L["Reward Preview"]):KAF_AddDefaultValueText("Achievements.RewardPreviewMouseoverShow"),
            get = function() return addon.Options.db.profile.Achievements.RewardPreviewMouseoverShow end,
            set = RewardPreviewMouseoverShowSet,
            disabled = IconOff
        },
        RewardPreviewInvertVerticalRotation = {
            order = 3, type = "toggle", width = AdjustedWidth(1.35),
            name = L["Invert up and down when turning"],
            desc = L["Invert Reward Preview Vertical Rotation Desc"]:K_ReplaceVars(L["Reward Preview"]):KAF_AddDefaultValueText("Achievements.RewardPreviewInvertVerticalRotation"),
            get = function() return addon.Options.db.profile.Achievements.RewardPreviewInvertVerticalRotation end,
            set = RewardPreviewInvertVerticalRotationSet
        },
        RewardPreviewMaxIndividualIcons = {
            order = 4, type = "range", width = AdjustedWidth(1.35),
            name = L["Most icons per achievement"],
            desc = L["Reward Preview Max Individual Icons Desc"]:K_ReplaceVars(L["Reward Preview"]):KAF_AddDefaultValueText("Achievements.RewardPreviewMaxIndividualIcons"),
            min = 1, max = 10, step = 1,
            get = function() return addon.Options.db.profile.Achievements.RewardPreviewMaxIndividualIcons end,
            set = RewardPreviewMaxIndividualIconsSet,
            disabled = IconOff
        },
        RewardPreviewDefaultWidth = {
            order = 5, type = "range", width = AdjustedWidth(1.35),
            name = L["Width"],
            desc = L["Reward Preview Width Desc"]:KAF_AddDefaultValueText("Achievements.RewardPreviewDefaultWidth"),
            min = 200, max = 600, step = 1,
            get = function() return addon.Options.db.profile.Achievements.RewardPreviewDefaultWidth end,
            set = RewardPreviewDefaultWidthSet
        },
        RewardPreviewDefaultHeight = {
            order = 6, type = "range", width = AdjustedWidth(1.35),
            name = L["Height"],
            desc = L["Reward Preview Height Desc"]:KAF_AddDefaultValueText("Achievements.RewardPreviewDefaultHeight"),
            min = 220, max = 700, step = 1,
            get = function() return addon.Options.db.profile.Achievements.RewardPreviewDefaultHeight end,
            set = RewardPreviewDefaultHeightSet
        }
    }
end

addon.Features.AddOptions("RewardPreview", {
    Defaults = {
        Achievements = {
            ShowRewardPreviewIcon = true,
            RewardPreviewMouseoverShow = false,
            RewardPreviewInvertVerticalRotation = false,
            RewardPreviewMaxIndividualIcons = 3,
            RewardPreviewDefaultWidth = 280,
            RewardPreviewDefaultHeight = 360
        }
    },
    Rows = Rows,
    -- Between Pop Out and Achievement guides in the Achievement window group (Options/Window/Map.lua)
    Section = {Id = "rewards", Name = L["Reward preview"], Card = L["Card Rewards"], CardPart = {X = 0, Y = 0.74}, NavGroup = "window", Order = 105}
})