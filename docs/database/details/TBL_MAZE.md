# TBL_MAZE

| Property | Value |
|---|---|
| Table ID | 99 |
| Record count | 15 |
| JSON | `docs/database/game_data/TBL_MAZE.json` |
| Client constant | `GamePredef.TBL_MAZE = 99` |

## Purpose

Defines the 15 event-cell types that can appear on the board of the Mê Trận (Labyrinth / Maze) mini-game. Each row describes one kind of board square: its Vietnamese display name, tooltip description, the probability weight for landing on it, and an optional server-side script executed when a player finishes the maze (row 15 only). The maze UI panels (`MazePanel`, `MazeEventInfoPanel`, etc.) are loaded at runtime, but TBL_MAZE itself is not directly read from the client-side `GameData.d` array — the server controls board layout and resolves events.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key / event-cell type identifier (1–15). |
| `name` | string | Vietnamese display name shown on the maze event card (e.g., `"Tâm Khiêu Ma Phương"` = "Heart Jump Devil Square"). |
| `description` | string | Vietnamese tooltip describing what the event does (e.g., `"Chuyển đến 1 vị trí ngẫu nhiêu trong phạm vi từ 1 - 2 ô"`). Empty for row 15 (final reward). |
| `min` | int | Minimum board-cell index at which this event type may appear. All 15 records share `min = 0` in this data, indicating the full board range is used. |
| `max` | int | Maximum board-cell index for placement. All records except id=15 have `max = 54` (a 54-cell board); id=15 has `max = 0` (terminal/final cell only). |
| `rate` | int | Relative probability weight controlling how frequently this event type appears on the board. Values range 0–200; `0` means id=15 is placed exactly once (terminal). Higher `rate` = more cells of this type. |
| `resultScript` | script | JavaScript/server-script string executed when the player completes the maze (id=15 only). All other records have an empty string. The script grants EXP or merit points, distributes final award items, checks daily activity progress, and broadcasts a system message. |

## Value distributions / sentinels

- `rate`: `0`×1 (id=15, final cell), `20`×1, `40`×3, `50`×5, `75`×2, `100`×1, `160`×1, `200`×1. Combat/boss events (ids 11–14) have higher rates (100–200), indicating they are more dangerous and common.
- `resultScript`: empty for 14 of 15 rows; only id=15 ("Phần Thưởng Cuối" / "Final Reward") contains a script body that calls server functions (`getCharactor`, `addChaExp`, `addCharExpRe`, `takePackageBySTWithBindedInit`, `checkDailyActProgress`, `systemMidMsgBroadcast`).
- `min`/`max`: `0`/`54` for all event rows; `0`/`0` for the terminal row. Suggests the board has cells indexed 0–54 (55 cells total).

## Client usage

No direct `GameData.d[GamePredef.TBL_MAZE]` field-level reads were found in the client `.as` files. The maze system uses multiple dedicated panels (`MazePanel`, `MazeInfoPanel`, `MazeEventInfoPanel`, `MazeShopPanel`, `MazeLotteryPanel`, `MazeQuestionPanel`, `MazePlayRulePanel`, `MazeDiscPanel`) registered in `PanelLayer.as` and `MainLayer.as`, but event resolution is server-driven. The `GamePredef.MAZE_PANEL = 27` constant is registered. TBL_MAZE is loaded into `GameData.d[99]` as part of the bulk data load but is treated as a server-side configuration table — the client receives maze state updates via callbacks rather than computing them from this table directly.

## Related tables

- No direct foreign keys in this table. The `resultScript` references `TBL_CHARACTOR` (player character) semantically via the `getCharactor(cid)` server-side call, but this is not a client-side FK.
