-- [[ Namespaces ]] --
local _, addon = ...;
addon.Filters = {};
local filters = addon.Filters;

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
    BuildVersion = { --[[ Dynamically build via addon.Data.ExportedBuildVersions.InjectDynamicFilters ]] },
};

local defaults = {
    profile = {
        MergeSmallCategories = true,
        EarnedBy = "Account",
        ShowPlaceholders = false,
        ContentMode = {
            RemixPandaria = false
        }
    }
};

-- [[ Inject Defaults ]] --
local function InjectAchievementDefaults()
    addon.Util.DeepCopyTable(defaultAchievements, defaults.profile);
end

local function InjectCategoryDefaults()
    local dflts = {};
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"CurrentZone"}, dflts);
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"SelectedZone"}, dflts);
    addon.Util.DeepCopyTable(defaultAchievements, dflts);
    addon.Util.WriteNestedKeys(defaults.profile, {"TrackingAchievements"}, dflts);
    defaults.profile.TrackingAchievements.Tracking = true;
end

local function InjectTabDefaults()
    local tabsFilters = {};
    for t, _ in next, addon.Tabs do
        tabsFilters[t] = {};
        addon.Util.DeepCopyTable(defaultAchievements, tabsFilters[t]);
    end
    addon.Util.WriteNestedKeys(defaults.profile, {"Tabs"}, tabsFilters);
end

function filters:InjectDefaults()
    addon.Data.BuildVersionsGrouped = addon.Data.ExportedBuildVersions:InjectDynamicFilters(defaultAchievements.BuildVersion);
    InjectAchievementDefaults();
    InjectCategoryDefaults();
    InjectTabDefaults();
end

local function ResetFactionFilters(tbl)
    addon.Util.WriteNestedKeys(tbl, {"Neutral"}, true);
    addon.Util.WriteNestedKeys(tbl, {"Alliance"}, addon.Faction.IsAlliance);
    addon.Util.WriteNestedKeys(tbl, {"Horde"}, addon.Faction.IsHorde);
end

function filters:ResetFilters()
    if addon.Options.db.profile.Filters.ResetFactionFilters then
        ResetFactionFilters(self.db.profile.Faction);
        ResetFactionFilters(self.db.profile.CurrentZone.Faction);
        ResetFactionFilters(self.db.profile.SelectedZone.Faction);
        ResetFactionFilters(self.db.profile.TrackingAchievements.Faction);
        for t, _ in next, addon.Tabs do
            ResetFactionFilters(self.db.profile.Tabs[t].Faction);
        end
    end
end

function filters:RefreshFilters()
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = self.db.profile.Tabs[t];
    end
end

function filters:Load()
    self.db = LibStub("AceDB-3.0"):New("KrowiAF_Filters", defaults, true);
    self.db.RegisterCallback(self, "OnProfileChanged", "RefreshFilters");
    self.db.RegisterCallback(self, "OnProfileCopied", "RefreshFilters");
    self.db.RegisterCallback(self, "OnProfileReset", "RefreshFilters");

    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = self.db.profile.Tabs[t];
    end

    self.Account = addon.L["Account"];
    self.CharacterAccount = (GetCategoryInfo(92)) .. " / " .. self.Account;
    self.CharacterOnly = addon.L["Character only"];
end

