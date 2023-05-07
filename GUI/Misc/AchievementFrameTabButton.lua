-- [[ Namespaces ]] --
local _, addon = ...;
local gui = addon.GUI;
gui.AchievementFrameTabButton = {};
local achFrameTabBtn = gui.AchievementFrameTabButton;

local ourTabIDs = {};

-- [[ Constructors ]] --
achFrameTabBtn.__index = achFrameTabBtn; -- Used to support OOP like code
function achFrameTabBtn:New(text, framesToShow, categories, filters, waterMark)
	-- Increment id
    local tabId = AchievementFrame.numTabs + 1;

	-- Create frame
    local frame = CreateFrame("Button", "AchievementFrameTab" .. tabId, AchievementFrame, "AchievementFrameTabButtonTemplate"); -- Blizzard naming
    frame:SetID(tabId);
    frame:SetText(text);
    addon.Util.InjectMetatable(frame, achFrameTabBtn);

	-- Set properties
    frame.Id = tabId;
    tinsert(ourTabIDs, frame.Id);
    frame.FramesToShow = framesToShow;

    frame.SelectedAchievement = nil; -- Issue #6: Fix
	frame.Categories = categories;
    if frame.Categories then
	    frame.SelectedCategory = frame.Categories[1];
    end

    frame.Filters = filters;
    frame.WaterMark = waterMark or "Interface/AchievementFrame/UI-Achievement-AchievementWatermark";

    frame:SetScript("OnClick", function(selfFunc)
        frame:OnClick(selfFunc:GetID());
        PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB);
    end);

    frame.OnClick = frame.Base_OnClick;

    hooksecurefunc("AchievementFrame_DisplayComparison", function()
        frame.OnClick = frame.Comparison_OnClick;
    end);

    if addon.IsWrathClassic then
        hooksecurefunc("PanelTemplates_SetTab", function(_, clickedTab) -- Issue #1: Broken
            frame:AchievementFrame_UpdateTabs(frame, frame.Id, clickedTab);
        end);
    else
        hooksecurefunc("AchievementFrame_UpdateTabs", function(clickedTab) -- Issue #1: Broken
            frame:AchievementFrame_UpdateTabs(frame, frame.Id, clickedTab);
        end);
    end

    PanelTemplates_SetNumTabs(AchievementFrame, tabId);

    return frame;
end

function achFrameTabBtn:Base_OnClick(id)
    -- print("base click", id)
    if addon.IsWrathClassic then
        PanelTemplates_Tab_OnClick(_G["AchievementFrameTab" .. id], AchievementFrame);
    else
        if addon.InGuildView() then
            AchievementFrameBaseTab_OnClick(1);
            AchievementFrame_RefreshView();
            AchievementFrameGuildEmblemLeft:Hide();
            AchievementFrameGuildEmblemRight:Hide();
        end
	    AchievementFrame_UpdateTabs(id);
    end

    AchievementFrame_ShowSubFrame(); -- Hide all frames

    AchievementFrame_ShowSubFrame(unpack(self.FramesToShow));
    if self.SelectedCategory.IsSummary then
		addon.GUI.SummaryFrame:Show();
		addon.GUI.AchievementsFrame:Hide();
	else
		addon.GUI.SummaryFrame:Hide();
		addon.GUI.AchievementsFrame:Show();
        addon.GUI.AchievementsFrame:Update();
        if self.SelectedAchievement then
	        addon.GUI.AchievementsFrame.ScrollBox:ScrollToElementData(self.SelectedAchievement, ScrollBoxConstants.AlignCenter, ScrollBoxConstants.NoScrollInterpolation);
            addon.GUI.AchievementsFrame.SelectionBehavior:SelectElementData(self.SelectedAchievement);
            addon.GUI.AchievementsFrame:ScrollToNearest(self.SelectedAchievement);
        end
	end
    AchievementFrameWaterMark:SetTexture(self.WaterMark);
end

function achFrameTabBtn:Comparison_OnClick(id)
    -- No comparison support. Just open up the non-comparison achievement tab.
	AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick; -- Also set the other tabs back to their default OnClick like Blizzard does
    self.OnClick = self.Base_OnClick;
    self:OnClick(id);
end

local achievementFrameSizeSet; -- If multiple tabs are added, this variable makes sure the resizing only fires once
function achFrameTabBtn:AchievementFrame_UpdateTabs(thisTab, thisTabID, clickedTab)
    -- print("update tabs", thisTab, thisTabID, clickedTab)
    local ourTabClicked; -- Extra logic to handle multiple tabs of ours
    for _, id in next, ourTabIDs do
        if clickedTab == id then
            ourTabClicked = true;
        end
    end
    if ourTabClicked then -- One of our tabs was clicked
        if not achievementFrameSizeSet then -- And custom size was not yet set
            gui.SetAchievementFrameWidth();
            gui.SetAchievementFrameHeight();
            achievementFrameSizeSet = true;
        end
    elseif achievementFrameSizeSet then -- Not one of our tabs was clicked and size is not yet reset
        gui.ResetAchievementFrameWidth();
        gui.ResetAchievementFrameHeight();
        achievementFrameSizeSet = nil;
        gui.SelectedTab = nil;
    end

    if thisTabID == clickedTab then
        thisTab.Text:SetPoint("CENTER", 0, -5);
        gui.SelectedTab = self;
    else
        thisTab.Text:SetPoint("CENTER", 0, -3);
    end

    if addon.IsWrathClassic then -- We have to set this manually because this is normally done in the OnClick of each tab
        AchievementFrameTab1.text:SetPoint("CENTER", AchievementFrameTab1, "CENTER", 0, -3);
        AchievementFrameTab2.text:SetPoint("CENTER", AchievementFrameTab2, "CENTER", 0, -3);
    end
end

function achFrameTabBtn:Select()
    if gui.SelectedTab ~= self then
        self:OnClick(self.Id);
    end
end