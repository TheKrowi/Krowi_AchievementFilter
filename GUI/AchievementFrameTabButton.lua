-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AchievementFrameTabButton = {};
local achFrameTabBtn = gui.AchievementFrameTabButton;

local ourTabIDs = {};

-- [[ Constructors ]] --
achFrameTabBtn.__index = achFrameTabBtn; -- Used to support OOP like code
function achFrameTabBtn:New(addonName, name, bindingName, text, framesToShow, achievementsFrame, categoriesFrame, categories, filters)
	-- Increment ID
    PanelTemplates_SetNumTabs(AchievementFrame, AchievementFrame.numTabs + 1);

	-- Create frame
    local frame = CreateFrame("Button", "AchievementFrameTab" .. AchievementFrame.numTabs, AchievementFrame, "AchievementFrameTabButtonTemplate"); -- Blizzard naming
    frame:SetID(AchievementFrame.numTabs);
    frame.AddonName = addonName;
    frame.Name = name;
    frame.BindingName = bindingName;
    frame:SetText(text);
    addon.Util.InjectMetatable(frame, achFrameTabBtn);

	-- Set properties
    frame.ID = AchievementFrame.numTabs;
    tinsert(ourTabIDs, frame.ID);
    frame.AchievementsFrame = achievementsFrame;
    frame.CategoriesFrame = categoriesFrame;
    tinsert(framesToShow, 1, categoriesFrame);
    frame.FramesToShow = framesToShow;

    frame.SelectedAchievement = nil; -- Issue #6: Fix
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

    hooksecurefunc("AchievementFrame_UpdateTabs", function(clickedTab) -- Issue #1: Broken
        frame:AchievementFrame_UpdateTabs(frame, frame.ID, clickedTab);
    end);

    return frame;
end

function achFrameTabBtn:Base_OnClick(id)
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

    AchievementFrame_ShowSubFrame(unpack(self.FramesToShow));
    if self.SelectedCategory.IsSummary then
		addon.GUI.SummaryFrame:Show();
		addon.GUI.AchievementsFrame:Hide();
	else
		addon.GUI.AchievementsFrame:Show();
		addon.GUI.SummaryFrame:Hide();
	end
    AchievementFrameWaterMark:SetTexture("Interface\\AchievementFrame\\UI-Achievement-AchievementWatermark");

    if self.AchievementsFrame then
        if self.SelectedAchievement then
            self.AchievementsFrame:FindSelection();
        end
    end
end

function achFrameTabBtn:Comparison_OnClick(id)
    -- No comparison support. Just open up the non-comparison achievement tab.
	AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick; -- Also set the other tabs back to their default OnClick like Blizzard does
    self.OnClick = self.Base_OnClick;
    self:OnClick(id);
end

local achievementFrameSizeSet; -- If multiple tabs are added, this variable makes sure the resizing only fires once
function achFrameTabBtn:AchievementFrame_UpdateTabs(thisTab, thisTabID, clickedTab)
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
    if gui.SelectedTab ~= self then
        self:OnClick(self.ID);
    end
end