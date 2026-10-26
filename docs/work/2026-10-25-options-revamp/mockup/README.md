# Mockup sources

The scripts behind the clickable mockups (https://claude.ai/artifact/R1E7YE4Bj7goEFh18PRsBH, private), kept as the start of stage 1's mapping table and of the help content's picture tool. Nothing here is loaded by the game or shipped.

| File | What it does |
|------|--------------|
| `dump-options.lua` | Loads the addon headless for one client with the kit's Lua 5.1 and walks every registered AceConfig table, plugin injections included, into a plain Lua tree. `lua.exe dump-options.lua <repo> <Retail\|Classic> <out.lua> <GlobalStrings enUS.js from the ketho.wow-api extension>` |
| `merge.lua` | Merges the Retail and Classic dumps into one JSON tree, marking Retail-only nodes. `lua.exe merge.lua retail.lua classic.lua options-tree.json` |
| `outline.lua` | Prints a compact outline of one dump. |
| `MockupSpec.ps1` | The feature layout: the 22 sections, which AceConfig nodes each holds (by name path, `#Header` slices, `@key` segments), the grids, the tab list, the event families, and the middle-ground and close-to-tutorial texts. The first draft of stage 1's mapping table. |
| `Build-MockupData.ps1` | Turns the tree and the spec into the mockup's data: real labels, descriptions, defaults and disabled rules, with the parents resolved. |
| `Convert-Tga.ps1` | Converts the tutorial's `.tga` pictures (raw and RLE, 24 and 32 bit) to `.png`, cropped to the size the tutorial shows. |
| `Crop-Pictures.ps1` | Cuts help pane pictures out of larger ones and gives them the old pictures' soft edge: the same alpha curve every old picture has over its outer 40 px, scaled to the crop. |
| `canvas/` | The mockup's canvas sources: the component (`Main.dc.html`, help pane logic, changed dots, Defaults, reload bar, landing), its stylesheet and the boards. The data is injected into `Main.dc.html` at its `/*DATA*/` marker. |