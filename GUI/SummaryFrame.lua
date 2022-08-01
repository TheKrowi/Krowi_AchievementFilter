-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.SummaryFrame = {};
local summaryFrame = gui.SummaryFrame;

summaryFrame.__index = summaryFrame; -- Used to inject all the namespace functions to the frame
function summaryFrame:Load()
    local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameSummaryFrame", AchievementFrame, "KrowiAF_AchievementFrameSummaryFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 0);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", -20, 0);
	addon.Util.InjectMetatable(frame, summaryFrame); -- Inject all the namespace functions to the frame

    for i, frameName in next, ACHIEVEMENTFRAME_SUBFRAMES do
		if frameName == gui.AchievementsFrame:GetName() then
			tinsert(ACHIEVEMENTFRAME_SUBFRAMES, i, frame:GetName());
			break;
		end
	end

    frame:BuildCategories();
    frame:BuildAchievementsScrollFrame();

    addon.GUI.SummaryFrame = frame;
end

function KrowiAF_AchievementFrameSummaryFrame_OnShow(self)
    self:CategoriesStatusBar_Update();
    self:Achievements_Update();
end

function KrowiAF_AchievementFrameSummaryFrame_Update(self, event)
    self:Update(event);
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
function summaryFrame:NewStatusBar()
    local statusBar = LibStub("Krowi_ProgressBar-1.1"):New(self);
    OverRideTextures(statusBar);
    statusBar:SetWidth(270);
    statusBar:SetHeight(49);
	statusBar:Reset();
    statusBar:SetColors({R = 0, G = 1, B = 0}, {R = 1, G = 0, B = 0});
    statusBar.TextRight:SetFontObject(GameFontHighlight);
    statusBar.TextLeft:SetFontObject(GameFontNormal);
    statusBar.TextLeft:SetWordWrap(false);

    AddButton(statusBar);

    statusBar:UpdateTextures();
    statusBar:Show();

    tinsert(statusBars, statusBar);

    return statusBar;
end

