<#
.SYNOPSIS
    Finds where a namespaced name of the addon is defined and who reads or calls it, with
    file:line, resolving the local aliases each file declares (local gui = addon.Gui, chained
    aliases, `addon.Objects.Category = category`) instead of matching text.

.DESCRIPTION
    Runs lua51/find-symbol.lua with the vendored Lua 5.1.5 over the addon's own .lua and .xml files
    (Libs, docs, wiki, raw, _Packaging and every dot-folder are skipped; the file list is read from
    the file system, not from git). Comments and string contents never match.

    One line per hit, "<path>:<line>: <kind>: <source line>", grouped by kind and then a summary
    line with the counts. Kinds:
      def    an assignment or function definition of the name (also a constructor key of a table
             assigned to its parent, and CreateFrame(type, "Name") for a global frame name)
      ref    a read or call of the name or of a member under it, directly or through an alias
      xml    an XML attribute naming it (mixin=, function=, name=, and method= on an element that
             carries or inherits the mixin) or an inline script (<OnClick>, <Binding>) calling it
      self?  self.X or self:X() inside `function <owner>:Method()`, assuming self is the owner
      def?   a member with that name defined on a value that cannot be resolved (bare member only)
      call?  :Member( or .Member( on a value that cannot be resolved: a parameter, a local, a call
             result (bare member only)
      dyn?   parent[expr], a dynamic index on the name's parent that may reach it at run time
    Exit code 0 when something was printed, 1 when nothing was, 2 on a bad name.

.PARAMETER Name
    A full path (addon.Data.LoadOnPlayerLogin, addon.Objects.Category.New, KrowiAF.Ach,
    KrowiAF_AchievementPopoutMixin.OnLoad; a colon is read as a dot), or a bare member (GetMergedCategory)
    that takes every resolved name ending in it plus the unresolved call sites. A bare global
    (KrowiAF_ToggleAchievementFrame, a mixin, a frame name) is a bare member too.

.PARAMETER List
    Print every member defined directly under Name (addon.Gui -> everything assigned or defined on
    addon.Gui), sorted by member. With a bare name, every namespace ending in it.

.PARAMETER Defs
    Definitions only (def, def?, and self? assignments).

.EXAMPLE
    & ".claude\tools\Find-Symbol.ps1" addon.Gui.Search
    & ".claude\tools\Find-Symbol.ps1" GetMergedCategory
    & ".claude\tools\Find-Symbol.ps1" addon.Gui -List
    & ".claude\tools\Find-Symbol.ps1" KrowiAF.Ach -Defs
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory, Position = 0)][string]$Name,
    [switch]$List,
    [switch]$Defs
)

$ErrorActionPreference = 'Stop'
$root = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$lua = Join-Path $PSScriptRoot 'lua51\lua.exe'
$finder = Join-Path $PSScriptRoot 'lua51\find-symbol.lua'
foreach ($tool in $lua, $finder) {
    if (-not (Test-Path $tool)) { throw "missing tool: $tool" }
}

$arguments = @($root, $Name)
if ($List) { $arguments += '-list' }
if ($Defs) { $arguments += '-defs' }

# The finder prints source lines byte for byte (UTF-8); decode them as such, not in the OEM code page
$encoding = [Console]::OutputEncoding
try {
    [Console]::OutputEncoding = [Text.UTF8Encoding]::new($false)
    & $lua $finder @arguments
}
finally {
    [Console]::OutputEncoding = $encoding
}
exit $LASTEXITCODE