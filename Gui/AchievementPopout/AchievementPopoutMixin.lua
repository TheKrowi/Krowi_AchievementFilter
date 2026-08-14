local _, addon = ...;

KrowiAF_AchievementPopoutCloseButtonMixin = {};

function KrowiAF_AchievementPopoutCloseButtonMixin:OnClick()
	self:GetParent():Hide();
end

-- The button fully overlaps the popout, so hovering it must also refresh the popout's own chrome
function KrowiAF_AchievementPopoutCloseButtonMixin:OnEnter()
	self:GetParent():RefreshChrome();
end

function KrowiAF_AchievementPopoutCloseButtonMixin:OnLeave()
	self:GetParent():RefreshChrome();
end

KrowiAF_AchievementPopoutResizeButtonMixin = {};

function KrowiAF_AchievementPopoutResizeButtonMixin:OnMouseDown()
	local popout = self:GetParent();
	popout.Resizing = true; -- keeps the button shown for the whole drag; see UpdateChrome
	popout:SnapFrame_OnResizeStart();
	popout:StartSizing("BOTTOMRIGHT");
end

function KrowiAF_AchievementPopoutResizeButtonMixin:OnMouseUp()
	local popout = self:GetParent();
	popout.Resizing = nil;
	popout:StopMovingOrSizing();
	addon.Gui.AchievementPopout:SavePosition(popout);
	popout:RefreshChrome();
end

function KrowiAF_AchievementPopoutResizeButtonMixin:OnEnter()
	self:GetParent():RefreshChrome();
end

function KrowiAF_AchievementPopoutResizeButtonMixin:OnLeave()
	self:GetParent():RefreshChrome();
end

KrowiAF_AchievementPopoutMixin = {};

local minWidth, minHeight = 360, 100;

