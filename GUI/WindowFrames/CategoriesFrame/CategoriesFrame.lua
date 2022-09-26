-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.CategoriesFrame = {};
local categoriesFrame = addon.GUI.CategoriesFrame;

-- [[ Constructors ]] --
function categoriesFrame:Load()
	local frame = CreateFrame("Frame", "KrowiAF_CategoriesFrame", AchievementFrame, "KrowiAF_CategoriesFrame_Template");
	frame:SetPoint("TOPLEFT", AchievementFrameCategories);
	frame:SetPoint("BOTTOM", 0, 20);
	frame:SetPoint("RIGHT", AchievementFrameCategories, addon.Options.db.Window.CategoriesFrameWidthOffset, 0);

	-- We need to insert the categories frame infront of the achievements frame so the show/hide function fire in the correct order
	for i, subFrame in next, addon.GUI.SubFrames do
		if subFrame == addon.GUI.AchievementsFrame then
			tinsert(addon.GUI.SubFrames, i, frame);
			break;
		end
	end

	local scrollFrame = frame.ScrollFrame;
	local scrollBar = scrollFrame.ScrollBar;
	local scrollBarShow = getmetatable(scrollBar).__index.Show;
	scrollBar.Show = function()
		frame:Show_Hide(scrollBarShow, 22);
	end;
	local scrollBarHide = getmetatable(scrollBar).__index.Hide;
	scrollBar.Hide = function()
		frame:Show_Hide(scrollBarHide, 0);
	end;

	scrollFrame.update = function()
		frame:Update(); -- Issue #12: Broken
	end

	HybridScrollFrame_CreateButtons(scrollFrame, "KrowiAF_CategoryButton_Template", -2, 0, "TOPRIGHT", "TOPRIGHT", 0, 0, "TOPRIGHT", "BOTTOMRIGHT");

	addon.GUI.CategoriesFrame = frame;
end

function KrowiAF_CategoriesFrame_OnShow(self) -- Used in Templates - KrowiAF_CategoriesFrame_Template
	AchievementFrameCategories:Hide(); -- Issue #11: Fix
	AchievementFrameFilterDropDown:Hide();
	if not addon.IsWrathClassic then
		AchievementFrame.SearchBox:Hide();
		AchievementFrame.Header.LeftDDLInset:Show();
	end
	AchievementFrameWaterMark:SetTexture(addon.GUI.SelectedTab and addon.GUI.SelectedTab.WaterMark or "Interface/AchievementFrame/UI-Achievement-AchievementWatermark");
	AchievementFrameCategoriesBG:SetTexCoord(0, 0.5, 0, 1); -- Set this global texture for player achievements
	self:Update();
end

function KrowiAF_CategoriesFrame_OnHide() -- Used in Templates - KrowiAF_CategoriesFrame_Template
	AchievementFrameCategories:Show(); -- Issue #11: Fix
	AchievementFrameCategoriesBG:SetWidth(195); -- Set back to default value
	if not AchievementFrameAchievements:IsShown() then
		AchievementFrameFilterDropDown:Hide();
		if not addon.IsWrathClassic then
			AchievementFrame.Header.LeftDDLInset:Hide();
		end
	end
	if not addon.IsWrathClassic then
		AchievementFrame.SearchBox:Show();
	end
end