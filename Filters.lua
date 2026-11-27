-- [[ Namespaces ]] --
local _, addon = ...
addon.Filters = {}
local filters = addon.Filters

local defaultAchievements = {
    Completion = {
        Completed = true,
        NotCompleted = true,
        AlwaysShowCompleted = false
    },
    Obtainability = {
        PastObtainable = true,
        CurrentObtainable = true,
        FutureObtainable = true
    },
    Faction = {
        Neutral = true,
        Alliance = false,
        Horde = false
    },
    HasReward = {
        Yes = true,
        No = true
    },
    RewardType = { --[[ Dynamically build via InjectDynamicRewardTypeFilters ]] },
    Special = {
        RealmFirst = false,
        FeatsOfStrength = true,
        PvP = true
    },
    CollapseSeries = true,
    Excluded = false,
    Tracking = false,
    SortBy = {
        Criteria = addon.L["Default"],
        ReverseSort = false
    },
    BuildVersion = { --[[ Dynamically build via KrowiAF.InjectDynamicBuildVersionFilters ]] }
}

local defaults = {
    profile = {
        MergeSmallCategories = true,
        EarnedBy = "Account",
        ShowPlaceholders = false
    }
}
-- The filters of a filter profile, one live table (docs/work/2026-11-25-settings-store): its default is filled by
-- InjectDefaults, before anything asks for it
addon.Settings.Declare("filters", {Kind = "object", System = "filters", Default = defaults.profile})

-- [[ Inject Defaults ]] --
local function InjectDynamicRewardTypeFilters()
    for _, rewardType in next, KrowiAF.Enum.RewardType do
        defaultAchievements.RewardType[rewardType] = true
    end
end

local function InjectAchievementDefaults()
    addon.Util.DeepCopyTable(defaultAchievements, defaults.profile)
end

local function InjectCategoryDefaults()
    local dflts = {}
    addon.Util.DeepCopyTable(defaultAchievements, dflts)
    addon.Util.WriteNestedKeys(defaults.profile, {"CurrentZone"}, dflts)
    addon.Util.DeepCopyTable(defaultAchievements, dflts)
    addon.Util.WriteNestedKeys(defaults.profile, {"SelectedZone"}, dflts)
    addon.Util.DeepCopyTable(defaultAchievements, dflts)
    addon.Util.WriteNestedKeys(defaults.profile, {"TrackingAchievements"}, dflts)
    defaults.profile.TrackingAchievements.Tracking = true
end

local function InjectTabDefaults()
    local tabsFilters = {}
    for t, _ in next, addon.Tabs do
        tabsFilters[t] = {}
        addon.Util.DeepCopyTable(defaultAchievements, tabsFilters[t])
    end
    addon.Util.WriteNestedKeys(defaults.profile, {"Tabs"}, tabsFilters)
end

function filters:InjectDefaults()
    KrowiAF.GroupBuildVersions()
    KrowiAF.InjectDynamicBuildVersionFilters(defaultAchievements.BuildVersion)
    InjectDynamicRewardTypeFilters()
    InjectAchievementDefaults()
    InjectCategoryDefaults()
    InjectTabDefaults()
end

local function ResetFactionFilters(tbl)
    addon.Util.WriteNestedKeys(tbl, {"Neutral"}, true)
    addon.Util.WriteNestedKeys(tbl, {"Alliance"}, addon.Faction.IsAlliance)
    addon.Util.WriteNestedKeys(tbl, {"Horde"}, addon.Faction.IsHorde)
end

function filters:ResetFilters()
    if addon.Settings.Get("filtering.resetFactionFilters") then
        local profile = addon.Settings.GetObject("filters")
        ResetFactionFilters(profile.Faction)
        ResetFactionFilters(profile.CurrentZone.Faction)
        ResetFactionFilters(profile.SelectedZone.Faction)
        ResetFactionFilters(profile.TrackingAchievements.Faction)
        for t, _ in next, addon.Tabs do
            ResetFactionFilters(profile.Tabs[t].Faction)
        end
    end
end

-- Every tab's filters on the current filter profile's; the search toggles follow that profile too, so the search
-- results are made again (docs/work/2026-11-25-settings-store, requirement 8)
function filters:RefreshFilters()
    local profile = addon.Settings.GetObject("filters")
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = profile.Tabs[t]
    end
    addon.SearchOptions.Changed = true
end

-- At the options' load (Options/Profiles.lua), once the filters' defaults are in (InjectDefaults)
function filters:Load()
    addon.Settings.OnProfileChanged("filters", function() filters:RefreshFilters() end)

    local profile = addon.Settings.GetObject("filters")
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = profile.Tabs[t]
    end

    self.Account = addon.L["Account"]
    self.CharacterAccount = (GetCategoryInfo(92)) .. " / " .. self.Account
    self.CharacterOnly = addon.L["Character only"]
