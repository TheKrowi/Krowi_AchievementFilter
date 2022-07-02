-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AchievementsSummary = {};
local summary = gui.AchievementsSummary;

local function OverRideTextures(statusBar)
    statusBar.BorderLeftTop:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderLeftTop:SetTexCoord(0.423828, 0.466797, 0.566406, 0.652344);
    statusBar.BorderLeftTop:SetSize(22, 22);

    statusBar.BorderLeftMiddle:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderLeftMiddle:SetTexCoord(0.423828, 0.466797, 0.652344, 0.667969);
    statusBar.BorderLeftMiddle:SetSize(22, 4);

    statusBar.BorderLeftBottom:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderLeftBottom:SetTexCoord(0.423828, 0.466797, 0.667969, 0.753906);
    statusBar.BorderLeftBottom:SetSize(22, 22);

    statusBar.BorderRightTop:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderRightTop:SetTexCoord(0.466797, 0.423828, 0.566406, 0.652344);
    statusBar.BorderRightTop:SetSize(22, 22);

    statusBar.BorderRightMiddle:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderRightMiddle:SetTexCoord(0.466797, 0.423828, 0.652344, 0.667969);
    statusBar.BorderRightMiddle:SetSize(22, 4);

    statusBar.BorderRightBottom:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderRightBottom:SetTexCoord(0.466797, 0.423828, 0.667969, 0.753906);
    statusBar.BorderRightBottom:SetSize(22, 22);

    statusBar.BorderMiddleTop:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderMiddleTop:SetTexCoord(0.466797, 0.46875, 0.566406, 0.652344);
    statusBar.BorderMiddleTop:SetSize(22, 22);

    statusBar.BorderMiddleMiddle:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
    statusBar.BorderMiddleMiddle:SetTexCoord(0.466797, 0.46875, 0.652344, 0.667969);
    statusBar.BorderMiddleMiddle:SetSize(22, 4);

    statusBar.BorderMiddleBottom:SetTexture("Interface/AchievementFrame/UI-Achievement-Header");
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

    local borderTopLeft = button:CreateTexture();
    borderTopLeft:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderTopLeft:SetTexCoord(0, 0.4375, 0, 0.4375);
    borderTopLeft:SetPoint("BOTTOMRIGHT", statusBar.BorderLeftTop);
    borderTopLeft:SetSize(14, 14);
    borderTopLeft:Hide();
    button.BorderTopLeft = borderTopLeft;

    local borderMiddleLeft = button:CreateTexture();
    borderMiddleLeft:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderMiddleLeft:SetTexCoord(0, 0.4375, 0.4375, 0.59375);
    borderMiddleLeft:SetPoint("TOPRIGHT", statusBar.BorderLeftMiddle);
    borderMiddleLeft:SetPoint("BOTTOMRIGHT", statusBar.BorderLeftMiddle);
    borderMiddleLeft:SetSize(14, 5);
    borderMiddleLeft:Hide();
    button.BorderMiddleLeft = borderMiddleLeft;

    local borderBottomLeft = button:CreateTexture();
    borderBottomLeft:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderBottomLeft:SetTexCoord(0, 0.4375, 0.59375, 1);
    borderBottomLeft:SetPoint("TOPRIGHT", statusBar.BorderLeftBottom);
    borderBottomLeft:SetSize(14, 13);
    borderBottomLeft:Hide();
    button.BorderBottomLeft = borderBottomLeft;

    local borderTopRight = button:CreateTexture();
    borderTopRight:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderTopRight:SetTexCoord(0.4375, 0, 0, 0.4375);
    borderTopRight:SetPoint("BOTTOMLEFT", statusBar.BorderRightTop);
    borderTopRight:SetSize(14, 14);
    borderTopRight:Hide();
    button.BorderTopRight = borderTopRight;

    local borderMiddleRight = button:CreateTexture();
    borderMiddleRight:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderMiddleRight:SetTexCoord(0.4375, 0, 0.4375, 0.59375);
    borderMiddleRight:SetPoint("TOPLEFT", statusBar.BorderRightMiddle);
    borderMiddleRight:SetPoint("BOTTOMLEFT", statusBar.BorderRightMiddle);
    borderMiddleRight:SetSize(14, 5);
    borderMiddleRight:Hide();
    button.BorderMiddleRight = borderMiddleRight;

    local borderBottomRight = button:CreateTexture();
    borderBottomRight:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderBottomRight:SetTexCoord(0.4375, 0, 0.59375, 1);
    borderBottomRight:SetPoint("TOPLEFT", statusBar.BorderRightBottom);
    borderBottomRight:SetSize(14, 13);
    borderBottomRight:Hide();
    button.BorderBottomRight = borderBottomRight;

    local borderMiddleTop = button:CreateTexture();
    borderMiddleTop:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderMiddleTop:SetTexCoord(0.4375, 1, 0, 0.4375);
    borderMiddleTop:SetPoint("BOTTOMLEFT", statusBar.BorderMiddleTop);
    borderMiddleTop:SetPoint("BOTTOMRIGHT", statusBar.BorderMiddleTop);
    borderMiddleTop:SetSize(18, 14);
    borderMiddleTop:Hide();
    button.BorderMiddleTop = borderMiddleTop;

    local borderMiddleMiddle = button:CreateTexture();
    borderMiddleMiddle:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderMiddleMiddle:SetTexCoord(0.4375, 1, 0.4375, 0.59375);
    borderMiddleMiddle:SetPoint("TOPLEFT", statusBar.BorderMiddleMiddle);
    borderMiddleMiddle:SetPoint("BOTTOMRIGHT", statusBar.BorderMiddleMiddle);
    borderMiddleMiddle:SetSize(18, 5);
    borderMiddleMiddle:Hide();
    button.BorderMiddleMiddle = borderMiddleMiddle;

    local borderMiddleBottom = button:CreateTexture();
    borderMiddleBottom:SetTexture("Interface/AchievementFrame/UI-Achievement-StatusBar-Highlight");
	borderMiddleBottom:SetTexCoord(0.4375, 1, 0.59375, 1);
    borderMiddleBottom:SetPoint("TOPLEFT", statusBar.BorderMiddleBottom);
    borderMiddleBottom:SetPoint("TOPRIGHT", statusBar.BorderMiddleBottom);
    borderMiddleBottom:SetSize(18, 13);
    borderMiddleBottom:Hide();
    button.BorderMiddleBottom = borderMiddleBottom;

    button:SetScript("OnLeave", function(self)
        self.BorderTopLeft:Hide();
        self.BorderMiddleLeft:Hide();
        self.BorderBottomLeft:Hide();
        self.BorderTopRight:Hide();
        self.BorderMiddleRight:Hide();
        self.BorderBottomRight:Hide();
        self.BorderMiddleTop:Hide();
        self.BorderMiddleMiddle:Hide();
        self.BorderMiddleBottom:Hide();
    end);

    button:SetScript("OnEnter", function(self)
        self.BorderTopLeft:Show();
        self.BorderMiddleLeft:Show();
        self.BorderBottomLeft:Show();
        self.BorderTopRight:Show();
        self.BorderMiddleRight:Show();
        self.BorderBottomRight:Show();
        self.BorderMiddleTop:Show();
        self.BorderMiddleMiddle:Show();
        self.BorderMiddleBottom:Show();
    end);

    button:SetScript("OnClick", function(self)
        KrowiAF_SelectCategory(self.Category);
    end);
