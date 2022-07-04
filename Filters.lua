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
    CollapseSeries = true,
    Excluded = false,
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
    addon.Util.WriteNestedKeys(defaults.profile, {"ExcludedCategory"}, dflts);
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
        ResetFactionFilters(self.db.ExcludedCategory.Faction);
        for t, _ in next, addon.Tabs do
            ResetFactionFilters(self.db.Tabs[t].Faction);
        end
    end
end

function filters:Load()
    local _filters = LibStub("AceDB-3.0"):New("Filters", defaults, true);
    filters.db = _filters.profile;
    for t, _ in next, addon.Tabs do
        addon.Tabs[t].Filters = _filters.profile.Tabs[t];
    end
end

-- [[ Validation ]] --
local completedCache, ignoreCollapseSeriesCache;
local validations = {
    {   -- 1
        Validate = function(_filters, achievement) return not _filters.Completion.Completed and completedCache; end,
        SetFilter = function(_filters) _filters.Completion.Completed = not _filters.Completion.Completed; end
    },
    {   -- 2
        Validate = function(_filters, achievement) return not _filters.Completion.NotCompleted and not completedCache; end,
        SetFilter = function(_filters) _filters.Completion.NotCompleted = not _filters.Completion.NotCompleted; end
    },
    {   -- 3
        Validate = function(_filters, achievement) return not _filters.Obtainability.Obtainable and achievement.NotObtainable == nil; end,
        SetFilter = function(_filters) _filters.Obtainability.Obtainable = not _filters.Obtainability.Obtainable; end
    },
    {   -- 4
        Validate = function(_filters, achievement) return not _filters.Obtainability.NotObtainable and achievement.NotObtainable; end,
        SetFilter = function(_filters) _filters.Obtainability.NotObtainable = not _filters.Obtainability.NotObtainable; end
    },
    {   -- 5
        Validate = function(_filters, achievement) return not _filters.Faction.Neutral and achievement.Faction == nil; end,
        SetFilter = function(_filters) _filters.Faction.Neutral = not _filters.Faction.Neutral; end
    },
    {   -- 6
        Validate = function(_filters, achievement) return not _filters.Faction.Alliance and achievement.Faction == addon.Objects.Faction.Alliance; end,
        SetFilter = function(_filters) _filters.Faction.Alliance = not _filters.Faction.Alliance; end
    },
    {   -- 7
        Validate = function(_filters, achievement) return not _filters.Faction.Horde and achievement.Faction == addon.Objects.Faction.Horde; end,
        SetFilter = function(_filters) _filters.Faction.Horde = not _filters.Faction.Horde end
    },
    {   -- 8
        Validate = function(_filters, achievement)
            if _filters.CollapseSeries and ignoreCollapseSeriesCache ~= true then
                local _, nextCompleted = addon.GetNextAchievement(achievement);
                if nextCompleted then
                    return true;
                end
                local prevID = GetPreviousAchievement(achievement.ID);
                if prevID ~= nil then
                    local _, _, _, prevCompleted = addon.GetAchievementInfo(prevID);
                    if not prevCompleted then
                        return true;
                    end
                end
            end
            return false;
        end,
        SetFilter = function(_filters) _filters.CollapseSeries = not _filters.CollapseSeries end
    },
    {   -- 9
        Validate = function(_filters, achievement) return not _filters.Excluded and achievement.Excluded end,
        SetFilter = function(_filters) _filters.Excluded = not _filters.Excluded; end
    },
    {   -- 10
        Validate = function(_filters, achievement)
            if not addon.Options.db.ShowPlaceholdersFilter and achievement.DoesNotExist then
                return true;
            end
            return not filters.db.ShowPlaceholders and achievement.DoesNotExist;
        end,
        SetFilter = function(_filters) end
    }
};

function filters.Validate(_filters, achievement, ignoreCollapseSeries)

    _, _, _, completedCache = addon.GetAchievementInfo(achievement.ID);
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

function filters:SetFilters(_filters, achievement)
    local iterations = 0;
    while true do
        local id = self.Validate(_filters, achievement);
        if id == 1 then
            if iterations > 0 then -- If 0, nothing changed so no need to update
                _filters.Refresh = true;
                addon.GUI.FilterButton.UpdateAchievementFrame();
            end
            return; -- Jump out of loop
        else
            validations[-id].SetFilter(_filters);
        end

        iterations = iterations + 1;
    end
end

function filters:GetFilters(category)
    if category == nil then
        category = addon.GUI.SelectedTab.SelectedCategory;
    end

	if category == addon.Data.CurrentZoneCategory then
		return self.db.CurrentZone;
	elseif category == addon.Data.SelectedZoneCategory then
		return self.db.SelectedZone;
	elseif category == addon.Data.ExcludedCategory or (category ~= nil and category.Excluded) then
		return self.db.ExcludedCategory;
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
        nameA = select(2, GetAchievementInfo(a.ID));
    end
    if b then
        nameB = select(2, GetAchievementInfo(b.ID));
    end

    if nameA == nil then
        return false;
    end
    if nameB == nil then
        return true;
    end

    if nameA == nameB then
        if reverse then
            return default[a] > default[b];
        end
        return default[a] < default[b];
    end

    if reverse then
        return nameA:lower() > nameB:lower();
    end
    return nameA:lower() < nameB:lower();
end

local function CompareCompletion(a, b, reverse, default)
    local completedA, completedB = false, false;
    if a then
        completedA = select(4, GetAchievementInfo(a.ID));
    end
    if b then
        completedB = select(4, GetAchievementInfo(b.ID));
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
        return a.ID > b.ID
    end
    return a.ID < b.ID;
end

function filters:Sort(achievements, defaultOrder)
	local _filters = self:GetFilters();
	local criteria = _filters.SortBy.Criteria;
	local reverse = _filters.SortBy.ReverseSort;

    local sortFun;
    if criteria == addon.L["Name"] then
        sortFun = CompareName;
	elseif criteria == addon.L["Completion"] then
        sortFun = CompareCompletion;
	elseif criteria == addon.L["ID"] then
        sortFun = CompareId;
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
        return sortFun(a, b, reverse, defaultOrder);
    end);
    return achievements;
end