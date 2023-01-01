-- [[ Namespaces ]] --
local _, addon = ...;

KrowiAF_AlertFrameMixin = {};

function KrowiAF_AlertFrameMixin:UpdateEventRuntime()
    local line1, line2, timeLeft;

    if self.Event.EventDetails == nil or self.Event.EventDetails.EndTime == nil then
        if self.Event.MapId then
            self.Event.EventDetails = addon.EventData.GetEventDetails(self.Event);
            if self.Event.EventDetails == nil or self.Event.EventDetails.EndTime == nil then
                self.Unlocked:SetText(addon.L["No time data available"]);
                return;
            end
        else
            self.Unlocked:SetText(addon.L["No time data available"]);
            return;
        end
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 or addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        local secondsLeft = self.Event.EventDetails.EndTime - time();
        local days = floor(secondsLeft / 86400);
        local hours = floor(mod(secondsLeft, 86400) / 3600);
        local minutes = floor(mod(secondsLeft, 3600) / 60);
        local seconds = floor(mod(secondsLeft, 60));
        timeLeft = days > 0 and days .. " Days" or "";
        timeLeft = timeLeft .. (days > 0 and " " or "") .. (hours > 0 and hours .. " Hr" or "");
        timeLeft = timeLeft .. (hours > 0 and " " or "") .. (minutes > 0 and minutes .. " Min" or "");
        timeLeft = timeLeft .. (minutes > 0 and " " or "") .. (seconds > 0 and seconds .. " Sec" or "");
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line1 == 1 then -- End Time
        line1 = tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line1 == 2 then -- Time Left
        line1 = timeLeft;
    end

    if addon.Options.db.EventReminders.TimeDisplay.Line2 == 1 or addon.Options.db.EventReminders.Compact then -- None
        line2 = "";
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 2 then -- End Time
        line2 = "\n" .. tostring(date(addon.Options.db.EventReminders.DateTimeFormat.StartTimeAndEndTime, self.Event.EventDetails.EndTime));
    elseif addon.Options.db.EventReminders.TimeDisplay.Line2 == 3 then -- Time Left
        line2 = "\n" .. timeLeft;
    end

    self.Unlocked:SetText(line1 .. line2);
end