end

local function NewStatusBar()
    local statusBar = LibStub("Krowi_ProgressBar-1.1"):New(KrowiAF_AchievementsSummaryFrame);
    OverRideTextures(statusBar);
    statusBar:SetWidth(265);
    statusBar:SetHeight(49);
	statusBar:Reset();
    statusBar:SetColors({R = 0, G = 1, B = 0}, {R = 1, G = 0, B = 0});
    statusBar.TextRight:SetFontObject(GameFontHighlight);
    statusBar.TextLeft:SetFontObject(GameFontNormal);
    statusBar.TextLeft:SetWordWrap(false);

    AddButton(statusBar);

    statusBar:UpdateTextures();
    statusBar:Show();

    return statusBar;
end

local totalStatusBar;
local statusBars = {};
local function BuildCategories()
    totalStatusBar = LibStub("Krowi_ProgressBar-1.1"):New(KrowiAF_AchievementsSummaryFrame);
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

    totalStatusBar:SetPoint("TOP", KrowiAF_AchievementsSummaryFrame.Categories.Header, "BOTTOM", 0, 5);

    local yOffset = 10;

    local statusBar1 = NewStatusBar()
    statusBar1:SetPoint("TOPLEFT", totalStatusBar, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar1);

    local statusBar2 = NewStatusBar()
    statusBar2:SetPoint("TOPRIGHT", totalStatusBar, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar2);

    local statusBar3 = NewStatusBar()
    statusBar3:SetPoint("TOPLEFT", statusBar1, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar3);

    local statusBar4 = NewStatusBar()
    statusBar4:SetPoint("TOPRIGHT", statusBar2, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar4);

    local statusBar5 = NewStatusBar()
    statusBar5:SetPoint("TOPLEFT", statusBar3, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar5);

    local statusBar6 = NewStatusBar()
    statusBar6:SetPoint("TOPRIGHT", statusBar4, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar6);

    local statusBar7 = NewStatusBar()
    statusBar7:SetPoint("TOPLEFT", statusBar5, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar7);

    local statusBar8 = NewStatusBar()
    statusBar8:SetPoint("TOPRIGHT", statusBar6, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar8);

    local statusBar9 = NewStatusBar()
    statusBar9:SetPoint("TOPLEFT", statusBar7, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar9);

    local statusBar10 = NewStatusBar()
    statusBar10:SetPoint("TOPRIGHT", statusBar8, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar10);

    local statusBar11 = NewStatusBar()
    statusBar11:SetPoint("TOPLEFT", statusBar9, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar11);

    local statusBar12 = NewStatusBar()
    statusBar12:SetPoint("TOPRIGHT", statusBar10, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar12);

    local statusBar13 = NewStatusBar()
    statusBar13:SetPoint("TOPLEFT", statusBar11, "BOTTOMLEFT", 0, yOffset);
    tinsert(statusBars, statusBar13);

    local statusBar14 = NewStatusBar()
    statusBar14:SetPoint("TOPRIGHT", statusBar12, "BOTTOMRIGHT", 0, yOffset);
    tinsert(statusBars, statusBar14);

    KrowiAF_AchievementsSummaryFrame.TotalStatusBar = totalStatusBar;
    KrowiAF_AchievementsSummaryFrame.StatusBars = statusBars;
