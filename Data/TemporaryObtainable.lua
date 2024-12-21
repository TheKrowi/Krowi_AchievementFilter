-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
data.TemporaryObtainable = {};
local temporaryObtainable = data.TemporaryObtainable;

local DEBUG --= true;

function temporaryObtainable:Load()
    if C_MythicPlus then
        C_MythicPlus.RequestMapInfo();
    else -- Classic
        self.GetPreviousMplusSeason = function() return 99; end;
        self.GetCurrentMplusSeason = function() return 99; end;
    end
end

do -- GetData
    function temporaryObtainable:GetPreviousMplusSeason()
        if DEBUG then
            return 6;
        end
        return tonumber(GetCVar("newMythicPlusSeason"));
    end

    function temporaryObtainable:GetCurrentMplusSeason()
        if DEBUG then
            return 7;
        end
        return C_MythicPlus.GetCurrentSeason();
    end

    function temporaryObtainable:GetPreviousPvpSeason()
        if DEBUG then
            return 33;
        end
        return GetPreviousArenaSeason();
    end

    function temporaryObtainable:GetCurrentPvpSeason()
        if DEBUG then
            return 0;
        end
        return GetCurrentArenaSeason();
    end

    function temporaryObtainable:GetVersionString(version)
        local major, minor, patch, rev = string.match(version, "(%d+)%.(%d+)%.(%d+)(%w?)");
        return string.format("%02d", major) .. string.format("%02d", minor) .. string.format("%02d", patch) .. rev;
    end

    function temporaryObtainable:GetCurrentVersionString()
        local version = (GetBuildInfo());
        return self:GetVersionString(version);
    end
end

