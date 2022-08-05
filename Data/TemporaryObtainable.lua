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

do -- IsObtainable Past, Future or Current
    function temporaryObtainable:GetObtainableState(achievement)
        if achievement.TemporaryObtainable.Start == nil and achievement.TemporaryObtainable.End == nil then
            return "Past";
        end

        local startFunction = achievement.TemporaryObtainable.Start.Function;
        if startFunction == "Mythic+ Season" then
            start = self:GetMplusSeasonStartState(achievement);
        elseif startFunction == "PvP Season" then
            start = self:GetPvpSeasonStartState(achievement);
        elseif startFunction == "Version" then
            start = self:GetVersionStartState(achievement);
        end

        local startState = start;
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
        end

        local endState = _end;
        if _end == "Past" then
            -- print(achievement.Id, "Past")
            return "Past";
        end

        -- print(achievement.Id, startState, endState)
        return "Current";
    end

    function temporaryObtainable:DuringMplusSeason(season)
        local state;
        state = season <= max(self:GetCurrentMplusSeason(), self:GetPreviousMplusSeason()) and "Past" or "Future";
        if season == self:GetCurrentMplusSeason() then
            state = "Current";
        end
        return state;
    end

    function temporaryObtainable:DuringMplusSeasons(season1, season2)
        local state1 = self:DuringMplusSeason(season1);
        local state2 = self:DuringMplusSeason(season2);
        if state1 == state2 then
            return state1;
        elseif state1 == "Current" or state2 == "Current" or (state1 == "Past" and state2 == "Future") then
            return "Current";
        end
    end

    function temporaryObtainable:DuringPvpSeason(season)
        local state;
        state = season <= max(self:GetCurrentPvpSeason(), self:GetPreviousPvpSeason()) and "Past" or "Future";
        if season == self:GetCurrentPvpSeason() then
            state = "Current";
        end
        return state;
    end

    function temporaryObtainable:DuringPvpSeasons(season1, season2)
        local state1 = self:DuringPvpSeason(season1);
        local state2 = self:DuringPvpSeason(season2);
        if state1 == state2 then
            return state1;
        elseif state1 == "Current" or state2 == "Current" or (state1 == "Past" and state2 == "Future") then
            return "Current";
        end
    end

    function temporaryObtainable:FromToBeforeVersion(versionFrom, versionBefore)
        local currentVersion = self:GetCurrentVersionString();
        if currentVersion >= versionFrom and currentVersion < versionBefore then
            return "Current";
        elseif currentVersion < versionFrom then
            return "Future";
        elseif currentVersion >= versionBefore then
            return "Past";
        end
    end
end

do -- Tooltip, maybe move to not obtainable tooltip lua
    function temporaryObtainable:AddWasIsWillBe(text, achievement)
        local start, _end; -- Past, Future

        local startFunction = achievement.TemporaryObtainable.Start.Function;
        if startFunction == "Mythic+ Season" then
            start = self:GetMplusSeasonStartState(achievement);
        elseif startFunction == "PvP Season" then
            start = self:GetPvpSeasonStartState(achievement);
        elseif startFunction == "Version" then
            start = self:GetVersionStartState(achievement);
        end

        local endFunction = achievement.TemporaryObtainable.End.Function;
        if endFunction == "Mythic+ Season" then
            _end = self:GetMplusSeasonEndState(achievement);
        elseif endFunction == "PvP Season" then
            _end = self:GetPvpSeasonEndState(achievement);
        elseif endFunction == "Version" then
            _end = self:GetVersionEndState(achievement);
        end

        -- print(startFunction, start, endFunction, _end)
        local color;
        if start == "Past" and _end == "Future" then
            text = text .. " " .. addon.L["is"];
            color = addon.Colors.GreenRGB;
        elseif start == "Future" then
            text = text .. " " .. addon.L["will be"];
            color = addon.Colors.OrangeRGB;
        elseif _end == "Past" then
            text = text .. " " .. addon.L["was"];
            color = addon.Colors.RedRGB;
        end

        return text, color;
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

    local function AddEnd(text, achievement)
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            return text .. " " .. addon.L["until the end of"];
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            return text .. " " .. addon.L["up until the start of"];
        end
    end

    function temporaryObtainable:GetNotObtainableText(achievement)
        if achievement.TemporaryObtainable.Start == nil and achievement.TemporaryObtainable.End == nil then
            return addon.L["This achievement is no longer obtainable"], addon.Colors.RedRGB;
        end

        local text = addon.L["This achievement"];
        local color;
        text, color = self:AddWasIsWillBe(text, achievement);

        text = text .. " " .. addon.L["temporary obtainable"]

        local start = GetStart(achievement);
        text = text .. " " .. start;

        if achievement.TemporaryObtainable.Start.Function == "Mythic+ Season" then
            text = text .. " " .. addon.L["M+ Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "PvP Season" then
                text = text .. " " .. addon.L["PvP Season"];
        elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
            text = text .. " " .. addon.L["Patch"];
        end

        text = text .. " " .. achievement.TemporaryObtainable.Start.Value;

        if start == addon.L["during"] then
            text = text .. ".";
            return text, color;
        end

        text = AddEnd(text, achievement);

        if achievement.TemporaryObtainable.End.Function == "Mythic+ Season" then
            text = text .. " " .. addon.L["M+ Season"];
        elseif achievement.TemporaryObtainable.End.Function == "PvP Season" then
                text = text .. " " .. addon.L["PvP Season"];
        elseif achievement.TemporaryObtainable.End.Function == "Patch" then
            text = text .. " " .. addon.L["Patch"];
        end

        text = text .. " " .. achievement.TemporaryObtainable.End.Value;

        text = text .. ".";

        return text, color;
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
end