-- [[ Validation ]] --
local completedCache, ignoreCollapseSeriesCache, pointsCache;
local validations = {
    {   -- 1
        Validate = function(_filters, achievement) return not _filters.Completion.Completed and completedCache; end
    },
    {   -- 2
        Validate = function(_filters, achievement) return not _filters.Completion.NotCompleted and not completedCache; end
    },
    {   -- 3
        Validate = function(_filters, achievement)
            if _filters.Obtainability.CurrentObtainable then
                return;
            end
            if achievement.TemporaryObtainable then
                local state = achievement.TemporaryObtainable.Obtainable();
                return state == true or state == "Current";
            end
            return true;
        end
    },
    {   -- 4
        Validate = function(_filters, achievement)
            if _filters.Obtainability.PastObtainable then
                return;
            end
            if achievement.TemporaryObtainable then
                local state = achievement.TemporaryObtainable.Obtainable();
                return state == true or state == "Past";
            end
        end
    },
    {   -- 5
        Validate = function(_filters, achievement)
            if _filters.Obtainability.FutureObtainable then
                return;
            end
            if achievement.TemporaryObtainable then
                local state = achievement.TemporaryObtainable.Obtainable();
                return state == true or state == "Future";
            end
        end
    },
    {   -- 6
        Validate = function(_filters, achievement) return not _filters.Faction.Neutral and achievement.Faction == nil; end
    },
    {   -- 7
        Validate = function(_filters, achievement) return not _filters.Faction.Alliance and achievement.Faction == addon.Objects.Faction.Alliance; end
    },
    {   -- 8
        Validate = function(_filters, achievement) return not _filters.Faction.Horde and achievement.Faction == addon.Objects.Faction.Horde; end
    },
    {   -- 9
        Validate = function(_filters, achievement)
            if _filters.CollapseSeries and ignoreCollapseSeriesCache ~= true then
                local _, nextCompleted = addon.GetNextAchievement(achievement);
                if nextCompleted then
                    return true;
                end
                local prevID = GetPreviousAchievement(achievement.Id);
                if prevID ~= nil then
                    local _, _, _, prevCompleted = addon.GetAchievementInfo(prevID);
                    if not prevCompleted then
                        return true;
                    end
                end
            end
            return false;
        end
    },
    {   -- 10
        Validate = function(_filters, achievement) return not _filters.Excluded and achievement.IsExcluded end
    },
    {   -- 11
        Validate = function(_filters, achievement)
            if not addon.Options.db.profile.ShowPlaceholdersFilter and achievement.DoesNotExist then
                return true;
            end
            return not filters.db.profile.ShowPlaceholders and achievement.DoesNotExist;
        end
    },
    {   -- 12
        Validate = function(_filters, achievement) return not _filters.Special.RealmFirst and achievement.IsRealmFirst; end
    },
    {   -- 13
        Validate = function(_filters, achievement) return not _filters.Special.FeatsOfStrength and pointsCache == 0 and not achievement.IsRealmFirst and not achievement.IsTracking; end
    },
    {   -- 14
        Validate = function(_filters, achievement) return not _filters.Tracking and achievement.IsTracking; end
    },
    {   -- 15
        Validate = function(_filters, achievement) return not _filters.Special.PvP and achievement.IsPvP; end
    },
    {   -- 16
        Validate = function(_filters, achievement)
            if not achievement.BuildVersion then
                return false;
            end
            return not _filters.BuildVersion[achievement.BuildVersion.Id];
        end
    },
    {   -- 17
        Validate = function(_filters, achievement)
            if not addon.IsRemixPandaria() or not filters.db.profile.ContentMode.RemixPandaria then
                return false;
            end
            if not achievement.TemporaryObtainable
            or not achievement.TemporaryObtainable.Start
            or achievement.TemporaryObtainable.Start.Function ~= "Event" then
                return true;
            end
            return achievement.TemporaryObtainable.Start.Value ~= "1514";
        end
    },
};

function filters.Validate(_filters, achievement, ignoreCollapseSeries)
    if _filters.Ignore then
        return 3;
    end
    if achievement.AlwaysVisible then
        return 2;
    end
    local _, _, points, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(achievement.Id);
    pointsCache = points;
    if addon.Filters.db.profile.EarnedBy == addon.Filters.CharacterOnly then
        completedCache = wasEarnedByMe;
    else
        completedCache = completed;
    end
    ignoreCollapseSeriesCache = ignoreCollapseSeries;
    if _filters.Completion.AlwaysShowCompleted and completedCache then
        return 4; -- Special filter that overwrites the rest
    end
    for i, validation in next, validations do
        if validation.Validate(_filters, achievement) then -- If true, DO NOT show achievement
            return -i;
        end
    end
    return 1;
end

function filters:AutoValidate(achievement, ignoreCollapseSeries)
    return self.Validate(self:GetFilters(), achievement, ignoreCollapseSeries);
end

