local _, addon = ...;

KrowiAF_SummaryFrameMixin = {};

function KrowiAF_SummaryFrameMixin:OnLoad()
    self:LoadTotalStatusBar();
    self.AchievementsFrame.ScrollBox.wheelPanScalar = addon.Options.db.profile.Summary.MouseWheelPanScalar;
	self.AchievementsFrame.ScrollBar.wheelPanScalar = addon.Options.db.profile.Summary.MouseWheelPanScalar;
end

function KrowiAF_SummaryFrameMixin:OnEvent(event)
    addon.Util.DelayFunction("KrowiAF_SummaryFrame_OnEvent", 1, self.Update, self, event);
end

function KrowiAF_SummaryFrameMixin:OnShow()
    self:RegisterEvent("ACHIEVEMENT_EARNED");
    self:Update();
end

function KrowiAF_SummaryFrameMixin:OnHide()
    self:UnregisterEvent("ACHIEVEMENT_EARNED");
end

local function OverRideTextures(statusBar)
    local texture = "Interface/AchievementFrame/UI-Achievement-Header";

    statusBar.BorderLeftTop:SetTexture(texture);
    statusBar.BorderLeftTop:SetTexCoord(0.423828, 0.466797, 0.566406, 0.652344);
    statusBar.BorderLeftTop:SetSize(22, 22);

    statusBar.BorderLeftMiddle:SetTexture(texture);
    statusBar.BorderLeftMiddle:SetTexCoord(0.423828, 0.466797, 0.652344, 0.667969);
    statusBar.BorderLeftMiddle:SetSize(22, 4);

    statusBar.BorderLeftBottom:SetTexture(texture);
    statusBar.BorderLeftBottom:SetTexCoord(0.423828, 0.466797, 0.667969, 0.753906);
    statusBar.BorderLeftBottom:SetSize(22, 22);

    statusBar.BorderRightTop:SetTexture(texture);
    statusBar.BorderRightTop:SetTexCoord(0.466797, 0.423828, 0.566406, 0.652344);
    statusBar.BorderRightTop:SetSize(22, 22);

    statusBar.BorderRightMiddle:SetTexture(texture);
    statusBar.BorderRightMiddle:SetTexCoord(0.466797, 0.423828, 0.652344, 0.667969);
    statusBar.BorderRightMiddle:SetSize(22, 4);

    statusBar.BorderRightBottom:SetTexture(texture);
    statusBar.BorderRightBottom:SetTexCoord(0.466797, 0.423828, 0.667969, 0.753906);
    statusBar.BorderRightBottom:SetSize(22, 22);

    statusBar.BorderMiddleTop:SetTexture(texture);
    statusBar.BorderMiddleTop:SetTexCoord(0.466797, 0.46875, 0.566406, 0.652344);
    statusBar.BorderMiddleTop:SetSize(22, 22);

    statusBar.BorderMiddleMiddle:SetTexture(texture);
    statusBar.BorderMiddleMiddle:SetTexCoord(0.466797, 0.46875, 0.652344, 0.667969);
    statusBar.BorderMiddleMiddle:SetSize(22, 4);

    statusBar.BorderMiddleBottom:SetTexture(texture);
    statusBar.BorderMiddleBottom:SetTexCoord(0.466797, 0.46875, 0.667969, 0.753906);
    statusBar.BorderMiddleBottom:SetSize(22, 22);

    for i, _ in next, statusBar.Fill do
        statusBar.Fill[i]:SetTexture("Interface/PaperDollInfoFrame/UI-Character-Skills-Bar");
    end

    statusBar:AdjustOffsets(5, 5);
end

