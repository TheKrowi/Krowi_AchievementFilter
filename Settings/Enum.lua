local _, addon = ...

-- The numbers the core's dropdowns save, by name (Blizzard's way, Krowi 2026-11-27): each number is written here once,
-- and the defaults (Declarations.lua), the option rows' choices and the code that reads the setting all go through
-- these names. A new choice takes the next unused number wherever it shows in the list; a number is never changed or
-- reused, since players' saved files hold it. The features keep theirs on their own table (a feature's Enum). The
-- settings-choices lint rule finds a setting compared with a bare number.
addon.Enum = {}
local enum = addon.Enum
enum.PointsFormat = { Account = 1, CharacterAndAccount = 2, Character = 3 }
enum.CriteriaBehaviour = { Overflow = 1, Truncate = 2, Flexible = 3 }
enum.GuideActionStyle = { Icons = 1, Links = 2 }
enum.GuideWaypointProvider = { Both = 1, MapPin = 2, TomTom = 3 }
enum.Modifier = { None = 1, Alt = 2, Ctrl = 3, Shift = 4, RightAlt = 5, RightCtrl = 6, RightShift = 7, LeftAlt = 8,
    LeftCtrl = 9, LeftShift = 10 }
enum.PointsSortBy = { Points = 1, Name = 2, Realm = 3, Faction = 4, Class = 5 }