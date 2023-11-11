local _, addon = ...;

KrowiAF_SummaryFrameMixin = {};

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

local function GetNewStatusBar(self)
    local statusBar = LibStub("Krowi_ProgressBar-2.0"):GetNew(self);
    OverRideTextures(statusBar);
    statusBar:SetHeight(49);
    statusBar:Reset();
    statusBar:SetColors({R = 0, G = 1, B = 0}, {R = 1, G = 0, B = 0});
    statusBar.TextRight:SetFontObject(GameFontHighlight);
    statusBar.TextLeft:SetFontObject(GameFontNormal);
    statusBar.TextLeft:SetWordWrap(false);
    return statusBar;
end

local function LoadTotalStatusBar(self)
    self.TotalStatusBar = GetNewStatusBar(self);
    local totalStatusBar = self.TotalStatusBar;
    totalStatusBar.TextLeft:SetText(addon.L["Achievements Earned"]);
    totalStatusBar:SetPoint("TOP", self.Categories.Header, "BOTTOM", 0, 5);
    totalStatusBar:SetPoint("LEFT", self, 14, 0);
    totalStatusBar:SetPoint("RIGHT", self, -14, 0);
end

function KrowiAF_SummaryFrameMixin:OnLoad()
    LoadTotalStatusBar(self);
    self.AchievementsFrame.ScrollBox.wheelPanScalar = addon.Options.db.profile.Summary.MouseWheelPanScalar;
	self.AchievementsFrame.ScrollBar.wheelPanScalar = addon.Options.db.profile.Summary.MouseWheelPanScalar;
end

function KrowiAF_SummaryFrameMixin:OnEvent(event)
    addon.Util.DelayFunction("KrowiAF_SummaryFrame_OnEvent", 1, self.Update, self, event);
end

function KrowiAF_SummaryFrameMixin:OnShow()
    self:RegisterEvent("ACHIEVEMENT_EARNED");
    self:Update(addon.AchievementEarnedUpdateSummaryFrameOnNextShow and "ACHIEVEMENT_EARNED" or nil);
    addon.AchievementEarnedUpdateSummaryFrameOnNextShow = nil;
end

function KrowiAF_SummaryFrameMixin:OnHide()
    self:UnregisterEvent("ACHIEVEMENT_EARNED");
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
function KrowiAF_SummaryFrameMixin:GetStatusBar(index) -- Public for skinning
    if statusBars[index] then
        return statusBars[index];
    end
    local statusBar = GetNewStatusBar(self);
    AddButton(statusBar);
    statusBars[index] = statusBar;
    return statusBar;
end

function KrowiAF_SummaryFrameMixin:GetAndAlignStatusBar(index) -- Public for skinning
    local numColumns = floor((self:GetWidth() - 28) / 254);
    local width = (self:GetWidth() - 44) / numColumns; -- 44 = 2*14 + 16, 14 is offsets on the side, 16 in between 2 columns
    local numRows = 1;
	local position = index;
    while position > numColumns do
        position = position - numColumns;
		numRows = numRows + 1;
    end

    local statusBar = self:GetStatusBar(index);
    statusBar:SetWidth(width + 16);
    statusBar:ClearAllPoints();
    statusBar:SetPoint("TOPLEFT", self.TotalStatusBar, "TOPLEFT", (position - 1) * width, -numRows * 34);
    return statusBar;
end

local categoryIndex;
local function StartFromFirstCategory()
    categoryIndex = 0;
end

local function ResetStatusBars()
    for _, statusBar in next, statusBars do
		statusBar:Hide();
	end
end

local categories;
local function GetNextCategory()
    local category;
    repeat
        categoryIndex = categoryIndex + 1;
        category = categories[categoryIndex];
    until not category or (category and not category.IsSummary and not category.HasFlexibleData and category.NumOfAch > 0);
    return category;
end

local function AddStatusBar(self, index, category, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch)
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

local function UpdateTotalStatusBar(self, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch)
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

local function AlignCategoriesHeader(self, lastShown, offset)
    local header = self.Categories.Header;
    header:ClearPoint("TOP");
    header:ClearPoint("BOTTOM");
    header:SetPoint("TOP", self, "BOTTOM", 0, 0);
    offset = (offset or 0) + self:GetBottom() - lastShown:GetBottom();
    header:SetPoint("TOP", self, "BOTTOM", 0, offset);
end

local lastShown;
local function UpdateCategories(self, event)
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
    ResetStatusBars();
    local numStatusBars = 0;
    lastShown = self.TotalStatusBar;
    local totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = 0, 0, 0;
    local showNotObtainable = addon.Options.db.profile.Tooltip.Categories.ShowNotObtainable;
    repeat
        local category = GetNextCategory();
        if category then
            numStatusBars = numStatusBars + 1;
            lastShown, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = AddStatusBar(self, numStatusBars, category, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch);
        end
	until not category;
    UpdateTotalStatusBar(self, showNotObtainable, totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch);
    AlignCategoriesHeader(self, lastShown);
end

local buildAtLeastOnce;
local function BuildLastCompleted(event)
    local numLastCompleted = addon.Options.db.profile.Summary.NumAchievements or 25;
    local lastCompleted = KrowiAF_Achievements.LastCompleted[UnitGUID("player")];
    if type(lastCompleted) == "table" and #lastCompleted == numLastCompleted and event ~= "ACHIEVEMENT_EARNED" and buildAtLeastOnce then
        return; -- Doesn't require an update
    end
    addon.Data.SavedData.AchievementData.RefreshLastCompleted(UnitGUID("player"));
    buildAtLeastOnce = true;
end

local updateAchievementsOnNextShow;
local function UpdateAchievements(self, event)
    BuildLastCompleted(event);
    return self.AchievementsFrame:Update(KrowiAF_Achievements.LastCompleted[UnitGUID("player")], updateAchievementsOnNextShow);
end

function KrowiAF_SummaryFrameMixin:Update(event)
    UpdateCategories(self, event);
    local emptyAchievementsSpace = UpdateAchievements(self, event);

    if addon.Options.db.profile.Summary.AutoNumAchievements then
        AlignCategoriesHeader(self, lastShown, emptyAchievementsSpace);
    end
end

function KrowiAF_SummaryFrameMixin:UpdateAchievementsOnNextShow()
    updateAchievementsOnNextShow = true;
    if self:IsShown() then
        UpdateAchievements(self);
    end
end