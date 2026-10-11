local _, addon = ...
addon.Gui.Guide.Waypoint = {}
local waypoint = addon.Gui.Guide.Waypoint

-- Places a guide step's waypoint with the provider the player chose (Achievements.Guide.WaypointProvider). The game's
-- own navigation is a map pin, or for a portal step the super-tracked area POI, which works where the map refuses a map
-- pin (Dalaran and most class halls). Coordinates are percent (0-100), as the data and /way use them. Every call that
-- places a waypoint runs from the player's click.

waypoint.Provider = {Both = 1, MapPin = 2, TomTom = 3}

local function IsTomTomLoaded()
    return TomTom ~= nil and TomTom.AddWaypoint ~= nil
end

-- What can place the point right now: {MapPin, Poi, TomTom, Combat}, where MapPin is whether the map allows one
function waypoint.GetAvailability(point)
    local mapPin = C_Map.CanSetUserWaypointOnMap ~= nil and C_Map.SetUserWaypoint ~= nil and UiMapPoint ~= nil
        and C_Map.CanSetUserWaypointOnMap(point.MapId) == true
    local poi = point.PoiId ~= nil and C_SuperTrack ~= nil and C_SuperTrack.SetSuperTrackedMapPin ~= nil and C_AreaPoiInfo ~= nil
        and C_AreaPoiInfo.GetAreaPOIInfo(point.MapId, point.PoiId) ~= nil
    return {MapPin = mapPin, Poi = poi, TomTom = IsTomTomLoaded(), Combat = InCombatLockdown()}
end

-- C_Map.SetUserWaypoint fires USER_WAYPOINT_UPDATED synchronously (MapDocumentation.lua), so Blizzard's world map
-- handlers run in this addon's taint; in combat they can be blocked (SetPassThroughButtons). TomTom guards the same
-- call. The menu offers no map pin in combat, and the click checks again because the menu may have opened before it.
local function SetMapPin(point)
    if InCombatLockdown() then
        return
    end
    C_Map.SetUserWaypoint(UiMapPoint.CreateFromCoordinates(point.MapId, point.X / 100, point.Y / 100))
    if C_SuperTrack and C_SuperTrack.SetSuperTrackedUserWaypoint then
        C_SuperTrack.SetSuperTrackedUserWaypoint(true)
    end
end

local function SuperTrackPoi(point)
    C_SuperTrack.SetSuperTrackedMapPin(Enum.SuperTrackingMapPinType.AreaPOI, point.PoiId)
end

-- The name an action shows for its point; the map's when a step gave none. Never nil: K_ReplaceVars(nil) reads the
-- string as its {str, vars} table form and fails
local function GetTitle(point)
    if point.Title then
        return point.Title
    end
    local info = C_Map.GetMapInfo(point.MapId)
    return info and info.name or tostring(point.MapId)
end

local function SetTomTom(point)
    TomTom:AddWaypoint(point.MapId, point.X / 100, point.Y / 100, {title = GetTitle(point), from = addon.Metadata.Title})
end

local function BlizzardAction(point, available)
    local text = addon.L["Guide Map Pin"]:K_ReplaceVars{target = GetTitle(point)}
    if point.PoiId and available.Poi then
        return {Kind = "Poi", Text = text, Enabled = true, Func = function() SuperTrackPoi(point) end}
    end
    if available.MapPin and not available.Combat then
        return {Kind = "MapPin", Text = text, Enabled = true, Func = function() SetMapPin(point) end}
    end
    local reason = available.MapPin and "Guide Map Pin In Combat" or "Guide Map Pin Not Allowed"
    return {Kind = "MapPin", Text = addon.L[reason]:K_ReplaceVars{action = text}, Enabled = false}
end

local function TomTomAction(point, available)
    local text = addon.L["Guide TomTom"]:K_ReplaceVars{target = GetTitle(point)}
    if available.TomTom then
        return {Kind = "TomTom", Text = text, Enabled = true, Func = function() SetTomTom(point) end}
    end
    return {Kind = "TomTom", Text = addon.L["Guide TomTom Not Loaded"]:K_ReplaceVars{action = text}, Enabled = false}
end

-- The waypoint actions for a point: {Kind = "MapPin"|"Poi"|"TomTom", Text, Enabled, Func}. The chosen provider is
-- offered even when it cannot place the point, disabled with the reason in its text (Classic menus have no tooltips).
-- Both offers every provider that can place it, and the map pin with its reason when none can.
function waypoint.GetActions(point, provider, available)
    if provider == waypoint.Provider.MapPin then
        return {BlizzardAction(point, available)}
    end
    if provider == waypoint.Provider.TomTom then
        return {TomTomAction(point, available)}
    end
    local actions = {}
    for _, action in ipairs({BlizzardAction(point, available), TomTomAction(point, available)}) do
        if action.Enabled then
            tinsert(actions, action)
        end
    end
    if #actions == 0 then
        tinsert(actions, BlizzardAction(point, available))
    end
    return actions
end

-- The actions for a point with the player's provider option and what the game can do right now
function waypoint.GetCurrentActions(point)
    return waypoint.GetActions(point, addon.Options.db.profile.Achievements.Guide.WaypointProvider, waypoint.GetAvailability(point))
end