end

local function UpdateAchievements()
    local lastCompleted = #SavedData.Characters[UnitGUID("player")].LastCompleted;
    KrowiAF_AchievementsSummaryFrameAchievementsEmptyText:Show();
    if lastCompleted > 0 then
        KrowiAF_AchievementsSummaryFrameAchievementsEmptyText:Hide();
    end

    local scrollFrame = KrowiAF_AchievementsSummaryFrame.ScrollFrame.Container;
    local offset = HybridScrollFrame_GetOffset(scrollFrame);
    local achievementButtons = scrollFrame.buttons;

    local totalHeight = lastCompleted * achievementButtons[1]:GetHeight();
	local displayedHeight = 0;

    local id;
    for i = 1, #achievementButtons do
        local button = achievementButtons[i];
        id = SavedData.Characters[UnitGUID("player")].LastCompleted[i + offset];
        displayedHeight = displayedHeight + button:GetHeight();
        if id ~= nil then
            local _, name, points, completed, month, day, year, description, flags, icon, _, _, wasEarnedByMe, earnedBy, _ = addon.GetAchievementInfo(id);

            button.Achievement = addon.Data.Achievements[id];

            local saturatedStyle;
            if button.Achievement.NotObtainable then
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
            KrowiAF_AchievementFrameSummaryAchievement_OnEnter(button);
        end
    end
    HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight);
end

