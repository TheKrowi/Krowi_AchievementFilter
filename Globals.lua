local addonName, addon = ...

local customPreviousAchievements = {}
customPreviousAchievements[15664] = 15663
customPreviousAchievements[15665] = 15664
customPreviousAchievements[15668] = 15667
customPreviousAchievements[15669] = 15668

function addon.GetPreviousAchievement(achievementId)
    if customPreviousAchievements[achievementId] then
        return customPreviousAchievements[achievementId]
    end
    return GetPreviousAchievement(achievementId)
end

function addon.GetFirstAchievementId(id)
    local firstId
	while id do
		firstId = id
		id = addon.GetPreviousAchievement(id)
	end
    return firstId
end

function addon.InGuildView()
    return AchievementFrame.Header.Title:GetText() == GUILD_ACHIEVEMENTS_TITLE
end

function addon.GetActiveCovenant()
    return C_Covenants.GetActiveCovenantID() + 1 -- 1 offset since Covenant Enum is 1 based (lua) and Covenant Database Table 0 based
end

function addon.GetAchievementsInZone(mapID, getAll)
    addon.Diagnostics.Trace("addon.GetAchievementsInZone")

    -- Differentiate between 10 and 25 man raids and Normal and Heroic raids
    local player10 = GetDifficultyInfo(3) -- 10 player
    local player10Hc = GetDifficultyInfo(5) -- 10 player
    local player25 = GetDifficultyInfo(4) -- 25 player
    local player25Hc = GetDifficultyInfo(6) -- 25 player
    local _, _, _, difficulty = GetInstanceInfo()

    local achievements = {}
    if addon.Data.Maps[mapID] == nil then
        return achievements
    else
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements)
    end

    if difficulty ~= "" then -- Need to add 10 and 25 when doing it from the map
        if difficulty == player10 or difficulty == player10Hc then
            addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements10)
        elseif difficulty == player25 or difficulty == player25Hc then
            addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements25)
        end
    elseif getAll then
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements10)
        addon.Util.ConcatTables(achievements, addon.Data.Maps[mapID].Achievements25)
    end

    return achievements
end

function addon.GetAchievementNumbers(_filters, achievement, numOfAch, numOfCompAch, numOfNotObtAch, ignoreFilters) -- , numOfIncompAch
    if achievement.AlwaysVisible then
        return numOfAch, numOfCompAch, numOfNotObtAch -- , numOfIncompAch
    end
    local filters = addon.Filters
	if filters and filters.Validate(_filters, achievement, ignoreFilters, true) > 0 then -- If set to false we lag the game
		numOfAch = numOfAch + 1
		local _, _, _, completed = addon.GetAchievementInfo(achievement.Id)
        local state = achievement:GetObtainableState()
		if completed then
			numOfCompAch = numOfCompAch + 1
		-- else
		-- 	numOfIncompAch = numOfIncompAch + 1;
        elseif state == "Past" or state == "Future" then
			numOfNotObtAch = numOfNotObtAch + 1
		end
	end

	return numOfAch, numOfCompAch, numOfNotObtAch -- , numOfIncompAch
end

function addon.GetSecondsSince(date)
    date.day = date.monthDay
    date.monthDay = nil
    date.wday = date.weekday
    date.weekday = nil
    date.min = date.minute
    date.minute = nil
    return time(date)
end

function addon.GetAchievmentName(achievementId)
    local _, name = GetAchievementInfo(achievementId)
    return name
end

function addon.GetAchievementInfo(achievementId) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic = GetAchievementInfo(achievementId)
    if not id then
        flags = addon.Objects.Flags:New(0)
        return achievementId, " * Placeholder for " .. achievementId .. " * ", 0, false, nil, nil, nil,
        " * This is the placeholder for " .. achievementId .. " until it's available next patch.", flags, 134400, "", false, false, "", false, false
    end
    flags = addon.Objects.Flags:New(flags)
    -- if id == 18849 or id == 18850 then
    --     flags.IsTracking = true;
    -- end
    -- if addon.Options.db.profile.Achievements.ShowOtherFactionWarbandAsCompleted then
	-- 	if flags.IsAccountWide and KrowiAF_Achievements.Completed[achievementId] and KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn then
	-- 		local date = date("*t", KrowiAF_Achievements.Completed[achievementId].FirstCompletedOn);
	-- 		completed = true;
	-- 		month = date.month;
	-- 		day = date.day;
	-- 		year = date.year - 2000;
	-- 		wasEarnedByMe = true;
	-- 	end
	-- end
    return id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic, true
end

function addon.GetAchievementInfoTable(achievementId) -- Returns an additional bool indicating if the achievement is added to the game yet or not
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe, earnedBy, isStatistic, exists = addon.GetAchievementInfo(achievementId)
    return {
        Id = id,
        Name = name,
        Points = points,
        IsCompleted = completed,
        DateTime = {
            Year = year,
            Month = month,
            Day = day
        },
        Description = description,
        Flags = flags,
        Icon = icon,
        HasReward = rewardText ~= "",
        RewardText = rewardText,
        IsGuild = isGuild,
        WasEarnedByMe = wasEarnedByMe,
        EarnedBy = earnedBy,
        IsStatistic = isStatistic,
        Exists = exists
    }
end

