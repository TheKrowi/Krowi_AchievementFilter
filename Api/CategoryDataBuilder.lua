local _, addon = ...

-- CT is populated lazily: addon.Data.CategoryData.Shared.CT is available at call time (step 13+)
local CT = setmetatable({}, {
    __index = function(_, k)
        return addon.Data.CategoryData.Shared.CT[k]
    end
})

local function AssertUniqueContainer(parent, name)
    for _, child in next, parent.Children do
        assert(child.Name ~= name, "Container '" .. tostring(name) .. "' already added to '" .. tostring(parent.Name) .. "'. Each container method may only be called once per builder.")
    end
end

local function NewNode(name, ids)
    return { _v2 = true, Name = name, Achievements = ids, Children = {} }
end

-- CategoryBuilder — base builder. The instance IS the data node.
-- Methods are on the class (metatable) and are invisible to the parser's key lookups.
local CategoryBuilder = {}
CategoryBuilder.__index = CategoryBuilder

function CategoryBuilder:Ids(ids)
    self.Achievements = self.Achievements or {}
    for _, id in next, ids do
        tinsert(self.Achievements, id)
    end
    return self
end

function CategoryBuilder:Insert(node)
    tinsert(self.Children, node)
    return self
end

function CategoryBuilder:Merge()
    self.CanMerge = true
    return self
end

