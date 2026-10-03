# TBL_GUIDE

| Property | Value |
|---|---|
| Table ID | 79 |
| Record count | 46 |
| JSON | `docs/database/game_data/TBL_GUIDE.json` |
| Client constant | `GamePredef.TBL_GUIDE = 79` |

## Purpose

Defines new-player tutorial steps (hướng dẫn tân thủ). Each row is a single guide step belonging to a tutorial sequence identified by `type`. The client indexes by `type` via `TBL_INDEX_ARRAY[79] = "type"`. `Core.as` drives the tutorial engine: it tracks the current step index per type in `lastIdxs[]`, advances steps when trigger conditions match (`scPid`, `scQname`, `scNpcid`, `finishType`), and calls `remote.call("saveGuideLog", null, stepId)` when a step completes. The prompt bubble (`promptText`) is shown via `GuidePanel.showGuide()` or an alert panel depending on `promptType`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of the guide step. Stored in `lastIdxs[type]` and passed to `saveGuideLog` RPC when the step completes (`Core.as:2148`). |
| `type` | int | Tutorial sequence ID. Primary index key; all steps with the same `type` form one tutorial chain. Values observed: `0` (34 steps), `2` (10 steps), `9`, `11`. |
| `level` | int | Minimum player level required to trigger this step (`Core.as:280` — `_local_4.level >= player.level`; `Core.as:2144` — `_local_7.level < player.level` skips). |
| `finishType` | int | Event type that marks this step as complete. `-1` = instant/auto-complete (42 rows). Non-negative values match against a trigger event type at `Core.as:696`. `Core.as:2150` — `finishType > 0` means the step is still pending completion. |
| `promptText` | string | Tutorial narration text (HTML-formatted; may contain `<font>` tags). Shown via `GuidePanel.showGuide(_local_7.promptText)` when `promptType == SHOW_GUIDE_TYPE_BUBBLE` (`Core.as:2157`). Note: most strings are in Chinese in this export (localisation artifact). |
| `promptType` | int | Display mode: `0` = `SHOW_GUIDE_TYPE_BUBBLE` (speech bubble via `GuidePanel`), `1` = `SHOW_GUIDE_TYPE_ALERT` (modal alert panel). `Core.as:2154`. 45 records use `0`, 1 uses `1`. |
| `reference` | int | ViewManager panel ID that must be visible for this step's arrow/overlay to appear. `GuidePanel.as:140/144/148/228/230` checks `_currentGuide.reference` against specific panel IDs and visibility state. `-1` = no panel requirement. |
| `scPid` | int | Scene/panel ID that triggered the step — matched against runtime trigger at `Core.as:696/767`. Used to identify which UI scene originated the guide event. |
| `scQname` | string | Quest name string matched in the trigger condition (`Core.as:696`: `_arg_2 == _local_8.scQname`). Empty string matches any. |
| `scNpcid` | int | NPC ID matched in the trigger condition (`Core.as:696`: `_arg_3 == _local_8.scNpcid`). `-1` = any NPC. |
| `scOtherId` | int | Secondary trigger ID matched in a separate trigger path (`Core.as:767`: `_arg_4 == _local_7.scOtherId`). Semantics depend on the trigger event type. |
| `findNpcId` | int | NPC ID that the guide arrow should point to on the minimap/scene. `(inferred from data — usage in GuidePanel/Core not found beyond storage)` |
| `mouseX` | int | X coordinate hint for the guide overlay arrow positioning (`GuidePanel.as:298`). `0` in most records. |
| `mouseY` | int | Y coordinate hint for the guide overlay arrow positioning (`GuidePanel.as:299`). `0` in most records. |

## Value distributions / sentinels

- `type`: `0`×34 (main tutorial chain), `2`×10, `9`×1, `11`×1.
- `finishType`: `-1`×42 (auto-complete), `0`×1, `2`×1, `9`×1.
- `promptType`: `0`×45 (bubble), `1`×1 (alert).

## Client usage

- `Core.as:277–293` — on login, iterates `TBL_GUIDE` to find steps for which `level >= player.level` and not yet completed; populates `lastIdxs[type]`.
- `Core.as:692–702` — step-completion trigger path 1: matches `scPid`, `scQname`, `scNpcid`, `finishType`.
- `Core.as:763–769` — step-completion trigger path 2: matches `scPid`, `scQname`, `scNpcid`, `scOtherId`; sets `currentType`.
- `Core.as:2143–2157` — advance engine: loads step by `lastIdxs[currentType]`, checks `level`, calls `saveGuideLog`, then shows prompt via `GuidePanel` or alert panel.
- `GuidePanel.as:140/144/148/228/230/297–318` — reads `reference` and `mouseX`/`mouseY` to position the overlay arrow.

## Related tables

- `findNpcId` → [[TBL_NPC]] (NPC the guide arrow points to).
- `scPid` — references ViewManager panel IDs (not a DB table).
- `reference` — references ViewManager panel IDs (not a DB table).
