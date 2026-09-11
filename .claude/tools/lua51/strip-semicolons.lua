-- strip-semicolons.lua <in> <out>
-- Removes trailing statement semicolons from a Lua 5.1 source file, byte for byte otherwise:
-- line endings, BOM-less encoding and the missing final newline are preserved.
--
-- A semicolon is "trailing" when only blanks, a line comment, or the end of file follow it on
-- its line. Semicolons inside strings, long strings and comments are never touched. A trailing
-- semicolon that separates fields inside a table constructor becomes a comma (a trailing comma
-- is valid there); one that terminates a statement is removed. Block keywords (function, do,
-- then, repeat / end, until) are tracked so a statement inside a function that lives inside a
-- table constructor is still recognised as a statement.
--
-- A trailing semicolon whose next token is an opening parenthesis is kept: removing it would
-- merge the two lines into a call (`f;\n(g)()` versus `f\n(g)()`).
--
-- Prints "<removed> <replaced> <kept>" and exits 0. The caller is expected to prove the edit
-- with `luac -s` on both files (Strip-Semicolons.ps1 does).

local inPath, outPath = ...
if not inPath or not outPath then
    io.stderr:write("usage: strip-semicolons.lua <in> <out>\n")
    os.exit(2)
end

local f = assert(io.open(inPath, "rb"))
local src = f:read("*a")
f:close()

local n = #src
local out = {}
local removed, replaced, kept = 0, 0, 0

-- context stack: "table" for an open constructor, "block" for an open block
local stack = {}
local function top() return stack[#stack] end

local opensBlock = { ["function"] = true, ["do"] = true, ["then"] = true, ["repeat"] = true }
local closesBlock = { ["end"] = true, ["until"] = true }

local i = 1
local function emit(s) out[#out + 1] = s end

-- returns index just past a long bracket "[==[" starting at p, and its level, or nil
local function longBracketOpen(p)
    if src:sub(p, p) ~= "[" then return nil end
    local q = p + 1
    while src:sub(q, q) == "=" do q = q + 1 end
    if src:sub(q, q) ~= "[" then return nil end
    return q + 1, q - p - 1
end

local function skipLongString(p, level)
    local close = "]" .. string.rep("=", level) .. "]"
    local s, e = src:find(close, p, true)
    return e and e + 1 or n + 1
end

while i <= n do
    local c = src:sub(i, i)
    if c == "-" and src:sub(i + 1, i + 1) == "-" then
        -- comment
        local afterBracket, level = longBracketOpen(i + 2)
        local stop
        if afterBracket then
            stop = skipLongString(afterBracket, level)
        else
            local nl = src:find("\n", i, true)
            stop = nl or n + 1
        end
        emit(src:sub(i, stop - 1))
        i = stop
    elseif c == '"' or c == "'" then
        local j = i + 1
        while j <= n do
            local d = src:sub(j, j)
            if d == "\\" then
                j = j + 2
            elseif d == c or d == "\n" then
                j = j + 1
                break
            else
                j = j + 1
            end
        end
        emit(src:sub(i, j - 1))
        i = j
    elseif c == "[" and longBracketOpen(i) then
        local afterBracket, level = longBracketOpen(i)
        local stop = skipLongString(afterBracket, level)
        emit(src:sub(i, stop - 1))
        i = stop
    elseif c:match("[%a_]") then
        local word = src:match("^[%w_]+", i)
        if opensBlock[word] then
            stack[#stack + 1] = "block"
        elseif closesBlock[word] then
            stack[#stack] = nil
        elseif word == "elseif" or word == "else" then
            -- close the branch that precedes; `elseif` reopens through its `then`, `else` reopens here
            stack[#stack] = nil
            if word == "else" then stack[#stack + 1] = "block" end
        end
        emit(word)
        i = i + #word
    elseif c:match("%d") then
        local num = src:match("^0[xX]%x+", i) or src:match("^[%d%.]+[eE][%+%-]?%d+", i) or src:match("^[%d%.]+", i)
        emit(num)
        i = i + #num
    elseif c == "{" then
        stack[#stack + 1] = "table"
        emit(c)
        i = i + 1
    elseif c == "}" then
        stack[#stack] = nil
        emit(c)
        i = i + 1
    elseif c == ";" then
        -- trailing if only blanks, then EOL / EOF / line comment follow
        local j = i + 1
        while src:sub(j, j) == " " or src:sub(j, j) == "\t" do j = j + 1 end
        local rest = src:sub(j, j + 1)
        local trailing = j > n or rest:sub(1, 1) == "\r" or rest:sub(1, 1) == "\n" or rest == "--"
        if trailing then
            -- look past blanks, newlines and comments for the next significant character
            local k = j
            while k <= n do
                local d = src:sub(k, k)
                if d == " " or d == "\t" or d == "\r" or d == "\n" then
                    k = k + 1
                elseif src:sub(k, k + 1) == "--" then
                    local afterBracket, level = longBracketOpen(k + 2)
                    if afterBracket then
                        k = skipLongString(afterBracket, level)
                    else
                        k = (src:find("\n", k, true) or n) + 1
                    end
                else
                    break
                end
            end
            local nextSignificant = src:sub(k, k)
            if nextSignificant == "(" then
                kept = kept + 1
                emit(c)
                i = i + 1
            elseif top() == "table" then
                replaced = replaced + 1
                emit(",")
                i = i + 1
            else
                removed = removed + 1
                if rest == "--" then
                    -- `x(); -- note` becomes `x() -- note`: one space between code and comment
                    if not out[#out]:match("[ \t]$") then emit(" ") end
                    i = j
                else
                    i = i + 1
                end
            end
        else
            emit(c)
            i = i + 1
        end
    else
        emit(c)
        i = i + 1
    end
end

local g = assert(io.open(outPath, "wb"))
g:write(table.concat(out))
g:close()
print(removed .. " " .. replaced .. " " .. kept)
