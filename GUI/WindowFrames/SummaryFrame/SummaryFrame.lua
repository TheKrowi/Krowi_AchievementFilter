-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.SummaryFrame = {};
local summaryFrame = gui.SummaryFrame;

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

local totalStatusBar;
local statusBars = {};
local function NewStatusBar(self)
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

local function BuildCategories(self)
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

    NewStatusBar(self):SetPoint("TOPLEFT", totalStatusBar, "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", totalStatusBar, "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[1], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[2], "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[3], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[4], "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[5], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[6], "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[7], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[8], "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[9], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[10], "BOTTOMRIGHT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPLEFT", statusBars[11], "BOTTOMLEFT", 0, yOffset);
    NewStatusBar(self):SetPoint("TOPRIGHT", statusBars[12], "BOTTOMRIGHT", 0, yOffset);

    self.TotalStatusBar = totalStatusBar;
    self.StatusBars = statusBars;
end

function summaryFrame:Load()
    local frame = CreateFrame("Frame", "KrowiAF_AchievementFrameSummaryFrame", AchievementFrame, "KrowiAF_SummaryFrame_Template");
	frame:SetPoint("TOPLEFT", addon.GUI.CategoriesFrame, "TOPRIGHT", 0, 0);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", -20, 0);

    for i, subFrame in next, addon.GUI.SubFrames do
		if subFrame == gui.AchievementsFrame then
			tinsert(addon.GUI.SubFrames, i, frame);
			break;
		end
	end

    BuildCategories(frame);

    addon.GUI.SummaryFrame = frame;
end

function KrowiAF_AchievementFrameSummaryFrame_OnShow(self)
    self:RegisterEvent("ACHIEVEMENT_EARNED");
    self:Update();
end

function KrowiAF_AchievementFrameSummaryFrame_OnHide(self)
    self:UnregisterEvent("ACHIEVEMENT_EARNED");
end

function KrowiAF_AchievementFrameSummaryFrame_OnEvent(self, event)
    -- self:Update(event);
    addon.DelayFunction("KrowiAF_AchievementFrameSummaryFrame_OnEvent", 1, self.Update, self, event);
end