function temporaryObtainable:GetObtainableState(achievement)
    if not achievement.TemporaryObtainable then
        return;
    end

    local record = achievement.TemporaryObtainable[#achievement.TemporaryObtainable];

    if not record or (record.Start == nil and record.End == nil) then
        return "Past";
    end

    local start, _end;
    local startFunction = record.Start.Function;
    if startFunction == "PvE Season" or startFunction == "Season" then
        start = self:GetMplusSeasonStartState(record);
    elseif startFunction == "PvP Season" then
        start = self:GetPvpSeasonStartState(record);
    elseif startFunction == "Version" then
        start = self:GetVersionStartState(record);
    elseif startFunction == "Never" then
        return "Past";
    elseif startFunction == "Once" then
        return "Past";
    elseif startFunction == "Event" then
        start = self:GetEventStartState(record);
    elseif startFunction == "Date" then
        start = self:GetDateStartState(record);
    end

    -- print(achievement.Id, startFunction, start)

    -- local startState = start;
    if start == "Future" then
        -- print(achievement.Id, "Future")
        return "Future";
    end

    local endFunction = record.End.Function;
    if endFunction == "PvE Season" or startFunction == "Season" then
        _end = self:GetMplusSeasonEndState(record);
    elseif endFunction == "PvP Season" then
        _end = self:GetPvpSeasonEndState(record);
    elseif endFunction == "Version" then
        _end = self:GetVersionEndState(record);
    elseif startFunction == "Event" then
        _end = self:GetEventEndState(record);
    elseif startFunction == "Date" then
        _end = self:GetDateEndState(record);
    end

    -- local endState = _end;
    if _end == "Past" then
        -- print(achievement.Id, "Past")
        return "Past";
    end

    -- print(achievement.Id, startState, endState)
    return "Current";
end

local function FindCachedCalendarEvent(eventId)
    eventId = tonumber(eventId);
    local event = KrowiAF_SavedData.CalendarEventsCache[eventId];
    if event then
        return event, data.Events[KrowiAF.Enum.EventType.Calendar][eventId];
    end
    if data.Events[KrowiAF.Enum.EventType.Calendar][eventId] and data.Events[KrowiAF.Enum.EventType.Calendar][eventId].LinkedEventIds then
        for _, linkedEventId in next, data.Events[KrowiAF.Enum.EventType.Calendar][eventId].LinkedEventIds do
            event = KrowiAF_SavedData.CalendarEventsCache[linkedEventId];
            if event then
                return event, data.Events[KrowiAF.Enum.EventType.Calendar][eventId];
            end
        end
    end
    return nil, data.Events[KrowiAF.Enum.EventType.Calendar][eventId];
end

do -- Tooltip, maybe move to not obtainable tooltip lua
    function temporaryObtainable:GetWasIsWillBe(record)
        local start, _end; -- Past, Future

        local startFunction = record.Start and record.Start.Function;
        if startFunction == "PvE Season" or startFunction == "Season" then
            start = self:GetMplusSeasonStartState(record);
        elseif startFunction == "PvP Season" then
            start = self:GetPvpSeasonStartState(record);
        elseif startFunction == "Version" then
            start = self:GetVersionStartState(record);
        elseif startFunction == "Event" then
            start = self:GetEventStartState(record);
        elseif startFunction == "Date" then
            start = self:GetDateStartState(record);
        end

        local endFunction = record.End and record.End.Function;
        if endFunction == "PvE Season" or startFunction == "Season" then
            _end = self:GetMplusSeasonEndState(record);
        elseif endFunction == "PvP Season" then
            _end = self:GetPvpSeasonEndState(record);
        elseif endFunction == "Version" then
            _end = self:GetVersionEndState(record);
        elseif startFunction == "Event" then
            _end = self:GetEventEndState(record);
        elseif startFunction == "Date" then
            _end = self:GetDateEndState(record);
        end

        -- print(startFunction, start, endFunction, _end)
        local isWillBeWas, color;
        if start == "Past" and _end == "Future" then
            isWillBeWas = addon.L["is"];
            color = addon.Util.Colors.GreenRGB;
        elseif start == "Future" then
            isWillBeWas = addon.L["will be"];
            color = addon.Util.Colors.OrangeRGB;
        elseif _end == "Past" then
            isWillBeWas = addon.L["was"];
            color = addon.Util.Colors.RedRGB;
        else
            isWillBeWas = addon.L["was"];
            color = addon.Util.Colors.RedRGB;
        end

        return isWillBeWas, color;
    end

    local function GetStart(record)
        if record.Start.Function == record.End.Function
        and record.Start.Value == record.End.Value then
            return addon.L["during"];
        elseif record.Start.Inclusion == "From" then
            return addon.L["from the start of"];
        elseif record.Start.Inclusion == "After" then
            return addon.L["after the end of"];
        end
    end

    local function GetEnd(record)
        if record.End.Inclusion == "Until" then
            return addon.L["until the end of"];
        elseif record.End.Inclusion == "Before" then
            return addon.L["up until the start of"];
        end
    end

    local isWillBeWas, neverOnceTempObt, startText, startDetail, endText, endDetail;
    local function FillText()
        local subString = string.sub(addon.L["Temporarily Obtainable Text"], 2, -2);
        local fields = addon.Util.StringSplitTable("}{", subString);
        local text = addon.L["This achievement"];
        for i = 1, #fields do
            if fields[i] == "isWillBeWas" and isWillBeWas then
                text = text .. " " .. isWillBeWas;
            elseif fields[i] == "neverOnceTempObt" and neverOnceTempObt then
                text = text .. " " .. neverOnceTempObt;
            elseif fields[i] == "startText" and startText then
                text = text .. " " .. startText;
            elseif fields[i] == "startDetail" and startDetail then
                text = text .. " " .. startDetail;
            elseif fields[i] == "endText" and endText then
                text = text .. " " .. endText;
            elseif fields[i] == "endDetail" and endDetail then
                text = text .. " " .. endDetail;
            end
        end
        return text .. ".";
    end

    function temporaryObtainable:GetNotObtainableText(record)
        if record.Start == nil and record.End == nil then
            return addon.L["This achievement is no longer obtainable"], addon.Util.Colors.RedRGB;
        end

        isWillBeWas, neverOnceTempObt, startText, startDetail, endText, endDetail = nil, nil, nil, nil, nil, nil;

        local color = nil;
        isWillBeWas, color = self:GetWasIsWillBe(record);

        if record.Start.Function == "Never" then
            neverOnceTempObt = addon.L["never obtainable"];
            return FillText(), color;
        elseif record.Start.Function == "Once" then
            neverOnceTempObt = addon.L["only obtainable by one player"];
            return FillText(), color;
        end
        neverOnceTempObt = addon.L["temporarily obtainable"];

        startText = GetStart(record);
        if record.Start.Function == "PvE Season" then
            startDetail = addon.L["PvE Season"];
        elseif record.Start.Function == "PvP Season" then
            startDetail = addon.L["PvP Season"];
        elseif record.Start.Function == "Patch" then
            startDetail = addon.L["Patch"];
        elseif record.Start.Function == "Version" then
            startDetail = addon.L["Version"];
        elseif record.Start.Function == "Season" then
            startDetail = addon.L["Season"];
        else
            startDetail = record.Start.Function;
        end
        startDetail = startDetail .. " " .. tostring(record.Start.Value);

        if record.Start.Function == "Version" then
            local buildVersion = addon.Data.BuildVersions[record.Start.Value];
            if buildVersion then
                startDetail = buildVersion.Description .. " (" .. buildVersion.Name .. ")";
            end
        end

        if record.Start.Function == "Date" then
            local year, month, day = unpack(record.Start.Value);
            local startTime = time{year = year, month = month, day = day, hour = 0, min = 0, sec = 0} - KrowiAF_GetUtcOffsetSeconds();
            startDetail = date(addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime, startTime);
        end

        if record.Start.Function == "Event" then
            local eventId = record.Start.Value;
            local event, calendarEvent = FindCachedCalendarEvent(eventId);
            local startDate, endDate;
            if event then
                startDate = event.StartTime;
                endDate = event.EndTime;
            end
            if calendarEvent then
                startDetail = addon.L["Requires"] .. " " .. calendarEvent.Name;
            end
            local occurrence = addon.L["Next occurrence unknown"];
            if startDate and endDate then
                occurrence = addon.L["Next from startDate until endDate"]:K_ReplaceVars{
                    startDate = tostring(date(addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat.StartTimeAndEndTime, startDate)),
                    endDate = tostring(date(addon.Options.db.profile.Tooltip.Achievements.TemporarilyObtainable.DateTimeFormat.StartTimeAndEndTime, endDate))
                };
            end
            return startDetail, color, occurrence;
        end

        if startText == addon.L["during"] then
            return FillText(), color;
        end

        endText = GetEnd(record);
        if record.End.Function == "PvE Season" then
            endDetail = addon.L["PvE Season"];
        elseif record.End.Function == "PvP Season" then
            endDetail = addon.L["PvP Season"];
        elseif record.End.Function == "Patch" then
            endDetail = addon.L["Patch"];
        elseif record.End.Function == "Version" then
            endDetail = addon.L["Version"];
        elseif record.End.Function == "Season" then
            endDetail = addon.L["Season"];
        else
            endDetail = record.End.Function;
        end
        endDetail = endDetail .. " " .. tostring(record.End.Value);

        if record.End.Function == "Version" then
            local buildVersion = addon.Data.BuildVersions[record.End.Value];
            if buildVersion then
                endDetail = buildVersion.Description .. " (" .. buildVersion.Name .. ")";
            end
        end

        if record.End.Function == "Date" then
            local year, month, day = unpack(record.End.Value);
            local endTime = time{year = year, month = month, day = day, hour = 0, min = 0, sec = 0} - KrowiAF_GetUtcOffsetSeconds();
            endDetail = date(addon.Options.db.profile.EventReminders.DateTimeFormat.StartTimeAndEndTime, endTime);
        end

        if record.End.Function == "Event" then
            local eventId = record.End.Value;
            local _, calendarEvent = FindCachedCalendarEvent(eventId);
            if calendarEvent then
                endDetail = calendarEvent.Name;
            end
        end

        return FillText(), color;
    end

    function temporaryObtainable:GetNotObtainableTexts(achievement)
        if not achievement.TemporaryObtainable then
            return;
        end

        local records = {};

        for _, record in next, achievement.TemporaryObtainable do
            local text, color, occurrence = self:GetNotObtainableText(record);
            tinsert(records, {
                Text = text,
                Color = color,
                Occurrence = occurrence
            });
        end

        return records;
    end
end

do -- Get Start Sate
    function temporaryObtainable:GetMplusSeasonStartState(record)
        if record.Start.Inclusion == "From" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= record.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() >= record.Start.Value and "Past" or "Future";
        elseif record.Start.Inclusion == "After" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= record.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() > record.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetPvpSeasonStartState(record)
        if record.Start.Inclusion == "From" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= record.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() >= record.Start.Value and "Past" or "Future";
        elseif record.Start.Inclusion == "After" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= record.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() > record.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetVersionStartState(record)
        if record.Start.Inclusion == "From" then
            return self:GetCurrentVersionString() >= record.Start.Value and "Past" or "Future";
        elseif record.Start.Inclusion == "After" then
            return self:GetCurrentVersionString() > record.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetEventStartState(record)
        if record.Start.Inclusion == "From" then
            local eventId = record.Start.Value;
            local event = FindCachedCalendarEvent(eventId);
            if not event or not event.StartTime then
                return "Past"; -- If an event has no record it's either not available yet or has already happened
            end
            return time() >= event.StartTime and "Past" or "Future";
        elseif record.Start.Inclusion == "After" then -- Should not be used
            return "Past";
        end
    end

    function temporaryObtainable:GetDateStartState(record)
        if record.Start.Inclusion == "From" then
            local year, month, day = unpack(record.Start.Value);
            local startTime = time{year = year, month = month, day = day, hour = 0, min = 0, sec = 0} - KrowiAF_GetUtcOffsetSeconds();
            return startTime <= time() and "Past" or "Future";
        elseif record.Start.Inclusion == "After" then
            local year, month, day = unpack(record.Start.Value);
            local startTime = time{year = year, month = month, day = day, hour = 23, min = 59, sec = 59} - KrowiAF_GetUtcOffsetSeconds();
            return startTime <= time() and "Past" or "Future";
        end
    end
end

do -- Get End State
    function temporaryObtainable:GetMplusSeasonEndState(record)
        if record.End.Inclusion == "Until" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= record.End.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() > record.End.Value and "Past" or "Future";
        elseif record.End.Inclusion == "Before" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= record.End.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() >= record.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetPvpSeasonEndState(record)
        if record.End.Inclusion == "Until" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= record.End.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() > record.End.Value and "Past" or "Future";
        elseif record.End.Inclusion == "Before" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= record.End.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() >= record.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetVersionEndState(record) -- ok
        if record.End.Inclusion == "Until" then
            return self:GetCurrentVersionString() > record.End.Value and "Past" or "Future";
        elseif record.End.Inclusion == "Before" then
            return self:GetCurrentVersionString() >= record.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetEventEndState(record)
        if record.End.Inclusion == "Until" then
            local eventId = record.End.Value;
            local event = FindCachedCalendarEvent(eventId);
            if not event or not event.EndTime then
                return "Past"; -- If an event has no record it's either not available yet or has already happened
            end
                return time() > event.EndTime and "Past" or "Future";
        elseif record.End.Inclusion == "Before" then -- Should not be used
            return "Past";
        end
    end

    function temporaryObtainable:GetDateEndState(record)
        if record.End.Inclusion == "Until" then
            local year, month, day = unpack(record.End.Value);
            local endTime = time{year = year, month = month, day = day, hour = 23, min = 59, sec = 59} - KrowiAF_GetUtcOffsetSeconds();
            return endTime <= time() and "Past" or "Future";
        elseif record.End.Inclusion == "Before" then
            local year, month, day = unpack(record.End.Value);
            local endTime = time{year = year, month = month, day = day, hour = 0, min = 0, sec = 0} - KrowiAF_GetUtcOffsetSeconds();
            return endTime <= time() and "Past" or "Future";
        end
    end
end