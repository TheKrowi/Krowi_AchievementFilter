# Contributing to Krowi's Achievement Filter

For a full technical overview of the addon's architecture, load order, data patterns, and code conventions, see [`.github/copilot-instructions.md`](.github/copilot-instructions.md). This file covers the contributor workflow.

---

## Branching Strategy

| Branch | Purpose |
|--------|---------|
| `main` | Release-ready. Only merge completed, tested work here. |
| `dev` | Active development. All feature branches target this. |
| `feature/<description>` | Optional short-lived branches off `dev` for larger features. |

PRs go to `dev`. `dev` is merged to `main` at release time.

---

## Commit Convention

This project uses **Conventional Commits** with a custom `data:` type for the most common category of change (achievement/event/zone data additions).

### Commit Types

| Type | When to use |
|------|------------|
| `data:` | Achievement, event, zone, tooltip, transmog set, pet battle link, or build version data additions or updates |
| `feat:` | New user-facing features (filter, widget, option, tab, UI element) |
| `fix:` | Bug fixes |
| `locale:` | Localization string additions or changes |
| `chore:` | Maintenance: TOC version bump, lib updates, file cleanup, gitignore |
| `refactor:` | Code restructuring with no behavior change |
| `docs:` | Documentation-only changes (README, how-to guides, comments) |

### Optional Scopes

Add a parenthetical scope to clarify the affected area:

- **Client**: `(retail)`, `(classic)`, `(shared)`
- **Expansion**: `(midnight)`, `(warwithin)`, `(dragonflight)`, etc.

### Examples

```
data(midnight): add 12.0.1 achievements (47)
data(warwithin): add Nerub-ar Palace transmog set links
fix(retail): achievement mouseover error on mousing over linked achievements
fix(classic): sort order incorrect after filter change
feat(retail): add Summary category for recently-added achievements
locale(enUS): add strings for new event filter option
chore: bump interface version to 120001
refactor(gui): extract shared button setup into helper
docs: add how-to guide for adding patch achievements
```

Breaking changes (rare): append `!` after the type/scope, e.g. `feat!: remove legacy saved variable`.

---

## Development Setup

1. Clone the repo into your WoW addons folder (or create a symlink):
   ```
   <WoW Install>\Interface\AddOns\Krowi_AchievementFilter\
   ```
2. Open the folder in VS Code. The workspace is pre-configured with Lua diagnostics for WoW globals.
3. To reload the addon after changes: log in to WoW and run `/reload` in chat.
4. To test on the Classic client, point a symlink (or copy) into the Classic addons folder as well.

---

## How to Test

There is no automated test suite — the WoW client is the runtime.

- Enable Lua error reporting: run `/luaerror on` in WoW chat, or use an addon like [BugSack](https://www.curseforge.com/wow/addons/bugsack) + [BugGrabber](https://www.curseforge.com/wow/addons/bug-grabber).
- Test the specific feature or data that was changed by navigating to the relevant tab/category.
- If the change affects both Retail and Classic clients, test both.
- Check the `_Packaging/Changelog.md` and update it with your change.

---

## How to Contribute

1. Fork the repository.
2. Create a branch from `dev`: `git checkout -b feature/my-change dev`
3. Make your changes following the patterns in [`.github/copilot-instructions.md`](.github/copilot-instructions.md).
4. Add new Lua files to the appropriate `Files.xml` manifest.
5. Update `_Packaging/Changelog.md` with a brief description of your change.
6. Open a PR targeting `dev` and fill out the PR template.

---

## Localization Notes

- All new localization strings must be added to `Localization/enUS.lua` **above** the `AUTOGENTOKEN` comment marker.
- **Never edit the auto-generated section below `AUTOGENTOKEN`** — it is overwritten by the CurseForge platform.
- Other locale files (`deDE.lua`, `frFR.lua`, etc.) are managed through the CurseForge localization platform; do not manually add strings to them.
- For plugin-related strings: use `Localization/enUS.Plugins.lua`.
- For Wrath Classic-specific strings: use `Localization/enUS.WrathClassic.lua`.
- See [`docs/how-to/update-localization.md`](docs/how-to/update-localization.md) for the full guide.

---

## Golden Path Guides

Step-by-step guides for the most common task types live in [`docs/how-to/`](docs/how-to/):

| Guide | When to use |
|-------|------------|
| [`add-patch-achievements.md`](docs/how-to/add-patch-achievements.md) | Adding achievements from a new patch to an existing expansion |
| [`add-expansion.md`](docs/how-to/add-expansion.md) | Adding a brand new expansion's data folder |
| [`add-event.md`](docs/how-to/add-event.md) | Adding a new in-game world event with achievements |
| [`update-localization.md`](docs/how-to/update-localization.md) | Adding or changing localization strings |