end

-- [[ Validation ]] --
local achievementInfoCache
local validations = {
    {   -- 1
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Completion.Completed and achievementInfoCache.IsCompleted; end
    },
    {   -- 2
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Completion.NotCompleted and not achievementInfoCache.IsCompleted; end
    },
    {   -- 3
        Validate = function(_filters, achievement, ignoreFilters)
            if _filters.Obtainability.CurrentObtainable then
                return
            end
            local state = achievement:GetObtainableState()
            return state == "Current"
        end
    },
    {   -- 4
        Validate = function(_filters, achievement, ignoreFilters)
            if _filters.Obtainability.PastObtainable then
                return
            end
            local state = achievement:GetObtainableState()
            return state == "Past"
        end
    },
    {   -- 5
        Validate = function(_filters, achievement, ignoreFilters)
            if _filters.Obtainability.FutureObtainable then
                return
            end
            local state = achievement:GetObtainableState()
            return state == "Future"
        end
    },
    {   -- 6
        Validate = function(_filters, achievement, ignoreFilters)
            if not achievementInfoCache.HasReward then
                return
            end

            if not _filters.HasReward.Yes then
                return true
            end

            local rewardType = achievement.RewardType
            if rewardType then
                for _, rType in next, rewardType do
                    if _filters.RewardType[rType] then
                        return false
                    end
                end
                return true
            end

            return not _filters.RewardType[KrowiAF.Enum.RewardType.NotCategorized]
        end
    },
    {   -- 7
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.HasReward.No and not achievementInfoCache.HasReward; end
    },
    {   -- 8
        Validate = function(_filters, achievement, ignoreFilters)
            if ignoreFilters.FactionFilter then
                return false
            end
            return not _filters.Faction.Neutral and achievement.Faction == nil
        end
    },
    {   -- 9
        Validate = function(_filters, achievement, ignoreFilters)
            if ignoreFilters.FactionFilter then
                return false
            end
            return not _filters.Faction.Alliance and achievement.Faction == KrowiAF.Enum.Faction.Alliance
        end
    },
    {   -- 10
        Validate = function(_filters, achievement, ignoreFilters)
            if ignoreFilters.FactionFilter then
                return false
            end
            return not _filters.Faction.Horde and achievement.Faction == KrowiAF.Enum.Faction.Horde
        end
    },
    {   -- 11
        Validate = function(_filters, achievement, ignoreFilters)
            if _filters.CollapseSeries and ignoreFilters.CollapsedChainFilter ~= true then
                local _, nextCompleted = addon.GetNextAchievement(achievement)
                if nextCompleted then
                    return true
                end
                local prevID = addon.GetPreviousAchievement(achievement.Id)
                if prevID ~= nil then
                    local _, _, _, prevCompleted = addon.GetAchievementInfo(prevID)
                    if not prevCompleted then
                        return true
                    end
                end
            end
            return false
        end
    },
    {   -- 12
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Excluded and achievement.IsExcluded end
    },
    {   -- 13
        Validate = function(_filters, achievement, ignoreFilters)
            if not addon.Settings.Get("advanced.placeholdersFilter") and achievement.DoesNotExist then
                return true
            end
            return not addon.Settings.GetObject("filters").ShowPlaceholders and achievement.DoesNotExist
        end
    },
    {   -- 14
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Special.RealmFirst and achievement.IsRealmFirst; end
    },
    {   -- 15
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Special.FeatsOfStrength and achievementInfoCache.Points == 0 and not achievement.IsRealmFirst and not achievement.IsTracking; end
    },
    {   -- 16
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Tracking and achievement.IsTracking; end
    },
    {   -- 17
        Validate = function(_filters, achievement, ignoreFilters) return not _filters.Special.PvP and achievement.IsPvP; end
    },
    {   -- 18
        Validate = function(_filters, achievement, ignoreFilters)
            if not achievement.BuildVersion then
                return false
            end
            return not _filters.BuildVersion[achievement.BuildVersion.Id]
        end
    },
}

function filters.Validate(_filters, achievement, ignoreFilters, ignoreCollapseSeries)
    if _filters.Ignore then
        return 3
    end
    if achievement.AlwaysVisible then
        return 2
    end
    achievementInfoCache = addon.GetAchievementInfoTable(achievement.Id)
    if addon.Settings.GetObject("filters").EarnedBy == 'CharacterOnly' then
        achievementInfoCache.IsCompleted = achievementInfoCache.WasEarnedByMe
    end
    ignoreFilters = ignoreFilters or {}
    ignoreFilters.CollapsedChainFilter = ignoreFilters.CollapsedChainFilter or ignoreCollapseSeries
    if _filters.Completion.AlwaysShowCompleted and achievementInfoCache.IsCompleted then
        return 4 -- Special filter that overwrites the rest
    end
    for i, validation in next, validations do
        if validation.Validate(_filters, achievement, ignoreFilters) then -- If true, DO NOT show achievement
            return -i
        end
    end
    return 1
