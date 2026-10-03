# TBL_MAP_CELL

| Property | Value |
|---|---|
| Table ID | 60 |
| Record count | 1787 |
| JSON | `docs/database/game_data/TBL_MAP_CELL.json` |
| Client constant | `GamePredef.TBL_MAP_CELL = 60` |

## Purpose

Defines individual tile cells on specific maps that carry collision or decoration data — each row marks a grid coordinate on a particular map along with a resource code identifying which decoration/obstacle SWF asset occupies that cell. The client builds a nested lookup `gameDataIndex[60][mid]` (indexed by `mid`) so all cells for a given map can be iterated at scene load time.

## Key reference

| Key | Type | Function |
|---|---|---|
| `id` | int | Primary key for the cell record. |
| `mid` | int | Foreign key → [[TBL_MAP]] `id`. Identifies which map this cell belongs to. Used as the secondary index key (`TBL_INDEX_ARRAY[TBL_MAP_CELL] = "mid"`, `GamePredef.as:8375`). |
| `posX` | int | Grid X coordinate of the cell on the map (tile units; client divides by 10 for display). Range in data: 0–19. `StageMain.as:554` reads this to build the hit-test grid. |
| `posY` | int | Grid Y coordinate of the cell on the map (tile units). Range in data: 0–39. |
| `resCode` | string | Asset resource code for the decoration/obstacle sprite placed at this cell. Passed into the hit-test builder: `StageMain.as:556` stores `resCode` as `_local_3[posX][posY]`. Only 5 unique values appear in the data, all following the `2040...` SWF asset naming scheme. |

## Value distributions / sentinels

- `mid`: 4 distinct values — `300`×1471 (dominant map, likely a major dungeon/instance), `439`×135, `437`×131, `1401109`×50.
- `resCode`: 5 unique values: `"2040050000001"`, `"2040060000003"`, `"2040060010001"`, `"2040060010002"`, `"2040060010003"`. All share the `204` prefix used for map-cell obstacle SWFs.
- `posX`: 0–19; `posY`: 0–39. Cells are sparse — not every coordinate on a map has a record; only blocked/decorated tiles are listed.

## Client usage

- `StageMain.as:548–556` (`buildTile` function) — iterates `gameDataIndex[GamePredef.TBL_MAP_CELL][mid]`, groups cells by `posX` then `posY`, stores `resCode` in a nested grid object, then calls `createHitTest` with that grid to place collision objects. This is the primary consumer; every map scene load calls this.
- `TBL_INDEX_ARRAY[TBL_MAP_CELL] = "mid"` (`GamePredef.as:8375`) — configures the secondary index so the client can retrieve all cells for a given map ID in one lookup.

## Related tables

- `mid` → [[TBL_MAP]] (parent map; every cell row belongs to one map record).
