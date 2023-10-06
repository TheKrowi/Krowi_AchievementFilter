-- [[ Namespaces ]] --
local _, addon = ...;
addon.GUI.Calendar.Frame = {};
local frame = addon.GUI.Calendar.Frame;

function frame:Load()
	local frame2 = CreateFrame("Frame", "KrowiAF_AchievementCalendarFrame", UIParent, "KrowiAF_AchievementCalendarFrame_Template");
	addon.GUI.SetFrameToLastPosition(frame2, "Calendar");

	addon.GUI.Calendar.Frame = frame2; -- Overwrite with the actual frame since all functions are injected to it
end

function KrowiAF_CalendarFrameTodayFrame_OnUpdate(self, elapsed)
	self.timer = self.timer - elapsed;
	if self.timer < 0 then
		self.timer = self.fadeTime;
		if self.fadein then
			self.fadein = false;
		else
			self.fadein = true;
		end
	else
		if self.fadein then
			self.Glow:SetAlpha(1 - (self.timer / self.fadeTime));
		else
			self.Glow:SetAlpha(self.timer / self.fadeTime);
		end
	end
end

function KrowiAF_CalendarFramePrevMonthButton_OnClick()
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	C_CalendarSetMonth(-1);
	addon.GUI.Calendar.Frame:Update();
end

function KrowiAF_CalendarFrameNextMonthButton_OnClick()
	PlaySound(SOUNDKIT.IG_ABILITY_PAGE_TURN);
	C_CalendarSetMonth(1);
	addon.GUI.Calendar.Frame:Update();
end

-- function KrowiAF_CalendarFrameCloseButton_OnClick(self)
	
-- 	self:GetParent():Hide();
-- end

function KrowiAF_CalendarFrameCloseButton_OnKeyDown(self, key)
    if key == GetBindingKey("TOGGLEGAMEMENU") then
		if self:GetParent():IsShown() and not self:GetParent().SideFrame:IsShown() then
			-- self:Click(self);
            self:GetParent():Hide();
			self:SetPropagateKeyboardInput(false);
			return;
		end
	end
	self:SetPropagateKeyboardInput(true);
end

local firstTimeOpen = true;
function KrowiAF_CalendarFrame_OnShow(self)
	self:RegisterEvent("ACHIEVEMENT_EARNED");
	if (not self.LockMonth and not addon.Options.db.profile.Calendar.LockMonth) or firstTimeOpen then
		local currentCalendarTime = C_DateAndTime.GetCurrentCalendarTime();
		C_CalendarSetAbsMonth(currentCalendarTime.month, currentCalendarTime.year);
		self:Update();
		firstTimeOpen = nil;
	end
	self.LockMonth = nil;
	PlaySound(SOUNDKIT.IG_SPELLBOOK_OPEN);
end

function KrowiAF_CalendarFrame_OnHide(self)
	self:UnregisterEvent("ACHIEVEMENT_EARNED");
	PlaySound(SOUNDKIT.IG_SPELLBOOK_CLOSE);
end

function KrowiAF_CalendarFrame_OnEvent(self, event, ...)
	if event ~= "ACHIEVEMENT_EARNED" then
		return;
	end
	addon.DelayFunction("KrowiAF_CalendarFrame_OnEvent", 1, function()
		self:Update();
		if self.SelectedDayButton then
			self:SetSelectedDay(self.SelectedDayButton, true, true);
		end
	end);
end

function KrowiAF_CalendarFrame_OnMouseWheel(self, value)
	if value > 0 then
		if addon.GUI.Calendar.Frame.PrevMonthButton:IsEnabled() then
			KrowiAF_CalendarFramePrevMonthButton_OnClick();
		end
	else
		if addon.GUI.Calendar.Frame.NextMonthButton:IsEnabled() then
			KrowiAF_CalendarFrameNextMonthButton_OnClick();
		end
	end
end