function filters:GetFilters(category)
    self.db.profile.Ignore = nil;

    if addon.Gui.SelectedTab == nil then
        local categoriesTree = category:GetTree();

        local tab = addon.Tabs[categoriesTree[1].Name];
        if tab == nil then
            return self.db.profile;
        end

        local filters2 = addon.Tabs[categoriesTree[1].Name].Filters;
        if filters2 then
            return filters2;
        end

        return self.db.profile;
    end

    if category == nil then
        category = addon.Gui.SelectedTab.SelectedCategory;
    end

	if category.IsCurrentZone then
		return self.db.profile.CurrentZone;
	elseif category.IsSelectedZone then
		return self.db.profile.SelectedZone;
	elseif category.IsWatchList then
        self.db.profile.Ignore = addon.Options.db.profile.Categories.WatchList.IgnoreFilters;
        return self.db.profile;
    elseif category.IsTracking then
        return self.db.profile.TrackingAchievements;
    elseif addon.Gui.SelectedTab.Filters ~= nil then
        return addon.Gui.SelectedTab.Filters;
	end

    return self.db.profile;
end

function filters.GetHighestAchievementWhenCollapseSeries(_fliters, achievement)
    if not achievement then
        return;
    end

    if _fliters.CollapseSeries then
		local nextAchievement, completed = addon.GetNextAchievement(achievement);
		if nextAchievement and completed then
			local newAchievement;
			while nextAchievement and completed do
				newAchievement, completed = addon.GetNextAchievement(nextAchievement);
				if newAchievement and completed then
					nextAchievement = newAchievement;
				end
			end
			achievement = nextAchievement;
		end
	end

    return achievement;
end

local function CompareName(a, b, reverse, default)
    local nameA, nameB = "", "";
    if a then
        nameA = select(2, addon.GetAchievementInfo(a.Id));
    end
    if b then
        nameB = select(2, addon.GetAchievementInfo(b.Id));
    end

    if nameA == nil then
        return false;
    end
    if nameB == nil then
        return true;
    end

    local nameAlower, nameBlower = nameA:lower(), nameB:lower();
    if nameAlower == nameBlower then
        if reverse then
            return default[a] > default[b];
        end
        return default[a] < default[b];
    end

    if reverse then
        return nameAlower > nameBlower;
    end
    return nameAlower < nameBlower;
end

local function CompareCompletion(a, b, reverse, default)
    local completedA, completedB = false, false;
    if a then
        completedA = select(4, addon.GetAchievementInfo(a.Id));
    end
    if b then
        completedB = select(4, addon.GetAchievementInfo(b.Id));
    end

    if completedA == completedB then
        if reverse then
            return default[a] > default[b];
        end
        return default[a] < default[b];
    end

    if reverse then
        return completedB;
    end
    return completedA;
end

local function CompareId(a, b, reverse, default)
    if reverse then
        return a.Id > b.Id;
    end
    return a.Id < b.Id;
end

local function ComparePoints(a, b, reverse, default)
    local pointsA, pointsB = false, false;
    if a then
        pointsA = select(3, addon.GetAchievementInfo(a.Id));
        if GetPreviousAchievement(a.Id) and pointsA > 0 then
            pointsA = AchievementButton_GetProgressivePoints(a.Id);
        end
    end
    if b then
        pointsB = select(3, addon.GetAchievementInfo(b.Id));
        if GetPreviousAchievement(b.Id) and pointsB > 0 then
            pointsB = AchievementButton_GetProgressivePoints(b.Id);
        end
    end

    if pointsA == pointsB then
        if reverse then
            return default[a] > default[b];
        end
        return default[a] < default[b];
    end

    if reverse then
        return pointsA > pointsB;
    end
    return pointsA < pointsB;
end

function filters:Sort(achievements, defaultOrder)
	local filters2 = self:GetFilters();
	local criteria = filters2.SortBy.Criteria;
	local reverse = filters2.SortBy.ReverseSort;

    local sortFunc;
    if criteria == addon.L["Name"] then
        sortFunc = CompareName;
	elseif criteria == addon.L["Completion"] then
        sortFunc = CompareCompletion;
	elseif criteria == addon.L["ID"] then
        sortFunc = CompareId;
	elseif criteria == addon.L["Points"] then
        sortFunc = ComparePoints;
	else -- criteria == addon.L["Default"]
        if reverse then
			local tmpTbl = {};
			for i = #achievements, 1, -1 do
				tinsert(tmpTbl, achievements[i]);
			end
			return tmpTbl;
		end
        return achievements;
	end

    table.sort(achievements, function(a, b)
        return sortFunc(a, b, reverse, defaultOrder);
    end);
    return achievements;
end