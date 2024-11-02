local _, addon = ...;

KrowiAF.BuildVersionData = {};

function KrowiAF.GetBuildVersionId(major, minor, patch)
    return string.format("%02d", major) .. string.format("%02d", minor) .. string.format("%02d", patch);
end

function KrowiAF.GetBuildVersion(major, minor, patch)
    local buildVersionId = KrowiAF.GetBuildVersionId(major, minor, patch);
    return addon.Data.BuildVersions[buildVersionId];
end

function KrowiAF.GroupBuildVersions()
    addon.Data.BuildVersionsGrouped = {};
    for _, buildVersion in next, KrowiAF.BuildVersionData do
        addon.Data.BuildVersionsGrouped[buildVersion.Major - 2] = buildVersion;
    end
end

function KrowiAF.InjectDynamicFilters(filters)
    local buildVersionId;
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                buildVersionId = KrowiAF.GetBuildVersionId(major.Major, minor.Minor, patch.Patch);
                filters[buildVersionId] = true;
            end
        end
    end
end

function KrowiAF.CreateBuildVersions()
    local buildVersionId;
    local buildVersion = addon.Objects.BuildVersion;
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                buildVersionId = KrowiAF.GetBuildVersionId(major.Major, minor.Minor, patch.Patch);
                addon.Data.BuildVersions[buildVersionId] = buildVersion:New(
                    buildVersionId,
                    major.Major,
                    minor.Minor,
                    patch.Patch,
                    (major.Major .. "." .. minor.Minor .. "." .. patch.Patch),
                    patch.Name);
            end
        end
    end
end