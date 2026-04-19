# Krowi's Achievement Filter — Lua Style Guide

This document captures the coding conventions for this addon. Follow these rules in all new and edited files.

---

## File Header

Every file starts with the vararg unpack to receive the shared addon namespace. Use `_` for any unused positional variables:

```lua
-- correct: addonName not used
local _, addon = ...

-- correct: both used
local addonName, addon = ...

-- wrong: addonName declared but never referenced
local addonName, addon = ...
```

Do **not** add a `-- [[ Namespaces ]] --` (or similar section) header comment above this line. The unpack is self-explanatory and the comment adds noise.

---

## Semicolons

Do **not** use semicolons at the end of statements. Existing semicolons may remain in untouched code, but remove them when editing the surrounding lines.

```lua
-- correct
local x = 1
addon.Foo = {}

-- wrong
local x = 1;
addon.Foo = {};
```

---

## Naming

| Kind | Convention | Example |
|------|-----------|---------|
| Local variables | `camelCase` | `local myValue` |
| Module tables | `camelCase` local, `PascalCase` on `addon.*` | `local gui = addon.Gui` |
| Object constructors / methods | `PascalCase` | `function category:New()` |
| Module-level private helpers | `PascalCase` for named functions, `camelCase` for locals | `local function VersionLessThan(a, b)` |

---

## Module Pattern

```lua
local _, addon = ...
addon.MyModule = {}
local myModule = addon.MyModule

function myModule.DoThing()
    ...
end
```

---

## OOP Pattern

```lua
local myObject = {}
myObject.__index = myObject

function myObject:New(...)
    local instance = setmetatable({}, myObject)
    ...
    return instance
end

function myObject:DoThing()
    ...
end
```

---

## Forward Declarations

When functions call each other before their definition, declare them at the top of the relevant scope, not at the top of the file unless necessary:

```lua
local Foo, Bar

function Foo()
    Bar()
end

function Bar()
    ...
end
```

---

## Nil-safe Defaults

Use `or {}` for lazy table initialisation, consistent with how `Category` and `SavedData` manage optional sub-tables:

```lua
self.Children = self.Children or {}
KrowiAF_SavedData.Fixes = KrowiAF_SavedData.Fixes or {}
```
