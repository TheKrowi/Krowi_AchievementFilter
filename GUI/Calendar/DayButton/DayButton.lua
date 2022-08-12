-- [[ Namespaces ]] --
local _, addon = ...;

function KrowiAF_CalendarDayButton_OnEnter(self)
	if not self.Day then
		-- not yet updated
		return;
	end

	addon.GUI.Calendar.Frame:SetHighlightedDay(self);
end

function KrowiAF_CalendarDayButton_OnLeave(self)
	addon.GUI.Calendar.Frame:SetHighlightedDay();
end

function KrowiAF_CalendarDayButton_OnClick(self)
	local isSelected = self.IsSelected;
	if isSelected then
		self:Deselect();
	else
		self:Select();
	end

	addon.GUI.Calendar.Frame:SetSelectedDay(self);

	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
end