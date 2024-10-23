local _, addon = ...;

local groupBuildVersions = {};

-- local function FindMajor(major)
--     for _, majorGroup in next, groupBuildVersions do
--         if majorGroup.Major == major then
--             return majorGroup;
--         end
--     end
-- end

-- local function FindMinor(majorGroup, minor)
--     for _, minorGroup in next, majorGroup.Minors do
--         if minorGroup.Minor == minor then
--             return minorGroup;
--         end
--     end
-- end

-- local function AddMajor(major)
--     local majorGroup = FindMajor(major);
--     if majorGroup then
--         return majorGroup;
--     end

--     majorGroup = {
--         Major = major,
--         Minors = {}
--     };

--     tinsert(groupBuildVersions, majorGroup);
--     return majorGroup;
-- end

-- local function AddMinor(major, minor)
--     local majorGroup = AddMajor(major);

--     local minorGroup = FindMinor(majorGroup, minor);
--     if minorGroup then
--         return minorGroup;
--     end

--     minorGroup = {
--         Minor = minor,
--         Patches = {}
--     };

--     tinsert(majorGroup.Minors, minorGroup);
--     return minorGroup;
-- end

-- local function AddPatch(major, minor, patch, id)
--     local minorGroup = AddMinor(major, minor);

    
-- end

function KrowiAF.GroupBuildVersions()
    -- if not refresh and groupBuildVersions then
    --     return groupBuildVersions;
    -- end

    groupBuildVersions = {};

    for id, buildVersion in next, addon.Data.BuildVersions do
        groupBuildVersions[buildVersion.Major] = groupBuildVersions[buildVersion.Major] or {};
        groupBuildVersions[buildVersion.Major][buildVersion.Minor] = groupBuildVersions[buildVersion.Major][buildVersion.Minor] or {};
        groupBuildVersions[buildVersion.Major][buildVersion.Minor][buildVersion.Patch] = groupBuildVersions[buildVersion.Major][buildVersion.Minor][buildVersion.Patch] or buildVersion.Id;

    end

    -- return groupBuildVersions;

    for i, major in next, groupBuildVersions do
        for j, minor in next, major do
            for k, patch in next, minor do
                print(i, j, k, patch)
            end
        end
    end
end

-- function KrowiAF.AddToGroup(buildVersion)
--     AddMajor(buildVersion.Major);
--     AddMinor(buildVersion.Major, buildVersion.Minor);
--     AddPatch(buildVersion.Major, buildVersion.Minor, buildVersion.Patch, buildVersion.Id);
-- end

function KrowiAF.AddBuildVersionData(...)

end