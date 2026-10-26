-- Prints a compact outline of a dump: lua.exe outline.lua retail.lua [maxDepth]
local path, maxDepth = ...
maxDepth = tonumber(maxDepth) or 99
local d = dofile(path)
local function short(s)
    s = tostring(s or ""):gsub("\n", " / ")
    if #s > 70 then s = s:sub(1, 67) .. "..." end
    return s
end
local function p(n, depth)
    if depth > maxDepth then return end
    local extra = {}
    if n.inline then extra[#extra + 1] = "inline" end
    if n.childGroups then extra[#extra + 1] = "cg=" .. n.childGroups end
    if n.hasCurrent then extra[#extra + 1] = "cur=" .. tostring(n.current) end
    if n.disabledSrc then extra[#extra + 1] = "dis:" .. short(n.disabledSrc) end
    if n.disabledStatic then extra[#extra + 1] = "disabled" end
    if n.hiddenNow ~= nil then extra[#extra + 1] = "hidden=" .. tostring(n.hiddenNow) end
    if n.min then extra[#extra + 1] = ("[%s..%s/%s]"):format(tostring(n.min), tostring(n.max), tostring(n.step)) end
    if n.values then extra[#extra + 1] = "values=" .. #n.values end
    if n.nameIsFunction or not n.nameKnown then extra[#extra + 1] = "COMPUTED" end
    print(("%s%s %s %q %s"):format(("  "):rep(depth), n.type or "?", n.key, short(n.name), table.concat(extra, " ")))
    for _, c in ipairs(n.children or {}) do p(c, depth + 1) end
end
for _, page in ipairs(d.pages) do
    print("=== " .. page.blizName .. " (" .. page.appName .. ")")
    p(page, 0)
end
print("plugins: " .. table.concat(d.pluginOrder, ", "))