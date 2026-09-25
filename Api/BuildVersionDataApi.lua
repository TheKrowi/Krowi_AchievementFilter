local _, addon = ...

KrowiAF.BuildVersionData = {}

function KrowiAF.GetBuildVersionId(major, minor, patch)
    return string.format("%02d", major) .. string.format("%02d", minor) .. string.format("%02d", patch)
end

function KrowiAF.GetBuildVersion(major, minor, patch)
    local buildVersionId = KrowiAF.GetBuildVersionId(major, minor, patch)
    local buildVersion = addon.Data.BuildVersions[buildVersionId]
    assert(buildVersion ~= nil, "BuildVersion " .. major .. "." .. minor .. "." .. patch .. " (" .. buildVersionId .. ") is not registered. Add it to the matching BuildVersionData.lua first.")
    return buildVersion
end

function KrowiAF.GroupBuildVersions()
    addon.Data.BuildVersionsGrouped = {}
    for _, buildVersion in next, KrowiAF.BuildVersionData do
        addon.Data.BuildVersionsGrouped[buildVersion.Major - 2] = buildVersion
    end
end

function KrowiAF.InjectDynamicBuildVersionFilters(filters)
    local buildVersionId
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                buildVersionId = KrowiAF.GetBuildVersionId(major.Major, minor.Minor, patch.Patch)
                filters[buildVersionId] = true
            end
        end
    end
end

-- "5.4.0" -> "050400"
local function ParseVersion(version)
    local major, minor, patch = tostring(version):match("^(%d+)%.(%d+)%.(%d+)$")
    assert(major, "ContentTimeline: '" .. tostring(version) .. "' is not a major.minor.patch version")
    return KrowiAF.GetBuildVersionId(tonumber(major), tonumber(minor), tonumber(patch))
end

-- KrowiAF.ContentTimeline (a client's data, e.g. DataAddons/Classic/ContentTimeline.lua) keyed by build version id.
-- Every patch the table points to is on this client's own timeline and so also stands for itself
local function CreateContentTimeline()
    addon.Data.ContentTimeline = nil
    if not KrowiAF.ContentTimeline then
        return -- this client lived through every patch it registers: an anchor names its own patch
    end
    local timeline = {}
    for retailVersion, ownVersion in next, KrowiAF.ContentTimeline do
        local ownId = ParseVersion(ownVersion)
        local target = addon.Data.BuildVersions[ownId]
        assert(target, "ContentTimeline: " .. retailVersion .. " points to " .. ownVersion .. ", which this client does not register in a BuildVersionData.lua")
        timeline[ParseVersion(retailVersion)] = target
        timeline[ownId] = target
    end
    addon.Data.ContentTimeline = timeline
end

function KrowiAF.CreateBuildVersions()
    local buildVersionId
    local buildVersion = addon.Objects.BuildVersion
    for _, major in next, KrowiAF.BuildVersionData do
        for _, minor in next, major.Minors do
            for _, patch in next, minor.Patches do
                buildVersionId = KrowiAF.GetBuildVersionId(major.Major, minor.Minor, patch.Patch)
                local instance = buildVersion:New(
                    buildVersionId,
                    major.Major,
                    minor.Minor,
                    patch.Patch,
                    (major.Major .. "." .. minor.Minor .. "." .. patch.Patch),
                    patch.Name)
                addon.Data.BuildVersions[buildVersionId] = instance
            end
        end
    end
    CreateContentTimeline()
end

-- A Version anchor names a patch as Retail shipped it. Returns the patch where this client reached that
-- content, or nil when it has not yet: without a ContentTimeline that is the anchor's own patch, with one
-- it is whatever the timeline maps it to. See docs/data-design-review.md §5.1.
function KrowiAF.ResolveVersionAnchor(buildVersionId)
    local timeline = addon.Data.ContentTimeline
    if not timeline then
        return addon.Data.BuildVersions[buildVersionId]
    end
    return timeline[buildVersionId]
end

-- "060002" -> "6.0.2", for a patch this client never registered
function KrowiAF.FormatBuildVersionId(buildVersionId)
    local id = tostring(buildVersionId)
    if #id ~= 6 then
        return id
    end
    return tonumber(id:sub(1, 2)) .. "." .. tonumber(id:sub(3, 4)) .. "." .. tonumber(id:sub(5, 6))
end