local function AddButton(statusBar)
    local button = CreateFrame("Button", statusBar:GetName() .. "Button", statusBar);
    button:SetPoint("TOPLEFT", 7, -6);
    button:SetPoint("BOTTOMRIGHT", -7, 6);
    statusBar.Button = button;

    local texture = "Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight";
    button.Border = {};
    local border = button.Border;

    local topLeft = button:CreateTexture();
    topLeft:SetTexture(texture);
	topLeft:SetTexCoord(0, 0.4375, 0, 0.4375);
    topLeft:SetPoint("BOTTOMRIGHT", statusBar.BorderLeftTop);
    topLeft:SetSize(14, 14);
    topLeft:Hide();
    border.TopLeft = topLeft;

    local middleLeft = button:CreateTexture();
    middleLeft:SetTexture(texture);
	middleLeft:SetTexCoord(0, 0.4375, 0.4375, 0.59375);
    middleLeft:SetPoint("TOPRIGHT", statusBar.BorderLeftMiddle);
    middleLeft:SetPoint("BOTTOMRIGHT", statusBar.BorderLeftMiddle);
    middleLeft:SetSize(14, 5);
    middleLeft:Hide();
    border.MiddleLeft = middleLeft;

    local bottomLeft = button:CreateTexture();
    bottomLeft:SetTexture(texture);
	bottomLeft:SetTexCoord(0, 0.4375, 0.59375, 1);
    bottomLeft:SetPoint("TOPRIGHT", statusBar.BorderLeftBottom);
    bottomLeft:SetSize(14, 13);
    bottomLeft:Hide();
    border.BottomLeft = bottomLeft;

    local topRight = button:CreateTexture();
    topRight:SetTexture(texture);
	topRight:SetTexCoord(0.4375, 0, 0, 0.4375);
    topRight:SetPoint("BOTTOMLEFT", statusBar.BorderRightTop);
    topRight:SetSize(14, 14);
    topRight:Hide();
    border.TopRight = topRight;

    local middleRight = button:CreateTexture();
    middleRight:SetTexture(texture);
	middleRight:SetTexCoord(0.4375, 0, 0.4375, 0.59375);
    middleRight:SetPoint("TOPLEFT", statusBar.BorderRightMiddle);
    middleRight:SetPoint("BOTTOMLEFT", statusBar.BorderRightMiddle);
    middleRight:SetSize(14, 5);
    middleRight:Hide();
    border.MiddleRight = middleRight;

    local bottomRight = button:CreateTexture();
    bottomRight:SetTexture(texture);
	bottomRight:SetTexCoord(0.4375, 0, 0.59375, 1);
    bottomRight:SetPoint("TOPLEFT", statusBar.BorderRightBottom);
    bottomRight:SetSize(14, 13);
    bottomRight:Hide();
    border.BottomRight = bottomRight;

    local middleTop = button:CreateTexture();
    middleTop:SetTexture(texture);
	middleTop:SetTexCoord(0.4375, 1, 0, 0.4375);
    middleTop:SetPoint("BOTTOMLEFT", statusBar.BorderMiddleTop);
    middleTop:SetPoint("BOTTOMRIGHT", statusBar.BorderMiddleTop);
    middleTop:SetSize(18, 14);
    middleTop:Hide();
    border.MiddleTop = middleTop;

    local middleMiddle = button:CreateTexture();
    middleMiddle:SetTexture(texture);
	middleMiddle:SetTexCoord(0.4375, 1, 0.4375, 0.59375);
    middleMiddle:SetPoint("TOPLEFT", statusBar.BorderMiddleMiddle);
    middleMiddle:SetPoint("BOTTOMRIGHT", statusBar.BorderMiddleMiddle);
    middleMiddle:SetSize(18, 5);
    middleMiddle:Hide();
    border.MiddleMiddle = middleMiddle;

    local middleBottom = button:CreateTexture();
    middleBottom:SetTexture(texture);
	middleBottom:SetTexCoord(0.4375, 1, 0.59375, 1);
    middleBottom:SetPoint("TOPLEFT", statusBar.BorderMiddleBottom);
    middleBottom:SetPoint("TOPRIGHT", statusBar.BorderMiddleBottom);
    middleBottom:SetSize(18, 13);
    middleBottom:Hide();
    border.MiddleBottom = middleBottom;

    button:SetScript("OnLeave", function(self)
        for _, borderPart in next, self.Border do
            borderPart:Hide();
        end
    end);

    button:SetScript("OnEnter", function(self)
        for _, borderPart in next, self.Border do
            borderPart:Show();
        end
    end);

    button:SetScript("OnClick", function(self)
        KrowiAF_SelectCategory(self.Category);
    end);
end

local statusBars = {};
function KrowiAF_SummaryFrameMixin:ResetStatusBars()
    for _, statusBar in next, statusBars do
		statusBar:Hide();
	end
end

function KrowiAF_SummaryFrameMixin:GetNewStatusBar()
    local statusBar = LibStub("Krowi_ProgressBar-2.0"):GetNew(self);
    OverRideTextures(statusBar);
    statusBar:SetWidth(270);
    statusBar:SetHeight(49);
    statusBar:Reset();
    statusBar:SetColors({R = 0, G = 1, B = 0}, {R = 1, G = 0, B = 0});
    statusBar.TextRight:SetFontObject(GameFontHighlight);
    statusBar.TextLeft:SetFontObject(GameFontNormal);
    statusBar.TextLeft:SetWordWrap(false);
    return statusBar;
end

function KrowiAF_SummaryFrameMixin:GetStatusBar(index)
    if statusBars[index] then
        return statusBars[index];
    end
    local statusBar = self:GetNewStatusBar();
    AddButton(statusBar);
    statusBars[index] = statusBar;
    return statusBar;
end

function KrowiAF_SummaryFrameMixin:GetAndAlignStatusBar(index)
    local yOffset = 15;
    local point, relativePoint, relativeTo;
    if index % 2 == 0 then -- Even
        point, relativePoint = "TOPRIGHT", "BOTTOMRIGHT";
    else -- Odd
        point, relativePoint = "TOPLEFT", "BOTTOMLEFT";
    end
    if index == 1 or index == 2 then
        relativeTo = self.TotalStatusBar;
    else
        relativeTo = self:GetStatusBar(index - 2);
    end
    local statusBar = self:GetStatusBar(index);
    statusBar:ClearAllPoints();
    statusBar:SetPoint(point, relativeTo, relativePoint, 0, yOffset);
    return statusBar;
