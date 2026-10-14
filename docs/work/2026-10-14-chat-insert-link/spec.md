# Spec: Paste-to-chat calls a deprecated global
Intent: [intent.md](intent.md). Status: accepted

## Requirements
1. No addon file reads `ChatEdit_InsertLink`: `Krowi_ClaudeKit\tools\Find-DeprecatedApi.ps1` reports no use outside `Libs/` for `-Branch live`, `classic` and `classic_titan`.
2. The paste-to-chat modifier inserts the achievement link into the open chat edit box exactly as before, on Retail and Mists Classic.

## Root cause
Not a failure yet; the mechanism that would cause one. `Gui/WindowFrames/AchievementButton/AchievementButtonMixin.lua:119` calls `ChatEdit_InsertLink(achievementLink)` and uses its boolean result. On every client the TOC lists, that global exists only as `ChatEdit_InsertLink = ChatFrameUtil.InsertLink;` in `Blizzard_DeprecatedChatInfo/Deprecated_ChatFrame.lua:43` (`wow-ui-source` `live` 12.1.5, `classic` 5.5.4 and `classic_titan` 3.80.2 alike), which loads only while the `loadDeprecationFallbacks` CVar is on. `ChatFrameUtil.InsertLink` itself is defined in `Blizzard_ChatFrameBase` on all three (`Mainline/ChatFrameUtilOverrides.lua:14` on live, `Classic/ChatFrameUtilOverrides.lua:1` on classic and titan).

Reproduction: `Find-DeprecatedApi.ps1` on `dev` at `6b13858c`: `AchievementButtonMixin.lua:119 ChatEdit_InsertLink deprecated -> ChatFrameUtil.InsertLink` for live, classic and classic_titan.

## Design
Call `ChatFrameUtil.InsertLink(achievementLink)` on line 119: the function the alias points to, with the same argument and the same boolean return, so the branch after it is unchanged.

## Options considered
1. **Call `ChatFrameUtil.InsertLink` directly (recommended, chosen).** All three clients have it, so no guard is needed.
2. **Guarded, `(ChatFrameUtil and ChatFrameUtil.InsertLink or ChatEdit_InsertLink)`**, as upstream AceGUI does for older clients. Every supported client has `ChatFrameUtil`, so the fallback would be dead code that still reads the deprecated name. Not chosen.

## Areas of concern
- Taint and secret values: none new. The call reaches the same Blizzard Lua function as before, from the same click handler; no frame, hook or protected action changes.
- Retail and Classic: checked in the `live`, `classic` and `classic_titan` sources (Root cause); Titan has no local install, so it is verified by source only.
- Plugins and skins: none; no frame changes.
- Saved variables and migrations: none.
- Localization: none.
- Data snapshots: none.
- Player-facing text: none; nothing changes for players, so no changelog line (the `changelog` rule's reminder is expected).

## Verification
- `Find-DeprecatedApi.ps1 -Branch live|classic|classic_titan`: the line 119 use before, `No uses found.` after.
- `Check-Repo.ps1 -ChangedOnly` clean apart from the changelog reminder.
- In game, Retail and Mists Classic: open the chat edit box, then click an achievement in the addon's window with the paste-to-chat modifier; the link appears in the edit box. `Read-GameErrors.ps1` shows nothing new after a second `/reload`.

## Decision
Option 1, chosen by Krowi (maintainer) on 2026-10-14 ("fix the other things you found", after being shown this finding). Accepting the spec also accepts the intent.