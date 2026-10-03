# TBL_MEVENT_TYPE

| Property | Value |
|---|---|
| Table ID | 129 |
| Record count | 19 |
| JSON | `docs/database/game_data/TBL_MEVENT_TYPE.json` |
| Client constant | `GamePredef.TBL_MEVENT_TYPE = 129` |

## Purpose

Defines the 19 event-cell categories for the Bí Cảnh (Secret Treasure Hunt) board game. Each record classifies one type of board cell: its display name, the NPC sprite placed on it, the tooltip shown when a player hovers over it, and a numeric type code. The client uses this table to render event icons and tooltips on the board and to determine whether a cell has an interactive NPC.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key (1–19). Referenced by `TBL_MEVENT_MAP.meventId`. |
| `name` | string | Vietnamese display name of the cell type (e.g., `"Điểm đầu"` = Start Point, `"Bảo rương nhỏ"` = Small Treasure Chest, `"Ô đấu"` = Battle Cell). |
| `npcId` | int | Foreign key → [[TBL_NPC]] `id`. The NPC sprite placed on cells of this type. `0` for the three path-marker types (start, end, mid-point — ids 1–3) which have no NPC. Read by `SecretTreasureHuntPanel.as:1857` to check `npcId > 0` before spawning a tooltip NPC. |
| `tip` | string | Vietnamese tooltip text describing what happens when a player lands on this cell type. `"0"` (string sentinel) for the three path-marker types (ids 1–3). Full Vietnamese descriptions for all other types. |
| `type` | int | Numeric category code (1–17). Unique per record in this dump (ids 1–3 share `type` 1–3 one-to-one; id=8,9,10 all use `type=8`). Used by `SecretTreasureHuntPanel.as:1887` as the event resolution discriminator sent to the server (`_arg_2.type`). |

## Value distributions / sentinels

- `npcId`: `0`×3 (ids 1–3, path markers), non-zero for all 16 event cells (NPC ids 2335–2350).
- `tip`: `"0"`×3 (path-marker sentinel), unique descriptive strings for the 16 event types.
- `type`: values 1–17; `type=8` appears 3 times (ids 8, 9, 10 — three variants of "Ô Đại Thánh" monster cell), all others unique.

### Cell type catalogue

| id | name (VI) | type | npcId | Category |
|---|---|---|---|---|
| 1 | Điểm đầu | 1 | 0 | Start |
| 2 | Điểm cuối | 2 | 0 | End |
| 3 | Điểm giữa | 3 | 0 | Mid-path |
| 4 | Bảo rương nhỏ | 4 | 2343 | Small chest |
| 5 | Bảo rương trung | 5 | 2344 | Medium chest |
| 6 | Bảo rương lớn | 6 | 2345 | Large chest |
| 7 | Ô đấu | 7 | 2347 | PvP combat |
| 8–10 | Ô Đại Thánh (×3) | 8 | 2348–2350 | Monster cell |
| 11 | Chuyển trận | 9 | 2346 | Teleport trap |
| 12 | Ô bạc | 10 | 2335 | Silver reward |
| 13 | Minigame | 11 | 2336 | Mini-game |
| 14 | Ô Exp | 12 | 2337 | EXP reward |
| 15 | Ô lò xo | 13 | 2338 | Spring (return to start) |
| 16 | Bẫy 1 - Kẹp | 14 | 2339 | Trap: snare |
| 17 | Bẫy 1 - Bẫy | 15 | 2340 | Trap: pit |
| 18 | Bẫy 3 - Trói Cương Thi | 16 | 2341 | Trap: bind |
| 19 | Bẫy 4 - Bắt Alien | 17 | 2342 | Trap: alien capture |

## Client usage

- `SecretTreasureHuntPanel.as:1851,1855` — looks up `GameData.d[GamePredef.TBL_MEVENT_TYPE][meventId]` (or `nullGridMapData` override) to get the event type record; reads `npcId` (`1857`) to spawn the on-board NPC tooltip and reads `tip` (`1864`) for the cell hover tooltip text.

## Related tables

- `npcId` → [[TBL_NPC]] (the NPC sprite shown on each event cell).
- Referenced by [[TBL_MEVENT_MAP]] via `meventId` (board cell positions pointing to these event types).
