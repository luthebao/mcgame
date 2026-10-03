# TBL_DIARY

| Property | Value |
|---|---|
| Table ID | 85 |
| Record count | 44 |
| JSON | `docs/database/game_data/TBL_DIARY.json` |
| Client constant | `GamePredef.TBL_DIARY = 85` |

## Purpose

Defines daily activity (nhật ký hoạt động) tasks — a set of repeatable daily objectives that reward activity points (`act`). Each row is one daily task entry rendered in the Daily Activity Panel (`DailyActPanel`) and the Game Intro Panel (`GameIntroPanel`). The server tracks per-player progress and pushes updates via `updateDiaryData(id, val, act)` callback. Unlike most tables, this table has NO secondary index (`TBL_INDEX_ARRAY[85] = null`; same for INDEX_ARRAY2 and INDEX_ARRAY3) — it is iterated in full each time.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key. Used to look up the task name in `CallBack.as:10852`: `gameData[TBL_DIARY][_arg_1.id]`. |
| `name` | string | Vietnamese display name of the daily task. Shown as `"[name]"` in system messages (`CallBack.as:10853`). |
| `info` | string | Description of how to complete the task and what reward it gives (shown in the task list row). |
| `act` | int | Activity point reward for completing this task. `DailyActPanel.as:1748/1750` — total activity shown as `totalAct.text` when `act > 0`. Also `GameIntroPanel.as:7204–7206`. Values: 1, 2, 3, 4, 5, 10, 20, 30, 40, 45. |
| `max` | int | Maximum completion count per day (`DailyActPanel.as:1727/1729/1735`, `GameIntroPanel.as:7183–7191`). When `max > 0` displays as `"current/max"`. `-1` = unlimited. |
| `nid` | int | NPC or panel target ID for the task shortcut link. When `nid > 0`, a clickable link is generated based on `linkType` (`DailyActPanel.as:2704–2721`). |
| `linkType` | int | Governs what the `nid` shortcut link does: `1` = navigate to NPC (`"L_N|nid|name"`), `2` = open panel (`"L_OPEN_PANEL|nid"`), `3` = open map activity (`"L_MA|nid"`), `-1` = no link. Distribution: `-1`×4, `1`×21, `2`×17, `3`×2. |
| `pos` | int | Ordinal position / sort order of the task in the daily list. Each record has a unique value (0–43). |

## Value distributions / sentinels

- `act`: `1`×16, `5`×5, `20`×4, `45`×4, `30`×6, `40`×2, `2`×3, `3`×1, `4`×2, `10`×1.
- `linkType`: `-1`×4 (no link), `1`×21 (NPC link), `2`×17 (open panel), `3`×2 (map activity).
- `max`: all unique per task; `-1` for unlimited tasks.
- `pos`: sequential unique integers 0–43 (one per record).

## Client usage

- `CallBack.as:10846–10864` (`updateDiaryData`) — server push handler: looks up `gameData[TBL_DIARY][id].name` for system messages; forwards `(id, val, act)` to both `PANEL_GAMEINTRO` and `DAILY_ACTIVITY` panels.
- `DailyActPanel.as:1720–1750` — renders the daily task list: reads `max`, `act`; shows activity point totals.
- `DailyActPanel.as:2687–2721` — initialises task rows on panel open: reads `max`, `nid`, `linkType`, `info`, builds NPC/panel shortcut links.
- `DailyActPanel.as:2320–2333` — updates progress display for a specific task: reads `max`.
- `GameIntroPanel.as:7176/7183–7206` — alternative rendering path in the intro/overview panel; same `max`/`act` logic.
- `GameIntroPanel.as:9185/9192` — further list-population path.

## Related tables

- `nid` (when `linkType == 1`) → [[TBL_NPC]] (shortcut to NPC location).
- `nid` (when `linkType == 2`) — references a ViewManager panel ID.
- `nid` (when `linkType == 3`) — references a map activity ID.
