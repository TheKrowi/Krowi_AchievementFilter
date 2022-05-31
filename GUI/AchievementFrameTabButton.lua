-- [[ Namespaces ]] --
local _, addon = ...;
local diagnostics = addon.Diagnostics;
local gui = addon.GUI;
gui.AchievementFrameTabButton = {};
local achFrameTabBtn = gui.AchievementFrameTabButton;

local ourTabIDs = {};

-- [[ Constructors ]] --
achFrameTabBtn.__index = achFrameTabBtn; -- Used to support OOP like code
function achFrameTabBtn:New(addonName, name, text, framesToShow, achievementsFrame, categoriesFrame, categories, filters)
    diagnostics.Trace("achievementFrameTabButton:New");

	-- Increment ID
    PanelTemplates_SetNumTabs(AchievementFrame, AchievementFrame.numTabs + 1);

	-- Create frame
    local frame = CreateFrame("Button", "AchievementFrameTab" .. AchievementFrame.numTabs, AchievementFrame, "AchievementFrameTabButtonTemplate"); -- Blizzard naming
    frame:SetID(AchievementFrame.numTabs);
    frame.AddonName = addonName;
    frame.Name = name;
    frame:SetText(text);
    addon.Util.InjectMetatable(frame, achFrameTabBtn);

	-- Set properties
    frame.ID = AchievementFrame.numTabs;
    tinsert(ourTabIDs, frame.ID);
    frame.AchievementsFrame = achievementsFrame;
    tinsert(framesToShow, 1, achievementsFrame);
    frame.CategoriesFrame = categoriesFrame;
    tinsert(framesToShow, 1, categoriesFrame);
    frame.FramesToShow = framesToShow;

    -- frame.AchievementsFrameScrollBarValue = 0;
    frame.SelectedAchievement = nil; -- Issue #6: Fix
    -- frame.CategoriesFrameScrollBarValue = 0;
	frame.Categories = categories;
    if frame.Categories then
	    frame.SelectedCategory = frame.Categories[1];
    end

    frame.Filters = filters;

    frame:SetScript("OnClick", function(selfFunc)
        frame:OnClick(selfFunc:GetID());
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);

    frame.OnClick = frame.Base_OnClick;

    hooksecurefunc("AchievementFrame_DisplayComparison", function()
        frame.OnClick = frame.Comparison_OnClick;
    end);

    hooksecurefunc("AchievementFrame_SetTabs", function()
        frame:SetPoint("LEFT", "AchievementFrameTab" .. frame.ID - 1, "RIGHT", -5, 0); -- Can break if other addon adds tab with "bad" name
    end);

    hooksecurefunc("AchievementFrame_UpdateTabs", function(clickedTab) -- Issue #1: Broken
        frame:AchievementFrame_UpdateTabs(frame, frame.ID, clickedTab);
    end);

    return frame;
end

function achFrameTabBtn:Base_OnClick(id)
    diagnostics.Trace("achFrameTabBtn:Base_OnClick");

	AchievementFrame_UpdateTabs(id);

    if addon.InGuildView() then
        AchievementFrame_ToggleView();
        AchievementFrameGuildEmblemLeft:Hide();
        AchievementFrameGuildEmblemRight:Hide();
    end

    if self.CategoriesFrame and self.CategoriesFrame:IsShown() then
        self.CategoriesFrame:Hide();
    end

    if self.AchievementsFrame and self.AchievementsFrame:IsShown() then
        self.AchievementsFrame.Container.ScrollBar:SetValue(0);
        self.AchievementsFrame:Hide();
    end

    if self.SelectedCategory == self.Categories[1] and self.SelectedCategory.Achievements == nil then
        self.SelectedCategory = self.Categories[2]; -- Make sure the focused category has achievements if selected, otherwise we select current zone
    end

    AchievementFrame_ShowSubFrame(unpack(self.FramesToShow));
    AchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark");

    if self.AchievementsFrame then
        if self.SelectedAchievement then
            self.AchievementsFrame:FindSelection();
        end
    end
end

function achFrameTabBtn:Comparison_OnClick(id)
    diagnostics.Trace("achFrameTabBtn:Comparison_OnClick");

    -- No comparison support. Just open up the non-comparison achievement tab.
	AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick; -- Also set the other tabs back to their default OnClick like Blizzard does
    self.OnClick = self.Base_OnClick;
    self:OnClick(id);
end

local achievementFrameSizeSet; -- If multiple tabs are added, this variable makes sure the resizing only fires once
function achFrameTabBtn:AchievementFrame_UpdateTabs(thisTab, thisTabID, clickedTab)
    diagnostics.Trace("achFrameTabBtn:AchievementFrame_UpdateTabs - " .. tostring(thisTabID) .. " - " .. tostring(clickedTab));

    local ourTabClicked; -- Extra logic to handle multiple tabs of ours
    for _, id in next, ourTabIDs do
        if clickedTab == id then
            ourTabClicked = true;
        end
    end
    if ourTabClicked then -- One of our tabs was clicked
        if not achievementFrameSizeSet then -- And custom size was not yet set
            gui.SetAchievementFrameWidth(addon.Options.db.Window.CategoriesFrameWidthOffset);
            gui.SetAchievementFrameHeight(addon.Options.db.Window.AchievementFrameHeightOffset);
            achievementFrameSizeSet = true;
        end
    elseif achievementFrameSizeSet then -- Not one of our tabs was clicked and size is not yet reset
        gui.ResetAchievementFrameWidth();
        gui.ResetAchievementFrameHeight();
        achievementFrameSizeSet = nil;
        gui.SelectedTab = nil;
    end

    if thisTabID == clickedTab then
        thisTab.text:SetPoint("CENTER", 0, -5);
        gui.SelectedTab = self;
    else
        thisTab.text:SetPoint("CENTER", 0, -3);
    end
end

function achFrameTabBtn:Select()
    diagnostics.Trace("achFrameTabBtn:Select");

    if gui.SelectedTab ~= self then
        self:OnClick(self.ID);
    end
end