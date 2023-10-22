local _, addon = ...;
addon.Gui.AchievementFrameTabButtonFactory = {};
local achievementFrameTabButtonFactory = addon.Gui.AchievementFrameTabButtonFactory;

local ourTabs = {};
local onClick;

local function Base_OnClick(tabId)
    local tab = ourTabs[tabId];
    if not tab then
        return;
    end

    local categories = tab:GetCategories();
    if categories and not tab.SelectedCategory then
	    tab.SelectedCategory = categories[1];
    end

    if addon.IsWrathClassic then
        PanelTemplates_Tab_OnClick(_G["AchievementFrameTab" .. tabId], AchievementFrame);
    else
        if addon.InGuildView() then
            AchievementFrameBaseTab_OnClick(1);
            AchievementFrame_RefreshView();
            AchievementFrameGuildEmblemLeft:Hide();
            AchievementFrameGuildEmblemRight:Hide();
        end
	    AchievementFrame_UpdateTabs(tabId);
    end

    tab:ShowSubFrames();
end

local function Comparison_OnClick(tabId)
    -- No comparison support. Just open up the non-comparison achievement tab.
	AchievementFrameTab_OnClick = AchievementFrameBaseTab_OnClick; -- Also set the other tabs back to their default OnClick like Blizzard does
    onClick = Base_OnClick;
    onClick(tabId);
end

function achievementFrameTabButtonFactory:GetNew(index, text, framesToShow, categories, filters, waterMark)
    local tabId = AchievementFrame.numTabs + 1;
    local button = CreateFrame("Button", "AchievementFrameTab" .. tabId, AchievementFrame, "KrowiAF_AchievementFrameTab_Template"); -- Blizzard naming
    button:SetID(tabId);
    button:SetText(text);
    button.FramesToShow = framesToShow;
    button.SelectedAchievement = nil; -- Issue #6: Fix
	button.Categories = categories;
    if button.Categories then
	    button.SelectedCategory = button.Categories[1];
    end
    button.Filters = filters;
    button.WaterMark = waterMark or "Interface/AchievementFrame/UI-Achievement-AchievementWatermark";
    button.Index = index;
    ourTabs[tabId] = button;

    PanelTemplates_SetNumTabs(AchievementFrame, tabId);

    if #ourTabs == 0 then
        onClick = Base_OnClick;
        hooksecurefunc("AchievementFrame_DisplayComparison", function()
            onClick = Comparison_OnClick;
        end);
        if addon.Util.IsWrathClassic then
            hooksecurefunc("PanelTemplates_SetTab", function(_, clickedTabId) -- Issue #1: Broken
                self:AchievementFrame_UpdateTabs(clickedTabId);
            end);
        else
            hooksecurefunc("AchievementFrame_UpdateTabs", function(clickedTabId) -- Issue #1: Broken
                self:AchievementFrame_UpdateTabs(clickedTabId);
            end);
            hooksecurefunc("AchievementFrameBaseTab_OnClick", function(tabIndex)
                if tabIndex == 3 then -- Statistics tab does not refresh the guild/personal look
                    AchievementFrame_RefreshView();
                end
            end);
        end
    end

    return button;
end

function achievementFrameTabButtonFactory:Call_OnClick(tabId)
    onClick(tabId);
end

function achievementFrameTabButtonFactory:AchievementFrame_UpdateTabs(clickedTabId) -- Public for skinning
    local gui = addon.Gui;
    local ourTabClicked = ourTabs[clickedTabId] ~= nil;
    if ourTabClicked then -- One of our tabs was clicked
        gui.SetAchievementFrameWidth();
        gui.SetAchievementFrameHeight();
    else -- Not one of our tabs was clicked and size is not yet reset
        gui.ResetAchievementFrameWidth();
        gui.ResetAchievementFrameHeight();
        gui.SelectedTab = nil;
    end

    for id, tab in next, ourTabs do
		local y = id == clickedTabId and -5 or -3;
		tab.Text:SetPoint("CENTER", 0, y);
        if clickedTabId == id then
            gui.SelectedTab = tab;
        end
	end

    if addon.IsWrathClassic then -- We have to set this manually because this is normally done in the OnClick of each tab
        AchievementFrameTab1.text:SetPoint("CENTER", AchievementFrameTab1, "CENTER", 0, -3);
        AchievementFrameTab2.text:SetPoint("CENTER", AchievementFrameTab2, "CENTER", 0, -3);
    end
end

function achievementFrameTabButtonFactory:GetTabs() -- Needed for skinning
    return ourTabs;
end