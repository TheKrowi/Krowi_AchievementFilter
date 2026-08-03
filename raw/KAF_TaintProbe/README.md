# KAF Taint Probe

Diagnostic addon for [issue #300](https://github.com/TheKrowi/Krowi_AchievementFilter/issues/300)
(`LayoutFrame.lua:491: attempt to compare a secret number value`).

It does **not** change any behaviour and does **not** try to fix anything. It watches
Blizzard's shared tooltip state and records the exact moment it becomes tainted, which
addon tainted it, and what the player was doing at that instant.

## Why it exists

Every reported stack trace for #300 starts in *clean* code (Blizzard's own frames, or an
unrelated addon) with no KAF function on the stack. That means the taint is **persistent
state on a shared object**, not a KAF call path — it gets poisoned once, then every later
`GameTooltip:Hide()` fails until `/reload`.

Fix attempts so far have all targeted call paths, shipped blind, and been evaluated by
waiting for user reports weeks later. This addon replaces that loop with a direct answer.

## Safety

The probe is deliberately built so it cannot cause the bug it measures:

- no `hooksecurefunc`, no `HookScript`, no `SetScript` on Blizzard frames
- no writes into any Blizzard table
- only `issecurevariable()` polling (pure query) and an error handler that **chains** to the
  existing one, so BugSack / BugGrabber keep working normally

## Install

1. Copy the whole `KAF_TaintProbe` folder into:
   `World of Warcraft\_retail_\Interface\AddOns\`
2. Make sure it is enabled in the character select addon list.
3. **Do not change anything else.** Keep the exact same KAF version installed — if KAF
   changes, the result no longer describes the build users are running.

## Use

Log in and play normally. On login you'll see:

```
[KAF Taint Probe] armed. Watching shared tooltip state. Type /kaftp for status.
```

When the state gets poisoned, it prints a red `DETECTED` line naming the culprit and what
you were hovering. **If you see it: note what you just did, then `/reload` and send the file.**

| Command | Does |
|---|---|
| `/kaftp` | Show status: whether state is still clean, and the first detection |
| `/kaftp check` | Force an immediate sweep, then show status |
| `/kaftp reset` | Wipe stored data and take a fresh baseline |

Ideally also run `/console taintLog 2` once — that makes the game write
`World of Warcraft\_retail_\Logs\taint.log`, which independently confirms the finding.

## What to send back

After a session where it triggered (or a long session where it did **not**):

- `World of Warcraft\_retail_\WTF\Account\<ACCOUNT>\SavedVariables\KAF_TaintProbeDB.lua`
- `World of Warcraft\_retail_\Logs\taint.log` (only if `taintLog 2` was enabled)

## Reading the result

Inside `KAF_TaintProbeDB.lua`, per session:

| Field | Meaning |
|---|---|
| `baseline` | Already tainted at login. Expected to be non-empty and mostly harmless. |
| `detections` | **The payload.** Each entry: which field flipped, `taintedBy` = the addon, plus zone, mouse focus and a `recentFocus` trail of what was hovered in the seconds before. |
| `errors` | The actual `secret value` errors with full stacks, deduplicated with counts. |

The single most important line is the first `detections` entry with
`target = "GameTooltip"`, `key = "widgetContainer"`. `taintedBy` names the addon and
`recentFocus` names the action.

A session with **zero** detections but non-zero `errors` is also a real result — it means the
poisoned field is one not currently being watched, and the watch list needs widening.
