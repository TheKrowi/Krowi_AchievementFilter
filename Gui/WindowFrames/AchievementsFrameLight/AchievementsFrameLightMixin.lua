local _, addon = ...;

KrowiAF_AchievementsFrameLightMixin = {};

local refreshAchievements;
local function CreateScrollView(self)
	local template = "KrowiAF_AchievementButton_Light_Template";
    self.DummyFrame = CreateFrame("Button", nil, self, template);

	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer(template, function(button, achievement)
		button:Update(achievement, refreshAchievements, true);
	end);
	self.ScrollView:SetElementExtent(self.DummyFrame.CollapsedHeight);
    self.ScrollView:SetPadding(0, 0, 5, 5, 0);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);
	ScrollUtil.AddResizableChildrenBehavior(self.ScrollBox);
end

local function AddManagedScrollBarVisibilityBehavior(self)
	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", 0, 5)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 0, -5),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 5)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithBar, anchorsWithoutBar);
end

function KrowiAF_AchievementsFrameLightMixin:OnLoad()
    CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
end

local alwaysHideBorder;
function KrowiAF_AchievementsFrameLightMixin:AlwaysHideBorder()
    alwaysHideBorder = true;
    self.Border:Hide();
end

local function ShowEmptyText(self)
    self.EmptyText:Show();
    self.Border:Hide();
end

local function HideEmptyText(self)
    self.EmptyText:Hide();
    if not alwaysHideBorder then
        self.Border:Show();
    end
end

local function UpdateDataProvider(self, achievementIds, numAchievements)
	local newDataProvider = CreateDataProvider();
    for i = 1, numAchievements do
        newDataProvider:Insert(addon.Data.Achievements[achievementIds[i]]);
    end
	self.ScrollBox:SetDataProvider(newDataProvider);
end

local function ShowHideEmptyText(self, numAchievements)
    if numAchievements <= 0 then
        ShowEmptyText(self);
        return;
    end
    HideEmptyText(self);
end

function KrowiAF_AchievementsFrameLightMixin:Update(achievementIds, _refreshAchievements, autoNumAchievements)
    local numAchievements = achievementIds and #achievementIds or 0;
    if autoNumAchievements then
        numAchievements = floor(self:GetHeight() / self.DummyFrame.CollapsedHeight);
    end
    refreshAchievements = _refreshAchievements;
    ShowHideEmptyText(self, numAchievements);
    UpdateDataProvider(self, achievementIds, numAchievements);
    return max(0, (self:GetHeight() / self.DummyFrame.CollapsedHeight - numAchievements) * self.DummyFrame.CollapsedHeight - 10);
end