local totalStatusBar;
function summaryFrame:BuildCategories()
    totalStatusBar = LibStub("Krowi_ProgressBar-1.1"):New(self);
    OverRideTextures(totalStatusBar);
    totalStatusBar:SetWidth(524);
    totalStatusBar:SetHeight(49);
	totalStatusBar:Reset();
    totalStatusBar:SetColors({R = 0, G = 1, B = 0}, {R = 1, G = 0, B = 0});
    totalStatusBar.TextRight:SetFontObject(GameFontHighlight);
    totalStatusBar.TextLeft:SetFontObject(GameFontNormal);
    totalStatusBar.TextLeft:SetText(addon.L["Achievements Earned"]);

    totalStatusBar:UpdateTextures();
    totalStatusBar:Show();

    totalStatusBar:SetPoint("TOP", self.Categories.Header, "BOTTOM", 0, 5);

    local yOffset = 15;

    self:NewStatusBar():SetPoint("TOPLEFT", totalStatusBar, "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", totalStatusBar, "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[1], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[2], "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[3], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[4], "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[5], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[6], "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[7], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[8], "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[9], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[10], "BOTTOMRIGHT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPLEFT", statusBars[11], "BOTTOMLEFT", 0, yOffset);
    self:NewStatusBar():SetPoint("TOPRIGHT", statusBars[12], "BOTTOMRIGHT", 0, yOffset);

    self.TotalStatusBar = totalStatusBar;
    self.StatusBars = statusBars;
end

local function ReskinHybridScrollFrame(scrollFrame)
    local scrollBar = scrollFrame.ScrollBar;
    scrollBar.ScrollBarTop:Hide();
    scrollBar.ScrollBarMiddle:Hide();
    scrollBar.ScrollBarBottom:Hide();
    scrollBar.trackBG:SetPoint("TOPLEFT", scrollBar.ScrollUpButton, "BOTTOMLEFT", 0, 10);
    scrollBar.trackBG:SetPoint("BOTTOMRIGHT", scrollBar.ScrollDownButton, "TOPRIGHT", -1, -10);
end

function summaryFrame:BuildAchievementsScrollFrame()
    local frame = self.ScrollFrameBorder;
    local scrollFrame = frame.Container;
    local scrollBar = scrollFrame.ScrollBar;
    local header = self.Categories.Header;

    ReskinHybridScrollFrame(scrollFrame);

    local show = getmetatable(scrollBar).__index.Show;
    scrollBar.Show = function(selfFunc)
        frame:SetPoint("BOTTOMRIGHT", header, "TOPRIGHT", -40, 5);
        show(selfFunc);
    end
    local hide = getmetatable(scrollBar).__index.Hide;
    scrollBar.Hide = function(selfFunc)
        frame:SetPoint("BOTTOMRIGHT", header, "TOPRIGHT", -14, 5);
        hide(selfFunc);
    end

    scrollFrame.update = function()
		self:Achievements_Update();
	end

    HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_AchievementFrameSummaryFrameAchievementButton_Template", 4, 0);

    local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
        button:SetPoint("RIGHT", scrollFrame, -5, 0);
    end
end

function summaryFrame:Update(event)
    self:CategoriesStatusBar_Update(event);
    self:Achievements_Update(event);
end

function summaryFrame:CategoriesStatusBar_Update(event)
    local selectedTab = addon.GUI.SelectedTab;
    if not selectedTab then
        return;
    end

    if event == "ACHIEVEMENT_EARNED" then -- Update it here instead of in the categories frame itself to make sure the summary is updated with the correct numbers
        addon.GUI.CategoriesFrame:Update(true);
    end
    local lastShown = totalStatusBar;
    local offset = 0;
    local totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = 0, 0, 0;
    local categories = selectedTab.Categories;
    local showNotObtainable = addon.Options.db.Tooltip.Categories.ShowNotObtainable;
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

function summaryFrame:Achievements_Update(event)
    BuildLastCompleted(event);
    self:UpdateAchievements();
end

function summaryFrame:UpdateAchievements()
    local numLastCompleted = #SavedData.Characters[UnitGUID("player")].LastCompleted;
    local emptyText = self.Achievements.EmptyText;
    emptyText:Show();
    if numLastCompleted > 0 then
        emptyText:Hide();
    end

    local scrollFrame = self.ScrollFrameBorder.Container;
    local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local buttons = scrollFrame.buttons;

    local totalHeight = numLastCompleted * buttons[1]:GetHeight();
	local displayedHeight = 0;

    local id;
    for i = 1, #buttons do
        local button = buttons[i];
        id = SavedData.Characters[UnitGUID("player")].LastCompleted[i + offset];
        displayedHeight = displayedHeight + button:GetHeight();
        if id ~= nil then
            local _, name, points, completed, month, day, year, description, flags, icon, _, _, wasEarnedByMe, earnedBy, _ = addon.GetAchievementInfo(id);

            local achievement = addon.Data.Achievements[id];
            button.Achievement = achievement;

            local saturatedStyle;
            if achievement.NotObtainable then
                saturatedStyle = "NotObtainable";
            else
                if bit.band(flags, ACHIEVEMENT_FLAGS_ACCOUNT) == ACHIEVEMENT_FLAGS_ACCOUNT then
                    button.accountWide = true;
                    saturatedStyle = "account";
                else
                    button.accountWide = nil;
                    saturatedStyle = "normal";
                end
            end

            button.label:SetText(name);
            button.description:SetText(description);
            AchievementShield_SetPoints(points, button.shield.points, GameFontNormal, GameFontNormalSmall);
            if points > 0 then
                button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]]);
            else
                button.shield.icon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]]);
            end

            button.shield.wasEarnedByMe = not (completed and not wasEarnedByMe);
            button.shield.earnedBy = earnedBy;

            button.icon.texture:SetTexture(icon);
            button.id = id;

            if completed then
                button.dateCompleted:SetText(FormatShortDate(day, month, year));
            else
                button.dateCompleted:SetText("");
            end

            if button.saturatedStyle ~= saturatedStyle then
                button:Saturate();
            end
            button.tooltipTitle = nil;

            button:Show();
        else
            button.Achievement = nil;

            button:Hide();
        end
        if button:IsMouseOver() then
            KrowiAF_AchievementFrameSummaryFrameAchievementButton_OnEnter(button);
        end
    end
    HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end