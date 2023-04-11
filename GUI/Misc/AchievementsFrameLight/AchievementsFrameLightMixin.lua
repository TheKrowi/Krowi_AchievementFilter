-- [[ Namespaces ]] --
local _, addon = ...;
local achievementButton = addon.GUI.AchievementButton;
local getCollapsedHeight = achievementButton.GetCollapsedHeight;

AchievementsFrameLightMixin = {};

local refreshAchievements;
local function CreateScrollView(self)
	local template = "KrowiAF_AchievementButton_Light_Template";

	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer(template, function(button, achievement)
		button:Update(achievement, refreshAchievements, true);
	end);
	self.ScrollView:SetElementExtent(getCollapsedHeight(template));
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

function AchievementsFrameLightMixin:OnLoad()
    CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
end

local alwaysHideBorder;
function AchievementsFrameLightMixin:AlwaysHideBorder()
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

local function UpdateDataProvider(self, achievementIds)
	local newDataProvider = CreateDataProvider();
	for _, achievementId in next, achievementIds do
		newDataProvider:Insert(addon.Data.Achievements[achievementId]);
	end
	self.ScrollBox:SetDataProvider(newDataProvider);
end

function AchievementsFrameLightMixin:Update(achievementIds, _refreshAchievements)
    local numAchievements = achievementIds and #achievementIds or 0;
    HideEmptyText(self);
    if numAchievements <= 0 then
        ShowEmptyText(self);
        return;
    end

    refreshAchievements = _refreshAchievements;
    UpdateDataProvider(self, achievementIds);
end