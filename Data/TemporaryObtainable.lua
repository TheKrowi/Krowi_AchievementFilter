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
    if achievement.TemporaryObtainable.Start == nil and achievement.TemporaryObtainable.End == nil then
        return "Past";
    end

    local start, _end;
    local startFunction = achievement.TemporaryObtainable.Start.Function;
    if startFunction == "Mythic+ Season" or startFunction == "Season" then
        start = self:GetMplusSeasonStartState(achievement);
    elseif startFunction == "PvP Season" then
        start = self:GetPvpSeasonStartState(achievement);
    elseif startFunction == "Version" then
        start = self:GetVersionStartState(achievement);
    elseif startFunction == "Never" then
        return "Past";
    elseif startFunction == "Once" then
        return "Past";
    elseif startFunction == "Event" then
        start = self:GetEventStartState(achievement);
    end

    -- print(achievement.Id, startFunction, start)

    -- local startState = start;
    if start == "Future" then
        -- print(achievement.Id, "Future")
        return "Future";
    end

    local endFunction = achievement.TemporaryObtainable.End.Function;
    if endFunction == "Mythic+ Season" or startFunction == "Season" then
        _end = self:GetMplusSeasonEndState(achievement);
    elseif endFunction == "PvP Season" then
        _end = self:GetPvpSeasonEndState(achievement);
    elseif endFunction == "Version" then
        _end = self:GetVersionEndState(achievement);
    elseif startFunction == "Event" then
        _end = self:GetEventEndState(achievement);
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
        return event, data.Events[addon.Objects.EventType.Calendar][eventId];
    end
    if data.Events[addon.Objects.EventType.Calendar][eventId] and data.Events[addon.Objects.EventType.Calendar][eventId].LinkedEventIds then
        for _, linkedEventId in next, data.Events[addon.Objects.EventType.Calendar][eventId].LinkedEventIds do
            event = KrowiAF_SavedData.CalendarEventsCache[linkedEventId];
            if event then
                return event, data.Events[addon.Objects.EventType.Calendar][eventId];
            end
        end
    end
    return nil, data.Events[addon.Objects.EventType.Calendar][eventId];
end

