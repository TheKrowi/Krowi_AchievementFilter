local _, addon = ...

-- CT is populated lazily: addon.Data.CategoryData.Shared.CT is available at call time (step 13+)
local CT = setmetatable({}, {
    __index = function(_, k)
        return addon.Data.CategoryData.Shared.CT[k]
    end
})

local function AssertUniqueContainer(parent, name)
    for _, child in next, parent._t.Children do
        assert(child.Name ~= name, "Container '" .. tostring(name) .. "' already added to '" .. tostring(parent._t.Name) .. "'. Each container method may only be called once per builder.")
    end
end

local function WithBase(t)
    function t:Ids(ids)
        self._t.Achievements = self._t.Achievements or {}
        for _, id in next, ids do
            tinsert(self._t.Achievements, id)
        end
        return self
    end
    function t:Insert(v1) tinsert(self._t.Children, v1); return self end
    return t
end

-- ZoneBuilder
local ZoneBuilder = WithBase({})
ZoneBuilder.__index = ZoneBuilder

local function AddZoneSub(self, ct, ids)
    tinsert(self._t.Children, { _v2 = true, Name = ct, CanMerge = true, Achievements = ids })
    return self
end

function ZoneBuilder:Quests(ids)      return AddZoneSub(self, CT.Quests, ids) end
function ZoneBuilder:Exploration(ids) return AddZoneSub(self, CT.Exploration, ids) end
function ZoneBuilder:PvP(ids)         return AddZoneSub(self, CT.PvP, ids) end
function ZoneBuilder:Reputation(ids)  return AddZoneSub(self, CT.Reputation, ids) end

function ZoneBuilder:Named(label, ids)
    tinsert(self._t.Children, { _v2 = true, Name = label, CanMerge = true, Achievements = ids })
    return self
end

-- ZonesBuilder
local ZonesBuilder = WithBase({})
ZonesBuilder.__index = ZonesBuilder

function ZonesBuilder:Zone(uiMapId, ids)
    local zone = setmetatable({ _t = { _v2 = true, Name = addon.GetMapName(uiMapId), Achievements = ids, Children = {} } }, ZoneBuilder)
    tinsert(self._t.Children, zone._t)
    return zone
end

-- RaidBuilder
local RaidBuilder = WithBase({})
RaidBuilder.__index = RaidBuilder

function RaidBuilder:Glory(ids)
    tinsert(self._t.Children, { _v2 = true, Name = addon.L["Glory"], Achievements = ids })
    return self
end

function RaidBuilder:Mythic(ids)
    tinsert(self._t.Children, { _v2 = true, Name = addon.L["Mythic"], Achievements = ids })
    return self
end

-- DelvesBuilder
local DelvesBuilder = WithBase({})
DelvesBuilder.__index = DelvesBuilder

function DelvesBuilder:Seasonal(ids)
    tinsert(self._t.Children, { _v2 = true, Name = addon.L["Seasonal"], Achievements = ids })
    return self
end

function DelvesBuilder:Instance(uiMapId, ids)
    tinsert(self._t.Children, { _v2 = true, Name = addon.GetMapName(uiMapId), Achievements = ids })
    return self
end

-- DungeonsBuilder
local DungeonsBuilder = WithBase({})
DungeonsBuilder.__index = DungeonsBuilder

function DungeonsBuilder:MythicPlus(fn)
    tinsert(self._t.Children, fn(addon.L["Mythic+"]))
    return self
end

function DungeonsBuilder:Instance(journalId, ids)
    tinsert(self._t.Children, { _v2 = true, Name = addon.GetInstanceInfoName(journalId), Achievements = ids })
    return self
end

-- RaidsBuilder
local RaidsBuilder = WithBase({})
RaidsBuilder.__index = RaidsBuilder

function RaidsBuilder:Instance(journalId)
    local inst = setmetatable({ _t = { _v2 = true, Name = addon.GetInstanceInfoName(journalId), Children = {} } }, RaidBuilder)
    tinsert(self._t.Children, inst._t)
    return inst
end

-- ProfessionsBuilder
local ProfessionsBuilder = WithBase({})
ProfessionsBuilder.__index = ProfessionsBuilder

