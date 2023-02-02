-- [[ Namespaces ]] --
local _, addon = ...;
addon.Filters = {};
local filters = addon.Filters;

local defaultAchievements = {
    Completion = {
        Completed = true,
        NotCompleted = true
    },
    Obtainability = {
        Obtainable = true,
        NotObtainable = false
    },
    Faction = {
        Neutral = true,
        Alliance = false,
        Horde = false
    },
    Special = {
        RealmFirst = false,
        FeatsOfStrength = true
    },
    CollapseSeries = true,
    Excluded = false,
    Tracking = false,
    SortBy = {
        Criteria = addon.L["Default"],
        ReverseSort = false
    }
};

local defaults = {
    profile = {
        MergeSmallCategories = true,
        EarnedBy = "Account",
        ShowPlaceholders = false
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
    if addon.Options.db.Filters.ResetFactionFilters then
        ResetFactionFilters(self.db.Faction);
        ResetFactionFilters(self.db.CurrentZone.Faction);
        ResetFactionFilters(self.db.SelectedZone.Faction);
        ResetFactionFilters(self.db.TrackingAchievements.Faction);
        for t, _ in next, addon.Tabs do
            ResetFactionFilters(self.db.Tabs[t].Faction);
        end
    end
end

function filters:Load()
    local filters2 = LibStub("AceDB-3.0"):New("Filters", defaults, true);
    self.db = filters2.profile;
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = filters2.profile.Tabs[t];
    end

    self.Account = addon.L["Account"];
    self.CharacterAccount = (GetCategoryInfo(92)) .. " / " .. self.Account;
    self.CharacterOnly = addon.L["Character only"];
end

-- [[ Validation ]] --
local completedCache, ignoreCollapseSeriesCache;
local validations = {
    {   -- 1
        Validate = function(_filters, achievement) return not _filters.Completion.Completed and completedCache; end
    },
    {   -- 2
        Validate = function(_filters, achievement) return not _filters.Completion.NotCompleted and not completedCache; end
    },
    {   -- 3
        Validate = function(_filters, achievement)
            if _filters.Obtainability.Obtainable then
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
            if _filters.Obtainability.NotObtainable then
                return;
            end
            if achievement.TemporaryObtainable then
                local state = achievement.TemporaryObtainable.Obtainable();
                return state == false or state == "Past" or state == "Future";
            end
            return;
        end
    },
    {   -- 5
        Validate = function(_filters, achievement) return not _filters.Faction.Neutral and achievement.Faction == nil; end
    },
    {   -- 6
        Validate = function(_filters, achievement) return not _filters.Faction.Alliance and achievement.Faction == addon.Objects.Faction.Alliance; end
    },
    {   -- 7
        Validate = function(_filters, achievement) return not _filters.Faction.Horde and achievement.Faction == addon.Objects.Faction.Horde; end
    },
    {   -- 8
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
    {   -- 9
        Validate = function(_filters, achievement) return not _filters.Excluded and achievement.IsExcluded end
    },
    {   -- 10
        Validate = function(_filters, achievement)
            if not addon.Options.db.ShowPlaceholdersFilter and achievement.DoesNotExist then
                return true;
            end
            return not filters.db.ShowPlaceholders and achievement.DoesNotExist;
        end
    },
    {   -- 11
        Validate = function(_filters, achievement) return not _filters.Special.RealmFirst and achievement.IsRealmFirst; end
    },
    {   -- 12
        Validate = function(_filters, achievement) return not _filters.Special.FeatsOfStrength and achievement.Points == 0 and not achievement.IsRealmFirst and not achievement.IsTracking; end
    },
    {   -- 13
        Validate = function(_filters, achievement) return not _filters.Tracking and achievement.IsTracking; end
    }
};

function filters.Validate(_filters, achievement, ignoreCollapseSeries)
    if achievement.AlwaysVisible then
        return 2;
    end
    local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = addon.GetAchievementInfo(achievement.Id);
    if addon.Filters.db.EarnedBy == addon.Filters.CharacterOnly then
        completedCache = wasEarnedByMe;
    else
        completedCache = completed;
    end
    ignoreCollapseSeriesCache = ignoreCollapseSeries;
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
    if addon.GUI.SelectedTab == nil then
        local categoriesTree = category:GetTree();

        local tab = addon.Tabs[categoriesTree[1].Name];
        if tab == nil then
            return self.db;
        end

        local filters2 = addon.Tabs[categoriesTree[1].Name].Filters;
        if filters2 then
            return filters2;
        end

        return self.db;
    end

    if category == nil then
        category = addon.GUI.SelectedTab.SelectedCategory;
    end

	if category.IsCurrentZone then
		return self.db.CurrentZone;
	elseif category.IsSelectedZone then
		return self.db.SelectedZone;
    elseif category.IsTracking then
        return self.db.TrackingAchievements;
    elseif addon.GUI.SelectedTab.Filters ~= nil then
        return addon.GUI.SelectedTab.Filters;
	end

    return self.db;
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