do -- Tooltip, maybe move to not obtainable tooltip lua
    function temporaryObtainable:GetWasIsWillBe(achievement)
        local start, _end; -- Past, Future

        local startFunction = achievement.TemporaryObtainable.Start.Function;
        if startFunction == "Mythic+ Season" or startFunction == "Season" then
            start = self:GetMplusSeasonStartState(achievement);
        elseif startFunction == "PvP Season" then
            start = self:GetPvpSeasonStartState(achievement);
        elseif startFunction == "Version" then
            start = self:GetVersionStartState(achievement);
        elseif startFunction == "Event" then
            start = self:GetEventStartState(achievement);
        end

        local endFunction = achievement.TemporaryObtainable.End.Function;
        if endFunction == "Mythic+ Season" or startFunction == "Season" then
            _end = self:GetMplusSeasonEndState(achievement);
        elseif endFunction == "PvP Season" then
            _end = self:GetPvpSeasonEndState(achievement);
        elseif endFunction == "Version" then
            _end = self:GetVersionEndState(achievement);
        elseif startFunction == "Event" then
            _end = self:GetEventEndState(achievement);
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

    local function GetStart(achievement)
        if achievement.TemporaryObtainable.Start.Function == achievement.TemporaryObtainable.End.Function
        and achievement.TemporaryObtainable.Start.Value == achievement.TemporaryObtainable.End.Value then
            return addon.L["during"];
        elseif achievement.TemporaryObtainable.Start.Inclusion == "From" then
            return addon.L["from the start of"];
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            return addon.L["after the end of"];
        end
    end

    local function GetEnd(achievement)
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            return addon.L["until the end of"];
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
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

    function temporaryObtainable:GetNotObtainableText(achievement)
        if achievement.TemporaryObtainable.Start == nil and achievement.TemporaryObtainable.End == nil then
            return addon.L["This achievement is no longer obtainable"], addon.Util.Colors.RedRGB;
        end

        isWillBeWas, neverOnceTempObt, startText, startDetail, endText, endDetail = nil, nil, nil, nil, nil, nil;

        local color = nil;
        isWillBeWas, color = self:GetWasIsWillBe(achievement);

        if achievement.TemporaryObtainable.Start.Function == "Never" then
            neverOnceTempObt = addon.L["never obtainable"];
            return FillText(), color;
        elseif achievement.TemporaryObtainable.Start.Function == "Once" then
            neverOnceTempObt = addon.L["only obtainable by one player"];
            return FillText(), color;
        end
        neverOnceTempObt = addon.L["temporarily obtainable"];

        startText = GetStart(achievement);
        if achievement.TemporaryObtainable.Start.Function == "Mythic+ Season" then
            startDetail = addon.L["M+ Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "PvP Season" then
            startDetail = addon.L["PvP Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
            startDetail = addon.L["Patch"];
        elseif achievement.TemporaryObtainable.Start.Function == "Version" then
            startDetail = addon.L["Version"];
        elseif achievement.TemporaryObtainable.Start.Function == "Season" then
            startDetail = addon.L["Season"];
        else
            startDetail = achievement.TemporaryObtainable.Start.Function;
        end
        startDetail = startDetail .. " " .. achievement.TemporaryObtainable.Start.Value;

        if achievement.TemporaryObtainable.Start.Function == "Event" then
            local eventId = achievement.TemporaryObtainable.Start.Value;
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

        endText = GetEnd(achievement);
        if achievement.TemporaryObtainable.End.Function == "Mythic+ Season" then
            endDetail = addon.L["M+ Season"];
        elseif achievement.TemporaryObtainable.End.Function == "PvP Season" then
            endDetail = addon.L["PvP Season"];
        elseif achievement.TemporaryObtainable.End.Function == "Patch" then
            endDetail = addon.L["Patch"];
        elseif achievement.TemporaryObtainable.End.Function == "Version" then
            endDetail = addon.L["Version"];
        elseif achievement.TemporaryObtainable.End.Function == "Season" then
            endDetail = addon.L["Season"];
        else
            endDetail = achievement.TemporaryObtainable.End.Function;
        end
        endDetail = endDetail .. " " .. achievement.TemporaryObtainable.End.Value;

        if achievement.TemporaryObtainable.End.Function == "Event" then
            local eventId = achievement.TemporaryObtainable.End.Value;
            local _, calendarEvent = FindCachedCalendarEvent(eventId);
            if calendarEvent then
                endDetail = calendarEvent.Name;
            end
        end

        return FillText(), color;
    end
end

do -- Get Start Sate
    function temporaryObtainable:GetMplusSeasonStartState(achievement)
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() > achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetPvpSeasonStartState(achievement)
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() > achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetVersionStartState(achievement)
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            return self:GetCurrentVersionString() >= achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            return self:GetCurrentVersionString() > achievement.TemporaryObtainable.Start.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetEventStartState(achievement)
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            local eventId = achievement.TemporaryObtainable.Start.Value;
            local event = FindCachedCalendarEvent(eventId);
            if not event or not event.StartTime then
                return "Past"; -- If an event has no record it's either not available yet or has already happened
            end
            return time() >= event.StartTime and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then -- Should not be used
            return "Past";
        end
    end
end

do -- Get End State
    function temporaryObtainable:GetMplusSeasonEndState(achievement)
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() > achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            if self:GetCurrentMplusSeason() == 0 then
                return self:GetPreviousMplusSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
            end
            return self:GetCurrentMplusSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetPvpSeasonEndState(achievement)
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() > achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            if self:GetCurrentPvpSeason() == 0 then
                return self:GetPreviousPvpSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
            end
            return self:GetCurrentPvpSeason() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetVersionEndState(achievement) -- ok
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            return self:GetCurrentVersionString() > achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            return self:GetCurrentVersionString() >= achievement.TemporaryObtainable.End.Value and "Past" or "Future";
        end
    end

    function temporaryObtainable:GetEventEndState(achievement)
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            local eventId = achievement.TemporaryObtainable.End.Value;
            local event = FindCachedCalendarEvent(eventId);
            if not event or not event.EndTime then
                return "Past"; -- If an event has no record it's either not available yet or has already happened
            end
                    return time() > event.EndTime and "Past" or "Future";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then -- Should not be used
            return "Past";
        end
    end
end