-- Custom criteria used to be applied by overriding the Blizzard globals, which tainted anything
-- reading them; our own rendering paths call these wrappers instead
function addon.GetAchievementNumCriteria(achievementId)
    local achievement = addon.Data.Achievements[achievementId]
    if achievement and achievement.GetCustomCriteria then
        return achievement.GetCustomCriteria()
    end
    return GetAchievementNumCriteria(achievementId)
end

function addon.GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden)
    local achievement = addon.Data.Achievements[achievementId]
    if achievement and achievement.GetCustomCriteria then
        return achievement.GetCustomCriteria(criteriaIndex)
    end
    return GetAchievementCriteriaInfo(achievementId, criteriaIndex, countHidden)
end

SLASH_KAFMV1 = "/kafmapverify"
SlashCmdList["KAFMV"] = function()
    addon.Gui.MapVerifier.Open()
end

SLASH_KAFAIT1 = "/kafait"
SlashCmdList["KAFAIT"] = function(msg)
    local achievementId = tonumber(msg)
    if not achievementId then
        print("Usage: /kafait <achievementId>")
        return
    end
    local info = addon.GetAchievementInfoTable(achievementId)
    if info then
        for k, v in pairs(info) do
            if type(v) == "table" then
                print(k .. ":", "{table}")
                for tk, tv in pairs(v) do
                    print("  " .. tk .. ":", tv)
                end
            else
                print(k .. ":", tostring(v))
            end
        end
    else
        print("No info found for achievementId:", achievementId)
    end
end

function addon.GetNextAchievement(achievement)
    if achievement.NextAchievements then
        for _, nextAchievement in next, achievement.NextAchievements do
            local _, _, _, completed, _, _, _, _, _, _, _, _, _, earnedBy, _ = addon.GetAchievementInfo(nextAchievement.Id)
            if earnedBy ~= nil then -- Will be nil if the achievement is for the other faction
                return nextAchievement, completed
            end
        end
    end
    return nil, false
end

local function CheckDecFlags(flags, flag)
    return (flags / flag) % 2 >= 1
end

local function ClassCanUseSet(setInfo, classId)
    return CheckDecFlags(setInfo.classMask, math.pow(2, classId - 1))
end

local function FactionCanUseSet(setInfo, faction)
    return setInfo and (setInfo.requiredFaction == nil or setInfo.requiredFaction == faction)
end

function addon.GetUsableSets(transmogSetIds)
    local usableTransmogSetIds = {}
    local _, _, classId = UnitClass("player")
    local faction = UnitFactionGroup("player")
    for _, transmogSetId in next, transmogSetIds do
        local setInfo = C_TransmogSets.GetSetInfo(transmogSetId)
        if setInfo then
            if ClassCanUseSet(setInfo, classId) and FactionCanUseSet(setInfo, faction) then
                tinsert(usableTransmogSetIds, transmogSetId)
            end
        else
            addon.Diagnostics.Debug("No transmog info found for " .. transmogSetId)
        end
    end
    return usableTransmogSetIds
end

function addon.ChangeAchievementMicroButtonOnClick()
    addon.Gui:TabsOrderGetActiveKeys() -- Cleanup unused tabs
    if addon.Options.db.profile.MicroButtonTab > #KrowiAF_SavedData.Tabs then
        for i, _ in next, KrowiAF_SavedData.Tabs do
            if KrowiAF_SavedData.Tabs[i].AddonName == addonName and KrowiAF_SavedData.Tabs[i].Name == "Achievements" then
                addon.Options.db.profile.MicroButtonTab = i
            end
        end
    end
    local tab = KrowiAF_SavedData.Tabs[addon.Options.db.profile.MicroButtonTab]
    AchievementMicroButton:SetScript("OnClick", function(self)
        KrowiAF_ToggleAchievementFrame(tab.AddonName, tab.Name)
    end)
end

addon.Modifiers = {
    addon.L["None"],
    addon.L["Alt"],
    addon.L["Ctrl"],
    addon.L["Shift"],
    addon.L["Right Alt"],
    addon.L["Right Ctrl"],
    addon.L["Right Shift"],
    addon.L["Left Alt"],
    addon.L["Left Ctrl"],
    addon.L["Left Shift"]
}

function addon.IsCustomModifierKeyDown(modifier)
    if modifier == 1 then
        return
    elseif modifier == 2 then
        return IsAltKeyDown()
    elseif modifier == 3 then
        return IsControlKeyDown()
    elseif modifier == 4 then
        return IsShiftKeyDown()
    elseif modifier == 5 then
        return IsRightAltKeyDown()
    elseif modifier == 6 then
        return IsRightControlKeyDown()
    elseif modifier == 7 then
        return IsRightShiftKeyDown()
    elseif modifier == 8 then
        return IsLeftAltKeyDown()
    elseif modifier == 9 then
        return IsLeftControlKeyDown()
    elseif modifier == 10 then
        return IsLeftShiftKeyDown()
    end
end

addon.MonthNames = {
    addon.L["January"],
    addon.L["February"],
    addon.L["March"],
    addon.L["April"],
    addon.L["May"],
    addon.L["June"],
    addon.L["July"],
    addon.L["August"],
    addon.L["September"],
    addon.L["October"],
    addon.L["November"],
    addon.L["December"]
}

addon.WeekdayNames = {
	addon.L["Sunday"],
    addon.L["Monday"],
    addon.L["Tuesday"],
    addon.L["Wednesday"],
    addon.L["Thursday"],
    addon.L["Friday"],
    addon.L["Saturday"]
}