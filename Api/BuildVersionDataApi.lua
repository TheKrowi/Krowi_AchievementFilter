local _, addon = ...;

KrowiAF.BuildVersionData = {};

function KrowiAF.GroupBuildVersions()
    addon.Data.BuildVersionsGrouped = {};
    for _, buildVersion in next, KrowiAF.BuildVersionData do
        addon.Data.BuildVersionsGrouped[buildVersion.Major - 2] = buildVersion;
    end
end

function KrowiAF.InjectDynamicFilters(filters)
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                filters[patch.BuildVersionId] = true;
            end
        end
    end
end

function KrowiAF.CreateBuildVersions()
    local buildVersion = addon.Objects.BuildVersion;
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                addon.Data.BuildVersions[patch.BuildVersionId] = buildVersion:New(
                    patch.BuildVersionId,
                    major.Major,
                    minor.Minor,
                    patch.Patch,
                    (major.Major .. "." .. minor.Minor .. "." .. patch.Patch),
                    patch.Name);
            end
        end
    end
end