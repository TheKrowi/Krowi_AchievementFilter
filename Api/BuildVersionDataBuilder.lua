local registeredBuildVersionIds = {}

-- MinorBuilder
local MinorBVBuilder = {}
MinorBVBuilder.__index = MinorBVBuilder

function MinorBVBuilder:Patch(p, name)
    local patches = self._t.Patches
    if #patches > 0 then
        assert(p > patches[#patches].Patch,
            "Patch " .. p .. " must be greater than previous patch " .. patches[#patches].Patch ..
            " in minor " .. self._t.Minor .. " of expansion " .. self._expansion._t.Major)
    end
    local buildVersionId = KrowiAF.GetBuildVersionId(self._expansion._t.Major, self._t.Minor, p)
    assert(not registeredBuildVersionIds[buildVersionId],
        "BuildVersionId " .. buildVersionId .. " (" .. self._expansion._t.Major .. "." .. self._t.Minor .. "." .. p .. ") is already registered.")
    registeredBuildVersionIds[buildVersionId] = true
    tinsert(patches, {
        Patch = p,
        BuildVersionId = buildVersionId,
        Name = name
    })
    return self
end

-- BuildVersionBuilder
local BuildVersionBuilder = {}
BuildVersionBuilder.__index = BuildVersionBuilder

function BuildVersionBuilder:Minor(n)
    local minors = self._t.Minors
    if #minors > 0 then
        assert(n > minors[#minors].Minor,
            "Minor " .. n .. " must be greater than previous minor " .. minors[#minors].Minor ..
            " in expansion " .. self._t.Major)
    end
    local minorEntry = { Minor = n, Patches = {} }
    tinsert(minors, minorEntry)
    return setmetatable({ _expansion = self, _t = minorEntry }, MinorBVBuilder)
end

function BuildVersionBuilder:Register()
    assert(#self._t.Minors > 0,
        "Expansion " .. self._t.Major .. " (" .. self._key .. ") has no minors.")
    assert(KrowiAF.BuildVersionData[self._key] == nil,
        "BuildVersionData key '" .. self._key .. "' is already registered.")
    KrowiAF.BuildVersionData[self._key] = self._t
end

function KrowiAF.NewBuildVersion(key, major)
    return setmetatable({
        _key = key,
        _t = { Major = major, Minors = {} }
    }, BuildVersionBuilder)
end
