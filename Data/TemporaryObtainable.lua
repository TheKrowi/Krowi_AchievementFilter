-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
data.TemporaryObtainable = {};
local temporaryObtainable = data.TemporaryObtainable;

function temporaryObtainable:Load()

end

function temporaryObtainable:GetCurrentSeason()
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
    return season == self:GetCurrentSeason();
end

function temporaryObtainable:DuringSeasons(season1, season2)
    return self:GetCurrentSeason() >= season1 and self:GetCurrentSeason() <= season2;
end

function temporaryObtainable:AddWasIsWillBe(text, achievement)
    local start, _end; -- Past, Future
    if achievement.TemporaryObtainable.Start.Function == "Season" then
        if achievement.TemporaryObtainable.Start.Inclusion == "From" then
            local season = GetCurrentArenaSeason();
            if season == 0 then
                season = GetPreviousArenaSeason();
            end
            start = achievement.TemporaryObtainable.Start.Value <= season and "Past" or "Future";
        elseif achievement.TemporaryObtainable.Start.Inclusion == "After" then
            local season = GetCurrentArenaSeason();
            if season == 0 then
                season = GetPreviousArenaSeason();
                start = achievement.TemporaryObtainable.Start.Value <= season and "Past" or "Future";
            else
                start = achievement.TemporaryObtainable.Start.Value < season and "Past" or "Future";
            end
        end
    elseif achievement.TemporaryObtainable.Start.Function == "Patch" then
    end

    if achievement.TemporaryObtainable.End.Function == "Season" then
        if achievement.TemporaryObtainable.End.Inclusion == "Before" then
            local season = GetCurrentArenaSeason();
            if season == 0 then
                season = GetPreviousArenaSeason();
            end
            _end = achievement.TemporaryObtainable.End.Value <= season and "Past" or "Future";
        elseif achievement.TemporaryObtainable.End.Inclusion == "Until" then
            local season = GetCurrentArenaSeason();
            if season == 0 then
                season = GetPreviousArenaSeason();
                _end = achievement.TemporaryObtainable.End.Value <= season and "Past" or "Future";
            else
                _end = achievement.TemporaryObtainable.End.Value < season and "Past" or "Future";
            end
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