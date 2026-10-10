-- Finds where a namespaced name of the addon is defined and who reads or calls it, across the
-- addon's own .lua and .xml files. Libs/, docs/, wiki/, raw/, _Packaging/ and every dot-folder
-- are skipped; the file list comes from the file system (dir), not from git.
-- Usage: lua.exe find-symbol.lua <repo root> <name> [-list] [-defs]
--   <name>  a full path (addon.Data.LoadOnPlayerLogin, KrowiAF.Ach, KrowiAF_SomeMixin.OnLoad) or a
--           bare member (GetPatch), which takes every resolved name ending in it, plus the
--           unresolved call sites
--   -list   every member defined directly under <name>, with its definition
--   -defs   definitions only
-- Prints "<path>:<line>: <kind>: <source line>" grouped by kind (def, ref, xml, then the guessed and
-- unresolved self?, def?, call? and dyn?) and a summary line. Exits 0 when something was printed, 1
-- when nothing was, 2 on a usage error.
--
-- Kinds: def is an assignment or function definition of the name (also a key of a table constructor
-- assigned to its parent, and CreateFrame(type, "Name") for a global frame), ref a read or call of
-- it or of a member under it, xml an XML attribute or inline script naming it. self? is self.X or
-- self:X() inside `function <owner>:Method()`, read as <owner>.X: a guess, since self can be an
-- instance, a frame or a subclass. call? is a :Member( or .Member( on a value that cannot be
-- resolved statically (a parameter, a local, a call result), def? a member assigned or defined on
-- such a value, dyn? a parent[expr] index that may reach the name at run time.
--
-- Resolution, per file and in source order: comments and string contents are blanked with spaces
-- first, so every position stays where it was and nothing in them matches. `local _, addon = ...`
-- binds the namespace, `local x = <chain>` makes x an alias of the chain's resolved name (chained
-- aliases resolve through earlier ones), and `<name> = x` on a local table binds x to that name for
-- the whole file (the OOP pattern; the file is scanned a second time when such a binding comes after
-- a use). Locals are scoped to their block, so a parameter, loop variable or inner local shadows an
-- alias. A name that is no local in scope is a global (KrowiAF, mixins, frames).

local find, sub, byte, match, gsub, gmatch, rep, lower = string.find, string.sub, string.byte, string.match, string.gsub, string.gmatch, string.rep, string.lower
local started = os.clock()

local function Usage(message)
    io.stderr:write(message, "\nusage: lua.exe find-symbol.lua <repo root> <name> [-list] [-defs]\n")
    os.exit(2)
end

-- [[ Arguments ]]
local positional, listMode, defsOnly = {}, false, false
for i = 1, select("#", ...) do
    local arg = select(i, ...)
    local flag = lower(arg)
    if flag == "-list" then
        listMode = true
    elseif flag == "-defs" then
        defsOnly = true
    else
        positional[#positional + 1] = arg
    end
end
if #positional ~= 2 then Usage("expected a repo root and one name") end
local root = gsub(gsub(positional[1], "\\", "/"), "/+$", "")
local query = gsub(positional[2], ":", ".")
if find(query, "[^%w_%.]") or find(query, "^%.") or find(query, "%.$") or find(query, "%.%.") or find(query, "^%d") or find(query, "%.%d") then
    Usage("not a name: " .. positional[2])
end

local queryLength = #query
local last = match(query, "([%w_]+)$")
local parent = queryLength > #last and sub(query, 1, queryLength - #last - 1) or nil
local memberMode = not listMode and not parent
-- a method= in XML can only reach a member of a global table, the mixin
local mixinParent = not listMode and parent and not find(parent, ".", 1, true) and parent or nil
local dotLast, dotLastDot = "." .. last, "." .. last .. "."

-- [[ Hits ]]
-- Positions are collected per scanned text and turned into lines once that text is done
local hits, xmlPhase, memberDefs = nil, false, 0
local resolvedNames, namespaces = {}, {}

local function Hit(kind, pos, extra, role)
    if xmlPhase then
        if kind == "dyn?" then return end
        kind = "xml"
    end
    hits[#hits + 1] = { pos = pos, kind = kind, extra = extra, role = role }
end

-- [[ Visitors ]]
-- Each name occurrence comes in as (base, tail, role, pos, nextByte, guess): base is the resolved
-- head ("addon", "KrowiAF", a global) or nil when it cannot be resolved, tail the rest with dots
-- (".Gui.Search"), role "def", "ref" or "call", nextByte the first character after the name (91 is
-- "["), and guess, for self inside `function <name>:Method()`, the name self most likely is.
local visit

if listMode then
    -- `-list addon.Gui`: definitions exactly one level below; `-list Search`: below any name ending in Search
    local single = not parent
    local dotQuery = "." .. query
    visit = function(base, tail, role, pos)
        if role ~= "def" or not base then return end
        local path = base .. tail
        local owner, member = match(path, "^(.*)%.([%w_]+)$")
        if owner and (owner == query or (single and sub(owner, -#dotQuery) == dotQuery)) then
            namespaces[owner] = true
            Hit("def", pos, member)
        end
    end
elseif memberMode then
    visit = function(base, tail, role, pos, _, guess)
        if base then
            if not (find(tail, last, 1, true) or find(base, last, 1, true)) then return end
            local path = base .. tail
            local wrapped = "." .. path .. "."
            local at = find(wrapped, dotLastDot, 1, true)
            if not at then return end
            if sub(wrapped, -#dotLastDot) == dotLastDot then
                resolvedNames[path] = true
                Hit(role == "def" and "def" or "ref", pos)
            elseif role ~= "def" then
                -- a read through a name ending in the member (KrowiAF.Enum.Faction.Alliance for Faction)
                resolvedNames[sub(path, 1, at + #last - 1)] = true
                Hit("ref", pos)
            elseif not xmlPhase then
                memberDefs = memberDefs + 1
            end
        elseif guess then
            -- only the part after self counts: every self.X in a class is not a use of the class
            if sub(tail, -#dotLast) == dotLast or (role ~= "def" and find(tail .. ".", dotLastDot, 1, true)) then
                Hit("self?", pos, nil, role)
            end
        elseif sub(tail, -#dotLast) == dotLast then
            if role == "call" then
                Hit("call?", pos)
            elseif role == "def" then
                Hit("def?", pos)
            end
        end
    end
else
    local firstByte = byte(query, 1)
    visit = function(base, tail, role, pos, nextByte, guess)
        local certain = base ~= nil
        if not certain then
            -- self.X in a method of an owner above the query; for the owner itself every self.X
            -- in its methods would be a use of it
            if not guess or #guess >= queryLength then return end
            base = guess
        end
        if byte(base, 1) ~= firstByte then return end
        local path = tail == "" and base or base .. tail
        local length = #path
        if path == query then
            Hit(certain and (role == "def" and "def" or "ref") or "self?", pos, nil, role)
        elseif length > queryLength then
            if byte(path, queryLength + 1) == 46 and sub(path, 1, queryLength) == query then
                if role ~= "def" then
                    Hit(certain and "ref" or "self?", pos, nil, role)
                elseif certain and not xmlPhase then
                    memberDefs = memberDefs + 1
                end
            end
        elseif nextByte == 91 and path == parent then
            Hit("dyn?", pos)
        end
    end
end

-- [[ Lua scanning ]]
-- src[first..final] as spaces, newlines kept
local function Blank(src, first, final)
    if final < first then return "" end
    local text = sub(src, first, final)
    if not find(text, "\n", 1, true) then return rep(" ", #text) end
    return (gsub(text, "[^\n]", " "))
end

-- Blanks comments and string contents with spaces ("abc" becomes "   ", a long string becomes
-- "     "), so every position in the result is the same character position as in the source
local function StripLua(src)
    local out, n, i = {}, #src, 1
    while i <= n do
        local s = find(src, "[%-\"'%[]", i)
        if not s then
            out[#out + 1] = sub(src, i)
            break
        end
        local c = byte(src, s)
        if c == 45 then -- "-"
            if byte(src, s + 1) == 45 then
                out[#out + 1] = sub(src, i, s - 1)
                local level = match(src, "^%[(=*)%[", s + 2)
                local e
                if level then
                    local _, close = find(src, "]" .. level .. "]", s + 4 + #level, true)
                    e = close or n
                else
                    e = (find(src, "\n", s + 2, true) or n + 1) - 1 -- a line comment ends before its newline
                end
                out[#out + 1] = Blank(src, s, e)
                i = e + 1
            else
                out[#out + 1] = sub(src, i, s)
                i = s + 1
            end
        elseif c == 91 then -- "["
            local level = match(src, "^%[(=*)%[", s)
            if level then
                local _, close = find(src, "]" .. level .. "]", s + 2 + #level, true)
                local e = close or n
                out[#out + 1] = sub(src, i, s - 1)
                out[#out + 1] = '"' .. Blank(src, s + 1, e - 1) .. '"'
                i = e + 1
            else
                out[#out + 1] = sub(src, i, s)
                i = s + 1
            end
        else -- a quote
            out[#out + 1] = sub(src, i, s - 1)
            local stops = c == 34 and '[\\\n"]' or "[\\\n']"
            local q, closed = s + 1, false
            while true do
                local t = find(src, stops, q)
                if not t then
                    q = n + 1
                    break
                end
                local tc = byte(src, t)
                if tc == 92 then
                    q = t + 2 -- an escape, also of a newline
                elseif tc == 10 then
                    q = t -- unfinished string: it ends at the newline
                    break
                else
                    q, closed = t + 1, true
                    break
                end
            end
            if closed then
                out[#out + 1] = sub(src, s, s) .. Blank(src, s + 1, q - 2) .. sub(src, s, s)
            else
                out[#out + 1] = Blank(src, s, q - 1) -- no quote left behind to pair with a later one
            end
            i = q
        end
    end
    return table.concat(out)
end

local KEYWORDS = {}
for word in gmatch("and break do else elseif end false for function if in local nil not or repeat return then true until while", "%S+") do
    KEYWORDS[word] = true
end

-- Walks stripped Lua code once, tracking blocks, table constructors and locals, and reports every
-- name chain to visit. late maps a local's declaration position to the name a later statement bound
-- it to (from a first run); the second return value asks for such a run.
local function ScanLua(code, late)
    local n = #code
    local stack, depth = { { block = true } }, 1 -- blocks hold locals, constructors an owner name
    local bound, rerun = {}, false
    local pendingOwner, pendingFor
    local prev = ";"
    local pos = 1

    local function Push(entry)
        depth = depth + 1
        stack[depth] = entry
    end

    -- closes the innermost block and anything left open above it; the file scope stays
    local function PopBlock()
        while depth > 1 do
            local entry = stack[depth]
            stack[depth] = nil
            depth = depth - 1
            if entry.block then return end
        end
    end

    local function Lookup(name)
        for i = depth, 1, -1 do
            local locals = stack[i].locals
            if locals then
                local rec = locals[name]
                if rec then return rec end
            end
        end
    end

    local function Declare(name, path, at)
        local i = depth
        while not stack[i].block do i = i - 1 end
        local locals = stack[i].locals
        if not locals then
            locals = {}
            stack[i].locals = locals
        end
        if not path and late and at then path = late[at] end
        local rec = { path = path, at = at }
        locals[name] = rec
        return rec
    end

    -- "a.b:c" -> resolved head (or nil), ".b.c", and for self the owner of the method it is in
    local function Resolve(chain)
        local h = find(chain, "[%.:]")
        local head = h and sub(chain, 1, h - 1) or chain
        local tail = h and sub(chain, h) or ""
        if h and find(tail, ":", 1, true) then tail = gsub(tail, ":", ".") end
        local rec = Lookup(head)
        if head == "self" then return nil, tail, rec and rec.selfOf end
        if rec then
            if not rec.path then rec.used = true end
            return rec.path, tail
        end
        if head == "_G" and h then
            local global = match(tail, "^%.([%w_]+)")
            return global, sub(tail, #global + 2)
        end
        return head, tail
    end

    local function NextByte(q)
        local np = find(code, "%S", q)
        if not np then return nil, n + 1 end
        return byte(code, np), np
    end

    local function RoleOf(nextByte)
        if nextByte == 40 or nextByte == 34 or nextByte == 39 or nextByte == 123 then return "call" end
        return "ref"
    end

    -- the name chain that starts at p, with ".." and a dangling separator cut off
    local function ReadChain(p)
        local _, e = find(code, "^[%w_%.:]*", p)
        local chain = sub(code, p, e)
        local cut = find(chain, "..", 1, true)
        if cut then chain = sub(chain, 1, cut - 1) end
        if find(chain, "[%.:]$") then chain = gsub(chain, "[%.:]+$", "") end
        return chain, p + #chain - 1
    end

    -- the expression after "=" at q when it is one name chain that ends the statement
    local function SingleChain(q)
        local s, e, chain = find(code, "^%s*([%a_][%w_%.:]*)", q)
        if not s or KEYWORDS[chain] or find(chain, "..", 1, true) or find(chain, "[%.:]$") then return nil end
        if find(code, "^[ \t]*\r?\n", e + 1) or find(code, "^[ \t]*;", e + 1) or find(code, "^[ \t]*$", e + 1) or find(code, "^[ \t]+or[ \t]*{", e + 1) then
            return chain, e
        end
    end

    local function Bind(rec, path)
        rec.path = path
        if path and rec.at then
            bound[rec.at] = path
            if rec.used then rerun = true end
        end
    end

    -- a chain followed by "=" outside a constructor key: a definition, or a local being rebound
    local function Assign(chain, p, equals)
        local rhs = SingleChain(equals + 1)
        if not find(chain, "[%.:]") then
            local rec = Lookup(chain)
            if rec or chain == "self" then
                if rec then
                    local path
                    if rhs then
                        local base, tail = Resolve(rhs)
                        path = base and base .. tail
                    end
                    Bind(rec, path)
                end
                return
            end
        end
        local base, tail, guess = Resolve(chain)
        visit(base, tail, "def", p, 61, guess)
        if not base then return end
        local path = base .. tail
        if find(code, "^%s*{", equals + 1) then pendingOwner = path end
        -- `addon.Objects.Category = category` names the local table category
        if rhs and not find(rhs, "[%.:]") then
            local rec = Lookup(rhs)
            if rec and not rec.path then Bind(rec, path) end
        end
    end

    local function Chain(p)
        local chain, e = ReadChain(p)
        local nextByte, np = NextByte(e + 1)
        if nextByte == 61 and byte(code, np + 1) ~= 61 then
            local top = stack[depth]
            if not top.block and (prev == "{" or prev == "," or prev == ";") and not find(chain, "[%.:]") then
                -- a constructor key: a definition when the constructor is assigned to a name
                if top.owner then
                    local path = top.owner .. "." .. chain
                    visit(path, "", "def", p, 61)
                    if find(code, "^%s*{", np + 1) then pendingOwner = path end
                end
            else
                Assign(chain, p, np)
            end
        else
            local base, tail, guess = Resolve(chain)
            if base or tail ~= "" then visit(base, tail, RoleOf(nextByte), p, nextByte, guess) end
        end
        prev = "name"
        return e + 1
    end

    -- ".name" or ":name" after a call, an index or a string: never resolvable
    local function Continuation(p)
        local start = match(code, "^[%.:][ \t]*()[%a_]", p)
        if not start then
            prev = "op"
            return p + 1
        end
        local chain, e = ReadChain(start)
        local nextByte, np = NextByte(e + 1)
        local role = RoleOf(nextByte)
        if nextByte == 61 and byte(code, np + 1) ~= 61 then role = "def" end
        visit(nil, "." .. gsub(chain, ":", "."), role, p, nextByte)
        prev = "name"
        return e + 1
    end

    -- owner: the resolved table a method is defined on, which self (implicit, or an explicit first
    -- parameter of `function a.b.Method(self)`) most likely is
    local function FunctionBody(q, isMethod, owner)
        Push({ block = true })
        if isMethod then Declare("self").selfOf = owner end
        local s, e, params = find(code, "^%s*%(([^%)]*)%)", q)
        if not s then
            prev = "function"
            return q
        end
        for param in gmatch(params, "[%a_][%w_]*") do
            local rec = Declare(param)
            if param == "self" and not isMethod then rec.selfOf = owner end
        end
        prev = ")"
        return e + 1
    end

    local function Function(q)
        local s, e, name = find(code, "^%s*([%a_][%w_%.:]*)", q)
        if not s then return FunctionBody(q, false) end
        local p = e - #name + 1
        local owner
        if find(name, "[%.:]") then
            local base, tail, guess = Resolve(name)
            visit(base, tail, "def", p, 40, guess)
            if base then owner = match(base .. tail, "^(.*)%.[%w_]+$") end
        elseif not Lookup(name) then
            visit(name, "", "def", p, 40) -- a global function
        end
        return FunctionBody(e + 1, find(name, ":", 1, true) ~= nil, owner)
    end

    local function Local(q)
        local s, e, name = find(code, "^%s*([%a_][%w_]*)", q)
        if not s then return q end
        if name == "function" then
            local s2, e2, fname = find(code, "^%s*([%a_][%w_]*)", e + 1)
            if not s2 then return FunctionBody(e + 1, false) end
            Declare(fname, nil, e2 - #fname + 1)
            return FunctionBody(e2 + 1, false)
        end
        local names, ats = { name }, { e - #name + 1 }
        q = e + 1
        while true do
            local s3, e3, more = find(code, "^%s*,%s*([%a_][%w_]*)", q)
            if not s3 then break end
            names[#names + 1] = more
            ats[#ats + 1] = e3 - #more + 1
            q = e3 + 1
        end
        local s4, equals = find(code, "^%s*=", q)
        prev = "name"
        if not s4 then
            for i = 1, #names do Declare(names[i], nil, ats[i]) end
            return q
        end
        prev = "="
        if depth == 1 and find(code, "^%s*%.%.%.", equals + 1) then
            -- `local addonName, addon = ...` at file scope: the second name is the namespace
            for i = 1, #names do Declare(names[i], i == 2 and "addon" or nil, ats[i]) end
            return equals + 1
        end
        if #names == 1 then
            local chain, ce = SingleChain(equals + 1)
            if chain then
                -- the right-hand side is read in the outer scope, then the alias is declared
                local base, tail, guess = Resolve(chain)
                local cp = ce - #chain + 1
                local nextByte = NextByte(ce + 1)
                if base or tail ~= "" then visit(base, tail, "ref", cp, nextByte, guess) end
                Declare(names[1], base and base .. tail, ats[1])
                prev = "name"
                return ce + 1
            end
            local rec = Declare(names[1], nil, ats[1])
            if rec.path and find(code, "^%s*{", equals + 1) then pendingOwner = rec.path end
            return equals + 1
        end
        for i = 1, #names do Declare(names[i], nil, ats[i]) end
        return equals + 1
    end

    while true do
        local p = find(code, "%S", pos)
        if not p then break end
        local b = byte(code, p)
        if (b >= 97 and b <= 122) or (b >= 65 and b <= 90) or b == 95 then
            local _, e = find(code, "^[%w_]*", p + 1)
            local word = sub(code, p, e)
            if not KEYWORDS[word] then
                pos = Chain(p)
            else
                pos = e + 1
                prev = word
                if word == "function" then
                    pos = Function(pos)
                elseif word == "local" then
                    pos = Local(pos)
                elseif word == "do" then
                    Push({ block = true })
                    if pendingFor then
                        for _, name in ipairs(pendingFor) do Declare(name) end
                        pendingFor = nil
                    end
                elseif word == "then" or word == "repeat" then
                    Push({ block = true })
                elseif word == "end" or word == "until" or word == "elseif" then
                    PopBlock()
                elseif word == "else" then
                    PopBlock()
                    Push({ block = true })
                elseif word == "for" then
                    local names = {}
                    local s2, e2, name = find(code, "^%s*([%a_][%w_]*)", pos)
                    while s2 do
                        names[#names + 1] = name
                        pos = e2 + 1
                        s2, e2, name = find(code, "^%s*,%s*([%a_][%w_]*)", pos)
                    end
                    pendingFor = names
                end
            end
        elseif b >= 48 and b <= 57 then
            local _, e = find(code, "^[%w_%.]*", p + 1)
            pos = e + 1
            prev = "num"
        elseif b == 46 or b == 58 then -- "." or ":"
            local b2 = byte(code, p + 1)
            if b == 46 and b2 == 46 then
                pos = p + (byte(code, p + 2) == 46 and 3 or 2)
                prev = "op"
            elseif b == 46 and b2 and b2 >= 48 and b2 <= 57 then
                local _, e = find(code, "^[%w_%.]*", p + 1)
                pos = e + 1
                prev = "num"
            else
                pos = Continuation(p)
            end
        elseif b == 123 then -- "{"
            Push({ owner = pendingOwner })
            pendingOwner = nil
            prev = "{"
            pos = p + 1
        elseif b == 125 then -- "}"
            if depth > 1 and not stack[depth].block then
                stack[depth] = nil
                depth = depth - 1
            end
            prev = "}"
            pos = p + 1
        elseif b == 34 or b == 39 then
            local close = find(code, b == 34 and '"' or "'", p + 1, true)
            pos = (close or n) + 1
            prev = "str"
        else
            prev = (b == 41 and ")") or (b == 93 and "]") or (b == 44 and ",") or (b == 59 and ";") or (b == 40 and "(") or "op"
            pos = p + 1
        end
    end
    return bound, rerun
end

-- [[ XML scanning ]]
local function Newlines(text)
    local _, count = gsub(text, "\n", "")
    return rep("\n", count)
end

local TAG = "()<(/?)([%a_][%w_%.:%-]*)([^>]*)>"
local ENTITIES = { lt = "<", gt = ">", amp = "&", quot = '"', apos = "'" }

local function ParseList(value)
    local list = {}
    for item in gmatch(value, "[^,%s]+") do list[#list + 1] = item end
    return list
end

-- name -> mixins and inherited templates of every named XML element, for the owner of a method=
local templates, effective = {}, {}

local function CollectTemplates(xml)
    for _, slash, _, attrs in gmatch(xml, TAG) do
        local name = slash == "" and match(attrs, '%f[%w_]name%s*=%s*"([^"$]*)"')
        if name then
            local mixin = match(attrs, '%f[%w_]mixin%s*=%s*"([^"]*)"')
            local inherits = match(attrs, '%f[%w_]inherits%s*=%s*"([^"]*)"')
            if mixin or inherits then
                templates[name] = { mixins = ParseList(mixin or ""), inherits = ParseList(inherits or "") }
            end
        end
    end
end

local function EffectiveMixins(name, seen)
    if effective[name] then return effective[name] end
    local set = {}
    local template = templates[name]
    if template and not seen[name] then
        seen[name] = true
        for _, mixin in ipairs(template.mixins) do set[mixin] = true end
        for _, inherited in ipairs(template.inherits) do
            for mixin in pairs(EffectiveMixins(inherited, seen)) do set[mixin] = true end
        end
    end
    effective[name] = set
    return set
end

-- a method= hit for Mixin.Member when the element that owns the script carries that mixin, or
-- carries none we know of (it may be mixed in from Lua)
local function OwnerMayBe(owner, mixin)
    if not owner then return true end
    local known = false
    for _, m in ipairs(owner.mixins or {}) do
        if m == mixin then return true end
        known = true
    end
    for _, inherited in ipairs(owner.inherits or {}) do
        for m in pairs(EffectiveMixins(inherited, {})) do
            if m == mixin then return true end
            known = true
        end
    end
    return not known
end

local function XmlName(value, pos)
    if value == query or (memberMode and sub(value, -#dotLast) == dotLast) then Hit("xml", pos) end
end

-- attributes that name Lua: mixin (global tables), function (a global function), name (the global
-- a frame creates) and method (a member of the frame's mixins)
local function ScanXmlTags(xml)
    local elements = {}
    for tagPos, slash, tag, attrs in gmatch(xml, TAG) do
        if slash == "/" then
            elements[#elements] = nil
        else
            local attrStart = tagPos + 1 + #tag
            local mixins, inherits
            for at, key, value in gmatch(attrs, '()([%w_]+)%s*=%s*"([^"]*)"') do
                local pos = attrStart + at - 1
                if key == "mixin" or key == "secureMixin" then
                    mixins = ParseList(value)
                    for _, mixin in ipairs(mixins) do XmlName(mixin, pos) end
                elseif key == "inherits" then
                    inherits = ParseList(value)
                elseif key == "function" then
                    XmlName(value, pos)
                elseif key == "name" and not find(value, "$", 1, true) then
                    XmlName(value, pos)
                elseif key == "method" and value == last then
                    if memberMode then
                        Hit("xml", pos)
                    elseif mixinParent then
                        local owner
                        for i = #elements, 1, -1 do
                            if elements[i].tag ~= "Scripts" then
                                owner = elements[i]
                                break
                            end
                        end
                        if OwnerMayBe(owner, mixinParent) then Hit("xml", pos) end
                    end
                end
            end
            if sub(attrs, -1) ~= "/" then
                elements[#elements + 1] = { tag = tag, mixins = mixins, inherits = inherits }
            end
        end
    end
end

-- [[ Files ]]
local SKIPPED = { libs = true, docs = true, wiki = true, raw = true, _packaging = true }

local function CommandLines(command)
    local lines = {}
    local pipe = io.popen(command)
    if pipe then
        for line in pipe:lines() do
            line = gsub(line, "\r$", "")
            if line ~= "" then lines[#lines + 1] = line end
        end
        pipe:close()
    end
    return lines
end

local function ListFiles()
    if not find(root, "^%a:/") and not find(root, "^//") then
        -- dir /s prints absolute paths, so a relative root is made absolute first
        root = gsub(CommandLines('cd /d "' .. gsub(root, "/", "\\") .. '" && cd')[1] or root, "\\", "/")
    end
    local winRoot = gsub(root, "/", "\\")
    local files = {}
    local function Add(full)
        local lowered = lower(full)
        if find(lowered, "%.lua$") or find(lowered, "%.xml$") then
            files[#files + 1] = sub(gsub(full, "\\", "/"), #root + 2)
        end
    end
    for _, name in ipairs(CommandLines('dir /b /a-d "' .. winRoot .. '\\*.lua" "' .. winRoot .. '\\*.xml" 2>nul')) do
        Add(winRoot .. "\\" .. name)
    end
    local specs = {}
    for _, dir in ipairs(CommandLines('dir /b /ad "' .. winRoot .. '" 2>nul')) do
        if sub(dir, 1, 1) ~= "." and not SKIPPED[lower(dir)] then
            local base = '"' .. winRoot .. "\\" .. dir .. "\\"
            specs[#specs + 1] = base .. '*.lua" ' .. base .. '*.xml"'
        end
    end
    if #specs > 0 then
        for _, full in ipairs(CommandLines("dir /b /s /a-d " .. table.concat(specs, " ") .. " 2>nul")) do Add(full) end
    end
    table.sort(files, function(a, b) return lower(a) < lower(b) end)
    return files
end

local function ReadFile(path)
    local file = io.open(path, "rb")
    if not file then return nil end
    local text = file:read("*a")
    file:close()
    return text
end

local function LineMapper(text)
    local starts = { 1 }
    for p in gmatch(text, "\n()") do starts[#starts + 1] = p end
    return function(pos)
        local lo, hi = 1, #starts
        while lo < hi do
            local mid = math.floor((lo + hi + 1) / 2)
            if starts[mid] <= pos then lo = mid else hi = mid - 1 end
        end
        return lo
    end
end

-- [[ Search ]]
local files = ListFiles()
if #files == 0 then Usage("no .lua or .xml files under " .. root) end

-- every hit spells the last segment, directly or in the alias it goes through
local needle = last ~= "addon" and "%f[%w_]" .. last .. "%f[^%w_]" or nil
local KIND_ORDER = { def = 1, ref = 2, xml = 3, ["self?"] = 4, ["def?"] = 5, ["call?"] = 6, ["dyn?"] = 7 }
local results, filesWithHits, xmlFiles = {}, {}, {}

for index, rel in ipairs(files) do
    if find(lower(rel), "%.xml$") then
        local xml = ReadFile(root .. "/" .. rel)
        if xml then
            xml = gsub(xml, "<!%-%-.-%-%->", Newlines)
            CollectTemplates(xml)
            xmlFiles[index] = xml
        end
    end
end

for index, rel in ipairs(files) do
    local isXml = xmlFiles[index] ~= nil
    local src = xmlFiles[index] or ReadFile(root .. "/" .. rel)
    if src and (not needle or find(src, needle)) and not (isXml and listMode) then
        local fileHits = {}
        local function Collect(text, Run)
            hits = {}
            Run()
            if #hits > 0 then
                local LineOf = LineMapper(text)
                for _, hit in ipairs(hits) do
                    hit.line = LineOf(hit.pos)
                    fileHits[#fileHits + 1] = hit
                end
            end
        end
        if isXml then
            Collect(src, function() ScanXmlTags(src) end)
            -- text between the tags is inline Lua (<OnLoad>...</OnLoad>, <Binding>...</Binding>)
            local text = gsub(gsub(src, "<[^>]*>", Newlines), "&(%a+);", ENTITIES)
            local code = StripLua(text)
            xmlPhase = true
            Collect(code, function() ScanLua(code) end)
            xmlPhase = false
        else
            local code = StripLua(src)
            Collect(code, function()
                local before = memberDefs
                local bound, rerun = ScanLua(code)
                if rerun then
                    -- a local was bound to a name after a use: scan again with the binding known
                    hits = {}
                    memberDefs = before
                    ScanLua(code, bound)
                end
                if memberMode then
                    -- CreateFrame("Button", "KrowiAF_Name", ...) creates the global KrowiAF_Name; the
                    -- name is in a string, so it is matched on the source where the code still says CreateFrame
                    for p, name in gmatch(src, "()CreateFrame%s*%(%s*[\"'][%w_]*[\"']%s*,%s*[\"']([%a_][%w_]*)[\"']") do
                        if name == query and sub(code, p, p + 10) == "CreateFrame" then Hit("def", p) end
                    end
                end
            end)
        end
        if #fileHits > 0 then
            -- one hit per line (per line and member with -list), the strongest kind wins
            local best, order = {}, {}
            for _, hit in ipairs(fileHits) do
                local key = listMode and hit.line .. ":" .. hit.extra or hit.line
                local seen = best[key]
                if not seen then
                    best[key] = hit
                    order[#order + 1] = key
                elseif KIND_ORDER[hit.kind] < KIND_ORDER[seen.kind] then
                    best[key] = hit
                end
            end
            local lines = {}
            local original = isXml and ReadFile(root .. "/" .. rel) or src
            for line in gmatch(original .. "\n", "([^\n]*)\n") do lines[#lines + 1] = line end
            for _, key in ipairs(order) do
                local hit = best[key]
                if not defsOnly or hit.kind == "def" or hit.kind == "def?" or (hit.kind == "self?" and hit.role == "def") then
                    local text = match(lines[hit.line] or "", "^%s*(.-)%s*$")
                    results[#results + 1] = { file = index, line = hit.line, kind = hit.kind, extra = hit.extra, text = text }
                    filesWithHits[index] = true
                end
            end
        end
    end
end

table.sort(results, function(a, b)
    if listMode and a.extra ~= b.extra then return lower(a.extra) < lower(b.extra) end
    if a.kind ~= b.kind then return KIND_ORDER[a.kind] < KIND_ORDER[b.kind] end
    if a.file ~= b.file then return a.file < b.file end
    return a.line < b.line
end)

local out = {}
for _, r in ipairs(results) do
    out[#out + 1] = files[r.file] .. ":" .. r.line .. ": " .. r.kind .. ": " .. r.text
end

-- [[ Summary ]]
local fileCount = 0
for _ in pairs(filesWithHits) do fileCount = fileCount + 1 end
local function Sorted(set)
    local list = {}
    for key in pairs(set) do list[#list + 1] = key end
    table.sort(list)
    return list
end
local elapsed = string.format("%d files searched in %.2f s", #files, os.clock() - started)
local summary
if listMode then
    local members = {}
    for _, r in ipairs(results) do members[r.extra] = true end
    local memberCount = #Sorted(members)
    local owners = Sorted(namespaces)
    summary = string.format("%s: %d member%s, %d definition%s in %d file%s", query, memberCount, memberCount == 1 and "" or "s",
        #results, #results == 1 and "" or "s", fileCount, fileCount == 1 and "" or "s")
    if not parent and #owners > 0 then summary = summary .. " (under " .. table.concat(owners, ", ") .. ")" end
else
    local counts = {}
    for kind in pairs(KIND_ORDER) do counts[kind] = 0 end
    for _, r in ipairs(results) do counts[r.kind] = counts[r.kind] + 1 end
    local parts = { counts.def .. " def" }
    if not defsOnly then
        parts[#parts + 1] = counts.ref .. " ref"
        parts[#parts + 1] = counts.xml .. " xml"
    end
    for _, kind in ipairs({ "self?", "def?", "call?", "dyn?" }) do
        if counts[kind] > 0 then parts[#parts + 1] = counts[kind] .. " " .. kind end
    end
    summary = string.format("%s: %s in %d file%s", query, table.concat(parts, ", "), fileCount, fileCount == 1 and "" or "s")
    if memberMode then
        local names = Sorted(resolvedNames)
        if #names > 0 then
            local shown = {}
            for i = 1, math.min(#names, 6) do shown[i] = names[i] end
            summary = summary .. "; resolved as " .. table.concat(shown, ", ") .. (#names > 6 and (", +" .. (#names - 6) .. " more") or "")
        end
    end
    if memberDefs > 0 then
        summary = summary .. string.format("; %d member definition%s under it not listed (-list)", memberDefs, memberDefs == 1 and "" or "s")
    end
end
out[#out + 1] = summary .. "; " .. elapsed
io.stdout:write(table.concat(out, "\n"), "\n")
os.exit(#results > 0 and 0 or 1)