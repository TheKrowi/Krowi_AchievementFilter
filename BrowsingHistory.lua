local _, addon = ...;
addon.BrowsingHistory = {};
local browsingHistory = addon.BrowsingHistory;

function browsingHistory:Load()
    KrowiAF_SavedData = KrowiAF_SavedData or {};
    KrowiAF_SavedData.BrowsingHistory = --[[KrowiAF_SavedData.BrowsingHistory or]] {};
    self.Index = #KrowiAF_SavedData.BrowsingHistory;
end

local lastAddedRecord, lock;
function browsingHistory:Add(category, achievement)
    if lock then
        lock = nil;
        return;
    end

    if not achievement then
        return;
    end

    if lastAddedRecord and lastAddedRecord.CategoryId == category.Id and lastAddedRecord.AchievementId == achievement.Id then
        return;
    end

    lastAddedRecord = {
        CategoryId = category.Id,
        AchievementId = achievement.Id
    };
    tinsert(KrowiAF_SavedData.BrowsingHistory, lastAddedRecord);
    self.Index = #KrowiAF_SavedData.BrowsingHistory;
end

function browsingHistory:GetMinIndex()
    return min(#KrowiAF_SavedData.BrowsingHistory, 1);
end

function browsingHistory:GetMaxIndex()
    return #KrowiAF_SavedData.BrowsingHistory;
end

function browsingHistory:GetCurrentIndex()
    return self.Index;
end

function browsingHistory:SetIndexOffset(historyOffset)
    self.Index = self.Index + historyOffset;
end

function browsingHistory:GetCurrentRecord()
    lock = true;
    return KrowiAF_SavedData.BrowsingHistory[self.Index];
end

function browsingHistory:Unlock()
    lock = nil;
end

function browsingHistory:GetAllRecords()
    return KrowiAF_SavedData.BrowsingHistory;
end

