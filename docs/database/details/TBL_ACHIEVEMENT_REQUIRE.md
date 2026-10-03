# TBL_ACHIEVEMENT_REQUIRE

| Property | Value |
|---|---|
| Table ID | 75 |
| Record count | 739 |
| JSON | `docs/database/game_data/TBL_ACHIEVEMENT_REQUIRE.json` |
| Client constant | `GamePredef.TBL_ACHIEVEMENT_REQUIRE = 75` |

## Purpose

Defines the individual completion conditions that must be met for each achievement. One achievement may have multiple requirement rows. The client indexes this table by `aid` via `TBL_INDEX_ARRAY[75] = "aid"`, so `gameData[75][aid]` returns all requirements for a given achievement. Requirements drive the progress bars and check-mark rendering in the Achievement Panel.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key of this requirement row. |
| `aid` | int | Foreign key → `TBL_ACHIEVEMENT.id`. Groups requirements per achievement. Used as the primary index key (`TBL_INDEX_ARRAY[75]`). |
| `type` | int | Requirement type code — determines what game event or stat is tracked (e.g. kill count, quest completion, item obtain). Many distinct values (0–61 observed). `AchievementPanel.as:687` loads requirements by `aid`; `type=43` is the most frequent (74 rows). |
| `num` | int | Target count / threshold for this requirement (e.g. kill 100 monsters). `AchievementPanel.as:813/827` reads requirement `name` and server-supplied progress against this value. |
| `name` | string | Descriptive label for the requirement (often empty; filled by the server with a localized string at runtime). Used as an enum/progress key in `AchievementPanel.as:813/827`. |
| `showType` | int | Controls how this requirement is rendered in the UI: `0` = hidden (391 rows), `1` = enumeration (checkbox, 208 rows), `2` = progress bar (140 rows). Read by `AchievementPanel.as:802` via `gameDataIndex` lookup. |

## Value distributions / sentinels

- `showType`: `0`×391 (hidden), `1`×208 (enum/checkbox), `2`×140 (progress bar).
- `type`: 57 distinct values; most common are `43`×74, `6`×94, `0`×95, `2`×56, `4`×36, `5`×29.
- `num`: ranges from `0` to large integers depending on requirement type.

## Client usage

- `AchievementPanel.as:687` — loads all requirements for an achievement: `_core.data.gameData[GamePredef.TBL_ACHIEVEMENT_REQUIRE][_arg_2]`.
- `AchievementPanel.as:802` — secondary lookup via `gameDataIndex[TBL_ACHIEVEMENT_REQUIRE][id]` to get the specific requirement object.
- `AchievementPanel.as:813` — reads `name` field to build `enumNameList` (per-requirement completion flag map).
- `AchievementPanel.as:827` — reads `name` field to build `progressNameList` (per-requirement progress value map).
- `AchievementPanel.as:951/1718`, `AchievementComparePanel.as:1876` — encodes `aid` back into the achievement link: `LinkEncode.encode(TBL_ACHIEVEMENT, aid, ...)`.

## Related tables

- `aid` → [[TBL_ACHIEVEMENT]] (parent achievement record).
