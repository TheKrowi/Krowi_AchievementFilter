-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
data.TemporaryObtainable = {};
local temporaryObtainable = data.TemporaryObtainable;

function temporaryObtainable:Load()

end

local DEBUG --= true;
function temporaryObtainable:GetPreviousSeason()
    if DEBUG then
        return 33;
    end
    return GetPreviousArenaSeason();
end

function temporaryObtainable:GetCurrentSeason()
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

function temporaryObtainable:DuringSeason(season)
    local state;
    state = season <= max(self:GetCurrentSeason(), self:GetPreviousSeason()) and "Past" or "Future";
    if season == self:GetCurrentSeason() then
        state = "Current";
    end
    return state;
end

function temporaryObtainable:DuringSeasons(season1, season2)
    local state1 = self:DuringSeason(season1);
    local state2 = self:DuringSeason(season2);
    if state1 == state2 then
        return state1;
    elseif state1 == "Current" or state2 == "Current" or (state1 == "Past" and state2 == "Future") then
        return "Current";
    end
end

function temporaryObtainable:AddWasIsWillBe(text, achievement)
    local start, _end; -- Past, Future

    if achievement.TemporaryObtainable.Start.Function == "Season" then
        start = achievement.TemporaryObtainable.Start.Value <= max(self:GetCurrentSeason(), self:GetPreviousSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.Start.Inclusion == "After" and achievement.TemporaryObtainable.Start.Value == self:GetCurrentSeason() then
            start = "Future";
        end
    elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
    end

    if achievement.TemporaryObtainable.End.Function == "Season" then
        _end = achievement.TemporaryObtainable.End.Value <= max(self:GetCurrentSeason(), self:GetPreviousSeason()) and "Past" or "Future";
        if achievement.TemporaryObtainable.End.Inclusion == "Until" and achievement.TemporaryObtainable.End.Value == self:GetCurrentSeason() then
            _end = "Future";
        end
    elseif achievement.TemporaryObtainable.End.Function == "Patch" then
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

    if achievement.TemporaryObtainable.Start.Function == "Season" then
        text = text .. " " .. addon.L["Season"];
    elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
        text = text .. " " .. addon.L["Patch"];
    end

    text = text .. " " .. achievement.TemporaryObtainable.Start.Value;

    if start == addon.L["during"] then
        text = text .. ".";
        return text, color;
    end

    text = self:AddEnd(text, achievement);

    if achievement.TemporaryObtainable.End.Function == "Season" then
        text = text .. " " .. addon.L["Season"];
    elseif achievement.TemporaryObtainable.End.Function == "Patch" then
        text = text .. " " .. addon.L["Patch"];
    end

    text = text .. " " .. achievement.TemporaryObtainable.End.Value;

    text = text .. ".";

    return text, color;
end