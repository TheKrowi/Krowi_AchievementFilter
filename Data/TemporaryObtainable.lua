-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
data.TemporaryObtainable = {};
local temporaryObtainable = data.TemporaryObtainable;

function temporaryObtainable:Load()

end

local DEBUG --= true;
function temporaryObtainable:GetPreviousMplusSeason()
    if DEBUG then
        return 8;
    end
    return tonumber(GetCVar("newMythicPlusSeason"));
end

function temporaryObtainable:GetCurrentMplusSeason()
    if DEBUG then
        return 0;
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

function temporaryObtainable:AddWasIsWillBe(text, achievement)
    local start, _end; -- Past, Future

    if achievement.TemporaryObtainable.Start.Function == "Mythic+ Season" then
        start = achievement.TemporaryObtainable.Start.Value <= max(self:GetCurrentMplusSeason(), self:GetPreviousMplusSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.Start.Inclusion == "After" and achievement.TemporaryObtainable.Start.Value == self:GetCurrentMplusSeason() then
            start = "Future";
        end
    elseif achievement.TemporaryObtainable.Start.Function == "PvP Season" then
        start = achievement.TemporaryObtainable.Start.Value <= max(self:GetCurrentPvpSeason(), self:GetPreviousPvpSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.Start.Inclusion == "After" and achievement.TemporaryObtainable.Start.Value == self:GetCurrentPvpSeason() then
            start = "Future";
        end
    elseif achievement.TemporaryObtainable.Start.Function == "Version" then
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            start = achievement.TemporaryObtainable.Start.Value <= self:GetCurrentVersionString() and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            start = achievement.TemporaryObtainable.Start.Value < self:GetCurrentVersionString() and "Past" or "Future";
        end
    end

    if achievement.TemporaryObtainable.End.Function == "Mythic+ Season" then
        _end = achievement.TemporaryObtainable.End.Value <= max(self:GetCurrentMplusSeason(), self:GetPreviousMplusSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.End.Inclusion == "Until" and achievement.TemporaryObtainable.End.Value == self:GetCurrentMplusSeason() then
            _end = "Future";
        end
    elseif achievement.TemporaryObtainable.End.Function == "PvP Season" then
        _end = achievement.TemporaryObtainable.End.Value <= max(self:GetCurrentPvpSeason(), self:GetPreviousPvpSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.End.Inclusion == "Until" and achievement.TemporaryObtainable.End.Value == self:GetCurrentPvpSeason() then
            _end = "Future";
        end
    elseif achievement.TemporaryObtainable.End.Function == "Version" then
        if achievement.TemporaryObtainable.End.Inclusion == "Until" then
            _end = self:GetCurrentVersionString() <= achievement.TemporaryObtainable.End.Value and "Future" or "Past";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Before" then
            _end = self:GetCurrentVersionString() < achievement.TemporaryObtainable.End.Value and "Future" or "Past";
        end
    end

    -- print(start, _end)
    local color;
    if start == "Past" and _end == "Future" then
        text = text .. " " .. addon.L["is"];
        color = addon.Colors.OrangeRGB;
    elseif start == "Future" then
        text = text .. " " .. addon.L["will be"];
        color = addon.Colors.GreenRGB;
    elseif _end == "Past" then
        text = text .. " " .. addon.L["was"];
        color = addon.Colors.RedRGB;
    end

    return text, color;
end

function temporaryObtainable:GetStart(achievement)
    if achievement.TemporaryObtainable.Start.Function == achievement.TemporaryObtainable.End.Function
    and achievement.TemporaryObtainable.Start.Value == achievement.TemporaryObtainable.End.Value then
        return addon.L["during"];
    elseif achievement.TemporaryObtainable.Start.Inclusion == "From" then
        return addon.L["from the start of"];
    elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
        return addon.L["after the end of"];
    end
end

function temporaryObtainable:AddEnd(text, achievement)
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

    local start = self:GetStart(achievement);
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

    text = self:AddEnd(text, achievement);

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