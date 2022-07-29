-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_SummaryFrameMixin = {};

function KrowiAF_SummaryFrameMixin:Update(event)
    self:CategoriesStatusBar_Update(event);
    self:Achievements_Update(event);
end

function KrowiAF_SummaryFrameMixin:CategoriesStatusBar_Update(event)
    local selectedTab = addon.GUI.SelectedTab;
    if not selectedTab then
        return;
    end

    if event == "ACHIEVEMENT_EARNED" then -- Update it here instead of in the categories frame itself to make sure the summary is updated with the correct numbers
        addon.GUI.CategoriesFrame:Update(true);
    end
    local totalStatusBar = self.TotalStatusBar;
    local lastShown = totalStatusBar;
    local offset = 0;
    local totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = 0, 0, 0;
    local categories = selectedTab.Categories;
    local showNotObtainable = addon.Options.db.Tooltip.Categories.ShowNotObtainable;
    local statusBars = self.StatusBars;
    for i = 1, #statusBars do
        local category = categories[i + offset];
        while category and (category.IsSummary or category.HasFlexibleData or category.NumOfAch == 0) do
            offset = offset + 1;
            category = categories[i + offset];
        end
		local statusBar = statusBars[i];
		if category then
			statusBar.TextLeft:SetText(category.Name);
			statusBar.Button.Category = category;
            if category.NumOfAch == nil or category.NumOfCompAch == nil or category.NumOfNotObtAch == nil then
                category:GetAchievementNumbers();
            end
            local numOfAch, numOfCompAch, numOfNotObtAch = category.NumOfAch, category.NumOfCompAch, category.NumOfNotObtAch;
            totalNumOfAch = totalNumOfAch + numOfAch;
            totalNumOfCompAch = totalNumOfCompAch + numOfCompAch;
            totalNumOfNotObtAch = totalNumOfNotObtAch + numOfNotObtAch;
            local numOfNotObtAchText = "";
            if numOfNotObtAch > 0 and showNotObtainable then
                numOfNotObtAchText = " (+" .. numOfNotObtAch .. ")";
            end
            statusBar.TextRight:SetText(numOfCompAch .. numOfNotObtAchText .. " / " .. numOfAch);
            statusBar:SetMinMaxValues(0, numOfAch);
            if not showNotObtainable then
                numOfNotObtAch = 0;
            end
            statusBar:SetValues(numOfCompAch, numOfNotObtAch, 0, 0);

            statusBar.TextLeft:SetWidth(statusBar.BorderMiddleMiddle:GetWidth() - statusBar.TextRight:GetWidth() - 10);

            statusBar:UpdateTextures();
			statusBar:Show();
            lastShown = statusBar;
		else
			statusBar:Hide();
		end
	end

    local totalNumOfNotObtAchText = "";
    if totalNumOfNotObtAch > 0 and showNotObtainable then
        totalNumOfNotObtAchText = " (+" .. totalNumOfNotObtAch .. ")";
    end
    totalStatusBar.TextRight:SetText(totalNumOfCompAch .. totalNumOfNotObtAchText .. " / " .. totalNumOfAch);
    totalStatusBar:SetMinMaxValues(0, totalNumOfAch);
    totalStatusBar:SetValues(totalNumOfCompAch, totalNumOfNotObtAch, 0, 0);
    totalStatusBar:UpdateTextures();

    local header = self.Categories.Header;
    header:ClearAllPoints();
    header:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, 0);
    header:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, 0);
    offset = self:GetBottom() - lastShown:GetBottom();
    header:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, offset);
    header:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 0, offset);
end

local function BuildLastCompleted(event)
    local numLastCompleted = addon.Options.db.Categories.Summary.NumAchievements or 25;
    local lastCompleted = SavedData.Characters[UnitGUID("player")].LastCompleted;
    if type(lastCompleted) == "table"
    and #lastCompleted == numLastCompleted
    and not event == "ACHIEVEMENT_EARNED" then
        return;
    end
    local res = {};
    for achievementId, date in next, SavedData.Characters[UnitGUID("player")].CompletedAchievements do
        tinsert(res, {Id = achievementId, Date = date});
    end
    sort(res, function(a, b) return a.Date > b.Date; end);
    SavedData.Characters[UnitGUID("player")].LastCompleted = {};
    lastCompleted = SavedData.Characters[UnitGUID("player")].LastCompleted;
    for i = 1, numLastCompleted, 1 do
        if res[i] == nil then
            return;
        end
        tinsert(lastCompleted, res[i].Id);
    end
end

function KrowiAF_SummaryFrameMixin:Achievements_Update(event)
    BuildLastCompleted(event);
    self.ScrollFrameBorder:Update(SavedData.Characters[UnitGUID("player")].LastCompleted);
end