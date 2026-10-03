# TBL_AWAKENING_SKILL

| Property | Value |
|---|---|
| Table ID | 114 |
| Record count | 36 |
| JSON | `docs/database/game_data/TBL_AWAKENING_SKILL.json` |
| Client constant | `GamePredef.TBL_AWAKENING_SKILL = 114` |

## Purpose

Defines the passive awakening skills that characters can invest accumulated awakening skill-points into. Each row is a class-specific skill occupying one of six fixed panel positions; the client filters the full table by `reqClass` to show only the six skills relevant to the logged-in character's class. Players spend awakening points via RPC `"addAwakenPoint"` / `"reduceAwakenPoint"` to level each skill from 0 up to `maxLevel`.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Sent directly to the server in `_core.remote.call("addAwakenPoint", ..., _skillMeta.id)` and `"reduceAwakenPoint"` (`AwakenSkillBox.as:235/290`). |
| `name` | string | Vietnamese skill name, e.g., "Khai Sơn Chi Lực". Shown in the skill tooltip: `AwakenSkillBox.as:255`. |
| `description` | string | Effect description. At `maxLevel=1`, this is a single plain string (no pipe separator present in the data). Rendered in the tooltip via `AwakenSkillBox.as:252–268`. Supports `\n` line breaks and `<font color='...'>` HTML tags. |
| `iconCode` | int | Asset code passed to `ResManager.getIconUrl(iconCode)` to load the skill icon in the `AwakenSkillBox` slot (`AwakenSkillBox.as:195`). |
| `reqClass` | int | Character class ID required to see this skill: `1`–`6` (6 classes × 6 skills = 36 rows). Filtered by `_local_3.reqClass == _core.player.classId` in `AwakenPanel.as:881`. |
| `position` | int | Slot position in the awakening skill panel (1–6). Used to place the skill into the correct `skillBox0`–`skillBox5` component: `_local_1[_local_3.position] = _local_3` (`AwakenPanel.as:883`). |
| `maxLevel` | int | Maximum investable level for this skill. Always `1` in the current data (all 36 records). The client checks `_local_9 >= _local_3` before allowing further investment (`AwakenSkillBox.as:225`). |
| `costPoints` | int | Awakening skill-points consumed per level-up investment. Values: `1`×18 or `2`×18. Checked against `_core.player.awakenPoint` before sending the RPC (`AwakenSkillBox.as:212–216`). |
| `reqPoints` | int | Total awakening skill-points the player must have already spent (i.e., `awakenPointUsed`) before this skill can be leveled. `0`×33 (no prerequisite); `3`×3 (requires 3 previously spent points). Checked via `_core.player.awakenPointUsed < reqPoints` (`AwakenSkillBox.as:230`). |
| `skillCodeName` | string | Code identifier linking this awakening skill to the underlying skill definition, e.g., `"SKILL111001"`. May be a `|`-delimited list of code names for multi-variant skills. The first element (`split("|")[0]`) is used as the key into `_core.player.awakenPointDict` to look up the current invested level (`AwakenSkillBox.as:220–224/245–248`). |

## Value distributions / sentinels

- `reqClass`: `1`×6, `2`×6, `3`×6, `4`×6, `5`×6, `6`×6 — exactly 6 skills per class.
- `position`: `1`×6, `2`×6, `3`×6, `4`×6, `5`×6, `6`×6 — one skill per position per class.
- `maxLevel`: `1`×36 — uniform; all awakening skills cap at 1 point.
- `costPoints`: `1`×18, `2`×18 — evenly split.
- `reqPoints`: `0`×33, `3`×3.

## Client usage

- `AwakenPanel.as:878–884` — loads all rows via `GameData.d[GamePredef.TBL_AWAKENING_SKILL]`, filters by `reqClass`, and assigns each row to its `position` slot in the panel.
- `AwakenPanel.as:889–898` — iterates positions 1–6, calls `skillBox[i].updateView(skillRow)` or `cleanView()`.
- `AwakenSkillBox.as:195` — `updateView` reads `iconCode`.
- `AwakenSkillBox.as:212` — `addPointHandler` reads `costPoints`, `maxLevel`, `reqPoints`, `skillCodeName`, `id`.
- `AwakenSkillBox.as:235` — fires RPC `"addAwakenPoint"` with `_skillMeta.id`.
- `AwakenSkillBox.as:282/290` — `reducePointHandler` fires RPC `"reduceAwakenPoint"` with `_skillMeta.id`.
- `AwakenSkillBox.as:245–268` — `updateLevelAndTip` reads `skillCodeName`, `maxLevel`, `name`, `description`, `reqPoints`, `costPoints` to build the tooltip.
- `AwakenSkillBox.as:319–321` — `onAddAwakenPoint` callback updates `_core.player.awakenPoint`, `awakenPointUsed`, `awakenPointDict` from server response.

## Related tables

- `skillCodeName` references entries in [[TBL_SKILL]] (same code-name scheme used in `GameData.d[GamePredef.TBL_SKILL][codeName]`).
- `reqClass` aligns with character class IDs in [[TBL_CLASS]] or equivalent class-definition table.
- Awakening skill-point source: [[TBL_AWAKENING]] `points` field (milestone levels grant the points that fund investment here).