local function AddProf(self, ct, ids)
    tinsert(self._t.Children, { _v2 = true, Name = ct, CanMerge = true, Achievements = ids })
    return self
end

function ProfessionsBuilder:Alchemy(ids)        return AddProf(self, CT.Alchemy, ids) end
function ProfessionsBuilder:Blacksmithing(ids)  return AddProf(self, CT.Blacksmithing, ids) end
function ProfessionsBuilder:Cooking(ids)        return AddProf(self, CT.Cooking, ids) end
function ProfessionsBuilder:Enchanting(ids)     return AddProf(self, CT.Enchanting, ids) end
function ProfessionsBuilder:Engineering(ids)    return AddProf(self, CT.Engineering, ids) end
function ProfessionsBuilder:Fishing(ids)        return AddProf(self, CT.Fishing, ids) end
function ProfessionsBuilder:Herbalism(ids)      return AddProf(self, CT.Herbalism, ids) end
function ProfessionsBuilder:Inscription(ids)    return AddProf(self, CT.Inscription, ids) end
function ProfessionsBuilder:Jewelcrafting(ids)  return AddProf(self, CT.Jewelcrafting, ids) end
function ProfessionsBuilder:Leatherworking(ids) return AddProf(self, CT.Leatherworking, ids) end
function ProfessionsBuilder:Mining(ids)         return AddProf(self, CT.Mining, ids) end
function ProfessionsBuilder:Skinning(ids)       return AddProf(self, CT.Skinning, ids) end
function ProfessionsBuilder:Tailoring(ids)      return AddProf(self, CT.Tailoring, ids) end

-- ExpansionBuilder
local ExpansionBuilder = WithBase({})
ExpansionBuilder.__index = ExpansionBuilder

function ExpansionBuilder:Character(ids)
    tinsert(self._t.Children, { _v2 = true, Name = CT.Character, Achievements = ids })
    return self
end

function ExpansionBuilder:Zones(ids)
    local name = addon.L["Zones"]
    AssertUniqueContainer(self, name)
    local z = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, ZonesBuilder)
    tinsert(self._t.Children, z._t)
    return z
end

function ExpansionBuilder:Delves(ids)
    local name = CT.Delves
    AssertUniqueContainer(self, name)
    local d = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, DelvesBuilder)
    tinsert(self._t.Children, d._t)
    return d
end

function ExpansionBuilder:Dungeons(ids)
    local name = CT.Dungeons
    AssertUniqueContainer(self, name)
    local d = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, DungeonsBuilder)
    tinsert(self._t.Children, d._t)
    return d
end

function ExpansionBuilder:Raids(ids)
    local name = CT.Raids
    AssertUniqueContainer(self, name)
    local r = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, RaidsBuilder)
    tinsert(self._t.Children, r._t)
    return r
end

function ExpansionBuilder:Professions(ids)
    local name = CT.Professions
    AssertUniqueContainer(self, name)
    local p = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, ProfessionsBuilder)
    tinsert(self._t.Children, p._t)
    return p
end

function ExpansionBuilder:PetBattles(ids)
    tinsert(self._t.Children, { _v2 = true, Name = CT.PetBattles, Achievements = ids })
    return self
end

function KrowiAF.NewExpansion(name, ids)
    local expansion = setmetatable({ _t = { _v2 = true, Name = name, Achievements = ids, Children = {} } }, ExpansionBuilder)
    tinsert(KrowiAF.CategoryData.Expansions, expansion._t)
    return expansion
end

-- InjectionBuilder
local InjectionBuilder = WithBase({})
InjectionBuilder.__index = InjectionBuilder

function InjectionBuilder:Named(label, ids, canMerge)
    tinsert(self._t.Children, { _v2 = true, Name = label, Achievements = ids, CanMerge = canMerge })
    return self
end

function InjectionBuilder:RegisterAs(key)
    KrowiAF.CategoryData[key] = self._t
end

function KrowiAF.NewInjection(id)
    return setmetatable({ _t = { _v2 = true, Id = id, Children = {} } }, InjectionBuilder)
end