local media = "Interface\\AddOns\\Krowi_AchievementFilter\\Media\\";
local function Saturate(self)
    if self.Achievement.NotObtainable then
		self.titleBar:SetTexture(media .. "NotObtainableAchievementBorders");
		self.titleBar:SetTexCoord(0, 1, 0.66015625, 0.73828125);
		self:SetBackdropBorderColor(ACHIEVEMENT_RED_BORDER_COLOR:GetRGB());
		self.saturatedStyle = "NotObtainable";
	else
		if not addon.InGuildView() and not self.accountWide then
			self:SetBackdropBorderColor(ACHIEVEMENT_GOLD_BORDER_COLOR:GetRGB());
		end
	end
end

function KrowiAF_AchievementFrameSummaryAchievement_OnLoad(self)
	hooksecurefunc(self, "Saturate", Saturate);

	self.dateCompleted:Show();
end

function KrowiAF_AchievementFrameSummaryAchievement_OnClick(self, button, down)
    if self.Achievement == nil then
        return;
    end
    KrowiAF_SelectAchievementFromID(self.Achievement.ID, nil, true);
end

function KrowiAF_AchievementFrameSummaryAchievement_OnEnter(self, button, down)
    self.highlight:Show();
    if self.Achievement == nil then
        return;
    end
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    local link = GetAchievementLink(self.Achievement.ID);
    GameTooltip:SetHyperlink(link);
    AchievementFrameAchievements_CheckGuildMembersTooltip(self);
    GameTooltip:Show();
    if GameTooltip:GetTop() > self:GetTop() then
        GameTooltip:ClearAllPoints();
        GameTooltip:SetPoint("BOTTOMLEFT", self, "BOTTOMRIGHT");
    end
end

local function BuildAchievementsScrollFrame()
    local frame = KrowiAF_AchievementsSummaryFrame;
    local show = getmetatable(frame.ScrollFrame.Container.ScrollBar).__index.Show;
    frame.ScrollFrame.Container.ScrollBar.Show = function(self)
        frame.ScrollFrame:SetPoint("BOTTOMRIGHT", frame.Categories.Header, "TOPRIGHT", -40, 5);
        show(self);
    end
    local hide = getmetatable(frame.ScrollFrame.Container.ScrollBar).__index.Hide;
    frame.ScrollFrame.Container.ScrollBar.Hide = function(self)
        frame.ScrollFrame:SetPoint("BOTTOMRIGHT", frame.Categories.Header, "TOPRIGHT", -14, 5);
        hide(self);
    end
    frame.ScrollFrame.Container.update = summary.UpdateAchievements;
    HybridScrollFrame_CreateButtons(frame.ScrollFrame.Container, "KrowiAF_SummaryAchievementTemplate", 4, 0);
    for _, button in next, frame.ScrollFrame.Container.buttons do
        button:SetPoint("RIGHT", frame.ScrollFrame.Container, -5, 0);
    end
end

function summary.Load()
    local frame = CreateFrame("Frame", "KrowiAF_AchievementsSummaryFrame", AchievementFrame, "KrowiAF_SummaryFrame_Template");
    frame:SetWidth(504);
    frame:Show();
    for i, frameName in next, ACHIEVEMENTFRAME_SUBFRAMES do
		if frameName == gui.AchievementsFrame:GetName() then
			tinsert(ACHIEVEMENTFRAME_SUBFRAMES, i, frame:GetName());
			break;
		end
	end

    BuildCategories();
    BuildAchievementsScrollFrame();
end

function KrowiAF_AchievementFrameSummary_OnShow()
    KrowiAF_AchievementsSummaryFrame:SetWidth(530);
    summary.CategoriesStatusBar_Update();
    summary.UpdateAchievements();
end

function KrowiAF_AchievementFrameSummary_Update(self, event)
    print(event)
    summary.CategoriesStatusBar_Update(event);
    summary.UpdateAchievements(event);
end