end

function filters:AutoValidate(achievement, ignoreFilters, ignoreCollapseSeries)
    return self.Validate(self:GetFilters(), achievement, ignoreFilters, ignoreCollapseSeries)
end

function filters:GetFilters(category)
    local profile = addon.Settings.GetObject("filters")
    profile.Ignore = nil

    if addon.Gui.SelectedTab == nil then
        local categoriesTree = category:GetTree()

        local tab = addon.Tabs[categoriesTree[1].Name]
        if tab == nil then
            return profile
        end

        local filters2 = addon.Tabs[categoriesTree[1].Name].Filters
        if filters2 then
            return filters2
        end

        return profile
    end

    if category == nil then
        category = addon.Gui.SelectedTab.SelectedCategory
    end

	if category.IsCurrentZone then
		return profile.CurrentZone
	elseif category.IsSelectedZone then
		return profile.SelectedZone
	elseif category.IsWatchList then
        profile.Ignore = addon.Settings.Get("categories.watchList.ignoreFilters")
        return profile
    elseif category.IsTracking then
        return profile.TrackingAchievements
    elseif addon.Gui.SelectedTab.Filters ~= nil then
        return addon.Gui.SelectedTab.Filters
	end

    return profile
end

function filters.GetHighestAchievementWhenCollapseSeries(_fliters, achievement)
    if not achievement then
        return
    end

    if _fliters.CollapseSeries then
		local nextAchievement, completed = addon.GetNextAchievement(achievement)
		if nextAchievement and completed then
			local newAchievement
			while nextAchievement and completed do
				newAchievement, completed = addon.GetNextAchievement(nextAchievement)
				if newAchievement and completed then
					nextAchievement = newAchievement
				end
			end
			achievement = nextAchievement
		end
	end

    return achievement
end

local function CompareName(a, b, reverse, default)
    local nameA, nameB = "", ""
    if a then
        nameA = addon.GetAchievmentName(a.Id)
    end
    if b then
        nameB = addon.GetAchievmentName(b.Id)
    end

    if nameA == nil then
        return false
    end
    if nameB == nil then
        return true
    end

    local nameAlower, nameBlower = nameA:lower(), nameB:lower()
    if nameAlower == nameBlower then
        if reverse then
            return default[a] > default[b]
        end
        return default[a] < default[b]
    end

    if reverse then
        return nameAlower > nameBlower
    end
    return nameAlower < nameBlower
end

local function CompareCompletion(a, b, reverse, default)
    local completedA, completedB = false, false
    if a then
        completedA = select(4, addon.GetAchievementInfo(a.Id))
    end
    if b then
        completedB = select(4, addon.GetAchievementInfo(b.Id))
    end

    if completedA == completedB then
        if reverse then
            return default[a] > default[b]
        end
        return default[a] < default[b]
    end

    if reverse then
        return completedB
    end
    return completedA
end

local function CompareId(a, b, reverse, default)
    if reverse then
        return a.Id > b.Id
    end
    return a.Id < b.Id
end

local function ComparePoints(a, b, reverse, default)
    local pointsA, pointsB = false, false
    if a then
        pointsA = select(3, addon.GetAchievementInfo(a.Id))
        if addon.GetPreviousAchievement(a.Id) and pointsA > 0 then
            pointsA = AchievementButton_GetProgressivePoints(a.Id)
        end
    end
    if b then
        pointsB = select(3, addon.GetAchievementInfo(b.Id))
        if addon.GetPreviousAchievement(b.Id) and pointsB > 0 then
            pointsB = AchievementButton_GetProgressivePoints(b.Id)
        end
    end

    if pointsA == pointsB then
        if reverse then
            return default[a] > default[b]
        end
        return default[a] < default[b]
    end

    if reverse then
        return pointsA > pointsB
    end
    return pointsA < pointsB
end

function filters:Sort(achievements, defaultOrder)
	local filters2 = self:GetFilters()
	local criteria = filters2.SortBy.Criteria
	local reverse = filters2.SortBy.ReverseSort

    local sortFunc
    if criteria == "Name" then
        sortFunc = CompareName
	elseif criteria == "Completion" then
        sortFunc = CompareCompletion
	elseif criteria == "ID" then
        sortFunc = CompareId
	elseif criteria == "Points" then
        sortFunc = ComparePoints
	else -- criteria == "Default"
        if reverse then
			local tmpTbl = {}
			for i = #achievements, 1, -1 do
				tinsert(tmpTbl, achievements[i])
			end
			return tmpTbl
		end
        return achievements
	end

    table.sort(achievements, function(a, b)
        return sortFunc(a, b, reverse, defaultOrder)
    end)
    return achievements
end