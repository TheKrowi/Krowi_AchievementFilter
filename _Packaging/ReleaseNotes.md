### Added
- 12.1.0 "The Curse of Ula'tek" patch data
    - Altar of Fangs dungeon: Normal, Heroic, Mythic, Keystone Hero and Keystone Victor
    - The Venomous Abyss raid: Normal, Heroic, Mythic, boss kills, Glory, Ahead of the Curve/Cutting Edge, Mythic: Ula'tek
    - Midnight Season 2 Mythic+ (Resilient Keystones, Keystone Hero/Victor for all 8 dungeons, Explorer/Conqueror/Master/Hero/Legend) and Delve tiers 4-11
    - Midnight Season 2 PvP ladder (Combatant through Gladiator/Legend/Strategist), Battle Mender, Hero of the Alliance/Horde, Weapons of Conquest, and season mount
    - The Coiled Isle zone: exploration, Curse Surges world event, Vaults of Atal'Utek, housing decor, and Souvenir Seeker achievements
    - Family Battler of Outland and Family Battler of Cataclysm pet battle achievements
    - A Round on the House in Midnight and Tricks and Treats of Midnight holiday achievements
    - Keystone Hero/Victor entries added to older dungeons rejoining the Season 2 rotation (Ruby Life Pools, Temple of Sethraliss, Kings' Rest)
- Pop Out: right-click an achievement to open it in its own standalone, movable and resizable window
    - Ctrl-click an achievement (rebindable) to pop it out directly, alongside the existing Paste to Chat/Toggle Tracking/Watch List/Exclude modifiers (Options -> General -> Key Binding -> Modifiers)
    - Snapping: drag a popped-out window close to another one to snap it into a stack below it; moving or resizing the top of a stack moves/resizes the whole stack, while moving or resizing any other window in it breaks it back out (hold Alt while dragging to bypass snapping)
    - Window position, size, and snap relationships can optionally persist across sessions
    - Remembers the position a window was last moved to, and opens the next window there when none are currently shown (Options -> Layout -> Pop Out -> Remember Last Position)
    - Auto-fade: windows can fade to a configurable opacity (and fade speed) when not moused over
    - Close and resize buttons can be set to auto-hide until moused over
    - Configurable default window width and snap distance
    - All Pop Out settings found under Options -> Layout -> Pop Out
- Reward Preview: 3D-model preview for mount, pet and housing decor rewards
    - An extra icon appears on achievements with a previewable reward (one icon per reward, for achievements granting multiple); click it, or use the right-click menu's Preview Reward option, to open the preview
    - Rotate and zoom the 3D model; pin the window to keep it open and move it around, or leave it unpinned to show on mouseover and close automatically when you move away
    - Options -> Layout -> Reward Preview: toggle the extra icon, toggle mouseover-to-show, invert the vertical rotation drag direction, and set the default window width/height

### Changed
- Support for WoW 12.1.0 PTR (dev note: the Achievements frame's header details strip — Back button, filter dropdown, search box — moved into `AchievementFrame.HeaderDetails.Filters`; the addon's filter button, search box, summary/achievements frames, and browsing history buttons now anchor to it, falling back to the old layout when it's absent)

### Fixed
- Filter dropdown and search box no longer error on the 12.1.0 layout
- Blizzard's search box no longer reappears after closing the addon's own search box
- Achievement button extra icons no longer show a stale tooltip from a previous achievement (e.g. leftover temporarily-obtainable text on a Warband icon)
- GW2_UI: no longer errors skinning the filter dropdown's backdrop on the 12.1.0 layout
- GW2_UI: no longer errors anchoring the browsing history buttons on the 12.1.0 layout

### Removed
- Achievement 62413, The Curse of Ula'tek, to be replaced by 62297

### Added (99.1)
- Reward Preview: several Midnight Season 2 achievements (mounts, pets, housing decor) now have reward data

### Changed (99.1)
- Pop Out: opening a new window while others are already open now stacks it onto the end of a snap chain instead of reopening it dead-center (Options -> Layout -> Pop Out -> Remember Last Position); prefers the chain most recently moved, otherwise any other currently open chain

### Fixed (99.1)
- They Burn, Burn, Burn marked unobtainable
- Pop Out: a window restored to a saved position could fail to reappear (and look like it silently didn't reopen) if that position fell off-screen, e.g. after changing resolution or UI scale