function summary.CategoriesStatusBar_Update(event)
    if not gui.SelectedTab then
        return;
    end

    if event == "ACHIEVEMENT_EARNED" then
        addon.GUI.CategoriesFrame:Update(true);
    end
    local lastShown;
    local offset = 0;
    local totalNumOfAch, totalNumOfCompAch, totalNumOfNotObtAch = 0, 0, 0;
    local categories = gui.SelectedTab.Categories;
    for i = 1, #statusBars do
        while i + offset <= #categories and (categories[i + offset].IsSummary or categories[i + offset].HasFlexibleData) do
            offset = offset + 1;
        end
		local statusBar = statusBars[i];
		if i + offset <= #categories then
			local categoryName = categories[i + offset].Name;
			statusBar.TextLeft:SetText(categoryName);
			statusBar.Button.Category = categories[i + offset];
            local numOfAch, numOfCompAch, numOfNotObtAch = categories[i + offset].NumOfAch, categories[i + offset].NumOfCompAch, categories[i + offset].NumOfNotObtAch;
            totalNumOfAch = totalNumOfAch + numOfAch;
            totalNumOfCompAch = totalNumOfCompAch + numOfCompAch;
            totalNumOfNotObtAch = totalNumOfNotObtAch + numOfNotObtAch;
            local numOfNotObtAchText = "";
            if numOfNotObtAch > 0 and addon.Options.db.Tooltip.Categories.ShowNotObtainable then
                numOfNotObtAchText = " (+" .. numOfNotObtAch .. ")";
            end
            statusBar.TextRight:SetText(numOfCompAch .. numOfNotObtAchText .. " / " .. numOfAch);
            statusBar:SetMinMaxValues(0, numOfAch);
            if not addon.Options.db.Tooltip.Categories.ShowNotObtainable then
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
    if totalNumOfNotObtAch > 0 and addon.Options.db.Tooltip.Categories.ShowNotObtainable then
        totalNumOfNotObtAchText = " (+" .. totalNumOfNotObtAch .. ")";
    end
    totalStatusBar.TextRight:SetText(totalNumOfCompAch .. totalNumOfNotObtAchText .. " / " .. totalNumOfAch);
    totalStatusBar:SetMinMaxValues(0, totalNumOfAch);
    totalStatusBar:SetValues(totalNumOfCompAch, totalNumOfNotObtAch, 0, 0);
    totalStatusBar:UpdateTextures();

    KrowiAF_AchievementsSummaryFrameCategoriesHeader:ClearAllPoints();
    KrowiAF_AchievementsSummaryFrameCategoriesHeader:SetPoint("TOPLEFT", KrowiAF_AchievementsSummaryFrame, "BOTTOMLEFT", 0, 0);
    KrowiAF_AchievementsSummaryFrameCategoriesHeader:SetPoint("TOPRIGHT", KrowiAF_AchievementsSummaryFrame, "BOTTOMRIGHT", 0, 0);
    offset = KrowiAF_AchievementsSummaryFrame:GetBottom() - lastShown:GetBottom();
    KrowiAF_AchievementsSummaryFrameCategoriesHeader:SetPoint("TOPLEFT", KrowiAF_AchievementsSummaryFrame, "BOTTOMLEFT", 0, offset);
    KrowiAF_AchievementsSummaryFrameCategoriesHeader:SetPoint("TOPRIGHT", KrowiAF_AchievementsSummaryFrame, "BOTTOMRIGHT", 0, offset);
end

local numLastCompleted = 25; -- Default value in case of errors
local function BuildLastCompleted(event)
    numLastCompleted = addon.Options.db.Categories.Summary.NumAchievements;
    if type(SavedData.Characters[UnitGUID("player")].LastCompleted) == "table"
    and #SavedData.Characters[UnitGUID("player")].LastCompleted == numLastCompleted
    and not event == "ACHIEVEMENT_EARNED" then
        return;
    end
    local res = {};
    for achievementId, date in next, SavedData.Characters[UnitGUID("player")].CompletedAchievements do
        tinsert(res, {Id = achievementId, Date = date});
    end
    sort(res, function(a, b) return a.Date > b.Date; end);
    SavedData.Characters[UnitGUID("player")].LastCompleted = {};
    for i = 1, numLastCompleted, 1 do
        if res[i] == nil then
            return;
        end
        tinsert(SavedData.Characters[UnitGUID("player")].LastCompleted, res[i].Id)
    end
end

function summary.UpdateAchievements(event)
    BuildLastCompleted(event);
    UpdateAchievements();
end