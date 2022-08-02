-- [[ Namespaces ]] --
local _, addon = ...;
local data = addon.Data;
data.TemporaryObtainable = {};
local temporaryObtainable = data.TemporaryObtainable;

function temporaryObtainable:GetCurrentSeason()
    return GetCurrentArenaSeason();
end

function temporaryObtainable:GetVersionString(version)
    local major, minor, patch, rev = string.match(version, "(%d+)%.(%d+)%.(%d+)(%w?)");
    return string.format("%02d", major) .. string.format("%02d", minor) .. string.format("%02d", patch) .. rev;
end

function temporaryObtainable:GetCurrentVersionString()
    local version = (GetBuildInfo());
    return temporaryObtainable.GetVersionString(version);
end

function temporaryObtainable:DuringSeason(season)
    return season == self:GetCurrentSeason();
end