-- Animates the popout's alpha instead of snapping it, mirroring the AnimationGroup + Alpha pattern
-- other Blizzard/addon fades use (e.g. LibDBIcon's minimap button fade)
local function FadeTo(popout, targetAlpha)
	local currentAlpha = popout:GetAlpha();
	if currentAlpha == targetAlpha then
		return;
	end

	local duration = addon.Options.db.profile.Popout.FadeSpeed;
	popout.FadeAnimGroup:Stop();
	if duration <= 0 then
		popout:SetAlpha(targetAlpha);
		return;
	end

	popout.FadeAnim:SetFromAlpha(currentAlpha);
	popout.FadeAnim:SetToAlpha(targetAlpha);
	popout.FadeAnim:SetDuration(duration);
	popout.FadeAnimGroup:Play();
end

local function UpdateChrome(popout, hovered)
	local popoutOptions = addon.Options.db.profile.Popout;
	popout.CloseButton:SetShown(hovered or not popoutOptions.AutoHideCloseButton);
	-- Never hide mid-drag: the button's own OnMouseUp is what stops the resize, so hiding it
	-- (e.g. when the cursor drifts off its small hit-rect while dragging) would strand it in sizing mode
	popout.ResizeButton:SetShown(popout.Resizing or hovered or not popoutOptions.AutoHideResizeButton);
	FadeTo(popout, (popoutOptions.FadeWhenNotHovered and not hovered and popoutOptions.FadedOpacity) or 1);
end

-- Recomputes the objectives display and re-expands the button to fit; used instead of
-- AchievementButtonMixin:Update() since a popout button is never the main list's "selected" achievement.
local function RefreshButton(button)
	local height = button:DisplayObjectives(true);
	button:Expand(height);
	return height;
end

local function OnButtonClick(button, mouseButton)
	if mouseButton == "RightButton" then
		addon.Gui.RightClickMenu.AchievementMenu:Open(button, button.Achievement);
		return;
	end
	-- Left click: reuse the same shift-click-to-track/paste-to-chat/watch/exclude/pop-out
	-- modifiers as the main list button; otherwise open the achievement in the main window
	if addon.Gui.AchievementButton.ProcessModifiers(button) then
		return;
	end
	KrowiAF_SelectAchievementFromID(button.Achievement.Id);
end

local function OnButtonEvent(button, event, ...)
	if event ~= "ACHIEVEMENT_EARNED" and event ~= "TRACKED_ACHIEVEMENT_LIST_CHANGED" then
		return;
	end
	if not button.Achievement then
		return;
	end
	local achievementId = ...;
	if achievementId ~= button.Achievement.Id then
		return;
	end

	if event == "ACHIEVEMENT_EARNED" then
		local achievement = button.Achievement;
		button.Achievement = nil;
		button:SetAchievement(achievement, true);
	end
	RefreshButton(button);

	-- Popping out an already-completed achievement must still work; this only reacts to a live earn
	if event == "ACHIEVEMENT_EARNED" and addon.Options.db.profile.Popout.CloseOnEarn then
		local popout = button:GetParent();
		local delay = addon.Options.db.profile.Popout.CloseOnEarnDelay;
		if delay <= 0 then
			popout:Hide();
		else
			C_Timer.After(delay, function()
				if popout:IsShown() then
					popout:Hide();
				end
			end);
		end
	end
end

function KrowiAF_AchievementPopoutMixin:OnLoad()
	local popout = self;
	local button = self.Button;

	-- Button is declared last in the XML so it renders/hit-tests on top of the corner buttons;
	-- raise them above it so they can still receive mouse focus (enter/highlight/clicks) while shown
	self.CloseButton:SetFrameLevel(button:GetFrameLevel() + 1);
	self.ResizeButton:SetFrameLevel(button:GetFrameLevel() + 1);

	Mixin(self, KrowiAF_SnapFrameMixin);
	self:InitSnapping({
		IsEnabled = function() return addon.Options.db.profile.Popout.EnableSnapping; end,
		Threshold = function() return addon.Options.db.profile.Popout.SnapDistance; end,
		GetCandidates = function() return addon.Gui.AchievementPopout.OpenPopouts; end,
		OnSnapped = function(self_, parent) addon.Gui.AchievementPopout:OnSnapped(self_, parent); end,
		OnUnsnapped = function(self_) addon.Gui.AchievementPopout:OnUnsnapped(self_); end,
		OnClosed = function(self_, oldParent, oldChild) addon.Gui.AchievementPopout:OnSnapClosed(self_, oldParent, oldChild); end
	});

	self.FadeAnimGroup = self:CreateAnimationGroup();
	self.FadeAnim = self.FadeAnimGroup:CreateAnimation("Alpha");
	self.FadeAnimGroup:SetToFinalAlpha(true);

	UpdateChrome(self, false);

	-- Bypass AchievementButtonMixin's main-list selection/scroll behavior: this clone is standalone
	button:SetScript("OnClick", function(self_, mouseButton) OnButtonClick(self_, mouseButton); end);
	button:SetScript("OnEvent", function(self_, event, ...) OnButtonEvent(self_, event, ...); end);
	button:SetScript("OnSizeChanged", function() end);
	-- Show the tooltip only; skip the main list's Highlight border toggle since a popout button is never "selected"
	-- The button fully overlaps the popout, so it must also refresh the popout's own chrome on hover
	button:SetScript("OnEnter", function(self_) self_:ShowTooltip(); popout:RefreshChrome(); end);
	button:SetScript("OnLeave", function() Krowi_Tooltip:Hide(); popout:RefreshChrome(); end);

	button:RegisterForDrag("LeftButton");
	button:SetScript("OnDragStart", function()
		popout:SnapFrame_OnDragStart();
		popout:StartMoving();
	end);
	button:SetScript("OnDragStop", function()
		popout:StopMovingOrSizing();
		popout:SnapFrame_OnDragStop();
		if not popout.SnappedParent then
			ValidateFramePosition(popout);
		end
		addon.Gui.AchievementPopout:SavePosition(popout);
	end);

	self:RegisterForDrag("LeftButton");

	if self.SetResizeBounds then
		self:SetResizeBounds(minWidth, minHeight);
	else
		self:SetMinResize(minWidth, minHeight);
	end
end

function KrowiAF_AchievementPopoutMixin:OnDragStart()
	self:SnapFrame_OnDragStart();
	self:StartMoving();
end

function KrowiAF_AchievementPopoutMixin:OnDragStop()
	self:StopMovingOrSizing();
	self:SnapFrame_OnDragStop();
	if not self.SnappedParent then
		ValidateFramePosition(self);
	end
	addon.Gui.AchievementPopout:SavePosition(self);
end

function KrowiAF_AchievementPopoutMixin:OnSizeChanged(width)
	if self.Reflowing or not self.Button or not self.Button.Achievement then
		return;
	end

	self.Reflowing = true;
	self.Button:SetWidth(max(minWidth, width));
	local height = RefreshButton(self.Button);
	self:SetHeight(height);
	self.Reflowing = nil;
	self:SnapFrame_CascadeWidthToChild();
end

function KrowiAF_AchievementPopoutMixin:OnHide()
	addon.Gui.AchievementPopout:OnPopoutHide(self);
end

function KrowiAF_AchievementPopoutMixin:OnEnter()
	self:RefreshChrome();
end

function KrowiAF_AchievementPopoutMixin:OnLeave()
	self:RefreshChrome();
end

-- Called after a chrome-related option changes, so already-open popouts update immediately
function KrowiAF_AchievementPopoutMixin:RefreshChrome()
	UpdateChrome(self, self:IsMouseOver());
end

function KrowiAF_AchievementPopoutMixin:PopulateAchievement(achievement)
	local button = self.Button;
	button:SetAchievement(achievement, true);
	local height = RefreshButton(button);
	self:SetHeight(height);
end
