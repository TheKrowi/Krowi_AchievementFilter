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
    if startFunction == "Mythic+ Season" then
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
    if endFunction == "Mythic+ Season" then
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

do -- Tooltip, maybe move to not obtainable tooltip lua
    function temporaryObtainable:GetWasIsWillBe(achievement)
        local start, _end; -- Past, Future

        local startFunction = achievement.TemporaryObtainable.Start.Function;
        if startFunction == "Mythic+ Season" then
            start = self:GetMplusSeasonStartState(achievement);
        elseif startFunction == "PvP Season" then
            start = self:GetPvpSeasonStartState(achievement);
        elseif startFunction == "Version" then
            start = self:GetVersionStartState(achievement);
        elseif startFunction == "Event" then
            start = self:GetEventStartState(achievement);
        end

        local endFunction = achievement.TemporaryObtainable.End.Function;
        if endFunction == "Mythic+ Season" then
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
            color = addon.Colors.GreenRGB;
        elseif start == "Future" then
            isWillBeWas = addon.L["will be"];
            color = addon.Colors.OrangeRGB;
        elseif _end == "Past" then
            isWillBeWas = addon.L["was"];
            color = addon.Colors.RedRGB;
        else
            isWillBeWas = addon.L["was"];
            color = addon.Colors.RedRGB;
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
        local subString = string.sub(addon.L["Temporary Obtainable Text"], 2, -2);
        local fields = addon.Util.SplitString(subString, "}{");
        for i = 1, #fields do
            if fields[i] == "thisAchievement" then
                fields[i] = addon.L["This achievement"];
            elseif fields[i] == "isWillBeWas" then
                fields[i] = isWillBeWas;
            elseif fields[i] == "neverOnceTempObt" then
                fields[i] = neverOnceTempObt;
            elseif fields[i] == "startText" then
                fields[i] = startText;
            elseif fields[i] == "startDetail" then
                fields[i] = startDetail;
            elseif fields[i] == "endText" then
                fields[i] = endText;
            elseif fields[i] == "endDetail" then
                fields[i] = endDetail;
            end
        end
        local text = "";
        for i = 1, #fields do
            if i ~= 1 then
                text = text .. " ";
            end
            text = text .. fields[i];
        end
        text = text .. ".";
        return text;
    end

    function temporaryObtainable:GetNotObtainableText(achievement)
        if achievement.TemporaryObtainable.Start == nil and achievement.TemporaryObtainable.End == nil then
            return addon.L["This achievement is no longer obtainable"], addon.Colors.RedRGB;
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
        neverOnceTempObt = addon.L["temporary obtainable"];

        startText = GetStart(achievement);
        if achievement.TemporaryObtainable.Start.Function == "Mythic+ Season" then
            startDetail = addon.L["M+ Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "PvP Season" then
            startDetail = addon.L["PvP Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
            startDetail = addon.L["Patch"];
        elseif achievement.TemporaryObtainable.Start.Function == "Version" then
            startDetail = addon.L["Version"];
        else
            startDetail = achievement.TemporaryObtainable.Start.Function;
        end
        startDetail = startDetail .. " " .. achievement.TemporaryObtainable.Start.Value;

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
        else
            endDetail = achievement.TemporaryObtainable.End.Function;
        end
        endDetail = endDetail .. " " .. achievement.TemporaryObtainable.End.Value;

        return FillText(), color;
    end
end

do -- Get start and end state
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
        if achievement.TemporaryObtainable.End.Inclusion == "From" then
            local events = addon.Data.CalendarEvents;
            for _, event in next, events do
                if event.Id == achievement.TemporaryObtainable.Start.Value then
                    return time() >= event.StartTime and "Past" or "Future";
                end
            end
            return "Past";
        elseif achievement.TemporaryObtainable.End.Inclusion == "After" then -- Should not be used
            local events = addon.Data.CalendarEvents;
            for _, event in next, events do
                if event.Id == achievement.TemporaryObtainable.Start.Value then
                    return time() >= event.EndTime and "Past" or "Future";
                end
            end
            return "Past";
        end
    end

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
            local events = addon.Data.CalendarEvents;
            for _, event in next, events do
                if event.Id == achievement.TemporaryObtainable.End.Value then
                    return time() > event.EndTime and "Past" or "Future";
                end
            end
            return "Past";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            local events = addon.Data.CalendarEvents;
            for _, event in next, events do
                if event.Id == achievement.TemporaryObtainable.End.Value then
                    return time() >= event.StartTime and "Past" or "Future";
                end
            end
            return "Past";
        end
    end
end