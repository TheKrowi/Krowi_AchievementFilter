local ZoneBuilder = {}
ZoneBuilder.__index = ZoneBuilder

function ZoneBuilder:Zone(mapIds, ids, ids10, ids25)
    if ids10 or ids25 then
        tinsert(self._group, {KrowiAF.AddZoneData, mapIds, ids, ids10, ids25})
    else
        tinsert(self._group, {KrowiAF.AddZoneData, mapIds, ids})
    end
    return self
end

function KrowiAF.NewZoneData(key)
    assert(KrowiAF.ZoneData[key] == nil,
        "ZoneData key '" .. key .. "' is already registered.")
    local group = {}
    KrowiAF.ZoneData[key] = group
    return setmetatable({_group = group}, ZoneBuilder)
end
