local _, addon = ...;

KrowiAF_SearchResultsFrameMixin = {};

local function CreateScrollView(self)
	self.ScrollView = CreateScrollBoxListLinearView();
	self.ScrollView:SetElementInitializer("KrowiAF_SearchResultsButton_Template", function(button, achievement)
		button:SetAchievement(achievement);
	end);
	ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, self.ScrollView);
end

local function AddManagedScrollBarVisibilityBehavior(self)
	local anchorsWithBar = {
        CreateAnchor("TOPLEFT", self.topLeftCorner2, "TOPLEFT", 9, -8),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", 0, 0)
    };

    local anchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self.topLeftCorner2, "TOPLEFT", 9, -8),
        CreateAnchor("BOTTOMRIGHT", self.bottomRightCorner, "BOTTOMRIGHT", -4, 7)
    };

    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, anchorsWithBar, anchorsWithoutBar);
end

function KrowiAF_SearchResultsFrameMixin:OnLoad()
	self.ScrollBox.wheelPanScalar = addon.Options.db.profile.SearchBox.MouseWheelPanScalar;
	self.ScrollBar.wheelPanScalar = addon.Options.db.profile.SearchBox.MouseWheelPanScalar;

	CreateScrollView(self);
	AddManagedScrollBarVisibilityBehavior(self);
end

function KrowiAF_SearchResultsFrameMixin:OnShow()
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 10);
	PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN);
end

function KrowiAF_SearchResultsFrameMixin:OnHide()
	PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE);
end

local savedQuery, savedResults;
local function UpdateDataProvider(self, query, results)
	savedQuery = query or savedQuery;
	savedResults = results or savedResults;

	local newDataProvider = CreateDataProvider();
	for _, achievement in next, savedResults do
		newDataProvider:Insert(achievement);
	end
	self.ScrollBox:SetDataProvider(newDataProvider);
end

function KrowiAF_SearchResultsFrameMixin:Update(query, results)
	self:SetPoint("TOP", 0, -112); -- Need to reset the frame before we can adjust again

	UpdateDataProvider(self, query, results);

	local numScrollBoxButtons = self.ScrollBox:GetHeight() / 49;
	local numFullScrollBoxButtons = floor(numScrollBoxButtons + 0.5);
	local offset = (numScrollBoxButtons - min(numFullScrollBoxButtons, #results)) * 49;
	self:SetPoint("TOP", 0, -112 - offset);
	self.TitleText:SetText(string.format(ENCOUNTER_JOURNAL_SEARCH_RESULTS, savedQuery, #savedResults));
end