end

function KrowiAF_SummaryFrameMixin:LoadTotalStatusBar()
    self.TotalStatusBar = self:GetNewStatusBar();
    local totalStatusBar = self.TotalStatusBar;
    totalStatusBar:SetWidth(524);
    totalStatusBar.TextLeft:SetText(addon.L["Achievements Earned"]);
    totalStatusBar:SetPoint("TOP", self.Categories.Header, "BOTTOM", 0, 5);
end

function KrowiAF_SummaryFrameMixin:Update(event)
    self:UpdateAchievements(event);
    self:UpdateCategories(event);
end

local categories, categoryIndex;
local function StartFromFirstCategory()
    categoryIndex = 0;
end

local function GetNextCategory()
    local category;
    repeat
        categoryIndex = categoryIndex + 1;
        category = categories[categoryIndex];
    until not category or (category and not category.IsSummary and not category.HasFlexibleData and category.NumOfAch > 0);
    return category;
end

function KrowiAF_SummaryFrameMixin:AddStatusBar(index, category, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch)
    local statusBar = self:GetAndAlignStatusBar(index);
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
    return statusBar, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch;
end

function KrowiAF_SummaryFrameMixin:UpdateTotalStatusBar(showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch)
    local totalNumOfNotObtAchText = "";
    if totalNumOfNotObtAch > 0 and showNotObtainable then
        totalNumOfNotObtAchText = " (+" .. totalNumOfNotObtAch .. ")";
    end
    local totalStatusBar = self.TotalStatusBar;
    totalStatusBar.TextRight:SetText(totalNumOfCompAch .. totalNumOfNotObtAchText .. " / " .. totalNumOfAch);
    totalStatusBar:SetMinMaxValues(0, totalNumOfAch);
    totalStatusBar:SetValues(totalNumOfCompAch, totalNumOfNotObtAch, 0, 0);
    totalStatusBar:UpdateTextures();
end

function KrowiAF_SummaryFrameMixin:AlignCategoriesHeader(lastShown)
    local header = self.Categories.Header;
    header:ClearPoint("TOP");
    header:ClearPoint("BOTTOM");
    header:SetPoint("TOP", self, "BOTTOM", 0, 0);
    local offset = self:GetBottom() - lastShown:GetBottom();
    header:SetPoint("TOP", self, "BOTTOM", 0, offset);
end

function KrowiAF_SummaryFrameMixin:UpdateCategories(event)
    local selectedTab = addon.Gui.SelectedTab;
    if not selectedTab then
        return;
    end

    if event == "ACHIEVEMENT_EARNED" then -- Update it here instead of in the categories frame itself to make sure the summary is updated with the correct numbers
        KrowiAF_CategoriesFrame:Update(true);
    end

    categories = selectedTab:GetCategories();
    if not categories then
        return;
    end

    StartFromFirstCategory();
    self:ResetStatusBars();
    local numStatusBars = 0;
    local lastShown = self.TotalStatusBar;
    local totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = 0, 0, 0;
    local showNotObtainable = addon.Options.db.profile.Tooltip.Categories.ShowNotObtainable;
    repeat
        local category = GetNextCategory();
        if category then
            numStatusBars = numStatusBars + 1;
            lastShown, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = self:AddStatusBar(numStatusBars, category, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch);
        end
	until not category;
    self:UpdateTotalStatusBar(showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch);
    self:AlignCategoriesHeader(lastShown);
end

local function BuildLastCompleted(event)
    local numLastCompleted = addon.Options.db.profile.Summary.NumAchievements or 25;
    local lastCompleted = KrowiAF_Achievements.LastCompleted[UnitGUID("player")];
    if type(lastCompleted) == "table"
    and #lastCompleted == numLastCompleted
    and not event == "ACHIEVEMENT_EARNED" then
        return;
    end
    local res = addon.Data.SavedData.AchievementData.GetEarnedByCharacter(UnitGUID("player"));
    sort(res, function(a, b) return a.Date > b.Date; end);
    KrowiAF_Achievements.LastCompleted[UnitGUID("player")] = {};
    lastCompleted = KrowiAF_Achievements.LastCompleted[UnitGUID("player")];
    for i = 1, numLastCompleted, 1 do
        if res[i] == nil then
            return;
        end
        tinsert(lastCompleted, res[i].Id);
    end
end

local updateAchievementsOnNextShow;
function KrowiAF_SummaryFrameMixin:UpdateAchievements(event)
    BuildLastCompleted(event);
    self.AchievementsFrame:Update(KrowiAF_Achievements.LastCompleted[UnitGUID("player")], updateAchievementsOnNextShow);
end

function KrowiAF_SummaryFrameMixin:UpdateAchievementsOnNextShow()
    updateAchievementsOnNextShow = true;
    if self:IsShown() then
        self:UpdateAchievements();
    end
end