function CategoryBuilder:Named(label, ids)
    local child = setmetatable(NewNode(label, ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- Named after a map; plain CategoryBuilder child, not a ZoneBuilder.
function CategoryBuilder:ZoneNamed(uiMapId, ids)
    local child = setmetatable(NewNode(addon.GetMapName(uiMapId), ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- Named after an instance; plain CategoryBuilder child, not a RaidBuilder or DungeonsBuilder.
function CategoryBuilder:InstanceNamed(journalId, ids)
    local child = setmetatable(NewNode(addon.GetInstanceInfoName(journalId), ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- ZoneBuilder — inherits CategoryBuilder; created by ZonesBuilder:Zone. All sub-methods auto-set CanMerge=true.
local ZoneBuilder = {}
ZoneBuilder.__index = ZoneBuilder
setmetatable(ZoneBuilder, { __index = CategoryBuilder })

local function AddZoneSub(self, name, ids)
    local child = setmetatable(NewNode(name, ids), CategoryBuilder)
    child.CanMerge = true
    tinsert(self.Children, child)
    return child
end

function ZoneBuilder:Quests(ids)      return AddZoneSub(self, CT.Quests, ids) end
function ZoneBuilder:Exploration(ids) return AddZoneSub(self, CT.Exploration, ids) end
function ZoneBuilder:PvP(ids)         return AddZoneSub(self, CT.PvP, ids) end
function ZoneBuilder:Reputation(ids)  return AddZoneSub(self, CT.Reputation, ids) end

function ZoneBuilder:Named(label, ids)
    local child = setmetatable(NewNode(label, ids), CategoryBuilder)
    child.CanMerge = true
    tinsert(self.Children, child)
    return child
end

-- ZonesBuilder — inherits CategoryBuilder; Zone returns a ZoneBuilder child.
local ZonesBuilder = {}
ZonesBuilder.__index = ZonesBuilder
setmetatable(ZonesBuilder, { __index = CategoryBuilder })

function ZonesBuilder:Zone(uiMapId, ids)
    local child = setmetatable(NewNode(addon.GetMapName(uiMapId), ids), ZoneBuilder)
    tinsert(self.Children, child)
    return child
end

local RaidBuilder = {}
RaidBuilder.__index = RaidBuilder
setmetatable(RaidBuilder, { __index = CategoryBuilder })

function RaidBuilder:Glory(ids)
    local child = setmetatable(NewNode(addon.L["Glory"], ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

function RaidBuilder:Mythic(ids)
    local child = setmetatable(NewNode(addon.L["Mythic"], ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- RaidsBuilder — inherits CategoryBuilder; Instance returns a RaidBuilder child.
local RaidsBuilder = {}
RaidsBuilder.__index = RaidsBuilder
setmetatable(RaidsBuilder, { __index = CategoryBuilder })

function RaidsBuilder:Raid(journalId, ids)
    local child = setmetatable(NewNode(addon.GetInstanceInfoName(journalId), ids), RaidBuilder)
    tinsert(self.Children, child)
    return child
end

local DelvesBuilder = {}
DelvesBuilder.__index = DelvesBuilder
setmetatable(DelvesBuilder, { __index = CategoryBuilder })

function DelvesBuilder:Seasonal(ids)
    local child = setmetatable(NewNode(addon.L["Seasonal"], ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

function DelvesBuilder:Delve(uiMapId, ids)
    local child = setmetatable(NewNode(addon.GetMapName(uiMapId), ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- DungeonsBuilder — inherits CategoryBuilder. MythicPlus(fn) inserts a V1 node (bridge; fn produces V1, not a builder).
local DungeonsBuilder = {}
DungeonsBuilder.__index = DungeonsBuilder
setmetatable(DungeonsBuilder, { __index = CategoryBuilder })

function DungeonsBuilder:MythicPlus(fn)
    tinsert(self.Children, fn(addon.L["Mythic+"]))
    return self
end

function DungeonsBuilder:Dungeon(journalId, ids)
    local child = setmetatable(NewNode(addon.GetInstanceInfoName(journalId), ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

local ProfessionsBuilder = {}
ProfessionsBuilder.__index = ProfessionsBuilder
setmetatable(ProfessionsBuilder, { __index = CategoryBuilder })

local function AddProf(self, name, ids)
    local child = setmetatable(NewNode(name, ids), CategoryBuilder)
    child.CanMerge = true
    tinsert(self.Children, child)
    return child
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

-- ExpansionBuilder — inherits CategoryBuilder. Typed container methods return specialized child builders.
local ExpansionBuilder = {}
ExpansionBuilder.__index = ExpansionBuilder
setmetatable(ExpansionBuilder, { __index = CategoryBuilder })

function ExpansionBuilder:Character(ids)
    local name = CT.Character
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:Zones(ids)
    local name = addon.L["Zones"]
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), ZonesBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:Delves(ids)
    local name = CT.Delves
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), DelvesBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:Dungeons(ids)
    local name = CT.Dungeons
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), DungeonsBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:Raids(ids)
    local name = CT.Raids
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), RaidsBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:Professions(ids)
    local name = CT.Professions
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), ProfessionsBuilder)
    tinsert(self.Children, child)
    return child
end

function ExpansionBuilder:PetBattles(ids)
    local name = CT.PetBattles
    AssertUniqueContainer(self, name)
    local child = setmetatable(NewNode(name, ids), CategoryBuilder)
    tinsert(self.Children, child)
    return child
end

-- InjectionBuilder — appends children to an existing category by TargetId. V2 plugin API via KrowiAF.NewInjection. Call Register() to enqueue.
local injectionCount = 0
local InjectionBuilder = {}
InjectionBuilder.__index = InjectionBuilder
setmetatable(InjectionBuilder, { __index = CategoryBuilder })

function InjectionBuilder:Register()
    injectionCount = injectionCount + 1
    KrowiAF.CategoryData["_injection_" .. injectionCount] = self
end

local function BuildRootCategory(builder, tab, name, ids, id, canMerge)
    local cat = setmetatable({ _v2 = true, Name = name, Achievements = ids, Id = id, CanMerge = canMerge or false, Children = {} }, builder)
    tinsert(tab, cat)
    return cat
end

function KrowiAF.NewRootCategory(tab, name, ids, id, canMerge)
    return BuildRootCategory(CategoryBuilder, tab, name, ids, id, canMerge)
end

function KrowiAF.NewExpansion(name, ids)
    return BuildRootCategory(ExpansionBuilder, KrowiAF.CategoryData.Expansions, name, ids)
end

function KrowiAF.NewInjection(id)
    return setmetatable({ _v2 = true, _injection = true, TargetId = id, Children = {} }, InjectionBuilder)
end