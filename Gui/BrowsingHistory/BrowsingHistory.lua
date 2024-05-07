local _, addon = ...;
addon.Gui.BrowsingHistory = {};
local browsingHistory = addon.Gui.BrowsingHistory;

KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin = {};

function KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin:OnEnter()

end

function KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin:OnLeave()
    GameTooltip:Hide();
end

function KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin:Click()
    addon.BrowsingHistory:SetIndexOffset(self.HistoryOffset);
    browsingHistory:Update();
    local record = addon.BrowsingHistory:GetCurrentRecord();
    if not record then
        addon.BrowsingHistory:Unlock();
        return;
    end
    local category = addon.Data.Categories[record.CategoryId];
    local achievement = addon.Data.Achievements[record.AchievementId];
    KrowiAF_SelectAchievementWithCategory(achievement, category);

    if GameTooltip:GetOwner() == self then
        self:OnEnter();
    end
end

function KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin:OnClick()
    self:Click();
end

local function GetCategoryPath(categoryId)
    local category = addon.Data.Categories[categoryId];
    local categoriesTree = category:GetTree();
    local path = categoriesTree[1].Name;
    for j = 2, #categoriesTree do
        path = path .. " > " .. categoriesTree[j].Name;
    end
    return path;
end

local function SetTooltipHistory()
    local records = addon.BrowsingHistory:GetAllRecords();
    GameTooltip_AddBlankLineToTooltip(GameTooltip);
    if #records < 1 then
        local color = addon.Util.Colors.LightGreyRGB;
        GameTooltip:AddLine(addon.L["Select achievements to see your browsing history"], color.R, color.G, color.B);
        GameTooltip:Show();
        return;
    end

    local currentIndex = addon.BrowsingHistory:GetCurrentIndex();
    local firstIndex = max(addon.BrowsingHistory:GetMinIndex(), currentIndex - 10);
    local lastIndex = min(currentIndex + 10, addon.BrowsingHistory:GetMaxIndex());
    for i = firstIndex, lastIndex do
        local color = i == currentIndex and addon.Util.Colors.LightGreenRGB or addon.Util.Colors.LightGreyRGB;
        local path = GetCategoryPath(records[i].CategoryId);
        local _, name = addon.GetAchievementInfo(records[i].AchievementId);
        GameTooltip:AddLine(path .. " > " .. name, color.R, color.G, color.B);
    end
    -- for index, record in next, records do
    --     local color = index == currentIndex and addon.Util.Colors.LightGreenRGB or addon.Util.Colors.LightGreyRGB;
    --     local path = GetCategoryPath(record.CategoryId);
    --     local _, name = addon.GetAchievementInfo(record.AchievementId);
    --     GameTooltip:AddLine(path .. " > " .. name, color.R, color.G, color.B);
    -- end
    GameTooltip:Show();
end

KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButtonMixin = CreateFromMixins(KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin);

function KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPRIGHT", self, "TOPLEFT");
    GameTooltip:SetText(addon.L["Go back one achievement"]);
    SetTooltipHistory();
end

KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButtonMixin = CreateFromMixins(KrowiAF_AchievementFrameBrowsingHistoryPrevNextAchievementButtonMixin);

function KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButtonMixin:OnEnter()
    GameTooltip:SetOwner(self, "ANCHOR_NONE");
    GameTooltip:SetPoint("TOPLEFT", self, "TOPRIGHT");
    GameTooltip:SetText(addon.L["Go forward one achievement"]);
    SetTooltipHistory();
end

function browsingHistory:Load()
    if not addon.Options.db.profile.TrackAchievementBrowserHistory then
        return;
    end
    self.NextAchievementButton = CreateFrame("Button", "KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton", AchievementFrame.Header, "KrowiAF_AchievementFrameBrowsingHistoryNextAchievementButton_Template");
    self.NextAchievementButton:SetPoint("RIGHT", AchievementFrame.Header.PointBorder, "LEFT", 10, -1);
    -- self.NextAchievementButton:SetPoint("LEFT", AchievementFrame.Header.PointBorder, "RIGHT", -10, -1);
    self.PrevAchievementButton = CreateFrame("Button", "KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton", AchievementFrame.Header, "KrowiAF_AchievementFrameBrowsingHistoryPrevAchievementButton_Template");
    -- self.PrevAchievementButton:SetPoint("RIGHT", AchievementFrame.Header.PointBorder, "LEFT", 10, -1);
    self.PrevAchievementButton:SetPoint("RIGHT", self.NextAchievementButton, "LEFT", 5, 0);
    self:Update();
end

local function UpdatePrevAchievementButton(self)
	if addon.BrowsingHistory:GetCurrentIndex() <= addon.BrowsingHistory:GetMinIndex() then
		self.PrevAchievementButton:Disable();
		return;
	end
	self.PrevAchievementButton:Enable();
end

local function UpdateNextAchievementButton(self)
	if addon.BrowsingHistory:GetCurrentIndex() >= addon.BrowsingHistory:GetMaxIndex() then
		self.NextAchievementButton:Disable();
		return;
	end
	self.NextAchievementButton:Enable();
end

function browsingHistory:Update()
    UpdatePrevAchievementButton(self);
    UpdateNextAchievementButton(self);
end