-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.AchievementsFrame = {};
local achievementsFrame = addon.GUI.AchievementsFrame;

function achievementsFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_AchievementsFrame", AchievementFrame, "KrowiAF_AchievementsFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 0);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", -20, 0);

	tinsert(addon.GUI.SubFrames, frame);

	local scrollFrame = frame.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
	local scrollBarShow = getmetatable(scrollBar).__index.Show;
	scrollBar.Show = function()
		frame.Show_Hide(frame, scrollBarShow, -46);
	end;
	local scrollBarHide = getmetatable(scrollBar).__index.Hide;
	scrollBar.Hide = function()
		frame.Show_Hide(frame, scrollBarHide, -20);
	end;

	scrollFrame.update = function()
		frame:Update();
	end

	local template = "KrowiAF_AchievementButton_" .. (addon.Options.db.Achievements.Compact and "Small" or "Normal") .. "_Template";
	HybridScrollFrame_CreateButtons(scrollFrame, template, 0, -2);
	local buttons = scrollFrame.buttons;
    for _, button in next, buttons do
		button:PostLoad(scrollFrame);
	end

	hooksecurefunc("AchievementFrameAchievements_ForceUpdate", function()
		frame:ForceUpdate();
	end); -- Issue #3: Fix

	frame.ScrollBarStep = scrollBar:GetValueStep();

	addon.GUI.AchievementsFrame = frame; -- Overwrite with the actual frame since all functions are injected to it
end