-- An Obtainable() "Version" anchor names a patch as Retail shipped it: Before {5, 4, 0} means "until Siege
-- of Orgrimmar opened". A re-release reaches that content at a patch of its own, and this table says which:
-- the Retail patch on the left, the patch where this client reached the same content on the right.
-- A Retail patch missing here is content this client has not reached yet, so an end anchor on it leaves the
-- achievement obtainable with no end scheduled, and a start anchor on it reads as future.
-- Every patch on the right stands for itself as well, for Classic-only data that anchors on it directly.
-- Retail has no such table: there an anchor is its own patch. See docs/data-design-review.md §5.1.
KrowiAF.ContentTimeline = {
    -- Wrath of the Lich King Classic
    ["3.0.2"] = "3.4.0", -- Wrath of the Lich King
    ["3.1.0"] = "3.4.1", -- Secrets of Ulduar
    ["3.2.0"] = "3.4.2", -- Call of the Crusade
    ["3.2.2"] = "3.4.2",
    ["3.3.0"] = "3.4.3", -- Fall of the Lich King
    ["3.3.3"] = "3.4.3",
    ["3.3.5"] = "3.4.3", -- Defense of the Ruby Sanctum

    -- Cataclysm Classic
    ["4.0.1"] = "4.4.0", -- Cataclysm
    ["4.0.3"] = "4.4.0",
    ["4.0.6"] = "4.4.0",
    ["4.1.0"] = "4.4.0", -- Rise of the Zandalari, opened inside 4.4.0 without a patch change
    ["4.2.0"] = "4.4.1", -- Rage of the Firelands
    ["4.2.2"] = "4.4.1",
    ["4.3.0"] = "4.4.2", -- Hour of Twilight
    ["4.3.2"] = "4.4.2",

    -- Mists of Pandaria Classic
    ["5.0.4"] = "5.5.0", -- Mists of Pandaria
    ["5.1.0"] = "5.5.1", -- Landfall
    ["5.2.0"] = "5.5.3", -- The Thunder King
    ["5.4.0"] = "5.5.4", -- Siege of Orgrimmar
}