-- An achievement guide is a short list of typed steps that Gui/Guide/ renders from ids, so the data holds only what the
-- game does not know: where to go, whom to talk to and one tip. Coordinates are percent (0-100) on the uiMap, measured in
-- game with /kafwhere or read from the area POI table, never copied from a website.
--   Guide(60962):Travel(50977):Npc(97485, addon.L["Archivist Zubashi"], 648, 47.7, 53.8):Criteria():Tip(addon.L["..."])
local GuideBuilder = {}
GuideBuilder.__index = GuideBuilder

local function AddStep(self, step)
    tinsert(self[3], step)
    return self
end

-- Travel by a spell, e.g. Death Gate (50977); the spell name comes from the game
function GuideBuilder:Travel(spellId)
    return AddStep(self, {Type = "Travel", SpellId = spellId})
end

-- Talk to an NPC; the name goes through addon.L because creature names come from the server cache
function GuideBuilder:Npc(npcId, name, uiMapId, x, y)
    return AddStep(self, {Type = "Npc", NpcId = npcId, Name = name, MapId = uiMapId, X = x, Y = y})
end

-- Take a portal an area POI marks; its name comes from the game, the map and coordinates serve TomTom and the text
function GuideBuilder:Poi(areaPoiId, uiMapId, x, y)
    return AddStep(self, {Type = "Poi", PoiId = areaPoiId, MapId = uiMapId, X = x, Y = y})
end

-- The achievement's garrison talent criteria (type 198) with their live research state
function GuideBuilder:Criteria()
    return AddStep(self, {Type = "Criteria"})
end

-- One line of hand-written advice
function GuideBuilder:Tip(text)
    return AddStep(self, {Type = "Tip", Text = text})
end

-- Shows the step before it to one faction only, e.g. :Poi(5057, 627, 32.7, 69.8):Faction(faction.Alliance)
function GuideBuilder:Faction(faction)
    local step = self[3][#self[3]]
    assert(step, "Faction() must follow a step, e.g. :Poi(5057, 627, 32.7, 69.8):Faction(faction.Alliance)")
    step.Faction = faction
    return self
end

function KrowiAF.Guide(id)
    return setmetatable({KrowiAF.AddGuideData, id, {}}, GuideBuilder)
end